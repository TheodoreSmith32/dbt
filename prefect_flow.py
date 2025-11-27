from prefect import flow, task
from prefect_shell import ShellOperation

DBT_DIR = "/home/theo/personal_portfolio/dbt/my_dbt_project/"

@task
def run_dbt(command: str):
    op = ShellOperation(
        commands=[command],
        working_dir=DBT_DIR
    )
    return op.run()

@flow
def dbt_run_flow():
    run_dbt("dbt deps")
    run_dbt("dbt debug")
    run_dbt("dbt run --select fact_rental_film.sql")

if __name__ == "__main__":
    dbt_run_flow()

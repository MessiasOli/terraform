<div>
  <h1>Terraform Pipeline: Azure &amp; AWS VM Deployment</h1>
  <h2>Introdução</h2>
  <p>Este repositório foi criado com o principal objetivo de testar e demonstrar uma pipeline que utiliza recursos do
    Terraform para provisionar máquinas virtuais (VMs) simultaneamente nas plataformas de cloud da Azure e AWS.</p>
  <h2>Sobre o Projeto</h2>
  <p>A integração contínua (CI) e a entrega contínua (CD) são fundamentais para agilizar os processos de desenvolvimento
    e implantação. Neste contexto, o Terraform surge como uma poderosa ferramenta de "Infraestrutura como Código",
    permitindo a criação, atualização e versionamento de infraestrutura de forma segura e eficiente.</p>
  <p>Neste repositório, a pipeline foi configurada para:</p>
  <ol>
    <li>Iniciar a execução assim que um novo commit for feito.</li>
    <li>Realizar a inicialização do Terraform.</li>
    <li>Aplicar os planos do Terraform para provisionar VMs:<ul>
        <li>Uma VM na Azure.</li>
        <li>Uma VM na AWS.</li>
      </ul>
    </li>
  </ol>
  <h2>Pré-requisitos</h2>
  <ul>
    <li>Conta na Azure com as devidas permissões para criar recursos.</li>
    <li>Conta na AWS com as devidas permissões para criar recursos.</li>
    <li>Terraform instalado e configurado.</li>
  </ul>
  <h2>Como usar</h2>
  <ol>
    <li>Clone este repositório.</li>
    <li>Configure suas credenciais da Azure e AWS (recomendo o uso de variáveis de ambiente ou secretos do GitLab para
      maior segurança).</li>
    <li>Faça as alterações necessárias nos arquivos de configuração do Terraform, se necessário.</li>
    <li>Commit e push suas alterações.</li>
    <li>A pipeline do GitLab será iniciada automaticamente, realizando o provisionamento das VMs.</li>
  </ol>
  <h2>Conclusão</h2>
  <p>Este projeto serve como uma demonstração de como o Terraform pode ser integrado a uma pipeline de CI/CD para
    automatizar o provisionamento de recursos em múltiplas plataformas de cloud. Feedbacks e contribuições são sempre
    bem-vindos!</p>
</div>
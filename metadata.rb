name             'devops_jenkins'

version          '0.17.0'

%w(apt git java jenkins ).each do |it|
  depends it
end

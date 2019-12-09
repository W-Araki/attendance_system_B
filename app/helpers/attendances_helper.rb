module AttendancesHelper
  
  def attendance_state(attendance)
    if Date.current == attendance.worked_on
      return '出勤' if attendance.started_at.nil?
      return '退勤' if attendance.started_at.present? && attendance.finished_at.nil?
    end
    false
  end
  
  def working_times(start, finish)
    format("%.2f", (((finish - start) / 60) / 60.0))
  end
  
  def attendances_invalid?
    attendances = true
    attendances_params.each do |id, item|
    if item[:started_at].blank? && item[:finished_at].blank?
      next #判定結果が成立するのであればこれ以降の処理をスキップ
    elsif item[:started_at].blank? || item[:finished_at].blank?
      attendances = false
      break # 判定結果が成立するのであれば実行
    end
  end
  return attendances
  end
end

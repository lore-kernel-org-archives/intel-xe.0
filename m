Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E98D9C44537
	for <intel-xe@archiver.kernel.org>; Tue, 21 Jul 2026 23:48:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8CBF10EBB1;
	Tue, 21 Jul 2026 23:48:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ihDaVy0o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A44210E2FB
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Jul 2026 23:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784677705; x=1816213705;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=x/R6oGVh2HRrEHU/qVRNuu6iGl3wHnk7GfYi41IgCpU=;
 b=ihDaVy0oWXdzqhT9xGhS3hLAsTF9PjZc7+kuTn8PTAxXk321cixe5GyJ
 UiVRF68rUkYhtZwZ2picZJHVhUM7CRAe7ReVrS65qSuYXPc4drXpbHagk
 6TATdqlK7n9XSAqjOQZTtPqMax2hq1lfiDRF7ZyCBwC973FjUK4TV5xjk
 gVMNPzBFRQIEsggox1jPcdYc55a0fk23e4L7ydpCTrtE6PTYrexTjpDvs
 uF7hERCApG8HnkD/CxpmgBacrABEssDpKHm8zMYWAecYDtgPpwD/f8NO8
 4eDQ8HAcnYpPaS0HKpyfhWBTUj9Ru+ZpJ7o1O9sEdxPb6dJIC7Kn6U7Rk g==;
X-CSE-ConnectionGUID: 5DsGLGEpQM66CM7QxRoz9Q==
X-CSE-MsgGUID: /FO9uVgbSm2plDkJ0ap20A==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="87832235"
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; d="scan'208";a="87832235"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 16:48:23 -0700
X-CSE-ConnectionGUID: pwX8opCIS3anp5zFrjgAkA==
X-CSE-MsgGUID: ojFYH8dzRMivJ0EZiq9tBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; d="scan'208";a="259882101"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 16:48:23 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH 2/3] drm/xe/xe_oa: Avoid checking and setting fields in the OA
 report
Date: Tue, 21 Jul 2026 16:48:20 -0700
Message-ID: <20260721234817.2473294-7-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260721234817.2473294-5-umesh.nerlige.ramappa@intel.com>
References: <20260721234817.2473294-5-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

OA unit updates the HW TAIL register to indicate that a new report is
available, although it does not guarantee that the report is visible in
memory. Also the currently running workload contributes to some latency
in seeing this report in memory. In the past we would set some fields in
the OA report and check if the fields are populated to non-zero values
by the HW, but this is no longer sufficient since some parts of the
report may land out of order under heavy workloads. Drop this WA and add
a new logic in subsequent patches to return updated reports to the user.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c | 73 ++------------------------------------
 1 file changed, 2 insertions(+), 71 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 5afccda6abcd..c5c4c4186e58 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -213,38 +213,10 @@ static u32 xe_oa_hw_tail_read(struct xe_oa_stream *stream)
 #define oa_report_header_64bit(__s) \
 	((__s)->oa_buffer.format->header == HDR_64_BIT)
 
-static u64 oa_report_id(struct xe_oa_stream *stream, void *report)
-{
-	return oa_report_header_64bit(stream) ? *(u64 *)report : *(u32 *)report;
-}
-
-static void oa_report_id_clear(struct xe_oa_stream *stream, u32 *report)
-{
-	if (oa_report_header_64bit(stream))
-		*(u64 *)report = 0;
-	else
-		*report = 0;
-}
-
-static u64 oa_timestamp(struct xe_oa_stream *stream, void *report)
-{
-	return oa_report_header_64bit(stream) ?
-		*((u64 *)report + 1) :
-		*((u32 *)report + 1);
-}
-
-static void oa_timestamp_clear(struct xe_oa_stream *stream, u32 *report)
-{
-	if (oa_report_header_64bit(stream))
-		*(u64 *)&report[2] = 0;
-	else
-		report[1] = 0;
-}
-
 static bool xe_oa_buffer_check_unlocked(struct xe_oa_stream *stream)
 {
 	u32 gtt_offset = xe_bo_ggtt_addr(stream->oa_buffer.bo);
-	u32 tail, hw_tail, partial_report_size, available;
+	u32 hw_tail, partial_report_size, available;
 	int report_size = stream->oa_buffer.format->size;
 	unsigned long flags;
 
@@ -264,31 +236,7 @@ static bool xe_oa_buffer_check_unlocked(struct xe_oa_stream *stream)
 	/* Subtract partial amount off the tail */
 	hw_tail = xe_oa_circ_diff(stream, hw_tail, partial_report_size);
 
-	tail = hw_tail;
-
-	/*
-	 * Walk the stream backward until we find a report with report id and timestamp
-	 * not 0. We can't tell whether a report has fully landed in memory before the
-	 * report id and timestamp of the following report have landed.
-	 *
-	 * This is assuming that the writes of the OA unit land in memory in the order
-	 * they were written.  If not : (╯°□°）╯︵ ┻━┻
-	 */
-	while (xe_oa_circ_diff(stream, tail, stream->oa_buffer.tail) >= report_size) {
-		void *report = stream->oa_buffer.vaddr + tail;
-
-		if (oa_report_id(stream, report) || oa_timestamp(stream, report))
-			break;
-
-		tail = xe_oa_circ_diff(stream, tail, report_size);
-	}
-
-	if (xe_oa_circ_diff(stream, hw_tail, tail) > report_size)
-		drm_dbg(&stream->oa->xe->drm,
-			"unlanded report(s) head=0x%x tail=0x%x hw_tail=0x%x\n",
-			stream->oa_buffer.head, tail, hw_tail);
-
-	stream->oa_buffer.tail = tail;
+	stream->oa_buffer.tail = hw_tail;
 
 	available = xe_oa_circ_diff(stream, stream->oa_buffer.tail, stream->oa_buffer.head);
 	stream->pollin = available >= stream->wait_num_reports * report_size;
@@ -369,23 +317,6 @@ static int xe_oa_append_reports(struct xe_oa_stream *stream, char __user *buf,
 		ret = xe_oa_append_report(stream, buf, count, offset, report);
 		if (ret)
 			break;
-
-		if (!(stream->oa_buffer.circ_size % report_size)) {
-			/* Clear out report id and timestamp to detect unlanded reports */
-			oa_report_id_clear(stream, (void *)report);
-			oa_timestamp_clear(stream, (void *)report);
-		} else {
-			u8 *oa_buf_end = stream->oa_buffer.vaddr + stream->oa_buffer.circ_size;
-			u32 part = oa_buf_end - report;
-
-			/* Zero out the entire report */
-			if (report_size <= part) {
-				memset(report, 0, report_size);
-			} else {
-				memset(report, 0, part);
-				memset(oa_buf_base, 0, report_size - part);
-			}
-		}
 	}
 
 	if (start_offset != *offset) {
-- 
2.51.0


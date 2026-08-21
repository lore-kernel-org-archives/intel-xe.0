Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73733C5DF97
	for <intel-xe@archiver.kernel.org>; Fri, 21 Aug 2026 22:23:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 965E410F3D6;
	Fri, 21 Aug 2026 22:23:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z+0Ei63b";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A2C410E283
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Aug 2026 22:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787351025; x=1818887025;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=xeXjw0s0LLgqB2VAy58CxungCuPduinknsiviMMKUIA=;
 b=Z+0Ei63bt/drU3ocdfgkH5PhIwlSq/RTy+ytNYp6LhrZP+8iUuMicV7S
 tX4TLo3QuGxcTflV0In2Cyia5hOApP++OZJAs3uH3AvFC3aD82XNb2ekb
 zSC522A8taLJY6SCqG1YiuBZRBrLf5co58zj2YusEi74Ewfcy4XPNjmt0
 eVQR/npXvx1/sSRhaDSzBkVdWf2eYnF60UW6xDMkeREzaqreCKBH0WL6V
 YQuBzd6WLjdQqdDCdvRDE6OTxe2f8iMwaU2d3wsoaCI6oFzSEgCY36nLO
 kLbmHNi4hIY+iG+U7KguhnvgyUXGuse5mo23TJBLucEbeUW2l5E7jQI/y w==;
X-CSE-ConnectionGUID: 1yr91GvtR0yhORWNmrHUcA==
X-CSE-MsgGUID: fzzz8aG+TUOza0ry60QEtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11882"; a="90420770"
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; d="scan'208";a="90420770"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2026 15:23:45 -0700
X-CSE-ConnectionGUID: 6DWt7jtbTlip+7HLuyqB2g==
X-CSE-MsgGUID: 85QhVrq7StCyapoQt45YbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; d="scan'208";a="263198176"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2026 15:23:45 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH 3/3] drm/xe/xe_oa: Add a lag to the reports that is exported
 to user
Date: Fri, 21 Aug 2026 15:23:42 -0700
Message-ID: <20260821222338.1053887-8-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260821222338.1053887-5-umesh.nerlige.ramappa@intel.com>
References: <20260821222338.1053887-5-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
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

When running heavy workloads, reading the OA reports too soon does not
guarantee that the report has landed in memory. To make sure correct
reports are copied to user buffer, only return reports that lag the
current HW_TAIL register by 32 reports. This is an empirical number
based on a heavy render workload and several test iterations.

The reports that user reads will always lag the HW tail by 32 reports,
however since OA is used for post processing analysis, this should not
affect any current use cases. When the stream is closed or disabled, we
let the user read the remaining reports up until HW tail.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
v2: Fix the LAG logic by using sliding window (Sashiko)
v3: Fix checkpatch warning
v4: Update sw tail on stream disable (Ashutosh)
v5: Ensure read is not blocked forever (Sashiko)
---
 drivers/gpu/drm/xe/xe_oa.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index d7647f37ab02..c8f2d7de1396 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -224,7 +224,7 @@ static bool mert_wa_14026633728(struct xe_oa_stream *s)
 static bool xe_oa_buffer_check_unlocked(struct xe_oa_stream *stream)
 {
 	u32 gtt_offset = xe_bo_ggtt_addr(stream->oa_buffer.bo);
-	u32 hw_tail, partial_report_size, available;
+	u32 hw_tail, partial_report_size, available, lag;
 	int report_size = stream->oa_buffer.format->size;
 	unsigned long flags;
 
@@ -234,17 +234,23 @@ static bool xe_oa_buffer_check_unlocked(struct xe_oa_stream *stream)
 	hw_tail -= gtt_offset;
 
 	/*
-	 * The tail pointer increases in 64 byte (cacheline size), not in report_size
+	 * The hw_tail pointer increases in 64 byte (cacheline size), not in report_size
 	 * increments. Also report size may not be a power of 2. Compute potential
 	 * partially landed report in OA buffer.
 	 */
 	partial_report_size = xe_oa_circ_diff(stream, hw_tail, stream->oa_buffer.tail);
 	partial_report_size %= report_size;
 
-	/* Subtract partial amount off the tail */
+	/* Subtract partial amount off the hw_tail */
 	hw_tail = xe_oa_circ_diff(stream, hw_tail, partial_report_size);
 
-	stream->oa_buffer.tail = hw_tail;
+#define LAG_REPORTS 32
+	lag = xe_oa_circ_diff(stream, hw_tail, stream->oa_buffer.tail);
+	if (!stream->enabled)
+		stream->oa_buffer.tail = hw_tail;
+	else if (lag > LAG_REPORTS * report_size)
+		stream->oa_buffer.tail = xe_oa_circ_diff(stream, hw_tail,
+							 LAG_REPORTS * report_size);
 
 	available = xe_oa_circ_diff(stream, stream->oa_buffer.tail, stream->oa_buffer.head);
 	stream->pollin = available >= stream->wait_num_reports * report_size;
@@ -1416,10 +1422,6 @@ static void xe_oa_stream_disable(struct xe_oa_stream *stream)
 
 	if (stream->sample)
 		hrtimer_cancel(&stream->poll_check_timer);
-
-	/* Update stream->oa_buffer.tail to allow any final reports to be read */
-	if (xe_oa_buffer_check_unlocked(stream))
-		wake_up(&stream->poll_wq);
 }
 
 static int xe_oa_enable_preempt_timeslice(struct xe_oa_stream *stream)
@@ -1490,6 +1492,11 @@ static int xe_oa_disable_locked(struct xe_oa_stream *stream)
 		ret = xe_oa_enable_preempt_timeslice(stream);
 
 	stream->enabled = false;
+
+	/* Update stream->oa_buffer.tail to allow any final reports to be read */
+	if (xe_oa_buffer_check_unlocked(stream))
+		wake_up(&stream->poll_wq);
+
 	return ret;
 }
 
-- 
2.51.0


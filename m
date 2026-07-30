Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DA43C55165
	for <intel-xe@archiver.kernel.org>; Thu, 30 Jul 2026 23:35:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3178610F0EE;
	Thu, 30 Jul 2026 23:35:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mXJKF4Ye";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FCB610F0F3
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Jul 2026 23:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785454553; x=1816990553;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=1/xnPBQfYZlpRr7CsjTxN847zEXpk3HXn4zTIlbHJ1U=;
 b=mXJKF4YeOOGNvDw64AwBlIKzINQLtiYSDtZHB4vJ1qB/OIXM2mk5oeEf
 tbPjDMxmaWlPctDoT7a/sJOy4UpeWPmlVuUUFNZQ76G1PKkuUHdVrMqYp
 5UEuezKWYoqINI1I+hg3LqsGiZgPz4vqTzPP/nzofxpBJIFjUb6xd3LEC
 6bqrnWs2YX3qnyKVog1tC/ARBVDCmJP5DAQeqP6plzN0GOEUgwM4NTPol
 OYZpeZdsNzGdxIp2CnfKmWo6dx1UWNS2KbKmCNiPgCPqr48d1tBMfqBxD
 iJO4pz9eRQ28XnnnyZvR3dUam04bWqzPoW+LRFu6ua3lOxqUqkGiVTttW w==;
X-CSE-ConnectionGUID: +9WTQUZoQQiB/gvy88lRRQ==
X-CSE-MsgGUID: J1YDmG9+RWW3rADaCcQb4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="103619705"
X-IronPort-AV: E=Sophos;i="6.25,195,1779174000"; d="scan'208";a="103619705"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 16:35:53 -0700
X-CSE-ConnectionGUID: Ombw1wo/RnqfVdvkWwGd1g==
X-CSE-MsgGUID: 1YK2E19yQMyWHc4WGmo+cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,195,1779174000"; d="scan'208";a="257759662"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 16:35:53 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH 3/3] drm/xe/xe_oa: Add a lag to the reports that is exported
 to user
Date: Thu, 30 Jul 2026 16:35:43 -0700
Message-ID: <20260730233539.3140839-8-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260730233539.3140839-5-umesh.nerlige.ramappa@intel.com>
References: <20260730233539.3140839-5-umesh.nerlige.ramappa@intel.com>
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

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
v2: Fix the LAG logic by using sliding window (Sashiko)
---
 drivers/gpu/drm/xe/xe_oa.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index c7f9c3955cb5..731b56684439 100644
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
 
@@ -234,17 +234,20 @@ static bool xe_oa_buffer_check_unlocked(struct xe_oa_stream *stream)
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
+	if (lag > LAG_REPORTS * report_size)
+		stream->oa_buffer.tail = xe_oa_circ_diff(stream, hw_tail, LAG_REPORTS * report_size);
 
 	available = xe_oa_circ_diff(stream, stream->oa_buffer.tail, stream->oa_buffer.head);
 	stream->pollin = available >= stream->wait_num_reports * report_size;
-- 
2.51.0


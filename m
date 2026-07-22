Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91731C4453A
	for <intel-xe@archiver.kernel.org>; Wed, 22 Jul 2026 21:54:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 449A210EEAE;
	Wed, 22 Jul 2026 21:54:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B/7cYpsf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30EE210E4F8
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Jul 2026 21:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784757250; x=1816293250;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=CUneno4o1pQutpj9etIzkTrUkJ+MkyTH5e7kTLdd0zg=;
 b=B/7cYpsfWt3As+uxy0FNuKMMwRmxfKoyvP7/7QrJDeOhpXLpuEcHZ9zA
 hyN6T50Ze7GhSqhNObbq3XXaF1vni/s+2Ccraj9qJjkbr8CfiRMcHR7QU
 NTydEaEBnuPsRB+0DcJ1NgY9VUQ8ZmPZ6OpgPbKrTrkqn2itZfzALjKDH
 z7S8ELQky6pUajsK6Mbk67kKE4h1OJ1lq3F9vkKs7Mb1yqGwI13vmevYP
 kgcZ+cmNWnejxNJWpSwZTgzV7nsURg0cXox3UqfcHSabI9feHjkXyPhoY
 ic3070jIXQ0amugOTWunmnszhgQddZ311g5VKa8rba7Kq2QpVNh7gm/kS Q==;
X-CSE-ConnectionGUID: HE2efm+oQqOaem2l2zcTZw==
X-CSE-MsgGUID: u432K/z8RV2niiWamxVqww==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="102950635"
X-IronPort-AV: E=Sophos;i="6.25,179,1779174000"; d="scan'208";a="102950635"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2026 14:54:10 -0700
X-CSE-ConnectionGUID: EhHbEqXoS2+r6aIhVBFyLQ==
X-CSE-MsgGUID: OPkFgDLTThSkpzbHpI5LmA==
X-ExtLoop1: 1
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2026 14:54:10 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH 3/3] drm/xe/xe_oa: Add a lag to the reports that is exported
 to user
Date: Wed, 22 Jul 2026 14:54:07 -0700
Message-ID: <20260722215403.2668958-8-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260722215403.2668958-5-umesh.nerlige.ramappa@intel.com>
References: <20260722215403.2668958-5-umesh.nerlige.ramappa@intel.com>
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
 drivers/gpu/drm/xe/xe_oa.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index c7f9c3955cb5..87cbd15eb7a2 100644
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
+	if (lag >= LAG_REPORTS * report_size)
+		stream->oa_buffer.tail = hw_tail;
 
 	available = xe_oa_circ_diff(stream, stream->oa_buffer.tail, stream->oa_buffer.head);
 	stream->pollin = available >= stream->wait_num_reports * report_size;
-- 
2.51.0


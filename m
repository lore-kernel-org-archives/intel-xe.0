Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6843BC4452D
	for <intel-xe@archiver.kernel.org>; Tue, 21 Jul 2026 23:48:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D4B810E385;
	Tue, 21 Jul 2026 23:48:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CvoCz5AR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 471D610E385
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Jul 2026 23:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784677705; x=1816213705;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=OdwG5BoN6VpoLbha7vhQ9wVdY+3d1JHUroo1WkIBbMI=;
 b=CvoCz5ARG5zjne8Mm9mseGOqlBr6WiC3SWUYSX2+Bm1/mH9vgaFoqdBS
 m8ICbRiYK1o1oEUKgwVMQIb2FA98ZQiQp47OIs/b9+6B9bLJnRqvfBgTF
 ByRLLb5JFXb7Kq8AEcS1/nmJeWpMocVPzIBeMM14n3nPmpS+X1JjIHv53
 9WHLgl6MgkZ9ureCdLt7h9FM3MWH0FhtaH2kuJ7csOSY6+8i+59EXe1Sq
 K7fARD0MvwKxM2Xx7/BHWOzdhMWYFmuhS7nxdcCjS/lSqBiaXPdF2MU3e
 S28AphNBF88WKTme9J7Hx1Pg5b1mbJud0+rC1l1EOqWltGfZre+FtRiwy g==;
X-CSE-ConnectionGUID: f+KUJz1GRW61WWPFep3iqQ==
X-CSE-MsgGUID: q7y+XIdpTAWiW8OJpLHKCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="87832236"
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; d="scan'208";a="87832236"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 16:48:23 -0700
X-CSE-ConnectionGUID: SANnwa8tTNe9SgS4sSjU0g==
X-CSE-MsgGUID: 5zpHw9uzRnmlWWw2EsVqSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; d="scan'208";a="259882103"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 16:48:23 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH 3/3] drm/xe/xe_oa: Add a lag to the reports that is exported
 to user
Date: Tue, 21 Jul 2026 16:48:21 -0700
Message-ID: <20260721234817.2473294-8-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260721234817.2473294-5-umesh.nerlige.ramappa@intel.com>
References: <20260721234817.2473294-5-umesh.nerlige.ramappa@intel.com>
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
index c5c4c4186e58..62eae544714a 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -216,7 +216,7 @@ static u32 xe_oa_hw_tail_read(struct xe_oa_stream *stream)
 static bool xe_oa_buffer_check_unlocked(struct xe_oa_stream *stream)
 {
 	u32 gtt_offset = xe_bo_ggtt_addr(stream->oa_buffer.bo);
-	u32 hw_tail, partial_report_size, available;
+	u32 hw_tail, partial_report_size, available, lag;
 	int report_size = stream->oa_buffer.format->size;
 	unsigned long flags;
 
@@ -226,17 +226,20 @@ static bool xe_oa_buffer_check_unlocked(struct xe_oa_stream *stream)
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


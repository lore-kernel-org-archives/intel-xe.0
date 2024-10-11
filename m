Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 896CFD2446C
	for <intel-xe@archiver.kernel.org>; Fri, 11 Oct 2024 03:56:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3351910EA2D;
	Fri, 11 Oct 2024 03:56:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FVqblGrD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C966210EA2D
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Oct 2024 03:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728619005; x=1760155005;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=icioaxA2yuFAKxkvIs9CeQog9KHLDFD3ixiG7z8VhjY=;
 b=FVqblGrDPOxRt9qJcNvoZaAFRwUgUOd+GXTJOKvJLS43Uh/hBnSBN14P
 F1pVhOFadRMCnlMcLnms5JWf0M+2FFq9jmCgOgE1LSdFYPnDI92jJF+XZ
 a+fuDF0Q4ekSmNqZin9rNfm4S3gAPQfoBXbBwbkyh0o3eJtkEj353gKsv
 eTartYOm5o7wJGUp9uczNd12XvtQxxEHQea55pfg6L+hTuQXyIPCDuhze
 +kQSa+pWpxZwAuMsK0hKTd4Lq/8ThMmZDOCEPtahUbMglCewztzYL1o9w
 uDI9Hma9YGDhnziE5z+k0sj97/MRbsib+5but/B6caqSHVY9we4hstgOQ A==;
X-CSE-ConnectionGUID: bHa15W0CTQie+RqaBwbvcw==
X-CSE-MsgGUID: RqJAo/5YS4ygNYACIG4RTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11221"; a="53411512"
X-IronPort-AV: E=Sophos;i="6.11,194,1725346800"; d="scan'208";a="53411512"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2024 20:56:44 -0700
X-CSE-ConnectionGUID: qwpNIrIqTC2bQpae0wAY5A==
X-CSE-MsgGUID: HVbQ3en/RIuP5jpoXQPsWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,194,1725346800"; d="scan'208";a="100122311"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2024 20:56:44 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Szymon Morek <szymon.morek@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v2 1/3] drm/xe/query: Increase timestamp width
Date: Thu, 10 Oct 2024 20:56:16 -0700
Message-ID: <20241011035618.1057602-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.46.2
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

Starting with Xe2 the timestamp is a full 64 bit counter, contrary to
the 36 bit that was available before. Although 36 should be sufficient
for any reasonable delta calculation (for Xe2, of about 30min), it's
surprising to userspace to get something truncated. Also if the
timestamp being compared to is coming from the GPU and the application
is not careful enough to apply the width there, a delta calculation
would be wrong.

Extend it to full 64-bits starting with Xe2.

v2: Expand width=64 to media gt, as it's just a wrong tagging in the
spec - empirical tests show it goes beyond 36 bits and match the engines
for the main gt

Bspec: 60411
Cc: Szymon Morek <szymon.morek@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_query.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 158629971eab3..07093af0b32e3 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -164,7 +164,11 @@ query_engine_cycles(struct xe_device *xe,
 			  cpu_clock);
 
 	xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
-	resp.width = 36;
+
+	if (GRAPHICS_VER(xe) >= 20)
+		resp.width = 64;
+	else
+		resp.width = 36;
 
 	/* Only write to the output fields of user query */
 	if (put_user(resp.cpu_timestamp, &query_ptr->cpu_timestamp))
-- 
2.46.2


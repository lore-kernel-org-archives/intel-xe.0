Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B71AF606A31C
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 09:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=E1oM0Fai
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 663971121AD;
	Thu, 26 Nov 2026 09:15:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AC161121AD
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Nov 2026 09:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795684522; x=1827220522;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cJpdA52PUC0KAo6doZoWeoybQS5T52nl3aODs0y/imw=;
 b=E1oM0FaiZGcXThVOcBF8dhfVlLbgH7khNkclZDd640QtaSX3+Lrg0MrU
 OJ92p8eMKo1MAgNP2QGxld+aVLVBIL1LJymzP1ZB3qnIHUDzSU/LqaUQ6
 h4jl77kZqtitDEBvYEoMFLO4Cn2fzsHlZMzhFsuyBVrekVN823kB9wxi3
 ZFR5zc4RLcsplv9wA5mXyCA+Xr5pAJlPydOHJqm6sRMBwtDTX5OObYNx6
 n7Yv9Uag4gQHDH744J7fO6OwZncfmAOS3abIi+N4gGeR2PvvQV9msZE0O
 j9+/iRYyVm6/C9f9k1/80DpIfHquPD4iM2ZG8OJM7j2y7i15ljHUdGwd8 w==;
X-CSE-ConnectionGUID: 5qjbooL1QNuHoqXx8Y4S+g==
X-CSE-MsgGUID: ipJSeD0yTOW4PRGouX7FMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4495662"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4495662"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 00:58:38 -0800
X-CSE-ConnectionGUID: zNB/rXD/TZ6iT5lpuic8zQ==
X-CSE-MsgGUID: TAcOqbb9QC6vTJrieg2DlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; d="scan'208";a="12405085"
Received: from hchegond-desk.jf.intel.com ([10.24.80.219])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 00:58:38 -0800
From: Harish Chegondi <harish.chegondi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: balasubramani.vivekanandan@intel.com, gustavo.sousa@intel.com,
 Harish Chegondi <harish.chegondi@intel.com>
Subject: [PATCH 1/1] drm/xe/eu_stall: Disable TDL clk gating during EU stall
 sampling
Date: Thu, 26 Nov 2026 00:58:32 -0800
Message-ID: <b7f4a7dcfca32729740cc2485201abef639b5572.1795683151.git.harish.chegondi@intel.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

As per the recent BSpec update, disable TDL clock gating during
EU stall sampling on CRI.

The patch is still under testing.

Bspec: 60997
Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h |  1 +
 drivers/gpu/drm/xe/xe_eu_stall.c     | 13 +++++++++++++
 2 files changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 06d45b1f2218..973901feb09c 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -378,6 +378,7 @@
 
 #define SUBSLICE_UNIT_LEVEL_CLKGATE2		XE_REG_MCR(0x9528)
 #define   CPSSUNIT_CLKGATE_DIS			REG_BIT(9)
+#define   TDLUNIT_CLKGATE_DIS			REG_BIT(0)
 
 #define SSMCGCTL9530				XE_REG_MCR(0x9530)
 #define   RTFUNIT_CLKGATE_DIS			REG_BIT(18)
diff --git a/drivers/gpu/drm/xe/xe_eu_stall.c b/drivers/gpu/drm/xe/xe_eu_stall.c
index c918fe3851c4..3ad450d8c6c3 100644
--- a/drivers/gpu/drm/xe/xe_eu_stall.c
+++ b/drivers/gpu/drm/xe/xe_eu_stall.c
@@ -719,6 +719,12 @@ static int xe_eu_stall_stream_enable(struct xe_eu_stall_data_stream *stream)
 		xe_gt_mcr_multicast_write(gt, ROW_CHICKEN2,
 					  REG_MASKED_FIELD_ENABLE(DISABLE_DOP_GATING));
 
+	if (gt_to_xe(gt)->info.platform == XE_CRESCENTISLAND) {
+		reg_value = xe_gt_mcr_unicast_read_any(gt, SUBSLICE_UNIT_LEVEL_CLKGATE2);
+		reg_value |= TDLUNIT_CLKGATE_DIS;
+		xe_gt_mcr_multicast_write(gt, SUBSLICE_UNIT_LEVEL_CLKGATE2, reg_value);
+	}
+
 	for_each_dss_steering(xecore, gt, group, instance) {
 		write_ptr_reg = xe_gt_mcr_unicast_read(gt, XEHPC_EUSTALL_REPORT, group, instance);
 		/* Clear any drop bits set and not cleared in the previous session. */
@@ -864,6 +870,7 @@ static int xe_eu_stall_enable_locked(struct xe_eu_stall_data_stream *stream)
 static int xe_eu_stall_disable_locked(struct xe_eu_stall_data_stream *stream)
 {
 	struct xe_gt *gt = stream->gt;
+	u32 reg_value;
 	int ret = 0;
 
 	if (!stream->enabled)
@@ -875,6 +882,12 @@ static int xe_eu_stall_disable_locked(struct xe_eu_stall_data_stream *stream)
 
 	cancel_delayed_work_sync(&stream->buf_poll_work);
 
+	if (gt_to_xe(gt)->info.platform == XE_CRESCENTISLAND) {
+		reg_value = xe_gt_mcr_unicast_read_any(gt, SUBSLICE_UNIT_LEVEL_CLKGATE2);
+		reg_value &= ~TDLUNIT_CLKGATE_DIS;
+		xe_gt_mcr_multicast_write(gt, SUBSLICE_UNIT_LEVEL_CLKGATE2, reg_value);
+	}
+
 	if (XE_GT_WA(gt, 22016596838))
 		xe_gt_mcr_multicast_write(gt, ROW_CHICKEN2,
 					  REG_MASKED_FIELD_DISABLE(DISABLE_DOP_GATING));
-- 
2.43.0


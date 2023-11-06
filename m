Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2E5BC4167B
	for <intel-xe@archiver.kernel.org>; Mon,  6 Nov 2023 21:07:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF99310E0EF;
	Mon,  6 Nov 2023 21:07:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C53D810E0EF
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Nov 2023 21:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699304877; x=1730840877;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wACJXYf+4c4FT2W4TplsLtrKmZTeuEXoiXrzsLxmpBA=;
 b=bPX+59HF601VWpSvYvcIIszFuk+KxkbmFXVYzKokUC2V1eIlZOWEJjz6
 kYpJrAjkwOMN7AquKyE/LnKGCy2SlUIyON5N2dTHeHZCXZJrd9dZr+NRm
 ON5JGNZ09Hi0fNiIA0Izn8uZFQ79E2qDZnnLVhtPvccIbWBXZyY1J35X1
 aXeY8jJakZlgOiJ7LRXVvVz0ywL+9IDp6pA8jZWGotMoAJrxkNPj6w8QU
 8y5zc0F0r92dBzsl1pIwrkB+RmxMobIc+KXTqkWyKcjofcM0evkU9DdfN
 WcWn549qypzPA64jGTrI5YEK+o6KmNyTl9cePSRPUlGhlDlsWZLcjBTZ1 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="386543986"
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; d="scan'208";a="386543986"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 13:07:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="766077609"
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; d="scan'208";a="766077609"
Received: from elyang-mobl1.amr.corp.intel.com (HELO gjsousa-mobl2.intel.com)
 ([10.92.96.190])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 13:07:46 -0800
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon,  6 Nov 2023 18:06:57 -0300
Message-ID: <20231106210655.175109-3-gustavo.sousa@intel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe/xelpmp: Add Wa_16021867713
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
Cc: Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This workaround applies to all steppings of Xe_LPM+. Implement the KMD
part.

Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_engine_regs.h | 3 +++
 drivers/gpu/drm/xe/xe_wa.c               | 6 ++++++
 2 files changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
index 35dd4837dd75..b57dec17eb2d 100644
--- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
@@ -118,4 +118,7 @@
 #define VDBOX_CGCTL3F18(base)			XE_REG((base) + 0x3f18)
 #define   ALNUNIT_CLKGATE_DIS			REG_BIT(13)
 
+#define VDBOX_CGCTL3F1C(base)			XE_REG((base) + 0x3f1c)
+#define   MFXPIPE_CLKGATE_DIS			REG_BIT(3)
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 2f1782db267b..614e114a5342 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -248,6 +248,12 @@ static const struct xe_rtp_entry_sr gt_was[] = {
 
 	/* Xe_LPM+ */
 
+	{ XE_RTP_NAME("16021867713"),
+	  XE_RTP_RULES(MEDIA_VERSION(1300),
+		       ENGINE_CLASS(VIDEO_DECODE)),
+	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F1C(0), MFXPIPE_CLKGATE_DIS)),
+	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
+	},
 	{ XE_RTP_NAME("22016670082"),
 	  XE_RTP_RULES(MEDIA_VERSION(1300)),
 	  XE_RTP_ACTIONS(SET(XELPMP_SQCNT1, ENFORCE_RAR))
-- 
2.42.0


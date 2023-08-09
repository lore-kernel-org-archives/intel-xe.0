Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71093C04A6A
	for <intel-xe@archiver.kernel.org>; Wed,  9 Aug 2023 16:17:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39D5F10E0C5;
	Wed,  9 Aug 2023 16:17:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBE1D10E0C5
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Aug 2023 16:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691597834; x=1723133834;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+p28jW5wIAkg9amlmKgIgde3gKYX3Xgti4RqxWI/kgk=;
 b=ng4MpePQA4Ln+Lth/vOX4q242XmnT6Pmr+6y3JWKPCT79F+N/EBeH7Kb
 izv2ozZPanAvRFMz09KaZsPeQzdPKhEuysTISx/gi7IWD3YxDuMDcp7RP
 jKAFM08PGg9x9YqTemYhSy/Qvc4xRXWTklbeK0FMPZAhdc5St8QGeSONC
 LVzbOx8bgHeSb2lbJCezEFWf/XZEMgEdZjpjaFmPdIR5f7SnC0kdYOeKF
 q1Dc1uEAF5nkCUNd0Rbec1VpTtxmNwiBYh1x4CGT2bnyIXUdwvs+SNaTa
 61/omZTKFBET66SyQwnGLxL8sRQiQMcMmuHpTIbf35sYkUkH0KqPTdzJa g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="402127176"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; d="scan'208";a="402127176"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2023 09:17:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="821913256"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; d="scan'208";a="821913256"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2023 09:17:07 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  9 Aug 2023 09:16:43 -0700
Message-Id: <20230809161643.309625-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe/mtl: Use same GuC version as i915
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Like i915, update the GuC firmware to use a major-only blob for Meteor
Lake.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---

Daniele, I see that for PVC you uploaded both 70.6.4 (mmp) and 70.8.0
(major-only) to the drm-firmware repo. Do we want to go ahead and update
PVC here to the latest too?

 drivers/gpu/drm/xe/xe_uc_fw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 2e70dd4880f6..110f0f0d6c79 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -100,7 +100,7 @@ struct fw_blobs_by_type {
 };
 
 #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)			\
-	fw_def(METEORLAKE,	mmp_ver(i915,	guc,	mtl,	70, 6, 4))	\
+	fw_def(METEORLAKE,	major_ver(i915,	guc,	mtl,	70, 6))		\
 	fw_def(PVC,		mmp_ver(xe,	guc,	pvc,	70, 6, 4))	\
 	fw_def(DG2,		major_ver(i915,	guc,	dg2,	70, 5))		\
 	fw_def(DG1,		major_ver(i915,	guc,	dg1,	70, 5))		\
-- 
2.40.1


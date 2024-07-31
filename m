Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAC47C3DA7F
	for <intel-xe@archiver.kernel.org>; Wed, 31 Jul 2024 23:33:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84C1410E07B;
	Wed, 31 Jul 2024 23:33:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bPyZ+uWu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B6DC10E07B
 for <intel-xe@lists.freedesktop.org>; Wed, 31 Jul 2024 23:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722468817; x=1754004817;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7Wk6PfnymuKEK53pA36VgOPUUL4HVCihgHvGoZEA6tQ=;
 b=bPyZ+uWu6/5E0mjzqIOLvq7IiDl23oaCXCTqp251NPshv9Ybckw9hHwB
 AmyfO1+a5iq53CxWSwvcqNEUiHa/Htb5+/1Lx8puTFpSuVEed5T5YU73S
 jT6uXfc5Gn2NhVtgG/H0t153gPHs9ZQ3Nayuz3z0EKMnfqF9QTUTF6jQV
 GN2UiGMl2NPqsIrmCpiYJ+wmYGlM1uj+0jhHxI2GX/Fk5w97zPyL3iv9O
 dXH98ugIm5PnK2Vn00W00h8T2IRdT14TqTkd2M3VIXx8KEifjtsaG3P6K
 64fRAx8dmb/pYiX/hiTjx2uZLHpEkDpGpXLBYUwKAKlAzUO3tZkGSsvbC A==;
X-CSE-ConnectionGUID: dtoFDa9TT42Hh02f+x38HQ==
X-CSE-MsgGUID: DYACMFFURLim6KRzdA+coQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="12818188"
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="12818188"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2024 16:33:37 -0700
X-CSE-ConnectionGUID: MRnInI86QWahdyfGL/f1yA==
X-CSE-MsgGUID: rr5C+ldhQ9apTDC0LA7YsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="59664635"
Received: from bfilipch-desk.jf.intel.com ([10.165.21.204])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2024 16:33:37 -0700
From: Julia Filipchuk <julia.filipchuk@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [CI v2] drm/xe/guc: Pick GuC v70.29.2 from CI folder
Date: Wed, 31 Jul 2024 16:33:26 -0700
Message-ID: <20240731233327.2991741-1-julia.filipchuk@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240730184309.2939144-1-julia.filipchuk@intel.com>
References: <20240730184309.2939144-1-julia.filipchuk@intel.com>
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

This is to test the new GuC release before overwriting the existing one.

PVC version is for CI only.

Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 6b92255a769d..d6ce2acba9b8 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -105,17 +105,17 @@ struct fw_blobs_by_type {
 };
 
 #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)			\
-	fw_def(BATTLEMAGE,	major_ver(intel-ci/xe,	guc,	bmg,	70, 24, 0))	\
-	fw_def(LUNARLAKE,	major_ver(intel-ci/xe,	guc,	lnl,	70, 24, 0))	\
-	fw_def(METEORLAKE,	major_ver(i915,	guc,	mtl,	70, 19, 2))	\
-	fw_def(PVC,		mmp_ver(intel-ci/xe, guc, pvc,	70, 24, 0))	\
-	fw_def(DG2,		major_ver(i915,	guc,	dg2,	70, 19, 2))	\
-	fw_def(DG1,		major_ver(i915,	guc,	dg1,	70, 19, 2))	\
-	fw_def(ALDERLAKE_N,	major_ver(i915,	guc,	tgl,	70, 19, 2))	\
-	fw_def(ALDERLAKE_P,	major_ver(i915,	guc,	adlp,	70, 19, 2))	\
-	fw_def(ALDERLAKE_S,	major_ver(i915,	guc,	tgl,	70, 19, 2))	\
-	fw_def(ROCKETLAKE,	major_ver(i915,	guc,	tgl,	70, 19, 2))	\
-	fw_def(TIGERLAKE,	major_ver(i915,	guc,	tgl,	70, 19, 2))
+	fw_def(BATTLEMAGE,	major_ver(intel-ci/xe,	guc,	bmg,	70, 29, 2))	\
+	fw_def(LUNARLAKE,	major_ver(intel-ci/xe,	guc,	lnl,	70, 29, 2))	\
+	fw_def(METEORLAKE,	major_ver(intel-ci/i915,	guc,	mtl,	70, 29, 2))	\
+	fw_def(PVC,		mmp_ver(intel-ci/xe,	guc,	pvc,	70, 29, 2))	\
+	fw_def(DG2,		major_ver(intel-ci/i915,	guc,	dg2,	70, 29, 2))	\
+	fw_def(DG1,		major_ver(intel-ci/i915,	guc,	dg1,	70, 29, 2))	\
+	fw_def(ALDERLAKE_N,	major_ver(intel-ci/i915,	guc,	tgl,	70, 29, 2))	\
+	fw_def(ALDERLAKE_P,	major_ver(intel-ci/i915,	guc,	adlp,	70, 29, 2))	\
+	fw_def(ALDERLAKE_S,	major_ver(intel-ci/i915,	guc,	tgl,	70, 29, 2))	\
+	fw_def(ROCKETLAKE,	major_ver(intel-ci/i915,	guc,	tgl,	70, 29, 2))	\
+	fw_def(TIGERLAKE,	major_ver(intel-ci/i915,	guc,	tgl,	70, 29, 2))
 
 #define XE_HUC_FIRMWARE_DEFS(fw_def, mmp_ver, no_ver)		\
 	fw_def(BATTLEMAGE,	no_ver(xe,	huc,		bmg))		\
-- 
2.45.2


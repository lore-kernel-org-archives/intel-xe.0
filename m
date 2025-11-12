Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EBDFCD343C
	for <intel-xe@archiver.kernel.org>; Wed, 12 Nov 2025 18:31:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49AE410E7A1;
	Wed, 12 Nov 2025 18:31:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nrWeX/aO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A37810E7A1
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Nov 2025 18:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762972264; x=1794508264;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=V3Zor2SMdbpnrQVCuj4t6bFuQtR2qGfXc5QhjULzdqM=;
 b=nrWeX/aOYOtXpSScZWb/uENaOWzAZBk+kKZ/GH+Ep4nYrdBz7ycmeung
 3eT5ONyCYpfwXDRjHYlytsLVKaCvktF146eMmZAAR790hx/aFDOBsIpGU
 wdlGtC8VKZM8KL7kJhjwMvObkHJYfXii+/+jiOPjF20lKqkxuyf0A0G5K
 aTQtzktXSyFkYFf5CD4JTi7RRs0pMl0alglM7tb7B4IaswjAq74t67VR8
 KHjIunqqofbD624RoG2OyblNLn5HWFO79bHyzHK2B0nGaGnaGqnGLf5Fh
 Lv4rNBx1mpxGa2aXGzerH8AoQQXdFwe75MlFISbLT1xl33/NG7ezkfYZ6 w==;
X-CSE-ConnectionGUID: VBZqaaruQP67zBkWt0pKIA==
X-CSE-MsgGUID: IoC9ghVBS8G8TF+npfzsMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64968406"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="64968406"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 10:31:04 -0800
X-CSE-ConnectionGUID: iDC5p3fpTD6zi2EJA7ZarQ==
X-CSE-MsgGUID: S2aPchqvR4iegC6aynmd3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,300,1754982000"; d="scan'208";a="189066324"
Received: from bfilipch-desk.jf.intel.com ([10.88.27.152])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 10:31:03 -0800
From: Julia Filipchuk <julia.filipchuk@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH] drm/xe/guc: Recommend GuC v70.53.0 for MTL, DG2, BMG, LNL, PTL
Date: Wed, 12 Nov 2025 10:30:33 -0800
Message-ID: <20251112183100.1472193-2-julia.filipchuk@intel.com>
X-Mailer: git-send-email 2.51.0
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

UAPI compatibility version 1.26.0

Update recommended GuC version for MTL, DG2, BMG, LNL, PTL.

Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index b4cd6226ad31..1ae10c5ea919 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -117,12 +117,12 @@ struct fw_blobs_by_type {
 #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)					\
 	fw_def(CRESCENTISLAND,	GT_TYPE_ANY,	mmp_ver(xe,	guc,	cri,	70, 49, 4))	\
 	fw_def(NOVALAKE_S,	GT_TYPE_ANY,	mmp_ver(xe,	guc,	nvl,	70, 49, 4))	\
-	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	ptl,	70, 49, 4))	\
-	fw_def(BATTLEMAGE,	GT_TYPE_ANY,	major_ver(xe,	guc,	bmg,	70, 49, 4))	\
-	fw_def(LUNARLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	lnl,	70, 45, 2))	\
-	fw_def(METEORLAKE,	GT_TYPE_ANY,	major_ver(i915,	guc,	mtl,	70, 44, 1))	\
+	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	ptl,	70, 53, 0))	\
+	fw_def(BATTLEMAGE,	GT_TYPE_ANY,	major_ver(xe,	guc,	bmg,	70, 53, 0))	\
+	fw_def(LUNARLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	lnl,	70, 53, 0))	\
+	fw_def(METEORLAKE,	GT_TYPE_ANY,	major_ver(i915,	guc,	mtl,	70, 53, 0))	\
 	fw_def(PVC,		GT_TYPE_ANY,	mmp_ver(xe,	guc,	pvc,	70, 44, 1))	\
-	fw_def(DG2,		GT_TYPE_ANY,	major_ver(i915,	guc,	dg2,	70, 45, 2))	\
+	fw_def(DG2,		GT_TYPE_ANY,	major_ver(i915,	guc,	dg2,	70, 53, 0))	\
 	fw_def(DG1,		GT_TYPE_ANY,	major_ver(i915,	guc,	dg1,	70, 44, 1))	\
 	fw_def(ALDERLAKE_N,	GT_TYPE_ANY,	major_ver(i915,	guc,	tgl,	70, 44, 1))	\
 	fw_def(ALDERLAKE_P,	GT_TYPE_ANY,	major_ver(i915,	guc,	adlp,	70, 44, 1))	\
-- 
2.51.0


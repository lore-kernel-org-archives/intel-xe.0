Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1206C54ED0
	for <intel-xe@archiver.kernel.org>; Thu, 22 May 2025 01:20:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A6ED10FA87;
	Thu, 22 May 2025 01:20:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kut1SXGl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C4C410F0D1
 for <intel-xe@lists.freedesktop.org>; Thu, 22 May 2025 01:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747876850; x=1779412850;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7Hzbug1yGjbaEs9IG2YofIQ84bG2+5yTi+2sLJHksJE=;
 b=kut1SXGl1whclUAV4PM3UQMlZC+2q4keOAagE4V2T4MyrCPEtOBugIjH
 3F3oyaXlA36B29dLWkZWWohzkHT7Qze3DvGyoSffNtqhm1lUSaHkr0OYn
 NwvmaEwTvgvhB8XQKKdPMtM7keR3sPIcmPMKNUSY521sl+VnZTqvO1Xos
 EH04VB5JqeFEILGt2jN02HWpAbbAfXYZufihZnKtA3JuWcx3EjgCmYPN9
 b37bLYwrjTvcThzXKz4ILRz6yKktwVEiKcliAovFG2CCB+I4966um3Sv9
 PsYmGPxLEYghPSdI28EyaB2TpMkMZUT6Z4QNBlI5dw+Ma7Nih0zeftMo0 Q==;
X-CSE-ConnectionGUID: Q8/mMUHBRYuSs9BLTcc8Dw==
X-CSE-MsgGUID: C0cYVMJNRbOPzGu2ty4DwA==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="37501226"
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; d="scan'208";a="37501226"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 18:20:49 -0700
X-CSE-ConnectionGUID: pEM5xcE4QFOAAt8hbRXahg==
X-CSE-MsgGUID: 1FjTI8y8TpKJYT6glO2IRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; d="scan'208";a="140417016"
Received: from bfilipch-desk.jf.intel.com ([10.165.21.204])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 18:20:49 -0700
From: Julia Filipchuk <julia.filipchuk@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [CI] drm/xe/guc: Test new GuC v70.45.2 for BMG, LNL
Date: Wed, 21 May 2025 18:20:45 -0700
Message-ID: <20250522012045.323747-1-julia.filipchuk@intel.com>
X-Mailer: git-send-email 2.49.0
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

UAPI compatiblity version 1.21.2

This patch is for testing only. If testing is successful the binary
blobs will replace the major versioned *_guc_70.bin files for given
platforms.

Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 7b2d01d39b86..5ba2dc073f3f 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -115,8 +115,8 @@ struct fw_blobs_by_type {
 
 #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)					\
 	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	mmp_ver(xe,	guc,	ptl,	70, 44, 1))	\
-	fw_def(BATTLEMAGE,	GT_TYPE_ANY,	major_ver(xe,	guc,	bmg,	70, 44, 1))	\
-	fw_def(LUNARLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	lnl,	70, 44, 1))	\
+	fw_def(BATTLEMAGE,	GT_TYPE_ANY,	mmp_ver(xe,	guc,	bmg,	70, 45, 2))	\
+	fw_def(LUNARLAKE,	GT_TYPE_ANY,	mmp_ver(xe,	guc,	lnl,	70, 45, 2))	\
 	fw_def(METEORLAKE,	GT_TYPE_ANY,	major_ver(i915,	guc,	mtl,	70, 44, 1))	\
 	fw_def(PVC,		GT_TYPE_ANY,	mmp_ver(xe,	guc,	pvc,	70, 44, 1))	\
 	fw_def(DG2,		GT_TYPE_ANY,	major_ver(i915,	guc,	dg2,	70, 44, 1))	\
-- 
2.49.0


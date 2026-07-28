Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA32DC54F4D
	for <intel-xe@archiver.kernel.org>; Tue, 28 Jul 2026 17:50:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E49310E9A6;
	Tue, 28 Jul 2026 17:50:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="emn+k3lt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5607110E9AA
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Jul 2026 17:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785261039; x=1816797039;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cM5Lami76BRA6GhiZfyHr5yuf9RMbYCbok6qc7IJXxo=;
 b=emn+k3ltWehz+7KyK4R5SYngQ2ag/Hz9Q50XGgDSZX5qnTC9cclW/nJI
 GAON3yuBRsI4qQSaOV35RWT2PVxr2hein3S+pZd29dHYExYxyZyu+wjmn
 HxAR+91CzPYfltEPnwAaDk788DlY71/gVadjFHvKpym9lTGwoPW/cITw6
 Zt6vUPL+oieLruIq1yebkS6NxS5J8JkevYwww4A4/ubFqoghl1kejBLOk
 1ZIkDXtZ9xhHdtS0N49xMmvPeUuhyPtMiTXoT0r8Kor/WVtLKuxlXjEtI
 XMa5Q/Dy9bnZryJxiKl0YLVYGVNlVbOkC8CwcbtO63Pu/HokFdSoPNpGC w==;
X-CSE-ConnectionGUID: /FtK0Fk/TUaxNb4BRAvKHg==
X-CSE-MsgGUID: JJlnqsznQXi1CqtORdbiHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="84984834"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; d="scan'208";a="84984834"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2026 10:50:39 -0700
X-CSE-ConnectionGUID: g05S2j53R4OBw+Fl72qcSg==
X-CSE-MsgGUID: adBauygFTleY2HdW96sM8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; d="scan'208";a="257987215"
Received: from bfilipch-desk.jf.intel.com ([10.88.27.152])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2026 10:50:39 -0700
From: Julia Filipchuk <julia.filipchuk@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH] drm/xe/guc: Test GuC v70.72.1 for BMG, LNL, PTL, NVL-S
Date: Tue, 28 Jul 2026 10:50:00 -0700
Message-ID: <20260728174958.1905664-3-julia.filipchuk@intel.com>
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

UAPI compatibility version 1.38.1

This patch is for testing only. If testing is successful the binary
blobs will replace the major versioned *_guc_70.bin files for given
platforms.

Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index e29878b255ba..88d9a1b52b73 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -118,10 +118,10 @@ struct fw_blobs_by_type {
 	fw_def(NOVALAKE_P,	GT_TYPE_MAIN,	mmp_ver(xe,	guc,	nvlpg,	70, 70, 0))	\
 	fw_def(NOVALAKE_P,	GT_TYPE_MEDIA,	mmp_ver(xe,	guc,	nvlpm,	70, 70, 0))	\
 	fw_def(CRESCENTISLAND,	GT_TYPE_ANY,	mmp_ver(xe,	guc,	cri,	70, 70, 0))	\
-	fw_def(NOVALAKE_S,	GT_TYPE_ANY,	major_ver(xe,	guc,	nvl,	70, 71, 0))	\
-	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	ptl,	70, 54, 0))	\
-	fw_def(BATTLEMAGE,	GT_TYPE_ANY,	major_ver(xe,	guc,	bmg,	70, 54, 0))	\
-	fw_def(LUNARLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	lnl,	70, 53, 0))	\
+	fw_def(NOVALAKE_S,	GT_TYPE_ANY,	mmp_ver(xe,	guc,	nvl,	70, 72, 1))	\
+	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	mmp_ver(xe,	guc,	ptl,	70, 72, 1))	\
+	fw_def(BATTLEMAGE,	GT_TYPE_ANY,	mmp_ver(xe,	guc,	bmg,	70, 72, 1))	\
+	fw_def(LUNARLAKE,	GT_TYPE_ANY,	mmp_ver(xe,	guc,	lnl,	70, 72, 1))	\
 	fw_def(METEORLAKE,	GT_TYPE_ANY,	major_ver(i915,	guc,	mtl,	70, 53, 0))	\
 	fw_def(PVC,		GT_TYPE_ANY,	mmp_ver(xe,	guc,	pvc,	70, 44, 1))	\
 	fw_def(DG2,		GT_TYPE_ANY,	major_ver(i915,	guc,	dg2,	70, 53, 0))	\
-- 
2.51.0


Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 218FACCF9EE
	for <intel-xe@archiver.kernel.org>; Wed, 29 Oct 2025 22:04:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDD2A10E85D;
	Wed, 29 Oct 2025 22:04:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JbNqj2z0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE3C310E85D
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Oct 2025 22:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761775461; x=1793311461;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YcIWsvpnSJaRsiQxBKxZl//tIxxeY0bEqxlNYaNce6s=;
 b=JbNqj2z0AFQYGWloVCRP6x1sjrc2GpMbe9tN9tyOVyzJUpbioS0z1ThW
 3UzofDQFUEv1YfHLLK926tbvAYRKGUH5s6jOQIaescwLpWPpbV1MvBhT8
 29svz3jERY9bMahNaKrpOp5xjMIOe9x21Dhw2ifJAgeM9EY4EVeJA8wgM
 tU+u6e7AOcQIs5Q6371w8z0zsSUwqNx+x89eMfR1Ow/gLwnixnJmW2/K8
 +CNU60sIGlc7f62Jj6y61DLUcZzoHA3pTt1EQmzvNFu/eTtJpCnDGqh0D
 OlTVH6a+WAetiVMu1Vd1cnqnP6nmmAPhcCqcVYeg6J1wrJqFbpgLPV99z Q==;
X-CSE-ConnectionGUID: 6/Ivg9HCQv+o8nsmU0AEUQ==
X-CSE-MsgGUID: ILxs4xNGSQ69iyoW/E4mmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="51482431"
X-IronPort-AV: E=Sophos;i="6.19,265,1754982000"; d="scan'208";a="51482431"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 15:04:20 -0700
X-CSE-ConnectionGUID: Is/thqFJSlCW2mywLvCykg==
X-CSE-MsgGUID: i/TKsxDWT7S8Uo3Mwm5atA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,265,1754982000"; d="scan'208";a="185031923"
Received: from bfilipch-desk.jf.intel.com ([10.88.27.152])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 15:04:20 -0700
From: Julia Filipchuk <julia.filipchuk@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [CI] drm/xe/guc: Test new GuC v70.53.0 for BMG, LNL, PTL, NVL-S, CRI
Date: Wed, 29 Oct 2025 15:03:52 -0700
Message-ID: <20251029220408.855920-1-julia.filipchuk@intel.com>
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

This patch is for testing only. If testing is successful the binary
blobs will replace the major versioned *_guc_70.bin files for given
platforms.

Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index b4cd6226ad31..a0deda4e8c84 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -115,11 +115,11 @@ struct fw_blobs_by_type {
 #define XE_GT_TYPE_ANY XE_GT_TYPE_UNINITIALIZED
 
 #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)					\
-	fw_def(CRESCENTISLAND,	GT_TYPE_ANY,	mmp_ver(xe,	guc,	cri,	70, 49, 4))	\
-	fw_def(NOVALAKE_S,	GT_TYPE_ANY,	mmp_ver(xe,	guc,	nvl,	70, 49, 4))	\
-	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	ptl,	70, 49, 4))	\
-	fw_def(BATTLEMAGE,	GT_TYPE_ANY,	major_ver(xe,	guc,	bmg,	70, 49, 4))	\
-	fw_def(LUNARLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	lnl,	70, 45, 2))	\
+	fw_def(CRESCENTISLAND,	GT_TYPE_ANY,	mmp_ver(xe,	guc,	cri,	70, 53, 0))	\
+	fw_def(NOVALAKE_S,	GT_TYPE_ANY,	mmp_ver(xe,	guc,	nvl,	70, 53, 0))	\
+	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	mmp_ver(xe,	guc,	ptl,	70, 53, 0))	\
+	fw_def(BATTLEMAGE,	GT_TYPE_ANY,	mmp_ver(xe,	guc,	bmg,	70, 53, 0))	\
+	fw_def(LUNARLAKE,	GT_TYPE_ANY,	mmp_ver(xe,	guc,	lnl,	70, 53, 0))	\
 	fw_def(METEORLAKE,	GT_TYPE_ANY,	major_ver(i915,	guc,	mtl,	70, 44, 1))	\
 	fw_def(PVC,		GT_TYPE_ANY,	mmp_ver(xe,	guc,	pvc,	70, 44, 1))	\
 	fw_def(DG2,		GT_TYPE_ANY,	major_ver(i915,	guc,	dg2,	70, 45, 2))	\
-- 
2.51.0


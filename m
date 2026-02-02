Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87A27E7FDCD
	for <intel-xe@archiver.kernel.org>; Mon,  2 Feb 2026 20:49:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3764110E065;
	Mon,  2 Feb 2026 20:49:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XVw/8LOp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55D9410E065
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Feb 2026 20:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770065370; x=1801601370;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=SxcOjbTGvACGLCaTz+I4L4tA9pV8lCmOBGciIn9tAD4=;
 b=XVw/8LOp5L16nc+8yd2trmHrHqWw3Pwpp9DOAKYlwY5En40J3fb65vj5
 uNuoSx74OI5OHO/wlh4tSjTiHnop7W0y55XaarILzJE/kR4VrlEYmZTod
 lQ93l9s55jZtJ3eRBBXE4iiKIhxZoQ3Es0xyx9pR/RwBzwPTLQlJ4mKR5
 B/jMzmmgpQgicsvND+DlmEjWd0lXdy1BkRfNndHOGfb0dhsenQft0dbiR
 E9JfTIrpVFXLs5Ey5jY7fVFbv9ULdTghZH3oIag6Fa1qG4V+k9YRy+WxG
 MN3fmCwwyA4c25JjD0IcSoiJ1uCoH69aly5bUXEyTcunUk9qGGYaOKSuv Q==;
X-CSE-ConnectionGUID: MB0wu7kwTSyRmqxn7BVeDQ==
X-CSE-MsgGUID: 92Qjum2hSJmfaVBJAK7rpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="82601507"
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; d="scan'208";a="82601507"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 12:49:30 -0800
X-CSE-ConnectionGUID: jhz3plTjQTqXY4pTAIB2kg==
X-CSE-MsgGUID: v7/i3wn8Tw2FghCnCpEv9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; d="scan'208";a="209854679"
Received: from bfilipch-desk.jf.intel.com ([10.88.27.152])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 12:49:29 -0800
From: Julia Filipchuk <julia.filipchuk@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH] drm/xe/guc: Test GuC v70.58.1 for LNL, PTL
Date: Mon,  2 Feb 2026 12:49:21 -0800
Message-ID: <20260202204923.2767427-2-julia.filipchuk@intel.com>
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

UAPI compatibility version 1.30.2

This patch is for testing only. If testing is successful the binary
blobs will replace the major versioned *_guc_70.bin files for given
platforms.

Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 6a8e692fd7a1..d22c0897f0df 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -117,9 +117,9 @@ struct fw_blobs_by_type {
 #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)					\
 	fw_def(CRESCENTISLAND,	GT_TYPE_ANY,	mmp_ver(xe,	guc,	cri,	70, 55, 4))	\
 	fw_def(NOVALAKE_S,	GT_TYPE_ANY,	mmp_ver(xe,	guc,	nvl,	70, 55, 4))	\
-	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	ptl,	70, 54, 0))	\
+	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	mmp_ver(xe,	guc,	ptl,	70, 58, 1))	\
 	fw_def(BATTLEMAGE,	GT_TYPE_ANY,	major_ver(xe,	guc,	bmg,	70, 54, 0))	\
-	fw_def(LUNARLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	lnl,	70, 53, 0))	\
+	fw_def(LUNARLAKE,	GT_TYPE_ANY,	mmp_ver(xe,	guc,	lnl,	70, 58, 1))	\
 	fw_def(METEORLAKE,	GT_TYPE_ANY,	major_ver(i915,	guc,	mtl,	70, 53, 0))	\
 	fw_def(PVC,		GT_TYPE_ANY,	mmp_ver(xe,	guc,	pvc,	70, 44, 1))	\
 	fw_def(DG2,		GT_TYPE_ANY,	major_ver(i915,	guc,	dg2,	70, 53, 0))	\
-- 
2.51.0


Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 388AAFB5168
	for <intel-xe@archiver.kernel.org>; Mon,  6 Apr 2026 21:18:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECEF510E306;
	Mon,  6 Apr 2026 21:18:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d4AS63mM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAD4510E2D8
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Apr 2026 21:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775510316; x=1807046316;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=u2t/UTa57UFigtB7R8C37zImN/FpDql2DEKidwne3bk=;
 b=d4AS63mMLr81HFVGvv9zSyTXu+lokwBt57aMf4f4pEfbq5I6wuPuDwFN
 RvZBoycm2eHwOrk104OucZd9tj98DufyW3gNwI+hWWO7aYo7vHDj4wX4F
 2Kbdbf3jLxhUFVxvWR8ggZgzWa2FqAjVh8dFc046tR1i7yZ7/BaQUwtpD
 KwgpU1yQ4oyRY58n7RGzND4iC66RWdg8xsYHru2XWdrYGjwIbvsCoxXx4
 BHqT4QrrOYW5+kE5SJQPMrctFckRPeMF6enn+mIYAS8jl7JvdFSu+E7Sg
 ujiY2pF9AmDF41vPWu/r1nHSMdSFWhWaFhPlZ7XR++3S/NRp94qxVju3Q g==;
X-CSE-ConnectionGUID: s/XQi5KNQvGZJ7TEawo3kA==
X-CSE-MsgGUID: jeg0Y4DwSVi/j70sesBQQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="76653358"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; d="scan'208";a="76653358"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 14:18:36 -0700
X-CSE-ConnectionGUID: IwDx8benQKCVT2kwXMvcKA==
X-CSE-MsgGUID: CIengaBxS5CDXspT1Dof0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; d="scan'208";a="227888196"
Received: from bfilipch-desk.jf.intel.com ([10.88.27.152])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 14:18:36 -0700
From: Julia Filipchuk <julia.filipchuk@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Julia Filipchuk <julia.filipchuk@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v2 4/7] drm/xe/guc: Recommend GuC v70.60.0 for BMG, LNL, PTL
Date: Mon,  6 Apr 2026 14:17:28 -0700
Message-ID: <20260406211759.817577-13-julia.filipchuk@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260406211759.817577-9-julia.filipchuk@intel.com>
References: <20260406211759.817577-9-julia.filipchuk@intel.com>
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

UAPI compatibility version 1.31.0

Update recommended GuC version for BMG, LNL, PTL.

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 498c89452779..eeca044d3aed 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -115,9 +115,9 @@ struct fw_blobs_by_type {
 #define XE_GT_TYPE_ANY XE_GT_TYPE_UNINITIALIZED
 
 #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)					\
-	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	ptl,	70, 54, 0))	\
-	fw_def(BATTLEMAGE,	GT_TYPE_ANY,	major_ver(xe,	guc,	bmg,	70, 54, 0))	\
-	fw_def(LUNARLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	lnl,	70, 53, 0))	\
+	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	ptl,	70, 60, 0))	\
+	fw_def(BATTLEMAGE,	GT_TYPE_ANY,	major_ver(xe,	guc,	bmg,	70, 60, 0))	\
+	fw_def(LUNARLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	lnl,	70, 60, 0))	\
 	fw_def(METEORLAKE,	GT_TYPE_ANY,	major_ver(i915,	guc,	mtl,	70, 53, 0))	\
 	fw_def(PVC,		GT_TYPE_ANY,	mmp_ver(xe,	guc,	pvc,	70, 44, 1))	\
 	fw_def(DG2,		GT_TYPE_ANY,	major_ver(i915,	guc,	dg2,	70, 53, 0))	\
-- 
2.51.0


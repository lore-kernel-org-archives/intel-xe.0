Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EE37C61DBD
	for <intel-xe@archiver.kernel.org>; Tue, 25 Aug 2026 23:16:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5379A10EB84;
	Tue, 25 Aug 2026 23:16:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lqnysRPC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C1D810EB77
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Aug 2026 23:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787699781; x=1819235781;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IK0vnZepCFTyEJnb7zpl5d5x3PmSng+4oHXYFPaETDo=;
 b=lqnysRPC77zl2aPLXpdl6697cLBNcPUEpnivvLOytzW3E6yTyGLdIh57
 nrP5lCnLgvHx9AeC0/02J+Lo4vKsljm1Mv2jy2UpxLLsAVvYkL2ebVOen
 mwdvM9E4PFSqYBVMISfr2mWML4xZm9b68MsgdHiVK+CMmsOjz81XzgdJe
 6KxSr/pfyXY22QOPpiKLL8DL5hZfBSp9LP7ZZwp4kj+bl3hJ9WVqLDbSE
 FbHxpz+SO36ATaeuSuokTjM6lS2g9eKZ0NcIOZEKaOGzEe9fCVuKfv4aS
 HraBrQ/rnt10HNxL6y7aDLKjyg9y63me4yyZLQlkZ3eJlaFUOZm9Zd/G1 Q==;
X-CSE-ConnectionGUID: iWV/CnFQTYKLSzJgc3pKRQ==
X-CSE-MsgGUID: Av1pOxU/TyeTTLeuuu8iqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="91857241"
X-IronPort-AV: E=Sophos;i="6.25,243,1779174000"; d="scan'208";a="91857241"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2026 16:16:21 -0700
X-CSE-ConnectionGUID: fSATK1KQQN6Yhk5Yb0HYIg==
X-CSE-MsgGUID: crsm/scNSaKleB2+LLljfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,243,1779174000"; d="scan'208";a="270906916"
Received: from dceraolo-desk1.fm.intel.com (HELO dceraolo-desk1)
 ([10.121.64.189])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2026 16:16:21 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH 5/6] DO NOT MERGE: drm/xe/gsc: define GSC for WCL
Date: Tue, 25 Aug 2026 23:16:03 +0000
Message-ID: <20260825231604.651906-6-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260825231604.651906-1-daniele.ceraolospurio@intel.com>
References: <20260825231604.651906-1-daniele.ceraolospurio@intel.com>
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

This patch is just to show how the separate WCL definition would look.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 6561de3f384d..051889a635af 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -149,6 +149,7 @@ struct fw_blobs_by_type {
 
 /* for the GSC FW we match the compatibility version and not the release one */
 #define XE_GSC_FIRMWARE_DEFS(fw_def, major_ver)		\
+	fw_def(PANTHERLAKE,	SUBPLATFORM_WILDCATLAKE,major_ver(xe,	gsc,	wcl,	105, 1, 0))	\
 	fw_def(PANTHERLAKE,	SUBPLATFORM_ANY,	major_ver(xe,	gsc,	ptl,	105, 1, 0))	\
 	fw_def(LUNARLAKE,	SUBPLATFORM_ANY,	major_ver(xe,	gsc,	lnl,	104, 1, 0))	\
 	fw_def(METEORLAKE,	SUBPLATFORM_ANY,	major_ver(i915,	gsc,	mtl,	102, 1, 0))
-- 
2.53.0


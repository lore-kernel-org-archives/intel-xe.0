Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9CF7CF2564
	for <intel-xe@archiver.kernel.org>; Fri, 21 Nov 2025 03:52:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99E1610E7E7;
	Fri, 21 Nov 2025 03:52:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YvsqJWNK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE41210E7E9
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Nov 2025 03:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763697142; x=1795233142;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+0gtzc/NunFrM4BKAUgBCJJorovopkQNhy5J+rN1yzY=;
 b=YvsqJWNKAAc6psMS71fg9htB1UDkX9WosaDIg0Qxvz0YrMRbSe+iy0Ub
 S+Y/vwMFuJoXNHPVhkkHpkc5i41JekkUAgIvjUt6fRMvudb9TXUNwF3cv
 uzJHLdp9rOilL1nlD0KSAa+lLCTIPXCQw3Yircdm1B2Q6NTROYkPPKVwb
 FhJVxgewH39gq/0NW+7akL2aQ3gUSTRI99RhU7OyLgo7dar9w78WGItVs
 cbPb4Ud2Tl/5ThNomZ2XYiW50IQSLBgbK/7vWuSI1S1I9cT/k7N6Fm8W+
 wlZ+oTrCNODIR475QPiE6cgIxXcH+81ZS75lA4FwvSvRbPGdBRNBgTzKr Q==;
X-CSE-ConnectionGUID: 0Vsq++krSMawfDLuUu99KQ==
X-CSE-MsgGUID: +ekGkrTNQnywfp98s+uoKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="76110543"
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; d="scan'208";a="76110543"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 19:52:22 -0800
X-CSE-ConnectionGUID: frixLEwPQLWBluYgDvNpuQ==
X-CSE-MsgGUID: K5jR+sSAQpishIPSA2CsDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; d="scan'208";a="190857832"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.139])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 19:52:22 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com
Subject: [PATCH v3 15/18] drm/xe/xe3p: Disable GuC Dynamic ICS for Xe3p
Date: Thu, 20 Nov 2025 19:51:49 -0800
Message-ID: <20251121035147.766072-35-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251121035147.766072-20-niranjana.vishwanathapura@intel.com>
References: <20251121035147.766072-20-niranjana.vishwanathapura@intel.com>
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

From: Gustavo Sousa <gustavo.sousa@intel.com>

The Dynamic Inhibit Context Switch (ICS) feature is not currently
supported on Xe3p with multi-queue feature as it conflicts with
that on the GuC side. Disable ICS to support multi-queue on Xe3p
platforms.

Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index cf92de1c88a7..d092881607ba 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -607,6 +607,13 @@ static bool supports_dynamic_ics(struct xe_guc *guc)
 	if (xe_gt_is_media_type(gt) || gt->ccs_mode > 1)
 		return false;
 
+	/*
+	 * The feature is currently not compatible with platforms with support
+	 * to multi-queue, even if the feature is not enabled/used.
+	 */
+	if (GRAPHICS_VER(xe) >= 35)
+		return false;
+
 	/*
 	 * Dynamic ICS requires GuC v70.40.1, which maps to compatibility
 	 * version v1.18.4.
-- 
2.43.0


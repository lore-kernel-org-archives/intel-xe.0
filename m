Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99773CD98C5
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jun 2026 21:21:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52B1310EBF9;
	Wed, 10 Jun 2026 21:21:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l9Yk1b6R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFE3710EBF9
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Jun 2026 21:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781126473; x=1812662473;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:to:cc;
 bh=H/eF9vpeBWjHU3QXV81UW65od3Sfdolh1DxFH2f/aao=;
 b=l9Yk1b6RQkEp4BzTPr1P8/VsgT4RL4GX3aS9AUG3zXSzT/YdByqv+y0Q
 EUZNDQejsYWRDs482oy/HZqzgNuvs4ueNfA0FwknVPsOCe1qRYko94NhO
 0YkJ8SbGzNKkSRBJUWtYCJqTSL1YYNgCTUKGWM8x8cyiWuUPaQDewJrHW
 lB9i33IlKJ+R0c13aVFIEkT+QmibRFzbOaBgZSV2QMAFiWhX2AOgxbZ7C
 JeUf4hp4nDumv+77vT9wSjpVD7OlSrmbi9LbwS26CDUGz8xtv+mx0SkPz
 Rznp0VRLTfALKxn7D1zfbLnGZJHgCbr8HBwKCHvg81TgFceoTkGY1e1h6 g==;
X-CSE-ConnectionGUID: dxyyzjVRSL22RaNgMzpGtQ==
X-CSE-MsgGUID: DbuLpviEQTKDowKDwruw0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="107371311"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="107371311"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 14:21:12 -0700
X-CSE-ConnectionGUID: xH8XQiM/RmiArIabDYl1Zw==
X-CSE-MsgGUID: UvIYgKQRRYqKPnfzv9xenw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="245415216"
Received: from rosenzwe-mobl1.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.220.63])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 14:21:12 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Wed, 10 Jun 2026 18:20:47 -0300
Subject: [PATCH] drm/xe/xe3p_lpg: Add missing references to workarounds
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-add-missing-wa-references-v1-1-0947577238bf@intel.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MQQqEMBAEvyJzdiBRouJXxEM2ad05GCUDKoh/3
 7DHoqh6SJEFSmP1UMYpKnsqYOuKwtenFSyxMDWm6UxnDfsYeRNVSStfnjMWZKQA5eCGtrXLp4d
 zVPqjOLn/72l+3x/+MdzuawAAAA==
X-Change-ID: 20260610-add-missing-wa-references-c58331fb7e55
To: intel-xe@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>
X-Mailer: b4 0.15-dev
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

Sometimes the same workaround implementation ends up being the
recommended fix different hardware issues, which are tracked by
different workaround lineage numbers.

Some of the Xe3p_LPG workarounds got "dismissed" because the
implementations were already in the driver, however for a different
lineage number.

Even though the implementation for workaround #A is already present in
the driver for workaround #B, it is still important to reference #A in
the driver for tracking purposes.  Without such a reference, we risk
dropping the workaround implementation if, for some reason in the
future, we decide that #B is not necessary anymore while #A is still
required.

As such, add the missing references for Xe3p_LPG.

Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
Note: I realized this while reviewing the workaround database for
Xe3p_LPG against our current driver code.  There could be more cases
for other IPs.
---
 drivers/gpu/drm/xe/xe_wa.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 635d5461f712..139434946f8f 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -293,7 +293,7 @@ VISIBLE_IF_KUNIT const struct xe_rtp_table_sr gt_was = XE_RTP_TABLE_SR(
 	  XE_RTP_ACTIONS(SET(MMIOATSREQLIMIT_GAM_WALK_3D,
 			     DIS_ATS_WRONLY_PG))
 	},
-	{ XE_RTP_NAME("14026144927, 16029437861"),
+	{ XE_RTP_NAME("14026144927, 16029437861, 14026127056"),
 	  XE_RTP_RULES(GRAPHICS_VERSION(3510), GRAPHICS_STEP(A0, B0)),
 	  XE_RTP_ACTIONS(SET(L3SQCREG2, L3_SQ_DISABLE_COAMA_2WAY_COH |
 			     L3_SQ_DISABLE_COAMA))
@@ -587,12 +587,12 @@ static const struct xe_rtp_table_sr engine_was = XE_RTP_TABLE_SR(
 
 	/* Xe3p_LPG*/
 
-	{ XE_RTP_NAME("22021149932"),
+	{ XE_RTP_NAME("22021149932, 14026290593"),
 	  XE_RTP_RULES(GRAPHICS_VERSION(3510), GRAPHICS_STEP(A0, B0),
 		       FUNC(xe_rtp_match_first_render_or_compute)),
 	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0_UDW, SAMPLER_LD_LSC_DISABLE))
 	},
-	{ XE_RTP_NAME("14025676848"),
+	{ XE_RTP_NAME("14025676848, 14026270459"),
 	  XE_RTP_RULES(GRAPHICS_VERSION(3510), GRAPHICS_STEP(A0, B0),
 		       FUNC(xe_rtp_match_first_render_or_compute)),
 	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0_UDW, LSCFE_SAME_ADDRESS_ATOMICS_COALESCING_DISABLE))

---
base-commit: 10db0c83b0ccc3211990b54235475abb9d383851
change-id: 20260610-add-missing-wa-references-c58331fb7e55

Best regards,
--  
Gustavo Sousa <gustavo.sousa@intel.com>


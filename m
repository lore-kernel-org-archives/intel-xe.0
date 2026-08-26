Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58DB5C61DBD
	for <intel-xe@archiver.kernel.org>; Wed, 26 Aug 2026 17:12:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1546810EDA2;
	Wed, 26 Aug 2026 17:12:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KmmwwFU7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3F8B10EDA1
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Aug 2026 17:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787764324; x=1819300324;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AvLIq8ur6dn/u//b05p2EE+x8Ae7kzyWHToIqVYRwyg=;
 b=KmmwwFU7ntZ9SK+OnfpGl5EQAG+cC4lm7aVUApSa5Qh7qAi7s9Mj9rBI
 C5r2XtoNoYNNsNlB2E5HF0M6fGc2i5G3zj9P4wQFamV38A22JnycxvPj1
 Xcm/1rksykWE2CpRRLJii3c1FxIdReQiiWmjZs8tsOoR41P/4GnbZ1SfK
 IdEhfzAydYt0x8dnpOx1F6pGiWMSCfPBw1ERmyl8DE+7PTgR3IX5tx5h8
 m4yLFiLk3s7cZuMsYn52y/k1ACd4Zl6NA2afLuy5R5aypmapOvYk0dJuS
 cyHhU3pjTJfdqibbTx3OIRFFlMRrJW8FeCEgA/rsXJxea0q7x7if4vGOQ g==;
X-CSE-ConnectionGUID: ZtkCzXz/ShKE4ynFqvJ5/A==
X-CSE-MsgGUID: PEG74bbxTNKB01/5NEJrDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="88379122"
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; d="scan'208";a="88379122"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 10:12:04 -0700
X-CSE-ConnectionGUID: IKmJ0OJ2RCG0p7K9vwR0JQ==
X-CSE-MsgGUID: untLE2ckSymD7ANOSwUBAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; d="scan'208";a="261493122"
Received: from dceraolo-desk1.fm.intel.com (HELO dceraolo-desk1)
 ([10.121.64.189])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 10:12:04 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH v2 1/6] drm/xe: Define WCL as a PTL subplatform
Date: Wed, 26 Aug 2026 17:11:44 +0000
Message-ID: <20260826171149.708378-2-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260826171149.708378-1-daniele.ceraolospurio@intel.com>
References: <20260826171149.708378-1-daniele.ceraolospurio@intel.com>
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

WCL will support a different GSC binary than PTL, so we need to be able
to distinguish the two platforms.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c            | 6 ++++++
 drivers/gpu/drm/xe/xe_platform_types.h | 1 +
 2 files changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index ab4da1d9a9f1..0b2e91150c6d 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -437,6 +437,8 @@ static const struct xe_device_desc bmg_desc = {
 	.vm_max_level = 4,
 };
 
+static const u16 wcl_ids[] = { INTEL_WCL_IDS(NOP), 0 };
+
 static const struct xe_device_desc ptl_desc = {
 	PLATFORM(PANTHERLAKE),
 	.dma_mask_size = 46,
@@ -449,6 +451,10 @@ static const struct xe_device_desc ptl_desc = {
 	MULTI_LRC_MASK,
 	.needs_scratch = true,
 	.needs_shared_vf_gt_wq = true,
+	.subplatforms = (const struct xe_subplatform_desc[]) {
+		{ XE_SUBPLATFORM_WILDCATLAKE, "WCL", wcl_ids },
+		{ }
+	},
 	.va_bits = 48,
 	.vm_max_level = 4,
 };
diff --git a/drivers/gpu/drm/xe/xe_platform_types.h b/drivers/gpu/drm/xe/xe_platform_types.h
index 3447848b74e3..9399198278a0 100644
--- a/drivers/gpu/drm/xe/xe_platform_types.h
+++ b/drivers/gpu/drm/xe/xe_platform_types.h
@@ -38,6 +38,7 @@ enum xe_subplatform {
 	XE_SUBPLATFORM_DG2_G11,
 	XE_SUBPLATFORM_DG2_G12,
 	XE_SUBPLATFORM_BATTLEMAGE_G21,
+	XE_SUBPLATFORM_WILDCATLAKE,
 };
 
 #endif
-- 
2.53.0


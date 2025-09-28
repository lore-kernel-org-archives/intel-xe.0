Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DDFFCAC5B5
	for <intel-xe@archiver.kernel.org>; Sun, 28 Sep 2025 17:48:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9D1110E078;
	Sun, 28 Sep 2025 17:48:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gjLkaYPJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5159C10E078
 for <intel-xe@lists.freedesktop.org>; Sun, 28 Sep 2025 17:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759081706; x=1790617706;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=n3oHFGsolR6fskEem++NL280aMPbuT8vmaBJKk4PdoE=;
 b=gjLkaYPJ9Sx/648pPLOuAp+a94g3TxS4RNYclp6Gbp3gOZu36d+76XSk
 vfVNZRIdWRZOaX2/53eNwdVVjNyBe/nevZhGph0++gozUUOHFvlxiFOpY
 /eoT2HcUT7/fTVrj9dVMfvaLp4q6lZhIsk+gltGxMdA5aGDWeJ5wO75ZR
 YcUwPukr33jdZDnGKqaLpWu+zuxm6KYSg9HUI9i87mUhpXf/hg2mgG3jv
 GcyoIbZMCUrYmYGUnG+Qnt7v612ISCDpbKENLy9SzvXvAwH7MDkVrY2eh
 nKg7ogM90VzSBzjmiJPrD5BaCydzj97yNzcR8IhOo8ARFp2ww4ovlFEf+ g==;
X-CSE-ConnectionGUID: 8Qd4hLlyQmCOQWAa1ee65g==
X-CSE-MsgGUID: qcr3cqJxQSifFDCZSBRYBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11567"; a="61226666"
X-IronPort-AV: E=Sophos;i="6.18,300,1751266800"; d="scan'208";a="61226666"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2025 10:48:26 -0700
X-CSE-ConnectionGUID: jfm+tSMNRcWpEcaXY8DLEA==
X-CSE-MsgGUID: CYTM7yEeRmCizZ2bC7sbXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,300,1751266800"; d="scan'208";a="182459553"
Received: from jkhalil-mobl.amr.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.98.85])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2025 10:48:24 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 1/2] drm/xe/vf: Rename sriov_update_device_info
Date: Sun, 28 Sep 2025 19:48:10 +0200
Message-ID: <20250928174811.198933-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250928174811.198933-1-michal.wajdeczko@intel.com>
References: <20250928174811.198933-1-michal.wajdeczko@intel.com>
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

This is a VF only function and its name should reflect that to
avoid any confusion. Move the VF check to the caller side.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 09f8a66c9728..0421042597a2 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -688,16 +688,15 @@ static int wait_for_lmem_ready(struct xe_device *xe)
 }
 ALLOW_ERROR_INJECTION(wait_for_lmem_ready, ERRNO); /* See xe_pci_probe() */
 
-static void sriov_update_device_info(struct xe_device *xe)
+static void vf_update_device_info(struct xe_device *xe)
 {
+	xe_assert(xe, IS_SRIOV_VF(xe));
 	/* disable features that are not available/applicable to VFs */
-	if (IS_SRIOV_VF(xe)) {
-		xe->info.probe_display = 0;
-		xe->info.has_heci_cscfi = 0;
-		xe->info.has_heci_gscfi = 0;
-		xe->info.skip_guc_pc = 1;
-		xe->info.skip_pcode = 1;
-	}
+	xe->info.probe_display = 0;
+	xe->info.has_heci_cscfi = 0;
+	xe->info.has_heci_gscfi = 0;
+	xe->info.skip_guc_pc = 1;
+	xe->info.skip_pcode = 1;
 }
 
 static int xe_device_vram_alloc(struct xe_device *xe)
@@ -738,7 +737,8 @@ int xe_device_probe_early(struct xe_device *xe)
 
 	xe_sriov_probe_early(xe);
 
-	sriov_update_device_info(xe);
+	if (IS_SRIOV_VF(xe))
+		vf_update_device_info(xe);
 
 	err = xe_pcode_probe_early(xe);
 	if (err || xe_survivability_mode_is_requested(xe)) {
-- 
2.47.1


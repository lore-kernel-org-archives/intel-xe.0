Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B45CCD5BD0
	for <intel-xe@archiver.kernel.org>; Tue, 26 May 2026 14:19:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC1C610E50C;
	Tue, 26 May 2026 14:19:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UNb8PD6s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 658E410E6A5
 for <intel-xe@lists.freedesktop.org>; Tue, 26 May 2026 14:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779805166; x=1811341166;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ai8GHkcIx3DOLE3a4YPNUwJogsAwgRYcMrwxmZqqAbI=;
 b=UNb8PD6snDBCgftu4s39YZ3gywqTFSHNYSlqGjguoaFuiqNAkfbTZ042
 1iDV8N3cBDKueTYzKwNtco0ORInxpJaUh7FAtqnKUbYumdCDBtW+lqyGG
 zz7NACSXssYUU5kJCvHTayr3DWm+hl6eZRw6vcQJQStkb3OlnE25RqX99
 ghtuS6YS1AkSODXs1PAFYynqnmhOIBcsmGAuurNbjIPwOSX3d1tL+r7ic
 +7556V2HxzW/8z220MVgR8UuwO/mdjia0nRkqJfY73eRe21ajEpfcPkn1
 eZjy/HjZ6KAKzovPEhJwprfEW6HUazySTAdziP0QB0Fkb4lxoK7N0xMlV g==;
X-CSE-ConnectionGUID: rQziuc4oRXKVTO9ctIErXA==
X-CSE-MsgGUID: 0qI1lIJJR+uifIcvTvECIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="84505756"
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; d="scan'208";a="84505756"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 07:19:26 -0700
X-CSE-ConnectionGUID: L6CwIE6iQGmVKVJ+r5V2/w==
X-CSE-MsgGUID: +M81ggd+SBuU8OihReXAwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; d="scan'208";a="247015775"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.128])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 07:19:25 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH v3 10/10] drm/xe/guc: toggle paging engine support for NVL-S+
Date: Tue, 26 May 2026 15:19:12 +0100
Message-ID: <20260526141901.62207-22-matthew.auld@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260526141901.62207-12-matthew.auld@intel.com>
References: <20260526141901.62207-12-matthew.auld@intel.com>
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

NVL-S with latest GuC should be the first platform combo to
support the special GUC_PAGING_CLASS feature.

TODO: Check the final GuC ABI version before merging

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 2bc9fa5fb393..57ded0cf60a6 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -1848,6 +1848,9 @@ bool xe_guc_using_main_gamctrl_queues(struct xe_guc *guc)
 
 bool xe_guc_has_paging_engine(struct xe_guc *guc)
 {
+	struct xe_gt *gt = guc_to_gt(guc);
+	struct xe_device *xe = gt_to_xe(gt);
+
 	/*
 	 * On newer platforms the GuC now has a dedicated engine class for the
 	 * special PAGING engine, which is the driver reserved BCS engine used
@@ -1856,9 +1859,8 @@ bool xe_guc_has_paging_engine(struct xe_guc *guc)
 	 * engine here, this is purely a sw view in the GuC itself, which we
 	 * need to respect.
 	 */
-
-	/* TODO: Have some way to query this from the GuC? */
-	return false;
+	return GUC_SUBMIT_VER(guc) >= MAKE_GUC_VER(1, 35, 1) &&
+	       xe->info.platform >= XE_NOVALAKE_S;
 }
 
 #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
-- 
2.54.0


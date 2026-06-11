Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63A72CD98CE
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jun 2026 16:18:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2606110E827;
	Thu, 11 Jun 2026 16:18:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TZdobaUR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18DCA10EFF7
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jun 2026 16:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781194678; x=1812730678;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SOk9eSnzqLpPqW1W5Vt2/duniclRqAfb6kihI2bl9kc=;
 b=TZdobaURlUC0V9Q0nmHCEkJ4UsmKhrmB4dsQJkDts0i/PFtFHTj6c9jc
 2ijoxu6CRBP8ac5txNFOQbW2cC0rLQkgK/LElNFMh2R2M3yGxuuUIWxce
 igUyngFH3VS3O/OzXBmxe0Cj3OhEeSFZ94OMBZ6RppbGtvYNLskEh98rC
 GXtJHV0FaeB97aQXIEpTGyezUEtA9TOx4isrYdn1se/5GYWh2NOYCTf8V
 tzqUz0aV8UCzKglFs7TUrPg326bpN4j1X8OzyFx0TgBJYu55Wo6kTzTfg
 WKFUXOLAhIO32vlwNrqzk9T4SVVXzSOwYBtxC7gEwRJPpw8SDib/spJk2 g==;
X-CSE-ConnectionGUID: ISWIGPBvQq2G4fOIW5tCDw==
X-CSE-MsgGUID: IvHxbeTyTTqqreCnyBolAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="93403021"
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; d="scan'208";a="93403021"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 09:17:58 -0700
X-CSE-ConnectionGUID: UCMqOfHiSRST71z4zggV8g==
X-CSE-MsgGUID: daHeWc1QQTGb5CaqhAeA5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; d="scan'208";a="251617094"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.170])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 09:17:57 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH v6 10/10] drm/xe/guc: toggle paging engine support for NVL-S+
Date: Thu, 11 Jun 2026 17:16:45 +0100
Message-ID: <20260611161634.506476-22-matthew.auld@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260611161634.506476-12-matthew.auld@intel.com>
References: <20260611161634.506476-12-matthew.auld@intel.com>
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

v2:
  - Update with the final GuC version
v3:
  - Split VF vs PF versioning. Which is recommendation from GuC side.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 847c4d74d169..feae2d4f4482 100644
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
@@ -1857,8 +1860,11 @@ bool xe_guc_has_paging_engine(struct xe_guc *guc)
 	 * need to respect.
 	 */
 
-	/* TODO: Have some way to query this from the GuC? */
-	return false;
+	if (IS_SRIOV_VF(xe))
+		return xe_gt_sriov_vf_paging_engines(gt);
+
+	return xe->info.platform >= XE_NOVALAKE_S &&
+	       GUC_FIRMWARE_VER_AT_LEAST(guc, 70, 69, 0);
 }
 
 /**
-- 
2.54.0


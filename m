Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB9BFCD5BB6
	for <intel-xe@archiver.kernel.org>; Fri, 22 May 2026 12:37:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7086810F746;
	Fri, 22 May 2026 12:37:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QiC+KYTh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C52CF10F73E
 for <intel-xe@lists.freedesktop.org>; Fri, 22 May 2026 12:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779453465; x=1810989465;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=E4ANuDXJJo9pYbQTi9QJnK07ZECUxytc09AWrvjBa3o=;
 b=QiC+KYThqkECAYM4c8iV7N4+kf15kilxSmfhIbWA7eWbvD7TMvfp6cq6
 a3LspuF/kJ4dYmrVsfISRrCKeuVc7i9fTt1k2xh/NXOy0jQUnPUoNekck
 k/wNmYAuSZwj83oNFVj46zGJFPHyOcsXidOvhtoFwBKNueZEeiEf516As
 4uR4bgaccLs5xPCwwIsSafgVns++OzixbkPtFIyIS0COIX+OozFBpExzR
 O/68VZvsN1lHAMXruH92dEadQi5cewLBXOKB1af23WeWg9RVJekRHNklB
 dO7sIH8BoQ/nTDvqmub3ftTLC3Mx8tlRH2XgvNDBmeO6cEIzttA7LuS52 g==;
X-CSE-ConnectionGUID: DOhmgHr0T7u+PYMW1frCBA==
X-CSE-MsgGUID: nC/vyb8nR/ytATA5NAx9rw==
X-IronPort-AV: E=McAfee;i="6800,10657,11794"; a="84264595"
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; d="scan'208";a="84264595"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2026 05:37:45 -0700
X-CSE-ConnectionGUID: BkN56PvdTfe/BTG/8iIk5g==
X-CSE-MsgGUID: LsBmYuTOSbaxquuz5ZQpyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; d="scan'208";a="238302177"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.22])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2026 05:37:43 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH v2 10/10] drm/xe/guc: toggle paging engine support for NVL-S+
Date: Fri, 22 May 2026 13:37:31 +0100
Message-ID: <20260522123720.39656-22-matthew.auld@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260522123720.39656-12-matthew.auld@intel.com>
References: <20260522123720.39656-12-matthew.auld@intel.com>
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

NVL-S with newest GuC should be the first platform combo to
support the special GUC_PAGING_CLASS feature.

TODO: Check the final GuC ABI version before merging

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index cdbcad79b060..16a9ea8deeb3 100644
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
 	 * engine here, this purely a sw view in the GuC itself, which we need
 	 * to respect.
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


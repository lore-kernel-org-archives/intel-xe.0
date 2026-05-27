Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45E34CD6E44
	for <intel-xe@archiver.kernel.org>; Wed, 27 May 2026 11:14:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 051DD10E797;
	Wed, 27 May 2026 11:14:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hjjNjtqG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B218810E775
 for <intel-xe@lists.freedesktop.org>; Wed, 27 May 2026 11:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779880441; x=1811416441;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wJsEg01l3A7tqCSjOF8BBhQA4dGlqYVEP+fnEJcpurM=;
 b=hjjNjtqGqYHGdyQ2NC7Cos+CFQYHTEi5C+1GGP5YMdhOcFFcBwqv8VX0
 3+/MM8c17IcwvQ2Z3NpGIrQGSzWg8awjdH0dIJuE8iQCjIr20fehPCLbI
 w+K8po+U95OmtyGGxuKdd5qrM2CbO0TqliPZ9w1Aes8ob/IE3RtakCoRp
 aTtQHk7N/EWEV4Tz+TdU2Ct6sXkgCGJRvz1H+fzExQSCXuNdTdedsCL3P
 7aNNjRQ99ulXZW3uB0RhPsjwQrAENlFoyZvusGnlFv9kvUVAjCuZzzdFR
 gyPOJZY2FEirxp394WJmETutiVM+UKmY0ODTHVg9JgZZCq+pH3NCjgfbX g==;
X-CSE-ConnectionGUID: Qb6nQi4tTlKxNAMmk0xaBA==
X-CSE-MsgGUID: scdKDmHcQlqhL95PDrTsKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="80612999"
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; d="scan'208";a="80612999"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 04:14:01 -0700
X-CSE-ConnectionGUID: A+S7ZrX5R/iwUH6XRyM95g==
X-CSE-MsgGUID: xN/FqIzkTLe06eDbfCxaWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; d="scan'208";a="242371129"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.24])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 04:14:01 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH v4 10/10] drm/xe/guc: toggle paging engine support for NVL-S+
Date: Wed, 27 May 2026 12:13:46 +0100
Message-ID: <20260527111335.140000-22-matthew.auld@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260527111335.140000-12-matthew.auld@intel.com>
References: <20260527111335.140000-12-matthew.auld@intel.com>
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
index 847c4d74d169..c96b63e887b0 100644
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
 
 /**
-- 
2.54.0


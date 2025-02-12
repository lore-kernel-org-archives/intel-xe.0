Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45852C021A5
	for <intel-xe@archiver.kernel.org>; Wed, 12 Feb 2025 19:36:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DF6A10E97D;
	Wed, 12 Feb 2025 19:36:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lOKXP78b";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96DD410E21F
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Feb 2025 19:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739388996; x=1770924996;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IqLUj9Eis52xqlqoyKb4cDacOD0JmufrwvhmoKf6LTg=;
 b=lOKXP78b7dKtZ7tBdI8qtygIYtsCCiJ+qb1E/HzSgYFF8L4Lrjqv6yUS
 KPC3BH8Wmf8DqBjB0EqwXGk1qtE9TVwoGwiKmgLq0NeJpOch0HNuY/qCR
 vrutOdWBixdnqHtwZ/IsxPIFl5mbwGocxKFctaNce0HzGEjnBgpLXD28P
 HLUH1lKX0njmTMK4J8GPJKpXNN9B2f+G3HZ2H9gkN5gsKOmiC2XOBIyRQ
 uffN9cTzg1r99kMpeQLoaiQnbZ+H3j9BVd9GrMZxwiLiarLqmJsI+LqBf
 6Y/7SRq7TYOsA1wmgyJObskb8Ztw2bb7RJqqcPzpxdB7U2epQVjO3XknB A==;
X-CSE-ConnectionGUID: DGFiiUoCRkC3w9EOdMf7gQ==
X-CSE-MsgGUID: YdERJ5GFRXKU9LkpN1qYTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="40184245"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="40184245"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 11:36:35 -0800
X-CSE-ConnectionGUID: lxn1Bi+YRJGSeVLK2BdXaw==
X-CSE-MsgGUID: g0U9kkmFSCuEGuYieADChw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; d="scan'208";a="113437877"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 11:36:35 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v4 08/13] drm/xe: Cleanup extra calls to
 xe_hw_fence_irq_finish()
Date: Wed, 12 Feb 2025 11:35:55 -0800
Message-ID: <20250212193600.475089-9-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250212193600.475089-1-lucas.demarchi@intel.com>
References: <20250212193600.475089-1-lucas.demarchi@intel.com>
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

Now that xe_gt_remove is handled entirely by xe_gt, it's clear there are
some extra calls to xe_hw_fence_irq_finish() that aren't necessary.
Neither all_fw_domain_init() or gt_fw_domain_init() need to do that
since it's handled by the caller on any error.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index c33040278e1aa..bd16ca070dd20 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -389,13 +389,11 @@ static void dump_pat_on_error(struct xe_gt *gt)
 static int gt_fw_domain_init(struct xe_gt *gt)
 {
 	unsigned int fw_ref;
-	int err, i;
+	int err;
 
 	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
-	if (!fw_ref) {
-		err = -ETIMEDOUT;
-		goto err_hw_fence_irq;
-	}
+	if (!fw_ref)
+		return -ETIMEDOUT;
 
 	if (!xe_gt_is_media_type(gt)) {
 		err = xe_ggtt_init(gt_to_tile(gt)->mem.ggtt);
@@ -436,9 +434,6 @@ static int gt_fw_domain_init(struct xe_gt *gt)
 err_force_wake:
 	dump_pat_on_error(gt);
 	xe_force_wake_put(gt_to_fw(gt), fw_ref);
-err_hw_fence_irq:
-	for (i = 0; i < XE_ENGINE_CLASS_MAX; ++i)
-		xe_hw_fence_irq_finish(&gt->fence_irq[i]);
 
 	return err;
 }
@@ -446,7 +441,7 @@ static int gt_fw_domain_init(struct xe_gt *gt)
 static int all_fw_domain_init(struct xe_gt *gt)
 {
 	unsigned int fw_ref;
-	int err, i;
+	int err;
 
 	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL)) {
@@ -524,8 +519,6 @@ static int all_fw_domain_init(struct xe_gt *gt)
 
 err_force_wake:
 	xe_force_wake_put(gt_to_fw(gt), fw_ref);
-	for (i = 0; i < XE_ENGINE_CLASS_MAX; ++i)
-		xe_hw_fence_irq_finish(&gt->fence_irq[i]);
 
 	return err;
 }
-- 
2.48.1


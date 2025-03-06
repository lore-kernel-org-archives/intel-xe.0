Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A2DDC282D1
	for <intel-xe@archiver.kernel.org>; Thu,  6 Mar 2025 22:08:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B31610EA56;
	Thu,  6 Mar 2025 22:08:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OSa1e6Qa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FB3310EA94
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Mar 2025 22:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741298898; x=1772834898;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aEJwie03udIgkWSFRg1c/X7Y81OLZaHfsWmxuexzP1U=;
 b=OSa1e6Qa358SoKWZJka7v++i1CacTJfsQtKhYXyBOPEb+4UnfjppZpIh
 TStvQxtu4mkmfpsh0Wu9dCruWSHHjlrNBNgFOskh6E+zYjTQSuNu2Fnne
 3MZm34LpUXB5GdfFvTGbpyigcSX4E3n0ClFUjdRugi9jP8L9DXkpROX+Q
 R0kA++0F9UHRs7Ktn4wxpFlfM+lIdlWXRssH7Kxxp+PU5TwsiQfWIg2wm
 l+il1dtE8ml1wwAuPYiP63rIz4Dkaut66ZrdOww2/nQ1KEkSJNQcIJsHc
 NrJfkgQKIKdtgFSk7Tr2xuHotKnTzauESWMj/xxYkEltnv6/eKRG+6FMA g==;
X-CSE-ConnectionGUID: jxnVaX8xTDe1QjoY+Jb7XA==
X-CSE-MsgGUID: Bye89Y9wRwaizQ6t+de1gg==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="53735091"
X-IronPort-AV: E=Sophos;i="6.14,227,1736841600"; d="scan'208";a="53735091"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 14:08:18 -0800
X-CSE-ConnectionGUID: iMCo4FVeRDawsEzdLEJ5sg==
X-CSE-MsgGUID: G6p5Gt7QS5yseGeNeF2o8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,227,1736841600"; d="scan'208";a="119659579"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 14:08:17 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 1/2] drm/xe: Remove pointless gen11 assertions
Date: Thu,  6 Mar 2025 14:08:02 -0800
Message-ID: <20250306-drop-gen-v1-1-03683e56006a@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250306-drop-gen-v1-0-03683e56006a@intel.com>
References: <20250306-drop-gen-v1-0-03683e56006a@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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

xe driver doesn't really work in gen11. Stop asserting for >= 11,
as it would likely explode anyway if tried on such platforms.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_force_wake.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
index 4f6784e5abf88913b81a364bb393f6286d52be78..8a5cba22b58610224b854e42b9431dcae174ac1c 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.c
+++ b/drivers/gpu/drm/xe/xe_force_wake.c
@@ -49,9 +49,6 @@ void xe_force_wake_init_gt(struct xe_gt *gt, struct xe_force_wake *fw)
 	fw->gt = gt;
 	spin_lock_init(&fw->lock);
 
-	/* Assuming gen11+ so assert this assumption is correct */
-	xe_gt_assert(gt, GRAPHICS_VER(gt_to_xe(gt)) >= 11);
-
 	if (xe->info.graphics_verx100 >= 1270) {
 		init_domain(fw, XE_FW_DOMAIN_ID_GT,
 			    FORCEWAKE_GT,
@@ -67,9 +64,6 @@ void xe_force_wake_init_engines(struct xe_gt *gt, struct xe_force_wake *fw)
 {
 	int i, j;
 
-	/* Assuming gen11+ so assert this assumption is correct */
-	xe_gt_assert(gt, GRAPHICS_VER(gt_to_xe(gt)) >= 11);
-
 	if (!xe_gt_is_media_type(gt))
 		init_domain(fw, XE_FW_DOMAIN_ID_RENDER,
 			    FORCEWAKE_RENDER,

-- 
2.48.1

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9442BD2A521
	for <intel-xe@archiver.kernel.org>; Wed, 16 Oct 2024 14:26:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A98010E17B;
	Wed, 16 Oct 2024 14:26:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XoXOIhmp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 994E110E17B
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Oct 2024 14:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729088774; x=1760624774;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=tcdWKIH/WReGVH+kR6gjHgb7tjK/GnYsIrfS8L640oc=;
 b=XoXOIhmpdEdvXYI7Ivp92BaqWTrfPYS8YB64yyWtGa9IKGf2dleBPSHF
 M10lpfHTM4n/S144vNi9SubNif+aN5H1WOEjTZPAbxo33z0ItwLgMt3bY
 0M4jzxzE/VlvuEwGovKeOd+z91vSGoshTV/lFRYDBIkpUoi2NFC97tm/G
 0/yUU1W2sZMv3EqR8BoCw6AuLdMBIN4ews5WpVEOPzq6tO7F+MDUfPY0G
 GpwE07eZxzNoXzLj9huJ42SWwTr1Hi6VqbA4xVYbuHRAl5UzASZC7N0kv
 nafJeeqD/rCfniGQj+1mpskEHvV+59BzynkjPYoE/Qxukugfp5891siH7 g==;
X-CSE-ConnectionGUID: AUgpdRNCRf6/HzIELgF9ow==
X-CSE-MsgGUID: he9xZMVpTCaZ8spK0GrcYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28634666"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="28634666"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2024 07:26:14 -0700
X-CSE-ConnectionGUID: 45CZQ5nhT2ac/sB5Xg0x6w==
X-CSE-MsgGUID: RvezO8XhQvGgkH93eKB7Lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,208,1725346800"; d="scan'208";a="83004117"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2024 07:26:14 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>,
	Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH] drm/xe: Add caller info to xe_gt_reset_async
Date: Wed, 16 Oct 2024 15:44:05 +0200
Message-ID: <20241016134405.769682-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany, Commercial Register: Amtsgericht Muenchen HRB 186928
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

Add caller info to the xe_gt_reset_async() to help debug issues.

Cc: Matthew Auld <matthew.auld@intel.com>
Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2874
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 1c79660fb086..51324c7da0a9 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -834,7 +834,7 @@ static void gt_reset_worker(struct work_struct *w)
 
 void xe_gt_reset_async(struct xe_gt *gt)
 {
-	xe_gt_info(gt, "trying reset\n");
+	xe_gt_info(gt, "trying reset from %pS\n", __builtin_return_address(0));
 
 	/* Don't do a reset while one is already in flight */
 	if (!xe_fault_inject_gt_reset() && xe_uc_reset_prepare(&gt->uc))
-- 
2.46.0


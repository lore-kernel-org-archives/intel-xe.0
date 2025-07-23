Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D27AAC83F17
	for <intel-xe@archiver.kernel.org>; Wed, 23 Jul 2025 13:30:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A60710E0F6;
	Wed, 23 Jul 2025 13:30:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OOEiPUJS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A00A10E7CB
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Jul 2025 13:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753277427; x=1784813427;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5juYsznCdgOuHbi4dZ7jrcd9rENfXqE9/8ccnh9Sp/M=;
 b=OOEiPUJSpTSiW1xHmeGdkx2DZf9bhQ0GuIMclkiQkrRwAVDdI6ogLSS0
 CrFscFhodVVxylCnsT1T41oyp/tWdLY3rtRWd/4YY7STl1e55Sy8QaYB3
 gyJEWf9U0cALkZYIm2JtMuNbXoJj0oMMlboY4Jq+SwTHNSMVqVMBsT9bk
 OibFrtYToLhNhEHb52eB0gLGGkOXuALeslZEFkuJukH3gqOs8un4HJnaL
 6Kz8giyByGGpHIMJ3B/3ufCm6njxheGom/xmG4QEsBegsnWIOq808NOHJ
 2+9176oqh6lYoElP44LXNeEMQKODDhPBVC2iso5oTAnPHkt74RSbwlYLs A==;
X-CSE-ConnectionGUID: BDVtdaxnSqyl64yCCdMaeg==
X-CSE-MsgGUID: hZfTpvQARiegGfH9WDrdMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="55438012"
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; d="scan'208";a="55438012"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 06:30:26 -0700
X-CSE-ConnectionGUID: yiVOjcThQOKYEDjZUThYBg==
X-CSE-MsgGUID: 2U5VV8d4REKhE+VBeP5xbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; d="scan'208";a="160047114"
Received: from egore-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.116.1])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 06:30:25 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH] drm/xe: Make GGTT TLB invalidation failure message GT oriented
Date: Wed, 23 Jul 2025 15:30:15 +0200
Message-ID: <20250723133015.206601-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
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

GGTT TLB invalidation is performed on the specific GT, thus any
failure message shall be also GT specific. And to help investigate
any unexpected failures, promote message from warn level to WARN
to get full call stack of this unlikely case.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_ggtt.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 29d4d3f51da1..249713139f69 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -439,8 +439,7 @@ static void ggtt_invalidate_gt_tlb(struct xe_gt *gt)
 		return;
 
 	err = xe_gt_tlb_invalidation_ggtt(gt);
-	if (err)
-		drm_warn(&gt_to_xe(gt)->drm, "xe_gt_tlb_invalidation_ggtt error=%d", err);
+	xe_gt_WARN(gt, err, "Failed to invalidate GGTT (%pe)", ERR_PTR(err));
 }
 
 static void xe_ggtt_invalidate(struct xe_ggtt *ggtt)
-- 
2.47.1


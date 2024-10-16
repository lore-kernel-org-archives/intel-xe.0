Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D06FAD2A526
	for <intel-xe@archiver.kernel.org>; Wed, 16 Oct 2024 14:59:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9677710E0A6;
	Wed, 16 Oct 2024 14:59:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BtXPxhDf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 771E010E0A6
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Oct 2024 14:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729090767; x=1760626767;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zLCSMRqjm6aEz8q/7WhCdZCdUdS6KBb5SiSSrruidMo=;
 b=BtXPxhDfsICaF9/nPufimm+iK+H/izjHKy0ayaJ1IrZB5GtrImZ3kj27
 nZ0MbeIZLI8adleO+PRAZ/BuwRN7NqE0EL40A/nURlaiDaUzQgDO2loKd
 Yiz9plD0OlTnifxwCzPVMrMzXxjyKxmPze01P6IhzbEVlnv75iGluw6K0
 1RjXVJCQjyfjNzeQEbON3e5QCAqrSyMxKgWmOpbF6kbeaCA0bD6Fqyi2s
 sYqHvZxaZD8CJTNnYqQhMOI9Ydsaque4fpWnzdBPzw0ldwLUPVVnje3AK
 eCvNyFTi+0nT3CzjcP4l9EfWr3jVCTdqQYwulbwRiiulgXUe9XPYWI3it A==;
X-CSE-ConnectionGUID: jW+nMzM1QCKdKfRLK1IQXQ==
X-CSE-MsgGUID: Q7MSmonBTPKevRzDCMVzuA==
X-IronPort-AV: E=McAfee;i="6700,10204,11226"; a="32343832"
X-IronPort-AV: E=Sophos;i="6.11,208,1725346800"; d="scan'208";a="32343832"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2024 07:59:27 -0700
X-CSE-ConnectionGUID: ljuoo2reSEet7vXojgFrNw==
X-CSE-MsgGUID: QntCeb4iS6m6IN1bIshkUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,208,1725346800"; d="scan'208";a="78699746"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2024 07:59:25 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>,
	Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH v2] drm/xe: Add caller info to xe_gt_reset_async
Date: Wed, 16 Oct 2024 16:17:17 +0200
Message-ID: <20241016141717.881143-1-nirmoy.das@intel.com>
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

v2: s/%pS/%ps(Matt)

Cc: Matthew Auld <matthew.auld@intel.com>
Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2874
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 1c79660fb086..df2fe4005d85 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -834,7 +834,7 @@ static void gt_reset_worker(struct work_struct *w)
 
 void xe_gt_reset_async(struct xe_gt *gt)
 {
-	xe_gt_info(gt, "trying reset\n");
+	xe_gt_info(gt, "trying reset from %ps\n", __builtin_return_address(0));
 
 	/* Don't do a reset while one is already in flight */
 	if (!xe_fault_inject_gt_reset() && xe_uc_reset_prepare(&gt->uc))
-- 
2.46.0


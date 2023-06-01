Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDB9AC77B7A
	for <intel-xe@archiver.kernel.org>; Thu,  1 Jun 2023 12:35:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDCEA10E13A;
	Thu,  1 Jun 2023 12:35:24 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8D9310E13A
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Jun 2023 12:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685622922; x=1717158922;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gn7s1SLFNEoOa1KFeN1HAH0Ulj3g6Mzod6El9n1surE=;
 b=BdSZJvTB/fIBcBsDuftL0NsjN6T87+MISYOA0JbIeBJTwY8qygJEVvie
 s6XZ6uslKSJQICEIhyl2BgJ0mtfkNz4FCIZ6vL6M/vRqg9bhs47LSxTpI
 7qd0rYISR8WBNYhk6tCDc4VRkBg2Epesg48fbcPGC1YxqC/q3WyY1yIX3
 doiuReGtzbihz1bqbXl1TwCDKWsPuyfjFffw+3lzBGmVY2tVgpa6sZw/z
 JdW/kWeHgTc8XlNgMZTHhw4YdJ2wjTNdm7zFoXYuRTxMiBIT0piRty9yz
 c+vjNJ5Nl7zMcy77qUNskpiVsOHUaBD/fkF/ec6rpZJwaL+NZLGckYYwd Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="358818325"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; d="scan'208";a="358818325"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2023 05:35:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="797134608"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; d="scan'208";a="797134608"
Received: from aswhelan-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.20.240])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2023 05:35:18 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  1 Jun 2023 13:35:05 +0100
Message-Id: <20230601123505.646031-1-matthew.auld@intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe/vm: fix double list add
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

It looks like the driver only wants to track one vma for each external
object per vm. However it looks like bo_has_vm_references_locked() will
ignore any vma that is marked as vma->destroyed (not actually destroyed
yet). If we then mark our externally tracked vma as destroyed and then
create a new vma for the same object and vm, we can have two externally
tracked vma for the same object and vm. When the destroy actually
happens it tries to move the external tracking to a different vma, but
in this case it is already being tracked, leading to double list add
errors. It should be safe to simply drop the destroyed check in
bo_has_vm_references(), since the actual destroy will switch the
external tracking to the next available vma.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/290
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index dd1335e12d4c..5aa2aeb14beb 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -964,7 +964,7 @@ bo_has_vm_references_locked(struct xe_bo *bo, struct xe_vm *vm,
 	struct xe_vma *vma;
 
 	list_for_each_entry(vma, &bo->vmas, bo_link) {
-		if (vma != ignore && vma->vm == vm && !vma->destroyed)
+		if (vma != ignore && vma->vm == vm)
 			return vma;
 	}
 
-- 
2.40.1


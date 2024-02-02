Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57564C4828F
	for <intel-xe@archiver.kernel.org>; Fri,  2 Feb 2024 17:15:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01A1610EFD9;
	Fri,  2 Feb 2024 17:15:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="haiLnaHC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5321410EFD9
 for <intel-xe@lists.freedesktop.org>; Fri,  2 Feb 2024 17:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706894119; x=1738430119;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PVWde+wHaqDdwRFVkvYd4OCMLpTkkvsIi5YDW55q/q4=;
 b=haiLnaHCHGpEz19XVYDRrHscXz2hER5Az4eUx4CEv33t5tJZRXywqFDJ
 QeASJLBY882PrWtbRVQrrFI1//8nl9+eLusBY5UFclNDqRgP7cmwQPMfd
 BN2gxv+zt23BcUDm0wuHLViGZaWRv1l17WCkIQtBbVNP8iU99XDRKSVCk
 ymf/58TimUkPS9taRUjjzYX2EBtbimjGVyALn4Xn5NtY6o3I3ddaw9K/Z
 PZWpioqpx6x1LCWLB+5OBgry0LaLe7M84xrpkktQr5ZEd+inaKrkzf4Hx
 UgzMyC295Ei1+apjuAfzsCI4dWM996ziUEE1CeyHt4ZUd0EHEZQ6X0FCx Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="10801793"
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; d="scan'208";a="10801793"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2024 09:15:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="4875989"
Received: from mpenny-mobl1.ger.corp.intel.com (HELO mwauld-mobl1.intel.com)
 ([10.252.0.116])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2024 09:15:17 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH] drm/xe/vm: don't ignore error when in_kthread
Date: Fri,  2 Feb 2024 17:14:36 +0000
Message-ID: <20240202171435.427630-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

If GUP fails and we are in_kthread, we can have pinned = 0 and ret = 0.
If that happens we call sg_alloc_append_table_from_pages() with n_pages
= 0, which is not well behaved and can trigger:

kernel BUG at include/linux/scatterlist.h:115!

depending on if the pages array happens to be zeroed or not. Even if we
don't hit that it crashes later when trying to dma_map the returned
table.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 9c1c68a2fff7..63aeb3aead04 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -114,11 +114,8 @@ int xe_vma_userptr_pin_pages(struct xe_userptr_vma *uvma)
 					  num_pages - pinned,
 					  read_only ? 0 : FOLL_WRITE,
 					  &pages[pinned]);
-		if (ret < 0) {
-			if (in_kthread)
-				ret = 0;
+		if (ret < 0)
 			break;
-		}
 
 		pinned += ret;
 		ret = 0;
-- 
2.43.0


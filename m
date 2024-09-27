Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2571CEBF63
	for <intel-xe@archiver.kernel.org>; Fri, 27 Sep 2024 00:36:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BEBC10EBF0;
	Fri, 27 Sep 2024 00:36:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nf9QC4yX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 451ED10EBF0
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Sep 2024 00:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727397411; x=1758933411;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=248vTeyacrkvRlKl0A7w6jCGnEFuNn+eVHeyGecwcpA=;
 b=Nf9QC4yXMIJTCYtyLwHUvsda5Na8aAue2tdGBKb55XBzdK/Wz8yX2/ux
 dsMthF1HYmBHXxQwZrSnMgbnJbk1IiVQ6S0zkS13Bl+uIk9ZU8K1mSbYK
 qD/rxlzSskNRdTpqYr6db87uVUajYB/8AydbxA2tD5cXi3fwe5cc8XcUc
 wP6rDn/XkCaxxGU4sWyaDngdyRv0L+N3uI454T24zQdWoKnzdH1F78I7H
 wFIoGkob8DDFNI4ZMa2OKlaSb8zQcWWm6q+lT4JZSuORZz2ciVF2RnmDO
 RSa+YvqUxNZCUAADMt/ljc+mXySbgWXqOVuKWq/90pLtNvoAhCv9CC/Yn w==;
X-CSE-ConnectionGUID: +deQvmdTQbCvdBpzg7nubQ==
X-CSE-MsgGUID: +s5NGsvjShaJ/AHLhSKnZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="26665447"
X-IronPort-AV: E=Sophos;i="6.11,157,1725346800"; d="scan'208";a="26665447"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2024 17:36:51 -0700
X-CSE-ConnectionGUID: luNXRIMAQ/2swsj8IEE0QQ==
X-CSE-MsgGUID: yYymcJBYSxaraV6cLj4FOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,157,1725346800"; d="scan'208";a="73139055"
Received: from przanoni-mobl.jf.intel.com ([10.24.12.124])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2024 17:36:52 -0700
From: Paulo Zanoni <paulo.r.zanoni@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Paulo Zanoni <paulo.r.zanoni@intel.com>
Subject: [RFC PATCH] drm/xe: fix memory leaks on vm_bind_ioctl failure paths
Date: Thu, 26 Sep 2024 17:36:33 -0700
Message-ID: <20240927003633.92560-1-paulo.r.zanoni@intel.com>
X-Mailer: git-send-email 2.45.2
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

Caught by kmemleak when running Vulkan CTS tests on LNL. The leak
seems to happen only when there's some kind of failure happening, like
the lack of memory. Example output:

unreferenced object 0xffff9120bdf62000 (size 8192):
  comm "deqp-vk", pid 115008, jiffies 4310295728
  hex dump (first 32 bytes):
    00 00 00 00 00 00 00 00 1b 05 f9 28 01 00 00 40  ...........(...@
    00 00 00 00 00 00 00 00 1b 15 f9 28 01 00 00 40  ...........(...@
  backtrace (crc 7a56be79):
    [<ffffffff86dd81f0>] __kmalloc_cache_noprof+0x310/0x3d0
    [<ffffffffc08e8211>] xe_pt_new_shared.constprop.0+0x81/0xb0 [xe]
    [<ffffffffc08e8309>] xe_pt_insert_entry+0xb9/0x140 [xe]
    [<ffffffffc08eab6d>] xe_pt_stage_bind_entry+0x12d/0x5b0 [xe]
    [<ffffffffc08ecbca>] xe_pt_walk_range+0xea/0x280 [xe]
    [<ffffffffc08eccea>] xe_pt_walk_range+0x20a/0x280 [xe]
    [<ffffffffc08eccea>] xe_pt_walk_range+0x20a/0x280 [xe]
    [<ffffffffc08eccea>] xe_pt_walk_range+0x20a/0x280 [xe]
    [<ffffffffc08eccea>] xe_pt_walk_range+0x20a/0x280 [xe]
    [<ffffffffc08e9eff>] xe_pt_stage_bind.constprop.0+0x25f/0x580 [xe]
    [<ffffffffc08eb21a>] bind_op_prepare+0xea/0x6e0 [xe]
    [<ffffffffc08ebab8>] xe_pt_update_ops_prepare+0x1c8/0x440 [xe]
    [<ffffffffc08ffbf3>] ops_execute+0x143/0x850 [xe]
    [<ffffffffc0900b64>] vm_bind_ioctl_ops_execute+0x244/0x800 [xe]
    [<ffffffffc0906467>] xe_vm_bind_ioctl+0x1877/0x2370 [xe]
    [<ffffffffc05e92b3>] drm_ioctl_kernel+0xb3/0x110 [drm]
unreferenced object 0xffff9120bdf72000 (size 8192):
  comm "deqp-vk", pid 115008, jiffies 4310295728
  hex dump (first 32 bytes):
    6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
    6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
  backtrace (crc 23b2f0b5):
    [<ffffffff86dd81f0>] __kmalloc_cache_noprof+0x310/0x3d0
    [<ffffffffc08e8211>] xe_pt_new_shared.constprop.0+0x81/0xb0 [xe]
    [<ffffffffc08e8453>] xe_pt_stage_unbind_post_descend+0xb3/0x150 [xe]
    [<ffffffffc08ecd26>] xe_pt_walk_range+0x246/0x280 [xe]
    [<ffffffffc08eccea>] xe_pt_walk_range+0x20a/0x280 [xe]
    [<ffffffffc08eccea>] xe_pt_walk_range+0x20a/0x280 [xe]
    [<ffffffffc08eccea>] xe_pt_walk_range+0x20a/0x280 [xe]
    [<ffffffffc08ece31>] xe_pt_walk_shared+0xc1/0x110 [xe]
    [<ffffffffc08e7b2a>] xe_pt_stage_unbind+0x9a/0xd0 [xe]
    [<ffffffffc08e913d>] unbind_op_prepare+0xdd/0x270 [xe]
    [<ffffffffc08eb9f6>] xe_pt_update_ops_prepare+0x106/0x440 [xe]
    [<ffffffffc08ffbf3>] ops_execute+0x143/0x850 [xe]
    [<ffffffffc0900b64>] vm_bind_ioctl_ops_execute+0x244/0x800 [xe]
    [<ffffffffc0906467>] xe_vm_bind_ioctl+0x1877/0x2370 [xe]
    [<ffffffffc05e92b3>] drm_ioctl_kernel+0xb3/0x110 [drm]
    [<ffffffffc05e95a0>] drm_ioctl+0x280/0x4e0 [drm]

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2877
Signed-off-by: Paulo Zanoni <paulo.r.zanoni@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c | 42 +++++++++++++++++++++++---------------
 1 file changed, 25 insertions(+), 17 deletions(-)

PS: I'm not super confident that this is the right place to do this
since I'm not too familiar with this code and pointer ownership
changes a lot here. Still, this patch seems to work on my system, so
it may serve as a good conversation starter.

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index d6353e8969f0..212f7de645df 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -921,18 +921,23 @@ static void xe_pt_abort_bind(struct xe_vma *vma,
 		if (!rebind)
 			pt->num_live -= entries[i].qwords;
 
-		if (!pt->level)
-			continue;
-
-		pt_dir = as_xe_pt_dir(pt);
-		for (j = 0; j < entries[i].qwords; j++) {
-			u32 j_ = j + entries[i].ofs;
-			struct xe_pt *newpte = xe_pt_entry(pt_dir, j_);
-			struct xe_pt *oldpte = entries[i].pt_entries[j].pt;
-
-			pt_dir->children[j_] = oldpte ? &oldpte->base : 0;
-			xe_pt_destroy(newpte, xe_vma_vm(vma)->flags, NULL);
+		if (pt->level) {
+			pt_dir = as_xe_pt_dir(pt);
+			for (j = 0; j < entries[i].qwords; j++) {
+				u32 j_ = j + entries[i].ofs;
+				struct xe_pt *newpte = xe_pt_entry(pt_dir, j_);
+				struct xe_pt *oldpte =
+					entries[i].pt_entries[j].pt;
+
+				pt_dir->children[j_] = oldpte ?
+					&oldpte->base : 0;
+				xe_pt_destroy(newpte, xe_vma_vm(vma)->flags,
+					      NULL);
+			}
 		}
+
+		if (entries[i].pt_entries)
+			kfree(entries[i].pt_entries);
 	}
 }
 
@@ -1564,13 +1569,16 @@ static void xe_pt_abort_unbind(struct xe_vma *vma,
 
 		pt->num_live += entry->qwords;
 
-		if (!pt->level)
-			continue;
+		if (pt->level) {
+			for (j = entry->ofs; j < entry->ofs + entry->qwords; j++)
+				pt_dir->children[j] =
+					entries[i].pt_entries[j - entry->ofs].pt ?
+						&entries[i].pt_entries[j - entry->ofs].pt->base :
+						NULL;
+		}
 
-		for (j = entry->ofs; j < entry->ofs + entry->qwords; j++)
-			pt_dir->children[j] =
-				entries[i].pt_entries[j - entry->ofs].pt ?
-				&entries[i].pt_entries[j - entry->ofs].pt->base : NULL;
+		if (entry->pt_entries)
+			kfree(entry->pt_entries);
 	}
 }
 
-- 
2.45.2


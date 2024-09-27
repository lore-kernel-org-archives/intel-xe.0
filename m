Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1809CF648B
	for <intel-xe@archiver.kernel.org>; Fri, 27 Sep 2024 23:21:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82E0710E0EB;
	Fri, 27 Sep 2024 23:21:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YQilE6F2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B7F510E0EB
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Sep 2024 23:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727479286; x=1759015286;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=uJ2Lzk1kwHuCUFzUI/wESFwI64d9yDakGSeaG1/jDI4=;
 b=YQilE6F2l3Hn5WRWSOWOgy9cNAqGVhc5Lxfb/qgUyNWGgw/boR3rinXV
 zM7BEtUTnhQfe+6MbR8ZJACEOT/dox+4J7mFrICxVqDroBZ8L9RYgcSXT
 xOqoD3qiWB+gG/I0k+7+1yguAO1j2dxOhLytxKqHbuvVKt9FbL1yqi115
 GTmYob5YPM+HaW0OuVRTU66XFHcpKSPRDtdhb1jqaGvBXEqrSpT8a3dnn
 /twk/dnAbwA/YAhjeEUpP1z4ac204i4gzLeBPnjKdUr6UiU8FgqOjKNVp
 1cl2KS/RPnQ6fDhemAS5VzKurDrkoMaMmH+Ms5DL/Y0eC8ZaAN8BQmP+z A==;
X-CSE-ConnectionGUID: 8EY+qR7STuuDAdX2wlKGEA==
X-CSE-MsgGUID: S5mzaRgcQ++0oFS815CrYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="49161971"
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; d="scan'208";a="49161971"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2024 16:21:25 -0700
X-CSE-ConnectionGUID: f2cKo3yXSresiBXHyai+YA==
X-CSE-MsgGUID: DYXJU/f/Q0WAtKWPXAY8fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; d="scan'208";a="72358079"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2024 16:21:24 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: paulo.r.zanoni@intel.com
Subject: [PATCH] drm/xe: Fix memory leak when aborting binds
Date: Fri, 27 Sep 2024 16:22:28 -0700
Message-Id: <20240927232228.3255246-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

Make sure to call xe_pt_update_ops_fini in xe_pt_update_ops_abort to
free any memory the bind allocated.

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

Reported-by: Paulo Zanoni <paulo.r.zanoni@intel.com>
Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2877
Fixes: a708f6501c69 ("drm/xe: Update PT layer with better error handling")
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index d6353e8969f0..f27f579f4d85 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -2188,5 +2188,5 @@ void xe_pt_update_ops_abort(struct xe_tile *tile, struct xe_vma_ops *vops)
 					   pt_op->num_entries);
 	}
 
-	xe_bo_put_commit(&vops->pt_update_ops[tile->id].deferred);
+	xe_pt_update_ops_fini(tile, vops);
 }
-- 
2.34.1


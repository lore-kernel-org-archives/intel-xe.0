Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05591C04FDE
	for <intel-xe@archiver.kernel.org>; Thu,  9 Nov 2023 15:46:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0902410E901;
	Thu,  9 Nov 2023 15:46:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF47910E8DB
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Nov 2023 15:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699544771; x=1731080771;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DdZz2QwconGumgHhpHYfq7fRD1YanJXRUGP6Mp0X3O0=;
 b=hh2NRLnmcVrd3B07+s7Djpik2jxS2Cmrp2gZCrpgCftOhCoG0g1mT92w
 UCwhXkQLe86F0u+sZ1/OWL/2NZskoBYuxjKy1FtY9iVWVT4FD+Lc6z9od
 TQyGABb8blPsO2cydbTsE1hoQQihSQJbwojhnRag+rDghBZkHZJrvxYXt
 CU+FBili8Bqd007B0HFARBIJ9Bj3gEgtFb16//CkQlKpFQYIYvJ+RF68n
 bzozZ7Cb8bgUrjo7rE//x3f8eKRUr3kjBzVTAKuC30+Z27cpYCfVAg0z7
 XFxUk1pKOfCi0JlnRpw7L/3CXk4J+asJximrRnx3OlZ1M9GOYts+3w2TY w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="11556811"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; d="scan'208";a="11556811"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 07:45:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="936886074"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; d="scan'208";a="936886074"
Received: from hschreib-mobl.ger.corp.intel.com (HELO ac699de916ef.intel.com)
 ([10.249.42.184])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 07:45:55 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  9 Nov 2023 15:44:47 +0000
Message-Id: <20231109154457.7-34-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231109154457.7-1-francois.dugast@intel.com>
References: <20231109154457.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 33/43] drm/xe/uapi: Convert tile_mask to a
 pt_placement_hint
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
Cc: Francois Dugast <francois.dugast@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Rodrigo Vivi <rodrigo.vivi@intel.com>

The previous tile_mask was also an optional hint, and only used
for the page-table tree placement. However, it was so tied
with the tile concept itself. Let's clarify things up and make
this generic enough. So accept any valid memory region mask.
It could even be a direct near_mem_region gotten from the engine_info.
pt stands for page table.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 14 ++++++++++----
 include/uapi/drm/xe_drm.h  | 16 +++++++++++++---
 2 files changed, 23 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index f8559ebad9bc..ad3b5ea6f91a 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3018,11 +3018,16 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 			goto release_vm_lock;
 		}
 
-		if (bind_ops[i].tile_mask) {
+		if (bind_ops[i].pt_placement_hint) {
 			u64 valid_tiles = BIT(xe->info.tile_count) - 1;
+			/*
+			 * System memory is currently ignored from this hint,
+			 * which gets entirely converted to a tile_mask
+			 */
+			u8 system_memory = 0x1;
 
-			if (XE_IOCTL_DBG(xe, bind_ops[i].tile_mask &
-					 ~valid_tiles)) {
+			if (XE_IOCTL_DBG(xe, bind_ops[i].pt_placement_hint &
+					 ~valid_tiles & ~system_memory)) {
 				err = -EINVAL;
 				goto release_vm_lock;
 			}
@@ -3099,7 +3104,8 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		u32 op = bind_ops[i].op;
 		u32 flags = bind_ops[i].flags;
 		u64 obj_offset = bind_ops[i].obj_offset;
-		u8 tile_mask = bind_ops[i].tile_mask;
+		/* Remove the system memory bit when converting to tiles */
+		u8 tile_mask = bind_ops[i].pt_placement_hint & ~0x1;
 		u32 prefetch_region = bind_ops[i].prefetch_mem_region_instance;
 
 		ops[i] = vm_bind_ioctl_ops_create(vm, bos[i], obj_offset,
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 3cbfc17d9ffa..144a423868cf 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -853,10 +853,20 @@ struct drm_xe_vm_bind_op {
 	__u64 addr;
 
 	/**
-	 * @tile_mask: Mask for which tiles to create binds for, 0 == All tiles,
-	 * only applies to creating new VMAs
+	 * @pt_placement_hint: An optional memory_region bit-mask hint, which
+	 * only applies when creating new VMAs. Default value '0' is the
+	 * recommended value.
+	 *
+	 * It hints the optimal placement for the page-table tree for this VMA.
+	 * For instance, when userspace is using engines living in a secondary
+	 * tile with allocated BOs near those engines, that same
+	 * @near_mem_region could be used in this hint field.
+	 *
+	 * Since it is a hint, the Xe kernel driver is free to ignore this mask
+	 * and choose the best location for the page-table, taking into
+	 * consideration the running hardware and runtime constrains.
 	 */
-	__u64 tile_mask;
+	__u64 pt_placement_hint;
 
 #define DRM_XE_VM_BIND_OP_MAP		0x0
 #define DRM_XE_VM_BIND_OP_UNMAP		0x1
-- 
2.34.1


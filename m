Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C870FFEFB53
	for <intel-xe@archiver.kernel.org>; Fri, 27 Feb 2026 13:45:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8865F10EB77;
	Fri, 27 Feb 2026 13:45:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aKfdaG9L";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3BD710EB72
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Feb 2026 13:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772199932; x=1803735932;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sy/XX/STjvQy3axu5aVScrtk35s0J5v3K2Wrv40gM2o=;
 b=aKfdaG9LItHi/RScXj7hMPNYWxpMKkyDV+9tnwDzrdOaP5+h0gsrnCLI
 d79FysY8I4i5dqW/9bNHHuONzzMjo4NRYpP1J++6/O02kMiMYm5qDGexb
 yG4ADN/pdrINTBXPkgIQdLYcsCU1tUeDVCUCKTyohjJ98b5LomBCHXQkU
 9BMCzG6CuND4N8hu+YUlCdWzDlE6+0f3GTO4QXIyb69x2xUgaRXyhUx4Q
 ra28xfU4jAyQw/QyIcvBrOYAWqKI9xSTUK/rM/5j/M7gJBfwH9IyUAL3g
 xJkeNppx2RerH5zE1/nHdcQE+kXeBFydNFU2CySZEU8Rbr+9Lm4x8mmWm Q==;
X-CSE-ConnectionGUID: ttMhsEC1TUeFD7hfIubqzQ==
X-CSE-MsgGUID: bU9OSD1kT5e4rqxssp35qA==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="84633187"
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; d="scan'208";a="84633187"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 05:45:32 -0800
X-CSE-ConnectionGUID: 8DFTMKpQRPmOJyPoJH4n1g==
X-CSE-MsgGUID: zb5M6wQhQJiN7xWDnTmA+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; d="scan'208";a="216021739"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 05:45:31 -0800
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.auld@intel.com, thomas.hellstrom@linux.intel.com,
 matthew.brost@intel.com, Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [RFC PATCH V4 5/7] drm/buddy: Add routine to dump allocated buddy
 blocks
Date: Fri, 27 Feb 2026 19:14:42 +0530
Message-ID: <20260227134453.1814649-14-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260227134453.1814649-9-tejas.upadhyay@intel.com>
References: <20260227134453.1814649-9-tejas.upadhyay@intel.com>
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

To implement the ability to see allocated blocks under a specific VRAM
instance in the drm driver, new api is introduced. While existing structs
often show the free block list, this addition provides a comprehensive view
of all currently resident VRAM allocations.

Dump will look like,

[  +0.000003] xe 0000:03:00.0: [drm] 0x00000002f8000000-0x00000002f8800000: 8388608
[  +0.000005] xe 0000:03:00.0: [drm] 0x00000002f8800000-0x00000002f8840000: 262144
[  +0.000004] xe 0000:03:00.0: [drm] 0x00000002f8840000-0x00000002f8860000: 131072
[  +0.000004] xe 0000:03:00.0: [drm] 0x00000002f8860000-0x00000002f8870000: 65536
[  +0.000005] xe 0000:03:00.0: [drm] 0x00000002f9000000-0x00000002f9800000: 8388608
[  +0.000004] xe 0000:03:00.0: [drm] 0x00000002f9800000-0x00000002f9880000: 524288
[  +0.000005] xe 0000:03:00.0: [drm] 0x00000002f9880000-0x00000002f9884000: 16384
[  +0.000004] xe 0000:03:00.0: [drm] 0x00000002f9900000-0x00000002f9980000: 524288
[  +0.000005] xe 0000:03:00.0: [drm] 0x00000002f9980000-0x00000002f9988000: 32768
[  +0.000004] xe 0000:03:00.0: [drm] 0x00000002f9988000-0x00000002f998c000: 16384

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/drm_buddy.c | 43 +++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
index 2f279b46bd2c..6baafbad49f2 100644
--- a/drivers/gpu/drm/drm_buddy.c
+++ b/drivers/gpu/drm/drm_buddy.c
@@ -1065,6 +1065,49 @@ int drm_buddy_block_trim(struct drm_buddy *mm,
 }
 EXPORT_SYMBOL(drm_buddy_block_trim);
 
+/**
+ * drm_buddy_dump_allocated_blocks - print all allocated blocks in drm buddy
+ *
+ * @dev: drm device
+ * @mm: DRM buddy manager to look into
+ * @p: drm printer to print info
+ *
+ * Looks into buddy manager for each block and their status and if allocated
+ * print allocated block range and size
+ *
+ * Returns:
+ * void
+ */
+void drm_buddy_dump_allocated_blocks(struct drm_device *dev, struct drm_buddy *mm,
+				     struct drm_printer *p)
+{
+	struct drm_buddy_block *block;
+	LIST_HEAD(dfs);
+	int i;
+
+	for (i = 0; i < mm->n_roots; ++i)
+		list_add_tail(&mm->roots[i]->tmp_link, &dfs);
+
+	do {
+		block = list_first_entry_or_null(&dfs,
+						 struct drm_buddy_block,
+						 tmp_link);
+		if (!block)
+			break;
+
+		list_del(&block->tmp_link);
+
+		if (drm_buddy_block_is_allocated(block))
+			drm_buddy_block_print(mm, block, p);
+
+		if (drm_buddy_block_is_split(block)) {
+			list_add(&block->right->tmp_link, &dfs);
+			list_add(&block->left->tmp_link, &dfs);
+		}
+	} while (1);
+}
+EXPORT_SYMBOL(drm_buddy_dump_allocated_blocks);
+
 static struct drm_buddy_block *
 __drm_buddy_alloc_blocks(struct drm_buddy *mm,
 			 u64 start, u64 end,
-- 
2.52.0


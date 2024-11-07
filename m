Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78CD8D4337C
	for <intel-xe@archiver.kernel.org>; Thu,  7 Nov 2024 16:35:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0030410E88B;
	Thu,  7 Nov 2024 16:35:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ibzj1Ymn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B58D510E88B
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Nov 2024 16:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730997311; x=1762533311;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ff0ArFXlgCLnFmm38APXqkRE7hoa9xml0amfCbh5Z5A=;
 b=ibzj1Ymn+OEz8hMMG4cXS0wmI+TJxXd3Hrahf/+k2soKV8YgEhl6YbS5
 qiGj5GJdd204sP0SvK0rpfo7L7KB/DV6+h1LDJ1Uus1jTFwOHFrCmfQBT
 jMMiNtLmAme9lFE6JT+mOUdIlulNDIK9SMXuDy3TFuKYoTTIFFtXaXJjJ
 BMDNLdsnZbLnicycs6n9YgrEpm27GncwWMqFjlrXbasF4MgzSX6X4P84N
 l8C04GLiIHSSb8LpVXqnVT3AG2qrq+RHf7vU7mrfNUN/SmskY/djvLlov
 HO7zEqy2F1oyydRYHLi7QmCBnLegihA35SNNeNfCBNbwE1dzFHes+br+2 A==;
X-CSE-ConnectionGUID: 2aqTnVf0TVekT84Q7bKOGw==
X-CSE-MsgGUID: eBWPqQggSCSpSBfQEdG6pg==
X-IronPort-AV: E=McAfee;i="6700,10204,11249"; a="18480145"
X-IronPort-AV: E=Sophos;i="6.12,135,1728975600"; d="scan'208";a="18480145"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2024 08:35:11 -0800
X-CSE-ConnectionGUID: CRUVL+VXS9OWOUlfCE2SLQ==
X-CSE-MsgGUID: YmUsCqvtQIq4CK9Vmzucog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,135,1728975600"; d="scan'208";a="89797036"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.2.138])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2024 08:35:10 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Tomasz Lis <tomasz.lis@intel.com>, Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 3/4] drm/xe: Add read/write debugfs helpers for GGTT node
Date: Thu,  7 Nov 2024 17:34:47 +0100
Message-Id: <20241107163448.2123-4-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20241107163448.2123-1-michal.wajdeczko@intel.com>
References: <20241107163448.2123-1-michal.wajdeczko@intel.com>
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

In upcoming patch we want to allow copying and updating PTEs
of some GGTT nodes over debugfs. Add simple helpers for that.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Tomasz Lis <tomasz.lis@intel.com> #v1
Cc: Matthew Brost <matthew.brost@intel.com>
---
v2: promote simple_{read,write}_{from,to}_iomem (Matt)
---
 drivers/gpu/drm/xe/xe_ggtt.c | 52 ++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_ggtt.h |  7 +++++
 2 files changed, 59 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 558fac8bb6fb..07f5b4c0e6c9 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -838,3 +838,55 @@ u64 xe_ggtt_print_holes(struct xe_ggtt *ggtt, u64 alignment, struct drm_printer
 
 	return total;
 }
+
+#ifdef CONFIG_DEBUG_FS
+
+/**
+ * xe_ggtt_node_read() - Copy PTEs from the GGTT node to the user space buffer
+ * @node: the GGTT node to read from
+ * @buf: the user space buffer to read to
+ * @count: the maximum number of bytes to read
+ * @ppos: the current position
+ *
+ * Return: On success, the number of bytes read is returned and the offset
+ * @ppos is advanced by this number, or negative value is returned on error.
+ */
+ssize_t xe_ggtt_node_read(struct xe_ggtt_node *node, char __user *buf,
+			  size_t count, loff_t *ppos)
+{
+	if (!xe_ggtt_node_allocated(node))
+		return 0;
+
+	xe_tile_assert(node->ggtt->tile, IS_ALIGNED(node->base.start, XE_PAGE_SIZE));
+	xe_tile_assert(node->ggtt->tile, IS_ALIGNED(node->base.size, XE_PAGE_SIZE));
+
+	return simple_read_from_iomem(buf, count, ppos,
+				      &node->ggtt->gsm[node->base.start / XE_PAGE_SIZE],
+				      size_mul(sizeof(u64), node->base.size / XE_PAGE_SIZE));
+}
+
+/**
+ * xe_ggtt_node_write() - Update PTEs of the GGTT node using data from the user space buffer
+ * @node: the GGTT node to write to
+ * @buf: the user space buffer to read from
+ * @count: the maximum number of bytes to read
+ * @ppos: the current position
+ *
+ * Return: On success, the number of bytes written is returned and the offset
+ * @ppos is advanced by this number, or negative value is returned on error.
+ */
+ssize_t xe_ggtt_node_write(struct xe_ggtt_node *node, const char __user *buf,
+			   size_t count, loff_t *ppos)
+{
+	if (!xe_ggtt_node_allocated(node))
+		return -ENXIO;
+
+	xe_tile_assert(node->ggtt->tile, IS_ALIGNED(node->base.start, XE_PAGE_SIZE));
+	xe_tile_assert(node->ggtt->tile, IS_ALIGNED(node->base.size, XE_PAGE_SIZE));
+
+	return simple_write_to_iomem(&node->ggtt->gsm[node->base.start / XE_PAGE_SIZE],
+				     size_mul(sizeof(u64), node->base.size / XE_PAGE_SIZE),
+				     ppos, buf, count);
+}
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
index 27e7d67de004..64746e23053e 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.h
+++ b/drivers/gpu/drm/xe/xe_ggtt.h
@@ -34,6 +34,13 @@ u64 xe_ggtt_largest_hole(struct xe_ggtt *ggtt, u64 alignment, u64 *spare);
 int xe_ggtt_dump(struct xe_ggtt *ggtt, struct drm_printer *p);
 u64 xe_ggtt_print_holes(struct xe_ggtt *ggtt, u64 alignment, struct drm_printer *p);
 
+#ifdef CONFIG_DEBUG_FS
+ssize_t xe_ggtt_node_read(struct xe_ggtt_node *node, char __user *buf,
+			  size_t count, loff_t *pos);
+ssize_t xe_ggtt_node_write(struct xe_ggtt_node *node, const char __user *buf,
+			   size_t count, loff_t *pos);
+#endif
+
 #ifdef CONFIG_PCI_IOV
 void xe_ggtt_assign(const struct xe_ggtt_node *node, u16 vfid);
 #endif
-- 
2.43.0


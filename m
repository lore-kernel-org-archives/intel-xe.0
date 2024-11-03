Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6469D11190
	for <intel-xe@archiver.kernel.org>; Sun,  3 Nov 2024 20:16:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6294610E170;
	Sun,  3 Nov 2024 20:16:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TwK1gSSq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDCC210E170
 for <intel-xe@lists.freedesktop.org>; Sun,  3 Nov 2024 20:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730665007; x=1762201007;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2lrOhGGTDF9suxCVz7iP2LoPW9a3XuJ6nvniL/O7kEQ=;
 b=TwK1gSSqDQyAGm1wpfBSCvc5nDBduKbOQSVCkdgQTz5D0spbetDo5qIh
 PDz2pdukK8BXfV3jJp5o5CU+kfDxvJ/5K8m+hfCRZse9CBzBw7Qyjlb2o
 hCx1eltjQClXkYHuLaewY0HT5yN6wbvOvCiK/dS3qStvfM5Yn9X0AMhdw
 1TfmReENfn9jJ7mymz1nZweWi2a5alw7+7BYEzeAWxSLAA1dJJv2lPqml
 xBbbPZA8zzRK8vDGAXCNm1VMglMpQ6xYDBsbygvxA5Bsax6HIaZKZaYzi
 3urPLBqA/3DksEmpfnlkUHAd5LvISJR1WPaUtXeQhvLmMLDqKf9+IELTB g==;
X-CSE-ConnectionGUID: uDXGL/ccRf6zyblnLEW+3Q==
X-CSE-MsgGUID: 55sAh44sSwey2UamnQW85w==
X-IronPort-AV: E=McAfee;i="6700,10204,11245"; a="30462112"
X-IronPort-AV: E=Sophos;i="6.11,255,1725346800"; d="scan'208";a="30462112"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2024 12:16:46 -0800
X-CSE-ConnectionGUID: FonBlwXNTg2oUz60AU/MBw==
X-CSE-MsgGUID: hohIIlIfTByRNgX6WYZ70Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,255,1725346800"; d="scan'208";a="87982576"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.85.128])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2024 12:16:46 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 1/2] drm/xe: Add read/write debugfs helpers for GGTT node
Date: Sun,  3 Nov 2024 21:16:32 +0100
Message-Id: <20241103201633.1859-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20241103201633.1859-1-michal.wajdeczko@intel.com>
References: <20241103201633.1859-1-michal.wajdeczko@intel.com>
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

In upcoming patch we want to allow copying and updating PTEs of
some GGTT nodes over debugfs. Add simple helpers for that.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_ggtt.c | 178 +++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_ggtt.h |   7 ++
 2 files changed, 185 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 558fac8bb6fb..e003f5f51ac6 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -838,3 +838,181 @@ u64 xe_ggtt_print_holes(struct xe_ggtt *ggtt, u64 alignment, struct drm_printer
 
 	return total;
 }
+
+#ifdef CONFIG_DEBUG_FS
+
+static size_t copy_iomem_to_user_by_chunk(void __user *to, const void __iomem *from,
+					  size_t count, void *buf, size_t size)
+{
+	size_t chunk;
+	size_t rem;
+
+	while (count) {
+		chunk = umin(count, size);
+		memcpy_fromio(buf, from, chunk);
+		rem = copy_to_user(to, buf, chunk);
+		count -= chunk - rem;
+		if (rem)
+			break;
+		from += chunk;
+		to += chunk;
+	}
+
+	return count;
+}
+
+static size_t copy_iomem_to_user(void __user *to, const void __iomem *from, size_t count)
+{
+	char chunk[64];
+	size_t size;
+	size_t rem;
+	void *buf;
+
+	if (!count)
+		return 0;
+
+	size = count > sizeof(chunk) ? umin(PAGE_SIZE, count) : 0;
+	buf = size ? kmalloc(size, GFP_NOWAIT | __GFP_NORETRY) : NULL;
+	if (buf) {
+		rem = copy_iomem_to_user_by_chunk(to, from, count, buf, size);
+		kfree(buf);
+		return rem;
+	}
+
+	return copy_iomem_to_user_by_chunk(to, from, count, chunk, sizeof(chunk));
+}
+
+static ssize_t simple_read_from_iomem(void __user *to, size_t count, loff_t *ppos,
+				      const void __iomem *from, size_t available)
+{
+	loff_t pos = *ppos;
+	size_t rem;
+
+	if (pos < 0)
+		return -EINVAL;
+	if (pos >= available || !count)
+		return 0;
+	if (count > available - pos)
+		count = available - pos;
+
+	rem = copy_iomem_to_user(to, from + pos, count);
+	if (rem == count)
+		return -EFAULT;
+
+	count -= rem;
+	*ppos = pos + count;
+	return count;
+}
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
+static size_t copy_iomem_from_user_by_chunk(void __iomem *to, const void __user *from,
+					    size_t count, void *buf, size_t size)
+{
+	size_t chunk;
+	size_t rem;
+
+	while (count) {
+		chunk = umin(count, size);
+		rem = copy_from_user(buf, from, chunk);
+		memcpy_toio(to, buf, chunk - rem);
+		count -= chunk - rem;
+		if (rem)
+			break;
+		from += chunk;
+		to += chunk;
+	}
+
+	return count;
+}
+
+static size_t copy_iomem_from_user(void __iomem *to, const void __user *from, size_t count)
+{
+	char chunk[64];
+	size_t size;
+	size_t rem;
+	void *buf;
+
+	if (!count)
+		return 0;
+
+	size = count > sizeof(chunk) ? umin(PAGE_SIZE, count) : 0;
+	buf = size ? kmalloc(size, GFP_NOWAIT | __GFP_NORETRY) : NULL;
+	if (buf) {
+		rem = copy_iomem_from_user_by_chunk(to, from, count, buf, size);
+		kfree(buf);
+		return rem;
+	}
+
+	return copy_iomem_from_user_by_chunk(to, from, count, chunk, sizeof(chunk));
+}
+
+static ssize_t simple_write_to_iomem(void __iomem *to, size_t available, loff_t *ppos,
+				     const void __user *from, size_t count)
+{
+	loff_t pos = *ppos;
+	size_t rem;
+
+	if (pos < 0)
+		return -EINVAL;
+	if (pos >= available || !count)
+		return 0;
+	if (count > available - pos)
+		count = available - pos;
+
+	rem = copy_iomem_from_user(to + pos, from, count);
+	if (rem == count)
+		return -EFAULT;
+
+	count -= rem;
+	*ppos = pos + count;
+	return count;
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


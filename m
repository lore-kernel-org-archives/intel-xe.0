Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2C64D41D7C
	for <intel-xe@archiver.kernel.org>; Tue, 12 Nov 2024 20:05:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9470710E645;
	Tue, 12 Nov 2024 20:05:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MekXmydD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A02FB10E645
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Nov 2024 20:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731441936; x=1762977936;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ff0ArFXlgCLnFmm38APXqkRE7hoa9xml0amfCbh5Z5A=;
 b=MekXmydDenGZXdURKNK7c53PJePTgmwPwa6T0+tnXP6VduOWRTD8F3KE
 w4riiD1bx5zavXQt17ocj18IaOJ3+0ECrl6JnB2mKWpfD6iwpwFVRSxi/
 9P8maMUwRpdP3SdUZDoBhVKWWSMW36tsWv9DhgvQ9NrYSz/6KZCTBURUa
 Jh4ZmH54hqUCxqZjvX1gWFAfYWFCSjl4oGdP7GH5bIysaLCWOk+fukJew
 Edq1kVCzjiPazcGLAtdWYhb+rTj/aIMSwtkPrufF4fm/RcwcoDLoFUkVy
 7wxYMJYX/pzl+CROp9fnSZGUdXPxyCJ08IngK7LPyzoSixeiddom3+SR/ Q==;
X-CSE-ConnectionGUID: QB8OKntCRSKEhIj/0fuoXQ==
X-CSE-MsgGUID: HBsmMnIFTdCLFuZLnMsV0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="31394382"
X-IronPort-AV: E=Sophos;i="6.12,149,1728975600"; d="scan'208";a="31394382"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 12:05:36 -0800
X-CSE-ConnectionGUID: dhNFmeV7QMSDeUmAzWroMw==
X-CSE-MsgGUID: 6GE9FTIrQ32ckbSZIjhGdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,149,1728975600"; d="scan'208";a="92710382"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.85.128])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 12:05:34 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Tomasz Lis <tomasz.lis@intel.com>, Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v2 3/4] drm/xe: Add read/write debugfs helpers for GGTT node
Date: Tue, 12 Nov 2024 21:04:53 +0100
Message-Id: <20241112200454.2211-4-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20241112200454.2211-1-michal.wajdeczko@intel.com>
References: <20241112200454.2211-1-michal.wajdeczko@intel.com>
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


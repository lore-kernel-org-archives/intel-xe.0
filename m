Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 384A2C43458
	for <intel-xe@archiver.kernel.org>; Mon, 13 Jul 2026 02:27:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7ABE10E52A;
	Mon, 13 Jul 2026 02:27:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DLroABS7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CF7510E4B9
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Jul 2026 02:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783909662; x=1815445662;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Qr+j0HyAXg2zTkakwl1eCG825nuzKFKhOvKU8FrkfNw=;
 b=DLroABS7i3uYgSSJLcLWpIUV6aEVVf5KlA6cdMnxHtjPCIT9Mj/nwGun
 HeXW1zTPxGMUSX8OBWgHSnQ655DYQDCzdlUa4lvA5X1zinF/63Z19b8Cy
 wE3U5WtWsYBB3BJ+6lalGze4fYYqIccZXDTcis3I1jMNXOEI8kX3UdxHn
 9USzc+GUmtGK853vlcbztZiQRmLiFhoRflncR7RtoUb1bxGpQODr6JTh1
 IClRYapa7xdfU+tEw7eSWMEP7ioQ5G65e8UgSzlBVOCWasDFPOM9+khAo
 UVkoUpSRBMn8/qTK0lAZrrEjlt8JewkTt2pnjQroiNwWcbLL233oOuIrp A==;
X-CSE-ConnectionGUID: TYRZ2DOWRv2P5mEAKgxDuQ==
X-CSE-MsgGUID: 96MfbEQfQY+Smag3bHChOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="88197452"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="88197452"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2026 19:27:42 -0700
X-CSE-ConnectionGUID: +1+BsZ4LSkOS9qqL0btZqg==
X-CSE-MsgGUID: u7xe+t5oS8Ot7UoMU02KOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="253680032"
Received: from gfx-coremm-kmd15.iind.intel.com ([10.223.55.8])
 by orviesa006.jf.intel.com with ESMTP; 12 Jul 2026 19:27:41 -0700
From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com,
	naresh.kumar.g@intel.com
Subject: [PATCH v4 3/8] drm/xe/debugfs: add page-size allocation mode knob
Date: Mon, 13 Jul 2026 07:55:36 +0530
Message-ID: <20260713022541.2581814-4-naresh.kumar.g@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260713022541.2581814-1-naresh.kumar.g@intel.com>
References: <20260713022541.2581814-1-naresh.kumar.g@intel.com>
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

Expose a debugfs control to override the page-size allocation mode used
for user BOs.

The interface allows switching between the default allocation policy,
forced 2M, forced 1G, and mixed allocation modes at runtime. This
provides a simple way to validate behavior and debug page-size-dependent
allocation flows.

The debugfs entry is built only when CONFIG_DRM_XE_DEBUG_PAGE_SIZE is
enabled.

v2
- update changelog to match mutex-based cur_index handling
- reset cur_index when switching to mixed mode (sashiko)

v3
- add CONFIG guard for page-size allocation debugfs support (Himal)
- create debugfs entry under CONFIG_DRM_XE_DEBUG_PAGE_SIZE

v4
- reorderd this patch with kconfig patch to ensure patch builds
- Gurding this debug knob for only discrete graphics

Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
---
 drivers/gpu/drm/xe/xe_debugfs.c | 62 +++++++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index 8c391c7b017a..6ab2d51033f8 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -564,6 +564,56 @@ static const struct file_operations disable_late_binding_fops = {
 	.write = disable_late_binding_set,
 };
 
+#if IS_ENABLED(CONFIG_DRM_XE_DEBUG_PAGE_SIZE)
+static ssize_t page_size_alloc_mode_show(struct file *f, char __user *ubuf,
+					 size_t size, loff_t *pos)
+{
+	struct xe_device *xe = file_inode(f)->i_private;
+	char buf[32];
+	int len;
+
+	mutex_lock(&xe->page_size_alloc_ctrl.lock);
+
+	len = scnprintf(buf, sizeof(buf), "%u\n",
+			xe->page_size_alloc_ctrl.mode);
+	mutex_unlock(&xe->page_size_alloc_ctrl.lock);
+
+	return simple_read_from_buffer(ubuf, size, pos, buf, len);
+}
+
+static ssize_t page_size_alloc_mode_set(struct file *f, const char __user *ubuf,
+					size_t size, loff_t *pos)
+{
+	struct xe_device *xe = file_inode(f)->i_private;
+	unsigned int val;
+	int ret;
+
+	ret = kstrtouint_from_user(ubuf, size, 0, &val);
+	if (ret)
+		return ret;
+
+	if (val > XE_PAGE_SIZE_ALLOC_CTRL_MODE_MIXED)
+		return -EINVAL;
+
+	mutex_lock(&xe->page_size_alloc_ctrl.lock);
+
+	if (val == XE_PAGE_SIZE_ALLOC_CTRL_MODE_MIXED)
+		xe->page_size_alloc_ctrl.cur_index = 0;
+
+	xe->page_size_alloc_ctrl.mode = (enum xe_page_size_alloc_ctrl_mode)val;
+
+	mutex_unlock(&xe->page_size_alloc_ctrl.lock);
+
+	return size;
+}
+
+static const struct file_operations page_size_alloc_mode_fops = {
+	.owner = THIS_MODULE,
+	.read = page_size_alloc_mode_show,
+	.write = page_size_alloc_mode_set,
+};
+#endif
+
 void xe_debugfs_register(struct xe_device *xe)
 {
 	struct ttm_device *bdev = &xe->ttm;
@@ -616,6 +666,18 @@ void xe_debugfs_register(struct xe_device *xe)
 
 	debugfs_create_file("disable_late_binding", 0600, root, xe,
 			    &disable_late_binding_fops);
+#if IS_ENABLED(CONFIG_DRM_XE_DEBUG_PAGE_SIZE)
+	/*
+	 * Expose a debugfs knob to control user BO page-size allocation:
+	 * 0 - default behavior
+	 * 1 - force 2M page allocations
+	 * 2 - force 1G page allocations
+	 * 3 - mixed mode: select 4K, 64K, 2M, and 1G in round-robin order
+	 */
+	if (IS_DGFX(xe))
+		debugfs_create_file("page_size_alloc_mode", 0600, root, xe,
+				    &page_size_alloc_mode_fops);
+#endif
 
 	/*
 	 * Don't expose page reclaim configuration file if not supported by the
-- 
2.43.0


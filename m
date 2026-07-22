Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 593EBC4453C
	for <intel-xe@archiver.kernel.org>; Wed, 22 Jul 2026 14:37:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 115A310EE19;
	Wed, 22 Jul 2026 14:37:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BjrQZkPK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE8E610EE15
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Jul 2026 14:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784731074; x=1816267074;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Z9V4jVpYsfjTjpvilDK2mGKj4UCxOzbs/Zu1CKmhS4s=;
 b=BjrQZkPKvrKvPc8LeU+xCGhfQJMQ+OSJtTa3PwJJvOj3xo6hOskqlOh2
 A4Km0UedHJEjK7cP/n/vUas9Iq965ZSy4ujXbXBcm+xAGH0DWhEPVlgFv
 2MAchzlkPKkxDqUfPDXFVEKhW35QefCKj7H7S880UWduUwu+pRd5W0yAB
 OxgL2QqPlkSE6eNgc9KX9/MXOgWMbJeurbReV0Xbl/PQFtlfSPYlLypzb
 8LOmcXv8jWWeFp0qAema6HYSaQOm5vZnEpJH+e3fhVvWAEtu4Tr+mMzYS
 vvxhQVJODuHTlbnzcLJTHL124pKQmp5RjDoAow+FUfKHHSA02WJsK2uob g==;
X-CSE-ConnectionGUID: K7lijb0zRWOBlM0AKUA/rQ==
X-CSE-MsgGUID: iz8F0GpETNCUiYfrxLWAKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="102777843"
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; d="scan'208";a="102777843"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2026 07:37:54 -0700
X-CSE-ConnectionGUID: t9tjbyU7Sp6q4Veld5EJLg==
X-CSE-MsgGUID: AX/lsI6HRzqFbIhQPfbQag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; d="scan'208";a="261653201"
Received: from gfx-coremm-kmd15.iind.intel.com ([10.223.55.8])
 by orviesa003.jf.intel.com with ESMTP; 22 Jul 2026 07:37:53 -0700
From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com,
	naresh.kumar.g@intel.com
Subject: [PATCH v8 2/6] drm/xe/debugfs: add page-size allocation mode knob
Date: Wed, 22 Jul 2026 20:07:55 +0530
Message-ID: <20260722143759.1718600-3-naresh.kumar.g@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260722143759.1718600-1-naresh.kumar.g@intel.com>
References: <20260722143759.1718600-1-naresh.kumar.g@intel.com>
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

v5(Himal)
- Guard all page size calls with CONFIG_DRM_XE_DEBUG_PAGE_SIZE

v8(Himal)
- For read/show used READ_ONCE instead lock
- to match Reader used WRITE_ONCE under lock protection
- change modes to string format to read/writer for debugfs

Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
---
 drivers/gpu/drm/xe/xe_debugfs.c | 88 +++++++++++++++++++++++++++++++++
 1 file changed, 88 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index 5a3877fcb0f0..a1da0e0e6190 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -614,6 +614,82 @@ static const struct file_operations disable_late_binding_fops = {
 	.write = disable_late_binding_set,
 };
 
+#ifdef CONFIG_DRM_XE_DEBUG_PAGE_SIZE
+
+static const struct {
+	const char *mode_name;
+	enum xe_page_size_alloc_ctrl_mode mode;
+} page_size_alloc_modes[] = {
+	{ "none", XE_PAGE_SIZE_ALLOC_CTRL_MODE_NONE },
+	{ "only_2m", XE_PAGE_SIZE_ALLOC_CTRL_MODE_ONLY_2M },
+	{ "only_1g", XE_PAGE_SIZE_ALLOC_CTRL_MODE_ONLY_1G },
+	{ "mixed", XE_PAGE_SIZE_ALLOC_CTRL_MODE_MIXED },
+};
+
+static ssize_t page_size_alloc_mode_show(struct file *f, char __user *ubuf,
+					 size_t size, loff_t *pos)
+{
+	struct xe_device *xe = file_inode(f)->i_private;
+	char buf[32];
+	int len;
+	enum xe_page_size_alloc_ctrl_mode mode;
+	size_t i;
+
+	mode = READ_ONCE(xe->page_size_alloc_ctrl.mode);
+
+	for (i = 0; i < ARRAY_SIZE(page_size_alloc_modes); i++) {
+		if (page_size_alloc_modes[i].mode == mode)
+			break;
+	}
+
+	len = scnprintf(buf, sizeof(buf), "%s\n",
+			page_size_alloc_modes[i].mode_name);
+	return simple_read_from_buffer(ubuf, size, pos, buf, len);
+}
+
+static ssize_t page_size_alloc_mode_set(struct file *f, const char __user *ubuf,
+					size_t size, loff_t *pos)
+{
+	struct xe_device *xe = file_inode(f)->i_private;
+	int ret;
+	char buf[32];
+	size_t i;
+
+	if (*pos)
+		return -ESPIPE;
+
+	if (size > sizeof(buf) - 1)
+		return -EINVAL;
+
+	ret = simple_write_to_buffer(buf, sizeof(buf) - 1, pos, ubuf, size);
+	if (ret < 0)
+		return ret;
+	buf[ret] = '\0';
+
+	for (i = 0; i < ARRAY_SIZE(page_size_alloc_modes); i++) {
+		if (sysfs_streq(buf, page_size_alloc_modes[i].mode_name)) {
+			mutex_lock(&xe->page_size_alloc_ctrl.lock);
+			if (page_size_alloc_modes[i].mode ==
+			    XE_PAGE_SIZE_ALLOC_CTRL_MODE_MIXED)
+				xe->page_size_alloc_ctrl.cur_index = 0;
+
+			WRITE_ONCE(xe->page_size_alloc_ctrl.mode,
+				   page_size_alloc_modes[i].mode);
+			mutex_unlock(&xe->page_size_alloc_ctrl.lock);
+			return size;
+		}
+	}
+
+	return -EINVAL;
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
@@ -665,6 +741,18 @@ void xe_debugfs_register(struct xe_device *xe)
 	debugfs_create_file("disable_late_binding", 0600, root, xe,
 			    &disable_late_binding_fops);
 
+#ifdef CONFIG_DRM_XE_DEBUG_PAGE_SIZE
+	/*
+	 * Expose a debugfs knob to control user BO page-size allocation:
+	 * "none"    - default behavior
+	 * "only_2m" - force 2M page allocations
+	 * "only_1g" - force 1G page allocations
+	 * "mixed"   - select 4K, 64K, 2M, and 1G in round-robin order
+	 */
+	if (xe_debug_page_size_supported(xe))
+		debugfs_create_file("page_size_alloc_mode", 0600, root, xe,
+				    &page_size_alloc_mode_fops);
+#endif
 	/*
 	 * Don't expose page reclaim configuration file if not supported by the
 	 * hardware initially.
-- 
2.43.0


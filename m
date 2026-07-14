Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96B5BC44507
	for <intel-xe@archiver.kernel.org>; Tue, 14 Jul 2026 10:54:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56A8B10E059;
	Tue, 14 Jul 2026 10:54:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZUIROW4o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8939710E066
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Jul 2026 10:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784026476; x=1815562476;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vVtl9XfEx126qpgrxNL1tlwtSNebnBZ8EFTKt7zaNkk=;
 b=ZUIROW4oau7yPclaL8HAHQJO9ifOQYb9mzrbaSuSQzV/27qixVsVhcz7
 XNJGg1VQY42Je+AiYnnhnzppOG89N1NZLPg77KyztGyflzmnS7CYONn0s
 bNsdGhptyQbQmYz5fxmblW7vq6cFRD5hpxMjcHC0S9Kil5v4n/DJoYwRd
 TwQv+w5Ypzy55cVeQwJYh0oJjf548Q2ZjgEaf1ieOppmQ2bTfdu+LkGli
 uqrqGwnpX+GcrFm8VAfOLmHhrRfm+Dxs+2MAVtuv6uUd30yiuztzWddu3
 yndIAHigYVGouX4NVBzCImDLUlsO9ukrHcF90oSuMPY6zDX7xX7swFTCE w==;
X-CSE-ConnectionGUID: CRHfqVTARXKxXgdPQj1l/g==
X-CSE-MsgGUID: FrfQdco4TiOmrm3oTiUIZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11846"; a="84839586"
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; d="scan'208";a="84839586"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2026 03:54:36 -0700
X-CSE-ConnectionGUID: nAyOyqzHQMGJ9xpLA3KyKg==
X-CSE-MsgGUID: KBgz3k5fT5WbQj/NG9AQQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; d="scan'208";a="255876711"
Received: from hghimira.iind.intel.com ([10.190.239.34])
 by orviesa007.jf.intel.com with ESMTP; 14 Jul 2026 03:54:35 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
Subject: [PATCH v7 2/7] drm/xe/debugfs: add page-size allocation mode knob
Date: Tue, 14 Jul 2026 16:25:41 +0530
Message-ID: <20260714105538.170849-11-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260714105538.170849-9-himal.prasad.ghimiray@intel.com>
References: <20260714105538.170849-9-himal.prasad.ghimiray@intel.com>
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

From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>

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

Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
---
 drivers/gpu/drm/xe/xe_debugfs.c | 62 +++++++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index 8c391c7b017a..dcc01336538d 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -564,6 +564,56 @@ static const struct file_operations disable_late_binding_fops = {
 	.write = disable_late_binding_set,
 };
 
+#ifdef CONFIG_DRM_XE_DEBUG_PAGE_SIZE
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
+#ifdef CONFIG_DRM_XE_DEBUG_PAGE_SIZE
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


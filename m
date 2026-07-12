Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6850DC44501
	for <intel-xe@archiver.kernel.org>; Sun, 12 Jul 2026 11:14:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2952510E431;
	Sun, 12 Jul 2026 11:14:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bHOMS5Ew";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3046210E411
 for <intel-xe@lists.freedesktop.org>; Sun, 12 Jul 2026 11:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783854894; x=1815390894;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IreaYXhZonrAwdAbsQ0CfzjJqu4LF2ApQfTBhC8QYok=;
 b=bHOMS5EwseqmbVBCjJ9nxJw83GDvdESuqAibozkOEJ2fPyptycliDcwa
 95UXvF2kA/BluOBqVtXtyPu99Hm4wVsBmZXVpHxPLnvmjV35u/H3p2LWy
 VFGqSIZLDX6DKash5BflwBjkIcvyk6VPnxMpphHskQJnavZafLMauOJCi
 t1ALGA7flaXPaQt/Ogk58aB97KuYck/vTI3pwwfsJp/ZgF9nbTEjqw1y2
 rhbtxKi+pjpuyl9kDe+omJ5OdxgAxcsF54BB8mzIVEIBmLfNjUpa4uhnf
 gFqj2tEjIVYlJkrnYMRfSKNAz0XNnpQMVp8do+3TVyxfMx2F1E3kZ0qbv g==;
X-CSE-ConnectionGUID: yE0j+xbqQo2kpHkLZ+fRXg==
X-CSE-MsgGUID: 5XzWCd7oReGvYUxPex6EOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84457620"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="84457620"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2026 04:14:54 -0700
X-CSE-ConnectionGUID: 2tF12wNiTya/piruKBNonw==
X-CSE-MsgGUID: d4mB/kyCRNqEVXvJMJR3lA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="255367706"
Received: from gfx-coremm-kmd15.iind.intel.com ([10.223.55.8])
 by orviesa007.jf.intel.com with ESMTP; 12 Jul 2026 04:14:52 -0700
From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com,
	naresh.kumar.g@intel.com
Subject: [PATCH v3 2/8] drm/xe/debugfs: add page-size allocation mode knob
Date: Sun, 12 Jul 2026 16:45:11 +0530
Message-ID: <20260712111517.1956177-3-naresh.kumar.g@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260712111517.1956177-1-naresh.kumar.g@intel.com>
References: <20260712111517.1956177-1-naresh.kumar.g@intel.com>
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

Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
---
 drivers/gpu/drm/xe/xe_debugfs.c | 61 +++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index 8c391c7b017a..95247feb9102 100644
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
@@ -616,6 +666,17 @@ void xe_debugfs_register(struct xe_device *xe)
 
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
+	debugfs_create_file("page_size_alloc_mode", 0600, root, xe,
+			    &page_size_alloc_mode_fops);
+#endif
 
 	/*
 	 * Don't expose page reclaim configuration file if not supported by the
-- 
2.43.0


Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99803C53200
	for <intel-xe@archiver.kernel.org>; Wed, 29 Jul 2026 12:18:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57E0B10EC00;
	Wed, 29 Jul 2026 12:18:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hN/yG1h4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A8BF10EBD5
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Jul 2026 12:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785327534; x=1816863534;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lhBkzZxK5jJzoD+E7As4V0dADBTx/QOM3LOCKW4Z+Ds=;
 b=hN/yG1h4AWRk3KCcycnn6ToF8AH4Pc9xqL7sqPlg6o1yvrS9ELgOz/T3
 6JiwE4LVb6mGsQcbS1Mbn58N/fMQDE/4nPlaNOOSNjepKtmIFNbDF3fJm
 n1/V62Sr8OweIe5WI+rqFjfUIh9oEvC54LpzMawcaY1174EFscBz/ikd1
 eq2U8kP/qvjIsdBZZ9khEFMdinKJebJktSfJBrHbEQ8ZI4FMLfIb6gOsu
 bP8evqZ1yS46WS4t9rfJ8rTGgAYlWtpvksWkjbxZHEiOf0oTK3E8HgQBk
 8+OIJwDmTHX8D4i/2JCmF6jV7bsoN2Zsiya9hE7TChi326pOCJ0NriXlG A==;
X-CSE-ConnectionGUID: AAkx/8nYT5KDX9jRF74BBQ==
X-CSE-MsgGUID: HbVjO/fjTOu6K/ahAA8/FQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="85969001"
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="85969001"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 05:18:53 -0700
X-CSE-ConnectionGUID: iEz9xc7VS+amaLaxt7NU3w==
X-CSE-MsgGUID: llRdOSm2S8KUqxCB8ECqeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="260055947"
Received: from gfx-coremm-kmd15.iind.intel.com ([10.223.55.8])
 by orviesa007.jf.intel.com with ESMTP; 29 Jul 2026 05:18:53 -0700
From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com,
	naresh.kumar.g@intel.com
Subject: [PATCH v10 2/6] drm/xe/debugfs: add page-size allocation mode knob
Date: Wed, 29 Jul 2026 17:48:39 +0530
Message-ID: <20260729121843.1255891-3-naresh.kumar.g@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260729121843.1255891-1-naresh.kumar.g@intel.com>
References: <20260729121843.1255891-1-naresh.kumar.g@intel.com>
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

v9(Himal)
- Add an OOB guard for mode in page_size_alloc_mode_show().
  This check makes the function display "unknown" if mode has been
  maliciously altered by KMD, preventing out-of-bounds access.
  Under normal operation, values set through debugfs are validated,
  so OOB values should not occur.
- simplify mode-to-string lookup using page_size_alloc_mode_names[]
- use sysfs_match_string() to parse page_size_alloc_mode writes

Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_debugfs.c | 78 +++++++++++++++++++++++++++++++++
 1 file changed, 78 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index 5a3877fcb0f0..8de78cd0aa03 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -614,6 +614,72 @@ static const struct file_operations disable_late_binding_fops = {
 	.write = disable_late_binding_set,
 };
 
+#ifdef CONFIG_DRM_XE_DEBUG_PAGE_SIZE
+static const char * const page_size_alloc_mode_names[] = {
+	[XE_PAGE_SIZE_ALLOC_CTRL_MODE_NONE]    = "none",
+	[XE_PAGE_SIZE_ALLOC_CTRL_MODE_ONLY_2M] = "only_2m",
+	[XE_PAGE_SIZE_ALLOC_CTRL_MODE_ONLY_1G] = "only_1g",
+	[XE_PAGE_SIZE_ALLOC_CTRL_MODE_MIXED]   = "mixed",
+};
+
+static ssize_t page_size_alloc_mode_show(struct file *f, char __user *ubuf,
+					 size_t size, loff_t *pos)
+{
+	struct xe_device *xe = file_inode(f)->i_private;
+	char buf[32];
+	int len;
+	enum xe_page_size_alloc_ctrl_mode mode;
+
+	mode = READ_ONCE(xe->page_size_alloc_ctrl.mode);
+	if (mode >= ARRAY_SIZE(page_size_alloc_mode_names) ||
+	    !page_size_alloc_mode_names[mode])
+		len = scnprintf(buf, sizeof(buf), "unknown\n");
+	else
+		len = scnprintf(buf, sizeof(buf), "%s\n",
+				page_size_alloc_mode_names[mode]);
+	return simple_read_from_buffer(ubuf, size, pos, buf, len);
+}
+
+static ssize_t page_size_alloc_mode_set(struct file *f, const char __user *ubuf,
+					size_t size, loff_t *pos)
+{
+	struct xe_device *xe = file_inode(f)->i_private;
+	int ret;
+	char buf[32];
+	int mode;
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
+	mode = sysfs_match_string(page_size_alloc_mode_names, buf);
+	if (mode < 0)
+		return mode;
+
+	mutex_lock(&xe->page_size_alloc_ctrl.lock);
+	if (mode == XE_PAGE_SIZE_ALLOC_CTRL_MODE_MIXED)
+		xe->page_size_alloc_ctrl.cur_index = 0;
+	WRITE_ONCE(xe->page_size_alloc_ctrl.mode,
+		   (enum xe_page_size_alloc_ctrl_mode)mode);
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
@@ -665,6 +731,18 @@ void xe_debugfs_register(struct xe_device *xe)
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


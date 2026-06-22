Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A3E2CDB46B
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jun 2026 06:59:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFE6710E4AD;
	Mon, 22 Jun 2026 06:59:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d8Myg41u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D087510E285
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Jun 2026 06:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782111579; x=1813647579;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PBcMdylF4GPZlWXHrAXpw1VE1KUartNuMP2ZBBp334g=;
 b=d8Myg41uZb0rS2scbFXLZT5+8Evt7qPawzH1k5U0gBspZtGltB2qrh+K
 6oDTFZHXXNXsAAaEgB3ayW9K74b9PJf3LMsfacHiQivI1Zx5pcu5wArbk
 KXaDLxKBKLnUDcC83ggelb76qk4wiYwNEoRSqNIQxgOe3QGrpITGOwamk
 H2PGxzkz7mrJpIZT9CkpjLnoDjzluIquu7MGfWPhFQ+Vh2Ixm0SD5g9Y6
 LXxrf4YuqRA/hVTTJp3KIdnTsUP3x3NrAozUJ89yhnL/VR1TYJWEBJSJl
 wBifJ6l3+Umx5ar/GvmKAq2nGe0wHaReeFEpk+I3/BtOV2BF8gQVq77an w==;
X-CSE-ConnectionGUID: EoWEYxadRGCBK4iwj6H2ZA==
X-CSE-MsgGUID: Hk4BrMV9TXKKRrjlu7Nfww==
X-IronPort-AV: E=McAfee;i="6800,10657,11824"; a="82928728"
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; d="scan'208";a="82928728"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2026 23:59:38 -0700
X-CSE-ConnectionGUID: d4aZZzWeRlebqgKvHpIKvA==
X-CSE-MsgGUID: m2S8Lm60TN2HLhlXbaebWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; d="scan'208";a="251068098"
Received: from gfx-coremm-kmd15.iind.intel.com ([10.223.55.8])
 by fmviesa004.fm.intel.com with ESMTP; 21 Jun 2026 23:59:36 -0700
From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com,
 Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
Subject: [PATCH 3/9] drm/xe/debugfs: add page size allocation mode knob
Date: Mon, 22 Jun 2026 12:30:25 +0530
Message-ID: <20260622070031.2445502-4-naresh.kumar.g@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260622070031.2445502-1-naresh.kumar.g@intel.com>
References: <20260622070031.2445502-1-naresh.kumar.g@intel.com>
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

The interface allows switching between forced 2M, forced 1G, and mixed
allocation modes at runtime on platforms that support page-size
allocation control. This provides a simple way to validate behavior and
debug page-size-dependent allocation flows.

Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
---
 drivers/gpu/drm/xe/xe_debugfs.c | 52 +++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index 22b471303984..041903836497 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -544,6 +544,55 @@ static const struct file_operations disable_late_binding_fops = {
 	.write = disable_late_binding_set,
 };
 
+static ssize_t page_size_alloc_mode_show(struct file *f, char __user *ubuf,
+					 size_t size, loff_t *pos)
+{
+	struct xe_device *xe = file_inode(f)->i_private;
+	char buf[32];
+	int len;
+
+	if (!xe_device_supports_multi_pagesize(xe))
+		return -EOPNOTSUPP;
+
+	enum xe_page_size_alloc_ctrl_mode mode =
+		READ_ONCE(xe->page_size_alloc_ctrl.mode);
+	len = scnprintf(buf, sizeof(buf), "%d\n", mode);
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
+	if (!xe_device_supports_multi_pagesize(xe))
+		return -EOPNOTSUPP;
+
+	ret = kstrtouint_from_user(ubuf, size, 0, &val);
+	if (ret)
+		return ret;
+
+	if (val > XE_PAGE_SIZE_ALLOC_CTRL_MODE_MIXED)
+		return -EINVAL;
+
+	WRITE_ONCE(xe->page_size_alloc_ctrl.mode,
+		   (enum xe_page_size_alloc_ctrl_mode)val);
+
+	if (val == XE_PAGE_SIZE_ALLOC_CTRL_MODE_MIXED)
+		WRITE_ONCE(xe->page_size_alloc_ctrl.cur_index, 0);
+
+	return size;
+}
+
+static const struct file_operations page_size_alloc_mode_fops = {
+	.owner = THIS_MODULE,
+	.read = page_size_alloc_mode_show,
+	.write = page_size_alloc_mode_set,
+};
+
 void xe_debugfs_register(struct xe_device *xe)
 {
 	struct ttm_device *bdev = &xe->ttm;
@@ -585,6 +634,9 @@ void xe_debugfs_register(struct xe_device *xe)
 	debugfs_create_file("disable_late_binding", 0600, root, xe,
 			    &disable_late_binding_fops);
 
+	debugfs_create_file("page_size_alloc_mode", 0600, root, xe,
+			    &page_size_alloc_mode_fops);
+
 	/*
 	 * Don't expose page reclaim configuration file if not supported by the
 	 * hardware initially.
-- 
2.43.0


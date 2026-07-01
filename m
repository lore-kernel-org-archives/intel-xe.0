Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51ABCC43327
	for <intel-xe@archiver.kernel.org>; Wed,  1 Jul 2026 16:33:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C47810F061;
	Wed,  1 Jul 2026 16:33:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LwH/OZ25";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57E9510F061
 for <intel-xe@lists.freedesktop.org>; Wed,  1 Jul 2026 16:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782923595; x=1814459595;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vxmD9tHGsPy124Pz67gCFBbgzTvkdsHh3joEMvNPUPE=;
 b=LwH/OZ255kUyHZK9aEpAsuHwX1KeFN0Raqnq9QxYK2rofRQLoyHloieQ
 JX5vL+Oab89Vl3z77WrI8ah7pV8sXx+pULmwO8ItviExk/qCMq28EkplA
 rl7kvNZrCKAbuSdB0ckVCA7+BpyGOZwMwmbJFXaxGNXXHtDFmjk8lFptf
 X+ZOossYe5yhSt4x0qKufPJxjjjORdkX0SMVgLC6LJHC8ArH8WCdHFzOW
 EaUbFXNJJm0ey5zvfe8KebUZjTkOWmIbeoytWh47qhz39rXeByqEvPx/X
 6j4h2HHmItDuDuIp9/48zYgBf406IwVDRHNZQJImt88WPFiXgKprf761O g==;
X-CSE-ConnectionGUID: F09yxcW1RdmK/qJ2RmSFGQ==
X-CSE-MsgGUID: yM77mFFvRTOGRsdUJe/Iiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="82779249"
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; d="scan'208";a="82779249"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2026 09:33:15 -0700
X-CSE-ConnectionGUID: UYvsXv2JTj6jEJ/c1AkgHA==
X-CSE-MsgGUID: x4A/xMVgQ260Axopgtidmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; d="scan'208";a="256196433"
Received: from gfx-coremm-kmd15.iind.intel.com ([10.223.55.8])
 by orviesa003.jf.intel.com with ESMTP; 01 Jul 2026 09:33:14 -0700
From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com,
 Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
Subject: [PATCH v2 3/8] drm/xe/debugfs: add page size allocation mode knob
Date: Wed,  1 Jul 2026 22:03:43 +0530
Message-ID: <20260701163348.3432358-4-naresh.kumar.g@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260701163348.3432358-1-naresh.kumar.g@intel.com>
References: <20260701163348.3432358-1-naresh.kumar.g@intel.com>
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

v2
- set cur_index using atomic_set as cur_index updated as atomic value
(sashiko)

Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
---
 drivers/gpu/drm/xe/xe_debugfs.c | 52 +++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index 22b471303984..2fa9ce04f9cd 100644
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
+		atomic_set(&xe->page_size_alloc_ctrl.cur_index, 0);
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


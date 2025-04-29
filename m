Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E664C3ABA4
	for <intel-xe@archiver.kernel.org>; Tue, 29 Apr 2025 07:36:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12F6410E3A5;
	Tue, 29 Apr 2025 07:36:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PMnTJMRl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99F2510E3C5
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Apr 2025 07:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745912188; x=1777448188;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JGE2d/h4hssdD4B5UVkUEp106DPIMiCFzB2ZD65yiQo=;
 b=PMnTJMRlFbjerYLZGgCRPsBfq3liHd1dgheMhLlqxKzu3x4xxO54NpX8
 DvYN74oM8KzfOirUa7zAaWGEpvwyLf6bvUHuVFgKslYZGWTMHzjSvt+pM
 qFO6LcGYhcMLgiChFY4imsUldzLegHS9uPLxsSwP8QImEllImaaiHQKMU
 m/RLx8YPb/LFrJm0UbDWDf7Orh/c4asH5BXjYeMJA5eRoUmQ9t9XGYrkz
 ewTon2vaftZcfx723fVrMYleZ6dGkbxdY268oiTqCs9+8aVITI4FvFUW2
 N9gkY8gjvaCU1schX+z9Ul9xCbvw/hl92blZInUmQb1/eDyM4sTznsuuB w==;
X-CSE-ConnectionGUID: uFpCkdO8RBqHslh5oheUSg==
X-CSE-MsgGUID: zyLtF0JJQOe/5Z3iYbfSrg==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="58178197"
X-IronPort-AV: E=Sophos;i="6.15,248,1739865600"; d="scan'208";a="58178197"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2025 00:36:28 -0700
X-CSE-ConnectionGUID: yvh5SElpRgCN4egtgRmg7A==
X-CSE-MsgGUID: BeHNV3t9QQ2LnaN2bVgoDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,248,1739865600"; d="scan'208";a="138559851"
Received: from unknown (HELO bnilawar-desk2.iind.intel.com) ([10.190.239.41])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 00:36:26 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedeskop.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 alexander.usyskin@intel.com, gregkh@linuxfoundation.org
Subject: [RFC 8/9] drm/xe/xe_late_bind_fw: Introduce debug fs node to disable
 late binding
Date: Tue, 29 Apr 2025 13:08:03 +0530
Message-Id: <20250429073804.972137-9-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250429073804.972137-1-badal.nilawar@intel.com>
References: <20250429073804.972137-1-badal.nilawar@intel.com>
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

Introduce a debug filesystem node to disable late binding fw reload
during the system or runtime resume. This is intended for situations
where the late binding fw needs to be loaded from user mode.

Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 drivers/gpu/drm/xe/xe_debugfs.c            | 42 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_late_bind_fw.c       |  3 ++
 drivers/gpu/drm/xe/xe_late_bind_fw_types.h |  2 ++
 3 files changed, 47 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index d0503959a8ed..7f238a9e1a49 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -185,12 +185,51 @@ static ssize_t wedged_mode_set(struct file *f, const char __user *ubuf,
 	return size;
 }
 
+static ssize_t disable_late_binding_show(struct file *f, char __user *ubuf,
+					 size_t size, loff_t *pos)
+{
+	struct xe_device *xe = file_inode(f)->i_private;
+	struct xe_late_bind *late_bind = &xe->late_bind;
+	char buf[32];
+	int len;
+
+	len = scnprintf(buf, sizeof(buf), "%d\n", late_bind->disable);
+
+	return simple_read_from_buffer(ubuf, size, pos, buf, len);
+}
+
+static ssize_t disable_late_binding_set(struct file *f, const char __user *ubuf,
+					size_t size, loff_t *pos)
+{
+	struct xe_device *xe = file_inode(f)->i_private;
+	struct xe_late_bind *late_bind = &xe->late_bind;
+	u32 uval;
+	ssize_t ret;
+
+	ret = kstrtouint_from_user(ubuf, size, sizeof(uval), &uval);
+	if (ret)
+		return ret;
+
+	if (uval > 1)
+		return -EINVAL;
+
+	late_bind->disable = (uval == 1) ? true : false;
+
+	return size;
+}
+
 static const struct file_operations wedged_mode_fops = {
 	.owner = THIS_MODULE,
 	.read = wedged_mode_show,
 	.write = wedged_mode_set,
 };
 
+static const struct file_operations disable_late_binding_fops = {
+	.owner = THIS_MODULE,
+	.read = disable_late_binding_show,
+	.write = disable_late_binding_set,
+};
+
 void xe_debugfs_register(struct xe_device *xe)
 {
 	struct ttm_device *bdev = &xe->ttm;
@@ -211,6 +250,9 @@ void xe_debugfs_register(struct xe_device *xe)
 	debugfs_create_file("wedged_mode", 0600, root, xe,
 			    &wedged_mode_fops);
 
+	debugfs_create_file("disable_late_binding", 0600, root, xe,
+			    &disable_late_binding_fops);
+
 	for (mem_type = XE_PL_VRAM0; mem_type <= XE_PL_VRAM1; ++mem_type) {
 		man = ttm_manager_type(bdev, mem_type);
 
diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c b/drivers/gpu/drm/xe/xe_late_bind_fw.c
index 7d2bc959027d..1626cf793b23 100644
--- a/drivers/gpu/drm/xe/xe_late_bind_fw.c
+++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
@@ -111,6 +111,9 @@ int xe_late_bind_fw_load(struct xe_late_bind *late_bind)
 	if (!late_bind->component_added)
 		return -EINVAL;
 
+	if (late_bind->disable)
+		return 0;
+
 	for (id = 0; id < MAX_ID; id++) {
 		lbfw = &late_bind->late_bind_fw[id];
 		if (lbfw->valid) {
diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
index ea11061ce556..ccd482e67f91 100644
--- a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
+++ b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
@@ -90,6 +90,8 @@ struct xe_late_bind {
 	/** @late_bind.late_bind_fw: late binding firmwares */
 	struct xe_late_bind_fw late_bind_fw[MAX_ID];
 
+	/** @late_bind.disable to block late binding reload during pm resume flow*/
+	bool disable;
 };
 
 #endif
-- 
2.34.1


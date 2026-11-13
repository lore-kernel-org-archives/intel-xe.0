Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CC83606A886
	for <intel-xe@archiver.kernel.org>; Fri, 13 Nov 2026 15:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nUaQ1irX
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CCF389C5E;
	Fri, 13 Nov 2026 15:16:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98619112643
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Nov 2026 15:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794582996; x=1826118996;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eO6AmUUv01ST29QTWjwXtQQeoI9yZr+xEvA9i3UW1II=;
 b=nUaQ1irXeq/v2uC8wmbrLSHyb+8k4sDHjkrXL7F4TBaz7rqFcvd8VDoE
 IRIZFH9tf/+JCJxTh3JiRt/nhOIkTWS6ZbrXaBYhBDn3VSQwti9MC3NJk
 zxitsnYG0QSAXDwgG9+X7qdDWIi/4BliPhD2RxAHMdCK4hST5bEQbWp+T
 i6FFO7fTWLuqH0AiZesMpALYyq0PBWuuYs8pQU58p+ndrkiuWv3WNfDew
 xkItUV0oqq00HfuQlrRRIQ8iKk15j0+5HAf34KyGQOQwa16mBFE+qCnby
 MAoyiMUme82TlRU09+lDGDCQRzFpiDV+EcXWOS2IqLgpbo806khgnSfIm g==;
X-CSE-ConnectionGUID: VxAk+yZRRJ6/21/P/Dd3MQ==
X-CSE-MsgGUID: GHJAg2+9RoWIoX2NFfoUPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11965"; a="3394006"
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="3394006"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2026 07:16:32 -0800
X-CSE-ConnectionGUID: 64ed4uypS1CR746iZ+zLrg==
X-CSE-MsgGUID: XdsWtsH+QgSQsLsW2iAOew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="8869117"
Received: from gfx-coremm-kmd15.iind.intel.com ([10.223.55.8])
 by fmviesa004.fm.intel.com with ESMTP; 13 Nov 2026 07:16:30 -0800
From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com,
 Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
Subject: [PATCH 1/2] drm/xe/debugfs: add Context ATS enable knob
Date: Fri, 13 Nov 2026 20:43:23 +0530
Message-ID: <20261113151324.2806375-2-naresh.kumar.g@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261113151324.2806375-1-naresh.kumar.g@intel.com>
References: <20261113151324.2806375-1-naresh.kumar.g@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add enable_ctx_ats to struct xe_device and expose it as a debugfs
file so it can be read/toggled at runtime, default false.

This is a HW debug validation/verification knob
for SV and FV PCIe team testing of per-context ATS hardware
combinations as per bspec.

Bspec: 82278

Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
---
 drivers/gpu/drm/xe/xe_debugfs.c      | 41 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_device_types.h |  6 ++++
 2 files changed, 47 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index e59d4964d811..fd013d0f432e 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -619,6 +619,40 @@ static const struct file_operations disable_late_binding_fops = {
 	.write = disable_late_binding_set,
 };
 
+static ssize_t enable_ctx_ats_show(struct file *f, char __user *ubuf,
+				   size_t size, loff_t *pos)
+{
+	struct xe_device *xe = file_inode(f)->i_private;
+	char buf[8];
+	int len;
+
+	len = scnprintf(buf, sizeof(buf), "%d\n", xe->enable_ctx_ats);
+
+	return simple_read_from_buffer(ubuf, size, pos, buf, len);
+}
+
+static ssize_t enable_ctx_ats_set(struct file *f, const char __user *ubuf,
+				  size_t size, loff_t *pos)
+{
+	struct xe_device *xe = file_inode(f)->i_private;
+	bool val;
+	ssize_t ret;
+
+	ret = kstrtobool_from_user(ubuf, size, &val);
+	if (ret)
+		return ret;
+
+	xe->enable_ctx_ats = val;
+
+	return size;
+}
+
+static const struct file_operations enable_ctx_ats_fops = {
+	.owner = THIS_MODULE,
+	.read = enable_ctx_ats_show,
+	.write = enable_ctx_ats_set,
+};
+
 #ifdef CONFIG_DRM_XE_DEBUG_PAGE_SIZE
 static const char * const page_size_alloc_mode_names[] = {
 	[XE_PAGE_SIZE_ALLOC_CTRL_MODE_NONE]    = "none",
@@ -736,6 +770,13 @@ void xe_debugfs_register(struct xe_device *xe)
 	debugfs_create_file("disable_late_binding", 0600, root, xe,
 			    &disable_late_binding_fops);
 
+	/*
+	 * HW debug validation-only knob: force the per-context ATS enable bit
+	 * on every LRC.
+	 */
+	if (!IS_SRIOV_VF(xe) && GRAPHICS_VER(xe) >= 20)
+		debugfs_create_file("enable_ctx_ats", 0600, root, xe, &enable_ctx_ats_fops);
+
 #ifdef CONFIG_DRM_XE_DEBUG_PAGE_SIZE
 	/*
 	 * Expose a debugfs knob to control user BO page-size allocation:
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 8f2a31949073..1fcd74e14917 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -593,6 +593,12 @@ struct xe_device {
 	/** @min_run_period_pf_ms: LR VM (page fault mode) timeslice */
 	u32 min_run_period_pf_ms;
 
+	/**
+	 * @enable_ctx_ats: HW debug validation-only knob (debugfs) to force the
+	 * per-context ATS enable bit on every LRC.
+	 */
+	bool enable_ctx_ats;
+
 #ifdef TEST_VM_OPS_ERROR
 	/**
 	 * @vm_inject_error_position: inject errors at different places in VM
-- 
2.43.0


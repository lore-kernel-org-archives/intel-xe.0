Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C18E0D111A7
	for <intel-xe@archiver.kernel.org>; Wed, 26 Nov 2025 23:02:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 840AE10E727;
	Wed, 26 Nov 2025 23:02:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FYC54Jmf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9408E10E71A
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Nov 2025 23:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764198145; x=1795734145;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=91/hkbovuIEpyBnv6XmtFwSQ/VRbF94aKHl/Cjrrb0I=;
 b=FYC54Jmf9U2+goD6dq2NhTEvXSDksBBhGq5kZcIoXGJkdtv9ux8xkG5m
 7JpKkL7b/VqWH0iPckwKedz849dm+uUlRJzgyjDa/j1FQWDUQfz4KL8Ha
 2XvTyvEtpcNez6cc8T6NmC6+ZAFqIBlMAVdq6RIYIbsKvHW7bs9aAm1D2
 D3WicRQwAANSX4amIUd3xWGQ4z04RpW5Spi09HYAwQY1VhXDv1O7oKFXu
 V/ZL8PieKOXp4V1qJhokeRytu6bPNltoiKM4l0XIGNgRvTCT8xSvYcvZ5
 Gw23wHwx7M2Dqvxtd2fRVwYCSCuBzffbVnL0YGteidatyXxOpbjOP+KqN g==;
X-CSE-ConnectionGUID: z6yX5vfzSCu7fe9BEy/wiw==
X-CSE-MsgGUID: FnFvwzG7Sia8exeBGWreKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="66284562"
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; d="scan'208";a="66284562"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 15:02:24 -0800
X-CSE-ConnectionGUID: GMQK9eNaRs6vzZZC4+EAPQ==
X-CSE-MsgGUID: MxiTY/muT1mKQken5+hB+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; d="scan'208";a="224028560"
Received: from osgc-sh-dragon.sh.intel.com ([10.239.81.44])
 by fmviesa001.fm.intel.com with ESMTP; 26 Nov 2025 15:02:22 -0800
From: Brian Nguyen <brian3.nguyen@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: tejas.upadhyay@intel.com, matthew.brost@intel.com, shuicheng.lin@intel.com,
 stuart.summers@intel.com, Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v2 11/11] drm/xe: Add debugfs support for page reclamation
Date: Thu, 27 Nov 2025 07:02:12 +0800
Message-ID: <20251126230201.3782788-24-brian3.nguyen@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251126230201.3782788-13-brian3.nguyen@intel.com>
References: <20251126230201.3782788-13-brian3.nguyen@intel.com>
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

Allow for runtime modification to page reclamation feature through
debugfs configuration. This parameter will only take effect if the
platform supports the page reclamation feature by default.

v2:
 - Minor comment tweaks. (Shuicheng)
 - Convert to kstrtobool_from_user. (Michal)
 - Only expose page reclaim file if page reclaim flag
   initially supported and with that, remove
   xe_match_desc usage. (Michal)

Signed-off-by: Brian Nguyen <brian3.nguyen@intel.com>
Cc: Shuicheng Lin <shuicheng.lin@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_debugfs.c | 41 +++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index 1d5a2a43a9d7..296b8136511b 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -291,6 +291,39 @@ static const struct file_operations wedged_mode_fops = {
 	.write = wedged_mode_set,
 };
 
+static ssize_t page_reclaim_hw_assist_show(struct file *f, char __user *ubuf,
+					   size_t size, loff_t *pos)
+{
+	struct xe_device *xe = file_inode(f)->i_private;
+	char buf[8];
+	int len;
+
+	len = scnprintf(buf, sizeof(buf), "%d\n", xe->info.has_page_reclaim_hw_assist);
+	return simple_read_from_buffer(ubuf, size, pos, buf, len);
+}
+
+static ssize_t page_reclaim_hw_assist_set(struct file *f, const char __user *ubuf,
+					  size_t size, loff_t *pos)
+{
+	struct xe_device *xe = file_inode(f)->i_private;
+	bool val;
+	ssize_t ret;
+
+	ret = kstrtobool_from_user(ubuf, size, &val);
+	if (ret)
+		return ret;
+
+	xe->info.has_page_reclaim_hw_assist = val;
+
+	return size;
+}
+
+static const struct file_operations page_reclaim_hw_assist_fops = {
+	.owner = THIS_MODULE,
+	.read = page_reclaim_hw_assist_show,
+	.write = page_reclaim_hw_assist_set,
+};
+
 static ssize_t atomic_svm_timeslice_ms_show(struct file *f, char __user *ubuf,
 					    size_t size, loff_t *pos)
 {
@@ -397,6 +430,14 @@ void xe_debugfs_register(struct xe_device *xe)
 	debugfs_create_file("disable_late_binding", 0600, root, xe,
 			    &disable_late_binding_fops);
 
+	/*
+	 * Don't expose page reclaim configuration file if not supported by the
+	 * hardware initially.
+	 */
+	if (xe->info.has_page_reclaim_hw_assist)
+		debugfs_create_file("page_reclaim_hw_assist", 0600, root, xe,
+				    &page_reclaim_hw_assist_fops);
+
 	for (mem_type = XE_PL_VRAM0; mem_type <= XE_PL_VRAM1; ++mem_type) {
 		man = ttm_manager_type(bdev, mem_type);
 
-- 
2.52.0


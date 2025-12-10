Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1556D3B9B7
	for <intel-xe@archiver.kernel.org>; Wed, 10 Dec 2025 01:45:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93AD410E648;
	Wed, 10 Dec 2025 01:45:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FIzRtSv1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 582D210E64A
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Dec 2025 01:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765331140; x=1796867140;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ldXIBWoPKUhWg5otz0QcaVveUJAPLCdoBnE7UPnP5F0=;
 b=FIzRtSv1xugGqvOW/FdIh2bWgMJoNcxFk9k850prEZVoJT6QHjzUC1wL
 7RfUMot13elB1d5UtsP2j6C8OXau/G/TWbCaUgmjwPvADoAhET7PQKSzS
 066UHOv7OfQiuLb9O/laDwAObqkBL+MBy1LUuid3FQC7UdfmoF7b7LUoM
 xGRqk938S/Odmah920L5uZGXcZzpzY9Tidg37gT4uGhIDwShcxiHyGo8n
 zGOAouZuPVPFBRATbYkhUEwQcvYINqx5vQOOzHMmv4zXCsxS+9ft/f3Jl
 uJQL96wUZY7yCzvcnQYc6YwbaSxyeKBs7D5syH1XMRFfZyYUMsYIMEPg6 A==;
X-CSE-ConnectionGUID: NWDa8UbtTIy1D4A8mBcBew==
X-CSE-MsgGUID: ceP1IIZYSY+2IOPBv+JKAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="66302128"
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; d="scan'208";a="66302128"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 17:45:39 -0800
X-CSE-ConnectionGUID: mL8G003fSzyVjQF0k4eirQ==
X-CSE-MsgGUID: AMyLNnf0T+KJNdb8nN/98g==
X-ExtLoop1: 1
Received: from osgc-sh-dragon.sh.intel.com ([10.239.81.44])
 by fmviesa003.fm.intel.com with ESMTP; 09 Dec 2025 17:45:37 -0800
From: Brian Nguyen <brian3.nguyen@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: tejas.upadhyay@intel.com, matthew.brost@intel.com, shuicheng.lin@intel.com,
 stuart.summers@intel.com, Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v5 10/10] drm/xe: Add debugfs support for page reclamation
Date: Wed, 10 Dec 2025 09:45:28 +0800
Message-ID: <20251210014517.3184135-22-brian3.nguyen@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251210014517.3184135-12-brian3.nguyen@intel.com>
References: <20251210014517.3184135-12-brian3.nguyen@intel.com>
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
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Shuicheng Lin <shuicheng.lin@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_debugfs.c | 41 +++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index 0f8a96a05a8e..d24e5aca30ed 100644
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
@@ -396,6 +429,14 @@ void xe_debugfs_register(struct xe_device *xe)
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
 	man = ttm_manager_type(bdev, XE_PL_TT);
 	ttm_resource_manager_create_debugfs(man, root, "gtt_mm");
 
-- 
2.52.0


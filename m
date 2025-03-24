Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18982C3600C
	for <intel-xe@archiver.kernel.org>; Mon, 24 Mar 2025 11:08:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D099E10E2C4;
	Mon, 24 Mar 2025 11:08:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bIW5F/PF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFD8A10E2C4
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Mar 2025 11:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742814489; x=1774350489;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=NaBUnKcuS7oS+e7acKJfDgGooklXk1lFJOrEmCjFEzE=;
 b=bIW5F/PFFvVNwU0zeiXWeMad3sTMSEqIGCEUSYfK7+j3JST9COZia80j
 kENEy0r06uKFxjVfDeAlVT5mHxfTLGdPbwKrlTj/eRvkNzs0A9qZNdWM2
 ZaOLT3P8dhAft5iP45kZvn0d4SnKDec5kK1tYPod5+Hg0M28FXTqSsjwj
 uWgQpv0E48PWCZnge3IiBL9RFfhqV1SheAdOyRyE05G2kiNx8FDLttUIo
 LqaZB6sm7d29yYsM4QH1Vl2fQzozWVxrd6c+Jq+OLcqC80V7RTg80rh9v
 Dy8l5b4pFLtmg8Y934dh2lb/X28QRV9dwa7b/6t49UpS91bEjH15+10qx w==;
X-CSE-ConnectionGUID: mjiNCw0ZTvCZi5sjKYcaNA==
X-CSE-MsgGUID: g3dcuakqRYCNjvh0Uhu72A==
X-IronPort-AV: E=McAfee;i="6700,10204,11382"; a="43899062"
X-IronPort-AV: E=Sophos;i="6.14,271,1736841600"; d="scan'208";a="43899062"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 04:08:04 -0700
X-CSE-ConnectionGUID: H7BBU7mmS7u0fr8E4t9/fg==
X-CSE-MsgGUID: T0NIDkgwTEyjvhbnJCCyMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,271,1736841600"; d="scan'208";a="124542526"
Received: from intelmailrelay-02.habana-labs.com ([10.111.11.21])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 04:08:03 -0700
Received: internal info suppressed
Received: from dhirschfeld-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by dhirschfeld-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with
 ESMTPS id 52OB7ri52521830
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Mon, 24 Mar 2025 13:07:53 +0200
Received: (from dhirschfeld@localhost)
 by dhirschfeld-vm-u22.habana-labs.com (8.15.2/8.15.2/Submit) id
 52OB7rar2521829; Mon, 24 Mar 2025 13:07:53 +0200
From: Dafna Hirschfeld <dafna.hirschfeld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Dafna Hirschfeld <dafna.hirschfeld@intel.com>
Subject: [PATCH v2 1/2] drm/xe/debugfs: add local forcewake_get/put funcs
Date: Mon, 24 Mar 2025 13:07:29 +0200
Message-Id: <20250324110730.2521805-1-dafna.hirschfeld@intel.com>
X-Mailer: git-send-email 2.34.1
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

add the function forcewake_get, forcewake_put. They will be
used in laters commits.

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@intel.com>
---
changes from v1:
1. fix according to comments,
2. support steering for mcr registers.

 drivers/gpu/drm/xe/xe_debugfs.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index d0503959a8ed..e60eaefdd4a5 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -87,9 +87,8 @@ static const struct drm_info_list debugfs_list[] = {
 	{ .name = "sriov_info", .show = sriov_info, },
 };
 
-static int forcewake_open(struct inode *inode, struct file *file)
+static int forcewake_get(struct xe_device *xe)
 {
-	struct xe_device *xe = inode->i_private;
 	struct xe_gt *gt;
 	u8 id, last_gt;
 	unsigned int fw_ref;
@@ -119,15 +118,28 @@ static int forcewake_open(struct inode *inode, struct file *file)
 	return -ETIMEDOUT;
 }
 
-static int forcewake_release(struct inode *inode, struct file *file)
+static int forcewake_open(struct inode *inode, struct file *file)
 {
 	struct xe_device *xe = inode->i_private;
+
+	return forcewake_get(xe);
+}
+
+static void forcewake_put(struct xe_device *xe)
+{
 	struct xe_gt *gt;
 	u8 id;
 
 	for_each_gt(gt, xe, id)
 		xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 	xe_pm_runtime_put(xe);
+}
+
+static int forcewake_release(struct inode *inode, struct file *file)
+{
+	struct xe_device *xe = inode->i_private;
+
+	forcewake_put(xe);
 
 	return 0;
 }
-- 
2.34.1


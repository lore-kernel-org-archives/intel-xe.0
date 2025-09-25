Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2EA3CAC5B5
	for <intel-xe@archiver.kernel.org>; Thu, 25 Sep 2025 22:04:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9513310E9BF;
	Thu, 25 Sep 2025 22:04:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AGMNQ3Bu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4E1310E9BF
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Sep 2025 22:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758837891; x=1790373891;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=15mFxBa4MAta43Ayh5Df0yhBhDYmgzUYX+Q4OFwuZYM=;
 b=AGMNQ3BuTt/0pJWGN/ZCMEeKREzwr943XLR9ICu1BBdBndbezWo8a9uU
 u/bAJmZTCo9IyYUviO1Apbna+bQUrPrWoG5mwT8T6RAjR0lCXMJrnauHG
 Uk/OOMr2a/8b6i6sQIZKKM2qH9GgekJ6+GF8ZosEjyxZDVrFwYDVo5pew
 bN4E5jNGb/0lA8toByPfLlZUr99McPSa2JYFapu9PT+aywETcMwPv0HWp
 jmCdNb1hBLCq8tdDkEuF25uoeZTKz9a/ba1yXAXFaZHVyWDAaaW9aP26b
 UHE3m7btlD6WFIaHG1AulYXqA6klZhDfrYdR8zZ5hUuU9a8OK0JPHdYBY Q==;
X-CSE-ConnectionGUID: Tj0kTQz5RUuLizTNy7ogyg==
X-CSE-MsgGUID: PRfKp6XnQ1ewg5pk+h6d7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11564"; a="61222122"
X-IronPort-AV: E=Sophos;i="6.18,293,1751266800"; d="scan'208";a="61222122"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 15:04:51 -0700
X-CSE-ConnectionGUID: iHpIqzKCR/yTdjOKgqlr1w==
X-CSE-MsgGUID: osPJFjfsRIiHI61pPiGh2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,293,1751266800"; d="scan'208";a="201129427"
Received: from krychlik-mobl2.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.117.173])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 15:04:45 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 2/6] drm/xe/pf: Create separate debugfs tree for SR-IOV files
Date: Fri, 26 Sep 2025 00:04:19 +0200
Message-ID: <20250925220425.196860-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250925220425.196860-1-michal.wajdeczko@intel.com>
References: <20250925220425.196860-1-michal.wajdeczko@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Currently we expose debugfs files related to SR-IOV functions
together with other native files, but that approach will not
scale well as we plan to add more attributes and also expose
some of them on the per-tile basis.

Start building separate tree for SR-IOV specific debugfs files
where we can replicate similar files per every SR-IOV function:

   /sys/kernel/debug/dri/BDF/
   ├── sriov
   │   ├── pf
   │   │   ├── tile0
   │   │   │   ├── gt0
   │   │   │   ├── gt1
   │   │   │   :
   │   │   ├── tile1
   │   │   :
   │   ├── vf1
   │   │   ├── tile0
   │   │   │   ├── gt0
   │   │   │   ├── gt1
   │   │   │   :
   │   │   :
   │   ├── vf2
   │   ├── ...

We will populate this new tree in upcoming patches.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c | 73 +++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_sriov_types.h      |  3 +
 2 files changed, 67 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
index 2a1316048439..b2088b6dc23f 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
@@ -9,7 +9,9 @@
 #include "xe_device_types.h"
 #include "xe_sriov_pf.h"
 #include "xe_sriov_pf_debugfs.h"
+#include "xe_sriov_pf_helpers.h"
 #include "xe_sriov_pf_service.h"
+#include "xe_sriov_printk.h"
 
 static int simple_show(struct seq_file *m, void *data)
 {
@@ -28,27 +30,80 @@ static const struct drm_info_list debugfs_list[] = {
 	{ .name = "versions", .show = simple_show, .data = xe_sriov_pf_service_print_versions },
 };
 
+static void pf_populate_pf(struct xe_device *xe, struct dentry *pfdent)
+{
+	struct drm_minor *minor = xe->drm.primary;
+
+	drm_debugfs_create_files(debugfs_list, ARRAY_SIZE(debugfs_list), pfdent, minor);
+}
+
+static void pf_debugfs_available(struct xe_device *xe, struct dentry *dent)
+{
+	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG)) {
+		char *path = kzalloc(PATH_MAX, GFP_KERNEL);
+
+		if (path) {
+			xe_sriov_info(xe, "SR-IOV details available at /sys/kernel/debug%s\n",
+				      dentry_path_raw(dent, path, PATH_MAX));
+			kfree(path);
+		}
+	}
+}
+
 /**
  * xe_sriov_pf_debugfs_register - Register PF debugfs attributes.
  * @xe: the &xe_device
  * @root: the root &dentry
  *
- * Prepare debugfs attributes exposed by the PF.
+ * Create separate directory that will contain all SR-IOV related files,
+ * organized per each SR-IOV function (PF, VF1, VF2, ..., VFn).
  */
 void xe_sriov_pf_debugfs_register(struct xe_device *xe, struct dentry *root)
 {
-	struct drm_minor *minor = xe->drm.primary;
-	struct dentry *parent;
+	int totalvfs = xe_sriov_pf_get_totalvfs(xe);
+	char vfname[VFNAME_MAX];
+	struct dentry *pfdent;
+	struct dentry *vfdent;
+	struct dentry *dent;
+	int n;
 
 	/*
-	 *      /sys/kernel/debug/dri/0/
-	 *      ├── pf
+	 *      /sys/kernel/debug/dri/BDF/
+	 *      ├── sriov		# d_inode->i_private = (xe_device*)
 	 *      │   ├── ...
 	 */
-	parent = debugfs_create_dir("pf", root);
-	if (IS_ERR(parent))
+	dent = debugfs_create_dir("sriov", root);
+	if (IS_ERR(dent))
 		return;
-	parent->d_inode->i_private = xe;
+	dent->d_inode->i_private = xe;
 
-	drm_debugfs_create_files(debugfs_list, ARRAY_SIZE(debugfs_list), parent, minor);
+	/*
+	 *      /sys/kernel/debug/dri/BDF/
+	 *      ├── sriov		# d_inode->i_private = (xe_device*)
+	 *      │   ├── pf		# d_inode->i_private = (xe_device*)
+	 *      │   │   ├── ...
+	 */
+	pfdent = debugfs_create_dir("pf", dent);
+	if (IS_ERR(pfdent))
+		return;
+	pfdent->d_inode->i_private = xe;
+
+	pf_populate_pf(xe, pfdent);
+
+	/*
+	 *      /sys/kernel/debug/dri/BDF/
+	 *      ├── sriov		# d_inode->i_private = (xe_device*)
+	 *      │   ├── vf1		# d_inode->i_private = VFID(1)
+	 *      │   ├── vf2		# d_inode->i_private = VFID(2)
+	 *      │   ├── ...
+	 */
+	for (n = 1; n <= totalvfs; n++) {
+		snprintf(vfname, sizeof(vfname), "vf%u", VFID(n));
+		vfdent = debugfs_create_dir(vfname, dent);
+		if (IS_ERR(vfdent))
+			return;
+		vfdent->d_inode->i_private = (void *)(uintptr_t)VFID(n);
+	}
+
+	return pf_debugfs_available(xe, dent);
 }
diff --git a/drivers/gpu/drm/xe/xe_sriov_types.h b/drivers/gpu/drm/xe/xe_sriov_types.h
index 1a138108d139..761ae86cd55d 100644
--- a/drivers/gpu/drm/xe/xe_sriov_types.h
+++ b/drivers/gpu/drm/xe/xe_sriov_types.h
@@ -20,6 +20,9 @@
 #define VFID(n)		(n)
 #define PFID		VFID(0)
 
+/* should be enough up to "vf%u\0" for 2^32 - 1 */
+#define VFNAME_MAX	14
+
 /**
  * enum xe_sriov_mode - SR-IOV mode
  * @XE_SRIOV_MODE_NONE: bare-metal mode (non-virtualized)
-- 
2.47.1


Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A86DCAC5B5
	for <intel-xe@archiver.kernel.org>; Sun, 28 Sep 2025 14:00:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B51B10E128;
	Sun, 28 Sep 2025 14:00:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ndzjBZis";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5329710E128
 for <intel-xe@lists.freedesktop.org>; Sun, 28 Sep 2025 14:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759068045; x=1790604045;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fdgsMOrbq4T9Dtha49/Rk4s5q8jI9CQ9hER+JCNndyI=;
 b=ndzjBZisInhKXdMED1WLx02BQstKPYWlf7W3RR/9zBe63VwiHHfgTTXh
 yzrl7SeKE0IjWe7TfFaajULqamCNS0ru9ipKUnByvYGl8XOGZ9HxjFOOw
 kSrUCbAQ9r7DAKhCWHVTq4KYlpMPIsYyaphdstiy4lmdATvi4qKlOtZWU
 Jm1GNt+1eokO+C6nmk9OpHcANvuzw9PkfpmYyaspRWd6WvQhkkVi3dzlx
 hFLpC5X04618cEuOBOEVcqU2+MKEVycpCWAPfGOxTgopkTmticYp15Dm+
 +FqzrScjYicQfgdiWNm8JxweIB5zV/5rkuIwhuK1XxcwVPBJ/nVfL2eFf g==;
X-CSE-ConnectionGUID: Plek6K7sSsSNhTu4Uh/Bqw==
X-CSE-MsgGUID: Ahtjgw6UR6CG453T4YmxAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11567"; a="48893874"
X-IronPort-AV: E=Sophos;i="6.18,299,1751266800"; d="scan'208";a="48893874"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2025 07:00:45 -0700
X-CSE-ConnectionGUID: QEwflovVR5eXKihfk+B0uw==
X-CSE-MsgGUID: mQOf+Cm2TFW5lGBECbaRBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,299,1751266800"; d="scan'208";a="178761832"
Received: from jkhalil-mobl.amr.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.98.85])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2025 07:00:44 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v2 2/6] drm/xe/pf: Create separate debugfs tree for SR-IOV
 files
Date: Sun, 28 Sep 2025 16:00:24 +0200
Message-ID: <20250928140029.198847-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250928140029.198847-1-michal.wajdeczko@intel.com>
References: <20250928140029.198847-1-michal.wajdeczko@intel.com>
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
v2: drop VFNAME_MAX and don't print dentry location (Lucas)
---
 drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c | 58 ++++++++++++++++++++----
 1 file changed, 49 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
index 2a1316048439..37cc3a297667 100644
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
@@ -28,27 +30,65 @@ static const struct drm_info_list debugfs_list[] = {
 	{ .name = "versions", .show = simple_show, .data = xe_sriov_pf_service_print_versions },
 };
 
+static void pf_populate_pf(struct xe_device *xe, struct dentry *pfdent)
+{
+	struct drm_minor *minor = xe->drm.primary;
+
+	drm_debugfs_create_files(debugfs_list, ARRAY_SIZE(debugfs_list), pfdent, minor);
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
+	struct dentry *pfdent;
+	struct dentry *vfdent;
+	struct dentry *dent;
+	char vfname[16]; /* should be more than enough for "vf%u\0" and VFID(UINT_MAX) */
+	unsigned int n;
 
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
 }
-- 
2.47.1


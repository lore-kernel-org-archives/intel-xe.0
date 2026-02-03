Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CDADE8B383
	for <intel-xe@archiver.kernel.org>; Tue,  3 Feb 2026 23:53:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DE0110E29A;
	Tue,  3 Feb 2026 23:53:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d/shtjLJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF2A810E29A
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Feb 2026 23:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770162838; x=1801698838;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=sCtbB4aUbwHOAjI/lnOiiG1hpBMd4ZmNIlkVzBodblM=;
 b=d/shtjLJJ3If30ayVAVBahYQwI5nSu4GXZ4S460Roqdge6pfiq5qUndb
 hgKZPYV47jrWGyPHW4dMgDC5bAkH5T5BhhfiBkenNSYBREb+NFep3s/YE
 m45eqpt4INrr93xA17CVv4QKB7Xe8b3HgbrPAg0IP6tea1Eh5y7Bum2L4
 ySRrVfmH9kUmbgl9WSt5toKDA5TXbKqcJUakxRtmS1+hJ/5clsdVujE2I
 Ux4rFRMf17zomea6S6U9SACyIAa1EbkXJxOYlworSZAIcp/7oUiIitCw9
 iK2Fh2PrPb4IiDri1FBuBZpws4dpjBG9+eC5UKoLr3gMkSPKcTP9zRTd5 A==;
X-CSE-ConnectionGUID: DZUetwBkTFi1CRi/Mk2laA==
X-CSE-MsgGUID: dsndQ8EgR1m6aa5KZRtKsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="82714887"
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; d="scan'208";a="82714887"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 15:53:57 -0800
X-CSE-ConnectionGUID: Ki6TH6F9Qa6FOrjXxB3L1A==
X-CSE-MsgGUID: /2T8Nt3JRI+lZO+F5E/dug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; d="scan'208";a="210095062"
Received: from unknown (HELO mwajdecz-hp.clients.intel.com) ([10.246.19.151])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 15:53:56 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH] drm/xe/pf: Fix sysfs initialization
Date: Wed,  4 Feb 2026 00:53:32 +0100
Message-ID: <20260203235332.1350-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
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

In case of devm_add_action_or_reset() failure the provided cleanup
action will be run immediately on the not yet initialized kobject.
This may lead to errors like:

 [ ] kobject: '(null)' (ff110001393608e0): is not initialized, yet kobject_put() is being called.
 [ ] WARNING: lib/kobject.c:734 at kobject_put+0xd9/0x250, CPU#0: kworker/0:0/9
 [ ] RIP: 0010:kobject_put+0xdf/0x250
 [ ] Call Trace:
 [ ]  xe_sriov_pf_sysfs_init+0x21/0x100 [xe]
 [ ]  xe_sriov_pf_init_late+0x87/0x2b0 [xe]
 [ ]  xe_sriov_init_late+0x5f/0x2c0 [xe]
 [ ]  xe_device_probe+0x5f2/0xc20 [xe]
 [ ]  xe_pci_probe+0x396/0x610 [xe]
 [ ]  local_pci_probe+0x47/0xb0

 [ ] refcount_t: underflow; use-after-free.
 [ ] WARNING: lib/refcount.c:28 at refcount_warn_saturate+0x68/0xb0, CPU#0: kworker/0:0/9
 [ ] RIP: 0010:refcount_warn_saturate+0x68/0xb0
 [ ] Call Trace:
 [ ]  kobject_put+0x174/0x250
 [ ]  xe_sriov_pf_sysfs_init+0x21/0x100 [xe]
 [ ]  xe_sriov_pf_init_late+0x87/0x2b0 [xe]
 [ ]  xe_sriov_init_late+0x5f/0x2c0 [xe]
 [ ]  xe_device_probe+0x5f2/0xc20 [xe]
 [ ]  xe_pci_probe+0x396/0x610 [xe]
 [ ]  local_pci_probe+0x47/0xb0

Fix that by calling kobject_init() and kobject_add() separately
and register cleanup action after the kobject is initialized.

Also make this cleanup registration a part of the create helper to
fix another mistake, as in the loop we were wronly passing parent
kobject while registering cleanup action, and this resulted in some
undetected leaks.

Fixes: 5c170a4d9c53 ("drm/xe/pf: Prepare sysfs for SR-IOV admin attributes")
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c | 54 +++++++++++++-------------
 1 file changed, 26 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c b/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c
index 3d140506ba36..82a1055985ba 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c
@@ -349,18 +349,33 @@ static const struct attribute_group *xe_sriov_vf_attr_groups[] = {
 
 /* no user serviceable parts below */
 
-static struct kobject *create_xe_sriov_kobj(struct xe_device *xe, unsigned int vfid)
+static void action_put_kobject(void *arg)
+{
+	struct kobject *kobj = arg;
+
+	kobject_put(kobj);
+}
+
+static struct kobject *create_xe_sriov_kobj(struct xe_device *xe, unsigned int vfid,
+					    const struct kobj_type *ktype)
 {
 	struct xe_sriov_kobj *vkobj;
+	int err;
 
 	xe_sriov_pf_assert_vfid(xe, vfid);
 
 	vkobj = kzalloc(sizeof(*vkobj), GFP_KERNEL);
 	if (!vkobj)
-		return NULL;
+		return ERR_PTR(-ENOMEM);
 
 	vkobj->xe = xe;
 	vkobj->vfid = vfid;
+	kobject_init(&vkobj->base, ktype);
+
+	err = devm_add_action_or_reset(xe->drm.dev, action_put_kobject, &vkobj->base);
+	if (err)
+		return ERR_PTR(err);
+
 	return &vkobj->base;
 }
 
@@ -463,28 +478,17 @@ static void pf_sysfs_note(struct xe_device *xe, int err, const char *what)
 	xe_sriov_dbg(xe, "Failed to setup sysfs %s (%pe)\n", what, ERR_PTR(err));
 }
 
-static void action_put_kobject(void *arg)
-{
-	struct kobject *kobj = arg;
-
-	kobject_put(kobj);
-}
-
 static int pf_setup_root(struct xe_device *xe)
 {
 	struct kobject *parent = &xe->drm.dev->kobj;
 	struct kobject *root;
 	int err;
 
-	root = create_xe_sriov_kobj(xe, PFID);
-	if (!root)
-		return pf_sysfs_error(xe, -ENOMEM, "root obj");
+	root = create_xe_sriov_kobj(xe, PFID, &xe_sriov_dev_ktype);
+	if (IS_ERR(root))
+		return pf_sysfs_error(xe, PTR_ERR(root), "root obj");
 
-	err = devm_add_action_or_reset(xe->drm.dev, action_put_kobject, root);
-	if (err)
-		return pf_sysfs_error(xe, err, "root action");
-
-	err = kobject_init_and_add(root, &xe_sriov_dev_ktype, parent, "sriov_admin");
+	err = kobject_add(root, parent, "sriov_admin");
 	if (err)
 		return pf_sysfs_error(xe, err, "root init");
 
@@ -505,20 +509,14 @@ static int pf_setup_tree(struct xe_device *xe)
 	root = xe->sriov.pf.sysfs.root;
 
 	for (n = 0; n <= totalvfs; n++) {
-		kobj = create_xe_sriov_kobj(xe, VFID(n));
-		if (!kobj)
-			return pf_sysfs_error(xe, -ENOMEM, "tree obj");
-
-		err = devm_add_action_or_reset(xe->drm.dev, action_put_kobject, root);
-		if (err)
-			return pf_sysfs_error(xe, err, "tree action");
+		kobj = create_xe_sriov_kobj(xe, VFID(n), &xe_sriov_vf_ktype);
+		if (IS_ERR(kobj))
+			return pf_sysfs_error(xe, PTR_ERR(kobj), "tree obj");
 
 		if (n)
-			err = kobject_init_and_add(kobj, &xe_sriov_vf_ktype,
-						   root, "vf%u", n);
+			err = kobject_add(kobj, root, "vf%u", n);
 		else
-			err = kobject_init_and_add(kobj, &xe_sriov_vf_ktype,
-						   root, "pf");
+			err = kobject_add(kobj, root, "pf");
 		if (err)
 			return pf_sysfs_error(xe, err, "tree init");
 
-- 
2.47.1


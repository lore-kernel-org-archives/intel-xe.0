Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AAE9CCF9EB
	for <intel-xe@archiver.kernel.org>; Tue, 28 Oct 2025 20:05:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 404A010E659;
	Tue, 28 Oct 2025 20:05:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OzdREvgQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34DF810E658
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Oct 2025 20:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761681934; x=1793217934;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=itTrzcu+Bl/NasPY+YKcKV7QQoo4gSauf1Uh0etz3UY=;
 b=OzdREvgQ2fj5CQySILX4jfmf9HLMF5NPJABzq6F6pm3bQeaT/kyV+4oh
 07LOEEXqzvFxkJchoT83PBiW8OErpgwedXkHv7+AXmrQKTRbN++N2opcq
 Q/iW81a1nsC+2ipH5L1mbmCn6mb7zxfodzYveCECRyPxsZGuDmGRcgPPJ
 LWYFf2EOySiOvrAoriAvCg0yW8iTbTWyXIgYLyyGllXfQtto2W2mxrbrf
 stZuu0hpg3/InbupLZfUiodIxa5JyPnG5tEeYmJaFnurJqeBtse+OjYco
 6fU7I437+iGKK47d+ViZ0gzQ/Nqd/UMT7a07CoGL6e6IaV+TP+sIGLSUj Q==;
X-CSE-ConnectionGUID: HeFznP+qQXCXaKGbkeNZNA==
X-CSE-MsgGUID: G9U3N9q9SoyAK84bjpJPOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="51368764"
X-IronPort-AV: E=Sophos;i="6.19,262,1754982000"; d="scan'208";a="51368764"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 13:05:34 -0700
X-CSE-ConnectionGUID: H6VvitkgRbqM1hDam9iLGA==
X-CSE-MsgGUID: VwEADnkbRg6iDtbtYzo/OA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,262,1754982000"; d="scan'208";a="185782239"
Received: from ngusev-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.98.92])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 13:05:32 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Nareshkumar Gollakoti <naresh.kumar.g@intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>,
 Maciej Patelczyk <maciej.patelczyk@intel.com>
Subject: [PATCH] drm/xe/pf: Allow to lock/unlock the PF
Date: Tue, 28 Oct 2025 21:05:21 +0100
Message-ID: <20251028200521.184592-1-michal.wajdeczko@intel.com>
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

Some driver functionalities, like eudebug or ccs-mode, can't
be used when VFs are enabled.  Add functions to allow locking
the PF functionality for exclusive usage (either for enabling
VFs or to enable those other features, or simply for testing).
Add also debugfs attributes to explicitly call those functions
if needed.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
Cc: Christoph Manszewski <christoph.manszewski@intel.com>
Cc: Maciej Patelczyk <maciej.patelczyk@intel.com>
---
 drivers/gpu/drm/xe/xe_pci_sriov.c        |  7 +++++
 drivers/gpu/drm/xe/xe_sriov_pf.c         | 38 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_sriov_pf.h         |  4 +++
 drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c | 15 ++++++++++
 drivers/gpu/drm/xe/xe_sriov_pf_types.h   |  3 ++
 5 files changed, 67 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pci_sriov.c b/drivers/gpu/drm/xe/xe_pci_sriov.c
index 735f51effc7a..e1d34860b064 100644
--- a/drivers/gpu/drm/xe/xe_pci_sriov.c
+++ b/drivers/gpu/drm/xe/xe_pci_sriov.c
@@ -120,6 +120,10 @@ static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
 	if (err)
 		goto out;
 
+	err = xe_sriov_pf_try_lock(xe);
+	if (err)
+		goto out;
+
 	/*
 	 * We must hold additional reference to the runtime PM to keep PF in D0
 	 * during VFs lifetime, as our VFs do not implement the PM capability.
@@ -157,6 +161,7 @@ static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
 failed:
 	xe_sriov_pf_unprovision_vfs(xe, num_vfs);
 	xe_pm_runtime_put(xe);
+	xe_sriov_pf_unlock(xe);
 out:
 	xe_sriov_notice(xe, "Failed to enable %u VF%s (%pe)\n",
 			num_vfs, str_plural(num_vfs), ERR_PTR(err));
@@ -186,6 +191,8 @@ static int pf_disable_vfs(struct xe_device *xe)
 	/* not needed anymore - see pf_enable_vfs() */
 	xe_pm_runtime_put(xe);
 
+	xe_sriov_pf_unlock(xe);
+
 	xe_sriov_info(xe, "Disabled %u VF%s\n", num_vfs, str_plural(num_vfs));
 	return 0;
 }
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf.c b/drivers/gpu/drm/xe/xe_sriov_pf.c
index bc1ab9ee31d9..8cdd25db2cf9 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf.c
@@ -157,6 +157,44 @@ int xe_sriov_pf_wait_ready(struct xe_device *xe)
 	return 0;
 }
 
+/**
+ * xe_sriov_pf_try_lock() - Try to lock the PF.
+ * @xe: the PF &xe_device
+ *
+ * This function can only be called on PF.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_sriov_pf_try_lock(struct xe_device *xe)
+{
+	guard(mutex)(xe_sriov_pf_master_mutex(xe));
+
+	if (xe->sriov.pf.owner) {
+		xe_sriov_dbg(xe, "already locked by %ps\n", xe->sriov.pf.owner);
+		return -EBUSY;
+	}
+
+	xe->sriov.pf.owner = __builtin_return_address(0);
+	xe_sriov_dbg_verbose(xe, "locked by %ps\n", xe->sriov.pf.owner);
+
+	return 0;
+}
+
+/**
+ * xe_sriov_pf_unlock() - Unlock the PF.
+ * @xe: the PF &xe_device
+ *
+ * This function can only be called on PF.
+ */
+void xe_sriov_pf_unlock(struct xe_device *xe)
+{
+	guard(mutex)(xe_sriov_pf_master_mutex(xe));
+
+	xe_assert(xe, xe->sriov.pf.owner);
+	xe_sriov_dbg_verbose(xe, "unlocked by %ps\n", __builtin_return_address(0));
+	xe->sriov.pf.owner = NULL;
+}
+
 /**
  * xe_sriov_pf_print_vfs_summary - Print SR-IOV PF information.
  * @xe: the &xe_device to print info from
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf.h b/drivers/gpu/drm/xe/xe_sriov_pf.h
index cba3fde9581f..2261596bb4fe 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf.h
+++ b/drivers/gpu/drm/xe/xe_sriov_pf.h
@@ -17,11 +17,15 @@ bool xe_sriov_pf_readiness(struct xe_device *xe);
 int xe_sriov_pf_init_early(struct xe_device *xe);
 int xe_sriov_pf_init_late(struct xe_device *xe);
 int xe_sriov_pf_wait_ready(struct xe_device *xe);
+int xe_sriov_pf_try_lock(struct xe_device *xe);
+void xe_sriov_pf_unlock(struct xe_device *xe);
 void xe_sriov_pf_print_vfs_summary(struct xe_device *xe, struct drm_printer *p);
 #else
 static inline bool xe_sriov_pf_readiness(struct xe_device *xe) { return false; }
 static inline int xe_sriov_pf_init_early(struct xe_device *xe) { return 0; }
 static inline int xe_sriov_pf_init_late(struct xe_device *xe) { return 0; }
+int xe_sriov_pf_try_lock(struct xe_device *xe) { return 0; }
+void xe_sriov_pf_unlock(struct xe_device *xe) { }
 #endif
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
index a81aa05c5532..7c011462244d 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
@@ -96,12 +96,27 @@ static inline int xe_sriov_pf_restore_auto_provisioning(struct xe_device *xe)
 	return xe_sriov_pf_provision_set_mode(xe, XE_SRIOV_PROVISIONING_MODE_AUTO);
 }
 
+static inline int xe_sriov_pf_try_lock_pf(struct xe_device *xe)
+{
+	return xe_sriov_pf_try_lock(xe);
+}
+
+static inline int xe_sriov_pf_force_unlock_pf(struct xe_device *xe)
+{
+	xe_sriov_pf_unlock(xe);
+	return 0;
+}
+
 DEFINE_SRIOV_ATTRIBUTE(restore_auto_provisioning);
+DEFINE_SRIOV_ATTRIBUTE(try_lock_pf);
+DEFINE_SRIOV_ATTRIBUTE(force_unlock_pf);
 
 static void pf_populate_root(struct xe_device *xe, struct dentry *dent)
 {
 	debugfs_create_file("restore_auto_provisioning", 0200, dent, xe,
 			    &restore_auto_provisioning_fops);
+	debugfs_create_file("try_lock_pf", 0200, dent, xe, &try_lock_pf_fops);
+	debugfs_create_file("force_unlock_pf", 0200, dent, xe, &force_unlock_pf_fops);
 }
 
 static int simple_show(struct seq_file *m, void *data)
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_types.h b/drivers/gpu/drm/xe/xe_sriov_pf_types.h
index c753cd59aed2..91da3c979922 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_types.h
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_types.h
@@ -36,6 +36,9 @@ struct xe_device_pf {
 	/** @master_lock: protects all VFs configurations across GTs */
 	struct mutex master_lock;
 
+	/** @owner: the RET_IP of the owner who locked the PF */
+	void *owner;
+
 	/** @provision: device level provisioning data. */
 	struct xe_sriov_pf_provision provision;
 
-- 
2.47.1


Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA6D7C10DC1
	for <intel-xe@archiver.kernel.org>; Wed,  6 Dec 2023 12:58:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BB2210E71B;
	Wed,  6 Dec 2023 12:58:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 428BB10E72F
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Dec 2023 12:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701867522; x=1733403522;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=BSBCBCkhBgWe2FMoLfXN+G9pSLbIyFnNju2ZIUzXgEo=;
 b=HOsoRxvn7H+3hTB5JPInhQiZ05p0uRE4cx9HLTXoxeGn0S5c5OuKIxTc
 2LkaTLjC7IB3n95CtSc62bU5E49Yt8KX6ZoXJbKUuF6Cgc6WtBjPq7B1v
 FymJvsE51wRfrZ6oWf8bQIIzm9q974KbkHE56o1IhgoWt7Bpjna2Vfmh0
 0xe3RTD8pTmKtmCuCMHwYQu4bOgC0mfA/NQetduJyytGgepHmK6BWml2W
 aFSZO7m29VicuM2DFe3haL2KgCOmpnByUbkCdiCATtPoTGiQUO9zX3/YR
 JH5JUEQwTyWog3SDCejPhdAFofgEWeHjBOaUgq2+J1yed2UGIwwfB29QG A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="1123973"
X-IronPort-AV: E=Sophos;i="6.04,255,1695711600"; 
   d="scan'208";a="1123973"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2023 04:58:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="1018565125"
X-IronPort-AV: E=Sophos;i="6.04,255,1695711600"; d="scan'208";a="1018565125"
Received: from binm223x-mobl2.gar.corp.intel.com (HELO fedora..)
 ([10.249.254.121])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2023 04:58:41 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  6 Dec 2023 13:58:17 +0100
Message-ID: <20231206125818.4164-17-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231206125818.4164-1-thomas.hellstrom@linux.intel.com>
References: <20231206125818.4164-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [CI 17/17] drm/xe: Disable panic_on_warn for testing
 purposes.
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

Turn off panic_on_warn and add some debugging printouts.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_device.c       | 3 ++-
 drivers/gpu/drm/xe/xe_ttm_sys_mgr.c  | 2 ++
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c | 3 +++
 kernel/panic.c                       | 1 +
 4 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 8423c817111b..73a99c1a0172 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -191,6 +191,7 @@ static void xe_device_destroy(struct drm_device *dev, void *dummy)
 	if (xe->unordered_wq)
 		destroy_workqueue(xe->unordered_wq);
 
+	pr_info("TTM device fini.\n");
 	ttm_device_fini(&xe->ttm);
 }
 
@@ -400,7 +401,7 @@ int xe_device_probe(struct xe_device *xe)
 	u8 id;
 
 	xe_pat_init_early(xe);
-
+	panic_on_warn = 0;
 	xe->info.mem_region_mask = 1;
 	err = xe_display_init_nommio(xe);
 	if (err)
diff --git a/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c b/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
index 3e1fa0c832ca..2183ec7989f9 100644
--- a/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
@@ -88,6 +88,8 @@ static void ttm_sys_mgr_fini(struct drm_device *drm, void *arg)
 	struct ttm_resource_manager *man = &xe->mem.sys_mgr;
 	int err;
 
+	drain_workqueue(xe->ttm.wq);
+	pr_info("TT mgr fini. BO count is %d\n", atomic_read(&ttm_glob.bo_count));
 	ttm_resource_manager_set_used(man, false);
 
 	err = ttm_resource_manager_evict_all(&xe->ttm, man);
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
index 953e5dc0fd80..22b6b7897339 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
@@ -316,6 +316,9 @@ static void ttm_vram_mgr_fini(struct drm_device *dev, void *arg)
 	struct xe_ttm_vram_mgr *mgr = arg;
 	struct ttm_resource_manager *man = &mgr->manager;
 
+	drain_workqueue(xe->ttm.wq);
+	pr_info("VRAM mgr fini. BO count is %d\n", atomic_read(&ttm_glob.bo_count));
+
 	ttm_resource_manager_set_used(man, false);
 
 	if (ttm_resource_manager_evict_all(&xe->ttm, man))
diff --git a/kernel/panic.c b/kernel/panic.c
index bc59531848e4..1c8057027f20 100644
--- a/kernel/panic.c
+++ b/kernel/panic.c
@@ -59,6 +59,7 @@ static int pause_on_oops_flag;
 static DEFINE_SPINLOCK(pause_on_oops_lock);
 bool crash_kexec_post_notifiers;
 int panic_on_warn __read_mostly;
+EXPORT_SYMBOL_GPL(panic_on_warn);
 unsigned long panic_on_taint;
 bool panic_on_taint_nousertaint = false;
 static unsigned int warn_limit __read_mostly;
-- 
2.42.0


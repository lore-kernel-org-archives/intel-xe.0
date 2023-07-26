Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0BB9C001E0
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jul 2023 09:24:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 820AF10E440;
	Wed, 26 Jul 2023 09:24:07 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB87610E440
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Jul 2023 09:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690363444; x=1721899444;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xd/eojQs86mWbLVqyO8VX9iMMf1HZYb7a6BzpWYs6Ho=;
 b=aq+PeGTC38KGFhkVO7bQ75Lt95RvVNY15hobfjggc3nW342xkFzhKi1d
 b8ufFzQeN00NH1o3WcNlvEmaca4snNpkebDKpS9HiOwc7Iw3k+tjWCesL
 dbcIXdPGktbuMcfvOUMRCp8dmtj89mzuIFZ16BqLM/38W3kuWw15s2cV/
 hUsYFyLe/waMyeZyrtvfDiAH+EAuSmlD6r1eACRg5PH4NpZpOBEEjRqDx
 ej/s2UZ3qRkVDzNYg0bEOCqVI9Siz4P0RE1unl32chRu+tKDTHW7KPwNi
 Nqb3TgqVyzXCSh9k4pPy1vBsff4OvR56Be76QsFw1W9cbILKtG1gPX4yh g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="366848976"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; d="scan'208";a="366848976"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2023 02:24:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="720397419"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; d="scan'208";a="720397419"
Received: from cmchugh-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.31.174])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2023 02:24:02 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 26 Jul 2023 10:23:49 +0100
Message-ID: <20230726092348.212488-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2] drm/xe/engine: add missing rpm for bind
 engines
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Bind engines need to use the migration vm, however we don't have any rpm
for such a vm, otherwise the kernel would prevent rpm suspend-resume.
There are two issues here, first is the actual engine create which needs
to touch the lrc, but since that is in VRAM we trigger loads of missing
mem_access asserts. The second issue is when destroying the actual
engine, which requires GuC CT to deregister the context.

v2 (Rodrigo):
  - Just use ENGINE_FLAG_VM as the indicator that we need to hold an rpm
    ref. This also handles the case in xe_vm_create() where we create
    default bind engines.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/499
Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/504
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_engine.c       | 19 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_engine_types.h |  1 +
 2 files changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_engine.c b/drivers/gpu/drm/xe/xe_engine.c
index 0102dad16e29..c30810a687b1 100644
--- a/drivers/gpu/drm/xe/xe_engine.c
+++ b/drivers/gpu/drm/xe/xe_engine.c
@@ -76,6 +76,17 @@ static struct xe_engine *__xe_engine_create(struct xe_device *xe,
 	if (err)
 		goto err_lrc;
 
+	/*
+	 * Normally the user vm holds an rpm ref to keep the device
+	 * awake, and the context holds a ref for the vm, however for
+	 * some engines we use the kernels migrate vm underneath which
+	 * offers no such rpm ref. Make sure we keep a ref here, so we
+	 * can perform GuC CT actions when needed. Caller is expected to
+	 * have already grabbed the rpm ref outside any sensitive locks.
+	 */
+	if (e->flags & ENGINE_FLAG_VM)
+		drm_WARN_ON(&xe->drm, !xe_device_mem_access_get_if_ongoing(xe));
+
 	return e;
 
 err_lrc:
@@ -152,6 +163,8 @@ void xe_engine_fini(struct xe_engine *e)
 		xe_lrc_finish(e->lrc + i);
 	if (e->vm)
 		xe_vm_put(e->vm);
+	if (e->flags & ENGINE_FLAG_VM)
+		xe_device_mem_access_put(gt_to_xe(e->gt));
 
 	kfree(e);
 }
@@ -560,6 +573,9 @@ int xe_engine_create_ioctl(struct drm_device *dev, void *data,
 			if (XE_IOCTL_DBG(xe, !hwe))
 				return -EINVAL;
 
+			/* The migration vm doesn't hold rpm ref */
+			xe_device_mem_access_get(xe);
+
 			migrate_vm = xe_migrate_get_vm(gt_to_tile(gt)->migrate);
 			new = xe_engine_create(xe, migrate_vm, logical_mask,
 					       args->width, hwe,
@@ -568,6 +584,9 @@ int xe_engine_create_ioctl(struct drm_device *dev, void *data,
 					       (id ?
 					       ENGINE_FLAG_BIND_ENGINE_CHILD :
 					       0));
+
+			xe_device_mem_access_put(xe); /* now held by engine */
+
 			xe_vm_put(migrate_vm);
 			if (IS_ERR(new)) {
 				err = PTR_ERR(new);
diff --git a/drivers/gpu/drm/xe/xe_engine_types.h b/drivers/gpu/drm/xe/xe_engine_types.h
index 36bfaeec23f4..7aa5d9ef7896 100644
--- a/drivers/gpu/drm/xe/xe_engine_types.h
+++ b/drivers/gpu/drm/xe/xe_engine_types.h
@@ -56,6 +56,7 @@ struct xe_engine {
 #define ENGINE_FLAG_KERNEL		BIT(1)
 #define ENGINE_FLAG_PERSISTENT		BIT(2)
 #define ENGINE_FLAG_COMPUTE_MODE	BIT(3)
+/* Caller needs to hold rpm ref when creating engine with ENGINE_FLAG_VM */
 #define ENGINE_FLAG_VM			BIT(4)
 #define ENGINE_FLAG_BIND_ENGINE_CHILD	BIT(5)
 #define ENGINE_FLAG_WA			BIT(6)
-- 
2.41.0


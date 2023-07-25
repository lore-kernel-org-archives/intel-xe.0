Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14230C001E0
	for <intel-xe@archiver.kernel.org>; Tue, 25 Jul 2023 11:01:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAE0B10E0CF;
	Tue, 25 Jul 2023 11:01:53 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB32A10E0CF
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Jul 2023 11:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690282912; x=1721818912;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TzM0VJuzPc1a08fZ2+GXduVYDOCJM0SGHGdGXNteyFk=;
 b=CZvDW+Sg+1lXH63rfq+lmx/IhUMXc+7CJsWGXN7ZRVLY9I6IgA1aG0yp
 CFFiwtTzRppcPzDtj5jqPpfxm7AGm5/2AwDA/HY+B56KeF8Wc4wsq6V1g
 879DDq2e2P/qwXCy8k7Gfp+WL+aTODQZze8Tr6A1KQP7Yzs4hEmhQBCN9
 uwTDdy/trUKfiZLWse0ehHOg7jNrb1FHzTo1/UnuSWxbiTkGdU9s71Q7L
 IYPks0ko0KfHL/iZN8oeQUSYpXh6lJoWXPGQTbmht5Mqw/a/FFOicQWJQ
 tFS1JcrspQukD8u0AhJCkewwCK9fn7C3mvlKffgH7CLRxpiPzSeNc1qtg Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="431489624"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; d="scan'208";a="431489624"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2023 04:01:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="703238444"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; d="scan'208";a="703238444"
Received: from kkbrenna-mobl1.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.31.100])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2023 04:01:27 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 25 Jul 2023 12:01:17 +0100
Message-ID: <20230725110116.114688-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe/engine: add missing rpm for bind engines
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

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/499
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_engine.c       | 20 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_engine_types.h |  1 +
 2 files changed, 21 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_engine.c b/drivers/gpu/drm/xe/xe_engine.c
index 59e0a9e085ba..dba71f53e53e 100644
--- a/drivers/gpu/drm/xe/xe_engine.c
+++ b/drivers/gpu/drm/xe/xe_engine.c
@@ -76,6 +76,17 @@ static struct xe_engine *__xe_engine_create(struct xe_device *xe,
 	if (err)
 		goto err_lrc;
 
+	/*
+	 * Normally the user vm holds an rpm ref to keep the device awake, and
+	 * the context holds a ref for the vm, however for some engines we use
+	 * the kernels migrate vm underneath which offers no such rpm ref. Make
+	 * sure we keep a ref here, so we can perform GuC CT actions when
+	 * needed. Caller is expected to have already grabbed the rpm ref
+	 * outside any sensitive locks.
+	 */
+	if (e->flags & ENGINE_FLAG_HOLD_RPM)
+		drm_WARN_ON(&xe->drm, !xe_device_mem_access_get_if_ongoing(xe));
+
 	return e;
 
 err_lrc:
@@ -152,6 +163,8 @@ void xe_engine_fini(struct xe_engine *e)
 		xe_lrc_finish(e->lrc + i);
 	if (e->vm)
 		xe_vm_put(e->vm);
+	if (e->flags & ENGINE_FLAG_HOLD_RPM)
+		xe_device_mem_access_put(gt_to_xe(e->gt));
 
 	kfree(e);
 }
@@ -560,14 +573,21 @@ int xe_engine_create_ioctl(struct drm_device *dev, void *data,
 			if (XE_IOCTL_DBG(xe, !hwe))
 				return -EINVAL;
 
+			/* The migration vm doesn't hold rpm ref */
+			xe_device_mem_access_get(xe);
+
 			migrate_vm = xe_migrate_get_vm(gt_to_tile(gt)->migrate);
 			new = xe_engine_create(xe, migrate_vm, logical_mask,
 					       args->width, hwe,
+					       ENGINE_FLAG_HOLD_RPM |
 					       ENGINE_FLAG_PERSISTENT |
 					       ENGINE_FLAG_VM |
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
index 36bfaeec23f4..a3867e4db0bb 100644
--- a/drivers/gpu/drm/xe/xe_engine_types.h
+++ b/drivers/gpu/drm/xe/xe_engine_types.h
@@ -59,6 +59,7 @@ struct xe_engine {
 #define ENGINE_FLAG_VM			BIT(4)
 #define ENGINE_FLAG_BIND_ENGINE_CHILD	BIT(5)
 #define ENGINE_FLAG_WA			BIT(6)
+#define ENGINE_FLAG_HOLD_RPM		BIT(7)
 
 	/**
 	 * @flags: flags for this engine, should statically setup aside from ban
-- 
2.41.0


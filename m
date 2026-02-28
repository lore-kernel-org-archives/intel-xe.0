Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 947331048938
	for <intel-xe@archiver.kernel.org>; Sat, 28 Feb 2026 01:35:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B18C10EC68;
	Sat, 28 Feb 2026 01:35:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jjb1xqC+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71D0310E1E1
 for <intel-xe@lists.freedesktop.org>; Sat, 28 Feb 2026 01:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772242509; x=1803778509;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YPurCGIaC2OSihBUwNqPohl/AIdcAzRlrmzlUAptUEU=;
 b=jjb1xqC+YstJz57J97+ocexbyjElWVifNd0IbwdjT0PA4qHjY1bMuxDF
 Sw3tzuiG/uzqAvUwgeSA7fgKrjwLTkmE3fiNrhYgMMlw5e7vhCJTw7urJ
 DqI0truvdUTm4w+0qtooBEsRdHkQFkPkdGuptoe8iI8QbLpAIGOkB9mkl
 gnI2z8eyk8fDMRh+BD9wFC3aNNqwdiUeXinbhv9d1qb19ZO5fC3aATgex
 +qVnFLtNRd+oErQvjg4fbrVTGcWMqeb2r5/7uywU21yl4HQjJe1mIhjRY
 23Lsn5YW3Rcue/1f14yzW2BTXgKcFsof9sRe41enOXBIbOlOp4ku/Mvii w==;
X-CSE-ConnectionGUID: 18tZah/XQf6WJQK+Pfa3Qw==
X-CSE-MsgGUID: zpuuTFdyRI+9TVTJxOaing==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="83966345"
X-IronPort-AV: E=Sophos;i="6.21,315,1763452800"; d="scan'208";a="83966345"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 17:35:06 -0800
X-CSE-ConnectionGUID: x3GLf/ooRtWmQRbuSFaHrA==
X-CSE-MsgGUID: 2MqyPis7SPObdu6ff1bFQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,315,1763452800"; d="scan'208";a="213854851"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 17:35:07 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: stuart.summers@intel.com, arvind.yadav@intel.com,
 himal.prasad.ghimiray@intel.com, thomas.hellstrom@linux.intel.com,
 francois.dugast@intel.com
Subject: [PATCH v3 06/25] drm/xe: Add XE_BO_FLAG_PUT_VM_ASYNC
Date: Fri, 27 Feb 2026 17:34:42 -0800
Message-Id: <20260228013501.106680-7-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260228013501.106680-1-matthew.brost@intel.com>
References: <20260228013501.106680-1-matthew.brost@intel.com>
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

Add XE_BO_FLAG_PUT_VM_ASYNC, which indicates that an async BO put must
also drop an additional reference to the BO’s VM. This is useful when a
kernel BO, one that does not normally hold a VM reference, needs to be
put asynchronously, ensuring the shared dma-resv object does not
disappear before the BO.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 8 +++++++-
 drivers/gpu/drm/xe/xe_bo.h | 1 +
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 8ff193600443..d4c8ef8ff2c3 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -3567,8 +3567,14 @@ void xe_bo_put_commit(struct llist_head *deferred)
 	if (!freed)
 		return;
 
-	llist_for_each_entry_safe(bo, next, freed, freed)
+	llist_for_each_entry_safe(bo, next, freed, freed) {
+		struct xe_vm *vm = bo->vm;
+		bool async = bo->flags & XE_BO_FLAG_PUT_VM_ASYNC;
+
 		drm_gem_object_free(&bo->ttm.base.refcount);
+		if (async)
+			xe_vm_put(vm);
+	}
 }
 
 static void xe_bo_dev_work_func(struct work_struct *work)
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index bf284ed47325..14be9c1bb09d 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -52,6 +52,7 @@
 #define XE_BO_FLAG_CPU_ADDR_MIRROR	BIT(24)
 #define XE_BO_FLAG_FORCE_USER_VRAM	BIT(25)
 #define XE_BO_FLAG_NO_COMPRESSION	BIT(26)
+#define XE_BO_FLAG_PUT_VM_ASYNC		BIT(27)
 
 /* this one is trigger internally only */
 #define XE_BO_FLAG_INTERNAL_TEST	BIT(30)
-- 
2.34.1


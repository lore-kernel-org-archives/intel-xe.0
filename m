Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61AF0C79F82
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 02:22:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9AB810F82D;
	Fri,  4 Sep 2026 02:22:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iEApvMZw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADA4D10E1BB
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Sep 2026 02:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788488535; x=1820024535;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=KblnrVj0ilJUr2xwTobEnIdfyb2CQndDLiMrB6aEmJg=;
 b=iEApvMZwpPSASefiuKRHLIyxehQAMWWhbiCTJPba8ZppJW1kxc4I6tEB
 5whHi/0YAwghEJFUNV9uo9NPkyUxuPLM4YXDthMU9Tvr/TNQclZUYP9i6
 n4HHcvJQlMg4W5G/fekYPdPb6qVs6MhUgy1RodU6sjYUAqCp7VYePxsys
 YmmL76QfWY850Zw6my3lABES+2N/qcb9WS65MiNtOcv/bjZSdNd9mKQvo
 MDmB+vRX+COZTEUMgeqHToF+Dr2N3mxWOhTj/FQvXSq7qPrexhwXgGf11
 dutzaMKDLs6MDiVUuiUSWWTh8xGgokEsw1/6WlM8DICs2Fhh02cKEpaWB w==;
X-CSE-ConnectionGUID: LA/2Gy7ASvyt/j3SVGeKMg==
X-CSE-MsgGUID: Qlbsds/PSCGERpf05FcrmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="106506278"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="106506278"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 19:22:14 -0700
X-CSE-ConnectionGUID: Vuvm+3YgSiuD9ljnLtB86A==
X-CSE-MsgGUID: RC7Ob9RuRIeVXt+ZpNRcjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="275185119"
Received: from gsse-cloud1.jf.intel.com ([10.54.39.91])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 19:22:14 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v5 06/25] drm/xe: Add XE_BO_FLAG_PUT_VM_ASYNC
Date: Thu,  3 Sep 2026 19:21:48 -0700
Message-Id: <20260904022207.3490018-7-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260904022207.3490018-1-matthew.brost@intel.com>
References: <20260904022207.3490018-1-matthew.brost@intel.com>
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
Link: https://patch.msgid.link/20260228013501.106680-7-matthew.brost@intel.com
Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/xe_bo.c | 8 +++++++-
 drivers/gpu/drm/xe/xe_bo.h | 1 +
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index dde309821237..5cde5dff2d48 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -3989,8 +3989,14 @@ void xe_bo_put_commit(struct llist_head *deferred)
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
index 6092f305ea8e..b810da83e9ef 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -54,6 +54,7 @@
 #define XE_BO_FLAG_FORCE_USER_VRAM	BIT(25)
 #define XE_BO_FLAG_NO_COMPRESSION	BIT(26)
 #define XE_BO_FLAG_NEEDS_1G		BIT(27)
+#define XE_BO_FLAG_PUT_VM_ASYNC		BIT(28)
 
 /* this one is trigger internally only */
 #define XE_BO_FLAG_INTERNAL_TEST	BIT(30)
-- 
2.34.1


Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8C49C4167B
	for <intel-xe@archiver.kernel.org>; Wed,  6 Dec 2023 22:21:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9705D10E7D4;
	Wed,  6 Dec 2023 22:21:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D09D10E7CA
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Dec 2023 22:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701901283; x=1733437283;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0DHsHDfSS/hXkbm03CSS2eu8rWjK41jBIH2sNAW992k=;
 b=mr6aedvpFrzGcz6syGYE5DkhqpjcIkVl9oYfqDdoKBo6QVbzdCJyR7P2
 xfBgPPpZj3bS6l/rwSXHhwKViYM8ppQWhEdJlaHwWVGwvqJqrqOv/zSZ0
 GDv6MHEQHaiZSK74tgThPDWBRGBaRM18WOeqM0PDI+6pJ6CviIMoqRnws
 om2rMTHkSkk/7sS2hllyNsqQ1npVJYJuKQT8EaBtooMfiIGhzCIifLTqv
 RQF8qg03W3z37fAK2Mu+0EOLTURlfTplfq6jBo/CMZm7i7/Qvwj9jjewN
 xaOh6C+iVR+RvrUvEbz4q/kKOe88yOn/llHSH+T1yDetUFmWcxTVGdfXS g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="425286691"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="425286691"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2023 14:21:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="800500664"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="800500664"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2023 14:21:21 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed,  6 Dec 2023 14:21:37 -0800
Message-Id: <20231206222141.398040-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231206222141.398040-1-matthew.brost@intel.com>
References: <20231206222141.398040-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4 2/6] drm/xe: Use a flags field instead of
 bools for sync parse
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

Use a flags field instead of severval bools for sync parse as it is
easier to read and less bug prone.

v2: Pull in header change from subsequent patch

Suggested-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_exec.c | 5 +++--
 drivers/gpu/drm/xe/xe_sync.c | 4 +++-
 drivers/gpu/drm/xe/xe_sync.h | 5 ++++-
 drivers/gpu/drm/xe/xe_vm.c   | 5 +++--
 4 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
index 347239f28170..a8a025495b14 100644
--- a/drivers/gpu/drm/xe/xe_exec.c
+++ b/drivers/gpu/drm/xe/xe_exec.c
@@ -181,8 +181,9 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 
 	for (i = 0; i < args->num_syncs; i++) {
 		err = xe_sync_entry_parse(xe, xef, &syncs[num_syncs++],
-					  &syncs_user[i], true,
-					  xe_vm_in_lr_mode(vm));
+					  &syncs_user[i], SYNC_PARSE_FLAG_EXEC |
+					  (xe_vm_in_lr_mode(vm) ?
+					   SYNC_PARSE_FLAG_LR_MODE : 0));
 		if (err)
 			goto err_syncs;
 	}
diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
index 936227e79483..2a3f508722fc 100644
--- a/drivers/gpu/drm/xe/xe_sync.c
+++ b/drivers/gpu/drm/xe/xe_sync.c
@@ -98,10 +98,12 @@ static void user_fence_cb(struct dma_fence *fence, struct dma_fence_cb *cb)
 int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
 			struct xe_sync_entry *sync,
 			struct drm_xe_sync __user *sync_user,
-			bool exec, bool in_lr_mode)
+			unsigned int flags)
 {
 	struct drm_xe_sync sync_in;
 	int err;
+	bool exec = flags & SYNC_PARSE_FLAG_EXEC;
+	bool in_lr_mode = flags & SYNC_PARSE_FLAG_LR_MODE;
 	bool signal;
 
 	if (copy_from_user(&sync_in, sync_user, sizeof(*sync_user)))
diff --git a/drivers/gpu/drm/xe/xe_sync.h b/drivers/gpu/drm/xe/xe_sync.h
index 30958ddc4cdc..1b748cec4678 100644
--- a/drivers/gpu/drm/xe/xe_sync.h
+++ b/drivers/gpu/drm/xe/xe_sync.h
@@ -12,10 +12,13 @@ struct xe_device;
 struct xe_file;
 struct xe_sched_job;
 
+#define SYNC_PARSE_FLAG_EXEC			BIT(0)
+#define SYNC_PARSE_FLAG_LR_MODE			BIT(1)
+
 int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
 			struct xe_sync_entry *sync,
 			struct drm_xe_sync __user *sync_user,
-			bool exec, bool compute_mode);
+			unsigned int flags);
 int xe_sync_entry_wait(struct xe_sync_entry *sync);
 int xe_sync_entry_add_deps(struct xe_sync_entry *sync,
 			   struct xe_sched_job *job);
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 44b2972d5d5f..42077e3db36a 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3106,8 +3106,9 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	syncs_user = u64_to_user_ptr(args->syncs);
 	for (num_syncs = 0; num_syncs < args->num_syncs; num_syncs++) {
 		err = xe_sync_entry_parse(xe, xef, &syncs[num_syncs],
-					  &syncs_user[num_syncs], false,
-					  xe_vm_in_lr_mode(vm));
+					  &syncs_user[num_syncs],
+					  xe_vm_in_lr_mode(vm) ?
+					  SYNC_PARSE_FLAG_LR_MODE : 0);
 		if (err)
 			goto free_syncs;
 	}
-- 
2.34.1


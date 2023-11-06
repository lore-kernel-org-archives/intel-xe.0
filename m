Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99795C00A5A
	for <intel-xe@archiver.kernel.org>; Mon,  6 Nov 2023 11:22:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F25A110E2E4;
	Mon,  6 Nov 2023 11:22:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74AB410E2DA
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Nov 2023 11:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699269760; x=1730805760;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mRHMWvUz3XmIpKdPbudNuEghlsbfKr3l4/3sCnoEiaY=;
 b=Kaukkrg5JQ1/Q5e7Xrf97aLXnmjX90ReDz2KCR6wh4FTmQ4+Uu2gopb7
 negD+eQau6hncJ8HBydPbtv2VWOPxHJTwf+g4+EnV1v4HqveMUqLx6HtR
 jkZ/8iqxrtWIQv5fa3aDXJ+ijqIZmNCh8Pwlqzk1ihtbyHAfyDROd+0dU
 ZsmixozybQLWabX6OigW4jwofrFAmGTeUEDrCz1pZYCksYL2NuolOSrw5
 uTRnS6xorMO6yx7bVx8KFPu28TRa6SCc48lcqxnYAFDlhvyQfsv5t/X5M
 DYJN2cKn8y4LuTgo2bvacY0zdNe77nKiAuVCYKssQBhQnEyrbdIej3mFN A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="379646863"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; d="scan'208";a="379646863"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 03:22:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="879411707"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; d="scan'208";a="879411707"
Received: from mkuoppal-desk.fi.intel.com ([10.237.72.193])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 03:22:36 -0800
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon,  6 Nov 2023 13:18:39 +0200
Message-Id: <20231106111845.2333093-20-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231106111845.2333093-1-mika.kuoppala@linux.intel.com>
References: <20231106111845.2333093-1-mika.kuoppala@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC 19/25] xe/drm: Include debug_metadata in
 usercoredump
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

From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>

Include all created debug metadatas in usercoredump,
so the user can include i.e. elf binary to make the
meaningful in offline analysis.

Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
---
 drivers/gpu/drm/xe/xe_usercoredump.c       | 54 +++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_usercoredump_types.h |  9 ++++
 2 files changed, 62 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_usercoredump.c b/drivers/gpu/drm/xe/xe_usercoredump.c
index 2d3fc5a24c48..95a893a31302 100644
--- a/drivers/gpu/drm/xe/xe_usercoredump.c
+++ b/drivers/gpu/drm/xe/xe_usercoredump.c
@@ -5,6 +5,9 @@
 
 #include "xe_usercoredump.h"
 
+#include <drm/xe_drm.h>
+
+#include "xe_debug_metadata.h"
 #include "xe_device_types.h"
 #include "xe_exec_queue_types.h"
 #include "xe_vm.h"
@@ -123,12 +126,19 @@ static void free_vma_snapshot(struct xe_vma_snapshot *s)
 void xe_user_state_snapshot_release(struct xe_user_state_snapshot *s)
 {
 	struct xe_vma_snapshot *v, *v_tmp;
+	struct xe_debug_metadata_snapshot *ms, *ms_tmp;
 
 	mutex_lock(&s->vmas.lock);
 	list_for_each_entry_safe(v, v_tmp, &s->vmas.list, link)
 		free_vma_snapshot(v);
 	mutex_unlock(&s->vmas.lock);
 
+	list_for_each_entry_safe(ms, ms_tmp, &s->metadata_list, link) {
+		list_del(&ms->link);
+		xe_debug_metadata_put(ms->mdata);
+		kfree(ms);
+	}
+
 	mutex_destroy(&s->vmas.lock);
 
 	put_pid(s->pid);
@@ -195,6 +205,28 @@ static void capture_vmas(struct xe_user_state_snapshot *s,
 	up_read(&vm->lock);
 }
 
+static void capture_metadata(struct xe_user_state_snapshot *s,
+			     struct xe_file *xef)
+{
+	struct xe_debug_metadata_snapshot *ms;
+	struct xe_debug_metadata *mdata;
+	unsigned long i;
+
+	INIT_LIST_HEAD(&s->metadata_list);
+	mutex_lock(&xef->debug_metadata.lock);
+	xa_for_each(&xef->debug_metadata.xa, i, mdata) {
+		ms = kzalloc(sizeof(*ms), GFP_KERNEL);
+		if (!ms)
+			break;
+
+		INIT_LIST_HEAD(&ms->link);
+		list_add(&ms->link, &s->metadata_list);
+		kref_get(&mdata->refcount);
+		ms->mdata = mdata;
+	}
+	mutex_unlock(&xef->debug_metadata.lock);
+}
+
 static void hexdump(struct drm_printer *m, const void *buf, size_t len)
 {
 	const size_t rowsize = 8 * sizeof(u32);
@@ -242,10 +274,23 @@ static void vma_snapshot_print(struct drm_printer *p,
 		hexdump(p, s->data, s->captured_bytes);
 }
 
+static const char *debug_metadata_type_to_str(const u64 type)
+{
+	switch (type) {
+	case DRM_XE_DEBUG_METADATA_ELF_BINARY:
+		return "elf binary";
+	case DRM_XE_DEBUG_METADATA_PROGRAM_MODULE:
+		return "program module";
+	}
+
+	return "unknown";
+}
+
 void xe_user_state_snapshot_print(struct xe_user_state_snapshot *s,
 				  struct drm_printer *p)
 {
 	struct xe_vma_snapshot *v;
+	struct xe_debug_metadata_snapshot *ms;
 
 	drm_printf(p, "PID: %d\n", pid_vnr(s->pid));
 	drm_printf(p, "Comm: %s\n", s->comm);
@@ -254,8 +299,13 @@ void xe_user_state_snapshot_print(struct xe_user_state_snapshot *s,
 	mutex_lock(&s->vmas.lock);
 	list_for_each_entry(v, &s->vmas.list, link)
 		vma_snapshot_print(p, v);
-
 	mutex_unlock(&s->vmas.lock);
+
+	list_for_each_entry(ms, &s->metadata_list, link) {
+		drm_printf(p, "Metadata id=%llu of type %s:\n",
+			   ms->mdata->id, debug_metadata_type_to_str(ms->mdata->type));
+		hexdump(p, ms->mdata->ptr, ms->mdata->len);
+	}
 }
 
 struct xe_user_state_snapshot *
@@ -287,6 +337,8 @@ xe_user_state_snapshot_capture(struct xe_exec_queue *q)
 	}
 
 	capture_vmas(s, q);
+	capture_metadata(s, xef);
+
 
 	return s;
 }
diff --git a/drivers/gpu/drm/xe/xe_usercoredump_types.h b/drivers/gpu/drm/xe/xe_usercoredump_types.h
index 635656e830cf..c69590affde7 100644
--- a/drivers/gpu/drm/xe/xe_usercoredump_types.h
+++ b/drivers/gpu/drm/xe/xe_usercoredump_types.h
@@ -13,6 +13,7 @@
 
 struct xe_device;
 struct xe_pidroot;
+struct xe_debug_metadata;
 
 struct xe_vma_snapshot {
 	struct list_head link;
@@ -28,6 +29,12 @@ struct xe_vma_snapshot {
 	void *data;
 };
 
+struct xe_debug_metadata_snapshot {
+	struct list_head link;
+
+	struct xe_debug_metadata *mdata;
+};
+
 /**
  * struct xe_user_state_snapshot - Crash snapshot
  *
@@ -43,6 +50,8 @@ struct xe_user_state_snapshot {
 		struct list_head list;
 	} vmas;
 
+	struct list_head metadata_list;
+
 	struct pid *pid;
 	u64 client_id; /* drm client id */
 	char comm[TASK_COMM_LEN];
-- 
2.34.1


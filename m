Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FB47C6FD1C
	for <intel-xe@archiver.kernel.org>; Mon, 13 Mar 2023 20:46:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EE5810E634;
	Mon, 13 Mar 2023 20:46:03 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FB3010E634
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Mar 2023 20:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678740361; x=1710276361;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2JB3gtvw97SktlAwxkWmi5k1PMlQ30uMl2BGLyCW1R8=;
 b=VF7QYE6dAG82ylUBg2Ohde6fKgQq2pjIcDcPpw9nuvJtfz4ispBSzz3c
 OpuN/D3PfM18wlefXljXiW8A21luka3FfhibNMYD78NqsAi4roJwE7NJj
 0YX9cUibAHTKLqH2/hm2n+4FOrAlLQkPe4weaoTCNJrd2mvqPmseONHnJ
 VIuKCgAF9q87DbloioNilyKy+s35ABB8MeykNhGwhrBIPp1aeOcmXJRxP
 PSZAKaRi6fZsCeE7p/rOMMndtpKGifjmVgNW2GvefTflYCCghm3tbuIHO
 H1L3hGidzO2pdcpZteyWCWnHBhSFUlN5YD9RMjHp8BcBunfHJ1azG4MWB A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="334733911"
X-IronPort-AV: E=Sophos;i="5.98,257,1673942400"; d="scan'208";a="334733911"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 13:46:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="924650128"
X-IronPort-AV: E=Sophos;i="5.98,257,1673942400"; d="scan'208";a="924650128"
Received: from lapeders-mobl1.ger.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.254.190])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 13:46:00 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 13 Mar 2023 21:45:17 +0100
Message-Id: <20230313204519.158888-5-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230313204519.158888-1-thomas.hellstrom@linux.intel.com>
References: <20230313204519.158888-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 4/6] drm/xe: Introduce xe_engine_is_idle()
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

Introduce xe_engine_is_idle, and replace the static function in
xe_migrate.c.
The latter had two flaws. First the seqno == 1 test might return a false
true value each time the seqno counter wrapped, Second, the
cur_seqno == next_seqno test would never return true.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_engine.c  | 23 +++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_engine.h  |  2 ++
 drivers/gpu/drm/xe/xe_migrate.c |  8 +-------
 3 files changed, 26 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_engine.c b/drivers/gpu/drm/xe/xe_engine.c
index 7e6367a84f1f..a4fc5afdf688 100644
--- a/drivers/gpu/drm/xe/xe_engine.c
+++ b/drivers/gpu/drm/xe/xe_engine.c
@@ -683,6 +683,29 @@ static void engine_kill_compute(struct xe_engine *e)
 	up_write(&e->vm->lock);
 }
 
+/**
+ * xe_engine_is_idle() - Whether an engine is idle.
+ * @engine: The engine
+ *
+ * FIXME: Need to determine what to use as the short-lived
+ * timeline lock for the engines, so that the return value
+ * of this function becomes more than just an advisory
+ * snapshot in time. The timeline lock must protect the
+ * seqno from racing submissions on the same engine.
+ * Typically vm->resv, but user-created timeline locks use the migrate vm
+ * and never grabs the migrate vm->resv so we have a race there.
+ *
+ * Return: True if the engine is idle, false otherwise.
+ */
+bool xe_engine_is_idle(struct xe_engine *engine)
+{
+	if (XE_WARN_ON(xe_engine_is_parallel(engine)))
+		return false;
+
+	return xe_lrc_seqno(&engine->lrc[0]) ==
+		engine->lrc[0].fence_ctx.next_seqno - 1;
+}
+
 void xe_engine_kill(struct xe_engine *e)
 {
 	struct xe_engine *engine = e, *next;
diff --git a/drivers/gpu/drm/xe/xe_engine.h b/drivers/gpu/drm/xe/xe_engine.h
index a3a44534003f..1cf7f23c4afd 100644
--- a/drivers/gpu/drm/xe/xe_engine.h
+++ b/drivers/gpu/drm/xe/xe_engine.h
@@ -42,6 +42,8 @@ static inline bool xe_engine_is_parallel(struct xe_engine *engine)
 	return engine->width > 1;
 }
 
+bool xe_engine_is_idle(struct xe_engine *engine);
+
 void xe_engine_kill(struct xe_engine *e);
 
 int xe_engine_create_ioctl(struct drm_device *dev, void *data,
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 39ed63829224..dfdc88aa8910 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -1024,12 +1024,6 @@ static bool no_in_syncs(struct xe_sync_entry *syncs, u32 num_syncs)
 	return true;
 }
 
-static bool engine_is_idle(struct xe_engine *e)
-{
-	return !e || e->lrc[0].fence_ctx.next_seqno == 1 ||
-		xe_lrc_seqno(&e->lrc[0]) == e->lrc[0].fence_ctx.next_seqno;
-}
-
 /**
  * xe_migrate_update_pgtables() - Pipelined page-table update
  * @m: The migrate context.
@@ -1082,7 +1076,7 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
 	bool first_munmap_rebind = vma && vma->first_munmap_rebind;
 
 	/* Use the CPU if no in syncs and engine is idle */
-	if (no_in_syncs(syncs, num_syncs) && engine_is_idle(eng)) {
+	if (no_in_syncs(syncs, num_syncs) && (!eng || xe_engine_is_idle(eng))) {
 		fence =  xe_migrate_update_pgtables_cpu(m, vm, bo, updates,
 							num_updates,
 							first_munmap_rebind,
-- 
2.39.2


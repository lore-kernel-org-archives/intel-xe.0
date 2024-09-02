Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D80E1CA0ED3
	for <intel-xe@archiver.kernel.org>; Mon,  2 Sep 2024 14:21:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8800110E30D;
	Mon,  2 Sep 2024 14:21:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZAKLvioQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2B3510E30D
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Sep 2024 14:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725286863; x=1756822863;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=uJuMRIGHlDAJzoPOkMZMpeeAIfPgxLwMvWXDtz4rXSM=;
 b=ZAKLvioQjN/AIujXfiepPIZ4SEXfmoF8DJgIIsJEa78MYZh3WGN0BH52
 wKqm2iqJT2nrZKHvimk685crGuXX0bSH1h68rV6EN6UuqMSywsvhWNfVE
 BFvI6B4QJxxh3WbzhPQnkmGDbwZbW5zAJvUp9WUUKwuyVE1z2xbFywC8L
 ZglOEgQLJhJb+Ka6Y7PE+FrfblxjVbkDuDLXLxKwcXUiVXwK0q6mLb41a
 VodJWqYq+q0RXvRQ3wdSj0Cwbg168Dr61bdDaGoagVHLBCwVOvfZKhZSQ
 QgtRzB+z+/79KBiKWNy6f3sT//LMykWehFgp/a8JRGLFrIJWtA9Nw5fMn A==;
X-CSE-ConnectionGUID: 7cUnTN3uQxKhhqi/KNyWvA==
X-CSE-MsgGUID: cCE9jCm/QSGVMwqzs60Pwg==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="41369784"
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; d="scan'208";a="41369784"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2024 07:21:03 -0700
X-CSE-ConnectionGUID: ccsOjTMaQSORjdHBZNDoOg==
X-CSE-MsgGUID: x0XOTMffSJS1Yqsj05jD7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; d="scan'208";a="65125348"
Received: from mlehtone-mobl.ger.corp.intel.com (HELO fedora..)
 ([10.245.244.77])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2024 07:21:01 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH 1/2] drm/xe: Use xe_pm_runtime_get in xe_bo_move() if
 reclaim-safe.
Date: Mon,  2 Sep 2024 16:20:41 +0200
Message-ID: <20240902142042.77581-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.46.0
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

xe_bo_move() might be called in the TTM swapout path from validation
by another TTM device. If so, we are not likely to have a RPM
reference. So iff xe_pm_runtime_get() is safe to call from reclaim,
use it instead of xe_pm_runtime_get_noresume().

Strictly this is currently needed only if handle_system_ccs is true,
but use xe_pm_runtime_get() if possible anyway to increase test
coverage.

At the same time warn if handle_system_ccs is true and we can't
call xe_pm_runtime_get() from reclaim context. This will likely trip
if someone tries to enable SRIOV on LNL, without fixing Xe SRIOV
runtime resume / suspend.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 11 ++++++++++-
 drivers/gpu/drm/xe/xe_pm.c |  9 ++++++++-
 drivers/gpu/drm/xe/xe_pm.h |  1 +
 3 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index a8e4d46d9123..06911e9a3bf5 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -758,7 +758,16 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 
 	xe_assert(xe, migrate);
 	trace_xe_bo_move(bo, new_mem->mem_type, old_mem_type, move_lacks_source);
-	xe_pm_runtime_get_noresume(xe);
+	if (xe_rpm_reclaim_safe(xe)) {
+		/*
+		 * We might be called through swapout in the validation path of
+		 * another TTM device, so unconditionally acquire rpm here.
+		 */
+		xe_pm_runtime_get(xe);
+	} else {
+		drm_WARN_ON(&xe->drm, handle_system_ccs);
+		xe_pm_runtime_get_noresume(xe);
+	}
 
 	if (xe_bo_is_pinned(bo) && !xe_bo_is_user(bo)) {
 		/*
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index 2600c936527e..e518557e0eec 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -79,7 +79,14 @@ static struct lockdep_map xe_pm_runtime_nod3cold_map = {
 };
 #endif
 
-static bool __maybe_unused xe_rpm_reclaim_safe(const struct xe_device *xe)
+/**
+ * xe_rpm_reclaim_safe() - Whether runtime resume can be done from reclaim context
+ * @xe: The xe device.
+ *
+ * Return: true if it is safe to runtime resume from reclaim context.
+ * false otherwise.
+ */
+bool xe_rpm_reclaim_safe(const struct xe_device *xe)
 {
 	return !xe->d3cold.capable && !xe->info.has_sriov;
 }
diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
index 9aef673b1c8a..998d1ed64556 100644
--- a/drivers/gpu/drm/xe/xe_pm.h
+++ b/drivers/gpu/drm/xe/xe_pm.h
@@ -31,6 +31,7 @@ bool xe_pm_runtime_resume_and_get(struct xe_device *xe);
 void xe_pm_assert_unbounded_bridge(struct xe_device *xe);
 int xe_pm_set_vram_threshold(struct xe_device *xe, u32 threshold);
 void xe_pm_d3cold_allowed_toggle(struct xe_device *xe);
+bool xe_rpm_reclaim_safe(const struct xe_device *xe);
 struct task_struct *xe_pm_read_callback_task(struct xe_device *xe);
 int xe_pm_module_init(void);
 
-- 
2.46.0


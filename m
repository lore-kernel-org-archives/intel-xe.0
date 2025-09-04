Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E504CCA1015
	for <intel-xe@archiver.kernel.org>; Thu,  4 Sep 2025 16:07:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A79D410EA94;
	Thu,  4 Sep 2025 16:07:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AshQrzHi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 236F710EA94
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Sep 2025 16:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757002062; x=1788538062;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=a1qUdm+3lKuB68sKfOcHUbRJVgIif/D7GlkcmecUnf0=;
 b=AshQrzHi+GCH69P1I7PS0w0wBHUaUMt3gFmmJboNiiidZIYuriRH4u9B
 EBx2Lb/DzGaxnEOWITTJuNV42l9saUh2ghYicEVGEx3/m7AeLjuMdmKf4
 SuRbAkqfD7izlR4N1iZgAr2hFf9FgnAVgzH53xSsCTj29mhEh6/uoxtdh
 9KL+35vRL+PZ8QYgAnuWCPzPuAgF3SWfz1EbS+6C+qfffB78R8we712eK
 cy2nBIP+EFG76tl2soTEXUFqCrkJB2VnaxJcnXAp7lbvOsO3VC7cxmcrY
 BsAbOoRHjfYbH/d8VNaefyW/2zBp8+q/V7KOCXDS+ANqdtdPragZdlzI5 w==;
X-CSE-ConnectionGUID: BJBcv4WxQiWRDxOWz/zc8g==
X-CSE-MsgGUID: e/pcExwrTMWYWxZEDA7nRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11543"; a="62988496"
X-IronPort-AV: E=Sophos;i="6.18,238,1751266800"; d="scan'208";a="62988496"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2025 09:07:42 -0700
X-CSE-ConnectionGUID: LpD+xiN+Qmmmf+jpdmKbwQ==
X-CSE-MsgGUID: cINEFfrfQsOF3fpvSrSqxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,238,1751266800"; d="scan'208";a="177201741"
Received: from abityuts-desk.ger.corp.intel.com (HELO fedora) ([10.245.244.98])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2025 09:07:41 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Rodrigo vivi <rodrigo.vivi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH v4 2/3] drm/xe: Allow the pm notifier to continue on failure
Date: Thu,  4 Sep 2025 18:07:14 +0200
Message-ID: <20250904160715.2613-3-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250904160715.2613-1-thomas.hellstrom@linux.intel.com>
References: <20250904160715.2613-1-thomas.hellstrom@linux.intel.com>
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

Its actions are opportunistic anyway and will be completed
on device suspend.

Marking as a fix to simplify backporting of the fix
that follows in the series.

v2:
- Keep the runtime pm reference over suspend / hibernate and
  document why. (Matt Auld, Rodrigo Vivi):

Fixes: c6a4d46ec1d7 ("drm/xe: evict user memory in PM notifier")
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: <stable@vger.kernel.org> # v6.16+
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_pm.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index a2e85030b7f4..bee9aacd82e7 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -308,17 +308,17 @@ static int xe_pm_notifier_callback(struct notifier_block *nb,
 	case PM_SUSPEND_PREPARE:
 		xe_pm_runtime_get(xe);
 		err = xe_bo_evict_all_user(xe);
-		if (err) {
+		if (err)
 			drm_dbg(&xe->drm, "Notifier evict user failed (%d)\n", err);
-			xe_pm_runtime_put(xe);
-			break;
-		}
 
 		err = xe_bo_notifier_prepare_all_pinned(xe);
-		if (err) {
+		if (err)
 			drm_dbg(&xe->drm, "Notifier prepare pin failed (%d)\n", err);
-			xe_pm_runtime_put(xe);
-		}
+		/*
+		 * Keep the runtime pm reference until post hibernation / post suspend to
+		 * avoid a runtime suspend interfering with evicted objects or backup
+		 * allocations.
+		 */
 		break;
 	case PM_POST_HIBERNATION:
 	case PM_POST_SUSPEND:
@@ -327,9 +327,6 @@ static int xe_pm_notifier_callback(struct notifier_block *nb,
 		break;
 	}
 
-	if (err)
-		return NOTIFY_BAD;
-
 	return NOTIFY_DONE;
 }
 
-- 
2.50.1


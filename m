Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E0B7CD8C9D
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jun 2026 16:28:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F202410F6EF;
	Mon,  8 Jun 2026 16:28:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pc207rar";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B7DD10F6ED
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Jun 2026 16:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780936091; x=1812472091;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=JGpR/diat1gaxjrR4+HbO+T7SEK7FdLRqPEwl/UNqM4=;
 b=Pc207rarxAWjJRCelzhtz8MdzNTAIF0j+w4RpCEy8S0vr5jhDKS59q2u
 SriGrI8DsV53QxMlULuDzxfVisBlFW3H1iRbCqucT371eoaiRgkIl1TLf
 GLlUx+RMbZhO9mkMND1jHG/RlN60LfMGxogPa6IQMLCXG/0SaYtRuIwtt
 CoxE4LaLAv7QUocdQktiEol2E0qcQAjjA8iMWkWudHeIW20F6nrDsq/wV
 koGjU7neZURbcacHz885xWcBLmMW+gHyThr024WRs5o4gUfXW2vthgNr8
 ms97REfF8RzsdZRVFrwCStdjly5Y9WNydBLXbT7llXhK/EXu8vARxRyR7 g==;
X-CSE-ConnectionGUID: u/vbwUjkRRKIXMomTmAYbQ==
X-CSE-MsgGUID: RMYWeOy5RTGxornFrWdYrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="80704060"
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="80704060"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 09:28:11 -0700
X-CSE-ConnectionGUID: Wb3+6gSGR86ChfOjZgKdOQ==
X-CSE-MsgGUID: p7/WTxU4QmGkXjVwAllFjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="242632673"
Received: from tilak-z690i-a-ultra-plus.iind.intel.com ([10.190.239.38])
 by fmviesa007.fm.intel.com with ESMTP; 08 Jun 2026 09:28:09 -0700
From: tilak.tirumalesh.tangudu@intel.com
To: tilak.tirumalesh.tangudu@intel.com, thomas.hellstrom@intel.com,
 daniele.ceraolospurio@intel.com, matthew.auld@intel.com,
 stuart.summers@intel.com, intel-xe@lists.freedesktop.org
Subject: [PATCH 2/2] drm/xe: drop unused xe_exec_queue_ops::active callback
Date: Mon,  8 Jun 2026 21:57:45 +0530
Message-ID: <20260608162745.338725-3-tilak.tirumalesh.tangudu@intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20260608162745.338725-1-tilak.tirumalesh.tangudu@intel.com>
References: <20260608162745.338725-1-tilak.tirumalesh.tangudu@intel.com>
MIME-Version: 1.0
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

From: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>

send_tlb_inval_ctx_ppgtt() was the only caller of q->ops->active(q).
The per-VM exec_queue list is now walked unfiltered.

With no remaining callers, drop the .active op from
struct xe_exec_queue_ops along with the GuC and execlist
backend implementations (guc_exec_queue_active() and
execlist_exec_queue_active()).

Signed-off-by: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue_types.h | 2 --
 drivers/gpu/drm/xe/xe_execlist.c         | 7 -------
 drivers/gpu/drm/xe/xe_guc_submit.c       | 9 ---------
 3 files changed, 18 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index 2f5ccf294675..d27ce24daae5 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -318,8 +318,6 @@ struct xe_exec_queue_ops {
 	void (*resume)(struct xe_exec_queue *q);
 	/** @reset_status: check exec queue reset status */
 	bool (*reset_status)(struct xe_exec_queue *q);
-	/** @active: check exec queue is active */
-	bool (*active)(struct xe_exec_queue *q);
 };
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
index 9fb99c038ea8..6b86b4f9cc1c 100644
--- a/drivers/gpu/drm/xe/xe_execlist.c
+++ b/drivers/gpu/drm/xe/xe_execlist.c
@@ -458,12 +458,6 @@ static bool execlist_exec_queue_reset_status(struct xe_exec_queue *q)
 	return false;
 }
 
-static bool execlist_exec_queue_active(struct xe_exec_queue *q)
-{
-	/* NIY */
-	return false;
-}
-
 static const struct xe_exec_queue_ops execlist_exec_queue_ops = {
 	.init = execlist_exec_queue_init,
 	.kill = execlist_exec_queue_kill,
@@ -476,7 +470,6 @@ static const struct xe_exec_queue_ops execlist_exec_queue_ops = {
 	.suspend_wait = execlist_exec_queue_suspend_wait,
 	.resume = execlist_exec_queue_resume,
 	.reset_status = execlist_exec_queue_reset_status,
-	.active = execlist_exec_queue_active,
 };
 
 int xe_execlist_init(struct xe_gt *gt)
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 4b247a3019d2..b29cc08e6291 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -2220,14 +2220,6 @@ static bool guc_exec_queue_reset_status(struct xe_exec_queue *q)
 	return exec_queue_reset(q) || exec_queue_killed_or_banned_or_wedged(q);
 }
 
-static bool guc_exec_queue_active(struct xe_exec_queue *q)
-{
-	struct xe_exec_queue *primary = xe_exec_queue_multi_queue_primary(q);
-
-	return exec_queue_enabled(primary) &&
-		!exec_queue_pending_disable(primary);
-}
-
 /*
  * All of these functions are an abstraction layer which other parts of Xe can
  * use to trap into the GuC backend. All of these functions, aside from init,
@@ -2247,7 +2239,6 @@ static const struct xe_exec_queue_ops guc_exec_queue_ops = {
 	.suspend_wait = guc_exec_queue_suspend_wait,
 	.resume = guc_exec_queue_resume,
 	.reset_status = guc_exec_queue_reset_status,
-	.active = guc_exec_queue_active,
 };
 
 static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
-- 
2.46.0


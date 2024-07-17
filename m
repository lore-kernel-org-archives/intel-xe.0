Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCD8DC3DA42
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jul 2024 14:03:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E63010E192;
	Wed, 17 Jul 2024 14:03:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ruomk543";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2A9B10E192
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jul 2024 14:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721225028; x=1752761028;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=FNJg2rQgBsUyQmGef9WpIjWp+ky9ufx3R2ufvy1u6GI=;
 b=Ruomk543azuv9MWJQzPBcWEpbquge2poPzOgEhLoERD5NwfmyXT/APJq
 nktBxt7epIzIXFK/gni1GAflMMEP2AdYXoEhTI42CeO07ogkg3WAl2Fog
 xu+AANax1Mj+WTet9yqReZYUIuZlzUoqSoYc+gCS+chc7IxSH1JagaqH6
 PaE8QAHyBqylR5i8FRfPQWuC9dwXHVicQtavGO1j5Qzcac+YeI05aXXbo
 uhaXrOUduHePsSjrGaECM2fB0jyxmugty/3uZCgu+0kIdl5PMt4aJLph3
 Ow9VEP8vCkPKon58Jtx+0rq9cAclOoJaM04HcFJFH/1RCUTXAibSVpNe+ Q==;
X-CSE-ConnectionGUID: DpvlkNuhSUKrpqes7tJP8Q==
X-CSE-MsgGUID: uu7zpRcqT/eX/r/T3Ki+cw==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="29341276"
X-IronPort-AV: E=Sophos;i="6.09,214,1716274800"; d="scan'208";a="29341276"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 07:03:47 -0700
X-CSE-ConnectionGUID: kEPSIyrfRfOSoSpwLj0rkA==
X-CSE-MsgGUID: eiM4x8OUT7KW2MR55Vs5EA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,214,1716274800"; d="scan'208";a="55543224"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 07:03:47 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 2/2] drm/xe: Remove used xe_sync_entry_wait
Date: Wed, 17 Jul 2024 07:04:29 -0700
Message-Id: <20240717140429.1396820-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240717140429.1396820-1-matthew.brost@intel.com>
References: <20240717140429.1396820-1-matthew.brost@intel.com>
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

xe_sync_entry_wait is no longer used, remove it.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_sync.c | 8 --------
 drivers/gpu/drm/xe/xe_sync.h | 1 -
 2 files changed, 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
index f2e5e3c8c0cd..533246f42256 100644
--- a/drivers/gpu/drm/xe/xe_sync.c
+++ b/drivers/gpu/drm/xe/xe_sync.c
@@ -204,14 +204,6 @@ int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
 	return 0;
 }
 
-int xe_sync_entry_wait(struct xe_sync_entry *sync)
-{
-	if (sync->fence)
-		dma_fence_wait(sync->fence, true);
-
-	return 0;
-}
-
 int xe_sync_entry_add_deps(struct xe_sync_entry *sync, struct xe_sched_job *job)
 {
 	int err;
diff --git a/drivers/gpu/drm/xe/xe_sync.h b/drivers/gpu/drm/xe/xe_sync.h
index 006dbf780793..256ffc1e54dc 100644
--- a/drivers/gpu/drm/xe/xe_sync.h
+++ b/drivers/gpu/drm/xe/xe_sync.h
@@ -22,7 +22,6 @@ int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
 			struct xe_sync_entry *sync,
 			struct drm_xe_sync __user *sync_user,
 			unsigned int flags);
-int xe_sync_entry_wait(struct xe_sync_entry *sync);
 int xe_sync_entry_add_deps(struct xe_sync_entry *sync,
 			   struct xe_sched_job *job);
 void xe_sync_entry_signal(struct xe_sync_entry *sync,
-- 
2.34.1


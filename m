Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D4CBCCD195
	for <intel-xe@archiver.kernel.org>; Tue, 14 Oct 2025 18:09:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 138AD10E67B;
	Tue, 14 Oct 2025 18:09:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GHcrkoGA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BBEB10E67A
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Oct 2025 18:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760465369; x=1792001369;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7cYT3m9pdKeEdqMqybQDK9IJYCp95QfmTgU0Dxt5BRc=;
 b=GHcrkoGAApulqOzHLI9QIq4qMiCOVgoeEa/mNNlCFADacVG2KdbDt06K
 wm4+11fXdNoKzYksHcQe5aPwEFhO4JZUEU7pXQnCkPBEvhUzvLYnLodjJ
 a9Rwt9NJ5B9SifwOZ02z0KMYkDgt4h9pGz7OrRVc3UvHdwEFvKIL3UaO+
 J4cYrV8kFfiQ6DddHUqqyeaLpQroNuTfnmvg6FzxxDOV170XC01+5uDd9
 9EGzUGeH7Me7wtqxNVWFchYo647JQ51c3uDvWrZaxQ6R7qfehqyZu1vg7
 FZlHrbvX2fv7tcUb1NMRyiHMYePDbRjguP8KEz987osc2lWqlEvSkN7Qj A==;
X-CSE-ConnectionGUID: 0zkpCMJFRWaUDVZLRCOTpg==
X-CSE-MsgGUID: 8EEom7oORVWnzcXDtH7Geg==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="66285420"
X-IronPort-AV: E=Sophos;i="6.19,228,1754982000"; d="scan'208";a="66285420"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 11:09:29 -0700
X-CSE-ConnectionGUID: mZ8/18V6SgKFGuFSqXmFEg==
X-CSE-MsgGUID: 03bdjK/9Qp25Tjz4VIAJ+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,228,1754982000"; d="scan'208";a="212570177"
Received: from dut4084arlh.fm.intel.com ([10.105.10.163])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 11:09:29 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: intel-xe@lists.freedesktop.org, matthew.brost@intel.com,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 5/6] drm/xe: Correct migration VM teardown order
Date: Tue, 14 Oct 2025 18:09:26 +0000
Message-Id: <20251014180927.105077-6-stuart.summers@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251014180927.105077-1-stuart.summers@intel.com>
References: <20251014180927.105077-1-stuart.summers@intel.com>
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

Adjust the sequence of the migration teardown to match what
is happening in the init() function.

Signed-off-by: Stuart Summers <stuart.summers@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 7345a5b65169..b1747e442a7b 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -100,8 +100,8 @@ static void xe_migrate_fini(void *arg)
 	xe_bo_put(m->pt_bo);
 	drm_suballoc_manager_fini(&m->vm_update_sa);
 	mutex_destroy(&m->job_mutex);
-	xe_vm_close_and_put(m->q->vm);
 	xe_exec_queue_put(m->q);
+	xe_vm_close_and_put(m->q->vm);
 }
 
 static u64 xe_migrate_vm_addr(u64 slot, u32 level)
-- 
2.34.1


Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0B38CCD183
	for <intel-xe@archiver.kernel.org>; Mon, 13 Oct 2025 22:32:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B321110E0C3;
	Mon, 13 Oct 2025 22:32:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Tpoj5z3d";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 829E010E13A
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Oct 2025 22:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760394698; x=1791930698;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7cYT3m9pdKeEdqMqybQDK9IJYCp95QfmTgU0Dxt5BRc=;
 b=Tpoj5z3dc37XK09y9C8R/H17RpsKSUiAG6oc72cma4/GNVWVqTBA4gIL
 wffu3LTfF/GC0yJanT5Ugc2P4HG03XVvnWQq+3X+X0gWaWUMaswDMuiZu
 HmLSLH4i2B1mIlOiP44gbg2qeghvCAUI1S5WMf3AY4bUYpXur7lJEx6BR
 HNrvzhPf07ZH+mslCgkMdR0V+X67vFBU92kNdPRParytwxPudXsKlHjMa
 tLYv6OPUwctEWmdDqMz9yLcvg6eirw0DEYaOfWpyQp+uvI4PlEx5WRXXp
 klorNBgqBQfKlnMyZOm2F0aOF/klKfjpbRz3RcdOzdG2dXjvG92CgOLsL g==;
X-CSE-ConnectionGUID: 2bR+QKGiTcuNUfzMY2UT3w==
X-CSE-MsgGUID: yA01uHLjTGOhsKECmJE8Tw==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="79987311"
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; d="scan'208";a="79987311"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 15:31:37 -0700
X-CSE-ConnectionGUID: wrmBmV/ASzmuNudPv1z4/Q==
X-CSE-MsgGUID: eTqGA2EfQcm/l/NDRS7L6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; d="scan'208";a="212677588"
Received: from dut4084arlh.fm.intel.com ([10.105.10.71])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 15:31:37 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: intel-xe@lists.freedesktop.org, matthew.brost@intel.com,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 5/7] drm/xe: Correct migration VM teardown order
Date: Mon, 13 Oct 2025 22:31:33 +0000
Message-Id: <20251013223135.189357-6-stuart.summers@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251013223135.189357-1-stuart.summers@intel.com>
References: <20251013223135.189357-1-stuart.summers@intel.com>
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


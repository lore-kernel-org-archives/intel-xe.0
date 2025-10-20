Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24268CCD1AD
	for <intel-xe@archiver.kernel.org>; Mon, 20 Oct 2025 21:45:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D866310E52C;
	Mon, 20 Oct 2025 21:45:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e/9eKCTo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DF2B10E52E
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Oct 2025 21:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760996733; x=1792532733;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sZvt7zktM5nz5WfL4ovJcIPDRYeqBVKE5kU0BSSVlbw=;
 b=e/9eKCToYWqaewWXh/jMwrt8NA1DknJTaQNHdNB6EsiT3x5IXiZ8wDsx
 kmn/nF4XbzQRoxNVemD4ZCL7am2zqOuenDSHj4cKcw/ok8m2z23cPYank
 K+tvpDgPfmjr6XFsLvP0kZQ0wo/j72WzIbsH/zV1h+c/A5P76yxmOlM1X
 6jxK9vW9plkyGvk2ksQTEDoqBLBFt6NiPBveNQ7crRM36KOvMi/Uw6FHR
 uVhkkeuFaEGcBfHpQz8CHyc7+J4eeOhtdfzKFDdR7rptSAl02tofonta2
 TJUbF1eKAzIaya2fAe1PfF94Ai0f58SrLrWH5LfjonjLvlr7LPFQ9Nw6V g==;
X-CSE-ConnectionGUID: jBWPyPcwRHOqdddoXgzOpw==
X-CSE-MsgGUID: LcDgn1ojQYapewjXmjsAnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63160726"
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; d="scan'208";a="63160726"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 14:45:33 -0700
X-CSE-ConnectionGUID: PfDAVHXyT4WBRYJyDE4OOw==
X-CSE-MsgGUID: 3mW7jY+dQ+mFE4whGoA/YA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; d="scan'208";a="183451189"
Received: from dut4084arlh.fm.intel.com ([10.105.10.142])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 14:45:32 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: intel-xe@lists.freedesktop.org, matthew.brost@intel.com,
 niranjana.vishwanathapura@intel.com, zhanjun.dong@intel.com,
 shuicheng.lin@intel.com, Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 5/7] drm/xe: Correct migration VM teardown order
Date: Mon, 20 Oct 2025 21:45:27 +0000
Message-Id: <20251020214529.354365-6-stuart.summers@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251020214529.354365-1-stuart.summers@intel.com>
References: <20251020214529.354365-1-stuart.summers@intel.com>
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

v2: Take a reference to the migrate queue before put (Matt)

Signed-off-by: Stuart Summers <stuart.summers@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 7345a5b65169..ae42917918e5 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -91,17 +91,18 @@ struct xe_migrate {
 static void xe_migrate_fini(void *arg)
 {
 	struct xe_migrate *m = arg;
+	struct xe_exec_queue *q = m->q;
 
-	xe_vm_lock(m->q->vm, false);
+	xe_vm_lock(q->vm, false);
 	xe_bo_unpin(m->pt_bo);
-	xe_vm_unlock(m->q->vm);
+	xe_vm_unlock(q->vm);
 
 	dma_fence_put(m->fence);
 	xe_bo_put(m->pt_bo);
 	drm_suballoc_manager_fini(&m->vm_update_sa);
 	mutex_destroy(&m->job_mutex);
-	xe_vm_close_and_put(m->q->vm);
-	xe_exec_queue_put(m->q);
+	xe_exec_queue_put(q);
+	xe_vm_close_and_put(q->vm);
 }
 
 static u64 xe_migrate_vm_addr(u64 slot, u32 level)
-- 
2.34.1


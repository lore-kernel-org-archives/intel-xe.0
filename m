Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E33EE6B274
	for <intel-xe@archiver.kernel.org>; Tue, 23 Dec 2025 11:53:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D37A310E0BE;
	Tue, 23 Dec 2025 11:53:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cfXuxKb6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C20110E0BE
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Dec 2025 11:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766490820; x=1798026820;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4v5Zddn5MXrOirqpDV3wKakZu/KGKUlQFQrR+AlIkTI=;
 b=cfXuxKb6j02fFkCbyCDDrLmkALxEFjTjJd+gaWEPfRwNshfW8Z31OS8H
 PrBzgJi6vLMTMVlZqGlcf30Y0TFVbvSuIn5Np9tOd1fJgapSGRw56AlnY
 lIY9wC/pYPJ+GKRRNuYgu5AtivkvbSK//CC1ZuS4cjYtEP+Vi7uxrzxxA
 58+Nb9fE9Kb8qO1tWnnO14+Wwvyj+iaoPl/PIWlDfTTqYgG+ZFhhcLrwI
 D6IVtKxaShZqzGkLivQv1RCEVCBH3TBm7GKM7OnoJ3UrEaZrdP+QbjPjI
 nIhGroykLskBXFY49bYh7fLPrwRwVSpTZH7nUO2hVw2JdJc325skamEEh Q==;
X-CSE-ConnectionGUID: Xaus1MUdSK+VDlYYkSEapg==
X-CSE-MsgGUID: WInVhIzHSxiGaM2bB0JPQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="68413449"
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; d="scan'208";a="68413449"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2025 03:53:40 -0800
X-CSE-ConnectionGUID: ow8IE/UoSjSKybF62/3uRg==
X-CSE-MsgGUID: mFKrwlJMSBGaXR7G6yIxvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; d="scan'208";a="237176808"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO fdugast-desk.home)
 ([10.245.244.78])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2025 03:53:39 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH] drm/xe/migrate: Configure migration queue as low latency
Date: Tue, 23 Dec 2025 12:53:27 +0100
Message-ID: <20251223115327.49555-1-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
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

Commit 5488bec96bcc ("drm/xe/uapi: Use hint for guc to set GT frequency")
introduced low latency hint for use by user space when creating an exec
queue. This instructs SLPC to ramp the GT frequency aggressively.

SVM relies on an internal exec queue to migrate memory upon page faults.
This change creates this exec queue with the low latency hint to speed up
migration.

This should not impact systems where GT frequency is set over sysfs, or
with long running workloads which give enough time for the frequency to
ramp up. An example of memory access pattern that shows an improvement of
SVM performance is running hundreds of times IGT eu-fault-2m-once-device
in xe_exec_system_allocator. The copy duration provided by GT stats in
svm_2M_device_copy_us shows per GPU page fault:
    ~ 165 μs without low latency hint
    ~ 130 μs with low latency hint

Suggested-by: Matthew Brost <matthew.brost@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 3de8ce2516e2..00eef41a9e36 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -472,7 +472,8 @@ int xe_migrate_init(struct xe_migrate *m)
 					    EXEC_QUEUE_FLAG_KERNEL |
 					    EXEC_QUEUE_FLAG_PERMANENT |
 					    EXEC_QUEUE_FLAG_HIGH_PRIORITY |
-					    EXEC_QUEUE_FLAG_MIGRATE, 0);
+					    EXEC_QUEUE_FLAG_MIGRATE |
+					    EXEC_QUEUE_FLAG_LOW_LATENCY, 0);
 	} else {
 		m->q = xe_exec_queue_create_class(xe, primary_gt, vm,
 						  XE_ENGINE_CLASS_COPY,
-- 
2.43.0


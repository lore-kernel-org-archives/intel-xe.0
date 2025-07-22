Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8605C83F27
	for <intel-xe@archiver.kernel.org>; Tue, 22 Jul 2025 20:22:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 605C610E709;
	Tue, 22 Jul 2025 20:22:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GxL75ygA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC62D10E70F
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Jul 2025 20:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753215733; x=1784751733;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=L299VdICfbaq38YZBAZkaKlozMJjBrMabZgrQzRQS1I=;
 b=GxL75ygAR3tiwaLmeFkHNkXns6gBSdAQ76B8PbP0zBClVD5ROLsDUwyz
 IB2ORRVn3r0sGsRk20XiHjSES62HWs0MztYQNvCgcqKt/FAMMnguTwFnP
 WV89XeIY1CKEDUvQkS7Ux4Id586DkslVFPyVzbrEmN1NwLDFdfPY1K9WC
 B+I/viPiR0rwpRxtchw6iNTolmXb7Y1wXQlxNpFmGwkwG15RQ69bPdVFt
 Fy6AfxOtXCc9yGgPdGwEbR9iRCFP+Y5A9R9sxTzBrj1I8nxo3Vme0x/7T
 laGVABmSMefXRT1ym3Wpj/k6WVXTsRV/8tw4YGBFZnbWFfy6Jt+UX9Z1J w==;
X-CSE-ConnectionGUID: rpMXBge+RLWludKJqi6nZg==
X-CSE-MsgGUID: LaKkmK29TfWa6jrihvbqyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="58098048"
X-IronPort-AV: E=Sophos;i="6.16,332,1744095600"; d="scan'208";a="58098048"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2025 13:22:13 -0700
X-CSE-ConnectionGUID: rD4iNRxHTBOqFJ57PbNp5w==
X-CSE-MsgGUID: Qv+ChnxRRX2lYUKdTZnhyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,332,1744095600"; d="scan'208";a="182947251"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2025 13:22:12 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: thomas.hellstrom@linux.intel.com,
	stuart.summers@intel.com
Subject: [PATCH v3 1/7] drm/xe: Explicitly mark migration queues with flag
Date: Tue, 22 Jul 2025 13:23:51 -0700
Message-Id: <20250722202357.3718853-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250722202357.3718853-1-matthew.brost@intel.com>
References: <20250722202357.3718853-1-matthew.brost@intel.com>
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

Rather than inferring if an exec queue is a migration queue for a flag,
explicitly mark migration queues with a flag.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Francois Dugast <francois.dugast@intel.com>
Reviewed-by: Stuart Summers <stuart.summers@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue_types.h | 2 ++
 drivers/gpu/drm/xe/xe_migrate.c          | 6 ++++--
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index cc1cffb5c87f..abdf4a57e6e2 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -87,6 +87,8 @@ struct xe_exec_queue {
 #define EXEC_QUEUE_FLAG_HIGH_PRIORITY		BIT(4)
 /* flag to indicate low latency hint to guc */
 #define EXEC_QUEUE_FLAG_LOW_LATENCY		BIT(5)
+/* for migration (kernel copy, clear, bind) jobs */
+#define EXEC_QUEUE_FLAG_MIGRATE			BIT(6)
 
 	/**
 	 * @flags: flags for this exec queue, should statically setup aside from ban
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 6a80ae6104dd..c8f6a8843368 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -451,12 +451,14 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
 		m->q = xe_exec_queue_create(xe, vm, logical_mask, 1, hwe,
 					    EXEC_QUEUE_FLAG_KERNEL |
 					    EXEC_QUEUE_FLAG_PERMANENT |
-					    EXEC_QUEUE_FLAG_HIGH_PRIORITY, 0);
+					    EXEC_QUEUE_FLAG_HIGH_PRIORITY |
+					    EXEC_QUEUE_FLAG_MIGRATE, 0);
 	} else {
 		m->q = xe_exec_queue_create_class(xe, primary_gt, vm,
 						  XE_ENGINE_CLASS_COPY,
 						  EXEC_QUEUE_FLAG_KERNEL |
-						  EXEC_QUEUE_FLAG_PERMANENT, 0);
+						  EXEC_QUEUE_FLAG_PERMANENT |
+						  EXEC_QUEUE_FLAG_MIGRATE, 0);
 	}
 	if (IS_ERR(m->q)) {
 		xe_vm_close_and_put(vm);
-- 
2.34.1


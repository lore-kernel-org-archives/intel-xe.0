Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9319BC87FC5
	for <intel-xe@archiver.kernel.org>; Thu, 24 Jul 2025 19:10:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5964910E29D;
	Thu, 24 Jul 2025 19:10:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="imId/dvV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8B6310E29D
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Jul 2025 19:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753384231; x=1784920231;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=uwTHRj6kOUpfrhWb9Hyhk9JydVg4DFba50Aqy+fYs34=;
 b=imId/dvVuVKHEAGMLngJp6hqDCB7jP/rpwHtmRyU83vBdqnP7zWtRbcW
 CzjcTMbw8pTkmQpLpl4OA3ihYpwVKyejtYIgHSSRFKjKKE6h3tZ5kI92S
 BUvyiQQrteVhURvkcgqFDgefZN1LVeeGQtGhaGHS4fjNNatn5BbZ76gd6
 LZ0JWqP3Iajqg2RyEztAUycBKdmpBmp4cZ0ZbjJji3BU6X1322kzqyzmc
 bB0V4H2ChSlWwU8Erh4ELD/cJN/dOMW4KGqfDSuQus2hlhAGLbONZcpQS
 FAZORrjFXaAlDAC/+5Ja3EwnxsoeMdNi/zropHoQhrxKS9IindAu4UI8b g==;
X-CSE-ConnectionGUID: 5iDIMpFAQWW1cva0LHA5dQ==
X-CSE-MsgGUID: GfeR+rlaRAaV7s9gD6AqQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="65976725"
X-IronPort-AV: E=Sophos;i="6.16,337,1744095600"; d="scan'208";a="65976725"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2025 12:10:31 -0700
X-CSE-ConnectionGUID: 9RIf7FjeT+ODr87A92WhZw==
X-CSE-MsgGUID: k33bQ5rhQym0EBE7Z1E9mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,337,1744095600"; d="scan'208";a="160387665"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2025 12:10:30 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v4 1/7] drm/xe: Explicitly mark migration queues with flag
Date: Thu, 24 Jul 2025 12:12:10 -0700
Message-Id: <20250724191216.4076566-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250724191216.4076566-1-matthew.brost@intel.com>
References: <20250724191216.4076566-1-matthew.brost@intel.com>
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
index 0a61fb8b123a..ed04c2b368dc 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -439,12 +439,14 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
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


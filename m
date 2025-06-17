Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70B0EC7115F
	for <intel-xe@archiver.kernel.org>; Tue, 17 Jun 2025 15:36:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38DB910E75D;
	Tue, 17 Jun 2025 15:36:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UvTsr05I";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2405510E36D
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Jun 2025 15:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750174581; x=1781710581;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rCgcw3L/HhV7kj5/80/C1dcXihQvfXUyrthZZiwXxis=;
 b=UvTsr05II7TnxSEZFGF1gIf8esfBi0iW39vi15wZNwKDnB+3yXSe6G2j
 WJOH4q6WGh89g6YTEKFDLFHxfwSMtOW3lBafoYi3N3ENnPJSabnefc7dL
 I7W08hlRL0QNhigb/P2ZHbZZvAKt6Zms14JgdeoP0770dHz3JCvgkz7lM
 KxZjq6wqXvswezAMHtbVfcKP9dPeWgLQJTSGiUIHnU9MCIABsP/mdNxu6
 zi/Eqc7Q4UUQGGuIc1x8Fs2xgjjv7QEoLR7yqpdOurz+gQcXaYz7+YIQy
 qhgzUvvZr8BahPw5hI8QCeel7P/q2BlICwShGnw2Lnx0NKYBhKLkx/Fa0 g==;
X-CSE-ConnectionGUID: oyR8Yw/DSjWU6SbMud3cAg==
X-CSE-MsgGUID: VEAnnRUFRkmSZRaa3LMK+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="52230869"
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; d="scan'208";a="52230869"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 08:36:13 -0700
X-CSE-ConnectionGUID: nWn9LPzbQ+y2vw3UqL65PA==
X-CSE-MsgGUID: oePe5h/xSLWHchRyDNm7fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; d="scan'208";a="148667723"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 08:35:55 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: thomas.hellstrom@linux.intel.com, himal.prasad.ghimiray@intel.com,
 matthew.auld@intel.com
Subject: [PATCH 1/6] drm/xe: Explicitly mark migration queues with flag
Date: Tue, 17 Jun 2025 08:37:25 -0700
Message-Id: <20250617153730.2136174-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250617153730.2136174-1-matthew.brost@intel.com>
References: <20250617153730.2136174-1-matthew.brost@intel.com>
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
index 8f8e9fdfb2a8..9c246a3ee610 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -437,12 +437,14 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
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


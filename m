Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E73B7C83F27
	for <intel-xe@archiver.kernel.org>; Tue, 15 Jul 2025 21:21:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AECD310E69D;
	Tue, 15 Jul 2025 21:21:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MA2cKo29";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0403610E054
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Jul 2025 21:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752614497; x=1784150497;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DkZxCMbs184U4D0SeqbSYmw+WTDGGAMnR6xu0IyXQQw=;
 b=MA2cKo29CdxCeogNaF91mIT9R65K9J00NwLnjOhRmqJrQRsWuhja8NM9
 Gu8Gb2dKVIyupKe00QdKeWUfgvWEszC8cRldzrHzT7qNuRx5B+Qf76TOI
 PicAY0a8qHCuUI5+f3X8u+YtuvhTn172qsjzNAZ75UiPEIMHp+ZDhfoQD
 1Ke09xGguzwviWYzY/bFGWJIlGjF/QFXZb82N7WkedqGNzAJb/iYBfcsF
 7KJaXzJlSIamjJOTz7FQpMXSamVwBZcpGSmFC15aLYEdGuO9+Ak24CvT4
 4w6wPMpRKl6yzlRnP+ZqlQdu/zGSZi15HkGpTD5wBEHFS5uIkZ8LHHCXd A==;
X-CSE-ConnectionGUID: PoUiq7yGRPWVKxjOG9Lr7Q==
X-CSE-MsgGUID: Q6yDznb/ROOKSnjDbka61g==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="54999482"
X-IronPort-AV: E=Sophos;i="6.16,314,1744095600"; d="scan'208";a="54999482"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 14:21:36 -0700
X-CSE-ConnectionGUID: s/v/W6nXRSuJ3byZuhQh4g==
X-CSE-MsgGUID: l08r8++XRNWOYb+eNz7y5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,314,1744095600"; d="scan'208";a="156733522"
Received: from dut158arls.fm.intel.com ([10.105.23.70])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 14:21:36 -0700
From: stuartsummers <stuart.summers@intel.com>
To: 
Cc: matthew.brost@intel.com, matthew.auld@intel.com,
 maarten.lankhorst@linux.intel.com, intel-xe@lists.freedesktop.org,
 Francois Dugast <francois.dugast@intel.com>,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 1/4] drm/xe: Explicitly mark migration queues with flag
Date: Tue, 15 Jul 2025 21:21:22 +0000
Message-Id: <20250715212125.337195-2-stuart.summers@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250715212125.337195-1-stuart.summers@intel.com>
References: <20250715212125.337195-1-stuart.summers@intel.com>
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

From: Matthew Brost <matthew.brost@intel.com>

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
index ba1cff2e4cda..713eb63b4c4e 100644
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


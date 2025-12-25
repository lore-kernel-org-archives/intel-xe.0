Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EB9CE784A9
	for <intel-xe@archiver.kernel.org>; Thu, 25 Dec 2025 01:17:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0205113F72;
	Thu, 25 Dec 2025 01:17:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Stv2vOdz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE684112ACD
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Dec 2025 01:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766625462; x=1798161462;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jrUCigaxZmlZatRUdluJvoGG00jsCW1M0JxwCzPODKI=;
 b=Stv2vOdzXc2gKhBfVjscEXv1PXjQKxD+TIazLHTI5TUHQL9NFCR/yqon
 0jO67cpGlpWZ/xyCvw4D942VSWBENE1En19azCuYGq9nec89EVotAAimv
 3YkazoHsIsRBqHP5GjgFfcN13qguYOmsJc9rSPDzck1KJ9tbkbg2BRV7t
 JZcEl3fI+3sEZDTYBR9LHihlb75WiUShutI5fEDV+1gPph/fVGWeS5QbT
 gSkcdZpEME69K40SaEgm6NKn9ciDCeN+je9d0t3MiASS3WiC3e2zfJNG3
 InNpZg2aFSSQtpRODZ+a0QxyYDJQVyCeXc7+sJtoKcRXf41RSERm/IqhQ g==;
X-CSE-ConnectionGUID: vVGvSHNGS7GS39SRikmLWg==
X-CSE-MsgGUID: EwMssfz1SUqXuCzEAE4PhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="85866356"
X-IronPort-AV: E=Sophos;i="6.21,175,1763452800"; d="scan'208";a="85866356"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Dec 2025 17:17:41 -0800
X-CSE-ConnectionGUID: P6T+VCMKTUSHneEwDXab6g==
X-CSE-MsgGUID: nsWmTqmRQd60f0PVGBgC6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,175,1763452800"; d="scan'208";a="204629121"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Dec 2025 17:17:40 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: daniele.ceraolospurio@intel.com,
	carlos.santa@intel.com
Subject: [RFC PATCH 02/13] drm/xe: Add EXEC_QUEUE_FLAG_CAP_SYS_NICE
Date: Wed, 24 Dec 2025 17:17:23 -0800
Message-Id: <20251225011734.341683-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251225011734.341683-1-matthew.brost@intel.com>
References: <20251225011734.341683-1-matthew.brost@intel.com>
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

Store whether CAP_SYS_NICE is set on the user process that creates an
exec queue. This will indicate if the exec queue is eligible for higher
priority levels under deadline pressure.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c       | 3 +++
 drivers/gpu/drm/xe/xe_exec_queue_types.h | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 0b9e074b022f..a9b981591773 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -1158,6 +1158,9 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 	if (args->flags & DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT)
 		flags |= EXEC_QUEUE_FLAG_LOW_LATENCY;
 
+	if (capable(CAP_SYS_NICE))
+		flags |= EXEC_QUEUE_FLAG_CAP_SYS_NICE;
+
 	if (eci[0].engine_class == DRM_XE_ENGINE_CLASS_VM_BIND) {
 		if (XE_IOCTL_DBG(xe, args->width != 1) ||
 		    XE_IOCTL_DBG(xe, args->num_placements != 1) ||
diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index 67ea5eebf70b..cd7a6571f5c6 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -128,6 +128,8 @@ struct xe_exec_queue {
 #define EXEC_QUEUE_FLAG_LOW_LATENCY		BIT(5)
 /* for migration (kernel copy, clear, bind) jobs */
 #define EXEC_QUEUE_FLAG_MIGRATE			BIT(6)
+/* for user queues, created in CAP_SYS_NICE context */
+#define EXEC_QUEUE_FLAG_CAP_SYS_NICE		BIT(7)
 
 	/**
 	 * @flags: flags for this exec queue, should statically setup aside from ban
-- 
2.34.1


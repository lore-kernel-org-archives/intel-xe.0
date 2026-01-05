Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31982C2A077
	for <intel-xe@archiver.kernel.org>; Mon,  5 Jan 2026 04:02:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42DAC10E332;
	Mon,  5 Jan 2026 04:02:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BWiqB6qw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEABF10E232
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Jan 2026 04:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767585764; x=1799121764;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jrUCigaxZmlZatRUdluJvoGG00jsCW1M0JxwCzPODKI=;
 b=BWiqB6qw4yGeh2mlfCg1XdK8whVX90waUNvtOakCT81vCetpkub6mbZo
 5qEw2pDjNLfCg07Mdmq6VdsFClfgUg6UyH3cvrTcJuA4bghUqa24EyKoU
 Y2ygQ9BII+6+nJPNl0DdhzV9innJh9p0XjoPeWU5vrBOVeYlBoP5fsHti
 z98UxbY/1Hwefc/pcTAVtofXiiHHsqmOFByEO+mbzMvMEjcGp6I2Gcqzk
 iY6Rel1SRqocm+k3jpg7x+iHAfyR/gimpRqkrmhqnM5oeUJB/jbx+cz0P
 /4N3c16Z9ofbgtVnr0WT2RXpzfdpDpi0FNPDTjaePchv2gvOX8OnLUYyX g==;
X-CSE-ConnectionGUID: hf70928MQIuNBGaH/MyP1w==
X-CSE-MsgGUID: o5yPx4C2QBiFYUm5sS71/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11661"; a="68856253"
X-IronPort-AV: E=Sophos;i="6.21,202,1763452800"; d="scan'208";a="68856253"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2026 20:02:44 -0800
X-CSE-ConnectionGUID: gsz4F6KGT/mipk6UyQHjBg==
X-CSE-MsgGUID: boxdwQQxTsabwxME/eI5bA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,202,1763452800"; d="scan'208";a="202060652"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2026 20:02:42 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: daniele.ceraolospurio@intel.com,
	carlos.santa@intel.com
Subject: [PATCH v2 02/22] drm/xe: Add EXEC_QUEUE_FLAG_CAP_SYS_NICE
Date: Sun,  4 Jan 2026 20:02:17 -0800
Message-Id: <20260105040237.1307873-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260105040237.1307873-1-matthew.brost@intel.com>
References: <20260105040237.1307873-1-matthew.brost@intel.com>
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


Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ABC1C48BF6
	for <intel-xe@archiver.kernel.org>; Mon,  4 Mar 2024 14:05:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB8801121CB;
	Mon,  4 Mar 2024 14:05:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bGRpbOvG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ECAA1121C9
 for <intel-xe@lists.freedesktop.org>; Mon,  4 Mar 2024 14:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709561128; x=1741097128;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=smy4965U3yEjz4vDMpvESwCVz+LvXcWmKTrsYF2oybc=;
 b=bGRpbOvGAo4/n0UMSELDHqitEMN//qWvkAuHPc0dVWiwBYpPBvQ5fc6D
 EfXt0kNwMHOiU1RHn2A12AjKe7iEF+r5ESOOFViJWm2abXsiszqircgcb
 wNzfSN0BiBpXgImzfhDQBSUvoYqK0n5pVV8L6+Z8S8vzWRiixWYUeHnEc
 v/Bh3JLMoPNS2BC/lbce0I2uB6cqPYMB+NSxNNx94N7OAJAbnbhcnNVUt
 mjCor6XmZTTHaiEzh4x88vxemoJ5pkXTbVYnWX7xsB7JsNIkqPkbF5+F7
 TtLcxub7TQ5D7x0KXE+Vr/KLQHvjr/JxQK3Wn9TsA79Rl8hrwLP1WKK+H Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="4175448"
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; 
   d="scan'208";a="4175448"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 06:05:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; 
   d="scan'208";a="8920956"
Received: from josouza-mobl2.bz.intel.com ([10.87.243.88])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 06:05:27 -0800
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Subject: [PATCH 4/4] drm/xe: Nuke EXEC_QUEUE_FLAG_PERSISTENT
Date: Mon,  4 Mar 2024 06:05:14 -0800
Message-ID: <20240304140514.24768-4-jose.souza@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240304140514.24768-1-jose.souza@intel.com>
References: <20240304140514.24768-1-jose.souza@intel.com>
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

This is a left over of commit f1a9abc0cf31 ("drm/xe/uapi: Remove support for persistent exec_queues").

Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue_types.h | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index 62b3d9d1d7cdd..9cc689f50db00 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -76,14 +76,12 @@ struct xe_exec_queue {
 #define EXEC_QUEUE_FLAG_KERNEL			BIT(1)
 /* kernel engine only destroyed at driver unload */
 #define EXEC_QUEUE_FLAG_PERMANENT		BIT(2)
-/* queue keeps running pending jobs after destroy ioctl */
-#define EXEC_QUEUE_FLAG_PERSISTENT		BIT(3)
 /* for VM jobs. Caller needs to hold rpm ref when creating queue with this flag */
-#define EXEC_QUEUE_FLAG_VM			BIT(4)
+#define EXEC_QUEUE_FLAG_VM			BIT(3)
 /* child of VM queue for multi-tile VM jobs */
-#define EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD	BIT(5)
+#define EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD	BIT(4)
 /* kernel exec_queue only, set priority to highest level */
-#define EXEC_QUEUE_FLAG_HIGH_PRIORITY		BIT(6)
+#define EXEC_QUEUE_FLAG_HIGH_PRIORITY		BIT(5)
 
 	/**
 	 * @flags: flags for this exec queue, should statically setup aside from ban
-- 
2.44.0


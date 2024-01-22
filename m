Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EC6BC47DAF
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jan 2024 17:05:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60ACA10ECEB;
	Mon, 22 Jan 2024 17:05:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5C0110ECA3
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Jan 2024 17:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705943108; x=1737479108;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=07VMXUwdXg+Bv0aULkSWDdqWtPxg9thXXkyUx9DrZ70=;
 b=TkWg08p42st4EFg2MYBONBL32J2KYpFPb5YMtJqPNJuXcimNxPzOufDH
 3mKuI2apWVTvm8Y7MyZ9sG58FULm9GbL5TadfCXZ5c/4QCaWIIWgYxxHD
 JL4ye/2y300dCWP+F54RII7RFlegb/yAO3aqO5QoaZWQgQSU6sy8IPcjZ
 At/zXpTAzBX8QOrzOyfMOd2W+S6YTqci2lJJzr1mDTeEz1Pb84TW66u2e
 6yOPTXOcB95e0vAXvDo3qCzUH9Gomf8u4qiwa7agOejeSbyLE+L4XTYi0
 6q7m8lAKlx5bobS5peS3BVkP0m91pso7lu85KHvlxDhZ/BwDzCo9u1/dZ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="8020234"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; 
   d="scan'208";a="8020234"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2024 09:05:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="735228318"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; d="scan'208";a="735228318"
Received: from josouza-mobl2.bz.intel.com ([10.87.243.88])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2024 09:05:03 -0800
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 5/9] drm/xe: Nuke xe from xe_devcoredump
Date: Mon, 22 Jan 2024 09:04:41 -0800
Message-ID: <20240122170445.108856-5-jose.souza@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240122170445.108856-1-jose.souza@intel.com>
References: <20240122170445.108856-1-jose.souza@intel.com>
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
Cc: Maarten Lankhorst <dev@lankhorst.se>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

xe is never set in xe_devcoredump but if xe_device is needed
devcoredump_to_xe_device() can be used.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Maarten Lankhorst <dev@lankhorst.se>
Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/xe/xe_devcoredump_types.h | 2 --
 drivers/gpu/drm/xe/xe_device.h            | 5 +++++
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_devcoredump_types.h b/drivers/gpu/drm/xe/xe_devcoredump_types.h
index 9a12959ed6b14..d259119b2c980 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump_types.h
+++ b/drivers/gpu/drm/xe/xe_devcoredump_types.h
@@ -47,8 +47,6 @@ struct xe_devcoredump_snapshot {
  * for reading the information.
  */
 struct xe_devcoredump {
-	/** @xe: Xe device. */
-	struct xe_device *xe;
 	/** @captured: The snapshot of the first hang has already been taken. */
 	bool captured;
 	/** @snapshot: Snapshot is captured at time of the first crash */
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index ce20f6fe6219a..781a1aa164ecf 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -35,6 +35,11 @@ static inline struct xe_device *ttm_to_xe_device(struct ttm_device *ttm)
 	return container_of(ttm, struct xe_device, ttm);
 }
 
+static inline struct xe_device *devcoredump_to_xe_device(struct xe_devcoredump *devcoredump)
+{
+	return container_of(devcoredump, struct xe_device, devcoredump);
+}
+
 struct xe_device *xe_device_create(struct pci_dev *pdev,
 				   const struct pci_device_id *ent);
 int xe_device_probe_early(struct xe_device *xe);
-- 
2.43.0


Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C68FC67861
	for <intel-xe@archiver.kernel.org>; Tue,  9 Apr 2024 20:02:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B33F5112C01;
	Tue,  9 Apr 2024 20:02:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GQxpZCE2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B6EB112A8F
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Apr 2024 20:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712692936; x=1744228936;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=BKcWmZZnN2N2645VQtJaW8isi6HlmohHD9/K4VPBE6Y=;
 b=GQxpZCE2ICiZYhlbHny9anxbZn4352UFvqLO8u+3t5/lPdykXklWJnR+
 ZxkU/F4kE847TMrsaHMLNL8REFr5ROSpBB06EB79SlogRLjV6XlFMWZia
 Cp0D0MAVnJ6zMP9c6bec/dTyvErk0gY71MqB6Fv9sNy6D5kqJdDoJyytP
 QgzU+HOk5361LaYA/HESO5m8x9MM9NvQeW7ADhyE6l+dwVpuQ93kBYFwv
 ye7Zs35Kxnupa11lhQ3SwfiqcbMLaywDH+XvcLEe61G4u4ZSeTIVexInu
 5hk/WA6SB213GgMIcER0EEcaHMwCX8Jak0cEg0G0AkWe7JYf3lyEc1WSr Q==;
X-CSE-ConnectionGUID: OlrdKGaeSVOjdEEIcxMDJg==
X-CSE-MsgGUID: FCjfIiR4TFKFNRSpQWT/+A==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="10996841"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="10996841"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 13:02:15 -0700
X-CSE-ConnectionGUID: RO/DTNXpSj2+XpSBF3MjmQ==
X-CSE-MsgGUID: C1LbVe6RQRGEdWuPFtf0Sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="24824245"
Received: from josouza-mobl2.bz.intel.com ([10.87.243.88])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 13:02:14 -0700
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: linux-kernel@vger.kernel.org,
	intel-xe@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mukesh Ojha <quic_mojha@quicinc.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Subject: [PATCH v4 1/2] devcoredump: Add dev_coredump_put()
Date: Tue,  9 Apr 2024 13:02:05 -0700
Message-ID: <20240409200206.108452-1-jose.souza@intel.com>
X-Mailer: git-send-email 2.44.0
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

It is useful for modules that do not want to keep coredump available
after its unload.
Otherwise, the coredump would only be removed after DEVCD_TIMEOUT
seconds.

v2:
- dev_coredump_put() documentation updated (Mukesh)

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Mukesh Ojha <quic_mojha@quicinc.com>
Cc: Johannes Berg <johannes@sipsolutions.net>
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
Reviewed-by: Johannes Berg <johannes@sipsolutions.net>
Acked-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/base/devcoredump.c  | 23 +++++++++++++++++++++++
 include/linux/devcoredump.h |  5 +++++
 2 files changed, 28 insertions(+)

diff --git a/drivers/base/devcoredump.c b/drivers/base/devcoredump.c
index 7e2d1f0d903a6..82aeb09b3d1b5 100644
--- a/drivers/base/devcoredump.c
+++ b/drivers/base/devcoredump.c
@@ -304,6 +304,29 @@ static ssize_t devcd_read_from_sgtable(char *buffer, loff_t offset,
 				  offset);
 }
 
+/**
+ * dev_coredump_put - remove device coredump
+ * @dev: the struct device for the crashed device
+ *
+ * dev_coredump_put() removes coredump, if exists, for a given device from
+ * the file system and free its associated data otherwise, does nothing.
+ *
+ * It is useful for modules that do not want to keep coredump
+ * available after its unload.
+ */
+void dev_coredump_put(struct device *dev)
+{
+	struct device *existing;
+
+	existing = class_find_device(&devcd_class, NULL, dev,
+				     devcd_match_failing);
+	if (existing) {
+		devcd_free(existing, NULL);
+		put_device(existing);
+	}
+}
+EXPORT_SYMBOL_GPL(dev_coredump_put);
+
 /**
  * dev_coredumpm - create device coredump with read/free methods
  * @dev: the struct device for the crashed device
diff --git a/include/linux/devcoredump.h b/include/linux/devcoredump.h
index c008169ed2c6f..c8f7eb6cc1915 100644
--- a/include/linux/devcoredump.h
+++ b/include/linux/devcoredump.h
@@ -63,6 +63,8 @@ void dev_coredumpm(struct device *dev, struct module *owner,
 
 void dev_coredumpsg(struct device *dev, struct scatterlist *table,
 		    size_t datalen, gfp_t gfp);
+
+void dev_coredump_put(struct device *dev);
 #else
 static inline void dev_coredumpv(struct device *dev, void *data,
 				 size_t datalen, gfp_t gfp)
@@ -85,6 +87,9 @@ static inline void dev_coredumpsg(struct device *dev, struct scatterlist *table,
 {
 	_devcd_free_sgtable(table);
 }
+static inline void dev_coredump_put(struct device *dev)
+{
+}
 #endif /* CONFIG_DEV_COREDUMP */
 
 #endif /* __DEVCOREDUMP_H */
-- 
2.44.0


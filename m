Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC85BC54798
	for <intel-xe@archiver.kernel.org>; Tue, 27 Feb 2024 21:00:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 871FE10E21C;
	Tue, 27 Feb 2024 21:00:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nhxqhSbD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCB5210E21C
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Feb 2024 21:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709067618; x=1740603618;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=RE/r0QBlJkpfsDcdAyyvBwd5gHrITMQLec9sLSeOxDo=;
 b=nhxqhSbDiBp972rNAyv08Ln4t9PLnmkQgDaICHyWe3Tuye5TMSmUjS1o
 6Qxr5l0faIRc18FVnVTWur+nxzsBnbXzDoOKjDZzxUvXtqo39WCg9J9GF
 7TL8h2Hu5YeXD+gPErhybN/mJIsR25tXhEkz+PHrtT+bDN3JAC7p25LXi
 vKjXtzq+NIRshzUGUQ5NWzy5rkamGpxId/WOU1p9Vy9lS8KN+jCnE6727
 20ziw6YPpQGb6BmA9sE4Dvda466O/rl3RYRe0VeeuQrsiQlpI8t8PJ8gN
 AUS1ttYSdneEiCeONHDRZvuKnnN8W3cZvDtIhLk8w0so9/u6aMoqCNETc w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="14858443"
X-IronPort-AV: E=Sophos;i="6.06,188,1705392000"; d="scan'208";a="14858443"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2024 13:00:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,188,1705392000"; 
   d="scan'208";a="7150405"
Received: from josouza-mobl2.bz.intel.com ([10.87.243.88])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2024 13:00:14 -0800
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: linux-kernel@vger.kernel.org,
	intel-xe@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mukesh Ojha <quic_mojha@quicinc.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Subject: [PATCH 1/4] devcoredump: Add dev_coredump_put()
Date: Tue, 27 Feb 2024 13:00:05 -0800
Message-ID: <20240227210008.182904-1-jose.souza@intel.com>
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

This is useful for drivers that don't want to keep a coredump
available after unloading.
Otherwise, the coredump would only be removed after DEVCD_TIMEOUT
seconds.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Mukesh Ojha <quic_mojha@quicinc.com>
Cc: Johannes Berg <johannes@sipsolutions.net>
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/base/devcoredump.c  | 22 ++++++++++++++++++++++
 include/linux/devcoredump.h |  5 +++++
 2 files changed, 27 insertions(+)

diff --git a/drivers/base/devcoredump.c b/drivers/base/devcoredump.c
index 7e2d1f0d903a6..e96427411b87c 100644
--- a/drivers/base/devcoredump.c
+++ b/drivers/base/devcoredump.c
@@ -304,6 +304,28 @@ static ssize_t devcd_read_from_sgtable(char *buffer, loff_t offset,
 				  offset);
 }
 
+/**
+ * dev_coredump_put - remove device coredump
+ * @dev: the struct device for the crashed device
+ *
+ * If giving device has a coredump this removes it from file system and free
+ * associated data otherwise does nothing.
+ * This is useful for drivers that don't want to keep a coredump
+ * available after unloading.
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


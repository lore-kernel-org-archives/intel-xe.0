Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED08AC54E4A
	for <intel-xe@archiver.kernel.org>; Mon,  4 Mar 2024 14:39:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5A5D10E6C1;
	Mon,  4 Mar 2024 14:39:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MyUqGR83";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32CAE10E6C1
 for <intel-xe@lists.freedesktop.org>; Mon,  4 Mar 2024 14:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709563156; x=1741099156;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lmw9xOoiQDklyw261pt95/gZg8tQiKm6KXYJNlcrwdM=;
 b=MyUqGR83YnzIYH2P8i/hUh7eBQIz30b5BkWydveSWxJCVZY7hlLMShl2
 C9GJxayygauFDOsZUNl85/bRnUYOPo0UwES2EDytrbYuqvcN4Cgh+EGV6
 3IqO9azf09yBmWylcmFb/fNKg/HHp2e84mZxWCwSS4sGt1rNp62lWvw6Z
 6rn7ZAr6NxaEbS/eYD2dcqZm460MqFJpUzcKmKowCJLSdevM+PdhzcW9a
 XCkWrbTYlkCvsiamsUGK4cD8o84F9cHCSR2eZQJeTw/TcE0UDFpGaPhaQ
 VObxBfkede4aC1f5L2NtKz8OrSk74tE6O1hDUBL7l1Ki8FkMxC1hW3wyG Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="15464637"
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; d="scan'208";a="15464637"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 06:39:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; 
   d="scan'208";a="9162540"
Received: from josouza-mobl2.bz.intel.com ([10.87.243.88])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 06:39:14 -0800
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: linux-kernel@vger.kernel.org,
	intel-xe@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mukesh Ojha <quic_mojha@quicinc.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Subject: [PATCH v3 2/4] devcoredump: Add dev_coredumpm_timeout()
Date: Mon,  4 Mar 2024 06:39:03 -0800
Message-ID: <20240304143905.52740-2-jose.souza@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240304143905.52740-1-jose.souza@intel.com>
References: <20240304143905.52740-1-jose.souza@intel.com>
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

Add function to set a custom coredump timeout.

Current 5-minute timeout may be too short for users to search and
understand what needs to be done to capture coredump to report bugs.

v2:
- replace dev_coredump_timeout_set() by dev_coredumpm_timeout() (Mukesh)

v3:
- make dev_coredumpm() static inline (Johannes)

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Mukesh Ojha <quic_mojha@quicinc.com>
Cc: Johannes Berg <johannes@sipsolutions.net>
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
Acked-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/base/devcoredump.c  | 23 ++++++++--------
 include/linux/devcoredump.h | 54 ++++++++++++++++++++++++++++---------
 2 files changed, 54 insertions(+), 23 deletions(-)

diff --git a/drivers/base/devcoredump.c b/drivers/base/devcoredump.c
index 82aeb09b3d1b5..c795edad1b969 100644
--- a/drivers/base/devcoredump.c
+++ b/drivers/base/devcoredump.c
@@ -18,9 +18,6 @@ static struct class devcd_class;
 /* global disable flag, for security purposes */
 static bool devcd_disabled;
 
-/* if data isn't read by userspace after 5 minutes then delete it */
-#define DEVCD_TIMEOUT	(HZ * 60 * 5)
-
 struct devcd_entry {
 	struct device devcd_dev;
 	void *data;
@@ -328,7 +325,8 @@ void dev_coredump_put(struct device *dev)
 EXPORT_SYMBOL_GPL(dev_coredump_put);
 
 /**
- * dev_coredumpm - create device coredump with read/free methods
+ * dev_coredumpm_timeout - create device coredump with read/free methods with a
+ * custom timeout.
  * @dev: the struct device for the crashed device
  * @owner: the module that contains the read/free functions, use %THIS_MODULE
  * @data: data cookie for the @read/@free functions
@@ -336,17 +334,20 @@ EXPORT_SYMBOL_GPL(dev_coredump_put);
  * @gfp: allocation flags
  * @read: function to read from the given buffer
  * @free: function to free the given buffer
+ * @timeout: time in jiffies to remove coredump
  *
  * Creates a new device coredump for the given device. If a previous one hasn't
  * been read yet, the new coredump is discarded. The data lifetime is determined
  * by the device coredump framework and when it is no longer needed the @free
  * function will be called to free the data.
  */
-void dev_coredumpm(struct device *dev, struct module *owner,
-		   void *data, size_t datalen, gfp_t gfp,
-		   ssize_t (*read)(char *buffer, loff_t offset, size_t count,
-				   void *data, size_t datalen),
-		   void (*free)(void *data))
+void dev_coredumpm_timeout(struct device *dev, struct module *owner,
+			   void *data, size_t datalen, gfp_t gfp,
+			   ssize_t (*read)(char *buffer, loff_t offset,
+					   size_t count, void *data,
+					   size_t datalen),
+			   void (*free)(void *data),
+			   unsigned long timeout)
 {
 	static atomic_t devcd_count = ATOMIC_INIT(0);
 	struct devcd_entry *devcd;
@@ -403,7 +404,7 @@ void dev_coredumpm(struct device *dev, struct module *owner,
 	dev_set_uevent_suppress(&devcd->devcd_dev, false);
 	kobject_uevent(&devcd->devcd_dev.kobj, KOBJ_ADD);
 	INIT_DELAYED_WORK(&devcd->del_wk, devcd_del);
-	schedule_delayed_work(&devcd->del_wk, DEVCD_TIMEOUT);
+	schedule_delayed_work(&devcd->del_wk, timeout);
 	mutex_unlock(&devcd->mutex);
 	return;
  put_device:
@@ -414,7 +415,7 @@ void dev_coredumpm(struct device *dev, struct module *owner,
  free:
 	free(data);
 }
-EXPORT_SYMBOL_GPL(dev_coredumpm);
+EXPORT_SYMBOL_GPL(dev_coredumpm_timeout);
 
 /**
  * dev_coredumpsg - create device coredump that uses scatterlist as data
diff --git a/include/linux/devcoredump.h b/include/linux/devcoredump.h
index c8f7eb6cc1915..56e606eb4640b 100644
--- a/include/linux/devcoredump.h
+++ b/include/linux/devcoredump.h
@@ -12,6 +12,9 @@
 #include <linux/scatterlist.h>
 #include <linux/slab.h>
 
+/* if data isn't read by userspace after 5 minutes then delete it */
+#define DEVCOREDUMP_TIMEOUT	(HZ * 60 * 5)
+
 /*
  * _devcd_free_sgtable - free all the memory of the given scatterlist table
  * (i.e. both pages and scatterlist instances)
@@ -50,16 +53,17 @@ static inline void _devcd_free_sgtable(struct scatterlist *table)
 	kfree(delete_iter);
 }
 
-
 #ifdef CONFIG_DEV_COREDUMP
 void dev_coredumpv(struct device *dev, void *data, size_t datalen,
 		   gfp_t gfp);
 
-void dev_coredumpm(struct device *dev, struct module *owner,
-		   void *data, size_t datalen, gfp_t gfp,
-		   ssize_t (*read)(char *buffer, loff_t offset, size_t count,
-				   void *data, size_t datalen),
-		   void (*free)(void *data));
+void dev_coredumpm_timeout(struct device *dev, struct module *owner,
+			   void *data, size_t datalen, gfp_t gfp,
+			   ssize_t (*read)(char *buffer, loff_t offset,
+					   size_t count, void *data,
+					   size_t datalen),
+			   void (*free)(void *data),
+			   unsigned long timeout);
 
 void dev_coredumpsg(struct device *dev, struct scatterlist *table,
 		    size_t datalen, gfp_t gfp);
@@ -72,12 +76,13 @@ static inline void dev_coredumpv(struct device *dev, void *data,
 	vfree(data);
 }
 
-static inline void
-dev_coredumpm(struct device *dev, struct module *owner,
-	      void *data, size_t datalen, gfp_t gfp,
-	      ssize_t (*read)(char *buffer, loff_t offset, size_t count,
-			      void *data, size_t datalen),
-	      void (*free)(void *data))
+void dev_coredumpm_timeout(struct device *dev, struct module *owner,
+			   void *data, size_t datalen, gfp_t gfp,
+			   ssize_t (*read)(char *buffer, loff_t offset,
+					   size_t count, void *data,
+					   size_t datalen),
+			   void (*free)(void *data),
+			   unsigned long timeout)
 {
 	free(data);
 }
@@ -92,4 +97,29 @@ static inline void dev_coredump_put(struct device *dev)
 }
 #endif /* CONFIG_DEV_COREDUMP */
 
+/**
+ * dev_coredumpm - create device coredump with read/free methods
+ * @dev: the struct device for the crashed device
+ * @owner: the module that contains the read/free functions, use %THIS_MODULE
+ * @data: data cookie for the @read/@free functions
+ * @datalen: length of the data
+ * @gfp: allocation flags
+ * @read: function to read from the given buffer
+ * @free: function to free the given buffer
+ *
+ * Creates a new device coredump for the given device. If a previous one hasn't
+ * been read yet, the new coredump is discarded. The data lifetime is determined
+ * by the device coredump framework and when it is no longer needed the @free
+ * function will be called to free the data.
+ */
+static inline void dev_coredumpm(struct device *dev, struct module *owner,
+				 void *data, size_t datalen, gfp_t gfp,
+				 ssize_t (*read)(char *buffer, loff_t offset, size_t count,
+						 void *data, size_t datalen),
+				void (*free)(void *data))
+{
+	dev_coredumpm_timeout(dev, owner, data, datalen, gfp, read, free,
+			      DEVCOREDUMP_TIMEOUT);
+}
+
 #endif /* __DEVCOREDUMP_H */
-- 
2.44.0


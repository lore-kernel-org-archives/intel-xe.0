Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44ABDC5478C
	for <intel-xe@archiver.kernel.org>; Wed, 28 Feb 2024 16:57:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE9BB10E1A9;
	Wed, 28 Feb 2024 16:57:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SM4jKzXJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 799D710E1A9
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Feb 2024 16:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709139440; x=1740675440;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cG0K0Z07eB5+9mj4tuqLV6lwrA56qZB6hhqyl8Bt7+k=;
 b=SM4jKzXJfaeFpXo6LE9KUlV+D5oLvE/snyHMKAODfmz8//jjoXSDg1s1
 Hy8Umqk6e0pwFgVyHsRELpr8+kvSWbOvcA5RjMoEtOJ437vBd0NGHaLBR
 lQF1jZU2Y3Fpks4kq3WbmjE5/IvlHzNbYpQeVWC4kE1feqXFevTrrvzXl
 emkkRbSI337/rwiM37s+R6TqEEysms7xQyqvSbFibANyUBg27h0wtt9M6
 g7tEoQoEceSCZKSyRwfXCRtC0Sqge2D+0k4HWMhdl3MeC4VpeD5wj4gHa
 hW0QNSbp8s3rx3dlHazuEyV7EeRtsVw9fIAY4viWhPIIP/QhofBEs+WNh w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="3401206"
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; 
   d="scan'208";a="3401206"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2024 08:57:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; d="scan'208";a="12213424"
Received: from josouza-mobl2.bz.intel.com ([10.87.243.88])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2024 08:57:19 -0800
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: linux-kernel@vger.kernel.org,
	intel-xe@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mukesh Ojha <quic_mojha@quicinc.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Subject: [PATCH v2 2/4] devcoredump: Add dev_coredumpm_timeout()
Date: Wed, 28 Feb 2024 08:57:07 -0800
Message-ID: <20240228165709.82089-2-jose.souza@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240228165709.82089-1-jose.souza@intel.com>
References: <20240228165709.82089-1-jose.souza@intel.com>
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

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Mukesh Ojha <quic_mojha@quicinc.com>
Cc: Johannes Berg <johannes@sipsolutions.net>
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/base/devcoredump.c  | 44 +++++++++++++++++++++++++++++++------
 include/linux/devcoredump.h | 18 +++++++++++++++
 2 files changed, 55 insertions(+), 7 deletions(-)

diff --git a/drivers/base/devcoredump.c b/drivers/base/devcoredump.c
index 82aeb09b3d1b5..07b89f7f735d8 100644
--- a/drivers/base/devcoredump.c
+++ b/drivers/base/devcoredump.c
@@ -328,7 +328,8 @@ void dev_coredump_put(struct device *dev)
 EXPORT_SYMBOL_GPL(dev_coredump_put);
 
 /**
- * dev_coredumpm - create device coredump with read/free methods
+ * dev_coredumpm_timeout - create device coredump with read/free methods with a
+ * custom timeout.
  * @dev: the struct device for the crashed device
  * @owner: the module that contains the read/free functions, use %THIS_MODULE
  * @data: data cookie for the @read/@free functions
@@ -336,17 +337,20 @@ EXPORT_SYMBOL_GPL(dev_coredump_put);
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
@@ -403,7 +407,7 @@ void dev_coredumpm(struct device *dev, struct module *owner,
 	dev_set_uevent_suppress(&devcd->devcd_dev, false);
 	kobject_uevent(&devcd->devcd_dev.kobj, KOBJ_ADD);
 	INIT_DELAYED_WORK(&devcd->del_wk, devcd_del);
-	schedule_delayed_work(&devcd->del_wk, DEVCD_TIMEOUT);
+	schedule_delayed_work(&devcd->del_wk, timeout);
 	mutex_unlock(&devcd->mutex);
 	return;
  put_device:
@@ -414,6 +418,32 @@ void dev_coredumpm(struct device *dev, struct module *owner,
  free:
 	free(data);
 }
+EXPORT_SYMBOL_GPL(dev_coredumpm_timeout);
+
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
+void dev_coredumpm(struct device *dev, struct module *owner,
+		   void *data, size_t datalen, gfp_t gfp,
+		   ssize_t (*read)(char *buffer, loff_t offset, size_t count,
+				   void *data, size_t datalen),
+		   void (*free)(void *data))
+{
+	dev_coredumpm_timeout(dev, owner, data, datalen, gfp, read, free,
+			      DEVCD_TIMEOUT);
+}
 EXPORT_SYMBOL_GPL(dev_coredumpm);
 
 /**
diff --git a/include/linux/devcoredump.h b/include/linux/devcoredump.h
index c8f7eb6cc1915..5e1e4deab07a6 100644
--- a/include/linux/devcoredump.h
+++ b/include/linux/devcoredump.h
@@ -55,6 +55,14 @@ static inline void _devcd_free_sgtable(struct scatterlist *table)
 void dev_coredumpv(struct device *dev, void *data, size_t datalen,
 		   gfp_t gfp);
 
+void dev_coredumpm_timeout(struct device *dev, struct module *owner,
+			   void *data, size_t datalen, gfp_t gfp,
+			   ssize_t (*read)(char *buffer, loff_t offset,
+					   size_t count, void *data,
+					   size_t datalen),
+			   void (*free)(void *data),
+			   unsigned long timeout);
+
 void dev_coredumpm(struct device *dev, struct module *owner,
 		   void *data, size_t datalen, gfp_t gfp,
 		   ssize_t (*read)(char *buffer, loff_t offset, size_t count,
@@ -72,6 +80,16 @@ static inline void dev_coredumpv(struct device *dev, void *data,
 	vfree(data);
 }
 
+void dev_coredumpm_timeout(struct device *dev, struct module *owner,
+			   void *data, size_t datalen, gfp_t gfp,
+			   ssize_t (*read)(char *buffer, loff_t offset,
+					   size_t count, void *data,
+					   size_t datalen),
+			   void (*free)(void *data),
+			   unsigned long timeout)
+{
+}
+
 static inline void
 dev_coredumpm(struct device *dev, struct module *owner,
 	      void *data, size_t datalen, gfp_t gfp,
-- 
2.44.0


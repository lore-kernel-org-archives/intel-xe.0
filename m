Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EC06C54E41
	for <intel-xe@archiver.kernel.org>; Tue, 27 Feb 2024 21:00:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 409F210E4B4;
	Tue, 27 Feb 2024 21:00:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hTmmEmZP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E0CE10E21C
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Feb 2024 21:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709067619; x=1740603619;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=g5hSKz8PPuysfPZ2UMVY6d54ATC/Id6iUngulkNyu8w=;
 b=hTmmEmZPLeeJiQrkTPItxEEaD28sVNyExlshlGNvJ1F3aqCBhH0N0RIZ
 8bBcRf3riWMHUjbrPyvCyKCkUphqyRg2iCz1Kh2rG0NPWN69kgkQTC2VN
 s9QCd/kpr61gqZ10wgA48YQjPRGAGqXNZxQzGTb0zfpFAg3Sgqt4a/qVt
 uZoOwE+fHS8EED2PmU8ZhwMQADVj2nao7ax6B5kscGHFtrvLIMD3sEMe+
 OrlHvJO0H4FG68RgsFjCb9ycVbBdZcOl6BkZ9rzgw4dQQzyfGcOq12mY2
 Xx+SXGi0/hLFHkloam8qoTd/MkNOlwnmVDdkP091PZN7EqTb/wyL620Zu Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="14858448"
X-IronPort-AV: E=Sophos;i="6.06,188,1705392000"; d="scan'208";a="14858448"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2024 13:00:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,188,1705392000"; 
   d="scan'208";a="7150417"
Received: from josouza-mobl2.bz.intel.com ([10.87.243.88])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2024 13:00:17 -0800
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: linux-kernel@vger.kernel.org,
	intel-xe@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mukesh Ojha <quic_mojha@quicinc.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Subject: [PATCH 2/4] devcoredump: Add dev_coredump_timeout_set()
Date: Tue, 27 Feb 2024 13:00:06 -0800
Message-ID: <20240227210008.182904-2-jose.souza@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240227210008.182904-1-jose.souza@intel.com>
References: <20240227210008.182904-1-jose.souza@intel.com>
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

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Mukesh Ojha <quic_mojha@quicinc.com>
Cc: Johannes Berg <johannes@sipsolutions.net>
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/base/devcoredump.c  | 23 +++++++++++++++++++++++
 include/linux/devcoredump.h |  6 ++++++
 2 files changed, 29 insertions(+)

diff --git a/drivers/base/devcoredump.c b/drivers/base/devcoredump.c
index e96427411b87c..2857ceb3eb3aa 100644
--- a/drivers/base/devcoredump.c
+++ b/drivers/base/devcoredump.c
@@ -326,6 +326,29 @@ void dev_coredump_put(struct device *dev)
 }
 EXPORT_SYMBOL_GPL(dev_coredump_put);
 
+/**
+ * dev_coredump_timeout_set - set coredump timeout
+ * @dev: the struct device for the crashed device
+ * @secs_timeout: new timeout in seconds
+ *
+ * If giving device has a coredump this sets a new timeout for coredump.
+ */
+void dev_coredump_timeout_set(struct device *dev, unsigned long secs_timeout)
+{
+	struct device *existing;
+	struct devcd_entry *devcd;
+
+	existing = class_find_device(&devcd_class, NULL, dev,
+				     devcd_match_failing);
+	if (!existing)
+		return;
+
+	devcd = dev_to_devcd(existing);
+	mod_delayed_work(system_wq, &devcd->del_wk, HZ * secs_timeout);
+	put_device(existing);
+}
+EXPORT_SYMBOL_GPL(dev_coredump_timeout_set);
+
 /**
  * dev_coredumpm - create device coredump with read/free methods
  * @dev: the struct device for the crashed device
diff --git a/include/linux/devcoredump.h b/include/linux/devcoredump.h
index c8f7eb6cc1915..70fe72a5c6d36 100644
--- a/include/linux/devcoredump.h
+++ b/include/linux/devcoredump.h
@@ -65,6 +65,7 @@ void dev_coredumpsg(struct device *dev, struct scatterlist *table,
 		    size_t datalen, gfp_t gfp);
 
 void dev_coredump_put(struct device *dev);
+void dev_coredump_timeout_set(struct device *dev, unsigned long secs_timeout);
 #else
 static inline void dev_coredumpv(struct device *dev, void *data,
 				 size_t datalen, gfp_t gfp)
@@ -90,6 +91,11 @@ static inline void dev_coredumpsg(struct device *dev, struct scatterlist *table,
 static inline void dev_coredump_put(struct device *dev)
 {
 }
+
+static inline void dev_coredump_timeout_set(struct device *dev,
+					    unsigned long secs_timeout)
+{
+}
 #endif /* CONFIG_DEV_COREDUMP */
 
 #endif /* __DEVCOREDUMP_H */
-- 
2.44.0


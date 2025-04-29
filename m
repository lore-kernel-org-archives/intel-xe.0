Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BC6EC3ABAB
	for <intel-xe@archiver.kernel.org>; Tue, 29 Apr 2025 16:08:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F33910E4FB;
	Tue, 29 Apr 2025 16:08:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LvVn+2zU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D278510E445;
 Tue, 29 Apr 2025 16:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745942880; x=1777478880;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FyZf7yFNbcExMMtTDve0Lfo+9T8j+1C0EIDfujfPUy0=;
 b=LvVn+2zUxtvdqLiCg9BoxLX+NtH6nmNjw0BDkxPZa9puFMGr+iGmPKty
 Ig4oS3Jn5DPbSw8vVIQJo9zG2xsbzMlcL9xl7BUVYbfkg3558HgoizUdq
 RYQ8VpElklQXWPDdqkp/nsGQl5C6ZWvJufk+VMaWI5Bp/1T6h3iStFVm9
 UWI3gXrcI20x14aPdpRvEcZNYW5OJoPydkaHc59HM1zJQ5k2dfo5yny1a
 qblm4h6y2pw+2DGfpKQbNT99isnWzagOoTpwBULqy6gvanaZWk4q8j0T0
 MCObEd2cmXs8LjWSRU4+11/ENC1DS2MpVmbSo3b+hqY20vf6GPwKluJiw w==;
X-CSE-ConnectionGUID: UsTdNbNVRiCYz32iw+LhBg==
X-CSE-MsgGUID: ovJ1BpWxT5WIgecjoJUHyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="47585440"
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; d="scan'208";a="47585440"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2025 09:07:57 -0700
X-CSE-ConnectionGUID: Y7AMRc/qQjidyyNRa2gl+A==
X-CSE-MsgGUID: O485faE3QqevMb2Q4d1lJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; d="scan'208";a="139055899"
Received: from unknown (HELO bnilawar-desk2.iind.intel.com) ([10.190.239.41])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 09:07:54 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 alexander.usyskin@intel.com, gregkh@linuxfoundation.org,
 daniele.ceraolospurio@intel.com
Subject: [RFC 1/9] mei: bus: add mei_cldev_mtu interface
Date: Tue, 29 Apr 2025 21:39:48 +0530
Message-Id: <20250429160956.1014376-2-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250429160956.1014376-1-badal.nilawar@intel.com>
References: <20250429160956.1014376-1-badal.nilawar@intel.com>
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

From: Alexander Usyskin <alexander.usyskin@intel.com>

Allow to bus client to obtain client mtu.

Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 drivers/misc/mei/bus.c     | 13 +++++++++++++
 include/linux/mei_cl_bus.h |  1 +
 2 files changed, 14 insertions(+)

diff --git a/drivers/misc/mei/bus.c b/drivers/misc/mei/bus.c
index 67176caf5416..f860b1b6eda0 100644
--- a/drivers/misc/mei/bus.c
+++ b/drivers/misc/mei/bus.c
@@ -614,6 +614,19 @@ u8 mei_cldev_ver(const struct mei_cl_device *cldev)
 }
 EXPORT_SYMBOL_GPL(mei_cldev_ver);
 
+/**
+ * mei_cldev_mtu - max message that client can send and receive
+ *
+ * @cldev: mei client device
+ *
+ * Return: mtu or 0 if client is not connected
+ */
+size_t mei_cldev_mtu(const struct mei_cl_device *cldev)
+{
+	return mei_cl_mtu(cldev->cl);
+}
+EXPORT_SYMBOL_GPL(mei_cldev_mtu);
+
 /**
  * mei_cldev_enabled - check whether the device is enabled
  *
diff --git a/include/linux/mei_cl_bus.h b/include/linux/mei_cl_bus.h
index 725fd7727422..a82755e1fc40 100644
--- a/include/linux/mei_cl_bus.h
+++ b/include/linux/mei_cl_bus.h
@@ -113,6 +113,7 @@ int mei_cldev_register_notif_cb(struct mei_cl_device *cldev,
 				mei_cldev_cb_t notif_cb);
 
 u8 mei_cldev_ver(const struct mei_cl_device *cldev);
+size_t mei_cldev_mtu(const struct mei_cl_device *cldev);
 
 void *mei_cldev_get_drvdata(const struct mei_cl_device *cldev);
 void mei_cldev_set_drvdata(struct mei_cl_device *cldev, void *data);
-- 
2.34.1


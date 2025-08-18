Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DE08CA0ED1
	for <intel-xe@archiver.kernel.org>; Mon, 18 Aug 2025 17:38:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01DE010E4B4;
	Mon, 18 Aug 2025 17:38:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bVPRcrUx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75C7910E4B4
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Aug 2025 17:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755538705; x=1787074705;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=u811FlanhwDWngaKQ0HddtTJqOF3SGKS5peTckHdpHg=;
 b=bVPRcrUxRagxuRVxrqvmNr2TAjz0gHHioA2GmLaJzyYuud4cri/TjBW/
 P9OiFXLp3T1Lh0asaihTA9A1nkp8kkls1vMRFSOL8OIORm1Dj/yDoRVdI
 R84z11CH0nQRH2saWbb1Kol4Ily5IHT5y3xTc5ef2r7L1Ib4Kbqonl8s8
 mF0BfKvtPzIzLJyEGPatmmO1Oe8pAxLFBSW+MLTGKMAfTikkllPz2qvd8
 BXcPFbqnZ+deagY7YhVDK0JYvwUcBdOhFQweLGxDUD6qFk+dClwou5FDB
 xxtd81zJtSgsMx9CMXsaNrUmXE7PqRU2lNQsK+qxyUerzPc5cvCw7ZXs7 g==;
X-CSE-ConnectionGUID: sgt9f2EDQRiDXmacV7dk/Q==
X-CSE-MsgGUID: LuHx1Ky+Q7GOMrcIH6+uJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="57918657"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="57918657"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 10:38:25 -0700
X-CSE-ConnectionGUID: zY8H1HgqRQOdnO0et8j7+Q==
X-CSE-MsgGUID: Kr6bP/DCT2CDXVs76OYa6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="172838890"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 10:38:25 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, prashanth.kumar@intel.com,
 dnyaneshwar.bhadane@intel.com, Riana Tauro <riana.tauro@intel.com>
Subject: [PATCH v4 11/13] drm/xe/configfs: Improve documentation steps
Date: Mon, 18 Aug 2025 10:37:36 -0700
Message-ID: <20250818-psmi-v4-11-a330783ce1c0@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250818-psmi-v4-0-a330783ce1c0@intel.com>
References: <20250818-psmi-v4-0-a330783ce1c0@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-b03c7
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

The steps are roughly:

1. Load the module without binding to the device
2. Configure the desired device
3. Bind the device

Move the binding part to the "Create devices" since it's not exclusive
to the survivability_mode attribute and better document the steps.

Reviewed-by: Riana Tauro <riana.tauro@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_configfs.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index 1dea3715c2369..5888114647510 100644
--- a/drivers/gpu/drm/xe/xe_configfs.c
+++ b/drivers/gpu/drm/xe/xe_configfs.c
@@ -29,11 +29,18 @@
  * See Documentation/filesystems/configfs.rst for more information about how configfs works.
  *
  * Create devices
- * ===============
+ * ==============
+ *
+ * To create a device, the ``xe`` module should already be loaded, but some
+ * attributes can only be set before binding the device. It can be accomplished
+ * by blocking the driver autoprobe:
  *
- * In order to create a device, the user has to create a directory inside ``'xe'``::
+ *	# echo 0 > /sys/bus/pci/drivers_autoprobe
+ *	# modprobe xe
  *
- *	mkdir /sys/kernel/config/xe/0000:03:00.0/
+ * In order to create a device, the user has to create a directory inside ``xe``::
+ *
+ *	# mkdir /sys/kernel/config/xe/0000:03:00.0/
  *
  * Every device created is populated by the driver with entries that can be
  * used to configure it::
@@ -49,6 +56,12 @@
  *	    ├── engines_allowed
  *	    └── enable_psmi
  *
+ * After configuring the attributes as per next section, the device can be
+ * probed with::
+ *
+ *	# echo 0000:03:00.0 > /sys/bus/pci/drivers/xe/bind
+ *	# # or
+ *	# echo 0000:03:00.0 > /sys/bus/pci/drivers_probe
  *
  * Configure Attributes
  * ====================
@@ -60,7 +73,6 @@
  * effect when probing the device. Example to enable it::
  *
  *	# echo 1 > /sys/kernel/config/xe/0000:03:00.0/survivability_mode
- *	# echo 0000:03:00.0 > /sys/bus/pci/drivers/xe/bind  (Enters survivability mode if supported)
  *
  * This attribute can only be set before binding to the device.
  *

-- 
2.50.1


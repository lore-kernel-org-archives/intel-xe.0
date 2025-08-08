Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF298C87FCB
	for <intel-xe@archiver.kernel.org>; Fri,  8 Aug 2025 17:30:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 756D410E965;
	Fri,  8 Aug 2025 17:30:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z6R9QGWn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 412FD10E965
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Aug 2025 17:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754674211; x=1786210211;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rqmrrBiSMrC2Ej5gQRsOuQHBwDV+fSPUitl84roaz6I=;
 b=Z6R9QGWnRywZMHNzsar/SllAPlYGj+IwAQ0I0+tKhvzg3sUle3pKvIat
 /I56HY0SuQCIIGc816I2GNnlDMJUYTW14LwYlcYknlpv0xBnpadtcynuf
 Z6H0E05mdDQw9VxzQdyXwMxY90KMBmaD7XVWPMeeJkCgz6o4U5lEm9RI4
 59fSRocUomLJ3rLeIVjaTdhzjbfxZJ057iw5DD1YCx0P7+toO7wPTJgVl
 +sKEuPaD00JpN4UlBQqWxSxWa//83Euow1qGrafsJWdDx7FWWx1vY31m0
 hmxo07HxtWiIVc6mk3iD/KWsJ1NNuhj5ooG2fj5XqPVD92B9p/vKDXtf4 w==;
X-CSE-ConnectionGUID: zxCm/AUMR96jtqET4/WFMw==
X-CSE-MsgGUID: S5K8rtxgRPO2cve4VaGjow==
X-IronPort-AV: E=McAfee;i="6800,10657,11515"; a="68109827"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="68109827"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2025 10:30:09 -0700
X-CSE-ConnectionGUID: l6KNFz2aTDuvQMcK7QP2Pg==
X-CSE-MsgGUID: hYKMsQxLQWiz7ZhhUsyhEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="165387428"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2025 10:30:08 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, prashanth.kumar@intel.com,
 dnyaneshwar.bhadane@intel.com
Subject: [PATCH v3 11/13] drm/xe/configfs: Improve documentation steps
Date: Fri,  8 Aug 2025 10:29:54 -0700
Message-ID: <20250808-psmi-v3-11-a111e9f1e4b7@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250808-psmi-v3-0-a111e9f1e4b7@intel.com>
References: <20250808-psmi-v3-0-a111e9f1e4b7@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-858c0
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

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_configfs.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index 7c92d293ba733..58196b7571239 100644
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


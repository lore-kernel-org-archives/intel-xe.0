Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC84CCA0FE1
	for <intel-xe@archiver.kernel.org>; Thu, 21 Aug 2025 16:18:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B091A10E38F;
	Thu, 21 Aug 2025 16:18:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fk9WV4+8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22B2810E38F
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Aug 2025 16:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755793117; x=1787329117;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=59K19JJ6zd+mYW+Hyo4l1h47M9rs7AOejw7L26KsPqw=;
 b=Fk9WV4+8Mqke8t6/alQr6V+qnepM/nIgSbVABwAZvuC+/gFdsBXXIvFv
 grMzz8gbdqZP6Tel1qnDzdMdrouSXU4y39RaA8Cat1tdoVce+XQ3WW7su
 izRd2/wFpOi/a491X0jPeitOdErWH5rF3Gd3ZRxkeO+tRIcuUik8zxNSg
 fysm3hGa5yydTOg82cG5TPMmMWq449A+g4GAHKwmHxQXJqcGe+L2IuSM7
 x8jovZ1BNfkojYi1InHF7ELocdjJcoDe103NP1r8f53TcLjiFFCTBSMTT
 HqEMp4b7pZvk+Afyx14n27PF6YJGcR6mrktdTXAGR43juAbbzq9koKF2W A==;
X-CSE-ConnectionGUID: Tc6gd9VbSoy/oBOIAH23qg==
X-CSE-MsgGUID: p6QaMLXOT6KBuAJjLQ1btg==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="69527897"
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; d="scan'208";a="69527897"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2025 09:18:36 -0700
X-CSE-ConnectionGUID: 15JTvyphS7KmUfuKWJr+QQ==
X-CSE-MsgGUID: wFyZFqhBSGakCO7hRgPwkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; d="scan'208";a="199326739"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2025 09:18:35 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, prashanth.kumar@intel.com,
 dnyaneshwar.bhadane@intel.com, Riana Tauro <riana.tauro@intel.com>
Subject: [PATCH v5 10/12] drm/xe/configfs: Improve documentation steps
Date: Thu, 21 Aug 2025 09:18:05 -0700
Message-ID: <20250821-psmi-v5-10-34ab7550d3d8@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250821-psmi-v5-0-34ab7550d3d8@intel.com>
References: <20250821-psmi-v5-0-34ab7550d3d8@intel.com>
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
index 25b47106413b6..089e21fefcfd8 100644
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
  * Allowed engines:
  * ----------------

-- 
2.50.1


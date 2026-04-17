Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA1AEF8DFD0
	for <intel-xe@archiver.kernel.org>; Fri, 17 Apr 2026 08:25:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D13810E991;
	Fri, 17 Apr 2026 08:25:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DA/w63uL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50D8A10E991
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Apr 2026 08:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776414330; x=1807950330;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fNCRvSan0vuhYDIuMLjtIyjgnJaqaz2m57EDtRN3KPM=;
 b=DA/w63uL0Gc4IA3bH6bsDqudGvzTMmpl1OM0Rpk3zecWLfV7yqo1gZEi
 DuXPBidCunLbZEDt5abRcwrBpcEeZD3a4APKJxPx51Esj0Fm8pm6nuFR7
 sKyXl88ClyboYpcwKNZSFy9o3zmKJIOwEP5HpaW6vI2x9vV4Fi6GznWhy
 jJMe7sYn+VemcYZfIv+lLubqweNs1hu+6R64Qprn9LC8MWUhD4ixwWOvE
 TVbb42omCACmwCX+k//cEZhLKOMi3fkAXUPHQLLes1vdi3449SGfz8OXC
 YQZxWFfW7QGvdWiota/BwRk6IzE7T5ocuFrtVkptjrUQeqtg8xIxDmtSL w==;
X-CSE-ConnectionGUID: lQAu/TPWSYSZ2QCXNRUWPg==
X-CSE-MsgGUID: 8YGbRV8CS1CSBhBZ4HqcKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="88045796"
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; d="scan'208";a="88045796"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2026 01:25:30 -0700
X-CSE-ConnectionGUID: /tFJhWLZRamDx+pI2aXePA==
X-CSE-MsgGUID: W6ir7ypPRYeZnXRlXmsdUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; d="scan'208";a="235962227"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2026 01:25:27 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com
Subject: [PATCH v4 01/13] drm/xe/xe_survivability: Decouple survivability info
 from boot survivability
Date: Fri, 17 Apr 2026 14:28:13 +0530
Message-ID: <20260417085812.4013309-16-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260417085812.4013309-15-riana.tauro@intel.com>
References: <20260417085812.4013309-15-riana.tauro@intel.com>
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

On CSC runtime firmware errors that requires firmware flash through SPI,
PCODE sets the FDO mode bit in the Capability register.
Currently the survivability_info group is created only for boot
survivability.

Create survivability_info group even for runtime survivability to allow
userspace to check FDO mode sysfs.

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
v2: Fix typo (Mallesh)

v3: use tab (Mallesh)
---
 drivers/gpu/drm/xe/xe_survivability_mode.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
index db64cac39c94..3110ab5d920b 100644
--- a/drivers/gpu/drm/xe/xe_survivability_mode.c
+++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
@@ -54,7 +54,6 @@
  *	# cat /sys/bus/pci/devices/<device>/survivability_mode
  *	  Boot
  *
- *
  * Any additional debug information if present will be visible under the directory
  * ``survivability_info``::
  *
@@ -98,6 +97,15 @@
  *	# cat /sys/bus/pci/devices/<device>/survivability_mode
  *	  Runtime
  *
+ * On some CSC firmware errors, PCODE sets FDO mode and the only recovery possible is through
+ * firmware flash using SPI driver. Userspace can check if FDO mode is set by checking the below
+ * sysfs entry.
+ *
+ * .. code-block:: shell
+ *
+ *	# cat /sys/bus/pci/devices/<device>/survivability_info/fdo_mode
+ *	  enabled
+ *
  * When such errors occur, userspace is notified with the drm device wedged uevent and runtime
  * survivability mode. User can then initiate a firmware flash using userspace tools like fwupd
  * to restore device to normal operation.
@@ -296,7 +304,8 @@ static int create_survivability_sysfs(struct pci_dev *pdev)
 	if (ret)
 		return ret;
 
-	if (check_boot_failure(xe)) {
+	/* Survivability info is not required if enabled via configfs */
+	if (!xe_configfs_get_survivability_mode(pdev)) {
 		ret = devm_device_add_group(dev, &survivability_info_group);
 		if (ret)
 			return ret;
-- 
2.47.1


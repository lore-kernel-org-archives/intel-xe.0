Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23FA1CC6B00
	for <intel-xe@archiver.kernel.org>; Thu,  2 Apr 2026 06:29:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAABA10EFD8;
	Thu,  2 Apr 2026 06:29:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jrvH8OFB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A191310EFFA
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Apr 2026 06:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775111378; x=1806647378;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GF+BfzxTcXAdTTY4LUXV//94Ju5c2M1mSzxAWE73LhI=;
 b=jrvH8OFBGyG8kjpfEZJb9W0i4pOwn5Anq+4b1FlC0RWyDp7k2+LO9edV
 coDArCd9mPDs32AgPZJhfwYH4EGX3iZKA5edlMGwAdLsY55A2LQ39HpNW
 vPMDaBSEJw2ul3YZipIWKEs+FKRKdb/90p7uHSL3hBrftt/BrhNFE0Uoy
 hQs+cHnMw0t/ohiOibzJ6Pp/knArUNCkiFTReZfhEvNXTWKTT2rzQCbS9
 0SZD5wbjUtDi0kdiYlRwKkQzxd81IVIsRwFfsUggPpxvy6/HwnAHONPml
 RrG0ZSEXwSOvVPP6DRGEAPPEbeVYddR+n4VB354cEiL0hwwQP909DrGYW g==;
X-CSE-ConnectionGUID: 2+p15h6sQNSWHWqoDtlKqw==
X-CSE-MsgGUID: Gd3fsEUsSf2KDhQwxHrmOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="76051477"
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; d="scan'208";a="76051477"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 23:29:38 -0700
X-CSE-ConnectionGUID: Jl62V8iRTcWph5K/uTziZA==
X-CSE-MsgGUID: G+Zhha3xThqGtTHXEF+3dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; d="scan'208";a="222532232"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 23:29:34 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com
Subject: [PATCH v3 01/10] drm/xe/xe_survivability: Decouple survivability info
 from boot survivability
Date: Thu,  2 Apr 2026 12:31:32 +0530
Message-ID: <20260402070131.1603828-13-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260402070131.1603828-12-riana.tauro@intel.com>
References: <20260402070131.1603828-12-riana.tauro@intel.com>
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
---
v2: Fix typo (Mallesh)
---
 drivers/gpu/drm/xe/xe_survivability_mode.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
index db64cac39c94..ad51a58831b0 100644
--- a/drivers/gpu/drm/xe/xe_survivability_mode.c
+++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
@@ -98,6 +98,15 @@
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
+ *       enabled
+ *
  * When such errors occur, userspace is notified with the drm device wedged uevent and runtime
  * survivability mode. User can then initiate a firmware flash using userspace tools like fwupd
  * to restore device to normal operation.
@@ -296,7 +305,8 @@ static int create_survivability_sysfs(struct pci_dev *pdev)
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


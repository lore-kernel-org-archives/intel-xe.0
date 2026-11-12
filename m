Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96626606A31C
	for <intel-xe@archiver.kernel.org>; Thu, 12 Nov 2026 09:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Y1E+qbvu
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5944010FF88;
	Thu, 12 Nov 2026 09:58:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A1B510FF88
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Nov 2026 09:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794477478; x=1826013478;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=FWoG4UWCTe3owk2Z2WY32TFY2mCSO+JYPkM3dkVDEK4=;
 b=Y1E+qbvudwv2SctzByAI0g0t65mf/8wyrANYWrzF6QrGd2EHO7DXr1za
 aRmj8hNznipsy81vx1rO+PYnNLmug6yTfrHkLMSAqwQ98vklHmqdI5/vw
 Ne7LIiauqi/M2cO5Ye5YYRbmy6f1CVWRSNpf78E/OceoA0kCzI8pd79lW
 NaSAGPpo3hNZBxzsRHOQeCOb8h0qk7TWiO+dAjAH1e1KYaGseW1+y8+9Y
 x46ScAWebJvEvDkwpjtegJG8E6jwR5AoV8aqrgOUWyGSHGBXkKFr3TlBz
 zM/vsdQaX67XM9guvgnUj+TrdBA0TmAwdtOJxI+XnmSlnj13cBltgWXiX g==;
X-CSE-ConnectionGUID: wBIuctalQ0+ZkubkBAWdtQ==
X-CSE-MsgGUID: u/t6L/H5Rwqe2xCYR4N3PQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3284855"
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="3284855"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2026 01:57:57 -0800
X-CSE-ConnectionGUID: RhBxEL4jQragmPfoGpTYOw==
X-CSE-MsgGUID: 8BGii5ZlQ+uEsBvtpv2/0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="8965138"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2026 01:57:55 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com,
 aravind.iddamsetty@linux.intel.com, raag.jadav@intel.com,
 badal.nilawar@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com
Subject: [PATCH v4] drm/xe/xe_ras: Add support for PCIe error component
 handling
Date: Thu, 12 Nov 2026 15:27:45 +0530
Message-ID: <20261112095744.3520095-2-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add support for handling PCIe subsystem errors. PCIe subsystem power
management errors require a Seconday bus reset(SBR) for recovery. Treat all
others as recovered and take no further action.

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
v2: add mapping to cper severity (Badal, Rodrigo)
    add abbreviations
    fix punctuations (Raag)

v3: drop fabric patch

v4: add global_error_status in log (Raag, Mallesh)
---
 drivers/gpu/drm/xe/xe_ras.c       | 16 ++++++++++++++++
 drivers/gpu/drm/xe/xe_ras_types.h |  2 ++
 2 files changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index 2c01c183d02b..da57ff60c11d 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -698,6 +698,19 @@ static u8 handle_device_memory_errors(struct xe_device *xe, struct xe_ras_error_
 	return XE_RAS_RECOVERY_ACTION_RECOVERED;
 }
 
+static u8 handle_pcie_errors(struct xe_device *xe, struct xe_ras_error_array *arr)
+{
+	struct xe_ras_ieh_error *info = (void *)arr->details;
+
+	xe_log_comp(xe, ras_sev_to_cper_sev(arr->counter.common.severity), PCIE, &arr->counter,
+		    sizeof(arr->counter), "error detected: 0x%08x\n", info->global_error_status);
+
+	if (info->global_error_status & XE_RAS_PCIE_IEH_GPMA)
+		return XE_RAS_RECOVERY_ACTION_RESET;
+
+	return XE_RAS_RECOVERY_ACTION_RECOVERED;
+}
+
 void xe_ras_counter_threshold_crossed(struct xe_device *xe,
 				      struct xe_sysctrl_event_response *response)
 {
@@ -889,6 +902,9 @@ enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe)
 			case XE_RAS_COMP_DEVICE_MEMORY:
 				action = handle_device_memory_errors(xe, arr);
 				break;
+			case XE_RAS_COMP_PCIE:
+				action = handle_pcie_errors(xe, arr);
+				break;
 			default:
 				/* For any other component, reset */
 				action = XE_RAS_RECOVERY_ACTION_RESET;
diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
index a86f9d2b8c92..36435a3f52e7 100644
--- a/drivers/gpu/drm/xe/xe_ras_types.h
+++ b/drivers/gpu/drm/xe/xe_ras_types.h
@@ -14,6 +14,8 @@
 #define XE_RAS_NUM_PAGES			25
 /* Error bits in IEH global error status register */
 #define XE_RAS_SOC_IEH_PUNIT			BIT(1)
+#define XE_RAS_PCIE_IEH_GPMA			BIT(5)
+
 /* Device memory error categories */
 #define XE_RAS_MEMORY_DB_ECC			BIT(1)
 #define XE_RAS_MEMORY_POISON			BIT(2)
-- 
2.47.1


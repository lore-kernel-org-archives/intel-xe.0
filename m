Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5251606A88B
	for <intel-xe@archiver.kernel.org>; Wed, 11 Nov 2026 12:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=O7KgAKT7
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6242910FB57;
	Wed, 11 Nov 2026 12:30:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F153A10FB57
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Nov 2026 12:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794400237; x=1825936237;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8fG2HkwDp6EiiH/CgTFaV/N3HPRj9l7jn0V1iBQaBlc=;
 b=O7KgAKT75+qlFqtoCni3POs6PqlUtsBsYAHocaAUn9wPQvNVKY90a6Wy
 BzEhoAn4FtIEbzvJHSmgTKttqGhupQZToBCwPNLgA2cTnNA7BgwEuKWW+
 KZKIVEgLI/mC6IFCyTV4sFoSw9mEAGk4FmLCLZXUB0WMgndnk8Kj1KLa1
 3RLn1vIKDpDIyR2+eiH/f68RUg3hYYMMnUZJIKincV6JybW/C0iIFzxE3
 QoIhpAfrtZzIWNKctv/j4k/FsZQqpnh6xq4f+NFknK6p0LwHcdoPWnpTO
 1MzQfmi0aUmdYcCDU5K7xyjRuvOY+PCytB0hMVfs/QGP1c95vY0IHeRkL g==;
X-CSE-ConnectionGUID: b2wT0YeIRtOABIV14VWR4g==
X-CSE-MsgGUID: f9LN6ixVS7e1S+J47mk/Cg==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3200832"
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="3200832"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2026 04:30:37 -0800
X-CSE-ConnectionGUID: BxRf0me4TZutt+TEVWSWnw==
X-CSE-MsgGUID: LIJFMzzORx6UV2mCTAJ54w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="8844669"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2026 04:30:34 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com,
 aravind.iddamsetty@linux.intel.com, raag.jadav@intel.com,
 badal.nilawar@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com
Subject: [PATCH v3] drm/xe/xe_ras: Add support for PCIe error component
 handling
Date: Wed, 11 Nov 2026 18:00:22 +0530
Message-ID: <20261111123021.3253044-2-riana.tauro@intel.com>
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
---
 drivers/gpu/drm/xe/xe_ras.c       | 16 ++++++++++++++++
 drivers/gpu/drm/xe/xe_ras_types.h |  2 ++
 2 files changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index 2c01c183d02b..bd3ad017f013 100644
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
+		    sizeof(arr->counter), "error detected\n");
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


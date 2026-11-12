Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0989606A31C
	for <intel-xe@archiver.kernel.org>; Thu, 12 Nov 2026 06:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ba8QdwVl
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7712C10E4D9;
	Thu, 12 Nov 2026 06:07:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62D7410E4F9
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Nov 2026 06:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794463661; x=1825999661;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JmmYjv1xi1Y4bg6RvuDCnr9WYDm80n062Wa8Vih907U=;
 b=ba8QdwVl1oBMT1Ug1LLR3IE50Tq++R2maMzSz5GJO5EKN7AqaNhnhKoK
 vCK8ipXHVKrhloD1ybhzrOenwZ0sHBSwZgX+7mlpnMQPSFkTOdRf9wKdS
 QnBs1d41ZsXZc95guh80/PLu0ZY0BK++iupFDiufeV9p0e2VuAz6DJuXP
 YUahYCakQQSIyOalnvquzPszsiS5dksVy7oGgOt+qK4ouMBXjs99xxEgf
 wYBVHylvrBBR23zjrBiZAHjPps9z3A6UEJVi+RB3R/jNpmHIPNgUjJa9I
 FLVCHJhHAe4DhpS9YKkVXt7jcaTrtD4oBPYie0yH9dXOr/A0YuC8x1dNQ g==;
X-CSE-ConnectionGUID: waaUcfVCSxidGMCmpNqt7Q==
X-CSE-MsgGUID: UPeSD4BOSUWgHHjpiiTKWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3265031"
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="3265031"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2026 22:07:41 -0800
X-CSE-ConnectionGUID: qyURX3VxRAad8kEtDRs03Q==
X-CSE-MsgGUID: LsWflXdnQTKL9H4EPqecVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="8576280"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2026 22:07:38 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com,
 aravind.iddamsetty@linux.intel.com, raag.jadav@intel.com,
 badal.nilawar@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, rodrigo.vivi@intel.com,
 Andi Shyti <andi.shyti@linux.intel.com>
Subject: [PATCH v5 8/8] drm/xe/xe_ras: Skip double-bit ECC page offlining on
 AER path
Date: Thu, 12 Nov 2026 11:37:10 +0530
Message-ID: <20261112060701.3327125-18-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20261112060701.3327125-10-riana.tauro@intel.com>
References: <20261112060701.3327125-10-riana.tauro@intel.com>
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

Device fatal errors trigger AER, which can race with non-fatal
double-bit ECC errors reported via IRQ. If the AER PCI error handler
runs first, it receives all errors as a single response from the
system controller firmware, which can include the double-bit ECC errors.

Handling these on the AER path leads to unnecessary page offlining,
since an SBR clears the offlined pages on reload and firmware drops them
from its queue once read. Skip double-bit ECC handling when on the AER
path to avoid this.

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
v2: fix duplicate handling issue due to rebase (Sashiko)
---
 drivers/gpu/drm/xe/xe_ras.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index 1809c3c893de..0fb891d00b36 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -669,13 +669,29 @@ static u8 handle_device_memory_errors(struct xe_device *xe, struct xe_ras_error_
 				 "Data parity error detected\n");
 		break;
 	case XE_RAS_MEMORY_DB_ECC:
+		/*
+		 * Double-bit ECC errors are non-fatal errors and are reported via IRQ.
+		 * On a race between AER for device fatal errors and non-fatal double-bit ECC
+		 * errors, if AER pci error handlers execute first it will get all errors as
+		 * a single response from system controller, which can include the double-bit
+		 * ECC errors. This leads to unnecessary offlining of pages, since an SBR clears
+		 * them on reload and firmware drops them from its queue once read.
+		 * Skip handling of double-bit ECC errors on the AER path to avoid this.
+		 *
+		 * TODO: Remove this check once AER handling is optimized to retain soft
+		 * offlined pages.
+		 */
+		if (xe_ras_is_aer_internal_error(xe)) {
+			xe_info(xe, "[RAS]: Skipping double-bit ECC error handling on AER path\n");
+			break;
+		}
+
 		ret = handle_page_offline(xe, info->sw_address, true);
 		xe_log_comp(xe, ret ? cper_sev : CPER_SEV_INFORMATIONAL,
 			    DEVICE_MEMORY, &arr->counter, sizeof(arr->counter),
 			    "Double-bit ECC error detected at sw address 0x%llx\n",
 			    info->sw_address);
 		/*
-		 * Double-bit ECC errors are non-fatal errors and are reported via IRQ.
 		 * Wedge the device with a bus reset for errors that require SBR to recover.
 		 * TODO: Trigger SBR using pci_reset_bus
 		 */
-- 
2.47.1


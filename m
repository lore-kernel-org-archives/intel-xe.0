Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED14E606A32C
	for <intel-xe@archiver.kernel.org>; Tue,  3 Nov 2026 06:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EkZ7+Wkl
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A56E210F378;
	Tue,  3 Nov 2026 06:10:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 810BB10F37A
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Nov 2026 06:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793686209; x=1825222209;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=99363QgUJeGRFZUZnAsVnStWlZFgzth6YznFbC/ld6g=;
 b=EkZ7+WklgGohenVThW35+hLCeVEnRjGOHE7YmuRG2dykNGtPa/4PX71/
 fz6YWvjvnvfxncFThNGrVFmVvQ4C2K7K7OOfon0Dg+QBrk4OSobCVPQnY
 fDGPj0BQEq0M1kUHGaCtO1b1lD3tgXPzyJGn5jrDGlPjxOZSx8ybC5Mgu
 bTWawDlsaqd071VZGwo7+sNQ53+1dwx8nGbkjfUpCQF2Dx5I33AGORCY9
 Hn9JApb/4LoIrOWiR7hz5smn31BgnHpueXPHk3azMmMRUr0nrB55HxDtW
 qB8v0pWykdUzcQJpSOzGuIoY4mraIkhnYOc/M8K0xi/WWKAUHTOWoz/Sn A==;
X-CSE-ConnectionGUID: 9nmX0x9BQA+/DpHuFHZVLQ==
X-CSE-MsgGUID: Et2Gu7/mTxS6h7smnRgTRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2276732"
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="2276732"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 22:10:09 -0800
X-CSE-ConnectionGUID: gXECS7zWQcKgNOaHI+EoLA==
X-CSE-MsgGUID: L4EJty2PQQCljZ61K4bJ8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="6446408"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 22:10:05 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, raag.jadav@intel.com,
 ravi.kishore.koppuravuri@intel.com, mallesh.koujalagi@intel.com,
 tejas.upadhyay@intel.com, Andi Shyti <andi.shyti@linux.intel.com>
Subject: [PATCH v3 7/7] drm/xe/xe_ras: Skip double-bit ECC page offlining on
 AER path
Date: Tue,  3 Nov 2026 11:39:37 +0530
Message-ID: <20261103060929.1586783-16-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20261103060929.1586783-9-riana.tauro@intel.com>
References: <20261103060929.1586783-9-riana.tauro@intel.com>
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
 drivers/gpu/drm/xe/xe_ras.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index 1809c3c893de..32aa376555bd 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -676,6 +676,23 @@ static u8 handle_device_memory_errors(struct xe_device *xe, struct xe_ras_error_
 			    info->sw_address);
 		/*
 		 * Double-bit ECC errors are non-fatal errors and are reported via IRQ.
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
+		ret = handle_page_offline(xe, info->sw_address, true);
+		/*
 		 * Wedge the device with a bus reset for errors that require SBR to recover.
 		 * TODO: Trigger SBR using pci_reset_bus
 		 */
-- 
2.47.1


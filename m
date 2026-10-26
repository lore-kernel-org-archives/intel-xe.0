Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4501B606A31A
	for <intel-xe@archiver.kernel.org>; Mon, 26 Oct 2026 06:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lJ7k6/Pe
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B80610EA8B;
	Mon, 26 Oct 2026 06:05:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11A3210EA96
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Oct 2026 06:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792994747; x=1824530747;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hHWyjv9IMv2HkeOo/Kn8wm9fbR3p1VkJIGTe46thvyY=;
 b=lJ7k6/PeNo4YTw1KvLDo20KNK8wpnRcxo++K0OR5NlvEitx9IcCfT7gS
 PhRgZcP2WXkCrznFR7RDcqpJBCOYovXs/8+TBSqKU3jCwPz0eJeYC2xCp
 fUhNg35ggTcXLdjB7F8TuCA8/5aq+ieEPOgh9J8YYG6PM1ybMMoc/bdDP
 L7iD4jnJuh2+NTX6c2myW98BQrYNSaNzaYGwLqlPtVroig9ZFotBpmXNF
 kfbNZJTVeROhM9TfNwLMuxMNd/3mAgRIJUKd5KaMC64Wv+pcDJZ5goXrm
 huMYI21uQzsio4uVSUFhl4HaU+LB06ODaCsAOVFu34qHYXWL2UMAt5GsL A==;
X-CSE-ConnectionGUID: ZJzt6vGyRjKo4UK7U/oUBg==
X-CSE-MsgGUID: DobwE1dsR0ajTxtd4YJjYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1531051"
X-IronPort-AV: E=Sophos;i="6.27,178,1787036400"; 
   d="scan'208";a="1531051"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2026 23:05:47 -0700
X-CSE-ConnectionGUID: ILbJUv6dRMS72l20xeELDA==
X-CSE-MsgGUID: PJso9HR3T9q/cx6XcsMsfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,178,1787036400"; 
   d="scan'208";a="4557354"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2026 23:05:44 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, tejas.upadhyay@intel.com
Subject: [PATCH v2 9/9] drm/xe/ras: Skip double-bit ECC page offlining on AER
 path
Date: Mon, 26 Oct 2026 11:35:08 +0530
Message-ID: <20261026060459.771448-20-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20261026060459.771448-11-riana.tauro@intel.com>
References: <20261026060459.771448-11-riana.tauro@intel.com>
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
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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
---
 drivers/gpu/drm/xe/xe_ras.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index 3b07b2fa8cd4..22ecca10b7a2 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -598,6 +598,7 @@ static u8 handle_soc_internal_errors(struct xe_device *xe, struct xe_ras_error_a
 static u8 handle_device_memory_errors(struct xe_device *xe, struct xe_ras_error_array *arr)
 {
 	struct xe_ras_memory_error *info = (void *)arr->details;
+	struct xe_ras_state *ras = &xe->ras.state;
 	int ret;
 
 	/*
@@ -615,9 +616,25 @@ static u8 handle_device_memory_errors(struct xe_device *xe, struct xe_ras_error_
 		xe_info(xe, "[RAS]: Data parity error detected\n");
 		break;
 	case XE_RAS_MEMORY_DB_ECC:
-		ret = handle_page_offline(xe, info->sw_address, true);
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
+		if (ras->aer_path) {
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


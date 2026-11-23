Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9CD5606A31A
	for <intel-xe@archiver.kernel.org>; Mon, 23 Nov 2026 09:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Y2mon6z4
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A118010EB6D;
	Mon, 23 Nov 2026 09:14:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D41110EB6D
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Nov 2026 09:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795425255; x=1826961255;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MpI0zLeYUO+aWQBc0WFMAKoXVyvSioEXM89nL6iHpQk=;
 b=Y2mon6z4kFw5Rll2Omed3cywBptOgWmdekldq3Jc29LWSJduTh8rgzHd
 gqHZxjY832kHq1VKYWPEY1iAUeNjskrRR/kTzQjP7CPx0GaDXt1DqjfWX
 CQUGNuo4TTP7/7zlXmcbpG9P/2EQ7EKT0RyjUXL1m7pAlSVqsn5kEzKnb
 G0Up+RbiHMEP23B11nENSKObavZPUtgZVhWDvSwuxz1Dl5h8FMJQszbLq
 3G9ppNch+XzAkHeO3EgJWxbi4tQNf0KlSMiQGeMATQjKTwNWfmc+Mc1ER
 19vguj9bNyEnEscpllUyujj1TDmVROnvVJuMRWro766lzXDdUNFRGraHN A==;
X-CSE-ConnectionGUID: XzL0NClHR1G7NyRmTeF7TA==
X-CSE-MsgGUID: Z1dtG32uQP2r0zqpi8jYIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4123521"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4123521"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 01:14:14 -0800
X-CSE-ConnectionGUID: jJgM1KEIS1CCYLY12TghBw==
X-CSE-MsgGUID: R7JVQ2BJSMuDEJM7zjHHLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; d="scan'208";a="11805770"
Received: from rkoppura-z790i-aorus-ultra.iind.intel.com ([10.190.239.17])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 01:14:12 -0800
From: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, raag.jadav@intel.com, anshuman.gupta@intel.com,
 mallesh.koujalagi@intel.com,
 Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
Subject: [PATCH] drm/xe/xe_ras: Hint at application page fault for local
 compute errors
Date: Mon, 23 Nov 2026 14:43:56 +0530
Message-Id: <20261123091356.1877750-1-ravi.kishore.koppuravuri@intel.com>
X-Mailer: git-send-email 2.34.1
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

Unhandled application page faults are reported by the hardware as local
core core compute uncorrectable errors. Users reading the resulting SIGID
203 log treats it as a hardware failure.

Add an additional log to the core compute error message for local uncorrectable
errors that they are often caused by an application page fault.

Signed-off-by: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
---
 drivers/gpu/drm/xe/xe_ras.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index 0fb891d00b36..3371ddf5ddf4 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -39,6 +39,7 @@
  * 2 - Global Uncorrectable Error
  * 3 - Informational Error
  */
+#define  LOCAL_UNCORR_ERROR		1
 #define  GLOBAL_UNCORR_ERROR		2
 
 /* Severity of detected errors  */
@@ -583,7 +584,9 @@ static u8 handle_core_compute_errors(struct xe_device *xe, struct xe_ras_error_a
 	uncorr_type = FIELD_GET(CORE_COMPUTE_UNCORR_TYPE, error_info->log_header);
 
 	xe_log_comp(xe, cper_sev, CORE_COMPUTE, &arr->counter, sizeof(arr->counter),
-		    "Uncorrectable error detected, type %u\n", uncorr_type);
+		    "Uncorrectable error detected, type %u%s\n", uncorr_type,
+		    uncorr_type == LOCAL_UNCORR_ERROR ?
+		    " (often caused by an application page fault)" : "");
 
 	/* Request a reset if error is global */
 	if (uncorr_type == GLOBAL_UNCORR_ERROR)
-- 
2.34.1


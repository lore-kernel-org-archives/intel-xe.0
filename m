Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C933D606A31A
	for <intel-xe@archiver.kernel.org>; Fri, 23 Oct 2026 04:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=THbBS5lE
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91DE811293D;
	Fri, 23 Oct 2026 04:18:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 202A511294F
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Oct 2026 04:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792729077; x=1824265077;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1TZ1n48/XRGhsWttFOtuMTM7GFxSRK0fKecEZPfCXmQ=;
 b=THbBS5lE/PGWiWdtCcoP48RcjVsp6x1Jeev9bRoi6yp8Plm2cAsBXGs6
 5IvtQ96UeeDGKfQONmzhP+AZggUdT4q0taXXsEZvImq9VHSrFzRNs/Ahs
 0WP8JZeICreZEQ2e7ssj+Wm+TvdsO4F+KrbB70rHXXKpSvyDvhOgXdmBP
 MV2qlaXcQw8Gx3AghMtYBptDHkQfLueY/Kjwy3oaMzzDnEi4TWwosbpUJ
 GN8A0rTnWPIH4LPw/yU4ZdF5ETe/WaRgvzC1fWlPOPbrqv65UqHiN4Vkd
 o6q8PD+pq6LUVLV79d2dBsbcLkChQba0m/6mG0V2KqOfhiNtirLg95Z0I w==;
X-CSE-ConnectionGUID: lLzjpsFbQ7WyrfpEIxUNlQ==
X-CSE-MsgGUID: L+8GYqjsTFue36ROxpBX0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="1383510"
X-IronPort-AV: E=Sophos;i="6.27,173,1787036400"; 
   d="scan'208";a="1383510"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 21:17:57 -0700
X-CSE-ConnectionGUID: rjGUjnqpQAO7HkHPet9F5g==
X-CSE-MsgGUID: f4gBaqzMR5i+04PDf5W7vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,173,1787036400"; 
   d="scan'208";a="3658307"
Received: from bnilawar-desk2.iind.intel.com ([10.190.239.41])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 21:17:54 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 daniele.ceraolospurio@intel.com, raag.jadav@intel.com,
 riana.tauro@intel.com, mallesh.koujalagi@intel.com,
 aravind.iddamsetty@intel.com, himal.prasad.ghimiray@intel.com,
 arvind.yadav@intel.com, syed.abdul.muqthyar.ahmed@intel.com,
 nitin.r.gote@intel.com
Subject: [PATCH v5 11/13] drm/xe/xe_ras: Report unknown errors using SIGID
Date: Fri, 23 Oct 2026 10:04:33 +0530
Message-ID: <20261023043422.681260-26-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261023043422.681260-15-badal.nilawar@intel.com>
References: <20261023043422.681260-15-badal.nilawar@intel.com>
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

Use xe_log_* helper to report unknown errors.

Assisted-by: LLM
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 drivers/gpu/drm/xe/xe_ras.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index cd64baddd8de..b3dc4d8ad190 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -893,6 +893,11 @@ enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe)
 				action = handle_device_memory_errors(xe, arr);
 				break;
 			default:
+				xe_log_from(xe, ras_sev_to_cper_sev(severity),
+					    ras_comp_to_hw_sigid(component),
+					    ras_comp_to_log_comp(component),
+					    &arr->counter, sizeof(arr->counter),
+					    "Unknown error detected, reset required\n");
 				/* For any other component, reset */
 				action = XE_RAS_RECOVERY_ACTION_RESET;
 				break;
-- 
2.54.0


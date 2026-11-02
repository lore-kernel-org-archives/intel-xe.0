Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B25A3606A329
	for <intel-xe@archiver.kernel.org>; Mon,  2 Nov 2026 17:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KGnEnkK2
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 770FF10E6C1;
	Mon,  2 Nov 2026 17:25:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3B1910E6C1
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Nov 2026 17:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793640347; x=1825176347;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/cspa97ugGzNROVDs0EMeZ3rF77+7ossmvyUHouWGJw=;
 b=KGnEnkK24v3iILhj5Iiv7ihipeRibXIWS0YteTol7/MbYoCXbG8g0WpV
 7cMctWQW3PzUxOhI9kT+PWk05Hd4wpBj82Ww4qZQFlgkyOibJKctVn05h
 sH3Ew/Ls6B3yxqYigUFBBOqClaTi/bZNrunwQcJWo2s7PkkP++Az7q6sg
 Urj920gPko35OQRf97S+peB2wnKGVKNNuTFzk66BGQW+//3kSLD88mD1y
 ADAv3eIELkhEkc00MycQtr/2/meIJnGGcYUXeE1HnWUXkQ5XTl6cEqLUM
 QRq7cypR2ybNLERNgkMH/QpC8N+PRi0HpsCtc7gQ7Ei09GMNc0B4FMGZI w==;
X-CSE-ConnectionGUID: 2NC8u1EXSoSC8ue3KRADHg==
X-CSE-MsgGUID: VEflbqdQRWWsLMa8ryw42g==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2359685"
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="2359685"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 09:25:47 -0800
X-CSE-ConnectionGUID: oh5FFfseSc2t+tqoZLbk4g==
X-CSE-MsgGUID: zBfwu2M5TZi8DsSqQd3R1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="6091278"
Received: from bnilawar-desk2.iind.intel.com ([10.190.239.41])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 09:25:45 -0800
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 daniele.ceraolospurio@intel.com, michael.j.ruhl@intel.com,
 alexander.usyskin@intel.com, anoop.c.vijay@intel.com,
 shamim.begum@intel.com, kelvin.gardiner@intel.com
Subject: [PATCH v7 5/6] drm/xe/xe_late_bind_fw: Enable late binding support
 for CRI
Date: Mon,  2 Nov 2026 22:55:33 +0530
Message-ID: <20261102172527.2794537-13-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261102172527.2794537-8-badal.nilawar@intel.com>
References: <20261102172527.2794537-8-badal.nilawar@intel.com>
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

Enable late binding support for CRI.

V2: Add CONFIG_INTEL_MEI_CSC check (Sashiko)

Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 drivers/gpu/drm/xe/xe_late_bind_fw.c | 15 ++++++++++++++-
 drivers/gpu/drm/xe/xe_pci.c          |  2 ++
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c b/drivers/gpu/drm/xe/xe_late_bind_fw.c
index c4f81fb1dff1..d3a5f09dcd58 100644
--- a/drivers/gpu/drm/xe/xe_late_bind_fw.c
+++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
@@ -484,6 +484,19 @@ static void xe_late_bind_remove(void *arg)
 	}
 }
 
+static bool late_bind_mei_enabled(struct xe_device *xe)
+{
+	if (!IS_ENABLED(CONFIG_INTEL_MEI_LB))
+		return false;
+
+	/* MEI exposed as xe auxiliary device */
+	if (xe->info.has_heci_gscfi || xe->info.has_heci_cscfi)
+		return IS_ENABLED(CONFIG_INTEL_MEI_GSC);
+
+	/* Standalone MEI PCI function */
+	return IS_ENABLED(CONFIG_INTEL_MEI_CSC);
+}
+
 /**
  * xe_late_bind_init() - add xe mei late binding component
  * @late_bind: pointer to late bind structure.
@@ -498,7 +511,7 @@ int xe_late_bind_init(struct xe_late_bind *late_bind)
 	if (!xe->info.late_bind_mask)
 		return 0;
 
-	if (!IS_ENABLED(CONFIG_INTEL_MEI_LB) || !IS_ENABLED(CONFIG_INTEL_MEI_GSC)) {
+	if (!late_bind_mei_enabled(xe)) {
 		drm_info(&xe->drm, "Can't init xe mei late bind missing mei component\n");
 		return 0;
 	}
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 3e6f8f936235..ba23ec60477b 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -488,6 +488,8 @@ static const struct xe_device_desc cri_desc = {
 	.has_sriov = true,
 	.has_sysctrl = true,
 	.has_temp_sentinel = true,
+	.late_bind_mask = BIT(XE_LB_FW_FAN_CONTROL) |
+			  BIT(XE_LB_FW_OCODE),
 	.max_gt_per_tile = 2,
 	MULTI_LRC_MASK,
 	.require_force_probe = true,
-- 
2.56.0


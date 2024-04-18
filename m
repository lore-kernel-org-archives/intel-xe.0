Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24493C4345F
	for <intel-xe@archiver.kernel.org>; Thu, 18 Apr 2024 14:40:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D41BC113D0C;
	Thu, 18 Apr 2024 14:40:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M7zT1qqu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48E70113D0D;
 Thu, 18 Apr 2024 14:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713451207; x=1744987207;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ib3nvcl2iClXrsiXyjKJemepOXsKjtA6Y65y0TlSa4A=;
 b=M7zT1qquUz1j8vO0ZWPJyjFPguCA6M0tNU1Lt5MXS8DqP5K/TqI88vwB
 trka8QNcA/w9i/7/tOzK6PpHUguCZw8/Kq+HEMEUwGSG9T46j7ZViKZrS
 OXM2OEvzMOqmYp0d6ZZPidpWl2Aiov29wMtzR7iHZ1P46qkihPR9DxDIx
 YLx5SVZOCucpxvMIACXGvOD6BxtM1BZU/Z400+rKSckjJmVk0T8Gj6TR5
 rR4fhO80v35TUmSJpqlWPOhyhkoxn9t0FMe0EnjazX6Y/qGqb9ljg4cIe
 bwj70EbykU8up0jQ3jacnltz9ro9iRBs1JEdKMZQePJy9fZUabIyBQWEq g==;
X-CSE-ConnectionGUID: jR/oS1ouRvG0EDGQn+yqzQ==
X-CSE-MsgGUID: eXtPDmz+RBG24dqg/30dLA==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="19701103"
X-IronPort-AV: E=Sophos;i="6.07,212,1708416000"; d="scan'208";a="19701103"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2024 07:40:07 -0700
X-CSE-ConnectionGUID: exl0M+WVQByn9xE+koFE0g==
X-CSE-MsgGUID: VvRKzjXLRcWCBzPnuq52rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,212,1708416000"; d="scan'208";a="27780976"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2024 07:40:05 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com,
	lucas.demarchi@intel.com,
	rodrigo.vivi@intel.com
Subject: [PATCH 1/5] drm/i915/dmc: handle request_firmware() errors separately
Date: Thu, 18 Apr 2024 17:39:50 +0300
Message-Id: <725c3580aae52bf34f32b93275cce6208dfd42b7.1713450693.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1713450693.git.jani.nikula@intel.com>
References: <cover.1713450693.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

Clarify request_firmware() error handling. Don't proceed to trying to
parse non-existent firmware or check for payload when request_firmware()
failed to begin with. There's no reason to release_firmware() either
when request_firmware() failed.

Also move the message about DMC firmware homepage here, as in other
cases the user probably has some firmware, although its parsing fails
for some reason.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dmc.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dmc.c b/drivers/gpu/drm/i915/display/intel_dmc.c
index a34ff3383fd3..65880dea9c15 100644
--- a/drivers/gpu/drm/i915/display/intel_dmc.c
+++ b/drivers/gpu/drm/i915/display/intel_dmc.c
@@ -942,6 +942,15 @@ static void dmc_load_work_fn(struct work_struct *work)
 		}
 	}
 
+	if (err) {
+		drm_notice(&i915->drm,
+			   "Failed to load DMC firmware %s (%pe). Disabling runtime power management.\n",
+			   dmc->fw_path, ERR_PTR(err));
+		drm_notice(&i915->drm, "DMC firmware homepage: %s",
+			   INTEL_DMC_FIRMWARE_URL);
+		return;
+	}
+
 	parse_dmc_fw(dmc, fw);
 
 	if (intel_dmc_has_payload(i915)) {
@@ -956,8 +965,6 @@ static void dmc_load_work_fn(struct work_struct *work)
 			   "Failed to load DMC firmware %s."
 			   " Disabling runtime power management.\n",
 			   dmc->fw_path);
-		drm_notice(&i915->drm, "DMC firmware homepage: %s",
-			   INTEL_DMC_FIRMWARE_URL);
 	}
 
 	release_firmware(fw);
-- 
2.39.2


Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90DBEC25B75
	for <intel-xe@archiver.kernel.org>; Mon,  3 Jun 2024 08:46:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BA3910E309;
	Mon,  3 Jun 2024 08:46:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TC4fqzJ0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A95D10E30D
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Jun 2024 08:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717404359; x=1748940359;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+q3qPa53CW/eWCjl+FZU4ifn0bM3zzfwVczHR+sLLT0=;
 b=TC4fqzJ0MI+W+CpIq+giiH2AwZbqQGzeLu7zeZhWbl0OrlEyaZKL4DF7
 o4QBVK7AOhaCKrk1LI51ZqIJutRT+CBaBZocVzOwS19+FOdGM1dLCTveg
 zXHv39IJsU8Iy3RMnmeJVGwiD+WQkMopjqkLJNdbaI5W8zDcH1QdyA05a
 Xt3OdouyJZbPFFc/g31enGvJC/KIV2TAuOiWoC/72ja3gHzaCTnfz12ul
 rME8oXVV4mvYVFSpf+JOTtbARmVGH8Mfu7vd3V4Wawtu3/dUcofSVfivt
 VhHJYiE5JUJYaEIKtEsK7f9u1TEB2nru2xOsPSbF/Zw+mK/zw4qYAwNi3 Q==;
X-CSE-ConnectionGUID: Be2gXkvpTYWGampLGNwxLw==
X-CSE-MsgGUID: gAukiuJUTHWUkhp0nvo9AQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11091"; a="13726055"
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000"; d="scan'208";a="13726055"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2024 01:45:59 -0700
X-CSE-ConnectionGUID: 64Y0tFXXTyyf7EzZ5qSnsA==
X-CSE-MsgGUID: kn15pTDNTvqQ28ZdlT8Urg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000"; d="scan'208";a="36732037"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2024 01:45:58 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v2] drm/xe/client: Check return value of xe_force_wake_get
Date: Mon,  3 Jun 2024 10:31:08 +0200
Message-ID: <20240603083108.32346-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany, Commercial Register: Amtsgericht Muenchen HRB 186928
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

xe_force_wake_get() can return error so check it's return value
before reading gpu_timestamp value.

v2: set HWE to NULL instead of setting timestamp to 0(Lucas)
    Add a warn on for xe_force_wake_put(Himal)

Fixes: 188ced1e0ff8 ("drm/xe/client: Print runtime to fdinfo")
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/xe_drm_client.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
index 4a19b771e3a0..4bdb909eabfc 100644
--- a/drivers/gpu/drm/xe/xe_drm_client.c
+++ b/drivers/gpu/drm/xe/xe_drm_client.c
@@ -264,9 +264,13 @@ static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
 		if (!hwe)
 			continue;
 
-		xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+		if (xe_force_wake_get(gt_to_fw(gt), XE_FW_GT)) {
+			hwe = NULL;
+			break;
+		}
+
 		gpu_timestamp = xe_hw_engine_read_timestamp(hwe);
-		xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
+		XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
 		break;
 	}
 
-- 
2.42.0


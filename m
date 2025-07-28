Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 756D8C83F26
	for <intel-xe@archiver.kernel.org>; Mon, 28 Jul 2025 20:01:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D64F10E584;
	Mon, 28 Jul 2025 20:01:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IEvtpGyR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EBA010E584
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Jul 2025 20:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753732906; x=1785268906;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=UOTJrq3/AMbuq/O8bDr3h8aYTgFTZoFMIcz0tWF+a2c=;
 b=IEvtpGyR8eRzTFQWtDqFrcVKVpwmBf0lNNePW3wEB1G4OpS/aJu0/FJ6
 uqt/RPkJMTBuij/wXpCHIUK+Rf9CA/JH+b7Rimr4+BCj7TgPB6YmtDscT
 r5ys/rwvI8KGycXFdcG4jrNgS94zQH1Y69GiNgF+H5gyWNAgOMvAlwrsi
 WE3I8lxeAA8PAVHeBgxlkSo0CqSUmn+5+a5VrQRJwpV41q4okHYNaf1oB
 oeNcOZEgISY8EAoHChH+qfdRYMYKmgPkat0yO63mIRgWnlHN1OrKbQ14t
 CWklgtZrwC8MIdf4PXOaYvxrkb04uNhpxCHxd2SNr73wx8GnYJTjA+lLc g==;
X-CSE-ConnectionGUID: +sRoZmJuQuG0IQJ4oMamBw==
X-CSE-MsgGUID: mepv+xIXRbWUdLDBLM8JuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11505"; a="73441142"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="73441142"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 13:01:46 -0700
X-CSE-ConnectionGUID: jLZ3SgORTrW26WdDRevQHQ==
X-CSE-MsgGUID: PtynXozDSpqQQHaVrGwd1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="167913114"
Received: from ldmartin-builder2.jf.intel.com ([10.165.21.143])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 13:01:45 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] [CI] drm/i915/dmc: Test Xe3LPD DMC v2.29
Date: Mon, 28 Jul 2025 16:45:37 -0300
Message-ID: <20250728194546.3748113-1-gustavo.sousa@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
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

NOT TO BE REVIEWED/MERGED

Hardcode path to DMC firmware for CI purposes only.

Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dmc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dmc.c b/drivers/gpu/drm/i915/display/intel_dmc.c
index 744f51c0e..0ec116bc1 100644
--- a/drivers/gpu/drm/i915/display/intel_dmc.c
+++ b/drivers/gpu/drm/i915/display/intel_dmc.c
@@ -127,7 +127,7 @@ static bool dmc_firmware_param_disabled(struct intel_display *display)
 #define DISPLAY_VER13_DMC_MAX_FW_SIZE	0x20000
 #define DISPLAY_VER12_DMC_MAX_FW_SIZE	ICL_DMC_MAX_FW_SIZE
 
-#define XE3LPD_DMC_PATH			DMC_PATH(xe3lpd)
+#define XE3LPD_DMC_PATH			"i915/xe3lpd_dmc_ver2_29.bin"
 MODULE_FIRMWARE(XE3LPD_DMC_PATH);
 
 #define XE2LPD_DMC_PATH			DMC_PATH(xe2lpd)
-- 
2.43.0


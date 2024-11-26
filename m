Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BE24D6555A
	for <intel-xe@archiver.kernel.org>; Tue, 26 Nov 2024 21:25:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A989310E053;
	Tue, 26 Nov 2024 21:25:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jmj8w8RE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4725F10E053
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Nov 2024 21:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732656307; x=1764192307;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=M4VHGpNGLWF0CIXMSduKwPm/tfmwVnwg7xps2oRHoRM=;
 b=jmj8w8REsmiSrOox9SvN4KWiYqOV3/6u4U8b9/vYPN4Pg5/1ocltNTgG
 Sin/ivluxq3QgKpSDjT2VVpt9REvDokvs4bSwgYAb+Y4AVt8zwjraBweC
 YA2tvJt4fKUyPSTlxTIj6LlHWnlzRgPmDCD6BU0fDqTEdwOLLCJBUrBOr
 ZqiIOr84CQpdmMNh/qDwhmnw6bEvlGTBODD5vmKbMWgSVHpQphZvNwsyS
 Qlkn2tBMm/3M8+LP8lRXpmMRYbsaCnvvmJf4G05zpoJ1SGRXuEfHtV4ie
 NyHSvUAU8VmmNQg4lQc4WVfmgkH0Kw0qzFLQiZk1+ij83oMh25l6orxe+ g==;
X-CSE-ConnectionGUID: veOQIGeCTTqMmyA7S4bmow==
X-CSE-MsgGUID: /E+zJR32Stimft/gXeZLnQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="43455811"
X-IronPort-AV: E=Sophos;i="6.12,188,1728975600"; d="scan'208";a="43455811"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2024 13:25:07 -0800
X-CSE-ConnectionGUID: nZQG30XURMWWdZFRKvr2ZQ==
X-CSE-MsgGUID: LwZOCGBFSeCMxx8oTH7t0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,188,1728975600"; d="scan'208";a="96167059"
Received: from spandruv-desk1.amr.corp.intel.com (HELO
 gjsousa-mobl2.corp.amr.intel.com) ([10.125.110.219])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2024 13:25:06 -0800
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] [CI] drm/i915/dmc: Test Xe2LPD DMC v2.24
Date: Tue, 26 Nov 2024 18:24:44 -0300
Message-ID: <20241126212448.110943-1-gustavo.sousa@intel.com>
X-Mailer: git-send-email 2.47.0
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
index 221d3abda791..005bd5f1dba6 100644
--- a/drivers/gpu/drm/i915/display/intel_dmc.c
+++ b/drivers/gpu/drm/i915/display/intel_dmc.c
@@ -116,7 +116,7 @@ static bool dmc_firmware_param_disabled(struct intel_display *display)
 #define XE3LPD_DMC_PATH			DMC_PATH(xe3lpd)
 MODULE_FIRMWARE(XE3LPD_DMC_PATH);
 
-#define XE2LPD_DMC_PATH			DMC_PATH(xe2lpd)
+#define XE2LPD_DMC_PATH			"i915/xe2lpd_dmc_ver2_24.bin"
 MODULE_FIRMWARE(XE2LPD_DMC_PATH);
 
 #define BMG_DMC_PATH			DMC_PATH(bmg)
-- 
2.47.0


Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5863ECD5BAF
	for <intel-xe@archiver.kernel.org>; Thu, 21 May 2026 18:20:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1674F10E1C9;
	Thu, 21 May 2026 18:20:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kAG2quQ9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC4A410E1C9
 for <intel-xe@lists.freedesktop.org>; Thu, 21 May 2026 18:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779387636; x=1810923636;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Hr+HBBuVKk1nYBW2aE1m10YH98s/NFdzMbqUsBO5Ix0=;
 b=kAG2quQ9OoNaicx/9gjHKl4fUxeV/P9XjI4GanQc+NgngjtB/KhDKhvz
 l9imuA3JwyL3LKU0LHlS+fR4hk/Aken6KcA8+I4hPNiMKSPhk67A/YadI
 BZ0dGixo9V6Gqi4US7a6sS8gbcganz6NFvwlZkKVxXWg/hA+nXkQP+f5H
 Ohifg/lmI+Dw9Dwzp50cNrUEG4PXKrwx9MpFo6iqgE1EedYaMW8k/4vRn
 D+kZvhVGtthnP2bA3mFqcZzlXhmDFOZ2a5kHr8HAe1j5EmrZwBD1NtmB5
 fuTg8kZsuU+3yWp8re+7ItL02YvfBw1fJ9M5rh2bG5yYDVzVmCz84vxSY g==;
X-CSE-ConnectionGUID: AkcpjvlBR0ezWF+CHvqX0g==
X-CSE-MsgGUID: rV3kUa/OSzi9FvyJ3xvBWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="84170505"
X-IronPort-AV: E=Sophos;i="6.24,160,1774335600"; d="scan'208";a="84170505"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2026 11:20:35 -0700
X-CSE-ConnectionGUID: U0TM9P08Q7inkhSvATwYfw==
X-CSE-MsgGUID: b8JgtIkmRtiYOCqp29MCmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,160,1774335600"; d="scan'208";a="240469372"
Received: from iherna2-mobl4.amr.corp.intel.com (HELO gjsousa-mobl2.intel.com)
 ([10.124.223.115])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2026 11:20:35 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] [CI] drm/i915/dmc: Test Xe3LPD_3002 DMC v2.31
Date: Thu, 21 May 2026 15:20:20 -0300
Message-ID: <20260521182024.72829-1-gustavo.sousa@intel.com>
X-Mailer: git-send-email 2.53.0
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
index 481fb65b7110..04d7bdf98922 100644
--- a/drivers/gpu/drm/i915/display/intel_dmc.c
+++ b/drivers/gpu/drm/i915/display/intel_dmc.c
@@ -128,7 +128,7 @@ static bool dmc_firmware_param_disabled(struct intel_display *display)
 #define XE3P_LPD_DMC_PATH		DMC_PATH(xe3p_lpd)
 MODULE_FIRMWARE(XE3P_LPD_DMC_PATH);
 
-#define XE3LPD_3002_DMC_PATH		DMC_PATH(xe3lpd_3002)
+#define XE3LPD_3002_DMC_PATH		"i915/xe3lpd_3002_dmc_ver2_31.bin"
 MODULE_FIRMWARE(XE3LPD_3002_DMC_PATH);
 
 #define XE3LPD_DMC_PATH			DMC_PATH(xe3lpd)
-- 
2.53.0


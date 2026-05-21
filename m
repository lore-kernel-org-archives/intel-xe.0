Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E253ECD5BAC
	for <intel-xe@archiver.kernel.org>; Thu, 21 May 2026 18:19:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FAD010E1C9;
	Thu, 21 May 2026 18:19:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JqeAgQWt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 478AF10E1C9
 for <intel-xe@lists.freedesktop.org>; Thu, 21 May 2026 18:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779387590; x=1810923590;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4CHunFLLULkhRk3vO4t9gAx6pGLkEc7hRujXQQWftJk=;
 b=JqeAgQWtugVkw5RF0xjACPnsiWyx2iB/n7BcGVg7KOHShoXYbvoo5mSe
 OdZDB1iK8vz6ITtbUMLxCJXr/Kd+lIFIHf8UrAHQb3AnmIj+39auQH+Qi
 5GMs54g2VKjrsNF5ufLuNEPbKMvvCV56I1tnR4AF0OqZhfJPSbqlDEmwd
 H9I/oc7W0qnH/7AIiDKVSRLt+Zt9uIWgLTC15aW2elKY0kDOEE1mk2m4k
 +ohA3FEDaQv7O1oEZxeerCwXiUh3qg0N5G6p9wPxbNfMk1zF9j2+NaMp3
 jc9ToNiIJUgSzw0XwUaEnGcgDSPIbSK5+7T33UvR1yeVlOHfLpWOOiZAs w==;
X-CSE-ConnectionGUID: 2qius9WnQsGlSQ4V3uyUtw==
X-CSE-MsgGUID: gErtRP2VRfmgcILUHJNeBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="80347170"
X-IronPort-AV: E=Sophos;i="6.24,160,1774335600"; d="scan'208";a="80347170"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2026 11:19:49 -0700
X-CSE-ConnectionGUID: DscUBGSFSrOJFYX8fT22lA==
X-CSE-MsgGUID: 3dkVwWJDTLWZwPU6z1c1LQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,160,1774335600"; d="scan'208";a="270957746"
Received: from iherna2-mobl4.amr.corp.intel.com (HELO gjsousa-mobl2.intel.com)
 ([10.124.223.115])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2026 11:19:49 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] [CI] drm/i915/dmc: Test Xe3LPD DMC v2.36
Date: Thu, 21 May 2026 15:19:35 -0300
Message-ID: <20260521181938.72444-1-gustavo.sousa@intel.com>
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
index 481fb65b7110..98dbaec19916 100644
--- a/drivers/gpu/drm/i915/display/intel_dmc.c
+++ b/drivers/gpu/drm/i915/display/intel_dmc.c
@@ -131,7 +131,7 @@ MODULE_FIRMWARE(XE3P_LPD_DMC_PATH);
 #define XE3LPD_3002_DMC_PATH		DMC_PATH(xe3lpd_3002)
 MODULE_FIRMWARE(XE3LPD_3002_DMC_PATH);
 
-#define XE3LPD_DMC_PATH			DMC_PATH(xe3lpd)
+#define XE3LPD_DMC_PATH			"i915/xe3lpd_dmc_ver2_36.bin"
 MODULE_FIRMWARE(XE3LPD_DMC_PATH);
 
 #define XE2LPD_DMC_PATH			DMC_PATH(xe2lpd)
-- 
2.53.0


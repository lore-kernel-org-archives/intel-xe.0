Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65566F9D0D5
	for <intel-xe@archiver.kernel.org>; Tue, 14 Apr 2026 14:47:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 103AD10E34F;
	Tue, 14 Apr 2026 14:47:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mTdqgDV/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1764F10E34F
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Apr 2026 14:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776178050; x=1807714050;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=tHKPcdKak9xsW/m7XdcXMP4fT6qI35IB8zDtOeTCz5g=;
 b=mTdqgDV/MhKmmyJufMdAbGRHjiQ80F5I4xkQg1JObdavN9QgUih9LgSK
 vkd0QhSME1dO4NRYLc30apf4TH+T1+3Df6eJsnyamCfJgZsiDZMRGLWYN
 lhDTM+ZLrqvggY1HpHeOe+VZ5aYZJHbtnFCTKUjvQe2MZRLRMsDZFh1KD
 pjxh1F87AzvtKPb1DSZaGIfk9PDpLNV7RX/RXjWD24HFPe6lckjOW/ubV
 AxG2xUZN/QjeKwknJV/HgRPqZ9Uuc8PBqG4AHw7qXKNAgvjG8NrEcjFxj
 oGiVSmdwp8IM4RqcqGLJvqwQ+mClUtVpZKXRJTmXf3PNsCu69yaeWxTyp g==;
X-CSE-ConnectionGUID: 4XS+t8egTZSCzPpnh38tag==
X-CSE-MsgGUID: HGc0t9xHQKKfrygR4+FAqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="94703978"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="94703978"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 07:47:29 -0700
X-CSE-ConnectionGUID: NK56+VSERZmj6h1ajeX68Q==
X-CSE-MsgGUID: hhNA1HgFQ0OjuZnfL9dqMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="260555762"
Received: from dnelso2-mobl.amr.corp.intel.com (HELO gjsousa-mobl2.intel.com)
 ([10.124.222.54])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 07:47:28 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] [CI] drm/i915/dmc: Test Xe3LPD_3002 DMC v2.29
Date: Tue, 14 Apr 2026 11:47:10 -0300
Message-ID: <20260414144712.19476-1-gustavo.sousa@intel.com>
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
index 2104164e136e..eadd687b68fb 100644
--- a/drivers/gpu/drm/i915/display/intel_dmc.c
+++ b/drivers/gpu/drm/i915/display/intel_dmc.c
@@ -128,7 +128,7 @@ static bool dmc_firmware_param_disabled(struct intel_display *display)
 #define XE3P_LPD_DMC_PATH		DMC_PATH(xe3p_lpd)
 MODULE_FIRMWARE(XE3P_LPD_DMC_PATH);
 
-#define XE3LPD_3002_DMC_PATH		DMC_PATH(xe3lpd_3002)
+#define XE3LPD_3002_DMC_PATH		"i915/xe3lpd_3002_dmc_ver2_29.bin"
 MODULE_FIRMWARE(XE3LPD_3002_DMC_PATH);
 
 #define XE3LPD_DMC_PATH			DMC_PATH(xe3lpd)
-- 
2.53.0


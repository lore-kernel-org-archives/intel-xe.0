Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88C7FC71148
	for <intel-xe@archiver.kernel.org>; Fri, 13 Jun 2025 19:32:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51A5E10EA51;
	Fri, 13 Jun 2025 19:32:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mwrW1lzs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6F7010EA46
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Jun 2025 19:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749843120; x=1781379120;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1Qw/ufFaFlA7K5R0eJXMaTNFPzfulYuQsUr0fAvGOmE=;
 b=mwrW1lzsTv4hiM5gxJ1okEmVXxOlL0abo5/xOr17LoIpNfDqHgRw/Kz3
 ZdlqLl3oBqBwcp2C+If10qwsMS8E09qAQGg+tI4SBMqmg5OVQQ74BNhnO
 IJV2gjugd4HbKe/bWOx4ByvMYgNmBBwxh5+0AwM3qCV5/0sD8EYQlV9E/
 unxQFDqBv1/a+sIAbHzl5rtcjbBh/mJNdMmFEGyxsmZ6qUCBf/+LvWKDS
 BokE0w/vF6036viSieAEoBVgiLMasQFLAaIb5eqX7ru70fv0fSLIccwKW
 vEDagIXAHUnNa4MIykU29p+axivzA7wE5dfUrnRRetm+tZf6n1xOrW6ES Q==;
X-CSE-ConnectionGUID: em7pPfMERnKxsCoQjbrWHw==
X-CSE-MsgGUID: zYxJMXN9R+KstU7X8pB2NA==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="69510518"
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; d="scan'208";a="69510518"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 12:32:00 -0700
X-CSE-ConnectionGUID: 0uWElJTVSmyeWMgXAr+hXw==
X-CSE-MsgGUID: k1c4pd59RAiW6DcL1r/CfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; d="scan'208";a="151722667"
Received: from dbhadane-mobl1.iind.intel.com ([10.190.239.58])
 by fmviesa003.fm.intel.com with ESMTP; 13 Jun 2025 12:31:58 -0700
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>,
 Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
Subject: [PATCH v6 7/9] drm/i915/xe3lpd: Extend DMC load path for display
Date: Sat, 14 Jun 2025 01:01:44 +0530
Message-Id: <20250613193146.3549862-8-dnyaneshwar.bhadane@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250613193146.3549862-1-dnyaneshwar.bhadane@intel.com>
References: <20250613193146.3549862-1-dnyaneshwar.bhadane@intel.com>
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

Display version 30.02 should be treated the same as other Xe3 IP.
So exteding DMC load path the condition for it.

Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Reviewed-by: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dmc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dmc.c b/drivers/gpu/drm/i915/display/intel_dmc.c
index a10e56e7cf31..1295d8245a2e 100644
--- a/drivers/gpu/drm/i915/display/intel_dmc.c
+++ b/drivers/gpu/drm/i915/display/intel_dmc.c
@@ -179,7 +179,8 @@ static const char *dmc_firmware_default(struct intel_display *display, u32 *size
 	const char *fw_path = NULL;
 	u32 max_fw_size = 0;
 
-	if (DISPLAY_VERx100(display) == 3000) {
+	if (DISPLAY_VERx100(display) == 3002 ||
+	    DISPLAY_VERx100(display) == 3000) {
 		fw_path = XE3LPD_DMC_PATH;
 		max_fw_size = XE2LPD_DMC_MAX_FW_SIZE;
 	} else if (DISPLAY_VERx100(display) == 2000) {
-- 
2.34.1


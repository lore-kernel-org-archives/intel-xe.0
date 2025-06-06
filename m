Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 126A7C61CE7
	for <intel-xe@archiver.kernel.org>; Fri,  6 Jun 2025 19:51:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D050810ECAA;
	Fri,  6 Jun 2025 19:51:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kGGfbEt+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC3A410ECAA
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Jun 2025 19:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749239476; x=1780775476;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KGh6phjj1s4flMDsoKDje4JnNX82BnMHmrtruAB3em8=;
 b=kGGfbEt+9sPtuz9mHICLIFn0bZ9PakPgEM2tGQ9qw+966Kcc+dHT9Chp
 VozU1+oG2f11MrdYjOVeYTSYCNJcrd0j6S7fVSOcHLxULA+dJYs4FOr/O
 0ed1NUSKlDlGTxLjcfBV6WdHesKtiVZHac9qbuKBVIXBKL4i2LiGlFnjJ
 XsRVXBX9+UvKnRGCwv+7BaCcBn0aGAM/0qOcke4fpS9i4ioCSlWzAeFU7
 hzVgQMYXjNfp/KEESOxqXw4x0emE51VnmjJEK9yWe+UZF6SgegbjxRu37
 70QwO9XibxiKujsJbakPrY/GPJfKFp4BwBxdZxLpA2EDgJi6XG1gHbn5K g==;
X-CSE-ConnectionGUID: oWPnv6jOQC6BKrZw44wSFw==
X-CSE-MsgGUID: lakOCr4RQ7WdmU9/I4bkAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="51277295"
X-IronPort-AV: E=Sophos;i="6.16,216,1744095600"; d="scan'208";a="51277295"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 12:51:16 -0700
X-CSE-ConnectionGUID: 00d26ASWT7mq6dkBUpcdtg==
X-CSE-MsgGUID: iWD0FGIdREKQmmJdZM8YmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,216,1744095600"; d="scan'208";a="145796068"
Received: from dbhadane-mobl1.iind.intel.com ([10.190.239.58])
 by fmviesa006.fm.intel.com with ESMTP; 06 Jun 2025 12:51:15 -0700
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Subject: [PATCH 7/9] drm/i915/xe3lpd: Extend DMC path for display version 30.02
Date: Sat,  7 Jun 2025 01:21:02 +0530
Message-Id: <20250606195104.1771715-8-dnyaneshwar.bhadane@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250606195104.1771715-1-dnyaneshwar.bhadane@intel.com>
References: <20250606195104.1771715-1-dnyaneshwar.bhadane@intel.com>
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
---
 drivers/gpu/drm/i915/display/intel_dmc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dmc.c b/drivers/gpu/drm/i915/display/intel_dmc.c
index a7ba17361d63..74c5aa89e8c7 100644
--- a/drivers/gpu/drm/i915/display/intel_dmc.c
+++ b/drivers/gpu/drm/i915/display/intel_dmc.c
@@ -178,7 +178,8 @@ static const char *dmc_firmware_default(struct intel_display *display, u32 *size
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


Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21B99CFC26B
	for <intel-xe@archiver.kernel.org>; Tue, 15 Oct 2024 06:12:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D857310E504;
	Tue, 15 Oct 2024 06:12:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SCOq5qSE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D23B10E502;
 Tue, 15 Oct 2024 06:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728972768; x=1760508768;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MU6P50+wEyljRGxYRUCkTx2hsGllQh48Wso/7mOK0o4=;
 b=SCOq5qSEafCnTg+0kXl60Q0doTXKLRePyR+Vpgjyu8Y+mB9RBIDi3/6P
 nzNJN1Z0s1OJ2UG8B95tujueDptuy80oUHnp1HwrbSXrmP8lDqdgUEaKe
 WIGCpDdC9/E2pdPinrDdnKK9D5VxI2f0x5n/a0piAuXdokFudyvZ01mU1
 8VxNrR6OG61om5CK1MWFDp6mXNsRqC/zXAOPBTONP9uMcux5E4YuZzaqQ
 g/ONai5eXwdC9LnRcflcP13qSLYpTEiH+6eTN6V6BQPVyKopIWG7tMbA5
 QEj23g6YvWabu6b7svzODYumFdqaYY5m0hAGflB0aM02GXYi5+ta4ugz6 Q==;
X-CSE-ConnectionGUID: ypkFdJ25SWWDCHFftrjVDg==
X-CSE-MsgGUID: +BNC2w/cQ9iPxIratFMyZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="28444825"
X-IronPort-AV: E=Sophos;i="6.11,204,1725346800"; d="scan'208";a="28444825"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2024 23:12:48 -0700
X-CSE-ConnectionGUID: Wo13KzDYQ9GdE9k6xHWr9Q==
X-CSE-MsgGUID: o71AJ/C/R8SgGp+mkSPafA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="82564162"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.32])
 by orviesa003.jf.intel.com with ESMTP; 14 Oct 2024 23:12:47 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: uma.shankar@intel.com, vandita.kulkarni@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 2/4] drm/i915/xe3lpd: Increase max_h max_v for PSR
Date: Tue, 15 Oct 2024 11:40:09 +0530
Message-ID: <20241015061011.2087826-3-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241015061011.2087826-1-suraj.kandpal@intel.com>
References: <20241015061011.2087826-1-suraj.kandpal@intel.com>
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

Spec states that PSR max active is same as max pipe active values.
Now that each pipe supports 6k resolution increasing max_h and
max_v for PSR too.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_psr.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index 3b20325b3f6a..8981a180285e 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -1451,7 +1451,11 @@ static bool intel_psr2_config_valid(struct intel_dp *intel_dp,
 		return false;
 	}
 
-	if (DISPLAY_VER(display) >= 12) {
+	if (DISPLAY_VER(dev_priv) >= 30) {
+		psr_max_h = 6144;
+		psr_max_v = 4096;
+		max_bpp = 30;
+	} else if (DISPLAY_VER(dev_priv) >= 12) {
 		psr_max_h = 5120;
 		psr_max_v = 3200;
 		max_bpp = 30;
-- 
2.47.0


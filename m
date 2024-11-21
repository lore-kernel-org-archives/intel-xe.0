Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DF22D6ED00
	for <intel-xe@archiver.kernel.org>; Thu, 21 Nov 2024 10:44:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44C6210E8EC;
	Thu, 21 Nov 2024 10:44:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hd0r0Se4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB4E910E8EC
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Nov 2024 10:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732185870; x=1763721870;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=uF8RF4Pr+v6EMW/4DTlqv7mq1bl770nd2JslFFarxeU=;
 b=hd0r0Se4E0VLYB0ret+Fyet6TdjNtyBOy3GerBkp8pEX7++7zty4QOYE
 VAX6r3GZFIlwwtvQJ5wpKXK/yVWFOiQoOmmN2DHByaqX/ajDQYqf1YR6O
 pJJX/X+5jLO33BcIRXmUyjg/UBfa+5Jcg4NE3m8MsJ/W2jL+qLS0bwCk4
 STDkkNoxnotTsIBygKV7soJgKNlRkDoR93F45GLgyPcz3Facws3urwy9/
 nHFlIoJWwFAD27XD8doC/WOPm39UsfNoFqXcGe3TYO/s+Ha+z12T3DiQI
 vhb3/JeVXRLapwgaUaXquJLfsy/2c7g2Rf1auCdXiBLjMRy8AKphnktl3 w==;
X-CSE-ConnectionGUID: iXW0If56T5GCP7AvP5pB+A==
X-CSE-MsgGUID: 9DPiWd2KSa2PmQyQQj7cBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11262"; a="19881303"
X-IronPort-AV: E=Sophos;i="6.12,172,1728975600"; d="scan'208";a="19881303"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 02:44:29 -0800
X-CSE-ConnectionGUID: szTBr8NbTSWJgqoaNc6RdQ==
X-CSE-MsgGUID: XugeO7FIRxedUTvBFks4hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,172,1728975600"; d="scan'208";a="90630830"
Received: from unknown (HELO hazy.intel.com) ([10.245.245.120])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 02:44:28 -0800
From: Luca Coelho <luciano.coelho@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jani.saarinen@intel.com
Subject: [RFT] test: check if increasing dmc wakelock timeout helps
Date: Thu, 21 Nov 2024 12:44:04 +0200
Message-ID: <20241121104416.883314-1-luciano.coelho@intel.com>
X-Mailer: git-send-email 2.45.2
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

Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dmc_wl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dmc_wl.c b/drivers/gpu/drm/i915/display/intel_dmc_wl.c
index 853d75610489..1d42efc397a3 100644
--- a/drivers/gpu/drm/i915/display/intel_dmc_wl.c
+++ b/drivers/gpu/drm/i915/display/intel_dmc_wl.c
@@ -46,7 +46,7 @@
  * Define DMC_WAKELOCK_CTL_TIMEOUT_US in microseconds because we use the
  * atomic variant of waiting MMIO.
  */
-#define DMC_WAKELOCK_CTL_TIMEOUT_US 5000
+#define DMC_WAKELOCK_CTL_TIMEOUT_US 20000
 #define DMC_WAKELOCK_HOLD_TIME 50
 
 struct intel_dmc_wl_range {
-- 
2.45.2


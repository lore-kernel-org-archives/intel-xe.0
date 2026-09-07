Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CABC8C79F9F
	for <intel-xe@archiver.kernel.org>; Mon,  7 Sep 2026 10:37:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A68410E785;
	Mon,  7 Sep 2026 10:37:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b8g28VoN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3273E10E769;
 Mon,  7 Sep 2026 10:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788777469; x=1820313469;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oIode64aAH9uXrRdUaR98hGcK4lthZ5GdHLtuAoQq5k=;
 b=b8g28VoN/vM7dsDx8TWzNI8poqCCFmmFL9v7uqSBI4oOonxI75q9lCNg
 Br9JSfNVwRFr0QLp3miZ/Hf83Dnoz481/N+9e70I7WzV2Z6p9yeaCSYbD
 spx8IaYr02BJkQjtqN8hEtcaWANDzST6opemq0jan+3THaCDF031neHle
 S5EqaVwA1+UM89X6YgiO+xm2xVL8LHO+fpCQg+3udC/A80Jfo9Usd5cNT
 4taUM6EYBcQJWBKR18F5m+7WRI3tUkhknNKcvwMJprcv27P+bkpgqBxKD
 g2dxhi28MfvPMdJa4JLh6/7E/NUk6BtjFgpqV0JE21KZolOel8VFjrRmk A==;
X-CSE-ConnectionGUID: kK6pvmi1Sf6pyi4jkdcQ0w==
X-CSE-MsgGUID: ruDf0ZsPTeWpRlyHPJl9uQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="111955877"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="111955877"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 03:37:49 -0700
X-CSE-ConnectionGUID: u8F8ZUy2QeqkQpp96mydWg==
X-CSE-MsgGUID: Utctnd39S9Kw0YeuuGGCPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="274827596"
Received: from dibin-nuc7i7bnh.iind.intel.com ([10.190.239.19])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 03:37:48 -0700
From: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: mitulkumar.ajitkumar.golani@intel.com,
	jani.nikula@intel.com
Subject: [PATCH v2 2/2] drm/i915/dmc: Prevent fw_size multiplication overflow
Date: Mon,  7 Sep 2026 16:07:34 +0530
Message-ID: <20260907103731.1379922-6-dibin.moolakadan.subrahmanian@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260907103731.1379922-4-dibin.moolakadan.subrahmanian@intel.com>
References: <20260907103731.1379922-4-dibin.moolakadan.subrahmanian@intel.com>
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

Validate the conversion of the DMC firmware size from dwords to bytes
using check_mul_overflow() before calculating the firmware payload size.

Fixes: eb805623d8b1 ("drm/i915/skl: Add support to load SKL CSR firmware.")
Cc: stable@vger.kernel.org
Assisted-by: Claude-Code:Sonnet-5
Signed-off-by: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dmc.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dmc.c b/drivers/gpu/drm/i915/display/intel_dmc.c
index 051b721a0895..228a1b296733 100644
--- a/drivers/gpu/drm/i915/display/intel_dmc.c
+++ b/drivers/gpu/drm/i915/display/intel_dmc.c
@@ -1178,7 +1178,12 @@ static u32 parse_dmc_fw_header(struct intel_dmc *dmc,
 	rem_size -= header_len_bytes;
 
 	/* fw_size is in dwords, so multiplied by 4 to convert into bytes. */
-	payload_size = dmc_header->fw_size * 4;
+	if (check_mul_overflow(dmc_header->fw_size, 4u, &payload_size)) {
+		drm_err(display->drm, "DMC fw_size too large (%u dwords)\n",
+			dmc_header->fw_size);
+		return 0;
+	}
+
 	if (rem_size < payload_size)
 		goto error_truncated;
 
-- 
2.43.0


Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E81D5C79FA0
	for <intel-xe@archiver.kernel.org>; Mon,  7 Sep 2026 13:51:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91D5610E84A;
	Mon,  7 Sep 2026 13:51:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NVSmaoOz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 868C910E846;
 Mon,  7 Sep 2026 13:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788789063; x=1820325063;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=b/xd4ZnqX/7cdNqjx9nS0BZpu3cbssS4n+UbpIqmkMk=;
 b=NVSmaoOz9OQ2EE1sBYNHc+jLWdwR2MJNewPlRd9WOSiWUa0V/a2qP+As
 LO5za63JRL+4pbFkzrDxqxtD1SNuK6Kt+O63pWQMA30xFGqlbflrWF6M6
 26CXu3HHQQKHptWq2l6XZACiUuX42/G5xMk0Z6ky0w6fSJ9X6TyceQyXi
 5+FCLVYd/cRReAkhZKKjUVxHInEwaixJyYfmTD1TscpJrRxNao16UbI6J
 VS8Q8f0LMKi+/Lj0yU7LoHhb1splR5+sbynE3CYRTdox3OcSElL8a1Gv3
 /AWDBgf/ZsejQBR7B1AqRjoPUX1L/vYLx2GNcQKKNIy8M+1DehNqaLA23 Q==;
X-CSE-ConnectionGUID: j51qIptFRS6iYuzvq/MDYA==
X-CSE-MsgGUID: XeT7Re+kSWusGv1lh4OG4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="114735038"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="114735038"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 06:51:02 -0700
X-CSE-ConnectionGUID: E8DE3BQ5TmyBaP1cRPlyHA==
X-CSE-MsgGUID: HtsPznqMQTqzHrIrXWqUoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="268993715"
Received: from dibin-nuc7i7bnh.iind.intel.com ([10.190.239.19])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 06:51:01 -0700
From: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: mitulkumar.ajitkumar.golani@intel.com,
	jani.nikula@intel.com
Subject: [PATCH v3 2/2] drm/i915/dmc: Harden DMC firmware payload parsing
Date: Mon,  7 Sep 2026 19:20:51 +0530
Message-ID: <20260907135048.1403587-6-dibin.moolakadan.subrahmanian@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260907135048.1403587-4-dibin.moolakadan.subrahmanian@intel.com>
References: <20260907135048.1403587-4-dibin.moolakadan.subrahmanian@intel.com>
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

Reject zero-length payloads and zero MMIO counts in the DMC firmware
header so malformed firmware is caught early. Also set dmc_fw_size only
after the payload allocation succeeds.

Fixes: eb805623d8b1 ("drm/i915/skl: Add support to load SKL CSR firmware.")
Cc: stable@vger.kernel.org
Assisted-by: Claude-Code:Sonnet-5
Signed-off-by: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dmc.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dmc.c b/drivers/gpu/drm/i915/display/intel_dmc.c
index 051b721a0895..b06143a607eb 100644
--- a/drivers/gpu/drm/i915/display/intel_dmc.c
+++ b/drivers/gpu/drm/i915/display/intel_dmc.c
@@ -1170,7 +1170,7 @@ static u32 parse_dmc_fw_header(struct intel_dmc *dmc,
 	}
 
 	/* Cache the dmc header info. */
-	if (mmio_count > mmio_count_max) {
+	if (!mmio_count || mmio_count > mmio_count_max) {
 		drm_err(display->drm, "DMC firmware has wrong mmio count %u\n", mmio_count);
 		return 0;
 	}
@@ -1178,7 +1178,17 @@ static u32 parse_dmc_fw_header(struct intel_dmc *dmc,
 	rem_size -= header_len_bytes;
 
 	/* fw_size is in dwords, so multiplied by 4 to convert into bytes. */
-	payload_size = dmc_header->fw_size * 4;
+	if (check_mul_overflow(dmc_header->fw_size, 4u, &payload_size)) {
+		drm_err(display->drm, "DMC fw_size too large (%u dwords)\n",
+			dmc_header->fw_size);
+		return 0;
+	}
+
+	if (!payload_size) {
+		drm_err(display->drm, "DMC firmware has empty payload\n");
+		return 0;
+	}
+
 	if (rem_size < payload_size)
 		goto error_truncated;
 
@@ -1237,12 +1247,12 @@ static u32 parse_dmc_fw_header(struct intel_dmc *dmc,
 	dmc_info->mmio_count = mmio_count;
 	dmc_info->start_mmioaddr = start_mmioaddr;
 
-	dmc_info->dmc_fw_size = dmc_header->fw_size;
-
 	dmc_info->payload = kmalloc(payload_size, GFP_KERNEL);
 	if (!dmc_info->payload)
 		return 0;
 
+	dmc_info->dmc_fw_size = dmc_header->fw_size;
+
 	payload = (u8 *)(dmc_header) + header_len_bytes;
 	memcpy(dmc_info->payload, payload, payload_size);
 
-- 
2.43.0


Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71A49C44501
	for <intel-xe@archiver.kernel.org>; Tue, 14 Jul 2026 12:13:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3169C10E6BA;
	Tue, 14 Jul 2026 12:13:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hPUaUIEN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ED3D10E6B6;
 Tue, 14 Jul 2026 12:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784031224; x=1815567224;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/vIgbpnxajrzvZo0rc2AFP+jFZqvG1KJUzppbAk8t0k=;
 b=hPUaUIENccECgVAemJIHpBtR7XE0bmnQShYmyohvE5ZmuMtkLfDj6ZNj
 iVlYhCyNR8pBJsQS3Xqpiqd/hKvS753YKhfRt2ZJfFIsTSudQVr5qePzd
 lASo3xNp2ybQnxWjJoKjARL0ZjcNRuH86wKO91a9yxI7d27A8xCcYlENo
 BHGRE+JJj5X6OktJ/c/HiJ3CPT2UkPBClBWo0I2HcSVi2i9lM5MFHq4pd
 6PKMFgvVZTO2EBm5cvyfjoZvx+1XHfjh5CSAWXMow66JLg4Jbp97TWlHt
 fUqgwgSQL2mHUM5gxVd04zadHBMJ9ngRFSiI2UC492Dw9UiJKKpkuzOzu A==;
X-CSE-ConnectionGUID: YOaZf9vURQKx5qwNfMZ0bQ==
X-CSE-MsgGUID: gu21sX0jSWCPHukB3+lGig==
X-IronPort-AV: E=McAfee;i="6800,10657,11846"; a="88472474"
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; d="scan'208";a="88472474"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2026 05:13:44 -0700
X-CSE-ConnectionGUID: b2V4CUHURp62h+Uo3o4/Ig==
X-CSE-MsgGUID: ZwJa5VrGSY6Lzrwknp1gGQ==
X-ExtLoop1: 1
Received: from dibin-nuc7i7bnh.iind.intel.com ([10.190.239.19])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2026 05:13:42 -0700
From: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: uma.shankar@intel.com,
	jani.nikula@linux.intel.com
Subject: [PATCH 2/2] drm/i915/dmc: Prevent fw_size multiplication overflow
Date: Tue, 14 Jul 2026 17:41:46 +0530
Message-ID: <20260714121146.1415532-3-dibin.moolakadan.subrahmanian@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260714121146.1415532-1-dibin.moolakadan.subrahmanian@intel.com>
References: <20260714121146.1415532-1-dibin.moolakadan.subrahmanian@intel.com>
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

Assisted-by: Claude-Code:Sonnet-5
Signed-off-by: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dmc.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dmc.c b/drivers/gpu/drm/i915/display/intel_dmc.c
index d1a69eab7e64..2180d4b7d7ec 100644
--- a/drivers/gpu/drm/i915/display/intel_dmc.c
+++ b/drivers/gpu/drm/i915/display/intel_dmc.c
@@ -1176,7 +1176,12 @@ static u32 parse_dmc_fw_header(struct intel_dmc *dmc,
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


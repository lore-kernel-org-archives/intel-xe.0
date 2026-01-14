Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E373D30CF5
	for <intel-xe@archiver.kernel.org>; Wed, 14 Jan 2026 00:04:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E41010E56E;
	Wed, 14 Jan 2026 00:04:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GY8zdRxB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 141BD10E37F
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Jan 2026 00:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768349075; x=1799885075;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vh/5IolTtmdKgvf7gS2e+mKAN7etcooFPMW4nyZg/2w=;
 b=GY8zdRxBLkH1r5Ta2/v5juws8NmF8dxGAxE0/zJCKckOD4pn3sSUWTv4
 XsXCEYaLywDhTFVNCoi6ltL+mqMN2kkprhjmhMXxT/W1HmljYrYQR1n4L
 9a83XwM1/L/vcqijFQ2Uj239YJf/ZXv3b8xy2j6pVyLFfLg7wJZlCYts7
 xfrhxOL0Dcjpk5GAIYcxRurzymWb872/7ZgyZy0Es7x7Q+tS8r7M6pAui
 ZeRp1RqYjr+I8JdyblpW7hO3RJ8f6YcV2Wp9LPcTlHmMrXLrPuvr7phy6
 c7p+uufOjd8fS4NcnrJys9l7zZ5uPxg+0Mx9FiRLmk++wZrpO/YkOcsj1 w==;
X-CSE-ConnectionGUID: 1xe9rlpXT/ynfHE1vOPwGg==
X-CSE-MsgGUID: LH365nZcQduvLo0qaF/zsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="81010597"
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="81010597"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 16:04:34 -0800
X-CSE-ConnectionGUID: WJvFlEGIQnCMVKilQ6S0Cg==
X-CSE-MsgGUID: zN51gFeRR0ecEJ7am4bLuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="203740098"
Received: from dut4344arlh.fm.intel.com ([10.105.10.86])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 16:04:34 -0800
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: matthew.brost@intel.com, intel-xe@lists.freedesktop.org,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 2/2] drm/xe: Enable ring based TLB invalidation for CI
Date: Wed, 14 Jan 2026 00:04:21 +0000
Message-Id: <20260114000421.331082-3-stuart.summers@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260114000421.331082-1-stuart.summers@intel.com>
References: <20260114000421.331082-1-stuart.summers@intel.com>
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

Do not review - for CI only.

Signed-off-by: Stuart Summers <stuart.summers@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index a2ce9da2e3cb..712ac1995c58 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -96,6 +96,7 @@ static const struct xe_graphics_desc graphics_xelpg = {
 	.has_asid = 1, \
 	.has_atomic_enable_pte_bit = 1, \
 	.has_range_tlb_inval = 1, \
+	.has_ring_tlb_inval = 1, \
 	.has_usm = 1, \
 	.has_64bit_timestamp = 1, \
 	.hw_engine_mask = \
-- 
2.34.1


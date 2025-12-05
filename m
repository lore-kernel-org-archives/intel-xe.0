Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA951D374A8
	for <intel-xe@archiver.kernel.org>; Fri,  5 Dec 2025 21:26:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A74E210EBBD;
	Fri,  5 Dec 2025 21:26:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AAS4/gAe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B99610EBBA
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Dec 2025 21:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764969981; x=1796505981;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=seiT2IP5eWoqvsa3xh874Y9NMPf6cmrJlU7pbU1OOgI=;
 b=AAS4/gAerhUg7V0Y67ujTJVoPXwDDnGlmWty1z7qpebcYKnxlb+QLWn2
 oPBa6rsel1hGcFGLQYL6ypo4soEpv4EPNgeMAM8aEukOzJOCTyZ7CkK6T
 z1TUlCfPXMWtQi7VMbRFOhNQnqwH/M0J2N+l0LXtqoJ3x8h2H8Y33aiiR
 NAM8Zp+n+IaG2dosTVrmWX7L+8gwN3TkYOhYIqOvf1QYfTXDWRZy8wiXj
 E+zJ7n5NJHN1igazSP/SbLw00gaZtJ8gkA90JFqU6LvCL3ne913tOCBXx
 h/AUh9WIhTz7pQA9lfiqqfmrLubsNDMJjT1m8pnfy0EvJUy1CrxiasCEC g==;
X-CSE-ConnectionGUID: 1L4SR/t1TR+J/bYzfyn/Bg==
X-CSE-MsgGUID: zy6KaYm9RPmDPfhibOHrWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="66893795"
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; d="scan'208";a="66893795"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 13:26:20 -0800
X-CSE-ConnectionGUID: 7MTY+GF+TqurLL1nXX+jWg==
X-CSE-MsgGUID: kvG147nvTW67q2qjqFXK2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; d="scan'208";a="195202143"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 13:26:20 -0800
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH 3/3] drm/xe/oa: Always set OAG_OAGLBCTXCTRL_COUNTER_RESUME
Date: Fri,  5 Dec 2025 13:26:13 -0800
Message-ID: <20251205212613.826224-4-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251205212613.826224-1-ashutosh.dixit@intel.com>
References: <20251205212613.826224-1-ashutosh.dixit@intel.com>
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

Reports can be written out to the OA buffer using ways other than periodic
sampling. These include mmio trigger and context switches. To support these
use cases, when periodic sampling is not enabled,
OAG_OAGLBCTXCTRL_COUNTER_RESUME must be set.

Fixes: 1db9a9dc90ae ("drm/xe/oa: OA stream initialization (OAG)")
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 7846dbc32542e..44140722febef 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -1105,11 +1105,12 @@ static int xe_oa_enable_metric_set(struct xe_oa_stream *stream)
 			oag_buf_size_select(stream) |
 			oag_configure_mmio_trigger(stream, true));
 
-	xe_mmio_write32(mmio, __oa_regs(stream)->oa_ctx_ctrl, stream->periodic ?
-			(OAG_OAGLBCTXCTRL_COUNTER_RESUME |
+	xe_mmio_write32(mmio, __oa_regs(stream)->oa_ctx_ctrl,
+			OAG_OAGLBCTXCTRL_COUNTER_RESUME |
+			(stream->periodic ?
 			 OAG_OAGLBCTXCTRL_TIMER_ENABLE |
 			 REG_FIELD_PREP(OAG_OAGLBCTXCTRL_TIMER_PERIOD_MASK,
-					stream->period_exponent)) : 0);
+					 stream->period_exponent) : 0));
 
 	/*
 	 * Initialize Super Queue Internal Cnt Register
-- 
2.48.1


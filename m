Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A465EC61CE8
	for <intel-xe@archiver.kernel.org>; Mon,  2 Jun 2025 23:46:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6190B10E597;
	Mon,  2 Jun 2025 23:46:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VV6IjK6o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE64810E186
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Jun 2025 23:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748908010; x=1780444010;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=io1mfO/YIAv6cLUZ91xiEAiSnfNP6WlwTDirVXqMeIk=;
 b=VV6IjK6oPXggkdmqVoeQQHI8ZqFxv6kBW5Djr/3iJf7gsc1acF8ODqXx
 yU60G6WOl6Y/ONO47Ooj8bL2BJRUPUIZ6+i8d56EkjIq6Zw+mg7IVvsw2
 CErK6Y4OQQYNGn8kiKtujt95fFDyCF6t8VURkoQkneupk2OzrAvdZIV0R
 bxDnOjDT+8Iqu/U4DjFYmSFmBSGE6Slpt+DG3fHdaFkLHOKKLJnfeBpZR
 2ex71MnL4NHMgqjsL2YARrzT6qk30VQUz4DL7b4U6cqeyRxZ8JDOh51+b
 Bs3pkqbZSTm42Y/mroxm8EQ1hlXZhcJx5IWHP6GGcbbhzdSA4nPRH4bmI Q==;
X-CSE-ConnectionGUID: Tp2sfPSNQk+EbYVjCqeZPg==
X-CSE-MsgGUID: 576I8C06TWyMdSbGcNVtSg==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="68361179"
X-IronPort-AV: E=Sophos;i="6.16,204,1744095600"; d="scan'208";a="68361179"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2025 16:46:49 -0700
X-CSE-ConnectionGUID: 0j+/DqN2SMSFd5rsnwbdZg==
X-CSE-MsgGUID: 9H5ueuAkRdi/sMc9c9oekA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,204,1744095600"; d="scan'208";a="167846137"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.39.141])
 by fmviesa002.fm.intel.com with ESMTP; 02 Jun 2025 16:46:10 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v3 1/4] drm/xe/bmg: Update Wa_14022085890
Date: Mon,  2 Jun 2025 16:44:12 -0700
Message-Id: <20250602234415.2015921-2-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20250602234415.2015921-1-vinay.belgaumkar@intel.com>
References: <20250602234415.2015921-1-vinay.belgaumkar@intel.com>
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

Set GT min frequency to 1200Mhz once driver load is
complete.

v2: Review comments (Rodrigo)
v3: Apply Wa earlier so user_req_min is not clobbered.

Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_pc.c     | 5 +++++
 drivers/gpu/drm/xe/xe_wa_oob.rules | 1 +
 2 files changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 18c623992035..cb0563494fcc 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -51,6 +51,7 @@
 
 #define LNL_MERT_FREQ_CAP	800
 #define BMG_MERT_FREQ_CAP	2133
+#define BMG_MIN_FREQ		1200
 
 #define SLPC_RESET_TIMEOUT_MS 5 /* roughly 5ms, but no need for precision */
 #define SLPC_RESET_EXTENDED_TIMEOUT_MS 1000 /* To be used only at pc_start */
@@ -843,6 +844,9 @@ static int pc_adjust_freq_bounds(struct xe_guc_pc *pc)
 	if (pc_get_min_freq(pc) > pc->rp0_freq)
 		ret = pc_set_min_freq(pc, pc->rp0_freq);
 
+	if (XE_WA(pc_to_gt(pc), 14022085890))
+		ret = pc_set_min_freq(pc, max(BMG_MIN_FREQ, pc_get_min_freq(pc)));
+
 out:
 	return ret;
 }
@@ -879,6 +883,7 @@ static int pc_set_mert_freq_cap(struct xe_guc_pc *pc)
 		ret = xe_guc_pc_get_min_freq(pc, &pc->stashed_min_freq);
 		if (!ret)
 			ret = xe_guc_pc_get_max_freq(pc, &pc->stashed_max_freq);
+
 		if (ret)
 			return ret;
 
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index 9efc5accd43d..75fbdab68d44 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -59,3 +59,4 @@ no_media_l3	MEDIA_VERSION(3000)
 		MEDIA_VERSION_RANGE(1301, 3000)
 16026508708	GRAPHICS_VERSION_RANGE(1200, 3001)
 		MEDIA_VERSION_RANGE(1300, 3000)
+14022085890	GRAPHICS_VERSION(2001)
-- 
2.38.1


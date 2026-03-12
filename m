Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A34AFED2EA
	for <intel-xe@archiver.kernel.org>; Thu, 12 Mar 2026 08:07:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E3B810E99D;
	Thu, 12 Mar 2026 08:07:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Aj3cT1eJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B1E110E993;
 Thu, 12 Mar 2026 08:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773302821; x=1804838821;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ib3RS+wGCUmYr1i74CT5KQMZnex4G32BmgW4XToyKwQ=;
 b=Aj3cT1eJ5+weGrvVviCMVBGWfRyBV2kPRVS27u5p/yNLwpFccjXzzPuM
 cbKTfKkpcsW8NKoOqyzXs3GcDkkuQu8I6qhvFpQ2ai3bzYebAXpjfW1BP
 5StVCYn5sFYnM0qD89LjLnj1RivGc3G+SuwrcfKBSM6hUtDTVuLYdeLJs
 MnKRdGcXBjZCfaBXOB17yAVrKmKULfUHyAypT2Cs6/TGIjGlwvyE/9SL9
 BUp9N+Iu5PHrQlVWaV4w5tjgbwziYWwwFEbgKQWI7rWZtjjsCx+ZQEzUk
 kw3CrNvc931zTpfsfRxmWvPo+D90mcgx3UozfkXMirqrkiYIl3JPIE5YG w==;
X-CSE-ConnectionGUID: bs+Gl+73Q2mXDu9ns32C7g==
X-CSE-MsgGUID: 14Qwl3LeRgKqwyyJKZwDJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="85013714"
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; d="scan'208";a="85013714"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 01:07:01 -0700
X-CSE-ConnectionGUID: 5v6Jj6jcS7SOOWArHC7Ikw==
X-CSE-MsgGUID: 48YZYlQHTnSlVc1I1LQ/3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; d="scan'208";a="223206773"
Received: from display-adls.igk.intel.com ([10.211.131.198])
 by fmviesa004.fm.intel.com with ESMTP; 12 Mar 2026 01:07:00 -0700
From: Mika Kahola <mika.kahola@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Mika Kahola <mika.kahola@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [CI v3 01/24] drm/i915/lt_phy: Dump missing PLL state parameters
Date: Thu, 12 Mar 2026 08:06:34 +0000
Message-ID: <20260312080657.2648265-2-mika.kahola@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260312080657.2648265-1-mika.kahola@intel.com>
References: <20260312080657.2648265-1-mika.kahola@intel.com>
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

Dump missing PLL structure members ssc_enabled and tbt_mode
in order to enhance debugging.

v2: Drop addr_lsb and addr_msb printouts

Signed-off-by: Mika Kahola <mika.kahola@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_lt_phy.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_lt_phy.c b/drivers/gpu/drm/i915/display/intel_lt_phy.c
index eced8493e566..f768804122c1 100644
--- a/drivers/gpu/drm/i915/display/intel_lt_phy.c
+++ b/drivers/gpu/drm/i915/display/intel_lt_phy.c
@@ -2141,7 +2141,9 @@ void intel_lt_phy_dump_hw_state(struct intel_display *display,
 {
 	int i, j;
 
-	drm_dbg_kms(display->drm, "lt_phy_pll_hw_state:\n");
+	drm_dbg_kms(display->drm, "lt_phy_pll_hw_state: ssc enabled: %d, tbt mode: %d\n",
+		    hw_state->ssc_enabled, hw_state->tbt_mode);
+
 	for (i = 0; i < 3; i++) {
 		drm_dbg_kms(display->drm, "config[%d] = 0x%.4x,\n",
 			    i, hw_state->config[i]);
-- 
2.43.0


Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2729CD4851
	for <intel-xe@archiver.kernel.org>; Fri, 15 May 2026 07:50:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8408910F44C;
	Fri, 15 May 2026 07:50:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KPcJXt0l";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3189910F44C;
 Fri, 15 May 2026 07:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778831448; x=1810367448;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/diA7HZc8Jg/ZudJPSG9JyfdwS04MMQN7aFFi5ye1VU=;
 b=KPcJXt0lcc9nptTMnbJ7NsC48zNloQADvHIPyfg4Oq7iVgm7psrnE6Bo
 CEKkWR/HLFuMBfMmzBahBrkDjjrf+sUPRwFyCdAo6FDIHqQtcGz1ePlHX
 4UxFBp4AGx4QflHP8UfRU8NzKsPGY/3hKySq86zTtvm9LPaEIh2SUc6Au
 l5ZRkcPkjNhcCZIk5JPj1oBW2exAViKhZXaHBPiHtB/0GqGHAP43rsplw
 pAX1KTQORR37zs9OomtF6gYllsoJ4pNR8/IHmGQigUnIS55DoQzYaH+MG
 KSfeVxx0K2IAi3VizYrZ20Sxdb+E9HI7QklSIGTXJDNOPAmr9yxAdsF6H w==;
X-CSE-ConnectionGUID: n/+o4ZCfQsW7h6VVwY7emQ==
X-CSE-MsgGUID: 3/E+SaksR6aUGur4K0GZkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="90480657"
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; d="scan'208";a="90480657"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2026 00:50:48 -0700
X-CSE-ConnectionGUID: qkyE2V4lTj+0RgoeIMy8uw==
X-CSE-MsgGUID: iHpxeeYgSaiCjlPz1Ajlfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; d="scan'208";a="243604221"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2026 00:50:46 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jouni.hogander@intel.com,
	Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 2/2] drm/i915/psr: Allow SCL=0 on platforms with always-on VRR
 TG
Date: Fri, 15 May 2026 13:06:16 +0530
Message-ID: <20260515073616.2794146-3-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260515073616.2794146-1-ankit.k.nautiyal@intel.com>
References: <20260515073616.2794146-1-ankit.k.nautiyal@intel.com>
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

For Legacy timing generator, if there are no panel replay/sel_update or other
SRD constraints, the Set context latency (SCL) window should be at least 1.

However, for VRR timing generator the SCL window can be 0. It has other
guardband constraints, but that are checked during guardband computation.

Allow SCL to be 0 for platforms that have VRR TG always on.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_psr.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index 5bf1d782188c..12c2e2a70bd8 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -1477,7 +1477,8 @@ int _intel_psr_min_set_context_latency(const struct intel_crtc_state *crtc_state
 	 * SRD_STATUS is used by PSR1 and Panel Replay DP on LunarLake.
 	 */
 
-	if (needs_sel_update ||
+	if (intel_vrr_always_use_vrr_tg(display) ||
+	    needs_sel_update ||
 	    (DISPLAY_VER(display) >= 30 && needs_panel_replay) ||
 	    (DISPLAY_VER(display) < 30 && intel_crtc_has_type(crtc_state, INTEL_OUTPUT_EDP)))
 		return 0;
-- 
2.45.2


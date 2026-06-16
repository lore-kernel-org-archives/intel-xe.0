Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA219CD98ED
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jun 2026 12:46:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 839EF10EB54;
	Tue, 16 Jun 2026 12:46:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G3gZjoaR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06E8210EB48;
 Tue, 16 Jun 2026 12:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781613966; x=1813149966;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=GOSNPFtaLq1mOnC+ik8000yE9/DY6eCVABnKgT/ReAM=;
 b=G3gZjoaRqEmCHhYCZqTORZjoydGF4togIELq+nA+qMkMp1HjyyjNA4RM
 ln5hap/mS9zWv8Hg0QbLiABo97nX1as6q4KFTrX7c2GFCI8SA/NRrDicC
 BgqKV5k2mG9UGOkNeAThQ6m6GMonV/UGTAjpOQNp2h4FrX5S+0pnotK5E
 eVqv2fhRQ4n2Zu2oQ5un8yeJIlSnavWCpiz1wvZOpsNmdsXp05SW3sdXv
 zZjVD6MQ4pvGxgio1pVCG5Y6v6l7f+Bw5neTUlTUENEgUGJQXsh0EVKel
 hlLIbDur9ekjCj2wS2WgydccTpVh9EsrTTuqEXmpIqyAw9uUSgDbhnOqP w==;
X-CSE-ConnectionGUID: tbQtEETFS0mvWkaN7/nUQA==
X-CSE-MsgGUID: PBr+ZQZoTrOV0gx3pGDXIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="81513297"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="81513297"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 05:46:06 -0700
X-CSE-ConnectionGUID: u7pCfN1fSNa9qg7VIqw2Cg==
X-CSE-MsgGUID: Odi2zPyyRla0euawaZjHog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="244876412"
Received: from dibin-nuc7i7bnh.iind.intel.com ([10.190.239.19])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 05:46:05 -0700
From: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [CI v4 38/39] drm/i915/display: Enable DC3CO DC state
Date: Tue, 16 Jun 2026 18:14:14 +0530
Message-ID: <20260616124416.2442161-39-dibin.moolakadan.subrahmanian@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260616124416.2442161-1-dibin.moolakadan.subrahmanian@intel.com>
References: <20260616124416.2442161-1-dibin.moolakadan.subrahmanian@intel.com>
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

Enable DC3CO mask in get_allowed_dc_mask().

Signed-off-by: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_power.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_power.c b/drivers/gpu/drm/i915/display/intel_display_power.c
index 2ee38ba1fb2c..dc3b31200353 100644
--- a/drivers/gpu/drm/i915/display/intel_display_power.c
+++ b/drivers/gpu/drm/i915/display/intel_display_power.c
@@ -1121,7 +1121,9 @@ static u32 get_allowed_dc_mask(struct intel_display *display, int enable_dc)
 	if (!HAS_DISPLAY(display))
 		return 0;
 
-	if (DISPLAY_VER(display) >= 20)
+	if (DISPLAY_VER(display) >= 35)
+		max_dc = 4;
+	else if (DISPLAY_VER(display) >= 20)
 		max_dc = 2;
 	else if (display->platform.dg2)
 		max_dc = 1;
-- 
2.43.0


Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4BFBC2BD09
	for <intel-xe@archiver.kernel.org>; Mon,  1 Jul 2024 15:52:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86A3E10E474;
	Mon,  1 Jul 2024 15:52:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d33tCWrT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0691310E474
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Jul 2024 15:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719849128; x=1751385128;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HZ+zWYkgTpNzTvjFS3nHZDOgcMqJCcnDEhcCljU0MFg=;
 b=d33tCWrTEjYasC5zFUvzMSPL+QHZTNNuYubJlf5QvIZdr/Q/E1UswAFd
 hU5E/BUVQlQwRG3IQXf5DjTVLz6Vk9fCVBHEbRGGDqyYOBna/7RKYdk9p
 15X+Acv/lqPPO1Uc/sdko+ZhH185Y4C7ux/QGldR2XHatKkLNl61eNqKT
 eFiT5cH5eMHtSNhvRvuFeRfs0eUUIVNsITFNf+DQSDo22c1U5nHCoOXXr
 7V27/yC5bXRXG1xr/pYm88qeeLVQsjCG2YQuTluZQwDtYvEL3mgbAEbEw
 8khTdItrz64Jr48lG7LbrIN6phJ67istIHLJ4vp3I7IpThaz1geu+iz7a Q==;
X-CSE-ConnectionGUID: Bmd45tMxRn+avL5/XsGujQ==
X-CSE-MsgGUID: Ym3LdVFsRymJDqcPLZ5+fg==
X-IronPort-AV: E=McAfee;i="6700,10204,11120"; a="17113590"
X-IronPort-AV: E=Sophos;i="6.09,176,1716274800"; d="scan'208";a="17113590"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2024 08:52:08 -0700
X-CSE-ConnectionGUID: G1xSh2agQ5KWHlJlrtA1Nw==
X-CSE-MsgGUID: 928JwSkhSPyuvBOsZAQ5Vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,176,1716274800"; d="scan'208";a="50018854"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2024 08:52:07 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH] drm/xe: Fix global-out-of-bounds in rule_matches
Date: Mon,  1 Jul 2024 17:37:02 +0200
Message-ID: <20240701153702.21824-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany, Commercial Register: Amtsgericht Muenchen HRB 186928
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

Do post-increment instead of pre-increment to fix:
[ 9344.404516] BUG: KASAN: global-out-of-bounds in rule_matches+0xb72/0x11c0 [xe]
[ 9344.411887] Read of size 1 at addr ffffffffa330b210 by task xe_module_load/248463

Fixes: dc72c52a42e0 ("drm/xe/rtp: Allow to OR rules")
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/xe_rtp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
index 5b27f7c45ea3..f6ec8df5fc94 100644
--- a/drivers/gpu/drm/xe/xe_rtp.c
+++ b/drivers/gpu/drm/xe/xe_rtp.c
@@ -121,7 +121,7 @@ static bool rule_matches(const struct xe_device *xe,
 			 * Advance rules until we find XE_RTP_MATCH_OR to check
 			 * if there's another set of conditions to check
 			 */
-			while (i < n_rules && rules[++i].match_type != XE_RTP_MATCH_OR)
+			while (i < n_rules && rules[i++].match_type != XE_RTP_MATCH_OR)
 				;
 
 			if (i >= n_rules)
-- 
2.42.0


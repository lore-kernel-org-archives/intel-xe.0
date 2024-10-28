Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDEA7D3E2C0
	for <intel-xe@archiver.kernel.org>; Mon, 28 Oct 2024 19:30:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 383DB10E53E;
	Mon, 28 Oct 2024 19:30:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gjLDRRDO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E2D510E536;
 Mon, 28 Oct 2024 19:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730143822; x=1761679822;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=43DqmJgU+m9sfObrfw+M8LExqh73gr26cjVASPwlEsw=;
 b=gjLDRRDO35DOe8orJtAKhjuCXVh02QhbHgm+36NMjLImkAaVjVkta6jT
 8ukO2FsNBgASS90gVxxS/yOtzYUJY1P0RBSF9gX1UYlcifc2TTMK69mC6
 XgPpLWGEpiCX3zWXyIRdi612to6KCLN0/kJZZiFA5Q7Hk7kUXWN+tZ1Yr
 qIIT7LS3thlYWst2h7GW0Dg5yk+8IiZCYujETD+BeT4OMKnhE06L5jNSp
 KFfD8E7QIiaE8kpKoPWm++nnox2Or3DH4CTNHdZkFLvsPYHaHUZ8Q+AD+
 u7v3eWCKQOxXh2WxC9PhygYlOuiGSK3Bh4NEvxVHa2+qiGSofJ+4lLyXE Q==;
X-CSE-ConnectionGUID: JTig47FHSwuxFhdzVsvZwQ==
X-CSE-MsgGUID: nAybmhwnR5K9vXLmd89Upg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="40855937"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="40855937"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2024 12:30:21 -0700
X-CSE-ConnectionGUID: SoogBU8mSHmo2swiST6sjw==
X-CSE-MsgGUID: JbyX3xpNSHejTXfx6ZO32w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,239,1725346800"; d="scan'208";a="81777553"
Received: from cataylo2-desk.jf.intel.com ([10.165.21.140])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2024 12:30:20 -0700
From: Clint Taylor <clinton.a.taylor@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [PATCH v6 8/9] drm/i915/display/xe3: disable x-tiled framebuffers
Date: Mon, 28 Oct 2024 12:30:14 -0700
Message-Id: <20241028193015.3241858-9-clinton.a.taylor@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241028193015.3241858-1-clinton.a.taylor@intel.com>
References: <20241028193015.3241858-1-clinton.a.taylor@intel.com>
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

From: "Heikkila, Juha-pekka" <juha-pekka.heikkila@intel.com>

Xe3 has no more support for x-tile on display.

v2: Include up to display 29 for X-tiled support. (Gustavo)

Signed-off-by: Heikkila, Juha-pekka <juha-pekka.heikkila@intel.com>
Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
Signed-off-by: Clint Taylor <Clinton.A.Taylor@intel.com>
Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/i915/display/intel_fb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i915/display/intel_fb.c
index a7b4cf8b6d50..6a7060889f40 100644
--- a/drivers/gpu/drm/i915/display/intel_fb.c
+++ b/drivers/gpu/drm/i915/display/intel_fb.c
@@ -349,7 +349,7 @@ static const struct intel_modifier_desc intel_modifiers[] = {
 		.plane_caps = INTEL_PLANE_CAP_TILING_Y,
 	}, {
 		.modifier = I915_FORMAT_MOD_X_TILED,
-		.display_ver = DISPLAY_VER_ALL,
+		.display_ver = { 0, 29 },
 		.plane_caps = INTEL_PLANE_CAP_TILING_X,
 	}, {
 		.modifier = DRM_FORMAT_MOD_LINEAR,
-- 
2.25.1


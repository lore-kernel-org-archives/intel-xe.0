Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2991CCFD2F6
	for <intel-xe@archiver.kernel.org>; Tue,  2 Dec 2025 06:32:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFA9010E58C;
	Tue,  2 Dec 2025 06:32:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hc6IDmpq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8628410E58C
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Dec 2025 06:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764657125; x=1796193125;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HU9xMYUSvS18Ws0hozQIeg+w60fpHnFkTJri8sXymVQ=;
 b=hc6IDmpqD3vvQidARwBo7mjX06MeylJPoR4UnQJCUm0cP0z+yqK4qJRs
 WLz7+jm/i3ENZMJfuv6fo5RPvS5K7c78EKXrWKAdvAJ8JJy43MOD1lAtT
 XDyLVYn2LrV8SDZD+ferm5hI+rOsFx/wPEHjCUjRlarYP+n+zLxYBizws
 vqxm6/pKWwaP330SnqaLb3G1U5b9w/iKlB7/ad4KGPiBcDl+IGC1/fp9/
 31KPEHy2ZVUrCroPvJ2GH9Md66/MfWW7xAlpJQxwpC/wofJoTiMw8jnlP
 6dw9ULAwT1ahM9nqDuyUJjTBERyMyDAh8wK/U2BFBa/J9yZBL6YnhwskR g==;
X-CSE-ConnectionGUID: +weVWCdVTlmwKdOo5EbLKA==
X-CSE-MsgGUID: M/NNkKmySNCr4N3GdODANQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="84008380"
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; d="scan'208";a="84008380"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 22:32:04 -0800
X-CSE-ConnectionGUID: pifLC/9wQcCxrYbidUdeSQ==
X-CSE-MsgGUID: 73U2FIOITwC4vMYvv8quww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; d="scan'208";a="194725406"
Received: from nitin-super-server.iind.intel.com ([10.190.238.72])
 by fmviesa009.fm.intel.com with ESMTP; 01 Dec 2025 22:32:02 -0800
From: Nitin Gote <nitin.r.gote@intel.com>
To: tejas.upadhyay@intel.com, intel-xe@lists.freedesktop.org,
 jani.nikula@linux.intel.com
Cc: piotr.piorkowski@intel.com,
	Nitin Gote <nitin.r.gote@intel.com>
Subject: [PATCH] drm/xe: Use IS_ENABLED() for config checks instead of
 defined()
Date: Tue,  2 Dec 2025 12:32:32 +0530
Message-ID: <20251202070231.187562-2-nitin.r.gote@intel.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Prefer IS_ENABLED() instead of defined() for checking whether
a kconfig option is enabled. IS_ENABLED() evaluates both built-in (=y)
and modular (=m) configurations at compile time, while defined() only
tests symbol presence at preprocessing and can’t distinguish between
built-in, module, or unset states.

This is purely cosmetic – no functional changes.

CC: Piotr Piórkowski <piotr.piorkowski@intel.com>
Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
---
 drivers/gpu/drm/xe/xe_vram.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
index 0a645e76e5fa..8fac1cc08dc9 100644
--- a/drivers/gpu/drm/xe/xe_vram.c
+++ b/drivers/gpu/drm/xe/xe_vram.c
@@ -325,7 +325,7 @@ struct xe_vram_region *xe_vram_region_alloc(struct xe_device *xe, u8 id, u32 pla
 	vram->xe = xe;
 	vram->id = id;
 	vram->placement = placement;
-#if defined(CONFIG_DRM_XE_PAGEMAP)
+#if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
 	vram->migrate = xe->tiles[id].migrate;
 #endif
 	return vram;
-- 
2.50.1


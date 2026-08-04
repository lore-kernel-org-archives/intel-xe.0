Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DFF7C55184
	for <intel-xe@archiver.kernel.org>; Tue,  4 Aug 2026 16:51:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA68D10EB31;
	Tue,  4 Aug 2026 16:51:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Tc7vtqN+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 291FD10E692
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Aug 2026 16:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785862268; x=1817398268;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=E0CVRbmuCZLDHe9yjmTbiMPZTh1GEQcCj+40KoqbdjA=;
 b=Tc7vtqN+1ikl2rO8xJmCy1UglCP1/3uhrSAJhnYlExx5iJx9yIHnDOGx
 l1+8TIeRx2gKsE4hPgfYL52wUVNur1eo7zfL78DjAWJ67YSmtgv6Ruigr
 rD82eSuMHujGyi+9TUP8a2m07z0WoSKg6oxZr6JupNaAImrsKp9gR0Rbp
 1dgIVjkYyfL+BF+eUe1vKSGSXI87sCKTJxzTWPYFbnnyBVBSCrvzlHvYw
 6g4dlSM379n7LT9tCnArIFrNzPsKnGQ/W+mzmqVyYtIPlzP4ThgF6I+GM
 mMuNWR+VNKi+gowVPaCcdaWTP+1XXwiyqBz5ba3jfFFUtt9oDWIiepik0 g==;
X-CSE-ConnectionGUID: PiiCf0zDQyC+yfv6aAOnAw==
X-CSE-MsgGUID: riNFMw4uQHmE7skyvmsq2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="97925424"
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; d="scan'208";a="97925424"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2026 09:51:08 -0700
X-CSE-ConnectionGUID: FcUUm8oISBunojKEhEhzbw==
X-CSE-MsgGUID: G6cz1q1TT+eC1BTLYB7YBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; d="scan'208";a="265063703"
Received: from dut6094bmgfrd.fm.intel.com ([10.80.55.44])
 by orviesa003.jf.intel.com with ESMTP; 04 Aug 2026 09:51:09 -0700
From: Jia Yao <jia.yao@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Jia Yao <jia.yao@intel.com>, Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, stable@vger.kernel.org
Subject: [PATCH v8 3/3] drm/xe/guc_ads: use uncached mapping for UM queue BO
Date: Tue,  4 Aug 2026 16:50:57 +0000
Message-ID: <20260804165057.129529-4-jia.yao@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260804165057.129529-1-jia.yao@intel.com>
References: <20260804165057.129529-1-jia.yao@intel.com>
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

On Pre-Xe3p platform, the GAM write the UM queue through DPA using UC.
if GuC reads the queue via GGTT (WB), stale data may be observed
when the cacheline has been polluted by another agent.

To match the GAM's UC writes, configure the GuC mapping as UC as well.

Fixes: 9c57bc08652a ("drm/xe/lnl: Drop force_probe requirement")
Cc: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: <stable@vger.kernel.org> # v6.12+
Signed-off-by: Jia Yao <jia.yao@intel.com>
Reviewed by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ads.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index 77429ff4d2a9..ff8eee3831aa 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -458,7 +458,8 @@ int xe_guc_ads_init(struct xe_guc_ads *ads)
 		u32 um_flags = XE_BO_FLAG_VRAM_IF_DGFX(tile) |
 			       XE_BO_FLAG_GGTT |
 			       XE_BO_FLAG_GGTT_INVALIDATE |
-			       XE_BO_FLAG_PINNED_NORESTORE;
+			       XE_BO_FLAG_PINNED_NORESTORE |
+			       XE_BO_FLAG_NEEDS_UC;
 
 		bo = xe_managed_bo_create_pin_map(xe, tile, um_size, um_flags);
 		if (IS_ERR(bo))
-- 
2.43.0


Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED3EACCD1AB
	for <intel-xe@archiver.kernel.org>; Tue, 21 Oct 2025 22:47:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6FE610E669;
	Tue, 21 Oct 2025 22:47:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bXTOcYDa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C8C610E667
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Oct 2025 22:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761086819; x=1792622819;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=H3roKcbFz8ijS1+nSmLd0U3zvYLkK8ubljVk4PSv4qU=;
 b=bXTOcYDar5/FSzUM2DZuMpVb13g2xtJOeVDy2NGsUErn42NuPJU8f3Pt
 At22Jv+LvEvpLC9zr0Q1UckiOmrLK5XSs6HfpVI0wkIsxEcJVmRgphwW1
 oGN3GEqO6Cf/seLL/ofK0PoXCV8sqyC4KCxORidJv0DpBIqqgd3irXgoW
 +My7lD7E1nd7jqHQwLa/OKdCHOjbGE1S/AUj7g9i6gdZgACtHImFSt1d0
 GunKEljm0QV0lWw3inUeNnVegJiwI+Oeps2YFpiqYVeSOWzyOhYDKqUfJ
 T1tG503seJtHJll5plPLL4e/6CxbqWlyTXcIa6fFcaxQd3bs+n0g6khRp g==;
X-CSE-ConnectionGUID: wqeywhFFSAa6n1ItFuMR2Q==
X-CSE-MsgGUID: ADqW9gacTaK3XgvMNcN41A==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="67089091"
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; d="scan'208";a="67089091"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 15:46:59 -0700
X-CSE-ConnectionGUID: z640u5QkSiOdKUVFSkktgQ==
X-CSE-MsgGUID: sxoJPWBbRWCzvtl3JrGeIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; d="scan'208";a="188989368"
Received: from gkczarna.igk.intel.com ([10.211.131.163])
 by fmviesa004.fm.intel.com with ESMTP; 21 Oct 2025 15:46:58 -0700
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH v7 3/4] drm/xe: Assert that VF will never use fixed placement
 of BOs
Date: Wed, 22 Oct 2025 00:48:16 +0200
Message-Id: <20251021224817.1593817-4-tomasz.lis@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251021224817.1593817-1-tomasz.lis@intel.com>
References: <20251021224817.1593817-1-tomasz.lis@intel.com>
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

Most BOs do not care at which offset they will be accessed within
GGTT or PPGTT. The few which do care, should be only created
on PF, and mapped within GGTT. On VFs, mapping at fixed offset
is prohibited, as each VF is granted access to a range of
GGTT address space.

Since fixed addresses of GGTT mapping can only be used on PF,
add an assert which makes sure no attempt of fixed placement
will happen for a driver probed on a VF.

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index cbc3ee157218..8a4010294e39 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -2276,6 +2276,12 @@ static int __xe_bo_fixed_placement(struct xe_device *xe,
 	struct ttm_place *place = bo->placements;
 	u32 vram_flag, vram_stolen_flags;
 
+	/*
+	 * to allow fixed placement in GGTT of a VF, post-migration fixups would have to
+	 * include selecting a new fixed offset and shifting the page ranges for it
+	 */
+	xe_assert(xe, !IS_SRIOV_VF(xe) || !(bo->flags & XE_BO_FLAG_GGTT));
+
 	if (flags & (XE_BO_FLAG_USER | XE_BO_FLAG_SYSTEM))
 		return -EINVAL;
 
-- 
2.25.1


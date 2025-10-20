Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0588BCCD1A2
	for <intel-xe@archiver.kernel.org>; Mon, 20 Oct 2025 20:56:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC87D10E515;
	Mon, 20 Oct 2025 20:56:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LfDENlEV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EF5B10E512
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Oct 2025 20:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760993813; x=1792529813;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wT3+fNfP/wvNe3cIxVgQG49xfXK6r422oiybfhTdvQk=;
 b=LfDENlEVVA2Mm434XIGpEODTIaTyMYD5C8M9rzY5ERdqWT1CMJzKNABA
 uox6c8WaTGHWYSwCwwcASMmj9onoHg+uThtpzi37b/1vg/iJAi+SCZFpw
 rxVw90SFSE/2pd2W9WQgHJ+dmqcLjrbbc3y0o5NIPxfNotOgtRgPKC4Io
 vIdnutF+R4pstiq+RF12/EQu8h6PBXivnymrTCyLsGaj6EJjFr1x/0be3
 jVGkxH20Ghb5LJHgMy8TD/ryrPaI4qv3u/2KpTWuTeH1XV/QrEU5C61gE
 sGQtAE1tkkDthG3M0iyEJw4/ZOUbkNDznWlkfth7BkJIgbGhmSDQYA9/j Q==;
X-CSE-ConnectionGUID: TcnjoFo0T8yRGvCDEwJH/w==
X-CSE-MsgGUID: RUZuGQa0Rk6ghXgPMAN6TA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63036091"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="63036091"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 13:56:53 -0700
X-CSE-ConnectionGUID: KxF8K3F7ST2hcBsXhG+G/Q==
X-CSE-MsgGUID: h8ncy8gdR8qzVbHNo/6rUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; d="scan'208";a="184196595"
Received: from gkczarna.igk.intel.com ([10.211.131.163])
 by fmviesa010.fm.intel.com with ESMTP; 20 Oct 2025 13:56:51 -0700
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH v4 3/4] drm/xe: Assert that VF will never use fixed placement
 of BOs
Date: Mon, 20 Oct 2025 22:58:07 +0200
Message-Id: <20251020205808.1187308-4-tomasz.lis@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251020205808.1187308-1-tomasz.lis@intel.com>
References: <20251020205808.1187308-1-tomasz.lis@intel.com>
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
would be problematic, as each VF is granted access to a range of
GGTT address space.

So, since fixed addresses of GGTT mapping can only be used on PF,
we can add an assert which makes sure no attempt of fixed placement
will happen for a driver probed on a VF.

The assert will also ensure that VF migration can be properly
performed without a need for special handling of the fixed placement
addresses.

Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 7b6502081873..8e826a4aa574 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -2259,6 +2259,12 @@ static int __xe_bo_fixed_placement(struct xe_device *xe,
 	struct ttm_place *place = bo->placements;
 	u32 vram_flag, vram_stolen_flags;
 
+	/*
+	 * to allow fixed placement in GGTT of a VF, post-migration fixups
+	 * would have to include shifting the page ranges
+	 */
+	xe_assert(xe, !IS_SRIOV_VF(xe) || !(bo->flags & XE_BO_FLAG_GGTT));
+
 	if (flags & (XE_BO_FLAG_USER | XE_BO_FLAG_SYSTEM))
 		return -EINVAL;
 
-- 
2.25.1


Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FB8CCCD183
	for <intel-xe@archiver.kernel.org>; Tue, 14 Oct 2025 00:43:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 252D910E514;
	Tue, 14 Oct 2025 00:43:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZGP3nX/z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7917810E104
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Oct 2025 00:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760402593; x=1791938593;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wT3+fNfP/wvNe3cIxVgQG49xfXK6r422oiybfhTdvQk=;
 b=ZGP3nX/zzSTPDOJFpasSP0NPaZIZJEIjdNP/DOYgFDR1LtpDJ79/EwCX
 JROWwpBAok39KYdPerscNDC0JqDiTg/cfgd9IgYO3KMNronSQZ57pB3+F
 3j07/MWMr/w7eBWfRnbtc8dxa66dTz2KAovoXhIUb0/sf9eDytwtiPquP
 o/iMOZJCCbJqAiul2PEu+WUXyse7jWCZbEoCCJkkQTq7fGMk4aC+Vmhmm
 QQCC+rsP5w56Q8ydMEHknzDe1cjl+lkz+CtxemX2i9INNo+lsetrfymXf
 4pT3H7WVaX3X0SoDEPabWhpeXVru7EOT4Tv3qEARGsiINWzICqgL8Odhh Q==;
X-CSE-ConnectionGUID: dMmWIYTFQT+n5oUIRqLi7w==
X-CSE-MsgGUID: sX7P/p0MTn2Z2F55tup62g==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="80191838"
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; d="scan'208";a="80191838"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 17:43:12 -0700
X-CSE-ConnectionGUID: 4BI6nyYISWmkuTNDybaqqw==
X-CSE-MsgGUID: H+qbxzcjSVGVE2b5atTPBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; d="scan'208";a="185994727"
Received: from gkczarna.igk.intel.com ([10.211.131.163])
 by orviesa004.jf.intel.com with ESMTP; 13 Oct 2025 17:43:11 -0700
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v1 2/3] drm/xe: Assert that VF will never use fixed placement
 of BOs
Date: Tue, 14 Oct 2025 02:44:17 +0200
Message-Id: <20251014004418.378928-3-tomasz.lis@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251014004418.378928-1-tomasz.lis@intel.com>
References: <20251014004418.378928-1-tomasz.lis@intel.com>
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


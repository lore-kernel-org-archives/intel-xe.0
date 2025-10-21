Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93B4ECCD184
	for <intel-xe@archiver.kernel.org>; Tue, 21 Oct 2025 18:11:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59E8210E63D;
	Tue, 21 Oct 2025 18:11:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cBMiU5/M";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC7BC10E63C
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Oct 2025 18:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761070293; x=1792606293;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=H3roKcbFz8ijS1+nSmLd0U3zvYLkK8ubljVk4PSv4qU=;
 b=cBMiU5/MDEPe2gXW0dr+BuBRYCM2tm6O2APVQHYOXIrmoBYr4YvYPRpi
 dLq5c0nICRR6oFVWhizDzEoCxViObpoUnjXOPwCI+4wP729+pfsM0KCTb
 rVh0dDWG12RM1rwrd/NH/fC/61Vrm+F9MsKX5j/pgqdqXIjjE4f0VaC1i
 u/jkiA5AZ4BE31D74poL+U8sX6g+iL8dIz6fCDD113IkMJqknWqv2u6xu
 VeSg8zwlS4DqHXpzIN7wISlrW5Lno5U0L+OCB0xI9ZAyAZumM8rx3vcIw
 qYEcYEG6oHaOoWyEN54Yc3tU1EcSFvOh4quG9nMr5X6zeNC28cBWZf0dR Q==;
X-CSE-ConnectionGUID: QRkPTNTCR5O68sWUmGxrxQ==
X-CSE-MsgGUID: 4M/PpVfhRpmQDJ/BSrWYoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="80644986"
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; d="scan'208";a="80644986"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 11:11:33 -0700
X-CSE-ConnectionGUID: CmPzCiSkS16U7DBnI1O1DQ==
X-CSE-MsgGUID: eoXI3hIAQNerx7qnRIdYAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; d="scan'208";a="183519907"
Received: from gkczarna.igk.intel.com ([10.211.131.163])
 by orviesa007.jf.intel.com with ESMTP; 21 Oct 2025 11:11:31 -0700
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH v6 3/4] drm/xe: Assert that VF will never use fixed placement
 of BOs
Date: Tue, 21 Oct 2025 20:12:49 +0200
Message-Id: <20251021181250.1541639-4-tomasz.lis@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251021181250.1541639-1-tomasz.lis@intel.com>
References: <20251021181250.1541639-1-tomasz.lis@intel.com>
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


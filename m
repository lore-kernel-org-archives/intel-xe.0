Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0789BC27C4F
	for <intel-xe@archiver.kernel.org>; Tue, 18 Jun 2024 10:50:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CD1F10E624;
	Tue, 18 Jun 2024 10:50:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Irbuxa5t";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1E6410E624
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Jun 2024 10:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718707801; x=1750243801;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=c0bM/O9y7GOhV2gm/avceN364+33Hemmtbpxpf4JaZM=;
 b=Irbuxa5tTKa4lq41Hc6ApLG7a/ALpXsAWNrQct488xI44ZBN3UD4m6my
 XEEI/DzKnvJ+0bqSVQd+HjyaIwuY7OODJqwKcEMtbkGN0BvW/GhPN+5HH
 K70ZkztBwvlt9gB5PnT26hVfD1FewBdVOjdg4i/GfVZcfjWaGE7O0T1fc
 DL31XQop84/0drxuq2culdc+CeGnViU9G9b+Ck4hL18+6YHQB6Ada//jx
 2bYoJWkc0nFL8yKmOGEjnFWutRkP02v30puZyw9tW85FacCM2n5Rb8mKg
 b9y2c+5g63ur1X8/W1X3yqGw8yRbLZDrKIOInF2DFpyPioyFyqN1dOWjB A==;
X-CSE-ConnectionGUID: U0siq1SEQUi3GWs9vKVg3w==
X-CSE-MsgGUID: trEeWX1QQgm8Lt6w4C06Yw==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="33047002"
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="33047002"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2024 03:50:00 -0700
X-CSE-ConnectionGUID: eY/Zrb3mR9mYbsf8KQYhaw==
X-CSE-MsgGUID: yvl1VUFcR36Q2Tl+rfqUfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="72714015"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.49.231])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2024 03:49:58 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH v2] drm/xe: Use ttm_uncached for BO with NEEDS_UC flag
Date: Tue, 18 Jun 2024 12:49:47 +0200
Message-Id: <20240618104947.729-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
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

We should honor requested uncached mode also at the TTM layer.
Otherwise, we risk losing updates to the memory based interrupts
source or status vectors, as those require uncached memory.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
---
v2: assert that cpu_caching is unset (Matt)
---
 drivers/gpu/drm/xe/xe_bo.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 74294f1b05bc..65c696966e96 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -378,6 +378,15 @@ static struct ttm_tt *xe_ttm_tt_create(struct ttm_buffer_object *ttm_bo,
 	    (xe->info.graphics_verx100 >= 1270 && bo->flags & XE_BO_FLAG_PAGETABLE))
 		caching = ttm_write_combined;
 
+	if (bo->flags & XE_BO_FLAG_NEEDS_UC) {
+		/*
+		 * Valid only for internally-created buffers only, for
+		 * which cpu_caching is never initialized.
+		 */
+		xe_assert(xe, bo->cpu_caching == 0);
+		caching = ttm_uncached;
+	}
+
 	err = ttm_tt_init(&tt->ttm, &bo->ttm, page_flags, caching, extra_pages);
 	if (err) {
 		kfree(tt);
-- 
2.43.0


Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33296C8303F
	for <intel-xe@archiver.kernel.org>; Thu, 28 Aug 2025 13:49:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F317610E0A5;
	Thu, 28 Aug 2025 13:49:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SW+TH2qm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5591310E0A5
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Aug 2025 13:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756388967; x=1787924967;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=uNqMlwNAprobxNq2xZjNObxF1fqLB1cBb3OHEgjv02I=;
 b=SW+TH2qmdxrNOCNECbnsqgh5WIagWW0AGxmlH48AHEaacdPzAwpAEL8D
 Z3eSZnnG2vgyHR8f5jEWQIDhig/MB/Qz9K9uiYxW9uTTEr1BNSQdH0XtK
 ZCXa7fDd/s4YJ/zBw8ekuPy8/0qGmfWVynJwV49G3RelIKsJ0ai3vFBo6
 41zPT/ibJdAYaFMrNnAxWPVoz/Kdelc6a1O7DjD1RfAEI7IqWBNke8qVc
 PtOGqxCvNa74D1dZ2BjNvYiVey7sSgbrRyax1jeVnSrBYlfCVwmFyhIxJ
 8o86cYuQFWzH02EqWzRzWJm3fnl5vjcq37KIJ4FQgOZD4JRKBOi6/qlNY w==;
X-CSE-ConnectionGUID: YnXQ3BmcTnmBp+TCpVNVlA==
X-CSE-MsgGUID: FjIN1p6AT0KnKHm/blmHcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11536"; a="62480623"
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="62480623"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 06:49:27 -0700
X-CSE-ConnectionGUID: BgWa5zq+Sxy8wzo9iwGOOA==
X-CSE-MsgGUID: k+3pSTYBS2eTJBYButisOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="169363730"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO fedora)
 ([10.245.245.28])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 06:49:25 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, stable@vger.kernel.org
Subject: [PATCH] drm/xe: Fix incorrect migration of backed-up object to VRAM
Date: Thu, 28 Aug 2025 15:48:37 +0200
Message-ID: <20250828134837.5709-1-thomas.hellstrom@linux.intel.com>
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

If an object is backed up to shmem it is incorrectly identified
as not having valid data by the move code. This means moving
to VRAM skips the -EMULTIHOP step and the bo is cleared. This
causes all sorts of weird behaviour on DGFX if an already evicted
object is targeted by the shrinker.

Fix this by using ttm_tt_is_swapped() to identify backed-up
objects.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5996
Fixes: 00c8efc3180f ("drm/xe: Add a shrinker for xe bos")
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: <stable@vger.kernel.org> # v6.15+
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 7d1ff642b02a..4faf15d5fa6d 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -823,8 +823,7 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 		return ret;
 	}
 
-	tt_has_data = ttm && (ttm_tt_is_populated(ttm) ||
-			      (ttm->page_flags & TTM_TT_FLAG_SWAPPED));
+	tt_has_data = ttm && (ttm_tt_is_populated(ttm) || ttm_tt_is_swapped(ttm));
 
 	move_lacks_source = !old_mem || (handle_system_ccs ? (!bo->ccs_cleared) :
 					 (!mem_type_is_vram(old_mem_type) && !tt_has_data));
-- 
2.50.1


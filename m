Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C132D462C4
	for <intel-xe@archiver.kernel.org>; Wed, 13 Nov 2024 15:44:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2D2310E144;
	Wed, 13 Nov 2024 15:44:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SllAvZR5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BA2610E144
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Nov 2024 15:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731512687; x=1763048687;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Rrly++MXC3pppVLD2Fm5h7Oo9SaXBr28yMffAIXK9fI=;
 b=SllAvZR5aiMXFbZnGdUgyCrgj8EBWzcI+Rgjvzk7ylh8m3eBWrROP16H
 NVZGkvbTJvlSumx9LHyAWuEfBeUFLIOna46cuC66MvVfmtQd5I1NKN47q
 pOMullX7KrphI00rXoczKTIeVlnWnfcRS+nqVj+d6OF90atrlimtgeSKh
 ++jA7C75ak/tg4ukcYB9DFmfOgTe3ksCLr/8kNqyFP5SCzHYL+O6gQ5qh
 zGvbPOT8Zl8AawAStVJIlel/fYEnY4IcNWvdHH8xyQ5dj/s8kOE6ne1Hq
 OM0Uotgf476RyZC3XrpqvED7VoIO/VOycZ4l6M9Y5B6SCfh2m5pVjNiis A==;
X-CSE-ConnectionGUID: T0Fc3EP/R/uSwaa+jhlWjA==
X-CSE-MsgGUID: SgJoeDPtRcGrGjyJuQliCA==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="56802189"
X-IronPort-AV: E=Sophos;i="6.12,151,1728975600"; d="scan'208";a="56802189"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 07:44:46 -0800
X-CSE-ConnectionGUID: tMxwrTisQ4avl1K9o3dCwg==
X-CSE-MsgGUID: GLrmujluQByn2sNH+MIXtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,151,1728975600"; d="scan'208";a="88718322"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 07:44:45 -0800
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>, Matthew Auld <matthew.auld@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH] drm/xe/tests: Limit purgeable size for faster execution
Date: Wed, 13 Nov 2024 16:02:28 +0100
Message-ID: <20241113150228.2337530-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

xe_bo_shrink_kunit takes a while to run on some machines depending
on swap storage speed and ram size. Limit purgeable size to 2GB
so xe_bo_shrink_kunit can execute much faster.

Cc: Matthew Auld <matthew.auld@intel.com>
Suggested-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2998
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_bo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe_bo.c
index cd811aa2b227..71b71a546abe 100644
--- a/drivers/gpu/drm/xe/tests/xe_bo.c
+++ b/drivers/gpu/drm/xe/tests/xe_bo.c
@@ -467,7 +467,7 @@ static int shrink_test_run_device(struct xe_device *xe)
 	}
 	to_alloc = ram * 2;
 
-	ram_and_swap = ram + get_nr_swap_pages() * PAGE_SIZE;
+	ram_and_swap = ram + min(get_nr_swap_pages() * PAGE_SIZE, SZ_2G);
 	if (to_alloc > ram_and_swap)
 		purgeable = to_alloc - ram_and_swap;
 	purgeable += div64_u64(purgeable, 5);
-- 
2.46.0


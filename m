Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69041C71130
	for <intel-xe@archiver.kernel.org>; Mon,  7 Jul 2025 22:21:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DDCB10E574;
	Mon,  7 Jul 2025 22:21:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gGS1mJ2f";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48B3610E574
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Jul 2025 22:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751926886; x=1783462886;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=y4eeQdBytzKSVt+6OPtPcVvNRYgvB34QiYxaYHfiSWs=;
 b=gGS1mJ2fXP587VPNcZanlC9WPi7ifF3hm5Ipr1DIM1zlnxPlrcNGvwAS
 FlM30gEleGI4WTIKNwCqpP5mAeubj0+lgcI9v4qIkSkpT4R+pGCH5AIX1
 ccHaudWWuZG3Flr4MeN7IQTX+ar8+uN0ZChJYVCzevv3kIEXns2vZ9Wrd
 qLTpt6fbNwXuUrpmp0lgPHtF6Mnrh84DU25lH6gVyyq9K0e071/83r/y2
 YjQk38z5ap4RwgjKKQFiA4/vzLtFXdB+0J+P0qa9piZYDfaCzmtl4FG3e
 bNr5eYJLB9XgvwHmL8GrqRfpWYjqUNP5Q+zEyCZJeQFasUasa3Y+X1CZG Q==;
X-CSE-ConnectionGUID: fyYAvQ/8RfGwCfRHBLfTRw==
X-CSE-MsgGUID: KVrZndiTQV6cOEHTHkYZCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="54298175"
X-IronPort-AV: E=Sophos;i="6.16,295,1744095600"; d="scan'208";a="54298175"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2025 15:21:26 -0700
X-CSE-ConnectionGUID: c1mjbGBoTuGAnlGDnnzPhw==
X-CSE-MsgGUID: m1OWGoj1QUiJ8ZnWyosVCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,295,1744095600"; d="scan'208";a="154733819"
Received: from orsosgc001.jf.intel.com ([10.165.21.142])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2025 15:21:26 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH] drm/xe/pat: Use XE_WA in xe_pat_init_early
Date: Mon,  7 Jul 2025 15:21:11 -0700
Message-ID: <20250707222111.3214505-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.48.1
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

Add the missing XE_WA in xe_pat_init_early.

Fixes: 01570b446939 ("drm/xe/bmg: implement Wa_16023588340")
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_pat.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
index 2e7cb99ae87aa..d36da052f8a43 100644
--- a/drivers/gpu/drm/xe/xe_pat.c
+++ b/drivers/gpu/drm/xe/xe_pat.c
@@ -384,8 +384,7 @@ void xe_pat_init_early(struct xe_device *xe)
 		if (IS_DGFX(xe))
 			xe->pat.pat_pta = &xe2_pat_pta;
 
-		/* Wa_16023588340. XXX: Should use XE_WA */
-		if (GRAPHICS_VERx100(xe) == 2001)
+		if (XE_WA(xe_root_mmio_gt(xe), 16023588340))
 			xe->pat.n_entries = 28; /* Disable CLOS3 */
 		else
 			xe->pat.n_entries = ARRAY_SIZE(xe2_pat_table);
-- 
2.48.1


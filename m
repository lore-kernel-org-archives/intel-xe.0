Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A99DBC43458
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jun 2026 21:07:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38E5710E174;
	Fri, 26 Jun 2026 21:07:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HTrqBQqz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B64410E174
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jun 2026 21:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782508020; x=1814044020;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ossZO5aCudQULTr4QwyC3J4RDtofT+jyLjN8UfjaTuY=;
 b=HTrqBQqzEkOO7GwOTCLWsZ3yqyoXeDd2mbJ+d0jEtiUkWj4OHGt/VR/k
 jICiTHjALAeqhGgAAKqKPkmbEQ/FRUwJiP2ENkAwJS95PLxBxjPvahdbO
 eGGylYVYcr9QL992VNfNCgRpxXNjhE1/IwnbZeZgglzChN9Euat1InXpO
 RzF2zTkziASq9fBrEmG+H4+mSAvkvZmJG/MSeSi1oeOFu7GR1URnOjtgz
 zlG3Jl3f5tMxhCkBG/9jqtNRGKDDQauIeabRPO4jk1XtxwwwCarFQPwEo
 otal+Qo9C4HyHC9QD8xbSrtxXuoABFOtfywFFJX1Q2oL8JzptS4tO13KF A==;
X-CSE-ConnectionGUID: NZ1LotbsSiyWLIrGJrhL7w==
X-CSE-MsgGUID: fN1pZV82QAqAzc25mQCrcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11829"; a="83336911"
X-IronPort-AV: E=Sophos;i="6.24,227,1774335600"; d="scan'208";a="83336911"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2026 14:06:59 -0700
X-CSE-ConnectionGUID: 5QeWL7fERUG5mh1YKtd1PQ==
X-CSE-MsgGUID: zbHV1paUQ7aN/fZXQLNY8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,227,1774335600"; d="scan'208";a="255385120"
Received: from osgcshtiger.sh.intel.com ([10.239.81.49])
 by orviesa004.jf.intel.com with ESMTP; 26 Jun 2026 14:06:57 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Zongyao Bai <zongyao.bai@intel.com>
Subject: [PATCH] drm/xe/hw_engine: Fix double-free of managed BO in error path
Date: Fri, 26 Jun 2026 21:06:31 +0000
Message-Id: <20260626210631.3887291-1-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.34.1
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

The error path in hw_engine_init() explicitly frees a BO allocated
with xe_managed_bo_create_pin_map() via xe_bo_unpin_map_no_vm().
Since the managed BO already has a devm cleanup action registered,
this causes a double-free when devm unwinds during probe failure.

Remove the explicit free and let devm handle it, consistent with
all other xe_managed_bo_create_pin_map() callers.

Fixes: 23e939bc8f56 ("drm/xe: Add a helper for DRM device-lifetime BO create")
Assisted-by: Claude:claude-opus-4.6
Reviewed-by: Zongyao Bai <zongyao.bai@intel.com>
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
Rebase to latest code and Re-send for CI.
---
 drivers/gpu/drm/xe/xe_hw_engine.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 76aee461bcbe..87d60c4117bd 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -636,7 +636,7 @@ static int hw_engine_init(struct xe_gt *gt, struct xe_hw_engine *hwe,
 		hwe->exl_port = xe_execlist_port_create(xe, hwe);
 		if (IS_ERR(hwe->exl_port)) {
 			err = PTR_ERR(hwe->exl_port);
-			goto err_hwsp;
+			goto err_name;
 		}
 	} else {
 		/* GSCCS has a special interrupt for reset */
@@ -656,8 +656,6 @@ static int hw_engine_init(struct xe_gt *gt, struct xe_hw_engine *hwe,
 
 	return devm_add_action_or_reset(xe->drm.dev, hw_engine_fini, hwe);
 
-err_hwsp:
-	xe_bo_unpin_map_no_vm(hwe->hwsp);
 err_name:
 	hwe->name = NULL;
 
-- 
2.43.0


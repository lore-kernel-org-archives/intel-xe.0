Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B324C36008
	for <intel-xe@archiver.kernel.org>; Tue, 25 Mar 2025 20:31:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F36E210E5FB;
	Tue, 25 Mar 2025 20:31:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RUXHnv1v";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C398910E5FB
 for <Intel-Xe@lists.freedesktop.org>; Tue, 25 Mar 2025 20:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742934674; x=1774470674;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=i+8mneRCpafwlfvLmCmEG1R6q7hE3pTrdvI/FZxXtX0=;
 b=RUXHnv1vcVsCJD48T5NcaFA6WlCJ7gKTwmKT67l3/ANnkFF9XIUkqN6g
 FZ507FmjJj3sfdzXbzb8xN2rioC9wCdIKqiFufeAM0gVt26dSeJmgItef
 cB4HQ4gWBC0sFMVsym5QC1SRRZ3ynISZ6UQ1cTTFbjTN+ST5sgwUoNotb
 OINGZfNGJj9AkfbOE8Fu7d1JOoIBUJcG7UsZ4TLfPWA3AzRlaCNBBJn+E
 7SDdk93nzzYXyEpYCZPzvUgNw92b6DHbuDTP5lRD5/VIoxRK033NspLuX
 SqTwB6icx366o60k8UTfnH0MiTI9m8I/3Nc2tya9f0Bho5hG2B03JFb2n Q==;
X-CSE-ConnectionGUID: 0ATveRLjT6Wi/YbgwcGrsA==
X-CSE-MsgGUID: yT7Twdy7RP2KqQzEpVRF6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="69564353"
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; d="scan'208";a="69564353"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 13:31:12 -0700
X-CSE-ConnectionGUID: L7eqCHsUTR6xaZLilMZ8Eg==
X-CSE-MsgGUID: fpo5Rp0SRqq7eui7El3sHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; d="scan'208";a="125012076"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orviesa007.jf.intel.com with ESMTP; 25 Mar 2025 13:31:11 -0700
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH] drm/xe/guc: Reformat dead CT reason string to be devcoredump
 compatible
Date: Tue, 25 Mar 2025 13:31:11 -0700
Message-ID: <20250325203111.3907426-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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

From: John Harrison <John.C.Harrison@Intel.com>

The dump on a dead CT tries to emulate the devcoredump formatting (it
would use devcoredump code directly but that requires more re-work to
happen - work in progress). So update the print of the dead CT reason
code to match the format of the 'reason' string that was added to the
actual devcoredump a little while ago.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 72ad576fc18e..686fe664c20d 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -1828,10 +1828,10 @@ static void ct_dead_print(struct xe_dead_ct *dead)
 		return;
 	}
 
-	drm_printf(&lp, "CTB is dead - reason=0x%X\n", dead->reason);
 
 	/* Can't generate a genuine core dump at this point, so just do the good bits */
 	drm_puts(&lp, "**** Xe Device Coredump ****\n");
+	drm_printf(&lp, "Reason: CTB is dead - 0x%X\n", dead->reason);
 	xe_device_snapshot_print(xe, &lp);
 
 	drm_printf(&lp, "**** GT #%d ****\n", gt->info.id);
-- 
2.49.0


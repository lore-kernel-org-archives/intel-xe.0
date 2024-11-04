Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 348EBD1BDDA
	for <intel-xe@archiver.kernel.org>; Mon,  4 Nov 2024 18:31:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0020E10E4AC;
	Mon,  4 Nov 2024 18:31:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dhHkQW+Z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1453D10E4AC
 for <intel-xe@lists.freedesktop.org>; Mon,  4 Nov 2024 18:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730745095; x=1762281095;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8IHe6FPWrD5EXDqSt288ErSPrB6YYOuc756fhrdkfZw=;
 b=dhHkQW+ZUbMoBjXtSl6IuQoqXNo6HxAAEP7dUKPthJWU50mrzPhBvrUd
 VA4T1BASjHWAUrBt4JJ1m/rJpeqFXSCmGK9EalLEtmXe7Iv2Tl3YCsN4O
 xxq4p/8snRK3gRJzYTQnZBQ+eqHYkppROiMhQyABUT5ym+Z5TaKpmphMo
 uRkYqQVPBswQ/KLmonWtbX8yaymhTfICkzWIYUo5rxVXkc647cHUmhbgp
 H3FQT0L20ElLvnb1izwE8KYXIQ1XuM3oq5x7SfUpC4wXQPZ5se8vN0DB5
 ARChK64tkV3cyaAm614rCXowUGRwena+8Syb5I/Y+fzXWV07I5RfxuJ9b w==;
X-CSE-ConnectionGUID: HxFGgzJGQ/COYkgCIJyESg==
X-CSE-MsgGUID: 30J9pLxxRoSRPKECXI55EA==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="34247558"
X-IronPort-AV: E=Sophos;i="6.11,257,1725346800"; d="scan'208";a="34247558"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2024 10:31:25 -0800
X-CSE-ConnectionGUID: 690gwYxPRw+Top8YoOsCIA==
X-CSE-MsgGUID: FA3YaC3hR92730KLkuxVoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="88495279"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2024 10:31:24 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH] drm/xe: Fix drm-next merge
Date: Mon,  4 Nov 2024 10:31:04 -0800
Message-ID: <20241104183104.2265275-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.47.0
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

Fix merge in commit c787c2901e2c ("Merge drm/drm-next into
drm-xe-next"). That workaround needs to be done only once.

Fixes: c787c2901e2c ("Merge drm/drm-next into drm-xe-next")
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 19 -------------------
 1 file changed, 19 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index a405b9218ad2d..550eeed43903b 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -1017,7 +1017,6 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
 	}
 
 	ret = wait_event_timeout(ct->g2h_fence_wq, g2h_fence.done, HZ);
-
 	if (!ret) {
 		LNL_FLUSH_WORK(&ct->g2h_worker);
 		if (g2h_fence.done) {
@@ -1027,24 +1026,6 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
 		}
 	}
 
-	/*
-	 * Occasionally it is seen that the G2H worker starts running after a delay of more than
-	 * a second even after being queued and activated by the Linux workqueue subsystem. This
-	 * leads to G2H timeout error. The root cause of issue lies with scheduling latency of
-	 * Lunarlake Hybrid CPU. Issue dissappears if we disable Lunarlake atom cores from BIOS
-	 * and this is beyond xe kmd.
-	 *
-	 * TODO: Drop this change once workqueue scheduling delay issue is fixed on LNL Hybrid CPU.
-	 */
-	if (!ret) {
-		flush_work(&ct->g2h_worker);
-		if (g2h_fence.done) {
-			xe_gt_warn(gt, "G2H fence %u, action %04x, done\n",
-				   g2h_fence.seqno, action[0]);
-			ret = 1;
-		}
-	}
-
 	/*
 	 * Ensure we serialize with completion side to prevent UAF with fence going out of scope on
 	 * the stack, since we have no clue if it will fire after the timeout before we can erase
-- 
2.47.0


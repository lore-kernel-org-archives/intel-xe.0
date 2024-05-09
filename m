Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18A1DC25B77
	for <intel-xe@archiver.kernel.org>; Thu,  9 May 2024 04:11:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2324E10E232;
	Thu,  9 May 2024 04:11:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CK5h0hmX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DF0E10E232
 for <intel-xe@lists.freedesktop.org>; Thu,  9 May 2024 04:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715227891; x=1746763891;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VyeIfT6NmeLysRNchx6SA57jHLPX2zmmz83CKt4J0Ws=;
 b=CK5h0hmXsK1FMx/YWxFPETxWpGKe59wJxQL+rlyWk9p6Euexau7c26WJ
 UqVzG1+eIVH+kJEmkifflnh1kiefYPrlbI58oX2J+30ndSzJ2Z2oPV03j
 lFDaC54OWqV+/jpjEe8F25WIHqQXDd30Yyn4ujeT8nHMCJqIJo1z03R34
 bJTIgA0yiCBjoA5D2EJDArX/tly+dkh8fr59CBFThhwk6K7NgIQUX2jk0
 I3wfv/TWfJWQIB/YHSX21HSXI54C2IoKjjc31/s/z5POgp0jxQNstkFAU
 eVeq6vVTZDWLEysjfBdSSwZZPwhqQHk1ikqAeftSJwEbCJSPQMWgzl3OP Q==;
X-CSE-ConnectionGUID: cccZnG/kTpaZdL3UjENBcg==
X-CSE-MsgGUID: z0YHt2uFSFyiHUAcIxfyAg==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="11249895"
X-IronPort-AV: E=Sophos;i="6.08,146,1712646000"; d="scan'208";a="11249895"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 21:11:29 -0700
X-CSE-ConnectionGUID: +7pD87dQRN2/9qhM32G1CA==
X-CSE-MsgGUID: DpxXbkWNSNCS4bA4etdaSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,146,1712646000"; d="scan'208";a="33915538"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 21:11:29 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [CI 4/5] drm/xe: Move xe_force_wake_init_gt() inside gt initialization
Date: Wed,  8 May 2024 21:12:24 -0700
Message-ID: <20240509041225.610636-4-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240509041225.610636-1-lucas.demarchi@intel.com>
References: <20240509041225.610636-1-lucas.demarchi@intel.com>
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

xe_force_wake_init_gt() is a software-only initialization and doesn't
need to be called from xe_device_probe(). Move it to initialize
together with the gt.

Reviewed-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 3 ---
 drivers/gpu/drm/xe/xe_gt.c     | 2 ++
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index ef9231675e67..fb838f35ab52 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -573,9 +573,6 @@ int xe_device_probe(struct xe_device *xe)
 			return err;
 	}
 
-	for_each_gt(gt, xe, id)
-		xe_force_wake_init_gt(gt, gt_to_fw(gt));
-
 	for_each_tile(tile, xe, id) {
 		err = xe_ggtt_init_early(tile->mem.ggtt);
 		if (err)
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 05b77214f996..e05899691a8c 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -328,6 +328,8 @@ int xe_gt_init_early(struct xe_gt *gt)
 	xe_wa_process_oob(gt);
 	xe_tuning_process_gt(gt);
 
+	xe_force_wake_init_gt(gt, gt_to_fw(gt));
+
 	return 0;
 }
 
-- 
2.43.0


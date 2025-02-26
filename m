Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE62AC021B8
	for <intel-xe@archiver.kernel.org>; Wed, 26 Feb 2025 11:21:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99D6A10E132;
	Wed, 26 Feb 2025 11:21:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="QoxOmYj0";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A446910E1F8
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Feb 2025 11:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NBBEcmEHmHyvRxWhEI2mqX0lHKH5mkMf2+xgiFlth3U=; b=QoxOmYj0vkzmWrWqRT0CZKmibq
 i2rJFLiHd0EDVyW33WXGfAL5Bfep8nPWPW40bruG7Bs7rkCcGhgYWLjuUXpuAuR5g/QZ2DTvVk3DI
 XmQ+rK2e+6LmIw9mWElb6/xu8vI9T2+nB1X1/Adte40VmSP4jwyaKwYivsCLX0hdmXhXHuB4sOUhE
 0L0R3wYxfzYciPq+uagPcr+ZfRXrhSbA4Ss/Q8Su4rJdLLYiOXMhAbIjO+gPVu0y2SRoSefg7gk05
 kqaLwfv4QENP/+1Yx+n4qSdp4qERBD99/nXcjwNiGh+8nAg4WdueycFq+/iXLrCGiAFPD83G1dGl6
 oqtKxqQw==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tnFTN-000vLn-H5; Wed, 26 Feb 2025 12:21:11 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH 1/4] drm/xe: Fix GT "for each engine" workarounds
Date: Wed, 26 Feb 2025 11:21:03 +0000
Message-ID: <20250226112106.28173-2-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250226112106.28173-1-tvrtko.ursulin@igalia.com>
References: <20250226112106.28173-1-tvrtko.ursulin@igalia.com>
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

Any rules using engine matching are currently broken due RTP processing
happening too in early init, before the list of hardware engines has been
initialised.

Fix this by moving workaround processing to later in the driver probe
sequence, to just before the processed list is used for the first time.

Looking at the debugfs gt0/workarounds on ADL-P we notice 14011060649
should be present while we see, before:

 GT Workarounds
     14011059788
     14015795083

And with the patch:

 GT Workarounds
     14011060649
     14011059788
     14015795083

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 650a0ee56e97..d59c03bc05b7 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -361,9 +361,7 @@ int xe_gt_init_early(struct xe_gt *gt)
 	if (err)
 		return err;
 
-	xe_wa_process_gt(gt);
 	xe_wa_process_oob(gt);
-	xe_tuning_process_gt(gt);
 
 	xe_force_wake_init_gt(gt, gt_to_fw(gt));
 	spin_lock_init(&gt->global_invl_lock);
@@ -450,6 +448,8 @@ static int all_fw_domain_init(struct xe_gt *gt)
 	}
 
 	xe_gt_mcr_set_implicit_defaults(gt);
+	xe_wa_process_gt(gt);
+	xe_tuning_process_gt(gt);
 	xe_reg_sr_apply_mmio(&gt->reg_sr, gt);
 
 	err = xe_gt_clock_init(gt);
-- 
2.48.0


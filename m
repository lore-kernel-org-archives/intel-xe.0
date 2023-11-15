Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDE92C54F8F
	for <intel-xe@archiver.kernel.org>; Wed, 15 Nov 2023 14:38:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B39110E03F;
	Wed, 15 Nov 2023 14:38:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEBBF10E033
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Nov 2023 14:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700059134; x=1731595134;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=m4c95cxZYM/4gR1pOiQ/sJNL5nTFE0/m0hPto/O9UX8=;
 b=QWpMlLOzhjvlQOSK+CSfVmTdfvrn8Zwc7iVuUAuSZYTqpGbK7kQFKPU/
 e9ja9/dVM5ph4cCIfz5RQy37xO70gYU0anFvYvY6Ll4RsZ2gWgBfG5cHa
 yQ7tm3W2iTz5Zu/i6aCa4de8d2VQ1kiwyFjWWDim20Tm9wujsIYeOVl0c
 rYKb/zIRbJa7goewKc8h4hFAUMDVbgk7kUGfOemkh9Ey/EWPe3Ujvngx5
 ZhBtGV8WK+E5ZVoitFuqfu7ylFddUfbNvlPP0eb8Yc2dcSox1Lg7GilWW
 zggcYgT00lgSSdDRzJVJGn+FdKlGKcxawCfrWZyzv9J27HaeOG4QgZATU A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="370231015"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; d="scan'208";a="370231015"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2023 06:38:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="830964704"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; d="scan'208";a="830964704"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.135.24])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2023 06:38:53 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 15 Nov 2023 15:38:38 +0100
Message-Id: <20231115143838.2081-4-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20231115143838.2081-1-michal.wajdeczko@intel.com>
References: <20231115143838.2081-1-michal.wajdeczko@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 4/4] drm/xe: Use dedicated function to read clock
 registers
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

These registers are not directly exposed to VFs, use function that
will provide required data also when running as a VF.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_clock.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_clock.c b/drivers/gpu/drm/xe/xe_gt_clock.c
index 25a18eaad9c4..2a377bbdd5c9 100644
--- a/drivers/gpu/drm/xe/xe_gt_clock.c
+++ b/drivers/gpu/drm/xe/xe_gt_clock.c
@@ -54,7 +54,7 @@ static u32 get_crystal_clock_freq(u32 rpm_config_reg)
 
 int xe_gt_clock_init(struct xe_gt *gt)
 {
-	u32 ctc_reg = xe_mmio_read32(gt, CTC_MODE);
+	u32 ctc_reg = xe_mmio_fuse_read32(gt, CTC_MODE);
 	u32 freq = 0;
 
 	/* Assuming gen11+ so assert this assumption is correct */
@@ -63,7 +63,7 @@ int xe_gt_clock_init(struct xe_gt *gt)
 	if (ctc_reg & CTC_SOURCE_DIVIDE_LOGIC) {
 		freq = read_reference_ts_freq(gt);
 	} else {
-		u32 c0 = xe_mmio_read32(gt, RPM_CONFIG0);
+		u32 c0 = xe_mmio_fuse_read32(gt, RPM_CONFIG0);
 
 		freq = get_crystal_clock_freq(c0);
 
-- 
2.25.1


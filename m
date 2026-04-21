Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BD5BF94CA7
	for <intel-xe@archiver.kernel.org>; Tue, 21 Apr 2026 21:18:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28F6E10ED9D;
	Tue, 21 Apr 2026 21:18:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ADnB+HLS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F12B10E23A
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Apr 2026 21:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776806336; x=1808342336;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:to:cc;
 bh=6lIAWm50whwp8deERudzrmLB6cPJOAEJU82D0z7oXkg=;
 b=ADnB+HLSb9HhSyQo5S1d525bzEa5N4y+lirHLl6TiIu7F8LIwtag4us1
 /drxntKgVbujx+SHRlQ1qKiJUUv2pdZ7lZPrpPx14E8dzXGEheNLobC3P
 p+bM5ByMZRZERqF9r+ebdUuAKjarURlyQcsjB60odJyKfLtFjKrdDIPw/
 /Js3jATwhv7x2ALRgK0hW75yel+LrvA+coFFEn2I5ZrLLETezDkMq0c9L
 mTfvVpGHsYx1jUrLC2rFVGo74GhxzyaLh9iLe7CuGjrpR/SoCl7dehY+d
 cY1HF7xkgo11kPZQE8TN3C1bTnZZqRrPKdHlTO72rXyVCXzdwxVa+3Jc4 Q==;
X-CSE-ConnectionGUID: V21M1lh/QwWKex8EJHYcPA==
X-CSE-MsgGUID: T/AwK7ISSQu4rUjwsi3k0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11763"; a="100410723"
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; d="scan'208";a="100410723"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2026 14:18:56 -0700
X-CSE-ConnectionGUID: ihwzH5r+R9iKC6MRWqUWcw==
X-CSE-MsgGUID: 06/+oXh2SKG31gqPabI3vw==
X-ExtLoop1: 1
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.39.133])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2026 14:18:56 -0700
From: Matt Roper <matthew.d.roper@intel.com>
Date: Tue, 21 Apr 2026 14:18:34 -0700
Subject: [PATCH] drm/xe: Steer MCR for NODE/L3BANK according to L3 fusing
 on Xe2/Xe3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260421-xe2_l3bank_steering-v1-1-613158a27383@intel.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MTQqAIBBA4avIrBNq+u8qEWE22VBYaIQQ3T1p+
 Rbfe8CTY/LQiQcc3ez5sDGyRIBelTUkeY4NmGKVFpjJQDju+aTsNvqLIrZGtqjnqmhKlTc1RHk
 6Wjj813543w+90KqgZQAAAA==
X-Change-ID: 20260421-xe2_l3bank_steering-92cd6485a387
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4428;
 i=matthew.d.roper@intel.com; h=from:subject:message-id;
 bh=6lIAWm50whwp8deERudzrmLB6cPJOAEJU82D0z7oXkg=;
 b=owEBbQKS/ZANAwAKAU15JAXIcpAEAcsmYgBp5+m/4gcC0Itdn6PUR7Shg0jFoSJrd5ea84MC5
 XJuP1vsS+aJAjMEAAEKAB0WIQTCZ8MJRH/rTz8hbaxNeSQFyHKQBAUCaefpvwAKCRBNeSQFyHKQ
 BLusD/9nXf3cHZhu9PxahHpdJLfVPuIjsybekXCwElnRsi1RNrewQALSPQTYhXjkLkfBC1FUa5o
 G8xgZxOlFrpBFA/jivAdpp0lwXok1dq01Zic22hsyDdKYoZdFf05uqs3l8qkqMaGtqycbKbYeDy
 z6shZQwwMo6Bwsn29K3CRkcEM42pF+2HEZTzJtlTPmHZ4mWmufKgd7LxaXgX0mD9SufDSDMj02W
 WyQekRYTxj0So/blajJijbOlwBwPa3+bhQajmdRn4XzYhVoRJ30Hi/ztv61mXVsbDZM6mfviL9s
 ChlqcOgym6OJYBUPvN/tdck5xMRCIevV8MzHVB0XYKaeJ9gWvJeZfrXnA2wuZx44fYSxXQeUmAG
 WUgamiJXK3UAfGinkM6Y7Qx9L228iDgeyJr5tmzB31ntFJYZ+tbTCG555QqmEKKwS06Z+hY+eCg
 oPvb+GCdz29JK9HYBtHKI7NCVmDkYZGfpGXo7aV8RHXzQX33+HUFANTs0dUSBQ6meVgfCvj6wr3
 YwmLp0B7JRSApdfWE56hKgvnNcFYU7b2OLxT/BsFfiv+Hh34XF/cFkCdIo6hg3SsTPzHbxD5MZ7
 NYjNuKajAHeYkEyxlraVZPRX5YcUa9cjVB1Lf5XnGZ222SYGgnSP9zxHFKl59EPQBNvgAcnnxRT
 vwQjOKSe+fqkHTw==
X-Developer-Key: i=matthew.d.roper@intel.com; a=openpgp;
 fpr=C267C309447FEB4F3F216DAC4D792405C8729004
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

Although the bspec currently indicates that steered reads/writes to L3
register ranges are never terminated for physically present instances
(regardless of fusing) on Xe2, it turns out this is information is
incorrect.  The hardware architects have also confirmed that the current
documentation is wrong (or that possibly the wording was intended to be
interpreted in a different way), but have not yet provided an official
spec update.

All of our driver's writes to registers in these ranges are done as
multicast, so steering is not actually important to proper driver
operation; the only impact of this documentation mistake is that on some
fused-down SKUs where the first L3 bank is absent we're not able to
properly read back the values that were written to those registers to
confirm that the writes were applied correctly (e.g., when using the
register-save-restore-check debugfs interface).

Since we don't have an official spec update yet, let's assume that
Xe2/Xe3 use the same fuse => steering logic as Xe3p.  I.e., remove
L3BANK and NODE register ranges from the "INSTANCE0" steering group and
add handle them with dedicated handling according to the L3 fuses.  From
testing on various fused-down platforms this does appear to give proper
steering and fix the failures reported by IGT's
igt@xe_debugfs@check-gt-reg-sr test.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/7706
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_mcr.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
index 7c6f039c880d..89e105cee09b 100644
--- a/drivers/gpu/drm/xe/xe_gt_mcr.c
+++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
@@ -216,9 +216,7 @@ static const struct xe_mmio_range xe2lpg_sqidi_psmi_steering_table[] = {
 static const struct xe_mmio_range xe2lpg_instance0_steering_table[] = {
 	{ 0x004000, 0x004AFF },         /* GAM, rsvd, GAMWKR */
 	{ 0x008700, 0x00887F },         /* SQIDI, MEMPIPE */
-	{ 0x00B000, 0x00B3FF },         /* NODE, L3BANK */
 	{ 0x00C800, 0x00CFFF },         /* GAM */
-	{ 0x00D880, 0x00D8FF },         /* NODE */
 	{ 0x00DD00, 0x00DDFF },         /* MEMPIPE */
 	{ 0x00E900, 0x00E97F },         /* MEMPIPE */
 	{ 0x00F000, 0x00FFFF },         /* GAM, GAMWKR */
@@ -267,7 +265,7 @@ static const struct xe_mmio_range xe3p_xpc_gam_grp1_steering_table[] = {
 	{},
 };
 
-static const struct xe_mmio_range xe3p_xpc_node_steering_table[] = {
+static const struct xe_mmio_range xe2_node_steering_table[] = {
 	{ 0x00B000, 0x00B0FF },
 	{ 0x00D880, 0x00D8FF },
 	{},
@@ -298,7 +296,7 @@ static void init_steering_l3bank(struct xe_gt *gt)
 	struct xe_device *xe = gt_to_xe(gt);
 	struct xe_mmio *mmio = &gt->mmio;
 
-	if (GRAPHICS_VER(xe) >= 35) {
+	if (GRAPHICS_VER(xe) >= 20) {
 		unsigned int first_bank = xe_l3_bank_mask_ffs(gt->fuse_topo.l3_bank_mask);
 		const int banks_per_node = 4;
 		unsigned int node = first_bank / banks_per_node;
@@ -536,7 +534,7 @@ void xe_gt_mcr_init_early(struct xe_gt *gt)
 			gt->steering[GAM1].ranges = xe3p_xpc_gam_grp1_steering_table;
 			gt->steering[INSTANCE0].ranges = xe3p_xpc_instance0_steering_table;
 			gt->steering[L3BANK].ranges = xelpg_l3bank_steering_table;
-			gt->steering[NODE].ranges = xe3p_xpc_node_steering_table;
+			gt->steering[NODE].ranges = xe2_node_steering_table;
 		} else if (GRAPHICS_VERx100(xe) >= 3510) {
 			gt->steering[DSS].ranges = xe2lpg_dss_steering_table;
 			gt->steering[INSTANCE0].ranges = xe3p_lpg_instance0_steering_table;
@@ -544,6 +542,8 @@ void xe_gt_mcr_init_early(struct xe_gt *gt)
 			gt->steering[DSS].ranges = xe2lpg_dss_steering_table;
 			gt->steering[SQIDI_PSMI].ranges = xe2lpg_sqidi_psmi_steering_table;
 			gt->steering[INSTANCE0].ranges = xe2lpg_instance0_steering_table;
+			gt->steering[L3BANK].ranges = xelpg_l3bank_steering_table;
+			gt->steering[NODE].ranges = xe2_node_steering_table;
 		} else if (GRAPHICS_VERx100(xe) >= 1270) {
 			gt->steering[INSTANCE0].ranges = xelpg_instance0_steering_table;
 			gt->steering[L3BANK].ranges = xelpg_l3bank_steering_table;

---
base-commit: 33d3b65ec51f2bddafa26a80249e26c78435f169
change-id: 20260421-xe2_l3bank_steering-92cd6485a387

Best regards,
-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation


Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5254C5B572
	for <intel-xe@archiver.kernel.org>; Wed, 19 Aug 2026 07:26:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 910C410ED47;
	Wed, 19 Aug 2026 07:26:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IkOtRaG3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F01E10ED46
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Aug 2026 07:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787124411; x=1818660411;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wQIyrIA9nroMsBkrYAm9zZQoXAYwuNLwA+hQBm8YCOg=;
 b=IkOtRaG33Wrd2biV+bnFDq7eJG5andEzvLKefKP/EqsryuApdV6wSIhn
 y97+iAsmaVrSD/+xpUMTMf0TsaDTV40pSGQFaaxSRPLeoltTb8ueZhu8I
 D6OTHBepOOzEc+RfZwbJBIoDs6TemPBkqTktSQJ/HTQEaH3M+3efsfks3
 v55BtqoZ4IEEY9vXVuLgWy9N7fbOGS7S6RtxbCSfW7Tr/s3SL6GdPbfVp
 u7w3cC0db93kv/hXwp0UGTsQ2bqkHbfv6x1pnDat6c9ejCUNcdWoavh+a
 DZB71SUCrLLut2eYSjPypZT9Y3aSzAI8EqMeZ41S+HWLUIpEoKtQtwpwZ g==;
X-CSE-ConnectionGUID: MwtM31d3SvGn72qhdDdazw==
X-CSE-MsgGUID: q7JKds9MT+2oQJJNx2LDLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="97966134"
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; d="scan'208";a="97966134"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2026 00:26:51 -0700
X-CSE-ConnectionGUID: pHpSVSV/QxeoOSk20EMA2Q==
X-CSE-MsgGUID: VPzHxCstRwKK1AGFzBcdTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; d="scan'208";a="264143219"
Received: from bvivekan-desk.iind.intel.com ([10.190.238.63])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2026 00:26:50 -0700
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, badal.nilawar@intel.com,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Subject: [PATCH] drm/xe/xe_gt_idle: Add CCS to the powergating info print
Date: Wed, 19 Aug 2026 13:04:58 +0530
Message-ID: <20260819073457.1812722-2-balasubramani.vivekanandan@intel.com>
X-Mailer: git-send-email 2.43.0
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

While reading the main GT powergating info from debugfs, include both
RCS and CCS engine masks.

Fixes: 0914c1e45d3a1 ("drm/xe/xe_gt_idle: add debugfs entry for powergating info")
Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_idle.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
index 04b24e1c8b78e..7dc9873aef545 100644
--- a/drivers/gpu/drm/xe/xe_gt_idle.c
+++ b/drivers/gpu/drm/xe/xe_gt_idle.c
@@ -248,7 +248,8 @@ int xe_gt_idle_pg_print(struct xe_gt *gt, struct drm_printer *p)
 		pg_status = xe_mmio_read32(&gt->mmio, POWERGATE_DOMAIN_STATUS);
 	}
 
-	if (gt->info.engine_mask & XE_HW_ENGINE_RCS_MASK) {
+	if (gt->info.engine_mask &
+	    (XE_HW_ENGINE_RCS_MASK | XE_HW_ENGINE_CCS_MASK)) {
 		drm_printf(p, "Render Power Gating Enabled: %s\n",
 			   str_yes_no(pg_enabled & RENDER_POWERGATE_ENABLE));
 
-- 
2.43.0


Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37EF7C79FAA
	for <intel-xe@archiver.kernel.org>; Wed,  9 Sep 2026 07:27:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D295810EF7A;
	Wed,  9 Sep 2026 07:27:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bQvji9uJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8D5310EF7A
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Sep 2026 07:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788938831; x=1820474831;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=0ZOz4lKI4KHl8nCbSlS4uXSo1bzAaMyc/kgjlFOzuCI=;
 b=bQvji9uJnPtOOx8+rGZiEUXnopYTk7WoQ+SXlwwpKJsIMtspX6Wl1ZGR
 vMtvIwFrzRSvbl6xOrInjwOuzUJD7cJOGDByY4D+mdYy3dIEKroThVcHc
 qD+YBkjy9PROwQkys22znZeK6dqP6CBmTRR5X66NqY3K3U1moiO7AYrqK
 kFUOkPfLvI0oqjcAXX/mu5cxae2R1OLr7YLiFT4bg9tIH474WrN2j2sJ2
 mCJUeapkJve+jN9EyyT0GLO8AuLOGIhFHm+oOtp/4Ca3WonCg/kCSOlA8
 Z5I6TduEJeqMGQv4zMHhpjs8kehcn5L64Cal1eMbZosdNcEDri2kDlZZt Q==;
X-CSE-ConnectionGUID: QOXNO9J6TjG0XZgx2U2nZg==
X-CSE-MsgGUID: fSm9A0PSTreuJ+9PqWrwJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="89192996"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="89192996"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 00:27:11 -0700
X-CSE-ConnectionGUID: dEJqDI/RTQKJiBgCaR+JtQ==
X-CSE-MsgGUID: 4amYmIU0TM+jBFI0GPs0NQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="296175661"
Received: from tilak-z690i-a-ultra-plus.iind.intel.com ([10.190.239.38])
 by fmviesa001.fm.intel.com with ESMTP; 09 Sep 2026 00:27:09 -0700
From: tilak.tirumalesh.tangudu@intel.com
To: tilak.tirumalesh.tangudu@intel.com, vinay.belgaumkar@intel.com,
 tejas.upadhyay@intel.com, gustavo.sousa@intel.com,
 intel-xe@lists.freedesktop.org
Subject: [PATCH 1/2] drm/xe: harden adjust_idledly() against divide-by-zero
 and overflow
Date: Wed,  9 Sep 2026 12:55:39 +0530
Message-ID: <20260909072540.99303-2-tilak.tirumalesh.tangudu@intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20260909072540.99303-1-tilak.tirumalesh.tangudu@intel.com>
References: <20260909072540.99303-1-tilak.tirumalesh.tangudu@intel.com>
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

From: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>

adjust_idledly() has three corner-case issues flagged during review:

  1. If xe_gt_clock_init() failed to recognise the crystal clock,
     gt->info.timestamp_base is 0, which makes idledly_units_ps also 0.
     The subsequent DIV_ROUND_CLOSEST(..., idledly_units_ps) is then a
     divide-by-zero and panics the kernel.

  2. If IDLE_WAIT_TIME reads back as 0, maxcnt evaluates to 0.
     idledly >= maxcnt is then trivially true, so maxcnt - 1 wraps
     to 0xFFFFFFFF in u32 and that stale value is used to program
     RING_IDLEDLY.

  3. The tick-to-ns conversions are done in u32:
        idledly * idledly_units_ps, (maxcnt - 1) * 1000
     Both overflow u32 before DIV_ROUND_CLOSEST() sees them.

Warn and return early if timestamp_base is 0 (the unknown-crystal path).
Return early if IDLE_WAIT_TIME is 0. Do the tick-to-ns conversions in
u64 via DIV_ROUND_CLOSEST_ULL() so the intermediate product cannot wrap.

Fixes: d2de4410a88f ("drm/xe: Apply Wa_16023105232")
Cc: stable@vger.kernel.org
Assisted-by: GitHub_Copilot:claude-opus-4.8
Signed-off-by: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 010499766fce..6ffb0ece0561 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -594,18 +594,29 @@ static void adjust_idledly(struct xe_hw_engine *hwe)
 	bool inhibit_switch = 0;
 
 	if (!IS_SRIOV_VF(gt_to_xe(hwe->gt)) && XE_GT_WA(gt, 16023105232)) {
+		/* xe_gt_clock_init() zeroes timestamp_base on unknown crystal clock. */
+		if (!idledly_units_ps) {
+			xe_gt_warn(gt, "idledly WA skipped: timestamp_base is 0\n");
+			return;
+		}
+
 		idledly = xe_mmio_read32(&gt->mmio, RING_IDLEDLY(hwe->mmio_base));
 		maxcnt = xe_mmio_read32(&gt->mmio, RING_PWRCTX_MAXCNT(hwe->mmio_base));
 
 		inhibit_switch = idledly & INHIBIT_SWITCH_UNTIL_PREEMPTED;
 		idledly = REG_FIELD_GET(IDLE_DELAY, idledly);
-		idledly = DIV_ROUND_CLOSEST(idledly * idledly_units_ps, 1000);
+		idledly = DIV_ROUND_CLOSEST_ULL((u64)idledly * idledly_units_ps, 1000);
 		maxcnt = REG_FIELD_GET(IDLE_WAIT_TIME, maxcnt);
+
+		/* Return early rather than underflow maxcnt - 1 on a zero IDLE_WAIT_TIME. */
+		if (!maxcnt)
+			return;
+
 		maxcnt *= maxcnt_units_ns;
 
 		if (xe_gt_WARN_ON(gt, idledly >= maxcnt || inhibit_switch)) {
-			idledly = DIV_ROUND_CLOSEST(((maxcnt - 1) * 1000),
-						    idledly_units_ps);
+			idledly = DIV_ROUND_CLOSEST_ULL((u64)(maxcnt - 1) * 1000,
+							idledly_units_ps);
 			xe_mmio_write32(&gt->mmio, RING_IDLEDLY(hwe->mmio_base), idledly);
 		}
 	}
-- 
2.46.0


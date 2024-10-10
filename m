Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52F38CEDDBF
	for <intel-xe@archiver.kernel.org>; Thu, 10 Oct 2024 03:49:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2226510E846;
	Thu, 10 Oct 2024 03:49:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lo6mCim9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89F5B10E847
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Oct 2024 03:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728532149; x=1760068149;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+ZqYnPjdPK8nV65+8GSEaVUxQ51HjI5uuy5759ZbpZk=;
 b=lo6mCim9O7lGqZ8g19eEIdGaPbPbWad5Pa9JeWC6pMMf6MrEy2j7aDmn
 A1PHHwMS7WCBUOwoA8MlpEWwYRwMkMbgJG7bV4fzTaAi6vvpZYZgjUf3T
 3sb5DY/Cm63QlUZ4Ei2HC7hAw1ZmlSNab/iQiNp87ltfCM1XT9T9mVrcf
 XemUiySoyN/ks7l2Ov1AhbdBRfAjWHiAkWonq4/9Vx+Ld9tYiUfG/ngRf
 kABWxNMnJ8vZk+vPBfoYm8eX0Yz0GxoBLP++dyISc6Xc44Isil6pdkt9W
 OXFwjMEcgc7XBWB3h9eqty+ZqRfYhYvz/ZVR7ZBGBvnDeglDeJjAouZMm g==;
X-CSE-ConnectionGUID: td580HlkRtWAU1qZG/D88g==
X-CSE-MsgGUID: nZ96HwK7Q3uH/ovEv+y7Fg==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="39260301"
X-IronPort-AV: E=Sophos;i="6.11,191,1725346800"; d="scan'208";a="39260301"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2024 20:49:09 -0700
X-CSE-ConnectionGUID: +62RwIqHTYqazki5mkrAAQ==
X-CSE-MsgGUID: HycPIYUrSJK7upkCHBBEtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,191,1725346800"; d="scan'208";a="76353494"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2024 20:49:10 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Szymon Morek <szymon.morek@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 2/3] drm/xe/query: Move timestamp reg to hwe_read_timestamp()
Date: Wed,  9 Oct 2024 20:48:46 -0700
Message-ID: <20241010034847.389734-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241010034847.389734-1-lucas.demarchi@intel.com>
References: <20241010034847.389734-1-lucas.demarchi@intel.com>
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

__read_timestamps() is actually reading the timestamp from a certain
hwe. Use it as parameter, move register declarations to be inside that
function and rename it.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_query.c | 22 +++++++---------------
 1 file changed, 7 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index a1f4cc25bea68..d86959076b078 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -85,16 +85,13 @@ static __ktime_func_t __clock_id_to_func(clockid_t clk_id)
 }
 
 static void
-__read_timestamps(struct xe_gt *gt,
-		  struct xe_reg lower_reg,
-		  struct xe_reg upper_reg,
-		  u64 *engine_ts,
-		  u64 *cpu_ts,
-		  u64 *cpu_delta,
-		  __ktime_func_t cpu_clock)
+hwe_read_timestamp(struct xe_hw_engine *hwe, u64 *engine_ts, u64 *cpu_ts,
+		   u64 *cpu_delta, __ktime_func_t cpu_clock)
 {
-	struct xe_mmio *mmio = &gt->mmio;
+	struct xe_mmio *mmio = &hwe->gt->mmio;
 	u32 upper, lower, old_upper, loop = 0;
+	struct xe_reg upper_reg = RING_TIMESTAMP_UDW(hwe->mmio_base),
+		      lower_reg = RING_TIMESTAMP(hwe->mmio_base);
 
 	upper = xe_mmio_read32(mmio, upper_reg);
 	do {
@@ -155,13 +152,8 @@ query_engine_cycles(struct xe_device *xe,
 	if (xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL))
 		return -EIO;
 
-	__read_timestamps(gt,
-			  RING_TIMESTAMP(hwe->mmio_base),
-			  RING_TIMESTAMP_UDW(hwe->mmio_base),
-			  &resp.engine_cycles,
-			  &resp.cpu_timestamp,
-			  &resp.cpu_delta,
-			  cpu_clock);
+	hwe_read_timestamp(hwe, &resp.engine_cycles, &resp.cpu_timestamp,
+			   &resp.cpu_delta, cpu_clock);
 
 	xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 
-- 
2.46.2


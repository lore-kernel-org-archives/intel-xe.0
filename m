Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DB4FEE57C6
	for <intel-xe@archiver.kernel.org>; Fri,  8 Sep 2023 04:23:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56FC810E86B;
	Fri,  8 Sep 2023 04:23:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A32010E869
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Sep 2023 04:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694147037; x=1725683037;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YQfOU+GnjJEalRXSp2uuaIqHYghnA7/kydTmhvKwLyE=;
 b=NsDRqiES9QK668/miAPSFJO38CxUKeOjlyyFZqVE0e9fukuAsMZGDD1w
 X0TzxZY2F2P4GbtOqyQzztpD3TyYxHMD8wwGIBgXVOHFhQFapEEWCLfiY
 rKfxDHINlUMFaol8puqQzB4+BSZ73KRE2q3+gjpmvU7kWGiPAv2Q/BCvF
 FsWmxMzZjyUFE+Uqoy7e0HzlkL6Cwb5MEvtSX4gxfkbcRS/qk5gUfsgjW
 9bH9/uWdqbC4URtxH1mUcV7ZfjeUmCMdsX5AZx7QZMkkbo9EqVipni3Rv
 C4ICBEs2eqWLhb3+rEULqaWL7yb4AVQq5dDIVGXwe6c9gaFHl+x4WDWS3 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="463935407"
X-IronPort-AV: E=Sophos;i="6.02,236,1688454000"; d="scan'208";a="463935407"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2023 21:23:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="857200765"
X-IronPort-AV: E=Sophos;i="6.02,236,1688454000"; d="scan'208";a="857200765"
Received: from orsosgc001.jf.intel.com (HELO unerlige-ril.jf.intel.com)
 ([10.165.21.138])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2023 21:23:56 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  7 Sep 2023 21:23:47 -0700
Message-ID: <20230908042348.1592535-17-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230908042348.1592535-1-ashutosh.dixit@intel.com>
References: <20230908042348.1592535-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 16/17] drm/xe/oa: Make xe_oa_timestamp_frequency
 per gt
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

Clock freq's can be different for different gt's.

Suggested-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c    | 44 +++++++++++++++++------------------
 drivers/gpu/drm/xe/xe_oa.h    |  2 +-
 drivers/gpu/drm/xe/xe_query.c |  2 +-
 3 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index f43cbf5359871..eab19264b2f70 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -1496,7 +1496,7 @@ xe_oa_stream_open_ioctl_locked(struct xe_oa *oa,
  * platforms OA unit ignores the CTC_SHIFT and the 2 timestamps differ. In such
  * cases, return the adjusted CS timestamp frequency to the user.
  */
-u32 xe_oa_timestamp_frequency(struct xe_device *xe)
+u32 xe_oa_timestamp_frequency(struct xe_gt *gt)
 {
 	u32 reg, shift;
 
@@ -1505,26 +1505,26 @@ u32 xe_oa_timestamp_frequency(struct xe_device *xe)
 	 * Wa_14015568240:pvc
 	 * Wa_14015846243:mtl
 	 */
-	switch (xe->info.platform) {
+	switch (gt->tile->xe->info.platform) {
 	case XE_DG2:
 	case XE_PVC:
 	case XE_METEORLAKE:
-		xe_device_mem_access_get(xe);
-		reg = xe_mmio_read32(xe_root_mmio_gt(xe), RPM_CONFIG0);
-		xe_device_mem_access_put(xe);
+		xe_device_mem_access_get(gt->tile->xe);
+		reg = xe_mmio_read32(gt, RPM_CONFIG0);
+		xe_device_mem_access_put(gt->tile->xe);
 
 		shift = REG_FIELD_GET(RPM_CONFIG0_CTC_SHIFT_PARAMETER_MASK, reg);
-		return xe_root_mmio_gt(xe)->info.clock_freq << (3 - shift);
+		return gt->info.clock_freq << (3 - shift);
 
 	default:
-		return xe_root_mmio_gt(xe)->info.clock_freq;
+		return gt->info.clock_freq;
 	}
 }
 
-static u64 oa_exponent_to_ns(struct xe_oa *oa, int exponent)
+static u64 oa_exponent_to_ns(struct xe_gt *gt, int exponent)
 {
 	u64 nom = (2ULL << exponent) * NSEC_PER_SEC;
-	u32 den = xe_oa_timestamp_frequency(oa->xe);
+	u32 den = xe_oa_timestamp_frequency(gt);
 
 	return div_u64(nom + den - 1, den);
 }
@@ -1591,7 +1591,6 @@ static int xe_oa_read_properties_unlocked(struct xe_oa *oa, u64 __user *uprops,
 	instance = 0;
 
 	for (i = 0; i < n_props; i++) {
-		u64 oa_period, oa_freq_hz;
 		u64 id, value;
 
 		ret = get_user(id, uprop);
@@ -1631,18 +1630,6 @@ static int xe_oa_read_properties_unlocked(struct xe_oa *oa, u64 __user *uprops,
 					OA_EXPONENT_MAX);
 				return -EINVAL;
 			}
-
-			BUILD_BUG_ON(sizeof(oa_period) != 8);
-			oa_period = oa_exponent_to_ns(oa, value);
-
-			oa_freq_hz = div64_u64(NSEC_PER_SEC, oa_period);
-			if (oa_freq_hz > xe_oa_max_sample_rate && !perfmon_capable()) {
-				drm_dbg(&oa->xe->drm,
-					"OA exponent would exceed the max sampling frequency (sysctl dev.xe.oa_max_sample_rate) %uHz without CAP_PERFMON or CAP_SYS_ADMIN privileges\n",
-					  xe_oa_max_sample_rate);
-				return -EACCES;
-			}
-
 			props->oa_periodic = true;
 			props->oa_period_exponent = value;
 			break;
@@ -1701,6 +1688,19 @@ static int xe_oa_read_properties_unlocked(struct xe_oa *oa, u64 __user *uprops,
 		return -EINVAL;
 	}
 
+	if (props->oa_periodic) {
+		u64 oa_period, oa_freq_hz;
+
+		oa_period = oa_exponent_to_ns(props->hwe->gt, props->oa_period_exponent);
+		oa_freq_hz = div64_u64(NSEC_PER_SEC, oa_period);
+		if (oa_freq_hz > xe_oa_max_sample_rate && !perfmon_capable()) {
+			drm_dbg(&oa->xe->drm,
+				"OA exponent would exceed the max sampling frequency (sysctl dev.xe.oa_max_sample_rate) %uHz without CAP_PERFMON or CAP_SYS_ADMIN privileges\n",
+				xe_oa_max_sample_rate);
+			return -EACCES;
+		}
+	}
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_oa.h b/drivers/gpu/drm/xe/xe_oa.h
index 1f3d05067f19d..cc6f64bc24ddf 100644
--- a/drivers/gpu/drm/xe/xe_oa.h
+++ b/drivers/gpu/drm/xe/xe_oa.h
@@ -22,7 +22,7 @@ int xe_oa_add_config_ioctl(struct drm_device *dev, void *data,
 			   struct drm_file *file);
 int xe_oa_remove_config_ioctl(struct drm_device *dev, void *data,
 			      struct drm_file *file);
-u32 xe_oa_timestamp_frequency(struct xe_device *xe);
+u32 xe_oa_timestamp_frequency(struct xe_gt *gt);
 u16 xe_oa_unit_id(struct xe_hw_engine *hwe);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 8e0e19c82bd98..ab30bcdf954f3 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -247,7 +247,7 @@ static int query_gts(struct xe_device *xe, struct drm_xe_device_query *query)
 			gts->gts[id].type = XE_QUERY_GT_TYPE_MAIN;
 		gts->gts[id].instance = id;
 		gts->gts[id].clock_freq = gt->info.clock_freq;
-		gts->gts[id].oa_timestamp_freq = xe_oa_timestamp_frequency(xe);
+		gts->gts[id].oa_timestamp_freq = xe_oa_timestamp_frequency(gt);
 		if (!IS_DGFX(xe))
 			gts->gts[id].native_mem_regions = 0x1;
 		else
-- 
2.41.0


Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CF57CE79A8
	for <intel-xe@archiver.kernel.org>; Tue, 19 Sep 2023 16:16:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1747810E143;
	Tue, 19 Sep 2023 16:16:26 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DB1510E28F
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Sep 2023 16:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695140181; x=1726676181;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UQ9DzDBrzMM31zveyocpRMm5d5iWicgMWmbPKzW++4Y=;
 b=Z7YqSzWBURHktXmUXBd8thpebzhqwA4NY1Hu/FPNC1Jc0080eDM7ZhnH
 nSXoH0ReEJE/eM6JRvEVXEn7X3WEneOdGyUJFCbJT/P+aHRlPk3ty2nV6
 miNwF32umxA2qsYHiFmH5e900sZUVc5SNfr5mDkRY8cTyPva2Of3g4i75
 a/ZaKiN/rSzXXFeo4A71VB0NNDNxhpzZXj4JF4b6F4OSPf1RHALwO9Ia7
 w4VmN3JCbrGWy1whEYz0MWk8RgcnSInh3Yh5TVwq4vfcXVemFqWBuvZzj
 mbhKIjaC6xZ1AX44ffEBoFf+YsZN/2Bwp+F+za9c+oCH6W8jDJGwfIyKA Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="410913574"
X-IronPort-AV: E=Sophos;i="6.02,160,1688454000"; d="scan'208";a="410913574"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 09:10:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="870016548"
X-IronPort-AV: E=Sophos;i="6.02,160,1688454000"; d="scan'208";a="870016548"
Received: from orsosgc001.jf.intel.com (HELO unerlige-ril.jf.intel.com)
 ([10.165.21.138])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 09:10:54 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 19 Sep 2023 09:10:44 -0700
Message-ID: <20230919161049.2307855-17-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230919161049.2307855-1-ashutosh.dixit@intel.com>
References: <20230919161049.2307855-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 16/21] drm/xe/oa: Make xe_oa_timestamp_frequency
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
index d49debe732bbd..8648652e05aa5 100644
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
index 4a3a9c11e8cc4..ad280bac9eed4 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -244,7 +244,7 @@ static int query_gts(struct xe_device *xe, struct drm_xe_device_query *query)
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


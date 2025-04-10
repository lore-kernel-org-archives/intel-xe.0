Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C3C9C3601E
	for <intel-xe@archiver.kernel.org>; Thu, 10 Apr 2025 05:00:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38DC010E0E3;
	Thu, 10 Apr 2025 05:00:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NVhWPWhy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5140210E0E3
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Apr 2025 05:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744261207; x=1775797207;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=BNG1EM+ilIkFpmr1qhS8sJYGTUYTyGrLejS1IpF2xFg=;
 b=NVhWPWhyrCYkXeoNsJeNlZMDI+F5reSRUdIJn3/C/JzcgePbHYyU/WNk
 Q6FnF/lAkYI0YLrAddCa2UX+/p0YvRmhgxX3hlxVegGRM/v1HrKD8tqt6
 hhnft3CgiwSBoaaa4uc3vMkGQSQGx31kOz07p/+3aG6KHDi2OfhGiTtHd
 QaCQsCqYuYJEV5mnK3RHtfUPT14aA0p/TjQjPz/5DQK7gzQfMRGgUM6T3
 jRBeqlAQGxfDbJI3aF6pV4hX8Rq9Pg8EX8eZ8lzsU0rtUBwfhJtP4S3A+
 FQ/trpGZ1kWVvjjn2NxfBpzuuyiHmwkV22juS55sgF/YwyEQBwLPfDOFZ g==;
X-CSE-ConnectionGUID: K9BLWsRPSWSlKZr2e+Z5ZA==
X-CSE-MsgGUID: //3/39cBRnCkO8M3UHuDzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11399"; a="44900152"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="44900152"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2025 22:00:00 -0700
X-CSE-ConnectionGUID: y5CYNvz7SZyKqZu0VGm6sQ==
X-CSE-MsgGUID: fksGnh1cRUehvbWri41MEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="166002008"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2025 22:00:00 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Chee Yin Wong <chee.yin.wong@intel.com>,
 John Harrison <john.c.harrison@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH] drm/xe: Set LRC addresses before guc load
Date: Wed,  9 Apr 2025 21:59:34 -0700
Message-ID: <20250409-fix-guc-ads-v1-1-494135f7a5d0@intel.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20250409-fix-guc-ads-45fbf54c37de
X-Mailer: b4 0.15-dev-9a9c7
Content-Transfer-Encoding: quoted-printable
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

The metadata saved in the ADS is read by GuC when it's initialized.=0D
Saving the addresses to the LRCs when they are populated is too late as=0D
GuC will keep using the old ones.=0D
=0D
This was causing GuC to use the RCS LRC for any engine class. It's not a=0D
big problem on a Linux-only scenario since the they are used by GuC only=0D
on media engines when the watchdog is triggered. However, in a=0D
virtualization scenario with Windows as the VF, it causes the wrong LRCs=0D
to be loaded as the watchdog is used for all engines.=0D
=0D
Fix it by letting guc_golden_lrc_init() initialize the metadata, like=0D
other *_init() functions, and later guc_golden_lrc_populate() to copy=0D
the LRCs to the right places. The former is called before the second GuC=0D
load, while the latter is called after LRCs have been recorded.=0D
=0D
Cc: Chee Yin Wong <chee.yin.wong@intel.com>=0D
Cc: John Harrison <john.c.harrison@intel.com>=0D
Cc: Matt Roper <matthew.d.roper@intel.com>=0D
Cc: Matthew Brost <matthew.brost@intel.com>=0D
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>=0D
---=0D
 drivers/gpu/drm/xe/xe_guc_ads.c | 75 ++++++++++++++++++++++++-------------=
----=0D
 1 file changed, 45 insertions(+), 30 deletions(-)=0D
=0D
diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ad=
s.c=0D
index 88400f249e614..2a227213c37ff 100644=0D
--- a/drivers/gpu/drm/xe/xe_guc_ads.c=0D
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c=0D
@@ -491,24 +491,52 @@ static void fill_engine_enable_masks(struct xe_gt *gt=
,=0D
 		       engine_enable_mask(gt, XE_ENGINE_CLASS_OTHER));=0D
 }=0D
 =0D
-static void guc_prep_golden_lrc_null(struct xe_guc_ads *ads)=0D
+/*=0D
+ * Write the offsets corresponding to the golden LRCs. The actual data is=
=0D
+ * populated later by guc_golden_lrc_populate()=0D
+ */=0D
+static void guc_golden_lrc_init(struct xe_guc_ads *ads)=0D
 {=0D
 	struct xe_device *xe =3D ads_to_xe(ads);=0D
+	struct xe_gt *gt =3D ads_to_gt(ads);=0D
 	struct iosys_map info_map =3D IOSYS_MAP_INIT_OFFSET(ads_to_map(ads),=0D
 			offsetof(struct __guc_ads_blob, system_info));=0D
-	u8 guc_class;=0D
+	size_t alloc_size, real_size;=0D
+	u32 addr_ggtt, offset;=0D
+	int class;=0D
+=0D
+	offset =3D guc_ads_golden_lrc_offset(ads);=0D
+	addr_ggtt =3D xe_bo_ggtt_addr(ads->bo) + offset;=0D
+=0D
+	for (class =3D 0; class < XE_ENGINE_CLASS_MAX; ++class) {=0D
+		u8 guc_class;=0D
+=0D
+		guc_class =3D xe_engine_class_to_guc_class(class);=0D
 =0D
-	for (guc_class =3D 0; guc_class <=3D GUC_MAX_ENGINE_CLASSES; ++guc_class)=
 {=0D
 		if (!info_map_read(xe, &info_map,=0D
 				   engine_enabled_masks[guc_class]))=0D
 			continue;=0D
 =0D
+		real_size =3D xe_gt_lrc_size(gt, class);=0D
+		alloc_size =3D PAGE_ALIGN(real_size);=0D
+=0D
+		/*=0D
+		 * This interface is slightly confusing. We need to pass the=0D
+		 * base address of the full golden context and the size of just=0D
+		 * the engine state, which is the section of the context image=0D
+		 * that starts after the execlists LRC registers. This is=0D
+		 * required to allow the GuC to restore just the engine state=0D
+		 * when a watchdog reset occurs.=0D
+		 * We calculate the engine state size by removing the size of=0D
+		 * what comes before it in the context image (which is identical=0D
+		 * on all engines).=0D
+		 */=0D
 		ads_blob_write(ads, ads.eng_state_size[guc_class],=0D
-			       guc_ads_golden_lrc_size(ads) -=0D
-			       xe_lrc_skip_size(xe));=0D
+			       real_size - xe_lrc_skip_size(xe));=0D
 		ads_blob_write(ads, ads.golden_context_lrca[guc_class],=0D
-			       xe_bo_ggtt_addr(ads->bo) +=0D
-			       guc_ads_golden_lrc_offset(ads));=0D
+			       addr_ggtt);=0D
+=0D
+		addr_ggtt +=3D alloc_size;=0D
 	}=0D
 }=0D
 =0D
@@ -858,7 +886,7 @@ void xe_guc_ads_populate_minimal(struct xe_guc_ads *ads=
)=0D
 =0D
 	xe_map_memset(ads_to_xe(ads), ads_to_map(ads), 0, 0, ads->bo->size);=0D
 	guc_policies_init(ads);=0D
-	guc_prep_golden_lrc_null(ads);=0D
+	guc_golden_lrc_init(ads);=0D
 	guc_mapping_table_init_invalid(gt, &info_map);=0D
 	guc_doorbell_init(ads);=0D
 =0D
@@ -884,7 +912,7 @@ void xe_guc_ads_populate(struct xe_guc_ads *ads)=0D
 	guc_policies_init(ads);=0D
 	fill_engine_enable_masks(gt, &info_map);=0D
 	guc_mmio_reg_state_init(ads);=0D
-	guc_prep_golden_lrc_null(ads);=0D
+	guc_golden_lrc_init(ads);=0D
 	guc_mapping_table_init(gt, &info_map);=0D
 	guc_capture_prep_lists(ads);=0D
 	guc_doorbell_init(ads);=0D
@@ -904,18 +932,22 @@ void xe_guc_ads_populate(struct xe_guc_ads *ads)=0D
 		       guc_ads_private_data_offset(ads));=0D
 }=0D
 =0D
-static void guc_populate_golden_lrc(struct xe_guc_ads *ads)=0D
+/*=0D
+ * After the golden LRC's are recorded for each engine class by the first=
=0D
+ * submission, copy them to the ADS, as initialized earlier by=0D
+ * guc_golden_lrc_init().=0D
+ */=0D
+static void guc_golden_lrc_populate(struct xe_guc_ads *ads)=0D
 {=0D
 	struct xe_device *xe =3D ads_to_xe(ads);=0D
 	struct xe_gt *gt =3D ads_to_gt(ads);=0D
 	struct iosys_map info_map =3D IOSYS_MAP_INIT_OFFSET(ads_to_map(ads),=0D
 			offsetof(struct __guc_ads_blob, system_info));=0D
 	size_t total_size =3D 0, alloc_size, real_size;=0D
-	u32 addr_ggtt, offset;=0D
+	u32 offset;=0D
 	int class;=0D
 =0D
 	offset =3D guc_ads_golden_lrc_offset(ads);=0D
-	addr_ggtt =3D xe_bo_ggtt_addr(ads->bo) + offset;=0D
 =0D
 	for (class =3D 0; class < XE_ENGINE_CLASS_MAX; ++class) {=0D
 		u8 guc_class;=0D
@@ -932,26 +964,9 @@ static void guc_populate_golden_lrc(struct xe_guc_ads =
*ads)=0D
 		alloc_size =3D PAGE_ALIGN(real_size);=0D
 		total_size +=3D alloc_size;=0D
 =0D
-		/*=0D
-		 * This interface is slightly confusing. We need to pass the=0D
-		 * base address of the full golden context and the size of just=0D
-		 * the engine state, which is the section of the context image=0D
-		 * that starts after the execlists LRC registers. This is=0D
-		 * required to allow the GuC to restore just the engine state=0D
-		 * when a watchdog reset occurs.=0D
-		 * We calculate the engine state size by removing the size of=0D
-		 * what comes before it in the context image (which is identical=0D
-		 * on all engines).=0D
-		 */=0D
-		ads_blob_write(ads, ads.eng_state_size[guc_class],=0D
-			       real_size - xe_lrc_skip_size(xe));=0D
-		ads_blob_write(ads, ads.golden_context_lrca[guc_class],=0D
-			       addr_ggtt);=0D
-=0D
 		xe_map_memcpy_to(xe, ads_to_map(ads), offset,=0D
 				 gt->default_lrc[class], real_size);=0D
 =0D
-		addr_ggtt +=3D alloc_size;=0D
 		offset +=3D alloc_size;=0D
 	}=0D
 =0D
@@ -960,7 +975,7 @@ static void guc_populate_golden_lrc(struct xe_guc_ads *=
ads)=0D
 =0D
 void xe_guc_ads_populate_post_load(struct xe_guc_ads *ads)=0D
 {=0D
-	guc_populate_golden_lrc(ads);=0D
+	guc_golden_lrc_populate(ads);=0D
 }=0D
 =0D
 static int guc_ads_action_update_policies(struct xe_guc_ads *ads, u32 poli=
cy_offset)=0D
=0D
=0D
=0D

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 882AACE79B0
	for <intel-xe@archiver.kernel.org>; Tue, 19 Sep 2023 16:16:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51C0410E299;
	Tue, 19 Sep 2023 16:16:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76A9910E143
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Sep 2023 16:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695140180; x=1726676180;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PVyZOGT4NwyA4X8SvqqLgnk/jMP761oBzvxlPShgnOY=;
 b=WzvMRyMP18AYwf37RG2+6Bl1ABr3ybWRYKcq1lpURrvptAxOnMA9sN6W
 TboSbQsVZenn+AErtYyAjEVZ6yx/zZP6JZ8YUCRUOI+mWSI39PNUtpvCc
 wpiYNldEf3GEBnvXyqmXNx7zOoZTzo+tAqIvo1SVtuxHjxNjCr14lyISc
 k+3NyrYVnl2EGBYVFhJMK6cra/nd9sT5OUv8sP+27q30aNNINmmNjYQD/
 xBob3vUpq3ZU26wxvX2uWQLlHohswnNjZFd3z5p7zNCt4uYM35DczrWrE
 998r3RY77gl1rQPCyaaUofDvbjh+T0zFma5xZeTFGhRkCDaV++3j/se1e A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="410913557"
X-IronPort-AV: E=Sophos;i="6.02,160,1688454000"; d="scan'208";a="410913557"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 09:10:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="870016530"
X-IronPort-AV: E=Sophos;i="6.02,160,1688454000"; d="scan'208";a="870016530"
Received: from orsosgc001.jf.intel.com (HELO unerlige-ril.jf.intel.com)
 ([10.165.21.138])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 09:10:54 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 19 Sep 2023 09:10:38 -0700
Message-ID: <20230919161049.2307855-11-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230919161049.2307855-1-ashutosh.dixit@intel.com>
References: <20230919161049.2307855-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 10/21] drm/xe/oa: Implement queries
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

Implement queries to query OA unit ID's for HW engines, OA timestamp freq
and OA ioctl version.

v2: Convert oa_unit_id to u16 (Umesh)

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c    | 11 +++++++++++
 drivers/gpu/drm/xe/xe_oa.h    |  3 +++
 drivers/gpu/drm/xe/xe_query.c |  6 +++++-
 3 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index d6d9dcc5c0bda..fc0159543dc74 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -2212,6 +2212,12 @@ static int xe_oa_init_engine_groups(struct xe_oa *oa)
 	return 0;
 }
 
+u16 xe_oa_unit_id(struct xe_hw_engine *hwe)
+{
+	return hwe->oa_group && hwe->oa_group->num_engines ?
+		hwe->oa_group->oa_unit_id : U16_MAX;
+}
+
 static void oa_format_add(struct xe_oa *oa, enum drm_xe_oa_format format)
 {
 	__set_bit(format, oa->format_mask);
@@ -2325,6 +2331,11 @@ static struct ctl_table oa_ctl_table[] = {
 	{}
 };
 
+int xe_oa_ioctl_version(struct xe_device *xe)
+{
+	return 1;
+}
+
 int xe_oa_sysctl_register(void)
 {
 	sysctl_header = register_sysctl("dev/xe", oa_ctl_table);
diff --git a/drivers/gpu/drm/xe/xe_oa.h b/drivers/gpu/drm/xe/xe_oa.h
index fd6caf652047a..1f3d05067f19d 100644
--- a/drivers/gpu/drm/xe/xe_oa.h
+++ b/drivers/gpu/drm/xe/xe_oa.h
@@ -22,4 +22,7 @@ int xe_oa_add_config_ioctl(struct drm_device *dev, void *data,
 			   struct drm_file *file);
 int xe_oa_remove_config_ioctl(struct drm_device *dev, void *data,
 			      struct drm_file *file);
+u32 xe_oa_timestamp_frequency(struct xe_device *xe);
+u16 xe_oa_unit_id(struct xe_hw_engine *hwe);
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index a951205100fea..4a3a9c11e8cc4 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -78,7 +78,9 @@ static int query_engines(struct xe_device *xe,
 				xe_to_user_engine_class[hwe->class];
 			hw_engine_info[i].engine_instance =
 				hwe->logical_instance;
-			hw_engine_info[i++].gt_id = gt->info.id;
+			hw_engine_info[i].gt_id = gt->info.id;
+			hw_engine_info[i].oa_unit_id = xe_oa_unit_id(hwe);
+			i++;
 		}
 
 	if (copy_to_user(query_ptr, hw_engine_info, size)) {
@@ -200,6 +202,7 @@ static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
 		hweight_long(xe->info.mem_region_mask);
 	config->info[XE_QUERY_CONFIG_MAX_ENGINE_PRIORITY] =
 		xe_exec_queue_device_get_max_priority(xe);
+	config->info[XE_QUERY_OA_IOCTL_VERSION] = xe_oa_ioctl_version(xe);
 
 	if (copy_to_user(query_ptr, config, size)) {
 		kfree(config);
@@ -241,6 +244,7 @@ static int query_gts(struct xe_device *xe, struct drm_xe_device_query *query)
 			gts->gts[id].type = XE_QUERY_GT_TYPE_MAIN;
 		gts->gts[id].instance = id;
 		gts->gts[id].clock_freq = gt->info.clock_freq;
+		gts->gts[id].oa_timestamp_freq = xe_oa_timestamp_frequency(xe);
 		if (!IS_DGFX(xe))
 			gts->gts[id].native_mem_regions = 0x1;
 		else
-- 
2.41.0


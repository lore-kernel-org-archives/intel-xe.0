Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5D3FEB64DA
	for <intel-xe@archiver.kernel.org>; Fri, 21 Jul 2023 00:30:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9896C10E607;
	Fri, 21 Jul 2023 00:30:24 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2071610E165
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Jul 2023 00:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689899413; x=1721435413;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=4CtkPBPRgWQ1Q6mq6IYwEA4BrsskWfPIMBpSJRMs1wk=;
 b=Z9ODAg2FOn6Q2AWteSILU0Fbw6tvAW0ZErGfDDK7YUmrZVHc+RuEodRE
 90M0aNGFNOfbHOwCrvYv+0KH/j4KFTkjc2or26Qhf1f6yyypmIRbPSEgO
 MJ+kQj1C+5OK4sCBRtl1JXQEzk6920e5ZsCvjPEYIRdgtGs7xYZMLH4zh
 sbAg8kyrBvntOAxPj/9P0kuTXP+OcOGufQEfi13fXhKUUwrW1oBk3DilM
 eT/Wx0js9oreljHZjTa+g4QBjDSBhwKHisjKRh2a9oee4ZjJZNgLqQnTM
 wYQP0T6aklCD+w8BOKuL8fhvP4ouvdfhZgrYjfcRIEnJU/mNWC36V248r w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="366935004"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200"; d="scan'208";a="366935004"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2023 17:30:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="790015288"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200"; d="scan'208";a="790015288"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2023 17:30:12 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 20 Jul 2023 17:30:06 -0700
Message-ID: <20230721003006.3467377-11-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230721003006.3467377-1-ashutosh.dixit@intel.com>
References: <20230721003006.3467377-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 10/10] drm/xe/oa: Implement queries
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

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c    | 11 +++++++++++
 drivers/gpu/drm/xe/xe_oa.h    |  3 +++
 drivers/gpu/drm/xe/xe_query.c |  5 ++++-
 3 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 163f057213258..8be7f6cf17930 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -2221,6 +2221,12 @@ static int xe_oa_init_engine_groups(struct xe_oa *oa)
 	return 0;
 }
 
+u32 xe_oa_unit_id(struct xe_hw_engine *hwe)
+{
+	return hwe->oa_group && hwe->oa_group->num_engines ?
+		hwe->oa_group->oa_unit_id : U32_MAX;
+}
+
 static void oa_format_add(struct xe_oa *oa, enum drm_xe_oa_format format)
 {
 	__set_bit(format, oa->format_mask);
@@ -2335,6 +2341,11 @@ static struct ctl_table oa_ctl_table[] = {
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
index fd6caf652047a..41a7d8b0f10e1 100644
--- a/drivers/gpu/drm/xe/xe_oa.h
+++ b/drivers/gpu/drm/xe/xe_oa.h
@@ -22,4 +22,7 @@ int xe_oa_add_config_ioctl(struct drm_device *dev, void *data,
 			   struct drm_file *file);
 int xe_oa_remove_config_ioctl(struct drm_device *dev, void *data,
 			      struct drm_file *file);
+u32 xe_oa_timestamp_frequency(struct xe_device *xe);
+u32 xe_oa_unit_id(struct xe_hw_engine *hwe);
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index f880c9af1651a..8acde018650cc 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -77,7 +77,8 @@ static int query_engines(struct xe_device *xe,
 				xe_to_user_engine_class[hwe->class];
 			hw_engine_info[i].engine_instance =
 				hwe->logical_instance;
-			hw_engine_info[i++].gt_id = gt->info.id;
+			hw_engine_info[i].gt_id = gt->info.id;
+			hw_engine_info[i++].oa_unit_id = xe_oa_unit_id(hwe);
 		}
 
 	if (copy_to_user(query_ptr, hw_engine_info, size)) {
@@ -203,6 +204,7 @@ static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
 		hweight_long(xe->info.mem_region_mask);
 	config->info[XE_QUERY_CONFIG_MAX_ENGINE_PRIORITY] =
 		xe_engine_device_get_max_priority(xe);
+	config->info[XE_QUERY_OA_IOCTL_VERSION] = xe_oa_ioctl_version(xe);
 
 	if (copy_to_user(query_ptr, config, size)) {
 		kfree(config);
@@ -244,6 +246,7 @@ static int query_gts(struct xe_device *xe, struct drm_xe_device_query *query)
 			gts->gts[id].type = XE_QUERY_GT_TYPE_MAIN;
 		gts->gts[id].instance = id;
 		gts->gts[id].clock_freq = gt->info.clock_freq;
+		gts->gts[id].oa_timestamp_freq = xe_oa_timestamp_frequency(xe);
 		if (!IS_DGFX(xe))
 			gts->gts[id].native_mem_regions = 0x1;
 		else
-- 
2.41.0


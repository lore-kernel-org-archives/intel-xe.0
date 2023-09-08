Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BF3CEE57C5
	for <intel-xe@archiver.kernel.org>; Fri,  8 Sep 2023 04:23:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44DA010E86A;
	Fri,  8 Sep 2023 04:23:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C796B10E861
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Sep 2023 04:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694147035; x=1725683035;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=faEKvTli8v18DL9XBpf663O4aPsgvKgEC9gyzCCvKoY=;
 b=WMeGPfMWclaz6YlOAQWrH7keh4kvGghsIXRiHP2IWWu9pzv2JObyanRh
 m6ubjx6vNL+8ESeRdlTGgb125V1eDxodz7IFZ4sXpF/NjqjTpGqo0K7ne
 FAAV0qdHj5iRR3AiXRX7/2wCVV8OJXpYP+prJnGp6e1iO3CGNAz0YzP6N
 ejo/vWU1vWEgMzCrBNHQm8DNUoe/w9FGNuSKrcFLVIjkM6mePLEMTLzX2
 rZUuh3ZZnsw8WLjPXMVfIz03nPOnqdR5A5c6wCsBYgJS/2+kgsLQf9E9b
 ueKAjAHobeRgoU9FpDVgI7rHziHrwNT8bYe9EmmG2klXwAoW28u+455XJ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="463935398"
X-IronPort-AV: E=Sophos;i="6.02,236,1688454000"; d="scan'208";a="463935398"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2023 21:23:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="857200741"
X-IronPort-AV: E=Sophos;i="6.02,236,1688454000"; d="scan'208";a="857200741"
Received: from orsosgc001.jf.intel.com (HELO unerlige-ril.jf.intel.com)
 ([10.165.21.138])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2023 21:23:55 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  7 Sep 2023 21:23:41 -0700
Message-ID: <20230908042348.1592535-11-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230908042348.1592535-1-ashutosh.dixit@intel.com>
References: <20230908042348.1592535-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 10/17] drm/xe/oa: Implement queries
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
index f9d6fb9b75c26..0fbe646284c87 100644
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
@@ -2326,6 +2332,11 @@ static struct ctl_table oa_ctl_table[] = {
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
index 1db77a7c90398..8e0e19c82bd98 100644
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
@@ -203,6 +205,7 @@ static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
 		hweight_long(xe->info.mem_region_mask);
 	config->info[XE_QUERY_CONFIG_MAX_ENGINE_PRIORITY] =
 		xe_exec_queue_device_get_max_priority(xe);
+	config->info[XE_QUERY_OA_IOCTL_VERSION] = xe_oa_ioctl_version(xe);
 
 	if (copy_to_user(query_ptr, config, size)) {
 		kfree(config);
@@ -244,6 +247,7 @@ static int query_gts(struct xe_device *xe, struct drm_xe_device_query *query)
 			gts->gts[id].type = XE_QUERY_GT_TYPE_MAIN;
 		gts->gts[id].instance = id;
 		gts->gts[id].clock_freq = gt->info.clock_freq;
+		gts->gts[id].oa_timestamp_freq = xe_oa_timestamp_frequency(xe);
 		if (!IS_DGFX(xe))
 			gts->gts[id].native_mem_regions = 0x1;
 		else
-- 
2.41.0


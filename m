Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0693FCD5BCA
	for <intel-xe@archiver.kernel.org>; Tue, 19 Sep 2023 14:25:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8EFD10E284;
	Tue, 19 Sep 2023 14:25:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B5D110E284
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Sep 2023 14:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695133532; x=1726669532;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=qCIQnouJ8RX+BO7OWXViNoFQLdladP8vtJZx1XgFBzc=;
 b=koh0vbBNB6ZgdUZNNN3s9iUF2sSfUIVrbJ42Z+tcSIJk+yXJLhHZUJk1
 zgALHBqi/EDMAF2+CcqcLX/CWR1Yp0v+TyQWdZnZKbL4Agda1uHiqMj0h
 gj48Yn+DPizxf63X8+vjH7d3Huuptw+2YQ1oMwDp7fVWECYDLWQRUuZKn
 JszlvPvCBMVVeJ9tOue+4GQ2d5kG+p+kkPXH0LRK1/uw0ju6FPmKH0r07
 DXt/5Amh5i28biN2Ro6I5TtYWvw8fHfLJ3FuumRsRu2ryyCUR7rBEzbge
 8UJXKYycYSxuAqZJb19mfWsdcAOtX14Y4OX1GjlVBd+878r7xrhvNIOT8 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="466278534"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; d="scan'208";a="466278534"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 07:25:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="695924291"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; d="scan'208";a="695924291"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Sep 2023 07:25:31 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 19 Sep 2023 07:25:31 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 19 Sep 2023 07:25:30 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 19 Sep 2023 07:25:30 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.174)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 19 Sep 2023 07:25:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O+UuGQWv0vYMV8hArWReqmhv48flICGVzEHxu2GdXnOmRVYFmDNdgpVxMEsKq90fyBiVWQ1oUkXIm24/oyOzcWohcTohsPkL57tcXxa2P6f0Ir2+nBC3R/bIxRQTBaaw3G13ZyJX8l/5Evz/CDJYasePSMEetjPqv6iR9+KZ7ovReHLqdzwiQOvTHpGLbL4gRTNu3HAaQluuW6ChybvsoR++5ZXGzaGQ+goNQBzI6pRARlhB3XITP2YIbdxNWhJ/pNA+ikjsM0eJoapy11vcR9IC6ZR0KM0dIiJU9+IyLXHC9uKeFTBuTb3KdIqi60IBoynqBWWIbIsKpVcUrdZVvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AXfDB6+41obY9GjbqemnLnhvoV1YUJHJsEwn1mMnL1A=;
 b=dFlt7hp310ldPtRn62/8Q9M6kdCUD1z8dyvAvkvbPyCIauEEmNGvHe2Gs7U66tNbhxF2St8qJk8lbjyUKLCfF4vjQV5jJ/bk1znEEuvEzar4/zJakB2aKcTdZHgGwbM1ZCvmCkuVjloaLSunWezOXcG7Jwzz4iBhb3GT1fXC9FPPo6q8PbocyERfjGvIqqvFW3QpxKU3tm/FuqU/6MmfXC/cTKeUJkvUtO6B43PtlLtCOUJpjlMuBK2UEDAtrPizfkygnwsugRv2oKvuo8/IqTe9/FN/Tjo+KH738PcZ5ZfF1sH8X306vTh543qz4UaTUmj65JNHkXp8I1DLdgBKhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CO6PR11MB5585.namprd11.prod.outlook.com (2603:10b6:5:356::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.28; Tue, 19 Sep
 2023 14:25:19 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%6]) with mapi id 15.20.6792.022; Tue, 19 Sep 2023
 14:25:19 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue, 19 Sep 2023 10:24:50 -0400
Message-ID: <20230919142504.91652-4-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230919142504.91652-1-rodrigo.vivi@intel.com>
References: <20230919142504.91652-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0001.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::6) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CO6PR11MB5585:EE_
X-MS-Office365-Filtering-Correlation-Id: 08d4ed36-83ef-49d6-73ac-08dbb91c4066
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uPrkkVIq4gtTiFD3e71FoogTFpQnXRr6+sShquuK6/NsmPKwXGrZWo+bGPitKAXwHG9JPeC0jyQ5oKu5Ls6zqEHselPWrOkN8NaPKD3mqSRwrBZamsC2voQuxIt1fhYaR9ufhTGhqWsftRp/dtuW+TFgU2uD0zZPDOQ2E4VNi4Op+Xy+m2RdBUEFIyIhDOmx54QK6TEns4zdX8in2PdQNRwQ14TdNQT3lwUOHvt3FdzVBfOsFVhYwjviNuUAjSuQzWiVZ9n7FhZEns2oNqtxEIMP8WU4QVHWmRzhzUyHSB8LjXehHUCLrY691Lus2sJw94rpurI+V5e5N9BpVlT1Bq8zt7C5HG0V3/r5BN1vrmibPwx5BJ1ghSuemDTJysPOTYm+iGi6XmiIvI6unu/edcQMmIF04etYdL/u4bCRNEXvbk1iMvIXUDQ7v+BPXNvZy/sWbDAk3GdRLyNe1GgE+0EM2zhvCRlN5XlCYnflVqSh+QTo/Oklb6q/LQsL814qQhKaDK9x7J7e9WEIrrdfg2wIWB+N5roLDwCBSVWRNyA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(396003)(39860400002)(346002)(376002)(451199024)(1800799009)(186009)(36756003)(44832011)(5660300002)(83380400001)(86362001)(4326008)(8936002)(8676002)(41300700001)(6506007)(6486002)(6666004)(82960400001)(107886003)(26005)(1076003)(2616005)(6512007)(66946007)(478600001)(2906002)(966005)(38100700002)(6916009)(316002)(66476007)(66556008)(54906003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ONRY+1NiSl4nz0d2Pq9+fRlaWCkOPtZTph2fDKnEAPtKl+TISgz77DwdNZQY?=
 =?us-ascii?Q?hu8TFgICcI1Lm1agcy11v8j47V7Y+9G946T6t1bRHbxQybrmZ2/vLpG/zBy8?=
 =?us-ascii?Q?rSzLcNLIQmmrrPB/Ovn2J36fRHXYAlCefsUQ4RPW1y9T9vAPgHPI7zsEB/A8?=
 =?us-ascii?Q?hJ+DVk5kgpNQwGjJNszqccZG1Y0vDYbXTzsPbBJEy3icbAfxWGeWCZqeAHLm?=
 =?us-ascii?Q?ECtUsg+VhxjT4WSrcYLg5mxYGxeTlJ8uFluTjhHoM4HOUmRWsCqAOFGyo4lO?=
 =?us-ascii?Q?bkDIt7saTeytVv92byfiM2sGALLyL4V4ndw3H2bOIwqcIDP4sp6AGx3Ejlsg?=
 =?us-ascii?Q?14TmFqFGQLUcxoTGbVb0QfHswe2dO+ML9OSG3BoJjUJ8Fsfbcs3iUmM1438c?=
 =?us-ascii?Q?CpJSBNNIRI+HEhPOrhTza2XkKL4EeOopBctM+zc9C5ZSRfeC8V0uHSj1V6V5?=
 =?us-ascii?Q?4/sJe+vUX/Au7JEyfxmBmXpZm/xSpVh2FWDaLRBdSqPQLFws+Y8jZ5hshOLa?=
 =?us-ascii?Q?1vlhSR0w1zDyij0OsVyoaMXfdZ08O/11E/JX49sin7U69oOX2mRzKY5TaqqR?=
 =?us-ascii?Q?4bi497QMfrPJL4WeSHl9OzIu3deUfKHNkN8De6amXk8J9C0KO3vgGv/f/G60?=
 =?us-ascii?Q?MGx9kBe+9o0g2oqkxxmDqPkzz0pUVFkjVxlXAGCzb2Fs1WWhPLs4VrqILEco?=
 =?us-ascii?Q?fVJvAXb3pAyORLTIpzge+vLNAcnGQRti08NrZQ0R4D9FrG/+d+jGUqz90UMR?=
 =?us-ascii?Q?DWcLoJ3sqct6I/a7HpbbwZyl3d2EkZNVf3Tsw5+o8V25fkZcqyZ64g2E+8wV?=
 =?us-ascii?Q?2JQRmz/EHFqHrn6dczK56i0D1/g6LEBL3u4E8HxoiiFmUKEmnIhUClE9cRTl?=
 =?us-ascii?Q?1VHINbJyCI3gMVQ2CA91pG5LEXtsEaqdN+lqHMQMca5qX+p0aL2oJu+DEd2+?=
 =?us-ascii?Q?ER7ySqNoDd+3WmoPQq//oaE25vHpi4DoS9zVRCWjcy4EbRxBiThsftfjlOa0?=
 =?us-ascii?Q?k2H3jS2c1cn/aiqYmxOtX1xEV0l+aCCLQyEvvxahSxrFYsshlrx30K9AVR4r?=
 =?us-ascii?Q?wzWsWGqhY/HIZRKnOUXeUUi4IQCsxQ/MwEUtPPN5jqPg03VrDBFvsFp8HZqc?=
 =?us-ascii?Q?x6TEMfpJPGU5hrsVX3m7JGo1dSOqwYJpx2PcVaj2xqjZNMbRnjMRkgPG1c7E?=
 =?us-ascii?Q?7mdjMA/CIJo+ZSC90fTZd1ZXyvTL+/PfxeljryxuRKy8Ly1/XDREEIJr+6Wh?=
 =?us-ascii?Q?gpt3n8ay6M2qmjz/jIrHgAqMlHZtJ3uSvEgzflElbY4TUwn5Cmo53s/jWoJO?=
 =?us-ascii?Q?CX41WNp2kLSYTWi0lguhd8g+tNu5HrWCZVKKh68Ahgtou0hzbKt5Q8uPrddj?=
 =?us-ascii?Q?1VH1yWo9qXdNr3b8d6EkkhqBfDfU+jsTvlmaMUR7ks+jn4GM1+7wxDbh4Qbo?=
 =?us-ascii?Q?IadyQ/qNz4rYF7OHD1kYCcd105J/NQBQMRMujufCPI9gGKM3heY+h/1Gm33h?=
 =?us-ascii?Q?2vbjxI+o/h4DW18+ohrUAzy3+sdnBAJnr4OcoXw0JNztzYSFrhVdrOc0LaL9?=
 =?us-ascii?Q?iKAkiczus/cLx2OZQxYIOEP9IiWWpGu0a54TPffrmnRVs99vGa54vXeCm1cB?=
 =?us-ascii?Q?qg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 08d4ed36-83ef-49d6-73ac-08dbb91c4066
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2023 14:25:19.6618 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HS5QBxDcn9BQ6sI2g1sCDx6hEywrFr5hsRsY5688dO+mIytyYCG6LP8erOz+9dIrZ4sH2Nlgee9KN8NrXGUaCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5585
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 03/17] drm/xe: Correlate engine and cpu
 timestamps with better accuracy
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
Cc: kamil.kopryk@intel.com, filip.hazubski@intel.com,
 Francois Dugast <francois.dugast@intel.com>, jakub.chaberek@intel.com,
 effie.yu@intel.com, bartosz.dunajski@intel.com,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, carl.zhang@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Perf measurements rely on CPU and engine timestamps to correlate
events of interest across these time domains. Current mechanisms get
these timestamps separately and the calculated delta between these
timestamps lack enough accuracy.

To improve the accuracy of these time measurements to within a few us,
add a query that returns the engine and cpu timestamps captured as
close to each other as possible.

Prior work: https://patchwork.freedesktop.org/series/87552/

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_query.c | 141 ++++++++++++++++++++++++++++++++++
 include/uapi/drm/xe_drm.h     |  95 ++++++++++++++++++-----
 2 files changed, 218 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index cbccd5c3dbc8..be9affd4f181 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -6,10 +6,12 @@
 #include "xe_query.h"
 
 #include <linux/nospec.h>
+#include <linux/sched/clock.h>
 
 #include <drm/ttm/ttm_placement.h>
 #include <drm/xe_drm.h>
 
+#include "regs/xe_engine_regs.h"
 #include "xe_bo.h"
 #include "xe_device.h"
 #include "xe_exec_queue.h"
@@ -17,6 +19,7 @@
 #include "xe_gt.h"
 #include "xe_guc_hwconfig.h"
 #include "xe_macros.h"
+#include "xe_mmio.h"
 #include "xe_ttm_vram_mgr.h"
 
 static const u16 xe_to_user_engine_class[] = {
@@ -27,6 +30,14 @@ static const u16 xe_to_user_engine_class[] = {
 	[XE_ENGINE_CLASS_COMPUTE] = DRM_XE_ENGINE_CLASS_COMPUTE,
 };
 
+static const enum xe_engine_class user_to_xe_engine_class[] = {
+	[DRM_XE_ENGINE_CLASS_RENDER] = XE_ENGINE_CLASS_RENDER,
+	[DRM_XE_ENGINE_CLASS_COPY] = XE_ENGINE_CLASS_COPY,
+	[DRM_XE_ENGINE_CLASS_VIDEO_DECODE] = XE_ENGINE_CLASS_VIDEO_DECODE,
+	[DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE] = XE_ENGINE_CLASS_VIDEO_ENHANCE,
+	[DRM_XE_ENGINE_CLASS_COMPUTE] = XE_ENGINE_CLASS_COMPUTE,
+};
+
 static size_t calc_hw_engine_info_size(struct xe_device *xe)
 {
 	struct xe_hw_engine *hwe;
@@ -45,6 +56,135 @@ static size_t calc_hw_engine_info_size(struct xe_device *xe)
 	return i * sizeof(struct drm_xe_engine_class_instance);
 }
 
+typedef u64 (*__ktime_func_t)(void);
+static __ktime_func_t __clock_id_to_func(clockid_t clk_id)
+{
+	/*
+	 * Use logic same as the perf subsystem to allow user to select the
+	 * reference clock id to be used for timestamps.
+	 */
+	switch (clk_id) {
+	case CLOCK_MONOTONIC:
+		return &ktime_get_ns;
+	case CLOCK_MONOTONIC_RAW:
+		return &ktime_get_raw_ns;
+	case CLOCK_REALTIME:
+		return &ktime_get_real_ns;
+	case CLOCK_BOOTTIME:
+		return &ktime_get_boottime_ns;
+	case CLOCK_TAI:
+		return &ktime_get_clocktai_ns;
+	default:
+		return NULL;
+	}
+}
+
+static void
+__read_timestamps(struct xe_gt *gt,
+		  struct xe_reg lower_reg,
+		  struct xe_reg upper_reg,
+		  u64 *cs_ts,
+		  u64 *cpu_ts,
+		  u64 *cpu_delta,
+		  __ktime_func_t cpu_clock)
+{
+	u32 upper, lower, old_upper, loop = 0;
+
+	upper = xe_mmio_read32(gt, upper_reg);
+	do {
+		*cpu_delta = local_clock();
+		*cpu_ts = cpu_clock();
+		lower = xe_mmio_read32(gt, lower_reg);
+		*cpu_delta = local_clock() - *cpu_delta;
+		old_upper = upper;
+		upper = xe_mmio_read32(gt, upper_reg);
+	} while (upper != old_upper && loop++ < 2);
+
+	*cs_ts = (u64)upper << 32 | lower;
+}
+
+static int
+query_cs_cycles(struct xe_device *xe,
+		struct drm_xe_device_query *query)
+{
+	struct drm_xe_query_cs_cycles __user *query_ptr;
+	struct drm_xe_engine_class_instance *eci;
+	struct drm_xe_query_cs_cycles resp;
+	size_t size = sizeof(resp);
+	__ktime_func_t cpu_clock;
+	struct xe_hw_engine *hwe;
+	struct xe_gt *gt;
+
+	if (query->size == 0) {
+		query->size = size;
+		return 0;
+	} else if (XE_IOCTL_DBG(xe, query->size != size)) {
+		return -EINVAL;
+	}
+
+	query_ptr = u64_to_user_ptr(query->data);
+	if (copy_from_user(&resp, query_ptr, size))
+		return -EFAULT;
+
+	if (resp.rsvd)
+		return -EINVAL;
+
+	cpu_clock = __clock_id_to_func(resp.clockid);
+	if (!cpu_clock)
+		return -EINVAL;
+
+	eci = &resp.eci;
+	if (eci->gt_id > XE_MAX_GT_PER_TILE)
+		return -EINVAL;
+
+	gt = xe_device_get_gt(xe, eci->gt_id);
+	if (!gt)
+		return -EINVAL;
+
+	if (eci->engine_class >= ARRAY_SIZE(user_to_xe_engine_class))
+		return -EINVAL;
+
+	hwe = xe_gt_hw_engine(gt, user_to_xe_engine_class[eci->engine_class],
+			      eci->engine_instance, true);
+	if (!hwe)
+		return -EINVAL;
+
+	resp.cs_frequency = gt->info.clock_freq;
+
+	xe_device_mem_access_get(xe);
+	xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+
+	__read_timestamps(gt,
+			  RING_TIMESTAMP(hwe->mmio_base),
+			  RING_TIMESTAMP_UDW(hwe->mmio_base),
+			  &resp.cs_cycles,
+			  &resp.cpu_timestamp,
+			  &resp.cpu_delta,
+			  cpu_clock);
+
+	xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+	xe_device_mem_access_put(xe);
+	resp.width = 36;
+
+	/* Only write to the output fields of user query */
+	if (put_user(resp.cs_frequency, &query_ptr->cs_frequency))
+		return -EFAULT;
+
+	if (put_user(resp.cpu_timestamp, &query_ptr->cpu_timestamp))
+		return -EFAULT;
+
+	if (put_user(resp.cpu_delta, &query_ptr->cpu_delta))
+		return -EFAULT;
+
+	if (put_user(resp.cs_cycles, &query_ptr->cs_cycles))
+		return -EFAULT;
+
+	if (put_user(resp.width, &query_ptr->width))
+		return -EFAULT;
+
+	return 0;
+}
+
 static int query_engines(struct xe_device *xe,
 			 struct drm_xe_device_query *query)
 {
@@ -369,6 +509,7 @@ static int (* const xe_query_funcs[])(struct xe_device *xe,
 	query_gts,
 	query_hwconfig,
 	query_gt_topology,
+	query_cs_cycles,
 };
 
 int xe_query_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 6ab85c7fed36..3e249f197d90 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -128,6 +128,24 @@ struct xe_user_extension {
 #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
 #define DRM_IOCTL_XE_VM_MADVISE			 DRM_IOW(DRM_COMMAND_BASE + DRM_XE_VM_MADVISE, struct drm_xe_vm_madvise)
 
+/** struct drm_xe_engine_class_instance - instance of an engine class */
+struct drm_xe_engine_class_instance {
+#define DRM_XE_ENGINE_CLASS_RENDER		0
+#define DRM_XE_ENGINE_CLASS_COPY		1
+#define DRM_XE_ENGINE_CLASS_VIDEO_DECODE	2
+#define DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE	3
+#define DRM_XE_ENGINE_CLASS_COMPUTE		4
+	/*
+	 * Kernel only class (not actual hardware engine class). Used for
+	 * creating ordered queues of VM bind operations.
+	 */
+#define DRM_XE_ENGINE_CLASS_VM_BIND		5
+	__u16 engine_class;
+
+	__u16 engine_instance;
+	__u16 gt_id;
+};
+
 /**
  * enum drm_xe_memory_class - Supported memory classes.
  */
@@ -219,6 +237,64 @@ struct drm_xe_query_mem_region {
 	__u64 reserved[6];
 };
 
+/**
+ * struct drm_xe_query_cs_cycles - correlate CPU and GPU timestamps
+ *
+ * If a query is made with a struct drm_xe_device_query where .query
+ * is equal to DRM_XE_QUERY_CS_CYCLES, then the reply uses
+ * struct drm_xe_query_cs_cycles in .data.
+ *
+ * struct drm_xe_query_cs_cycles is allocated by the user and .data points to
+ * this allocated structure. The user must pass .eci and .clockid as inputs to
+ * this query. eci determines the engine and tile info required to fetch the
+ * relevant GPU timestamp. clockid is used to return the specific CPU
+ * timestamp.
+ *
+ * The query returns the command streamer cycles and the frequency that can
+ * be used to calculate the command streamer timestamp. In addition the
+ * query returns a set of cpu timestamps that indicate when the command
+ * streamer cycle count was captured.
+ */
+struct drm_xe_query_cs_cycles {
+	/** Engine for which command streamer cycles is queried. */
+	struct drm_xe_engine_class_instance eci;
+
+	/** MBZ (pad eci to 64 bit) */
+	__u16 rsvd;
+
+	/**
+	 * Command streamer cycles as read from the command streamer
+	 * register at 0x358 offset.
+	 */
+	__u64 cs_cycles;
+
+	/** Frequency of the cs cycles in Hz. */
+	__u64 cs_frequency;
+
+	/**
+	 * CPU timestamp in ns. The timestamp is captured before reading the
+	 * cs_cycles register using the reference clockid set by the user.
+	 */
+	__u64 cpu_timestamp;
+
+	/**
+	 * Time delta in ns captured around reading the lower dword of the
+	 * cs_cycles register.
+	 */
+	__u64 cpu_delta;
+
+	/**
+	 * Reference clock id for CPU timestamp. For definition, see
+	 * clock_gettime(2) and perf_event_open(2). Supported clock ids are
+	 * CLOCK_MONOTONIC, CLOCK_MONOTONIC_RAW, CLOCK_REALTIME, CLOCK_BOOTTIME,
+	 * CLOCK_TAI.
+	 */
+	__s32 clockid;
+
+	/** Width of the cs cycle counter in bits. */
+	__u32 width;
+};
+
 /**
  * struct drm_xe_query_mem_usage - describe memory regions and usage
  *
@@ -391,6 +467,7 @@ struct drm_xe_device_query {
 #define DRM_XE_DEVICE_QUERY_GTS		3
 #define DRM_XE_DEVICE_QUERY_HWCONFIG	4
 #define DRM_XE_DEVICE_QUERY_GT_TOPOLOGY	5
+#define DRM_XE_QUERY_CS_CYCLES		6
 	/** @query: The type of data to query */
 	__u32 query;
 
@@ -732,24 +809,6 @@ struct drm_xe_exec_queue_set_property {
 	__u64 reserved[2];
 };
 
-/** struct drm_xe_engine_class_instance - instance of an engine class */
-struct drm_xe_engine_class_instance {
-#define DRM_XE_ENGINE_CLASS_RENDER		0
-#define DRM_XE_ENGINE_CLASS_COPY		1
-#define DRM_XE_ENGINE_CLASS_VIDEO_DECODE	2
-#define DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE	3
-#define DRM_XE_ENGINE_CLASS_COMPUTE		4
-	/*
-	 * Kernel only class (not actual hardware engine class). Used for
-	 * creating ordered queues of VM bind operations.
-	 */
-#define DRM_XE_ENGINE_CLASS_VM_BIND		5
-	__u16 engine_class;
-
-	__u16 engine_instance;
-	__u16 gt_id;
-};
-
 struct drm_xe_exec_queue_create {
 #define XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY               0
 	/** @extensions: Pointer to the first extension struct, if any */
-- 
2.41.0


Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E84ABC04FF1
	for <intel-xe@archiver.kernel.org>; Wed, 20 Sep 2023 19:30:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB96310E544;
	Wed, 20 Sep 2023 19:30:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABD4110E544
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Sep 2023 19:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695238209; x=1726774209;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=qCIQnouJ8RX+BO7OWXViNoFQLdladP8vtJZx1XgFBzc=;
 b=ATa0sse+ajdvzNUobIAdXjg/HLsZh6GaPPexU5VAsWLur50JMrCcBgfo
 b5jwxLP3lJCZKc1n7xIzhgpZePJPHIvJ+mngIceCJuvGwCuec/y5Zh5Z5
 F43LxnpJ0cLTMNaheFwoPPASUbpAAoEnPCwAoPHRioE/lhHACBOWw8iHz
 QO1mjhUPTDow1RdFPfgMgEicYdDpqJlkSVUw2+1Y4DIwWkKd/91FkFwJG
 tZer+sJHqcUw65TxOUFU4hKqSQRygbosmX4FXkQGDXlmdCCrwiG/O9I+6
 MPpWO9B5YBkvXJUxAkqaQ+pjurCivN5XIFc1peY0r8SHxQ/KoMb8G0aoy Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="377618892"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; d="scan'208";a="377618892"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2023 12:30:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="993751580"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; d="scan'208";a="993751580"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Sep 2023 12:30:09 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 20 Sep 2023 12:30:08 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 20 Sep 2023 12:30:08 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.49) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 20 Sep 2023 12:30:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hSXEZGagXME+lqiWJfJpKHWI7C1+Poj4qazx4C/gAHUtEJ/2lLknpDPEPhPesJa5QWhDLCYtLfMkl3lA3J+Vp8TonlzIEnYnyVtnMJ3oLkI6tDV86kRdaGqv1/W6PswHTwL136E9TKUYLnXaNtcgiqcDrs8gwEnig47589uHmDfEgOrwUHxLbXugvaDjRrv8ddKphIGqycNn2wMYRfWvBzdeDwsdN82dTrkqaPlsuq89ziCaxXT+zLY3GySM0lUqPRKy0w/Iz6MjC/VG6sHmj+0DnE6nuO0GImRj1FVcq7r/7Ppwm9rg+7Jr/UV7x/VQKcxN305sX+LgcED/90WLpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AXfDB6+41obY9GjbqemnLnhvoV1YUJHJsEwn1mMnL1A=;
 b=oGAnkWeiiHdddge/EQh27nb3qZ9VLgIxMjR5Iztuga4HIiVH8+9+L+k66dPLEJDVYHcCyznUpnQZrtkR40kzxevFU+r7ZQpWAnOm6pMrfeulPl+9P1i5a96jB6caWkd+CeyAjbZPa5NusUE0cjneDystnpn6/8OTvbqOh+vHGbbdz/qO/USDTpOoiM/fPPbNAgjnOmATUWYtBG5dXfzZqeo7SID8zz8uWG6QzovhypLvbZmrdm4iGkkkCx/0PGGlTMRyZ4KmdoLuwWKzXc7z5+TFVX5m1GqR11oFH5mIYwYRDjAkCV2ik+1+mDTZsrfdu9aXQcSmptR9YUJlgOu42g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DS0PR11MB7802.namprd11.prod.outlook.com (2603:10b6:8:de::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Wed, 20 Sep
 2023 19:29:56 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%6]) with mapi id 15.20.6792.022; Wed, 20 Sep 2023
 19:29:56 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 20 Sep 2023 15:29:23 -0400
Message-ID: <20230920192940.135004-4-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230920192940.135004-1-rodrigo.vivi@intel.com>
References: <20230920192940.135004-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0053.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::28) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DS0PR11MB7802:EE_
X-MS-Office365-Filtering-Correlation-Id: 17108560-1014-44ad-9eea-08dbba0ff8bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iwBZ5B5+8+8FhAA83JB22ccZlvs+ZxSw9qzWilnexxE689iGIeCQb1SJ63tWt0oBC4XA9pQLoTvNrYTvJuUNnYO2nEaZ+z5jH27atpYwKdKqsluwK8EQOdqJaF4Pv596kzkMjUsakqeAnFz6vQQWfOW7p/Veg2qRqxwXOgM5QGGevQrDmxx+P3rXREjmYNFfPCMYTldMhxocbVZx36Sjrq6RmHi2YqbWtM1C1ukCWH0TXMY3XbP7rI2Gx+6RyHYerAOPfBB9nlMgi8Q2guoMWRnDlJImDY4GPGskYMOsFUbuWy+w2lNijgDDbADyqPp/nDZv1XdbaL8JcrpnRpCNzt6FST8rRMkk7iYwUOCep/Q/EeNQS4Lnhom0NauXRUagSHSNn4dOTmTqKOo38kydizfbN3pUP5IRAwIpQAwteKacaO8H5lQQPoRRKz5a+5rh5f2QdboqOgYqyNFjLkr0JEeo7Zc+t7bo8djblwbKYPb9+PNggKaV/bcn1WFPjtfgz3CU1JK9xnoiIp5lrXlBXHdW3HtX6s+pq8ixgrfSuqw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(396003)(39860400002)(346002)(376002)(366004)(451199024)(186009)(1800799009)(83380400001)(6666004)(966005)(478600001)(44832011)(86362001)(107886003)(1076003)(6512007)(26005)(41300700001)(6506007)(6486002)(4326008)(66946007)(66556008)(8936002)(54906003)(2906002)(36756003)(6916009)(66476007)(8676002)(82960400001)(316002)(2616005)(5660300002)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Mnfr5GKyEqnyER9bODPcD1J4bjCAmhJXFuvffA6/2j0rppe3P96RmqELuMo4?=
 =?us-ascii?Q?w5DXc9CT7M+V98CJlsQqFUTKVPtz3YqZBZ0aJzOmXf1Pdi7znXV6v8vaaDQH?=
 =?us-ascii?Q?gzEISV37V/dUUOrg/BlTmx59gbods8y8OdyIGg6WK1z6ZL7fxkfnSaiF1kPY?=
 =?us-ascii?Q?UX2Hu2nZyvmySfhY4Abc4jcvuO7iFOgjgKhqL9OsAw0X0zGaynjnIrexgnte?=
 =?us-ascii?Q?JrxNbcL9qext1upYiuXh/4UE+yfOFnejMWDBVLAbuVYZszRpBukVTJtr4vXd?=
 =?us-ascii?Q?uCPijkBWVl0qaHUXsG91AWvfwmXxWU/Qn+TD9bqOM1LJDTlyyT25EgRsJ+PX?=
 =?us-ascii?Q?qXEJWex4JJYE9Xo8mKtriE8U6L8IG5Ot2GVK2XlL8HXiMc7S2ZiDM6A2kW/q?=
 =?us-ascii?Q?Ns9f48eO5AK765ZhTX3XcmiAI1pXLYXod8YRnjjzCFjkiX0HFCa8LH8NHkz+?=
 =?us-ascii?Q?LJW+YUBC16c50WLKDlGV3JCmW2qB0uD2Sg+ugl831bpr/O8H4kXdKAxI2eYp?=
 =?us-ascii?Q?Yq6gZ2KM04HiCaOD6UvFUqZKPzNXQP/w8l2GeNDpx6HZa2Hc52XFmFdanynw?=
 =?us-ascii?Q?fxaN7qBqy9paa+PdeDrroLG/ANWVEwqlc2WuXkDqBRKU23Ur9QjV/89GodT3?=
 =?us-ascii?Q?/oLZw8P6p4EnRFruao0lCPZoJ6IrggdMKnXfjUhZiEOELMBkYoahssrF7KG2?=
 =?us-ascii?Q?P1vl/pT8yq+P1y33OAKMNwJDLO0Zx89yMbQjuQwExEfFP3TxDBJD5wCyyjii?=
 =?us-ascii?Q?qvVLT7WjFYsk6VixsRVQoh0ztPEoJt1+kLAGKISTzQB3zDNw2T1MqjFhsrqg?=
 =?us-ascii?Q?7A4HDuQjuS5Yt+JdWYxipJM5YBTCx/iI6md2ibJb2p80iy6mUIj27GpwAfXG?=
 =?us-ascii?Q?PDRwrYSnBCNHPdIzV7BdAxb4xydTnndhJrUuLTAORUrlfhMMoDEmFPF17a9Z?=
 =?us-ascii?Q?mET1/uHvjtfSoyZPnSobsHKlyvPZu3nXEdfLUY8AotrmPtBTNXwQcf6eq46R?=
 =?us-ascii?Q?vDwP54+ou42/2t01UnpE77B6HIOH9oZpjg7WMUCcmXCuiOc41eo6Dzwx2Q5I?=
 =?us-ascii?Q?WhnXS0rv8p17w8r1oRwgCGfV9irqqC21vmnLPmNmi5cL42vYDVajMCX7ZiAm?=
 =?us-ascii?Q?mMK58hqtjSXhgVDQOU1JDfWK1npiZjjPOJv/X/CbfEnaSykG/pLfWvmwqOiz?=
 =?us-ascii?Q?qIywaYUg2UVjY/e4e1NIwhx9tG1ds6oIbG2Zg+dbM4LnYTedBiHKM7XZk2C8?=
 =?us-ascii?Q?2L3uGpTFJnocylRumjf3DHBVJimj8Ipm6KInuZxYogLSmXRVyzvAJ6tOY/eA?=
 =?us-ascii?Q?2N//L8TrpZlxdEh6ZDL27jEZ4a4cg+54j61qNqQdZbiZ+FzswkN2VgPvpXIH?=
 =?us-ascii?Q?bXs3kOj9+yARCICRnAeiqmk2ocW38lZOD/t2xah3J0WUxU9ufhfQGEF0sQ12?=
 =?us-ascii?Q?+rqidoRzfmt88iOCSxixoMrTMHldivLrXGaq3cnmzQoOV6CbSeL+z2BIXf5j?=
 =?us-ascii?Q?o/4EbuNYqJCqfwCbJvG4oi2wI8uJpPtM69QTf+DYxt995ZDq9EyWdoZpYl+D?=
 =?us-ascii?Q?hOZ1LW+n3lByA++AV1Ga6axR3PXaqSD4D38EwNcg9OtdK8TMlUQIvhcweSXy?=
 =?us-ascii?Q?uA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 17108560-1014-44ad-9eea-08dbba0ff8bf
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2023 19:29:56.6545 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hfqK/QKTNRI/I3WFD7VV5ssQrPdRmoyeGS4Tkeui+wTiIRUDCDAEqefEeviS6D+/nObjHaTJR/oL7txvh17P4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7802
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH v2 03/20] drm/xe: Correlate engine and cpu
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
Cc: Francois Dugast <francois.dugast@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
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


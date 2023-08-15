Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8FD2C001DE
	for <intel-xe@archiver.kernel.org>; Tue, 15 Aug 2023 16:41:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6136010E19E;
	Tue, 15 Aug 2023 16:41:26 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0BAC10E257
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Aug 2023 16:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692117684; x=1723653684;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=+FN1p6WwZFWXc8hU8qbMTFaRXjg+ugrIpHtkenzvUoc=;
 b=UYpMeVffBCiMicBPskPEzIYENkRXbJE1A828NVaVTeOf4i0fZCDoy4yT
 EFl+FsT5ZR+MfF48Hj6E9Hcy+/T+yCENT5+xSW6lbDRldk9TYxp0Ij2c8
 mgHZpsp24W88moLH8ETVM3fBVntvVBsp/GCvLCusk834cDDILfdjFunLo
 FNujvujy6Is2TTgvQ9/XmdTB3JGZ/gI53a+kUXPifUfjbV8Y9jBCasSa8
 DeibRKMfaxHQ3+n2H1Z2+EOz0xTBlRFXfGgyoQ7T0DHNXe7hsXmo8DXRs
 FjNN4Uswq0L0sqtvoS6jnPnEaFKE718FhC0OWtbywffVg84zryLOTNuJG w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="369802353"
X-IronPort-AV: E=Sophos;i="6.01,175,1684825200"; d="scan'208";a="369802353"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2023 09:41:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="848139215"
X-IronPort-AV: E=Sophos;i="6.01,175,1684825200"; d="scan'208";a="848139215"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga002.fm.intel.com with ESMTP; 15 Aug 2023 09:41:24 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 15 Aug 2023 09:41:23 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 15 Aug 2023 09:41:23 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 15 Aug 2023 09:41:23 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.48) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 15 Aug 2023 09:41:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HdR/IeRvKScfLvyLJ96nA5j/9rQu4eF34j38JoKqZuwC3x2r/y4JWNaqf6ecM+qB05Il7FSTQSH26/0AsSMskbK+1HC7XRfNN2daQ0p1EcEbsmCwVtBVvY1+VLLNv1zDFbQUZyiGr/k+lsPcFBhuRUpwfFfHklrdeVcK/EsYmO8/BWYnQGKCdLu6oqob4uJliLydcLdSSN+mPOkQabl/gyl9zsYy5eDh6JC/IgkX/CfIpwh5XyWSQOTLW34p/S9De4xVYoFFUbtjuxkWdof9s2w6jJnKVJlg82DPcyNUY/zr+fkMynAMD6ZSt9KslwHNYcO6/SDWND3sB1hSC6GGNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V2AFsXCS42NdVH2ISz3FnIHrzo6RfYYlNIjL+fzN82Y=;
 b=T9luJp2FBpjHq7gx/LRDynu2/hiZR+O7DuVrhyTIZe+eFYNbt1kMBpoNWjO/rQvu1LxaVXZ5EoosQUwT9kBAVH4MzOIY0Zbp943bw0RRU+Tn2TrvtU3Sne4cZb72PAnIB4iOi1c9GZXJVkibaP/C7RQQrnXBIBZJxF0uPK16cnUlKmNeq3Do3XQI0g1oG2H2DbcwGgPOtCTwMHpFnvDaHicT2mtUsAlH2aCVKt613g44hXklm/HWH6uicQuhhlmRvCcG1PtnvJ839WHCu81JTowK8IKc7zUNCyZeEPYt8ilEC/nh8atDX2XFjG/A8ri3AxWliukPJEco6pb9A4O8Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by SA1PR11MB6846.namprd11.prod.outlook.com (2603:10b6:806:2b0::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Tue, 15 Aug
 2023 16:41:21 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::f7ed:4327:5d1a:b8fc]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::f7ed:4327:5d1a:b8fc%4]) with mapi id 15.20.6678.025; Tue, 15 Aug 2023
 16:41:21 +0000
Date: Tue, 15 Aug 2023 09:41:08 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Message-ID: <ZNuqpIgzYu5BmJtD@nvishwa1-DESK>
References: <20230814223734.375449-1-umesh.nerlige.ramappa@intel.com>
 <20230814223734.375449-5-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230814223734.375449-5-umesh.nerlige.ramappa@intel.com>
X-ClientProxiedBy: SJ0PR05CA0122.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::7) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|SA1PR11MB6846:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c83b399-db75-422d-369b-08db9dae749b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: z24orvJyrYLJ5Gf/VBBHeKouqYn4zW1j7/OTU3kA6zHwFZbDgkiym4c+IwBQypE3L7oOwh2sCdbPUiJU8MZ1+FcvvRf7ZRwurhIQJ1o3gRGxYXWSJqOE70OLkXyq98JRn1EV17hU6TQqQ9zJ7Hze+5NYLlxRh1XhpwG7QAyJtq2blXdOnoEtuRRDHFmYdU/u7/PWpXqPExhzBC7+JCwqbxm8fF1QZcwIo7tOa/QbBnI3kpyMXqG7fLTIBDGj0DgZJkrZe7yyaue7pl2ZLiYU1DGywmgwjnOP6CIcUC+FPqo0qi+5Kf6WxWaRQtK0x7sdIFfoPTe08buSJAarHuKm2EA/9V2Lq4IOX9nufj57xewQVtuNg7Ry39rpu2n7c0aUaWGnvTFQldYlCQPfmhkJAjmTnV2zxQIARH0GJPdZiYFFMvzwMfMLu5dmar1iKysIChi3JHCpi0aI1hg6WsNC8k4Go0GL7kL/62BCQHLvHkfBWCRifRY3/CD9O1y1S1YkWuDcn/w3DbvQBCkMhQ297quK7F157ONGR1zNfdA9yh4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(366004)(346002)(396003)(39860400002)(136003)(376002)(451199024)(1800799009)(186009)(478600001)(6666004)(86362001)(66476007)(316002)(6636002)(66556008)(33716001)(6862004)(66946007)(4326008)(966005)(83380400001)(30864003)(41300700001)(8676002)(38100700002)(26005)(9686003)(6512007)(8936002)(6486002)(2906002)(6506007)(82960400001)(5660300002)(44832011);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LYQeS9MK+JX506W5jjf3voQf1OIDwD2AmuFWjht3nZsHHxqPMHR5n+R2c7X0?=
 =?us-ascii?Q?HDVfqnSj2y5hLXRsVw+rK9ljyCClvy9dm4O5+PVG18JoHJ3zg6Nf/ad/eW4F?=
 =?us-ascii?Q?DsvHY5Tgf2kaypN6soiXcVelsMxQSpqya1nJjQQqENaT4Rg+Rxu5RVNfHhAW?=
 =?us-ascii?Q?weePwDIo6ImCu+1aHKrMXs57Q5D+HGzdGx+uJ+Aw+6OidkgYAgam9YeAwmsu?=
 =?us-ascii?Q?x9eRCLufSc9RXvxLfSj4eUSJbTuMpGqSN0JMl8ojURtZMQkZbvRYurFwLNgF?=
 =?us-ascii?Q?ZUKOSqiXFC7l/Nx+hFoKgnP4TVYJI29rqbPmXYIN7rKOK6CGfyF68JAMK2bH?=
 =?us-ascii?Q?ajcXTHYpnFPax5JZAbQfDPDLkLZcts/OuhepXft9FmTC2srRWRIZv4Xoe5f4?=
 =?us-ascii?Q?YR2SILtIBR4M7nHRqIZJ7PG+ZvTJUAEP4CMfCcM/Qhr59gdzeZ4EFp6rHZGH?=
 =?us-ascii?Q?ZSaB+AdH/23IlKi+iRrm/9HPC6XchOqzdSQbkTE+2etpSd+3Aix/9e+NLlAS?=
 =?us-ascii?Q?E2T68pke9gxnFsVuyRXooeh1UNSjzy/ebI8z1ob1p7ztJpzeqFQYEM8M11BB?=
 =?us-ascii?Q?iWZLA7hixvboTCVqVbrpfrEJgMIWH8IINnMrqvcAnXRIFEOFRCzzRNgeDgCh?=
 =?us-ascii?Q?SVatSOx4VhFciObfO9OiDgeijW/dvrYsKBXOm90Fw4NJEAkGFmPT4l105U/F?=
 =?us-ascii?Q?JpZ01ELDzzIVdPXbC8mH+tdlgdg5av5RdFwwWhPelscOs0VG/Cd9IqH7HZYL?=
 =?us-ascii?Q?YvcfMUuUpABZfGoepUj7Jk5wfU2aJAgfCVZCOzVIDrKAYh5iC+J3ZdqwLMQp?=
 =?us-ascii?Q?+TUQF7yeNqzU3F5TuNrPXYvDm0wHCDNMdH/y88ds5cHHhHunMKDByl23kynR?=
 =?us-ascii?Q?xAwt6pqWyDfOhiQEOc0TUDkwcg7GU/+fyGjsCAbu0oe2/7q/roxw5w3ImA7z?=
 =?us-ascii?Q?MzCjcPGqSLguFlRX/0f6aogwY8dB0HYzfzZ32PLoKHGkE+pHdlPyV7dloUtf?=
 =?us-ascii?Q?PJ+KgnRRlkN16/0bVv8HDfXN29mbsKwgHD32nTY8rytRQeet23nfMkBNOGJ6?=
 =?us-ascii?Q?Yt/VPphYgJzBNpIgaEpE+56KOHdOx7LdtlROLyqVYZ65EXo5e8IB97eDhkvA?=
 =?us-ascii?Q?kzabimYp0usWjVReMynHWNiLZURbZEVnb6vB2R8QpxDrtrwLjStsmOI5nx44?=
 =?us-ascii?Q?PKWXTzmpiR5sSI5MS/gywzMyw2e9P0SqQ+HutK/bu9F7XFmEJnixzk/TCh1H?=
 =?us-ascii?Q?G2NZtqua7orMTG+VoECCwWLrrdywfyCBBRPdYJJpZOz4nBtpIxHkN3o1wiZW?=
 =?us-ascii?Q?BpUbikQw/IxD2vsuEwY+z20ktQj8G6ST3UWIcSdfUBmuOXL3Xm79ERZBvJ+e?=
 =?us-ascii?Q?37VVh9DiQRDGlzDgHr9MsKFrlExD5CYoZ5pDe73ve1NNcBBThN/KLOA/hjvi?=
 =?us-ascii?Q?WzuRP+NmOzQvnD3zyxW/USeCJLzJBqmYaZYrM/Q0oRgLbJnZo1MG9TpwLnVe?=
 =?us-ascii?Q?HLabR0AnMZ1+qgoXSMTppKPeoEthgj1WC4GyzLfEUTrZnSuM/FH+1I2dPVw4?=
 =?us-ascii?Q?Dw8OixK+uzryVqpZ3yUbtGdCGJsWIbedFAuFSYCbAmAfvUIvUqABaReQCamf?=
 =?us-ascii?Q?4jOY1kzflIP7jsaCaIouODw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c83b399-db75-422d-369b-08db9dae749b
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2023 16:41:21.1414 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h5+xN1iuTmy2HH1JIm3j1ybUYn/X49sxidk1+s71G0ZNUvNPXep6aZu9ORh/1IxkKijmdIwGgZpjgXOLkIO0n+TdhHi22b3Fsf9+O1nd1BgIYYWx9QYTtlwW5SZG49GH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6846
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 4/4] drm/xe: Correlate engine and cpu
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
Cc: Lionel G Landwerlin <lionel.g.landwerlin@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Aug 14, 2023 at 03:37:34PM -0700, Umesh Nerlige Ramappa wrote:
>Perf measurements rely on CPU and engine timestamps to correlate
>events of interest across these time domains. Current mechanisms get
>these timestamps separately and the calculated delta between these
>timestamps lack enough accuracy.
>
>To improve the accuracy of these time measurements to within a few us,
>add a query that returns the engine and cpu timestamps captured as
>close to each other as possible.
>
>Mesa MR: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/24591
>
>v2:
>- Fix kernel-doc warnings (CI)
>- Document input params and group them together (Jose)
>- s/cs/engine/ (Jose)
>- Remove padding in the query (Ashutosh)
>
>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>---
> drivers/gpu/drm/xe/xe_query.c | 138 ++++++++++++++++++++++++++++++++++
> include/uapi/drm/xe_drm.h     |  93 ++++++++++++++++++-----
> 2 files changed, 212 insertions(+), 19 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
>index b9d565264ceb..af083f57a618 100644
>--- a/drivers/gpu/drm/xe/xe_query.c
>+++ b/drivers/gpu/drm/xe/xe_query.c
>@@ -6,10 +6,12 @@
> #include "xe_query.h"
>
> #include <linux/nospec.h>
>+#include <linux/sched/clock.h>
>
> #include <drm/ttm/ttm_placement.h>
> #include <drm/xe_drm.h>
>
>+#include "regs/xe_engine_regs.h"
> #include "xe_bo.h"
> #include "xe_device.h"
> #include "xe_exec_queue.h"
>@@ -17,6 +19,7 @@
> #include "xe_gt.h"
> #include "xe_guc_hwconfig.h"
> #include "xe_macros.h"
>+#include "xe_mmio.h"
> #include "xe_ttm_vram_mgr.h"
>
> static const u16 xe_to_user_engine_class[] = {
>@@ -27,6 +30,14 @@ static const u16 xe_to_user_engine_class[] = {
> 	[XE_ENGINE_CLASS_COMPUTE] = DRM_XE_ENGINE_CLASS_COMPUTE,
> };
>
>+static const enum xe_engine_class user_to_xe_engine_class[] = {
>+	[DRM_XE_ENGINE_CLASS_RENDER] = XE_ENGINE_CLASS_RENDER,
>+	[DRM_XE_ENGINE_CLASS_COPY] = XE_ENGINE_CLASS_COPY,
>+	[DRM_XE_ENGINE_CLASS_VIDEO_DECODE] = XE_ENGINE_CLASS_VIDEO_DECODE,
>+	[DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE] = XE_ENGINE_CLASS_VIDEO_ENHANCE,
>+	[DRM_XE_ENGINE_CLASS_COMPUTE] = XE_ENGINE_CLASS_COMPUTE,
>+};
>+
> static size_t calc_hw_engine_info_size(struct xe_device *xe)
> {
> 	struct xe_hw_engine *hwe;
>@@ -45,6 +56,132 @@ static size_t calc_hw_engine_info_size(struct xe_device *xe)
> 	return i * sizeof(struct drm_xe_engine_class_instance);
> }
>
>+typedef u64 (*__ktime_func_t)(void);
>+static __ktime_func_t __clock_id_to_func(clockid_t clk_id)
>+{
>+	/*
>+	 * Use logic same as the perf subsystem to allow user to select the
>+	 * reference clock id to be used for timestamps.
>+	 */
>+	switch (clk_id) {
>+	case CLOCK_MONOTONIC:
>+		return &ktime_get_ns;
>+	case CLOCK_MONOTONIC_RAW:
>+		return &ktime_get_raw_ns;
>+	case CLOCK_REALTIME:
>+		return &ktime_get_real_ns;
>+	case CLOCK_BOOTTIME:
>+		return &ktime_get_boottime_ns;
>+	case CLOCK_TAI:
>+		return &ktime_get_clocktai_ns;
>+	default:
>+		return NULL;
>+	}
>+}
>+
>+static void
>+__read_timestamps(struct xe_gt *gt,
>+		  struct xe_reg lower_reg,
>+		  struct xe_reg upper_reg,
>+		  u64 *engine_ts,
>+		  u64 *cpu_ts,
>+		  u64 *cpu_delta,
>+		  __ktime_func_t cpu_clock)
>+{
>+	u32 upper, lower, old_upper, loop = 0;
>+
>+	upper = xe_mmio_read32(gt, upper_reg);
>+	do {
>+		*cpu_delta = local_clock();
>+		*cpu_ts = cpu_clock();
>+		lower = xe_mmio_read32(gt, lower_reg);
>+		*cpu_delta = local_clock() - *cpu_delta;
>+		old_upper = upper;
>+		upper = xe_mmio_read32(gt, upper_reg);
>+	} while (upper != old_upper && loop++ < 2);
>+
>+	*engine_ts = (u64)upper << 32 | lower;
>+}
>+
>+static int
>+query_engine_cycles(struct xe_device *xe,
>+		struct drm_xe_device_query *query)
>+{
>+	struct drm_xe_query_engine_cycles __user *query_ptr;
>+	struct drm_xe_engine_class_instance *eci;
>+	struct drm_xe_query_engine_cycles resp;
>+	size_t size = sizeof(resp);
>+	__ktime_func_t cpu_clock;
>+	struct xe_hw_engine *hwe;
>+	struct xe_gt *gt;
>+
>+	if (query->size == 0) {
>+		query->size = size;
>+		return 0;
>+	} else if (XE_IOCTL_DBG(xe, query->size != size)) {
>+		return -EINVAL;
>+	}
>+
>+	query_ptr = u64_to_user_ptr(query->data);
>+	if (copy_from_user(&resp, query_ptr, size))
>+		return -EFAULT;
>+
>+	cpu_clock = __clock_id_to_func(resp.clockid);
>+	if (!cpu_clock)
>+		return -EINVAL;
>+
>+	eci = &resp.eci;
>+	if (eci->gt_id > XE_MAX_GT_PER_TILE)
>+		return -EINVAL;
>+
>+	gt = xe_device_get_gt(xe, eci->gt_id);
>+	if (!gt)
>+		return -EINVAL;
>+
>+	if (eci->engine_class >= ARRAY_SIZE(user_to_xe_engine_class))
>+		return -EINVAL;
>+
>+	hwe = xe_gt_hw_engine(gt, user_to_xe_engine_class[eci->engine_class],
>+			      eci->engine_instance, true);
>+	if (!hwe)
>+		return -EINVAL;
>+
>+	resp.engine_frequency = gt->info.clock_freq;
>+
>+	xe_device_mem_access_get(xe);
>+	xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>+
>+	__read_timestamps(gt,
>+			  RING_TIMESTAMP(hwe->mmio_base),
>+			  RING_TIMESTAMP_UDW(hwe->mmio_base),
>+			  &resp.engine_cycles,
>+			  &resp.cpu_timestamp,
>+			  &resp.cpu_delta,
>+			  cpu_clock);
>+
>+	xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>+	xe_device_mem_access_put(xe);
>+	resp.width = 36;
>+
>+	/* Only write to the output fields of user query */
>+	if (put_user(resp.engine_frequency, &query_ptr->engine_frequency))
>+		return -EFAULT;
>+
>+	if (put_user(resp.cpu_timestamp, &query_ptr->cpu_timestamp))
>+		return -EFAULT;
>+
>+	if (put_user(resp.cpu_delta, &query_ptr->cpu_delta))
>+		return -EFAULT;
>+
>+	if (put_user(resp.engine_cycles, &query_ptr->engine_cycles))
>+		return -EFAULT;
>+
>+	if (put_user(resp.width, &query_ptr->width))
>+		return -EFAULT;
>+
>+	return 0;
>+}
>+
> static int query_engines(struct xe_device *xe,
> 			 struct drm_xe_device_query *query)
> {
>@@ -376,6 +513,7 @@ static int (* const xe_query_funcs[])(struct xe_device *xe,
> 	query_gts,
> 	query_hwconfig,
> 	query_gt_topology,
>+	query_engine_cycles,
> };
>
> int xe_query_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>index 53cd57342620..4c0c58ca63a3 100644
>--- a/include/uapi/drm/xe_drm.h
>+++ b/include/uapi/drm/xe_drm.h
>@@ -128,6 +128,25 @@ struct xe_user_extension {
> #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
> #define DRM_IOCTL_XE_VM_MADVISE			 DRM_IOW(DRM_COMMAND_BASE + DRM_XE_VM_MADVISE, struct drm_xe_vm_madvise)
>
>+/** struct drm_xe_engine_class_instance - instance of an engine class */
>+struct drm_xe_engine_class_instance {
>+#define DRM_XE_ENGINE_CLASS_RENDER		0
>+#define DRM_XE_ENGINE_CLASS_COPY		1
>+#define DRM_XE_ENGINE_CLASS_VIDEO_DECODE	2
>+#define DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE	3
>+#define DRM_XE_ENGINE_CLASS_COMPUTE		4
>+	/*
>+	 * Kernel only class (not actual hardware engine class). Used for
>+	 * creating ordered queues of VM bind operations.
>+	 */
>+#define DRM_XE_ENGINE_CLASS_VM_BIND		5
>+	__u16 engine_class;
>+
>+	__u16 engine_instance;
>+	__u16 gt_id;
>+	__u16 rsvd;
>+};
>+

I think moving this structure here should be moved to a
separate patch with either 'fixup' (if possible) or with
'Fixes' so that it can be merged with original patch.
While at it, can you add kernel-doc for it :)

> /**
>  * enum drm_xe_memory_class - Supported memory classes.
>  */
>@@ -223,6 +242,60 @@ struct drm_xe_query_mem_region {
> 	__u64 reserved[6];
> };
>
>+/**
>+ * struct drm_xe_query_engine_cycles - correlate CPU and GPU timestamps
>+ *
>+ * If a query is made with a struct drm_xe_device_query where .query is equal to
>+ * DRM_XE_QUERY_CS_CYCLES, then the reply uses struct drm_xe_query_engine_cycles
>+ * in .data. struct drm_xe_query_engine_cycles is allocated by the user and
>+ * .data points to this allocated structure.
>+ *
>+ * The query returns the command streamer cycles and the frequency that can
>+ * be used to calculate the command streamer timestamp. In addition the
>+ * query returns a set of cpu timestamps that indicate when the command
>+ * streamer cycle count was captured.
>+ */
>+struct drm_xe_query_engine_cycles {
>+	/**
>+	 * @eci: This is input by the user and is the engine for which command
>+	 * streamer cycles is queried.
>+	 */
>+	struct drm_xe_engine_class_instance eci;
>+
>+	/**
>+	 * @clockid: This is input by the user and is the reference clock id for
>+	 * CPU timestamp. For definition, see clock_gettime(2) and
>+	 * perf_event_open(2). Supported clock ids are CLOCK_MONOTONIC,
>+	 * CLOCK_MONOTONIC_RAW, CLOCK_REALTIME, CLOCK_BOOTTIME, CLOCK_TAI.
>+	 */
>+	__s32 clockid;
>+
>+	/** @width: Width of the engine cycle counter in bits. */
>+	__u32 width;
>+
>+	/**
>+	 * @engine_cycles: Command streamer cycles as read from the command streamer
>+	 * register at 0x358 offset.
>+	 */
>+	__u64 engine_cycles;
>+
>+	/** @engine_frequency: Frequency of the engine cycles in Hz. */
>+	__u64 engine_frequency;
>+
>+	/**
>+	 * @cpu_timestamp: CPU timestamp in ns. The timestamp is captured before
>+	 * reading the engine_cycles register using the reference clockid set by the
>+	 * user.
>+	 */
>+	__u64 cpu_timestamp;
>+
>+	/**
>+	 * @cpu_delta: Time delta in ns captured around reading the lower dword
>+	 * of the engine_cycles register.
>+	 */
>+	__u64 cpu_delta;

Why do we need this cpu_delta?

Niranjana

>+};
>+
> /**
>  * struct drm_xe_query_mem_usage - describe memory regions and usage
>  *
>@@ -395,6 +468,7 @@ struct drm_xe_device_query {
> #define DRM_XE_DEVICE_QUERY_GTS		3
> #define DRM_XE_DEVICE_QUERY_HWCONFIG	4
> #define DRM_XE_DEVICE_QUERY_GT_TOPOLOGY	5
>+#define DRM_XE_QUERY_CS_CYCLES		6
> 	/** @query: The type of data to query */
> 	__u32 query;
>
>@@ -737,25 +811,6 @@ struct drm_xe_exec_queue_set_property {
> 	__u64 reserved[2];
> };
>
>-/** struct drm_xe_engine_class_instance - instance of an engine class */
>-struct drm_xe_engine_class_instance {
>-#define DRM_XE_ENGINE_CLASS_RENDER		0
>-#define DRM_XE_ENGINE_CLASS_COPY		1
>-#define DRM_XE_ENGINE_CLASS_VIDEO_DECODE	2
>-#define DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE	3
>-#define DRM_XE_ENGINE_CLASS_COMPUTE		4
>-	/*
>-	 * Kernel only class (not actual hardware engine class). Used for
>-	 * creating ordered queues of VM bind operations.
>-	 */
>-#define DRM_XE_ENGINE_CLASS_VM_BIND		5
>-	__u16 engine_class;
>-
>-	__u16 engine_instance;
>-	__u16 gt_id;
>-	__u16 rsvd;
>-};
>-
> struct drm_xe_exec_queue_create {
> #define XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY               0
> 	/** @extensions: Pointer to the first extension struct, if any */
>-- 
>2.38.1
>

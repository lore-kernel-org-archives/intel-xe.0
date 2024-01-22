Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41CFFC46CD2
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jan 2024 22:05:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1BA310F042;
	Mon, 22 Jan 2024 22:05:02 +0000 (UTC)
X-Greylist: delayed 426 seconds by postgrey-1.36 at gabe;
 Mon, 22 Jan 2024 22:05:00 UTC
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF7FF10F042
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Jan 2024 22:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705961101; x=1737497101;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=kUdLP3GdLn4E673bbrGW/R/xcuvvPFBsw7uzjVBvDSs=;
 b=Dgd0w4gx1Ahp4LEUeh7HgnmkfePosgF8qM30VXMFg1L2psY2fsulS+QJ
 7KrGvUqwSukSprMwv6uev1u5yt+uoh2snBkzeeODfwDIj6N7mukgxlYic
 fGoSmDr+chE4VbJ0vaD9bMzPtU53/IJJQP/67Nl+TKWo4pLmwFkZqhIbL
 8tDW3e5yHRRbyRTKXbUKDcLJ5SVtw5ikFqKqSgwQQ3bukJ6iAdW2wWjig
 NbfuNgFn+DzK9b5uw3LYRTNwg5v4iNquksbmRl79aRHnU7EGNsOek/SEJ
 9kuCzx7PSKBEfhsDzsaQDInVrgw1w3g2DinisLdoi1MA4gtD2DGNIg06Y A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="233823"
X-IronPort-AV: E=Sophos;i="6.05,212,1701158400"; 
   d="scan'208";a="233823"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2024 13:57:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,212,1701158400"; d="scan'208";a="34172999"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Jan 2024 13:57:53 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Jan 2024 13:57:52 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Jan 2024 13:57:51 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 22 Jan 2024 13:57:51 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 22 Jan 2024 13:57:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XVnAVXiJnG+WpUQeP0bN06Z67DDb7GX3jo0MM7pgXE9Rodaf8z6BuxlHTjZ2c+AmBkY7M+T97VPNdfTthuSwShBjr9o3R9HrnAkrvg4VEzURvjqQj/U8M0opngx5eJKOjh1ndbJx38PQYMr9YnlP0An6qgts2bpLUIlfx70wHiENuchXlQwYb0y2QPJl1rtmKUB0X+VU9m97IiLsvXCongvCSqkqWuxMJJyhYVrWRHZSJRZC2jjHoAHKBfPutjswF263t4wJWPINGxR613KLKd29LKh+aSIYviOOfaZ8nJT5G0Mq8W+dEh2MDKYddwN8VAg5m4M2jr5vQYphumgy7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OtahO9S/BoGZgznSSBLoJJ5aCxewQIjVPtjC8IaARiQ=;
 b=MehCXWQZe37x2vxjGuaZCrXodsyjkiUgQyF24eZUvY/zt0WoASY9zaz3M8XfR0PVMniT7YgH6888dGtK8bGAsdnlTzV9MwiBREpqyNrVpL17BZSIOCJxmEA+SVmw6qXvXD7Hds0LY4H69kIIMVq82wvJsl6i3mlQoZXwKGLS5tZdOGq37XUEnxgzIzXyQaXvjIiFSb2YjmiqqJNay5hpg/cjpr6k2NTfluaEcZ98oRFnoR+lhb4D9HRrZpRLJpMEMGe59600QVjORB8/5mvUdkzHYF+R7y9A+gA2QyAzte7KBTZUJB3CFFjvug2ht0UAgfK9SywLpxwwvT70yC0HIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH7PR11MB6545.namprd11.prod.outlook.com (2603:10b6:510:213::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.34; Mon, 22 Jan
 2024 21:57:49 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::2157:7433:d32c:a8e3]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::2157:7433:d32c:a8e3%4]) with mapi id 15.20.7202.031; Mon, 22 Jan 2024
 21:57:48 +0000
Date: Mon, 22 Jan 2024 13:57:46 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Zhanjun Dong <zhanjun.dong@intel.com>
Subject: Re: [PATCH v3 2/9] drm/xe/guc: Expose dss per group for GuC error
 capture
Message-ID: <20240122215746.GC7083@mdroper-desk1.amr.corp.intel.com>
References: <20240119004203.393262-1-zhanjun.dong@intel.com>
 <20240119004203.393262-3-zhanjun.dong@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240119004203.393262-3-zhanjun.dong@intel.com>
X-ClientProxiedBy: SJ0PR13CA0020.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::25) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH7PR11MB6545:EE_
X-MS-Office365-Filtering-Correlation-Id: 35770ea6-7d9b-480b-6b89-08dc1b952c56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Omahh+43eZ9t5ZabTRV8BeQ2vAhj5uNAMsj3/vWqlxsXsVtkI6UsUtiZymlZkhenP5ZQRadYISumMfTxkOQW8lnwyLO/bsmZRqwJyMBGX8boPRsKCwH4NjIC8PPm7DJ5Y7oLO0Ra2mYVILEh3ym4Mh4wPMJp46FbHu3hCB1I6DDioJsWO/8HvArqhbBpsR11bqiwXGQ79ruQ7bPoV5fz1SEpunzFoOhs65a0TyR526ntogwTP9dQ5VOyFGO7Xd9XixIla8QtGe96hystOOoIuvXiiEhAlnQN/ypZ4hwOsKgGX9m5pHa/z6f6Yjv738Z/GOwir/s2fcSYrYPJgVVP8YB/JycjOrb0AkvKWU8OmFwoZdIK4W+DRSIfbIrkB8JiTfJijrSgt2ZQ41nRMqkLOmK6BPZsnOZQ4gMxBW61TvzwtXkDWPDJAKyfdqxaQH8w/1jQWPpzFN4FirkpwUJOTZwfgiSwTg44+l6+ynrlOzUIhxyCsSmPpU0c9AXB9PD+BxlJuxJVP2f3n4Ucckfnmb+U5Cv726VFEaRZq/WmDdFKgwSDBljNkvI9Okb4DbKD
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(396003)(366004)(376002)(39860400002)(346002)(230922051799003)(186009)(1800799012)(451199024)(64100799003)(6506007)(6512007)(26005)(1076003)(82960400001)(38100700002)(86362001)(33656002)(83380400001)(5660300002)(2906002)(478600001)(41300700001)(4326008)(66476007)(8676002)(8936002)(6862004)(66556008)(6486002)(66946007)(6636002)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gW7tgA4vDA+HPpisRzpqFKq8FJewbIaUmHkhkhDPxPbfKrTtx4fvEAj9KuiY?=
 =?us-ascii?Q?QjqIrFsMWX3kbZDZUj7Txufnw0G6OuoCZ7fhwxGXyv3RJ0QftgqaYnbwPc/x?=
 =?us-ascii?Q?1wEp1Isz70WiWjg1xkkLcCCBFB/jeANbEIQP4l6jrKuMqXLb5IGs92cSUS5v?=
 =?us-ascii?Q?azkNTTnSNhT5NKkFapRrvmoWlTYcMV9CVhhBb+CTUyshc3tz0LMEvn0PF9Yn?=
 =?us-ascii?Q?TGYuXHTZlGUhVXVfyeyAnmGVfAHdNfqkdyjyx7pwFZ9YPU5tQaXJgQgYfbYv?=
 =?us-ascii?Q?bbSfvCMCbxQ0RjCTv9t8lM3Dr6osSp5trEyZJE4aHycMy+VNH4kAAk7OlIUR?=
 =?us-ascii?Q?/A408t3MaRZDsrlPagplKN9dWjskn9CjVoGoCquXXSf6ZCZQQD2qKHpoikfr?=
 =?us-ascii?Q?QcUWinGaW/CY01DztP6qdQstVRxjaDSTnN2sIYHBYPNagLML9z7nRizNbQmv?=
 =?us-ascii?Q?B9mOuIJXZDTFgcCjgYhqY55H/QhkKVRt4YP3M5qOBLqX2xVEhdrhoIhEyHf0?=
 =?us-ascii?Q?3vuaLn02JuqX6V2fo/8Y31PAEL2fbd2+DAl3AVItGQO1Y+Fx0A26NCMb7RPO?=
 =?us-ascii?Q?GHLvaxxCYD8SBYCtpqgBw6pQn0RxIgBirdDr/kqZ57l/QkuYH+P7nUgYEbMB?=
 =?us-ascii?Q?W8Fp/6MrAFfRpaMg1ebmC/khoWOTN6BVOi4kJdSuVGYHm9/Slh235GIv22XW?=
 =?us-ascii?Q?i2mH53fNZtww6h8S1AkD7PXPknvPpl4N8eYgE5RGOa6kNQKecBO2JjSLOrmE?=
 =?us-ascii?Q?buG4RamH64znjlVldDdnteBRVIqHcT21/0KccSO5vZqvxxh9+io1bPHKFtB0?=
 =?us-ascii?Q?IlAjjdxwUJVQ40LZJ8lj4OIgQq7sCPAnvk4QAQbz8vTI3yhYXzfHU5U1hGuD?=
 =?us-ascii?Q?bsCUxsF67l2ZDeBDPO6Y5h+Lw8uLq5uEgdUyjwPbdXzcaY8tuFvFb14N3nFe?=
 =?us-ascii?Q?47zeeZti3R2SX5CD7GoGi1fjV0KfON44rM4kwKcCVaeAAztjwjxPt7A27Lzr?=
 =?us-ascii?Q?7zE7p4SCr0HdGS4IexYj5ZpRuI8pmQwNpK4Ih7twHFmmgH6/1QZKxXXgFo0H?=
 =?us-ascii?Q?e4OCllaOqL5jugrTux3xb0VsbbmxRkB888iAA3cdErYc98NJ2N6IGQxa844z?=
 =?us-ascii?Q?PF9iLzpcBbbeTiKLpUxE3sNppo8tAe2Mq5c3N4W+zj7gqUBNt/OQxQ00pU14?=
 =?us-ascii?Q?GMClns44Pt83TXoXT2nxRjTE/JcNHorHQGIiiInT7qJPdTQziLHBq+vXrfrS?=
 =?us-ascii?Q?nTnt/Qix4TpjQQgKRwEpdfh7QDaLdcmSJQywIq1JWpw/K+rjVHVliNvG7m8m?=
 =?us-ascii?Q?01IaCR7JOWuVNN/Mxpq7IVA08TJUb+tOf8kUmYKYxL7i8ddIiLJqIpu7bRyw?=
 =?us-ascii?Q?7bYZvz+dbLkQl627BmD6YKEGn71XKkMof7skxfA3lmAnlXMkOUDoaeuVBHO9?=
 =?us-ascii?Q?zY507L8jAP7kfqd13UTg9SQ8cuFXvpJpZfib+IM9/ApK9B9RqGFwgew17kmB?=
 =?us-ascii?Q?/4QoFObuaVBeQXQou3iV4akBOhlB6WumkAb5DVOW177Sjhrtte9tAbY5vyeZ?=
 =?us-ascii?Q?TCONm68tw85FziZ9RqM2+ZFDMcJ9SuHyP3/6ch5DBxAhyTYBmu8CNZ6Eircp?=
 =?us-ascii?Q?5A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 35770ea6-7d9b-480b-6b89-08dc1b952c56
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2024 21:57:48.8663 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HCdd+Da8vlrujtXE1Bn44CRwc4tsunl0TCZOTj2LNGs24JLBMlWevhxtYICRlxvKrTXFCJXN0a0Edy23QALpj5OiWalgVXrNchOz5ZONCeM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6545
X-OriginatorOrg: intel.com
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Jan 18, 2024 at 04:41:56PM -0800, Zhanjun Dong wrote:
> Expose helper for dss per group of mcr, GuC error capture feature
> need this info to prepare buffer required.
> 
> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_mcr.c          |  2 +-
>  drivers/gpu/drm/xe/xe_gt_mcr.h          |  3 +++
>  drivers/gpu/drm/xe/xe_gt_topology.c     |  3 ---
>  drivers/gpu/drm/xe/xe_guc_capture.c     | 29 +++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_hw_engine_types.h |  3 +++
>  5 files changed, 36 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
> index 77925b35cf8d..5874eb71cbc1 100644
> --- a/drivers/gpu/drm/xe/xe_gt_mcr.c
> +++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
> @@ -295,7 +295,7 @@ static void init_steering_dss(struct xe_gt *gt)
>  {
>  	unsigned int dss = min(xe_dss_mask_group_ffs(gt->fuse_topo.g_dss_mask, 0, 0),
>  			       xe_dss_mask_group_ffs(gt->fuse_topo.c_dss_mask, 0, 0));
> -	unsigned int dss_per_grp = gt_to_xe(gt)->info.platform == XE_PVC ? 8 : 4;
> +	unsigned int dss_per_grp = XE_GT_MCR_DSS_PER_GROUP(gt);
>  
>  	gt->steering[DSS].group_target = dss / dss_per_grp;
>  	gt->steering[DSS].instance_target = dss % dss_per_grp;
> diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.h b/drivers/gpu/drm/xe/xe_gt_mcr.h
> index 27ca1bc880a0..91e6f14b934f 100644
> --- a/drivers/gpu/drm/xe/xe_gt_mcr.h
> +++ b/drivers/gpu/drm/xe/xe_gt_mcr.h
> @@ -7,10 +7,13 @@
>  #define _XE_GT_MCR_H_
>  
>  #include "regs/xe_reg_defs.h"
> +#include "xe_gt_types.h"
>  
>  struct drm_printer;
>  struct xe_gt;
>  
> +#define XE_GT_MCR_DSS_PER_GROUP(gt) (gt_to_xe(gt)->info.platform == XE_PVC ? 8 : 4)

I'd just go ahead and move this to a real function rather than using a
macro.  We expect the hardware to expose the proper value here via a
fuse register at some point in the future (meaning we'll be able to stop
hardcoding magic numbers in the driver), and once that happens we'll
want to have a function anyway.  That will also allow us to avoid the
extra header include.


> +
>  void xe_gt_mcr_init(struct xe_gt *gt);
>  
>  void xe_gt_mcr_set_implicit_defaults(struct xe_gt *gt);
> diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
> index a8d7f272c30a..e973eeaac7f1 100644
> --- a/drivers/gpu/drm/xe/xe_gt_topology.c
> +++ b/drivers/gpu/drm/xe/xe_gt_topology.c
> @@ -11,9 +11,6 @@
>  #include "xe_gt.h"
>  #include "xe_mmio.h"
>  
> -#define XE_MAX_DSS_FUSE_BITS (32 * XE_MAX_DSS_FUSE_REGS)
> -#define XE_MAX_EU_FUSE_BITS (32 * XE_MAX_EU_FUSE_REGS)
> -
>  static void
>  load_dss_mask(struct xe_gt *gt, xe_dss_mask_t mask, int numregs, ...)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
> index cacd50f4718a..2e1ed5bbdd56 100644
> --- a/drivers/gpu/drm/xe/xe_guc_capture.c
> +++ b/drivers/gpu/drm/xe/xe_guc_capture.c
> @@ -93,6 +93,35 @@
>  	{ SFC_DONE(2),		    0,      0, "SFC_DONE[2]" }, \
>  	{ SFC_DONE(3),		    0,      0, "SFC_DONE[3]" }
>  
> +static void xe_gt_mcr_get_ss_steering(struct xe_gt *gt, unsigned int dss,
> +				      unsigned int *group, unsigned int *instance)
> +{
> +	int dss_per_grp = XE_GT_MCR_DSS_PER_GROUP(gt);
> +
> +	*group = dss / dss_per_grp;
> +	*instance = dss % dss_per_grp;
> +}
> +
> +static bool xe_sseu_has_subslice(struct xe_gt *gt, int slice, int subslice)
> +{
> +	int dss_per_grp = XE_GT_MCR_DSS_PER_GROUP(gt);
> +	int index = slice * dss_per_grp + subslice;
> +
> +	return index >= XE_MAX_DSS_FUSE_BITS ? false : test_bit(index, gt->fuse_topo.g_dss_mask);
> +}

It would be better if we could avoid leaking the internal implementation
of the topology outside of xe_gt_topology.[ch]; if we ever need to
change it in the future it's easier when it's self-contained inside a
single file with well-defined interfaces to the rest of the driver.  So
it might be better to have

    bool xe_gt_topology_has_dss(struct xe_gt *gt, int dss_num);

to wrap the test_bit part, and

    int xe_gt_mcr_get_steering(struct xe_gt* gt, enum xe_steering_type type,
                               int instance, int *grp, int *inst);

for looking up the steering targets of a specific instance of an MCR
register.  Then you can use those two helper functions in the GuC
capture code without exposing the internal interface details (and they
can be re-used in other parts of the code as well).


BTW, why does your function here only check the g_dss_mask?  On a
platform like PVC that won't match any DSS (since the geometry mask is
empty and only the compute mask is set).


Matt

> +
> +#define _HAS_SS(ss_, gt_, group_, instance_) xe_sseu_has_subslice(gt_, group_, instance_)
> +
> +/*
> + * Loop over each subslice/DSS and determine the group and instance IDs that
> + * should be used to steer MCR accesses toward this DSS.
> + */
> +#define for_each_ss_steering(ss_, gt_, group_, instance_) \
> +	for (ss_ = 0, xe_gt_mcr_get_ss_steering(gt_, 0, &group_, &instance_); \
> +	     ss_ < XE_MAX_DSS_FUSE_BITS; \
> +	     ss_++, xe_gt_mcr_get_ss_steering(gt_, ss_, &group_, &instance_)) \
> +		for_each_if(_HAS_SS(ss_, gt_, group_, instance_))
> +
>  int xe_guc_capture_init(struct xe_guc *guc)
>  {
>  	return 0;
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> index dfeaaac08b7f..c258228b244f 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
> +++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> @@ -65,6 +65,9 @@ struct xe_bo;
>  struct xe_execlist_port;
>  struct xe_gt;
>  
> +#define XE_MAX_DSS_FUSE_BITS (32 * XE_MAX_DSS_FUSE_REGS)
> +#define XE_MAX_EU_FUSE_BITS (32 * XE_MAX_EU_FUSE_REGS)
> +
>  /**
>   * struct xe_hw_engine_class_intf - per hw engine class struct interface
>   *
> -- 
> 2.34.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation

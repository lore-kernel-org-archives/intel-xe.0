Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 157E6CC6B30
	for <intel-xe@archiver.kernel.org>; Thu, 15 Oct 2026 01:37:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9252D10E55B;
	Thu, 15 Oct 2026 01:37:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CC8110E55B
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Oct 2026 01:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792028229; x=1823564229;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ub495nrEblqUZG+23GJhhxvoDhL+4SfDFXk+120SNF0=;
 b=mjbgQYpJJUaeR/2i1X4V53rLprVH6G+xhOaOIrblKeV8Mto3SlUTZeVQ
 bawsR0TkHMPxrxyLZnmo8l2eZjrPQaW13SVz/eH3lti6YoyJzxYPwg1j2
 Av78tRhdYF19bUrIm8DNDidLna+7KXuBEH9DVWMDttcSMF6u/G3hGcoaL
 PVLMh0545vhWBTKyD/pwSBp+kFdgDu0HIZBrLsu/LbO0qeEMW+kFblRHb
 1nTpZ40vm4j440xRAwhQsSfQmLzhmz9V/nwBQVMRyADm4e21VgyOy8YZw
 TMEE/BhhzdvAErdr3/YbmUodX0tzL1u0ryBBms54m1walKETUFng/9M8I g==;
X-CSE-ConnectionGUID: DTmkvJDgTpmZjy69clSe0g==
X-CSE-MsgGUID: gzIPbzBHSRiklF2sqq0WXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="775351"
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="775351"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 18:37:09 -0700
X-CSE-ConnectionGUID: WJjegbU4RWmQn08JXiSPIw==
X-CSE-MsgGUID: 26prSH1QSP+0fG7STw3cvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="2029349"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 18:37:09 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 14 Oct 2026 18:37:08 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 14 Oct 2026 18:37:08 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.5) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 14 Oct 2026 18:37:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rf3MGj1LHG9UERici9EfXRYQcOSIKdV2BfWymdkx5AWd6hZY8CPELiJtsDnRvt90q/5h5ivKlLPUNHfdVUCHnlFMSKaXYSnFS72b5L3kUyUTzx2eRT7RknDN09BvjaBC8kG8IgwiC4/p5YDe54+WIrewF4T1wfVe3sP6TDjyjzYSIW1Hafx7s3jJ2rLpWIdii9IpWvrMVoHqxx4+pNp7gkgWs3o/j6QMeF1c36qca6lelvEUCYKLD+ncx26uCuoumNeYVT8mWyCRgG4EWleYCYyQBTMENzGYsojQM/KhxGst8i2V5c2g4nJnNgv8ZnySCDEoRpitaE5lpEmi0Mu7qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R2QqmfPl3pXvFPqhFINvxLyrJzFSecXNG5I/MKypJ/Y=;
 b=krYjQRj0zv5Gq5Rb4TLCHX/DTA6fttSoMMXFPewDoxG3w5hZ2wrfD32J1kxgE7HgoNk8N3XQ1sd4PEwDAnvGigH/XpTv9N/d+M0wLU7gRhBo7ylBss4FkrqQ38s/nXgYxfgwfu+xbFlpiOufdsEsL7fD/Z4w754eM4cxa/5SJOUlqAxuuGYoHgUiO7VNLsSJC20aHdUuTR5+Qry4k8UyZkeY60m4i128QemZmBCUaHgDg9XQN0ZQgmrf+i2x+XVgQqYgLytbhOcmzskxiY7VL+hYlUFu37jQtlRwKKt6ZtJ6zGPrq6fxWBWYdKCZSSAwRYNMag5rF+j0qNMWxztWUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4787.namprd11.prod.outlook.com (2603:10b6:303:95::23)
 by CH3PR11MB7794.namprd11.prod.outlook.com (2603:10b6:610:125::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.24; Thu, 15 Oct
 2026 01:35:13 +0000
Received: from CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd]) by CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd%4]) with mapi id 15.21.0522.012; Thu, 15 Oct 2026
 01:35:13 +0000
Date: Wed, 14 Oct 2026 18:35:11 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Piotr =?iso-8859-1?Q?Pi=F3rkowski?=
 <piotr.piorkowski@intel.com>
Subject: Re: [PATCH v7 2/3] drm/xe/guc: Protect timeout handling from device
 unplug
Message-ID: <atAtzwfZx8oyQ1tf@gsse-cloud1.jf.intel.com>
References: <20261013152417.3189567-5-satyanarayana.k.v.p@intel.com>
 <20261013152417.3189567-7-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261013152417.3189567-7-satyanarayana.k.v.p@intel.com>
X-ClientProxiedBy: BY3PR05CA0043.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::18) To CO1PR11MB4787.namprd11.prod.outlook.com
 (2603:10b6:303:95::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4787:EE_|CH3PR11MB7794:EE_
X-MS-Office365-Filtering-Correlation-Id: 1324ba0c-7cb5-490f-0838-08df2a5c8ee6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|22082099003|18002099003|10067099003|4143699003|11063799006|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info: GQLjQxEhDZEJqZgSNsGDkk51Ig7cJkCuguRD0Hvc1EStEYqZ061SjEAaYmqT90g1Lcs4kyNVXePd4fanyO25K4KQnfsEufEKGR1KPhr51ADGzXeVBGXnZBsLNeeaibHg3okgbhNsLiR4vqnLqquEVDXEzffQv+VqGTcN14xJK9Yyka+l6Jcvs2G52cTQrZ2kaybR1WTKAV565msXyEerPMleGwqOsCSbeDsjYv4y6AONPfFNxuZkHMSv8sB8fOckBrU+IuSZkWZ0KLrHUUYw1S50duMG7stlTKx7v4Ls/HfGz4l0zc9OKncUzwivQ0/7GOYPvNw174dYHw05o8nW2tVCZ4jUAml3NEJ8ZnDVb7NZmz3ndSXqeBPl+d1a08fkbhi1CsKDBy4modN8xY/KmvHA4QaH+NpNUOUoL0XGbuTSDibB6GoO134pK/QYBprno0V4CBQ9fb6GhqeT/c6iS04ZNzQHO3oAAOLBZcZQmE4RoHKifi1Clp52tM98ZLQKnHVxYtIA2bpPwzmpndE50NKQOA4CDinO7uBxeGsKTaPVGH+3hKj8unx7DPEac6FLC4s8SBfQJiBmmEWfUUb6YvuXQsXLEB201NDv7qTadFZ5bBb/b+pTE7ka2+s8FqAErSODKObzsB7mkb26UZboPfdE/TfgVZqQBifOfEtMxHM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4787.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(22082099003)(18002099003)(10067099003)(4143699003)(11063799006)(261009223027099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?LpWb0vvUAFAZM5esFPNiwIj87OfLmduH1p8mYL6JHkZplS3bvLV3PHeLKK?=
 =?iso-8859-1?Q?OlefbG9CwoVYXJ8kT/WqzV9bh8O1DcUCw8zYkW+pPqxNv/FpdiDUGR5FVG?=
 =?iso-8859-1?Q?1LhDtqZYO86sey9ThkxK3C5JoW0IUuBfDs3vzqncuQGFVY+yLjOkTMBqH4?=
 =?iso-8859-1?Q?j8CL/+yCrYGMBELa7zCw5LPF8j4qaGCgnUe3s4W27R3eHlJHHpNmYX6437?=
 =?iso-8859-1?Q?47I1dlBwpAoLYX/NV3nsLGrRWoUGqgDNnoDq0B00OlS/nkMgMvfgUrhxl3?=
 =?iso-8859-1?Q?b8KjdUjcl83i4a2LXGSm0MJcnlnGQ129ImEHy2Gcd18ta+EWtIwxluMOfs?=
 =?iso-8859-1?Q?UPtPzhhX8FG0IUWo901kGD7x3TWkIY0ZosAVehcGZQdZ8b8je5spT5e7RQ?=
 =?iso-8859-1?Q?NsF4EtXCgZFgfJI0RA0mLVBKEOzBy5+YkMrdcObBPAhBmDtP3uLZC75FCJ?=
 =?iso-8859-1?Q?LjFlgQxXLZNEKHpOL59dm8Z1hENfhWo6NuLy6DxJt1fxy1j0d8+M530oDi?=
 =?iso-8859-1?Q?/tC0TBE2OMOma2ppbukvod+beyUbSw25ZTO4N13W5jXwYPNJ9f5N1jbp8q?=
 =?iso-8859-1?Q?5T7jp8JdK8ijgN0loxYC0yKJSkHBX0Yo27V6U9K7Vzmz/ssnwdrXlMILEY?=
 =?iso-8859-1?Q?91mNupGvJAUaW2nJpxpEZUVeevhOFB8/Vd/9KSH59F0/w9AGIYv/+98MYo?=
 =?iso-8859-1?Q?b7rG1FPUPRVQrU3lLiXlUGubOw4oPp0NiIZsXXS1dJh3LIfV23pxjIx3eN?=
 =?iso-8859-1?Q?PRt3McJRtTnMe6htFUfDEZG3GkNlL5KczMdmbJ3MQZNmtQ4/P/YOCzBsO7?=
 =?iso-8859-1?Q?WxG1FWt3nZGlaN/91OIqPicM8oHuVLqT06BL/9co+6kSP2vz117vqzd/JK?=
 =?iso-8859-1?Q?5hS0/cpW4Z5UYiy23mkArhvCc9Zs6C+P/gEmZ7zBpenIrywlGwGDgOzzcc?=
 =?iso-8859-1?Q?RIQ15xwtvWyvzI+VWRrA9O23/3gAmwx2wG2E79dtf/Hb/J3014LYHeZvov?=
 =?iso-8859-1?Q?qfxrGhq0o8TORBQWqUMZcCGXT9GIiAB4FXlxDv3X0llEImM8SlEDBLHokI?=
 =?iso-8859-1?Q?djo+HIDWL/Iz0ie4PrwjhQSucSccsJViwMfe3apwtw4MArFInG8OsmRs8P?=
 =?iso-8859-1?Q?/fJaQbbf4q0wqtm/lWhHHsliATZT320rEI9ZXVJUuN4U+v3KOiRiAOaQcz?=
 =?iso-8859-1?Q?RYnT2FT851y1fF3wAsLM58VMz1HEH+W6FvXRKE6EX84uDO/+OX463CZDwt?=
 =?iso-8859-1?Q?L2N2HNGQVzJGnVI0DxASFbmEBpVdUL+lJRrajvtjGS2NVUYgkdiLIu7mZ/?=
 =?iso-8859-1?Q?hOAsZlRjWlytnwuRBfLVOjnVKIHPVAHTYs9ddQAaA7CWtHX6k1gC6FPasu?=
 =?iso-8859-1?Q?jiTyLqosaAtYFGkrSjBYKx0sYsNiN927kJkDEEr0M3E3ipPdXQFhyiJcwT?=
 =?iso-8859-1?Q?+89NpwoNn+E+UU5zNLK3HQGhnwKh/7GVJCNyqib/2OwCGSuc1NDjnjKsUW?=
 =?iso-8859-1?Q?2kxyOXmlTg4nBNA7IaDhQiHV63lFIrCZVqbS+/imOtTHLIlJE364TFXgCb?=
 =?iso-8859-1?Q?ErXWAcIij4NxoCaTl8m2N56q+Me1gyRplbCR/TMSUHro5udIWGZGHvMZ6m?=
 =?iso-8859-1?Q?KYt29VVsp6uVWY8aODWfz3lE4IW2NCLVwU18MxUi/tvGccg5iYlLjqXyoi?=
 =?iso-8859-1?Q?xny4BjxKCoRDBlDr3UuShXmv0NyyIWFMEVQ9qRN1rYjQwmJbQdybcOjukm?=
 =?iso-8859-1?Q?1zaq0dGPDEVnK3dhdg7JGNf9VkuZV6ltdFvvP8S0S8yj2BO1SFt677azHd?=
 =?iso-8859-1?Q?u3fX0Lz18Q=3D=3D?=
X-Exchange-RoutingPolicyChecked: d8zo9sdCK2c2lMOBsz1l4oHxVjQFsv0DyD1Qo/jWzwSJ2tmsRcE+/CKH876YkhSd6xQ4mm0SEWcV1S47iuNqKI7mlbNB/DCj6Fkz2X630blqoIA+7kg9F67yyg3evCQpG8jlsMPaaZ+hu+bppC6dYSxzM3/N2Jf1yCscWKp3UoDS4Y8CwmtN3u1m0dRSP9c5+FTxwSGl5mbrUNJxYg7J7gXTkcGkTAHM6MN4Gvn7DyavSNEbs6VYu+VbJvivUgL3rwdzn0NdDqfCEMVGg4MbBGgZ1D6XRkMg8tvngBD/741B1otq5dbrrnOD6IvdmQJGTNip+68Wy4rATYcYCPPAlA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1324ba0c-7cb5-490f-0838-08df2a5c8ee6
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4787.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2026 01:35:13.4232 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ys5k/Pd6DufqbanJwK5lct1xSVfrFdZ2I9myldM5yzZdGRv/hSWKkCXf2qWuC7zlD7/WeldL4pbJBXdM1RKsnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7794
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Oct 13, 2026 at 03:24:19PM +0000, Satyanarayana K V P wrote:
> The GuC scheduler timeout callback accesses device and GT state while
> handling a timed-out job. Guard the callback with drm_dev_enter() and
> drm_dev_exit() so device unplug waits for in-flight timeout handling.
> If unplug has already started, mark the job with -ENODEV and return it
> to the scheduler for cleanup.
> 
> Fixes: 6eb2aad402cc ("drm/xe: Move hw_engine_fini to devm managed")
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
> Assisted-by: LLM
> ---
> V6 -> V7:
> - Move the drm_dev_enter() after testing DMA_FENCE_FLAG_SIGNALED_BIT bit
> (Matt B).
> 
> V5 -> V6:
> - Return DRM_GPU_SCHED_STAT_NO_HANG instead of DRM_GPU_SCHED_STAT_ENODEV
> (Piotr).
> 
> V4 -> V5:
> - Return DRM_GPU_SCHED_STAT_ENODEV instead of DRM_GPU_SCHED_STAT_NO_HANG
>   (Sashiko).
> 
> V3 -> V4:
> - None.
> 
> V2 -> V3:
> - Fixed race condition with guc_exec_queue_timedout_job(). (Sashiko).
> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 7ce73489c35f..e0a3ce6015e0 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1599,6 +1599,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>  	int err = -ETIME;
>  	pid_t pid = -1;
>  	bool wedged = false, wedge_device = false, skip_timeout_check;
> +	int idx;
>  
>  	xe_gt_assert(guc_to_gt(guc), !exec_queue_destroyed(q));
>  
> @@ -1614,6 +1615,11 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>  	    vf_recovery(guc))
>  		return DRM_GPU_SCHED_STAT_NO_HANG;
>  
> +	if (!drm_dev_enter(&xe->drm, &idx)) {
> +		xe_sched_job_set_error(job, -ENODEV);
> +		return DRM_GPU_SCHED_STAT_NO_HANG;
> +	}
> +
>  	/* Kill the run_job entry point */
>  	if (xe_exec_queue_is_multi_queue(q))
>  		xe_guc_exec_queue_group_stop(q);
> @@ -1786,6 +1792,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>  	 * We want the job added back to the pending list so it gets freed; this
>  	 * is what DRM_GPU_SCHED_STAT_NO_HANG does.
>  	 */
> +	drm_dev_exit(idx);
>  	return DRM_GPU_SCHED_STAT_NO_HANG;
>  
>  rearm:
> @@ -1799,6 +1806,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>  	else
>  		xe_sched_submission_start(sched);
>  handle_vf_resume:
> +	drm_dev_exit(idx);
>  	return DRM_GPU_SCHED_STAT_NO_HANG;
>  }
>  
> -- 
> 2.43.0
> 

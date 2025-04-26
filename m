Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73861C369CB
	for <intel-xe@archiver.kernel.org>; Sat, 26 Apr 2025 04:41:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29CE210E295;
	Sat, 26 Apr 2025 04:41:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SNsXAGiQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA3EC10E295
 for <intel-xe@lists.freedesktop.org>; Sat, 26 Apr 2025 04:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745642511; x=1777178511;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=gTK6LCG11sxm/Q1S08yjwlAXPsTnIh5lP6iIptppSPE=;
 b=SNsXAGiQXCMCFh0uHsR4m46RkdXsFEnaEjF/huOBj6AbUJ6Mt7hjW/Sg
 16vH4bSYVEJP6MYX0kIpbYiq9NQ4AWgAuJ/sE0J3ZF85Jgh0KHDjN1O6H
 RXXN0zEd0JsoLi8pXhErOyJ89fAc5rlx91D1auRQVvav6H9AbHHOubEZ7
 I3JT/1hh9Nk8je4ok7LGGjKnUPb+XQ4YxBIlOlJQis/FWVWPC/H388D4q
 VNwQVBB2+Eo3UWVYZ9wCBV8+nJnkBS/B/89MvdH4Syvb0nK8sVI0zikWa
 oPXIK9rTFEgPZijftz/pGlXL51L6UkPpw9tyYm4gHOktsAcqZl7EDOS47 A==;
X-CSE-ConnectionGUID: hKvET5gYRPaAgSoj4rXSsA==
X-CSE-MsgGUID: d2j/aRyCSLC/3eb7jSPkHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11414"; a="46422524"
X-IronPort-AV: E=Sophos;i="6.15,240,1739865600"; d="scan'208";a="46422524"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2025 21:41:50 -0700
X-CSE-ConnectionGUID: ZpfJq3jaSq+TKnimwCb2UA==
X-CSE-MsgGUID: d2Fdmo8xSNOXZOyldiCeNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,240,1739865600"; d="scan'208";a="137884684"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2025 21:41:50 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 25 Apr 2025 21:41:49 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 25 Apr 2025 21:41:49 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.175)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 25 Apr 2025 21:41:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EzkIYeDnt+g5a36flJLn+IJw6v7uwKd2N0kKdrat9JxSpbuB+o/onfmqoYUkmoUxBVgBE0aWTfUT6kgkwBulp1TM1l9hFd6h/p6m5NCKIXgd12BXkQcbL2OYIIA6rYqJVI35TAKUwbSrHFVICCmpRip7BYhPh1/V93h/O8XW78vUN1fhaQZY5q9fkePgX08OHtqO1SptYauz2PLNzHjY/QEHYfG3RZtmad1XF4r0+SAft9SuuVFaEmvweMs4Zm7KumnCabVEcv2g52Q92PnpDsYEyjwVJLfGZmOZ1/WQ8ZeLgZDDszjfI9/isAQGjkTr0teGvzltfmIZcfhH38pcPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p19FU71tyvPfKcwvteM2kyPAoLpkfiE0a3zoKPCJqyI=;
 b=dY6ISrZdqkdo0ApHAInlnyTssUWtFlv97WLnT3JOBHudcgEO9zhH5LUhVvhPRl2RG+4zurcpvZUdpJrhCZzWgQbf/JzsC3qFCqA/rWcSVPpPaMOen7K4j88wtnJeOS32sDvjHzajbeummCizxtVMjy4VqrA/gt8uprzZQ9V7AJvzfG4tgqx3d9ieQGYWo1BmfqPUskJd0C1ol4FJxSOQNlfpU5vxiMRtTfk8f8eA0fmwRAuIrJWfnafXFFXZiakOPBZO2BjN01NcQsuEv/1sy2RbAsNbzohUYiDHMsePyvp+AUGK9C02c2cS+8ScIMjPAOgvUXY6CMzaHEYAbamK7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY8PR11MB6964.namprd11.prod.outlook.com (2603:10b6:930:57::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Sat, 26 Apr
 2025 04:41:47 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8678.025; Sat, 26 Apr 2025
 04:41:47 +0000
Date: Fri, 25 Apr 2025 21:43:08 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH v2 2/3] drm/xe: Save the gt pointer in lrc and drop the
 tile
Message-ID: <aAxkXAWRnKORzDiA@lstrano-desk.jf.intel.com>
References: <20250426002951.1795492-1-umesh.nerlige.ramappa@intel.com>
 <20250426002951.1795492-3-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250426002951.1795492-3-umesh.nerlige.ramappa@intel.com>
X-ClientProxiedBy: MW4PR03CA0216.namprd03.prod.outlook.com
 (2603:10b6:303:b9::11) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY8PR11MB6964:EE_
X-MS-Office365-Filtering-Correlation-Id: f7a641c5-bf75-4bee-c06b-08dd847ca74d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?r6bpNdMjKFVav3FyI3ifgAZJLo3iNVwn3B75sNWkk9sw5ehI/64c3slp3I2p?=
 =?us-ascii?Q?fOB1byrz1kC2kCHmu3BrDuZLQHaNvLZZfwBH9QeieYuyf/4fARCAnOJxBP+M?=
 =?us-ascii?Q?X8D6xcEfQ3mCcnJqCn+4kbOABnTMPjQh+M27ouJXxNYihSXDsE+ixLo/4nP3?=
 =?us-ascii?Q?pLxI3x+gPX857aOaaBlKNEAXX7E8L8VLx3MAZUG0d9w94ood/au4GigAWplA?=
 =?us-ascii?Q?o16O859A2w74JgRHIr7j1oCXTEFNqz3ogv0S3xIYY0GOiuhz65pxE6oyn12J?=
 =?us-ascii?Q?PXTn7MjjXDDCMCtEbQ/E60/YaYFynWTyR8+IERAzrlt/tAi3AtBjcWMeE0Zz?=
 =?us-ascii?Q?FZBNf0axr3l2Mk0dM2YV5BcNTAd+npNG1ywd5uop4KXpHErW8sps1YJtYdlC?=
 =?us-ascii?Q?rwd8MXL5K0up0ZqGoWJIm/kZEOMWaJ/Selr/aEpXvK0g4etLQo1fm05YCQbE?=
 =?us-ascii?Q?/cCuvuHyiiGJeZcmXGYPnTGCvxbWFFC82Pqkvjz67cPW+wcgqskdxvGSFH/V?=
 =?us-ascii?Q?1WHCZa8lGT+XOh2zyFzz6XzIVatnXCVVJo0iq/vX9AKgzP3S8I43fuebGUj2?=
 =?us-ascii?Q?lecacjsB3vkaG0bDpD3hFaX0930hEzy5oQjt07B+iQr/aSdihVaYc7TquCIK?=
 =?us-ascii?Q?M+iaw5QlJQRtWcfWPRDUpnLxJgxWt7k/P4R2RZ7E9oOuMFDIIJ/t1Had3URX?=
 =?us-ascii?Q?PHd9PzdzcKOSWwFPMI6XzggWFA0tZ4Srkojip8wSjEuU9K9juxLQCLzgVUR0?=
 =?us-ascii?Q?7dHTkHyrqJ8tIC27oHC8OyKGi4bgPIHCoqNb6E1gqqH2nZ7Rz1Ixlyzk+BNZ?=
 =?us-ascii?Q?nfJ+eWUB0DVwDI+YI/Ioq/GPvTEkb26yhgH64G5dFj72avXsblklZqcTn4DT?=
 =?us-ascii?Q?SXQ9J4+QiPvxV5ncpakwOzoq2seVLveKpCrHPwEfx/N6atMBUsa/lvpGvUmV?=
 =?us-ascii?Q?VjOGgk9/BGk5j5pxZvTvI81IJl2u5b1mdCid5J0PqLj+OduJQBXYM8SyY9vJ?=
 =?us-ascii?Q?vxg10o82AhTAptvTM/KP5IkcikKzybwA5Ewh5h1bK5hW/uwy17FYziV9pGwo?=
 =?us-ascii?Q?5PYAvr2WYZKKXPb67ViZ5RDjpb3Nb+17ICyPLAOVJY4EHnb6E4OjUH2JKOD2?=
 =?us-ascii?Q?UydmlqSAk9y3q+8ujxvKDqQ1iWzwf2ZAPD/xmd45dpMLKwPqmdq45vX8B66w?=
 =?us-ascii?Q?3VmmL29cwaRn0kzBkVHQQDKqgYWl4eVs37FS4MGg3HQZN6ORv4wLDCKDJF/N?=
 =?us-ascii?Q?TjIYkyFJBg/9sPbe7+OwhL+GSM0Dc3bDOdQVEBpCXW2I68tPy3vlVKZ/PWn0?=
 =?us-ascii?Q?he9vd6BCQcxqHogCbwP1fFtLuUwzokMTpjkOKcX8AA+fFvR2vmrPWTYT+UEv?=
 =?us-ascii?Q?u+AKdK73aGtLM7Fxg2q20B6PsZ0XEoQnWgz3uF6ofMTnHJcOot7eLXzwFXIU?=
 =?us-ascii?Q?Xa3vneYtJx0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PUnI4uWzaYmLWx1ZzgiUFntzx7iLHE2h/yuY0orxSoFDBXfCpP5l0omf/aLF?=
 =?us-ascii?Q?ou77pjMH6Wro2KKtoAeglXA40etNwVW403lwoTN0pVVonVUIAQOsaPVIp80a?=
 =?us-ascii?Q?n2vWEv8GvGYSDCpLr1s6k6Ts/BltBov+H9Z12jxmaSWVtqNC6YqcL9pzCOCj?=
 =?us-ascii?Q?AUxa5zNZkgAysDgLasCiiv1cNZBQcYvCJEc7xdd9kDCJJokArAyqgnro0v8D?=
 =?us-ascii?Q?lp8bSJWbj/AIMYsw6vQ0Wm0/x6dSOhO70sUWagnJyLQdQLmc4Qexj3NfJ+/z?=
 =?us-ascii?Q?IdzrB8NxVuLXh0G1kteKJ8EY9tCFE6X3HgpPFdQcO2HuJz7vjhvcfYSmZi6R?=
 =?us-ascii?Q?s7rCH3Cri/caqRfEwjH6v033HZfutvJukVIP8HP8EaT0Cf7NOO/oa3Tlp3q7?=
 =?us-ascii?Q?7GRKsm1Mgq1Q1HBQwPh0ESJpZpSPycHjkNoLEt8y2XQvaEyJ2BKuUD3ggeUc?=
 =?us-ascii?Q?VA3rHjrka3pVThziEtvKSWLBYGjik/legsZThGIEMQvWemvA60zzCuxAyUZT?=
 =?us-ascii?Q?+oH4H4w+9/Fasl+SMGUEqqakjRL9MLVH84Ss54XvXGgpkfXIPhthygN9bCA5?=
 =?us-ascii?Q?yFnFgU/SNUiglqgk0RPbZbqONw9Y40owXLbXhiWesyyaEYbbJdx/7p2siltf?=
 =?us-ascii?Q?EsoGBFrTZYDWUJxkKKe4ubAyHgpcw/8TeYUVwazyIdLOZB3q72jn4qJFj0D7?=
 =?us-ascii?Q?HBd3Qd9NrN0bB0IvZNhw5/14dGN2hNCLtBA9/tbvIjcVO2BpoOulI18fPqRa?=
 =?us-ascii?Q?mbRnP1UiRzzE+aJ0zU/zLG0CIQHtmbsnCn3O39GwzD+Zqy+IOPPh+e33KTvJ?=
 =?us-ascii?Q?rEBb7PbEJwnZ87M1ZPsVaoZ2FrJ9xrhA7d8lbZnhcoNpyYeai7LPdG3UfZnM?=
 =?us-ascii?Q?bO9bMKAkGM5B+o2D91xf53SSJz7o804JljxBwn1oiQdpt8eUgQK8gacZbHoW?=
 =?us-ascii?Q?kxEjiXrAkHBZEYjTd0eOYiG0evjMA1szpwKiKX7eNPVcxIh1tPKYnU/xQyzv?=
 =?us-ascii?Q?J+LItYRbAeZwNu8mjfOi/H0QnkF4qfDIP1o4aFSjE6SJSuhebBivoid/DFFZ?=
 =?us-ascii?Q?LR0iReLFRtta8Dxd3tlwHJrrY1ORzQ3UPs/vsOtd8Zvwm6IwCZsSDbKJ6tP5?=
 =?us-ascii?Q?aU45gA4R+e2eNUrjbw43lJ44f2oGeqxFy7aBFmLPKens1HgfJRIqRfTr+blZ?=
 =?us-ascii?Q?WnUpzQ04CMb074JR2lo1oKbgRH6zj2VlCeKNgLHPuEFnLPGZMoCTkxPpll14?=
 =?us-ascii?Q?euM8lI7YAdaeoG91/5cMrDTPUaw+1LZulF1C5gwhxygXIQJHCuNvNPy/mFpl?=
 =?us-ascii?Q?lbyOO+d6ZAd3bq+JQIpzmZjeXm3emgjngHhNaBK1PYfk/BC+IvetczB9gVmW?=
 =?us-ascii?Q?LpMFeIUhy6zlvElgDxba2ZWR5v5c9IvxldzPjish8dyDZCIMLgKApTND469P?=
 =?us-ascii?Q?F7v5ri/b9JVOwDDL9jPHABOxTaLFykcZ1OGXf684Njm46bJQAdMz09kJ3rUy?=
 =?us-ascii?Q?w50WS/xvqoSrds2bIPRoOdlvXUX6/V5QFYF30obpDZ4cFuUGA+q+1kDKBVVd?=
 =?us-ascii?Q?dXnmS9wwDcE6LWU+FaTSQulFNwNSHmfm/+1WIeR8eaRexoZMZYX+743x1xEP?=
 =?us-ascii?Q?ag=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f7a641c5-bf75-4bee-c06b-08dd847ca74d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2025 04:41:47.5702 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7Ax9fsEwx7Q/wAeCitsestbA5Z/Ftu2QK7r6ugMYPA8+hraFifCVkprVb3BMAicpLh5DgEISXbjUnvkGPR9llg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6964
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

On Fri, Apr 25, 2025 at 05:29:50PM -0700, Umesh Nerlige Ramappa wrote:
> Save the gt pointer in the lrc so that it can used for gt based helpers.
> 
> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_lrc.c       | 4 ++--
>  drivers/gpu/drm/xe/xe_lrc_types.h | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index 855c8acaf3f1..089b195e2635 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -867,7 +867,7 @@ static void *empty_lrc_data(struct xe_hw_engine *hwe)
>  
>  static void xe_lrc_set_ppgtt(struct xe_lrc *lrc, struct xe_vm *vm)
>  {
> -	u64 desc = xe_vm_pdp4_descriptor(vm, lrc->tile);
> +	u64 desc = xe_vm_pdp4_descriptor(vm, gt_to_tile(lrc->gt));
>  
>  	xe_lrc_write_ctx_reg(lrc, CTX_PDP0_UDW, upper_32_bits(desc));
>  	xe_lrc_write_ctx_reg(lrc, CTX_PDP0_LDW, lower_32_bits(desc));
> @@ -900,6 +900,7 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>  	int err;
>  
>  	kref_init(&lrc->refcount);
> +	lrc->gt = gt;
>  	lrc->flags = 0;
>  	lrc_size = ring_size + xe_gt_lrc_size(gt, hwe->class);
>  	if (xe_gt_has_indirect_ring_state(gt))
> @@ -921,7 +922,6 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>  		return PTR_ERR(lrc->bo);
>  
>  	lrc->size = lrc_size;
> -	lrc->tile = gt_to_tile(hwe->gt);
>  	lrc->ring.size = ring_size;
>  	lrc->ring.tail = 0;
>  	lrc->ctx_timestamp = 0;
> diff --git a/drivers/gpu/drm/xe/xe_lrc_types.h b/drivers/gpu/drm/xe/xe_lrc_types.h
> index 71ecb453f811..cd38586ae989 100644
> --- a/drivers/gpu/drm/xe/xe_lrc_types.h
> +++ b/drivers/gpu/drm/xe/xe_lrc_types.h
> @@ -25,8 +25,8 @@ struct xe_lrc {
>  	/** @size: size of lrc including any indirect ring state page */
>  	u32 size;
>  
> -	/** @tile: tile which this LRC belongs to */
> -	struct xe_tile *tile;
> +	/** @gt: gt which this LRC belongs to */
> +	struct xe_gt *gt;
>  
>  	/** @flags: LRC flags */
>  #define XE_LRC_FLAG_INDIRECT_RING_STATE		0x1
> -- 
> 2.43.0
> 

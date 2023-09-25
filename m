Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BE2FCE79A7
	for <intel-xe@archiver.kernel.org>; Mon, 25 Sep 2023 23:14:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA7CA10E260;
	Mon, 25 Sep 2023 23:14:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF10710E260
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Sep 2023 23:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695683695; x=1727219695;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=de+1OqeSfjoZ8zjS2h3s7K0njgz51/QuPaRZ0HO528U=;
 b=ihQOJ37WiyuqLa30Cs4kQW2ao4ex7Hwl7+EmpjvVoxjEHpVylssTCUwh
 PUl67xnfvX6hlF7if8aUwf4zrNznFQW4GXEyCA+DblFRLe73uU5t3oqNw
 /jDrEIqKy7tNabvLzcrfdJKixRuSRSA1ZnEJbBwvYKBZfx6gH662EAtpo
 MzaUslhHqrTaLdEQ0xkvv1ohcu5+KVYnO2B2leuEAp6KYFvLx7S4RQTWe
 4mCoKNZ8LdkDFd5QzwhihEzSX3KBff117e3RiVvo+WnbyiOw2WuroQpcm
 jR43O90wVWpBfYZ06X/ZyCV7Nk0w8t036MoVNx8QRVbrCv65LN7ysTNrR g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="384212917"
X-IronPort-AV: E=Sophos;i="6.03,176,1694761200"; d="scan'208";a="384212917"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2023 16:14:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="818816257"
X-IronPort-AV: E=Sophos;i="6.03,176,1694761200"; d="scan'208";a="818816257"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Sep 2023 16:14:55 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 25 Sep 2023 16:14:54 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 25 Sep 2023 16:14:54 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 25 Sep 2023 16:14:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ParAcm0+zZwbCdsc0Nqqov69E44DVyomVXynekldZYzNafEa6ClyK5Eqy4Fn5Y+95ZxlyAHKQ7d/WD80lWZVCrxWmnKGxNPAY60OHnJtsGq3XlmCzmj3ESpXwjhXu6/xgmEj3QSxwjAtr3WJgNuoDF7LQVrOxFpgsakjcc0VxgN/P/ixI1AKvm953hxa6AYcAr003XVcHhShB4b5T41QotbXe6OJ2Cma59bwXGI5VHBpFwYqdlISn8u7o50/VEj8yw8e1mNfGvowFnl97BOIErch4atX4pWnXmACUK4MQgormiwm88xD4hOECSa1knPuHfn15A5dsyNPTsui39eiLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IKdVU0bI8FyZ3CNVPAFF2tuWJyO5D/bbU7S+0p/I+70=;
 b=OwAOfa16ZzbPNrEkuoqJCp9TXc19qv4CyxvgXmhn5p0ut0gGvYrh0l6/twLkufAYLmc0+kRkAG140NlP2NgdbvD/X5rkHrKejZmW6hioO00Y866jtxBPMQTO/t45Voscuc11kpU9WMlas8isZ1GWueIHvf8SazxDjTPJQZdlcXFtWYdhxzRj57ae8IBeuWHlUMLM5PDZ0qaHrkvSFw5Qw6+wmOY1zLOp0C9hG90T+m2uiDAbOq7Xxfqt/tja4VRPaVeTGKn13iOBosV4MTzXMIbpadLoVJqUqrC4tst7YhVd6LDaOOvdflQJz1OxazC5yMFOexAyeKnPmdT3uk4kow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 SA2PR11MB4955.namprd11.prod.outlook.com (2603:10b6:806:fa::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6813.20; Mon, 25 Sep 2023 23:14:46 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66%4]) with mapi id 15.20.6768.029; Mon, 25 Sep 2023
 23:14:46 +0000
Date: Mon, 25 Sep 2023 16:14:43 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230925231443.GC2706891@mdroper-desk1.amr.corp.intel.com>
References: <20230925221049.2681491-1-lucas.demarchi@intel.com>
 <20230925221049.2681491-7-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230925221049.2681491-7-lucas.demarchi@intel.com>
X-ClientProxiedBy: BY3PR05CA0038.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::13) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|SA2PR11MB4955:EE_
X-MS-Office365-Filtering-Correlation-Id: 14e2abcc-7fec-4ac0-49d6-08dbbe1d3545
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: E6Ky6G9UWtye2z9qZArnC8fwEAU7oTfvV5sVMjzh9hb9XVIvOVQmRA8w5rZF46D/gcGDRSdIt17nI4TfVxzwt9PbMNkKq0cXaCM8cOaIAbA/Ofa5b4+FpgUtZjJUQhaUIFBXk+p6i2SuveMRRjwydgIpl7mffxImf5NIb+HWMeK9XBo/xyCZ8PJnpVG+Xzzg1wNNwxby7LdxCaPoBuF/ZlSdwEg0N3MesiarixNBTzVw8wA2PlxFDbnUqHcvJXSMAZkEEwRuc5JJ/+sIyxb58bWDOfvcZiwFUjJAYrTmgpAE6USmrfKpvjgvO4p9sJiOJpiOChv3g30pejSaiFIj14mJ+ifYsLdtjN5U437uVwwZxKX5rXqLCY+xSpKy/c3at0o4lubKIMlCSAlm7Wq1EK7/z628v9D9uzjOn2foT29vrGlH6wT+ndAzZZ5OQ0ZVdWqTj/IIaGhXeFpxdBaJejt9nxFOgYFSP0TF5ooo6yAtCLG0IQuasMTJQjLmcfJQUCXkBUzmFiPGBca7s4HBtgenOemL7GZaQYaM1pqFNjIat2FQOeTRp06LP8D11mO/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(376002)(39860400002)(346002)(366004)(230922051799003)(1800799009)(186009)(451199024)(6486002)(6666004)(6512007)(6506007)(316002)(478600001)(5660300002)(2906002)(6862004)(26005)(1076003)(8676002)(4326008)(8936002)(66946007)(66476007)(66556008)(41300700001)(6636002)(86362001)(107886003)(82960400001)(33656002)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tdN5T2FcAubAYLkrrhqlT4S2ypJQZYyYAPgoS4R3SMQsW/uXC0sxWkNtuGd1?=
 =?us-ascii?Q?LklDPL2WPSdHe6H5WfzAdv8rIezctCUjueDYA1KQNoExqtu9VZ4mZqg09JhT?=
 =?us-ascii?Q?yWmlEp4C8ayAF3qBHmCM5j2A92x0tEGSWbN2HJiZ24sKH+Asxz5ywXpUukdn?=
 =?us-ascii?Q?nRmiwgjSk1wRTZddImnJUKiKBOXHvQxRFi3G0uRRGNcPezlnY9vt3s5CLPDd?=
 =?us-ascii?Q?B1kmgnSvnCr4uQnhtQit+p6jH9V/THtPN+JJOraj+hWBKWuHaT7Fol/ninnu?=
 =?us-ascii?Q?otHi+Hcgl7WbDX/66BL5t3elW6yGjUPJPhqMJvfYGaOmidVslk+f1QwtNGKr?=
 =?us-ascii?Q?aO/FkUQ6KmexZh09j/iPksf6UqAOXzBgTZhAJ2JBeEd2bqCMoLcK17LxWGkm?=
 =?us-ascii?Q?zXcbt0Mz+S6LgGygJawDUeArVPTSUrJLzUfVqWGtuxjkAVjj+HaTLnYKHWtF?=
 =?us-ascii?Q?U7E2nYe5l5sZKUgu+XnOx1LZ2utWKp8y6STqLNwntatEjMWXSpagasVaK2Hq?=
 =?us-ascii?Q?KMjpMN8Dg4CP/V8eA5531PImehZbBKAm1jNg14fIdSZzgyfmieMVbTZ98SKe?=
 =?us-ascii?Q?rl1dr0BeiaAg6ROFaxDNBry87oML+KrO7arJ4yT6csJ5HRdcHsm3rveJfblj?=
 =?us-ascii?Q?drBeKh1hsM2zntQwODrugSSluxk9tD+h0C3TFm0jdopBHv0MU23bwmdG83nk?=
 =?us-ascii?Q?gsWsji6etPRHZPTF1tkWSCjHbeA2pHjb1NIfCBtxSRzY3Xb2cqfyATsfhRWa?=
 =?us-ascii?Q?6iwB2Fq+5ooMsrqZfHu1MVUP+C/WL5u7AGfDEs251ZpW4zhyHIex39uzDVaa?=
 =?us-ascii?Q?HrE97UEqU9sG5zX/pKLVfzCN9pp3Hc1JKPs6dd+/niEx6utVPg+3WfYNx+5q?=
 =?us-ascii?Q?9+5ng8Egq/JsH5BNqIWzaF6d04s7xRNU/vtdTdDSS7cXBy3cMRTD4UleNJBB?=
 =?us-ascii?Q?dSG6rMUYWI4u5u+isboumTp8EhPfjNNDYtwZ7MjbBdfFlm03h+9hRIL8ztpF?=
 =?us-ascii?Q?yXI79yiBLFUk6y4SVYwbRDBGJoAeml6VQuW5y8VA3qbPVIIVSzSJBRME/U4q?=
 =?us-ascii?Q?TNOu96AXE29wofgXSZl5gUXm0iD8QMgS7OuZ3X0cd48KzZor6uVA4/pU6/Mq?=
 =?us-ascii?Q?2pedb2mfeh4nAclcj5KIUATLA6cdSUpR9857COJPKWCaO2ksP178tcxdzfE/?=
 =?us-ascii?Q?YOq82tQv0VsG/DEiBcr6a2uvG9c5/kFecv2q/fKp2YrjKW3yGQ9cDnO3lAEP?=
 =?us-ascii?Q?mnZ9dYzk+cp0HwrTEKdbrCBiJzEAXXmP7hCSb6ny0jZvWEgim79uuknM8FIV?=
 =?us-ascii?Q?FOTpLtqXLCEEAQjXsOHaPFMOnqjAhfWwkKBG/JwJnTJ5cv+eMmE9BdVC8qSh?=
 =?us-ascii?Q?pJ6uRJticHaiqsC+lscat+/z0agYaSXkEEQlgtFuISoei3IVGoGs4ryi8rV0?=
 =?us-ascii?Q?jKb3vVBz6Hyf9uwWLERnfjZUjR8tckzywPpdZIjevSiqumY7fLe1SZl2sz0M?=
 =?us-ascii?Q?CbILwlfaUXDqg7Y2rh9QA+Qpqg5EhNIZPNj6o3p5puWGXs/V1W2YUXZSoccD?=
 =?us-ascii?Q?GZfJ/Q8/Ur1gZijxt7qjL20LHROoHb8ZQSpQaBvdOphXFT3XJloVnomF954m?=
 =?us-ascii?Q?kA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 14e2abcc-7fec-4ac0-49d6-08dbbe1d3545
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2023 23:14:46.1333 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BL1BegwTRv4jMzYV6uFmyiBlJW/dlSw4TucxeUJnkE9G7CJR1nuJORA4t6RQclU2bSbST+208FCsvVkM6cv8/N9rKg9O9oN3W48VcuJgV2Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4955
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 6/9] drm/xe/pat: Keep track of relevant
 indexes
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
Cc: intel-xe@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Sep 25, 2023 at 03:10:46PM -0700, Lucas De Marchi wrote:
> Some of the PAT entries are relevant for own driver use, which varies
> per platform. Let the PAT early initialization set what they should
> point to so the rest of the driver can use them where needed.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device_types.h | 2 ++
>  drivers/gpu/drm/xe/xe_pat.c          | 9 +++++++++
>  drivers/gpu/drm/xe/xe_pt_types.h     | 1 +
>  3 files changed, 12 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 98835ee058f5..7d0f2109c23a 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -15,6 +15,7 @@
>  #include "xe_devcoredump_types.h"
>  #include "xe_gt_types.h"
>  #include "xe_platform_types.h"
> +#include "xe_pt_types.h"
>  #include "xe_pmu.h"
>  #include "xe_step_types.h"
>  
> @@ -342,6 +343,7 @@ struct xe_device {
>  		const u32 *table;
>  		/** Number of PAT entries */
>  		int n_entries;
> +		u32 idx[__XE_CACHE_LEVEL_COUNT];
>  	} pat;
>  
>  	/** @d3cold: Encapsulate d3cold related stuff */
> diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
> index 86386633e206..966b63252735 100644
> --- a/drivers/gpu/drm/xe/xe_pat.c
> +++ b/drivers/gpu/drm/xe/xe_pat.c
> @@ -108,14 +108,23 @@ void xe_pat_init_early(struct xe_device *xe)
>  		xe->pat.ops = &mtl_pat_ops;
>  		xe->pat.table = mtl_pat_table;
>  		xe->pat.n_entries = ARRAY_SIZE(mtl_pat_table);
> +		xe->pat.idx[XE_CACHE_NONE] = 2;
> +		xe->pat.idx[XE_CACHE_WT] = 1;
> +		xe->pat.idx[XE_CACHE_WB] = 3;
>  	} else if (xe->info.platform == XE_PVC || xe->info.platform == XE_DG2) {
>  		xe->pat.ops = &pvc_pat_ops;
>  		xe->pat.table = pvc_pat_table;
>  		xe->pat.n_entries = ARRAY_SIZE(pvc_pat_table);
> +		xe->pat.idx[XE_CACHE_NONE] = 0;
> +		xe->pat.idx[XE_CACHE_WT] = 2;
> +		xe->pat.idx[XE_CACHE_WB] = 3;

These are the PVC indices, but they're not correct for DG2.  IIRC, DG2
should be using the same ones as xe_lp below (although it looks like the
bspec tagging might be messed up right now...)


Matt

>  	} else if (GRAPHICS_VERx100(xe) <= 1210) {
>  		xe->pat.ops = &tgl_pat_ops;
>  		xe->pat.table = tgl_pat_table;
>  		xe->pat.n_entries = ARRAY_SIZE(tgl_pat_table);
> +		xe->pat.idx[XE_CACHE_NONE] = 3;
> +		xe->pat.idx[XE_CACHE_WT] = 2;
> +		xe->pat.idx[XE_CACHE_WB] = 0;
>  	} else {
>  		/*
>  		 * Going forward we expect to need new PAT settings for most
> diff --git a/drivers/gpu/drm/xe/xe_pt_types.h b/drivers/gpu/drm/xe/xe_pt_types.h
> index 64e3921a0f46..bf5000499251 100644
> --- a/drivers/gpu/drm/xe/xe_pt_types.h
> +++ b/drivers/gpu/drm/xe/xe_pt_types.h
> @@ -17,6 +17,7 @@ enum xe_cache_level {
>  	XE_CACHE_NONE,
>  	XE_CACHE_WT,
>  	XE_CACHE_WB,
> +	__XE_CACHE_LEVEL_COUNT,
>  };
>  
>  #define XE_VM_MAX_LEVEL 4
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation

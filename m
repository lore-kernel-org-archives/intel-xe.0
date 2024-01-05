Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2349C3DA6E
	for <intel-xe@archiver.kernel.org>; Fri,  5 Jan 2024 06:49:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9940510E02B;
	Fri,  5 Jan 2024 06:49:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6049310E02B
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Jan 2024 06:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704437379; x=1735973379;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=uG8TvxpCTh8vKx4MNH+/VuDnutMBmpianp+OlgJWZx4=;
 b=JirOOOScfBNq6mGW+l68PYy47R1eTTOqv67+Z4LP5lOxaYvE4szjtRe0
 RJ7MABnSSaJyT1dao2xmxgDajlQEIRRbfAXkDYKKiQXGs+ApZQorZzaCI
 /iyMk126aIIN44rBmR82z0AmANxJuiH9oydq3hZeP8N8t3tryCsLb+iT+
 7t7jee0UDOT0Q1nAai1DFj+hxQp8e1xfgSSwF400Q4c05POssuYkutFdx
 taAyiunpRO8WkQ7osxG8/aU6GeE5+6vw93Pd5L4WgpNl+scnr75FPyZMl
 qMRtQVYLdOQo+i4K1OeXuqyr25DNX8oEoHtQOo3Ad59WxKH6GD3/C6phy g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="16065346"
X-IronPort-AV: E=Sophos;i="6.04,332,1695711600"; d="scan'208";a="16065346"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2024 22:49:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="851050917"
X-IronPort-AV: E=Sophos;i="6.04,332,1695711600"; d="scan'208";a="851050917"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Jan 2024 22:49:38 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 4 Jan 2024 22:49:38 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 4 Jan 2024 22:49:37 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 4 Jan 2024 22:49:37 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 4 Jan 2024 22:49:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oGEg1kJJseGWpOsYcxDiX5TmeNXTghiRSdSs7mkc832qPvAzPBidXp5IAyGzzluXxjyDom17PuUvE1LSRpnwDq0zY59pFdDpklhrlk9Zt+t5NTOBCRERGf1rYcRyBsq9huUo7SBqzT98wjK/u+qBtbM8Z45Q8NESV/zOrMaLI+cpq0XdMFGUL3acykWm3aMyFe3ouLTrFdNcGuiEQxEQaL9bhDDcKnQ0DJ8myaRmLWTuGBO3YiwzrF5Xixy3Nilhec4jdKlEcq0IbQ51592Gwa9gc0aCjvJa033r4D/6SxUVOjz9EdA5pqIJPbR6NQMCqEsLj0KwJ1Np4CBqXf9TGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dtMjmKc3/6AYb0+4w7FV+UzyOynKJeMyM/kkYUzUJqQ=;
 b=IfDv4L2KklI8KQd0NWltvlzhMsO4TSAbG1ksqGoZQPoRld+gSMp6u9I1c576t1yazTRzJ96ejxbM7KtthVdMtxGYuB9Eo9IIPJRfjS9ELLIc87Z26ZjUTD3eqOkGrHJWOErynFA443fNEXvhWobzMypwekYbBWUs+VEfoel+taNRkKYs2PFEEqxn7YNX23+2I0GcGC7ZmBdX1/4HOIenUfQ0j/gtyPEQO79rEg8bJRDev532yOrXE+yjtne0Gq3M97iupibxtzpOitHiQx5h2WI5I0Z40+8Fs6KRe6Mna3bBjWUfue5AOJqZItFB4nHRLDjcDSkezlxxyaLXj1Q5fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by DM4PR11MB5326.namprd11.prod.outlook.com (2603:10b6:5:391::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.17; Fri, 5 Jan
 2024 06:49:30 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::7c9d:1857:d17d:53da]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::7c9d:1857:d17d:53da%3]) with mapi id 15.20.7159.015; Fri, 5 Jan 2024
 06:49:30 +0000
Message-ID: <364e6e5c-123a-4306-ad48-398a03d124ff@intel.com>
Date: Fri, 5 Jan 2024 12:19:24 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe: Check skip_guc_pc before setting SLPC flag
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20240105003341.124422-1-vinay.belgaumkar@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20240105003341.124422-1-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0150.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:6::35) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|DM4PR11MB5326:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ec33733-c048-4552-56a5-08dc0dba77c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Q9ShJaNhV3eJ3muXvK6OhlJwVTjy0AQOEeUFkOpto9V6A4qtXYnpHujlGfPHSywRPb0Jpl4ME/Muv+F3l1n10UG1wU+3TVuAR4GYmYG9xEcYWHCmEk6zEfMem6aH6+dwSkEIjEgH7R9DKSZWDCLSSe/8z3UPyxtgmGiatVBdSCPzMCzpoq414CEy1L1wEYAj6noHP2RBuUfZWkYmGzvk4XeEotG1ZWuOHsG1BBkrOcZgYLVM/W/CT6lCCYroIZH4axbZRMV6jyh9cjbnJfa5SvHlFEixKJTZtPhJs6f4GMJXHcsovhZEIU9ZRnaBNQ9Qt9Wzt5+jEx4r9KtmsLVJOwVFEAI/Nrit4yjzMDPJaLY43MKD2dpBpZJiANtSjXDSJXEWZF+E3KGClyrzVug9pUIBk54OT7LS5AhpCsG9fJCTox0zB292oV3OTAhISzeExtEPETWAje/McHw3Pw6wl/bYn/kJNLFY/MJBw5FPBWxzESFq0fGELC+sZ9jGsjP736xXiMnvoSZc8Yecs+ZAEbPp/it6L6+YSVXuTi4ULmlIP7YqxZ2CPUPgupP6W15sa1NFoVEEYnVTew1DBA0oW/qeusPA6tJFrhskFIIX/8ldX/Og51UFq5/1ZzOu/Xepw3zfbpo2NukYR9NkqizQQg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(396003)(39860400002)(366004)(376002)(346002)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(66946007)(66556008)(66476007)(38100700002)(31686004)(31696002)(82960400001)(6512007)(6506007)(53546011)(6666004)(86362001)(107886003)(2616005)(26005)(5660300002)(2906002)(36756003)(478600001)(6486002)(83380400001)(316002)(8936002)(8676002)(4326008)(41300700001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TldlUlljdytsN1ZyQ2NBMnh3MWIrcWRsa1FPaktWQzBvMUI4WEVxOXBjSmY3?=
 =?utf-8?B?Qlh3NGlzM3JMZlVjM3duajBvVzRxV3dvUVhvTDg1UjQyb1lxdDQxVWIxYVRz?=
 =?utf-8?B?NkJ3TTkwaGVSZ2dRelQ5b0ptOWVoNUJJWHdXYmZjVHBIVUtFTlk4TzBwK1A0?=
 =?utf-8?B?bmpLcFNnQ21zQVcyMUU1MW4wd2wrMkxnbzBYYTErTVRYZTNZbVFIM0FOZFVN?=
 =?utf-8?B?bUFzYm1Ea3JTZHQvb01QaXJOajJ0MStBVDVZMjU2Y055RllHRlJpby80OWlQ?=
 =?utf-8?B?Tm9weG11YVVuTE1zbldDSzZjdnNNWW1KRTRqSEl4clRaVEc4L3dUMElrT2xx?=
 =?utf-8?B?SzBjTkNmSW5jMzZsbDFlSnJvbnJ1VDlFNzBwSEtNUTZEcWE0MWZHNVo3ZVRz?=
 =?utf-8?B?WnJJb1ltcVhxbzViTHZWNHN4Tm9oMW1LSmlpZlYwbEVtdFU0N21FNzNnZjl0?=
 =?utf-8?B?MWs3WlkwZWhZekltQk9CTXhNaFB5WEM0bkJOODgzZUo1QmVTMUtxZHhpbW9z?=
 =?utf-8?B?QmJLVVV3SFFYd3lxZnNWMld4bDFPWG5hMklwa0RDOFI3UVlmSkRMZnJCZFVw?=
 =?utf-8?B?MkNkeVNwcmZBeE9zUUtSUWVnMjVqMHRxM1FaeW53L01PU1A3L3Y3WDJoWUpq?=
 =?utf-8?B?RVA4dGN4bXVRN2NHYmRrcjNaLzFLL2JVMTR3Qy9qcTdvUkhEemtueGtiN2Vu?=
 =?utf-8?B?S3JtSDVJNEdqbHlKL1dkNnF6QkVGSFNLZWVPclhoUlZ4dzNJWjZrZGJsZkdF?=
 =?utf-8?B?VEcyMEJwTjQzMHo3MXR0NlZwUjJzMWlKdVZBaVhmYVBBdWdNak9tTkYvZUtP?=
 =?utf-8?B?UDB1MXhVRUFZRDR0SFUvVjlxSjNKeUkxV1Zuc3ZLRDJzUzFJMG5JbjVvY1JK?=
 =?utf-8?B?OTFscndiSjB2OTk0clZMRTZDVmNSelF6Y2hTNnpsREJ0bmFSUlJycUpnK1Fz?=
 =?utf-8?B?ejd0QzcrcENoaHFGeXZscXppSVVTczhTNHFsSlJhUlpvRHlqWHBaWncxcm55?=
 =?utf-8?B?Sld5Zm9HcFgrMTZlVkV4T3pEcmh1RCtMRXg5WGY3UUhndk1wekh5LzVGUUkx?=
 =?utf-8?B?bUNqakU3NUlsN1ZnQjZmaW5hbVVSR1RGTy82aWp5S2E1aGc3NkJLb0ZtcGxE?=
 =?utf-8?B?d0lGMWl1K2RRMStNbGQxNHV4MjU0TWZrQ0lONUZjbTBmNG1KZ2ZNMlpyV1Zh?=
 =?utf-8?B?Mm1JdnJXMys3bmFiTWhXYWdiMGxWNmcvZW1XUWFhWCtEeGRhOStSb2p5VGc0?=
 =?utf-8?B?Zlp2NGRJVnAyNDdNcG1hM2hZand0Nmk5SVhoeGpsYW5hWVNKWElLMm9XUnBu?=
 =?utf-8?B?aUlDUFdJcFI5dGVMRUJkUFhhSWV0L09Xa2N6RnJVRGpyRzFNbU9Pa0xSLy9j?=
 =?utf-8?B?b00vY1A2UEgrYVdscmxUZi9PQzdkYUpyZTJzZUV2N3RyZW5IbGRXbmhnaTBj?=
 =?utf-8?B?N2lxaks5WDhMbEl4U2l2QVpSVlM2NzJ1T2xoSmRSZHFmR2VXSHVpdGR4aGVH?=
 =?utf-8?B?M3Yrd05UQWdYMVJBcVpOa21xVWF3QXhBVkRKazR6a1liQXNoLzg3Qk1odytl?=
 =?utf-8?B?MkRSTk9BaS9PdzM4alVtZjZhUktUQWRCTFFacXBhTEJzWEV4RGIzVnBKSk9J?=
 =?utf-8?B?elBMMVRoVFJ0ZHkyNDIrT0o1Z1NFUWRkOEVybGNmYWpYbTZHeEFjTHBJaU4v?=
 =?utf-8?B?ZHBkQTUzSVBINTFsWUNsSjFuTDNmbEFMNDJJbG9TS2w3am5JTlZCZnhTR0tt?=
 =?utf-8?B?ZElsTU5YVVg2ME5QbjBZMWNJYmVYcEFxTkFIZ3J6d1BpbEtUMnFiSVBaSjMx?=
 =?utf-8?B?VG1sZ0tPUVRlalRGR3dYRWpYQ1pta2tRTlRvMnpWRVBwckQrVzdzcHlFbEFG?=
 =?utf-8?B?VE1MeUZCMFJWa3lZL3UveEJndzVxUFFVbDZTT3ZGSXl0QjVNRkwwZ0pVOHhk?=
 =?utf-8?B?YWpmMTZyc1dyeXZ1eHJaSHlTbEpHR210Mk5WWEpqMy9aa0pDYU1FRmoyM0ts?=
 =?utf-8?B?R3k3M1poVCtGNyttZklyZXNHeG12TWkyRjMrYzJvUDUyckJNanJRUHBEK1Ro?=
 =?utf-8?B?RXNXVUFWdnBqeTVud0h0U0IxNjltK3lUKytNNUNRU1RUeEo1N0trM1pkellw?=
 =?utf-8?B?R3BGZGszZWNrWDV1ckhKYnNKVE1FMDB2NzM1QkhIREZQYXZXOVZpN0k1dE9r?=
 =?utf-8?B?UVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ec33733-c048-4552-56a5-08dc0dba77c8
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2024 06:49:30.7339 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WEHCBuzH1NMST8GFQ1YzKNJMqoAA0J8ILk42BAzRcHEiwCv1KPOr1ci2L/+MtSZ2IGwtH7Uft+7ogVvGeIsLOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5326
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 05-01-2024 06:03, Vinay Belgaumkar wrote:
> Don't set SLPC GuC feature ctl flag if skip_guc_pc is true.
> 
> v2: Skip the freq related sysfs creation as well (Badal)
> 
> Fixes: 975e4a3795d4 ("drm/xe: Manually setup C6 when skip_guc_pc is set")
> Fixes: bef52b5c7a19 ("drm/xe: Create a xe_gt_freq component for raw management and sysfs")
> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gt_freq.c | 3 +++
>   drivers/gpu/drm/xe/xe_guc.c     | 7 ++++++-
>   2 files changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_freq.c b/drivers/gpu/drm/xe/xe_gt_freq.c
> index 3adfa6686e7c..e5b0f4ecdbe8 100644
> --- a/drivers/gpu/drm/xe/xe_gt_freq.c
> +++ b/drivers/gpu/drm/xe/xe_gt_freq.c
> @@ -196,6 +196,9 @@ void xe_gt_freq_init(struct xe_gt *gt)
>   	struct xe_device *xe = gt_to_xe(gt);
>   	int err;
>   
> +	if (xe->info.skip_guc_pc)
> +		return;
Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
> +
>   	gt->freq = kobject_create_and_add("freq0", gt->sysfs);
>   	if (!gt->freq) {
>   		drm_warn(&xe->drm, "failed to add freq0 directory to %s\n",
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 811e8b201270..0e112b144ec8 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -62,7 +62,12 @@ static u32 guc_ctl_debug_flags(struct xe_guc *guc)
>   
>   static u32 guc_ctl_feature_flags(struct xe_guc *guc)
>   {
> -	return GUC_CTL_ENABLE_SLPC;
> +	u32 flags = 0;
> +
> +	if (!(guc_to_xe(guc))->info.skip_guc_pc)
> +		flags |= GUC_CTL_ENABLE_SLPC;
> +
> +	return flags;
>   }
>   
>   static u32 guc_ctl_log_params_flags(struct xe_guc *guc)

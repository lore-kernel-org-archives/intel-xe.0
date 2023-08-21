Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F555EE4996
	for <intel-xe@archiver.kernel.org>; Mon, 21 Aug 2023 14:59:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCE9810E27C;
	Mon, 21 Aug 2023 14:59:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69AB710E27C
 for <intel-xe@lists.freedesktop.org>; Mon, 21 Aug 2023 14:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692629940; x=1724165940;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=gXSAxFBlTyyBrCqbm3av70ld/SB+4iaNv2c7QJY+e74=;
 b=kri4BjQQds0+e8qLKHUbq6vws40nih+wTUrcsrxc1Ong/pT7Yo2PYqWz
 Gjzr07F9O3OnARnB8aqywz2ct50XXBCNaiHrZUf40BUxYeQas7OOqtv1B
 uI4Ff8rXqpKA6J/rmvx1BfZgB8VLyPmVH9UACb6iRxWSTwg6rWhbd+PwJ
 e4KBvupCC2Ym8cxZgRIgPhk2h7HOC90MjleDlUYdyENgRKfaHOQvf6K9h
 6MW6r2Iryu1vgobmB5HOugjLpxgLKPfcYUnjxLWVbHKcCjFJ+VHelDhBk
 URk4R+dBO/ZPpyKPTcvZyT9Br0RWQ9z7HnNUVsBblDLuFDw8W148Bw46D Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="376359169"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; d="scan'208";a="376359169"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2023 07:58:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="850218232"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; d="scan'208";a="850218232"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga002.fm.intel.com with ESMTP; 21 Aug 2023 07:58:59 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 21 Aug 2023 07:58:58 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 21 Aug 2023 07:58:58 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 21 Aug 2023 07:58:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lLMkX0j5C+aELhQuNmIDYyCVM+78NvOz0/StqKy6u/0OKUYtV5dUFCNQ2+Y2b3vFwnlVJ5VKrTntL0JujrZNRURF11/WZt6nzhcMM9KdQ/n9PCorz7oC3GoJbC4ZX+btnCVQyQEQJwSXgt42NA/7DRisx0H/jlVXb5jZwbvKNfN1ZgbwfBbYCUTzCrwWvSk3s6TbR5rVXJIQcBC+ExIfUG+H75gIga+7yRScepy4irA/4oii5ZX5BY2QfMAV8SIoTlIrtRUcxKNmmhx5R1CeqhjE+NtfiChW0ZbI2F6dXOP3wup/EzeKkSHeEZh/gQ4WJ42JBmtsE9gikI9wvhfwpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PwLy8qdrfETL4nbShRiAJCuXr5fREGTJmi3t9j3S0RM=;
 b=lA8xITU7ajY8w/iSEQErmRzBeDq6KpxYdmcKUAIWIJN8EUFdMRgUUO99Jre3edq5oy6NuZtfxhZxGThqFgNPnb9OrfSPAjMVLfGi3pHRwJ3urvZZ2Z9I8dLbJah07vI+TMonJsjfdH5bOAw36otD6smugVVW47vkxD3QhJNSdaw5FbdyGNlExaoMEC7w7hhAUBDUWgrYGREeriUHxIEOhajjmfyO3/ovVUAKl3bOWllcQEiVTNizzhGp3Rg4X0MiGsT+c+iguggU0YBtEA8ruW9dZub1+hxwtNSuhaW10IE92B8VNkwjRPRP/6BnvUP85DM6EtHkOHwI2dWNXK7xGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6974.namprd11.prod.outlook.com (2603:10b6:510:225::16)
 by MN0PR11MB6136.namprd11.prod.outlook.com (2603:10b6:208:3c8::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Mon, 21 Aug
 2023 14:58:56 +0000
Received: from PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::864b:5f88:8b9d:517f]) by PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::864b:5f88:8b9d:517f%4]) with mapi id 15.20.6699.022; Mon, 21 Aug 2023
 14:58:56 +0000
Date: Mon, 21 Aug 2023 20:28:45 +0530
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>
Message-ID: <ZON7pQL3RH8ZSaPH@bvivekan-mobl>
References: <20230818220824.700519-1-lucas.demarchi@intel.com>
 <20230818220824.700519-9-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20230818220824.700519-9-lucas.demarchi@intel.com>
X-ClientProxiedBy: PN2PR01CA0185.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e8::12) To PH8PR11MB6974.namprd11.prod.outlook.com
 (2603:10b6:510:225::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6974:EE_|MN0PR11MB6136:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b223436-9105-4137-1b28-08dba2572432
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2FxbyeaeTIDlAa7u5ercsWBrxsrW1Rfk5PojnYXL56J7xUbtJjyfZAMTlUi/2xmuyXNDJgztSoH6EqFDuOh3iz78nUkeKZU70AGoRatFKAu5Um2RixfEvgW8J0zDCx1xBhTW2I9jtLc7OqYKrJM43OwvjF91j8DukahaGlqHN7HLZpA3/X8puxdRwOj3CVMi6VWA14KoV+oEt7rT42/17NiYbmY3XycqQhhn8rduAtoQEDmi5EJ7rLbGd0zh25Rb0tL2Moz39SYk0L8SBZdfa1CYXmM6TPqPSQncfvqHBA3G65zUGaAbxkmfa4rheCfXON1Wj0WhKeAOHTDhegeOX6jgMF1tUlM94WwettgDslHdZZUtSuogqCFAGz0BbsZ8sSrvp3PFuImHjSKKEYaoxyV59lDM2YiOYFmzCo4emfDRQ/22MfuJSBy/p2/gU9ygOKU5LKQCvTnd1taqx98xfg2Cqnna90SwxAGh+harG2e2OiCuVG88pwQL4kyRTFVSCpOYv6Pj02LN6GKhNsRS//VrOTCMWFhoKy21y8EPkZzGfUVu02nEEclVh8d3Dmex
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6974.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(346002)(366004)(39860400002)(376002)(136003)(396003)(451199024)(186009)(1800799009)(2906002)(53546011)(38100700002)(6506007)(6486002)(83380400001)(5660300002)(44832011)(26005)(86362001)(8676002)(8936002)(107886003)(4326008)(316002)(9686003)(66946007)(6512007)(66556008)(66476007)(82960400001)(478600001)(6666004)(41300700001)(33716001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dUZCM295L2ZXcjBUSEhMd3lacndrSitERXEvc3BuNGlWNGN4RW5wdjdSVDUy?=
 =?utf-8?B?bFdGeHNPZW5ZMWpqQytZc2VHRHhhYXRNV21jNHZ2bGlaRHFEMzdobEkxOFls?=
 =?utf-8?B?SjYraFQ1VTZNTTJ5a3YzOW44VXNaTnF4MzgzeXdrd1UxQ0RhUEt0eU5WbWR5?=
 =?utf-8?B?L0ZUR05sQmNQUk0yTFBNcHNpRzB5Sm5iOWRqSEdvVy9ZcDUxUkJUWWQ1MkZB?=
 =?utf-8?B?YkQxNTJ1WUdwMTZneHNmSFNtYzhTR04xc1hDSWFRSFpTR1VqdlRGaFhXNXdz?=
 =?utf-8?B?QkZRYzNxc0hEamk2dHorb3NyRUhoNEFXNTBtdmExMURvRmhEWlY3QjFoSHZH?=
 =?utf-8?B?NXRXQXVvRk0rNndjTXFQL2xvQ1NJeDFIUUhET3luaUY2dTFXTm9hR01YU0Zz?=
 =?utf-8?B?MFRaN1pWYUZiVHN4YkFNUElVdnJqRnJkTGQ2akcyaCt5U0lMU2VSOHdZQ0pK?=
 =?utf-8?B?czFrRU5rUTNyWktGMHE4UHZZN2dwY2crbzZXRzhZZWNGR1gyVDhHeTRIakpC?=
 =?utf-8?B?OVlOdEMxbVFCMDJDLzB5WDdNdWhZb3o3dXNmaDM0L09yd2Fpc1dxc0NNc2ZD?=
 =?utf-8?B?TVM5b21HVWVPVitHeEF4Y2RRUkY1VHdkZklWSXNqVVd6R1BpdHdsNStnOVJS?=
 =?utf-8?B?Sk16eWR4YXZ1NU9ndFdXdTc3cFp5UlBrR1BJZFRmTno5b2hrQmprRmlidURE?=
 =?utf-8?B?OWUrTEFVcWpJT2x5K3E1MlptR1YxS2hzWjFJL2JCS3ZGZGlHQnVFRWQxdGRq?=
 =?utf-8?B?Ky84R0hGV3NDZDB3VjBnelhyd29FQzhXM0xCYVM5Q0tkREgrV01GSTdvbWFn?=
 =?utf-8?B?NG4rMCtUTHk3allNSmtLa25VaWZSc1hZR2F5Uk9NUVIwRTFreGVoUGMyTUs2?=
 =?utf-8?B?UFExZGExTkJQWTF3NG5sc2syR0tGRVE5M0ZPQWp0ek9hcDVGMXVSdVdyZ2Jo?=
 =?utf-8?B?eVJBQnRmeTBqVjBlYVRBbVV1TWprYmRqTkprTmlHbGs1RHpxeHFIRC82ZXVE?=
 =?utf-8?B?RFdRaDlzaUV4c2ZtdjJOWVNCMnBISE03MHFvdjFRVFhReXplVDkxTW9nWmIx?=
 =?utf-8?B?R0JRUnRlQUtVUDlKUEY2RjZrWHRHVTk2WTQ4Tjl2S3dUMWhxWERqaWtYRkNl?=
 =?utf-8?B?STFTYXIzMitxTGpBMi84cTBlU3dTei9KWlREVFNWWVF6UU1ZcUpNTGM4SVhL?=
 =?utf-8?B?a3owanhvZzl3TlBtQ0Fvb29qUFl0NmRVdklQamNGZ3RkaC90Zy8rbW53VmJn?=
 =?utf-8?B?NU1GYkt2TkdtK2dzMzRYa05HM29IaldZbzRjdmp3QmNCN0ZOd2luTGUySFlB?=
 =?utf-8?B?NUJVNmQvbmpiUEZqWWdZaEJSZ0l4Tnk0MDJiNHdmc21LRHdKTURDN2NEOXJI?=
 =?utf-8?B?VVJ6UzQ2WVpHb29VUW5mRkQ0UUVRaUhqbTRPQzdqNElYVnVzemsxQ1d6eERQ?=
 =?utf-8?B?NXNpekhVU2lOaW9NUEFUVko4S3YvcEpNMm1lSW51UG5WWDJ1a0dScFVJODMx?=
 =?utf-8?B?eGZ6ajFid0t0Q1VkL2Q3dzdISG0vOEcvb21aTlZIU1BoL3JoYU5LTjVQL1hG?=
 =?utf-8?B?TTVtdTNMVTU0Qk1wN2RWaWlvOFdhb3FLWFExVXl0TytUQWF1ZVdpUy9kTEFC?=
 =?utf-8?B?SEljY01ldjZVTTN2UFhoeVY3ekdFd0FLbjRqem02VXY2OVVyTEtlQWxVaTBt?=
 =?utf-8?B?QWt5c2puUFdUcGI3N2xQZEhjelhpQ3V1dE1GQ1cvZEpZWTM2amRVWmZodWpO?=
 =?utf-8?B?c1E4UHN2TThkR0gwRkhTcERlQWlFelZDYi8xNnF6YUxDb1dJSkM2U3AxdXpL?=
 =?utf-8?B?eGhYbFFTMVB1T1JNUW1HQjhENkdYNUtITElsbHBad2JPVkFIUGNHUk8rR1BF?=
 =?utf-8?B?R1ovM1FvdHBmU1J3VXRFbnkwcEpRWG4yOGh3YWQvMnNuWmVFWFZhOXExbUM4?=
 =?utf-8?B?RW10ZHNLdnVYVGk5TDJJcEZBS2xuUlR0bFpyYlVJWTJFcXZCWGl5QkcxTHEr?=
 =?utf-8?B?cHdNcGgvZHp1bVdmWnR0UWUvaHVNWWM4N3d5a2ZRVjRMRUxNRElaK1V3Ykh4?=
 =?utf-8?B?TkxFTHp2c1R3dk0zbGpxQmRlR0FnWEhnVlAvcmpVN2U2Vk1CNk5wUldIVldM?=
 =?utf-8?B?UFo4T2JBMkJ0bTFvUzJaV1B3SW5kcGMzL21mWVA3SndYVXNCK1BZVmluRmhj?=
 =?utf-8?Q?ksANIwpQVHB6b0ma0j73hyA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b223436-9105-4137-1b28-08dba2572432
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6974.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2023 14:58:56.0160 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pfOTzif/PmmyI+DWTmpAcsQEgoUW9ExiZxOKSx4/9vWcTjp2BwcPIGUwcs9+1vx4ZOr3Oabxo/YtNI/Z+AERPrxCnj0Bw6As+Sy0w07x8uDWV4EtrTxGzRv9wdmHkgxC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6136
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 08/15] drm/xe/xe2: Define Xe2_LPG IP
 features
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
Cc: Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On 18.08.2023 15:08, Lucas De Marchi wrote:
> From: Matt Roper <matthew.d.roper@intel.com>
> 
> Define a common set of Xe2 graphics feature flags and definitions that
> will be used for all platforms in this family.
> 
> Several of the feature flags are inherited unchanged from Xe_HP and/or
> Xe_HPC platforms:
>  - dma_mask_size remains 46   (Bspec 70817)
>  - supports_usm=1             (Bspec 59651)
>  - has_flatccs=1              (Bspec 58797)
>  - has_asid=1                 (Bspec 59654, 59265, 60288)
>  - has_range_tlb_invalidate=1 (Bspec 71126)
> 
> However some of them still need proper implementation in the driver to
> be used, so they are disabled.
> 
> Notable Xe2-specific changes:
>  - All Xe2 platforms use a five-level page table, regardless of the
>    virtual address space for the platform.  (Bspec 59505)
> 
> The graphics engine mask represents the Xe2 architecture engines (Bspec
> 60149), but individual platforms may have a reduced set of usable
> engines, as reflected by their fusing.
> 
> Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pci.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 46e3a9632efe..ed6c4bf8c63b 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -176,6 +176,24 @@ static const struct xe_graphics_desc graphics_xelpg = {
>  	.has_flat_ccs = 0,
>  };
>  
> +#define XE2_GFX_FEATURES \
> +	.dma_mask_size = 46, \
> +	.has_asid = 1, \
> +	.has_flat_ccs = 0 /* FIXME: implementation missing */, \
> +	.has_range_tlb_invalidation = 1, \
> +	.supports_usm = 0 /* FIXME: implementation missing */, \
> +	.vm_max_level = 4, \
> +	.hw_engine_mask = \
> +		BIT(XE_HW_ENGINE_RCS0) | \
> +		BIT(XE_HW_ENGINE_BCS8) | BIT(XE_HW_ENGINE_BCS0) | \
> +		GENMASK(XE_HW_ENGINE_CCS3, XE_HW_ENGINE_CCS0)

Bspec: 60149 lists more BCS engines than what is assigned here. Is it
intentionally limited to only BCS0, BCS8.

Regards,
Bala

> +
> +static const struct xe_graphics_desc graphics_xe2 = {
> +	.name = "Xe2_LPG",
> +
> +	XE2_GFX_FEATURES,
> +};
> +
>  static const struct xe_media_desc media_xem = {
>  	.name = "Xe_M",
>  	.ver = 12,
> @@ -320,6 +338,7 @@ __diag_pop();
>  static struct gmdid_map graphics_ip_map[] = {
>  	{ 1270, &graphics_xelpg },
>  	{ 1271, &graphics_xelpg },
> +	{ 2004, &graphics_xe2 },
>  };
>  
>  /* Map of GMD_ID values to media IP */
> -- 
> 2.40.1
> 

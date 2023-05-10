Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17DE5C7EE22
	for <intel-xe@archiver.kernel.org>; Wed, 10 May 2023 21:08:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCFA410E52C;
	Wed, 10 May 2023 21:08:38 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C45AE10E52C
 for <intel-xe@lists.freedesktop.org>; Wed, 10 May 2023 21:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683752916; x=1715288916;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=q4FSBhSgEt/NNyr8NWTcbzEMVORiYMmdcceZuXVlz/U=;
 b=BIpzCFeXznFeT3ur2rtg4AZkgBknW6P5kPaEi5DWUlhEgcCURl3YaHm0
 Hgo9cvR9iGdwLDLI9J+P7pXt5v/jbGMmu7rSQhkLey3wM8wSuNcJJYkmh
 TeG/Fj9oN9A2zUnbxVKDBle65Otv6clqj2zPyas2nbyJEgTTvVFJkK8go
 mzXvOILRsFQgTpJU47KBuPGUD54sPUC8P07v6AKKtsaapmw2XPYSg5gbY
 V5VxDbGrO8B8q1s02EOAyWyobN27BhurnSKXnK1hF0oDo6Q0TuIbUURfj
 DaA6mP3my6RkcKTZttLnI5MS312eHWR89TL4EihgFoRvTL7V6uo+DJ2fx w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="349160566"
X-IronPort-AV: E=Sophos;i="5.99,265,1677571200"; d="scan'208";a="349160566"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2023 14:07:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="649877836"
X-IronPort-AV: E=Sophos;i="5.99,265,1677571200"; d="scan'208";a="649877836"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga003.jf.intel.com with ESMTP; 10 May 2023 14:07:46 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 10 May 2023 14:07:46 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 10 May 2023 14:07:46 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 10 May 2023 14:07:46 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.104)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 10 May 2023 14:07:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oTDyYFbSXRmzhiK2bgHnBN7X8XRtKyYPLs1WDt9vZVfWWfYhxOJEKbIXrw8IiwL3qw78W1KbUWtO6QY4x5dqSdMxjm/5oFo4YslWNVOglpWLeinVnxmSVpjYvOFW9ONoY5WSqkOpThy55yG2m/PgL57/6NgGA3yQH28EkGherSSP2V6J4ClBUeydiVEMBleg61Bl7XGXGVyq0wmV1j234IXUF3Ba8t49korRkybtK34iI4Zbg8aLS9w199aeyULEyFfnK6GbkqsODh4cG1elrkt9ev1f0HjvUWRAYBP+OjTSJKO5iXDs48Gs6gMb30D1nN7AP+QKljKA3lCeL65zyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X21vNSmMY9CYKuHJr/YgQ3FhOXy3yoPPAl4sg6WJ0mU=;
 b=a6/tb/SIXHNDJ1Z99L+VkGPc+oAhG82ujPl4aEPgJkaTdCmfNQmmGTDQl+1i+7EhiWkZ7X1dSfhS5ZHFjsnlXFjDio8DpfbjhF6//no98/JGCFw1KtiS4Yq/f9RysLVOY9uvwNXzlApCETK34tvAcKLqSBqHHyQD5Ndkveu/zcPCGE7jg8BeM3hZ4ijkHWHv4GvUaP7q6Nox2OtdcAn2JO5xHyTFKAl5vee7OXmy/n08Cucv3IhGs3zobIPfctwk1bwgDfyHV1/vSW8MDyLZBd6GOGeuXNVNSTpjajIYuF5okH8ABWpU7LFWfNPUdEN4eVZjtwidBknAOqxG331uEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN2PR11MB4239.namprd11.prod.outlook.com (2603:10b6:208:192::20)
 by BL1PR11MB5528.namprd11.prod.outlook.com (2603:10b6:208:314::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.18; Wed, 10 May
 2023 21:07:37 +0000
Received: from MN2PR11MB4239.namprd11.prod.outlook.com
 ([fe80::e585:1863:208d:7e7b]) by MN2PR11MB4239.namprd11.prod.outlook.com
 ([fe80::e585:1863:208d:7e7b%4]) with mapi id 15.20.6387.019; Wed, 10 May 2023
 21:07:37 +0000
Date: Wed, 10 May 2023 14:07:33 -0700
From: Matt Atwood <matthew.s.atwood@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>
Message-ID: <ZFwHlVpbDIt2bOZm@msatwood-mobl>
References: <20230510195424.3045127-1-lucas.demarchi@intel.com>
 <20230510195424.3045127-4-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20230510195424.3045127-4-lucas.demarchi@intel.com>
X-ClientProxiedBy: BYAPR04CA0025.namprd04.prod.outlook.com
 (2603:10b6:a03:40::38) To MN2PR11MB4239.namprd11.prod.outlook.com
 (2603:10b6:208:192::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR11MB4239:EE_|BL1PR11MB5528:EE_
X-MS-Office365-Filtering-Correlation-Id: bdb3944a-9c88-4f34-5a97-08db519a94e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WyhTJ4WNWzalu4w37TTKkyHyX1joY5ekEcSLlhmpjCP/Zs3+X/rhShghIQJ65iBemCnHIMUjdH/o+AcQ+S9Unqu/ybHDswsPxr3hFOQaGFqN5IDXbDYJ0iM9RFxXRt45AvJPlqH2Ig/CXhcnPX7Ie0ClVjxwFYNMWFxhQluoeLGUOCmc6c7DHj4nbMB0LdxrT6X6cpazlNPP0Fy6I6psZchZz3i5bSdpLtpYzySYyFbFpQN6WPe7SQTGy+/nWyPLyo1dTAbfgEr1kBIX3yCKOeT+exCYkKBBQzzPbFogi2GW1GJowYMlZxILwwGlAamKGRkzV4K+aV3q9GTlQpa6Sq+/EusYDeCiOPzXwwDYJbvp3VRmVwbURxtZ1YqV/T1WW4zrWNILUT0bHWLiWIXsE3VbGUe1i5HwOin2DZsGhvfKuEfqltNhSBSoHe7WkH0f2hzp+xfkDywujPmiS0oIo9vbln49ANNuEzm7FFrh2hQlPW19La8CKewuCTZ0O49v
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR11MB4239.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(39860400002)(136003)(366004)(346002)(396003)(376002)(451199021)(83380400001)(6486002)(316002)(186003)(5660300002)(4326008)(66946007)(66556008)(82960400001)(66476007)(2906002)(41300700001)(6666004)(86362001)(966005)(38100700002)(9686003)(6506007)(6512007)(26005)(8936002)(33716001)(8676002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YmVrV0NTYkhlNnk4eDhPQjZOSlp4MCtZRmI2QVNvOTRGdEdPNzRxQ2FjM2Uy?=
 =?utf-8?B?Z1oyMzkzMEJSaUozbldiUFJicHUvdlVNZ3M4Vk5VQ05wc3FDa0tSU0wxNFYv?=
 =?utf-8?B?UDAxZHhzei9hL1RBOHlFdllOaFA1TkRsR1dUcXRNQVFydHJhbERLblFEVHh1?=
 =?utf-8?B?akpyVm82d2M4VXlnU0pPMVIyMGNGODZnd0czRXVHaHU4R2crK0ZOMHhMYVJC?=
 =?utf-8?B?aGExOVZlQ2NmLzVNaFgrdnN5Zy9BSTlSb09LdzRqNzFpOEptSCsvMXRTM0Qr?=
 =?utf-8?B?L2xxYjB3b1NESlpuNTRZWTBYUGtoQ2prdmFvNnNEdzBrSHBaek9tck81RUdV?=
 =?utf-8?B?QmMwSGdGSzFqU3BrYUNSUExoNWRtVkVtUnBVS3dtSVl5WUVrV1FiOGgvY2h4?=
 =?utf-8?B?SzEzeU9VU3V2NTZFTmFXR1d0d2NDOTRTMlJjOVlTdXZTcVBVTmlFWHlmMG1a?=
 =?utf-8?B?QVU1ZWxIUnRXTTAwL2ZYc2dNaGFZaUpDekpEdGQxMllhSDM3ZGZ3MGdkUTdo?=
 =?utf-8?B?b0xWTVljOXByU1JoaHF1NDhLREFaaU1TQ25IMDNFUVdyelFoS2JhajVGdXlY?=
 =?utf-8?B?cEhkU2o3VXJXOUV5dlRFSlR3Qmd6aStFemloNmZuWVNNSmc0MzZmcHFFZ0pm?=
 =?utf-8?B?N0gwMVFlemo3eXMwYXIwYVU3SEo3Ry9QOWd3dUo4WUtsZ1ZjSEN5TGhIYS9t?=
 =?utf-8?B?TGt1cmtCa21YS2c1b2k2bmZBaHZkTWFaN2lVaTFOTHdaSTNxYzhWMkNDYjJq?=
 =?utf-8?B?KzVMMmZ2UEJqbW41azgzem8zbU5hS3RKYXVVOTJHUjRBcTc2bk41emM3a1Fj?=
 =?utf-8?B?RzNaRUVUR2hoU3dzTmx0WHpjdzlwSEJacEM1SlFnTzUrRFlHTW5wMEhSWjAx?=
 =?utf-8?B?Ym9YQys5WU54V3NYT1ExQXRPbllUTCtyQUFMakpoRFBmbTFPZXNleUN3amZx?=
 =?utf-8?B?WlhFR2ZJOEpmcDl5OHJMY0N3dXhicUR0L25TbFp3OWhyMlN2eVRCTEVJZ3Jm?=
 =?utf-8?B?UnpvSXhXN05yNlg3Yk9ldFZGY1R4S3p4Tkc4dE9YcGtYSEdwMzY3UXZWdkFN?=
 =?utf-8?B?WC9lM21pMnNrOFAxTmE2eXRTdHJ3YURqSjRWYjVHQUwxcXVFUmhzd1dyaDBU?=
 =?utf-8?B?dWhadVFFM2Q5MHNodFU2R1NUWVBiOEhzdGdpdkplekhiQjZMakJYL1hhM285?=
 =?utf-8?B?dEdIa296elNCMEUvYnI4N25wNXhVUzVFQll4SEZvMGlWYWZOUXNEcEUxTWRR?=
 =?utf-8?B?M1ZNdjhxRktWRk1KU0oxRWJ2SkN0UVNOZmp1RHRrcmFGc3V6ZGFoK1IxVC95?=
 =?utf-8?B?a1FBNlpVSGFhMWZqL1NYdHJhNThwdXMxUDRsYW9TWVA4Z2dMR0FlODk0TXpC?=
 =?utf-8?B?SnQ4WVJROGFqbTNMVFNMdDdiY2dkcmw0YUtZZjZRQ2NiT1I5bW1Bb3VaNndt?=
 =?utf-8?B?STRRRFkxaDlBVEVVaEpuL1hKK28yQmtYcEl6TVVld0ZXTFR5MzdlZmcrbVEy?=
 =?utf-8?B?Y3R3di9qU0xQd3ppZmdnQ2docERtT2drKytDaDh2RGxCUmdRVmFVTU1zbXgr?=
 =?utf-8?B?eHR4OFZMZC9iejdlNk4yQzhiSGhPWWdtOWhtWnlKckhiRzFTSDRMcGJFVld1?=
 =?utf-8?B?OC8wUjhYSWlNcGp1MzBjb0lpSU4zR1NPUnp0cHBUbXlFaDc4T3diRkJYNDh1?=
 =?utf-8?B?cEo0MThuT0RXVnhidVRLSGNBMWR1YUtpM0xPRGVWcjBiVVgydUxCMkpkczJD?=
 =?utf-8?B?N1ljdEJFenZvcE05Vmd1SW50RnF2VmFZOWtSZktwWmtXRE16ckR1ano3ay9a?=
 =?utf-8?B?NnY4YUx0a2FsNEhJV1hsdlJlOVFBR0lGK0JhdEN2MjZyVkViYUNyR0RudUl1?=
 =?utf-8?B?UzdmdjZoUllnSEdYd0lQclhHMk0yRTUrNG02QVpqdG1ROHlNTjhTZmhvN1FY?=
 =?utf-8?B?enk3K0paL3FYdmVCYk9oMVNJYmJGOWpQc21yWjMyN09kbkJVQU9zOHJhL3Vk?=
 =?utf-8?B?dm1zWVJ2S2FENElTanpXdnhWb3VXTEFrSExjWk1aVjkrYmJKd2puMzRKQUJY?=
 =?utf-8?B?S2svdFZxMGljSGRPd2RQZ01wek5vOS9XMXNvYVdCdG1tRTE3QkZ3RkRvZTMx?=
 =?utf-8?B?UnB4V1U0dlBJKzV2YmJpSk01YzZCblJScVRKeFhGSjBUWHRpUFQrUm5FZEhC?=
 =?utf-8?B?K3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bdb3944a-9c88-4f34-5a97-08db519a94e9
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB4239.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2023 21:07:36.9700 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LWz9Xw0QI0t2+KE7l7XmZUesTDjck1G2oAF9Lc6lp+hUwM3iHsKd6YD8AQOi81yn9p4bRY2JRL1vPQ6NZGxFydqyQuSFdcKgX2nY/2K/3v0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5528
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 3/4] drm/xe/display: Consider has_display to
 enable it
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

On Wed, May 10, 2023 at 12:54:23PM -0700, Lucas De Marchi wrote:
> Stop the dance of enabling the display-related driver_features to later
> disable them on display info init if the platform doesn't have display
> IP. Besides being needless work, it wasn't covering the ATS-M case that
> is the same platform as DG2, but without display.
> 
> Since now the display is created after the complete device info is
> populated, the new has_display flag can be consider to enable it.
> 
> References: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/265
Reviewed-by: Matt Atwood <matthew.s.atwood@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c  | 1 -
>  drivers/gpu/drm/xe/xe_display.c | 6 ++++--
>  drivers/gpu/drm/xe/xe_pci.c     | 6 +++++-
>  3 files changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 32cc83c43b2a..1daacc533083 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -192,7 +192,6 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
>  	xe->info.devid = pdev->device;
>  	xe->info.revid = pdev->revision;
>  	xe->info.enable_guc = enable_guc;
> -	xe->info.enable_display = enable_display;
>  
>  	spin_lock_init(&xe->irq.lock);
>  
> diff --git a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/xe_display.c
> index 77a158ecf4cb..43c5af1ff80e 100644
> --- a/drivers/gpu/drm/xe/xe_display.c
> +++ b/drivers/gpu/drm/xe/xe_display.c
> @@ -487,8 +487,10 @@ __diag_ignore_all("-Woverride-init", "Allow field overrides in table");
>  
>  void xe_display_info_init(struct xe_device *xe)
>  {
> -	if (!xe->info.enable_display)
> +	if (!xe->info.enable_display) {
> +		unset_driver_hooks(xe);
>  		return;
> +	}
>  
>  	switch (xe->info.platform) {
>  	case XE_TIGERLAKE:
> @@ -535,7 +537,7 @@ void xe_display_info_init(struct xe_device *xe)
>  		xe->info.display = (struct xe_device_display_info) { XE_LPDP };
>  		break;
>  	default:
> -		drm_dbg(&xe->drm, "No display IP, skipping\n");
> +		drm_warn(&xe->drm, "Unknown display IP\n");
>  		xe->info.enable_display = false;
>  		unset_driver_hooks(xe);
>  		return;
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 7dfbc4fa138a..3fa3e8706d98 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -529,6 +529,9 @@ static int xe_info_init(struct xe_device *xe,
>  	xe->info.has_range_tlb_invalidation = graphics_desc->has_range_tlb_invalidation;
>  	xe->info.has_link_copy_engine = graphics_desc->has_link_copy_engine;
>  
> +	xe->info.enable_display = IS_ENABLED(CONFIG_DRM_DISPLAY) && \
> +				  enable_display && \
> +				  desc->has_display;
>  	/*
>  	 * All platforms have at least one primary GT.  Any platform with media
>  	 * version 13 or higher has an additional dedicated media GT.  And
> @@ -629,7 +632,7 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>  
>  	xe_display_info_init(xe);
>  
> -	drm_dbg(&xe->drm, "%s %s %04x:%04x dgfx:%d gfx:%s (%d.%02d) media:%s (%d.%02d) dma_m_s:%d tc:%d",
> +	drm_dbg(&xe->drm, "%s %s %04x:%04x dgfx:%d gfx:%s (%d.%02d) media:%s (%d.%02d) display:%s dma_m_s:%d tc:%d",
>  		desc->platform_name,
>  		subplatform_desc ? subplatform_desc->name : "",
>  		xe->info.devid, xe->info.revid,
> @@ -640,6 +643,7 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>  		xe->info.media_name,
>  		xe->info.media_verx100 / 100,
>  		xe->info.media_verx100 % 100,
> +		str_yes_no(xe->info.enable_display),
>  		xe->info.dma_mask_size, xe->info.tile_count);
>  
>  	drm_dbg(&xe->drm, "Stepping = (G:%s, M:%s, D:%s, B:%s)\n",
> -- 
> 2.40.1
> 

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5186EC4332F
	for <intel-xe@archiver.kernel.org>; Wed,  8 Nov 2023 22:16:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE69110E87C;
	Wed,  8 Nov 2023 22:16:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6BDA10E876
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Nov 2023 22:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699481810; x=1731017810;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=bJvuaqJuqif/68nbbOMRD5dGlStPCnE0MJaXBxaUVTU=;
 b=MmkUM6HH7+SaDavzLCr6rbtYsMBkkRJQhxCYr7wYYblFljAvZ6kvApxB
 V+Pa6UmpjaJDgDpXuayRRPyrW1X7OaCNIQXcCS3GS2b6hm17G+AVk8ShM
 qJ+cUlwfM6B5IfkNGk7H5yeqc83oxErfDXUtx0dYwrhLDoa/taNwvDn+O
 jLOLlX+w8dOwujmFeZrYlWOHDLhk79XWYhDHnsXRDBoasNaRasi0cfQyH
 aZknkw0my898iYWMFXYvAihzmUp4grtu6wTzecwtgHP5qSwDdMGGWqg+S
 awKKeGXXbI03ehXN3IxUUcGi49ZLChx69eQEQmCC6/2Gzwsss53wgshGP Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="2896336"
X-IronPort-AV: E=Sophos;i="6.03,287,1694761200"; 
   d="scan'208";a="2896336"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2023 14:16:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,287,1694761200"; d="scan'208";a="11332154"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Nov 2023 14:16:48 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 8 Nov 2023 14:16:47 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 8 Nov 2023 14:16:47 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 8 Nov 2023 14:16:47 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 8 Nov 2023 14:16:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hR8L9wZUaM2DmjgI3waiTksOs7gUOJDJaaraqpvjRSYLk8j12FHNUadhyzE7vfH3r0awfVYNi4a2Hm2ZINHEVIfDG/7BAdbDlMJq8WAhfu6EomU0+wCMx/hHwY2KgSkwHqHC4rtCrgrauaKwJYLboSoy7Ap0fe6Ez0fRSwkp0UEZjg3ax1v5E4bNjszxJRaEkByawLodn1Pt0MUOmxOiexpFntkd0NTMJdtdltvKXrHtjNJYgTRDy7Px46hmJupe3R20dM2mpZ0ZE/63g12/6U13oRVVb9+HlzuRVkv/UiMcYnPhe/7gh1WUKjdRW0KoJdJidJjFnmTAGOIs6tDKcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4SW/9dqnvYXBKJuE7suPvYJe5lSu4LG6A0q6NZ/5UrQ=;
 b=BFMkLnzsC8HUtIsgQN6SiiHBcaqKBT9GRhwp3RJy2mz1MWRM5ngzmb4o7UwQxDq2aAJPS3Lh4BH1UL6BjYfgjHp1ucILEGNG+sFFvncUt+AHgEp8dg495tNZ3t8E5RmOZ1gPOOfqRui/WCvh9BrVxQ+1wy9MM4WHU2iM529fL7Y9mROxczzk1kntJwffyBQq8QEApjfenEQ4rAma8gvGbIlODyMORI4NvbYULnURzVGlZAxmP020GH/eoMNy5o2eJxhtRAG0HHIAXwfqXxBK8+c3Fq8u8/3j6SPVn+ufxolehy1STvcDReHblj+E8YUZ5p1bb41WxoqJJZm8bsGwmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH0PR11MB5348.namprd11.prod.outlook.com (2603:10b6:610:bb::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Wed, 8 Nov
 2023 22:16:44 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::3f66:aa7d:51d5:777]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::3f66:aa7d:51d5:777%7]) with mapi id 15.20.6954.028; Wed, 8 Nov 2023
 22:16:44 +0000
Date: Wed, 8 Nov 2023 15:15:55 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
Message-ID: <ZUumK/ru72HfDK+n@DUT025-TGLU.fm.intel.com>
References: <20231108003344.1169016-1-michal.winiarski@intel.com>
 <20231108003344.1169016-12-michal.winiarski@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231108003344.1169016-12-michal.winiarski@intel.com>
X-ClientProxiedBy: SJ0PR03CA0268.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::33) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH0PR11MB5348:EE_
X-MS-Office365-Filtering-Correlation-Id: a20bd2ab-126f-4bff-da72-08dbe0a86410
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GJFY9bIzlT9bnzTpLztc70cBPviG990NhsguOzrW5ss7aBvN/wAQg429DOeSq9ZDcWRPl4VK04MVP4m0HkDmNEILUTvIQDjOjyEzDstlsEDA1dNYXmIZu4MTUbld/tOS8UWUd5axC0YG9sskGKEhWn0Lw7Lwb9xBGoq7xVhIEknPYpLvBPWjfgWz15MfVIla6HsYuCsoOs2vbXz/98q9Huism2D9sKLjmg1gKOa06qbdAnyU2TkasjXr/4n8ix7eVPWmqp0+woQ1lgRdqkXW/4yP/n4Pg5h237UfylVroK95mAVLrCQtWdTkVgt258bsOgsky/n172KwN5+gCnFiJiA4MKaKmbA6+FB7Bux7SdkcQgNjszxGhDe0ctS3O7yL7RffYvhJ1OoBsTr2TSQYWdYd21rgEGAIlhUY6Hdfkr5jm6Z24IdU6/A2Twz3JMUTMehtOsnqvnpFZTFVOTVihwDgqHfJAABHVjuwGAikeXmpoOGbZgObcWzjBwJtM21nlvulMn34ByYyXhtJnXtdS009hQYbs1rVBWlsoMhBuBg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(39860400002)(366004)(396003)(376002)(136003)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(66556008)(66946007)(44832011)(8676002)(4326008)(6862004)(41300700001)(8936002)(66476007)(6486002)(966005)(478600001)(5660300002)(6636002)(316002)(6666004)(6506007)(6512007)(26005)(2906002)(82960400001)(86362001)(83380400001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RVJGRitOZWlBZVlEOU5GVjdCeXFlalNJMGxsTzZIa0dYc3RMcm5nYTg5S2NJ?=
 =?utf-8?B?U0Zxc0ZjcVlkL3B0cnhhUEFpVi9SNUFQVmJvU08xc1dwYkN4RnluUnRCQTVu?=
 =?utf-8?B?bHpzb2FBMmE3ZkJDVUI3WHQ1bi8zZFd2SFZKL3NzWlkwVmxrM2NXY2psNUxR?=
 =?utf-8?B?ZGV6TDFQbzRYbEtHcFAybkZoMWhxMUEvNExqY3B6emlZOFVGUzVJQ0dJL2x1?=
 =?utf-8?B?c3JETEduWHBvSFp0L3Q1bzlrNGZHbmZCSFhsYnpDaTJkaklzdVdqdW5SN0lI?=
 =?utf-8?B?L28vaWtyWnlLYUo4VVhYYVhuRVVKWU83amwrTVNBdnhUZlFSOWRYMkp3bW5D?=
 =?utf-8?B?R0V5dXhrd2ZIcy9zWUVNa3JEOExJbTVnaHBMaTBrKys0dEZlbHBMb1Rld3Vh?=
 =?utf-8?B?c1dMMFI2VUNVejZXaGZBd1dXbERxTDlwNEkyaVR6YmRMaXBTOUNrckQ2QWNP?=
 =?utf-8?B?bDUxL1BQaUxvUjNVeStZQjhMQkVtamI1YlhPblNVSENja2l3NEVOR1BWMGZh?=
 =?utf-8?B?cDFBeGlGbUhWTmhzQ00vUXVnSldTTnR1YXNEczhMWFZROCtzSURTMHBlbWk5?=
 =?utf-8?B?Q0h6ZWdQUDQvWkJMYjJhWStwUGxncWc1cUM4OW5YV3E2ck1hL1Y0Mmd4UDFB?=
 =?utf-8?B?RDlHT2I0bnVCS1hkcm9XMFdjbjhnUTFOOFNYeHJrTVB0RlB4MlcrTjVReXFu?=
 =?utf-8?B?ZXBTSTVYdmV2QlhVOUEzVVVhZys4U3ZqalVDczlpWUI3NDZUSVZQWnNma29z?=
 =?utf-8?B?ZGxVQXVpYy9ZTXc4Zzh0V0p4eXpXRkpxbG4yNUZUeUp6UlQ2SitLU3JrTHJK?=
 =?utf-8?B?UEoybS9EZVI1SjRoNkpRVnhzRUh4dTdES0tOSHB3STllZmllZlluM0RuT0Fz?=
 =?utf-8?B?NVBNMTJlQTk1TjR0ZlJycDNDWjY0THZ2b3RMN0RrMDVMT0NSTWZJT3dhd2k2?=
 =?utf-8?B?VnFxK0VpSUplWGlOQU9CYkZadlNtMGdvRHluUFdNdEhoMVhuWDRLUnNmQ2Nq?=
 =?utf-8?B?bDVRU213SUpIaHgyTlRkL21kYVYvQkFrYTkwNHVxN1JCeVVvL3o2WTd1eVQv?=
 =?utf-8?B?TjF0MGdDWFJzd1FYc292cnZCWmRZNnl6TkY2L05oemVCSEh5K0hUYmRKUzNS?=
 =?utf-8?B?S0xSTStVRzRLVFd2cks4YUV5TlRrWlR5V0hDQUFVNlo1YnlTMCtzc2FzQytO?=
 =?utf-8?B?OGxocGtuclVBa0hpbUJQalpFQzRBdlpvUXkzNGtWODZLa3Z3bWNnTVoxZWR0?=
 =?utf-8?B?NDcvOGVicUdaZ203WTRUN2w5bEtwTkJtbDZQWGZYM0Z2RVlYRVEzM2IzK3p5?=
 =?utf-8?B?WjhLSVFxZHpYa0E0TmliQ0tmc0FpblBEK2tsRld2bWh2MzFSaUV2Rk1BelM5?=
 =?utf-8?B?RkVEQllXaW5lckJnWUhLQ0s3WVI3QUNoaTl1bjdMcEFEUmxrb2IzWTZRUHN4?=
 =?utf-8?B?M1NHVmhHTHVMSVdsY3IvczVwT2hOSkV3TUl1ZWlIWHRDK1VJemFRd0hzcjZs?=
 =?utf-8?B?S1lYV2NMV1AzVktPWVpxL3dKb1JjVkd4Nkh6MWtoWCtnQ0FGSWlYTk4yQnpq?=
 =?utf-8?B?YmdrS3AwU0gvZ3dMSUJpL0ZWSTF4R1lxU2lmNy9HcXFyVTFHcFI4RTlnOHg1?=
 =?utf-8?B?Vk5QRFZkR3YwUC9LZldFVUNpTlRDYlJuTnc4c2VoWlo3b05rK2pUeGhJdHF0?=
 =?utf-8?B?U2VFUkVLU3ZNQk5mNHlJK3JrWkFRZ1IzNFR3Q1VuYk5UVmdIbWpYR0VQSW9w?=
 =?utf-8?B?QkhQd2ZHeDJMd09xdFBIR0hYM3NYSUlZT055UVRDeG1la1c3S2Iwem0yT3Br?=
 =?utf-8?B?Z3pjRDBXdHhHc3NWTkhKTEgvbVBVTms3UnNZZkVaN1F4Q0hYUlJmKytKUWF0?=
 =?utf-8?B?eE5SakNhd09iT2xXYUZYZ1AydkFNeGJCYzlvUkdOai92R2IvdGVKak9adm84?=
 =?utf-8?B?MXZNWG9Ea3BsdXVaVXFlQmh3b29ydE1HeDhjUDFWMEhPK2I1cHp3Mld4NUFn?=
 =?utf-8?B?bDNxUE5laUVPYTJtQzZGNlJ2L1hsR2JMMm80cjR0aDhtRDAzbzMwKzhDTVh5?=
 =?utf-8?B?OHRGcUdVSFN4bEw2UGFrVTNEQU9waFhaanZIZ255VCtWb05BUzVoTXpUUVdH?=
 =?utf-8?B?Zks4ZWFUUDlUVUZ3bDRHVERScVVReG1qQ09ZbFA1dVZxRWErSkRjekJaRS83?=
 =?utf-8?B?RXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a20bd2ab-126f-4bff-da72-08dbe0a86410
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2023 22:16:44.2486 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sRobqA/tY9sBor8ij9V7UgDtWapC5Yg9qb3kjIW7wgcBMl4STnEVfoYLZGObhxyWUaoFRUHmto2V/wE9rjB6AQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5348
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 11/12] drm/xe/device: Introduce
 xe_device_probe_early
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

On Wed, Nov 08, 2023 at 01:33:43AM +0100, Michał Winiarski wrote:
> SR-IOV VF doesn't have access to MMIO registers used to determine
> graphics/media ID. It can however communicate with GuC.
> Introduce xe_device_probe_early, which will eventually initialize enough
> hardware to allow the driver to communicate with GuC early during probe.
> This will allow both VF and PF/native driver to have unified probe
> ordering.
> Initialize root tile MMIO and TTM sys mgr early, as both are needed to
> communicate with GuC firmware earlier during probe.
> 
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> ---
>  drivers/gpu/drm/xe/tests/xe_pci.c |  1 +
>  drivers/gpu/drm/xe/xe_device.c    | 21 +++++++++++++++------
>  drivers/gpu/drm/xe/xe_device.h    |  5 +++++
>  drivers/gpu/drm/xe/xe_mmio.c      | 17 +++++++++--------
>  drivers/gpu/drm/xe/xe_mmio.h      |  1 +
>  drivers/gpu/drm/xe/xe_pci.c       | 26 +++++++++++++++++++++-----
>  6 files changed, 52 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/xe_pci.c
> index a40879da2fbe1..733df9a270db2 100644
> --- a/drivers/gpu/drm/xe/tests/xe_pci.c
> +++ b/drivers/gpu/drm/xe/tests/xe_pci.c
> @@ -143,6 +143,7 @@ int xe_pci_fake_device_init(struct xe_device *xe, enum xe_platform platform,
>  		return -ENODEV;
>  
>  done:
> +	xe_info_init_early(xe, desc, subplatform_desc);

This should probably be in a patch [1] earlier in the series.

[1] https://patchwork.freedesktop.org/patch/566444/?series=126105&rev=1

>  	xe_info_init(xe, desc, subplatform_desc);
>  
>  	return 0;
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 696f997bd2c93..19faddb779808 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -364,6 +364,21 @@ static int xe_set_dma_info(struct xe_device *xe)
>  	return err;
>  }
>  
> +int xe_device_probe_early(struct xe_device *xe)
> +{
> +	int err;
> +
> +	err = xe_mmio_init(xe);
> +	if (err)
> +		return err;
> +
> +	xe_mmio_root_tile_init(xe);
> +
> +	xe_ttm_sys_mgr_init(xe);
> +

Presumably their will be some sort of GuC bring up here during the SRIOV
flow to get the graphics/media ID? Will that be done in follow on?

> +	return 0;
> +}
> +
>  int xe_device_probe(struct xe_device *xe)
>  {
>  	struct xe_tile *tile;
> @@ -382,10 +397,6 @@ int xe_device_probe(struct xe_device *xe)
>  	if (err)
>  		return err;
>  
> -	err = xe_mmio_init(xe);
> -	if (err)
> -		return err;
> -
>  	xe_mmio_probe_tiles(xe);
>  
>  	err = drmm_add_action_or_reset(&xe->drm, xe_driver_flr_fini, xe);
> @@ -418,8 +429,6 @@ int xe_device_probe(struct xe_device *xe)
>  	if (err)
>  		goto err_irq_shutdown;
>  
> -	xe_ttm_sys_mgr_init(xe);
> -
>  	for_each_tile(tile, xe, id) {
>  		err = xe_tile_init_noalloc(tile);
>  		if (err)
> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> index ee89af6b1ea9c..5d7fd16f545c6 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -37,6 +37,7 @@ static inline struct xe_device *ttm_to_xe_device(struct ttm_device *ttm)
>  
>  struct xe_device *xe_device_create(struct pci_dev *pdev,
>  				   const struct pci_device_id *ent);
> +int xe_device_probe_early(struct xe_device *xe);
>  int xe_device_probe(struct xe_device *xe);
>  void xe_device_remove(struct xe_device *xe);
>  
> @@ -122,6 +123,10 @@ static inline bool xe_device_uc_enabled(struct xe_device *xe)
>  	for ((id__) = 0; (id__) < (xe__)->info.tile_count; (id__)++) \
>  		for_each_if((tile__) = &(xe__)->tiles[(id__)])
>  
> +#define for_each_remote_tile(tile__, xe__, id__) \
> +	for ((id__) = 1; (id__) < (xe__)->info.tile_count; (id__)++) \
> +		for_each_if((tile__) = &(xe__)->tiles[(id__)])
> +
>  /*
>   * FIXME: This only works for now since multi-tile and standalone media
>   * happen to be mutually exclusive.  Future platforms may change this...
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index 8945c601e1c54..526a6ac6be56a 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -15,10 +15,12 @@
>  #include "regs/xe_regs.h"
>  #include "xe_bo.h"
>  #include "xe_device.h"
> +#include "xe_ggtt.h"
>  #include "xe_gt.h"
>  #include "xe_gt_mcr.h"
>  #include "xe_macros.h"
>  #include "xe_module.h"
> +#include "xe_tile.h"
>  
>  #define XEHP_MTCFG_ADDR		XE_REG(0x101800)
>  #define TILE_COUNT		REG_GENMASK(15, 8)
> @@ -369,10 +371,8 @@ static void mmio_fini(struct drm_device *drm, void *arg)
>  
>  int xe_mmio_init(struct xe_device *xe)
>  {
> -	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
>  	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>  	const int mmio_bar = 0;
> -	int err;
>  
>  	/*
>  	 * Map the entire BAR.
> @@ -386,15 +386,16 @@ int xe_mmio_init(struct xe_device *xe)
>  		return -EIO;
>  	}
>  
> -	err = drmm_add_action_or_reset(&xe->drm, mmio_fini, xe);
> -	if (err)
> -		return err;
> +	return drmm_add_action_or_reset(&xe->drm, mmio_fini, xe);
> +}
> +
> +void xe_mmio_root_tile_init(struct xe_device *xe)
> +{
> +	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
>  
>  	/* Setup first tile; other tiles (if present) will be setup later. */
> -	root_tile->mmio.size = xe->mmio.size;
> +	root_tile->mmio.size = SZ_16M;

This value doesn't change based on platform at all?

>  	root_tile->mmio.regs = xe->mmio.regs;
> -
> -	return 0;
>  }
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
> index 9f1a25cfd2cf0..894a792ac8abe 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.h
> +++ b/drivers/gpu/drm/xe/xe_mmio.h
> @@ -21,6 +21,7 @@ struct xe_device;
>  #define GEN12_LMEM_BAR		2
>  
>  int xe_mmio_init(struct xe_device *xe);
> +void xe_mmio_root_tile_init(struct xe_device *xe);
>  void xe_mmio_probe_tiles(struct xe_device *xe);
>  
>  static inline u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg reg)
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 87c45c6e08aec..2f04f07dc17a4 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -532,10 +532,12 @@ static void handle_gmdid(struct xe_device *xe,
>  	}
>  }
>  
> -static void xe_info_init_early(struct xe_device *xe,
> -			       const struct xe_device_desc *desc,
> -			       const struct xe_subplatform_desc *subplatform_desc)
> +static int xe_info_init_early(struct xe_device *xe,
> +			      const struct xe_device_desc *desc,
> +			      const struct xe_subplatform_desc *subplatform_desc)
>  {
> +	int err;
> +
>  	xe->info.platform = desc->platform;
>  	xe->info.subplatform = subplatform_desc ?
>  		subplatform_desc->subplatform : XE_SUBPLATFORM_NONE;
> @@ -549,6 +551,12 @@ static void xe_info_init_early(struct xe_device *xe,
>  	xe->info.enable_display = IS_ENABLED(CONFIG_DRM_XE_DISPLAY) &&
>  				  enable_display &&
>  				  desc->has_display;
> +
> +	err = xe_tile_init_early(xe_device_get_root_tile(xe), xe, 0);
> +	if (err)
> +		return err;
> +
> +	return 0;
>  }
>  
>  static int xe_info_init(struct xe_device *xe,
> @@ -611,13 +619,15 @@ static int xe_info_init(struct xe_device *xe,
>  	 */
>  	xe->info.tile_count = 1 + graphics_desc->max_remote_tiles;
>  
> -	for_each_tile(tile, xe, id) {
> +	for_each_remote_tile(tile, xe, id) {
>  		int err;
>  
>  		err = xe_tile_init_early(tile, xe, id);
>  		if (err)
>  			return err;
> +	}
>  
> +	for_each_tile(tile, xe, id) {
>  		gt = tile->primary_gt;
>  		gt->info.id = xe->info.gt_count++;
>  		gt->info.type = XE_GT_TYPE_MAIN;
> @@ -717,7 +727,13 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>  	pci_set_master(pdev);
>  	devm_add_action(&pdev->dev, xe_pci_clear_master, pdev);
>  
> -	xe_info_init_early(xe, desc, subplatform_desc);
> +	err = xe_info_init_early(xe, desc, subplatform_desc);
> +	if (err)
> +		return err;
> +
> +	err = xe_device_probe_early(xe);
> +	if (err)
> +		return err;
> 

So this is the point where need the GuC to be up (eventually) so the
GMD_ID can be read with SRIOV?

Matt
 
>  	err = xe_info_init(xe, desc, subplatform_desc);
>  	if (err)
> -- 
> 2.42.0
> 

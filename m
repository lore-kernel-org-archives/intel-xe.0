Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EC43E810BD
	for <intel-xe@archiver.kernel.org>; Wed, 27 Sep 2023 10:17:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1F4610E4C8;
	Wed, 27 Sep 2023 10:17:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B791610E4C4
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Sep 2023 10:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695809864; x=1727345864;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+mi7bXZkGIGmmzA8H0iqfBAZvMH9XzqfsT4xWbPwSWU=;
 b=S+KGkCS/Pn3GEqd6B/MQxbUDaWv7HvdHntRsCYsOCOK7Zj+t/7yfdmdy
 eWUtjO438vDm7BM7WKR3tK+ZVD2qbaBVNVYO37ehqM/M+prQcaPP0M+Z8
 BujLcIUHBRRkTS81CUZnWTLICD5DYjpjO3FCedKj72U4lcodlJRIsBgLP
 a/at+TboPlBiEVT1J4azZ70ktAgKSEYzwpJVu/Css03653megVYA5VDfL
 QqyADjJ5I6SxVD2oawBayts2hsjmNZuxBjeAqg52MW6EygSrpFcSfuOML
 O8ONFIIk4Svq0MExxJk5e1XYUzEfB5HkX1fDxrYTd074ve00WuHfuyvTA Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="381691457"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="381691457"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 03:17:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="752516268"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="752516268"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Sep 2023 03:17:43 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 27 Sep 2023 03:17:43 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 27 Sep 2023 03:17:43 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 27 Sep 2023 03:17:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AgltmcuHaX0QzbPPljSI6ReEFCc2NpSJd3UEk+q1+QTOW41ho+qP+8uScZzXf4aNkBRtipFPWXXpk9He/SFSKsyGUasccu+RsfEaDdWBKL0wafdDTJuV7qlyvoIMNiLuio78G8OFWQPw3jte2k0ks7izNrE82sPWZK42ReSzpUPQ5dgA7R8PYwSUkBomKiybINnPOVF4aH968gIvHqqQqnZlYAmgq+qze9HKMK0liiE3orR+Wxz/u+4dH0M8XwWvYGISq+d04THN/tAHD1J5/1tRqnIjvLDMN7ifKIW6ld66vIKgZna3RSkiQ3IG1T0rxSU+rAGxvjk3UjLymOFntw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pPckkDvTfEH2oO7ERW2+DvbY55SMCWPc2vjWZE1diAA=;
 b=GogSdN/OMG8WswgM+yZZD6S8WGnA7e9t4s8qC1LCNy+rddwGLmHlNTPAMfC2lscinC9atFbUoOFU+CGE9aLQsrMCk9QiOSAnDoNUqFWtzltIPrIrgsLsZSPUkqVYHd8Ch9t6Hkl1IRQHS0DtPpTGGtRW201kZz1OdRA8Ap4e4Orl94pS1S2j04Mn8EdMrite4Nm4pfwQZjy52n2K024e6yLqmNPb0UCwd1l3OUdF8KimeHAhCfutK/Q4jg1x6eLlPGN6uKpKKxIyomrXhOdOIEaYptA9XE90GCjXv5DDEsJCZ2RTdLfBXPcRcMvvxEu1mQm3UP6FkcZH8T+m2/JWFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB2907.namprd11.prod.outlook.com (2603:10b6:5:64::33) by
 MW3PR11MB4538.namprd11.prod.outlook.com (2603:10b6:303:57::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6813.28; Wed, 27 Sep 2023 10:17:41 +0000
Received: from DM6PR11MB2907.namprd11.prod.outlook.com
 ([fe80::15b8:204f:76d6:89a4]) by DM6PR11MB2907.namprd11.prod.outlook.com
 ([fe80::15b8:204f:76d6:89a4%6]) with mapi id 15.20.6813.027; Wed, 27 Sep 2023
 10:17:40 +0000
Message-ID: <c979ce59-3586-c80e-358f-712285989acc@intel.com>
Date: Wed, 27 Sep 2023 15:47:29 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20230922211323.1672907-2-matthew.d.roper@intel.com>
Content-Language: en-US
From: "Kalvala, Haridhar" <haridhar.kalvala@intel.com>
In-Reply-To: <20230922211323.1672907-2-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0165.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:de::9) To DM6PR11MB2907.namprd11.prod.outlook.com
 (2603:10b6:5:64::33)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2907:EE_|MW3PR11MB4538:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e9285e3-6326-4a7f-1601-08dbbf42fad1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Sec8Y0EfvLl6KR3GmYg1wyWkJaQ7gqz/NDAP0Vej9qDH5sQomen1GZ/iNJn0yQ47LuMuHPngMQ9KiQBGhYx+cGXiB8nYYQq9dbxihi8vk5Jl3Kz4rHyslAmg84UH5AWOSGx3qybuxGvim9Gl8WPh9NbP2jRj6jGH1uU7JX2mB1q1XCwE4j2sTcf6C/rniCHqATz8jbv3mB1ZJ2v5bJ7H3uxC2HQL8zZgK6Pahcn+65zZWRbFGV9Sm9hVmu0xWPBtU5dODHw53wXvvAuAzbhKKGAba7zC7Kz5Wb0CpZvDEefDTbs9yaWvv4Jy1if20Ne4DJN43AeGD4IoNH1NYu/HrnXSdhHNpEWZIQbayXB1aUng5NLTovlXjmNHuMLu4W9WxBzAWT8Q9jdCHYb/Gr1WNhSMMzOENafePfZhGZ9i5LX7JyB2Kn9Y9Kfj4CIzyc+5xXvxuLkqmdCodCnmp8E0IPsVTGndloljrBbmvw1k+ymfjuNdhwvefAfV1JYjXuBl6UhyzpTSW3LNMKaJ0WXjRgfPya2JH0P/2wNY2WxYAhs9AFvsLjL9WilhtLQZ1+hWKAnxrS1o/u/Uk1TvTezvQMsB2ja95HiN//c54EYTVHKNSP+gfiPVgrsvW2V+hUYujbUZrPYoSkXhRQVUI/D/Jw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2907.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(39860400002)(376002)(136003)(396003)(366004)(230922051799003)(186009)(1800799009)(451199024)(4326008)(478600001)(2616005)(66556008)(83380400001)(316002)(41300700001)(26005)(6506007)(66946007)(6666004)(6486002)(6512007)(107886003)(53546011)(66476007)(8936002)(5660300002)(2906002)(82960400001)(31696002)(38100700002)(36756003)(8676002)(86362001)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MVg3eWFqSGxmR0I2NGNBVGhSSmwwRnFEVzdPTDRsZ1VkMlJsa3E2aGRLdkE5?=
 =?utf-8?B?M3ZYQlJsMm9tT2NWQkNOOEtjcFgrc1ZsM0VjUkZsNnRlbFVROFJEb1ViQXdm?=
 =?utf-8?B?RkRzbENST0oyMkZuem9ra2dtdUo3NDlnbkdHeG5OMGVuTDdXR29WaHdrTDNT?=
 =?utf-8?B?U21KUFZRMHc2QVJ0N2NWZGo0YTNYaWNJZHB1ZklmRzZWc3N1KzNNcC9WN2ZT?=
 =?utf-8?B?aWtrY2RDK3A3Tm5PTU80VTFUazRLV3hQVzY4bS9CZ2FKVjhUbmJvam15cUY5?=
 =?utf-8?B?WW9vV0gzK0F6MVdxWk5aRC82SXpKb1FlaEhzN21UaFRCYkU5QklXcWk0OWcz?=
 =?utf-8?B?YWFWSm5GTVlNK0pvOGxGR1dlUEFGWjZmb3luWTg2dmQreVZFTzcvWHVQcW4v?=
 =?utf-8?B?Ym03NGpnYkh1bExtQ0pyNEp2WDNPL2F5VkY4QWYyN095dDYwd0JvUEhaQ3hu?=
 =?utf-8?B?cjNjWnp5TXdEMjFRRXhKcDJNNTcwMGlFRmVUdmQ4R3B4ZzB6NXhRRUJZdHVW?=
 =?utf-8?B?MDdQRW9hc1VOSEliaWx6N3hmWXVTN0xkMENHMWxIL2pzUk43bW56MFdPQmdh?=
 =?utf-8?B?YllVb0ZXSDA2ODZQSGlWOWhaL0QrdFRIN1FCdUlzNkl2WTU4REx3djNBb2xC?=
 =?utf-8?B?L0FkODBVRVllTGFqRkptTFJjdG9sRHdPM1hKY0RkcE9PdUw4Y1NBYWRtRWUy?=
 =?utf-8?B?amFJUS9zVkJoaTRMWkt4T09aTmY1cVJLV2FjcWduZUNjR0RaTTF2eHM5Y1dU?=
 =?utf-8?B?Y09ONHpBYkxSd2pjcFd3Z21XTm1Ub3BYVjJHMk1KeXRsM1Q5YUtUMWJoS0p0?=
 =?utf-8?B?Tm1UVVhMQ1d5Q0l3bU52MHYyMG1xclRhSG9SQXo1TDNKbHppVWVUNnlJNlFK?=
 =?utf-8?B?d09qZUwraVg5ZHFXak5sNXd2TFZmZGxabityNkFLRHc3TVpRUGN6bTUrRDYw?=
 =?utf-8?B?NVFpQnNwZHExbDgxVEg2ZUNTSm4wRldVTjJjQ0hMdG1UaUV1Q0JCNldzM3FL?=
 =?utf-8?B?ZkN1bFMySlZZMmZTaHdheHJ4M2dQZGMzdXBnbkJYNVU5em9TcjBteG9qaStP?=
 =?utf-8?B?MHdHNUd3MFZjRm9HRDMySm5xS1NPTkJpS1hxVjEyMzkzMitXRW5kZExGMjNr?=
 =?utf-8?B?eU5yWnJnWko5aTkvZFpINTFxK0tNTTF2ekVhRzMrYW15UXk0cFJ1dTMwMXpP?=
 =?utf-8?B?dGMrVGcrRlVQaG1CMEFsUDBnMDFsS2JuVDI5bnY2aE15aGlhdldydStQUkZY?=
 =?utf-8?B?M25ZOVgyc0FRTisvM09vMGlTMWdaejF4LzJIcWJJdytlczNxYTM3QnAxeEVa?=
 =?utf-8?B?NmlXc2VOa2kxU2hQdm1NSkw3QnZaTWt3b2VhRmlSeGZvYUNXcXhSRk9CelNN?=
 =?utf-8?B?TXNZb0c4V1c0RnpJQ2FDblRJcFd6U0FCUUpQdlV4QnJ4MGRZbzlUZldJK2l5?=
 =?utf-8?B?MmRGTTBuQ2QxQTZDNG91d0Nrb3JkbkVCSWdrMnRicktlUGtJRWdSNmxPSzZ4?=
 =?utf-8?B?OWpqdnl6UUc2bGtERlJXaHdnS1F6UWxOZ3pia1JDamtlSFhVTS9XSlpQbXN0?=
 =?utf-8?B?SUMwSXVzTlZmMjhxTWtsbStoam9rMjVlRXlWUmpTZG9wMFF3eGMrU3dpN2lJ?=
 =?utf-8?B?OWxUdUU0NFlrVWZ2YmpGcDF3RVc3YVNab25BOHo0M3NpdlJqeVFxL3ZJcDlJ?=
 =?utf-8?B?TmpvT3cvaVNsVkh0eDRTNXVqQTNycVYrTElVRzFYT2VlYlBCVGVxc0oxWHNa?=
 =?utf-8?B?WTg1eXhRQVdZd0QzYzhGT3Y4ZkY5am4vR0dXa2JWaVV4MkRxT1lXQ1BHbS9M?=
 =?utf-8?B?aWV1eWxlSHNPRi9lQzhHRjBzQkp6VEMrTzgrY3Z0cU0xMDJkTW9lTG9ZTWp5?=
 =?utf-8?B?TWhFVUNBc1RraXlMOXgwSXVFcXVBQjRWYzZnUFMzWlZIQWJSc1pKRklTK3N0?=
 =?utf-8?B?Mm8rYzRJWkI3RVYvVFJ1WUtPSWczaGEwOTVac1R2Y1dlQnZMdkw3VzFrNW5a?=
 =?utf-8?B?Y2Q4V0NoWGxyWlBDL2MwcFNkRVJGcXJubDB2bThVcTRrKzRKazRKTDFmYTlR?=
 =?utf-8?B?WWFMSy9QRlo2Y0FlWDlaSWxMWTVTZ3dwWTk4cVJodjNZS0dyWkF6emZzcjdp?=
 =?utf-8?B?WnE5NVJTR1dRVmdnN2pnL1NQeHZJZ1ZzUDhxeEZsMEc5aGhmRVdhV0xKa2No?=
 =?utf-8?B?bWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e9285e3-6326-4a7f-1601-08dbbf42fad1
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2907.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2023 10:17:40.3850 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9gPql8Fy6Ce/yM2H6mHfNwUmZVUAMzSRD+5oInOv8P/gbCA3JPbuK3jzQF6EGVmKswTYwpvgdDryj9MV6yYPucHAYd8elQq8dqDB0+qWmOY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4538
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Infer service copy functionality
 from engine list
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


On 9/23/2023 2:43 AM, Matt Roper wrote:
> The newer MEM_SET / MEM_COPY blitter instructions are available on any
> platform designed with service copy support.  Since the GT's IP
> definition already has the list of (pre-fusing) engines, we can
> determine whether these instructions will be supported without needing
> an extra feature flag.  Deriving this functionality from the engine list
> also fixes an oversight where our Xe2 IP definition was missing this
> feature flag, even though it supports the MEM_SET and MEM_COPY
> instructions.
>
> For clarity, "service copy" is a general term that covers any blitter
> engines that support a limited subset of the overall blitter instruction
> set (in practice this is any non-BCS0 blitter engine).  The "link copy
> engines" introduced on PVC and the "paging copy engine" present in Xe2
> are both instances of service copy engines.
>
> Bspec: 65019
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

Hi Matt,

Looks good to me.

Reviewed-by: Haridhar Kalvala <haridhar.kalvala@intel.com>

> ---
>   drivers/gpu/drm/xe/xe_device_types.h |  2 --
>   drivers/gpu/drm/xe/xe_migrate.c      | 32 +++++++++++++++++-----------
>   drivers/gpu/drm/xe/xe_pci.c          |  2 --
>   drivers/gpu/drm/xe/xe_pci_types.h    |  1 -
>   4 files changed, 20 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 32ab0fea04ee..2d20bcbe8d9b 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -234,8 +234,6 @@ struct xe_device {
>   		u8 has_llc:1;
>   		/** @has_range_tlb_invalidation: Has range based TLB invalidations */
>   		u8 has_range_tlb_invalidation:1;
> -		/** @has_link_copy_engines: Whether the platform has link copy engines */
> -		u8 has_link_copy_engine:1;
>   		/** @enable_display: display enabled */
>   		u8 enable_display:1;
>   
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 9438f609d18b..3fa47df52d4e 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -854,28 +854,36 @@ static void emit_clear_main_copy(struct xe_gt *gt, struct xe_bb *bb,
>   	bb->len += len;
>   }
>   
> -static u32 emit_clear_cmd_len(struct xe_device *xe)
> +static bool has_service_copy_support(struct xe_gt *gt)
>   {
> -	if (xe->info.has_link_copy_engine)
> +	/*
> +	 * What we care about is whether the architecture was designed with
> +	 * service copy functionality (specifically the new MEM_SET / MEM_COPY
> +	 * instructions) so check the architectural engine list rather than the
> +	 * actual list since these instructions are usable on BCS0 even if
> +	 * all of the actual service copy engines (BCS1-BCS8) have been fused
> +	 * off.
> +	 */
> +	return gt->info.__engine_mask & GENMASK(XE_HW_ENGINE_BCS8,
> +						XE_HW_ENGINE_BCS1);
> +}
> +
> +static u32 emit_clear_cmd_len(struct xe_gt *gt)
> +{
> +	if (has_service_copy_support(gt))
>   		return PVC_MEM_SET_CMD_LEN_DW;
>   	else
>   		return XY_FAST_COLOR_BLT_DW;
>   }
>   
> -static int emit_clear(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
> +static void emit_clear(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
>   		      u32 size, u32 pitch, bool is_vram)
>   {
> -	struct xe_device *xe = gt_to_xe(gt);
> -
> -	if (xe->info.has_link_copy_engine) {
> +	if (has_service_copy_support(gt))
>   		emit_clear_link_copy(gt, bb, src_ofs, size, pitch);
> -
> -	} else {
> +	else
>   		emit_clear_main_copy(gt, bb, src_ofs, size, pitch,
>   				     is_vram);
> -	}
> -
> -	return 0;
>   }
>   
>   /**
> @@ -928,7 +936,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
>   		batch_size = 2 +
>   			pte_update_size(m, clear_vram, src, &src_it,
>   					&clear_L0, &clear_L0_ofs, &clear_L0_pt,
> -					emit_clear_cmd_len(xe), 0,
> +					emit_clear_cmd_len(gt), 0,
>   					NUM_PT_PER_BLIT);
>   		if (xe_device_has_flat_ccs(xe) && clear_vram)
>   			batch_size += EMIT_COPY_CCS_DW;
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index dc233a1226bd..11d8017d6745 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -138,7 +138,6 @@ static const struct xe_graphics_desc graphics_xehpc = {
>   
>   	.has_asid = 1,
>   	.has_flat_ccs = 0,
> -	.has_link_copy_engine = 1,
>   	.supports_usm = 1,
>   };
>   
> @@ -574,7 +573,6 @@ static int xe_info_init(struct xe_device *xe,
>   	xe->info.has_asid = graphics_desc->has_asid;
>   	xe->info.has_flat_ccs = graphics_desc->has_flat_ccs;
>   	xe->info.has_range_tlb_invalidation = graphics_desc->has_range_tlb_invalidation;
> -	xe->info.has_link_copy_engine = graphics_desc->has_link_copy_engine;
>   
>   	xe->info.enable_display = IS_ENABLED(CONFIG_DRM_XE_DISPLAY) &&
>   				  enable_display &&
> diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
> index df6ddbc52d7f..bd0b0d87413e 100644
> --- a/drivers/gpu/drm/xe/xe_pci_types.h
> +++ b/drivers/gpu/drm/xe/xe_pci_types.h
> @@ -24,7 +24,6 @@ struct xe_graphics_desc {
>   
>   	u8 has_asid:1;
>   	u8 has_flat_ccs:1;
> -	u8 has_link_copy_engine:1;
>   	u8 has_range_tlb_invalidation:1;
>   	u8 supports_usm:1;
>   };

-- 
Regards,
Haridhar Kalvala


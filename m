Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85A47C197A0
	for <intel-xe@archiver.kernel.org>; Thu, 16 Nov 2023 22:58:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4957110E040;
	Thu, 16 Nov 2023 22:58:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 732CC10E040
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Nov 2023 22:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700175497; x=1731711497;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=mM4XUawLBaWC68ZOTtXriVFvgkX+WeAKGF/0/pt03r4=;
 b=N/Gyi2+MDZbBRh07xs3CEaGDUED4fJqOmToYO9cyHNyJICOV0KeYtjSD
 sF9SE8ofTWBW8QhL++UCVW3lt/gDG7/4x13uyn81KKSFQH9nCfEtje4IR
 Q3M/qtoR2T28IcRt0TyBv4MrTKZz1ZAX0xUAXAccBYIMoOesLjQW5a6FE
 WqbSClRHFb48vHFxq3AMbf1FvTHGpfoesNVOQccQReM05Tfr9gH3a8Ryj
 FhA+s/hnwXe9wo+mkqHPBelROXneYymklv1nD3rOWDSSySlaLeVZLb7J2
 LCRDdotE9yyFURMjMOJVjXThGOTY9eaRir75J8AKnVNRAeclqKS5FyjFB Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="381591688"
X-IronPort-AV: E=Sophos;i="6.04,205,1695711600"; d="scan'208";a="381591688"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2023 14:58:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,205,1695711600"; d="scan'208";a="13707677"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Nov 2023 14:58:16 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 16 Nov 2023 14:58:15 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 16 Nov 2023 14:58:15 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 16 Nov 2023 14:58:15 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 16 Nov 2023 14:58:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gCPNSUZkNUKVPdZuPni90n/YvimKjCIXXzHGdWMSzXa6TODxzxoNef8ZAzmBsp1lYrQCNn/qatZgsYBlCB8xg7+u6JZ8Y6m0PhgKC+pG1Xg2kVdF+Tz8ugapZQTSLTfzHnVpBMlIJlWFJIHJIExto0N2PqG7LSUizwhw3elQeBmPMdRIao70yiOPGPEDLqqMg7b8gMmPc+0JmrOBr5aMxoiXgScVhJZo0rK3Xf75MQYZjLbPR3uqYeILmzgrmlaAJpTpvKcZRhG2OHu7mQQVyTLemNeLMyKBl5N40YKyu4n7IIxIhzdWS1L/qeWaKuWcddp/yPZ/vgrdR/ZD8Eq4Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=56dTawDImd5I/MTZ3Y1DmwvXFoJIDvkXFe+m6k1Ue+Y=;
 b=d2Z5eYhy74PqriIs6z7hnsoGfoBz6eqlZpZuHZbySRgXOOra8x15nzP1LkxBW2BFuV9SNWeZozAsA8lSTq7WlxdZj4XnLBycFrQCafSroA8nEgqdtqR/jUHUL8NyUM2FW7v6GeD9Bbd3+CNb3zJoZiBhtArFXLwv1mJdB0nROTY5gLBKjxyDqn6H/+f7UpN+SIZM8ZEUqqenTwC2sMEzZ4H59p3HcWimGKvCWCUyFigdzIkAeI91wcEjZucFPe6ossyIo/OrPAKLlotqqlyoN9zlYmlIXesjD6dy1J3jy15TD93fC7yUENWYC4Od3DEz6L15b6H6DPcemprPKSHeLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by PH7PR11MB7429.namprd11.prod.outlook.com (2603:10b6:510:270::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.29; Thu, 16 Nov
 2023 22:58:12 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::de08:93ac:5940:ec54]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::de08:93ac:5940:ec54%4]) with mapi id 15.20.7002.019; Thu, 16 Nov 2023
 22:58:10 +0000
Message-ID: <c758b766-438c-4ec1-88d2-a205b93abf52@intel.com>
Date: Thu, 16 Nov 2023 14:58:08 -0800
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20231115004615.2424177-1-daniele.ceraolospurio@intel.com>
 <20231115004615.2424177-4-daniele.ceraolospurio@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20231115004615.2424177-4-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0127.namprd03.prod.outlook.com
 (2603:10b6:303:8c::12) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|PH7PR11MB7429:EE_
X-MS-Office365-Filtering-Correlation-Id: 825dc8fd-ba18-4c85-1d4d-08dbe6f78160
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +n2GgVWmlMNmjk9knfsIGhAZjRE1cflG2tdqvtmBEiv8l8uhuOC/Cf7Bdmo54E9V9QEIOWM9fubk7G8JnKOFFu9tQYkr6NFyz6bIwM1tVAUGLWBvpBLi1/iOhZxidjM5nuTcb/f2HPQhcYomNz9GBJ8D5m6+CmiPVpvgo0UGIqwRnFNeUfZyxOF6tVsfJ2nMd6Dkbgu5VTeAKIO8d0kppk5mXO1cdjRIRk6t27SYb013B4KCJ6RRWLUtDu2tZoMTaQdCSZsI1fy46iB2WKO9yzRjO3Wt6+Eb9jdgSbaN604MVTAxpJ+xIxEEjrUXOCccorlEEbpbKXpLZG8PiFBWouZrKh9jaKRzcuW9h705rSHtJSepr+kIoeC3WsKn6+M6EUGWVk1c+zkMFiskhPIAeCEiXfQxFCvcUNEbu9P6riRdhqIlJH1mRb/PgWTut6VJIVxa33smqHWkvbuncfUyv6c6+/ks9Cu1KcDw0t6E5wv3RHAvB2NZqZw3cujlABr0wJ8wN/UgbpuU4PEwkZh2mZeNyagE2XOEwHrPjTI15gFT5IAJTegItF0v/i+7wDvxF0Y4Ez80gR4uhgDjXZ/5mJncXzxT+ym2jypJJXHVG2Diu+MS/vOl8lu6J4t59Esg5D2fRJSlJJVRoqynHiTbyQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(366004)(39860400002)(396003)(346002)(376002)(230922051799003)(1800799009)(64100799003)(451199024)(186009)(66946007)(66476007)(66556008)(478600001)(6486002)(316002)(86362001)(31696002)(5660300002)(41300700001)(36756003)(4326008)(8936002)(2906002)(8676002)(107886003)(2616005)(31686004)(26005)(82960400001)(38100700002)(83380400001)(6506007)(53546011)(6512007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eE1iQyswSFQrc01zYjdSdlV4ekhyNkFQbS9kNUhDdndrRkRSN1gybUZ0OVJI?=
 =?utf-8?B?NTl2K0xwUTNxM1Q1dVdKa3lQbkNuK3kxUXZXdmtzc20yek9CcWc4ZWRZckUw?=
 =?utf-8?B?c1l4dWc1WlQwVk1IYXNjK0dwdDNBenpvVGtsWVJiV1RqUlEvMjl1WFl6MnEx?=
 =?utf-8?B?dzRaTTlMVEpRQ3dLZ09wTjlsWUFzcG4vMXJPRjJyK1BKZXpDRVJqU0dIYklB?=
 =?utf-8?B?REdiWC94cldVZG92VldaZ2ZwT2hSUzZoYkc0c1NQUTI2bytuUzhHekYvYWpY?=
 =?utf-8?B?Y29ycTkveEU2TTFDa01QUUl1clZ4cStIODNlM2lrVmZlak5GMFVpZzVMWXdX?=
 =?utf-8?B?MnR5RXhPeGpjRGgwK2dQbFBXMWFhK1ovMW41NmRnVnozOSs5WFZLcjl0c2p1?=
 =?utf-8?B?UHlDdFBnSGoxdnpwaDhGejdYNmJxL3Z3WDhINHRFWnFETEU2NHE5UW10eG9M?=
 =?utf-8?B?UExsZkhMQWFzUUJ2UDAybHNDNFlZakIxNDNkRWdTR1RUcTE0ZEtId3d4ZXlu?=
 =?utf-8?B?Q2o0cFhXS2dIQVU1T1FFU09TbENVeWJPMzQ0K0drNlZHTFFsRWVZNnF2bHdn?=
 =?utf-8?B?VzRITlNRQytHSTBYVEYrN2dyYWIxM25vWXEyNElVUS9qSmphUk5hSkgvbHgz?=
 =?utf-8?B?cEdGN3hnYVNYOGVSdHhacGVpaEI3RXR5MVJwbGgvNEcxN3Y3aHhEQVEzVjlu?=
 =?utf-8?B?Rmc2QysvQ2pMdmpSdHFQR29zQi9DVjM1UkhwUDRmeTJKMnRGQjZpRWMxVStR?=
 =?utf-8?B?V09FS3VJZnR6Z2pqR0VEaEJ2Mk1lOWNMcVE2TjhZTlBDV0FveFlvUEdhMGJN?=
 =?utf-8?B?NEJwZ3NxQVZlT2JMT0xsUkRScnpoSEhqNytnRjYrVlQ4c2R6SGhpRE41dHU1?=
 =?utf-8?B?M29hZEtqcHJDVG80eEtPNzhuVmdRUkY1RXhQV2xwSVN5TUJ2Q2lvRDE0YXN6?=
 =?utf-8?B?a1VnbGY0S0h4ek1mYkVUakFFN3VlaXVYZ204c2IxdmRlN2hZM2s5b3c2a1NV?=
 =?utf-8?B?S0twMyttdzRWelRKVzJ3SDR4N0FQWSs1NFFnSHRoRnpEa3hPOVg4ZEx4MERt?=
 =?utf-8?B?ZlVGSXFGVW1paEFIeXNqbU9CR1p6cEZ1RUY1TjcvUGVyUFJHSjF5bWxQRk1o?=
 =?utf-8?B?R3EweS8raWZFZnB1K0YrMytnU1dxazQrNmVDZHRSSnhGbWY1UU1NQm1ac3dE?=
 =?utf-8?B?T2JVUlNvZFdFa29LMGwxODg3eVZITTlFOThUSUg3NkxDL1o1eGdjSU5pUGdR?=
 =?utf-8?B?cjVWaU11N05ubnVkNERBY3IwUXdnUVB5aFhzL2MxY29YOUVLemdQU3k0SUsv?=
 =?utf-8?B?elR0bklIaHM2akNZV01tUDlTRFROenhCV0JKbVBaLzBQcDNKSXhMVVpKa2xt?=
 =?utf-8?B?Ry9ZdnFzSmJZZnNYRW1wSlFldm9zRDNZd3NEOENIem51bmR4RE92djJLN1BR?=
 =?utf-8?B?eFNlbW1qREZSaTJsZmw3NzlnUC9sdnFTQ2gyMzEra3FFYWp0KzJsOERWdC9M?=
 =?utf-8?B?d1F5dzkzUTRDWWVEcTIyRlRWaUNaV3FCaTYrSzRlM0tkSnQ2TGRzb3hNMHFG?=
 =?utf-8?B?MndnUm40bk1IdDIvNmx5V1dXZURIVzNveTJJb3Y5STVpVU1meDhMcFYyRVFV?=
 =?utf-8?B?ZVRRQ0VMQ3U3SHRWU1FRa0tiSGYxbFlsaFZkd0kvV1c0ZGtnR21kOWhaUVJV?=
 =?utf-8?B?Y29mblZHSExXQ0k2eFkzZi83aGdWVzNDN2h6Q3EwTm5id1QzWUZaM3ZHS3lF?=
 =?utf-8?B?R0xwWEt2NkdGZThQSlNjSFV2OXZYTlVuWlBZaWF0eXlVb2VxK0taWVZJQzRr?=
 =?utf-8?B?N2JCckdidVRKSi9ZWTFXa1cxT1RBNWN0RHlWcmZnUmxZRDlJVUt1UFk0eVRq?=
 =?utf-8?B?Z0Z0VVltWXlxM21ibkJGRGRvZEdMcGRHWVdPRm1UY2hwRmVUZkxIRUdtUWtz?=
 =?utf-8?B?cEFDM1pLR0xSZ3JwQWUxNDlmVVJabTZDN21VZFY3ZXcrUnRqSjBxMURlbVh1?=
 =?utf-8?B?eUdOc3UzVWJ0bTBwclY3WHVocE9jajQwSmNCRGhYQm8xYnByUWlvaXRIb1Z5?=
 =?utf-8?B?Vjc5emNjT3RkUngzcmhyZWxYa3hRcVJLVDB0a2FIUVF4eWFlbGZneWl5cEtU?=
 =?utf-8?B?YVpvVmhPelk5SGxBVHc2V0xVd1JNcFFhblBiNi9lM1VEa3cyY1BtM3FDblo3?=
 =?utf-8?B?U0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 825dc8fd-ba18-4c85-1d4d-08dbe6f78160
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2023 22:58:10.6119 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tYqFkuZvDgiQC69t9vQDNAHE9Tz78rSthLV+RB1t13UOCfV0SC+kwE0QwocG4aBVVQfR8TsJJvBp8fE0bklNyuO71zoT4bxItLT/IUY0dic=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7429
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 03/11] drm/xe/gsc: Introduce GSC FW
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

On 11/14/2023 16:46, Daniele Ceraolo Spurio wrote:
> Add the basic definitions and init function. Same as HuC, GSC is only
> supported on the media GT on MTL and newer platforms.
> Note that the GSC requires submission resources which can't be allocated
> during init (because we don't have the hwconfig yet), so it can't be
> marked as loadable at the end of the init function. The allocation of
> those resources will come in the patch that makes use of them to load
> the FW.
>
> v2: better comment, move num FWs define inside the enum (John)
>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

> ---
>   drivers/gpu/drm/xe/Makefile         |  1 +
>   drivers/gpu/drm/xe/xe_gsc.c         | 52 +++++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_gsc.h         | 13 ++++++++
>   drivers/gpu/drm/xe/xe_gsc_types.h   | 19 +++++++++++
>   drivers/gpu/drm/xe/xe_uc.c          |  9 +++--
>   drivers/gpu/drm/xe/xe_uc_fw.c       | 23 ++++++++++---
>   drivers/gpu/drm/xe/xe_uc_fw.h       |  5 ++-
>   drivers/gpu/drm/xe/xe_uc_fw_types.h |  5 +--
>   drivers/gpu/drm/xe/xe_uc_types.h    |  3 ++
>   9 files changed, 121 insertions(+), 9 deletions(-)
>   create mode 100644 drivers/gpu/drm/xe/xe_gsc.c
>   create mode 100644 drivers/gpu/drm/xe/xe_gsc.h
>   create mode 100644 drivers/gpu/drm/xe/xe_gsc_types.h
>
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index cb41b4fead08..1ea6e0679528 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -58,6 +58,7 @@ xe-y += xe_bb.o \
>   	xe_force_wake.o \
>   	xe_ggtt.o \
>   	xe_gpu_scheduler.o \
> +	xe_gsc.o \
>   	xe_gt.o \
>   	xe_gt_clock.o \
>   	xe_gt_debugfs.o \
> diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
> new file mode 100644
> index 000000000000..216f36cee0f7
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_gsc.c
> @@ -0,0 +1,52 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#include "xe_gsc.h"
> +
> +#include "xe_device.h"
> +#include "xe_gt.h"
> +#include "xe_gt_printk.h"
> +#include "xe_uc_fw.h"
> +
> +static struct xe_gt *
> +gsc_to_gt(struct xe_gsc *gsc)
> +{
> +	return container_of(gsc, struct xe_gt, uc.gsc);
> +}
> +
> +int xe_gsc_init(struct xe_gsc *gsc)
> +{
> +	struct xe_gt *gt = gsc_to_gt(gsc);
> +	struct xe_tile *tile = gt_to_tile(gt);
> +	int ret;
> +
> +	gsc->fw.type = XE_UC_FW_TYPE_GSC;
> +
> +	/* The GSC uC is only available on the media GT */
> +	if (tile->media_gt && (gt != tile->media_gt)) {
> +		xe_uc_fw_change_status(&gsc->fw, XE_UC_FIRMWARE_NOT_SUPPORTED);
> +		return 0;
> +	}
> +
> +	/*
> +	 * Some platforms can have GuC but not GSC. That would cause
> +	 * xe_uc_fw_init(gsc) to return a "not supported" failure code and abort
> +	 * all firmware loading. So check for GSC being enabled before
> +	 * propagating the failure back up. That way the higher level will keep
> +	 * going and load GuC as appropriate.
> +	 */
> +	ret = xe_uc_fw_init(&gsc->fw);
> +	if (!xe_uc_fw_is_enabled(&gsc->fw))
> +		return 0;
> +	else if (ret)
> +		goto out;
> +
> +	return 0;
> +
> +out:
> +	xe_gt_err(gt, "GSC init failed with %d", ret);
> +	return ret;
> +}
> +
> diff --git a/drivers/gpu/drm/xe/xe_gsc.h b/drivers/gpu/drm/xe/xe_gsc.h
> new file mode 100644
> index 000000000000..baa7f21f4204
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_gsc.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#ifndef _XE_GSC_H_
> +#define _XE_GSC_H_
> +
> +#include "xe_gsc_types.h"
> +
> +int xe_gsc_init(struct xe_gsc *gsc);
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_gsc_types.h b/drivers/gpu/drm/xe/xe_gsc_types.h
> new file mode 100644
> index 000000000000..135f156e3736
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_gsc_types.h
> @@ -0,0 +1,19 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#ifndef _XE_GSC_TYPES_H_
> +#define _XE_GSC_TYPES_H_
> +
> +#include "xe_uc_fw_types.h"
> +
> +/**
> + * struct xe_gsc - GSC
> + */
> +struct xe_gsc {
> +	/** @fw: Generic uC firmware management */
> +	struct xe_uc_fw fw;
> +};
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
> index 784f53c5f282..b67154c78dff 100644
> --- a/drivers/gpu/drm/xe/xe_uc.c
> +++ b/drivers/gpu/drm/xe/xe_uc.c
> @@ -6,6 +6,7 @@
>   #include "xe_uc.h"
>   
>   #include "xe_device.h"
> +#include "xe_gsc.h"
>   #include "xe_gt.h"
>   #include "xe_guc.h"
>   #include "xe_guc_pc.h"
> @@ -32,8 +33,8 @@ int xe_uc_init(struct xe_uc *uc)
>   	int ret;
>   
>   	/*
> -	 * We call the GuC/HuC init functions even if GuC submission is off to
> -	 * correctly move our tracking of the FW state to "disabled".
> +	 * We call the GuC/HuC/GSC init functions even if GuC submission is off
> +	 * to correctly move our tracking of the FW state to "disabled".
>   	 */
>   
>   	ret = xe_guc_init(&uc->guc);
> @@ -44,6 +45,10 @@ int xe_uc_init(struct xe_uc *uc)
>   	if (ret)
>   		goto err;
>   
> +	ret = xe_gsc_init(&uc->gsc);
> +	if (ret)
> +		goto err;
> +
>   	if (!xe_device_uc_enabled(uc_to_xe(uc)))
>   		return 0;
>   
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
> index 9205a3ecff78..16217aacdbfb 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
> @@ -158,11 +158,18 @@ XE_HUC_FIRMWARE_DEFS(XE_UC_MODULE_FIRMWARE,
>   static struct xe_gt *
>   __uc_fw_to_gt(struct xe_uc_fw *uc_fw, enum xe_uc_fw_type type)
>   {
> -	if (type == XE_UC_FW_TYPE_GUC)
> -		return container_of(uc_fw, struct xe_gt, uc.guc.fw);
> +	XE_WARN_ON(type >= XE_UC_FW_NUM_TYPES);
>   
> -	XE_WARN_ON(type != XE_UC_FW_TYPE_HUC);
> -	return container_of(uc_fw, struct xe_gt, uc.huc.fw);
> +	switch (type) {
> +	case XE_UC_FW_TYPE_GUC:
> +		return container_of(uc_fw, struct xe_gt, uc.guc.fw);
> +	case XE_UC_FW_TYPE_HUC:
> +		return container_of(uc_fw, struct xe_gt, uc.huc.fw);
> +	case XE_UC_FW_TYPE_GSC:
> +		return container_of(uc_fw, struct xe_gt, uc.gsc.fw);
> +	default:
> +		return NULL;
> +	}
>   }
>   
>   static struct xe_gt *uc_fw_to_gt(struct xe_uc_fw *uc_fw)
> @@ -197,6 +204,14 @@ uc_fw_auto_select(struct xe_device *xe, struct xe_uc_fw *uc_fw)
>   	u32 count;
>   	int i;
>   
> +	/*
> +	 * GSC FW support is still not fully in place, so we're not defining
> +	 * the FW blob yet because we don't want the driver to attempt to load
> +	 * it until we're ready for it.
> +	 */
> +	if (uc_fw->type == XE_UC_FW_TYPE_GSC)
> +		return;
> +
>   	xe_assert(xe, uc_fw->type < ARRAY_SIZE(blobs_all));
>   	entries = blobs_all[uc_fw->type].entries;
>   	count = blobs_all[uc_fw->type].count;
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.h b/drivers/gpu/drm/xe/xe_uc_fw.h
> index 1d1a0c156cdf..7feafe1695f9 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw.h
> +++ b/drivers/gpu/drm/xe/xe_uc_fw.h
> @@ -96,8 +96,11 @@ static inline const char *xe_uc_fw_type_repr(enum xe_uc_fw_type type)
>   		return "GuC";
>   	case XE_UC_FW_TYPE_HUC:
>   		return "HuC";
> +	case XE_UC_FW_TYPE_GSC:
> +		return "GSC";
> +	default:
> +		return "uC";
>   	}
> -	return "uC";
>   }
>   
>   static inline enum xe_uc_fw_status
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw_types.h b/drivers/gpu/drm/xe/xe_uc_fw_types.h
> index e4774c560e67..5b9ee05c1c6f 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw_types.h
> +++ b/drivers/gpu/drm/xe/xe_uc_fw_types.h
> @@ -55,9 +55,10 @@ enum xe_uc_fw_status {
>   
>   enum xe_uc_fw_type {
>   	XE_UC_FW_TYPE_GUC = 0,
> -	XE_UC_FW_TYPE_HUC
> +	XE_UC_FW_TYPE_HUC,
> +	XE_UC_FW_TYPE_GSC,
> +	XE_UC_FW_NUM_TYPES
>   };
> -#define XE_UC_FW_NUM_TYPES 2
>   
>   /**
>    * struct xe_uc_fw_version - Version for XE micro controller firmware
> diff --git a/drivers/gpu/drm/xe/xe_uc_types.h b/drivers/gpu/drm/xe/xe_uc_types.h
> index 49bef6498b85..9924e4484866 100644
> --- a/drivers/gpu/drm/xe/xe_uc_types.h
> +++ b/drivers/gpu/drm/xe/xe_uc_types.h
> @@ -6,6 +6,7 @@
>   #ifndef _XE_UC_TYPES_H_
>   #define _XE_UC_TYPES_H_
>   
> +#include "xe_gsc_types.h"
>   #include "xe_guc_types.h"
>   #include "xe_huc_types.h"
>   #include "xe_wopcm_types.h"
> @@ -18,6 +19,8 @@ struct xe_uc {
>   	struct xe_guc guc;
>   	/** @huc: HuC */
>   	struct xe_huc huc;
> +	/** @gsc: Graphics Security Controller */
> +	struct xe_gsc gsc;
>   	/** @wopcm: WOPCM */
>   	struct xe_wopcm wopcm;
>   };


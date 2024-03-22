Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06D97C54E71
	for <intel-xe@archiver.kernel.org>; Fri, 22 Mar 2024 17:00:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D3BC10E728;
	Fri, 22 Mar 2024 17:00:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a0t6BQAU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DB9810E728
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Mar 2024 17:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711126819; x=1742662819;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=4VDOhnkZv1XhUAT0EQJy1JeCbwiVt2iuGmGO80YxyfE=;
 b=a0t6BQAURWIRiTPmb2Wp12dv3Ad0/KUnDFfMtaICUuTREfKcsVdEVaL0
 cNds8VDssqkYyzyZgrKXIr5g+E4BNNJWZAOoDyJJordKKWkBvEISrCdQE
 VpMYHeD/Vikluey0oSOXiTJ1KDONhaTxGZiL7T/AJ944DAhy/u1tQjR4f
 /0f8rf69ahLeqero+5FeQEvKJdq7mf7msQluo5ytXQrWKKEmkoEHLmULq
 GqCzq2aGOh4bR37YMUzrV0AL+7i8R19Kc4X//NmcrbKvql+FFBOL8aPxY
 4he4tcZqU/o4rKft8QjmDLb+wA0fCfZnhrtVZbMhdKOQSM0m7ZvWsBY9E Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="9958227"
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; 
   d="scan'208";a="9958227"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 10:00:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; d="scan'208";a="38101634"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Mar 2024 10:00:18 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 22 Mar 2024 10:00:17 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 22 Mar 2024 10:00:17 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 22 Mar 2024 10:00:17 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 22 Mar 2024 10:00:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=djp3l672sJxZUOzHDyef/6qMHf+LdsKLQ1mdbTg8D412C2wKA1z8s53654MOXF4VPnqsM98WP+ZBFBBHBxDNvHVxuvyRva9GKx1cUGQAwqVf/C0Nc/+1+AmS8A1KbnNEPJY826bdSlCGAVNzX4IDnnlor3ZL3PlRDJNPrXTcqF7JVVSNshdEZmcl/R1JSDbwrI8PdIrOdhWgAU0+xZyX0v4UcOFpQTunGmQLcRNpJyocAms8zGxs6ITtJHXku42ldbzJ35JepRGjxJUuLwMvAVcxPtk7S/x4LzZ+bN78gzCn0WPvqgfr0yUonyVfbz2U9X0wcmsbhpOACoJdUwFahQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pWYrR8rK6+ryD1VdQ1UJEFBG9Wb7VCrJRCSpAUZpdto=;
 b=FEV4Q1UzJlUHg0qRtSQThqlgmDc0zINpKHq4le8JGmDiBetMVnsVV3HblMo6HEu0jS6ycYEatu0yR3Mvt/+9WRS5So8VDOjooOnd1MCi1RCKMGlXJeQiptK+tYMPOR/5Zm5v+DwCXxUOXAwHIqfMUxTeUBgEK3xYt3Cyadd32B3hboPiQDhhwmJwY90O7URLpoCOD/O6CpVaAEfTEAIjky6nNwaRmD06dXN597LqbRYC5+l6xennThPsMU4iMheJrR1WaUoQTSn0Yj4QNbdGJBx1Q0icK1ptWKTgZ7GbKrh853HLZegcUFgJ2OpVe7Nwv8gOMEDkdl2oz4aK6IHThA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.15; Fri, 22 Mar
 2024 17:00:10 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::6fc1:232e:5d99:43a3]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::6fc1:232e:5d99:43a3%4]) with mapi id 15.20.7409.023; Fri, 22 Mar 2024
 17:00:10 +0000
Message-ID: <e0bad66b-2234-45a0-bdac-df7457b9f9b3@intel.com>
Date: Fri, 22 Mar 2024 10:00:07 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/guc: Check error code when initializing the CT
 mutex
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20240321195512.274210-1-daniele.ceraolospurio@intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <20240321195512.274210-1-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0227.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::22) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|PH8PR11MB8287:EE_
X-MS-Office365-Filtering-Correlation-Id: 29d4dfa6-35de-413e-7091-08dc4a91886b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ovdR+U+onq16kZuxQjFAYneznYlb1v9z7IWBee403ZkBHfmyktyn2QT2dxqPPpDFTWtxxQdI8CynrXoB3EiGyYO08ycBRmE+9py2cer9nkZ8WUG+YOgiJPGUSkgQyi6xlpSgXUbB0II47GII6N+6nXKKNlnKoc1pfAqMYnzuX+8lZAGW0B/LzlMs8AwjNWatDnCyMdoNNeVgbDzcsWpgXmiweUagEArt4vrne8rnynR/iUkU2IuMQRzumU8f5BVrb3dEv7sXKMO4ZV6WUDrF1LyS86uZlIbD1j7+R1vVY/8dDvrFY9dMYJBLM/x4YwcqzdwInKAhFx9OOwpzbHFFOW7V6dY9OG/tIJcKrlsO5cR5yiI0rFa/wsqQogFcCLn2SXm6IFc/BudyMQXMS3DU50v8RxEdK9HRE4ixNzyfp2+NLttdL1R2SuxhnMM1/VpNo+jhBrR9n1H+Bzv4Y9x7z5PZdDfSa6+nDMMdzU89BQyfLp9NHsRwpHiO8nOqMOFTerXecV/S9xBmyXdbwddNih+rwRrTW4QWQM1dpeCbGzQ66sxhx6ErFIpea6B6KBvx3F092icQN75eyr46gY4uM7rlRLApvKOHWy5LAG2dbzRfyW6uk732ZvGc0ekh+Uv74/t07iIsZszuRLf5IAmmR52lDdtv7tMwrW46W1CqLlQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZlVSUkg3cDE1UTZVKytXaUp1d1BtYUwyeS9ldUFqYyt5SFZ2cEFad25sYTNt?=
 =?utf-8?B?V1A2MU5ESXFDeTA4azRFNXlPM1Zadzl3TGV1eFJmTjlmb3p1WHFTL2pRS2cr?=
 =?utf-8?B?WVd6dGR6VXRadFlWd09lWk93ZWg0T3poS3g0b1E5SWhSREJiclpFMkFqRGgz?=
 =?utf-8?B?N0crcElLNHVCN0NlTXA1eWdrbWRwcHRLWG8rdFFJOFJRZmJldEZQelN4TjBZ?=
 =?utf-8?B?eDBZWVI5UnJqUnd4NW1PUXhMQ0VFZWFZTSttRW14NVNnQ1lHeUhxUDdkeTBw?=
 =?utf-8?B?OFROdmcrekNUTG52NUh0VHpzQm1Db0lUTnY0UjhkekRFWDNENjAvUjM0bGRD?=
 =?utf-8?B?YS8wTnk2VnF6Z2czZ1M3dnRmYTlvMEYxNndMYXZ6VWhJU0l4YlRzbFNpcTFJ?=
 =?utf-8?B?RFp3eEcwZEJad2hOUk5DMkF1am1rMGEzWDFWTUcyWlFrYlMwaldneml1Z3hS?=
 =?utf-8?B?SzJYVTl2NUtxWElhQmd2T1p1RTdPdUplbUR3WEZ2ZU90aUh2WkJOZU1hUnNP?=
 =?utf-8?B?clEzS2YrSHVWRXB2SnRwOWZhSHc3akF6L25WTHZMNlBaYmtiYlJkT0ExSElM?=
 =?utf-8?B?RU5mYXYvRndmRmJYV0pic2tqM1dhakY4dHU2MUpCbi96elQzSFFLNTcwak9N?=
 =?utf-8?B?R0RaTlk5OTB1enFwV1IrNEk5SGs1dW95UnhMS2ZlT3RUSkN1ZFZ5U1FlcjhG?=
 =?utf-8?B?VGNDZWcySlZHVWwxWkRGNXlFeGJYdjE3QWU2bGh0a2NEdVJRYkJCd3h5c3RV?=
 =?utf-8?B?Zk13RW1xTTJSV2x2Nkx1UHpUVTlxa0JieEhoRlNCQ0VEME5BVnNHdTEyY2NF?=
 =?utf-8?B?cU1JeVBRWVVzcTBiYm80Mnk3SWMvQm9jNnBuZjFPRmEwZm1mL3EyTW05ZHI2?=
 =?utf-8?B?N0lSSi9GdkxmVVNhVG5FbGtrdEloYlF4N1p0RlJOWHVCdGJvWVhYcnlCSVlZ?=
 =?utf-8?B?eGFYTVRuR3JyVEFBS0dmSS9FSDVnVGxtZThlM2NLQ0JlSlZJbTZYNG43Yy9Q?=
 =?utf-8?B?aUo5YWxJT3dtaGh0eW1VblBkb0FtRE11KzQvUzJtcXFpbDdqR1VqZnNtbnpm?=
 =?utf-8?B?OWoralF5eVgweWE4TlZsZUFvVnZCd2N0UnhFQkU0akVuTkJHQlNJVGYxOVdR?=
 =?utf-8?B?SkN0R3RDT0RYdlNsKy9QOGtZZ2hPZW9NV3AvVkwyc29YcEg2NlVtbUlNWGZG?=
 =?utf-8?B?c2JEbzB6VkFyV3FkbGlxRlRmcXZkajhyRk5XZFB5SmNSMGFwZTVLb3pwTU5o?=
 =?utf-8?B?NGJpdzVCUVRjWUJQQTRTeVFudExnR2d0Qyt3RDBEMEFpVFZMck5sYVlCc3Jy?=
 =?utf-8?B?TXA5ckVvWGZoYmk5R1lzU29JRHpxV3QwWkhBMWZ6bHNocWJzNGY4Yk5jRmlx?=
 =?utf-8?B?QnlkK1RTMkVFRDlUSmUrZXdzRHR5WGRPUE41WVVqU2RBb2VtVU5JTVBzOXZi?=
 =?utf-8?B?RnhjUi8wU2FhYkozSjBkM1ZJTlN5YVdaalR5TC9QdWRpN2Z3U3B3M2I2UEl4?=
 =?utf-8?B?Wjh4TnFjRTZrcEhocjQxMFdqYTVQTk9USUlIclJwZm12aktudHhrY2FCMzVh?=
 =?utf-8?B?b3NUaHlSM1VTYkwvYmlQeTJSalc4SUlNUHcvR251YnRYZ0NEdWpHY243VXNV?=
 =?utf-8?B?aHVlaTJVWGRRNk9XWHk3MmNyQzQ4N0Rzc2x3QWhZWitqTjdyenFVYm1NODhk?=
 =?utf-8?B?eTRvZWRsbTMzcHRyR0FEMjMxVXhCWWpBMTR1NUJQNEdOdCtjWUxsN04vekd4?=
 =?utf-8?B?OW1NalJFcS9nL3RBanRDM0tzQ1BjMDc3ZUpIRkJBbjVBMUdOMnVRZUtQQTNw?=
 =?utf-8?B?ZCs4Z2ZKU3dLRk9vNnV1bXVQQ0JSdjBNU1RycytSbVlhSlR4b1JiV0tIQlFF?=
 =?utf-8?B?WEFyUkd3bld6VTRMMTNwNEQwemF1UjR5OFRzWDQxMWN2N1hnTmUxVVFoUXdS?=
 =?utf-8?B?dEh2OUFTWDY2WUVhNEJOOXMwTnRMelBDM0s0eXhkSDZyMW5jZGJadUJNditr?=
 =?utf-8?B?MnFFeWNRMTRUVG5QMFF1ZXZ5MHRyRy9JdU5QVG85MnRWenlsSHZkajE1YUdQ?=
 =?utf-8?B?R2VmNUdVNHNIWjZNT2VjdXVTNXp1ekV6THVsaCtoTXZuUU94KzV3VEkrZTh1?=
 =?utf-8?B?SEczODVSY0xXM0RMTGhoQVNMVGtsUzJRWC9wRjhkWGo2eGtPZDBYeXJZdFdm?=
 =?utf-8?B?b1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 29d4dfa6-35de-413e-7091-08dc4a91886b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2024 17:00:10.1196 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qL63odnD5jankl7aO1UMTskJFX8HgZ1+C04T2RMXbEv23x/j0l4jRiKtwde8i1fgYWgrZJGWexnMAOrttwIQNSK3cd3q7ZPk9r78wEV54og=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8287
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


On 3/21/2024 12:55 PM, Daniele Ceraolo Spurio wrote:
> The initialization via drmm_mutex_init can fail, so we need to check the
> return code and escalate the failure.
>
> The mutex initialization has been moved after all the other init steps
> that can't fail, so we're always guaranteed to have those done and don't
> have to check in the cleanup code.
>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc_ct.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index d9fa81900ff5..1d930a8eeeca 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -145,13 +145,16 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
>   
>   	xe_assert(xe, !(guc_ct_size() % PAGE_SIZE));
>   
> -	drmm_mutex_init(&xe->drm, &ct->lock);
>   	spin_lock_init(&ct->fast_lock);
>   	xa_init(&ct->fence_lookup);
>   	INIT_WORK(&ct->g2h_worker, g2h_worker_func);
>   	init_waitqueue_head(&ct->wq);
>   	init_waitqueue_head(&ct->g2h_fence_wq);
>   
> +	err = drmm_mutex_init(&xe->drm, &ct->lock);
> +	if (err)
> +		return err;
> +
Reviewed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>   	primelockdep(ct);
>   
>   	bo = xe_managed_bo_create_pin_map(xe, tile, guc_ct_size(),

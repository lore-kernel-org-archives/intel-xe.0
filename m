Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D92EC5B56A
	for <intel-xe@archiver.kernel.org>; Wed, 12 Aug 2026 12:21:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CD4810EF86;
	Wed, 12 Aug 2026 12:21:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EGew5EvD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AFCA10EF86
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Aug 2026 12:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786537318; x=1818073318;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=XBxg2Ht8eVPisz7xBp6+YgNQfhNY6pzo7QKtMXkLgFQ=;
 b=EGew5EvDZH8ZBj+i+z1bVCUDjxI6LJHe9GNawESXyQWAPO/geO066kDS
 oO56xuxSuC+WcBKihudDiw9Y5NHDcMcZaSsFFWrO6lCElUyTGlJUqJTyN
 D1GqzWALyCqnDJO8W9ZodPRfxkx0CkWG43AR7mh8TsKeD/LAxjqsfKAn9
 CU3PKKPLSHwD0PahepjeOP3f+9oYpYVyx8MtJ/Z9Qci5hV3qBTJjMNdlf
 i4z+1W5o1WZslyQUd5sj1cvUMMpgNQT7oshokOyC6DuDOEoyBbqjPomfG
 l/zlb4quAVfG1a4+R6e1xk9+NbiJnjAi8efXsM4SY+ZDw6sWqU3Kf2Ma5 w==;
X-CSE-ConnectionGUID: OMA4/SiQSuynoVKNcprYsA==
X-CSE-MsgGUID: mN7jGPAQRomIySDrlmr03A==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="109875516"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="109875516"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 05:21:57 -0700
X-CSE-ConnectionGUID: 7Mz1s57pTleDuqRyGBdNmA==
X-CSE-MsgGUID: KEppe+gHSwawwCqvZOdrwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="287065031"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 05:21:57 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 12 Aug 2026 05:21:56 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 12 Aug 2026 05:21:56 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.23) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 12 Aug 2026 05:21:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HAVSczJ2sVnrfPXrHU0LRc/u6wcLGJ1BcvZCzh11uLe18YjNPaPfSxIHM2XzPTCRa6+BECjBmm/RVcmQe6VD0fRPIlr2EcDBXfnHfEydvQZp4WSvAyTnayvBDIgM9Nk2naayCr5kAGf9v3myBHdlJXcLw1m/bergJ6Wx7yZjE8DJ0BBoLIHGWKKmMCj5mbOmFvMRrVgjVfTZXFM/fK4EPLf6Gefv3PVZrqu+hP8TydT2tgpn3HT1u8Bq8FU6MBllR0OXrVEtiZ+yYWIynXR6kZz/1Thp0dUk45RputGSlgId9z4jX2GDyxzFGqr4ZFqQrULmy+tRpyJByZjDrgPG8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MQ6WL3QeT5Ik599WlnpVKxkwp+eiLwOYqNwYL0SPU9s=;
 b=oQmljLU9nkuIrYDyrJkePJUEmdaHdov6hHCxPm06t1hFV0DoTMLmRn8vZP0q/KcHKfbxD3bm9OWTpKjUdSI8HRvpLdyiRa8zPn8diOmQUDPwlTSzHnIqyxxwjihdqhfv4Vgj3CMAVtbvwy7qWRW+YlOPTO93aeoWaKG5VhyV1EbpxzYKfw0XYfPVrT9m+m6GbglbsIeYFfbB3KX4gn/JRy8LzSoVENIJKIqiXIb2QN7fFO154MujfjShQmWrqFZ1/cD7Wo4pW3wLTRH/8Vt+CglGWW4LANVlK/PJFBZfoDhd4HuHjl5/uBlI5zuwWUbczba+oBaF9C7cw+b+ropVSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by LV2PR11MB6048.namprd11.prod.outlook.com
 (2603:10b6:408:178::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Wed, 12 Aug
 2026 12:21:43 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::5a5c:9c7a:cd1d:d687]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::5a5c:9c7a:cd1d:d687%6]) with mapi id 15.21.0270.017; Wed, 12 Aug 2026
 12:21:43 +0000
Message-ID: <68ad0fe4-bb9b-403f-8dc3-551f22536b11@intel.com>
Date: Wed, 12 Aug 2026 17:51:35 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V15 10/14] drm/xe/configfs: Add vram bad page reservation
 policy
To: Tejas Upadhyay <tejas.upadhyay@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20260811124016.3614699-16-tejas.upadhyay@intel.com>
 <20260811124016.3614699-26-tejas.upadhyay@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20260811124016.3614699-26-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0047.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:175::9) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|LV2PR11MB6048:EE_
X-MS-Office365-Filtering-Correlation-Id: 14430aa1-678f-4899-dbb9-08def86c453b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|6133799003|22082099003|18002099003|11063799006|4143699003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: fSPwp9lF0iKvn1rV5R1j5B1dPQ3omOjoXxjcwHkB63kkGvQajtzON3XO4sxXKzsoZiT2MaEaw/CvMrc5zm0Ls5/TughXN6VQBJHmxLecDGFWRtbMU97A382Gpuh5RsaTm1eCd4nvmCDfaCl/1PQBiAaCKmLsR8hvdumTGcmuqXINJAmy9CcohRv/ee6VdvPSOIUJqBA3RggA1wJvbZ2lfqONHzbOt8mxluZnZXGzXU56ljNq/ZGciuBs8pRAxNttPKAzSUwoEUkPGWYZCpqbTXQ1baXATkxXstNkLSCxHMtpHg5DQAXxv5rmP2zh10mAW04JP4QQ6n7oVVlu1cYvet1YV5mYTDsEgE0xAzKrHEOR9MTgjaqMciyy8kAYT1EO0Ca2MRL98QSVd5Y8F717t0sb3ftt7ScxWMyxkQKBDP7TpRBhZFfTk8eAovrMRlNIOWGDz0PCJU2HVxhud2nElW4wTEiA9h+U+iNxdTqBCkQVg3/n7WkZMuLbYpvj/pgmFMQzp2leBXCkVG8LJeD8B9YVSSroJXMKEIefCM6/Ktw7fFgTU9ScVeCQBzC/O1IUXJopdhkCSONyBxbCYvAhvm9eXFBJRewqYTIInF9bJBeD2qqJzKqygVYLvVMDOy0dMwrPWs2i4247BaS5o8IakZbKP6t9n13K7rFqsb1Gfg8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(6133799003)(22082099003)(18002099003)(11063799006)(4143699003)(56012099006)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RmpIaXNRckpQNGdaVmhrNnR3d3lieXRzd2FwTDVGRThEYm1oVGJEUGlmS1g4?=
 =?utf-8?B?RXBPY3kvSWhUMjMvdnRFbDl2UWVDblRmV3FwQjk4QTYxNFh0WWV4UTE2Y3h4?=
 =?utf-8?B?bXNwdVl5Q3QzQjgrOE9aSC9IVXNpMm41RjV6b0IwK0g5dUhzOWlsR2xVVUtR?=
 =?utf-8?B?a1pBNjJ0SVFwWFBsNkFmOGlvRlJKai9qNEZHak1iTXNvbTNZYXZLVWFsTzJB?=
 =?utf-8?B?bVI0UytSWEZmVGo4cWIvUXZ4cFc1a3V3Q3RWR1lJNkkyVzNLNldjRU1OdUI4?=
 =?utf-8?B?M1ZRWjNOWkdZM2M1eUh4UU9ZYjF5cktEOTJLTXM1L01iOU1xdVJ6Q2FIKzc0?=
 =?utf-8?B?d3M5Z2dFSVJDc1p3REh3bnVxKzlFMFRidUhabUJIcnFJaDlWaDF5d3BGTWli?=
 =?utf-8?B?eUZYN3l2RTFUQ01HL3VFWGRVQ0x3SjU2di82djJDZ2NxbmxIVGxpK2dqbmlD?=
 =?utf-8?B?ZjZJMXRKUmhUUUMvajdTTWd1VmR2b2orSCtSNFdSQUVJMXByR0kyWWhqUU9a?=
 =?utf-8?B?T0NFUWJ6UVVIZ29UTTdaQUpCMDNOK2tXcWNzNDk2TUpiTUk3dXlBRmlHc0Z0?=
 =?utf-8?B?QjJHVStEOTN0SFV2SGN1bEdMWkU0OHJNS0h0bSsxaVNiajdQVmFxMHo0c1lR?=
 =?utf-8?B?K24wWWlUbWtvYzZXcjRia0dJVjVSMHozaFJrWTdER0tyVlhaNS82Ui8wMmhM?=
 =?utf-8?B?WVVzRmJIaW81S1daa3pxYzVBa1FUanBmZnJuM04va1NSWTE5VW5QOUJFdGdI?=
 =?utf-8?B?OVNWZUM0VGdsRURSazhibHJIMCsxUm5STTIrTG4ycW1XanR3Wllxcnl0Ny92?=
 =?utf-8?B?aTZUdGMwSkR2ckxsTFhVbjBJVEVFRW5ETE0rbkF3a2VOREFzSzc5RkdwaGpJ?=
 =?utf-8?B?TEs1VXFjaUxvVmxxdWVWSVNZOHBCWHFodXpwb2YwdGtDVEVxU0t5d0d6NXIx?=
 =?utf-8?B?MzlIaTNmcU1sVUVUdFFWRnRpMjVsTjByTVNLVFZGT2N2ZzZwWEZBWWhmb3Rm?=
 =?utf-8?B?S1F5RUhjSVdYMUVPUUVvTlVGcW1sUE03NEs0alJLNXBVTUpsOUJWK0RWWVhp?=
 =?utf-8?B?SFZqMzNiMC9xMEhEV2pUYy9XUHNvNklOSDByRU9UKzZyWTBlREt3R2djR1Bp?=
 =?utf-8?B?bEM4Mkg5Vi9wS1lGNndVcE1hWnBzSWVQb01iYXFta2hmU2tmeHk0dzdCY3dR?=
 =?utf-8?B?UTJoVmhmWTNDZU0wbEZUZ1ArSjNCZmp4TVF5L29INlREdEQ2L0V0OG9LTEE4?=
 =?utf-8?B?aVBPU2JqS3BGaW0rUTVaWEI2a01DZlZmSjZaRW1hcGhBMHU2NktLY3h3MXhP?=
 =?utf-8?B?WVdJSHN5aTFCdEErR0JZb1ZxU0RzN3F3aWdBZ0lsM09ROEVLa0owZHRsb1ZB?=
 =?utf-8?B?YTExTnJ2Z2t6S0FtMjExS3NaTnFjK1RTdHhJVFJ1MkE3aDltYWZrMDcxVFE3?=
 =?utf-8?B?Tkc0R0hveHBpWWpndThBRnRGWnhvdzZGU0ZQdHcveHNvMW12Vm5FczZxQUU1?=
 =?utf-8?B?QVVDcEhKcEdJdUpFY2ZUbFMyMGZ1UURWNVZ4VkkraldiNlk2QlZ2WjN1K0lj?=
 =?utf-8?B?VjdxTnhaTkxRd0xlcnVSenhrb1JhTVhla0tXME9XVCtPYTQ5WmJRdUxaTE1p?=
 =?utf-8?B?a01kRTJjZVlWT2ROOUl2YzNtQUVTRnlpeTZVeENSd2UwMmpiREhwam4rdzBj?=
 =?utf-8?B?K2pzdWMyK0lvYjRmUERyeGFtbzM4Zlc0OGw3Qk5rc0tyL3V4MVY4Z2JuenZ4?=
 =?utf-8?B?NlJvWkxjRUltN0VXKzdqaUZpbklSTDVkUkVLWVN2cXcrR3FleWpaZk1GZkZR?=
 =?utf-8?B?YTd5TWZnN042Z09kdmx0KzBBRGxXSUFTc2NNVWFyWTdWOVU4alNhcUlpNGdt?=
 =?utf-8?B?bkVSVk5MQ0NyUUliNWwwU2E2VzhqQ2tackxBWXI1T3RzakZTL0lFcURVZlR2?=
 =?utf-8?B?SitGQTdadDc3NnhHUjQrTG9mNDE2U3B1QTlUbVl2OUQrKzN1eGNPRE5SaFQv?=
 =?utf-8?B?RWs4UmNYQmpQRnE3TTBmaGxvczNwT2h3L0ZVZGFkeVpSM1JvR2dIdFR5NlUv?=
 =?utf-8?B?REhiVVBPZ0VzZ0tpT2tZV0JoQ3d3Qkg0aVFxbTdWMVFiMHMvUFozZXRxOW9l?=
 =?utf-8?B?L2Z0aCsrMGpPcHBkMERUQXBYdE1zaGpMMWZpNng1bVd2YVBoWmlxQzBNL3JW?=
 =?utf-8?B?VDc2V1phL1FEb05QNEYxb2JYWm1xSzhHOE5YbFhUY2xJanRUM2tucm1lNXcy?=
 =?utf-8?B?YlVnbjdIUGtPaEt4OGpIMFdFcUV2NitRSkZ1NmZnd2cyUDZzcjRlZ2djdHMw?=
 =?utf-8?B?S3hsZlFkUHJYTjhjU2tRcjVFczFkT2xFRFdETi9yN05RVXpWQmVZZ0lhaVlB?=
 =?utf-8?Q?nkiNgB3/Q0Zlb78g=3D?=
X-Exchange-RoutingPolicyChecked: VADx9dgEu4mKmEk992bXRFneyPkdf1VzIMWTHvSZ9OYI8LZ+ha5NIKzLEaOaTiYLHk5wgMqF9eelyFwcTjoJzdZ814Oc1uGQUH3XlFx1js8witQl1V5k/7Ud8lDCQ0iXU8gqqa7PdmgYoiih3a7HOZosZwwLPswB6mzUTEyPXAGHjIKgn7t2mffNQWW8T1DXX1cfC2erRVTjPFgjpiKndkVNhlmWOYlIdohzOmzlprwZeEHFDz5nfkjxzYn4Gke0INTyHo+W/NNc/ruKr6/jfU9f7BtvVc+iPNWTKyMBRklF1YRAIyr2fGfCDIo3WpK3ZF58gdU5WBUROsIu1I5dgQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 14430aa1-678f-4899-dbb9-08def86c453b
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 12:21:43.6587 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nREJOqnvMgmdfcPJT0DNHU6xS2/ZnBuIuA+g9hmugF2WRxuQyWahctA/WxQCipP8zoyhTdImg5DMmSp/SafV3g7YjEe4bh96WqYuaxgmxx4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB6048
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



On 11-08-2026 18:10, Tejas Upadhyay wrote:
> The interface enables setting the policy for how bad pages are
> handled in VRAM. This is crucial for maintaining system
> stability in scenarios where VRAM degradation occurs.
> 
> By default policy will be "reserve", which can be changed to
> "logging" only.
> 
> v3:
> - All FW communication moved under RAS
> v2:
> - Add CRI check and rebase
> 
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_configfs.c     | 64 +++++++++++++++++++++++++++-
>   drivers/gpu/drm/xe/xe_configfs.h     |  2 +
>   drivers/gpu/drm/xe/xe_ttm_vram_mgr.c | 10 +++++
>   3 files changed, 75 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
> index 052cce962161..c4f386d4bf09 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.c
> +++ b/drivers/gpu/drm/xe/xe_configfs.c
> @@ -61,7 +61,8 @@
>    *	    ├── survivability_mode
>    *	    ├── gt_types_allowed
>    *	    ├── engines_allowed
> - *	    └── enable_psmi
> + *          ├── enable_psmi
> + *          └── bad_page_reservation
>    *
>    * After configuring the attributes as per next section, the device can be
>    * probed with::
> @@ -159,6 +160,16 @@
>    *
>    * This attribute can only be set before binding to the device.
>    *
> + * Bad pages reservation:
> + * ---------------------
> + *
> + * Disable vram bad pages reservation, instead just report it in dmesg.
> + *  Example to disable it::
> + *
> + *      # echo 0 > /sys/kernel/config/xe/0000:03:00.0/bad_page_reservation
> + *
> + * This attribute can only be set before binding to the device.
> + *
>    * Context restore BB
>    * ------------------
>    *
> @@ -275,6 +286,7 @@ struct xe_config_group_device {
>   		bool survivability_mode;
>   		bool enable_psmi;
>   		bool enable_multi_queue;
> +		bool bad_page_reservation;
>   		struct {
>   			unsigned int max_vfs;
>   			bool admin_only_pf;
> @@ -295,6 +307,7 @@ static const struct xe_config_device device_defaults = {
>   	.survivability_mode = false,
>   	.enable_psmi = false,
>   	.enable_multi_queue = true,
> +	.bad_page_reservation = true,
>   	.sriov = {
>   		.max_vfs = XE_DEFAULT_MAX_VFS,
>   		.admin_only_pf = XE_DEFAULT_ADMIN_ONLY_PF,
> @@ -616,6 +629,32 @@ static ssize_t enable_multi_queue_store(struct config_item *item, const char *pa
>   	return len;
>   }
>   
> +static ssize_t bad_page_reservation_show(struct config_item *item, char *page)
> +{
> +	struct xe_config_device *dev = to_xe_config_device(item);
> +
> +	return sprintf(page, "%d\n", dev->bad_page_reservation);
> +}
> +
> +static ssize_t bad_page_reservation_store(struct config_item *item, const char *page, size_t len)
> +{
> +	struct xe_config_group_device *dev = to_xe_config_group_device(item);
> +	bool val;
> +	int ret;
> +
> +	ret = kstrtobool(page, &val);
> +	if (ret)
> +		return ret;
> +
> +	guard(mutex)(&dev->lock);
> +	if (is_bound(dev))
> +		return -EBUSY;
> +
> +	dev->config.bad_page_reservation = val;
> +
> +	return len;
> +}
> +
>   static bool wa_bb_read_advance(bool dereference, char **p,
>   			       const char *append, size_t len,
>   			       size_t *max_size)
> @@ -855,6 +894,7 @@ CONFIGFS_ATTR(, ctx_restore_mid_bb);
>   CONFIGFS_ATTR(, ctx_restore_post_bb);
>   CONFIGFS_ATTR(, enable_multi_queue);
>   CONFIGFS_ATTR(, enable_psmi);
> +CONFIGFS_ATTR(, bad_page_reservation);
>   CONFIGFS_ATTR(, engines_allowed);
>   CONFIGFS_ATTR(, gt_types_allowed);
>   CONFIGFS_ATTR(, survivability_mode);
> @@ -864,6 +904,7 @@ static struct configfs_attribute *xe_config_device_attrs[] = {
>   	&attr_ctx_restore_post_bb,
>   	&attr_enable_multi_queue,
>   	&attr_enable_psmi,
> +	&attr_bad_page_reservation,
>   	&attr_engines_allowed,
>   	&attr_gt_types_allowed,
>   	&attr_survivability_mode,
> @@ -1142,6 +1183,7 @@ static void dump_custom_dev_config(struct pci_dev *pdev,
>   	PRI_CUSTOM_ATTR("%llx", engines_allowed);
>   	PRI_CUSTOM_ATTR("%d", enable_multi_queue);
>   	PRI_CUSTOM_ATTR("%d", enable_psmi);
> +	PRI_CUSTOM_ATTR("%d", bad_page_reservation);
>   	PRI_CUSTOM_ATTR("%d", survivability_mode);
>   	PRI_CUSTOM_ATTR("%u", sriov.admin_only_pf);
>   
> @@ -1290,6 +1332,26 @@ bool xe_configfs_get_enable_multi_queue(struct pci_dev *pdev)
>   	return ret;
>   }
>   
> +/**
> + * xe_configfs_get_bad_page_reservation - get configfs bad_page_reservation setting
> + * @pdev: pci device
> + *
> + * Return: bad_page_reservation setting in configfs

Nit: Better to document configfs val 0 means Logging only
                                      1 means logging and offlining

With that

Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

> + */
> +bool xe_configfs_get_bad_page_reservation(struct pci_dev *pdev)
> +{
> +	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
> +	bool ret;
> +
> +	if (!dev)
> +		return device_defaults.bad_page_reservation;
> +
> +	ret = dev->config.bad_page_reservation;
> +	config_group_put(&dev->group);
> +
> +	return ret;
> +}
> +
>   /**
>    * xe_configfs_get_ctx_restore_mid_bb - get configfs ctx_restore_mid_bb setting
>    * @pdev: pci device
> diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
> index 4fbbeafba473..7405cc5f3207 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.h
> +++ b/drivers/gpu/drm/xe/xe_configfs.h
> @@ -24,6 +24,7 @@ bool xe_configfs_media_gt_allowed(struct pci_dev *pdev);
>   u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev);
>   bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev);
>   bool xe_configfs_get_enable_multi_queue(struct pci_dev *pdev);
> +bool xe_configfs_get_bad_page_reservation(struct pci_dev *pdev);
>   u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev,
>   				       enum xe_engine_class class,
>   				       const u32 **cs);
> @@ -44,6 +45,7 @@ static inline bool xe_configfs_media_gt_allowed(struct pci_dev *pdev) { return t
>   static inline u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev) { return U64_MAX; }
>   static inline bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev) { return false; }
>   static inline bool xe_configfs_get_enable_multi_queue(struct pci_dev *pdev) { return true; }
> +static inline bool xe_configfs_get_bad_page_reservation(struct pci_dev *pdev) { return true; }
>   static inline u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev,
>   						     enum xe_engine_class class,
>   						     const u32 **cs) { return 0; }
> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> index 370bcf50c7f7..6280886e2ebb 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> @@ -13,6 +13,7 @@
>   
>   #include "regs/xe_regs.h"
>   #include "xe_bo.h"
> +#include "xe_configfs.h"
>   #include "xe_device.h"
>   #include "xe_exec_queue.h"
>   #include "xe_lrc.h"
> @@ -792,6 +793,7 @@ int xe_ttm_vram_handle_addr_fault(struct xe_device *xe, u64 addr)
>   	struct xe_ttm_vram_mgr *vram_mgr;
>   	struct xe_vram_region *vr;
>   	struct gpu_buddy *mm;
> +	bool policy;
>   
>   	vr = xe_ttm_vram_addr_to_region(xe, addr);
>   	if (IS_ERR(vr)) {
> @@ -811,6 +813,14 @@ int xe_ttm_vram_handle_addr_fault(struct xe_device *xe, u64 addr)
>   	vram_mgr = &vr->ttm;
>   	mm = &vram_mgr->mm;
>   
> +	policy = xe_configfs_get_bad_page_reservation(to_pci_dev(xe->drm.dev));
> +	if (!policy) {
> +		drm_err(&xe->drm, "0x%llx is reported as corrupted address by HW\n",
> +			addr);
> +		/* Let RAS report to FW to drop addr from SRAM queue */
> +		return -EOPNOTSUPP;
> +	}
> +
>   	/* Reserve page at address */
>   	return xe_ttm_vram_reserve_page_at_addr(xe, addr, vram_mgr, mm);
>   }


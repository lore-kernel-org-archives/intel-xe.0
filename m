Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA013C25B7F
	for <intel-xe@archiver.kernel.org>; Wed, 16 Aug 2023 20:47:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 927A810E3BA;
	Wed, 16 Aug 2023 20:47:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C10610E3BA
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Aug 2023 20:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692218822; x=1723754822;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=xBLgswDCK+W8oFHWEEKwNTq+i7s2CcVkjCmwoKyNB+0=;
 b=ONjz38FEWS1uhaQfZUwtkxNiSuC6e3lCy1g7swqtquTQLqgiqWxy1805
 82C9t6KYQdu9HfUb/TL+TvF3wMVn3bk3H3zpU7CA0Psx6diikTiD9rL5f
 aGtXYjyfkUZyfHrGryN7vfWWvuoij5I6y7C9KlfW4J8xRJhL7bYgbuCGD
 FoOanhRhfo8HEcArEFT9XuZuPdxhg4gNq0TVpxdeacK0JAvC0XSdywy5L
 E4pfq5NnxKs4Z9bwPuftOYO9X7d7ghK03ayrspBLLz7GFPb0awvh3XKmE
 8yxOUnWtAzsVO9xwUc2AEXBOchht2EtaJH79jWL5dlZh1PVTDkf87eBme w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="458990913"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; d="scan'208";a="458990913"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2023 13:47:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="737423180"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; d="scan'208";a="737423180"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga007.fm.intel.com with ESMTP; 16 Aug 2023 13:47:01 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 16 Aug 2023 13:47:01 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 16 Aug 2023 13:47:01 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 16 Aug 2023 13:47:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hz5ohc5olJXZxhjyUv74hMESdOwhmZA5/6keyhVDUA9bzFzh3S3n1T2/nfJNh8ovYEILhbnyfKcSkE/J4yI+cdJ9qMG81Nfikti2xlkT3CItZJHjkn+3kSM7WL9WlAwGkKdB2TzhtvkFlw8dOy0fYNifHeDc0sW+2R2qymFU9pnmG/Ya46SBKPK+eqs67dyllJQnDJZyXF3irXRuAaZoLnqvRFgDGcS1JaO1FbuLUgvp7zTzcncVU88QDDOhIp37HZPEOSWXSbDNElW9RTIAW3k9zdh/dhmtpG0N1oBkAB7V7gR61a0iFfGqtr+syBurMQ9rTxxOaNEO++1CqMYZtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cl+Pqukgyv1Ppm2w2+zc01jX5u53C6Pby4RUt0B1h/I=;
 b=Jz13ephzTeUewtkDk+rJxdihQFWhBzDpJIFK5bhrlJw87QmxO5Dy58baAaPCIu9eiXmZR6kZblUEFOqpMgwqA/r275VU+6Y/4KrKw03KEQgfZf4LLOTGVDH6/lSlHdD1N9mclgUAHqENuykypXqxr9fvr2gj7A8quZ2Kp4eZAebsIY/4O5eSPpwLQ642kQ4j0/z1s93Y2EjXNUX7hlw8FGLyIVgd/ujF7GKuYHVCP9QF0/GbrX65z9AIzm0G8pLUYOkCdpTieJUdM/aIMigmtVo/2MR/EK+QSePat/1t3ep60TXhymOe9Zdmuxte2lVNR3dR+0X+nhWvmBmkyGVK4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by DS0PR11MB7788.namprd11.prod.outlook.com (2603:10b6:8:f5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Wed, 16 Aug
 2023 20:46:59 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d218:3a45:e9ae:f699]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d218:3a45:e9ae:f699%4]) with mapi id 15.20.6678.025; Wed, 16 Aug 2023
 20:46:59 +0000
Message-ID: <5bda2666-6354-c351-6b5e-4118c7397295@intel.com>
Date: Wed, 16 Aug 2023 13:46:57 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Content-Language: en-US
To: Zhanjun Dong <zhanjun.dong@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20230815235606.804366-1-zhanjun.dong@intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20230815235606.804366-1-zhanjun.dong@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0198.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::23) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|DS0PR11MB7788:EE_
X-MS-Office365-Filtering-Correlation-Id: 5442be9a-ae17-473a-ec08-08db9e99efb1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tG64ZZQwGf1H3MCtGhOK04eF7QaJ23RagsZdI1tog4hAc242SGJPGoq0XeXp6BUnp4uU9eezUbfIXQ3v1NT9Wy4Q08oGBNrWiD9mkfINDYfUtMV5m+kIJdpsG9uB5K7gB0GJfxAD58RAs2RgEF5FLOQIdU9275s2nW9wdsvWS/lVjWg9MPaCEJOwVk/zj2mSFEMV1+j7G8aCxctcEqqyE9xeiId0QqYC+s4uQUzMQkx9MXf8S7o0Dsbus12f81Ga7+Iw5pzJ4kgXlByigUMVqCNdFXx+/7bgLNmhLVhjSS0++Z+DCMcZRsbwBH6cTsF7saKYzgTgOFdNI4Pr/5NP32+I58cghFK2xNZS0yXcQby9kskIgYPTY8NiSi3G8i/XGMEDbbY9HBKoyeIrr8uGAphxXaYIA5L9xJ6aOp+wAevCLFQhAla70wnLhU88Fvoj+akBovf7LZRSVe2HwgIA8oSmvXH405+5IPJ3EO5tkDmOk/7qcCof0weUhLcbSvwfpxdhan0G0TM2q9tXUf2uTDQk4Ybyi8UznWrTEFBozruW3BUYoBD65dLKXMpTb65a3lI0PuFR4SiNGOV5XdF0in1HBbgU/E0fBgIUadHNWguxA0E63moiJngcBch2IFac4zg/ZLuQmQBjjyrm3SJX8A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(366004)(396003)(136003)(346002)(451199024)(1800799009)(186009)(316002)(66946007)(66556008)(66476007)(5660300002)(41300700001)(38100700002)(31686004)(8676002)(8936002)(82960400001)(2906002)(83380400001)(26005)(478600001)(86362001)(53546011)(6512007)(31696002)(36756003)(6506007)(6486002)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dE02OC9Sd1pXVm5LL1ZaWU5HakNOQUNvVGM1eWtpMmZSaS9lY3VEeVVRcWly?=
 =?utf-8?B?OE1zRHpSOTc4Q3ZIRWowMnJwNUlZNjNGcVVWNWcySGtQRmJIRFF6dU5TVFkz?=
 =?utf-8?B?d0hHK25KWkxxK2NWYnRqdlMxKzZVb0lCNTBpVktqTlJwWklQTmN2Y0dZK294?=
 =?utf-8?B?cjRSak1LeWRmb1NGeFArbnJXNmF2U0tSQ1pGV1B2blZRSW1DSW8waG44R3gv?=
 =?utf-8?B?UXlBdEErdE1MUUt2TittaVJEY25lRFhMemJXOXoxZTU0ZUhGYnRZR1BocFZy?=
 =?utf-8?B?TjdyT2lNNnhWWGxEaE5vRGZMSnJJWkE3RGIwYnk0clBXSmxDTnEwenJ4b2Fk?=
 =?utf-8?B?cDVHU1hVUWcyUVJpNDR6SVM4VStGMk1GWjVhUVR4UnN1U1B5QlpqTkVtSW10?=
 =?utf-8?B?OFJXWjB6Z3p0c2M1SEJCemlFVXA0RFhkdWhqeEdYUWtiRVhUTWdnTTlEOTUy?=
 =?utf-8?B?R0IyL3Z4U3VZWUtSMk1zb2RXRVNHYWhJUGgrQzAxK2hUNmxwcWRQSlpFMWRP?=
 =?utf-8?B?L1lmYkhMRmptRUNkcElnL014VExLVjVjL0RTbVFXY1ZPbkRLT0RHS0FnQmta?=
 =?utf-8?B?ejl1NTBQNjc5Z3I0alZWZjdDNFI2bE04ZFhKRk9xVENpeDRUM1IzdTdjRndz?=
 =?utf-8?B?NFhhNldBRkVsWGpENmE0TitTbnV6cFg5dENJakRVbTFnZllGYVp4d2ltbnEy?=
 =?utf-8?B?QkZRekcyUytjbFI0MFNsak0xU1JuMFBrMllMYnJ0VUQ2SjMrZUliVVp6alpU?=
 =?utf-8?B?bVFoZ3ZtNXlQa0YyUXlJczRSVDN3SnVkZDh5a3pPUDZXcnB1SlVVMzVIUkFM?=
 =?utf-8?B?OUpTaVNVaXYwR0RTQTlMNk1pQUNWQWRwTkFtN1NBdlpCeDl5MThtdGxWcW1S?=
 =?utf-8?B?K2tIUDE3MVhsYVRPU0NNaW5vYllFbkRzbEk5MUZLR041czRWbFhhTG1pZDJQ?=
 =?utf-8?B?NURLcWRzMVlhSmF4c3phOTZBcm9OeVAzV3U0bjdFaDV2S1d2SW5nRWpVVFkx?=
 =?utf-8?B?blRLNXc1Z3pzOHFhRVpWMVE4WWwvdDk3VW91aURpU04zcktLNHREemJVTzFH?=
 =?utf-8?B?MTI3b1lMVzlSYUxkWkd5b2w0RzFVUnJsTEErc1RnU3hCT2hUU2FYa1BQWklp?=
 =?utf-8?B?aVBaSU1rOC9JOVJSZ0EvT1lMVWcxYnRJMVVURWdCSkE2T2dMOTkwbXNYbzhy?=
 =?utf-8?B?V1RreFNDNEpMN2ZNZVhxT2NxTDVzOW1kWU1HYU1LNnFidDVLbUloNFAyUGdj?=
 =?utf-8?B?ZnQ1N05saC9uTzNOWmQxNkl6OWVzM0RtQjFkM0I0aFVwYWNuY2VUUk9WaWU3?=
 =?utf-8?B?TmlhaGRuMW5rZENvOWZvc1RIMVlRQ0N3Nm5Zai9RTGMxUkMwbUtBTWxtWmJo?=
 =?utf-8?B?S0lFQzVYeHRrcVBIbjgrajhaSzJCeUtUT25EUVpvSlI3a2E3bmxYT0drOE0x?=
 =?utf-8?B?SkxqWVE3N0FTNVFlNE1JdWhFUFhLZjIySDdRTmllUUlkais4TmFZWUZvZXZV?=
 =?utf-8?B?MHdBeW9WNUdFSWhWZzIvdURiMURkVk53WjNvVThxcHI2cUFhYjBncUQvelp5?=
 =?utf-8?B?ZGxaTlhycFRkaUd6bWNpby9JbWZpRmEvaVlPTWNFeklRZzdOM1orSDNhM3FR?=
 =?utf-8?B?TUhLTHJGVVBkQmRzeGlMZ1p3U05Id3VjYi84aUFLL3BvMXpaQVVRdVhwdWhO?=
 =?utf-8?B?dEFoTzFybitYTFdrL1pJMHlpM201V0s2YkpKVWlUdUtzYjBRQjVOYkM0cjBv?=
 =?utf-8?B?dkpYUzRYbnNQYkJ1cUJvZGM3b0NQcGJyVjZJcjUzZmR4T0VCTFZodVJzZXht?=
 =?utf-8?B?UC9wU1ViSlgzK3h6N1RDbUJ5LzJyazJKM0xNSElxcW93UnFoMUFsR2lRM2N1?=
 =?utf-8?B?TU9iRkNuZlNac0c3aGdDZVhaaU5TNzNURklvb01YV1YvaGNlVkN0ZEM5NVRS?=
 =?utf-8?B?OEJjNlQxb1pYbGsyc1Y3TVBYbmFKT0dTdXcyRGRWNUNxcDc3UlU0S3RwUHFk?=
 =?utf-8?B?MHFuMTBISmk4eXBhd0JVYlpFMjBoelc5d1hVcUs3Z3RnT0RZL3gxUkJoZmRP?=
 =?utf-8?B?cmI0VEVwSjRaamRsZlpTR3JYcm94SVRPQ1NzSm5qNjJuSnFkYWtxRGdWNVVr?=
 =?utf-8?B?NVk2V3BuanpMUDBtbFF0a2RvNE1pNUlHTTh0cHhOTGFNbFhlOHVHejlWMVd4?=
 =?utf-8?Q?SwcRVQcm0FC51VCLyGpQHXY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5442be9a-ae17-473a-ec08-08db9e99efb1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2023 20:46:59.2988 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iY6LHnZME1bWVzQ4zFQX2d1CkNIsk6DIwc+A152iDl6UTtFqAWg3eYYIgBwe5QluFy58HOfqyyWjN0j0krjtnszJiMWR+G1hVMn2umH83Nw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7788
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Add patch version on guc firmware
 init
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



On 8/15/2023 4:56 PM, Zhanjun Dong wrote:
> Add patch version info on GuC firmware init. This is required info for
> GuC log decoder.
>
> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_uc_fw.c       | 7 +++++--
>   drivers/gpu/drm/xe/xe_uc_fw_types.h | 2 ++
>   2 files changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
> index 6c95a3e4c3f2..408b816f9e40 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
> @@ -403,11 +403,14 @@ int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
>   					   css->sw_version);
>   	uc_fw->minor_ver_found = FIELD_GET(CSS_SW_VERSION_UC_MINOR,
>   					   css->sw_version);
> +	uc_fw->patch_ver_found = FIELD_GET(CSS_SW_VERSION_UC_PATCH,
> +					   css->sw_version);
>   
> -	drm_info(&xe->drm, "Using %s firmware (%u.%u) from %s\n",
> +	drm_info(&xe->drm, "Using %s firmware (%u.%u) from %s version %u.%u.%u\n",
>   		 xe_uc_fw_type_repr(uc_fw->type),
>   		 uc_fw->major_ver_found, uc_fw->minor_ver_found,
> -		 uc_fw->path);
> +		 uc_fw->path,
> +		 uc_fw->major_ver_found, uc_fw->minor_ver_found, uc_fw->patch_ver_found);

Why log major an minor twice? can't you just add the patch number where 
major and minor are already logged?
Also, do we need to update xe_uc_fw_print to include the patch number as 
well?

Daniele

>   
>   	err = uc_fw_check_version_requirements(uc_fw);
>   	if (err)
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw_types.h b/drivers/gpu/drm/xe/xe_uc_fw_types.h
> index 837f49a2347e..444bff83cdbe 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw_types.h
> +++ b/drivers/gpu/drm/xe/xe_uc_fw_types.h
> @@ -106,6 +106,8 @@ struct xe_uc_fw {
>   	u16 major_ver_found;
>   	/** @minor_ver_found: major version found in firmware blob */
>   	u16 minor_ver_found;
> +	/** @patch_ver_found: patch version found in firmware blob */
> +	u16 patch_ver_found;
>   
>   	/** @rsa_size: RSA size */
>   	u32 rsa_size;


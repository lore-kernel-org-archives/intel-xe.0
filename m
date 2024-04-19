Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66AB7C4345F
	for <intel-xe@archiver.kernel.org>; Fri, 19 Apr 2024 07:08:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FCD210E4C6;
	Fri, 19 Apr 2024 07:08:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fpsci6Id";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03CFB10E4C6
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Apr 2024 07:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713510503; x=1745046503;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=Q48sj9EOPs8vx6L2hwNSTik0lEdbQQHcRXgMSYjSkGo=;
 b=Fpsci6IdTZdW/E6GbNim/0bbNQHoLEGzb2fFEx7qdKaLPSH1my/uWng8
 e844S3KNIzqeP8qx7cXRrfMfsKH02SO0cgEYT5l2mHsZ+Yj/tPXLfRT8W
 lgY0NE7tJqDuRCm0fONh5oM05F6EuK0aC5uGha3AqRZZhmGSo8d0hkXKq
 Llc5JIgfdQIiOJDdpwAMKEq7hsQQatPA76TmmgazWn+xaF+hnn1WZCDEc
 Wu0CKj/Lbl1dNF8f6LUxrlsZvXu1l3KKohYNbvvyRwiDnCZaELmJbajpN
 GpYz1EwvsdiVT6mMTcHCy+CwBl1GD7nGUX/pyvCkDLVBAPKXCPC7WkJh9 g==;
X-CSE-ConnectionGUID: JtgO5aZRRveeXkdj4nKWfQ==
X-CSE-MsgGUID: 8tFk3BP/S4iJIL0zibwt8A==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="12882293"
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; d="scan'208,217";a="12882293"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2024 00:08:22 -0700
X-CSE-ConnectionGUID: wOEuN4soQWSOBaXkmY1nSA==
X-CSE-MsgGUID: ZdScpcLTTv2P5qaEex1NyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; d="scan'208,217";a="23313134"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Apr 2024 00:08:22 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 19 Apr 2024 00:08:21 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 19 Apr 2024 00:08:21 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 19 Apr 2024 00:08:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VFSsBGSeNe9E6VJ2bqEoQsoE1CRG/ZSAexMBNhP91gPmGLhnSc4Ck1IViDet/WCy/YI5/gTBOPHi6hy9rvAgcGhNTczzNuel96o6yZ6xB7IJi+/8fVc81mI0JJg9FFcDID9+VhS6j4w9gjy7re5bB1EB+5xZOZAsLtgr3DRGySeY8T5OS42ve3jKILUWzzZjo9toNdIPTJ318di5H0VjJBziwwmlJz1Q+npzLpPBEZidKdon8w2yogGhs9IYmgq0Oyzpbj+ZOMWQ4HkYgYvWx7Sf+DIu8Q9k/sj213ch+9YpyKdqpu2hXlBmCL++t4wSpXmdQy4KNDcN/wG7r3IDbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LtA4N7mYi9Rc9Kf/rHU7l9ivXx2o3Af2jcz3iUXUPiM=;
 b=i+1xK2LDoOGhonAljautk+mbkcHPoaSu4OpqRyKs0/f4YejvSqvWWYEt6T3Ko0a9UsfNewES0oqt5xIcCBMlpi5Xdu4QnW16T697JWBokcPBG9QiTYYyN9+2IVRQGF/3E1/kZtHPWG83+m8rbIMW+0/j5Z7ZY8L/byzz3vvQG+DT4BrPVoRQTToifeZHyAHgvYnpNNOpSvFxA0G1j8AYZaVbYPURgSNdmjeZRraGZIM86NudUQOH+V7rGz0emZAnrkYtg9dSI5MButYbb2+0kXGvBaO/xiHThlOMoyVgltqD2uQAsymqMwjdt7qUKCaO9DTUzCpRG42OVIgJxIBsRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN6PR11MB8146.namprd11.prod.outlook.com (2603:10b6:208:470::9)
 by SA1PR11MB7016.namprd11.prod.outlook.com (2603:10b6:806:2b6::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7430.46; Fri, 19 Apr
 2024 07:08:19 +0000
Received: from MN6PR11MB8146.namprd11.prod.outlook.com
 ([fe80::8542:9a6e:8019:7360]) by MN6PR11MB8146.namprd11.prod.outlook.com
 ([fe80::8542:9a6e:8019:7360%6]) with mapi id 15.20.7519.010; Fri, 19 Apr 2024
 07:08:19 +0000
Content-Type: multipart/alternative;
 boundary="------------4k26BI8Gg0uMk1O36YHkBkBQ"
Message-ID: <109eb32e-99c9-49a0-8166-42ed59e67662@intel.com>
Date: Fri, 19 Apr 2024 10:08:58 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/7] drm/xe/uapi: Add a query flag for
 has_device_atomics_on_smem
To: Nirmoy Das <nirmoy.das@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20240415145214.25641-1-nirmoy.das@intel.com>
 <20240415145214.25641-8-nirmoy.das@intel.com>
Content-Language: en-US
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
In-Reply-To: <20240415145214.25641-8-nirmoy.das@intel.com>
X-ClientProxiedBy: WA2P291CA0002.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::22) To MN6PR11MB8146.namprd11.prod.outlook.com
 (2603:10b6:208:470::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN6PR11MB8146:EE_|SA1PR11MB7016:EE_
X-MS-Office365-Filtering-Correlation-Id: 146b8c44-8811-4733-59fe-08dc603f7de2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7UroevD1POI3L4eS1kjctg9qGUjYhsislbt81oa7jl+jPMaVjaHfGJydsURVLS1mMNZ34T7cLxZXdKJZNT/dXButrlo7jpaXS+d84s79ED5UWdg10cGadL2tA2f3iWKKBWPEnbQfsuNlPwi5DwZm5RAQ52C5B4c74A62fnzAg14XRbZnfPKBg+H85xY8O0AaLCTmIpUdXucUeOilwxPSAzB1mP//9SHX8PB/XN6UrFGcREqCaI3wdZ+cIar016nAdJQhVeyewDuWDdnw8lbJDAXXpOnt9FbtMpXH+j8t30CIhrg3CzfsAJlaMI2Sp6usDgtlslaSDUu+Lbtr0U8b2J3qnfEmxCRvTYLRQQmbY9zrsg3alG9lYJrTcW00MoF9VjG2irqsM3Z9dUs2qcTlPVwPwoisLKLsyscBkRwcrLVIFPEdH6kyTkrjabfYayp8RdevPfMW2XtFmO5OBeE47KgXtQr46cEkZFW5Z3vz4ns2gLwAKcYyaT4gOHTDtAV8gWOJDjvXGfpl9zhj/4/QMK58Cg8gyIuyrrVgJjrX8z6tXkElK+1DUjDQQZO1lvXUvCKEfUJRZuRfiekyBEaS3xBVFvV9x6g1BoXkOGIXXa4gPpRnRrw8USjwgtiRMTnsAErpOfONbb7+IcLjmoQyT6fLEgY4Aasfuw71acn30Hg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN6PR11MB8146.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cXE1TWplS0lKaUVPbUJFbXNUeitFU09WQUppb3g1bnRGUWhva2RpMGQxM0VD?=
 =?utf-8?B?U3dZMmorMmVCRnBoYXZpRHhTV0VzeFVBQVFlbmVpTFBTTS9NWnBnOW5teEgy?=
 =?utf-8?B?aW1zb1NCdW9Fb3ZvR05oamk2UEg1WkxXS01xZmJOTGk0UVI4S2JmZm9OV2Rr?=
 =?utf-8?B?VmNOWVBGb3FWd2EzejRMME1qKy9rTmptS0liZEJXQjc1ZFVuRC9nQnNyUFpB?=
 =?utf-8?B?MVg3Y3g3YjNDdTBWMGg4c1hMMHBWTFpsUEpyRzZpN29yTkFuRXV3dm1wMFky?=
 =?utf-8?B?NUUxYU84SVJQMWl5cEhEOFNndTNWUzQveHNOV3lxWnIza2Y1ZHhaSEZJejVQ?=
 =?utf-8?B?Vy9KME9uVWJDeEVoZjllMkJ0aS9oM2RZbEJYd3ZNdGt2WFA4b0k0SDVzZ0d3?=
 =?utf-8?B?Q1Eyc2hRQlY0UnNINWV1RXR2MzU3WWNjQXRTSXFnMmJRbGpHY0xYZ0VIeVZF?=
 =?utf-8?B?TEg3YkM3QVJIc3gxQmRTeFVpemx6RHdGRGFOZWhQY29iaU5jYURWaWYwbGcx?=
 =?utf-8?B?Z0kvNjZWZEYzUmV4MEJ1SXZlZnhuNnBXTjgyRm1JV1EvRHFTNGw3b1JRKzhp?=
 =?utf-8?B?VjdTelVoeks4UldwK09qYmRlTUxtZFE0TGN5VFhzeUI3RkdOM2hMZHIwSVNj?=
 =?utf-8?B?TDN1QmQ1LzZqV2QzY1Y4amRNL21ublNJTHp3SlNIR3dONlMzQkdNMzR1WE5Q?=
 =?utf-8?B?Y0JWMFVFa243Qm1PNjFkMFlTbXJLYzJsSGRUbFJ6cTlac21zZGJOcVlxeW14?=
 =?utf-8?B?c2o0SUlTSldKRTNiZnZyYnlIMi9hSzZMb05SZUtFVXJUV0JZSWk0MDEvb2pL?=
 =?utf-8?B?ODdjaVNCOWFNN3hhOGxpZndlakJaY0M4TUR3d05VbXB4TWIwcWJ4RUZ5V25s?=
 =?utf-8?B?d1ZDaWxCTFRpUVNUTjFCRmFPZTE0Qi9OUWNhb1JIMG5MSG9nYzg1aVhIdWtJ?=
 =?utf-8?B?ZnBXcE9WZjhCcGtrQ2VDdFNtK2V5SWQrR1ZqYlBIY2lWZHdGZ25KR1phcTFu?=
 =?utf-8?B?d2pyS2lPNlpwemJRaGFraTgvM3pnenMvUXp2YmowYVBlNlVIT1J0aWYxOGF1?=
 =?utf-8?B?QjY1R3BhaXBROUtKUmY5VWxlTjRnZThpWmF2TEpocW0wVnNHSjVHcG5nQjFW?=
 =?utf-8?B?eXk1clAxR0lKSXY5eERrbkd0NkNVVGJYaDNVUUVXT2EzRzA1TWpjVG10RjZy?=
 =?utf-8?B?OUZhR1ZhbVE5YjlCQzVWWDFHYjZra0ZJcmRpakpqUEJkOFN3dDBaNkpOeC9u?=
 =?utf-8?B?NGk0NEk2Vk41ZlZpc0NQTVNjb05YZ0pabm5jQUR4K2pjdTRkOUpVZFNseXRS?=
 =?utf-8?B?TTRaQWZ5V0JPS2E2SzlwaExEY3dDMWQ5alNvcmhYNmN5K1FKRTNLOE5QK0E4?=
 =?utf-8?B?N3NRc1ZYRWFPdkdFT0I2UWVRSnZZMSsyVnQvY3Y5SHc1bS9tRXNuY2hxUWZQ?=
 =?utf-8?B?SVRSL3dtTDRvV0xZcUdZOWI4WExBMTVBSUpZell6VnpKUlZxby9nS2UwUHFm?=
 =?utf-8?B?c3dLNjR1SVY3VEd0UUhuM2pKSFpGc2Rha3VKbmV6Z3IzeDQxY1ZWVzJjY21j?=
 =?utf-8?B?bXNnSXAxNm9vNC9DMndtaFE2akY0MU95KzBLWTE3V1E1WWFFUVpJMnYzODlo?=
 =?utf-8?B?cGxpMWgrOURyeXd6MzhtSC94ZS9QL210WmlnNW4rMlcrbGJZUVMzZCtIS1hw?=
 =?utf-8?B?Y2hHdEhEbmpzQm1FTFA1WWFQSG1MY3VxSktRZ0VyY1RFSzUwOEFpV2Q0T0J6?=
 =?utf-8?B?NUd5c01PTHByLzlLczdYZEF6bW5TSFNKZ3g0VkZuV0hxVU9ObEthSnFKWUxz?=
 =?utf-8?B?U1VNVUEyTHREU1dNYVgxWUxpUzhOR01NcTcrMUJqSS9kRXlPWEsybmJtWnQ1?=
 =?utf-8?B?UGI3RnlOQTdzSXQ1Y29FM3Z1Q2hYTHU4aWFqeERyWFpMNk8xeWJzcURuZUU2?=
 =?utf-8?B?UG1KOEJydE83YWhBTnc0THJhK2ZCNEVDZHp2dmNJYjdYb1E2aXdVUE5EU0Mr?=
 =?utf-8?B?VU8rdld2b3BlYTlad2xHVkpTN2xremt1MEJMcmw0eFRuQlJiRDR4dTZmUHhZ?=
 =?utf-8?B?K3U0aThpRndjZWVGZzZxWjlZcS96bTlTNzlYNmFHMDJ3bGNoK1M2ZHJCYzRk?=
 =?utf-8?B?NUNYQVR0VmVvM01aWU1Qd1RyZ2g4aUw3cmhWUHdsU3phRmZrdUxVYTlwS1JL?=
 =?utf-8?B?SVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 146b8c44-8811-4733-59fe-08dc603f7de2
X-MS-Exchange-CrossTenant-AuthSource: MN6PR11MB8146.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2024 07:08:19.1839 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AFNRHrgVReyLv1mAoy82R7omxEGSf9SlHZqhcii8SAKeGoaQubSr6U03ts8zIHFdEVvG2oaZ1jtLE2wvbuEsiYgMgoLcXxRWXO+m1O9WTzU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7016
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

--------------4k26BI8Gg0uMk1O36YHkBkBQ
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 15/04/2024 17:52, Nirmoy Das wrote:
> Add a query flag for xe->info.has_device_atomics_on_smem
> as this is platform dependent. This flag can be use to inform
> whether DRM_XE_VM_BIND_FLAG_DEVICE_ATOMICS can be effectively
> applied for a given platform.
>
> Signed-off-by: Nirmoy Das<nirmoy.das@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_query.c | 3 +++
>   include/uapi/drm/xe_drm.h     | 5 ++++-
>   2 files changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> index df407d73e5f5..43272fdd5442 100644
> --- a/drivers/gpu/drm/xe/xe_query.c
> +++ b/drivers/gpu/drm/xe/xe_query.c
> @@ -336,6 +336,9 @@ static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
>   	if (xe_device_get_root_tile(xe)->mem.vram.usable_size)
>   		config->info[DRM_XE_QUERY_CONFIG_FLAGS] =
>   			DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM;
> +	if (xe->info.has_device_atomics_on_smem)
> +		config->info[DRM_XE_QUERY_CONFIG_FLAGS] |=
> +			DRM_XE_QUERY_CONFIG_FLAG_HAS_DEV_ATOMIC_ON_SMEM;
>   	config->info[DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT] =
>   		xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K ? SZ_64K : SZ_4K;
>   	config->info[DRM_XE_QUERY_CONFIG_VA_BITS] = xe->info.va_bits;
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index ca4447e10ac9..80fff6fe3199 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -389,6 +389,8 @@ struct drm_xe_query_mem_regions {
>    *
>    *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM - Flag is set if the device
>    *      has usable VRAM
> + *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_DEV_ATOMIC_ON_SMEM - Flag is set if the device
> + *      supports device atomics on system memory
>    *  - %DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT - Minimal memory alignment
>    *    required by this device, typically SZ_4K or SZ_64K
>    *  - %DRM_XE_QUERY_CONFIG_VA_BITS - Maximum bits of a virtual address
> @@ -404,7 +406,8 @@ struct drm_xe_query_config {
>   
>   #define DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID	0
>   #define DRM_XE_QUERY_CONFIG_FLAGS			1
> -	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM	(1 << 0)
> +	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM		(1 << 0)
> +	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_DEV_ATOMIC_ON_SMEM	(1 << 1)


I find this flag a bit confusing, because it would imply that platforms 
that do not report this flag don't suppoort atomics on smem.

But for DG2/MTL/TGL (if officially supported by Xe), that's not the 
case, yet they do support this.


Maybe renaming this 
toDRM_XE_QUERY_CONFIG_FLAG_HAS_EXPLICIT_DEV_ATOMIC_ON_SMEM would make 
more sense.

Meaning the platform requires a specific vm_bind flag to get atomics 
working on SMEM only BO.

-Lionel


>   #define DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT		2
>   #define DRM_XE_QUERY_CONFIG_VA_BITS			3
>   #define DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY	4


--------------4k26BI8Gg0uMk1O36YHkBkBQ
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 15/04/2024 17:52, Nirmoy Das wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20240415145214.25641-8-nirmoy.das@intel.com">
      <pre class="moz-quote-pre" wrap="">Add a query flag for xe-&gt;info.has_device_atomics_on_smem
as this is platform dependent. This flag can be use to inform
whether DRM_XE_VM_BIND_FLAG_DEVICE_ATOMICS can be effectively
applied for a given platform.

Signed-off-by: Nirmoy Das <a class="moz-txt-link-rfc2396E" href="mailto:nirmoy.das@intel.com">&lt;nirmoy.das@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_query.c | 3 +++
 include/uapi/drm/xe_drm.h     | 5 ++++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index df407d73e5f5..43272fdd5442 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -336,6 +336,9 @@ static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
 	if (xe_device_get_root_tile(xe)-&gt;mem.vram.usable_size)
 		config-&gt;info[DRM_XE_QUERY_CONFIG_FLAGS] =
 			DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM;
+	if (xe-&gt;info.has_device_atomics_on_smem)
+		config-&gt;info[DRM_XE_QUERY_CONFIG_FLAGS] |=
+			DRM_XE_QUERY_CONFIG_FLAG_HAS_DEV_ATOMIC_ON_SMEM;
 	config-&gt;info[DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT] =
 		xe-&gt;info.vram_flags &amp; XE_VRAM_FLAGS_NEED64K ? SZ_64K : SZ_4K;
 	config-&gt;info[DRM_XE_QUERY_CONFIG_VA_BITS] = xe-&gt;info.va_bits;
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index ca4447e10ac9..80fff6fe3199 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -389,6 +389,8 @@ struct drm_xe_query_mem_regions {
  *
  *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM - Flag is set if the device
  *      has usable VRAM
+ *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_DEV_ATOMIC_ON_SMEM - Flag is set if the device
+ *      supports device atomics on system memory
  *  - %DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT - Minimal memory alignment
  *    required by this device, typically SZ_4K or SZ_64K
  *  - %DRM_XE_QUERY_CONFIG_VA_BITS - Maximum bits of a virtual address
@@ -404,7 +406,8 @@ struct drm_xe_query_config {
 
 #define DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID	0
 #define DRM_XE_QUERY_CONFIG_FLAGS			1
-	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM	(1 &lt;&lt; 0)
+	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM		(1 &lt;&lt; 0)
+	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_DEV_ATOMIC_ON_SMEM	(1 &lt;&lt; 1)</pre>
    </blockquote>
    <p><br>
    </p>
    <p>I find this flag a bit confusing, because it would imply that
      platforms that do not report this flag don't suppoort atomics on
      smem.</p>
    <p>But for DG2/MTL/TGL (if officially supported by Xe), that's not
      the case, yet they do support this.</p>
    <p><br>
    </p>
    <p>Maybe renaming this to<span style="white-space: pre-wrap">DRM_XE_QUERY_CONFIG_FLAG_HAS_EXPLICIT_DEV_ATOMIC_ON_SMEM would make more sense.</span></p>
    <p><span style="white-space: pre-wrap">Meaning the platform requires a specific vm_bind flag to get atomics working on SMEM only BO.</span></p>
    <p><span style="white-space: pre-wrap">
</span></p>
    <p><span style="white-space: pre-wrap">-Lionel
</span></p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:20240415145214.25641-8-nirmoy.das@intel.com">
      <pre class="moz-quote-pre" wrap="">
 #define DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT		2
 #define DRM_XE_QUERY_CONFIG_VA_BITS			3
 #define DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY	4
</pre>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------4k26BI8Gg0uMk1O36YHkBkBQ--

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BA89FB5168
	for <intel-xe@archiver.kernel.org>; Mon,  6 Apr 2026 20:49:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CE2910E290;
	Mon,  6 Apr 2026 20:49:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cfvUrzrk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 366A310E290
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Apr 2026 20:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775508590; x=1807044590;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=PD4Lg+OjVY+N1x9T1ao6TNoLUYTplwuvc14RX/sQujs=;
 b=cfvUrzrk5ugzc0W1uDShwq3btnK1LOk6QDa42+KY4mOMadWG0A19FpfT
 wL2gPaaPDhybXiL0DDHGaWl6T+dqesPCSny1CR36cJJSSA8L28STLDSr0
 yn6Qn3lsNY5R/8gOa5HOYF9gaPOhqbOt++1EwLuuP6sdOA+BqY1D1VLq1
 aQFa3jaCWWtf2eAFJzuKysOVOiiwbdaCPynFQtMrYUEhMSxVU5FJOVHcc
 meTpUtmsOW5+MnaQYXtIb+bN6N8FMrFSjMfzJy6xdh4ug9oMK7awBLaTC
 Cn/4/DAA1Sihbq/ZECpnb3TLFeWrltqNeoppp+5h6SWBueRM9S5JORjv4 Q==;
X-CSE-ConnectionGUID: djMwqU2BSTGVO1fv/8kosQ==
X-CSE-MsgGUID: 63XSEfw8RCu5VeQCWStk8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="87087822"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; d="scan'208";a="87087822"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 13:49:50 -0700
X-CSE-ConnectionGUID: QXyZR8DjRdCaPklihhL2Uw==
X-CSE-MsgGUID: QKEhDAdNQE65YuGrxs0jQg==
X-ExtLoop1: 1
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 13:49:50 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 6 Apr 2026 13:49:49 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 6 Apr 2026 13:49:49 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.28) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 6 Apr 2026 13:49:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oMONDEqv9zdfwzTOcoyN9FVdtmUyomXCNoRsIbhkcdBB5iMPTFy2RlvyqygduvXTeWvEFcPNYDuSMJ6XF9WDAuIHwY2hCb1AVLPeaLS26eME3mMFgPuLgtjD0XOTvCujZw0755j7qnTN5oPkWU3UU+S3dp6c7PRcglSI9JoILBv3Rqn669tgFUuCuDOSGPq/Ha+Xv1BoXjydn1WXglHcnEL/Wms6nVdJciBrWBSVqCHKc+kmytKusy2Qi4SGCIloV32GVc0htc0EyETw55V0mTLJPVGm/p64vAF+p0kjnpamIxfc+riXGPQTQ0YFHO74lr10fVPTphZCgv5PgCebwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PIw0I3Jsu7F3LKy+/T67Sk70LuxAfnSJOu4X9Yhqtdo=;
 b=n/l8VsEiCX38Z8vfAqn3k9AXCPR2l7kcdvVjN3VtCGNWfMRivSWWUtv0TaUYQsd3ff25QX7GZVYUYFa+O6DxEBUPe9aY5J+XdzFu1yFIUcASnnmIWcyKQmS8Z5CpOnuytLArGL7hjiF7b0Sl7y+EtXgBIkTO+Gh6ekXsFflH2fx/Xjqdy+V5DMvpomdUS6DTwTQ/yioncMQk7D7zWVz/WMtpCh8d0Q0KBvxUbTBdVLT7lvkClEAz+DYDyJG78LzAc6VkJUClE3sZG+PWCyfDOfQ0uXEc/DJAbESedmTzBdoWfJIvl1/5xzHdOgQZH+70sC7LBwA03Ls8A58pIyElxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA3PR11MB8046.namprd11.prod.outlook.com (2603:10b6:806:2fb::22)
 by PH0PR11MB4918.namprd11.prod.outlook.com (2603:10b6:510:31::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Mon, 6 Apr
 2026 20:49:45 +0000
Received: from SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::87cd:16d5:8dbe:2286]) by SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::87cd:16d5:8dbe:2286%4]) with mapi id 15.20.9769.020; Mon, 6 Apr 2026
 20:49:44 +0000
Message-ID: <3b49de7b-7d36-4037-9283-12aed98c4aba@intel.com>
Date: Mon, 6 Apr 2026 13:49:43 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] drm/xe/uapi: Fix typos and spelling errors in
 xe_drm.h documentation
To: Shuicheng Lin <shuicheng.lin@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20260331172049.3053871-7-shuicheng.lin@intel.com>
 <20260331172049.3053871-8-shuicheng.lin@intel.com>
Content-Language: en-US
From: "Wang, X" <x.wang@intel.com>
In-Reply-To: <20260331172049.3053871-8-shuicheng.lin@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR08CA0002.namprd08.prod.outlook.com
 (2603:10b6:a03:100::15) To SA3PR11MB8046.namprd11.prod.outlook.com
 (2603:10b6:806:2fb::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR11MB8046:EE_|PH0PR11MB4918:EE_
X-MS-Office365-Filtering-Correlation-Id: fdff38c9-e6e2-4707-b1e4-08de941e0879
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|42112799006|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: PosgPywyst0P9wA5jy1n08AxG4U38h9L9iRni2KxZ1SQYIppOkjH30siH0ZcQ09HIL8qlsIUpWBpHNHi3csfTWlt7YCIlN1XXZ0vp7nnaUSdm2SSKRa8jgw0mQ7hfVTDGrq8kTCKQ7rBFjltHeB1VzNvNTED6AeEDnaI7SA10MzDAtZI4+Goq8xU/VwK/V5F2tW3Xn0VByR7Cix5ykiiuHKRrey7ib+oH/qLGnih/oGoXXSROV+Xkv2tUmGrV5aqkuJIxTmKuplmcnHwP466W+lWPrMQUleg1jkbBH0KzSwcZo93uvMNHMfQwyXKIAeER5GoXTX1TRfZvIJMq41/aVEdZllFgFDqk6dhVAiOEayIKEiO/U8+zHIK+DohPoQ66MqHWSZxD3BCuyPKYHDrzSIlXliylIppoyBbv6f1HwVR7LOdMFBcjxCDeUymVadEyw9H+0NI1zsmWLGQ4vAY1PqmzbDfpdY2mQxp4mJxh9PC3pUDc0zofW3jgXbm7jCFTIaHy0AfFb/TWRUXEDBQMUFgtl4f14IW9lbMPB3KM26ve0AySEMXOM3m7PwGifx+MtMjiULF7PZgVD42FKwUoYATJ3hOKaWsD0+IZtiitk4H7mPdjalxc7ulNCAXFc62LYF4jglIZuuF3mW/79pK29Nq2znlTSipg6ICuqkIvx3RUu0VTwwM4cSq6p7Y6WCkrH4Fax+QjAPJyGtcmX4folAlSyEDHyJvFQQhr3CfNqw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB8046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(42112799006)(1800799024)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QnhWaGMrc1FDbExISGFwZ2l3YzRzNFlLNjR6TlZ3SXEvRGdHSndYNlpRajMw?=
 =?utf-8?B?Y3VzSllZVHBFL0hUQjlvc0E4Y2w1N0dpUDhzTUxMN0dwUkpQVWxZeGZZMzd2?=
 =?utf-8?B?WXU2WnNiUDczdWxZV3hTbjRSamd2NG0zY3AyWkx3bmRERUZmQXBOR3NkQzc1?=
 =?utf-8?B?aEFPQ25CeVZaNDZUTEZSVU1tTWZ1UldpMkFFb2ZBZHVua2lmNFgxM0ZpRU1r?=
 =?utf-8?B?R0hHS25LWkRab25maE1JdnFWOUhNRTdCZ3pDbkgzZmhBTkxHeldPYS9XZG0y?=
 =?utf-8?B?T3dNVmlULzhRM21scU53TTN1QUZGUmpzaHNWaGlwM3Q0eXliSGxLdGpKQnNl?=
 =?utf-8?B?cmp4YlE0RlFGQm1IS3dIbkFER3VkWWxjT3lDMmVicDJsY3dYeVVjMDVPN3hX?=
 =?utf-8?B?dUZqeVN0ZkNFWUFFTGFvY0ZHRWZ4aVpjT281ZndodFhvcUNtZTNmaDdVVFB1?=
 =?utf-8?B?dm4rSmNGZE5ucnd3RmNQS0NIUzlNS2RYSjZNNDRPcUtlbFh4V2dXVmxVUmht?=
 =?utf-8?B?MS82R2NKYllubmlzT2NuOWt3QVpLd0w4MThPSm13TVFKQmNaYmxMQThBQ2E1?=
 =?utf-8?B?a1FxeCtiV0Q5Y1gxMnhWY0Z4c2FCNnNkSnZwQWNzVTRlNW8zMlM4S0I3UWdG?=
 =?utf-8?B?WURKaEE2NUlnSWIvWmhoY0hCbVNuOVlFMFpEUXFIVHphR25Jdm53cUJndHdm?=
 =?utf-8?B?aVZ6dlVwVXptcEdWNS8wYkJPbWhrczg5S0xOTWtkalhDdnlyT0JhMGQwWjM2?=
 =?utf-8?B?d084NmNXYVVmTzBuNFdITlVZTFBuQ1RSQWhpa1p2dU9tcHFGYk5tVHFtSG5K?=
 =?utf-8?B?RU1vc1MvWDc0SjEwQXdOM0V3RVBnSWY2bzU5SWp3d3g4OUNSWTAxajZaYTFp?=
 =?utf-8?B?a0x1bDFuODVsWjgzeWJDUFhmM21ycEM1WHB0bE1KaWJpeGprM05UckU3RFBj?=
 =?utf-8?B?cmtTL1pod1lrUVlUVU9JbmJXaER0aHgrWlVmQzVqc0dvdkVxaXVodkhkQU5M?=
 =?utf-8?B?blphekNzcmd1eGdDdUxuVFl4Q21vT0QxS0pPTnBUbnhMM2F1RTZhQndDY3Ux?=
 =?utf-8?B?K0g0MDR5enNiQ29HNlRmcVNMLzY2OGpnYVJzU0J5ckJMZTJyOHhCUUxKZ0hE?=
 =?utf-8?B?NzdGdWdCRGMxTDVxeU15cnMwOFN1Vmk0aG1kbzRVZCs5R3I3aWlpLzRGQ01a?=
 =?utf-8?B?QmdMRUF3QkRzemowZHpqTldESGlFUUFjN2lPSUFMcjhuS2NxY2grWGxDUmIz?=
 =?utf-8?B?Ti9LbElBOXF0VE90b2tsMW1JdEhkeHlZVHZYd2VyZnRJZ1paOGZpaTNtMXVJ?=
 =?utf-8?B?ZXVDdnUxdFh5L3BNMU5CWUFpRG1NdE9MSzEwSmtaU0E0Yk1vSFJMS1dON0lj?=
 =?utf-8?B?YXhOZHVDWFdPRjF2WmE2YjhYR0tBbHYwUldiK3pZZjJ1YXVMNTltYzM5NG1P?=
 =?utf-8?B?NTQrVWIzbll3c05paGd1V1J2WVhSZmpjeFdYdHJWNmNmemVHaTRNMDZvMUFJ?=
 =?utf-8?B?VXVpRXZjcjJ0NnA1RW1wNXgyN0xkb21UbDdGbXhvNUFwS0ttSTZDd2pkQUU5?=
 =?utf-8?B?TEt2cVVmWFZUZCtDWmxnZmcyOXJaSHB3Q1pwVlorK3pZSDZDb0NBRzJadDc4?=
 =?utf-8?B?d05maVIrVGphSVdsbEk3bHdOQThCL20rd240RllRV3pXaDNUZ0ovaDdvQmp4?=
 =?utf-8?B?YUZ2N3lCS0xqZDR5UWV3MGN6V2pEc2swcm1oZkhxMnpCd1duMXk4U3g2QmVQ?=
 =?utf-8?B?TkVYVFJQSlgyb0ZRVERkcnZmZ2RCNU5JSHY5SDRQbkhHYTgvZlF2NmorS0JC?=
 =?utf-8?B?ZWI2dm1ya0ZJejNjNUJkc0pieWhJYk9xUGk2bHNqL0ovbEVvejVBNnJ3NGN5?=
 =?utf-8?B?N2ErblZKaTNuaElGQndPeHRib29xYVVCTEFiWFR4WkQ5UUJyU3ROUUIxN3RX?=
 =?utf-8?B?ZTRKeWJOQW1nSVBSenN2ZUR1YzhvSk1EckhVM1crR2tYbGNpUk85MjFERkNM?=
 =?utf-8?B?RTVaa1dGdnU3VFhXSUIwaE05V3BPaVNqamFXWFNLdThLQnMyekRScENpZFd1?=
 =?utf-8?B?MUI5WG9rV1YvVU5DUldKWVR6SXdBamJIdjF0YUtEUGZvanhyTkRmZG11Y05I?=
 =?utf-8?B?N09PK3krdXBTOTVMTTI5dUFrbVFkTXhJR0VwbnVQbERUZjY1SGZqQzMvN09n?=
 =?utf-8?B?WnFHTzdoa0ZGWFk0NUFVWG9XWDJIN1BSYWJUbmJuQWl4K3ZLb2VIamJhV2Vx?=
 =?utf-8?B?OTB5cUVxUUZzMC9YdXVPaStmanJNMExCcE5ybnppYUJwSGNvRm00aW1tYVJY?=
 =?utf-8?Q?ig9jN75MSfQ8ujkBV9?=
X-Exchange-RoutingPolicyChecked: LBPltXfVx1zuUWBzHoWNXNNj23v2C15vvkfbvOte4RhdGa3wbp93CJY0rel61SPSsqvnW7mn8mBX3EMi8jZBhATZx3H5why3Bv+thVYzrVfrWa0jKKMZJR0NrdbFi68rgpKvPrz1VuOFZbZ7XIm8QFWB62OEe+AmRPfpxZCSLaK5UY0H4oV8YpjIok2c2GTl9DJRX9YfO36zBZFXwKU0bQaKruEU0MgaaB4zQyJPKiHN99grYXULw38Tw4UWS5TkHZ/c1QQt4LE6vwkQsz0QGu/NvHoE62JxSI0moJRPCmA3wpsdo9gobgTwC0DfpaqY+LhcI6vhOKMhbVA+kZyQ5Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: fdff38c9-e6e2-4707-b1e4-08de941e0879
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB8046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2026 20:49:44.7737 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U170y2q0a1zFJhsEZK1SuEOTUq5nsGgnlruAOimvzLN4ntqNJJ0jg8j3fW74Sr3mvHzBAGReV1CWuyFToH/kPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4918
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


On 3/31/2026 10:20, Shuicheng Lin wrote:
> Fix the following typos and spelling errors in doc comments:
> - creaed -> created (drm_xe_query_config)
> - mmaping -> mmapping (drm_xe_gem_create)
> - 0xdeadbeaf -> 0xdeadbeef (drm_xe_gem_mmap_offset)
> - x2 and xe3 platform -> Xe2 and Xe3 platforms
> - flat -> flag (drm_xe_wait_user_fence)
> - MONOTONIC_CLOCK -> CLOCK_MONOTONIC (correct POSIX name)
> - neverending -> never ending (drm_xe_wait_user_fence)
>
> Assisted-by: GitHub Copilot:claude-opus-4.6
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> ---
>   include/uapi/drm/xe_drm.h | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index ae2fda23ce7c..f17355684083 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -410,7 +410,7 @@ struct drm_xe_query_mem_regions {
>    *      device supports the userspace hint %DRM_XE_GEM_CREATE_FLAG_NO_COMPRESSION.
>    *      This is exposed only on Xe2+.
>    *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_DISABLE_STATE_CACHE_PERF_FIX - Flag is set
> - *      if a queue can be creaed with
> + *      if a queue can be created with
>    *      %DRM_XE_EXEC_QUEUE_SET_DISABLE_STATE_CACHE_PERF_FIX
>    *  - %DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT - Minimal memory alignment
>    *    required by this device, typically SZ_4K or SZ_64K
> @@ -888,7 +888,7 @@ struct drm_xe_gem_create {
>   #define DRM_XE_GEM_CPU_CACHING_WC                      2
>   	/**
>   	 * @cpu_caching: The CPU caching mode to select for this object. If
> -	 * mmaping the object the mode selected here will also be used. The
> +	 * mmapping the object the mode selected here will also be used. The
>   	 * exception is when mapping system memory (including data evicted
>   	 * to system) on discrete GPUs. The caching mode selected will
>   	 * then be overridden to DRM_XE_GEM_CPU_CACHING_WB, and coherency
> @@ -931,7 +931,7 @@ struct drm_xe_gem_create {
>    *
>    *     err = ioctl(fd, DRM_IOCTL_XE_GEM_MMAP_OFFSET, &mmo);
>    *     map = mmap(NULL, size, PROT_WRITE, MAP_SHARED, fd, mmo.offset);
> - *     map[i] = 0xdeadbeaf; // issue barrier
> + *     map[i] = 0xdeadbeef; // issue barrier
>    */
>   struct drm_xe_gem_mmap_offset {
>   	/** @extensions: Pointer to the first extension struct, if any */
> @@ -958,8 +958,8 @@ struct drm_xe_gem_mmap_offset {
>    *  - %DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE - Map the whole virtual address
>    *    space of the VM to scratch page. A vm_bind would overwrite the scratch
>    *    page mapping. This flag is mutually exclusive with the
> - *    %DRM_XE_VM_CREATE_FLAG_FAULT_MODE flag, with an exception of on x2 and
> - *    xe3 platform.
> + *    %DRM_XE_VM_CREATE_FLAG_FAULT_MODE flag, with an exception on Xe2 and
> + *    Xe3 platforms.
>    *  - %DRM_XE_VM_CREATE_FLAG_LR_MODE - An LR, or Long Running VM accepts
>    *    exec submissions to its exec_queues that don't have an upper time
>    *    limit on the job execution time. But exec submissions to these
> @@ -1695,9 +1695,9 @@ struct drm_xe_wait_user_fence {
>   	 * Without DRM_XE_UFENCE_WAIT_FLAG_ABSTIME flag set (relative timeout)
>   	 * it contains timeout expressed in nanoseconds to wait (fence will
>   	 * expire at now() + timeout).
> -	 * When DRM_XE_UFENCE_WAIT_FLAG_ABSTIME flat is set (absolute timeout) wait
> -	 * will end at timeout (uses system MONOTONIC_CLOCK).
> -	 * Passing negative timeout leads to neverending wait.
> +	 * When DRM_XE_UFENCE_WAIT_FLAG_ABSTIME flag is set (absolute timeout) wait
> +	 * will end at timeout (uses system CLOCK_MONOTONIC).
> +	 * Passing negative timeout leads to never ending wait.
Reviewed-by: Xin Wang <x.wang@intel.com>
>   	 *
>   	 * On relative timeout this value is updated with timeout left
>   	 * (for restarting the call in case of signal delivery).

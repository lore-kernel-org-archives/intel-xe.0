Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 831DFC54E67
	for <intel-xe@archiver.kernel.org>; Fri, 15 Mar 2024 11:52:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 442FA1121DA;
	Fri, 15 Mar 2024 11:52:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j6YdLU/4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 909901121D8
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Mar 2024 11:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710503544; x=1742039544;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=PmHv1JAEbocfXFFMyZ075lEPkECdfui1xq/mKAHyLVI=;
 b=j6YdLU/4vBLSCk+uBODg9uG+pHOAauTh5QVHyJPUkzc+EotiOBiJ419h
 qKoVpqz/ircsFZ10PeAe/dZDzRcSZ9MnKoBF2PsY0ZkuPe7dyD7eLSMKt
 MrP8urN1jKAgC7fixcMQGn+T1bWG22vT3MCPqYhW8UDKdsCSNyBUBy936
 nDBPoGhB7Lh1uTSThCaSd5d+RNsK1IQoLBBcEz6d4gomICKkt/IdyrfDI
 KaisRBoQxvphP5c7+BbT9hju0CZmJoSHALMPmkvGhqzgXjIH+zPBWVKrH
 JYg8JmEAMAAXD4yczNuIcunNzQBWafZuYhRWuP417e+PSgP3292EIIYPU A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="9182787"
X-IronPort-AV: E=Sophos;i="6.07,128,1708416000"; d="scan'208,217";a="9182787"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2024 04:52:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,128,1708416000"; d="scan'208,217";a="50106743"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Mar 2024 04:52:22 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 15 Mar 2024 04:52:20 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 15 Mar 2024 04:52:20 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 15 Mar 2024 04:52:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aFWOgNejHHN0nVjh8bBfhQ1OryV1GinMR7N0uODasiVvi3hHXpKFO+GX6qQgcmCuM1EyAcxkT4inoDOi1yglVs9BmrrSZKsTZYIVQkX7YaTQydsNZK2jAb2u+iV2M/kyNQVhsKKBvvoD4uUGiFUJbfFWoaqmMW5KmdCv81yCTg+8wSgZbr3wJsBqgMzV7UOjFAuEQy53AzMX+yqNdy+F4aQVP1/xvtkxAUW+SerUG/FBoq0n4zMKWgWEfRc6ynK1r9niLMuQjnoqHW5M+ipCgAIHslU5q5X/r4OHYZUHsObcfD+Tu41yuUgqzTV6IvQLNotQpmZLVw3v/QnDVeg6vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M6fxBN4X+4tLL8XaN2JYjbmcR4ETT7x9ypxgYvKAfjg=;
 b=S+z8o8k1CkSOLFWJ57U7XEikLd6zOwTaOOrsvfsEwp4zLMU01cD5098vMbdWPpnSbqnS7W9AG+sjdUwVJ6Fg5+BMvyTK9xXwF59FfeVASh2SA7VcLngurkYaaBFb5b2X43mQn3Q97aNZxHhR7alKl2mVLZb13Jn7bW7ZSS+vx6xwoj+0gQ/i+MtmWL4h2rUAulK2Z8ZlRsUY12PxgJtjYn6cIb40fL7ysW2SXA3Wbac5kVENVbuAFbzAMZGPv4VmUHCsD80qp4HPKxHD0ajvyOpu4RbdB3T+7Xy0nT7axj2aeC8bnaJmXO1lh/9xotJBpvlaLI3HJRIH3//Mb5tdmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by SN7PR11MB8111.namprd11.prod.outlook.com (2603:10b6:806:2e9::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.17; Fri, 15 Mar
 2024 11:52:15 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::8664:8749:8357:f11a]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::8664:8749:8357:f11a%7]) with mapi id 15.20.7386.017; Fri, 15 Mar 2024
 11:52:15 +0000
Content-Type: multipart/alternative;
 boundary="------------ukfxAYhPUxm4sfn5WjVG9Ctc"
Message-ID: <893e8dda-face-427f-8e33-7d3c2b6b1211@intel.com>
Date: Fri, 15 Mar 2024 17:22:10 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/xe: Introduce a simple busted state
Content-Language: en-US
To: <intel-xe@lists.freedesktop.org>
References: <20240315010317.193756-1-rodrigo.vivi@intel.com>
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240315010317.193756-1-rodrigo.vivi@intel.com>
X-ClientProxiedBy: PN2PR01CA0160.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:26::15) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|SN7PR11MB8111:EE_
X-MS-Office365-Filtering-Correlation-Id: f8edaa64-59d1-419d-96fa-08dc44e65bae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iOOYNLHjE0Tky7CxTRC95RJoUpp39vmx66aCcOGNZo6qZ17Z9LrAX6ZubyhCr6ZRjmB3ViwGz+xmJApYYvcjnhtYTEaAZAMUDNKoTbHQb/31751/HVtFVKjwuXEL956vEnHjlCthcckFX78ot0k3D49nPTf/D9whemiV+wnksrtdZkRZYGesLNP17TxsC0DMBQtJhzQbeG2behbSFAPCkFq3moS4CRMj8Ui8r71BA3t862QzJLF7+BaUlwrWlVcVC2CYLIL9/ur0hEy6wjp2Zkio/OHXpVLMYO3S2cmLUrF+74xw/FO2JkbqB+wu+0nDMeiYXN9hLn6RymIuGf1Ik4HYMUugqdiv92mA3bxORMYcZqOjOhrX98Jmky4qBW2VHJHDDg5s953AD7QLe3cXysoTFt1a5flYXwfU3OduRpRuD5SVW6smDpG6FKqIh/OWZwmy+IuwEWjkSSes3ev8GI7Nzfp+uaS15gZsm78cSvyWipf8XZpXnYXim5cKi7h/4f8kry0GgAHHygSe3PU/DxiONwPTp5RrYvQHmhTthVzgBKAfn/d2RM6hkL8GmqcEltB2mJfb8FN0cOhg+/B1bFAe7UBgIY+bIjTfgjNPNEI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dkRqQ3N4LzFLaUxxSkt1aFkxUEtIbCtQd1QxSHVPMm1XTUNSeFJwYnRoMTBX?=
 =?utf-8?B?d3BMM29xM3J0MW1qclZVQVRndHFzZjRuRU5rUDVRSzdHeEE4YzdrcTlvNnlY?=
 =?utf-8?B?d3l2d1l4VGFyZ0NpNGFVbll1NHRENzJOdTdaSjcza2J1M0VCY215bERCYlp0?=
 =?utf-8?B?eElqR21qUEpZMlZWcDlvUTExSzZLaktFMFR2K2gzY3U1bkhRbmo1Tkg4N0l0?=
 =?utf-8?B?VlJwanFTQTY4V0h1VDRVTllmdFdjZzczUUpCNUEzNkI2N1hkejAwSFRodUFq?=
 =?utf-8?B?MVZNWm5yNzE1ZzZ6bWZQdlhkVnFkSThmYlMwcVhMVUhvTWJ5dmRTaDJiV3VP?=
 =?utf-8?B?NktRMm9kSVFLQmNPZlhwQXRtZnJOZituTk1ObmhBOWp4V2dpYndGbmMvSmRL?=
 =?utf-8?B?azFOa0RjUWxGb0I4dCs1TXZGbzZ1alNHbEtxZDhSRHRHWEhRUmpaME44WVVo?=
 =?utf-8?B?WG5TNTB4dUZBRTVJK1RRTy9KbVBwdnhxd1g4QkVIQVYwZytCY1NRNmRJMElW?=
 =?utf-8?B?U0JRRU5iSTZSdVFCdTMvWEdvRWx1M3BNNkNPOGp3YXhGL0c0dExrRlc0bnQ0?=
 =?utf-8?B?N1N6YmZMcE5qVkViVldiMGVadVpDaDNCcHhvdld0c1BhMHpRZHhZckZ2L0Nl?=
 =?utf-8?B?U01tRDNJNGFjc0FpM2QxR2prVWxrS085UlRsdWpsamZ6YzNFTHl3NXBvVllH?=
 =?utf-8?B?RWtTTy9saEpHRDBXZll4b1ZWRmRyR09jQWxQOGZZUXY2M2QxY1dwWFJmSlJt?=
 =?utf-8?B?a3hTN2Nia2kvTlkyZEhidEt2SGExNnl4ajhVci9FcDFRbmFEQzB0WnlHUHcv?=
 =?utf-8?B?U2o5RlhKbWUzeVV6RWtGeTNnODlDVnhNQ0hURkdxNzQ2REs2QU1KalRsMFY2?=
 =?utf-8?B?YTFmQ0JSY3JhOGR3RmFJa1RZVnFRcit5OHpySEVPd2cvODFHSm12SmluUytT?=
 =?utf-8?B?NEFtVkttZEdFa0Nvc2c2ZEF2SFVvODUyMjV0QUZDVjBHaHNIc2h4cERwNCs0?=
 =?utf-8?B?TnAyczBoUFhYRTgvL3lvZzFCNGEwaVVCRUswN0ViVUw3Z2FXdDRkMEFBMUJo?=
 =?utf-8?B?cFlNNlBMaGJWd0F2SnZsbHU4bXU4VDJ1SUZmV0Jtby9QaWU0YmNaRXFCYTk0?=
 =?utf-8?B?MkV6TWozbzBzeWhHc3YxZGVQT09EMVhReW9xYzl3aGRod1NvQ1NVMXdVZFd4?=
 =?utf-8?B?c3lhR0xjTDljTFJHSVFnR2IyUldkcCtzd2FNRVlZNitiWmJ0Rmt3eDBHNjZI?=
 =?utf-8?B?QTQyQ1hialFDbG9ZZFkzTUdzTUhENDlITHRoa1p4NkttS3p5V2xEekduRmNx?=
 =?utf-8?B?K0FLNHNReTVmL01QUnA3U0NRV3crc0FiSE9BcmwwYkpRaUJPbjhrUlBHYm4y?=
 =?utf-8?B?M00rWEtkV0kycEtteVVxdDM1dzN4Uk1aVncvdUJGNVFJVU1pVVlSRWxBdHZB?=
 =?utf-8?B?ekhiaktBMUp5eW4vSDVBZ3BhT0JwQXAzYjRScmppVzRtUzJVRzlDREVTZWIr?=
 =?utf-8?B?dWpDd3c1eXBHVTlNOUpkSmh2eUp0WFBnV0Q2MEFWYW9RVGFGTWFzRDl1TnhB?=
 =?utf-8?B?VHhOZXB2WUpZdHpleFYzR1EwTUpWc2ZCT2ZlWjBuMStXdXN5cU1mYUF2VGp3?=
 =?utf-8?B?VDBsYlhqdkxGZFlZUGJTTEk1aW9IZjJXTXdzdk9pRlhOSUVnb2ozaEozdnZV?=
 =?utf-8?B?YUJKbUwwbnhRQTM0MkwrNklSUEVheHVQRU4yMUZWY202UXloYVRZZzBVM0ds?=
 =?utf-8?B?Q1ltdjM1cW9NaVFNVVM4NlNCdHUxUlF0QlpFZ3FzakxpbWd3azFZZjdCN0lk?=
 =?utf-8?B?NXhSRXdrZFkxMm0wbng3VjBNNkZIRmpoUFZSRldwR1RVZHAyam9DakhhVmJn?=
 =?utf-8?B?N2xHSGhYZEVRWEgrZlFpV0tSa3JHRks2WExRMlgzWTZEL1JYOUJJc2RtbEgx?=
 =?utf-8?B?bkVJTWlZOHp5Zm9YTnBoOGQ5bUJtZXR3UnJyblUydmhaejZ3eGw1STNBb3BH?=
 =?utf-8?B?enVjVlN2QXI4R2FUV2dEWHZYUlpjZkllalRGZXI5Mnp4bFlTOWJqR25vTVAz?=
 =?utf-8?B?YUZaUmlGM0ZvRVRjbHE0cTIwOGNRWGw5ZExiSzFUbXhwbFcvSXBBUjNOYmlM?=
 =?utf-8?B?MEgzeFFEcGNFYWp6aGxEclVaT1VFbkdjdlg4L0Z1SUxzZGZLZHNOUkdmei9u?=
 =?utf-8?B?YWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f8edaa64-59d1-419d-96fa-08dc44e65bae
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2024 11:52:15.4299 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 03P+zI2zLSAqXS37lwj1dnEwv0Ogq/7oAIyZBHkd3xGqwo/iEgOi057ysf1cSkGP8wIrKNAW5/svwtiiEiujwIETQFgDX3ic/hLTokXrLyI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8111
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

--------------ukfxAYhPUxm4sfn5WjVG9Ctc
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 15-03-2024 06:33, Rodrigo Vivi wrote:
> Introduce a very simple 'busted' state where any attempt
> to access the GPU is entirely blocked.
>
> On some critical cases, like on gt_reset failure, we need to
> block any other attempt to use the GPU. Otherwise we are at
> a risk of reaching cases that would force us to reboot the machine.
>
> So, when this cases are identified we corner and block any GPU
> access. No IOCTL and not even another GT reset should be attempted.
>
> The 'busted' state in Xe is an end state with no way back.
> Only a device "re-probe" (unbind + bind) can restore the GPU access.
>
> v2: - s/wedged/busted (Lucas)
>      - use unbind+bind instead of module reload (Lucas)
>      - added more info on unbind operations and instruction on bug report
>      - only print the message once.
>
> Cc: Lucas De Marchi<lucas.demarchi@intel.com>
> Cc: Anshuman Gupta<anshuman.gupta@intel.com>
> Signed-off-by: Rodrigo Vivi<rodrigo.vivi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_device.c       |  6 ++++++
>   drivers/gpu/drm/xe/xe_device.h       | 18 ++++++++++++++++++
>   drivers/gpu/drm/xe/xe_device_types.h |  3 +++
>   drivers/gpu/drm/xe/xe_gt.c           |  4 ++++
>   drivers/gpu/drm/xe/xe_migrate.c      |  6 ++++++
>   5 files changed, 37 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index b0bfe75eb59f..d02e59fb49eb 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -142,6 +142,9 @@ static long xe_drm_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
>   	struct xe_device *xe = to_xe_device(file_priv->minor->dev);
>   	long ret;
>   
> +	if (xe_device_busted(xe))
> +		return -ECANCELED;
> +
>   	ret = xe_pm_runtime_get_ioctl(xe);
>   	if (ret >= 0)
>   		ret = drm_ioctl(file, cmd, arg);
> @@ -157,6 +160,9 @@ static long xe_drm_compat_ioctl(struct file *file, unsigned int cmd, unsigned lo
>   	struct xe_device *xe = to_xe_device(file_priv->minor->dev);
>   	long ret;
>   
> +	if (xe_device_busted(xe))
> +		return -ECANCELED;
> +
>   	ret = xe_pm_runtime_get_ioctl(xe);
>   	if (ret >= 0)
>   		ret = drm_compat_ioctl(file, cmd, arg);
> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> index 14be34d9f543..2c6d9b77821a 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -176,4 +176,22 @@ void xe_device_snapshot_print(struct xe_device *xe, struct drm_printer *p);
>   u64 xe_device_canonicalize_addr(struct xe_device *xe, u64 address);
>   u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64 address);
>   
> +static inline bool xe_device_busted(struct xe_device *xe)
> +{
> +	return atomic_read(&xe->busted);
> +}
> +
> +static inline void xe_device_declare_busted(struct xe_device *xe)
> +{
> +	if (!atomic_xchg(&xe->busted, 1))
> +		drm_err(&xe->drm,
> +			"CRITICAL: Xe has declared device %s as busted.\n"
> +			"IOCTLs and executions are blocked until device is probed again with unbind and bind operations:\n"
> +			"echo '%s' | sudo tee /sys/bus/pci/drivers/xe/unbind\n"
> +			"echo '%s' | sudo tee /sys/bus/pci/drivers/xe/bind\n"
> +			"Please file a _new_ bug report athttps://gitlab.freedesktop.org/drm/xe/kernel/issues/new\n",
> +			dev_name(xe->drm.dev), dev_name(xe->drm.dev),
> +			dev_name(xe->drm.dev));
> +}
> +
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 9785eef2e5a4..2633fdfc1a38 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -455,6 +455,9 @@ struct xe_device {
>   	/** @needs_flr_on_fini: requests function-reset on fini */
>   	bool needs_flr_on_fini;
>   
> +	/** @busted: Xe device faced a critical error and is now blocked. */
> +	atomic_t busted;
> +
>   	/* private: */
>   
>   #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 85408e7a932b..2f29f7fa682b 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -633,6 +633,9 @@ static int gt_reset(struct xe_gt *gt)
>   {
>   	int err;
>   
> +	if (xe_device_busted(gt_to_xe(gt)))
> +		return -ECANCELED;
> +
>   	/* We only support GT resets with GuC submission */
>   	if (!xe_device_uc_enabled(gt_to_xe(gt)))
>   		return -ENODEV;
> @@ -686,6 +689,7 @@ static int gt_reset(struct xe_gt *gt)
>   	xe_gt_err(gt, "reset failed (%pe)\n", ERR_PTR(err));
>   
>   	gt_to_xe(gt)->needs_flr_on_fini = true;
> +	xe_device_declare_busted(gt_to_xe(gt));
>   
>   	return err;
>   }
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index ee1bb938c493..d7eb409e8415 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -713,6 +713,9 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
>   		xe_bo_needs_ccs_pages(src_bo) && xe_bo_needs_ccs_pages(dst_bo);
>   	bool copy_system_ccs = copy_ccs && (!src_is_vram || !dst_is_vram);
>   
> +	if (xe_device_busted(xe))
> +		return ERR_PTR(-ECANCELED);
> +
>   	/* Copying CCS between two different BOs is not supported yet. */
>   	if (XE_WARN_ON(copy_ccs && src_bo != dst_bo))
>   		return ERR_PTR(-EINVAL);
> @@ -986,6 +989,9 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
>   	int err;
>   	int pass = 0;
>   
> +	if (xe_device_busted(xe))
> +		return ERR_PTR(-ECANCELED);
> +

Looks good to me.

Reviewed-by: Himal Prasad Ghimiray<himal.prasad.ghimiray@intel.com>

>   	if (!clear_vram)
>   		xe_res_first_sg(xe_bo_sg(bo), 0, bo->size, &src_it);
>   	else
--------------ukfxAYhPUxm4sfn5WjVG9Ctc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 15-03-2024 06:33, Rodrigo Vivi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20240315010317.193756-1-rodrigo.vivi@intel.com">
      <pre class="moz-quote-pre" wrap="">Introduce a very simple 'busted' state where any attempt
to access the GPU is entirely blocked.

On some critical cases, like on gt_reset failure, we need to
block any other attempt to use the GPU. Otherwise we are at
a risk of reaching cases that would force us to reboot the machine.

So, when this cases are identified we corner and block any GPU
access. No IOCTL and not even another GT reset should be attempted.

The 'busted' state in Xe is an end state with no way back.
Only a device &quot;re-probe&quot; (unbind + bind) can restore the GPU access.

v2: - s/wedged/busted (Lucas)
    - use unbind+bind instead of module reload (Lucas)
    - added more info on unbind operations and instruction on bug report
    - only print the message once.

Cc: Lucas De Marchi <a class="moz-txt-link-rfc2396E" href="mailto:lucas.demarchi@intel.com">&lt;lucas.demarchi@intel.com&gt;</a>
Cc: Anshuman Gupta <a class="moz-txt-link-rfc2396E" href="mailto:anshuman.gupta@intel.com">&lt;anshuman.gupta@intel.com&gt;</a>
Signed-off-by: Rodrigo Vivi <a class="moz-txt-link-rfc2396E" href="mailto:rodrigo.vivi@intel.com">&lt;rodrigo.vivi@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_device.c       |  6 ++++++
 drivers/gpu/drm/xe/xe_device.h       | 18 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_device_types.h |  3 +++
 drivers/gpu/drm/xe/xe_gt.c           |  4 ++++
 drivers/gpu/drm/xe/xe_migrate.c      |  6 ++++++
 5 files changed, 37 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index b0bfe75eb59f..d02e59fb49eb 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -142,6 +142,9 @@ static long xe_drm_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 	struct xe_device *xe = to_xe_device(file_priv-&gt;minor-&gt;dev);
 	long ret;
 
+	if (xe_device_busted(xe))
+		return -ECANCELED;
+
 	ret = xe_pm_runtime_get_ioctl(xe);
 	if (ret &gt;= 0)
 		ret = drm_ioctl(file, cmd, arg);
@@ -157,6 +160,9 @@ static long xe_drm_compat_ioctl(struct file *file, unsigned int cmd, unsigned lo
 	struct xe_device *xe = to_xe_device(file_priv-&gt;minor-&gt;dev);
 	long ret;
 
+	if (xe_device_busted(xe))
+		return -ECANCELED;
+
 	ret = xe_pm_runtime_get_ioctl(xe);
 	if (ret &gt;= 0)
 		ret = drm_compat_ioctl(file, cmd, arg);
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 14be34d9f543..2c6d9b77821a 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -176,4 +176,22 @@ void xe_device_snapshot_print(struct xe_device *xe, struct drm_printer *p);
 u64 xe_device_canonicalize_addr(struct xe_device *xe, u64 address);
 u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64 address);
 
+static inline bool xe_device_busted(struct xe_device *xe)
+{
+	return atomic_read(&amp;xe-&gt;busted);
+}
+
+static inline void xe_device_declare_busted(struct xe_device *xe)
+{
+	if (!atomic_xchg(&amp;xe-&gt;busted, 1))
+		drm_err(&amp;xe-&gt;drm,
+			&quot;CRITICAL: Xe has declared device %s as busted.\n&quot;
+			&quot;IOCTLs and executions are blocked until device is probed again with unbind and bind operations:\n&quot;
+			&quot;echo '%s' | sudo tee /sys/bus/pci/drivers/xe/unbind\n&quot;
+			&quot;echo '%s' | sudo tee /sys/bus/pci/drivers/xe/bind\n&quot;
+			&quot;Please file a _new_ bug report at <a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/new\n">https://gitlab.freedesktop.org/drm/xe/kernel/issues/new\n</a>&quot;,
+			dev_name(xe-&gt;drm.dev), dev_name(xe-&gt;drm.dev),
+			dev_name(xe-&gt;drm.dev));
+}
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 9785eef2e5a4..2633fdfc1a38 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -455,6 +455,9 @@ struct xe_device {
 	/** @needs_flr_on_fini: requests function-reset on fini */
 	bool needs_flr_on_fini;
 
+	/** @busted: Xe device faced a critical error and is now blocked. */
+	atomic_t busted;
+
 	/* private: */
 
 #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 85408e7a932b..2f29f7fa682b 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -633,6 +633,9 @@ static int gt_reset(struct xe_gt *gt)
 {
 	int err;
 
+	if (xe_device_busted(gt_to_xe(gt)))
+		return -ECANCELED;
+
 	/* We only support GT resets with GuC submission */
 	if (!xe_device_uc_enabled(gt_to_xe(gt)))
 		return -ENODEV;
@@ -686,6 +689,7 @@ static int gt_reset(struct xe_gt *gt)
 	xe_gt_err(gt, &quot;reset failed (%pe)\n&quot;, ERR_PTR(err));
 
 	gt_to_xe(gt)-&gt;needs_flr_on_fini = true;
+	xe_device_declare_busted(gt_to_xe(gt));
 
 	return err;
 }
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index ee1bb938c493..d7eb409e8415 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -713,6 +713,9 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 		xe_bo_needs_ccs_pages(src_bo) &amp;&amp; xe_bo_needs_ccs_pages(dst_bo);
 	bool copy_system_ccs = copy_ccs &amp;&amp; (!src_is_vram || !dst_is_vram);
 
+	if (xe_device_busted(xe))
+		return ERR_PTR(-ECANCELED);
+
 	/* Copying CCS between two different BOs is not supported yet. */
 	if (XE_WARN_ON(copy_ccs &amp;&amp; src_bo != dst_bo))
 		return ERR_PTR(-EINVAL);
@@ -986,6 +989,9 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 	int err;
 	int pass = 0;
 
+	if (xe_device_busted(xe))
+		return ERR_PTR(-ECANCELED);
+</pre>
    </blockquote>
    <p>Looks good to me. <br>
    </p>
    <p><!--[if gte mso 9]><xml>
 <o:OfficeDocumentSettings>
  <o:AllowPNG/>
 </o:OfficeDocumentSettings>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <w:WordDocument>
  <w:View>Normal</w:View>
  <w:Zoom>0</w:Zoom>
  <w:TrackMoves/>
  <w:TrackFormatting/>
  <w:PunctuationKerning/>
  <w:ValidateAgainstSchemas/>
  <w:SaveIfXMLInvalid>false</w:SaveIfXMLInvalid>
  <w:IgnoreMixedContent>false</w:IgnoreMixedContent>
  <w:AlwaysShowPlaceholderText>false</w:AlwaysShowPlaceholderText>
  <w:DoNotPromoteQF/>
  <w:LidThemeOther>EN-US</w:LidThemeOther>
  <w:LidThemeAsian>X-NONE</w:LidThemeAsian>
  <w:LidThemeComplexScript>X-NONE</w:LidThemeComplexScript>
  <w:Compatibility>
   <w:BreakWrappedTables/>
   <w:SnapToGridInCell/>
   <w:WrapTextWithPunct/>
   <w:UseAsianBreakRules/>
   <w:DontGrowAutofit/>
   <w:SplitPgBreakAndParaMark/>
   <w:EnableOpenTypeKerning/>
   <w:DontFlipMirrorIndents/>
   <w:OverrideTableStyleHps/>
  </w:Compatibility>
  <m:mathPr>
   <m:mathFont m:val="Cambria Math"/>
   <m:brkBin m:val="before"/>
   <m:brkBinSub m:val="&#45;-"/>
   <m:smallFrac m:val="off"/>
   <m:dispDef/>
   <m:lMargin m:val="0"/>
   <m:rMargin m:val="0"/>
   <m:defJc m:val="centerGroup"/>
   <m:wrapIndent m:val="1440"/>
   <m:intLim m:val="subSup"/>
   <m:naryLim m:val="undOvr"/>
  </m:mathPr></w:WordDocument>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <w:LatentStyles DefLockedState="false" DefUnhideWhenUsed="false"
  DefSemiHidden="false" DefQFormat="false" DefPriority="99"
  LatentStyleCount="376">
  <w:LsdException Locked="false" Priority="0" QFormat="true" Name="Normal"/>
  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 1"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 2"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 3"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 4"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 5"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 6"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 7"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 8"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 9"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 6"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 7"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 8"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 9"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 1"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 2"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 3"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 4"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 5"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 6"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 7"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 8"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 9"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Normal Indent"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="footnote text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="annotation text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="header"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="footer"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index heading"/>
  <w:LsdException Locked="false" Priority="35" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="caption"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="table of figures"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="envelope address"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="envelope return"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="footnote reference"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="annotation reference"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="line number"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="page number"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="endnote reference"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="endnote text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="table of authorities"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="macro"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="toa heading"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number 5"/>
  <w:LsdException Locked="false" Priority="10" QFormat="true" Name="Title"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Closing"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Signature"/>
  <w:LsdException Locked="false" Priority="1" SemiHidden="true"
   UnhideWhenUsed="true" Name="Default Paragraph Font"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text Indent"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Message Header"/>
  <w:LsdException Locked="false" Priority="11" QFormat="true" Name="Subtitle"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Salutation"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Date"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text First Indent"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text First Indent 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Note Heading"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text Indent 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text Indent 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Block Text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Hyperlink"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="FollowedHyperlink"/>
  <w:LsdException Locked="false" Priority="22" QFormat="true" Name="Strong"/>
  <w:LsdException Locked="false" Priority="20" QFormat="true" Name="Emphasis"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Document Map"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Plain Text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="E-mail Signature"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Top of Form"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Bottom of Form"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Normal (Web)"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Acronym"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Address"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Cite"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Code"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Definition"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Keyboard"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Preformatted"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Sample"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Typewriter"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Variable"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Normal Table"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="annotation subject"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="No List"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Outline List 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Outline List 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Outline List 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Simple 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Simple 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Simple 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Classic 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Classic 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Classic 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Classic 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Colorful 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Colorful 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Colorful 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 6"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 7"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 8"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 6"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 7"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 8"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table 3D effects 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table 3D effects 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table 3D effects 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Contemporary"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Elegant"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Professional"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Subtle 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Subtle 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Web 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Web 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Web 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Balloon Text"/>
  <w:LsdException Locked="false" Priority="39" Name="Table Grid"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Theme"/>
  <w:LsdException Locked="false" SemiHidden="true" Name="Placeholder Text"/>
  <w:LsdException Locked="false" Priority="1" QFormat="true" Name="No Spacing"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 1"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 1"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 1"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 1"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 1"/>
  <w:LsdException Locked="false" SemiHidden="true" Name="Revision"/>
  <w:LsdException Locked="false" Priority="34" QFormat="true"
   Name="List Paragraph"/>
  <w:LsdException Locked="false" Priority="29" QFormat="true" Name="Quote"/>
  <w:LsdException Locked="false" Priority="30" QFormat="true"
   Name="Intense Quote"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 1"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 1"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 1"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 1"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 1"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 1"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 2"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 2"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 2"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 2"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 2"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 2"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 2"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 2"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 2"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 2"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 2"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 3"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 3"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 3"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 3"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 3"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 3"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 3"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 3"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 3"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 3"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 3"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 4"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 4"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 4"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 4"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 4"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 4"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 4"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 4"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 4"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 4"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 4"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 5"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 5"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 5"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 5"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 5"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 5"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 5"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 5"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 5"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 5"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 5"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 6"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 6"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 6"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 6"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 6"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 6"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 6"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 6"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 6"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 6"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 6"/>
  <w:LsdException Locked="false" Priority="19" QFormat="true"
   Name="Subtle Emphasis"/>
  <w:LsdException Locked="false" Priority="21" QFormat="true"
   Name="Intense Emphasis"/>
  <w:LsdException Locked="false" Priority="31" QFormat="true"
   Name="Subtle Reference"/>
  <w:LsdException Locked="false" Priority="32" QFormat="true"
   Name="Intense Reference"/>
  <w:LsdException Locked="false" Priority="33" QFormat="true" Name="Book Title"/>
  <w:LsdException Locked="false" Priority="37" SemiHidden="true"
   UnhideWhenUsed="true" Name="Bibliography"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="TOC Heading"/>
  <w:LsdException Locked="false" Priority="41" Name="Plain Table 1"/>
  <w:LsdException Locked="false" Priority="42" Name="Plain Table 2"/>
  <w:LsdException Locked="false" Priority="43" Name="Plain Table 3"/>
  <w:LsdException Locked="false" Priority="44" Name="Plain Table 4"/>
  <w:LsdException Locked="false" Priority="45" Name="Plain Table 5"/>
  <w:LsdException Locked="false" Priority="40" Name="Grid Table Light"/>
  <w:LsdException Locked="false" Priority="46" Name="Grid Table 1 Light"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark"/>
  <w:LsdException Locked="false" Priority="51" Name="Grid Table 6 Colorful"/>
  <w:LsdException Locked="false" Priority="52" Name="Grid Table 7 Colorful"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 1"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 1"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 1"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 1"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 1"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 1"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 2"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 2"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 2"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 2"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 2"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 2"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 3"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 3"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 3"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 3"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 3"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 3"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 4"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 4"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 4"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 4"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 4"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 4"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 5"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 5"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 5"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 5"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 5"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 5"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 6"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 6"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 6"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 6"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 6"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 6"/>
  <w:LsdException Locked="false" Priority="46" Name="List Table 1 Light"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark"/>
  <w:LsdException Locked="false" Priority="51" Name="List Table 6 Colorful"/>
  <w:LsdException Locked="false" Priority="52" Name="List Table 7 Colorful"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 1"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 1"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 1"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 1"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 1"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 1"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 2"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 2"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 2"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 2"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 2"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 2"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 3"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 3"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 3"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 3"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 3"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 3"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 4"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 4"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 4"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 4"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 4"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 4"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 5"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 5"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 5"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 5"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 5"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 5"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 6"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 6"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 6"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 6"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 6"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 6"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Mention"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Smart Hyperlink"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Hashtag"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Unresolved Mention"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Smart Link"/>
 </w:LatentStyles>
</xml><![endif]--><!--[if gte mso 10]>
<style>
 /* Style Definitions */
 table.MsoNormalTable
	{mso-style-name:"Table Normal";
	mso-tstyle-rowband-size:0;
	mso-tstyle-colband-size:0;
	mso-style-noshow:yes;
	mso-style-priority:99;
	mso-style-parent:"";
	mso-padding-alt:0cm 5.4pt 0cm 5.4pt;
	mso-para-margin:0cm;
	mso-pagination:widow-orphan;
	font-size:10.0pt;
	font-family:"Times New Roman",serif;}
</style>
<![endif]-->
    </p>
    <p class="MsoPlainText">Reviewed-by: Himal Prasad Ghimiray&lt;<a href="mailto:himal.prasad.ghimiray@intel.com" class="moz-txt-link-freetext">himal.prasad.ghimiray@intel.com</a>&gt;</p>
    <blockquote type="cite" cite="mid:20240315010317.193756-1-rodrigo.vivi@intel.com">
      <pre class="moz-quote-pre" wrap="">
 	if (!clear_vram)
 		xe_res_first_sg(xe_bo_sg(bo), 0, bo-&gt;size, &amp;src_it);
 	else
</pre>
    </blockquote>
  </body>
</html>

--------------ukfxAYhPUxm4sfn5WjVG9Ctc--

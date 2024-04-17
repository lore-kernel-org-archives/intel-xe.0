Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40468C4345F
	for <intel-xe@archiver.kernel.org>; Wed, 17 Apr 2024 05:17:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D92E5113161;
	Wed, 17 Apr 2024 05:17:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SzGNf5Ua";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9312113158
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Apr 2024 05:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713331035; x=1744867035;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=Pwktedk1CFg+pqai6ZuilrCdMprR9WNi8r2sxSd/InE=;
 b=SzGNf5UapVVBw4eN2ZEdIsQRE07mmk6Njj2lxkMqulmndETfoxeQAofu
 yVaMuF/9xuyBPgdbzv/bD8CYDLxU61pau67J7ctHkzuw0Zhmc0rVRGY3o
 hLvLSTX+vgPQBuoIcV34C9F9KHFJvUr7S0s1yzYQ5v3zJu/dsg6BPQTJt
 4I9C5GXr6DrFis6I3Rpfnrz62SmNf2EjCmzSTq2STlFWo4/JAsDe0+qNp
 YdD1RWpPcPrlWU5Hc0C/kl0t39tbIeVkndwQeC3AKhDA7FGf1HlZ9VAiv
 IfCv896yuisNu45+9IYbc4Su6srjgtXk3RIepWWuMIxVt38icpm+aeZRN w==;
X-CSE-ConnectionGUID: E7L1FAKBQzO1wfTQRvx/cg==
X-CSE-MsgGUID: 3LfGy1csQkyLxfbUxa6xuQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="31286443"
X-IronPort-AV: E=Sophos;i="6.07,208,1708416000"; d="scan'208,217";a="31286443"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 22:17:15 -0700
X-CSE-ConnectionGUID: jmKjP2QkTlu88iDY/xrU1Q==
X-CSE-MsgGUID: S398beU8TjqkOdK/SMR6Gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,208,1708416000"; d="scan'208,217";a="22570452"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Apr 2024 22:17:13 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Apr 2024 22:17:12 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Apr 2024 22:17:12 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 16 Apr 2024 22:17:12 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 16 Apr 2024 22:17:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XMaVZ4Xkyeozy83I8mbhIxAQwknkozZZeQVcCtdAMkZchhXK4j9d+m52S0HBNQPFLLyEGMlSXWDcX3+EyjTObsaO+TYTJlN97eT7l1GxPA7n0LjT6vjUbH1QWAXJ0rkoby18qISqAXaF2IjNTuVLxDQ6ANJdfNMXHC+NKauumpKnTglJEEL+4Mdq2MHCy2756nB5MrSwL+N9rmMn32lh22QzR7LP5ADB9BA5M2YQvu98PEH0szYcg8cFU3LvQbQKfuv266OBxP7iVpucHz+73v3Pz74Bq7E9bde5ALo5/hEENKt8RqYyhAM+kvLVMTEA53J6wlzdx2QEu2DFe3KNCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nwYjA9Udeze21pxhIGzZ4jKFdKutk3M/ANat+nhQIxE=;
 b=jWXEoAVrzjOVakrm6WWETtqmbY7Lx+hYGBEfeDwMDybeb7yKaTEYaCJ/QFiAdZr/beXukayKEW5Fvd6x9ed/xCZhIyPnefm65dEauu0T7i7M0t/DjhqYbQ9eX6RFMDaSG2UhR0cpCaF4IIHSHnd8yOYNLP5SK+9VvwparHyV/HRugJ+gt1h8n8NC56EETslJX0B+Q+yvXigowxIKkTuybWBlrm/UYdloB+6HrZAw2kFX+c4Tu+9066vc3FEJ2TortMS+vsnm6KyMdFoQtfcGr3gNcIZox0//rGKOydYuSpY8CqPGaD8cYeCisuSGP/bmHlyqiT05kAuJ/mQf4mQzVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB7038.namprd11.prod.outlook.com (2603:10b6:806:2b3::22)
 by LV2PR11MB5973.namprd11.prod.outlook.com (2603:10b6:408:14e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.37; Wed, 17 Apr
 2024 05:17:10 +0000
Received: from SA1PR11MB7038.namprd11.prod.outlook.com
 ([fe80::84a5:bd1:d7a:722]) by SA1PR11MB7038.namprd11.prod.outlook.com
 ([fe80::84a5:bd1:d7a:722%5]) with mapi id 15.20.7472.025; Wed, 17 Apr 2024
 05:17:10 +0000
Content-Type: multipart/alternative;
 boundary="------------wFS9aQLVKjZfIJUT3Qk0GVhs"
Message-ID: <99b9919f-4270-40f4-83d0-bbfc7badd0ae@intel.com>
Date: Wed, 17 Apr 2024 10:47:03 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/xe2: Add workaround 14021402888
To: <intel-xe@lists.freedesktop.org>
References: <20240417021840.456641-1-krishnaiah.bommu@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240417021840.456641-1-krishnaiah.bommu@intel.com>
X-ClientProxiedBy: PN2PR01CA0184.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e8::8) To SA1PR11MB7038.namprd11.prod.outlook.com
 (2603:10b6:806:2b3::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB7038:EE_|LV2PR11MB5973:EE_
X-MS-Office365-Filtering-Correlation-Id: eadccd39-8ee2-437c-37b5-08dc5e9da1ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iAqHOCwgw3ACfgT2+AAuST6KH6DV0WA/KSPwSBJSjWPYnhky0pOKI8uExq9vAcjizbmPK7PPt04zZxH5oMxxvpZb3M2wvdUBM1ZHHwHDNmPED/fZQO5icTQS3tSi/sFJ0eG5/llN+mCL0ljJaqC6dUUEIijogeGL2yRWaLyFp+VSM6myxVRJhlok0kxT/tefRQRjvwR7KfYNrVv0fGSMUcio6BNPFIdj1oKHV36oD8IuwZQPQcL8EjNDF96Rj4x32T0VnH0GO+BKY0v64NkO1a2nbOB8lcbR943yDsY5MhVO7lG86t61zkmWjq0Wb/K2a4i5rQfoS2Lut7tlraaktcLJTlQRrVdJzKBH/lUolXs39KxO7SgjpxrEInTDeT2vAVJ9yz9wYWJR/w+VHSrXb2m6jfneIbVI4HfY+tsFKviZMCkLtRLkBnlI97i0ZhCYcelo0/eXkatfLGyQ2dAHnwhGOo/7LXo1O1RPYuSEB5CA4w1G5VliVxcBVfRQ+ffZtKmjdN1I+L7vHIH+v9kgH0sUVLMCnJJOBmtF0J57KyXbCvTcoyvQcpgGZPf8A42G0n55XrtmQ4DgcPx2nhvYjS88eLJP8kgZqPJWc8nVu1/GeD+TdEf/d682jB9p8FoDpWGP9QkvZbC2WMnRROK5iuklBpPNAYS0TXos9nJFdyo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB7038.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q3dHc0QvNURGNEdzSllZMjhuTTdhTHo0N0JWdStEK2lnZFMwcDlpc2RnY2Yx?=
 =?utf-8?B?Yy9uQTEzQ3VCeFcxUWwyRnBoQlRXQXpDbXJGQm9JWlhqeWhHdlRRMGtPdlRl?=
 =?utf-8?B?cTJrMDA1cGYyZjBaTGxxVGVPRmZJOHRkR0E0dXNqS3RvRHA2UWdmYUltbzRE?=
 =?utf-8?B?MmQzMnI1Y0g2MXI4UmNGU2owL0FBKzhXYzdlTUQzNEZicGlWT2NzUElqNE5E?=
 =?utf-8?B?Nmx4b2hCUVIwWEhFb1ZaNjM1ZWliQ0RsL003Ri9aTlVOZHYvc21hcHRPMzRi?=
 =?utf-8?B?VkVYVlpRYVpiWjZCVHBWVFppV29DbmdpRjJvMXBRc2hLb09lcFdtQllhSmtX?=
 =?utf-8?B?MDduV0ZmN3lRNm8yY0JLSHY0Mk9CYUFaanJvOFBEQ2x3SVl0aFdrMTkvdzdi?=
 =?utf-8?B?WFJyWW4wUE0vbHI4YmRUaWV6bTgyWkIyMWxvRGNVcGc5Ynl2clhrbFdBWFRG?=
 =?utf-8?B?OCtaM3R6MzllejdmNG9FeDJuTnZzNytnSWZBeXJEMCtrdDJMMzRTczRnRFZG?=
 =?utf-8?B?VWxwbWZKL2ZtQkhDTjNUK0FJdEZ1OHZ4d0Q1NGhOdkxKRVFaMzlvbU4rTm1S?=
 =?utf-8?B?YTRTbTJ1RkxYNlFBZWNMRnVBUU9oS0JaK3o5UExBYWczb2Y3R0NlQm5OSG5W?=
 =?utf-8?B?Y01qcGEybStEWjZScTQ3VHhVNk92UXRCVXE0ZHI2MVB1UEc1NXBrQ2ZiNmtI?=
 =?utf-8?B?dTdrejQvcm90ajRuKytvVU9PeGNBTnVSWGp6U2xiVUFWZVJHNUV0ODFxcVRT?=
 =?utf-8?B?VVYxUm94TTFQQ0NFM2txTmVseVhrMmZ2YWxHNlBRcHhHTStQMEpJU1ZTSG9F?=
 =?utf-8?B?akNOakljeUJNT1B6WkZ6Qml0TFpmamo1VlNsek9iZ09aTjlCWFFYMVhIOTZL?=
 =?utf-8?B?dkpINmJSZk9iL084ZnRYLzNQckdQYitBVUN0TGtFTE9LSWEzUjNveXFkUDcz?=
 =?utf-8?B?RGFtS21LSndLMW1CaHFtL0NrWWxSbnVqSVNWcS91YnlWT3R5a2d5VGJIek1Z?=
 =?utf-8?B?Z1VTOWRyZWRvUUlsN2Y4QkJwZ0xGemJkWkJ6U3ZrVkpPL05abWdNbXZaNVQ4?=
 =?utf-8?B?bFpwTEpSdkFQRXRDOVhMTmlBNlZodCtESzhLb0o1VGRIN3FRalYxaHdseDF5?=
 =?utf-8?B?VGg5VkJNWkhZMUhXaG1CdlJPdG9hMnZ6R3hQZ29qMnlCempNamRnUEFXcEJx?=
 =?utf-8?B?VlZqTUVOZEZvUG1ITndWWUNBdllUV3Z1K2x1T1M1Y3l6b1FyVm9RV2NWOGl0?=
 =?utf-8?B?eVFhOSt1UGJTWFNzem0va21KWEhTMkp5YmhUTkFab3NBQW5TeUxCSUFOSnBN?=
 =?utf-8?B?ZUZxVFpJZE4zWHVTSHplN2NiY0MvV3p0ZlVrYUpDZ3R6Q3RPMWUrRlZrZVo5?=
 =?utf-8?B?RTIyL2ltajcrZEg0ekJ3a2pzcUhWank3dkppeXRCajRVOFEwbUN5Smg5cWtO?=
 =?utf-8?B?UERqcC9td1lGeWJRS3VhcXVmdDcxbGZqdmt1a054TEhCRGpWcW1ZRlNhdEpR?=
 =?utf-8?B?UWtVOGZ6cGpMVkxFT0RMZUFPMXdCVjBab0o3UjgzVUF5bXhXbTBReTFTRUky?=
 =?utf-8?B?WXdKbnJQRmt0K2F1NWJPUkZNT2RrYlBSSXZnMWVYandrdzZqVjN6cWRaVmhs?=
 =?utf-8?B?bytPdnNBYWkxbENJYklnQVZBdEswMzJScDFJQ3pYdTMyTE5HMkhETFZPTkU3?=
 =?utf-8?B?dWdTN3BVb3ZSeVJQZTkxclB4V0ZreUU3VnN6eGx3azk4Mmw2YWlLYVpsWUJH?=
 =?utf-8?B?enJHY0lGYm4vOWlQNHY3TUN0S1pSWUpoSDdDVm9HTnZiS2lvYmE2LzJJMXRy?=
 =?utf-8?B?RnBlaHdKWm9VRnNZNFpxRS9MVEVabjQ3RURkcXVtUlJxNG8yVTYxU1ZtYVBK?=
 =?utf-8?B?S2U1dmJLZjhMRnhWVU9qOVE1TkRjb2t1WlRpclpQbUpkT29GbFMrU1N6WDVw?=
 =?utf-8?B?V2ZCYjFDaHMxMnFOTUhUT2hDNnF4K2ppSUdtRndveTBKdGIyOUZ0SUdPelVJ?=
 =?utf-8?B?eVZsdDFHRjNVb2lSaCtSQmVPd3lhV0tMeENSNDFRcXNmNVI3a1JjcEVDYXMw?=
 =?utf-8?B?RmtDd2xsVm5pTXlvdkJoM1EvM1NyOVpLVVplbkx3c2Joeko5UVJ3YTRpcWM0?=
 =?utf-8?B?T2JxTnM1RHdDNHZFOUtwcFUzdGJrdUtEN0ErYkFkTkVIQm5IZEFsSEhSMVNw?=
 =?utf-8?Q?8hw8y5iVOSWS9AcCxYNcrG0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: eadccd39-8ee2-437c-37b5-08dc5e9da1ba
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB7038.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2024 05:17:09.9502 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ka+SlzxU8dEBUR7LVw7omUx7T2aVKwPpjsi169QlpNdnKqbPcYkw5ebEwYXiUPpNJgBI5Jh232WtHY6J6zNM+543RHDgVvXOq3wdCazrLZs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB5973
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

--------------wFS9aQLVKjZfIJUT3Qk0GVhs
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 17-04-2024 07:48, Bommu Krishnaiah wrote:
> Sampler Cache Returning Incorrect Data Due to Mismatched Tagging of
> Associated Partial Cache Lines and disabling sampler clear power
> optimization gives better overall performance.

Inconsistent capitalization in commit message.

>
> Signed-off-by: Bommu Krishnaiah<krishnaiah.bommu@intel.com>
> Cc: Tejas Upadhyay<tejas.upadhyay@intel.com>
> Cc: Matt Roper<matthew.d.roper@intel.com>
> ---
>   drivers/gpu/drm/xe/regs/xe_gt_regs.h | 2 ++
>   drivers/gpu/drm/xe/xe_wa.c           | 8 ++++++++
>   2 files changed, 10 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 94445810ccc9..d4ec82189ca2 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -344,12 +344,14 @@
>   
>   #define SAMPLER_MODE				XE_REG_MCR(0xe18c, XE_REG_OPTION_MASKED)
>   #define   ENABLE_SMALLPL			REG_BIT(15)
> +#define   SMP_FORCE_128B_OVERFETCH		REG_BIT(10)
>   #define   SC_DISABLE_POWER_OPTIMIZATION_EBB	REG_BIT(9)
>   #define   SAMPLER_ENABLE_HEADLESS_MSG		REG_BIT(5)
>   #define   INDIRECT_STATE_BASE_ADDR_OVERRIDE	REG_BIT(0)
>   
>   #define HALF_SLICE_CHICKEN7				XE_REG_MCR(0xe194, XE_REG_OPTION_MASKED)
>   #define   DG2_DISABLE_ROUND_ENABLE_ALLOW_FOR_SSLA	REG_BIT(15)
> +#define   CLEAR_OPTIMIZATION_DISABLE			REG_BIT(6)
>   
>   #define CACHE_MODE_SS				XE_REG_MCR(0xe420, XE_REG_OPTION_MASKED)
>   #define   DISABLE_ECC				REG_BIT(5)
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 632bd9066f8d..91c9834c3e21 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -534,6 +534,14 @@ static const struct xe_rtp_entry_sr engine_was[] = {
>   		       FUNC(xe_rtp_match_first_render_or_compute)),
>   	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0, WR_REQ_CHAINING_DIS))
>   	},
> +	{ XE_RTP_NAME("14021402888"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION(2001), ENGINE_CLASS(RENDER)),
> +	  XE_RTP_ACTIONS(SET(SAMPLER_MODE, SMP_FORCE_128B_OVERFETCH))
This is not required.   Below implementation (Setting 
CLEAR_OPTIMIZATION_DISABLE REG_BIT(6) of HALF_SLICE_CHICKEN7) should be 
enough.
> +	},
> +	{ XE_RTP_NAME("14021402888"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION(2001), ENGINE_CLASS(RENDER)),
> +	  XE_RTP_ACTIONS(SET(HALF_SLICE_CHICKEN7, CLEAR_OPTIMIZATION_DISABLE))
> +	},
>   
>   	/* Xe2_HPM */
>   
--------------wFS9aQLVKjZfIJUT3Qk0GVhs
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 17-04-2024 07:48, Bommu Krishnaiah
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20240417021840.456641-1-krishnaiah.bommu@intel.com">
      <pre class="moz-quote-pre" wrap="">Sampler Cache Returning Incorrect Data Due to Mismatched Tagging of
Associated Partial Cache Lines and disabling sampler clear power
optimization gives better overall performance.</pre>
    </blockquote>
    <br>
    <p><span style="color: rgb(13, 13, 13); font-family: Söhne, ui-sans-serif, system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, Ubuntu, Cantarell, &quot;Noto Sans&quot;, sans-serif, &quot;Helvetica Neue&quot;, Arial, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">Inconsistent capitalization in commit message.
</span></p>
    <blockquote type="cite" cite="mid:20240417021840.456641-1-krishnaiah.bommu@intel.com">
      <pre class="moz-quote-pre" wrap="">

Signed-off-by: Bommu Krishnaiah <a class="moz-txt-link-rfc2396E" href="mailto:krishnaiah.bommu@intel.com">&lt;krishnaiah.bommu@intel.com&gt;</a>
Cc: Tejas Upadhyay <a class="moz-txt-link-rfc2396E" href="mailto:tejas.upadhyay@intel.com">&lt;tejas.upadhyay@intel.com&gt;</a>
Cc: Matt Roper <a class="moz-txt-link-rfc2396E" href="mailto:matthew.d.roper@intel.com">&lt;matthew.d.roper@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 2 ++
 drivers/gpu/drm/xe/xe_wa.c           | 8 ++++++++
 2 files changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 94445810ccc9..d4ec82189ca2 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -344,12 +344,14 @@
 
 #define SAMPLER_MODE				XE_REG_MCR(0xe18c, XE_REG_OPTION_MASKED)
 #define   ENABLE_SMALLPL			REG_BIT(15)
+#define   SMP_FORCE_128B_OVERFETCH		REG_BIT(10)
 #define   SC_DISABLE_POWER_OPTIMIZATION_EBB	REG_BIT(9)
 #define   SAMPLER_ENABLE_HEADLESS_MSG		REG_BIT(5)
 #define   INDIRECT_STATE_BASE_ADDR_OVERRIDE	REG_BIT(0)
 
 #define HALF_SLICE_CHICKEN7				XE_REG_MCR(0xe194, XE_REG_OPTION_MASKED)
 #define   DG2_DISABLE_ROUND_ENABLE_ALLOW_FOR_SSLA	REG_BIT(15)
+#define   CLEAR_OPTIMIZATION_DISABLE			REG_BIT(6)
 
 #define CACHE_MODE_SS				XE_REG_MCR(0xe420, XE_REG_OPTION_MASKED)
 #define   DISABLE_ECC				REG_BIT(5)
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 632bd9066f8d..91c9834c3e21 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -534,6 +534,14 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 		       FUNC(xe_rtp_match_first_render_or_compute)),
 	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0, WR_REQ_CHAINING_DIS))
 	},
+	{ XE_RTP_NAME(&quot;14021402888&quot;),
+	  XE_RTP_RULES(GRAPHICS_VERSION(2001), ENGINE_CLASS(RENDER)),
+	  XE_RTP_ACTIONS(SET(SAMPLER_MODE, SMP_FORCE_128B_OVERFETCH))</pre>
    </blockquote>
    This is not required.&nbsp;&nbsp; Below implementation (Setting <span style="white-space: pre-wrap">CLEAR_OPTIMIZATION_DISABLE REG_BIT(6) of  </span><span style="white-space: pre-wrap">HALF_SLICE_CHICKEN7) should be enough. </span>
    <blockquote type="cite" cite="mid:20240417021840.456641-1-krishnaiah.bommu@intel.com">
      <pre class="moz-quote-pre" wrap="">
+	},
+	{ XE_RTP_NAME(&quot;14021402888&quot;),
+	  XE_RTP_RULES(GRAPHICS_VERSION(2001), ENGINE_CLASS(RENDER)),
+	  XE_RTP_ACTIONS(SET(HALF_SLICE_CHICKEN7, CLEAR_OPTIMIZATION_DISABLE))
+	},
 
 	/* Xe2_HPM */
 
</pre>
    </blockquote>
  </body>
</html>

--------------wFS9aQLVKjZfIJUT3Qk0GVhs--

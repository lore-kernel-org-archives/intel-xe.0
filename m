Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E2A8C54E5D
	for <intel-xe@archiver.kernel.org>; Mon, 18 Mar 2024 22:06:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F10BD10E993;
	Mon, 18 Mar 2024 22:06:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BImPnLvL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CA4010E993
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Mar 2024 22:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710799581; x=1742335581;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=iNFx3LTMb/DmHG4H/rlDAzNcVPUyFfMJpZuh0LYJMho=;
 b=BImPnLvLl7Cs0vysaIYMuX+BmW5tTO3++PUPnZUhpAVQWUfjgaAKIwLS
 cGQw62WdiRskklL7E1M+yQqyvy0Zkkv0GSUKMI1YGol8Gz3RUsX//41L3
 t1Ch962bAYJ7UaraR5qCVQK/IWMTZx1SMcwnTY6OQ0SFd+VNOgnDLqP2+
 l/6cGRlJNA4VKW/W+E6Q2utzB2bKym3qLcYrlFL/UkCxCsZktMjMeub4p
 F5RfNqSstkAlOdDMcqdc3uNZs/Rt2ETofctNoWVXTkSQM6zkfjrBSSOON
 /CGs27sgw6UMkCYHuRQSmYO8gbfwKgp01n/GP2ZexoDnMh5MsEoq++s7e g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="8584289"
X-IronPort-AV: E=Sophos;i="6.07,135,1708416000"; 
   d="scan'208";a="8584289"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 15:06:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,135,1708416000"; d="scan'208";a="13983848"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Mar 2024 15:06:20 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 18 Mar 2024 15:06:19 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 18 Mar 2024 15:06:19 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 18 Mar 2024 15:06:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h2y26LhPeoJ8HuaGD/euTHda6IPv9A8JaVmQ/iRVqCj/RMKfj0VLBMRepFbvkmU4R6xR/ze65B3GOm5JWMdE07Cn+yiLt3s6GnvxHikE8ZXh/IA6d1FrUuR5icW83OKTxqh/J2Pmg0Saigx8T5J/IDVgBcCo/mZRi8hW/xd3C6915PGcZN2dNGjhy5p8jXVlItx3PYDUBxuzuaUQX2BLSqjWz/3CyHoyRn7vk+YcQzdTC5tcG003kg3a+AGTrC4is035GZiPMzGp9OJ4gv8Yjv7SrQKcgFrV0nIf/nHFLxAlZXdyPX7vf3dBhn/hw/HvwQcWcwAguMx1VzyGxsoAGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WAHWVLr2FrVc+PQweg/zTo4McZEIMlPTM0rT0qqEfCg=;
 b=DbCafEH2IdtR3KWHaInOnCFoMQr5ATZg2Hcv1msYbQhtcnPXOGmZthQpZPhK7/JFCfDFo90a9ep1Kqlo5C+MoZwEuJIvoi1EMO8Ea168wGnZL7Uf40vUBP6/r8tuY7JTg/KGAgrXJdAWCyDUMBv/9dhNttXZYac9vDgyhl7eQFA2eJjDk1Ig+JgVkknyCC7JjCCKEKraxl+VCoUrz33N+6cu3K1Ikx1tmtx7NWVwOOq8hjQ0Dc/gBtMMI5ZUDs0CP/HhntYwOjNrmTx/k7LmACCacYBUtz1TGGGXivvYbPYsbtq0GgzgZpxdzy07iZxD2wzMScSdhNTe8+hpBOqJig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by SA2PR11MB5116.namprd11.prod.outlook.com (2603:10b6:806:fa::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.12; Mon, 18 Mar
 2024 22:06:17 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::71ea:e0ea:808d:793b]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::71ea:e0ea:808d:793b%4]) with mapi id 15.20.7409.010; Mon, 18 Mar 2024
 22:06:17 +0000
Message-ID: <835a2607-9d3b-4a05-95ac-186e2988683c@intel.com>
Date: Mon, 18 Mar 2024 15:06:14 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe/lnl: Enable GuC Wa_14019882105
To: Badal Nilawar <badal.nilawar@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <lucas.demarchi@intel.com>,
 <matthew.d.roper@intel.com>
References: <20240315112147.2460691-1-badal.nilawar@intel.com>
 <20240315112147.2460691-3-badal.nilawar@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20240315112147.2460691-3-badal.nilawar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR04CA0034.namprd04.prod.outlook.com
 (2603:10b6:a03:40::47) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|SA2PR11MB5116:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BDCGpgCfRDGhcY98q8Jmm8K/RnOTRmiWGltpDbFSY2AbCnbfFEUsu34v0M2jdnA35GjCFb47gcFurLR7T36GXywMiIgrgphpJwPL2d87yXZtG/kmSHljd+FbQYrFNGs0CijBC6PrkWdsieChkXXKxobptpAeDCc3KatfjhaFWhNS/9KB3+9jZ2Ch99mNI/J/483kZ3PevXc/uRzb3JoGB5p9NoKWRHI1KPZ5sIbh1bzRXP+cZT2ITGbqazqeaQMKymRwSwQcEIPc1jKnBXIJ+dK1+1tEmW0B+xcOUCBcQozm7F2nrj8K5et3tDxmSpvip42GDIQoCdeV0l8IpTF+cpsymJb4+MLeCLaj5aim+A4Qs/L7Ue4nNKznDkTtW4fdcjbpm7KlXkrGNDJAaY+6SR5AhFiaoTq2gTquHk4pnKoKyFdvyDmgxw08SNoSgGoPH1165OHaScqj9w89/8CR4L3YOaG/OoQiagOG81KIbi3PGB/wpZpnkjATc4ZHJ93TLc9olbEr47evcdwY2OZvmi4kJICE85yULpc5vNnUTSBfNYAAVmr3ortVyQ3P+aCTJ8pOCfExnfRdgVb9yjLO8GYu4Zu6vRxuB1jmk66d5Jz6JsISOb/sDTYulJ1VWKcLGkd9TpsAVkqnhYRjZaPtsFBL02FSxYAUEXyHk6QzveE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M0JqckNPTDFSNVVuMVlocEFab0NkQWVuRit2YkwyQjFzeENDaXp0SkQ1bEZr?=
 =?utf-8?B?TVNhK0o3bW5yQnYrN2xOYWFXb2JYNSttWHUxdHZMRkZzeklDTTQ3cUNmRFJn?=
 =?utf-8?B?WDJzYlozZERteDZ6M055dnZDQXF1SC9KUDJnbm4zemJycC9vNm9jMmwwL291?=
 =?utf-8?B?NG9CcUNBUURiUERVQU9GTThaUC9LUUczQnRzMTI4eXJPVFJBUkdGdDFNZW9K?=
 =?utf-8?B?eWNGb2tlVERMUGQyL3Q2YXZ2WFdpQ3ZJSHp3TGVNTE5RS2w1TklPM1pCNzkr?=
 =?utf-8?B?ZkVRcVB4ZEwwT1JMRURnallYelRxajJ2UDB3Y3dmdVhlQ3JKU0xmVEh3SS9D?=
 =?utf-8?B?RHIwNlIyRVU2RCtia0Q5ZGNURHdXamFCbldwOHFqeCtsYmlTRVUyaExYMkND?=
 =?utf-8?B?dWpEcVltWmlYUEwvc1RzKzhXT0hERnpnZkdIOWdPQ1VKM3lDMm5jY2lBd0lP?=
 =?utf-8?B?ajJjMkMzSmpaMEt3SVNwNUkrRWQzcnpmSXhmK0RwdDg4ZjBaeXFKU3RicGFz?=
 =?utf-8?B?R3NiOHBMTUFQckZMMUNDNkorbUVxTXVUZkNZMy8vdGNpRlYvY1hxbGdDOE0z?=
 =?utf-8?B?bEZmSnFCOWxsZ0ppbUEvNmVsUnRvOG5xdXZmYWxtN0lNNHpacnRwUkk2L3ky?=
 =?utf-8?B?cmNZR0NaYzRVbGlrcHF4T2NUdVNNaUZ1elhKNmRtWmNUSVE4dVdJVW9va2Ir?=
 =?utf-8?B?cy81cG5nMW9YNE1QTTU4MzlFRFlXQ0trcWt2OU8xV2xYWUR2R1lQR014ajhM?=
 =?utf-8?B?ckxOVHVveU5RTi8yakFyMTNuR00yMFhOa2pJZlM4NDVUMVUzWjV0MHVrbmhM?=
 =?utf-8?B?Z09KeVBzYU10Z3d3cjBiMEJXS3FaZzZCYVRJdGdkZ0FkQStyOEZVK1puSmFB?=
 =?utf-8?B?TnBXL2tIZTQvM2Vab1JmYmpoVVBnNzE3Q05qeDhKdktyUTZFWURyN2krUDZ5?=
 =?utf-8?B?eHRTMTZ6b0puNWVSYUtrNjFTWHFwcDcvOWVWRkxNQ0dxdHFHaEZ4Z3FBMkpH?=
 =?utf-8?B?cVhSN2pJR1BzNHYwWkhJYytIcXU0cFZoQzVpVTVKcE1nYittQlFsSFdkNEhF?=
 =?utf-8?B?UjdLTk1MbU1Tb2FQRUFIVUIyRkVHeVM3Yk4za0cwYVhyclR0OTlKY2JlcFJD?=
 =?utf-8?B?cXhSL21DMXVBcWZmQWtqenNNbGRYMWRiNnNST1VWZ1cvSUZuQlhNclgzWWxL?=
 =?utf-8?B?KzdRQVE3aS9URHUwYzRiaFZoY24wMWxUQXN6NTFBT1QrR2ZiNW4xa1ByV1NU?=
 =?utf-8?B?L1BjRWl6RDVZbC85TUZJSEp5N2UzdEI2aGdhMjlkbzRCc3JvUEFGeUF4eVdU?=
 =?utf-8?B?UjVvUjV4N203RG4yRFh6d1VVUHhpdDg1dFh2WU9aVVcwMUpnM2ZYMDU0eUhp?=
 =?utf-8?B?WnEwYU1IYWMySFlYM1ltcHZ6YU9TL1YrQzBacklUUzlQVUNPdUEwSnJqRG0r?=
 =?utf-8?B?SzZDZWVHNmVycXBTU0VaWjhaVnk1ZnJvQnVVaHlaMHAzazRJUDBOdkdtNjUw?=
 =?utf-8?B?RDErcUFlUTM3bWFnbG1JTnpVbDV2KzVnazIwWC84azdncXpsVkN4am5rYXZS?=
 =?utf-8?B?UDVDKytuL2hDYUNhSGRXeEQrWVlqZzc2bkhJVUF1ZUpiRmFDUVkwaFB0Z0VY?=
 =?utf-8?B?TEpvalF6OHJTSCtaQ1RvVkR2TmJWYzdyZUlrZWEvczFNdmZjSkNvQlRRdERj?=
 =?utf-8?B?WXBNTFVQL0tzZ0dmdzZQNTNVNWxRYSswUGFURmZZZDRXdlVVYi9vUWlzSDFw?=
 =?utf-8?B?Q0lSdmhDM2pvUHhwS28vbnZNMEswRFRIV0NRb3YveE40b3NlcVBpcUlWS256?=
 =?utf-8?B?cEhvU3laYlJjdlFLbmJrNFVZcXhHTTc3K0RUTGlDYTVkNE5CQWdVcjdlV01W?=
 =?utf-8?B?a1cvODVsNnNpTGovdkhZL0NHNXpUNFF4cjVGc1MrbmFUY2JlR3NYL0l4TVU3?=
 =?utf-8?B?WUpJbitqVG9NNkFzZE5zbTloMUVxUDFkZXE1R0tjZHRXUEJveGZsSy8xd2h3?=
 =?utf-8?B?OW1ObkN6LzdjbUZVcUNFQnZ2aHFwMlFlNDdCbCsyY0ZxSk93Vkh1djZBUmxj?=
 =?utf-8?B?WFBmVm5iNVZaL0xjNVNTV1NmdG00Q1A2T09OcTZoNHlxbS9SZnI0Vm9GVktl?=
 =?utf-8?B?Ty9JckVWbkhobzBSNkV1d0dhaGx2RXF3QUlKTFlJVTVjdXpkejZGOUJKVEM5?=
 =?utf-8?B?SUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d919a32-8dc7-419e-e862-08dc4797a26e
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2024 22:06:17.2813 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9b81tS4V3uh3z9m4UzaVikq6eAtPMfa5VNeBqq1+ZzQ9ksK3p771DBZ3njEZB+rl6Q7ECC6o7zvRqBYAC+FCFfyNo3ZNzp/5zTi0sHNnMt4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5116
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

On 3/15/2024 04:21, Badal Nilawar wrote:
> Enable GuC Wa_14019882105 to block interrupts during C6 flow
> when the memory path has been blocked
>
> Cc: John Harrison <john.harrison@intel.com>
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>   drivers/gpu/drm/xe/abi/guc_klvs_abi.h |  7 +++++
>   drivers/gpu/drm/xe/xe_guc_ads.c       | 41 +++++++++++++++++++++------
>   drivers/gpu/drm/xe/xe_wa_oob.rules    |  1 +
>   3 files changed, 40 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> index 0400bc0fccdc..5dd45e06f0b6 100644
> --- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> @@ -319,4 +319,11 @@ enum  {
>   #define GUC_KLV_VF_CFG_BEGIN_CONTEXT_ID_KEY	0x8a0b
>   #define GUC_KLV_VF_CFG_BEGIN_CONTEXT_ID_LEN	1u
>   
> +/*
> + * Workaround keys:
> + */
> +enum xe_guc_klv_ids {
> +	GUC_WORKAROUND_KLV_BLOCK_INTERRUPTS_WHEN_MGSR_BLOCKED				= 0x9002,
> +};
> +
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> index ee48cf01fe22..3d2048747230 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -7,6 +7,8 @@
>   
>   #include <drm/drm_managed.h>
>   
> +#include <generated/xe_wa_oob.h>
> +
>   #include "regs/xe_engine_regs.h"
>   #include "regs/xe_gt_regs.h"
>   #include "regs/xe_guc_regs.h"
> @@ -19,6 +21,7 @@
>   #include "xe_map.h"
>   #include "xe_mmio.h"
>   #include "xe_platform_types.h"
> +#include "xe_wa.h"
>   
>   /* Slack of a few additional entries per engine */
>   #define ADS_REGSET_EXTRA_MAX	8
> @@ -281,8 +284,30 @@ static size_t calculate_golden_lrc_size(struct xe_guc_ads *ads)
>   
>   #define GUC_VER(maj, min, pat)	(((maj) << 16) | ((min) << 8) | (pat))
>   
> +static u32 guc_waklv_opt_in(struct xe_guc_ads *ads,
> +			    enum xe_guc_klv_ids klv_id, u32 offset, u32 remain)
If going straight to a generic helper, I would recommend following the 
i915 version - move the += size / -= size inside the helper rather than 
duplicating for each call.

Also, not sure opt_in is the best name. There could be future KLVs that 
take parameters (it did almost happen already but the direction changed 
for other reasons) which would still be an opt in. Hence the i915 
version is called guc_waklv_enable_simple.

> +{
> +	u32 size;
> +	u32 klv_entry[] = {
> +		/* 16:16 key/length */
> +		FIELD_PREP(GUC_KLV_0_KEY, klv_id) |
> +		FIELD_PREP(GUC_KLV_0_LEN, 0),
> +		/* 0 dwords data */
> +	};
> +
> +	size = sizeof(klv_entry);
> +
> +	if (remain < size)
> +		drm_warn(&ads_to_xe(ads)->drm, "Cannot apply guc wa klv_id %d\n", klv_id);
The message says 'cannot apply' and the copy is skipped but the size is 
still returned and overflow will still happen.

John.


> +	else
> +		xe_map_memcpy_to(ads_to_xe(ads), ads_to_map(ads), offset,
> +				 klv_entry, size);
> +	return size;
> +}
> +
>   static void guc_waklv_init(struct xe_guc_ads *ads)
>   {
> +	struct xe_gt *gt = ads_to_gt(ads);
>   	u32 addr_ggtt, offset, remain, size;
>   	struct xe_uc_fw *uc_fw = &ads_to_guc(ads)->fw;
>   	struct xe_uc_fw_version *version = &uc_fw->versions.found[XE_UC_FW_VER_RELEASE];
> @@ -293,15 +318,13 @@ static void guc_waklv_init(struct xe_guc_ads *ads)
>   	offset = guc_ads_waklv_offset(ads);
>   	remain = guc_ads_waklv_size(ads);
>   
> -	/*
> -	 * Add workarounds here:
> -	 *
> -	 * if (want_wa_<name>) {
> -	 *      size = guc_waklv_<name>(guc, offset, remain);
> -	 *      offset += size;
> -	 *      remain -= size;
> -	 * }
> -	 */
> +	if (XE_WA(gt, 14019882105)) {
> +		size = guc_waklv_opt_in(ads,
> +					GUC_WORKAROUND_KLV_BLOCK_INTERRUPTS_WHEN_MGSR_BLOCKED,
> +					offset, remain);
> +		offset += size;
> +		remain -= size;
> +	}
>   
>   	size = guc_ads_waklv_size(ads) - remain;
>   	if (!size)
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index 48cdba1cbf95..a8d15f004b6c 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -19,3 +19,4 @@
>   		GRAPHICS_VERSION_RANGE(1270, 1274)
>   		MEDIA_VERSION(1300)
>   		PLATFORM(DG2)
> +14019882105	GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0)


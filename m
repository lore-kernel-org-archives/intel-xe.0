Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B79CDC54E58
	for <intel-xe@archiver.kernel.org>; Mon, 18 Mar 2024 22:33:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B05310F069;
	Mon, 18 Mar 2024 22:33:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XxpJIN9M";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0931810F069
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Mar 2024 22:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710801213; x=1742337213;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=gVeJfDBT4iAZGZ/oO8t3y1G6LtDV02Xp1SPF4NkapIs=;
 b=XxpJIN9M5Y6a5ICDDkwFUm9fBK9FPjDA6pb9mEJKAOu/NkQYeXasF0JA
 xJo3YEd2THlYJti7YjkEjjcn4xVXmlqJcnKg3l1cDZ19qeTR5ysp3hK3Q
 b5zb8J6VvRQM3l3119pl8ohhJNkyd/aPRvfMiyMqbg04b4tn3c0zPSh4Z
 N8nLn/migQsAtvFcyT8OOmkShncasM3yo8syd7KiphCph1hQaNhrcFotn
 6oBdLN3WITBFzC8cxWZZUb3W8rqn9zO1ozKSAd6iZd5KZdB4WX88IF6yk
 UpuMrZ8NMdDvTDy5otI5IPVJOvWRxF6zV9hKp413nWQaIFfGrNq8GdoOn w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="6247736"
X-IronPort-AV: E=Sophos;i="6.07,135,1708416000"; 
   d="scan'208";a="6247736"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 15:33:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,135,1708416000"; d="scan'208";a="13632461"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Mar 2024 15:33:32 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 18 Mar 2024 15:33:31 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 18 Mar 2024 15:33:31 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 18 Mar 2024 15:33:31 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 18 Mar 2024 15:33:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cMFmcbeopYuZ1nuZpBc8UBYo+7m0qk86CFmVtEwgvDEdBcoXWPWDvBSwg6fdNZbNqfdBBzOoXO6cU1XLFxNGTqFHk+/Puh3QVKXphIHEL8ylIzBMgflNa02Zbcib8VZ7UXP6kqDZ1mfkCNx372uMvBEGkb7W5adDFFFHtsR4jwwbvsFp5HMKwr0xDF5CNsfb+1qnq2SpDSa8YKBsvfqvlZhirh3qcjCYgwC7QHxJCF9RNA65BO+WDkgQ/cmpIfw9SXHR1TC8iv+ECdOAN87a3xHCZyjYmcvf88Vu62boAk/rxmKO7Zx8mRMz5Oy0LKdUH7fd3o3yi6Ja+JqPvpvGTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LUJPOE+OiVxt9E1LHpIWvJdzWigSUhaib6112Vc1s4c=;
 b=dD9jYVtw0H3zzphwrJjtP9/flrRAGUpzwvCY/nVCVB1uDttzKMcY0JBeaWY//2Sm5J0892pB9+hqLFVAT5cuWZaaOpQtEJxrkptGhLdPrClsya+RPKYYyuT4xt/pPaFWLggfhYWngsFni8Gpok+L0z52FwH5EbF2wt4c3CKPpRw41zNDpHS1woaXK1DrZj+pW16J69QhXGVo9PThNTDIcxGyE3miWEKBTJGrx+CcN6U1SzshoZ4j3HMR+C4qbdT1h8bPpBRAcQI5jxw6Ww8mOzEa55xT2wfnHIn4wFgPgBVavfzEiwnu5f1Wqy3B3LIGKOuWN+HLr5HORrz/saYhJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by PH7PR11MB7664.namprd11.prod.outlook.com (2603:10b6:510:26a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.11; Mon, 18 Mar
 2024 22:33:23 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::71ea:e0ea:808d:793b]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::71ea:e0ea:808d:793b%4]) with mapi id 15.20.7409.010; Mon, 18 Mar 2024
 22:33:22 +0000
Message-ID: <c0397652-bd5d-4651-83e2-0828cffd0581@intel.com>
Date: Mon, 18 Mar 2024 15:33:20 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/uc: Use u64 for offsets for which we use
 upper_32_bits()
Content-Language: en-GB
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20240318184225.3808240-1-daniele.ceraolospurio@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20240318184225.3808240-1-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0081.namprd03.prod.outlook.com
 (2603:10b6:a03:331::26) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|PH7PR11MB7664:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NyKVmBPxwQiqGXIrJB9tR53MaUF9N1wnuSsokbUGJX2dGpFe5Fu106Q4oz4hN0t309jxMS/rRausyvkyIuZbbaRGWiErAuRz9aEn1l3lbV57TKy2y6Cd5chu2TCOz4vqYf51LpWhEhVoD0gUBP9RDTzocnR3afj7YuTbw1PQvI0wm93NiV4yDkLJbU+ZlsmeC020u+kERQdzOe73rW0298OGqz3dgX23MgDgKKdgXfc/+FoVCcjgzREigArSbXsnrU0/K/Dcuphjoua/Nbzi4LdWWCI6VZkTvR/bPj1e3KuzUCEvSw8Nk459ZeD9FtnK0K6kVOdfdbCVhiHMG6DJ3IHUu9d1RNdwZfsiKC9aH8pHq/DHKoMzdcb//ikTvLP9ruk2TA/ZnMhRfL0RfXLyb+tNEjht2/mU+2TN70rRvcUTE3YkdPJDqsfCrBZ25kvInfOZG0zbeK+2+g7VMQZt+ImxtEDeJIi+CVZeYMNLRauIKc9ur2KR0ARS15MN3LUO2VnmFOjbvPexUFk6rJP2Vzxsy3Vv2DJyfESW1q0RNBfnbPExxaI6FQw6yEExGycOvitpaXgm+P9ENgJjw0tagpjGNpm3AfGuVKkovolhO00IprTvhY0YnQrTRVAeDqoywLkkLMb4FzQZRVD5jaAHITwVAtGis6XVBpR0xlaBKv0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cW9GR2NSd2J0bXZUQzd5OStQWkpCL0lpQ0kxbTlDM3IzdTl3ZWQ5b3pDRHR6?=
 =?utf-8?B?ODNMWjhFdkxVL0sxc3ZWUU5US01ZQjhUbHVRbkJTMmNvRVVrMWhkOEVQL3pl?=
 =?utf-8?B?Zk12L1BxWjFaWUJlSmEwSElEQTArbVFVOE82QUhjcmdXSWNqZk5qZElHSHlh?=
 =?utf-8?B?aGRiQmRva0FhNUhjbzhVYVpyUU5HcGEvZlRaS01PMm9EVzh6MWlqRGJaWWVO?=
 =?utf-8?B?eStaNVVXRm4vaVBtYnVoVVkrbGlmUXFUSGVjYldTZjI0cHdwYVZ4ZVhVQ1RE?=
 =?utf-8?B?OTBNeDFwaG1MOWEyQTlKSEpvVXBPaUhZM1QzQ25QaWJoVStUbHk5cFBhbTVK?=
 =?utf-8?B?LzVDYkRHV1VCMjNFc1crcEF2S2FjL01DYzVBdzhzUVRKc1lJQjZvcnRMMW1z?=
 =?utf-8?B?RjJZVllIVjlLaU02LzlPOGw0REJydThjR3N4dXFlYnBjMGVDM1V0cDcwMXI2?=
 =?utf-8?B?K21wOExrNFlMRnBqaFM4QlhjNVh0dWM5bXZOM1FyZUVpcG9HK0RGN3cxT1FS?=
 =?utf-8?B?WndxYTBXS0c4a1QyemlLQkJaTSt2bDlWU243OHFScnNDeldxeGVDWlhVaGts?=
 =?utf-8?B?K2xLenlBMjMxSGpHMjJJZU8xS2pwRDVYMnRlc2tOR0xZcEpya3U5MW81TTVV?=
 =?utf-8?B?RUtRT2hha2pia3dpby82c3JkbHhjV2JxTVlpWTg0MXpiSFNPNUcxdHdsVU9t?=
 =?utf-8?B?ZVB5eXdGSEloTEdvOU9vSk9xdFNHczhOd2szclA2ZTVTY0thK041UWd4b0pD?=
 =?utf-8?B?UVFXVWhiS2NxaElnNDZibFR1eVArYWxha2E2QnpyY0tQSEQzSFdYRTR4MzJO?=
 =?utf-8?B?TitHWEoyNGV4TVV2UDFCZUdYUVgvRFRrT202cWt3eExPSUxOYi9zN1JYbm13?=
 =?utf-8?B?QmhSTGlad3VlMGs1YVg5RXhFcVUxYVljV2RsS1QvNm5yT0M5OWRuSUt6V2Rr?=
 =?utf-8?B?cGt6VTBjQlpsbDNjTmhRc0ltNEF4b3JDeDh6YmpWNmt1czBhWHBNZjRTb2ZL?=
 =?utf-8?B?YnpsT0Nqd3g0dG1UbExwSS9LUWRCNFBuVURicU9VL3NYOEtWRFpYTi92aWdX?=
 =?utf-8?B?TXo5YkJ1M21VTmdobTYyVGlQKzBZNlM4SXhSR2twMGc4aUszZGh6aUV1OThG?=
 =?utf-8?B?bmk0RS9rR1ZwWDFQMUJqQUtsSXA1Wjg0RVo3Wk43WTIrWW1ZYmlYemlFUGJU?=
 =?utf-8?B?bzNJL2JsblJxV0swS09wSi9aRy9aYUZxaGZhSkYzbmd4MlVnT3NmM3o2NStl?=
 =?utf-8?B?TzdQWWM1Z1lLRjh2YW9GZHF3MHpIMm94a09OOXpLcEYrb3BKSW1JdWRid1Fm?=
 =?utf-8?B?SGdtczVpRkNRM2xuc3hZcDA0azd5WEI2VnJsaFVhSnpqbHVIaXVyVGlmMk1x?=
 =?utf-8?B?Ukx5MmJzRjc2SThEZFBvNUZTZ2NKWFFKTmJ3a1hrM2ZaRzBOaTMzbVVzbkM4?=
 =?utf-8?B?ampHL3B3YVZKUTlhYUdHRE40dllQbSs0RVhEcHBHd2s3bkU1ak05QnRheEpX?=
 =?utf-8?B?cC85STZ1R1prckZKWVppcUM3TVRJRkU1QVdjTWxaWW9ldDMwVnVYWUxtc3Rk?=
 =?utf-8?B?cVBCdlNkUnhYM2tsT3cxaHp1WE1hSHlSL1A5ZnRrRC9Ua2QyRFA1WUdGRytH?=
 =?utf-8?B?QUNQR1hoNitZL2lvV0R2K0xmbGdWR09XQmJRRVlQU0hPaE05RDhLc1NjbS9o?=
 =?utf-8?B?dHBscGJRMjNEVEVHUjQ3NVpJTkdCaFhUU2xPS0pFNTBCbjNIdlgrb3Y1WUt6?=
 =?utf-8?B?dkJJTllzL3RCZS9VZk9DekpDZWtyWVpyaE5IMGJQVEV3N0QwbVc5VzNRVG9i?=
 =?utf-8?B?VGxnck9iUFVXSzA1WEV1b2FEM08vb01mYnpDYjJkN0tQZ0hPM214MGVzay9l?=
 =?utf-8?B?eHpBMzFES3Y3ZkxUV2hwWkh0OVRzNnNqTFp6VVA0TWRkVVRmSDJKaDZNQ05w?=
 =?utf-8?B?WUNLS3owWlUvdG40bVBldmpsZXpWdk4xcUhzRTdpdFNzNVpvV05rMDJZNmVl?=
 =?utf-8?B?dk1WaGZDbCtGd3lRYzV1RUxaWm93Mzh5bDlSbW83Zll1RWd4VnB0b20wbGh5?=
 =?utf-8?B?MGpXQnYwcFhVZHN2a3Fzc1J1WEVHcFI1cGVWcnp2cGRYV2M2amxPSTlEOGJl?=
 =?utf-8?B?cXFmeU1vdlhXVEF3TlE3RWJiQ3BZOHpTeUQxVldhMk4yczhVTlh3bFM0MjlP?=
 =?utf-8?B?cnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c1682c8e-62ba-416e-f444-08dc479b6b6d
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2024 22:33:22.9045 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y0pzf2H/eFWqJJmsaRJuVBbvvEhSp7PNV3OH+KNX8j386bHxhQzdJLUdESXIp51OBWbubhInFHkWxSMGPTKjQYStjetdEmhC8U84YoK7jGU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7664
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

On 3/18/2024 11:42, Daniele Ceraolo Spurio wrote:
> The GGTT is currently a 32 bit address space, but the HW and GuC
> support 48b addresses in GGTT-related operations, both to keep the
> interface/HW paths common between PPGTT and GGTT and to allow for
> future increase of the GGTT size.
> This leaves us having to program a 64b field with a 32b offset, which
> currently we're in some cases doing this by using an upper_32_bits()
> call on a 32b variable, which doesn't make any sense. To do this cleanly
> we have 2 options:
>
> 1 - Set the upper 32 bits directly to zero.
> 2 - Use 64b variables for the offset and keep programming the whole thing,
>      so we're ready if we ever have bigger offsets.
>
> This patch goes with option #2 and switches the related variables to u64.
>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc.c          | 2 +-
>   drivers/gpu/drm/xe/xe_guc_hwconfig.c | 2 +-
>   drivers/gpu/drm/xe/xe_guc_submit.c   | 2 +-
>   drivers/gpu/drm/xe/xe_uc_fw.c        | 3 ++-
>   4 files changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 9ed939c20602..1dfef2c29650 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -74,7 +74,7 @@ static u32 guc_ctl_feature_flags(struct xe_guc *guc)
>   
>   static u32 guc_ctl_log_params_flags(struct xe_guc *guc)
>   {
> -	u32 offset = guc_bo_ggtt_addr(guc, guc->log.bo) >> PAGE_SHIFT;
> +	u64 offset = guc_bo_ggtt_addr(guc, guc->log.bo) >> PAGE_SHIFT;
This one does not do upper/lower(offset). The offset is simply shifted 
into a field position and OR'd into the u32 flags word below.

The whole flags construction should probably be updated to use the reg 
field macros, but I don't think making offset 64 bits gains anything here.

John.

>   	u32 flags;
>   
>   	#if (((CRASH_BUFFER_SIZE) % SZ_1M) == 0)
> diff --git a/drivers/gpu/drm/xe/xe_guc_hwconfig.c b/drivers/gpu/drm/xe/xe_guc_hwconfig.c
> index ea49f3885c10..525e51cc7aa7 100644
> --- a/drivers/gpu/drm/xe/xe_guc_hwconfig.c
> +++ b/drivers/gpu/drm/xe/xe_guc_hwconfig.c
> @@ -14,7 +14,7 @@
>   #include "xe_guc.h"
>   #include "xe_map.h"
>   
> -static int send_get_hwconfig(struct xe_guc *guc, u32 ggtt_addr, u32 size)
> +static int send_get_hwconfig(struct xe_guc *guc, u64 ggtt_addr, u32 size)
>   {
>   	u32 action[] = {
>   		XE_GUC_ACTION_GET_HWCONFIG,
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index d51cb9a4a6b7..9d3771ec5ceb 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -533,7 +533,7 @@ static void register_engine(struct xe_exec_queue *q)
>   	info.flags = CONTEXT_REGISTRATION_FLAG_KMD;
>   
>   	if (xe_exec_queue_is_parallel(q)) {
> -		u32 ggtt_addr = xe_lrc_parallel_ggtt_addr(lrc);
> +		u64 ggtt_addr = xe_lrc_parallel_ggtt_addr(lrc);
>   		struct iosys_map map = xe_lrc_parallel_map(lrc);
>   
>   		info.wq_desc_lo = lower_32_bits(ggtt_addr +
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
> index 44b8c5f58fd8..7e44c468eb0f 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
> @@ -788,7 +788,8 @@ static int uc_fw_xfer(struct xe_uc_fw *uc_fw, u32 offset, u32 dma_flags)
>   {
>   	struct xe_device *xe = uc_fw_to_xe(uc_fw);
>   	struct xe_gt *gt = uc_fw_to_gt(uc_fw);
> -	u32 src_offset, dma_ctrl;
> +	u64 src_offset;
> +	u32 dma_ctrl;
>   	int ret;
>   
>   	xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);


Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68A2CC54E67
	for <intel-xe@archiver.kernel.org>; Wed, 20 Mar 2024 20:32:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F4EA10F612;
	Wed, 20 Mar 2024 20:32:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D2j5eSLb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE66310F62B
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Mar 2024 20:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710966737; x=1742502737;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=zEfwcZ6ucTArhb59im/8/9JpRgtKielgouqkB83yhaM=;
 b=D2j5eSLbsHTsyVGlph8FpLW2a23gbKY2VWNCrCP8CgtZ/bl/bRtapD3T
 ndGJrYnopOi4sqwqn6fDG8IAQXBz8Dkgd3SorZ6nmHO+6rIl8ABXSqp8l
 uyywtA1QLQc5SfZvE4eGuLgHlrTX86ttkLw72yY+4+APE6YUMK2TEq9gZ
 3pC8sFGkWasS/irDU7GbxpqzpCyzhw5cMafW4Dm+G8MMwGzIerXMcxnPl
 KpOzcRoXJ3kGOXzI5UumSSaQYtVYnCubPjqqUBIOiOyQxt4RfUykfxuTu
 /RplycRaFkuftPMg4WsRbkgk1dQRLs/8nyuKA0hywU5VyIWia08KoDjym w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="16561601"
X-IronPort-AV: E=Sophos;i="6.07,141,1708416000"; d="scan'208";a="16561601"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 13:32:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,141,1708416000"; d="scan'208";a="14171374"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Mar 2024 13:32:18 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 20 Mar 2024 13:32:17 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 20 Mar 2024 13:32:17 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 20 Mar 2024 13:32:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L2jmx7BUS7ykFbwv4MOSAuNF8QHpn++lsMbuB5aTMEGLezpy5lJebfp6EbHjBnKsZfZ1+hfCJalT9wW/92ckDz21TLNRUN+OR3R+Dd8ayMThZq4/NNi53++X+DKibJVW/6ykRSTDTJGd1nL3vYRm3sp9g5qNy63SWgl8gx6mH4JpMHgCACM+BBoj/+NTFEbKLTx0dQNM3/80EvPW3G1y8tZGg+rOGvnKwCAjWjRijPWemEe1dvUOINxjZWeSAN8vU6Ey/H75Nj0kHdjvfUUYDD9kIAm6JcqMtJWrpVaPbDLMuc7m+up2RF0nOQUzAKtlTnlm0myxDsRddDTjVHmz9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rq+Owwe2nDTTWGOnrU4Gm2t52XHZ5hxOwiqiC4vQzkI=;
 b=UnvbhOOZxjKCEw+jk/HjqYoZlM3TPy5GWUYIHQ8BZ/d+wwvmUK9WnqtaFUN82KEfaq+3b5tzQs6hbUrQThu0xK++A9qxadgKvqoajNdrq9o1WfxT4dUGs/FebU3MM+FUbZe4kNm0naks0nNA9zFpTmk7A198zTyo3OqJ4iJ1fMQFGowIbc6spZ5BxMcPN8hlNdKRbo5/oBRxF7vegwSrAe+K8C536epimDLqpHxiljvfeICAUoq9m7t9IeiZZzJDrn4TS68ECTti0WKnTdAxzOul+Wi+NL3BgTmB+k+NWC+ePgvOqIX2Bvi4KK+hoeWKzOODIBXKIH8PxdnO9T5rPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by PH7PR11MB8453.namprd11.prod.outlook.com (2603:10b6:510:308::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.12; Wed, 20 Mar
 2024 20:32:15 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::71ea:e0ea:808d:793b]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::71ea:e0ea:808d:793b%4]) with mapi id 15.20.7409.010; Wed, 20 Mar 2024
 20:32:15 +0000
Message-ID: <93df54ef-f9e5-4ac5-8214-5bbf4df9eb99@intel.com>
Date: Wed, 20 Mar 2024 13:32:07 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/uc: Use u64 for offsets for which we use
 upper_32_bits()
Content-Language: en-GB
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20240319195101.2784480-1-daniele.ceraolospurio@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20240319195101.2784480-1-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0100.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::15) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|PH7PR11MB8453:EE_
X-MS-Office365-Filtering-Correlation-Id: 423c79da-937b-4ac1-5930-08dc491cd494
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AI3aV0+rGN8RP4sCtC1qi3UAq2tenlwY1pLX+8arLsGhHLj3ccfzEghrrgBjbS5VRpsm6yVjvOCkLFFn77A8vXz4vlNEnaRvn3Nb+Uok9c5IpCQT8kBmgUAAerDpMYrYnon9PWCRUJbbiBBsdPWQ/qdBRh/Ik1PRvw8A67em0Uxr/zB7bSMuLQ6HWawYjHhMIV7l24YSeQcqtXsZmaA5CBjrY7VjEWQAnX8uxd+4PbzKPVgg/tfxtlPfGKvGkqfdXGnshF5STud6lYtSCnvcc5HkuIPLFqa5jHLyB8MNoOPN9YPQTpqR2NaUAd36y96oNDYYSVpD5FCR/cSRbVNMJ51eWs/TBNre3oPiIiQxsU5k+0CeoTXqv4Q7CJsPTyhLiW1k1lVQt2O0d5IKVnX9klBo0ltFOAtbhWcjv7FbV4TiEPKzWoqfxU7fHhVSouGq9WGfe8Jix+u3ZhejuNmlABIha3dHu19ZrYUqL6H8MKp+WwYjVL4xCy6hLJTmb+rrqS9A69830YvhMsuEF1ey4w3q33bUVnmuXkxPCjaQYzUIN2c4OOSj9VUanJBsJp3yXMju4mQm9lBoRxLmYA0cme7fuOrYAxFEthhlRb4bheekdffGQnqIbQKmbyvsibimABPbwiKxr18BLKhqhHDjwHAjUPYwJwvWdHIEgehgwEA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eWZXN0luN1lkNGpkZ09NUllRS1RrcDRXbFc2T1FRZHpHSXBsQi94TDl3Szdn?=
 =?utf-8?B?YjRTMTR3MUt5RVBadSt1ZmJsYjFvQ1c5QzdRdlNQSWlLd3J4b1U2R2VVYjcv?=
 =?utf-8?B?NVFRYjBkQXpuRkNGVWlWeHJTWUo1aGpUdjBZdTl0M0I5RTVWOGIrcjF2d1Ix?=
 =?utf-8?B?M3FtRmU5OVhSQUIzYXFoVGJUdG13dDBVUG1kRlRyUEYxL1MvSGdTWTlHMUVT?=
 =?utf-8?B?Y3lyNHZsa3c2YUt6UTd5RjlnR08vdnJtUUhoeDFmSDJSakh2bElJZCtBM0Q2?=
 =?utf-8?B?TnFVU0tCMTVJOGNMYWkrWnd1b2g1M3BGaVlySU9NSGNSY1BFenMrQ2FjSzg2?=
 =?utf-8?B?cGppY1VCbTJOUHI4TVRyc05lczkyU2t5WExkQ21kcTJmUDlyT3JXMzMwamtj?=
 =?utf-8?B?NTQxaWcxdjVnd1VRdlZ3ZlJ6TDBSR0twYUYwSHVaTjlGWnh3aHpnQXdxY2N3?=
 =?utf-8?B?Z1ZqdzJiU0w1eVdqMzRpdjdjczN5ZTNNdG5wSGpMb2gxakVhQUh5VU1vTzZr?=
 =?utf-8?B?ekppLzJvQjVqVWU2NExVMUFUQ2p1NkR2c3B2RlJZVlpjN1U1QzJrMnl2SUw2?=
 =?utf-8?B?OE9kR0NkMk5BcHZYNjFydlJ2Zm5qa24xZXJOaUpYWFJXU0MzSS81MnpPYVhH?=
 =?utf-8?B?NXJTSlhsaGgxWHVRNkJFWm9SYkI0YXlMcFl5OUtvRjVKWXdkdFM1ZjFMUkRm?=
 =?utf-8?B?UXdadkVsdEM0ekYrTXVQQktLWGJQbWg5OHRBZUxrTXo3RkhNTHhISDRQN2c0?=
 =?utf-8?B?eGg3Ri9zMDZ4c0NpdHZmNzE5aHlvNlF6am00aXNuUGlZNWNZd2FLaVgrOVNj?=
 =?utf-8?B?UzRYYitVRW53Nm1wbTNhbFEwMTZWdWRNRzZNeitBekluWjNCWUhhOTcyQVRR?=
 =?utf-8?B?RVBJb0tyWVpKRGthSFgybldhNkNlMFhZTVpXamdnS2dzNUNuWjhqQ1FOaHJ6?=
 =?utf-8?B?MFFiYWRkd0VmK1ZzRk5OcVl0anNBYzZFVXlzUk9CdDJGQW5GL1RWQ1pPa0Np?=
 =?utf-8?B?RzNqcDVSekl1Rk85ZFA0aDcwbDU2S0pqeGcva2NBM3RIM25rLzZ0ZmMybExW?=
 =?utf-8?B?Q3hrTmZhZE9ubVM1RWFBOXdCMGJScEhEa3IzaHJCeDFvRkc4MkloMTBrM1hl?=
 =?utf-8?B?TzVWRFJJREVEYWIySkVET2ZqRG45bG0xb3c5bjBZUzEzRWtkVVpkdXRGUU9L?=
 =?utf-8?B?cnFNZDc1a2czRUFWdzJYNEdWUlRiV01RSHFGdkZkbnBkR1g5Sktxckl0bno4?=
 =?utf-8?B?ajhVYzU1NlBhYU1jeU9uU3FjSkQzZ21RNlFWZ1ZJUjJFMkZoU3dicnVhWEtk?=
 =?utf-8?B?bU5sTkR4ait1NUtBTEFHZm80S0diMURJU0tNSWs5bElHNm9IbnBqNkFVVnAr?=
 =?utf-8?B?TVQxNVpER0l5VVBVdGtVRm1KckMrczJ3TFRoT0dlRzFXSHN0dWJHdlBqUGJI?=
 =?utf-8?B?ditPSm0ralRld0ZqM0FseDlUcXhSVnpHYVphdDhLYXc3ZXd3d3VWbS9yQUxq?=
 =?utf-8?B?aGhJUm94NDVKc3dFNVpUWk9YQ2w4UWN0ZzlBaTVBTmpxSEdYT1hiYk5FbmJp?=
 =?utf-8?B?TEVsZjMxVFVNZEI1TUhsekhKRWlCM1lwUWpSZzhYZys4dGVqWlI1anpYUDVZ?=
 =?utf-8?B?UVhjaUtoZFNab2ZIQWk1ZUpQYmZZQ0xhNWpxK3BNeHdGeDR2ZHNVOVVLYlNm?=
 =?utf-8?B?WnA3R0FMeCs2Rk1PVGdNY1pjc0Z5em0ycEpiYnovVFJZZitlSUZ0R3Z0WFNH?=
 =?utf-8?B?Rm42eENjNCtLU3kwbi9uc2lJaXRqcUVWM0s3S083M21Kc042N1o1WXMxbFBC?=
 =?utf-8?B?U0Fib0FwK240bHFYRjBUa3J6ckZHeXhZUHljcHA0dWMzZ01hckRBM1pCd2VE?=
 =?utf-8?B?Q0p2V1FCbFBiMHNNUFpzOXVCZFgxMEh3dW9nVTBWU2RKcEFHb2JabWZuSElG?=
 =?utf-8?B?Y3BybXNWOUhKNGxUcXBNdlhhandvL1dmV2kreXdGbU00REkzVlZ0bFhiWm4v?=
 =?utf-8?B?SUVzMXNRZkhla1BzVHE5WFNBMkcyd2FKL0VwNDdpdHZqaGRhMWplOFpMTGsw?=
 =?utf-8?B?M2gzc1JjWGVYcE0zY3I5VVhERnVEa1d6bk9UODhLb1UvcmpNQ1pHdXVRbk9x?=
 =?utf-8?B?RWo3MkZBTG5SS0xzY1FORm1ZWmY1RWI5d2Q3S3NkYVdNTXNLZnQvUkFUMWQ3?=
 =?utf-8?B?cEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 423c79da-937b-4ac1-5930-08dc491cd494
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2024 20:32:15.5725 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CF5roc+AKggwtlo4TQBC0OqVpiNjNIBMfeueu39NSF2Dndu9NnuUOvZ0/C1ZcJlygH5hcYUBi5jOGa7bpvee/snJftHzvXa2moi8MiHxaiA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8453
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

On 3/19/2024 12:51, Daniele Ceraolo Spurio wrote:
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
> v2: don't change the log ctl flag variable (John)
>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

> ---
>   drivers/gpu/drm/xe/xe_guc_hwconfig.c | 2 +-
>   drivers/gpu/drm/xe/xe_guc_submit.c   | 2 +-
>   drivers/gpu/drm/xe/xe_uc_fw.c        | 3 ++-
>   3 files changed, 4 insertions(+), 3 deletions(-)
>
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


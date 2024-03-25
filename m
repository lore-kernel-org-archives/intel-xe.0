Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A28EC54E64
	for <intel-xe@archiver.kernel.org>; Mon, 25 Mar 2024 06:18:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9634310E2B5;
	Mon, 25 Mar 2024 06:18:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OoliTrIP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25E9410E2B5
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Mar 2024 06:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711347506; x=1742883506;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=CQauRJGb4pR1NsHwpFiJKZchqovy6UBLzTCiTM+YOJA=;
 b=OoliTrIPrA5GRe3E30qn51UXDxXutetDwoMhDt1Nk4gC1iIm6X46c2Gk
 Up+E8hT01GRpBqh92kk0GxyaxTVxRCuGnQq6u+ldABauZBlYN8V321k8t
 r13ZTMc3T0mUutApvM9wHLa6kiv1AhpHYxn3eWhowIl3nqFStgLE5VGgI
 I1oK1gY2nD2GE2A6Ehik2dk7lvSSt7ckNySLya7is1cdF7N/2kfoAjP2G
 idYNU7XYCwpsO1edTyeRMn4+10+/HVV5zQvOAaUE75SfqtAsTvYlOmC9p
 CQishr9HmoncR9mDv7dFk9+4gHjSYWjhfxrfDhJK+nizoH9UJhSQNr8Yf A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11023"; a="6439769"
X-IronPort-AV: E=Sophos;i="6.07,152,1708416000"; 
   d="scan'208";a="6439769"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2024 23:18:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,152,1708416000"; d="scan'208";a="20257642"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Mar 2024 23:18:26 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 24 Mar 2024 23:18:25 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 24 Mar 2024 23:18:24 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sun, 24 Mar 2024 23:18:24 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sun, 24 Mar 2024 23:18:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MybBlElzWbOD+enWH8HzV8VgHxfTC21K9BHjcZcsuE74czWjWlnS5Bme+nwFX9yJh/vnSu8LRErhboJ7w/sOgEuOKVsOL3TtK+ESMdUJK9GEJspGG8ZU0MHR8rdLnMqwWaeW28t07DJPQXEhDOP5/21wQuIuS6nAAIH0V+DSsjiUs4WKz4Hnh4KoRwaBSVspQhTJxpfn87zFUsUAqkdgB4O0D7xRash18eZUrHq3yTDpXByG4hmDCEHfHW1LuUlVbTyFjZdzhcQCDGpUbPaksr7ULxcm0pSdQGuifZ/0n2cp8moB+GvBRtJKBgi85DHiuePgRBclyEOkkZbfYjmZ8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NtVljQgJw+uIswJLC+3BUbhzYovqsgemvaTTaZz4pd4=;
 b=N/q/N3F7lBkuWVe8D0rirodnK1aV+AxPQHz1/grpjpPFVUyUAJPKCt3fRjbudWmCkWRvAesm4aO3Twnh6oNsHUmxUPOm3fbrgbjKv5p6NSa/KFYB+DILixW6ymQyju03DaloDJ1MjKPnxB2pVaahnAvlFn4Als6glEFeCZabURqZTAzDPmRTPwAmmq3nvEYlNuRGfiEM+gRo0CJ1TWTEOdJdLkFGGzLF4PdCzeRTshheDyq0UBvFqmTxrbGGss8giacZKLtICSUigId8+tci94spF0bdhV9/uYGuoZq744SEmMDAcUKUsaCsbE7LT2eGOLR9vemKgvrNuuu21+48sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 DM6PR11MB4641.namprd11.prod.outlook.com (2603:10b6:5:2a9::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7409.31; Mon, 25 Mar 2024 06:18:22 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::bf36:ca7c:bb6f:68a5]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::bf36:ca7c:bb6f:68a5%4]) with mapi id 15.20.7409.028; Mon, 25 Mar 2024
 06:18:22 +0000
Message-ID: <4091039f-b735-4526-897f-892e17cfeb55@intel.com>
Date: Mon, 25 Mar 2024 11:48:16 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Fix static analysis tool reported errors
To: Karthik Poosa <karthik.poosa@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>
References: <20240325035322.3192576-1-karthik.poosa@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20240325035322.3192576-1-karthik.poosa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0054.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:22::29) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|DM6PR11MB4641:EE_
X-MS-Office365-Filtering-Correlation-Id: 133abfaa-874b-4bef-c204-08dc4c935f3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6P7+y49xlhC1BEanXI/pvnQk6bNYuQWcm5a4LDx+0JSTJG+rc3fzF1y7304QVTSwP+8G71WCkhP1a6lKYQNTDcuTO8Q947v5Z1VkR8PWonJAM58O77M89U3v8+dFobw3fEBBomTVf+oRPAzrnRFFAB383nfCL5KcKxPempXztSG8bXulXhFlxP+haUfjTv+d0rh03by6yBS8jsZigiAgz7vDR9I+aflXXT5Ao7GyQ0QehxvN/EZHf3j1qy/BTTPkpjSycP1Z+XppAehb+U6KuSqrgnBY6l5ia2QVj0EYPf/fN7wcBNjWUmsF/35+Ev8+wJvFGo3dH0LwBID3AO9YzFW2NLqafR8C7xPr+MaINJbLIMb026uYm5LZ/1/8gYnbBxChXWasJJxRifGxvDAR1tPYzYUWboWegHWU9pr13PFR1im+VBVhSuNJip1uJLro6dvBd0klAlLUmGvL1DzVar+CJTsfHt8Dv5kIIO2cbnG9VfCEDpJRkODRFsNnZSX7NSi/pM6AFutiqBGEuUYJuzr1gWWojEXUlNvNgxl7nWggUzCAcQA6Gv6K0lLz/0f4mhpJILVjJzbQzB0ZsEx5oOhuCdFYijiAs+Xt9o3Qf1LEndBWV7tOptxS94JxkNcqnEEy9WMjUSo/v7hKmfiVdCQCyXzpCXM2Ygkbtr+JWbc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q3hNek5jN0xzQ25iUjBMU29hWDFQTk9Rd2FPMThJZ3hkVXJVbTBwRkpSeHRj?=
 =?utf-8?B?R1NFMmpmN3dNY0J1em9rKzhHVGF5K05KYkNNUjNCOFc4MDBlQXdMMHJXTTJT?=
 =?utf-8?B?S1pSMHZJNGZKQU5MMmlHZEJGUERMTVI1OGZFenE1Y2x1NGtVeG15ZCs5Tkta?=
 =?utf-8?B?eUpwcUF5TjVUWm5UTzNvUmEvTDRUOEhnWXNJNmJnNWdQSFVGSkU5eUFocWp1?=
 =?utf-8?B?S2ZXdjlEekk5ek9iT2ZKMXE0VXBmRjJHaVdaektPV0Y1SktUM2QrOTdEK1pj?=
 =?utf-8?B?WFY5UjdZWHBVWGZFZk4zdzJXNVo2RVU2MGFCZDUrZ0h0WVBlUHNraDFsZ2VT?=
 =?utf-8?B?YVo4QVZySm4vL3FkS3lLT1BxL1FZdXp4MzUzZWlWVU1WTDl4RnE3bmNPZHlh?=
 =?utf-8?B?WUcrQXh6aURzSDg3b2Y2MkdqTzF0MThVUVdiRDNiK2xIdSs2VmtsTzJFNTdo?=
 =?utf-8?B?ZDlYdWw5d0ptb1ZucmRCQWZOQW1wa2JwZ0FsSU5PMFFGcHl0UkcvVXQ5dHFL?=
 =?utf-8?B?YXEyRm0vc1pBS0lLNDVOS2doOW11Sjhkb1hZME96clVQWG5EWFM1dVlySEcz?=
 =?utf-8?B?U0pMTGRML3NCbSs4Mmhub0J3S05rczhwUnQ0eEhmYTVnR1BPU1QxS0pLeWFw?=
 =?utf-8?B?dTdwYVRBeTdoVXRrc2FHbHFPYlEveWw1UHRQeUkvTWtTQ3BxQXFiaHBBOUhp?=
 =?utf-8?B?bFBEZXdmSy9uUTV2NU5XZlRqMi9td2lLa2NBZ3RTQzlRdisrd0VTUXRLSXRp?=
 =?utf-8?B?elZBOWFxMU5WTUFhQlA0MEJYQlZFV0MyeDVyb3NVWjBpbVpodEcvOHNyWEVn?=
 =?utf-8?B?Wk1ZU210Q3Q0bUtCRitPSFdqNXQrL1pqbFNlMXNMQVMxR2paak83aWJWcVAz?=
 =?utf-8?B?V3NDZ2p1S2NMVkc4Z1B5VVlvNFFDY3ZPd011SmtkVzNvK3R6VlJxNGowWGY4?=
 =?utf-8?B?aUpvbEcrbVJpaWVWRVpxdUlCZzJjb2ZEV1Y0SkdKTnNyK0U5NVRGZDRKR1E3?=
 =?utf-8?B?b3ZicEIvZGRXUGhSM3pRZklST2ZxdzhlYkg4QStTalcrOHBTbkdVRDJrMmJn?=
 =?utf-8?B?YU16a3pTdjBWN3JhWHdia1RyWGFtTWJCZlErSGtiTktER0xIT1Z1T1BpWTFE?=
 =?utf-8?B?ZTNVeFlSdVJHRXlnSzNaUEVUamNsU294dmpjU1UvMkIybnR5WjlnOVZBZEM5?=
 =?utf-8?B?TEk2VnQ2NnZERTNGYzI4Qk92bitiSlRuR3drVFg0OEN4dEpnRHRQbklxSXZt?=
 =?utf-8?B?MzBlSDdndUNZbHBCcDhhVDFlalc3OVk1c0RzOXVCUkx6N08wNkhGU3B0S0dm?=
 =?utf-8?B?SURySzRSSitFL0N5M1YyeHZxNmVGT1YxWTNOOTgyOU0rZGRzQVpTeXJXMDZX?=
 =?utf-8?B?WkUwRGlGcGdpYk41M2hrOURVVjdkZFo0WEtDVTYyZ1pOcEVpakU3UlkrSmlW?=
 =?utf-8?B?QnJialJVYU9NZDFwWXU0c2tlZ1dTaWtialBSOEtYY2NJb0E2VnJEMUo2Rm5Z?=
 =?utf-8?B?VktuZ1NUVElXWlBCS0JkOGkrTDRYK2JCTzUrUjlYT3RZazkxQXpJemdaR2Nj?=
 =?utf-8?B?Z0JaRXZmMUtvQ2hPcHBzOGlRdzVzZE1tU3ljMzMwL0dweVlHNlFKSkUvZmZh?=
 =?utf-8?B?N3BBWW5qSkFNUCsvM2tQejVxaVZOUmhRU2c3ZUxmb0UyRjNmcWRXR3ZkOW83?=
 =?utf-8?B?RVJwNW5WSjZYcTl0SGpBTG1Dc1Fka2VlTzVTbmtISHBnU2t6NWIxeVJGNkVo?=
 =?utf-8?B?UkJuV0ZZQ29iWmV0cU1VT3JraVlwUGR0OWU0RHlWL1ZYZi9hZXlGT2x6c0d3?=
 =?utf-8?B?NktwZmNwUG9ERE9zWHpCRW9UNzZyaEFpWWZMNGRSbjZ0UGh4TEd0WFpleUl0?=
 =?utf-8?B?cDVXM1VpVlFza2xKNnlaVUx2M3h2UW9hMi9hVzJ3RlhDWHJKbUk2NkhvSWVE?=
 =?utf-8?B?ekVvL2lUcUVlVXlDSHJPRWx4V2Q1WHVhZE9ETjlvMkpxRkoxYmkrWDdjeXBG?=
 =?utf-8?B?R3kyWEMwazFHQW5LVU9TOWxXZVo2d2g0ODRubTg2L2hEdWFJS2xud1VYdkx3?=
 =?utf-8?B?V3QyQTM5bVZPNkYwMG11aTdtRmF6d2RmaTg4WlJ0VkxrNFVBYzBPZ3RiVmlk?=
 =?utf-8?Q?3UnrsF1S0BBuOp12E5UfqQu7F?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 133abfaa-874b-4bef-c204-08dc4c935f3d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2024 06:18:22.4851 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SQi1YuZeCTfE7h3wMPp9lwzW6ZdF7dbMrl/eTTaF1jchh0VA7JlMj5gfbp8b21yrc/AwqGGiRPWXWD251FigFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4641
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

Hi Karthik

On 3/25/2024 9:23 AM, Karthik Poosa wrote:
> Add a NULL pointer check.
> 
> v2: Release resources before returning error. (Riana)
> 
> v3: Change drm_err to XE_WARN_ON. (Anshuman)
> 
> Fixes: 09d88e3beb64 ("drm/xe/pm: Init pcode and restore vram on power lost")
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_pm.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index cc650a92c2fc..bbb2ec25aee4 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -383,6 +383,12 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>   	 * really lost power. Detecting primary Gt power is sufficient.
>   	 */
>   	gt = xe_device_get_gt(xe, 0);
> +	if (!gt) {
> +		XE_WARN_ON(gt);
I don't think this is right. Shouldn't it be XE_WARN_ON(!gt).
Also i think the review comment was to add it in the if statement.

if (XE_WARN_ON(!gt)) {
	err= -ENXIO;
	goto out;
}

Thanks,
Riana
> +		err = -ENXIO;
> +		goto out;
> +	}
> +
>   	xe->d3cold.power_lost = xe_guc_in_reset(&gt->uc.guc);
>   
>   	if (xe->d3cold.allowed && xe->d3cold.power_lost) {

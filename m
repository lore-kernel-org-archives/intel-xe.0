Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C20EC4345F
	for <intel-xe@archiver.kernel.org>; Fri, 12 Apr 2024 22:04:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC49A10F363;
	Fri, 12 Apr 2024 22:04:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mga6/wpL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E86310F232
 for <Intel-Xe@lists.freedesktop.org>; Fri, 12 Apr 2024 22:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712959490; x=1744495490;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=AW176Fd6EtulS9vG+t7RowMJ8Wej3sfaE7r6T1nSsVw=;
 b=Mga6/wpLg6/48NoU/ApNKoZoODDVW40X+fCd6WKUDmEvdMMP+x3hikUV
 sTmeJiuOF8ubHDo+nkkBIWiYVMSce1OpjE8dn4Ifo6+HHrgXWTIpRHMAP
 wVZa3T/0EaDqVB239I1DjHIiMGXsHogYUQyKl/zBixwX0oftUUMUpzEMq
 t0Lu9bXRksY1sPm9yfvuiV9KO8cUAQrNLND50Ho4uiZmBqY7kEFf1RnrF
 py50s3WKT3nqJaQpIr29q8vQNZcF/h6FJwVRDEIrR15bl7l7lQ5K2wbJ8
 ZMYFXzxhQJ9pd+cerGsf7v+0RwfSnoVK4l2hYPt8fGr7xREUUGFkcC5Tm g==;
X-CSE-ConnectionGUID: cO5i1uX2QVCGG7W/S6nclQ==
X-CSE-MsgGUID: USL+9zQ+TjmwSr1M0IfG6A==
X-IronPort-AV: E=McAfee;i="6600,9927,11042"; a="12220178"
X-IronPort-AV: E=Sophos;i="6.07,197,1708416000"; d="scan'208";a="12220178"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 15:04:50 -0700
X-CSE-ConnectionGUID: zJOjmw2QRcO9RpXPR1vX8w==
X-CSE-MsgGUID: Y0dlSu2VRXyj/TpX8Tk6uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,197,1708416000"; d="scan'208";a="26154495"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Apr 2024 15:04:50 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 12 Apr 2024 15:04:49 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 12 Apr 2024 15:04:49 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 12 Apr 2024 15:04:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J+vtDCuqyooCETlEhe9PVc589tIxwTSsREhR3pLCaBCVcixyqS5uy0JYoXXdfJ0ljwCi4EiRBETfsFb3LyfUnd0bJ0T8Be6YhzfTFY5/P32lapbXAW6S2hhwtBv7BmBiWfxh+TkS/5rT/QVuahIraf0nqRJweBygQtgWyQmixVNRZWptY5f9gcr+2zebFq3xMBZmE8uXtI+iwNrRcCv3sus0kQnGNMJH3pyWUibabfXbQJ0AFb7Mpf7BdkMiAYYM/o2ui48LKx9xv829xwO+BSBJjLjyF4O8DiiACQczN3Ockfp8k/STddYet9MyaZCkyhgDq+NAMwLErAq3x2x93A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PRy1jhMRjWTDLr8tY+CB6V/a1wd1+cCWMRAtnP3A25I=;
 b=PQrsbguSiGBFIUSqh+GxJrMuAHiIL8vycBKi3ruBzFI66aY1oLfcZa+PjHt4/nw4nOnPVtOgN518B3fR0k2lTvOkGTGZQtxvDO+/egwgz7FOYyVDUVMHG/Vzr+DxlWghNqJ66tckx/uQZp5cG4c5QME/DpQ8dKneMWkt9OGHRbxhJtp9yNKg6Pd1vH4swIuEi3QgFNEpG6K1junEHIRZ48gvBqyusbO6TLkYVjByCkpWjGweeCWinihWA07kUHA1s1L+o5bfuiHo3LJqrn8vWnFZwSBytc/o2Mj6PvKdc2rQTcTw038vu745blmS1vKJokMFpRln1Bji+57p2BeOig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by CH3PR11MB8467.namprd11.prod.outlook.com (2603:10b6:610:1bd::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26; Fri, 12 Apr
 2024 22:04:47 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::3718:5daf:6e25:6127]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::3718:5daf:6e25:6127%4]) with mapi id 15.20.7430.045; Fri, 12 Apr 2024
 22:04:46 +0000
Message-ID: <a8a1b5ff-0fdf-4267-93a3-b7d18b9f64dd@intel.com>
Date: Fri, 12 Apr 2024 15:04:38 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe/lnl: Enable more GuC based workarounds
To: <John.C.Harrison@Intel.com>, <Intel-Xe@Lists.FreeDesktop.Org>
References: <20240410002646.3002394-1-John.C.Harrison@Intel.com>
 <20240410002646.3002394-2-John.C.Harrison@Intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <20240410002646.3002394-2-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0015.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::20) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|CH3PR11MB8467:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d5363bb-6c05-4209-06d5-08dc5b3c90f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: o5X1K70J47BWikACQ68AVUhYpmByqat8v4aYq50Rh1D6rA3KknzAmycOVcNJoO0uYkzBuzOQBR2TUPhLgzJILtDXdWTVpLTeZS936yN+29jJje6zqWSXZ25bPV0USZhXL8SsCtl9W60tS2E2ep5qB7ERF7oZ7jLvbW6hSGqsE2UnFtXIINTqbyLcuiw+rhYXQO4z+86s9rrsVsP2jkRVx7SCFRX8T6LJtTIPovPr91YgBIKS21Gr6qivEKdrzEEH1w8W5IJOBUUg85Lcn7X/7ph8kL9yfbVzyrNbrpMuJRFVSMM1CK9Yu0KBqtWvXHCS/LE3T6XwbSNoah70rOEmtJ9tug1xja6uhOg++5ODMG66wPAamh4LpbLs+ltBJUJeQvupJHYNQEAO+ipPcY+3crkl7aKBCnwvhGPEd0fSQKnFN7FVFZ0h0IwAcE0y/AbmW/L2DpUQtBfOr2T8zxawYtx2cIbXGEinSjddhES5yyibQ9qtMt/Xs37IkoTU+3jN9fFVroPCCFRdpHbcVcQKkPthvGaSTrHyaycKzp4+IoAit4thuxe94mR/pk9qLHz51t+jd2CTXfTarviC6kPsxyZRu7Y8zGmhLa89V7TfKHnVwhlAcZpec/Suqbgi0wlayYdM70HDDT0H7Wzyh1Q+2nAfNaJbOrrmVd49dgA4l+g=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QjBNekRBaHNlZDlYV1hoYWJXMTdmNW1wVjluMHA3Q1VSL1RUa3VxY3BYUVdJ?=
 =?utf-8?B?OFVLRHZVQ0grMXhkdDNCRG01czhNMmRscWtkNGVHTUM0blVmMEliVkhoQmFz?=
 =?utf-8?B?ZEQ4RzdFa1JyZ2YreXc0bVFQY1pKaTU0TDFycUFFWUJGWHJldEpPSnBYRk80?=
 =?utf-8?B?bE9SNkF0NjE1dm12d01TdnN2a1pZdUowRjFvY1h4SUtZVDNyalVBNTlXaU50?=
 =?utf-8?B?eEJEdFNNcmVGaXU1S2RwczdkMmVDL3RweU45cFZ5RlZGaTdSOEZEcGNydjBm?=
 =?utf-8?B?Ukp2WTFUYmxoM3NubFRNemNGQkNudW9JOVpVeGEyUjNuU09nVWdhSDQ4eXV3?=
 =?utf-8?B?U2lCQi83Nm0reUVKNWtqLzRNMzI2VG96YkFRMnFsSjhKamNVb2lEK2JzNG04?=
 =?utf-8?B?NDBFR2ZIOVRWUHphYmU1cDczQ25NTlBkQnJBYlFTcTdsM1JGdEZnczVyNitl?=
 =?utf-8?B?UGs5MCtYQldIb2tVK3huNEErVm80R2hzbTJtc3BBaDRUWVRJaTcranJXbHZX?=
 =?utf-8?B?ajdvVVZkMTNQWHRzOEVmeHNUUUdZZkVONGZBV29NSGpBdCt3TCtBN1ZVUnZh?=
 =?utf-8?B?YzdlQWJTS1MvMTAyUmV0Uk5iejE4ekVOM1c1cXFFQzluY2dtSkZQdzF1bnJX?=
 =?utf-8?B?aTNLbnV4Uko1bjN2aWFHVjRPOVQ1TTcreHZvZSsxcHBIcWhkYW5zbjhQZTFq?=
 =?utf-8?B?WU9QMkgrbGFwdDBHb3pNRllmTkZWUE1yUGpqYjMwUDQyNWMxMkpKUlFlR3cx?=
 =?utf-8?B?TSswcjdLNmVrR2NPYnArUnZTNVdPOWVkYWRKcDBqNTZ2UlN6MTkyM0lYSFJq?=
 =?utf-8?B?S28zOTVhOGJUbkk0Q041Y1RCcEI3QlZ1dmVQZFl4M2pkblBhVndjWTMxeGpi?=
 =?utf-8?B?YStZckI2dUN2RElEMlZpek5XYjlxNWVFOXRuL3gzZWJkamFPaXYrK1B2VUtH?=
 =?utf-8?B?T1MzcWNMeTdKVFh4L3psek5lV0lYbkhjeWR3Z3lWUlN6Vldja0FYNHZDQko2?=
 =?utf-8?B?UXh6eDE2L0QwZDhLSzM2aW40c3F5N0lXQWxuMGJuYTF2aGpSYjFRa3F3a3R2?=
 =?utf-8?B?ckZXQmxYYm1FY1h3Z3c3OVlkRHR2Q1pEcVZuaUVBYzF2bUxqMUZGWG1qVmxL?=
 =?utf-8?B?UmZZT2thZGRtbmZpeWlBenE3dHlGRjE0blhzeW1lSzNVdnRjVDYrMVk1Rm5h?=
 =?utf-8?B?RzVPVytoSytuTzFqZzZ5RmJpV3BiZndsZ2gvM1ZTaHEvZGEwbWpJOFV2MVVz?=
 =?utf-8?B?cExTNVFpdENuTVhaOEVac1NMMjdBRGJlYURxVGQ2LzlyOG9XWjc4alZmVEpa?=
 =?utf-8?B?VUowbXFJTXJzSWFmcEc3eGJRNExOaVBJSHpjMXpmU2taTmFZNk0yMVB3L1Jx?=
 =?utf-8?B?NnduNFFGWmpqeHZWZ1NubTRmY0JLLzdvMFpmZE1SbjNxR0IvSko4Q0VZblRH?=
 =?utf-8?B?WHUwU3lmN1Z1eDBVaHlGcnA5KzFLc0N0QXl3WXcwcjY2T2ROWkRZUm9kY3RU?=
 =?utf-8?B?aXdYeDlNeVZHRTloUmxYSUFzaWNIVjc4N1grbWFUcDV0QXpFVVUxQTFsNzJo?=
 =?utf-8?B?OFdvTnZKNDEzVTU4STVrZDRXbjJncythM0wzMGEyaHI1RHNDODM0elNCbXNk?=
 =?utf-8?B?T25KQmpFWmlSOWY1dkpRZGlRSkJlUEtPaXpqWWx2QXZleW9OeW9xRUFxTmJ2?=
 =?utf-8?B?TXA2OThmdEhXcXY3K1I2a0ZkZk9BYXZhR3lzSkZObXdTV2tmVEFiQWpTblQ3?=
 =?utf-8?B?WTJYc1cwNnVjdnNzd1U0KzhpWEZoWUF6SUQxRVNBQ0MrSnYzTnBOL3g3RnJL?=
 =?utf-8?B?WDczenRlVHE3ZDNnU2Y0RVRsRkgraXVKTll4SWxJWHlqOG56Z2pXalhNZkRL?=
 =?utf-8?B?K2RNOExkZEE4V2ZyZitxS29raFR6eVBpdXQ4ZzdxbmFNT0VjWktBTXpFTjM0?=
 =?utf-8?B?NHo3cGFFdXJZNXhCR2tGRERFeW00TE5uNmZFejk2bmxmQ3hWUzdyMS94RmVP?=
 =?utf-8?B?bXFjdFJzUEVxS1RicEJsY2pZZGtGbkIwRmwvL3Q3bnloU3FCblFWd3A3ei9r?=
 =?utf-8?B?d1RnR2RnVEhXcDZnaXlFbHp6cDJSV2FEWEpvV2tzNFBPZ05QYk96cS9ZTnBv?=
 =?utf-8?B?MXNhQUpseWsrdE9VZUNIZ1BCYTlRcGNySTBaOFRRbms4TUJHLzNlMGFNOG14?=
 =?utf-8?B?WlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d5363bb-6c05-4209-06d5-08dc5b3c90f5
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2024 22:04:46.8973 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 78iDJrZ9f/7NG1kS+V2dMVdghrL996FpG08s3lir4sfz3I3YpiXyNngk5/Cup9hS2nZFWSiIvastEzVOY+lXIXq0uhqeGwi0CCLt901+maw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8467
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


On 4/9/2024 5:26 PM, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
>
> There are a couple of new workarounds for LNL that are implemented in
> the GuC firmware. The KMD needs to enable them explicitly.

Seems like this affects gen12hp as well, will need a separate i915 patch 
for it? For Xe, this is-

Reviewed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>   drivers/gpu/drm/xe/abi/guc_klvs_abi.h | 2 ++
>   drivers/gpu/drm/xe/xe_guc_ads.c       | 8 ++++++++
>   drivers/gpu/drm/xe/xe_wa_oob.rules    | 3 +++
>   3 files changed, 13 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> index 5dd45e06f0b6..0972113f6b81 100644
> --- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> @@ -324,6 +324,8 @@ enum  {
>    */
>   enum xe_guc_klv_ids {
>   	GUC_WORKAROUND_KLV_BLOCK_INTERRUPTS_WHEN_MGSR_BLOCKED				= 0x9002,
> +	GUC_WORKAROUND_KLV_ID_GAM_PFQ_SHADOW_TAIL_POLLING				= 0x9005,
> +	GUC_WORKAROUND_KLV_ID_DISABLE_MTP_DURING_ASYNC_COMPUTE				= 0x9007,
>   };
>   
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> index 757cbbb87869..678ece366056 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -318,6 +318,14 @@ static void guc_waklv_init(struct xe_guc_ads *ads)
>   		guc_waklv_enable_simple(ads,
>   					GUC_WORKAROUND_KLV_BLOCK_INTERRUPTS_WHEN_MGSR_BLOCKED,
>   					&offset, &remain);
> +	if (XE_WA(gt, 18024947630))
> +		guc_waklv_enable_simple(ads,
> +					GUC_WORKAROUND_KLV_ID_GAM_PFQ_SHADOW_TAIL_POLLING,
> +					&offset, &remain);
> +	if (XE_WA(gt, 16022287689))
> +		guc_waklv_enable_simple(ads,
> +					GUC_WORKAROUND_KLV_ID_DISABLE_MTP_DURING_ASYNC_COMPUTE,
> +					&offset, &remain);
>   
>   	size = guc_ads_waklv_size(ads) - remain;
>   	if (!size)
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index 98a81468bc8e..5759b7bc1b70 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -21,3 +21,6 @@
>   		PLATFORM(DG2)
>   14018094691	GRAPHICS_VERSION(2004)
>   14019882105	GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0)
> +18024947630	GRAPHICS_VERSION(2004)
> +		MEDIA_VERSION(2000)
> +16022287689	GRAPHICS_VERSION(2004)

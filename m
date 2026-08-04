Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FEAAC55184
	for <intel-xe@archiver.kernel.org>; Tue,  4 Aug 2026 06:37:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7A5C10E645;
	Tue,  4 Aug 2026 06:37:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QUtGiUsD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6805710E645
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Aug 2026 06:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785825426; x=1817361426;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=8PKbkqCJ0deLSRM3W594vWcYwjhFSmFFgwdAvsTyp0c=;
 b=QUtGiUsD3afUeHbviAcJV4ROJIeDT+BS0FSwc3gXOJi5S8FmSSO1bpt1
 cvQ5X/8lzSnhTDyKQ51vpvxoKjikxlOrdu84yX5o7/qG7q9PE9eO75stG
 Ge4AvWAPeQmUd5noDddhISoDK7RAg5LaaCoeqqOWwaVsMkQ2+R7CjKs3w
 Aa7SUxXu2mdOmQA4uB6m06fmqu/Xfe9/LQvhwB7tdzPD1qY6C25/bv+ZH
 Qy+8WUz0gR9/WHgnre+j2pyDpQWBSXDfz0E26GJD95ouqrtCis7OtzM4N
 8xFslbfCWQN1EnI/GkApD6/ZtvkJbX6iyIjNWs3rSsmRtC7jfX0C89mqM g==;
X-CSE-ConnectionGUID: 2KWbtYFAS/6nVGKiJt/qHA==
X-CSE-MsgGUID: OeiBiBEgRyqkd4z5ORx8DA==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="86223147"
X-IronPort-AV: E=Sophos;i="6.25,203,1779174000"; d="scan'208";a="86223147"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2026 23:37:05 -0700
X-CSE-ConnectionGUID: EjHjFloVSIyxJbUx4Lje/g==
X-CSE-MsgGUID: 1yKxzcO+TBCq2aaPbeFBKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,203,1779174000"; d="scan'208";a="257534025"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2026 23:37:05 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 3 Aug 2026 23:37:04 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Mon, 3 Aug 2026 23:37:04 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.34)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 3 Aug 2026 23:37:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PsJKD1BO3u4DpkNGPR29USYQaL5gxWe3Ox9mPeIn7jhxC2iXxCOAyXwrhfHquStwF/joqqMTPmOqH5hbwdQ6pFULUjsUo1TSv2ya8Eu7JNLs5mnHTCtcrkoZbN1WCjfo6Mbi8FwXT9uakQOwxmmIV9vbyBPHVs5Bf2X1IjzqhE2Wrb8BAFeBmGwPn37il/EbjHR6CKMcCyDcLLPy89o+uKDUJXFdPENJ0GcyYo6x/bjAX3zLnUlnEO4IIsP99mIp0Dw/Bh8CNsqL07thIxfkKmFy64NyemmJopsiPMLyClzjwCS4OLtzYUDzryCkAJON0OtviHEtcA42CZXNImQO8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Bl4yt/cPPbrx9NKU2wzz028nFTH9ciVrr6fXcEcITg=;
 b=fTG4VCW4ehj9g+kXWCYoJ9lVPTaj5GdJhG11Az4MM2YI5wpK2w5LldbTw6TH9/FecO+oLeq+08MZqPzJLNDXjtc4zuiW0GoJyHiFkl9NWBin/7j+PC0qDzL/ml9wSvVVX4IwfFbqMxW3qZk59xncvGbog7fLJg3IwR1w3trbEpwByJZGvVGnGGUtxj/fQwRF6xdM4z0XYRXkWgr4CmENg8rr9FGuqed54IhUhIPOREHt+Uq4OCgpvnKBBwoXKIg2XSFj4L9+ujPmAQ0T4E3rO8E2Gov5W3uz7fSVT/NkNOFQRzDtzepLyAze7feDe/bqTef6vYGkTsRFUkiSEE9tTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 MW3PR11MB4585.namprd11.prod.outlook.com (2603:10b6:303:52::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.15; Tue, 4 Aug 2026 06:36:55 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0270.017; Tue, 4 Aug 2026
 06:36:54 +0000
Message-ID: <2cd81d12-a37e-47ad-a213-79a470ab7ad2@intel.com>
Date: Tue, 4 Aug 2026 12:06:47 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] drm/xe/ras: Fix invalid health error code
To: Raag Jadav <raag.jadav@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <michal.wajdeczko@intel.com>, <matthew.d.roper@intel.com>,
 <soham.purkait@intel.com>
References: <20260804051214.1202957-1-raag.jadav@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <20260804051214.1202957-1-raag.jadav@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0109.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d1::15) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|MW3PR11MB4585:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c8a2256-1e5b-46b0-bd98-08def1f2c651
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 9QWII3i9+yvdR8A8Kxah+wksmpQNW1jyHwQ7JrzQz5Uw5S3/sEVb5/MMRKHsEikaCI0zrAHNZLs0O7A5UJpabloQ294k5m8AmOeR/MgcOxa3zCI2e3N3ohXhN639SsqqTaV7tSSDM34kZob+IGbjWgP6gkyOlmXMdXCCEA/xt1GcvMYxNH80E4SCwbqrjaZvmv6M1E1MxErMqXsc3ynac4MRommcw9Fo+1r+5J6xLcuMBUTrh3UHYEoJXS1SSADWXtsN4nlf6GxUUSK72DSdKp9/YOZtKj4z808PW7aW7y6vR/qoH9z2sQNObRYBYm5Xyt4A7jQc3CzI+ZGTtZqgDdr55fRFG8A9aalYok1mmQPo6gDF3ddQcXrcUOXApLjomCuNtxCicSWeTXg4g/b6fT87CvoFgTGO97aq0Fs3azx/GFgLkJ4MQxniNElo4QfMXsSFBnauRwbJ6qImB9isIUVu2/TL4Q5Z4AAbma5bFUf/ItWcl0U09Rd71I6siuZNPgshRbjunLuQJ601Thxpijtq1sqKgOzrcWLCXOeIakCmFZ7NYDhkQ2Nt8+TC0MB8hKvSAqYvr/x0rkgOGVvfExpOmIRoLEAOtkD8nYZxlMWrn2S0Q6p1kC1o+PM7uWoLGR23blAhf6oGRtaPNrAg0MGoRBAjlALU88bGOa+LxG4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UDZwMi9aWFZoMFZDaWJFelgvOWg4WituR3daWnlqcVhkclNwUEYrenFxdkU3?=
 =?utf-8?B?ZVE3UDF0TGQza0hvUjcyOFByM083bkNEQ2wxWWtZcGRULytOTjAvYkFraGpD?=
 =?utf-8?B?eWRoaFRWU3hiZkd4ZGFwZzhCTkNCdFNSZFNPNTNDNFE4YlIxODJIc0UwUFZv?=
 =?utf-8?B?WTRoNHdUUDNad0ZXUXRaWHNqWnNvV05jcXRSV1NZUE15VU9pb1AyZ1NpTmhX?=
 =?utf-8?B?NmkwRGlGd0NEdzFFcm9YV3lVTHpCR3hFU3ZJWWNYclg5akRPZkg3ZjFNcW9B?=
 =?utf-8?B?N1RVampGckxMa0Fuc3RhT3FKY05TMVl2K1RJdnRVWTdLYm9MN3FoL1pUcVJa?=
 =?utf-8?B?ZTFLSWtaNVE0RmIyV2RNNDNjRnp4TzBjUWo1TXk2WGE0UFRXL2F5UExVOHYx?=
 =?utf-8?B?MCtmZEorLzBra1RXZGZTNXlQazVZb29NTnU0THBpNGxzaFE3V2ZIV3JMS3ph?=
 =?utf-8?B?U1p4YlViZHlQWlh2TU1yZldlUk9yQ2Z4eU55UDFXeXVJeUlHVWs0VVRDL01T?=
 =?utf-8?B?bjluRmkxTS9CQ21tTWg5eFRsMzNlWmdUdnAvcW9GVm0zanBYcWlKajBXcTVZ?=
 =?utf-8?B?Y1JaQkZMcW9rcVpIUXcvMlVNUjdoR3Z1Y3BuSDBoWFlpM3hJdExOTEdHK28w?=
 =?utf-8?B?K2hZMDIycGpSYlFoeUJRU1BpUER1eTRzV0pCWG94TWRwQ0RoNUtFYmVYbzNT?=
 =?utf-8?B?RnFqNkNqSW1LRXcwOXRwTzNXdkRnMmtib1JESXJlcHdWOWhuVXFCVEpUNWFj?=
 =?utf-8?B?NTBNMmdLQmlRazZyN0ZCVUtwS1pKdEp1Q3pkSDdwU1k3RDAzWndTNVpvUVBC?=
 =?utf-8?B?MW9GNDNDdGgwOGg4VExQNHZYRHVJRUtuekgxcEFxbE1EZ3d0YXZQamhIN0JG?=
 =?utf-8?B?Sy9uRUpGbHFuQVNvNkxEVVNXZHp5K2pZUU5jdFlETzBteTVRS2xnT1pUNG14?=
 =?utf-8?B?Wm42NVZDaWVhM3VERXYxQjAyRU1UTUJmNjJDQndMalk0aWR1LzcySUl3SnJN?=
 =?utf-8?B?WjQzZlpFV2ZuQVhjVmxMTFV2QzY0VHQ4eU02eGV6SWdoN0htVlcxb2JGaVQ1?=
 =?utf-8?B?N21LbkJ3NmdxcE5pSzdXUEhvQms5eWNuZTJMTlpNQjFHdU12WXMrRS9LMXdY?=
 =?utf-8?B?WnJnZm55MXF5c1lVTThvRGUvclpOSFJGdVlmU0lwTkFKQ0IxZnNpWVhuQWVC?=
 =?utf-8?B?M1hWdVZXL01RL1ZpN0dBd0VoRXdIYzJheS9kSlptTDltT2NHV2xTdklvTSsz?=
 =?utf-8?B?OHhXQkhRanFJOXo5Z2lLdHR2UUtDZTZvWncxK2VXZ1JialhJSjl2UzV5cXdq?=
 =?utf-8?B?N2JteTJnTElLZGpLdTFGMG1EdTl0eWplajNrcnBySU0xN2s3bWxRdnZWWDZ6?=
 =?utf-8?B?NTYzNSs5bklkV25ZZWZ3Tk1ScENmNlNDK29Ed3YzemNObWEzeUxrUVFpNUtk?=
 =?utf-8?B?eTlNMmowdHNMb3ZDNTRwWjFrUVVLTytFUTgra0M1bWo4ckpHOVFsd2N3N1Iv?=
 =?utf-8?B?YXdRekVCVnhXQ0MzZnM1OTJ6RlRyNWVZWXdnT0tmbGU1Ykx1TTRWR3NwZjc5?=
 =?utf-8?B?b3VpQTdRRkpVUWptZWk3bHJFWlZ4YnlCeStta0xJTlo4UjhFQVc1WlhuejVS?=
 =?utf-8?B?Q0E1cmNFc3FNWjFvZnZrR2RCVEFZT250OTJ5SHIrM0R3MGliZVdoTENGNkdu?=
 =?utf-8?B?QkI0VC93RmRxSDZXSDZhRit1Qlg0OXdJYi9MSnRiOTM5T3RjZjRSeUVyVkdL?=
 =?utf-8?B?cldtRk11UUlUeEFoK2pJUTFTQXdWTXduQWRyZWt1a1Q4TUp5akJqRmsybjlJ?=
 =?utf-8?B?NnNRdmQ2MWZtaWNicnN3M2NZRDNNMVdGaXhFdHVRTU4zanhRSlF3RUJFd056?=
 =?utf-8?B?STVNeGZOSDRncEo4SHVRZi82VDJwQUJMaE9zL0JvcGZZVkkxWVBqa2xZaGZy?=
 =?utf-8?B?SkRRaXZtZk51UHc1bEhOTmF1eW5mcjdRYWxmdjQ3YUpPYzUrekdRRkUzcGFw?=
 =?utf-8?B?SzhPNlJQSlhjWWozOCtGM0FuT0tqNFpXY1IxSy9RYjBqV2svcGF5RkFJc3E3?=
 =?utf-8?B?M29JZjhLZFlmNjFQcG9VMGhYTDJWTURTTE41Y3JHRTBQUHdCdUpBTzFoM2l3?=
 =?utf-8?B?UzlCczlQN1BraE90dXB2UkhCcXd5TFVObHJQWElkZXZWYXJ3ZzU5VWVVM200?=
 =?utf-8?B?TlJWeXJYQnh1YXlaUkJPanExVWdGUmp1dEovajF5Z3lIOEQvNnVDeEdVZ2pU?=
 =?utf-8?B?V3l5REZWNU1RaWxBdjJCRi9leG9NRS9mbkR4NlBSS0k3TGtnd0lOWC9tajBj?=
 =?utf-8?B?Q1VWZVlYYzNuYlZ5QVhQWjZmMytOS1c5alpKdnhuUnBRTjFmVWhxZz09?=
X-Exchange-RoutingPolicyChecked: ciNKmhx8TNdk0/G/DDRJtTFLYPzHhct+E4UKApCNOpAslVFTYXFubwAlokN/orDpWJiP6/prvOc06RP2BlDx1R11vG+1/ew4yGJI6MKzA9OuFL+4OmXY8ileMltI3E+52lHP3jRNUoMeX1wIngaWB1Ma0cEbSRvnM3iuu87ZJ3AOTh+EYMmB0x+jkWnYDNuanq1/MVUEo9Xxv9xaJchN+BgJUQ9DhmzidzYymNo9/i9ywwp07+HmovtTpGigyU1k1ugXSJrmV+Kjyb08XA6anfr8W1gcGkXKtynvVAWatC2v/sUjIyDBEuRlgekM5NeM2KFGXRnavuDTQz8qAy16PA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c8a2256-1e5b-46b0-bd98-08def1f2c651
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 06:36:54.8250 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mt8HUGgSMWC8FSlMsMaucH9VtN66YObvzWNSmF5Xi4DBSqXPNrIWY6jP5xp+iqs9WHkqMx+21ES0aGyTmosozA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4585
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


On 04-08-2026 10:42, Raag Jadav wrote:
> We use -EBADMSG for corrupted responses from sysctrl. Fix the error code.

Let's keep it -EIO as it's more appropriate for sysctrl errors and 
consistent than

#define    EBADMSG        74    /* Not a data message */

Thanks
Riana

>
> Fixes: 53a7115f9862 ("drm/xe/xe_ras: Add RAS GPU health indicator")
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_ras.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index f7af4da8172c..bdad0621ae12 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -700,7 +700,7 @@ static ssize_t gpu_health_show(struct device *dev, struct device_attribute *attr
>   	if (response.health >= XE_RAS_HEALTH_MAX) {
>   		xe_err(xe, "sysctrl: invalid health state %u\n",
>   		       response.health);
> -		return -EIO;
> +		return -EBADMSG;
>   	}
>   
>   	health = gpu_health_states[response.health];
> @@ -753,7 +753,7 @@ static ssize_t gpu_health_store(struct device *dev, struct device_attribute *att
>   	if (response.health >= XE_RAS_HEALTH_MAX) {
>   		xe_err(xe, "sysctrl: invalid health state %u\n",
>   		       response.health);
> -		return -EIO;
> +		return -EBADMSG;
>   	}
>   
>   	health = gpu_health_states[response.health];

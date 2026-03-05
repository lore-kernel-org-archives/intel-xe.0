Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E002F513EB
	for <intel-xe@archiver.kernel.org>; Thu,  5 Mar 2026 23:52:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF5B010EC85;
	Thu,  5 Mar 2026 23:52:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gLxUa1RP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A7A610EC85
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Mar 2026 23:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772754753; x=1804290753;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=B73BeGbpTcngrTCxpTczbBZ2Y212wFQtDiQj/k+07zM=;
 b=gLxUa1RPmELh4RMgNN7W0Dq3PSYJ/xZledV+qUX40bg5ZKXjje887u7G
 ho5NDa0tUw5Wv9PcPd/RG6w15pFFR8msnsxZjxouG+froo3X+7RyzAbET
 3RCV17nP2xE6YBzBvDiwarhfg0O8TTOKkE+xK2jHASg9Rw980ZweM3fnA
 UHcWpN7cJvPEGsMXAoaKpxkB8gywNO5Se7DADCNJN42AV9/JB7sZwu30H
 XbDgItwUpyDYca3RNd5Vbm6EGLvf73zHOxpgsDLtZchhPsAn6awH8LZUX
 v59w3aw/y8i6PZcTppPvOkm1mMFroLe/SzbwgJiyjgNqQRk3XkErOTtFv w==;
X-CSE-ConnectionGUID: K7PVgH04TYyb143TW44Y6Q==
X-CSE-MsgGUID: 96kShvNmSyaqNzRVlK1ZdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="72884146"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; d="scan'208";a="72884146"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 15:52:33 -0800
X-CSE-ConnectionGUID: Dy1wom4eSsi6z4w8e3WKoQ==
X-CSE-MsgGUID: XUYjFGdxS6uHJhgI0jZVIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; d="scan'208";a="217973142"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 15:52:33 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 5 Mar 2026 15:52:31 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 5 Mar 2026 15:52:31 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.4) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 5 Mar 2026 15:52:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wtEW5CaO0JyUFtCiwHpIXNk+Zqln6RLJNt0/6qEKXjnSonABlmwFMSgPjL87HJ70jkIxr4/wcu6aOnNJTO976B5o8uRgp4V/Qz1aS4YhzKmHnwe7V5Q30rfI2ckkuBr97DM51mAv3qkQ/59NypekYpeifNdFsRCswW8aaeq4hnavMJOs7RQ2X1sDOvJxNOB0Np+hMfLHA8SYaWT5YObx85YARxvWOjVxoq3OWMjrtT8vUZrgnygwfoIcoFFswT4BMaDWsEgtdjz90rjR/MD1a/CzFjqnCQ9/5DtrpWdO2mYPK+CDC8C+e8O1tYyGu6P5ePY39wmjCgMcAa3KmpVmYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5BdaiuJh0Af0HamAvGOgWvh31n0Vq5FoCiMA8K/IZlA=;
 b=W6V/TVTJE/+xGSHLX0XeQtb6+kdr5Da7TLW84CZZ37qHbaeh20qtvQo+Sq5ME/9NNkq25fgIaUQ/9ceeLmIeR6Xk9FzkqfwphV2RkenlfJu/FlDjh7dQIPUnl4ygyU9Bn1Pr2WgBt4MINRxQDvSIKYDQJwBRhp4cJk20Kz8zjgMGaEdX2ZDXzUsQ7JRlt2RhVuUETJYzmiy2xhqrBScjm0cBObtnEsuriqgEMqCI3LymW+ZOYkKjd2oULoP6doVWNtGQfv4WYD3S7xyHLGKm2vc+Gmk0XEptHoD2nKs6eXVutCBL8UWvbzNN9ZE2k18cEc1yiIuD+kTaKPUqaSVs5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by DS4PPF178D5B043.namprd11.prod.outlook.com (2603:10b6:f:fc02::d)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Thu, 5 Mar
 2026 23:52:25 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87%5]) with mapi id 15.20.9678.017; Thu, 5 Mar 2026
 23:52:25 +0000
Message-ID: <b5a1ae85-f6f4-4088-967c-a773dad9ff0c@intel.com>
Date: Thu, 5 Mar 2026 15:52:24 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 3/4] drm/xe/xe_late_bind_fw: Track firmware load status
To: Badal Nilawar <badal.nilawar@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <alexander.usyskin@intel.com>, <michael.j.ruhl@intel.com>
References: <20260305104441.2857181-6-badal.nilawar@intel.com>
 <20260305104441.2857181-9-badal.nilawar@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20260305104441.2857181-9-badal.nilawar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR05CA0070.namprd05.prod.outlook.com
 (2603:10b6:a03:74::47) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|DS4PPF178D5B043:EE_
X-MS-Office365-Filtering-Correlation-Id: d1e4402e-1290-4d17-1985-08de7b124029
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: F5Dd3YtGluRQMsAonG7pD47SxiUVptuSbgYm3A3hIzC8qWToy65UEuxXTXRx8rxD6Oi8U1zy05thNZDoGNN2XtdeX2bRk7/W7XwiVjhrAQ1swYU3YtcHXQUHNMIL8u/eO0qiLbeGubEO83a4nPo+tMGeFcqFvfAfmKhM82A8nWMfeT5XMwPzjWc231G/cfVTzFJpASUvWXY26z77n4FNslTpD7zCv41ATQM6mrMSbMBnQZVf2mxoP31yk8iPgmhCjoLTE2lOzmRLdki4m3Fzkt7hwf7izWp9HB9WtM+2VZGkzi6dj1nuufDL2+RSfWIToVMi9xn+ceEE+6MieMa0O59yM7QiRIjaJuu/R+O2aKWiRHOu5QHLQ+NZO6/PIfp3XdJadcFvtXpuKCK/H44GWpz2m216MP+03miTYmJC2egQxx6/w3jxlWqu9lwlsCl/27pFjov+jFisxd0RjHzHug/ZycYfMQPaZQ9W4fzhQ20aNIAb85+vUiPn0Cgvyq3830P+Yd/YNS7+f90ROYxAg2h4Gxfrb0xzL1WdWp+LqE0lw6FVddPUkEy5Xf3vS4YJZWr+QWB4bB/haDLdTz1BjnPGZV2K0SJslFAqzys/qNILRl/9d77gBpm2QhtHV3T56U8LfXm6DvGcXWY421J/qjL8rw5ENAd4vHB5RUd5xFhN6Aoj1laC3b2DvlUzkrsgijfhHSa8uHlQHVPNXNuIRiu1FUygODyOKtfh+myMKg0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c0IwU253UDNMVk51eitpWUpQbXMvZU9nR3Uxam5zZzA4cVd6SFNyNFR4YUdR?=
 =?utf-8?B?ZDY1S1ZORTBvVWovRGFIcDFGTmVNeGd4dndPdzBvNk9veHJGcnJFcFJPMnc3?=
 =?utf-8?B?OGpTQjJNL2E0ZGtZenRaYWUvY1NrOUhUTlpuZWJyOFVLckRoZFlWVUczVXgy?=
 =?utf-8?B?VzRpdzAyYjI5S2tJbDljYTc5UC9YdU9pWkJYUFZ3UGpyR2N2aGhNLzF0MGNj?=
 =?utf-8?B?UHF6TSttUTdBL0Z2dSs4bGFjT0luU3IzZzVYOEkyOEhPc2tGT3hoRmswQnB6?=
 =?utf-8?B?MTlpMncwVnN0SzlPK0xaYWlqR0FrL3Z4bDJVMmtOZTF6dkprSXdacEVodUFH?=
 =?utf-8?B?eHB6RUJzakNVSkxpSWtKRTFsMUR4dDg4aFF1a3Y3Y3JHUTArNllNeXM5UUxm?=
 =?utf-8?B?YTZlcTFKK0syWW1YcStXZ0tiQ082bStaMkFjd0JCSWJQTEFGbHN1NlNHTXY1?=
 =?utf-8?B?U2IycWtmelJOc21GQTJTdURDUklOT0kybTMrN1VDeng5UHJoMytFclZsd1JX?=
 =?utf-8?B?QUdXeG5temMxRnlVTExWckZZa09pcWtWYzI2QkhwQ2lhSXBrWnJXMXlQZ2Vj?=
 =?utf-8?B?SlJMVEF2RHZCMTJ1bWhUOUZpSzYyRHBubmRjSTFNUTVJK3ZGZDZvS1Z5UjNS?=
 =?utf-8?B?UEdyYkZ2a21KOUJMTXVwOHBiWUNOU3NZOHkxSnVpRmNGTHpoUWcyVlhXUUdy?=
 =?utf-8?B?UTdIOExWV252UXM4c0FVeEs3QUtXRGs0ZW82SVVXNTNMNGM2UlFHbER1Q2Q5?=
 =?utf-8?B?dXo0R2Z3REIzVGlVbWY1MEF4SVltTWZJMkh6MFp5ZHFabWFVZURtRW9meUx6?=
 =?utf-8?B?WVZYS2lnQmxvczE0WXdxdkcyS2NrcExJZjBOcTdIYkFnc29wbHRzbzhnWjdj?=
 =?utf-8?B?bVdEbU04VkYrWDIraEkxMExPejFRMjduRGZzWW43WVNLU2RsaDhwMDhBdzBE?=
 =?utf-8?B?cnRaQUN2VGNCOTdpWEQ2ck96SXZscndMWnlTL2JyM2tzL2pBQ1FkUGF4UVBT?=
 =?utf-8?B?MVNwZVJpdmVIeVUwTENFTlRmTU92dEEwYUV6UllMeW9TQjAyRXlFd3Q3Rk1n?=
 =?utf-8?B?VDExVUc2c0hqTHRuUGlqbWtqWDRSV2pwaW95ZlJBNTlQcEx2S3VRcmFjYzZz?=
 =?utf-8?B?ZGUyK29MTnMraHY0akpkR3RlSXF0cTdRbVRUSXZ4QVpCRjRvMThPYWlQRUJK?=
 =?utf-8?B?anE0QnR2SkVvUDhUMW9oZDN4MlJSZkZweTNwSnNRTzdBTXNyczhxVmJLUzdF?=
 =?utf-8?B?RkpibEFkZ2VJTFBGVjhkb3Z2VGhKTWhDZzBHbGFQREhGTkNhLzV4VVd5VW5k?=
 =?utf-8?B?aE1jWmlUK2MzdlN5Y2hVYUI2WFZkWjNKQUhHTDBGYzYvWXM1VEczNkFDUnQ0?=
 =?utf-8?B?Y3hTYUdicjVNMjhzMStyVzljdmlKYnVCaUZ5RS9lU24zTkx1cmkxbjFKc0VH?=
 =?utf-8?B?bkVFaHgxamQ3ak1XMmZJNzdVTFdWYXcxVFFad0N2NG0zKzhDYXhvZXlJVU96?=
 =?utf-8?B?d1h3RFplMjBPTWh5QlB4R3U0MlNkUnpNWGs2NmMvcjBVQUIwSzFkUWt0bmFD?=
 =?utf-8?B?WjRvZnluWldKU1hZaTViQmRDNm9XdFJoSDdHTzk2TDV4elZieFIwSk9WWHBG?=
 =?utf-8?B?SmRyOVFQN1M1RXNDZnRLK1JiTElaRWVWTk1HVHk3U0FpcGVPWFVRZTFrMjRX?=
 =?utf-8?B?R0pOVGRiSEd4RHNVZFMrZlhYbHdraythZmh1QmxLZUd0VmgzOU9rbTBKbU80?=
 =?utf-8?B?Q3M4Uk42dG9oVVkzYURrcGIydWgrUnNZNGhUZm51aTlMdkxnclNxVU16Y1A0?=
 =?utf-8?B?S3lxMjN3ZzhPR05yalNZSTR3ZGdFQlJNajF5WUVvZUJwNytScGV5dzBHWmtU?=
 =?utf-8?B?L05meXJma29Jd2VreVlFSXIxbUFCQmFDaERoVER3QXV3S0VGNDZtdXpFQ2VB?=
 =?utf-8?B?NnBmV2Z6SUdaa2tRZlBxc05PL282OTZ2TU9DNUFCcS95TlFiWlVZSkVsUnNW?=
 =?utf-8?B?RXdCUldOdjBidWFCL1lFSHM2bWxBL2NYVXhNbHdjRVlUYXRJQnZkKzhkVWww?=
 =?utf-8?B?WWgwZnpOQWZSRXA3UW9YR0phODlmNnZNZ0dWYW5pcEovbTh4cW1na2VQcXUw?=
 =?utf-8?B?RGhjbHl5ejVGeWtzRGFQVjk1QzJJaHVlZFdnZlhIb0JDREZFQzBzaHJpblZI?=
 =?utf-8?B?Vk1kVGFhb0FXOTF5d3plY1ZDVXYrZmdwdXNxeTg2eEZtNmNUWGM0SDFad3Jr?=
 =?utf-8?B?WTE4RUJPT3pWM0tFRFA2Ync3WWYyUXhTbjNJRjlwWktXT2RqN2w2dXBzc1Bx?=
 =?utf-8?B?Q1E3QmpDZVdOSmc1cys1V1hjZ2RqZ1o3cEs4ZnhYQkYzWTBwSmFZTnNpTlQx?=
 =?utf-8?Q?K9SeFHUydyuEkJcc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d1e4402e-1290-4d17-1985-08de7b124029
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 23:52:25.0387 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GRfZR3mT53HxIqsolnDJh/QgbxB7GC+bIej5RxkubPQANT3gyNqXUYFC+O0648B1vJFKS+1NyQlmBZlj/7vAPPva1VZT6QIjggO//e2A9sA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF178D5B043
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



On 3/5/2026 2:44 AM, Badal Nilawar wrote:
> In CRI, Intel PMT depends on the ocode runtime status. Track the
> late-binding firmware load status and expose an API, for xe_vsec driver,
> to query it.

I think it would be better to send this patch with the series that adds 
the xe_vsec changes, otherwise we have no idea from a review POV on how 
you plan to use the new exposed API.

> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_late_bind_fw.c       | 68 +++++++++++++++++++++-
>   drivers/gpu/drm/xe/xe_late_bind_fw.h       |  5 +-
>   drivers/gpu/drm/xe/xe_late_bind_fw_types.h | 23 ++++++++
>   drivers/gpu/drm/xe/xe_pm.c                 |  5 +-
>   4 files changed, 96 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c b/drivers/gpu/drm/xe/xe_late_bind_fw.c
> index d3ef2926517bd..87137d6e4aaec 100644
> --- a/drivers/gpu/drm/xe/xe_late_bind_fw.c
> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
> @@ -53,6 +53,32 @@ late_bind_fw_to_xe(struct xe_late_bind_fw *lb_fw)
>   	return container_of(lb_fw, struct xe_device, late_bind.late_bind_fw[lb_fw->id]);
>   }
>   
> +static const char *xe_late_bind_fw_status_to_str(enum xe_late_bind_fw_status status)
> +{
> +	switch (status) {
> +	case XE_LB_FW_NOT_SUPPORTED:
> +		return "Not Supported";
> +	case XE_LB_FW_AVAILABLE:
> +		return "Available";
> +	case XE_LB_FW_RUNNING:
> +		return "Running";
> +	case XE_LB_FW_FAILED:
> +		return "Failed";
> +	default:
> +		return "Unknown";
> +	}
> +}
> +
> +static void xe_late_bind_change_fw_status(struct xe_late_bind_fw *lb_fw,
> +					  enum xe_late_bind_fw_status status)
> +{
> +	struct xe_device *xe = late_bind_fw_to_xe(lb_fw);
> +
> +	lb_fw->__status = status;
> +	drm_dbg(&xe->drm, "%s firmware status changed to %s\n",
> +		fw_id_to_name[lb_fw->id], xe_late_bind_fw_status_to_str(status));
> +}
> +
>   /* Refer to the "Late Bind based Firmware Layout" documentation entry for details */
>   static int parse_cpd_header(struct xe_late_bind_fw *lb_fw,
>   			    const void *data, size_t size, const char *manifest_entry)
> @@ -235,6 +261,13 @@ static void xe_late_bind_wait_for_worker_completion(struct xe_late_bind *late_bi
>   			drm_dbg(&xe->drm, "Flush work: load %s firmware\n",
>   				fw_id_to_name[lbfw->id]);
>   			flush_work(&lbfw->work);
> +
> +			/*
> +			 * flush is being called during component unbind, suspend etc.
> +			 * So mark status XE_LB_FW_RUNNING -> XE_LB_FW_AVAILABLE
> +			 */
> +			if (lbfw->__status == XE_LB_FW_RUNNING)
> +				xe_late_bind_change_fw_status(lbfw, XE_LB_FW_AVAILABLE);

I am not convinced that this is the correct place for this. We might 
have cases in the future where we want to do a flush without clearing 
the state (e.g. before a reset).
Also, in the suspend scenario you're already adding xe_late_bind_fw_stop.

>   		}
>   	}
>   }
> @@ -282,6 +315,7 @@ static void xe_late_bind_work(struct work_struct *work)
>   	if (!ret) {
>   		drm_dbg(&xe->drm, "Load %s firmware successful\n",
>   			fw_id_to_name[lbfw->id]);
> +		xe_late_bind_change_fw_status(lbfw, XE_LB_FW_RUNNING);
>   		goto out;
>   	}
>   
> @@ -294,10 +328,23 @@ static void xe_late_bind_work(struct work_struct *work)
>   	/* Do not re-attempt fw load */
>   	drmm_kfree(&xe->drm, (void *)lbfw->payload);
>   	lbfw->payload = NULL;
> +	xe_late_bind_change_fw_status(lbfw, XE_LB_FW_FAILED);
>   out:
>   	xe_pm_runtime_put(xe);
>   }
>   
> +static void  xe_late_bind_fw_stop(struct xe_late_bind *late_bind)
> +{
> +	struct xe_late_bind_fw *lbfw;
> +	int fw_id;
> +
> +	for (fw_id = 0; fw_id < XE_LB_FW_MAX_ID; fw_id++) {
> +		lbfw = &late_bind->late_bind_fw[fw_id];
> +		if (lbfw->payload && lbfw->status == XE_LB_FW_RUNNING)
> +			xe_late_bind_change_fw_status(lbfw, XE_LB_FW_AVAILABLE);
> +	}
> +}
> +
>   static int xe_late_bind_fw_load(struct xe_late_bind *late_bind)
>   {
>   	struct xe_device *xe = late_bind_to_xe(late_bind);
> @@ -331,6 +378,7 @@ static int __xe_late_bind_fw_init(struct xe_late_bind *late_bind, u32 fw_id)
>   	lb_fw->id = fw_id;
>   	lb_fw->type = fw_id_to_type[lb_fw->id];
>   	lb_fw->flags &= ~INTEL_LB_FLAG_IS_PERSISTENT;
> +	xe_late_bind_change_fw_status(lb_fw, XE_LB_FW_NOT_SUPPORTED);
>   
>   	if (lb_fw->type == INTEL_LB_TYPE_FAN_CONTROL) {
>   		ret = xe_late_bind_fw_num_fans(late_bind, &num_fans);
> @@ -379,6 +427,7 @@ static int __xe_late_bind_fw_init(struct xe_late_bind *late_bind, u32 fw_id)
>   	memcpy((void *)lb_fw->payload, fw->data, lb_fw->payload_size);
>   	release_firmware(fw);
>   	INIT_WORK(&lb_fw->work, xe_late_bind_work);
> +	xe_late_bind_change_fw_status(lb_fw, XE_LB_FW_AVAILABLE);
>   
>   	return 0;
>   }
> @@ -445,15 +494,30 @@ static void xe_late_bind_remove(void *arg)
>   	}
>   }
>   
> -void xe_late_bind_pm_suspend(struct xe_late_bind *late_bind)
> +/**
> + * xe_late_bind_ocode_status() - get ocode late bind firmware status
> + * @xe: pointer to xe device.
> + *
> + * Return: 0 if unsupported, 1 if available, 2 if running, 3 if failed.

This returns a value from xe_late_bind_fw_status, so might be worth just 
saying that.
also, you haven't defined the enum as starting from 0.

Daniele

> + */
> +int xe_late_bind_ocode_status(struct xe_device *xe)
> +{
> +	struct xe_late_bind_fw *lbfw = &xe->late_bind.late_bind_fw[XE_LB_FW_OCODE];
> +
> +	return lbfw->status;
> +}
> +
> +void xe_late_bind_pm_suspend(struct xe_late_bind *late_bind, bool is_runtime)
>   {
>   	if (!late_bind->component_added)
>   		return;
>   
>   	if (late_bind->disable)
>   		return;
> +	if (!is_runtime)
> +		xe_late_bind_wait_for_worker_completion(late_bind);
>   
> -	xe_late_bind_wait_for_worker_completion(late_bind);
> +	xe_late_bind_fw_stop(late_bind);
>   }
>   
>   void xe_late_bind_pm_resume(struct xe_late_bind *late_bind)
> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.h b/drivers/gpu/drm/xe/xe_late_bind_fw.h
> index 8896fea3068e5..b441f5789f24b 100644
> --- a/drivers/gpu/drm/xe/xe_late_bind_fw.h
> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw.h
> @@ -9,9 +9,10 @@
>   #include <linux/types.h>
>   
>   struct xe_late_bind;
> +struct xe_device;
>   
>   int xe_late_bind_init(struct xe_late_bind *late_bind);
> -void xe_late_bind_pm_suspend(struct xe_late_bind *late_bind);
> +void xe_late_bind_pm_suspend(struct xe_late_bind *late_bind, bool is_runtime);
>   void xe_late_bind_pm_resume(struct xe_late_bind *late_bind);
> -
> +int xe_late_bind_ocode_status(struct xe_device *xe);
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
> index a128e3f638a6c..4cdbd775b103e 100644
> --- a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
> @@ -26,6 +26,20 @@ enum xe_late_bind_fw_id {
>   	XE_LB_FW_MAX_ID
>   };
>   
> +/**
> + * enum xe_late_bind_fw_status - enum to determine late binding fw status
> + */
> +enum xe_late_bind_fw_status {
> +	/** @XE_LB_FW_NOT_SUPPORTED: firmware not available/supported */
> +	XE_LB_FW_NOT_SUPPORTED,
> +	/** @XE_LB_FW_AVAILABLE: firmware found and copied to memory */
> +	XE_LB_FW_AVAILABLE,
> +	/** @XE_LB_FW_RUNNING: firmware is running */
> +	XE_LB_FW_RUNNING,
> +	/** @XE_LB_FW_FAILED: firmware load is failed */
> +	XE_LB_FW_FAILED,
> +};
> +
>   /**
>    * struct xe_late_bind_fw
>    */
> @@ -46,6 +60,15 @@ struct xe_late_bind_fw {
>   	struct work_struct work;
>   	/** @version: late binding blob manifest version */
>   	struct gsc_version version;
> +	union {
> +		/** @status: firmware load status */
> +		const enum xe_late_bind_fw_status status;
> +		/**
> +		 * @__status: private firmware load status - only to be used
> +		 * by firmware loading code
> +		 */
> +		enum xe_late_bind_fw_status __status;
> +	};
>   };
>   
>   /**
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index f85b12c1a85d2..9aa873f57b5ad 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -182,7 +182,7 @@ int xe_pm_suspend(struct xe_device *xe)
>   	if (err)
>   		goto err;
>   
> -	xe_late_bind_pm_suspend(&xe->late_bind);
> +	xe_late_bind_pm_suspend(&xe->late_bind, false);
>   
>   	for_each_gt(gt, xe, id)
>   		xe_gt_suspend_prepare(gt);
> @@ -612,6 +612,9 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
>   			goto out_resume;
>   	}
>   
> +	if (xe->d3cold.allowed)
> +		xe_late_bind_pm_suspend(&xe->late_bind, true);
> +
>   	xe_irq_suspend(xe);
>   
>   	xe_display_pm_runtime_suspend_late(xe);


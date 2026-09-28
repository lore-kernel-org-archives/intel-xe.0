Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6D83C9833E
	for <intel-xe@archiver.kernel.org>; Mon, 28 Sep 2026 09:00:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CD6310E85B;
	Mon, 28 Sep 2026 09:00:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nYybx2jd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9CBE10E85B
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Sep 2026 09:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790586006; x=1822122006;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=G98XtWCd6pfweTP98zxRA8hEZ7DLvhpzq8lNXNDnHUw=;
 b=nYybx2jddmvGnfLoeSrxX8Uizd03wI8qgQQddwVs4h+r5vARO07DTXuQ
 8jbx/ZOGoEs0q73BeMiMZHZhj0nJedFCCMd6JWM6WlIFv8D3a1eYKY2Zu
 ugVPKTTtbKM5dgZc+5Sp/56xGgeLTyeN6nuNY2Ar8F0JKnzm5UfkhZfAo
 PMC86f0RTMlnMMHUdHJ5Lz8ooCTorhe2Ew1iw9DjPFtLolYXp+KpyxE+U
 poRpeyxn9oWbpjhn5Fd8wA1C8kcZW0WTCfruaFnC6ZE5mki9h5p/xefmw
 D3h1dN+L5NnJbuZDZCNDdLY4SD98jCtjf9c64et7s3B/CTvaimqfzQGN/ A==;
X-CSE-ConnectionGUID: SXE1Xt/ATjifzffUR6lWjw==
X-CSE-MsgGUID: 39dTQHYDRP64IA905AApmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11918"; a="90183474"
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; d="scan'208";a="90183474"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 02:00:06 -0700
X-CSE-ConnectionGUID: 0o048J8DQSikf98aCrMNCw==
X-CSE-MsgGUID: pWZBKRE5Qr+47e6pJJAlZA==
X-ExtLoop1: 1
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 02:00:06 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 28 Sep 2026 02:00:05 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 28 Sep 2026 02:00:05 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.24) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 28 Sep 2026 02:00:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lLbOPiZm7wbkChM8IgV7yW6RWirp32vYkIfpjDwkgLS9yytN3FZmENb1sn38XR1XQuY5/Hqk6ckZXtBtNmi6PkcuWWL51PoGyGDxREmJOYmMHnYMaoi0acnCIzYNWp7iuYWKLW8ejN6iU5OHFI4HA7HHC3cKwoMswFlKe9CQqd2ZHvfNXaY3iA8Lace3lpjXjkRH35zCKToaWDbFEpyc1nSW6G57cbgkkFftbxo0IRhEn7nGTUiQz+2CdjwplWOWSPhI52BdeXSvHOZ3vcNHogEu98YrkOtDR6iif8ROWMGu8N2ZtKiYLaXJnalp3ThFx+vWWfqqCzl6Hq0nwXajGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=35MLL7MaMgv8L8i06Q4u//ZtPvu4xEa8oewo1XbBPGs=;
 b=NhSGikYhyPIgJl07LxpvQTH42V2h3Ew1NXhydpo5euGtJ03YOgWd+aEoa3r1z7SRQlIuRhGHFwi4rRufz1Q+720CBub0abgrxvc66uNHo2RS7LHLGpa9Z6/nCWJICAKlpCjH2JjIJazoTMMppcb2GOEjn4sSehpbTshjb2QgmdnGasUxov3rm2kr/xmb2G74U9+IPMlKyeWXMHbQ2KebzM56LeGliq4Dluk0H1SubSADmmvHgnss2JovWtRQi75ilQOvoGvIV0fbIUEGkuGvpipEdu8LxkZHL7dHYvsnigvuqdmJ4Wlwd5mJS+wIPg6D5V1+C+KrE9/sT3WK9V2hbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by MN6PR11MB8145.namprd11.prod.outlook.com
 (2603:10b6:208:474::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 09:00:04 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::5a5c:9c7a:cd1d:d687]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::5a5c:9c7a:cd1d:d687%6]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 09:00:04 +0000
Message-ID: <b638e726-8768-497b-bdea-975b64c4ae43@intel.com>
Date: Mon, 28 Sep 2026 14:29:55 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/6] drm/xe: Separate drm-ras netlink data from device
 and firmware RAS state
To: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <badal.nilawar@intel.com>,
 <raag.jadav@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <mallesh.koujalagi@intel.com>, <tejas.upadhyay@intel.com>
References: <20260928061830.417395-8-riana.tauro@intel.com>
 <20260928061830.417395-11-riana.tauro@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20260928061830.417395-11-riana.tauro@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0057.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::15) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|MN6PR11MB8145:EE_
X-MS-Office365-Filtering-Correlation-Id: e2607a43-540a-428f-6a57-08df1d3ee2ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|22082099003|18002099003|4143699003|10067099003|260925021911599003|260925021311599003|260925022911599003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: e8I+ukbXpGKNyajryBtiXgBcNUH5vsCyZu2DNTHzg9rLHkZHvcgRg8k2qdf2fE+6bJwIfcTZpIUVWQmsq20uoAIOudW4XJ3/K5CIHno3GFSL4jwvj9OObr+D7MhfssLrh0Xtoa9sul4rzwcvOoXPIF2ToXN1VpLZuGzU+7xkWmYgKHEwFykjPubK01rQPc+GdCw/pTTQRGe7fxJfsOYZ2/0qQUdcj7w+s9U259CoS7ivMfXa/ToUKXw48sM7powKAOsHwH8x/NSEXZnKa8VP3WAJ+3YnrKi2Tmrf7hkrCUXl/rmXQW2HONJktrQC6JctQx1jrtI4TPdAhdVbFQaVtAJzMa3zbynLrjGrrKKzQ+cCHEi+SjUJ6LWknxRi+cpy8LAEiFLmjyowu18MDOLZ63fhQJyrYW1r01kiL3A4IKsCQJWZbcbjpWYJiWKySOpJU2LPgTac/if6pdk55LnIeRVGGGsOfjMrF0p9bw793L6WmCDowp9fUGCqmNKL84XzSOwiCRX8FvL5NEZtVTy5wC/hU+yZ/ypt8ArTHpUJU1IeL5oRaso6dGntI8AxZ2tWxr+IhTE+RI+E11TP4C2OZeeUMMOGmZeUHxp9JY0SF5FGUp5ttkF7+xZifkZjEDjB98TRRqbSacN0q2Mlvpe6CBWrCkFyx+olRBWNFvxIb4Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(22082099003)(18002099003)(4143699003)(10067099003)(260925021911599003)(260925021311599003)(260925022911599003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c0ZVNHRSV0pHeDlwT3BLM2NHK3N0eUJUQjdoNm1mUEg2bE1BbTN6bGY2K0pq?=
 =?utf-8?B?ekQzZW8rUjNNOGxxTjA2RmdJS05Kd2dUOEgwcmNBcklocXJnYzFpK0tmRFFT?=
 =?utf-8?B?aDJCUjE1Z3pZVW5icmxzRk9RVGhNc09PbHNhTEdjNWx3YTRTR2dxWmJGZ21s?=
 =?utf-8?B?SXlxcjlXL1B1LzFhS1IyM3ExWFpOMWUzTmIrRWpoQ0ZXWFBqaHI1ZVVRWFU0?=
 =?utf-8?B?LzVPYS9ZckRhR0ZQcitzY1dlemRnZUJEbUNta2grSk5wWjIwZGlRVE12VUNE?=
 =?utf-8?B?dEhpSERMMTNycFYzTUZUTGNzTXlzUkN4YWNzeWJZa1NvTExUeHNpQmxLdEdK?=
 =?utf-8?B?RmNHMHA5YThVOEZvVHUwV00rbkFtcTZVWDRkNlcwY25XeUZDNGdUeEVlTGNB?=
 =?utf-8?B?VVVZMU5XZzVyN2p0WHJCclF6S3kxdWhaMVdFV1RGdVRiOXh3QmZyUEJvTHZ6?=
 =?utf-8?B?MDAwWWowaXBiZ0dxOERYa2Nibk91WTRtdi9NbXltMk82YlgzYXMxNG9wRmpI?=
 =?utf-8?B?WlNvWXBURXl2cEFzM05LYW9wdGFnVm5lK2NVZENjN0YwY2tKdjBvQzZRUi82?=
 =?utf-8?B?QklyR2ExZCs0ajV5b3ZqSmxwTFNtNGtnSFBjelFvV2ViTENXc2xRNXJVR2hy?=
 =?utf-8?B?TE5OcndSY2hXNml2RkhETVlxZnQ0ZmxIT2MvYXdnNWM0a01LL2N0Sk50ektj?=
 =?utf-8?B?YzZmU0RuMEMxM3BmVVU3czMxeFVMRXFnVXhidmpEUGE2eXNyU3dXSnY5THBy?=
 =?utf-8?B?RDRjTkF0b0FsMG5lTWxiTTh4Zyt4Ly85NXNhOXBHNkNVdWxiZmRaYzh5dWY0?=
 =?utf-8?B?OTdSbm5vTG9Fc0MremFEMUQrM3VMdWw1QlZFWDdDRXg3UUpzTExJMWxtTlBO?=
 =?utf-8?B?QnpBbklXSmRwNGhzQ0gyUUpWaWJkNG5qbjZmTUhYSGQ4VStobUU5Y2NqM09F?=
 =?utf-8?B?L0QrVWpUMldQdkpzSzZwYTdHazhFS3hYZ2MvYi9pQ2o3RUhWZlNzUkZEVkhS?=
 =?utf-8?B?REo2c3d0dWF3cnJHZ3Y0YnhHTExGdnhhdVVDSWtRSkpjcWpEYy9sdjZ1VGpE?=
 =?utf-8?B?S1VyQ01ycEhpY1FRbnRsdmVMSzFYdEdkcnNkTE1SUFcwRVNwRXJmZE5wRXNF?=
 =?utf-8?B?ZEdBSmE1ZjRudFJzc1NjVjVlbWpYclo4RnlDc3dNSFk4Y1V0QlBjR09qWUJu?=
 =?utf-8?B?cGdpUmY5eGNBbnl5TmJRL0hyK2lJVUIxaGJNSFV4Z09tODVmQ2JWM2wxNXVF?=
 =?utf-8?B?dG1wQ1cvNWIzNGdzckNINmN1b0V4L204ekc5NENKbmg5Y3V0TEdmZlBIWUV5?=
 =?utf-8?B?NHdoaWw3Wll1RkI2bXNNdlA3RmhrdmFxeUVYNGY1Y0RTS0I1WDhFSFJSUURo?=
 =?utf-8?B?TERpOHBCUXFIYXVOQ3ZYYnZjbVVuayt4dHA5S3pQS2s0OTdiUzd4c1QrZVhH?=
 =?utf-8?B?VnZVQnE3RDFzc25hUHZVaVpXVXg0TUhpTUFMSkF4bFlFMU04bUg3V3J3d3Jr?=
 =?utf-8?B?R21XajRta0tacFd0ZURuNThlSU56d2djK2dBakxwNFkrLy85Qm5YSi9xcGM3?=
 =?utf-8?B?bGpFQldpOHUvcVdJVFFEcEVMZEVOcVkra2JoVzJpYWFYUGU1UEl4ZSs5QW02?=
 =?utf-8?B?cUJ3OFo0ZkNZNjZFcSt3b1NEWXUvTTJNT3NZL0JscUl0dWhBUGRUN08zVUpT?=
 =?utf-8?B?WFM0RGJURzlhUjU0MXRHN3MwenlWZGR5bW96YWwxTXpkNlp3bElDaFlKL0pB?=
 =?utf-8?B?QXNhVDlRZkhZcW8vWlRNWGFPNURsb3NBb3M1Q3h3WnpTS1gxTHZLNzBSeHZE?=
 =?utf-8?B?SjFzQjhrbzkxcDR1MHZYSDdxaXA1K1cvVGhwbmhPM2d6UFhlRjFmTFAzVkNv?=
 =?utf-8?B?QjlmM01EeWp5TllRU2dBNVg3TmdRUDhRaHZrZnkyT0tVUVlubjN1aFVjRlow?=
 =?utf-8?B?ZVRsK1NYQ1pnVTEyWHQxRURuTHNRNE92R2xFNEZFcWNUYjE5MWhsOTArQXBZ?=
 =?utf-8?B?d3BJWnZvamMzcVhoM25sUE41MTdXQXJKY1dsTllZa1crZjhIdkFzbFB5bmhZ?=
 =?utf-8?B?Rm1RaGh3MnVlb1I1RTRxSGlPZFVaTXFZWVY4UFVZdjNsRFFxNkllbzB3NlhT?=
 =?utf-8?B?VzJWTVJKaWxBbHl4aHh5QUhpb1llcTVId1V1Uy9DQm9RTDB4Q01kN1dsTGds?=
 =?utf-8?B?clAwVmZCNXU5eVFnd2pxTmkvL0FpMjN6WXl6VzlJdThWY042SStFYnQyRDho?=
 =?utf-8?B?QUcwQWNPNzd1NGM2RUhxYXpNUVhCWGd3cDNFV1VKZnRFWEZMUVg1R2ZvZkcz?=
 =?utf-8?B?eW5CMTFuY3VQNisrclduSWxwbUsyWUVoc0pnL2x1ZGJZNytlTlE2UTRkbWdZ?=
 =?utf-8?Q?fdS5xOZEgugHuPwE=3D?=
X-Exchange-RoutingPolicyChecked: xTZTqJDHEdCJbQUn47TZTlb0dXMEMvxKh6ZUJrHBl2XJWhfMc2f0G2xgRtSJBTsSO9DMXnf1d5amB2ogSuMUwxjski0C5KcQN8MaveHotptvxWKqDHLCUcqxyXAAvh/0MYVmg/KquVqJXZE3cMawinIE+Mh6crDC6XJVR2AzzUPycc8QnQCGss8OyHUrdfg2xy1qaaA+oDGeyPxPEKCLnOw9GFNWOdznOOxC3qgMVyZ8eoZPATw5vg9R6DcLXGdc82JK04njPrHMETvbbsaRbML63q9urXprtCdbgDDCaUMwkZ6rfIsx4gg+jW8+Of93TU4oihCdIcXic6UDGI9kZA==
X-MS-Exchange-CrossTenant-Network-Message-Id: e2607a43-540a-428f-6a57-08df1d3ee2ab
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 09:00:03.9930 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d6/XFInf3/Do4EqILNncbOfbTzOzH8YpvF5wq/kNglZFE68+uWpw30/r5dDiEftyfRaSkJqjSunRwFrst89W9OFB/O51chXFN5Y9PtTDctI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8145
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



On 28-09-2026 11:48, Riana Tauro wrote:
> Keep the DRM RAS data used for netlink reporting separate from the
> device and firmware RAS state in xe_device.
> 
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
> v2: remove inline function (Himal)
> ---
>   drivers/gpu/drm/xe/xe_device_types.h  | 11 +++++++++--
>   drivers/gpu/drm/xe/xe_drm_ras.c       | 16 ++++++++--------
>   drivers/gpu/drm/xe/xe_drm_ras_types.h |  3 ---
>   drivers/gpu/drm/xe/xe_hw_error.c      |  6 +++---
>   drivers/gpu/drm/xe/xe_ras.c           | 26 ++++++++++++++++++--------
>   drivers/gpu/drm/xe/xe_ras.h           |  2 ++
>   drivers/gpu/drm/xe/xe_ras_types.h     | 10 ++++++++++
>   drivers/gpu/drm/xe/xe_ttm_vram_mgr.c  |  3 ++-
>   8 files changed, 52 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index bb4234f00453..c0b53af9bdd6 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -21,6 +21,7 @@
>   #include "xe_platform_types.h"
>   #include "xe_pmu_types.h"
>   #include "xe_pt_types.h"
> +#include "xe_ras_types.h"
>   #include "xe_sriov_pf_types.h"
>   #include "xe_sriov_types.h"
>   #include "xe_sriov_vf_types.h"
> @@ -570,8 +571,14 @@ struct xe_device {
>   	/** @pmu: performance monitoring unit */
>   	struct xe_pmu pmu;
>   
> -	/** @ras: RAS structure for device */
> -	struct xe_drm_ras ras;
> +	/** @ras: RAS (Reliability, Availability, Serviceability) structures */
> +	struct {
> +		/** @ras.nl_data: drm-ras netlink data */
> +		struct xe_drm_ras nl_data;
> +
> +		/** @ras.state: RAS device and firmware state */
> +		struct xe_ras_state state;
> +	} ras;
>   
>   	/** @i2c: I2C host controller */
>   	struct xe_i2c *i2c;
> diff --git a/drivers/gpu/drm/xe/xe_drm_ras.c b/drivers/gpu/drm/xe/xe_drm_ras.c
> index 7f3695707611..38d77561facf 100644
> --- a/drivers/gpu/drm/xe/xe_drm_ras.c
> +++ b/drivers/gpu/drm/xe/xe_drm_ras.c
> @@ -20,7 +20,7 @@ static int query_error_counter(struct xe_device *xe,
>   			       enum drm_xe_ras_error_severity severity,
>   			       u32 error_id, const char **name, u32 *val)
>   {
> -	struct xe_drm_ras *ras = &xe->ras;
> +	struct xe_drm_ras *ras = &xe->ras.nl_data;
>   	struct xe_drm_ras_counter *info = ras->info[severity];
>   
>   	if (!info || !info[error_id].name)
> @@ -41,7 +41,7 @@ static int clear_error_counter(struct xe_device *xe,
>   			       enum drm_xe_ras_error_severity severity,
>   			       u32 error_id)
>   {
> -	struct xe_drm_ras *ras = &xe->ras;
> +	struct xe_drm_ras *ras = &xe->ras.nl_data;
>   	struct xe_drm_ras_counter *info = ras->info[severity];
>   
>   	if (!info || !info[error_id].name)
> @@ -90,7 +90,7 @@ static int query_correctable_error_threshold(struct drm_ras_node *ep, u32 error_
>   					     const char **name, u32 *threshold)
>   {
>   	struct xe_device *xe = ep->priv;
> -	struct xe_drm_ras *ras = &xe->ras;
> +	struct xe_drm_ras *ras = &xe->ras.nl_data;
>   	struct xe_drm_ras_counter *info = ras->info[DRM_XE_RAS_ERR_SEV_CORRECTABLE];
>   
>   	if (!info || !info[error_id].name)
> @@ -106,7 +106,7 @@ static int query_correctable_error_threshold(struct drm_ras_node *ep, u32 error_
>   static int set_correctable_error_threshold(struct drm_ras_node *ep, u32 error_id, u32 threshold)
>   {
>   	struct xe_device *xe = ep->priv;
> -	struct xe_drm_ras *ras = &xe->ras;
> +	struct xe_drm_ras *ras = &xe->ras.nl_data;
>   	struct xe_drm_ras_counter *info = ras->info[DRM_XE_RAS_ERR_SEV_CORRECTABLE];
>   
>   	if (!info || !info[error_id].name)
> @@ -142,7 +142,7 @@ static int assign_node_params(struct xe_device *xe, struct drm_ras_node *node,
>   			      const enum drm_xe_ras_error_severity severity)
>   {
>   	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> -	struct xe_drm_ras *ras = &xe->ras;
> +	struct xe_drm_ras *ras = &xe->ras.nl_data;
>   	const char *device_name;
>   
>   	device_name = kasprintf(GFP_KERNEL, "%04x:%02x:%02x.%d",
> @@ -190,7 +190,7 @@ static void cleanup_node(struct drm_device *drm, void *node)
>   
>   static int register_nodes(struct xe_device *xe)
>   {
> -	struct xe_drm_ras *ras = &xe->ras;
> +	struct xe_drm_ras *ras = &xe->ras.nl_data;
>   	struct drm_ras_node *node;
>   	int i, ret;
>   
> @@ -230,7 +230,7 @@ static int register_nodes(struct xe_device *xe)
>    */
>   void xe_drm_ras_event(struct xe_device *xe, u32 component, u32 severity, u32 value)
>   {
> -	struct xe_drm_ras *ras = &xe->ras;
> +	struct xe_drm_ras *ras = &xe->ras.nl_data;
>   	struct xe_drm_ras_counter *info = ras->info[severity];
>   	struct drm_ras_node *node;
>   	int ret;
> @@ -260,7 +260,7 @@ void xe_drm_ras_event(struct xe_device *xe, u32 component, u32 severity, u32 val
>    */
>   int xe_drm_ras_init(struct xe_device *xe)
>   {
> -	struct xe_drm_ras *ras = &xe->ras;
> +	struct xe_drm_ras *ras = &xe->ras.nl_data;
>   	struct drm_ras_node *node;
>   	int err;
>   
> diff --git a/drivers/gpu/drm/xe/xe_drm_ras_types.h b/drivers/gpu/drm/xe/xe_drm_ras_types.h
> index 0be218ba2db7..8d729ad6a264 100644
> --- a/drivers/gpu/drm/xe/xe_drm_ras_types.h
> +++ b/drivers/gpu/drm/xe/xe_drm_ras_types.h
> @@ -43,9 +43,6 @@ struct xe_drm_ras {
>   
>   	/** @info: info array for all types of errors */
>   	struct xe_drm_ras_counter *info[DRM_XE_RAS_ERR_SEV_MAX];
> -
> -	/** @disable_vram_page_offline: cached configfs policy, immutable after init */
> -	bool disable_vram_page_offline;
>   };
>   
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
> index 5f2abc9485ff..f53a6b3055de 100644
> --- a/drivers/gpu/drm/xe/xe_hw_error.c
> +++ b/drivers/gpu/drm/xe/xe_hw_error.c
> @@ -240,7 +240,7 @@ static void log_soc_error(struct xe_tile *tile, const char * const *reg_info,
>   {
>   	const char *severity_str = error_severity[severity];
>   	struct xe_device *xe = tile_to_xe(tile);
> -	struct xe_drm_ras *ras = &xe->ras;
> +	struct xe_drm_ras *ras = &xe->ras.nl_data;
>   	struct xe_drm_ras_counter *info = ras->info[severity];
>   	const char *name;
>   
> @@ -260,7 +260,7 @@ static void gt_hw_error_handler(struct xe_tile *tile, const enum hardware_error
>   {
>   	const enum drm_xe_ras_error_severity severity = hw_err_to_severity(hw_err);
>   	struct xe_device *xe = tile_to_xe(tile);
> -	struct xe_drm_ras *ras = &xe->ras;
> +	struct xe_drm_ras *ras = &xe->ras.nl_data;
>   	struct xe_drm_ras_counter *info = ras->info[severity];
>   	struct xe_mmio *mmio = &tile->mmio;
>   	unsigned long err_stat = 0;
> @@ -422,7 +422,7 @@ static void hw_error_source_handler(struct xe_tile *tile, const enum hardware_er
>   	const enum drm_xe_ras_error_severity severity = hw_err_to_severity(hw_err);
>   	const char *severity_str = error_severity[severity];
>   	struct xe_device *xe = tile_to_xe(tile);
> -	struct xe_drm_ras *ras = &xe->ras;
> +	struct xe_drm_ras *ras = &xe->ras.nl_data;
>   	struct xe_drm_ras_counter *info = ras->info[severity];
>   	unsigned long flags, err_src;
>   	u32 err_bit;
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index 752754f09314..9a1a8190578b 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -1094,6 +1094,17 @@ static const struct attribute_group gpu_health_group = {
>   	.attrs = gpu_health_attrs,
>   };
>   
> +/**
> + * xe_ras_get_disable_page_offline - Get the page offline user policy
> + * @xe: xe device instance
> + *
> + * Return: true if the page offline policy is disabled, false otherwise.
> + */
> +bool xe_ras_get_disable_page_offline(struct xe_device *xe)
> +{
> +	return xe->ras.state.disable_page_offline;
> +}
> +
>   /**
>    * xe_ras_init - Initialize Xe RAS
>    * @xe: xe device instance
> @@ -1104,19 +1115,18 @@ void xe_ras_init(struct xe_device *xe)
>   {
>   	int ret;
>   
> -	/*
> -	 * TODO: Replace platform check with xe->info.has_disable_vram_page_offline
> -	 * once the feature flag is plumbed through device info.
> -	 */
> -	if (xe->info.platform == XE_CRESCENTISLAND)
> -		xe->ras.disable_vram_page_offline =
> -			xe_configfs_get_disable_vram_page_offline(to_pci_dev(xe->drm.dev));
> -
>   	xe_drm_ras_init(xe);
>   
>   	if (!xe->info.has_sysctrl)
>   		return;
>   
> +	/*
> +	 * TODO: Replace platform check with xe->info.has_disable_vram_page_offline
> +	 * once the feature flag is plumbed through device info.
> +	 */
> +	xe->ras.state.disable_page_offline =
> +		xe_configfs_get_disable_vram_page_offline(to_pci_dev(xe->drm.dev));
> +
>   	if (IS_ENABLED(CONFIG_PCIEAER))
>   		ras_usp_aer_init(xe);
>   
> diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h
> index 0b8669f28d56..ac1253d6ead9 100644
> --- a/drivers/gpu/drm/xe/xe_ras.h
> +++ b/drivers/gpu/drm/xe/xe_ras.h
> @@ -7,6 +7,7 @@
>   #define _XE_RAS_H_
>   
>   #include <linux/types.h>
> +
>   #include "xe_ras_types.h"
>   
>   struct xe_device;
> @@ -20,5 +21,6 @@ int xe_ras_get_threshold(struct xe_device *xe, u8 severity, u8 component, u32 *t
>   int xe_ras_set_threshold(struct xe_device *xe, u8 severity, u8 component, u32 threshold);
>   void xe_ras_init(struct xe_device *xe);
>   enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe);
> +bool xe_ras_get_disable_page_offline(struct xe_device *xe);
>   
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
> index 021ffbd6d4e2..40224db38906 100644
> --- a/drivers/gpu/drm/xe/xe_ras_types.h
> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
> @@ -406,4 +406,14 @@ struct xe_ras_set_health_response {
>   	/** @reserved1: Reserved for future use */
>   	u32 reserved1[2];
>   } __packed;
> +
> +/* Device structures */
> +
> +/**
> + * struct xe_ras_state - RAS device and firmware state
> + */
> +struct xe_ras_state {
> +	/** @disable_page_offline: cached configfs policy, immutable after init */
> +	bool disable_page_offline;
> +};
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> index 9a514d983e90..2c4722a956a0 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> @@ -24,6 +24,7 @@
>   #include "xe_mmio.h"
>   #include "xe_pm.h"
>   #include "xe_printk.h"
> +#include "xe_ras.h"
>   #include "xe_res_cursor.h"
>   #include "xe_ttm_stolen_mgr.h"
>   #include "xe_ttm_vram_mgr.h"
> @@ -933,7 +934,7 @@ int xe_ttm_vram_handle_addr_fault(struct xe_device *xe, u64 addr)
>   	vram_mgr = &vr->ttm;
>   	mm = &vram_mgr->mm;
>   
> -	if (xe->ras.disable_vram_page_offline) {
> +	if (xe_ras_get_disable_page_offline(xe)) {
>   		xe_err(xe, "0x%llx is reported as corrupted address by HW\n",
>   		       addr);

Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

>   		return -EOPNOTSUPP;


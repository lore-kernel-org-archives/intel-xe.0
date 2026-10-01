Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CD3ECA5FCB
	for <intel-xe@archiver.kernel.org>; Thu,  1 Oct 2026 12:11:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D008010E1DA;
	Thu,  1 Oct 2026 12:11:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ezBWrcef";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18DF010E1DA
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Oct 2026 12:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790856700; x=1822392700;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Xns1xZa6t0g3O8tKPs0tXllyMTgL6WpcxQXwMS93R60=;
 b=ezBWrcefSNGs5N0aX6fBQaFAu5CHbw+rwilZJG7AW0gWGYGpbFL1mT26
 2uIwRXu+akz5PUEnLOZmfUT/e5o3vH6LGXsj8W0Mk51KjAKBoRMfbDMiN
 L7bLslMayMr8SXsdZCu9yMBFBC0/R5vHeyK14emfnVkW7wU9PTEHVVM7s
 qjCiETqL+hso0YpYIxmL5YEjg+tXcqYTEfOt+h0jYSvo2wUw+47d83UuO
 LkKbizVer/mxOM0gr9oUHGg+YAlflisLAjkjYB9GcRmBQBeCMuEupZzPt
 CVjPK8Sh4RFezmIj4JrzXmuS8PeJiJZY0l3nCSv1V5sRxHmenqFUA9vyv Q==;
X-CSE-ConnectionGUID: nwgoPy+rRruVNpq+3qtCpw==
X-CSE-MsgGUID: Hb9iMpxTRLalr1KIW4FMJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="101771542"
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; d="scan'208";a="101771542"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 05:11:40 -0700
X-CSE-ConnectionGUID: KtjWpHgUQ5GiMj0SlSHgvA==
X-CSE-MsgGUID: IntfkETvRaOB5T8WT2SfUQ==
X-ExtLoop1: 1
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 05:11:39 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 1 Oct 2026 05:11:39 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 1 Oct 2026 05:11:39 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.0) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 1 Oct 2026 05:11:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xo32mqC/cGezUUJrPOK0JikRLxw4wyieqkrxUMragKUv4mMQWSPYHvOdkVKsiHB6VnQ+2xq/CbANm41gWiiCSXTEhJ1cl7L5JWkt0CTIsKlgUKQBQP6RpYOX1DKLx7RUpKUjmy/E9Wf67HR/5gjAkJTT6n9l+widb3/W4IGz/bmiev8DK1HhWE08RT9VmZ00gluoRZmVPjWdAG4wZV5PYnXWkrRx5ZZNYoDKNY87sAr3EQ3WZnq3ptl1uSx2uyrubmguOA8r8inwsBTVNxAXmaFMWLrZ1aei6e0CicPrWbiJTbVgLqpYV2Dqxh5sXaPoLpARW/oRY8n2NtE4PoqdQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EVw3mAItL0ajRkq1M/2ftazxotNWERPTebNzVnTKUvY=;
 b=X/9UtNhoHI5jLgR54L5NNR88uiY1I0BvRbmiUOwfyc6xXph3jm8EBXLhg8HftKCurOC3E9IsepuqMFOoTPo3wLSnw7woGCLn0ilgjvVX6YD4Dw56fu9AjDpVBnXxiKklvVvjw3iAPUwuYSoqi81koU9nRjr3OIQ7aM/4uKMUOavNWCBWjffMOqJBMeA9RFZ9gm90og610pB6V2sjXL3mtWjzHKbm/E7Lc5NUJgiDZ0ZYuqcERJ1KxbssuLRc2mUhTmaw7Z6yCPyaCR3Ue/WbRXJi7pR4hrdcVUx1X2nn5TDW8mMLn8geo3w6stl3t5r5AWPgTrRLFCzjkuTZavpB+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by SJ5PPF1A7C623DA.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::816) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 1 Oct
 2026 12:11:35 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::3a:cd0a:2af8:5837]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::3a:cd0a:2af8:5837%3]) with mapi id 15.21.0451.026; Thu, 1 Oct 2026
 12:11:35 +0000
Message-ID: <0b7e994a-0b5c-43a1-be0f-c04f75f1f95b@intel.com>
Date: Thu, 1 Oct 2026 17:41:24 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/6] drm/xe/xe_ras: Add support to query page offline
 queue and list
To: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <badal.nilawar@intel.com>,
 <raag.jadav@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <mallesh.koujalagi@intel.com>, <tejas.upadhyay@intel.com>
References: <20260928061830.417395-8-riana.tauro@intel.com>
 <20260928061830.417395-10-riana.tauro@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20260928061830.417395-10-riana.tauro@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0275.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:21d::19) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|SJ5PPF1A7C623DA:EE_
X-MS-Office365-Filtering-Correlation-Id: 9334297f-df72-4410-e683-08df1fb5232e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|18002099003|22082099003|11063799006|10067099003|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: 35dYIVAp6IkOrW3GupLat982kngKUE+7flVLHWgLWDWA+HIzFyRBeKrJWtJCGGlqlbP2BFPsFEaY9jNQmKD/t8Shev/Wd2DIiUaziJ69ymSoNeQpwm950545kfrtCJuzjgfyiJJna1grxTkoK01Gptg0Z8ysFcvbqDiPXdAK0bVxgEZ9VgG+S1CdZrEzMk2bvSz52OlKu8AaesM0k3K74NJOeu7ENL/ir5RtFxvexeAlYGnCkFO2xiD2JioC0pxd9/vH84qf4UGXdKXMBGHbGFqS0aHHG846WCMmheR5CBOHEIOZwbqnxIbpeejUrWIDDbWXH7hlWD5FeQXhQCy7/V+7i42SE+M07Jh4HhWvpVCgh/kvPJkqm1Clitb57IWPGhFVAqTFDtCs9PLV6Y0n2GH4DI426ZqxQaeSEu2s+L/i97iWNNMlKqTQzLvrhfY1U0NMa0rTkO+cL7XK11z0FUFrc2nj5fMp6eqsCt89Qx4l6h7FCpffGeh0O9G1nZMGZjhUk4K7zMPWZA6n2M9XW66SttpMThvBuXB1oosSjwWoV+/o2pWwYpsMenGIuAcDE3DUlAeZLnTVABm8biPQkN7Auvminn9y+Pf1Om/opO9VhErkEkxtuU943vfJJCe1NtuoXfbjviDUk7suFt4wVCV9NC2EjeLYQoLZjmv4A3U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(18002099003)(22082099003)(11063799006)(10067099003)(4143699003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RVFJdDJlYXJ5alZ6OVUzeGxXNE1QeGNVQVMya204SWhwdnRDaWduMkt3eHpW?=
 =?utf-8?B?d0ROV0w1QXhRWFBSNWI2Uy8rdC9DcWd1cW1iMVhiZGhJSTlFRXZPZHk1MUl5?=
 =?utf-8?B?NFZ4N3dTbmY5QXJVTk53cS9UOWxzelNTa1ROSTYrUlRydzlFQWRRUHZ3VmFH?=
 =?utf-8?B?UGtYeXEycVozaW9RZC9nV0h3a1d2RnkxVDlLQ1RhYzBIb0VJc2J1TjI0S1c5?=
 =?utf-8?B?c21IbjhPU2oxSWFHWTY2WjlkYXVpRVJvaE1XbUo2Mmg5aDRsaTBLcm8vL2tC?=
 =?utf-8?B?R3BnendVRmpCWisxMi9ONUpvNk5xWlJsZWg5eFBsaGFIVFgxcnEyZWlYVWtu?=
 =?utf-8?B?citLb3pPS3E0WVZzT2dPZ3NCWjJiaXJCS0diRUE5KzhjempzdEhyUXFmR2lC?=
 =?utf-8?B?K2UzL1RXSlQ1TVo1eWR0QkNBcm84bTRyNy9EU1ZtcVEzdlBaUFN3VUFOMUFR?=
 =?utf-8?B?eXE2NXJXbXhZdDYzOUZ6ZkY4cUhidUFSRW1SYTBQZUQ3bW5VYmxYcDF0enZO?=
 =?utf-8?B?bUJ2aDBkMWdKdTRUZEZsNHhaK0d1WmoxTnJaamRIUVFpMDNTRDh0TGd4TldB?=
 =?utf-8?B?aWw4c081K09iUTFYQlVnUGhBOHJacWRXWHFPdXZZVXlmTnpHM3ppRHNFeHhi?=
 =?utf-8?B?eEZBM3FSSUphOWNyMFB3Q0R6YmF2QlRPTTlBSHdSSGZyT1YxUGticjFyNGhn?=
 =?utf-8?B?WDg2R09Bb0hVZVc2MGdwSlJ1MW1jUXhQbjY3UU9FTnZnMUhOWU9hcFg4N3Ex?=
 =?utf-8?B?a0J5ekZzQVljUllSV0ZRTjdIZmhqU2REMHZmQmJhK0J5TkpXTUNBemhPbWIr?=
 =?utf-8?B?TmdMRGVKeHJjRVhnaGpSdHhoS0xOeFJwaEw3Nm9rY1A2ejl3QWVOTEVGRWFx?=
 =?utf-8?B?bExnRXMyQWlqdnN2R1V1Q2piaGZIdHRoSzgzbzZVNFg1VDZ5S1F1Yks0eVlD?=
 =?utf-8?B?MDVKV25nZGM0aTA1TUN6Nk12ZG9DUGlKOEltTVY3NUwrVzBiaHMrdS95MTRo?=
 =?utf-8?B?OWxzMzdmVGFYU3d1TjNkNFVZd2RXNHdSUTVsenpZTGE2Y2FWY3ZBb3pOZjNH?=
 =?utf-8?B?WVhOTDZZTnBlZEU3eXdLMGErTXF5TVVuaENYYzcwekJiVHAyZzc5bFJkb3kz?=
 =?utf-8?B?WGFIejVxM2hiRjVCTVNwQWFOeHcwbG13MjZwbURVaXdGa3F1K0dpYzBCWHlG?=
 =?utf-8?B?YllPWldvQThJM3NUd3IyZGk3bVFMSUlUSFlMZWo4TnlSdk95aWgvTm54YS9S?=
 =?utf-8?B?QXRaRStHVE44ZjU1NGZZODBOdjNCWmJDT0tWc0pMWVVCczVYenNKdGtBbTVY?=
 =?utf-8?B?ZFpTb0FGcXo1WVBJUVVlNFAyL3NwUm56Y0dPUlNUUldwUUdPdlF5bktXdVF2?=
 =?utf-8?B?R003ZjFFd1Z3aUNwVXFSU1pNVkRZekM1TlpNS1JWU0tCdWVHVWZoNHIzWDVW?=
 =?utf-8?B?TWtEYzdtVXJBZVZMZDdZaHZQOFp5YTRXK011cTY4VWsyYkxsV0hBQ25DNlZM?=
 =?utf-8?B?dHBUKzJBWUh1VkFITXQrMUlld1E3WkY1WWVkdzlWQkVWdzNiR2ZkSFJiT1pL?=
 =?utf-8?B?bjl6QWpQWWptZmdwYjA1ZFpvQktIenBrbFZVL1RCNjF6QkVHUzN2S2FKMzZL?=
 =?utf-8?B?MkpZMXNPQ1Y3Y3UwclBSWDhFaU14UTBMbTZrTjhOOExYclltNHpINGdqeFRk?=
 =?utf-8?B?VkFrKytQajBQOTlKalZwYlh2TTNudjVNKy9wSlF0VlM4L2F0c0hrVzZKeldH?=
 =?utf-8?B?Vm83bkI2NHhlTGJjL1Z3TmVIcEtMZWpyL2lWc3lIUTNkbEVDTXJoRzBlUzJm?=
 =?utf-8?B?MkhnSFRzNXBaZjBOeWNZK3VGeVBvZTF5TnBDbTZPTnlQOFl3Z29JWGZGZVp1?=
 =?utf-8?B?ZEMzQUdkT3htbUt0aE5NcWZFQVlRVzlvNGZxUDdYN2Q1SGNXbkMvUVdqTU9N?=
 =?utf-8?B?OUZ5UmJ0TU5lK0JteUEzbjVWaWhDclVQQUpMSkVITFVnZEhoRmNSS2s4eG9P?=
 =?utf-8?B?MUdBZWpQMW4yYzF3QkRmYzRJSjVLNzNIaWV0Rkg5aHVBT1FPaHVQNTZ5Z1ZN?=
 =?utf-8?B?ZGl6SFE0WXZUOUpCK3ExbDBhdWJYcWQraWY0ZDdxRnMvelZzRDA3VE1VRDZV?=
 =?utf-8?B?Tkt5NGQ0cGNXZ1FqZXUyT3Z4bVUxYmtRM2RFTnNTbGw2ZmU0ajcyTzVhblF0?=
 =?utf-8?B?aURYY3grajNZeU5TQWpidzNrckFXV3UvUVpuUGJ5czFZc0RZNVRMSFB2SE1T?=
 =?utf-8?B?Vm1ZT25lZmQwdnVac2IwYTZpVldGblkybVpHWDhGbERCTE5jVm9YN1hPKysx?=
 =?utf-8?B?QVF3eXkzZWpqOEtEb3MybEI1aHoyN0ovWTd4TlRGYmxpc0NJSkh6c1VQQWV4?=
 =?utf-8?Q?MkeP0XVkEyktKlqM=3D?=
X-Exchange-RoutingPolicyChecked: O+dUcn8QvG8iSzTnynOy7EWeekmRjSAyDwEmznTIC0xoPmjP47LXeYItrhcpkZI29VfkZe89798uLyzQg7ApqkJ/NZCPRJzFYDgjArCT01puYZ/Fc2aLrdsbUqVGoUEBfjOJBjIQ82T7x145BlBRrxL9l8Kq7n0zcz1Ubi5eVJExk5kfXwnZVJ2OhyBaMtI0fv/i/F/Af0faU/+qjsRhutI70f4YFh9pxieRHdfaIPrQkFtODT1qIv/C5WyHwEbAr1pWamIvg0mUGHiDx52KWRnZA0f68eBg+k2nmWDH3p680YmOv4K0awE4pX7PLO1Okx6Un1nA1R2BzIqHwO42dQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9334297f-df72-4410-e683-08df1fb5232e
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 12:11:35.3965 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: igCXA1SXHc8wpO1+wK6M1iKi+skJqz9nU9OjN2zORHpRQYd6xKcWAypxvx0xuWx8wWRkGFxyoU0OSSkyanMlNHEfZFGkgTsjK6d4vP5S0HM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF1A7C623DA
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
> Add support to query page offline list and queue from firmware
> during module load. The page offline list command retrieves pages that
> are already offlined by the firmware. The page offline queue command
> retrieves the pages pending to be offlined by the firmware.
> 
> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
> v2: rebase
>      store total pages once per response (Sashiko)
> 
> v3: common function for offline and queue (Himal)
> ---
>   drivers/gpu/drm/xe/xe_ras.c                   | 74 +++++++++++++++++++
>   drivers/gpu/drm/xe/xe_ras_types.h             | 35 +++++++++
>   drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |  4 +
>   3 files changed, 113 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index 1225c561a872..752754f09314 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -335,6 +335,77 @@ static bool ras_counter_is_valid(struct xe_device *xe, struct xe_ras_error_class
>   	return true;
>   }
>   
> +static void get_offline_pages(struct xe_device *xe, u32 cmd, void *req, size_t req_size,
> +			      void *resp, size_t resp_size,
> +			      struct xe_ras_offline_common *common, bool offline)
> +{
> +	struct xe_sysctrl_mailbox_command command = {0};
> +	struct xe_ras_offline_list_request *list_req;
> +	u32 total_pages = 0, count = 0;
> +	ssize_t rlen;
> +	int ret, i;
> +
> +	list_req = req ? req : NULL;
> +
> +	xe_sysctrl_create_command(&command, XE_SYSCTRL_GROUP_GFSP, cmd, req, req_size, resp,
> +				  resp_size);
> +
> +	do {
> +		memset(resp, 0, resp_size);
> +
> +		if (list_req)
> +			list_req->index = count;
> +
> +		ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
> +		if (ret) {
> +			xe_log_err(xe, SYSCTRL, ret, "failed to get page offline data, cmd=%#x\n",
> +				   cmd);
> +			return;
> +		}
> +
> +		if (rlen != resp_size) {
> +			xe_log_err(xe, SYSCTRL, -EINVAL,
> +				   "unexpected page offline response length %zu (expected %zu), cmd=%#x\n",
> +				   rlen, resp_size, cmd);
> +			return;
> +		}
> +
> +		for (i = 0; i < common->pages_returned && i < XE_RAS_NUM_PAGES; i++)
> +			handle_page_offline(xe, common->page_addresses[i], offline);
> +
> +		count += common->pages_returned;
> +		if (!common->pages_returned)
> +			break;
> +
> +		if (!total_pages)
> +			total_pages = common->total_pages;
> +
> +		if (count > total_pages) {
> +			xe_log_err(xe, SYSCTRL, -EINVAL,
> +				   "Pages returned exceed total pages %u, returned %u, cmd=%#x\n",
> +				   total_pages, count, cmd);
> +			return;
> +		}
> +	} while (common->additional_data);
> +}
> +
> +static void get_queued_pages(struct xe_device *xe)
> +{
> +	struct xe_ras_offline_common response = {0};
> +
> +	get_offline_pages(xe, XE_SYSCTRL_CMD_GET_OFFLINE_QUEUE, NULL, 0, &response,
> +			  sizeof(response), &response, true);
> +}
> +
> +static void get_offlined_list(struct xe_device *xe)
> +{
> +	struct xe_ras_offline_list_response response = {0};
> +	struct xe_ras_offline_list_request request = {0};
> +
> +	get_offline_pages(xe, XE_SYSCTRL_CMD_GET_OFFLINE_LIST, &request, sizeof(request),
> +			  &response, sizeof(response), &response.common, false);
> +}
> +
>   static struct pci_dev *find_usp_dev(struct pci_dev *pdev)
>   {
>   	struct pci_dev *vsp;
> @@ -1049,6 +1120,9 @@ void xe_ras_init(struct xe_device *xe)
>   	if (IS_ENABLED(CONFIG_PCIEAER))
>   		ras_usp_aer_init(xe);
>   
> +	get_queued_pages(xe);
> +	get_offlined_list(xe);

I believe these also needs to be called during resume in case of 
suspend-resume flow.

> +
>   	ret = devm_device_add_group(xe->drm.dev, &gpu_health_group);
>   	if (ret)
>   		xe_err(xe, "Failed to create GPU health sysfs, err=%d\n", ret);
> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
> index f119489bcdf2..021ffbd6d4e2 100644
> --- a/drivers/gpu/drm/xe/xe_ras_types.h
> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
> @@ -10,6 +10,7 @@
>   
>   #define XE_RAS_NUM_COUNTERS			16
>   #define XE_RAS_NUM_ERROR_ARR			3
> +#define XE_RAS_NUM_PAGES			25
>   /* Error bits in IEH global error status register */
>   #define XE_RAS_SOC_IEH_PUNIT			BIT(1)
>   /* Device memory error categories */
> @@ -330,6 +331,40 @@ struct xe_ras_page_offline_response {
>   	u32 reserved;
>   } __packed;
>   
> +/**
> + * struct xe_ras_offline_common - Common structure for offline list and queue
> + */
> +struct xe_ras_offline_common {
> +	/** @total_pages: Total number of queued pages */
> +	u32 total_pages;
> +	/** @pages_returned: Number of pages returned in this response */
> +	u32 pages_returned;
> +	/** @page_addresses: Array of page addresses (4KB aligned) */
> +	u64 page_addresses[XE_RAS_NUM_PAGES];
> +	/** @additional_data: Indicates if more data is available */
> +	u8 additional_data;
> +	/** @reserved: Reserved for future use */
> +	u8 reserved[3];
> +} __packed;
> +
> +/**
> + * struct xe_ras_offline_list_request - Request for get offline list command
> + */
> +struct xe_ras_offline_list_request {
> +	/** @index: Zero-based index into the offline page list */
> +	u32 index;
> +} __packed;
> +
> +/**
> + * struct xe_ras_offline_list_response - Response from get offline list command
> + */
> +struct xe_ras_offline_list_response {
> +	/** @max_entries: Total no of pages that can be stored in flash */
> +	u32 max_entries;
> +	/** @common: Common offline page information */
> +	struct xe_ras_offline_common common;
> +} __packed;
> +
>   /**
>    * struct xe_ras_get_health_request - Request structure for obtaining gpu health
>    */
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> index a01576bf2e73..3a71ed446949 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> @@ -31,6 +31,8 @@ enum xe_sysctrl_group {
>    * @XE_SYSCTRL_CMD_SET_THRESHOLD: Set error threshold
>    * @XE_SYSCTRL_CMD_GET_PENDING_EVENT: Retrieve pending event
>    * @XE_SYSCTRL_CMD_PAGE_OFFLINE: Instruct firmware to offline/remove a page
> + * @XE_SYSCTRL_CMD_GET_OFFLINE_LIST: Retrieve list of all offlined pages from flash
> + * @XE_SYSCTRL_CMD_GET_OFFLINE_QUEUE: Retrieve list of offlined queued pages from firmware
>    * @XE_SYSCTRL_CMD_GET_HEALTH: Retrieve gpu health
>    * @XE_SYSCTRL_CMD_SET_HEALTH: Set gpu health
>    */
> @@ -42,6 +44,8 @@ enum xe_sysctrl_gfsp_cmd {
>   	XE_SYSCTRL_CMD_SET_THRESHOLD		= 0x06,
>   	XE_SYSCTRL_CMD_GET_PENDING_EVENT	= 0x07,
>   	XE_SYSCTRL_CMD_PAGE_OFFLINE		= 0x08,
> +	XE_SYSCTRL_CMD_GET_OFFLINE_LIST		= 0x09,
> +	XE_SYSCTRL_CMD_GET_OFFLINE_QUEUE	= 0x0A,
>   	XE_SYSCTRL_CMD_GET_HEALTH		= 0x0B,
>   	XE_SYSCTRL_CMD_SET_HEALTH		= 0x0C,
>   };


Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F262C43458
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jun 2026 17:34:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 288C810E3D5;
	Fri, 26 Jun 2026 17:34:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lqfqHE2z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A75A10E3D5
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jun 2026 17:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782495295; x=1814031295;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=TVALnotlkPr0AvyCWYb3+BxP9Q++TK76JYbDA2j2Vno=;
 b=lqfqHE2zTAsiIMEIEOsmYT7wZTXJpdZUOs5GI8jrANhbEknvje+5GssR
 TEUA68k6bCNSmDAcdC2wMzuzeLpgUma9GguwoRlbwe7auRPyQi+ubNadl
 GE1EZSpDvIx1vaX6LmBHKcPnsyQck9TJBrFqnBFHq+tqWZiVCGZd9iJ3s
 3xm/Swfpw/ycAkL8McivWX+onVrJSwoTqne3C77aYZNXiMfS6QZGDzJ1q
 FO2L0qONa0z+ejLGuOBzIP/O5m0w1w9eJa6uapC+5VSsvesXtDue/8HwM
 zdBXfIm+Zr+MrbubqrxpQLaR3XHdmR8scVN5tycf3Mmt5UbkAmHzykCpg g==;
X-CSE-ConnectionGUID: m5p2d/XZQo6czyyQDrSaoQ==
X-CSE-MsgGUID: iithTcBnQca9FmRGKS0oew==
X-IronPort-AV: E=McAfee;i="6800,10657,11829"; a="94681351"
X-IronPort-AV: E=Sophos;i="6.24,226,1774335600"; d="scan'208";a="94681351"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2026 10:34:54 -0700
X-CSE-ConnectionGUID: gpO7nKzJQ0S6rZbnkLJQsg==
X-CSE-MsgGUID: ji0UgwMpSVuwEe2vfUwOgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,226,1774335600"; d="scan'208";a="251534057"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2026 10:34:53 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 26 Jun 2026 10:34:52 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 26 Jun 2026 10:34:52 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.60) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 26 Jun 2026 10:34:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yp5boPvzDkCbsFfltRWUOF+xwA8AnQI9EeozlRCaNMcedHhBqp0bCi+jj5HG+cBLmMbCKR9NL0GqNWKoUVjHjIVM/ktK6kzerlVrL3isFDtvvAJP/peap52pENcdJYP5fC02d03Kuwl4XMS7LK/aJxrNHBXciW/By9OfkfdMzPUa2cCobcRChycHkfyrk2awbXcfHK5u8p3E7DoBPUKNeucuE1YKERDhKNXG2nJqP7SmthZYVCjiOXvUeL/HaLJO4yD+4G7IQwyR5ZDdV9YPBG/iMs36fRPPrjM8vQ0IWaze1EIY/4fHasjzV3hUwSVUlkSRZrqeI9BYflEnyj65cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xr2RdliNddwHuZ2CroH6R08oafwN+I5hsy5YDcI6vNM=;
 b=AtQsmGUsH/myWZF9oEyiZvpZ5V6NUKqm/0XBuaSbB+VdXJmxLYyr0/FKGuU0iYhXYpNtYvj3lJIoR47rAd9ubwk9rMHUpfC9pFlT5EX8W1657P+vff/NhvUvXutEdnxiy7dB5fVwUVI5yt6FIen1jUHe/UZNHV7TthNOjv08SJd5bw+ajX5mlRncsE++Qhg6YirblbOmUTVG6p5xr2csf3rMapJav3KsfR5+s5nthAAy30VWNnT/KfPM2OFCp8b1Dh0KGh+Lq7P4eEBzDAeEpRosAaBFniSSbqmyqX9ssjnWQd/H8tvLRdppeklik+q+m8V/3Tvca+bReviAkscpnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF46B98A11D.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::23) by PH8PR11MB9535.namprd11.prod.outlook.com
 (2603:10b6:510:39f::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Fri, 26 Jun
 2026 17:34:51 +0000
Received: from DS4PPF46B98A11D.namprd11.prod.outlook.com
 ([fe80::5a0d:e357:ce45:3963]) by DS4PPF46B98A11D.namprd11.prod.outlook.com
 ([fe80::5a0d:e357:ce45:3963%8]) with mapi id 15.21.0159.016; Fri, 26 Jun 2026
 17:34:50 +0000
Message-ID: <8c188c17-04fc-4b4a-9f3b-613004678b2e@intel.com>
Date: Fri, 26 Jun 2026 10:34:48 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe/hw_engine: Fix double-free of managed BO in
 error path
To: Shuicheng Lin <shuicheng.lin@intel.com>, <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>
References: <20260417161901.3416021-1-shuicheng.lin@intel.com>
 <20260417161901.3416021-3-shuicheng.lin@intel.com>
Content-Language: en-US
From: "Bai, Zongyao" <zongyao.bai@intel.com>
In-Reply-To: <20260417161901.3416021-3-shuicheng.lin@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0234.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::29) To DS4PPF46B98A11D.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF46B98A11D:EE_|PH8PR11MB9535:EE_
X-MS-Office365-Filtering-Correlation-Id: e396b563-2b23-4208-755e-08ded3a939e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|56012099006|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: f8pAvfV3DBVjcTXCouaitpcrdLuJtDa7VLY5wJ+h6AzxiWl/AE9w+tAZ6lq5R6qTgPrq9X3VfL9X86C6DvAHFwm2TTjQm/ogTm3Sb1AvsMWhZhJtvss2z/zi9NMnJKGAYF9Xjy9umlPUGjE/aNNxaXOPRYULNDvQ4cYDkX1gzK6/cowfuqNkld2BkIkZ5IzGeKtWNlNwcZJ9Y1xR2i3S2CJCsdvi6RtjN8mm/gozGSpaZ+6gTchM7m9Gx/WE8zfXMR7smPWxiuuABaUy81hwv/nqeBqTJLBiusm7Cs28f3snC2Az3bCwfjUxB4/DHN/V14CDE6C2S7xnfiNPgmQLYROn9WU2KzfBNO+qkK0pupb23iGqBE8aSJJdkfIYJneRusKN4TnjahAql/KLQM50MbWtuhXJU4Sfo7srFF50IAD1AOngSVo0oP/cxgsUI0cMIpfBkt14NEwgy1XZSSUVQ7VEZtBV9R4xS6Qf7LU7Porm/4ZP5Dny4lO1EYGcg9QvxMJ9QPVWDj8QnXO29uTEnzWpzFQe1JJzOgiACQgrZ0KxxjOGM9mZ0vkS/9AFzVhjEmotyK71di+rjxxxh5XSPKyZ6/xiuTnKNSKWVbGwMsZA5W/7e6DOyFLmp3Wgr144M/Fh9MqORhb3qIVQyK4EBkRWbFkkyL5iTSAZqnmGIGk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF46B98A11D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QXlhSC9NNTIxWVY1Y0x0emVEVDBxQUFMUnUyKzBDQVNIU1g5Y2xyanFkRjRE?=
 =?utf-8?B?cW5hMjlFQi9hSFAyUmZqaXB5TjVpUkdNelJWL3pjTk9KVFYxZHllbUFRRnRo?=
 =?utf-8?B?cVF0UE44cTB2c3RiK0k4SXZxUkxBamVxemN3d24zTWN1eHIyTmFkQzFEaW1Q?=
 =?utf-8?B?QzlJV2plK0RhL215UmRHaklFaktQa1BzcnhDRjU4SE5uTDd6SGphL0kzbUNU?=
 =?utf-8?B?WitUSGRIK0ZZQ3N5ZnloZEtHdVUyR2t1Vzl6aGhZLzRKSWNZSVplNmhtNm9x?=
 =?utf-8?B?c0c2WnlmejN1YWtzR1JNQ3o1NkpxLzNqTGYxV1lETVJJVE1DNjNYUWwxTnBW?=
 =?utf-8?B?RzFzNGVxSU5CYUVLWlB5RGs4bFJjVzlEOFhjMWI1SzY2ZDRDeUZ3SWFPWFJv?=
 =?utf-8?B?bm0rWTlxSVcrSkdTU1JKVEdITzJRQVVFOFM0RERnZGNqUXdxWDcxTEovTmg1?=
 =?utf-8?B?NHNUdGNWNmFPS09VMXJ4Y3lFSlhmVVVKN1dZOFh5SEdRT0JBcEdiZ3NENW5w?=
 =?utf-8?B?cDBwMlFzbUxMY3V4aWdMNG5EMWRuMmJLeElrOU9wUU1YaTNpQ2k5TElBTnVh?=
 =?utf-8?B?QXArZWhINFN4U0xuOWxUcTk4WTFOemVtcFRDVlRkbGJ6Z293K3AxT0N1ZGV2?=
 =?utf-8?B?bW42Vk1hT0c1SG5XaVl1RGhTMGZJVmpWSmZFNHdCVzZRUGFvU1VwNlpCcE1G?=
 =?utf-8?B?ZW1OdGJ6b0h0enJSNmRFZk9EakYwK09ucks3QlN0TS9SS1FRQnZQU29SdEkr?=
 =?utf-8?B?bFBjOUh0TmVCTHZ2SUdvOWJRcXZYNCtYUTFIT1lTNWMrRHVGZW9pVFpiQ2JR?=
 =?utf-8?B?RXVuUXpYNGhtUmRWb2c2eldycEtJSlQxOVVLdlFicGEvQlhaWHJ0RHNhU1BU?=
 =?utf-8?B?YkR0d3pGNnlQMWRHTzhsU29waHpSN0dCakFPR01LV3UxTFBaSy9STWNPTjdC?=
 =?utf-8?B?OFdmZDdUMTc1YXAzZEQyaUtHZXpvc2xwc1VnNWRjZ2dVVlZ1ZnJkZnF1R1lo?=
 =?utf-8?B?WnhPSFBaRkI1c3J0UkNBT3lpaGsvSUc2RlRKYkZuckZpeWkrOXVTcHRsTktk?=
 =?utf-8?B?U25SbmVvdUlJZ0pNZURObXROZzN4cEZQcWxqUEJwc2hOS0phZTcvbzhMRUhJ?=
 =?utf-8?B?TkRnL0tkcnpiaTJFRVA3OGdNYytNKy95TGprQU5IZzRsUXVYVmlJZXpxVHpN?=
 =?utf-8?B?KytzamoyNWs4S0toZm9QTmpNMzJFL2dZd3llVXdLL28rc0VLWm9wWlJ5U015?=
 =?utf-8?B?ZjczcXNUV0NvVEFzcXQvRWUyQzR0WmU5bTNTeDdneEFySVNFN3l6RWRNL2Q0?=
 =?utf-8?B?VzNBdXNlN3JMRm1yVjJvazQwL2d3czdmdGI1SXJPMjVKOWRZdnMyUzFMSzY0?=
 =?utf-8?B?MG9jakJSWDF5M1NjVllhVTlqL0dmdldndC9GRmlab1BUWmdpd0NCa2xDSk9W?=
 =?utf-8?B?a1JFbXhIMVJ4aUxzSUExWTArVWN5Y05DQUs1NVhzZFdmMHN1cnRzL0Z4TUJt?=
 =?utf-8?B?SExYMm5DajljOFNybEd1SnBWL3A0MDR5ZWdvR1RVNk1ncnlTTGdmdTV3SXlI?=
 =?utf-8?B?NUQxRmFGYVhZbm1OR3p1aSs0SVRMdkRHbzZHRGlMVTFSbGM0M2wzTHF2TFFo?=
 =?utf-8?B?NjBOMUJyU1NCMDlYNW1oYzJheGQvVmRnNkx3VTh1UkxGc0IyT2xJWWhyVExW?=
 =?utf-8?B?TzgzWWxiRjVtODNod0wzL2t4aWFSQmRvdER4YnlneXZ2NW1DNktqV3Y3dENE?=
 =?utf-8?B?Z0tXd0prRnFwQkZlcjZoQm9TOTNvWEtqWm9RR0dyeUhzdDhrakwrdnloRFNB?=
 =?utf-8?B?TjM5Qkd1U2JtcEZpQnpLUUJRckVIdEdFRGEvTFp6Wk1LTGxmTDlSVVd2YXhN?=
 =?utf-8?B?SXZWMHAyUVpndjF0cnN3T2RVbHE0ZGRhaXhMRGFpQU00dnc3NG5KcHhpTGVU?=
 =?utf-8?B?eGFORk40QnByOEs2SkoweGRJZy90QmlCODlMbVZjMlZlYVpub0xXZnVxRkwv?=
 =?utf-8?B?ckRyQkhpb3lJOG51c2djUHhRZDdXVFRyL3htZmV1Ym1WaWxEM2NCVnFMUC9y?=
 =?utf-8?B?UmprcUlkWnAxRllHZlFjTFV1Vkh5ZzZkVXZpS2JDV2orYmpXQndMYUdWTFVk?=
 =?utf-8?B?WEpYMXd3L2FmbUhvbHE1T1NxVVZXeE50OWt1dmVYMTRZc1Z2WkNZWEtvZmQ5?=
 =?utf-8?B?ank4NWhNR1Bmcy8xRklNY2wvdVlEZDBoR25BU1BEeEJmQnhyTnJnTkRnSUgv?=
 =?utf-8?B?Uk1XdndITC91UDBBaWdPL3ZiT2VnSzhyWjkxVnIrMjRUd2NVNnVkcVVKdFEy?=
 =?utf-8?B?TzlYMHVJRHMwb0VJcGVHcTRJaVIrR0w1aGRYdWc4cWZEZStkanFIQT09?=
X-Exchange-RoutingPolicyChecked: jP4alZqJug8E/3KfedKF+0rjVH7nKGowM6fQRNOShL1hsbyQw9yJtJ1wVwcmXJCSzuxaWn0sXYnERCZR8cvicd7dqmj+0evgoO04a0ioGb0hw2El51uyDqVNkO9i/sRPmUrGubGcAu0EKRFHnLuT9BM3ZXavq296QtkZfU/M5Gn57wnZ7bdp9NIQxHdC9Fj/ZecLxUAVbOfKP2o3gZu0bKHL/vtTBiEqtByeTAtIvq6pKsYMq+/ThElcJcHWB3uHYpQaSVw6GaYWC3it6mZH7/ZquPZHF/octHlp6B24ka/I7V5A+FDt5VaIFSzxU9Ey4Kfr1tNNKeu0H1/4z55ZQQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: e396b563-2b23-4208-755e-08ded3a939e3
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF46B98A11D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 17:34:50.8905 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dJIvKwUZjQOu2qDzLAfAN3R8JvUEHrBiI6UHrzdCNJhhaH/v0blMclJly/ds6xDphOElrZo6kas2D6XJReiMkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB9535
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


On 4/17/2026 9:19 AM, Shuicheng Lin wrote:
> The error path in hw_engine_init() explicitly frees a BO allocated
> with xe_managed_bo_create_pin_map() via xe_bo_unpin_map_no_vm().
> Since the managed BO already has a devm cleanup action registered,
> this causes a double-free when devm unwinds during probe failure.
>
> Remove the explicit free and let devm handle it, consistent with
> all other xe_managed_bo_create_pin_map() callers.
>
> Fixes: 23e939bc8f56 ("drm/xe: Add a helper for DRM device-lifetime BO create")
> Cc: Michał Winiarski <michal.winiarski@intel.com>
> Assisted-by: Claude:claude-opus-4.6
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_hw_engine.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index 2f9c1c063f16..b69e6c9e534e 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -629,7 +629,7 @@ static int hw_engine_init(struct xe_gt *gt, struct xe_hw_engine *hwe,
>   		hwe->exl_port = xe_execlist_port_create(xe, hwe);
>   		if (IS_ERR(hwe->exl_port)) {
>   			err = PTR_ERR(hwe->exl_port);
> -			goto err_hwsp;
> +			goto err_name;
>   		}
>   	} else {
>   		/* GSCCS has a special interrupt for reset */
> @@ -649,8 +649,6 @@ static int hw_engine_init(struct xe_gt *gt, struct xe_hw_engine *hwe,
>   
>   	return devm_add_action_or_reset(xe->drm.dev, hw_engine_fini, hwe);
>   
> -err_hwsp:
> -	xe_bo_unpin_map_no_vm(hwe->hwsp);
Shall we keep err_hwsp?
>   err_name:
>   	hwe->name = NULL;
>   

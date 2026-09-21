Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4240C982ED
	for <intel-xe@archiver.kernel.org>; Mon, 21 Sep 2026 13:41:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A17910E0C7;
	Mon, 21 Sep 2026 13:41:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IIIXRBa8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A20710E0F9
 for <intel-xe@lists.freedesktop.org>; Mon, 21 Sep 2026 13:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789998103; x=1821534103;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=LWn9I2N7ZLemEaRkrj+1Cls+rKyGp8Ry++blPcSMoIQ=;
 b=IIIXRBa8csJgtxxETVgeeYW3wXuxmdTWdWNAMfA8bY8qR6K1s9nmZV7H
 GQQbL6f4hLVY3VsnTzrc1j/DjjTiU9ow0QpyIKLKfSrOPkkj12Njbld/i
 J2AU5eJqtvqsrwUqzQNAJVDaCH59KtXhIQsTLByKk8OsO6PqIY7VC5zQ1
 JbE2QcuFVPulwBkkIPjQxGW5UV6wcMMEWMftoX5yMrZi6TEkNUqFLtLbH
 kBpKiLz4Eao0ZqdkSGmRWT1laFUSefxlUZpBHZ2/Z1lyBvO+5f0XvQq5Z
 x8+QlzadJoj7D8vp/+zSqVWNWjrIawWKIznZSn+CuV7A/5fGBwd2FYJfU w==;
X-CSE-ConnectionGUID: Ut68YTTbQpC39tMMf77N4g==
X-CSE-MsgGUID: IHeh81RYRlGxGf0OCGDweg==
X-IronPort-AV: E=McAfee;i="6800,10657,11911"; a="90630826"
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; d="scan'208";a="90630826"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2026 06:41:28 -0700
X-CSE-ConnectionGUID: f+ZphEAaTAycJD55a/8ClQ==
X-CSE-MsgGUID: HSmbZLzDTs+nY2TDO5vnvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; 
   d="scan'208";a="3962476"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa013.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2026 06:41:28 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 21 Sep 2026 06:41:27 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 21 Sep 2026 06:41:27 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.5) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 21 Sep 2026 06:41:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ICAdtgo/n/Dm70PV8UJ1kmJEX+EFCEa4+FsGESggOQdvFtq3tvQ+sGV+Q3+ZD2TbMtEzbFr+g0NWi52aSZmS2dj1d3/0ylrkAiICBHlVYKzywfKZ17qxgjyoP13wDM+nMQKeI0M6Wn2LaxaT0wr7kN6URPwmOA5X7d3xlt1PmNHonSB7ZC4JPmFbhsBq/03zX0wxZtqlBZJuQo+7iiV2VNv47pkllK1h3jqqF9dVt7x/rGlcaPQKa9xUm5qhdfTE3cSvxqoi5jD566Pjlh1Gom+I6wzaoOWDNv3XtJPkO506kgzIoW+1fSxyH/sh6+ZmQ5mpE3wqaXStmyLJx8ZjDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RyyR3a/VcE3gVPJNstbpV0o2Rjntf05VNgbdabbRcNc=;
 b=marCnSEsnLRaeA//jq8FxZ2wxfsdp5XNSf2yUa3pMaxHYHBBz02HMS9PatRcHBWGvnm2YBpjpJL580lgPAhnmFnPOXhuLwXDCwbvashxqEXR1wJYJNBqtURKzis1IsctewfemXat1zc6A9IRaHw0DG2QcLIoQ6mzghsIsRQATtlXZFH5qo8od0KjBrbIG0rF8o0vaSCVlptj4D3O+M4HrQgeIdcPmdqjQNrA2bg6znLOwibJv/VCzY2KfYC1BwSTUnfTbbQATxFHByxeaopA+whls55ZaJTOLa5nKpHVPO6lYqCpfPlpl/jrIyO+6Jl4YyOlzZyrYPEYGN18I0S3+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by SN7PR11MB7113.namprd11.prod.outlook.com
 (2603:10b6:806:298::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 13:41:25 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::5a5c:9c7a:cd1d:d687]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::5a5c:9c7a:cd1d:d687%6]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 13:41:24 +0000
Message-ID: <4dd6e6c1-5177-43e9-8ead-9390f545e4ad@intel.com>
Date: Mon, 21 Sep 2026 19:11:17 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 13/24] drm/xe: Enable CPU binds for jobs
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20260904211613.3934307-1-matthew.brost@intel.com>
 <20260904211613.3934307-14-matthew.brost@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20260904211613.3934307-14-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0119.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d0::16) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|SN7PR11MB7113:EE_
X-MS-Office365-Filtering-Correlation-Id: 56a0de7a-1f5c-408c-0540-08df17e60760
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|11063799006|56012099006|4143699003|10067099003|3023799007|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: bZBm69nWDuj+EW8Nu1KVzRMM4SlaxoGwbMmhfSrN9iojKRl0L8S1FrMDlURVtz7FPyEJs2PnfjyyJDg2IRXEv9K8t3nTJ/FtXnEg0QZlUhj4PBS14z2+S1RCTfDVgZd5iePBrcGbKvv7GmQ2kXj2dQnDKpUea/DKbMKhzP+tml9y03hJJRJFVV1iud71mrZtLYd0zzAYq3TH5LmPp0kuZG+ZXzXsdrCPiuqCo3qn8fc2ilUU25Z7msLHQsJcktq/rFLDWYtF1KD0YN+lCdQnm0dYJgg2H4oCO62928dM3A9dXP89mTMVKnQbOHpuHonYMQUUaRUHAN8ptfbGPbNI7SZNIzq9yn/vT8WwRkX52uYPd3BjiFzhKOBqbVptzNhl3COVsnz53SB1BW0vD0/4+diQXppmUA3y6RjU8acH06xANkU8Fa7JCSsmipbW7QeM/NXkIhjc/uX4HtbRBdPh6Bkne0QaZvveAInXX4rRcgubeMSqES3ftM3OCikE30uE2gCNsGFQVV8wkvzfngpIUGQbPohs+/Cli0hqMn1yBhPW5EtrwWGyecTveWsCXXovSF6QG4SkEin+M3uFouPPwT7xzTOYD0Hm8hx5dx6V4Co=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(11063799006)(56012099006)(4143699003)(10067099003)(3023799007)(6133799003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N1p1WnQxRkZyYTZlV2VtN2QwSVM2Qy81UUNIdzI4UEM0MG5JOW1mTjRhRXJV?=
 =?utf-8?B?d1ZmYklxUlZMOTR2NzBiR21NQVpNVWtLZnpwcUlpYlhmTSszQXBqQU1KQWk0?=
 =?utf-8?B?NnE2QStoQ0hjNFd3VHpSZ3pSUVhkaHU4TVVmUERGVE1DNlRXM2Y3MW5DT25P?=
 =?utf-8?B?MFdJWnM5NW50bVRBb2JLbmVWQXRpUEI4eG05M0xveFFySy9IRW5CeTREa09w?=
 =?utf-8?B?SFJqTHY4KzUzZStqMHAzZnFWYnBLcTVkRFNRNEVRMC9MMjlSb2hHQ1ZkdE93?=
 =?utf-8?B?QmZORVB0RkpOcWZQRXpjTDVRaGliVS9PdmpBcVZGalptT3NuWThxK1pYNGVa?=
 =?utf-8?B?d21TOFNSR0FKTXNZT1ZiOStEZ25tL25MUGdPT1pUaUJ1SnZ0RHZHR3RXRGh2?=
 =?utf-8?B?aG94Wkd1dll5NWtyakdyVkM0NlhiOTBidC9taGlvQjhwbXM2RWErNm9xWHFR?=
 =?utf-8?B?NmpyODVYMFg5dW5EM0tGZHNpNnRzVUk5SHNlSEYrcThIZXpYSTFReWZpcndy?=
 =?utf-8?B?YWJleUh2dDIxUHVjckNreVp3Tk9jbXhqSWFFUlhJVFkzWGtudjk5RW5kcWl4?=
 =?utf-8?B?bXlVSU93M3RxYWdFSGNKSzRkemF3MWI0QVJOOFIyMnVoaFNDSUNaZ3NEeTFv?=
 =?utf-8?B?QzhpYUIvVnZCTDk0WGZqd2RERGt2SVBhaUxabm9NdkdiVjRnR0NaQVNoMldi?=
 =?utf-8?B?M0ZuNXZoQnpicDF6MFlQSFR2Z2ZMcXhWSTFoNUJjZkl5eUx2SnVabndja05l?=
 =?utf-8?B?VXlwKzFXUER1czNFVUYwcVQrL0ZlQVNaNjVzb29jOE9hYkhBQU5TTzZ1QnlL?=
 =?utf-8?B?VUkyaE5HUC9FZEMwenBPakxIYWFuWjFGaGdka1RsZVdaT0d0STFacUpzc21o?=
 =?utf-8?B?THQ0ajRBTzY5U3ExUVpRTTZVVXVmcGFvWUZBZGNFQTN3ZFRGWXhFaTdTOXV1?=
 =?utf-8?B?ck9PZHpTcS9xSVFWLzhBVllXSkp2NFFtMVVnYXg0VzJqcldkZlpWUWV2TWto?=
 =?utf-8?B?elJWaW1wVHZaR0xoMXRPUXQyRTRYc2lCeWo1NzVsRW1wb3NTVWU0UXAvOW9u?=
 =?utf-8?B?ZEZkdTF5dHlIclNwYktzYWRHc0RRTkthS2piVEo5bkpFWDAwbVlNOTgwQzRx?=
 =?utf-8?B?NUlNZmJMamdkRzIxeTFuZXpsQXBTeGRWaWRUN0E4eGJEVFF1WWdZdGRYWHZP?=
 =?utf-8?B?dkRtejIzeU05VnBBdnlGRml5RUpadnA1cjJxcENFWWY0NERsakE3YW5hZk83?=
 =?utf-8?B?RDRnd0Q4SHkyVk4zSXhnSDIxbkc3bzd6cSttckwybWpCRHRyaEZlTE9DWWFR?=
 =?utf-8?B?Sk45TXJLNUdubkxDUHB6cmV0c0NJNENvKzhMWWduWHhVcXY2d3JNKytvc0ZD?=
 =?utf-8?B?Q1d0K0o1WG1JQ0RBNUNtZkhBYVlXdWZVOHRteEhUeW4rY2dvWHVsb09pTlo5?=
 =?utf-8?B?cFRkZHZXMC9TUWZRWkFCd2JiMFhnblhHcVVRb3Rxa25qYm1Ibjh4K29RSmdV?=
 =?utf-8?B?Qy9vUHVvODVNUGRYcy9FU0wvcE81R3h4Q2lrblBoYlJzV3M2Rms0TXhGdkRU?=
 =?utf-8?B?aHBoVzM0b0kxQzhJbkdibzZWaThGUDNSMUltMXp6TXFxU29vanlINFZBV1Y5?=
 =?utf-8?B?Z3JtM1VGN21uTnRLZGtGMFJYQ3pub2N5emQ4QXRCSHRVQ01ackFZQXliWHlj?=
 =?utf-8?B?ZmtNZzNMdjhJYTFwcE83UTBDS2ppaEh6aFQ0dkFxeHE5azIyd29ZRDkrNWUr?=
 =?utf-8?B?dnZ4QkQ0cTh3bURrTzNzL1FsZnBmbG9BTWVaQStiMy9iYkFWUDR0OUZrajJE?=
 =?utf-8?B?VkVPd0pWUWt5d1p4Nm9LejBadFh0ZXA0a3cwNXJDbm0wUThTeUpDR1lDMUN1?=
 =?utf-8?B?R2I5WHQ3VEJsNVFUREo2WjBLczc4Wkc2WUlNM2hkaWhBaUdUOTZkYW5KMmtj?=
 =?utf-8?B?TFVHN0JJc0RKK0lTTHlVc0lYSmNqSm1DVmprdy9PWEZVR1VvdE52RXJhcXZE?=
 =?utf-8?B?WnBlajN5S2FldG5pZ0pNdFBiQzhtOC8zL20xTmJqc2JiYlZNYnl4SThTeUtZ?=
 =?utf-8?B?ODE0Q2laa0FTVUM0SmlTVW9FSDgxSGY1TStKdzhlWkVGbnFENVdiSXZpbDU1?=
 =?utf-8?B?bmFwcGxMYlFCdWVNbjFUdi9XWmxlNEVJZ0wxeW04aEgyUDB0dU9LSHMrQldE?=
 =?utf-8?B?TUxOamRGVS9ETFZGbjJZUE1waXZabHEyQm51bHlEUlgyMXRjdTIxeU5OVWZ2?=
 =?utf-8?B?RlV6MitrY1ZYbUNVMlAzWnpCN2VhdHFuRHc4L1o1eDlpRWRYVDFEaHRyeEVj?=
 =?utf-8?B?aTZzK3BsQlhFRlJoMUV3U0xVcHhCRXVrUE9VNUNDMDJuN0E5R1BwTk9OY1Fn?=
 =?utf-8?Q?vSRBGOpRo/uTRIXo=3D?=
X-Exchange-RoutingPolicyChecked: LUO5jsXDVqEmQrMcB4+9RfB5zSTDmBwK8Xp/X0MVIpeUXr01Fi5g98kUi6IjX/6hlOqFtYxQn2otFFzlFxSm9EsLsrA0zreVydWh/ClmLz0cOwCLPT9eH06OSdmhPGaCWU4xo6foDm5IghBfxNEayn1UlUfEMiKjbnIO7jcHEzh5YNixP+++aWhEFZATLilZ/Q6vrmZfxve+P+psUoduVFFIXDIgng1L/Fp9C+3xY2IrLMsSMi9YqLdwIv4y6V9jgp3gKiaGQkrX/jURecWwgPYxa3UENa0Rdo2PrAID5mDxJ/4CL5ajgKq9Sxa73Dzk6jEzCaVuMKRvkCNQfuaJFA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 56a0de7a-1f5c-408c-0540-08df17e60760
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 13:41:24.8057 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VcxLjbl1CwczRRsWr405tkUiGWHOVWILBJPxLjcJLl+o9Om9S70ncnYd424CltkivYSMsJl6hUx58ipsdKglIXt/ApFsP79UnGbuvKoANHM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7113
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



On 05-09-2026 02:46, Matthew Brost wrote:
> No reason to use the GPU for binds.
> 
> Benefits of CPU-based binds:
> - Lower latency once dependencies are resolved, as there is no
>    interaction with the GuC or a hardware context switch both of which
>    are relatively slow.
> - Large arrays of binds do not risk running out of migration PTEs,
>    avoiding -ENOBUFS being returned to userspace.
> - Kernel binds are decoupled from the migration exec queue (which issues
>    copies and clears), so they cannot get stuck behind unrelated
>    jobs—this can be a problem with parallel GPU faults.
> - Paves the for path decouping binds from tiles and individual engines
> - Enables ULLS on the migration exec queue, as this queue has exclusive
>    access to the paging copy engine.
> 
> Update migration layer to formulate a PT job which will issue CPU bind
> in the submission backend.
> 
> All code related to GPU-based binding has been removed.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Link: https://patch.msgid.link/20260228013501.106680-14-matthew.brost@intel.com
> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
> ---
>   drivers/gpu/drm/xe/xe_bo_types.h |   2 -
>   drivers/gpu/drm/xe/xe_migrate.c  | 249 +++----------------------------
>   drivers/gpu/drm/xe/xe_pt.c       |   1 -
>   3 files changed, 17 insertions(+), 235 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
> index 0eb93052c1d5..8ec4a01a0092 100644
> --- a/drivers/gpu/drm/xe/xe_bo_types.h
> +++ b/drivers/gpu/drm/xe/xe_bo_types.h
> @@ -90,8 +90,6 @@ struct xe_bo {
>   
>   	/** @freed: List node for delayed put. */
>   	struct llist_node freed;
> -	/** @update_index: Update index if PT BO */
> -	int update_index;
>   	/** @created: Whether the bo has passed initial creation */
>   	bool created;
>   
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index ba8e195afcc8..e5c46e0fa960 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -77,18 +77,12 @@ struct xe_migrate {
>   	 * Protected by @job_mutex.
>   	 */
>   	struct dma_fence *fence;
> -	/**
> -	 * @vm_update_sa: For integrated, used to suballocate page-tables
> -	 * out of the pt_bo.
> -	 */
> -	struct drm_suballoc_manager vm_update_sa;
>   	/** @min_chunk_size: For dgfx, Minimum chunk size */
>   	u64 min_chunk_size;
>   };
>   
>   #define MAX_PREEMPTDISABLE_TRANSFER SZ_8M /* Around 1ms. */
>   #define MAX_CCS_LIMITED_TRANSFER SZ_4M /* XE_PAGE_SIZE * (FIELD_MAX(XE2_CCS_SIZE_MASK) + 1) */
> -#define NUM_KERNEL_PDE 15
>   #define NUM_PT_SLOTS 48
>   #define LEVEL0_PAGE_TABLE_ENCODE_SIZE SZ_2M
>   #define MAX_NUM_PTE 512
> @@ -113,7 +107,6 @@ static void xe_migrate_fini(void *arg)
>   
>   	dma_fence_put(m->fence);
>   	xe_bo_put(m->pt_bo);
> -	drm_suballoc_manager_fini(&m->vm_update_sa);
>   	mutex_destroy(&m->job_mutex);
>   	xe_vm_close_and_put(m->q->vm);
>   	xe_exec_queue_put(m->q);
> @@ -234,8 +227,6 @@ static int xe_migrate_pt_bo_alloc(struct xe_tile *tile, struct xe_migrate *m,
>   	BUILD_BUG_ON(NUM_PT_SLOTS > SZ_2M/XE_PAGE_SIZE);
>   	/* Must be a multiple of 64K to support all platforms */
>   	BUILD_BUG_ON(NUM_PT_SLOTS * XE_PAGE_SIZE % SZ_64K);
> -	/* And one slot reserved for the 4KiB page table updates */
> -	BUILD_BUG_ON(!(NUM_KERNEL_PDE & 1));
>   
>   	/* Need to be sure everything fits in the first PT, or create more */
>   	xe_tile_assert(tile, m->batch_base_ofs + xe_bo_size(batch) < SZ_2M);
> @@ -391,17 +382,9 @@ static void xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
>   		}
>   	}
>   
> -	if (ofs)
> -		*ofs = map_ofs;
> -}
> -
> -static void xe_migrate_suballoc_manager_init(struct xe_migrate *m, u32 map_ofs)
> -{
>   	/*
>   	 * Example layout created above, with root level = 3:
>   	 * [PT0...PT7]: kernel PT's for copy/clear; 64 or 4KiB PTE's
> -	 * [PT8]: Kernel PT for VM_BIND, 4 KiB PTE's
> -	 * [PT9...PT40]: Userspace PT's for VM_BIND, 4 KiB PTE's
>   	 * [PT41 = PDE 0] [PT44...PT47 = 4K and 2M vram identity maps]
>   	 *
>   	 * This makes the lowest part of the VM point to the pagetables.
> @@ -409,19 +392,13 @@ static void xe_migrate_suballoc_manager_init(struct xe_migrate *m, u32 map_ofs)
>   	 * and flushes, other parts of the VM can be used either for copying and
>   	 * clearing.
>   	 *
> -	 * For performance, the kernel reserves PDE's, so about 20 are left
> -	 * for async VM updates.
> -	 *
>   	 * To make it easier to work, each scratch PT is put in slot (1 + PT #)
>   	 * everywhere, this allows lockless updates to scratch pages by using
>   	 * the different addresses in VM.
>   	 */
> -#define NUM_VMUSA_UNIT_PER_PAGE	32
> -#define VM_SA_UPDATE_UNIT_SIZE		(XE_PAGE_SIZE / NUM_VMUSA_UNIT_PER_PAGE)
> -#define NUM_VMUSA_WRITES_PER_UNIT	(VM_SA_UPDATE_UNIT_SIZE / sizeof(u64))
> -	drm_suballoc_manager_init(&m->vm_update_sa,
> -				  (size_t)(map_ofs / XE_PAGE_SIZE - NUM_KERNEL_PDE) *
> -				  NUM_VMUSA_UNIT_PER_PAGE, 0);
> +
> +	if (ofs)
> +		*ofs = map_ofs;
>   }
>   
>   static bool xe_migrate_needs_ccs_emit(struct xe_device *xe)
> @@ -466,7 +443,6 @@ static int xe_migrate_lock_prepare_vm(struct xe_tile *tile, struct xe_migrate *m
>   			return err;
>   
>   		xe_migrate_prepare_vm(tile, m, vm, &map_ofs);
> -		xe_migrate_suballoc_manager_init(m, map_ofs);
>   		drm_exec_retry_on_contention(&exec);
>   		xe_validation_retry_on_oom(&ctx, &err);
>   	}
> @@ -1169,6 +1145,9 @@ struct xe_lrc *xe_migrate_lrc(struct xe_migrate *migrate)
>   	return migrate->q->lrc[0];
>   }
>   
> +/* XXX: With CPU binds this can be removed in a follow up */
> +#define NUM_KERNEL_PDE 15
> +
>   static u64 migrate_vm_ppgtt_addr_tlb_inval(void)
>   {
>   	/*
> @@ -1788,56 +1767,6 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
>   	return fence;
>   }
>   
> -static void write_pgtable(struct xe_tile *tile, struct xe_bb *bb, u64 ppgtt_ofs,
> -			  const struct xe_vm_pgtable_update_op *pt_op,
> -			  const struct xe_vm_pgtable_update *update,
> -			  struct xe_migrate_pt_update *pt_update)
> -{
> -	const struct xe_migrate_pt_update_ops *ops = pt_update->ops;
> -	struct xe_vm *vm = pt_update->vops->vm;
> -	u32 chunk;
> -	u32 ofs = update->ofs, size = update->qwords;
> -
> -	/*
> -	 * If we have 512 entries (max), we would populate it ourselves,
> -	 * and update the PDE above it to the new pointer.
> -	 * The only time this can only happen if we have to update the top
> -	 * PDE. This requires a BO that is almost vm->size big.
> -	 *
> -	 * This shouldn't be possible in practice.. might change when 16K
> -	 * pages are used. Hence the assert.
> -	 */
> -	xe_tile_assert(tile, update->qwords < MAX_NUM_PTE);
> -	if (!ppgtt_ofs)
> -		ppgtt_ofs = xe_migrate_vram_ofs(tile_to_xe(tile),
> -						xe_bo_addr(update->pt_bo, 0,
> -							   XE_PAGE_SIZE), false);
> -
> -	do {
> -		u64 addr = ppgtt_ofs + ofs * 8;
> -
> -		chunk = min(size, MAX_PTE_PER_SDI);
> -
> -		/* Ensure populatefn can do memset64 by aligning bb->cs */
> -		if (!(bb->len & 1))
> -			bb->cs[bb->len++] = MI_NOOP;
> -
> -		bb->cs[bb->len++] = MI_STORE_DATA_IMM | MI_SDI_NUM_QW(chunk);
> -		bb->cs[bb->len++] = lower_32_bits(addr);
> -		bb->cs[bb->len++] = upper_32_bits(addr);
> -		if (pt_op->bind)
> -			ops->populate(tile, NULL, bb->cs + bb->len,
> -				      ofs, chunk, update);
> -		else
> -			ops->clear(vm, tile, NULL, bb->cs + bb->len,
> -				   ofs, chunk, update);
> -
> -		bb->len += chunk * 2;
> -		ofs += chunk;
> -		size -= chunk;
> -	} while (size);
> -}
> -
>   struct xe_vm *xe_migrate_get_vm(struct xe_migrate *m)
>   {
>   	return xe_vm_get(m->q->vm);
> @@ -1938,162 +1867,18 @@ __xe_migrate_update_pgtables(struct xe_migrate *m,
>   {
>   	const struct xe_migrate_pt_update_ops *ops = pt_update->ops;
>   	struct xe_tile *tile = m->tile;
> -	struct xe_gt *gt = tile->primary_gt;
> -	struct xe_device *xe = tile_to_xe(tile);
>   	struct xe_sched_job *job;
>   	struct dma_fence *fence;
> -	struct drm_suballoc *sa_bo = NULL;
> -	struct xe_bb *bb;
> -	u32 i, j, batch_size = 0, ppgtt_ofs, update_idx, page_ofs = 0;
> -	u32 num_updates = 0, current_update = 0;
> -	u64 addr;
> -	int err = 0;
>   	bool is_migrate = is_migrate_queue(m, pt_update_ops->q);
> -	bool usm = is_migrate && xe->info.has_usm;
> -
> -	for (i = 0; i < pt_update_ops->num_ops; ++i) {
> -		struct xe_vm_pgtable_update_op *pt_op = &pt_update_ops->pt_job_ops->ops[i];
> -		struct xe_vm_pgtable_update *updates = pt_op->entries;
> -
> -		num_updates += pt_op->num_entries;
> -		for (j = 0; j < pt_op->num_entries; ++j) {
> -			u32 num_cmds = DIV_ROUND_UP(updates[j].qwords,
> -						    MAX_PTE_PER_SDI);
> -
> -			/* align noop + MI_STORE_DATA_IMM cmd prefix */
> -			batch_size += 4 * num_cmds + updates[j].qwords * 2;
> -		}
> -	}
> -
> -	/* fixed + PTE entries */
> -	if (IS_DGFX(xe))
> -		batch_size += 2;
> -	else
> -		batch_size += 6 * (num_updates / MAX_PTE_PER_SDI + 1) +
> -			num_updates * 2;
> -
> -	bb = xe_bb_new(gt, batch_size, usm);
> -	if (IS_ERR(bb))
> -		return ERR_CAST(bb);
> -
> -	/* For sysmem PTE's, need to map them in our hole.. */
> -	if (!IS_DGFX(xe)) {
> -		u16 pat_index = xe_cache_pat_idx(xe, XE_CACHE_WB);
> -		u32 ptes, ofs;
> -
> -		ppgtt_ofs = NUM_KERNEL_PDE - 1;
> -		if (!is_migrate) {
> -			u32 num_units = DIV_ROUND_UP(num_updates,
> -						     NUM_VMUSA_WRITES_PER_UNIT);
> -
> -			if (num_units > m->vm_update_sa.size) {
> -				err = -ENOBUFS;
> -				goto err_bb;
> -			}
> -			sa_bo = drm_suballoc_new(&m->vm_update_sa, num_units,
> -						 GFP_KERNEL, true, 0);
> -			if (IS_ERR(sa_bo)) {
> -				err = PTR_ERR(sa_bo);
> -				goto err_bb;
> -			}
> -
> -			ppgtt_ofs = NUM_KERNEL_PDE +
> -				(drm_suballoc_soffset(sa_bo) /
> -				 NUM_VMUSA_UNIT_PER_PAGE);
> -			page_ofs = (drm_suballoc_soffset(sa_bo) %
> -				    NUM_VMUSA_UNIT_PER_PAGE) *
> -				VM_SA_UPDATE_UNIT_SIZE;
> -		}
> -
> -		/* Map our PT's to gtt */
> -		i = 0;
> -		j = 0;
> -		ptes = num_updates;
> -		ofs = ppgtt_ofs * XE_PAGE_SIZE + page_ofs;
> -		while (ptes) {
> -			u32 chunk = min(MAX_PTE_PER_SDI, ptes);
> -			u32 idx = 0;
> -
> -			bb->cs[bb->len++] = MI_STORE_DATA_IMM |
> -				MI_SDI_NUM_QW(chunk);
> -			bb->cs[bb->len++] = ofs;
> -			bb->cs[bb->len++] = 0; /* upper_32_bits */
> -
> -			for (; i < pt_update_ops->num_ops; ++i) {
> -				struct xe_vm_pgtable_update_op *pt_op =
> -					&pt_update_ops->pt_job_ops->ops[i];
> -				struct xe_vm_pgtable_update *updates = pt_op->entries;
> -
> -				for (; j < pt_op->num_entries; ++j, ++current_update, ++idx) {
> -					struct xe_vm *vm = pt_update->vops->vm;
> -					struct xe_bo *pt_bo = updates[j].pt_bo;
> -
> -					if (idx == chunk)
> -						goto next_cmd;
> -
> -					xe_tile_assert(tile, xe_bo_size(pt_bo) == SZ_4K);
> -
> -					/* Map a PT at most once */
> -					if (pt_bo->update_index < 0)
> -						pt_bo->update_index = current_update;
> -
> -					addr = vm->pt_ops->pte_encode_bo(pt_bo, 0,
> -									 pat_index, 0);
> -					bb->cs[bb->len++] = lower_32_bits(addr);
> -					bb->cs[bb->len++] = upper_32_bits(addr);
> -				}
> -
> -				j = 0;
> -			}
> -
> -next_cmd:
> -			ptes -= chunk;
> -			ofs += chunk * sizeof(u64);
> -		}
> -
> -		bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
> -		update_idx = bb->len;
> -
> -		addr = xe_migrate_vm_addr(ppgtt_ofs, 0) +
> -			(page_ofs / sizeof(u64)) * XE_PAGE_SIZE;
> -		for (i = 0; i < pt_update_ops->num_ops; ++i) {
> -			struct xe_vm_pgtable_update_op *pt_op =
> -				&pt_update_ops->pt_job_ops->ops[i];
> -			struct xe_vm_pgtable_update *updates = pt_op->entries;
> -
> -			for (j = 0; j < pt_op->num_entries; ++j) {
> -				struct xe_bo *pt_bo = updates[j].pt_bo;
> -
> -				write_pgtable(tile, bb, addr +
> -					      pt_bo->update_index * XE_PAGE_SIZE,
> -					      pt_op, &updates[j], pt_update);
> -			}
> -		}
> -	} else {
> -		/* phys pages, no preamble required */
> -		bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
> -		update_idx = bb->len;
> -
> -		for (i = 0; i < pt_update_ops->num_ops; ++i) {
> -			struct xe_vm_pgtable_update_op *pt_op =
> -				&pt_update_ops->pt_job_ops->ops[i];
> -			struct xe_vm_pgtable_update *updates = pt_op->entries;
> -
> -			for (j = 0; j < pt_op->num_entries; ++j)
> -				write_pgtable(tile, bb, 0, pt_op, &updates[j],
> -					      pt_update);
> -		}
> -	}
> +	int err;
>   
> -	job = xe_bb_create_migration_job(pt_update_ops->q, bb,
> -					 xe_migrate_batch_base(m, usm),
> -					 update_idx);
> +	job = xe_sched_job_create(pt_update_ops->q, NULL);
>   	if (IS_ERR(job)) {
>   		err = PTR_ERR(job);
> -		goto err_sa;
> +		goto err_out;
>   	}
>   
> -	xe_sched_job_add_migrate_flush(job, MI_INVALIDATE_TLB);
> +	xe_tile_assert(tile, job->is_pt_job);
>   
>   	if (ops->pre_commit) {
>   		pt_update->job = job;
> @@ -2104,6 +1889,12 @@ __xe_migrate_update_pgtables(struct xe_migrate *m,
>   	if (is_migrate)
>   		mutex_lock(&m->job_mutex);
>   
> +	job->pt_update[0].vm = pt_update->vops->vm;
> +	job->pt_update[0].tile = tile;
> +	job->pt_update[0].ops = ops;
> +	job->pt_update[0].pt_job_ops =
> +		xe_pt_job_ops_get(pt_update_ops->pt_job_ops);
> +
>   	xe_sched_job_arm(job);
>   	fence = dma_fence_get(&job->drm.s_fence->finished);
>   	xe_sched_job_push(job);
> @@ -2111,17 +1902,11 @@ __xe_migrate_update_pgtables(struct xe_migrate *m,
>   	if (is_migrate)
>   		mutex_unlock(&m->job_mutex);
>   
> -	xe_bb_free(bb, fence);
> -	drm_suballoc_free(sa_bo, fence);
> -
>   	return fence;
>   
>   err_job:
>   	xe_sched_job_put(job);
> -err_sa:
> -	drm_suballoc_free(sa_bo, NULL);
> -err_bb:
> -	xe_bb_free(bb, NULL);
> +err_out:
>   	return ERR_PTR(err);
>   }
>   
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 16126ffc2ec1..24190ba4f533 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -387,7 +387,6 @@ xe_pt_new_shared(struct xe_walk_update *wupd, struct xe_pt *parent,
>   	entry->pt = parent;
>   	entry->flags = 0;
>   	entry->qwords = 0;
> -	entry->pt_bo->update_index = -1;

Patch LGTM
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

Sashiko's comment regarding "Memory leak of `xe_pt_job_ops` and 
`job->fence" needs to be handled in
https://patchwork.freedesktop.org/patch/751036/?series=149888&rev=8


>   	entry->level = parent->level;
>   
>   	if (alloc_entries) {


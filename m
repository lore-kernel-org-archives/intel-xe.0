Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 682C7C44501
	for <intel-xe@archiver.kernel.org>; Wed,  8 Jul 2026 20:58:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14E3710F082;
	Wed,  8 Jul 2026 20:58:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nkAYjkz1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0A2310F082
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Jul 2026 20:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783544285; x=1815080285;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=sUROKVkJ4O+3X5yFuJHOJ/WExbvt8QoZzHo1u5jOITI=;
 b=nkAYjkz1/zlsfTh1oL9Sy4rEkt8qycd1V/afgINn8LUYo2e67qD6nWoO
 YFqPd0dUJL2EeOG1VJcAuA9Qcf+NLWvz1DUnJ6R3Wqr9cV1K7SEGKKnut
 6TRtOwyeEEyGQSf3Sw6uGDxj07/rMMHhCvfL7xdwGHuD4YqMFZ6TJdrfO
 OAi1gr3c1Jf+iRQQwoIpZPnrLaOJB4O1uD86sIt1f2Sbdh2CZBwpKW7VT
 G8TIVxBCIrStZc0F/lUGJANeeomKyTexz5tiBJk/fo3V0GiRKm+QR1mBD
 ghjyg8t7sMrLfhg1eBfK1ij3G/MhQkA35rSsMXlBm5J4l/M5SUOMF1FJm w==;
X-CSE-ConnectionGUID: Uy55cR0iRWaHP9xT7Nvg/g==
X-CSE-MsgGUID: FLmcR/ZoQiGGWk5a7hvm4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84316672"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="84316672"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2026 13:58:05 -0700
X-CSE-ConnectionGUID: o/DgoJ06QC6PfhVRf7NcOQ==
X-CSE-MsgGUID: ZIKjziMxQEqoBPTvc0RylA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="256309329"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2026 13:58:04 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 8 Jul 2026 13:58:03 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 8 Jul 2026 13:58:03 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.5) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 8 Jul 2026 13:58:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RnK2T6D8nFY0hwtLZ4jA1wceglrwZZpIvwad4rih57MzRyf1DcjzI8jFAXRGFfXCM2v+MW14fEnyRdsdpct/kHIho1nAeCLuOM7/PyINuy2HO2c+yagV9ZhZlOVwc3HfgZPUMAM3/L7hlfSsj2JPxsR2MRoLPV9d4a6uTujPRwJ2yL7IRgEEE9XPE+XY9CCmIocOAf6GKFDUrGsZZrVCgKg2sVU1tU9Mcxk+gjfojM/uQM/Yy1yesKxltBItRxVQ+SYYSoDpYBFzT4Hk4u1HQE2aQrh580TX0LqsRpKE6s85avwkLPZcgThXgeV8h79KZkWtuetViJ8O54gw8zTTCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cnHm9/j4DhngTSLUyknS4v1kpDg1Nn8FNL7oObIwOcc=;
 b=Mpe3sqODOAcsCGtRVpcCO7/14MqIgZLvJ5K5K2POAGpsJ9xd2xGSYf7eg3yEjyJUr4Ki6QYEMDHjdMMOcRnr1wNIcx3SEb3HZBfLS6VJLtmyTVVt8RuMjcmQpBDAcllTazBiGwK9a5bpRWD5n96VqC1+0BHnFSlT6FwR0FW1Cqac1QEC+NrOoq1nLbrB/V/fCZhEtDYOYxzxmZd0jntoQNXtkRX296kTPWT2yFvz5KxFfeRzxZ/481ZizJkg5F5zlU5uJQlvIInyLkDOCbtrY1OIfegapygOyi7XiwuzE8o0WBSsC4OSJmXESpREiXcmhweWJ4M178xYAT3RhNUr1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by DS4PPF11E6CAE14.namprd11.prod.outlook.com (2603:10b6:f:fc02::c) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Wed, 8 Jul
 2026 20:57:55 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::f3ff:11d0:7a52:db0c]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::f3ff:11d0:7a52:db0c%4]) with mapi id 15.21.0181.008; Wed, 8 Jul 2026
 20:57:55 +0000
Message-ID: <80c30800-2206-4088-82a0-6ac85b64ea76@intel.com>
Date: Wed, 8 Jul 2026 13:57:53 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/xe: Add sysfs for GT/IA bias
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20260706213636.2743937-1-vinay.belgaumkar@intel.com>
 <20260706213636.2743937-3-vinay.belgaumkar@intel.com>
 <61173c7f-5937-4772-9c47-aba57b5868e3@intel.com> <ak6n1pBJ8ILIJ7fm@intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <ak6n1pBJ8ILIJ7fm@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0298.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::33) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|DS4PPF11E6CAE14:EE_
X-MS-Office365-Filtering-Correlation-Id: 769bf075-147c-4f77-fdd9-08dedd3394fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|18002099003|22082099003|4143699003|6133799003|56012099006|5023799004|11063799006;
X-Microsoft-Antispam-Message-Info: ad2NdE4/mHw+P4YZPrYj4NeJjSq1Zpc2Hwns0RAQZ99IwyPetCH3cX8f0D/2atvlRxvMC3jI1VrA4B9ss8b+Sd2MAKKfX4sSakIKwvavU/8ScxMOWDkUlIZmS4UqZ7vnYBBj5DpIZxyH8sZKoBjvvtWS7036joo8QGUFbvpUhcwvMtcgtJUv6vSzcQHdv/lru/9dy3KLFj2QYEmXCJ+uyV5XGh5OTkSOcOTjZAmok7bEKwBXAr6hns9pog4gSouRcq2I6KT3kXMDA3ypwkO06xTmhTJiCkLU89gfp7HnOBFiBg9KMoFfue3NxnpHlTkHFYrqIuopnaHedsstwx57UwUj1X3VlrdkHO1pVUTbgc1EzMNFt2fzqmd01X3uQJuOKaCzSUasohF8+vuIlw8HY4uKFW9Tczy3K0j4RMGV37Lw9CszmQT2rsTb8TchK32W3uU5egfUEBylsxWwf8zU7llpmyyb8JBPpwpyjMJjtdOP/0XrPIoNeaTnqhncfdit99qmQJvCvmqkGV2zN4rwqLNqgzlMyHQjHL6d+WS4uC+GWhx/+24chOdW2QDkhRg0jvZzZweheOrZJUUuq/EHm1b5NrINQ74TPNNMylpWTDo/g44FYbHxFiRVZdD8nKRgFfj2DKB4stV4qjlPhoQ/JFERaliKY9L9m+PQD/Ovfi0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(18002099003)(22082099003)(4143699003)(6133799003)(56012099006)(5023799004)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eXA1eTUxSElWcmNjZWViMlRoak1FYlhXeDVReGZRRW1xSE1NSUI1d1hya05G?=
 =?utf-8?B?ZWFBOHpZNmhtZy83V1JpNDloQjAwaGdtTDFFUHVpcWptMlBla3l2SWgyQzMw?=
 =?utf-8?B?UUw5NllSWFZrbUxTQkZBVkdDNVZqcHcwaDhlVStaWUwyZFdteVdFWUdiZW5z?=
 =?utf-8?B?SlZVckhSdXhHeElMTE5qQVl3empKVFdLeXVQZTl4d3BzUTlCK3djdC9FeUlH?=
 =?utf-8?B?UEgyTnA2NGZiTzV2MHdFYlo3M1J0anR1djMzWm1KTzE1MUY1Vm9VNndVbUg5?=
 =?utf-8?B?Z3picTMwVnVYNllFWE1LbkE3ZWk2YmpjYkt6ZVZzMDZmT0xzZHVzUTJTdVdZ?=
 =?utf-8?B?T1FaOFMwMS9KanZKUUxXc2sxVVVDOURlRkF1a05xalpJRk9aNzI1SDVnYUhY?=
 =?utf-8?B?TmhGTWhKQ0M4UWVMcE5LSUtqakhsdTJVUmp5d1pFSDVxSEs2TWxkeHBqMXFR?=
 =?utf-8?B?cjRldkNESnppNTllUTNSLzltVVRzRzZkQjFYeTZPSnF5dWc0Um1ReHRZc3FG?=
 =?utf-8?B?eDlnbjhJMDJhNC9TWXN4Z20reUZVaG9CY1RibitFcGtNbGNjYkw4eUM0KzNi?=
 =?utf-8?B?dnZtSkR5SzFFcFF1RWNzcUR5REh6enBUU0xzVnN0emoySFpXNzBWYXkrM3JS?=
 =?utf-8?B?WFR0Sk1RQXZCNnhZK3lDeUNBRTRPVTZYdjNITGtFbU1YdnZuaXJwcGJnelhG?=
 =?utf-8?B?Z0x6RERkVXdEWm1zMytRZVhTNlBGeWdZdjhOcVVkQml4U05IVTBETjBJVEN0?=
 =?utf-8?B?aXBhUHk1c2dVdTNqaDN3SG5zU0cvMHpGaWV4b0Z6Ty9HSXJRT3NTSEJ4djFr?=
 =?utf-8?B?LzBwU2Zabm5FRjkwWEhFNVBYWmpvVWl2bWhHRUttZkRHWms5ZXV4dHBKYmRn?=
 =?utf-8?B?cVE2b05rSlNvL094ZjFCdWQrZkoxMXEzejNmYVowcW1iek1BZkJoWk1GZTds?=
 =?utf-8?B?VEUxcU1rZDVnWjZRSGJCS21YUjY2ZTRxUEhnUHJJVUZiRUFWc2w3KzVzMGwy?=
 =?utf-8?B?bnU2SjEwVStLdGdCMENMU2VTT0tFMS9wUGNwS1hQcHdhbmRaSHQwbTk2ZVBL?=
 =?utf-8?B?R2pBTXR4Q0psVEs2akg1QTB4dDZXa0d0U0kzeXN1WmxwL1d5NTVPWGZGTHJP?=
 =?utf-8?B?bWNQaHNyb2QrZmlrRzBuQlBocDVOdDl6MWQyZCsxeCtVaEFOWG9FaUF6eXZP?=
 =?utf-8?B?VkxGTTZSQ1RGbS8waXdyRk5SY2FkcGFHV0JrMmMvbExNajBxbzcrS1kxN1Bo?=
 =?utf-8?B?L3NEVVpVblIxOG1qSktkaGNQMjQ2cXM5SUMrQUQ5Z3liY1R4aUN5cFlBYkpO?=
 =?utf-8?B?S25UcDZOb2tQVGFFSUxKTHlrSnFUMzh5MUhOQWRjZXZ3Rzl5TnVHZ3ZmRFJM?=
 =?utf-8?B?L3JuYnFPbWpCNDdMTkswcWNtSEdkL0tLVGV4OVFINDUrSUJtaE13eEhmUnRW?=
 =?utf-8?B?d2UwQ3FjcGM2SERwd0dhY0tLV25HL0dLelZybk91cGMxRmQ1QmdQaGRWQnpJ?=
 =?utf-8?B?emdxNEdNYWRsSjlLYlZFTnlMZUlWaGlINWFsOXpRWGt5WCtjSkxVM0ZZaEFB?=
 =?utf-8?B?WGdZT29ySVYrQkwvd3VGanh0TWJTMnJTbzViNHZwbmJTdHNtTG1MN0VVdG0v?=
 =?utf-8?B?bFVkYjh2ZWZxc3Z4NnkwOVUzYnhpa2JvYm9ybjExcWx1bitPcEtQUXIrcjFZ?=
 =?utf-8?B?T0syZGVzMDFrSHRJcWUrcHJpNnlUQTNWcDRuZThPVHBsamY0dzNqWlQvUlhY?=
 =?utf-8?B?MGZ2WWtBNWxhYzcrbE1lYWVvaG5QVmVnS0JNRkl2SFF2MjcvOHNsejBFSVdK?=
 =?utf-8?B?UUE3UmxPOVhtWjZ0VTVxNWZ4bEMrRUI4MU42Zk03R1Z5QzQyTWNjblpmL2w3?=
 =?utf-8?B?a0hGQjhpNEVmelFIbFp3ekFScXZUalE1ZHpQcS81QmNSVU02d2tsT1Q4anJI?=
 =?utf-8?B?S2IvTDRKVFVrbE0vZWt2T0UyMEI3ZjBMZklvdm9VQTlmQVJwdmNzUUNHckZV?=
 =?utf-8?B?ZWlHMm9wWWNRYnBPRVBsd0RlWFFSV3lOekZTaVhiczZqT2hIN2pqUnZxcDl3?=
 =?utf-8?B?TDViQXFEYlk3WEpMRjlDRUVyNXY3S1RzVy9RcENLWHEySCthV2FDMnRZTHdN?=
 =?utf-8?B?eml5bmxROERiNjNpazBLWXRWNE4vQTJDcHBoL05DeEFqUEllS096TnVQU0pD?=
 =?utf-8?B?SHJiN0pPRS9ERmFRY0xWVXFadHdHbUk3Qk83RXlFcjlhdzdVT3A0WDFMNHpx?=
 =?utf-8?B?SjIzQXUyQ1lWYVpjWi93TGF0NGdjS0FhREtTM3YzendlWjIwdE5DWkZNMFZE?=
 =?utf-8?B?S2xwa1hzeDZDd3RlQXM0aXlFSHBxSzBuQVBZZkNSSDExeC83S1dBSE1XZ1hK?=
 =?utf-8?Q?vGXuEi9dOEjVEtF8=3D?=
X-Exchange-RoutingPolicyChecked: Uqt2zQjlMyEnoS8L077NhEE5mZNJgDxmg5PZrreee0CDeIvfyUEnpLusahJqzUFOZM89TLlj7aaGUo/JO6/M6s4+6Lv2AkKyWf7A59aneNlQ8CvbECnLkM+YB1ndzATu6y+4H686We4npYEC/cKB7G6ATnEIaRLcdYMw738ScPhI6GXRTXwKWYVsZNAKPdjtgMuNgmi3pz4Viv7BsTDRTYuw+3vWItXt7ZDiqHvK9biNoYUplub5OVdvzro7MJ17CxMKN3MFTbdrvAQ8MtVy6BjcgkCkWsFPdg3oD9e32m2n28rK0nJFTpSLhsq7Ru3GxwO+UkUs/elND1WlnzA6ww==
X-MS-Exchange-CrossTenant-Network-Message-Id: 769bf075-147c-4f77-fdd9-08dedd3394fe
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 20:57:54.8591 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /Rj2AA/6xSfLSj40ZS/5X7TurajYPVQezIyam5Z4ClGVMCpwJqRAXujF26UfEH8Qs5H1zkS2DMPXu8R7EsARPKFwJF5W0Nu8bpzi7e+hugc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF11E6CAE14
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


On 7/8/2026 12:41 PM, Rodrigo Vivi wrote:
> On Tue, Jul 07, 2026 at 12:48:05AM +0200, Michal Wajdeczko wrote:
>>
>> On 7/6/2026 11:36 PM, Vinay Belgaumkar wrote:
>>> GT_IA_PERF_BIAS_REG indicates power budget between IA and GT.
>>> Lower 16 bits correspond to IA and upper to GT. Higher value
>>> indicates more bias towards that plane. The values are in U1.15
>>> format.
>>>
>>> $ cat /sys/class/drm/card1/device/tile0/gt0/freq0/gt_ia_bias
>>> GT Bias: 1.000
>>> IA Bias: 0.500
>> "Attributes should be ASCII text files, preferably with only one value per file"
>>
>> see https://docs.kernel.org/6.10/filesystems/sysfs.html#attributes
> indeed. But I think the main question here is, do we really want this
> to be a stable API?!
>
> Why don't we go with the debugfs?
> So we print the Hex and the decoded values in the single file
> and we accept the hex as input file?
>
> If we go with sysfs, I wonder if we shouldn't go with decoded,
> but then having 2 separate bias files gt_bias, ia_bias.
>
> But also, if we go with stable API we need a whole documentation, explaining
> the use cases where that might be useful and its limitations. I don't want
> to keep receiving bug reports because people are randomly touching these
> files and getting nothing because they are not in a limited TDP scenario.
>
> And even worse, having to debug other corner case bugs because people
> decided to touch this. So, debugfs?!

Agree about moving this to debugfs since we don't have fixed guidelines 
for its usage.

Thanks,

Vinay.

>
>>> This interface will allow us to observe power budget changes while
>>> running workloads and also, if needed, tune it.
>>>
>>> v2: Decode the bias values (Rodrigo)
>>>
>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/regs/xe_gt_regs.h |  2 +
>>>   drivers/gpu/drm/xe/xe_gt_freq.c      | 71 ++++++++++++++++++++++++++++
>>>   2 files changed, 73 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>>> index 08251c7a1a4b..41c5c5f20964 100644
>>> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>>> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>>> @@ -634,6 +634,8 @@
>>>   #define GT_GFX_RC6_LOCKED			XE_REG(0x138104)
>>>   #define GT_GFX_RC6				XE_REG(0x138108)
>>>   
>>> +#define GT_IA_PERF_BIAS_REG			XE_REG(0x138158)
>>> +
>>>   #define GT0_PERF_LIMIT_REASONS			XE_REG(0x1381a8)
>>>   /* Common performance limit reason bits - available on all platforms */
>>>   #define   GT0_PERF_LIMIT_REASONS_MASK		0xde3
>>> diff --git a/drivers/gpu/drm/xe/xe_gt_freq.c b/drivers/gpu/drm/xe/xe_gt_freq.c
>>> index a40dd074106f..08c0be8defd0 100644
>>> --- a/drivers/gpu/drm/xe/xe_gt_freq.c
>>> +++ b/drivers/gpu/drm/xe/xe_gt_freq.c
>>> @@ -11,10 +11,13 @@
>>>   #include <drm/drm_managed.h>
>>>   #include <drm/drm_print.h>
>>>   
>>> +#include <regs/xe_gt_regs.h>
>> use regular "" include
>>
>>> +#include "xe_gt.h"
>>>   #include "xe_gt_sysfs.h"
>>>   #include "xe_gt_throttle.h"
>>>   #include "xe_gt_types.h"
>>>   #include "xe_guc_pc.h"
>>> +#include "xe_mmio.h"
>>>   #include "xe_pm.h"
>>>   
>>>   /**
>>> @@ -242,6 +245,61 @@ static ssize_t power_profile_store(struct kobject *kobj,
>>>   }
>>>   static struct kobj_attribute attr_power_profile = __ATTR_RW(power_profile);
>>>   
>>> +static ssize_t gt_ia_bias_show(struct kobject *kobj,
>>> +			       struct kobj_attribute *attr,
>>> +			       char *buf)
>>> +{
>>> +	struct device *dev = kobj_to_dev(kobj);
>>> +	struct xe_gt *gt = kobj_to_gt(kobj->parent);
>>> +	u32 val;
>>> +	u32 ia_frac, gt_frac;
>>> +	u16 ia_raw, gt_raw;
>>> +	u16 ia_frac_bits, gt_frac_bits;
>>> +	u16 ia_int, gt_int;
>>> +
>>> +	guard(xe_pm_runtime)(dev_to_xe(dev));
>>> +	val = xe_mmio_read32(&gt->mmio, GT_IA_PERF_BIAS_REG);
>>> +
>>> +	ia_raw = val & 0xFFFF;
>>> +	gt_raw = (val >> 16) & 0xFFFF;
>> use REG_FIELD_GET instead
>>
>>> +
>>> +	/* Uppermost bit is integer value */
>>> +	ia_int = ia_raw >> 15;
>>> +	gt_int = gt_raw >> 15;
>>> +
>>> +	/* Rest are fraction bits */
>>> +	ia_frac_bits = ia_raw & 0x7FFF;
>>> +	gt_frac_bits = gt_raw & 0x7FFF;
>> maybe it is worth to define some Q1.15 helpers?
>>
>>> +
>>> +	/* Up to 3 decimal places */
>>> +	ia_frac = ((uint64_t)(ia_frac_bits * 1000)) / 0x8000;
>>> +	gt_frac = ((uint64_t)(gt_frac_bits * 1000)) / 0x8000;
>>> +
>>> +	return sysfs_emit(buf, "GT Bias: %u.%03u\nIA Bias: %u.%03u\n",
>>> +			  gt_int, gt_frac, ia_int, ia_frac);
>>> +}
>>> +
>>> +static ssize_t gt_ia_bias_store(struct kobject *kobj,
>>> +				struct kobj_attribute *attr,
>>> +				const char *buff, size_t count)
>>> +{
>>> +	struct device *dev = kobj_to_dev(kobj);
>>> +	struct xe_gt *gt = kobj_to_gt(kobj->parent);
>>> +	u32 val;
>>> +	int ret;
>>> +
>>> +	ret = kstrtou32(buff, 0, &val);
>> hmm, shouldn't we accept decoded values as we show them?
>> now it's inconsistent and admin must guess how to encode it properly
> right. it should be consistent, easy to use and not so dependent on hw and fw.
>
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	guard(xe_pm_runtime)(dev_to_xe(dev));
>>> +	xe_mmio_write32(&gt->mmio, GT_IA_PERF_BIAS_REG, val);
>>> +
>>> +	return count;
>>> +}
>>> +
>>> +static struct kobj_attribute attr_gt_ia_bias = __ATTR_RW(gt_ia_bias);
>>> +
>>>   static const struct attribute *freq_attrs[] = {
>>>   	&attr_act_freq.attr,
>>>   	&attr_cur_freq.attr,
>>> @@ -258,8 +316,13 @@ static const struct attribute *freq_attrs[] = {
>>>   static void freq_fini(void *arg)
>>>   {
>>>   	struct kobject *kobj = arg;
>>> +	struct device *dev = kobj_to_dev(kobj);
>>> +	struct xe_gt *gt = kobj_to_gt(kobj->parent);
>>>   
>>>   	sysfs_remove_files(kobj, freq_attrs);
>>> +
>>> +	if (xe_gt_is_main_type(gt) && !IS_DGFX(dev_to_xe(dev)))
>>> +		sysfs_remove_file(kobj, &attr_gt_ia_bias.attr);
>>>   	kobject_put(kobj);
>>>   }
>>>   
>>> @@ -289,6 +352,14 @@ int xe_gt_freq_init(struct xe_gt *gt)
>>>   		return err;
>>>   	}
>>>   
>>> +	if (xe_gt_is_main_type(gt) && !IS_DGFX(xe)) {
>>> +		err = sysfs_create_file(gt->freq, &attr_gt_ia_bias.attr);
>>> +		if (err) {
>>> +			kobject_put(gt->freq);
>>> +			return err;
>>> +		}
>>> +	}
>>> +
>>>   	err = devm_add_action_or_reset(xe->drm.dev, freq_fini, gt->freq);
>>>   	if (err)
>>>   		return err;

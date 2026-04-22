Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10EA6F9EDC3
	for <intel-xe@archiver.kernel.org>; Wed, 22 Apr 2026 12:00:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7FDA10E29C;
	Wed, 22 Apr 2026 12:00:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IepJgb2/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA57010E29C
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Apr 2026 12:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776859244; x=1808395244;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=d7zaOTNmNTx1i74drk6zcNW9twiGu93dZcX0bxEMQsY=;
 b=IepJgb2/Npteia6qVsRlKi40Y5OcJ2LCeJC/9B4aSzQ1CHoRPgGrnIlA
 A0e9mdVHiWARAhyk8+3vTJu45gXr2m+4PEuBQ/eWCsHryqcaAa93WfBq9
 skfpDxTcAAZnJBPnaTfaW1kmZfXmFxw0j8Y9Ezo1m22P6gKqVaymuOL0a
 3XzmkQFgmSM3Um3pa7XH4ign47WZzqGMusr3mttkr0MbfS3bp7KutoLDJ
 MxHGRPAxBIxV0C+iM/TE6FIrejdskG2mwcLlBLNXtSJQiZkeIGA25siHL
 RYvQ52/fAodaq1VfNd8lpvsrRhgp7q97m7xOJMP/aUWIAWOzSir+V3Z4U Q==;
X-CSE-ConnectionGUID: eOPOTRkwSymg8VxNd1wRgA==
X-CSE-MsgGUID: JUDkMdkqQAGZAO+zv8LzGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="89196221"
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; d="scan'208";a="89196221"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2026 05:00:43 -0700
X-CSE-ConnectionGUID: DiyeauNwRuSfiBUZ3tXtmQ==
X-CSE-MsgGUID: VSureTUoS+OWwNv4ukEagQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; d="scan'208";a="229162612"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2026 05:00:43 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 22 Apr 2026 05:00:42 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 22 Apr 2026 05:00:42 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.0) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 22 Apr 2026 05:00:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PN5MnwUpN1YqdB9uf08558cflHpQlYyUBCJ3jsDSOuercplESqzrHu7Q41ysgKNMnRGEqCA18+jwS7lDLUcCBKt++X1tPESNI3GxiQZUjVKuEZlHh+GOm26fOd5ePZe7xEZ4yb95ewa3uMYdofAFSdGV4atDMjwelpsOs3Fs/KA+C7QTty3npQYFzAwdrvxzcDGe3ie6EJnrc56XLd4nvAqaNxufcLYeZZodENtmBE7FfJGMj2Q8JilZpnahIIbMhmrPvbJGCXh2AJAS2cUF4XJCpHEtMq/gtIuG/nizf+GnkJRhbvHkxvaqzmEW00VOQIC7Dfnwt6vMK/E7i6QUGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=emuEhNljEJnyQrwHGrkC9JfUjkSqmdAHiGQsHCyhs7Q=;
 b=TqvK75sW0ZwZx2r7YKVuKe67uQ16vBldQ7fAcocSxyX4nVf8l9ms8Bv1LlDyuSfLDjZp7S0bpvJ5bWGs3eIU0vHNXLpmMtU2Z339qSU26FnD4IkQol/cZ+Qfbfv4/oWm+FADa1+SyFpck/E7+9Vw4Dzj+DdNQUCqntmVEL1o+uv5u5m6wgrFAwistW0+pGxF1iMXDwptEw9aIv42R0//mF8XV4TRDiAlniJsV+Pw8c4wnXGx4zr5hWwq1SjethYfZqZsTg8VIwIwBWX7VFpd9wVo/Hvs2/7LT508g6hHqwMg5sFMCIHxPTTEAeG7BHRQ4jnffddeBav2+i9AOM8l5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8208.namprd11.prod.outlook.com (2603:10b6:8:165::18)
 by IA0PR11MB7305.namprd11.prod.outlook.com (2603:10b6:208:439::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.16; Wed, 22 Apr
 2026 12:00:38 +0000
Received: from DS0PR11MB8208.namprd11.prod.outlook.com
 ([fe80::ecb0:7475:84de:ca9c]) by DS0PR11MB8208.namprd11.prod.outlook.com
 ([fe80::ecb0:7475:84de:ca9c%6]) with mapi id 15.20.9846.019; Wed, 22 Apr 2026
 12:00:38 +0000
Message-ID: <0bc2f97e-f494-4d42-be45-ba85f3cd23c9@intel.com>
Date: Wed, 22 Apr 2026 17:30:30 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/xe: Convert stolen memory over to ttm_range_manager
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Matthew Auld <matthew.auld@intel.com>,
 Vinod Govindapillai <vinod.govindapillai@intel.com>
References: <20260421165047.2421231-2-sanjay.kumar.yadav@intel.com>
 <aehCybEsc1+pAHaV@gsse-cloud1.jf.intel.com>
Content-Language: en-US
From: "Yadav, Sanjay Kumar" <sanjay.kumar.yadav@intel.com>
In-Reply-To: <aehCybEsc1+pAHaV@gsse-cloud1.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0113.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b5::13) To DS0PR11MB8208.namprd11.prod.outlook.com
 (2603:10b6:8:165::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8208:EE_|IA0PR11MB7305:EE_
X-MS-Office365-Filtering-Correlation-Id: 01865936-e0b3-4bb4-c756-08dea066c479
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|18002099003|22082099003|18096099003|56012099003;
X-Microsoft-Antispam-Message-Info: 8CHOJZp548ESB/enrdymj+7BkNH3ODW40vTkNuPOyTHrrec9AWHiCLwxxbT0+ov6u/nMRCZxKIHBLsyCNAoxvJM8FV/Eb//yv4Hip2ZYqlqcA1kKKxAAnO3q5dipW+51RTFAk7HUFsUrUPwjfybvx68QBXX0HvI2yLXeB/kUR+w2KyCEyE3xzagPBaDnVjyQQNb8SueVzuqAdZfu7StGKQd7XRdec+PhZk6IIuVPcqSD4HhocPRvrc7QDuEBGrw4XIqCgzgbMWLbSv6D1ySVvU0wlEufonjJj29A6v5fXzv0hYovx/hMpzhx45Wp1CjvQzKmjln/v/3U8w97nNPfh0uPMXFYkuGfxImNxXWwRCwD7nNxZVJhiHxmN4TlrsbTIGvxMefVXCrYxIEG5RPsEvC1CEZa/MbUWJamaZAjXWQSqyi/jYWYctXYbVh4qb9cuWZjUHBWIcekJULIpXXtS6RhB6NfCCGiD+ZRgYTy4TuMfGgb/eRK/fUxifiuGWJ3H8YHbs2qKPZZy+rgosRfWS3L2NI7D8gwnFczEiyJOY4x0QjTxFwlQAAbk1Guc7zrBhDNMFwH6SRQkFWoROUelFijdezCu1/oxOTiLt0cVeBfxbElT9vLeft7mPjp9286yBXpQXJRmO2qXSs8legWSUrHlDB9ODzRimmeAiuLhCPBLf45iZmcYoMutSFz0zgG
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8208.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(22082099003)(18096099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q2hFVlFwSDRXRE5oYUpYd2RqQ3NDRWtkOGJQQXgyVng0dTNXa2FVYVg1ZXM5?=
 =?utf-8?B?YUM4SGpKYTY3aWdORnF0REJxZ0puUXhLbHBhbXFrTXhCV1BrRnJsaE1oZEtU?=
 =?utf-8?B?ZWRuMjlsdWZ1TmUzMmdmb1U3Mi95bGdRNlQvRU1jQ2tSNjFnM2lYT0xBSE94?=
 =?utf-8?B?TENPNEJwdlVnbGpwWG9yWWNjRXVua3IwZ2wrR0R0QmE5MjVqVzdnRnBSZ3hL?=
 =?utf-8?B?ZUNRWmtWOHpXRm9OU0FqOWhSL3FVWTdiOEdOaVhpR2dHL0N1TC9mb0t4OW1L?=
 =?utf-8?B?QlBPWGFhRlljYUFWcVZjVFZSTXI3Q2pKZTI2TldmMEZIdkM2MVlDYnB2ZDJk?=
 =?utf-8?B?NUFYbERKVlhiQjZOS3VXODVaWkxaYjRKOXo4bmFJSEYrSkFOS0JneW1EQmZ0?=
 =?utf-8?B?WXhXN2xRR1UwQ2VWempoZ0NyOGNINnlpOGpFM3g0MnVJVW50R1RNMkZGRjF3?=
 =?utf-8?B?WW5XMXhKZDF2RFc3aFJaSTlSYXRTcFVVaXZrUENFQ3czbTVOVUo1a0dZaVlL?=
 =?utf-8?B?SC9kU1VsUEhiWVJYa252ZEp6WU5rZjVaOEkraG1CdzhBWXFvRjVxLzRseVF1?=
 =?utf-8?B?M3JSZFNxR3VsTUU2SUVXdEUxWDA0K25STUxFdDRNbVo3Wjk0Z1VTN1RtT2JX?=
 =?utf-8?B?ckhJRDhwVzN1SSsxeDBJb0RxckpVaytTWWd6azIzN3gyUFUwb2k4SUZDYU5U?=
 =?utf-8?B?Rk82UzAxNmU0RjFic3YrWFZJZEtuSlh2aFlzWUJ1WmFoZEFGbWpuUUN1eWYv?=
 =?utf-8?B?WmYwbjM2Y0VFSWwrVmJEd0hUYlhGVXY0TE5WY2h3b1I2emxTY0NhKzcwYVpR?=
 =?utf-8?B?WFp4NUJ0M1VxRm9jWVpFaHVNaVNxczRXdUhpekdyM0N4ZWlQbUF3NWVBdHJG?=
 =?utf-8?B?ZTZhc09rUTRta3ZtTm1McjBUU2I1Smg4dWFHRS9wV0xHOTRuY1hJb2srb0hp?=
 =?utf-8?B?U2cvcXZPKzFNWTZQWXlwVG5rdmY1T21DNVgwQlY5U3ArR04xU01WNXZudlZP?=
 =?utf-8?B?ckRsN0Vta2k4bW5IOFhIaUorbWh5QmoxU2Z1c042OFhUcnR4UUt5by9XUUVT?=
 =?utf-8?B?eFNtY0FYUFA0VURBbHJOTXQ5WUtocjZjeENtanZZRGhnYk4rOXlBNG1Zalh2?=
 =?utf-8?B?RklKMWk0dDhLZDB3YzNQY0pWU1NZVi90dkIyUlovQ3l1cHczUFVZY1JiSXBn?=
 =?utf-8?B?ME1WMzhZcm5JL0lkTkIyNFo4NVhkTjZzOS9oVFgweVlRT0p4ZnlCVGhyZWV5?=
 =?utf-8?B?RHgyUm12TExOUko5K3lwTllzMTdYa3ZDNkE1TU9XWE80ZmFlMXh4aXRaaWsz?=
 =?utf-8?B?TmxLT1hMdURaM0Z6VzFVOURqejY1NjNWVGFYcE5vY254Ymw0ellJM3JyaUJP?=
 =?utf-8?B?VkQ1UEFBZGxtZU5YM3piOWVhbkZOVWQ4SUxVY2lVZUtCUmRuZDZxSjJMQ2hw?=
 =?utf-8?B?OUNGb0FkWjV5ckdJblI1czZKZ0RxRkNubFUxdEM1N2pUU1RMaHNFdWZxUEgw?=
 =?utf-8?B?NllvdXl1c2VTckRyVTNUWjJUTE1aT251N0FiWEs0RXpuaVRsVUJObEF3TGtS?=
 =?utf-8?B?RGt0M24xUERlWHR6eE1nUnJLZXloS0ZobU1WeXh3aHpna25oQjg0Uk5vWHRY?=
 =?utf-8?B?SUF1cUNvR2FrdG9nelF5TXFaaVRNT3YxNGFyOVJrWGNlZ0g3RFpTL3dzL1RP?=
 =?utf-8?B?VVhaNTc1d2MyN3I3Z3E1OXRUYmRJNVloMjlpVzh6bnh5dXJQbnU4WFRJUTgz?=
 =?utf-8?B?L2hkSjY5WXY1Wk9HTG1MZFgvZE91OUc0ZmgrVWdvM0FpUDJoUllCYXJjUmcw?=
 =?utf-8?B?dkNsUzl3ZHhHS1BiQXBuT0R2OWlScUtuYlRrM0N4VDVPenRYY1o1RXBVemdI?=
 =?utf-8?B?Vm1YU1RST2FnbXRudUFueUZES0lQOW9CMllKZ3g2b1VTRTJlQ3B6RFB1czFE?=
 =?utf-8?B?NGdWRGlZeUwrLy9TcmE2SnhkQm9BSnB2YVNWN1VkVHFadjB2VXdwa01wUXVr?=
 =?utf-8?B?eVVreTJOSjNZeWpCdm4xODlhR2svTk41cjkyNEFBMktERFViQ2NHUGxqb0Qv?=
 =?utf-8?B?eExzcnRHdUplMloybE5JbVJQQnVpS0VBS3FJZHkrODNGZGtvU1QxaDR4U0pa?=
 =?utf-8?B?ajFlOWwwQ0dvRWh0SUt0eEkxUWREOWtVcGtka1RvOXhLdXVoSzhGUWVaWnNv?=
 =?utf-8?B?UVI2MnYxblkva2VITkMzS24rdU1BaXJCM01xNlZPbWVFbmIxcExyNDkweFg1?=
 =?utf-8?B?MUJLMC9PbVJpSTdRSGp6NXZqN0NGZTdMUklwQkc5aUt1Wm4wVEw2NUNsL1Bi?=
 =?utf-8?B?QXdqcDAwZS8rN21DOVRtYXlsckJDdlpMdXluZ0hSR2ZUS2VoK2ZLcWtsL0ZE?=
 =?utf-8?Q?6oCu/UCY0ITQPz8M=3D?=
X-Exchange-RoutingPolicyChecked: loRy+BjpgwL8CMS8vGiQY2Gg6U7eCmUhGPJTWUT8KroYjQ/sheZIW6RFeCEu2hjgoEb7gS75+W1bNuz198VVEW3J/IXGbBpc8MFcxml2OgB8xWX4LISEmdIuuo2JE7Sm/47XMSXRv06gnorVVJBxbxsS9V1NCN9Sy8R8niCxDgp6k7aZVyxNCcRox9AkaVteyuQSxf34CvtISxjDZVfCjTjZHqDUXUCRsfhqyJhVgzHeguxB/IN2ptkWa6kptTcwrTTaw1O/3mTnCTvkBQbT2u2gtswJRUK+ZkHVu/j8Q3q+P8aF4ePGbmAIrMoo18wM/8dMI23mjB/G0fKV7qTdtQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 01865936-e0b3-4bb4-c756-08dea066c479
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8208.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2026 12:00:38.1888 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BB7lDWUihQ6uJcRyGywHrUhrTNCLniGIONVjA2hC6Tkkf9eBbplH4yjJizHcQMco/sORj2lYZYSthwds2afN2ZQ8ZdiK04AhLwYn3kZKPic=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7305
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


On 22-04-2026 09:08, Matthew Brost wrote:
> On Tue, Apr 21, 2026 at 10:20:48PM +0530, Sanjay Yadav wrote:
>> Stolen memory requires physically contiguous allocations for display
>> scanout and compressed framebuffers. The stolen memory manager was
>> sharing the gpu_buddy allocator backend with the VRAM manager, but
>> buddy manages non-contiguous power-of-two blocks making it a poor fit.
>> Stolen memory also has fundamentally different allocation patterns:
>>
>> - Allocation sizes are not power-of-two. Since buddy rounds up to the
>>    next power-of-two block size, a ~17MB request can fail even with
>>    ~22MB free, because the free space is fragmented across non-fitting
>>    power-of-two blocks.
>> - Hardware restrictions prevent using the first 4K page of stolen for
>>    certain allocations (e.g., FBC). The display code sets fpfn=1 to
>>    enforce this, but when fpfn != 0, gpu_buddy enables
>>    GPU_BUDDY_RANGE_ALLOCATION mode which disables the try_harder
>>    coalescing path, further reducing allocation success.
>>
>> This combination caused FBC compressed framebuffer (CFB) allocation
>> failures on platforms like NVL/PTL. In case of NVL where stolen memory
>> is ~56MB and the initial plane framebuffer consumes ~34MB at probe time,
>> leaving ~22MB for subsequent allocations.
>>
>> Use ttm_range_man_init_nocheck() to set up a drm_mm-backed TTM resource
>> manager for stolen memory. This reuses the TTM core's ttm_range_manager
>> callbacks, avoiding duplicate implementations.
>>
>> Tested on NVL with a 4K DP display: stolen_mm shows a single ~22MB
>> contiguous free hole after initial plane framebuffer allocation, and
>> FBC successfully allocates its CFB from that region. The corresponding
>> IGT was previously skipped and now passes.
>>
>> v2:
>> - Clarify that stolen memory requires contiguous allocations (Matt B)
>> - Properly handle xe_ttm_resource_visible() for stolen instead of
>>    unconditionally returning true (Matt A)
>>
>> v3:
>> - Rebase
>> - Fix xe_display_bo_fbdev_prefer_stolen() to compare in pages, since
>>    ttm_range_manager stores stolen->size in pages not bytes (Matt A)
>>
>> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/7631
>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Suggested-by: Matthew Auld <matthew.auld@intel.com>
>> Assisted-by: GitHub Copilot:claude-sonnet-4.6
>> Signed-off-by: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
>> Acked-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> Acked-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
>> ---
>>   drivers/gpu/drm/xe/display/xe_display_bo.c |  2 +-
>>   drivers/gpu/drm/xe/xe_bo.c                 | 16 ++++--
>>   drivers/gpu/drm/xe/xe_device_types.h       |  3 +
>>   drivers/gpu/drm/xe/xe_res_cursor.h         | 14 ++++-
>>   drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c     | 64 ++++++++--------------
>>   drivers/gpu/drm/xe/xe_ttm_stolen_mgr.h     |  9 +++
>>   drivers/gpu/drm/xe/xe_ttm_vram_mgr.c       | 11 ++--
>>   7 files changed, 64 insertions(+), 55 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/display/xe_display_bo.c b/drivers/gpu/drm/xe/display/xe_display_bo.c
>> index dc0d78ff2d79..7fbac223b097 100644
>> --- a/drivers/gpu/drm/xe/display/xe_display_bo.c
>> +++ b/drivers/gpu/drm/xe/display/xe_display_bo.c
>> @@ -138,7 +138,7 @@ bool xe_display_bo_fbdev_prefer_stolen(struct xe_device *xe, unsigned int size)
>>   	 * important and we should probably use that space with FBC or other
>>   	 * features.
>>   	 */
>> -	return stolen->size >= size * 2;
>> +	return stolen->size >= (size * 2) >> PAGE_SHIFT;
>>   }
>>   
>>   static struct drm_gem_object *xe_display_bo_fbdev_create(struct drm_device *drm, int size)
>> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>> index f685c3c2fbb3..295857cdeb4e 100644
>> --- a/drivers/gpu/drm/xe/xe_bo.c
>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>> @@ -611,11 +611,17 @@ static void xe_ttm_tt_destroy(struct ttm_device *ttm_dev, struct ttm_tt *tt)
>>   	kfree(tt);
>>   }
>>   
>> -static bool xe_ttm_resource_visible(struct ttm_resource *mem)
>> +static bool xe_ttm_resource_visible(struct xe_device *xe, struct ttm_resource *mem)
>>   {
>> -	struct xe_ttm_vram_mgr_resource *vres =
>> -		to_xe_ttm_vram_mgr_resource(mem);
>> +	struct xe_ttm_vram_mgr_resource *vres;
>>   
>> +	if (mem->mem_type == XE_PL_STOLEN) {
>> +		struct xe_ttm_stolen_mgr *mgr = xe->mem.stolen_mgr;
>> +
>> +		return mgr->io_base && !xe_ttm_stolen_cpu_access_needs_ggtt(xe);
>> +	}
>> +
>> +	vres = to_xe_ttm_vram_mgr_resource(mem);
>>   	return vres->used_visible_size == mem->size;
>>   }
>>   
>> @@ -633,7 +639,7 @@ bool xe_bo_is_visible_vram(struct xe_bo *bo)
>>   	if (drm_WARN_ON(bo->ttm.base.dev, !xe_bo_is_vram(bo)))
>>   		return false;
>>   
>> -	return xe_ttm_resource_visible(bo->ttm.resource);
>> +	return xe_ttm_resource_visible(xe_bo_device(bo), bo->ttm.resource);
>>   }
>>   
>>   static int xe_ttm_io_mem_reserve(struct ttm_device *bdev,
>> @@ -649,7 +655,7 @@ static int xe_ttm_io_mem_reserve(struct ttm_device *bdev,
>>   	case XE_PL_VRAM1: {
>>   		struct xe_vram_region *vram = xe_map_resource_to_region(mem);
>>   
>> -		if (!xe_ttm_resource_visible(mem))
>> +		if (!xe_ttm_resource_visible(xe, mem))
>>   			return -EINVAL;
>>   
>>   		mem->bus.offset = mem->start << PAGE_SHIFT;
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>> index e9e11bb1c65f..315d2ed4d3e6 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -42,6 +42,7 @@ struct xe_ggtt;
>>   struct xe_i2c;
>>   struct xe_pat_ops;
>>   struct xe_pxp;
>> +struct xe_ttm_stolen_mgr;
>>   struct xe_vram_region;
>>   
>>   /**
>> @@ -276,6 +277,8 @@ struct xe_device {
>>   		struct ttm_resource_manager sys_mgr;
>>   		/** @mem.shrinker: system memory shrinker. */
>>   		struct xe_shrinker *shrinker;
>> +		/** @mem.stolen_mgr: stolen memory manager. */
>> +		struct xe_ttm_stolen_mgr *stolen_mgr;
>>   	} mem;
>>   
>>   	/** @sriov: device level virtualization data */
>> diff --git a/drivers/gpu/drm/xe/xe_res_cursor.h b/drivers/gpu/drm/xe/xe_res_cursor.h
>> index 5f4ab08c0686..0522caafd89d 100644
>> --- a/drivers/gpu/drm/xe/xe_res_cursor.h
>> +++ b/drivers/gpu/drm/xe/xe_res_cursor.h
>> @@ -101,7 +101,15 @@ static inline void xe_res_first(struct ttm_resource *res,
>>   	cur->mem_type = res->mem_type;
>>   
>>   	switch (cur->mem_type) {
>> -	case XE_PL_STOLEN:
>> +	case XE_PL_STOLEN: {
>> +		/* res->start is in pages (ttm_range_manager). */
>> +		cur->start = (res->start << PAGE_SHIFT) + start;
>> +		cur->size = size;
>> +		cur->remaining = size;
>> +		cur->node = NULL;
>> +		cur->mm = NULL;
>> +		break;
>> +	}
>>   	case XE_PL_VRAM0:
>>   	case XE_PL_VRAM1: {
>>   		struct gpu_buddy_block *block;
>> @@ -289,6 +297,10 @@ static inline void xe_res_next(struct xe_res_cursor *cur, u64 size)
>>   
>>   	switch (cur->mem_type) {
>>   	case XE_PL_STOLEN:
>> +		/* Just advance within the contiguous region. */
>> +		cur->start += size;
>> +		cur->size = cur->remaining;
>> +		break;
>>   	case XE_PL_VRAM0:
>>   	case XE_PL_VRAM1:
>>   		start = size - cur->size;
>> diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
>> index 27c9d72222cf..5e9070739e65 100644
>> --- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
>> +++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
>> @@ -19,30 +19,11 @@
>>   #include "xe_device.h"
>>   #include "xe_gt_printk.h"
>>   #include "xe_mmio.h"
>> -#include "xe_res_cursor.h"
>>   #include "xe_sriov.h"
>>   #include "xe_ttm_stolen_mgr.h"
>> -#include "xe_ttm_vram_mgr.h"
>>   #include "xe_vram.h"
>>   #include "xe_wa.h"
>>   
>> -struct xe_ttm_stolen_mgr {
>> -	struct xe_ttm_vram_mgr base;
>> -
>> -	/* PCI base offset */
>> -	resource_size_t io_base;
>> -	/* GPU base offset */
>> -	resource_size_t stolen_base;
>> -
>> -	void __iomem *mapping;
>> -};
>> -
>> -static inline struct xe_ttm_stolen_mgr *
>> -to_stolen_mgr(struct ttm_resource_manager *man)
>> -{
>> -	return container_of(man, struct xe_ttm_stolen_mgr, base.manager);
>> -}
>> -
>>   /**
>>    * xe_ttm_stolen_cpu_access_needs_ggtt() - If we can't directly CPU access
>>    * stolen, can we then fallback to mapping through the GGTT.
>> @@ -210,12 +191,19 @@ static u64 detect_stolen(struct xe_device *xe, struct xe_ttm_stolen_mgr *mgr)
>>   #endif
>>   }
>>   
>> +static void xe_ttm_stolen_mgr_fini(struct drm_device *dev, void *arg)
>> +{
>> +	struct xe_device *xe = to_xe_device(dev);
>> +
>> +	ttm_range_man_fini_nocheck(&xe->ttm, XE_PL_STOLEN);
>> +}
>> +
>>   int xe_ttm_stolen_mgr_init(struct xe_device *xe)
>>   {
>>   	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>>   	struct xe_ttm_stolen_mgr *mgr;
>>   	u64 stolen_size, io_size;
>> -	int err;
>> +	int ret;
>>   
>>   	mgr = drmm_kzalloc(&xe->drm, sizeof(*mgr), GFP_KERNEL);
>>   	if (!mgr)
>> @@ -244,12 +232,12 @@ int xe_ttm_stolen_mgr_init(struct xe_device *xe)
>>   	if (mgr->io_base && !xe_ttm_stolen_cpu_access_needs_ggtt(xe))
>>   		io_size = stolen_size;
>>   
>> -	err = __xe_ttm_vram_mgr_init(xe, &mgr->base, XE_PL_STOLEN, stolen_size,
>> -				     io_size, PAGE_SIZE);
>> -	if (err) {
>> -		drm_dbg_kms(&xe->drm, "Stolen mgr init failed: %i\n", err);
>> -		return err;
>> -	}
>> +	ret = ttm_range_man_init_nocheck(&xe->ttm, XE_PL_STOLEN, false,
>> +					 stolen_size >> PAGE_SHIFT);
>> +	if (ret)
>> +		return ret;
>> +
>> +	xe->mem.stolen_mgr = mgr;
>>   
>>   	drm_dbg_kms(&xe->drm, "Initialized stolen memory support with %llu bytes\n",
>>   		    stolen_size);
>> @@ -257,36 +245,32 @@ int xe_ttm_stolen_mgr_init(struct xe_device *xe)
>>   	if (io_size)
>>   		mgr->mapping = devm_ioremap_wc(&pdev->dev, mgr->io_base, io_size);
>>   
>> -	return 0;
>> +	return drmm_add_action_or_reset(&xe->drm, xe_ttm_stolen_mgr_fini, mgr);
>>   }
>>   
>>   u64 xe_ttm_stolen_io_offset(struct xe_bo *bo, u32 offset)
>>   {
>>   	struct xe_device *xe = xe_bo_device(bo);
>> -	struct ttm_resource_manager *ttm_mgr = ttm_manager_type(&xe->ttm, XE_PL_STOLEN);
>> -	struct xe_ttm_stolen_mgr *mgr = to_stolen_mgr(ttm_mgr);
>> -	struct xe_res_cursor cur;
>> +	struct xe_ttm_stolen_mgr *mgr = xe->mem.stolen_mgr;
>>   
>>   	XE_WARN_ON(!mgr->io_base);
>>   
>>   	if (xe_ttm_stolen_cpu_access_needs_ggtt(xe))
>>   		return mgr->io_base + xe_bo_ggtt_addr(bo) + offset;
>>   
>> -	xe_res_first(bo->ttm.resource, offset, 4096, &cur);
>> -	return mgr->io_base + cur.start;
>> +	/* Range allocator: res->start is in pages. */
>> +	return mgr->io_base + (bo->ttm.resource->start << PAGE_SHIFT) + offset;
>>   }
>>   
>>   static int __xe_ttm_stolen_io_mem_reserve_bar2(struct xe_device *xe,
>>   					       struct xe_ttm_stolen_mgr *mgr,
>>   					       struct ttm_resource *mem)
>>   {
>> -	struct xe_res_cursor cur;
>> -
>>   	if (!mgr->io_base)
>>   		return -EIO;
>>   
>> -	xe_res_first(mem, 0, 4096, &cur);
>> -	mem->bus.offset = cur.start;
>> +	/* Range allocator always produces contiguous allocations. */
>> +	mem->bus.offset = mem->start << PAGE_SHIFT;
>>   
>>   	drm_WARN_ON(&xe->drm, !(mem->placement & TTM_PL_FLAG_CONTIGUOUS));
>>   
>> @@ -329,8 +313,7 @@ static int __xe_ttm_stolen_io_mem_reserve_stolen(struct xe_device *xe,
>>   
>>   int xe_ttm_stolen_io_mem_reserve(struct xe_device *xe, struct ttm_resource *mem)
>>   {
>> -	struct ttm_resource_manager *ttm_mgr = ttm_manager_type(&xe->ttm, XE_PL_STOLEN);
>> -	struct xe_ttm_stolen_mgr *mgr = ttm_mgr ? to_stolen_mgr(ttm_mgr) : NULL;
>> +	struct xe_ttm_stolen_mgr *mgr = xe->mem.stolen_mgr;
>>   
>>   	if (!mgr || !mgr->io_base)
>>   		return -EIO;
>> @@ -343,8 +326,5 @@ int xe_ttm_stolen_io_mem_reserve(struct xe_device *xe, struct ttm_resource *mem)
>>   
>>   u64 xe_ttm_stolen_gpu_offset(struct xe_device *xe)
>>   {
>> -	struct xe_ttm_stolen_mgr *mgr =
>> -		to_stolen_mgr(ttm_manager_type(&xe->ttm, XE_PL_STOLEN));
>> -
>> -	return mgr->stolen_base;
>> +	return xe->mem.stolen_mgr->stolen_base;
>>   }
>> diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.h b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.h
>> index 8e877d1e839b..049e91e77326 100644
>> --- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.h
>> +++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.h
>> @@ -12,6 +12,15 @@ struct ttm_resource;
>>   struct xe_bo;
>>   struct xe_device;
>>   
>> +struct xe_ttm_stolen_mgr {
>> +	/* PCI base offset */
>> +	resource_size_t io_base;
>> +	/* GPU base offset */
>> +	resource_size_t stolen_base;
>> +
>> +	void __iomem *mapping;
>> +};
> Kernel doc. Everything else LGTM.
>
> Matt
Thanks for the review, Matt.
I will add kernel-doc in v4.
>
>> +
>>   int xe_ttm_stolen_mgr_init(struct xe_device *xe);
>>   int xe_ttm_stolen_io_mem_reserve(struct xe_device *xe, struct ttm_resource *mem);
>>   bool xe_ttm_stolen_cpu_access_needs_ggtt(struct xe_device *xe);
>> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
>> index 5fd0d5506a7e..79ef8e1b5e5c 100644
>> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
>> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
>> @@ -301,14 +301,13 @@ int __xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_ttm_vram_mgr *mgr,
>>   			   u64 default_page_size)
>>   {
>>   	struct ttm_resource_manager *man = &mgr->manager;
>> +	const char *name;
>>   	int err;
>>   
>> -	if (mem_type != XE_PL_STOLEN) {
>> -		const char *name = mem_type == XE_PL_VRAM0 ? "vram0" : "vram1";
>> -		man->cg = drmm_cgroup_register_region(&xe->drm, name, size);
>> -		if (IS_ERR(man->cg))
>> -			return PTR_ERR(man->cg);
>> -	}
>> +	name = mem_type == XE_PL_VRAM0 ? "vram0" : "vram1";
>> +	man->cg = drmm_cgroup_register_region(&xe->drm, name, size);
>> +	if (IS_ERR(man->cg))
>> +		return PTR_ERR(man->cg);
>>   
>>   	man->func = &xe_ttm_vram_mgr_func;
>>   	mgr->mem_type = mem_type;
>> -- 
>> 2.52.0
>>

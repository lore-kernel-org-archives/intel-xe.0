Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6386FD637CF
	for <intel-xe@archiver.kernel.org>; Thu, 14 Nov 2024 01:48:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32AF210E792;
	Thu, 14 Nov 2024 01:48:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K2CHUyic";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A03810E792
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Nov 2024 01:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731548895; x=1763084895;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=oPbM+5ZuJk+9bT2pyP7jBPTPTwNhdlMA7TNBrP46260=;
 b=K2CHUyicFXsKsC6uHN3iTJ3S8S5pdfZLXheP6c2JJ8IBbf0UrCoGYnFR
 56PcJT45qPlbQZUx2t0MYc673Yw//KEjRH0dXE8As9U3Qu4zyaviEzN+3
 5a3dC1l47RU6yAxF741WoXgqsFvBcJmWyoDeJC4sm2f/Hlq54HTyntcUG
 F3CtVKkoXyuRy5TRs/8RjD+ybL8H/f9/fdO/0YcMQzd3NH8rTc35rXn4w
 wTEHgEH3OuUL5e1j2ZUuJ71Mm0hyWt8bdeG4GIY1sIb/AAeJI8OXAtCLr
 rGEeg1Or4D8hVOYzLbUDNqyR4RZsRZcsa5TwqXFvi6D6aGWHClVTCg5bg Q==;
X-CSE-ConnectionGUID: Str9/ZIPS16mf95uxtsmDQ==
X-CSE-MsgGUID: PsXwzb3KTZKf1yBSBhVJVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11255"; a="48975129"
X-IronPort-AV: E=Sophos;i="6.12,152,1728975600"; d="scan'208";a="48975129"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 17:48:14 -0800
X-CSE-ConnectionGUID: 4mDgl4alRvWsArB3M91CDw==
X-CSE-MsgGUID: xgCrZigCQCyYVQbEAF3GtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,152,1728975600"; d="scan'208";a="92100089"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Nov 2024 17:48:14 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 13 Nov 2024 17:48:13 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 13 Nov 2024 17:48:13 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.43) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 13 Nov 2024 17:48:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lhcDCAMVJaMiR8GQSyNhEiJtSEqoJOinMOB+EFCYqsVJ8fNCudTG+Kyb/GyBPYKJu3cq6vRiQKg+sT76z1h/cwH2654d7pyhZOxooYcITRmr+nWuK8R7IUgAxtB3TTSz4GlvD5PbicrRIBgandmZbiTcCqB35QE1IGipkIsPl1+wDRZ3xpMxtKYY7QzJ87r2YhegU7xcRItbZIFukfe+SeYwBYmMWrpGNZ/qmsQciOkcuvlwKNzOnn3LjhRh2YTKMUylyt0MIqBB1ZShn0XpY/Bsv9c7MggJ72i5cgk+i24VFYmT/je84sXe+RguJQ7vV9Ybc2s698t7PB6UXrYS4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+w4H9VixKJM+6C9PIYgXMyLN+QYEYfdeS7+MgOU8UrM=;
 b=ZSMXYQ2J1gSmFNr/U5xY9o7MoEyJbCtE19G0B0G69QENA/2+5Rbpnsgod04mihxbLJooDoN9p8yJHqK/j32/3hWGHwswwCuo9zw7OIWVrSGLYjlNJG2cumMHRsalppq595/MdXN3VbrUnz0tqofZ+U/uXTi21bZPuGYYE2TDUB2i5P3M6QgOdubma3Vk5PJZf8aBkR6vknfo+/zxusvXfZXy/dcYI8lQbYgbtou9baMv2+6hQ/C87xvHNQLeyV2JrDSNAebNk7+81ZujOwg4pYD7v6gkosHK1S07GEzv/vkHoELtJgqY30vYzOLT7YWtDfmVL9dzYYtzaSqz28W5tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by CH3PR11MB8519.namprd11.prod.outlook.com (2603:10b6:610:1ba::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.29; Thu, 14 Nov
 2024 01:48:11 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%3]) with mapi id 15.20.8158.013; Thu, 14 Nov 2024
 01:48:11 +0000
Message-ID: <37fd752b-76c3-4eeb-9264-da54c08d5dc3@intel.com>
Date: Wed, 13 Nov 2024 17:48:09 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/7] drm/xe: Improve schedule disable response failure
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20241112220127.1369527-1-matthew.brost@intel.com>
 <20241112220127.1369527-5-matthew.brost@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20241112220127.1369527-5-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0298.namprd04.prod.outlook.com
 (2603:10b6:303:89::33) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|CH3PR11MB8519:EE_
X-MS-Office365-Filtering-Correlation-Id: 8677cd1e-c79d-4eba-91de-08dd044e6568
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RFdlVzVxT1kwb2krUUljMk5uYWMybm14MUVtVUsva1dLTGFpUWxlcG1xekhs?=
 =?utf-8?B?MWVnNmJVbGNaU3hROTE3WHV3MXduR0hrbnlGU1NrMWNrOHNTclJDdUhkeXBz?=
 =?utf-8?B?ODNVNElDYjVKdGJGelIxcXpwWDB3cXBrN2VHNmphM3diZDJLTVBVb3lJU09O?=
 =?utf-8?B?L0NYTS9BN0dXa2J4amNzVk1aOGxFc0J4VnpQY0tYRU1yZDR2WktYTEN0NEVM?=
 =?utf-8?B?SHZ0azczTGJVTHVTbEN1M29rU3JDTWhUNDJaOUR6QkFBTlYwQjJiVUQzRC8v?=
 =?utf-8?B?ODB2aGdIUlczRDcyb0xWZkNaZDlqNm1MUElENVV3R053UjEvYmltOGxGNzNB?=
 =?utf-8?B?OFZacS9SV25sQ0pqTWxhQ3V2MmNQL2E0ditQNWdRREg4MFFqNENRWmlIVVU2?=
 =?utf-8?B?bW4yL1lCVk50OC9IY0R0aU1GTjZwNWhvQzNSdDNCSVhrUFdGTHpEeStkZnNl?=
 =?utf-8?B?bjU5M1RYeW1xMC9xMlFFekJ1NVJqbGhoN2t4TFFxZVd1SExSWmJXbmoreGhK?=
 =?utf-8?B?L1pvOG5ENjY5Q0x2UHNjUWp2dHhxUnZwbkwzdm1WRWszSjdmSjdvUTd4NFZY?=
 =?utf-8?B?aVpObHZLblZtSTk3bWw2bVZHTWRndXdNUUNJK1p4QWxndnRjb2VXb1R3Q05W?=
 =?utf-8?B?Uk1MMjFyZG9kMUFZczd4YWdQTjRrL3UyRmZKejcyN1Q2L3hWNll0elBQWXQ5?=
 =?utf-8?B?S0R2dHVsMDFjNjhrelEwM0NDN1RZL3gwK3JuZm9RUTQ1cmlIdGFFMGw4NExp?=
 =?utf-8?B?UEdWQXJ4SFdldjlwY0xZK0dwZzZTVXJxaDh5MVRXQWFRSlZ2OWM3V2xVaGtL?=
 =?utf-8?B?dDBEUG9qL0cxRXM5VXlDOERrWUR2YXRVSWs2bTRMZkxHcm9FTzBJTnlVK0FL?=
 =?utf-8?B?MnFZRjNIWGI2Nm5YTkthbXBqWWxVWklFOEtSdTBXT1E0M2p1SzQrSkNpTVdP?=
 =?utf-8?B?c2QraU0xTjJrVlZJckRPVDdtOHd3WkYrZTFkek9TTGxSNWdQcEZiRzVYQ01Q?=
 =?utf-8?B?ajVmTjUxRStmOGJ3ZWVxSWhaUFhTRHFHUlUzRXZLNFh1bWs1cWVETzFOZkYx?=
 =?utf-8?B?UjBiejFnc2Y1dWhUTHRRZmNQbHRGZm9EbkdQRHJpKzVDNUlkYk1KMm9aQkh6?=
 =?utf-8?B?aVdKMEZ2ZkhvYnNGM2NHVlpsNUptMjdRNGJLMUFXd212aVA5SjMzYURuMnlX?=
 =?utf-8?B?NWl6TUp1QWRXMG11MkNacTBLRjNlejFjYk9EVSttcmFGTk9BYkFrMXJIaXha?=
 =?utf-8?B?aUdnNlNlcFhvdkw0ZjhSbkE4UmREbVhTYUk3WG05UTFQcnRwTmVPUS9GY01L?=
 =?utf-8?B?V0o2MnhXdmpiT3BUR3U4QjFSRXdTaXRCMkpoQ0dGd2lGUjQxbzlxeGJjRFNS?=
 =?utf-8?B?alRiU2VEUW9IdUJDTEhYMzJGM3JSL28wYmV6UG15OS81VVRTL2VOelprUnhM?=
 =?utf-8?B?aDVmZHBoREx3TlNWcGF3bjROb21uUjc3YnN1UXM2MllRM01RWVplekgxTVpV?=
 =?utf-8?B?WUhzNG1GcTAxbFRNYThoL1pXeThvaVFmZjYreUZwbHRXYkF3V25aSFFRdmNM?=
 =?utf-8?B?Qld6aWVrSTluOU1ZWld1RnN4Y2lsaUpBcmczZlQ2YUhBSDBwU2lERGRpSVQz?=
 =?utf-8?B?R0IxSE1IVWZ1MWRselN3YW5zc2VQVGVXb3Nmd0lKa05HZ040OUdVOWIvQTlk?=
 =?utf-8?B?ZTNJNzZYNkpIZDczSFE1dy9FMjF6c1RaNk9WWHR5S2lhZDhNKzVSaWdqL2lL?=
 =?utf-8?Q?k3sV+89qR0xv0rK2FDgNAsA0bZq0R9OsO9s+1AE?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cDdIMHduSjVDUXRYdG1obWFTL3Y2OWJzNytzQ2V3QW9lYmEwcmJsUTlvWWdB?=
 =?utf-8?B?c2hsa0ZLdVJ5elhSMlVmcXNvRE4xK3J6aTExVDRxK2NoZ05LcG45SnI1M1VW?=
 =?utf-8?B?YjR5ZHVmTVhVTGZYZ21rRzlmcDdDMGw2N2k3WUh3eGJQNE9WajNld2dLeDlN?=
 =?utf-8?B?dXZKU2NtRU9DeDRJbjZJdmpZK2hoRmhwTFliMXArczhTTzVMeWFIejlURjV1?=
 =?utf-8?B?c25LSUVTdjF6d3BVUkhDY25XbGNkZjU3bGo5eUdiZkdybWRDSXlmMUFwZGY3?=
 =?utf-8?B?bDl0R2pkQkJKVzlJTFpZeTF2WlJ1bHIrVGF2b2pXMXIxVWhsc3pXbWxQQnUv?=
 =?utf-8?B?SWNmdU1pMFo5VmQxTTFlZVVtWnExRFpUT2tCR3FCYWwzMVhVYWpJdXBjTmFu?=
 =?utf-8?B?bkcwTTBtbXArWGduOTN0L3E2bkVkcUZsTU9HaHZtYmxTRUltNlJuck5sUEJO?=
 =?utf-8?B?S0xoVFBvcDA4MUF1RldhMW1mMzRBWUdFYkNtaWlJeHhIWjRKcU15SjhyeFV3?=
 =?utf-8?B?SEtxRXJSR2hFWE5JS3JYY3JxYlRadkwyMnJucTFJenBjZFlKalltYmpobzRw?=
 =?utf-8?B?ZzFzUjhUWTFhZE51NkR0NzB6VzlCcVg4eWtTdkhuS1J5dmNlZFpXdTJCVmZC?=
 =?utf-8?B?K0NKUHZMREQ1a1ZCTG5YL1Rra3dOOEJzSEcyVE9FR2RhNmtDZ3NmeWluRmFt?=
 =?utf-8?B?ZVlIS2JWcUZUSlZjWXg2QVJlZlYySlVPQ0o2aUhlZHJzMWpvMndtZERKSWlS?=
 =?utf-8?B?aUgvZk1acU14SEJMVkxHZFhjSitiYzQrbERneWl0MWxUTXJlaWFjOCtjaWxN?=
 =?utf-8?B?RTMvdkhBSHlkcFVXMnhOMWRnZXpSZHJsVm1EcGpmb0FZUURUd1BUeFhyL3VG?=
 =?utf-8?B?bnRYTHFqaUQ0TmhnSlU1aWo4TEVXeE5OL2hVTzlNWmgzZlNxY1NhV3R1TjAx?=
 =?utf-8?B?Ni9tZ09JcFBHeGVhRjY1cXUyQUcxemFnR2pFR0NDekZLUWVnTk5LNWJxUGVP?=
 =?utf-8?B?cVBYK2QyVm8rZW0vOFRtc2tGSk1oN0QvR0VjeWYrWVVWWXZEU1d2RkRXSmpF?=
 =?utf-8?B?RjlHWnY5cXJnQndsNWt3elBsemZIdW9JMWdaMEViS1FFMDZnclV1WVd1Y0wv?=
 =?utf-8?B?TXRpSXFRK293NkhrUE5meDNUUG1BWVZCZ2tCbVZtRjl2OHhxVHJ0aUZCaUNR?=
 =?utf-8?B?RjdpL1poeVp1MGc0REV4TzY0andVY2ttRGphd1FTdUg0ZlJjY3hpV1pld0Zr?=
 =?utf-8?B?bXhMMW1ZNkhEeGVZaG5nNE5sM1dnYUYvOVcyTEZoWnA2RDVKcm9oaVJHaGJp?=
 =?utf-8?B?R3JIUUQxaEozNC9vcFNTOG9mODY0VGw3a0l5ZVdaOHU3eXlYVVY5YVdqY0kv?=
 =?utf-8?B?MDRHd2V1V2gzZ29HVEdYSTlmbVRXSysrWlVpT2NJS1BtMFppeUdGKzR5NklU?=
 =?utf-8?B?RXgrMkpFQzhXTkN3VXNDdmZOK0pIM0JBV2Z1Mmp6ZFpIT2FBaitIMU9DM3dD?=
 =?utf-8?B?dWcxYWFZczdkb1RSZmZOeVVMaUhGUTYydUFVd3hWQkJjWmU2cy95UEE4OE9J?=
 =?utf-8?B?a0RFcmc5Y0gvV2oyV3hBSy9wYnAyNkkrOEtvdnRUSzFrTkxhMG92NDVaVktv?=
 =?utf-8?B?ZVFHenJNSzRpeFh0UHlXdXdTUlZ0SzhRZXRkZkY3Z3hhQVUzMWRSVFRtTmJQ?=
 =?utf-8?B?NHc0cXc5a3JaVDI0TWphMGE5WlpsQ2x3cUt3anpzaGRlaFhYM2ROV2JCTHA0?=
 =?utf-8?B?VmsvdXIreFdnWWxsSUsrdTlYc0wrVTVkSHNPN1ExMDJZMncrSGgvMXZaUG1n?=
 =?utf-8?B?OUthZkFQR0pzcENqZkYxK3liclJ2bm9lZDJSWFVoM0g0WUpVS2Z5STRuNmV2?=
 =?utf-8?B?aUV2MTE4ZGNqRE9vekVhRkNQNGZZa2RVREtIN0JFNGhWWnErK21pRVpWcDVO?=
 =?utf-8?B?cXVBeEJOelY5YURpS2FIY2IrNWhGUlpiQW1rNml6Z0RNZkRTQlNoRW5lb1Zi?=
 =?utf-8?B?NURwRC9Rek9LU0pHVHZCK2RFV1EzOEsxRklaMWhodmR5Ti9zbkFDVFBObk1a?=
 =?utf-8?B?Q21WSCtyUjlrZDBoY3pBZkF2MjNmdEdEa2hhWUQ2eldyMi9UOFVJbmxyY3ho?=
 =?utf-8?B?UXdBSHhSdk1ya2g2cTBsRTV3bzd5dHZxMUxidjZvck96ekh0R1d5YlNHZVla?=
 =?utf-8?B?aXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8677cd1e-c79d-4eba-91de-08dd044e6568
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2024 01:48:11.3671 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0rcpisMdnzp6QY/T20jkvgkytoHDDb6LzmS71KS75wTM51X40eal+ePXi1S/bLR58uZs1kg4Pq9c027ljppQsVecSsu50l1Na2Ue5gu10qU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8519
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

On 11/12/2024 14:01, Matthew Brost wrote:
> Print Guc ID and take devcoredump on schedule disable response failure.
> GuC ID is useful information and a schedule disable response failure is
> possible the LRC state is corrupted so a devcoredump is helpful to debug.
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc_submit.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 663ad4d97b34..3d61c650c0d2 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1124,7 +1124,10 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>   		if (!ret || xe_guc_read_stopped(guc)) {
>   trigger_reset:
>   			if (!ret)
> -				xe_gt_warn(guc_to_gt(guc), "Schedule disable failed to respond");
> +				xe_gt_warn(guc_to_gt(guc),
> +					   "Schedule disable failed to respond, guc_id=%d",
> +					   q->guc->id);
> +			xe_devcoredump(q, job);
This is premature. The extra parameter is not added until patch #5!

John.

>   			set_exec_queue_extra_ref(q);
>   			xe_exec_queue_get(q);	/* GT reset owns this */
>   			set_exec_queue_banned(q);


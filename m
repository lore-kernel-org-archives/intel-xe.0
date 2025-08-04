Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6054C87FCF
	for <intel-xe@archiver.kernel.org>; Mon,  4 Aug 2025 12:33:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73AB110E05A;
	Mon,  4 Aug 2025 12:33:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OCIPKypB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76C7E10E4F3
 for <intel-xe@lists.freedesktop.org>; Mon,  4 Aug 2025 12:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754310824; x=1785846824;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=4mnxpjM0UllE2JWcCZXFh4ltOwxbiOoxxFhgVJr1/uM=;
 b=OCIPKypB9OaPKfJkCvLHmtYkUilWDq7tsyqwU7c4JG1I0pQo8qmnxjPD
 6bkK/D7XJtmW6QCl06XZKeNgveGKUTLX7Th7lnjbBLybJhxV+YSYmDlJP
 sRM7GIJtmppYYRxvm/P5xR2vF/Do/1ubcHGRdniLofJ4Ug4Wt/rRamBnG
 H5S7EMKQ39nuYd0BTlXuK1k5PVVGcwvQYi4HUYNuQNH9OeM8SdGBQHEAl
 peM2NLVI0SepGBi8Vzzn69kOtyvFdhWa6VcqnFO/WPJ+ImwqIjRNVTzm4
 /oUkyKkxFDlBdfbaZanWDXH0wfC7ZK4ObLyxEs+buyUTTH0MrQVsIA7d1 w==;
X-CSE-ConnectionGUID: v2AOxYcyTIGhOH4lFXpGnA==
X-CSE-MsgGUID: XjlLrdZsQNujw9KBxWKYxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11511"; a="74160925"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; d="scan'208,217";a="74160925"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2025 05:33:44 -0700
X-CSE-ConnectionGUID: K6dvPsbDSP+vlDyZTUxQAw==
X-CSE-MsgGUID: yWtyQUz6RbK30693I9pYLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
 d="scan'208,217";a="164478893"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2025 05:33:43 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 4 Aug 2025 05:33:29 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 4 Aug 2025 05:33:29 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (40.107.101.47)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 4 Aug 2025 05:33:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CasOuHbYO4aNaXSt3PpSDKQEl/9d9SQw/GDJNF/FvA+jLpcVT7pM0UQqZtlXSzFVTsMjEUG/ZMgLkWN1e8pbg8Q+8fz0OquBjYEKME3V6kElQN7kY/xx94xDXzDAgg1ahvgUTqIO0AyUPFp8H/g2PzvsSOQX3ClJznDGKmK1QIudovYYvJ63pv0RiJOnkIPRyAKXOULCTu/Bf8rm4RCSco64I7Isww1a7qWC/+7UiHkOlM9O8bprnjz9/KIsFJK6lGJkYK8skgQ+q0h3DCZSgcixRVbG9baQ2GnDrRULinFJG/2iJgg+vNgqMTjdFv7jtoc1eQrmdxuQPX0V7cxhSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S6SmFbFPAXVjKPiVMh1OcVHJb+tq+DU+Psp6+XWcNDw=;
 b=Xq2v4wBoMqI67bbTSjm/7fPVlbW/qLyKypSUNdx+EtzFMbDJfHYWYPasTmogHUtjdK5OhVYAATT0myNMG9ux6844KS9bnFy8nV7uesxbgo5g3Mp841HhP0QM1Ov5LsEpQGTPFUw50DXIclPlfQFgqXtCqsLJaF/wtMpuLQ7G02DN7IhgI6PVxf0Y8bLVmtIStR+MRB1Mm3+3u9iue/McUoVe06p1XXf7zFp2AvcdVSx9UgPOaNN5vGRKMH0wz/mpt6xZmeGYjfVN+SvE8RJ+nC9/gP/EhISoGcg23vblDHy+cUlOLpETYU11Cbx9ejJKktmfrMdMYz8eJYUupbT7yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9226.namprd11.prod.outlook.com (2603:10b6:208:574::13)
 by MW4PR11MB6569.namprd11.prod.outlook.com (2603:10b6:303:1e1::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.14; Mon, 4 Aug
 2025 12:33:00 +0000
Received: from IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09]) by IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09%6]) with mapi id 15.20.8989.013; Mon, 4 Aug 2025
 12:33:00 +0000
Content-Type: multipart/alternative;
 boundary="------------23tieGZa7lCtTnyplB5DJb09"
Message-ID: <56952df9-fbad-4cd5-bbdf-343a064341bf@intel.com>
Date: Mon, 4 Aug 2025 14:32:57 +0200
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBYZS5DSS5GdWxsOiBmYWlsdXJlIGZvciBkcm0veGUvdmY6?=
 =?UTF-8?Q?_Post-migration_recovery_of_queues_and_jobs_=28rev10=29?=
To: <intel-xe@lists.freedesktop.org>
References: <20250802031045.1127138-1-tomasz.lis@intel.com>
 <175411338890.207044.16814631529141328547@1538d3639d33>
Content-Language: en-US
From: "Lis, Tomasz" <tomasz.lis@intel.com>
In-Reply-To: <175411338890.207044.16814631529141328547@1538d3639d33>
X-ClientProxiedBy: WA0P291CA0001.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::27) To IA3PR11MB9226.namprd11.prod.outlook.com
 (2603:10b6:208:574::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9226:EE_|MW4PR11MB6569:EE_
X-MS-Office365-Filtering-Correlation-Id: 0278e968-6e35-4b39-aef2-08ddd3530c0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|8096899003|13003099007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N2N6WkNkMlpOdFFXa2UrMlNUUUU0cnlaUGpSVzNwTVNjdi9mL3huZzNhLzYv?=
 =?utf-8?B?OVBBUFZoaGRjajd2ZEM0bGVDd0tIdHB1UUpRQzhjN3hOU21WMU1uRE9CdjUr?=
 =?utf-8?B?YnpyR3gzZ05HWFZOdElWcXNTSXlPazJmU3pvb0V4VTVJSHBFcnh1alVjd3hN?=
 =?utf-8?B?dEhRbUhvOTZOdmlVRE1uTzJSMmdKTkphT2l1Ukc5ei82aGlZSnNsUUdXcmVC?=
 =?utf-8?B?MTVUSStBUG5ZWlNKMTRyNVBuNlBaNWJoRmxKUTkvQS9FR3k3WktVZFh2NnNC?=
 =?utf-8?B?ZlI5dlozYlpsWm9CZGwxRXZ6cmxzREtzWlRTb1F6V1lqZHlINU03N09ya2Zr?=
 =?utf-8?B?enJCQklNcFZlR0dzcmdnYzRiRjN6Y3dBeWdtNVlhMlRENm5ja1hYNm5FeHND?=
 =?utf-8?B?bDVjZDFoK294TnY1VmUxQkhzWWdmTU9BUFp2V01xb1M1ejRZcTQvNUFvbVVR?=
 =?utf-8?B?VE80cW5paTJQZDZpZUx3dE1IN3F3amloNGRMc29QS25nQ3Q4azlieHo3c1Bv?=
 =?utf-8?B?OEUvT3FxMjFzc0UzMVA5TmQ1OUpjZ25sVUwwL1NRanJBZHVqd09PczdscmhY?=
 =?utf-8?B?L2oxdmJhMERJMkVMTDhXelc2S3drN1FWUURNNVpYY1JzcjFmaityaDd3Njgw?=
 =?utf-8?B?eDFrbTRSOCtSR2pHb09MTjM2WnJ6S2QxM1RqUForMXM0bllJZk10WmJJSXBZ?=
 =?utf-8?B?NTVXMndRTmdwNlgvV0FEY3VOTFA4dGZjWiticjRSajhQOEhGdFFKczM3eVRG?=
 =?utf-8?B?Nm9RRGRqaUlIQU5nV2p0bWpFOXV0Vm9BdkdXUG1mSm5iYjZISmhzOE15dEdJ?=
 =?utf-8?B?a3BaMHlrV0dZQmluYXNKNDllUnJMeFRqcFVLaCsrankzck5CUTQ2dlNycUNh?=
 =?utf-8?B?RDgvK0U5SkJMUkFjckZjUXM2eVc5Sm5SNEN1enplY2JFa21XMVJZankxZTgv?=
 =?utf-8?B?bUkwai9PRDkya3ZuMTRVZTlOdzVOOVhFL3JXcjh4NkpVRUhreVU2anlXVENj?=
 =?utf-8?B?M2N4VkdMZUh6NjQyT25vTXRtVWFBWVhOaXhPSmcxQUZlVHFGT2prbDVEYUhI?=
 =?utf-8?B?SmJjbnFUNmh0N1F4VEJZdDJ2T2Q4KzNXcDdycVdjSS9yMU5rRnBaTmF6eWRU?=
 =?utf-8?B?TmdEYVFOVjAyNGNJU2dLN2Z1MXR3U1VoOUJRKzFvd2R5ZFlheUN6SWRGUUdB?=
 =?utf-8?B?Wnk5MW9xQmJ1U1hlY0t5QXc3VVBtbUZleWVYWWRDV1h4SFJpQjI0dzhNN2NT?=
 =?utf-8?B?RWRFZlI0dE40ZzMwcVNNZ2M2Mk44ampUaG1yWGxRcEhUR1VDU0RtWUY1aEJP?=
 =?utf-8?B?UmxxMU9HbjdaU2Z4ZnA3T0hueTBDeUtWeWdMWnMxSHpLRkNkUk1yZXdiRS8w?=
 =?utf-8?B?a2pzdWVUdnV3WDNjL0VFOXp3V0VGNUl2OE9IQURoVExtMG1oNVVRS0NsTnlx?=
 =?utf-8?B?d2xTOFc0MlN6SnE0MGs5ZVRxSlNuWmZlMHVHNkZmS2J2WVRrOEVCdjFXbFZy?=
 =?utf-8?B?TmM2R0RBQjF2RFJqZWVqdXgxWC9zczdPcEZIdENTRHFzWjFzWU9wR2dkdWFL?=
 =?utf-8?B?MVpDa2RxTS9ndzFNMjFDdElNVURMZFJtbGpwNVEva3MyR0JnZ1h1NHI1cDJ4?=
 =?utf-8?B?UExtVGZuSEFwbERwVGpKK2poRXREMEUzTGw1U2dtanJlNDE5SE0rUXhsazZM?=
 =?utf-8?B?TUtVYWpMam16ZjFwTUVZWENySVNXVE5GZi9weTRKVndKYXJhYXBCL2ZPWG15?=
 =?utf-8?B?NkVRNHR4S0ZycnI2d3VCS3BJNTlZR0RGdmV0eTlKenBUeUczL0d1RCtvYUdZ?=
 =?utf-8?Q?3BIBtdg8ctlO6lPqyGnKv7ycN3yicN+ZlUi2Q=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9226.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(8096899003)(13003099007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WUZOM0tsaXVsamtCT2JEQ0xOdU1IT1Z1OE1PY3JSbi9MdGVDUkw3TmZ5SGk0?=
 =?utf-8?B?MzMvM0phcHUxdnNqY1c3M01wTTZoblJqNXMveHJkOWwyK1Jtc1RhWXEvSUVM?=
 =?utf-8?B?NDRyWWZuZVY2QzlJemdHNG01dXY1WTRyRUM0TEQzL3BwTVB1YzQwU3NZUnY0?=
 =?utf-8?B?Rm5wNXZMbWR0dHZGdCtWdlZ4RmRsWHVjblBwajA3QmI5UkFBMXY2TTVORThi?=
 =?utf-8?B?MXhCZ3FQR3phUzJnNzFzRWZwb1R3amZCSnhXU29wMjNOQ0NZYlIrczdlU0Vq?=
 =?utf-8?B?WnVNT1ZyODJ0K3pXNFlhYWZsUkNDVW0vOFpUTEx4V0EwSEdROG5NNzlTallG?=
 =?utf-8?B?Z0NHOHZXdHQ1THkzS2RNZG1wNE1ZcUJjUWZtbkdseThvSkhteHFHUVZPTmRW?=
 =?utf-8?B?Z2lmOVRlcm1PNUF3c2Q5aVVsYlZOdXJuTTFJVE1YbnE2WENnbmJDM3ZXZ1RX?=
 =?utf-8?B?ek5xdkdibE1pcG9BUldFam8yU2M5ZDZIeDFOM2RIR1QzSEpVcGJSNXlPZkZJ?=
 =?utf-8?B?TGRTUjEvMnhmMm51UWxlNmRVMFFuOEYwdWFYaWZwcEFsMXI1M3hYQXBockRz?=
 =?utf-8?B?UkNRT28wb3JLejVNNmxQRWZvVEJrZEdqbFBTc3g1b2NtbVdUbE82V3hYSVZK?=
 =?utf-8?B?RUlCTmlqbVpMQ09PT2RDcmFzdTJYU3RMa2kxUFpVVkZyelV4K2JNSTR6dWMz?=
 =?utf-8?B?dlhZTU5mSTJMNWxXZFBWdlRhNWI3eUNzQlpHalZ6OHJyOUpEdE1rYkl5L2tz?=
 =?utf-8?B?MWhPRjZPRjYybGNtaFhoUjdHeTJFK0pvZjFMOEJ4VDdTb0RubVJOdUhMK0Rs?=
 =?utf-8?B?OUJjVno4MWxzbzU0YnAybEdyTG1DeE8ydzVmd0hXOHFiYkRhNkxZM2NycStT?=
 =?utf-8?B?NmFnV05WN3hEeFdZY3QwRTdGdnVZdGRvY0xHbG9iMU1pR3cxYVBxaEpGVk5K?=
 =?utf-8?B?SGZZV0g0M1pqV2xlUEtORGxtVm5iU0Q5VStpbHVUUVJOT3owaXBwYnJadDli?=
 =?utf-8?B?QXhMRDVnWEw2RFNOSy9IUmZrc1FzaWFKM3NGYmVQUHNRN1NQTWlKaXhrTkRS?=
 =?utf-8?B?d09pZDREaWEwMUI3WVBVY21SRzQwVVlQaEFDaDljN1hlMVNvUzF5MnlYb2Nm?=
 =?utf-8?B?SjZSNVhCTUJtbC9ZQnVxRzUyTTR0SkluQ2lGUFVMU2ZrbGhjYnduWC9xYXhG?=
 =?utf-8?B?MmdPcy9la1RGUVU3OTA3ZlMzdk5JSkg0UmJVTS9IQTlacUZoOVBYQTNPcW9E?=
 =?utf-8?B?bmVKUmZPVTFNdmNFTEs4SXg1bEtJM2pYV1RHY0hvSVRCQ3pZcGJIRE84ajZo?=
 =?utf-8?B?OGRUaHE1YlFTdHFKMmhZdWNld1J5UnFJMkJ3YThhcHpraEZFY1Z3RTd3Vjh2?=
 =?utf-8?B?N3c1NEE5cm85aUhQYUQwSDVnYVNLN28yUG9BL0hXZUgrelVVMElCSTRJYXhu?=
 =?utf-8?B?MlROVjZVMFJwK3Y1ZC9zTFlreTR3UTViZEZOMmlDYWpNMVMwMU5QcnVtQXVJ?=
 =?utf-8?B?YTFWMm1ZS1JLcmNrQituYm1hMHpvMzJFMmdFYWtCNFJqdzRvdlE4U2RYY1BN?=
 =?utf-8?B?MWNHWTFnLzRuNVZOY1A3Q2h3cG1XMW5UKzNQQmdEblhzclljeTczK3U2cC8x?=
 =?utf-8?B?clRCVXFqTlp2WDJ6bm52SFp1cUo2RHVENmNJWUV1LzFuWHYvZFd5M2hURHha?=
 =?utf-8?B?UUM3WnhMRmhpK2c4Vml3S2FLam5nQ3FWQy9NVk92RU5WaFI4NGE1ajJxM003?=
 =?utf-8?B?WU5qdkx5ekZwMXJ6endaQjJFVDRuWmFuK1N0TTVka3M2YkNKRHZ2YzgzK2hD?=
 =?utf-8?B?ckJMUWFwd3NCYkNFc1VmK1hLMUpMclQydVc3MUdRY0RIbFB1SWorRW1zdXEz?=
 =?utf-8?B?K1JnYlk3bS80Z2h1aUlpeEpkbGowL21zc1pBTEowNXpibm83bzNKeWNRMWMy?=
 =?utf-8?B?d0djeWprd3c4U0J1UTVrYlJBb2VQZzdEMHh3akxNZVp1ME5BM2g1T0tnMWJX?=
 =?utf-8?B?K2VxNTFLR3NsY0ZQTnR2ait0OE8vN21qV1AwYzB4WFYreW1oVHQvNlNxZURP?=
 =?utf-8?B?YXlZUG16RzJJdHMyNDdod3ZSSkJkZk5HTFU1V2pwM1djUVpKYkdqSXRRcFFy?=
 =?utf-8?Q?YlkGhA+uMx8DM60ONuShl0Vuy?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0278e968-6e35-4b39-aef2-08ddd3530c0f
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9226.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2025 12:32:59.9677 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UsRBmgf41nNV54L8I4OuwgWCAyUZtx1js60lnnj0bvzz3xIVWFTCab7lgTrzClKu17M9jsJhsW6NwtPeRFKOng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6569
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

--------------23tieGZa7lCtTnyplB5DJb09
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

The rev10 of this series is identical to rev9, differing only in a 
comment. No issues were reported for the rev9 series, so it is unlikely 
the ones here are real.

But will check them regardless.

  *

    igt@xe_exec_balancer@once-cm-parallel-userptr:

      o shard-adlp: PASS
        <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-adlp-6/igt@xe_exec_balancer@once-cm-parallel-userptr.html>
        -> FAIL
        <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-adlp-2/igt@xe_exec_balancer@once-cm-parallel-userptr.html>

  - the issue is with a fence never getting completed, leading to 
timeout; this happens on UMD side; the unsatisfied fence doesn't seem to 
be related to GPU hang, as KMD doesn't notice any issue

- KMD messages around the issue are coming from PM and display, nothing 
to do with the tested series


  *

    igt@xe_exec_system_allocator@process-many-malloc-bo-unmap-nomemset:

      o shard-bmg: PASS
        <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-3/igt@xe_exec_system_allocator@process-many-malloc-bo-unmap-nomemset.html>
        -> FAIL
        <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-1/igt@xe_exec_system_allocator@process-many-malloc-bo-unmap-nomemset.html>

- Here we have page faults, looks like memory tables were corrupted, or 
things get freed prematurely?

- the series does slightly modify suballocator, but the issue is 
unrelated to the series being tested


  *

    igt@xe_fault_injection@vm-bind-fail-xe_sync_entry_parse:

      o shard-bmg: PASS
        <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-7/igt@xe_fault_injection@vm-bind-fail-xe_sync_entry_parse.html>
        -> ABORT
        <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-4/igt@xe_fault_injection@vm-bind-fail-xe_sync_entry_parse.html>

- display-related issue; since xe still uses i915 code for display, it 
may be caused by a change there

- unrelated to series under test


Conclusion - regressions are not caused by this series.


-Tomasz


On 02.08.2025 07:43, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	drm/xe/vf: Post-migration recovery of queues and jobs (rev10)
> *URL:* 	https://patchwork.freedesktop.org/series/148982/
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/index.html
>
>
>   CI Bug Log - changes from
>   xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a_FULL ->
>   xe-pw-148982v10_FULL
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with xe-pw-148982v10_FULL absolutely 
> need to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-148982v10_FULL, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives 
> in CI.
>
>
>     Participating hosts (4 -> 4)
>
> No changes in participating hosts
>
>
>     Possible new issues
>
> Here are the unknown changes that may have been introduced in 
> xe-pw-148982v10_FULL:
>
>
>       IGT changes
>
>
>         Possible regressions
>
>  *
>
>     igt@xe_exec_balancer@once-cm-parallel-userptr:
>
>       o shard-adlp: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-adlp-6/igt@xe_exec_balancer@once-cm-parallel-userptr.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-adlp-2/igt@xe_exec_balancer@once-cm-parallel-userptr.html>
>  *
>
>     igt@xe_exec_system_allocator@process-many-malloc-bo-unmap-nomemset:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-3/igt@xe_exec_system_allocator@process-many-malloc-bo-unmap-nomemset.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-1/igt@xe_exec_system_allocator@process-many-malloc-bo-unmap-nomemset.html>
>  *
>
>     igt@xe_fault_injection@vm-bind-fail-xe_sync_entry_parse:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-7/igt@xe_fault_injection@vm-bind-fail-xe_sync_entry_parse.html>
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-4/igt@xe_fault_injection@vm-bind-fail-xe_sync_entry_parse.html>
>
>
>         Warnings
>
>   * igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute:
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html>
>         (Intel XE#4945
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945>) ->
>         ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-4/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html>
>
>
>     New tests
>
> New tests have been introduced between 
> xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a_FULL and 
> xe-pw-148982v10_FULL:
>
>
>       New IGT tests (10)
>
>  *
>
>     igt@kms_async_flips@crc@pipe-d-dp-2:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [2.29] s
>  *
>
>     igt@kms_async_flips@test-cursor@pipe-d-dp-2:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.19] s
>  *
>
>     igt@kms_async_flips@test-time-stamp@pipe-a-dp-2:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.20] s
>  *
>
>     igt@kms_async_flips@test-time-stamp@pipe-b-dp-2:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.20] s
>  *
>
>     igt@kms_async_flips@test-time-stamp@pipe-c-dp-2:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.21] s
>  *
>
>     igt@kms_async_flips@test-time-stamp@pipe-d-dp-2:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.20] s
>  *
>
>     igt@kms_cdclk@plane-scaling@pipe-a-dp-2:
>
>       o Statuses : 1 skip(s)
>       o Exec time: [0.00] s
>  *
>
>     igt@kms_cdclk@plane-scaling@pipe-b-dp-2:
>
>       o Statuses : 1 skip(s)
>       o Exec time: [0.00] s
>  *
>
>     igt@kms_cdclk@plane-scaling@pipe-c-dp-2:
>
>       o Statuses : 1 skip(s)
>       o Exec time: [0.00] s
>  *
>
>     igt@kms_plane_lowres@tiling-x@pipe-d-dp-2:
>
>       o Statuses : 2 pass(s)
>       o Exec time: [8.97, 9.36] s
>
>
>     Known issues
>
> Here are the changes found in xe-pw-148982v10_FULL that come from 
> known issues:
>
>
>       IGT changes
>
>
>         Issues hit
>
>  *
>
>     igt@core_hotunplug@hotreplug-lateclose:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@core_hotunplug@hotreplug-lateclose.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@core_hotunplug@hotreplug-lateclose.html>
>         (Intel XE#4963
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4963>)
>  *
>
>     igt@core_setmaster@master-drop-set-root:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@core_setmaster@master-drop-set-root.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@core_setmaster@master-drop-set-root.html>
>         (Intel XE#4672
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4672>)
>  *
>
>     igt@fbdev@write:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@fbdev@write.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@fbdev@write.html>
>         (Intel XE#2134
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134>)
>  *
>
>     igt@kms_atomic_transition@modeset-transition:
>
>       o shard-adlp: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-adlp-1/igt@kms_atomic_transition@modeset-transition.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-adlp-8/igt@kms_atomic_transition@modeset-transition.html>
>         (Intel XE#2953
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953> /
>         Intel XE#4173
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173>) +4
>         other tests dmesg-warn
>  *
>
>     igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-8/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html>
>         (Intel XE#4947
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947>)
>         +12 other tests skip
>  *
>
>     igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
>
>       o shard-adlp: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html>
>         -> DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html>
>         (Intel XE#4543
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543>)
>  *
>
>     igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html>
>         (Intel XE#2314
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314> /
>         Intel XE#2894
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894>)
>  *
>
>     igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-dg2-436/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html>
>         (Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +55
>         other tests skip
>  *
>
>     igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-2:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-2.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +7
>         other tests skip
>  *
>
>     igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-adlp-4/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +1
>         other test skip
>  *
>
>     igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-b-hdmi-a-1:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-adlp-4/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-b-hdmi-a-1.html>
>         (Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +2
>         other tests skip
>  *
>
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html>
>         (Intel XE#1727
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727> /
>         Intel XE#3113
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113> /
>         Intel XE#3124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124> /
>         Intel XE#4345
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345>)
>  *
>
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html>
>         (Intel XE#1727
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727> /
>         Intel XE#3113
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113> /
>         Intel XE#3124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124>) +1
>         other test incomplete
>  *
>
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
>
>       o shard-dg2-set2: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html>
>         (Intel XE#1727
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727> /
>         Intel XE#2705
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705> /
>         Intel XE#3113
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113> /
>         Intel XE#4212
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212> /
>         Intel XE#4345
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345> /
>         Intel XE#4522
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522>)
>  *
>
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html>
>         (Intel XE#3124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124>)
>  *
>
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html>
>         (Intel XE#1727
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727> /
>         Intel XE#3113
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113>)
>  *
>
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:
>
>       o shard-dg2-set2: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html>
>         (Intel XE#1727
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727> /
>         Intel XE#2705
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705> /
>         Intel XE#3113
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113> /
>         Intel XE#4212
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212> /
>         Intel XE#4522
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522>)
>  *
>
>     igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-adlp-4/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html>
>         (Intel XE#373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>)
>  *
>
>     igt@kms_content_protection@atomic@pipe-a-dp-2:
>
>       o shard-bmg: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-4/igt@kms_content_protection@atomic@pipe-a-dp-2.html>
>         (Intel XE#1178
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178>) +1
>         other test fail
>  *
>
>     igt@kms_content_protection@lic-type-0@pipe-a-dp-2:
>
>       o shard-dg2-set2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-dg2-432/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html>
>         (Intel XE#1178
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178>)
>  *
>
>     igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html>
>         (Intel XE#2291
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291>)
>  *
>
>     igt@kms_cursor_legacy@flip-vs-cursor-toggle:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html>
>         (Intel XE#4950
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950>)
>         +56 other tests skip
>  *
>
>     igt@kms_dp_aux_dev:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@kms_dp_aux_dev.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-6/igt@kms_dp_aux_dev.html>
>         (Intel XE#3009
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009>)
>  *
>
>     igt@kms_flip@basic-flip-vs-wf_vblank@b-hdmi-a1:
>
>       o shard-adlp: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-adlp-9/igt@kms_flip@basic-flip-vs-wf_vblank@b-hdmi-a1.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-adlp-6/igt@kms_flip@basic-flip-vs-wf_vblank@b-hdmi-a1.html>
>         (Intel XE#4543
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543>)
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-valid-mode:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-valid-mode.html>
>         (Intel XE#2293
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293>)
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-modesetfrombusy:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-modesetfrombusy.html>
>         (Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-tiling-4:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-tiling-4.html>
>         (Intel XE#4947
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947>)
>  *
>
>     igt@kms_joiner@basic-force-big-joiner:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@kms_joiner@basic-force-big-joiner.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-6/igt@kms_joiner@basic-force-big-joiner.html>
>         (Intel XE#3012
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012>)
>  *
>
>     igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a.html>
>         (Intel XE#2763
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763>) +3
>         other tests skip
>  *
>
>     igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-8/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html>
>         (Intel XE#4962
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4962>) +2
>         other tests skip
>  *
>
>     igt@kms_setmode@basic@pipe-b-edp-1:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-lnl-2/igt@kms_setmode@basic@pipe-b-edp-1.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-lnl-4/igt@kms_setmode@basic@pipe-b-edp-1.html>
>         (Intel XE#2883
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883>) +1
>         other test fail
>  *
>
>     igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-dg2-463/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null.html>
>         (Intel XE#1392
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392>) +1
>         other test skip
>  *
>
>     igt@xe_exec_system_allocator@process-many-large-malloc-race:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@xe_exec_system_allocator@process-many-large-malloc-race.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@xe_exec_system_allocator@process-many-large-malloc-race.html>
>         (Intel XE#4945
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945>)
>         +306 other tests skip
>  *
>
>     igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-fork-read:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-adlp-4/igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-fork-read.html>
>         (Intel XE#4915
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915> /
>         Intel XE#5560
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5560>)
>  *
>
>     igt@xe_exec_threads@threads-hang-fd-userptr-rebind:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-dg2-432/igt@xe_exec_threads@threads-hang-fd-userptr-rebind.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-dg2-436/igt@xe_exec_threads@threads-hang-fd-userptr-rebind.html>
>         (Intel XE#3876
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876>)
>
>
>         Possible fixes
>
>  *
>
>     igt@core_hotunplug@hotunplug-rescan:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@core_hotunplug@hotunplug-rescan.html>
>         (Intel XE#4963
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4963>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-1/igt@core_hotunplug@hotunplug-rescan.html>
>  *
>
>     igt@fbdev@info:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@fbdev@info.html>
>         (Intel XE#2134
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-7/igt@fbdev@info.html>
>  *
>
>     igt@kms_addfb_basic@bad-pitch-999:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@kms_addfb_basic@bad-pitch-999.html>
>         (Intel XE#4950
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-7/igt@kms_addfb_basic@bad-pitch-999.html>
>         +45 other tests pass
>  *
>
>     igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0.html>
>         (Intel XE#4947
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-7/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0.html>
>         +7 other tests pass
>  *
>
>     igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
>
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-lnl-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html>
>         (Intel XE#1231
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-lnl-3/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html>
>  *
>
>     igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
>
>       o shard-adlp: DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html>
>         (Intel XE#4543
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html>
>  *
>
>     igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html>
>         (Intel XE#2314
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314> /
>         Intel XE#2894
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-7/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html>
>  *
>
>     igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html>
>         (Intel XE#2291
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-7/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html>
>         +2 other tests pass
>  *
>
>     igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-6/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html>
>         (Intel XE#2316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-7/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html>
>  *
>
>     igt@kms_flip@basic-plain-flip@b-hdmi-a1:
>
>       o shard-adlp: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-adlp-6/igt@kms_flip@basic-plain-flip@b-hdmi-a1.html>
>         (Intel XE#4543
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-adlp-3/igt@kms_flip@basic-plain-flip@b-hdmi-a1.html>
>         +2 other tests pass
>  *
>
>     igt@kms_pm_rpm@basic-pci-d3-state:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@kms_pm_rpm@basic-pci-d3-state.html>
>         (Intel XE#4962
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4962>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-7/igt@kms_pm_rpm@basic-pci-d3-state.html>
>         +1 other test pass
>  *
>
>     igt@kms_setmode@clone-exclusive-crtc:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-6/igt@kms_setmode@clone-exclusive-crtc.html>
>         (Intel XE#1435
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-7/igt@kms_setmode@clone-exclusive-crtc.html>
>  *
>
>     igt@kms_vrr@cmrr@pipe-a-edp-1:
>
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-lnl-3/igt@kms_vrr@cmrr@pipe-a-edp-1.html>
>         (Intel XE#4459
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-lnl-2/igt@kms_vrr@cmrr@pipe-a-edp-1.html>
>         +1 other test pass
>  *
>
>     igt@xe_exec_basic@multigpu-once-bindexecqueue:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue.html>
>         (Intel XE#1392
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-dg2-436/igt@xe_exec_basic@multigpu-once-bindexecqueue.html>
>         +1 other test pass
>  *
>
>     igt@xe_exec_system_allocator@process-many-new-nomemset:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@xe_exec_system_allocator@process-many-new-nomemset.html>
>         (Intel XE#4945
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-4/igt@xe_exec_system_allocator@process-many-new-nomemset.html>
>         +230 other tests pass
>  *
>
>     igt@xe_live_ktest@xe_bo:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@xe_live_ktest@xe_bo.html>
>         (Intel XE#2229
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-1/igt@xe_live_ktest@xe_bo.html>
>         +1 other test pass
>
>
>         Warnings
>
>  *
>
>     igt@intel_hwmon@hwmon-write:
>
>       o shard-bmg: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-8/igt@intel_hwmon@hwmon-write.html>
>         (Intel XE#4665
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4665>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@intel_hwmon@hwmon-write.html>
>         (Intel XE#5177
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5177>)
>  *
>
>     igt@kms_big_fb@linear-64bpp-rotate-90:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@kms_big_fb@linear-64bpp-rotate-90.html>
>         (Intel XE#4947
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-7/igt@kms_big_fb@linear-64bpp-rotate-90.html>
>         (Intel XE#2327
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327>) +2
>         other tests skip
>  *
>
>     igt@kms_big_fb@linear-8bpp-rotate-270:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@kms_big_fb@linear-8bpp-rotate-270.html>
>         (Intel XE#2327
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_big_fb@linear-8bpp-rotate-270.html>
>         (Intel XE#4947
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947>) +1
>         other test skip
>  *
>
>     igt@kms_big_fb@yf-tiled-16bpp-rotate-180:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html>
>         (Intel XE#4947
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-7/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +7
>         other tests skip
>  *
>
>     igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-8/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html>
>         (Intel XE#4947
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947>) +8
>         other tests skip
>  *
>
>     igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-8/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html>
>         (Intel XE#2314
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314> /
>         Intel XE#2894
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html>
>         (Intel XE#4950
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950>)
>  *
>
>     igt@kms_bw@linear-tiling-1-displays-2160x1440p:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html>
>         (Intel XE#367
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html>
>         (Intel XE#4950
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950>) +1
>         other test skip
>  *
>
>     igt@kms_bw@linear-tiling-2-displays-2160x1440p:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html>
>         (Intel XE#4950
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-7/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html>
>         (Intel XE#367
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>)
>  *
>
>     igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html>
>         (Intel XE#4947
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-4/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html>
>         (Intel XE#2887
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887>) +4
>         other tests skip
>  *
>
>     igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html>
>         (Intel XE#2652
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html>
>         (Intel XE#4947
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947>)
>  *
>
>     igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html>
>         (Intel XE#3432
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html>
>         (Intel XE#4947
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947>) +1
>         other test skip
>  *
>
>     igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html>
>         (Intel XE#4947
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html>
>         (Intel XE#3432
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432>) +1
>         other test skip
>  *
>
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html>
>         (Intel XE#2887
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html>
>         (Intel XE#4947
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947>)
>         +11 other tests skip
>  *
>
>     igt@kms_chamelium_color@ctm-0-25:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@kms_chamelium_color@ctm-0-25.html>
>         (Intel XE#4950
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-7/igt@kms_chamelium_color@ctm-0-25.html>
>         (Intel XE#2325
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325>) +1
>         other test skip
>  *
>
>     igt@kms_chamelium_color@ctm-0-50:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@kms_chamelium_color@ctm-0-50.html>
>         (Intel XE#2325
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_chamelium_color@ctm-0-50.html>
>         (Intel XE#4950
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950>)
>  *
>
>     igt@kms_chamelium_frames@dp-crc-single:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@kms_chamelium_frames@dp-crc-single.html>
>         (Intel XE#4950
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-4/igt@kms_chamelium_frames@dp-crc-single.html>
>         (Intel XE#2252
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252>) +5
>         other tests skip
>  *
>
>     igt@kms_chamelium_hpd@vga-hpd-fast:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-8/igt@kms_chamelium_hpd@vga-hpd-fast.html>
>         (Intel XE#2252
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_chamelium_hpd@vga-hpd-fast.html>
>         (Intel XE#4950
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950>) +7
>         other tests skip
>  *
>
>     igt@kms_content_protection@atomic:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@kms_content_protection@atomic.html>
>         (Intel XE#4950
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950>) ->
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-4/igt@kms_content_protection@atomic.html>
>         (Intel XE#1178
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178>) +1
>         other test fail
>  *
>
>     igt@kms_content_protection@dp-mst-type-0:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@kms_content_protection@dp-mst-type-0.html>
>         (Intel XE#2390
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_content_protection@dp-mst-type-0.html>
>         (Intel XE#4950
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950>) +1
>         other test skip
>  *
>
>     igt@kms_content_protection@lic-type-1:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-8/igt@kms_content_protection@lic-type-1.html>
>         (Intel XE#2341
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_content_protection@lic-type-1.html>
>         (Intel XE#4950
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950>)
>  *
>
>     igt@kms_content_protection@type1:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@kms_content_protection@type1.html>
>         (Intel XE#4950
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-7/igt@kms_content_protection@type1.html>
>         (Intel XE#2341
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341>)
>  *
>
>     igt@kms_cursor_crc@cursor-rapid-movement-512x170:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html>
>         (Intel XE#2321
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html>
>         (Intel XE#4950
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950>)
>  *
>
>     igt@kms_cursor_crc@cursor-rapid-movement-64x21:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@kms_cursor_crc@cursor-rapid-movement-64x21.html>
>         (Intel XE#2320
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_cursor_crc@cursor-rapid-movement-64x21.html>
>         (Intel XE#4950
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950>)
>  *
>
>     igt@kms_cursor_crc@cursor-sliding-32x10:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@kms_cursor_crc@cursor-sliding-32x10.html>
>         (Intel XE#4950
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-7/igt@kms_cursor_crc@cursor-sliding-32x10.html>
>         (Intel XE#2320
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320>)
>  *
>
>     igt@kms_cursor_crc@cursor-sliding-512x512:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@kms_cursor_crc@cursor-sliding-512x512.html>
>         (Intel XE#4950
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-1/igt@kms_cursor_crc@cursor-sliding-512x512.html>
>         (Intel XE#2321
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321>)
>  *
>
>     igt@kms_dirtyfb@psr-dirtyfb-ioctl:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-8/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html>
>         (Intel XE#1508
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html>
>         (Intel XE#4947
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947>)
>  *
>
>     igt@kms_dp_link_training@non-uhbr-mst:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@kms_dp_link_training@non-uhbr-mst.html>
>         (Intel XE#4354
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_dp_link_training@non-uhbr-mst.html>
>         (Intel XE#4947
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947>)
>  *
>
>     igt@kms_dp_link_training@uhbr-sst:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@kms_dp_link_training@uhbr-sst.html>
>         (Intel XE#4947
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-7/igt@kms_dp_link_training@uhbr-sst.html>
>         (Intel XE#4354
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354>)
>  *
>
>     igt@kms_dsc@dsc-with-output-formats:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@kms_dsc@dsc-with-output-formats.html>
>         (Intel XE#4947
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-1/igt@kms_dsc@dsc-with-output-formats.html>
>         (Intel XE#2244
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244>)
>  *
>
>     igt@kms_feature_discovery@display-4x:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@kms_feature_discovery@display-4x.html>
>         (Intel XE#4950
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-1/igt@kms_feature_discovery@display-4x.html>
>         (Intel XE#1138
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138>)
>  *
>
>     igt@kms_feature_discovery@psr2:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@kms_feature_discovery@psr2.html>
>         (Intel XE#2374
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_feature_discovery@psr2.html>
>         (Intel XE#4950
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950>)
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html>
>         (Intel XE#2293
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293> /
>         Intel XE#2380
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html>
>         (Intel XE#4947
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947>) +3
>         other tests skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html>
>         (Intel XE#4947
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html>
>         (Intel XE#2293
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293> /
>         Intel XE#2380
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380>)
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-pgflip-blt:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-pgflip-blt.html>
>         (Intel XE#4947
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-pgflip-blt.html>
>         (Intel XE#2311
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311>)
>         +13 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html>
>         (Intel XE#2312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html>
>         (Intel XE#2311
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311>) +2
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html>
>         (Intel XE#2311
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html>
>         (Intel XE#2312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) +3
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html>
>         (Intel XE#2311
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html>
>         (Intel XE#4947
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947>)
>         +22 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html>
>         (Intel XE#4947
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html>
>         (Intel XE#5390
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390>) +7
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-rte:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-rte.html>
>         (Intel XE#4947
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-rte.html>
>         (Intel XE#5427
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5427>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc.html>
>         (Intel XE#2312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc.html>
>         (Intel XE#5390
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html>
>         (Intel XE#5390
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html>
>         (Intel XE#4947
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947>)
>         +10 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.html>
>         (Intel XE#5390
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.html>
>         (Intel XE#2312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) +2
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html>
>         (Intel XE#2313
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html>
>         (Intel XE#4947
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947>)
>         +24 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html>
>         (Intel XE#2313
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html>
>         (Intel XE#2312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) +3
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html>
>         (Intel XE#2312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html>
>         (Intel XE#2313
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313>) +4
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@pipe-fbc-rte:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html>
>         (Intel XE#4947
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-1/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html>
>         (Intel XE#5672
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5672>)
>  *
>
>     igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.html>
>         (Intel XE#4947
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.html>
>         (Intel XE#2313
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313>)
>         +18 other tests skip
>  *
>
>     igt@kms_joiner@invalid-modeset-force-ultra-joiner:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html>
>         (Intel XE#4947
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-1/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html>
>         (Intel XE#2934
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934>)
>  *
>
>     igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-8/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html>
>         (Intel XE#4090
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4090>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html>
>         (Intel XE#4947
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947>)
>  *
>
>     igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html>
>         (Intel XE#4950
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-7/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html>
>         (Intel XE#2501
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2501>)
>  *
>
>     igt@kms_pipe_stress@stress-xrgb8888-ytiled:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-8/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html>
>         (Intel XE#4329
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4329>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html>
>         (Intel XE#4947
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947>)
>  *
>
>     igt@kms_plane_lowres@tiling-y:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@kms_plane_lowres@tiling-y.html>
>         (Intel XE#4950
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-1/igt@kms_plane_lowres@tiling-y.html>
>         (Intel XE#2393
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393>)
>  *
>
>     igt@kms_plane_multiple@tiling-y:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@kms_plane_multiple@tiling-y.html>
>         (Intel XE#5020
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_plane_multiple@tiling-y.html>
>         (Intel XE#4950
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950>)
>  *
>
>     igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html>
>         (Intel XE#4950
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html>
>         (Intel XE#2763
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763>)
>  *
>
>     igt@kms_pm_backlight@fade:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-8/igt@kms_pm_backlight@fade.html>
>         (Intel XE#870
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/870>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_pm_backlight@fade.html>
>         (Intel XE#4947
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947>)
>  *
>
>     igt@kms_pm_dc@dc3co-vpb-simulation:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@kms_pm_dc@dc3co-vpb-simulation.html>
>         (Intel XE#2391
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2391>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_pm_dc@dc3co-vpb-simulation.html>
>         (Intel XE#4947
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947>)
>  *
>
>     igt@kms_pm_dc@dc6-psr:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@kms_pm_dc@dc6-psr.html>
>         (Intel XE#2392
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_pm_dc@dc6-psr.html>
>         (Intel XE#4947
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947>)
>  *
>
>     igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area.html>
>         (Intel XE#4947
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-7/igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area.html>
>         (Intel XE#1489
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) +3
>         other tests skip
>  *
>
>     igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-8/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html>
>         (Intel XE#1489
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html>
>         (Intel XE#4947
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947>) +5
>         other tests skip
>  *
>
>     igt@kms_psr2_su@page_flip-nv12:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@kms_psr2_su@page_flip-nv12.html>
>         (Intel XE#4947
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-7/igt@kms_psr2_su@page_flip-nv12.html>
>         (Intel XE#2387
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387>)
>  *
>
>     igt@kms_psr2_su@page_flip-p010:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@kms_psr2_su@page_flip-p010.html>
>         (Intel XE#2387
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_psr2_su@page_flip-p010.html>
>         (Intel XE#4947
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947>) +1
>         other test skip
>  *
>
>     igt@kms_psr@psr-primary-page-flip:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-8/igt@kms_psr@psr-primary-page-flip.html>
>         (Intel XE#2234
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234> /
>         Intel XE#2850
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_psr@psr-primary-page-flip.html>
>         (Intel XE#4947
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947>) +7
>         other tests skip
>  *
>
>     igt@kms_psr@psr2-primary-render:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@kms_psr@psr2-primary-render.html>
>         (Intel XE#2234
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_psr@psr2-primary-render.html>
>         (Intel XE#4947
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947>)
>  *
>
>     igt@kms_psr@psr2-sprite-blt:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@kms_psr@psr2-sprite-blt.html>
>         (Intel XE#4947
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-7/igt@kms_psr@psr2-sprite-blt.html>
>         (Intel XE#2234
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234> /
>         Intel XE#2850
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850>) +7
>         other tests skip
>  *
>
>     igt@kms_rotation_crc@primary-rotation-90:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@kms_rotation_crc@primary-rotation-90.html>
>         (Intel XE#3414
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414> /
>         Intel XE#3904
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_rotation_crc@primary-rotation-90.html>
>         (Intel XE#4950
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950>)
>  *
>
>     igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-8/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html>
>         (Intel XE#2330
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html>
>         (Intel XE#4950
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950>)
>  *
>
>     igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html>
>         (Intel XE#4950
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html>
>         (Intel XE#3414
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414> /
>         Intel XE#3904
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904>) +1
>         other test skip
>  *
>
>     igt@kms_scaling_modes@scaling-mode-full:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@kms_scaling_modes@scaling-mode-full.html>
>         (Intel XE#2413
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_scaling_modes@scaling-mode-full.html>
>         (Intel XE#4950
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950>)
>  *
>
>     igt@kms_tiled_display@basic-test-pattern:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern.html>
>         (Intel XE#4950
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950>) ->
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html>
>         (Intel XE#1729
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729>)
>  *
>
>     igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html>
>         (Intel XE#362
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/362>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html>
>         (Intel XE#1500
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500>)
>  *
>
>     igt@kms_vrr@seamless-rr-switch-virtual:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@kms_vrr@seamless-rr-switch-virtual.html>
>         (Intel XE#4950
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-7/igt@kms_vrr@seamless-rr-switch-virtual.html>
>         (Intel XE#1499
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499>)
>  *
>
>     igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html>
>         (Intel XE#4950
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-1/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html>
>         (Intel XE#1091
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091> /
>         Intel XE#2849
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849>)
>  *
>
>     igt@xe_eudebug@basic-vm-access-faultable:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-8/igt@xe_eudebug@basic-vm-access-faultable.html>
>         (Intel XE#4837
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@xe_eudebug@basic-vm-access-faultable.html>
>         (Intel XE#4945
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945>) +9
>         other tests skip
>  *
>
>     igt@xe_eudebug@basic-vm-bind-metadata-discovery:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html>
>         (Intel XE#4945
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-7/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html>
>         (Intel XE#4837
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837>) +9
>         other tests skip
>  *
>
>     igt@xe_eudebug_sriov@deny-eudebug:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-8/igt@xe_eudebug_sriov@deny-eudebug.html>
>         (Intel XE#4518
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@xe_eudebug_sriov@deny-eudebug.html>
>         (Intel XE#4945
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945>)
>  *
>
>     igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html>
>         (Intel XE#2322
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html>
>         (Intel XE#4945
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945>) +6
>         other tests skip
>  *
>
>     igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind.html>
>         (Intel XE#4945
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-7/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind.html>
>         (Intel XE#2322
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322>) +3
>         other tests skip
>  *
>
>     igt@xe_exec_reset@parallel-gt-reset:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@xe_exec_reset@parallel-gt-reset.html>
>         (Intel XE#4945
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945>) ->
>         DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-4/igt@xe_exec_reset@parallel-gt-reset.html>
>         (Intel XE#3876
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876>)
>  *
>
>     igt@xe_exec_system_allocator@once-mmap-huge-nomemset:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@xe_exec_system_allocator@once-mmap-huge-nomemset.html>
>         (Intel XE#4945
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-7/igt@xe_exec_system_allocator@once-mmap-huge-nomemset.html>
>         (Intel XE#4943
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943>)
>         +16 other tests skip
>  *
>
>     igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-huge-nomemset:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-huge-nomemset.html>
>         (Intel XE#4943
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-huge-nomemset.html>
>         (Intel XE#4945
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945>)
>         +12 other tests skip
>  *
>
>     igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html>
>         (Intel XE#4945
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945>) ->
>         ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-1/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html>
>         (Intel XE#4917
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4917> /
>         Intel XE#5466
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466> /
>         Intel XE#5530
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5530>)
>  *
>
>     igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:
>
>       o shard-bmg: ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html>
>         (Intel XE#5530
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5530>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html>
>         (Intel XE#4945
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945>)
>  *
>
>     igt@xe_media_fill@media-fill:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@xe_media_fill@media-fill.html>
>         (Intel XE#4945
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-4/igt@xe_media_fill@media-fill.html>
>         (Intel XE#2459
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2459> /
>         Intel XE#2596
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2596>)
>  *
>
>     igt@xe_pat@pat-index-xelp:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@xe_pat@pat-index-xelp.html>
>         (Intel XE#4945
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-1/igt@xe_pat@pat-index-xelp.html>
>         (Intel XE#2245
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245>)
>  *
>
>     igt@xe_pm@d3cold-basic:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@xe_pm@d3cold-basic.html>
>         (Intel XE#4945
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-4/igt@xe_pm@d3cold-basic.html>
>         (Intel XE#2284
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284>)
>  *
>
>     igt@xe_pm@d3cold-i2c:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@xe_pm@d3cold-i2c.html>
>         (Intel XE#5694
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@xe_pm@d3cold-i2c.html>
>         (Intel XE#4945
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945>)
>  *
>
>     igt@xe_pm@s2idle-d3cold-basic-exec:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@xe_pm@s2idle-d3cold-basic-exec.html>
>         (Intel XE#2284
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@xe_pm@s2idle-d3cold-basic-exec.html>
>         (Intel XE#4945
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945>) +1
>         other test skip
>  *
>
>     igt@xe_pmu@fn-engine-activity-sched-if-idle:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@xe_pmu@fn-engine-activity-sched-if-idle.html>
>         (Intel XE#4945
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-7/igt@xe_pmu@fn-engine-activity-sched-if-idle.html>
>         (Intel XE#4650
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650>)
>  *
>
>     igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html>
>         (Intel XE#4945
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-7/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html>
>         (Intel XE#4733
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733>) +1
>         other test skip
>  *
>
>     igt@xe_pxp@pxp-stale-bo-exec-post-suspend:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-8/igt@xe_pxp@pxp-stale-bo-exec-post-suspend.html>
>         (Intel XE#4733
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@xe_pxp@pxp-stale-bo-exec-post-suspend.html>
>         (Intel XE#4945
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945>)
>  *
>
>     igt@xe_query@multigpu-query-config:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@xe_query@multigpu-query-config.html>
>         (Intel XE#944
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@xe_query@multigpu-query-config.html>
>         (Intel XE#4945
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945>) +2
>         other tests skip
>  *
>
>     igt@xe_query@multigpu-query-invalid-extension:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@xe_query@multigpu-query-invalid-extension.html>
>         (Intel XE#4945
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-4/igt@xe_query@multigpu-query-invalid-extension.html>
>         (Intel XE#944
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>) +1
>         other test skip
>  *
>
>     igt@xe_sriov_auto_provisioning@exclusive-ranges:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-8/igt@xe_sriov_auto_provisioning@exclusive-ranges.html>
>         (Intel XE#4130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@xe_sriov_auto_provisioning@exclusive-ranges.html>
>         (Intel XE#4945
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945>)
>  *
>
>     igt@xe_sriov_scheduling@equal-throughput:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@xe_sriov_scheduling@equal-throughput.html>
>         (Intel XE#4351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4351>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@xe_sriov_scheduling@equal-throughput.html>
>         (Intel XE#4945
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945>)
>
> {name}: This element is suppressed. This means it is ignored when 
> computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
>
>
>     Build changes
>
>   * Linux: xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a ->
>     xe-pw-148982v10
>
> IGT_8482: 8482
> xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a: 
> acb5c859a41719652f1807b30240ca4ee82a473a
> xe-pw-148982v10: 148982v10
>
--------------23tieGZa7lCtTnyplB5DJb09
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>The rev10 of this series is identical to rev9, differing only in
      a comment. No issues were reported for the rev9 series, so it is
      unlikely the ones here are real.</p>
    <p>But will check them regardless.</p>
    <ul>
      <li>
        <p>igt@xe_exec_balancer@once-cm-parallel-userptr:</p>
        <ul>
          <li>shard-adlp: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-adlp-6/igt@xe_exec_balancer@once-cm-parallel-userptr.html">PASS</a>
            -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-adlp-2/igt@xe_exec_balancer@once-cm-parallel-userptr.html">FAIL</a></li>
        </ul>
      </li>
    </ul>
    <p>&nbsp;- the issue is with a fence never getting completed, leading to
      timeout; this happens on UMD side; the unsatisfied fence doesn't
      seem to be related to GPU hang, as KMD doesn't notice any issue<br>
    </p>
    <p>- KMD messages around the issue are coming from PM and display,
      nothing to do with the tested series<br>
    </p>
    <p><br>
    </p>
    <ul>
      <li>
        <p>igt@xe_exec_system_allocator@process-many-malloc-bo-unmap-nomemset:</p>
        <ul>
          <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-3/igt@xe_exec_system_allocator@process-many-malloc-bo-unmap-nomemset.html">PASS</a>
            -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-1/igt@xe_exec_system_allocator@process-many-malloc-bo-unmap-nomemset.html">FAIL</a></li>
        </ul>
      </li>
    </ul>
    <p>- Here we have page faults, looks like memory tables were
      corrupted, or things get freed prematurely?</p>
    <p>- the series does slightly modify suballocator, but the issue is
      unrelated to the series being tested<br>
    </p>
    <p><br>
    </p>
    <ul>
      <li>
        <p>igt@xe_fault_injection@vm-bind-fail-xe_sync_entry_parse:</p>
        <ul>
          <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-7/igt@xe_fault_injection@vm-bind-fail-xe_sync_entry_parse.html">PASS</a>
            -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-4/igt@xe_fault_injection@vm-bind-fail-xe_sync_entry_parse.html">ABORT</a></li>
        </ul>
      </li>
    </ul>
    <p>- display-related issue; since xe still uses i915 code for
      display, it may be caused by a change there</p>
    <p>- unrelated to series under test<br>
    </p>
    <p><span id="dmesg-normal1" class="dmesg dmesg-normal dmesg-igt"><br>
        Conclusion - regressions are not caused by this series.</span></p>
    <p><span id="dmesg-normal1" class="dmesg dmesg-normal dmesg-igt"><br>
      </span></p>
    <p><span id="dmesg-normal1" class="dmesg dmesg-normal dmesg-igt">-Tomasz<br>
      </span></p>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 02.08.2025 07:43, Patchwork wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:175411338890.207044.16814631529141328547@1538d3639d33">
      
      <title>Project List - Patchwork</title>
      <style id="css-table-select" type="text/css">td { padding: 2pt; }</style>
      <b>Patch Details</b>
      <table>
        <tbody>
          <tr>
            <td><b>Series:</b></td>
            <td>drm/xe/vf: Post-migration recovery of queues and jobs
              (rev10)</td>
          </tr>
          <tr>
            <td><b>URL:</b></td>
            <td><a href="https://patchwork.freedesktop.org/series/148982/" moz-do-not-send="true" class="moz-txt-link-freetext">https://patchwork.freedesktop.org/series/148982/</a></td>
          </tr>
          <tr>
            <td><b>State:</b></td>
            <td>failure</td>
          </tr>
          <tr>
            <td><b>Details:</b></td>
            <td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/index.html" moz-do-not-send="true" class="moz-txt-link-freetext">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/index.html</a></td>
          </tr>
        </tbody>
      </table>
      <h1>CI Bug Log - changes from
        xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a_FULL -&gt;
        xe-pw-148982v10_FULL</h1>
      <h2>Summary</h2>
      <p><strong>FAILURE</strong></p>
      <p>Serious unknown changes coming with xe-pw-148982v10_FULL
        absolutely need to be<br>
        verified manually.</p>
      <p>If you think the reported changes have nothing to do with the
        changes<br>
        introduced in xe-pw-148982v10_FULL, please notify your bug team
        (<a class="moz-txt-link-abbreviated" href="mailto:I915-ci-infra@lists.freedesktop.org">I915-ci-infra@lists.freedesktop.org</a>) to allow them<br>
        to document this new failure mode, which will reduce false
        positives in CI.</p>
      <h2>Participating hosts (4 -&gt; 4)</h2>
      <p>No changes in participating hosts</p>
      <h2>Possible new issues</h2>
      <p>Here are the unknown changes that may have been introduced in
        xe-pw-148982v10_FULL:</p>
      <h3>IGT changes</h3>
      <h4>Possible regressions</h4>
      <ul>
        <li>
          <p>igt@xe_exec_balancer@once-cm-parallel-userptr:</p>
          <ul>
            <li>shard-adlp: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-adlp-6/igt@xe_exec_balancer@once-cm-parallel-userptr.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-adlp-2/igt@xe_exec_balancer@once-cm-parallel-userptr.html" moz-do-not-send="true">FAIL</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_system_allocator@process-many-malloc-bo-unmap-nomemset:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-3/igt@xe_exec_system_allocator@process-many-malloc-bo-unmap-nomemset.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-1/igt@xe_exec_system_allocator@process-many-malloc-bo-unmap-nomemset.html" moz-do-not-send="true">FAIL</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_fault_injection@vm-bind-fail-xe_sync_entry_parse:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-7/igt@xe_fault_injection@vm-bind-fail-xe_sync_entry_parse.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-4/igt@xe_fault_injection@vm-bind-fail-xe_sync_entry_parse.html" moz-do-not-send="true">ABORT</a></li>
          </ul>
        </li>
      </ul>
      <h4>Warnings</h4>
      <ul>
        <li>igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute:
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945" moz-do-not-send="true">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-4/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html" moz-do-not-send="true">ABORT</a></li>
          </ul>
        </li>
      </ul>
      <h2>New tests</h2>
      <p>New tests have been introduced between
        xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a_FULL and
        xe-pw-148982v10_FULL:</p>
      <h3>New IGT tests (10)</h3>
      <ul>
        <li>
          <p>igt@kms_async_flips@crc@pipe-d-dp-2:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [2.29] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_async_flips@test-cursor@pipe-d-dp-2:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.19] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_async_flips@test-time-stamp@pipe-a-dp-2:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.20] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_async_flips@test-time-stamp@pipe-b-dp-2:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.20] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_async_flips@test-time-stamp@pipe-c-dp-2:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.21] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_async_flips@test-time-stamp@pipe-d-dp-2:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.20] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cdclk@plane-scaling@pipe-a-dp-2:</p>
          <ul>
            <li>Statuses : 1 skip(s)</li>
            <li>Exec time: [0.00] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cdclk@plane-scaling@pipe-b-dp-2:</p>
          <ul>
            <li>Statuses : 1 skip(s)</li>
            <li>Exec time: [0.00] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cdclk@plane-scaling@pipe-c-dp-2:</p>
          <ul>
            <li>Statuses : 1 skip(s)</li>
            <li>Exec time: [0.00] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_lowres@tiling-x@pipe-d-dp-2:</p>
          <ul>
            <li>Statuses : 2 pass(s)</li>
            <li>Exec time: [8.97, 9.36] s</li>
          </ul>
        </li>
      </ul>
      <h2>Known issues</h2>
      <p>Here are the changes found in xe-pw-148982v10_FULL that come
        from known issues:</p>
      <h3>IGT changes</h3>
      <h4>Issues hit</h4>
      <ul>
        <li>
          <p>igt@core_hotunplug@hotreplug-lateclose:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@core_hotunplug@hotreplug-lateclose.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@core_hotunplug@hotreplug-lateclose.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4963" moz-do-not-send="true">Intel XE#4963</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@core_setmaster@master-drop-set-root:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@core_setmaster@master-drop-set-root.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@core_setmaster@master-drop-set-root.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4672" moz-do-not-send="true">Intel XE#4672</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@fbdev@write:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@fbdev@write.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@fbdev@write.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134" moz-do-not-send="true">Intel XE#2134</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_atomic_transition@modeset-transition:</p>
          <ul>
            <li>shard-adlp: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-adlp-1/igt@kms_atomic_transition@modeset-transition.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-adlp-8/igt@kms_atomic_transition@modeset-transition.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953" moz-do-not-send="true">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173" moz-do-not-send="true">Intel XE#4173</a>) +4 other tests
              dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-8/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947" moz-do-not-send="true">Intel XE#4947</a>) +12 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
          <ul>
            <li>shard-adlp: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html" moz-do-not-send="true">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543" moz-do-not-send="true">Intel XE#4543</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314" moz-do-not-send="true">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894" moz-do-not-send="true">Intel XE#2894</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-dg2-436/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787" moz-do-not-send="true">Intel XE#787</a>) +55 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-2:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-2.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455" moz-do-not-send="true">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787" moz-do-not-send="true">Intel XE#787</a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-adlp-4/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455" moz-do-not-send="true">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787" moz-do-not-send="true">Intel XE#787</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-b-hdmi-a-1:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-adlp-4/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-b-hdmi-a-1.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787" moz-do-not-send="true">Intel XE#787</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727" moz-do-not-send="true">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113" moz-do-not-send="true">Intel XE#3113</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124" moz-do-not-send="true">Intel XE#3124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345" moz-do-not-send="true">Intel XE#4345</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727" moz-do-not-send="true">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113" moz-do-not-send="true">Intel XE#3113</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124" moz-do-not-send="true">Intel XE#3124</a>) +1 other test
              incomplete</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727" moz-do-not-send="true">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705" moz-do-not-send="true">Intel XE#2705</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113" moz-do-not-send="true">Intel XE#3113</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212" moz-do-not-send="true">Intel XE#4212</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345" moz-do-not-send="true">Intel XE#4345</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522" moz-do-not-send="true">Intel XE#4522</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124" moz-do-not-send="true">Intel XE#3124</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727" moz-do-not-send="true">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113" moz-do-not-send="true">Intel XE#3113</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727" moz-do-not-send="true">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705" moz-do-not-send="true">Intel XE#2705</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113" moz-do-not-send="true">Intel XE#3113</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212" moz-do-not-send="true">Intel XE#4212</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522" moz-do-not-send="true">Intel XE#4522</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-adlp-4/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373" moz-do-not-send="true">Intel XE#373</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@atomic@pipe-a-dp-2:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-4/igt@kms_content_protection@atomic@pipe-a-dp-2.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178" moz-do-not-send="true">Intel XE#1178</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@lic-type-0@pipe-a-dp-2:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-dg2-432/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178" moz-do-not-send="true">Intel XE#1178</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291" moz-do-not-send="true">Intel XE#2291</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@flip-vs-cursor-toggle:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950" moz-do-not-send="true">Intel XE#4950</a>) +56 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dp_aux_dev:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@kms_dp_aux_dev.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-6/igt@kms_dp_aux_dev.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009" moz-do-not-send="true">Intel XE#3009</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@basic-flip-vs-wf_vblank@b-hdmi-a1:</p>
          <ul>
            <li>shard-adlp: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-adlp-9/igt@kms_flip@basic-flip-vs-wf_vblank@b-hdmi-a1.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-adlp-6/igt@kms_flip@basic-flip-vs-wf_vblank@b-hdmi-a1.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543" moz-do-not-send="true">Intel XE#4543</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-valid-mode:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-valid-mode.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293" moz-do-not-send="true">Intel XE#2293</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-modesetfrombusy:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-modesetfrombusy.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651" moz-do-not-send="true">Intel XE#651</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-tiling-4:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-tiling-4.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947" moz-do-not-send="true">Intel XE#4947</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_joiner@basic-force-big-joiner:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@kms_joiner@basic-force-big-joiner.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-6/igt@kms_joiner@basic-force-big-joiner.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012" moz-do-not-send="true">Intel XE#3012</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763" moz-do-not-send="true">Intel XE#2763</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-8/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4962" moz-do-not-send="true">Intel XE#4962</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_setmode@basic@pipe-b-edp-1:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-lnl-2/igt@kms_setmode@basic@pipe-b-edp-1.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-lnl-4/igt@kms_setmode@basic@pipe-b-edp-1.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883" moz-do-not-send="true">Intel XE#2883</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-dg2-463/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392" moz-do-not-send="true">Intel XE#1392</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_system_allocator@process-many-large-malloc-race:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@xe_exec_system_allocator@process-many-large-malloc-race.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@xe_exec_system_allocator@process-many-large-malloc-race.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945" moz-do-not-send="true">Intel XE#4945</a>) +306 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-fork-read:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-adlp-4/igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-fork-read.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915" moz-do-not-send="true">Intel XE#4915</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5560" moz-do-not-send="true">Intel XE#5560</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_threads@threads-hang-fd-userptr-rebind:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-dg2-432/igt@xe_exec_threads@threads-hang-fd-userptr-rebind.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-dg2-436/igt@xe_exec_threads@threads-hang-fd-userptr-rebind.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876" moz-do-not-send="true">Intel XE#3876</a>)</li>
          </ul>
        </li>
      </ul>
      <h4>Possible fixes</h4>
      <ul>
        <li>
          <p>igt@core_hotunplug@hotunplug-rescan:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@core_hotunplug@hotunplug-rescan.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4963" moz-do-not-send="true">Intel XE#4963</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-1/igt@core_hotunplug@hotunplug-rescan.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@fbdev@info:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@fbdev@info.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134" moz-do-not-send="true">Intel XE#2134</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-7/igt@fbdev@info.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_addfb_basic@bad-pitch-999:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@kms_addfb_basic@bad-pitch-999.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950" moz-do-not-send="true">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-7/igt@kms_addfb_basic@bad-pitch-999.html" moz-do-not-send="true">PASS</a> +45 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947" moz-do-not-send="true">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-7/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0.html" moz-do-not-send="true">PASS</a> +7 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-lnl-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231" moz-do-not-send="true">Intel XE#1231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-lnl-3/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
          <ul>
            <li>shard-adlp: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html" moz-do-not-send="true">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543" moz-do-not-send="true">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314" moz-do-not-send="true">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894" moz-do-not-send="true">Intel XE#2894</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-7/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@cursora-vs-flipb-legacy:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291" moz-do-not-send="true">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-7/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html" moz-do-not-send="true">PASS</a> +2 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-6/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316" moz-do-not-send="true">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-7/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@basic-plain-flip@b-hdmi-a1:</p>
          <ul>
            <li>shard-adlp: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-adlp-6/igt@kms_flip@basic-plain-flip@b-hdmi-a1.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543" moz-do-not-send="true">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-adlp-3/igt@kms_flip@basic-plain-flip@b-hdmi-a1.html" moz-do-not-send="true">PASS</a> +2 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@basic-pci-d3-state:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@kms_pm_rpm@basic-pci-d3-state.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4962" moz-do-not-send="true">Intel XE#4962</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-7/igt@kms_pm_rpm@basic-pci-d3-state.html" moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_setmode@clone-exclusive-crtc:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-6/igt@kms_setmode@clone-exclusive-crtc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435" moz-do-not-send="true">Intel XE#1435</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-7/igt@kms_setmode@clone-exclusive-crtc.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-lnl-3/igt@kms_vrr@cmrr@pipe-a-edp-1.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459" moz-do-not-send="true">Intel XE#4459</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-lnl-2/igt@kms_vrr@cmrr@pipe-a-edp-1.html" moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_basic@multigpu-once-bindexecqueue:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392" moz-do-not-send="true">Intel XE#1392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-dg2-436/igt@xe_exec_basic@multigpu-once-bindexecqueue.html" moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_system_allocator@process-many-new-nomemset:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@xe_exec_system_allocator@process-many-new-nomemset.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945" moz-do-not-send="true">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-4/igt@xe_exec_system_allocator@process-many-new-nomemset.html" moz-do-not-send="true">PASS</a> +230 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_live_ktest@xe_bo:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@xe_live_ktest@xe_bo.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229" moz-do-not-send="true">Intel XE#2229</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-1/igt@xe_live_ktest@xe_bo.html" moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
      </ul>
      <h4>Warnings</h4>
      <ul>
        <li>
          <p>igt@intel_hwmon@hwmon-write:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-8/igt@intel_hwmon@hwmon-write.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4665" moz-do-not-send="true">Intel XE#4665</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@intel_hwmon@hwmon-write.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5177" moz-do-not-send="true">Intel XE#5177</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@linear-64bpp-rotate-90:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@kms_big_fb@linear-64bpp-rotate-90.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947" moz-do-not-send="true">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-7/igt@kms_big_fb@linear-64bpp-rotate-90.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327" moz-do-not-send="true">Intel XE#2327</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@kms_big_fb@linear-8bpp-rotate-270.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327" moz-do-not-send="true">Intel XE#2327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_big_fb@linear-8bpp-rotate-270.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947" moz-do-not-send="true">Intel XE#4947</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-16bpp-rotate-180:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947" moz-do-not-send="true">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-7/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124" moz-do-not-send="true">Intel XE#1124</a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-8/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124" moz-do-not-send="true">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947" moz-do-not-send="true">Intel XE#4947</a>) +8 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-8/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314" moz-do-not-send="true">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894" moz-do-not-send="true">Intel XE#2894</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950" moz-do-not-send="true">Intel XE#4950</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@linear-tiling-1-displays-2160x1440p:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367" moz-do-not-send="true">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950" moz-do-not-send="true">Intel XE#4950</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@linear-tiling-2-displays-2160x1440p:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950" moz-do-not-send="true">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-7/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367" moz-do-not-send="true">Intel XE#367</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947" moz-do-not-send="true">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-4/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887" moz-do-not-send="true">Intel XE#2887</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652" moz-do-not-send="true">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787" moz-do-not-send="true">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947" moz-do-not-send="true">Intel XE#4947</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432" moz-do-not-send="true">Intel XE#3432</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947" moz-do-not-send="true">Intel XE#4947</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947" moz-do-not-send="true">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432" moz-do-not-send="true">Intel XE#3432</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887" moz-do-not-send="true">Intel XE#2887</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947" moz-do-not-send="true">Intel XE#4947</a>) +11 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_color@ctm-0-25:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@kms_chamelium_color@ctm-0-25.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950" moz-do-not-send="true">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-7/igt@kms_chamelium_color@ctm-0-25.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325" moz-do-not-send="true">Intel XE#2325</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_color@ctm-0-50:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@kms_chamelium_color@ctm-0-50.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325" moz-do-not-send="true">Intel XE#2325</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_chamelium_color@ctm-0-50.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950" moz-do-not-send="true">Intel XE#4950</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_frames@dp-crc-single:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@kms_chamelium_frames@dp-crc-single.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950" moz-do-not-send="true">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-4/igt@kms_chamelium_frames@dp-crc-single.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252" moz-do-not-send="true">Intel XE#2252</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_hpd@vga-hpd-fast:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-8/igt@kms_chamelium_hpd@vga-hpd-fast.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252" moz-do-not-send="true">Intel XE#2252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_chamelium_hpd@vga-hpd-fast.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950" moz-do-not-send="true">Intel XE#4950</a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@atomic:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@kms_content_protection@atomic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950" moz-do-not-send="true">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-4/igt@kms_content_protection@atomic.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178" moz-do-not-send="true">Intel XE#1178</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@dp-mst-type-0:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@kms_content_protection@dp-mst-type-0.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390" moz-do-not-send="true">Intel XE#2390</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_content_protection@dp-mst-type-0.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950" moz-do-not-send="true">Intel XE#4950</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@lic-type-1:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-8/igt@kms_content_protection@lic-type-1.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341" moz-do-not-send="true">Intel XE#2341</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_content_protection@lic-type-1.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950" moz-do-not-send="true">Intel XE#4950</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@type1:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@kms_content_protection@type1.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950" moz-do-not-send="true">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-7/igt@kms_content_protection@type1.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341" moz-do-not-send="true">Intel XE#2341</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321" moz-do-not-send="true">Intel XE#2321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950" moz-do-not-send="true">Intel XE#4950</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-rapid-movement-64x21:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@kms_cursor_crc@cursor-rapid-movement-64x21.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320" moz-do-not-send="true">Intel XE#2320</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_cursor_crc@cursor-rapid-movement-64x21.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950" moz-do-not-send="true">Intel XE#4950</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-sliding-32x10:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@kms_cursor_crc@cursor-sliding-32x10.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950" moz-do-not-send="true">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-7/igt@kms_cursor_crc@cursor-sliding-32x10.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320" moz-do-not-send="true">Intel XE#2320</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@kms_cursor_crc@cursor-sliding-512x512.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950" moz-do-not-send="true">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-1/igt@kms_cursor_crc@cursor-sliding-512x512.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321" moz-do-not-send="true">Intel XE#2321</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-8/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508" moz-do-not-send="true">Intel XE#1508</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947" moz-do-not-send="true">Intel XE#4947</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dp_link_training@non-uhbr-mst:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@kms_dp_link_training@non-uhbr-mst.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354" moz-do-not-send="true">Intel XE#4354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_dp_link_training@non-uhbr-mst.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947" moz-do-not-send="true">Intel XE#4947</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dp_link_training@uhbr-sst:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@kms_dp_link_training@uhbr-sst.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947" moz-do-not-send="true">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-7/igt@kms_dp_link_training@uhbr-sst.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354" moz-do-not-send="true">Intel XE#4354</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dsc@dsc-with-output-formats:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@kms_dsc@dsc-with-output-formats.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947" moz-do-not-send="true">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-1/igt@kms_dsc@dsc-with-output-formats.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244" moz-do-not-send="true">Intel XE#2244</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_feature_discovery@display-4x:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@kms_feature_discovery@display-4x.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950" moz-do-not-send="true">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-1/igt@kms_feature_discovery@display-4x.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138" moz-do-not-send="true">Intel XE#1138</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_feature_discovery@psr2:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@kms_feature_discovery@psr2.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374" moz-do-not-send="true">Intel XE#2374</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_feature_discovery@psr2.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950" moz-do-not-send="true">Intel XE#4950</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293" moz-do-not-send="true">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380" moz-do-not-send="true">Intel XE#2380</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947" moz-do-not-send="true">Intel XE#4947</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947" moz-do-not-send="true">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293" moz-do-not-send="true">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380" moz-do-not-send="true">Intel XE#2380</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-pgflip-blt:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-pgflip-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947" moz-do-not-send="true">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-pgflip-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311" moz-do-not-send="true">Intel XE#2311</a>) +13 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312" moz-do-not-send="true">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311" moz-do-not-send="true">Intel XE#2311</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311" moz-do-not-send="true">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312" moz-do-not-send="true">Intel XE#2312</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311" moz-do-not-send="true">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947" moz-do-not-send="true">Intel XE#4947</a>) +22 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947" moz-do-not-send="true">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390" moz-do-not-send="true">Intel XE#5390</a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-rte:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-rte.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947" moz-do-not-send="true">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-rte.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5427" moz-do-not-send="true">Intel XE#5427</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312" moz-do-not-send="true">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390" moz-do-not-send="true">Intel XE#5390</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390" moz-do-not-send="true">Intel XE#5390</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947" moz-do-not-send="true">Intel XE#4947</a>) +10 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390" moz-do-not-send="true">Intel XE#5390</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312" moz-do-not-send="true">Intel XE#2312</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313" moz-do-not-send="true">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947" moz-do-not-send="true">Intel XE#4947</a>) +24 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313" moz-do-not-send="true">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312" moz-do-not-send="true">Intel XE#2312</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312" moz-do-not-send="true">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313" moz-do-not-send="true">Intel XE#2313</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@pipe-fbc-rte:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947" moz-do-not-send="true">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-1/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5672" moz-do-not-send="true">Intel XE#5672</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947" moz-do-not-send="true">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313" moz-do-not-send="true">Intel XE#2313</a>) +18 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947" moz-do-not-send="true">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-1/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934" moz-do-not-send="true">Intel XE#2934</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-8/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4090" moz-do-not-send="true">Intel XE#4090</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947" moz-do-not-send="true">Intel XE#4947</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950" moz-do-not-send="true">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-7/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2501" moz-do-not-send="true">Intel XE#2501</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pipe_stress@stress-xrgb8888-ytiled:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-8/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4329" moz-do-not-send="true">Intel XE#4329</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947" moz-do-not-send="true">Intel XE#4947</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_lowres@tiling-y:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@kms_plane_lowres@tiling-y.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950" moz-do-not-send="true">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-1/igt@kms_plane_lowres@tiling-y.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393" moz-do-not-send="true">Intel XE#2393</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_multiple@tiling-y:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@kms_plane_multiple@tiling-y.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020" moz-do-not-send="true">Intel XE#5020</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_plane_multiple@tiling-y.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950" moz-do-not-send="true">Intel XE#4950</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950" moz-do-not-send="true">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763" moz-do-not-send="true">Intel XE#2763</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_backlight@fade:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-8/igt@kms_pm_backlight@fade.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870" moz-do-not-send="true">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_pm_backlight@fade.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947" moz-do-not-send="true">Intel XE#4947</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@kms_pm_dc@dc3co-vpb-simulation.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2391" moz-do-not-send="true">Intel XE#2391</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_pm_dc@dc3co-vpb-simulation.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947" moz-do-not-send="true">Intel XE#4947</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@dc6-psr:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@kms_pm_dc@dc6-psr.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392" moz-do-not-send="true">Intel XE#2392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_pm_dc@dc6-psr.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947" moz-do-not-send="true">Intel XE#4947</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947" moz-do-not-send="true">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-7/igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489" moz-do-not-send="true">Intel XE#1489</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-8/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489" moz-do-not-send="true">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947" moz-do-not-send="true">Intel XE#4947</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_su@page_flip-nv12:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@kms_psr2_su@page_flip-nv12.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947" moz-do-not-send="true">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-7/igt@kms_psr2_su@page_flip-nv12.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387" moz-do-not-send="true">Intel XE#2387</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_su@page_flip-p010:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@kms_psr2_su@page_flip-p010.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387" moz-do-not-send="true">Intel XE#2387</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_psr2_su@page_flip-p010.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947" moz-do-not-send="true">Intel XE#4947</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr-primary-page-flip:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-8/igt@kms_psr@psr-primary-page-flip.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234" moz-do-not-send="true">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850" moz-do-not-send="true">Intel XE#2850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_psr@psr-primary-page-flip.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947" moz-do-not-send="true">Intel XE#4947</a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr2-primary-render:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@kms_psr@psr2-primary-render.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234" moz-do-not-send="true">Intel XE#2234</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_psr@psr2-primary-render.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947" moz-do-not-send="true">Intel XE#4947</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr2-sprite-blt:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@kms_psr@psr2-sprite-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947" moz-do-not-send="true">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-7/igt@kms_psr@psr2-sprite-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234" moz-do-not-send="true">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850" moz-do-not-send="true">Intel XE#2850</a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-rotation-90:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@kms_rotation_crc@primary-rotation-90.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414" moz-do-not-send="true">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904" moz-do-not-send="true">Intel XE#3904</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_rotation_crc@primary-rotation-90.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950" moz-do-not-send="true">Intel XE#4950</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-8/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330" moz-do-not-send="true">Intel XE#2330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950" moz-do-not-send="true">Intel XE#4950</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950" moz-do-not-send="true">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414" moz-do-not-send="true">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904" moz-do-not-send="true">Intel XE#3904</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_scaling_modes@scaling-mode-full:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@kms_scaling_modes@scaling-mode-full.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413" moz-do-not-send="true">Intel XE#2413</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_scaling_modes@scaling-mode-full.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950" moz-do-not-send="true">Intel XE#4950</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_tiled_display@basic-test-pattern:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950" moz-do-not-send="true">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729" moz-do-not-send="true">Intel XE#1729</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362" moz-do-not-send="true">Intel XE#362</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500" moz-do-not-send="true">Intel XE#1500</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@seamless-rr-switch-virtual:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@kms_vrr@seamless-rr-switch-virtual.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950" moz-do-not-send="true">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-7/igt@kms_vrr@seamless-rr-switch-virtual.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499" moz-do-not-send="true">Intel XE#1499</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950" moz-do-not-send="true">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-1/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091" moz-do-not-send="true">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849" moz-do-not-send="true">Intel XE#2849</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eudebug@basic-vm-access-faultable:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-8/igt@xe_eudebug@basic-vm-access-faultable.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837" moz-do-not-send="true">Intel XE#4837</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@xe_eudebug@basic-vm-access-faultable.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945" moz-do-not-send="true">Intel XE#4945</a>) +9 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eudebug@basic-vm-bind-metadata-discovery:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945" moz-do-not-send="true">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-7/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837" moz-do-not-send="true">Intel XE#4837</a>) +9 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eudebug_sriov@deny-eudebug:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-8/igt@xe_eudebug_sriov@deny-eudebug.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518" moz-do-not-send="true">Intel XE#4518</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@xe_eudebug_sriov@deny-eudebug.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945" moz-do-not-send="true">Intel XE#4945</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322" moz-do-not-send="true">Intel XE#2322</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945" moz-do-not-send="true">Intel XE#4945</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945" moz-do-not-send="true">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-7/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322" moz-do-not-send="true">Intel XE#2322</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_reset@parallel-gt-reset:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@xe_exec_reset@parallel-gt-reset.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945" moz-do-not-send="true">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-4/igt@xe_exec_reset@parallel-gt-reset.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876" moz-do-not-send="true">Intel XE#3876</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_system_allocator@once-mmap-huge-nomemset:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@xe_exec_system_allocator@once-mmap-huge-nomemset.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945" moz-do-not-send="true">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-7/igt@xe_exec_system_allocator@once-mmap-huge-nomemset.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943" moz-do-not-send="true">Intel XE#4943</a>) +16 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-huge-nomemset:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-huge-nomemset.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943" moz-do-not-send="true">Intel XE#4943</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-huge-nomemset.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945" moz-do-not-send="true">Intel XE#4945</a>) +12 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945" moz-do-not-send="true">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-1/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html" moz-do-not-send="true">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4917" moz-do-not-send="true">Intel XE#4917</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466" moz-do-not-send="true">Intel XE#5466</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5530" moz-do-not-send="true">Intel XE#5530</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html" moz-do-not-send="true">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5530" moz-do-not-send="true">Intel XE#5530</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945" moz-do-not-send="true">Intel XE#4945</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_media_fill@media-fill:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@xe_media_fill@media-fill.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945" moz-do-not-send="true">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-4/igt@xe_media_fill@media-fill.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2459" moz-do-not-send="true">Intel XE#2459</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2596" moz-do-not-send="true">Intel XE#2596</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pat@pat-index-xelp:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@xe_pat@pat-index-xelp.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945" moz-do-not-send="true">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-1/igt@xe_pat@pat-index-xelp.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245" moz-do-not-send="true">Intel XE#2245</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@d3cold-basic:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@xe_pm@d3cold-basic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945" moz-do-not-send="true">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-4/igt@xe_pm@d3cold-basic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284" moz-do-not-send="true">Intel XE#2284</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@d3cold-i2c:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@xe_pm@d3cold-i2c.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694" moz-do-not-send="true">Intel XE#5694</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@xe_pm@d3cold-i2c.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945" moz-do-not-send="true">Intel XE#4945</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@xe_pm@s2idle-d3cold-basic-exec.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284" moz-do-not-send="true">Intel XE#2284</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@xe_pm@s2idle-d3cold-basic-exec.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945" moz-do-not-send="true">Intel XE#4945</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pmu@fn-engine-activity-sched-if-idle:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@xe_pmu@fn-engine-activity-sched-if-idle.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945" moz-do-not-send="true">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-7/igt@xe_pmu@fn-engine-activity-sched-if-idle.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650" moz-do-not-send="true">Intel XE#4650</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945" moz-do-not-send="true">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-7/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733" moz-do-not-send="true">Intel XE#4733</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pxp@pxp-stale-bo-exec-post-suspend:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-8/igt@xe_pxp@pxp-stale-bo-exec-post-suspend.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733" moz-do-not-send="true">Intel XE#4733</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@xe_pxp@pxp-stale-bo-exec-post-suspend.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945" moz-do-not-send="true">Intel XE#4945</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_query@multigpu-query-config:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@xe_query@multigpu-query-config.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944" moz-do-not-send="true">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@xe_query@multigpu-query-config.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945" moz-do-not-send="true">Intel XE#4945</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_query@multigpu-query-invalid-extension:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@xe_query@multigpu-query-invalid-extension.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945" moz-do-not-send="true">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-4/igt@xe_query@multigpu-query-invalid-extension.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944" moz-do-not-send="true">Intel XE#944</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_sriov_auto_provisioning@exclusive-ranges:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-8/igt@xe_sriov_auto_provisioning@exclusive-ranges.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130" moz-do-not-send="true">Intel XE#4130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@xe_sriov_auto_provisioning@exclusive-ranges.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945" moz-do-not-send="true">Intel XE#4945</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_sriov_scheduling@equal-throughput:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@xe_sriov_scheduling@equal-throughput.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4351" moz-do-not-send="true">Intel XE#4351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@xe_sriov_scheduling@equal-throughput.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945" moz-do-not-send="true">Intel XE#4945</a>)</li>
          </ul>
        </li>
      </ul>
      <p>{name}: This element is suppressed. This means it is ignored
        when computing<br>
        the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
      <h2>Build changes</h2>
      <ul>
        <li>Linux: xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a
          -&gt; xe-pw-148982v10</li>
      </ul>
      <p>IGT_8482: 8482<br>
        xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a:
        acb5c859a41719652f1807b30240ca4ee82a473a<br>
        xe-pw-148982v10: 148982v10</p>
    </blockquote>
  </body>
</html>

--------------23tieGZa7lCtTnyplB5DJb09--

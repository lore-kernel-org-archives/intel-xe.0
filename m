Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B408BC54F51
	for <intel-xe@archiver.kernel.org>; Wed, 29 Jul 2026 13:32:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6347410EC40;
	Wed, 29 Jul 2026 13:32:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dkl3TEaa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9EF410EC40
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Jul 2026 13:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785331968; x=1816867968;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=bhktsKkvHNkfe0fWgsDxRoowHRYM1EO5xzVmjPcQTuY=;
 b=dkl3TEaaDM6NPsDparmoBb39QHUh2+JOpYwiiTxqw1yw0ZT4PydAxVHm
 KVUmxc48Vs97jg8pjzmGUscqoTwCk/vnV/wqrpp91LOCAw/286W9M7Qqy
 ZTOIHf2hBUp0iB5J3pQkWk+JIXiXgBVPlODmb7AVa3/vxofG9VsoLfjXL
 YB0iAARzA9tI6QOpVYzusb0oUKyDZjBHlrVB/dqOSNXkFOd+PoK77MRN9
 H2PMBi1ZmL2Lj+6Jtx3o58MaX2RX9+8LPQj2EAgH1XH73DUdDqXZM+Z+0
 alA9GQ5U90bPpxKUIpGSm7o5whNyRS2Og6jtr6n32lQI0JU0qI3Kqgmri w==;
X-CSE-ConnectionGUID: Ttb+w2skTY6dn5+ldISfFA==
X-CSE-MsgGUID: +CtnVw8lTGaqem0n3ywwUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="85953439"
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="85953439"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 06:32:47 -0700
X-CSE-ConnectionGUID: hPWXeQtfSCqSnx71yTkRiw==
X-CSE-MsgGUID: Y/AyWc03TVSEExXaFjYWrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="258771064"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 06:32:48 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 29 Jul 2026 06:32:46 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 29 Jul 2026 06:32:46 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.0) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 29 Jul 2026 06:32:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YSv8DP9Dyr2OhJkfnjHLOIKH9UTSBafWxXYIkvG/LrUVhKgIYAYpy/9mbrcTcbIZCvev/2LuKOdl+Slvjb3syiyO7zeswnFAN2zFD0le5U4GaGXE/5lZn5L3jP87Qr1YtbQpdbYPNRkKy7B0H60Wt0MpqIlVNHhuudgqWb55ucv0uIrQ8aJyVm7jD7avCv75b68EAK/+NgB6ry0iIu86ShjIRXNWDGHJcBM/WdjXio73MHyrFIdYdmFoKSbUmh60Zz/xKLU0kJSAZBtBPEvvJMReax0BeVWqOrlMZUDe5dMvC2UsT7ZSAI6t/STgH+04sKtX3+8hUfVVbS0lITp1xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9nr7pV+L4Ly8b1SHmkzmRTmcrsKTFXwdj0Bxs1Kjn7g=;
 b=yavJ+oOv6MbCcs9k3ryVF7IwOZ9VYEHmAHi883339leYBAci+BtGQtbnaXIcla85o6/TlmU677+GlSJkjbJyH37TeFUuGSBk0cj+ZIjc/uK4Rl3Dqz6G8A59JrL3eZk7OmRoJUoi+Spa0s7+plPuGu8i6M63Lv+0xz2xjWriYRcbkFXPA484pQVw+Kk4C5tZ/IHMuVdqKQHEThjgqiSsgKMwb3McmcyJmiz/JX5QcV8QOJiczladg8G3vcVcgqy0JxjyDiWVh/fZ65ItOBv48FFEfSfY7xKIqKnglIolPGNUKX6YQ6npqNBxtwC5+HEF53WS+EdGrfJ1cQmA9AVcPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by SA1PR11MB6711.namprd11.prod.outlook.com (2603:10b6:806:25b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 13:32:37 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0270.009; Wed, 29 Jul 2026
 13:32:37 +0000
Message-ID: <0a665be1-15b1-42c2-b1f7-d5d8db12c937@intel.com>
Date: Wed, 29 Jul 2026 15:32:33 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/22] drm/xe/log: Add SIGID log helpers for components
To: Jani Nikula <jani.nikula@linux.intel.com>, <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Aravind Iddamsetty
 <aravind.iddamsetty@intel.com>, Mallesh Koujalagi
 <mallesh.koujalagi@intel.com>
References: <20260728161039.579-1-michal.wajdeczko@intel.com>
 <20260728161039.579-9-michal.wajdeczko@intel.com>
 <62dadb83a10fe3c30db950a60e968582ed54a304@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <62dadb83a10fe3c30db950a60e968582ed54a304@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P189CA0013.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d7::16) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|SA1PR11MB6711:EE_
X-MS-Office365-Filtering-Correlation-Id: 993b7e45-d7d9-49fb-6ec6-08deed75dadd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|4143699003|10067099003|6133799003|11063799006|56012099006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: pBMgVr0amWG8ZZ3PpU0AvIMXtM33S/y+jbRoaC2iAsd2qXnnyZeKymhQKn6dOYUvlmdSNgF3jX6wxtjUGxqaQ/0k1uNapHF/psfbwqVU38gPhGQNxY7B+efO7CXaq8cd8Da3N/mGsIZ+dOkp9o8piinQEVlEyKVk7J8xsfr5QLkujIdnAeBnj8yQDGZ+yBOMYEVhhWliNrO/RAoJFIDOAuCL4giHerwTY8WpzHkEOwYlQ0oh/ZjExKcYKLzQuBy70OZ4c7wZO8rqR6o3IdBXdadyrPbMiEbDbIJaMwvqWK0yfFRhesd0vEDnnyrr4bQRkF3g3t76WeAQpYr74WAOk1vu+U+J7j7DvkHwfqsFAOrWtV4NqmH1vIO701qH7YOyCf1aurSqN1D99CG8TQ6IRWHK2zQlFkyEY4XSjgPbF0ASu5c7yKankryr/O2yqoW04dfMiNpwGGWlG8Vs2bKKneB5jlLxvy7JJAYstKVLYzXEcp89HTx531RwASdZq+t//lthVx+o1vOFO+HWobtNHiQDJBAb8gvEMfMWP9Q+cU1xJmEakh7Nb4pgFcfTa3KwT8l1tlh7tnsWKyq2Q1IheC/jm8HUnrRz6JeaeYnysIkuzU1ntTo726q20utUED8SHuDF2j215i7wPD2dJxi4ffAPL1h41TWb+1G9HPAEADY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(4143699003)(10067099003)(6133799003)(11063799006)(56012099006)(22082099003)(18002099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VmpheDFicmY5ZnJDajY1TDJDaGtzSTZPVnZzUDFRWHBUUlU0Uy9LaGVYMjVB?=
 =?utf-8?B?WXg5MUI3UnEwdzhiM2p6MUJIOUZQYW1WMklEZERLNVJoZ0t6dUd1NTg5SjF0?=
 =?utf-8?B?ZzlwcHBuSFZGVUNoZGh2S3diTVFGcnpIaEdQb3krblQ4WGpyeE56UUZIbWhO?=
 =?utf-8?B?ZnM5Ky85d1d1QmlwVlZyMGczQWJ1SWpCeDZjNm5NQjJOMlBTY0dCWE9kMVBX?=
 =?utf-8?B?bUpVbTVGc29FcFBqMWNrSzgxZ2lPY2tpWWV5eXFML2FPelRYdmJWMmdmNTNY?=
 =?utf-8?B?b3gxdFl6M0xMbzNmbHpVdCtmRW1PQWZFQXpyUGpFb1E4NzNCVmVYdHRqRG9q?=
 =?utf-8?B?VXREN0djSHQxYklhWEZSMmRUVkgvbVREb0JuS29zbC84a1hXYUJSbzU3RU9x?=
 =?utf-8?B?SjEwbDk4N1ZWbk9XenZjWkpLcWYxbDFHQ2NHL1cra3lzbEp6UzFXRy8wWmQ2?=
 =?utf-8?B?Si9Pckt2T1lia29zaTNXVi9kcW43Rm0vS3VlenVCdm1BYVpPZENscTA2SXg0?=
 =?utf-8?B?MnVhWnRaSzZKdTkyNWR3b2k5azRuRGRSYnZybzlYeWltRVhZRHJEN0V5RjlD?=
 =?utf-8?B?UTlOakk4aG96SGRpQ09IUkV3V3FjMmQ4WkNlQmR6RlVXaytDdFFsd0hTWC80?=
 =?utf-8?B?S3RRVmczWUNFTUorWUhaVGljQmhhQjdGZWRXY3VrZzJGaitUZ0hpSGY4MDZy?=
 =?utf-8?B?YnRqUmR3QkJ6Zk40eDBKejdFRjdabWdJRTNCclZSYU5BQzJiVm5YVkd0OEcr?=
 =?utf-8?B?QWdBR2J2Mlc4OHIwTGNoR3lxMi9RcVo2WllwcUhTMDI2SWtVYnVTWExJMTZm?=
 =?utf-8?B?REQwZVV0RXVmQXRmQmQ5V0hpWVFJYWxsemRoYzB1dUJva2NqY1VJamR0VkJ5?=
 =?utf-8?B?bUp6L056UGZQUlJiUGRRMmE4c0ZMeHdKaTdFVzl0VTZQTzYwNGlmVmVqZ1Fy?=
 =?utf-8?B?bzZhWjZod2JmMkl3eWhxZFZVUm1IRU1QcWoxTGhZRmFLZTZHU2pJZzZ3OFJw?=
 =?utf-8?B?NjRKWVpmdzl6RnViazFvekNpU25hRm41dy9uNkRsWWpIWDZUQU1ybVo2NmQz?=
 =?utf-8?B?WjJaaGhzNFZ1SERwd202VGh1SUVaWTVIZWlOVGlYVlcxYmhoamYzbzRiRSti?=
 =?utf-8?B?cDZuYnpmcTIwcUpEL2dYOE5yU2tvK0hxck1zdFNxcUdmQVpiZWxXcDFRUklL?=
 =?utf-8?B?U0RoNEgxbG5UL0JJWlVQMHFJZDRJby8vUnlBbnpESTROK2ZINHNrc1Nka0x4?=
 =?utf-8?B?RnlMdzNFb3gyNjVHM05ualJ3bG1HUzQzbURnOE1qVER3VGFQMXlDRWdsM25I?=
 =?utf-8?B?Wlh6bGhieXRJZ1hYbnpEOFEzYzFEN3BsQkVoWlBxaG84cTNmQmxsdHpMdEEw?=
 =?utf-8?B?Q2p4RGVrdW1Dc1RWMEFId0VMMnFoOXBwRXBaLzB5RHVqZUw3N0MraDltUGhD?=
 =?utf-8?B?M2JsWGN6RHRSTnFhcWVXQVlOdkZ4cmxNMUdnVEk3WmVIYldaK01PZ0RrNWF5?=
 =?utf-8?B?aFZCQzcveXRPNy9ENHFHQWUrM1pSTUk5U1NaUURqTmlpRmwzOTFSaDloYWd1?=
 =?utf-8?B?RHEvaTd0M2dtSlF0RTZYdVN5TFNVMHFzRVpEZzBVU293Z3pxVXNQd0QrWUxD?=
 =?utf-8?B?TllQeTliSzZNaFphQWZuaUQ2SVVMb2x4OXJPQWpkbHRQbnhJVXRuY091eUhS?=
 =?utf-8?B?clZGcUZ5Tk0yS0lFbGhkeG9oRlV6UW43MjBibE4vWlJNNWozUEpoam9Ib1Y4?=
 =?utf-8?B?NmQzMW5STzRkVXNxU05kdTlyUTlNbFhTWVdGZ1ZpQ25jYmZzTmdLMkJvbHRB?=
 =?utf-8?B?Q1V5bGtxOWRFTStGSU1QckZkMUZ0aFliVzNPT3ZEclBiTGc4SWQvN3lENUpU?=
 =?utf-8?B?UnhzTmQyeVVuelZ0VW5nSUhLTnpLNy9NUjhETEZ3K2VMWEhQOEdxTW5TSFdh?=
 =?utf-8?B?ODROK3FSNTJXUm5jV3NFT0hpeXViTnRxbDEwSjgvQ2ZYaGVHeU1KME14MXdI?=
 =?utf-8?B?S2J4TjFHV2g1WGlYb3dRd20vbVFJbUpONkgrVXE3UmVrQjF5ZHlkQ0dNc21L?=
 =?utf-8?B?L3RKbUdSZEhsOG1nODduNXhCdzhmb2pwTzFDemVDUVpYaURxelhNZWlUNG9F?=
 =?utf-8?B?YUxNelNQT0FHOUpmcENmK0ROQ3V0TXFia1NodEtobTFNbHRINmI4eTc1QjJs?=
 =?utf-8?B?OEJ5aGk1OUcvc21uLy85Z3dGYzJhQkxodlBKeWFkTkQ5byt1dWdvVGNOWjhu?=
 =?utf-8?B?RzU0RitHR3hKdUNYVTR2REZMZjE3dWxTN3lMR3FjdkZnMllLOVc4V2tzSGhS?=
 =?utf-8?B?NS92bm8rQmpDV0hURWFuSUc1OGpLQ3M2aERuUEV2L3BTRmRUV0NiTFhPbVBF?=
 =?utf-8?Q?C3ItOKQ0pgdaImKQ=3D?=
X-Exchange-RoutingPolicyChecked: X9gJrNtmuaO9PUF57nXioQgQKsJxpc6zXC5J1Duv7gGkwId1Dz1cMKnfmj2zp3KpLw4VqZ/JvkdJgumghMcyiWojPTjSXS+EdIBdu/GFRlX79x9l2aDFTpddcOnNlUg6QqHKRGFWv1qIqQjtrJTMLKrJLlcWTAQenKlA+nSYpci2eMCxFlMfRRtIol9Kgzpy4txu8kP3xazQcUpyu2Kq4XLwDv7I+p+6+zIeJlC1QCk1Jup8ft23/Ark8a665eNT9GT9m34nFkQiCfIev4QN3S7/46kTo/8L7MVdPVM1PFp70EO5s/QPh9ZvsqWxaBFC3/gdhK7UzMJuDSo1/0osmw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 993b7e45-d7d9-49fb-6ec6-08deed75dadd
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 13:32:37.3351 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hzdCXvN2aypREBi6U2x6ltjSWWL+PbLOv671ggUUOi8SLvXFdPgO5NkbCDsTocFOOnlyZrnTjIHKNJGvRRaqQf1+PjfqwH2Av7OB10QkB2g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6711
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



On 7/29/2026 10:06 AM, Jani Nikula wrote:
> On Tue, 28 Jul 2026, Michal Wajdeczko <michal.wajdeczko@intel.com> wrote:
>> Our component list already defines relation between the component
>> name, identified by the TAG, and its numerical identifier and the
>> assigned SIGID. We can also already prepare location identifier
>> based on the pointer type used to emit the log entry. Add helper
>> that will prepare SIGID, COMPONENT and LOCATION parameters for
>> xe_log_emit() using provided componentn TAG and the pointer.
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> ---
>> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>> Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>> ---
>> v2: rebased/simplified (Michal)
>> ---
>>  drivers/gpu/drm/xe/xe_log.h | 18 ++++++++++++++++++
>>  1 file changed, 18 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_log.h b/drivers/gpu/drm/xe/xe_log.h
>> index 43deaf93ce3e..b0f50aa35a96 100644
>> --- a/drivers/gpu/drm/xe/xe_log.h
>> +++ b/drivers/gpu/drm/xe/xe_log.h
>> @@ -85,4 +85,22 @@ void xe_log_emit(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
>>  	xe_log_from((any), CPER_SEV_INFORMATIONAL, (sig), (comp), (loc), \
>>  		    (data), (len), fmt, ##args)
>>  
>> +/**
>> + * xe_log_comp() - Emit a structured SIGID log entry on the component behalf.
>> + * @any: the &xe_device or &xe_tile or &xe_gt pointer this report relates to
>> + * @cper_sev: CPER severity (CPER_SEV_FATAL, CPER_SEV_RECOVERABLE, ...)
>> + * @TAG: the component tag to use
>> + * @data: pointer to the additional details, or ERR_PTR, or NULL if not applicable
>> + * @len: length of the @data in bytes, or 0 if not applicable
>> + * @fmt: printf-style free text format string (not a stable interface)
>> + * @args: arguments for the @fmt format string
>> + *
>> + * The SIGID will be determined from the component's @TAG.
>> + * The component identifier will be determined from the component's @TAG.
>> + * The location used to emit SIGID entry will be based on the @any pointer type.
>> + */
>> +#define xe_log_comp(any, cper_sev, TAG, data, len, fmt, args...) \
>> +	xe_log_from((any), (cper_sev), (int)XE_LOG_COMPONENT_##TAG##_SIGID, \
>> +		    XE_LOG_COMPONENT_##TAG, (data), (len), fmt, ##args)
> 
> I understand you want to use a short TAG at call sites, but the string
> concatenation means cscope/global can't find any of them, and you have
> to resort to git grep.

but there should be no need to look for full enum names, as those are
only needed for internal use by the macros. And "grep -w TAG" shall
point you to the component definitions in xe_log_abi.h (PATCH 3/22)

> 
> BR,
> Jani.
> 
>> +
>>  #endif
> 


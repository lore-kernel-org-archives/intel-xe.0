Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3235BC53219
	for <intel-xe@archiver.kernel.org>; Wed, 29 Jul 2026 15:29:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD10E10ECA1;
	Wed, 29 Jul 2026 15:29:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PMTPkDVR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CF7B10ECA0;
 Wed, 29 Jul 2026 15:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785338965; x=1816874965;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=SY4I/fQoV0TWeW2P5QMJ5TJSyMI1aBSH8zEA4jv+xwE=;
 b=PMTPkDVRLET81Z7BIL5VqYSazIPkfa3UmPHy3BX+/0Vx3ZemySCDjr8K
 wc3nGMhNY9w+IcdDrtxayVDhCT73lS8oPg+4Y//pbY8OtHwBXYWdiMVMG
 4HckBqTB4O8Wh7C1wMJCse44oj0V5IyTxq4JrVUPIgEJm0T4daao8yc0x
 yZ5bkMN9I6X1t9GJq9GQx4Zq6QKPBLss7npRtBNo+Hcg9Czs31Y+rMSkB
 2OotDdnaLOU634AN9T4+1QThdl7K4qJQ0Z2HKLGOvhbzxHBXahUzOP/99
 HJC6DBcLDgHDfSQTs0RYAK9IBWnVZLtZUQ3I1WqGFbj713Y6x5a/gBBo0 g==;
X-CSE-ConnectionGUID: SVeCkNoJS1Wg1TA4+23eDQ==
X-CSE-MsgGUID: lLbJZZZpTt2dsefumDJtbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="85895595"
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="85895595"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 08:29:24 -0700
X-CSE-ConnectionGUID: w33FtFWJQPe8wy3gCo5/GA==
X-CSE-MsgGUID: RloCEghAS06gKkzw3GXrfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="284598713"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 08:29:24 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 29 Jul 2026 08:29:23 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 29 Jul 2026 08:29:23 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.28) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 29 Jul 2026 08:29:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s8b2KKlx+Jc7IwKg6Ib5p1sn/j+tB/WGUnkiJepKv6N7f5Pxe0a2roqklaMK1JZeT0OyvUEcathvamhdpN+s4lETLd5CNNYkz7LfRKIr7y3e1YB7dYISp2jYtTyYKUleTvWkciVFTE8S9n/VGYMT69tTMwc2i5mWDhN/xSC8RrAZrHplvPdByAwqDMw3oNc+93ePinv4nLBAy8F/5g9VovCzBjE471MfR8iGADrb9kNskbs7bOordC8VE9M6yyvGOaDw7WWd6wvybeVlcclX226PFcxzC1gxWqX3w8cE6CoXyriAfvl3bYHwX59NAef9dA1ACm2+ztBq9n8SvciIQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ehnttoqAFeR1qeHaZBtxuuskN4GQPzj9Iq7ij5kMmOk=;
 b=e70+fWDK0k1ZLHSYCEL4v1OA20NYxE5XLAirX7/zsgkfc2t0xcwLeayoaYgF9F7OiyOmjGriJl5ehwWmJE14j1d5SzY6gWnrivKEvmHAAgTgQbwLNxlILho3+CKJB89ICu6yrJD/azF0xK8HZ5MAOo8eCuaMr8vHMw02/o+13/DYgNk9lJop63aRKM1SU2zgtHcjgyCj+qKxfdeB0ohGV83BdTPJx37PVmaqkGW3ev0swuKj5MRhxQ7RqU0451IIl9AFbFm1BK54uJa7E+VGho+xnV60GsgWdmFGUhxLNoUkmoqsFRj2AGYhdMAL7c8VHxYjROQLTrFKvR33HIIABQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7636.namprd11.prod.outlook.com (2603:10b6:510:26f::13)
 by MN2PR11MB4598.namprd11.prod.outlook.com (2603:10b6:208:26f::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.13; Wed, 29 Jul
 2026 15:29:21 +0000
Received: from PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b]) by PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b%5]) with mapi id 15.21.0270.009; Wed, 29 Jul 2026
 15:29:20 +0000
Message-ID: <fcad8db5-2b48-4e2f-b1cb-2b1eba06bb66@intel.com>
Date: Wed, 29 Jul 2026 20:59:12 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] drm/i915/cursor: Handle secondary cursor state
To: Nemesa Garg <nemesa.garg@intel.com>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>
References: <20260706115629.2984258-1-nemesa.garg@intel.com>
 <20260706115629.2984258-4-nemesa.garg@intel.com>
Content-Language: en-GB
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <20260706115629.2984258-4-nemesa.garg@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0297.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:21b::10) To PH0PR11MB7636.namprd11.prod.outlook.com
 (2603:10b6:510:26f::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7636:EE_|MN2PR11MB4598:EE_
X-MS-Office365-Filtering-Correlation-Id: 95bf44f6-c39c-44fd-6c56-08deed862931
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|4143699003|56012099006|5023799004|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: FmcGYHKogbdlzhjUaUA/Uv7SUt6FWWuXdit6lyjs5MfTBDqWkZHbrUz2wPTx6lbQWTBBUEBQt+zpzZtPK18t/p1Y/TsP4vOF8lvQaft6oxqRvbNMuAk2myHmLPz/O41snvvhny3OAUZXgTmayQs2VnxbKDQNIsB0vsqEiRMpfnrU9982OvTnXmq7xxfY9RH5uGpDSxTDV2XsADBRW2Yraxs3hM+mHK8DqIxAUbliubQq+BUK0kgHs3YTeNrN65KAEsCIJYoxAk7XVX6W1k9tenctRhijNX+eM7RNDSkR9OHahyd+8b3anFvbOGf3JZV9gjHg7A7Y7I/t7RWk8bSmmSmApqzdyRAOn3zyXBl1bvI1v4lpuUdyvQJtYJFus4g1vj8G1MyTgiNz+DZLFzySTQ3huHQrsCTVHnGl40p98OKsQ9B/1lkuPzZmM6R6MpRb/Fy7pd9THyEnc/Km6X9hwkSxWw/HSWA12ch+smkgRntX4W0NjwoIfkGlQ4AOzngbnK8xcJ1Z18tBbVrJu0RLEGi2dfATQz44Ry+b9l2xZpDCY4GNGoaKW1m+7oU6b4DaGdvdDytYZUj4Ha6DlMlnFlDHSIQXDZKHGOWdp5XbTyfhQ3c9SwYHu1UhCWuAUfbGwBNnOnr7lX1cjD5286qXpBz+0wBhfsf9ws690cI0RW4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7636.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(4143699003)(56012099006)(5023799004)(11063799006)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dzZzUHA2WWFhTktEL290OU4vbTBoT1U4dmx0YVNPL3NWQkYzY3VBZi9VUnVk?=
 =?utf-8?B?ckNXbG13M1krR0Z4WmpITnozUDJpSU5OZ0J4c0NMWjF0Q2hiR0YxeHp3dmJJ?=
 =?utf-8?B?Z3htblIyK1ZwLzRuV3B2Q2wvU0NZaHVPYnF6U0FoeFdmOHhRRDlxaTNIYTBQ?=
 =?utf-8?B?ek9wR1BmbmJCaEd4WktVdGMrUWkzNFdyaENQdmtGamovTWRCY0lGQ21vWVZH?=
 =?utf-8?B?WjcvZjZFRlVXdGxCQjE1L0RpczJSWVJHQnZNZUVWL1Vya0pyQWlmSzU3aEMv?=
 =?utf-8?B?dkYrN2ZWWkNEV0lrV3A2cGlsTVBoTENRbmJYR0VTemtSVFRHM0xSM2VISzV0?=
 =?utf-8?B?NGx4RGVmeWRueGNBSVI1OWU1KzY4cDNYYXIvb1BTRFhyMWhUZGtmcjdjUm02?=
 =?utf-8?B?WVcycVI1YXAwS3gvL045N0VJTk5KWTBzWUtUZHZ4eU9ENmZBd2x4Y2ZlNVh1?=
 =?utf-8?B?NnpoeTQvS2lMSVVTbUp3QlhRcStxNFJZOTFvU1hDTnVmZXQwZ2hJSUZ1NVll?=
 =?utf-8?B?cGcrcmZjRU9xNktJSUV5eTZLNk5KdG96QVRZczFOYS83MnV3d1JYVm1WOU5N?=
 =?utf-8?B?bTJDUW9IUWJtT2pNaVBXWC92OTlhT1R2cnYxeVovRjExM0hmbjVKaHpoNThM?=
 =?utf-8?B?bnYzQlZaM3EwQ3Y5NWsyd0pFMWtPWXBFT241ck1zaURrT1BtNnpsa2ozL0p4?=
 =?utf-8?B?UEVwODA3TU0zYUlaMloza0JnODRDajI1YmRhenZXSWl0N3BuQmpiOUdLMGQ1?=
 =?utf-8?B?eURGUDZlVm1yUUdFTmxqM1dDb0dpeG1VdjQxQUxJZWIrVUVOOEU3a2RUbFMy?=
 =?utf-8?B?bDdsb1dVbnhDNnhTWWZBQlRyckpPWXh3Nm5kYyt6SElQN3IyZkV5bHhTQk54?=
 =?utf-8?B?N1NDZzIzOXlIZmkrYzF0KzhOeld5VStSN09MU3ZScUplR0xONE5wdTdZYURr?=
 =?utf-8?B?a011YjdvT2pIcFVyTm05V2gwVWpLMU9YYlNtajVXbTFEQ3d6VXFHZG1FazAy?=
 =?utf-8?B?bVh3ZW9MSElHQis3bnBMWERoVjlwU1BHOHNkblZvVkQxRktGdVVMSkhkcWNV?=
 =?utf-8?B?QW5qUVhSNkNtZElIUTJGUUJOYk9RZE50ZTcxNkcyWjVvalJYOEVveHVRQ2Rq?=
 =?utf-8?B?OWN0YjVPQm1GQnhpTGN4cS93VVRqdFMxNzhTcnZTeTU5ZzcvODN0QXloallz?=
 =?utf-8?B?bW9UTnZXZ2QyVitmbVcxSnlIbEtuMjRlY0tyeEdZS2l3SkNNdjd4MEpXV3J3?=
 =?utf-8?B?WVVHenhuWk1vTEJaVjljblFsZGEybTdPdHhqTzdkSDloSDMvMkpUSGt3cW5a?=
 =?utf-8?B?RWxKN3EzRzY0MGtQbi9wR3A1OCtOUXhGN0Y3Nzh4T1Jwb3ZGenpiMXRuYVZ5?=
 =?utf-8?B?YnlpenpIMDI0YUlxeVhPUGFLeS9oRWNyOWozQnlRK21ESTRkeUZRR3NRSXQ0?=
 =?utf-8?B?SmUzNE9aOVpqVFBnbUFKVWl0T09kWkFMSncxbnRjV0xGMFRzUndZcWZtbUNC?=
 =?utf-8?B?Mkh1aVlPRHN3WVl6VVZWZmNiRVdjZmg0NXNyK1VweHpRQ2lrQ001Nnl6ZnRs?=
 =?utf-8?B?VUd6cXpjckJueHArOE5WUFVhQjBLblFuOFdmanBUQ2RaVm1hK3lKQjdGSnJx?=
 =?utf-8?B?aGswZ2JIS2cwMGNLZmpDeTNRZ3h3blVvVGJSb2xJa0dIck1pLzdmNXpPeEd4?=
 =?utf-8?B?dzFnQTE4TUFoTE0zanZ0WmpsV0dxQzZ3K0s1cDYwV1JvU25ldm9JOHBLUVN3?=
 =?utf-8?B?Ky9mb09TOU9SUGJ4WmZ6TnBaKzBCUlNXUG1xbVg3Yjg5dlQxKysxUVJuaWVG?=
 =?utf-8?B?a1NnaEF2ZGdLdjFoMlFtVjFvVnFaZ3VzZDlLZzBpcS95L1JyOUlOUE41eGFT?=
 =?utf-8?B?Nkg4OHpYdmxUWXF5NGc3eC9hQ21mUWVGNkFrWndlM1Y0Zk13NHFBRXNYNDFY?=
 =?utf-8?B?enRWMmdaeDduWWQwaitWU1BIUUxIU3U5eCtFWGZacXZseG1nUzBuT2E5eXIy?=
 =?utf-8?B?RjNtaVI5RUQrcGxzbDlvcXRoaE4vek53TzdjdzBzcXUyc0QrN3lWZGxvSmti?=
 =?utf-8?B?bGxLbTlvaERKbkpoRUM2ZklvNHBVV0JRZ0FQak1IcWZGTmNyR0ZTYmlqZVY4?=
 =?utf-8?B?d2txWjZnYmtqMjJvQU5kdE5zRjhQai9yRzU5eUJDdHFZVG14YXo5L0VZWHF0?=
 =?utf-8?B?b2FZK2xQcG1jT0dpU3JvTzhyTGpWUytLS0R1d3RNRHg3dGdlak9WeW1hMnNn?=
 =?utf-8?B?ME1GekhIbnNYQ2NNSjRtYlBlczJCN3IxdWxaUTVTcGdpa0Z1a2V2UWJ0VEMz?=
 =?utf-8?B?alNhRk5mZDYvQVpwM3RDTkUwdWRoamFZN3RidmtIMm9MUVRrZXlveUs1ODNT?=
 =?utf-8?Q?/S15Q54zn6C6+5fo=3D?=
X-Exchange-RoutingPolicyChecked: r28L01jSasPE5wc9HnRihsu50hVlox7uQdxYM7MmFzJcBM64yAXoH22A1ELw02wwDOzz9g9zWQX/RjCCm9d8HGqCVztQRH05ZC4fV8OLXVPSKLN43prOe3pIvaQzA7Ufe9BGGk1m2sTsW0PufUGA87KwMCmrCPlkZeNz0SoSIZiN7k3xXDvy6h3dMa3VAfxATqgTNT3+D99tL3rdJCILiAS4jfYEqHfnYQJdSC7pwd9+VLj9IygdgHhWqJg9R3iWmGRisRaLrALYEPTkKUwbaTOuGpbXBJbqJVjXOeD8/twoNhXpGq4MeqrCVE8HwTlYv2axQaC4LxXO4WKlDkt+tA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 95bf44f6-c39c-44fd-6c56-08deed862931
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7636.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 15:29:20.9044 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cwMKIfperbBZVfdTrCGoSdwcQtHZPqLvhAjUEMS2ovxpVp53Wsa4MYkyHnkqt+gCk/frJOihsEbHlPW0scMEjYrSqKbgbO3PF60ba8Z++gc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4598
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



On 7/6/2026 5:26 PM, Nemesa Garg wrote:
> In joiner mode the fast path cursor update must handle
> secondary pipes. Iterate over all joined pipes uniformly
> to duplicate plane state, run check_plane(), pin the
> framebuffer and on success swap in the new plane state
> for each secondary cursor.
> 
> Track every successfully prepared pipe in a joined[] array
> of struct intel_cursor_pipe so that later frontbuffer, unpin
> and error-cleanup paths treat primary and secondaries uniformly,
> and ensures the primary's pinned framebuffer is released if a
> secondary fails partway through.
> 
> v2: Use intel_crtc_joined_pipe_mask(). [Ville]
>      Add locking mechanism. [Ville]
> v3: Drop the per-pipe fastpath mutex array. [sashiko]
> v4: Fold parallel arrays into struct intel_cursor_pipe joined[],
>      unify primary/secondary in a single loop, and use bare
>      check_plane(). [Chaitanya]
> 
> Assisted-by: Claude:claude-sonnet-4.6
> Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
> ---
>   drivers/gpu/drm/i915/display/intel_cursor.c | 125 ++++++++++++++------
>   1 file changed, 90 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_cursor.c b/drivers/gpu/drm/i915/display/intel_cursor.c
> index 632f7a0a5a63..fad5d5302b36 100644
> --- a/drivers/gpu/drm/i915/display/intel_cursor.c
> +++ b/drivers/gpu/drm/i915/display/intel_cursor.c
> @@ -864,6 +864,14 @@ intel_cursor_fastpath_update_plane_state(struct intel_plane_state *plane_state,
>   	intel_plane_copy_uapi_to_hw_state(NULL, plane_state, plane_state, hw_crtc);
>   }
>   
> +struct intel_cursor_pipe {
> +	struct intel_plane *plane;
> +	struct intel_crtc *crtc;
> +	struct intel_crtc_state *crtc_state;
> +	struct intel_plane_state *old_plane_state;
> +	struct intel_plane_state *new_plane_state;
> +};
> +

nit: struct intel_cursor_joiner_state

>   static int
>   intel_legacy_cursor_update(struct drm_plane *_plane,
>   			   struct drm_crtc *_crtc,
> @@ -879,11 +887,13 @@ intel_legacy_cursor_update(struct drm_plane *_plane,
>   	struct intel_display *display = to_intel_display(plane);
>   	struct intel_plane_state *old_plane_state =
>   		to_intel_plane_state(plane->base.state);
> -	struct intel_plane_state *new_plane_state;
> +	struct intel_plane_state *new_plane_state = NULL;
>   	struct intel_crtc_state *crtc_state =
>   		to_intel_crtc_state(crtc->base.state);
> -	struct intel_crtc_state *new_crtc_state;
>   	struct intel_vblank_evade_ctx evade;
> +	struct intel_cursor_pipe joined[I915_MAX_PIPES] = {};

nit: joined_pipe_state

> +	struct intel_crtc *pipe_crtc;
> +	int num_pipes = 0;
>   	int ret;
>   
>   	/*
> @@ -929,38 +939,74 @@ intel_legacy_cursor_update(struct drm_plane *_plane,
>   	if (!intel_cursor_joiner_commits_idle(display, crtc_state))
>   		goto slow;
>   
> -	new_plane_state = to_intel_plane_state(intel_plane_duplicate_state(&plane->base));
> -	if (!new_plane_state)
> -		return -ENOMEM;
> +	/*
> +	 * Iterate over all joined pipes (primary and secondary) uniformly.
> +	 * The joined pipe mask includes both the primary pipe and all
> +	 * secondary joiner pipes, allowing us to handle them all the same way.
> +	 */
> +	for_each_intel_crtc_in_pipe_mask(display, pipe_crtc,
> +					 intel_crtc_joined_pipe_mask(crtc_state)) {
> +		struct intel_cursor_pipe *j = &joined[num_pipes];
> +
> +		j->plane = intel_crtc_get_plane(pipe_crtc, PLANE_CURSOR);
> +		j->crtc = pipe_crtc;
> +		j->crtc_state = to_intel_crtc_state(pipe_crtc->base.state);
> +		j->old_plane_state = to_intel_plane_state(j->plane->base.state);
> +		j->new_plane_state =
> +			to_intel_plane_state(intel_plane_duplicate_state(&j->plane->base));
> +
> +		if (!j->new_plane_state) {
> +			ret = -ENOMEM;
> +			goto out_free;
> +		}
> +
> +		/* Joiner secondary: uapi.crtc points at the primary uapi crtc. */
> +		j->new_plane_state->uapi.crtc = &crtc->base;
> +

This copies the secondary pipe's uapi.crtc to the primary's crtc. So the 
first time any atomic commit touches this plane by its own pipe after a 
fast path joiner cursor update, it will still point to the primary's 
crtc and results into a atomic check fail. See plane_switching_crtc().

As far as I see, nothing else in the driver treats a secondary's plane 
state that way.

This should perhaps be

j->new_plane_state->uapi.crtc = &pipe_crtc->base;


> +		intel_cursor_fastpath_update_plane_state(j->new_plane_state, fb,
> +							 pipe_crtc,
> +							 crtc_x, crtc_y,
> +							 crtc_w, crtc_h,
> +							 src_x, src_y,
> +							 src_w, src_h);
> +
> +		ret = j->plane->check_plane(j->crtc_state, j->new_plane_state);
> +		if (ret) {
> +			intel_plane_destroy_state(&j->plane->base,
> +						  &j->new_plane_state->uapi);
> +			goto out_free;
> +		}
> +
> +		ret = intel_plane_pin_fb(j->new_plane_state, j->old_plane_state);
> +		if (ret) {
> +			intel_plane_destroy_state(&j->plane->base,
> +						  &j->new_plane_state->uapi);
> +			goto out_free;
> +		}
>   
> -	new_crtc_state = to_intel_crtc_state(intel_crtc_duplicate_state(&crtc->base));
> -	if (!new_crtc_state) {
> -		ret = -ENOMEM;
> -		goto out_free;
> +		num_pipes++;
>   	}
>   
> -	intel_cursor_fastpath_update_plane_state(new_plane_state, fb,
> -						 crtc,
> -						 crtc_x, crtc_y, crtc_w, crtc_h,
> -						 src_x, src_y, src_w, src_h);
> +	new_plane_state = joined[0].new_plane_state;
> +	intel_frontbuffer_flush(to_intel_frontbuffer(joined[0].new_plane_state->hw.fb),
> +				ORIGIN_CURSOR_UPDATE);
>   
> -	ret = intel_plane_atomic_check_with_state(crtc_state, new_crtc_state,
> -						  old_plane_state, new_plane_state);
> -	if (ret)
> -		goto out_free;
> +	for (int i = 0; i < num_pipes; i++)
> +		intel_frontbuffer_track(to_intel_frontbuffer(joined[i].old_plane_state->hw.fb),
> +					to_intel_frontbuffer(joined[i].new_plane_state->hw.fb),
> +					joined[i].plane->frontbuffer_bit);
>   
> -	ret = intel_plane_pin_fb(new_plane_state, old_plane_state);
> -	if (ret)
> -		goto out_free;
> +	for (int i = 0; i < num_pipes; i++) {
> +		struct intel_crtc_state *cs =
> +			to_intel_crtc_state(joined[i].crtc->base.state);

Isn't this already collected in joined[].crtc_state?

>   
> -	intel_frontbuffer_flush(to_intel_frontbuffer(new_plane_state->hw.fb),
> -				ORIGIN_CURSOR_UPDATE);
> -	intel_frontbuffer_track(to_intel_frontbuffer(old_plane_state->hw.fb),
> -				to_intel_frontbuffer(new_plane_state->hw.fb),
> -				plane->frontbuffer_bit);
> +		joined[i].plane->base.state = &joined[i].new_plane_state->uapi;
>   
> -	/* Swap plane state */
> -	plane->base.state = &new_plane_state->uapi;
> +		if (joined[i].new_plane_state->uapi.visible)
> +			cs->active_planes |= BIT(PLANE_CURSOR);
> +		else
> +			cs->active_planes &= ~BIT(PLANE_CURSOR);
> +	}
>   
>   	/*
>   	 * We cannot swap crtc_state as it may be in use by an atomic commit or
> @@ -972,7 +1018,6 @@ intel_legacy_cursor_update(struct drm_plane *_plane,
>   	 * planes atomically. If the cursor was part of the atomic update then
>   	 * we would have taken the slowpath.
>   	 */
> -	crtc_state->active_planes = new_crtc_state->active_planes;
>   
>   	intel_vblank_evade_init(crtc_state, crtc_state, &evade);
>   
> @@ -1005,6 +1050,10 @@ intel_legacy_cursor_update(struct drm_plane *_plane,
>   
>   	intel_psr_unlock(crtc_state);
>   
> +	/*
> +	 * Schedule or immediately unpin old framebuffers.
> +	 * Protect against concurrent access.
> +	 */
>   	if (old_plane_state->ggtt_vma != new_plane_state->ggtt_vma) {
>   		drm_vblank_work_init(&old_plane_state->unpin_work, &crtc->base,
>   				     intel_cursor_unpin_work);
> @@ -1013,18 +1062,24 @@ intel_legacy_cursor_update(struct drm_plane *_plane,
>   					 drm_crtc_accurate_vblank_count(&crtc->base) + 1,
>   					 false);
>   
> -		old_plane_state = NULL;
> +		joined[0].old_plane_state = NULL;
>   	} else {
>   		intel_plane_unpin_fb(old_plane_state);
>   	}
>   
>   out_free:
> -	if (new_crtc_state)
> -		intel_crtc_destroy_state(&crtc->base, &new_crtc_state->uapi);
> -	if (ret)
> -		intel_plane_destroy_state(&plane->base, &new_plane_state->uapi);
> -	else if (old_plane_state)
> -		intel_plane_destroy_state(&plane->base, &old_plane_state->uapi);
> +	if (ret) {
> +		for (int i = 0; i < num_pipes; i++) {
> +			intel_plane_unpin_fb(joined[i].new_plane_state);
> +			intel_plane_destroy_state(&joined[i].plane->base,
> +						  &joined[i].new_plane_state->uapi);
> +		}
> +	} else {
> +		for (int i = 0; i < num_pipes; i++)
> +			if (joined[i].old_plane_state)
> +				intel_plane_destroy_state(&joined[i].plane->base,
> +							  &joined[i].old_plane_state->uapi);
> +	}
>   	return ret;
>   
>   slow:


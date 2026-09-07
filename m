Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3E60C79FA0
	for <intel-xe@archiver.kernel.org>; Mon,  7 Sep 2026 12:03:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A72C610E7BD;
	Mon,  7 Sep 2026 12:03:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WsLcCdUe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD84710E7C0
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Sep 2026 12:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788782590; x=1820318590;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=BwOcGS+IG/JRHCvi2XP8pXdCkqAE7ov/eJfGx0MuTfg=;
 b=WsLcCdUeoYQJ+rYEBm8m17PXlsXkR/NbniwenKsaOUEX5RtERy3rkPcW
 F+cqkMVbefdX2Rh6IJbgAyTsqz+1oqUck3td7nhUFXLUxdYAhwvHWD7y8
 WM6snmfET/6yOUaRD1n1F9IZa1aFQ5jvwOcPOsjJDrg165UluulZUxe3c
 vIdcZI/H5XAFg0ZiFJuhHWMHduTl5WbVh3jcDQaGSoXSEndcC6DEYVHWa
 ofHeBCwm+ExxR7R3g/A4OsVnK23T/GoYdfFjzKiObCpKIcniX/cRQUCwh
 0i0h10GUygBK2wqbimmeMmkv4iwWkHl6r6tIajfqWDc2BOHgwogjtKNeg g==;
X-CSE-ConnectionGUID: bS/HY5rcTvumhR8dboCzkA==
X-CSE-MsgGUID: qz5rF4uPQv+iR71oTl1vKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="99518437"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="99518437"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 05:03:10 -0700
X-CSE-ConnectionGUID: KvyyF+6PT+etG7d+SwLtHA==
X-CSE-MsgGUID: qPGjIGDQTkewTqjBgrCl+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="264496893"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 05:03:09 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 7 Sep 2026 05:03:08 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 7 Sep 2026 05:03:08 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.30) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 7 Sep 2026 05:03:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DVNhMsItH3AJ9Vqh7sz5mTzqIMQlIPCsGrqM3/qJez+tsyjjEvmX0gc2JzzAnBwvIjGVj15YDwJU4cqnBLOspemDe10bIY5q26bYZq7ZitBxs5/ePwtoiNc8E4hgdAEfjf2vQWXEfejdAISHw4D4csU7k5QNeDhOSYkRp6e3KJhtln6T5FZFnh10Ejt2Jgih/5diKM+Ff0gSehgi+2WBBMt3p4h2wwqKMGm9lapClpa9Ionv7Ng3GdtdjSFRjy+USzQ4qEJb9Uz9mlPUoI8W5a0K7706mbjlFjdZKz9Dui1zayVcvPL+8AdT/ufmWcdah2yW4YQnMLJwtYUJY6/+OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WvdrBIV2soeq3QaiFpgDm43cwExFk7uvryZJbqJh5jI=;
 b=cL/UZ0msR9uef60TSL2H5C9wPfjmNpXT9irfDuhIhD0x0ojEQyz2fOM1uiQEZvAfRnfxyvMcmGccLJwvts9pwgqqf+0MI9+MnVMQPBWv/YjnGwLOZ0LsUXZ/S5ZTd5JdT3oRLYQzg7e0EuZZms6O4vQzlyBrvh9Xn2A8yfgDRXbQVA+OPCf8Z90at8KoBCNCTW1od5t0pyI4eguzSZjoOHvBzk7JHfq1YRr3F5mEA7bqiQ9gLG2bkkqQFG0tdo/jA4XDDpfCru4c8+JQP5q0cCezzMURvHGMotRcDmVqvfhaz4ATgadwQVEQAi8RZCdiiw+MZ9X4JdIHYbLg/au8eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7530.namprd11.prod.outlook.com (2603:10b6:8:146::15)
 by PH3PPF740777B0C.namprd11.prod.outlook.com (2603:10b6:518:1::d2f) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Mon, 7 Sep
 2026 12:03:06 +0000
Received: from DS0PR11MB7530.namprd11.prod.outlook.com
 ([fe80::4957:93c1:7385:6c52]) by DS0PR11MB7530.namprd11.prod.outlook.com
 ([fe80::4957:93c1:7385:6c52%6]) with mapi id 15.21.0382.014; Mon, 7 Sep 2026
 12:03:05 +0000
Message-ID: <c3eb2bd0-119d-4c72-8332-721efb763c19@intel.com>
Date: Mon, 7 Sep 2026 14:02:59 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] drm/xe/gt: Use GT ordered workqueue for wedging
To: Raag Jadav <raag.jadav@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <riana.tauro@intel.com>, <lukasz.laguna@intel.com>,
 <matthew.d.roper@intel.com>, <matthew.brost@intel.com>,
 <rodrigo.vivi@intel.com>
References: <20260907083541.2194747-1-raag.jadav@intel.com>
 <20260907083541.2194747-2-raag.jadav@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260907083541.2194747-2-raag.jadav@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VIUP296CA0084.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:349::18) To DS0PR11MB7530.namprd11.prod.outlook.com
 (2603:10b6:8:146::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7530:EE_|PH3PPF740777B0C:EE_
X-MS-Office365-Filtering-Correlation-Id: be516406-616d-4c8f-cb50-08df0cd7f967
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|6133799003|10067099003|4143699003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: //CSzEXk8GTP22/RHzbOFkmT3Zofffu2gSJKrynNz5cZasWWLvgvpJJ0kZlt/UxyltZH5cmaqXtz7fmQkLKMW4EopLJZ0XBBzFuaGh832bZhRaV/RbUwJPVqxUZ0zwG9uLL9Sx0YfLVAe1IcU2ByAD7C0GO0FpuCfFN1mj9rFTEdToKDCIBooMjyS6wJQM1nhhsSffrSpyrj7Wmtzt0xWC+uzbXq7VvmAL/zWpFRpPNpMSfONqxZRmXfP5p9FOjbT+bYhICnsEuAs7++9rLZDXyBCpGaJyiYk/mDDXGffrAVxwM5slDkLDXY6d0TIf4opNozVIKigzOtOAXs7vhzjFC9c1T3Fz2g9VnQVM+a2XCCTt6+/OCPM8wF4Eh7N2GfLCOvcawyYjYsOUumz0OE3XiR7S5SpjkocGxPCkSAbHcxExySalLSrvJUMgCBJmI+5YGQ6DTJGvr8loXaIy0et4UF7H2txVkouQlWeZc4DCrRqmmw9Qd+bu0hUDvBlUz2nq1TuTa8M/VJvpwFHbh7jHUqkkpvQ7tnbZudSZ15wyJ6v0yA1C0e9VHk+1IyKN9Okh6qJRC66hs8BqsiS53GdSL/oww30PRmo3fyEJ6ocCo4LUEM0soL+RKsukjKEzfRWvnlXb9Rx3k5pGGbtk5pcg/lr3vMcnoLiijQYtNlJD8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(6133799003)(10067099003)(4143699003)(56012099006)(11063799006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U24yNWx1YjRYRkhFTnBvalZsYkdkME9QclhxTnNldUhaZ3RLN1d5Q1RhdE5p?=
 =?utf-8?B?WmpNTDZLK3EwTjdpRVVPQmxpZmdUMVpEUmU5V1QzdzZBRjhuQ08xbVBVWnkz?=
 =?utf-8?B?Sy9VNDlTQzhNYW1OdVRCdDNxY2xtcWxDYXpMYTN3MGV4OHBMZ2JYa3hpOHNr?=
 =?utf-8?B?cU9LakhGVy9yc1M2bGxnYjhNUWMzMXY2c2NBQllWYk0rN3pPcUY3Ni9lOWNP?=
 =?utf-8?B?Qkx3Yk1neGpMR05pMnB3M25kemlmUThCNXJ6TDZVOGptOGdXbFRISFVzL1pi?=
 =?utf-8?B?d2ROQnluN0QvRlZNWU9GcUJjNXp1dlEzVm9saTV2VGxGUnRxUjJKU0RBWG9H?=
 =?utf-8?B?NXl4RGN2UjhxbnNsN0tBSERPbmlFN0lleStMdlE2dUg5ZWJ0VlhuM0xYOUlu?=
 =?utf-8?B?bG45aGtYVHM4MEVIL0t1WHE3VUJJdk1zTy9NL0x5bm14WEh4ay9JY0tkZ243?=
 =?utf-8?B?MmJQTkZuMUFyN3Q3Y0NjUW1UeWhIR3JNUXJKWEZUUDVpaHhTdFBacnlzUjhl?=
 =?utf-8?B?eFg1WEM4QVd1K3RtY2JMeHlLQTdLRzlVZ0V0enc2VTVxT2hrQnZoQlQ1VEcw?=
 =?utf-8?B?aGxqK0FSZWdtQ3p6MEVIS1hDc0haTVR4bHE2T3U1V0ZOaitCZHNWaEdGVk9q?=
 =?utf-8?B?S0pJN1FTTEdIZXExUHplQWRzSEd1c1dzM1pQL1hYMUlOSjFLeFkzTStXV2U5?=
 =?utf-8?B?OC9ScEF5dW0zVU90d0NnZjlDcTQvakNmelBCWXRKTnF3dVV2Q3ovaDU5azdz?=
 =?utf-8?B?OHQ4UzJYK25BejYwRTF1cytjZmFlaEZMWHZ4T3FFRnZhUHVkMmJuTklRMlRB?=
 =?utf-8?B?YnR5bFNScjFUUEZEWWw5VGZ1NHQvd2JLQmE0QjFCRG9pTlRlOVovMVpZOVBm?=
 =?utf-8?B?dlQycDFaNmRvSk5Dc3VyVVdzem56U0Y0UTd2aEZFYlY5N3hPbVhra29KL0po?=
 =?utf-8?B?OFI3WmU3Nm9ab0ljSU4wMm1uM2ZYNElqam0xS2YwSXdHQzRDU1RqcVZlMm1X?=
 =?utf-8?B?QzlnbnRLUW00bTlnNnJ6bE5nTVNhUXc0TTBLeDhnQTBWeWVPcXJ1UE5uRjJh?=
 =?utf-8?B?S1ErcjJ5WndBcmNZUTZsL1RqYXQ0aDRvOEprczB0bkFtdG51K1Z3VStLRWd3?=
 =?utf-8?B?RW1qd1RVdFYwZ3lWZGR3azQreTRiQmh4aTVGYkVmNHZzZVJuWHdrbDY0bTF6?=
 =?utf-8?B?amV2cCtYbTM3aEVZdDFlR0tJajhZb01abVJqZnpGOHdqUE5yVk5IN3NUNldR?=
 =?utf-8?B?Wi9Hc0JuMUJoWEY1c2F1eG9TOEw0TU80MGtnVllBZmVlQ1BkbTBRZVFIN1hh?=
 =?utf-8?B?dVErSHpiR3cwQjR3QzVnNlpqSS9LWW9NT3M1VitGZ1hHSVFEMEZJU3duS0dI?=
 =?utf-8?B?dmhDQ1lvbm9HSGhnS0pOQm9nYzFZVnpxQnppL3hia3AvUlorMFVVVkc1Qnk2?=
 =?utf-8?B?R2Z1cHVoeFVzZkpmY3VRd0E5SllrcFFqQnZhUS80M1pTM0dpaER2Z0ozeGQ0?=
 =?utf-8?B?ZXJiYWQraFA4anJJa2NKN2h1d2pXNFVmYldwYlZmcjFLMk15R2xUSGtKbm50?=
 =?utf-8?B?SXNtaXd4VUVxb3F6dHJtRTcvbkFVazhndEtrQ1Zxc3laT1lHTVZ4R1FSMzRE?=
 =?utf-8?B?Q3UwaXQ0RldWVEtvMjA4WHgvVEVQc3lyYTZ6a0YrT2Q5MXlNS1FmLzQ2dDlK?=
 =?utf-8?B?WVZ3QW1OKzdkbHNZVW9Zb3pBOHNydklDTHlDcmlBWktGWE1WQ202dFpPbVhZ?=
 =?utf-8?B?aFV2ZVFQTWd0NFVYdWRLN2xmV3hBWHJUYmwvalBKYVE2Qmt1ZTYvbFN1M0ZE?=
 =?utf-8?B?bWoxcGdxV29mQVdXZlRlb1NHeUNaWUQzeFhVSzFLZUNUOUxyMWhvenI5U1I1?=
 =?utf-8?B?V2NodWZVYjlsMGUxSFpqZnlwZ1JSV2FFRDdXeGlHcHdFY0lLYzBEY0M5N1R6?=
 =?utf-8?B?Z0x5NFB5Z0ZTSTdiYi8wN2VqSmg5YTBwTTBCajVvQ0FnR0lWUVlIOG02ZGo0?=
 =?utf-8?B?MERpNWYxakpwQ3RvV1MzL3RHVVlBT0szcmxON2xjdlpleld0L1Q0ZkJXbUZn?=
 =?utf-8?B?cm9jdWpacjU5bnM5RmlSK1VYdC9iWFN1QndXeCt2RmVGNVRjY1lrb09BeFB3?=
 =?utf-8?B?R0dydFRsNHorNnR1bVA4Q1hvb0xBcDVpYjZpVjVLdW9TQjJJOHZ4RkFNampt?=
 =?utf-8?B?L3EyeFk0Si9HQ2VHMTZjZXFlOGUzZkIxbzB2cVl1VnkrMFB6VXl5dHQwaGQ2?=
 =?utf-8?B?UytTK3JReER2RUtKOWVTa2taSTUrQ1RoSm9RZ2ZMSzF0Q1VOazdoUVk2TkMr?=
 =?utf-8?B?UnpnWHZtazJBT1I2djJ5Vlp0eFFJYW5mV1VmNTg1OTNTUHJteWovdjhuNDgr?=
 =?utf-8?Q?1JNwHYz2PN7tFMz0=3D?=
X-Exchange-RoutingPolicyChecked: gq+Jn0TA4LZULqC9ZD1/4EyvtO9xMta/xurUKXEqI36cPLP3kMb3Wkd5r2HBx5+C0//EED7QFylkQGvOOlWa8QE4g7hpm1u/8KnaocjCs3LKeos6vGsQ8JeluzVYOk+QnbdblgmNTsLjkJpEuWfnmvvveb4Ek7c/ABvnPRXfU3shj2hD35OWNSALFvGTL6DnKjywgfH4LwX579BL0sU1X5OHcRM+h5TvgLrKq96DefxdK0ISsgXcMU2W4YjYXeH2tA19epVwrHLi5CS2rf/hP+WRQhk/Nry6Bqn0uSHLJwzjFN1gM4bf/Sv/rXtQ541q8EeXW96cwLWdxGq9e29aLg==
X-MS-Exchange-CrossTenant-Network-Message-Id: be516406-616d-4c8f-cb50-08df0cd7f967
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 12:03:05.3533 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qjO4kebqRxE9+KEe2ZGiZwn+f9Uyy9HPa+EkHrwH1UYEeyKM5Q/xq8ox83yBfUHLNicwcRkXMtRYT+JTavOvTzMCSJjGw1evyVwn32GnGTQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF740777B0C
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



On 9/7/2026 10:34 AM, Raag Jadav wrote:
> Currently, xe_gt_declare_wedged() stops GuC CT and initiates exec queue
> teardown synchronously. This can result in tdr timeout in cases where
> the device is declared wedged while jobs are still in-flight.
> 
> Introduce a worker for GT specific wedge handling and queue the teardown
> on GT ordered workqueue, so we don't disrupt the scheduler while jobs
> are still in-flight.
> 
> Fixes: c9474b726b93 ("drm/xe: Wedge the entire device")
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---
> v2: Split fixes into separate patches (Rodrigo, Michal)
> ---
>  drivers/gpu/drm/xe/xe_gt.c       | 17 +++++++++++++++--
>  drivers/gpu/drm/xe/xe_gt_types.h |  6 ++++++
>  2 files changed, 21 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 478e047031f4..200e34331c19 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -173,6 +173,7 @@ static void xe_gt_enable_comp_1wcoh(struct xe_gt *gt)
>  }
>  
>  static void gt_reset_worker(struct work_struct *w);
> +static void gt_wedge_worker(struct work_struct *w);
>  
>  static int emit_job_sync(struct xe_exec_queue *q, struct xe_bb *bb,
>  			 long timeout_jiffies, bool force_reset)
> @@ -704,6 +705,8 @@ static void xe_gt_fini(void *arg)
>  	struct xe_gt *gt = arg;
>  	int i;
>  
> +	disable_work_sync(&gt->wedge.worker);
> +
>  	if (disable_work_sync(&gt->reset.worker))
>  		/*
>  		 * If gt_reset_worker was halted from executing, take care of
> @@ -723,6 +726,7 @@ int xe_gt_init(struct xe_gt *gt)
>  	int i;
>  
>  	INIT_WORK(&gt->reset.worker, gt_reset_worker);
> +	INIT_WORK(&gt->wedge.worker, gt_wedge_worker);

hmm, shouldn't this be done in xe_gt_alloc() ?

as xe_gt_init_early() seems to be doing something else and much later

>  
>  	for (i = 0; i < XE_ENGINE_CLASS_MAX; ++i) {
>  		gt->ring_ops[i] = xe_ring_ops_get(gt, i);
> @@ -1005,6 +1009,14 @@ void xe_gt_reset_async(struct xe_gt *gt)
>  		xe_pm_runtime_put(xe);
>  }
>  
> +static void gt_wedge_worker(struct work_struct *w)
> +{
> +	struct xe_gt *gt = container_of(w, typeof(*gt), wedge.worker);
> +
> +	xe_uc_declare_wedged(&gt->uc);
> +	xe_tlb_inval_reset(&gt->tlb_inval);
> +}
> +
>  void xe_gt_suspend_prepare(struct xe_gt *gt)
>  {
>  	xe_uc_suspend_prepare(&gt->uc);
> @@ -1195,6 +1207,7 @@ void xe_gt_declare_wedged(struct xe_gt *gt)
>  {
>  	xe_gt_assert(gt, gt_to_xe(gt)->wedged.mode);
>  
> -	xe_uc_declare_wedged(&gt->uc);
> -	xe_tlb_inval_reset(&gt->tlb_inval);
> +	/* Prevent queueing uninitialized worker if hit during probe */
> +	if (gt->wedge.worker.func)
> +		queue_work(gt->ordered_wq, &gt->wedge.worker);
>  }
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> index 628911346455..b11ac52b0ab7 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -233,6 +233,12 @@ struct xe_gt {
>  		struct work_struct worker;
>  	} reset;
>  
> +	/** @wedge: state for GT wedge */
> +	struct {
> +		/** @wedge.worker: worker for GT wedge to be done async */
> +		struct work_struct worker;
> +	} wedge;
> +
>  	/** @tlb_inval: TLB invalidation state */
>  	struct xe_tlb_inval tlb_inval;
>  


Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CD96CA9ED1
	for <intel-xe@archiver.kernel.org>; Mon, 12 Oct 2026 13:23:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AE8810E5B5;
	Mon, 12 Oct 2026 13:23:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70E3910E5B5
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Oct 2026 13:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791811427; x=1823347427;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=OBfxcQtzEvN/8OrGHfSv21itoHGjQJhnV+KsOFqDDys=;
 b=VcgaUu0LsZtmYrupaGKu1g4dl7IWd+zkrafaoxwC5OdrWaJwMawZgCmH
 NdNkAPr8GTeauLtzxdXKrKvoBx+ev9loSgOGP3cIvyL33rCvXQM/5fj0C
 PzQ6F2GBv7JtSBr2f2Opd+scdjFHYEZ+c9XUfy1NX/ng1BTHqqhkeDseA
 +IdfeKQnc6dAbcQGSlHEURYqFVyHnbUo+TwYTD58GU1ftqH/z/S7Qw6v3
 ZS+LbTGgmv7r+ZXtxeS1mHaYK4+p8exyVmyr4c9PbcBzF6g0viYBgp+dH
 x0Vz5tlIl6oGSFGRlF8e9Of0k3jnkfV4bUgOC9gLvC3mEVVL/qH2bKth/ w==;
X-CSE-ConnectionGUID: tJN9I0RvSXuCSaSoxltEXQ==
X-CSE-MsgGUID: flOebodoQgSObBe2nYOw8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="395564"
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="395564"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 06:23:44 -0700
X-CSE-ConnectionGUID: pCo9AHJSTUKzxiStA51whQ==
X-CSE-MsgGUID: V+Wt3rI8QweF8DCiV06spg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="813303"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 06:23:43 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 12 Oct 2026 06:23:42 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 12 Oct 2026 06:23:42 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.23) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 12 Oct 2026 06:23:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TwVy9H8iiBByQAkgEkKcopFUw55+1ppPjKTxAGWkEI3Y5cjHoTAc0rCpdaS7UF7mJQA4VnIx4JFTo+s/Uqya1I7+Vwxc7Y8k9BF9uXyGz6cbf8/+8vUkecXnQVeCr0A1+nBZGXzdndENV8UVV/JNiYyRYzWZjWUEGLX1aKroDPO6/VglB+f8XeSHQfC/E/jd5YSCLXJxlNg/SHKz5738XdwhknJfKn9oXuIMXrYyE6gMaG+CL2IqfNFBLcKGjP6O3t8RNZdAsr0VmlhkyijUx9g9kcGf7jcNSH2ppA0m/9GCr0hbMTmJspLCQ2BC2uX4Xw5RrvZWT2+rt2rdwHEChQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tgxxRX8aF7fN8uvhCAYKlS2QWy6mR/35U5Ug7T0zom8=;
 b=m1OlTBHExUksV9GlxJzFx4cg0vjCAyddUVb0QSXps6Y12C5mEQW1o9/tJpVzVuvngpntEEH0wGdh/ZYfjHSx+kwKRGYVsFYVki3snYO2nKBUkATN4flVdQDl+Igu8hiULXh+QgoNkP/kNnBdVFF9U9fRMoyJbfrlQYcE6MuLP0cfnMQcNLNdcHRctD1H4f9HtG6jlHPcLe1u/cCz9dpJVCkNX7eG/MrLZt94NVHeqQWRmcA2Qhw9h7l+BCh8RxQUAW3pL82GLE/o1hBNtmP29bmGpIAml84hMMA76a/FfOEtJSvzb5sTC7kgfAlRqP63FGargJ8xAyS9eaWuvMcrmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.19; Mon, 12 Oct
 2026 13:23:40 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%4]) with mapi id 15.21.0496.019; Mon, 12 Oct 2026
 13:23:40 +0000
Message-ID: <077f2363-042e-4a74-9c26-34b4ecfb52b4@intel.com>
Date: Mon, 12 Oct 2026 18:53:31 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 12/12] drm/xe/vram: Report VRAM errors using structured
 xe_log API
To: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20261012122522.2307625-1-dnyaneshwar.bhadane@intel.com>
 <20261012122522.2307625-13-dnyaneshwar.bhadane@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20261012122522.2307625-13-dnyaneshwar.bhadane@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0319.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:21a::18) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|SJ2PR11MB8370:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a5c016c-6f63-456c-91f0-08df286407cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|56012099006|11063799006|5023799004|4143699003|261009223027099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: yMJbad2CubJcRPIs/5/xOLgXNcBNmmhwVP5WntUckaGgPX6RiueQE0QYWbSQCDlgb0xFHLgOjKLLc0eUgoMQonvlbku63D5BtEcvk4eET8u0Y6jwPvdoc5RzIAkS31d2B+xgjbDuAh2SKVqY4WR0y4M1sFSMnielshJ15e2L85rn6njqHqSZOv/EpShtlTzrsPZB6EvSbWlcE9GF1bO/ci4MFE6XCqoqdZIK3ziivxuyhTstKgcg+0EFvwag5A3G6sQ68hfjDkdo+5S8NZC3F9zSazFGqJfyZekGA1MgbzjrvgeX3WI7JtCf+zgSWhVMGiFDonJti1uNN8VYvm/2X3lVxkk1OU98fq890d7yDq6+BQL70uB4UqnywIkzMefR6aVfJPeenRGLU4FR0S8SuDfA3cjrS9q+2//KaAoDEhxvgrrX1CWsEJe/4YxfyTikGosEIeDNcVMRo2G987dTSzulV4Cod6P94wg6WJd0XXRnrmIhTbuWDUo0Da/xSqlC+uMd5u16lmbx2YbbMqW6hNbhCp1LgC1heKX8tWGMBNluEuYISUqbwfJIsL6vFoUxRIY/kdhMK5riqQ5c0KjMbW2gEFCtdhTWtFvkJO8cOTwH8wWhhXqUaNSGdiNODKJHhaOMZX1niAHfKB1h0sAuwLfVtaKcakLTMgLPrK1p3k4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(56012099006)(11063799006)(5023799004)(4143699003)(261009223027099003)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a3FpMFdTcEZaOFFxbjh6b0owTXI3RXl6QWZHWnRmNjdsN1N3Q1VsMjdPOHEv?=
 =?utf-8?B?bEN6aHdGUitqOFNQcnlMN0tkVzZyUCt5N3ZDUmhWR0xPNU8yT3BUeVlnbzMw?=
 =?utf-8?B?UzFnQjBsOUFkZjFuVWZleWhxNFRMaDRBTndGOE9kN2VUTUZkYXBmdERSMlZ3?=
 =?utf-8?B?bU53VmNmY0hKM1Y2VjJZenpRMnd1bnhSNndsVzBnOTZDdWpabit2bGNSMkRO?=
 =?utf-8?B?bDVpTURnVFI5SzZ6QzZCNW1FU0VIMDVHSDdjNnoxWWdQWk82RDZnM1BLM3B3?=
 =?utf-8?B?TGR6cUt0c1VvMHd0ZVpvTDNKdmJ6TCsvUXlSaGJ3MGZmUWFLdkRHTnl2bThG?=
 =?utf-8?B?S1p6YW1VbjBNTjJMZ2pmK0hiRlcrUGV2RXh3L2hwYmlJZHJzaWIwVlpaRnd1?=
 =?utf-8?B?MkZraU1sS1hVRU53SGNCVEZDa3hQZ09DUTZHQ3JaZ3FUa2ZlSitBc1ZEMTNP?=
 =?utf-8?B?bkZrNzZzajFSN1NtTFdWbnJxa2JiRytndmpIbG95dVg2R2Z6TVRQVDdLMzlu?=
 =?utf-8?B?ZVNhRUpLNmtNT2EyTXNiOUtKTEZxbVpEaXZ5NEhERE9KSnJ3eTExT0lZSFl3?=
 =?utf-8?B?dXg5dDk4eEhEd1JUMXZXQVZyTEtuSDFlNENHdXA1aFlVaW8xTTlYdE9raGZt?=
 =?utf-8?B?WlhSbmRIRSs4dlFwYTYrV3AwR3piRDc0UWxnbXh1TjR4MzdZK25VNHBpbUwr?=
 =?utf-8?B?UnZOa1NJMWxxZUFEUGFRMWNQaVNncFJicngrV28xd1NrbU15amVkNHRDNWhQ?=
 =?utf-8?B?TWVpQkZkelFFb3dTaktKS2ZBRVJEaHJ1VFRSYWRnaEduamxESWVlNU8zMytz?=
 =?utf-8?B?djVES2JlMzFWaXNxeVpBb0VidDJHMXljNjlmZEJyK05Zck9GTVg1b2xRSEFt?=
 =?utf-8?B?SVRKbzhSandEM0V5VlgrSmEySTJrYitsTHNUbFp2NVBldjA2a2dxMmJFSnk2?=
 =?utf-8?B?UWo3VWRqMk5aYlhRYkhBa2g2WHlXOTEvY21Za1lmSGNYNWxHR2RzRERGa004?=
 =?utf-8?B?Z0t5ZWU5eHhFbWNMcXE1ZEVKKzJnbWo1ZTJTVEoyalFkSTZUNzFwM01meVFv?=
 =?utf-8?B?V1RKamRaNmljU3VFWVphQmM3RDZCQ3ozbHZuZHd2RjdSVzhoVDZseXFQY3U3?=
 =?utf-8?B?b1pVRFRabGxaU3N0bGtjNG9qaGV4S3RFaUwrN0ZDaVZ1OGV1NTJGTjY4TGxT?=
 =?utf-8?B?dG9nYnF2QS9rZVhKOTZsRnRmQVFBdENJdmYvanRTTkNxNkY0SnhYSFoydTZK?=
 =?utf-8?B?V0RvK0FFcVFyQVBmcHY1VHVsSzk3MmgyVHlDYnlJaTY3ZUJvMXNsK0lJWGVq?=
 =?utf-8?B?WXl4UjBKVWNMNkhLaUg1MDNyM1cyN2RWNDBRVEF3QjdjMUJwa0hheGxRRXZQ?=
 =?utf-8?B?d2RsdktKVzlwNU9kOHlIN1BDN3N5b3BzRWNBdCtHa25pV1VncFl5ZC9xcHdV?=
 =?utf-8?B?VUdYdVh1ZDliS3NFNmVreDRUZUZtcXpydkNKTVF1cnpqQy9Vd3dFaEJjdVlz?=
 =?utf-8?B?aUZqVXdwaCtkL0ZZdUtYNFhuais5clR5OTNoMXhEMEVBMklwWjQxSXZEUDNM?=
 =?utf-8?B?b3lrbDVQb3hBQVFMdllLejVJbWQ5TXBMTmV0c1VWcFI4NlU4TFFUUDZ1enN4?=
 =?utf-8?B?emJPK0VYcUhEOTJ5VnhhSXNUVk1VSmdBWDJQOUtpaUFJS3BjK0ZDa1lmM0JR?=
 =?utf-8?B?cnFBZDVPdXVBV3JLZWY0QkRNbi9kRWxPQ3hMWFYrOHpaQ2N6aFVnZ0FQcEI3?=
 =?utf-8?B?amhCQ1d4VWN3NkIxZGtaMDlMUjJoWkNkSFZ3VGhaZ2Z3WStJWVhXbzFqVTR5?=
 =?utf-8?B?TU1kTXgwR3VFbWlsUkpLOGZmVTBHTklQbWNjSHllenhvQStmWHk0WW1mZ2ZZ?=
 =?utf-8?B?QTR6OEFGMDBGbldhM0dzSkY1b2J6ZStNSVNtdERxWHBxdU9CSS8wT0pBTDd4?=
 =?utf-8?B?Mjd0bzdXSkorb2ROR3FvdjhWc09aeGhTbE5qeEFGV1dJa1VvWHBvSHRkRlh0?=
 =?utf-8?B?b1AxUkordnM2V2ZVanltMGRhOVkwY1ROMFFNMTIrSmJzN3pwS09BWlMrcmo4?=
 =?utf-8?B?Zk9Ga29KaHBkRnZoRjJCMW54a0NkL3AzbmIweWJGdzNXaXZDZ1IvTFFPRlQ5?=
 =?utf-8?B?M21wZ3QzL2FKaWVxN3V3SVZnTTFFOWl1Qk9sRWYvUDZKbnhRaUNoUk1zaEIw?=
 =?utf-8?B?WDVqV0Q4Z085UFRiczdrVlVBcEZIbTNNY2FIV1RqMlMzQ1BHbXRENDNndDlp?=
 =?utf-8?B?b2lYWURud0E5R0l5WlRrYzd6ZG41SU01U3dtWm5FOGdvSXRyQzZOTUdQV0dh?=
 =?utf-8?B?eGpBOTlKYVRRYWdvYVozQktHb01qdkFMZzhRN2VzMkxNc1VrL1dIdVdDZ0M1?=
 =?utf-8?Q?WPMQrOniBJXzdYWM=3D?=
X-Exchange-RoutingPolicyChecked: W3MFm+rU9XUeFGVNdqHV+w7tE1/axIOgnVj5q6DJMZERRjMzoghlmqlqreGlTcfeHA2VYEfTpC+CYvgnL0XGG0aAmBKCF68c24CUCbzXGRrQRg/8Vo8kFMxdYxK1R4+O2+GvMcoLVmw5Ac0m/FZbzqHWIgFKd8hxHqRENELYKppiWeyoQhnVcQdQIrU65ukKZnOYUKx9tVZ9mJdCpPIYyGvyeX7REErSSIOyH1kl4gD2ds92VNOND/jvhWx/sKoyk3U7/GtPpSH97iN8qe589StmIB8sJVJgJX/ULSvKH2VpgkOFXpkyBTCFSrnBtaeg/0+WhUDlwZx1P9o9VNutJw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a5c016c-6f63-456c-91f0-08df286407cf
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 13:23:40.4059 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BSGKvFnDQkr9rgCq5Zp7/nwDbHRixhjwHpnnrOcxDTa1Ryb4o5SCPtRtryE04HUtIlLEmmBNgLke8afcoIJiHw8sWRlo3ej7UHoyeM8pmCI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8370
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


On 12-10-2026 05:55 pm, Dnyaneshwar Bhadane wrote:
> Replace few drm_err()/drm_info() with xe_log_err_fatal()/xe_log_info()
> using the VRAM component tag. The "no CPU visible VRAM" error uses
> tile or device as the log location depending on the caller context.
>
> While at it, print the u64 total VRAM size with %#llx instead of %pa.
> %pa expects a phys_addr_t, which is only 32 bits wide on configs
> without CONFIG_PHYS_ADDR_T_64BIT, so the value could be truncated.
>
> Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
LGTM,
Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>
> ---
> v2:
>   - Update the ternary condition (Mallesh)
>
> v3:
>   - Rephrase the log message. (Mallesh)
>   - Update format specifiers for total VRAM size. (Mallesh)
> ---
>   drivers/gpu/drm/xe/xe_vram.c | 37 ++++++++++++++++++++----------------
>   1 file changed, 21 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
> index 73aef047eb38..1c02889ba29b 100644
> --- a/drivers/gpu/drm/xe/xe_vram.c
> +++ b/drivers/gpu/drm/xe/xe_vram.c
> @@ -17,6 +17,7 @@
>   #include "xe_device.h"
>   #include "xe_force_wake.h"
>   #include "xe_gt_mcr.h"
> +#include "xe_log.h"
>   #include "xe_map.h"
>   #include "xe_migrate.h"
>   #include "xe_mmio.h"
> @@ -46,7 +47,8 @@ static int determine_lmem_bar_size(struct xe_device *xe, struct xe_vram_region *
>   	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>   
>   	if (!resource_is_valid(pdev, LMEM_BAR)) {
> -		drm_err(&xe->drm, "pci resource is not valid\n");
> +		xe_log_err_fatal(xe, VRAM, -ENXIO,
> +				 "PCI resource is not valid\n");
>   		return -ENXIO;
>   	}
>   
> @@ -227,17 +229,15 @@ struct xe_vram_region *xe_vram_region_alloc(struct xe_device *xe, u8 id, u32 pla
>   
>   static void print_vram_region_info(struct xe_device *xe, struct xe_vram_region *vram)
>   {
> -	struct drm_device *drm = &xe->drm;
> -
>   	if (vram->io_size < vram->usable_size)
> -		drm_info(drm, "Small BAR device\n");
> -
> -	drm_info(drm,
> -		 "VRAM[%u]: Actual physical size %pa, usable size exclude stolen %pa, CPU accessible size %pa\n",
> -		 vram->id, &vram->actual_physical_size, &vram->usable_size, &vram->io_size);
> -	drm_info(drm, "VRAM[%u]: DPA range: [%pa-%llx], io range: [%pa-%llx]\n",
> -		 vram->id, &vram->dpa_base, vram->dpa_base + (u64)vram->actual_physical_size,
> -		 &vram->io_start, vram->io_start + (u64)vram->io_size);
> +		xe_log_info(xe, VRAM, "Small BAR device\n");
> +
> +	xe_log_info(xe, VRAM,
> +		    "[%u]: Actual physical size %pa, usable size exclude stolen %pa, CPU accessible size %pa\n",
> +		    vram->id, &vram->actual_physical_size, &vram->usable_size, &vram->io_size);
> +	xe_log_info(xe, VRAM, "[%u]: DPA range: [%pa-%llx], io range: [%pa-%llx]\n",
> +		    vram->id, &vram->dpa_base, vram->dpa_base + (u64)vram->actual_physical_size,
> +		    &vram->io_start, vram->io_start + (u64)vram->io_size);
>   }
>   
>   static int vram_region_init(struct xe_device *xe, struct xe_vram_region *vram,
> @@ -255,8 +255,11 @@ static int vram_region_init(struct xe_device *xe, struct xe_vram_region *vram,
>   	vram->io_size = min_t(u64, usable_size, remain_io_size);
>   
>   	if (!vram->io_size) {
> -		drm_err(&xe->drm, "%s without any CPU visible VRAM. Aborting.\n",
> -			tile ? "Tile" : "Device");
> +		if (tile)
> +			xe_log_err_fatal(tile, VRAM, -ENODEV, "No CPU visible VRAM. Aborting.\n");
> +		else
> +			xe_log_err_fatal(xe, VRAM, -ENODEV, "No CPU visible VRAM. Aborting.\n");
> +
>   		return -ENODEV;
>   	}
>   
> @@ -321,7 +324,8 @@ int xe_vram_probe(struct xe_device *xe)
>   	err = determine_lmem_bar_size(xe, &lmem_bar);
>   	if (err)
>   		return err;
> -	drm_info(&xe->drm, "VISIBLE VRAM: %pa, %pa\n", &lmem_bar.io_start, &lmem_bar.io_size);
> +	xe_log_info(xe, VRAM, "VISIBLE VRAM: start %pa, size %#llx\n",
> +		    &lmem_bar.io_start, (u64)lmem_bar.io_size);
>   
>   	remain_io_size = lmem_bar.io_size;
>   
> @@ -343,8 +347,9 @@ int xe_vram_probe(struct xe_device *xe)
>   			return err;
>   
>   		if (total_size > lmem_bar.io_size) {
> -			drm_info(&xe->drm, "VRAM: %pa is larger than resource %pa\n",
> -				 &total_size, &lmem_bar.io_size);
> +			xe_log_info(xe, VRAM,
> +				    "Total size %#llx is larger than resource %#llx\n",
> +				    total_size, (u64)lmem_bar.io_size);
>   		}
>   
>   		remain_io_size -= min_t(u64, tile->mem.vram->actual_physical_size, remain_io_size);

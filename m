Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F37B6C5AD5A
	for <intel-xe@archiver.kernel.org>; Wed, 12 Aug 2026 03:50:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95AEB10EE1C;
	Wed, 12 Aug 2026 03:50:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DXa+vrOB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3046510EE1C;
 Wed, 12 Aug 2026 03:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786506623; x=1818042623;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=50X3/nIVEhdHkrHqTUiEg0FhFM85+eyz61MrCo/C8Qg=;
 b=DXa+vrOBvw03qDmJx91/D69kRdua/lWOnyAO+h/KglmvHs/2R/JI3rg1
 JJyykXfwRTf70aR8K9f50l+UEDwaot8Kz5kxzrLGkxfKKqCDPp3LIr8fv
 scsH31Ncf8/kW/BsxqesswjWWAi5l106if8TBPVbn2n2vKEgh8hVzFGX6
 bFjLSIn64fJtA/d4jR0mj9kDfKwhZ5moUm11owRNH1Y8M5HburvgqiV9K
 +rrGvO1O28ke/nPEpwelrhxK4lup3G6/lu2MqC48rCpnicsPf5ZStsmye
 Cq6z6QUZcEgUGyAxPNgYKk2jyv4e7vGZg3sVJGs/t7FhFysWWJuwTzVUV g==;
X-CSE-ConnectionGUID: qBlBdOGRQ2Os3UWvXuC+6A==
X-CSE-MsgGUID: S1uYhFnURsSndx3nriZs0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="74586539"
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; d="scan'208";a="74586539"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 20:50:23 -0700
X-CSE-ConnectionGUID: 8zfa8JERSmONxzbjvfOKzg==
X-CSE-MsgGUID: H1Yv6f2iQsad6AtO/lVlDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; d="scan'208";a="267008708"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 20:50:23 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 11 Aug 2026 20:50:22 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 11 Aug 2026 20:50:22 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.19) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 11 Aug 2026 20:50:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oYGVhvC0HhGHcpw9PuZIPPAD4AhOwMhx3Y26DEjLZNhlT1J+BtWZWUG7XdMkFoxZD45aZp7HquJ9KEzbwc/7xdcAi+MF0bt80gNGKENL84YMXG7Tu6Bu/PZ77Ycf+k0e6jmTJTR1XrNz1INNHal97Rx63jrwaZbm29YnZVmVy9lk5rN4DPMoBqzodmjZPqzMROSrtjPpxdb7GlW55Zrg4nav3XsAGFcUV9UzOhTCIlalFSvofautbkgTenT6NKq23cX48MvNZXK0z03UxfOd6XjShyfdAO3ME6QlkzyLoC8GMctBCJ1f7BmuBzUNBgYhvRk5JdCvDoUEl5fQPCRcrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JxS3Bx/NzojiAVrMAuWuNHY6MrNezk9ayuNDnAtSsfk=;
 b=wGVnvMChxhmgllDRonkMKHF34QHeec177MxxB2wRXAKRaVRrz1CUk6ojOJSSiBIUQkv1ogGCGQ+wJXWRcuS/RLqLayCMzEDHEnYENow9S3qyd9gZd62dC3Ty+ghpUO3xmlodhgOh8SeKBWK4YZasvSA1UdAf9SlIwakcHwKWleCru4RzwocA2c6VPVDuWD4NChU492EkF0biOpHGwt5+wh4gL4lyCHquDZ5tk++WrNeGiDzUhdqFLnVGDVSduwnJSUXl3HhV3G9jUM0++aTnUryYCwlTNpircOlVPfkq3S3jRPRI/61QP0+cta9hDMlzgAfTjfWuv8tqaszTH3c0EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA3PR11MB7554.namprd11.prod.outlook.com (2603:10b6:806:315::9)
 by DS0PR11MB7927.namprd11.prod.outlook.com (2603:10b6:8:fd::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Wed, 12 Aug
 2026 03:50:19 +0000
Received: from SA3PR11MB7554.namprd11.prod.outlook.com
 ([fe80::3ec0:2280:db82:d67b]) by SA3PR11MB7554.namprd11.prod.outlook.com
 ([fe80::3ec0:2280:db82:d67b%5]) with mapi id 15.21.0292.024; Wed, 12 Aug 2026
 03:50:19 +0000
Message-ID: <6710db81-c507-4abc-a5f8-6f2678b9f780@intel.com>
Date: Wed, 12 Aug 2026 09:20:12 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] drm/i915/lt_phy: program DDI_CLK_VALFREQ with DDI
 clock frequency
To: Suraj Kandpal <suraj.kandpal@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <intel-gfx@lists.freedesktop.org>
References: <20260811175844.2613721-1-suraj.kandpal@intel.com>
 <20260811175844.2613721-4-suraj.kandpal@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20260811175844.2613721-4-suraj.kandpal@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0P287CA0006.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::12) To SA3PR11MB7554.namprd11.prod.outlook.com
 (2603:10b6:806:315::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR11MB7554:EE_|DS0PR11MB7927:EE_
X-MS-Office365-Filtering-Correlation-Id: b7cc8733-1864-438f-f993-08def824d3f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|10067099003|11063799006|56012099006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: FGSwhIjDkmEz3/OFlICaJ78NGd3w55V3A/OyXyaT23g3ObBrNDErkPSVVmJzzUZmOqy9qFp9/J7gn9yo1M75MCURBVeL81kZstM/ovKgUoOjoRKxatY4aCYLRNyPepUyFT68MEgPUSJJ+2d60504nRPQAlMCp+V2eE7cOQjQzcXWslp21AwvkHjd2OmZA2Z8ZdwdxaBuHzP/9Bv077ByA2qLEwkI+6O5XEMw87ev+zc0q33cxnIENwmF8CYekLKAuZlDV6z1PyE0YFwwHAXOgUzeNkHkZ4n2AbT7onBb4psRHyrFx0Hu5yNwUHxjlsByN7bdshQ63sNR+SZdPDYvVf2gpRLz+ZFMVzm+9VHFIWSYVLDmN1WAHlOA1x3ej9DI5FAjUsXb5QcWIUBPtqLbn3lEuZad+z0cxoRDzxXZKYyCH67M4cq1c/e0pLe0FK1ddt5cIzVPQ0Dq/Mjo7KIdtl8e5hXoR1ZXkehU8f5c4B132Y1tFa9vHeTAisdsTkjrWzrUwZ+34FKU2SPHK6fLvHyWomjgjCHc2N/otEAN/acg2feUhtfBQkxL7hOIZLGiT2DizSxVeiHWfXrVSCnox7+N4bMDXbqB1TP0oiGtibLtxGmBgpT31rmhlxXGZkE7eUauX25v+rqGukH98YSL42qAqTUjQy600EJsu5Y2YxQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB7554.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(10067099003)(11063799006)(56012099006)(4143699003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OFl3T1pzVHhLSGJiK3NSZnhhTzFISWc0U043RFdvM1FEc3VndkJPdW9RQmo0?=
 =?utf-8?B?dTdGL3pGZ3ZDRitSOUNqMzUrUXhLOXk4NmFKNlZMRXdqbEtvUHcrYVdmSnlS?=
 =?utf-8?B?SXJpdTlXbEQxUkNqcEJwTmRSc01MNk5qamI5OWlhdzYvN2Q1eGtvZ0RBTXI1?=
 =?utf-8?B?STZBQThMcDAyanE3UTg3cUR5THFrLzQ0anh6MTJ3ZzZTY09ZbTBlU280bGZq?=
 =?utf-8?B?TXl5aUtCVWsrL1BsZjIydE9LajFsdnY0S0RRSnFpa25Xd1FIejdsUXhoVWVE?=
 =?utf-8?B?KzNiZ0Q0KzRKVmV5MnpYWW90Q3Bic3M0V0h5SlpYbTFvRlh1c3JEaGY4Zko4?=
 =?utf-8?B?YUMrL0xJb0RNNzRidXNIU2pwT2VQNTBCZzVqTEgxYlpWdnlnbitOSW51WGtF?=
 =?utf-8?B?RENrSEJzVndNVGtjM1JjVW5Kd3pTSFdJMDJwUWppL1ErRjB3RjdoVVVRVi9i?=
 =?utf-8?B?d1dPRzBFZ0RNcGVDVlhCelZjV2NyWEdtWUY2ZTk1T2xnNTB6ZDk4TG9OaTAy?=
 =?utf-8?B?SGh0bkpZU0Z2dERFbU40UHZ3N0ZiRWw0R2QxaFhlcGp5RW51SXEyZzZRUWhU?=
 =?utf-8?B?Mnp2TFB2ZktyUjVjbEZTa2hYREdUV0t3cE8vNWZjQ3lydXJzZk9SWCtPMEVM?=
 =?utf-8?B?NWQwSFBtT1NWN0wyL1ZmcE8wcGp5T0ZGQTVvbDFINXgyczZIejJrWEk4RFRN?=
 =?utf-8?B?SjlhYU1zN2N3bDdnbEVFS1BBNXRmdXBjK1BMY1BJSGRWdUJmam00dXpHSTdm?=
 =?utf-8?B?Qk1wb0dGSVhUdkpTa25CeG84NVRjaHdyZzFlMlc5bFVRcC82Nkd1RStONXNw?=
 =?utf-8?B?b3ZyUjlJYjVxQ3o1aGFDRDhlSmN5UlR6WjVKZ0ZKV04yREdzVWM1Y3VuWkRq?=
 =?utf-8?B?R01yMkNoQjl3ckxFRE4zVlhIazQ2VWh6Q2kwNXNRNjFCZ05Pbis5YUFzczM4?=
 =?utf-8?B?ZVQ0MmFra3NsL0t0NVhwMktWS2QvRjFuT3RXUjg3dTl1S0phQXhBb0hIcFha?=
 =?utf-8?B?eDczUGFDdThReEtNWG16Ykh0bzdlbzF1N2Eva1kxbzNEbUpjTThzdEZXWkNQ?=
 =?utf-8?B?a29VcVdraGQzbXJOeFplT0JLTzExNUpPM3IwTUNSWFBENFlVZ2NPRzdnNWJ6?=
 =?utf-8?B?dHRPODFZRHNRMWVnSnFjSEQ5UGU0TXFuNER1elpMM1ZPa2pkSGtUSkpSMFQ0?=
 =?utf-8?B?MkYyaUZyand6aDlqeEw0VnJGak5PMmNYVVcvMWNPMjg4TlRlWGt1cXVYUHZq?=
 =?utf-8?B?WFIweVhBSGJ2dXNHMFUxVTFXd1pSQ0hHZDVtR1NvQWNGSDFJNG9vS2o5anZZ?=
 =?utf-8?B?TDZ5bkFvQXBleHpFdVRCR3lCaDJjUlA5dHRLR2J6N1BycWh6KzR2eENScHV0?=
 =?utf-8?B?OEVsQkZCcnRxckpMbTlCeHNnaW5hTW8yVXlWdTl1TnphenhLbDJhcm9nNmRo?=
 =?utf-8?B?M1JWcFhudGdvc1BjVzhMK214cGppRVdrajh1bzZPeUJ4VWhPWVJTNTBxSm9w?=
 =?utf-8?B?dXF0SkFGRjYyOW5qTWd2Z2RKS1U3SlhON2hTdkltSU9HWDB3ZVlyN0lpeWVN?=
 =?utf-8?B?bTVHK0tVUlVsejV5Um0wblhPNFhHMmR2ajd1TTlxZTIzYVRiT3FaZWNWTEZZ?=
 =?utf-8?B?cUlUTGJuRUhKbzBmaHQ2L2xrcjA4eFN5WmxFbDF2V1htVVhWd3hUMkNkTHkz?=
 =?utf-8?B?aGpHbERjeGJicXBaNVpGSW15bEFOODFxMmFVdjZhVHZ6di9GQytEdmx1NmMw?=
 =?utf-8?B?VGg3bFlPdGl2d1FGSzU3blVPemtMZDBKekc1K1VmZENzVGZtSWVmZGZha3Ra?=
 =?utf-8?B?OW5zV29VMnVJNWVDTTVyaEhEaHpVMlR6MWs3Y2JIME1HK0V2Z1JpVmZYMEI5?=
 =?utf-8?B?SSsxb2U0Zmx3UWlad2hQSkxFVlBPT1BmM0lmNElCT3doTFRnWVhNYkJrdE53?=
 =?utf-8?B?cU1ucXBleUI4S3FGdTBCVDVwN3ZVaTI3ZG1JWXJRYVBEUmw2RTJGM1hFNWZp?=
 =?utf-8?B?S2E3N2FOVjU4SVhldzdySmlhZy81MXpHZ1V5NVdmWDRZVDVySDkyNTJVbzNw?=
 =?utf-8?B?Q2JkSHBra1NPeDg4WnI5eHNEeWxYSlNYclpyM2J0bmdCMDhpTXUwSHBZVmgw?=
 =?utf-8?B?VmdMbjJWZnkxdE96cmgramZPeExHT2VwWGFrNmg5enh6R2RDempoVmdpTnE1?=
 =?utf-8?B?bWNjWkpLUlA3ckVxOGYvVDBYVlQxK3lnSUc2c090MVFqVnN1SmdMSGhpc0xL?=
 =?utf-8?B?L0QwTmFiN2ZpVmRleFppSWNiaXdNMFlTUURZVjBCVXpxT0hYRzZwUnYyWDZU?=
 =?utf-8?B?NUdrS013VnJOVUN2dUM1Mk5uNitQRVRtdjJDckxOVHNjVjZtcDFSZlR6M0Y4?=
 =?utf-8?Q?tNNGn8vP7h4R0FV4=3D?=
X-Exchange-RoutingPolicyChecked: cKXheJM3rsjvOC5Ddv3hSHzMbXcID0I6IQQ7xJKfdOIRzxiW9RWelnZ80EAphLfJZSPwiv/q+vGSX7tXr+K7v4B5V8qJqvMTcj5ll/7ItlTwfs2AgZBe//H42if+l6cvG0oYeq+54aLdVLxvlRi0UAR7excEket6DYLCcgTSvzayCdzM+j4/XQLxYN20Ck6fxjaqfZ2A/1TLURUrWqXTEJR95GW3aUOTkr5ph6qlz7qWglVYmCCgCxy259k57yMz6PFCeyOgJT5AByrlQ1vQ99GviglJNHNHa8bhcgDCeN7iAewX5fuEZt5qDJe0CAFjWgK38QkKDF/d6p3ILNlavg==
X-MS-Exchange-CrossTenant-Network-Message-Id: b7cc8733-1864-438f-f993-08def824d3f0
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB7554.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 03:50:19.4990 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JU7pO8RhuNx5Wb3v3wKDT7yr2bLxlH9zzswlJK8bMq8/PPitdUVUFLfT6lJwZxRQzVXOL1muG6XrRDpaQZNbAEb3GJYK3kfrxMlWvh74XbU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7927
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


On 8/11/2026 11:28 PM, Suraj Kandpal wrote:
> DDI_CLK_VALFREQ is programmed with the port clock, which for DP is the
> symbol clock computed assuming 8b/10b encoding (link_rate / 10). For
> DP 128b/132b (UHBR) rates and for HDMI FRL the port clock needs to
> be modified.
> On silicon DDI_CLK_VALFREQ is a scratch register with no
> functional impact, so the bug is not observed.
> Use intel_ddi_link_symbol_clock() to write the correct DDI clock in
> kHz
>
> Fixes: 5ec58d714935 ("drm/i915/lt_phy: Add .enable_clock hook on DDI")
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>


> ---
>   drivers/gpu/drm/i915/display/intel_lt_phy.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_lt_phy.c b/drivers/gpu/drm/i915/display/intel_lt_phy.c
> index 8fc6d230493f..86492651b01d 100644
> --- a/drivers/gpu/drm/i915/display/intel_lt_phy.c
> +++ b/drivers/gpu/drm/i915/display/intel_lt_phy.c
> @@ -1976,7 +1976,8 @@ void intel_lt_phy_pll_enable(struct intel_encoder *encoder,
>   		 * Change. We handle this step in bxt_set_cdclk().
>   		 */
>   		/* 10. Program DDI_CLK_VALFREQ to match intended DDI clock frequency. */
> -		intel_de_write(display, DDI_CLK_VALFREQ(encoder->port), port_clock);
> +		intel_de_write(display, DDI_CLK_VALFREQ(encoder->port),
> +			       intel_ddi_link_symbol_clock(encoder, port_clock));
>   
>   		/* 11. Program PORT_CLOCK_CTL[PCLK PLL Request LN0] = 1. */
>   		intel_de_rmw(display, XELPDP_PORT_CLOCK_CTL(display, port),
> @@ -2023,7 +2024,8 @@ void intel_lt_phy_pll_enable(struct intel_encoder *encoder,
>   			     lane_phy_pulse_status,
>   			     lane_phy_pulse_status);
>   	} else {
> -		intel_de_write(display, DDI_CLK_VALFREQ(encoder->port), port_clock);
> +		intel_de_write(display, DDI_CLK_VALFREQ(encoder->port),
> +			       intel_ddi_link_symbol_clock(encoder, port_clock));
>   	}
>   
>   	/*

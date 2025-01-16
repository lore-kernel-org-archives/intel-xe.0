Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E937EC02180
	for <intel-xe@archiver.kernel.org>; Thu, 16 Jan 2025 00:56:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B633C10E539;
	Thu, 16 Jan 2025 00:56:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KKp95KG8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15C6310E539
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Jan 2025 00:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736988982; x=1768524982;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=LdZtFblZFPwHbZbPqNleehZ5sIkbhU7Erro2MdwKGjY=;
 b=KKp95KG8lJudnduFKyU9u6fSePVyltSosg0Ps2qAtvVHRpjJ6R2B+MNV
 GY69u90wFgcEqDHiTbcQrqZPJfAC0z/7P2IYLg/+jxoK2dNpMoKZRSnEL
 NvNuhVJPKl2C8CiGq9getohDP51EPnIxyW0zTuaozMnwmUmGi7/3U8K+5
 OcRGVLmwaMI0VMjFzWIMmGF55JOq9+xmJNsCfzbWcxRHCB6hlXI2why0o
 vLD0Y4jS38e+56Uo2d1wB57ALv+8gsHAH1NI17LdvGAH3GyHnM5Hwd6fl
 N4GWYIk3vaQ2ynz09FRW/SSje7fbUyu5FMjDlwXYEPp+9orqXNTi89Na7 w==;
X-CSE-ConnectionGUID: YZ6W6VtSQiuYBOYEWX35xA==
X-CSE-MsgGUID: PB9JQcClRk6dIm8Cw/L5eA==
X-IronPort-AV: E=McAfee;i="6700,10204,11316"; a="37577584"
X-IronPort-AV: E=Sophos;i="6.13,207,1732608000"; d="scan'208";a="37577584"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2025 16:56:19 -0800
X-CSE-ConnectionGUID: fJbM/tiLTtSrKndBAJzkqA==
X-CSE-MsgGUID: Y/V0yn/mQEu47BMaD5lmaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,207,1732608000"; d="scan'208";a="105896937"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Jan 2025 16:56:19 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 15 Jan 2025 16:56:18 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 15 Jan 2025 16:56:18 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.170)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 15 Jan 2025 16:56:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aVhi6IjZbkKZTqz+VW04TAvqLqseAHtzHEfM0mFd1HHL0PwKZfMcV+G7a/04kjRVRDYG0AHZHHyyARbc2v1SGQAq5rlMkK0WYv0bUeQ2P2bblxgsj+lvQ0SZl/Jm/X8FY7BC6ipFbHNBq7ZHSzq2Mp0SPzfN5arbY3pP5g4P/3+9SXI9pNHdb/Kz0qAlpaCEZhe33adw357aNbYLjRcwuCTVdePZ6qwJ6YJuyl/i1oFb8V9ClQwtw6hcQN28cGvtf/XTh657XRkZo0LDV506pq3LE1PPmvNQqM1egO1dL+AFXoEiPtu3mKceaE1/HUHyZx0610GyPEmiAdIThM/Ibg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mJdeoi09gCIA4sRZT4uZzHiuuFSqmEviwTXxefgMl+g=;
 b=TJm3B3GOCRgQwMwED0S6IPvBpdmcVvP/aGctSSra2w4Y2DDPO6tLqw5pEZ5WGBEjNtkCQv5JEiDAQtqFTaOV09odGNWZCOmgYGac5/Dw/TTjcByQ8i0XLW2KxptX0ypsv5QymtieSJ2HTLuKbGFGYIKbqtM+Tn3DNY7T20g0gnNl25SRBt0TXfMBmOzlvRjMtqWjXw9l7dHe2locFj75h/XI1Wz+UEaTFovrWwi9V1ZE8vC+Ts4vfZm8SO+D4lqbN5Kg6NLd0hThbynRo296MzqlWdWwzNSKKUrC1TmCOgadxpRi47AGCYr5nw5/jhWH3rgCRiwLwCzyyKqVPwCsWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by PH7PR11MB8252.namprd11.prod.outlook.com (2603:10b6:510:1aa::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Thu, 16 Jan
 2025 00:56:15 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%4]) with mapi id 15.20.8356.010; Thu, 16 Jan 2025
 00:56:15 +0000
Message-ID: <a8cdd3c6-c02c-4e72-ba62-1a43e2f0abc5@intel.com>
Date: Wed, 15 Jan 2025 16:56:12 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 07/13] drm/xe/pxp: Add PXP queue tracking and session
 start
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20250116001110.4158032-1-daniele.ceraolospurio@intel.com>
 <20250116001110.4158032-8-daniele.ceraolospurio@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20250116001110.4158032-8-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0089.namprd03.prod.outlook.com
 (2603:10b6:303:b6::34) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|PH7PR11MB8252:EE_
X-MS-Office365-Filtering-Correlation-Id: 21c71562-c52d-4c7f-ca84-08dd35c8944b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aUllY3g1cjgvc1g4T1lnanNNUHhqLzNOdWdDN1JnK1FVYlZmWUVnbGlJaldO?=
 =?utf-8?B?ZmNzTjZ2N3FSY3piNGVwemgzTTVSN1poY2haaHYwSE9CamhVZGtlUzVuSEo1?=
 =?utf-8?B?U2RPVGVUNmMzbWYwUCtyUHRhUExLYU1oZ3EzdFN6NEQ2aTVLSlpzNnQzRVdQ?=
 =?utf-8?B?anA3VFlwd1MzcjVBd3NJNkxYMm5CeEhIL2xnTjBPcjZRemVsZ3BCeFF0YUxi?=
 =?utf-8?B?SldRVVdUQlo4ZVRkN0RrWW5VeThxT2dqcFpreVVjV201bmVxOUpEMkxXODZa?=
 =?utf-8?B?cUhYeVI5OFRUYWMxNkhlUGcyb0RpZGJxMVhkZlNZaXZaVnpWazcxL3pSUlhw?=
 =?utf-8?B?OUxrQ241RjFCdE54bzBiNUVKYkEvdExyejU0U3pwMGJqRWVTWVV5Szg5cWkv?=
 =?utf-8?B?L3UzZjN5M0VpV2NDdzI2T2dmT0RZN0dnb1NURmRnaEY0SnZCRkJTcDRTTS96?=
 =?utf-8?B?U1hPa04yakFtcTJBUlc2MlV1NXRMd3RQMTk3K1ZvMHBVQ1doWHVTNStSMzRW?=
 =?utf-8?B?TDQyckhNOFdlNFYxMzJXY3ltcHZva1h6YWQ4R2dvQ3MyT1k0alEwSG1ONURu?=
 =?utf-8?B?VWhGRXJ0OTRnZVJSNkV4NHlHUkY3cTEwYjc5RnpkOTdFKythcDhJMnZmRGdY?=
 =?utf-8?B?d2JVZXczRlBubDFRQVMydEdURG1KTnJUVjJQeHoxUEI3ZDJ3Skp0elNOTElC?=
 =?utf-8?B?dlQ2S2ZRbURuUU8yUFppdHgvVFlzcUN4SE53bGc2dHFzT1JmbEpBdDhIdHlM?=
 =?utf-8?B?SU5oL0g5U0hYNWNUWGJzUTZwZW4rajNaYUVyNXliYUJ1eU9kSjFUaldvTnp1?=
 =?utf-8?B?VWYwSVdLb0Y4cVpqa3hFbHhhUC9TZzhCZk5vMVRWWmtUckdJK0M4TThEaS92?=
 =?utf-8?B?Z3pBZUU2QXBxRnNXT3JXMEhYRk9hQWxydFh5Smw1Q1Vhc25Sa1FvaHFWTjky?=
 =?utf-8?B?WWplQjBzNUtSZ3h3QVJhLzE4d3dtNXdPb1JaTzhUa1QvL0dqaW4xY3g5ZUtS?=
 =?utf-8?B?Ry9NdnRjS1Z6azZxYzBpM0xvclJMSnpBczc4cU1UeGJ0UWtKcWU1NkVFN2xk?=
 =?utf-8?B?YWZDeHFaajhmL3pHcGVjWmJOWVA5VnoxdHRzZW43ZmpFSDl1cVd3Tm1JaytZ?=
 =?utf-8?B?NlZDZmdSVjF3cTl4c1hKMXlURVQ2S3ZDTTk1b3pKS1ZZNGVjQkIzMElOVG0r?=
 =?utf-8?B?cFp4THBScVIwSXlWKzBQTWU3TDZ6Z0hWRVk5TlhpU2psVU93ZnVWd2p0UW41?=
 =?utf-8?B?eklmMkl0YTNwRWJkV1h6MncyamM3UkUzSnJ5S1QvVHBXUGI0ckpPakt3SXJ1?=
 =?utf-8?B?dExta2NycEFrOHZKSkRSYmlmNGszdERnblRyaUMwNysvSGI1enF2UEhvNVFu?=
 =?utf-8?B?OG1ISW1ZT0MwVXNtdUU1L2NUV1UwbTl3aHN3eHBVVUpkdTdrdTI5VjdpaC9i?=
 =?utf-8?B?T0toZUw0dm1ZWFFmYm5WNUFURXZXc1ZtTjIrWW5WcXBHU0w0NHJOR0ZtMUVa?=
 =?utf-8?B?YmZFTnRBd05ENDJUUCtUdU1vQXJ2WDZ3eXNYTmVXR3ZHZVF3YkxuZ3I0VDc5?=
 =?utf-8?B?cHVjazNQek0xZUs1QXZDNlJrdmp1emMvUjloYXZVbTlhYkc5Rm1acktleDZR?=
 =?utf-8?B?TS9VZ1dGOFZaQmhxaFJCS2Y3Z0VBVTdNZWtGR1ptQjU2NDYyM3lJek9sQ3oz?=
 =?utf-8?B?SjI3c25hc0dwcTNWaExGVDJUaWdvWGtkVUZETFZicldSVXlFVHRXelV2Si8v?=
 =?utf-8?B?TGI1UXBWZERLTXMvVXNjd3RMdWNCYmN3RnRBWXdHMFhRZUFXTm5qRi85eENF?=
 =?utf-8?B?Z09tZ3FjQzZCZCtGTnJIdE43TFVocjlQb0VhRm42SGdyajBXTzJVQnBUQ1J1?=
 =?utf-8?Q?a6VEb+5AQ0fW1?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?clFvMkVOUUtrWDVVTkNpMkpZdml2VG9KQ0dpNGVGempTSHErbWlQRXcrcVNW?=
 =?utf-8?B?T1RmTDZpQXc3YzdLTytwS05nMm10L0t2RE90M2tBWFBEbENZcmFUVFRkQUhk?=
 =?utf-8?B?RThMM3hOTjBPSlhHa1hON3pGRW5KT2x3TUdVTDRIdm91V1BPcjgyVm5VVmxG?=
 =?utf-8?B?VXJad3M5azd2TG1qMjJmKzdJeldSanNJZzRYL0ZrRlQ5clJzbWlGaFFGZzdo?=
 =?utf-8?B?d2dBWWpHa3BCUDkwUTM4QkJLUjQveEZMMW9kM0NvdmYxbzBQaUppaXh5K0FU?=
 =?utf-8?B?aG1nczA4YkFSaTVCaW0yaE1HVWJISTJXM1J4YkIwdGhRMlJSRnlscjU1amNh?=
 =?utf-8?B?RkdtWW5oOEFSVWplME1kTmJCSTg2U2xTMHNCeEZabktOQzc4MTN4cVlONHR3?=
 =?utf-8?B?K2hTTTlwUjEzTHFQVWNuY3NXdWdabk1HNUxxdnBLdytHcHkxUTZGdXpsaURh?=
 =?utf-8?B?M2RyekZsQ3prSm9kT2lvb2Q0VG4wRUU1V01sTGNmajFrRWpsbENWYXNMbjZ2?=
 =?utf-8?B?SGYzSzZpYWh3SXl4ek00NE9qYW1NWUl0dHBaYjhxNWRHZStrbUhXdjBlbWkw?=
 =?utf-8?B?VjVnOU4xR2dhdTRVSE1WWTA2WE5uYitWUTIzdFhjalZsdlB1U3FQQzZBdDFv?=
 =?utf-8?B?TThSNElLQ1M3Y0lSWTBSVFhxT1RuVTZZTjJLZnhqTkJEaWw2RDNrRzZEcGtV?=
 =?utf-8?B?eTJHL1FQTnQ3NHdNbFRROFJwVjY3dVhqdlJpaXd3NzFMSVd2RzU3WFYzRE1F?=
 =?utf-8?B?M0trMWwvN3pwcjFvL0V5NzNkQzVjVWd4YWlQUTcxa3hxWEllU2MxUFl5MFVk?=
 =?utf-8?B?bWFINkFEOVY1WC82Vk9JY0dwdllMcWozUHkzNkcxd1N0blMwQ3lBc3ludzMx?=
 =?utf-8?B?Q2ZrckI4dmlMYU1kcm1kb05aSURtVHQ3eks0b2c2M3ZYaitudjR6MjlLYzhU?=
 =?utf-8?B?ZWEyenFMQ29PZ1BGay94aUlBUEYzZkFYOU1WaHppSFRveDZXWVV3Nzk1T2cz?=
 =?utf-8?B?TUpnOVcyd3JTODUyYk8vZm12SjJQL2d2cGIyeHRGb3NWL1RIbGpZSUJlRkxJ?=
 =?utf-8?B?OHpxVjI3OUozV3c0WWVubm1BdWtzUmR0VEVKQ2JpUzEvSmpuTlVBQXBVaVhP?=
 =?utf-8?B?eWVwM0Y0bWUrRU5HZlRTbmljeFhqeXhEUk1qcEk0QVhGTzVXOHJ2Z3l3RWpR?=
 =?utf-8?B?eFA4TS9yc3JpbWV6bldnais5bHVuZnNpR1FoMUJjUHovd2lxcnh6R2ZFU0p6?=
 =?utf-8?B?c0RYaklOZytNdk15bUxDZDVaaCt2elZTZXFBb2hjYzNhVTk1YUh2RzJKUGxp?=
 =?utf-8?B?emJtVkk3cXlFTURMQkVMK1VORmhjV3hSTGtaaHJCT0pFeHQ4VFVmM09uRW5n?=
 =?utf-8?B?N25yZUxpZXN1bFlOQzVDRWNxNmdIbWlCVjRJTDZaT25DU3FydCtTV2J5elJH?=
 =?utf-8?B?OHpIb3pjUGlqSHdKNzF4dW1vN2w5NEhEYmNmc1hUSDRRdldndklFc3VBVUhy?=
 =?utf-8?B?dnREMHVVaDVsdHF6QWFOY21mQUFPQzNzejhHTWxMZkFubjZSMllFcnBCZ0tR?=
 =?utf-8?B?SExIZndneStRanVlN29EbWJEM0MyWml5cGgwME5FSFpYQWllQ3dpVlNKMlhG?=
 =?utf-8?B?YTMwU1g1U1pSVHU2cGc2WjFYdWJPNEc4ZEI5T2pHTmxQR1dnTUp0TzYrdE4y?=
 =?utf-8?B?QlozM2wvZ3VDVlJ2MzFmTkNGK0tHdlNkekFQSHhXZTRnS3lJWjI1WnNqUW10?=
 =?utf-8?B?RkJiTVFoT3JGVkZkNHRtUnJpNWplVnR6Sy95ZXNwREpSU0VkZFFNcVFVMVRa?=
 =?utf-8?B?SmRSZlMwVjc3QmFrY2hvamZHQlVYZmJRNFlnbUphcjUrNmJubGROTThHZCtx?=
 =?utf-8?B?TkVTU1Z3TU1sSWxHNHlRd0t0QnpMb3dUZnNRRjVBVjJEa0NHVUIwV3dJcGg4?=
 =?utf-8?B?Y3VoeVl4V3dGOER0ZWJqUnRTVUlxSk9OTDIyRWR2Q1JZcHZrQnZISGhISnFn?=
 =?utf-8?B?MFhxOEprekIwVTZYcnJWMDUvbENCYjE5cXcrUGJ2M1BxM1VqNU5rNlpSdnQ1?=
 =?utf-8?B?M1R5T3MyVnMrS2JhcWc3VlovcTR6dXdvcy9jTFQxQUNqaXNnUDkyUXRBMGxV?=
 =?utf-8?B?TlBscDl5K1hFWlJxV3ZYMTdiMXJuYnZyYTBud2tUZ3UrWkMvZzdIZ3o5bUwx?=
 =?utf-8?B?MVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 21c71562-c52d-4c7f-ca84-08dd35c8944b
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2025 00:56:15.6063 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UtS//YYo5GykeY4Pzbo07CtYHtIp7yLdgHtq4AJsqvf7d3jQF5jn/WSQtiyVrl8j1ku8q9K+2g30Usoq8uUjBsOucNR/8NWaPCa/CtgkRHY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8252
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

On 1/15/2025 16:11, Daniele Ceraolo Spurio wrote:
> We expect every queue that uses PXP to be marked as doing so, to allow
> the driver to correctly manage the encryption status. The API for doing
> this from userspace is coming in the next patch, while this patch
> implement the management side of things. When a PXP queue is created,
> the driver will do the following:
>
> - Start the default PXP session if it is not already running;
> - assign an rpm ref to the queue to keep for its lifetime (this is
>    required because PXP HWDRM sessions are killed by the HW suspend flow).
>
> Since PXP start and termination can race each other, this patch also
> introduces locking and a state machine to keep track of the pending
> operations. Note that since we'll need to take the lock from the
> suspend/resume paths as well, we can't do submissions while holding it,
> which means we need a slightly more complicated state machine to keep
> track of intermediate steps.
>
> v4: new patch in the series, split from the following interface patch to
> keep review manageable. Lock and status rework to not do submissions
> under lock.
>
> v5: Improve comments and error logs (John)
>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

> ---
>   drivers/gpu/drm/xe/xe_exec_queue.c       |   1 +
>   drivers/gpu/drm/xe/xe_exec_queue_types.h |   6 +
>   drivers/gpu/drm/xe/xe_pxp.c              | 383 ++++++++++++++++++++++-
>   drivers/gpu/drm/xe/xe_pxp.h              |   5 +
>   drivers/gpu/drm/xe/xe_pxp_types.h        |  30 ++
>   5 files changed, 419 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 252bfa11cae9..2ec4e2eb6f2a 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -78,6 +78,7 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
>   	INIT_LIST_HEAD(&q->lr.link);
>   	INIT_LIST_HEAD(&q->multi_gt_link);
>   	INIT_LIST_HEAD(&q->hw_engine_group_link);
> +	INIT_LIST_HEAD(&q->pxp.link);
>   
>   	q->sched_props.timeslice_us = hwe->eclass->sched_props.timeslice_us;
>   	q->sched_props.preempt_timeout_us =
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> index 5af5419cec7a..6d85a069947f 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> @@ -130,6 +130,12 @@ struct xe_exec_queue {
>   		struct list_head link;
>   	} lr;
>   
> +	/** @pxp: PXP info tracking */
> +	struct {
> +		/** @pxp.link: link into the list of PXP exec queues */
> +		struct list_head link;
> +	} pxp;
> +
>   	/** @ops: submission backend exec queue operations */
>   	const struct xe_exec_queue_ops *ops;
>   
> diff --git a/drivers/gpu/drm/xe/xe_pxp.c b/drivers/gpu/drm/xe/xe_pxp.c
> index 1452a4763ac2..057c89a885db 100644
> --- a/drivers/gpu/drm/xe/xe_pxp.c
> +++ b/drivers/gpu/drm/xe/xe_pxp.c
> @@ -8,9 +8,13 @@
>   #include <drm/drm_managed.h>
>   
>   #include "xe_device_types.h"
> +#include "xe_exec_queue.h"
>   #include "xe_force_wake.h"
> +#include "xe_guc_submit.h"
> +#include "xe_gsc_proxy.h"
>   #include "xe_gt.h"
>   #include "xe_gt_types.h"
> +#include "xe_huc.h"
>   #include "xe_mmio.h"
>   #include "xe_pm.h"
>   #include "xe_pxp_submit.h"
> @@ -29,6 +33,15 @@
>   
>   #define ARB_SESSION DRM_XE_PXP_HWDRM_DEFAULT_SESSION /* shorter define */
>   
> +/*
> + * A submission to GSC can take up to 250ms to complete, so use a 300ms
> + * timeout for activation where only one of those is involved. Termination
> + * additionally requires a submission to VCS and an interaction with KCR, so
> + * bump the timeout to 500ms for that.
> + */
> +#define PXP_ACTIVATION_TIMEOUT_MS 300
> +#define PXP_TERMINATION_TIMEOUT_MS 500
> +
>   bool xe_pxp_is_supported(const struct xe_device *xe)
>   {
>   	return xe->info.has_pxp && IS_ENABLED(CONFIG_INTEL_MEI_GSC_PROXY);
> @@ -39,6 +52,40 @@ static bool pxp_is_enabled(const struct xe_pxp *pxp)
>   	return pxp;
>   }
>   
> +static bool pxp_prerequisites_done(const struct xe_pxp *pxp)
> +{
> +	struct xe_gt *gt = pxp->gt;
> +	unsigned int fw_ref;
> +	bool ready;
> +
> +	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> +
> +	/*
> +	 * If force_wake fails we could falsely report the prerequisites as not
> +	 * done even if they are; the consequence of this would be that the
> +	 * callers won't go ahead with using PXP, but if force_wake doesn't work
> +	 * the GT is very likely in a bad state so not really a problem to abort
> +	 * PXP. Therefore, we can just log the force_wake error and not escalate
> +	 * it.
> +	 */
> +	XE_WARN_ON(!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL));
> +
> +	/* PXP requires both HuC authentication via GSC and GSC proxy initialized */
> +	ready = xe_huc_is_authenticated(&gt->uc.huc, XE_HUC_AUTH_VIA_GSC) &&
> +		xe_gsc_proxy_init_done(&gt->uc.gsc);
> +
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
> +
> +	return ready;
> +}
> +
> +static bool pxp_session_is_in_play(struct xe_pxp *pxp, u32 id)
> +{
> +	struct xe_gt *gt = pxp->gt;
> +
> +	return xe_mmio_read32(&gt->mmio, KCR_SIP) & BIT(id);
> +}
> +
>   static int pxp_wait_for_session_state(struct xe_pxp *pxp, u32 id, bool in_play)
>   {
>   	struct xe_gt *gt = pxp->gt;
> @@ -48,14 +95,15 @@ static int pxp_wait_for_session_state(struct xe_pxp *pxp, u32 id, bool in_play)
>   			      250, NULL, false);
>   }
>   
> -static void pxp_terminate(struct xe_pxp *pxp)
> +static void pxp_invalidate_queues(struct xe_pxp *pxp);
> +
> +static int pxp_terminate_hw(struct xe_pxp *pxp)
>   {
> -	int ret = 0;
> -	struct xe_device *xe = pxp->xe;
>   	struct xe_gt *gt = pxp->gt;
>   	unsigned int fw_ref;
> +	int ret = 0;
>   
> -	drm_dbg(&xe->drm, "Terminating PXP\n");
> +	drm_dbg(&pxp->xe->drm, "Terminating PXP\n");
>   
>   	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>   	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FW_GT)) {
> @@ -80,14 +128,83 @@ static void pxp_terminate(struct xe_pxp *pxp)
>   
>   out:
>   	xe_force_wake_put(gt_to_fw(gt), fw_ref);
> +	return ret;
> +}
>   
> -	if (ret)
> +static void mark_termination_in_progress(struct xe_pxp *pxp)
> +{
> +	lockdep_assert_held(&pxp->mutex);
> +
> +	reinit_completion(&pxp->termination);
> +	pxp->status = XE_PXP_TERMINATION_IN_PROGRESS;
> +}
> +
> +static void pxp_terminate(struct xe_pxp *pxp)
> +{
> +	int ret = 0;
> +	struct xe_device *xe = pxp->xe;
> +
> +	if (!wait_for_completion_timeout(&pxp->activation,
> +					 msecs_to_jiffies(PXP_ACTIVATION_TIMEOUT_MS)))
> +		drm_err(&xe->drm, "failed to wait for PXP start before termination\n");
> +
> +	mutex_lock(&pxp->mutex);
> +
> +	pxp_invalidate_queues(pxp);
> +
> +	/*
> +	 * If we have a termination already in progress, we need to wait for
> +	 * it to complete before queueing another one. Once the first
> +	 * termination is completed we'll set the state back to
> +	 * NEEDS_TERMINATION and leave it to the pxp start code to issue it.
> +	 */
> +	if (pxp->status == XE_PXP_TERMINATION_IN_PROGRESS) {
> +		pxp->status = XE_PXP_NEEDS_ADDITIONAL_TERMINATION;
> +		mutex_unlock(&pxp->mutex);
> +		return;
> +	}
> +
> +	mark_termination_in_progress(pxp);
> +
> +	mutex_unlock(&pxp->mutex);
> +
> +	ret = pxp_terminate_hw(pxp);
> +	if (ret) {
>   		drm_err(&xe->drm, "PXP termination failed: %pe\n", ERR_PTR(ret));
> +		mutex_lock(&pxp->mutex);
> +		pxp->status = XE_PXP_ERROR;
> +		complete_all(&pxp->termination);
> +		mutex_unlock(&pxp->mutex);
> +	}
>   }
>   
>   static void pxp_terminate_complete(struct xe_pxp *pxp)
>   {
> -	/* TODO mark the session as ready to start */
> +	/*
> +	 * We expect PXP to be in one of 2 states when we get here:
> +	 * - XE_PXP_TERMINATION_IN_PROGRESS: a single termination event was
> +	 * requested and it is now completing, so we're ready to start.
> +	 * - XE_PXP_NEEDS_ADDITIONAL_TERMINATION: a second termination was
> +	 * requested while the first one was still being processed.
> +	 */
> +	mutex_lock(&pxp->mutex);
> +
> +	switch(pxp->status) {
> +	case XE_PXP_TERMINATION_IN_PROGRESS:
> +		pxp->status = XE_PXP_READY_TO_START;
> +		break;
> +	case XE_PXP_NEEDS_ADDITIONAL_TERMINATION:
> +		pxp->status = XE_PXP_NEEDS_TERMINATION;
> +		break;
> +	default:
> +		drm_err(&pxp->xe->drm,
> +			"PXP termination complete while status was %u\n",
> +			pxp->status);
> +	}
> +
> +	complete_all(&pxp->termination);
> +
> +	mutex_unlock(&pxp->mutex);
>   }
>   
>   static void pxp_irq_work(struct work_struct *work)
> @@ -229,10 +346,24 @@ int xe_pxp_init(struct xe_device *xe)
>   	if (!pxp)
>   		return -ENOMEM;
>   
> +	INIT_LIST_HEAD(&pxp->queues.list);
> +	spin_lock_init(&pxp->queues.lock);
>   	INIT_WORK(&pxp->irq.work, pxp_irq_work);
>   	pxp->xe = xe;
>   	pxp->gt = gt;
>   
> +	/*
> +	 * we'll use the completions to check if there is an action pending,
> +	 * so we start them as completed and we reinit it when an action is
> +	 * triggered.
> +	 */
> +	init_completion(&pxp->activation);
> +	init_completion(&pxp->termination);
> +	complete_all(&pxp->termination);
> +	complete_all(&pxp->activation);
> +
> +	mutex_init(&pxp->mutex);
> +
>   	pxp->irq.wq = alloc_ordered_workqueue("pxp-wq", 0);
>   	if (!pxp->irq.wq) {
>   		err = -ENOMEM;
> @@ -259,3 +390,243 @@ int xe_pxp_init(struct xe_device *xe)
>   	drmm_kfree(&xe->drm, pxp);
>   	return err;
>   }
> +
> +static int __pxp_start_arb_session(struct xe_pxp *pxp)
> +{
> +	int ret;
> +	unsigned int fw_ref;
> +
> +	fw_ref = xe_force_wake_get(gt_to_fw(pxp->gt), XE_FW_GT);
> +	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FW_GT))
> +		return -EIO;
> +
> +	if (pxp_session_is_in_play(pxp, ARB_SESSION)) {
> +		ret = -EEXIST;
> +		goto out_force_wake;
> +	}
> +
> +	ret = xe_pxp_submit_session_init(&pxp->gsc_res, ARB_SESSION);
> +	if (ret) {
> +		drm_err(&pxp->xe->drm, "Failed to init PXP arb session: %pe\n", ERR_PTR(ret));
> +		goto out_force_wake;
> +	}
> +
> +	ret = pxp_wait_for_session_state(pxp, ARB_SESSION, true);
> +	if (ret) {
> +		drm_err(&pxp->xe->drm, "PXP ARB session failed to go in play%pe\n", ERR_PTR(ret));
> +		goto out_force_wake;
> +	}
> +
> +	drm_dbg(&pxp->xe->drm, "PXP ARB session is active\n");
> +
> +out_force_wake:
> +	xe_force_wake_put(gt_to_fw(pxp->gt), fw_ref);
> +	return ret;
> +}
> +
> +static void __exec_queue_add(struct xe_pxp *pxp, struct xe_exec_queue *q)
> +{
> +	spin_lock_irq(&pxp->queues.lock);
> +	list_add_tail(&q->pxp.link, &pxp->queues.list);
> +	spin_unlock_irq(&pxp->queues.lock);
> +}
> +
> +/**
> + * xe_pxp_exec_queue_add - add a queue to the PXP list
> + * @pxp: the xe->pxp pointer (it will be NULL if PXP is disabled)
> + * @q: the queue to add to the list
> + *
> + * If PXP is enabled and the prerequisites are done, start the PXP ARB
> + * session (if not already running) and add the queue to the PXP list. Note
> + * that the queue must have previously been marked as using PXP with
> + * xe_pxp_exec_queue_set_type.
> + *
> + * Returns 0 if the PXP ARB session is running and the queue is in the list,
> + * -ENODEV if PXP is disabled, -EBUSY if the PXP prerequisites are not done,
> + * other errno value if something goes wrong during the session start.
> + */
> +int xe_pxp_exec_queue_add(struct xe_pxp *pxp, struct xe_exec_queue *q)
> +{
> +	int ret = 0;
> +
> +	if (!pxp_is_enabled(pxp))
> +		return -ENODEV;
> +
> +	/*
> +	 * Runtime suspend kills PXP, so we take a reference to prevent it from
> +	 * happening while we have active queues that use PXP
> +	 */
> +	xe_pm_runtime_get(pxp->xe);
> +
> +	if (!pxp_prerequisites_done(pxp)) {
> +		ret = -EBUSY;
> +		goto out;
> +	}
> +
> +wait_for_idle:
> +	/*
> +	 * if there is an action in progress, wait for it. We need to wait
> +	 * outside the lock because the completion is done from within the lock.
> +	 * Note that the two action should never be pending at the same time.
> +	 */
> +	if (!wait_for_completion_timeout(&pxp->termination,
> +					 msecs_to_jiffies(PXP_TERMINATION_TIMEOUT_MS))) {
> +		ret = -ETIMEDOUT;
> +		goto out;
> +	}
> +
> +	if (!wait_for_completion_timeout(&pxp->activation,
> +					 msecs_to_jiffies(PXP_ACTIVATION_TIMEOUT_MS))) {
> +		ret = -ETIMEDOUT;
> +		goto out;
> +	}
> +
> +	mutex_lock(&pxp->mutex);
> +
> +	/* If PXP is not already active, turn it on */
> +	switch (pxp->status) {
> +	case XE_PXP_ERROR:
> +		ret = -EIO;
> +		break;
> +	case XE_PXP_ACTIVE:
> +		__exec_queue_add(pxp, q);
> +		mutex_unlock(&pxp->mutex);
> +		goto out;
> +	case XE_PXP_READY_TO_START:
> +		pxp->status = XE_PXP_START_IN_PROGRESS;
> +		reinit_completion(&pxp->activation);
> +		break;
> +	case XE_PXP_START_IN_PROGRESS:
> +		/* If a start is in progress then the completion must not be done */
> +		XE_WARN_ON(completion_done(&pxp->activation));
> +		mutex_unlock(&pxp->mutex);
> +		goto wait_for_idle;
> +	case XE_PXP_NEEDS_TERMINATION:
> +		mark_termination_in_progress(pxp);
> +		break;
> +	case XE_PXP_TERMINATION_IN_PROGRESS:
> +	case XE_PXP_NEEDS_ADDITIONAL_TERMINATION:
> +		/* If a termination is in progress then the completion must not be done */
> +		XE_WARN_ON(completion_done(&pxp->termination));
> +		mutex_unlock(&pxp->mutex);
> +		goto wait_for_idle;
> +	default:
> +		drm_err(&pxp->xe->drm, "unexpected state during PXP start: %u\n", pxp->status);
> +		ret = -EIO;
> +		break;
> +	}
> +
> +	mutex_unlock(&pxp->mutex);
> +
> +	if (ret)
> +		goto out;
> +
> +	if (!completion_done(&pxp->termination)) {
> +		ret = pxp_terminate_hw(pxp);
> +		if (ret) {
> +			drm_err(&pxp->xe->drm, "PXP termination failed before start\n");
> +			mutex_lock(&pxp->mutex);
> +			pxp->status = XE_PXP_ERROR;
> +			mutex_unlock(&pxp->mutex);
> +
> +			goto out;
> +		}
> +
> +		goto wait_for_idle;
> +	}
> +
> +	/* All the cases except for start should have exited earlier */
> +	XE_WARN_ON(completion_done(&pxp->activation));
> +	ret = __pxp_start_arb_session(pxp);
> +
> +	mutex_lock(&pxp->mutex);
> +
> +	complete_all(&pxp->activation);
> +
> +	/*
> +	 * Any other process should wait until the state goes away from
> +	 * XE_PXP_START_IN_PROGRESS, so if the state is not that something went
> +	 * wrong. Mark the status as needing termination and try again.
> +	 */
> +	if (pxp->status != XE_PXP_START_IN_PROGRESS) {
> +		drm_err(&pxp->xe->drm, "unexpected state after PXP start: %u\n", pxp->status);
> +		pxp->status = XE_PXP_NEEDS_TERMINATION;
> +		mutex_unlock(&pxp->mutex);
> +		goto wait_for_idle;
> +	}
> +
> +	/* If everything went ok, update the status and add the queue to the list */
> +	if (!ret) {
> +		pxp->status = XE_PXP_ACTIVE;
> +		__exec_queue_add(pxp, q);
> +	} else {
> +		pxp->status = XE_PXP_ERROR;
> +	}
> +
> +	mutex_unlock(&pxp->mutex);
> +
> +out:
> +	/*
> +	 * in the successful case the PM ref is released from
> +	 * xe_pxp_exec_queue_remove
> +	 */
> +	if (ret)
> +		xe_pm_runtime_put(pxp->xe);
> +
> +	return ret;
> +}
> +
> +/**
> + * xe_pxp_exec_queue_remove - remove a queue from the PXP list
> + * @pxp: the xe->pxp pointer (it will be NULL if PXP is disabled)
> + * @q: the queue to remove from the list
> + *
> + * If PXP is enabled and the exec_queue is in the list, the queue will be
> + * removed from the list and its PM reference will be released. It is safe to
> + * call this function multiple times for the same queue.
> + */
> +void xe_pxp_exec_queue_remove(struct xe_pxp *pxp, struct xe_exec_queue *q)
> +{
> +	bool need_pm_put = false;
> +
> +	if (!pxp_is_enabled(pxp))
> +		return;
> +
> +	spin_lock_irq(&pxp->queues.lock);
> +
> +	if (!list_empty(&q->pxp.link)) {
> +		list_del_init(&q->pxp.link);
> +		need_pm_put = true;
> +	}
> +
> +	spin_unlock_irq(&pxp->queues.lock);
> +
> +	if (need_pm_put)
> +		xe_pm_runtime_put(pxp->xe);
> +}
> +
> +static void pxp_invalidate_queues(struct xe_pxp *pxp)
> +{
> +	struct xe_exec_queue *tmp, *q;
> +
> +	spin_lock_irq(&pxp->queues.lock);
> +
> +	/*
> +	 * Removing a queue from the PXP list requires a put of the RPM ref that
> +	 * the queue holds to keep the PXP session alive, which can't be done
> +	 * under spinlock. Since it is safe to kill a queue multiple times, we
> +	 * can leave the invalid queue in the list for now and postpone the
> +	 * removal and associated RPM put to when the queue is destroyed.
> +	 */
> +	list_for_each_entry(tmp, &pxp->queues.list, pxp.link) {
> +		q = xe_exec_queue_get_unless_zero(tmp);
> +
> +		if (!q)
> +			continue;
> +
> +		xe_exec_queue_kill(q);
> +		xe_exec_queue_put(q);
> +	}
> +
> +	spin_unlock_irq(&pxp->queues.lock);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_pxp.h b/drivers/gpu/drm/xe/xe_pxp.h
> index 39435c644dcd..f482567c27b5 100644
> --- a/drivers/gpu/drm/xe/xe_pxp.h
> +++ b/drivers/gpu/drm/xe/xe_pxp.h
> @@ -9,6 +9,8 @@
>   #include <linux/types.h>
>   
>   struct xe_device;
> +struct xe_exec_queue;
> +struct xe_pxp;
>   
>   #define DRM_XE_PXP_HWDRM_DEFAULT_SESSION 0xF /* TODO: move to uapi */
>   
> @@ -17,4 +19,7 @@ bool xe_pxp_is_supported(const struct xe_device *xe);
>   int xe_pxp_init(struct xe_device *xe);
>   void xe_pxp_irq_handler(struct xe_device *xe, u16 iir);
>   
> +int xe_pxp_exec_queue_add(struct xe_pxp *pxp, struct xe_exec_queue *q);
> +void xe_pxp_exec_queue_remove(struct xe_pxp *pxp, struct xe_exec_queue *q);
> +
>   #endif /* __XE_PXP_H__ */
> diff --git a/drivers/gpu/drm/xe/xe_pxp_types.h b/drivers/gpu/drm/xe/xe_pxp_types.h
> index 311d08111b5f..bd741720f67d 100644
> --- a/drivers/gpu/drm/xe/xe_pxp_types.h
> +++ b/drivers/gpu/drm/xe/xe_pxp_types.h
> @@ -6,7 +6,10 @@
>   #ifndef __XE_PXP_TYPES_H__
>   #define __XE_PXP_TYPES_H__
>   
> +#include <linux/completion.h>
>   #include <linux/iosys-map.h>
> +#include <linux/mutex.h>
> +#include <linux/spinlock.h>
>   #include <linux/types.h>
>   #include <linux/workqueue.h>
>   
> @@ -16,6 +19,16 @@ struct xe_device;
>   struct xe_gt;
>   struct xe_vm;
>   
> +enum xe_pxp_status {
> +	XE_PXP_ERROR = -1,
> +	XE_PXP_NEEDS_TERMINATION = 0, /* starting status */
> +	XE_PXP_NEEDS_ADDITIONAL_TERMINATION,
> +	XE_PXP_TERMINATION_IN_PROGRESS,
> +	XE_PXP_READY_TO_START,
> +	XE_PXP_START_IN_PROGRESS,
> +	XE_PXP_ACTIVE,
> +};
> +
>   /**
>    * struct xe_pxp_gsc_client_resources - resources for GSC submission by a PXP
>    * client. The GSC FW supports multiple GSC client active at the same time.
> @@ -82,6 +95,23 @@ struct xe_pxp {
>   #define PXP_TERMINATION_REQUEST  BIT(0)
>   #define PXP_TERMINATION_COMPLETE BIT(1)
>   	} irq;
> +
> +	/** @mutex: protects the pxp status and the queue list */
> +	struct mutex mutex;
> +	/** @status: the current pxp status */
> +	enum xe_pxp_status status;
> +	/** @activation: completion struct that tracks pxp start */
> +	struct completion activation;
> +	/** @termination: completion struct that tracks terminations */
> +	struct completion termination;
> +
> +	/** @queues: management of exec_queues that use PXP */
> +	struct {
> +		/** @queues.lock: spinlock protecting the queue management */
> +		spinlock_t lock;
> +		/** @queues.list: list of exec_queues that use PXP */
> +		struct list_head list;
> +	} queues;
>   };
>   
>   #endif /* __XE_PXP_TYPES_H__ */


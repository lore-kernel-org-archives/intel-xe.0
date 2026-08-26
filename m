Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41EFBC5DF97
	for <intel-xe@archiver.kernel.org>; Wed, 26 Aug 2026 12:31:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAD5110E27D;
	Wed, 26 Aug 2026 12:31:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NXJiOMmf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B64310E27D
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Aug 2026 12:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787747513; x=1819283513;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/4Rs6/0a9tJdtLKs3K1bSrILXY7m+GXLF0jRUJxp5e8=;
 b=NXJiOMmfrV8KYGEQNaEyYoOBXoAFE8dS0dUD3czJZ7Qwk0KsMB0LCEEC
 rmmVRYdfEBJMqi+sc0FNS7j5P5Vut0yl/0lssNpnKRmePI0Zjvw9FfSVQ
 Il+nBT63uykpGOuZW+w6ZlGM9rdnFNHbQXxj9IjkSJwyAvLK9maeD6wrn
 oYoVEmnKUecnCdAsNyM91N4IGtAnE91HN7BohP3o7w7i7o5zNEmUVnWT0
 GXhXO/QYdIiEAFrVdyCxNuKiV8HnnuEdLFZl7ZVriY7kl5zVJ/FWrauV4
 5pNvWDkWUDLefkH7E9/3phbxfAA9G7s/WoaW4rN8doAs8vKceRn2VAHyR Q==;
X-CSE-ConnectionGUID: C0ydez57S0eAPxwIgF6vxg==
X-CSE-MsgGUID: 6bi57qx7Qo+6svESBO1qdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="91907156"
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; d="scan'208";a="91907156"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 05:31:52 -0700
X-CSE-ConnectionGUID: CA5lApALQcmkBktK7+IB+A==
X-CSE-MsgGUID: p7MYPH9ZRh+LuXv7Qef/+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; d="scan'208";a="263815015"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 05:31:52 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 26 Aug 2026 05:31:51 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 26 Aug 2026 05:31:51 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.22)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 26 Aug 2026 05:31:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IVQraVWTuJmebp8ux0KIia87DWQgpdxbODd9G/JSF/t+Au2oGIx7F28dG2J4L0BBrRhU7Td+VoSi52li3aekFnWNbNvKf75pu7D35eeGcTSsI/9VZLXxsULeH0BizQpd1L3+a39fTiA1/ExQEwQ/2Z65R5ixdLzdS+2vx0j4+iD33voV+Aq0o+csvCx0w1MUaJz0EF2/sCk2NAZFwfkF17TRMi9hkcflt/t99o/GT2/qz1lzBW1qOhRoA49P8P3KT2YW7tH9dF5MqaWjxPrvmjL/RjLhQUlTY2CeflTrhZ3tbQBv4nINJnAbnXisw76d7QAos8g2ppyzIsgS/WAl5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hanVu4/OKlQE4I6rpnOlQZqsu5+HY9Z9r9H+5eOF60U=;
 b=g7KxPJ1IKLrOCjFfuMtD0veUsIrvgTcOdLl2HQrVwoXLgLd5KYbP1c5ryCC8pLc2U6bKR5w+/GGqZsTRl+Nh8ZxotB7f1eydbdQTnLIELuB6UpBul+SThEPG6bV3eEDFTW3fEkO0yObObN+T8H725jIrJ0KiNg/rs9m6mJFVRG9CUUVyxKPzNNgZp3BnV0UfFxHnpeOkzfJILYiOCgme92x4oNQhuEHxYujr5u9Cq0pnvc5+C3nG8g4n5biCwiEM43/7qhnX9xsyADmpK69qVObUnzyqHhFsUurtqT0DDnSsP216lTk7XiPyXtxyyBvM392TkxaU0C+y/CzzreUG6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV0PR11MB9792.namprd11.prod.outlook.com (2603:10b6:408:385::5)
 by CH0PR11MB5300.namprd11.prod.outlook.com (2603:10b6:610:bf::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.6; Wed, 26 Aug
 2026 12:31:49 +0000
Received: from LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8]) by LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8%5]) with mapi id 15.21.0360.008; Wed, 26 Aug 2026
 12:31:49 +0000
Message-ID: <bccd79f7-94cb-4d0c-b9b8-c3fb59e13af5@intel.com>
Date: Wed, 26 Aug 2026 18:01:40 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/xe/hwmon: Use VRAM temperature sensor count from
 thermal config on CRI
To: Karthik Poosa <karthik.poosa@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <rodrigo.vivi@intel.com>, <anshuman.gupta@intel.com>,
 <raag.jadav@intel.com>, <riana.tauro@intel.com>, <sk.anirban@intel.com>,
 <mallesh.koujalagi@intel.com>, <soham.purkait@intel.com>
References: <20260824184137.2164727-1-karthik.poosa@intel.com>
 <20260824184137.2164727-3-karthik.poosa@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20260824184137.2164727-3-karthik.poosa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0038.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::11) To LV0PR11MB9792.namprd11.prod.outlook.com
 (2603:10b6:408:385::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV0PR11MB9792:EE_|CH0PR11MB5300:EE_
X-MS-Office365-Filtering-Correlation-Id: 5af84881-4d46-4fde-c627-08df036dffd7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|56012099006|10067099003|18002099003|22082099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: EyDmiTzMyFAlNYp9F2rI9R3it/S8buv9hs5pkjFCZlKVDcx3mcWHExvM3VaaaKjPi3m5pxjb6w0oAbR9O3UxX5y96KuGqX590y9IBMU2Q0iOuJf123IQQFv0MUA4M2F3mIGt+ZhStcYTSchsUqVFKZURSjJ9Y/s/r+uPqGqJBm8qyJOd0qXCOQgeiLZJt0Fg0RqgcDfKyJAcfNpd8nwnEUYR+YtQGC5N4E80c42avdSyeMGVHduFEjhb+8pWp+OLt9Y4swwiUtJHMxtCGdcXtqsD2JnggSjPo/E2xodJ05IJDtxLYsAgosXVwkoe9rBTNDuPGsX2+WQCON2NZoxgG/plR9ZqskR3WhGdvD7RCj9690ZfCzG+44yGlWc/TNww2bpeTYnASTN/9d3pLjSzOB3VIZuu4EoZdIfjzZDtCiytI+EQh11DjdE3lcc9xW1bZst2Hvafawby5WwV9h8o8/R5DM37JDG6kFxYPxGCTppvluZIslYOQhjOJvbWm8INuNbo3dBcPkPqvPFtgWNM0WTBn9pEGHRWUA/eHhxiL8HiZ0tWRwS/tK6q9Ll2SfUpeY5Y3Txv2LqzVjVXwprsEcRkiXemc9Nd+/F/jIBXRAAiCECTCVoo058RzuBsHs1xdL6FvX6zFwHVb+VtgKo8H3eC1tiyRxcR7oGsxycGJvk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV0PR11MB9792.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(56012099006)(10067099003)(18002099003)(22082099003)(4143699003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S2cwUlorOU1ZS09uSGIvZkpiVzU4OFhkaEN2ZndsODRsTXBBYjIvUlAzd2o3?=
 =?utf-8?B?NDJRdTNqVlEza3BtQXZ5dEw1R0xXc1Q4MXZqcVFueU9FY3picTRHVkFTTVd4?=
 =?utf-8?B?cTIxUHpZRUNHNStTblZRMmJGUXVoWXJxdWpLeEkzQnI0T1VJSWxucVY3cTJv?=
 =?utf-8?B?N0dWUHFWcG1Pd2VDWWJEOWJ5dGZtY1k3bitWU203eXV2Szg2YzN0aldJckFx?=
 =?utf-8?B?aGU4VG95MGYzRWU3TFo2NFVGSEVOeng5ZmdZVjhtSFVZbzgyd2ZSc0c4ZVN0?=
 =?utf-8?B?amxWQUxSaEFVaHlTT21MSlZNTlJxOUpnQXR4cjRzWVdSOTg1Mnc0cWo3a3hr?=
 =?utf-8?B?R1BDT1crS2VibmRWdmNtTnVCdVQzSkM3NTJQMnlBaUtWbkdpTDlYdFpVK2dP?=
 =?utf-8?B?V0lRT25zVER1c1E0RHdTNEdDd2ZSQXhhaDZ6bnNDa1BoeDJPNllpaS9adjYv?=
 =?utf-8?B?dmNqeWkzZEVoSDAwQlpCR2RsNUVtcnlYKzhHNHlNakhaQmthaUt6eHM5VnB3?=
 =?utf-8?B?RWVBTjlJRk9GTzFwSS9WdmxLQVgxQ1dxMklqRGhBaUlnNFRqVzhsMUQ3N2VI?=
 =?utf-8?B?OTdsV1RWT3FYQ0wvZHo3TlZXNi9RaStkNERCdXJ6UjJKOE5VSXVBL2g5L3lW?=
 =?utf-8?B?QU10UXc4NXZ4L0E0VThyOFh1bWlZRGM4MitEOHJsaXJKaEF5Ry9VUUtscnF6?=
 =?utf-8?B?bTBySmV0Z1BEa3A3VU9QZjZweDcxdittY1JZaXNhbmdldFJxZC9BbHJjNHYz?=
 =?utf-8?B?S0RXN2FwTWtxWnZ2YTNmQ2Y4Q3ZaWGY5UDNPTnljQVlic2huaHBKYlVZcFVX?=
 =?utf-8?B?RGtNcGVxbCtTeE84ZXZxQk5YSlVBbzJGUEI4TE56L1U1NDhYb1RYbXp3SE9Z?=
 =?utf-8?B?bTR5ajVLNWZYQTV4ell3bDVsUG02R3NEVGxHSmNxZ0p0Smw1aXpITlV0U2pj?=
 =?utf-8?B?b0xQVGN1U2tZdGJyTlJSR3VuUFlHekFZZjFveUFleHN6Y25vVEZod3JPbGZu?=
 =?utf-8?B?ZTNFc1laRHpwbCtXNkNwYk9LZG9taEhhR3pQVnZyZkpHMitFYkt2ZGJyN3ph?=
 =?utf-8?B?ZVMrTVVKWGlzclBDRWwxVFYzQWRSeXEzaUtDaTEyYkRzWGExRTdDRHo4eWty?=
 =?utf-8?B?a1ozaTlYR1g4RjRyR0NjcTlibGY0Q3dYRXdQQUt6dlNSdzBJM2hOWEFOc0p3?=
 =?utf-8?B?MzRxRGh1dVgxMmRjS1MyU3NSbEM1eHJwcGY5cFlETXU3bGVpMXBzRDZWYXYw?=
 =?utf-8?B?M3ozdjd4K2RjNWU3elVqeXRlRGtNWlhDSEJBVzJyZjBEUDA4NWxvV0FBdW1B?=
 =?utf-8?B?RkhCcjNGd2JzSzJ5UDFnNGQ1VytrVXdtYkJJdHUvTXAxb0dlZDhKUGZMRTRK?=
 =?utf-8?B?eWtrNUs2QXJMT3BZVjJ0TWxPS0R0ZGJhYk1FLzdDa21CVlhZRDF1ZDV0RVBR?=
 =?utf-8?B?QTRNOUwzKzBpWnQwZ3BZcm5LM0dwZHVFMHdxZXBCeUc2a1U5Rk9JRmhhN2xV?=
 =?utf-8?B?dU93L01QQ3pwN21EbW9KQWpDSW52NWhLWHhiTmlua2ZHRUs2bmRHYndZZVd5?=
 =?utf-8?B?MmtGaHJab1JJeGRVSG8wcVp5d1RHd3U1ZWNVNzMvSHREMjBUUmNZSWZiZFFD?=
 =?utf-8?B?NEd4UEVjNHpLcmpNb05KWGxzeHROYUFYZG03Y1B2SlREVUxMS3VWalpZL0RM?=
 =?utf-8?B?emJCRWN0aFBKb0Z5TG5hNDVxdGhTWFZsSTZqaDJGVDdkdjdLV3AwaTRwaHV3?=
 =?utf-8?B?blJkczhtbXhjMVRmMzc2VWJqdXB0cWROWmxONzNTeldKd1JSaEFSUjc5b05L?=
 =?utf-8?B?NmJOTTdPcHVsWEkvMTBCcW9tNDIycUVqWk5Hb1V6WlVCVnhqdXNVbThsVTMz?=
 =?utf-8?B?TEUyWExSaU9Kb2JORWZabVMxMnFwK0U3TVBkS3NNdTUzUzIxS3htWEJlNVhV?=
 =?utf-8?B?VEJ3WHhtMXM3ZlVhZWhRR1hrdGFveFNudzFOL3RtMVVnU2ZnZ2dzSmlWcjdQ?=
 =?utf-8?B?ZFJpU0c1NHVtS0ZkZFVNcUx2NVdYUy81ZTNvUW4xT29lNVpGN3hNR1Y0dUVh?=
 =?utf-8?B?QUljTWRGSHU2ajNDejdPdWh0RjNXZG1PbHA2OUdvUThZbHQwN1NMeHFiRkVt?=
 =?utf-8?B?NmEzY01aMzhKVm5uU3lnQXAxTFIrbmhUMisyUU9oY09GN2k0Sm03V2poTHFG?=
 =?utf-8?B?SVpaRnVrVWFzMko5aGhrYjR0aUY2N0lmM1RpYStIVms0SDFrb0dmSE1JOW4r?=
 =?utf-8?B?VkUzQWJGT2M1Zk4yTmRyN2NmMkNweHJxMlg3ck1sRXV3K0djZzk2NDc1bzU2?=
 =?utf-8?B?eGdLZUxtSEN4VktPTmZOOUxkakZyYnhrd3EvK2s4Y1R5Ky93WEpDZz09?=
X-Exchange-RoutingPolicyChecked: BfBAQStlvzEDl9bbew/Sgk6L4f5l1AaIErqL1YsJIwOf3pInVP3B6p3/H5CzG7cq1hfekX8dVbb5VgqC+tAz1Fav0wA5Y6+MxE0d8kVUZKitbSv8i1Lmi/9rksZ3aGBosDiRE6iJIrgzh4rMJpWjQEIl1Wbz/tHnqU4gzzdr4UsmZKjXQAZ6BYnWOalWN7Xxnp2/w74SAtjwR049T47O8/jwWi9zm10xMrJQX/qMR4oKYfERm39CZTavSfi0Hs0NtztwIj0Cpb2E2VpvwcQmDzJ43UNXaI0IL+rqDmicEu6Dvh+t25c+F8bwpjkEstY9p9X6R60h1HN3B1j/C80g/A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5af84881-4d46-4fde-c627-08df036dffd7
X-MS-Exchange-CrossTenant-AuthSource: LV0PR11MB9792.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 12:31:48.9608 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d2m2z3XJ5tqyn1lzY1zUms+yg97CfXQbAmqyk7DBHcCPkAgZD+zNRgcNIxV6zZ4w1EBfkETtQb9NTP8fx+MIyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5300
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


On 25-08-2026 00:11, Karthik Poosa wrote:
> Read the number of VRAM temperature sensor channels from the second byte
> of READ_THERMAL_CONFIG on CRI platforms. Use the reported count to avoid
> exposing hwmon attributes for unavailable VRAM temperature sensors, while
> retaining the maximum supported channel count on non-CRI platforms.
>
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_hwmon.c     | 35 ++++++++++++++++++++++++++-----
>   drivers/gpu/drm/xe/xe_pcode_api.h |  1 +
>   2 files changed, 31 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index 2c4eba4b8f8f..6e7cb250e628 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -39,7 +39,8 @@ enum xe_hwmon_reg_operation {
>   	REG_READ64,
>   };
>   
> -#define MAX_VRAM_CHANNELS      (16)
> +/* Maximum number of VRAM channels supported by Xe */
> +#define MAX_VRAM_CHANNELS      (80)
>   
>   enum xe_hwmon_channel {
>   	CHANNEL_CARD,
> @@ -48,6 +49,7 @@ enum xe_hwmon_channel {
>   	CHANNEL_MCTRL,
>   	CHANNEL_PCIE,
>   	CHANNEL_VRAM_N,
> +	/* Compile-time upper bound; actual channel count is hwmon->temp.vram_count */
>   	CHANNEL_VRAM_N_MAX = CHANNEL_VRAM_N + MAX_VRAM_CHANNELS - 1,
>   	CHANNEL_MAX,
>   };
> @@ -144,10 +146,12 @@ struct xe_hwmon_thermal_info {
>   	};
>   	/** @count: no of temperature sensors available for the platform */
>   	u8 count;
> +	/** @vram_count: number of VRAM temperature sensors available for the platform */
> +	u8 vram_count;
>   	/** @value: signed value from each sensor */
>   	s8 value[U8_MAX];
> -	/** @vram_label: vram label names */
> -	char vram_label[MAX_VRAM_CHANNELS][MAX_LABEL_SIZE];
> +	/** @vram_label: vram label names, dynamically allocated based on vram_count */
> +	char (*vram_label)[MAX_LABEL_SIZE];
>   };
>   
>   /**
> @@ -271,7 +275,7 @@ static struct xe_reg xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg
>   				return BMG_PACKAGE_TEMPERATURE;
>   			else if (channel == CHANNEL_VRAM)
>   				return BMG_VRAM_TEMPERATURE;
> -			else if (in_range(channel, CHANNEL_VRAM_N, MAX_VRAM_CHANNELS))
> +			else if (in_range(channel, CHANNEL_VRAM_N, hwmon->temp.vram_count))
>   				return BMG_VRAM_TEMPERATURE_N(channel - CHANNEL_VRAM_N);
>   		} else if (xe->info.platform == XE_DG2) {
>   			if (channel == CHANNEL_PKG)
> @@ -810,6 +814,17 @@ static int xe_hwmon_pcode_read_thermal_info(struct xe_hwmon *hwmon)
>   	drm_dbg(&hwmon->xe->drm, "thermal config count 0x%x\n", config);
>   	hwmon->temp.count = REG_FIELD_GET(TEMP_MASK, config);
>   
> +	if (hwmon->xe->info.platform >= XE_CRESCENTISLAND) {
> +		hwmon->temp.vram_count = REG_FIELD_GET(VRAM_COUNT_MASK, config);
> +		if (hwmon->temp.vram_count > MAX_VRAM_CHANNELS && hwmon->temp.vram_count) {
> +			drm_warn(&hwmon->xe->drm, "VRAM channel count %d exceeds max %d, clamping\n",
> +				 hwmon->temp.vram_count, MAX_VRAM_CHANNELS);
> +			hwmon->temp.vram_count = MAX_VRAM_CHANNELS;
> +		}
> +	} else {
> +		hwmon->temp.vram_count = 16; /* For older platforms, max is 16 VRAM channels */

I think better to add #define for this.

Thanks,
Badal

> +	}
> +
>   	return ret;
>   }
>   
> @@ -988,6 +1003,9 @@ static inline bool is_vram_ch_available(struct xe_hwmon *hwmon, int channel)
>   	u32 reg_val;
>   	u8 temp;
>   
> +	if (vram_id >= hwmon->temp.vram_count)
> +		return false;
> +
>   	vram_reg = xe_hwmon_get_reg(hwmon, REG_TEMP, channel);
>   	if (!xe_reg_is_valid(vram_reg))
>   		return false;
> @@ -1516,7 +1534,7 @@ static int xe_hwmon_read_label(struct device *dev,
>   			*str = "mctrl";
>   		else if (channel == CHANNEL_PCIE)
>   			*str = "pcie";
> -		else if (in_range(channel, CHANNEL_VRAM_N, MAX_VRAM_CHANNELS))
> +		else if (in_range(channel, CHANNEL_VRAM_N, hwmon->temp.vram_count))
>   			*str = hwmon->temp.vram_label[channel - CHANNEL_VRAM_N];
>   		return 0;
>   	case hwmon_power:
> @@ -1645,6 +1663,13 @@ int xe_hwmon_register(struct xe_device *xe)
>   
>   	xe_hwmon_get_preregistration_info(hwmon);
>   
> +	hwmon->temp.vram_label = devm_kcalloc(dev, hwmon->temp.vram_count,
> +					      MAX_LABEL_SIZE, GFP_KERNEL);
> +	if (!hwmon->temp.vram_label) {
> +		xe->hwmon = NULL;
> +		return -ENOMEM;
> +	}
> +
>   	drm_dbg(&xe->drm, "Register xe hwmon interface\n");
>   
>   	/*  hwmon_dev points to device hwmon<i> */
> diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
> index 94575c476e3d..e1079eff72c6 100644
> --- a/drivers/gpu/drm/xe/xe_pcode_api.h
> +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
> @@ -57,6 +57,7 @@
>   #define   PCODE_THERMAL_INFO			0x25
>   #define     READ_THERMAL_LIMITS			0x0
>   #define     READ_THERMAL_CONFIG			0x1
> +#define       VRAM_COUNT_MASK			REG_GENMASK(15, 8)
>   #define     READ_THERMAL_DATA			0x2
>   #define       PCIE_SENSOR_GROUP_ID		0x2
>   #define       PCIE_SENSOR_MASK			REG_GENMASK(31, 16)

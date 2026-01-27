Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 261CFD2F00B
	for <intel-xe@archiver.kernel.org>; Tue, 27 Jan 2026 12:41:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD38F10E21A;
	Tue, 27 Jan 2026 12:41:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iAhLcRgq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C27A10E21A
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Jan 2026 12:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769517685; x=1801053685;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=4xAySm6TBnYEn5aaruXx7iKP9oJnVuXalifoG/A0kD0=;
 b=iAhLcRgqdnjIYwkoTe2bYE5PUaydLEL0rl9+/wD+5lZf//WMrbxbbSPV
 K7C/VpBOMTCWKCQFBfkgkUeiWrYoCJ0qWwZ+jJLwZQhVAxpxvUWucrO7y
 budzhHiuvA+u9HISSgzY1wiqlccF35e7qAi5ju0uu/MwB8MDPizsmIVHT
 sSrUrbzha6c95vKxGQ9QZmkk1WoOHJZbxvtyJ/Uaj/JJHLCycFiipIQ6l
 0PXZU/iuEjOcu1x7vx1RHgaOryrlt5RtdiZzsWP1DJqhXUbomDGh9W2YL
 X2qis4iQOKCoQ4yeHJZmksUrTcXWGwTviL3DV430jtlzMjRAQJaUV9ZDB w==;
X-CSE-ConnectionGUID: uWpXmS/GSNC5xkZq8iSrmA==
X-CSE-MsgGUID: SD6Wp2hUQd6ASMs3pOMJMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="69910511"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="69910511"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 04:41:25 -0800
X-CSE-ConnectionGUID: s5kMwyprScCJjV1W9Pr7Ww==
X-CSE-MsgGUID: NUMwle7wTgCcUjF1oh66OA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="208330716"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 04:41:25 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 27 Jan 2026 04:41:24 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 27 Jan 2026 04:41:24 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.51) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 27 Jan 2026 04:41:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QNODD2A6c6LbNhJW6VFkHnCzzoryd+G1oZ2DagjN6pFA9bw3kBk6mRhRiyXArzqeFkM0vbXP022c3UDw2Dy8zSsgCis3aBLOqmGAH3CndK2PpDmDSGkQfb5pd+upxu7+pxiB1eSBjvRfoh0AJkbS8strBrrj1kcQKmLyTGjfrgS31w7HMW6qmIY3UK4DSaiN88B1XGCLPHu4iZXzcj7GsG3wsTp98BXDZyTT2c4bW9LR4GF9VnKKb1+ov2HUeTN+aG5aCO1mWNX8Jup0W+zxwWxp2o2XGKRP2Mv1y26Dp05AbA08zkWCw9nFXbTauDyarMq91qgpVGfi7jSicJYdcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lbU8jO1A5qF92poveXYHW484kGu0go5HdpAEsv8Ffmk=;
 b=LywR5XTEV3ZlwSRHdxZJmwbEhRKm83OJdpMHrSSUBMExLZIrGgEDRE/T7RUaf536JFdVY8qC6cP5RxfKx31dLsE4K2lLEl9hhsKh5SSvgzybkss9/YeuC1Rgvb9WvjibxSojEBEcCnM9dt9mCBpJVt46Jd6Iw6ibCe32OQl3nJiXYp6uAHcr6E+R4eMsqmgVUk0I803QyVG/Y2b4H1uStDBQ4gIPgcHnJI0LhjZPyqY7VcwQdLcLGkSwpExyTVrea+xbPnJnNm3qiSuir+Do3KeSXFUoKAXxFdePkY2hwC3DNSeOIodI6JWE1kY6aBHc8VP/h2BD1vi2f5NaGfbG8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by DS7PR11MB5992.namprd11.prod.outlook.com (2603:10b6:8:73::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Tue, 27 Jan
 2026 12:41:17 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%5]) with mapi id 15.20.9542.010; Tue, 27 Jan 2026
 12:41:17 +0000
Message-ID: <58c5f662-a150-4295-bf20-27e1ed748126@intel.com>
Date: Tue, 27 Jan 2026 18:11:04 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/8] drm/xe/xe_ras: Initialize Uncorrectable AER Registers
To: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <badal.nilawar@intel.com>,
 <raag.jadav@intel.com>, <ravi.kishore.koppuravuri@intel.com>
References: <20260122100613.3631582-10-riana.tauro@intel.com>
 <20260122100613.3631582-15-riana.tauro@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20260122100613.3631582-15-riana.tauro@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0062.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::20) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|DS7PR11MB5992:EE_
X-MS-Office365-Filtering-Correlation-Id: 25c64976-b986-4294-6239-08de5da15d58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TUhYRWl2cmF1Mi9jR3FnZHhKU2duR2piNjFNWExpajhaOXRSSS9JUDB4UUJv?=
 =?utf-8?B?aEJWVTVha1kwbVZzVkNrUlNqWUtVRHZIYlRLWlpBcVFOVGV2NHUvNmUrQWRF?=
 =?utf-8?B?bFRnWFBHNjV6UDhtdTB5Sy91dTg3RkZGYUdua0p2TXlwcjE2MEJkY1djdHp5?=
 =?utf-8?B?K2NBSEJIV0g2TUlYN2Z3WXF3MWVWdnpPdWtOdk1mUnR4MWRpaklNc1pwT014?=
 =?utf-8?B?dk1UcTlCYVJQU3ZyL1NiZS9yNC80ZnpLRHVXSkRTdjd2alZvdlM4K29iVGlI?=
 =?utf-8?B?TENIRGVWdjJ6Z2cwUWFXRkpOMmZTMTVPeVR3bWhGUnNuWHVHNUxqeXBEUFdE?=
 =?utf-8?B?ZW94L2tFdzFxL3BXZ3hkUzNkWCtMWHJBSUlyZVJmL2JsclIxQTNnTW9WaENI?=
 =?utf-8?B?M0xnSGNhOEZUUDV6VXFaNXE3OTh1TFpzU3h3SHR5QzlXZFBKNVFSdFY0V2Q3?=
 =?utf-8?B?THF4QmxmbDNzckJ6VGVGQ3N5MWtxaVpXeEVWeVhCNW1mU1ZqWUtYZlFwTVNQ?=
 =?utf-8?B?WEhvSGdyK0ZxU3RtMDJ5K01XSlRKM3p5a3FrbWNVSklaN0hDVkVOd3UyWmpw?=
 =?utf-8?B?aXpNeEFLSW5ZS1B5VUdRY0NENTdRbDB5OHcvRk13MXp3RU54M1BybThpaUxJ?=
 =?utf-8?B?QXhUR2J1eFdLT2lWWnR5M2FXU1RXcXVSdWtSaTU4eHo1bmI1T0wyQTdwWXFr?=
 =?utf-8?B?bFRnUjRQSXpNdHNBZnh4RUN4eENmamI0MEl4ZU91WGJ6dUZHaXF1dDZkYUI5?=
 =?utf-8?B?cllTdlNuZWhwMGlpbXU5WUFONWpMaG52VXpyc2VqR3hyUzJRMGVqV3RNWFpH?=
 =?utf-8?B?d1lYcm5ZejB5Rk5TblVtcWkvREplTHNyRWx2bmRRdE5qRnp4cEYrU0xReTN3?=
 =?utf-8?B?bXUra1JqZGJhT1U0Sk0xMUZvMko2RU1HU1FDZ0xhU0t4UkxZWVNrVGh6RnRq?=
 =?utf-8?B?empHcnJ2dWR3UjJjbklWczd0WllRdjh6L2daK1lLcUhBNzJTUDlCcE44ZDJV?=
 =?utf-8?B?dUtGTVp1WkNlNlhjeCtHRldqc2QvZjI1b3dzd3dJUEsrc0NXcTBlSStKRy9O?=
 =?utf-8?B?NFl6NEZIZysvY2dRN1Y4MUpJNmlOY2V6c3NxNmlSaDZ3RlpXcUJ5TXRaMDND?=
 =?utf-8?B?UTQwUFdLT01TWkdidE5lQ2ZoQzJTcy9HdGFqemJYY0ovRE51TmlxNVVlUTdK?=
 =?utf-8?B?aldVV3FSdWU5bENsTkJyekN5NDVwdDk3NHBFdEdheEJCclZMR1MxamMwZ2VG?=
 =?utf-8?B?aDB0VkUwVkQrRk56S0tsNzJ2eG1UcERRbi9pcXVsVGFER0NHVmxHcitYUmJX?=
 =?utf-8?B?WTQ4eHlRNThMb1hSSVJqT2Y5MHg5QUM1dVlPMk44QUlvekp5dFRlS3J2aUc3?=
 =?utf-8?B?aW5iNTF2Q0dzV0xxMlZVaUNwVHpwUmw2YzBnQVNrUEFzRThwMmpraEJyQ1dJ?=
 =?utf-8?B?L01ZSmdvR3l6ZzJ3cDdXcDFrcVdRYlQrbDl1L1p4cElrWFREbHI1T2gxVkp3?=
 =?utf-8?B?b1JWZUNuaWNmc2pTSzVBQjlzVEhBak85VThmclVQUGI0M29neTdKODFqT3N2?=
 =?utf-8?B?dUdqbWM2RnJjaDdaSk96czhhRDZ3UlJHZk82TlRZZmhxMk9aR1lVOHlHK3F2?=
 =?utf-8?B?QTJqTW1CNjdKclUva1RHaVlkMEVPVitLTWJlYjFJK1U5Z3V1Ynh6ZFBVeng1?=
 =?utf-8?B?M1g1a3lRSENmRm5MOFo0ekRuZ2JSZGt5YVVXeEZxUmJVQnRqVXZhZVVlM290?=
 =?utf-8?B?Q3h1aElUNVJNaXNJeHNtMDdNOEFkcEFQWWYvY09PYzJaVlJRa2lQQzhMQm01?=
 =?utf-8?B?aHR1eE5yWFRZTFRUSzQvWS96amI0T291dGw5M3U0WDhORmoxeUFRRE5VMjJn?=
 =?utf-8?B?NnVSVTk0ZDF3Z1kyOGIyTTlqUktKNExHWGg3elZ1T0hsSzBHQUFUR1V4RGZE?=
 =?utf-8?B?U2NWQlpzTE42UUJEQlZtWmh6eHVjci9wMk9ibCtIbkp0NUUyT1VwamE2bTF6?=
 =?utf-8?B?VnBIdUoxSWQ5Sk5GWm9vUkpqTmE0aGEweFRMSU0rQ1A4dWgrZ3ZBcGo0cDA2?=
 =?utf-8?B?bElRZnk5WktlUlNWcTd3L1h6Znk5OXRORDZuL0pzUFpiQzlSMDNCcUNGeXNM?=
 =?utf-8?Q?2k+A=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZzVpdS9hR0dBd2pibXlYajlRRDJmcVVnVmtYeWtmWDNRV0RJUjdSancxWm56?=
 =?utf-8?B?ZUpILzJGZzBYL25RZFhTSE5qZWVuWUdhV1JSRWJLaTRoQVlkbzEyd2lsZEcz?=
 =?utf-8?B?L2JhaDJrQldBZ0FPS2RzdkZmaVlKbTMwOXZ2MjdlNk1RNWdNNkFxOEtDeGhR?=
 =?utf-8?B?blYyVG9KVExOTmV2c3VLV3ltMzFmU0svMy9iY3diM1ppYXJNR3JGcStDbUVa?=
 =?utf-8?B?ekFFZ0tnMThwZWFBaWFiNklZWDhTckxkd25MT1RmS01iZjV3MUxBT2ZISWRa?=
 =?utf-8?B?bjBBTUw5UVpiandUWUdseHBFNFphVnVPaTJMU1p2MXYrZE5Sa05acXJ5bGwz?=
 =?utf-8?B?ZUFZc2RkdUthbUYvbTNoNytRQXhBSGd1L01vTXloSzZzL3d4QkFCSTdVUmhG?=
 =?utf-8?B?U3l2RFZ4TndLa3ZUY1VNZXFKdkFDWW9mTWpJdnUySGtITm5XbzNEdWV3VmN2?=
 =?utf-8?B?SCsxOHFwT3p0WWpOencrcGQwOXhYTG90U0FlWTd2cDdSQW80L1NVSUlFOW5U?=
 =?utf-8?B?TFV1R1RLTEVXOHplbFRKemNRUjZUYnVrQkxRM2JiN2FxNVdyeHdlMHY4NWdL?=
 =?utf-8?B?VmRmSGFRN0ZoU0Q5M215THVSbnorcUw1QW96TkhOTkRFcFZuaWh2YXlZa3Nk?=
 =?utf-8?B?TEhkcHFCMHM0cGtjdHJIRDl5M3dCUTB0ZXQ0RHBOcXA2SEhGWE02U0FTTGQ4?=
 =?utf-8?B?NW81dEprVGhtcEk0cEZJQ0JOdHYzZzhidnhLVk9LZ1ArWEVyK3k5RGJjcmpi?=
 =?utf-8?B?TFd2RXZOaFQzbkNLak1VTXhybkg2QXR1TzBRaS8zRDlxa1FQOGlhbURTdWZl?=
 =?utf-8?B?LytDU243K1FzL1JaRVhCUXhJQ1RVYkkrL1RmVENkY2FrMXRxenBveUc4cHlH?=
 =?utf-8?B?bUxpV2prUUdxS3NlZ2dCV21KN2djR0ViSjd4MHZPallneWFsdWJITWY4aEQr?=
 =?utf-8?B?V3BpNE16RVI3TFYyK251TnpVOXNpV0I3T3k5RHQ2amJHRTE4TzhEQUJ4SlZy?=
 =?utf-8?B?SFovKy9PY09BZ3g4MGRmNXdNUW5JSmpxbDhZZjVLU0pOczg3NWJxMDZXWlc5?=
 =?utf-8?B?WTNVM3ppZTl4WjdMS0FNS1pxV0ZoWEpyME5YVFJOT1lVWStyQ0dZa0Z4OUZR?=
 =?utf-8?B?NEN4NWN3aitrbk1QYzVmQ2hWS1BjSFlKV0NnYUgvR2hJaU8xNXBhRitIaTVK?=
 =?utf-8?B?Zlh0OFBhYXdGTnN4ZHo0Wkt4N1BqOU5qYnRBODZPRkk0c2plK0hRblhjU3NX?=
 =?utf-8?B?WjYwR3pINW9DWEFPV1FCajIzcitnbSs1SFhobHk4VjBzRmtjWis5WHNQZVpB?=
 =?utf-8?B?THlFWmdhYVFRMkp5bzBQdk1UYll2QytUZDg3NDdLZHp3bi9EUDVYQjBLQ1hu?=
 =?utf-8?B?RnkvU3U3cFNCVVEzNTV4b2QwVUVWbHBYTWRWaHhsQ1BNb21vNzFvWHcwajlv?=
 =?utf-8?B?bm5GZzBKSzl6WW9SUWJ5NHY5U1Fkb2lEdWFtY3FFc3dHV2xnNmE5WVhodU1M?=
 =?utf-8?B?c2NpQ3Q5b0ptV3ZwUjgxTXBncTJQMy9PVFhGRUU2R3A4aWpWZmg4bkFhTTNB?=
 =?utf-8?B?TDJienVyblY3LzNIM3JtcCtVeW9ZVG43ZE1BZmQxN1ptN2QrMzFqeWZZTStZ?=
 =?utf-8?B?dytqdVJZcU9rRVNBVXZTdjEzZG4vWEt1M3E0S3NEWWtWWFdZRFJ2U0c5ZE1W?=
 =?utf-8?B?TEFxQ0NjS0V1bi9KU3BVNUNnMzBBUlpMeDZyaVZFRzFFUmlpRUF4MFpDVlRJ?=
 =?utf-8?B?bklZZVN0NG1ERTBjS1FkcUlud3NhUUtpd05HNUpvT1hyR003T0hwZU5xZkFB?=
 =?utf-8?B?ZGZiMVNzVjZUQ2ZhTTUzcm1qMklSZHNrUXRrZnA3Y09JeHF4c3AyWUwzNFRz?=
 =?utf-8?B?Znhwdndhd1RJdHR4YTJPU3lKNVIxY2V5MmJqRjhYOS8wVUlKUFlCbmhRWEJM?=
 =?utf-8?B?RU1vSmVFVWN0djFZM2daR3gyNFNNdUtndDlWSno5YkFsQmZ6WGNqUVUzanJP?=
 =?utf-8?B?SE5WVFVEUm9LdU1TeElkMVg0U3lDOXlpMmhIMTAvemNMZ1pEeFJuK05JbmM5?=
 =?utf-8?B?NTYrTVVuM2d5aEg0WFlROHd0ZHZVNjJxMXEzaklNbEtpVG9FVnNtTmx6STNM?=
 =?utf-8?B?YjZkYVdWZ0Jobk81cVc2SjhKVWVVLytmTDdWaTQwYitKcHZSdXgxRXNpZHN0?=
 =?utf-8?B?MFNudTEwRWxqN2NIMkFoeklYNU4raVpCOFlHdTVFYXRod1luSnFiUFI0VERZ?=
 =?utf-8?B?Y1g2WDcvclVIdjJTbjNVN1NENTAzaXd1cWJybnBQbjc3SjkxQ0NjSG5tNmtn?=
 =?utf-8?B?Tks5RFVRLzZ0cWJsamtweDRZNW53N2pKNnQwaHV6VGVlTFlaZktGdlVHWWd3?=
 =?utf-8?Q?7mneUle8dR7q6a5I=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 25c64976-b986-4294-6239-08de5da15d58
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 12:41:17.4208 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gKkwixLp1T4EJi12CRT4wLWf6M8o3hq+Em8Ks4jmQvV2DBIpUD11T5n+xF2kvyhFaS+m0HUfxdChqlGaZ2ne9it47+8XVdqg1+uy5O3r4+4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB5992
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

Hi Riana,

On 22-01-2026 03:36 pm, Riana Tauro wrote:
> Uncorrectable errors from different endpoints in the device are steered to
> the USP which is a PCI Advanced Error Reporting (AER) Compliant device.
> Downgrade all the errors to non-fatal to prevent PCIe bus driver
> from triggering a Secondary Bus Reset (SBR). This allows error
> detection, containment and recovery in the driver.
>
> The Uncorrectable Error Severity Register has the 'Uncorrectable
> Internal Error Severity' set to fatal by default. Set this to
> non-fatal and unmask the error.
>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>   drivers/gpu/drm/xe/Makefile    |  1 +
>   drivers/gpu/drm/xe/xe_device.c |  3 ++
>   drivers/gpu/drm/xe/xe_ras.c    | 71 ++++++++++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_ras.h    | 13 +++++++
>   4 files changed, 88 insertions(+)
>   create mode 100644 drivers/gpu/drm/xe/xe_ras.c
>   create mode 100644 drivers/gpu/drm/xe/xe_ras.h
>
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 5581f2180b5c..85ec53eb0b62 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -110,6 +110,7 @@ xe-y += xe_bb.o \
>   	xe_pxp_debugfs.o \
>   	xe_pxp_submit.o \
>   	xe_query.o \
> +	xe_ras.o \
>   	xe_range_fence.o \
>   	xe_reg_sr.o \
>   	xe_reg_whitelist.o \
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index f418ebf04f0f..be89ffc9eade 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -59,6 +59,7 @@
>   #include "xe_psmi.h"
>   #include "xe_pxp.h"
>   #include "xe_query.h"
> +#include "xe_ras.h"
>   #include "xe_shrinker.h"
>   #include "xe_soc_remapper.h"
>   #include "xe_survivability_mode.h"
> @@ -1019,6 +1020,8 @@ int xe_device_probe(struct xe_device *xe)
>   
>   	xe_vsec_init(xe);
>   
> +	xe_ras_init(xe);
> +
>   	err = xe_sriov_init_late(xe);
>   	if (err)
>   		goto err_unregister_display;
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> new file mode 100644
> index 000000000000..ba5ed37aed28
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -0,0 +1,71 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +#include <linux/pci.h>
> +
> +#include "xe_device_types.h"
> +#include "xe_ras.h"
> +
> +#ifdef CONFIG_PCIEAER
> +static void unmask_and_downgrade_internal_error(struct xe_device *xe)
> +{
> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> +	struct pci_dev *vsp, *usp;
> +	u32 aer_uncorr_sev, aer_uncorr_mask;
> +	u16 aer_cap;
> +
> +	 /* Gfx Device Hierarchy: USP-->VSP-->SGunit */
> +	vsp = pci_upstream_bridge(pdev);
> +	if (!vsp)
> +		return;
> +
> +	usp = pci_upstream_bridge(vsp);
> +	if (!usp)
> +		return;
> +
> +	aer_cap = usp->aer_cap;
> +
> +	if (!aer_cap)
> +		return;
> +
> +	/*
> +	 * All errors are steered to USP which is a PCIe AER Complaint device.
> +	 * Downgrade all the errors to non-fatal to prevent PCIe bus driver
> +	 * from triggering a Secondary Bus Reset (SBR). This allows error
> +	 * detection, containment and recovery in the driver.
> +	 *
> +	 * The Uncorrectable Error Severity Register has the 'Uncorrectable
> +	 * Internal Error Severity' set to fatal by default. Set this to
> +	 * non-fatal and unmask the error.
> +	 */
> +
> +	/* Initialize Uncorrectable Error Severity Register */
> +	pci_read_config_dword(usp, aer_cap + PCI_ERR_UNCOR_SEVER, &aer_uncorr_sev);
> +	aer_uncorr_sev &= ~PCI_ERR_UNC_INTN;
> +	pci_write_config_dword(usp, aer_cap + PCI_ERR_UNCOR_SEVER, aer_uncorr_sev);
> +
> +	/* Initialize Uncorrectable Error Mask Register */
> +	pci_read_config_dword(usp, aer_cap + PCI_ERR_UNCOR_MASK, &aer_uncorr_mask);
> +	aer_uncorr_mask &= ~PCI_ERR_UNC_INTN;
> +	pci_write_config_dword(usp, aer_cap + PCI_ERR_UNCOR_MASK, aer_uncorr_mask);
> +
> +	pci_save_state(usp);
> +}

What happens when upstrean switch port is shared across another device 
(another GPU / NVMe drive) etc.

Thanks,

-/Mallesh

> +#endif
> +
> +/**
> + * xe_ras_init - Initialize Xe RAS
> + * @xe: xe device instance
> + *
> + * Initialize Xe RAS
> + */
> +void xe_ras_init(struct xe_device *xe)
> +{
> +	if (!xe->info.has_sysctrl)
> +		return;
> +
> +#ifdef CONFIG_PCIEAER
> +	unmask_and_downgrade_internal_error(xe);
> +#endif
> +}
> diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h
> new file mode 100644
> index 000000000000..14cb973603e7
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_ras.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef _XE_RAS_H_
> +#define _XE_RAS_H_
> +
> +struct xe_device;
> +
> +void xe_ras_init(struct xe_device *xe);
> +
> +#endif

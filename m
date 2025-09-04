Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CFCECA1013
	for <intel-xe@archiver.kernel.org>; Thu,  4 Sep 2025 15:59:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04FE310E045;
	Thu,  4 Sep 2025 15:59:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g0Fh7eFB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7316B89226
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Sep 2025 15:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757001575; x=1788537575;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+WQaEMuHHQhygkAG0gv7zOw+bFuidy2T8goWl+ni698=;
 b=g0Fh7eFBka6/TePfKmWk/3vh+kKnRmICS/XCm+uhSu00fLv/mtWkMePq
 PMa4w/cFEZzb1HKA/O0UGSSpL3M9I1L7XAIbzw6bf2AJr3gb/ry8/uVdj
 kJB2sTi4SV6YCqyWfV6fbq4cMdhmQOxwNYe0ocmWyj3R1J2ICj6sblDeP
 /QrXWWWUbmy3mEM8dmdJ+BWX7VzzbeNd3Yu3adtLkvUWWU9819phed2Oo
 Owc0Tf1TzEejCs9GIif2kEBOeiwLH5HyMqOcwsT//mAajVJ8O9Lzegq8e
 u5B8gpybq3LW0jgybndE8osZiZTXIVfMJ1XExTc71NIqaDh24r9l5/Pi0 A==;
X-CSE-ConnectionGUID: 7lpU3NMvT1aWAGIP2fyrAA==
X-CSE-MsgGUID: KJ1azntgRP2M1G5GZvfhog==
X-IronPort-AV: E=McAfee;i="6800,10657,11543"; a="59203878"
X-IronPort-AV: E=Sophos;i="6.18,238,1751266800"; d="scan'208";a="59203878"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2025 08:59:34 -0700
X-CSE-ConnectionGUID: gUWHurPRSxeH0455qPRjjQ==
X-CSE-MsgGUID: //OPBu+bQUOmduO/6qI2BA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,238,1751266800"; d="scan'208";a="195581373"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2025 08:59:34 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 4 Sep 2025 08:59:33 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 4 Sep 2025 08:59:33 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.58)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 4 Sep 2025 08:59:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tuxrl/tRqZP0kf8UAypn41khRMwS0lOFBH+DOt7k+lxLnZPGylMZWnqPpcPsyjVXqUcUHmF17mmC/zCc5kl3CXKh4ysiplVQKYuxFlvH9fgWBZxfRwkWFOfc2HOTADhVKnWPMxbBphLzx2kdfUTDeTPemtzbcY7ropjlJYr1vlDxUZlYFZkEGcW0GMym3c1wd0sXG1qZtaNZtp4rnSX92FByA2fl0zRRfOagdPxzau/WflU6dQpXtYACj9SQ3Xw5conMNLNzgMDZ1aQVFcxIQWh6QtdgJ7SDg+F7C1XIg5sa6KAEFns2ipJPGRkqdkYJ++iOEx2TbqGUSkUePWHZjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Eqjg97U0cba+sM0uE5YsdGJ1q6hBEpDo6bPrt3Uk0Q=;
 b=TKX+WBfxWW8PxjHyshuumxHUsChNbhk6bYaI+geWXz4Dm/ldblE8G9ms0/6jxVD3iWCrrERkAKW0iHdOjLHkjr7zhpDtnDgXGhf5gMxZUnheBaBBgo+FETkFb5zTUrN9sIeeDZ0NajfborjBzW4QUMGbssLs0EzDZgt9eqNfHbqhPmUS/t/fUZhQ09Ybw9RWdveyjRa5VTv1VoBYHpnf+XQK980hyoMUlkjZoJ7n133g0niFBJZ5fffZ3hseTMifare68P6jsMbY0L/TAkB5TmiAFKkUJXaON3/3ei2HQIwEGhVhLydYfLyCuHOvmZYtDl4kwGtLQNvb+gdaWvmaJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8695.namprd11.prod.outlook.com (2603:10b6:408:211::15)
 by SJ0PR11MB5939.namprd11.prod.outlook.com (2603:10b6:a03:42e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Thu, 4 Sep
 2025 15:59:30 +0000
Received: from LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541]) by LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541%2]) with mapi id 15.20.9094.017; Thu, 4 Sep 2025
 15:59:30 +0000
Message-ID: <b48b9866-a0fc-48b2-b305-f6ce0860b13f@intel.com>
Date: Thu, 4 Sep 2025 21:29:23 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Fix broken kernel-doc for the struct xe_bo
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>
References: <20250904144026.7222-1-michal.wajdeczko@intel.com>
Content-Language: en-US
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
In-Reply-To: <20250904144026.7222-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0150.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::20) To LV3PR11MB8695.namprd11.prod.outlook.com
 (2603:10b6:408:211::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8695:EE_|SJ0PR11MB5939:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b1c8a80-e785-4f1f-93bb-08ddebcc0819
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S05TYWFoeis4MVdKQlRCSjM1OGN4aERTY09Yd3kwRWtLK2laSWcyQjhNNVFN?=
 =?utf-8?B?NERIdGUzcVN0VFpCZDRnaTBkMEVEUFM4NjE3aHVVeGQ3bzJIb3FXVmNKUEtr?=
 =?utf-8?B?YXlvS1VldmxOY25RSjh4dFFGTU5aM0FIT3hxVTVJWWN2bVpRYlBJR3hoSmx4?=
 =?utf-8?B?SDA3NGllUVhpSHcyZ2N6WHJRVG9sclZoYk81VWVvMXpiRkFNbG0ybzVRcDR0?=
 =?utf-8?B?c1FqOEE5T3ZLQ0MwYlFSWnYraVNPeFJ6cDhhUmIvR0NSVDhhMEZISnlYWFg5?=
 =?utf-8?B?NnFnbS9BQzA2MG03MHJCNG4rZ0g0K1BNWHRDbFFCdUhwZWlscWpHT2pvMjBs?=
 =?utf-8?B?U1VFNy9mb2RXbSs2S0lMVDVRdTRwMlVRYTYyM0cxelBsOEdGaDlEend2dGZU?=
 =?utf-8?B?VzdqcGxDV2IrVXZndmdiRDd4RTNZR3YyTDdaVlBvcXdRWHI1YVNyNlpFRDMz?=
 =?utf-8?B?NzIyTzJjakRoQkQvTjVPdStiYlFzV0lmNnpzRExpTHN2Ymt4T1p5cGcrNk1E?=
 =?utf-8?B?aXRqMGR6L1hvUTA5SnM0SzRsYm4zRFZudVE0SzZVNEE3aVhRVUFjSEVQVTlP?=
 =?utf-8?B?clU0dWZBQmF2dkVwWm5jbWI3MStOSndnZ0tJa00rcTVSWjJhbVF4eHJWdkV5?=
 =?utf-8?B?VG0xTzBJN2lVcTJqY3c4WFJZNk1aV0c2T0ZUVXA1bVZxYWltNnRPZGFlMWRG?=
 =?utf-8?B?RDNBSXppVFlZWEJQUXVXN0JyR0pTeWdNZ2dhUUhYZmZQTzJMaHBUc1VSL3dx?=
 =?utf-8?B?WVZNdng2WWtFTFhZZGRmblNlZVFESG9vYlNidCtTTG5pSzd5bVpVUS9Gclhn?=
 =?utf-8?B?R2dtWmVEOEU4L2JibloyY0I4UFliR1lLdmdlRjVxakFDUVVTQWNBMjZ2STdz?=
 =?utf-8?B?U2YydFNsbnkyVTkvb3NYbzl0bmp5dGRoajYyNE4wUGtPcVdvZGEvenJHNkpp?=
 =?utf-8?B?QVk4VzdCNkxTd0lCUXlCWUdBVmw0UTdKOVprcFJTY0pUQ0p1YTJIaFl5NUpF?=
 =?utf-8?B?b0pUa0wyMTh4Y3QwU05qd013RHdlTW9IQkNPUE9rbkNkWEFqcFp2UTdCNFRC?=
 =?utf-8?B?K1JxUURZVDdaNVJsK2dERDluaGdCUFo5OExRY0Y5V1NmcVpMczJSaVlxYXFV?=
 =?utf-8?B?UjJjeTVIekRlVVhreW9SWU44SHdndzRTdkhWS09rV1ZlY2lXQXFyUGwvNnFR?=
 =?utf-8?B?cFFhVThubEFWZWhJK2JMMlNJT3hRbHJwTzN5TFM1UEI5V3pDSlA4UXJZenN4?=
 =?utf-8?B?S2tXTVYxMHJNY3BMVmJRT1IvOWdNL3J4K0U0OFlCWTFnUGRUTEVHMDF1OUtZ?=
 =?utf-8?B?TTl4dGVSRlJUUkFuRjVMSW9wMzBsM3JKTlVmZHkxNWZkdmpiYkJBbGsxTkxv?=
 =?utf-8?B?VmFoZzhPVWg4aEpLbTFza2d6MWZ0cHNST1R1MnpIMlQ1enRvNnljdlQ2V2g2?=
 =?utf-8?B?TGkyQ0JpMU4vY1J5M01XZDZ3bGxiaUtWRzl1SWJCa0IxYlZOOGZTUEJJZnpu?=
 =?utf-8?B?US84c002ejliUThzQzBPNTYwNU1mMVFHczJ5MmVodkJOOVdWdk0xRjh0bnB4?=
 =?utf-8?B?b0JldFYwUUdDWHVZM2dQMlIwcTBFSEU1R0RrUFZ5eVVMU1R6ZDNXVjJ2VE1C?=
 =?utf-8?B?RDR4R1hJckJ4TCtGeFg0SThyK1pzYzZBUUtSWlg4eWpub09mazBFTTN2Rzdt?=
 =?utf-8?B?SkMyVkgwdzRBcWpJVVEvaG5meDZlS3Jxc1ZyUGtUbCswdzlQN2pXUXB1UDAx?=
 =?utf-8?B?WlZuWEJWempGRGludDV0QUpSYXhxNG5BN282cjhWanhlOTQ4N254SzVDdEE0?=
 =?utf-8?B?djlsb0lIV2llYWwzVFZZajdWODN2WEY5QzNXRlRGQmpwdWU0U3c0OWJzUGNU?=
 =?utf-8?B?TFVDVHhnSTVYd2t0NDk1OGI2Q1NvZVcyZ0hPQjJhb1V6VWVPSXpLZHRWQW5N?=
 =?utf-8?Q?BTCZPVmb20Y=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8695.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YU9POGMzU2xBWWpsQWlDUWFSWldub0dnWXlDcEIydWpKM3dYTlFSMVY2WXlW?=
 =?utf-8?B?dHFVWnU2SlZwekIzQU1QY081WGEveEZZUlp3UjhtZklDL3FYUlBpeTNBM3JJ?=
 =?utf-8?B?Mm1YRmV6OVdkcFNWZ1l5TVNyU09RbDRyR2JKSW0vQk5STG9RdVhza1VsTzdD?=
 =?utf-8?B?L0hWeHZHNDdDckN1VktZY05wMmxGRzhLYnBsVDA0bFk3VFlUcGNXWXVKM0R0?=
 =?utf-8?B?bXFoU1VDNWRtaGQrbnRReHJTZFd2ZjRvZTN6OTdkSzZVeTNKeGloUnJQTERN?=
 =?utf-8?B?S0tkYVExNHlhTlNyZUNpSTJjdlQ1VkRTZmkwZXJwa1h0RE45dmVabGNFTm81?=
 =?utf-8?B?WGZXWmZJNXJGYXQwUkhPKzVkZXBPZ3Y4d3JaR3ZzMTlsWmhSNFd6WndycWly?=
 =?utf-8?B?WnphS0pKczZXVGZPeWpUT0hLbEVFcVdPZVhBcGhqVlMrUkt0ZlhodFNXRTJU?=
 =?utf-8?B?ODZPZmV5NlR3SU51amNXSi9ERW9LaWNFTEU2U0Y0bDBxcWY3ZGJxanBnUmFV?=
 =?utf-8?B?OVhML0lWK2Z4QU9BeGZqUW9WR3diU2gyQ3pUbi9PNXFRTW5IMHhaNFpzeW5a?=
 =?utf-8?B?cXduOGRTUUR3UFFGVy9FWGxlSEs0V3Q3cHFBSzFiQUMvay9yMkRONnBhNzZM?=
 =?utf-8?B?bmhEOEJPRDVSWGRXU3hjb1BEQ1JidGFUV1hReWx5S3pDaWtBUmRiTTYyMTdI?=
 =?utf-8?B?S2JUZVA4cWxHbEhnQ0hvR1hvOHJ5Q2hzL25lS1BMb0oxRHY3T1R4WUY5NUE3?=
 =?utf-8?B?K0gyS0dKbzZQcGhzWnNreXFsRVBJMllPalMrVnpJZzdOK0dOUHB1Y0RPTmlI?=
 =?utf-8?B?VXRjenBOY2hqREFncHBIZGJEbWlYTUFKSG0wV0xmZTJ2LzR4ZHJqNkMwTTgr?=
 =?utf-8?B?YTZ1dmhPWVZOM1FGMU5GL2x0SFk3K0x2b016VDNoZWk0UE9ocGE1VkxOd3VB?=
 =?utf-8?B?WkVPb2taR1lLUTVZV0cxNk9PVUZ0eE1uOGorM1Y0SGZ3cVJRa01pMi9DdWlH?=
 =?utf-8?B?M00yK2NXMVdGUjZwY0k0bStLZUFFSnNmSWNNSmc3aDJsZmVzZ2x4TGRZYVp2?=
 =?utf-8?B?aGdlZmJ1MVVTNFVwZVZUQ1VyWFRwRFA4RlJBY3lDZlE5UmcycEpaOUFXdnBv?=
 =?utf-8?B?T25Za0tyb1lwSkhzMVRDeUI0d3J3YVVwSXR4OFBJZ1pCNk5wa3FwbzNrSXpR?=
 =?utf-8?B?aXo1eWpVYmdvbXZ6Qy9GU2ZoUm4wUHpZbzgxbDRmbTREN1BlZDVtamYxV2N1?=
 =?utf-8?B?dGtzNUtWRytRZ0JpMzc4bjB0Q3FESXFPbW5qTlVNYWlSMWplZXduWVRJbi9O?=
 =?utf-8?B?SE9rakc5UGdHRCtNWGNoRFJRbUJBVnErRWQ5bUdhQjh5ajdWeWJ3YlRtejls?=
 =?utf-8?B?MjhLQlJVQjVvVzVML0ZNYmVNaFpnVFpndTZLdjlDTis3aitSZVNWOFFsK0t4?=
 =?utf-8?B?bGJDMUFUY0VVQjc5SlBCbDN2YnIzM2hvMkFkSnE2Ymd0ZzRZM2tuU04zV3pI?=
 =?utf-8?B?UG90eXBPbStyV3NucHIxTC9ETGlIc3dVK1ZoTEVHc21rYlVmc0FQTGp1R0d4?=
 =?utf-8?B?SThQMlNZWnFHZDIrVFQ0d3d1V1cwelF0OTF3R2dXbkNpTDBuSjBiblVuTGw3?=
 =?utf-8?B?VEVBTStkWUh6OE5WcHhPekF6bkJZV3RTcDZSV1RsU1ZFNFVLOVFjaU9SaDVO?=
 =?utf-8?B?WDFsYzVrNjQ2UGg4elgwc01Ha1RGWHpHemtFZkpWSnZwR2xVSnh5NVFCUlpm?=
 =?utf-8?B?alhSRGFWT3V3M0thRlk0ajRUZkloRE5tdExlbXY0UkRyRUhLN0w1RWp1Ukdw?=
 =?utf-8?B?T3VkOTJpa2NNU1VYM0F3R0l2NFp0ZGVCaFFES2FPelZNeWFKUDVIV2Y5b1py?=
 =?utf-8?B?VXIxazJhdWFqTlQyaHRQUTVXbE9yZGpsQXgzRWRxYmNDR3R5L2VsTGFkRnE1?=
 =?utf-8?B?T29XZTI1N0toV09uL3ZWRGlLT2pPRVBIWDdqSlMxUVhjZ2YyTE5ZeTF5Wkhr?=
 =?utf-8?B?eFhMd1k4czBVWWNFeEdYT01RWFA2SDRMQ2tzcndpTXRvMHpvaGFXTlhsU0o1?=
 =?utf-8?B?dlA3QVhia3JJK2UxVmhyWUlhd3ZDdUVYYXp2b0huUmtsUUlzdklQNmtNVFdG?=
 =?utf-8?B?cm4xOFlZOXhjTWQ2MkNwdzJoUkQ3ZkpZNXlaaTFUYUcxcm9NVmtqWXhJZDZR?=
 =?utf-8?B?Umc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b1c8a80-e785-4f1f-93bb-08ddebcc0819
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8695.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 15:59:30.2134 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZtQ7Q4q6FeYHk6PUa2B8jCUum9ajbMJeehobfM1JjBGSg2P1LJy3g5gDAOAt/EHht8CIdFL/EQQM8FfxHl62BfcAvT08k8rL7PN1TW96zTU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5939
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



On 04-09-2025 20:10, Michal Wajdeczko wrote:
> Use correct multi-line kernel-doc style if required.
> Some members were described only in the commit message.
> Some other members were described using wrong names.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_bo_types.h | 15 +++++++++------
>   1 file changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
> index 314652afdca7..e1c330dd5c6d 100644
> --- a/drivers/gpu/drm/xe/xe_bo_types.h
> +++ b/drivers/gpu/drm/xe/xe_bo_types.h
> @@ -25,7 +25,9 @@ struct xe_vm;
>   /* TODO: To be selected with VM_MADVISE */
>   #define	XE_BO_PRIORITY_NORMAL	1
>   
> -/** @xe_bo: XE buffer object */
> +/**
> + * struct xe_bo - XE buffer object
> + */
>   struct xe_bo {
>   	/** @ttm: TTM base buffer object */
>   	struct ttm_buffer_object ttm;
> @@ -47,7 +49,7 @@ struct xe_bo {
>   	struct xe_ggtt_node *ggtt_node[XE_MAX_TILES_PER_DEVICE];
>   	/** @vmap: iosys map of this buffer */
>   	struct iosys_map vmap;
> -	/** @ttm_kmap: TTM bo kmap object for internal use only. Keep off. */
> +	/** @kmap: TTM bo kmap object for internal use only. Keep off. */
>   	struct ttm_bo_kmap_obj kmap;
>   	/** @pinned_link: link to present / evicted list of pinned BO */
>   	struct list_head pinned_link;
> @@ -82,10 +84,10 @@ struct xe_bo {
>   	/** @created: Whether the bo has passed initial creation */
>   	bool created;
>   
> -	/** @ccs_cleared */
> +	/** @ccs_cleared: true means that CCS region of BO is already cleared */
>   	bool ccs_cleared;
>   
> -	/** @bb_ccs_rw: BB instructions of CCS read/write. Valid only for VF */
> +	/** @bb_ccs: BB instructions of CCS read/write. Valid only for VF */
>   	struct xe_bb *bb_ccs[XE_SRIOV_VF_CCS_CTX_COUNT];
>   
>   	/**
> @@ -99,9 +101,10 @@ struct xe_bo {
>   	struct drm_pagemap_devmem devmem_allocation;
>   
>   	/** @vram_userfault_link: Link into @mem_access.vram_userfault.list */
> -		struct list_head vram_userfault_link;
> +	struct list_head vram_userfault_link;
>   
> -	/** @min_align: minimum alignment needed for this BO if different
> +	/**
> +	 * @min_align: minimum alignment needed for this BO if different
>   	 * from default
>   	 */
>   	u64 min_align;
LGTM.
Reviewed-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>

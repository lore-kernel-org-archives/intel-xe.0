Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F0BBCFB45D
	for <intel-xe@archiver.kernel.org>; Mon,  7 Oct 2024 20:05:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA7B010E227;
	Mon,  7 Oct 2024 20:05:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fuJyX0Tb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C870D10E227
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Oct 2024 20:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728331518; x=1759867518;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=ALl5G/PIlBJ9x7G5VPezwJtFNsEsIWY62nF2dik1MJs=;
 b=fuJyX0TbdtGezcCrRnhRBB6n27/ut9aWIpTZWnZJv830Hc0kkPufNTXv
 m/eBIIJy14t1tMLmqXt8sElnT98p3FDNawqOhVI6pXZdVTJo+q9SARmbu
 qTO/kYE9fHWHyWe3rtQLOa7BcI4bfO8O9tlcxtCjo0J2xq5WfIMv5gsLs
 JMKY2ySL8j9jnzQObbinUu+n9KDJwnqTHh/fOi3R+Ig1ly7G5+1LpX7Og
 vsWKrUeQhijUIMFMCrc0LZUhDawUNGGRoEkJM9csKzD58hOg+FUqUTTIB
 6kOxbpMPqRLEykEqLRwJuwkD1fY4AQyen50sYDxoK99jId+K/Toj/rFFt A==;
X-CSE-ConnectionGUID: xJsS9pSqSAualsYPjsDg1g==
X-CSE-MsgGUID: eCvbYA1aTUCuyCEf5yJn9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="30381048"
X-IronPort-AV: E=Sophos;i="6.11,184,1725346800"; d="scan'208";a="30381048"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2024 13:05:17 -0700
X-CSE-ConnectionGUID: ZDDlKY13RMW2ZDc/vc8aBg==
X-CSE-MsgGUID: vOSBw1xSTSWY1IrmOpgRqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,184,1725346800"; d="scan'208";a="80205327"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Oct 2024 13:05:17 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 7 Oct 2024 13:05:16 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 7 Oct 2024 13:05:16 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 7 Oct 2024 13:05:16 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.172)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 7 Oct 2024 13:05:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gfeiiIj40dcgu3FoqYXfe0W5+cwty22wiUtp0cvlEKgQMZCeZvOoZNqc2DItrUbIAfzYKY4r5WuUj0xqSWBGNa+KCH73+912QN2VqGNQ4uMZ57gPH+xLz5uX2NXD6iiRtzUq2cmKRc1d/h8Pbpw53s1uYug1xabtovDSn94On9g2/VPeLL6Z3nBbNF1q0c1r34FgtE18A3u+AEwQt9en1ryQYlNuKDC6NS3zF9fmbHsO09kqUow22VKzBAOlZur762Rp61DLeMlwcQ4oqPpcTQbKw/FjbTRrg7rNF61OMiON1nV2hi93Fp6puqmHG43c1n9GGAyH2rJ4rURLbOzX7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7g7E63Fc0RXa5RP1czFX9ZBWaiVy3i0WG6jZNJ2A0l0=;
 b=Y7ZKSolJwOaaXotjhhC8qEaODuTYfuYbe+vxE0HXUv7Y5uWIXV+FRiqLEioMO1YQRQtAm3C5me9LHuFQHKxMWJC1jckZI0NJvGjNhv/n6+rD7FPKPl43kNz/7ytVUscjb7Z7c5pDRoJacOvw4O8m9UMCJNgP9uyUNubwRrRxOISde/Weqd1xslj6pDJolxLfkgl6ysIBgfbTJNR0e99P8AZd/tN81Lk5d0j82zjvKDJoH+Rdz2cKlc93ImHszddeqMy6qbDPZyayzxyb0wdo+EHN+Xz61i3l9aWQvRJ0aRfHjhNNVyPV3c//mRfYpSva0GVYehY1JMIdptAPf+jZaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by DS7PR11MB7808.namprd11.prod.outlook.com (2603:10b6:8:ee::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8026.23; Mon, 7 Oct 2024 20:05:12 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%3]) with mapi id 15.20.8026.020; Mon, 7 Oct 2024
 20:05:11 +0000
Message-ID: <1efa8385-ba99-475c-bf7d-3b50d426baec@intel.com>
Date: Mon, 7 Oct 2024 13:05:08 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/12] drm/xe/pxp: Add GSC session invalidation support
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20240816190024.2176976-1-daniele.ceraolospurio@intel.com>
 <20240816190024.2176976-5-daniele.ceraolospurio@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20240816190024.2176976-5-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4P221CA0030.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::35) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|DS7PR11MB7808:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bdf0760-1f8c-405e-3d9d-08dce70b593e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T3dlcjV5NU5CSG9lQjJDMmpGRkg5TGREdHRVcjcxQ0F4ZDhyVHdGMG9NTUNQ?=
 =?utf-8?B?d1JLYW5wdTdFVHo3cG5YUUVXTm5qc0ZKODRYWnh4U2h3R3FQaWJoUFBiaCt0?=
 =?utf-8?B?SHlBb04yL29pOG9zQnhTaHJRUEdIdUtGeTlEeURLanFydzdWRVNZd0pTQ0Zu?=
 =?utf-8?B?Y2xod3B3WWZxdDVqTWJEWEQyNGk2bnhSNE1mcUtFbCs5ZFJoaDg5NExlWlQ2?=
 =?utf-8?B?SWx2MHFkVXYvUEMwRk0zWEt2QTBaeDBnbzQrN2lBTS9La0lGSTFlUXd0VWJu?=
 =?utf-8?B?OW83MndzMzBxUk0zOGNQdStkNUZHUGlzM01pak9oMVRDOUpqOGoxSmM4WWF4?=
 =?utf-8?B?dXZnb0N4NWdOSXJTRHVsVEtOTkZwQWk2NVBHTlR2RFNFV1lUU3RtbkplV2Zm?=
 =?utf-8?B?WGZ3aUduYm1IRXQ3QW53QytEMnBMZEMvTzBOZmRRbWQ4ek93WHBPRjJCUmZL?=
 =?utf-8?B?V1hWMXYzOTBieUF4b1dPWEg2ZEZ3RHk4SEc0ZHZnOTVsU0NnRHgzUTdlNjNQ?=
 =?utf-8?B?aW5PY0paSk5UeEZScnNFUi83Y1hVM05jZm8yN3NvYnZ0bGtGQlhReTVrUE4w?=
 =?utf-8?B?SkNMUHhwYW9oRkpXRHVEcmxpcUtrb0ZBSGErOEVIeWwxc05yYm9yUXViQTRs?=
 =?utf-8?B?aG9VeHRoOEE4akRta2I4djFlaW5uZ09vWTRXVjhyRWI1Q3B4RlhEYUxsMW84?=
 =?utf-8?B?ZXRHc056TnVYczZsMmNjZEIxR0VrVExIQUs1Zzgzbm9SQ2VzWTZORW9GeWxi?=
 =?utf-8?B?MTF6OWVvR0ZYL3dJS1htaTl0M1hJZ2ZQQ2w3d1Y5QkNFaCt6U0llK2RPR2pN?=
 =?utf-8?B?WUUrUG9qWEVLWUpDUkNFYnllYUVsTFY1UERvVFZkcUVtR2VITUFiMkZUZTZS?=
 =?utf-8?B?UTk1ZGxwZEtyeEYrYzVqSGRCOW5rV3IxS2tXdEZxYWF6SlYvaWIxczZ1bzFG?=
 =?utf-8?B?VnBJS2hpMHJic1VPTWxuS3c3Q1RmSFJyb1pOdWw1YTdpNW9YcmM2R2tmc2Rl?=
 =?utf-8?B?bklQdldmMnA5ejJLOWtlWmswTjlRV3hpTWlzUU9UWjdZS3liQ3I4MGpodU0y?=
 =?utf-8?B?ZWx6T0picG9UK0dxQzgxSEtHWUdHUkJOOHVKMkNqcElaUm5QODdlTHpTcSsz?=
 =?utf-8?B?NWsxYVpIWVZJRGRPZlZtSGFmbHBFcDA1N2JjajJlSHh2Q24rUE95M1JFdWlH?=
 =?utf-8?B?L0VteHBzblIrTk8yMTVlVnFTZnJXQldDZ1FoZXJpYmJMN2gyandnVjExc1hG?=
 =?utf-8?B?b1B2eERZMUVLWkZzSTVJYmVJU3JZZmd5ODNzVmVmNjFrMTVMbWR2SzQ5RmMv?=
 =?utf-8?B?T1FpYlNJaTRNYkZMV3BYV1lWRmNrRDdscmhlblVWQ2h6ZW45WWN0a3JNc3pX?=
 =?utf-8?B?T0RTcm92SWt4bk41VCtscWg2QzZOVTR4Y0REWGUyOEhxVGZydGhLZHROL3dP?=
 =?utf-8?B?cXdMZnZESzduM1JnWlZsZTV6bHZEM2dZWVpLS3hVYUwxS1pJNnlkTFAyUC8w?=
 =?utf-8?B?S2NWNHlCVDdkbGg1dFpFVFY5L0JCV251QVZ5MmxWdWN5K0dUZHJBeHhjNWNh?=
 =?utf-8?B?a0ZqREJkc3EzdHF5Vk1HT1FYVTc5UlZUUUZyVkRtb1RiWHN0S01aN1NkaTFB?=
 =?utf-8?B?VUwwODdXTXV6bDFsOFJqU0dGYjhDeFRMRTVJY0NWaUJWTmZtTnVVSnd4NkNX?=
 =?utf-8?B?NE1DNUVocVlBbmhqcFFmZUlNbW45a0xoNkJCZnZpajdOWnNaQ2NEK1h3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L3RRLzBDNFd0L2hDSVhEUndPT240bVpTY3dBbTFiWjZ6WE9uTm15c3krYTgr?=
 =?utf-8?B?SzkzdUdJemFIMVlJMGdXeUZTV2tOUmR5bGlaY2ZTZXZRTW11Nk9sc01vN1BO?=
 =?utf-8?B?aTJGWVhZT05lV0pTdmNjRFMveUU2MS9sRGdvSjFSRjIzQ215dHN1b0dETCsv?=
 =?utf-8?B?Ty9wNlNpYVBjdVFvWDViOVpKR1BCb1pneENBemFIUVdjakNUek1lZlBVT2E1?=
 =?utf-8?B?SGlnL2JpaXVFRmlZRzN6QWUzdUorNHpxZjJrYWt0emtQMlJaVTF6SUNKWlNI?=
 =?utf-8?B?cEoyY3RUdkZXeDV5V1FTR0Z6ZkpzZ1YxdTBJUVBPaFRXYTd5TkxXamRCN1hO?=
 =?utf-8?B?NGxzdVVjT3hia3IzdnI4ajBpVHNvdlZOeVAwRDIxRjZvb1Nuc0J4cVpaWTgr?=
 =?utf-8?B?djVRTHFmY3ZyVmJqOWk0dXhvZlJBYkZ1WHVkWjYyWWRUVjRpVkFTeklwcWEy?=
 =?utf-8?B?UXFTYmFKWG9NeTR3cG9BMEZGanlxZnhRSUl4VjFOakVsdUFnaUJ5dXIxQTZE?=
 =?utf-8?B?ais1RnVVbkRmNDlxeEdqV1NSakZBRGtnbStDNGtqWmMzVGtrL3pBME01MFR4?=
 =?utf-8?B?eFhPNmszYWE0SUk4MStGcC9wWWRUd3lTK0VTbkcxUWNXSFNYdGNYNG53TUZZ?=
 =?utf-8?B?d1l6ZXdpbTZnL3J6ajdtS0tJMDJtUnhiaWFGandZZkdVL2V4R3Uva1JnUHNu?=
 =?utf-8?B?SE9kSzBpSko2WTZGQS85TGhSQ3ErWCtNM2RZOUgzR1F2cDd2bHdmOHBFK0pF?=
 =?utf-8?B?R0RuR3ZzcUVKOWRDN1RTQ0hBQnVSeElKdTk4RTFObnZyYm9oMERJbkZob3Ju?=
 =?utf-8?B?cG9YQ2o0emZ0dGdpbzJqZkUvOGY1MzJiOW9HOGtDZDlsOUVsYnY0bW1tMjVY?=
 =?utf-8?B?dzdoaU5EOXNSN2U5SzVQNWpXblZiTFdpeGVWNHZCZzhkWUVQTlNTTGFFRUhk?=
 =?utf-8?B?U21TdEZDT3JWQ25lcW5ndjNybDNScjkwU0ZjQVA4cmJiWTdHNXBNNVFzckdY?=
 =?utf-8?B?MUVOWEN2UWlMRmhLalp2L1JXdkFRZ3FmWjgxd1NweHlsekZQM2ZTR1l0VTBw?=
 =?utf-8?B?VUVvK1p5VUN1N0NXdjhqcUsvNVB3Y1ROY2FnaW8zSHMvYjl3RTNmdmJZdmZ0?=
 =?utf-8?B?WkZqTk8ybkpQVFlVZ3ljbkR1UUJkTWp6M056WTJEdmwvN25CK1FoVW1rYVFt?=
 =?utf-8?B?TnRWNHMyQjZpekc3ZXdFUFl6VEkwbkp5YUtOWTQrT2FZb2k5Y0xVQmNIeU9U?=
 =?utf-8?B?eEFUbVo0ZExsMUVCM2k0NXFkTWo1bU91b3JzUGt0Wi9SdWREWmU5Z3RQeVVn?=
 =?utf-8?B?NWg3TFd1aTRYaDIzVDBiWmlpYWRHVzEzQzAwVVg5NExFcXMwbVBqZTFUaUxG?=
 =?utf-8?B?b3V2YkxsVjBmMHh6aWx1WXJoaTFQRmRRREI4OGEvNVhYWWVHOHpuWi9xald3?=
 =?utf-8?B?aDFlcitwWHEwUlBxUXVPNjB0ZTM1SHVHZ1paWUtYbG9Ca0FGK1Y3ZDAvZys3?=
 =?utf-8?B?dTFSU3Fzb3hWRnBaUnJRM1d6YTN6QjlHZEdOL1dNazA5dDFVOE1LTFk0elpm?=
 =?utf-8?B?bkpOVmlDS28vMnMxWVdtNWlpcmpIU3ZuSkhtNCtHbXdDQzhIdHpnQ0NLUFY4?=
 =?utf-8?B?YUdkdEtwZnJDcCsrTS9SejNwR05TNC8zdnZlc3ZqNGJaNzNZYWRkSDZVVEtQ?=
 =?utf-8?B?WWpwWE4zZ05JTk5EdGdxQ0RaY0N6Z0JRTjlwUDNublFwTmJNdmZXeFVXNjNZ?=
 =?utf-8?B?SEoxUkl6ZTdDOEw1UUdNMkQxZ2dKdWErUGFzOTVHS052NmNmMTczZGc3WE1a?=
 =?utf-8?B?dEM3Y1JIWHMxeHltc0E0dkVSdXpaWDJjcFFnRCtBL3JnYWd3RER3Qk9UNHNx?=
 =?utf-8?B?OHF0S05McnZ2R2JxTXlHaU42QWJUMzNRQjF0YVZneHQ2VkVwZG84OVdqbUhU?=
 =?utf-8?B?Y1BPY29HdWowSC9BbXJ5UzRUQnVYNTJ5dFhQcSs0eXlSVWpUNlFTWUU1a2l0?=
 =?utf-8?B?SU5NVDhtb2hmaFc3WGEvQjBYOEF2OHJ1Tkptb1crbVcwV0RBQUpjN2xXY1Y4?=
 =?utf-8?B?L1ZuWDdhWGhuelBzSGVNV0FmbVhsdFVOZHkxZFdYMG10QUNxS01WUnpkVDFW?=
 =?utf-8?B?YUVpdkM2SUlqTWZpRlNPU1BBWU5kRklTbXNSeFRia3VyMFloUXZOZXFWKzZv?=
 =?utf-8?B?b0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bdf0760-1f8c-405e-3d9d-08dce70b593e
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2024 20:05:10.9164 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3A5Tl3YAMSPgJlg04xZ0XQ6JUYW8j2LV1Y9ABkIN5JWD1509zKiGc+Z1m4cWoIYh7ZuovDanjmx7zvRHRiACCLvtM7bQzT/yP3lW5wQax/g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7808
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

On 8/16/2024 12:00, Daniele Ceraolo Spurio wrote:
> After a session is terminated, we need to inform the GSC so that it can
> clean up its side of the allocation. This is done by sending an
> invalidation command with the session ID.
>
> Note that this patch is meant to be squashed with the follow-up patches
> that implement the other pieces of the termination flow. It is separate
> for now for ease of review.
>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> ---
>   drivers/gpu/drm/xe/abi/gsc_pxp_commands_abi.h |  12 +
>   drivers/gpu/drm/xe/xe_pxp_submit.c            | 215 ++++++++++++++++++
>   drivers/gpu/drm/xe/xe_pxp_submit.h            |   3 +
>   3 files changed, 230 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/abi/gsc_pxp_commands_abi.h b/drivers/gpu/drm/xe/abi/gsc_pxp_commands_abi.h
> index f3c4cf10ba20..4a59c564a0d0 100644
> --- a/drivers/gpu/drm/xe/abi/gsc_pxp_commands_abi.h
> +++ b/drivers/gpu/drm/xe/abi/gsc_pxp_commands_abi.h
> @@ -49,6 +49,7 @@ struct pxp_cmd_header {
>   	u32 buffer_len;
>   } __packed;
>   
> +#define PXP43_CMDID_INVALIDATE_STREAM_KEY 0x00000007
>   #define PXP43_CMDID_NEW_HUC_AUTH 0x0000003F /* MTL+ */
>   
>   /* PXP-Input-Packet: HUC Auth-only */
> @@ -63,4 +64,15 @@ struct pxp43_huc_auth_out {
>   	struct pxp_cmd_header header;
>   } __packed;
>   
> +/* PXP-Input-Packet: Invalidate Stream Key */
> +struct pxp43_inv_stream_key_in {
> +	struct pxp_cmd_header header;
> +	u32 rsvd[3];
> +} __packed;
> +
> +/* PXP-Output-Packet: Invalidate Stream Key */
> +struct pxp43_inv_stream_key_out {
> +	struct pxp_cmd_header header;
> +	u32 rsvd;
> +} __packed;
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_pxp_submit.c b/drivers/gpu/drm/xe/xe_pxp_submit.c
> index 3b69dcc0a00f..41684d666376 100644
> --- a/drivers/gpu/drm/xe/xe_pxp_submit.c
> +++ b/drivers/gpu/drm/xe/xe_pxp_submit.c
> @@ -15,9 +15,13 @@
>   #include "xe_gsc_submit.h"
>   #include "xe_gt.h"
>   #include "xe_lrc.h"
> +#include "xe_map.h"
>   #include "xe_pxp_types.h"
>   #include "xe_sched_job.h"
>   #include "xe_vm.h"
> +#include "abi/gsc_command_header_abi.h"
> +#include "abi/gsc_pxp_commands_abi.h"
> +#include "instructions/xe_gsc_commands.h"
>   #include "instructions/xe_mfx_commands.h"
>   #include "instructions/xe_mi_commands.h"
>   #include "regs/xe_gt_regs.h"
> @@ -307,3 +311,214 @@ int xe_pxp_submit_session_termination(struct xe_pxp *pxp, u32 id)
>   
>   	return 0;
>   }
> +
> +static bool
> +is_fw_err_platform_config(u32 type)
> +{
> +	switch (type) {
> +	case PXP_STATUS_ERROR_API_VERSION:
> +	case PXP_STATUS_PLATFCONFIG_KF1_NOVERIF:
> +	case PXP_STATUS_PLATFCONFIG_KF1_BAD:
> +		return true;
> +	default:
> +		break;
> +	}
> +	return false;
> +}
> +
> +static const char *
> +fw_err_to_string(u32 type)
> +{
> +	switch (type) {
> +	case PXP_STATUS_ERROR_API_VERSION:
> +		return "ERR_API_VERSION";
> +	case PXP_STATUS_NOT_READY:
> +		return "ERR_NOT_READY";
> +	case PXP_STATUS_PLATFCONFIG_KF1_NOVERIF:
Is it not worth having a separate string for this error?

> +	case PXP_STATUS_PLATFCONFIG_KF1_BAD:
> +		return "ERR_PLATFORM_CONFIG";
> +	default:
> +		break;
> +	}
> +	return NULL;
> +}
> +
> +static int pxp_pkt_submit(struct xe_exec_queue *q, u64 batch_addr)
> +{
> +	struct xe_gt *gt = q->gt;
> +	struct xe_device *xe = gt_to_xe(gt);
> +	struct xe_sched_job *job;
> +	struct dma_fence *fence;
> +	long timeout;
> +
> +	xe_assert(xe, q->hwe->engine_id == XE_HW_ENGINE_GSCCS0);
> +
> +	job =  xe_sched_job_create(q, &batch_addr);
Double space.

> +	if (IS_ERR(job))
> +		return PTR_ERR(job);
> +
> +	xe_sched_job_arm(job);
> +	fence = dma_fence_get(&job->drm.s_fence->finished);
> +	xe_sched_job_push(job);
> +
> +	timeout = dma_fence_wait_timeout(fence, false, HZ);
> +	dma_fence_put(fence);
> +	if (timeout < 0)
> +		return timeout;
> +	else if (!timeout)
> +		return -ETIME;
> +
> +	return 0;
> +}
> +
> +static void emit_pxp_heci_cmd(struct xe_device *xe, struct iosys_map *batch,
> +			      u64 addr_in, u32 size_in, u64 addr_out, u32 size_out)
> +{
> +	u32 len = 0;
> +
> +	xe_map_wr(xe, batch, len++ * sizeof(u32), u32, GSC_HECI_CMD_PKT);
> +	xe_map_wr(xe, batch, len++ * sizeof(u32), u32, lower_32_bits(addr_in));
> +	xe_map_wr(xe, batch, len++ * sizeof(u32), u32, upper_32_bits(addr_in));
> +	xe_map_wr(xe, batch, len++ * sizeof(u32), u32, size_in);
> +	xe_map_wr(xe, batch, len++ * sizeof(u32), u32, lower_32_bits(addr_out));
> +	xe_map_wr(xe, batch, len++ * sizeof(u32), u32, upper_32_bits(addr_out));
> +	xe_map_wr(xe, batch, len++ * sizeof(u32), u32, size_out);
> +	xe_map_wr(xe, batch, len++ * sizeof(u32), u32, 0);
> +	xe_map_wr(xe, batch, len++ * sizeof(u32), u32, MI_BATCH_BUFFER_END);
> +}
> +
> +#define GSC_PENDING_RETRY_MAXCOUNT 40
> +#define GSC_PENDING_RETRY_PAUSE_MS 50
> +static int gsccs_send_message(struct xe_pxp_gsc_client_resources *gsc_res,
> +			      void *msg_in, size_t msg_in_size,
> +			      void *msg_out, size_t msg_out_size_max)
> +{
> +	struct xe_device *xe = gsc_res->vm->xe;
> +	const size_t max_msg_size = gsc_res->inout_size - sizeof(struct intel_gsc_mtl_header);
> +	u32 wr_offset = 0;
> +	u32 rd_offset = 0;
The intialisation is not necessary here. rd_offset has the appearance of 
requiring it but doesn't really, and wr_offset is re-assigned almost 
immediately.

> +	u32 reply_size;
> +	u32 min_reply_size = 0;
> +	int ret = 0;
Also not necessary to be pre-initialised.

> +	int retry = GSC_PENDING_RETRY_MAXCOUNT;
> +
> +	if (msg_in_size > max_msg_size || msg_out_size_max > max_msg_size)
> +		return -ENOSPC;
> +
> +	wr_offset = xe_gsc_emit_header(xe, &gsc_res->msg_in, 0,
> +				       HECI_MEADDRESS_PXP,
> +				       gsc_res->host_session_handle,
> +				       msg_in_size);
> +
> +	/* NOTE: zero size packets are used for session-cleanups */
> +	if (msg_in && msg_in_size) {
> +		xe_map_memcpy_to(xe, &gsc_res->msg_in, wr_offset,
> +				 msg_in, msg_in_size);
> +		min_reply_size = sizeof(struct pxp_cmd_header);
> +	}
> +
> +	/* Make sure the reply header does not contain stale data */
> +	xe_gsc_poison_header(xe, &gsc_res->msg_out, 0);
> +
> +	emit_pxp_heci_cmd(xe, &gsc_res->batch, PXP_BB_SIZE,
> +			  wr_offset + msg_in_size, PXP_BB_SIZE + gsc_res->inout_size,
> +			  msg_out_size_max + wr_offset);
Is this correct? It is passing in the batch buffer allocation size as 
the address. Shouldn't there be some kind of base address included? The 
in/out buffer is after the BB in the same allocation but that allocation 
is not guaranteed to be at address zero, is it?

Also, it would be more consistent to use 'wr_offset + out_size_max' to 
match the input calculation rather than flipping the terms around.

> +
> +	xe_device_wmb(xe);
> +
Might be worth a comment here to say why retries are required and how 
many/how long is expected normally versus worst case?

> +	do {
> +		ret = pxp_pkt_submit(gsc_res->q, 0);
> +		if (ret)
> +			break;
> +
> +		if (xe_gsc_check_and_update_pending(xe, &gsc_res->msg_in, 0,
> +						    &gsc_res->msg_out, 0)) {
> +			ret = -EAGAIN;
> +			msleep(GSC_PENDING_RETRY_PAUSE_MS);
> +		}
> +	} while (--retry && ret == -EAGAIN);
> +
> +	if (ret) {
> +		drm_err(&xe->drm, "failed to submit GSC PXP message: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = xe_gsc_read_out_header(xe, &gsc_res->msg_out, 0,
> +				     min_reply_size, &rd_offset);
> +	if (ret) {
> +		drm_err(&xe->drm, "invalid GSC reply for PXP (err=%d)\n", ret);
Should be %pe for the error code?

> +		return ret;
> +	}
> +
> +	if (msg_out && min_reply_size) {
> +		reply_size = xe_map_rd_field(xe, &gsc_res->msg_out, rd_offset,
> +					     struct pxp_cmd_header, buffer_len);
> +		reply_size += sizeof(struct pxp_cmd_header);
> +
> +		if (reply_size > msg_out_size_max) {
> +			drm_warn(&xe->drm, "caller with insufficient PXP reply size %u (%ld)\n",
> +				 reply_size, msg_out_size_max);
I would maybe go with 'reply size overflow'. Took me a moment to work 
out why 'size > max' becomes 'insufficient reply size'.

> +			reply_size = msg_out_size_max;
Is it useful to return a partial message?

> +		}
> +
> +		xe_map_memcpy_from(xe, msg_out, &gsc_res->msg_out,
> +				   rd_offset, reply_size);
> +	}
> +
> +	xe_gsc_poison_header(xe, &gsc_res->msg_in, 0);
> +
> +	return ret;
> +}
> +
> +/**
> + * xe_pxp_submit_session_invalidation - submits a PXP GSC invalidation
> + * @gsc_res: the pxp client resources
> + * @id: the session to invalidate
> + *
> + * Submit a message to the GSC FW to notify it that a session has been
> + * terminated and is therefore invalid.
> + *
> + * Returns 0 if the submission is successful, an errno value otherwise.
> + */
> +int xe_pxp_submit_session_invalidation(struct xe_pxp_gsc_client_resources *gsc_res,
> +				       u32 id)
Is this really over 100 columns if not wrapped?

> +{
> +	struct xe_device *xe = gsc_res->vm->xe;
> +	struct pxp43_inv_stream_key_in msg_in = {0};
> +	struct pxp43_inv_stream_key_out msg_out = {0};
> +	int ret = 0;
> +
> +	/*
> +	 * Stream key invalidation reuses the same version 4.2 input/output
> +	 * command format but firmware requires 4.3 API interaction
> +	 */
> +	msg_in.header.api_version = PXP_APIVER(4, 3);
> +	msg_in.header.command_id = PXP43_CMDID_INVALIDATE_STREAM_KEY;
> +	msg_in.header.buffer_len = sizeof(msg_in) - sizeof(msg_in.header);
> +
> +	msg_in.header.stream_id = FIELD_PREP(PXP_CMDHDR_EXTDATA_SESSION_VALID, 1);
> +	msg_in.header.stream_id |= FIELD_PREP(PXP_CMDHDR_EXTDATA_APP_TYPE, 0);
> +	msg_in.header.stream_id |= FIELD_PREP(PXP_CMDHDR_EXTDATA_SESSION_ID, id);
> +
> +	ret = gsccs_send_message(gsc_res, &msg_in, sizeof(msg_in),
> +				 &msg_out, sizeof(msg_out));
> +	if (ret) {
> +		drm_err(&xe->drm, "Failed to inv-stream-key-%u, ret=[%d]\n",
Would be clearer to say "failed to invalidate stream-key-%u"? The 
message current reads as "failed to <name-of-variable>" which doesn't 
make much sense. Same comment for the other two prints below.

Also, %pe for the return code?

John.

> +			id, ret);
> +	} else if (msg_out.header.status != 0) {
> +		if (is_fw_err_platform_config(msg_out.header.status)) {
> +			drm_info_once(&xe->drm,
> +				      "PXP inv-stream-key-%u failed due to BIOS/SOC :0x%08x:%s\n",
> +				      id, msg_out.header.status,
> +				      fw_err_to_string(msg_out.header.status));
> +		} else {
> +			drm_dbg(&xe->drm, "PXP inv-stream-key-%u failed 0x%08x:%s:\n",
> +				id, msg_out.header.status,
> +				fw_err_to_string(msg_out.header.status));
> +			drm_dbg(&xe->drm, "     cmd-detail: ID=[0x%08x],API-Ver-[0x%08x]\n",
> +				msg_in.header.command_id, msg_in.header.api_version);
> +		}
> +	}
> +
> +	return ret;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_pxp_submit.h b/drivers/gpu/drm/xe/xe_pxp_submit.h
> index 4ee8c0acfed9..48fdc9b09116 100644
> --- a/drivers/gpu/drm/xe/xe_pxp_submit.h
> +++ b/drivers/gpu/drm/xe/xe_pxp_submit.h
> @@ -9,10 +9,13 @@
>   #include <linux/types.h>
>   
>   struct xe_pxp;
> +struct xe_pxp_gsc_client_resources;
>   
>   int xe_pxp_allocate_execution_resources(struct xe_pxp *pxp);
>   void xe_pxp_destroy_execution_resources(struct xe_pxp *pxp);
>   
>   int xe_pxp_submit_session_termination(struct xe_pxp *pxp, u32 id);
> +int xe_pxp_submit_session_invalidation(struct xe_pxp_gsc_client_resources *gsc_res,
> +				       u32 id);
>   
>   #endif /* __XE_PXP_SUBMIT_H__ */


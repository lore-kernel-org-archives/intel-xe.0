Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 869D4C369CB
	for <intel-xe@archiver.kernel.org>; Tue, 29 Apr 2025 05:35:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F39410E0AA;
	Tue, 29 Apr 2025 05:35:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j6XEshrz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F09D10E0AA
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Apr 2025 05:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745904934; x=1777440934;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=PG4xGwbxpLesWIL0XKUkgUWKFMdzFbEfQoLNkZeF80g=;
 b=j6XEshrzdbfQGLPiGNuvk4fGWu336/W75InWL1E+UVL1UyFtcG+cD+I6
 K7rhykKtCIm7+BzC19sxGBMCyGlVR6QGHuNpe8jZCUiu5ZJs7TwAJCc4k
 M1A0CyuLU8XWlVlyvTjFW2FXPGNRd/hfEYBtGdv+qobEeN/OKC0w5SxM3
 FfmyMSmr6y1b4YUqKOzjeQu0WAF57s4V/+Woe+ynPPhwNJroxCVUO9GJy
 8+kOdETLSwo2k5/+SUAuwKF45+8Z4dVO6moC00Bbe6RI9OnVis4zK5xkl
 3Lshhv2IXA4RtzAWUdhNVfzMV9ITJODIw7n2ppTygA+IRYVIXrkHa7EQ+ A==;
X-CSE-ConnectionGUID: QLBXaEjyT9e8BPHo9RAdfg==
X-CSE-MsgGUID: 87dO5I1yQ0GkEUmrM2GwOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="57715370"
X-IronPort-AV: E=Sophos;i="6.15,248,1739865600"; d="scan'208";a="57715370"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2025 22:35:30 -0700
X-CSE-ConnectionGUID: x9QzEsThRg6U7G1t54Su0Q==
X-CSE-MsgGUID: Vq9pYatrRriB8Iyw+a2h9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,248,1739865600"; d="scan'208";a="137764301"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2025 22:33:46 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 28 Apr 2025 22:33:45 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 28 Apr 2025 22:33:45 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 28 Apr 2025 22:33:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GE3hnFQqXXkKDpZMgQKV6FhxVhnadkDbrlXCKwi4+ENbXwCAONfdwhLfVJAh1lC3AKFRCb2HivPJixCu5sXdP1ORy/+za79tGFs70j4Ds9L0j4O725xt7tjkyFK6z4wxPCbLNYYPbmXNzKlKcVsPFLk0Qgzo/gP5MhSXVgIUWoiednS3WYtu22SZ1ZbrDfLAzOdmDBEFxfB2UM5CIMzlINbnf82k2flXOT+L/MlG8tF4tYf9sPO1QkfqjLtlFHTKSKZ8JKUMdyEy/WPBoPi4cMbimBarMrDTUKSGtuPSViunieog7wz/Kp0O+vlTQE/qNjNChVaf957CdYiNLBzAog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4ZB0GyUU8XLht8IUA7VZqkNBMg68g4uRixS/QdfxH+E=;
 b=D4LJrgI0Ak02+1mdmniNsj0I2iqbi9rD3dZKYQKQcxh1BGPPEhhTtEuUgBr7WxqS1x9MBAdr1zgwHrkCuCFPquPTqq49gl+KQxSU9aWEc73iVX9Hh2+OzyW2jV/lQ5L47uqKefCejboXAyk+9e/p/FiMG96ZaO8MDbaFQDSfpn3ls/fE5eYYYpVTiNp+PuP3KkmuQ1FN9KLkWcH+iQDUT1CuvW2nAvnuBn7m3+C/VsraRzyw7Zgx+Dhcl6/uPgG3cLnXU8sWK11o33Sqx4KGoDee0SfgwyTR5YZcMrr3E88nJG9XdXU8uEHcGb+LmJjeR1DI2wSuV7fX3eMdvPaesg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by CH3PR11MB7202.namprd11.prod.outlook.com (2603:10b6:610:142::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Tue, 29 Apr
 2025 05:33:00 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%5]) with mapi id 15.20.8678.028; Tue, 29 Apr 2025
 05:32:59 +0000
Message-ID: <0fdee639-3a6d-4f3d-bb50-746ed30eb4ba@intel.com>
Date: Tue, 29 Apr 2025 11:02:53 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 16/18] drm/xe/svm: Add
 xe_svm_range_validate_and_evict() function
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
References: <20250428103224.69534-1-himal.prasad.ghimiray@intel.com>
 <20250428103224.69534-17-himal.prasad.ghimiray@intel.com>
 <aA/wy2hC6DDCitDL@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <aA/wy2hC6DDCitDL@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXP287CA0018.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::33) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|CH3PR11MB7202:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c2f46f0-5887-48ca-32d0-08dd86df4d95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NWNmWTlJZmZlVUtNd1JIeXExblZ3NThHZ3gxVWt6Q2VIQllNM0dtSm5KaGVT?=
 =?utf-8?B?Ynd1ZVNGdkxYWGh0NksrVHJDVmJySjhwcHFCWFVzd1hYeXNnc2R6UkhYMTJy?=
 =?utf-8?B?NS9uV05jRkNGdjVhdFZPWDVESG1PSkdMbkVjb2h2RUMzZ3BjR1pNdGZxblVL?=
 =?utf-8?B?ZWVRWUlYcGdUdzNpWkJZN1VOVzlNblQ1UDArdFdXMkUrTkNWTUk4NjhJcVVM?=
 =?utf-8?B?MnNYUVpGV1FHam05bzZrWUR1OWVYRy90L2RsNGMxTFErMmRmWWdpSW9XZk4v?=
 =?utf-8?B?azBzbmJoSlkzVVRPK0kxRUpVaFFRZVBRQXhrVUZ1d0ExK3AzVWd0WXR4UlY4?=
 =?utf-8?B?R2Vmai9CZW1XL2YvcUJiRi80SnNxRXVSemJvY25UZlhXZWt1b0ZvOVZ6Tmpv?=
 =?utf-8?B?cEovN2hPYkZDeUJOUWIydGgwY2VoeG9GcFRUei9PK1hzQlAzdlBMSHZDOTEw?=
 =?utf-8?B?QWx6MFlWNEt6WElEZGJ2S3l4R1J3aVhpT3RTUC92OG1OQ3NtT09sdGVoZlZo?=
 =?utf-8?B?WFpJN3RpNnI5b3o4M2dvcDd3ekxzSHZNYkVJYkVJQkFMUDlYNW5UZEltYU1V?=
 =?utf-8?B?MFJxZy9Cd3FFY0o1WlBjV0tCMDFvL0Y0SGRZNjh6VXdjMXg3QzB2WDNWY29M?=
 =?utf-8?B?bGRGQVNjbDRvQVpXQ0F1UkluallWMU41SkdwSmt1S1FmTG9NUDY4MGszWlNS?=
 =?utf-8?B?bmpLaTRETmVoUjRGVVU4UThVTW15SitmdTAwUUdvZzZ2cWdsMmlWeWYyaEU3?=
 =?utf-8?B?RjJPZWtiUDZEb1Rjc3hObllZSVRBTlNkSEVsaGNBQlpVY2svMU1iK1hBbmdj?=
 =?utf-8?B?c0dxWHJWZ0hCbnc4dDF2OXpqU3NSUDV2TzE2b1M5NlNuRUFLRVhLVkRjZ2ww?=
 =?utf-8?B?ZmZFOG1NMmx1TWhUazJpek1hWEtZTmp2UEFYQ0dxcFQ0V1h2aWVYODkvcUVk?=
 =?utf-8?B?bEFKVEt2NkhHNWFreDJwbnZVc1ZUdS84Y0JGQ3RuRHpIK1dSYVdwNlZBTzls?=
 =?utf-8?B?SlVlQnJHNnAvejV4UmpkZGFSV2NQN21weDdRYThtTEFMeTZRSWdhV2V6UHYv?=
 =?utf-8?B?NUNIOVZCSTdwQ1VJT01JbXZmYTBKdHFhdmlQTDFYVk10YUJuKzNLV0FQY2Nx?=
 =?utf-8?B?bWlWeVlzQXowRmtObkdyMWFIVFZrU0Y5bGVTUUx1WEt4UGNLWTl4aDhKS2pR?=
 =?utf-8?B?bGh5TkN3bVVGRkx0dFNJc05pa3hnVElwVHF4KysvdEFPcWh1VXgyb0tBT3lr?=
 =?utf-8?B?ajFYTjNiMUoxUHREWXV2WlhsdTRlNUV4Y3Q2Wk9XV2lRamN1a0M1OHdJbFdP?=
 =?utf-8?B?TnNiNDE3MFJCeU95WlpSekQwcWQzNUtQZW51RDlrSE90dUQxVnhhbDE4cnI1?=
 =?utf-8?B?a2VkaFlKTHlnVlRHZnRjcGtBRXNQY2w2MEI2ay9TaFU3U1dMbjlSMDl3TGxr?=
 =?utf-8?B?T0hLOFA3UmxTUjFOdlBCeWZNWnFMbzVzdHk1UExBejF6b1pjd1VxSkxNb2wy?=
 =?utf-8?B?bEY2QWRQSkU2UFhLOWhyWWViczN6TU5PMlpncUE5QUNGUDgwQ0s1QnQwcndm?=
 =?utf-8?B?Mmd6VXhyVnpuMSt2Q1NoQWpOckk3VlpPWUZHVFNULzkxelBGVmVUZ2dNVHpC?=
 =?utf-8?B?N2kwcCtDLytHZDhGM2ZseTd6SHI5NXF0eXpsNk96L1RMMEVmNzUxdnkzbFYv?=
 =?utf-8?B?dEdoOHlUMDhwV1pwRlJOT0VxbVJGem9DNWFkekkzQk5oRGNqUnhTRWg5clNx?=
 =?utf-8?B?eG1kbEFFZUU0bjA0WFVFYmFkM0p2KzBZQUdDK2VhNm1YbTRCT1h0YnhhY0tv?=
 =?utf-8?Q?hAKVUSVcSHYVtwcFbY7PdaF8zQ2N03PRgtlKE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T21YejQ0aEgvanZrVzIzbG4xVVM3R2N2K1VaNzVZZnJiZFMxMUFlcEk3VTF1?=
 =?utf-8?B?Z3RteXNUZEtsckxad2R1STIwR3pZV3RFRVNEU3p3UWF3SEdsYjc3TEttaTVr?=
 =?utf-8?B?aDJLdXN2VHRHbW0xd0pmVXJ6VmZmSlpoakxxbXY3aU5PQnIvZTREV2lXTDN0?=
 =?utf-8?B?N1BEdEQxdERXL3ZMQndIdC9BVzRobWdCNkdYQXVpZ2lzRW4zby8wZUJZU280?=
 =?utf-8?B?Y0JJc0pqMXVwSUlUcmx0cFBzWTRsa0Z0YmpyeHJJcUlrY2VqeUE1WDUwQ2RI?=
 =?utf-8?B?ZTgyMWkwSDFINWdRM25lQlp6Q0x4SzYvZ2VEL2hGU2MwSTFiNTBXNms2VWJL?=
 =?utf-8?B?NFRXTHNOVlZsRDZYakpac2FTM1gvc2traEswNG42cldPenQvMEo1L0crSG5r?=
 =?utf-8?B?cHo5NHBpL2JEMnpsMGpOVHE5T0tzcUpTelNWVDBUaGQ3Y2dLaTNDa0pIRW9z?=
 =?utf-8?B?T3dBRDQyNHN4c1lsWDZ3ZmFZUUhwYUlsU1l5NHUrVk55RTBETXJEdkQxc29n?=
 =?utf-8?B?NEx3VkJqSkxWNUNWWmZXTW8zYW1uZjZ6MDhneHFISStzcllFbi9HeHUxYW5Y?=
 =?utf-8?B?Tzh5dUdIaHZrRkNaNW96NTBYSGpncUJJZ2EzRFlmWDZYYm8xZWF6QURHM2VJ?=
 =?utf-8?B?WHlveUh0L2VmRXJodllEbmRld0RUTDNDbW5sejV2Y3JKV2wwZGVUdnJ0S0o4?=
 =?utf-8?B?T2o5b0E1NHdQN1I0N1dZMFk1bk9oSGlCbkFRYTV1Tm9vcHBsUDhLVm9QaDhG?=
 =?utf-8?B?MmowdXdOS2h5WG9wNUFTbnFaQ0N6ZXVnekRKY0lCdXZIM1JRS01lZ0ZjNGkz?=
 =?utf-8?B?ZC9UblNJTjltanlRV2xoQkNzOW9ZVnBBenk5WjgrL05QUWN6MW9yTGNFU3Nu?=
 =?utf-8?B?S0FBOTZUZTRVSzlXWXhMbG9IMHAyUnJKY0F1Mm9HUVVnNkpxNHlCOEJoeG1q?=
 =?utf-8?B?ZXRqcUs2bS9WaTNUZWVsZUN2Nk9vbnBHeGlNbmZQM2xWR05ZcFVxWXc1aDc3?=
 =?utf-8?B?S1J5SVEwOFY3YlloUkhBTXdsMlljNDdFYUc3STJHRXgzTHE0RUVNd1kwZEQx?=
 =?utf-8?B?ZGV6d1VTUTROYjl1aWFUUUFmOENkTEtZcUNtaFk3ZW85Y3lHNzd2K1BZVHJn?=
 =?utf-8?B?bEJFMTBaZnJPTFZrRXJ5Tjkvc1BaNmJrdGpmMVpOcnNnUk93WWNpUHNIUkZl?=
 =?utf-8?B?ZTlpSGV5OXRreFFLS1l1V1RFZ0lXWWJ6TzNjUzdqeDZqb2g5aUhOcEhGQ3Ra?=
 =?utf-8?B?aDB5Y3ZQRTA2eU56SGtSMndTT0Z1d3JDVjBqb1hsNWJRQkZwQzllMENDeG02?=
 =?utf-8?B?RkNzZGlBZmlpMk9PL1F2VGZBL3NoQjdicVBadVhvSTFkTEFtbWVCQ2dHRTRt?=
 =?utf-8?B?Z1NPbU5EanBMNFBsdUVRcno1S0FVSEdxbFRPMi84WEJVZGNjNHNyUXBsL2lB?=
 =?utf-8?B?QzZVTktLWm9uR3B2THF3djFXQkxZOWtyVGRIa1RTZmNKeklWMWRWZ3orWjFU?=
 =?utf-8?B?K1JSTXBLZy9QWTIzbHBGeE83OWJ6cTBtRFB0ZklsaHkvYXlOajZJZWxTMnRw?=
 =?utf-8?B?N3VRSVJiT0JqaXJkcjlFMVZyR0ZkT3NROGpRQ3E2N29LazN6WVhwVmhMb2RK?=
 =?utf-8?B?RWpvZWc1WC9PamxiSzY0WkJYYjZudjdIU0JCdlUvSW1kNGJxZ2FQcWh2djRu?=
 =?utf-8?B?b1IvMHJLNXJGTmhwVm95UGhQLzRBQndBcjE4RG9jN3M5NG10STc2dU1jZ1FG?=
 =?utf-8?B?QU91OGE0Umt4VWVzSTJwUzh4UzF5UGdBWjB2RlJpY1pvd0tMMGZoamJxelpw?=
 =?utf-8?B?VzduY21kQ2VFTFJ5b0t1WmpuaTFlRVNvbjVlMXI1WTFuRGltL1A0M3pPN0s2?=
 =?utf-8?B?cUdrTG9zdzdUb3JyMVQzQW5qZlJBU2x4WEpML2ZINXlpQUFXaGhrYlN6ak56?=
 =?utf-8?B?SVFqZEdvU3E5N2Rvb2VKcjdXUTVUS1RhazB0dHVHdHRuS1FUNm5Vck5scjhn?=
 =?utf-8?B?VjVrRC82bHAxSVFNMVViVlBQaS9HL2hpR2RINjBIUHVNY3VyQkw2TTdFZDVI?=
 =?utf-8?B?OHpSNTN5U3RXdTN6TlphUUZaaDNHbjlyenZmK1BpMmxNdWlQZWZzNjlXbTM0?=
 =?utf-8?B?UmJST2FqKzgrckc4MERKWlFiOEJINFNZUnIwU1lWWlNIbDdPdlNnaG0rNDdv?=
 =?utf-8?Q?Dp7E563KBWRlMtPc8W19jQY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c2f46f0-5887-48ca-32d0-08dd86df4d95
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 05:32:59.8231 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 84bQnLJOJ+sCcVN9mlEUsX4FCXyPp3cO31sx7JhxDhVTcDMuxpv+v2IAyWmfKw8LUjDHfo18KERmWufqvmpITLu9hOSGqGz4sRLTi2A0DLU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7202
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



On 29-04-2025 02:49, Matthew Brost wrote:
> On Mon, Apr 28, 2025 at 04:02:22PM +0530, Himal Prasad Ghimiray wrote:
>> The xe_svm_range_validate_and_evict() function checks if a range is
>> valid and located in the desired memory region. Additionally, if the
>> range is valid in VRAM but the desired region is SMEM, it evicts the
>> ranges to SMEM.
>>
>> v2
>> - Fix function stub in xe_svm.h
>> - Fix doc
>>
>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_svm.c | 37 +++++++++++++++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_svm.h | 12 ++++++++++++
>>   2 files changed, 49 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
>> index 90fae13b77ae..0e672e1e68c3 100644
>> --- a/drivers/gpu/drm/xe/xe_svm.c
>> +++ b/drivers/gpu/drm/xe/xe_svm.c
>> @@ -637,6 +637,43 @@ static bool xe_svm_range_is_valid(struct xe_svm_range *range,
>>   		&& (!devmem_only || range->base.flags.migrate_devmem);
>>   }
>>   
>> +/**
>> + * xe_svm_range_validate_and_evict() - Check if the SVM range is valid
>> + * @vm: xe_vm pointer
>> + * @range: Pointer to the SVM range structure
>> + * @tile_mask: Mask representing the tiles to be checked
>> + * @devmem_only: if true range needs to be in devmem
>> + *
>> + * The xe_svm_range_validate_and_evict() function checks if a range is
>> + * valid and located in the desired memory region. Additionally, if the
>> + * range is valid in VRAM but the desired region is SMEM, it evicts the
>> + * ranges to SMEM.
>> + *
>> + * Return: true if the range is valid, false otherwise
>> + */
>> +
> 
> Extra newline.
> 
> Again this will need to be refactored for multi-GPU but fine for now.
> 
>> +bool xe_svm_range_validate_and_evict(struct xe_vm *vm,
>> +				     struct xe_svm_range *range,
>> +				     u8 tile_mask, bool devmem_only)
>> +{
>> +	bool range_evict = false;
>> +	bool ret;
>> +
>> +	xe_svm_notifier_lock(vm);
>> +
> 
> I think Thomas and I landed on we are ok with opportunistic checks
> without the notifier lock here [1]. I think we can follow that here -
> use READ_ONCE where appropriate, document that the checks are
> opportunistic.
> 
> [1] https://patchwork.freedesktop.org/patch/649590/?series=147846&rev=4#comment_1189676

In the case of a page fault, we can perform opportunistic checks because 
if an incorrect value is read, another page fault will occur to address 
it. However, with prefetching, if the check is incorrect, we will skip 
the prefetch of range and will rely on a page fault, which defeats the 
purpose of prefetching

Hence I thought having check under lock in prefetch is better.

> 
>> +	ret = (range->tile_present & ~range->tile_invalidated & tile_mask) == tile_mask &&
>> +	       (devmem_only == range->base.flags.has_devmem_pages);
>> +
>> +	if (!ret && !devmem_only && range->base.flags.has_devmem_pages)
> 
> s/range->base.flags.has_devmem_pages/xe_svm_range_in_vram
> 
> Matt
> 
>> +		range_evict = true;
>> +
>> +	xe_svm_notifier_unlock(vm);
>> +
>> +	if (range_evict)
>> +		drm_gpusvm_range_evict(&vm->svm.gpusvm, &range->base);
>> +	return ret;
>> +}
>> +
>>   #if IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR)
>>   static struct xe_vram_region *tile_to_vr(struct xe_tile *tile)
>>   {
>> diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
>> index 9be7bb25725c..e6f71ad0b17b 100644
>> --- a/drivers/gpu/drm/xe/xe_svm.h
>> +++ b/drivers/gpu/drm/xe/xe_svm.h
>> @@ -83,6 +83,10 @@ int xe_svm_range_get_pages(struct xe_vm *vm, struct xe_svm_range *range,
>>   bool xe_svm_range_needs_migrate_to_vram(struct xe_svm_range *range, struct xe_vma *vma,
>>   					bool preferred_region_is_vram);
>>   
>> +bool xe_svm_range_validate_and_evict(struct xe_vm *vm,
>> +				     struct xe_svm_range *range,
>> +				     u8 tile_mask, bool devmem_only);
>> +
>>   /**
>>    * xe_svm_range_has_dma_mapping() - SVM range has DMA mapping
>>    * @range: SVM range
>> @@ -276,6 +280,14 @@ bool xe_svm_range_needs_migrate_to_vram(struct xe_svm_range *range, struct xe_vm
>>   	return false;
>>   }
>>   
>> +static inline
>> +bool xe_svm_range_validate_and_evict(struct xe_vm *vm,
>> +				     struct xe_svm_range *range,
>> +				     u8 tile_mask, bool devmem_only)
>> +{
>> +	return false;
>> +}
>> +
>>   #define xe_svm_assert_in_notifier(...) do {} while (0)
>>   #define xe_svm_range_has_dma_mapping(...) false
>>   
>> -- 
>> 2.34.1
>>


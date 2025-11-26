Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93245D1039D
	for <intel-xe@archiver.kernel.org>; Wed, 26 Nov 2025 11:56:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 532EA10E5B4;
	Wed, 26 Nov 2025 11:56:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NJQWuGX9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83CBA10E5B4
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Nov 2025 11:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764158169; x=1795694169;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=XitONr0PMMzp13jvFSuZsufKN03zQRNUWdB7+tb9f7s=;
 b=NJQWuGX9oJlt0iBBsP5P1n7ucei/oJ+hOog51gwfO5/aFx/+jRhGNVK6
 lAxoFnsuC7qCuZT2PSdsHKokx2snyXNtBuxWiix2dQOehkFKZSOk8xmkI
 mL+USTqrdL81KQ5XsX2g1A9qENuQe/f5XCxestyw0OT1PGeeBhBAC+qYK
 coWmVlaULByInC9uWaawAt+ktBAo8Dur2njdN+DRgydZbjpOfN44sBgNe
 Ecfo+S2iEm/Kwhbg4QmsJbCcwlOsSl3KmjG4LZui6hjPCW2HBoFlkAzGy
 gTzGJWZotFW117svn3JHjYGnNlPQpWwGDjQiIOzBSpIVgqJoPA1sLwZxU A==;
X-CSE-ConnectionGUID: vsNgYwuJSGe9Gk5VTtI5bA==
X-CSE-MsgGUID: W7IIOba0QVG5h8RhO1OH3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="53761179"
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; d="scan'208";a="53761179"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 03:56:08 -0800
X-CSE-ConnectionGUID: moQIRM1JR2qJFlLnBwAlFQ==
X-CSE-MsgGUID: 7/3yK7kHSse+D19fc1EicA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; d="scan'208";a="193729037"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 03:56:08 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 26 Nov 2025 03:56:07 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 26 Nov 2025 03:56:07 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.5) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 26 Nov 2025 03:56:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cfJu7a2MiO0+qF1XfJFEBuKfu+qS2yMFHJ+oK+t8VsBkl9LDMjlg1ofhZqV8nZYS91PdsRrs2e2hLwGWzuLDX09/3d3ph4fmRIXBBurffue1CDU31LaY139+bJ6Ocg+WfbfelWQrHLUCVWxyswvaAvLm8BFimQI/vYCWd+D/upA5QhO/OEQiIG1piE+E2i3iKzIOlAQ+Vgc0086wNKU/2GRxrLLi/zEqhO4IxpC4sWCY7SEymRd3XLPpDTZXp3v6Sb+XS/dEPXgEU8z2wEgjW46YztRVzAdB7Ct5KbiNZwTzcO3bfL1qvmuOjictz8RpEysgqpqoL7Mtz26qoVV8gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sxfdM1LsdpuXrE6VI/c1S8TAgGhnI3N2KjdF8rRS1LA=;
 b=vkGWuym9k4MzW4aj7MqkuSaU5R02gbTcvdjPUB/wvlbobcWfEtRLG2UQARdKxHoFDp9WidjH3hQIH3OCujyUUCAbVkjHs0gcQzYkk7+HMuwaY1HrXHm3/qPNS4h9SDSPW64/Gjropl9QB22qkidGvBFgasfpbzGS4VE64f3+eYlX8Bl1DKwllWopo82Y7r8BRRcoQDVzXbtjzv33nTfGoejRlKj9e6SlqMxdga1K5CilGdRC7qTqXVSmlBqNTm9J6+8iRlVIak9ft6E7f51oEZWAHDmXnR0w6Zc4oD2OJRb4vOEaSBE6F28tmEs520KFtrZn70zRBpEaWE7meTyKEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8208.namprd11.prod.outlook.com (2603:10b6:8:165::18)
 by MN2PR11MB4663.namprd11.prod.outlook.com (2603:10b6:208:26f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Wed, 26 Nov
 2025 11:56:05 +0000
Received: from DS0PR11MB8208.namprd11.prod.outlook.com
 ([fe80::ecb0:7475:84de:ca9c]) by DS0PR11MB8208.namprd11.prod.outlook.com
 ([fe80::ecb0:7475:84de:ca9c%5]) with mapi id 15.20.9366.009; Wed, 26 Nov 2025
 11:56:05 +0000
Message-ID: <63892dac-93da-49fb-a265-d8a1753f184b@intel.com>
Date: Wed, 26 Nov 2025 17:25:59 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fixeup! drm/xe/xe_pagefault: Fix potential uninitialized
 fence usage in xe_pagefault_handle_vma
To: <intel-xe@lists.freedesktop.org>
References: <20251125102428.2325859-2-naresh.kumar.g@intel.com>
Content-Language: en-US
From: "Yadav, Sanjay Kumar" <sanjay.kumar.yadav@intel.com>
In-Reply-To: <20251125102428.2325859-2-naresh.kumar.g@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0016.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:179::6) To DS0PR11MB8208.namprd11.prod.outlook.com
 (2603:10b6:8:165::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8208:EE_|MN2PR11MB4663:EE_
X-MS-Office365-Filtering-Correlation-Id: 724ec02c-bb0a-42f0-a504-08de2ce2c747
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SEs5ZEJUR3I1T3V1RHQyNkYvY3Fvcjd1eWRoMVlPcEZhQnZadDdVd1B6anRM?=
 =?utf-8?B?WHIyWnhZVThPdi8ySU5pU1M5ZVhoRDM1b21HWStPSGwvZzBNMjFHUjJkL2RS?=
 =?utf-8?B?TStnSnBORnQvUmpaWkEvVFVQU2UrazVOTWdJc05EcXdPbHhJOGJvUWFoWjd4?=
 =?utf-8?B?VGJVT1M3Ymt2ZXllaHcrdHJrS0dHSDE2bkl6YUE2d0gwNWFzY3Z1VE85UFQr?=
 =?utf-8?B?dWMwSUhOcnVPRSs1YzZHYXV5VjlYejhSU2dQUjZvTmVkWHNKVVBPbm1NRGs2?=
 =?utf-8?B?U0NwWFdjd3dnNE5zdHl6WVFYTDBMNkN4NDVzaW9kdXBnMzJ5WGtjYTJvN2NL?=
 =?utf-8?B?NjZzMHU3eTg4eXNMa1lQV3lsazNxc0xCTkd0TnMzaXl0em5uYW5JZ0QrSjNi?=
 =?utf-8?B?SFAwR2s2WDF4RTJwU0dUb0pTakpBZHZ2MndUbDVtbkNocENRSExZL0JMN3Nu?=
 =?utf-8?B?alNTTFB2TUhOa3ByK2tFRFRxU3BZLzdmTUUwVXpaZW5LT0hHdEkwcitSQ3h0?=
 =?utf-8?B?TmVwemowK2pkSVdmNFBFRnQ1eW55TE9sa1h4ZncvV0E4WHRVbFZKNWZQWUtZ?=
 =?utf-8?B?U2xmaFgwOEdobDlhTXRLL1JLY05HbktXQk1ZUkZPdnZPdjE3UUdYSFhZd25z?=
 =?utf-8?B?Ny9PT3RoN1NoZnFTWmRlL1lSQ3J0eVM2RzFlOTdrSFZMaEpCRlU2NUkxVjhj?=
 =?utf-8?B?WVBBRGRFVG1MNFlDeXVRYjl2b0lnTTF0NkRveHpqd2ZkbytQSmxmQjl5UnlK?=
 =?utf-8?B?NXl0SDJKSzg2WTB2TWlETk1IR1pSMjdvSDdRUysxUkZNV2I0VjhWOXQwWlpT?=
 =?utf-8?B?QVlWd1NsUEREQlNnczA5UjBodnFJRFJwZFBjVm5zc0h5WXRyTEhHem9vVjYr?=
 =?utf-8?B?WFE4VWRpZ1VQVFZZRW1oYW1FTzM1ZmhQYTZGS09VbmkxRnJ6VEFRQ0s2VDNk?=
 =?utf-8?B?a2M3MUszcGpWUEE1Q1ZHS2lPRmxQeEl4OTcxKzcwZ0hEYW54TVdQZXlsQll2?=
 =?utf-8?B?ZlMrNkhkeWR3ZXN5SytqK3lVQ2RVTEtFTVdLZjZJSVBaSWdOMXQ2ZEFJRE5S?=
 =?utf-8?B?M0VWcjUvQ0JZU3NreS9HOGVYeDhoOENDNUFuKysrcmNaeE5RaHBIcFBqYm96?=
 =?utf-8?B?VVlyVmpBQmhiREN4MVJyd1dLekR6Sk9XM0ZmRDA4WmMyb0xieFpxT21wdkE5?=
 =?utf-8?B?VlZ2b3JacHR6bmVWOWtGeUN1VEFuWk1EcmRJTEVneUY2SStWTW5QQWtSV3Nk?=
 =?utf-8?B?TUNRVmJibXhGQ2pMa2RxcnlNbjRCTTYrejZRdkM3M2FzcEJKSXRYM0F3dVB0?=
 =?utf-8?B?bkVCZkdNL1E3NVFOeWdhSjFqR1FZKzRiaUFzRWVBeGpTNlNmNnJsM3UxSU9l?=
 =?utf-8?B?cnRyWlRENlhzdWxGcTk3cFQveGg0YWlFYnlYL1pydTdVejRHb1Z2TXZ0SkRZ?=
 =?utf-8?B?WFIxVGhEWTRrcTkvR2tmeE04QnBkKzBuazFrdFdhemFEUmViNkh4WTJMRVQy?=
 =?utf-8?B?bFdGWFRSck1PQldxUzYwWlJORVB2UnRKWU1xZlhWU3MxSEZ5SnVrQ2RrdFht?=
 =?utf-8?B?c2t1UlM2L0hTV3FMSVVmdFRmTm1rTFY4MTNMNTFMaVBhRmE2dzBKaGJuM3hM?=
 =?utf-8?B?TkhKZGVLangrM2hITC9WVGNsRnZMQ01XS2FFSzliTFVOZ0U0MEVNYlIrYTJv?=
 =?utf-8?B?MFozN2hTYzlqS1I5N3Q4VkR1WWJpMjh0N2t0Y0Y4OG5qODRicU16OHNWOFJS?=
 =?utf-8?B?VTk3YVJRUVhTODB4UWV3WUxKRW1zTk5UZ3dDRS9oSkJBMUE4OU9HR3dtSWlV?=
 =?utf-8?B?S2Q2VkhSOSs3UXZVNG9rdzRQMHhXV2hIRU9xUytLa21HZEUwRmtMRXZTRG5j?=
 =?utf-8?B?ZndJYy9IVmpyNTVTdEF0UWNaQ2labjdvR2NmY2RSTFRtdzIwUFFVdzdYMXlN?=
 =?utf-8?Q?LpBL/hXhS03m7WfGuj50h/dE9AtGRz3F?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8208.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QXpjUmFnNStkaVQrS082Y21Rb3FJYlVjaUpQMFBvVGErbjZLNlBEUExjb09U?=
 =?utf-8?B?MlNDN3crMUhTM3ZKMUdYbGp1U3RLMk5XV0lSSDFHOFNjZjRka0xnQmg3Um5z?=
 =?utf-8?B?dHBKVi9TR3MyeG5aWTRBK2NMNmJYTnZ1WTk3dDFIcHlTVWJoU0ZJMEkvN1NX?=
 =?utf-8?B?UVEyUTdEd2YxRDJtRE1CWDV3V21GRi9iam95QkVKa1ByRUxzSU9jV2RDRXh5?=
 =?utf-8?B?eDFMcFNHc25DK05LL3daTEFuaEozTjZjSElCamNyNW4xUmk0OWc5bnF4akJm?=
 =?utf-8?B?endxcWQzdDJYRnhtb3FHZER3R2N0RUZTQm9BRnRoaVI4RkJVNFl0cUQvSGhr?=
 =?utf-8?B?YTIxSVNXdDRQNnhoQW93anRKTnJSckRjcVRHdG1MdXo1bzdJQXZKRkZzSDFh?=
 =?utf-8?B?VU96NWYzck5MbmtKTGRBcTl4ZDJNbzZnWHNtNlVWZC9jVWNZSVRQYzlsRTlq?=
 =?utf-8?B?TVR0WDh6TCtrckRwTktHdkZHd0RxUVBkcnhIa3NvR090QUdadGRyY1pCSDVv?=
 =?utf-8?B?N3VIdnNFQmI4SlNjSG5JdHQwbVBiN2hoVVVTQXFocHp2anJUR2gzRzFLOWpZ?=
 =?utf-8?B?djZBc2p5d0pnUzVLYitFS3BOVXNoZFFzcG5HYldKQzFyZDFJSWJZVUxnZFdj?=
 =?utf-8?B?RmlrRG1HWk52alJCWi80djFXTUppTTZQYVFDMG9TMUJlYlJSRTVYc3g5Yi9O?=
 =?utf-8?B?dTNUZWlXNGhlSExHR0h5RHExd0ljMWU4cm9IcStlOFRsYlZSbkxnM2tSNktK?=
 =?utf-8?B?NFFCM25NMUVuS044Y0FRbmRRbGdYM29OdHZYa0ZJMTQ0bHN6bjBjbFl5clJD?=
 =?utf-8?B?YUVyWkN0S083NWo0aHRsU2lVMk56S0NXUWhQVDRXc2tJVkxDcnAwNDVGamNJ?=
 =?utf-8?B?eXRmVUY3UE5CQVBUaFdUcEtpRTRwS2VVSnA5VmJ6Y01Cb1hyZ3lHTXo0bUc2?=
 =?utf-8?B?OGJvWHBhRThhUTM2dUNsdWFYSTdMYTkxTnlaSGZJN2pYYmxreHh1UkJ1Q2xL?=
 =?utf-8?B?TjQxOXRwNEczd01VMEE4RXlTcEJFSzc1dHNyMDYzdlIzLytKVGNnYWRGczZP?=
 =?utf-8?B?ZXdXc0tXd0RoaWErbGxTWFprWVBHUlovdXJTMFVabE9pSzJrb1QzakJyR2pR?=
 =?utf-8?B?L2tXYXUxU1Roc0tVaCs4RjVzRHFKNWptc2xiaXV6OXArK3YxQkR4QmtYZ05S?=
 =?utf-8?B?cW8zS3UwY3V0V3R5ZFF4a2tuNjlFeDdmd1V2TFl5ZW1hQXFRNXViTDM0eGtU?=
 =?utf-8?B?cWdqL3ZMdkhuYksyYjdiL0RRa3RNWU85VWVFcklGdml5M285VFM1V0ZlT0lP?=
 =?utf-8?B?MmQ3NTl0dUVRVm5QT0d6RFZ4S3RSNDBmMkh1T1lGSDQ3dUJPeGMyM0tiUktX?=
 =?utf-8?B?djcrOU9wUHNSK2xuNDNGRThwL3hIb1pvS1NiS1NKSGtFZ3RQcDNWengwWGxX?=
 =?utf-8?B?UkUvUGpIb1N4THM3RTJuODVoMk0zUHp6S2NKQTJjRTArV0ZPRVY2dFQxd2VV?=
 =?utf-8?B?VzREOEtxTGN3MTJVaFpLS1AwTmJaYWR1VVllYThaRFkvcklZdDdTWkVGT2VM?=
 =?utf-8?B?ektpUHhtNXJDWG5sOGRueDVEV1dmRWlGVFN4UHdqR0lCTDJCam9rRUw2dUh4?=
 =?utf-8?B?UWpLT09kcHlWQUR3UlU4SnE5aW5HbDNoTXdHWlF6TVkrZXY4UlNtRDAvNllo?=
 =?utf-8?B?YnhGbDlWekpCK2ljVGtPaXcyUHFoeVVVS085dEpWU1dwSHNPTUZncGVQV09M?=
 =?utf-8?B?NkJxalp2TU1lQm9MNHl0Vnd1eFBsQThYYXlhcWRBR3dzamVVNE5jbktaZnZ3?=
 =?utf-8?B?UUQ5TXlUVUpWSllSbzZ4cFNMNXBnR0hVNWN3eXcyYkxlUnp5OGpvVVNrSE9U?=
 =?utf-8?B?VVNQMVh5QkpCU1UyeFRieUpSRFpmSDk5YkV0MlBRVHQ2a0ZpMjk1V2VmWW9S?=
 =?utf-8?B?U1JVNlI0dVVDcFl3ZVJvN2UvRzVNZWNDUFRoaHowb0I3T2FyaFFiVW1NbmNJ?=
 =?utf-8?B?VUxicDBoSWg0UHh0Mkw4LzdZRG80VFNQb1pYNlBKRkdqYXJOOTNaem94d2NT?=
 =?utf-8?B?SG03UjNYKy9nSEpGSEVtVVpGOVZ5MjBHSDYzTy80NWN3dU9jSk11UHJFeWpX?=
 =?utf-8?B?b0JIWk5iL2E2THMzL3B5OHRIZFRzTWlKajNYZWxMMmJ2WW9RUDFweENaOSta?=
 =?utf-8?B?QXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 724ec02c-bb0a-42f0-a504-08de2ce2c747
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8208.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 11:56:05.4242 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2PvumIShmekhYdgH5dIyVhMrZduf7T4h9ReWX1S7duXEVinfTnRB8XepNFqwXYmKFhbBohRf/MX9aF7ECNm0o89u0yCNMix+zUygxxuc/sc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4663
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


On 25-11-2025 15:54, Nareshkumar Gollakoti wrote:
> The variable "fence" should be initialized to NULL,
> and any usage of fence should be guarded
> by a check to ensure it is not NULL
>
> Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>

LGTM

nits: Add a dot at the end of the commit description.

Reviewed-by: Sanjay Yadav <sanjay.kumar.yadav@intel.com>

> ---
>   drivers/gpu/drm/xe/xe_pagefault.c | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
> index afb06598b6e1..401f1835939b 100644
> --- a/drivers/gpu/drm/xe/xe_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_pagefault.c
> @@ -70,7 +70,7 @@ static int xe_pagefault_handle_vma(struct xe_gt *gt, struct xe_vma *vma,
>   	struct xe_tile *tile = gt_to_tile(gt);
>   	struct xe_validation_ctx ctx;
>   	struct drm_exec exec;
> -	struct dma_fence *fence;
> +	struct dma_fence *fence = NULL;
>   	int err, needs_vram;
>   
>   	lockdep_assert_held_write(&vm->lock);
> @@ -122,8 +122,10 @@ static int xe_pagefault_handle_vma(struct xe_gt *gt, struct xe_vma *vma,
>   		}
>   	}
>   
> -	dma_fence_wait(fence, false);
> -	dma_fence_put(fence);
> +	if (fence) {
> +		dma_fence_wait(fence, false);
> +		dma_fence_put(fence);
> +	}
>   
>   unlock_dma_resv:
>   	xe_validation_ctx_fini(&ctx);

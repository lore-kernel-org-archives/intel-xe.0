Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA610C71157
	for <intel-xe@archiver.kernel.org>; Wed, 18 Jun 2025 06:01:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D33210E3FF;
	Wed, 18 Jun 2025 06:01:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WNJ31erS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08F3B10E3FF
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Jun 2025 06:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750226473; x=1781762473;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=fsq4bg1/yK4WOy+Elq227OeuAEk3G5GuM6xQyApup1M=;
 b=WNJ31erS/OIlo4zzniItlYXodQev0Qdgu0VWsQJHjjgvTQTOhfsfG9vm
 MjPbCLgX61u4rGkkUyoEdHL0P7Hl07hgCrV2EMQRwu+j4MO3JpbPnRZHn
 Q3+yn0+EpzRXWks1ZhuCoko6O41qUHKzq2XmwZtylqec5kycoy71Eg1IN
 J+tiWQuHXhtAjD3/dy2IiqR0dAHHWLQNeda88JX6hDu9zUx806ewLfWpA
 pytFdwvd8r813JfD5OnZJdt2x1EjA04XN8QrIXAn2tpYX1McU7bUEXf57
 aVSPLcyKrMNxL9z7/rCj0c3pz5llvLx/7WwAthLEERqHc6MVQI9ZcU93/ w==;
X-CSE-ConnectionGUID: ZnQkNUWoQRuX36eipEh8fA==
X-CSE-MsgGUID: gIBt0ZqITbm2ajvlWVg8Eg==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="55044276"
X-IronPort-AV: E=Sophos;i="6.16,245,1744095600"; d="scan'208";a="55044276"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 23:01:10 -0700
X-CSE-ConnectionGUID: uPCx9pbAQQW0alyNt4RBPw==
X-CSE-MsgGUID: P91UJXqlRuqaYATWN4glzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,245,1744095600"; d="scan'208";a="149778507"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 23:01:10 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 17 Jun 2025 23:01:09 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 17 Jun 2025 23:01:09 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.53)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 17 Jun 2025 23:01:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yMVirdN9aFTByIJIzvWOjsIXJ54SK8Oc7aF2shPfQkS2Oloxc0EJJdxSx1G5wNqYmbD0yk4PFC3D6yIjnK6vNaBd4yLH4i6akfwB8RWja+ayShIBT9WsWdCLfN9nNvUu4QNFbC1098GpbNqFbIA8m2CJbgjQ8WMLL5ypHGgH3pLxJT5gStJNXA4Aw2Wb9sP6K62mE3xYCfTogQXOM32UmRFQuv8Qa/A775p7JcfmM52ZBF6GGIyNvHFAw4GbPt3aCfccq1UXP7lf4NpV7D548WJJtmHZQuLzv0mTuJvdvoskMM7N+MPlRFzAhLnzHAwujRYwrEfcGLi54wwR6Yh2Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Djo0PKoewc/mV1Qtryovlo1fIMiwaefIwCSee5r1H64=;
 b=AiHR1b3FRwkAGttLLGHYYw6X8u8sDlE3gMPpdNTlneCZSksTJHEy9W89ztafJp3Lwhw/l07gBrf/q8JZzpJ/WEfPfZU5q9h14QK6lOkyJpYsv5uO5jImaeVQJxlMq9SoEfHbRw6uvb26FbFF6PwRQL0E9Occ7+h7hQgSVZHH4MBVrVyLQM5QHTAQfybL6XUozBJEsOmkb4hv3CjRT/tdNYe2etX7pRK500HM3nOZEmAEtRh/7Nk1brYz1ALYHwrbgLNhyV5Fpen/8bS6UvD62cRUanDz8GzF2znSF6mwgqTiQbZHoCxVPAM+xIoHGMBsMOgsMHTXTVYHNg0KMpep0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5703.namprd11.prod.outlook.com (2603:10b6:8:22::5) by
 PH8PR11MB6658.namprd11.prod.outlook.com (2603:10b6:510:1c1::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.18; Wed, 18 Jun
 2025 06:00:51 +0000
Received: from DM8PR11MB5703.namprd11.prod.outlook.com
 ([fe80::f734:e507:3083:e454]) by DM8PR11MB5703.namprd11.prod.outlook.com
 ([fe80::f734:e507:3083:e454%5]) with mapi id 15.20.8857.016; Wed, 18 Jun 2025
 06:00:51 +0000
Message-ID: <9eee14e9-330a-4a41-92e2-a0610114236f@intel.com>
Date: Wed, 18 Jun 2025 11:30:44 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] drm/xe/xe_debugfs: Exposure of G-State and pcie
 link state residency counters through debugfs
Content-Language: en-GB
To: Soham Purkait <soham.purkait@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>
CC: <lucas.demarchi@intel.com>, <ashutosh.dixit@intel.com>,
 <riana.tauro@intel.com>, <jani.nikula@intel.com>
References: <20250617171600.2905682-1-soham.purkait@intel.com>
 <20250617171600.2905682-2-soham.purkait@intel.com>
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <20250617171600.2905682-2-soham.purkait@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0045.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::20) To DM8PR11MB5703.namprd11.prod.outlook.com
 (2603:10b6:8:22::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5703:EE_|PH8PR11MB6658:EE_
X-MS-Office365-Filtering-Correlation-Id: b65ee3f3-de82-4ca9-6d88-08ddae2d7ad7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eXh1ZS9PWVQyZEgrOE94Q1V2SG1QZ0pkV2lUVG9PNCtBcjg1RWsxUndidFBl?=
 =?utf-8?B?T1FkVXorcHBGYll4eHpqWm1nZXY3V0R2eXZiNkI2TDdZMDEwZEZjN3VCOHRC?=
 =?utf-8?B?dGVhSmRiOS83dXpQRVVEVzFuOUlHcEtRdFJkbGVhRHJ6UzdDcHVCbkt1ejZC?=
 =?utf-8?B?aHRuRUt0TnExUlBTTEJ6MjMxUmdxN082bXdObllsdURLc2kvS3k2dXNKa1dK?=
 =?utf-8?B?TENxblJGM0M2eVBwRE1TWUtPcm1ZaGh3WjZzQnIxbVk2TDdMTWI0ODlOcmlS?=
 =?utf-8?B?MGJKWU13N1gxZFQvK3huNXhuMDFCNGZVMUp3MTYzckpkMWNyYndKY3dxZ2Jm?=
 =?utf-8?B?aENsMm9sNnBJTW5sOGZSK2tNTWw0ZjBvMElpcG1TL1ZqclRTT0crUFhZeThH?=
 =?utf-8?B?eVRQOTFvM2NLdVZrTGR4MDNQTXVHU3pnZjZZd2wwdkV5aU5NT2xIa2Y0bUx4?=
 =?utf-8?B?d1JFSzlEcE1jaHM1U2lUcjZ3TVMyNUlrTTY5WnAwOExleVU2ZmFaa3RrZ2ZY?=
 =?utf-8?B?d3JadXZjb1BPd3pyVEhLUlRtdFByMVZuZm12bVBTTmxyTmw4c0xSZWFPVjJJ?=
 =?utf-8?B?amQxSnYzOWUzTGZ1bjN5SkdpYWpiZi9KQ21RNlBWUHRQdTZ6OTNEcm5LWnBF?=
 =?utf-8?B?ZFNXeU9VSUhpTzd0eTBuZEVieml1RU5TRHR1T0xXWFFIUjBaV2JoRXBNQU9s?=
 =?utf-8?B?NnlnTHFpVmVOOUpoWlF2NnArb0cwRDBPV2JFa0VHaFMwNDdMN24zTWFnUHJo?=
 =?utf-8?B?ajZkYUVmM0N1M0djVTYxanhjZUcxT01LK2QwNDhiVURvdSs0czJNR29PSDF2?=
 =?utf-8?B?WDd5TTN6VUJ1K1g0dWt0bXkzblM4SDlIOHpjV2l1ZWJ5ZVNBeWgzclR3cFVV?=
 =?utf-8?B?cC9mV2lZbWx3ZTNIcHBtSHVWWS9DQUx5Vkh4RHJZeWZWZ1Nkemt5OEl2UG95?=
 =?utf-8?B?a0xSSDhENnNDbFA0VWw0WnpqNTFSVG5pejYyc3J5OXlTaTZSbVZFTnIzNWc3?=
 =?utf-8?B?WE5WWDEwdDFpSXhDLzN0OWJGbGNnd3QwS25meExCOHFmNml0R0tHZWo2S1kv?=
 =?utf-8?B?ZUVxSkxrS3AzOU5XMkVZVnMzOStYWTlkSXZnNzh5MkkxcGVUV2RBQmFJMTNw?=
 =?utf-8?B?ZHBrdU90VGVzUXFzZHo5bEUvNWVVak5BV3RFY2pDM0hDVy9Oa1ZCeHEzcjhN?=
 =?utf-8?B?TUNmZmlZbUpaeExoTE84bnU1eGlqT1hhTVNHWHJ3NHFQZTc0Umx0d2VJU05Y?=
 =?utf-8?B?eXdlem5DbHp2N1BUa3ozMFFISmFzNWVrTFNkZWJ0S1hMR005NGp4VzNUVHNB?=
 =?utf-8?B?bG90WDVTQWRKMGlYQ3dzeFRFZHN0ck8zVU8xaGs5MkpyS255ZVRzSS9YNVpX?=
 =?utf-8?B?elZ3YTlocFJ6S1RqNSs4cVFYeDAyclY0b0loaXZ0YldGYjBjUFhSTjM5V2Qy?=
 =?utf-8?B?aVFSZmFEZmFMcVd1N2NzMTUrZ1BTUHZtVmtLY2ZzemZrWGN4NHNUSXlQTjVS?=
 =?utf-8?B?RGJZMmtCM3E2dUp0SmpFOGVlNzF0N0toOUc1VFFhUWJ1cDlLWWtsSTgvVzdN?=
 =?utf-8?B?emQzNHlJQlBMZFRSSGlFMXlyZE04RFh3Mlg3TjRTQ2k4cXRmUGRmVjFYamQx?=
 =?utf-8?B?VGZZVWJZT0NUeHBJWmdaVXhJOVBBQk9VRnJIVXBGcFcvOUVRMVFxWW1BWllZ?=
 =?utf-8?B?RFc3RENha2JTVUUxaUNQa0psLzMvemJMdVh2N0QvcERPM3UyY0lLaVlJbkx5?=
 =?utf-8?B?MldCcEkwWXEzajhBbzBxRWNnYjNHcldKNGtHeFFYNGZJTWtzT1BzMkplaWo3?=
 =?utf-8?B?dnM4NzNkalhZdndwTjZ6dVI1dk1jWVhoVHJ5U3JQU3FUQWlDN2RyQ0taZkxC?=
 =?utf-8?B?KzFSaktINTFHSGJGL2IwYkhGelhXSnJPVWxndzJLY3hnS3VrbGloUkFtbmpq?=
 =?utf-8?Q?4Iaq8++IJpI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5703.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cXFwOEgxNndpR0tZSG53NlA0OTQ0Um8ycklVTmh0RHIxN095Y0tKZEtEdHNt?=
 =?utf-8?B?akR1RWNZRTBHanVIMWxYQzBZbXN1OWJ1L0hxeHQvT1crVGNQdGUxNFp4Y3NC?=
 =?utf-8?B?WGV6OFBqMHQxQTVYUXhMRXk1d0JxZjlnZnFVOC9zdmNiZXVzakUwOUFJSHdU?=
 =?utf-8?B?QW5DVGRMNGZtd0NXaXZRaGE0bFJuT0FBNTFrTEJJcHY5d0VDQVkyL0gvQWM1?=
 =?utf-8?B?enBLV1RzRFhwVTJUNXJaZm42TysrSWhEUUFsZ01wTWxDNXgwQjZqc2lLVU1a?=
 =?utf-8?B?QmRTaVhHM0Nqc1g0V2QzWDZSdUUyWkdVNUJLN0MwZExKQnFvVkoxNkxSejBN?=
 =?utf-8?B?aFpaNUxxbVBOTEJMSkNPa0dXemFuQ0VwYTB5MEVaRVdITEpFUlVwOEhEbkg3?=
 =?utf-8?B?dWg3L2syL2VycnVFcHo0aU1LWmxsQXJEOHJKMHFwS2xBb2xUWTltMnY5cXZP?=
 =?utf-8?B?QzNZSUx6K2ZiamZKSDlwdGk0M2dYbkNJYzY1UHJWTitJMTRNT1FSSmVWdkZt?=
 =?utf-8?B?L0lmMlBuTVlRUnlBK0EzeDRvYWlEb2RhdHQxQVQxblF5Nk82TGE3RlUwQ3kx?=
 =?utf-8?B?S0tTUS9pWFYyQ2RkUzZrTExtNkQ2ampsV05HMFpuOUtiTHZWOUJGU1RhY2E4?=
 =?utf-8?B?NHlOMktBSHNVRnUvaWxUdG1DMXJ0MUN2d0I1TEFIMmExbnA4VEFrZ1hOZXFu?=
 =?utf-8?B?aXhsOTgxYlRZK09laE5PZEZ0dC9VSmY5aEtoZmdFUlU2UnNVcHZBaUVXRnZs?=
 =?utf-8?B?bGMzYXNMaFo2cjd5S0xpTGFWMllFZU1JdjNYTTFlVWZoa21vQWhkWTB2TmpN?=
 =?utf-8?B?WmhZaUdpZDhoOVhNSDZGcjFUWXVaM2VUNWtGM2YvQmd4QTZsVlg1SW55bm9I?=
 =?utf-8?B?RnRyQ2k0RDRIaVNLTHNpYzRuZnMrVjRocTZ5U1ZodGxjS0NxeFJVTnZmTE8v?=
 =?utf-8?B?SkljSWJTZ2ZpbWxVdE5ZWmNUQTFjSm54bjNnQk9UMWQzQVN4NlBvT0J6RjRG?=
 =?utf-8?B?MWhpOE1GeDByUFFjNDFHQVBmaGlvVVFCUTdsTW0xcXlJL1NXVFJvL2FKSWE5?=
 =?utf-8?B?TUQ0NGtpS0ZML0ZHaVV1clFmV2JFYkI0VnEyQVV6d09xQ3AyRVUzd2JybkpX?=
 =?utf-8?B?ZFJCclFDM1MwT1I3d2djRVEyVUZZcHZTTSs5amViTUc3bHlBV2pTOEpWdy9n?=
 =?utf-8?B?eVVqaFZiaCtMc1Y3WUtYM1cyY2p1d2NhdDVBR2szUFpKMG8vVmZnbHlaTW1F?=
 =?utf-8?B?OTk3TmFYc2NhMzJjYjltM0RRbkRyRTNVY1ZNQ0dWcHI0bHU0T1ljcTg2OUV5?=
 =?utf-8?B?V2YrZ0EvTlg3UGszTlE3b3JUais1LzhrVVRWUktOanFhbXZ6OElvWmdwenVx?=
 =?utf-8?B?cncrQ284S2NQNGZwNFdBQ0Fhd3VzWnhjbDBPdWJuMlRSRFlwU2JUdEF5WHdj?=
 =?utf-8?B?bXI2NUFhZFFtWkJWK1ZnWmVVMjVmdStZUlRyWGhxeS96RkJ0eDd1bG5hZ3FY?=
 =?utf-8?B?LzNPL3RjRmdaUjlDQytISUszalErVXhrc1B5QXFGSk10VUZmZ3B2UHE5TnMr?=
 =?utf-8?B?eUdBTG9TUzdHSjUxblZDWGV6L09BNC9ZQkZoR3c0Y0tPWjBUcGoxbTZJMkgy?=
 =?utf-8?B?dkx0bG9HQTJoMis3Sy9MRit3OXZ0aWlhOUV6ZktVODRFSmdXL0w4N1RVTlpj?=
 =?utf-8?B?WUplN0s2c2dNd2IvaVVkT0MzMzlycEdaQWpXSnBKWEFNcFlidzZQcE9MdnN1?=
 =?utf-8?B?d3JhTzU3a05IWW0rZ0NEcm9abnBMTjZRQUZLQVBBdGthTkxQM1pEcFRPN0l4?=
 =?utf-8?B?M0gvcEltMk8vSFlrOC9iKzZXRUpKNk5JKzdtTTh3cXZ4T3paRG95bjllTzRY?=
 =?utf-8?B?Q3BEZi9KRXVoNTF6TUQ5MlhTYk5rQUQ0dzhBc1o2OTFNUjZzMkQzbjF0eEVj?=
 =?utf-8?B?S2FLMmZSMTFHRnhET282TGQvOEFCNEJwMUZvZUpocjBKSjZkdEZmNC95eGtS?=
 =?utf-8?B?UkJWS0xWaTZsS3VobndJWnhabXZ3QmVNeUM3T2kyaHk4b3ByNjlSVUtXS28v?=
 =?utf-8?B?M2Jva3BjY0tWeUdvRTBuaFkrZmQxRjlCVHNaUE1MQ2xrd0pmQmJndWYxZ2sv?=
 =?utf-8?B?ZVJxaDc2WFo4V2hla2ZETkgzZGkxV2x5THlUOEtpMVNlbVUreUV1VUVnZFdx?=
 =?utf-8?B?M1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b65ee3f3-de82-4ca9-6d88-08ddae2d7ad7
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5703.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 06:00:51.7450 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qc61PvvQUnQFbEf11cbnWscLHUGDviv6RJ+BYyV169aZlS7CpDtRQ3a4nCBJUJIPsbpdQn+e/nlst/mqpSX78g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6658
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


On 17-06-2025 22:45, Soham Purkait wrote:
> Add two debugfs node named dgfx_pkg_residencies and dgfx_link_state_residencys
> in order to obtain the G-State residency counter values for G2, G6, G8, G10 &
> ModS and the pcie link state residency counter values for L0, L1 & L1.2
> respectively.
>
> V1 : Expose all G-State residency counter values under dgfx_pkg_residencies. (Anshuman)
>       Included runtime_get/put and removed drm_warn. (Riana)
>
> v2 : Moved dgfx_pkg_residencies from "/sys/kernel/debug/gtidle/" to "/sys/kernel/debug/".
>       Included dgfx_link_state_residencys for dgfx_link_state_residencys.       (Anshuman)
>
> v3 : Included check for BMG and dgfx and helper function for repetitive code.  (Riana)
>       Used drm_info_list to create the debugfs. (Karthik)
>
> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_debugfs.c | 71 +++++++++++++++++++++++++++++++++
>   1 file changed, 71 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
> index d83cd6ed3fa8..39c5fce3e4fd 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -11,16 +11,19 @@
>   
>   #include <drm/drm_debugfs.h>
>   
> +#include "regs/xe_pmt.h"
>   #include "xe_bo.h"
>   #include "xe_device.h"
>   #include "xe_force_wake.h"
>   #include "xe_gt_debugfs.h"
>   #include "xe_gt_printk.h"
>   #include "xe_guc_ads.h"
> +#include "xe_mmio.h"
>   #include "xe_pm.h"
>   #include "xe_pxp_debugfs.h"
>   #include "xe_sriov.h"
>   #include "xe_step.h"
> +#include "xe_vsec.h"
>   
>   #ifdef CONFIG_DRM_XE_DEBUG
>   #include "xe_bo_evict.h"
> @@ -30,6 +33,23 @@
>   
>   DECLARE_FAULT_ATTR(gt_reset_failure);
>   
> +static int read_residency_counter(struct xe_device *xe, struct xe_mmio *mmio,
> +				  u32 offset, char *name, struct drm_printer *p)
> +{
> +	u64 residency = 0;
> +	int ret;
> +
> +	ret = xe_pmt_telem_read(to_pci_dev(xe->drm.dev),
> +				xe_mmio_read32(mmio, PUNIT_TELEMETRY_GUID),
> +				&residency, offset, sizeof(residency));
> +	drm_printf(p, "%s : %llu\n", name, residency);
> +
> +	if (ret != sizeof(residency))
> +		drm_warn(&xe->drm, "%s counter failed to read, ret %d\n", name, ret);
> +
> +	return 0;
> +}
> +
>   static struct xe_device *node_to_xe(struct drm_info_node *node)
>   {
>   	return to_xe_device(node->minor->dev);
> @@ -82,11 +102,57 @@ static int sriov_info(struct seq_file *m, void *data)
>   	return 0;
>   }
>   
> +static int dgfx_pkg_residencies_show(struct seq_file *m, void *data)
> +{
> +	struct xe_device *xe;
> +	struct xe_mmio *mmio;
> +	struct drm_printer p;
> +
> +	xe = node_to_xe(m->private);
> +	p = drm_seq_file_printer(m);
> +	xe_pm_runtime_get(xe);
> +	mmio = xe_root_tile_mmio(xe);
> +
> +	read_residency_counter(xe, mmio, BMG_G2_RESIDENCY_OFFSET, "Package G2", &p);
> +	read_residency_counter(xe, mmio, BMG_G6_RESIDENCY_OFFSET, "Package G6", &p);
> +	read_residency_counter(xe, mmio, BMG_G8_RESIDENCY_OFFSET, "Package G8", &p);
> +	read_residency_counter(xe, mmio, BMG_G10_RESIDENCY_OFFSET, "Package G10", &p);
> +	read_residency_counter(xe, mmio, BMG_MODS_RESIDENCY_OFFSET, "Package ModS", &p);
> +	xe_pm_runtime_put(xe);
> +	return 0;
> +}
> +
> +static int dgfx_link_state_residencies_show(struct seq_file *m, void *data)
> +{
> +	struct xe_device *xe;
> +	struct xe_mmio *mmio;
> +	struct drm_printer p;
> +
> +	xe = node_to_xe(m->private);
> +	p = drm_seq_file_printer(m);
> +	xe_pm_runtime_get(xe);
> +	mmio = xe_root_tile_mmio(xe);
> +
> +	read_residency_counter(xe, mmio, PCIE_LINK_L0_RESIDENCY_COUNTER,
> +			       "PCIE LINK L0 RESIDENCY", &p);
> +	read_residency_counter(xe, mmio, PCIE_LINK_L0_RESIDENCY_COUNTER,

register offset is wrong!
it should be PCIE_LINK_L1_RESIDENCY_COUNTER

> +			       "PCIE LINK L1 RESIDENCY", &p);
> +	read_residency_counter(xe, mmio, PCIE_LINK_L0_RESIDENCY_COUNTER,
same as above offset should be PCIE_LINK_L1_2_RESIDENCY_COUNTER.
> +			       "PCIE LINK L1.2 RESIDENCY", &p);
> +	xe_pm_runtime_put(xe);
> +	return 0;
> +}
> +
>   static const struct drm_info_list debugfs_list[] = {
>   	{"info", info, 0},
>   	{ .name = "sriov_info", .show = sriov_info, },
>   };
>   
> +static const struct drm_info_list debugfs_residencies[] = {
> +	{ .name = "dgfx_pkg_residencies", .show = dgfx_pkg_residencies_show, },
> +	{ .name = "dgfx_link_state_residencies", .show = dgfx_link_state_residencies_show, },
> +};
> +
>   static int forcewake_open(struct inode *inode, struct file *file)
>   {
>   	struct xe_device *xe = inode->i_private;
> @@ -240,6 +306,11 @@ void xe_debugfs_register(struct xe_device *xe)
>   				 ARRAY_SIZE(debugfs_list),
>   				 root, minor);
>   
> +	if (IS_DGFX(xe) && xe->info.platform == XE_BATTLEMAGE)
> +		drm_debugfs_create_files(debugfs_residencies,
> +					 ARRAY_SIZE(debugfs_residencies),
> +					 root, minor);
> +
>   	debugfs_create_file("forcewake_all", 0400, root, xe,
>   			    &forcewake_all_fops);
>   

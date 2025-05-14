Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F228C3ABDD
	for <intel-xe@archiver.kernel.org>; Wed, 14 May 2025 17:07:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19FE810E6A8;
	Wed, 14 May 2025 17:07:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZiF4CGAG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9D9610E6A8
 for <intel-xe@lists.freedesktop.org>; Wed, 14 May 2025 17:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747242422; x=1778778422;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=hbM8Gq4sd+P1jQ9XiqwX6ZItRbiB+ruwYPgNGNmy9hY=;
 b=ZiF4CGAGJe3+tmljF3B1NgfBQ4/9L3rm+7Ut2ap7pJM4Xn/tSBQu+JBO
 ILZlPBgTg1gGwKxi+bxVSC3sQtQvN/OoGp0Bsb3BxMDw3VSzdU8Zxi3Ya
 +1yspijDzVwzLfu2GXAYPgHX2Y0TJBrqVjVejPYCSP88QRB0b21nq6w7I
 YGtkdZ4uJRxUk0LRyJfniXtSjTZilelii7lNqsIQYn9agJy4vpBXWT08J
 hlbgl4eSPphx+QR0w6H/VvKcZMeJenxmUqmSWdqM0PbKdAAngebyvYxSx
 Yjs3v9U4w2aIzZQPf6etoIc7j8TReEkqG5WVLjvo9wwol/YwR9cJZxQDV Q==;
X-CSE-ConnectionGUID: x8GerOczTyqp5n3XJkDrWw==
X-CSE-MsgGUID: mHL3cpOmRJe8jlwXy6ninA==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="36776281"
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; d="scan'208";a="36776281"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 10:06:58 -0700
X-CSE-ConnectionGUID: NBihpW9JSUWorJIHWqV6Vw==
X-CSE-MsgGUID: faNy8sDiSiCSY8hoZYK8Rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; d="scan'208";a="143298740"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 10:06:59 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 14 May 2025 10:06:57 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 14 May 2025 10:06:57 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 14 May 2025 10:06:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NE3pmorFtQADqGJ1e4ZQIBamFZuWIALX32G5xZMh7cEmgNd15xrGIng2H4JE9CnHlGkI1plUV9ngc+b9YKE9fOaf7UTXGl16EagmjGwyAiKESkp462IrOJ3FPRcA5twmnO/k4oa7ZDQ5/BckUyDEm6K0qgP5lB1sBzXdub1NYJy6VH7NLaWLtHaJ/8h8OLZOW+KwUEBjhaiAvkF224ZU0Jmm4brLZceXyzP9IiCniDe1kQOfCqQGCxJdb+oOwi85aMJTScaosB8BcejGdBglecHP+o9eg0GuOkJRocLefeeN4cbjMgFbs2jIYIAn3fpUovneqzHpWBQDGCm7F+Y4jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vcdwHRoSHZr3uV2dHaapFYnNJF2i/CxEIhHTaiU9tOE=;
 b=lJ7BZQjO3nLATFkdVsMJiFUpFdAYuC3eGbo3vIITqZBD5dLWppglX9Mt5fgRac1cYU602k+2fBLFaIN6KYb1alGUT3bzNWEPvEH1Hu5osqIOcF2T7HD5CSHOTkFif06Yr/nwg8ovWoWHWg80vHVPAO3hH9PC1XBxyQ6BGwNiAYgF/HRYSYuBtGhv+AYDLzkldeUj1t2AaEe1fcQckxGo99pqF9oc23yNpC9E7syK9XaZgtqn7a8llW7ldPxOwVrVpHBBQ3tQFJF0OrmwF/rmodAAuS5V8TgifAIL4dgIL3bVdaNWBdDbLs+nVb6k2ZPp62ZfibRA+gftuJSATOoFfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5703.namprd11.prod.outlook.com (2603:10b6:8:22::5) by
 PH0PR11MB4839.namprd11.prod.outlook.com (2603:10b6:510:42::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.31; Wed, 14 May 2025 17:06:53 +0000
Received: from DM8PR11MB5703.namprd11.prod.outlook.com
 ([fe80::f734:e507:3083:e454]) by DM8PR11MB5703.namprd11.prod.outlook.com
 ([fe80::f734:e507:3083:e454%5]) with mapi id 15.20.8722.027; Wed, 14 May 2025
 17:06:52 +0000
Message-ID: <98bdd2b6-f69e-4ff0-93c8-d57099a3060e@intel.com>
Date: Wed, 14 May 2025 22:36:43 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] Utility function and macro for telemetry reading
Content-Language: en-GB
To: Jani Nikula <jani.nikula@linux.intel.com>, Soham Purkait
 <soham.purkait@intel.com>, <intel-xe@lists.freedesktop.org>,
 <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>
CC: <lucas.demarchi@intel.com>, <ashutosh.dixit@intel.com>,
 <riana.tauro@intel.com>
References: <20250514080721.265515-1-soham.purkait@intel.com>
 <20250514080721.265515-2-soham.purkait@intel.com> <8734d7iltz.fsf@intel.com>
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <8734d7iltz.fsf@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXP287CA0016.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::34) To DM8PR11MB5703.namprd11.prod.outlook.com
 (2603:10b6:8:22::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5703:EE_|PH0PR11MB4839:EE_
X-MS-Office365-Filtering-Correlation-Id: b501474e-3f73-4bf6-d354-08dd9309b8ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eHFYRWR2dStRQ1NyQmIwbjZHMXFsWmtRRHRJZGxYWCs4NVhRMEVkUXkzQnpE?=
 =?utf-8?B?UTJDNjYrM3E2SlJuWVJjV01BeGdoamF1WWZnL2lsbHpOeWFrZW9zckUxTGJw?=
 =?utf-8?B?ak9KMm1HTTlEOU5mN3RGREUvNTdYU2NxdVFpTjlDVW1ZUWJ6V09kODUzU25Z?=
 =?utf-8?B?dWM0RjFPNHZRQUMwVzlTU212Tmc5NlhoTFhRb1cwcWJPY2toREJOdFlyUXMz?=
 =?utf-8?B?R2FMdEMyMU9UWHhXclpKTCtoc2VFMDNxejlUZW42SytBenM1eFBvQlJPOVl4?=
 =?utf-8?B?ajdRMDlUVFFHdTFRa3dNblRMWGl2eDVtVFY2bGsvbHdOY3NLNlJDK3g3Z0lU?=
 =?utf-8?B?NEFkZ2MvUEN6M2pGVFFjSjhaUTMxZVc2cm5WWi9DTFFUVmplemhyNFZPVlAr?=
 =?utf-8?B?Z1NXNTBEeE1hdC83WXFYb3hnL0NsWmFhWlJTd3BrVmdGelJsSEdWVnVPUEx3?=
 =?utf-8?B?MElGTHJZU3lJRDh6MXY0czlxMG1RcmlzbFZQS2paQUtkZnV5RXZpOVpEVGlI?=
 =?utf-8?B?UnBGLzBLMEtYeWRtNGRxbVMycVE5U0xtV2N1VHhzNUJhWTFLYzBSS28raHNt?=
 =?utf-8?B?bHhCV3dlelFCNlJod0EwUnVpKzRscHNhbGhoYXRuWmtQdTlFR3dYU2lWUE14?=
 =?utf-8?B?a2RCenc2RVJSekJwM05QRlM3d3JGZWFyQlEyN3NoN3pJV0hTaktubFllaU00?=
 =?utf-8?B?Q1FLZXMwZzBsY0RUdFk0eHJvNDlhb0hXVEM1WkR2V0hFZmVCWkNJNzlNM242?=
 =?utf-8?B?RDRMalhYN0pPOVR3VGdieW5DTUtUU0Z1MGtvdHFxRE5qOTluY0FPME5GRWxm?=
 =?utf-8?B?c0EzaHhzRVI1Y3EvTklDYVlxdG42cDBKY3g2bG5kVUU1bzdhNHk2eDFubmVZ?=
 =?utf-8?B?aFR1OUwwb25ZRWR6dGRPNjdIeWFLTTdtVDc1QW4ydVNJR01peHlWR0VUbHFC?=
 =?utf-8?B?NUM1cnhIcFFlRy92VTRHV1dKenhza0M0WEtFSWJyL1QyZmYxMGxuc2hlK3E1?=
 =?utf-8?B?cDRUcWN6RG8rUlRnT1Z5ckx1K2NNZHhRcnlDNkE1anJGQzdPQkp1S0FvNzUz?=
 =?utf-8?B?WVJZQU9xMHdyRVZ1aDFWamc0VURzc1VHY0V6cEJ1QmFDdkVrY3M5aDdwREY1?=
 =?utf-8?B?TitiR0pJSm8xV2FQWDlWN3NkTXdWNTdRMjd6dHBZOC85VUFsdklVbjF5bkpk?=
 =?utf-8?B?K1ZubSs1K3pubkZGV092UWw3STNrV29sU0lvdndIc0FrN1lQZmVvYktmMUxD?=
 =?utf-8?B?QmpMdHIraTdTaWZYdWNEYWVvakdiS1NiZ0hIeklDQ05XQU1sNlFHaUxyempF?=
 =?utf-8?B?YVVvUnFmUXpyZUlSbkZ3OUVZdWV2Y2czR0FpdHdTamEyV3IwWUpYbzZnejhm?=
 =?utf-8?B?L1E3dEZOMXZZL3JGTkhXSjlWaUhPRFowc3ZrZGRIZzNRM3NBZjhRZGJtelgw?=
 =?utf-8?B?S29ldlJLczBJVnkzR2dsMXpLOGFOczNTYTg3ZnV0R3hUK2hTQm1ldFo0TW81?=
 =?utf-8?B?WGNwQjZSR3ZwWllXeHJZNFNFdkNKU0FlMXA1bElGSmlTMGlDdy92RTBOUC9W?=
 =?utf-8?B?Z1FpdXhwajhhNUNqRkcxNFFQZUZHUTNxckhNejEyZWZPTklCS2FWSjVUQkZa?=
 =?utf-8?B?bXAvWjhsblc1N3dENXdEWWpibmZVMjhSeGxHemczVTk1Z2xVMFBhcWpzNFNk?=
 =?utf-8?B?U3Uxa1RsQ096TnVQbmhnUTZWOEFzWTkrZWFTSlE4d3NnSW0wbmJPUm1DcUVC?=
 =?utf-8?B?djlMZTNQUllaenk4V0RQQTZNYmxKc1pCNU9OVWM5SVpuUHRUd2M1eGw4ejZ6?=
 =?utf-8?Q?8/AWN2uXN/QzCYU7OKtLnZhQX1aKReDfO+Zo0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5703.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VG9JcUhvUEUzOUd0ZTdyZk0wZ3N0b1h5NDR2RHdOTENxUnEzN3JTY0t2S2xw?=
 =?utf-8?B?U1dkSWdMVzBMcEtVN1hIZ1FqK0s0KzJtTmVTczFFbWpZYUMyWnNFUjJRTDBo?=
 =?utf-8?B?b3F4bWhlbm8rNm9zNHFiaWFHb090NVNGOGo4dmk1cmtMQTZIb0NDalppWmtD?=
 =?utf-8?B?cG16YldBdFNkM1VMRnhiNjVBYzBsV0pTTXRIbGFhdHBpN3BBWWtUdTlQeEN6?=
 =?utf-8?B?SlNYZDl4Y3I3dEYveTNKL3ZESmtzM2J0dG0rV1p1VThUQTZWYW9yMEdUZWpY?=
 =?utf-8?B?M0JiMGVCWFdWcWprK2VWbmF0empXS2dndFpzaEZoeWNqOFArS1VhN2ZGQ1RM?=
 =?utf-8?B?SVBIek83REZIUlczWHpkL2xzSGl5YlNvTEFnc3VKdFNIcUZuQjhpRnhiQU80?=
 =?utf-8?B?T0o2MzJFWmNrZmFKdWRpOFNkZjdnK0F2WXFJWFlLcWplZW5OTEJWbkk1Ym9o?=
 =?utf-8?B?MXZFazh6MGNiYWxUSWU2dDhvQm5lKzJnVDBvQUNONmFkKzQ4WXp4NEN1Unh3?=
 =?utf-8?B?QWMvK2daMG5nZ1BWN1NvWmFRNXZRQ3dzM3MrdHYvUTRIYjNBOFhMenA2UmhZ?=
 =?utf-8?B?U2RFWVZubzQrand1QjNBbllEWS9ScEhHRUpvaGFsaUJ6YldrRy8rU3RTRy93?=
 =?utf-8?B?SW43RVpFYkVudnFyWWtLVDJMS2kzb1p0MTNFeHdJdFRxU041YWRtSWxpQzhQ?=
 =?utf-8?B?T3Ztd2E1bnNFajkvQVVGVzl2MUVZQ3dWYnJhb3pzWmFPWkNGSW8yV082Tlhu?=
 =?utf-8?B?d3RzWnAzZ3JNNXBZdEl2c3NvSzRRejZqMExvWk9UOUwwZFdTYlNRMzdsNFJV?=
 =?utf-8?B?Qjd3RU9iRlF1VktwdVA3ZzlYbzU3SzhlZ3J2a29OemhOcmJNamdac28xcUdP?=
 =?utf-8?B?QjhZUmNRWnU2enNNUTNhYkxFUWlnUk43Z2pWRVR2eHdlWFVsZ3ZPMlBQcXB0?=
 =?utf-8?B?VEZuME1JMXpuZmhJbDJTSERaYy9SRGU2ZllhMU5tTEdvTHJpaVRjSkgvdkJZ?=
 =?utf-8?B?dDBpZU9IV0ZwVnJ5UXpGSXF3Mm5LSG5Ba08zUkk0V0xHZUJpdVc2KzE4NGdo?=
 =?utf-8?B?TXFwUDZyQ09DMTlUMUhyY09aM1o2Ti85aFdIbjhiVUtIc0s0L2ZvZTFBOHpE?=
 =?utf-8?B?SStmc2R4NnpabUxpNmZJMHhxVzdIZGM3U3B1SHNxSlp4WmJEYlhzME4zdlY5?=
 =?utf-8?B?NWcvUmlRdHFtUm1ySG05WEN6eDI1eHpUSkdBSTZtcm9wMGJBRHlQVFRkOHpj?=
 =?utf-8?B?b084V2JDVzU1dVJaaktsTm1OT2pSakw5UnpkR09EaU04TmhWSlVTUHlsNGZD?=
 =?utf-8?B?ZEg0VVhYNnFjZ2hBelRWemJwa21IbXc5WU4xOW10akVHQ2tUMktvaDNLRCtD?=
 =?utf-8?B?RURmcG05M1BqUU9MTGVvOWdwWS9vaEUvb1pXNW1TM0FGSkQ0dXRtT1JZV0Mz?=
 =?utf-8?B?RnF2aHJaRnRFREhEbWNhZm1CZkhVUWtqZEZrL2xDRnRTUXA3OWtha1RYUFFU?=
 =?utf-8?B?QUQ1Qm83WHFpZ09LS1ZZeWFyMXJBRXRxZG1SaGwxYitVeXptZWpWa3pRMFdF?=
 =?utf-8?B?R3lnV2VYTUFQdDB5QlRJcjRFSXJaM01qdlYzNGNhQVpOdXFWSUJiNmxEM3lq?=
 =?utf-8?B?bGhZSEFINlo2ZEsxVEd1SkZqL2YxdFhmbWQ3QWZnZkw4ankvVUcxMFBIeGY3?=
 =?utf-8?B?cUtlRExVNzhReE50Q2syVFBCZFh1YzgrRzY1bW1sdk4yeHhjWVlGaTVHTkdE?=
 =?utf-8?B?S3hob2FHM3h0OTVvN1FETVMzMTRpWTlMb2FhTHlkT3NVUFJaNWdzK0U1eWFz?=
 =?utf-8?B?d2RpQ20zVWhidjkrWEFoS05GcXhLTWl2UThsdDVjQ2srOVVoVnVBK0hVMTlV?=
 =?utf-8?B?cXppaEllRUUrZjN4NGZ1ck10azNQbHN5cWJpaGpJWFZ3MUNBRzJDT2tzTm5C?=
 =?utf-8?B?WmFRMjFVbTBBZTl5eUQ0MHdxbDJQbklQSnZZWllaaEFpVTVPVkZLazNUenlt?=
 =?utf-8?B?UDJZZ3JCNzhuRFlTYk5GSGxMaWZBRDZLN1FmamllWkozR0hsNTc5czFXTVU0?=
 =?utf-8?B?Ulp4aWFFSkt2K0FrUkpQTDU2RmNKVXlFZTJnWmJjbXZmeG15S0VYZGI1VzhG?=
 =?utf-8?B?ckdCTEUwaFdvMFZWQlpjcnFneW94YkxMUGdJTGgzaGZNNHpMVzlFQlZsMGJq?=
 =?utf-8?B?Y2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b501474e-3f73-4bf6-d354-08dd9309b8ce
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5703.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2025 17:06:52.8704 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AOZ7mNYa9qVQQ30O9cN8dvAo5rd5A/i6fHGQ258lK0Zt7ufMGf4V1W+OwmvLoKHOC8YMiuhXlbYwC5gX1CyoeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4839
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


On 14-05-2025 14:57, Jani Nikula wrote:
> On Wed, 14 May 2025, Soham Purkait <soham.purkait@intel.com> wrote:
>> The changes in this patch is taken from
>> https://patchwork.freedesktop.org/series/148926/
>> Thay are  added only for compilation and does not
>> require review.
>> ---
>>   drivers/gpu/drm/xe/regs/xe_pmt.h | 5 +++++
>>   drivers/gpu/drm/xe/xe_vsec.c     | 2 +-
>>   drivers/gpu/drm/xe/xe_vsec.h     | 5 +++++
>>   3 files changed, 11 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/regs/xe_pmt.h b/drivers/gpu/drm/xe/regs/xe_pmt.h
>> index f45abcd96ba8..b1d4504e4adc 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_pmt.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_pmt.h
>> @@ -10,6 +10,11 @@
>>   #define BMG_PMT_BASE_OFFSET		0xDB000
>>   #define BMG_DISCOVERY_OFFSET		(SOC_BASE + BMG_PMT_BASE_OFFSET)
>>   
>> +#define PUNIT_TELEMETRY_GUID		XE_REG(BMG_DISCOVERY_OFFSET + 0x4)
>> +#define BMG_ENERGY_STATUS_PMT_OFFSET	(0x30)
>> +#define ENERGY_PKG			REG_GENMASK64(31, 0)
>> +#define ENERGY_CARD			REG_GENMASK64(63, 32)
>> +
>>   #define BMG_TELEMETRY_BASE_OFFSET	0xE0000
>>   #define BMG_TELEMETRY_OFFSET		(SOC_BASE + BMG_TELEMETRY_BASE_OFFSET)
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
>> index b378848d3b7b..a46e9580b1f4 100644
>> --- a/drivers/gpu/drm/xe/xe_vsec.c
>> +++ b/drivers/gpu/drm/xe/xe_vsec.c
>> @@ -149,7 +149,7 @@ static int xe_guid_decode(u32 guid, int *index, u32 *offset)
>>   	return 0;
>>   }
>>   
>> -static int xe_pmt_telem_read(struct pci_dev *pdev, u32 guid, u64 *data, loff_t user_offset,
>> +int xe_pmt_telem_read(struct pci_dev *pdev, u32 guid, u64 *data, loff_t user_offset,
>>   			     u32 count)
>>   {
>>   	struct xe_device *xe = pdev_to_xe_device(pdev);
>> diff --git a/drivers/gpu/drm/xe/xe_vsec.h b/drivers/gpu/drm/xe/xe_vsec.h
>> index 5777c53faec2..6184b875e4b1 100644
>> --- a/drivers/gpu/drm/xe/xe_vsec.h
>> +++ b/drivers/gpu/drm/xe/xe_vsec.h
>> @@ -4,8 +4,13 @@
>>   #ifndef _XE_VSEC_H_
>>   #define _XE_VSEC_H_
>>   
>> +#include "linux/types.h"
>> +#include "linux/pci.h"
>> +
> Please address the reviews [1].
>
> BR,
> Jani.

These are addressed here Jani,

https://patchwork.freedesktop.org/patch/653146/?series=148926&rev=2
>
>
> [1] https://lore.kernel.org/r/87ikmcvfzd.fsf@intel.com
>
>
>
>>   struct xe_device;
>>   
>>   void xe_vsec_init(struct xe_device *xe);
>> +int xe_pmt_telem_read(struct pci_dev *pdev, u32 guid, u64 *data, loff_t user_offset,
>> +		      u32 count);
>>   
>>   #endif

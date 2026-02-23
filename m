Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05D19EA4FBA
	for <intel-xe@archiver.kernel.org>; Mon, 23 Feb 2026 14:10:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A22C210E3A8;
	Mon, 23 Feb 2026 14:10:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d3geWyAI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0333C10E3A8
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Feb 2026 14:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771855827; x=1803391827;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=F5xocQs26PJtSTWveV/EWyvX9t7q0emoKcDQf7x+rCY=;
 b=d3geWyAIvaRsNRfaRN/0lb8cyCOuerro3hcSFqcjDYdZqHu8sEKAUHCi
 gWLXrTt1NpkP2vqjGJMu4vzDsxNhminH/4C8t9IrIJI0eDEGYbEnSjMx6
 MKhsrcfdU8mCbjbUYdg4yyyM5LaNbNAejfiqUBPcrPjbM9s6wpaoOTixr
 +iov1+l7fiws7YQvE6M892ohnsvbQPcYa2/S8wXBmypsysWpUNkXdJo3I
 /6i+sSPMGWrhn/daTZXh6EP/p+Rwk9UBte1ohOGslYcEXEXBw3/v/kbu1
 jqp3EaU4hNiVBvvMEYAvpbLfruEJyksstCZMApR39/S7uDMkBwM7KL4uA A==;
X-CSE-ConnectionGUID: lI3Ev/VaQ9+ikBgoPhTisg==
X-CSE-MsgGUID: bz6nKNxXTT2p7DAuFa8wVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="98311784"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="98311784"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 06:10:26 -0800
X-CSE-ConnectionGUID: RXwotRmhRjyK44wNTObOzA==
X-CSE-MsgGUID: 2MksA78fSQydRghrIhY3Bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="219118393"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 06:10:25 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 06:10:24 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 23 Feb 2026 06:10:24 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.71) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 06:10:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JcaiNAfjykLOEUoZ2W8YW/jXnNcDP99N4M98/p5cuF3mLJASD/YaKFn8VSO0nXS9fY8KKbcS69IpEX1lamviJu2BOfT5jhHVL+G1PFjyQeyo4MEih4ujeziWIeWpSkRfeZmoV3AT29ci+EvSzHV6G7NQXkut3MDtPJJjhACD7fVN+aPVH4rhFpNcV8QsnFgEdvo2GB9ge4LSNS8ihXl2XFJ3u0UfY+ie2ouI5vsZ7bZKhV5udukwAP+8ADXJJuSPxXMzSHSHnW7k5ESzN/rCCPKWTmAM8/iOj7NwmQpvFmN0s/8/bueZnHxTRWPnP5PS+dqWLDjoK4U5jRtKE0Q6Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=78VMDlVbhFM5vrlC7L5HThza+d0j032kTo/pjihR+Sg=;
 b=GMJK3XrTALdV9CYn02Aj3ReEv/3d2qAH4bek5LIp91vw8EFp6FCymCZzILpBvtY5DxQ4wQ27ilsG48PmycggmTGlTH0UmUYUHtSjbNWoQCWOES8YM4JoRVcyIMI6lo5hWTsl7R/tN4vlNWSM2ZBxIMEORTphJuPBxtrD1cK4/UDm+Ig4tgBy9t/yZvysGpn8Uzs47YqJsX5ze5MHeUQTlaSzgSVRgw6jXA51YF5AkOdfIhOFDbJ6O0/E9MVF7N4GQ2m0b6F299WbYVKFoU5Gv/vsMP2k7xtfe2VytscfBEhylQgfv/gO5w/fSv8CQRCtWuMdEBcoUvAFGWbFecnbbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 BL1PR11MB6025.namprd11.prod.outlook.com (2603:10b6:208:390::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 14:10:17 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%6]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 14:10:17 +0000
Message-ID: <ade5dea5-07b6-4334-922b-57fc8b00a178@intel.com>
Date: Mon, 23 Feb 2026 19:40:08 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] drm/xe/xe_ras: Add support for Uncorrectable
 Core-Compute errors
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <badal.nilawar@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <mallesh.koujalagi@intel.com>
References: <20260122100613.3631582-10-riana.tauro@intel.com>
 <20260122100613.3631582-17-riana.tauro@intel.com>
 <aZR1ARo309W6gMxX@black.igk.intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <aZR1ARo309W6gMxX@black.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0062.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b8::16) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|BL1PR11MB6025:EE_
X-MS-Office365-Filtering-Correlation-Id: fd318533-7ba8-4a27-4137-08de72e54544
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZE4rdU5tYWdHQk1FcmJXOEFlcnhsL05EeGFLZ2ltMEZiU0hnOExLcWxsN3Mr?=
 =?utf-8?B?bGtHdEY4UGpmbXVIcUNNUnExL3gwaUlMZzhkNW1EV3dNOUZlU0xRb1ZMdnN4?=
 =?utf-8?B?QnI1czFrU0l1b3lzUjNNUlJkb291NU1Sb2ZvclJKaDBYa1YvTWc3b2IrSmIz?=
 =?utf-8?B?MHp2Q1RSMWJSYy9qOXdLNVNscWJhWFdFTmJnN1hLSk1INHAyR1JzeW84U3hD?=
 =?utf-8?B?TnVNTUhyQ2hqaTVGY3I4NUM2NlF3WDJZL0duQjJqVlYvaEhnTUo5NkY2UzFa?=
 =?utf-8?B?Zk55bnFxZzdkdDVUeGpjcmlaTnArb0ljZ1pyZ1E3SUNvQzZmTU82ZjBHU0NL?=
 =?utf-8?B?L3lPK09KRitPbTdYVm9oZXAzSEpKVXJNQTU4c1VTZk9kUFdCZk1FTm9jeGw4?=
 =?utf-8?B?NTZPUWZic041eDVxRjJtQTlEcmFndnFqaitUcERrc0FTUHVIeURJRUc3bXhv?=
 =?utf-8?B?WGRWY2UrbVFnWXdGaExhT1JEOWhmRFNSTjh2SEhFd3d2RVFlUmE4QU5pWjky?=
 =?utf-8?B?UTBkOUJucW5WakdQQ3NzVXNVaklvUXg3TCtSUEdpRmVCYU1vR0pocnk2UU5K?=
 =?utf-8?B?YW5ubVNjWC9qTVJ6YUxKKyt3T3BYRUlVUUZxaEZKNVNDMlc3VmdIdG1UQml6?=
 =?utf-8?B?SXNTNXJBd21uY29ndkpoeVFnWVFla1dDTEV5dWR6YlpPNG94aXlDc0FNTW1R?=
 =?utf-8?B?N3Z0NERxNW0yWHFRK1FJOC8rQ243VmpnZ0phaWk1dnpScXhJR09sM3FxRXhT?=
 =?utf-8?B?ZDZIc252WnV4OTNJZlJZUVI5d0JvUmd2NWpRSXNBaXRscW5ZRFNjZGlNcmxw?=
 =?utf-8?B?L21pWjdma01zSlpDZlpLMnRHK1VFc0wvNFVXM2pCVUxteDZ2NDJibWpaZE5T?=
 =?utf-8?B?MndWVnNlUXF1bWJtSU9aZFBXT2gxOHZLSERIb3pnUWNRaXFLZTFMTGZpRWc5?=
 =?utf-8?B?cGNCTWp5eFlJK29ERVo3Lzlha3E4bytoRnNQK3BjSXBlcEJMeFFDbGM3NFYy?=
 =?utf-8?B?OElNNzROT3FYUkVvTUZMczg4SHJpSk5mMTNxbituT1BMVk42MGErOXhRK2tQ?=
 =?utf-8?B?aHJJaVl3ZFkzNnhndXFGYmQ4VzFsTGU2czhQM1Byc1hHSmRRZ0ZwaFowejhy?=
 =?utf-8?B?TlpwdjlvbDc0OE1JVldLWVBUcm5ETXpXVFoyTHQ5SkpTWC80VE50V29KU2lU?=
 =?utf-8?B?Sk91NitVb3oxUG14blpWbUJGeG5EdlZtbHh4d21hYWZUZ0FOZy90M091OHpx?=
 =?utf-8?B?ZWZLMTBFemZZa0F6TU4xc0pDZC9NdzUyY0xwYU1GR2RJekFnZW12Zis1U1Fz?=
 =?utf-8?B?V1ljbWlVR0IwN0NjbVVDVGpaekJBa1VRbjFuUWJDcVFJb0FMd05GZUkzWktz?=
 =?utf-8?B?Y2lpOElWZDJvVE8yS2ljb3U5L0dBdXhDbFFXaTRzV2ZLa3NsZTUzSzVyVTZx?=
 =?utf-8?B?OXZUUmdXTVJkRS8yQkw5WjJoeGxCeFF2dkpiTW1ENjVQb0x6ZVhZOGI0T09J?=
 =?utf-8?B?VzZ3Ly9wMkZDMS9pSVlLZmJHQjRZRC93Nm43OE9tS0t1NEtRbEE2Q0hLNnQ2?=
 =?utf-8?B?dVZhcjBCdWxvODRURW15YlRsTXN3Uk1GdWhIOWRqQU9EQlVuUUhkeVQrajhY?=
 =?utf-8?B?ZWdCck11N3FBUk16ZUIrU1ZGU1RTZ1BEbm9rL1lpSVlURC92bzdFTWEwOFpD?=
 =?utf-8?B?QW5JdWhrYUxoMTFsSzZsSXpxRGNQUHByQm5xcVhBZHlsalQvUnpCckZmOWp0?=
 =?utf-8?B?eGRFMFFQQ3Y1OVJHU1Q5WTM1RWU3RmpKMTFOLzJDS2JoaHUwdFVhU2xzN3Ir?=
 =?utf-8?B?bDdwMGcwN3BBQitycit4NVdYeUZUcmp2YnAvQ2pWNEpTQUVqbUFpYkZaUW91?=
 =?utf-8?B?NWVpcUR0b1F3SXdOQnRjNGdkeUlVS0Y2SndCMitobmpsbmtXRE13YzYxV3lY?=
 =?utf-8?B?NEFYVCtib01Kb1JrUUp1V1JGQVJWcHlZWlU5Z1kzVVVRckJtSmp1dGx6bVBS?=
 =?utf-8?B?Y3dadlBBdFpFRkFCVWQvOW1WUFJlMEhIaHVMY250elZNWUw4TUlVQ0V4YTBj?=
 =?utf-8?B?N2lla2NOR1c0N1RKZ1A5citzenNFV1R6Y3ozYVJaSThzbEJ4VzcrZC84Z3Vt?=
 =?utf-8?Q?gpok=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MEpiY29ZVFZrUFBJSThObGtyV0VqOExRQUIzTWpnc2xKZGlBbEZXSXNXczJV?=
 =?utf-8?B?ZlRDN2tNK1pscm56bFM4ZHZnRWxTOHFqWVJsdXZGOHlUZnRaN24yelBPZUNY?=
 =?utf-8?B?MTlDWXN1Njl1MGU5S3FySHJPNXhMNmdVTGlRQUdyRFVMMWpub3FKd1RsYktQ?=
 =?utf-8?B?d095TUxRVHBxbWZKcmsxY0lWTXhuY2p3YStsYTJhMmtaN1RtQnVibEh5ZFVw?=
 =?utf-8?B?ZVByWi9qV0lpM094eFJvSXZuTnZjd3VOZzArMDU2Y3VhSmdZalFKVnJVL2Qx?=
 =?utf-8?B?OExINC9RTUIxZDFaNVlTaWpqeXpGU2hHS1JUdWRlUDJ2OUpHdTJjRDdpV3oy?=
 =?utf-8?B?MFJJbWdVRDUvdUkxNHhKTllONzNMT1VqSHNLZXVkTGlYMFQ4SWg1UjhIRlZW?=
 =?utf-8?B?OTJ4RXpxblBvZ0dWNmg3QVBucFFCZER5S3FoUGRBV3RLTERwbUh5NEsvcllT?=
 =?utf-8?B?QlVCUWk4MDMvWm82Zzl6cVlKR2Z6M3NKaTlDNjZtZUU5UzZWeUdxdVVZK3hI?=
 =?utf-8?B?SjlXNFRjbDR4VzNiaFpGc0Q5SzE4b2VRR2hocko5R3RZcVpTZUFjdXZCMUFi?=
 =?utf-8?B?dHEweHhjOTIrQ2FyeHRzTkw4TmR4ZzlKKzMwd0lpMnoxOHY5S2RMU20xMTFk?=
 =?utf-8?B?azVvYlpHMEd3VU43UExUYmgvZDYwRWk0eU9IUnNQbVlCSDBLSURWOVFSOGE1?=
 =?utf-8?B?dytBdk5nOXNyZmpWOTNiT0Q1YS9sQnJvVzVBOUkxVVBaSzRJNVkzdTkxcWFn?=
 =?utf-8?B?VVZSdytUZFg3VkYyaitxT2c0ZG5QMitmZVBDU25YODRNS09CeTlpNXduT3RT?=
 =?utf-8?B?cksvRlVrR25PampvbW56UGU5ek1aZ0hoYWY2VktOVmpRTFM1TnBjMjJrOXYz?=
 =?utf-8?B?b0JmamgzNkpqdGtiNC9YcGdPd2Fodml1clpsWFIwOEFIcXJsNkc4WTY1dFZC?=
 =?utf-8?B?TXdOK0JMMHFSNlJpSmtoR2d4VWJRK0NWSXR6am56R3RtZGFRQVowU2ZiMXY5?=
 =?utf-8?B?TWNLZzVyWEdsSStLdGtJSEpTeldqdlptMXJmclY4OEZIZkwvMmdRVndhOGNK?=
 =?utf-8?B?TG1EWmxzamVYaG05YUdOZHRiZzg5emlkS2ZRWWhYYStzQWRnaW83L3BQY24v?=
 =?utf-8?B?Mkp5dXZBSWF6NlBUaDJTVW5Ta090K0doZ3F4K2o1bHhFWlJWVlZVSTdtc0ky?=
 =?utf-8?B?eFJybDhRdXlWNG1ZL0JwQ1VtZUpObVJEd25SbjgzWlRIYUJZb1IzTFJ3ejBN?=
 =?utf-8?B?V2xtUDFFUHNDVDFZVVQzaWpPYm5RL2hCL3BOVnlqOWNKYk1jWHhZbnVQakI5?=
 =?utf-8?B?azF1Mzl4cVBDTzU5S0FMVjhIUHRZOGR3VEhxT1BETlpHRXZZdmxlMzF2NzBK?=
 =?utf-8?B?aFFCRlUyQStPaU1HNXZtNWl5Tk5lRGo0V1JweGxZL2RxbU1aWno4K0laMlRE?=
 =?utf-8?B?MFBTcTJxdzR5THAvZld1ZEJDMGlHUXA1YVIyK25LZzhDQmYyRHUwMk5zWWk0?=
 =?utf-8?B?MUovejhrbkNoNnVOL1Z6SDhPZ0w4amt2Zjd5Y1Arb2dncHNTbmJXdTNILzZG?=
 =?utf-8?B?dnlaR3VmL1dsdXV2K2lBNlBxNlE1YUs1Z2IyMzJuNHJ5dW5lcFBuaTNTTSt1?=
 =?utf-8?B?R3RSMkxoWXpEMUlTTk5pMTlIWi9LOXoxZDJIL08zOGhxd3JMcFJJeHZUdW91?=
 =?utf-8?B?R1AxQlpsUzNkME5UT0pDc3VkYjBzR09MTUNnQ3U3L2pNb3Q4ZnVlZUlrcTJy?=
 =?utf-8?B?dmZTV0tnMEYzSUFnYjJpNWJSU1RReE5nSEs1b1Q5U3VlWDZ2OHhxbW9Lc1V4?=
 =?utf-8?B?V2xGUzJsRUZCcjJNaXhFUmM4TW9qZlA0SDJtN2lSK2IvK3ZNTmI3cjRrRng0?=
 =?utf-8?B?WFNoQ1pxUC9SbTRjcHVYa3diTG5PZTlEdHpwQjNHUzhnc0I5akZGQklIWlg3?=
 =?utf-8?B?dHFOcGpsQ0tUUHZab3RsdEM0dkNoMmxnR3hnT2VIR0FZeEkxbGMwWW5keTZQ?=
 =?utf-8?B?UU9PWEFpMm5mbWVzMTl3d2J6VUc4emRHSEFSSlZ5aldDeHlZbG8vNFIrNHZ6?=
 =?utf-8?B?VUhwZm93anh3cTZ4czFiZ3pRaURldkVjY3JUcjlMQThQRXhGWnd3Y3ZCNUZB?=
 =?utf-8?B?bXZOd2g3ZjdCc21nMTFEczNSUFZ6VlN6M1R6N1I5bE1zaGdjbi9kd2RiaUlZ?=
 =?utf-8?B?bWovT1dOOXI3cmNtM3pVZXA1QWVLdmxrb1NTS3NDb3VFVG1xenRmbVBuRlN6?=
 =?utf-8?B?VnlRcjlXaDdVbDFJc01FQ1pNSlpZdm1WVmZYeVVjZzlJZThMWWZoQ1RINDBU?=
 =?utf-8?B?KzdicEpPbU5sVzVjMUF0SjlQQUx5LzdSUmdFMVovMVAzaEtETE5PZz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fd318533-7ba8-4a27-4137-08de72e54544
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 14:10:16.9881 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YSoknAGaj0kKvPt3FavUh3bXiBbtMBUsJsnnyAWqIB7NhVit03kVj8AmJmUaXZAZQcZHKLWoZHSWZj3SdCVkbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6025
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



On 2/17/2026 7:32 PM, Raag Jadav wrote:
> On Thu, Jan 22, 2026 at 03:36:19PM +0530, Riana Tauro wrote:
>> Uncorrectable Core-Compute errors are classified into Global and Local
>> errors.
>>
>> Global error is an error that affects the entire device requiring a
>> reset. This type of error is not isolated. When an AER is reported and
>> error_detected is invoked return PCI_ERS_RESULT_NEED_RESET.
>>
>> A Local error is confined to a specific component or context like a
>> engine. These errors can be contained and recovered by resetting
>> only the affected part without distrupting the rest of the device.
>>
>> Upon detection of an Uncorrectable Local Core-Compute error, an AER is
>> generated and GuC is notified of the error. The KMD then sets
>> the context as non-runnable and initiates an engine reset.
>> (TODO: GuC <->KMD communication for the error).
>> Since the error is contained and recovered, PCI error handling
>> callback returns PCI_ERS_RESULT_RECOVERED.
> 
> ...
> 
>> +/**
>> + * xe_ras_process_errors - Process and contain hardware errors
>> + * @xe: xe device instance
>> + *
>> + * Get error details from system controller and return recovery
>> + * method. Called only from PCI error handling.
>> + *
>> + * Returns: PCI_ERS_RESULT_RECOVERED if recovered or if no recovery needed,
>> + * PCI_ERS_RESULT_NEED_RESET otherwise.
> 
> PCI error codes are unrelated to xe_ras. IMO let's use standard error
> codes here and translate them to PCI ones in the callbacks.

Yeah agreed. I had originally implemented RAS specific enums but then 
removed it since it was same as PCI enums.

We can't use normal error codes here and map. We could have XE RAS 
specific enum and then map in callbacks

Thanks
Riana

> 
> Raag
> 
>> + */


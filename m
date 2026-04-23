Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 338E3F99376
	for <intel-xe@archiver.kernel.org>; Thu, 23 Apr 2026 11:18:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E06C910E404;
	Thu, 23 Apr 2026 11:18:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m56CspeM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2263510E404
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Apr 2026 11:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776943097; x=1808479097;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3XigpI8XZCK2BqB8BIPebw2s+zSXU0/hgFYLOBIDeAQ=;
 b=m56CspeMVKgHM71S12kmQ4nG2SRjPT6lMoq2kFBTVDCJr2SMaCSG/6IX
 COZGqAKwvXDC6MhdepmG4EcV/VjwELPWK/GBEVMWEwzsLqtwP5GDHIZjw
 CblDY71S/O0vZ7SBldXzFVDmKVkXkw5HkriyoZhCo3eIKx+z6SfnPHs++
 Qjkz3tXPKwfyJr0DjhGC4E8UXm8JPaimImoG4FVl5GM19oy7yfLUds2sL
 r3QroX/19Auqtmnn9Ds21fs7Iq3MK6H0sEd3N6uwkQ2EXSyIsQqY47U6+
 /JTskbBzXTqZP0fN0ZSnavNZWKCv2puwBhleNp05RlssqTkBH7n6iPd23 A==;
X-CSE-ConnectionGUID: 5V/eh8i9QoGHtUbjWldgcg==
X-CSE-MsgGUID: C402EiZ9RL6LtpImMINgsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="77971433"
X-IronPort-AV: E=Sophos;i="6.23,194,1770624000"; d="scan'208";a="77971433"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2026 04:18:16 -0700
X-CSE-ConnectionGUID: bFSbmRzqRROwFLTE05tdCQ==
X-CSE-MsgGUID: eS81sOjARderZ+THQHOelA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,194,1770624000"; d="scan'208";a="226110382"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2026 04:18:17 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 23 Apr 2026 04:18:16 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 23 Apr 2026 04:18:16 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.31) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 23 Apr 2026 04:18:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gxNrEWwbQFLkL2wbwxIQ+aBi9Um+LGNWPBqrdvFBgu2KI4kItBQEkqvRBJqnnkMIq+H1uSV60a6Fn8LnhQnVPsCn5qfKGumNB7sf0szQw+gZ1GM4xCQOEgO3yMEDR8aFM3mGG9c9rj6RGVHbNfM1arbWGPHoVu3ztGC9DO34TNb6kAJhYwKe3c0Du5xLl/iHwfpHKOq0fBShrnkkEcFdCYo0hzfC+Fnw5t+klOuUIE51O8+21K5gA09ariihlOnZEQFhZVnrYMfbvZmnKSYiiqpklt2GEs5Pnqfn6qdEak+tGtkHpxZ+ShlGlCHSyDm6asvM0x64FkTjnuC93+4tAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bDEjNF8ySu22ClT9cF4N8wybrvmWGhjb7oVwpQUST0U=;
 b=cgRpOvcxD8IlUePXhG2Aq6TOe0hBu1Gz8Y5rDQfn8cqDmwGwV0h4OH4phsU/4BuuLMCitRnALdA31Vhtmb1a1DsXDw44EkYrf8rty+x/oBHL9CLq6bGOLnYgcTV5w8+g4GSU1ssnAf2rnZJJlKcmZ0Lk2rA+TdQM7JWvrahQeUnmCRAvilhEUQQh2QFbldzVzgo36SM5GJOXGrSoPgF6fQUvgXS97Z+6snct1+s3jD77lJL6ziHwwsFpipCR6DgLCm46pi0Sif0floMmw2sEW72YYdZ/43AQqgNeymF7JYsbZtFDPV/m7Q2akh5Cqg/AglHCytFXvtLNdk5cqJca8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 DS0PR11MB8020.namprd11.prod.outlook.com (2603:10b6:8:114::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.15; Thu, 23 Apr 2026 11:18:12 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%6]) with mapi id 15.20.9846.016; Thu, 23 Apr 2026
 11:18:12 +0000
Message-ID: <281bcc29-d2b6-4ab0-ab62-f92fe5137a7a@intel.com>
Date: Thu, 23 Apr 2026 16:48:03 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] drm/xe/xe_drm_ras: Wire get-counter support into
 xe_drm_ras for CRI
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <badal.nilawar@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <mallesh.koujalagi@intel.com>, <soham.purkait@intel.com>
References: <20260421145056.253300-7-riana.tauro@intel.com>
 <20260421145056.253300-11-riana.tauro@intel.com>
 <aen9zByGAMBRGYCR@black.igk.intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <aen9zByGAMBRGYCR@black.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0240.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b1::6) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|DS0PR11MB8020:EE_
X-MS-Office365-Filtering-Correlation-Id: f2824a11-ec83-4f81-af36-08dea12a0195
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|22082099003|56012099003|18002099003; 
X-Microsoft-Antispam-Message-Info: SunF8KyngpJwtD0lsOisavfBnsNkfKBK7Za7QIgDHiY9RStxy9ykB2PBZ3pUik/w+ywIvQjirSDyOfdQNWO4/xO0KtzzIYD0iKY4Io4jvCc+R0s/srxfcs0vAw3f1j6RibnYMwCEh0gGnTQdh0RAEU+FK3Y3vdy2etQHyta+0AMNrVbNReWmZvZaYqofFXmRCAoVLHjLFqnYJP09pOuklSnZMA/98NyoIE5cduCxoSbvZEcc1ZfEu4bxmnUwAcXJIs96bD2ZioFrcs+ihF6zJXRkXnMy8LzELPNc8d9gQSUYaJVs24wkcDuDHOeqNw/lHhO6nMumLVQqShJA6TMDQrQjOSPcK1ni0hYjlY9NKay/Rj6znRQrbnt2dmxhF3VoZIRwYEiQGanJfduTBFeCt2AnYX3ewPaHOiwanyvIfwKvM1QSuOCfCcxZSjf+oyvTFOXetOfOOGlI09zMzXmSno5WSSW+RuXwf1M8fQmkmd+xYVUrYMrSVFLScuXRYj7AiB6rqxjQqjDMbkmmuPDur1uUmdBYOJGBOuN6rsNyUNrq/nqbQ1MIXT7BTt6ORL1h8K0JuF/qK3ohqQpGuotIaGAJOIlCwV2odIKIBiEnHBhYnE5LSHPrpJ9Is+zzvBmayL/dDzS1ODvkwU/SUrj4rB97KBLPvuCKiyrXDqzEA8IfcQio1CcoVf7CkeUSCOo1J6V/Ba4jo+g/oFRIQzTsKcd5FcQwFa2RWWrBn1fMs8o=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QWw3Q3ppeTBWL0sxV01TVFV1SWdrRTZtbzJVdFFHa1lnL1Q5ZnUvL3p6bTRR?=
 =?utf-8?B?bHNjN3ZUZUVqWmkra2FXN1E1UDVTMVFJVmNGUXhENEhVU2trRTBzZVdCTW1C?=
 =?utf-8?B?dm56SW9pQnYrQUdsY2ExQ0RYMVRtcWNqTG5uekRvbFVHNE5qeDZFMzRHdmdn?=
 =?utf-8?B?TXNISnhFUTl5SjBKaVFMYWJUclJVVmdCSjd4YVI0Y0FFU2JNSU1VZk1ySnNP?=
 =?utf-8?B?aHlOck9GVUdwUzQ3L09ieVlucEd0Sm1SWkcrUW5nRGRJc3VvaXFNdCthNEFN?=
 =?utf-8?B?QyswTHV5MVg2WEpNaHpVcFlVNVB4aW9ES2ZYQnMzeGYyUkpraVVReHkrTE1s?=
 =?utf-8?B?Mm1LN1M4UDYzWG1DMHdsd1dLV2ZSWWo4MXpDbXF6NEJNZG84WmpOTUNXaDla?=
 =?utf-8?B?VW5lMVdVemdJZkFabG41UEtVN3lRTVI2RzBLQ1FzY2w3VjFSK1ZqZTJ2bzl2?=
 =?utf-8?B?QXZxZ2t6OTVCbUVVZVQ5UEFWSVlvT1pJaXJjeDhHdjNOMHRCTUwxclpUZXpr?=
 =?utf-8?B?SjNaLzc3WmE0U2t2cUMwNjdCQ1Q1N1ZKdThSWWtjdlZkOEFDc0tKUEo2Rkd2?=
 =?utf-8?B?bDBENWNyQk9HRks4MEQvTDNQcHZVNTZUZTNNbnRITlkzNDVsMnVBNHdJVzBN?=
 =?utf-8?B?ZnQ0TURzcXBKc1VFcVBLc3diRHRnWk5sZmtWZmp4SzdvS3J5dkU3ZFR0MCtE?=
 =?utf-8?B?V0ROaXJZN25HMmZEZTBiSHBicFp1TUlBcklMMTRhM1VYY3RCZHRMaTlqNU1T?=
 =?utf-8?B?WVNTenoyZXlXMjVyUlptOHdTVjhtVk5keGtieiswVFdtMC9ZSHhSQ2RHYmRw?=
 =?utf-8?B?a2ZMNEdTOVQvVXJXTVFxOGlSRlJFTC9odDBHVXdYOEdNeVhqMjY5MXhQMis2?=
 =?utf-8?B?YWdydFpZTEJvNDZvdXhxaGU4by9zVGFGSmo0TmtXSVRhN2Zva3BGejU2bk5N?=
 =?utf-8?B?SXlDUEpjTzhySEtrSVB0RmRHL3FRNmNmSkR3aDBwQmgzZUsya0pZSnl6ODUx?=
 =?utf-8?B?b3F1RlNRTnlNSzdSODlJczc3R0hoT2RieWdLalE3VHlma0Fna2psS1FyVFJE?=
 =?utf-8?B?eGRVcGEyZnRkSWpXQmxsaUZGSmduR25zcWZ2WmFqUSs5VGgyR1Q4SkVrK2wv?=
 =?utf-8?B?dDdWd2FqRlZXVUlLbDd4dTFSYTdlWTZxMzVvZlZjMFo4aWFMeVBsM24zaHhn?=
 =?utf-8?B?OGJJSVIranRLc1RNN2V2bFpEbEpHeFhvQTlXQTVVdGdYZmlNZ3dzenphYndm?=
 =?utf-8?B?Mlp6N2EySEVESGRzdXEzQnRxbEZsWlFNNzlVaWx2TmtZWEdJN3Nxb21wQXFJ?=
 =?utf-8?B?UUgyUFNoSlVsVXUwZCtNaVlaSWRjUUhMRnM2a0NXQWFXd3ZRT1VTWHVha0M1?=
 =?utf-8?B?a2V4Q0FsQlhVbDRDRGJKUVBLTWR5VmZtcHVtcDl5ZXFDd1ZCNTBKUzI4cm1s?=
 =?utf-8?B?a0pGaHFXY2RZZVpzZXk3NFYveUJIcTcxUXB5QWV1WHk2cVp1TkJkNXlUcVVG?=
 =?utf-8?B?NnBVRE1nRzQ5NVVjQmYrSnJTVzdoMmZKOEVYa0g5MHFMQ3ZtYjVVMnV4ZmRH?=
 =?utf-8?B?dzRJNGVGN1IxVjdLaUpZZnhHR0IvcUFadGtCSkIwSnk0blpGVTI1Ykd4SXZO?=
 =?utf-8?B?bERsWi9zbVZpWHovTVExTUx0bEdQd1Y0c2ZMY2p3dzJqTEFKamtsdnp3Y1Np?=
 =?utf-8?B?VGw4Q0RodXFzWm1CQ0I0YTNCK2lGNGF1UzZsQi9jQkU3OXV3VmVJM0xhZCtF?=
 =?utf-8?B?ckJQSDNha0Y3QUdSc0hkSklWcGhmTkNHMWV0SVRnWTJZdzhaaXc0c2tQK3BS?=
 =?utf-8?B?bjhESVRuU2g0RlA2S2laUWREL0orUk5FdVZZMU5hRzZPb2VwckZHa2FlZktX?=
 =?utf-8?B?ZWNHMlhGemVPeXRRUi94SVJRVkhLTElCV0g3N0xCRURoZmRZQlA4bk9UZ3J4?=
 =?utf-8?B?WjhSeW1CNStPR0YyN0NtYlVEUGVSNGxLOENDZEdZTTljMzVjTUU1STVKMHh1?=
 =?utf-8?B?TGIxSW9BZEhyWEhkeTFYS2FiMnYyYTB3OXFoMmNhOW5BYVFUd2djN0dubWpT?=
 =?utf-8?B?QVVod3AxQXBxWE9tem9tbTBCZ3JOb0JSeG5WZ0NHems1OEI0alEzdUloQW8v?=
 =?utf-8?B?LzVkN29sQzd3eThPOENHNUlrSTQxYkpUZHprWEFzV29iYUNpK2VGRTRJeStW?=
 =?utf-8?B?U2ZHekUzZG94QnUxYlhUelBzOE5uM0hsOTFJaHlibEpjK3p0QlBGQWNxczhU?=
 =?utf-8?B?K3AxRVE2dWhHY1M5S1AwNzE2cHpWa0tvaFplTHEyN0RUcjNOUjlkdTg4aWhS?=
 =?utf-8?B?Rk8zTHNTVlJ1bzZwdjQ4elBJUis5K0duRWJHMFcvdmFjay90RjUyQT09?=
X-Exchange-RoutingPolicyChecked: f+SBIanWrVVTQl8tATn5x1lUdj2MoXuxa7EOPRXKEMdO3WwOMbXpQLfQB604qBY68GVBvb/ejUAhHipFiK/G+hNv5IEUBi6TFntjt3tEu4qFCpM1KLCXV3vD7TLlOOVY+RKTps5RppyqBoodNiKfI++DySJ3e/BcE0SaX5vZpT14ShperUpqGrt4WbSUu5FhP4Vjk3dcl4T3FaORA+QSSXRoGZLpavRQIXY7K6LSRfP5rzPtBAx5z+r3IgDngznTkFN7DJWv+51zFLWgVGLsChzrejCP/5IX8/ySoWMGSfcpQUjY45wQAkdNadZJyuyez8sKJVAkiWGdEKwawxsW3w==
X-MS-Exchange-CrossTenant-Network-Message-Id: f2824a11-ec83-4f81-af36-08dea12a0195
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2026 11:18:12.4033 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pAg3JbSLhwlD8lSXp8/JUiUff9cNG7tTbQEgA4jsVG8Nu8X6mIskeBz7+eTEALFwJuE5ZLJ+UvYUXgFmRtmTRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8020
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


On 4/23/2026 4:39 PM, Raag Jadav wrote:
> On Tue, Apr 21, 2026 at 08:21:00PM +0530, Riana Tauro wrote:
>> Hook CRI get-counter support to xe_drm_ras to allow userspace to query
>> counters if supported. When userspace queries a drm_ras error counter,
>> fetch the latest counter value from system controller.
>>
>> Integrate this with xe_drm_ras.
>>
>> Usage :
>>
>> Query all error counter value using ynl
>>
>> $ sudo ynl --family drm_ras --dump get-error-counter --json \
>> '{"node-id":0}'
>> [{'error-id': 1, 'error-name': 'core-compute', 'error-value': 0},
>>   {'error-id': 2, 'error-name': 'soc-internal', 'error-value': 0},
>>   {'error-id': 3, 'error-name': 'device-memory', 'error-value': 0},
>>   {'error-id': 4, 'error-name': 'pcie', 'error-value': 0},
>>   {'error-id': 5, 'error-name': 'fabric', 'error-value': 0}]
>>
>> Query single error counter value using ynl
>>
>> $ sudo ynl --family drm_ras  --do get-error-counter --json \
>>    '{"node-id":1, "error-id":1}'
> Nit: Align spacing with above command.
>
>> {'error-id': 1, 'error-name': 'core-compute', 'error-value': 2}
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>> v2: split patches (Raag)
>> ---
>>   drivers/gpu/drm/xe/xe_drm_ras.c | 19 ++++++++++++-------
>>   1 file changed, 12 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_drm_ras.c b/drivers/gpu/drm/xe/xe_drm_ras.c
>> index e07dc23a155e..7040ff0f9539 100644
>> --- a/drivers/gpu/drm/xe/xe_drm_ras.c
>> +++ b/drivers/gpu/drm/xe/xe_drm_ras.c
>> @@ -11,19 +11,28 @@
>>   
>>   #include "xe_device_types.h"
>>   #include "xe_drm_ras.h"
>> +#include "xe_ras.h"
>>   
>>   static const char * const error_components[] = DRM_XE_RAS_ERROR_COMPONENT_NAMES;
>>   static const char * const error_severity[] = DRM_XE_RAS_ERROR_SEVERITY_NAMES;
>>   
>> -static int hw_query_error_counter(struct xe_drm_ras_counter *info,
>> +static int hw_query_error_counter(struct xe_device *xe,
>> +				  const enum drm_xe_ras_error_severity severity,
>>   				  u32 error_id, const char **name, u32 *val)
>>   {
>> +	struct xe_drm_ras *ras = &xe->ras;
>> +	struct xe_drm_ras_counter *info = ras->info[severity];
> Use int ret = 0 ...
>
>>   	if (!info || !info[error_id].name)
>>   		return -ENOENT;
>>   
>>   	*name = info[error_id].name;
>>   	*val = atomic_read(&info[error_id].counter);
> Move this as an else case below and ...

My bad!! made a mistake here. Will fix it

Thanks
Riana

>
>> +	/* Fetch counter from system controller if supported */
>> +	if (xe->info.has_sysctrl)
>> +		return xe_ras_get_error_counter(xe, severity, error_id, val);
> ret = get_counter();
>
>>   	return 0;
> return ret;
>
> Raag
>
>>   }

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8B55C4345F
	for <intel-xe@archiver.kernel.org>; Thu, 18 Apr 2024 05:09:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A45021139CB;
	Thu, 18 Apr 2024 05:09:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dVVJFUDo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88B2C1139CB
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Apr 2024 05:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713416993; x=1744952993;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=/WjKpmC+Cjduq6LiKPtBxHxoOqs2EMwON6RrVtyRusQ=;
 b=dVVJFUDojPTe8dCgnDanhDTXR9jijc6R/NqywVVPIauYLd8iy4IkJeDl
 zxa1vQlDaioECVzWweBPzvXZdmqIuZK8d9Sg2ms9g3AVdGdv2tvwDfqS5
 8HnGpPOpf3iRLUvXDoWIllPZNeomVh9B99bUgN3SuUx/0GjmcEYBHnzrL
 IsA4Qb/C9vV4wnsJfNG8TYdTNI+07I2v/a5TgcG+gPk0AdQykhJbRL1ao
 nrEsWA3Qzpebjtm0pBBhTDAZ73OXeDYvK6Y+EAWD2utrZDhgD/hirxla7
 OQuzQvljrDYUKQ9+fBtEScF4BmJP1TdSBHldvoK0RRhwJ2XuGDjHmv7jZ Q==;
X-CSE-ConnectionGUID: ZlfQfKloQAy17H/lQczBJQ==
X-CSE-MsgGUID: 7pcT1//0REeRV6+TEPehSA==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="12726285"
X-IronPort-AV: E=Sophos;i="6.07,211,1708416000"; d="scan'208,217";a="12726285"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 22:09:53 -0700
X-CSE-ConnectionGUID: kcYShaEcR6qROMyfZ95bxA==
X-CSE-MsgGUID: oXTI6Uz/SaOQbRDrHJqOFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,211,1708416000"; d="scan'208,217";a="22847001"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Apr 2024 22:09:53 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 17 Apr 2024 22:09:52 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 17 Apr 2024 22:09:52 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 17 Apr 2024 22:09:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EZvMcFaBa5UMwDI6xoz8WpSbIeaB+CofBjNvGG7L/bzFn5o1Dar2fkQK6NsokIVi0mLRZelC1fUCUDu8e8KqMwtZWb9/os+X0QHuuC4iX9ty3PFR0bNcPtqCfplNlBhXFopTyAEd0yW8uK1y5Lo/tA2HVXmz0raou9FaGKeluTxJxhKz84ZmiEXO1LxBGPUoaNbUUmmww/VSTAoA3cVG+0I/zS8HcxNlWPNd9lXhNo1i9vT+HENMGTI5+H/oJ48rmMUlWheqqhhYCE+8SuASpuevInBWFqGH+ES8ydDjSUUm8Bi9zUgA5Wj54gqd7eGKfIM4sJPNHC/JWvCBGKUYPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uBZf8/0qevbiHDwDIsnRUq/v8mCwN0RpLBvBAVi/shw=;
 b=jwnndU0Oc9GsHTV4nKkp3NYXpTGZ5vCT0DuAuMuKBhnGbGrsyoeZa+X4sR3C1HX0HRaBv1OujPanIwuW6erbFLIYGZvYbXtOKZP9a+MbiA4m3RnHA/faDRDO+8qL2GkC3F+bn12eG71Ef21DeTiURpQf9zZmCExE96SZMuNWJERj/k1kuqU8jjF/EYv5LjXp/PEjWuLdjYqKC1OM0VWYvh4TZ/HC0z6q51GpGR7uTVO9UqD2X4kqn0jz4V6vD4NE4+HO23iP8Qsgvtt14LnFkvhtJ9o/4n/FF8D7fqoQ3c9ZdlD6Uqv2ZVpwLT3rjjGCDFusxjcGAFlQbNBiR4TrsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV8PR11MB8607.namprd11.prod.outlook.com (2603:10b6:408:1ec::18)
 by SA1PR11MB8574.namprd11.prod.outlook.com (2603:10b6:806:3b1::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.26; Thu, 18 Apr
 2024 05:09:50 +0000
Received: from LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::cea4:315b:52ce:11f2]) by LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::cea4:315b:52ce:11f2%3]) with mapi id 15.20.7472.027; Thu, 18 Apr 2024
 05:09:50 +0000
Content-Type: multipart/alternative;
 boundary="------------0M7Eq2qgnzj5TJ2uHsiLED28"
Message-ID: <8cd5dd51-cc2d-4b42-833b-3bbb8c146ba0@intel.com>
Date: Thu, 18 Apr 2024 10:39:44 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/xe2lpg: Extend Wa_14020338487
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: Gustavo Sousa <gustavo.sousa@intel.com>, <intel-xe@lists.freedesktop.org>, 
 Lucas De Marchi <lucas.de.marchi@gmail.com>, Matt Roper
 <matthew.d.roper@intel.com>
References: <20240417212501.312346-1-gustavo.sousa@intel.com>
 <171339034765.54602.16408540374552896913@gjsousa-mobl2>
 <h7vbeswsxbjgf672ddvqgyobvpfslhbu6vmxuc5c6tmt6rbjm4@q5k7wdducac6>
 <d7468fea-b5d4-4303-a179-70c297314e38@intel.com>
 <gmzgyv6tjktchnp77xtux4qoa63v4rckevz2y65dirkxa7tjmi@yb475d2qbaxp>
Content-Language: en-US
From: "Chauhan, Shekhar" <shekhar.chauhan@intel.com>
In-Reply-To: <gmzgyv6tjktchnp77xtux4qoa63v4rckevz2y65dirkxa7tjmi@yb475d2qbaxp>
X-ClientProxiedBy: PN3PEPF00000184.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c04::4a) To LV8PR11MB8607.namprd11.prod.outlook.com
 (2603:10b6:408:1ec::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR11MB8607:EE_|SA1PR11MB8574:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d603fcf-2885-4580-1806-08dc5f65c653
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: x4ERveCnJb2XE3NSx9DrbKHlHF5GG1BWBkeMv40UOwKln1q0YwmMmr7kLpiDoTZYbTOHlURPF6XE2PTD0UBVLA5V3m4Akfqyc0KUyAMoKcnlBqZmALG3CWbTYtSn8cJ3XBq4XAW7mkQ2GqMZWuGoPZEpRel5S89WYM5ymZBcGMpUGQpqKGwaPnnHW29wsUVAR29CAflThxGMElaHMm40C7IQvVA4nvwRKOg3ypzLWx0+sYlb/m6GP6OrpZEqkqOlAlpBpiWFOANkyN5w0Cc/kVFGJTCADMmDWlBzsiMdmm+JayGCHuxiGxEdbnTm6NfuBbmEuohCnte5hRj8MSY1QDA7x8WuRPdMpqIeN4ZysUUTg/OfHOAK76VirRgbytj84V6KgGvgUAsNvzZlLAqX+hn845Iy7uTbhxTHCzkk981/RUYRW1IARfqVcHzkbnBhM5GHHzKaBP+gsGgFE3Jd8lHFYkvYnw6xqYxzou8T69/wgOZTqoDb40zKbgozdpyEp9tByr/DwiKajR71a2OMbTaJ2RRJdcZ843TLG3ueEPqshsHC6MFJRZcyyynKC+fRsKyc8JUdcFIAfPI2+RTFBQmkbEdtRPPCUzwPnQklurUOQ/Otw34TPkjxRlG95F/IhpmffPEV/ZYf5878O1pvOFuDZ1qwpxVhnAXUxfFPBuU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR11MB8607.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Qjl1d2JlLy95aFJzeFJ3OFQ0RnN6MWk2SDluOFU4aEV0NTNWeGRROGcrQjN5?=
 =?utf-8?B?Y3hKdmFGQUIwdnVQTC8wZzRkY1hsMTNYS1p5T0RVZnkwWFFZZ1R3S2pRWFh3?=
 =?utf-8?B?SU1XOU5ZZDJOZE45Nk9mWDdxQWE2RmxTaHh2UTZGQ2JyRUpsdDJIamk1azZI?=
 =?utf-8?B?ejJVNldiZ1pGQ2xCS0tCdHJzTk9UMXJ4YUNtV2Zmc2hCTzZ3cWNsZm9UNERU?=
 =?utf-8?B?amtSYUsxRzM5K0V0MXBNc1ByNjA1L2o0MTA3UjErRFFxMm9KNHFWcVlYQTRU?=
 =?utf-8?B?bElhb3JMaHdNaWI5dDFwZnQ3TmNPVndKVUdXMXVzZ3U0aTgxSnltRzJscjJ5?=
 =?utf-8?B?ckFaNis0aVhBN2dkb3o2anBkNGhKQWE0QlZHNXBrc3ZhTjF3cTRuWEVIUU9m?=
 =?utf-8?B?Wm1EMWtiTVd3ZGx0cFZhTjY0ejR3c1g0YzBMbGdVLzhrdEdLUlZERVJ1b1Vp?=
 =?utf-8?B?R29tZFl5RXdvNE1OMmNVY3Q3MjdlNjJWM1FYcGFSTHlLWTUvTUJiVVlIVXhs?=
 =?utf-8?B?V2ZvOThrbzZnZjJ0RTZITWd2d09TdklPY0tubDcrWUxROEZUMUswZVFkZktu?=
 =?utf-8?B?QmhKRUhnbGpTRUR3cVZEU2dnZnFlekg2WlpxWmRMcm1zdVYxRVFKZTBlM3Y3?=
 =?utf-8?B?akkyRmpScE1sWGFpNHF4SW5XelhBV0l6dm84aExJMWZ5UUN5VXNoUHVKYzVq?=
 =?utf-8?B?M2lhMmhYd1dvL1M0SUZsdVVvd3Y0YzY4VzBIUTFXZXRGa2RjVDR6UzdFTnlz?=
 =?utf-8?B?MFAzN2F0V0dPS2IralBnd3BCaXIxVk5kUlBNWG0zOC9MNmRSc3h3TDFud042?=
 =?utf-8?B?SGpDV3RJWW5rQmpKUEtwWW0yMU1BWEg3L3lsWVpCdnR5YVk4SGdQbUZST1Jo?=
 =?utf-8?B?NVpiVkxObTFHbXJiL1pOU3E5MmtCSzRuUDBaV0x4RW5lb1l3Qm9kWjk0Zld5?=
 =?utf-8?B?TFJyN3kzR2VZcDlKTUtmY1lPb2h2ZG9TaVpVWE4xd2dlTHl1K1huek9DV2d4?=
 =?utf-8?B?ODFkU1h5Q0xacHRHNmptZVh5Q3R4bEhEbFhEVEpqOWdPOVFEU09wV1lwZlgz?=
 =?utf-8?B?WDdlWVpSOTdWbldUUHFvUmRlUG5SMkxRaUJzbFZXdDJyVW14bkhrU0JjL0Ns?=
 =?utf-8?B?VURZbWk2em1UYjBsNnVxNmYwY0dlS3FDQUZqUCtZYmc4MS9yOWt0anhWbk9v?=
 =?utf-8?B?QzVoRktrY2FqTkxKdk1JcEJzTlpLZHNVSEoxTThnKzl3MmtEVENJVzkxZTda?=
 =?utf-8?B?WmozZENxZm9CTjU3Vmtic0hQSWRqbnB6ZGR5MDg2eTYzdGpTZjQ4NENIckxF?=
 =?utf-8?B?UVZmbU9sV3g3aTl3dDZRN2RIbGNYVEluZGkvUUVleHpoS0Mya2tuMVBSZFdX?=
 =?utf-8?B?ajIyRWRrYjZ2ZTlIZE5LUVY3SWxWSFlEaVQvZ1ZzdXprNm0rdDNGR3dWM3Jw?=
 =?utf-8?B?Z0hpNmdwckNDbTNrQXpMVDh0Q3l5d2syU0YxZkZuNXpxTjJEL0EvdzFlcEsr?=
 =?utf-8?B?REpWNjdpbEdRVEdsMllFQTd3VkpUR2d2R25NeU9XNWpKWWN2N1Q4UUZhdm5l?=
 =?utf-8?B?VEVrRmxac3QyR3JaS2RQMmNoaXZGNGgydVYwOFB3VGw1akhVaHVJZnR1VHlp?=
 =?utf-8?B?eVlENE9uMGFLcHA5N20venNvVTlNMmJpMFU0aHZKRXord2c1S2drRHFDaFox?=
 =?utf-8?B?aU5YT2FudWtxeFZKUWxWanZWV0ZodDNiK2lXNzdmTkVGWUZnRUdKdGExb3VQ?=
 =?utf-8?B?SjBnK3VaQTBYTllCUkZha2N3YlBqRHZJZGd0YjUrclBLMEhEckJaWTBWWnJq?=
 =?utf-8?B?MzRPUjA2MDg4SXRGWUJsNXRpS0xDUkRmS1ZxdnpOVkNDTEt1SWpUelp3WXJD?=
 =?utf-8?B?d245bkZIRlJLRDNDdTVibFZLSTkyeGg4L0dNK2pHT2FDNG9TWmRoVUg5L0Jy?=
 =?utf-8?B?M055bFMxc1l0VVRRY3hLNXFzd2pLemgzeDlNb0tyTitxRnNwZ3RCbFFrWXpU?=
 =?utf-8?B?Ull6V3ZUZ0MybWJHazNGSHJ0cXRkRnp4NExRZXgvUG1IWndjREV1TnBxZ2Fk?=
 =?utf-8?B?Z3M1RUs0ODhzUkNwRlF2VS9iTmhvb0F5T0d6TjZmOGhKRkxqNExPZ0VYZUJN?=
 =?utf-8?B?QTN4ZldETmZwRGNLN0lXb0QzR2RYckdEZ2trR2FaUkRVc1Q4N0FWTld1VkRn?=
 =?utf-8?B?SUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d603fcf-2885-4580-1806-08dc5f65c653
X-MS-Exchange-CrossTenant-AuthSource: LV8PR11MB8607.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2024 05:09:50.6408 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iCuzdIBZhljyEYqqTAKQsliMrqfp80LaXcOabZhCyhovvcjVDZJ8jHzDhz+D/aywTH6Bgt0vdpI6b5XpL64XM27RFIS2iNOe1okDDbgBtRI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8574
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

--------------0M7Eq2qgnzj5TJ2uHsiLED28
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 4/18/2024 10:30, Lucas De Marchi wrote:
> On Thu, Apr 18, 2024 at 10:20:35AM GMT, Chauhan, Shekhar wrote:
>>
>> On 4/18/2024 04:05, Lucas De Marchi wrote:
>>> On Wed, Apr 17, 2024 at 06:45:47PM GMT, Gustavo Sousa wrote:
>>>> Quoting Gustavo Sousa (2024-04-17 18:25:01-03:00)
>>>>> Wa_14020338487 also applies to Xe2_LPG. Replicate the existing 
>>>>> entry to
>>>>> one specific for Xe2_LPG.
>>>>
>>>> I would also like to take this as an opportunity to discuss the way we
>>>> are currently arranging the RTP entries for the workaround. Using this
>>>> one as example, created a copy of the entry and edited the argument of
>>>> GRAPHICS_VERSION() to match Xe2_LPG. There are multiple cases already
>>>> following the same pattern, mainly because we are grouping entries by
>>>> IP release.
>>>>
>>>> Do we want to continue following that pattern and keep the code
>>>> duplication? Or should we think of a way to avoid code duplication 
>>>> here?
>>>>
>>>> A very simple approach that I think of is having a single entry for 
>>>> each
>>>> lineage. But I guess that's not really feasible today because I 
>>>> guess we
>>>> do not have a way of expressing logical disjunction in XE_RTP_RULES().
>>>
>>> yes, implementing it was always something I considered, but then there
>>> was also the fact that when we have WAs that are on IPs that are not
>>> close to each other we may have subtle differences like registers with
>>> different offset or mcr vs non-mcr.
>>
>> I see that some registers vary between MCR and non-MCR types. 
>> However, could you please explain how this difference affects 
>> implementation? As I understand it, when setting XE_RTP_ACTIONS, we 
>> simply choose the desired action (SET, CLR etc). So, I'm curious 
>> about the specific impact of MCR vs non-MCR in this context.
>
> you need to pick the right register that has the mcr reg option set.
> Exammple:
>
>         { XE_RTP_NAME("22016670082"),
>           XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1270, 1274)),
>           XE_RTP_ACTIONS(SET(SQCNT1, ENFORCE_RAR))
>         },
>
> vs
>
>         { XE_RTP_NAME("22016670082"),
>           XE_RTP_RULES(MEDIA_VERSION(1300)),
>           XE_RTP_ACTIONS(SET(XELPMP_SQCNT1, ENFORCE_RAR))
>         },
>
> #define SQCNT1 XE_REG_MCR(0x8718)
> #define XELPMP_SQCNT1                              XE_REG(0x8718)
>
>
Understood. Thanks.

/shekhar
/

>
> Lucas De Marchi

-- 
-shekhar

--------------0M7Eq2qgnzj5TJ2uHsiLED28
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 4/18/2024 10:30, Lucas De Marchi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:gmzgyv6tjktchnp77xtux4qoa63v4rckevz2y65dirkxa7tjmi@yb475d2qbaxp">On
      Thu, Apr 18, 2024 at 10:20:35AM GMT, Chauhan, Shekhar wrote:
      <br>
      <blockquote type="cite">
        <br>
        On 4/18/2024 04:05, Lucas De Marchi wrote:
        <br>
        <blockquote type="cite">On Wed, Apr 17, 2024 at 06:45:47PM GMT,
          Gustavo Sousa wrote:
          <br>
          <blockquote type="cite">Quoting Gustavo Sousa (2024-04-17
            18:25:01-03:00)
            <br>
            <blockquote type="cite">Wa_14020338487 also applies to
              Xe2_LPG. Replicate the existing entry to
              <br>
              one specific for Xe2_LPG.
              <br>
            </blockquote>
            <br>
            I would also like to take this as an opportunity to discuss
            the way we
            <br>
            are currently arranging the RTP entries for the workaround.
            Using this
            <br>
            one as example, created a copy of the entry and edited the
            argument of
            <br>
            GRAPHICS_VERSION() to match Xe2_LPG. There are multiple
            cases already
            <br>
            following the same pattern, mainly because we are grouping
            entries by
            <br>
            IP release.
            <br>
            <br>
            Do we want to continue following that pattern and keep the
            code
            <br>
            duplication? Or should we think of a way to avoid code
            duplication here?
            <br>
            <br>
            A very simple approach that I think of is having a single
            entry for each
            <br>
            lineage. But I guess that's not really feasible today
            because I guess we
            <br>
            do not have a way of expressing logical disjunction in
            XE_RTP_RULES().
            <br>
          </blockquote>
          <br>
          yes, implementing it was always something I considered, but
          then there
          <br>
          was also the fact that when we have WAs that are on IPs that
          are not
          <br>
          close to each other we may have subtle differences like
          registers with
          <br>
          different offset or mcr vs non-mcr.
          <br>
        </blockquote>
        <br>
        I see that some registers vary between MCR and non-MCR types.
        However, could you please explain how this difference affects
        implementation? As I understand it, when setting XE_RTP_ACTIONS,
        we simply choose the desired action (SET, CLR etc). So, I'm
        curious about the specific impact of MCR vs non-MCR in this
        context.
        <br>
      </blockquote>
      <br>
      you need to pick the right register that has the mcr reg option
      set.
      <br>
      Exammple:
      <br>
      <br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { XE_RTP_NAME(&quot;22016670082&quot;),
      <br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1270, 1274)),
      <br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; XE_RTP_ACTIONS(SET(SQCNT1, ENFORCE_RAR))
      <br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },
      <br>
      <br>
      vs
      <br>
      <br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { XE_RTP_NAME(&quot;22016670082&quot;),
      <br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; XE_RTP_RULES(MEDIA_VERSION(1300)),
      <br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; XE_RTP_ACTIONS(SET(XELPMP_SQCNT1, ENFORCE_RAR))
      <br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },
      <br>
      <br>
      #define SQCNT1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      XE_REG_MCR(0x8718)
      <br>
      #define XELPMP_SQCNT1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; XE_REG(0x8718)
      <br>
      <br>
      <br>
    </blockquote>
    <p><font face="Courier New, Courier, monospace">Understood. Thanks.</font></p>
    <p><font face="Courier New, Courier, monospace"><i>shekhar<br>
        </i></font> </p>
    <blockquote type="cite" cite="mid:gmzgyv6tjktchnp77xtux4qoa63v4rckevz2y65dirkxa7tjmi@yb475d2qbaxp">
      <br>
      Lucas De Marchi
      <br>
    </blockquote>
    <pre class="moz-signature" cols="72">-- 
-shekhar

</pre>
  </body>
</html>

--------------0M7Eq2qgnzj5TJ2uHsiLED28--

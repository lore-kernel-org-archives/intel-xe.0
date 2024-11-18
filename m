Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5053ED43FE3
	for <intel-xe@archiver.kernel.org>; Mon, 18 Nov 2024 07:33:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05F2710E1CA;
	Mon, 18 Nov 2024 07:33:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mDrSoxlN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE57F10E261
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Nov 2024 07:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731915236; x=1763451236;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=cdibwo1CtULV0rL0QLtF4IJP5zCTrCRhfXzejZaudY8=;
 b=mDrSoxlN+RX9ELiRlpswWXyr7W2twSCb6qwHOo2j3qjhjMYraf0ZuYMa
 RzLW2AT6s9Ik1HmP4NS0M/IsON80ZA3bOzaDUMw/W9wVTTzFTQnsVG4lY
 phEocZoPCYqNCnWa+Tzfx/4HNxUFsF+9u/wSmTMJ9mlb8aUnqcj7Y+KBW
 Bq2mCTZww1AB1HOOIRQAxePFejtuz8HDwfnotSfZuxIa1KVoAOyKo3mPc
 NgJX+QrHhh19jNzuaevIDe8DxJ6iPkMaoHl508QhSY2dxuNkjY7TV8SEH
 6feBhGdj48BDBKIRJJXMXrYv+SyDXrX9n8UEebUHY5v2a0x0784UNW7J3 A==;
X-CSE-ConnectionGUID: KztfM67jSKmkHyXXyOf4iA==
X-CSE-MsgGUID: h8RoO3uKRl2ZflndHYQBiQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="31912664"
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; d="scan'208";a="31912664"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2024 23:33:52 -0800
X-CSE-ConnectionGUID: qjCwcj04SFSDjDwVUWGDiA==
X-CSE-MsgGUID: am6csQhrRpWc5tYfb9Zl5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; d="scan'208";a="89571995"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Nov 2024 23:33:46 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 17 Nov 2024 23:33:42 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sun, 17 Nov 2024 23:33:42 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.172)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 17 Nov 2024 23:33:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gHc5lNIlIZgrV2sYaP9JQjVaCdKnAcZm0mGTgeQnIv5ot44SAKkGPkqhraJ6tDywNgtfV9gh0Z/FTemUTVQ7QFq9/6sC00DsPTaCmzBbj6fGpCA86CcOmBxFCAAcfQHMlkmAStAJwNTuNFZ4noqiJc/mkU8Fx42kiziKrCcVUEj8RdHocg74OfVGoKV5ocdEJlFsByZMcnuiOGb1ZHKKxXNVTsXt8BUyGBUamUCl8BndC7iRvPP6wAY2OrZIDHXSRQ95Vn8YK09Pusz8Ipx8g/hgc1lztgUCcdgTt4ykZ/7SzvWO+VMzIsw7IkTK6oDqm/G4r+DLLkRztCxc0YsFgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oe2pCVNOj4WBq1KowsApPAfwmmldaUkSHszCBw6zwaw=;
 b=ByC0HlbAx0NQKqFyTJluOcOh0a3Lsf/d2Av84IIzEJckiH0jMLZ7ctQn77TLJ0r2lF2rRxUY2JyvKwwZfaaqJauUT/xL637UWocgggcZ4YbEtKs/iy/+6rowYEXQQ7iXaTLYTEazOucHTXlpwYGEhlgoFPZWIGk2WG4mj/b7dtQVPX7j3FsPx2BkG+Z3us8Xx7kB/murcKvty3zVSnuNbP0P3kMNHxc3IdfSfQ35BxsjgHfvNuxaUrBiqcS5FDJlFV7mGcNhxtNP+Cr6UBx3lLT74XYd4qvB6qm5bSEyeVkhLa2fW/NucQECtMdv195YNvEusc8sM/DnYSIUI5OLtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SN7PR11MB6678.namprd11.prod.outlook.com (2603:10b6:806:26a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.21; Mon, 18 Nov
 2024 07:33:35 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::a255:8030:603f:7245]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::a255:8030:603f:7245%4]) with mapi id 15.20.8158.023; Mon, 18 Nov 2024
 07:33:35 +0000
Message-ID: <204f4cc4-5322-443c-a4d6-78636ad43e79@intel.com>
Date: Mon, 18 Nov 2024 13:03:27 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] drm/xe: Add single engine busyness support
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <vinay.belgaumkar@intel.com>,
 <aravind.iddamsetty@intel.com>, <john.c.harrison@intel.com>,
 <ashutosh.dixit@intel.com>, <soham.purkait@intel.com>
References: <20241113045549.2390980-1-riana.tauro@intel.com>
 <20241113045549.2390980-6-riana.tauro@intel.com>
 <ZzaRGn1I7rQaIFSq@orsosgc001>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <ZzaRGn1I7rQaIFSq@orsosgc001>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0234.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:eb::6) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SN7PR11MB6678:EE_
X-MS-Office365-Filtering-Correlation-Id: 933ca463-25ae-45fb-8ecb-08dd07a34f63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?KzhHclJaQWIwTHVoaElyWjllS0dHSkNlZWljdlhMZWhJQ2lnWWJoR1ZZQ3pv?=
 =?utf-8?B?aFlmRnVPZVp5S3hNS3dBZE9reWVQVjUvajNjSHJEZWRhcWFBUFRBTWZCV3FT?=
 =?utf-8?B?TkFXU3k0SXUvU3lNVXBZN21uUEpGeTZ4UlpkcnNBd3VKVUNWWlhDc2cwRnYw?=
 =?utf-8?B?blNUOXhscGhZNktQVElTSW9lWUNtVmxyZGVZb1htMmY1dCt3c2owZ2tpOTQw?=
 =?utf-8?B?ejhRZHdFdU1hdTA4M0lmV3ByQ1BYb2xhVENiWkVnUmQvNTRCNHZjVjFCcUht?=
 =?utf-8?B?MndMQmpUV21rZEZpTU1VbWM3UEpQNit5UnpZQVpYRUo1UGRQclBzbzd5MTV2?=
 =?utf-8?B?UU5QNWpBNWpXaFVPNVBpdTVRZ0RFMXY3SUYweVp5a0pITmZOd3N4aThxeTEx?=
 =?utf-8?B?NU5xZVVFUXBEMlFrenBxY2htTHNKaU1jK3JrMUtEeE9SdUlCZzdvdkM2M3lM?=
 =?utf-8?B?dERWcFZVVWwxWUhSblNaMDhPWkcxdHhneXFyd0l1eWEvMGxvWjIyUGYxb1pH?=
 =?utf-8?B?bEVKcGpaWjdIMFJrZTlrNTIwOGNoelcvMTlKRm1FNnM5TTRUeFJ1Um5nMUt0?=
 =?utf-8?B?UVBzNUtkUVZBdy8rT2ZaMzNMd0YxZWtya2tpWTEyZ1k3OTJxNWdaQjlYd3ZE?=
 =?utf-8?B?UUQwSk9EM2hPUnR3WkhNTy91VmV6WDZvb3Q4MVIyRmZVVUVUTmk3NHVKczB5?=
 =?utf-8?B?YXJreG1WUmd4eUdtN2pscEFkWWZWdmt5ZGF1V2RKK0R6UjM2cUY4ckU0aTI5?=
 =?utf-8?B?YzJ1bHFiaFZ1dzJueExVYkJSRXNWSlpxSWNWQ2FhUEhYOXprSXdpWFNGNUt5?=
 =?utf-8?B?UGZQRWNnb0hxYnErYnJrZnFIeVl6ZDVqaHI4NTRFNzQ1MFV2eGMxR1k2RmVJ?=
 =?utf-8?B?SStIL2lNOWg0VnVrOXFxTG5jTDRXbXFaM2g1Q1BraXBjd3oyK1ZOT284VU5y?=
 =?utf-8?B?VUlzdmM3YWg4VHFrSGdlZjVnbkFhdDk0UlNndmtNSHYxMGx6TkF4NlVObEdm?=
 =?utf-8?B?eTBZN2hTbFJIeDYzcnFVU2xBNWUrNWhOU0lrcW50TjFxT09IbFpTbUpQK1VN?=
 =?utf-8?B?SmpZRUJSbWRUTHUrUFZWUmxZa3U2bHZxSnZEYjZXQ2MwTUU5Uml6THRGcFRo?=
 =?utf-8?B?UFl2V3prZTRxdE9PY2hLa1YzWHZSODNJZUNBdXVkYXhuZ1lVZVkzYW9zcWdW?=
 =?utf-8?B?VkdxVGJ0TWlibHZWNng5VC84aUhXc2pOQy9rdUZ4OHpOblczK2x4NWRLTDJw?=
 =?utf-8?B?aHpsdWNneDZEaGlRbjF2QmFMWWxBWmJDdkRmbkxMUnkvWGh6R2dGYVFWMlR1?=
 =?utf-8?B?R3U4ZWN2d281c1FtWU1WMXBuNTNWaTcwY2ZqZGJEOEVrM0tGZlZ2Q0ZYVnhI?=
 =?utf-8?B?dld5dkFaMjFwOUh0ZkRkRVlldzYxYjhqbFBaTzhiTmdqQ2lLK0diOG83S3pw?=
 =?utf-8?B?SmVuRlYzK2NIYmdOdjRrZW9KMG1jS1pja1R5VzdQYStreS9VRWMrT1BDZXYz?=
 =?utf-8?B?K2c0TUZpU2hhamk5NDVIT256ZUc0a0IxU1BWbzVyYmhHQkJpUCtEUzZpTjZZ?=
 =?utf-8?B?cC9rbktkRkMzN2U1L3E2M3FTMDRwTTR5cElNZzNxUjFHMkJhMTRtM1hEYWg4?=
 =?utf-8?B?NzB4QmlmSGNIZmlPZHVyZ0MzM1ZxZ1JoZ0pGalRhYXFuYlJnMnpQdndHR29N?=
 =?utf-8?B?RnlsNVRKVkMyQzYvTE9XTllQTnVINUdSN1FHcGZJNDkrelJldGZ5UzNQNlZv?=
 =?utf-8?Q?qifGfs/H2nVVcEU85A=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WHZKUUZlZkRyc3k4Z0ZTMmpJLzJRZ29mdml0bFBVbTA1aGJSTnlLQjdPM20r?=
 =?utf-8?B?UkhpUEFINTZQQnJ5OVNydWxFVmRsU3ZlSHFpeFdqUVo3Wm44dGZkeFRQb1U0?=
 =?utf-8?B?cVozY1A1c0J0QWp4dFpTWGdPUmQ2Tzl1Y1hlMzhNQVFqT29NKzFjN3Vrbnh4?=
 =?utf-8?B?clRvUlJlcWdveXJoanZWN3pQQWtjV2JPQTQxNU5aY0VPVFVLNHRjc09ia3Js?=
 =?utf-8?B?MnEzTFYvNEVXMit0UDQ3UktoRlRZbjN1MXo2Nk1JYXRXbWpUdzRoVkd1TDI2?=
 =?utf-8?B?TFZRZlpDVzAzNiswK2xLTDJmSGN0Nk5jdTArWDFiTzZMZGhqY3k5OGQ5bGxP?=
 =?utf-8?B?ckh4Wk1oK3ltVmFEWkRqS0tTQXRPSi9GQkR4Uytxb3Y0Tkh2RDE3WC84dU5D?=
 =?utf-8?B?UzZVVlN0K2NIdy8xR3hBcW9QWnREVHdRQzBpaXB2VUZHWlM3RGxndnYvSE5D?=
 =?utf-8?B?Z0FnQ0R5aEdFTGxDSllLeXovWFBkbGxyZGxqa3JlZWxwcjAzUEZna3ZUdTc1?=
 =?utf-8?B?d1h1d04vKzY0RVpaVk1kbm5YM3VaRkc2ZFVMUlI5SG1lL0p5QW1sNGw5bS9x?=
 =?utf-8?B?U3NyYzJtVDErMUZwaERFSzJtekp3YnU0TTRENzVCT1M3VWcxTHhZVitQVlV3?=
 =?utf-8?B?bE5wbENLZitZVzRkbEZLajVjL2RyTEE0MHBrSWM0aVp5dTY2b1B5Rjk1N3Qy?=
 =?utf-8?B?MFZJMlJYWk9PRFRycXZES2RteXZqVW4wQ3BEQlNWcS9Tdkw4bDBVU2VUYkda?=
 =?utf-8?B?SVI4NkROZWprNGZVNlJ1OGhyMjRsSXF4NkJ1dWpoWUVDY1ROelhod3huUm1U?=
 =?utf-8?B?ay94dWsxZjVmNU9EYzJ3SHhHNFRueW9ONHNVUlNQRFZ3aDhDc3UwcDRncFd0?=
 =?utf-8?B?UTFNYStBR3R0bVNNLzdTdEZIbWlub3B0aWhHTEVrVWt0K2JpUTV0aUpYd1g0?=
 =?utf-8?B?bVBUT2tmSnUxUnQ4WWpicHgvS2NUMHRYVXpnNlZQa09Bbm5aWklqTTdJcWNp?=
 =?utf-8?B?ek9JMUE0SCs4Y05MMFBVRmRSVEZWMHlXZ0R1SWJ3NVJPRWt3MDgrNU5VUTVG?=
 =?utf-8?B?ZnBXQm5YejkrUkFyR3hDOEUwYnBWeU5EWkoyUWFJdHk3RU1seXJxSDV3U3Fl?=
 =?utf-8?B?RHp1N0dNL2xCR2JOK2pOVjc0QXhLRmswTjZqSTNrRDFYU1RaUWNHWkFxaHlp?=
 =?utf-8?B?N3hwSEFjUHhXYmJ2NlJjYjRtVkxOeW1rN2w2bExyNC94TWVkT2V1QnBsQS9Y?=
 =?utf-8?B?ejF3Rng5NHQ0bjdVdXFFK1d0YmlxaURDM1pqRFBjS2dXMWNqTk50Z2oyb1Fp?=
 =?utf-8?B?cjRWWUkzeHZVbXExTitoeGtxS2laQkJERFFKNVNkSkpIUUVDZXV5dmIxMzRR?=
 =?utf-8?B?bVpWN29JdlRDaGJqZWtVSW9FbytDa0V5ekQvMmgzd1ZmRHdqSE53cTZjbHd2?=
 =?utf-8?B?WTNKZzRXcXlSdFJmeTdEeE92MEdZN0NjNTV2US8rUk5CZHkwRldPTlVjM21o?=
 =?utf-8?B?MUFmUzhwOSsvellxV0MvUmhXbWRNTXJKLzhROTN4eng1Y1lydW14S1pyM1BP?=
 =?utf-8?B?aVBBNDZ1VXZiSTV2aXMyVDZlUGpWZnFRSGVSR0F2Q0xtK000Q1QzOWJ1K0hj?=
 =?utf-8?B?WXpTNmplUEYyRXAxZmxYS0I2aVZQZEpCVDJuemsyTy9xWERnSGxDU21kSktQ?=
 =?utf-8?B?TGpKeENtOVNhRHo3UlBuZHUxZkd5U3FIZVRoaTdQZWg0Q1pCZ2hsQXdlcVJ3?=
 =?utf-8?B?Q0hjVm1vVkhoeWVKeTF4MndTVk1KVXp3RjltL1N1a2lXMGl3aksxY0Zjdi9D?=
 =?utf-8?B?WnVUOS91cU5WaWRYT2YyZzVvSUlnZElWU3M5VWQyOW1JQWNqYWlsdTFFV1Av?=
 =?utf-8?B?RXA4Nm1HWXkwbWswTGM5ZXIxeEE0NjR5cS8wUmpaSGhHZ3RrTGFsQUdNRCt1?=
 =?utf-8?B?SUMwQzcvei82RHlCblF0L3JscGRCM1NSOTg0U0NwclRoK0QwWUkwTk1LNWFo?=
 =?utf-8?B?NDh6Mzl2SzExMWh0S3NkTlgzUnJhMzhNejV2RllLUHp2ZGNGQUxOcjR5QzVy?=
 =?utf-8?B?aVhwNUJZT3ZwSTdGMlY4Sno3bStQdlkzZXFtYnkvaHhTb0V6MW5memVkRHBl?=
 =?utf-8?Q?jRYkYee2WWRUIqKczsxLE01md?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 933ca463-25ae-45fb-8ecb-08dd07a34f63
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2024 07:33:35.3336 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IsUb1O9uMiLECj8msZ4DQszbGpVDuJiOBJhKcRRLlDLMCZ9ytuyb6x7DzTUfxvl/tUW9Dj4mHD8Jzck8Q7mAxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6678
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

Hi Umesh

Thank you for the review comments

On 11/15/2024 5:38 AM, Umesh Nerlige Ramappa wrote:
> On Wed, Nov 13, 2024 at 10:25:47AM +0530, Riana Tauro wrote:
>> GuC provides support to read engine active counters to calculate the
>> engine utilization. KMD exposes two counters via the PMU interface to
>> calculate engine busyness
>>
>> Engine Active Ticks(<engine>-busy-ticks-gt<n>) - number of active ticks
>>                          for engine
>> Total Ticks (<engine>-total-ticks-gt<n>) - total ticks GT has been active
>>
>> Busyness percentage can be calculated as below
>> busyness % = (engine active ticks/total ticks) * 100.
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> 
> Some minor comments below,
>> ---
>> drivers/gpu/drm/xe/Makefile                   |   1 +
>> drivers/gpu/drm/xe/abi/guc_actions_abi.h      |   1 +
>> drivers/gpu/drm/xe/regs/xe_gt_regs.h          |   2 +
>> drivers/gpu/drm/xe/xe_engine_activity.c       | 317 ++++++++++++++++++
>> drivers/gpu/drm/xe/xe_engine_activity.h       |  18 +
>> drivers/gpu/drm/xe/xe_engine_activity_types.h |  85 +++++
>> drivers/gpu/drm/xe/xe_guc_fwif.h              |  19 ++
>> drivers/gpu/drm/xe/xe_guc_types.h             |   4 +
>> 8 files changed, 447 insertions(+)
>> create mode 100644 drivers/gpu/drm/xe/xe_engine_activity.c
>> create mode 100644 drivers/gpu/drm/xe/xe_engine_activity.h
>> create mode 100644 drivers/gpu/drm/xe/xe_engine_activity_types.h
>>
> 
> [snip]
> 
>> +static u64 get_engine_active_ticks(struct xe_guc *guc, struct 
>> xe_hw_engine *hwe)
>> +{
>> +    struct engine_activity *ea = hw_engine_to_engine_activity(hwe);
>> +    struct guc_engine_activity *cached_activity = &ea->activity;
>> +    struct guc_engine_activity_metadata *cached_metadata = &ea- 
>> >metadata;
>> +    struct xe_engine_activity *engine_busy = &guc->engine_busy;
>> +    struct activity_buffer *device_buffer = &engine_busy->device_buffer;
>> +    struct xe_device *xe =  guc_to_xe(guc);
>> +    struct xe_gt *gt = guc_to_gt(guc);
>> +
>> +    u16 guc_class = xe_engine_class_to_guc_class(hwe->class);
>> +    size_t offset = offsetof(struct guc_engine_activity_data,
>> +                 engine_activity[guc_class][hwe->logical_instance]);
>> +    struct iosys_map engine_activity_map = 
>> IOSYS_MAP_INIT_OFFSET(activity_to_map(device_buffer),
>> +                                     offset);
>> +    u32 last_update_tick, global_change_num;
>> +    u64 active_ticks, gpm_ts;
>> +    u16 change_num;
>> +
>> +    global_change_num = read_metadata_record(xe, device_buffer, 
>> global_change_num);
>> +
>> +    /* GuC has not initialized activity data yet, return 0 */
>> +    if (!global_change_num)
>> +        goto update;
>> +
>> +    if (global_change_num == cached_metadata->global_change_num)
>> +        goto update;
>> +    else
>> +        cached_metadata->global_change_num = global_change_num;
>> +
>> +    change_num = read_engine_activity_record(xe, 
>> &engine_activity_map, change_num);
>> +
>> +    if (!change_num || change_num == cached_activity->change_num)
>> +        goto update;
>> +
>> +    /* read engine activity values */
>> +    last_update_tick = read_engine_activity_record(xe, 
>> &engine_activity_map, last_update_tick);
>> +    active_ticks = read_engine_activity_record(xe, 
>> &engine_activity_map, active_ticks);
> 
> Whatever we read from the metadata record and the activity record could 
> be added to a trace call so that we can debug issues using ftrace when 
> needed.
Sure will add this
> 
>> +
>> +    /* activity calculations */
>> +    ea->running = !!last_update_tick;
>> +    ea->total += active_ticks - cached_activity->active_ticks;
>> +    ea->active = 0;
>> +
>> +    /* cache the counter */
>> +    cached_activity->change_num = change_num;
>> +    cached_activity->last_update_tick = last_update_tick;
>> +    cached_activity->active_ticks = active_ticks;
>> +
>> +update:
>> +    if (ea->running) {
>> +        gpm_ts  = xe_mmio_read64_2x32(&gt->mmio, MISC_STATUS_0) >>
> 
> extra space after gpm_ts ^.
> 
> Also, does the mmio read require a forcewake here?
> 
Thanks for catching this. This needs a forcewake
>> +              engine_busy->gpm_timestamp_shift;
>> +        ea->active = lower_32_bits(gpm_ts) - cached_activity- 
>> >last_update_tick;
>> +    }
>> +
>> +    return ea->total + ea->active;
>> +}
>> +
> 
> [snip]
> 
>> +static u32 gpm_timestamp_shift(struct xe_gt *gt)
>> +{
>> +    u32 reg;
>> +
>> +    reg = xe_mmio_read32(&gt->mmio, RPM_CONFIG0);
> 
> Does the mmio read require a forcewake here?
This doesn't require a forcewake
> 
>> +
>> +    return 3 - REG_FIELD_GET(RPM_CONFIG0_CTC_SHIFT_PARAMETER_MASK, reg);
>> +}
> 
> [snip]
> 
>> +struct engine_activity {
>> +    /** @active: current activity */
>> +    u64 active;
>> +
>> +    /** @last_cpu_ts: cpu timestamp in nsec of previous sample */
>> +    u64 last_cpu_ts;
>> +
>> +    /** @quanta: total quanta used on HW */
>> +    u64 quanta;
>> +
>> +    /** @quanta_ns: total quanta_ns used on HW */
>> +    u64 quanta_ns;
>> +
>> +    /**
>> +     * @quanta_remainder_ns: remainder when the CPU time is scaled as
>> +     * per the quanta_ratio. This remainder is used insubsequent
> 
> s/insubsequent/in subsequent/
Will fix this.

Thanks
Riana Tauro
> 
> Thanks,
> Umesh


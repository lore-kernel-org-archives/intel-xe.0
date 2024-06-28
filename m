Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B744C2BD09
	for <intel-xe@archiver.kernel.org>; Fri, 28 Jun 2024 20:06:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF19B10E0AE;
	Fri, 28 Jun 2024 20:06:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LaE6OYt9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A67B510E0AE
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Jun 2024 20:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719605166; x=1751141166;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=42iZqUB4f91Y6PuWyl2Dogbfp0Za7Gj5K0DS+xkpzBE=;
 b=LaE6OYt9ldC6lGncr7vduKHy54iy0Jyxz5+NHU8MQ3GfSoTGKud8RGk8
 baE6nCVajT0/qG4Wdf3jHX4NNrk3Oml0GQOZEGtiJVK5rg9OFyqZOoY3S
 6CZtXPBlzHlGHfES/ARvNPp+KJMhqEIw8eLyks1YE53otPosTv8F7Bdtl
 0D0J+ABuUqxStX9KXqRq0gzHjKYC3UvUoVX9Di/VskjJoVFUdC+N02WI7
 RNkTZZFqtrr06vhZDokKL0hFa9dtM3zAf32GgAoVm42T9jDKIQH/emjmc
 U4I0684P/bPkcQqCxDFFbupbMTAF19yauEBdcQ3Q3EHtOFWZVp28eHfv4 Q==;
X-CSE-ConnectionGUID: exkJYaaLQ7y0YUOjearTVA==
X-CSE-MsgGUID: Ph/Kl6ayQOm6UPN3pW6iJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11117"; a="16622251"
X-IronPort-AV: E=Sophos;i="6.09,170,1716274800"; d="scan'208";a="16622251"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2024 13:06:03 -0700
X-CSE-ConnectionGUID: qt9oSHbVQly4wrgaIKYI2A==
X-CSE-MsgGUID: quqoI5XDR86u8gF0m8MGpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,170,1716274800"; d="scan'208";a="68035416"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Jun 2024 13:06:03 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 28 Jun 2024 13:06:02 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 28 Jun 2024 13:06:02 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 28 Jun 2024 13:06:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z08JXgmh15WcX54Pia3IfedP4mSuUMxiJzkN4JoHlZ3EaiJulBNukCr+7T6vJ+K5DZQQVTvoLxk1v8KycQs9I7wASup7xq70MfQKG2XJMWfb0vOQAlgoHFoEIH8FX5ufxbVNAxF/kTvPceBdFhn1FlixvcMWBUjcIYs7VO+wjRmmJHO3zUJnHNadgs7Lgda/FbD5oyao/PIE2nBZE6wzNegKjzw4EfVuGc41usFpsdKfC/R3V2fkhaRVdIAEsgZ7RCbuw/mlypr0gMmdQ3Ci0zsyTFowJ14ms5qUzVXMMZdKV/SvlvTUOUqbUEuqgnfuDZHbbBwpCDKM4pnX6YyFTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dZPh2ZiwA5Af+qIMWiVkOgydN6Qwqw/QXdQ1dXaroeU=;
 b=KNCKeilNfMZmnvcYo3/YaWbmh6iwNgMm2PFdv4Juntfe8W/t+nDEu3JA5GrmBg/5Vpu0MM2x97wQZjmXrwLTPMundigDYb5AuMQET0882Uj7E0TFqdrU6fxoFxlJP9lpEjFxdClq9jVqLyabn1MUCl4pGnUvgVumh75tQLm6gzJl8Cl7YlgiqT2vDEMT9NATH1d6CatQZoSP/MAwFQ2gKk6i0OyzIwqyzB5Wnl82hBvhHD1Yu2i+DEngpzUxjbdFbVyNOQxZD0dSWvIVWh5P/G4SFCALZNZgIpNLVT7SF7/Brt9vOVRvEdyqWc1pbFo0BS/r2AqCas1klgsdtS2lAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by IA1PR11MB7318.namprd11.prod.outlook.com (2603:10b6:208:426::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.26; Fri, 28 Jun
 2024 20:05:57 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%6]) with mapi id 15.20.7719.022; Fri, 28 Jun 2024
 20:05:57 +0000
Message-ID: <fccf45bd-1188-4c1c-8bb6-8b8cff20a594@intel.com>
Date: Fri, 28 Jun 2024 16:05:53 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 1/5] drm/xe/guc: Prepare GuC register list and update
 ADS size for error capture
To: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20240624215404.3213075-1-zhanjun.dong@intel.com>
 <20240624215404.3213075-2-zhanjun.dong@intel.com>
 <81cfebe69df10f62992cac555ca85801b63afa27.camel@intel.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <81cfebe69df10f62992cac555ca85801b63afa27.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0025.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::30) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|IA1PR11MB7318:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e64656a-17b1-4fea-897c-08dc97adb902
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ejI4OWRnLzVVVFpLNHJqd2JjTm0wYjV2Um1DTVBVcm1WWEZuTzVUaUIrZGJ5?=
 =?utf-8?B?VjJGeUZVSjFWbFA1VVZWUkoxUTVSUE9rbk9SendnY2RvMjBhUTBXUTlwNDBp?=
 =?utf-8?B?THp3RncvV3N0UnM4VGc4WUdZU0lCTG9lOFc1bERVNXd2RU1IZXczNjBoRk1I?=
 =?utf-8?B?SHpEaEdpK0ZZUy9Edlp1ZEdleldiQTBoYmtpa2c0UDJSZXlxMFV1K2U3bHZI?=
 =?utf-8?B?Y1dBaFUwMHlKWlFuaWZjNERzcDZqc0pNSWZ0N0YrelpTRTQwV2RUZm5BUlhL?=
 =?utf-8?B?VnNja1ZDdzVGTWlSdWNkNVp5c2Fyb0tnam9QMkhoWkZVZ2wzeDBwUjlOUWVq?=
 =?utf-8?B?eDVlT1VlY2g5SzVuV0kzbGhyNzBwN1k0VUJZUGVoWERJNVVIR2Urb1g0Zitn?=
 =?utf-8?B?KzArNXkrVFcyYUVIck1VcVNWdHV4ZUMvZmFNTHJCcmdnUERIRVBJMDV4ZWgy?=
 =?utf-8?B?aUdBUnRZVnBxa0JvdHFKNTV5bkxvZGY5eC9uVGtuYUYzZkw0MXFyVXF0TjE4?=
 =?utf-8?B?K0k0SUFSdmZReHAyQ1pGdC9ZY1c1dzIrMEFtRVRtRWIrTUp2YUFlQzlXeVZE?=
 =?utf-8?B?L3JNUkVEUjRsS2FUUFMwMUZ6VDNncHk2LzlRdWVHT2psV200WVlqSG1kTWc1?=
 =?utf-8?B?cUI4bWUxK1VnVGxqR3I0V3BXYXd3ZGpBRjl0ZDN3aFdrRFpHSlo4ckVsV0s4?=
 =?utf-8?B?YlBUYmt4NVhNYWp4cUtkVmY4TElCMXZCZjBXNlJ5RGo2WHdselIxZ1Fab1Zo?=
 =?utf-8?B?VGVxL2FvT2I3dVk2U3o0SkRWV3J3dFZwRjdScThIWm1FOGVjd3pGRWY1a0tp?=
 =?utf-8?B?a1l1TjMxbUFqUzFLVG52VEFzWDZZczFmd0RxVGduMDhTdkR1aFBMbHh2RDJs?=
 =?utf-8?B?SmIza3d2RXhIbUh6amc5QUc1eU9TVjI1R1pzT2tEU01lN2lEUEw3Q1BpWi9a?=
 =?utf-8?B?ZnhYeGFtTVgwdlZCQUhudnA0QXgxbVM2NHY2Qno0bTVOWlZWbDA4QzFTTUY0?=
 =?utf-8?B?TDl1ZWV2VlNXUXprZ2dlTTNHZ1VvaE5OajlmdmpxMURFRWxQZ24vV1ZaaHh1?=
 =?utf-8?B?dlFGeDJrNTdYSnpaVDJMVzhOYnQva0MzQ3BjQ243RmErV1lXYW84R1lRbHU5?=
 =?utf-8?B?MUpxQWNVb2VQYWlkVS9yRkQwblNMSFlMakZmUlRzcTFLcnVYc3VtV1g3TWgz?=
 =?utf-8?B?OEszQi9DWDFGRWM3T2VCNEttQmoyZ2ZiUTQwWEVpeUcwUno1OE04TEV1eE9h?=
 =?utf-8?B?SlZMR3ZzU0N6VWl1VEEwTXVFdHU2R1BoeHlOQkZrMUVQSytnQXg2R21JTlJ3?=
 =?utf-8?B?SGphcnhMOHJqNkJHaDV5eFlsTVE1bURZOGJJSCsxSmo1UDk4akd4azJXL2JS?=
 =?utf-8?B?M0h1Wnd5YllLMis0YnVKWlRDL0dOQ1N5amUrUTd0dHRNdWxLU0l1TStSYUl5?=
 =?utf-8?B?OUlaeHVMSEc5eCtkUjZFSW1BcFp2OTB5UzhrRWs4WkZuSVU3MkdZSGpvaldm?=
 =?utf-8?B?TVFnWWNhRjFkejdjN29nbjYxaU05L2J3aWFmSTRyQ2luVjlKVm1zT096a2Ry?=
 =?utf-8?B?V2dOUW5yS3NwakxYcDMrTnlDeW9xbFZOQ29zQ0JNU1drTVVOVlFZQUNiTk16?=
 =?utf-8?B?dW5IbCtUSDl0T0xzd0VjWm4rTWFKV3VqZTIxa2MwQlpPSi8wRjhoUDNkK3hT?=
 =?utf-8?B?UC83d1R5UXJzZm9jQ3RkOHZBeXlBYXoxNS9WdmJyM01zWlQzVXJCSTJTWGxv?=
 =?utf-8?B?ZFN1ZlBNSFdKbG1TMFhpQklhdFdMQnI3RnEwQ1dlWG5yU0hTZTUyTDk3blJK?=
 =?utf-8?B?WjM5TjFmSXFmT2FzNzg0QT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MTFRMzVPN1hDMkt2SVFMV3p4ZFhmMHJWNFNjRFZsV0FqblF5Mk00RklLV05v?=
 =?utf-8?B?SHNPZlpyek9JODRJVCtPQXA2ZUpSbXd4eTNPYThkZUFJZXdkcitPSnZOOU91?=
 =?utf-8?B?SnpRYzRVeHhoVWlVYkExbmc2Q1U4MEdtRTZ0RXkyZXRkdGJaNnI2VTJZVHdn?=
 =?utf-8?B?RFdiSHdLUWhiSDVlaDQvY2N4OXFvMjhpcG5yd1JxeWJ2LzZ6aElCa1EzZkpS?=
 =?utf-8?B?V1l6ZWJrMkRQYWczZGczbitMZUIwdU1RQ0ZjdjV0c3B6cWYyT09zdXZndGVq?=
 =?utf-8?B?elRSaFpYR0MxNHhmWldQTlNzekNjZ21XZXJTNC9YS2lxZnRtUjlkbGI5YVBa?=
 =?utf-8?B?aWxNME9LeEFCdmFqZm0yb3lzRGhpcGliYkEwOExlZEd0cnVKL0x1cFBiYVFo?=
 =?utf-8?B?RzdhU29aT2FMZXFJMUIwenY0NVZJQnNCYUxuNFFyc0hqTkVHMEtqMEhCZFQv?=
 =?utf-8?B?dElJTTFJeWpnMlNCK3NlTGcvWjFTNElYamJjbXBQakNqMUR4SUFJWisyRjFF?=
 =?utf-8?B?OGN2ejZLL0ZtcDl4M2hFR3ByR2dyY0pSSkt2Z2xPUlRoNWRmSjQwcm42d2Z4?=
 =?utf-8?B?dU03aVIrNGI3RkRkZ3BTUEswMjhDV0t5ZVkrR3RabVhybGwwcjZyNmF4ejky?=
 =?utf-8?B?cElFMms0cjFHbFpjQlpOeHpjQkdxRjhKZWx4STVzZWJ3aWxtcVp0UHExV2Fn?=
 =?utf-8?B?NzVGY01na0psd2xqd1BqLzFvYWk5d09qbXBYSFpoTGxwVUdNMm9vQkV4a1Y3?=
 =?utf-8?B?WC9OZXZUSDNUVGRhVU16b0ZNbTZSZDZtdGUxRGN2eEZMeENuVmxhNHFqRG5r?=
 =?utf-8?B?UE5ncHFSRUd5VEV5WmNnR3NoWXRxM0hRbUMxVUhGaHI5eW9GWlhoVDJmY2dv?=
 =?utf-8?B?NHY4RG1kU3BLdU1adW1EL2ZoRHFCc0Q4dVRMOWltSDNBN2hKS3FMM3pBb1d1?=
 =?utf-8?B?VzR1NEJoTlJwNmlkOUdQRXhVRVJYeG0yVG5FbW4vTzNjUHpNamdoVHp2TjRn?=
 =?utf-8?B?TnB4NjhVMXFNbHMvczNLS1EzaURYUXFLTXRIc2dUUGh1L0ZQRXVnaDdNb1VC?=
 =?utf-8?B?R2Zhb3Z6MGhmTlNaTm54NXl5SDdNZG14UEIxcVJ1SW9nN2FSL0hRbUFxZWdi?=
 =?utf-8?B?TFEzQXhNUmM3WUFlQ2t0WExMOWo2dGpJZEtmNDkyZktFeUk2ZUVoT1FRK000?=
 =?utf-8?B?aEw5OVQrUUFWWVkwZTFrSXRwdW92ay92enYwUGJ2K0R1eG44cGIxVjZSWlhW?=
 =?utf-8?B?UkV5R25qYXpmS1Q2cmVLRmxMUWtLbFRjcjJsM1o0c1F5SzV5Y0FtemtlT09K?=
 =?utf-8?B?eE5FS0kySzVqMzJLQnlxTzlmSmxUeTRXaEI0b01JQ25aYjZtZWRSeEFwY2xs?=
 =?utf-8?B?aWFUSTZBZjhwOWEwakF3YUNUUVBkalhhN28zN3Bkbm8wSEpQRHJCVkRGWGxi?=
 =?utf-8?B?Y2M2cE1VSkE4NmpjYkNRM1IrVlVNYnNGaEx4UEYzaE9PY3p2b0w4QWppR1ZH?=
 =?utf-8?B?VnJaQUVKMGlPTGM2U0FJRy84OStHTVF3cG0vb3dIVGh5UFpzQ250eVdqeXdN?=
 =?utf-8?B?NmhwaHBWY2VidGJsR2lxL0R5cFRiTUVubzloUUEzM3lrQ3RyeEVSVlp4OEZr?=
 =?utf-8?B?dk1meFA1L0FFS3ZSdEVINDkzZ0tDLzhjbTNRMlE5c1ZDdDY1djBjeFN0QjBT?=
 =?utf-8?B?VlZpbk9IUVdzNUJwM3cxYmV3bnUzY2gxbk5QMzI4bFEyWHBxRzBYVFo5U0FC?=
 =?utf-8?B?VTN1UW9oMnlpTmNlZTRneElRbWlNWDM5cDM5UW5TbkwzTmFOTlQ2U2ZNYmtv?=
 =?utf-8?B?UlVCREpDR2E4UHBKT3FjcVJjdUlVVnRMVXpoR1NxVXdvT0hUWmVhVWprMzN2?=
 =?utf-8?B?NUZLeGszd3paM3VXS002b0lhQUJWajhlY0U0c0JTN0N4dHlKYUhnNnBSR3Nh?=
 =?utf-8?B?dVd5ejI2MjlkbkZNZzJXYnBkTWVpbkkyek8rSXpodmVhRkJkUmJ0c0M4M0Jy?=
 =?utf-8?B?UE5McXc4KzYxbzl0VVBlU1RjTW9UTHBKK1N6WHdCYVBxcER2dk8rY0NCeFR6?=
 =?utf-8?B?Z2FFUlU4US9HZXBHNGZNWjdrcmx5MUsvenV3MXI2TEFBYnhDTSsvSVU0Slo1?=
 =?utf-8?Q?a53W6L1QSfQH49R9Hd9qZfXC3?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e64656a-17b1-4fea-897c-08dc97adb902
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2024 20:05:57.1017 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sMGUJrtuPvQLExaTtNdPl3IPUVzq7RGwCTf74XBvukgqhmKZFQlpxR3q+CbKypUtq0kURKqlS80vjFZgqV9CwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7318
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



On 2024-06-26 8:13 p.m., Teres Alexis, Alan Previn wrote:
> 
> Hi Zhanjun, i see you addressed everything i commented on in rev8 as
> well as everything that Michal commented on in rev9 (except one which
> wasnt an issue but was by design).
> 
> Although I still found couple of the issues which are not nits, they
> are very trivial so i'm giving a conditional RB for the comments i
> prefixed with "rb-condition".
> 
> Reviewed-by: Alan Previn <alan.previn.teres.alexis@intel.com>
> 

Thanks, will post next rev as rb-condition suggested.

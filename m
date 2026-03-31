Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 532A2FF60C2
	for <intel-xe@archiver.kernel.org>; Tue, 31 Mar 2026 05:19:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00B3410E15D;
	Tue, 31 Mar 2026 05:19:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZabgNqiD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BD6710E15D
 for <intel-xe@lists.freedesktop.org>; Tue, 31 Mar 2026 05:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774934345; x=1806470345;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7t3er0BuCz6kN65XyB0esjYgrzECalNwGeSDvQuuSOg=;
 b=ZabgNqiDuEVceB7tP3RPmCszeN9nssk747J+YCLTh1Kv2aTLZ1fLASTC
 buVjqSFHDN/3kZHxgiwKUFrkDH+7UN/VUV8lnHIOPrsiXAFFB4nAznmHp
 B+jyy5uCt/cCycOk5Xj7tsWTQML6MsetxahKJ0418Po7/6k7NwaQqv25D
 r33gUSQbOhkj+C6k7rP2PNjGS+kDZMJRzKXTDtdqyooULsK7tjYktUKYT
 YA7GiWD1XUYV4tWfkyDBMU1KZ0vKUmRqOlY/qq078B5FH+4s8F9Nr7rRq
 shnsFHuXl0jicYsZZe3IftR4smdlT2WkpYJ4akWW3ddBCCwFQjihm/jhK Q==;
X-CSE-ConnectionGUID: x3f/elXsRyOqPUZ7KxerAA==
X-CSE-MsgGUID: brpV3s+HRjGNSG8TCm1STA==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="79538187"
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; d="scan'208";a="79538187"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 22:19:05 -0700
X-CSE-ConnectionGUID: Jqd9Vs4MQAemYXuvT7j7jg==
X-CSE-MsgGUID: sQWnaT3WQbaXyRPSfiDktQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; d="scan'208";a="221852240"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 22:19:05 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 30 Mar 2026 22:19:04 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 30 Mar 2026 22:19:04 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.63) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 30 Mar 2026 22:19:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RlRkQPRD0PeHiXoTPumIQFeuoxRvoER/xoFYd2LcKa2A5S33fT5/j1i7R0r+lmLh03+W+GBm+Sp3qNeNzC9JthB7B8/4wT/17iWrVbz2dHSEaj1F8WoJZgjcDQ/plAMseDkGgxQXB1F7WyIF0UTx/SK3vEXqtMIOl6rsNh5ZEJJuhF5efUuV/T24IJxU/iLhSVkQnHEwkXHTuglAUfO9hWtjEk2qh/WYuGloI0ppw4ZiXhEdry88LGM/WWLeRgGvc/BFu0eQF7pSMnQGsclalRjChNMQREf9SwpUY6bsyungSf6zRBSXWb/z8VMoSvq7W/6vvYYM8dyzGekpalC8TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bW4j4BK6F18XxpkFfDiH/579SQGYH9g2/mkM+83z/LI=;
 b=nsnWh4xxWm6RrcI94R4IC4HCY2sxzUxBynVcZWuoPHpAjtB7dIovTFmVwoPHISUXFukWyXPR3NWuPhY8Jc03nG/wLfKDsneWbTc+K6Jh2gmeBlIx/XGwQRgjIGFkPUgejvdW29APO2151y5D9d84f6LIoUF5+3wy7ZB/WfmPSGAEPSGBKgszMF5aAaPiD/oJd3o1tf0DVFSRbupoB1FQUPxTFgB21fTnN1U3Nk3vO1adjlx6jwa/xFh+cZPd3+jypBQz9roxEfjK2cIkqL3dwXrc4MuyuhETZ8esGkBj1QpZ9+Mtx/qviX6tsf1RqHLJpnFmfkTU6JQhIdDSjMowPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 DS4PPFFCBF1B4C7.namprd11.prod.outlook.com (2603:10b6:f:fc02::62) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.10; Tue, 31 Mar
 2026 05:19:00 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%6]) with mapi id 15.20.9769.014; Tue, 31 Mar 2026
 05:19:00 +0000
Message-ID: <9a2443d0-653f-462d-a661-dfa99658d569@intel.com>
Date: Tue, 31 Mar 2026 10:48:52 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/11] drm/xe/xe_pci_error: Implement PCI error
 recovery callbacks
To: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <badal.nilawar@intel.com>,
 <raag.jadav@intel.com>, <ravi.kishore.koppuravuri@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, Matt Roper <matthew.d.roper@intel.com>
References: <20260302102155.4074630-13-riana.tauro@intel.com>
 <20260302102155.4074630-16-riana.tauro@intel.com>
 <8976f5c8-fbc1-4ff3-aaf4-0584185e6cff@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <8976f5c8-fbc1-4ff3-aaf4-0584185e6cff@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0156.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1ac::6) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|DS4PPFFCBF1B4C7:EE_
X-MS-Office365-Filtering-Correlation-Id: fd67fc13-1813-4e87-c8fb-08de8ee50402
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|22082099003|18002099003|56012099003; 
X-Microsoft-Antispam-Message-Info: d5GECYEXz4/cx/KS2Env5jKyHw8VTM8NVfqdgACB20C5dH6wBQ/uSOEUGb9X/tUjQMTnOR8EDj+lh1TonTU0cMugXTTeexEckw279qP8MqUo09zvgRMJcr1hZb6+S5bDoPgRnCtSHUuNFDTMIw+mbhfRrXUZBROdo3x7CZ9xTLW+IkdmHOwEtVBAiRch6q+NxOFiACfK9hj71HMzLDzH7/AsdaxvDLG8cteiKKl+QICJXVvEQhQLq5IwqSM0epzbLOjPcP5xo5q0+9jjWpciD26/ea5FyDTcv/kkb37diKVZ1C3SqMGt63YdV+0nxvXdu/irBQ71o0UHjNoToCytTlN8hMISNXUDExkF6cKxJmMDoKfOKS5GBHazheb55Vv3XjobUAREVkyE40CcYKd5pa3/BZwVPBypZYGUqj5MyJAot6UoU6urdqvcx0p7IvuzAb2SA3XC+EcQYRxomOppjv++Yn9qEeUAkLXadsQAdY+6jJlfxs7sInTEbz7i1oSSYBLnEq1RgLbi+SeeOQDT+B7GGZLvKq5PcMFOmBC4ADiA+cX+SzrRsyf+qdmQmbsXlZVLsyAwDEPcQuhSoDBdjnd159JAC/Sr9PKAWXK8AjorWp+3xG3xilo3gUduoWujmoZI8sPGkqHah1pOuC4CPzRu+NBFIrTT/ie+pr9hDKJbDAz5rmV8fD/kKdiVzG78drc/wP3+jnwR0FPx0LQYOw0R3mi2z3AqGUm5PG8D9PA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WEJEb1A2aU1zWkk0NjQyRCtRVURyYkVHSEFGejBicDU5aVVlS0UzYnNZNnNJ?=
 =?utf-8?B?OSs5SUNzbmxhUERIWEVFb0hBa01rTjhGR2I2cWpoaFFkdjNvWjJ1VHE3QWEy?=
 =?utf-8?B?dndtY2xsTmxsOWhXMG1GTzNBc0s2ZzhVdUZGSlFsbjhGTnhGK3NyVkIrREhO?=
 =?utf-8?B?cEs2NlJJaTdPSEMzYW8wZXdpNFJBRXE5OTNHT1JpRnUxaGRRcldPT3hwZmJx?=
 =?utf-8?B?VU1QYUxrZkRxUGJiK3dkNXpHSHNWU2dKS21XLzJUQzhiaEhBdzRxZEhXeVlO?=
 =?utf-8?B?ODFaMEtWSW5OTksrSFlXMkR6WW1kdnpyRW1iTmdvNngyaU5iYzRMbGg3aFNB?=
 =?utf-8?B?anJaVGNXbmVhQ1NSZm9OMmNQYW9xQy9oV2Y1RzhSRHZ6WW92NGordjIzOUNa?=
 =?utf-8?B?NDhyK3IzYnJHc2FlQ1c0dGp3M2dPS2RyczY3VExveWdKbXc2dm5wMUxRejIz?=
 =?utf-8?B?bmZ5WGpVV3NwazFWWGxKMkN4YTRpZXRsdm5PZ1c0bGVhOFVNNW83SFFtWkNi?=
 =?utf-8?B?ekhhdFJZS1dtOHk2ZS9YbWRaQ0cwTjNKajBUYU9GT1Q1Q0c1Z0NaNnNMZEFa?=
 =?utf-8?B?MnRuamM3WUQ2MDFVd1VSaXFBOEE0MXlCT1RXbFQ3cm1YTndLTENMOExqUWNT?=
 =?utf-8?B?eUhlNHVCY1lqY0pCQlE2NlZaS2RDcG5UZVVOS1UzQ1pZQlRvNlhzd0NhdmJr?=
 =?utf-8?B?Ky9YVVRkOHRyYnc2TnZUcUlmYVNNMlRnUm5zS1ZQL2oveDZ3SVl1R0NWeVdR?=
 =?utf-8?B?RExaNVUxeTZKU0RzdXZPbm9SVGwvNjJVYzY3bVZNY0VGTjY5TVpZVFN3eFp6?=
 =?utf-8?B?QUhwV1lIZDVaRmphWkdFanBnOTV0WURjZmdmcjZrMHBUVm0rQ2ZSTFVRU3FJ?=
 =?utf-8?B?aUVIRVhsdnpFZkFNbnVJbVJsL0FZbUQ4VlZTVWtyRENLQ2U5MDBLaXZTRnEz?=
 =?utf-8?B?dDZhS3R5ZHFTM2JvMGVCbWZoVXNaU1E0SUw4U0hjL1g0d1JLOEtYdTN4UGxG?=
 =?utf-8?B?ODYvQVRkVlQ2ckhkcTNGZU5aYUgvclF0c0thNVRob0ZjSklBbHo1MTlzZmVO?=
 =?utf-8?B?amh5OElUNENjaWFzNFVoQVUyeW1kU2xIRU9TbVlQeGErVFk3NkRNendWcEpi?=
 =?utf-8?B?ZnlHZ1pHOVBUcDNVQ3l3UTZscERlcngzVlo5dTlvbEVnb0hTVW16TC8zZWpH?=
 =?utf-8?B?UTM4UVJBNnJESDBoMXd3YW5Oc055UkFWYzFYb1V3QS84aGsrMHQwdXMvR0pU?=
 =?utf-8?B?Zms4VnVHUUk1TEhITWEzZ01CUFRxcWM5UzdFVXpOb0dWc1QzSmYzZ290UVEv?=
 =?utf-8?B?TVJYb016Mmk5bXNPY2NrZm9GUUZaekN6RmdhOS9pcjhzcmxvTjYzZnhlNm9S?=
 =?utf-8?B?aE5oSTRhWUoyMUtHcVUyNUVndUJibG1WcktyV25mcGJZUFZmeUgxVmxtRnhO?=
 =?utf-8?B?YlhxT0N0ZC9WQzUvcGdGMmNBeGpvMG1XMWNyZURoVVdzM3VIam5xdE1tVHl3?=
 =?utf-8?B?bldJQU5oaEN0S2tUOTlPeW00SDVsbUFyUG1RRTVaYTFibHhhSVo0TVFPMHFV?=
 =?utf-8?B?dHVBc1ZvQVZDMHJmdk1sdmdvUkI2Nnh2YW1jZllaN3JTOFZheWF4MnhXNXRn?=
 =?utf-8?B?eGhVMWtTTXJOQnJ6RTVsbnpWVWpjc3FrWm1hMTdRTnh3RGlCdXYrbzdWNnVm?=
 =?utf-8?B?aW9lNFJiWjRjcGJ4RS9WenhWU1ZWN09rNTFqNmZjcjUvdXdrZnRyS1NhN1Yy?=
 =?utf-8?B?TmpPNkQxVXA0VEhGU2dpUVpOUjdwVGtzKzlVbGJ3VGZFUTZlR2dzTVhaTUtt?=
 =?utf-8?B?L3VESzlFYkQ1SWtDNzIzZXZuOVRjSHAvVlo3K0NCSTJwZ0M5Z004UkU1aEsz?=
 =?utf-8?B?SHN0ekkvL3FlbXd1aTJ6UGVyL2VxdFJrSmJXcTFZcEFsRG01bHpwNWk4cDdW?=
 =?utf-8?B?R0dVR3hYa2lPV0NSZkt1L1FRSHFDNXVTVEV2SmRLY0tBTGVkQlkrNEpWSng2?=
 =?utf-8?B?dVRyQUlPbFBOYW1aWlpyV1VVamptVEtiamRPdG81Z2hoNmFWZ0cvZHJWV0Rv?=
 =?utf-8?B?WGdoZFZZbkdUTEh5Wkwzcm5KdEdsc1V6dndVbG9XeVNDYjBwUGxnOGJDVk9l?=
 =?utf-8?B?QU9VNnMrNURSS3VrelB4RFRJbmI4d3FIcmR4dU9OUU9HSXRuWjByNGlWRnBU?=
 =?utf-8?B?Q0ZWeFdEUkRsd0JGNGtqLzkrR0dyUktyWDM2VHl0YUYrcnM4d0pBeUFmQ1p4?=
 =?utf-8?B?azVCYU16MmpTQ3R6a3F0MzlKTEVzVjM5UkRWRXN3NG82WDlUMVhSZGwxVXBx?=
 =?utf-8?B?UXZWL2M3KzlJZHdEVzZoRlJMVWFONG1pL2l6Zi9CZnZmOCtmUENsdz09?=
X-Exchange-RoutingPolicyChecked: cdgMpkD8SEXWRqOWUjz3yWbq2Akb7ikFMnfrSz5N/q+wpa61aC6F5go4kke6+ybgcFoFt+V65jBFyhkImQ9u30L/+S7xV+7CNDyKdAJ5G7KMv3WgnRy8uDb9cj2S/xBuosCtdGkRf/KurjUt4Igo3YJ0ONXOp1MHBc/WPPMSKfnLKrLLNiIsTFzoWJoeLpoIz0p2xBbuC0pvnY2CgBeDCuBCJZTwyaV7QgtDzefer6mQ6YEPgg61DCvds+9YPyzdzXkNF4Cb3vNAdF5/Gus+A228brS7pypJllgOBPnlyfqbuf2GWwHOAahU4/urvKlt0tDA9KIGu5rfK9yQI9tu7A==
X-MS-Exchange-CrossTenant-Network-Message-Id: fd67fc13-1813-4e87-c8fb-08de8ee50402
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2026 05:19:00.1882 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 80dOgth3m3Onzw7oBF/iT2mu+5Et9LBvYDZaa9O39lNFPuxIwOlEAGWL4j0MHkXZrXaxEB+138zpBCjjVs+50Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFFCBF1B4C7
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


On 3/4/2026 4:08 PM, Mallesh, Koujalagi wrote:
>
> On 02-03-2026 03:51 pm, Riana Tauro wrote:
>> Add error_detected, mmio_enabled, slot_reset and resume
>> recovery callbacks to handle PCIe Advanced Error Reporting
>> (AER) errors.
>>
>> For fatal errors, the device is wedged and becomes
>> inaccessible. Return PCI_ERS_RESULT_SLOT_RESET from
>> error_detected to request a Secondary Bus Reset (SBR).
>>
>> For non-fatal errors, return PCI_ERS_RESULT_CAN_RECOVER from
>> error_detected to trigger the mmio_enabled callback. In this callback,
>> the device is queried to determine the error cause and attempt
>> recovery based on the error type.
>>
>> Once the secondary bus reset(SBR) is completed the slot_reset callback
>> cleanly removes and reprobe the device to restore functionality.
>>
>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Matt Roper <matthew.d.roper@intel.com>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>> v2: re-order linux headers
>>      reword error messages
>>      do not clear in_recovery after remove
>>      return PCI_ERS_RESULT_DISCONNECT if probe fails (Michal)
>>      only wedge device do not send uevent (Raag)
>>      set recovery flag in error_detected and clear on resume
>>      add default switch case (Mallesh)
>> ---
>>   drivers/gpu/drm/xe/Makefile          |  1 +
>>   drivers/gpu/drm/xe/xe_device.h       | 15 +++++
>>   drivers/gpu/drm/xe/xe_device_types.h |  3 +
>>   drivers/gpu/drm/xe/xe_pci.c          |  3 +
>>   drivers/gpu/drm/xe/xe_pci_error.c    | 99 ++++++++++++++++++++++++++++
>>   5 files changed, 121 insertions(+)
>>   create mode 100644 drivers/gpu/drm/xe/xe_pci_error.c
>>
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index 1890bbd1b28d..417b030e5ce7 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -99,6 +99,7 @@ xe-y += xe_bb.o \
>>       xe_page_reclaim.o \
>>       xe_pat.o \
>>       xe_pci.o \
>> +    xe_pci_error.o \
>>       xe_pci_rebar.o \
>>       xe_pcode.o \
>>       xe_pm.o \
>> diff --git a/drivers/gpu/drm/xe/xe_device.h 
>> b/drivers/gpu/drm/xe/xe_device.h
>> index 39464650533b..972f43d20f1a 100644
>> --- a/drivers/gpu/drm/xe/xe_device.h
>> +++ b/drivers/gpu/drm/xe/xe_device.h
>> @@ -43,6 +43,21 @@ static inline struct xe_device 
>> *ttm_to_xe_device(struct ttm_device *ttm)
>>       return container_of(ttm, struct xe_device, ttm);
>>   }
>>   +static inline bool xe_device_is_in_recovery(struct xe_device *xe)
>> +{
>> +    return atomic_read(&xe->in_recovery);
>> +}
>> +
>> +static inline void xe_device_set_in_recovery(struct xe_device *xe)
>> +{
>> +    atomic_set(&xe->in_recovery, 1);
>> +}
>> +
>> +static inline void xe_device_clear_in_recovery(struct xe_device *xe)
>> +{
>> +     atomic_set(&xe->in_recovery, 0);
>> +}
>> +
>>   struct xe_device *xe_device_create(struct pci_dev *pdev,
>>                      const struct pci_device_id *ent);
>>   int xe_device_probe_early(struct xe_device *xe);
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h 
>> b/drivers/gpu/drm/xe/xe_device_types.h
>> index 5599534384fa..616d74792902 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -504,6 +504,9 @@ struct xe_device {
>>           bool inconsistent_reset;
>>       } wedged;
>>   +    /** @in_recovery: Indicates if device is in recovery */
>> +    atomic_t in_recovery;
>> +
>>       /** @bo_device: Struct to control async free of BOs */
>>       struct xe_bo_dev {
>>           /** @bo_device.async_free: Free worker */
>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>> index ad1e5ef2ee89..825489287f28 100644
>> --- a/drivers/gpu/drm/xe/xe_pci.c
>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>> @@ -1313,6 +1313,8 @@ static const struct dev_pm_ops xe_pm_ops = {
>>   };
>>   #endif
>>   +extern const struct pci_error_handlers xe_pci_error_handlers;
>> +
>>   static struct pci_driver xe_pci_driver = {
>>       .name = DRIVER_NAME,
>>       .id_table = pciidlist,
>> @@ -1320,6 +1322,7 @@ static struct pci_driver xe_pci_driver = {
>>       .remove = xe_pci_remove,
>>       .shutdown = xe_pci_shutdown,
>>       .sriov_configure = xe_pci_sriov_configure,
>> +    .err_handler = &xe_pci_error_handlers,
>>   #ifdef CONFIG_PM_SLEEP
>>       .driver.pm = &xe_pm_ops,
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_pci_error.c 
>> b/drivers/gpu/drm/xe/xe_pci_error.c
>> new file mode 100644
>> index 000000000000..d4896a4a5014
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_pci_error.c
>> @@ -0,0 +1,99 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2026 Intel Corporation
>> + */
>> +#include <linux/pci.h>
>> +
>> +#include <drm/drm_drv.h>
>> +
>> +#include "xe_device.h"
>> +#include "xe_gt.h"
>> +#include "xe_pci.h"
>> +#include "xe_uc.h"
>> +
>> +static void xe_pci_error_handling(struct pci_dev *pdev)
>> +{
>> +    struct xe_device *xe = pdev_to_xe_device(pdev);
>> +    struct xe_gt *gt;
>> +    u8 id;
>> +
> What is behavior when wedged mode is XE_WEDGED_MODE_NEVER and PCI 
> error occurred.

Even then to attempt a slot reset, we need to stop all ioctls and job 
submissions. Here we are reusing
the wedged flag to do the same.  We are not asking the userspace to 
recover so should be fine.
My intention was to re-use the wedged flag instead of using in_recovery 
everywhere.

>> +    /* Wedge the device to prevent userspace access but don't send 
>> the event yet */
>> +    atomic_set(&xe->wedged.flag, 1);
>> +
>> +    for_each_gt(gt, xe, id)
>> +        xe_gt_declare_wedged(gt);
>> +
>> +    pci_disable_device(pdev);
>> +}
>> +
>> +static pci_ers_result_t xe_pci_error_detected(struct pci_dev *pdev, 
>> pci_channel_state_t state)
>> +{
>> +    struct xe_device *xe = pdev_to_xe_device(pdev);
>> +
>> +    dev_err(&pdev->dev, "Xe Pci error recovery: error detected state 
>> %d\n", state);
>> +
>> +    xe_device_set_in_recovery(xe);
>> +
>> +    switch (state) {
>> +    case pci_channel_io_normal:
>> +        return PCI_ERS_RESULT_CAN_RECOVER;
>> +    case pci_channel_io_frozen:
>> +        xe_pci_error_handling(pdev);
>> +        return PCI_ERS_RESULT_NEED_RESET;
>> +    case pci_channel_io_perm_failure:
>
> Clear in_recovery flag before disconnect, dead/unusable device should 
> not appear to be recovering.
>
> in_recovery flag still set that suggest recovery is actively happening. 

Agree, last rev this was proper and in_recovery was added only before 
attempting a slot reset.
Will either move it back or return if state is disconnect.

Reverting to previous revision would make more sense here since we are 
using in_recovery
during job timeouts and gt resets when device is wedged.

Thanks
Riana

>
> Thanks
>
> -/Mallesh
>
>> +        return PCI_ERS_RESULT_DISCONNECT;
>> +    default:
>> +        dev_err(&pdev->dev, "Unknown state %d\n", state);
>> +        return PCI_ERS_RESULT_NEED_RESET;
>> +    }
>> +}
>> +
>> +static pci_ers_result_t xe_pci_error_mmio_enabled(struct pci_dev *pdev)
>> +{
>> +    dev_err(&pdev->dev, "Xe Pci error recovery: MMIO enabled\n");
>> +
>> +    return PCI_ERS_RESULT_NEED_RESET;
>> +}
>> +
>> +static pci_ers_result_t xe_pci_error_slot_reset(struct pci_dev *pdev)
>> +{
>> +    const struct pci_device_id *ent = 
>> pci_match_id(pdev->driver->id_table, pdev);
>> +    struct xe_device *xe = pdev_to_xe_device(pdev);
>> +
>> +    dev_err(&pdev->dev, "Xe Pci error recovery: Slot reset\n");
>> +
>> +    pci_restore_state(pdev);
>> +
>> +    if (pci_enable_device(pdev)) {
>> +        dev_err(&pdev->dev,
>> +            "Cannot re-enable PCI device after reset\n");
>> +        return PCI_ERS_RESULT_DISCONNECT;
>> +    }
>> +
>> +    /*
>> +     * Secondary Bus Reset wipes out all device memory
>> +     * requiring XE KMD to perform a device removal and reprobe.
>> +     */
>> +    pdev->driver->remove(pdev);
>> +
>> +    if (!pdev->driver->probe(pdev, ent))
>> +        return PCI_ERS_RESULT_RECOVERED;
>> +
>> +    return PCI_ERS_RESULT_DISCONNECT;
>> +}
>> +
>> +static void xe_pci_error_resume(struct pci_dev *pdev)
>> +{
>> +    struct xe_device *xe = pdev_to_xe_device(pdev);
>> +
>> +    dev_info(&pdev->dev, "Xe Pci error recovery: Recovered\n");
>> +
>> +    xe_device_clear_in_recovery(xe);
>> +}
>> +
>> +const struct pci_error_handlers xe_pci_error_handlers = {
>> +    .error_detected    = xe_pci_error_detected,
>> +    .mmio_enabled    = xe_pci_error_mmio_enabled,
>> +    .slot_reset    = xe_pci_error_slot_reset,
>> +    .resume        = xe_pci_error_resume,
>> +};

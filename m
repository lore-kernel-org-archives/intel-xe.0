Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ADC8D41D6B
	for <intel-xe@archiver.kernel.org>; Thu, 11 Dec 2025 17:32:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAD3410E28C;
	Thu, 11 Dec 2025 17:32:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k+Mlb/jB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84A8210E28C
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Dec 2025 17:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765474343; x=1797010343;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Fjsw28lymOVoY+drdLukG0GpDt/qNYKO1AsWU5wtK80=;
 b=k+Mlb/jBm/dDgaY/iYWIoVCQqTsA1Zr6N5D+g285GI6dl+EukquNEmU9
 dM0W8gclk9YzuIEg1snFO5K3DQcMiSjmhbny/BMGZhV/hqowdw38EvtPM
 tqUobvRY+DHuc3N0jCBGoPyvab7v32fP6B7A5O4fzM4RDNdLNesmCvYYv
 7bzIbKyAaND/g+tyPAVstQCa1jLRmK72JQABng9rZqtNnIGWdnhr4nzLF
 +vD4m/36srZCukNmTd1kt+pEti1iRIJQhDhQXj6IXOXoD7WXdcAGjoPjX
 VceYsjFGofdkpIGwIeSFUgXsFcAvcL1g6m98ul9yqflWtye6zkOGtDUtP g==;
X-CSE-ConnectionGUID: er7MBwDMQ+SGA4bO+UPDAw==
X-CSE-MsgGUID: BnkaQSoOQ8WADXoQ5f5SVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="85071981"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; d="scan'208";a="85071981"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 09:32:22 -0800
X-CSE-ConnectionGUID: gHhHO4K8T4C8ujTRP28R+w==
X-CSE-MsgGUID: TW/EJpBYQaK1TOMZs/H/1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; d="scan'208";a="195938623"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 09:32:22 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 11 Dec 2025 09:32:21 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 11 Dec 2025 09:32:21 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.29) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 11 Dec 2025 09:32:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cXlSFVOisqy/5MGO0VA0+coWoGugvkHgJhpRkrRAwK4cOENeiIfXAJNOZVhJIzvQxNYh9kwf4zuGRYxIREhoi3TY4QtRcdxorzES1ZtfayDX5FfRhNKyUecQ8aaZfzt6xG7g9oIeKYxEFeDDhxu0NEzSCjpV6A6ozqvgruwjeSjvZhlhtk1pC5tRMNkkzXhEZr8VoDATIGDx00jSoD6OUkjoE/Q9VRJy5DNzubn4+hi+uF6KlSsuK8949L2zzqdnsxJmrcpVOdZyPDvJxqHp8ib5jHES2vwBN935XujW8dzHyv7YzeknCUKlN4p13aMYEa+Ec0bPsv7F3m3p1/ir+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IiD19SDtXLMa3vKCZg7eGp2bkH602bwzSmaxVLK+Hqk=;
 b=Y8gktQy75Oi9eudy2sNbvQ1+B25wuHg+dc1FGq2rlWtnCkmvwlWWG0ebP/SA48Z/h9z2c3NYU68HbMp6ATSEsGlkT3qXYGlrUire1aWr2yeAwrnpXAUIxIYcHl3ryum93QRIqbik1IgD52Ls1gwad7jonbdWDB44nObCDZFDHUEfCUMTJQZn/0UHdXEhdVYMDyFZ//6Fb4UaJZ++2wkDNRbTCTEobSzFuaXOnKsJYPauPhfG6T7zrMseU7LRsZVhsNntWwaRgDIJpQmG5RS0ZjHFgyhY7bpdf3s4Sy/3Iaata1Dg6q8/kWpDkDHce1Io6v+4/G0s4sl7p0Efa9JX4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by SA1PR11MB8595.namprd11.prod.outlook.com (2603:10b6:806:3a9::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.10; Thu, 11 Dec
 2025 17:32:17 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%4]) with mapi id 15.20.9412.005; Thu, 11 Dec 2025
 17:32:17 +0000
Message-ID: <6b386ee7-fae8-4c22-8f97-48a03ccacc75@intel.com>
Date: Thu, 11 Dec 2025 23:02:10 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] drm/xe/hwmon: Expose memory controller temperature
To: Karthik Poosa <karthik.poosa@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <raag.jadav@intel.com>, <riana.tauro@intel.com>
References: <20251210062301.4080549-1-karthik.poosa@intel.com>
 <20251210062301.4080549-6-karthik.poosa@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20251210062301.4080549-6-karthik.poosa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0145.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d7::15) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|SA1PR11MB8595:EE_
X-MS-Office365-Filtering-Correlation-Id: 9526d8da-df1a-489e-7f94-08de38db3ae0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?endnZTNBM1RKU05OZEx5d21FRkhzU0orUXpKNENuZ1JJamNZMW5ZSDJFYlYy?=
 =?utf-8?B?eHFkNVZ4enRseE9KeGwxOXpNWmFiVE15V0t0Z2dDRHVlaEtUMVBpM2ZpL1Vo?=
 =?utf-8?B?Sm54Rjkwc2tQaythMUxvVmE1OUVhbENhMmE2QmMrWTh0LzhJbXFnYkpkU3p3?=
 =?utf-8?B?OG9YQUZLRzdHWStQQ2Rvb01uMTV6NUw5TTNqcDNTMG5nUWFzTnZkM1lJQXE2?=
 =?utf-8?B?ZC9QOTJoTE5pOW1pTGh0RXhZUlBFU2hwcWxkSnR5Q0tPdDJoNGFIeDF0ZlZK?=
 =?utf-8?B?WHNrZG9IQ2RBU052K3VFa20xQzNQczEvVHZUQng5bVFuUFhTVTd4ZjJvMlBV?=
 =?utf-8?B?SFhycGJKMksxRFJRdmJHc285aVF3SldWK2VHei9pTXZaY0RHVkcxL1p4ZURL?=
 =?utf-8?B?RUFHVjJZc0doM0JJWElqN1o0SXRaWDlNUW5RanlEUURaVWxLRUM3ZDhOcUJO?=
 =?utf-8?B?T1d4cDlNbCtiaVNvWXUwUFgyQXZhT3Q4NnZJUElnU3ZZRTJzaGtvNHJJUHRE?=
 =?utf-8?B?Yk9JRWNxRTZoTFp5RGxoeUFBT0lOSVFkY2x0L0VjVVhWWkMxRXMwTFhNeVJT?=
 =?utf-8?B?R1YvRGF1ZXVFRXpKZkMxSi9yK0V2WXRVR3NxZmk3N0RJWXpYRGxNS1I0R3ky?=
 =?utf-8?B?a3YzbDVIbDdISlNTM1ZTNHlDZGRKTEhuc083b1lsSWlyVXd5aVhmeWZNNzVh?=
 =?utf-8?B?VFc0MjEybVQrc1E1RUE1Y3k0YXVOUThzRkxZMkdySlIwUFhiSWJab1pmcHph?=
 =?utf-8?B?dG9naVMyc25HVmp2bUtKNXZZS295SjhuRmZ2c1ptaTRoUUdIZGRWc003U1BC?=
 =?utf-8?B?TXpEckNzL1RuNmlpR1hKa0phdEZZelAxZ2FOOGc1UXVHZVYrdFlvVlBKS1Fu?=
 =?utf-8?B?ekpmTmdIemZOd3ZPWGExcklxeTBPa0VITGtHN0dOR1crNkNjVzhmNmpReWdV?=
 =?utf-8?B?SnJ5NDluRW1mSEVRUWZMZXg1QXBIdTQ4bkkwVmNEWE1jZDdQWDF4VGIrRndD?=
 =?utf-8?B?Uy8wUGtPNWpvemxWSjNtQmxYaWxkT210b29TaG04aXo5M2dyZzRDMnlIM2Jp?=
 =?utf-8?B?VUptV2huQTVlWmYrVzY1N2RldnhFSnJYUWpPcG11RTFoajNLbFRvQlFMdkE2?=
 =?utf-8?B?R3Q3M2xBdW12aERvQ0ZNdlhqeXJJMGVRWDN1MjQ2OWRCMkg5SThGOE1DNG01?=
 =?utf-8?B?THRBU3VKN0JTWEVXcXovbFJWc1RudFR3TVp1L0k2d3NmYUZodXFadlVWVVhx?=
 =?utf-8?B?U2lvSGJOTW12L0ZxcEhOOEtOVnVGN1I2Q3Rhcm1PRi9EUW5iZ2xZc0hHNzk2?=
 =?utf-8?B?NnBUUkZPMndDcnBodWdjaHVPbTZrVEczaEdLL0lVWGxiTW5WdUEzVmNXa3ht?=
 =?utf-8?B?c0doOVZUZVFqd2RHZURWdUNBWnpabDJUeVVNNktOZjBnenorckl5Z0lTUTF5?=
 =?utf-8?B?L2hLMUxIdkdWMzN5anBTYWxoYlJ1RHN2a1JmTFJMVHM5VThYNU9tUDQwczI4?=
 =?utf-8?B?SUgvcUYydENqTWYzR2R1VHdSZ2VOeFVEdUlkS3ByMmgzbEthSytWaG1nU3Ra?=
 =?utf-8?B?Y1dlR2NsV3RZSFY1aC9rRXJ6RStaNXB4a3dxM1pWM0Fma3VWNUVmbDZFT3VH?=
 =?utf-8?B?dzNhdW45R29oaldNR0diOWl1cExQcC96T3NpcExpbndhbXhXWEQ5dUF4N2RL?=
 =?utf-8?B?OVg3dFZlSDQ5WndEcDRZYkZoOEpkYi9mZDRGamhwaldlbTRMNjRXdUNPb2NI?=
 =?utf-8?B?TTBobkx1VlliV2o5MVZQdFBKT3lzclIrbWNSTElMbWVXUEV6TWtJdTRiL3Jv?=
 =?utf-8?B?TGpWTnliaktUWGFsT3RQeW9vWDNMenZUSDVWc1I3TlplWjlQYUVzRFNlRXVF?=
 =?utf-8?B?ZDdCSEY4VGJaRk5JVDkrY0dZWnZPYXJ4SDVTaHhTY1pydmJ5OVRLd1ZISEpz?=
 =?utf-8?Q?WCyU8bw/ZRtHdLXvMy7J1r35PsuOtTCg?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RVh2NUY3aUtiWnFGOFVNbElzRUVyMVVqaWpubjdrMERiZDcxL0EvUENMUno3?=
 =?utf-8?B?RXhZdXh4NEZDdW1nZkt4MmRFeEEyQlhaR0NxeWdHZ2wwaVRGOXZTUEc2NjNL?=
 =?utf-8?B?UGFQNUNNWDF1WmNsNW5UQTdrZXp1V20zdUc5V0czbkRzQzc1amN2c085aFRU?=
 =?utf-8?B?ZnZEbDl5WStwQStZcFlDNk1xS0hpaEEzSGttSHFEa3hxYWl6T1FqL25KZTBm?=
 =?utf-8?B?TDd3aWtrblpzTjFhcTdhUUlDdTV2VmY1QldOT2lnSDZYb2RxOXZPRHErTlFU?=
 =?utf-8?B?ZitPNjRKTWEraFY5T3REMjY5QW10bFRqcWJRQ3pMNVBmdnVWZnFCcFlLa1hE?=
 =?utf-8?B?Q2F4M2tBdENIU0hpNjdvOFZlUnp1L3JEMjR0YWF0WFQ5R1JxU21JcWlyNHFI?=
 =?utf-8?B?a0xjQVl4eHY4S3NlazlYOGVnbW1JemR4aEhZS3o1YVJ5djgwZmJFU2lmcUt2?=
 =?utf-8?B?NmFQNFJnbHJ2enR1d2xndWVrc1NnbTBnZjFvK0R5M0tzUzN4TW8vSmczSVp4?=
 =?utf-8?B?eENrUVNEd0Nod2hRQVhJNDFWZFlxWlB2NDJoWm4xRTBQSUpDTDd3VU1QUmZ2?=
 =?utf-8?B?MGt6RVprVFYzWkZYYzZmcEFnRDNsNG90SWJOTVhEUTlPL0lMQzdoWVZuWjBL?=
 =?utf-8?B?ZG9HY0dWb2RlbXpKUEVHWktlR0hHbjVHOEppMG9EbnAyTG9HaFZEYlBlWUh1?=
 =?utf-8?B?dEZtWmJOaVNmVG5NdkdscnJBbnVaUWsvYUd2UmFzbEdpcm9kZk1iYWJJZ25o?=
 =?utf-8?B?YmI5K1Fzejl2L2tqd3Q0Q3JQMlBsTjBSYkI5UDZZWk5uOWs4YVlDZ3J2ckow?=
 =?utf-8?B?TnVCZklGR1hGQ3F5WFdWRTJ6K3VwRkhLelJlV2RBSTlkZVcrbTh2WnR1ekJK?=
 =?utf-8?B?dHNaU3lZTXVjR1N0Z01oSWEvNFB3Z2xHQXVIMmcwd0dWdmZKKzlPdDRtMXc1?=
 =?utf-8?B?T3pQRW11MHROQXVzaFNNeGxoTGptQW1GOTNFVzBGVVhpMEZyT1g3ZzVKenlo?=
 =?utf-8?B?L2lpRHRaMCtabVMxSXV4bGRLbUpBMDNBYjRzSFNZajQxZ3FudXcyQkplUDR2?=
 =?utf-8?B?TWs3ZVllbjdpZFltVWFmcXM2Z2Q3RDBiOW40YkY3cFlEUWhjUW9yanpjMU5p?=
 =?utf-8?B?SWtYL0gvMGwwS3YyRkExcHVUdGQ3Rlc4SzZpQ1puRW12RmNVT2Y2TDFOeTdX?=
 =?utf-8?B?RU43MmJIaHRKbzlSSVQrWlE1cXloaGRlMllxdnFmSWJ5ZW5QOWU2N2NtUThv?=
 =?utf-8?B?WmIvbmg0ZWRFdTd3aDdxaCtkL2Zlc3M4RlNoNi9EWURmNXJueDd0UFEwcEVI?=
 =?utf-8?B?UnNrSzlWdHU0VzVPSTk5dXRmYVJvamcwYTZrNGcxd1JSdXVpWEZoUzRtZzI1?=
 =?utf-8?B?WnFvQ2NRY2NQT0ZlNDh6VWdHWFBLWmlUNkRiUHdKeDNPWFdqeUpjaGV0SWJj?=
 =?utf-8?B?cExLOFNPcFhoQ0luSzdBenFuMXV2dlhveDYvcktoMW53SHNSREhDUnJjUWFP?=
 =?utf-8?B?TjRGaHVXRlpkYTR2bWF3ZTVqdzMzWGRsTjU3VERTT1NMMG11V01BNUorV3kw?=
 =?utf-8?B?QVBJT2QrT1U1WER5dnkyNURuSDJHTWFlb0JrRmFPczZpSzAwdE9EMTk2b0U4?=
 =?utf-8?B?ODkxQ20yWkpYeTdUeGZJbGVPcEJhTXVybTFSYnVkVEo2VWp6bm1iNWg3VDN6?=
 =?utf-8?B?ZkthTzRTcjhnV0Vrb2FjWUFkbFByQmZvMUd3bGpXVEI0UUdHb2NZb1l1UUhw?=
 =?utf-8?B?UWQ4bFVkcHgyNHJYNWZ4TDd1aG05c1RXOTkzSllvYXZTSDZaN2tGWXk5bnlF?=
 =?utf-8?B?OU9aK1NDdEJwZUZDZUNnd045ZUZ0Q0R5d2dSU2IzOURnamxHV2hsWGpzQk85?=
 =?utf-8?B?MkVKL2tTYWlXYTdFdWtGVXBWVnJPUG5mZ05wT2dINFkvODI1b3Y3YjgvOU1S?=
 =?utf-8?B?UXF4V1o4OGhjU29QVTNSMCtwVmN6V0dkUGJWaDg2WVFWd3NpVDFGMS91NG5E?=
 =?utf-8?B?M0FPNHBPUDhRV1czMjlseXpvZHRrTUpwcVoxdTdWcUhNeUc5RENvNmVpS2g2?=
 =?utf-8?B?RVpBNUFoVm1GUzZwODRHM1RvQ3N0c3FleEFpYzRPTU1MVmZrU1N5RWNPOWMy?=
 =?utf-8?B?dk5za3RlclRTRnhJN2xkVEFZK3ZWb1FpdW9DYzhNaHpSSVFjZGc4ZFlUeURO?=
 =?utf-8?B?NFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9526d8da-df1a-489e-7f94-08de38db3ae0
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 17:32:17.1409 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J99dO0q9+X5snAoHWYiqIi0LWHnvtR2tDBt3RYcHjDx9L0Yq+dApxL7SErkB76xdcRQjRhggJwKATn6A7s7TYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8595
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


On 10-12-2025 11:52, Karthik Poosa wrote:
> Expose GPU memory controller temperatures under temp4_xxx.
> Update Xe hwmon documentation for this.
>
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> ---
>   .../ABI/testing/sysfs-driver-intel-xe-hwmon   | 24 +++++++
>   drivers/gpu/drm/xe/xe_hwmon.c                 | 68 ++++++++++++++++++-
>   drivers/gpu/drm/xe/xe_pcode_api.h             |  2 +
>   3 files changed, 93 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> index 60bc71ce9951..7e1765312696 100644
> --- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> @@ -228,3 +228,27 @@ Contact:	intel-xe@lists.freedesktop.org
>   Description:	RO. VRAM critical temperature in millidegree Celsius.
>   
>   		Only supported for particular Intel Xe graphics platforms.
> +
> +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp4_input
> +Date:		December 2025
> +KernelVersion:	6.18
> +Contact:	intel-xe@lists.freedesktop.org
> +Description:	RO. Memory controller average temperature in millidegree Celsius.
> +
> +		Only supported for particular Intel Xe graphics platforms.
> +
> +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp4_emergency
> +Date:		December 2025
> +KernelVersion:	6.18
> +Contact:	intel-xe@lists.freedesktop.org
> +Description:	RO. Memory controller shutodwn temperature in millidegree Celsius.
> +
> +		Only supported for particular Intel Xe graphics platforms.
> +
> +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp4_crit
> +Date:		December 2025
> +KernelVersion:	6.18
> +Contact:	intel-xe@lists.freedesktop.org
> +Description:	RO. Memory controller critical temperature in millidegree Celsius.
> +
> +		Only supported for particular Intel Xe graphics platforms.
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index e843021d13ec..783f6e40847c 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -43,6 +43,7 @@ enum xe_hwmon_channel {
>   	CHANNEL_CARD,
>   	CHANNEL_PKG,
>   	CHANNEL_VRAM,
> +	CHANNEL_MCTRL,
>   	CHANNEL_MAX,
>   };
>   
> @@ -136,6 +137,8 @@ struct xe_hwmon_thermal_info {
>   	};
>   	/** @count: no of temperature sensors */
>   	u8 count;
> +	/** @value: value from each sensors S1.7 format. */
> +	u8 value[MAX_THERMAL_SENSORS];
>   };
>   
>   /**
> @@ -708,6 +711,7 @@ static const struct hwmon_channel_info * const hwmon_info[] = {
>   	HWMON_CHANNEL_INFO(temp,
>   			   HWMON_T_LABEL,
>   			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY | HWMON_T_CRIT,
> +			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY | HWMON_T_CRIT,
>   			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY | HWMON_T_CRIT),
>   	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_LABEL | HWMON_P_CRIT |
>   			   HWMON_P_CAP,
> @@ -747,7 +751,38 @@ static int xe_hwmon_pcode_read_thermal_info(struct xe_hwmon *hwmon)
>   	if (hwmon->temp.count > MAX_THERMAL_SENSORS)
>   		drm_warn(&hwmon->xe->drm, "thermal config count %d exceeds supported limit %d\n",
>   			 hwmon->temp.count, MAX_THERMAL_SENSORS);
> +	return 0;
> +}
>   
> +static int get_mc_temp(struct xe_hwmon *hwmon, long *val)
> +{
> +	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
> +	int ret = 0, i = 0;
> +
> +	for (i = 0; i < (hwmon->temp.count / 4); i++) {
> +		/* Read thermal data */
> +		ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_THERMAL_INFO, READ_THERMAL_DATA, i),
> +				    (uint32_t *)&hwmon->temp.value[i * 4], NULL);
> +		drm_dbg(&hwmon->xe->drm, "thermal data for group %d ret %d, val 0x%x\n", i, ret,
> +			(u32)hwmon->temp.value[i * 4]);
> +		if (ret)
> +			return ret;
> +	}
> +	if (hwmon->temp.count % 4) {
> +		ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_THERMAL_INFO, READ_THERMAL_DATA, i),
> +				    (uint32_t *)&hwmon->temp.value[i * 4], NULL);
> +		drm_dbg(&hwmon->xe->drm, "thermal data for group %d ret %d, val 0x%x\n", i, ret,
> +			(u32)hwmon->temp.value[i * 4]);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	*val = 0;
> +	for (i = TEMP_INDEX_MCTRL; i < hwmon->temp.count; i++) {
> +		*val += (hwmon->temp.value[i] & TEMP_MASK_MAILBOX) *
> +			((hwmon->temp.value[i] & 0x80) ? -1 : 1);
> +	}
> +	*val = (*val / hwmon->temp.count) * MILLIDEGREE_PER_DEGREE;

Please describe in commit message that temp exposed is avg of all memory 
controllers.

Thanks,
Badal

>   	return 0;
>   }
>   
> @@ -848,6 +883,8 @@ static void xe_hwmon_get_voltage(struct xe_hwmon *hwmon, int channel, long *valu
>   static umode_t
>   xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>   {
> +	long val = 0;
> +
>   	switch (attr) {
>   	case hwmon_temp_emergency:
>   		switch (channel) {
> @@ -855,6 +892,8 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>   			return hwmon->temp.limit[TEMP_LIMIT_PKG_SHUTDOWN] ? 0444 : 0;
>   		case CHANNEL_VRAM:
>   			return hwmon->temp.limit[TEMP_LIMIT_MEM_SHUTDOWN] ? 0444 : 0;
> +		case CHANNEL_MCTRL:
> +			return (!get_mc_temp(hwmon, &val)) ? 0444 : 0;
>   		default:
>   			return 0;
>   		}
> @@ -865,13 +904,25 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>   			return hwmon->temp.limit[TEMP_LIMIT_PKG_TJMAX] ? 0444 : 0;
>   		case CHANNEL_VRAM:
>   			return hwmon->temp.limit[TEMP_LIMIT_MEM_TJMAX] ? 0444 : 0;
> +		case CHANNEL_MCTRL:
> +			return (!get_mc_temp(hwmon, &val)) ? 0444 : 0;
>   		default:
>   			return 0;
>   		}
>   		break;
>   	case hwmon_temp_input:
>   	case hwmon_temp_label:
> -		return xe_reg_is_valid(xe_hwmon_get_reg(hwmon, REG_TEMP, channel)) ? 0444 : 0;
> +		switch (channel) {
> +		case CHANNEL_PKG:
> +		case CHANNEL_VRAM:
> +			return xe_reg_is_valid(xe_hwmon_get_reg(hwmon, REG_TEMP,
> +								channel)) ? 0444 : 0;
> +		case CHANNEL_MCTRL:
> +			return (!get_mc_temp(hwmon, &val)) ? 0444 : 0;
> +		default:
> +			return 0;
> +		}
> +		break;
>   	default:
>   		return 0;
>   	}
> @@ -885,17 +936,29 @@ xe_hwmon_temp_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
>   
>   	switch (attr) {
>   	case hwmon_temp_input:
> +		switch (channel) {
> +		case CHANNEL_MCTRL:
> +			return get_mc_temp(hwmon, val);
> +		break;
> +		case CHANNEL_PKG:
> +		case CHANNEL_VRAM:
>   		reg_val = xe_mmio_read32(mmio, xe_hwmon_get_reg(hwmon, REG_TEMP, channel));
>   
>   		/* HW register value is in degrees Celsius, convert to millidegrees. */
>   		*val = REG_FIELD_GET(TEMP_MASK, reg_val) * MILLIDEGREE_PER_DEGREE;
>   		break;
> +		default:
> +			*val = 0;
> +			return -EOPNOTSUPP;
> +		}
> +		break;
>   	case hwmon_temp_emergency:
>   		switch (channel) {
>   		case CHANNEL_PKG:
>   			*val = hwmon->temp.limit[TEMP_LIMIT_PKG_SHUTDOWN] * MILLIDEGREE_PER_DEGREE;
>   			break;
>   		case CHANNEL_VRAM:
> +		case CHANNEL_MCTRL:
>   			*val = hwmon->temp.limit[TEMP_LIMIT_MEM_SHUTDOWN] * MILLIDEGREE_PER_DEGREE;
>   			break;
>   		default:
> @@ -909,6 +972,7 @@ xe_hwmon_temp_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
>   			*val = hwmon->temp.limit[TEMP_LIMIT_PKG_TJMAX] * MILLIDEGREE_PER_DEGREE;
>   			break;
>   		case CHANNEL_VRAM:
> +		case CHANNEL_MCTRL:
>   			*val = hwmon->temp.limit[TEMP_LIMIT_MEM_TJMAX] * MILLIDEGREE_PER_DEGREE;
>   			break;
>   		default:
> @@ -1278,6 +1342,8 @@ static int xe_hwmon_read_label(struct device *dev,
>   			*str = "pkg";
>   		else if (channel == CHANNEL_VRAM)
>   			*str = "vram";
> +		else if (channel == CHANNEL_MCTRL)
> +			*str = "mctrl_avg";
>   		return 0;
>   	case hwmon_power:
>   	case hwmon_energy:
> diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
> index 16201da0cf6b..53d826e24273 100644
> --- a/drivers/gpu/drm/xe/xe_pcode_api.h
> +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
> @@ -69,6 +69,8 @@
>   #define	READ_THERMAL_LIMITS			0x0
>   #define	READ_THERMAL_CONFIG			0x1
>   #define	READ_THERMAL_DATA			0x2
> +#define TEMP_MASK_MAILBOX			REG_GENMASK8(6, 0)
> +#define TEMP_INDEX_MCTRL			0x2
>   
>   #define   PCODE_FREQUENCY_CONFIG		0x6e
>   /* Frequency Config Sub Commands (param1) */

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 658BAC02192
	for <intel-xe@archiver.kernel.org>; Wed,  5 Feb 2025 07:11:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FB3410E740;
	Wed,  5 Feb 2025 07:11:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N2Kilcmx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7514510E740
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Feb 2025 07:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738739475; x=1770275475;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=l5bOqmlh1Hvb/uPv63w70ZwPUDI99JxnfW8AWvF5InA=;
 b=N2KilcmxTxsGEA9gUICBNN5zfSYC50bk+gi3C9E0kMIasqd+6luh/5tl
 GO0U8cDNT+GSgyfq5+NMJxCQUjh9enojqZ4P91wpbM2RnwPV7/vPYdHh8
 QIMlr8rKqZIHAkG32Pomz/nsJuhBHrZ1QD4NMfNywM/B6UDEasjoz7wDm
 gkPO/USpFUgQCrs8Ls+DyjPnhqPTTH10ZPr7kcQDMSIoaKWn+zmlNNJrT
 AjFoCcrO1/p6Ny98ZAUf4cn2HcMnLbpuRNcS2PqmpXiPgnjJ8L7ax7dIN
 Ya8ubazNsXlGVCbkPux9sZ9Ue9Vh7b3SBc/3YD/f8yj4lkfx2AAwX0d0a Q==;
X-CSE-ConnectionGUID: R/MK9HcsRYKn4Xb32U3vUw==
X-CSE-MsgGUID: 3kA7mHwhQ/SGoC+N9tBsuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="61760083"
X-IronPort-AV: E=Sophos;i="6.13,260,1732608000"; d="scan'208";a="61760083"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2025 23:11:15 -0800
X-CSE-ConnectionGUID: QwUTZE56RnqgN+rUatPVMQ==
X-CSE-MsgGUID: B+uXW4BxTbaZ6AfX1KqNJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,260,1732608000"; d="scan'208";a="115861608"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Feb 2025 23:11:14 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 4 Feb 2025 23:11:13 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 4 Feb 2025 23:11:13 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 4 Feb 2025 23:11:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zVUPz572QBgrmzvkNi3H5udT3pt8xjw9rSjyUByn9D5j1BvgGso9MYJz3XCuqIZxEoqto1vwboaBiOYxAWO5FDhqYdwd/5s53IaldiJNZFV1nAbAzbVGmJyZELPdY9zE968anxkS54Tv3G5n72we2N4jEJrXq4hyekDQYkru3DimKdiyn2czCYRyJl87oTZCpLokCpCpMNqq/mTbOdm0PEECjRh7YpcJnj2SQuGXX8Xjs4Lacgl2qq0IOA5llVwJDKj+Yo2wql5Fq3jELEbNgYOOPjtPe3MhY+Z99wky+ps9ExSM3BnDsaQqi1Jqn5imA2pPg1SB8KEuYm9oDQSsMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SkmaW8ZFShRTNALpLyJd8VEERGw+qImD8mAurMdLRvk=;
 b=PDxYK0q2dW99beioL3P5keogpHNyxMU2XjFaU2eLhHELdXcXd6NBJnkQ4UZkZKHO1idyvhJtlqZtTb3HLTG2n5tTN3OTPGZnFqRig2HbiMWDpHGIBOI1+Laav2Sp8uw8iTGRNIV+TgZ8h51sGptLOpP9bRpi9FGFkqY6Z4+vy8CGu+8tndIgdzKrqy24NjphFSwzMdc3GOyhIZGs3p3gL7nhu2taGze70TageKur0uEnpCdmM0q9jdsVXUcl799nG/RDbHNoCW6WZDHarG9/xng6AR9YYawqKusglv3cp88JtPNgv3dPsG/P5obwBVDUQkaDYkArSQb6KwdhHCSruA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 CH0PR11MB8189.namprd11.prod.outlook.com (2603:10b6:610:18d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.26; Wed, 5 Feb
 2025 07:10:55 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%4]) with mapi id 15.20.8398.025; Wed, 5 Feb 2025
 07:10:54 +0000
Message-ID: <0551646d-4e57-409c-b416-1a7108a2f4d9@intel.com>
Date: Wed, 5 Feb 2025 12:40:46 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/hwmon: expose package and vram temperature
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: Raag Jadav <raag.jadav@intel.com>, "Poosa, Karthik"
 <karthik.poosa@intel.com>, <lucas.demarchi@intel.com>,
 <matthew.d.roper@intel.com>, <andi.shyti@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>
References: <20250131054502.1528555-1-raag.jadav@intel.com>
 <2c9ce022-56a6-4d25-a274-32d9013f8c49@intel.com>
 <Z53BOTXFSsZ5WKFs@black.fi.intel.com>
 <cce1eb5a-b738-4283-8d3d-e782da14067a@intel.com> <Z6Kms_pJxvKJpoL5@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <Z6Kms_pJxvKJpoL5@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0077.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::18) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|CH0PR11MB8189:EE_
X-MS-Office365-Filtering-Correlation-Id: 084dcff1-2fe5-420d-d1b3-08dd45b43aed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UXB3R2c3NkgzVm9lL3ZyMUovRlkvcC9FNnVFbEFSSnVMeGNjdVZjd1JJd25C?=
 =?utf-8?B?WGQ4MzU2L1UzaW8vWUcwc2w3eFREa0VlSzAxMmphdXZoN0hORGZZdTE5ZW1N?=
 =?utf-8?B?R0RBbjU2ZnY5Vlc4Tkg5Z0RCTTRjc3NiQXB3RVppMEE3Qy9JRDFrR1JVMzE5?=
 =?utf-8?B?QUlrRkNHS0VUbkJZYkhsQnFrRWhBZ3dzZkZra0I5Zi9VbnhlTU9vMnptLzdG?=
 =?utf-8?B?VVo3Yk8zYW1UV2dMVk1uaW9EKzloYUdyVzNJTTBFVFJ0cjF6SUcvdS9xZ1Uz?=
 =?utf-8?B?RU9VSWZncDFQZ2tubkFyTnBSZUNEY2ViSDAvOFJLeUx1UXRlYURDUXF0cDNC?=
 =?utf-8?B?dHlwUkY2ZVZDTitNNzlxZmhuL1BHemd2Y21LYjAvNk9kd0h5TGhkNmVCb3da?=
 =?utf-8?B?MDZCaGZ0Znk1NlVMK3o0UmhMMDZCRHV0MVZGNnQyaW9nR3BuaGNtdC9wUVBC?=
 =?utf-8?B?YWowT1ZpZy94b2RqZk5nWTg5U2YyK0VpSHBra2xyYUw0TlhWUmF4YW1LbFhC?=
 =?utf-8?B?UTdIc2o0ZGdnQlZZcmRTUDlma3ZWaVRha2prOU9jK2lyZ1kyRXFOT1JxRW9u?=
 =?utf-8?B?VDhmUWNqcEFMc0ViVFlkdWdSRFh4eWcxbHczUDVnMnloM0tMaHRNYk80eW8z?=
 =?utf-8?B?Y1QyVEYzakhqMXlxYnFzTFpxYTI3NnJ3dEJZNTRtR2RZZ1pWRUlwaUZFZ3pw?=
 =?utf-8?B?enA0KzgvZ2xBSDFLTkxPRDJPUFlmcDFMRmN4MUVHTW9vNWczMHB4b3lSN1Bw?=
 =?utf-8?B?Q21ZemVUcmRPOHVnSkM5cldMUjZwc0p4YnBwNlk1WDFpQzU3SG1sMHhxQVpu?=
 =?utf-8?B?bHowYi9LNzhUT0ZJRE1LeVpNQ3k1NDFVdGNBcVJQWFpIQi94V045cVd3VjZM?=
 =?utf-8?B?a0dzMWVFTHUyenZlTGFTZFpvd1VPTHZiTjZDR1FXWlYxU3M2NFA5ckgxdWVL?=
 =?utf-8?B?YUlUY3lHbjRDd0dobkYzYmNSdGx3OEV2emVTbFpQYng3VHZxbEo4djlYZjNh?=
 =?utf-8?B?Q1ZKaEZIZEh6QXNPQ1ltYStJeU15WXIyRmxyY0NwMHp2T2pwcDk0SGlQODJ3?=
 =?utf-8?B?NzUxVkZUUnNpK2ZlZXMyOCtUQmxsRnlYektCbkFFeDJiVk1CazhreUN5cjN1?=
 =?utf-8?B?anVTTEhCdGl6NDBZZHpuOTlhcHIxOU53eXlweUZrOGJxNFRQVEs1dkhMSThQ?=
 =?utf-8?B?QW5lMTlDbHhYa3V4L0kxdjdZU3llNkVNenVYdk5WaVpSUitxVkFwQkt4MVdH?=
 =?utf-8?B?TC9xUXhZdVlFZEpOeis2Q1l2bW02ZlBuZ1JzSkV3bEFwSGZYQ012Tmdpa0RP?=
 =?utf-8?B?ZmhnOExBYTRSWGVYTHFBTUhoYW9Wczl4VGNPNmZrdzhkYTQvdzRxWG9hSHNE?=
 =?utf-8?B?YWZRRTBldTErVDNpVXlaWmdGMEZSZ0h5dnZ5SU1TazBUMDhxcXl6OGJSQ1Rw?=
 =?utf-8?B?aXdlZFUrRlFHUHFrbGF1VlV6djRLeDZFdXN1V3lMbTc1bjYwc0RqbmpKcWw2?=
 =?utf-8?B?KzR4RlZRKzBzWnd2TFBxRWRzWk5vQzlMeWRDTFhLQmZSZFMyZGFPQUxwNUhE?=
 =?utf-8?B?amF1TEpVVzBIN1FwM1VmSXVpNU81VytNcTRRcDFNanZ5RStWdFdRcnhEeS8x?=
 =?utf-8?B?SnBvS0hlbEhLeHhhTE1MY25WV0YrcjBUMWI2YmdNaDZzZld2d0dKZU5kcHJJ?=
 =?utf-8?B?MENJcFFIOXdxcWN0N0xSR04yMFJQY24vRlFkTUFYZU1uN3JUazZrQStLQ3Jh?=
 =?utf-8?Q?4A5f47Dr4hh+CQ2J8Rq6g190CxvPS894ZcwM0u2?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SmxyMjE0em1rOHQyOW1xcFJFY096MVJpdDBwNmYxNnhMaVNtTU9PNGtYRmdF?=
 =?utf-8?B?Q25SaVBHdGlXbVU5UVdwWjR2c3AvbFFJcUFVOHBlUnBQNlpFYWZqZnRJOXZS?=
 =?utf-8?B?NktyR1VGTklKOHBwMFN5Z0daZkxWTDB0aEczNEhtajlONXA1V0xaY2ZEb2hs?=
 =?utf-8?B?RXY0cE1HV3RDNkhUZFFmSCt2eFRQd2tmMGhsc2pSbU1JMDhwOTk2Ym5uNDBF?=
 =?utf-8?B?Q2ZwMGx3NWxCaVlpZ05MZzE0dndJbWNJV2pMR253RUtxOWhRemFheTZmYmk3?=
 =?utf-8?B?eldwYXA3cHBKbXVCYmErSTJZLzFsd1U2cE1uSGRCZWVJazdON0VMUWlURzh2?=
 =?utf-8?B?ZU9JNjdkdVQ3a095aHhhSmdzaXFxdjdXVjMwSEVFd3BvazhadlhVTUU1eWNJ?=
 =?utf-8?B?VG5xYnpUYTk1UkhMZjBJcjFjL1pQUnZoOGxVYmVmZ1YyNHBSYXF4bmtvRjZv?=
 =?utf-8?B?M0p6cng4Ri93cHgrV0RFbFd3bzZvcTdwMXZIVEQveWViRXlqVlF0b3pGTXBW?=
 =?utf-8?B?cTlTUmM2Zm1HWmQzdlY3WENUQzQvMGJ2Z3I5Nm9LazFrZkNrSWhHV09GK2g3?=
 =?utf-8?B?RjhMdXdmc01QUmxtMUs0eDZUSXVoZHpqNS9GU1FSeHorOVJVRlZsNXdEMzBk?=
 =?utf-8?B?U1VOejhLZzZSMUVRVXRhcTY4WGVnK2xCVncreTE1aldFTlBtaHNMTFl6bmNx?=
 =?utf-8?B?OEpXeDg2NFA2LzhncDIwWkNpaEVqUjl5ZGtEYmhWRDhtb3hHeU1MSUlrNDNQ?=
 =?utf-8?B?NE51Z2w1QU1Cb1BGSnV1YjlnRGpSMkxiUDRUYk5McnF5M1pRRld3WlBkYUtQ?=
 =?utf-8?B?cDRJYUNmT0lGYTNoNGIwOGw0RUwzdXpHMUlrY2NQMXU4QzZLeXpEZkdCSVpU?=
 =?utf-8?B?SmJOQVhSMTRGamJhdUJidGJUc1RyQ1R0MEE5eENSS2QrbUNoMzNXZ0RGYVhr?=
 =?utf-8?B?M3hmbUFxWDdDUzU3cnRFc2loVXV1OEhpRkV4c005by93UEl5cVRxVWM3Yi92?=
 =?utf-8?B?OFlJbUp2aUc1alFoM0xORTY1YVpnZ3VXVmxPd3BCQWo3UVZOcWpMTEFnb3A2?=
 =?utf-8?B?U2FxQ3crNEVSckE2S3FvaVVyNnIxczNlVHJNRDMwMHJiWTVhUFdCYW1ObFlF?=
 =?utf-8?B?WDFxQ3BVeGd4Q3hiblgwYUZvV2NDNlBwVnlIL1Z3ak5lQnluRXVsbWRYRjNH?=
 =?utf-8?B?Uno0bndkRXNkaTRzbFVydDhEVDZtUkw5Ym9iZ2ltNTkxcWVhakdMaGhMR0tG?=
 =?utf-8?B?bDdJT0VyR3dnVENEYjg2ZjNDWXdMWkZJZHpiVWVsOFFYZXd1SE5nVi9yUndU?=
 =?utf-8?B?cmdnY2NZTWZyZ3NFWk9ieFo4SHRvN2d5MzhPN0R5dGlsSy93eTJPTmxhaHFD?=
 =?utf-8?B?QTdGVWJCS05UTTVvUkwrM0ZqdDJIQ1p4RWd3NzlnMHhPNll4V2UremRnRXNG?=
 =?utf-8?B?RVo5OXRKeWFRZVBHTmNrWXYyVFRuQXVNNzB6OXhuRUVVbnp0VURpdkpzUW5J?=
 =?utf-8?B?eVRPVkhpdGM5a1R6U004akwwaGdtdWdGWVJjNUFCa3hpdlVVVkZFRWw1Q1R5?=
 =?utf-8?B?azk1RmtFUVltcmpDM2thd2RBc2dLWFFxeVQxWldXU3RvbkJzQkxBekNYZkM1?=
 =?utf-8?B?RVB3UW82ZUdDQmNtTUJLZks0RGREa1BDa25zK1dqeHRqRzJSbkJGVGdWOUlG?=
 =?utf-8?B?RFcxc2x0V1c3SUg2M2hKWU1oK05pVVZuUFVWZDEyYjF2TWEveU5xSG5qME1y?=
 =?utf-8?B?WElzRXVQMFpjTzRQb2kvQ1J3TUQ0NTQrUVAvaGhYQ3lUeEFNY3JuTU5RR3JI?=
 =?utf-8?B?ZW5aMEJyQWZqRmRQUG5TNXNnUWJYUnVYMHZxemVHcmVXK25XZnNoOGpocFgz?=
 =?utf-8?B?TDBlTW53bXZDWVVncTR4cWdLaTBCS25FK3JIYjVhVjJocElkRUNiTXdNNTdX?=
 =?utf-8?B?Q09ocytMbVd1UWpnMWlyTmZNTTVqaFdmUjd3ckJqRjcxT2VabUl3SkhNUmF3?=
 =?utf-8?B?Vk5GVDFYYTdDQXdtcFo1UFBWSmQraWd3WWJiMWJmSFkrdlhXa3N3cnRpcXRz?=
 =?utf-8?B?dElwTmxXUTlWUkkvNHd0UGVYeC9xdlEzQ3lmQ3B6ZmRxNHQ0bVJVOXlwTGhw?=
 =?utf-8?Q?U95l8DXLrHkagC+oE9ITdeao1?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 084dcff1-2fe5-420d-d1b3-08dd45b43aed
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2025 07:10:54.6139 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HuMYSZ7Iz1JhlD1mwjFmE3YUdG81ms4+U4M+7G9vXZ58n3XLmuJEUlZr2IgHdJkdUrTPUHEx0JShdCYU3hQGWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8189
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



On 2/5/2025 5:15 AM, Rodrigo Vivi wrote:
> On Mon, Feb 03, 2025 at 11:57:20AM +0530, Riana Tauro wrote:
>>
>>
>> On 2/1/2025 12:07 PM, Raag Jadav wrote:
>>> On Fri, Jan 31, 2025 at 08:13:15PM +0530, Poosa, Karthik wrote:
>>>> On 31-01-2025 11:15, Raag Jadav wrote:
>>>>> Add hwmon support for temp2_input and temp3_input attributes, which will
>>>>
>>>> Add hwmon support for temp2_input and temp3_input attributes for supported platforms
>>>>
>>>>> expose package and vram temperature in millidegree Celsius. With this in
>>>>> place we can monitor temperature using lm-sensors tool.
>>>>
>>>> With these changes, package and vram temperatures can be monitored using lm-sensors tool.
>>>
>>> That's pretty much what it already says, doesn't it?
>>>
>>>>> v2: Reuse existing channels (Badal, Karthik)
>>>> Add a new channel for VRAM temperature, channel 3.
>>>>>
>>>>> Signed-off-by: Raag Jadav<raag.jadav@intel.com>
>>>>> Reviewed-by: Andi Shyti<andi.shyti@linux.intel.com>
>>>>> ---
>>>>>     .../ABI/testing/sysfs-driver-intel-xe-hwmon   | 16 +++++
>>>>>     drivers/gpu/drm/xe/regs/xe_mchbar_regs.h      |  3 +
>>>>>     drivers/gpu/drm/xe/regs/xe_pcode_regs.h       |  2 +
>>>>>     drivers/gpu/drm/xe/xe_hwmon.c                 | 60 +++++++++++++++++++
>>>>>     4 files changed, 81 insertions(+)
>>>>>
>>>>> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>>>>> index d792a56f59ac..9bce281314df 100644
>>>>> --- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>>>>> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>>>>> @@ -108,3 +108,19 @@ Contact:	intel-xe@lists.freedesktop.org
>>>>>     Description:	RO. Package current voltage in millivolt.
>>>>>     		Only supported for particular Intel Xe graphics platforms.
>>>>> +
>>>>> +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp2_input
>>>>> +Date:		March 2025
>>>>
>>>> January 2025,
>>>>
>>>> February 2025, if there is a next revision after v2
>>>>
>>>>> +KernelVersion:	6.14
>>>>> +Contact:	intel-xe@lists.freedesktop.org
>>>>> +Description:	RO. Package temperature in millidegree Celsius.
>>>>> +
>>>>> +		Only supported for particular Intel Xe graphics platforms.
>>>>> +
>>>>> +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp3_input
>>>>> +Date:		March 2025
>>>>
>>>> January 2025
>>>>
>>>> February 2025, if there is a next revision after v2
>>>
>>> Something to follow: https://hansen.beer/~dave/phb/
>>>
>>>>> +KernelVersion:	6.14
>>>>> +Contact:	intel-xe@lists.freedesktop.org
>>>>> +Description:	RO. VRAM temperature in millidegree Celsius.
>>>>> +
>>>>> +		Only supported for particular Intel Xe graphics platforms.
>>>>> diff --git a/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
>>>>> index 519dd1067a19..f5e5234857c1 100644
>>>>> --- a/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
>>>>> +++ b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
>>>>> @@ -34,6 +34,9 @@
>>>>>     #define PCU_CR_PACKAGE_ENERGY_STATUS		XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x593c)
>>>>> +#define PCU_CR_PACKAGE_TEMPERATURE		XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x5978)
>>>>> +#define   TEMP_MASK				REG_GENMASK(7, 0)
>>>> TEMP_MASK -> TEMPERATURE_MASK
>>>
>>> This is consistent with other GENMASK() macros here.
>>>
>>>>>     #define PCU_CR_PACKAGE_RAPL_LIMIT		XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x59a0)
>>>>>     #define   PKG_PWR_LIM_1				REG_GENMASK(14, 0)
>>>>>     #define   PKG_PWR_LIM_1_EN			REG_BIT(15)
>>>>> diff --git a/drivers/gpu/drm/xe/regs/xe_pcode_regs.h b/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
>>>>> index 0b0b49d850ae..8846eb9ce2a4 100644
>>>>> --- a/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
>>>>> +++ b/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
>>>>> @@ -21,6 +21,8 @@
>>>>>     #define BMG_PACKAGE_POWER_SKU			XE_REG(0x138098)
>>>>>     #define BMG_PACKAGE_POWER_SKU_UNIT		XE_REG(0x1380dc)
>>>>>     #define BMG_PACKAGE_ENERGY_STATUS		XE_REG(0x138120)
>>>>> +#define BMG_VRAM_TEMPERATURE			XE_REG(0x1382c0)
>>>>> +#define BMG_PACKAGE_TEMPERATURE			XE_REG(0x138434)
>>>>>     #define BMG_PACKAGE_RAPL_LIMIT			XE_REG(0x138440)
>>>>>     #define BMG_PLATFORM_ENERGY_STATUS		XE_REG(0x138458)
>>>>>     #define BMG_PLATFORM_POWER_LIMIT		XE_REG(0x138460)
>>>>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
>>>>> index fde56dad3ab7..7f327e334212 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
>>>>> @@ -6,6 +6,7 @@
>>>>>     #include <linux/hwmon-sysfs.h>
>>>>>     #include <linux/hwmon.h>
>>>>>     #include <linux/types.h>
>>>>> +#include <linux/units.h>
>>>>>     #include <drm/drm_managed.h>
>>>>>     #include "regs/xe_gt_regs.h"
>>>>> @@ -20,6 +21,7 @@
>>>>>     #include "xe_pm.h"
>>>>>     enum xe_hwmon_reg {
>>>>> +	REG_TEMP,
>>>>
>>>> Any specific reason for adding this at the beginning of enum ?
>>>
>>> This follows the ordering of enum hwmon_sensor_types (as the rest of the patch).
>>>
>>>> Generally addition is at the end for any new enums.
>>>>
>>>>>     	REG_PKG_RAPL_LIMIT,
>>>>>     	REG_PKG_POWER_SKU,
>>>>>     	REG_PKG_POWER_SKU_UNIT,
>>>>> @@ -36,6 +38,7 @@ enum xe_hwmon_reg_operation {
>>>>>     enum xe_hwmon_channel {
>>>>>     	CHANNEL_CARD,
>>>>>     	CHANNEL_PKG,
>>>>> +	CHANNEL_VRAM,
>>>>>     	CHANNEL_MAX,
>>>>>     };
>>>>> @@ -84,6 +87,19 @@ static struct xe_reg xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg
>>>>>     	struct xe_device *xe = hwmon->xe;
>>>>>     	switch (hwmon_reg) {
>>>>> +	case REG_TEMP:
>>>>> +		if (xe->info.platform == XE_BATTLEMAGE) {
>>>>> +			if (channel == CHANNEL_PKG)
>>>>> +				return BMG_PACKAGE_TEMPERATURE;
>>>>> +			else if (channel == CHANNEL_VRAM)
>>>>> +				return BMG_VRAM_TEMPERATURE;
>>>>> +		} else if (xe->info.platform == XE_DG2) {
>>>>> +			if (channel == CHANNEL_PKG)
>>>>> +				return PCU_CR_PACKAGE_TEMPERATURE;
>>>>> +			else if (channel == CHANNEL_VRAM)
>>>>> +				return BMG_VRAM_TEMPERATURE;
>>>>
>>>> This doesn't look good.
>>>>
>>>> Can you add PCU_CR_VRAM_TEMPERATURE with same offset in
>>>> xe/regs/xe_mchbar_regs.h ?
>>>
>>> It's not mchbar register.
>>
>> add it under the same file without the bmg prefix.
>>
>> The other registers are platform specific and have the prefix.
>> This is common and can have the PCU prefix
> 
> No, but the point of the xe_mchbar_reg itself is to only
> include registers that are from the mchbar.

Sorry for the misunderstanding.
I meant under the existing pcode_regs file.

It should be okay to have a common prefix (like PCU) if register is common.

Thanks
Riana
> 
> Although the code here looks strange and misaligned, the
> registers are well aligned and its right place.
> 
>>
>> Thanks
>> Riana
>>>
>>>>> +		}
>>>>> +		break;
>>>>>     	case REG_PKG_RAPL_LIMIT:
>>>>>     		if (xe->info.platform == XE_BATTLEMAGE) {
>>>>>     			if (channel == CHANNEL_PKG)
>>>>> @@ -431,6 +447,8 @@ static const struct attribute_group *hwmon_groups[] = {
>>>>>     };
>>>>>     static const struct hwmon_channel_info * const hwmon_info[] = {
>>>>> +	HWMON_CHANNEL_INFO(temp, HWMON_T_LABEL, HWMON_T_INPUT | HWMON_T_LABEL,
>>>>> +			   HWMON_T_INPUT | HWMON_T_LABEL),
>>>>>     	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_LABEL,
>>>>>     			   HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_CRIT | HWMON_P_LABEL),
>>>>>     	HWMON_CHANNEL_INFO(curr, HWMON_C_LABEL, HWMON_C_CRIT | HWMON_C_LABEL),
>>>>> @@ -506,6 +524,36 @@ static void xe_hwmon_get_voltage(struct xe_hwmon *hwmon, int channel, long *valu
>>>>>     	*value = DIV_ROUND_CLOSEST(REG_FIELD_GET(VOLTAGE_MASK, reg_val) * 2500, SF_VOLTAGE);
>>>>>     }
>>>>> +static umode_t
>>>>> +xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>>>>> +{
>>>>> +	switch (attr) {
>>>>> +	case hwmon_temp_input:
>>>>> +	case hwmon_temp_label:
>>>>> +		return xe_reg_is_valid(xe_hwmon_get_reg(hwmon, REG_TEMP, channel)) ? 0444 : 0;
>>>>> +	default:
>>>>> +		return 0;
>>>>> +	}
>>>>> +}
>>>>> +
>>>>> +static int
>>>>> +xe_hwmon_temp_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
>>>>> +{
>>>>> +	struct xe_mmio *mmio = xe_root_tile_mmio(hwmon->xe);
>>>>> +	u64 reg_val;
>>>>> +
>>>>> +	switch (attr) {
>>>>> +	case hwmon_temp_input:
>>>>> +		reg_val = xe_mmio_read32(mmio, xe_hwmon_get_reg(hwmon, REG_TEMP, channel));
>>>>> +
>>>>> +		/* HW register value is in degrees Celsius, convert to millidegrees. */
>>>>> +		*val = REG_FIELD_GET(TEMP_MASK, reg_val) * MILLIDEGREE_PER_DEGREE;
>>>>> +		return 0;
>>>>> +	default:
>>>>> +		return -EOPNOTSUPP;
>>>> Can you add debug log, printing the unsupported attr ?
>>>
>>> We don't have it for others, anything special about this one?
>>>
>>> Raag
>>


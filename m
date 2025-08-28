Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A321C8303F
	for <intel-xe@archiver.kernel.org>; Thu, 28 Aug 2025 16:47:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E2C410EA4E;
	Thu, 28 Aug 2025 16:47:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fKZ/k+sy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5937A10EA4E
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Aug 2025 16:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756399662; x=1787935662;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=194VG+ia5Y931QKfmCVQ9SP3FRsWOoNJ8JIZNXp18YU=;
 b=fKZ/k+syWAxGoodTqe8H2ihasOyiCPIUEbNB88L17lxMg3CkC7YhAQCF
 ANpgQiqEnkkHZC8Ecpg5WDdj3n9dWkHCwl1x5Sh3RqTDMvNBArpeEK9q/
 ppgCMnlMkruLQQF4qOKGiXBuFUKY4r2VzA0xTpE2B8azo5YTmM5O8bNp2
 skkaaIXUB2V2ow2MkkbfQ9txmzoFGpFb71TZpAkxRfWI+EapaDWXTaYTt
 QRZdFEAT14tO5+QkmNEhvH/2/Yk+KGlP/aoxgaAJaMH08jCcZPClnrgEG
 vca7/mCGgMmyanjTmM5qfBGMxYG534NOCypVu3YVecnpblJvYUeHtI2V6 g==;
X-CSE-ConnectionGUID: VIyb22PyT4OYZCesfL4Kdw==
X-CSE-MsgGUID: V0MD6CEGS6GhaKlq8GCthA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62510434"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="62510434"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 09:47:42 -0700
X-CSE-ConnectionGUID: H6iY+hp3QACGFrY5Se1uLA==
X-CSE-MsgGUID: ZKtMpLQpQ8mY62yEnDIGNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,220,1751266800"; d="scan'208";a="169457464"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 09:47:42 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 28 Aug 2025 09:47:41 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 28 Aug 2025 09:47:41 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.45) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 28 Aug 2025 09:47:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HyBXgbAYOrwn2irNTirBxjYwM395sPRXmg+Yxj+cqjhfi97SwCSc5JCvbukuFNibdw6RPidlsEvMtgAiNkUmcRJSFBkJkFp3D8f6YEmJQpHaU704/aI/sN9jxxShDbMRohcoZa3pLZWHGxR8Jg8yWn88XcpkCu5KwzDbwnlma6UgPMuu06ZFne3ikrhSXFPxDIn8UEFOV9J94XG2rwXy9DMvvYsDN3ZR0rmiB2vIKHbkImDUBZkkQbjWJoSedP3DwTjKiZeB4zcXLFfWMVgziBYsxKPD+4SeDBZU/scnC9TY/4GhyHRBj+LcxKk0pUoIfy/yEbBKBLCRQt1Aovr4TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UVfJphCAPbB+Kwpc+cBw2a3XTvawrHwlHbzH/3PY3jI=;
 b=Y5UzaEEN1AZiIeSE+006Z+RnExdw2MoFh5mIagcARy6kw7iK0Fut4Zipr/vTE5KwpsiyEpKiwkb8FzIoMzvsI67pEb4pktNsgnmZsWEFdEz83xC/swAm15XvLUmE5uQgjQd/jUCV9fryUNIVjsjYc7osL3mS0/m45p77PomO+LS0bF1BXDX7axQgCkja3oNmMO93VXt4mZQJlI1bdzpIm2uV4bkJ1dYJFjDfDBupKOz6WmslTQv5jWnIhj+lY5BCJ+zKcU+jhnuUDYmCRMNI6w5r7WCLGmqN4u6jvILAVjVJZrlmuwMhPaO1Oq+bPZMVfnBwcxMGGzI95GlwNlPdUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by SA1PR11MB6616.namprd11.prod.outlook.com (2603:10b6:806:257::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.25; Thu, 28 Aug
 2025 16:47:35 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%5]) with mapi id 15.20.9052.019; Thu, 28 Aug 2025
 16:47:35 +0000
Message-ID: <74130297-bc96-4955-b156-7df8f5dc30c0@intel.com>
Date: Thu, 28 Aug 2025 18:47:29 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] drm/xe/vf: Enable CCS save/restore only on supported
 GUC versions
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 <intel-xe@lists.freedesktop.org>, "Lis, Tomasz" <tomasz.lis@intel.com>
CC: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>, Andi Shyti
 <andi.shyti@kernel.org>
References: <20250828115559.9055-1-satyanarayana.k.v.p@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250828115559.9055-1-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0036.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::9) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|SA1PR11MB6616:EE_
X-MS-Office365-Filtering-Correlation-Id: fbab3972-b24a-4dca-7c99-08dde65296db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aGVvWnNGd0ljNWE0UDdsK2dBSS9kQ3IvWWJGdmtQdmMxakVFdHpWTFk5TEpj?=
 =?utf-8?B?bXFRQVJsWTU4cHFGKzRKRkdqK0VkR0xVTTJOZGlCNG9idHIzWTAxcmlrZnla?=
 =?utf-8?B?MEVoRHpaTnBneENldlh5RnFtZnRpNVUxcjJRR1dQanBjc1d0TFYzOW9kM3Zq?=
 =?utf-8?B?MjkvTjJIZUNiNVlMVkdoaTQ3N1pUZk1VNWhZVHZRS1Q4OVdjVC95Mk9qcVVB?=
 =?utf-8?B?T2ZRRmhPeVVlc0p6dEt1V3luaThrZW4xWlpnKzN2SDl3dExSM2tIbTZiL0xU?=
 =?utf-8?B?VEpMZEhNOW5GUTBlSHBXSjg5TGFQL2ovd2ZTc1NoZTRXT2E5R0hQZGNGZUpT?=
 =?utf-8?B?R3N2cDYyMzhERTEyOUJnUTBqUTJxNEVjelBJK3NUWTByS3ZZWXRicjVqZVY1?=
 =?utf-8?B?TU5RMW0rSTFMbFEybTNpYldzb0JMMFNNVEF1TW90WnhLSlNQSHVDNUFLU01h?=
 =?utf-8?B?RXdIOHhCMUVaeDRDdHVrYUZrcVVWeGc5eVNCQVZrVVpSVGk5Vkt4L2tYSVdM?=
 =?utf-8?B?NGs0VUE5Q0ZwMUZhWCt5TXdmaUxQN3E4VnNvdUxmeCs3Zm5jeHNiay90ZDFS?=
 =?utf-8?B?RHJra09uckdDdGhvbWYzYTRyS1d4ME1vQVNYRVlidVBDQXBZbjJscmdFU2xl?=
 =?utf-8?B?dG9Pd1gvblZOcmVROUhrSFBQNWUyYnVuNm5Ka1ZkTTJ0NFZ1aUJZU3Q2OVd0?=
 =?utf-8?B?ZmdBL3NOOEszUjVYRDFBTFpwTHFQTjUzN3llY2duYjNadUpReFJiV3JTUGd3?=
 =?utf-8?B?VFk3LzcyaWR0TmxTYVMwUXQ4K2kxcGdrRmFoQk9OT1VhK2kvVGxzYlVnWVVY?=
 =?utf-8?B?VGhSaFBxQkFVME1xakJRVGpiOVVDTUUyNDB1Ky9VZWlsVXBha1hPdGdTOEVy?=
 =?utf-8?B?SE5SZytRbE9SbU9KdnN2ZzZ4T1NiNytqUmdYWnFlcWxYSXFacXNTTG1PemE2?=
 =?utf-8?B?MVF1Q2tIVGhzQ3RzOG9TTUEyVnNSQ3pnMVRqaUc1R1l4SUZBbUhrSUpRWlZ6?=
 =?utf-8?B?R0ZvekhDYUR1M1lURFQxZFlKWmRheUpqSHQya0R1S0poQUk0SVZ2S2U2Rlgw?=
 =?utf-8?B?NFA0WlZzRmJERVV6T3VRM2s4TnZ6OHlEUkVCKzVYR3hFN1pTTmdMdE1DeTdQ?=
 =?utf-8?B?VzZVbkNydUh6VFNabXgvSDd4NzY0QjN4ZGN2ODVVN0svUnRmNUc4VGpqUU9j?=
 =?utf-8?B?UmVaVHYrOHJ2elVKRVFSY0pseXZOcmZNK1M4dUtzbUdTZjVnNGFSdm9ZTWFz?=
 =?utf-8?B?R1U0Ym1zaGRUQlBjYkdzTWIyNXcveVN3WnhReVlTUmF0U3FKamRST3o5TWtP?=
 =?utf-8?B?dThtY05ESzc5MG9FaFNPS0xxdk5kUHRHWmJKWWhvRmtjQjN6VjlMYStLUDFr?=
 =?utf-8?B?N0syVTNaQlJqQkdka25Uckt4dEs1SHZvamVGSVhsbHJzNzk4dDZ2WXpLSlJx?=
 =?utf-8?B?MEpZYUJqeVRaTE9CNDlJeVY5K2lnUUdLcVZCTXFIS3AydVJ2TkVwazE0T005?=
 =?utf-8?B?QUVCMlkrOEowcExsQU9PQ095WFlDcGx6cDlpLzJNYzlzTXByNjd2RlNNTy9h?=
 =?utf-8?B?Rk1oZExlWityZEMycUttU0Q1SGdtamJLMTZjaGxSY0dFdTYzZ0E1UWo2UW0x?=
 =?utf-8?B?MmdURkFISUdBUjlXSCtJN24xR0k2aVVsUWlEK20xSUlxbnlXNFB2eFJOeklI?=
 =?utf-8?B?M3BLWjdjWjMzSlh5RHgvd3NUc0JQUlhJTFIzOEhXczl4a3hBNjNFaUVWYUVW?=
 =?utf-8?B?WUlkclZCbEh0TkpaVllZaVAyQ3lueEdjVEJoTzNsaVczMm1ueVFFV09sekl4?=
 =?utf-8?B?UkwxcXNsV2Y1YlFWQ3BRT0NPaTArclhkNlRKRUxMelkrTUkwSThNZEJFSGw3?=
 =?utf-8?B?R2krT0I3ZjRjbGFHNnNnQ0xkUy8yNkkrcHpzOXg5bmNNcjR2Vkg4QlFWWHNM?=
 =?utf-8?Q?97l1HkQ5wME=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cjdMVG93TFdhdmJiaUFJeXdRU0JSQ1B5blR0anRUUHhrYVhRUDdQNUxLeU9D?=
 =?utf-8?B?YWN1bUZCMS8zc29CbVJYdVdMNFlSZG5FOFduZEFqS2dqcVdkK0J4TkNKTTFO?=
 =?utf-8?B?NWVGdEs1Z1hITDg4OTZFdXlFNjd6VEJTMkdrTEpSVk15ejJOUkRsSzBFcnQ0?=
 =?utf-8?B?S0lFQTJiZDNIdm8xM2Z3ZnMzSjBYVXg4Y2xheFZmVW9hU25YSDFwS2kxMURL?=
 =?utf-8?B?NWZwTkdpN0lLQ25rbDA0c0U5MGFHK2dXeTMyWjQ1QVZ3UnVvQjI1cUNTazBJ?=
 =?utf-8?B?a1dBQks5c3VCR211V0VncUtreVRUNFhEb1VDb01Yd2ZxZFpMZzNGTGxRYXdk?=
 =?utf-8?B?TEdVTHJ5NGo2WmFzdmFkR29FaHhweHZ4MmNjQXdwaWlUR3BicXRwWUVIYUJO?=
 =?utf-8?B?blpIcmpPTGc2dEc4ZVFnNERyQktxdW9GRWRUNjQxbXFXUmtkTnplUHFDUW1m?=
 =?utf-8?B?YTYySjRFSFBzMW9FSXhLUW15RGtpWTlvcVlOenpmS0VnQjRsbXRiNW84d0pa?=
 =?utf-8?B?MkpFenN3eWdvUGFUUTdhNU93dTNMQVNmRk90amQrY2swSnBzV3VyejRkdWJE?=
 =?utf-8?B?aFZiNlJ2cXNEa2RlMStZblpUM3ZuSW9QR1NWeG92RUYvZ09yZ3FOK1RNRlFT?=
 =?utf-8?B?VzFRbFREVEdEOE5VQ2I1dnJqanpVaWpheDFTTzlxNFMxSGpLbGNERXhOekxB?=
 =?utf-8?B?M3FFRG8rTXljUG4rdTE4cEE2a3k0NGVKYWROL0ZkKzRaWHJVNVZJc0dmZE11?=
 =?utf-8?B?eVFYaVgrdTY1NzVBSlRvbDhzZk9mc0J5d1FiR3R6NnZHNE80dTJIdythMFpl?=
 =?utf-8?B?ckhyd0xFZm1jaFNUeGdTOUI2WnZONjBMcjM4OGJ4ZTVyODlnQlBGZEJNQXdu?=
 =?utf-8?B?clgyR1l0ZlJ5WGlRd2txYnhMd3RFVTh0aVNLVk1oRm5JWW1BUUpwR3NaV1I0?=
 =?utf-8?B?bDRZN3VOU3pHa0dUTXlDdmtYRktxMjFialNwM3R0dUFYeVN5SWhQellLaDF2?=
 =?utf-8?B?djJ1Y0dFVHdlOHlhQWhSUEI1UmxvdjR2OFd5YzkybFpHSjFHTlh6WklwR3Vj?=
 =?utf-8?B?bnZqcnVBY2dETkpObnI1cnZ6K1NmYlhyRzJKb0l2ODdsS0dVbzFwYTJVQzZ5?=
 =?utf-8?B?Rk9ONmJGNnpHUG95WTR2d1RmSWtuaFZTTVQ0VldRc0dubmxQUStTelBoaGwr?=
 =?utf-8?B?OXRGMW9XZ3IySHE0ZXB2d2FqWEQxRnhRYVB1WGpUMHJDSlRHSGtmZk5BQUQ5?=
 =?utf-8?B?NmFpRUFnekN4VVhSUGN5ZFhGZmIwb2hGdk5lMFpFZ2lWS241cDRxMFdZZXp6?=
 =?utf-8?B?UXFTOVk0K3dPRTkya3NwK3pTT0hlSzV3YkxPL0c1NGR2UXo0WkhRd0hDb3hq?=
 =?utf-8?B?VFdPY2p3cjRUSGZuWWgxSkxTeHpSNFhBckJVU1I3OVRQVTJhOERya2J5eXRF?=
 =?utf-8?B?REt1S1RvUStEbHRqdXhrTnd4MEw2dG90TjFBYnptRitsekN6cmJZOU8rWnY5?=
 =?utf-8?B?RUw4VklraW0wbnJVWHdYYm8zWXIrSXgzNlZ5SkFNS3k4WjlHaGh3eHcyZFFp?=
 =?utf-8?B?T0pmRTJDdEdKbFdoakZOUHl2TkF0dDJsbjYySUpFNk9BWG1RQlVRWmNmMkpN?=
 =?utf-8?B?RXhlL3Z5RFdaQmVQenBsVW5VZzY2V2RQZ2tEVWRrM2tHalU3Rkd3WE5kU25K?=
 =?utf-8?B?MlNVcE9UOTZzbk9KcUJEc01ETjAyWktoemJuc1ppdTdiYXBYZFAvakZoSEJq?=
 =?utf-8?B?eWV4K0pnTEpGUUxTMTRkUmhrVm1CVFo3c3M2R3UyMXhBejRDYWN6TjZMRzdO?=
 =?utf-8?B?ZnNqUnVQNlJSVFl4b1d1a2ljd1VVQkQ0UEZsbUhaYnVTdjdoeE95RmNGaG5w?=
 =?utf-8?B?VEZyUWJqcTFSejR5eTJETVc1eWNUanNPY3VXMldDeDZmV2szdkdCdUZtM0lD?=
 =?utf-8?B?M3JGdUcvSDlteC8rV0ppYUpGKzZvL0Q2bHk5MEhpOTNjTGVPa3VnQktka0ha?=
 =?utf-8?B?YVZYMmV3bkVUbmhyS2hLSkJDUjI3S0pvWE5rVjM2UXJuVjAwSDh0RTNFSDFN?=
 =?utf-8?B?bERick9Cekd2dDJycGlzaHhVTnpUVy9KUUthYWpYS1NyRkF1Y3ZxVlplaGIz?=
 =?utf-8?B?eTJ3MStob2srTXIrSnArUnBrY1EreEVnZXpUR3BsajZsc2txcTBaSWwyMDQ2?=
 =?utf-8?B?V1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fbab3972-b24a-4dca-7c99-08dde65296db
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 16:47:35.1423 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fp85JgFcz7yFBCfPJQmcvWJ06rmwHnlIyqG+Ori4JJAOPiA/YigK/3/CF1y1lu2p0fnNxiKOOXzb08HzJ1sXeZeD3Liv0zaIrkE57VEhtTQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6616
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



On 8/28/2025 1:55 PM, Satyanarayana K V P wrote:
> CCS save/restore is supported starting with GuC 70.48.0 (compatibility
> version 1.23.0). Gate the feature on the GuC firmware version and keep it
> disabled on older or unsupported versions.
> 
> Fixes: f3009272ff2e ("drm/xe/vf: Create contexts for CCS read write")
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Andi Shyti <andi.shyti@kernel.org>
> 
> ---
> V5 -> V6:
> - Fixed issues reported by patchwork.
> 
> V4 -> V5:
> - Fixed issues reported by patchwork.
> 
> V3 -> V4:
> - Fixed review comments (Michal, Andi)
> 
> V2 -> V3:
> - Fixed review comments (Michal)
> 
> V1 -> V2:
> - Fixed review comments (Michal)
> ---
>  drivers/gpu/drm/xe/xe_sriov.c          |  2 +-
>  drivers/gpu/drm/xe/xe_sriov_vf.c       | 58 +++++++++++++++++++++++---
>  drivers/gpu/drm/xe/xe_sriov_vf.h       |  3 ++
>  drivers/gpu/drm/xe/xe_sriov_vf_types.h |  5 +++
>  4 files changed, 61 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_sriov.c b/drivers/gpu/drm/xe/xe_sriov.c
> index 87911fb4eea7..d2d2b2648f8d 100644
> --- a/drivers/gpu/drm/xe/xe_sriov.c
> +++ b/drivers/gpu/drm/xe/xe_sriov.c
> @@ -171,7 +171,7 @@ int xe_sriov_late_init(struct xe_device *xe)
>  {
>  	int err = 0;
>  
> -	if (IS_VF_CCS_INIT_NEEDED(xe))
> +	if (IS_VF_CCS_INIT_NEEDED(xe) && xe_sriov_vf_migration_supported(xe))
>  		err = xe_sriov_vf_ccs_init(xe);

this is now looking ugly
maybe it is good time to move CCS internals inside ccs_init()
and here just have:

	if (xe_sriov_vf_migration_supported(xe))
		err = xe_sriov_vf_ccs_init(xe);

and then:

int xe_sriov_vf_ccs_init(...)
{
	if (!IS_VF_CCS_INIT_NEEDED(xe))
		return 0;
	...
}

where INIT_NEEDED likely can be even open coded

>  
>  	return err;
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
> index 5de81f213d83..bffff0f0a488 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
> @@ -10,6 +10,7 @@
>  #include "xe_gt.h"
>  #include "xe_gt_sriov_printk.h"
>  #include "xe_gt_sriov_vf.h"
> +#include "xe_guc.h"
>  #include "xe_guc_ct.h"
>  #include "xe_guc_submit.h"
>  #include "xe_irq.h"
> @@ -127,13 +128,56 @@
>   *      |                               |                               |
>   */
>  
> -static bool vf_migration_supported(struct xe_device *xe)
> +/**
> + * xe_sriov_vf_migration_supported - Report whether SR-IOV VF migration is
> + * supported or not.
> + * @xe: the &xe_device to initialize
> + *
> + * Returns: true if VF migration is supported, false otherwise.
> + */
> +bool xe_sriov_vf_migration_supported(struct xe_device *xe)
>  {
> +	xe_assert(xe, IS_SRIOV_VF(xe));
> +	return !xe->sriov.vf.migration.disabled;
> +}
> +
> +static void vf_disable_migration(struct xe_device *xe, const char *fmt, ...)
> +{
> +	struct va_format vaf;
> +	va_list va_args;
> +
> +	xe_assert(xe, IS_SRIOV_VF(xe));
> +
> +	va_start(va_args, fmt);
> +	vaf.fmt = fmt;
> +	vaf.va  = &va_args;
> +	xe_sriov_notice(xe, "migration disabled: %pV\n", &vaf);
> +	va_end(va_args);
> +
> +	xe->sriov.vf.migration.disabled = true;
> +}
> +
> +static void vf_check_migration_support(struct xe_device *xe)
> +{
> +	struct xe_uc_fw_version guc_version;

this could be moved below [1]

> +
>  	/*
>  	 * TODO: Add conditions to allow specific platforms, when they're
>  	 * supported at production quality.
>  	 */
> -	return IS_ENABLED(CONFIG_DRM_XE_DEBUG);
> +	if (!IS_ENABLED(CONFIG_DRM_XE_DEBUG))
> +		return vf_disable_migration(xe,
> +					    "experimental feature not available on production builds");
> +
> +	if (xe->info.platform == XE_PANTHERLAKE) {

hmm, this is now inconsistent with the check in CCS_NEEDED
where you're looking for:

	GRAPHICS_VER(xe) >= 20

[1] here

> +		xe_gt_sriov_vf_guc_versions(xe_device_get_gt(xe, 0), NULL, &guc_version);
> +
> +		if (MAKE_GUC_VER(guc_version.major, guc_version.minor, guc_version.patch) <
> +		    MAKE_GUC_VER(1, 23, 0))
> +			return vf_disable_migration(xe,
> +						    "CCS migration requires GuC ABI >= 1.23 but only %u.%u found",
> +						    guc_version.major, guc_version.minor);
> +	}
>  }
>  
>  static void migration_worker_func(struct work_struct *w);
> @@ -144,10 +188,12 @@ static void migration_worker_func(struct work_struct *w);
>   */
>  void xe_sriov_vf_init_early(struct xe_device *xe)
>  {
> -	INIT_WORK(&xe->sriov.vf.migration.worker, migration_worker_func);
> +	vf_check_migration_support(xe);
>  
> -	if (!vf_migration_supported(xe))
> -		xe_sriov_info(xe, "migration not supported by this module version\n");
> +	if (!xe_sriov_vf_migration_supported(xe))
> +		return;

maybe this code can be rearranged to look like:

void vf_migration_disable(xe, ...) { ... }

void vf_migration_init_early(xe)
{
	if (!...)
		return vf_migration_disable(...);

	INIT_WORK(..migration..);
}

int xe_sriov_vf_init_early(xe)
{
	vf_migration_init_early(xe);
}


> +
> +	INIT_WORK(&xe->sriov.vf.migration.worker, migration_worker_func);

hmm, this INIT will now be skipped when migration is disabled
but is it safe to do this (it is different than before...)

@Tomek - can you confirm it's ok?

>  }
>  
>  /**
> @@ -302,7 +348,7 @@ static void vf_post_migration_recovery(struct xe_device *xe)
>  	xe_pm_runtime_get(xe);
>  	vf_post_migration_shutdown(xe);
>  
> -	if (!vf_migration_supported(xe)) {
> +	if (!xe_sriov_vf_migration_supported(xe)) {
>  		xe_sriov_err(xe, "migration not supported by this module version\n");
>  		err = -ENOTRECOVERABLE;
>  		goto fail;
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.h b/drivers/gpu/drm/xe/xe_sriov_vf.h
> index 7b8622cff2b7..d6844719ff47 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.h
> @@ -6,9 +6,12 @@
>  #ifndef _XE_SRIOV_VF_H_
>  #define _XE_SRIOV_VF_H_
>  
> +#include <linux/types.h>
> +
>  struct xe_device;
>  
>  void xe_sriov_vf_init_early(struct xe_device *xe);
>  void xe_sriov_vf_start_migration_recovery(struct xe_device *xe);
> +bool xe_sriov_vf_migration_supported(struct xe_device *xe);
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_sriov_vf_types.h
> index 24a873c50c49..8eb4ca9f62de 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf_types.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_types.h
> @@ -35,6 +35,11 @@ struct xe_device_vf {
>  		struct work_struct worker;
>  		/** @migration.gt_flags: Per-GT request flags for VF migration recovery */
>  		unsigned long gt_flags;
> +		/**
> +		 * @migration.disabled: flag indicating if migration support
> +		 * was disabled due to missing prerequisites
> +		 */
> +		bool disabled;
>  	} migration;
>  
>  	/** @ccs: VF CCS state data */


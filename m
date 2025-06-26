Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E92CC77B7F
	for <intel-xe@archiver.kernel.org>; Thu, 26 Jun 2025 06:36:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AF8A10E045;
	Thu, 26 Jun 2025 06:36:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kwygMAqN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B9FB10E045
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Jun 2025 06:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750919765; x=1782455765;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=S/LjFmmdi3h4g9GLzaMx3Cu87NrL5h+zNKSVQsKZm0s=;
 b=kwygMAqNbrAyulLeE8tG7nrRN5BRxUjIeZncGaj5LqoE9Jk3aC0c5GGq
 KL2ryDISbWDUe2Pd+CYIJ+1gcOeqT1VqKix53PbtTrq/SEHoCD3mo4chK
 WmxYI6uDsG/z71bdrRPgwi/GC/KzX2Eh2hRfuVEzi8/g/UNDuvu/WSBx8
 jOVVA2UP1Bra8vQPjhkSYgJ9uDh44OXMp8l48XVnQ1vSgy0aqiSATgYFw
 /IxzUEUgw5TthuLLboaIGVetH+wRxUGaqNoAM4ur/9pZJMk49qPHKIiQi
 LOceSPvCeUk9sAGAUvKiS5SyqBdIp+1XDN+78GqLIjw1uoLuxmQ+aJ6nW Q==;
X-CSE-ConnectionGUID: Urp/8RpxSkG9Ob4mK2K6yQ==
X-CSE-MsgGUID: DbPtZ+yiR0GGULS/xbdfog==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="55829538"
X-IronPort-AV: E=Sophos;i="6.16,266,1744095600"; d="scan'208";a="55829538"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 23:36:00 -0700
X-CSE-ConnectionGUID: W3dXxgMXRtmviaO2Ne3dwQ==
X-CSE-MsgGUID: HBD2ep15QDygaEll+84DMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,266,1744095600"; d="scan'208";a="152597942"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 23:36:00 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 23:35:59 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 25 Jun 2025 23:35:59 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.40)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 23:35:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sv063tjd9Vyc1Do/1K4ww3NSZKQZBpkX4l9VVOvQso2uc5uaPpf9j15nG5Yj4wRUIhCna1m8H2SKEJcpGDFJyOzjPBDK5a9KDra8H+u0BaKrvQyY404edwbOqLUKIpF/3dwlLcA/+BgplO6foVneUSKt63lMJtOD/8liZ7NpbIKLbO09bsecpBXRZchChkUvO1AKWTWnxHhZMG8WtmZWxeIM0OPYR8IGEmSUx6xLFqsTBZM+bHid+ZKytFye5eGmojtlAKkzxgmxYQq14zxy5M4rZh/DIcCRhqb9jWWzJeV3gUQmdDuh4/FYnGqqMQym8zfEEZMF6Hr2upyW3mt9hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=efwDxtrZQy9eXnfGhpK0PqWotWniewEO3S7+oxDSNiI=;
 b=mzdsrEdvj3xtSsThJBAcTbbj67HJWPPH+L48LejsXbriVPCKJHJVFpbwM1Hf5lHVeYQCnELyv3i+dKHvRPKxyDXz0OSNT3Xz5oo7SApSeTXZcH8WR3FwLHfZIVUKTrLWRsc397lJj14obVNe+g5eXksV2QufpJRvpCZ6f5YWH+pQfxuR14WMYP4If+zURySa73FLEMsY6Vlcmsoes+pppo4akrLzbfF41D32LmzxeY0RdxnysN1ZveMn3eOtTEBBlg/wR9NPyyXzMRGULYNKmqCDIYcHZ699krJmT4UZtcDABbELkF7TY2VH8u1K6dLTiv47tIDQxA6ep/dvwnnc5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5249.namprd11.prod.outlook.com (2603:10b6:610:e0::17)
 by PH0PR11MB5109.namprd11.prod.outlook.com (2603:10b6:510:3e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.30; Thu, 26 Jun
 2025 06:35:57 +0000
Received: from CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3]) by CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3%5]) with mapi id 15.20.8880.015; Thu, 26 Jun 2025
 06:35:56 +0000
Message-ID: <2817e1a9-9109-4f4f-90d0-2ee31799dbf1@intel.com>
Date: Thu, 26 Jun 2025 12:05:48 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/2] drm/xe/regs/xe_pmt: Macros for G-State and pcie
 link state residency offset
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>, "Purkait, Soham"
 <soham.purkait@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "Gupta, Anshuman"
 <anshuman.gupta@intel.com>, "Nilawar, Badal" <badal.nilawar@intel.com>,
 "Tauro, Riana" <riana.tauro@intel.com>
CC: "De Marchi, Lucas" <lucas.demarchi@intel.com>, "Dixit, Ashutosh"
 <ashutosh.dixit@intel.com>, "Nikula, Jani" <jani.nikula@intel.com>
References: <20250625143254.3505218-1-soham.purkait@intel.com>
 <20250625143254.3505218-2-soham.purkait@intel.com>
 <CH0PR11MB54441FE7C1243F0C77D1A53FE57BA@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Language: en-GB
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <CH0PR11MB54441FE7C1243F0C77D1A53FE57BA@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0P287CA0008.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::19) To CH0PR11MB5249.namprd11.prod.outlook.com
 (2603:10b6:610:e0::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5249:EE_|PH0PR11MB5109:EE_
X-MS-Office365-Filtering-Correlation-Id: 8109bf86-e80a-4245-bf2a-08ddb47bb46b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|921020|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?emdTbFFVR3BhYnhRdGxlNDdRQktoRkRSaDNmTndyVXRmUnkrdUFvU3FhUkxp?=
 =?utf-8?B?WXBBM0hwZ2REa3VvT1RaRnN3OXRqOU9vYkpoa3hiNnBzM3REVVZFSVQvUE10?=
 =?utf-8?B?VzVybWV1QnhZeHM4Z2F5VmxUTWlnWHl0ZlNpYlVmVWVUWDI4TzMrTiswUy9J?=
 =?utf-8?B?Q0thZ1M1UHhlYXFEbmE4NlMveHR0WlhTU3R2T2pVWG81aU9hVWd1aGNWZmhH?=
 =?utf-8?B?eHU2cnEyUmVHaDFlZnBZRGZnUitZd0g1Wk5iUFpHd3VJL1YxOWRSYnVWVVJI?=
 =?utf-8?B?NlplZmxrY2RrTXNoSWF5Mm0rSmFTRE5CQkZ4MkF4ZjhYWSt3UTM2NVdUN3FL?=
 =?utf-8?B?VHFHTG00cFpPclREUk1wY1Z5QU42ck1lNXhZYVRHQUVWYzR4b3pwOEI0WDBu?=
 =?utf-8?B?L3k1SVMxa29MOHV5anhCcU1mM2svK0tITkJQQ2t0eHB5dGVCTkZKeXJuNksr?=
 =?utf-8?B?ODhuZ1hsVlJ0eExRa1JVR25aMlFRa2FzcStqMU5UQkJnb09jN1dZWUl6UzVr?=
 =?utf-8?B?Ri9BaFljU01oRkhkN1E0OW1DK1FTdG9vU1dFZkNIdUpwUFBRY3NLcXdJbnBF?=
 =?utf-8?B?anhzSStlRHZ2alhsamtDOFA5b2VURko4dkxCbXVtRXpzb3NsQ2RJMEM1dHR1?=
 =?utf-8?B?aWsxVTBYSWZCNjBCZzRYRnJDM3F6anJqL3lVKzBlb0VvYk56TjF2ajR6RmZJ?=
 =?utf-8?B?b1hZTjhhQzNndTZkUm1WR1ZzdkFqTitJS2l2eHFvNUhiTGZmVEhTblNGY3Bp?=
 =?utf-8?B?NVJ0OWxHYnFyYWVTMmFjR3VxZ0xWRDg4U01FSi81ZTlIY2ZRTHV4Yy95Ritk?=
 =?utf-8?B?SlZFOXZ4SXQwdlM5Q1MvRUFJT0NNMzFZMVRMSll1NDROVEI1eCtmQUxuMFpR?=
 =?utf-8?B?cld5a2RBdEU0VEdiRjcwOGt4bW52TjE5cjRteW1jdVNjV0diMVVUdXNTeFBr?=
 =?utf-8?B?Z0luZUJTaW05dXk1ZWVoaUJ5WE4xZFBweVhaVldLNTFUTk1LRmxZZEtRaVBB?=
 =?utf-8?B?TTJtclpJMVdGUkp0aFJSVjlMQjRpTHlxUWNkSFkwL2ZXVHVNN2ZyTnhZbzQv?=
 =?utf-8?B?Kyt3S1ZSSG5ZVkVlZFF3OFA0QmcvSDFNMnJhMHFSNHVZRmZVbTlyNGp3NGtu?=
 =?utf-8?B?anlyUUNqNzJ5QlR1SHpHU21UeWgybWRRaGlTeXM0SExrUExmTVNzbFcyWk5E?=
 =?utf-8?B?eVpNKzFIVUpQd2JKeEp4MnhqdkVnREdocHJvUXFRMHBhaDhLM2lnUFJYdmE0?=
 =?utf-8?B?eG9rb05KMGpkZThza3hDZzg3RWRqV0hURFgxYUV5Y1k4dkxzbXhLRGxkclA2?=
 =?utf-8?B?Tm5lc0ZkUlduakNwSitFNTBUY1QrS3MxcnpOVWpmVWROenFtSGRidDF1eXlM?=
 =?utf-8?B?ckFYR1JRZUkyUDZzOGtIWFZqcWxiNHMzLzJXVzZib29jY3hlVGsrYVNSQys1?=
 =?utf-8?B?VlJLbjF0WWg5cDhYK284VXZDL3huZDkySm0xK05zMGYwWW5GSGsrS3NlZWY5?=
 =?utf-8?B?R0dSQyt3b3FHcXdNMmVqWGYwek1xZjhOM01UelVxZnNPM1FnTkZMZU0yL0E4?=
 =?utf-8?B?aHJzZEZmdzJCTlRLVXcrNUZtcFJieTduVXZoOFFhcDZhOU04encrNzRadktU?=
 =?utf-8?B?MEJ5TWJKaTY0NWtPTFFQVlFqdituTTBFa1lsMGhNN0gxV3M5OE84c0NaSERa?=
 =?utf-8?B?MzRaaktiTW5LWlFwMGVvbVR6aXhFYlFtMUswbjFRampaczQvZHJMdk5NUzFn?=
 =?utf-8?B?RVhET0tDN1M2QzgwRUVjTTl2NlNJZVhWdUhLYUNYUW9EQkYzQmFYQnl4RGFp?=
 =?utf-8?B?aXY3cUdMZlhPbGNXS0xxeXQ1ZHZuakwwSlpOK2hoMFNkU2RkUmN6VVdDYWg1?=
 =?utf-8?B?UTdkb1hpaTZOMndocVI4K0dLYWNEKzRQK0dmWFBZWTloSXFta1RTL1lWSzZD?=
 =?utf-8?B?bG9qd2xXZm4yVDJnNTdGVmQ5Q2Q3UzFjR1I4UFNUeWUzWDdYYVhsdWx0NzFI?=
 =?utf-8?B?a2dHQkdRTXl3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5249.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(921020)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SWVJOExhelc3S1N4NlVCQ1drWVYvdWthR2dMTHBsNG1BanRTRFFDNlFRSk9Q?=
 =?utf-8?B?aWtxMG1VTGxkT2pyZUxpY2FsS1R4bkVRR0gySDJhMU5sRld0VkJiaEtCUnAz?=
 =?utf-8?B?VGlHdEZFclRWck9VRnEwUnliSzRRWDBmQ0NJeGtudklrK1pHL3hTWVkxeXdn?=
 =?utf-8?B?S01QSkJ0L25DNzFzUTRRMkx1NTVBbTlJSEdibVpWTlVQMk91RENXS0lTWEVl?=
 =?utf-8?B?Z3dDdlVvVkEybFU5TGR4aGVyM1NIbzNUVFJNeklNWml6dzk3cGJUMUUzMXhu?=
 =?utf-8?B?RnNYVXNnV2xJRFB6U0pVRTZrZFMvcGk3eC90clYxVkhoL2doaW9tNWtzckFu?=
 =?utf-8?B?bnJhbmlOT01PRDRDZmU3eFRONVMzS2JpTGd2ZHZJemJWYTJlS1pERy9kLzJG?=
 =?utf-8?B?Z2VCcXlhYktFVGxkenRWY3NsVlMrZ2FDL1dYR2dWU04vcHRrZ1IyRVJDM05D?=
 =?utf-8?B?UTAyaW8zK0dVRi9HeGdZRnR1TDFzeXpSdjZwak1CbzZmZVFTcG50Z3htSUJt?=
 =?utf-8?B?SFNIU2FSL2lSa21xWlFyaGVqajZ1OEF3WWtxMkh3T0Q3NU05MGZLRjBkRzJM?=
 =?utf-8?B?TXQrM2FPMmRSM0JJZjluczBQRmtkSThjOUVseFJaUktkT21VOW9BNDRjZy9O?=
 =?utf-8?B?UDJWMU1oZzF6ZEczUjBKZ2VISHRtKzdHSmJ0cWdMejgrVi9mZVIwTDVWZHNq?=
 =?utf-8?B?Nk5NSE83NWYvaG5qQVR1bnNZUFpIUEx6QzBhUjE2RnZFOW1ZaXdRdGtIRUsv?=
 =?utf-8?B?NnRLOEFaK3FXUjZmTGNyL2N2K0JTdkhJeEFzTFJaTEVTbkdkWUhtWkQ1QU5Q?=
 =?utf-8?B?TUFiUFh0THo2bHV0L0hybnU5L3JMZFZNVnlQWkJuck1NWElIbWRFTzFjVGdn?=
 =?utf-8?B?RHdhSnJ3cTRCMjZWM2JMYTRtQnBPZ1ordjA2VG1ML0dubmw2NU9SdUZ0RnBn?=
 =?utf-8?B?T3F5d2owSkxKUEh6aDVFdnFkSGx4WjZaMGFoMFNKSHZUOU1jVkhJV3pWUlJm?=
 =?utf-8?B?bzliVW5Id0xHRHNLSGpaUVVCSGFsQnpDQmltU1NDbnlsbXhvakVPSWgwcFRV?=
 =?utf-8?B?SWt3U3l1Qm9PczI5NUtTOVNqcS9IN2JiazVtQTB5eEtRV2ZoaUFpd0k4WWkr?=
 =?utf-8?B?NGV1cEc0QUpmOEVDSmMxRVNNQ1NvL1A5Zi9nd0hVdkp6Z2ZNN3lFejNPcTk0?=
 =?utf-8?B?aXpDeXlnUWw4YzVFa0I3VkFrQzNPZmFscE5hbHEzUE45UjUraG1hbEg4VGxK?=
 =?utf-8?B?T29MenlMWDgrNTlaNWxKWkVOTzdUelU2cHNxcmRJNzI0d0JkR0hYQU9laXUy?=
 =?utf-8?B?QjFKcEhDNXFWZTdrSW5nZjZ0YnlBQXMvUzBtbE80ektkTzQ4Ylp1dnI2OFl5?=
 =?utf-8?B?WGhRZk5RRW5kZjNjdlRCT0FpVFpPRG5yRW5GQmRxdmhtbnF4SHhIVUk5T0ZF?=
 =?utf-8?B?cU5OL05KaFQwdVhuQ25rVUpQZE45MG1JNzBqandvVVJpc0Yyc1BhbDJwUWxP?=
 =?utf-8?B?L3FCWFNnVVFzVWNoRncza0h2WlFXOW5zdXVWV2oxTkZJb0xBWG51Y0JDNUhN?=
 =?utf-8?B?cHROVTRuc0hHZkE4SGtzWXVQSzVUUzQycGN4MUZtWjBqaEw1RnRWK0hBMVlq?=
 =?utf-8?B?Um5iQW1walhHakx5M1pERkRuRzEraFVpZE5xOEZhZ3J5L040ZFY3RXB1Y0d6?=
 =?utf-8?B?RE5lbnVTZktSZFhGQ3Zrd1Y5YmZTTEVvRHhtaEdxbEQ0UGJ6TjFLVCtyK01H?=
 =?utf-8?B?NWY0M3l1b1ZlQ3h4WTF1OGhNTWJ0bEUrbTIyQUVLcExVYkgxakNjT1dSaksy?=
 =?utf-8?B?dG9CdTJPOVpROWNmVmMrNUM3bk1tcUVDc05RRU1VQ0dhZDJuR3RkOHNlU0hq?=
 =?utf-8?B?ZVFlWUI4eVBFQmp6OG5ObjhlMEZRc21UcVJzYUJnVzJKcEd0ZXAzakJoNTJn?=
 =?utf-8?B?WHhWME4rNFgwZ1ZsMzNzQm1ZWHpNV25aeVFvQy8vNkFURE5HZUp5YUZ4UUNx?=
 =?utf-8?B?ZENxVGIzYTFsckNhbHY0ZXdYK3ZpcUFFZFZiYWFsY0s4SU1Bcm0vVGVJQUhh?=
 =?utf-8?B?YUo1ck5KdTlkVnlxanMxWGxISkdycitwaUFoWlBIa2czS1ZJSGw5ekZQS25W?=
 =?utf-8?B?WC9QNzVFaFV5NUsvYjZpMXpONWVUZDVySW11eWZPZEU1NDZadjNVUmRxSHM0?=
 =?utf-8?B?YVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8109bf86-e80a-4245-bf2a-08ddb47bb46b
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5249.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 06:35:56.1176 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YIRperxXAdwgWh8EJlgidgsV1SFmOxrZHRnb6nWRvqFfCFkZXdfbR4EMrXlP6TKR5uTOhsh9y3j3KWxmT8OO+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5109
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


On 25-06-2025 20:16, Cavitt, Jonathan wrote:
> -----Original Message-----
> From: Purkait, Soham <soham.purkait@intel.com>
> Sent: Wednesday, June 25, 2025 7:33 AM
> To: intel-xe@lists.freedesktop.org; Gupta, Anshuman <anshuman.gupta@intel.com>; Nilawar, Badal <badal.nilawar@intel.com>; Poosa, Karthik <karthik.poosa@intel.com>; Tauro, Riana <riana.tauro@intel.com>; Cavitt, Jonathan <jonathan.cavitt@intel.com>
> Cc: De Marchi, Lucas <lucas.demarchi@intel.com>; Purkait, Soham <soham.purkait@intel.com>; Dixit, Ashutosh <ashutosh.dixit@intel.com>; Nikula, Jani <jani.nikula@intel.com>
> Subject: [PATCH v6 1/2] drm/xe/regs/xe_pmt: Macros for G-State and pcie link state residency offset
>> Add G-State residency and pcie link state residency
>> offset macros for G2, G6, G8, G10, ModS and L0, L1, L1.2
>> respectively.
>>
>> v1:
>>   - Move offset macros to drm/xe/regs/xe_pmt. (Riana)
>> v6:
>>   - Mark MBG to pcie link residency offset. (Anshuman)
> s/MBG/BMG ?

Soham, you can also rephase this as -

Add BMG prefix to PCIe Link state residency counters macros names. (Anshman)

>
> But otherwise:
> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> -Jonathan Cavitt
>
>> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
>> ---
>>   drivers/gpu/drm/xe/regs/xe_pmt.h | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/regs/xe_pmt.h b/drivers/gpu/drm/xe/regs/xe_pmt.h
>> index b0efd9b48d1e..34f5bfdffe46 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_pmt.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_pmt.h
>> @@ -21,4 +21,14 @@
>>   #define SG_REMAP_INDEX1			XE_REG(SOC_BASE + 0x08)
>>   #define   SG_REMAP_BITS			REG_GENMASK(31, 24)
>>   
>> +#define BMG_G2_RESIDENCY_OFFSET			(0x530)
>> +#define BMG_G6_RESIDENCY_OFFSET			(0x538)
>> +#define BMG_G8_RESIDENCY_OFFSET			(0x540)
>> +#define BMG_G10_RESIDENCY_OFFSET		(0x548)
>> +#define BMG_MODS_RESIDENCY_OFFSET		(0x4D0)
>> +
>> +#define BMG_PCIE_LINK_L0_RESIDENCY_OFFSET	(0x570)
>> +#define BMG_PCIE_LINK_L1_RESIDENCY_OFFSET	(0x578)
>> +#define BMG_PCIE_LINK_L1_2_RESIDENCY_OFFSET	(0x580)
>> +
>>   #endif
>> -- 
>> 2.34.1
>>
>>

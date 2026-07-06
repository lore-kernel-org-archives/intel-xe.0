Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC24FC43458
	for <intel-xe@archiver.kernel.org>; Mon,  6 Jul 2026 10:43:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A98A10E8BA;
	Mon,  6 Jul 2026 10:43:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YyPrL7/r";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7788E10E8BA
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Jul 2026 10:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783334603; x=1814870603;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=AX/wKHgIGS/iq3xidgmEbKJQ6kXTLSuZHjrn53IirhU=;
 b=YyPrL7/rx2hpS6xnwCy2l44/xXj7IaAGvNcpp/F2vZbnD14hYbxmP5XA
 y4M9GNOz6HmMElQj7TneVi//NuCZzTiBP6HqDDDNM/cB8pLd4QIoMYINb
 7Jq+vYQfwKOOsAc4s+FWs+8yStPtM2JKet55bLQM0z3R/K47tIDEoq/Gh
 T6BagQhYd4w0fflR2qeAVc6XsZU7ONLiqV3vq+eqvyOvDr+XJRKXsBlcL
 LSgjxcAiNHCGIqN0rb27v/1sfIDEhMyLjX0fOtqSObiW1Avdabr7oWPaA
 +95qCJA2JXDwKKoxNNyeV+c8/3h3DjlakXQRV5YHeM3R0stFRA8T7xpDz Q==;
X-CSE-ConnectionGUID: 8auUuIZHQWCwl8ThnnN/RQ==
X-CSE-MsgGUID: FCBPou/IS5mFDNbBjBva6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11838"; a="95344052"
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; d="scan'208,217";a="95344052"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2026 03:43:22 -0700
X-CSE-ConnectionGUID: 8R+S1TFMRFalczkSdjY5XA==
X-CSE-MsgGUID: pW9dfqB6RkCrdf8MqVUFpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
 d="scan'208,217";a="276899063"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2026 03:43:22 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 6 Jul 2026 03:43:21 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 6 Jul 2026 03:43:21 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.51) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 6 Jul 2026 03:43:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xCTyaf8uNdvOpgo25JQs6o6kRHq6z7M0lO/skenzQzMR1r5ZVwUC5SNKyjKly1t5uCxfklGb8SWKVVJv6w6scb+2X2mrt5Gaps6ubxIbguPCY2eCgTemgCbnuhSQBg5AFDyxomBkc0Emj7KZTgevhGsP5bysz9GbpWLZ1aZDhm+fPQvY4BLRpQlR5dduxyxN1NPue1ND3QLTGZnLsAgqrT1ojHGVK8ZtcL03agT8ter1oDZKZb4o5+iE55cNJhi3m8MGA+l2J6L1mQAVNW8ccFlaD1MNehskXdTdKB2fwVSI+yJ62O0UkIQK9wu0djCThkOz5HYO315VbdMMqxEVfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fD99Eqk3GIk+izjYe56dRGXPZasksik+pm13yuU91OM=;
 b=ge0GKOcDUQdMK3BVJ+SZnD4dxCOz6jSTod74+CWErL3uHaG3FvKZEKk81VnjiBy3ffGxlU1NyDGOomTuzaiFmewO22/ANuWUQbtfHHj1fSmrTPyyB3zbvouqqdYj6fTU5GC6A0NttLpiWkB9Tv6xE4znrHqGSAw7KMnCtU3axtWQ6T8uks46iKqi1r0f2leaiaUHYlGiTloKAtgSO/SP/yFLaVj25pncwRJOJAmNy9KHoIEtG5U/hhGKu3KvBM/pQ+u1LygvlC4ewA6NJ29Y+hEHtMjwUnVyb2/JFuXd5i8WorRhCUXi8oPe5GnVpUk0QaR1nib7R8bOk2+hWKTK/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by CY8PR11MB6916.namprd11.prod.outlook.com (2603:10b6:930:58::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.18; Mon, 6 Jul
 2026 10:43:18 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%5]) with mapi id 15.21.0181.008; Mon, 6 Jul 2026
 10:43:18 +0000
Content-Type: multipart/alternative;
 boundary="------------lcB9M309agNQRyHv4p9Hn58Q"
Message-ID: <2ff28a86-137d-424d-ac2c-fa9d17aa707c@intel.com>
Date: Mon, 6 Jul 2026 16:13:08 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v4 1/5] drm/xe: Add SIG_IDs for RAS error logging
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <matthew.brost@intel.com>, <thomas.hellstrom@linux.intel.com>,
 <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <vinay.belgaumkar@intel.com>, <aravind.iddamsetty@intel.com>,
 <riana.tauro@intel.com>, <karthik.poosa@intel.com>, <sk.anirban@intel.com>
References: <20260630115503.407158-7-mallesh.koujalagi@intel.com>
 <20260630115503.407158-8-mallesh.koujalagi@intel.com>
 <akPR5wZqkPlvsIfY@black.igk.intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <akPR5wZqkPlvsIfY@black.igk.intel.com>
X-ClientProxiedBy: MA5PR01CA0049.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d6::13) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|CY8PR11MB6916:EE_
X-MS-Office365-Filtering-Correlation-Id: 751edc47-c6e6-4c94-cdf9-08dedb4b642e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|6133799003|3023799007|22082099003|4143699003|5023799004|11063799006|8096899003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: LBLWvHXKF1JBpuSQRNnwacTpB6Jt+X6RZLINhWf+9AuIyKJ7UF4mm10JDoE+cyv18y6OnU8+oGK63wweQ0ReepZVz/blZxNTob42BHS2KUeSQk23SmAUR4Ayyl2JLW+C2ygufVJw241rRIRoyAMTuyrrqu0ZOeg5yBrwmMZwmeckaz1fb6dHVq1DjHIpmNnKQSXRW2EnwgNd0VLjBib2jHvg0gyHMioZyvRPwANgS6yplbbKq47W4H/bqo679MInzfkxI0uDu9MUNi9a3+auUTLoMIt6BCYIE0c5zHf9EQOUkDHEr0WHSwrv6Q5/oZIgH4r77V2YJIrY3H6Rta6XeDiOpWfG2yjd5/mPTNJlP009h+MiC7FYaPBer4Pz7pFcTJCvaB6e3rVV+iDQ9AxoJ/oc3YmzFk1YU4Z49si0lRvhjB1XUJGjLc9Q5JyxaIupfMT4Y9MXgHS2HP8Uk4EzEPri81p8gAx4DA8Ocogiec08z8463vhyaQigL+aQ3wOrPAV3J/Et63lIZduRo2nXVhqf1/0OLRM+ZHZjrjQMT0Yo0WJwIDG5TiOdB0tHZjJXOgDmvgPQv0G7dSrEJUOiZTLlKdcX0MnnKOooo7TsoRgHwFv6C5ez78Or9uTfFJaqvuNbV9hPlg2mxcqp2kjmNrb3cRDq3bNiKHVPr7PEh7c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(6133799003)(3023799007)(22082099003)(4143699003)(5023799004)(11063799006)(8096899003)(56012099006)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TllZN05XMXlUTGtva3dTVElZZ1lmcFJLL0dJemRyTGN5ei9uWTRXWG9xa0RH?=
 =?utf-8?B?OWZtNFRwZ0tkcGpxT1VHWU44R2QxYmZlaHZjZzJlaDllWFJPekh2RkVQWW1I?=
 =?utf-8?B?QjFhNEkxdFdUN21NR2xpa01BSmtjaEFhMmRvU0lLOWpRWUdRelhKSFBlb0NF?=
 =?utf-8?B?MEhqQWh5Mmw1ZVQybVZwZjIzdVEvOTh0S3hsNkFtUG9ISnR0b1dIUFpzZFV4?=
 =?utf-8?B?R0xLT05UYy9DRCt0MFlxRWhzMmxVU2thQ0VpSFVpWkk1K0J4VjhIZmEzSkd4?=
 =?utf-8?B?RHZGd0lJZWJBOC94WWVtN2dRRUpiV3lZeVFjaS9SYitTSHo4eWxYWjFCbUxt?=
 =?utf-8?B?VGRwN0xncy8xdnZjTEZIME1LekR5bWY1eXM3d1hWNnJFM0pMMUZWVXBSVXYz?=
 =?utf-8?B?RTYraDl2RWdTN0sxMmNxTDA1bDQyWVZlb1lFemRBWExWVmlFdXpQZ2hZN0JL?=
 =?utf-8?B?cThoa2phSzU1VFFYL0Z1ZmRmaUczSFNqRnFlbTNRVWkxbU13dkswU2hUNzNG?=
 =?utf-8?B?N20rcVhub1h0TVl4VDc0MGJmbW5qdG53SEdLZHV0citGOE4vbERpY2k2RzRy?=
 =?utf-8?B?MS82RnZwdlRzeThZYjcxOUJYbkZiYktXY294c3dla004UmZ1RVc4cGZ1VVB0?=
 =?utf-8?B?eW9VcGo5aGZ5dmNLTXVXS1ozd3J5RTZsdG1oek1VTTNDMGdXRFNxcWZpYzRy?=
 =?utf-8?B?Njk5RXhPR2FBaEY4SmRCZDlTMWRsZEc1SmltYzloWGdWQmNLSWJSSFhFNzVG?=
 =?utf-8?B?V0pIV2hRdFMyZVJIUVl0ZUxpd1pwRjhUWmtkNllhS200dW9kZEVhRHdPWlcr?=
 =?utf-8?B?dlBqajJMTHhVRFh6ZjhDSDNBaCt1WVh4eXpxK1M0VTRNVkVjN2J3eXlQSEFC?=
 =?utf-8?B?NkFIcC9iNFVlMjNCTXFpZVlSU29aM3l3bk0xaG5CRHJ2UzRNZUhOcW5od2VK?=
 =?utf-8?B?cVRwTCtaT2E5STh6S010c3ZGUlJENEVBSmVoZjVjTlVVZzdCVnNEY1pkckZY?=
 =?utf-8?B?QVB6U1VYNkVRb0xMand5V29aM2dLbk1mUU91QmVLRisvZG9mQmg3SisyT1FG?=
 =?utf-8?B?VDJ3d29RdWNRT3ZKcFR0MU5rMFZZUlg3MVQ1MEE5NTBXbVlxNUU5bld0bk1H?=
 =?utf-8?B?SkVBQjloV0pHcnFHMTI3cnlrdjZLeUhLQXo2YW1EQ1Q3U3c2a1R1dmRkbVJE?=
 =?utf-8?B?MUlGcFllSUFIL2FBL1lyd0VYV2FNWERvTHNzS3ZLckJjZzZOUGF4ek5XMVNE?=
 =?utf-8?B?anpvYzBLZGRjY09oamhpaks2MDZlRi9pV1JlWUtrRlcvZWxHSGpaRGY1S3Ew?=
 =?utf-8?B?S1pIMmlkNWNLY1hUODBVWnEyckVqY0NMeTdPY1lmc0dxcFdreGYrbDFjcnFm?=
 =?utf-8?B?Y2VJQUxYUVFmbC94Y2hpM1hYRHJ1NS9RdU5pWUZBUW8zOXlQb296ZHNYTmNK?=
 =?utf-8?B?VncrTCt2VDJ6K2s1TXNLVm5IY2VqQWJKMEdxM0ZhMG1WWVY2NGo2cDJHQlhK?=
 =?utf-8?B?OS9tNFY0aFZTZHB6NTJ0RVhsdnFuRFFEOVQzdFg1QWljd29QbDczYXNiZjYv?=
 =?utf-8?B?NFcrYUM5cktFMUt0bTc3emFKU2REZUFmUGtmZW9rSGMrZFNHNkJIT1hibVVR?=
 =?utf-8?B?YVJ5RE9COTZYWjVkSGxPZmFlamNGL1orZkx4b3E2VXdwaVNtVWVYaFh4dGJE?=
 =?utf-8?B?WDFrQ2w3Q2tEMEphNkxBYytPOHAxcEcxRWlKcGxGaUg5aWl5ajU2WDVrS1BZ?=
 =?utf-8?B?WTkrcUE5cGJsMUt1bjVWK1l4TCs2Y2N6MHE0RnpzNXYzaVZ3UUNSTy9UdXVE?=
 =?utf-8?B?cUI2WTNzay84K05SaSt3OGJ2WmZVKzFjVlgydm55TEpkU0c2WkZwSHJKQWZt?=
 =?utf-8?B?WFVoZS9YR2N0TDZHV20yYjhhWk1aMFlUMXR1VUR4a1JQZTVMV1ZwMTM2cFlo?=
 =?utf-8?B?RElRN0d4QS9BU2xucjN5aVNmRUpGUG5lSUVJSVJ0elZVSkhDdTBZMFY4SzBy?=
 =?utf-8?B?VXdJdVZuQ1VpdkZyVXZwQzBCY1lwRW4rem9KWlVneTVaRFlnU2NEdUJpNXFM?=
 =?utf-8?B?YnpVeEFGYm9uS0djSnhqbzdBYXAzcGxYOHFTZXhzMVdtZHVNREwybHArdXdT?=
 =?utf-8?B?S0VMRFUvTHdKSnNBZURteW1lMlJOdXZIZWtpbHhGM24ya2duTE5UTzkwOFFV?=
 =?utf-8?B?K0xSRk9tSEJCaVgyZTNHRDE0NGZic1ozNSt1dEF5Z0daOEIxYXpRemNxdFc3?=
 =?utf-8?B?QmpVaTJQUEk4cnh6RnZKN3lqT2FwbGtDMTQxSUdCdUR4aUo2aFRIblJSdXJT?=
 =?utf-8?B?Snc0bXJyYlBoelM0OS90M2VVTXF2c3g1LzQwZnB3VUhHZEd4YlljbDhtY1Nh?=
 =?utf-8?Q?DvCp/pGeJXnXjCjM=3D?=
X-Exchange-RoutingPolicyChecked: MYw3otgJcs5kSlz/gRNxfuXQ650HWVRZhJJZBNH8qh6QBYrvMIHL/lcMiBUa/eJKRLXzhLIchoMIww179lRnlqNpo9C/qs8IUy0+n/JJt1i3jnnN+UUFge1Z1F9tuszOQ+am5lNod0zXELRQJuvqgK87cLgiJU5KPxOsdWqfOkt6HaPlRlz4ei/U72yl+2wVGi1i8jeBlOId6d6siA/XrF+nbL+fa5Xjun3LvhQDCH6oUIUg40Fj4Fc0IiLgX8HTO9NfuspqCH3zRV0iR2JRXQHxNEPvHeitDGJ9K3gQT78nvw7YhdZfupKwuATrZz+mOr44hB+RM2kgRjZQ7P5zYw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 751edc47-c6e6-4c94-cdf9-08dedb4b642e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 10:43:18.4812 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 110Jv9JToBZeKBCF69lwi0MrkH/1ARyAAhU8Hi2935VXTjvgFzusgqrWGtXe1NqNa3XGNFKaGja+Icx2HVh8pac9KDbNurgzaCM1WoIAhn0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6916
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

--------------lcB9M309agNQRyHv4p9Hn58Q
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 30-06-2026 07:55 pm, Raag Jadav wrote:
> On Tue, Jun 30, 2026 at 05:25:05PM +0530, Mallesh Koujalagi wrote:
>> Add xe_sig_ids.h which defines a set of stable numeric labels
>> for Xe error categories, called SIG_IDs.
>>
>> Each SIG_ID identifies which subsystem reported an error (e.g. probe,
>> wedged, GT TDR, firmware). It does not encode the full failure details,
>> those come from errno and the free-form message:
>>
>>    SIG_ID  -> which area failed
>>    errno   -> what failed
>>    message -> extra human-readable context
>>
>> Also add a DOC: kernel-doc section covering design rationale, driver
>> severity labels (FATAL/RECOVERABLE), usage guidelines, and the
>> distinction between driver and hardware error paths.
> ...
>
>> +/**
>> + * DOC: SIG_ID Overview
>> + *
>> + * Signature ID (SIG_ID) is a stable numeric identifier (u16) for a defined
>> + * Xe error category - it answers: "which subsystem reported the error?"
> Introducing a new concept is a bit of an uphill battle in itself, not
> because it lacks an explanation but because the explanation often assumes
> that the reader has the same context as the writer and what we end up
> with is a terminology soup that doesn't add much to the understanding :)
>
>> + * SIG_ID format
>> + * =============
>> + *
>> + * Xe error events are emitted as a single structured line using stable fields.
>> + * Driver events use:
>> + *
>> + *   [xe-err] SIG_ID = <u16> Severity = <CPER_SEV_*>
>> + *            Location = <device|tile/gt> Errno = <neg_errno>
>> + *            Message = "<free-form text>"
>> + *
>> + * Hardware-originated RAS events use the same overall format, but typically
>> + * omit Errno and Message and instead report the hardware-derived location /
>> + * error-class information.
>> + *
>> + * Important
>> + * =========
>> + *
>> + * SIG_ID identifies the reporting subsystem/category only. It does not encode
>> + * the detailed failure reason. The detailed reason is carried separately by::
>> + *
>> + *   SIG_ID   -> which subsystem/category failed
> So what exactly is "category" or "subsystem" and what fits the criteria of
> it? In RAS context we have a unique ID attached to all hardware units (which
> we've already defined under xe_ras), so similar to that, what makes a SIG_ID
> unique?
>
> Btw, I'm really unsure if 'probe' or 'wedged' are subsystems ;)

Good point. "Subsystem/category" is imprecise, especially since values 
like probe and wedged are not

subsystems. SIG_ID is the stable top-level identifier for a Xe error 
report. Each top-level error reporting family

has an unique SIG_ID number. I'll reword the comment to make that explicit.

>> + *   Severity -> how serious the event is
>> + *   Errno    -> what failed (driver events)
>> + *   Message  -> human-readable context
>> + *
>> + * Example (driver event)
> In Linux world these are not events, so I'd try to find a better terminology
> (and in all other places where applicable).
Agreed. I'll change event to error report.
>
>> + * ======================
>> + *
>> + *   [xe-err] SIG_ID = 6 Severity = CPER_SEV_RECOVERABLE
>> + *   Location = tile0/gt0 Errno = -5
>> + *   Message = "Engine 'rcs0' hung; TDR triggered, engine reset succeeded"
>> + *
>> + * In the example
>> + * ==============
>> + *
>> + *   SIG_ID 6   = XE GT/TDR category
>> + *   RECOVERABLE = workload impacted, device still operational
>> + *   -5         = Linux errno (-EIO)
>> + *   Message    = extra context for triage
>> + *
>> + * Why SIG_ID exists?
>> + * ==================
>> + *
>> + * The goal is to replace inconsistent ad-hoc error strings with a small
>> + * set of stable, structured error events that are easier for operators
>> + * and tools to understand. Each driver event carries a fixed SIG_ID with
>> + * a severity determined by its error category, and structured output that
>> + * can be consumed consistently across driver or firmware versions. It
>> + * reduces guesswork during triage and allows machine parsing of important
>> + * fault events.
> Okay so the problem statement is good enough but let's say the tools actually
> parse these IDs, what do you expect the outcome of the parsing to be? What
> will the results be used for?
>
> I understand the telemetry aspect, but if the expectation is to perform a
> "certain recovery procedure" based on the ID, wouldn't it be more intuitive
> to just define the IDs based on procedure itself?

The purpose of parsing SIG_ID is to classify a reported Xe error into a 
stable

top-level family so tools can bucket, aggregate , alert etc. The parsed 
result combined

with severity and detailed fields to decide what action, if any, is 
appropriate.

SIG_ID should identify the kind of error, not the recovery action, 
because recovery actions can change over time.

>> + * Driver severity labels
>> + * ======================
>> + *
>> + * FATAL means the device cannot continue operation (e.g. probe failure,
>> + * device wedged). RECOVERABLE means the driver encountered an error but
>> + * may continue with degraded functionality.
>> + *
>> + * When to use the xe_ras_log helpers (see xe_ras_log.h)
>> + * =====================================================
>> + *
>> + * Use them only for defined Xe error events that belong to the published
>> + * error categories. These helpers are intended for important fault paths
>> + * such as probe failure, wedged device, survivability mode, firmware
>> + * failures, GT hang/TDR/reset, memory faults, and runtime IO/bus faults.
>> + * The selected macro fixes the SIG_ID and severity for that category.
>> + *
>> + * Do not use xe_ras_log helpers for all logs
>> + * ==========================================
>> + *
>> + * These helpers are not a replacement for normal drm_info(), drm_dbg(),
>> + * tracing, or one-off diagnostics. They are for stable, structured error
>> + * reporting only. Using them for ordinary logs would dilute the error
>> + * stream and make operator-facing fault reporting noisy and less useful.
>> + *
>> + * Hardware errors
>> + * ===============
>> + *
>> + * Hardware errors are hardware-reported RAS events and map to the
>> + * XE_SIG_HW_* identifiers. They are reported through the hardware error
>> + * path (e.g. CPER records), not through the driver xe_ras_log helpers.
>> + *
>> + * Unlike driver xe_ras_log helpers, hardware events do not have one fixed
>> + * severity per SIG_ID. For example, a fabric event (XE_SIG_HW_FABRIC) may
>> + * be reported as CPER_SEV_CORRECTED, CPER_SEV_FATAL, CPER_SEV_RECOVERABLE,
>> + * or CPER_SEV_INFORMATIONAL, depending on what the hardware reported.
>> + */
>> +
>> +/*
>> + * Driver errors: SIG_IDs
>> + */
>> +#define XE_SIG_PROBE			1  /* FATAL: probe failed */
>> +#define XE_SIG_WEDGED			2  /* FATAL: device wedged */
>> +#define XE_SIG_SURVIVABILITY		3  /* FATAL: survivability mode */
>> +#define XE_SIG_RUNTIME_FW		4  /* RECOVERABLE: GuC/HuC/UC/GSC */
>> +#define XE_SIG_DEVICE_FW		5  /* RECOVERABLE: PCODE/CSC/System controller */
>> +#define XE_SIG_GT_TDR			6  /* RECOVERABLE: engine hang / reset */
>> +#define XE_SIG_MEM_FAULT		7  /* RECOVERABLE: VM bind, page fault, GTT */
>> +#define XE_SIG_IO_BUS			8  /* RECOVERABLE: runtime PCIe/IOMMU/MMIO */
> Many of the above actually overlap, for example boottime survivability or
> firmware load failure will result in probe failure, while runtime survivability
> or GT reset failure will result in wedging. So which ID is exactly applicable
> in those cases and how does it help the usecase here?

The intent is to use SIG_ID for the specific error report being emitted. 
For example

Bootime survivability failure during probe should use the 
XE_SIG_SURVIVABILITY, XE_SIG_PROBE like

chain of failure which will report all and help to triage.

>> +/*
>> + * Hardware errors: SIG_IDs
>> + */
>> +#define XE_SIG_HW_DEVICE_MEMORY		9  /* Device memory errors */
>> +#define XE_SIG_HW_CORE_COMPUTE		10 /* Compute/shader core errors */
>> +#define XE_SIG_HW_PCIE			11 /* PCIe interface errors */
>> +#define XE_SIG_HW_FABRIC		12 /* Fabric errors */
>> +#define XE_SIG_HW_SOC_INTERNAL		13 /* SoC-internal errors */
> So is this to be reused in CPER or is that its own thing?

Hardware SIG_IDs are used alonside CPER, not instead of it.

SIG_ID provides a stable top-level Xe error reporting family, while CPER 
remains the source of

detailed hardware component/type/cause information.

Thanks,

-/Mallesh


>
> Confused :(
>
> Raag
>
>> +#endif /* _XE_SIG_IDS_H_ */
>> -- 
>> 2.34.1
>>
--------------lcB9M309agNQRyHv4p9Hn58Q
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 30-06-2026 07:55 pm, Raag Jadav
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:akPR5wZqkPlvsIfY@black.igk.intel.com">
      <pre wrap="" class="moz-quote-pre">On Tue, Jun 30, 2026 at 05:25:05PM +0530, Mallesh Koujalagi wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Add xe_sig_ids.h which defines a set of stable numeric labels
for Xe error categories, called SIG_IDs.

Each SIG_ID identifies which subsystem reported an error (e.g. probe,
wedged, GT TDR, firmware). It does not encode the full failure details,
those come from errno and the free-form message:

  SIG_ID  -&gt; which area failed
  errno   -&gt; what failed
  message -&gt; extra human-readable context

Also add a DOC: kernel-doc section covering design rationale, driver
severity labels (FATAL/RECOVERABLE), usage guidelines, and the
distinction between driver and hardware error paths.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
...

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+/**
+ * DOC: SIG_ID Overview
+ *
+ * Signature ID (SIG_ID) is a stable numeric identifier (u16) for a defined
+ * Xe error category - it answers: &quot;which subsystem reported the error?&quot;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Introducing a new concept is a bit of an uphill battle in itself, not
because it lacks an explanation but because the explanation often assumes
that the reader has the same context as the writer and what we end up
with is a terminology soup that doesn't add much to the understanding :)

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+ * SIG_ID format
+ * =============
+ *
+ * Xe error events are emitted as a single structured line using stable fields.
+ * Driver events use:
+ *
+ *   [xe-err] SIG_ID = &lt;u16&gt; Severity = &lt;CPER_SEV_*&gt;
+ *            Location = &lt;device|tile/gt&gt; Errno = &lt;neg_errno&gt;
+ *            Message = &quot;&lt;free-form text&gt;&quot;
+ *
+ * Hardware-originated RAS events use the same overall format, but typically
+ * omit Errno and Message and instead report the hardware-derived location /
+ * error-class information.
+ *
+ * Important
+ * =========
+ *
+ * SIG_ID identifies the reporting subsystem/category only. It does not encode
+ * the detailed failure reason. The detailed reason is carried separately by::
+ *
+ *   SIG_ID   -&gt; which subsystem/category failed
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
So what exactly is &quot;category&quot; or &quot;subsystem&quot; and what fits the criteria of
it? In RAS context we have a unique ID attached to all hardware units (which
we've already defined under xe_ras), so similar to that, what makes a SIG_ID
unique?

Btw, I'm really unsure if 'probe' or 'wedged' are subsystems ;)
</pre>
    </blockquote>
    <p>Good point. &quot;Subsystem/category&quot; is imprecise, especially since
      values like probe and wedged are not</p>
    <p>subsystems. SIG_ID is the stable top-level identifier for a Xe
      error report. Each top-level error reporting family</p>
    <p>has an unique SIG_ID number. I'll reword the comment to make that
      explicit.&nbsp;</p>
    <blockquote type="cite" cite="mid:akPR5wZqkPlvsIfY@black.igk.intel.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+ *   Severity -&gt; how serious the event is
+ *   Errno    -&gt; what failed (driver events)
+ *   Message  -&gt; human-readable context
+ *
+ * Example (driver event)
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
In Linux world these are not events, so I'd try to find a better terminology
(and in all other places where applicable).</pre>
    </blockquote>
    Agreed. I'll change event to error report.
    <blockquote type="cite" cite="mid:akPR5wZqkPlvsIfY@black.igk.intel.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+ * ======================
+ *
+ *   [xe-err] SIG_ID = 6 Severity = CPER_SEV_RECOVERABLE
+ *   Location = tile0/gt0 Errno = -5
+ *   Message = &quot;Engine 'rcs0' hung; TDR triggered, engine reset succeeded&quot;
+ *
+ * In the example
+ * ==============
+ *
+ *   SIG_ID 6   = XE GT/TDR category
+ *   RECOVERABLE = workload impacted, device still operational
+ *   -5         = Linux errno (-EIO)
+ *   Message    = extra context for triage
+ *
+ * Why SIG_ID exists?
+ * ==================
+ *
+ * The goal is to replace inconsistent ad-hoc error strings with a small
+ * set of stable, structured error events that are easier for operators
+ * and tools to understand. Each driver event carries a fixed SIG_ID with
+ * a severity determined by its error category, and structured output that
+ * can be consumed consistently across driver or firmware versions. It
+ * reduces guesswork during triage and allows machine parsing of important
+ * fault events.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Okay so the problem statement is good enough but let's say the tools actually
parse these IDs, what do you expect the outcome of the parsing to be? What
will the results be used for?

I understand the telemetry aspect, but if the expectation is to perform a
&quot;certain recovery procedure&quot; based on the ID, wouldn't it be more intuitive
to just define the IDs based on procedure itself?
</pre>
    </blockquote>
    <p>The purpose of parsing SIG_ID is to classify a reported Xe error
      into a stable&nbsp;</p>
    <p>top-level family so tools can bucket, aggregate , alert etc. The
      parsed result combined</p>
    <p>with severity and detailed fields to decide what action, if any,
      is appropriate.</p>
    <p>SIG_ID should identify the kind of error, not the recovery
      action, because recovery actions can change over time.</p>
    <blockquote type="cite" cite="mid:akPR5wZqkPlvsIfY@black.igk.intel.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+ * Driver severity labels
+ * ======================
+ *
+ * FATAL means the device cannot continue operation (e.g. probe failure,
+ * device wedged). RECOVERABLE means the driver encountered an error but
+ * may continue with degraded functionality.
+ *
+ * When to use the xe_ras_log helpers (see xe_ras_log.h)
+ * =====================================================
+ *
+ * Use them only for defined Xe error events that belong to the published
+ * error categories. These helpers are intended for important fault paths
+ * such as probe failure, wedged device, survivability mode, firmware
+ * failures, GT hang/TDR/reset, memory faults, and runtime IO/bus faults.
+ * The selected macro fixes the SIG_ID and severity for that category.
+ *
+ * Do not use xe_ras_log helpers for all logs
+ * ==========================================
+ *
+ * These helpers are not a replacement for normal drm_info(), drm_dbg(),
+ * tracing, or one-off diagnostics. They are for stable, structured error
+ * reporting only. Using them for ordinary logs would dilute the error
+ * stream and make operator-facing fault reporting noisy and less useful.
+ *
+ * Hardware errors
+ * ===============
+ *
+ * Hardware errors are hardware-reported RAS events and map to the
+ * XE_SIG_HW_* identifiers. They are reported through the hardware error
+ * path (e.g. CPER records), not through the driver xe_ras_log helpers.
+ *
+ * Unlike driver xe_ras_log helpers, hardware events do not have one fixed
+ * severity per SIG_ID. For example, a fabric event (XE_SIG_HW_FABRIC) may
+ * be reported as CPER_SEV_CORRECTED, CPER_SEV_FATAL, CPER_SEV_RECOVERABLE,
+ * or CPER_SEV_INFORMATIONAL, depending on what the hardware reported.
+ */
+
+/*
+ * Driver errors: SIG_IDs
+ */
+#define XE_SIG_PROBE			1  /* FATAL: probe failed */
+#define XE_SIG_WEDGED			2  /* FATAL: device wedged */
+#define XE_SIG_SURVIVABILITY		3  /* FATAL: survivability mode */
+#define XE_SIG_RUNTIME_FW		4  /* RECOVERABLE: GuC/HuC/UC/GSC */
+#define XE_SIG_DEVICE_FW		5  /* RECOVERABLE: PCODE/CSC/System controller */
+#define XE_SIG_GT_TDR			6  /* RECOVERABLE: engine hang / reset */
+#define XE_SIG_MEM_FAULT		7  /* RECOVERABLE: VM bind, page fault, GTT */
+#define XE_SIG_IO_BUS			8  /* RECOVERABLE: runtime PCIe/IOMMU/MMIO */
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Many of the above actually overlap, for example boottime survivability or
firmware load failure will result in probe failure, while runtime survivability
or GT reset failure will result in wedging. So which ID is exactly applicable
in those cases and how does it help the usecase here?
</pre>
    </blockquote>
    <p>The intent is to use SIG_ID for the specific error report being
      emitted. For example</p>
    <p>Bootime&nbsp;<span style="white-space: pre-wrap">survivability </span>failure
      during probe should use the&nbsp;<span style="white-space: pre-wrap">XE_SIG_SURVIVABILITY, </span><span style="white-space: pre-wrap">XE_SIG_PROBE like</span></p>
    <p><span style="white-space: pre-wrap">chain of failure which will report all and help to triage.</span></p>
    <blockquote type="cite" cite="mid:akPR5wZqkPlvsIfY@black.igk.intel.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+/*
+ * Hardware errors: SIG_IDs
+ */
+#define XE_SIG_HW_DEVICE_MEMORY		9  /* Device memory errors */
+#define XE_SIG_HW_CORE_COMPUTE		10 /* Compute/shader core errors */
+#define XE_SIG_HW_PCIE			11 /* PCIe interface errors */
+#define XE_SIG_HW_FABRIC		12 /* Fabric errors */
+#define XE_SIG_HW_SOC_INTERNAL		13 /* SoC-internal errors */
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
So is this to be reused in CPER or is that its own thing?</pre>
    </blockquote>
    <p>Hardware SIG_IDs are used alonside CPER, not instead of it.</p>
    <p>SIG_ID provides a stable top-level Xe error reporting family,
      while CPER remains the source of</p>
    <p>detailed hardware component/type/cause information.</p>
    <p>Thanks,</p>
    <p>-/Mallesh</p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:akPR5wZqkPlvsIfY@black.igk.intel.com">
      <pre wrap="" class="moz-quote-pre">

Confused :(

Raag

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+#endif /* _XE_SIG_IDS_H_ */
-- 
2.34.1

</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------lcB9M309agNQRyHv4p9Hn58Q--

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5602C71157
	for <intel-xe@archiver.kernel.org>; Tue, 17 Jun 2025 12:03:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A220010E60D;
	Tue, 17 Jun 2025 12:03:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mp/ATQqc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CCBA10E60D
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Jun 2025 12:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750161834; x=1781697834;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=EUqv8NOuMjhuAO7ZFGKA5SX6PUQcUyRxoveZBKzSFa4=;
 b=Mp/ATQqcL1afuBPsv2042SiW+KSgWRyyFcLFglILoMMru07dXONNmw+D
 02v5QNy7SQq1GO/z0to5xanF2XajkE5k5Fgxc0HcbSvA1x7b/dv91kfKQ
 uE4e7zNLG3tTa+Rpa5fhIBDxOSIQfRPf2MJ5eIrhEmlX42Hd9LRkQb2JX
 WSkLPfQHtnSurx61nuDG+ZrwtWIxpuEUdJ45cHRp8AYX5t1TUq/6s6kMn
 8dSYeQs6sbzr5DquOS0TYE3RvJ927sv+yah9KOrLDJAbCBKwXUC47SCz6
 EK2WIvXwCgGjqFJOTgaAgT/Yck+6TP+rAV8Se0ndEx5L7FrwC2jD/d/6m A==;
X-CSE-ConnectionGUID: 80TV6I9sSvK3v7fAhlaVFw==
X-CSE-MsgGUID: k7eYLXQ5To6CF98UxAJ5Gw==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="69907555"
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; d="scan'208";a="69907555"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 05:03:17 -0700
X-CSE-ConnectionGUID: amUWnGE+T7eISWOjvB+BLA==
X-CSE-MsgGUID: Np2mr18ZTeWisXz19ukT8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; d="scan'208";a="154052916"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 05:03:18 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 17 Jun 2025 05:03:16 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 17 Jun 2025 05:03:16 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.41)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 17 Jun 2025 05:03:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lD+ao0O5yklhNRpXW8xt8Guk4O4B4KmrXtt8cihn38GxYAaRakzyzPQTZ0Ix0j4so+E4HwOgjZKgiksLDYTUu1OWYwdyPKpZ+ET+UY7X5milgwZISlMcaqh/7litho+3HZOTLBMG9iZBjyZf0Jib8wdt1DhixRrllTYbl+JI+DIZlWPDbwfcKUK6YXIK08DgNNmoBpiKrZFmRxbMzdGI/YAndMf3fBjcigUnhAzwKfiLKK61kBPSTS6OoxXTfvp5QOz0I8LgFrN7IVV++g3NfoVyaou2c+WayGdrZLLaH55rvvk6QO/auZdTWhs2HuIaQaJHCkb5ER85/OjDb8zZ2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2PLX1aC1H6SLecaD9mbGK8fhEC1u+8t3IGq6uOYoULY=;
 b=DEwumZyUZOefrqmfrqZK1tgmmSj47rjGZfQQRqR4M+qx3is+Sd+mr+PlsiDu6EkVZSUcpVyUAFinN7APwzMz3KYMQfNjdlM5kdIUUn+wwMAx0BpYIOj3cNhGFnhwmPu2fL3N6aAnQtRlcN8mLZTqmwggfJJsswd2Xqg2Me9aAh0fQFs1v0Mh/1+nuohw1L9auELxfgdZgRh63EnazAySG+CraUvWCAp8V/usKjvUM3ZxMBjMd3bQyo0mK2063JZQLaywvBxtKBdvBUEMb7iM17Qp4+75D7Y4x5eOjJ6yQAxtNt5JkbDRs1LUr6ZUeFBYSjWetCGerjHvSPMWqF0TWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by SJ5PPF0DADD6EFE.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::80d) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Tue, 17 Jun
 2025 12:03:14 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%5]) with mapi id 15.20.8857.016; Tue, 17 Jun 2025
 12:03:14 +0000
Message-ID: <bfd221a9-76a4-4ca8-9502-46ecb8408862@intel.com>
Date: Tue, 17 Jun 2025 17:33:06 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] drm/xe/hwmon: Fix xe_hwmon_power_max_write
To: Karthik Poosa <karthik.poosa@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <riana.tauro@intel.com>
References: <20250617120030.612819-1-karthik.poosa@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20250617120030.612819-1-karthik.poosa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: OS3P286CA0126.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:1f7::12) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|SJ5PPF0DADD6EFE:EE_
X-MS-Office365-Filtering-Correlation-Id: 938be456-f405-4c97-92ff-08ddad96efea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UStMZ0IzcC9yalQ1eW1ROG5OZi9ydFpxRjV6cEhjS0NuU1p0OFhjZSt3VE5J?=
 =?utf-8?B?R2ltUXZlMWd3SzYxMGd1eVNLWlVHd3BmMXBLRFV4S0hzbVMyQUZSWC9hRDFU?=
 =?utf-8?B?TkZGNm9lWmkyZ0lmOVZRcEdtYm5HVWNEZXJpWlBRMWl0dzkrSjIzaDRKSWRv?=
 =?utf-8?B?RmliSFJnMER2SmlsOWFRNDFsbjBkZDIvTllNUWtZRW15MndtVU1pbFBwYmNy?=
 =?utf-8?B?M21STEJKeUc0Wlg5M1lnUUZ4WDVZTWhRa041VlQ5UHBGNTRRR1dKMTFESkFB?=
 =?utf-8?B?Y3ZoR3phZjM5Yjk1MmpteklvYk82NFY5MS8wVVdIaTBPaDcvUTJ3ZGl0T0xG?=
 =?utf-8?B?Q0IzU0pxUzdCSXJITzlDM1lIZXN2SklmcWIra2xtVFdHMnBHL29vODdJSUZi?=
 =?utf-8?B?WjVpSC9idk1MVVNZOE42aGJabWNwVklCNUk5aFhLblRRTzZNU0x6eFVRbkJE?=
 =?utf-8?B?TzhYMU1SalovSkwySVJQWW5NUTlSS2xQTlNKcTh0Ym1FazJVSWdld1NMUWNy?=
 =?utf-8?B?cnl1ZFdaVWFMZFFORFdBYnAvVEtWdS82aDVjb05mTzF2WEJHd1JsVVBzaU52?=
 =?utf-8?B?NkplelQzZ01hanI3cTh1cytOQVltWXNpeUU2eVRpeXlLbU81V0V5b1lYZ0xK?=
 =?utf-8?B?bGFWYldydTgwUTZLOW96aGRBS3Y5UXdQOXVTR2FOVWY1eGVFZFhOM0VNWENT?=
 =?utf-8?B?YlhpNFF1dUtrRHZTVFNlSFp0STdOUlFUdk1TT2xCUVdUaThTeWhpVExCLzI0?=
 =?utf-8?B?YlZwWEZZN1gxRE5WZ09KQ2J1elF3eTk4TWZsYk9qOWJhMHZQSnAwaFlHSnla?=
 =?utf-8?B?Ti8xVWh5dkpsMFFoOVNEb1kyQngxV0diTHlMZ0VHWTRmeEgyNVczV0RwQWt6?=
 =?utf-8?B?NjFRNVNRZXBYclBPOHQ0VnhqalRBbEpaWTZGbzUweWp3aHc1U0tzMUh6SFZh?=
 =?utf-8?B?QVhZVEFnTFQram9EbHE2VGRLOGR4d1dkVjVYREFPNjAyUzBPbmt1QkgySW5n?=
 =?utf-8?B?SU55eXlKd1cyQVRscnJsd1JUZWpER1lGaWg2L2RDTW4vWHFGVWczYS9xNElF?=
 =?utf-8?B?UGI5K1gwMm9nTmJMNzhhZ1hWRXdhc21IS2w2QkVPdHgzdStqT3Jnamp3eVlW?=
 =?utf-8?B?YmpWZTcrNERacDFWWk9QWXBraDVZSkxhOExMVXRFRDRvajlwc1lySDRDaDlT?=
 =?utf-8?B?eitiM3dGczkxREpiWHJ0Wlk3ZG41Tm1TcFlUSy83THNib1BtVGd4NWMwaWhY?=
 =?utf-8?B?TXRMYXJvb1I3Q0xvQXZBM0ZBMkhDaGswMWljWkRObEJKa2MzUEtmbk5CUDkx?=
 =?utf-8?B?UzNlNS9ESlNOc2E1T2s0UGhpa2Rmc2djbTAzc1dtUHdmUUVEQmxxS0dxZkZ3?=
 =?utf-8?B?NzhYaExlamlOaU9qT1hXZXpmVmRkVWhBT3pxcEFEM1ZQTTgrTzFrQmIzZmtl?=
 =?utf-8?B?b3pOdkRvVnZ5QTZFTVJHK3JQSE9DalZZU0JUUmNGdHFtWjdWYnlVVnhrU255?=
 =?utf-8?B?V1NhTFpqb2pkT0RUcWxYRkQ2WGdqSE9jSVRFTXh3dzlLeisxZ01jcVowb0hJ?=
 =?utf-8?B?cUJ1cTFVckJJdXVGaHVDNGNjaDdPZTRsd0tXUXVPWXZiRFR4NG9raHRDZ0ZK?=
 =?utf-8?B?KzU3eDFaKzRpUW5rNGc2UEt5KzZhdWtpK3F3cEdmMGZaNFpDRTk3bm1yY1RU?=
 =?utf-8?B?OEZuQWYzcDJ0bmRXYWprUW9XVkVXRmxjVUV2aDhsTkIxWW13aGxMdzNiRy9S?=
 =?utf-8?B?bFRkbWNpZUh3WGhwRTJtWUFqenpFTzJhVDdWbm01YzE3cktzS3A2RktMM2V6?=
 =?utf-8?B?dnBPbFdqcmp6YVVpMHNSV0JaeDRqb3B5dHdJcVYwRTl2TVdNR2VFeWZGa1lX?=
 =?utf-8?B?clJOSitMRG5LTFc2cGIvejllQVNGVmY5TDEyOXJ1d09VbE03MFd4NVdJeHAv?=
 =?utf-8?Q?W+rbu1jGnKg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SGRaZk5HRzRFd29sSGxrWXl0U2pvTEFodEVKclFQY290SWV6V2daMXlUM1ZL?=
 =?utf-8?B?bHVkemJ1aldySlBOTmxrOXV6WmNUZExqSlVmY2ZKZnh1THBCOTlrSEd5ODlF?=
 =?utf-8?B?M3JYTFR6ck9WOVhPV1FZQjFOYjFKaUgrWDZVV3h4aHFYOFZZR0k2S00yN2tp?=
 =?utf-8?B?S3BXVCt6Y3RRTDFERWFDWWliai9kejhBNjVqQ2tyelMwd0RIVXFRMnYwcFlZ?=
 =?utf-8?B?dEN3ZkM0VmVNTXJvZkQyeHlxL1VQZHlPdXlpNmE0WHhPS09FVld1ZVFnQXJI?=
 =?utf-8?B?L3JZeldlZXVVdkc4dVlTYllzOUpraVA2WHZRTm4zbFJDRGFEdVFOSmZNZHBP?=
 =?utf-8?B?ZmRiRTZJS1BvZ2Nqd0tjTUlJT3BzR0VWZHJ3UkYyYldyK0FySjlWTlZtRnVw?=
 =?utf-8?B?dDhLTFlPN2RuZStLdXZ6OXk2N0lnd0JJM0sxMDkxaUhNZWVmSWpIMDZXSVhj?=
 =?utf-8?B?WXVkeGh0ODBGSmxLTXhpTjd2MzFVUWhFSW9RVFZYMnU3RTVnV1p1OWNqVXlB?=
 =?utf-8?B?eG5xSmN0MFdudC9qWkI3RzZjODVQNUhhazRqcFBWWWhoQU9wSWhWeTkxdlN3?=
 =?utf-8?B?ajkxQmlvNlppdUxwWk1nd3Z1YjNzaUgvK3loNTNTdlBIT1h4QkNpVkl4NURQ?=
 =?utf-8?B?cm5nbFN5aGVMZDdib2xobTI5Z3pYTjRONnd6U0JCZS9ZYXljeHQ0VGNHMVk5?=
 =?utf-8?B?WGJHZ2ozMmhETFFLNnlnY3MzSEpwcndPano1WlArL01OK0ZoR3NIVXRndThu?=
 =?utf-8?B?N1BrUyttQUw3MGkrSE1EdkZPNm1DYWxxSnBhVmc4TnNkeFFIN0dRRHV0Q21K?=
 =?utf-8?B?bzhQZS8ycFFMN2s5ait2VERWNGV4M0lXZk40bUJRTUFKbENYV2NYbzZoUmVS?=
 =?utf-8?B?OGtJcmlBN09nYTBTUEtNWEpIeUpoN2YvNVNDandmUElPSzNLMmIxbGpjUmVp?=
 =?utf-8?B?N3grb1Y4Z0Mrd3ZSS2dObVNNcHlRc0krcHN1b2xDbHYvRkNYOElCNVk5UlFu?=
 =?utf-8?B?eEovSis3KzZtTFFBRXlrbGlrY3lDRm84R2pjdmlWenJMZzNDclFvSXFLNnp5?=
 =?utf-8?B?ZEhDUlpuczRMYW5DMjBGUTNKT2ZnZEJMR2IwU0NTY0oyNW14VEdTUW50MDZI?=
 =?utf-8?B?V1h3VjZNWkV5d1lpUjhEUlRMY0FBanRJdWpNWjUvbXZ2elJKS0QrbzBmeW91?=
 =?utf-8?B?eXBBeGVaU2tKMXA0UTdSSmNDaUdUdFBjaHl0YVRZRzRrbk1CU0VFeitPOCtX?=
 =?utf-8?B?Q3VFUUdiRHlFNysraEhVNkwzT0VlRmZ2V1FsTmUyQjZJRjQwZ2lXUHdrTVRD?=
 =?utf-8?B?Q3Rjd0hybnlheEp4V3hHSlFKYzZ0djB4N0xYakhIbDV1WHdZWGs2dTY2WHBN?=
 =?utf-8?B?dGtuWmtvVzhpbDQwMHZSN3JEMU1IVnVncDZETC9OeE16Qm5xZmxUKzlVWjdP?=
 =?utf-8?B?ZElmLzljZ2tMcStXT0g4S3JBN3prK1VpRDAvM2NueTFxcEU4cWttU2NCaG9j?=
 =?utf-8?B?b2hYOTh0VE9VMCtOa3JEYk9NMm9VaGs2VDk5VE9DMndCYjVXdkpISkJIT2tJ?=
 =?utf-8?B?WkhYTkh4RXA0bG5sWWFjbHY1clJHa05xVElJY0hra1hWZEQxN2p3VFh6YnV4?=
 =?utf-8?B?QjFaTUx0NnBVMTBFZHF0SmR3SU9xT1N0ck94RVY4RzJVbXRUOWphYWx1SXA5?=
 =?utf-8?B?b01Pc3g2S2N0cjg0Q1c1OXkrajEyVHcvUXd0bllvRWFCRnNXWjBUbHZGYkhW?=
 =?utf-8?B?QVVxa1p5R1VUcGQxc1plZlJkT1RUTVNMT3JhRWZndis4aXZQNjRDZXQzTlV3?=
 =?utf-8?B?V3VVa2lpUWZpYWdua0xtVWNDT2dGOVp1SkdxdkhHNFg1ZXBMZWNVTzE3a1k0?=
 =?utf-8?B?ODNyd3VYOUJEbFVnTFk1emNsTzM3WjA0eGpscjkxOW9PTTNsNk9Mbkg1SjN3?=
 =?utf-8?B?R1dGckFjUTBCRW9ZS0Z4WUxkaStjdjNmSE1hcTM1U1luQW5aaWJhQkVqZjkw?=
 =?utf-8?B?NDNrVTZuOFdwa1JjQWNFRDZiMmVVRkZkNmJubTZyQTRnNUc2UzUxUmdxQkdP?=
 =?utf-8?B?OUhiak1xMTB1b0ttNndOVzJTTVZKVTJSLzNuSjd1RE1BR1ZnRzRuRko4WG8v?=
 =?utf-8?B?N1NwaFpQYzVwS2ljZTVnMzhIeHhEYWQ5UmpRK0h2RmxuRng5WE02ZWw2TC9s?=
 =?utf-8?B?b3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 938be456-f405-4c97-92ff-08ddad96efea
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 12:03:14.1560 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WJLlkw4LLUDcfMTf+jOzRzLphGvqX1nYle6q3NlrIH5+MQoI+idojGj50a3fR7bV3dW4P6hHjEJ1v6G5py5KYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF0DADD6EFE
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


On 17-06-2025 17:30, Karthik Poosa wrote:
> Prevent other bits of mailbox power limit from being overwritten with 0.
> This issue was due to a missing read and modify of current power limit,
> before setting a requested mailbox power limit, which is added in this
> patch.
>
> v2:
>   - Improve commit message. (Anshuman)
>
> v3:
>   - Rebase.
>   - Rephrase commit message. (Riana)
>   - Add read-modify-write variant of xe_hwmon_pcode_write_power_limit()
>     i.e. xe_hwmon_pcode_rmw_power_limit(). (Badal)
>   - Use xe_hwmon_pcode_rmw_power_limit() to set mailbox power limits.
>   - Remove xe_hwmon_pcode_write_power_limit() as all mailbox power limits
>     writes use xe_hwmon_pcode_rmw_power_limit() only.
>
> v4:
>   - Use PWR_LIM in place of (PWR_LIM_EN | PWR_LIM_VAL) wherever
>     applicable. (Riana)
>
> Fixes: 7596d839f6228 ("drm/xe/hwmon: Add support to manage power limits though mailbox")
> Reviewed-by: Riana Tauro <riana.tauro@intel.com>
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> ---
>   drivers/gpu/drm/xe/regs/xe_mchbar_regs.h |  1 +
>   drivers/gpu/drm/xe/xe_hwmon.c            | 50 +++++++++++-------------
>   2 files changed, 24 insertions(+), 27 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
> index 5394a1373a6b..ef2bf984723f 100644
> --- a/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
> @@ -40,6 +40,7 @@
>   #define PCU_CR_PACKAGE_RAPL_LIMIT		XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x59a0)
>   #define   PWR_LIM_VAL				REG_GENMASK(14, 0)
>   #define   PWR_LIM_EN				REG_BIT(15)
> +#define   PWR_LIM				REG_GENMASK(15, 0)
>   #define   PWR_LIM_TIME				REG_GENMASK(23, 17)
>   #define   PWR_LIM_TIME_X			REG_GENMASK(23, 22)
>   #define   PWR_LIM_TIME_Y			REG_GENMASK(21, 17)
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index 0d32e977537c..f08fc4377d25 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -175,8 +175,8 @@ static int xe_hwmon_pcode_read_power_limit(const struct xe_hwmon *hwmon, u32 att
>   	return ret;
>   }
>   
> -static int xe_hwmon_pcode_write_power_limit(const struct xe_hwmon *hwmon, u32 attr, u8 channel,
> -					    u32 uval)
> +static int xe_hwmon_pcode_rmw_power_limit(const struct xe_hwmon *hwmon, u32 attr, u8 channel,
> +					  u32 clr, u32 set)
>   {
>   	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
>   	u32 val0, val1;
> @@ -195,9 +195,9 @@ static int xe_hwmon_pcode_write_power_limit(const struct xe_hwmon *hwmon, u32 at
>   			channel, val0, val1, ret);
>   
>   	if (attr == PL1_HWMON_ATTR)
> -		val0 = uval;
> +		val0 = (val0 & ~clr) | set;
>   	else if (attr == PL2_HWMON_ATTR)
> -		val1 = uval;
> +		val1 = (val1 & ~clr) | set;
>   	else
>   		return -EIO;
>   
> @@ -342,7 +342,7 @@ static int xe_hwmon_power_max_write(struct xe_hwmon *hwmon, u32 attr, int channe
>   		if (hwmon->xe->info.has_mbx_power_limits) {
>   			drm_dbg(&hwmon->xe->drm, "disabling %s on channel %d\n",
>   				PWR_ATTR_TO_STR(attr), channel);
> -			xe_hwmon_pcode_write_power_limit(hwmon, attr, channel, 0);
> +			xe_hwmon_pcode_rmw_power_limit(hwmon, attr, channel, PWR_LIM_EN, 0);
>   			xe_hwmon_pcode_read_power_limit(hwmon, attr, channel, &reg_val);
>   		} else {
>   			reg_val = xe_mmio_rmw32(mmio, rapl_limit, PWR_LIM_EN, 0);
> @@ -378,10 +378,9 @@ static int xe_hwmon_power_max_write(struct xe_hwmon *hwmon, u32 attr, int channe
>   	reg_val = PWR_LIM_EN | REG_FIELD_PREP(PWR_LIM_VAL, reg_val);
>   
>   	if (hwmon->xe->info.has_mbx_power_limits)
> -		ret = xe_hwmon_pcode_write_power_limit(hwmon, attr, channel, reg_val);
> +		ret = xe_hwmon_pcode_rmw_power_limit(hwmon, attr, channel, PWR_LIM, reg_val);
>   	else
> -		reg_val = xe_mmio_rmw32(mmio, rapl_limit, PWR_LIM_EN | PWR_LIM_VAL,
> -					reg_val);
> +		reg_val = xe_mmio_rmw32(mmio, rapl_limit, PWR_LIM, reg_val);
>   unlock:
>   	mutex_unlock(&hwmon->hwmon_lock);
>   	return ret;
> @@ -591,14 +590,11 @@ xe_hwmon_power_max_interval_store(struct device *dev, struct device_attribute *a
>   
>   	mutex_lock(&hwmon->hwmon_lock);
>   
> -	if (hwmon->xe->info.has_mbx_power_limits) {
> -		ret = xe_hwmon_pcode_read_power_limit(hwmon, power_attr, channel, (u32 *)&r);
> -		r = (r & ~PWR_LIM_TIME) | rxy;
> -		xe_hwmon_pcode_write_power_limit(hwmon, power_attr, channel, r);
> -	} else {
> +	if (hwmon->xe->info.has_mbx_power_limits)
> +		xe_hwmon_pcode_rmw_power_limit(hwmon, power_attr, channel, PWR_LIM_TIME, rxy);
> +	else
>   		r = xe_mmio_rmw32(mmio, xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, channel),
>   				  PWR_LIM_TIME, rxy);
> -	}
>   
>   	mutex_unlock(&hwmon->hwmon_lock);
>   
> @@ -1217,25 +1213,25 @@ xe_hwmon_get_preregistration_info(struct xe_hwmon *hwmon)
>   						    &hwmon->pl1_on_boot[CHANNEL_PKG]) |
>   		    xe_hwmon_pcode_read_power_limit(hwmon, PL2_HWMON_ATTR, CHANNEL_CARD,
>   						    &hwmon->pl2_on_boot[CHANNEL_CARD]) |
> -		    xe_hwmon_pcode_read_power_limit(hwmon, PL1_HWMON_ATTR, CHANNEL_PKG,
> +		    xe_hwmon_pcode_read_power_limit(hwmon, PL2_HWMON_ATTR, CHANNEL_PKG,
>   						    &hwmon->pl2_on_boot[CHANNEL_PKG])) {
>   			drm_warn(&hwmon->xe->drm,
>   				 "Failed to read power limits, check GPU firmware !\n");
>   		} else {
>   			drm_info(&hwmon->xe->drm, "Using mailbox commands for power limits\n");
>   			/* Write default limits to read from pcode from now on. */
> -			xe_hwmon_pcode_write_power_limit(hwmon, PL1_HWMON_ATTR,
> -							 CHANNEL_CARD,
> -							 hwmon->pl1_on_boot[CHANNEL_CARD]);
> -			xe_hwmon_pcode_write_power_limit(hwmon, PL1_HWMON_ATTR,
> -							 CHANNEL_PKG,
> -							 hwmon->pl1_on_boot[CHANNEL_PKG]);
> -			xe_hwmon_pcode_write_power_limit(hwmon, PL2_HWMON_ATTR,
> -							 CHANNEL_CARD,
> -							 hwmon->pl2_on_boot[CHANNEL_CARD]);
> -			xe_hwmon_pcode_write_power_limit(hwmon, PL2_HWMON_ATTR,
> -							 CHANNEL_PKG,
> -							 hwmon->pl2_on_boot[CHANNEL_PKG]);
> +			xe_hwmon_pcode_rmw_power_limit(hwmon, PL1_HWMON_ATTR,
> +						       CHANNEL_CARD, PWR_LIM | PWR_LIM_TIME,
> +						       hwmon->pl1_on_boot[CHANNEL_CARD]);
> +			xe_hwmon_pcode_rmw_power_limit(hwmon, PL1_HWMON_ATTR,
> +						       CHANNEL_PKG, PWR_LIM | PWR_LIM_TIME,
> +						       hwmon->pl1_on_boot[CHANNEL_PKG]);
> +			xe_hwmon_pcode_rmw_power_limit(hwmon, PL2_HWMON_ATTR,
> +						       CHANNEL_CARD, PWR_LIM | PWR_LIM_TIME,
> +						       hwmon->pl2_on_boot[CHANNEL_CARD]);
> +			xe_hwmon_pcode_rmw_power_limit(hwmon, PL2_HWMON_ATTR,
> +						       CHANNEL_PKG, PWR_LIM | PWR_LIM_TIME,
> +						       hwmon->pl2_on_boot[CHANNEL_PKG]);

Looks good to me.
Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>

>   			hwmon->scl_shift_power = PWR_UNIT;
>   			hwmon->scl_shift_energy = ENERGY_UNIT;
>   			hwmon->scl_shift_time = TIME_UNIT;

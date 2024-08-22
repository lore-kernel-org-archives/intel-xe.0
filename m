Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE7C6C5320E
	for <intel-xe@archiver.kernel.org>; Thu, 22 Aug 2024 10:48:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8912010E84A;
	Thu, 22 Aug 2024 10:48:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ncspffa7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5618510E84A
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Aug 2024 10:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724323725; x=1755859725;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=lxI+LamYL9j30BZmGUxOXAACEIk1juwuUXV9iMV8BAo=;
 b=Ncspffa7ihIhBKF9pVo6y2u9Q4oPY5TX09jz9eSUkqVaW1caF4pnP5KM
 6nymlEB2pCy5D6RN9wnYQOXTwJWXZ6r0/rfIXwey23g4daNwEeCYR25CA
 RIsK2aoARUid+P5y6ubPD8Ons6nKJwfjva/A4wM/GZIdUfdKYQq21WJX5
 hq5Vu6N/MwhpZYu/iNHBkpNWzK+R0ROtmr+IB2hck47hIa25K2cVJPz9c
 qbxWxB/ykvqvNsxoj8XWZ2gAj8hLpa38QxxasOu7wtXnZhLCnvBkf831m
 mO+NUwCqHviSso2cqU0kkGC7b3F/JqXciG63Nesu8B+jmbHK3Z1T40Jip w==;
X-CSE-ConnectionGUID: GZoodq/UR62EQhy0kYTs5g==
X-CSE-MsgGUID: BL4uD9dGTzmoowqlNhUMUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="33346986"
X-IronPort-AV: E=Sophos;i="6.10,166,1719903600"; d="scan'208";a="33346986"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2024 03:48:45 -0700
X-CSE-ConnectionGUID: J7SPErhgQmCt/y2qYslCyw==
X-CSE-MsgGUID: URVEyIYJRryspeuc/n6QrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,166,1719903600"; d="scan'208";a="92150699"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Aug 2024 03:48:46 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 22 Aug 2024 03:48:45 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 22 Aug 2024 03:48:45 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 22 Aug 2024 03:48:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N4knT31cX29QHVM98t79iBJTPeJ3QZxutJiA8xLV8NE2an8AMkjKEgORPaiyXQ2W6Fn9bDZgk9oWQFHpjxXKoo6G4JUS9RKKgOgf6VIwPcCNRWGpn99t9CLchhRIficxWoB8LnW5K1Jig7tYWWEKOSSB4NSBM5TtEpEehJv2StCrucJ85YeNiVS9yUD3mCxnqfsn2qvfsasrp36M+LRv/8/e2Sg1q/F4M/VcajGGOBv8g4c/TpDQ1/yIgyywGAk8UXw4qiw6JusLbe3Z1HwdCB9nr7FXNL8IV+63LWGgzPY7c/AeczY4PiTR9ago7idkCjh8jThBYh20fhqJyIv+QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ym8r8Y4WRdHnh/3IkSqYHkCke8GPK5h/hiUoz2dSO8c=;
 b=rNGGELWt0viMyM6muJsybpkk0MLTURY1EjOd6HIxBUyS9akXpjTHvWn7ijA9kLOSXDkdLoDPZ7Lb3dWjxm3h/6UqP5vZhCYKGKd7tII3VTq5zuOsJCBweoPFRk+AfrQrgOHamEBxKGKo4pPRle17ipvfdfQybDc/VYWMGbpBjEFMg0ZtF6dem2UILselyBcIUARL/A0iRdnOp6oYtc/FzlV8+WiW+xx8H7+EbFC5QDGq9tdN6AOJ8LB0/DCpmteSWiLuXIYWJD46eEw/9ZOeZqiPPOmpJNMXIO41AtSzVR4zXdyW+agOAPO7qx3eBouL2lTWvXH3B5SYs9jSBDntKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by CH0PR11MB8165.namprd11.prod.outlook.com (2603:10b6:610:18e::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.25; Thu, 22 Aug
 2024 10:48:43 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%3]) with mapi id 15.20.7897.014; Thu, 22 Aug 2024
 10:48:43 +0000
Date: Thu, 22 Aug 2024 12:48:40 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 03/12] drm/xe/pf: Drop GuC notifications for non-existing
 VF
Message-ID: <20240822104840.u2gb5wlvfjhgx3yc@intel.com>
References: <20240809165159.662-1-michal.wajdeczko@intel.com>
 <20240809165159.662-4-michal.wajdeczko@intel.com>
 <20240816130130.xt7qx5x4xi6ltjgn@intel.com>
 <de0bdc3e-d01b-4988-b369-99b7883b6416@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <de0bdc3e-d01b-4988-b369-99b7883b6416@intel.com>
X-ClientProxiedBy: DU2PR04CA0059.eurprd04.prod.outlook.com
 (2603:10a6:10:234::34) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|CH0PR11MB8165:EE_
X-MS-Office365-Filtering-Correlation-Id: b0958cca-516c-47f7-7d75-08dcc297fd7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NVM5WUQ0U00ya1hObEhpV0xPc292WHc2emFuN2tTTTlQUzlYU1I3RmVYQWIv?=
 =?utf-8?B?ai9TOWUyRERTQkU5T2dLeXJVSURldUVkVjdFRGx3Y0xTanMvTHhzbVI1c21J?=
 =?utf-8?B?NEF5dzBOVkFyc2pmNnhtTXVuQnRpaktJOWxKVFhIL3ZKUTJ6ZTRHc0VuTUJ4?=
 =?utf-8?B?TWQwZnovVDNBTk5tZkhVYmVFQndaSDlzUFZuQmZOaXJPSFNzU3NVRnhRMjI0?=
 =?utf-8?B?M3labzF0QXpXZHgyVGFhbjA1Q21IcDlBM3dLV0pPMUFKeUhYVGM3S2F5cnh3?=
 =?utf-8?B?RHhJNGx5cUVQUndOZ2pISng1cjArN0RycHZuUmZyR29jYmVHOXIzSHg1RGFW?=
 =?utf-8?B?M1JXRmsxQTlwMGd5YlF3SlFxZytSY2twQzgyYzJ2WDd0eFZuL2VGUFdtbVJB?=
 =?utf-8?B?SjNxaXIyN0MrZE1DVmYrSStrc2g5YnlRaDRjMEFUY2dYUndpZmw1ejM1MmhN?=
 =?utf-8?B?UUpBaGFJNTNBNlF4RDhHekhUNkdVTjFaa1ZnbkVCV0lxUGkxbWF3Q1krazkw?=
 =?utf-8?B?UlhWK2VFa3JoSFpsakZpVlJ3MDJ3L3VwYzhrNitzSmRySzFZWFZ5Y1NzbE1O?=
 =?utf-8?B?UkY1aGVKQXd4RmNNcTMyNDhaM010b2U2TFBsN092QVVrOEJqL1I4ZzZTa0tx?=
 =?utf-8?B?YkZiNEVUUW5WVGVuMDVUejdTSUpkSjB1RDg3UzllbjJVUXk4MzdsbVo4S3lU?=
 =?utf-8?B?bHhXclZWNGcvQU9abGN6NFFIM1ByQXBlcjVtblN4eW81NlorZEowTFN4V0Z2?=
 =?utf-8?B?QzdxS0UrV2cwOTZDUE5CVHZJbUtiVjZ4dDhheXhUTjBUcHFQb05XdlNEdWJY?=
 =?utf-8?B?SzRsckVWZW8zdkN5K0N3OWR0Vi9JblUzeHNPUmlCcU1JQ3QxeExaTWVwQ2Fo?=
 =?utf-8?B?Z0dOTkN3TmxqOG9YdUV6M2tpZjBTeXhEQ204RGN4c05MTTBXTmhuOVlzdGhK?=
 =?utf-8?B?cittOWxUbkEvWnJmK2VOUENZZVZOSVoyaVJtT2EyWVBVYjN3dlE3TjFnRE5J?=
 =?utf-8?B?dVZUelczLzdXZXowRDlRTURVS1ZMMDNGZzYyOFdia29EWFdDRDBqV2pDMmhO?=
 =?utf-8?B?Y3Q0Slc3Z2w3eUdCWGd2b2ErZkYxVXFXSkg5VFRMS1ZiMVpreldCWXZtdjlT?=
 =?utf-8?B?amZ2eEVJWEZwUVFMdnF4WitXeXZEZUFOWTE0Z3dDbVdoSVk2Tkc4SGptS2NR?=
 =?utf-8?B?SUNUbW80d0pUUytnNjlpT2ZraGIyMFl3ODM0Q3loWnlmUktUTWJSNlhRUk5N?=
 =?utf-8?B?aWpraWwrbUpyc3UyNjMvM0JleWptcnNGdzllVDdxR0VGSHRWdHhwcXBOd2FJ?=
 =?utf-8?B?c2RUb01POGFmM1FlWXE1dHo1U3o2cHJZbVVuVXpiWUZnclJGeUZSM2lTYVRH?=
 =?utf-8?B?Tld4YytUOGw3eG9QaTR1ZmgybGJiandaYzJ2UkMxYzRBczYvejdtVktjY0tF?=
 =?utf-8?B?VGJXcmtMekdURHBCalZnczZTQUd3em9aVkpPK2FDS3E0cTdib05lc3h3WW5Z?=
 =?utf-8?B?dVJmbW9SSStEVHNqMWZhbUJOSDhRMW82eFhueGdKeWZQQ1RQVFVKVXpnSVR0?=
 =?utf-8?B?VjVxTkFsaTZLcHoyQmJjMmFxb3kxMDV5eTNRUUZIdVFoY3RsM1RFVENZWDRn?=
 =?utf-8?B?TjFNQ1ZiOGlaeGZMenZybURHbUtzV3cvK2NFRTYwY2xxR2dFN1pnOG1oekhL?=
 =?utf-8?B?QkFhbWpoa3FjMG5YbEp4VGJPRlo0d0c5N0RPR3J6UjlSZDdOOFEvY2R3R2Zw?=
 =?utf-8?B?aXpyYWtIWW9XRmhuUDNpNU56MzZzWFhQVldLK1FzWG9BTmRHeXdiU2xETEtj?=
 =?utf-8?B?RGNhU2wyYjBMaGJMb2ordz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a3djQlk5d0NGcXkvd0xKLzFFbE5Ea01TUWFvVDBjRTg4NXZ6UEVRaWdSdFBt?=
 =?utf-8?B?UDhaNUxEdEJFbFV3SzR5bXRscm95dHBnaStFNkw3Vm1SbFpwWjVaSWFtdlV2?=
 =?utf-8?B?eVpTOTgrQ3JhYjlKQTJwVHcxZXV0aGN6TnJZK2wrcWxCZDM5VDg4UEdkWDI5?=
 =?utf-8?B?cmpSQ2k1SldUUUh3R09zNE5KL3RVWWRVNi8wT1BBclZDeUhoWVgvYkFKVW9D?=
 =?utf-8?B?b3JZeXdjb2lUOWJqa1h3RWU2Wmp5alV5c2RSTFAzWHJwT0E2bWp6SEtZYW5E?=
 =?utf-8?B?bFFSSkY3SnVGSGNJcjdhc2NHU0s3QjE0WDh1NDZuT2owbXMxYmRadU1mODIz?=
 =?utf-8?B?Y0c4bm1USHNmY2pOeWg1VkdrWHBsVmxRcEJiMXZPVUw5UEtkL21FTmhhQmZw?=
 =?utf-8?B?WlZROHFIZlpuWUQzeG12cnJpYlN2aFRFbkNRWlByTEdrVWQzd2N0dkRrbTNu?=
 =?utf-8?B?ZmloYTU3RXNXRUJLVk9GeGlQQXhmRmt0czVvZTR4Q2pqcDZJSnVRV3J2MWRw?=
 =?utf-8?B?Y202ckhvSVhJUkJLOVY0Q3o0U2hETTVoOHRzTGFiaTJNNEhyVWZLS05UZVBj?=
 =?utf-8?B?YU9oVzFCd3JrNDJPZTJUQy9pYU9remIvaHFzeXpYaTEzckY1MlRJY2JvZDI1?=
 =?utf-8?B?SjJ2S1k5RDhEaXZmM2dOck9jQWgweXVKZ2RCdnJyYmdUMEFybVNBdXFOVmdX?=
 =?utf-8?B?RVVJZEc0b1RNSjgyY0NORXZ6N1RqcEYvTkpjSmJseit5ZW1xa283NTVUS1kr?=
 =?utf-8?B?MlNHbnJXUUg0NGg5a2Vnb1dkd2NlbE1TZWlxb0tkN1hQbHRrODVpbkZUMHFC?=
 =?utf-8?B?TTRMVVBEaTlTRGJvczlnY0daSjBjT21Gc3BJVXFsYkluUWYyWjVXRVdPL2Y4?=
 =?utf-8?B?UjFMN3lmVTlnOXFubGpRVDJBb25aaldZVHNyQ2REd2g3emZLdnVMeWtUaFpm?=
 =?utf-8?B?QW1FNE5aV0Y0dklMYlQwQ0lFZVdIRWZLWnFIQ3h0SkhDNXpVTStPWUJIZ2ZE?=
 =?utf-8?B?YzB3TDZmMS9YTEZORitvU1RCWEd2UU1jVlovSXZRTGZ5R2lIN0lJMjZwS0VO?=
 =?utf-8?B?MjlIZ3pVaFg5RXBRTXkwdFVyaDZuQkVPaWpGNDFsUFFOWU5udVFMYzUxT2RJ?=
 =?utf-8?B?T05QSGpTQkI2d0wwYys2dkxzRmlaaDVZckd3QXlVeTlaY2I4cGk3ZlpOc0ZI?=
 =?utf-8?B?WEtGMVc3R0lPa2tvOGRqTXp3SXZXZW9yN0diNVpwZkFVWVVrS0kxMUNRcFh2?=
 =?utf-8?B?c2Z3MUJWYlo0MklaUkNKODZCc0M1d1pQcWdadFNoWS90YjVnK084QTVnU2VU?=
 =?utf-8?B?cXluTDFHWXZ6ZnlDa3hjaUlwZW5BeTNtUFRIWWszeHMxTVkxRUVqemZDT0Jy?=
 =?utf-8?B?cmtWYlNHajVjWGJDRmZ1cWtMcit6RVZCVER1ZzFtMCtodUZHNFpGY3VjWEIz?=
 =?utf-8?B?eC9lVEZPczBVYjNkZWpmUlFacEw3S1EzZmtoWG5PdFgvWDQ0eENkVnp0cGt4?=
 =?utf-8?B?VlBaWjF5eUt2YlI0YmRKbU93cjJVVTVLaDdZZHhNUEhkN0RKTjlXWFUrMGZk?=
 =?utf-8?B?SjROYjJWdDRFaXRQMFlVVm9SZUIwSFkyQXM1eU1uQXhuUE4yWjRITjhuUGNT?=
 =?utf-8?B?VzZHSWI3U2FCWDBrK1NqQ1lUMzhsMnBBTE5lREFFTnZDNWpsbUlIQ2tzWGo3?=
 =?utf-8?B?RWY5Ty9nUFFiam1QTCtoMUJQaDBOZlN1ZytHeUhrTmtGRWJzbmhZUjdNcnRI?=
 =?utf-8?B?czBlSDBBUHZ0d1RSOHhDQXd0YlRNL1V1R0Q3RUdvajA4cHJTTFdlcGs5clV3?=
 =?utf-8?B?OUtvZWROMkdDbFRpRzRwZTBNNVVsQ3k1R2Nia3FoVHhUYk1BaWltY1Q0OUJj?=
 =?utf-8?B?ZFlIOG5RNmdnaEZJdjQ0NzJCZzBYK0psbzFac0lJY2U2aVIzcG1XRDBVYVdP?=
 =?utf-8?B?ZmxtczVSMnk0SkNPb3o2dzRCWHlVY1ZKMWxIUUttUkxzeThsOG1NcnFTOHZC?=
 =?utf-8?B?SVpZZ3o4bTZXK0MrZUVuZEIwSUdBWi9rTEhLNk1uNFQzREQ0Y2NxTGllTlRG?=
 =?utf-8?B?YkNHZzZkNVJ0MHFLYk9lL0hMSGQ2VkF6R1BDRkVhSUFYelZNTFo3cnBWMGVT?=
 =?utf-8?B?NmlMeXdtMmhSUmdDY0dPemhwT3RvQklpczhZRGRDWXhmZ2xERDdtSVJtUHhr?=
 =?utf-8?B?RFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b0958cca-516c-47f7-7d75-08dcc297fd7e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 10:48:43.0594 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /WBjSjdczYVMpJ5OvH8Ml/K2vNjWHBvi5nAvGgMett7fSJq5Q+z81YMD2fKvEzuh9D8ztfgQGcQ1cVAEJF1+hzP/GMe52gvQ8I/r9sEnEE0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8165
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on pon [2024-sie-19 19:51:28 +0200]:
> 
> 
> On 16.08.2024 15:01, Piotr Piórkowski wrote:
> > Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on pią [2024-sie-09 18:51:50 +0200]:
> >> It is unlikely that GuC will ever send a G2H notification with an
> >> invalid VFID and it is currently harmless if that actually happen.
> >> But in upcoming patches we will start using that VFID as an index
> >> and we must be sure it is a valid to avoid a crash due to a buggy
> >> firmware or a currupted G2H message.
> >>
> >> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> >> ---
> >>  drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c | 6 ++++++
> >>  1 file changed, 6 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> >> index d11839d9e7d4..ad447d867e51 100644
> >> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> >> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> >> @@ -8,6 +8,7 @@
> >>  #include "xe_device.h"
> >>  #include "xe_gt.h"
> >>  #include "xe_gt_sriov_pf_control.h"
> >> +#include "xe_gt_sriov_pf_helpers.h"
> >>  #include "xe_gt_sriov_printk.h"
> >>  #include "xe_guc_ct.h"
> >>  #include "xe_sriov.h"
> >> @@ -212,6 +213,11 @@ static void pf_handle_vf_flr_done(struct xe_gt *gt, u32 vfid)
> >>  
> >>  static int pf_handle_vf_event(struct xe_gt *gt, u32 vfid, u32 eventid)
> >>  {
> >> +	xe_gt_sriov_dbg_verbose(gt, "received VF%u event %#x\n", vfid, eventid);
> >> +
> >> +	if (vfid > xe_gt_sriov_pf_get_totalvfs(gt))
> >> +		return -EPROTO;
> > 
> > I would probably add some log here.
> > I'm afraid that during debug the information about the last event is not enough
> 
> it should be the CTB layer responsibility to print an error message and
> dump this invalid or corrupted or unexpected G2H message, no point in
> doing this in every possible G2H message handler; note that 'silent'
> return is aligned with the existing code in this file.
> 
> for now CTB will just report:
> 
> 	xe_gt_err(gt, "G2H action 0x%04x failed (%pe)\n",
> 		  action, ERR_PTR(ret));
> 
> but it should be easy to add (what we had in i915) full dump of the
> problematic G2H message in case of at least the EPROTO error


This sounds reasonable to me:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> 
> > 
> > Thanks,
> > Piotr
> >> +
> >>  	switch (eventid) {
> >>  	case GUC_PF_NOTIFY_VF_FLR:
> >>  		pf_handle_vf_flr(gt, vfid);
> >> -- 
> >> 2.43.0
> >>
> > 

-- 

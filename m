Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDE2ECEACF3
	for <intel-xe@archiver.kernel.org>; Wed,  2 Oct 2024 17:40:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98F2810E21B;
	Wed,  2 Oct 2024 17:40:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f9sOt8GI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFD5710E21B
 for <Intel-Xe@lists.freedesktop.org>; Wed,  2 Oct 2024 17:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727890856; x=1759426856;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=OB6rQIftn+ii9OpwnY8lVon7OEGSxim8rHzzPx/gvbs=;
 b=f9sOt8GIupIFC68Uc5SkTAGkJNs9WWRXt9cI19a8iXmCppVnQKpOw1Q2
 N4Um6kD0zMYybXO9cupipYEIXrmJqQazSBkVZz0EW5/PSmmGIyKg4MmTU
 yUB2hTVtFmVX5nH3Tw+8NOD1/Snnxew3/Onao8/ZtFfOyXQ079ECSwU16
 vy31/Zvgym/aLsNlZlHdp/RZit7q6JPJNPkxZg8wRf1IKxvzxhlAMBqGB
 UmJaGOiVFwLmGR6+yfvirt+Ajo7hiuQrc9K2tsmDeKdWvn76zVfOb++fF
 /qzYjFJaa5D9fLWmwlLlwXBLPvSApoxN2JpMuFmpKcwY2vW384v1/ZZtW g==;
X-CSE-ConnectionGUID: y3KNNtn0Qd2/9bY6aZIyyA==
X-CSE-MsgGUID: 23thG/M3Qy6qerv53y/bFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="26869063"
X-IronPort-AV: E=Sophos;i="6.11,172,1725346800"; d="scan'208";a="26869063"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2024 10:40:56 -0700
X-CSE-ConnectionGUID: hujnylAERw6njC46fQ5R/w==
X-CSE-MsgGUID: f3aPwjIBSYuJP+XVVXJjhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,172,1725346800"; d="scan'208";a="74880651"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Oct 2024 10:40:55 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 2 Oct 2024 10:40:55 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 2 Oct 2024 10:40:54 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 2 Oct 2024 10:40:54 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 2 Oct 2024 10:40:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MEcfmnI+s0TzAso6Ix4KkGstfuHoGejP0OmmvZXBCbvBYOAHqbjd0clqL9o7+NNeoJCb2i8Xp3s3Sx+hNEQcCTtQCUeat35S6dnjx8TdcYuWJ061u3nXYJp7Tg/jtHEY8DBFNJkD9B4icivYfr9NTVDne24Ugmog24ASKBVL67PphGEilDNKv/2MUJta2Q0VxIdobYA60bA3l3CS4gh0oPg8QT4A2ayGQJ7MZfSPvFH2CRIFYHA6jbCI8PP97bHmzo4bYu4NwqHNuSzUoH8K/nG64nFnsFRB4ret6Bmh5zid8XJ532Lr/gScu7KQQDRYErilp/W116L/NL0IcsMKaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OB6rQIftn+ii9OpwnY8lVon7OEGSxim8rHzzPx/gvbs=;
 b=dL5m9ymO3qpkgKI1yY2vo7rJ1QSHaJnmMOj1SvtpEMF8lVaaFpFU4jsw9OWkUotGmwLNrexWHo+tmHKo2m8FmGZG3Vw3oUMIxaxBHpg9jQ472W4P79brFtRcgIFhQQdubAqZDk67ltzPszwDTYXFWKZPHBY27bvoH+DpIEP24b0OePW4hyN1SNU/ndKPffzyJuaLtJPj/6hoVjGrDDAA1K6i14KgNDpqxPRZaIQmxFlOefvLAJZXFekFmV/PGW8X25sAqGKoZU473GkaylESAMwCj1lzkmoG99d8w3cmPkqIkKEOsGyKm7YyfbrBIwBOInUHUNiF8IRWjDsugOfp+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7821.namprd11.prod.outlook.com (2603:10b6:208:3f0::22)
 by DM4PR11MB6288.namprd11.prod.outlook.com (2603:10b6:8:a5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.16; Wed, 2 Oct
 2024 17:40:52 +0000
Received: from IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::2ca4:29ad:f305:6fc0]) by IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::2ca4:29ad:f305:6fc0%5]) with mapi id 15.20.8026.014; Wed, 2 Oct 2024
 17:40:52 +0000
Message-ID: <1f0fc137-d000-4f29-a760-0f25891323c9@intel.com>
Date: Wed, 2 Oct 2024 10:40:47 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 08/11] drm/xe/guc: Dead CT helper
To: <John.C.Harrison@Intel.com>, <Intel-Xe@Lists.FreeDesktop.Org>
References: <20240920032108.629796-9-John.C.Harrison@Intel.com>
 <20240930230418.1973677-1-John.C.Harrison@Intel.com>
Content-Language: en-US
From: Julia Filipchuk <julia.filipchuk@intel.com>
Organization: Intel
In-Reply-To: <20240930230418.1973677-1-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW3PR06CA0025.namprd06.prod.outlook.com
 (2603:10b6:303:2a::30) To IA1PR11MB7821.namprd11.prod.outlook.com
 (2603:10b6:208:3f0::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7821:EE_|DM4PR11MB6288:EE_
X-MS-Office365-Filtering-Correlation-Id: 0518e0c8-d62d-43be-70e1-08dce3095c3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Vmh6bXl1N1lBcWthMVRHa2RTOW9aVXNDalgvN0ZiODViSFZyam1OYWhZSlow?=
 =?utf-8?B?Qjh0Sno4bDNieGU3TGVOS3VsaDdqNXB2QTR5RE5qSEJndnpMWVUwV1A5b0dV?=
 =?utf-8?B?SkxpQmc1YXZQdTFiTURmcUlGVjB0SGh4ZnlkTnNkOEt5cWRxN285ckd1cDBx?=
 =?utf-8?B?QXNVVjJRQ0RBQ3FRVHh2U29BYnVibWZLa1lzdTF0Y1RnRnhTcXBaVnNRcVNV?=
 =?utf-8?B?Ri9KenUxYit6VmJHUVI3WTZlNG1la1RvNGhoS0UzRDlUdmtSUmIvRCsrU21I?=
 =?utf-8?B?eSs2S040RGNaa0JhejlhODI1cTBBM25ZTnoxL0xrMlpXTHRGYXg4UkxCcmlV?=
 =?utf-8?B?MFlFd1NEWExWeDFzSHVDZnFLYnd2YWl4WkJNeXUyWGV6Qi9USDRIVE1KMVBa?=
 =?utf-8?B?QVpLSi9RVGVRYVkweHp1T0lXRE5DWXY2ajNqcWJyNEM4ZmRPK1hXa1FkTWti?=
 =?utf-8?B?WnpNNkZ1S0c4VTd5ZWcyMmd2WWJQOHhoVzFYZHBVOFZwcGVVMThOck5SZlN6?=
 =?utf-8?B?elpEL21sK0sza2ZubDNQTVhpR0tPeFliR1BYRVJYR3RlUkxMN0Q2WmhmaTJJ?=
 =?utf-8?B?dEtTNTlQbWdhd2RSRDRjTFZqRkkvV25pK2QzZGNRNXVCRTlpZmt1TklDRlVM?=
 =?utf-8?B?eWNka2VUa3lGaEpWWm94WkxmRVhFRGdYY1B6U0hJaTlZOW9pVktJNlVMSkNh?=
 =?utf-8?B?L2lUUUswVjcybjV4bFczN3BpTGlHN2xqYWJDVGdPZkFWTk5xcnFZNnpzZ0JV?=
 =?utf-8?B?NXIxaE13a1VtVzRZSGo5bzVwR1pTc0I1YnFudFRZNlZrTm5xTXB6MHljTmZV?=
 =?utf-8?B?U2xBdmRhVlpFYnhub3BEc21QaVdjMlFUMThQV0N4NnFwNlE2ZTR3ekRzNUJF?=
 =?utf-8?B?c3UrRVVkNUtselVWd2FnSW84OHdMbEljWFZCUHhCcFg3alJ5a2ZBUUEzMkRP?=
 =?utf-8?B?MElDdExzUHc2V1h4UHN6OWtxS3NZeTJKb0s2VDZmRnYzd0dRRzExR0dYa2No?=
 =?utf-8?B?WlRSYnJ2T3JQT0dsdDF2Q0tJQVZES1U0ZzR5VzRGMFNtUmVPWTBsN0JaSHhn?=
 =?utf-8?B?aTBLTGtpSWU4ZUtSRjhDWVhvZDV1NFNRREpFREVEYUVxSUFhS2k0SmJIa3lK?=
 =?utf-8?B?dlBZbDBnc3lwRU95ZzZmdmVsMTlETDZUU3ZTU3BOaFF3cEc2VHFDam0wdEFn?=
 =?utf-8?B?eCtaT3o0N3VTcENEdFZDTlFPWUlXM3gyZDd5bVVqSTcxV1EyVVZHcEFNZFEw?=
 =?utf-8?B?a1RBMHhLdzliRVUrZFZIMjlHTmdLMHRlZkFmS0tHK2NCU1FFZE9sclNESDVJ?=
 =?utf-8?B?VUVadzI1d1BkQ0UvTVFhYktNcmdZRE1lN0xTc3gxMG1EZmZGMndnSFdPZE5o?=
 =?utf-8?B?dmhpa1k5eDRNQ1dzNHk5Q0MrOGFlMm9HZVRSQytFdFRFMk8yQUpNUERjUzJx?=
 =?utf-8?B?RVlSTEI0RURpMy8yQlp1NGdJaWIvRXJGSDVrbTUreVlvWmtLSnpZa2xFOXBJ?=
 =?utf-8?B?a3JLenNXVDFUQTk4Y1lBMGk5RnhSaGg3UUhGdkpYZXB3bkk5SVlYSVIvR3JX?=
 =?utf-8?B?eW5zTmdzMDJTclVrWEY1WmlrVHhDblpiU1lNcXJxTzhKTXUwOC9uanVEYzJj?=
 =?utf-8?B?T3NoanZ1YlE1K0RHWnQ1RUE1bnYxSTVnd1doM3o2Q2tyazVlREVLV2hISXdR?=
 =?utf-8?B?a2JMYVV1TEhHYklscVVxbVp0Z1NnVDJsT1hNU1g4SC9tTnNWV2I2WDRBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7821.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a28wL25FNkdDSGdxdDBob0tRTlVuQklIK2h3dUV5bWFUQW5DY3Yycis2SXQ1?=
 =?utf-8?B?YU54bkxndHVwL2JreE9kZGlrb2E4UEQ5UWRiOEhtbjhCdVlsWm1EWVB2bEE2?=
 =?utf-8?B?bW56RGJsMi9vYVJTTkdmeWFObktja2lRVmp2WVdnL08wZW1pWXlIM0pUQjFO?=
 =?utf-8?B?bnh0WDZOM1NnOFI0YmNjeTZGNlcxYWNEWTJXSGZHa2NJaDd1M1JMRmdEaVJH?=
 =?utf-8?B?Yk9rRWRhaTdlTVM4eklLMjIwZXB1aENPWWNoSm84K0UyTW9FcUd2bHJ3bEx0?=
 =?utf-8?B?RTdHTDhacDQ2L0ZtOTlrK1NOc0xWVlJsaUVvN2dPUVJuVkYzZlNCOG11d2VO?=
 =?utf-8?B?eHBWUlUwK1c0akdVTTFCekJaSnVmMGxPSXRocUMycXRiM3J6UUNhWnhOdEJK?=
 =?utf-8?B?V2tQb1VZbmUrVDZOZ1YzcUVueGlIcUtNeTBmMU82Und4bThRa2M4czR0c0FO?=
 =?utf-8?B?TjlhOGtSais0UVlnVHEvWnFOUmdxSzFRTWppVlEwN0drMkpNQjBKdHY4eFM3?=
 =?utf-8?B?WVR0WjJCdmswQ3lLMEdrZGYxSkdQa2plQ29ZRGNoMUFDRytlait6UjhFZWpM?=
 =?utf-8?B?eXdHSUo1cmkyVzkzcnpMbTU0aW5GblB5TXQ4aVU4YWQvS2F0dkZLTGRIdnBG?=
 =?utf-8?B?b0ptVHhFQlEvNG55QlA1eDlrOVRlOVpBekVBOXRQbGNFN1drb0dRSm50emhk?=
 =?utf-8?B?M2gvdjY5Mk1JRGh0RDhwSHpWNWZScnZ3NDhOcDJOS1czcFUwRmhGdDNBRldM?=
 =?utf-8?B?dGFQSjdYekQ4QTh0cnZDVFRTZU81bjdoK3dvZGhvOU5JSlhMYXJ4em1ieVhP?=
 =?utf-8?B?cFNCNXBFL1RYRDRCZ2VHWEE3VXJhcC9iQ05LVUd0azVtSVlnOFdBL3ZXWmlU?=
 =?utf-8?B?YmVINmNRK29yajF6WXJyVDE5eElRV1Zmb0ZBMTBRVEVzUmFBYVZac0tPZUI0?=
 =?utf-8?B?a004aVRtSitiTGpWN0ZaTW9jRko1dTYxSHhqYmFMN0ZialY2MXBGTmxzNWYv?=
 =?utf-8?B?b1NHeWowQ2t4NmJxem9SZTlrWk4vdlZ4RGQrRjBWOHc1a1pmM05qVEJFMC94?=
 =?utf-8?B?bE8walR6WFdocnZYVnZYVDRrOTdmcTlna0x3VWxGeFhYZ3RhQ1dqak9RUlkx?=
 =?utf-8?B?WVVuVG9WZUxpcnpMd2c5aEdUTUpPM1lSM0NpUXNJU1BHSm1PSXBBWTdrcisz?=
 =?utf-8?B?OWNsd05kcFcvTFVKaGczTERVUmFnbWJzaUorVENoTU9PRDEzRS8yTGdjYXZm?=
 =?utf-8?B?c0FYTGQ4SWdqYS9ZMlVBK2FFc3lsVUV2ZnpZN3R1YUNkVUFmM25sTzJKVnZm?=
 =?utf-8?B?VmdCdHQyYmNQa1dYcHZuUi9zSSszODl0S1htbm9ON1ByTmZEN0gyR0FCbEtF?=
 =?utf-8?B?OTRuc1VNUStDNU90TjBuOGRnbEM4MW5xUktYQURKQURSVGdFUzJDc1FwRmRt?=
 =?utf-8?B?Tlk3WmdQNCtKRklneUliWm1kSFMzZ1hkMGFZNEdiYUZDNFV1WURTeTJHeWNj?=
 =?utf-8?B?WXFjYkdBQU5rUFd5dUJ5ZWJETlp3eHM0aEpsZllDN2ExS0UzcXpMVG1JZVpk?=
 =?utf-8?B?eGxqejlBVzkyZ2RRRTBrcUUva1psaGNxMFFtNlFHWjhYTDhhRktpMTNGc1dm?=
 =?utf-8?B?VGl6ZXZYR2lsMWdxQ2JyNGpEam9mTVhUazhNK3M4M3BWRzdRdU0zc01LZ1lz?=
 =?utf-8?B?a1hxeUkvd1JKd2NOSkFYWEYxenYrYk9FdlIyQzNDYWdnMXhBNFlhWEJnSjky?=
 =?utf-8?B?MVlKR3ZPdWZzdklkN0dDNGhZcVhHdWFlakw3WG1wZS9jVCtZQjR0MVZzZEFv?=
 =?utf-8?B?OGRCK3JqMkx1Q2xRM3I2ck5ZQ1d2TjNJTlNGK1UyZjZGVnE4MVRkL1FaLzBV?=
 =?utf-8?B?eDMwRUdpUCs4bTlyZFZtR1diWGgyYVQ4MlBQYnVEUXJKMzVIMFhSdC9UNGdv?=
 =?utf-8?B?N2xyVy9xcFZTWjVJRnRINXZDM01taGpHRm1ucnJtNVAvNlRXcmxiQUpkSHhu?=
 =?utf-8?B?c25DOEg0UytPWHJRWk5KSFEwdW85WXFodWJUQlFZaFJxcHBhVDFTbHVaZjhP?=
 =?utf-8?B?YVRxYnd3dWlQS1cxeVkrSnlYVXlzNis5SUg3MFEzL0tkQ1RjRndET21CdjhJ?=
 =?utf-8?B?aWFpc0IyZ0ZST2UvalN3bit0QXhVK1drUGxKSTBjQ0RxQWFPZUM5N1lrajAx?=
 =?utf-8?B?VGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0518e0c8-d62d-43be-70e1-08dce3095c3b
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7821.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2024 17:40:52.3270 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W4LfcauPL/iTL456XtCxa6XD2MtzM1fhvnMcMSMFbPM6FYQdouQQtrkvNtobr28NgsxaPSUoxa93MthxN/XoXJaRg3cA8JuGVY3qbT5opyg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6288
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

Reviewed-by: Julia Filipchuk <julia.filipchuk@intel.com>

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 166DFC7EE33
	for <intel-xe@archiver.kernel.org>; Thu, 26 Jun 2025 08:54:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF40C10E8C0;
	Thu, 26 Jun 2025 08:54:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ao8Rlwau";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A85110E8C0
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Jun 2025 08:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750928074; x=1782464074;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=gd4kSmv9UJpXxBawnEx6tGLPpZdFCIzjpxZowj8jd5I=;
 b=Ao8RlwauQeK5bCx7zF3bAwZakxd1TgwZqVAFMCQeeEmk7htUWbDf2HCa
 w7zkvOTky2NpdaO2m4n3xUs49Uu3AFXdEl5vaSJ6cKhUJBiLaGPbXETEo
 ikdzXUt73VVAzl8v8vdtvm73X+gb5PPyCn3GZLHVypu/CxnVjHEhMzCtH
 P7FfhArgCTd6yixUSLHOkXbBo2pBFS2Rld7FBStf7I2GJ9PcyYAJKtMqm
 wufgOKPJwBKNscceh5BZqiBB1xlK608IdqdhdwBLuCq4fwguWEopxdiAU
 UfZilPfqjgPHtYtlcvbu5mpzTJMoR0g5jPedBxWAbBoqA7MLqpXwWXg7M A==;
X-CSE-ConnectionGUID: DzMsBKdERyG4UgZ2LeajSQ==
X-CSE-MsgGUID: lSBEWgLeTuCrWqODkQzaJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="63472267"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; d="scan'208";a="63472267"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 01:54:32 -0700
X-CSE-ConnectionGUID: buq+UEgpS7aVqTFii4TlHA==
X-CSE-MsgGUID: Atnh6RzGSSmiclXG7Inw3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; d="scan'208";a="151878401"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 01:54:33 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 26 Jun 2025 01:54:31 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 26 Jun 2025 01:54:31 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.43)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 26 Jun 2025 01:54:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nfU3dijTzOh/CjaMXvo3EMNNBXjIcGPN0JRtn8sZHwrUZiJzZ/FldA6C2mQk5YKl2yWRntEASFDbWGU0pMSoRk5taAUMVPnLagpVDCHfXKyAm/BIkjmnx9/Wg6TnliOGeDEmqge+SmrZiT0+NOBvk3xr75fI/wSSwINeEMktLdBHA+GuHW9xuMnVCVmFHypec/NTVfSJg7eBBVep+bc195CJgStEXTKRB2G6hUUcfj5/9fLKAzSUy9nhQe6xqGWUU04WXE0tbENkeHJwzjYzsYMjzRxJ8SCq+gZZOxn9QI3YgEiNCDTjKS6cDdw9CtPvo/sEFKKPD47eL70OBpaWMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BHWTxDxhfIL6KQ92KFav9gF4KU+jd51QwqPzKfnKktE=;
 b=XDeMFjglusNjKU2JTjcfekUBqwoVbgpZ7uMce6BaqdUtj106T1+4HPuSecTSscvGB4tPi3j29AipfcBzTeLX0gnjO+7ZVfRptqrwTcQWZSedlskb8KgJVTPvL1bYg17BkS3a0DCICvKF3hKS9y2KI/o1tJ4FX4xPb6wMEvUnxbsdxY9E57fFS4e/1bJ40+xuz/iht4hXaVhT6CytQulyS207ueNap2z07kSqTkeLM80n+OYAVPt8p+sa5U/xbPfR8uodjZ75L+fIG1Xe/BHVO244fjklzPpcU53zHm/NDTwgjvv+IHZ3LpLNcSIS42Clo4epikKtdS/4UpbKZSK9lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by SJ0PR11MB5771.namprd11.prod.outlook.com
 (2603:10b6:a03:424::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Thu, 26 Jun
 2025 08:54:15 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::2ae2:110b:2487:40ed]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::2ae2:110b:2487:40ed%6]) with mapi id 15.20.8835.018; Thu, 26 Jun 2025
 08:54:14 +0000
Message-ID: <352e6be8-4ddb-4442-8a0b-5f49f63be9c0@intel.com>
Date: Thu, 26 Jun 2025 14:24:08 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 20/20] drm/xe/madvise: Skip vma invalidation if mem
 attr are unchanged
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
References: <20250613125558.2607665-1-himal.prasad.ghimiray@intel.com>
 <20250613125558.2607665-21-himal.prasad.ghimiray@intel.com>
 <aFnU+sQWnsk63A9+@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <aFnU+sQWnsk63A9+@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXP287CA0023.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::31) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|SJ0PR11MB5771:EE_
X-MS-Office365-Filtering-Correlation-Id: 1932f234-b0bb-4d31-3502-08ddb48f06de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WXduRUtiWGtXZHFZK0F5c1dNaHNNME5BOWw3cmVYZmVhd0JYbFllSWhhK0lE?=
 =?utf-8?B?OFNjT0ZWVi9xRGl5c2MxcXloR204QTdJc1M3T1UydWdybW9leG9vU1J4RXVp?=
 =?utf-8?B?WUlxUldSNGQ1aTNNRFA2QzRNUmM2S0svcktXTHhNeFNKUEMxWTJ1WHJPeTlv?=
 =?utf-8?B?UGdLRHc0Y2FPZ291Rk9rdmthWEIvY0tGQlBjVDRDSENKdmdqT0tSUlFKR3Nn?=
 =?utf-8?B?OHJYSmtQQUZYeDJmUzdmUnRQY1orWFpQc21oL2VLSFZXQTNzTlZ4c3ZwcjNQ?=
 =?utf-8?B?OHN4aEhRZ05hd2tRZHZ0RHJMOExIM21DQ3VETm1zNkhMZUdXTE00aVQrMGE4?=
 =?utf-8?B?cVpLMEliNExKekxkM2JOeTBUbEE4ckFqYktOclMwZzB0YS9rL3B0b2tYbFdJ?=
 =?utf-8?B?R1FTcEtVZzhIcXdxOVV6eXkrU29VbUlxMFVuM3JiTEMvMkt4eEU5elZqeDhy?=
 =?utf-8?B?bkZwbTdsN09SMGE5ZnZtQ1JVNVo4TjdFTjEwTE1iSzZsWTFadUNub2dYS0Zj?=
 =?utf-8?B?Vm1jcXRlZUF2YWxPRTZGbWdtYkxFZ0Z4UmNldzVQL2wvZnF5TGVwYjNMeFVh?=
 =?utf-8?B?dFBiQTd2b2Y2NDFWaWFjckdYazVUd0VNSEc0NDlWZGlmamZmaHlzL3EzcHg1?=
 =?utf-8?B?OFF6bTJKKy8zYktKbGFYbjVUMFY3NW0rTGZsTXI5bFIzVkZxZkYyU2tSaDhs?=
 =?utf-8?B?eUxrc1k1RmhRZjhzcktjbllEL3dranI5SExINmpSY2lZRzR3aHdFNlNKMkRO?=
 =?utf-8?B?aFpWQlVnVGFYQlZ3eTJIWnJrSUV0Wm0rWXN6eXBtZ1ZTQ0QxcUszVUJDbHUy?=
 =?utf-8?B?SmNwcGF3dC9KVGR4VlFSSi9kQytYVy9zaFVUSDF0NlBIYXRWcnhMTFRGVlVr?=
 =?utf-8?B?d3JoL2kwaldBMEF1cXkxeTRLUUdjZXY3eU5DVk5YRGpTekk0aUN3VFlVeHly?=
 =?utf-8?B?WGplNldoN0RsWEtablJlNWNRL1ZoQVdZTHhMc243V1MxTy9oQ1pmRGJsNDh0?=
 =?utf-8?B?UFpVWWdTcUN3UUc1RnNKaURYUStJdzNPUzY3VCsvT3RHQlVRY1NkekpEN09E?=
 =?utf-8?B?UzNacTdzNE5XUGFXTjBXWmFJNjhGdjB0NG9wVmFvMnFvVzFQQjUzeDFSa3dJ?=
 =?utf-8?B?OHcvRk1mR2VjOTZrZnZJc0tTTzh0RDZweUk5Tk1aMGRtZW1MQTNvZmpxM1hx?=
 =?utf-8?B?OGNqd0ZtRmNPMlc4cFNPU1hadm04VjRBQVg4T0FIZDJvVWZ3cC81OTdLSHZ1?=
 =?utf-8?B?UWdWeTdFSkdpSHo2c0kzTnp3WWdQL3J1ZVZScDlCMjBNM1dSWC9MVi9MaTBK?=
 =?utf-8?B?YlRTUUVEZENWbkJoaHZaMXpWWjhSVkxlazFydEErdHpjZEswbHhOWlorYXcw?=
 =?utf-8?B?ZDJTaS9SdFp3UHFGRFVjc0JXRVZDR2t6U1M1citOS2t3VHJpM2xUS0VOOUov?=
 =?utf-8?B?Vnlpb0RFbkFYeEswMjQvc2JmUXRBWjlZaDlsS3NnN3E5YUtCYllDVDRZeks5?=
 =?utf-8?B?WDNxK25ad245eE0xdWE3MWpsV0N5clptVU50VSsrWmJTaU0yNCtHb2FiZDRY?=
 =?utf-8?B?ZXJYazRQZ3hPSnN1UXBGTTFmMmRiS2NNNGVqTTBKVnpzWitaYnJqdlNsd3ZR?=
 =?utf-8?B?S1QzbDFkVHNZQVVhVFI4TE16M1hsYVJhOHJseWlTK3BPaHhqWTd2ZVN1ZXVs?=
 =?utf-8?B?cnc4QnVjZ2Z6SHNnNE1zZzJjd0cxT2ZkYURid082UnNWNHZwU2xxaXhYMmNT?=
 =?utf-8?B?WHpnSFhEVllEbWtmQ3ZGSkJBeTNZR3NaZy9YQ04yQjJqZUdXZ3MvNzFDNHZq?=
 =?utf-8?B?a25pcElYWVU1aUhDbk50K3h1SVdSLy9wRmFySzR2SHRWUUJvV2FPQ0lCSlFq?=
 =?utf-8?B?TFNNYUFDOXE3TS9hbTVHYUpuSzFXREtoZVpETmJJZ1hBUHc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z2hLT3lBYmlZZU5OdnJabEFRTXBSbDJVMm40TWZJa1lVemI5Y3JYcXNENVp3?=
 =?utf-8?B?c2laNjZGY0dQRCtHcnlYWFd5Wnk2Mlg3QWtPZDVKcDJMd3NVRHRlY053bVRm?=
 =?utf-8?B?eFlQWktzRk9Tb3JwOFR5cXNiY0NmRU1PbklNVTV5aURXZmd6SFFWUXE4MDhD?=
 =?utf-8?B?dVIyTUZaczdNU1dFZzRoQWJnMUI5MSs0ZUphU0lNN25HdXpscFFXZEFiRTg0?=
 =?utf-8?B?WExLZFp5VzhXTTZIRHAyb25PTU96aDNvR2pQMndHd0JZSWxmUHRIaEcvUTcy?=
 =?utf-8?B?U2d6MEdadlpLNVE3VzBqRSs2VjdTZVJ4bWt0UUtRS2NBeHN4U2FzL2E2cTR6?=
 =?utf-8?B?VGpzRlNvOGJMSUVkUlh2cGszbU9vVG5hZytoS3EzYTdFYXo4VUVoUFRmVDR0?=
 =?utf-8?B?blpScmFSamUweFgvRVhLTlZkN2dWVDEyd1dTeHh0d20zTlVsZ2FHV2V6U2px?=
 =?utf-8?B?MGpXcWFGMXpORVlMNWdNdkwyWFBkMUFrYktsQTd1QzBOUGkxSVhST1QrdTZG?=
 =?utf-8?B?ZWdacVgyWk1HY3F4NkJvZFJibUZTMzgvVGVEUkZsUE1sUnBXUFRJWUthRkc0?=
 =?utf-8?B?SVVzdXlMWlUrbEt3S3RDVCszNnZTRFd6WURxbzIvdW02NXdQaVlWTm55cHFX?=
 =?utf-8?B?c1FqQ2syYXFhR2sraDZ1ckh3bnp2UGtsdjZsUmxxYlVOZW1pUVc4b3hPUlFm?=
 =?utf-8?B?dTUvQzFrSUZTWjBRTGJoWTFVWkZmbzF0TzQ1UjYxTnJVWGhpYU9jdGN6ME5w?=
 =?utf-8?B?KytqK0JnNkt1WlVhZGtnL3BMSDdpV0xyUGtGMUY4Z0ZyVU9VVUxmdTM2Yzdq?=
 =?utf-8?B?N2Q3TW1OSnNyL1V3K0grM3FQYUFyTW9RSzJ1QnBJdVZuVFRsNWdZcXZWdGVF?=
 =?utf-8?B?WkswU3FWNlp6T2dXNDZKZXFBUXpaWDBxWE9udmpjUHBaL2ptdktrK0JqVFJ5?=
 =?utf-8?B?Z1NITFg0Mnd0dFZndDE4Umg2NnF0VFFrNVpMcDNyVWFQblAvRW13M1hlTkN2?=
 =?utf-8?B?aE43aDlFUDhrZjBYVWw5a3Zrd1VHNGNzbGZ0VWgwdDVzUEFXY0p3Ly9QZnJi?=
 =?utf-8?B?Sk5NV05yZWdzQkFYTU9hdlFsL0tVVVNYRVlzS3F4RGZYYkZTM1EvTjNGL1ZE?=
 =?utf-8?B?ZFcxVmhKaG9ocHFoMVJrZ044NVdhYnF3TC9ibnNTMFFTcEJxVHBiYW9yMXcx?=
 =?utf-8?B?Mzc2NnFaWis2VEFjTzdkUzVIdXVaQVhtTHg4UkpmdDg3OVYvcEZ5Ulg3OXlj?=
 =?utf-8?B?NkNibFBFK2VudDlpNTNnWVFkdGFyMWp6aXNsTU5Mcm1CK3BrUmFyd1NqbVhn?=
 =?utf-8?B?bGVmTGlaQlppaXZGSDdHWENoTFN6YThiT21RTFBDd29kK1VHbVZMYUJjZVFT?=
 =?utf-8?B?UTBSSS9BbXVHbXhKUmM4ekkzd0p0QS9ZOVIwUnVRQSt6dlllVEFzTFVwWTRt?=
 =?utf-8?B?LzMxZTBhaHd6TitJZEsxZFRMRnZZc3VDQm1XeEZhTVZkUzBpVE4zcEVVUFBV?=
 =?utf-8?B?UG16eWJCVTloQllncklJMGdXZ3l0Uk05Y1JEMDdSbXVBYnZ2YjJRYkhucnpH?=
 =?utf-8?B?WXMxcWpaSTNtcERXSmVXakh0dHdYV1hmL25JVGN6MTIxTWNIQTc5cmppbHJX?=
 =?utf-8?B?cVU2dGYrSGJncXFEajlpeURMVUZEcTEwbTh4SXY3cHIxZkY5bE5mZkdjNXAz?=
 =?utf-8?B?WkRBOGVFaU1SUEFoSGg0YjhVQnNZNE5EcEQ0U2RUQzNyc1JFT0hCZGVXMVRJ?=
 =?utf-8?B?T2g4THdqRkkwdS83WDNQUXFZNlNDSzUzWTA4cDl5RVhMT0N3U2NMNm9LSTcz?=
 =?utf-8?B?SXdMTHo3Y0lMMmo0SDN4MmFGdFlJVXU0UHlrdVByajlzZ3U3WTdIL3JVV0Zn?=
 =?utf-8?B?SlRZZ2xMK21kNWNOOGE2YXhRYzhWN3JwT2VSQSt4TVUxRUY5RDM1aVVpVVUz?=
 =?utf-8?B?eTVPdERjTzdEUGFNMEJUWkNaeXZyZEg2N2dRclRZOHVDSit0MWQ0eVZtNFM0?=
 =?utf-8?B?SVQwR3V2L3U3U0ZaSG1qQTFORjJQS3Y1eHJTZGIrQTVETC9PbGYrdXdqY2U3?=
 =?utf-8?B?OUdTTnM2L1Z6a1dCUHA5UnlFMElkTllxTmZRZXduK2dFMnhuTTNJWlIyMWVl?=
 =?utf-8?B?dmE1L3hlNGhJZjUyNndMVE14Q3R2WE1iUEFxSS9MdWZxUnJqb041M0E5d2Ju?=
 =?utf-8?Q?kpEmQwQhtrmYl7ds9zu5mq8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1932f234-b0bb-4d31-3502-08ddb48f06de
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 08:54:14.8471 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qrYwwa+uwICCVnd/LoDGqJWm12hnAJ5XyECi8hzTh1Jfv8OZmzcurxqwqYUxeinslemFbCKreGgcxa7uejamG4myjEgBXcm2FdGrWPd0X4c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5771
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



On 24-06-2025 03:58, Matthew Brost wrote:
> On Fri, Jun 13, 2025 at 06:25:58PM +0530, Himal Prasad Ghimiray wrote:
>> If a VMA within the madvise input range already has the same memory
>> attribute as the one requested by the user, skip PTE zapping for that
>> VMA to avoid unnecessary invalidation.
>>
>> Suggested-by: Matthew Brost <matthew.brost@intel.com>
>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_vm.c         |  1 +
>>   drivers/gpu/drm/xe/xe_vm_madvise.c | 57 ++++++++++++++++++------------
>>   drivers/gpu/drm/xe/xe_vm_types.h   |  6 ++++
>>   3 files changed, 42 insertions(+), 22 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>> index d9ce25f3abf4..56d6c286e3d3 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.c
>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>> @@ -1226,6 +1226,7 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
>>   		vma->gpuva.flags |= XE_VMA_ATOMIC_PTE_BIT;
>>   
>>   	vma->attr = *attr;
>> +	vma->skip_invalidation = 0;
> 
> This kzalloc'd so not needed.
> 
>>   
>>   	if (bo) {
>>   		struct drm_gpuvm_bo *vm_bo;
>> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
>> index 5b96c8fc73a5..06e40ab0970e 100644
>> --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
>> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
>> @@ -88,13 +88,18 @@ static void madvise_preferred_mem_loc(struct xe_device *xe, struct xe_vm *vm,
>>   	xe_assert(vm->xe, op->type == DRM_XE_VMA_ATTR_PREFERRED_LOC);
>>   
>>   	for (i = 0; i < num_vmas; i++) {
>> -		vmas[i]->attr.preferred_loc.devmem_fd = op->preferred_mem_loc.devmem_fd;
>> -
>> -		/* Till multi-device support is not added migration_policy
>> -		 * is of no use and can be ignored.
>> -		 */
>> -		vmas[i]->attr.preferred_loc.migration_policy =
>> +		if (vmas[i]->attr.preferred_loc.devmem_fd == op->preferred_mem_loc.devmem_fd &&
>> +		    vmas[i]->attr.preferred_loc.migration_policy ==
>> +		    op->preferred_mem_loc.migration_policy) {
>> +			vmas[i]->skip_invalidation = 1;
> 
> In the else statement, you need to clear this so subsequent madvise
> which change properties do issue invalidations.

Missed it. Will fix

> 
>> +		} else {
>> +			vmas[i]->attr.preferred_loc.devmem_fd = op->preferred_mem_loc.devmem_fd;
>> +			/* Till multi-device support is not added migration_policy
>> +			 * is of no use and can be ignored.
>> +			 */
>> +			vmas[i]->attr.preferred_loc.migration_policy =
>>   						op->preferred_mem_loc.migration_policy;
>> +		}
>>   	}
>>   }
>>   
>> @@ -109,7 +114,10 @@ static void madvise_atomic(struct xe_device *xe, struct xe_vm *vm,
>>   	xe_assert(vm->xe, op->atomic.val <= DRM_XE_VMA_ATOMIC_CPU);
>>   
>>   	for (i = 0; i < num_vmas; i++) {
>> -		vmas[i]->attr.atomic_access = op->atomic.val;
>> +		if (vmas[i]->attr.atomic_access == op->atomic.val)
>> +			vmas[i]->skip_invalidation = 1;
>> +		else
>> +			vmas[i]->attr.atomic_access = op->atomic.val;
>>   
>>   		bo = xe_vma_bo(vmas[i]);
>>   		if (!bo)
>> @@ -134,9 +142,12 @@ static void madvise_pat_index(struct xe_device *xe, struct xe_vm *vm,
>>   
>>   	xe_assert(vm->xe, op->type == DRM_XE_VMA_ATTR_PAT);
>>   
>> -	for (i = 0; i < num_vmas; i++)
>> -		vmas[i]->attr.pat_index = op->pat_index.val;
>> -
>> +	for (i = 0; i < num_vmas; i++) {
>> +		if (vmas[i]->attr.pat_index == op->pat_index.val)
>> +			vmas[i]->skip_invalidation = 1;
>> +		else
>> +			vmas[i]->attr.pat_index = op->pat_index.val;
>> +	}
>>   }
>>   
>>   typedef void (*madvise_func)(struct xe_device *xe, struct xe_vm *vm,
>> @@ -161,23 +172,25 @@ static void xe_zap_ptes_in_madvise_range(struct xe_vm *vm, u64 start, u64 end, u
>>   				  false, MAX_SCHEDULE_TIMEOUT) <= 0)
>>   		XE_WARN_ON(1);
>>   
>> -	*tile_mask = xe_svm_ranges_zap_ptes_in_range(vm, start, end);
>> -
>>   	drm_gpuvm_for_each_va_range(gpuva, &vm->gpuvm, start, end) {
>>   		struct xe_vma *vma = gpuva_to_vma(gpuva);
>>   
>> -		if (xe_vma_is_cpu_addr_mirror(vma))
>> +		if (vma->skip_invalidation)
>>   			continue;
>>   
>> -		if (xe_vma_is_userptr(vma)) {
>> -			WARN_ON_ONCE(!dma_resv_test_signaled(xe_vm_resv(xe_vma_vm(vma)),
>> -							     DMA_RESV_USAGE_BOOKKEEP));
>> -		}
>> -
>> -		for_each_tile(tile, vm->xe, id) {
>> -			if (xe_pt_zap_ptes(tile, vma)) {
>> -				*tile_mask |= BIT(id);
>> -				vma->tile_invalidated |= BIT(id);
>> +		if (xe_vma_is_cpu_addr_mirror(vma)) {
>> +			*tile_mask |= xe_svm_ranges_zap_ptes_in_range(vm,
>> +								      xe_vma_start(vma),
>> +								      xe_vma_end(vma));
>> +		} else {
>> +			if (xe_vma_is_userptr(vma))
>> +				WARN_ON_ONCE(!dma_resv_test_signaled(xe_vm_resv(xe_vma_vm(vma)),
>> +								     DMA_RESV_USAGE_BOOKKEEP));
>> +			for_each_tile(tile, vm->xe, id) {
>> +				if (xe_pt_zap_ptes(tile, vma)) {
>> +					*tile_mask |= BIT(id);
>> +					vma->tile_invalidated |= BIT(id);
>> +				}
>>   			}
>>   		}
>>   	}
>> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
>> index c7156f8e2ed2..3b3019ecbfab 100644
>> --- a/drivers/gpu/drm/xe/xe_vm_types.h
>> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
>> @@ -151,6 +151,12 @@ struct xe_vma {
>>   	/** @tile_staged: bind is staged for this VMA */
>>   	u8 tile_staged;
>>   
>> +	/**
>> +	 * @skip_invalidation: Used in madvise to avoid invalidation
>> +	 * if mem attributes doesn't change
>> +	 */
>> +	u32 skip_invalidation;
> 
> bool or I think you can safely stuff this into gpuva flags (e.g.,
> DRM_GPUVA_USERBITS) as this only set / cleared / viewed by a single
> thread and all other flags are set at init time or bind time (i.e., no
> races).

would change it to bool.

  If you choose the latter, or regardless, we should probably
> document the gpuva usage.

do you mean gpuva userbit flags ?
  >
> Matt
> 
>> +
>>   	/**
>>   	 * @ufence: The user fence that was provided with MAP.
>>   	 * Needs to be signalled before UNMAP can be processed.
>> -- 
>> 2.34.1
>>




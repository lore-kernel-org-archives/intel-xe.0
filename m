Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31BEFC52D71
	for <intel-xe@archiver.kernel.org>; Thu,  8 Aug 2024 20:33:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F08BC10E803;
	Thu,  8 Aug 2024 20:33:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AXqgNMqk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1E7310E803
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Aug 2024 20:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723149207; x=1754685207;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=S78AOLF1aLTWtVkGmgxjmqwHGcJY1/dgCGggdOR5ilk=;
 b=AXqgNMqkLgA+pH5lHqDL/YgjmXvlGyQuRXFBzVai7rFqUbaROBuSnGy1
 xTy9LX7OGozQFmkXnz+hpv6PYJWjEX0YH5V0iYPqUv+MfRlBgdyzhu37v
 uFA8l4Qtiq9tMbOH4eSRQ746kdVIfbD1Y53QhW+OW5whb2+OQJUDJcPnq
 HSK9jAXd/Wt3V0HZzw6Qj2X6EEM823LFmMeE417udbhBHBYTlSe0bHg0O
 BVRwGKvsShLUR5t+/uw8/rHnDMUhGo7E9oEZwCWiq4GxWpCW3Kx3/t0eR
 jAommL2fRvI+x1MHhsMy3GS7g6V3A7Yd05iAtAsbIuZ94CqcHG7gpef5x A==;
X-CSE-ConnectionGUID: hgHLdpq3QjqQ0mZsGHTbGw==
X-CSE-MsgGUID: QGA3AoygSoW9x7Jtk6LV4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="12921503"
X-IronPort-AV: E=Sophos;i="6.09,274,1716274800"; d="scan'208";a="12921503"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2024 13:33:26 -0700
X-CSE-ConnectionGUID: XcCvKelWRhaBk6wiHjFwNg==
X-CSE-MsgGUID: rUTGcMD7Qj2NtBlpH6BkmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,274,1716274800"; d="scan'208";a="61982987"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Aug 2024 13:33:25 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 8 Aug 2024 13:33:25 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 8 Aug 2024 13:33:25 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 8 Aug 2024 13:33:25 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 8 Aug 2024 13:33:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zFam/Le3t0f23+UNh2x9MLEc5oekBUZdedRHOCn+5UC3RW/9RJcCp744UcX7x8PfZz35WQCCkaYrvQoQxU6fEM4Yg4pbAxpaWXl1UhEM7FNG4/3A/XY9k9nHqFNoOpwVBhLwA1oCptKHCflyN+apjucFQgd/NguLQzfmMrb1H21t0MtjyCA1PE4AcTOTiYwxcy+Z/Zzw5BlqS0R/7cUavtQxoVNce2rJhY5fHIjhNWTw/qNAdKWaA3orW9RHlLIg6FxdH5TTi+eywmdqLl/M6XC32egj24QSHhMik4J6CEDSnvwJPkOy13HDTTD+/1/K118eQiq7tz/xgH1UeCt4WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VTb+nvPAB7oLWS1XAq0CI2hkQeMBW2acOB4CERGurrU=;
 b=E+1jYG+RvhtUfPqjenxZGJqxvwASzYXE2DB3GCKP3YRWlYWVckHYoUl5IyHms9bovPBI7FcAnXoLfdus90DelmJtQPOHwgLHTtddWTW6QwPXkwvyCv0SBZLWx4sZy9Sj2C8LThrJBaCpPAfCR8+BwrKUGcxaM9SZhPL9tAsw9D/hreF+/wKZOidp1fhMfxaS5rLoh9nXZSga0/VIvTaRpEM9ZlcKvqSQZF6Qb+dAms6jUcHw07S9ynBrJJoG/Z0ySF//n4tnYdmQuJNMjG4i0gmJVEP6MB8ak4OA1l+xaKcxWGn+Q94+FkDbEcVHrJERCtr2/3PL+6g+Rt9w1SIVKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6541.namprd11.prod.outlook.com (2603:10b6:8:d3::14) by
 SA2PR11MB5018.namprd11.prod.outlook.com (2603:10b6:806:11a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.30; Thu, 8 Aug
 2024 20:33:17 +0000
Received: from DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347]) by DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347%5]) with mapi id 15.20.7828.023; Thu, 8 Aug 2024
 20:33:17 +0000
Message-ID: <f65ba0d1-46e8-49fb-b137-18842caeb826@intel.com>
Date: Thu, 8 Aug 2024 22:33:07 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Allow to compile out debugfs
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Jani Nikula <jani.nikula@linux.intel.com>, Matthew Brost
 <matthew.brost@intel.com>
References: <20240808171121.2484237-1-lucas.demarchi@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <20240808171121.2484237-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TL2P290CA0028.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:3::10) To DS0PR11MB6541.namprd11.prod.outlook.com
 (2603:10b6:8:d3::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6541:EE_|SA2PR11MB5018:EE_
X-MS-Office365-Filtering-Correlation-Id: 69b7a569-3589-4858-2d7b-08dcb7e9555d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VEhISElGZnJ3aEJWcmk3SitROHp3Yi94UG5qS3FmTCtjTzBHcnhMYVFjaW9E?=
 =?utf-8?B?VERhUXV1QzVhRU5lNmEybC9zWC9uTnZMVitjd0t1MHFBdXdVRU5Ldk5DWDMz?=
 =?utf-8?B?dkZnK29iRy94dTNVZXFpUVZMdFRiaHhSeUI2cnpNWUd2TkNIdzhaUHQ0MVg2?=
 =?utf-8?B?czVCdE5FSEYxaEFOK0lwM3BmVkYvb0s5UGtZOWE0RU95TlRaQ0tiQ3lHc0dw?=
 =?utf-8?B?Ymc3U0RtclVETzdmZEFpUTNOVFRaN2x0RE05S0I4WWc0bnVPRHI1Q2Mxb0pv?=
 =?utf-8?B?azdOQkRXcTNsQzFoUjZlbEZlaFVub0ZpRU5VOXp2bVFjbVhaT0pLelVNaGxv?=
 =?utf-8?B?S251eEdtWGVTRElMYUFuQ1ZIMS9RWElFRFQxejMyNUNLY1F3Y1VKemVDWUVW?=
 =?utf-8?B?Y05TK3lqd00yYmZ6QndMaEZacmdSZXpYS3dGaTVCaUNqZVFjSGJiSHRSRHk1?=
 =?utf-8?B?UnkzcnhLSHBnY2tIbW9OM3d0bi9qZCtiUk1KRmFETWIvUzNTUjRsVkxLY1Y2?=
 =?utf-8?B?ZGF3aEpTR1BHQnVieXpYVUswamZ2NGJMcCtvRjZOMVJIeVVDZUt3Y3ZyWWp6?=
 =?utf-8?B?am85TGU1NFpLKytIVWJiR0NmQkFyZ1JkQXkyRjlHd2RMbDR6TU9xODIxNTBt?=
 =?utf-8?B?MzRwUnorYzdyb2ZTUk5tTS9hV2ZxSzZIdjZ2QnlMZGFXbE1ST2pWSlA2a25i?=
 =?utf-8?B?dDF6NHJxT1JBa1hSYStWZmZ0UlFZaWQ3S3VSOW9IdS8vUTM5SC9PMXVmZlkv?=
 =?utf-8?B?T0hQQWEzNnExWitBQzNpamh1NXFDczEzV0pMUFhiTDB2VjlneEs5OFNqNFhR?=
 =?utf-8?B?YlZYeHZSN3pwVjBBTnUxL3FkUDZBV09LQ0k3VlZZWXhPRHlwT1ZjVEdpc3Ur?=
 =?utf-8?B?aTdOelBFS0N4WEFKQlZCYU9iWWtwazRxT0huOHZPRTV6b0hCTFpDS0lSTUVD?=
 =?utf-8?B?M3FiNW9vbTRIY1hsNkQvS1NvVHQ5N296NlEvZCthTDB2NHIvM29SNVpHbzNs?=
 =?utf-8?B?ektJZW1RMU1vSFpxaUZueTByY0JDYjFrYWJ0bmpvaXI0UFRXRmZrK25qZU9T?=
 =?utf-8?B?b0p3SDU3RkN4VGxNVEF2NjJoWTc5RWFsdmtsa3c0cHJZY0JFYUowQ0hnK0Ji?=
 =?utf-8?B?WERNVVdUN0lTRW5GYUtvMitVYUFBaW1kMC80TUM5SUd4NHc5aDhVa0s3WlEr?=
 =?utf-8?B?UGp0WDlEUElocEJMSklWeUg3cjNSeWdKRDhCUEZtQ3VrOW85d3VPWFFoRVNr?=
 =?utf-8?B?SUJVL25iQkFwOE14VWNBbFZ5S3pBaTV2RmpHbG5QWmJPRXdDY3N2ZlFId1Y4?=
 =?utf-8?B?cVEyOXpZYWlZb0h4anprZDlFMHBjYVdlTUwwYlJoeExrNDVOMEdxM0E1SEdH?=
 =?utf-8?B?ZHZ2WEJmTGU0YjJuOFdHNVYzRlFwakZia3g5R3hJRmR6djhyVDU4eDk3eTNm?=
 =?utf-8?B?VnpqSGFBT1gwZENIM0VzU0V1aVlwZ0cwd2gvcTFaMlF0SHBWUDU5cXloR0FV?=
 =?utf-8?B?TjFoRVU0NXh5RFJkWVlmZHJYb21BRGI4N0ZNUjJKcjM1TTBaY1c2ZERQalpC?=
 =?utf-8?B?Q3JpZktSQ3RIb3FUQ1IraEh2Ri9MUmJQcXNhVFRWWU1OcXFXYjVsWWxKb200?=
 =?utf-8?B?OFZuQlJNOEcxeUFid1dGanJzN3BacUx5SVRmL2Vrd2FBazFabWhJQlhiUGYr?=
 =?utf-8?B?R0E2RjFoYWdjVzl4L1VHZ3JNYXNueXhxS0VsVW53TjJudnY4ZFVBc1A4aElt?=
 =?utf-8?B?V2xYWW1Pa0hTdFRURFBLakcxRjR5T2tFSklGVzFvY3I5MWpQZVloVGxPQUFL?=
 =?utf-8?B?dXM5elVsRzRjeEYxRFBsQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6541.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y2p2VTJpejNWNU9ka3BOYUFQSEdFVmUrOU1namxOZFM1V2Q2TzZkdjRLaHdU?=
 =?utf-8?B?b05taTV4U2M5RlRPb2kwN1hYVHRPL1lpa2dvWExCNmFNT3NkZzRFbjlLWWFV?=
 =?utf-8?B?VDVPSDFVYmdYbGNqSVZhOGtGeldIOEI3NHF6TGJXUkEvOGRIcDR4ZmNjTldT?=
 =?utf-8?B?b1VYZmJqTTFsalBpaDc1OHQ1SW9HODZ5cjBNbjJSTUhDd3BLSnEzbnRCa1Bz?=
 =?utf-8?B?VGh1ZFlDczFMclV5UVRYMm53NDVxMWlBVGFmaTIyaElRVWtnVjlXTmZ4ZzRR?=
 =?utf-8?B?RVhRNTRucXVLM2JRdGlwNUNIcW95MVBNUUthOUFzdW4wY3FqUm1ka0l0Y1I1?=
 =?utf-8?B?L09odVB6cmwxakhpYUJWdE1Ydmd5bS9kZG4rK3hKMUpHemQyKzZqMXBnWEwy?=
 =?utf-8?B?bzM0OThVbDNYWElLbEF4bWFPQ0REcmJXOTRFMFVmTHF3N2d4UklFMGZMT2RI?=
 =?utf-8?B?NCtySTVUNS9ybU1LeUMyNDFoUzBiTEc3Tys3ZDZmb2hUeHRUc3NaWnM2ODAx?=
 =?utf-8?B?aVREZTIvano2S1pKd1VrSTZvbG1ac0x5M1lVdUs2ZWRhc2ZkMzhzbGNud0pH?=
 =?utf-8?B?a2NNa0ZNUzZCd2RNNENUTXAvYlFRTU5LKzFRVy9OcUNtdWI5UG1tTXZRWk0x?=
 =?utf-8?B?NmhkQlRBWnNybUN3Sms3Uk8vempZU3lFWGdiQWlRRFFFdmREM1krOExZRjZU?=
 =?utf-8?B?aGN2STlBZ2grOExndXRrRndyZXhjSWhtZHUvbkRlVXQzaUdjS3pST0kwMkFN?=
 =?utf-8?B?bk9BVm9sby93RHRDUXloMkZuTTE4K3VsK1ZSVm5KeEZ6Qk91UHBtbW11Slor?=
 =?utf-8?B?OTBoNTUvUWY1WThIWldKN1VlWGloRCtldS9VNU5ORytWVjNWbk8rV3kvZnlU?=
 =?utf-8?B?aWJ4NW4xbDJRSGloTXE3eXExQUx6UHppbE4zQjZIelk5VE55d1M5ZlR5TlZz?=
 =?utf-8?B?MHVuTUYyWHA0OUF3K1JuT1VFY2RRalMxYXVVRlNoeVVlcGR5a1V6RDgweTJy?=
 =?utf-8?B?N2xCQmcyaFVHcUhtWWJ3bHdKL3lGdHpJRU8xNk11SUN3cTBpZWl4RXlwdUtR?=
 =?utf-8?B?eWhPeXBJSitHMTNiZUFZaVJ4dGFCZXRLcFp4VGZodmZEZWZ5SlBEYjVCVkdD?=
 =?utf-8?B?dDdXZFJpL3BMNHF4clYxaFVBZnJWRlYwNG1DWEUrM1J2NzdXTFV2OTZvakpp?=
 =?utf-8?B?Rkdrc0w1OGFwQ3JuT2dvaUF4ajNrb2lkVWw2ZURKOHI3ZWphd0pSYUtiTUxa?=
 =?utf-8?B?SnEzVzA3a1JTVko1Q2tHbjk3aDVPdGppR1h0RFg1QUdLQitucUE2YmVySmdr?=
 =?utf-8?B?ZTYycnYxYnMwM3MreGNyNlRQeUNvUTVST3I5Y0k3SG9rSCtlM0tyd2g3anRK?=
 =?utf-8?B?Uko0S01hemVJZFBzamRHVEhPWHJ0eGJrb1JQNUdDQWdKUmtERU1DOWQxYmlx?=
 =?utf-8?B?ZCtDUWJZa3pwOXZVWDZwR1J0WlRUREhaNDZoTlE1STNscmswcE52SWV4SUJo?=
 =?utf-8?B?RkNpeFdKa0lrNGw2dS8xT0FxSGoxRjhvbUxidU0zcG5kT2NWMGtrY09HbWRz?=
 =?utf-8?B?MDN3VU9JK21adVhCOWJRRXhPdVJMM2tFa01ZMlBIR2FDREJ4L3dDRWVmRlhk?=
 =?utf-8?B?azZUcFBnaktMSmtmY2ZYblVhaTZMM1AxdVJBRkNWYkNhajJLeXAyTjdxN3c1?=
 =?utf-8?B?akNFblUyOE1qRXo5UVZVU1BFN3dpZW5wVUF2ZXZJTXVWcTkzSnNlVDBtTTBh?=
 =?utf-8?B?YUxVblUzcTk0K2JjQzBQaEEzdjVOSGs0aEFwY0tpTi9QY2VOZFM0OWF1R0V4?=
 =?utf-8?B?M0lNRDNOZmMyS1I5akFCeFpBc20vMDlpMjhmLzJGRHpzUGlxOERDVGI5MXBV?=
 =?utf-8?B?aEsxMnZwOHg3Uk5iczZLSnBaNzZwK0x3bndXUFltNDQ4clloMFVyb1ZKTkRU?=
 =?utf-8?B?NmxIMENCclM0YnRnNlJhQzlhTGJZM213YnBWdlh2ZlRtejNkUWV4S2JxdWVX?=
 =?utf-8?B?Q3RIM05CUzV3SDJ0SkFMaFZ6MUN5NjlPMzZTSVpsM2xIUUpRQ2pKcFlrTHdm?=
 =?utf-8?B?QTgrbTVJcVpOZmVvYVRVMFUyYUtCN3Z3bW84ZHlIazVoMkhWMDZYRXMwQXAx?=
 =?utf-8?Q?fP/W33FBIEu7QXbMUyENuMBlM?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 69b7a569-3589-4858-2d7b-08dcb7e9555d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6541.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2024 20:33:17.0526 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P+RcxRF4+7jrMAIMphsj955MZ+C34d1TYb2aa9CyIH+/dnNEGvnaVpuoTQy7AVOUl2I3aLxPM0nyg7ZDZbUYDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5018
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


On 8/8/2024 7:11 PM, Lucas De Marchi wrote:
> Use a dummy xe_debugfs_register() if debugfs is not enabled and move all
> debugfs-related files under `ifeq ($(CONFIG_DEBUG_FS),y)` in the
> Makefile. This is similar to what was done for display in
> commit 439987f6f471 ("drm/xe: don't build debugfs files when
> CONFIG_DEBUG_FS=n").
>
> This removes the following warning while loading xe with
> CONFIG_DEUBG_FS=n:
>
> 	xe 0000:03:00.0: [drm] Create GT directory failed
>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>   drivers/gpu/drm/xe/Makefile     | 16 +++++++++-------
>   drivers/gpu/drm/xe/xe_debugfs.h |  4 ++++
>   2 files changed, 13 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 1ff9602a52f6..b846b36a7bfd 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -28,7 +28,6 @@ $(obj)/generated/%_wa_oob.c $(obj)/generated/%_wa_oob.h: $(obj)/xe_gen_wa_oob \
>   xe-y += xe_bb.o \
>   	xe_bo.o \
>   	xe_bo_evict.o \
> -	xe_debugfs.o \
>   	xe_devcoredump.o \
>   	xe_device.o \
>   	xe_device_sysfs.o \
> @@ -46,7 +45,6 @@ xe-y += xe_bb.o \
>   	xe_gt.o \
>   	xe_gt_ccs_mode.o \
>   	xe_gt_clock.o \
> -	xe_gt_debugfs.o \
>   	xe_gt_freq.o \
>   	xe_gt_idle.o \
>   	xe_gt_mcr.o \
> @@ -59,7 +57,6 @@ xe-y += xe_bb.o \
>   	xe_guc_ads.o \
>   	xe_guc_ct.o \
>   	xe_guc_db_mgr.o \
> -	xe_guc_debugfs.o \
>   	xe_guc_hwconfig.o \
>   	xe_guc_id_mgr.o \
>   	xe_guc_klv_helpers.o \
> @@ -71,7 +68,6 @@ xe-y += xe_bb.o \
>   	xe_hw_engine_class_sysfs.o \
>   	xe_hw_fence.o \
>   	xe_huc.o \
> -	xe_huc_debugfs.o \
>   	xe_irq.o \
>   	xe_lrc.o \
>   	xe_migrate.o \
> @@ -107,7 +103,6 @@ xe-y += xe_bb.o \
>   	xe_ttm_vram_mgr.o \
>   	xe_tuning.o \
>   	xe_uc.o \
> -	xe_uc_debugfs.o \
>   	xe_uc_fw.o \
>   	xe_vm.o \
>   	xe_vram.o \
> @@ -124,7 +119,6 @@ xe-$(CONFIG_HWMON) += xe_hwmon.o
>   # graphics virtualization (SR-IOV) support
>   xe-y += \
>   	xe_gt_sriov_vf.o \
> -	xe_gt_sriov_vf_debugfs.o \
>   	xe_guc_relay.o \
>   	xe_memirq.o \
>   	xe_sriov.o
> @@ -133,7 +127,6 @@ xe-$(CONFIG_PCI_IOV) += \
>   	xe_gt_sriov_pf.o \
>   	xe_gt_sriov_pf_config.o \
>   	xe_gt_sriov_pf_control.o \
> -	xe_gt_sriov_pf_debugfs.o \
>   	xe_gt_sriov_pf_monitor.o \
>   	xe_gt_sriov_pf_policy.o \
>   	xe_gt_sriov_pf_service.o \
> @@ -281,6 +274,15 @@ ifeq ($(CONFIG_DRM_FBDEV_EMULATION),y)
>   endif
>   
>   ifeq ($(CONFIG_DEBUG_FS),y)
> +	xe-y += xe_debugfs.o \
> +		xe_gt_debugfs.o \
> +		xe_gt_sriov_vf_debugfs.o \
> +		xe_guc_debugfs.o \
> +		xe_huc_debugfs.o \
> +		xe_uc_debugfs.o
> +
> +	xe-$(CONFIG_PCI_IOV) += xe_gt_sriov_pf_debugfs.o
> +
>   	xe-$(CONFIG_DRM_XE_DISPLAY) += \
>   		i915-display/intel_display_debugfs.o \
>   		i915-display/intel_display_debugfs_params.o \
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.h b/drivers/gpu/drm/xe/xe_debugfs.h
> index 715b8e2e0bd9..17f4c2f1b5e4 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.h
> +++ b/drivers/gpu/drm/xe/xe_debugfs.h
> @@ -8,6 +8,10 @@
>   
>   struct xe_device;
>   
> +#ifdef CONFIG_DEBUG_FS
>   void xe_debugfs_register(struct xe_device *xe);
> +#else
> +static inline void xe_debugfs_register(struct xe_device *xe) { }
> +#endif
>   
>   #endif

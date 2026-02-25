Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCD90EF5862
	for <intel-xe@archiver.kernel.org>; Wed, 25 Feb 2026 06:17:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7711310E6AE;
	Wed, 25 Feb 2026 06:17:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Oaa8A6k8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBC5910E6AE
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Feb 2026 06:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772000253; x=1803536253;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+3cDb3xfTVeJFl0jSZFh4gHaVfvBtk+TZM2L1oZqPwM=;
 b=Oaa8A6k8szaT35/mbItgmEAUblJkl5OoCbS1tiSdnGQdOS8WGwW9ls8I
 hgtGhwg22Mbi8UfgrRmg7EwnsL94cI0jlrrCjEpraA2RIa2paZCk5N1xi
 HN46bWqwm37Fpt/vhSH2Xat9RbZas81Y4SLQzzspijKl25TFrnskWe9Qr
 6lb3YL5DD5HF9KZtHOqFOdFF7GWL9j5pHv57V4xYJOI4xB0dQRoNYv42/
 nFUiBWQbIAypD2av/xk5YOjzw/TgGWBBOsUq6pSFXNIloLAxBh5Xtx+qc
 S73Quky4YgwVDfww7q+Lxhg9nyH6Qc5PVyo5W1sEelekr0r955SyX3lLs g==;
X-CSE-ConnectionGUID: k2Q/6bWGQvKSk8L8L8LTIA==
X-CSE-MsgGUID: 3A9zzd/CQjuk9BRWtpuR/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="72907073"
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; d="scan'208";a="72907073"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 22:17:32 -0800
X-CSE-ConnectionGUID: Y0TTm69vQHGhY5NSjHbw8w==
X-CSE-MsgGUID: govYj84pRPWscvE395HFDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; d="scan'208";a="214938154"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 22:17:32 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 24 Feb 2026 22:17:31 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 24 Feb 2026 22:17:31 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.13) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 24 Feb 2026 22:17:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mcMhhA580z93sHq2ak6C25NKO0pgJVaghjVnAnP1uIL0DCqE4HHr1p5CWwkd80cvsd8bYrUnXI+NKsFU25uc4Z6jhSj7s2UhT38hCIZCP4aVH3n2M/xniPbX24YKH/qTFI16xI0caMkvlzxnEWqDc8MoagG9pqtp8odDXi85CxrYPvviPdpPhvEziUAVJg3QwY7tv7ICwy678AH6A2MftAXqhUjMruTwM//XSXFKXk8cKWAnL8NLQwX6AjJo5JPAE5RNOnlonkTjG5DGl9dWPRG2Ke+rtLS+p6GMRQ+NkmNTpNzgouf7oOA5awybOqPQqsuLuZ2sbr61IyRHQpkHeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ngc+F4/JFEnDlUWCMqQBGoHdB9sB7LPQs70FwmLnd6o=;
 b=XE1jkWAuduvtH9q6JUlcF8wkjFnHD3efIdv5eVzcHmte169w3T3ufEM/sQuycc/o0x8krOKM37OgWv6+SDP+GsXXgzoECrfpmQTsIoXGeM/1NS+mi7DzidTEJ1r0c4fCV6+uCWO3WynSSwnyggoD7MchYDqaK2xwmBxg1NJNv0bmD4IAa/fG2eN4INIMJvlEjBs9VIXpX6/+u3B6dbdW8+/ZnzpvMVfLgvaX2O6oRElc7WSs2BY5WvMW0XqsG+v0EBsvA5ko5wbka/y6yzMwY3CTmyWTwcyKdBprUGpK/CTU61l/F7ymACexk62JP/wNEb4fg1XBXbn8chw6GwCTnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5366.namprd11.prod.outlook.com (2603:10b6:208:31c::17)
 by SA2PR11MB4955.namprd11.prod.outlook.com (2603:10b6:806:fa::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Wed, 25 Feb
 2026 06:17:24 +0000
Received: from BL1PR11MB5366.namprd11.prod.outlook.com
 ([fe80::942f:90a0:fade:3848]) by BL1PR11MB5366.namprd11.prod.outlook.com
 ([fe80::942f:90a0:fade:3848%4]) with mapi id 15.20.9632.017; Wed, 25 Feb 2026
 06:17:24 +0000
Message-ID: <9ad9bac0-1fe0-4dc2-b767-b2285653d4a4@intel.com>
Date: Wed, 25 Feb 2026 11:47:17 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Skip BO migration when platform supports CPU
 atomics on VRAM
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>
References: <20260224092758.1880683-1-varun.gupta@intel.com>
 <aZ3Z/fGBaTBtyd2K@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: "Gupta, Varun" <varun.gupta@intel.com>
In-Reply-To: <aZ3Z/fGBaTBtyd2K@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0099.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::7) To BL1PR11MB5366.namprd11.prod.outlook.com
 (2603:10b6:208:31c::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5366:EE_|SA2PR11MB4955:EE_
X-MS-Office365-Filtering-Correlation-Id: 560cbac5-c8ae-4e3e-9071-08de74358a93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aVQ2eThBc0ltbFVhTWM2ZU5jS1lQSzFkUUpHVkNqdDZsY1VLMDVzd054ZElx?=
 =?utf-8?B?QjlmaC9WUm0zemZGOGw0RkFkWE9JMFBad0JjUjI2NVJrQUxwTzNhUkkxNk5x?=
 =?utf-8?B?eEVWOWROU0pqUzU4U0FxT08vTkRhUkl3cUp4djVYUWo0cGd6dnZScDlNQStZ?=
 =?utf-8?B?RXI4S2x3VWVCdG1UVDJpY2lqTnkremhwMUxjNVBlZW50ZUhaaGlXRDZVT0pC?=
 =?utf-8?B?YWpXZGVuSnQ2RThxZjU2QVlDS0QyLytQQ05TZXhweFgxUTg3SWhGMTBUOWVU?=
 =?utf-8?B?MW9pTzcwY1ZEY1FpT01LbXBXSkpHSjJrWjRFMzRJYzJqcDFaR2FqaDRRQmdS?=
 =?utf-8?B?SXhYR1FBWUd4VjlNbUV1aFA5NTVVV2NhcmtPT1hyVlAwRVM3ZmdGc2gxMVpr?=
 =?utf-8?B?TWNQazc5SHgxTytzYlhlZElkWUN4S3BxbWJ5Zm01TldaYm5laEJnY1pIaXpW?=
 =?utf-8?B?ZUpjaEo2SjNWd3ErNmRaNng0UUJ3TUlUbzRnRTVnaWlYeE1Yb0xyMTcvak03?=
 =?utf-8?B?bFdpTzA1T0xWK2NxNy95YUdpdlVJN2NOYTJHaDFEc25hL2hZcmFST2NiM0Zp?=
 =?utf-8?B?cEpFVnhLS3pZeTdLY2xMQnJKLzd3ZXdxK3RoWVZtUC9vczFmY3lzTGd3Zmpo?=
 =?utf-8?B?OHJCZ3JrNlJhbmFGL044Mk5SYUJwMVVGYVRiNlRvZk1SZzh1bW1nM1FjRW5L?=
 =?utf-8?B?aTZVbmpKU2dYVWw2eHYwa25md2dUNSt5SjhlTDZMeXNzYTNoMFZDK3cxcm5F?=
 =?utf-8?B?cnBHeW1zM2laQUJuMkhHa1FmRWZjczh5eEZPNTQzclFhTE5lWGZXRC9jNW5m?=
 =?utf-8?B?NnlLVTZUbXQwMWl6bUxnVWViY3llSXU3RjJia254L3VqYjZMZklOdkZiZVg2?=
 =?utf-8?B?V0lZUzUyOVd2SnV6U1RxaE56SXFnL1dyUC9ZRWpBMkIrNFgzN3E2bG96bkZL?=
 =?utf-8?B?SS9zOU1FenRCOXYrUkNkd24zUmtMU0treVQ4dGozdmpZTWp0MWozQXA4YUsw?=
 =?utf-8?B?aDFISXQrVFEyanVWUEVJRStIWGhKT05UNi9iK0ZSaDFqZjd0M2FBNk84WEFK?=
 =?utf-8?B?UjI0bDh4ckRjNitmUmZBRmdzR05yeTIvYlgvcitnbnhxYTZDZVpHc0M0VUtQ?=
 =?utf-8?B?Q2J3bmlNcks5Vzh4QnpSeXNOWTNTaHFaczN2Z0YvSVoxOWpFK3J3Q1dMM2sx?=
 =?utf-8?B?UStKMVFxZW1YNWtjdVl1M2VNYWVGdzNKWmZleDVQWGJHanlMb3pLaC9Hc3ha?=
 =?utf-8?B?ZktBdWRCamFpNU12ZHFJR1o5UVJhaHlxR3MxUTRwY3hrL0I2TmtnNU1zSE02?=
 =?utf-8?B?eFhKTytJU09SdUIyVEtWYWYzVGowV3cxcTJKcXNYTkpaWFNWRlRVU2JJU2F5?=
 =?utf-8?B?TTlBeS80dUVxa1NCVmw2dmEvK2Vaam8remVXazY2TXY4VURrRUdJclZvQUJ5?=
 =?utf-8?B?RENUMVljTWE1YzZsRElrSWcrS2R4Z1BBU0ZsRFQ3Z0dudG9QWm1wd2Jkc2NB?=
 =?utf-8?B?NTlLdkFWMk9MVWF5WWo2QTZ0WFg3Q0hOcTFZM3FTenFCaG1tdnBmaXk0bzl0?=
 =?utf-8?B?SHFuZVJocG1sK0VMZ0JQLzZPZ24va1d6cWprZklLUUNkcWl5NER6OExTdWFQ?=
 =?utf-8?B?UCt0ZEVZTEs5aERmQTdFMHNQL2h0VEZyQld1c1c0alM3UWhwbit0KzQ3Y3FQ?=
 =?utf-8?B?cjJuMWV2bzF4a3g1eTFiaWppYmVPcEl3bjlSc3A4N3VHV1ovVFV0TUh1K1Z2?=
 =?utf-8?B?WkJINjVRR1N2US9EcnlFQ0JycTdnN3cwTWNJL3RlaFk1dDRrdkhUWk50MzZh?=
 =?utf-8?B?dUo5b2tmOFR2bXdlNmlwc2hMUUhxdHVEbkFTamRiSWZqTDltanpJK25pQ0R1?=
 =?utf-8?B?Y21Uc0pvMmxjNmNFb2NYNzVxUUdLb1JUbW9nb1lZRUUvZm1Fdmt4SDA2Y1BH?=
 =?utf-8?B?a1JydEpFYnZ3M1NXZ1ZWR3B3eUNiMjAzeDlRMUk4UFpJV0kyY3JzYzY1UmJY?=
 =?utf-8?B?NXNmd0UwTmh4VVRUQzZjTHpzNVpDelh5NEFYWGMySXU1TklLTS9LUVFadC9U?=
 =?utf-8?B?U2pGMWJmODZQSHNBK2Rzc3pMbTU4VFJXR2wyZFJLNzBBbnFXT2ZueTN0QXkz?=
 =?utf-8?Q?hj30=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5366.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MlVVSUM2T1FLbEJtN1ZIcmlIUldMOFI3MG9ReG14NFJnSzRYZ2FtM2R2dU5a?=
 =?utf-8?B?b2VnMmlVSzNHT3NUdXNicXFhRW5nM0Rrb0plZUl6T2NrUDRvL1B0N3hLQ24y?=
 =?utf-8?B?TXdVU2pXTzVzS25KaThWMVRFQUhHQm9SSmZWRkxZN0t6SWhIaWpDMXNnME5I?=
 =?utf-8?B?OHM5UWw3MXYzZ2hwSlV5cUczZGlWUWdyWUVmNkFJcVEybVZtRzdwQXpHQ0ND?=
 =?utf-8?B?NDFzQzVrWEIvSnVTU3RyMGloLy9sTU1DZ3RHT0pjMitLNG10RlBKWkpNamxh?=
 =?utf-8?B?cEREcVhoWmZtSHNvL3FuSnhGNlQ3eGl1Vjl2TVc1UHNlcU9EZGtjZjE1WHA5?=
 =?utf-8?B?aWJsUUxhTEdwVVJmelM0Tk1mU2xaclIyWDk2cDZJbmxrUzhGVFZIZzc4S0JH?=
 =?utf-8?B?VEVscmZ3bzh5a09JekZ0WVRxQ1dDWUQ5MjNPUDREUGh1bmNzRVUwWHBxcHBj?=
 =?utf-8?B?YmFwaXk0Zm9sTzQ1MkdlQTlLaS9NNEkyYmR3NXFEMnJNQmJLbE9jbFBCa2Q3?=
 =?utf-8?B?a1JITWt4V0NaaHIzZlprcncwYlg2bHYzSlBWRkp6SEQ4TmxIM3I2anl4ZXJL?=
 =?utf-8?B?QmV2Q3ZKUkowbmxzYUhoTTVjK0ZvVzg4MnZiOFF0N05YZHVQaDRnanhxSU1Y?=
 =?utf-8?B?aVdXbE00bU5na3VrZWFIKzF1WGU3dEM1UUpwTXZ2elVBa1JlMFVGUTlxbGwy?=
 =?utf-8?B?RGIvakZZVXZtOUJLR1RtdTFyWS9tS3U3cUV4dG8zM2ZjWjBZNVlDLzVJNjdX?=
 =?utf-8?B?VjJhVTh5L3c3b2J4S3VqUFZYQTI0TEFSYVRZQkpPL1FGYXB2Q21IYXEvUi83?=
 =?utf-8?B?VzViSU5JMkpWS21yL2tOQy9pdkl1VjYweHd5eUdQRWl4Q2RBM2sxTTFtVG9W?=
 =?utf-8?B?Z2VDUjdxenFzajErMHI5dzR0Mk12ZDlmaEtzMFZhalkySDNFQzRTa243MURl?=
 =?utf-8?B?a2U4UHJhenZaZjhYR2VTbndXL1lEc0R4TWFBc0UrV1dnblpuZVlncWdYWDFJ?=
 =?utf-8?B?WnFDbGNyLzRRbHc1NEg4ekllNDNRdVdoODBxOUQ3ZmE3cEg2aFlkUE1JYjVo?=
 =?utf-8?B?QTlhZktGa2VXblJTT0pxRzZHOUNEM0pCbDd5UHBaSkg1bEo5UGt0ZEw2bWhl?=
 =?utf-8?B?Z0U3Q0haWGVjYmVKclNWWnFNZ2RWNTFKMk5LeXJpWnJuZzg0MWlYcCsvWWd0?=
 =?utf-8?B?VUthZHFOTUlDVWNROFFreGlib2hDcEovV2E0MWtGS0NCbGpDKzBjcWlkWXpI?=
 =?utf-8?B?R205Z3NTd0xMclBXSTlDL0wrUWQ1Rjd0b3ZZUkduK0QyZlFMU0RxK3dxeEda?=
 =?utf-8?B?d1hFbGl0TC9SRDNoZlRzd2krcWpjUGExOUdHbS9QbEk5RFBramUvSFpKa1lP?=
 =?utf-8?B?bWpFendvdWNxNVlIdnlPSVZjVnh0ajI2UkZNbzJoeTZtSzRrTWtyTUNLMDVI?=
 =?utf-8?B?VjBsdzFQd1kzNVpoaVVPR0pBQ2Nqd0lIcXZicDF6R1ZuNmx1K09vaEphVVVM?=
 =?utf-8?B?OTA2dk1CQ0NjZEZmNGJBME9DM1UySjVuQngvSDJGVTVjMnpHQ1UrM01uYWNv?=
 =?utf-8?B?YmtHSGVpaHZVemhVVkQ0QjdvT2s0Mk1SVzhKb1lrTmVHbU8yZmUyUE9BNXBY?=
 =?utf-8?B?eUxTb1d3OGQwTERQLzR4Uk0zWEwxQzBzS3JBZlBCQjA0S0RhWWozQ056eS8z?=
 =?utf-8?B?RjdBNUI3ZlYzc3l1TGFNQTdGazN4bkZkZ2VpbHN1YndEcnk0NnVsbkpOOFlF?=
 =?utf-8?B?alhDNEF5Z0pSc3FDNk5qWkh3KzdTSnN0Q1Q2N29pL2huVkNBM2VBc0FwTHBy?=
 =?utf-8?B?aTF2aTVrOEVPUTVPSkcxaU5aS01veXMvMFlueFh5dHpicUgxZ1RvMkZvZW1G?=
 =?utf-8?B?ZVVvNEdWeVFySnpmS0p1MzVjSzhWd2hUR0p2VzdDa3ZWYW1JUHlUWSs0c0dp?=
 =?utf-8?B?TWM2eU1QWUlJL21nMlZyT003VnRhZ2VlMUs5eTN5NEMraEVjVnl4UGYwYUh0?=
 =?utf-8?B?K0lDWkcwWkVDZUhTMVlGSlVmMi9GMzdkaTh5OUNGUGUvOVpaUmdoMnRYUE5t?=
 =?utf-8?B?RDJ6N2w1UEtkUktSbS84OGtzOU1LMFdicGFqYWZ2UWwwU2hFZFBzVk1vaGVT?=
 =?utf-8?B?MndMQWtWOURQb212YXhUaFBwWkhSNGJMbUU4S3FzaEtiQ1o0VVd2T0RBQ0lx?=
 =?utf-8?B?Z2pnaWxBMGZJb3dPSU5wc0dxVjRZdFk5UFl3MWxaUXcrVjl2RFpYdVI1UmpC?=
 =?utf-8?B?RGlEQ0VnaS9WWWZMNSs4ZEEvSnBoVFdlMXZHZFRPZFlnWXpiazhrWWNPbEVG?=
 =?utf-8?B?VHZmUk03Zm1US0JYSUpXSjJ2ZFF1cWt4RFpSNjNvc0VPWmc2SjIrdz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 560cbac5-c8ae-4e3e-9071-08de74358a93
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5366.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 06:17:24.3607 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DV3u+1d82rpEra5je4qS60F4VcthaDWyKdBuUz3gMk6p5aL3UGmxgTZHPBGnHMtHHSTv83mVTl0go3jZIzlH2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4955
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


On 24-Feb-26 10:33 PM, Matthew Brost wrote:
> On Tue, Feb 24, 2026 at 02:57:58PM +0530, Varun Gupta wrote:
>
> Are you sure about this? CPUs supporting atomics (i.e., CPU instructions
> with a LOCK prefix) over PCIe is news to me. Why do you think this is
> supported on Xe2? Also, wouldn’t the CPU factor in here too if it were
> supported?
>
> If this somehow works—which I doubt—I think we’d need a test case where
> the CPU issues atomics and the GPU does too. Then verify the result,
> e.g., both sides perform 10,000 atomic increments on a VRAM page and we
> confirm the final value is 20,000. Maybe we already have an IGT madvise
> test for this; I’m not sure.
>
> Matt

Thanks for the review,
Before sending the patch, I only tested whether CPU atomics on VRAM were 
self consistent or not.
But that possibly worked only because root port serialized the read 
write instructions instead of actual
atomic operation.
After your suggestion, I wrote a simple subtest to run concurrent 
CPU+GPU atomics, and observed
that there are some lost updates (around 150-200 for 20000 operations).
Do you see any other approach that could make this work, or should i 
drop this patch entirely?
The has_system_atomics_on_vram could be kept as dead infra for future 
CXL-attached devices where
host-device coherency actually works.
Let me know your thoughts.

Thanks,
Varun

>> should_migrate_to_smem() forced any BO marked ATOMIC_GLOBAL
>> or ATOMIC_CPU out of VRAM on a CPU fault, regardless of whether the
>> platform actually requires it.
>>
>> Introduce has_system_atomics_on_vram to the device capability flags.
>> should_migrate_to_smem() now gates migration on this flag, eliminating
>> redundant evictions on capable hardware.
>>
>> Signed-off-by: Varun Gupta <varun.gupta@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_bo.c           | 16 +++++++++-------
>>   drivers/gpu/drm/xe/xe_device_types.h |  2 ++
>>   drivers/gpu/drm/xe/xe_pci.c          |  5 ++++-
>>   3 files changed, 15 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>> index d6c2cb959cdd..848467ca6700 100644
>> --- a/drivers/gpu/drm/xe/xe_bo.c
>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>> @@ -1771,14 +1771,15 @@ static void xe_gem_object_close(struct drm_gem_object *obj,
>>   
>>   static bool should_migrate_to_smem(struct xe_bo *bo)
>>   {
>> +	struct xe_device *xe = xe_bo_device(bo);
>> +
>>   	/*
>> -	 * NOTE: The following atomic checks are platform-specific. For example,
>> -	 * if a device supports CXL atomics, these may not be necessary or
>> -	 * may behave differently.
>> +	 * Migrate to system memory only if the platform does not support
>> +	 * CPU atomics on VRAM.
>>   	 */
>> -
>> -	return bo->attr.atomic_access == DRM_XE_ATOMIC_GLOBAL ||
>> -	       bo->attr.atomic_access == DRM_XE_ATOMIC_CPU;
>> +	return (bo->attr.atomic_access == DRM_XE_ATOMIC_GLOBAL ||
>> +		bo->attr.atomic_access == DRM_XE_ATOMIC_CPU) &&
>> +	       !xe->info.has_system_atomics_on_vram;
>>   }
>>   
>>   static int xe_bo_wait_usage_kernel(struct xe_bo *bo, struct ttm_operation_ctx *ctx)
>> @@ -1804,6 +1805,7 @@ static int xe_bo_fault_migrate(struct xe_bo *bo, struct ttm_operation_ctx *ctx,
>>   			       struct drm_exec *exec)
>>   {
>>   	struct ttm_buffer_object *tbo = &bo->ttm;
>> +	struct xe_device *xe = xe_bo_device(bo);
>>   	int err = 0;
>>   
>>   	if (ttm_manager_type(tbo->bdev, tbo->resource->mem_type)->use_tt) {
>> @@ -1811,7 +1813,7 @@ static int xe_bo_fault_migrate(struct xe_bo *bo, struct ttm_operation_ctx *ctx,
>>   		if (!err)
>>   			err = ttm_bo_populate(&bo->ttm, ctx);
>>   	} else if (should_migrate_to_smem(bo)) {
>> -		xe_assert(xe_bo_device(bo), bo->flags & XE_BO_FLAG_SYSTEM);
>> +		xe_assert(xe, bo->flags & XE_BO_FLAG_SYSTEM);
>>   		err = xe_bo_migrate(bo, XE_PL_TT, ctx, exec);
>>   	}
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>> index 8f3ef836541e..2fe643c179fe 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -205,6 +205,8 @@ struct xe_device {
>>   		u8 has_usm:1;
>>   		/** @info.has_64bit_timestamp: Device supports 64-bit timestamps */
>>   		u8 has_64bit_timestamp:1;
>> +		/** @info.has_system_atomics_on_vram: Supports CPU atomics on VRAM */
>> +		u8 has_system_atomics_on_vram:1;
>>   		/** @info.is_dgfx: is discrete device */
>>   		u8 is_dgfx:1;
>>   		/** @info.needs_scratch: needs scratch page for oob prefetch to work */
>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>> index 56a768f2cfca..f2d86e08e190 100644
>> --- a/drivers/gpu/drm/xe/xe_pci.c
>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>> @@ -925,8 +925,11 @@ static int xe_info_init(struct xe_device *xe,
>>   
>>   	xe->info.has_asid = graphics_desc->has_asid;
>>   	xe->info.has_atomic_enable_pte_bit = graphics_desc->has_atomic_enable_pte_bit;
>> -	if (xe->info.platform != XE_PVC)
>> +	if (xe->info.platform != XE_PVC) {
>>   		xe->info.has_device_atomics_on_smem = 1;
>> +		/* PVC doesn't support CPU atomics on VRAM, Xe2+ platforms do */
>> +		xe->info.has_system_atomics_on_vram = 1;
>> +	}
>>   
>>   	xe->info.has_range_tlb_inval = graphics_desc->has_range_tlb_inval;
>>   	xe->info.has_ctx_tlb_inval = graphics_desc->has_ctx_tlb_inval;
>> -- 
>> 2.43.0
>>

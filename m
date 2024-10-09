Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93ECCCEDDA3
	for <intel-xe@archiver.kernel.org>; Wed,  9 Oct 2024 15:07:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 645D810E768;
	Wed,  9 Oct 2024 15:07:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="etYi4moh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37DD610E768
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Oct 2024 15:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728486438; x=1760022438;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=X5DLPh56pH82VhyNAVW6gSoojuoDB1QuK18CsUoYDHE=;
 b=etYi4mohEzKyX1zxL1Rso9aTCx4j9VX5gCD71zHDQb2AMBn6SaNfUopA
 ZccL+3eAyy5q0tsLzO+Ljv1s9VWfx0cbcgG6H2o2MZ4Nfompa2u5oq8qJ
 xVFeC5xtFSIlbZ57/KE9rZis3zPQvh939pTxRRDw8OJ716eaAxRnoYikz
 /uiYah8ujEWduDS3veSF4i9uMDG7KkmOGzAcDmqMWoZ8scYPlbDai3MD3
 35RmJWpfN5ScincHXLb7JtVaB99rqzYSdJ18YJ+cxGFCq/NqaddpokYnX
 /bpRSvvKJsijCkQp5qqry/734usZR6Ys7/YD3BqYV4Kasny5D2/7gSh3y g==;
X-CSE-ConnectionGUID: qjmaCKYPQQyrJw6ZUfoYlQ==
X-CSE-MsgGUID: 0qjAphwyQjeg8RnoUwVM7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="27949922"
X-IronPort-AV: E=Sophos;i="6.11,190,1725346800"; d="scan'208";a="27949922"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2024 08:07:18 -0700
X-CSE-ConnectionGUID: 7GHzxJXERmChNhMAWYJpmg==
X-CSE-MsgGUID: 8UvTh96HT56gnL275dfb6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,190,1725346800"; d="scan'208";a="113751299"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Oct 2024 08:07:17 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 9 Oct 2024 08:07:17 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 9 Oct 2024 08:07:16 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 9 Oct 2024 08:07:16 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.177)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 9 Oct 2024 08:07:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=voAXmuXtdBkQm3c9z5yr9r+c6hs9SGpGSgqmFR+PLDGKXcHwESijsyCGfQg2C9R/hBYJrUQoPkpKWD3k+LbuMtKPWFU9ThYQg7/cTk5bxQbE0EGS0HqDaOW31vvJwWJPBwfc+Bev/UYZmQP/gL/RI0vDJCbNkt4mPNh7zCj+LAv0Ld0r+SVMkjZxpmuEgGaL6ktNivmfXHJKPSPMn+Qa8lCIm0OXNxujEXS5wc90fqaEiJSakPWGZy55RsQ1+E35hQQ/lvRgsAm8fqDATr5xXiF9TiuykL+WuPva2ccuxgibURrIIgUOJSQDdRt0UrukS28REahn2VE1FK2Mcg86Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X5DLPh56pH82VhyNAVW6gSoojuoDB1QuK18CsUoYDHE=;
 b=JG+7sj2Bl16ZEo9Hj8byBdWWQfv8VeGnEh9CFYJo17Zq1U2duJ4WiPtNSqykTSmJNi5oXNLcEP2emudjqvie6EFrYsSQNm6SU/Q2Ize+ITNl55JZhr2+HBY8DDQkech80RVyguczHUfiNJM3ZtZJCHAyhmr75YIjjiU3JSVReKa2aZm0wVoU/7/yyg42+DTCg+ajbksqyAT9k4rzhFC69cfM5xW9u6x01z6a06bTh9pvK/b3RW+tmuWZfdGng+HqWcXI1ELRAfRFqMPVs/SVOm/Rd/N2ZR3u/fqltXFGN8rmC9vAQsv+S5Q5OjA5iMdlbckLBAdrxbK2Sc0KikRN8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by MN0PR11MB5988.namprd11.prod.outlook.com (2603:10b6:208:373::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.24; Wed, 9 Oct
 2024 15:07:09 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.8048.013; Wed, 9 Oct 2024
 15:07:08 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Hajda, Andrzej" <andrzej.hajda@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: Mika Kuoppala <mika.kuoppala@linux.intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>, "Hajda, Andrzej" <andrzej.hajda@intel.com>,
 "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH] drm/xe: add system memory page iterator support to
 xe_res_cursor
Thread-Topic: [PATCH] drm/xe: add system memory page iterator support to
 xe_res_cursor
Thread-Index: AQHbGk+pi0WM1CsYZECzRtkAwAdNhLJ+f+qQ
Date: Wed, 9 Oct 2024 15:07:08 +0000
Message-ID: <CH0PR11MB5444DAB4D66C4A849F82533FE57F2@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20241009-xe_res_cursor_add_page_iterator-v1-1-c883446e5770@intel.com>
In-Reply-To: <20241009-xe_res_cursor_add_page_iterator-v1-1-c883446e5770@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|MN0PR11MB5988:EE_
x-ms-office365-filtering-correlation-id: 87a967da-c22d-4493-c7bb-08dce8740ba2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?eW9XK05UWEFSWXc4ZzRIQ0xKSllydVZGUUZiNmViUmYzYkI0Q0orcmo2MDRC?=
 =?utf-8?B?aW5SemMzOFhxSnMwSmhjQkpkWDRMWjZibVYzQUZmTFUxcmVkWGdOLy9TNGQy?=
 =?utf-8?B?T1JEYnMrN3lMeTRPc041eGFoNU1KbTdpKzRwb2hvMlNKOFFkdjVEd1VXTUtZ?=
 =?utf-8?B?SWZ0ZjgydzUwd1dxRjN4OTg2WWJwNFBFNnhJb1lJRHdleHdKZFdXc1FwN0ps?=
 =?utf-8?B?N3pRWXAzdlYyMlpTUVpOUisvYVo5a2dCaksyRkJYMnlsUldyK2xaeFFoVmNh?=
 =?utf-8?B?eTdNbmpGckFDdEdNeGcxRXFOUlVzZ2VGQTB1dEpaanNsYzl1V0p1VXBiRHBC?=
 =?utf-8?B?S1cxK1UrMDhyVnRvamwwOFNPa1RNQnpWRkpXQy9mWjlaYWRCcTV2ay9laHV1?=
 =?utf-8?B?UVRFU3dhNldrUlRiUzdVaG5kYjJpNTBoSjBINXRSZ1FZYVI5TzlEL0JlSndy?=
 =?utf-8?B?aWQxdUpXZFFjaGp4N2hHakE3a2hFTi9JL1Rwa1piWVY3MUN6NTY4aExneU8v?=
 =?utf-8?B?QVF2ZitPN3A4b3dscFNyZzRJQkNleXRIblh6RVM2SWc1VVZQdnQ1bXBNcCtG?=
 =?utf-8?B?QUtpSVB4TldLWFpzK2dOMmdFaDF5VGRlanlyejVtK3pRSklta3NaaWpHUEtz?=
 =?utf-8?B?aW9aUnRmTkY4N0ZmYSt6dks1VE8yUkFicGlDZ2YxMUpuejFXUUVpNCs0VDNC?=
 =?utf-8?B?c0ZuRWxmZTNQVzhXU3RNZUw5dnVMKzByQ0hEUk5GVjhKMFlNVEpSOHVQMHpG?=
 =?utf-8?B?cFZ3UTcvT2NQVHloaWlhTGNyd3pLamZzRG9TRHRaQXkzbnVvNmNtUzM5ZjU1?=
 =?utf-8?B?eGJIRmNpbnRzQTVDRnB6bm9hNFRmcjNmWTB5aHE3cTdmR01YTTZnKzZkNjdU?=
 =?utf-8?B?cExTTHk2NmZCWStxbmxraERxQVhMVjJ3ek9Bc2orQXY2VkNHeFNFRm1EVzdY?=
 =?utf-8?B?bmNMZ0V5cW82aVZuMVlBb1F5ZUdaeU51dWJkNnZna2ZyNEhKU1JWS25JNEdz?=
 =?utf-8?B?RVVUVUgwNGYrdzVWbnpiU3R5a0NVZEZ5c2g2K2w3Z3VSbHNZSmtsbnh2aDg1?=
 =?utf-8?B?WjJIOVRieDBwQnJtYXJQbmJGWUdSR25CN04rRysrQUdiblZlR3A4d1pVdnBk?=
 =?utf-8?B?R3ViRm1zckEzTndSNEtvNDlhWXFNNFlYK2JkT0FwMDI1YThjbTEvUTlvc084?=
 =?utf-8?B?RzZJN2lVTXd3OFdMN1g2T0NLaFlLa3dyaWd3QVEvSmxKYUs0clpaS2NjOXBX?=
 =?utf-8?B?Tnk2dEthSlF0R1poUkdyL0RaL3VHdUkxK21kRGt2UlMxcGt2bXJBcGZTemJZ?=
 =?utf-8?B?ekdQSEdMdzdWMzdTQ2pTZXZlVWp3UVNKUE83eEdsZm9SMUZwaTJsSUpnNFJ1?=
 =?utf-8?B?MzFBTmh0T2xoSHVlTzlYdW90TWRJWXZKcit6REo1SktsVXAyZ2RTSDhwQmlB?=
 =?utf-8?B?eWxFcnNjZEovZGR2N2NHZW11dGdIcU5pVUJ4SDZHQjZQT0dmc2RVVzcyVUdP?=
 =?utf-8?B?RXVRd0RtWEs5aDFjK2NKVktNUExaampkSmQ3TXE3R1hrS2VMTHkzd2xBNUNM?=
 =?utf-8?B?K2lwYTU2WmNXYkdIdTFORHQ0RHhFK04wUlJMYlQvOXpSL3BBWUJyVGpwdzEw?=
 =?utf-8?B?TzNLcXpuQXlKYUdTL3hjQk8yYldGNXROQTFxdkppMVd2dzJ6aGdnV3VuZmVv?=
 =?utf-8?B?c05TLzlnTXB6R3dMMk4xUXpyYzdYSlFSNzc1ZU9NdVNhQVk0bExVMm1vMmVm?=
 =?utf-8?B?ZVp6S0ZHL3ZuWFdXaFVmY3NQTzl2YjVkZUwzOUhKTlNKdFg0czlRZ3lwdXBI?=
 =?utf-8?B?OXg0SGJjNVRoblptQml6dz09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?KzYrZkgwL3lSUjJHVnpkekNDNFRNZE1CR1lLZW5Jd0NMRGdpTEVHVWVHZThU?=
 =?utf-8?B?S1lhVldDTFUyWnpTcUZNL3g1OTFYWm1oNEdlZGsxUEJSYWNaelBETzdibHpN?=
 =?utf-8?B?WFZPdFNYL0dCWEQ3QWFQUmZlQmpQRzBNU0IvZ0t1TWRxMTVvd1RFQVBpNStF?=
 =?utf-8?B?a2M2RVdyeGEyTEtWZEJHMzJXY2lPUWFucTdWK3JMMjFTajlkUVl0eDJEWnMz?=
 =?utf-8?B?dXFjdGRqREVnSDhEenN2OTZjNEdEL3JTK3R2Z1NNRyt0TC9zVUVRLzhRMGFO?=
 =?utf-8?B?S0pYR0VIMlNZR2d5ZUo2U01NaWUxeWJRMjkzek1melRIMzViL0o3MTkxTHk5?=
 =?utf-8?B?b0lmZ1FyeWJQeEJSL1hneXZ6QXh2Y3ZVa1JvL0x3QmliQWFGUkRxRzRwVlBx?=
 =?utf-8?B?TFNLUjhQYllZbUFKUFBmUmhidEhMV1plK1V6c3QwM3MvaXZtcmM1ZHpRVHRq?=
 =?utf-8?B?T1dTQnE5UE9Fazl6aU5ENmFNVUE4Y1hHdlFQTmlRbDc3dm8zclhJV292ZTZJ?=
 =?utf-8?B?di9OS0dFbm02a04yUFVweGxLRGFwTlBra2JhR2JTSFIzL3dyUzY3Skg2MzF5?=
 =?utf-8?B?eUlXZDNxME5uT0ZZS1BWZ05DSEZwTDZ3SFdscWhISlkzdTlYTnI4YS84T2Fn?=
 =?utf-8?B?dWlKM0xxQ3hEcjlZWGZZRjlrM1NGdzViT2NkOWdkRFJHVS9KU1Fzc09Ob3dw?=
 =?utf-8?B?b2VwQ2VnVit2Z2RWQkFqOU9URU5kdE12cTlmakw3Q3FWV29kbk82bWNMdnkv?=
 =?utf-8?B?eVdFNDdvV2hhbndJcjUvRXpHclpiRU81YTZpRWNzTkFPeEVTOWlYVnZ0dXRx?=
 =?utf-8?B?Y1dqSXpwQWh3RnRPOUpXTlpnS2Q1Z2hUcm5XRnlKcnFEL1AxS3lUcStvZDRz?=
 =?utf-8?B?ZXNTbXVuNmZpUXZSUkMwWEtDNGdldCtIbHZmK0gvNFNpYy9WS3JGZWMwZ0RP?=
 =?utf-8?B?OS9NU2plbzliUFdLaHJPbmpZbkZsM0kyN1pHSDQ0eTdVOU1heGlkYmduQU5n?=
 =?utf-8?B?OHdjbitWak9RYXd5cHV6RlNvQjl0Y2cycWkyR0hGR2NFTlBUMERpMjJGcWtq?=
 =?utf-8?B?MmdURkJnUVQzMGFib2l5Z25zZkNGc0RqbXlPc3BqQkpjTGNtQ3F1WUhFeWEy?=
 =?utf-8?B?K09VYzhEYVgvR2c0bHFxNUxkYUNmTXphdEd6YnVDUDJGcVk0Q0xvekFISytN?=
 =?utf-8?B?T0MwMXB1elNBbEcxVjFLL1hIRkZKZHhrMlRPTFRNM0FRZHk5RVgzS0l6UUZV?=
 =?utf-8?B?ZlpHaVVsR0h1bUg1V1FHbGx6SWNRalFtS0VuWkg1Y2RiZlc1cHl0MWg0dVBH?=
 =?utf-8?B?Qm9vWVRURWpKVVBGUUhwQUJ4bmtOam1ubXIweUF4aWR4UVdPTjJkT2tzMTFV?=
 =?utf-8?B?bW1wNmdNQ1RVL0hEaDYzWWwvNTQvbUQ4ZHZ6TytaSWU1NlMrNG5zVVNNQTY3?=
 =?utf-8?B?S3hPbjA2NHhtWEpCSnppMllhSWxsNC9reVY4T3poMFFqOXE3aEpKODJPcWk4?=
 =?utf-8?B?bkdFMnhNdENuUHpTd2hkTnBzWDNzbTM5ZXI5MTJ2OG5kRmMyazdXN25ZNWg4?=
 =?utf-8?B?Z0ZFazZGLzRBS2RCK0hmU2swRFRLeDFvTHpIOG9tcmVmcGtFZVVkMi8yOVNy?=
 =?utf-8?B?aVhXTHpMbEhjeVoxVEZCaDJ0TFRCbk5WNzlmdFp0ZUJTM293UG1tYlFqSEFC?=
 =?utf-8?B?N2lTQ2w3RTZvbC94Z3NoV201eUY2Q1NYcldzU056Mk4rZVkzSFJaSC9ObzVV?=
 =?utf-8?B?SUFYZ3pqZFJqZmJVMWRaNDV1SVYxVzJFcXVxZUJ1VGVVMnlUS1VTZmF0VjJI?=
 =?utf-8?B?cWxEV2krbDVCb3NSSGh1b1hNYWtSSlVzUkZCeThyUG0zaUlISTc2TSs0ME9P?=
 =?utf-8?B?WnJwM3dvS2VuRDZrWDk3QW5pK0pQRmFXVDI5V0dYYi9sZlVaS1NWMFpMbkF5?=
 =?utf-8?B?eWxVdmRCTkF3cEppV0lXYm54MkV0MEcwT2dxa2R1dWRhMTBrb1Evdjd4dERN?=
 =?utf-8?B?K1RnLys3aFF5Q0ZDdHRPRDJYdUVRMldrM0hKbWVES3NRSDVQMjNQSFJuWDB6?=
 =?utf-8?B?bk53aXFEUTdFYkkvYXlPSnEzZWpXY1VjTEN1anZlaE91MlJZUUZVVDIyRTJS?=
 =?utf-8?B?ZGkvMUxva0lPejlwYmpvdXI5M0lES3VzK3NkMCtUNlpxUzdQaS9yaVFXVllX?=
 =?utf-8?B?eEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87a967da-c22d-4493-c7bb-08dce8740ba2
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2024 15:07:08.8526 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z5JSBE41taphRfM37iOFTuM1BHiFPFdJJVv52OiIyYcPtt4TJ4qPhNP4c9wabZvmPVEt92fqkshYVHjx4r/CVawRk0EIIenQxy4ONgKQDGY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB5988
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

LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEludGVsLXhlIDxpbnRlbC14ZS1ib3Vu
Y2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mIEhhamRhDQpTZW50OiBXZWRu
ZXNkYXksIE9jdG9iZXIgOSwgMjAyNCA2OjMyIEFNDQpUbzogaW50ZWwteGVAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnDQpDYzogTWlrYSBLdW9wcGFsYSA8bWlrYS5rdW9wcGFsYUBsaW51eC5pbnRlbC5j
b20+OyBCcm9zdCwgTWF0dGhldyA8bWF0dGhldy5icm9zdEBpbnRlbC5jb20+OyBIYWpkYSwgQW5k
cnplaiA8YW5kcnplai5oYWpkYUBpbnRlbC5jb20+DQpTdWJqZWN0OiBbUEFUQ0hdIGRybS94ZTog
YWRkIHN5c3RlbSBtZW1vcnkgcGFnZSBpdGVyYXRvciBzdXBwb3J0IHRvIHhlX3Jlc19jdXJzb3IN
Cj4gDQo+IEN1cnJlbnRseSB4ZV9yZXNfY3Vyc29yIGFsbG93cyBpdGVyYXRpb24gb25seSBvdmVy
IERNQSBzaWRlIG9mIHNjYXR0ZXINCj4gZ2F0dGVyIHRhYmxlcy4gQWRkaW5nIHBvc3NpYmlsaXR5
IHRvIGl0ZXJhdGUgb3ZlciBwYWdlcyBhbGxvd3MNCj4gdG8gdXNlIHRoZSBjdXJzb3IgaW4gbW9y
ZSBjb250ZXh0cy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEFuZHJ6ZWogSGFqZGEgPGFuZHJ6ZWou
aGFqZGFAaW50ZWwuY29tPg0KDQpzL2dhdHRlci9nYXRoZXINCg0KVGhvdWdoIHBlcmhhcHMgaXQg
d291bGQgYmUgYmV0dGVyIHRvIGNhbGwgdGhlIHNjYXR0ZXIvZ2F0aGVyIHRhYmxlcyBieQ0KdGhl
aXIgYWJicmV2aWF0ZWQgZm9ybTogdGhlIHNnIHRhYmxlcy4NCk9yIGp1c3QgY2FsbCB0aGVtIHNj
YXR0ZXJsaXN0cywgYXMgdGhhdCdzIHRoZSBzdHJ1Y3QgbmFtZS4NCg0KQWxzbywgb25lIG9yIGJv
dGggb2Y6DQotIHMvYWxsb3dzL2FsbG93cyB1cw0KLSBzL3RvIHVzZSB0aGUvdGhlIHVzZSBvZg0K
DQpSZXZpZXdlZC1ieTogSm9uYXRoYW4gQ2F2aXR0IDxqb25hdGhhbi5jYXZpdHRAaW50ZWwuY29t
Pg0KLUpvbmF0aGFuIENhdml0dA0KDQo+IC0tLQ0KPiBIaSBhbGwsDQo+IA0KPiBUaGlzIHBhdGNo
IGlzIHJlcXVpcmVkIHRvIHByb3BlciBpbXBsZW1lbnRhdGlvbiBvZiB1c2VycHRyX3ZtYSBhY2Nl
c3MNCj4gaW4gY29uZmlndXJhdGlvbnMgd2l0aCBpb21tdSB0dXJuZWQgb25bMV0uIFJlcXVpcmVk
IGJ5IHVwY29taW5nIGV1ZGVidWcNCj4gZmVhdHVyZS4NCj4gDQo+IFsxXTogaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvaW50ZWwteGUvMjAyNDEwMDExNDQzMDYuMTk5MTAwMS0xMy1taWthLmt1b3Bw
YWxhQGxpbnV4LmludGVsLmNvbS8NCj4gDQo+IFJlZ2FyZHMNCj4gQW5kcnplag0KPiAtLS0NCj4g
IGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9yZXNfY3Vyc29yLmggfCA1MSArKysrKysrKysrKysrKysr
KysrKysrKysrKysrKy0tLS0tLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDM5IGluc2VydGlvbnMo
KyksIDEyIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94
ZS94ZV9yZXNfY3Vyc29yLmggYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfcmVzX2N1cnNvci5oDQo+
IGluZGV4IGRjYTM3NGI2NTIxYy4uYzFmMzlhNjgwYWUwIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0veGUveGVfcmVzX2N1cnNvci5oDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94
ZV9yZXNfY3Vyc29yLmgNCj4gQEAgLTEyOSwxOCArMTI5LDM1IEBAIHN0YXRpYyBpbmxpbmUgdm9p
ZCBfX3hlX3Jlc19zZ19uZXh0KHN0cnVjdCB4ZV9yZXNfY3Vyc29yICpjdXIpDQo+ICB7DQo+ICAJ
c3RydWN0IHNjYXR0ZXJsaXN0ICpzZ2wgPSBjdXItPnNnbDsNCj4gIAl1NjQgc3RhcnQgPSBjdXIt
PnN0YXJ0Ow0KPiArCXVuc2lnbmVkIGludCBsZW47DQo+ICANCj4gLQl3aGlsZSAoc3RhcnQgPj0g
c2dfZG1hX2xlbihzZ2wpKSB7DQo+IC0JCXN0YXJ0IC09IHNnX2RtYV9sZW4oc2dsKTsNCj4gKwl3
aGlsZSAodHJ1ZSkgew0KPiArCQlsZW4gPSAoY3VyLT5tZW1fdHlwZSA9PSBYRV9QTF9TWVNURU0p
ID8gc2dsLT5sZW5ndGggOiBzZ19kbWFfbGVuKHNnbCk7DQo+ICsJCWlmIChzdGFydCA8IGxlbikN
Cj4gKwkJCWJyZWFrOw0KPiArCQlzdGFydCAtPSBsZW47DQo+ICAJCXNnbCA9IHNnX25leHQoc2ds
KTsNCj4gIAkJWEVfV0FSTl9PTighc2dsKTsNCj4gIAl9DQo+IC0NCj4gIAljdXItPnN0YXJ0ID0g
c3RhcnQ7DQo+IC0JY3VyLT5zaXplID0gc2dfZG1hX2xlbihzZ2wpIC0gc3RhcnQ7DQo+ICsJY3Vy
LT5zaXplID0gbGVuIC0gc3RhcnQ7DQo+ICAJY3VyLT5zZ2wgPSBzZ2w7DQo+ICB9DQo+ICANCj4g
K3N0YXRpYyBpbmxpbmUgdm9pZCBfX3hlX3Jlc19maXJzdF9zZyhjb25zdCBzdHJ1Y3Qgc2dfdGFi
bGUgKnNnLA0KPiArCQkJCSAgIHU2NCBzdGFydCwgdTY0IHNpemUsDQo+ICsJCQkJICAgc3RydWN0
IHhlX3Jlc19jdXJzb3IgKmN1ciwgdTMyIG1lbV90eXBlKQ0KPiArew0KPiArCVhFX1dBUk5fT04o
IXNnKTsNCj4gKwljdXItPm5vZGUgPSBOVUxMOw0KPiArCWN1ci0+c3RhcnQgPSBzdGFydDsNCj4g
KwljdXItPnJlbWFpbmluZyA9IHNpemU7DQo+ICsJY3VyLT5zaXplID0gMDsNCj4gKwljdXItPnNn
bCA9IHNnLT5zZ2w7DQo+ICsJY3VyLT5tZW1fdHlwZSA9IG1lbV90eXBlOw0KPiArCV9feGVfcmVz
X3NnX25leHQoY3VyKTsNCj4gK30NCj4gKw0KPiAgLyoqDQo+ICAgKiB4ZV9yZXNfZmlyc3Rfc2cg
LSBpbml0aWFsaXplIGEgeGVfcmVzX2N1cnNvciB3aXRoIGEgc2NhdHRlciBnYXRoZXIgdGFibGUN
Cj4gICAqDQo+IEBAIC0xNTUsMTQgKzE3MiwyNCBAQCBzdGF0aWMgaW5saW5lIHZvaWQgeGVfcmVz
X2ZpcnN0X3NnKGNvbnN0IHN0cnVjdCBzZ190YWJsZSAqc2csDQo+ICAJCQkJICAgdTY0IHN0YXJ0
LCB1NjQgc2l6ZSwNCj4gIAkJCQkgICBzdHJ1Y3QgeGVfcmVzX2N1cnNvciAqY3VyKQ0KPiAgew0K
PiAtCVhFX1dBUk5fT04oIXNnKTsNCj4gLQljdXItPm5vZGUgPSBOVUxMOw0KPiAtCWN1ci0+c3Rh
cnQgPSBzdGFydDsNCj4gLQljdXItPnJlbWFpbmluZyA9IHNpemU7DQo+IC0JY3VyLT5zaXplID0g
MDsNCj4gLQljdXItPnNnbCA9IHNnLT5zZ2w7DQo+IC0JY3VyLT5tZW1fdHlwZSA9IFhFX1BMX1RU
Ow0KPiAtCV9feGVfcmVzX3NnX25leHQoY3VyKTsNCj4gKwlfX3hlX3Jlc19maXJzdF9zZyhzZywg
c3RhcnQsIHNpemUsIGN1ciwgWEVfUExfVFQpOw0KPiArfQ0KPiArDQo+ICsvKioNCj4gKyAqIHhl
X3Jlc19maXJzdF9zZ19zeXN0ZW0gLSBpbml0aWFsaXplIGEgeGVfcmVzX2N1cnNvciBmb3IgaXRl
cmF0ZSBzeXN0ZW0gbWVtb3J5IHBhZ2VzDQo+ICsgKg0KPiArICogQHNnOiBzY2F0dGVyIGdhdGhl
ciB0YWJsZSB0byB3YWxrDQo+ICsgKiBAc3RhcnQ6IFN0YXJ0IG9mIHRoZSByYW5nZQ0KPiArICog
QHNpemU6IFNpemUgb2YgdGhlIHJhbmdlDQo+ICsgKiBAY3VyOiBjdXJzb3Igb2JqZWN0IHRvIGlu
aXRpYWxpemUNCj4gKyAqDQo+ICsgKiBTdGFydCB3YWxraW5nIG92ZXIgdGhlIHJhbmdlIG9mIGFs
bG9jYXRpb25zIGJldHdlZW4gQHN0YXJ0IGFuZCBAc2l6ZQ0KPiArICovDQo+ICtzdGF0aWMgaW5s
aW5lIHZvaWQgeGVfcmVzX2ZpcnN0X3NnX3N5c3RlbShjb25zdCBzdHJ1Y3Qgc2dfdGFibGUgKnNn
LA0KPiArCQkJCSAgIHU2NCBzdGFydCwgdTY0IHNpemUsDQo+ICsJCQkJICAgc3RydWN0IHhlX3Jl
c19jdXJzb3IgKmN1cikNCj4gK3sNCj4gKwlfX3hlX3Jlc19maXJzdF9zZyhzZywgc3RhcnQsIHNp
emUsIGN1ciwgWEVfUExfU1lTVEVNKTsNCj4gIH0NCj4gIA0KPiAgLyoqDQo+IA0KPiAtLS0NCj4g
YmFzZS1jb21taXQ6IGYxNTYxZTZjNjJiNWI1YzNmZTAyNzZmMmZiZTczMjVlMGQ3YzI2MmQNCj4g
Y2hhbmdlLWlkOiAyMDI0MTAwOS14ZV9yZXNfY3Vyc29yX2FkZF9wYWdlX2l0ZXJhdG9yLWQyOWQ3
M2MzZWI5OQ0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiAtLSANCj4gQW5kcnplaiBIYWpkYSA8YW5k
cnplai5oYWpkYUBpbnRlbC5jb20+DQo+IA0KPiANCg==

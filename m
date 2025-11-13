Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0811ACD5BD0
	for <intel-xe@archiver.kernel.org>; Thu, 13 Nov 2025 11:51:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD24910E6D8;
	Thu, 13 Nov 2025 11:51:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P+wiYmyY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB59610E6D8
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Nov 2025 11:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763034669; x=1794570669;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=DzoN6VUTQHyjkXiHLLLfC9UyrKxWufaIjaxeKN55cJQ=;
 b=P+wiYmyY4Jq5JpvOaIE4lMO55tqZ1VEkdOxLqMwU81e2mKHNd+GxG5k0
 evLlW3TqD5mXrgCmuXYPaNScoCIkQf9BSE2oMXXDtDkoIVGcf4BdmCjva
 ie8TvnrK2fPf895oLNNNJ4laO81dvt+M2MUdw+v/02c+TqCNuifjljqM5
 pMd1y26TXBZbkR4xhFcFe5bY3+ktB/T9SFMr081HKQVtCo6VFboct+TkN
 CfBp1PpeOz8wZoYiJA+Cquas7kee4YT8CAgHexnwxOBMLFuxwu6Om1sTx
 c80uD2BEW8ZpDKOTcal9BTY1ZqUsJEb7VgltutvY3dETn1o21aOSOn9rC A==;
X-CSE-ConnectionGUID: u2Q7j4SlS8GBfjtT91IO4w==
X-CSE-MsgGUID: SMqGD0zdQeaC+1twWE1g7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="75426985"
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; d="scan'208";a="75426985"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 03:51:09 -0800
X-CSE-ConnectionGUID: pz9pCkQbTQi2XJgq1RlnaQ==
X-CSE-MsgGUID: Fuajq/JuQV+Gwio1rQOaaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; d="scan'208";a="193596241"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 03:51:09 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 13 Nov 2025 03:51:08 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 13 Nov 2025 03:51:08 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.49) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 13 Nov 2025 03:51:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WiGCmg9rzoVtBzYemh0CgwhfTy6goodXylF3XUd1twrxaV7VMB8BD46JNTqZrdbwsaYnjlC1OokH+ria7vaO44MYDQbAZbVXsBFCbvfDNZNyJnYd++PA3tiOMuW3bczwGY0uPQbfYMvsgfjBSwmtHYyinyZ/bm8uDJOmva2dTCMnwtv48kg6g7a1yHByTLUHEy2LpYvcW+Ndm3jlUBVY+94qLZJdoJPq3BFsiJPIf9a03xQy7Y0K+zNycQRj1J5J79VKGXPeqqp57gW8vyUOKOEq2eAFmoY+KlnkyLCom7mnjHugJd6ewFDto94TQEToqNUbPr8o2nJuZIz8GlVkpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yJcgnUQpHBFbKViiImsXDiKhABL6QZhZzUQEq9CKUew=;
 b=NJbejTSoKj71l9zR5WLTDdcEdUr4Dxi/bm6aCyVqcONDxvs/imrp2yWJpS52W/6j1WR3NdYaHndui8V4vNdj48FvLw1d9lmcjNEEb/QDvWmK4sFqtBb1qIJwG2rTkZ76hsreiv3peV8fnjHN6V04tiM/K9czyhaDWjMpFLBjOvaII0pvwQHRSyg0hLVthWYu2yu14fPCxmme2gzrjFXBrEGeI6HCDUejZYaRMzX+9/dVrzz8RgVDTOWE1bYd62wNhNj1iYBsXrbG8clR93WiwvZ3c7lY/kQdT9YaN0nPjYldVOQe5Z+nmMeCNs3iQyhWRqIgDXjbbjVsS0AEYFyFbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by SA0PR11MB7159.namprd11.prod.outlook.com (2603:10b6:806:24b::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 11:51:06 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 11:51:06 +0000
Date: Thu, 13 Nov 2025 12:51:01 +0100
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v1] drm/xe: Move VRAM MM debugfs creation to tile level
Message-ID: <20251113115101.usrudsj5iecehz4k@intel.com>
References: <20251105165905.3509314-1-piotr.piorkowski@intel.com>
 <280d1a68c928607f9c045ae7042f157c728622ec.camel@intel.com>
 <20251107212103.bop2aqbtprsr747q@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251107212103.bop2aqbtprsr747q@intel.com>
X-ClientProxiedBy: TL2P290CA0020.ISRP290.PROD.OUTLOOK.COM (2603:1096:950:3::9)
 To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|SA0PR11MB7159:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f1f8861-ad15-4773-4bde-08de22aaed7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bEVqOEF6TU5EWDJmZHJrQnRJTjN4UERxL1lCc1dyMHluaUxZL1ZrWmZ3Q0po?=
 =?utf-8?B?UUNEZHp0K05mWjI0aUVNZjh0UHdqYS9ib2FOck4vOWg5WFNzMnJIZEFPWEJW?=
 =?utf-8?B?dFgwYjZBSlNiNDRTMHY4c242blNKSFQydWZycG5sV1I1Rm1zcWRNYkpnNnhH?=
 =?utf-8?B?WUg5SnJPWHUweDlMUHVlVk9zQ0dzcFIxSkpqb1pwZXNPN0tzZ3hYQ1Fremha?=
 =?utf-8?B?OWNLTmNvdCtKK3pEUmYyUitTeEFmWUhhSnFHTVNhQmRhTXE4MVBML3RHY1Fz?=
 =?utf-8?B?dlVMTGhiaFoxNllHWjdFeGRibFZMd3ZMRE5hK3BPZnVQK3JIRm1xL3BhdEFD?=
 =?utf-8?B?K1pMODVBVkxHRDJ2VUdGMFBxc1Z6ZG8zUmVNTE9zeWtOWEtDclZjV0JWODlp?=
 =?utf-8?B?d1VsVk5DNVNhZ3lJajFaQ3I4SVVwOEd4UzR0VllERUdKL1U5a3ZsWDQzaFNV?=
 =?utf-8?B?M2tqdnhSL0pDVjgxeEdGU0kvSmNWc2toZGJFREc1bnhFd2I3TzNnRGIrY3Ez?=
 =?utf-8?B?d0FydExWd3o5dU5LOWhhYzhTc3NwUDlnQ0RSKzArNjZ0OTViMk1scEE1Zm1Z?=
 =?utf-8?B?bk05OE81ZkZUY3YvdDVneTRXNTZkN0hpTjlQKzhvSytXMW8xTDN0TlYxdjR4?=
 =?utf-8?B?bGt4NWpDQVdOWFBPTU5oSlg3aldiTm15NGF5Q3htdW1tdU9qelJuQUtkYUZw?=
 =?utf-8?B?eDhFNE82UnhpU3lTMUs2Qjd1MXpseWR1bS9RVGVWbUVYQ1F1YUh6ZzJhbkxW?=
 =?utf-8?B?NUNRTVR3Znd1Z2ZuUVRQYnA0TDVmamFGbHpMWi9RV0ptbm5rVmgrSDZjU3Ny?=
 =?utf-8?B?NzhJM0tueHFiSlFYc2dZcHdla3I5REhySEU5Q252RXRmYmJaWVpMWlV0empV?=
 =?utf-8?B?eWxxaWdGS2M1RjNKdGYwSks1ZGh3dW5lbExVbjdMdmVjNy83aWw4QXN5T3JO?=
 =?utf-8?B?QWV1YlB5bWdzR0l2VWdpNy9rVHlHQzlNMmcyajRiN1NhSVRHUThqYU9FdjVr?=
 =?utf-8?B?WEg0aU90WTg3d0FkS3Y2NVdQandFek9kcmM3SVF5SVJIc1FmVDNpeDFTOU4w?=
 =?utf-8?B?eFlMenN2THdEdUNjemRKWXhJN29vdjNtOVNOTDJUNU9WaDhkTUExVUgvVkVk?=
 =?utf-8?B?Vlhsb1hHUFlncHhYajJPOTM1bnVPTGdrVGhCVGxOemVhSzMvQVQ0aGg4SjdX?=
 =?utf-8?B?TExlR3g3Q2ZzS2JoQ0FCb1VHa3grcjhKSEVDaWZ0d3AzL3U0aVkxSmJGckd3?=
 =?utf-8?B?K1pEbTB4ZXFKcCt2bnNqZFpDNnJyS2tSZVBnS3NaeURDY1VkMjZEMVRJOGNJ?=
 =?utf-8?B?dTVUZGRaQm95OXo2bEVmVVFPNlI4VElXQjAvUk1qZFlOM2I1TE85a21CdHN2?=
 =?utf-8?B?U3R0bUt5WHA5SnJQbFRreWFaZWlzTDVReWZTL2V4MThSdmRXcDZVbGhsSEY2?=
 =?utf-8?B?eDhzelUwM3IxSC9DRjloQ2lkZHNWNU5JbmdybmVITGo2Z05QKzc4cEcwV3hh?=
 =?utf-8?B?aVlFYmpIeHhsRjhvMEUzYitSS2hRNDN1YXdqbFdlcHhzbm4xbDBUOHE4YVRn?=
 =?utf-8?B?bjU4bDFXL0dvTW14TGJCR2N0ZTk5MDF2aXY2MUZRdGRNNEJoQi9rSXNiRVdH?=
 =?utf-8?B?S1VuZy9CY1hTSU90Z1Jrem5rem4wVnpUTGprY2d6ZlpnZkdZc3ZlTW9DSkND?=
 =?utf-8?B?RDVXMzFGVGRSOXFMbTQ3SXZBSGJmRE5mSk0zNEtob3d1WVpVWjVOVGNtc0tu?=
 =?utf-8?B?ZDFTNytqcVI5bUlPNHRNRHpTTnFqeEtMdWUxWFZQUEQ4NkhXWURFcFZLM0VK?=
 =?utf-8?B?d0F3eVVYSXF0NmE2T09PalBJM3JEcFRRazNibW5CSzQ3dDRweWw4MFgzazBl?=
 =?utf-8?B?ckYwVGEyR2FoUUJ3VGN4dzIyeUxObk5PTE55dk9laEI0cEE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bU9CVUpmUTRhN0ZKakxxWmdBNFllQ290YzFIV3Y2VWJ2QStkTlBIaU5pTE9x?=
 =?utf-8?B?YzE2aldnc2hPYXM1dVJHWlRWZGhyUzd0U2FYNDZOVjlINWhOcUpTdWRGRm5p?=
 =?utf-8?B?dHRoaVMzUjZ5ZmlEb2wxQTdlV3FEQ2dUMHJUSDBGYzJBbDhuN1p2YnMrTGU5?=
 =?utf-8?B?ME00TnRFcmk2TWlJWWtxSVF4UzI0SEZNWHlBdG5JMGNCbUF5SngrWGVpUGE4?=
 =?utf-8?B?WHYvRGp5UEZ0a0lkZUJya1JNcGxnVjgrL3V6WFZlY3NKT3hKUFZOZ0RzOWxW?=
 =?utf-8?B?SHdMOGdqSHQweTdpT255K29XcjlsK1oyUDNCTlBHVzMyaTRac3p5SVZ2cFVJ?=
 =?utf-8?B?STB4V25PK0V3T2pEdW5FdjVRTTdSWUpXRDBSZEtwOXdoRTVEck5TYmsvZU16?=
 =?utf-8?B?MDduZVkydlVXUHRSUG4yVmJIQjIwOXY2N0VzTEFhTTZpWURDVFhEdm5FOGs5?=
 =?utf-8?B?N3hNR0pZd0RJM2krTmc0TU1BYUhRQVNvWVU1ZGZ3eDBDektvaWZkaTBrS0RP?=
 =?utf-8?B?U1hjTkdvS1I4TFhUaHJmajloMHcxeDFiRHd5NVJSZDFOQXljTDM4elYyN3Er?=
 =?utf-8?B?dDVjNnRQRjZYZHZEMkM0ZkFsR01LSHowS1ZTVkF4R3JZU0xUQXdNNjRYNDV2?=
 =?utf-8?B?LzhrTTk4ZXlRZUdRZFlPYjJSSlpWRkFyaFB3SCt6UmdUbTA2MmI2R0JxQTh6?=
 =?utf-8?B?QzRKKzZNNXg4bEVmOWhIWld3T1h0Y2ZrN1pERVdPSU4vaXplblZoeC91WlJJ?=
 =?utf-8?B?a2VZbkc5MWRwZ256KytDZHJvbXlSdFA0NE1SOGFVSS96VWRvbVRkSEhKZ3FX?=
 =?utf-8?B?VVBrSFV0UXBpQk5FNzAzcTAwdER5bmhESmtvaXJReXVFbmEvM2Jxb2N1UTVV?=
 =?utf-8?B?d09XWkpBTzRMUDVMK0lxSlNHaXdrQ1JXc2RFYm1lMC9yK2tuYmw5WDRhRUNm?=
 =?utf-8?B?a3lCeFdLQ1VENU8zQWpuL2l4RWg3Z2tTR0twd2E5ZWo5K3hKTHF2Yis1b3NM?=
 =?utf-8?B?eFR1NGtGVW5WVHBPaTNvbWQ0R2grbXIvK1EvbGhxdWI1VU5yaWxmOHJjQVYx?=
 =?utf-8?B?cHBuVWFPbUlackFTWkpMRG8yM3Zua0NMRkREdHFtT1JkOG1VTVpEcnNIU1BS?=
 =?utf-8?B?dmJ2VWg4dkpKZ2pHeE9JU3Y1UHQzbmRjUUJEbFYxWHFreDBZZjZHZHEzdTV3?=
 =?utf-8?B?LzFsYVlHSkxuWkhzelZCeit1L1FzZDFVUlVtelNWUzZlYlQvendraWpRcTNl?=
 =?utf-8?B?Y1B5NTJDWldUNm1NMlo2SlEvTU1WQ21HNG1CcC9TOFJWZ3ZBWWxEMnhsVVJP?=
 =?utf-8?B?ZzhSbG5sbUFhK2dYaldrS0RJczNzeCtmZWxzRS9jeWRiSDQxSHJkanhmUHBy?=
 =?utf-8?B?ZmhOSWo4VVBvaDlxZGpVYnNjaE04T2FYd21vNVF4Y2IyZ2U0SWpqTGxIVjRG?=
 =?utf-8?B?M2VOZGxYK2dDVFEvVy9nMFZkQkIzNlhnUnROQms4dko4dmQ4SmNHR2lFMDhF?=
 =?utf-8?B?bU9KMFBQb0pRVFNaT2JHaDRVVThvTVU1L1htOUZ2N0hVMGhXemhXVWZhMUZL?=
 =?utf-8?B?Y1dPSkFQWDM0Ui81eThMZUIxUS81R1R4NlllZ0hXYWhOZGp3QUFObG1JNFNO?=
 =?utf-8?B?OTNLcUpxY1NXY20rWVBxbklSSTVnaUpMSkhZb0JnQnRwZVFDV0xJWEpYREV6?=
 =?utf-8?B?T2gwVVFvOUV2YVhiUnc1MFFlWVpNN3FkcDJPcVYzaFpHUFd3aFkwRDloVlJX?=
 =?utf-8?B?dUhYaGw1SFFvWkFvNGlhTWdGR0Z5QXR6Y3BKaDRkYlZNQzByeWVqRVZIaWdh?=
 =?utf-8?B?M28yc09YN1BCSlAzelU1dC9TcDdHWXl2N2IrTjJUQVF5aERCRDh4eDU0OFRw?=
 =?utf-8?B?Si9vN0E2aXRZSExoQ3dSTG5QOXdxQ1NkVzAyR2hxQXoybWpGZWw2WjFJSjRu?=
 =?utf-8?B?cnJEbDRXQlUxVERKMHhJWjFIQXJjOTNKaDdnNHUwVmNBc0c2SFFUZjhnQVNr?=
 =?utf-8?B?SEk0bWIxMGN6Qzc2dGhGUXgrY2x1OSs1M3FHSy9qS0ZWWnpVbkpmc29oYk5k?=
 =?utf-8?B?c3NuYk9GSDNDTitzY3p1d0hBWm5XRWlTZk50K2xhQS82UWlFZTlscFZPaUdp?=
 =?utf-8?B?NWR3TmNjczB2SGI5N1J5Z0c5SytVaS9DTVdreWJ0ak9HbnNGaHg2ZUg1Mjdv?=
 =?utf-8?B?WVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f1f8861-ad15-4773-4bde-08de22aaed7f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 11:51:06.0683 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h8k2Gb+KMw80vptX/FeiI9Cst2r9No+gX8BOMw2OJJU+gzJMITkB1sYTBuGKUtkyM1uJ6FoezU5cA2klW4s+7ATVXU/As/gbpdvBImUuUxY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB7159
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

Piotr Piórkowski <piotr.piorkowski@intel.com> wrote on pią [2025-lis-07 22:21:03 +0100]:
> Summers, Stuart <stuart.summers@intel.com> wrote on czw [2025-lis-06 00:16:33 +0100]:
> > On Wed, 2025-11-05 at 17:59 +0100, Piórkowski, Piotr wrote:
> > > > > > From: Piotr Piórkowski <piotr.piorkowski@intel.com>
> > > > > > 
> > > > > > Previously, VRAM TTM resource manager debugfs entries (vram0_mm
> > > > > > / > > > vram1_mm)
> > > > > > were created globally in the XE debugfs root directory. But > >
> > > > > > > technically,
> > > > > > each tile has an associated VRAM TTM manager, which it can own.
> > > > > > Let's create VRAM memory manager debugfs entries directly under
> > > > > > > > each > tile's
> > > > > > debugfs directory for better alignment with the per-tile memory
> > > > > > > > > layout.
> > > > > > 
> > > > > > Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> > 
> > I agree this makes more sense.
> > 
> > I do see the debugfs IGT seems to be hard coded though which is causing
> > BAT to fail.
> > 
> > With that fixed:
> > Reviewed-by: Stuart Summers <stuart.summers@intel.com>
> 
> Hey, I already have the appropriate patch for IGT ready, but I will send it next Wednesday
> (due to the long weekend in Poland).
> 
> Thanks for review!
> Piotr

IGT chnages on IGT mailing list:
https://patchwork.freedesktop.org/series/157493/

Thanks,
Piotr


> 
> > 
> > > > > > ---
> > > > > >  drivers/gpu/drm/xe/xe_debugfs.c      | 12 ------------
> > > > > >  drivers/gpu/drm/xe/xe_tile_debugfs.c |  9 +++++++++
> > > > > >  2 files changed, 9 insertions(+), 12 deletions(-)
> > > > > > 
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_debugfs.c > > >
> > > > > > b/drivers/gpu/drm/xe/xe_debugfs.c
> > > > > > index e91da9589c5f..8ac78e560d28 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_debugfs.c
> > > > > > +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> > > > > > @@ -375,7 +375,6 @@ void xe_debugfs_register(struct xe_device
> > > > > > *xe)
> > > > > >         struct ttm_resource_manager *man;
> > > > > >         struct xe_tile *tile;
> > > > > >         struct xe_gt *gt;
> > > > > > -       u32 mem_type;
> > > > > >         u8 tile_id;
> > > > > >         u8 id;
> > > > > >  
> > > > > > @@ -403,17 +402,6 @@ void xe_debugfs_register(struct xe_device
> > > > > > *xe)
> > > > > >         debugfs_create_file("disable_late_binding", 0600, root,
> > > > > > xe,
> > > > > >                             &disable_late_binding_fops);
> > > > > >  
> > > > > > -       for (mem_type = XE_PL_VRAM0; mem_type <= XE_PL_VRAM1; >
> > > > > > > > ++mem_type) {
> > > > > > -               man = ttm_manager_type(bdev, mem_type);
> > > > > > -
> > > > > > -               if (man) {
> > > > > > -                       char name[16];
> > > > > > -
> > > > > > -                       snprintf(name, sizeof(name),
> > > > > > "vram%d_mm", > > > mem_type - XE_PL_VRAM0);
> > > > > > -
> > > > > >                        ttm_resource_manager_create_debugfs(man,
> > > > > > > > > root, name);
> > > > > > -               }
> > > > > > -       }
> > > > > > -
> > > > > >         man = ttm_manager_type(bdev, XE_PL_TT);
> > > > > >         ttm_resource_manager_create_debugfs(man, root,
> > > > > > "gtt_mm");
> > > > > >  
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_tile_debugfs.c > > >
> > > > > > b/drivers/gpu/drm/xe/xe_tile_debugfs.c
> > > > > > index fff242a5ae56..b4a1929535da 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_tile_debugfs.c
> > > > > > +++ b/drivers/gpu/drm/xe/xe_tile_debugfs.c
> > > > > > @@ -110,6 +110,13 @@ static const struct drm_info_list > > >
> > > > > > vf_safe_debugfs_list[] = {
> > > > > >         { "sa_info", .show = xe_tile_debugfs_show_with_rpm,
> > > > > > .data = > > > sa_info },
> > > > > >  };
> > > > > >  
> > > > > > +static void tile_debugfs_create_vram_mm(struct xe_tile *tile)
> > > > > > +{
> > > > > > +       if (tile->mem.vram)
> > > > > > +               ttm_resource_manager_create_debugfs(&tile-
> > > > > > >mem.vram> > ->> ttm.manager, tile->debugfs,
> > > > > > +                                                   "vram_mm");
> > > > > > +}
> > > > > > +
> > > > > >  /**
> > > > > >   * xe_tile_debugfs_register - Register tile's debugfs
> > > > > > attributes
> > > > > >   * @tile: the &xe_tile to register
> > > > > > @@ -139,4 +146,6 @@ void xe_tile_debugfs_register(struct
> > > > > > xe_tile > > > *tile)
> > > > > >         drm_debugfs_create_files(vf_safe_debugfs_list,
> > > > > >                                 
> > > > > > ARRAY_SIZE(vf_safe_debugfs_list),
> > > > > >                                  tile->debugfs, minor);
> > > > > > +
> > > > > > +       tile_debugfs_create_vram_mm(tile);
> > > > > >  }
> > 
> 
> -- 

-- 

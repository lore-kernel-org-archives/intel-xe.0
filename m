Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EECE0CAC5B0
	for <intel-xe@archiver.kernel.org>; Sat, 27 Sep 2025 13:33:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B53610E1B3;
	Sat, 27 Sep 2025 13:33:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NKA3Y6OE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4739410E1B3
 for <intel-xe@lists.freedesktop.org>; Sat, 27 Sep 2025 13:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758980032; x=1790516032;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=wysSanD0rP2q8DPnuuGanjBwC7hdR9B5LzWlYdfIarw=;
 b=NKA3Y6OEUf7cOJMXOzs1WuPSMg7oAqlG5uvkXO3T4RfP6/bUw0yMnI2p
 uPFR6kb0PFX24zx7PtfIfjMiPkxd+Nsla1We37tmI0jZ8RgBzxWTRBNXA
 ldcaQ35C0n1xRFBfxjwYpI2NdrYQtmlpnf32n81yNVk9ENn75B5g9YJWq
 5sShl4zNLW/NeKC6mpo22wYbt7Mqzemp0uM4G4jT3DKmBtpdYZpACG43d
 rNPvcqdJONdvOXr3BONhK0AOxTqNYb5/jdNgMzTyfgM9F8e0pumq/eTm7
 kXZ3KH/cfT/88TZee87l1ZbamjzNuWnqwOL2LL6JJ3ITw/5gIJynFhl1H A==;
X-CSE-ConnectionGUID: 4NeNmSV+R1uhtDKTSU0s9w==
X-CSE-MsgGUID: W2lw9WIyTF2i6dB3/H0pNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11565"; a="72654392"
X-IronPort-AV: E=Sophos;i="6.18,297,1751266800"; d="scan'208,217";a="72654392"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2025 06:33:52 -0700
X-CSE-ConnectionGUID: tOVJoquBRem/VTFyZ2/Sew==
X-CSE-MsgGUID: hz0WIqwFQeWH297vEWcGEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,297,1751266800"; 
 d="scan'208,217";a="208574079"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2025 06:33:52 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 27 Sep 2025 06:33:51 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sat, 27 Sep 2025 06:33:51 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.68) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 27 Sep 2025 06:33:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vY9bEFJJnUgKK11NxsJ+/QbK0qZIXUdESbV21uH88QkjZ33ksLOGZ/JeYR20uX1/+w9TcNzx34xfMYjWbV8Ina+0HGEguZgIG62jhjCnvZwbiZzm27kjI2FS5FZS7Z3Bwe4I2Q3t6lAd2fpIv7sW8+X5z17+l7ouqPYCin8vlbx/EHJk6XZYWDJsbiLQBN4lPbKX+0/HHtpx7oCO3Es+fOYb0YjWAlnnvlOaLa/mZe1j1Zxnwl5ZeyN+P/2ZlYBWjUEPGxmTeaoQKas3iFUXCdLpYfm3aU4Q3pAmhzF32OwFYaN5mJKuAacSoTk+wGEHJ401y7rIGgQaauynlHXSig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ma92l9vEa7jxpVUQaU1fZxm98Nz7IprRgH0N6y0oPtg=;
 b=E8L8nb3GnHsI9Ldfci+GQHS7Tsfhws89zo04BYZc8TLlaTIz8vYPJIriQPQIbcNYiLUW9wKFtk8wL52ykIHCA6cgcZcLZxusvLTsq4Kjg7C8QMH49PH8UxDRGbVblYgAy8KLe617jtlQpjG7mppA8/gPnwjG56+hsWhfaI1CMWgE8gcG/v/K/5XUt2Xl8+1CQS4vmaCMrbfg02UncUDJ0UkAG82NesUupBiCOA8QMh4nq2+4LZkG9foCtV8mxkpsZqry5/en4435oyQ5XpFVHUtJgM47OuYJBLZR96JEHs+QzM3G/v5YmVIyGZu11QXuXXb4z33ebm+aBDmKxjZcfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9226.namprd11.prod.outlook.com (2603:10b6:208:574::13)
 by PH7PR11MB6378.namprd11.prod.outlook.com (2603:10b6:510:1fa::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.14; Sat, 27 Sep
 2025 13:33:48 +0000
Received: from IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09]) by IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09%6]) with mapi id 15.20.9137.018; Sat, 27 Sep 2025
 13:33:48 +0000
Content-Type: multipart/alternative;
 boundary="------------mlYy1n80d5KK3VHoG9BRf7oi"
Message-ID: <7d9b5b08-f9bb-40d1-8dd3-8a01ace4a76e@intel.com>
Date: Sat, 27 Sep 2025 15:33:43 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 26/34] drm/xe/vf: Replay GuC submission state on pause
 / unpause
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20250924011601.888293-1-matthew.brost@intel.com>
 <20250924011601.888293-27-matthew.brost@intel.com>
Content-Language: en-US
From: "Lis, Tomasz" <tomasz.lis@intel.com>
In-Reply-To: <20250924011601.888293-27-matthew.brost@intel.com>
X-ClientProxiedBy: VI1PR10CA0085.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:803:28::14) To IA3PR11MB9226.namprd11.prod.outlook.com
 (2603:10b6:208:574::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9226:EE_|PH7PR11MB6378:EE_
X-MS-Office365-Filtering-Correlation-Id: a3d8f3a8-7414-4343-fcb5-08ddfdca7d16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c0VDaUVRbGQ3ZUw4VDdhVElLZk04ajZiVFBGL0lmTlVPU29VdTFCNUg3cUJ2?=
 =?utf-8?B?QmJLWi8xd2Vkak1MbnBRNTQwUWlEdmhkWm1MLzIzNExPWExJcUx5eXNHbTk5?=
 =?utf-8?B?bE9wQ25ZbzZKcTZrY0ZjdmREb2x6YUZPMDRXVjkwRGIvME9SYzNkcXJWaGdK?=
 =?utf-8?B?bzBMVzI4ajNKUjArYnpuNVJ3eENSMkhhZWNFb3ZTTWxOeDNaaG5ZRnhVdE1v?=
 =?utf-8?B?Y0NuSWZvNkZ5ZWJXLzlVL2tIdjVRb3FvaGwzR3JwcWxLNU9PaWFTWkNQMEwr?=
 =?utf-8?B?YzgvM3BnUkEyb1JESEIxN096MHRGd3lUbHN4OW41V1hxOUZLcnFjTVdkZkJF?=
 =?utf-8?B?NTVuWHhlSUhTYnZBZGZ4UTlGZ0w0MnN4QjlTY0xaNWF1OCtIZHVjUTJQRXFO?=
 =?utf-8?B?NjY0MVM1czY2M1Rtc29xWFRFSTF0NTRNcjFnL0NYemdITHFhVUxSNjBpODhj?=
 =?utf-8?B?aXhCRUM0MFFGeWtMUjhuR29HTGMyNFNPOUNRNzJvVkpqYTkya2VodTFDRWtn?=
 =?utf-8?B?Y2dPRy8yUVpISjFDemU0d1RzNWhTZXJIaGNqZGl3ZVRjYW9obS9tc1ZoelBq?=
 =?utf-8?B?TG9vM1hVYzV0RFFCWUpCVXFlUUNRV0MvZUNtTzFJa2l2djhQSXg2WElCSCtS?=
 =?utf-8?B?RnNGOWo3SGxsTFRjeWNFUXdxYTFoSStkTHVNdDJUbjV0SlVTLzNKdWFWSGRL?=
 =?utf-8?B?V2hHNzZiTitjdUlKR1d2WDZFTzRrb1FiYzZOMG12andwYWExSEFmNUNrWVl2?=
 =?utf-8?B?TGEzaGhPelJ5T2tCZnpGMElSQ1RwRHNzcnpDd3FUVm1kdzdXb1BhVWU1bVU2?=
 =?utf-8?B?SHRKZWtzeFNIVkc1MHQ1UkNyRjcyOWhXa3c2YU40SktqTVZKcmdxT2NkVUxY?=
 =?utf-8?B?WDJXQ2NSSGFvbEJUc1lEZXJVdmk1ZEx3ZlZlLzdiTS9wLzdsL09DVnFXRXJV?=
 =?utf-8?B?MWtjR1BqZGNmdm5rd0xMbnpKSnVnZm9sNUpiUUNKZ1o1NkRHTjhQY0hKVGhQ?=
 =?utf-8?B?UTIwRHI2UWN3VHRBTHpEalBoU280UERNU1VSVSsxOWpHNTl2L0NYa2FnUlVw?=
 =?utf-8?B?YmlLLzFjOUNUVy9PaG5adjdlMlI2Uk94dGg0UEJld2k4UTQvTHNQYUQvVmZ1?=
 =?utf-8?B?MnpNdVZZVzJZT1pTWW03MGZ6Tk5pajFIMm54UmQxQ0xhRURMaCs2ZUNCWWhC?=
 =?utf-8?B?U2xvckpXU2JHdUVXTWVYaFlmYjE3VUNRY1RpU3NYSXB2Nk5vYkluWHNydk9R?=
 =?utf-8?B?S0RTYWtEdGwyeDNqSGFuaGp3ZGZmamtWTyt4SnRYajEvN0dIelhNNlF3aExh?=
 =?utf-8?B?dTdBUHRhWjlvMlVYUFF1aGorU2ZpeFBBQTNIWUtXaDVJUWZEdnhaNVpybDRt?=
 =?utf-8?B?a2w1QkhhMGVXUkRSQzJ3dVFYMkRWc2ZWbE51YUxsWWgxR3pabDV2OEtKT0xq?=
 =?utf-8?B?RUtHVGpyNWpjQTRrRXJwS1YwSFRqWHFYQlRXZ0xCeXhyM0s0N1NUWXp4TnVv?=
 =?utf-8?B?ZDFEUmtsbWo4VllMSUxaRHNNVkcrN2UxS3ZKRWY0M0xBYkc2bnd0MEEwc24v?=
 =?utf-8?B?a3l6RVBXMUZxc0F3SE8yWXBTRWlQcE9IUzZSbC9EQk1FNHljaGswRzEyWVBM?=
 =?utf-8?B?ZTluVkFIUzdwVFR6N0F4ZnZzMjJtekZWbEpSVVRRUlpZeGRGSkFmcENJRU1L?=
 =?utf-8?B?UGVOQ3J6cUFvYVdWL25mUDVTc2FxRjRSTW5kL0ZKbER3OEVIK09XWHZ2Q09h?=
 =?utf-8?B?TEtBZEFJRCtkYStqTkJBSzJ2QzkxRWlHRUZieFZyNmlkcUpGTlluamNpR0VU?=
 =?utf-8?B?NVpBcHRTZVM5eG9OUjlTYUZqL25qdk1Oak5PL3RRN29QaTAvQ1htcFdMYWtV?=
 =?utf-8?B?bi82MUY1NzJNRkF2a1FDZFlNQ3JUcUYyUkZKNHVubXArNDBOT0lEenRQWVJj?=
 =?utf-8?Q?5XhRGj/peUep8i4x/F8EIn9u62xd/OZQ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9226.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M0Q5bGtxYS9lZ3RObVY5b1NKaEFhMi9vcWpLN3RVUURnS29EanErZ0lVTHl5?=
 =?utf-8?B?QjdNTlI2VjJ2UkRXLzlRUUFyc1JrTS9xbm9nVmg0RUtRY3cyeEpuTm5YUTRt?=
 =?utf-8?B?RXd6SnRzY2hYdkJFZWFBd2NtQWVjamNmNjlNUWg0WmZmZlNURzUxWklRbzZr?=
 =?utf-8?B?RklqbVdyZjQ5YkxhVGNOTkNRRkI0S2pvOUl4YzJmSXNtZFpyVnFWUXRuUTEv?=
 =?utf-8?B?RUtONGpvMVB5OHd4bEFsRkx2L2F5REF1aXk3cXU4dU9GdXNRN1ZGQW51MGdp?=
 =?utf-8?B?bWxncmI5QW1FQzRVR2pXekR2MHVnU1BjdW0vcFI3RDlGOUh3MXFoaWM0MERj?=
 =?utf-8?B?NGhESFB5MEdjR1FRVXFoOC8yQUZRN2txMnoxcjVnY0tjSjRINlpJWEF0UWEx?=
 =?utf-8?B?RU1KNkFKajE5ZlFQVmdJWVl0SzY3cEFiUjdwMFh4SGdheEw1amwyamd4R29K?=
 =?utf-8?B?czRQZUdWZEFxODB0QjFGWjVyMlp2OHlQTW5vUUlOajRibjVoV1FIVldDZlhX?=
 =?utf-8?B?QmNTUW9HMU42RUJXM3VkMnVGcndkV1NHWkNsQm5MeE9aVWtlanFvdVNwLzZX?=
 =?utf-8?B?L25iSFFZRE0xWjFQL0dsdHR5QjNaODZ0VEQ4eHpuNENCaG5wVWpjR1lEQmdj?=
 =?utf-8?B?WkcyT0VNdUVwNm1qRjE0LzJYaHI2bmdPYVVVS0tlV05saytjcjd5cjlVSnZs?=
 =?utf-8?B?RFNRYSsvbDhyRTJVZDZVYVRqY21teGRFSHVJcXZ1cEljdmtRVXN3S1pMb2E4?=
 =?utf-8?B?c2tXcmxkRzJybjJlaTdDcVhBOEJPcWtBcTVQeXI5aksvcEhDREhweHF2elUx?=
 =?utf-8?B?YVpHZEoxRkxaTUptTlRyUlRDZnpsY3p3WnRYd0JrLzkrWC9FR2VmY0sraVhH?=
 =?utf-8?B?NDBlZ2tOdk4zNDNLNit1Mis3ZXVyYm1tcmYrTTdBL2xqQUVYY3FNMHM2Ky9h?=
 =?utf-8?B?cVVpMktsQ2RKN3dyenY4WEVDYTlXZ3FyNE1URG45WkVlc0J2aUhobzZXRjgy?=
 =?utf-8?B?M21pbzVWaUU0ZFpnb3Z6citnbTBUeFVTbUhSak9VL2ltMEcrMWZXQUtveURi?=
 =?utf-8?B?Y1ArbHJwUjdWeGNDUWx6MUJPMkVKMFc5QkFNMC9wVmx2UEhJTEVnOVNkN2ta?=
 =?utf-8?B?QTdBMmtxc0g2Y0hVNjVMK1p0Uno4cVMwMmw4akVidUNDUFNiSG84Y3Vnem5z?=
 =?utf-8?B?VTFaU293dGZnU3lFMWhaTlBUTWV1T0NxeDlRSzU1RXdmZVFKNXUxMzFjL0RD?=
 =?utf-8?B?dmdDZmhHcjBteGlySkkwa3NzNEs4TXZJRFlDUzdpSDR2bXh4VHloVms4SUx3?=
 =?utf-8?B?MlozdDdvS09TY2ZZNEtaVkpadnYvL09JcU9zVE51SW5SVHlKZURUMlpwSStL?=
 =?utf-8?B?Z2RiZkxKQVRjT3dSUTlZZG1YUUlXTjJjNGtZSG9sN3ErakxwY0RrUW1BWEkw?=
 =?utf-8?B?MDRGcVQyUzNPbWcxSXV5UHBHSXhFVDc1TWhzSU5Qc0xNdUc2SzJ0R1JONlc4?=
 =?utf-8?B?UUIwaTBZVmgrMk1KSHFjb2p0ZVVMbWNoYUF2THVnRDJuandWR1V5a1ZLdjA1?=
 =?utf-8?B?YXhCZkREdVBvWWxGemVhTWxwbXhXQ3pCaW5GaEUwV1pEeFVVZkZyY3RQV2N5?=
 =?utf-8?B?YUk3cEhyd0JYWXZJUkxrUHBwUzllMzJkV21PMmRmMlJKZjR2N3hsUERnWVRp?=
 =?utf-8?B?ZVJFekJpREFvY0sxQWpFenZZRHpGbW5BdzdqQUdQWk42RFBtaXF0cDBSNm9i?=
 =?utf-8?B?bHJkT293bkhBUVZQcGVseHdOQXlOb241K2dmalIvUXdmbUpaeThZcUk0aFhj?=
 =?utf-8?B?MDJQMHFMWTl5KzVMQlg4TGwvVVVnTjVnK1dHcWd3VVVoZlBUbkt3eWRZNFdU?=
 =?utf-8?B?OUpadmJQOHNrOUFDMEJIUzNvVWs3VUZlUGxtU2t3OUlMNE5meGZvMGJiWll3?=
 =?utf-8?B?cFZvYUp3WEljWXQ1Qjd2MU5DZzZHa1JqeG40bWhFZU1yemlKUkt4eFVnM2JW?=
 =?utf-8?B?MWM5d3JBNUFUcHVLTGd0RW1NV3ZYd1hLUUg3bFp2REpKSDIvdUc4aDlOYzJM?=
 =?utf-8?B?SkU0bzkwdUU2dTJ0bUVjVk5nampsWXFLVkZEZHI3elBKUThXaU1lMkNYZGts?=
 =?utf-8?Q?FYTtSXnpyA4gCdLTg2unVRLVt?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a3d8f3a8-7414-4343-fcb5-08ddfdca7d16
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9226.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2025 13:33:48.2341 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6NLF9slUxUAD1RDWNZmixScFEIzeI92yeU5SBJiNDxanDv+iLsEsHKpUGgoQZ8+OnacVXmcYXLMVUKDs6e50GQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6378
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

--------------mlYy1n80d5KK3VHoG9BRf7oi
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 9/24/2025 3:15 AM, Matthew Brost wrote:
> Fixup GuC submission pause / unpause functions to properly replay any
> possible state lost during VF post migration recovery.
>
> Signed-off-by: Matthew Brost<matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gpu_scheduler.c        |  14 ++
>   drivers/gpu/drm/xe/xe_gpu_scheduler.h        |   2 +
>   drivers/gpu/drm/xe/xe_gt_sriov_vf.c          |   1 +
>   drivers/gpu/drm/xe/xe_guc_exec_queue_types.h |  15 ++
>   drivers/gpu/drm/xe/xe_guc_submit.c           | 225 +++++++++++++++++--
>   drivers/gpu/drm/xe/xe_guc_submit.h           |   1 +
>   drivers/gpu/drm/xe/xe_sched_job_types.h      |   4 +
>   7 files changed, 247 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.c b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
> index 455ccaf17314..af300adc7e1a 100644
> --- a/drivers/gpu/drm/xe/xe_gpu_scheduler.c
> +++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
> @@ -135,3 +135,17 @@ void xe_sched_add_msg_locked(struct xe_gpu_scheduler *sched,
>   	list_add_tail(&msg->link, &sched->msgs);
>   	xe_sched_process_msg_queue(sched);
>   }
> +
> +/**
> + * xe_sched_add_msg_head() - Xe GPU scheduler add message to head of list
> + * @sched: Xe GPU scheduler
> + * @msg: Message to add
> + */
> +void xe_sched_add_msg_head(struct xe_gpu_scheduler *sched,
> +			   struct xe_sched_msg *msg)
> +{
> +	lockdep_assert_held(&sched->base.job_list_lock);
> +
> +	list_add(&msg->link, &sched->msgs);
> +	xe_sched_process_msg_queue(sched);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.h b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
> index e548b2aed95a..010003a6103a 100644
> --- a/drivers/gpu/drm/xe/xe_gpu_scheduler.h
> +++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
> @@ -29,6 +29,8 @@ void xe_sched_add_msg(struct xe_gpu_scheduler *sched,
>   		      struct xe_sched_msg *msg);
>   void xe_sched_add_msg_locked(struct xe_gpu_scheduler *sched,
>   			     struct xe_sched_msg *msg);
> +void xe_sched_add_msg_head(struct xe_gpu_scheduler *sched,
> +			   struct xe_sched_msg *msg);
>   
>   static inline void xe_sched_msg_lock(struct xe_gpu_scheduler *sched)
>   {
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index a987560de2c7..91e7dbe80ab2 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -1217,6 +1217,7 @@ static int vf_post_migration_fixups(struct xe_gt *gt)
>   static void vf_post_migration_rearm(struct xe_gt *gt)
>   {
>   	xe_guc_ct_restart(&gt->uc.guc.ct);
> +	xe_guc_submit_unpause_prepare(&gt->uc.guc);
>   }
>   
>   static void vf_post_migration_kickstart(struct xe_gt *gt)
> diff --git a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
> index c30c0e3ccbbb..a3b034e4b205 100644
> --- a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
> @@ -51,6 +51,21 @@ struct xe_guc_exec_queue {
>   	wait_queue_head_t suspend_wait;
>   	/** @suspend_pending: a suspend of the exec_queue is pending */
>   	bool suspend_pending;
> +	/**
> +	 * @needs_cleanup: Needs a cleanup message during VF post migration
> +	 * recovery.
> +	 */
> +	bool needs_cleanup;
> +	/**
> +	 * @needs_suspend: Needs a suspend message during VF post migration
> +	 * recovery.
> +	 */
> +	bool needs_suspend;
> +	/**
> +	 * @needs_resume: Needs a resume message during VF post migration
> +	 * recovery.
> +	 */
> +	bool needs_resume;
>   };
>   
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 8bee65dd9ca6..b112a4a91a5b 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -425,6 +425,11 @@ static void set_exec_queue_destroyed(struct xe_exec_queue *q)
>   	atomic_or(EXEC_QUEUE_STATE_DESTROYED, &q->guc->state);
>   }
>   
> +static void clear_exec_queue_destroyed(struct xe_exec_queue *q)
> +{
> +	atomic_and(~EXEC_QUEUE_STATE_DESTROYED, &q->guc->state);
> +}
> +
>   static bool exec_queue_banned(struct xe_exec_queue *q)
>   {
>   	return atomic_read(&q->guc->state) & EXEC_QUEUE_STATE_BANNED;
> @@ -505,7 +510,12 @@ static void set_exec_queue_extra_ref(struct xe_exec_queue *q)
>   	atomic_or(EXEC_QUEUE_STATE_EXTRA_REF, &q->guc->state);
>   }
>   
> -static bool __maybe_unused exec_queue_pending_resume(struct xe_exec_queue *q)
> +static void clear_exec_queue_extra_ref(struct xe_exec_queue *q)
> +{
> +	atomic_and(~EXEC_QUEUE_STATE_EXTRA_REF, &q->guc->state);
> +}
> +
> +static bool exec_queue_pending_resume(struct xe_exec_queue *q)
>   {
>   	return atomic_read(&q->guc->state) & EXEC_QUEUE_STATE_PENDING_RESUME;
>   }
> @@ -520,7 +530,7 @@ static void clear_exec_queue_pending_resume(struct xe_exec_queue *q)
>   	atomic_and(~EXEC_QUEUE_STATE_PENDING_RESUME, &q->guc->state);
>   }
>   
> -static bool __maybe_unused exec_queue_pending_tdr_exit(struct xe_exec_queue *q)
> +static bool exec_queue_pending_tdr_exit(struct xe_exec_queue *q)
>   {
>   	return atomic_read(&q->guc->state) & EXEC_QUEUE_STATE_PENDING_TDR_EXIT;
>   }
> @@ -1080,7 +1090,7 @@ static void wq_item_append(struct xe_exec_queue *q)
>   }
>   
>   #define RESUME_PENDING	~0x0ull
> -static void submit_exec_queue(struct xe_exec_queue *q)
> +static void submit_exec_queue(struct xe_exec_queue *q, struct xe_sched_job *job)
>   {
>   	struct xe_guc *guc = exec_queue_to_guc(q);
>   	struct xe_lrc *lrc = q->lrc[0];
> @@ -1092,10 +1102,13 @@ static void submit_exec_queue(struct xe_exec_queue *q)
>   
>   	xe_gt_assert(guc_to_gt(guc), exec_queue_registered(q));
>   
> -	if (xe_exec_queue_is_parallel(q))
> -		wq_item_append(q);
> -	else
> -		xe_lrc_set_ring_tail(lrc, lrc->ring.tail);
> +	if (!job->skip_emit || job->last_replay) {
> +		if (xe_exec_queue_is_parallel(q))
> +			wq_item_append(q);
> +		else
> +			xe_lrc_set_ring_tail(lrc, lrc->ring.tail);
> +		job->last_replay = false;
> +	}
>   
>   	if (exec_queue_suspended(q) && !xe_exec_queue_is_parallel(q))
>   		return;
> @@ -1148,8 +1161,10 @@ guc_exec_queue_run_job(struct drm_sched_job *drm_job)
>   	if (!killed_or_banned_or_wedged && !xe_sched_job_is_error(job)) {
>   		if (!exec_queue_registered(q))
>   			register_exec_queue(q, GUC_CONTEXT_NORMAL);
> -		q->ring_ops->emit_job(job);
> -		submit_exec_queue(q);
> +		if (!job->skip_emit)
> +			q->ring_ops->emit_job(job);
> +		submit_exec_queue(q, job);
> +		job->skip_emit = false;
>   	}
>   
>   	/*
> @@ -1860,6 +1875,7 @@ static void __guc_exec_queue_process_msg_resume(struct xe_sched_msg *msg)
>   #define RESUME		4
>   #define OPCODE_MASK	0xf
>   #define MSG_LOCKED	BIT(8)
> +#define MSG_HEAD	BIT(9)
>   
>   static void guc_exec_queue_process_msg(struct xe_sched_msg *msg)
>   {
> @@ -1984,12 +2000,24 @@ static void guc_exec_queue_add_msg(struct xe_exec_queue *q, struct xe_sched_msg
>   	msg->private_data = q;
>   
>   	trace_xe_sched_msg_add(msg);
> -	if (opcode & MSG_LOCKED)
> +	if (opcode & MSG_HEAD)
> +		xe_sched_add_msg_head(&q->guc->sched, msg);
> +	else if (opcode & MSG_LOCKED)
>   		xe_sched_add_msg_locked(&q->guc->sched, msg);
>   	else
>   		xe_sched_add_msg(&q->guc->sched, msg);
>   }
>   
> +static void guc_exec_queue_try_add_msg_head(struct xe_exec_queue *q,
> +					    struct xe_sched_msg *msg,
> +					    u32 opcode)
> +{
> +	if (!list_empty(&msg->link))
> +		return;
> +
> +	guc_exec_queue_add_msg(q, msg, opcode | MSG_LOCKED | MSG_HEAD);
> +}
> +
>   static bool guc_exec_queue_try_add_msg(struct xe_exec_queue *q,
>   				       struct xe_sched_msg *msg,
>   				       u32 opcode)
> @@ -2264,6 +2292,93 @@ void xe_guc_submit_stop(struct xe_guc *guc)
>   
>   }
>   
> +/*
> + * This function is quite complex but only real way to ensure no state is lost
> + * during VF resume flows. The function scans the queue state, make adjustments
> + * as needed, and queues jobs / messages which replayed upon unpause.
> + */
> +static void guc_exec_queue_pause(struct xe_guc *guc, struct xe_exec_queue *q)
> +{
> +	struct xe_gpu_scheduler *sched = &q->guc->sched;
> +	struct xe_sched_job *job;
> +	bool pending_enable, pending_disable, pending_resume;
> +	int i;
> +
> +	lockdep_assert_held(&guc->submission_state.lock);
> +
> +	/* Stop scheduling + flush any DRM scheduler operations */
> +	xe_sched_submission_stop(sched);
> +	if (xe_exec_queue_is_lr(q))
> +		cancel_work_sync(&q->guc->lr_tdr);
> +	else
> +		cancel_delayed_work_sync(&sched->base.work_tdr);

We're doing the same cancelling in `__guc_exec_queue_destroy_async()`, 
maybe close it into a function?

> +
> +	pending_enable = exec_queue_pending_enable(q);
> +	pending_resume = exec_queue_pending_resume(q);
> +
> +	if (pending_enable && pending_resume)
> +		q->guc->needs_resume = true;
> +
> +	if (pending_enable && !pending_resume &&
> +	    !exec_queue_pending_tdr_exit(q)) {
> +		clear_exec_queue_registered(q);
> +		if (xe_exec_queue_is_lr(q))
> +			xe_exec_queue_put(q);
> +	}
> +
> +	if (pending_enable) {
> +		clear_exec_queue_enabled(q);
> +		clear_exec_queue_pending_resume(q);
> +		clear_exec_queue_pending_tdr_exit(q);
> +		clear_exec_queue_pending_enable(q);
> +	}
> +
> +	if (exec_queue_destroyed(q) && exec_queue_registered(q)) {
> +		clear_exec_queue_destroyed(q);
> +		if (exec_queue_extra_ref(q))
> +			xe_exec_queue_put(q);
> +		else
> +			q->guc->needs_cleanup = true;
> +		clear_exec_queue_extra_ref(q);
> +	}
> +
> +	pending_disable = exec_queue_pending_disable(q);
> +
> +	if (pending_disable && exec_queue_suspended(q)) {
> +		clear_exec_queue_suspended(q);
> +		q->guc->needs_suspend = true;
> +	}
> +
> +	if (pending_disable) {
> +		if (!pending_enable)
> +			set_exec_queue_enabled(q);
> +		clear_exec_queue_pending_disable(q);
> +		clear_exec_queue_check_timeout(q);
> +	}

maybe we can close the above into a separate function as well?

ie. guc_exec_queue_undo_unfinished_state_change()?

guc_exec_queue_revert_pending_state_change()?

That would make this function easier to read, but also describe what 
we're doing.

Then, a counterfunction could be ripped out of guc_exec_queue_unpause().

> +
> +	q->guc->resume_time = 0;
> +
> +	if (xe_exec_queue_is_parallel(q)) {
> +		struct xe_device *xe = guc_to_xe(guc);
> +		struct iosys_map map = xe_lrc_parallel_map(q->lrc[0]);
> +
> +		for (i = 0; i < WQ_SIZE / sizeof(u32); ++i)
> +			parallel_write(xe, map, wq[i],
> +				       FIELD_PREP(WQ_TYPE_MASK, WQ_TYPE_NOOP) |
> +				       FIELD_PREP(WQ_LEN_MASK, 0));

ok so for parallel wq we're NOP'ing everything and adding the items back 
at new positions? Maybe a comment here would help in understanding that.

-Tomasz

> +	}
> +
> +	job = xe_sched_first_pending_job(sched);
> +	if (job) {
> +		/*
> +		 * Adjust software tail so jobs submitted overwrite previous
> +		 * position in ring buffer with new GGTT addresses.
> +		 */
> +		for (i = 0; i < q->width; ++i)
> +			q->lrc[i]->ring.tail = job->ptrs[i].head;
> +	}
> +}
> +
>   /**
>    * xe_guc_submit_pause - Stop further runs of submission tasks on given GuC.
>    * @guc: the &xe_guc struct instance whose scheduler is to be disabled
> @@ -2273,8 +2388,12 @@ void xe_guc_submit_pause(struct xe_guc *guc)
>   	struct xe_exec_queue *q;
>   	unsigned long index;
>   
> +	xe_gt_assert(guc_to_gt(guc), vf_recovery(guc));
> +
> +	mutex_lock(&guc->submission_state.lock);
>   	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q)
> -		xe_sched_submission_stop_async(&q->guc->sched);
> +		guc_exec_queue_pause(guc, q);
> +	mutex_unlock(&guc->submission_state.lock);
>   }
>   
>   static void guc_exec_queue_start(struct xe_exec_queue *q)
> @@ -2323,11 +2442,87 @@ int xe_guc_submit_start(struct xe_guc *guc)
>   	return 0;
>   }
>   
> -static void guc_exec_queue_unpause(struct xe_exec_queue *q)
> +static void guc_exec_queue_unpause_prepare(struct xe_guc *guc,
> +					   struct xe_exec_queue *q)
>   {
>   	struct xe_gpu_scheduler *sched = &q->guc->sched;
> +	struct drm_sched_job *s_job;
> +	struct xe_sched_job *job = NULL;
> +
> +	list_for_each_entry(s_job, &sched->base.pending_list, list) {
> +		job = to_xe_sched_job(s_job);
> +
> +		q->ring_ops->emit_job(job);
> +		job->skip_emit = true;
> +	}
> +
> +	if (job)
> +		job->last_replay = true;
> +}
> +
> +/**
> + * xe_guc_submit_unpause_prepare - Prepare unpause submission tasks on given GuC.
> + * @guc: the &xe_guc struct instance whose scheduler is to be prepared for unpause
> + */
> +void xe_guc_submit_unpause_prepare(struct xe_guc *guc)
> +{
> +	struct xe_exec_queue *q;
> +	unsigned long index;
> +
> +	xe_gt_assert(guc_to_gt(guc), vf_recovery(guc));
> +
> +	mutex_lock(&guc->submission_state.lock);
> +	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q)
> +		guc_exec_queue_unpause_prepare(guc, q);
> +	mutex_unlock(&guc->submission_state.lock);
> +}
> +
> +static void guc_exec_queue_unpause(struct xe_guc *guc, struct xe_exec_queue *q)
> +{
> +	struct xe_gpu_scheduler *sched = &q->guc->sched;
> +	struct xe_sched_msg *msg;
> +	bool needs_tdr = exec_queue_killed_or_banned_or_wedged(q);
> +
> +	lockdep_assert_held(&guc->submission_state.lock);
> +
> +	xe_sched_resubmit_jobs(sched);
> +
> +	if (q->guc->needs_cleanup) {
> +		msg = q->guc->static_msgs + STATIC_MSG_CLEANUP;
> +
> +		guc_exec_queue_add_msg(q, msg, CLEANUP);
> +		q->guc->needs_cleanup = false;
> +	}
> +
> +	if (q->guc->needs_suspend) {
> +		msg = q->guc->static_msgs + STATIC_MSG_SUSPEND;
> +
> +		xe_sched_msg_lock(sched);
> +		guc_exec_queue_try_add_msg_head(q, msg, SUSPEND);
> +		xe_sched_msg_unlock(sched);
> +
> +		q->guc->needs_suspend = false;
> +	}
> +
> +	/*
> +	 * The resume must be in the message queue before the suspend as it is
> +	 * not possible for a resume to be issued if a suspend pending is, but
> +	 * the inverse is possible.
> +	 */
> +	if (q->guc->needs_resume) {
> +		msg = q->guc->static_msgs + STATIC_MSG_RESUME;
> +
> +		xe_sched_msg_lock(sched);
> +		guc_exec_queue_try_add_msg_head(q, msg, RESUME);
> +		xe_sched_msg_unlock(sched);
> +
> +		q->guc->needs_resume = false;
> +	}
>   
>   	xe_sched_submission_start(sched);
> +	if (needs_tdr)
> +		xe_guc_exec_queue_trigger_cleanup(q);
> +	xe_sched_submission_resume_tdr(sched);
>   }
>   
>   /**
> @@ -2339,10 +2534,10 @@ void xe_guc_submit_unpause(struct xe_guc *guc)
>   	struct xe_exec_queue *q;
>   	unsigned long index;
>   
> +	mutex_lock(&guc->submission_state.lock);
>   	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q)
> -		guc_exec_queue_unpause(q);
> -
> -	wake_up_all(&guc->ct.wq);
> +		guc_exec_queue_unpause(guc, q);
> +	mutex_unlock(&guc->submission_state.lock);
>   }
>   
>   /**
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
> index fe82c317048e..b49a2748ec46 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.h
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.h
> @@ -22,6 +22,7 @@ void xe_guc_submit_stop(struct xe_guc *guc);
>   int xe_guc_submit_start(struct xe_guc *guc);
>   void xe_guc_submit_pause(struct xe_guc *guc);
>   void xe_guc_submit_unpause(struct xe_guc *guc);
> +void xe_guc_submit_unpause_prepare(struct xe_guc *guc);
>   void xe_guc_submit_pause_abort(struct xe_guc *guc);
>   void xe_guc_submit_wedge(struct xe_guc *guc);
>   
> diff --git a/drivers/gpu/drm/xe/xe_sched_job_types.h b/drivers/gpu/drm/xe/xe_sched_job_types.h
> index 7ce58765a34a..13e7a12b03ad 100644
> --- a/drivers/gpu/drm/xe/xe_sched_job_types.h
> +++ b/drivers/gpu/drm/xe/xe_sched_job_types.h
> @@ -63,6 +63,10 @@ struct xe_sched_job {
>   	bool ring_ops_flush_tlb;
>   	/** @ggtt: mapped in ggtt. */
>   	bool ggtt;
> +	/** @skip_emit: skip emitting the job */
> +	bool skip_emit;
> +	/** @last_replay: last job being replayed */
> +	bool last_replay;
>   	/** @ptrs: per instance pointers. */
>   	struct xe_job_ptrs ptrs[];
>   };
--------------mlYy1n80d5KK3VHoG9BRf7oi
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/24/2025 3:15 AM, Matthew Brost
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20250924011601.888293-27-matthew.brost@intel.com">
      <pre wrap="" class="moz-quote-pre">Fixup GuC submission pause / unpause functions to properly replay any
possible state lost during VF post migration recovery.

Signed-off-by: Matthew Brost <a class="moz-txt-link-rfc2396E" href="mailto:matthew.brost@intel.com">&lt;matthew.brost@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_gpu_scheduler.c        |  14 ++
 drivers/gpu/drm/xe/xe_gpu_scheduler.h        |   2 +
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c          |   1 +
 drivers/gpu/drm/xe/xe_guc_exec_queue_types.h |  15 ++
 drivers/gpu/drm/xe/xe_guc_submit.c           | 225 +++++++++++++++++--
 drivers/gpu/drm/xe/xe_guc_submit.h           |   1 +
 drivers/gpu/drm/xe/xe_sched_job_types.h      |   4 +
 7 files changed, 247 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.c b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
index 455ccaf17314..af300adc7e1a 100644
--- a/drivers/gpu/drm/xe/xe_gpu_scheduler.c
+++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
@@ -135,3 +135,17 @@ void xe_sched_add_msg_locked(struct xe_gpu_scheduler *sched,
 	list_add_tail(&amp;msg-&gt;link, &amp;sched-&gt;msgs);
 	xe_sched_process_msg_queue(sched);
 }
+
+/**
+ * xe_sched_add_msg_head() - Xe GPU scheduler add message to head of list
+ * @sched: Xe GPU scheduler
+ * @msg: Message to add
+ */
+void xe_sched_add_msg_head(struct xe_gpu_scheduler *sched,
+			   struct xe_sched_msg *msg)
+{
+	lockdep_assert_held(&amp;sched-&gt;base.job_list_lock);
+
+	list_add(&amp;msg-&gt;link, &amp;sched-&gt;msgs);
+	xe_sched_process_msg_queue(sched);
+}
diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.h b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
index e548b2aed95a..010003a6103a 100644
--- a/drivers/gpu/drm/xe/xe_gpu_scheduler.h
+++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
@@ -29,6 +29,8 @@ void xe_sched_add_msg(struct xe_gpu_scheduler *sched,
 		      struct xe_sched_msg *msg);
 void xe_sched_add_msg_locked(struct xe_gpu_scheduler *sched,
 			     struct xe_sched_msg *msg);
+void xe_sched_add_msg_head(struct xe_gpu_scheduler *sched,
+			   struct xe_sched_msg *msg);
 
 static inline void xe_sched_msg_lock(struct xe_gpu_scheduler *sched)
 {
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index a987560de2c7..91e7dbe80ab2 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -1217,6 +1217,7 @@ static int vf_post_migration_fixups(struct xe_gt *gt)
 static void vf_post_migration_rearm(struct xe_gt *gt)
 {
 	xe_guc_ct_restart(&amp;gt-&gt;uc.guc.ct);
+	xe_guc_submit_unpause_prepare(&amp;gt-&gt;uc.guc);
 }
 
 static void vf_post_migration_kickstart(struct xe_gt *gt)
diff --git a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
index c30c0e3ccbbb..a3b034e4b205 100644
--- a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
@@ -51,6 +51,21 @@ struct xe_guc_exec_queue {
 	wait_queue_head_t suspend_wait;
 	/** @suspend_pending: a suspend of the exec_queue is pending */
 	bool suspend_pending;
+	/**
+	 * @needs_cleanup: Needs a cleanup message during VF post migration
+	 * recovery.
+	 */
+	bool needs_cleanup;
+	/**
+	 * @needs_suspend: Needs a suspend message during VF post migration
+	 * recovery.
+	 */
+	bool needs_suspend;
+	/**
+	 * @needs_resume: Needs a resume message during VF post migration
+	 * recovery.
+	 */
+	bool needs_resume;
 };
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 8bee65dd9ca6..b112a4a91a5b 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -425,6 +425,11 @@ static void set_exec_queue_destroyed(struct xe_exec_queue *q)
 	atomic_or(EXEC_QUEUE_STATE_DESTROYED, &amp;q-&gt;guc-&gt;state);
 }
 
+static void clear_exec_queue_destroyed(struct xe_exec_queue *q)
+{
+	atomic_and(~EXEC_QUEUE_STATE_DESTROYED, &amp;q-&gt;guc-&gt;state);
+}
+
 static bool exec_queue_banned(struct xe_exec_queue *q)
 {
 	return atomic_read(&amp;q-&gt;guc-&gt;state) &amp; EXEC_QUEUE_STATE_BANNED;
@@ -505,7 +510,12 @@ static void set_exec_queue_extra_ref(struct xe_exec_queue *q)
 	atomic_or(EXEC_QUEUE_STATE_EXTRA_REF, &amp;q-&gt;guc-&gt;state);
 }
 
-static bool __maybe_unused exec_queue_pending_resume(struct xe_exec_queue *q)
+static void clear_exec_queue_extra_ref(struct xe_exec_queue *q)
+{
+	atomic_and(~EXEC_QUEUE_STATE_EXTRA_REF, &amp;q-&gt;guc-&gt;state);
+}
+
+static bool exec_queue_pending_resume(struct xe_exec_queue *q)
 {
 	return atomic_read(&amp;q-&gt;guc-&gt;state) &amp; EXEC_QUEUE_STATE_PENDING_RESUME;
 }
@@ -520,7 +530,7 @@ static void clear_exec_queue_pending_resume(struct xe_exec_queue *q)
 	atomic_and(~EXEC_QUEUE_STATE_PENDING_RESUME, &amp;q-&gt;guc-&gt;state);
 }
 
-static bool __maybe_unused exec_queue_pending_tdr_exit(struct xe_exec_queue *q)
+static bool exec_queue_pending_tdr_exit(struct xe_exec_queue *q)
 {
 	return atomic_read(&amp;q-&gt;guc-&gt;state) &amp; EXEC_QUEUE_STATE_PENDING_TDR_EXIT;
 }
@@ -1080,7 +1090,7 @@ static void wq_item_append(struct xe_exec_queue *q)
 }
 
 #define RESUME_PENDING	~0x0ull
-static void submit_exec_queue(struct xe_exec_queue *q)
+static void submit_exec_queue(struct xe_exec_queue *q, struct xe_sched_job *job)
 {
 	struct xe_guc *guc = exec_queue_to_guc(q);
 	struct xe_lrc *lrc = q-&gt;lrc[0];
@@ -1092,10 +1102,13 @@ static void submit_exec_queue(struct xe_exec_queue *q)
 
 	xe_gt_assert(guc_to_gt(guc), exec_queue_registered(q));
 
-	if (xe_exec_queue_is_parallel(q))
-		wq_item_append(q);
-	else
-		xe_lrc_set_ring_tail(lrc, lrc-&gt;ring.tail);
+	if (!job-&gt;skip_emit || job-&gt;last_replay) {
+		if (xe_exec_queue_is_parallel(q))
+			wq_item_append(q);
+		else
+			xe_lrc_set_ring_tail(lrc, lrc-&gt;ring.tail);
+		job-&gt;last_replay = false;
+	}
 
 	if (exec_queue_suspended(q) &amp;&amp; !xe_exec_queue_is_parallel(q))
 		return;
@@ -1148,8 +1161,10 @@ guc_exec_queue_run_job(struct drm_sched_job *drm_job)
 	if (!killed_or_banned_or_wedged &amp;&amp; !xe_sched_job_is_error(job)) {
 		if (!exec_queue_registered(q))
 			register_exec_queue(q, GUC_CONTEXT_NORMAL);
-		q-&gt;ring_ops-&gt;emit_job(job);
-		submit_exec_queue(q);
+		if (!job-&gt;skip_emit)
+			q-&gt;ring_ops-&gt;emit_job(job);
+		submit_exec_queue(q, job);
+		job-&gt;skip_emit = false;
 	}
 
 	/*
@@ -1860,6 +1875,7 @@ static void __guc_exec_queue_process_msg_resume(struct xe_sched_msg *msg)
 #define RESUME		4
 #define OPCODE_MASK	0xf
 #define MSG_LOCKED	BIT(8)
+#define MSG_HEAD	BIT(9)
 
 static void guc_exec_queue_process_msg(struct xe_sched_msg *msg)
 {
@@ -1984,12 +2000,24 @@ static void guc_exec_queue_add_msg(struct xe_exec_queue *q, struct xe_sched_msg
 	msg-&gt;private_data = q;
 
 	trace_xe_sched_msg_add(msg);
-	if (opcode &amp; MSG_LOCKED)
+	if (opcode &amp; MSG_HEAD)
+		xe_sched_add_msg_head(&amp;q-&gt;guc-&gt;sched, msg);
+	else if (opcode &amp; MSG_LOCKED)
 		xe_sched_add_msg_locked(&amp;q-&gt;guc-&gt;sched, msg);
 	else
 		xe_sched_add_msg(&amp;q-&gt;guc-&gt;sched, msg);
 }
 
+static void guc_exec_queue_try_add_msg_head(struct xe_exec_queue *q,
+					    struct xe_sched_msg *msg,
+					    u32 opcode)
+{
+	if (!list_empty(&amp;msg-&gt;link))
+		return;
+
+	guc_exec_queue_add_msg(q, msg, opcode | MSG_LOCKED | MSG_HEAD);
+}
+
 static bool guc_exec_queue_try_add_msg(struct xe_exec_queue *q,
 				       struct xe_sched_msg *msg,
 				       u32 opcode)
@@ -2264,6 +2292,93 @@ void xe_guc_submit_stop(struct xe_guc *guc)
 
 }
 
+/*
+ * This function is quite complex but only real way to ensure no state is lost
+ * during VF resume flows. The function scans the queue state, make adjustments
+ * as needed, and queues jobs / messages which replayed upon unpause.
+ */
+static void guc_exec_queue_pause(struct xe_guc *guc, struct xe_exec_queue *q)
+{
+	struct xe_gpu_scheduler *sched = &amp;q-&gt;guc-&gt;sched;
+	struct xe_sched_job *job;
+	bool pending_enable, pending_disable, pending_resume;
+	int i;
+
+	lockdep_assert_held(&amp;guc-&gt;submission_state.lock);
+
+	/* Stop scheduling + flush any DRM scheduler operations */
+	xe_sched_submission_stop(sched);
+	if (xe_exec_queue_is_lr(q))
+		cancel_work_sync(&amp;q-&gt;guc-&gt;lr_tdr);
+	else
+		cancel_delayed_work_sync(&amp;sched-&gt;base.work_tdr);</pre>
    </blockquote>
    <p>We're doing the same cancelling in
      `__guc_exec_queue_destroy_async()`, maybe close it into a
      function?</p>
    <blockquote type="cite" cite="mid:20250924011601.888293-27-matthew.brost@intel.com">
      <pre wrap="" class="moz-quote-pre">
+
+	pending_enable = exec_queue_pending_enable(q);
+	pending_resume = exec_queue_pending_resume(q);
+
+	if (pending_enable &amp;&amp; pending_resume)
+		q-&gt;guc-&gt;needs_resume = true;
+
+	if (pending_enable &amp;&amp; !pending_resume &amp;&amp;
+	    !exec_queue_pending_tdr_exit(q)) {
+		clear_exec_queue_registered(q);
+		if (xe_exec_queue_is_lr(q))
+			xe_exec_queue_put(q);
+	}
+
+	if (pending_enable) {
+		clear_exec_queue_enabled(q);
+		clear_exec_queue_pending_resume(q);
+		clear_exec_queue_pending_tdr_exit(q);
+		clear_exec_queue_pending_enable(q);
+	}
+
+	if (exec_queue_destroyed(q) &amp;&amp; exec_queue_registered(q)) {
+		clear_exec_queue_destroyed(q);
+		if (exec_queue_extra_ref(q))
+			xe_exec_queue_put(q);
+		else
+			q-&gt;guc-&gt;needs_cleanup = true;
+		clear_exec_queue_extra_ref(q);
+	}
+
+	pending_disable = exec_queue_pending_disable(q);
+
+	if (pending_disable &amp;&amp; exec_queue_suspended(q)) {
+		clear_exec_queue_suspended(q);
+		q-&gt;guc-&gt;needs_suspend = true;
+	}
+
+	if (pending_disable) {
+		if (!pending_enable)
+			set_exec_queue_enabled(q);
+		clear_exec_queue_pending_disable(q);
+		clear_exec_queue_check_timeout(q);
+	}</pre>
    </blockquote>
    <p>maybe we can close the above into a separate function as well?</p>
    <p>ie.&nbsp;<span style="white-space: pre-wrap">guc_exec_queue_undo_unfinished_state_change()?</span></p>
    <p><span style="white-space: pre-wrap">guc_exec_queue_revert_pending_state_change()?</span></p>
    <p>That would make this function easier to read, but also describe
      what we're doing.</p>
    <p>Then, a counterfunction could be ripped out of&nbsp;<span style="white-space: pre-wrap">guc_exec_queue_unpause<span style="white-space: normal">().</span></span></p>
    <blockquote type="cite" cite="mid:20250924011601.888293-27-matthew.brost@intel.com">
      <pre wrap="" class="moz-quote-pre">
+
+	q-&gt;guc-&gt;resume_time = 0;
+
+	if (xe_exec_queue_is_parallel(q)) {
+		struct xe_device *xe = guc_to_xe(guc);
+		struct iosys_map map = xe_lrc_parallel_map(q-&gt;lrc[0]);
+
+		for (i = 0; i &lt; WQ_SIZE / sizeof(u32); ++i)
+			parallel_write(xe, map, wq[i],
+				       FIELD_PREP(WQ_TYPE_MASK, WQ_TYPE_NOOP) |
+				       FIELD_PREP(WQ_LEN_MASK, 0));</pre>
    </blockquote>
    <p>ok so for parallel wq we're NOP'ing everything and adding the
      items back at new positions? Maybe a comment here would help in
      understanding that.</p>
    <p>-Tomasz</p>
    <blockquote type="cite" cite="mid:20250924011601.888293-27-matthew.brost@intel.com">
      <pre wrap="" class="moz-quote-pre">
+	}
+
+	job = xe_sched_first_pending_job(sched);
+	if (job) {
+		/*
+		 * Adjust software tail so jobs submitted overwrite previous
+		 * position in ring buffer with new GGTT addresses.
+		 */
+		for (i = 0; i &lt; q-&gt;width; ++i)
+			q-&gt;lrc[i]-&gt;ring.tail = job-&gt;ptrs[i].head;
+	}
+}
+
 /**
  * xe_guc_submit_pause - Stop further runs of submission tasks on given GuC.
  * @guc: the &amp;xe_guc struct instance whose scheduler is to be disabled
@@ -2273,8 +2388,12 @@ void xe_guc_submit_pause(struct xe_guc *guc)
 	struct xe_exec_queue *q;
 	unsigned long index;
 
+	xe_gt_assert(guc_to_gt(guc), vf_recovery(guc));
+
+	mutex_lock(&amp;guc-&gt;submission_state.lock);
 	xa_for_each(&amp;guc-&gt;submission_state.exec_queue_lookup, index, q)
-		xe_sched_submission_stop_async(&amp;q-&gt;guc-&gt;sched);
+		guc_exec_queue_pause(guc, q);
+	mutex_unlock(&amp;guc-&gt;submission_state.lock);
 }
 
 static void guc_exec_queue_start(struct xe_exec_queue *q)
@@ -2323,11 +2442,87 @@ int xe_guc_submit_start(struct xe_guc *guc)
 	return 0;
 }
 
-static void guc_exec_queue_unpause(struct xe_exec_queue *q)
+static void guc_exec_queue_unpause_prepare(struct xe_guc *guc,
+					   struct xe_exec_queue *q)
 {
 	struct xe_gpu_scheduler *sched = &amp;q-&gt;guc-&gt;sched;
+	struct drm_sched_job *s_job;
+	struct xe_sched_job *job = NULL;
+
+	list_for_each_entry(s_job, &amp;sched-&gt;base.pending_list, list) {
+		job = to_xe_sched_job(s_job);
+
+		q-&gt;ring_ops-&gt;emit_job(job);
+		job-&gt;skip_emit = true;
+	}
+
+	if (job)
+		job-&gt;last_replay = true;
+}
+
+/**
+ * xe_guc_submit_unpause_prepare - Prepare unpause submission tasks on given GuC.
+ * @guc: the &amp;xe_guc struct instance whose scheduler is to be prepared for unpause
+ */
+void xe_guc_submit_unpause_prepare(struct xe_guc *guc)
+{
+	struct xe_exec_queue *q;
+	unsigned long index;
+
+	xe_gt_assert(guc_to_gt(guc), vf_recovery(guc));
+
+	mutex_lock(&amp;guc-&gt;submission_state.lock);
+	xa_for_each(&amp;guc-&gt;submission_state.exec_queue_lookup, index, q)
+		guc_exec_queue_unpause_prepare(guc, q);
+	mutex_unlock(&amp;guc-&gt;submission_state.lock);
+}
+
+static void guc_exec_queue_unpause(struct xe_guc *guc, struct xe_exec_queue *q)
+{
+	struct xe_gpu_scheduler *sched = &amp;q-&gt;guc-&gt;sched;
+	struct xe_sched_msg *msg;
+	bool needs_tdr = exec_queue_killed_or_banned_or_wedged(q);
+
+	lockdep_assert_held(&amp;guc-&gt;submission_state.lock);
+
+	xe_sched_resubmit_jobs(sched);
+
+	if (q-&gt;guc-&gt;needs_cleanup) {
+		msg = q-&gt;guc-&gt;static_msgs + STATIC_MSG_CLEANUP;
+
+		guc_exec_queue_add_msg(q, msg, CLEANUP);
+		q-&gt;guc-&gt;needs_cleanup = false;
+	}
+
+	if (q-&gt;guc-&gt;needs_suspend) {
+		msg = q-&gt;guc-&gt;static_msgs + STATIC_MSG_SUSPEND;
+
+		xe_sched_msg_lock(sched);
+		guc_exec_queue_try_add_msg_head(q, msg, SUSPEND);
+		xe_sched_msg_unlock(sched);
+
+		q-&gt;guc-&gt;needs_suspend = false;
+	}
+
+	/*
+	 * The resume must be in the message queue before the suspend as it is
+	 * not possible for a resume to be issued if a suspend pending is, but
+	 * the inverse is possible.
+	 */
+	if (q-&gt;guc-&gt;needs_resume) {
+		msg = q-&gt;guc-&gt;static_msgs + STATIC_MSG_RESUME;
+
+		xe_sched_msg_lock(sched);
+		guc_exec_queue_try_add_msg_head(q, msg, RESUME);
+		xe_sched_msg_unlock(sched);
+
+		q-&gt;guc-&gt;needs_resume = false;
+	}
 
 	xe_sched_submission_start(sched);
+	if (needs_tdr)
+		xe_guc_exec_queue_trigger_cleanup(q);
+	xe_sched_submission_resume_tdr(sched);
 }
 
 /**
@@ -2339,10 +2534,10 @@ void xe_guc_submit_unpause(struct xe_guc *guc)
 	struct xe_exec_queue *q;
 	unsigned long index;
 
+	mutex_lock(&amp;guc-&gt;submission_state.lock);
 	xa_for_each(&amp;guc-&gt;submission_state.exec_queue_lookup, index, q)
-		guc_exec_queue_unpause(q);
-
-	wake_up_all(&amp;guc-&gt;ct.wq);
+		guc_exec_queue_unpause(guc, q);
+	mutex_unlock(&amp;guc-&gt;submission_state.lock);
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
index fe82c317048e..b49a2748ec46 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.h
+++ b/drivers/gpu/drm/xe/xe_guc_submit.h
@@ -22,6 +22,7 @@ void xe_guc_submit_stop(struct xe_guc *guc);
 int xe_guc_submit_start(struct xe_guc *guc);
 void xe_guc_submit_pause(struct xe_guc *guc);
 void xe_guc_submit_unpause(struct xe_guc *guc);
+void xe_guc_submit_unpause_prepare(struct xe_guc *guc);
 void xe_guc_submit_pause_abort(struct xe_guc *guc);
 void xe_guc_submit_wedge(struct xe_guc *guc);
 
diff --git a/drivers/gpu/drm/xe/xe_sched_job_types.h b/drivers/gpu/drm/xe/xe_sched_job_types.h
index 7ce58765a34a..13e7a12b03ad 100644
--- a/drivers/gpu/drm/xe/xe_sched_job_types.h
+++ b/drivers/gpu/drm/xe/xe_sched_job_types.h
@@ -63,6 +63,10 @@ struct xe_sched_job {
 	bool ring_ops_flush_tlb;
 	/** @ggtt: mapped in ggtt. */
 	bool ggtt;
+	/** @skip_emit: skip emitting the job */
+	bool skip_emit;
+	/** @last_replay: last job being replayed */
+	bool last_replay;
 	/** @ptrs: per instance pointers. */
 	struct xe_job_ptrs ptrs[];
 };
</pre>
    </blockquote>
  </body>
</html>

--------------mlYy1n80d5KK3VHoG9BRf7oi--

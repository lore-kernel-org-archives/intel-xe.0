Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68402D609AD
	for <intel-xe@archiver.kernel.org>; Wed, 27 Nov 2024 08:24:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30F3010E0D8;
	Wed, 27 Nov 2024 08:24:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jtfKW7/Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A93A10E0D8
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Nov 2024 08:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732695872; x=1764231872;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=sVaujCOg71Ams2Wkmkm9PJQXHji9J3l3yZOI1UqehBk=;
 b=jtfKW7/Yd2twVH8qvKFp7B8xAMXNvvCaqUOD6AqbYWpWiFqHHl0vlkrl
 9C+kDHor8ikiYrlIK3tDR0wOiWShW1buL/II8UCPfC1sAS5dP4qhcMktj
 DcaR0akwC8/oVf5rROLCt+9XW6h5/nxLvL2WZwSFWDMYUI+6826yasIwc
 vsAlXXFK14SvaUwxdJql1wm0UMiYMcTI+ptlvnfOsGiYi5BPp8kNsYnmS
 3hWOAcK72RNos1plGn3HxTvXXEdVIQrIIXje48ZpRO/fEi/JKvz6Wk7wZ
 D4AmfrCi9eTBmAvITsiYt0qikTSL0QmPhUyL7Q93qOwL+C3EfRj4BCVod w==;
X-CSE-ConnectionGUID: XxMjeyAsS+aMHPbqa236cw==
X-CSE-MsgGUID: pJSRS9SdSJ2rWOqr8HH0gA==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="32261438"
X-IronPort-AV: E=Sophos;i="6.12,189,1728975600"; d="scan'208";a="32261438"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2024 00:24:18 -0800
X-CSE-ConnectionGUID: EkPZxdztSkS/oBUlCvbwKA==
X-CSE-MsgGUID: rMRfYO3PRjeYK+wl+1QDqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="96925661"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Nov 2024 00:24:17 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 27 Nov 2024 00:24:16 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 27 Nov 2024 00:24:16 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 27 Nov 2024 00:24:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I+IxfV1C0j+LQe6coL4uarzLJ6gGopZjjABsdPJx5BKOQox5Fzp1d25Xym9mkQ9loFQhiG2zWGWMH7Y7mig642pX6hQX48yuq9KaciRfy6RdNlQNOcujKg8K6ay1AOhTQxkEpXTW5s08Tb0So7m159mvvSLn4P1+F9KQi8wu505p6mvB8gFEdoL05ju4ZdEoeCEaEk5MZR1cBoJ7sAfc44g5g7vsqYsCXJGxJiA3vlQvnlbvJrEGitw6/Q0Ri1bqAc0ChUQbplN+xVQdanIZPQQ3AcLcKCyFrXP9ASjP694sIB6gmpY07rcBNbPJWUU9Ffib56Rglkq0+Qtiznlyfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Zr0y9QHaOYfiqEM5tpvRuqo4FFWoi385QD7B4SuJC8=;
 b=NgXIudACFQy2QitBBMhKctZLGEGO82DA7TcfA/dIqFVWtL8TVT7fKttZx1hk68o4r/vDHTgjUgNhzQnIVFUHc/6LMb+rOUop8m/7gVnrL9Mytg1QQKpjlo7qs1OBjxm5rCz2vdQefJMotPBmMe+WFklabFe+0FlRV9+f8Tax0slJLc8CxgMbt6Lq8mptQ2NY1TcE9P4b2XUF19A6qAneBFyijrBO+d2GQLXlRJFfKnzqcWfy0g1m/kjZscdygBFp6kyCYrJQPcdqd6UrhSvtCaKV7L9ly+lrvE9UvTpBTbtFF7j3MLyEv9i83XOu4AQHv+3g3ud6irVl724TyNDb1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by MN0PR11MB6134.namprd11.prod.outlook.com (2603:10b6:208:3ca::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.20; Wed, 27 Nov
 2024 08:24:12 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%6]) with mapi id 15.20.8207.010; Wed, 27 Nov 2024
 08:24:11 +0000
Date: Wed, 27 Nov 2024 09:24:08 +0100
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Ilia Levi <ilia.levi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <niranjana.vishwanathapura@intel.com>,
 <koby.elbaz@intel.com>, <yaron.avizrat@intel.com>
Subject: Re: [PATCH v4 1/3] drm/xe: Initial MSI-X support for HW engines
Message-ID: <20241127082408.cf3lqksj4j6jusgp@intel.com>
References: <20241110203915.729-1-ilia.levi@intel.com>
 <20241110203915.729-2-ilia.levi@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241110203915.729-2-ilia.levi@intel.com>
X-ClientProxiedBy: WA2P291CA0043.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::28) To CY5PR11MB6138.namprd11.prod.outlook.com
 (2603:10b6:930:2a::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|MN0PR11MB6134:EE_
X-MS-Office365-Filtering-Correlation-Id: c06a9b4e-1a51-41c6-0692-08dd0ebcde6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SGxxcy9VQm1JcTFJZ09McTIyRXBXdTQ4b3RHT3RYdXhNRzR1aWdKL0xRdmVn?=
 =?utf-8?B?d2I5YUgxcy9vQVBIR0lkS0RhWUUxZm13T3VQeXFhQ2E3Nm1OejlzMzZJSStX?=
 =?utf-8?B?dGlBSzk0SFhBKzhGaGU3K1N1dDFMTDJxRkdBN254eEM0Z3pKeVl5UTNVaGVU?=
 =?utf-8?B?TEsvUkpuSVdmMGQ5eTAySjVlWTdRUlJIc0pqUWxpaDc0THNEKzZpT05Uckxq?=
 =?utf-8?B?UWp3Z0tycVF5cTF0bVFuaFpWTWJEUmV6VDVFNDB5ZEVtRUp2dFhvNWpURmNk?=
 =?utf-8?B?ejN4V3hXdm13QkxROHErVEhjaDRVY3Fpb1dXT1RRVmNLeE9pNXpBL05rZG5s?=
 =?utf-8?B?RzRNeW0yak1WZ09MNHpieWRhQUJvRnFscW5HMmhzeUkvUVZ2MXQ3ZHVnbW1Y?=
 =?utf-8?B?TVNudXVwR2tOWnJYZFNvSjNSdlB2S0kvYUlwekVGQW9qUGtlemVVaWVETklq?=
 =?utf-8?B?K09qY09ZZWNMaDV3bVJBVTdvWHlIWjVDaVZZT1N1ZndMdE13VWRFLzNLcVMy?=
 =?utf-8?B?VFpMNWNhK3NJekRPTFpxbU1hRHN0UjM2MGdtTTB0a09XdFNGSlNWMkYvTVJJ?=
 =?utf-8?B?UjFsV3VrckV4T3lJT1ZmdCsybWF4ckc1ZU1xMGwyS2dDVzlodkpJZ1JJb3BV?=
 =?utf-8?B?eXNIa0VKTk5wd2l3cG9YQkR6QmtNVzB3SjBOdE1XcDRCcmJJdTJUa3lSRGNV?=
 =?utf-8?B?Tm9sY1QrNlZvT1o5dk5QbWlpRFRuYklsdFQ3TFJaMk5CTkdNbzNON0wzWnJF?=
 =?utf-8?B?YmExeGE3SCtMakhLZDRoUVBHOUEraHEzM1BITm5tbTg0T1BxN3d2Y2lMNnBJ?=
 =?utf-8?B?VURLbXQwYXRzNC9xMjh0eGFxZGlrd09NVXVIT3VXMDRqT0s2cTMvdkw3QXNy?=
 =?utf-8?B?NzFjT0NGVXB1cnVWdm9sbmlNajlBQmovZlNEb09xWU9PK08zTXZJM3l3czN1?=
 =?utf-8?B?Q2dsRElkcXI1ZE5RYVFab2FDVGZoUjJvZC9MRll3TGd2QytQUkNidTVrYWlF?=
 =?utf-8?B?UXJwMGZ0bEh0K1JIeEZ0UnhONXlWYlYwSitWNEI0bGtMVHJZM3pNV3FPWVFB?=
 =?utf-8?B?NUV2YVUxSDJjTmo1Y1dudTdOYjVSWTBkV21ybVVpQ2hEMGtHejhTMjZtZUk0?=
 =?utf-8?B?NEhCNDZGMDR0LzRMdFJwM2FxNlduSHRFV0JKREdsMUh4R1VzMXhUL2l3QVR0?=
 =?utf-8?B?MVlzeWtUNFZrdFFaTXRWODBNQUVnRGNLSHg5Z29GdGdNeTRabGFvV2hHdzZo?=
 =?utf-8?B?VUhrTlZPekg4dG5WTStOVm91czZuOTlxZWVieDh2WFJabzZ1TFZpZThxdjA3?=
 =?utf-8?B?QzlVL0xNaEhseStqVStiaUt0WHFKRGZDVlJCWGNLS1A4R2NMZ3hSSXNaaWdm?=
 =?utf-8?B?SmlkTUl4TUdUZi9sdTlLNHZRcW9VeGFpL04rNlpSb3R1M003RVcyKzlxeDFD?=
 =?utf-8?B?Uy93QUtZVUNJbTJDc1JhS2krZG9XQ2ovS01KMXFtZHJYdUdhNDU4RHFmUllI?=
 =?utf-8?B?ZFBwa3IvM1lsTGFmdFRYSXhIMDIwRVBKRXR1bWNMTkc1cXN3elB3L1BsUTBT?=
 =?utf-8?B?WmRDdzZ0UkZ2RG5kejdiUXlNd0hCTmJIZ3JaWTdpY1lYTFdYMFcxdk9Wc0dJ?=
 =?utf-8?B?SVZUV3VBOGRvL0dlRzFuMHdYU012QnFOT085eXNGWmVOYkNvSCtma2FZeDBN?=
 =?utf-8?B?ZzdpTW1LTTdRc3ZMa2RaMzFhQnlqSUkySnQzUlkxRVlZY1lUdzYyWkVWV2xT?=
 =?utf-8?B?N3ZqTm00bFdqRnk2anRSUGxxUEs1Z2xYZUh1WWZ0dlBwUDFzT1JtK2pUbm8v?=
 =?utf-8?B?dDlnUE1Yb1BKOFNMWGV6dz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QWw1MXlpNzdCQiszT3lQYzB4SnpZNTY0eXU5OHVOVC92SFh0R1lXb1p4eG5U?=
 =?utf-8?B?b3pncFBZaTFuNG53dG1EMXlERHllcW1UNWVRNkRLNW9kazZORjNTc00ybVBB?=
 =?utf-8?B?dlQ2KzVyb2dIVmlCdnA2R0NKcDFucVY2NjZMQ1Z6bk85YmFBcVQyb00wL3E0?=
 =?utf-8?B?UzBXTHFmYjczNEJIR0RnSHc2bWZuekU0WXdLeFdXZDRSMkxqNkkxbGNQVURC?=
 =?utf-8?B?bm9NN21PTk9tcGdvSzQyWnBrVlF6eS9RblZ0eEhIWnA5UzNIa1VDc0tvWVJI?=
 =?utf-8?B?c1BSaE13SjFDbzh6YjZyTTQ3QWxoc1BORVhPclczMzJNajVTSDI4TGtSM1cx?=
 =?utf-8?B?azJma2xySWN6WHBWWFd2RVJhOXJaeHI0ZXBva01UWWtaVzJZQkNmRnBUYWdQ?=
 =?utf-8?B?akthOGxwdGVDNFltMVFjKzUxMTMvc01uQTVpd25YZ1lvOExreUVCYjloUzN3?=
 =?utf-8?B?ZFJxSElkNW9XT3kvbXdEWXJRa1ZaOUZscWN2UnZLTE1FYmZuZ3Z0M2lFdWRn?=
 =?utf-8?B?QjBnYzZwRVYvMU11cndMaWJVTHdXa0pOZ3JZZzVRRm92anFBT2JmTGs4YitQ?=
 =?utf-8?B?SVhrSTF4d21naGI2dDhraEFiS3pNUStYRUFTb2NlL1pvOE1UVVV4MDVNa0Jx?=
 =?utf-8?B?K3dFNXgvWmVWU3JZYi9YSnBKRDQ4UU4rODdKMDZKSGwwT3hFOWlJSkk0dDZz?=
 =?utf-8?B?UkVOR0pYV2RGUlkvVGp6TGx5WjJubU44N3JxcEVXSk9QdUVrQlNIM0k5WkFL?=
 =?utf-8?B?b3VlVXozcW4zeHQ5WE9Ua0NlUUpublhqYUFQZmJIZDJDQlc5NGloRWd3cVdE?=
 =?utf-8?B?MDBOT0dtVSszc1dGNFpzUWtvZ24xQm5VMFZzM0ZRdXEvZy9temNuMUtEN1l4?=
 =?utf-8?B?Zlh5YkdzWUpMK3FxbnZrTWU4VTRtU3VyalpiektieFEwYTdMZ0xnTkY0eHNu?=
 =?utf-8?B?RzlvWVU1WUFmMUx1eG5MYnh6VHpyR1dsa2p0Sk5sWEdCRWJ1ZU5YeUN1bWRF?=
 =?utf-8?B?WmRXdk5wbXg0aE1PM1o5c0h6VDdaZit0NGNVQXlTeS9CV1N1QlVJMlNXQTZZ?=
 =?utf-8?B?TVRORUsxdGZUOHVYd21TTkRwc0M4OVJuUDEwMjZTdnpBS09OdTdaRE1MTmZC?=
 =?utf-8?B?Z2g2eHJabUdDbHlGTTNyaHNvKzRadVdiNVNsM2dQOVRMNGgvZUZBZnZ5dGJl?=
 =?utf-8?B?VW1BUjBpblpmZUx5cHQ0Rk4rd1p2V3J4d3RyZ1dmU04wcmhnVDFVeS94SjV0?=
 =?utf-8?B?NDN3VG1kOU5kdWZocVdzRllzUzdDeFJ0TjJScVFpbm5mRzlNRUs3NGpQcTdy?=
 =?utf-8?B?TFVvMUppc3JaeC9OMWNjZXdvMlRoMnhNYnpkQVdhRy9xTXdsVFd5MEQ5bFpx?=
 =?utf-8?B?bE8wdWZFUlVpZG9VSG5wdWhPY0t4NjVDcW9GaHJQU1RSeGx2eGNwMXZIemZi?=
 =?utf-8?B?RTd6RlpkcnMyNTVYU2tGVWlQRzVwRTRhNGNsVmlnMjVpYnJ3WHB5WWFBUkJn?=
 =?utf-8?B?cVovVzBGVVJiV0RYZk81R3Vyc2h3RElURStkbWZpdngyWi9NRUJwVU9CajUy?=
 =?utf-8?B?dE42a1M3OTBWbWpYMEJTWjJUZkhsTEdpclZkRkFtRVh5VHFWN3JZYlAvU01z?=
 =?utf-8?B?YVVPdlU0ajdVM0N1bFpIMjlsc0hoWTZFTW1VQUNJb2hIY21TYlhQWStaRTRB?=
 =?utf-8?B?VGJyT3RoYUZEcmdWT0J2ekU1T1Izd2t4ZWpRRUZTM2xWZWZmdmpLWnVmNUdu?=
 =?utf-8?B?Q05rR1FmWlIzcUJNdVU3Q1ZUMjdhc1MydVNud0NZN2ZaOVVlbUdKWlVCSUNY?=
 =?utf-8?B?eUt6ZUVOUHhndXJUZkp0YndPUndYSzZaTVNyM3Y3aTVlcE9VVytwVHZiNmxI?=
 =?utf-8?B?NFovdVNPb2x0bE1McFp1NHlnVktHaDlleHdaUFE1dFRZUHNzdUswTk9ObVAv?=
 =?utf-8?B?Z0l2Q3p3MEtUUk5jWW5hNkEvOFZKVWN3c1ZGL3hCM3lKRHg5eTNaeTd5eDQr?=
 =?utf-8?B?WjBqaWlINjRXK0tqRkhwa2I4YjFiRjFPTjQvWDl5OGwyUC9jdGpDamhvQ2lw?=
 =?utf-8?B?MzlIN2o3cVM3WVVKZjZCUmdWTW5oZk52T3F4bDdNWXhKU0VOWkVCSzNIR0NW?=
 =?utf-8?B?ZUFSWE84T0pCY1NqU2dTZkIyVFlVRTA0NVhqMWo3dHpFdHNoYzNsODRtQU1n?=
 =?utf-8?B?V2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c06a9b4e-1a51-41c6-0692-08dd0ebcde6d
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6138.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2024 08:24:11.8485 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YW1vB9G2sW7Y2xvnUqHMgJxrbHmUHjfua1LdkL891o8/uaNOfMYSswl/XO6kkVB3mpOPVubogZUs2JX3k7mLSCnHPQtZAhlLgfylnvLCVOE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6134
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

Ilia Levi <ilia.levi@intel.com> wrote on nie [2024-lis-10 22:39:13 +0200]:
> A new flow is added for devices that support MSI-X:
> - MSI-X vector 0 is used for GuC-to-host interrupt
> - MSI-X vector 1 (aka default MSI-X) is used for HW engines
> - Configure the HW engines to work with MSI-X
> - Program the LRC to use memirq infra (similar to VF)
> - CS_INT_VEC field added to the LRC
>

IMO you should split this patch into two separate patches:
the general configuration (init) of MSI-X and the addition of MSI-X support for HW engines
> Bspec: 60342, 72547
> 
> Signed-off-by: Ilia Levi <ilia.levi@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile              |   1 +
>  drivers/gpu/drm/xe/regs/xe_engine_regs.h |   3 +
>  drivers/gpu/drm/xe/regs/xe_lrc_layout.h  |   3 +
>  drivers/gpu/drm/xe/xe_device.c           |   4 +
>  drivers/gpu/drm/xe/xe_device.h           |   3 +-
>  drivers/gpu/drm/xe/xe_device_types.h     |  10 ++
>  drivers/gpu/drm/xe/xe_exec_queue.c       |   3 +-
>  drivers/gpu/drm/xe/xe_exec_queue_types.h |   2 +
>  drivers/gpu/drm/xe/xe_execlist.c         |   9 +-
>  drivers/gpu/drm/xe/xe_hw_engine.c        |   7 +-
>  drivers/gpu/drm/xe/xe_irq.c              | 116 ++++++++++++++------
>  drivers/gpu/drm/xe/xe_irq.h              |   1 +
>  drivers/gpu/drm/xe/xe_irq_msix.c         | 134 +++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_irq_msix.h         |  16 +++
>  drivers/gpu/drm/xe/xe_lrc.c              |  24 +++-
>  drivers/gpu/drm/xe/xe_lrc.h              |   2 +-
>  16 files changed, 293 insertions(+), 45 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/xe_irq_msix.c
>  create mode 100644 drivers/gpu/drm/xe/xe_irq_msix.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index a93e6fcc0ad9..2f1e1f17b677 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -72,6 +72,7 @@ xe-y += xe_bb.o \
>  	xe_hw_fence.o \
>  	xe_huc.o \
>  	xe_irq.o \
> +	xe_irq_msix.o \

I have my doubts that we need a separate file for MSI-X.
We already have xe_irq.c, and there is not much code for MSI-X.

I think of it this way: if we need a separate file for MSI-X then why not have a separate one
for MSI. And if xe_irq.c is for MSI then why don't we call it xe_irq_msi.c. But then what about
the common functions which are used by MSI and MSI-X.
And after such reasoning, I conclude that it would be just as well if the msi-x functions
were in the xe_irq.c file.

>  	xe_lrc.o \
>  	xe_migrate.o \
>  	xe_mmio.o \
> diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> index 7c78496e6213..d86219dedde2 100644
> --- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> @@ -83,6 +83,8 @@
>  #define RING_IMR(base)				XE_REG((base) + 0xa8)
>  #define RING_INT_STATUS_RPT_PTR(base)		XE_REG((base) + 0xac)
>  
> +#define CS_INT_VEC(base)			XE_REG((base) + 0x1b8)
> +
>  #define RING_EIR(base)				XE_REG((base) + 0xb0)
>  #define RING_EMR(base)				XE_REG((base) + 0xb4)
>  #define RING_ESR(base)				XE_REG((base) + 0xb8)
> @@ -138,6 +140,7 @@
>  
>  #define RING_MODE(base)				XE_REG((base) + 0x29c)
>  #define   GFX_DISABLE_LEGACY_MODE		REG_BIT(3)
> +#define   GFX_MSIX_INTERRUPT_ENABLE		REG_BIT(13)
>  
>  #define RING_TIMESTAMP(base)			XE_REG((base) + 0x358)
>  
> diff --git a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
> index 045dfd09db99..57944f90bbf6 100644
> --- a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
> +++ b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
> @@ -25,6 +25,9 @@
>  #define CTX_INT_SRC_REPORT_REG		(CTX_LRI_INT_REPORT_PTR + 3)
>  #define CTX_INT_SRC_REPORT_PTR		(CTX_LRI_INT_REPORT_PTR + 4)
>  
> +#define CTX_CS_INT_VEC_REG		0x5a
> +#define CTX_CS_INT_VEC_DATA		(CTX_CS_INT_VEC_REG + 1)
> +
>  #define INDIRECT_CTX_RING_HEAD		(0x02 + 1)
>  #define INDIRECT_CTX_RING_TAIL		(0x04 + 1)
>  #define INDIRECT_CTX_RING_START		(0x06 + 1)
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 0e2dd691bdae..eff7e51198d9 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -660,6 +660,10 @@ int xe_device_probe(struct xe_device *xe)
>  		xe_gt_mmio_init(gt);
>  	}
>  
> +	err = xe_irq_init(xe);
> +	if (err)
> +		return err;
> +
>  	for_each_tile(tile, xe, id) {
>  		if (IS_SRIOV_VF(xe)) {
>  			xe_guc_comm_init_early(&tile->primary_gt->uc.guc);
> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> index f1fbfe916867..812f24a34e6b 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -157,8 +157,7 @@ static inline bool xe_device_has_sriov(struct xe_device *xe)
>  

I have a problem with this name. In my opinion, the functions named xe_device_has_*
let us know if the device has any specific capability.
Mostly this is based on infromation of the gen number, or an attribute
from intel_device_info.
In the case of MSI-X, such information is provided to us from PCI subsystem.
I think I understand why you used here a flag that you set yourself, but with a function named
like this, the information about whether the device has msi-x or not should be available on early
driver probe stage before we call xe_device_probe.

If you were to call directly pci_msix_vec_count in this function, I
would be ok with that.
But if you want to call pci_msix_vec_count only once and cache this value where in xe_driver,
then in my opinion you should name this function differently, for example xe_device_uses_msix.


>  static inline bool xe_device_has_msix(struct xe_device *xe)
>  {
> -	/* TODO: change this when MSI-X support is fully integrated */
> -	return false;
> +	return xe->irq.msix.enabled;

I think this flag is unnecessary and certainly misnamed. This is because it implies that msi-x is
enabled, which is not true when you set it to true.

You already have the num_of_interrupts variable (BTW, the name nvec would be ok for them too)
Just do:
  static inline bool xe_device_uses_msix(struct xe_device *xe)
  {
        return xe->irq.msix.num_of_interrupts > 0;
  }


>  }
>  
>  static inline bool xe_device_has_memirq(struct xe_device *xe)
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index bccca63c8a48..159b0e25e2bb 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -346,6 +346,16 @@ struct xe_device {
>  
>  		/** @irq.enabled: interrupts enabled on this device */
>  		bool enabled;
> +
> +		/** @irq.msix: irq info for platforms that support MSI-X */
> +		struct {
> +			/** @irq.msix.enabled: MSI-X interrupts enabled on this device */
> +			bool enabled;
You don't need it

> +			/** @irq.msix.num_of_interrupts: number of MSI-X interrupts */
> +			u16 num_of_interrupts;
NIT: you can just name it nvec
> +			/** @irq.msix.default_msix: Default MSI-X vector */
> +			u16 default_msix;
do we need it ? will the default MSI-X vector change ? maybe some define is enough
> +		} msix;
>  	} irq;
>  
>  	/** @ttm: ttm device */
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index fd0f3b3c9101..fe3a10825245 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -68,6 +68,7 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
>  	q->gt = gt;
>  	q->class = hwe->class;
>  	q->width = width;
> +	q->msix = xe->irq.msix.default_msix;
>  	q->logical_mask = logical_mask;
>  	q->fence_irq = &gt->fence_irq[hwe->class];
>  	q->ring_ops = gt->ring_ops[hwe->class];
> @@ -117,7 +118,7 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q)
>  	}
>  
>  	for (i = 0; i < q->width; ++i) {
> -		q->lrc[i] = xe_lrc_create(q->hwe, q->vm, SZ_16K);
> +		q->lrc[i] = xe_lrc_create(q->hwe, q->vm, SZ_16K, q->msix);
>  		if (IS_ERR(q->lrc[i])) {
>  			err = PTR_ERR(q->lrc[i]);
>  			goto err_unlock;
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> index 1158b6062a6c..19fd66d59dd7 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> @@ -63,6 +63,8 @@ struct xe_exec_queue {
>  	char name[MAX_FENCE_NAME_LEN];
>  	/** @width: width (number BB submitted per exec) of this exec queue */
>  	u16 width;
> +	/** @msix: MSI-X vector (for platforms that support it) */
> +	u16 msix;

NIT: Maybe msix_vec, msix seems ambiguous to me

>  	/** @fence_irq: fence IRQ used to signal job completion */
>  	struct xe_hw_fence_irq *fence_irq;
>  
> diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
> index a8c416a48812..dcbc87a31ba3 100644
> --- a/drivers/gpu/drm/xe/xe_execlist.c
> +++ b/drivers/gpu/drm/xe/xe_execlist.c
> @@ -47,6 +47,7 @@ static void __start_lrc(struct xe_hw_engine *hwe, struct xe_lrc *lrc,
>  	struct xe_mmio *mmio = &gt->mmio;
>  	struct xe_device *xe = gt_to_xe(gt);
>  	u64 lrc_desc;
> +	u32 ring_mode = _MASKED_BIT_ENABLE(GFX_DISABLE_LEGACY_MODE);
>  
>  	lrc_desc = xe_lrc_descriptor(lrc);
>  
> @@ -80,8 +81,10 @@ static void __start_lrc(struct xe_hw_engine *hwe, struct xe_lrc *lrc,
>  	xe_mmio_write32(mmio, RING_HWS_PGA(hwe->mmio_base),
>  			xe_bo_ggtt_addr(hwe->hwsp));
>  	xe_mmio_read32(mmio, RING_HWS_PGA(hwe->mmio_base));
> -	xe_mmio_write32(mmio, RING_MODE(hwe->mmio_base),
> -			_MASKED_BIT_ENABLE(GFX_DISABLE_LEGACY_MODE));
> +
> +	if (xe_device_has_msix(gt_to_xe(hwe->gt)))
> +		ring_mode |= _MASKED_BIT_ENABLE(GFX_MSIX_INTERRUPT_ENABLE);
> +	xe_mmio_write32(mmio, RING_MODE(hwe->mmio_base), ring_mode);
>  
>  	xe_mmio_write32(mmio, RING_EXECLIST_SQ_CONTENTS_LO(hwe->mmio_base),
>  			lower_32_bits(lrc_desc));
> @@ -265,7 +268,7 @@ struct xe_execlist_port *xe_execlist_port_create(struct xe_device *xe,
>  
>  	port->hwe = hwe;
>  
> -	port->lrc = xe_lrc_create(hwe, NULL, SZ_16K);
> +	port->lrc = xe_lrc_create(hwe, NULL, SZ_16K, xe->irq.msix.default_msix);
>  	if (IS_ERR(port->lrc)) {
>  		err = PTR_ERR(port->lrc);
>  		goto err;
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index 1557acee3523..080506b2c4ad 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -324,6 +324,7 @@ void xe_hw_engine_enable_ring(struct xe_hw_engine *hwe)
>  {
>  	u32 ccs_mask =
>  		xe_hw_engine_mask_per_class(hwe->gt, XE_ENGINE_CLASS_COMPUTE);
> +	u32 ring_mode = _MASKED_BIT_ENABLE(GFX_DISABLE_LEGACY_MODE);
>  
>  	if (hwe->class == XE_ENGINE_CLASS_COMPUTE && ccs_mask)
>  		xe_mmio_write32(&hwe->gt->mmio, RCU_MODE,
> @@ -332,8 +333,10 @@ void xe_hw_engine_enable_ring(struct xe_hw_engine *hwe)
>  	xe_hw_engine_mmio_write32(hwe, RING_HWSTAM(0), ~0x0);
>  	xe_hw_engine_mmio_write32(hwe, RING_HWS_PGA(0),
>  				  xe_bo_ggtt_addr(hwe->hwsp));
> -	xe_hw_engine_mmio_write32(hwe, RING_MODE(0),
> -				  _MASKED_BIT_ENABLE(GFX_DISABLE_LEGACY_MODE));
> +
> +	if (xe_device_has_msix(gt_to_xe(hwe->gt)))
> +		ring_mode |= _MASKED_BIT_ENABLE(GFX_MSIX_INTERRUPT_ENABLE);
> +	xe_hw_engine_mmio_write32(hwe, RING_MODE(0), ring_mode);
>  	xe_hw_engine_mmio_write32(hwe, RING_MI_MODE(0),
>  				  _MASKED_BIT_DISABLE(STOP_RING));
>  	xe_hw_engine_mmio_read32(hwe, RING_MI_MODE(0));
> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> index b7995ebd54ab..bad446739b96 100644
> --- a/drivers/gpu/drm/xe/xe_irq.c
> +++ b/drivers/gpu/drm/xe/xe_irq.c
> @@ -4,6 +4,7 @@
>   */
>  
>  #include "xe_irq.h"
> +#include "xe_irq_msix.h"
>  
>  #include <linux/sched/clock.h>
>  
> @@ -577,8 +578,12 @@ static void xe_irq_reset(struct xe_device *xe)
>  	struct xe_tile *tile;
>  	u8 id;
>  
> -	if (IS_SRIOV_VF(xe))
> +	if (IS_SRIOV_VF(xe)) {
>  		return vf_irq_reset(xe);
> +	} else if (xe_device_uses_memirq(xe)) {

do we need an else if?
In my opinion, it is enough: 

if (IS_SRIOV_VF(xe)) 
      return vf_irq_reset(xe);

if (xe_device_uses_memirq(xe))
    for_each_tile(tile, xe, id)
        xe_memirq_reset(&tile->memirq);
> +		for_each_tile(tile, xe, id)
> +			xe_memirq_reset(&tile->memirq);
> +	}
>  
>  	for_each_tile(tile, xe, id) {
>  		if (GRAPHICS_VERx100(xe) >= 1210)
> @@ -619,8 +624,15 @@ static void vf_irq_postinstall(struct xe_device *xe)
>  
>  static void xe_irq_postinstall(struct xe_device *xe)
>  {
> -	if (IS_SRIOV_VF(xe))
> +	if (IS_SRIOV_VF(xe)) {
>  		return vf_irq_postinstall(xe);
> +	} else if (xe_device_uses_memirq(xe)) {

similar to above: we have return for VF case, else if is not needed

> +		struct xe_tile *tile;
> +		unsigned int id;
> +
> +		for_each_tile(tile, xe, id)
> +			xe_memirq_postinstall(&tile->memirq);
> +	}
>  
>  	xe_display_irq_postinstall(xe, xe_root_mmio_gt(xe));
>  
> @@ -668,61 +680,94 @@ static irq_handler_t xe_irq_handler(struct xe_device *xe)
>  		return xelp_irq_handler;
>  }
>  
> -static void irq_uninstall(void *arg)
> +static int xe_irq_msi_request(struct xe_device *xe)
> +{
> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> +	irq_handler_t irq_handler;
> +	int irq, err;
> +
> +	irq_handler = xe_irq_handler(xe);
> +	if (!irq_handler) {
> +		drm_err(&xe->drm, "No supported interrupt handler");
> +		return -EINVAL;
> +	}
> +
> +	irq = pci_irq_vector(pdev, 0);
> +	err = request_irq(irq, irq_handler, IRQF_SHARED, DRIVER_NAME, xe);
> +	if (err < 0) {
> +		drm_err(&xe->drm, "Failed to request MSI IRQ %d\n", err);
> +		return err;
> +	}
> +
> +	return 0;
> +}
> +
> +static void xe_irq_msi_free(struct xe_device *xe)
>  {
> -	struct xe_device *xe = arg;
>  	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>  	int irq;
>  
> +	irq = pci_irq_vector(pdev, 0);
> +	free_irq(irq, xe);
> +}
> +
> +static void irq_uninstall(void *arg)
> +{
> +	struct xe_device *xe = arg;
> +
>  	if (!xe->irq.enabled)
>  		return;
>  
>  	xe->irq.enabled = false;
>  	xe_irq_reset(xe);
>  
> -	irq = pci_irq_vector(pdev, 0);
> -	free_irq(irq, xe);
> +	if (xe_device_has_msix(xe))
> +		xe_irq_msix_free(xe);
> +	else
> +		xe_irq_msi_free(xe);
>  }
>  
> -int xe_irq_install(struct xe_device *xe)
> +int xe_irq_init(struct xe_device *xe)
>  {

Another function I have a problem with. The xe_irq_init by name is a common function for MSI/MSI-X,
but it looks like it is dedicated only for MSI-X, even though you have a separate xe_irq_msix_init.


IMO, you should move pci_msix_vec_count to the inside of xe_irq_msix_init.

int xe_irq_msix_init(struct xe_device *xe)
{
	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
	int nvec = pci_msix_vec_count(pdev);

	if (nvec == -EINVAL) {
		return 0;
	} else if (nvec < 0) {
		drm_err(&xe->drm, "Failed getting MSI-X vectors count: %pe\n", ERR_PTR(nvec));
		return nvec;
	}
	xe->irq.msix.num_of_interrupts = nvec;
	xe->irq.msix.default_msix = DEFAULT_MSIX;

	return nvec;
}

int xe_irq_init(struct xe_device *xe)
{
	return xe_irq_msix_init(xe);
}



>  	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> -	unsigned int irq_flags = PCI_IRQ_MSIX;
> -	irq_handler_t irq_handler;
> -	int err, irq, nvec;
> +	int nvec = pci_msix_vec_count(pdev);
>  
> -	irq_handler = xe_irq_handler(xe);
> -	if (!irq_handler) {
> -		drm_err(&xe->drm, "No supported interrupt handler");
> -		return -EINVAL;
> +	if (nvec > 0) {
> +		xe_irq_msix_init(xe, nvec);
> +		return 0;
>  	}
>  
> +	if (nvec == -EINVAL)
> +		return 0;  /* MSI */
> +
> +	drm_err(&xe->drm, "Failed getting MSI-X vectors count: %d\n", nvec);
> +	return nvec;
> +}
> +
> +int xe_irq_install(struct xe_device *xe)
> +{
> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> +	unsigned int irq_flags = PCI_IRQ_MSI;
> +	int nvec = 1;
> +	int err;
> +
>  	xe_irq_reset(xe);
>  
> -	nvec = pci_msix_vec_count(pdev);
> -	if (nvec <= 0) {
> -		if (nvec == -EINVAL) {
> -			/* MSIX capability is not supported in the device, using MSI */
> -			irq_flags = PCI_IRQ_MSI;
> -			nvec = 1;
> -		} else {
> -			drm_err(&xe->drm, "MSIX: Failed getting count\n");
> -			return nvec;
> -		}
> +	if (xe_device_has_msix(xe)) {
> +		nvec = xe->irq.msix.num_of_interrupts;
> +		irq_flags = PCI_IRQ_MSIX;
>  	}
>  
>  	err = pci_alloc_irq_vectors(pdev, nvec, nvec, irq_flags);
>  	if (err < 0) {
> -		drm_err(&xe->drm, "MSI/MSIX: Failed to enable support %d\n", err);
> +		drm_err(&xe->drm, "Failed to allocate IRQ vectors: %d\n", err);
>  		return err;
>  	}
>  
> -	irq = pci_irq_vector(pdev, 0);
> -	err = request_irq(irq, irq_handler, IRQF_SHARED, DRIVER_NAME, xe);
> -	if (err < 0) {
> -		drm_err(&xe->drm, "Failed to request MSI/MSIX IRQ %d\n", err);
> +	err = xe_device_has_msix(xe) ? xe_irq_msix_request(xe) :
> +				       xe_irq_msi_request(xe);
> +	if (err)
>  		return err;
> -	}
>  
>  	xe->irq.enabled = true;
>  
> @@ -735,7 +780,10 @@ int xe_irq_install(struct xe_device *xe)
>  	return 0;
>  
>  free_irq_handler:
> -	free_irq(irq, xe);
> +	if (xe_device_has_msix(xe))
> +		xe_irq_msix_free(xe);
> +	else
> +		xe_irq_msi_free(xe);
>  
>  	return err;
>  }
> @@ -748,7 +796,11 @@ void xe_irq_suspend(struct xe_device *xe)
>  	xe->irq.enabled = false; /* no new irqs */
>  	spin_unlock_irq(&xe->irq.lock);
>  
> -	synchronize_irq(irq); /* flush irqs */
> +	/* flush irqs */
> +	if (xe_device_has_msix(xe))
> +		xe_irq_msix_synchronize_irq(xe);
> +	else
> +		synchronize_irq(irq);

If you created xe_irq_msix_synchronize_irq make the corresponding one for MSI:
xe_irq_msi_synchronize_irq.

Actully it looks bad, especially since for msi-x you also use synchronize_irq inside.

>  	xe_irq_reset(xe); /* turn irqs off */
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_irq.h b/drivers/gpu/drm/xe/xe_irq.h
> index 067514e13675..abc13412260a 100644
> --- a/drivers/gpu/drm/xe/xe_irq.h
> +++ b/drivers/gpu/drm/xe/xe_irq.h
> @@ -10,6 +10,7 @@ struct xe_device;
>  struct xe_tile;
>  struct xe_gt;
>  
> +int xe_irq_init(struct xe_device *xe);
>  int xe_irq_install(struct xe_device *xe);
>  void xe_irq_suspend(struct xe_device *xe);
>  void xe_irq_resume(struct xe_device *xe);
> diff --git a/drivers/gpu/drm/xe/xe_irq_msix.c b/drivers/gpu/drm/xe/xe_irq_msix.c
> new file mode 100644
> index 000000000000..dac339ba5ed2
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_irq_msix.c
> @@ -0,0 +1,134 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#include "xe_irq_msix.h"
> +
> +#include "regs/xe_guc_regs.h"
> +
> +#include "xe_device.h"
> +#include "xe_drv.h"
> +#include "xe_guc.h"
> +#include "xe_memirq.h"
> +
> +enum xe_irq_msix_static {
> +	GUC2HOST_MSIX = 0,
> +	DEFAULT_MSIX,
> +	/* Must be last */
> +	NUM_OF_STATIC_MSIX,
> +};
> +
> +void xe_irq_msix_init(struct xe_device *xe, int nvec)
> +{
> +	xe->irq.msix.enabled = true;
> +	xe->irq.msix.num_of_interrupts = nvec;
> +	xe->irq.msix.default_msix = DEFAULT_MSIX;
> +}
> +
> +static irqreturn_t guc2host_irq_handler(int irq, void *arg)
> +{
> +	struct xe_device *xe = arg;
> +	struct xe_tile *tile;
> +	u8 id;
> +
> +	for_each_tile(tile, xe, id)
> +		xe_guc_irq_handler(&tile->primary_gt->uc.guc,
> +				   GUC_INTR_GUC2HOST);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static irqreturn_t xe_irq_msix_default_hwe_handler(int irq, void *arg)
> +{
> +	unsigned int tile_id, gt_id;
> +	struct xe_device *xe = arg;
> +	struct xe_memirq *memirq;
> +	struct xe_hw_engine *hwe;
> +	enum xe_hw_engine_id id;
> +	struct xe_tile *tile;
> +	struct xe_gt *gt;
> +
> +	for_each_tile(tile, xe, tile_id) {
> +		memirq = &tile->memirq;
> +		if (!memirq->bo)
> +			continue;
> +
> +		for_each_gt(gt, xe, gt_id) {
> +			if (gt->tile != tile)
> +				continue;
> +
> +			for_each_hw_engine(hwe, gt, id)
> +				xe_memirq_hwe_handler(memirq, hwe);
> +		}
> +	}
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int xe_irq_msix_request_irq(struct xe_device *xe, irq_handler_t handler,
> +				   const char *name, u16 msix)
> +{
> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> +	int ret, irq;
> +
> +	irq = pci_irq_vector(pdev, msix);
> +	if (irq < 0)
> +		return irq;
> +
> +	ret = request_irq(irq, handler, IRQF_SHARED, name, xe);
> +	if (ret < 0)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static void xe_irq_msix_free_irq(struct xe_device *xe, u16 msix)
> +{
> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> +	int irq;
> +
> +	irq = pci_irq_vector(pdev, msix);
> +	if (irq < 0) {
> +		drm_err(&xe->drm, "MSI-X %u can't be released, there is no matching IRQ\n", msix);
> +		return;
> +	}
> +
> +	free_irq(irq, xe);
> +}
> +
> +int xe_irq_msix_request(struct xe_device *xe)

maybe xe_irq_msix_request_irqs ?

> +{
> +	int err;
> +
> +	err = xe_irq_msix_request_irq(xe, guc2host_irq_handler,
> +				      DRIVER_NAME "-guc2host", GUC2HOST_MSIX);
> +	if (err) {
> +		drm_err(&xe->drm, "Failed to request MSI-X IRQ %d: %d\n", GUC2HOST_MSIX, err);
> +		return err;
> +	}
> +
> +	err = xe_irq_msix_request_irq(xe, xe_irq_msix_default_hwe_handler,
> +				      DRIVER_NAME "-default-msix", DEFAULT_MSIX);
> +	if (err) {
> +		drm_err(&xe->drm, "Failed to request MSI-X IRQ %d: %d\n", DEFAULT_MSIX, err);
> +		xe_irq_msix_free_irq(xe, GUC2HOST_MSIX);
> +		return err;
> +	}
> +
> +	return 0;
> +}
> +
> +void xe_irq_msix_free(struct xe_device *xe)
> +{
> +	xe_irq_msix_free_irq(xe, GUC2HOST_MSIX);
> +	xe_irq_msix_free_irq(xe, DEFAULT_MSIX);
> +}
> +
> +void xe_irq_msix_synchronize_irq(struct xe_device *xe)
> +{
> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> +
> +	synchronize_irq(pci_irq_vector(pdev, GUC2HOST_MSIX));
> +	synchronize_irq(pci_irq_vector(pdev, DEFAULT_MSIX));
> +}

For these two functions above, use for loop. You have defined
NUM_OF_STATIC_MSIX. Use it az limit in for loop.

Thanks,
Piotr

> diff --git a/drivers/gpu/drm/xe/xe_irq_msix.h b/drivers/gpu/drm/xe/xe_irq_msix.h
> new file mode 100644
> index 000000000000..9c36d11f05fc
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_irq_msix.h
> @@ -0,0 +1,16 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#ifndef _XE_IRQ_MSIX_H_
> +#define _XE_IRQ_MSIX_H_
> +
> +struct xe_device;
> +
> +void xe_irq_msix_init(struct xe_device *xe, int nvec);
> +void xe_irq_msix_free(struct xe_device *xe);
> +int xe_irq_msix_request(struct xe_device *xe);
> +void xe_irq_msix_synchronize_irq(struct xe_device *xe);
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index 4b65da77c6e0..ca27c3be3b8a 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -584,6 +584,7 @@ static void set_memory_based_intr(u32 *regs, struct xe_hw_engine *hwe)
>  {
>  	struct xe_memirq *memirq = &gt_to_tile(hwe->gt)->memirq;
>  	struct xe_device *xe = gt_to_xe(hwe->gt);
> +	u8 num_regs;
>  
>  	if (!xe_device_uses_memirq(xe))
>  		return;
> @@ -593,12 +594,18 @@ static void set_memory_based_intr(u32 *regs, struct xe_hw_engine *hwe)
>  	regs[CTX_INT_MASK_ENABLE_REG] = RING_IMR(0).addr;
>  	regs[CTX_INT_MASK_ENABLE_PTR] = xe_memirq_enable_ptr(memirq);
>  
> -	regs[CTX_LRI_INT_REPORT_PTR] = MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(2) |
> +	num_regs = xe_device_has_msix(xe) ? 3 : 2;
> +	regs[CTX_LRI_INT_REPORT_PTR] = MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(num_regs) |
>  				       MI_LRI_LRM_CS_MMIO | MI_LRI_FORCE_POSTED;
>  	regs[CTX_INT_STATUS_REPORT_REG] = RING_INT_STATUS_RPT_PTR(0).addr;
>  	regs[CTX_INT_STATUS_REPORT_PTR] = xe_memirq_status_ptr(memirq, hwe);
>  	regs[CTX_INT_SRC_REPORT_REG] = RING_INT_SRC_RPT_PTR(0).addr;
>  	regs[CTX_INT_SRC_REPORT_PTR] = xe_memirq_source_ptr(memirq, hwe);
> +
> +	if (xe_device_has_msix(xe)) {
> +		regs[CTX_CS_INT_VEC_REG] = CS_INT_VEC(0).addr;
> +		/* CTX_CS_INT_VEC_DATA will be set in xe_lrc_init */
> +	}
>  }
>  
>  static int lrc_ring_mi_mode(struct xe_hw_engine *hwe)
> @@ -876,7 +883,7 @@ static void xe_lrc_finish(struct xe_lrc *lrc)
>  #define PVC_CTX_ACC_CTR_THOLD	(0x2a + 1)
>  
>  static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
> -		       struct xe_vm *vm, u32 ring_size)
> +		       struct xe_vm *vm, u32 ring_size, u16 msix)
>  {
>  	struct xe_gt *gt = hwe->gt;
>  	struct xe_tile *tile = gt_to_tile(gt);
> @@ -945,6 +952,14 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>  			xe_drm_client_add_bo(vm->xef->client, lrc->bo);
>  	}
>  
> +	if (xe_device_has_msix(xe)) {
> +		xe_lrc_write_ctx_reg(lrc, CTX_INT_STATUS_REPORT_PTR,
> +				     xe_memirq_status_ptr(&tile->memirq, hwe));
> +		xe_lrc_write_ctx_reg(lrc, CTX_INT_SRC_REPORT_PTR,
> +				     xe_memirq_source_ptr(&tile->memirq, hwe));
> +		xe_lrc_write_ctx_reg(lrc, CTX_CS_INT_VEC_DATA, msix << 16 | msix);
> +	}
> +
>  	if (xe_gt_has_indirect_ring_state(gt)) {
>  		xe_lrc_write_ctx_reg(lrc, CTX_INDIRECT_RING_STATE,
>  				     __xe_lrc_indirect_ring_ggtt_addr(lrc));
> @@ -1005,6 +1020,7 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>   * @hwe: Hardware Engine
>   * @vm: The VM (address space)
>   * @ring_size: LRC ring size
> + * @msix: MSI-X interrupt vector (for platforms that support it)
>   *
>   * Allocate and initialize the Logical Ring Context (LRC).
>   *
> @@ -1012,7 +1028,7 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>   * upon failure.
>   */
>  struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
> -			     u32 ring_size)
> +			     u32 ring_size, u16 msix)
>  {
>  	struct xe_lrc *lrc;
>  	int err;
> @@ -1021,7 +1037,7 @@ struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
>  	if (!lrc)
>  		return ERR_PTR(-ENOMEM);
>  
> -	err = xe_lrc_init(lrc, hwe, vm, ring_size);
> +	err = xe_lrc_init(lrc, hwe, vm, ring_size, msix);
>  	if (err) {
>  		kfree(lrc);
>  		return ERR_PTR(err);
> diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
> index 40d8f6906d3e..6d1c2f6c0559 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.h
> +++ b/drivers/gpu/drm/xe/xe_lrc.h
> @@ -40,7 +40,7 @@ struct xe_lrc_snapshot {
>  #define LRC_PPHWSP_SCRATCH_ADDR (0x34 * 4)
>  
>  struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
> -			     u32 ring_size);
> +			     u32 ring_size, u16 msix);
>  void xe_lrc_destroy(struct kref *ref);
>  
>  /**
> -- 
> 2.43.2
> 

-- 

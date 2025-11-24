Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CF54CFD317
	for <intel-xe@archiver.kernel.org>; Mon, 24 Nov 2025 10:47:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D29BD10E201;
	Mon, 24 Nov 2025 10:47:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c36oHYiT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A0EA10E201
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Nov 2025 10:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763981257; x=1795517257;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=G15mECxty7ahePzP7KcCHQ55YdCGoj1OEMn1oqCuSkU=;
 b=c36oHYiTUhgkskbOTibrmVHXoupbC1w0zmS5BfcrHzbcZEnWXrL6g7r8
 u5AXXlQsfUD599Bf1LlYZgsWpnBtF2+3DJfr+AdbFerXnK5Ag2DuiuZYG
 AfAB01SNQJARuqxXb849/YgqN4wg1LZNs2Pui6Kt0rXT5IEGNT1q/HKmX
 Pkoht5V4rXFUe++dC2c0+1xql6YY4TUpUliewgABevb+XrjtL6qs9nyyD
 W1nY6/uEp2y6I3z0xVdB+7NbsG2gJvJGWj61Wwi+R4hn7XesFlQKraH6d
 sUDkW81Y0PccPsbvhDTz5kUw/4PoVi9YWdtltJisLcvVFxleU3URU0Qf1 A==;
X-CSE-ConnectionGUID: 2+MwkFGdThOcml2LLcU1nA==
X-CSE-MsgGUID: T2pIZFOBTH2+HYqHB6eDlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11622"; a="77340104"
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; d="scan'208";a="77340104"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2025 02:47:37 -0800
X-CSE-ConnectionGUID: mE2lneR5Rh2x9bD1Za5tyA==
X-CSE-MsgGUID: lt0C/aemR5+V3c/7STo/MA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; d="scan'208";a="222957211"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2025 02:47:36 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 24 Nov 2025 02:47:35 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 24 Nov 2025 02:47:35 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.1) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 24 Nov 2025 02:47:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kEHb+ArOnj3hEYeVEEk284++q0R6nTxFopGCEDLXQgc3j6KhMvMpTU5vmRYA/k4I6eARj7RCfOKkienUo0jdFLiEJjFMv3sp7b/rxPrkLXS7T/Rqa1imZmeGpdxdfS1mcyJYauhV6iK9CtXYX8+M5Qw9SGhKbIl3euZtbJeRNsmkFWSnOclhrYzD/nelSMxYLsxBWkZzGpnuDGEhQiFKiwZt+nJDdCZFwjHdzrvraVf/rSSvwLb9PARBfIv9NU31LsY8NeTtjTFNxy3e1Lcyed9TNWOVctrMUQRBenmapMzaEZ9upAeAR8Ls/2t8+fUwNvKf6XyV/hiWuxNDqx8hNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JVAKb1ixJ/iNmqi9HYDHjcia+Vcti2QdCFpUOVIfuD8=;
 b=P941zRlurylbPa+V6OpRTR6sCAesZO2P167KnAdz2dbGBaqLezhJe2y6JHyWL6lTwHOYrnno/L+19ablEPqDLpLTyys8gpjZqnVd3s+NAEagPrV0JSj1FVIZAGMuqR0Hj1rwQ3zEhP7JPL2H9nuTDZKy8OclZIezQED8UgprpaFMOfgC/WtOZZ8LKUCPTNXRBnRakYH0Iq1cXQn/G0u7GgkDSUjegvB5/TnmbPQUi5xRjQKaG6bhbbdzH7Leuon+MXKlDArU+l09q/t6i3f++zhCdi/JjxEkTO9KW9uKurBbZ1r8OwwsVAStl5eJW9hr+Lrtdnj96LLoWGU+XLUUxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by MN2PR11MB4662.namprd11.prod.outlook.com (2603:10b6:208:263::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Mon, 24 Nov
 2025 10:47:33 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.9343.016; Mon, 24 Nov 2025
 10:47:33 +0000
Date: Mon, 24 Nov 2025 11:47:29 +0100
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Lukasz Laguna <lukasz.laguna@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <michal.wajdeczko@intel.com>
Subject: Re: [PATCH v2 2/4] drm/xe/pf: Configure LMTT in MERT
Message-ID: <20251124104729.moij3komoygwvfam@intel.com>
References: <20251031080501.844-1-lukasz.laguna@intel.com>
 <20251031080501.844-3-lukasz.laguna@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251031080501.844-3-lukasz.laguna@intel.com>
X-ClientProxiedBy: VI1PR07CA0312.eurprd07.prod.outlook.com
 (2603:10a6:800:130::40) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|MN2PR11MB4662:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bed290a-0fdc-4d8c-e54b-08de2b46df81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RDREQjIwSnlTcWtteVF0b0JIYzdRampSNWo2THZQRklMWkFZTDhHUHQxaGlP?=
 =?utf-8?B?dTFkN1hSeG1IYzlKdklGejVub21BbTlDNGpZNnN2YnRiak03MTBkNkNpanND?=
 =?utf-8?B?Z0FLTnFqOWdLRy9xTk53ZkY4MVFaMTRENS9FNHl3dlVVbnJRUG5CVEp3S2ZO?=
 =?utf-8?B?ajNLNi9PMFVvZW5Fblc1M2RZWlhHU1pLV1JpNGVLQWFCWnFpOXo0WDV3T0VB?=
 =?utf-8?B?WEhwK0NjVGl4N0pOZFMrVW1vc284Z25NbG5OenhWaEpma1RTR0tnNnFaVEtD?=
 =?utf-8?B?Vzl3TmE3LzdISnBFa1RGLzBjaE5CTURIc3NseG92TGgwekpwV1dXamI1dUV6?=
 =?utf-8?B?VTBzNWp2anA0YnFJOTBRVzhLRXN5a2dmNk1rOGZlbGF6YzgxSVV5R1BrMnls?=
 =?utf-8?B?S0dRZTkyZGwvZTRDZTAxOEVMbFl0Q0JZZHU1RGNLRDRXd1N4ZElFVHRzSTBU?=
 =?utf-8?B?Um9EbFV0NUxrek1NYURPZVZzbFRpU1l0ZUlnMTRPR0FVQXl0cDVyOEFZWFVh?=
 =?utf-8?B?MHozN3prWERzckdFSmZuVE1lSGk5NmJsVEptVWhwNmNvZDREVjlMZmorZDI0?=
 =?utf-8?B?bDlRNWFyQk9pSXJzOENNQ1JZR1RTS2U5S28xOVJwaU1VbGFCSlFvVXhhcnN1?=
 =?utf-8?B?dzJRUlJCL0ptZjV5YVc3RmJJU1lsVjl1TDkwTERrWXRWTWVrdnpnVjBscHpm?=
 =?utf-8?B?aXZINi84OU0wWHlqa0Qrd3ZqQ283YnZYMkluaDk5eDNIWXFzOFVjTlM4aTFH?=
 =?utf-8?B?KytzTFVjTG83TVpEQ2hZcWh6L1RTWXVjYnc2VEYzckNIVlVxcmE0Y0lwcUpH?=
 =?utf-8?B?QWI1bUx0dnQxZHkzRVlYUVJ2NzZOYW5oZzdvOGdOYjh4NUpJOXdlNjJqUGhs?=
 =?utf-8?B?S1dzcEswT3ZmUGw5czJacE9IUnY3Q0xEdzZkOGoyNFhFUmQxSUdBWXducU1u?=
 =?utf-8?B?MENIV2dJWUpDb2VWNWRpNlduTXE5L1U2QUlGRVFYUElBZFptRW1EdzlaZ1lL?=
 =?utf-8?B?N3c3M2lyd29nV1o3cmh3WFlNSjYxQUhkQ1pIRGJkNjdoMVcvS3laeUUvSlJ3?=
 =?utf-8?B?eUtZc1VkSzhUTTRYVW1kREJ1eWZ2T21BZWx0VFRFVEQrOStSbTFVbGZYK0xF?=
 =?utf-8?B?MHpSdDEvaVdtbXRQWlNEeXEyWTQxUWYvWEFtQ0lKRFVFeWwxQ1R2Q3RkcEh5?=
 =?utf-8?B?QTk1T3dCaHoyR3V1eXRUU0gvcFhTZlZWVTkyYlIrMDkxVkJVOWJwWDlyNWhC?=
 =?utf-8?B?dzc4blJNV1loc2xpZTZBTHhaNGhTYmpzNE5QQWVIVjBFTU0wS3JaeHk3ZDRo?=
 =?utf-8?B?eWRiNWYwUVl6aW9iUlFxMGVJeFFqbGc1aEkzWjJOT3NtaFpaRVZ1cXM2eFl6?=
 =?utf-8?B?Rnd2bGswMk5LSDU5QzZKOGRYc2k2dVBjTnNyUjhGOXAxQXR2Y0xTMUkrV3Za?=
 =?utf-8?B?RnZGNlI1RnlKN1NUWWxZb2VnZm1mUnNYYXYvcThMQVJNQ0pISXdKYTJmRXVV?=
 =?utf-8?B?OU1zYkpNb2xueVpkYjNtTHhlby9TNjZqdU8vK0tYeWRqU3RtTXRvZHpHc25q?=
 =?utf-8?B?dGhweFg5K3J0UEpsWnh0S3R5VW1XdDhzcGY2M1BWNTNhM3dYZ2pKQ1EzNklm?=
 =?utf-8?B?MW9tY1dRcXZBMXgwVGx4K0pLRFRuTlNHUHhPN0w0NDJabTNUdXJrbVUxRzY1?=
 =?utf-8?B?U1hrYTZRcHNRM2lkYjJERmdDMG9DR0xEdkZXVXhLbnlNZEhmNzhhOThYUGpD?=
 =?utf-8?B?SE0xVHkySjRnOXVVRER2WitSZ1p6WDZrTFg3SEJwWE9SMjdKUWMwbFhpUDBY?=
 =?utf-8?B?YmdxdlhkTGIwem0xR0ptS2RGOXVPVm8zbXhlb25HYkJqZlFudVNsSVZxNDdZ?=
 =?utf-8?B?KzdpWmM0eXFsdUhTejlFa045RWswc2xYd2dyaDFpSmMxU244dUVwNWVFTGZS?=
 =?utf-8?Q?Lh3mO6Yh5eihfdHeigA1eBYCcja3PD+G?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZnN2T2srcXhxcys3a0lMZHJRRU15WDF4dXJKQmpDMGdUVDYvb1JZTmpwYmgw?=
 =?utf-8?B?STl3K3BxajZ5WEkvWHpzMWZQakpKZzczQllIUW4rYzlKTzFQNDd4cnNZejBv?=
 =?utf-8?B?ektFMk1JS3BFTTZtK01yelV2eWI1R1E1SHlFbkRlNTJEbXd5MXlWdTZTaE5s?=
 =?utf-8?B?NXRKLzY2Q1hhNkhFdGZ4YTVHWFhoMzJPK0pKcEhUT2JuNUtzQ1JpL3NZMFhZ?=
 =?utf-8?B?QzQ3WSs2VUp3cGFUWjA4VC9mdXBCNHR2TmFsdGhXRkZNRnVhL2tVeTU1ZDMw?=
 =?utf-8?B?OWhRQW1EdjdrZ1BaYUMvb0pvK1lTUkNjMm1qdEMwZTNlWDV3L3Y0NnVwUU83?=
 =?utf-8?B?U3BNaTZkaWhYd3N4S1I2cTdaRmx5VWNSR20wR0t1SHZERDRCZ3RFa3Zzb1Ft?=
 =?utf-8?B?QjJ1Q0syWGJtZUNBOVV2K21vaEdsQjVHeE5nUkhBTjY3QzFwaXBLS2J1SS9h?=
 =?utf-8?B?NkZHQXI2b3lGNmYwT3R3MGFKL2IzNlpFemEycmFCZnROdlJzTm5HZUpBaHBq?=
 =?utf-8?B?Q3BDeExDMlJmOEtJalZGZ3lPaTVYc1JWbzlsM2VERHMxN2JnMEVGVlBuRUhk?=
 =?utf-8?B?K2w2cVpPV2cxLzVVeTVSdmQ5K205RHYxbVJxS2U3akFQS21JUjJPZzhFZTJq?=
 =?utf-8?B?dDdocE5kR2FFcVZXbGZ5R0ZZM0RDNFE0bTQ2a1dIYnU2dzRDU00zb0VONGF1?=
 =?utf-8?B?V0dEZHpGeDhpL2tacmFyRHZVSTVMN0MwVXR2TGtJcjl3YjBsdkNHaTRpUFNZ?=
 =?utf-8?B?RzlxU3AwblJYZEd5NkgvQzJ5T09Mam9vdFlRS2hFMy9qeThJZGpKTDdsblRT?=
 =?utf-8?B?WXU2ZlV5dWpudHYvZDhDdGdMRi93YSsxbjJuMjJmMGNFTElqMUNJUFRhNUJa?=
 =?utf-8?B?YVhxZ2t1cGxRRG9tQjZCQjh6RzE1VE0yTUVwRkg0VFdDMGlheHZIUDVzbXN4?=
 =?utf-8?B?NEV0ak5GbFZSN01oUFY0dVBGeXFXclg5SktNc0YvTEhOQ0Fhb3lqN2RjVjAw?=
 =?utf-8?B?VnR4UlJKc2FFQnF4TEQ5cWV6djhXbTMrRjJKR0RhVk9mMzhvYll2N0tnaTJt?=
 =?utf-8?B?N29sLzJNSVJNdlVlUGRPMGoxUmNKQUJsWWJhS3hNVXR2UnlFeVk1VUw3ZFNT?=
 =?utf-8?B?SmZ4cEU2UmJtQjJYdnQ4R3RjR3dhMnZaendKZ2FjNkYzbHJ6WGpVUEoyS2l3?=
 =?utf-8?B?ZzBqNExkL2hRUC9VbEttTEJucHhQcFY1UisyanNLK0FYSzhlZlM5YlByc1pL?=
 =?utf-8?B?eVdGaDdpaG90VFhXYUg0NVE5N1I0OVVObmNiM3ZHQlRJamtyaW5adWQ4dDNx?=
 =?utf-8?B?ZEpsVUlGV0RFaUkrRWpyVlRtRXgwN1FScjVzU2hrRHdmejgvcmNDYW5zTERt?=
 =?utf-8?B?clpkbzBVamRnM2c3RWhYZHIxejZnVnhscDVhSXVxYU5LWWRCVVdyUGpDUEhr?=
 =?utf-8?B?cUROd0RBaEpYdjlVNE5aSUxMSGk4blhwa0l6aTF6a0tRYkNjdVVtMlpvdzVE?=
 =?utf-8?B?VnhCS2Y3cjFPOVVsaGZnUEkrNkpxOUZ3OEpzTS81UDhZZ0dsVDRsT25MNGRL?=
 =?utf-8?B?Q1g0am5KYlE1OGozQ0twUmM0aTlxdXk4WUV0OUZoRjY1dGt6WmJsdXlNSmYz?=
 =?utf-8?B?eHJjMDUyM0haeGhqNGdZM2hvWE0ycUNZR0E1TUJWMkNSZjVSdytDeFZKQjdB?=
 =?utf-8?B?YmppdUEyY3pDcHZNMXQ1azBzMlIwaG1ZczFuZU8xVWFqOW40bHowVVBNcjkx?=
 =?utf-8?B?aGNhTktYSStRSllwQUZscnQvVldwMi9QT0JSTzZYcGdCM2N1NjY3RW9rbWs3?=
 =?utf-8?B?VjFubHhoSTZheGdOTkR5ZEx0REgzZWgvZEMyQzliWU5QdDZQR3p3M3pVT0Yw?=
 =?utf-8?B?cGROaFNYdERNa1M5ci9oYkJiVlJibERXRkt0dUdmOFhGZ2pGVXVEQjRYZ0h6?=
 =?utf-8?B?d2V4azIwZUJwRjhvSVExcHczZ1RnSjA5MzFua3kvak1OTXRTV0gvc2xVTUs0?=
 =?utf-8?B?YVh2ZG5Qd05Zd0hEUnJKS0Z2clFNSjM1NVJ5V0xPalAyT0hldWVwZzJrWFhY?=
 =?utf-8?B?dXRFaUhqTHNCSTRYc2ttWTdxaVZaV1ZkT1ZCV3h1MjdRejRKemFZTG1EMHNS?=
 =?utf-8?B?V0xEdzVueENwd0hWZzN6YjhOb3Jrd2dhSkZhdzhsOFR6WWJ4OVJHYUJlSnZM?=
 =?utf-8?B?Nmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bed290a-0fdc-4d8c-e54b-08de2b46df81
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2025 10:47:33.2295 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3xGZ9U7AtfL1QtTnpE/0ES7DG2DkNYPKRudu8dT6JZyG81tLGM5nxrq8HmZSyEph9hFxYZJDnRx2k+3RGL02t+NvNi1/SiPDxPBlrzerTG0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4662
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

Lukasz Laguna <lukasz.laguna@intel.com> wrote on pią [2025-paź-31 09:04:59 +0100]:
> On platforms with standalone MERT, the PF driver needs to program LMTT
> in MERT's LMEM_CFG register.
> 
> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_mert_regs.h | 13 +++++++++++++
>  drivers/gpu/drm/xe/xe_lmtt.c           | 10 +++++++++-
>  2 files changed, 22 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/xe/regs/xe_mert_regs.h
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_mert_regs.h b/drivers/gpu/drm/xe/regs/xe_mert_regs.h
> new file mode 100644
> index 000000000000..5b7c15e08747
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/regs/xe_mert_regs.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef _XE_MERT_REGS_H_
> +#define _XE_MERT_REGS_H_
> +
> +#include "regs/xe_reg_defs.h"
> +
> +#define MERT_LMEM_CFG				XE_REG(0x1448b0)
> +
> +#endif /* _XE_MERT_REGS_H_ */
> diff --git a/drivers/gpu/drm/xe/xe_lmtt.c b/drivers/gpu/drm/xe/xe_lmtt.c
> index 4dc1de482eee..f50c5a4b9edf 100644
> --- a/drivers/gpu/drm/xe/xe_lmtt.c
> +++ b/drivers/gpu/drm/xe/xe_lmtt.c
> @@ -8,6 +8,7 @@
>  #include <drm/drm_managed.h>
>  
>  #include "regs/xe_gt_regs.h"
> +#include "regs/xe_mert_regs.h"
>  
>  #include "xe_assert.h"
>  #include "xe_bo.h"
> @@ -17,6 +18,7 @@
>  #include "xe_mmio.h"
>  #include "xe_res_cursor.h"
>  #include "xe_sriov.h"
> +#include "xe_tile.h"
>  #include "xe_tile_sriov_printk.h"
>  
>  /**
> @@ -196,16 +198,22 @@ static void lmtt_setup_dir_ptr(struct xe_lmtt *lmtt)
>  	struct xe_device *xe = tile_to_xe(tile);
>  	dma_addr_t offset = xe_bo_main_addr(lmtt->pd->bo, XE_PAGE_SIZE);
>  	struct xe_gt *gt;
> +	u32 config;
>  	u8 id;
>  
>  	lmtt_debug(lmtt, "DIR offset %pad\n", &offset);
>  	lmtt_assert(lmtt, xe_bo_is_vram(lmtt->pd->bo));
>  	lmtt_assert(lmtt, IS_ALIGNED(offset, SZ_64K));
>  
> +	config = LMEM_EN | REG_FIELD_PREP(LMTT_DIR_PTR, offset / SZ_64K);
> +
>  	for_each_gt_on_tile(gt, tile, id)
>  		xe_mmio_write32(&gt->mmio,
>  				GRAPHICS_VER(xe) >= 20 ? XE2_LMEM_CFG : LMEM_CFG,
> -				LMEM_EN | REG_FIELD_PREP(LMTT_DIR_PTR, offset / SZ_64K));
> +				config);
> +
> +	if (xe_device_has_mert(xe) && xe_tile_is_root(tile))
> +		xe_mmio_write32(&tile->mmio, MERT_LMEM_CFG, config);
>  }

LGTM:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>


>  
>  /**
> -- 
> 2.40.0
> 

-- 

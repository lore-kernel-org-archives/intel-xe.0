Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22DBECAC58E
	for <intel-xe@archiver.kernel.org>; Thu, 11 Sep 2025 14:18:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D79A110EB44;
	Thu, 11 Sep 2025 14:18:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="av3t40SP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76F6F10E396
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Sep 2025 14:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757600300; x=1789136300;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=ypsa0w+i/KjkUsqK0jn+dcdpq3pwgTJfvu51YEqUb5o=;
 b=av3t40SPwFn5vJypwu8YIjvBTTuXlD9pb+WvtHe7Ch6qGylB9cA0tGYy
 a5ipR5ysSsl2VXE5ZDek7c1tpM5ucyLVmHAbVqZxO4NRLjxvRaLAcGE5A
 C3uj3ktMjGt+uRP2hbQlKnIPyT0JzxFAU5IgNhM2j7mQKyPqfK1wGnniO
 GvcXYU1uT2I+HvVxiOuI6aeqxPtuRe4PrLlPCLQbVEWpmtUout3WAh8/L
 OmzsUN0C9bvGRt6PkkwUtibJxR70VuVEkxFnPK0g8oN/bdIPL9Wki1SPc
 Qy00c7vNzbpiUcHu7xOosyxFV4a4C/Ua/1sHEQDIv/MGklZhlrbrA910W g==;
X-CSE-ConnectionGUID: 4aZd5lAcQnSWhrXD+jYxHw==
X-CSE-MsgGUID: vkLXlFtFTTiLQECn5WzX2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="63566782"
X-IronPort-AV: E=Sophos;i="6.18,257,1751266800"; d="scan'208";a="63566782"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2025 07:18:19 -0700
X-CSE-ConnectionGUID: R1bEyOK5S3ivCNxDKKPuCA==
X-CSE-MsgGUID: LXcQF9ErT6+1wO+gi4dDvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,257,1751266800"; d="scan'208";a="178898287"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2025 07:18:18 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 11 Sep 2025 07:18:17 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 11 Sep 2025 07:18:17 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.60)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 11 Sep 2025 07:18:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FBhpV2nOYObyR48txI/v6DBM5A+2VHRYWMWyMj1+PAO0hrTlsN53UdH8n2QsoArV3DhWNNJgIp9LIo0colaB7J0yqaVR9dffGzlQns3GlR6bk8t6vP71Nk4bhGcbpbkZ0CxO64+krSxCSXwUe+LI7xJsGlJpJY0tLaO/k3QN7gi3cQRu953LqpbOqW2eKwitykDiSVsUR0MbfcHlvIXxIJcHDjx8VIQrSZ5MT9hyfeKEwxHK72N6JMh9GMttUOApqO3nVqXP3kZvJPy1MKV8QF3UYpgqY2EvnMfvo8xiOfPABSoDpeifk9soCIe/cxDNZQhFccEsWG3a+k47L9dISg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DY48BX0MUAB6akm17V65LFrt7NpU9WL3vt3zeRilCOo=;
 b=K+CScWNqil/QikloWX7v2zWI6mFQGRvngK0CUP7bqVwRGJVlRl57fRHzpNRmAt9m2xTR+SEe5+zySzrysKhmsvHr/xA82ntI0JVPysqDUO4Agyo5bsfQ3BnBRoPJ8F7s8MEhA2Yc4HARHewn05QSw5ef4Q+im9CD3sANLLF5/nH36I6j13BZLBSnb719V92Rt2d+9wXFWjLyxpUSPBwWlNMvD1EalVAMv6DjCGTRLqOorqKkGykKr92rq1xa4JdDJYzYLXQqLHkEIm/Gj1ffK4rNo6fUF7uHfCxxg1FChrYs+MGB3P1f+hai+kTlBNS1nA4odxsTy4mn5sSbtoqc3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by CO1PR11MB4900.namprd11.prod.outlook.com (2603:10b6:303:9e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Thu, 11 Sep
 2025 14:18:14 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%5]) with mapi id 15.20.9094.021; Thu, 11 Sep 2025
 14:18:14 +0000
Message-ID: <54fd2212-3cac-4870-88c0-b284437c2318@intel.com>
Date: Thu, 11 Sep 2025 16:18:10 +0200
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBYZS5DSS5GdWxsOiBmYWlsdXJlIGZvciBkcm0veGUvcGY6?=
 =?UTF-8?Q?_Drop_rounddown=5Fpow=5Fof=5Ftwo_fair_LMEM_limitation?=
To: <intel-xe@lists.freedesktop.org>
References: <20250910222439.32869-1-michal.wajdeczko@intel.com>
 <175757371917.324297.8063724335448539963@1538d3639d33>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <175757371917.324297.8063724335448539963@1538d3639d33>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P190CA0009.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:802:2b::22) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|CO1PR11MB4900:EE_
X-MS-Office365-Filtering-Correlation-Id: d3a81083-7f50-445e-b451-08ddf13e0b90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|376014|366016|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VlNSd1VEdzUvZG42K1RnZm1aRStDclhEZm9mMjRMZnM4TUhGR3hubTVxV0Fl?=
 =?utf-8?B?cWVtZHV2MWhLaitpWmZDbDRqZ244a1N6VTh6VjNLcGl6NjFxSFhEdERiZjVE?=
 =?utf-8?B?VlJ3UmhMMmIxSnRvZzF6eFhwSnBXTWMxNXFmdUZsVkgzWi9INnU3aXcyZGp6?=
 =?utf-8?B?U1FhRUgvN0J3RTErN1pKYjE3WkRvZmw1K05WR05iQUV6SHAwVmNJUTdQN1F4?=
 =?utf-8?B?VHNJR1VYZUp4dmxQNnI2ZTBHZlIyUENWTXR0WTlUVmRPM0tRcGt0dEhGL2Y2?=
 =?utf-8?B?MkhtbEFtWm9NeTRya0w4dU4zeFRmYzFwN2FvaWFGR05zdW82eDJoWlhlemUy?=
 =?utf-8?B?TWIxVlhubEp4UGR4Y2VEY1RIOW9RQmQ2aXNyblViTHVrZFZXVE0rTDhuM0Y4?=
 =?utf-8?B?Q1krbjJ4MzhaMmZsQSswWlE5bCt4eHpDZTVDSU96Rm44UDhHZmNaUytmWS9p?=
 =?utf-8?B?cmJrQ1Z0cGJWRDZsWFhSVExOdUl5eWZHVzU5NkpxczNFS25rbkFuZHJMVmRW?=
 =?utf-8?B?dFNQRWpxNjBObU9vSk0wamVMMXpBT3A3QllvNmFPUzRkT1JSVUhrT3BEdjJw?=
 =?utf-8?B?S011bUFoNnVtMGY2MVIzbnpyMHFmUFNXL09ZYjU5TjE3ejFxZHZRQW5lMjh5?=
 =?utf-8?B?bVIydHFZODZuaVZmdERDZjJXOVlYdmMzZXpsUlRCZmtNUjJzbko3UFhJSllt?=
 =?utf-8?B?VzFicUxuSlNqOHdYZlFUL2hpQ3ZVYThKOTRVdE9NQWFtU3NkU1lUa09pVU4v?=
 =?utf-8?B?SGhMbm9zOWNZQ1lHQ2RsUzVZN2wxNFNBeXZacW1OUk1Kc3U5aFp6MThyTzZq?=
 =?utf-8?B?eFMrOGptcE15Rm1sQVMrNmFpTDdvbTFDRDVUb2xHN1VYalp1eEc1b3ZmSXpw?=
 =?utf-8?B?Y2xDNWt6aWRVblBualhVeTRjZUYxVi9iV2R3ZHIyQ21jVUZwdW9mRlBpTWpT?=
 =?utf-8?B?RUlQYkpuYXhJOEV4Yisya25kSnJ3UDMzeVlJZEVZTFV3U1IwNDBpWnplNS9J?=
 =?utf-8?B?S1VuTlV1emwvUHI1TFFKUWpwSkxEVU13Vmk5bWRQU1ozZTF1bWo3S0wzSndK?=
 =?utf-8?B?Zzd4U2tTZWRTUStjajAySG83anpnZU5RWVNhOFVFTnN3d0xBSkU3bGhWVDQr?=
 =?utf-8?B?S0dwbXlhL0laUE4zNElsTElCSDF0TGx5ODdVR05rakx3QW1nNXRzU2xJWFNj?=
 =?utf-8?B?VG8vaGREak8zZUMvRmpJdExzZGZIQjRTR0w3MDZGNDdyUDg3MXpjS0Q5a2l5?=
 =?utf-8?B?U2R0dXFqblM5N3N1TmVLbVBkUXZFRmFvbmQ4eUNXc3NaZ3NtVWU4bmV5TVlH?=
 =?utf-8?B?a0QvOXZDeXIvZ3cwMHMvM0lqem12QW1hSWt5Qm1qQmt5N2orYkFVNXJhbTl2?=
 =?utf-8?B?SmRqc3liRzJLNEJwZ2htWWpZeTk3dmxUMVJDWU0raytFNTdSMm0vbzdwWVF5?=
 =?utf-8?B?S3lMOStSMDlLckw0a0lsYzlwSjVUMzlkWlVsSEJHc3M1OTI1SWdkUkpOOEVZ?=
 =?utf-8?B?Zm9UeXJmb1dvVzBQTWVCUlUyR3BUNXpwWk1oZkhtY0FhN2tqQzhia21kUURv?=
 =?utf-8?B?QjdOQ2JKUFQ3ZkJSc3pPeVVMZGZ2T1BBUkVHanZxaGNETmZybG9EUTJyWlNn?=
 =?utf-8?B?WlFxRUFoU0tCN3dncC9oVGU2aHNaQi9PM1lNbEV3Y3FMc291bk5HbXc5Nk5s?=
 =?utf-8?B?OGgvNm9IM21WUVIra1hOWlFMTWJhOVloaTk3ZEJDQnVNUFU1Mml3L2phTzZw?=
 =?utf-8?B?OUR4Skd2VHhPRXc0QThnRzlMbk82ZExJU3NPL0ttM1VXNG1PT3lQQThYdVB5?=
 =?utf-8?B?Z2ZIbzZoYzFiRTV4eng2cjh0alNYekNlYTZGek1vdHlhTGh4cExERXF6K1FS?=
 =?utf-8?Q?GFgdBiPHNNrox?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(13003099007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NmFXTEJseXpsR0Y4REtvNHFoM0U5cmg2RXpxWVlLRHBSNTJ1enlISFNkZkFK?=
 =?utf-8?B?OVRJUTBhMFB2K3JEeERZM2VVTHVHMWZ0RS80dXpFc3kxSnpSTFp5Rko4ZGVl?=
 =?utf-8?B?Y1BUWjFUYzdhdDlBeFdCUHo3NWRoTHpUKytZRytpRWpYOGo2UFdEQ3BiSlFp?=
 =?utf-8?B?VEI1Zi9VblRXQWljMVNxbnJFc0M3Tm44N1RPTUREb3BUSmNwYVVWbzRTSDRh?=
 =?utf-8?B?ZVdYUlRCUmRISWFtUitaQ0w2WG02T3AzNlhUMWtSQ0JQUXVZS3FBYUE1S0VW?=
 =?utf-8?B?QnpQZjRtRHlnWHpkUkk1ZUhOd2Y5SlJwenFlN0dCNXd0c0VlSk1vaUw2RG53?=
 =?utf-8?B?ZTdaMGNXUk1XZFl6LzRqVHNwVXIzV1BYeHRaMnU0THpodFVsTVpQaDB5TW0z?=
 =?utf-8?B?YWJpZ3dydGdXQTFQdEdnZm5XNm41am5MTytVdE1wV1hjMXRrOEducWxPMk1m?=
 =?utf-8?B?emloajBKdm9yNFdzUHpUUnZZY1ZHVHFXRlFLcm42WEZaSGdRR3RxMnFyWS84?=
 =?utf-8?B?RE9LbWtCRE13ak9FaWpodjZOaHllNGhTZ3ZwTFBMcXFoamRNQ1Bya3pxTlB3?=
 =?utf-8?B?ZmtvNGVqVGg5VFIzMThlZUhla2hJK0JUcjBaZWpYVnNBemhFYlBtMmxYNmZh?=
 =?utf-8?B?L3hROUFkNVU1QkxhSmk1RStYVjQ5bk5tdm1SbXJxenE1S3JneXBOMW1hajd3?=
 =?utf-8?B?QVBVZDRFeXUzOGl3T0xtd2tvVlhWd0hUMXRLakt6V1Q3eGFyY0YwRkVMc3ZD?=
 =?utf-8?B?QnNkckticlladkhMM3hqbUhuUDhYbG9YMXM5L2tRaUIyS085b1hLYVlOUWV6?=
 =?utf-8?B?cjZqQUpqUVpva2paNEt0Y25RSzFCbU5WbDAyNG1tT25VTXdvTmZPMklmQ096?=
 =?utf-8?B?TjNRSHhvUGxETlU2YXdNZW1DSWxOeEdvYm84eklMb2ZyQlpQOEk1UVhMczRT?=
 =?utf-8?B?ckZHYUlaZ1M4UEpPUFJSN2M2SGs1NTRlS1VPL2hJem9KeHl5QzAzUWlQTWo4?=
 =?utf-8?B?dXd6ejc2NHVCY0pZNDVrcWMxaDhRL1dTRUZ3NzROWnA2amdRSmI3ci9qb2pi?=
 =?utf-8?B?MHl4ZW5PNEljQU00UXFBdkg1YTJDcGRrQk9Mei9wNmkxNlkyaG54QmFzRDN0?=
 =?utf-8?B?bDRzYjJHK0JibWZzSWl5dzdpbnhkbjlNWmhTZnk3UVUyQkR0ai9hRTNjTEZQ?=
 =?utf-8?B?MUUva1Ivb1lteUxGUkN1NXYxaDZ1Q1pnNzU1SGl3QkFRWDZDQXZoRjYrMjZM?=
 =?utf-8?B?UFNpYjBaM2dDWlk0Q1daSHhZZUZxNGFucUtqaWcwMEg4YkVIWjVwOUNjRGsy?=
 =?utf-8?B?Q1VOMlVYNnkwTmEvVm56SFlFU0JwY0QvenFzUkRGZ1dpOSthQzN1S0d0RkM2?=
 =?utf-8?B?eXBjSHlQMjJtV0Z4ei90MUFmeTBPWTRzL1J3dVBPZDlNMy9HVWFLSU1mS2F2?=
 =?utf-8?B?b05QSlhJMXFPc0hzU3Z4WW9FOCtUY2owOUp3bFh5NHNiL3VuYVRaUVM5cXJV?=
 =?utf-8?B?UC9BRTFleVBNbXhYTnUxNEVpUkxod2s4bHQ0Z0ROSnUraWtPTGU4ZTRaODRN?=
 =?utf-8?B?ejBzWkVxSG1LeWs4T3V0Y1hpZERPU2F2UmxJQWc0anh3S2tLTmhyRVhtdlZ1?=
 =?utf-8?B?MlpwY2l5VHM2M2FPYm9MT3J6Ni92Z0lLL3JHV2lqeWViWmdCcEQ2NU5jSFV3?=
 =?utf-8?B?RzR1dFRTdUtIc0JrSHhTcENJS2VMVklUa00zVHltNjQyT0gvcUUrRkEyWldQ?=
 =?utf-8?B?ajdrZEhXV0hpUkVCM29JUjE2WWNwbk1BYlhPV2J2b292T0hSUmxsK2hTR3hB?=
 =?utf-8?B?MFhGQ0xxUGxKaldiL2ppWWtRNEhtbzZ1MEhIVWxFdmhwY0VYWXVpM3JtNHVH?=
 =?utf-8?B?Wmw3SytaSkR4cUN5L01FczFnc05ld2FJL0IwQ0ppenk2VzAvT1Z6TUVidG1v?=
 =?utf-8?B?eHdxZDZSOGh3ZXBid1l1L0xZeGFVeDJWQlRObmp4VXkwajdxS2ZYbkkxbEhs?=
 =?utf-8?B?QmxDNnlna1AwU1Rtak4yV2RCL09KdXRHaEZHMEVGTEl0M085aitNclhjWEhh?=
 =?utf-8?B?ZVZ3R3hRVE9PZ3psbUV3MjJIWVljMVl5Q2cwVkhRNkdlLzg0aitSb3pySnJE?=
 =?utf-8?B?UHJ4SUZMY2xhRWJoMmYrUmxTam1KUTBlOUhpelpsenZqM2hqQ3BuL0VxRWxl?=
 =?utf-8?B?aGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d3a81083-7f50-445e-b451-08ddf13e0b90
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2025 14:18:14.3251 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uWQHAWjDFNswVsy6wZx4vf6kOi3m0Fb+8nh9Hl55wdOjY093vuLPssk8hAqqRbiF2HtvKCj+QwHVoESahTeHsDmDiqiITuFXnjXS0u3/8fs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4900
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



On 9/11/2025 8:55 AM, Patchwork wrote:
> *Patch Details*
> *Series:*	drm/xe/pf: Drop rounddown_pow_of_two fair LMEM limitation
> *URL:*	https://patchwork.freedesktop.org/series/154348/ <https://patchwork.freedesktop.org/series/154348/>
> *State:*	failure
> *Details:*	https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154348v1/index.html <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154348v1/index.html>
> 
> 
>   CI Bug Log - changes from xe-3720-413003a193543884257e5e6b65f7f3c82e1ab3d2_FULL -> xe-pw-154348v1_FULL
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with xe-pw-154348v1_FULL absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-154348v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> 
>     Participating hosts (4 -> 4)
> 
> No changes in participating hosts
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in xe-pw-154348v1_FULL:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   * igt@kms_flip@flip-vs-suspend:
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3720-413003a193543884257e5e6b65f7f3c82e1ab3d2/shard-bmg-1/igt@kms_flip@flip-vs-suspend.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154348v1/shard-bmg-3/igt@kms_flip@flip-vs-suspend.html> +1 other test fail
> 

unrelated


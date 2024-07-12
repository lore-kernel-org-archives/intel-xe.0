Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95907C2BD09
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jul 2024 13:55:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61A2110ED1F;
	Fri, 12 Jul 2024 13:55:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CIz6b1Pe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3052E10ED1F
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Jul 2024 13:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720792511; x=1752328511;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=5z8GznQkHdRdrEIkY4BSsDaSzsjJRfztq3UGMS1hOrs=;
 b=CIz6b1PeYoYQJ8Z8PRwe+mZGOr8NEOnAbz9tXHyxfVsLHan9Kg/XNs9K
 bBFpRgD+9wYfJvLxIA4u4t24Hv6ok0vQEoCd6W9W5zo+PhRKVsEnnCViG
 1Gz4yJTrYKhdr2pzQucCoEl/geSxyd/++wlgCY2GYKEJRc7GOMQnIF410
 7slxK4QdnkJvpB9f0JXQtVrqAG08To/UouT8Rkg2nMeu/hOKGTHTphe0Q
 5cB3DnPlMDRCSWSmKjGLUU0p0JvIfRC86c6uWYUcTLKZYwZ1Iz6bA2TsC
 4yHrwykDfRNv3HF4tXPTt95l//vaksX3lsW76V/9wQNSENk62hgFw93Je w==;
X-CSE-ConnectionGUID: BKSsvuaGQ9iY78IXOW4QUA==
X-CSE-MsgGUID: jbJgueLXSmuQf0u6E3RulQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11131"; a="18075116"
X-IronPort-AV: E=Sophos;i="6.09,202,1716274800"; d="scan'208";a="18075116"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2024 06:55:09 -0700
X-CSE-ConnectionGUID: rJiWJ2CTS6SHyakqB4e2Mw==
X-CSE-MsgGUID: WSYAIPLMQVu24jGNb+FVRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,202,1716274800"; d="scan'208";a="53747739"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Jul 2024 06:55:09 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 12 Jul 2024 06:55:07 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 12 Jul 2024 06:55:07 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 12 Jul 2024 06:55:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AfmXxmbTZPK3CybErOEiHx6c+pUyeNgTcHBv7Ba3DI+m5mJBKD/5XGqdlbxXSr6kvFFW5Gbg8aBrpoJgV6kNz0u+JNKFQBDn7nX0YqM5fLyWHzImSu3DMHX/FGHTugvp4051zovfGm+dC+Q87TYNUPoknsuqi1+w5aaEuJPFRB4Aj5qPZjM9/ayXmF57PrUws/OzStXrVHZJ0i2R/QKINW2UFiBNL1Td2ESHxg01yKEDUdYvZzxzwzBo8vQKfRceQZLc4tpzZQP/45ouKG7RJo9GuLMR1ZPK9a9e3oa3mYF61LXK+IFXlbIOv6IDK8g1z816pIE7uE2Co9+IkfPRCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/UcxSSOKNI93YmqqWa5nqsDliXX8kCYtTBLD6jb2XMA=;
 b=kDEHoGiQHT2vvfM8Ryg/BWUqxJx98waPedZhZCszKzWxwmtDAHeqcnWpPqiZPeXot4Yqxu8uGwtoYt87ByLigGNORBioJAeFfhicaKmslPMHhwVlnIchGQpVlMNeW+0tyyjl9v0eZkOQl451QZ0HrtGlv3zT6ezPGyxdoBwtKcQemGgwPS+UmY2P2SsjA+g6rmkHulqsQVnCO1Z3Si7f1QleK9CmLgNuDcSMcsQKqZh0jo4E71dSD5r+HxY452eyjm6MkH/2Dc2lymuckOOTwrqdrYUiKNVGQgFqSbKffQ70kdoWlc3+XWfcB/OTlXiS4CJaNWWbuIoDVIkKwfCVYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by PH7PR11MB6676.namprd11.prod.outlook.com (2603:10b6:510:1ae::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.23; Fri, 12 Jul
 2024 13:55:05 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.7762.016; Fri, 12 Jul 2024
 13:55:05 +0000
Date: Fri, 12 Jul 2024 15:55:01 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/xe/pf: Limit fair VF LMEM provisioning
Message-ID: <20240712135501.cydn2ax6myckuqtp@intel.com>
References: <20240711192320.1198-1-michal.wajdeczko@intel.com>
 <20240711192320.1198-2-michal.wajdeczko@intel.com>
 <CH0PR11MB54440F4C13371762AF17DAB1E5A52@CH0PR11MB5444.namprd11.prod.outlook.com>
 <cba1695f-d537-47d7-aa7e-20c112c83846@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cba1695f-d537-47d7-aa7e-20c112c83846@intel.com>
X-ClientProxiedBy: MI1P293CA0022.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:3::19) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|PH7PR11MB6676:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d277e86-2e7a-4438-c327-08dca27a3b9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bE0zZmlwdFVGMmRMVWpQM0NHeEZ5MytEV1lGMi8rYVVreXU4eTErNzUzU01D?=
 =?utf-8?B?ZmtYTTkzYyt4MGZiTzArYTBhMTZXY29PZDBpWHpmYWpMU0V1RlpualhqQnpr?=
 =?utf-8?B?d2poNHlsWlZXb3ppTlQ2dWI2ejlQRk1ZTUNyUG50UTVZQTVVVmlBSElqWDRl?=
 =?utf-8?B?R09XanJLSWZOSmsrM2FlQytXZUFBY3pHSzVEdCtkVlZtTiswcWtlRnBKbnJF?=
 =?utf-8?B?ckFRNGpITFRSUFBGeGxaUVd4SXpSNkZ5dVlVeGhaRnlhNEpWcWtMTXB5MFQx?=
 =?utf-8?B?RzdYS0ltNFJTRjR1aUo3cWIzTlE4bmdhZ2xHN0o0MktNYm1XaWtaQVVpKzVr?=
 =?utf-8?B?d2dTUFBsYy9pa0xnZzRSSG94ekE5RGp2U3VEYTE4bERCV2RzRU16R0cxckky?=
 =?utf-8?B?UmtzZXJibXNVbU56bHIvemhodVlrNUZKbXlxUU1ONlhXM2xyQnVwL3RwMnFC?=
 =?utf-8?B?b0VqNUpCb2Q3Qld6cW1JenlyL2xid3Z2U2U5YWRMMkl2bTRqOWFoNnRzTFIy?=
 =?utf-8?B?WnAwR3ZTUGptYmljT3hZVWJVZTJsMWxma2EvN2tBWVVySi8ydlhXck45cDRj?=
 =?utf-8?B?Q2hlNlVac050ZEVrVTE1VHlZNi91R2YrKzZOeCtHWDhuRjBFSzhDNUo4eWNO?=
 =?utf-8?B?Z1RGMFFiYm9oZkxhMmdTc3JLclFsUzN3RkVLUFkzb1B2a1BqY0YvT1VlUmpJ?=
 =?utf-8?B?aFp5T1Y1TllXQ3dMa2J1L2NPK2V1OC9UZ0Y2d1BuNkV2d2NxcmJkaDluUzl1?=
 =?utf-8?B?ZmVTY0d6dW1lemRWWDZwM0xWNUZBM3dMcXBUdGVJanhSOGgwT2NLcWFrdjdj?=
 =?utf-8?B?SHkrNXIvVFh4NnQwUXhLWlVEamdsZ29SbWJOVVdXTGJ5MU1hZ3pKNzhwVkda?=
 =?utf-8?B?akNJTk9ST25taWtxWmNpVlJmTVFQYlRLUHdEUEE4bHU3RnFZd3JUekkyN1Zv?=
 =?utf-8?B?T2tPRGZMMXk0d00ycW5PWTBMekJ2dVJTcXdxZ0E2eFFKU3dyd2dtU0E0R3Qv?=
 =?utf-8?B?SnJyVG10MzgyNkhqNUxVVEF3TldJSU9jMVV4emg3WitTQ0R5YTFLcUtRNWxz?=
 =?utf-8?B?THZ6QXRFWWIxaGdXOUJXNEtleUs0UkFyeld0RkFrY29uNUJJMXMzRkJHRnB6?=
 =?utf-8?B?YVF0VDBEdGJxdmowZFBYUUdVVDh2NDc1M3BidWZjWUR1T2ErcHZHV09LamNZ?=
 =?utf-8?B?cG5sQzlQazFuL1NWMHdiNTlaa2J3SjBSc1FYQnQ4a0dkbVBWY2l0YnZTT3pa?=
 =?utf-8?B?VnR3d3Myb01QR3RRYlNkZ1hpYVgyUnhTYlhoLy9yZE0rZExrcjl2UHkxNW53?=
 =?utf-8?B?RVQ3VGN3QTZZZ2FBaXZnblQ3cENyTUxiTE93SlVGb1BJRUJTUDBVVmRPMUky?=
 =?utf-8?B?R0RRalFUb3U4bTViTlBUZUNDWkhFcVh1QnBtQXMyS1VkaVRUOHkrcnhTUVc5?=
 =?utf-8?B?eDkzUURZYUhVU21qdmRDQ1BrdE9KZUpnbC9nZEt5dW5KZUJ6WkVzbFU0cFQ3?=
 =?utf-8?B?dEdIaDRmSmlxNFVmK2YwUFFmZzBVbUMwdHRQbUR6V1RZSHQzaXZkdXdLYysz?=
 =?utf-8?B?bGQzK0doazFJR0tjZzFsOWxCK3pQUU0xd3poQmMrcEV2UnIzVU9oL1hVZi9M?=
 =?utf-8?B?emdpZVhVbC9VaitxUGVPZWloOWhtZ3RRWHI2OUJEejY2V1drZGdRL3IwRHpa?=
 =?utf-8?B?Sk5wTGh5Tm1oaFJKL0dFc1Z5dHZPSnJyZWsyOTFNM1M0cG91bTBod2NXaHF0?=
 =?utf-8?B?VlVQcWlHRjZUdTV1R29yaG1pYkxaZVk2OGxodHMyWEZsUGpHNTAwR0xOSGNN?=
 =?utf-8?B?WVFHaEYwSHluUll4NUJsQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZHVjaVpGWC9kelE5ZW5EMDJpTVlhK0YrWDBOZ0F1d1dFNC83ek0yak01VmNQ?=
 =?utf-8?B?TkhYcVdPdVM2RWN6WjFJY1dkL2d1TVYxNXM4ckpKaTd5Y2FzdDMzQVYyeFVw?=
 =?utf-8?B?aDVlVGVQZmc5OGxoQVdZdmFkd0lLRjJ4MGFtMUdpNk1lUDUxeW93YkN4aDhX?=
 =?utf-8?B?ZWNFdEE5eWFsaVBJa3pPN3gySHVxMm91Z0FYM2hCTDhBSXZqZDRBODVuOWs0?=
 =?utf-8?B?WHBTSW8wU215Mm16eTFaRlRHcWJJK0pOTTd4a052NEhES0lZTU54TVdwc1Qr?=
 =?utf-8?B?dXkwOVNwVGt3NStZNVRxUEJ4UndocDJhTk1CckRuaHZ0Z09TS2lWTkdsUWRj?=
 =?utf-8?B?ZzkxWnU2dWEzV2RWZnlKYjNHcnpubU5HdWR1ZDNFSTJJc3lrNk9UY1JLdnFE?=
 =?utf-8?B?c1VVb2NVeVAxb1N0Slk0R3B4emJoMXZiTnFaanNHUzUwbHE1eXRUOW8veE5C?=
 =?utf-8?B?Mzg1VmlWOG1qdkhwUjErSmFkVGNHb1ZpRFhZQlhDQjhpV0h4eUY3UkRyRFR1?=
 =?utf-8?B?Qlp2a0w0dVBxaWZZUmRhblVLWGZjOTcrbllDSmJmM1hMaUQveko1bnp2cHll?=
 =?utf-8?B?akYwWm0zSUYvOXowSHRPWlBmUW5vWGROODV5NCtleGJtR0M2bXkweDZSVTNm?=
 =?utf-8?B?NkdpNC9Sa1ZZY2ZCdDlRcXFWN3p6NUZPVDVXeVo5TE5iVyt4QjcreExWT2t1?=
 =?utf-8?B?T1ljZkdNa1BZT2tYN1F2VkQxa0VlOEVIQlRZQW9sdlEySEl1aVdzaHZDeHo3?=
 =?utf-8?B?d3RabExmWFdVazhrSk03RlJzTlpzdVpuditNOXM2dzFsWTdDL0thc1kxWDh3?=
 =?utf-8?B?WU8yOXk5a1ZKdjVjTG9iWkFhVDd2TXVRM0d2RnhiRnpxY2lMTUIzQU1TYTI0?=
 =?utf-8?B?czFhZUxReTVPa1dIMWFPSlFSVzY5cndOTUVZQllmYkFVRnNHN1dBZ3ArWDdV?=
 =?utf-8?B?V2VkVytySWFjdUxiQjBXT1Z0N3BPS1p3dlJDMnhmM1ZwbmdMZVQyMndjVFov?=
 =?utf-8?B?c21WSFFVcU5wMGtqdUZBV2M4b1JETk95MjFvTnVtT3RCUVVqRkd3WGpqejV5?=
 =?utf-8?B?cE5SaytmRFloaENzQnhGZTVRK1NFSmVLN1Z0T29jempnZDNtcEFWS0dnRHJG?=
 =?utf-8?B?dHVuaXRGOUs1NmwzVGpHR3p0QjBzelRQSGRSNjlpVy9MUnZHTnhzY0wxSHpR?=
 =?utf-8?B?Zzh1ajRkeUtjNkI2R3NweVBRdzkrejE4cVY4TDJ1ZUYvNVBuZXdCdUI3Vnkw?=
 =?utf-8?B?cjFtVEcyV0pSUm54T28vNFNwa1BUOWdiMEhhbCt3NFFaNTR0NzZOZDJGS09D?=
 =?utf-8?B?NXFqQ1ZIcy8wZlJPQzc1bmpVcndHWWcvbVh6VGZaUTk2MmswemZhV0lNQWFG?=
 =?utf-8?B?VkswaUd2YlRFQlNLcHV2U0VtdG9UbXdqN29aUmN6cnpNNDRNbGsxb3AxTnpJ?=
 =?utf-8?B?dnpDampOYjlUZC9kOTZ6UExwL3NYT1hhZUlvZy8rOFZtU2EvREUxdXd1VUdM?=
 =?utf-8?B?VE9UazRPNHp0VjFSMU9VUWlaVGg0ZGVydWNnUEVsVWRZdmpVMkF0Y2pRdmpU?=
 =?utf-8?B?bE1TMU1BclFWWWU1MlVLaGxQNFFTMHFac0daMldVcHpoN0FiTkhRMFAyK3Fa?=
 =?utf-8?B?Y0ZyQUEzMmdvNjVlcmlKbVphbnQ1SHo2VFU2NnlOcE5zcjYwT25mMkdGa1J2?=
 =?utf-8?B?dmozampCdGxGTVQyS0VSa0l1NU5NajZ5a3pjTlBQMXVPR2JxZHVMN3pxbWtp?=
 =?utf-8?B?Lzk4N1ZiSnZQTG1MNjNHNC9POHkxT3N3Y2RjZG9aQjc5ZHdKaEo5bU02MFdN?=
 =?utf-8?B?Q2VBWHRiYThVRWxVTEpXNjlsZzlOTUNkc2FmcUs3QzhVaEhhUUZydkp2VXQw?=
 =?utf-8?B?bTgxbkl2RmZSVVgrMGtrNy9VRXVuUWV1N1lwOUQrcFNMZjBCdUltRUZrRGJY?=
 =?utf-8?B?WVhHTEk4MXZtdDVqNmoxYVpSVTRTYTF6NmNwTWZrb05OR1Z1QVdsVUsxU0I5?=
 =?utf-8?B?U3lvQXpBQllvQjlOM3FRQnYzeVBKdjgrOXVhNXRqTEhGcTN6dVQ4L3I3L0ll?=
 =?utf-8?B?VzBlT2xVczdPZVVRZ3Z2dWlLTDJyOGRzcy8rUGp0ZWU1TjEraFJRQzFWQjhQ?=
 =?utf-8?B?NlpsYTE4dnpPd1d4SzRGQVFQZ2xxTC9GRjNHa1NJN2FJSWxIaktZK1FuWXhN?=
 =?utf-8?B?aUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d277e86-2e7a-4438-c327-08dca27a3b9f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2024 13:55:05.1130 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pa1aAr9jt0ren+5LnSGsBFTPzteDOEx6P6SOZHqyjMGlZUDxqOlFqyu7BqVeo20emjPiqJx7pb3ewmsI0ISQ1tzI1iOwLdnjqAUlKhwVTeg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6676
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on czw [2024-lip-11 22:21:07 +0200]:
> 
> 
> On 11.07.2024 22:02, Cavitt, Jonathan wrote:
> > -----Original Message-----
> > From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Michal Wajdeczko
> > Sent: Thursday, July 11, 2024 12:23 PM
> > To: intel-xe@lists.freedesktop.org
> > Cc: Wajdeczko, Michal <Michal.Wajdeczko@intel.com>
> > Subject: [PATCH 1/2] drm/xe/pf: Limit fair VF LMEM provisioning
> >>
> >> Due to the current design of the BO and VRAM manager, any object
> >> with XE_BO_FLAG_PINNED flag, which the PF driver uses during VF
> >> LMEM provisionining, is created with the TTM_PL_FLAG_CONTIGUOUS
> >> flag, which may cause VRAM fragmentation that prevents subsequent
> >> allocations of larger objects, like fair VF LMEM provisioning.
> >>
> >> To avoid such failures, round down fair VF LMEM provisioning size
> >> to next power of two size, to compensate what xe_ttm_vram_mgr is
> >> doing to achieve contiguous allocations.
> >>
> >> Fixes: ac6598aed1b3 ("drm/xe/pf: Add support to configure SR-IOV VFs")
> >> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> >> ---
> >>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 1 +
> >>  1 file changed, 1 insertion(+)
> >>
> >> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> >> index db6c213da847..4699b7836001 100644
> >> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> >> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> >> @@ -1543,6 +1543,7 @@ static u64 pf_estimate_fair_lmem(struct xe_gt *gt, unsigned int num_vfs)
> >>  	u64 fair;
> >>  
> >>  	fair = div_u64(available, num_vfs);
> >> +	fair = rounddown_pow_of_two(fair);	/* XXX: ttm_vram_mgr & drm_buddy limitation */
> >>  	fair = ALIGN_DOWN(fair, alignment);
> > 
> > If the alignment is also a power of two, then ALIGN_DOWN here probably
> > isn't necessary.  But I won't block on it because I'm probably just
> > misunderstanding something.
> 
> true, it's redundant, but I didn't want to remove it since this new
> rounddown_pow_of_two() is (I hope) temporary and I don't want to
> accidentally miss mandatory HW requirement
> 
> > 
> > Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > -Jonathan Cavitt
> 
> thanks!
> 


LGTM:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

> > 
> >>  #ifdef MAX_FAIR_LMEM
> >>  	fair = min_t(u64, MAX_FAIR_LMEM, fair);
> >> -- 
> >> 2.43.0
> >>
> >>

-- 

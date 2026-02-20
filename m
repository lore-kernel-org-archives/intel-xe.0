Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4749C56207
	for <intel-xe@archiver.kernel.org>; Fri, 20 Feb 2026 15:20:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82F9610E806;
	Fri, 20 Feb 2026 15:20:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gzVSpi1f";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E42510E7F5
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Feb 2026 15:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771600836; x=1803136836;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=xblWh8r5K0C+A1VHQJskrx+TWind4Hs6TtXSMlr5eFs=;
 b=gzVSpi1fv0LM1ULGbJiFIHCek6do72m/oGwjc8x8BqUMNxNwWtcqmEWm
 F8y2w6NVV4cwVQip3WucMWEcngKNEfmZrkCWhQSmIz3u57nmmATMexSUh
 BLTM7H/lVn3O2wto7jTB0Z0BLcg9tVWIPq+O3apCmBrESupIQRBbRW0Iq
 ektC4ACdhvVbH6jeMmIuN2y/OtIMb8U+wvsLMCHQuc2+e/f0U9zqpLrJD
 TV1V91BDJUdhexn6/mXINggzHMMnvgySSPshD0OuS1t7CumqbFlKmcxl7
 h301F6m+kgmBcCgMroWpJ+KCeIqG0agIFv/w3SOddDlWR88sFGyfn+WTM A==;
X-CSE-ConnectionGUID: jlEroQxxS0eTt22//A7Wdw==
X-CSE-MsgGUID: Gesql6ugR1e2p+r42SMTDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="95313743"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208,217";a="95313743"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 07:20:35 -0800
X-CSE-ConnectionGUID: N1m9uQqdTmCdOmLluH5ncQ==
X-CSE-MsgGUID: N2ftWPmLTl67/QPKUFSF0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; 
 d="scan'208,217";a="219417054"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 07:20:31 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 20 Feb 2026 07:20:30 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 20 Feb 2026 07:20:30 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.44) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 20 Feb 2026 07:20:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wapoXhLPXElVhIYthN3k/xSSGGNeuEtpJ/qP1edZ4ygdfaUJRU2rtxYNw28VVdj93IC/WiwoHaZgFuRalzjXcdAZUdQsKWY1Yuu2dHuMms2am7enF8JAuBmGU/3U6sRdIoy1r1Es7hgBXDTyd6O0CVnPGJfLdkiEbTkTuuGWKlu8AM/srihQE/SCfdRm40vxAyW+1JnpAMXCZh3nlpzD3cLzYfaqc7axueIJu81tAx2EfpJz2pSBSHDrXxfyOogM9dKbknIcY+FWm1v4tJpfrxS0fpNnqYYJCcFhxMg5t058d0kxHYKfJ0hDb8/a/c6GgBMU8lhXPUw1sltavHQ7VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qLg2YLOA+nPQS2y6jhbiStSYehWSupMY0VPTyyDb5PU=;
 b=YvwMUUpKz1qTeuwhrOAH3pVPvWJG7i+rwOU+Gj2xtMNOg1w/if8/DyrkV97ICeTXdsJmK+ISA1BINlHB4+vYHYeeoVUS3HoJtiP2vF5p8K3zxuFgXm2vnaofDJb0cdekxIkD5EZVoX1nDwrfNjpkR1A/7GNns7+stSUFgcRBbPYtpsjeuoezQxS2Z8LeVxBPKh6+8wgQuJe7TmapkZfkOOAMJprahuxIKMRUD6JeH5u3M1nqpr1bKu5TZFyCdueI7YdY9OjT4NAzogsHTaYRAJm09WUAQdCdOF3Qo1y2yTtwP0jz3G4OJrpg/gaC0pS3Mczvfc6aJVhm+giESNkKcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9226.namprd11.prod.outlook.com (2603:10b6:208:574::13)
 by DS0PR11MB9477.namprd11.prod.outlook.com (2603:10b6:8:290::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.15; Fri, 20 Feb
 2026 15:20:29 +0000
Received: from IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::4efd:8324:f06f:5b70]) by IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::4efd:8324:f06f:5b70%6]) with mapi id 15.20.9632.017; Fri, 20 Feb 2026
 15:20:29 +0000
Content-Type: multipart/alternative;
 boundary="------------SA2KZbPRkwUfUDRSEscbJeMQ"
Message-ID: <ceaa1492-0e88-4110-917e-a93a318a8eb2@intel.com>
Date: Fri, 20 Feb 2026 16:20:25 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] drm/xe/vf: Avoid LRC being freed while applying
 fixups
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, =?UTF-8?Q?Micha=C5=82_Winiarski?=
 <michal.winiarski@intel.com>, =?UTF-8?Q?Micha=C5=82_Wajdeczko?=
 <michal.wajdeczko@intel.com>, =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?=
 <piotr.piorkowski@intel.com>
References: <20260218232159.1726873-1-tomasz.lis@intel.com>
 <20260218232159.1726873-3-tomasz.lis@intel.com>
 <aZdds4C5AZyUQfBm@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: "Lis, Tomasz" <tomasz.lis@intel.com>
In-Reply-To: <aZdds4C5AZyUQfBm@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: VI1PR06CA0214.eurprd06.prod.outlook.com
 (2603:10a6:802:2c::35) To IA3PR11MB9226.namprd11.prod.outlook.com
 (2603:10b6:208:574::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9226:EE_|DS0PR11MB9477:EE_
X-MS-Office365-Filtering-Correlation-Id: e7eb96ba-5a5a-4403-b8bf-08de70939491
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d1BtbjBjWVJkTjhIWVlYS3F2eFRid0YwQnhFdmpCamRGbzVmVVZiVTFQVFVo?=
 =?utf-8?B?azVXWnJiTEZkOTFSWFJhR3ZZeTlsQ2lpNTZxVE9JWWl4M1pLTm8vejZnZGo0?=
 =?utf-8?B?UjVZbEZKSGRFa0I3cFhnOUd4U2JOL2hNYjc2cTNjeThGbytmenBoY3R2NTE4?=
 =?utf-8?B?ZmxWSUdIYlEwMEhpWVFQYllaVk1pMGZ4VERsd3hkNXo0S1liM29HbFdkaTda?=
 =?utf-8?B?V2RIZldmOExRU2ovRmwvcE1wZ2F3Nk1sbmQ4bzVLOUkzdlp4d1VXRHVGUDFi?=
 =?utf-8?B?T2ZQbG0xVWpGcjBNZUZhL01PTzZNTmI5emxYOFVkdHpmRWlaeVJWSmtSY0lF?=
 =?utf-8?B?RWMwQVBaMTRleVNhV1ZrL1NFVDdzVi82ME9RLzhLU01jT1htVENrYTVjeksy?=
 =?utf-8?B?QmJwWmFxMGw0c0NpUzl6UzhsL1U2TGwwNmYwcU4rMmdRR3hWZnpmc3V6WHdw?=
 =?utf-8?B?TEhJdGZpVU9VSHJRYmRyaExZV3JzTmRqMzVjNmwvUWpSWWRyNGgzOEorelZJ?=
 =?utf-8?B?T0g5TzByejFPL2FjMytKWDl6Lyt2dUJwRUJzN29aNkxJaUYzZGJQTE9ZMzE0?=
 =?utf-8?B?bzBaSWlmbmE4M25ENXI3dmJJaEowWFV5d052bmJzNHNlUjlleVplamVmZWoz?=
 =?utf-8?B?QW1NbkhNOGRySldidnhaSUFoRytpbkwxRWQ5ZTlCUEhiMUZXZG0reWtWS3Ax?=
 =?utf-8?B?ZnlGQUU2MU1QbWMycW5RU0RVQjBQMHg2c1BMS1hmbEpENHZRdWpsbkhCb2V6?=
 =?utf-8?B?bk1YZi90MkpZL2lHZHZ3NGNDS09mNjFPZ0dGR2xncFkvR2RDVWxERDM0clJi?=
 =?utf-8?B?NmdrSjJnSGtMUlhZZS9ZUUdRSnZNUmsydk9QV0IzR1dDclV2b2t0M0FtdCt2?=
 =?utf-8?B?dk42OTdXSmNzWG54L1luUytYSXZaRkRzUm9hV01zYk9jTStZTFpQRDNJTnJP?=
 =?utf-8?B?bUZqT2U0M2ZzUjB1TUpaUndjUFpHYXozSDNYMU5KT0c0Y0xnTUtWblNtQmFp?=
 =?utf-8?B?bUZKUHh1R0xVTkQrSFpLM0E4S09FZ3RFUnh4a2pNanFXajlZWW4yakVGZElo?=
 =?utf-8?B?V2x2SXdhK0dKRkZRUUU3eUlVa3ljRE1sbUxxNXFwU3JDMWFCTjVhL0JYMElk?=
 =?utf-8?B?eTVKakRiQ3NndTRBSm9DMHVOSnA2VjZxVENFd0lyOEtXR1dYQUZ5dXc1am1p?=
 =?utf-8?B?WDBPcGxHOU1HWFdVM29ETjdzcnBnR2cvTDZnYlpZenNHR2VxM1JjZDN4VmtU?=
 =?utf-8?B?Wm4xM0N4K1RIY0ZFM3ZHUmhKekxvK25NbklhRkVXRm9DVlZDZG1qUjhaOFky?=
 =?utf-8?B?Yk1ubkdMVmFnL2tHdk9Dei9mZzNFaEhlY0Q2UVhPZC81UVFZVlB0cnM4dGx4?=
 =?utf-8?B?Y0lrYmF6V2V1WWFlYWVMSUFHMHY4aGtrU0pGaURLSTNMdE51emZzYmJUdU1y?=
 =?utf-8?B?MDRiU1NRMDd5MU1XbU0yd0hpbmRGOGJLM0k5TUx5Mzk3TWEyZDM1cmN3dVU4?=
 =?utf-8?B?M2JhZDBJUkQzYkdtand5Qk05dW1aK0ozcWlFdnV0bk9YVjM2a2lHaXo5UDhr?=
 =?utf-8?B?czVNY2dHWHgvUUdzbnk1TnU5Sk42YmZENzFreHJveWI0QkVRNlBNNzFJRTFX?=
 =?utf-8?B?bi9yMlVRSThJaE1ncWNrL25oZDhYcU0rUDlUdFErUHZOUGNsSXRHakUwd0w1?=
 =?utf-8?B?c05ZY1lyZW1ROTRIUStUUGJrTDJNdktWNFpucDNVZStqS0VGbXdNanRxZ1Vl?=
 =?utf-8?B?TjVVaFpudW5WWlFSTXRGdGZtSWMvU1pWOEcyU2J6dDZ3ZExPbUZYd0dXZHhH?=
 =?utf-8?B?WE9nV1ZoQ1V2YlRYSDR0NnlnL1lHYzB6c0w5L0NjOUxKODRUVXJ5aCtHMUtu?=
 =?utf-8?B?TFlVNmtTektwTkxCdHhrTzlYOEZ1bFJiaDFBbHJrSVNLRTJkWGFWdVlkQjRo?=
 =?utf-8?B?UU5SaUQxcDluYWQ2QlRNWlVqVmM3bkxjNm85OUJseStxTWVuTUYvSmdhMFgr?=
 =?utf-8?B?akx5b2JLQXlPbTR1SkxKdnBhY0hMRDR3bUpwRHBoMVBOanpVRXpFdi9wSG9o?=
 =?utf-8?B?Ry9xc0FvZ1B3YWhuTlBJc1JBU1NRZnZsNllFbnk0VlBBWlhvaFZsaHFTZjVx?=
 =?utf-8?Q?VtA0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9226.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S0RkNGMxQlBFaGNNaUYzU0o3KytxL1BoTmowVHA3cUVzYjhMU1gzZFFBVUsr?=
 =?utf-8?B?UWFiYVhCTUp5MzNCQ2lrcVMwSHZYeDFTeHB3K1N4NHFLVHI1UUhtS1pFRk41?=
 =?utf-8?B?QnZCT1pFWEl6T2NsMkdhc0hsdTVFaHN5Um1IenhDRGhPLytRNWVwZ0NjQ2pw?=
 =?utf-8?B?OUszdWtYWU04SzVPMmgzV2ZXN3NBeE1oN0tvLzJ0SnJMeDdjVXZ0TnFWMXgw?=
 =?utf-8?B?VHpMb1lPbThmYVhjVkFPcGJVdEVtQmhnUFBTc2hCZFJvdmlJSCtXWXRENk5V?=
 =?utf-8?B?bUpibElnQkxYbjY4UnhwcGtLd2FOUlVhZUNYNHZIa21wQzZ0eVFBREdKVnJJ?=
 =?utf-8?B?TDk0UmNLOHhjQ2h3OFEzUUZTWEJOam9mcEZJVTVHdlE3R2UrWFhnUnVkVkhp?=
 =?utf-8?B?Z3NJL3gvMGNJbTFRekxVWjRIeTAwSlZ1TkpLQzdUUUZldFloUlIraHk2cmZy?=
 =?utf-8?B?UVdXRk5sVWFqRjRmeFI4dDUvOW9HRCtMU1MzbGVaZEE3R3RqbFZGU0I1dzdH?=
 =?utf-8?B?cGlzcnBURTZlbW54OUVSYTBoeEQwclVFVk1ueWVIV2dXVmMwSmdwK05EVHlP?=
 =?utf-8?B?a0MzSDJVblZLQ1poWHFrVHN6QlhIdWE0RW5Kdk9JSXpJd01tY2hjTjl0S2wx?=
 =?utf-8?B?OU0xanpVcHBNWVRnVVpycnpQNi9RVUdXOVZhbEIraHhsd1N2NmUrMWthUm43?=
 =?utf-8?B?Tjl0NUdPdTdxSlZxbUlXV1UycVQ0dEs4YlNLV29oSk5IZDBtVVk3Ni80OFhR?=
 =?utf-8?B?SGNMVWVyQ2x5RElSWFRGM29TZnZnNDNhWW50RmNRRFhsZk9wUyttbEpBVCtM?=
 =?utf-8?B?Z3lkczViemRkWGZrdmI3bFN6Qi93eWk0Ty9UUnVIY2lxek1kOWdSSzROVFpZ?=
 =?utf-8?B?dnV4aWtqMVloTWtxbEdIQXBIT3FTd1RDRVlueFZ1bXlBeWZUeEpVRWY5Vk1Y?=
 =?utf-8?B?UVVQekx3L0dId3haNW9ZSjRqWXo0bHM3amV4NG4zNmZKUWcyRmdKZ0xCN0dE?=
 =?utf-8?B?ZjhBYjVFSWlNSFRPMkQzbTEzNjlkaXZ3ZVpyQXRQWWZybHJjb0J5WGJwSHVu?=
 =?utf-8?B?S0xoTHRYTXpIRFFuV1JJb3VCWDZrWStkRVVVOEZHOEdabDdwUkZYbEdjejVH?=
 =?utf-8?B?QWNXN1FZRUZ0bVZLTjVFMlM3V2NXOGgzVlRJcUdSbU9oMG42eU9VRUhaZzBh?=
 =?utf-8?B?b09TRU0wdFU0TE96Qm9OWjhYaHo5QzdweVU1dTJhQW5Jdi9CbktFNFl2YXgv?=
 =?utf-8?B?bDdjWmZkNzhWSitQVTBYUEpQaDFsQzlwZ1hyR3o5RTRHalNrQ0kzYlYvdkhB?=
 =?utf-8?B?MTlqYmxySVNOT2tmMURDNXVRTWppNE5vZHZXUG9Ndmpsbk5mVDkvK0R0VEFl?=
 =?utf-8?B?Q3BwWmFad3hVWmxaUkxVeis3dzZ3QjBlWnp0R0wwS0VpYjk4dkNzdUJ3bkJo?=
 =?utf-8?B?dGtkaEFUTFpvczJjMGtzUDI0azlGdk5Tcm5CRHpLR3Rvcko5Y1gvSVROUmo3?=
 =?utf-8?B?NVVjaHovVFluQWRUN1N3Z0dmYW1LMXJCekpOQkZadThOTTZOblI2b0NjNWpD?=
 =?utf-8?B?aklnUzFUeTBxU29ua055Wmg2MmZGT1A5d2VOa1Y5NmhkMmRDQmRlZHFkUC92?=
 =?utf-8?B?bUdrcFhlSnBNZ0pqNWsrK245L1dERkZnNHhpVEFDTGJMb0t5NEtHYjUwcFJI?=
 =?utf-8?B?ckpXNFk4WWh2NktOeGxRd1pBSWJUbVV3VWFZdkdlbFhHeXltN0JvVEdZb2Zs?=
 =?utf-8?B?Skw1YWR4TWVjUjdMRnluZG5PNTRHd0lrNFEyaFdRQ2t3aGtUVXdhcy9OZzY3?=
 =?utf-8?B?L0djbXcyVDdRNDVtWVZSWVcvd3pHYUhRa3Z3UlJ1SVIrR2dLNXV1WVU4T3RB?=
 =?utf-8?B?UkVteTEzdHFaNGV6dXpQNHBsQTc1OEhrVnVtcFEyZjl2UFhoeHd4djV1NGVi?=
 =?utf-8?B?Q1c0Vm1Bc09ZSmJUcGlxS0Jnc1c0T3Z5RnlYK1IyT3VXQlJ6VEliUjM4TGw2?=
 =?utf-8?B?cUdJc1FLb05QdktzT3p1OVR3dG9pbkUycW9zZkV5ekUrZmNQZ0pjejFCWHVt?=
 =?utf-8?B?UEpKOGo5alpZR0dacTB3TlAwN1RJZnQreVpCQlR4bVV3U3FNeG5xZVVSM0sw?=
 =?utf-8?B?TFVVNm5jTThrMC82dGQrak9YdFNxT0I0Unh0OXl3SFNNRGZlakFyZlFYdVB1?=
 =?utf-8?B?WWhwKzU0M0hKVkdILzYzS1dNM05HODZ6WlhUV2NZbzBZWFZZeEZYM0pwMEFE?=
 =?utf-8?B?Q1RsV0JQbDk2WnZhWlJOT0MwUFAvSTAxcGZXdDc3YTRVVk43N3lRMVVsZmNs?=
 =?utf-8?B?S2Y4dlRDWElMRVRhYzdPMGZIZkZ0bXZramF5TG52bU5ZL2tjcmk5Zz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e7eb96ba-5a5a-4403-b8bf-08de70939491
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9226.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 15:20:29.1479 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6W0fWpHty48N858m+SHRDJMMF1H7b3HtqVvQZojUqqdqrrPFbehPW9RBZc4ZLG3H5EDMI852cwfF8kGlF1j0Lw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB9477
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

--------------SA2KZbPRkwUfUDRSEscbJeMQ
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 2/19/2026 8:00 PM, Matthew Brost wrote:
> On Thu, Feb 19, 2026 at 12:21:55AM +0100, Tomasz Lis wrote:
>> There is a small but non-zero chance that fixups are running on
>> a context during teardown. The chances are decreased by starting
>> the teardown by releasing guc_id, but remain non-zero.
>> On the other hand the sync between fixups and context creation
>> drastically increases chance for such parallel teardown if
>> context creation fails.
>>
> I don't see how this is possible.
>
> xe_exec_queue_contexts_hwsp_rebase only happens if the exec queue is
> present in &guc->submission_state.exec_queue_lookup.
>
>   332 static void __xe_exec_queue_fini(struct xe_exec_queue *q)
>   333 {
>   334         int i;
>   335
>   336         q->ops->fini(q);
>   337
>   338         for (i = 0; i < q->width; ++i)
>   339                 xe_lrc_put(q->lrc[i]);
>   340 }
>
> The removal from &guc->submission_state.exec_queue_lookup happen on line
> 336 in the above before. Thus a xe_exec_queue_contexts_hwsp_rebase can't
> be executing on a 'q' after line 336 returns, then we drop the
> references to the LRC. I agree this lifetime is questionable at best
> (IIRC my GuC documentation explain this why this works) but if there is
> a problem it should be fix with this lifetime in mind.

Consider a situation: __xe_exec_queue_init() and 
xe_exec_queue_contexts_hwsp_rebase() are running at the same time, on a 
one core VM, switching CPU contexts (each bullet is a context switch).

* __xe_exec_queue_init() passes `q->ops->init(q)` - the queue is added 
to exec_queue_lookup, then it starts creating LRCs - it's multi-LRC queue

* xe_exec_queue_contexts_hwsp_rebase() is executed on this new queue, 
starts the loop over LRCs

*  __xe_exec_queue_init() fails to create last of the LRCs, and jumps to 
`err_lrc` where all the finalization is done - removal form 
exec_queue_lookup and freeing of already created LRCs

* CPU context switches back to __xe_exec_queue_init() which goes through 
pointers of now freed LRCs, accessing the inside - SEGFAULT.

(I used one CPU core only to simplify the scenario, it could happen on 
multi-core as well)

> Looking at __xe_exec_queue_init, I believe 'err_lrc' label should
> actually call __xe_exec_queue_fini.

The __xe_exec_queue_fini() currently assumes that all LRC pointers are 
non-NULL.

Do you mean adding such check there? With it present, we could call that 
function in `err_lrc`.

I see no issue with such change, so let me know and I'll do it (assuming 
we will not be adding any wait there, as hinted below).

>
>> Prevent LRC teardown in parallel with fixups by getting a reference.
>>
>> Signed-off-by: Tomasz Lis<tomasz.lis@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_exec_queue.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
>> index 42849be46166..e9396ad3390a 100644
>> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
>> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>> @@ -1669,10 +1669,11 @@ int xe_exec_queue_contexts_hwsp_rebase(struct xe_exec_queue *q, void *scratch)
>>   		lrc = READ_ONCE(q->lrc[i]);
>>   		if (!lrc)
>>   			continue;
>> -
>> +		xe_lrc_get(lrc);
> This doesn't actually fix anything. The LRC could (current, in error
> paths) disappear between the read and get.

It is true that this is only narrowing the window rather than providing 
flawless fix. Though narrowing the window is a substantial improvement 
over ignoring the issue.

We could use xe_gt_sriov_vf_wait_valid_default_lrc() within `err_lrc:` 
instead, that would allow a flawless fix. An advantage of the current 
solution is that it keeps the complication within recovery code, without 
altering the common flow (by common flow I mean the queue creation flow 
used for both PF and VF, and regardless whether vf migration is 
possible). It also allows to free the memory faster - if we've failed 
LRC creation, it may be important to free resources as soon as possible.

Reading and writing local mem is substantially slower than the local 
pointer read and refcount increase, so this way we're narrowing the 
window by definitely more than 95%.

-Tomasz

>
> Matt
>
>>   		xe_lrc_update_memirq_regs_with_address(lrc, q->hwe, scratch);
>>   		xe_lrc_update_hwctx_regs_with_address(lrc);
>>   		err = xe_lrc_setup_wa_bb_with_scratch(lrc, q->hwe, scratch);
>> +		xe_lrc_put(lrc);
>>   		if (err)
>>   			break;
>>   	}
>> -- 
>> 2.25.1
>>
--------------SA2KZbPRkwUfUDRSEscbJeMQ
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2/19/2026 8:00 PM, Matthew Brost
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:aZdds4C5AZyUQfBm@lstrano-desk.jf.intel.com">
      <pre wrap="" class="moz-quote-pre">On Thu, Feb 19, 2026 at 12:21:55AM +0100, Tomasz Lis wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">There is a small but non-zero chance that fixups are running on
a context during teardown. The chances are decreased by starting
the teardown by releasing guc_id, but remain non-zero.
On the other hand the sync between fixups and context creation
drastically increases chance for such parallel teardown if
context creation fails.

</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I don't see how this is possible.

xe_exec_queue_contexts_hwsp_rebase only happens if the exec queue is
present in &amp;guc-&gt;submission_state.exec_queue_lookup.

 332 static void __xe_exec_queue_fini(struct xe_exec_queue *q)
 333 {
 334         int i;
 335
 336         q-&gt;ops-&gt;fini(q);
 337
 338         for (i = 0; i &lt; q-&gt;width; ++i)
 339                 xe_lrc_put(q-&gt;lrc[i]);
 340 }

The removal from &amp;guc-&gt;submission_state.exec_queue_lookup happen on line
336 in the above before. Thus a xe_exec_queue_contexts_hwsp_rebase can't
be executing on a 'q' after line 336 returns, then we drop the
references to the LRC. I agree this lifetime is questionable at best
(IIRC my GuC documentation explain this why this works) but if there is
a problem it should be fix with this lifetime in mind.</pre>
    </blockquote>
    <p>Consider a situation: __xe_exec_queue_init() and
      xe_exec_queue_contexts_hwsp_rebase() are running at the same time,
      on a one core VM, switching CPU contexts (each bullet is a context
      switch).</p>
    <p>* __xe_exec_queue_init() passes `q-&gt;ops-&gt;init(q)` - the
      queue is added to&nbsp;<span style="white-space: pre-wrap">exec_queue_lookup<span style="white-space: normal">, then it starts creating LRCs - it's multi-LRC queue</span></span></p>
    <p>*&nbsp;xe_exec_queue_contexts_hwsp_rebase() is executed on this new
      queue, starts the loop over LRCs</p>
    <p>*&nbsp; __xe_exec_queue_init() fails to create last of the LRCs, and
      jumps to `err_lrc` where all the finalization is done - removal
      form&nbsp;<span style="white-space: pre-wrap">exec_queue_lookup<span style="white-space: normal">&nbsp;and freeing of&nbsp;</span></span>already
      created LRCs</p>
    <p>* CPU context switches back to __xe_exec_queue_init() which goes
      through pointers of now freed LRCs, accessing the inside -
      SEGFAULT.</p>
    <p></p>
    <p>(I used one CPU core only to simplify the scenario, it could
      happen on multi-core as well)</p>
    <blockquote type="cite" cite="mid:aZdds4C5AZyUQfBm@lstrano-desk.jf.intel.com">
      <pre wrap="" class="moz-quote-pre">Looking at __xe_exec_queue_init, I believe 'err_lrc' label should
actually call __xe_exec_queue_fini.</pre>
    </blockquote>
    <p>The __xe_exec_queue_fini() currently assumes that all LRC
      pointers are non-NULL.</p>
    <p>Do you mean adding such check there? With it present, we could
      call that function in `<span style="white-space: pre-wrap">err_lrc`.</span></p>
    <p><span style="white-space: pre-wrap">I see no issue with such change, so let me know and I'll do it (assuming we will not be adding any wait there, as hinted below).</span></p>
    <blockquote type="cite" cite="mid:aZdds4C5AZyUQfBm@lstrano-desk.jf.intel.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Prevent LRC teardown in parallel with fixups by getting a reference.

Signed-off-by: Tomasz Lis <a class="moz-txt-link-rfc2396E" href="mailto:tomasz.lis@intel.com">&lt;tomasz.lis@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_exec_queue.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 42849be46166..e9396ad3390a 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -1669,10 +1669,11 @@ int xe_exec_queue_contexts_hwsp_rebase(struct xe_exec_queue *q, void *scratch)
 		lrc = READ_ONCE(q-&gt;lrc[i]);
 		if (!lrc)
 			continue;
-
+		xe_lrc_get(lrc);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
This doesn't actually fix anything. The LRC could (current, in error
paths) disappear between the read and get.</pre>
    </blockquote>
    <p>It is true that this is only narrowing the window rather than
      providing flawless fix. Though narrowing the window is a
      substantial improvement over ignoring the issue.</p>
    <p>We could use xe_gt_sriov_vf_wait_valid_default_lrc() within
      `err_lrc:` instead, that would allow a flawless fix. An advantage
      of the current solution is that it keeps the complication within
      recovery code, without altering the common flow (by common flow I
      mean the queue creation flow used for both PF and VF, and
      regardless whether vf migration is possible). It also allows to
      free the memory faster - if we've failed LRC creation, it may be
      important to free resources as soon as possible.</p>
    <p>Reading and writing local mem is substantially slower than the
      local pointer read and refcount increase, so this way we're
      narrowing the window by definitely more than 95%.</p>
    <p>-Tomasz</p>
    <blockquote type="cite" cite="mid:aZdds4C5AZyUQfBm@lstrano-desk.jf.intel.com">
      <pre wrap="" class="moz-quote-pre">

Matt

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre"> 		xe_lrc_update_memirq_regs_with_address(lrc, q-&gt;hwe, scratch);
 		xe_lrc_update_hwctx_regs_with_address(lrc);
 		err = xe_lrc_setup_wa_bb_with_scratch(lrc, q-&gt;hwe, scratch);
+		xe_lrc_put(lrc);
 		if (err)
 			break;
 	}
-- 
2.25.1

</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------SA2KZbPRkwUfUDRSEscbJeMQ--

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B65DCC83F1D
	for <intel-xe@archiver.kernel.org>; Tue, 15 Jul 2025 07:06:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 770F210E0D8;
	Tue, 15 Jul 2025 07:06:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WXaAhFp8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69AF910E0D8
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Jul 2025 07:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752563174; x=1784099174;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Nss3rAdj14Dturfv5gp0E1fguv3PhFx7u9IpdLpHT9c=;
 b=WXaAhFp8pCZtp8ioMahnHB+9hbXrjgIr9PUk9YWiKS5hQb/hczFVUIoc
 L82T9Xytk/UIO1Py8GhDygAZ883AhDYM+rwv+5oOFEwEtkg3kd7RrO5eT
 112w9aPo9vK++atC0gYU3t37JbCfHtgYuYEs2C3lloPLRHaYNgOGECB8i
 riRiuuBHZMbZV+mTDvfWrTdVuD4h1TYYiJuByWdqL41VyYtBjBaTp4EWU
 NgZzAaMZyHpx9QulRKEStAUUajRNFNvICLkrbG7Xy6KsCZhObBCf7q14Y
 y3xetRPcXoFzIwU413kkbP45uw/Gj9NsIEMsBg1U49Pk+myxCYIwm+9DI A==;
X-CSE-ConnectionGUID: 3wQGE/JSStCN3t50fAMpqg==
X-CSE-MsgGUID: 6QafiIx6TKSz5RIlPOxczw==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="72221322"
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; d="scan'208";a="72221322"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 00:06:14 -0700
X-CSE-ConnectionGUID: XITcC1PISt+2yeIf1XqNmw==
X-CSE-MsgGUID: 68pkmIzOSoODNusJM28DPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; d="scan'208";a="161167665"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 00:06:13 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 15 Jul 2025 00:06:12 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 15 Jul 2025 00:06:12 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.70)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 15 Jul 2025 00:06:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JolkDgHPgxlTr/m66MCY4qitrItOw1MBXTXJOUd3SesZMvgZF9eIRn/RL7U2q9kCGbnNrNzPlLTQCa7kD+s+CKW2uFJFbrDSqm8x4tR6Mnx1B5U45ghxxd+Up00wmH08zOuMXhjrQbvnKqg1ajOpjwGdK3xV4CpyIQjrwFrJd0ftDrICHav7klur6GWnm1SdswbY6HcAyL057Gt6R9OXTKmPf1g+xd6qZy5Xw0UulcCS+dg+C1K3IHkpczNJfJ66y/CI1CGFgqV+J8V1lt6kexqJzBGGNi9Tab3MGcblHBhX8YFizSjVf5XvGLLLsAyJda/bxroMLVVLYt9Uz061xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uDqiVUyAQRkad4xRuVTvn/DKyFzJh3m5KXKIUQorSaw=;
 b=sEFcdOVlO7LksZxXUWgUhQeJAb7nOBrtMNZiZx6RBVmMdL84vS/0txJjKZ108SXQrS52sM7hmVTa1jOPAE0mOtk5MvWw5u9ghaLdaEMXaursIi4t5jVP8BhfJGsHWO+ZfC1qcs/a4cmcVmbGTpVBRNVJsvstdSAaL9DjyMvpTh6s5g4jKmG1CAMABCMnhMsoBUasTi/J6Pr3wp0acTQZQcanX+6aCSZRcPXGacb+pPRh3iG0jQ5y3vZ3c/nPUelvsn/j3muN/al+e8SRXYNEk28A1+4k+ItjeyCMoPkYsBFg8Ait4TpeGhy3jD58oMB78qXV0o/6VSmvX/kW1bLhqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6138.namprd11.prod.outlook.com (2603:10b6:930:2a::11)
 by SJ5PPF2F2B659FE.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::81c) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.35; Tue, 15 Jul
 2025 07:06:06 +0000
Received: from CY5PR11MB6138.namprd11.prod.outlook.com
 ([fe80::f24e:b21e:c458:4e74]) by CY5PR11MB6138.namprd11.prod.outlook.com
 ([fe80::f24e:b21e:c458:4e74%4]) with mapi id 15.20.8857.025; Tue, 15 Jul 2025
 07:06:06 +0000
Date: Tue, 15 Jul 2025 09:06:03 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v4 3/6] drm/xe/pf: Move GGTT config KLVs encoding to helper
Message-ID: <20250715070603.b5s67aoilzmgbrk6@intel.com>
References: <20250711193316.1920-1-michal.wajdeczko@intel.com>
 <20250711193316.1920-4-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250711193316.1920-4-michal.wajdeczko@intel.com>
X-ClientProxiedBy: LO6P265CA0014.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:339::12) To CY5PR11MB6138.namprd11.prod.outlook.com
 (2603:10b6:930:2a::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6138:EE_|SJ5PPF2F2B659FE:EE_
X-MS-Office365-Filtering-Correlation-Id: cb45044d-7f29-4a1a-59d7-08ddc36e115a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bFk0T2hkTE9aUXhBcy9ZcU5MTi9ubERCRmRPRnRKZFRHcVhqTE5TNjcxNUhK?=
 =?utf-8?B?ekZ5SXI3ZnBkY1NYZ3VSV0cyWTZic3Q1YWlBQUNSa0JMK3FYbCtWWXRtaE4x?=
 =?utf-8?B?bUcyckFnUjVhYWlsZUhvNXlUbFg4aG5UaVJrYXZFUVFzY3QvUmZpdFQ3TjVt?=
 =?utf-8?B?dUErQnVvdld4OFFnL3pWSno5RTMza1pLc2Q4aW5ibmxyMWZSSXNETlhXcE5B?=
 =?utf-8?B?Y1FhdWlCSStxSGpKQm5NYy9BQ2xkMFNKbFZUdmtqZVlkcEc4Z2RXQ05CT1Vh?=
 =?utf-8?B?UUNwazZXMVczaHlySTZBNWwxR1puTGV6cEo5cytyVGNoK0xCcUVwWkIvbHRH?=
 =?utf-8?B?ckY3MCtzNnZEc1FQajRXamV6L0lOR2thMC9wdlBRNldjTEJYS3N3cjJRZnow?=
 =?utf-8?B?ODdqM1YxcGF2aUFEcnlKNTZJWi9pYkFSelFicGthZjlnUzB4YThTYXpHVjBa?=
 =?utf-8?B?OURtOXpyMVJWSy96Y3J3c2FHM3QxRThUYWxSOWowWDFjYkh2TGJsaUNWc2tr?=
 =?utf-8?B?dHA0U3RqT3dGc0dNbnNmRUxycHY3bmhjdEhQMkRSNXZpL0t5YjhRcUxrK1A3?=
 =?utf-8?B?WCtqcXZDa0dtWlMwTmJDSXV0RnZ4ekdRYWMwZm9RZWdkcUY1MGlJYUhGeUdB?=
 =?utf-8?B?NDFMbTh0VDdvYU1QZ05rUVVJYTNpamtsWnp4MUZzOFRrMlk5ZXNwaHdoSUpi?=
 =?utf-8?B?QkV3Wm5qdzFVWEw1QUwwKzBpdEY3N1B6QVBDVmFmSmd5MTFoTVkrd2x3aUdI?=
 =?utf-8?B?SnZGWi9YUlZPais4aUNJc2FoeStiVGFnaEorNStMdjkrdng4cW5FcE1sVEVW?=
 =?utf-8?B?RTg3a0ZpR0M1OC9jSDlUZEFzUXFYL0VUZjc5MUVQTTV6d09rWTRWbmFuSEV2?=
 =?utf-8?B?bWhESCszajBIYzduZW1EbkdmaGFVMk44d242R0J2MVZsYmJ4RDJjamRFZlFL?=
 =?utf-8?B?NUtYR3pnT2VxWG5wQXVlaXUzaFZpSXo4UE1pYXMyeFh5ak5PVFJyM2x3ZUtB?=
 =?utf-8?B?NEF0Q092NzNFVWhHeXAvUTJRRG1qdktQYkEvL2RjeWo2ek1OTldrNVFqMzY5?=
 =?utf-8?B?MDJCU1RVVERRclhiK3NKMmFobERTSTlyQUhOTGYyZDZOTGdmNmhadGp1dWFt?=
 =?utf-8?B?YkxLWmI3eXlFQUN2T2hrM01WdnE3dU05N1pGWTR2dGY1WFhhSnNpanZzQ1Zk?=
 =?utf-8?B?S1pRNTgvcCtKSHVGS01FUjNPYXlobkkxbTVkbFVEeUJCODZjMUNtd044cDhh?=
 =?utf-8?B?YVYrUFl2YU1leU4vdVFTVzFpS092WU1EUy9xRkJNaVhvRWxxK3Y3VEJxOGZo?=
 =?utf-8?B?eFE1R1puRU1BaVVsSDVVMDdOQVlNWXlKZXFmZnRtWHVkaHV3cHlRck1aa2VL?=
 =?utf-8?B?ZkV0R0sweTY5czdCT3M3eWFjUG9qZERoRHBLd2hMKzl2YXh4eVdOcGxmTEdZ?=
 =?utf-8?B?S2tWQi9TSE42WmhXTDNPWUd6NE5uSlFTTkgzamdNQ0g0dWova0hNdmZUVmFF?=
 =?utf-8?B?NHFLUHAvcjRkNFVxUGZHd201QVhvK1lHUkxsdW9PQUM2N053RmpQN2xPZll1?=
 =?utf-8?B?UG50VmVVMkNrOW05MVFzaDhCZnpyR2JCc1BmYlAwaGtkUVBxMmJVVWR2MEww?=
 =?utf-8?B?cFUyNnJmdk9MVVliMS90KzlCSDNveks0TGNNa2cwTzlaL2J2aGpFL1dhVSto?=
 =?utf-8?B?bHRVdGdKVDR1V1ZyTjBmUE9yRVR3eDJmZWxnV2hGelhzcEVISXdHVS9Qa0pk?=
 =?utf-8?B?Sms2cWs4MzdtVHdCQ3V5Qjg3RlF5U2lvQTRNQ21KaldDNCszNC9DUHR3Z05v?=
 =?utf-8?B?dFhkLzU3S2pxRGdDbGhSeGlzQWhsU1Nra2xYaVRMeUpWM3JwZWNzUDhodlgy?=
 =?utf-8?B?R2hzcGhLditIN2l2UitwZVZzOXFveERuQzJ1WDJISmZWZmE5WHh6L1pPcG9z?=
 =?utf-8?Q?afNWM4eB2mA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6138.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eW5ydjhYQklaVWNkbnQrcWF5bEVXR1Y4WHBkRlEyb21SUGZzbGdHLzlEK3p5?=
 =?utf-8?B?SXUyN0dHUVRNd3VxTjV4aTRLcjFNSFo0cDJIVFI1WUFlT1htUE1URDBuaCtQ?=
 =?utf-8?B?bEI3SUVnRE1vYVo1QzNJWS9NUHJJOFRJRGYyTmpDQmJVckgrYUV6d1NlQkFq?=
 =?utf-8?B?dlYzTUtyMXJPR0JKakFkek1SalEydmFHMFZmbTNua3ZjbzFpV2o2RVN0NTU3?=
 =?utf-8?B?TyszNFBaZnRDVE1FbGhkSzdSVmkyWnR2SGJjU0N6Um5tWGRBMEhQclNrdDBL?=
 =?utf-8?B?V1ZBNGd6bjJXSzJST2d6aTJSMXBXaWsxM21jNHVKQVZ3dGlINGpBbGJsMTBu?=
 =?utf-8?B?MWhYdTFwekZaSjIybW5wV0psalNlMnBtZmljWW1mY1g3bzJpeTkvdXhNcWNG?=
 =?utf-8?B?K2F2d2lZa3ZwVHFWNW9NZXF1RU9xNUppZXkzbkZyV3BtUjhYTy8rSVhyY09Y?=
 =?utf-8?B?cURJdnNwSzIwM1JmK05ZaUlmSGNRcllxZFdmWWRsd0ZTR0tyS0NVZnJWMTlM?=
 =?utf-8?B?RXE1OE1CWmwybzBMM3QzRW5yMldnZm5WbVZkdTZyMFViMFh0Y3cwQ2hDV1hq?=
 =?utf-8?B?ZVlmM1JHVW5tQjRJU3FTR1lyOHFFVDlsS2QvemNYUEhLZGo0ODh6RTVaL1o4?=
 =?utf-8?B?ZHlvOCtocVIySkdWbk5Jenh1WW9nN2FWY3cyaG1lNHRtTjNSNDdXSk45WldC?=
 =?utf-8?B?UFoxalpRTFRORVNtWHg2NlZ1YTc2aEcrYWlZZG4zS1QxQ2liajBDbjl0amk4?=
 =?utf-8?B?R2k0SDgrTC9zcFFmVlp4TXBpS0t6QkRnMk4ydy9iZEpVcURkR3RyWk9zYkpI?=
 =?utf-8?B?OE9wa1pVbkF1a0prclQrK0dSSmhCU0dkSmlxSEtsZ0dkZDFsZkhjMlg1cjly?=
 =?utf-8?B?VzljTHBGVTFxb0swQjZEamFjbmtvUWg4K21jUUovT3hZbGJUdFZFMkM3MGJC?=
 =?utf-8?B?dERGd2p5VU5yWWhJNUZYUjBzY3N0YzkrbSs2aHNJdnBXT1BYcXJQK3dBYTBK?=
 =?utf-8?B?aElzQk9maTBzaEtscFV5YXJZUXhPcFEvUjhFdnp3WFhkQ2ZzN2NRQzZnZmJN?=
 =?utf-8?B?UWRqRXBhbHlOM01pd00vMTlOWXk4ZVFGb2xvdlFyY21FeWNqZDNiR1Vzb3c0?=
 =?utf-8?B?aDBSczJWMDVMWW1peEdXMUZDRTFJNGl3d0trMkE2a25JNWExenAxaGtwK1Bn?=
 =?utf-8?B?cDJJaS9kdkVuemJsSm1ibmpRUUxadG5Ba2FCanl6YllWZzhPajJ0Mm94UmJQ?=
 =?utf-8?B?MDlrcjdOY285K21DYVNoSnNpeWdjNmI5R0pQYUVyK0VOdzBGMjFtNTluai9k?=
 =?utf-8?B?QnBaSXhhdjY1ZnhyZFhUUHNvSW1uNFc4M2hKNFpaMTZTT1VQQ2o2NEViR0NX?=
 =?utf-8?B?VWUwTC84dmdnZFdUTkNhSnlCRHNpZGUvMjZ5cUlOb25DSTgyVE1HRUNtRkg2?=
 =?utf-8?B?a3lIektkVkJBVEl0OGsyOVFwTDFGYjJBZ21Xb2RObWU3QUdoMWdKSlF1c3M3?=
 =?utf-8?B?UnlyUGZuNjhBOUwrNjU5ekV1ZlI0Zm0yWE1teFAvTlgrWjc0RnVrVTNVVmR0?=
 =?utf-8?B?aHA5djdHUFRHeGliVktNV3NIT29Rci9PTG5laGYyalpuM0lhejR3Ym93NTlw?=
 =?utf-8?B?Q1BTbGVoTWVqbjM3dFpjb1lmTGlMNGp1ZzZPeEU3QUo4ck9DVzJQT1hqTExt?=
 =?utf-8?B?cTNRYWo0dCtLSFZmMHI2M1NKVXc5Vi9pbkFFcWk2cTIwM1ZPSzF3SFBmYVI1?=
 =?utf-8?B?VWlpRmI3WjB6VVI2SGloaWFxK0lYSHdzWm5SSXJ4djlLYnVRRzdxb21iSmk3?=
 =?utf-8?B?Qk9QNXVIcUJPV3VGbGhRQWExeXJOVkdya0VJZ2FCSGdqK0NRbVBDcktsaStO?=
 =?utf-8?B?Y1Uyb0t6cXBRNzNQWEhaZVgxYW9VV21zRm1wS0xPWVBYbEhtSnZHbDFOd2xF?=
 =?utf-8?B?TUQweHRPNytkc1RBaVZzb0hlZUpPQXYraDhQd0lpR1JJcjVCYXFoWDRjcVEz?=
 =?utf-8?B?aFhlc0srdkN6K1FZVlhKQlFyQ25ZM0VSVWtvWWkzSUVPMnlVRGUzbW1la2pH?=
 =?utf-8?B?STlkeHFzaXVQWXQxaXc5UmcrY3BSNEh1bVZZNXRESGxuRndJZEVGOTc4N3Q3?=
 =?utf-8?B?MER2bUM4Y1pEeU5yNk11VzByS0RxMWtSRDAxL2s2KzJySmFNdVFRbC9SOG1n?=
 =?utf-8?B?V0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cb45044d-7f29-4a1a-59d7-08ddc36e115a
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6138.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2025 07:06:06.2695 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tbR+XYw5uxsovF1Cx9CuhaAo1b/iEUFDRvDKCDjqyXyNnmGTpdPAPGnuTSJDt2aDI0DZyBqGKrjw8tp7vswrgJVVyIFQib+iCoBrK4oc3kI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF2F2B659FE
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on pią [2025-lip-11 21:33:13 +0200]:
> In upcoming patch we will want to encode GGTT config KLVs based
> on raw numbers, without relying on the allocated GGTT node.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 35 ++++++++++++++--------
>  1 file changed, 22 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> index e84fd44c6598..55afc5b06371 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> @@ -237,24 +237,33 @@ static struct xe_gt_sriov_config *pf_pick_vf_config(struct xe_gt *gt, unsigned i
>  	return &gt->sriov.pf.vfs[vfid].config;
>  }
>  
> +/* Return: number of configuration dwords written */
> +static u32 encode_ggtt(u32 *cfg, u64 start, u64 size, bool details)
> +{
> +	u32 n = 0;
> +
> +	if (details) {
> +		cfg[n++] = PREP_GUC_KLV_TAG(VF_CFG_GGTT_START);
> +		cfg[n++] = lower_32_bits(start);
> +		cfg[n++] = upper_32_bits(start);
> +	}
> +
> +	cfg[n++] = PREP_GUC_KLV_TAG(VF_CFG_GGTT_SIZE);
> +	cfg[n++] = lower_32_bits(size);
> +	cfg[n++] = upper_32_bits(size);
> +
> +	return n;
> +}
> +
>  /* Return: number of configuration dwords written */
>  static u32 encode_config_ggtt(u32 *cfg, const struct xe_gt_sriov_config *config, bool details)
>  {
> -	u32 n = 0;
> +	struct xe_ggtt_node *node = config->ggtt_region;
>  
> -	if (xe_ggtt_node_allocated(config->ggtt_region)) {
> -		if (details) {
> -			cfg[n++] = PREP_GUC_KLV_TAG(VF_CFG_GGTT_START);
> -			cfg[n++] = lower_32_bits(config->ggtt_region->base.start);
> -			cfg[n++] = upper_32_bits(config->ggtt_region->base.start);
> -		}
> +	if (!xe_ggtt_node_allocated(node))
> +		return 0;
>  
> -		cfg[n++] = PREP_GUC_KLV_TAG(VF_CFG_GGTT_SIZE);
> -		cfg[n++] = lower_32_bits(config->ggtt_region->base.size);
> -		cfg[n++] = upper_32_bits(config->ggtt_region->base.size);
> -	}
> -
> -	return n;
> +	return encode_ggtt(cfg, node->base.start, node->base.size, details);
>  }

LGTM:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

>  
>  /* Return: number of configuration dwords written */
> -- 
> 2.47.1
> 

-- 

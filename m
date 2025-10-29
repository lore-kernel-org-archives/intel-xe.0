Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28511CCF9F6
	for <intel-xe@archiver.kernel.org>; Wed, 29 Oct 2025 08:47:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6DF010E753;
	Wed, 29 Oct 2025 08:47:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aozIbujR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8BBC10E752
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Oct 2025 08:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761727638; x=1793263638;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=3re97QTbh5poArzWHfvS4twon7VPiGi+HBBlF6tytG8=;
 b=aozIbujR7412//25Y0MEBI9rtTJmkJU/zWj4s+luN4HrwKpv5dJ6ctlZ
 mF4Wkmkx2+d/WcraQNEvDaU/JKqNHAf8EK6aFeop/cQIwUjZ2X/QUgibR
 frYvB+i3AvCbpCS3NfesFwBMcMvn9y9S9xomWocpvTwwbsUG+1dzrIFei
 TDBaPoh3CT9Xt9iDty26aqIP26slBfOIZFi5OdVsS5yPrO90kOCAfWveY
 J7r5m31B9bOJVio/8ybU+M8QVyGEzgemeQhD8+3WQHvH379bBPX5/TKkj
 p5TGtLY25ay1/gvHdT+OcTPWqa84+ys/t93a5fwpo2kOYdQfK5+StdyR6 g==;
X-CSE-ConnectionGUID: 4ADOyh3cTp2w3ensmnfnkg==
X-CSE-MsgGUID: IILo3T+WRt+IUYhF/wn2Cw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="81263090"
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; d="scan'208";a="81263090"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 01:47:18 -0700
X-CSE-ConnectionGUID: xpTt/dPLQ22inZf8PDgGug==
X-CSE-MsgGUID: cP/zWfdZTSaZoxxelNt1Pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; d="scan'208";a="185676398"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 01:47:17 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 29 Oct 2025 01:47:16 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 29 Oct 2025 01:47:16 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.21) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 29 Oct 2025 01:47:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xH7uBL1E45qknd28CGcRDQxPrwrh5i2yLd/6MjJRihCLHcUPq2rlGZe039MWmAM6Idx4je/IrC9fffBqxdt4w2gUtPO6LJC1jVchjSKgqyljjHhrhikFWFWXOyQQUEbeHUNU8AsoA23mE+uh/2q7F004Rliq6+cGSy8tIJ0YAjdNwtXluksrSrsc8XOojbfdsmPU30DiL4UPjXYsjgWIBmXnqkh4L/iLWNwxLGT+IqwYN9qjmPJKZPBoIvBYg+2RqZbLJsBo5nhB8M6HoE1tsj+u/WdHdXlgRPA5prmQzrLAHlxYIydsvuNgP/86WLZFKNtKrOn7e+52fc8FqcGm5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dmNOXp+7CqlHvUAt7w0gRvUT0rNCqDZKAlQTVkRHCik=;
 b=wnnfhNN0j8vnbB36xPlx3PpTWfzqFt/4dKc1oOSKC1VoQl10MFXaUIj5cRliASI7/v9TzIGS3a6XzbZI0LyI3ume7JJHg31KimAv/aqZ466BVe4KL9QSm2cMIOvb1LRSmn93hZj1IJI/MTz48YZF+PJxzEqCfQjLhak4shOgrbQIzV3Tg/VgyFkD/+t2PwotbVtTj28Xn27SekIpm/DljvBV4ay7LSpf6WrRkxfxNTpCklDIiEj3qGfczTc71vHSktPfRx3q7IFcJ2N+9X4WKZUwywm4D7ZnZh47z8vppAGJYoSxOFuIHl64UvNkym182CPRc1c/CBoLDpjAUurEWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by SA3PR11MB7584.namprd11.prod.outlook.com (2603:10b6:806:305::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Wed, 29 Oct
 2025 08:47:10 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.9275.013; Wed, 29 Oct 2025
 08:47:09 +0000
Date: Wed, 29 Oct 2025 09:47:07 +0100
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH v2 03/17] drm/xe/pf: Add _locked variants of the VF EQ
 config functions
Message-ID: <20251029084707.htvoaxto2ul7axjk@intel.com>
References: <20251028175832.184534-1-michal.wajdeczko@intel.com>
 <20251028175832.184534-4-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251028175832.184534-4-michal.wajdeczko@intel.com>
X-ClientProxiedBy: DU2PR04CA0169.eurprd04.prod.outlook.com
 (2603:10a6:10:2b0::24) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|SA3PR11MB7584:EE_
X-MS-Office365-Filtering-Correlation-Id: d8ad8de9-30d1-409b-cb75-08de16c7bf53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c2FIcmlJdllrbUdTSjNxM3A2M05UZXBqTGw0U3M5Zjhxa09oYnBiMGVlcHVB?=
 =?utf-8?B?S2VpWTI0MjZHcU1IWHVDemtaRUhlc2ZtVG1qMldRNnhjVXVhWi9PT2dNckxR?=
 =?utf-8?B?em9KQ3oxQzVTOW1xaytydWYvanoxclYrcXhBVHRxcWRVYU9CVEtzNEdoa2Ux?=
 =?utf-8?B?dnVSdDgwbE9LbHFMNTh5ZHh6TVZQQVB1MXBoYmp4R0hBRlFUeWlKTHZBK1RI?=
 =?utf-8?B?YkdSTUNaZVB5SWFGREUrWi9oNTIySnhGb2Q5QTAvWVFGR2R2bjJ3NTVyZlBG?=
 =?utf-8?B?L0w1Z0VYTStEc1RiZVVNcTJ5bVc2UVh4dm9yYVJHN1FUY0VmK2Q3VTM0b2dV?=
 =?utf-8?B?VU10Um9ENU9hMUFYNFRSSlRGRFJ1NkhxTEY1VkllK3F6bDRuNE8zdEJaYnVC?=
 =?utf-8?B?UVViWWhJeFltdHhDQklTRVpGYTZINUpHNWFkRXh1U1haUUhudU9yQXVYckxJ?=
 =?utf-8?B?dDZVT3VnVWtYZWhzM3UyVXNGWXZtYU1JWnJpNjVlMUkwNXRvakwrU21HdU93?=
 =?utf-8?B?bFpDZHBYbWYrbldGSmg1cWZxbU5qQ0xudC9vdVhFRkpHMCtXQzY4S2VIY29z?=
 =?utf-8?B?cmhzNUN3YzBiUndodXNRZXBSRWI3TW1CNm9qWlBXcDlMc1BES1hhNGFIVDB0?=
 =?utf-8?B?RzdhMExJSGM1K1NQMk9ZV2NYK1JtZ09YY1RtYXJ2NjRWQTEyUjFVM0piallt?=
 =?utf-8?B?Tm43SDVzWm02UHNhSzl4dlZrVzZIY3o1T2VQaER5dzBIRHIxQjBJb3pwYUU2?=
 =?utf-8?B?YjBVK1NLb1pkYktYVGF2Q3U2ZHRSTGtyTzZ4WnZvWXVvMVdzRUwyT3JDNUwr?=
 =?utf-8?B?YSs4N2ZaUHEwY3RqT1lPUno3dGIwcFVlYnovdGpVYTVqYmFjbHpoQjFMSGFr?=
 =?utf-8?B?NE5ldUhYQnVsMGhTbis2ajYyMSs1V2RqQ21MYVhrZzZXVlVPR1NlYjFqaUxR?=
 =?utf-8?B?bHRsTVpXVG9nQVN4Z2EvSnF4NlR4VW53Mi9CRUpjY0MvTzFYbDY3aTFvMUFh?=
 =?utf-8?B?Qng1eGExZ09jeW5lRnJEaFRzVi9QYjhJQnE5cDF6Mlg5Rk1FZkFjVHlnUVBJ?=
 =?utf-8?B?ZVZnRlBHd1VmMGdBQ3hIYWtKRER3RVVQdzZ2MTlKbnVCLzZzakhNSGNzd2Z1?=
 =?utf-8?B?NjdRYTJ2eXV5RmtVTTFCc1o5MTJvVVRFK3EzNXM0Sm8vdzRLWEREVVdoWk9U?=
 =?utf-8?B?b0VKL3ZWam1qL3VpQlU3bXdHcEJtUUNodXpzTHpoMDE1STRYVkZFa0tLbGwx?=
 =?utf-8?B?NGhJdmhRZ2xzc1JwZndRVzNmczRza2hlTnl5a0xZM2pEY0dDM3VQOVVka1hM?=
 =?utf-8?B?MlBCMnRUQkg0Vmg4dnovZTR1cTdxY053aWtPcjZYS1hPd2lHTGFJN0FTR2NU?=
 =?utf-8?B?eUdrd0t0dnhCbXM1SVNHWjlscUFBNTI0QmUyVjhRS1ZtTVBETkFyNWF4T3c1?=
 =?utf-8?B?YzNGR2kxelZrVTBmTEVKZVF4TS80OWVtN24wd1luZzUzeXVQVkdnWTRoV3k4?=
 =?utf-8?B?NGc2bDh1eGJuNWVHUmxRc2dQNHpiY3ovWTBaYm00cTFxYVpiKzhRLzdwR0dS?=
 =?utf-8?B?aHF2RWtDSmxCRG9MNFlUdE5lbmZuTVp4bmRjWWQ3RnRwcHR6T1o4QS9XQitq?=
 =?utf-8?B?RzdFdFkzR3FSN284aTQySWZtTjJZZUpoMW53MXFncnFBeWZ5Z08wNUJ1a0s5?=
 =?utf-8?B?dXpwQURSck5nK2pwMXB1VTlaTnprcFA4d09jMFp1LzRWSGRwNjFmNUpFZk9a?=
 =?utf-8?B?RkQ1VENvWVk5anZzdFZKc2xaaCtTUU9GSVRPSXRKUHEzQkRWS0ZZUzBXaHZ5?=
 =?utf-8?B?cXFvZitzVkU2V1p3S3ZWTzgyY2s4MVBjZWgzVldYYkZ0eFRmSkVzSjhnUlRa?=
 =?utf-8?B?QlhEaHM1c25TVDBwMThzRGMrakJ4dnQyMGRtUW1BdlpESzhrQUdwQk0yNTJH?=
 =?utf-8?Q?uMP/yCYOCCteDl1KacPYel+i1JIzBNeh?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M1grT21OSkhNNkdsRjM5TjdMUFA0L1lIK0JTREliS3l3RmdEV3Z1NUhJNUQ4?=
 =?utf-8?B?NUNiYWxQODlqb3lhQ1JuWEd4MzFXNzdOb3c2WnFLS2drdE13Y3lndzN2bDEy?=
 =?utf-8?B?VG5mbUNOeDhmckJESExHM3ZTSlhwcnRJTHp2aWJtRVpLZ01iNFhCNDM0OVd4?=
 =?utf-8?B?RWE1QktaRXdDRTR2RURNY00xSUdnQkF1SlF6QlVwc1lTU1RTRkdFV0c2UnNi?=
 =?utf-8?B?amxjWlltNVhndWZTR3dWQ3NOcmxyd0dEVTZlSzArNmllVjQzYVFyYmdNYmxY?=
 =?utf-8?B?RzdLSVRtcEh4OXFOZEg0SGtQZFVpTHlUdForK0FkTWJiVlF2RXA4NnFXcUxI?=
 =?utf-8?B?ZHdEeGJ6ZnZnZThRcGIrNVM2emlvMnVHWWg0eVFsalpoQmtQZnZ4QzE5VzYx?=
 =?utf-8?B?N25VQ3JqdFEweWRYNERMOU1waFBoVzhhN3NiZktNeHVDaEY4eW1GK2dKekJQ?=
 =?utf-8?B?ei9iZkpzM25tYjVoQUR3VnBIeE9hVUlnWjhEM1NzcTZiWW9JbXcrTXNnZ1Uv?=
 =?utf-8?B?bmtXS0kzQlZPN0E0eGhBSUU4VW81S2dCZWZ2SEVUV1NON1FXN21rY0dZNWhW?=
 =?utf-8?B?WGd2QUdwZURRYTM0b04wcFhtL3pMMUp5NGV4YUY0Y0tkNC9LVWN6LyttamdS?=
 =?utf-8?B?VlYzSTNhRkRKWTVCQis5TFI4N2gzT3ZWK2pFQWp5R2tqdTlya25lblBheFNS?=
 =?utf-8?B?NlFMTEVuZEI3TGdsdTJSTEVHTlhLTWdZbHlVN0ZzY0FIRmQ4bSsxbXZ2bFZw?=
 =?utf-8?B?cWxFS1N4UXZtcWZjeENJQkZPdXZTQXp2bFJnczhaRDhuMjJqRVQzR0hqYVJ3?=
 =?utf-8?B?OHJWNnFGWXJ5OFB5STV1MERlZW5pM3k4ZzY1ZDg0SmRMYTQ2NEFFSFdlZ1FR?=
 =?utf-8?B?VjltbldUYkdrV01FS2MvemNxNi9lNDdvNlpyc1N0Rnl0cUlhakZPZERJelJY?=
 =?utf-8?B?RkMwZFpNSS95Ly9YcWFFRzFGY05nOEY1cHZJNjFWcUp0aUVFUGxuQ0x0TFYw?=
 =?utf-8?B?eGtwT2lmdG5sdTNxdjZEanc4NVZXTldiRHZaMUxLWFkyYk4veHVVU3lWUnpB?=
 =?utf-8?B?N3pvaXcvWlgwSFJYRElzZW5CN3BHUHdNT1hpVTdKOXFNbGxZcWVKUlErME96?=
 =?utf-8?B?clNtZktSTnMyVFkwOWNvMkJiVU1jazd1NzRrNEt4MWFWYkJpcGRQRm9JblVF?=
 =?utf-8?B?V1VOSW9sNjY0MTBWUUtaMmYxajJEcGZNazg3VWM2cm1zTHNPRTlvN2REODB6?=
 =?utf-8?B?Rkl6eUtNc1JqV1paSUw2am1aa2FYZFJTdHRac0lxRlZkRkwwREFrQjVRbnZp?=
 =?utf-8?B?UytnWkZuMHZwT0JwMGVIdnZnb0M4TTlWR3hSL2xxdmJqTWFpQzdHRkpCQ2RZ?=
 =?utf-8?B?cWt4ZmhtNkpPaHIyUDNSaFMxc09pUjgwQnBrMFJGRlI0dUYzMnRheTBmL1l0?=
 =?utf-8?B?dWxzRXA2VzFFVWpHOGJiVkhsMDB1R1NNS2JQUFJ3S3JleG1ESzVMaml0ZmQ1?=
 =?utf-8?B?NFo4S3Zpa0xYby9ybEx1M0d6NFhJSXZZZVdSemVOSUlzbEtNZkFkczgwME5o?=
 =?utf-8?B?WTcvQkZUdGJkcFBqUE9XNnE3N0VWY3I3eHJoRm5GeFhtNWw3WEtCUmZ1dzR6?=
 =?utf-8?B?R3FIbzhvaE83OGRZQ0U3VnFqSjZBamdjZDE4OW9mdGUxeitXVmowWTZEZlFG?=
 =?utf-8?B?OGkzWXh4NFg1WnBMZmNPaUYvbjU0UDdyNFYvTlNhQTJBQnRKSEp0dlR2VlMx?=
 =?utf-8?B?LzFWY01TYkZ4VmJ0WHlIVWN1WEVOTHZXaXhPOWc0eFRjNzFwa245dTdLbDZE?=
 =?utf-8?B?aExXWS9NV2l3SDFCWHpTR3hCVHdEeEVIWlVJWmlGbmdXblQvUUNQazUyUkJJ?=
 =?utf-8?B?N2x6bEdTd0lKWHBFSGdHdjdWZmxtekJLRWpxZlJNTHp0VUl3cjRjUTkrQTZZ?=
 =?utf-8?B?U002V0xFQU0xb0E4Wm1EdFJtbjdvUGRCTERxa0QwTXNxWU1TaHpXMTBoYkdi?=
 =?utf-8?B?cjVYQjU3MWsraG9Pc0Y5dklQK2pNQTRBMWwxcnZHR3dBZXJ4RkF5MExrTzJn?=
 =?utf-8?B?cG9lVVNhdlc3WWEyNmNZeWFzWFNya3o0dURoQU1ZSFN1ajhqN05FbUNLRFpj?=
 =?utf-8?B?dURYWHM4OGR4bXJRb2Q4cHY5ckNYaTlQbGU2QTFPTEQ3TCtUUDM0azlvTmJw?=
 =?utf-8?B?VlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d8ad8de9-30d1-409b-cb75-08de16c7bf53
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 08:47:09.8514 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o5rQWaUNb5auaT0AsVVccjmcpi6o83KKznhZBvWIjAfekQ9OUahRWg7WwCnTBN6pgOQKQzWDlbBdH4LJE9oHbVsUGK3I9J0Gaa98W41JKVI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7584
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on wto [2025-paź-28 18:58:17 +0100]:
> In upcoming patches we will want to configure VF's execution
> quantum (EQ) on all GTs under single lock to avoid potential
> races in parallel GT configuration attempts.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 58 +++++++++++++++++-----
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h |  4 ++
>  2 files changed, 49 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> index c0c0215c0703..717f81e76b8c 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> @@ -1732,29 +1732,65 @@ static int pf_get_exec_quantum(struct xe_gt *gt, unsigned int vfid)
>  }
>  
>  /**
> - * xe_gt_sriov_pf_config_set_exec_quantum - Configure execution quantum for the VF.
> + * xe_gt_sriov_pf_config_set_exec_quantum_locked() - Configure execution quantum of the VF.
>   * @gt: the &xe_gt
>   * @vfid: the VF identifier
>   * @exec_quantum: requested execution quantum in milliseconds (0 is infinity)
>   *
> - * This function can only be called on PF.
> + * This function can only be called on PF with the master mutex hold.
> + * It will log the provisioned value or an error in case of the failure.
>   *
>   * Return: 0 on success or a negative error code on failure.
>   */
> -int xe_gt_sriov_pf_config_set_exec_quantum(struct xe_gt *gt, unsigned int vfid,
> -					   u32 exec_quantum)
> +int xe_gt_sriov_pf_config_set_exec_quantum_locked(struct xe_gt *gt, unsigned int vfid,
> +						  u32 exec_quantum)
>  {
>  	int err;
>  
> -	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
> +	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
> +
>  	err = pf_provision_exec_quantum(gt, vfid, exec_quantum);
> -	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
>  
>  	return pf_config_set_u32_done(gt, vfid, exec_quantum,
> -				      xe_gt_sriov_pf_config_get_exec_quantum(gt, vfid),
> +				      pf_get_exec_quantum(gt, vfid),
>  				      "execution quantum", exec_quantum_unit, err);
>  }
>  
> +/**
> + * xe_gt_sriov_pf_config_set_exec_quantum - Configure execution quantum for the VF.
> + * @gt: the &xe_gt
> + * @vfid: the VF identifier
> + * @exec_quantum: requested execution quantum in milliseconds (0 is infinity)
> + *
> + * This function can only be called on PF.
> + * It will log the provisioned value or na error in case of the failure.

typo: na -> an
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_gt_sriov_pf_config_set_exec_quantum(struct xe_gt *gt, unsigned int vfid,
> +					   u32 exec_quantum)
> +{
> +	guard(mutex)(xe_gt_sriov_pf_master_mutex(gt));
> +
> +	return xe_gt_sriov_pf_config_set_exec_quantum_locked(gt, vfid, exec_quantum);
> +}
> +
> +/**
> + * xe_gt_sriov_pf_config_get_exec_quantum_locked() - Get VF's execution quantum.
> + * @gt: the &xe_gt
> + * @vfid: the VF identifier
> + *
> + * This function can only be called on PF with the master mutex hold.
> + *
> + * Return: VF's (or PF's) execution quantum in milliseconds.
> + */
> +u32 xe_gt_sriov_pf_config_get_exec_quantum_locked(struct xe_gt *gt, unsigned int vfid)
> +{
> +	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
> +
> +	return pf_get_exec_quantum(gt, vfid);

NIT: Perhaps it would have been better to be consistent and call it the locked version here.

> +}
> +
>  /**
>   * xe_gt_sriov_pf_config_get_exec_quantum - Get VF's execution quantum.
>   * @gt: the &xe_gt
> @@ -1766,13 +1802,9 @@ int xe_gt_sriov_pf_config_set_exec_quantum(struct xe_gt *gt, unsigned int vfid,
>   */
>  u32 xe_gt_sriov_pf_config_get_exec_quantum(struct xe_gt *gt, unsigned int vfid)
>  {
> -	u32 exec_quantum;
> +	guard(mutex)(xe_gt_sriov_pf_master_mutex(gt));
>  
> -	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
> -	exec_quantum = pf_get_exec_quantum(gt, vfid);
> -	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
> -
> -	return exec_quantum;
> +	return pf_get_exec_quantum(gt, vfid);
>  }
>  
>  static const char *preempt_timeout_unit(u32 preempt_timeout)
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
> index 513e6512a575..b4beb5a97031 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
> @@ -40,6 +40,10 @@ int xe_gt_sriov_pf_config_bulk_set_lmem(struct xe_gt *gt, unsigned int vfid, uns
>  u32 xe_gt_sriov_pf_config_get_exec_quantum(struct xe_gt *gt, unsigned int vfid);
>  int xe_gt_sriov_pf_config_set_exec_quantum(struct xe_gt *gt, unsigned int vfid, u32 exec_quantum);
>  
> +u32 xe_gt_sriov_pf_config_get_exec_quantum_locked(struct xe_gt *gt, unsigned int vfid);
> +int xe_gt_sriov_pf_config_set_exec_quantum_locked(struct xe_gt *gt, unsigned int vfid,
> +						  u32 exec_quantum);
> +
>  u32 xe_gt_sriov_pf_config_get_preempt_timeout(struct xe_gt *gt, unsigned int vfid);
>  int xe_gt_sriov_pf_config_set_preempt_timeout(struct xe_gt *gt, unsigned int vfid,
>  					      u32 preempt_timeout);

but anyway it looks good:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

> -- 
> 2.47.1
> 

-- 

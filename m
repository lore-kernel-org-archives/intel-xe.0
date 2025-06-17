Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9166C71136
	for <intel-xe@archiver.kernel.org>; Tue, 17 Jun 2025 23:16:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9007410E08B;
	Tue, 17 Jun 2025 23:16:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NHD1DeJ/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8C7210E08B
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Jun 2025 23:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750202174; x=1781738174;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=EWbCLddJAYGSbmLYbkQfLaU8MFNLZi5wzGkDXMnK1+s=;
 b=NHD1DeJ/9zluvww9+CfvYZj7FenL1RWO5HDxfOeputulNlFUpFO6cjqN
 Bblj1XHkMwh4ncFfMTvg/Ug3fQhK+LLjR6aOciwKtPliLgWV7RrFuJ2Jq
 6soZ8Y5+LVBjelgdCKnDoJCSlw7eqTjVpRZ4TEfIhcgSNFCd7qq4XLe6+
 5bW++TUut/4FhXYlmy7EZiMnhvTLc+ANIljRXdDv9FcoDL4JjNnXm5axE
 qpIuzYxIX13SZn3xDbUD7ZA+5CE0QTvueDxOSekzRbhYyNVJOzF+IsAbG
 AQrCRAUt9jPNdwlxyz76X+rCXHpW/+uHVY5Wal828RpRUCLw1c2/j7OZW A==;
X-CSE-ConnectionGUID: WB9C9XOSRgSHCtbpPmRwlQ==
X-CSE-MsgGUID: MdDoFD4fTZSkJt2ENRijyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="63057080"
X-IronPort-AV: E=Sophos;i="6.16,244,1744095600"; d="scan'208";a="63057080"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 16:16:13 -0700
X-CSE-ConnectionGUID: AaI23fXBS4K12B6UDDT6Dw==
X-CSE-MsgGUID: KtP/i8L+RhqdDRiTrPynQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,244,1744095600"; d="scan'208";a="149376292"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 16:16:13 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 17 Jun 2025 16:16:12 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 17 Jun 2025 16:16:12 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.59)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 17 Jun 2025 16:16:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vw+CM+xyKT0v8u8CKc8RmXPFLgucapPd36WpVTFhHP12By6ANMa9l/vejOFN+cqLf8EfDoDED4IvLfIBb+MSxjOddjvQhZPQZu//ps1XW8s1JcRkgrw/ALXmAmkxaPLYX6lS/gg6sbTdvZECZRN+Q7/6cOI/f8lWQLTWDp5jMmyNJWbGmEaAA2fMQx/yBCxForbR7uT3Px/gawQZIam+v2eP3sOsuSsDV52Ytf8Y5d4aLN7K3g9y9OahDqy7HpnU0GVanyDBcw2Ul+gDUf4kF0p3nK5qf0CEfoxNKvt8/ei1B3naLU5IF23mpwr8j5EK3lXOrtGc0srwhWqRWBLSzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AiNDEfNhiofHEq8cKxkbVs42L+gmEh+0c0qX19hLzFY=;
 b=xwJJFIBvrewE1ERCqokRjauZv0yDAg1EYLSLauNmYZCHeyR7VP8JEkzwWu6sr1AZXf0WnW8Wy0lrpH0nGK6DAigUC4Mi5TVVISeO7zWUlgBgPW48vymp36GERad78ZkUW5/AoIJ0rL8M7ab22758WkIG0U4GX35CGTtMqQWiGxRfkFpmukSD65lJ1KMEnv79rmiXejanU+MM/xJSzj53dTOJRr6OErcE2hMFG4c60rcQcHaP9RKUhHeudlpERqGQuPRp/88hnV2NUnyIUwVjrz2epcGigvbuEb6Ta7544m2NCJgyD20n2P+RU0dQO90St08eapTMalaV0KQ7ri/E2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB6605.namprd11.prod.outlook.com (2603:10b6:510:1b0::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Tue, 17 Jun
 2025 23:16:08 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8857.016; Tue, 17 Jun 2025
 23:16:08 +0000
Date: Tue, 17 Jun 2025 16:17:45 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Matthew Auld <matthew.auld@intel.com>,
 =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>, Tomasz Lis
 <tomasz.lis@intel.com>
Subject: Re: [PATCH v7 2/3] drm/xe/vf: Attach and detach CCS copy commands
 with BO
Message-ID: <aFH3mV9QwP9/mhfA@lstrano-desk.jf.intel.com>
References: <20250616150805.26780-1-satyanarayana.k.v.p@intel.com>
 <20250616150805.26780-3-satyanarayana.k.v.p@intel.com>
 <aFH2ExQpaqn6SiQm@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aFH2ExQpaqn6SiQm@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: MW4PR03CA0196.namprd03.prod.outlook.com
 (2603:10b6:303:b8::21) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB6605:EE_
X-MS-Office365-Filtering-Correlation-Id: bcca748c-2253-4135-f4a8-08ddadf4f11a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YTBJejBuWUZiTHc4ZldiZEFvUHJOWWpCem4zVGlZcnZVWVp1RmxWelFoYTdG?=
 =?utf-8?B?RDMveGN1cE9RVHhVQTQ3dDBTQ0FyN29tbEp4Uk9KdWN3NXZnS0I4dkg2ZlZu?=
 =?utf-8?B?UmJZdkx4aUNMM1BKOXhEbUpaMmlZRGlVbXNuczBOTWt0NFBrWWxtKzNzcmtV?=
 =?utf-8?B?NENJb1BZWHFneFdVUWdwQ1hTTWw0Sk9ETEE0TVVmY1Fxa2NIdUlZbWloRE9z?=
 =?utf-8?B?OXZZRjc4NHVkdko0aE15ZmR4ZmxuNjNRN3FrSWhzcUEvalVkRHAxcit5Q3pM?=
 =?utf-8?B?eVhQbWxGM3R3Z3E1ekZOV0M0eGZjd2lyRUNPUEE0a1h4cVpHdk5qdkxTbFFF?=
 =?utf-8?B?Sm8vdC9aTjU2cDF4N2xuSkNIaHpwKy9ZN0VNZzhNWmN0dlRvQkoyb3NYdWRC?=
 =?utf-8?B?ZVNPWE1MUW11RCtOa2JNbjlxMmFIQXc5Ykl6cFJrUmZUQmFOZTlTbndVQndZ?=
 =?utf-8?B?bnkzVjhlQ0VodGZrMFFRRkI5Y1ZxbzJ2Nlkwa3BmQUtuUGdBMU5jZFZlMHN5?=
 =?utf-8?B?cnhpb01ucEtPT2ptb0Y2RnZmN0RGTDJDSUNpTnorWUh1U1NxcWxWT1BRQW43?=
 =?utf-8?B?eGo4N21NNEhvVW5PcDF1Y2dPMDBLRGdWRGw1aTgzblBvekk0TjBiTDJhU21E?=
 =?utf-8?B?Rk9nczFQdytRVkNZVGZtM3JQYmRuV1FpRDRYM2pTTlZaaXFMWUg5SExOU0Uw?=
 =?utf-8?B?cDg5WUZlbnMyWWJaQlF5L3FGcUp1T1dQRnNKVzJJWW5lQ3MwVU5vOExDMmYy?=
 =?utf-8?B?QWxOMFNRVkduTW5nVkdBbDlvWHpWS0pQTTFuY04xUHZLR3VtRUhmMTNicHBx?=
 =?utf-8?B?L05ZdUdIZ2QwQWtjR21Ia2h2MnpCMFk5YmRsLy83eTRGQ3VLTlpqb1YyVTRO?=
 =?utf-8?B?RTZYTGVDK2JjQnhrQ3BCa1F0bThkUG5FZ3MrM2dKQ1RRUVU3Y0Y2TjUvWFo3?=
 =?utf-8?B?d1hsZyt4ZDdydUk0NHN6TkNhYUxFS1dWajNMZzQraE93Umt3b0JJSDRFUmFp?=
 =?utf-8?B?bUZ4cDRTa3hvK3VPc3o1OFhXbFB0eThjTUE0R01QdllGSW1vQTRkQTVSVCtq?=
 =?utf-8?B?OHZWMjhEM2xqTENZalNZL1Y0aFIxd3JSUXI1VzVLTGk1R1ZxR0xBT2o4MENp?=
 =?utf-8?B?dUlzREtJYThtd2o3bUd3NXpJeFl3eW9aMDhvYnBpdExxMEZUeDY1ZVZrNUE5?=
 =?utf-8?B?ZmhJMjNpQ1dXY0xhSEtxbTVKSDNWcVZIVWZpcXNMWkttTW1aK3hTMjJvVElY?=
 =?utf-8?B?bUp5cndZS3dWd01uSVRHVUJJMk1uUmJIRGpkclZNcVRDeGc4Wk1Fa3dlZVpZ?=
 =?utf-8?B?amRjUjdNaTROd1YwQjFlNG1hNks3cWxmL1FzaHlIRXVKQ3l2dEtJcW1xdXAy?=
 =?utf-8?B?M0VtTHorRFdpY1V4NnJqMmYwckd3RmJ0RGJTcHdSZmVpNlViZ09PNml4b2FJ?=
 =?utf-8?B?Zi8wNlVVWWlRaU9oWkZiZnpFdzAzT1RtczA0ZElENS92WFBsS0pSTlJGWlVX?=
 =?utf-8?B?c1ptbzEvbmw1RHZOaUFlNVJ5TnhROFBaVkZWUDFLSHFWVnZGZXZ1Zkx1UzBw?=
 =?utf-8?B?YjNGeVBsNGt4SUdrRncwRSsrWnFuUmt4RG9uYWorRHRJbU5aWGxPQzRGejA4?=
 =?utf-8?B?K3I1MGZ6WVB0RzJHUC9zV2srN2VUa2hKaG5WSWQ1UWFNdk9qRktwQzMzRitB?=
 =?utf-8?B?SjUzRzF3enJoT1RYYkFzbXViOXlaczFYc0tCOERtbVRRTHNFYm5vbWlSRkFG?=
 =?utf-8?B?OXFuK0Z0K0pSNXFkZnZvSFdLOWJKcjBWcFlrWnpHcm9ON0M0VVpwSWlDUVJT?=
 =?utf-8?B?QysxcjFlMXhSaWRLMlJoaUFGWGZOR3ZQckFQUndjUEhTVU5kRFQwbWM1QmJR?=
 =?utf-8?B?REtJSnZuWFRYdEVGQWpWQ0U4Q1Uxd0dCRUxoNXdUeXBzcXRvNnV5YnBBdmpC?=
 =?utf-8?Q?SrxTW7DrEU8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SzlOV05LMjNMcEREY3g5aktVMXhIblFJanRNK0ZQUHBXRjcyYWp6REQ4T3E1?=
 =?utf-8?B?dzk4S3ZWWFBTRXZJYmZIVVZvSmlXakdqNE5KL0hIUitQUWoyVE82UXNsUEdW?=
 =?utf-8?B?aWQvSkI2M3FuTXliUVI3SG9nb1RxTW5vT1YxbG1DV0pOYVh0TFlYOFN6TXps?=
 =?utf-8?B?Ym5yYmpRZjVjcGhZQ05XbmJ6N25qWmhTL2hTeXA5TytVRFB5SGs0dXhEUlRT?=
 =?utf-8?B?Ky8zNlVPOGhTUng4Ny9JUUFZMEdLZUc4RC9QazdlZlBPRUFkZ09ZM3AyUity?=
 =?utf-8?B?MkNsMzNERFgvNHNjSll6b0hVeGFFeGNjUEFwTjNYZnF3c2dqeldhVDRROHh2?=
 =?utf-8?B?RGo2dDdIQU9OeEs5MUkvL3ZUN2t3RmtPeHFMMXpRMVRQczRuNWM1UFczcFNS?=
 =?utf-8?B?Y2ZyODM4KzY1UHdnQnlCVG9qRXVxK1p5dnl1algzQkQ1ckNmZWFYbnhJNTNw?=
 =?utf-8?B?Nld3Vmp0d0o0UkxNMkkxOGV0ckJGRHNmcjNRcjg3eXFTNXZ3ZFprdEdyMW1U?=
 =?utf-8?B?Um0vZHA4bk1XN1g2RmVoSUdISCtHaWorU3VUVGhHS2VCbEp2eGorMlZTbVJD?=
 =?utf-8?B?MjJrNkFIdzZHdEt6cG9YQ0xWYUVlRFBpc1N0SFFMNzdtdXUrSmJwU1c2bktP?=
 =?utf-8?B?enJRbmdUQU5HU21ncWR3SU9hSXBZd3dFbjgxNU5kRWphSytENERFVkllSE52?=
 =?utf-8?B?UmlQSTBCMERSV2tIaHZlbXJFU25NY3dpWUxJcnQzdXVsK0tTbmwrdEpPQ1JJ?=
 =?utf-8?B?S3g5NFFrelV5cFo1TEFUMGs4YUxKUFRSdll3cDYvMEtsQURGSEV2TE8zWmxo?=
 =?utf-8?B?Vlp2d0wwZnhkbTRHVDZOaWJpekdYYTF5MndrYWZtbm0ybnkxV2VaY01pejl3?=
 =?utf-8?B?eHRjYS9leXBPU3hjcEdBeUNURW5EcVdSK2IvTmQ5aExyNW5CNG5RYXBPaWoy?=
 =?utf-8?B?aDlzbnA4ZCtrc2c2WHRrdURBTnBUYVpnRG1BWHd3UkdGK2cvTXNLano5Tkxw?=
 =?utf-8?B?MVNtT0hrTG01UnFzV3lqWHRUeTVkMDhFeDVyczlYZW92QjVqWjJ4YVM5TG4v?=
 =?utf-8?B?QXhRSW8yY3F6N0JNRWtMWWM0V2d2bnZJc3JRcWEwNzV5SGNRa3MrVURDRGxJ?=
 =?utf-8?B?ZXlXRDF1aWh2enJoSEJNam1Odml5alNiai9ZdzIvK0FHaXVYd1hHbXZBeHFr?=
 =?utf-8?B?ZGI2QVY1MTZnRjJJSDFNaDMyeG9IVXBiQWNySFZndzdNdEp2Wml2UkU2cDYz?=
 =?utf-8?B?bU8vZnNJTzNUZCthV2pzYWJmTDI2aDZnbWI2MGJkbjdRMEpXYm5DL2dyRXNT?=
 =?utf-8?B?TzNGWGFDV0FJMm96cXZQY1hEenBCeTM2aS9pcWhYYWNHdzhUZlYxUUdJU1py?=
 =?utf-8?B?V1BUMFFBRFlzVjZOblBIbFZkVFg5RGVzTU5TbGVQdC96dzN1dzhtaXZNU1ZV?=
 =?utf-8?B?aktIMjJod3pQcTNMSDhmWUtOVzR4KysvV3dUaFNPVWRRVlFLZThmakcvRFNI?=
 =?utf-8?B?RWFHc05Rb2lNLzdodkxRcmYxam9WKzU0V1NOQmtEOUVoaDhqc2wrcHgvenZp?=
 =?utf-8?B?aWJ5djFqYU90R1BJc0QrbEdZb3VGYnl5YnQ0Rk1PdGUvck1CMi81dkJSOEZs?=
 =?utf-8?B?cTg1ZHpFT2R2dmVOZnVwYTlyMnhDWkpiYmxPMCtRMWZWMEtzbXdiV2EyUHlo?=
 =?utf-8?B?K2twZFlMOGdvbHpWWFRWbmRRRndRR3dPblphUXFwaUUzQkJWdHlmREszdVpo?=
 =?utf-8?B?d0ZwMHp5OWY1eExGb1FMS29ha0Y5UXUvZUcyS2FYeWtYTlhURXIrTlY4UjAy?=
 =?utf-8?B?WWJkb0p3djh6Q3EvRGVsVW9BYVpKUnJzUGxNTXdwMDBPck9GRHZvVmJMVkJn?=
 =?utf-8?B?S2Y4UmxQcm1IWGZOYmI4QUN4UkNVUHBNUms0Sk90Yll1M0llaEsxaGdOZEZF?=
 =?utf-8?B?bGtpdW1uRHpJMm1xSUcyaG90WDZpemtZYTNRM1N2UWlxQTZCRXJuaWNxZlRW?=
 =?utf-8?B?bkdMVUJHMFVueUx3QmFxUCsxeit6R1VnQnBCRzhFR0E4ZmozVzlFbkVPRXlQ?=
 =?utf-8?B?V01nd1lSLzF4ODlSVjhlb01kSFdLZ2UvaDVFMWFwRDc0OXdBekE5K0UwRUxq?=
 =?utf-8?B?M1k3RUxyQ1NtdmhHM0I3ZzVobHhjb0FsS1ZncG5xdlJRZXNweGpqcFJjZWt5?=
 =?utf-8?B?QUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bcca748c-2253-4135-f4a8-08ddadf4f11a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 23:16:08.7023 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ooUKeZNrlN24KfNbNFTskXQaCPh3JgQFYsU9zMuMK315XIy04r0/hUo54pbU6Bzt5cP9nuBxreCXeDOT/VLhIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6605
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

On Tue, Jun 17, 2025 at 04:11:15PM -0700, Matthew Brost wrote:
> On Mon, Jun 16, 2025 at 08:38:04PM +0530, Satyanarayana K V P wrote:
> > Attach CCS read/write copy commands to BO for old and new mem types as
> > NULL -> tt or system -> tt.
> > Detach the CCS read/write copy commands from BO while deleting ttm bo
> > from xe_ttm_bo_delete_mem_notify().
> > 
> > Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> > Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: Matthew Auld <matthew.auld@intel.com>
> > Cc: Michał Winiarski <michal.winiarski@intel.com>
> > ---
> > Cc: Tomasz Lis <tomasz.lis@intel.com>
> > 
> > V6 -> V7:
> > - Created xe_bb_ccs_realloc() to create a single BB instead of maintaining
> > a list. (Matthew Brost)
> > 
> > V5 -> V6:
> > - Removed dead code from xe_migrate_ccs_rw_copy() function. (Matthew Brost)
> > 
> > V4 -> V5:
> > - Create a list of BBs for the given BO and fixed memory leak while
> > detaching BOs. (Matthew Brost).
> > - Fixed review comments (Matthew Brost & Matthew Auld).
> > - Yet to cleanup xe_migrate_ccs_rw_copy() function.
> > 
> > V3 -> V4:
> > - Fixed issues reported by patchworks.
> > 
> > V2 -> V3:
> > - Attach and detach functions check for IS_VF_CCS_READY().
> > 
> > V1 -> V2:
> > - Fixed review comments.
> > ---
> >  drivers/gpu/drm/xe/xe_bb.c                 | 54 ++++++++++++
> >  drivers/gpu/drm/xe/xe_bb.h                 |  6 ++
> >  drivers/gpu/drm/xe/xe_bo.c                 | 23 ++++++
> >  drivers/gpu/drm/xe/xe_bo_types.h           |  3 +
> >  drivers/gpu/drm/xe/xe_migrate.c            | 95 ++++++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_migrate.h            |  6 ++
> >  drivers/gpu/drm/xe/xe_sriov_vf_ccs.c       | 72 ++++++++++++++++
> >  drivers/gpu/drm/xe/xe_sriov_vf_ccs.h       |  3 +
> >  drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h |  8 ++
> >  9 files changed, 270 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_bb.c b/drivers/gpu/drm/xe/xe_bb.c
> > index 9570672fce33..9a9c33c7362a 100644
> > --- a/drivers/gpu/drm/xe/xe_bb.c
> > +++ b/drivers/gpu/drm/xe/xe_bb.c
> > @@ -60,6 +60,60 @@ struct xe_bb *xe_bb_new(struct xe_gt *gt, u32 dwords, bool usm)
> >  	return ERR_PTR(err);
> >  }
> >  
> > +struct xe_bb *xe_bb_ccs_new(struct xe_gt *gt, u32 dwords,
> > +			    enum xe_sriov_vf_ccs_rw_ctxs ctx_id)
> > +{
> > +	struct xe_bb *bb = kmalloc(sizeof(*bb), GFP_KERNEL);
> > +	struct xe_tile *tile = gt_to_tile(gt);
> > +	struct xe_sa_manager *bb_pool;
> > +	int err;
> > +
> > +	if (!bb)
> > +		return ERR_PTR(-ENOMEM);
> > +
> > +	/*
> > +	 * We need to allocate space for the requested number of dwords,
> > +	 * one additional MI_BATCH_BUFFER_END dword, and additional buffer
> > +	 * space to accommodate the platform-specific hardware prefetch
> > +	 * requirements.
> > +	 */
> 
> This comment doesn't make sense as you don't insert a
> MI_BATCH_BUFFER_END instruction.
> 
> > +	bb_pool = tile->sriov.vf.ccs[ctx_id].mem.ccs_bb_pool;
> > +	bb->bo = xe_sa_bo_new(bb_pool, 4 * (dwords + 1) + bb_prefetch(gt));
> 
> I think you can skip the bb_prefetch here too. However when you insert
> the single MI_BATCH_BUFFER_END I think it actually needs go at BO size -
> bb_prefetch(gt). Also don't allow the SA to allocate from the last
> bb_prefetch(gt) in the BO. We could (and should) actually do this in our
> existing SA code too.
> 

I actually take that back the existing code should be changed - it is
actually right. In the existing code we dont things fetched into caches
which could potentially being modified by KMD and then subsequent job is
run looking at the stale values in the cache. In your new code, since
this entire BO is run in one shot, we don't have such a concern so my
suggestion of not including bb_prefetch() on each SA makes sense. So
does moving the single MI_BATCH_BUFFER_END to BO size - bb_prefetch(gt).

Matt

> > +
> > +	if (IS_ERR(bb->bo)) {
> > +		err = PTR_ERR(bb->bo);
> > +		goto err;
> > +	}
> > +
> > +	bb->cs = xe_sa_bo_cpu_addr(bb->bo);
> > +	bb->len = 0;
> > +
> > +	return bb;
> > +err:
> > +	kfree(bb);
> > +	return ERR_PTR(err);
> > +}
> > +
> > +struct xe_bb *xe_bb_ccs_realloc(struct xe_bb *bb, struct xe_gt *gt,
> > +				u32 dwords,
> > +				enum xe_sriov_vf_ccs_rw_ctxs ctx_id)
> 
> Not what I was suggesting.
> 
> > +{
> > +	struct xe_bb *new_bb;
> > +
> > +	if (!bb)
> > +		return xe_bb_ccs_new(gt, dwords, ctx_id);
> > +
> > +	new_bb = xe_bb_ccs_new(gt, dwords, ctx_id);
> > +	if (IS_ERR(new_bb))
> > +		return new_bb;
> > +
> > +	memcpy(new_bb->cs, bb->cs, bb->len * sizeof(u32));
> > +	new_bb->len = bb->len;
> > +	xe_bb_free(bb, NULL);
> > +
> > +	return new_bb;
> > +}
> > +
> >  static struct xe_sched_job *
> >  __xe_bb_create_job(struct xe_exec_queue *q, struct xe_bb *bb, u64 *addr)
> >  {
> > diff --git a/drivers/gpu/drm/xe/xe_bb.h b/drivers/gpu/drm/xe/xe_bb.h
> > index fafacd73dcc3..7dfe9422dfab 100644
> > --- a/drivers/gpu/drm/xe/xe_bb.h
> > +++ b/drivers/gpu/drm/xe/xe_bb.h
> > @@ -13,8 +13,14 @@ struct dma_fence;
> >  struct xe_gt;
> >  struct xe_exec_queue;
> >  struct xe_sched_job;
> > +enum xe_sriov_vf_ccs_rw_ctxs;
> >  
> >  struct xe_bb *xe_bb_new(struct xe_gt *gt, u32 size, bool usm);
> > +struct xe_bb *xe_bb_ccs_new(struct xe_gt *gt, u32 dwords,
> > +			    enum xe_sriov_vf_ccs_rw_ctxs ctx_id);
> > +struct xe_bb *xe_bb_ccs_realloc(struct xe_bb *bb, struct xe_gt *gt,
> > +				u32 dwords,
> > +				enum xe_sriov_vf_ccs_rw_ctxs ctx_id);
> >  struct xe_sched_job *xe_bb_create_job(struct xe_exec_queue *q,
> >  				      struct xe_bb *bb);
> >  struct xe_sched_job *xe_bb_create_migration_job(struct xe_exec_queue *q,
> > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> > index 4e39188a021a..beaf8544bf08 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.c
> > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > @@ -31,6 +31,7 @@
> >  #include "xe_pxp.h"
> >  #include "xe_res_cursor.h"
> >  #include "xe_shrinker.h"
> > +#include "xe_sriov_vf_ccs.h"
> >  #include "xe_trace_bo.h"
> >  #include "xe_ttm_stolen_mgr.h"
> >  #include "xe_vm.h"
> > @@ -947,6 +948,20 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
> >  	dma_fence_put(fence);
> >  	xe_pm_runtime_put(xe);
> >  
> > +	/*
> > +	 * CCS meta data is migrated from TT -> SMEM. So, let us detach the
> > +	 * BBs from BO as it is no longer needed.
> > +	 */
> > +	if (IS_VF_CCS_BB_VALID(xe, bo) && old_mem_type == XE_PL_TT &&
> > +	    new_mem->mem_type == XE_PL_SYSTEM)
> > +		xe_sriov_vf_ccs_detach_bo(bo);
> > +
> > +	if (IS_SRIOV_VF(xe) &&
> > +	    ((move_lacks_source && new_mem->mem_type == XE_PL_TT) ||
> > +	     (old_mem_type == XE_PL_SYSTEM && new_mem->mem_type == XE_PL_TT)) &&
> > +	    handle_system_ccs)
> > +		ret = xe_sriov_vf_ccs_attach_bo(bo);
> > +
> >  out:
> >  	if ((!ttm_bo->resource || ttm_bo->resource->mem_type == XE_PL_SYSTEM) &&
> >  	    ttm_bo->ttm) {
> > @@ -957,6 +972,9 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
> >  		if (timeout < 0)
> >  			ret = timeout;
> >  
> > +		if (IS_VF_CCS_BB_VALID(xe, bo))
> > +			xe_sriov_vf_ccs_detach_bo(bo);
> > +
> >  		xe_tt_unmap_sg(xe, ttm_bo->ttm);
> >  	}
> >  
> > @@ -1483,9 +1501,14 @@ static void xe_ttm_bo_release_notify(struct ttm_buffer_object *ttm_bo)
> >  
> >  static void xe_ttm_bo_delete_mem_notify(struct ttm_buffer_object *ttm_bo)
> >  {
> > +	struct xe_bo *bo = ttm_to_xe_bo(ttm_bo);
> > +
> >  	if (!xe_bo_is_xe_bo(ttm_bo))
> >  		return;
> >  
> > +	if (IS_VF_CCS_BB_VALID(ttm_to_xe_device(ttm_bo->bdev), bo))
> > +		xe_sriov_vf_ccs_detach_bo(bo);
> > +
> >  	/*
> >  	 * Object is idle and about to be destroyed. Release the
> >  	 * dma-buf attachment.
> > diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
> > index eb5e83c5f233..642e519fcfd1 100644
> > --- a/drivers/gpu/drm/xe/xe_bo_types.h
> > +++ b/drivers/gpu/drm/xe/xe_bo_types.h
> > @@ -78,6 +78,9 @@ struct xe_bo {
> >  	/** @ccs_cleared */
> >  	bool ccs_cleared;
> >  
> > +	/** @bb_ccs_rw: BB instructions of CCS read/write. Valid only for VF */
> > +	struct xe_bb *bb_ccs[XE_SRIOV_VF_CCS_CTX_COUNT];
> > +
> >  	/**
> >  	 * @cpu_caching: CPU caching mode. Currently only used for userspace
> >  	 * objects. Exceptions are system memory on DGFX, which is always
> > diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> > index 8f8e9fdfb2a8..6c30b106b817 100644
> > --- a/drivers/gpu/drm/xe/xe_migrate.c
> > +++ b/drivers/gpu/drm/xe/xe_migrate.c
> > @@ -940,6 +940,101 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
> >  	return fence;
> >  }
> >  
> > +/**
> > + * xe_migrate_ccs_rw_copy() - Copy content of TTM resources.
> > + * @m: The migration context.
> > + * @src_bo: The buffer object @src is currently bound to.
> > + * @read_write : Creates BB commands for CCS read/write.
> > + *
> > + * Creates batch buffer instructions to copy CCS metadata from CCS pool to
> > + * memory and vice versa.
> > + *
> > + * This function should only be called for IGPU.
> > + *
> > + * Return: 0 if successful, negative error code on failure.
> > + */
> > +int xe_migrate_ccs_rw_copy(struct xe_migrate *m,
> > +			   struct xe_bo *src_bo,
> > +			   enum xe_sriov_vf_ccs_rw_ctxs read_write)
> > +
> > +{
> > +	bool src_is_pltt = read_write == XE_SRIOV_VF_CCS_WRITE_CTX;
> > +	bool dst_is_pltt = read_write == XE_SRIOV_VF_CCS_READ_CTX;
> > +	struct ttm_resource *src = src_bo->ttm.resource;
> > +	struct xe_gt *gt = m->tile->primary_gt;
> > +	struct xe_device *xe = gt_to_xe(gt);
> > +	struct xe_res_cursor src_it, ccs_it;
> > +	u64 size = src_bo->size;
> > +	struct xe_bb *bb = NULL;
> > +	u64 src_L0, src_L0_ofs;
> > +	u32 batch_size;
> > +	u32 src_L0_pt;
> > +	int err;
> > +
> > +	xe_res_first_sg(xe_bo_sg(src_bo), 0, size, &src_it);
> > +
> > +	xe_res_first_sg(xe_bo_sg(src_bo), xe_bo_ccs_pages_start(src_bo),
> > +			PAGE_ALIGN(xe_device_ccs_bytes(xe, size)),
> > +			&ccs_it);
> > +
> > +	batch_size = 0;
> > +	while (size) {
> > +		batch_size += 8; /* arb_clear() + MI_BATCH_BUFFER_END + Flush + NOP */
> 
> This comment / math doesn't make sense arb_clear() +
> MI_BATCH_BUFFER_END, rather just 2 flushes. I think a value 6 is
> actually correct too as that is the size of the 2 flushes.
> 
> > +		u32 flush_flags = 0;
> > +		u64 ccs_ofs, ccs_size;
> > +		u32 ccs_pt;
> > +
> > +		u32 avail_pts = max_mem_transfer_per_pass(xe) / LEVEL0_PAGE_TABLE_ENCODE_SIZE;
> > +
> > +		src_L0 = xe_migrate_res_sizes(m, &src_it);
> > +
> > +		batch_size += pte_update_size(m, false, src, &src_it, &src_L0,
> > +					      &src_L0_ofs, &src_L0_pt, 0, 0,
> > +					      avail_pts);
> > +
> > +		ccs_size = xe_device_ccs_bytes(xe, src_L0);
> > +		batch_size += pte_update_size(m, 0, NULL, &ccs_it, &ccs_size, &ccs_ofs,
> > +					      &ccs_pt, 0, avail_pts, avail_pts);
> > +		xe_assert(xe, IS_ALIGNED(ccs_it.start, PAGE_SIZE));
> > +
> > +		/* Add copy commands size here */
> > +		batch_size += EMIT_COPY_CCS_DW;
> > +
> 
> This is where you should split the loop. All of the above is loop
> calculate the size of BB.
> 
> Then allocate the BB, reset iterators, size to initial value.
> 
> All of the below is 2nd loop which emits instructions.
> 
> > +		bb = xe_bb_ccs_realloc(bb, gt, batch_size, read_write);
> 
> Again, no realloc, rather just a single BB allocation.
> 
> > +		if (IS_ERR(bb)) {
> > +			drm_err(&xe->drm, "BB allocation failed.\n");
> > +			err = PTR_ERR(bb);
> > +			goto err_ret;
> > +		}
> > +
> > +		emit_pte(m, bb, src_L0_pt, false, true, &src_it, src_L0, src);
> > +
> > +		emit_pte(m, bb, ccs_pt, false, false, &ccs_it, ccs_size, src);
> > +
> > +		bb->cs[bb->len++] = MI_FLUSH_DW | MI_INVALIDATE_TLB | MI_FLUSH_DW_OP_STOREDW |
> > +					MI_FLUSH_IMM_DW;
> > +		bb->cs[bb->len++] = MI_NOOP;
> > +		bb->cs[bb->len++] = MI_NOOP;
> > +
> > +		flush_flags = xe_migrate_ccs_copy(m, bb, src_L0_ofs, src_is_pltt,
> > +						  src_L0_ofs, dst_is_pltt,
> > +						  src_L0, ccs_ofs, true);
> > +
> > +		bb->cs[bb->len++] = MI_FLUSH_DW | MI_INVALIDATE_TLB | MI_FLUSH_DW_OP_STOREDW |
> > +					MI_FLUSH_IMM_DW | flush_flags;
> > +		bb->cs[bb->len++] = MI_NOOP;
> > +		bb->cs[bb->len++] = MI_NOOP;
> > +
> > +		src_bo->bb_ccs[read_write] = bb;
> 
> Maybe an assert when storing the BB bb->len == calculated size do ensure
> our math is correct.
> 
> Matt
> 
> > +
> > +		size -= src_L0;
> > +	}
> > +	return 0;
> > +
> > +err_ret:
> > +	return err;
> > +}
> > +
> >  static void emit_clear_link_copy(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
> >  				 u32 size, u32 pitch)
> >  {
> > diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
> > index fb9839c1bae0..96b0449e7edb 100644
> > --- a/drivers/gpu/drm/xe/xe_migrate.h
> > +++ b/drivers/gpu/drm/xe/xe_migrate.h
> > @@ -24,6 +24,8 @@ struct xe_vm;
> >  struct xe_vm_pgtable_update;
> >  struct xe_vma;
> >  
> > +enum xe_sriov_vf_ccs_rw_ctxs;
> > +
> >  /**
> >   * struct xe_migrate_pt_update_ops - Callbacks for the
> >   * xe_migrate_update_pgtables() function.
> > @@ -112,6 +114,10 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
> >  				  struct ttm_resource *dst,
> >  				  bool copy_only_ccs);
> >  
> > +int xe_migrate_ccs_rw_copy(struct xe_migrate *m,
> > +			   struct xe_bo *src_bo,
> > +			   enum xe_sriov_vf_ccs_rw_ctxs read_write);
> > +
> >  int xe_migrate_access_memory(struct xe_migrate *m, struct xe_bo *bo,
> >  			     unsigned long offset, void *buf, int len,
> >  			     int write);
> > diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> > index ff5ad472eb96..3e37cb95ff32 100644
> > --- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> > +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> > @@ -5,6 +5,7 @@
> >  
> >  #include "instructions/xe_mi_commands.h"
> >  #include "instructions/xe_gpu_commands.h"
> > +#include "xe_bb.h"
> >  #include "xe_bo.h"
> >  #include "xe_device.h"
> >  #include "xe_migrate.h"
> > @@ -208,3 +209,74 @@ int xe_sriov_vf_ccs_init(struct xe_device *xe)
> >  err_ret:
> >  	return err;
> >  }
> > +
> > +/**
> > + * xe_sriov_vf_ccs_attach_bo - Insert CCS read write commands in the BO.
> > + * @bo: the &buffer object to which batch buffer commands will be added.
> > + *
> > + * This function shall be called only by VF. It inserts the PTEs and copy
> > + * command instructions in the BO by calling xe_migrate_ccs_rw_copy()
> > + * function.
> > + *
> > + * Returns: 0 if successful, negative error code on failure.
> > + */
> > +int xe_sriov_vf_ccs_attach_bo(struct xe_bo *bo)
> > +{
> > +	struct xe_device *xe = xe_bo_device(bo);
> > +	enum xe_sriov_vf_ccs_rw_ctxs ctx_id;
> > +	struct xe_migrate *migrate;
> > +	struct xe_tile *tile;
> > +	struct xe_bb *bb;
> > +	int tile_id;
> > +	int err = 0;
> > +
> > +	if (!IS_VF_CCS_READY(xe))
> > +		return 0;
> > +
> > +	for_each_tile(tile, xe, tile_id) {
> > +		for_each_ccs_rw_ctx(ctx_id) {
> > +			bb = bo->bb_ccs[ctx_id];
> > +			if (bb)
> > +				xe_sriov_err(xe, "Probable memory leak\n");
> > +
> > +			migrate = tile->sriov.vf.ccs[ctx_id].migrate;
> > +			err = xe_migrate_ccs_rw_copy(migrate, bo, ctx_id);
> > +		}
> > +	}
> > +	return err;
> > +}
> > +
> > +/**
> > + * xe_sriov_vf_ccs_detach_bo - Remove CCS read write commands from the BO.
> > + * @bo: the &buffer object from which batch buffer commands will be removed.
> > + *
> > + * This function shall be called only by VF. It removes the PTEs and copy
> > + * command instructions from the BO. Make sure to update the BB with MI_NOOP
> > + * before freeing.
> > + *
> > + * Returns: 0 if successful.
> > + */
> > +int xe_sriov_vf_ccs_detach_bo(struct xe_bo *bo)
> > +{
> > +	struct xe_device *xe = xe_bo_device(bo);
> > +	enum xe_sriov_vf_ccs_rw_ctxs ctx_id;
> > +	struct xe_bb *bb;
> > +	struct xe_tile *tile;
> > +	int tile_id;
> > +
> > +	if (!IS_VF_CCS_READY(xe))
> > +		return 0;
> > +
> > +	for_each_tile(tile, xe, tile_id) {
> > +		for_each_ccs_rw_ctx(ctx_id) {
> > +			bb = bo->bb_ccs[ctx_id];
> > +			if (!bb)
> > +				continue;
> > +
> > +			memset(bb->cs, MI_NOOP, bb->len * sizeof(u32));
> > +			xe_bb_free(bb, NULL);
> > +			bo->bb_ccs[ctx_id] = NULL;
> > +		}
> > +	}
> > +	return 0;
> > +}
> > diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
> > index 5df9ba028d14..5d5e4bd25904 100644
> > --- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
> > +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
> > @@ -7,7 +7,10 @@
> >  #define _XE_SRIOV_VF_CCS_H_
> >  
> >  struct xe_device;
> > +struct xe_bo;
> >  
> >  int xe_sriov_vf_ccs_init(struct xe_device *xe);
> > +int xe_sriov_vf_ccs_attach_bo(struct xe_bo *bo);
> > +int xe_sriov_vf_ccs_detach_bo(struct xe_bo *bo);
> >  
> >  #endif
> > diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h b/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
> > index 6dc279d206ec..e240f3fd18af 100644
> > --- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
> > +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
> > @@ -27,6 +27,14 @@ enum xe_sriov_vf_ccs_rw_ctxs {
> >  	XE_SRIOV_VF_CCS_CTX_COUNT
> >  };
> >  
> > +#define IS_VF_CCS_BB_VALID(xe, bo) ({ \
> > +		struct xe_device *___xe = (xe); \
> > +		struct xe_bo *___bo = (bo); \
> > +		IS_SRIOV_VF(___xe) && \
> > +		___bo->bb_ccs[XE_SRIOV_VF_CCS_READ_CTX] && \
> > +		___bo->bb_ccs[XE_SRIOV_VF_CCS_WRITE_CTX]; \
> > +		})
> > +
> >  struct xe_migrate;
> >  struct xe_sa_manager;
> >  
> > -- 
> > 2.43.0
> > 

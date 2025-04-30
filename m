Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB45DC3ABAC
	for <intel-xe@archiver.kernel.org>; Wed, 30 Apr 2025 18:28:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FC6E10E29A;
	Wed, 30 Apr 2025 18:28:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KF2J5nzO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D65A10E29A
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Apr 2025 18:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746037737; x=1777573737;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=xsyRbZ/K1BSKmQ65du74OQqVM7uJsVe8YRYy2TiSynE=;
 b=KF2J5nzOTvp1sNWgwchiIGzPNfDeO//B3xwPAu544Tb6a2nJpXskoVjF
 GLIFAQNBF3sKCTThDxsk531ln9zq7qvBIlPLS0UPLYiXWmn/omHCWAxKv
 mbWLkCjR19iYnE8f+8/mhuArDUgAlqFfhJGdyD9iTKg+e1NPw1SvBcC5E
 m4slErQvCkCxDmYfXWLB2dBBu+WkNo5zwCCggSgd0gvWAlb45J5ngA8RD
 6xA5ta+HhtEJ2Ij/he94vTmnoGwEv0gxBnzS3IYO9K2/FoNG1ju4q6Ohc
 s0Ydtvnjxf2QhSflY6vA3NVjuewsHayfbzt7RYkZX7iCLX7FoM0OMpxiz Q==;
X-CSE-ConnectionGUID: XfUyoP9URyKS+ocaopLY3Q==
X-CSE-MsgGUID: jwUV8FMvSvKUTFoHWLwN8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11419"; a="35329180"
X-IronPort-AV: E=Sophos;i="6.15,252,1739865600"; d="scan'208";a="35329180"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2025 11:28:56 -0700
X-CSE-ConnectionGUID: 4ZKaVreBQtK+da+9S8KYKQ==
X-CSE-MsgGUID: +nr03Hx7QrmNTrmtDkighA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,252,1739865600"; d="scan'208";a="139324720"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2025 11:28:56 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 30 Apr 2025 11:28:55 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 30 Apr 2025 11:28:55 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.176)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 30 Apr 2025 11:28:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QTGKKm3xyJBkJqAWXGhmnqhMwIlCjWKkxu/MoT292Us1TkE433n8bXzCT0MQSsYTK5xEuuAur4F2iuWdffwLNCewSrFptGLkEyMB3gWDsgyLjPlMh7iMluQd9kIHbWxh00zb9fdDadFecDbBha5by3mYhtncp6YIPDKTSs2dUq7aUmxxcBgaCfOcMhwXxqhSL6PJCwr3aMT3Y3xCqXhu4UQFELzp4wP1BzpeapIbUFa6EZXlHbbt8nvre4sksUisVFzjVQwyemX9HJYVo6CKqaadwAO5QmJ/3QGBGI9HXTO2q90eAxf8BN4YCvJLeSkzVjFExY1wRvpeKV7I4k6jAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uaj1sXx3aMZPshyptmdsU+dzvU6PE4OsqTJj4oMQnKs=;
 b=dKHraGNjO46vwT9BHmtfIUrKXoaswIwmqhGBia0pHFl8J5H2jOxbpj6K713kwRjoUZUXeaAeGxnu3T84L3KbvWWYSpUduHhUKFIcl/wyIAgMJ29WM+Vjqyxhav8OgZmj+SmkhboyBzgJRNH8xcSn7sblFunVg3cO9fSLtEsTWhYRYrkVAJoR1hTprSD83TYpAwKFml41fZ5v/DliZPUWXDRITdWKrf6/kZy0YLDasPxnKI0deXAYdHY6X+uNAvRvHznsYM2sN8rLAJeJYMU955OLrJ7oUkWC2NDdxWmJc3m1n/J9lKwuNL8DGg2Sk2UM4SE77Ir1nTyHklk+3xUTCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SA2PR11MB4875.namprd11.prod.outlook.com (2603:10b6:806:11a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Wed, 30 Apr
 2025 18:28:51 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8699.012; Wed, 30 Apr 2025
 18:28:51 +0000
Date: Wed, 30 Apr 2025 11:28:40 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matt Roper <matthew.d.roper@intel.com>, 
 Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH] drm/xe: Add WA BB to capture active context utilization
Message-ID: <aBJr2IosrFA_zGNR@unerlige-desk.amr.corp.intel.com>
References: <20250425191039.1551559-1-umesh.nerlige.ramappa@intel.com>
 <5j337myfuaurqwhfswcv52vx652lqws4rqg7gpnydkk3hdif45@mgv2ptjocqx5>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <5j337myfuaurqwhfswcv52vx652lqws4rqg7gpnydkk3hdif45@mgv2ptjocqx5>
X-ClientProxiedBy: MW4PR03CA0144.namprd03.prod.outlook.com
 (2603:10b6:303:8c::29) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SA2PR11MB4875:EE_
X-MS-Office365-Filtering-Correlation-Id: 91aecf8c-ca2f-4eb0-838e-08dd8814dac4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UWl6ODF0Z2NBUHhieitEdFVWMC91dFpqSkhTSWlNYnIwT1V6cmV5OGNnMXlp?=
 =?utf-8?B?T1IrejhpanQzOVlvZmlJTSszbEtUN0xZRVJTVGtRckttV002ZUUwZ2JQWkcw?=
 =?utf-8?B?NE1nQUErZ1ltZnhEbnFuMmd2cmZ0aVZPK1JWenhxTlFZOTJENW1XN1JPcHFI?=
 =?utf-8?B?cmllSmpGd3gwU1g4Q0tNbURvTnNMZFRyWmtVNFVmcFNHWDU4cmNiZ3Q2M0xx?=
 =?utf-8?B?YlJPa1YzTlloby8rQTdESUFndEN2aisxQWlQaW5nYWhyeWRENmtwVGZiVmMr?=
 =?utf-8?B?RnRqdjFaV042emM2N0hFUzRSeEpITURLVVA4b0tIYXZPaEdaVkVPNk9OYWo5?=
 =?utf-8?B?ZS94bE5EZmtITjQ3NWZmQ0NDRHhyMlROVEoxeUJxclpXeGlmOERJWlkrS1pI?=
 =?utf-8?B?V09ya3ByRDVUeG9DT1FBQ3hYMkt3Q0RuMVV1QUxnaUhxOFExV3E2QnU5eWR4?=
 =?utf-8?B?V1JBUlJPWks5Vi9QQzZ5MXFpaGN3dGh0dEQ2SDFtdE1ZcEloSVgwV1ZoWkpW?=
 =?utf-8?B?c1QybXpmcm5VMEZZamJyY1Q1d0tiVVNvYkk2RXEwQTlWd3BzVFk2eDFkRmxG?=
 =?utf-8?B?b1ZlS1R5Q3JBUkp2V3VBYWFENEQ3R1pRRCt3UHBHZTBrQWJ3eCticlR0QmJV?=
 =?utf-8?B?amxqNEVnMlEvV0tHL0ppLzd6U0dkU3YrUWhCNHdjdWVvR0h2d2hWaWliNWxS?=
 =?utf-8?B?OWg2cHZsVjJXNWMyOVZTd05QK1dzVnprR05yVnl6WXNteFBITzBUbXM4NHFN?=
 =?utf-8?B?WDlPSGlwOTB1N1VFVHBDUDB5WkRuQUZWTjl2OTlBaGQ3bkYrMjgyTUVIUjlq?=
 =?utf-8?B?SjJsb0VvOVdJejlIcW5jR0Z4RXZZdFpMMlZ4cjIxZ25aVE9NN1VSLzYyNzA3?=
 =?utf-8?B?Qm1YR0FTRDk2VWRmSFhMQmJ0YXRpRXoxY1RaWmxTTFhwZFRFeHpJTksrMXds?=
 =?utf-8?B?K0xCaEJ1cHdETWtxZ1dwWU0rL29DNWk2Yys2a25hZng0U2lBNEQ3T3hqYnhp?=
 =?utf-8?B?aFpSRjdyLzc2RWloYXF2ZGJtK1hTVjRldUpkWmhXWmRZNkQ5eldNV0JjbDAw?=
 =?utf-8?B?cnhORkY5V1c1NjZWV0FiSS9iWWN1Tkw2REZ2NGZ4VzRzUElpdDQwZXloRko0?=
 =?utf-8?B?L2ZKTXgzcFByUS9RcG9SY3I1S2kvMW9lcURaM3V6dzlPdCsrcnZUc2RmRDRT?=
 =?utf-8?B?Qjd2Uy9tcWpNZVFSUkNlWDJmbjN5ay9UMUpYMk11eFI5WnhNdllnR3hIQ2xD?=
 =?utf-8?B?dWlqdkVDbUd3Rkc4ZGE2bEpDMXJHMGNMNUVoZDMrVHhLLzRGb0V2a3BFcFdO?=
 =?utf-8?B?MU1wSXZtTXFwamdqaUFOejZaSHNPUXl2T0p2blJ4clgxcjlEYWRyRm5jWkZx?=
 =?utf-8?B?VFMyeFBjMWpMTlcrZjhDMG9WWTFkMC9Dcm4ydU5VRS94RUczNzBDMis5c3JJ?=
 =?utf-8?B?WVVuREE1ZnZ2Y2RCbWpKeXdYTTNRaEptaHphdy9zYUtBY3BwYkY4ZDdUcWpr?=
 =?utf-8?B?NFZOZWRlWGdqM0hRYUdVVkJMdVRaNXN0RjAyN25LSWxWSUFRakRtNityUkEx?=
 =?utf-8?B?bnhUR1RsNTc3WG1xMGMvMTNVM1dnMktESExUM1R5NUR6ZU1NV3ltMHUvbWo2?=
 =?utf-8?B?K1FpL2R0b3pHZEpqWVNBc3JUVHdEelZLUVhOdGV2eFJTMDVpL0N1ZW83Q2Zl?=
 =?utf-8?B?TFJPaE5wZG1SdTQ0MldYai9xa1pkbWh3d3FJeDJhUHR0SnNsWWhmc1ZScllP?=
 =?utf-8?B?eEcwVFoyNzhNallMS3Q3eU1TTC9pVGtaU2hKSzByVDc1cm5IRit2L1U4VUZV?=
 =?utf-8?B?c0g5eVl2NWc5eGs2TmVOajlRSU4zcy9yNGNyMHU1RmJ1eUxGd25waHJLOFJC?=
 =?utf-8?B?T2M3M054Nk9lbkNxd3lLRlNUV1BtMDVUYnZudVhlQjlPSWc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YzlrL2pXWWZJS1duM0FjUnNLM1hxLy95Q0lYN1VJNkdzZllUM1g2UWZURTlL?=
 =?utf-8?B?Z05ETHhvVHh5cFoyQzFjakZrYTRWSzNpL3l2aG9OU2JzKzd5WitTU2FLczZu?=
 =?utf-8?B?RUpWcUhlaVI4RjFOWVdDdU0zYXM1cHpSamR2SURraDc1OU1hbHRQY1V2WWR2?=
 =?utf-8?B?d1lVT3JOWGN4T0tPekFYVnMvT1FPVStIa1lrNDJyRjJwenlDbVpTVEhBTllI?=
 =?utf-8?B?Z3JHdHJPRDNaUWxDRXIySTV0NUszV1RKeUpTbUlDRVM3dmRBamVBY0ZZOXFw?=
 =?utf-8?B?TzhlUFRrV1FIUU9DeHdNSkNjVzVKVW1pcWpjU0g1TUVDaVZyWTk2NlVUL1V6?=
 =?utf-8?B?NFljdGJleEovVWU5UGhGOEZSUnZFY202MnlBSWFGVEFqUkl5N2NqSnRTUnRD?=
 =?utf-8?B?dUd1TjZ4ZzdrdDBQVWhxWkQ5eUduTFBUcStGbDNuaFBMMEJXdTZpZ3RiWmdU?=
 =?utf-8?B?cUlPL2wyYkR5cmJXd2tGQWxTNGdxdHdrTWQ3TUh1VHFDYndRQStLcXhiVWhT?=
 =?utf-8?B?TStPWHhTTVFmR1B1VkRRNkZxd1BiKzVRa21Vb2IzRm9IRFFLMDUyYU95ekxP?=
 =?utf-8?B?N0hUeEJ2S1l3ZnZPUllhbkVsVkhJclhzdjFPK3YyaWh5eEZZNXN0b1U4N2lI?=
 =?utf-8?B?VExRbG44bkNTS09lVitjb2M4TWJENHI1ZG42MDJPV0ZHL3Y4QnNJRUtQNEVI?=
 =?utf-8?B?ZkNBdldoTWdieFMrUjZac0JpVmt4RDd5Yldrc2FpbDFJSjdxRGh3bHFUbHdM?=
 =?utf-8?B?NCtTOGxQdGZRcG9YSlVETCtxQ0hCZHl5RGZMZ01WWFZnVVBIT0lHMVgrSExo?=
 =?utf-8?B?OUFjbC9xTE50NEFVVXN0M0duVk1xYVhKZ3NYcGRVSVVxQW1pOWI1Tko4QWNL?=
 =?utf-8?B?cFMwdlQ0c0FVZnlqMmVTZ3FkbWx5OTF4RTFmREU0Nnh1OG1tUENEbWdWWTFz?=
 =?utf-8?B?VWo5Zjd5Ykx4b212UEpaQVlVeDBQcVlHaWY1ZWhhbzlxb3VBSkJqVkQvWkZK?=
 =?utf-8?B?bWQyRFNrSUtROHFuYXUzWmVDUGRYVUIyQ1lrc29PQnk0a1BZamJmTG9aaVIx?=
 =?utf-8?B?c1JJajhYYS8zYnR1T1p4Kzc3V1pUWUpQSytDclJOVWU1WFhtaWtmMjlWcjlr?=
 =?utf-8?B?cVhXdm9QWlNxaGRoK3F6SWJQRk96NHZ5S21GTTkwVnovSkFjRVdKOU45M2Ri?=
 =?utf-8?B?OE1ZazlYNnU5MEZrZ0RHYk5Ga3dHUEJOWGpVM0hBai82SUlXeVFESlBOVWc0?=
 =?utf-8?B?UFpyVHc1RWlobnJsMSt5VGVXTlFRT3dERlpRZjh0QUw1enpVbkR5ZW1WY3Y2?=
 =?utf-8?B?d1BseG03K0NFVlF1dXU2WW9XZGhMWCs3QzVRSHRQeVhkRWM5eU5zdUlJQ0Uy?=
 =?utf-8?B?Y01mYytJRlRhRVMrbFpLcnZKaWNkTytsOWl6L2piQkRLUVU2QjRFazBPLy8r?=
 =?utf-8?B?K1JrRTUzaEI4UVdQMjQwQ0FVUWtSOEN4V25lS0p2WEhtYmZhc2U1UFBERUVj?=
 =?utf-8?B?K05kUDAvbVN1ck14MnROejlSaXpYbHdhSkxUeTB2NmJLQW9ZNGZ2Z2VtTzJZ?=
 =?utf-8?B?U1ZPd3pCRm5hcnZ6NGdVTUxLeXYwUXMzb2lKWVdNVytVdUFzU29ZV3Y1WkFT?=
 =?utf-8?B?WUJyM09HYS9OaXVnaTFwa0NCZjFhb0t0RU1EQjB0d3BPTG5qQk5pQ25RSFNC?=
 =?utf-8?B?Zm52aTAyZjY5YjNtd09lU0VvRE8zekhCSHA2ZjF0WVduRlNqVHd4U0JodDFB?=
 =?utf-8?B?Y0xKdGFXZ1c0NjJaczBuNkVXSENRVlpLeTh2MjluSHlxM2pQcEIxOC9VcFE0?=
 =?utf-8?B?eFR0S1dRLzd1c1I0YzhIbGtlUWhkanJSeGZvV0g2TjB2TkZONWhJd2pENGFL?=
 =?utf-8?B?alFCUjZVVTNoaFBNcHJNcGh0RzM3M0FvTUJ5M1JQb2xNbUM4OERkcEFjR3pQ?=
 =?utf-8?B?ZXM4RERHODVXMGF3S21ZVUFLOUtsaXNNWlR2clJHZDNjV2ZyMzhaVzE3elJ6?=
 =?utf-8?B?S1BPKzMzaWZwSjNOVFFHc0lnY04rYkdJOFJMRVl3RzF1cmZQdzhkak5ocXB5?=
 =?utf-8?B?TmhRYWVNTVhHMWJsekFUN1R6OXdTVnNQRnlMUTE1eEV6aU1DNGR5aXdHTmpp?=
 =?utf-8?B?cFFHQWlhUW5zSHVKRi9KQlVFcnM5eS9oTHhzdGk5NDBPR2dydWU2OFdTWjBM?=
 =?utf-8?Q?f1a5tJQGF0OVSLIeFViAfok=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 91aecf8c-ca2f-4eb0-838e-08dd8814dac4
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 18:28:51.0359 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yfLNfuCgO0BNPfL2RhCfE4mMhlE1Y8Nyjr4LkrgEwieOhYX0uzIqxBCRHo3PIIS/rbR5c4i+DaGerdqyMHQewn9DAqZhynrtQSyYGba1O/M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4875
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

On Tue, Apr 29, 2025 at 04:39:33PM -0500, Lucas De Marchi wrote:
>On Fri, Apr 25, 2025 at 12:10:39PM -0700, Umesh Nerlige Ramappa wrote:
>>Context Timestamp (CTX_TIMESTAMP) in the lrc accumulates the run ticks
>>of the context, but only gets updated when the context switches out. In
>>order to check how long a context has been active before it switches
>>out, two things are required:
>>
>>(1) Determine if the context is running:
>>
>>To do so, we program the wa bb to set an initial value for CTX_TIMESTAMP
>>in the lrc. The value chosen is 1 since 0 is the initial value when the
>>lrc is initialized. During a query, we just check for this value to
>>determine if the context is active. If the context switched out, it
>>would overwrite this location with the actual CTX_TIMESTAMP MMIO value.
>>Note that wa bb will run after the context has been restored, so reusing
>
>AFAICS it's part of the "context restore" which is composed by, in
>order: Ring Context Restore, Engine Context Restore (with possible jump
>to Indirect Ctx, controlled by the INDIRECT_CTX_OFFSET) and lastly
>Context Restore Batch Buffer.
>
>>this lrc location will not clobber anything.
>>
>>(2) Calculate the time that the context has been active for:
>>
>>The CTX_TIMESTAMP ticks only when the context is active. If a context is
>>active, we just use the CTX_TIMESTAMP MMIO as the new value of
>>utilization. While doing so, we need to read the CTX_TIMESTAMP MMIO
>>for the specific engine instance. Since we do not know which instance
>>the context is running on until it is scheduled, we also read the
>>ENGINE_ID MMIO in the wa bb and store it in the PPHSWP.
>>
>>Using the above 2 instructions in a WA BB, capture active context
>>utilization.
>>
>>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>>---
>>.../gpu/drm/xe/instructions/xe_mi_commands.h  |   4 +
>>drivers/gpu/drm/xe/regs/xe_engine_regs.h      |   4 +
>>drivers/gpu/drm/xe/regs/xe_lrc_layout.h       |   1 +
>>drivers/gpu/drm/xe/xe_lrc.c                   | 168 +++++++++++++++++-
>>drivers/gpu/drm/xe/xe_lrc_types.h             |   6 +
>>5 files changed, 181 insertions(+), 2 deletions(-)
>>
>>diff --git a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
>>index eba582058d55..9153a7cd2ceb 100644
>>--- a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
>>+++ b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
>>@@ -62,6 +62,10 @@
>>#define MI_LOAD_REGISTER_MEM		(__MI_INSTR(0x29) | XE_INSTR_NUM_DW(4))
>>#define   MI_LRM_USE_GGTT		REG_BIT(22)
>>
>>+#define MI_STORE_REGISTER_MEM		(__MI_INSTR(0x24) | XE_INSTR_NUM_DW(4))
>>+#define   MI_SRM_USE_GGTT		REG_BIT(22)
>>+#define   MI_SRM_ADD_CS_OFFSET		REG_BIT(19)
>>+
>>#define MI_LOAD_REGISTER_REG		(__MI_INSTR(0x2a) | XE_INSTR_NUM_DW(3))
>>#define   MI_LRR_DST_CS_MMIO		REG_BIT(19)
>>#define   MI_LRR_SRC_CS_MMIO		REG_BIT(18)
>>diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>>index da713634d6a0..cc698136a6f6 100644
>>--- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>>+++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>>@@ -43,6 +43,10 @@
>>#define XEHPC_BCS8_RING_BASE			0x3ee000
>>#define GSCCS_RING_BASE				0x11a000
>>
>>+#define ENGINE_ID(base)				XE_REG((base) + 0x8c)
>>+#define   ENGINE_INSTANCE_ID			REG_GENMASK(9, 4)
>>+#define   ENGINE_CLASS_ID			REG_GENMASK(2, 0)
>>+
>>#define RING_TAIL(base)				XE_REG((base) + 0x30)
>>#define   TAIL_ADDR				REG_GENMASK(20, 3)
>>
>>diff --git a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
>>index 57944f90bbf6..210be0ef12f2 100644
>>--- a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
>>+++ b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
>>@@ -11,6 +11,7 @@
>>#define CTX_RING_TAIL			(0x06 + 1)
>>#define CTX_RING_START			(0x08 + 1)
>>#define CTX_RING_CTL			(0x0a + 1)
>>+#define CTX_BB_PER_CTX_PTR		(0x12 + 1)
>>#define CTX_TIMESTAMP			(0x22 + 1)
>>#define CTX_INDIRECT_RING_STATE		(0x26 + 1)
>>#define CTX_PDP0_UDW			(0x30 + 1)
>>diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
>>index 855c8acaf3f1..11eabe4216ef 100644
>>--- a/drivers/gpu/drm/xe/xe_lrc.c
>>+++ b/drivers/gpu/drm/xe/xe_lrc.c
>>@@ -24,6 +24,7 @@
>>#include "xe_hw_fence.h"
>>#include "xe_map.h"
>>#include "xe_memirq.h"
>>+#include "xe_mmio.h"
>>#include "xe_sriov.h"
>>#include "xe_trace_lrc.h"
>>#include "xe_vm.h"
>>@@ -654,6 +655,7 @@ u32 xe_lrc_pphwsp_offset(struct xe_lrc *lrc)
>>#define LRC_START_SEQNO_PPHWSP_OFFSET (LRC_SEQNO_PPHWSP_OFFSET + 8)
>>#define LRC_CTX_JOB_TIMESTAMP_OFFSET (LRC_START_SEQNO_PPHWSP_OFFSET + 8)
>>#define LRC_PARALLEL_PPHWSP_OFFSET 2048
>>+#define LRC_ENGINE_ID_PPHWSP_OFFSET 2096
>>
>>u32 xe_lrc_regs_offset(struct xe_lrc *lrc)
>>{
>>@@ -697,11 +699,21 @@ static inline u32 __xe_lrc_parallel_offset(struct xe_lrc *lrc)
>>	return xe_lrc_pphwsp_offset(lrc) + LRC_PARALLEL_PPHWSP_OFFSET;
>>}
>>
>>+static inline u32 __xe_lrc_engine_id_offset(struct xe_lrc *lrc)
>>+{
>>+	return xe_lrc_pphwsp_offset(lrc) + LRC_ENGINE_ID_PPHWSP_OFFSET;
>>+}
>>+
>>static u32 __xe_lrc_ctx_timestamp_offset(struct xe_lrc *lrc)
>>{
>>	return __xe_lrc_regs_offset(lrc) + CTX_TIMESTAMP * sizeof(u32);
>>}
>>
>>+static u32 __xe_lrc_bb_per_ctx_ptr_offset(struct xe_lrc *lrc)
>>+{
>>+	return __xe_lrc_regs_offset(lrc) + CTX_BB_PER_CTX_PTR * sizeof(u32);
>>+}
>>+
>>static inline u32 __xe_lrc_indirect_ring_offset(struct xe_lrc *lrc)
>>{
>>	/* Indirect ring state page is at the very end of LRC */
>>@@ -731,6 +743,8 @@ DECL_MAP_ADDR_HELPERS(ctx_job_timestamp)
>>DECL_MAP_ADDR_HELPERS(ctx_timestamp)
>>DECL_MAP_ADDR_HELPERS(parallel)
>>DECL_MAP_ADDR_HELPERS(indirect_ring)
>>+DECL_MAP_ADDR_HELPERS(bb_per_ctx_ptr)
>>+DECL_MAP_ADDR_HELPERS(engine_id)
>>
>>#undef DECL_MAP_ADDR_HELPERS
>>
>>@@ -880,6 +894,58 @@ static void xe_lrc_finish(struct xe_lrc *lrc)
>>	xe_bo_unpin(lrc->bo);
>>	xe_bo_unlock(lrc->bo);
>>	xe_bo_put(lrc->bo);
>>+	xe_bo_unpin_map_no_vm(lrc->bb_per_ctx_bo);
>>+}
>>+
>>+/*
>>+ * xe_lrc_setup_utilization() - Setup wa bb to assist in calculating active
>>+ * context run ticks.
>>+ * @lrc: Pointer to the lrc.
>>+ *
>>+ * Context Timestamp (CTX_TIMESTAMP) in the lrc accumulates the run ticks of the
>>+ * context, but only gets updated when the context switches out. In order to
>>+ * check how long a context has been running before it switches out, two things
>>+ * are required:
>>+ *
>>+ * (1) Determine if the context is running
>>+ * To do so, we program the wa bb to set an initial value for CTX_TIMESTAMP in
>>+ * the lrc. The value chosen is 1 since 0 is the initial value when the lrc is
>>+ * initialized. During a query, we just check for this value to determine if the
>>+ * context is active. If the context switched out, it would overwrite this
>>+ * location with the actual CTX_TIMESTAMP MMIO value. Note that wa bb will run
>>+ * after the context has been restored, so reusing this lrc location will not
>>+ * clobber anything.
>>+ *
>>+ * (2) Calculate the time that the context has been running for
>>+ * The CTX_TIMESTAMP ticks only when the context is active. If a context is
>>+ * active, we just use the CTX_TIMESTAMP MMIO as the new value of utilization.
>>+ * While doing so, we need to read the CTX_TIMESTAMP MMIO from the specific
>>+ * engine instance. Since we do not know which instance the context is running
>>+ * on until it is scheduled, we also read the ENGINE_ID MMIO in the wa bb and
>>+ * store it in the PPHSWP.
>>+ */
>>+
>>+static void xe_lrc_setup_utilization(struct xe_lrc *lrc)
>>+{
>>+	u32 *cmd;
>>+
>>+	cmd = lrc->bb_per_ctx_bo->vmap.vaddr;
>>+
>>+	*cmd++ = MI_STORE_REGISTER_MEM | MI_SRM_USE_GGTT | MI_SRM_ADD_CS_OFFSET;
>>+	*cmd++ = ENGINE_ID(0).addr;
>>+	*cmd++ = __xe_lrc_engine_id_ggtt_addr(lrc);
>>+	*cmd++ = 0;
>>+
>>+        *cmd++ = MI_STORE_DATA_IMM | MI_SDI_GGTT | MI_SDI_NUM_DW(1);
>>+        *cmd++ = __xe_lrc_ctx_timestamp_ggtt_addr(lrc);
>>+        *cmd++ = 0;
>>+        *cmd++ = 1;
>
>some wrong indentantion here.
>
>>+
>>+	*cmd++ = MI_BATCH_BUFFER_END;
>>+
>>+	xe_lrc_write_ctx_reg(lrc, CTX_BB_PER_CTX_PTR,
>>+			     xe_bo_ggtt_addr(lrc->bb_per_ctx_bo) | 1);
>>+
>>}
>>
>>#define PVC_CTX_ASID		(0x2e + 1)
>>@@ -900,6 +966,7 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>>	int err;
>>
>>	kref_init(&lrc->refcount);
>>+	lrc->gt = gt;
>>	lrc->flags = 0;
>>	lrc_size = ring_size + xe_gt_lrc_size(gt, hwe->class);
>>	if (xe_gt_has_indirect_ring_state(gt))
>>@@ -920,6 +987,14 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>>	if (IS_ERR(lrc->bo))
>>		return PTR_ERR(lrc->bo);
>>
>>+	lrc->bb_per_ctx_bo = xe_bo_create_pin_map(xe, tile, NULL, SZ_4K,
>>+						  ttm_bo_type_kernel,
>>+						  bo_flags);
>>+	if (IS_ERR(lrc->bb_per_ctx_bo)) {
>>+		err = PTR_ERR(lrc->bb_per_ctx_bo);
>>+		goto err_lrc_finish;
>>+	}
>>+
>>	lrc->size = lrc_size;
>>	lrc->tile = gt_to_tile(hwe->gt);
>>	lrc->ring.size = ring_size;
>>@@ -1026,6 +1101,8 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>>	map = __xe_lrc_start_seqno_map(lrc);
>>	xe_map_write32(lrc_to_xe(lrc), &map, lrc->fence_ctx.next_seqno - 1);
>>
>>+	xe_lrc_setup_utilization(lrc);
>>+
>>	return 0;
>>
>>err_lrc_finish:
>>@@ -1245,6 +1322,21 @@ struct iosys_map xe_lrc_parallel_map(struct xe_lrc *lrc)
>>	return __xe_lrc_parallel_map(lrc);
>>}
>>
>>+/**
>>+ * xe_lrc_engine_id() - Read engine id value
>>+ * @lrc: Pointer to the lrc.
>>+ *
>>+ * Returns: context id value
>>+ */
>>+static u32 xe_lrc_engine_id(struct xe_lrc *lrc)
>>+{
>>+	struct xe_device *xe = lrc_to_xe(lrc);
>>+	struct iosys_map map;
>>+
>>+	map = __xe_lrc_engine_id_map(lrc);
>>+	return xe_map_read32(xe, &map);
>>+}
>>+
>>static int instr_dw(u32 cmd_header)
>>{
>>	/* GFXPIPE "SINGLE_DW" opcodes are a single dword */
>>@@ -1792,21 +1884,93 @@ void xe_lrc_snapshot_free(struct xe_lrc_snapshot *snapshot)
>>	kfree(snapshot);
>>}
>>
>>+static u32 get_ctx_timestamp(struct xe_lrc *lrc, u32 engine_id)
>>+{
>>+	static u32 base[XE_ENGINE_CLASS_MAX][XE_HW_ENGINE_MAX_INSTANCE] = {
>>+		{
>>+			RENDER_RING_BASE,
>>+		},
>>+		{
>>+			BSD_RING_BASE,
>>+			BSD2_RING_BASE,
>>+			BSD3_RING_BASE,
>>+			BSD4_RING_BASE,
>>+			XEHP_BSD5_RING_BASE,
>>+			XEHP_BSD6_RING_BASE,
>>+			XEHP_BSD7_RING_BASE,
>>+			XEHP_BSD8_RING_BASE,
>>+		},
>>+		{
>>+			VEBOX_RING_BASE,
>>+			VEBOX2_RING_BASE,
>>+			XEHP_VEBOX3_RING_BASE,
>>+			XEHP_VEBOX4_RING_BASE,
>>+		},
>>+		{
>>+			BLT_RING_BASE,
>>+			XEHPC_BCS1_RING_BASE,
>>+			XEHPC_BCS2_RING_BASE,
>>+			XEHPC_BCS3_RING_BASE,
>>+			XEHPC_BCS4_RING_BASE,
>>+			XEHPC_BCS5_RING_BASE,
>>+			XEHPC_BCS6_RING_BASE,
>>+			XEHPC_BCS7_RING_BASE,
>>+			XEHPC_BCS8_RING_BASE,
>>+		},
>>+		{ 0 },
>>+		{
>>+			COMPUTE0_RING_BASE,
>>+			COMPUTE1_RING_BASE,
>>+			COMPUTE2_RING_BASE,
>>+			COMPUTE3_RING_BASE,
>>+		},
>>+	};
>>+	u32 c = REG_FIELD_GET(ENGINE_CLASS_ID, engine_id);
>>+	u32 i = REG_FIELD_GET(ENGINE_INSTANCE_ID, engine_id);
>
>humn... do we really need this mapping? Couldn't we lookup a hwe from
>class + instance and then xe_hw_engine_mmio_read32() It doesn't seem like
>this lookup belongs here.
>

I thought it would be faster this way. I can change it to lookup the 
hwe. 

>>+	u32 mmio_base = base[c][i];
>>+
>>+	if (xe_gt_WARN_ONCE(lrc->gt, !mmio_base,
>>+			    "Unexpected engine c:i %d:%d for context utilization\n",
>>+			    c, i))
>>+		return 0;
>>+
>>+	return xe_mmio_read32(&lrc->gt->mmio, RING_CTX_TIMESTAMP(mmio_base));
>>+}
>>+
>>/**
>> * xe_lrc_update_timestamp() - Update ctx timestamp
>> * @lrc: Pointer to the lrc.
>> * @old_ts: Old timestamp value
>> *
>> * Populate @old_ts current saved ctx timestamp, read new ctx timestamp and
>>- * update saved value.
>>+ * update saved value. With support for active contexts, the calculation may be
>>+ * slightly racy, so follow a read-again logic to ensure that the context is
>>+ * still active before returning the right timestamp.
>> *
>> * Returns: New ctx timestamp value
>> */
>>u32 xe_lrc_update_timestamp(struct xe_lrc *lrc, u32 *old_ts)
>>{
>>+	u32 ctx_lrc, ctx_reg, engine_id;
>>+
>>	*old_ts = lrc->ctx_timestamp;
>>
>>-	lrc->ctx_timestamp = xe_lrc_ctx_timestamp(lrc);
>>+	ctx_lrc = xe_lrc_ctx_timestamp(lrc);
>>+	if (ctx_lrc == 1) {
>
>so in the rare case this clashes with a real sched-out value, the
>outcome will be that we will read a bogus timestamp and the math will be
>totally invalid. Maybe start using the entire u64 counter for this since
>it would then not wrap in practice?

I was trying to keep it compatible with platforms without 64 bit 
CTX_TIMESTAMP. Also th issue is reported on DG2.

Thanks,
Umesh

>
>Lucas De Marchi
>
>>+		engine_id = xe_lrc_engine_id(lrc);
>>+		ctx_reg = get_ctx_timestamp(lrc, engine_id);
>>+		if (!ctx_reg)
>>+			lrc->ctx_timestamp = *old_ts;
>>+		else
>>+			lrc->ctx_timestamp = ctx_reg;
>>+
>>+		/* read lrc again to ensure context is still active */
>>+		ctx_lrc = xe_lrc_ctx_timestamp(lrc);
>>+	}
>>+
>>+	/* If context switched out, just use the lrc value */
>>+	if (ctx_lrc != 1)
>>+		lrc->ctx_timestamp = ctx_lrc;
>>
>>	trace_xe_lrc_update_timestamp(lrc, *old_ts);
>>
>>diff --git a/drivers/gpu/drm/xe/xe_lrc_types.h b/drivers/gpu/drm/xe/xe_lrc_types.h
>>index 71ecb453f811..1c973d71ba98 100644
>>--- a/drivers/gpu/drm/xe/xe_lrc_types.h
>>+++ b/drivers/gpu/drm/xe/xe_lrc_types.h
>>@@ -28,6 +28,9 @@ struct xe_lrc {
>>	/** @tile: tile which this LRC belongs to */
>>	struct xe_tile *tile;
>>
>>+	/** @gt: gt which this LRC belongs to */
>>+	struct xe_gt *gt;
>>+
>>	/** @flags: LRC flags */
>>#define XE_LRC_FLAG_INDIRECT_RING_STATE		0x1
>>	u32 flags;
>>@@ -53,6 +56,9 @@ struct xe_lrc {
>>
>>	/** @ctx_timestamp: readout value of CTX_TIMESTAMP on last update */
>>	u32 ctx_timestamp;
>>+
>>+	/** @bb_per_ctx_bo: buffer object for per context batch wa buffer */
>>+	struct xe_bo *bb_per_ctx_bo;
>>};
>>
>>struct xe_lrc_snapshot;
>>-- 
>>2.43.0
>>

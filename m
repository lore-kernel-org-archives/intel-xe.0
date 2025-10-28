Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29816CCD1BF
	for <intel-xe@archiver.kernel.org>; Tue, 28 Oct 2025 20:11:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E357E10E65E;
	Tue, 28 Oct 2025 20:11:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AWID6q/a";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29C5D10E65E
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Oct 2025 20:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761682298; x=1793218298;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=MHVUxLZ336kZRNaP5aPh7psDKd+huiCI4dMfEHsrLf0=;
 b=AWID6q/auoF5mJ5T5psCTXsI60AhJTld4mN8K+ngHbkBJlLi7ZkRkG3E
 uQb1uF32zJJ4k7RaI8jDh2q/8bfpxvh857pSENk6MUb0rCaseoJrwm8yP
 WmqoJ//Okyr6QdEyF4OND6f+B+nKfV2Qq1emCFcm91KpJjGD1Nzft5n1A
 mH11T9QYHUfWKaDVIoO+R2xxLhrQ1oiVxiMZpBUVsZavz21S6MzALNNXi
 W9n18R4E+N+LH5DrlLiae+KHw+PG/sTxhuCbb/Xa2uO1SSjClLTsntzER
 rhZwTK684aeNg2FqGLTi0sWeXivPTDdSR6ESLY9EAn7tlBDsDobbIKhrz A==;
X-CSE-ConnectionGUID: 7Yf87NPiSWa9bGnxfABXfg==
X-CSE-MsgGUID: BB3siBMBQB63NjjyQHGvkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74913818"
X-IronPort-AV: E=Sophos;i="6.19,262,1754982000"; d="scan'208";a="74913818"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 13:11:37 -0700
X-CSE-ConnectionGUID: Nk2VJ5yuQxyNq6y0jJDODQ==
X-CSE-MsgGUID: Ij+Qzh3WTqmlDfiq3MKUtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,262,1754982000"; d="scan'208";a="189498965"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 13:11:37 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 13:11:37 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 28 Oct 2025 13:11:37 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.5) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 13:11:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pQbyGxrUkMCHzHmFawTdIL6kB8r1m/ZVEVfYr2relA/jk1nwVdOwkd4Fbhd6oLB6dGAwV+09Uu5P+mq0ZRVHv3XjCb+l4GLHIOWP+ZTXUg/QtD02ZRC5JkOoqEULReFm+wRJvL12RjffV6gfJAsfRKrfOzgenUNCl1rDOiPa8iucFjRcdIv8cv75B1frHGyog1Ggekiidh6BI9VMw1FJcSGxQLedwiY9vRTPlQ/1xqEWuXiB9uamMBXt/Nd5q71gZ5+89MMQLAmQyOqcF/Xazx1XVrp6Ar9mL9ZZVvSjythVhTRUIxGvazjLikuH7ZI4UAmKQIvRoLUf4wyRNf7SBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xtBmS/YOpeIPHf2JMBf66nK3yOHlG5YZZZYELtIsPaM=;
 b=ecj57El1ltaV1CyUXvLxYgLdOnQLvviPj1j+RtayMNfOiWYhyk7o2VXv1zujrf1UolaN4lkh8qJa8+RaBGM3aMcWK60RQNN2duXdOBRYRIFDyuhnFJR/t3HvZHjiGwxJi2FU3l8m9ZJwKvwrx90GmiZ7jzgomOIdCZoE/NpjTT4WUgHcERmbG5r8oS8pkbegQw6U+rwq38WoPDmg8tpqGjrdtJ14eQGW2iHenaY66hHsWiG3cBfFKexz58EtY9SDryR3M3pQXumMdsnc5Utu6UkuUpXsOzRp7t4sdfCpljhoeUdFpDPLNI2ZMz2DVeMJlcghjx6DA4fnRUTB3+ZRnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ5PPF89507EDE4.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::83e) by SN7PR11MB6874.namprd11.prod.outlook.com
 (2603:10b6:806:2a5::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.19; Tue, 28 Oct
 2025 20:11:34 +0000
Received: from SJ5PPF89507EDE4.namprd11.prod.outlook.com
 ([fe80::28e0:9ef7:24f0:c21b]) by SJ5PPF89507EDE4.namprd11.prod.outlook.com
 ([fe80::28e0:9ef7:24f0:c21b%7]) with mapi id 15.20.9275.013; Tue, 28 Oct 2025
 20:11:34 +0000
Date: Tue, 28 Oct 2025 13:11:31 -0700
From: Matt Atwood <matthew.s.atwood@intel.com>
To: Stuart Summers <stuart.summers@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>,
 <niranjana.vishwanathapura@intel.com>, <zhanjun.dong@intel.com>,
 <shuicheng.lin@intel.com>
Subject: Re: [PATCH 3/6] drm/xe: Add the BO pointer info to the BO trace
Message-ID: <aQEjczSXGN4eM_43@msatwood-mobl>
References: <20251027180412.63743-1-stuart.summers@intel.com>
 <20251027180412.63743-4-stuart.summers@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20251027180412.63743-4-stuart.summers@intel.com>
X-ClientProxiedBy: SJ0PR05CA0016.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::21) To SJ5PPF89507EDE4.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::83e)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PPF89507EDE4:EE_|SN7PR11MB6874:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cd10a7a-1ee3-4cac-a874-08de165e30e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SUlkZlVKK0pWZUp2aFBRc3UycUdWMFM3MUdRV1RxRHFCVzZlOG5SSUFSRHpJ?=
 =?utf-8?B?NGVZOFg4RVMvTHByTnZ3eDlNSnR6YVBxRnRjMVpmVzdLZDhCKzVtMXpYZWlO?=
 =?utf-8?B?VUMzRGtMUnpsdkxrVlhMalFBaW5HN2VKTlV4eEM5NmNkSE5wTTc4UEd1d3d2?=
 =?utf-8?B?bVJBU1h2VXltNFF2VEhjWFgwRW9VOWZCNTArNE5GTmV1dk1PYmJhT0tYZHBE?=
 =?utf-8?B?aUxOL0xSOUd3WjJiNDZ5Y0s2WE85SXI2d3dGSmEvTXkzL3BzYmR2RkFlMVMv?=
 =?utf-8?B?WGpqOXJIdjh1MnhxMXZVbkdBdHZYUUpSVzNHa2hmRFdYRXZHRElqUGNNZ0ln?=
 =?utf-8?B?RHJvaWhRZThUMm0rcFdBd3VWR093bGI0S0hmOWNSRmVHbEY2TkhCV0ZNQmV1?=
 =?utf-8?B?cmdCeUdnTzl1UHQvT2dKUWIvajZwQXo2cTNhMEJyMlpsZFZyeTBJMFBkZ3RS?=
 =?utf-8?B?QWd4eE9haVVCanoyOHRPQkc5c29xMWhIb1BmLzVDdk9lWGJHaE5QczBNQ2Jn?=
 =?utf-8?B?NmlqWk51b0xFdjZHc3E4TGdQdmhBOHoxUXZsV0xoT2VjSnIxeGc1QlA3NHZQ?=
 =?utf-8?B?TEw4ZDFqbG5oTXhBbWdMWGRpMWs1Y1RpcGRGaHZOd2lzcHJuNjVJenlzOFJR?=
 =?utf-8?B?WFpKZ3RhcmhCTGRCL2tIOVUwL3BDekpFY3E0WmQzazBnbUJ0eXBjTnZ4eGQ2?=
 =?utf-8?B?cFhobm9OYmU2VWZodVBJU1VNYTV2TE5mdVNxZWlYTVNaU0ZsYmJtT1N3QUtv?=
 =?utf-8?B?TDcvckxhSHVqVTdacEtXcDM4Mnk4UHJqWWUwV0pKTWJXSm5oQ1phYWdnSTF5?=
 =?utf-8?B?OTlNNlZMc3FuU1BPbVZtdXdraFd3WjFrTStrZmpHNzJvdDJVc0RpNmJ6NVBO?=
 =?utf-8?B?NEpLV3NPNUg5Nnk1OFozRWhtbFpuR3poYUpaTHJoNUo5bkgwdWJDT0hoTkYr?=
 =?utf-8?B?SFBRdHdJTmVwdUhUVG5EQ1RnZ1E5THB6TXdtZUkvRURsbDloT1pyTlFaeGlo?=
 =?utf-8?B?OHlNS0MxNldBNFlPczJ3WFNPbTBqN3B5VVZEK0FTOGMvcHF6eWlqdUJXSzhZ?=
 =?utf-8?B?aGJZUUo1Ni9aQlJsVVdwenJZMnA4Qm5EYk9DWGw2QVF3VDRVc09HVks0RG1Y?=
 =?utf-8?B?VDB0VGc0VVlrL05rNDYwVUpmTVJrTXBTaWp1WnRyYnZkcmpiYTRBNzdlcURm?=
 =?utf-8?B?THZ3VnBOLzhLYkw3czlja05MelR4ZXBIQWpTYlBnMDVyYzV5K2RNeER2bDlw?=
 =?utf-8?B?UWFMeDJGd2tpcEpBQng3UlRxYzA5VGVxazM4S09SWDZib3V4Y0dGeHlyZkdx?=
 =?utf-8?B?OGlLNDFmc3BsMVI0NUpZUEg0NHozSWthWmc5bmNHMk9zNTdib0kyTkJUdHBJ?=
 =?utf-8?B?Z3AyK2Z0VnorOWoxRGJyelhrNFp5RHdBcDJ4NkJsUGJkekxTa2NvMGkxbEZD?=
 =?utf-8?B?MVZiN2tIVGQrOTJGQkZ1QVdVV3JLUW9CR3RmRWQ4UE9BTkZSSnRkZVduSWtJ?=
 =?utf-8?B?NkszZjBVQ1NpVFZYU2JzbC9BbzZYZ2ZNWXBPNlg2eEc0aTBVbUxLYlJsMDZ3?=
 =?utf-8?B?TzlST0Y3NjBIOXRoNERUVDBiVmt6ZjNrM0xPRXphc2RHUXlCZUxiZ1Zsd3Ji?=
 =?utf-8?B?bDE2SUwvcUtRckJFWmV3T1dsUm91L2JiOS94djFwbzZlRjhBZTlCZHpDeDJF?=
 =?utf-8?B?Wnh2b0ZPTC9YcW0wWlhDRlY5M1hITVkvSnU3TnRJVVZTM0IrVVkrV2tVZHpn?=
 =?utf-8?B?YXphWTJHekp0Wk95RmNoYmFFUHZ4QjNEWDJKWjg5ZTZHQmZ6YUVHQ2lUU3N5?=
 =?utf-8?B?dzFHL1hTTFhISnRkS1lwdVRjV1Fyb2lsTDVSWWVWRUwrUHRuT0hYZlRNWXV2?=
 =?utf-8?B?SWkyODMzNVRUY3liaVBVYjF6OTFVYkRUdm44RGYrQ2pwMjRoL1piaVRnZUJP?=
 =?utf-8?Q?AFUKmW/SDA1xhkZp/lxAz8iXGDJ9r89y?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ5PPF89507EDE4.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q01zYVdXN2xURmlmTXRwTFUxQ0xSRzd1ZU5iQ0tBa0hhNGU4THpiMlBOMEVM?=
 =?utf-8?B?Q3VqSVREeFd4ODZDYlphbWJoTUFtNFVFSEViZFE5VzJPUUhSbEVrNGhJZUxK?=
 =?utf-8?B?UXF0OUo4Y1dwd0xFWk1taFBNTW5HL2E0cEZsLzVhdmRSSUpnZnJaSEdDWDh1?=
 =?utf-8?B?T2piWCtiRTcySzRWZHJwcjREWXkxQlh5S2puZ3hmcDRra3hvbVFiODZvTmZP?=
 =?utf-8?B?Nm5rYTVoei80aFhPV1FXdWNuVENRMERHT25HMi9iTW5LR1JUYVRxaVNWbEpi?=
 =?utf-8?B?dG83NFlCZys0QWxQb3o0SHMrZjlidDFWajFibHNEMkFHZit5c2FZNWJWczVh?=
 =?utf-8?B?RHVhbUJSMCt6WDB6ZGVnajZwMEt1cnNKQm41Wjh3cCszRXJHL3ZISC9Cb043?=
 =?utf-8?B?a00xNCs5UHJESXBidkoraURUOUFiRU9mSjRjSmZ0QmYvbmNteFFNUExHQmJZ?=
 =?utf-8?B?QU5LTlFGSUpKcHcyUGExS09VRURTRTcwZG01d05iM29yRk5rL0JkRmwyb2x4?=
 =?utf-8?B?bTdIdGgrQWpFYWh4dGYyYWNzdG1IKzFnSTFuY3NiQXc1YjhOUGpzWGhUY3Fk?=
 =?utf-8?B?eVZzQWVqQWE5UXJKWkRLa0Z3WkpzVEJTYjNrajZqVUJtYit4L3ZlRmhKVDZa?=
 =?utf-8?B?SnVRY1NvYlZLaTZRQTJ1MTNuVVgvc09VVC9ad2RQUENpWmpBeFljQnRadW42?=
 =?utf-8?B?dndlSUtTRjUzUjgzdk5qV3FCWC80bUtYTjlaSE5XL3ppeWlxZXB1NUYybThw?=
 =?utf-8?B?dDJNelpHRE9YK0VBazRZMkhrM05QZE9sSE9tcTk5dUdGTW9PWVBDMUNhNStt?=
 =?utf-8?B?bFZ0cHg1OU9XblM5dEZsL29IZWhNRElUSlRpZ29GK3hmMXZPSmtNa2dYNitJ?=
 =?utf-8?B?ZGVKTU81bm1EbVcrRUhNcGFEbk51S2l5RVlRckIvNkJUYTJVWFFZRE5WVFJI?=
 =?utf-8?B?a3hhNlZNRUppMkNLVVp5Q0VaWGp6S2hUOFdFVHFpTldBN0R0M0NNQVdmN2Q2?=
 =?utf-8?B?T3pOQkhRMXhrNExCMk84UGhZQ3AvV3RxdW9kdlA0ZDZUTFZ0R2ZXUW01cnVW?=
 =?utf-8?B?bXdyL1lYOFpYY0pybVUxcDRac1crVlo3L3hLcnU5bnVnckF2dXVDdnZEMkpR?=
 =?utf-8?B?N2VSTWZqcmNEdDA2Qy9wRHJCSlVURC84MHUwTjl1dmlKdHJNekdqa1cvbXN5?=
 =?utf-8?B?Nm1SQW42SXF4by9Ed0FvNzZPOGw1YTNsVmlYY0MvaVVsLzd3c2ZiWnJ3TXVr?=
 =?utf-8?B?V0xuZ2FTVERlUVNTMXdtMHBLdHp6aE9SYVVORURyRnpsbjF4S2RZQ3l4NEJ3?=
 =?utf-8?B?YzlaYkI1Z2xtanQzUHlZQndxUHdHZURkUTB4a0NwTVlLSmVlUWN6dmFIT1d0?=
 =?utf-8?B?REhQRW9EYXl0d0ZhcjAzbUhUMlVrekk3dGNYUEtzQVBzT0tiamU4MVpVaWNs?=
 =?utf-8?B?Z0FRZy80aW1La2ZwYjV5alVVTTFNdVdQd09TTllSSi9yTHVJQ3ZRb01aM011?=
 =?utf-8?B?K21zNHBHUHBMWTRkTEVOSTh1RDZTbllsUjdkMnpBUExhckYzRW41TWtLTTJ0?=
 =?utf-8?B?Y1U1NUFMTFNSQUJjMXN0dEIzRlB1VDVtTUo0enNsZkxnWm5lSHZha1lRNHpO?=
 =?utf-8?B?S29UR2N4M1YydUdBYTEvOVpzVXJBYUhwVzIza2VyUDlLdlNkT3EwOFZnSDFP?=
 =?utf-8?B?dk90Tnd1ZVRRTk1WZnpjdVhRbmRwOG1zSnphZjdBblozMmJ0MXFwVndNaWxV?=
 =?utf-8?B?UGVRQ3R2VThsK2k5cDk4b3RRUjY5dGEzaHovbllOZHpMZHgya0tWSHMzM1NV?=
 =?utf-8?B?OWJydCtJSjkrUTVxUFFxczF1c0JpcTh3NThJWGxzSGdRYUoxZVZZM3BGNFJu?=
 =?utf-8?B?bnFINHJodG0waGlRYzJSTFR1NWFpcFROVkZWcmxtSjJYT0xWWk5RN3dJNkU1?=
 =?utf-8?B?OXlSNkw1Z081cVJTMWRBWUlkOHh0SE5MS2lsSlBDVkJPa3UrZGxMRDMzeU9Q?=
 =?utf-8?B?OFFBMUVyZEp1Nkk4NlEwU01WS0xXVUpWS2NmTEExc1pDSm1mQStGVjZObkZ6?=
 =?utf-8?B?akJLZkIxNHV5eDVicTEvcDdNNlF0YU1rdURtaGZvNFN4MW1XTCs5NXlFNUVs?=
 =?utf-8?B?VUZEZVE1TERjY3lxbXZ3SGxVYkw4aVNpQzdIMVVGVSszN0Q1RnpzUHpKMkN0?=
 =?utf-8?B?VlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cd10a7a-1ee3-4cac-a874-08de165e30e0
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPF89507EDE4.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 20:11:34.4277 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rQvEI+czgWrbUdOwdX8en75S9AKFgt8h6r3Uax7MbQhu0HcGBctAX/MJ8rnni2vCSNoFhsbu34B3ZUID09KjM6S4VqRTvHVtLqp0W6DDy6A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6874
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

On Mon, Oct 27, 2025 at 06:04:09PM +0000, Stuart Summers wrote:
> Just a little extra detail to make BOs easier to track
> through the trace event log.
> 
Reviewed-by: Matt Atwood <matthew.s.atwood@intel.com>
> Signed-off-by: Stuart Summers <stuart.summers@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_trace_bo.h | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_trace_bo.h b/drivers/gpu/drm/xe/xe_trace_bo.h
> index 238311cfb816..0d795733e0f0 100644
> --- a/drivers/gpu/drm/xe/xe_trace_bo.h
> +++ b/drivers/gpu/drm/xe/xe_trace_bo.h
> @@ -27,6 +27,7 @@ DECLARE_EVENT_CLASS(xe_bo,
>  
>  		    TP_STRUCT__entry(
>  			     __string(dev, __dev_name_bo(bo))
> +			     __field(struct xe_bo *, bo)
>  			     __field(size_t, size)
>  			     __field(u32, flags)
>  			     __field(struct xe_vm *, vm)
> @@ -34,13 +35,14 @@ DECLARE_EVENT_CLASS(xe_bo,
>  
>  		    TP_fast_assign(
>  			   __assign_str(dev);
> +			   __entry->bo = bo;
>  			   __entry->size = xe_bo_size(bo);
>  			   __entry->flags = bo->flags;
>  			   __entry->vm = bo->vm;
>  			   ),
>  
> -		    TP_printk("dev=%s, size=%zu, flags=0x%02x, vm=%p",
> -			      __get_str(dev), __entry->size,
> +		    TP_printk("dev=%s, %p, size=%zu, flags=0x%02x, vm=%p",
> +			      __get_str(dev), __entry->bo, __entry->size,
>  			      __entry->flags, __entry->vm)
>  );
>  
> -- 
> 2.34.1
> 

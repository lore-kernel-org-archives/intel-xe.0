Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31ABFCAC5BB
	for <intel-xe@archiver.kernel.org>; Sun,  5 Oct 2025 05:21:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7708F10E277;
	Sun,  5 Oct 2025 05:21:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MMAEbkCx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC4C110E32C
 for <intel-xe@lists.freedesktop.org>; Sun,  5 Oct 2025 05:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759641683; x=1791177683;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=UG4yXbhJSeEh3Ya8gVGA2OWhRjX0eZksHQzao0cWr9w=;
 b=MMAEbkCxU+M/5gBbfgGr4CYf0YHiDp7FEQC0dOTfK7C06apGhhLacf/w
 zZnIHOH+pjKIUHlZffvX6qjM48XoMzDUDj2bgzmw5docfEOAFREXIDxXJ
 V+/HVqKGS3f6wm9FEgJHhUgI+EjAKX1IrNrFWIA51D6RVBXRPKh599ojy
 7m6lyc48gBycIm3+5N1qmAFDh5+objpAt+fitwK2+Q+eeytFF82o5qrJn
 PGw0ltqj9cOJHlPaZVJkf4p0kHnf+MFfvwlFp/li/NH4oYVoWhK+509dQ
 6AaVOlP8iXAiskeYSePA4OGGlKig1BRPCB7Xvs1pxnhCEk3OPM0nJRLOm Q==;
X-CSE-ConnectionGUID: oXgqsdowT3qtLE1W/CFz0g==
X-CSE-MsgGUID: 3mQwtB42QUmrSHdZ9UBRMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11572"; a="61744068"
X-IronPort-AV: E=Sophos;i="6.18,317,1751266800"; d="scan'208";a="61744068"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2025 22:21:22 -0700
X-CSE-ConnectionGUID: R2wKIEBQQkyZwC9W3qDcig==
X-CSE-MsgGUID: lLeuhes0Ts+OWf92NF4hOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,317,1751266800"; d="scan'208";a="183884353"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2025 22:21:21 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 4 Oct 2025 22:21:21 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sat, 4 Oct 2025 22:21:21 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.43) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 4 Oct 2025 22:21:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ke6McH+0j8+6LIsqHafzBoPmsMlOy4aSjsHRS2tORTM+aCJkSVtmjQJq5tcPw4NDAiTkaC0X+jPaJ96ihjSjG9v3pAN0QbKmsPZSTqwRhbJgf5DFgrAyZQz+eZ93j3BwZE5P4Xu/jl9WyBQSajz3j5KGtXDplF4t4HY9HoTbj/56chtlO3JeKiefPTqhBCBRIcNKzyNa7UUoe/OZQCciiP48QIeFDP3F6uUQ1rV31jsgFKO1xqI7+1+EV3FsLeu0lrKlHJDSrBTc+4otDZ+vKzeywYaHWIToC1yzCwtBnyzKgYi6CAvHf++m88/smBv6R2VYygYR9PbEK5uY4OXbJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1nmnTzATVOlKt81QtLHzOYQeRpA0hBQb3jff1OYHxQM=;
 b=J4YV4UwvDLgjNIA/4tUFukRosJ1QAxgir5I3x/pkzEb3LXLhBc++E9bd9ly40HkbzG0Ppmt/sx1040FYdQYtf8EjfxT/rmRO1FrURrfCky5tavHtYLg9rQYEnM9wUNg1r340ZLxeMt2WklDSLqXPkVaMZkxD1IFO24MLoTHs25kRRJHZGx1z04GN9uOsjEMnmk5wkeLnie0tGLLO6nYhBu7X0oyGiGICk7p6sNp5UgCTc5RWx1VVNfplDS5lxaIWO/Uh+Qsced6wlCFTjZHlXc3jGFQKGNF4wZ9uoz70EnyhjKDo3QXy4pWmWd8jJpKCpMNuKgOSYPN6bb7iMcCT+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA2PR11MB5084.namprd11.prod.outlook.com (2603:10b6:806:116::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.16; Sun, 5 Oct
 2025 05:21:15 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9182.017; Sun, 5 Oct 2025
 05:21:15 +0000
Date: Sat, 4 Oct 2025 22:21:12 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v4 07/34] drm/xe: Track LR jobs in DRM scheduler pending
 list
Message-ID: <aOIASGXwKOg7Iod1@lstrano-desk.jf.intel.com>
References: <20251002055402.1865880-1-matthew.brost@intel.com>
 <20251002055402.1865880-8-matthew.brost@intel.com>
 <1af77dfb-1d01-485f-81f3-a464e6ca4f33@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1af77dfb-1d01-485f-81f3-a464e6ca4f33@intel.com>
X-ClientProxiedBy: MW4PR03CA0191.namprd03.prod.outlook.com
 (2603:10b6:303:b8::16) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA2PR11MB5084:EE_
X-MS-Office365-Filtering-Correlation-Id: 958e6947-0e96-4800-c7bf-08de03cf013c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b1FhU2d1OVhock5GTFpKZDQ5ZGhpVXlrcHpTdEZMYk5DaFJ0Z24xZEpZRlJv?=
 =?utf-8?B?UUFDN2JSOG5jNHVIVHpiR3ZYUHkwZW5LU2NBRTdyUkVPUHo5Unhjakp4WWdk?=
 =?utf-8?B?ZWdjeU1pdmlHeVlsV0ZlaTdGc2c3Y0VrOFdrNFV5L3FJcnRTOWNZMGg0Q0Jy?=
 =?utf-8?B?WkdsWGl6MEpVNVRLQ1JTQ2NGdDFhY05SM0Y1MzFtU3N3ZEdCUDh0MUFwaXVZ?=
 =?utf-8?B?WDNBTjFQWHVpeW1BeEtvSlpvNVpYZVlZTHFESXpjdnNORWlVdUpDUTB3ZDZJ?=
 =?utf-8?B?TGcxc0FYNjdxdDZvSktOL1Y0ODRodDEvL1RPRFRQdHBxRjY2Z2tmZGJ4bllq?=
 =?utf-8?B?WmM0aFkreTZzalI4ZGs4ckhsSkV6OVBKeFhwMkNPdzJ3Sngyc042NE9DQjZT?=
 =?utf-8?B?YjlFSUZHL2xESjlvVHhraFU0MjBCZ2tqVytuaVJIazUxNWh6azllcVdNOGEy?=
 =?utf-8?B?WXZhNWp0RjBvNXc3N1duTGZ5UVhZL2FSSkpJTVhJeVJPVGFTMzRaQ2pDVjJM?=
 =?utf-8?B?cnowdUIvaGR6aDhncmIycGwxdzN3WkNWaHpsUmdmeWZMT205akVqelhaTTVL?=
 =?utf-8?B?STJQZW5JQmp0UERqdzFPU3NzTGdvL3ZYbGpzb1ZjamkxeitWK0VEVEFyU2JD?=
 =?utf-8?B?ci8zcTFla0l1SGtaTjVnNWVGbGhxNmNVd3YzQzNyWnRodkcxM2JzSjNHTkw2?=
 =?utf-8?B?QW9XMXVjTHRaR2hhcWdpNDRZQkRpZGs1bmFhY0Y4NGZmZGNvWjllTk1OVWtI?=
 =?utf-8?B?Tk54VEpHeEswbW5RbkJXdExCcC9JQWhoZmRSekV1bjZkNlV1VCt3d0JONWVE?=
 =?utf-8?B?dVRZYmFKQzB2a1BqdFNtcHlwQnIzVTFCd0g0anA3T09SRk9Ld0RvejJQczNh?=
 =?utf-8?B?bGJNckVQMTR1dVZGSjZWTG8rb1M1aE9MWmdzdGlOMStyN2wxUUNyaDZzZ0Va?=
 =?utf-8?B?dEJnWkVrRTRMcmpBOE5vVHNJcEVOemxoT3A0VWY2ZUpDcGVuS1N2ZGIxYmpG?=
 =?utf-8?B?NWhLb1BqcGRCTGJZT0VlMURJZnY0bGsxVXk3WEpFUWNEWDNXZWFFWTVZbTBC?=
 =?utf-8?B?a290blVUd29Odjg1UGlUVzRVdXNwSWNmdmU2VmtMYzQzN09uQ0ZXTUlaV1Fx?=
 =?utf-8?B?WEpFUHM4dVQ1dnIybkVXQnJqNUVHLzZFY3hCVGtGaU9PeUlqUVBFRTREQldw?=
 =?utf-8?B?ZnFzMUJxdU16aDIwaHBnRDlJTm9WeVI0aUpGRENNaEFZWWZMK1pORU1wdmU2?=
 =?utf-8?B?SmpQeVlpRHhPMGRIMW1iQXFtMm9ocWxoMHpvNnpUR2NlTnZiWEFYcjNPS1RP?=
 =?utf-8?B?V3d5TDBmRXJ4NXBLbUFQamkvbk5JQ0xIWTBQaVJiVVV5MlpSMWdQVG54SDk3?=
 =?utf-8?B?L3NXV0ZLaUdzend5aVJVK01PRHA0ZEtDVFNSZ2RGalBNL3g2dUNOS0E5TUFW?=
 =?utf-8?B?M0R5VFpiYTlHb0NYUVNsVXlPeDZpV3REbEhhaC9vdzRQTXpSN1MvOWlTM0tp?=
 =?utf-8?B?OU9TOEZjMjRKbGloZEp4U0w2b0VxRFQ5bXRnQVRKSHFsNUo0VU9nWE9XZUVu?=
 =?utf-8?B?dWIxbVZ5Q0szTUI4VU5QRzgyelN2MkRveU9BV1dHbVc2clJVSFVGTWF1MmE2?=
 =?utf-8?B?L1dramlFMWtFb1BDN29JQVJCWmF6R1o5eVpERXFST0g0VC9FWXJuQlJuRnha?=
 =?utf-8?B?cEhMQ1B6VllVbHdKWWxGelpZK3ozY2xqdEFnNzdDS3VML2plenhDZE9oRS9w?=
 =?utf-8?B?TUViRkNzRjlvVGVhODRMc1BUYWFNVytEdEJENm5DaUtlQVhzeXRnUlMyY24r?=
 =?utf-8?B?WGVXOXFxUUhKQnhqejJ4dEtqbWJBTUtWL2t3TklORWVqdFFiYXowTS9WVWlh?=
 =?utf-8?B?UG1FVURac25FUnhSdDduRk93dTVacXJJSUdXcHY3UlBkY2RkbElaU3ZoMTNY?=
 =?utf-8?Q?WC1wO0NkFULyZ+tBqchAmfL1PbekFD7b?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N2wrSEVtYjVyWWp6aXdHRkRJVHRldmp0OEt5MFRwZTh2TzMxSGFGSHgxL2FC?=
 =?utf-8?B?b1YzQWw5VVdkOU15YXFjTkxKMU5nZjVFZVQ3NjRoRTVOazBhQmNjeWNZdXZ3?=
 =?utf-8?B?WXN2Zm1tSlp6UlVzMkx6WHNYeDdSSGJxc0ZYQytkcFhPSndJK1ZtRlRrVHFR?=
 =?utf-8?B?NUhXdUtHcHpDSVFIaiswWkdEb0NleEJMeU8vL1NoMndOeEFjQjdBOHh6Q2hh?=
 =?utf-8?B?QzJzUStkZ1FCZ2RoZmMrS1RZNW0wakRjTGNveFdEczlyY0FLQVdMUURMUFkz?=
 =?utf-8?B?TzE0V1N3UCtWV21vc0VpekxUcExSWllvTStBanpPQy9GTE9VSzE0aHMwRFFW?=
 =?utf-8?B?OFZmdDQ0czJsS0l1SDNwZllPU1l5UmZ6aDFMNWtacXJzcHJHanlsT0w2RHl4?=
 =?utf-8?B?RGdYWlZESDFEUVZHNGJKdjhML0J2MkhKdWVFQ2VCN2JnVFBlNnU4dlNOSnc4?=
 =?utf-8?B?dmJZQXNKWFZTSkhCMlpoZTRYSE1aejJmcDlyR0d0OWY0UjJieUF4TGh2czR1?=
 =?utf-8?B?UXVYY21zVXRDemJ0RVFPeFlScGZkdTgyM1hyVm9XQ1hLV2hiUGxrbnBEZWYy?=
 =?utf-8?B?U2VqWlU0Vy85SXNYRUZxWERnTnQ1a0xvZUVVaWJyYy9LU1R0VFBnMkJZbTdW?=
 =?utf-8?B?bUhVUTZaRkt1aHBsdWNNMW1QaFRtcnZtdENMWUVjRlVpY3lkOTJhWVZoVzM1?=
 =?utf-8?B?R216d3NnUHkxbkhyYnVYazFVeGxONDUzdHpnbEJZL084TytEY0Y3WnJiQXds?=
 =?utf-8?B?OFl5Z25RanBLMjcyRExnWXBNT1ZkT1c0dTFrUUZobEtFd2VpVTM0QkcwTXU2?=
 =?utf-8?B?UE0zQi9SVnIyQzcrTnpoNW9IQ3NQVUEyajdwcyttVzlhMFhLQ0N6eXZkaTdv?=
 =?utf-8?B?c3dSeFplQnRhelNEL3pWMk5BZDUrY1R3OXl4MFlrL3ZUeXZSdXNYZ3BWcWlw?=
 =?utf-8?B?V3B2NGptUWpreWlzV3B1eUNSdjZBV2RTMlpvamhCTlROL3M3aHA5VzhVbXRn?=
 =?utf-8?B?UlFjajU1V0twWTdneHhSR3loQUV5VlBOSU4rYVptd0Z6LzIxMk45TWlYYjhC?=
 =?utf-8?B?WU5ZdHdYV3kwTXdXU1E0bHhzWERQR3F4RmNvRUJrem1uM3p3SmVXSjlEbXh4?=
 =?utf-8?B?Y2xweGdtWWV5ajdOazc4Ykg0U1dqSVN3SUJBdWYxNVk5YzJuUnI5bTdTNE02?=
 =?utf-8?B?aWVUbCtIZWZLcHZRTHI1bnlpTzlzczhjTm9jYTYwekI4N0hrSWNtUDBadUR1?=
 =?utf-8?B?d21hWkNhM3BaK3dMS2Z0UVYwU1A1MVVpOHQrQ2pTb01JZ244V3JNM3dqME1l?=
 =?utf-8?B?NGpiY21TbE1uTnNxaUQrZGRPeWNjbEFNczlHUnhiSURBTUdvRllSb3MrSVdx?=
 =?utf-8?B?SGdXd0dlb3VVWW1sNjdVZ0dsVTd0VG9ZV1dhZ3U0U3NSak9ZOXJTOElQdDhO?=
 =?utf-8?B?T3o3TzNjdlVrTmlFZTZKTG9qbEloalRxakFKK29KU1BINGdIOFhLc0I4S05Q?=
 =?utf-8?B?MURleVpPUnFOT28yQ0pVU3duZGZ5OTh0K1pxMzB1Rk0zeHB0dFZKdFRNcVR2?=
 =?utf-8?B?NGF6eGNUMUs4Qk9jZnlBSGRoK25lV0ViUi8rcWFKbDU3c3JJdWFFV3lwT1A4?=
 =?utf-8?B?eU5nRWh0NGYwMUhlQUdGSlVSZkRwbjRpQ1c1cE1SeVZFYVJOT0x5dFZiVTFh?=
 =?utf-8?B?dGFqemc3YkVMM3ROVzEvRXJYL2hJczl0ZkZERE90Y09RYjJGU1hIR2xhNEJE?=
 =?utf-8?B?K1Z5ck80MVpHWlVYOGIrdUE3VU1VK0NaWWlXcmNGdXRvSjVqYjVFMzlGREhU?=
 =?utf-8?B?QTUzaXphcHpjaHNyOVhxcktZVzR6a1Y0cVJpa1BJR1dHelFpaURSMkNXYlBB?=
 =?utf-8?B?SHJvbmg1cTF1MFBuQmpRK1B3MnpZbjc5dDhxdEhkaXdmSWxUQUJRa1lQMTVx?=
 =?utf-8?B?bnh3TGJDcWFwRENHTGJqL1JSMVh1VG1tSC9PZEhVekZyVzFYNldmUDZjbVpO?=
 =?utf-8?B?TkhyQWRFNVowVXFFa24zaFBxMFk5aVprM0NLUGVQMTh0NkJ4TFZsbFBFZTNU?=
 =?utf-8?B?OXl1UFBFTVFFR1JxY1ZjVi9vMEVhZjVhTHdCMjB5ZTFpN3Bib3prVlRaRWpN?=
 =?utf-8?B?TXQwL2pzejJHYUFyekZhU2MyamVJcVppeWtCM0VMYmJHNFdmQVR5aFVrWFM0?=
 =?utf-8?B?SlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 958e6947-0e96-4800-c7bf-08de03cf013c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2025 05:21:14.9425 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kDCoCUK+9AtYU9X+O3zJS/ZW6tqvlC1fP7HgFse4eBMkXpuip4w8ZD5iAyemSyKx4H6v81UL9QKk6lwizysdfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5084
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

On Thu, Oct 02, 2025 at 05:14:51PM +0100, Matthew Auld wrote:
> On 02/10/2025 06:53, Matthew Brost wrote:
> > VF migration requires jobs to remain pending so they can be replayed
> > after the VF comes back. Previously, LR job fences were intentionally
> > signaled immediately after submission to avoid the risk of exporting
> > them, as these fences do not naturally signal in a timely manner and
> > could break dma-fence contracts. A side effect of this approach was that
> > LR jobs were never added to the DRM scheduler’s pending list, preventing
> > them from being tracked for later resubmission.
> > 
> > We now avoid signaling LR job fences and ensure they are never exported;
> > Xe already guards against exporting these internal fences. With that
> > guarantee in place, we can safely track LR jobs in the scheduler’s
> > pending list so they are eligible for resubmission during VF
> > post-migration recovery (and similar recovery paths).
> > 
> > An added benefit is that LR queues now gain the DRM scheduler’s built-in
> > flow control over ring usage rather than rejecting new jobs in the exec
> > IOCTL if the ring is full.
> > 
> > v2:
> >   - Ensure DRM scheduler TDR doesn't run for LR jobs
> >   - Stack variable for killed_or_banned_or_wedged
> > v4:
> >   - Clarify commit message (Tomasz)
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > Reviewed-by: Tomasz Lis <tomasz.lis@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_exec.c       | 12 ++-------
> >   drivers/gpu/drm/xe/xe_exec_queue.c | 19 -------------
> >   drivers/gpu/drm/xe/xe_exec_queue.h |  2 --
> >   drivers/gpu/drm/xe/xe_guc_submit.c | 43 ++++++++++++++++++++----------
> >   4 files changed, 31 insertions(+), 45 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
> > index 83897950f0da..0dc27476832b 100644
> > --- a/drivers/gpu/drm/xe/xe_exec.c
> > +++ b/drivers/gpu/drm/xe/xe_exec.c
> > @@ -124,7 +124,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> >   	struct xe_validation_ctx ctx;
> >   	struct xe_sched_job *job;
> >   	struct xe_vm *vm;
> > -	bool write_locked, skip_retry = false;
> > +	bool write_locked;
> >   	int err = 0;
> >   	struct xe_hw_engine_group *group;
> >   	enum xe_hw_engine_group_execution_mode mode, previous_mode;
> > @@ -266,12 +266,6 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> >   		goto err_exec;
> >   	}
> > -	if (xe_exec_queue_is_lr(q) && xe_exec_queue_ring_full(q)) {
> > -		err = -EWOULDBLOCK;	/* Aliased to -EAGAIN */
> > -		skip_retry = true;
> > -		goto err_exec;
> > -	}
> > -
> >   	if (xe_exec_queue_uses_pxp(q)) {
> >   		err = xe_vm_validate_protected(q->vm);
> >   		if (err)
> > @@ -328,8 +322,6 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> >   		xe_sched_job_init_user_fence(job, &syncs[i]);
> >   	}
> > -	if (xe_exec_queue_is_lr(q))
> > -		q->ring_ops->emit_job(job);
> >   	if (!xe_vm_in_lr_mode(vm))
> >   		xe_exec_queue_last_fence_set(q, vm, &job->drm.s_fence->finished);
> >   	xe_sched_job_push(job);
> > @@ -355,7 +347,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> >   		xe_validation_ctx_fini(&ctx);
> >   err_unlock_list:
> >   	up_read(&vm->lock);
> > -	if (err == -EAGAIN && !skip_retry)
> > +	if (err == -EAGAIN)
> >   		goto retry;
> >   err_hw_exec_mode:
> >   	if (mode == EXEC_MODE_DMA_FENCE)
> > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> > index 6bfaca424ca3..81f707d2c388 100644
> > --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> > +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> > @@ -824,25 +824,6 @@ bool xe_exec_queue_is_lr(struct xe_exec_queue *q)
> >   		!(q->flags & EXEC_QUEUE_FLAG_VM);
> >   }
> > -static s32 xe_exec_queue_num_job_inflight(struct xe_exec_queue *q)
> > -{
> > -	return q->lrc[0]->fence_ctx.next_seqno - xe_lrc_seqno(q->lrc[0]) - 1;
> > -}
> > -
> > -/**
> > - * xe_exec_queue_ring_full() - Whether an exec_queue's ring is full
> > - * @q: The exec_queue
> > - *
> > - * Return: True if the exec_queue's ring is full, false otherwise.
> > - */
> > -bool xe_exec_queue_ring_full(struct xe_exec_queue *q)
> > -{
> > -	struct xe_lrc *lrc = q->lrc[0];
> > -	s32 max_job = lrc->ring.size / MAX_JOB_SIZE_BYTES;
> > -
> > -	return xe_exec_queue_num_job_inflight(q) >= max_job;
> > -}
> > -
> >   /**
> >    * xe_exec_queue_is_idle() - Whether an exec_queue is idle.
> >    * @q: The exec_queue
> > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
> > index 8821ceb838d0..a4dfbe858bda 100644
> > --- a/drivers/gpu/drm/xe/xe_exec_queue.h
> > +++ b/drivers/gpu/drm/xe/xe_exec_queue.h
> > @@ -64,8 +64,6 @@ static inline bool xe_exec_queue_uses_pxp(struct xe_exec_queue *q)
> >   bool xe_exec_queue_is_lr(struct xe_exec_queue *q);
> > -bool xe_exec_queue_ring_full(struct xe_exec_queue *q);
> > -
> >   bool xe_exec_queue_is_idle(struct xe_exec_queue *q);
> >   void xe_exec_queue_kill(struct xe_exec_queue *q);
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index 13746f32b231..3a534d93505f 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -851,30 +851,31 @@ guc_exec_queue_run_job(struct drm_sched_job *drm_job)
> >   	struct xe_sched_job *job = to_xe_sched_job(drm_job);
> >   	struct xe_exec_queue *q = job->q;
> >   	struct xe_guc *guc = exec_queue_to_guc(q);
> > -	struct dma_fence *fence = NULL;
> > -	bool lr = xe_exec_queue_is_lr(q);
> > +	bool lr = xe_exec_queue_is_lr(q), killed_or_banned_or_wedged =
> > +		exec_queue_killed_or_banned_or_wedged(q);
> >   	xe_gt_assert(guc_to_gt(guc), !(exec_queue_destroyed(q) || exec_queue_pending_disable(q)) ||
> >   		     exec_queue_banned(q) || exec_queue_suspended(q));
> >   	trace_xe_sched_job_run(job);
> > -	if (!exec_queue_killed_or_banned_or_wedged(q) && !xe_sched_job_is_error(job)) {
> > +	if (!killed_or_banned_or_wedged && !xe_sched_job_is_error(job)) {
> >   		if (!exec_queue_registered(q))
> >   			register_exec_queue(q, GUC_CONTEXT_NORMAL);
> > -		if (!lr)	/* LR jobs are emitted in the exec IOCTL */
> > -			q->ring_ops->emit_job(job);
> > +		q->ring_ops->emit_job(job);
> >   		submit_exec_queue(q);
> >   	}
> > -	if (lr) {
> > -		xe_sched_job_set_error(job, -EOPNOTSUPP);
> > -		dma_fence_put(job->fence);	/* Drop ref from xe_sched_job_arm */
> > -	} else {
> > -		fence = job->fence;
> > -	}
> > +	/*
> > +	 * We don't care about job-fence ordering in LR VMs because these fences
> > +	 * are never exported; they are used solely to keep jobs on the pending
> > +	 * list. Once a queue enters an error state, there's no need to track
> > +	 * them.
> > +	 */
> > +	if (killed_or_banned_or_wedged && lr)
> > +		xe_sched_job_set_error(job, -ECANCELED);
> > -	return fence;
> > +	return job->fence;
> >   }
> >   static void guc_exec_queue_free_job(struct drm_sched_job *drm_job)
> > @@ -916,7 +917,8 @@ static void disable_scheduling_deregister(struct xe_guc *guc,
> >   		xe_gt_warn(q->gt, "Pending enable/disable failed to respond\n");
> >   		xe_sched_submission_start(sched);
> >   		xe_gt_reset_async(q->gt);
> > -		xe_sched_tdr_queue_imm(sched);
> > +		if (!xe_exec_queue_is_lr(q))
> > +			xe_sched_tdr_queue_imm(sched);
> >   		return;
> >   	}
> > @@ -1008,6 +1010,7 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
> >   	struct xe_exec_queue *q = ge->q;
> >   	struct xe_guc *guc = exec_queue_to_guc(q);
> >   	struct xe_gpu_scheduler *sched = &ge->sched;
> > +	struct xe_sched_job *job;
> >   	bool wedged = false;
> >   	xe_gt_assert(guc_to_gt(guc), xe_exec_queue_is_lr(q));
> > @@ -1058,7 +1061,16 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
> >   	if (!exec_queue_killed(q) && !xe_lrc_ring_is_idle(q->lrc[0]))
> >   		xe_devcoredump(q, NULL, "LR job cleanup, guc_id=%d", q->guc->id);
> > +	xe_hw_fence_irq_stop(q->fence_irq);
> > +
> >   	xe_sched_submission_start(sched);
> > +
> > +	spin_lock(&sched->base.job_list_lock);
> > +	list_for_each_entry(job, &sched->base.pending_list, drm.list)
> > +		xe_sched_job_set_error(job, -ECANCELED);
> > +	spin_unlock(&sched->base.job_list_lock);
> > +
> > +	xe_hw_fence_irq_start(q->fence_irq);
> >   }
> >   #define ADJUST_FIVE_PERCENT(__t)	mul_u64_u32_div(__t, 105, 100)
> > @@ -1129,7 +1141,8 @@ static void enable_scheduling(struct xe_exec_queue *q)
> >   		xe_gt_warn(guc_to_gt(guc), "Schedule enable failed to respond");
> >   		set_exec_queue_banned(q);
> >   		xe_gt_reset_async(q->gt);
> > -		xe_sched_tdr_queue_imm(&q->guc->sched);
> > +		if (!xe_exec_queue_is_lr(q))
> > +			xe_sched_tdr_queue_imm(&q->guc->sched);
> >   	}
> >   }
> > @@ -1187,6 +1200,8 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> >   	int i = 0;
> >   	bool wedged = false, skip_timeout_check;
> > +	xe_gt_assert(guc_to_gt(guc), !xe_exec_queue_is_lr(q));
> 
> Just some questions around guc_exec_queue_stop/start(). In queue_stop there
> is:
> 
> struct xe_sched_job *job = xe_sched_first_pending_job(sched);
> bool ban = false;
> 
> if (job) {
>     if ((xe_sched_job_started(job) &&
> 	!xe_sched_job_completed(job)) ||
> 	xe_sched_invalidate_job(job, 2)) {
> 	    trace_xe_sched_job_ban(job);
> 	    ban = true;
> 	}
> } else if (xe_exec_queue_is_lr(q) &&
> 	   !xe_lrc_ring_is_idle(q->lrc[0])) {
>     ban = true;
> }
> 
> Do we still need this else if branch, since the job path is now being taken
> for lr?
> 
> Also I guess first_pending_job() strikes again? If it's pending/complete but
> we still have something else in-progress in the pending_list they get away
> clean? Not sure what happens if you skip the ban and get as far as resubmit?
> 

I think there needs to be follow on to do a bit of cleanup related to LR
jobs (e.g., drop some special casing here, drop some ref counting
tricks, and drop the lr_tdr). I have patches locally which do this but I
don't really want to expand the scope of this series as it already quite
large. I plan on posting those patches once this series merges.

Matt 

> > +
> >   	/*
> >   	 * TDR has fired before free job worker. Common if exec queue
> >   	 * immediately closed after last fence signaled. Add back to pending
> 

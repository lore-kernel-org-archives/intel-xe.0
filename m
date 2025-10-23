Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38E30CCD193
	for <intel-xe@archiver.kernel.org>; Thu, 23 Oct 2025 18:55:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC81310E08C;
	Thu, 23 Oct 2025 18:55:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g0fvIRRS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88EB310E08C
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Oct 2025 18:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761245754; x=1792781754;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=91Pn5Rw8/3cYJsr/0xeoTGK+C6TXQ9lLiJsSqdBjwHM=;
 b=g0fvIRRSc+ijzWUiJWo/wxMuFf3sO5fjjR0d3qCLvAN/xySNNqpgewG9
 MsPb4Fjd8TagvGgXNSewHAkssQB4YI/M4Q2dgWyrhv2yCbFq5Z5dKCfw2
 /WcUJcp7hQM+c7Bx1AKpe5JKA5xx6hywVxbctJ0d1TLXqNSgq70qEyV0F
 223ZYSggg+9TIYfGS1OppdDuVD5lK/CActWFfh1B3DLjbNyBhSGqrc1WB
 CvrM+pu4isLR6aRhnpQgLrO/wwsJk/iv9YWLTQ8Vv0KyYwYFiCzd0PVmF
 S8OO/k+aJ9xVqWW+CLFuKsRSJ8zemCXyTIg1MtCpEbaks595mEHcn6jY1 Q==;
X-CSE-ConnectionGUID: dPv2rmTFS1+ddHLDtitDsw==
X-CSE-MsgGUID: kqIf89WsQPCbNF3W5zkt/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74546837"
X-IronPort-AV: E=Sophos;i="6.19,250,1754982000"; d="scan'208";a="74546837"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 11:55:53 -0700
X-CSE-ConnectionGUID: kEwxHZtYR4KlzO7Wk/o32w==
X-CSE-MsgGUID: irsUlhV0Q3WUO5gfaD7FFA==
X-ExtLoop1: 1
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 11:55:53 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 23 Oct 2025 11:55:52 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 23 Oct 2025 11:55:52 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.47) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 23 Oct 2025 11:55:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rbzXYpy8JPxBXwaXw34TeKs2/anS7J6EPyXRe8i6KojdB2ubiNTBS4uPuGqMgvk6PX4dhtpoAqSC8oHLvnoSUl4v2H3RuUTKrMtpp5DXbtg4Zh5CCk/ZzCUuI/bGNUCzrjE2lYSjJzWwNKvpz5/wGbtvdqPjGNNJH5yV0WaFDBB4UdEOaqNRJyopicnn7vsiHYxFIbi5QcrocbhiDpJYVOEGlco4BJPMbe+/+9Z8TqSJkWUGpsYfx+LycQHtlmbegZ1ntfWiSrZDV2JkX5UOHG2UO1/e/tEdr5FZI2i3axlMcsPB/vbzSwLuLCkrTX1itPEcnfVWT+HVvEFAQ1I9GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LC29HrgnSwr3eJwlsfbzwLyLitji/4GE9l9ghZYvpQo=;
 b=NKlB1l25msMSbA4h132EnojOtXnF1ihNYEvVGNqdH1mbLJKOQCzHiqATOzVwWpRGKCPAv/eLSFMr02ugTVNy/9kvtedDEqt0RBwlFPv3/HQMGnEJpjFkTIg62wSNIFrydcU0H0FUc9x40Fg91jGFxpYYs/e7sBp6N5t3Va3k10XpuSa9qBwnSiA8opKbRrLoFmPneyx55vwWxFVOwLMqcmZwjOvGKkOfYw8tQnTdO8fvZHfmxZkxFFxB3b8bmRwkLyMOzQXpN7bnTUgqeZ5hHC4n1VYsgN55dT+cIMGoOyfh0Zfdim3LZz87xJQKMT51HL1/GdHkl+ygVGn8txpBTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by BL3PR11MB6340.namprd11.prod.outlook.com (2603:10b6:208:3b4::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Thu, 23 Oct
 2025 18:55:48 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 18:55:47 +0000
Date: Thu, 23 Oct 2025 11:55:45 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Tvrtko Ursulin <tursulin@ursulin.net>
CC: <intel-xe@lists.freedesktop.org>, <carlos.santa@intel.com>,
 <thomas.hellstrom@linux.intel.com>, Philipp Stanner <phasta@kernel.org>
Subject: Re: [PATCH 1/1] drm/xe: Avoid serializing unbind jobs on prior TLB
 invalidations
Message-ID: <aPp6MZbGDJZzFvyR@lstrano-desk.jf.intel.com>
References: <20251017165217.493595-1-matthew.brost@intel.com>
 <20251017165217.493595-2-matthew.brost@intel.com>
 <f7f83835-adaa-426a-94a5-21ad3bb240ff@ursulin.net>
 <aPjz5BHrNbUBUk8L@lstrano-desk.jf.intel.com>
 <24e3535c-6729-4c48-a350-d32421688bc6@ursulin.net>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <24e3535c-6729-4c48-a350-d32421688bc6@ursulin.net>
X-ClientProxiedBy: SJ0PR03CA0160.namprd03.prod.outlook.com
 (2603:10b6:a03:338::15) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|BL3PR11MB6340:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d49f101-e0df-4174-8f59-08de1265c727
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WGozODdndDJITUxDSmcwYXgyeS9hTENETzRMRmloWjlGb1ZVbnd3emdOQzd1?=
 =?utf-8?B?N21Qc1p1aE5UTURqOGYxcml3bnRLU2oxVTVIMzlIdE9rVXhIOU9LMEZsMHdl?=
 =?utf-8?B?V0RZYk9qMDFYZFYrdVVlRUdiamlIWWdVQm95aTdoYkRzZjZ3TWkyZDg1b3c4?=
 =?utf-8?B?bUZvWDRJR0VvbXBQU01DUzZrTGJZQ2gyUTdDUVpiSW1nWTl2VkZ4dnZwUzJx?=
 =?utf-8?B?Z1Q4bWNYeVBXSTI4TnZYQlVNNDZoV1ZZL0NMQ1dtbWxwSXBUUk9DeXFDLzhN?=
 =?utf-8?B?aUZrY2NnbnRkVTdEdzU5WCs3SGJ2QXNYbjhWRkowQ2xrUG1udjYrVlI5WTZI?=
 =?utf-8?B?aW9HT0h2U1RWbkV4ZTJqRXdYSjN1L3pvTk5VcVc1Z0xtTTNZSEI2dDE5K3pX?=
 =?utf-8?B?VzBQcXMyRUZKNXpiWnMxUmhZV2dmWkNoQnRBOEV3QkhObDJpdVlPUG1vdWRR?=
 =?utf-8?B?d1BCZUNnN0p0Y01TMEtCVlF1SEFuU3l3VUlaSXpJUTR2S09aNlR3Y2dtSkpS?=
 =?utf-8?B?V1c3akpnTWM0QmFiSHdldUFORUpRUzdlU0FBM1NBMXhyTWRqOU9rVk9kMWlO?=
 =?utf-8?B?NGs1a1loM2JhOUVCRTE1Z2wrRThSZnRHNWtOWm8rbS9BYVBkYVhHd1FabDQy?=
 =?utf-8?B?NDlKaXRoQ1Z5SktSbE14ZTdLN0UzOXgxQ2gwdGIxL2NpM3duVXVMR3MzVDBQ?=
 =?utf-8?B?bi9abm1QNmJiMzRMKzlRaVRid01IWkd1RlZpdWo4ZFlQenBMN1RrZVlUWnpj?=
 =?utf-8?B?czdTYWZNbEd2dkNTbVpTYU5xQjQzb0JzVHBhV3FzZi9DK3lsYzQxNXhzNDZt?=
 =?utf-8?B?ajl1YXhacm1LMURnV3Z1T3RIOU9pOTZqVndOSk9GdCsvbVl3Y2M2ZDB2UUd2?=
 =?utf-8?B?TGVyRWdJaG5RcGlMVXcxWVVKeHRLTzJlUTRUanlRUk5jSlhFaVlKeEMyNVdU?=
 =?utf-8?B?eVVpQzczSHVlWHorT01Qc0tIRXdoLzE3YTFyMmZQeG5ZTDQzUmY1MExFemdi?=
 =?utf-8?B?MzZzcmczRURDSUV0cFduRDJRMmZoVXRISHY3SGZ5Ym1hUkc4VWZ1UTJCU09p?=
 =?utf-8?B?ejJxUGU2VkRnK1VSQUJBRGQxUFJ5OGI5OURSZS8wMWVnalI4dGhLN2hYREdV?=
 =?utf-8?B?eGRqdDNoNktxcXNYeVZvQ2RFVlhWZEZmNEdqZ2dTaGpkT1pteFpmT3dacjRM?=
 =?utf-8?B?dU83VlFMc1NaVFpQMjB5UGdHMVlrUnFOQzNjMDNLNlQ3M3VqcWNEczFlaXBL?=
 =?utf-8?B?ZVNxTUVGMnRNd245TXhnV0RQWmFZcEp4OEFwTW5Ta0lRT0R5SFAxazNXM0o5?=
 =?utf-8?B?emZlN2pDcFFoMGZDMkJsanovSFRJTlg1elkwRGJvc1JYOUVaU3M5QmdZdS9W?=
 =?utf-8?B?VzllZ3RiYWU5SUM0eURxUmhyU1dnQU0yR1Zva0lhYktCWUdGcFB5MkRVL3lY?=
 =?utf-8?B?V2tYa3N0Rlcwc1pvZWM4Y2kxamRCQVpkK0VERjVEZTQvRVFsWStmSkpnOTdr?=
 =?utf-8?B?NFMwMWF1ckR4ampnc2RUVzZGdUNEUmJyNVdOS3N6WWRCUXZSaEQzYnEyY0VI?=
 =?utf-8?B?TkdlK1dkTmo0SUlYbENjaDhlMFJVa1JSNHRqUTU1czdwZmpUcVpxS2VEaks5?=
 =?utf-8?B?WkVCNVM0Q2R5SStlb2Qxdng2TzhkOG9YRG9wNjJMclNvSXlWSEdVVCtGMFpK?=
 =?utf-8?B?Y21IZTZnOTNoOE9WV0RnTEUrNXFWRGdEaUhPaG9HVmU0NWJCSm5lOGl6Y2Nt?=
 =?utf-8?B?MXBXNTNRTjgwbzlVT29CS3pVb05yR1NyQkdUMy9tQ2NnN3o2OWFXRENEckMx?=
 =?utf-8?B?eDRyUXNvcklSejZBdVZnWFJDYWJkTnBpWWJjQ0tBWCtJdjdtT2VHSGJQUEll?=
 =?utf-8?B?cHk1OEkwY2dhL0tSQWtsZjFPTUU1cHQ5cmhYMFVxSGNvemc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bkRzcHdJQXdLb2g5RExQL04xTTlZaXorZ0RNU2hXZ1BRQjhCQVJqdVp6ZXcy?=
 =?utf-8?B?bHZLMVY0eDFTLzhLOTJHRjVqbURzTFhYQVV0ZTQ1SXk3YTVmUWRyL1lPVXpT?=
 =?utf-8?B?ZXRpMVlxUmdNb1hNNHpBNStkc0NrZUpMRU5VeGp1NVp0c0lzK2NZMlRITnlN?=
 =?utf-8?B?VzY5b01EU09aYlZYUlo3ZHJ3azNzMndqQzQ2YlBoWFdGakV3TVNJd1Avdlcw?=
 =?utf-8?B?RXBqSU5VN1Mwa3ExWUoyUGZ2WVc1M0lCYnlGOGdRZWpxTkc5ZnNEbVA0MTcx?=
 =?utf-8?B?NFJtMnVZR2hkM2RqdHZqbUZGUDZVLzRtM0FlZHJrNi91ajRJNjVoVjIrQmpD?=
 =?utf-8?B?SXJpTE5sOGpvdHpvWGZ0aDlKS0FzVVU3MjErVG5HTHpyNGRaVHJXTXdlRmpC?=
 =?utf-8?B?emFZcnZ5d0xiQklYUS9iZ05RTkJoR3h6dURrNXZaTTF1bXlYamJrajcxR1o4?=
 =?utf-8?B?bkZSdy9GWWZLaGdxRGwzWWh2VUw2a0JObXduRmVwYnRHMkVpQk5QeitNekNi?=
 =?utf-8?B?Q0VSRll4OVNHemp4QkFOcWQ5NWVtM0tINmRseGtDMEVCTTF2WGJQL0duTG5G?=
 =?utf-8?B?K3UxRkhIRmd1L2phTTdPT01TVWI0YTBTWDlnNGRxYis0VWFXU1lXejdZUk90?=
 =?utf-8?B?cjlIOUVnMWszQkgyUXlTcnNmS0ZkU1pVcTFrUE1QdWhpUXpBT2ZCNDdINFgr?=
 =?utf-8?B?dGRaRWVUY2NEL2JYc1J2eENLYlBvMkZrQ090UldmMnZibE9TMVdQRytDdGk4?=
 =?utf-8?B?aUFvaStLZ052TlN4ZURDTTFkQUt5VlZJSmhxYklVc1h6QjN4dHNCbFhILzNr?=
 =?utf-8?B?UUdBV21tR01ucGp5Z2tENEtxL2d4MmtxbmZlVUdkd3ZCVU92SjN2M1dJMlNZ?=
 =?utf-8?B?UGFCcW9hODhtUEc1WEQ4SXZsOWxscUNVVmZrZnViRW14bkNWSWJ3bGJYQXpL?=
 =?utf-8?B?dFY2Zko0ci93WjZMc3NtbVlJdTk1MXFCWndyMkk4eExqY2tpVkVZYng2dURH?=
 =?utf-8?B?NlZuU2VRU3hLTGQ5dXNZQXk0Y1YrZFV6bHl0NFlPMXovWVhFa0lVUHUrQUR4?=
 =?utf-8?B?WVJqZXRXUklXK2NYRHJHZXUyZ2tUaFhjaXE4RVNTVU5ZSnNZblRDNStWdGhL?=
 =?utf-8?B?ZHZEZWJlK0xLU1VNTmlvOFlJVVhuK0x0WWNuandaYlE3Uk52WHRablc2VWp2?=
 =?utf-8?B?Uk5YcE8vZWpMTU5YWHFEcTlHVkJDZ3hSK2RNYVhzWGFRYWFKSUI3MmYvSzZi?=
 =?utf-8?B?d08rdkp4T0JJZ09vODVzYVl6eGFmajBnZHVwNTJUS2s5TUJ1b0NNYWVRM2NH?=
 =?utf-8?B?d2FmWlBEb2lyRXNYZjBnMlNvR3dSOU9kZHpvMjRHdVpGVWlPcUYvbTdqVHI4?=
 =?utf-8?B?V2RlZm1QSGliM0E0RG9mQUJjNzZHZG1ndFJWUmM4M1g3cXRSWFR3N09McUMy?=
 =?utf-8?B?UjZyWEZDWXpXY2RlcG1JUSt5eU1nMUMxOTZZZ01sMStUdkFtRGZLS1RIeEps?=
 =?utf-8?B?ODRsSEFQT2dEdjRoamhGTkp4N25SNFRKYXh1Z21YNGFkOFVRTXpUdEx1VzB0?=
 =?utf-8?B?UnJZa1Z4RDJxek1ZMTVCbXdQTEFySEErSEZGMkU3V25vUHQxRVBoQlgyS1Jt?=
 =?utf-8?B?V0drbUx4TG94U29hdUxDb0FDNHprTzRzbEt2djVmR0lMSHU0WWQyQ0t4Mi9j?=
 =?utf-8?B?OEtjdG4rZlJGQldmaWZwZ0xjclp3c1M0ckR4U0hLL0VnUm1rSk00NUYvaTFC?=
 =?utf-8?B?TXc3TU5ZVTgyWUhnc3dYaDhqR2NJcGJYR3dvbmxkNEhCdk1SQlFRRGN2OVBE?=
 =?utf-8?B?d0VSTmR3OXhFd0JBNFV5MXhBZ3h0NWNqMmEwS1NmL2VsWXBNUWdWWmJPWFJi?=
 =?utf-8?B?ZktsU1ZVV1g0TkNSclI0WStjVTVCNnJ1Vzd6K0phV0tSNzVlVWxtS0ExT1cy?=
 =?utf-8?B?cm5OWFZZUHM1UDFXNzRjZW14ak1aNG5Ra1dZd3hmSmpsMFZtM3F4VUsrRkl3?=
 =?utf-8?B?ZzdTc1EyMFlUeXBDY1hPWFZQeWxsSm14YjBQWmhyZWdaSENxWkxWS1ZmZWFV?=
 =?utf-8?B?Q0hTZWFhTUhoWkpPdHRxU0NqT09sQ0E0bGRMVGM5Y1BjclJKOWNYaXlGbC92?=
 =?utf-8?B?TGtjZzhBTjJJVjhGWnU5UXMvNk16VWgwS3hhUHRlaW94eWN6U3pxQkVRT0M4?=
 =?utf-8?B?K2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d49f101-e0df-4174-8f59-08de1265c727
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 18:55:47.7544 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fWJd1n6sBN70WgNNJzaMaiX8cssw/nhWax8vb/PuGvHQOiMxOfScO6yxqwqHE6LNZkW7z8OSu9u1JoT/8EKQGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6340
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

On Thu, Oct 23, 2025 at 01:46:26PM +0100, Tvrtko Ursulin wrote:
> 
> On 22/10/2025 16:10, Matthew Brost wrote:
> > On Wed, Oct 22, 2025 at 09:00:47AM +0100, Tvrtko Ursulin wrote:
> > > 
> > > On 17/10/2025 17:52, Matthew Brost wrote:
> > > > When a burst of unbind jobs is issued, a dependency chain can form
> > > > between the TLB invalidation of a previous unbind job and the current
> > > > one. This leads to undesirable serialization, causing current jobs to
> > > > wait unnecessarily for prior TLB invalidations, execute on the GPU when
> > > > not needed, and significantly slow down the unbind burst—resulting in up
> > > > to a 4× slowdown.
> > > > 
> > > > To break this chain, mask the last bind queue dependency if the last
> > > > fence's DMA context matches the TLB invalidation context. This allows
> > > > full pipelining of unbinds and TLB invalidations while preserving
> > > > correct dma-fence signaling semantics.
> > > > 
> > > > Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6047
> > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > ---
> > > >    drivers/gpu/drm/xe/xe_exec.c          |  3 +-
> > > >    drivers/gpu/drm/xe/xe_exec_queue.c    | 18 +++++++++--
> > > >    drivers/gpu/drm/xe/xe_exec_queue.h    |  3 +-
> > > >    drivers/gpu/drm/xe/xe_pt.c            | 15 +++++++--
> > > >    drivers/gpu/drm/xe/xe_sched_job.c     | 44 ++++++++++++++++++++++++++-
> > > >    drivers/gpu/drm/xe/xe_sched_job.h     |  7 ++++-
> > > >    drivers/gpu/drm/xe/xe_tlb_inval_job.c | 14 +++++++++
> > > >    drivers/gpu/drm/xe/xe_tlb_inval_job.h |  2 ++
> > > >    8 files changed, 98 insertions(+), 8 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
> > > > index 0dc27476832b..6034cfc8be06 100644
> > > > --- a/drivers/gpu/drm/xe/xe_exec.c
> > > > +++ b/drivers/gpu/drm/xe/xe_exec.c
> > > > @@ -294,7 +294,8 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> > > >    		goto err_put_job;
> > > >    	if (!xe_vm_in_lr_mode(vm)) {
> > > > -		err = xe_sched_job_last_fence_add_dep(job, vm);
> > > > +		err = xe_sched_job_last_fence_add_dep(job, vm, NO_MASK_DEP,
> > > > +						      NO_MASK_DEP);
> > > >    		if (err)
> > > >    			goto err_put_job;
> > > > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> > > > index 90cbc95f8e2e..d6f69d9bccba 100644
> > > > --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> > > > +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> > > > @@ -25,6 +25,7 @@
> > > >    #include "xe_migrate.h"
> > > >    #include "xe_pm.h"
> > > >    #include "xe_ring_ops_types.h"
> > > > +#include "xe_sched_job.h"
> > > >    #include "xe_trace.h"
> > > >    #include "xe_vm.h"
> > > >    #include "xe_pxp.h"
> > > > @@ -1106,11 +1107,17 @@ void xe_exec_queue_last_fence_set(struct xe_exec_queue *q, struct xe_vm *vm,
> > > >     * xe_exec_queue_last_fence_test_dep - Test last fence dependency of queue
> > > >     * @q: The exec queue
> > > >     * @vm: The VM the engine does a bind or exec for
> > > > + * @mask_ctx0: Mask dma-fence context0
> > > > + * @mask_ctx1: Mask dma-fence context1
> > > > + *
> > > > + * Test last fence dependency of queue, skipping masked dma fence contexts.
> > > >     *
> > > >     * Returns:
> > > > - * -ETIME if there exists an unsignalled last fence dependency, zero otherwise.
> > > > + * -ETIME if there exists an unsignalled and unmasked last fence dependency,
> > > > + * zero otherwise.
> > > >     */
> > > > -int xe_exec_queue_last_fence_test_dep(struct xe_exec_queue *q, struct xe_vm *vm)
> > > > +int xe_exec_queue_last_fence_test_dep(struct xe_exec_queue *q, struct xe_vm *vm,
> > > > +				      u64 mask_ctx0, u64 mask_ctx1)
> > > >    {
> > > >    	struct dma_fence *fence;
> > > >    	int err = 0;
> > > > @@ -1119,6 +1126,13 @@ int xe_exec_queue_last_fence_test_dep(struct xe_exec_queue *q, struct xe_vm *vm)
> > > >    	if (fence) {
> > > >    		err = test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags) ?
> > > >    			0 : -ETIME;
> > > > +
> > > > +		if (err == -ETIME) {
> > > > +			if (xe_sched_job_mask_dependency(fence, mask_ctx0,
> > > > +							 mask_ctx1))
> > > > +				err = 0;
> > > > +		}
> > > > +
> > > >    		dma_fence_put(fence);
> > > >    	}
> > > > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
> > > > index a4dfbe858bda..99a35b22a46c 100644
> > > > --- a/drivers/gpu/drm/xe/xe_exec_queue.h
> > > > +++ b/drivers/gpu/drm/xe/xe_exec_queue.h
> > > > @@ -85,7 +85,8 @@ struct dma_fence *xe_exec_queue_last_fence_get_for_resume(struct xe_exec_queue *
> > > >    void xe_exec_queue_last_fence_set(struct xe_exec_queue *e, struct xe_vm *vm,
> > > >    				  struct dma_fence *fence);
> > > >    int xe_exec_queue_last_fence_test_dep(struct xe_exec_queue *q,
> > > > -				      struct xe_vm *vm);
> > > > +				      struct xe_vm *vm, u64 mask_ctx0,
> > > > +				      u64 mask_ctx1);
> > > >    void xe_exec_queue_update_run_ticks(struct xe_exec_queue *q);
> > > >    int xe_exec_queue_contexts_hwsp_rebase(struct xe_exec_queue *q, void *scratch);
> > > > diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> > > > index d22fd1ccc0ba..bba9ae559f57 100644
> > > > --- a/drivers/gpu/drm/xe/xe_pt.c
> > > > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > > > @@ -1341,10 +1341,21 @@ static int xe_pt_vm_dependencies(struct xe_sched_job *job,
> > > >    	}
> > > >    	if (!(pt_update_ops->q->flags & EXEC_QUEUE_FLAG_KERNEL)) {
> > > > +		u64 mask_ctx0 = NO_MASK_DEP, mask_ctx1 = NO_MASK_DEP;
> > > > +
> > > > +		if (ijob)
> > > > +			mask_ctx0 = xe_tlb_inval_job_fence_context(ijob);
> > > > +		if (mjob)
> > > > +			mask_ctx1 = xe_tlb_inval_job_fence_context(mjob);
> > > > +
> > > >    		if (job)
> > > > -			err = xe_sched_job_last_fence_add_dep(job, vm);
> > > > +			err = xe_sched_job_last_fence_add_dep(job, vm,
> > > > +							      mask_ctx0,
> > > > +							      mask_ctx1);
> > > >    		else
> > > > -			err = xe_exec_queue_last_fence_test_dep(pt_update_ops->q, vm);
> > > > +			err = xe_exec_queue_last_fence_test_dep(pt_update_ops->q,
> > > > +								vm, mask_ctx0,
> > > > +								mask_ctx1);
> > > >    	}
> > > >    	for (i = 0; job && !err && i < vops->num_syncs; i++)
> > > > diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
> > > > index d21bf8f26964..7cbdd87904c6 100644
> > > > --- a/drivers/gpu/drm/xe/xe_sched_job.c
> > > > +++ b/drivers/gpu/drm/xe/xe_sched_job.c
> > > > @@ -6,6 +6,7 @@
> > > >    #include "xe_sched_job.h"
> > > >    #include <uapi/drm/xe_drm.h>
> > > > +#include <linux/dma-fence-array.h>
> > > >    #include <linux/dma-fence-chain.h>
> > > >    #include <linux/slab.h>
> > > > @@ -295,19 +296,60 @@ void xe_sched_job_push(struct xe_sched_job *job)
> > > >    	xe_sched_job_put(job);
> > > >    }
> > > > +/**
> > > > + * xe_sched_job_mask_dependency() - Determine if a dma-fence dependency can be masked
> > > > + * @fence: The dma-fence to check
> > > > + * @mask_ctx0: First context to compare against the fence's context
> > > > + * @mask_ctx1: Second context to compare against the fence's context
> > > > + *
> > > > + * This function checks whether the context of the given dma-fence matches
> > > > + * either of the provided mask contexts. If a match is found, the dependency
> > > > + * represented by the fence can be skipped. If the fence is a dma-fence-array,
> > > > + * its individual fences are unwound and checked.
> > > > + *
> > > > + * Return: true if the fence can be masked (i.e., skipped), false otherwise.
> > > > + */
> > > > +bool xe_sched_job_mask_dependency(struct dma_fence *fence, u64 mask_ctx0,
> > > > +				  u64 mask_ctx1)
> > > > +{
> > > > +	if (dma_fence_is_array(fence)) {
> > > > +		struct dma_fence *__fence;
> > > > +		int index;
> > > > +
> > > > +		dma_fence_array_for_each(__fence, index, fence)
> > > > +			if (__fence->context == mask_ctx0 ||
> > > > +			    __fence->context == mask_ctx1)
> > > > +				return true;
> > > > +	} else if (fence->context == mask_ctx0 ||
> > > > +		   fence->context == mask_ctx1) {
> > > > +		return true;
> > > > +	}
> > > > +
> > > > +	return false;
> > > > +}
> > > > +
> > > >    /**
> > > >     * xe_sched_job_last_fence_add_dep - Add last fence dependency to job
> > > >     * @job:job to add the last fence dependency to
> > > >     * @vm: virtual memory job belongs to
> > > > + * @mask_ctx0: Mask dma-fence context0
> > > > + * @mask_ctx1: Mask dma-fence context1
> > > > + *
> > > > + * Add last fence dependency to job, skipping masked dma fence contexts.
> > > >     *
> > > >     * Returns:
> > > >     * 0 on success, or an error on failing to expand the array.
> > > >     */
> > > > -int xe_sched_job_last_fence_add_dep(struct xe_sched_job *job, struct xe_vm *vm)
> > > > +int xe_sched_job_last_fence_add_dep(struct xe_sched_job *job, struct xe_vm *vm,
> > > > +				    u64 mask_ctx0, u64 mask_ctx1)
> > > >    {
> > > >    	struct dma_fence *fence;
> > > >    	fence = xe_exec_queue_last_fence_get(job->q, vm);
> > > > +	if (xe_sched_job_mask_dependency(fence, mask_ctx0, mask_ctx1)) {
> > > > +		dma_fence_put(fence);
> > > > +		return 0;
> > > > +	}
> > > >    	return drm_sched_job_add_dependency(&job->drm, fence);
> > > >    }
> > > > diff --git a/drivers/gpu/drm/xe/xe_sched_job.h b/drivers/gpu/drm/xe/xe_sched_job.h
> > > > index 3dc72c5c1f13..81d8e848e605 100644
> > > > --- a/drivers/gpu/drm/xe/xe_sched_job.h
> > > > +++ b/drivers/gpu/drm/xe/xe_sched_job.h
> > > > @@ -58,7 +58,8 @@ bool xe_sched_job_completed(struct xe_sched_job *job);
> > > >    void xe_sched_job_arm(struct xe_sched_job *job);
> > > >    void xe_sched_job_push(struct xe_sched_job *job);
> > > > -int xe_sched_job_last_fence_add_dep(struct xe_sched_job *job, struct xe_vm *vm);
> > > > +int xe_sched_job_last_fence_add_dep(struct xe_sched_job *job, struct xe_vm *vm,
> > > > +				    u64 mask_ctx0, u64 mask_ctx1);
> > > >    void xe_sched_job_init_user_fence(struct xe_sched_job *job,
> > > >    				  struct xe_sync_entry *sync);
> > > > @@ -93,4 +94,8 @@ void xe_sched_job_snapshot_print(struct xe_sched_job_snapshot *snapshot, struct
> > > >    int xe_sched_job_add_deps(struct xe_sched_job *job, struct dma_resv *resv,
> > > >    			  enum dma_resv_usage usage);
> > > > +#define NO_MASK_DEP	(~0x0ull)
> > > > +bool xe_sched_job_mask_dependency(struct dma_fence *fence, u64 mask_ctx0,
> > > > +				  u64 mask_ctx1);
> > > > +
> > > >    #endif
> > > > diff --git a/drivers/gpu/drm/xe/xe_tlb_inval_job.c b/drivers/gpu/drm/xe/xe_tlb_inval_job.c
> > > > index 492def04a559..f2fe7f9fbb22 100644
> > > > --- a/drivers/gpu/drm/xe/xe_tlb_inval_job.c
> > > > +++ b/drivers/gpu/drm/xe/xe_tlb_inval_job.c
> > > > @@ -32,6 +32,8 @@ struct xe_tlb_inval_job {
> > > >    	u64 start;
> > > >    	/** @end: End address to invalidate */
> > > >    	u64 end;
> > > > +	/** @fence_context: Fence context for job */
> > > > +	u64 fence_context;
> > > >    	/** @asid: Address space ID to invalidate */
> > > >    	u32 asid;
> > > >    	/** @fence_armed: Fence has been armed */
> > > > @@ -101,6 +103,7 @@ xe_tlb_inval_job_create(struct xe_exec_queue *q, struct xe_tlb_inval *tlb_inval,
> > > >    	job->asid = asid;
> > > >    	job->fence_armed = false;
> > > >    	job->dep.ops = &dep_job_ops;
> > > > +	job->fence_context = entity->fence_context + 1;
> > > 
> > > As a side note, hardcoding the assumption on how scheduler allocates
> > > contexts is not great given recent efforts to make drivers know less of the
> > > scheduler internals.
> > > 
> > 
> > Yes, we should probably have a helper here — maybe
> > drm_sched_job_finished_context?
> > 
> > I was planning to roll this change into [1], but that series hasn’t
> > gained much traction, and fixing this is a fairly high-priority issue
> > for customers.
> > 
> > This is documented in the DRM scheduler kernel docs:
> > entity->fence_context + 1 is the job's finished context.
> > 
> > [1] https://patchwork.freedesktop.org/series/155314/
> > 
> > > But what I really wanted to ask is, having only glanced the patch briefly,
> > > could xe performance problem here also be solved by unwrapping the container
> > > fences at the DRM scheduler dependency tracking level?
> > > 
> > 
> > This is primarily about preventing TLB fences — which originate from a
> > different context than the bind queue but are still ordered on the queue
> > — from becoming dependencies. The process involves two passes: in the
> > first pass, we detect dependencies. If none are found, we immediately
> > complete the bind via the CPU. If dependencies are present, we defer the
> > bind to the GPU.
> 
> Interesting, I saw fence unwrapping and context number checking and thought
> it was maybe the same problem. I do not fully understand what xe is doing to
> comment strongly but it does raise a question on whether there could be a
> more elegant solution (ie not a hack).
> 
> Could the two entities be shared and would that solve the problem? I mean
> the TLB invalidation and the bind queue entities, do they need to be
> separate if the assumption and guarantee is to execute in order?
> 

Sharing dma-fence context would be great, but we have three scheduler
instances here — one for the bind queue and two for TLB invalidations,
one per GuC instance. The bind job feeds into the two TLB invalidations
as dependencies. The two TLB invalidations themselves are not ordered
with respect to each other, and the overall operation signals only when
both TLB invalidations have signaled.

This gets more complicated when a subsequent bind is issued without an
invalidation — it needs to wait on the prior invalidations to ensure
that fences sent to user space from the queue don’t signal out of order.

If the subsequent bind does issue an invalidation, then we don’t need to
wait — and that’s what this patch is (partially) fixing (e.g., a burst
of unbinds, which is the issue you previously raised with Chrome
switching tabs).

I’d love to find an elegant solution, but I’m just not seeing one right
now. I also wouldn’t call this a hack — getting dependency tracking
right in a complex driver is, frankly, just really hard. We’re still
working on getting everything correct.

Matt

> > > I am asking because amdgpu recently posted a patch to unwrap in their code
> > > for potentially similar performance reasons, and if now xe wants something
> > > similar, or even the same, it is an interesting question where to do it.
> > > 
> > > Also, I have a patch (not sure if I posted it so far) which unwraps in
> > > drm_sched_job_add_dependency() and converst the dependency xarray to
> > > unwrapped dma-fence-array. Initial idea there was to allow scheduler worker
> > > to only be woken up once, once all deps are signaled, but now if two drivers
> > > seems to be unwrapping fences maybe there is a case to be made for doing it
> > > in the core.
> > > 
> > 
> > I don't think this is the same problem as the one above, but it's an
> > interesting idea in general. CC me if you post this one.
> 
> Okay, but since it sounds it would not be helping here it will not be
> priority to clean it up and send so might be a while.
> 
> Regards,
> 
> Tvrtko
> 
> > 
> > Matt
> > 
> > > Regards,
> > > 
> > > Tvrtko
> > > 
> > > >    	kref_init(&job->refcount);
> > > >    	xe_exec_queue_get(q);	/* Pairs with put in xe_tlb_inval_job_destroy */
> > > > @@ -266,3 +269,14 @@ void xe_tlb_inval_job_put(struct xe_tlb_inval_job *job)
> > > >    	if (!IS_ERR_OR_NULL(job))
> > > >    		kref_put(&job->refcount, xe_tlb_inval_job_destroy);
> > > >    }
> > > > +
> > > > +/**
> > > > + * xe_tlb_inval_job_fence_context() - TLB invalidation job fence context
> > > > + * @job: TLB invalidation job object
> > > > + *
> > > > + * Return: TLB invalidation job fence context
> > > > + */
> > > > +u64 xe_tlb_inval_job_fence_context(struct xe_tlb_inval_job *job)
> > > > +{
> > > > +	return job->fence_context;
> > > > +}
> > > > diff --git a/drivers/gpu/drm/xe/xe_tlb_inval_job.h b/drivers/gpu/drm/xe/xe_tlb_inval_job.h
> > > > index e63edcb26b50..2576165c2228 100644
> > > > --- a/drivers/gpu/drm/xe/xe_tlb_inval_job.h
> > > > +++ b/drivers/gpu/drm/xe/xe_tlb_inval_job.h
> > > > @@ -30,4 +30,6 @@ void xe_tlb_inval_job_get(struct xe_tlb_inval_job *job);
> > > >    void xe_tlb_inval_job_put(struct xe_tlb_inval_job *job);
> > > > +u64 xe_tlb_inval_job_fence_context(struct xe_tlb_inval_job *job);
> > > > +
> > > >    #endif
> > > 
> 
> 
> 
> 
> 

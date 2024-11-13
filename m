Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0491FD637A2
	for <intel-xe@archiver.kernel.org>; Wed, 13 Nov 2024 17:24:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA28F10E111;
	Wed, 13 Nov 2024 17:24:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TeKUUBYT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CEC910E111
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Nov 2024 17:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731518673; x=1763054673;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=GpL6ItBkcol8Oa5cqzbSDc0eDOb/pu8F3+RaaYpvqjU=;
 b=TeKUUBYTBlme8wxNZc+02zhU5YduzYA/fEVvhGiGM+FlCZtSYnJK65lr
 kDk+wajGhVS/PPnBcrCXK3rRGSnih7M2lMGJeCGbkZbGuBhZy2yje7BC9
 ki37wdXVlVIOzty0lzNxDI+YtgGxOYCGIO3GFjX7pTF6bBe+FL/W4FMks
 V/qDI4MphErHwxWmTEnDEGz5RhYskWhyZp9vErlVywHqthe+kjHA5Rn3O
 /aFPGhrLZ2YqdKS0/WxOr1hfOFLt7Q7KqHev3d6V3MOtDYohqhvY5Q4YG
 ABHLy9BQ5r7d/ptZw9PTB1veuusBXz2Hf58PG2EQY1KqpPEs0hes2RcVq w==;
X-CSE-ConnectionGUID: 3fjxvfOSQlS4pySroXMPtw==
X-CSE-MsgGUID: j72C3mT9SXaJhVxl8ZfTZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="31306709"
X-IronPort-AV: E=Sophos;i="6.12,151,1728975600"; d="scan'208";a="31306709"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 09:24:32 -0800
X-CSE-ConnectionGUID: QXaQJ10DTIm/QVa4AajeIw==
X-CSE-MsgGUID: YoVfIj/4SUqe4ZhaeUsOrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,151,1728975600"; d="scan'208";a="88740059"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Nov 2024 09:24:32 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 13 Nov 2024 09:24:31 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 13 Nov 2024 09:24:31 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.174)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 13 Nov 2024 09:24:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kKyDm1uPn/Y2OfXNo8d7zPWzP26ev8gN04UpihbhvBuyvVgHfTJTtNolBPQVUov/mCVQ4mj/Pt43s5XtMBzSWQvUGWtfAoVuolufLBlz4BzKXpRHxnCmCP3HP9oeM6bb/IH0EbzAU4Mp5byELtdi+254tX7nUzM329t658auWi1FWs4LRqB1Vq4XaBaFLS68DxZF9iLpSu1Cfr18aAxEr/mgzf6XV9xh+qIrWx3YgUL42cLQJy0MCaoqixGYFZDsHKMsIkCjlO4rXdxCsI/ufLv+Jonu0QaAKdQvH4a+94xxdXi8VehluQzp0amY8nzfiC9BFVCYSO4JcyQS3VTVLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q1Oc8abMIcdJdq4v27yc0jgC4QCq0bxJofGDhx7JkR8=;
 b=mbWllRpGOgVvV6Bwi33xZioKn7C/3se+NNUS0/BIRl1Ci/101RPP+pdPNNWHVGOGaDWHNgD/A6WXi8iTspJvQ0rZGBUu4HJYaygYttESs7BuCimHpV7oUWktomXsPnKxeUrLjlIHC0hmMZp4l3JxyqhgCnaGBhVIgPCTHaxAgRz2IZDqE8KhDC+8by+ZrfmmBzYO13si4IkXeHfiM9iWpMyNMis8/Yhmsp6Z8JUEvH6m3FC96CRPGTkSp5mRCIsfk1vljb2+yZXc0PWMacPvZAeQRO3iG5VU2w0UeoKDfRR+ruEGVRWgX/Fnu2eFsQ8YEnuO+hmo+u849JFJ6pJJmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by DS7PR11MB7886.namprd11.prod.outlook.com (2603:10b6:8:d8::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Wed, 13 Nov
 2024 17:24:28 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1%2]) with mapi id 15.20.8158.013; Wed, 13 Nov 2024
 17:24:27 +0000
Message-ID: <f5592dc7-9059-4543-a25d-4c64c729a982@intel.com>
Date: Wed, 13 Nov 2024 09:24:25 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/xe/pmu: Add GT C6 events
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20241112205142.4026554-1-vinay.belgaumkar@intel.com>
 <20241112205142.4026554-3-vinay.belgaumkar@intel.com>
 <ZzQnH_xiU6maevXn@black.fi.intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <ZzQnH_xiU6maevXn@black.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0089.namprd03.prod.outlook.com
 (2603:10b6:a03:331::34) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|DS7PR11MB7886:EE_
X-MS-Office365-Filtering-Correlation-Id: 40a3030b-f6ce-4737-47e1-08dd040806ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cGtZbGNRcHZ1emxPUXVwQXNJQmNwcHRZNHlXZFV1UXMwL3BNbHB3N3NBYmo1?=
 =?utf-8?B?TVdNYnRLYVJCS0RQelZxVWxUdHZWa3hPTnhiSUg1ZGswSTVaM0ZJdkcvLy9l?=
 =?utf-8?B?Q3Q2M3prVU9jUVNXYU11TEZ6UVNqK1VnL2U1d3dJRUFzRURtR1VIK2lqWFRT?=
 =?utf-8?B?VjlrcGdJc1MzL2VIL0poT053NkJvOGtoRzJraEg4L1JRelNuc3owUE5SNjAv?=
 =?utf-8?B?UlJ3TU53ckRoY3BWM1U3ZUQyZlQrSG1NYmh2dml0b013MlBsWjJoVDQ1Rm4y?=
 =?utf-8?B?aitoNU40bUx4RnptSExabDR0Q2pvNklkdFMydXRqWUlUU0ZHOEs4UkFDQU40?=
 =?utf-8?B?WklPbS9keWdnWStUYnlOSVJ3aGRJRDZUSi9JZGlROEtsN3JLU0twU3g5TGFw?=
 =?utf-8?B?b2Y4WmxNdGJPRS9tcFBzWXJ4THNodUQ1MHBwOXVFbGFhRkYrOHhVUE5vOGtX?=
 =?utf-8?B?L1dFY3JIdkROaGcyYS9vS3RLSlpLcEo3NndONndyTGRtbXlVSG9qTitFdGpB?=
 =?utf-8?B?V1FyZVNUclZsSGVGYWl2c0pFaGQreHBKWjAwSEliSVVKS1FFcDQxMzJoUXJs?=
 =?utf-8?B?ZVcvbmsvNU03R0E0UGpWVFNBeCsyUXlPUFpoMHFmVEl1ZFIxNVFITkVraFRr?=
 =?utf-8?B?YTZsZVN0YTdYeHppSGxQM2Y2WnpLeHpKaCtOQysvbGhKVTlNL1U0S2svOXJB?=
 =?utf-8?B?ZGxIVWs0OGVFMDZSWXhkOE1OUHVmcHQwY2ZSUTQ5YlVwdTJZdTVENzgrcFF2?=
 =?utf-8?B?d21VRWhmOFgzNjNTMkppd28xeVo0R1Vmc0NUM25jZXo5MDhuTDhxK1g4c3dt?=
 =?utf-8?B?aVc5eE96dkthQU1NMzdaVVpYSTdCV1JITzdZbTZReVpNcm0veVJtK0xsdDZL?=
 =?utf-8?B?L2RUclJvTGVEamxnSG9JRHVVV1IwcGhETzJBOVpEenkybnlsR3E0TVFicURF?=
 =?utf-8?B?SlNKQ21BRWkxWGZnWnlxSTQyZ0swbW5XdThSOE9Jc1pUUktiVFJDQS9ya2M2?=
 =?utf-8?B?NXJwUkRjcGc1REc2MHdIcXhlWnA4NXIzeVk0Y2sybUhzakN3dnhGVVozemhi?=
 =?utf-8?B?ZE1wVzYwYlBIREZkRURlalNxcEJKcXNhdHRiUFBwQjJ6b0haSGlTMlNDWVJh?=
 =?utf-8?B?ZjQwT2VPdjRDeVZTR3U1Rm5aUkxsTVFCa21HUmk2SWpkcERtd1NZbUVVOGUz?=
 =?utf-8?B?SlRDdElWams3cE04by9aQitoclBFZjZIajF1UElCWVlrakNPeHdWMHNhZjd5?=
 =?utf-8?B?bE0wVWFFVEhqZGR4YjZHZ0Q1K3RVdzBtODFRVHZucE9MbkRvWm5jVkpPam5R?=
 =?utf-8?B?WUY3U1E2bTJHUnQxdGl2UmxPNDFtSmRCaWZCVnhjREY1c0lSVlNrbzJMSVU3?=
 =?utf-8?B?WnNaRGJSWDdpZzR5VHhZcVBxK0NQZURYeFAvcnJvZEZGa1haR0szK0hpMUNX?=
 =?utf-8?B?QlIxaUd1aW5uWWp1RFpLQ0kyNzgzWFRRR2NZY3pHRlo3U3daTGxnb3RjbVRG?=
 =?utf-8?B?WGI5WFoyRW0yTytScnA2VldPVVlLemZzR2JZTCsyV0FaOE05K25NdlNJNHRO?=
 =?utf-8?B?VHZaUlp2cjhTalltQzY1V3pOVUxFdk5icUhzbXpBV1V5UDFKN08xWXM5UHZU?=
 =?utf-8?B?THdGRzFFKy9Rb21aUkF4ZmJZV244dzBRZnZoWWlEMWJJY3dIMTZROGFsdHZW?=
 =?utf-8?B?dSttY3B1cGJsaVpCOVdpcU5EK1N5dTIrK0NzMFdXOWMvSUZjemFjNVFsKzM5?=
 =?utf-8?Q?yPV+9e0dFJ4KmeqnU0Rzun2gicwHzZ/zOoVjjVx?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cThTTHNzUVN2bFgvT21jUmxlZ3U0NlFDWE80bVl2VnZBVXYrMm5FcnZCVGll?=
 =?utf-8?B?OUZIc3V5djhsbHZUa05lWEZHYm1kVWo1dll3dTJiVXd6Z3BSQW9sZXZFeDEz?=
 =?utf-8?B?YlEzVWw1NjNHeVBtY3JjQnU0akFMenVVQWZmeURwMVVSeHI4aHBhRDRnME54?=
 =?utf-8?B?ckZGTTRiSTBDaDhCRlVpcXgvZi9IcC93MHZGdzNLS1U3bTY5RmRrT3JuM0Jt?=
 =?utf-8?B?RnhuT3hRNFRLUldjV0RBMTBSRHgxYzB5VEcyV0laWSt5NFNLbUFkS0xES3c3?=
 =?utf-8?B?OHBMbXlra1FtUzFLYTFqdXRkaytKSTVMdXdFaVdjZVl4c3JodXl1NzdVdnRX?=
 =?utf-8?B?ZlVCSUlVeGUxVTJBNWVrSm8rRkp2dEc5OXRYV2tWZUZ0N3VCTGsrVUNSUUNx?=
 =?utf-8?B?N3ZSVGtjT1hvMjFFa3lzQUV2MVBLVUphODJRZ1Y5R1ZUUVQ4N3h5RVlZcGo3?=
 =?utf-8?B?Vi9tdWdJUTM1SkZFNHNXOEcza1kxdmptb0NSTTIzREZEcTVCMDRNUnNZTXJL?=
 =?utf-8?B?WGlMQkdPN0dSeWlNMnBZWWdNQ1RqOEc5cVZKT1NEVTRubHVHNy9LQldoTE0z?=
 =?utf-8?B?Q1ZaaVZ5YWZrWnNrTzQ0SXcydERhdGFNZlNSK0o0cERtU2oxb3p6c1ZkVmMy?=
 =?utf-8?B?bGFLbTNmYlNRMTBzWWdYUW1CUUlxazdZbmlHQVNKbldwZ0ZEM1lsOFVBa1VY?=
 =?utf-8?B?T2pKUG80N2pvckhwWGxkVHVTdTNITjhINDVhdnhGbFVGa3AxNTBLN3l1ZTU1?=
 =?utf-8?B?VjhCSFFoblpTU05mN2lVQ3YxVk9WT1NlQXFERHoxdjBuMVpFV2NQMjM3SmR6?=
 =?utf-8?B?Qk83cUIrTnhyM1k2VGpuUklkaVVYNVhRQXZpVERpYnVYQ2hZdmtCNGk4MzJ4?=
 =?utf-8?B?RTFUUmVhUXQ4WTFJdmc4cmVtYXlMeGRHQnhrSUZndE5PRFJUbytIcG0wZHFQ?=
 =?utf-8?B?c01haWJ6YWYzWXNWc2hBK2paZk1MM2pPTDJSbTV2Q1NqdmplR2lDYXBBWjZs?=
 =?utf-8?B?b25EVXd6STU1MnBEYW8ydEZGdlJmRENuZTVPVllObjlKTjlEV1JXeG1xNk5U?=
 =?utf-8?B?VTZqVGNwZHgzL0VZbFo2bkxQZGdaUGpaakRlQ01lUHg5NmZLSURrcFR4NWd5?=
 =?utf-8?B?eVg0WjRkS2dyZmJOa1ZTOHczekRkeG9UdGFYaUl2SUU3M1VnejhIT1JOSWlU?=
 =?utf-8?B?U2o5LzA2U1V5dWt0cm5iakc3ZjMzcFN0R0NEeC9hSXJxdzRXclF1emhOcDZP?=
 =?utf-8?B?MDR1RXpnMThaSzBJcGVQV2ZkYUttQzlvYnh0YmJSNjRpTXFxZDMzOHVuUjB1?=
 =?utf-8?B?TFRKelhHYVVBd0xaaGZTbzF0RW1yMlgwbm1VU3FxcU0yTTBsdEI5SnE0bXRI?=
 =?utf-8?B?OTBCa3VlYU1Oa0VBWGxleEV2Y1AzQUtYUGdiT1lsTTVrT2YvTzN4ZjBlemtm?=
 =?utf-8?B?UFVmR0FyK0Q4ZXFzWjY3Q2dqV1pWd050NWsvWkVudkUvWEFkUWRxdUdGczdW?=
 =?utf-8?B?b1owdTc0aHprNU9XQm1SY2N3VVpiVHJpdXdZaTZsU09hbHMrdkJydmdjbldy?=
 =?utf-8?B?V2huQTFlbStQUG5PcWtsWGZRMzFuSFRwZWRwNE9FUkJMZWh2UzZqazdCeDBP?=
 =?utf-8?B?SVFaMFdBbTJJN2FrbDdtV21SV0NXclg2bFFQZ0p4VUxhQVhaSUZncXBqUUpa?=
 =?utf-8?B?VElyZFdHaWNuNmoyYk1aZWlGTVd6VWNzSkFJSlpoYjA3ME90OFQ2VXAzT3Fq?=
 =?utf-8?B?YU5OWmd2U1orREVFZVIrQWZOeWowclNQMENjUm1Jd20wbVc4emI3UjczNlVm?=
 =?utf-8?B?R2ZJZUwvKzVNaEZTNEVkN3MvY1FNbFA2UG1qN3UxUjNEWjB6Z1hvOHZwc1lo?=
 =?utf-8?B?eG9YelAxTHd0QkIzSlZDeXJhYXNVL0hxb0xBN0hISEJHM0trZjlRbjJFS3Ra?=
 =?utf-8?B?VXdKOTFmS2ZKTjF3TE1MOWEvU04ra0dhNWtQZUsvUXBscVRPTDRsdWhMcWhM?=
 =?utf-8?B?RnlLUWRvRGhmZmkvYjJWL2xVT2dqT3d0dGpSelJpQlNyaXZRUDFpSTVvM0V3?=
 =?utf-8?B?cG0yVndPUXZmNC9nSEtFMW1QS3hKUkhLemU3eGgwaWdETWpGZ0lidG5Nc1NO?=
 =?utf-8?B?R2pXT1JjV2FtT2JFUytjcFJROGJaYzdpWkl2UUlGdEI3eW5pdXFxRWZlZUZq?=
 =?utf-8?B?UVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 40a3030b-f6ce-4737-47e1-08dd040806ae
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2024 17:24:27.7364 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s67ioIVNyuBL9nAwjrSWXuWdE6fea0NVf3hIzlgyH/SbgnnJK7O4u1EkvhvLs5meKZ6ue7Eq+6DmEPaazWrtdRg9++fGKqhnxRZeAFZg4uQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7886
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


On 11/12/2024 8:12 PM, Raag Jadav wrote:
> On Tue, Nov 12, 2024 at 12:51:41PM -0800, Vinay Belgaumkar wrote:
>> Provide a PMU interface for GT C6 residency counters. The implementation
>> is ported over from the i915 PMU code. Residency is provided in units of
>> ms(like sysfs entry in - /sys/class/drm/card0/device/tile0/gt0/gtidle).
>>
>> Sample usage and output-
>>
>> $ perf list | grep c6
>>
>>    xe_0000_00_02.0/c6-residency-gt0/                 [Kernel PMU event]
>>    xe_0000_00_02.0/c6-residency-gt1/                 [Kernel PMU event]
> Is it possible to do per gt?
>
> <bdf>/gt<n>/c6-residency

We want `perf list' command to find the events, I think that can only 
list the ones directly inside the events directory for a device, it 
cannot recurse inside that dir looking for gt specific events afaik.

Thanks,

Vinay.

>
> Raag

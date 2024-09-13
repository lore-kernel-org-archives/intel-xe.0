Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07355FA3753
	for <intel-xe@archiver.kernel.org>; Fri, 13 Sep 2024 13:26:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD73A10E266;
	Fri, 13 Sep 2024 13:26:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Lk1HjDJu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85DEC10E266
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Sep 2024 13:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726234000; x=1757770000;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ATtF7g1hO3nvZZucuuwlMBxcQCGScua6Ikf9IbruHWQ=;
 b=Lk1HjDJucjZ3WXNrS3gftWR/+S4BoDRvcTtxP7Dl2PpLNOT9UQD01vYH
 0CTUGqsLyw3LGHIraVTSua7tRdx9ac6+KLQ9dwbI6OAmnGATZFrdbpe+K
 Zqj6kr+uvcEM8RG9XBViDlHfHdM6OPC32qnjfhzNBLsCDE1E7TiIFmLnX
 DgaU8xFIjQQSV2vy99OMWeP0I9lrJIHArCkQtzgG+wbfBPq+mQVVI6DIg
 ApTzG+/DmYmJWyUlHjFFhO8KiUZtUm8VHIXEVm6RQe7NofnFeA62qAUDy
 R5zrV5j2jIHQLVM29hlEgnp3zpeFxGqiFMbNezgJcE83G7nbcjPJLPNhV Q==;
X-CSE-ConnectionGUID: lYheIbOuSRO6H7k48W1hTA==
X-CSE-MsgGUID: cUCu06/TQsmguqJvzp6Wgg==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="24621818"
X-IronPort-AV: E=Sophos;i="6.10,226,1719903600"; d="scan'208";a="24621818"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2024 06:26:40 -0700
X-CSE-ConnectionGUID: CLBAhYzuRXGQXFTzNvhrkw==
X-CSE-MsgGUID: PgTxokxtT+CRs9dGn1rJMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,226,1719903600"; d="scan'208";a="72426272"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Sep 2024 06:26:40 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 13 Sep 2024 06:26:39 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 13 Sep 2024 06:26:39 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 13 Sep 2024 06:26:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ijFS4XWZQfFaz4XdzxSOeGR03rPheQruOCyWaRTClxWSfsxm2X36dQnjypJp1w1xtRX2ZKJagkme5a+hyAj8VgnGYAzcO0JLlck17hyj82FMDWMyAQHNu9m5C9bUMfJ9cEg1idUd4jX4JTv4vAeaFRDyKCs4Kdq7igNfYEaOFPdMzQqqc6Dc6ootPvJciMm0KNKn3yd8NlcYls+ZbwJ7yn6t7Hc3GODkVL+sRhsrSC2RlDAYqD2E7eHBz+sIjy851X1RiwRtXiqGkw7LZYoP7cr3kRO3pyPagANQ8PJy0jecaNWEphtYBeLVJ20wT3QFBuqtXAN8RH2QejSvlImbSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3M7sTs0psqslL9/rmMxA6uzszfuw5dW+1qDktNgh+og=;
 b=YGK1EyZ5bpiW5xh7t3H3cQdBtMJSdYwQCr0heImQdcpjVo464FMSUbSXX9QkmlfGkzQZZQz0hWlMW+hQ9ZKOXcQIvLj0BOt4q+VSpZl5dl85G+E3faEZLySOevs/x1sLBPCzWIIYLw6kZIGHSTPvjZgtEpVe8di3Yaf9Z3RMQZZ+jpzO/l8Drm1GqwrNItYaOlMgn/eAWa1aGrM9onEgHadMseWX77QZp8CKpNKZvEUrnQzH8N5CPwc2JCx/RsdLd/mx8kPM6GISKFX4BM8k+zIfGSQ14rFvOZefuQSY8jtkPMQv3eFzBdBLaLkErgIY70ZxS8LwUkCwJV+RWZvMfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by SA0PR11MB4750.namprd11.prod.outlook.com (2603:10b6:806:9d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.20; Fri, 13 Sep
 2024 13:26:32 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%4]) with mapi id 15.20.7962.016; Fri, 13 Sep 2024
 13:26:32 +0000
Message-ID: <95568c8d-9413-48c1-8b1b-6fec70785157@intel.com>
Date: Fri, 13 Sep 2024 18:56:25 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 23/23] drm/xe: Change return type to void for
 xe_force_wake_put
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Badal Nilawar <badal.nilawar@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>, "Nirmoy
 Das" <nirmoy.das@intel.com>
References: <20240912191603.194964-1-himal.prasad.ghimiray@intel.com>
 <20240912191603.194964-24-himal.prasad.ghimiray@intel.com>
 <126fdf77-e1b5-4db6-94fd-cb467971bd74@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <126fdf77-e1b5-4db6-94fd-cb467971bd74@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0050.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::7) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|SA0PR11MB4750:EE_
X-MS-Office365-Filtering-Correlation-Id: 7191ecfe-12c2-479e-f8bd-08dcd3f7ae91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MXV3QWMxTVdKaXhyNEY4VDZwTkxhUUwyeVNaMkN6REltZjh0d1k4K2NBcFlv?=
 =?utf-8?B?V2Q1ZDVmakUzaWVRM3lJNjY2eFFJM2hiTG1Ea3lwQk1KdkU4T1FCTXhiNE1r?=
 =?utf-8?B?VlNmR2ZVMEI3NG9TZDNPdEI2dzNDRkRSRk0vam9XYjRDYTczTmlGQ3R3WUcx?=
 =?utf-8?B?RjRzdkFqbHZ1TnVrQURId04zdEJ1bVlJK1FCeFBjWUhKWGlWaVJSMTJnRzdH?=
 =?utf-8?B?ZGxNanJ3SDJIbXh5d0lydEF1RTh2Zm4yMW5TRHpwMmF1ZWpQK2UzOHR0UGtj?=
 =?utf-8?B?SjdPOGk5L090Ti9icU1NNVlyaHM3bEpDRlFKZzRvUk9VaXBBYkMyWmdHa2lJ?=
 =?utf-8?B?bTNMcXZDVWsvVFlrbmFjODE0LzhZRWlVek9Bc1V5UHBvZURVK1E3WnRWa2pQ?=
 =?utf-8?B?MktsQUE5RTVyY213TTBGUGd2YVhRQk1YbWZ6R0RUZ0xlNHVLNCsrNXJoUlNI?=
 =?utf-8?B?M0VNeTQrdTJkamdQaXBoWGVpY0JDZFcrVVYxc2g2N2lvei9RL3EvbDVHbXBG?=
 =?utf-8?B?YzJiSHl2UGlVZEVFV3AybVVsLzhrZ1VPWTU0eGIxU2VTSjVOdnZVbW5OZnY4?=
 =?utf-8?B?UmxlVFdDRkUrcWxFSjEvbWtIbkJkdUIzeGhQeWFibjFYa2RDNVR5TVpranFT?=
 =?utf-8?B?N2hPQWs3NTZzZ1A4aDE3SFlQV2pzMkZ6eEpzNzl5Wlc0ckF2TERBTmduY0lw?=
 =?utf-8?B?QXM2OWVZSEZCbGsyUHJpdjRaczE4UG5ITXo3M1NJQ05PcEFwYm1TY2lBSkhM?=
 =?utf-8?B?YW9uRUF4QnQ4TDN2WWUxRzZKeVIzYkdHUFZGNW1PNUtUdFlHMERRMUFnQ0xv?=
 =?utf-8?B?WHNleCtrOWNiOGIzVnQrc2k1cHh6UFVra3N4QU81cGl5VTRUaDJjMDJEWnRU?=
 =?utf-8?B?azhSK2p3VDlmZkRSdFRZcktLNkFHS2pIUk1hM0ZaU3U3R3kzOGxnWUpMOFg0?=
 =?utf-8?B?SFlhZGFLdm9vVVdwQldTOS9mbDUwcG5CbTR5ZktBcHlvekl0Rzc3L2M0L1lV?=
 =?utf-8?B?bDRzMmZ6aWJRVnAzWk5KK3A5dStHMG5VMEhicTRIYVlzSUkvYjJTMS9oRmNo?=
 =?utf-8?B?UjQ1R3VhdkF3cFI3RFdxc25RaGZpdUo3ZGxick00WkZmcyt3V3EyazZ0VzlC?=
 =?utf-8?B?MGZMVGt5WUxuWU5yK0lIdURYbkZxT0tjZ2hwc0g2dUx3ZlpZQk1TV0NZbXg2?=
 =?utf-8?B?VDhWK2Nxd2tSL2R1QUszTXIvN2lMOUhWbTltZW8yNGtxdlUzQm5za2NFU0RE?=
 =?utf-8?B?dmhmZGphY3lneHdLdElTWU9wVUhWM1BnTkNSWFJIWWo2TDNXNXExTFdRQ0lP?=
 =?utf-8?B?WUcyMVBobXNFaTRoN3QyRE15YXB3aDBtZXZWSFYzSTY1cEhOMUN4M0ZsU1Ux?=
 =?utf-8?B?ekptdTVKbThuT2RXQ2w1dzcwZk5RSmJXa1hkdVBMdm5oVW9TWVpvWVhnZ1Rk?=
 =?utf-8?B?akVqd01NQjdTS05TQ2tndlE0Z3F6RFB4bXlRYTRPMFNHTk1CZ0hxbFhxQzFZ?=
 =?utf-8?B?aFBacklod2JuT1NTMThPSFJ5S0p5aDBIWTBhY2dyM3AwOU5sT2RwYVlNeUJU?=
 =?utf-8?B?dno3VFBaVlZoVTY2UXQ2N1hlZnVSSTN4VFZiYk45RVpuUWlYSkZwT2lscWRI?=
 =?utf-8?B?TzFYUVpwN1hxZ0EyYVp0a0gwMUZxejdaWk1HOGEwaHRKTTkzbFl4eWJrVWV6?=
 =?utf-8?B?Y2JUYlRteXMzRmRBSXo2YlY1dGlCUkR4VzU3YTZqZlp1NDJwV2R5SUEyQVg5?=
 =?utf-8?B?Rm8xU3JYMDJDbTFlVTBKcGZYMFBNcFppUC8rRlRsQXQyWmVKZmRyU0NVbmVC?=
 =?utf-8?B?MmhBbXQwRjNaZE5pYkFjUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MkN2cGJYK1R5SkV5WnYxem9Za3phcVFlTDFic3JkQmtjVldqMlJMcGlOZm14?=
 =?utf-8?B?eExUUkhRM1ZVMlpsd0o1Q09yYUpLbXlPT1Rzc3RmbmpWTmFrQUJLdkdXSzFJ?=
 =?utf-8?B?UUpxeXNOcE4yakxvNDBnSHlwaWtzeXBRN3hYdTllOHE5UlhWZVNYSHA4ZHVu?=
 =?utf-8?B?bWxaMVFkVU9CQTVPbHpsOUJQZWFVa0RxT1ZObGtjd2o1UXVVR01LNFlWSDZL?=
 =?utf-8?B?RUwzaktKSzNEZWM2MU1TL29FNWYrdXE5TkNyekZpZm5yVklkU3dmZGR1K2l4?=
 =?utf-8?B?TEh5SDU4dllmTUhqMStVT014bHBjRkFPdWRlNy85aE9KWmNFWHBtTmFxY1kr?=
 =?utf-8?B?VXF2UE5GVnQ3SVgwYVR3K3FiamwxdzB0bGJGQlEzM29OcjFzM3M4WmFzUmcx?=
 =?utf-8?B?eHNDSzlGci82L242Wk9pS200end3elpQOVoydXVZeGJzcTIyS2Vvak52YTNZ?=
 =?utf-8?B?QTZmOHBlOUdTbnNvY0RlWXc2ci9CenNYZE1oVHNNclRkK3lFY2xrZVBabzFZ?=
 =?utf-8?B?TjR3OUkxY3NaVXZrYzNLb3lZRzNyWFhHTXFxaHoyWVFyUUNpY3YyeTRvNFVI?=
 =?utf-8?B?alpWU0R1dlR4NlVpWCsrb1JQc0xEdmg1cm5LbCtkSm5ZN2pMaDZDdVFSTTNp?=
 =?utf-8?B?MEU1UkZOM21leUN2bUNVUXJ6VzU4dVk4RS95VDlwcFA1ZTVRZ3cvN0FRazYz?=
 =?utf-8?B?TFlqd2pldVkzTE5BbWVtOC82TDcyVVdXVnE2VlNRRjNhTVpWSmdXMkJrd2Y0?=
 =?utf-8?B?T3JvVjlSazZUZGI5b3dzZm9UbXlWMUg2cXVRMDNYV1dDZVl4Uk1Eb1lacjdU?=
 =?utf-8?B?SGRqUkNqVklIbHdOTExzVlNLMXZEdVBoRXdRWm9SaE9vU1VlRXp5YTFmaVIv?=
 =?utf-8?B?UUZ1enBtcFlIMHV3T2pteVV2UE04dkt0eFBMU0E1T2pqZHMyc0lhSTNKMkIz?=
 =?utf-8?B?V1p3aE1WN1RmeXAzUktDZWM4bWV2azJXSXRVNmJDd3FxR2g4eHVxdVhWUFEy?=
 =?utf-8?B?azVmRm9yTWU0bzZTWUEzNGtiUEhtUWs1eWJUT0g2YTcydnR4T3AwTitNSmZS?=
 =?utf-8?B?U0pqZEQ1K0NkT04xSmo0SDdpWTN5Tjk2blJhNkdzeDN3QWc0b1MrWWkwVjQx?=
 =?utf-8?B?K2pjRGRxU2ZNSk91RUVKVUFQRmwvTE03N0l1ODkxTjY3alVBWkRHWHNsak5I?=
 =?utf-8?B?L2lNMEJXRU95ZStJVGs0M0dRMHdOVHR0dCs3L1JFNG1zMWtSRkRlY1pHUmEv?=
 =?utf-8?B?Qzd2ckpPUlc4ZWEzekR6S09wTlVhenJXRjdsbHNnbTVPdVdCajJ2NDhtSDJx?=
 =?utf-8?B?NUEza0JBZTUrTTQrcjF4dUphVmJnZWd0WitWNmdaRWNQZWxpWVRhNWNwcld1?=
 =?utf-8?B?cHJSUUp0MXZmbzM0bHRFZ09OSkFac2VURTI5M09BNlZjNE5pUk5LZXV2MFlI?=
 =?utf-8?B?VitTdHZ0U3ZiRHNhbkg2cU5SL3hsRGptWTdMak1Pa1dQK09HeGhsY3o1T2Er?=
 =?utf-8?B?UnV6aGs0UGFBZnp2eTF1dCtNVHhMaUMvNTVLaklndStwbFhGcllRUFB1NjRu?=
 =?utf-8?B?MHV1YjkxZXhVdldsNWZRYlZWRmFWSVI3bUQxQ2NhYmk0V245dE9zZE96S3du?=
 =?utf-8?B?VGNpNzZ0bFVFUkFtNDQvd3BpeFYrVTJYL2tBS2FUcXQxYkRCWUR6clpzNlZq?=
 =?utf-8?B?akt5emNFSDBQaWtXeXVNZHoySzB1OXM2dWdpYzVuM2IydnpmTno1RWcyNkdH?=
 =?utf-8?B?b2FtY2xNSThuNHdRalozOVFhRlRJSFhBeGhFRk5SdWFwZXZWTFd0RjJqMm5X?=
 =?utf-8?B?N1ZBSEVQZWtxZGJhdUpJRE93NndndFF5T2dCMXorNFhYTUl0cHN5RDloK2xr?=
 =?utf-8?B?MWFvQk1lV2NuU0psc3J5bzJ0L0lEc0lZR1o4MjhqUEliQWREelE3bUN6ZWl3?=
 =?utf-8?B?cTRWVGNZbEFmVktkWkN3TVBBVTBHMmJsZmh2Y1A0NGFWc0YxSGpsL3VpVkRH?=
 =?utf-8?B?NXZTLzhJdTRqMjRsbXc2K1cvdzF1RmsyNEdnQk81ZVNVUkFQMnA0UjJzR2Jl?=
 =?utf-8?B?Mlp4Y1hGS09oNUdldmk4S0ZzRHltaTdwMkxWaVJqeDZ3MGtoc1JLelBXaWdR?=
 =?utf-8?B?MnROOXc5TlByTTFWNG9oSlJ3U2V2dEkvS1lDSElVZmJLcnhzNDkvSDFaMndl?=
 =?utf-8?Q?s+nO9P/qLZUjRZp5qdd20h0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7191ecfe-12c2-479e-f8bd-08dcd3f7ae91
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2024 13:26:32.0763 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0MTxRKFN0QTBpFkGrdA1lG6Cq2Ixt1zhcxL7i2KM/m3yqqe1G0PqU3nH76Ob6gqTrReKWCyOiJUORhcTfLnAuN2doQrpqkYiu9doqLUHZgw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4750
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



On 13-09-2024 15:54, Michal Wajdeczko wrote:
> 
> 
> On 12.09.2024 21:16, Himal Prasad Ghimiray wrote:
>> In case of xe_force_wake_put failure caller just calls XE_WARN_ON
>> and continues. Move XE_WARN_ON inside the xe_force_wake_put() and return
>> void.
>>
>> Cc: Badal Nilawar <badal.nilawar@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Cc: Nirmoy Das <nirmoy.das@intel.com>
>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_device.c     |  3 ++-
>>   drivers/gpu/drm/xe/xe_drm_client.c |  4 ++--
>>   drivers/gpu/drm/xe/xe_force_wake.c | 14 ++++++++------
>>   drivers/gpu/drm/xe/xe_force_wake.h |  4 ++--
>>   drivers/gpu/drm/xe/xe_gt.c         | 22 +++++++++-------------
>>   drivers/gpu/drm/xe/xe_gt_debugfs.c |  6 ++----
>>   drivers/gpu/drm/xe/xe_gt_idle.c    |  6 +++---
>>   drivers/gpu/drm/xe/xe_guc_pc.c     | 14 +++++++-------
>>   drivers/gpu/drm/xe/xe_oa.c         |  4 ++--
>>   drivers/gpu/drm/xe/xe_pat.c        | 30 +++++++++++++++---------------
>>   drivers/gpu/drm/xe/xe_query.c      |  2 +-
>>   drivers/gpu/drm/xe/xe_reg_sr.c     | 12 ++++--------
>>   drivers/gpu/drm/xe/xe_vram.c       |  3 ++-
>>   13 files changed, 59 insertions(+), 65 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>> index 5edb1cf51ea5..cce754801e8d 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -620,7 +620,8 @@ static int probe_has_flat_ccs(struct xe_device *xe)
>>   		drm_dbg(&xe->drm,
>>   			"Flat CCS has been disabled in bios, May lead to performance impact");
>>   
>> -	return xe_force_wake_put(gt_to_fw(gt), fw_ref);
>> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>> +	return 0;
>>   }
>>   
>>   int xe_device_probe(struct xe_device *xe)
>> diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
>> index 01f643f6aaba..e5defce08281 100644
>> --- a/drivers/gpu/drm/xe/xe_drm_client.c
>> +++ b/drivers/gpu/drm/xe/xe_drm_client.c
>> @@ -301,12 +301,12 @@ static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
>>   		fw_ref = xe_force_wake_get(gt_to_fw(gt), fw);
>>   		if (fw_ref != fw) {
>>   			hwe = NULL;
>> -			XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
>> +			xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>   			break;
>>   		}
>>   
>>   		gpu_timestamp = xe_hw_engine_read_timestamp(hwe);
>> -		XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
>> +		xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>   		break;
>>   	}
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
>> index 73d37e79da9c..01b8bfdd748f 100644
>> --- a/drivers/gpu/drm/xe/xe_force_wake.c
>> +++ b/drivers/gpu/drm/xe/xe_force_wake.c
>> @@ -11,6 +11,7 @@
>>   #include "regs/xe_reg_defs.h"
>>   #include "xe_gt.h"
>>   #include "xe_gt_printk.h"
>> +#include "xe_macros.h"
>>   #include "xe_mmio.h"
>>   #include "xe_sriov.h"
>>   
>> @@ -208,11 +209,10 @@ int __must_check xe_force_wake_get(struct xe_force_wake *fw,
>>    * and waits for acknowledgment for domain to sleep within specified timeout.
>>    * Ensure this function is always called with return of xe_force_wake_get() as
>>    * @domains_mask.
>> - *
>> - * Returns 0 in case of success or non-zero in case of timeout of ack
>> + * Warns in case of timeout of ack from domain.
> 
> maybe this cleanup should be done earlier in the series to avoid
> changing code and kernel-doc once again at the end?


Wanted to avoid, resolving conflicts on series patches again in case the 
patch is not accepted.

If the patch is agreed upon, will change code in previous patches and 
will use this patch just to change return type and add final kernel-doc.


> 
>>    */
>> -int xe_force_wake_put(struct xe_force_wake *fw,
>> -		      int domains_mask)
>> +void xe_force_wake_put(struct xe_force_wake *fw,
>> +		       int domains_mask)
>>   {
>>   	struct xe_gt *gt = fw->gt;
>>   	struct xe_force_wake_domain *domain;
>> @@ -225,7 +225,7 @@ int xe_force_wake_put(struct xe_force_wake *fw,
>>   	 * in error path of individual domains.
>>   	 */
>>   	if (!domains_mask)
>> -		return 0;
>> +		return;
>>   
>>   	spin_lock_irqsave(&fw->lock, flags);
>>   	for_each_fw_domain_masked(domain, domains_mask, fw, tmp) {
>> @@ -240,5 +240,7 @@ int xe_force_wake_put(struct xe_force_wake *fw,
>>   	fw->awake_domains &= ~sleep;
>>   	spin_unlock_irqrestore(&fw->lock, flags);
>>   
>> -	return ret;
>> +	if (ret)
>> +		XE_WARN_ON("Timedout for domain sleep acknowledgment");
> 
> I guess this should be xe_gt_WARN() instead, maybe like this:
> 
> xe_gt_WARN(gt, ret, "domain%s %#x failed to acknowledgment sleep\n",
> 	str_plural(hweight_long(ret)), ret);
> 
>> +
>>   }
>> diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/xe/xe_force_wake.h
>> index e17fe316dc3c..c2c729371b2a 100644
>> --- a/drivers/gpu/drm/xe/xe_force_wake.h
>> +++ b/drivers/gpu/drm/xe/xe_force_wake.h
>> @@ -17,8 +17,8 @@ void xe_force_wake_init_engines(struct xe_gt *gt,
>>   				struct xe_force_wake *fw);
>>   int __must_check xe_force_wake_get(struct xe_force_wake *fw,
>>   				   enum xe_force_wake_domains domains);
>> -int xe_force_wake_put(struct xe_force_wake *fw,
>> -		      int domains_mask);
>> +void xe_force_wake_put(struct xe_force_wake *fw,
>> +		       int domains_mask);
>>   
>>   static inline int
>>   xe_force_wake_ref(struct xe_force_wake *fw,
>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>> index b0126daee359..5f5760b60eac 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.c
>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>> @@ -446,8 +446,7 @@ static int gt_fw_domain_init(struct xe_gt *gt)
>>   	 */
>>   	gt->info.gmdid = xe_mmio_read32(&gt->mmio, GMD_ID);
>>   
>> -	err = xe_force_wake_put(gt_to_fw(gt), fw_ref);
>> -	XE_WARN_ON(err);
>> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>   
>>   	return 0;
>>   
>> @@ -533,9 +532,7 @@ static int all_fw_domain_init(struct xe_gt *gt)
>>   	if (IS_SRIOV_PF(gt_to_xe(gt)))
>>   		xe_gt_sriov_pf_init_hw(gt);
>>   
>> -	err = xe_force_wake_put(gt_to_fw(gt), fw_ref);
>> -	XE_WARN_ON(err);
>> -
>> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>   	return 0;
>>   
>>   err_force_wake:
>> @@ -787,8 +784,7 @@ static int gt_reset(struct xe_gt *gt)
>>   	if (err)
>>   		goto err_out;
>>   
>> -	err = xe_force_wake_put(gt_to_fw(gt), fw_ref);
>> -	XE_WARN_ON(err);
>> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>   	xe_pm_runtime_put(gt_to_xe(gt));
>>   
>>   	xe_gt_info(gt, "reset done\n");
>> @@ -796,7 +792,7 @@ static int gt_reset(struct xe_gt *gt)
>>   	return 0;
>>   
>>   err_out:
>> -	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
>> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>   	XE_WARN_ON(xe_uc_start(&gt->uc));
>>   err_fail:
>>   	xe_gt_err(gt, "reset failed (%pe)\n", ERR_PTR(err));
>> @@ -835,7 +831,7 @@ void xe_gt_suspend_prepare(struct xe_gt *gt)
>>   
>>   	xe_uc_stop_prepare(&gt->uc);
>>   
>> -	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
>> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>   }
>>   
>>   int xe_gt_suspend(struct xe_gt *gt)
>> @@ -857,7 +853,7 @@ int xe_gt_suspend(struct xe_gt *gt)
>>   
>>   	xe_gt_disable_host_l2_vram(gt);
>>   
>> -	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
>> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>   	xe_gt_dbg(gt, "suspended\n");
>>   
>>   	return 0;
>> @@ -865,7 +861,7 @@ int xe_gt_suspend(struct xe_gt *gt)
>>   err_msg:
>>   	err = -ETIMEDOUT;
>>   err_force_wake:
>> -	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
>> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>   	xe_gt_err(gt, "suspend failed (%pe)\n", ERR_PTR(err));
>>   
>>   	return err;
>> @@ -914,7 +910,7 @@ int xe_gt_resume(struct xe_gt *gt)
>>   
>>   	xe_gt_idle_enable_pg(gt);
>>   
>> -	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
>> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>   	xe_gt_dbg(gt, "resumed\n");
>>   
>>   	return 0;
>> @@ -922,7 +918,7 @@ int xe_gt_resume(struct xe_gt *gt)
>>   err_msg:
>>   	err = -ETIMEDOUT;
>>   err_force_wake:
>> -	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
>> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>   	xe_gt_err(gt, "resume failed (%pe)\n", ERR_PTR(err));
>>   
>>   	return err;
>> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
>> index 86146de1d31c..2ecf3c87c6b0 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
>> @@ -90,7 +90,7 @@ static int hw_engines(struct xe_gt *gt, struct drm_printer *p)
>>   	struct xe_device *xe = gt_to_xe(gt);
>>   	struct xe_hw_engine *hwe;
>>   	enum xe_hw_engine_id id;
>> -	int fw_ref, err;
>> +	int fw_ref;
>>   
>>   	xe_pm_runtime_get(xe);
>>   	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>> @@ -103,10 +103,8 @@ static int hw_engines(struct xe_gt *gt, struct drm_printer *p)
>>   	for_each_hw_engine(hwe, gt, id)
>>   		xe_hw_engine_print(hwe, p);
>>   
>> -	err = xe_force_wake_put(gt_to_fw(gt), fw_ref);
>> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>   	xe_pm_runtime_put(xe);
>> -	if (err)
>> -		return err;
>>   
>>   	return 0;
>>   }
>> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
>> index 9af81b07ab7a..1a7ee5681da6 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_idle.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_idle.c
>> @@ -144,7 +144,7 @@ void xe_gt_idle_enable_pg(struct xe_gt *gt)
>>   	}
>>   
>>   	xe_mmio_write32(mmio, POWERGATE_ENABLE, gtidle->powergate_enable);
>> -	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
>> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>   }
>>   
>>   void xe_gt_idle_disable_pg(struct xe_gt *gt)
>> @@ -161,7 +161,7 @@ void xe_gt_idle_disable_pg(struct xe_gt *gt)
>>   	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>>   	XE_WARN_ON(!fw_ref);
>>   	xe_mmio_write32(&gt->mmio, POWERGATE_ENABLE, gtidle->powergate_enable);
>> -	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
>> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>   }
>>   
>>   /**
>> @@ -223,7 +223,7 @@ int xe_gt_idle_pg_print(struct xe_gt *gt, struct drm_printer *p)
>>   		pg_enabled = xe_mmio_read32(&gt->mmio, POWERGATE_ENABLE);
>>   		pg_status = xe_mmio_read32(&gt->mmio, POWERGATE_DOMAIN_STATUS);
>>   
>> -		XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
>> +		xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>   	}
>>   
>>   	if (gt->info.engine_mask & XE_HW_ENGINE_RCS_MASK) {
>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
>> index c7a00565216d..27ad412936f7 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
>> @@ -423,7 +423,7 @@ int xe_guc_pc_get_cur_freq(struct xe_guc_pc *pc, u32 *freq)
>>   	 */
>>   	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>>   	if (fw_ref != XE_FORCEWAKE_ALL) {
>> -		XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
>> +		xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>   		return -ETIMEDOUT;
>>   	}
>>   
>> @@ -432,7 +432,7 @@ int xe_guc_pc_get_cur_freq(struct xe_guc_pc *pc, u32 *freq)
>>   	*freq = REG_FIELD_GET(REQ_RATIO_MASK, *freq);
>>   	*freq = decode_freq(*freq);
>>   
>> -	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
>> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>   	return 0;
>>   }
>>   
>> @@ -508,7 +508,7 @@ int xe_guc_pc_get_min_freq(struct xe_guc_pc *pc, u32 *freq)
>>   	*freq = pc_get_min_freq(pc);
>>   
>>   fw:
>> -	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
>> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>   out:
>>   	mutex_unlock(&pc->freq_lock);
>>   	return ret;
>> @@ -870,13 +870,13 @@ int xe_guc_pc_gucrc_disable(struct xe_guc_pc *pc)
>>   
>>   	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>>   	if (fw_ref != XE_FORCEWAKE_ALL) {
>> -		XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
>> +		xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>   		return -ETIMEDOUT;
>>   	}
>>   
>>   	xe_gt_idle_disable_c6(gt);
>>   
>> -	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
>> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>   
>>   	return 0;
>>   }
>> @@ -968,7 +968,7 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
>>   
>>   	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>>   	if (fw_ref != XE_FORCEWAKE_ALL) {
>> -		XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
>> +		xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>   		return -ETIMEDOUT;
>>   	}
>>   
>> @@ -1013,7 +1013,7 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
>>   	ret = pc_action_setup_gucrc(pc, GUCRC_FIRMWARE_CONTROL);
>>   
>>   out:
>> -	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
>> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>   	return ret;
>>   }
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
>> index 80e5c4ef86ef..8d7d9e7ade51 100644
>> --- a/drivers/gpu/drm/xe/xe_oa.c
>> +++ b/drivers/gpu/drm/xe/xe_oa.c
>> @@ -840,7 +840,7 @@ static void xe_oa_stream_destroy(struct xe_oa_stream *stream)
>>   
>>   	xe_oa_free_oa_buffer(stream);
>>   
>> -	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
>> +	xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>>   	xe_pm_runtime_put(stream->oa->xe);
>>   
>>   	/* Wa_1509372804:pvc: Unset the override of GUCRC mode to enable rc6 */
>> @@ -1463,7 +1463,7 @@ static int xe_oa_stream_init(struct xe_oa_stream *stream,
>>   err_free_oa_buf:
>>   	xe_oa_free_oa_buffer(stream);
>>   err_fw_put:
>> -	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
>> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>   	xe_pm_runtime_put(stream->oa->xe);
>>   	if (stream->override_gucrc)
>>   		xe_gt_WARN_ON(gt, xe_guc_pc_unset_gucrc_mode(&gt->uc.guc.pc));
>> diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
>> index 96d5ec1fbbd9..4372dd727e9f 100644
>> --- a/drivers/gpu/drm/xe/xe_pat.c
>> +++ b/drivers/gpu/drm/xe/xe_pat.c
>> @@ -182,7 +182,7 @@ static void program_pat_mcr(struct xe_gt *gt, const struct xe_pat_table_entry ta
>>   static void xelp_dump(struct xe_gt *gt, struct drm_printer *p)
>>   {
>>   	struct xe_device *xe = gt_to_xe(gt);
>> -	int i, err, fw_ref;
>> +	int i, fw_ref;
>>   
>>   	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>>   	if (!fw_ref)
>> @@ -198,9 +198,9 @@ static void xelp_dump(struct xe_gt *gt, struct drm_printer *p)
>>   			   XELP_MEM_TYPE_STR_MAP[mem_type], pat);
>>   	}
>>   
>> -	err = xe_force_wake_put(gt_to_fw(gt), fw_ref);
>> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>   err_fw:
>> -	xe_assert(xe, (fw_ref && !err));
>> +	xe_assert(xe, !fw_ref);
> 
> xe_assert() shouldn't be used to track/report HW errors
> 
>>   }
>>   
>>   static const struct xe_pat_ops xelp_pat_ops = {
>> @@ -211,7 +211,7 @@ static const struct xe_pat_ops xelp_pat_ops = {
>>   static void xehp_dump(struct xe_gt *gt, struct drm_printer *p)
>>   {
>>   	struct xe_device *xe = gt_to_xe(gt);
>> -	int i, err, fw_ref;
>> +	int i, fw_ref;
>>   
>>   	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>>   	if (!fw_ref)
>> @@ -229,9 +229,9 @@ static void xehp_dump(struct xe_gt *gt, struct drm_printer *p)
>>   			   XELP_MEM_TYPE_STR_MAP[mem_type], pat);
>>   	}
>>   
>> -	err = xe_force_wake_put(gt_to_fw(gt), fw_ref);
>> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>   err_fw:
>> -	xe_assert(xe, (fw_ref && !err));
>> +	xe_assert(xe, !fw_ref);
>>   }
>>   
>>   static const struct xe_pat_ops xehp_pat_ops = {
>> @@ -242,7 +242,7 @@ static const struct xe_pat_ops xehp_pat_ops = {
>>   static void xehpc_dump(struct xe_gt *gt, struct drm_printer *p)
>>   {
>>   	struct xe_device *xe = gt_to_xe(gt);
>> -	int i, err, fw_ref;
>> +	int i, fw_ref;
>>   
>>   	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>>   	if (!fw_ref)
>> @@ -258,9 +258,9 @@ static void xehpc_dump(struct xe_gt *gt, struct drm_printer *p)
>>   			   REG_FIELD_GET(XEHPC_CLOS_LEVEL_MASK, pat), pat);
>>   	}
>>   
>> -	err = xe_force_wake_put(gt_to_fw(gt), fw_ref);
>> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>   err_fw:
>> -	xe_assert(xe, (fw_ref && !err));
>> +	xe_assert(xe, !fw_ref);
>>   }
>>   
>>   static const struct xe_pat_ops xehpc_pat_ops = {
>> @@ -271,7 +271,7 @@ static const struct xe_pat_ops xehpc_pat_ops = {
>>   static void xelpg_dump(struct xe_gt *gt, struct drm_printer *p)
>>   {
>>   	struct xe_device *xe = gt_to_xe(gt);
>> -	int i, err, fw_ref;
>> +	int i, fw_ref;
>>   
>>   	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>>   	if (!fw_ref)
>> @@ -292,9 +292,9 @@ static void xelpg_dump(struct xe_gt *gt, struct drm_printer *p)
>>   			   REG_FIELD_GET(XELPG_INDEX_COH_MODE_MASK, pat), pat);
>>   	}
>>   
>> -	err = xe_force_wake_put(gt_to_fw(gt), fw_ref);
>> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>   err_fw:
>> -	xe_assert(xe, (fw_ref && !err));
>> +	xe_assert(xe, !fw_ref);
>>   }
>>   
>>   /*
>> @@ -330,7 +330,7 @@ static void xe2lpm_program_pat(struct xe_gt *gt, const struct xe_pat_table_entry
>>   static void xe2_dump(struct xe_gt *gt, struct drm_printer *p)
>>   {
>>   	struct xe_device *xe = gt_to_xe(gt);
>> -	int i, err, fw_ref;
>> +	int i, fw_ref;
>>   	u32 pat;
>>   
>>   	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>> @@ -374,9 +374,9 @@ static void xe2_dump(struct xe_gt *gt, struct drm_printer *p)
>>   		   REG_FIELD_GET(XE2_COH_MODE, pat),
>>   		   pat);
>>   
>> -	err = xe_force_wake_put(gt_to_fw(gt), fw_ref);
>> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>   err_fw:
>> -	xe_assert(xe, (fw_ref && !err));
>> +	xe_assert(xe, !fw_ref);
>>   }
>>   
>>   static const struct xe_pat_ops xe2_pat_ops = {
>> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
>> index 7c866b736f00..df7bdf3822cc 100644
>> --- a/drivers/gpu/drm/xe/xe_query.c
>> +++ b/drivers/gpu/drm/xe/xe_query.c
>> @@ -153,7 +153,7 @@ query_engine_cycles(struct xe_device *xe,
>>   
>>   	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>>   	if (fw_ref != XE_FORCEWAKE_ALL)  {
>> -		XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
>> +		xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>   		return -EIO;
>>   	}
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
>> index 6ab6a48b1d29..874523f22f56 100644
>> --- a/drivers/gpu/drm/xe/xe_reg_sr.c
>> +++ b/drivers/gpu/drm/xe/xe_reg_sr.c
>> @@ -202,14 +202,12 @@ void xe_reg_sr_apply_mmio(struct xe_reg_sr *sr, struct xe_gt *gt)
>>   	xa_for_each(&sr->xa, reg, entry)
>>   		apply_one_mmio(gt, entry);
>>   
>> -	err = xe_force_wake_put(gt_to_fw(gt), fw_ref);
>> -	XE_WARN_ON(err);
>> -
>> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>   	return;
>>   
>>   err_force_wake:
>>   	err = -ETIMEDOUT;
>> -	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
>> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>   	xe_gt_err(gt, "Failed to apply, err=%d\n", err);
>>   }
>>   
>> @@ -256,14 +254,12 @@ void xe_reg_sr_apply_whitelist(struct xe_hw_engine *hwe)
>>   		xe_mmio_write32(&gt->mmio, RING_FORCE_TO_NONPRIV(mmio_base, slot), addr);
>>   	}
>>   
>> -	err = xe_force_wake_put(gt_to_fw(gt), fw_ref);
>> -	XE_WARN_ON(err);
>> -
>> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>   	return;
>>   
>>   err_force_wake:
>>   	err = -ETIMEDOUT;
>> -	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
>> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>   	drm_err(&xe->drm, "Failed to apply, err=%d\n", err);
>>   }
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
>> index 3b5256d76d9a..1384c97a75c2 100644
>> --- a/drivers/gpu/drm/xe/xe_vram.c
>> +++ b/drivers/gpu/drm/xe/xe_vram.c
>> @@ -263,7 +263,8 @@ static int tile_vram_size(struct xe_tile *tile, u64 *vram_size,
>>   	/* remove the tile offset so we have just the available size */
>>   	*vram_size = offset - *tile_offset;
>>   
>> -	return xe_force_wake_put(gt_to_fw(gt), fw_ref);
>> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>> +	return 0;
>>   }
>>   
>>   static void vram_fini(void *arg)

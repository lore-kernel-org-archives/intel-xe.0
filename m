Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B511CCD185
	for <intel-xe@archiver.kernel.org>; Thu,  9 Oct 2025 11:49:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42D0110E9D5;
	Thu,  9 Oct 2025 11:49:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GmGqelPf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8597010E9D5
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Oct 2025 11:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760010593; x=1791546593;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=QimdFLXh5NEF90lwq4bHg1bD2vDhlIUo00RpLIwzvOY=;
 b=GmGqelPfbpQJeC27/i1tcrbSXuu0l42NFoA9uyUymOiGBAGwQPydhSA5
 +Aam9RqU5N14go805km4G+B/g0IHSjk6zneHsSqKPaTs1Rh/j0KrYXD5n
 AXOQub0uUcjD01Y5ibLcqhNrT9mTIDQ0igFEfrCamdj59ISxwESWlwgXv
 ptyOK6VpCFMuiM7EYURUv1LdvA6pYG5EXINO2OlWnoeUc91PafolmqzZj
 VU/uX6eUfJGiKnO09lit9kFjnNdHcN+xD7e4RvwoYbG1X3ofiN0CQVAmP
 2z4jDs42IVUHZgH823NKguLUyj2VOlNe1BoQvX+ehae07rSYc+2HOsxRg g==;
X-CSE-ConnectionGUID: SuedGUSuQ1iQ7P3fm2SFzA==
X-CSE-MsgGUID: WZOvmpN3SQ2piIvHpI+JJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="62378932"
X-IronPort-AV: E=Sophos;i="6.19,216,1754982000"; d="scan'208";a="62378932"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 04:49:53 -0700
X-CSE-ConnectionGUID: mmZBqp25QKe6yOXjgYx1cA==
X-CSE-MsgGUID: k18qasNPTZq01tTiRDkbiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,216,1754982000"; d="scan'208";a="181100111"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 04:49:52 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 9 Oct 2025 04:49:51 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 9 Oct 2025 04:49:51 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.4) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 9 Oct 2025 04:49:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e3Qjky+e5dipgONUpnIRLfL+L+uGWO3XxUpME9aRE+d/5jHOe9wBUdwlO/oSpwi+5HZZJjPiIbWixrsmGDP5XVklCrs7QzwTA7b1+JEoY4JxO3GakOqlrHpPeEN9bCiNr9yv+gl8sLMcwy0DRFVPd/G2CRsZMO6XzA+EAUlBYMJnOK/OtCksOlXr7UzJuzrZV+mQycrt/0Sd2qtORPAtQ8vwPiERibMilUHRq6jOejwe3ibQz0KkMiqkqdjzxjdFxMtxbF4JDqgnp4mVf69wzIXVYP4EJvcg95g3laH8LbicHAzKzlxzh/mGw3+eU2ZzBnhIK/Puv/5LHZBV9YUJ4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cn8pwsTWp9twmJc8c9YMY9/bNz67L+gS3YruDZAoxYE=;
 b=AB+DM4C6H4eyIl/XiToc3Wf7QxOhsKlYPD8xNASSTtXXlfxKJrYYgU643tfeMuSMYzVGT0SQWK6en6mtnBLdVXlZNSKChp23OW1M9lfpVAPC/BxxmDix8v8bMYRMd3QjxwJvqwATJh/HRZVHEqNnyRjt8Z8iKdu511lY0x/uAvSlgaLpnZsBcM3Ip0SDkZ//eovLCdjii8jfWw9cdgrs6D8knWrM6SsW21HX2fLBGat8Uh2HsYB7kGsoosfSXX2kFruFhwqy0PkscudmWmh4htI7jtfHG2JQvWIk/ITgzr4H7z181iSrOfhQpbOCIm708gRfHXbtx51h4zpJL+sLOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by PH0PR11MB5926.namprd11.prod.outlook.com (2603:10b6:510:14d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Thu, 9 Oct
 2025 11:49:48 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9203.009; Thu, 9 Oct 2025
 11:49:48 +0000
Message-ID: <45732d6c-2f8d-4dc5-aa43-c9b5868cf284@intel.com>
Date: Thu, 9 Oct 2025 13:49:43 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/6] drm/xe/guc: Add log init config abi definitions
To: Zhanjun Dong <zhanjun.dong@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20250828174159.1232994-1-zhanjun.dong@intel.com>
 <20250828174159.1232994-2-zhanjun.dong@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250828174159.1232994-2-zhanjun.dong@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR08CA0255.eurprd08.prod.outlook.com
 (2603:10a6:803:dc::28) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|PH0PR11MB5926:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a0386c5-8dd7-4f14-35dd-08de0729f2df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N2VOWTJ3TFNub0xaY3FVd0xmUnFpbjN1eUM0NUxQSFkyRUZ1bzB1MngrRXdm?=
 =?utf-8?B?aG1WajNOc1BSYVR2clFGcjFwYVh1ZXVLOTF0V0tVb3FySjc5eXUyZnpDeWpx?=
 =?utf-8?B?ekZzRmdaQk54a0tkbGY2NmhodEQwdi9HSlNHQ09lNDYwNTQrUVE3UW9YQ21X?=
 =?utf-8?B?V2FINFQ2ZkxET3plUkJ6QW0zQS9LY1NiM0tIZStBTE1hSmR4MXBCaFljdEI0?=
 =?utf-8?B?RXE3UGhBTDBFSTdqTXVLazRoL09XS2pPNVJCd2lJUStWNmdWcFQxU1RyMVNs?=
 =?utf-8?B?WU9heEJSUXBSclNTRWM2MTRIVi80YW15azhObW4yZzB0QUgvNG1XMXI3VkFW?=
 =?utf-8?B?SWU5L243NFdwK0YzMHZkWHBldjc5MlErWHlJT1hYL3hsb1BnMjcvU3ZEZDJn?=
 =?utf-8?B?OENiRzFkSTEvYmthZ2Z0b0F4SDczSGV0N25kWDNpUTREUWQweGNUQk9LNFpq?=
 =?utf-8?B?aW91T09GNzM3V2VFZ2lXVmdaRVhnNnRzM1k5eWk2Q0c2bUwxT2d6VlU2ZVA3?=
 =?utf-8?B?OTBYMGdaOEE1eVlKMlA1YTl2VXZwbVdPUkdEOUNyWVVkTXppWDVwTGU0TGFn?=
 =?utf-8?B?WUpoOFcxUldUN3Q0dzhFMlZwM0ZZU1NSSXhieXJMR1RxWmw2eDB6WUN6ekFM?=
 =?utf-8?B?WFJoai9NK1lySUtrdEZzZVFQM3o1dTFjelZRWCtGSGxuN0NoY3BzMkVod0tD?=
 =?utf-8?B?Q1ptK1dXQzQ0clYvWlpzbTlUUHIvOVdFRUgzVDlkZTJ0SzJuckQyT3JveCtT?=
 =?utf-8?B?QmM1NHdaL1V0elIweSt2ZVFmQm5ad0lyL2V4MzVYYjhqdEVXa0VjYWZoRW1O?=
 =?utf-8?B?MXMydWMzMURWNXVFaXpNK2VPQWI0N3ZWbFdGRVJOUlFnQjU0SldrUHRJU3F1?=
 =?utf-8?B?WHVHdXdXbmN0ZC9oRC9Malo1VXFvWVNIUkFTUk51UUdsUkxIN3VtNXl0ZUtF?=
 =?utf-8?B?ZlRwUitvaTB6TTJKZzVWRk5GazFYV2JjTXdCWTZTR0FvcTlKYllVbFpBSDZp?=
 =?utf-8?B?djZBSkZMV0k3aHNwcTdjQmZsemVtVjBjN0VXckZoR2pKa3pYWkdBNmd3Vklo?=
 =?utf-8?B?UTdDN2xpeUZqU3c4N0pPQTZScHF1L0s3VFFxckVXdXUvMXI1bUFOazFmNWYr?=
 =?utf-8?B?NXFhQnZzWVFibWJQV3hoVytOazdFd211MkVadExRSFkxWlhyLzVERFdrUC9k?=
 =?utf-8?B?ZFM1K3hVelZMTWhPR0RuTU5ITEowTnppcmxyekw1Q1BCbzdnZEY1RDl0aFQx?=
 =?utf-8?B?ZVkrRFdGdUtFQUIzdXUyL29Wa3l2MUl6SUlBekY3bWFSemhZK0pheW5WaGNJ?=
 =?utf-8?B?bCtQeHpBaG1ERkE4WnBTcDZjWVFmK3IzcXlPclMwd25FZmxtU3NPbm1nRGMw?=
 =?utf-8?B?N21wM24rZTFuS1R2MlBBRUZ1RGlmQWxpL0FLRFhLa1Q0RzU3ODA5S215elho?=
 =?utf-8?B?anJBNmtUSWN6L0c4a3lqSzBCbDY1L0NtWEFFZzNydHlUWWNrVEk1bGZDTU1M?=
 =?utf-8?B?ZWw5QkxyYlhybzB3QnRPRHhuQkJRRW14YzV3bmhSZnhFQ2daeXVVNnVwR2Fj?=
 =?utf-8?B?bFVvYXFSaEl1U0pVcytPYno3M0hNNkxuU2g5T3kxYkZWNGYxVzE2ZU9FUUFM?=
 =?utf-8?B?RnFEUmVvMTFocXNXTzUycEZiTXFtYURoSTZiTUZ2VExDbTN5bm5MZjNWL3M2?=
 =?utf-8?B?eDRleFJnUnBXRFo3NkhndXJDcGN5MWZZSmcvTVprVFIyeUNFUndoRVRPNmhI?=
 =?utf-8?B?Vk05R2pIL0U2ck1jZ25UV3B0cHpnQzJGaldvZXd5SWMzS3NDQXVkUG5FbFNM?=
 =?utf-8?B?d0RjRXM1TDZoNjRJRjBtN3NONnNsYm80ZHRjMnQyZ1JmYWVFenRSUFJsbElz?=
 =?utf-8?B?OFVuR1pSSTFHbnhHVUZiSXVRZDhTbnIweU4wRTRMb3kxNmc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K2JBcDF5R2hINm1zSXJ1QXBqWVI4WnNmdFg1U1V1MTRhZy9RVWt4bnlRSlNh?=
 =?utf-8?B?eXlWQ3Q0bUZEU2duUm9wOTV1UWxjYVF4bDdHajRSbSt4bklyMDhaQlRVSThX?=
 =?utf-8?B?Y29SS2hrb1ZDQm04UVdKQk5XNGppcDhiNk1SQUhlMjZUaTg2em9DbGcvSHVz?=
 =?utf-8?B?aGNhekVwc1I3S0JsbjRmRXJwRGd5dm44Nng3WnpDZDZuVERhYmtualF0UVFj?=
 =?utf-8?B?cE9PaFB3VTBFMDRUU0hxcFovYm5CWEhBd1crZlo3MXEwNUFjNWQvem10eWIy?=
 =?utf-8?B?TXc2WmVJV2c3KzNQSkI3WVhDUmE5RDBJREJ4eFJCRHlKdk5JeUpIcm5vUE14?=
 =?utf-8?B?QjBsNDlLY1FmV0taM1gyNkYxaEduUjRiZ3lwTkxyVXVFdmxQWW55N2FxUExm?=
 =?utf-8?B?UUFEWnpWN1NTUG1VQzYwV29XSzJINXQ0LzdJZmw0ZTFpNWQwTW8xSXFlVW5y?=
 =?utf-8?B?R2tmbmNHSjVhN0cvSURVVkpPb0RPQVlmdGZiSTdHVzRGNEJ6NVhmdERsVTV0?=
 =?utf-8?B?bFFSNDhmaWdDSjdjV0E5ZTRCbDBrRG41L01CMUNSZEJValF3cEpyNloweUw2?=
 =?utf-8?B?cWkxSzNmYnJyYnBNMnA2Z293eGZCa0hFaXlOc1ByT3A2YlMzaWQ4ZUVSQ0lG?=
 =?utf-8?B?ZUlEM0EzNW1wanUrREZtV3h5VFZzcmNycDFTYWZGQmNHR0VWeGYzYkdrQWYy?=
 =?utf-8?B?UDY2STJQa0xyMEp6MDZqYVl3WjdjNkNIaGtTYTdQLzhpUmtaMGFhSVRaZTJw?=
 =?utf-8?B?TmwzSnd1dWhuSEJqMmtMWVZzQTR2T3BOZmFReE1sUk1rYTNCM21xRzFDaTlE?=
 =?utf-8?B?WWRQbERkRFFDTWl1TmJPTmkzS3lTQ3Eybm0reEJYM1dDVDNjVnpQOTI0REVP?=
 =?utf-8?B?VGJ0cURYTkFKUCtFOENLVmNMSlZ3Nm5lcUFQSnhBb29IM1RjV0IrZjRRNlBV?=
 =?utf-8?B?N0NIVlNTdTMyOHpHOVQ2N1Q1U1U3K0tydVNxWUZvL3pudjJscm54NW1vY20z?=
 =?utf-8?B?bE0vd2o5alNrVkFHZGNSVHl2MUZjbktpWFJjczJwc3FnZzgvbXpZbytscHc3?=
 =?utf-8?B?Z1JscUNuMjRidUhtcDhyT3pCWnQrNjEvVXRVMjRJNWJNMGx3WHBMSS9wNS9z?=
 =?utf-8?B?SVZ1c3RrNFJHd1NJdE9hTnJZa0VvVXgreUpXcVZ1ZUc4WHR6WWVoamM0bnZD?=
 =?utf-8?B?akdHN29MMmc4aGNyK2c2b0NRY1lJd3ArQ3FmRmxxU3lNNFkxcVBMQ3h1d2Mz?=
 =?utf-8?B?dGd4eVkzL3VHbGZoZFlmb1NXSGgvbDJCVXFuWFFSNzJEa1VDa01jM2s3bVl5?=
 =?utf-8?B?MG92bWR1Z1hXMXJhUUFHOU1qVk5kQ083NFhYYWltRjBzZTJtNUNGcHNjRmdR?=
 =?utf-8?B?WjZZWEEyL2c2ekY5YmlLTExSMWhrM0I0NVJTM29nck9UVWtaY0tOYkltTWcv?=
 =?utf-8?B?b096ZThvaFhCNXZ2OEdNeWJOSmRaNnE2N09OQmZUb2dmbWtDRHloR3B0VTR5?=
 =?utf-8?B?bUxjQzZGbGl4aEdPQ1Y3bU1VWEhsaXdDcC82UmdRSXdpQ3hHUjhGTXlHcW9J?=
 =?utf-8?B?cTlnLzNIVkloQnJsSHNFQkUrUVRlZFpyRjh4VTdnV1RUUVZWTzZBYjNkYWpK?=
 =?utf-8?B?N2lXRnAzek5mSGxxTDIzSm1CTUtOTmlmTTBEcHdZVkR1U1V1Q05yZnREZ29p?=
 =?utf-8?B?dzI0bW5NT0Y3b3lyZUh0UmsydUl5eUVpTVZaakJ0WnVWeGNOTERRbVlPQnJH?=
 =?utf-8?B?Ymc2bzhlVmFwMWZUYlVGQ0NISzZlemxnZ3UwcFo2OUNBdGVwNDFic21lbWtW?=
 =?utf-8?B?U0dzRUF4blF4K0o4d2lialpoVzc0ZFp3eWQvQW55QzVReTBpVXdSdGk0YVd5?=
 =?utf-8?B?WFpKa1NoTGd6a2lTTld1L21MWkE4djQ1bGlhajZlakluU1k0QzN3QnI4aVhT?=
 =?utf-8?B?dWc5bXlWa1MwejgxZjliTVFBaHc1dGlMQTFFemRLaERnMU1lRjVrSUp3UTds?=
 =?utf-8?B?NHFIVWZ0N3pIbjQzRFVDUythRlp1M3lZelBKZWoxcHY1cmd2a0R1VkFFM2k4?=
 =?utf-8?B?ckRYVnhTWXV3RWhLMUJqQmxEa1p5TjZaWUNkelVZVXBKalVualdrdm1kYkF2?=
 =?utf-8?B?cG1mS0c1RHZod0pQRzllU2RtczNJNjVJSllOQmxNUmZUYWprbFN4SmhyUXYr?=
 =?utf-8?B?Y3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a0386c5-8dd7-4f14-35dd-08de0729f2df
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2025 11:49:48.5299 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xFiun7dvmXLJDWKgOVoIhmvcCvPKsqgO2dG+qaUnTqAukA0H59qvWhljYaGY2/v+uWgUpb06W/yBat22mDxZcYetyCu5auypYqQF2EPe/es=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5926
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



On 8/28/2025 7:41 PM, Zhanjun Dong wrote:
> Add GuC log init config (LIC) ABI definitions.
> 
> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
> ---
>  drivers/gpu/drm/xe/abi/guc_lic_abi.h | 74 ++++++++++++++++++++++++++++
>  1 file changed, 74 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/abi/guc_lic_abi.h
> 
> diff --git a/drivers/gpu/drm/xe/abi/guc_lic_abi.h b/drivers/gpu/drm/xe/abi/guc_lic_abi.h
> new file mode 100644
> index 000000000000..72b29bf7171a
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/abi/guc_lic_abi.h
> @@ -0,0 +1,74 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef _ABI_GUC_LIC_ABI_H_
> +#define _ABI_GUC_LIC_ABI_H_
> +
> +#include <linux/types.h>
> +
> +/** enum guc_lic_type - Log Init Config TLV IDs. */

this looks like a wrong format for kernel-doc, try:

/**
 * enum guc_lic_type - Log Init Config TLV IDs.
 */

refer to [1]

[1] https://docs.kernel.org/doc-guide/kernel-doc.html#structure-union-and-enumeration-documentation

also replace TLV with KLV, so this should be:

/**
 * enum guc_lic_type - GuC Log Initial Config KLV types.
 */

> +enum guc_lic_type {
> +	/**
> +	 * @GUC_LIC_TYPE_GUC_SW_VERSION: GuC firmware version. Value
> +	 * is a 32 bit number represented by guc_sw_version.
> +	 */
> +	GUC_LIC_TYPE_GUC_SW_VERSION = 0x1,
> +	/**
> +	 * @GUC_LIC_TYPE_GUC_DEVICE_ID: GuC device id. Value is a 32
> +	 * bit.
> +	 */
> +	GUC_LIC_TYPE_GUC_DEVICE_ID = 0x2,
> +	/**
> +	 * @GUC_LIC_TYPE_TSC_FREQUENCY: GuC timestamp counter
> +	 * frequency. Value is a 32 bit number representing frequency in
> +	 * kHz. This timestamp is utilized in log entries, timer and
> +	 * for engine utilization tracking.
> +	 */
> +	GUC_LIC_TYPE_TSC_FREQUENCY = 0x3,
> +	/**
> +	 * @GUC_LIC_TYPE_GMD_ID: HW GMD ID. Value is a 32 bit number
> +	 * representing graphics, media and display HW architecture IDs.
> +	 */
> +	GUC_LIC_TYPE_GMD_ID = 0x4,
> +	/**
> +	 * @GUC_LIC_TYPE_BUILD_PLATFORM_ID: GuC build platform ID.
> +	 * Value is 32 bits.
> +	 */
> +	GUC_LIC_TYPE_BUILD_PLATFORM_ID = 0x5,
> +};
> +
> +/**
> + * struct guc_lic - GuC LIC (Log-Init-Config) structure.

add separation line before below longer description

> + * This is populated by the GUC at log init time and is located in the log
> + * buffer memory allocation.
> + */
> +struct guc_lic {
> +	/**
> +	 * @magic: A magic number set by GuC to identify that this
> +	 * structure contains valid information: magic = GUC_LIC_MAGIC.
> +	 */
> +	u32 magic;
> +#define GUC_LIC_MAGIC			0x8086900D
> +	/**
> +	 * @version: The version of the this structure.
> +	 * Major and minor version number are represented as bit fields.
> +	 */
> +	u32 version;
> +#define GUC_LIC_VERSION_MASK_MAJOR		GENMASK(31, 16)
> +#define GUC_LIC_VERSION_MASK_MINOR		GENMASK(15, 0)
> +
> +#define GUC_LIC_VERSION_MAJOR	1u
> +#define GUC_LIC_VERSION_MINOR	0u
> +
> +	/** @data_count: Number of dwords the `data` array contains. */
> +	u32 data_count;
> +	/**
> +	 * @data: Array of dwords representing a list of LIC KLVs of
> +	 * type guc_klv_generic with keys represented by guc_lic_type
> +	 */
> +	u32 data[] __counted_by(data_count);
> +} __packed;
> +
> +#endif


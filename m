Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B1CFC98302
	for <intel-xe@archiver.kernel.org>; Wed, 23 Sep 2026 07:01:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B976310EF2A;
	Wed, 23 Sep 2026 07:01:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iS6EQ/71";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C34810EF1B
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Sep 2026 07:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790146910; x=1821682910;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=c/lWpnjsyTxWaIizR8jyacYfqhZ8cQKtsMtmxdRTe5M=;
 b=iS6EQ/71jMyoj0MvPruKJV2RUurbpXrhzqkkHxngiU36VFJApAaGbq6W
 BQDLSZYzNasWSsmm0ufAMvrxQ+H5URzldRItiNrcSzomiLkJg6DzJ3mRF
 KcoiS7LLReHU0BlHn4QrL3JrWebLEXcaQ2ean3N39rQAUJ8p29h0u2aH0
 YscG6ke7fG2hINGP1zkzh3PEbBhSYBr6PsjQMYPvLWnCh0s3Yr9BShtNq
 VkI/ykApq+ealjZf5BbQDzU1bRte8HL7wYt8ofjAHwO+0m+UvYHgYORjA
 ynpN0NhSMN5CHNZX8+DH5zryuEP360EBy/Vgo6OSwx1dwZt4DAh6no1ib g==;
X-CSE-ConnectionGUID: qHED/1kwTXSDPeN77lZ0cg==
X-CSE-MsgGUID: DOkmRHYWQGKhmhIfKUJFJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="102169501"
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; d="scan'208";a="102169501"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 00:01:50 -0700
X-CSE-ConnectionGUID: aQ9D77QIQ5WcXvT0sUXitQ==
X-CSE-MsgGUID: noDqLcRYQlGXIDSadbz5qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; d="scan'208";a="273657546"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 00:01:50 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 23 Sep 2026 00:01:49 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 23 Sep 2026 00:01:49 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.5) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 23 Sep 2026 00:01:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E6f5NVTFzbGn/IYLIjCGIJq7nHCKv0JtLVvCVNgQDfCQsAo7/NEJiqKEg7omqd8L7AjR4Ot7l/tBI2QdXoo1+hcLKNrTn7bqIByJZqhXz2PMDJuQmEsWA6oR/QP36I5+/nMEi3SG/6Fw2T/zxrNVH3r4NuU/J2/u6VfcSRxY72EjHXPx6gGy5AoEOFwNxj9iFTUZStv3ho8+gzh/c5RQVRjv0JPDjtoakRT2CLREbHte+Rq5d37yATHgbpKsz6s6Yk9ux3yVITbvrGbbncWek6/OewhPJLFbWym7O/Z9RRTPhNzMmEoJyRoc3WGVbMyWVSDalhyWxvtD0K0DfmaeyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DtHBQCeYCRmUK2Rix+BvoB/jrKY9g+88Yt3uow7smOo=;
 b=hZFPkjPIWgGG29hCLqicGtxQpJO/zkfCKtllOZDX/Y9QSro4WkTPkAR7EXkg/DglpRvv7vQJq54mQb8i4p49K+V3NejaJnEHkQCduUZV4tz8Siv20uKzej1LHKKksXA7fb3ewF0ae8VaQYEw4lw/Wn9QRgzGsZJpCR0zEnZcQ4PqKZCNSvwLCQxKGzRA7JgDYvJDbZwR4wwQYO8Ge2XAhn7Al+jhQyjwonQiDQTAYQKY8y76MBTPvKSJSs9B+LPNKLCJBvTqB3DaZP2YfVstxcrmVMDur5WSoBfGv+5+S/DIGbcjR3bfnmf77CH/rBKOrkMYNS+X729CQYROICFfrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by DS0PR11MB7652.namprd11.prod.outlook.com
 (2603:10b6:8:14e::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Wed, 23 Sep
 2026 07:01:42 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::5a5c:9c7a:cd1d:d687]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::5a5c:9c7a:cd1d:d687%6]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 07:01:42 +0000
Message-ID: <bdce2d28-594a-451e-94b8-522c3a811941@intel.com>
Date: Wed, 23 Sep 2026 12:31:36 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 18/24] drm/xe: Add ULLS support to LRC
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20260904211613.3934307-1-matthew.brost@intel.com>
 <20260904211613.3934307-19-matthew.brost@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20260904211613.3934307-19-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0P287CA0002.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::8) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|DS0PR11MB7652:EE_
X-MS-Office365-Filtering-Correlation-Id: 977810ce-8690-426b-ff0e-08df194085b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|1800799024|376014|6133799003|10067099003|56012099006|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: Z9pigS/yIILt3XLz5EuK2baHzz1Jn41unK9Rd7c/3XPZPCFcLIVNklyxh4OKm0RbFSqO5sDN2dbz0qLJgU6Gnbqkt2irQIC5gPzsAcfMGwGpS3N8aqkVuXnkjAa8t/QO4ouThZaVBJLf8rPn0eGMgqtFLs16KWI3ERjPavds0N9tJhpwUvxHlGvHumbEGmVWFzFPiaIv86JByisk8IX9EU8KYyYWiDUleujC4DqhIjGdMxpIlhKNFQLHmaD4JviawtHdKhFS5kK84rk6TPDV1hFdbwmTOL8lVOtpQ+gWUbVfMecC4ke4upIgshp6b2er9meFHrrjANnDdnb1Kb33HfnLFCaH9RYeT6rF2szQi8NTbjFQwSotK8jwigDAIXZ+s9joCo3R+2UHZYxhImMY3iHEIpAh8RyY8wFlCAHIJ1iewZYyBEy37vaD2ioYuGoQaiRl65jIhh7wfLsm5mouM/kZ+vd9LIuuouTNP5TLYngpCe1KtWRhmmkGWqOLmvTfi2/cNjYcbDLWzEdAFrn6KVYkeg5Z/CfGCZVJJIxG6Sxh4f8WUO+SySXZmiaxl5NN/DggnUwR3d7Un5DVlV2QD0lD3XrpU97c5vkYhTvOHzfsKaecLXI9GTBOE0MlhiAZ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(6133799003)(10067099003)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T3gwZTh0MlhLVE1ZZkpnbVNJbHJiTC9CWjE5VThXN1VCQXRBbWpkb2ZOQ3BT?=
 =?utf-8?B?K1RnQXlrVXRNUUZVeDMyOVpLcTd5eWl0eHZtb1RCN0Z5MFgydkVwVU4ySVBY?=
 =?utf-8?B?dkM5SE9yN2FKY0tDa3FPaWhxZ0hlSnJpdG5qV3MvbXhOMEppUmNickZUVFJT?=
 =?utf-8?B?VEZBb0xTVzZ5UDAxWHpBbFhMOUNheXpBSXl6dWIvanFhbnJZQWNlZUVrcmdR?=
 =?utf-8?B?RkFaOWgrQ0kwRHF6bllFVWJiSm1jV29pdUc2QXk2c2YreVFXSWd2NlducDYy?=
 =?utf-8?B?a2REWEJVZ0tPdGROazlvZ3RJSmtlT0pHODJ1S1FOYUNtWEJiUW41QmVZZmxo?=
 =?utf-8?B?bDNETkNQZ01DaHdkL1RRZzlyVDBjZlBGR29rWVBuYy8zSVM1YWJnZDZ4TEVo?=
 =?utf-8?B?TTMxTjAyK05EeFBhR1V4TnhVOXB4djl6MjZhNHVjLzNUcVR0c01wWXVMdFlr?=
 =?utf-8?B?c3ZGbXE5OXVBTnlnaVR0amxsaTF3RFIweVRpV3Z0TGFqVVlod1BpS1hEc05U?=
 =?utf-8?B?dE1sUzlZcERqYWE4VkVEM0FqdGVScVQxZW9mK2ZLcklKcjVodWQvb2lyakdI?=
 =?utf-8?B?VFhCeUxCVk5lTmExbGszZHlGMktCTjRDY05WcEpneDFyWnAyRzI5U0RUdGNC?=
 =?utf-8?B?N096S0IwWWVHQjhzcWNwMWlqS3VTYVpOTzFJRmtsd2xqSHQ2dmh6N01YN0tJ?=
 =?utf-8?B?QWZVUThzZTViRUdmeUdHTVpMVEJ1cWo1ZEV5NDhuUGlaLzBEWDZUWXI5eHRl?=
 =?utf-8?B?UE1yTXFtT3Y1Q3RiUVM3MzlrSE9hUkpzRVFvUkVTK2VJMC9LNnJnTmFtK0lq?=
 =?utf-8?B?UTVZcldLUkg1RDNoTXpLTSticm5JYVVvNlpldzhmTTlWcFBwSlA2UTgzTERT?=
 =?utf-8?B?NHp0ZGFRTUx0M0V0bGFzYVBydmVnNzRWREZFRXVJWUFncHpNb3FPUkZaZjJw?=
 =?utf-8?B?b1hXWkp6Z2VPOUpKMWpkSFhaNmlacmNsSVpUNVFRWjM3OGd2Y1l0cFRtTEtx?=
 =?utf-8?B?TlFQK3VMTENGS1pMUEtBYy9TSHUySGJEZkVDdC9PZzlpWTRwMzJYc2IvZjNI?=
 =?utf-8?B?VmFaYVVrQkFUK2FoQ2pva0Vmd0x1WWR4RXRyZDVHS3orK2t5R1lzaXdVSkYw?=
 =?utf-8?B?SEZRWjdpYTAybWoxaE5JY2phSGJPQ09CUGRwSTJSVy9qT0JIVXNkc1dXUmo5?=
 =?utf-8?B?eE9NSm5nRU1zZ3BJaDAvd2tHVkVKL2NNR2tDMWFsc25VT1RxUk1wNzRDYnZp?=
 =?utf-8?B?Z0pIR2IwaFVIM3dMUGlIbWNmaDZkZWlZNXJCTlZ1QkVJaUkxUTY0enp2YjlP?=
 =?utf-8?B?aUwrTmNxSVZjQ2g2ZFc1RUVNMWljWkQ3TlZtbmp3TWxnR2tiS0xPK25ZOFly?=
 =?utf-8?B?cGtnajF0Tzh5Y1pkRkEwWHUxd1lMYjQveWRWWmtYcmp0VElkajd3TjhnVDhx?=
 =?utf-8?B?a1JxTkVNdVVQVEFsM0R5TDJwd3BZS0twNjFMVVIvN01iRGd6Yy93OFp1TDJU?=
 =?utf-8?B?SCttZzRJR2V0dHJuU3czZmtRQ0c2am9JQnlkTS80OEpNOVArYmVtVTdVNEFw?=
 =?utf-8?B?RlRMQWdrZ2pBVVhxSlVDT0hMU2Zwa3AvWFg3RFpXTjArYUtZQUxDaFBmODRT?=
 =?utf-8?B?cXRhMDM4SEtSVEhESzk4OXhObW1leldwZFNmcTMyL2drbWZ6NkFZY2RyMjZT?=
 =?utf-8?B?Z3JiM09PR2lEMVRkbjEyV1hWcFZndDNRMnpiSmJLbXhyMEdvZTVJYWtabHhM?=
 =?utf-8?B?WC9ZdTVBQWdGb0hDMVVwREgyMzhNYnFqaTk3VXd2b3Z3VWQrM1hWMVVKc2tm?=
 =?utf-8?B?emx5NW95UEdNZFRZQ0c0bm9VQkZ2RHRlbE5PSzlmMmtGdXdwMkFCUVZuTmdC?=
 =?utf-8?B?UlR5VWF6MDJKS2NTZlBWc29Pb0lNenNCTG92OGRKRW5ZYWRrS3VmOVlRdkFw?=
 =?utf-8?B?TWQ0V2F1MWlZQWIxR3NwL3NuSE1oRGdsc0dRd2ZsSXVXb2JtaGpmRzFUeXZ0?=
 =?utf-8?B?Z3RJd255c1ZxODZ0Z1ljSlFVSVhCbGNNbDFWK1BCZG1zTjBPNjhJdlRXazY5?=
 =?utf-8?B?eGtYM1FxdGpEVmpzdGpvcGR1OTkwNFY2cm9JbnQxM2krcW1FZ0REemo4VXQz?=
 =?utf-8?B?c1pTdjZ0VHhzeXgwcTVoYktyRitwaVpwV3lKZldJS0xHemJXbHg2NHd3WS93?=
 =?utf-8?B?VGJVb1JGT0RpcXczLzZLSFUxQ0NmRkliT1NFU0NObzdScWZBVjNUS2dCTm00?=
 =?utf-8?B?cno5S0ZleDRvWWpZdTJDVWt4cWpuTFhLM2E4WWJuR2xQclNLMTlrREVsNFMv?=
 =?utf-8?B?VXY5ZmpNSEpHZWxVZk9zc1JJVmduQXIxVWJxMHpsNHhNekE3bzN4c0hQVHBz?=
 =?utf-8?Q?Ecg4P8soS530CXdk=3D?=
X-Exchange-RoutingPolicyChecked: tbsDYJ5TH7uXdC7D40vTtWCFsGy6wD56BSteTHybSDlC8eA+eDd5aGYftONaO1IDGjI7UUIwk9IFAU1Iaqx3WMWWkuxnTFM9yUOY51X81n0VK+jtlEIm5DXD1tlyaEb7nidwJsMqf5jSxtZCfbM4PJMXU7+oBRNWv+OsaacBAJ30qLKvN/eAoEavCHUk9YRJFTd/y4SaPy/i2wsRJElJJGK6RSnq8wkJq0m3UAoBtum7mlL5D2Z/A7UZyCzynx17JOeSkSYRFIAUrsY6jHvAG+lMnICA9dyT7njvDBRc9k0k5UQ+ECVQd9Eyi/pWs3oV2wTv+gw8EutL6E9jFZu0bQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 977810ce-8690-426b-ff0e-08df194085b5
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 07:01:42.3634 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /HCaachR1LA9Cr+O3C9Jrmkr1NAr/vM4UAZV2J9MdY61x8rB53FrL+4eHWVsQvbCO6fxTcmjo8mwXGySSM7u1T66c5sSgILhnvW9YswFwPo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7652
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



On 05-09-2026 02:46, Matthew Brost wrote:
> Define memory layout for ULLS semaphores stored in LRC memory. Add
> support functions to return GGTT address and set semaphore based on a
> job's seqno.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Link: https://patch.msgid.link/20260228013501.106680-20-matthew.brost@intel.com
> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
> ---
>   drivers/gpu/drm/xe/xe_lrc.c       | 73 +++++++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_lrc.h       |  4 ++
>   drivers/gpu/drm/xe/xe_lrc_types.h |  4 ++
>   3 files changed, 81 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index 25fe9dbc9141..c592e7b98072 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -706,6 +706,7 @@ u32 xe_lrc_pphwsp_offset(struct xe_lrc *lrc)
>   #define LRC_CTX_JOB_TIMESTAMP_OFFSET 512
>   #define LRC_ENGINE_ID_PPHWSP_OFFSET 1024
>   #define LRC_PARALLEL_PPHWSP_OFFSET 2048
> +#define LRC_ULLS_PPHWSP_OFFSET 2048	/* Mutually exclusive with parallel */
>   
>   #define LRC_SEQNO_OFFSET 0
>   #define LRC_START_SEQNO_OFFSET (LRC_SEQNO_OFFSET + 8)
> @@ -768,6 +769,12 @@ static inline u32 __xe_lrc_engine_id_offset(struct xe_lrc *lrc)
>   	return xe_lrc_pphwsp_offset(lrc) + LRC_ENGINE_ID_PPHWSP_OFFSET;
>   }
>   
> +static u32 __xe_lrc_ulls_offset(struct xe_lrc *lrc)
> +{
> +	/* The ulls is stored in the driver-defined portion of PPHWSP */
> +	return xe_lrc_pphwsp_offset(lrc) + LRC_ULLS_PPHWSP_OFFSET;
> +}
> +
>   static u32 __xe_lrc_ctx_timestamp_offset(struct xe_lrc *lrc)
>   {
>   	return __xe_lrc_regs_offset(lrc) + CTX_TIMESTAMP * sizeof(u32);
> @@ -835,6 +842,7 @@ DECL_MAP_ADDR_HELPERS(ctx_job_timestamp, lrc->bo)
>   DECL_MAP_ADDR_HELPERS(ctx_timestamp, lrc->bo)
>   DECL_MAP_ADDR_HELPERS(ctx_timestamp_udw, lrc->bo)
>   DECL_MAP_ADDR_HELPERS(parallel, lrc->bo)
> +DECL_MAP_ADDR_HELPERS(ulls, lrc->bo)
>   DECL_MAP_ADDR_HELPERS(indirect_ring, lrc->bo)
>   DECL_MAP_ADDR_HELPERS(engine_id, lrc->bo)
>   DECL_MAP_ADDR_HELPERS(queue_timestamp, lrc->bo)
> @@ -1805,6 +1813,26 @@ void xe_lrc_set_ring_tail(struct xe_lrc *lrc, u32 tail)
>   		xe_lrc_write_ctx_reg(lrc, CTX_RING_TAIL, tail);
>   }
>   
> +/**
> + * xe_lrc_ring_tail_ggtt_addr() - Saved ring tail GGTT address
> + * @lrc: Pointer to the lrc.
> + *
> + * GGTT address of the ring tail as saved for this context - in the indirect
> + * ring state on platforms which have it, otherwise in the context image.
> + * This is what a context restore loads the tail register from, so a ring
> + * which advances the tail register itself must keep this in sync.
> + *
> + * Returns: saved ring tail GGTT address
> + */
> +u32 xe_lrc_ring_tail_ggtt_addr(struct xe_lrc *lrc)
> +{
> +	if (xe_lrc_has_indirect_ring_state(lrc))
> +		return __xe_lrc_indirect_ring_ggtt_addr(lrc) +
> +			INDIRECT_CTX_RING_TAIL * sizeof(u32);
> +
> +	return __xe_lrc_regs_ggtt_addr(lrc) + CTX_RING_TAIL * sizeof(u32);
> +}
> +
>   u32 xe_lrc_ring_tail(struct xe_lrc *lrc)
>   {
>   	if (xe_lrc_has_indirect_ring_state(lrc))
> @@ -1984,6 +2012,51 @@ static u32 xe_lrc_engine_id(struct xe_lrc *lrc)
>   	return xe_map_read32(xe, &map);
>   }
>   
> +#define semaphore_offset(seqno) \
> +	(sizeof(u32) * ((seqno) % LRC_MIGRATION_ULLS_SEMAPHORE_COUNT))
> +
> +/**
> + * xe_lrc_ulls_semaphore_ggtt_addr() - ULLS semaphore GGTT address
> + * @lrc: Pointer to the lrc.
> + * @seqno: seqno of current job.
> + *
> + * Calculate ULLS semaphore GGTT address based on input seqno
> + *
> + * Returns: ULLS semaphore GGTT address
> + */
> +u32 xe_lrc_ulls_semaphore_ggtt_addr(struct xe_lrc *lrc, u32 seqno)
> +{
> +	xe_assert(lrc_to_xe(lrc), semaphore_offset(seqno) <
> +		  LRC_PPHWSP_SIZE - LRC_ULLS_PPHWSP_OFFSET);
> +
> +	return __xe_lrc_ulls_ggtt_addr(lrc) + semaphore_offset(seqno);
> +}
> +
> +/**
> + * xe_lrc_set_ulls_semaphore() - Set ULLS semaphore
> + * @lrc: Pointer to the lrc.
> + * @seqno: seqno of current job.
> + *
> + * Set ULLS semaphore based on input seqno
> + */
> +void xe_lrc_set_ulls_semaphore(struct xe_lrc *lrc, u32 seqno)
> +{
> +	struct xe_device *xe = lrc_to_xe(lrc);
> +	struct iosys_map map = __xe_lrc_ulls_map(lrc);
> +
> +	xe_assert(xe, semaphore_offset(seqno) <
> +		  LRC_PPHWSP_SIZE - LRC_ULLS_PPHWSP_OFFSET);
> +
> +	/*
> +	 * The ring contents this semaphore releases are ordered by the
> +	 * xe_device_wmb() at the end of xe_lrc_write_ring().
> +	 */
> +	iosys_map_incr(&map, semaphore_offset(seqno));
> +	xe_map_write32(xe, &map, LRC_MIGRATION_ULLS_SEMAPHORE_SIGNAL);
> +
> +	xe_device_wmb(xe);	/* Flush write to hardware */
> +}
> +
>   static int instr_dw(u32 cmd_header)
>   {
>   	/* GFXPIPE "SINGLE_DW" opcodes are a single dword */
> diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
> index 7be5e3da8bc8..9906ba1fac3e 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.h
> +++ b/drivers/gpu/drm/xe/xe_lrc.h
> @@ -112,6 +112,7 @@ u32 xe_lrc_regs_offset(struct xe_lrc *lrc);
>   
>   void xe_lrc_set_ring_tail(struct xe_lrc *lrc, u32 tail);
>   u32 xe_lrc_ring_tail(struct xe_lrc *lrc);
> +u32 xe_lrc_ring_tail_ggtt_addr(struct xe_lrc *lrc);
>   void xe_lrc_set_ring_head(struct xe_lrc *lrc, u32 head);
>   u32 xe_lrc_ring_head(struct xe_lrc *lrc);
>   u32 xe_lrc_ring_space(struct xe_lrc *lrc);
> @@ -127,6 +128,9 @@ void xe_default_lrc_update_memirq_regs_with_address(struct xe_hw_engine *hwe);
>   void xe_lrc_update_memirq_regs_with_address(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>   					    u32 *regs);
>   
> +u32 xe_lrc_ulls_semaphore_ggtt_addr(struct xe_lrc *lrc, u32 seqno);
> +void xe_lrc_set_ulls_semaphore(struct xe_lrc *lrc, u32 seqno);
> +
>   u32 xe_lrc_read_ctx_reg(struct xe_lrc *lrc, int reg_nr);
>   void xe_lrc_write_ctx_reg(struct xe_lrc *lrc, int reg_nr, u32 val);
>   
> diff --git a/drivers/gpu/drm/xe/xe_lrc_types.h b/drivers/gpu/drm/xe/xe_lrc_types.h
> index 53ef48feebfc..b18daf1092e6 100644
> --- a/drivers/gpu/drm/xe/xe_lrc_types.h
> +++ b/drivers/gpu/drm/xe/xe_lrc_types.h
> @@ -12,6 +12,10 @@
>   
>   struct xe_bo;
>   
> +#define LRC_MIGRATION_ULLS_SEMAPHORE_COUNT	64	/* Must be pow2 */
> +#define LRC_MIGRATION_ULLS_SEMAPHORE_CLEAR	0
> +#define LRC_MIGRATION_ULLS_SEMAPHORE_SIGNAL	1
> +

LGTM
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

>   /**
>    * struct xe_lrc - Logical ring context (LRC) and submission ring object
>    */


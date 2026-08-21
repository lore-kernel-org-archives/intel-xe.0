Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8EBAC5DF87
	for <intel-xe@archiver.kernel.org>; Fri, 21 Aug 2026 10:31:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69FF210E171;
	Fri, 21 Aug 2026 10:31:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bIWC1BoR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2346410E171
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Aug 2026 10:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787308306; x=1818844306;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=DC89YTsADUHbJ9CA/9QfzlnTW7fVpks7qdiQqlcj9/k=;
 b=bIWC1BoR28YSMIPgdNcOjYxv5UfmsnooF3YQdEKAsqQyv/HvrbZRWCi4
 jzdmsfDvGCgVVvWht7vH06tKwGaSRyykCVFRtfKw7IQKsU6oOeJedZqwu
 dKVJ9GfrA+Ak7yVve4vYpZ7MSnzBjTjTTAlQGZ6NlhRheC7Bmz7/U0Pqc
 EUghzbPOGSY9ZA7t59JMtyzgxdC6CIZb+CmgHd1sWX0ke9HBh8oGqUCn6
 FZgQhJ3A7OvTcqUwSPESVokDqm8wF1Q1p4nF1d0icEZQ6Y7RFHDqIaj+L
 nBIf6GHfZqgrrzX0VD8+2PHs+d0PPo7s/FuJjcjARWterXConiz6DiyIp w==;
X-CSE-ConnectionGUID: /wszzbJaTZuUlkkJv77YCA==
X-CSE-MsgGUID: cmDBZZR8QiSTG9CleuqQ2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="88058643"
X-IronPort-AV: E=Sophos;i="6.25,234,1779174000"; d="scan'208";a="88058643"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2026 03:31:46 -0700
X-CSE-ConnectionGUID: b+7bjo3RS0eEgT67A7a7qg==
X-CSE-MsgGUID: kP+jfyGpSzuLgjikgmN6Cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,234,1779174000"; d="scan'208";a="260131568"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2026 03:31:46 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 21 Aug 2026 03:31:44 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Fri, 21 Aug 2026 03:31:44 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.0) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 21 Aug 2026 03:31:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ix9Dws62hn9FOzKri2CLK8QucKpv8raJFmkJa2OlzxqOBrnvgiw3nVUiuxUnRRIJjcYSSVX1Zxaf6T0h3X9WZR30T6quu5s7VS5/jDvdGzUydUcLKwWH8pj1irEe/mUUK6JaVmB2WVdm/LrU5kbZq7NTWWhKRxb34Y6FjxvhXACuTuJzAQT3938lPmUg4itML4UPlQYNnG/6rBzPTTUt0va5EkUfhV7IHxwkDKvG8uGIuiTz5YUTxicQW9F+94EYvsvaW/EZi10lb64pXo02LoaZqJrY1KWlTPaCW4YKOP2OFNOrnZ0pn7rqda/x6T4Xsb9ODK5LvhS7r4hvFgIb4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g9+3N3qUEDR9bXoxO89wAFW3Td/3WnmeubA1qYNR87M=;
 b=V9e2+6463fn0AeujyZ7Aqod8xGkiZKI/zJ0gQzJqXNqXeKLarZkzr+FT26g+Gnt7vqIctChRClBnru+IkcRtUoet54OScNzdOKx3xrDj3BDjB3f7iXm/Ms6QKHALI29VZklzkyBhgkBp2CcFgJEO876iPirzyR6cnApZQpAQTVOA/58yjip8Ts/I21DY2v9GpirZn217ZsweWZAtyTdd/2aU0LJpgewc95zvJ/F5dqMlqkqVZnSXY1uPoK+E/zxASTLkMq6OxhgqVczZVgiCR36BCltaldhFsY7DAXMuFkWSfMPQgsd3LGojV2E/3eLXBdCxC6LltyV2yWbijb0W2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by SA1PR11MB9875.namprd11.prod.outlook.com (2603:10b6:806:4da::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Fri, 21 Aug
 2026 10:31:41 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0339.008; Fri, 21 Aug 2026
 10:31:41 +0000
Message-ID: <33219f13-8ee4-4042-b85b-419cfd932508@intel.com>
Date: Fri, 21 Aug 2026 12:31:37 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 6/7] drm/xe/vf: Add bounds checking for queried VRAM
 size
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20260812124313.1377582-9-satyanarayana.k.v.p@intel.com>
 <20260812124313.1377582-15-satyanarayana.k.v.p@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260812124313.1377582-15-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P189CA0009.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d7::13) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|SA1PR11MB9875:EE_
X-MS-Office365-Filtering-Correlation-Id: 91489963-3e1e-4f78-36a0-08deff6f6381
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|10067099003|4143699003|11063799006|56012099006|3023799007|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: PE8awqPbKWpvS2J8k8YxEeNtiiYJNIGezs8cqbf4U+2SwEPpeDzlipCr3wHs4QIpjRVd2ioRR4neBGm9Hojl2SiWrbFOXMnAnooiR02jFE5Lfx1CN/ucgAiHjiu+wTcQizm6ld72Krl6w7metCDHEOL01M4taa+sBq5QsHiX5TbOZ1tN5DeEPjGA4nNurzv1p7StT6IclOdkcY6h7svENE2ArTQfVDCx82LQDxaVO6HpY5mLqKPF3/m+5oUT9PmPt3w2f7wZ/NpWoyIVkCGDjQ62xfzIogsLMItNAxUSMn8qFion7IfPtJ3GtFTtm231iLKuTjf78SgdpXMzsbtgGGUFoSaShhEartwEFdlj2ma3StscOmfAGnYC9Kxslm/fSBuWkGqIJr7Zm75uOsBlISJ19Ywa65fRLgeqV9UypI1594qVa6/KwLT5th4k7LZkomp8MXyUf3PM2/xCIzw6WuMPzv7cuGasab3tszW0uduAQ35eFxJOClHyMA9w/G3WmqirxGbtButVz4EP1ze7iHlg2nDlSLK9aGsiIliuE2aoJAC9p9byvbvdPAVNpkJiCavDy3lhZdMC5UGC1rbxFcAlV84Ub9Qt1PhqhQhwj88cLq5s5sVNiHgRSr5mdgyb2b65d5mUqd67Whw/iVx00IU6lqJ98FBMzz4QldEylvk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(10067099003)(4143699003)(11063799006)(56012099006)(3023799007)(6133799003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N3hsTHFCWTVzN2pNazN3NUJjc1c5cEpxb3htRUFUZ0tMakFRQnhxZGNPdHNR?=
 =?utf-8?B?Nm1tTi9LQW9TWnNoUEZJOGpjMStoUTh0eDc1QjlWZVovTUllL1pUL1J2ek42?=
 =?utf-8?B?cnRSblpBMnVIeTgyMGxrQ0lsN09KUWErVDYwdDNwZmFNOVFkbldyOHA0U2Vs?=
 =?utf-8?B?SUo3R21UaUF0a3IxYUY3MWlVYWNGajVmUUJaTDlRVWUrMVE2bEpzVEc5RnM2?=
 =?utf-8?B?eHkwYTBDeHVXdjk4ZHFBSjFBMEJSanNWbDBsWnI2N2xIQVp0ME9sYURobHFi?=
 =?utf-8?B?VklUUGxtOTlKV28zU0xoNmhiaWc0WXIxZlVkYVlmWk9XVmdkaklQQjB4eHFh?=
 =?utf-8?B?VU96MHpiR3FIUlExUXdyR2lRQ3ByUXVHOFZ3U05iYkV5YW04aWVsQTB3ZHZ3?=
 =?utf-8?B?NFloYUtnTW05QjNhOFZGTmJwNGxVTzAwaktSQ3BSS2dCc0hHTTduaGJIbVl4?=
 =?utf-8?B?b1BqRUtrUVNyaFVSZHRDYmRraUxhQ2xMVkttZ1RmK0xVTVl2NHgyWEN0Z3Rj?=
 =?utf-8?B?eVJhRUhWdzdvNUdxd3JRZmtUZ3YrWm9VWldLbW1ZT0FoTXBoTmtTWEZvWUk0?=
 =?utf-8?B?SldwV3NpVkRDa2NEbFFsTVRnbGdrVmdieG1jQ2phQ1pwR2FFV0JraXlRZDlL?=
 =?utf-8?B?aDk1c29YelhQMXpLSno0RDg3VHM0U3pIelFPTkxMZWVVRjBEL1FFZENlZ3hu?=
 =?utf-8?B?VEdQd0VTVnlpa0xOT01yWCtiWEtqeFA0bE0yMXlQS214ZkFnZ1VYNEtNbS9Q?=
 =?utf-8?B?S2VBdFJxRTFab1piNGpVMkhsVjFBNFFibzhIWmdSOTZrWlJQc1lhMHBxY1p1?=
 =?utf-8?B?cElEdlpZbFNRWUpQWDZteVhNc1hNRnlOUWVuU1AreXhBcXRvcm0zMWVZWlYx?=
 =?utf-8?B?aVNQMVIxNkZWOFM5VnowRCtZZXp3UHZ4ZDFOQWYvMnQ1c3UvR2dIVUdsR21r?=
 =?utf-8?B?cDh0ZXdRbkxDeEpuSXBZd3lHSHRqUnFYR3lWWG44bi9qNlFHbWFnTmlUWjQx?=
 =?utf-8?B?bzQ1Nis2WEdpMDBoWkUvVEpycHk0RUN2VXBaUW1UTmxJKzF5LzVZT0xpbTV5?=
 =?utf-8?B?dVdrbUdHZ2lWMjNsWHBkRjRaN3VmeGh3aDdKcFoxWjNlbGU0UFpRaFFoL2xU?=
 =?utf-8?B?MVFnSitleVB1OGs2QUhVTHg4cytFMEgzQjZqTFQ3cFJOR3dudnc5b2E1YXR2?=
 =?utf-8?B?VXJwcnhRS2RGdzc3U1ZBRkhydGVSakQrNmdDREhReFhDQjl5Ukt5cFZCblhM?=
 =?utf-8?B?dnlPd2FUdGFoeTBWVy9zT1JhSFBrMnhzU05EQjRzYi9iMlhjY0lRUW9wTzlT?=
 =?utf-8?B?aVpxSld0aTlOYkhFRjhQcDlodWx3NzVzQys5cEc5MXdmM0xYTjhZaC9rQkFV?=
 =?utf-8?B?Zy9FbHdVREg2Y0FwZDEvTUd5VlV2bXZYODNDZGNoakg0aldGMmNjQjBGTmUx?=
 =?utf-8?B?V00rSXBIdE9MaVM3MElVT291OTVITnAwMEVLL1JWVHJ2NyswN2dXTGc0Ynd4?=
 =?utf-8?B?TVNqM1dsVGR1dmJxdkMrRU5oVy9kZ0JlMDlZOTFEMzBJWUV5S1V5eGp3c295?=
 =?utf-8?B?bkcrY3RFS3lxSHdHNUEwVHdOY2lJSGdIcHV2alRLaEJubkh5ZFVXRFZ4c2Jm?=
 =?utf-8?B?Z2RtR0NIcmpYRjRCWXU2a3BVWVRjSmJiQitzWlM0TTU2TUFZcERra1g2QWxN?=
 =?utf-8?B?UGg3U2RmOEZMelZmOGFhZXpSRFN3aVRTYkNTcXdhZWpQcVV6NkQ4YlgyOEJi?=
 =?utf-8?B?YTgyNzNjcmRvd1V4bWcxTkZDdFlVWnNqSkE2RUg0V3pGaW9Fc3Q1REx5ZDFL?=
 =?utf-8?B?UHdLR3JndkV2cktmUGtzK2dnemVMTmkzbmgzckI2ZkFkQ0Z6UGpqN1ZGVlUz?=
 =?utf-8?B?REdnNjZwdlU4YTN3Z0ptNmRnNFNDV2cwMzlhcEdBVEpWMmFIZE5zcFJwTW5J?=
 =?utf-8?B?WnV5LzZWaHVBdmhuaVU3SEpmeG5CSlFHVnFGTmlZTW5CV0p6clUrazZhUnJh?=
 =?utf-8?B?Y2xha3NXTzUybkJZdGJYU2kvVkZiR0kxVG11aGNtY1RRSktyWEt3K210M2Ra?=
 =?utf-8?B?NmtrL2hoakVZSHRhUndQd09DUE9Rdll2Unl2VG5kbzlQd0o3OERaazErcnha?=
 =?utf-8?B?VVhMM3BsZDFGZFJQa01pcWFaN0FHWDkraXE3RVdDQ0JzcHNDZWVNQ2poUGpa?=
 =?utf-8?B?UVlWc1ZRNUptVW5TTk5LWnJtbkM5RDlhYU5TYjIveVlSeDRwQ05jOFM1UUhB?=
 =?utf-8?B?dy9SMmV4ek1Cb2NwMW5hU0JNSUtybEZoUkNiVG5LVHp2RDFGbWhma2JDYnNE?=
 =?utf-8?B?cXBFaWs3MTVubGZBclVvUVY1WGcrcGlVeVdCSGJkclNWNStqVStQUTRocjMz?=
 =?utf-8?Q?G6y/l0uiUlFve5hU=3D?=
X-Exchange-RoutingPolicyChecked: fb2ccPsh4FeJBvgahECavxe54Md1Y2mfHOU8Xqr+v4CKcLhZcMfZAOTP3b560sNimV5reEho7GzhFvTPQJPgdSZEciRPyq+fnJlCF0QnzF654aRIyl/K16bUMiDOAyfo+t3VJ1XDyazI/z36wCIyr51D22/ghg6rOrs/CJ/I5g6I7Ee2D20EuAKZ+lqQS0anLYqTJZ6FvhAtOgSRRKClYCvxQrLjTUh51ncCqPhCScWebIdEuPd6/jL15otbsBf/HH0e+hsNWAfY8Fn2ySJG0wkUzX7Vo+onl5V6RZtvRbRjPDE2wO8yzk3J79q/bzx/ehdQ+F9ZWWlGYMp2ztJrTA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 91489963-3e1e-4f78-36a0-08deff6f6381
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 10:31:41.2858 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UB7xFOHhijupGj11zT6yqfnofSPUickQEcpv/EeQBXATVLslLbrrcxgsD2DiFftu5HNAud2LT75SSzFS8m6F2TBgj1owlr5iix3LW/wpN2Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB9875
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



On 8/12/2026 2:43 PM, Satyanarayana K V P wrote:
> Add explicit bounds checks for VRAM size which can detect and reject
> invalid configuration data from a misconfigured or malfunctioning PF,
> preventing protocol violations and protecting VF initialization.
> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>

as Sashiko pointed out, update commit subject/message
with that fixed,

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

> ---
> V5 -> V6:
> - Return -EINVAL for unaligned LMEM size (Michal W).
> 
> V4 -> V5:
> - New commit.
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index d805c064377c..be932ebe6a8d 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -574,6 +574,12 @@ static int vf_get_lmem_info(struct xe_gt *gt)
>  		return -EREMCHG;
>  	}
>  
> +	if (!IS_ALIGNED(size, SZ_2M)) {
> +		xe_gt_sriov_err(gt, "Unaligned LMEM size %llu, expected %llu\n",
> +				size, ALIGN(size, SZ_2M));
> +		return -EINVAL;
> +	}
> +
>  	string_get_size(size, 1, STRING_UNITS_2, size_str, sizeof(size_str));
>  	xe_gt_sriov_dbg_verbose(gt, "LMEM %lluM %s\n", size / SZ_1M, size_str);
>  


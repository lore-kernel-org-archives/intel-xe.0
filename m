Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BE53CAC5B8
	for <intel-xe@archiver.kernel.org>; Mon,  6 Oct 2025 14:17:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8C1B10E0E8;
	Mon,  6 Oct 2025 14:17:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jz7DtxNu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38ABC10E0E8
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Oct 2025 14:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759760234; x=1791296234;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=cYN132pWFAhQGpaH/6NSzIVnaaBAyddeOcVOgeMNyoU=;
 b=Jz7DtxNuYMqRQ762UBr2Nwuvr398dURou+fWljcTjWXdeM8MvQeNDVKh
 hZMx8lvG5/Vr4eiPRHUy1tQmb+aPQpyHtqQl/bEuHoytzH1Ipt4naDCfW
 QQQyQsvifxj8LknHTXIlYm7NHavN2Knq3H3G+5edgZ+OmummMlgstV779
 xb6uydl5nJkKppX+wa6lJVDbmOLIzwRonCyYrAB23TbPibbml4RtYZ40t
 9O9m7GxUYKuulBcQvaM1TKHohHPUyT9GONxdPn/Dif8MaCucW88VG3rpm
 9yKMq8eDC4tSKUYz6PAldDwsKdDXlIa7VpXeKmjIHFD9UozdKjoQHGy5g Q==;
X-CSE-ConnectionGUID: IRZi/w33S7CaWAqr3TITrg==
X-CSE-MsgGUID: wFE+dqUUT0Ob6PztaREtog==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="65763416"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="65763416"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 07:17:13 -0700
X-CSE-ConnectionGUID: T/YrqUkSQAuzRvvjWkfAuw==
X-CSE-MsgGUID: phTteTEHQLOAFAshsogRzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,320,1751266800"; d="scan'208";a="210859219"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 07:17:13 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 6 Oct 2025 07:17:12 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 6 Oct 2025 07:17:12 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.46)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 6 Oct 2025 07:17:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BIftN1m+A40ULdKLJiaPLdndnX7Rct/kOh4QIURM8sfHVZr7zNbNm31bbRDDlqH/zj8PbwFWySYZgs7BktuIPXqj0Kv2SaHehiufA4d3TiQjYbUkpnin0gg2L4d/Ow58qYxoy3Qv36m3NUMq7y1D0pzStanNF/SnETfFfbPlf/04SBP32K4uOWoRn9f8aBJj9GPt8JeukTxgONyM4ObHCBCAAt4+35obj+WX8F2l/IURR05tbGn2L5GoCZ2ofNoWwALcnQgd46mLgxiaXnsDbhqIf6+wh/oeBTcV4gJH2V250H5tbcM3wphMxPoqJ0emrpq7FnOtGCXF8GKULkpHhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iduTYdbnI1T0IF8YLX3B/fibl2M+RhQQeaVsfpFeD/4=;
 b=v+mM4aPfZugkV9fMCQ31mnyDOSM0v8XH4D8wI8mEGabxUpOpkoqAgvO6YQ0e3ylawvs3CtqI8J+iGoaRxzR/d5ia0TQYOZxyIzI9tNtx70kBXTjT0OIoL+SfVIBI0yp6ChK9l9CwEsopO2iuMSjbWCd/orvJnwTq2vK2/Y0W+jFDwemP1g21kjR3aQhFsfT11FU9yxvMeMbAuX/DXOYMBC5YfXYKFgw3BjPfDgFfLYETjp2xtanx1uEzINyvUdnwRxXOMp7UaT3+XHBT20ArczWA8R5fOxYLEFHkWg7XvJiGwEjHM3lWacQ5s77+W7uZpjuA/MTolpUZTNJaaUfahA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9226.namprd11.prod.outlook.com (2603:10b6:208:574::13)
 by DS4PPF2D9C959A2.namprd11.prod.outlook.com (2603:10b6:f:fc02::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.19; Mon, 6 Oct
 2025 14:17:10 +0000
Received: from IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09]) by IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09%6]) with mapi id 15.20.9137.018; Mon, 6 Oct 2025
 14:17:10 +0000
Message-ID: <1d886126-fcbc-4e30-ba4b-1d967141a758@intel.com>
Date: Mon, 6 Oct 2025 16:17:06 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/30] drm/xe: Add NULL checks to scratch LRC allocation
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20251006104445.2210624-1-matthew.brost@intel.com>
 <20251006104445.2210624-2-matthew.brost@intel.com>
Content-Language: en-US
From: "Lis, Tomasz" <tomasz.lis@intel.com>
In-Reply-To: <20251006104445.2210624-2-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR07CA0269.eurprd07.prod.outlook.com
 (2603:10a6:803:b4::36) To IA3PR11MB9226.namprd11.prod.outlook.com
 (2603:10b6:208:574::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9226:EE_|DS4PPF2D9C959A2:EE_
X-MS-Office365-Filtering-Correlation-Id: 2dd2f079-47a1-4411-fca6-08de04e30996
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VkJyeWNsSWp3dlJPZk9KREdza1lHZUNub0Y3allQalhyUzNQT29wNW5KU2Ir?=
 =?utf-8?B?WEo5ZzlHSUxQeVB0bldwOXJDVUhhT1crV3c4UXkralBBb20zMHd3c213cXJQ?=
 =?utf-8?B?Qk4xZmZLUUJnZ3Q4Z1JlYUY4VjluYzVNZmhDeWZIM2xDeThDdGpTV25wOXRJ?=
 =?utf-8?B?eHQzaTN2S2tTUWZzQWFLb2JFdGNpZVZJd3p4ZnRvWDZ4QU5Ea015Mm1pbUp4?=
 =?utf-8?B?MHA5V0lIRkQ4VjJTOTV5RG43bjNndEdVcnIvYmtmSmdxbXhqK0pRTnp0bnBx?=
 =?utf-8?B?bjNCcHE5WFppdXR2Q1JoamRlRDExTVZGeThYUlpaanBmRHlBeG80YWJ6dTVX?=
 =?utf-8?B?VUlYWi9ZVWRaSDNiTTFzTm14V3ZXVzVxRGxma1UzZFdsT3VJVzRTRWFIUWdv?=
 =?utf-8?B?RVJvQkVhMFh2dzM5VDA3TU00dWVheXFPVnU3c0hkUi9QZVpDd3VYZ3QzTDZN?=
 =?utf-8?B?MXBubkZaNTFwU0NKeWRIOXRKQ1FsWk9URnVEbWF0WmttWDd6VzJIajdPQ2hF?=
 =?utf-8?B?THcxMjRaTHI5R3dSOFQ2NkIyODYwa3Z2bVZEWFJTL0NKcG9ocEMvcDMvOTdy?=
 =?utf-8?B?dmhseXlKaFZwYXU3RFJmNE1aRnlSSktJeFh2UXVwZ2dXWEZQT0VXdXVaVDVh?=
 =?utf-8?B?WDZHdXYzYmlsTGZScW96ZE9WbXlkR3NaYUlBMm0yZkk5S2NCbHNhRnE3TjNn?=
 =?utf-8?B?RlY3UWpsSTlKb3BjMHJnb2w1cVFOMjY4MXFEWW1WWTBZK281VUl0em1XdDlu?=
 =?utf-8?B?S2d4bDdWVGsvTEJYSWtPeC93UVVaZVJQV2MwUHRlelZ1SzlYeHcrN3hFbGZm?=
 =?utf-8?B?RkFRTnVuVFRZSGd3anljMGd2VDI0OWd5bjlKQXdRM20rOUZ1UlRNcjB3eGI3?=
 =?utf-8?B?N1dHWklYUys1NEpVR2NLOEhkQURvczZwanpjYklCVS9JYTAwK2t4YUR1Wm1p?=
 =?utf-8?B?WTdIR0RRYXJCdUFVVmhBVHhpb1JjVXRzT2tJZGtiVzVwbFRUWTh2SWJRTzNZ?=
 =?utf-8?B?Qmg2MnBkMDQwUFJSdkltK1ZRRkI0R0ZicUlWVUUwVnVJb2NMNlpjNHZOcG5n?=
 =?utf-8?B?Y2dPZFFtV2djdUNwWHVnOUZ3M0dmZFl2cEcvcHhjbS9NUGhNYkh2YXZSM21Y?=
 =?utf-8?B?dHJHOEk1MTNBRGpQbmdZWTJkQ1hHeTh6ckg3WVhrZzFOWnIrMXd0NHRrbEs1?=
 =?utf-8?B?dDJrR1NGSHhIVmtIbHdmWC9mcTZBY0ovZTZRVExZbnR2TDdPRm95V3RIV3Fv?=
 =?utf-8?B?a1B3WW5NV2JtS0tmTTFIanR5ZDkvWkozc3NsemZIN05wR21TMDJBRUFpelJK?=
 =?utf-8?B?TmVoYnJscEJJL3Urc1FjVWpQQWhHd05QMXVGTmRwbEdranBkMTVFMXc1QzZ5?=
 =?utf-8?B?SnBQeDBLVGh0MjBWbUtFZ1NYTGlITTlJRnBrRDZGN1kxYWFBZjdkTnptTmtW?=
 =?utf-8?B?MGJ6cVZkWWx5c1VvTjNwYUxqM2cySmZCclduUEdseVFaVG5lTzUzeXJQMjA5?=
 =?utf-8?B?aTRJV3g2cHZZZEVaMm50UGwxdkxWbFdYS2MwTi9LbE0yd05CdzN3NU82eW5n?=
 =?utf-8?B?RkRoMitmUkhpL1hYU0FtRjIwU0VRZ05YTUZod3FCZW44NHYxdGlaT3FtSmNU?=
 =?utf-8?B?SFhpL0VjczQxSFZxUDh4MUg3VjRMblZMcTVnMGNnUXNpaytFNWJwZDk1c2Zl?=
 =?utf-8?B?bVpRWG1KK09QczNzSll0T3lXb1VtS0syR1J2aTVSV3ZHanowYmxmRTEwSmRY?=
 =?utf-8?B?RkdyM2Q5SDJQdFVieHNnRFFKWHAxVytscWR0dFNSa3VOK2ZtaE9kcXArVGtT?=
 =?utf-8?B?NEl3eVpqMXdwRk9jZi9HVHFFOVQwYjBkek5jclN1MkRzVUo1V3lVUE9ic21Y?=
 =?utf-8?B?M1RVOG95dFg5ektmTDQrWXAvMi9TRlA1ekNtcHVtVVBadi9JcENHdVN1RkNC?=
 =?utf-8?Q?v7wAYA74yAaAK5Ebop1k1f1WVb8+3lVv?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9226.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Qkg1Wmh5Rk5YVzliYUtXK2lQNUlrc2hDWGJudUxtWEsxL1RvbjZLUjQrU29X?=
 =?utf-8?B?T1lyTUk2RGx4VEE0dW1SMTZhU1JoZzRkNCtsRGh2ZGs2WGJVTHZlOGduTitM?=
 =?utf-8?B?Sk4zcnZNWEdQTVdoWmhacnVxZGZPYTlUdG4yMWc0OUZHU2toSHRmNGxVRzJV?=
 =?utf-8?B?ZW9HcHdXbjN4dmpFc3RvL0t4SjJ3NXJ1dVEyL1NaQjJ1aFhQQVpnc0tXOEgy?=
 =?utf-8?B?QVU3YXNpd3NOMWxnd3l3SE1DVHJlb3VtZTJOVXBZalp6S3RoSWZLZXBjaTRC?=
 =?utf-8?B?MjVUUUt6NmcxL1hnS2ZVVzF5OVBmWldQNFZEOE5ERUFGQWl3TVAycWxvckxr?=
 =?utf-8?B?Q0M0YU43YjdwSHI3YkszRTQycGdlQjI2UEp3R0lraHJQNlhpV2U3Smd3TjVw?=
 =?utf-8?B?cUFYT05YVFFScnpMNXZPbjVrM21uVVluZTN4SHNsWGdoNEZqNzA5a01pRXpT?=
 =?utf-8?B?TkwvNGN4bS9WYm44Q0xmYkRrbnFoL0lVd21BbWF5bDllTlIxL3ZsdWJTVklQ?=
 =?utf-8?B?RVI0QUdNSWYvdElCZ2F1OERPT2xoNHRTSVpEUitCUmFjQWZEd2s4eGNJVnpQ?=
 =?utf-8?B?cnBjclIvN2JoUk9ZV0NlSDlDQSt6NXp0K2ZRUzJjSm8rL2tsZEpRU3JWOGpR?=
 =?utf-8?B?cFRSRFpERm5HazlMS01kd0hWem1VRDJ0K3NnV2xXbnZ0a2drTG0zb3c5T2xK?=
 =?utf-8?B?Mlg1WjFyMVNWUksyRkRXdmxnc2QvNE1ISWpiK2RhQkgyTlZ0c25pYnZMRXhC?=
 =?utf-8?B?TkNaWVkvem9wRW5sS3NPeUFWM2dqNjFxd1RxazlhY0c4K3JXVms2SjNWaDBC?=
 =?utf-8?B?aklROGZVd1VxQVkwSkd1MUhCZmgwMG1FTjdpcDErcmN3a3VjRGNaUDBFM3R0?=
 =?utf-8?B?WVRRdFVVWDlCMzZNL0I5dmcxM0VtVzRPbEVwLzBzOFNCeGpjTEtRUEllc1k4?=
 =?utf-8?B?V0xuSTdPdUhaMldINitxRTBZMFRyeXZTckFVUUVEMkp6VTIxeWpna3JrUlF0?=
 =?utf-8?B?WmxFUHVGcXAwcDBGbm4vaWtPK3FBWW1XTmVZT3VnOHFEWHRyYUQ0Y3VEbUxS?=
 =?utf-8?B?ckdFazkxR2c0OFYrSk1Zbkc4akwxM1NnT2JCeWhNb1RZUzYxeG5kdm5aRW13?=
 =?utf-8?B?ZkFjQUVTTXRTSnVya0tKLzVsam1QWkFvSE9oYlJHV1V0OERTMW5jV01sNlhK?=
 =?utf-8?B?ZmdaNXBUQWZnL0hDNWJxbWRhOTFZdDNYbFFlTGQyVXpzYUNHVzgvZkNNd2Vw?=
 =?utf-8?B?Zmh5TngwU2t5UVRuaEh0SmtWd3ZVbGVRbkwwb3VjNDNGUVdzRGZ6d1FxMDZu?=
 =?utf-8?B?Q0dURHgvYTJpOVlsNnI0emJ2bkpxSTREaEJlZkJ2MUMyQ280TkpzVzcwMDdu?=
 =?utf-8?B?MDJmT0xtMXBtZnVKUGV6aHBVVUd4di91L3dwclFnUW5CTmJnOXhDNWhXYVJI?=
 =?utf-8?B?SHI3RnVDRUxqSlpYWEpzTk9mQ3VQOGVzYkovejM4b3RxZlFGbWZsejZCdm1C?=
 =?utf-8?B?Uk45TjNkQW5lM0N6ZWx2Zi92RUplOXB5SXFQZ3pMRkZidDN0eTdlYm9jN3E5?=
 =?utf-8?B?OVpzVms3QXU4S0wzWXlqR2YrUW5TVllmNC9ORVRZSXp0Tk84UXZJSnpOMlVI?=
 =?utf-8?B?VStSM0R6dElOdG5SdUllSm9yeEVCWVNaRGI5QzF6UzEwVFg1UGh5RTdXdFhF?=
 =?utf-8?B?N3VMVXAwRG9DQndGSXBPVVJzdnJTNkJvS0lucUtGZmJGQXBOUytlVTRFekgz?=
 =?utf-8?B?ZUprYWVGU3gwUDJuM3NZSkNlTnFqRlRYMHBFOXM2bytjZmtPa1ZlQ2R2VWF6?=
 =?utf-8?B?NjkwWTJTb2lRZlc1Yzl0czlYUlZmTnVVbk9mNmdzeVA2ckJLclFGdVFQRmhn?=
 =?utf-8?B?WDJmWDB5bm56Y3pFdms4RzkxdkZjYS81dmw5d3FObndjdjlXVFRUSEt3MHJ3?=
 =?utf-8?B?a0VPZG5zZVZjYTRIWDVuTGZraWxLaHE0QWFoTlhtN2FZbVVqbWtuUGwrU29x?=
 =?utf-8?B?SWE3VVNPeDMxcEVua0lsdnlZVGNadmEwSEl6Z2habGFwTGxYRVJadzFmdWhO?=
 =?utf-8?B?NDRaRytsN1RPajd2dnk2alpMaUNOT1MzRVZBRFZaTmxNNXl3ekVLUDVwRlg5?=
 =?utf-8?Q?dGCPzvemz4PV0mwsJqDXrt+4m?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dd2f079-47a1-4411-fca6-08de04e30996
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9226.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2025 14:17:10.0320 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 02wh3D/mYnuMpDOvfkLxBuFFVYRuC/R9SpAaIs5KN7EXSuO/mVE080y0heNBvow6g2p0KaAXV69/McQiMzXOlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF2D9C959A2
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


On 10/6/2025 12:44 PM, Matthew Brost wrote:
> kmalloc can fail, the returned value must have a NULL check. This should
> be immediately after kmalloc for clarity.
>
> v5:
>   - Assert state->buffer in setup_bo if buffer is iomem (Tomasz)

Reviewed-by: Tomasz Lis <tomasz.lis@intel.com>

-Tomasz

> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_lrc.c | 13 +++++++++----
>   1 file changed, 9 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index 47e9df775072..9feca10837b0 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -1214,8 +1214,7 @@ static int setup_bo(struct bo_setup_state *state)
>   	ssize_t remain;
>   
>   	if (state->lrc->bo->vmap.is_iomem) {
> -		if (!state->buffer)
> -			return -ENOMEM;
> +		xe_gt_assert(state->hwe->gt, state->buffer);
>   		state->ptr = state->buffer;
>   	} else {
>   		state->ptr = state->lrc->bo->vmap.vaddr + state->offset;
> @@ -1303,8 +1302,11 @@ static int setup_wa_bb(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
>   	u32 *buf = NULL;
>   	int ret;
>   
> -	if (lrc->bo->vmap.is_iomem)
> +	if (lrc->bo->vmap.is_iomem) {
>   		buf = kmalloc(LRC_WA_BB_SIZE, GFP_KERNEL);
> +		if (!buf)
> +			return -ENOMEM;
> +	}
>   
>   	ret = xe_lrc_setup_wa_bb_with_scratch(lrc, hwe, buf);
>   
> @@ -1347,8 +1349,11 @@ setup_indirect_ctx(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
>   	if (xe_gt_WARN_ON(lrc->gt, !state.funcs))
>   		return 0;
>   
> -	if (lrc->bo->vmap.is_iomem)
> +	if (lrc->bo->vmap.is_iomem) {
>   		state.buffer = kmalloc(state.max_size, GFP_KERNEL);
> +		if (!state.buffer)
> +			return -ENOMEM;
> +	}
>   
>   	ret = setup_bo(&state);
>   	if (ret) {

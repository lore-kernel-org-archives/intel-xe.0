Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF515CA1013
	for <intel-xe@archiver.kernel.org>; Mon,  8 Sep 2025 10:58:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90BE310E201;
	Mon,  8 Sep 2025 10:58:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N9bo94J3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3F6710E201
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Sep 2025 10:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757329081; x=1788865081;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=AF4wOo44vDgR6d6iZ2CZNCWZDm4mxrOK+lYNhokHve4=;
 b=N9bo94J3qxlRKZrxfL+8WKLpmyE6r/OSRgDg8H5Xr4q4rvizS/jxNuKJ
 R1i3uwdXmZ3PxGKsrnm5YkGtlEEB/tkNrh2vhbVe/7yfWVD92gZ/KmF+m
 /u4+GchOoaVOBMqWFkHlCKH70pCfmb15VLARATeMgTS9MojEdrP59YhPe
 oiPvvBAN5yz1Ak4Fpt6BPJWU+bYTu6Cq00ITbBvIgqNncHottjwQaAY7w
 ku+z3GCROl7A8ILGPwF2L4Bjrnu7Mw4vMyXa1N7Xvq/H/XsiVNB+DO38h
 e/I8N6Er8APHhr408ds6VM5K2K370Dg8HLRJ5yfNeJjjx1qYRGjupcnPm g==;
X-CSE-ConnectionGUID: wdaj656iRmWph0EnHWvIKg==
X-CSE-MsgGUID: G0K2jv+9Sx+vdy5LH4IFKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11546"; a="59691117"
X-IronPort-AV: E=Sophos;i="6.18,248,1751266800"; d="scan'208";a="59691117"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2025 03:58:00 -0700
X-CSE-ConnectionGUID: sFoB5wpQS+GQ5A7PPx28SA==
X-CSE-MsgGUID: C6PcnexvSayS9y2Ms9z5DA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,248,1751266800"; d="scan'208";a="172636527"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2025 03:58:00 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 8 Sep 2025 03:57:59 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 8 Sep 2025 03:57:59 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.75) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 8 Sep 2025 03:57:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Re370/EihUrwsPzYprlr+y6R+Qs9HBJYU6u/0tYkjkVNJ5zDWpCu50Zk+S3sWO4nfsozVwlyRGcOSQFx5tw2VeEYq8RZAmRsnPWxemSXMWkO28RgXlU5jsKNc2P4UGlNwfmPlhooYCBaZQ4fxNEkVCAoLh3lTsc3IgWgluwtiRK6F1nFDf78DsRCIM6k1aKv38wd0nVpWMUqq47/evxWe2z6eDcFBdiiPh2zrv8jO/D+6dPDJ4idD2FFvny3NCzgmE5nmVRg/fB8JUBV3kywUf07cJfFm379hzdEm/z9+cHoI/SXMgnLj6Xr/hh64vNSJF46cJytxUaJQ1twi4+GpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/huWtuGIfLW2/iP8jLtVovAy+025YimZSvPJ7HYOpeY=;
 b=Gi3SDL/q5GFGoWV+JtDwW+QkQyyccAXoNaXdfNm74Ts2cjBBdrOOW52HEXcwJu2Bc/gO5u9WbBDpmhM0qnpmLJ+wKxqOP8ZHmWEmYBx4Z2PjaJWcnOf3JlWQ7o1U5nQHtvNb/puXNU/66GwJb721Q8AsmPMKIgPs+0OYOMs4d/p8X/WhV6yDArCAIXaam8OBpGTSEeNRvVbsXYbc18XSIGar+9fu/GNvJdgYCWosT69NxADgsDjQnrUYP6Vf7BspYjFH0n5kwSzQ8wLGF9JPWQQYEou5Et6dsrPM7cXfX/7WvB0W+USISeJU2Ww0q+dnxmm3E92wlf8RasBTooKIHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8695.namprd11.prod.outlook.com (2603:10b6:408:211::15)
 by IA1PR11MB7727.namprd11.prod.outlook.com (2603:10b6:208:3f1::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.19; Mon, 8 Sep
 2025 10:57:57 +0000
Received: from LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541]) by LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541%2]) with mapi id 15.20.9094.018; Mon, 8 Sep 2025
 10:57:57 +0000
Message-ID: <2d7c2a72-2589-4e82-8aca-1c239711391e@intel.com>
Date: Mon, 8 Sep 2025 16:27:49 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe/guc: Don't invoke disable_ct action during
 replacement
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>
References: <20250908102053.539-1-michal.wajdeczko@intel.com>
 <20250908102053.539-3-michal.wajdeczko@intel.com>
Content-Language: en-US
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
In-Reply-To: <20250908102053.539-3-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN4P287CA0008.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:26a::9) To LV3PR11MB8695.namprd11.prod.outlook.com
 (2603:10b6:408:211::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8695:EE_|IA1PR11MB7727:EE_
X-MS-Office365-Filtering-Correlation-Id: 970fce1f-d1b6-4dd9-724f-08ddeec69175
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZUUxOUJ0aXFVd1dmNW15YXhtQkorcllZNEM0Nm5NY0EybXd1M0pqWUxndUk5?=
 =?utf-8?B?MFFHeXVXNkI1YnpWSkJvcUNLMS9PbjBqdDRuN1U5YW1EYkhtdWxGLzVpc0RB?=
 =?utf-8?B?QU1mSUFVK2hNNEF0Q2hjRCs0S1B3MElOTlArOUgvaWNBNXp2WUZ5dDJNNEtw?=
 =?utf-8?B?Yk96VFFJcElSRS9aOXd0Tm9xa2hpMTNzdEE3c0piMmF3OHh0bUczUzVBbmY1?=
 =?utf-8?B?VkQ1dVl5T0EyazFjMkRaUWlwQ1JONGZhN1VLaEcvcS9BdUgrZEhZWXlTSHBJ?=
 =?utf-8?B?S1pMNE9wbERsTDhQUk8zS1M5RmRZRjkyaGp2aWlsVWtFWnowb2JVZkFSN0lh?=
 =?utf-8?B?YnJJQTE4YXNoZzdaODYwUlE3SmdKLzgwdWhiYmNlbDdZTHgrWDA0YzZUUS82?=
 =?utf-8?B?N3piWHNwbkpxajNoSFp0RGwvRVQxK2xIZTdjZ0JVdTd6aGNndWV2U1NRN0Zx?=
 =?utf-8?B?bUFxUG1Jd1Y4K2FwWWpBcTEwWTF0NDV3VTI5elR1azlYdytoZFFlSUxrbEIv?=
 =?utf-8?B?MVo3MDh6dExPaWk2a2d2eTE1ZG5uSFlIVzZLcEMrRzgxbmdDZmh4SmxvTElQ?=
 =?utf-8?B?aU5uM1BvWXBrQnRSRnhqcDRGRVJlNFEvZGxnRlBDb3hwNDFTTFhXdDB2VnM0?=
 =?utf-8?B?dHEwajV5NVpzWnZZOTkyS29BWC9JMTBqOTFYYmRyK0dXTnpRUW5yaWpvV05M?=
 =?utf-8?B?VUlTVXVId3ppUmV5WUZsVEVQenlBbXA1SWRUNTB2OWVIWlpjM2hWNEdUbDRV?=
 =?utf-8?B?TlpZajZodW8wbHVCNzdPRWpOVkY2ZmhnQXJmR2JBQStsd3RTa3lBL0k0NGZK?=
 =?utf-8?B?Y2tQYUFUU2lMb21RblV1aXVlRUk3R2ZqZDVrZ0hpT2grczl1L2c1SUZZM0NC?=
 =?utf-8?B?Q2Y0Y0gvb0JwRFhYdlBJUVZtNFViZ2o4VEtVbmQ4WS9ma3AxeHkzTU5LcHpR?=
 =?utf-8?B?V1NZS3lnWTE0VFJvVisweTBhODBzQncyZDViUHkvdG8yYVBzbkVxZzM5Y2cy?=
 =?utf-8?B?ZUphM3gzbmo0SWI3MFVoZFZib2tCckdBRVBjaS9xc3RLa1pHWStrdmhrbzMw?=
 =?utf-8?B?Qlp1Qm0zbDBtQkJKVW5iRzZieEpwSHVWSmlsZ1BkNUxOYlFQMHZwOVZBSVpQ?=
 =?utf-8?B?YmFNL1poTUhJRSt6NXNFRURjeHMyNlhiU2dMdjJQZGtHZk5TREV1Yy9zTisx?=
 =?utf-8?B?cXNaVEU5WnkyaDdRZm1PUHFIa3pOL1JFUTR2OW9LeTJ0dXRKZXFaVDZYbU1P?=
 =?utf-8?B?dzdNbjFXZ1A1Z2tPQVRHREpaMmdudlV3em92V0xPZVREUU1RQlEvOEVCb0lZ?=
 =?utf-8?B?ZlJaSHZxajdydEhSdlRJcVMzQXVzM3BVTlg2THlTVUJUWnlnOUhMTHVma0Fq?=
 =?utf-8?B?UEZDRExnRE0xdVJtYUFLaFhoSFMzeHBkdnhTRnRJSm1Cbkl3ZUh2ZFRxRUIz?=
 =?utf-8?B?UnNzTEI0VG96cTd6L2gwTkRzMFZTYXlwSHZ1azBXNlc3QXlYcTdXRXBiMGQ3?=
 =?utf-8?B?QlA0QmI1aXB3VnF1cFprVUtrck9nR1V0UmxPNEhqcXUxRUhEVXpHNmtMM3E2?=
 =?utf-8?B?dkVFUUVSb3ovVHk1bEVvNW9td1VWcVIrWmlQM3JvbnZmMkxHVFVTQUhUeTRW?=
 =?utf-8?B?YVQ2bXRuS2EyV0lFQklHWDlUclR5bXdwOWlITWdSb0Q5R2JLU0xGR25aNDlV?=
 =?utf-8?B?ZXBwb0JrK3I5Q05pYWNad0wzNExBUzlRZXpIL2I2ZnZ5TEVDT1lmOU9sRjg4?=
 =?utf-8?B?WWRvbzRwT2FQemExMlpaZlFCRmV5bkZZbVZEaGhCNWVPRUFNTkdEcEpwUFhY?=
 =?utf-8?B?Y1JrTXNjTmJ6akZqN3BCU2VTV09sWkcrdzNBUVJpRDd4aU9tY0daRmFNMDBa?=
 =?utf-8?B?RnZaNHdsMVBCc2pMNCs5ai9weU16TzV4ZDZLRWxscThxTE5JaHFQU1Q0SWxw?=
 =?utf-8?Q?6HlZUZPBhxs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8695.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SEM4bnFrMmRYM29CL2doSG1EVlJYUXhZYk5ZcGp6TFF3MVVmRTVNYjliLzNn?=
 =?utf-8?B?SjB4eTgwRERlWldQRW5LOTMvM3g0ZHFXNzFlSkt5Q1lFQi84YnI4UVJSYmFa?=
 =?utf-8?B?U241aE94RjloK2gyM2I1aGhYUlJsS3RNSjNLbVVTMlM5Rk1kN2QvcCtFM3lG?=
 =?utf-8?B?dDZEUnZMeTBsTEdheVpKaCs0bXZzcWZNdTFWNzJ6Sy9VOUN6SDFPM0sxVHVk?=
 =?utf-8?B?NWJSc2piaDErZHFyTDQ1MDQ0MFZMU1NHc1d5K3J4aGtraWxyL3Z3WmJDRzVZ?=
 =?utf-8?B?RGQyQzBCcnoyYzkzRE5KS3N0d0xoM1ZqSFQ4UzlwRzlTOURrWHhGaE81NjNv?=
 =?utf-8?B?SHNENWhCTmZrWDVLWXF3T0p4ZUtUanNLeU5CSVRPb2JSSGJMRWFZdk8zZC9i?=
 =?utf-8?B?dGk2OHhnNEpmanR6UVdMRnVQcmFmYUNRSWQxVWR6TkEzZGs2SjkwOVBuTGhG?=
 =?utf-8?B?d1NVbWpSKzRLMFJ1VGVQS2J5NlJBTGkxQXVsQmN4MW1vazZTT1VHaW1sMG5W?=
 =?utf-8?B?VmZNVE9EeTI2dExEclpsdnpHSi9QbkNPQ2VkN0N6dm10U3A0VGt4Tng1UWp0?=
 =?utf-8?B?Mnp6VFd0VGdyT2Q3bTdZcUpEeUMvaW92OFN2aWJZMEpuK0RxanpHdi8zUlZK?=
 =?utf-8?B?OHd2YXVsYTMxSHBFUVBwVmJKbE50bEo5UmQ3Z0EvVG5GZEtiZVA3VDBzajB4?=
 =?utf-8?B?R3l1b2VzV3orZ3NQSDFYcVllUTZYbUxHRmJHTDF4OVRxcVgveFNPRGpsMlBS?=
 =?utf-8?B?VUJWV3YybmZGcWZWNW1OTkpHbEtqRndpbVZVc1ZYZDlpNXY5TmZsSzFGV2du?=
 =?utf-8?B?QlFTbVlEOUFFRVdkaXJZNHU5NWNlclBMck90UkYwTDBYMGU4NUEvUExUMkla?=
 =?utf-8?B?cnVNQVFKVnpVZjdHclJVSFRvTXJQYksvcE9sVUhBMk9qTHc0Nk5yV3NJYXRw?=
 =?utf-8?B?ODdzbU1FOEZCazhRVnZDRmJyTTU5ajJnaTFHSzQ1Q1hjeDNuZ2lBdE1icFRz?=
 =?utf-8?B?RkRka3YrV0VDQ25RUExrU0NtbW4xN1V1MkxpT1JBL1FEUUdMbTBxUThEaXN0?=
 =?utf-8?B?L0x5M24wRmpqd1BRcSthd2w2d1Zud1Zkdjg3YjdPT3pKNi8ybkVJcWU3RmZr?=
 =?utf-8?B?QWl3Vlpob044Ri9wTTJ2dkNjcjBqVUhCZ3g5ZmdQb0VmYkZMaGQ4dmcwRitE?=
 =?utf-8?B?MDkrZjkyOG12WG9OdTZ5QTMwMmtyT1hpV3dZT3hhelFGUHEzc09IdUlreDN1?=
 =?utf-8?B?UDA2NHRIb0tlYWFybnBBZzBSWHozTy9aSjR4TjZMbSs4bUUvUjR6eDVmcTBy?=
 =?utf-8?B?NXMzb2JGeUgxSDBMS05CYU9ZRTVKdmErRE1OOFc4c053bkpuaHhsNkQ1T1Rq?=
 =?utf-8?B?MGtCUldYZHUxRzlLcVdTZS9ML3RXVVVHdWhXRDloT2JmenlaUlo1ZFEzS00v?=
 =?utf-8?B?L285dzR5Y3pFZThWaDhYckllSmtEL1lUN05QZW1FZWtleUQvZFJHejJPRjZz?=
 =?utf-8?B?TzNENkhNaVNMVDdXQzdvc1BDRmMyVVkrRGtFL2xUMFF4T1lCeU93RXRyNlZF?=
 =?utf-8?B?T2V5a2xRVzFUbkRNRDkvZUxXeFBKLzdGNngrZ25PODJVcHBic3RUSGNWTlVB?=
 =?utf-8?B?R1cyS09DU0YraFZLTDAzK2lickNOcjU2QXVWMzNEVExEUHV5M1RaZC9ybUhj?=
 =?utf-8?B?Zno3UndzdnVkWXpJSTFXWFFWRU9CTU1ydFI1RlBDRDhjUko3NldOdFlGZDg4?=
 =?utf-8?B?V3NqZWFkdENNVTZZVWNicWoyYUl3aE9FeVV5cHBkSjhjWkt1RGwxSFptekFK?=
 =?utf-8?B?YVh4U0ZFUWRmb0lxaGNTdnZlejdmandPMnlmTEFQWUUxTThxM3dML3JFbTRB?=
 =?utf-8?B?cHdZOUFHejZ0YW5GWWc0eXgxVTFpZnhoTGlJM2J4R1VsUFNTamhOamlUWFhK?=
 =?utf-8?B?MDkzOVRCZ3QxM3p0RmZtKytsU1hXbG4yMFpJUENPUStEVXY4NlNxaVhSMDNw?=
 =?utf-8?B?aVFNcWh5UDBNWkJheGNqaUpTT1pHeEw3Y0pWMHF2Wm9YZkxmVHB4M3N6cTNw?=
 =?utf-8?B?dnRIcGlWbklrUVBTcTQyeU1MYkc2RXlKL0FQeEFZNWJvclNuclRmN3ZvLytF?=
 =?utf-8?B?VzU3S2lvSlBhSWtHV2xqdlRtVnlhS0UzWjBnWG12WEE2eWh0NFl3TjZIeTJs?=
 =?utf-8?B?Ymc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 970fce1f-d1b6-4dd9-724f-08ddeec69175
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8695.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2025 10:57:57.2075 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I00QXwT/2DGeTYDbgOXkYFfIRHK7LsCk8ISr10vHel4LjVtwMzaHI5cWhI1n+fB/VFX9IZnzpLgOGIVjomuNLeaXgq06seaY/pnuZ3VxCaU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7727
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



On 08-09-2025 15:50, Michal Wajdeczko wrote:
> During second CT initialization step, known as post_hwconfig, we
> want to replace previously registered CT disable devm action to
> make sure it will be invoked prior to releasing underlying BO.
> 
> But to replace this action we don't need to execute it right away
> since we know that CT was disabled prior to that late init step
> and we already assert that. Use devm_remove_action() instead to
> avoid extra message about 'disabling CT' that could be seen now:
> 
>   [drm:guc_ct_change_state [xe]] GT0: GuC CT communication channel disabled
>   ...
>   DEVRES REM ff11000149320940 guc_action_disable_ct (16 bytes)
>   [drm:guc_ct_change_state [xe]] GT0: GuC CT communication channel disabled
>   DEVRES ADD ff110001664fc040 guc_action_disable_ct (16 bytes)
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc_ct.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 12372d5b7067..bb8650fdeb45 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -306,7 +306,7 @@ int xe_guc_ct_init_post_hwconfig(struct xe_guc_ct *ct)
>   			return ret;
>   	}
>   
> -	devm_release_action(xe->drm.dev, guc_action_disable_ct, ct);
> +	devm_remove_action(xe->drm.dev, guc_action_disable_ct, ct);
>   	return devm_add_action_or_reset(xe->drm.dev, guc_action_disable_ct, ct);
>   }
>   
LGTM.
Reviewed-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>


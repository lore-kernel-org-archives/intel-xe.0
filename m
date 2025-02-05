Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4FF5C0219B
	for <intel-xe@archiver.kernel.org>; Wed,  5 Feb 2025 20:09:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACE8E10E3C7;
	Wed,  5 Feb 2025 20:09:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fnbuc6wC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE4FB10E3C7
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Feb 2025 20:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738786194; x=1770322194;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=VQjjyr+mi8+FfZqgqOI2D35ylLCMT8R9tobdPIMkTZc=;
 b=fnbuc6wCTpWQPcxQhyKvScPFhO26+Pr9TF9g9IhjVeyCJ2adzcC9LxjN
 QlatE9hLFa4pGqLpQ8QY57R0DFYBwWduD4HnjOaQzH9TofxRf9HZrlhNS
 imFsG2+ZAETCA1wT1qRQjMXkK/gfB7CjCTFZhv5i2QytLXZO4b5uHHRcv
 d7bJAF9NQCKr2mKhgvGCkZxi3TVst8lcYfX33zG/kFYCBPAzSHm3JSqgd
 OGGHNPSqlEqF3j0YEc4qAZJXCDM2cIeDayJGRf/1pOau//ydgKOuFzaQq
 D0HzvRFsRSjKJvZo5f0+F0nByoNCvNbUNUbQYXwaM3+kDyOp9o0FpaJML w==;
X-CSE-ConnectionGUID: fIXyGGp5R+KhLb4UstH/yg==
X-CSE-MsgGUID: AGjmFAVsQcSoQuzbNA2sOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="39483992"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="39483992"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2025 12:09:53 -0800
X-CSE-ConnectionGUID: kwRllKrDQyyCeM1CftP2FQ==
X-CSE-MsgGUID: 5LtMSmp/Q/KFHVDDB338/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,262,1732608000"; d="scan'208";a="111582175"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Feb 2025 12:09:52 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 5 Feb 2025 12:09:51 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 5 Feb 2025 12:09:51 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 5 Feb 2025 12:09:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UUhKHdA4mjBFN9hVCRe6GiryEyUePZuzvFK3zQ9IMFEjGT7d5FmyVg5bXMjk0Fk0E2dKP88T01vjIv1TuphE55dqkrMwetc/ndOLfZUSLQ7LGHCut0rjkA7Joc3gt9q+vfyhQz6iSKIPrrlDnpflEnTcSeluiPUpCP+cKpqSBK/abXvXuyDbXcVOV9NMPj+TRGhqmj5eUm8/2kn7i39ZcJE97AUBUUeyYCprxf2RzjkXmLaB7sM1+ki2fNcq3AZMMkD2mwQJftGaJMv0ZTZZxztvNRvG3y1YacrnQrz2okvlvzjGQrmvJSNxl6crFKMES9SaVRy3PRhiozyM8rEzZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZfBi8/6proBr7zW+uUVnS90RnMuxsGCBlaDBzle4lZ8=;
 b=ndJi+x7LaIUsUtYjCmRZsfaKK7z9EfokErQJ7n0lZyJUAXyYdlep035XYzmDupH9uq+xEeXhXKaGXP/BmcAeX1A/YPwCTDC23auGlvYDuO6gPtPx7yJzjuPw/9BDwDPAxo9ve9CQ5RZrG9D/nQMKP3nnt/GBhT6WulkbUxWSmAbHX+1PopdTWmrZPNoamFpUiW0D3glKDiRk7cj2ZUQq7zVD7ModYkVc2vRFo3B+pqvRJqIYOfvOotC8Blz9I0SEOAH7GwOZHyxPiNIRNg4qvsiDJNKoVcvlh5RZ2nCXo2/mhMxv/CoDu1uLgTYMmHKgC7x74YyfC30A+btgRzZoEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by CY8PR11MB7848.namprd11.prod.outlook.com (2603:10b6:930:6c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Wed, 5 Feb
 2025 20:09:32 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1%4]) with mapi id 15.20.8398.021; Wed, 5 Feb 2025
 20:09:31 +0000
Message-ID: <d99c4273-3cf8-4038-8420-64d417211c59@intel.com>
Date: Wed, 5 Feb 2025 12:09:29 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V7] drm/xe/uapi: Use hint for guc to set GT frequency
To: Tejas Upadhyay <tejas.upadhyay@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <michal.mrozek@intel.com>, <szymon.morek@intel.com>,
 <jose.souza@intel.com>, <matthew.auld@intel.com>, <rodrigo.vivi@intel.com>
References: <20250127110751.1548253-1-tejas.upadhyay@intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <20250127110751.1548253-1-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0022.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::27) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|CY8PR11MB7848:EE_
X-MS-Office365-Filtering-Correlation-Id: 454d76bd-8647-47ef-68f6-08dd46210067
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d1VJUlgvb0FINnlRS2ZXVUg5cStlQUdaOGhWYTFEV2RiRFMraEtsdTYxNDVN?=
 =?utf-8?B?K2loTU5iL2habUZwVjQ3aUpIVmxPdmpwcEIvb01QYXlyeGt5YkdRUUduV001?=
 =?utf-8?B?Zy8rMGZ5dDRMMUZOQ2V6VG9uWGdOc0E3ZzNONTVCRFVCaDlSWE1qbUYvaytr?=
 =?utf-8?B?MjdRbEpoV2FCNHRzNERaZUlqSzNSSEQwRWVtaU9tM0p6bnhQSWM2Ni9wZGRS?=
 =?utf-8?B?OHNrSllsallsV3RrbkFGdlRuNmtmek9GQXhDQ0dWOHpTSWV0ZG1GRUdkL2Z1?=
 =?utf-8?B?dC9Td2t1SWNPcE45VDRTTGFKRGJTRnVsbWNpVjluSE10RzVQU3NtUlQzN2xa?=
 =?utf-8?B?QTVReWxPdkNOSnQraCtHeWUxZmYvQmQvZDhRd2hTMUZMT2ZCMGtQam5hMklO?=
 =?utf-8?B?NzBpRE9XSjNuV3RkS3lML0xBVEN6SGxoM1Btek4ydE91YmxYTGcyZEFCWTlm?=
 =?utf-8?B?TWlDYmw0YnNGZS9uamlaaCs3Y1B5aE9wa2N5WjlQZXh2VFgxNEFxSGJscnFE?=
 =?utf-8?B?emNoWThZc0tvSGxkRUZUV2RjME5NT0lWTHpBQTFiV01sOUlRcThDMlZUSGp3?=
 =?utf-8?B?ZnJGTWtYenBQUGt3SUxLVzlaZU1QSFNCYjNVSFJycEZObGV6MnlQYXlOZHU5?=
 =?utf-8?B?L3U0Ky9ETytrTDUzOG84RTFWSFpiV3FZeXFHOUhYdndzelNVb3c5RGZoQ0tD?=
 =?utf-8?B?WURvenRVZXJESExvcEhnVGp6bmxSYjhWUkdzcHRRdEhvWFRaSUdYZWtjNFg1?=
 =?utf-8?B?SjloM3dQQUJocnhjSW9PZ1JWc25rMmEzbWlHZzRKZ1dkZXZnbWNCVEVEYUxj?=
 =?utf-8?B?emZNZzB2bFlWZ1dmRTF1Y0VwRjEyRVNSUlVmR3FQazkyZXAzejV3YzY1RkJq?=
 =?utf-8?B?ODU0ZnBTdFhQRlloWEZRTGR3V3BNUjZxTHF3U29DMnljaGlMeitZVW45aGZ6?=
 =?utf-8?B?NUZYOVdZQnpuaUVzVXlIekZNNUwxTHpMN0x3MEFJWTk5V2hpQzJZWVd2SnRv?=
 =?utf-8?B?ZGNvYVk2RVdBeXZMZStSM0IxcWRVZHh5TFdIUi9nWVhGSU1RWDVZU0tRdjJ6?=
 =?utf-8?B?bXk5NGQ0bDdRUFI2L3ljWXhONHEzbFdadW5oL09JNkE1UVVqdnovZlpITUcx?=
 =?utf-8?B?NUd6YkVxUEZFM0pXNExFMWFyNUF4RzhRREt1N21mSEUyeHFTVWxJVEx5WHB3?=
 =?utf-8?B?WUxtRnRuUnJWRzhrdldrVytBWFZSV3VPaEVZSnowVzZRWlY3cTB6VE5DeERC?=
 =?utf-8?B?WFpJSys5Nm1QV3dMV254VG43anFUTlVudC92d004WUQ5Mm1TSzYzSTU5czky?=
 =?utf-8?B?UmtXZldwTk95aXgxRUh0ZmkwbVhhWFFJRkFiZFFRZ1NPM1MwRjQ0ZS9aMkVj?=
 =?utf-8?B?elVIZzFUN3RYeWR3NDRFZ3paYjB1OVhVblMrZFNJQUxjZjY1d2Q1c2FKZ1RH?=
 =?utf-8?B?VTBhYXZnS2VWMmZXdjJIdTZGcDVJcmVNekROUmg1NkRhSE4wc09nQ0xmTFlM?=
 =?utf-8?B?UDhVQlJTaWlKRTljcHJMYWxkbGZ2N1FwaW5QTlRkWVNiblFEZWc2dlIwWnRC?=
 =?utf-8?B?YmhQb0lMaXFYckljYVVvNW9lVWZHSkpVTkhFTlJreC9heEFaY240OGhwTnEv?=
 =?utf-8?B?dGNBSHhTQkdybzdQMmtnVFYydHhzZklKMGhQM0FqY3ZFNENPTVF0YXFvYWk4?=
 =?utf-8?B?WldITmpsemZWUHB6S0lISjJEUEdMZjhtNEdHVkR1cmlpc3Qra2ZDbUx5YkQ0?=
 =?utf-8?B?V1dIL1k3WndKRGw2SWRCM2NmVHhyYStxNHdQRStJVERCdUZCQWFxdlcyNUQ4?=
 =?utf-8?B?ams0Q0s2ekgxeGpzSFdiQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UHRKV0Q3RzM3c0dMY0Z4U0dxV2NvOUVNNmFGWkhkWFJJcDlSSlZHRVp4eVNm?=
 =?utf-8?B?Z3NQbUhQbDFOWWFNWHVYRll6b2NzclBtNzM5dFpkamdZOGZHbFZZVGlhKzJX?=
 =?utf-8?B?dzFnZCsxU3V3LzJvb0lQK1lxT2Y0SFhObGp6R3BySjk1MVhjeE56bWV1V3pi?=
 =?utf-8?B?bkcyQUYzSUxvN3VKRlczbEFPOEVJa0d3dHNyMGFveGp1SXRSN0Z3YlVrc3dY?=
 =?utf-8?B?eUpZWDNlNU5OaHh1YllRYmdTQjE1RFB0ZVk3T2szNjl2UUxIUXAxeFV3d3pa?=
 =?utf-8?B?bnl0ZlUrUzFielJqQ0VEakpkT1IrK0hvOGRXblloY0FsQlloY2JrcDA4VWo4?=
 =?utf-8?B?blV1b3U2TW1wYnZ4S0IwUjhHZVJEaE5PcWw3Yi9xbnFvb1dqdWhLT0tuMGxL?=
 =?utf-8?B?WkRGRzZvV2diRVdZUHA4dzBoZmxNeUp1SXJvd25wUjJKNmg4NyttWGlXZUY3?=
 =?utf-8?B?TENtUVpYOWx2S21WcXVoaTFVUHpBOUVIY2ZwNkJJRjU4WkV6ak9lVDYwMURo?=
 =?utf-8?B?cGxYWk02QmhJalZzL051WGFwWC9PUmhGWFU1cDA1WnNISlZmc1RFdEhXUnF0?=
 =?utf-8?B?TWJHM3VIUkJONWlvWll4STFvODIzaXEveDFtV0o5Q25sN0RMdXlhV081a2xZ?=
 =?utf-8?B?WjFBbU9jRUhsS0ttZXQzM0lrTi9UcmFuNnFrWmd6TnBjUWxVY1NtVGpVdFVm?=
 =?utf-8?B?b0wyMjdPUGhnQTQwUlhKSElVaXNIUUw5TytjblJKci9zRy9YNUozWWlrQXlk?=
 =?utf-8?B?djBvOENVYVVJOXBRbmtZMENaUHNmR0xWU3dMbzRyaXFITE5LdjdyRE9SZlh3?=
 =?utf-8?B?SU9wcDl4NjQ4STVLSmRCT0VESDFwYng1N2xqb2dmclQwWWVoSmJORGNWK052?=
 =?utf-8?B?RjI2WGhNM29KQTFKZnNIcmNVbTNJRFVDOTh0U3ljQ1UzbXhIdzZuN09TbmVi?=
 =?utf-8?B?OVdyY0xqajJpOFdTUnpRUHAzRWFlbDRiS29IYWhnQmx3VVRCMExkRTZHNmxB?=
 =?utf-8?B?aUhWNjFRRjdjbEpxdno3NjRRYjJ0M0J6RkZSblAvR1VHVGRYWHAwYlZpNHRD?=
 =?utf-8?B?MW1BZmNpL29HVlhQNWJKTmhFVFFjYmo0czd1MTRLQlJyR3dXQWNWa3pUd2xX?=
 =?utf-8?B?MlBWUGNLWmd3QmxPYWh2SHZMUkY0bWtuby9RdWJoVVRZdmlCWHB4aFdYekdl?=
 =?utf-8?B?Y2VxM3o2M2dlOGRwakxJaS9MRkJlZ1dHUXFLVlhGY1dFUjlSR0pUZUtKbFpW?=
 =?utf-8?B?VWtLSG5NZzJxSUUvZ2lvcnkzSTljREFxZFZLY3RyYnZOa05hLzBzWHFpTHlY?=
 =?utf-8?B?dmJYMXpkZDVBTkdiUysyTmpjUWxuazN1VEVUK2FIdDFGNGtBbDZXRDB6RmtC?=
 =?utf-8?B?c1BXajJsYzlWby9IbE5MMXJjTUYrbjJMWXdoZHFnekhUMUZGamFBQlB5dEJt?=
 =?utf-8?B?b1pFMHpLakIvNEl5d252TFNQLzBLZmRyOWV3VG5LMDB1M3N4ay9ZZ1RiMUFO?=
 =?utf-8?B?aVlONjAyLzREdm1zMCtNSDEyVE5DaHV3cDFHRzYwVWM2K1RNRU1aUUxCTUlT?=
 =?utf-8?B?SjhHbThCR2xOU21ORWpxMnhHYTZXNGtxR3BjSHNqVS9OZ3ZDNFlxVjhMVGt2?=
 =?utf-8?B?NmY3YVA3bFpQN3IwWVZDdmcwejhJckVmOW1ta3NmSkEwWCtFT2ZBbE5vbG0w?=
 =?utf-8?B?YzNUQllFZjEzY01wdlcxOXdUUXlFeGVhdnJHaUxPZ05raCtrOG1sQTJ5Qk1V?=
 =?utf-8?B?aG5CcE1QSVRSWS9IK3JSUlUzYnpKTW1rT1o5bENHM0YxN2xiOWRqcm1XVk05?=
 =?utf-8?B?cDcyS3N1a3lvMUtrQnpYQzZCRGZoUTVuYXpkRHg3aFMrVFg4bUJ0cTJqMHM1?=
 =?utf-8?B?Z1JZV2N3U0hDMCt0TU1sK3YzODNmb1hrSmFZajhIZVpad0w2MlpNQW1rSHJO?=
 =?utf-8?B?UW5EUnpzbmMrMTB6RS8yTS9CQmNVQmprQTVMbmVnMTRuSW5NUi9uZ1RjYVAx?=
 =?utf-8?B?Wm44MTNiV2lxRWhLdFA4enE3eXliQ21OREtzWEZzTzhicDVJR0tQZTFzb0lu?=
 =?utf-8?B?SFc5WXkrZUdsSzUwUEJCaDE4azdTMHpYOU9kT3BESGtuV3ZFelMyUlNDaXlh?=
 =?utf-8?B?TUFNRE9sWEVYRjY2OUFRT0RSVzVucDdVOTAraXRKQTFzbDFYaFZGaGVJYlRh?=
 =?utf-8?B?UWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 454d76bd-8647-47ef-68f6-08dd46210067
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2025 20:09:31.3629 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tNLmnf7BWak18nWmicAaaweVllKVLvbvr9svmt9ptdFw9mvG+xcHoWaiQHTT7crQIDsCqOZ+zbpQwDGY9hC1hGwrOjDHe2YdxgkJ43XzdOc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7848
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


On 1/27/2025 3:07 AM, Tejas Upadhyay wrote:
> Allow user to provide a low latency hint. When set,
> KMD sends a hint to GuC which results in special handling for that process.
> SLPC will ramp the GT frequency aggressively every time
> it switches to this process.
s/it/GuC
>
> We need to enable the use of SLPC Compute strategy during init, but
> it will apply only to processes that set this bit during process
> creation.
>
> Improvement with this approach as below:
>
> Before,
>
> :~$ NEOReadDebugKeys=1 EnableDirectSubmission=0 clpeak --kernel-latency
> Platform: Intel(R) OpenCL Graphics
>    Device: Intel(R) Graphics [0xe20b]
>      Driver version  : 24.52.0 (Linux x64)
>      Compute units   : 160
>      Clock frequency : 2850 MHz
>      Kernel launch latency : 283.16 us
>
> After,
>
> :~$ NEOReadDebugKeys=1 EnableDirectSubmission=0 clpeak --kernel-latency
> Platform: Intel(R) OpenCL Graphics
>    Device: Intel(R) Graphics [0xe20b]
>      Driver version  : 24.52.0 (Linux x64)
>      Compute units   : 160
>      Clock frequency : 2850 MHz
>
>      Kernel launch latency : 63.38 us
>
> UMD Compute PR : https://github.com/intel/compute-runtime/pull/794
> UMD Mesa PR :  https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/33214
>
> v7(Jose):
>    - Update UMD PR
>    - applicable to all gpus
> V6:
>    - init flags, remove redundant flags check (MAuld)
> V5:
>    - Move uapi doc to documentation and GuC ABI specific change (Rodrigo)
>    - Modify logic to restrict exec queue flags (MAuld)
> V4:
>    - To make it clear, dont use exec queue word (Vinay)
>    - Correct typo in description of flag (Jose/Vinay)
>    - rename set_strategy api and replace ctx with exec queue(Vinay)
>    - Start with 0th bit to indentify user flags (Jose)
> V3:
>    - Conver user flag to kernel internal flag and use (Oak)
>    - Support query config for use to check kernel support (Jose)
>    - Dont need to take runtime pm (Vinay)
> V2:
>    - DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT 1 is already planned for other hint(Szymon)
>    - Add motivation to description (Lucas)
>
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>   Documentation/gpu/drm-uapi.rst                | 18 ++++++++++++++++++
>   drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h |  3 +++
>   drivers/gpu/drm/xe/xe_exec_queue.c            | 10 +++++++---
>   drivers/gpu/drm/xe/xe_exec_queue_types.h      |  2 ++
>   drivers/gpu/drm/xe/xe_guc_pc.c                | 16 ++++++++++++++++
>   drivers/gpu/drm/xe/xe_guc_submit.c            |  8 ++++++++
>   drivers/gpu/drm/xe/xe_query.c                 |  2 ++
>   include/uapi/drm/xe_drm.h                     |  7 ++++++-
>   8 files changed, 62 insertions(+), 4 deletions(-)
>
> diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
> index b75cc9a70d1f..234c38ef26e3 100644
> --- a/Documentation/gpu/drm-uapi.rst
> +++ b/Documentation/gpu/drm-uapi.rst
> @@ -583,3 +583,21 @@ dma-buf interoperability
>   
>   Please see Documentation/userspace-api/dma-buf-alloc-exchange.rst for
>   information on how dma-buf is integrated and exposed within DRM.
> +
> +Low latency hint by user
> +========================
> +
> +Allow users to provide a hint to kernel for cases demanding low latency profile.
> +
extra line?
> +user need to indicate low latency hint with flag while creating exec queue
"User needs"
> +as mentioned below,
> +
> +     struct drm_xe_exec_queue_create exec_queue_create = {
> +          .flags = DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT
> +          .extensions = 0,
> +          .vm_id = vm,
> +          .num_bb_per_exec = 1,
> +          .num_eng_per_bb = 1,
> +          .instances = to_user_pointer(&instance),
> +     };
> +     ioctl(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE, &exec_queue_create);
> diff --git a/drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h
> index 85abe4f09ae2..b28c8fa061f7 100644
> --- a/drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h
> @@ -174,6 +174,9 @@ struct slpc_task_state_data {
>   	};
>   } __packed;
>   
> +#define SLPC_CTX_FREQ_REQ_IS_COMPUTE		REG_BIT(28)
> +#define SLPC_OPTIMIZED_STRATEGY_COMPUTE		REG_BIT(0)
> +
>   struct slpc_shared_data_header {
>   	/* Total size in bytes of this shared buffer. */
>   	u32 size;
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 8948f50ee58f..0c116faaccf7 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -549,11 +549,12 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>   	struct xe_tile *tile;
>   	struct xe_exec_queue *q = NULL;
>   	u32 logical_mask;
> +	u32 flags = 0;
>   	u32 id;
>   	u32 len;
>   	int err;
>   
> -	if (XE_IOCTL_DBG(xe, args->flags) ||
> +	if (XE_IOCTL_DBG(xe, args->flags & ~DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT) ||
>   	    XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
>   		return -EINVAL;
>   
> @@ -570,6 +571,9 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>   	if (XE_IOCTL_DBG(xe, eci[0].gt_id >= xe->info.gt_count))
>   		return -EINVAL;
>   
> +	if (args->flags & DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT)
> +		flags |= EXEC_QUEUE_FLAG_LOW_LATENCY;
> +
>   	if (eci[0].engine_class == DRM_XE_ENGINE_CLASS_VM_BIND) {
>   		if (XE_IOCTL_DBG(xe, args->width != 1) ||
>   		    XE_IOCTL_DBG(xe, args->num_placements != 1) ||
> @@ -578,8 +582,8 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>   
>   		for_each_tile(tile, xe, id) {
>   			struct xe_exec_queue *new;
> -			u32 flags = EXEC_QUEUE_FLAG_VM;
>   
> +			flags |= EXEC_QUEUE_FLAG_VM;
>   			if (id)
>   				flags |= EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD;
>   
> @@ -626,7 +630,7 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>   		}
>   
>   		q = xe_exec_queue_create(xe, vm, logical_mask,
> -					 args->width, hwe, 0,
> +					 args->width, hwe, flags,
>   					 args->extensions);
>   		up_read(&vm->lock);
>   		xe_vm_put(vm);
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> index 5af5419cec7a..b6fdc7ca687e 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> @@ -85,6 +85,8 @@ struct xe_exec_queue {
>   #define EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD	BIT(3)
>   /* kernel exec_queue only, set priority to highest level */
>   #define EXEC_QUEUE_FLAG_HIGH_PRIORITY		BIT(4)
> +/* flag to indicate low latency hint to guc */
> +#define EXEC_QUEUE_FLAG_LOW_LATENCY		BIT(5)
>   
>   	/**
>   	 * @flags: flags for this exec queue, should statically setup aside from ban
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index 44b5211066ef..e926f89e4ce9 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -1014,6 +1014,17 @@ static int slpc_set_policies(struct xe_guc_pc *pc)
>   	return 0;
>   }
>   
> +static int pc_action_set_strategy(struct xe_guc_pc *pc, u32 val)
> +{
> +	int ret = 0;
> +
> +	ret = pc_action_set_param(pc,
> +				  SLPC_PARAM_STRATEGIES,
> +				  val);
> +
> +	return ret;
> +}
> +
>   /**
>    * xe_guc_pc_start - Start GuC's Power Conservation component
>    * @pc: Xe_GuC_PC instance
> @@ -1077,6 +1088,11 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
>   	}
>   
>   	ret = pc_action_setup_gucrc(pc, GUCRC_FIRMWARE_CONTROL);
> +	if (ret)
> +		goto out;
> +
> +	/* Enable SLPC Optimized Strategy for compute */
> +	ret = pc_action_set_strategy(pc, SLPC_OPTIMIZED_STRATEGY_COMPUTE);
>   
>   out:
>   	xe_force_wake_put(gt_to_fw(gt), fw_ref);
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 913c74d6e2ae..f2ce3086838c 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -15,6 +15,7 @@
>   #include <drm/drm_managed.h>
>   
>   #include "abi/guc_actions_abi.h"
> +#include "abi/guc_actions_slpc_abi.h"
>   #include "abi/guc_klvs_abi.h"
>   #include "regs/xe_lrc_layout.h"
>   #include "xe_assert.h"
> @@ -400,6 +401,7 @@ static void __guc_exec_queue_policy_add_##func(struct exec_queue_policy *policy,
>   MAKE_EXEC_QUEUE_POLICY_ADD(execution_quantum, EXECUTION_QUANTUM)
>   MAKE_EXEC_QUEUE_POLICY_ADD(preemption_timeout, PREEMPTION_TIMEOUT)
>   MAKE_EXEC_QUEUE_POLICY_ADD(priority, SCHEDULING_PRIORITY)
> +MAKE_EXEC_QUEUE_POLICY_ADD(slpc_exec_queue_freq_req, SLPM_GT_FREQUENCY)
>   #undef MAKE_EXEC_QUEUE_POLICY_ADD
>   
>   static const int xe_exec_queue_prio_to_guc[] = {
> @@ -414,14 +416,20 @@ static void init_policies(struct xe_guc *guc, struct xe_exec_queue *q)
>   	struct exec_queue_policy policy;
>   	enum xe_exec_queue_priority prio = q->sched_props.priority;
>   	u32 timeslice_us = q->sched_props.timeslice_us;
> +	u32 slpc_exec_queue_freq_req = 0;
>   	u32 preempt_timeout_us = q->sched_props.preempt_timeout_us;
>   
>   	xe_gt_assert(guc_to_gt(guc), exec_queue_registered(q));
>   
> +	if (q->flags & EXEC_QUEUE_FLAG_LOW_LATENCY)
> +		slpc_exec_queue_freq_req |= SLPC_CTX_FREQ_REQ_IS_COMPUTE;
> +
>   	__guc_exec_queue_policy_start_klv(&policy, q->guc->id);
>   	__guc_exec_queue_policy_add_priority(&policy, xe_exec_queue_prio_to_guc[prio]);
>   	__guc_exec_queue_policy_add_execution_quantum(&policy, timeslice_us);
>   	__guc_exec_queue_policy_add_preemption_timeout(&policy, preempt_timeout_us);
> +	__guc_exec_queue_policy_add_slpc_exec_queue_freq_req(&policy,
> +							     slpc_exec_queue_freq_req);
>   
>   	xe_guc_ct_send(&guc->ct, (u32 *)&policy.h2g,
>   		       __guc_exec_queue_policy_action_size(&policy), 0, 0);
> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> index c059639613f7..64acb3488406 100644
> --- a/drivers/gpu/drm/xe/xe_query.c
> +++ b/drivers/gpu/drm/xe/xe_query.c
> @@ -335,6 +335,8 @@ static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
>   	if (xe_device_get_root_tile(xe)->mem.vram.usable_size)
>   		config->info[DRM_XE_QUERY_CONFIG_FLAGS] =
>   			DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM;
> +	config->info[DRM_XE_QUERY_CONFIG_FLAGS] |=
> +			DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY;
>   	config->info[DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT] =
>   		xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K ? SZ_64K : SZ_4K;
>   	config->info[DRM_XE_QUERY_CONFIG_VA_BITS] = xe->info.va_bits;
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index e2160330ad01..decbb3b2df36 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -393,6 +393,8 @@ struct drm_xe_query_mem_regions {
>    *
>    *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM - Flag is set if the device
>    *      has usable VRAM
> + *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY - Flag is set if the device
> + *      has low latency hint support
>    *  - %DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT - Minimal memory alignment
>    *    required by this device, typically SZ_4K or SZ_64K
>    *  - %DRM_XE_QUERY_CONFIG_VA_BITS - Maximum bits of a virtual address
> @@ -409,6 +411,7 @@ struct drm_xe_query_config {
>   #define DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID	0
>   #define DRM_XE_QUERY_CONFIG_FLAGS			1
>   	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM	(1 << 0)
> +	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY	(1 << 1)
>   #define DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT		2
>   #define DRM_XE_QUERY_CONFIG_VA_BITS			3
>   #define DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY	4
> @@ -1124,6 +1127,7 @@ struct drm_xe_vm_bind {
>    *         .engine_class = DRM_XE_ENGINE_CLASS_RENDER,
>    *     };
>    *     struct drm_xe_exec_queue_create exec_queue_create = {
> + *          .flags = DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT

Should we add a separate example here so it is clear that this flag is 
to be used only for low latency work? This should not be used as default 
due to power implications.

Thanks,

Vinay.

>    *          .extensions = 0,
>    *          .vm_id = vm,
>    *          .num_bb_per_exec = 1,
> @@ -1150,7 +1154,8 @@ struct drm_xe_exec_queue_create {
>   	/** @vm_id: VM to use for this exec queue */
>   	__u32 vm_id;
>   
> -	/** @flags: MBZ */
> +#define DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT	(1 << 0)
> +	/** @flags: flags to use for this exec queue */
>   	__u32 flags;
>   
>   	/** @exec_queue_id: Returned exec queue ID */

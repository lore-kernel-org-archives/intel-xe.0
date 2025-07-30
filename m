Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE827C83F26
	for <intel-xe@archiver.kernel.org>; Wed, 30 Jul 2025 17:40:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FB2810E390;
	Wed, 30 Jul 2025 17:40:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Cd4AvjsB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6725E10E44D
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Jul 2025 17:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753897254; x=1785433254;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=IspJHhNA30JCgVHoW7aoPnvQayB+W6Q5N784FPAUmig=;
 b=Cd4AvjsBRDQnoAt0vn02J+xmowDWZRsX/b9NdLPCr/fVhHpN+LCvvsH6
 JHLwhvOptUuzh9fFbxHBoWJWwk2AhPyCeKeoiIUCA42wXy/OZoC5CogeF
 RFbn178aRuaGZYh/0ogRCQolqbtn+20yoUFYsJCx9gOqa4pdY+wnWhDBl
 AoS3QAY6rutRMrrGOg5ocos8JimND1mv3Ncju+AnU+nFLLauzfQ7HFj6n
 d9CAJTAnZTQIByF5PSMbYljH4QgXehSXCt1XfGW+otlXDusdeZaleVSjV
 LpRf3NUmY2QNpmnl8uX4/jdSPxRfGpAb2ejHh/MofXr0kcliLTVEZnLhT A==;
X-CSE-ConnectionGUID: TKF2ZJktTmmih2GWVZMa5w==
X-CSE-MsgGUID: vzzZOOQmSr6QydwVMV65gA==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="58830516"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="58830516"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 10:40:54 -0700
X-CSE-ConnectionGUID: j5PnQp8LS8abfD3J18HyuQ==
X-CSE-MsgGUID: V3VOozubRAysPJPdekLFMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="162635269"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 10:40:49 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 30 Jul 2025 10:40:46 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Wed, 30 Jul 2025 10:40:46 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (40.107.96.75) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 30 Jul 2025 10:40:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e0XlZ5x9ptA60jZRoAvbWB2fYW7fQF+/KsQNuca/IAqWlzp06RL0H1vvIzVo5M/owvy3pTZWPx6ntULio+nSDxvXqUIvoA/vp4/iOWK51ZESTmtN7iKYbsmYKFfd/jBIk6pz+pkjuvRzUcwvSLO8Gbane4lAc3S8cf77vmZKIBjMWJEBR1EmS6YzfX0ciJWD5XtsJ6xrxAYt1ietlO066LUS7tTav0zP7rbUvfRvE1Sk61OZ+sbd7AjNsL3KC7d6Wc5/EnZPnuLfgeZQZWdDiKDXA5rm7M5PXAcPr4P842mXHwR15DwWcFcFRjAaHGNT6gUahzXoPMaaZIOn6wcwlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nIy3xqnXjS7964QfDYfBfg1g31KpepPamtjQMumuUpc=;
 b=Z6TDZdGXV+hmU26KnydkyVcE8whdnUGERfXvAYiM7ay6fwKBsfcF5pAC/eQZRIAw34dRKjaxFhnhqUExG0PwyZ5XA6VTvwdVVLc11sYlrBIFyUKg3xBnndRgQtg9NAJqMa785272QQuh3v+0tVBUGLjMl8o+IOQj76fu6Md/Ic87AskV4SEyfNlBNUqvJpJS9DS4BctHUuuCCWgWU+cF8fc+XBWNoxcdv9jWeq84xKU0wMqdKLMXGnO8utGMpy3HzRnY88rCOsONcg9kjFVyZQBkX3qd7lvlKCwyVsPezi6h0OS9U7UrAjUOzXKg3xQHEnu7TS6ykRURkeYuut2TNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6391.namprd11.prod.outlook.com (2603:10b6:930:38::21)
 by MN2PR11MB4743.namprd11.prod.outlook.com (2603:10b6:208:260::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.27; Wed, 30 Jul
 2025 17:40:35 +0000
Received: from CY5PR11MB6391.namprd11.prod.outlook.com
 ([fe80::d1d5:6fa6:9a2d:92e2]) by CY5PR11MB6391.namprd11.prod.outlook.com
 ([fe80::d1d5:6fa6:9a2d:92e2%7]) with mapi id 15.20.8964.026; Wed, 30 Jul 2025
 17:40:35 +0000
Message-ID: <44a15fd9-70b2-4e07-b599-f7f4a648fce7@intel.com>
Date: Wed, 30 Jul 2025 10:40:33 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/6] drm/xe/guc: Add GuC log event buffer output in LFD
 format
To: Zhanjun Dong <zhanjun.dong@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20250722013553.1266218-1-zhanjun.dong@intel.com>
 <20250722013553.1266218-6-zhanjun.dong@intel.com>
Content-Language: en-US
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20250722013553.1266218-6-zhanjun.dong@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0383.namprd04.prod.outlook.com
 (2603:10b6:303:81::28) To CY5PR11MB6391.namprd11.prod.outlook.com
 (2603:10b6:930:38::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6391:EE_|MN2PR11MB4743:EE_
X-MS-Office365-Filtering-Correlation-Id: 26f8e0f3-c773-45b9-22bb-08ddcf90307a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bTRKOXN0S0IzbnVQSVdRVXNRNGp0TEJuUHNhcHRMVkd1TkhWK1JPdUxrQnFu?=
 =?utf-8?B?ckdsWmhzVWNVSThLRU4reWNFZW1iaDgwL09BVi9IMHNaOU9xbVlVcENUSi9q?=
 =?utf-8?B?RFZTYzI2b3VmWURYbFZJNU04SVBjS3A0V3pSb1VwRHQyMHVMem82TzZPUHBu?=
 =?utf-8?B?ZjNHN2JHbll5dlNuVlhmMldNTEVyQXlzT0RWSFl4ZnpOQTk1TmNoRWxpdmFC?=
 =?utf-8?B?VVZxbDFFKzJMQ1FWZkR1ZjMyZExjQzdGa3pvdHNmbjZJY0g4V1cyVXlvVWwz?=
 =?utf-8?B?SDZoZVJYVWZYblRlanR6MnZRaWxZaGpqblp4S1gwZlhVTWZJY1pwSXUrQWZC?=
 =?utf-8?B?QUJEWjNZcE9IUzl2TFZIK2w4U05VOStxY3FvMFg5ZzZja2ZMV1pLMXlEdlZ1?=
 =?utf-8?B?WVVOc2VDSGdkTlpVSG1FUC8zNFpzMkdoeC9UNzB1Q3BTdGVjWU5uclVyWFNw?=
 =?utf-8?B?WDdjOU4rQWMwZUNRRHVRMmZVTFI2UitrUUZXMG0ySE5tYVRTMTYxdzBDZ3pY?=
 =?utf-8?B?WEg0emFyYWxLNnpVdUpYMml6VmZrdlRZRkt0a2ZXYWNVRmxjUWc5MXFuc3pj?=
 =?utf-8?B?MjhzSG9UQ0ZMK004emVGSUFEUHQvYTdIT2UzVm5VQThob2FpQUxRRlphRUFZ?=
 =?utf-8?B?R3lpUDBiODJ5di9tOFMrd1pjcWgySFp3RDl6MFlmb21hZmo4WFpoeERNM3RQ?=
 =?utf-8?B?MEgrcnhhUFZ0R2M3d0ZUNU9STE0vSnhTWXplaU9HTDBlanBzQ01VSUtJWWlS?=
 =?utf-8?B?aDNNNkxlOGJtQUZoUk9Ka011bFFIWWFNUDFkaWVmemcwaHU5Zk9yaG0xOWJo?=
 =?utf-8?B?MzBjUnZhRlFBK0ZUbTFvRFhmUEtGTWRKY3lMZ0VtWW9yejkyaDlwM1dhczQ5?=
 =?utf-8?B?NmgwSEkyYVFnL1p2SVhueFVYK0xXY1hkL0xoTE9YVUxucyt3ZURXSWxZNjZT?=
 =?utf-8?B?WEhXM0hMcmxXZXU2SGpobFR6a2tIYUJFZjg5QlFrTE1XbGY5NUwrOHFGRkNQ?=
 =?utf-8?B?dmNtS1phZ3dQa1lHcWVKem55TlRndythdWNpcnhLQmVvbFJYOWhGNHJseHA5?=
 =?utf-8?B?MGVKNkZjb1hWRlBlL0lxdzNjZGEza1pLbnZyZEtyU1V2aUc5RGJYaEFack00?=
 =?utf-8?B?c3VrU1lveWpZbFFqOUpsTmVYdjdoMUgxUmxDZG9CVlFmZDBpeTExb2cxRVh6?=
 =?utf-8?B?YVNlTVUyZlorc0RnUWFmNkxJNWN4cFlKRkJFUFB4Mm1rUFBvTFdLMUdiR2pq?=
 =?utf-8?B?UHFlL1VGazZ5cDF2MkpsZi80ZVl2V0JhbCtyTlgyV21aMmdrTUhXVUhaRSth?=
 =?utf-8?B?MHREUFYybXVuc2lMN2dRaG1MeEtBSSt1NHlOcVVGcGZVNE84bFFrdlpjbE0x?=
 =?utf-8?B?MHdDQzRyQ3lNSnlpOHcwSTdoUzhUTXlSVTRVRzQ0dTZ5RkcvZnAzM2x4WkNH?=
 =?utf-8?B?QnR6WVZDWUZzWm5CZHc4eGVXRkNETFZEV0tYS3lRMk1PZEdqMkpNMHFLUHJU?=
 =?utf-8?B?S2lVKzFlS3hEV05VRzBIdmY5SitXclpJekJvTElHZnlWd3lvUzZZcUhyYVcw?=
 =?utf-8?B?SlFMcUlZbVZUNWtRbkppVVZTaGJzNXJySitraFp4VW1vSXorQUNoNHBqU2g3?=
 =?utf-8?B?MXRxanc2Mk5WZi8xRGM2ZDN0cklwbFpVUktpS3Z5bDlRcndEUGhQbmVHYWxV?=
 =?utf-8?B?N2hGdVpmNysyVnpGS3VpRzZRTWlpVms4c2I3WlBqanNJZkZEQnBQdFlMVUly?=
 =?utf-8?B?dDBERmpkTGZ4WW5yTlVMM0JYck9qQVZWYWtrSis5aCtMNE1XVDdLaTRCTGgw?=
 =?utf-8?B?d0RnejNXcnF0TE9seTVEVENpR3ZsWjNEQjJUa0c3WUxiZHFUT0wrYWNwQWlJ?=
 =?utf-8?B?NE5RN2tPQkxWK3F3SGtxakJUMU1RNVA0UDZCeFR5T3JYZ0UyYlBtc216dW1o?=
 =?utf-8?Q?AxyXdOe+ml0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6391.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bUxNUzgrUVNjUkF6MGNXVEVJUjJES25UTDFKV2g3dFBFVTVZT0NiVkVZQVp6?=
 =?utf-8?B?SUhIZVZCTUVOeEZ5YmVyR012eUxwWmhGdEdYUzRvYXMvTDIvUDJSY1NUQkx6?=
 =?utf-8?B?RUpyVlkwTHNlU3pVdXRWY0Y1bFhPL1NpME5YS3FCaEgwdjNLZ3JTSzNad0F0?=
 =?utf-8?B?TzRLakRvYUY1VXNjOG8ybHo1N2pDeGtKdTVjd3daay9Hc2wxMUkwS3R0UnVz?=
 =?utf-8?B?MGNSNXNLQ1JQNWp1S2VDWnJVcGs5RFlDdk42blpiSXh0NThpV3BGcEU0WGxB?=
 =?utf-8?B?MG1HNVNvOVVCYW5weWcrUWZaYWtrcGFTRStWMU8vVEJ6aTZIZFI4aldaNG9I?=
 =?utf-8?B?aTMzYTQ1VXZFbFd5K0dla1pPMjlIUmRXNlJTMHVMNG12SWdDK1kydlpaa2Fs?=
 =?utf-8?B?TVRLanJNTHJmRDRWME11L0lmOVNLU3BCakRsSzVTSjZCbzhnZTVKVW90ZzFO?=
 =?utf-8?B?dFF6TzJnYnMvZllpdlkvb0c2b2QralZtMGNQdGYwK1p6c1E5SGp0cGdOVHJD?=
 =?utf-8?B?MVB1V0EvZ0JJeXpiYnd6a1FuZzlUSU5WV1ZXU2czeSt2aVR1eHpsVDZhQmhu?=
 =?utf-8?B?R28zUEQ2em1kVVRBcGlRNGdwQ3M3SkxYenNGTXRVOFBPaXZpMEl3RjFNZUtE?=
 =?utf-8?B?TjlsSTAwbzJQM1l4bENsR29vckcxS20ybEswaUVtRHlJYUZ2Zk5JZUV2bjNY?=
 =?utf-8?B?ZEdoeVhSMm1uMFZIUFIxR1pBK2lhNjdzbUNFZWFqNkljODBBL1c3Vi8rVVNN?=
 =?utf-8?B?T2xRdU9SbHNBL3Nnc3F5NEJGdXZhdVd5T0xKdFMxSTJFWFZEcW9ha0xIU1Zt?=
 =?utf-8?B?RlNrV2RNSFRKVm1hTlpEWmlleXNtYVYwRGVvTW5tUmFsRkx0UUVZT0c0K2V2?=
 =?utf-8?B?U0RCQnVwckVTRW8xU1BxUGtRTUVFcXFXeVJmcUFnUVQ5T2JCaGdzdHZVSldJ?=
 =?utf-8?B?aWY3Z2hEV2VJcFJMZUFxcmtVMldnN3NEYU1mdk9BME1NenNoL2NKMSt0V2Uw?=
 =?utf-8?B?UXFoVmtZYkRML2c5aDA3bEl0VjA2RzRCcStaekVZUW9zWkE5UmsvL29zWk9p?=
 =?utf-8?B?UHY0RFRIeGdqMTRGenp6Q0VBcHRCSFpCNmxRek1tYzl6YmdpdktXaUsvOHNF?=
 =?utf-8?B?ZWdWMlBqZ1JULy9xa1lwSmdqenlkMzVWeXNiSWFxMFBaV0pCVDFGWkdDUEFl?=
 =?utf-8?B?TmRvNXJjMzBiR1hrM1FxZ2RPbVNnU1dVNzNZTGplVWNMQzMvMXMrVDVMZW81?=
 =?utf-8?B?Y3VYUytObi81dDdnR2ZpcWtMcDAyMjJvQi9abUMvSjNyUHU0ak02cy9uQkRY?=
 =?utf-8?B?UTVRaGNHaE41dmlkb2dvOEFxSUpwV2VRczFPRmUrWlUrRTNnVEhXOVdDZGZy?=
 =?utf-8?B?ZG96K0dXRlc0K3d3d042TThDUGR4dXlhY3lGY3NBMkdCdVdZTjFkbDI5cDZQ?=
 =?utf-8?B?ZnAyTXIvTnp0MWFuTy96UmQwWHlqKzVTZ0xENWVSRllGb25OZlA5ZEYyVXVX?=
 =?utf-8?B?dVhwQUVDQjMzanMxb2pJN2t4bEFVcXRVblhUUzVLZGt0OXhsa2xqdkZhbE5a?=
 =?utf-8?B?Rm1UbkNHRkphWGFSNm1CdXpDMkU0R0lGS0FZdWNSR2VlK0o5STBEMnFPK3ox?=
 =?utf-8?B?c3FmVzYrajZ6R0JhZmJGd2Rsc3ZLRitXMk1HcTkxb1R0Nk91SVVnaUM1RnQ0?=
 =?utf-8?B?MVhiTmp2OFVJNDRGV0YxVUMrZW1Ed0xhR2h0dkorY2VxVlZqOUdMV1JYTFd4?=
 =?utf-8?B?emdiOVhpYThmeG9qcCs0K25oNkszWWF3SlY4blhsWjhnWmFwWlFnMEwxeTdx?=
 =?utf-8?B?N1BYZURFdFdzcjQrdE5Zb0ZYSVFHVUFmMjhKQUNIcWtkNmIzUXZuT21OcndW?=
 =?utf-8?B?OUMvZkZJUUFxeG9rTTVZWkhaOVRmaFl3WDh3U2dtM294MU1VWjN2TXhDbXM2?=
 =?utf-8?B?aXlZVU02Z1FvaDJDdTI3T1lOM2pGaEFIQXJ3Ui9obUdjUHJOY1U4V2lnVzRk?=
 =?utf-8?B?T09vNVFOTnlxaDU5NEErM2VqNnZuYXg2OHRUY0ZTak1nSzRvWEZwUWJKQTVs?=
 =?utf-8?B?SmhKbkNrLzh5TE5zUW51YStnVEd6R2hZVFAybFcxM003WURBTU8wbEFYcmZo?=
 =?utf-8?B?VGdmQXY3a0dHT2c0SU9RcjJNRGhFOUZ5L3g2a2JJdjRCOVcyTmxZN29MejVJ?=
 =?utf-8?B?K3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 26f8e0f3-c773-45b9-22bb-08ddcf90307a
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6391.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2025 17:40:35.5072 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CQ5QDilMwrROlYyHTRve57ClMBLrWbmAMhQ16AZwgsxwmAiK2F0XkE9wBzWuRrSA5valYFK3uTyQ+YB4oHRYBo2WyRv0kU7s5Q1hvXVAPXU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4743
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

On 7/21/2025 6:35 PM, Zhanjun Dong wrote:
> Add GuC log event buffer output in LFD format.
>
> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc_log.c | 88 ++++++++++++++++++++++++++++++++-
>   1 file changed, 87 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
> index 609a9fd5ba0c..a8910211c579 100644
> --- a/drivers/gpu/drm/xe/xe_guc_log.c
> +++ b/drivers/gpu/drm/xe/xe_guc_log.c
> @@ -421,10 +421,92 @@ xe_guc_log_output_lfd_init(struct drm_printer *p, struct xe_guc_log_snapshot *sn
>   	return size;
>   }
>   
> +static void
> +xe_guc_log_print_over_chunks(struct drm_printer *p, struct xe_guc_log_snapshot *snapshot,
> +			     u32 from, u32 to)
_over_ ?

> +{
> +	int chunk_from = from % GUC_LOG_CHUNK_SIZE;
> +	int chunk_id = from / GUC_LOG_CHUNK_SIZE;
> +	int to_chunk_id = to / GUC_LOG_CHUNK_SIZE;
> +	int chunk_to = to % GUC_LOG_CHUNK_SIZE;
> +	int pos = from;
> +
> +	do {
> +		size_t size = (to_chunk_id > chunk_id ? GUC_LOG_CHUNK_SIZE : chunk_to) - chunk_from;
> +
> +		xe_print_blob_ascii85(p, NULL, 0, snapshot->copy[chunk_id], chunk_from, size);
> +		pos += size;
> +		chunk_id++;
> +		chunk_from = 0;
> +	} while (pos < to);
> +}
> +
> +static void
> +xe_guc_log_lfd_print_from_chunks(struct drm_printer *p, struct xe_guc_log_snapshot *snapshot,
> +				 struct guc_log_buffer_entry_list *entry)
> +{
> +	/* Output data from guc log chunks directly */
> +	if (entry->rd_ptr < entry->wr_ptr) {
> +		xe_guc_log_print_over_chunks(p, snapshot,
> +					     entry->offset + entry->rd_ptr,
> +					     entry->offset + entry->wr_ptr);
> +	} else {
> +		/* print from rd to buf end 1st */
> +		xe_guc_log_print_over_chunks(p, snapshot,
> +					     entry->offset + entry->rd_ptr,
> +					     entry->offset + entry->buf_size);
The log does not necessarily reach the end. Indeed, the v2 format is 5 
dwords which does not fit neatly into a page. So you need to stop at 
buff_wrap_offset not buf_size.

Also, remember that the primary aim here is for streaming output - 
continuously dumping data, not just a single snapshot. And in that case, 
we should be sending a FLUSH_LOG H2G command and then dumping up to 
sampled_log_buf_wr_ptr rather than wr_ptr. And in the case of streaming 
output, taking a snapshot copy of the log is probably not worth doing. 
We can just dump directly from the live buffer.

I'm not seeing anything that writes to rd_ptr. The KMD is responsible 
for updating the read pointer after reading the data. The GuC does not 
know what we have or have not read.

> +
> +		/* print from buf start to wr */
> +		xe_guc_log_print_over_chunks(p, snapshot, entry->offset,
> +					     entry->offset + entry->wr_ptr);
> +	}
> +}
> +
> +static inline int
> +xe_guc_log_add_log_event(struct drm_printer *p, struct xe_guc_log_snapshot *snapshot,
> +			 struct guc_lic_save *config)
> +{
> +	size_t size;
> +	u32 data_len;
> +	struct guc_lfd_data *lfd;
> +	struct guc_log_buffer_entry_list *entry;
> +	struct guc_lfd_data_log_events_buf *events_buf;
> +	char buf[GUC_LFD_BUFFER_SIZE] = {0};
As per other patch, this is a very bad idea for multiple reasons.

> +
> +	lfd = (void *)buf;
> +	entry = &config->entry[GUC_LOG_BUFFER_STATE_HEADER_ENTRY_LOG];
> +
> +	/* Skip empty log */
> +	if (entry->rd_ptr == entry->wr_ptr)
> +		return 0;
> +
> +	size = xe_guc_log_add_lfd_header(buf, GUC_LFD_BUFFER_SIZE);
> +	lfd->dw0 |= FIELD_PREP(GUC_LFD_DATA_DESC_TYPE, GUC_LFD_TYPE_LOG_EVENTS_BUFFER);
> +	events_buf = (void *)&lfd->data;
> +	events_buf->log_events_format_version = config->version;
> +
> +	/* Adjust to log_format_buf */
> +	data_len = offsetof(struct guc_lfd_data_log_events_buf, log_format_buf);
> +	size += data_len;
This all seems a very complicated way of doing things. Why not just have 
a structure which is the event buffer LFD block - header, magic, 
version, etc. Create one of those on the stack as a local variable, fill 
it in and write it out. No need for complicated type casting, 
offsetting, pointer arithmetic, etc.

> +
> +	/* Calculate data length */
> +	data_len += (entry->wr_ptr + entry->buf_size - entry->rd_ptr) % entry->buf_size;
As above, this is not correct as the end of the log is the wrap_offset 
not the size. And in the case where the log is not wrapped, the size is 
just wr - rd and size is not relevant.

> +	/* make length u32 aligned */
> +	lfd->dw_size = DIV_ROUND_UP(data_len, sizeof(u32));
Is this just a belt and braces check? The log entries are multiples of 
either 4 or 5 words so data_len must be 32-bit aligned unless something 
is badly broken somewhere.

John.

> +
> +	/* Output GUC_LFD_TYPE_LOG_EVENTS_BUFFER header */
> +	xe_print_blob_ascii85(p, NULL, 0, buf, 0, size);
> +	xe_guc_log_lfd_print_from_chunks(p, snapshot, entry);
> +
> +	/* log event buffer content did not use buf, exclude from size count */
> +	return size;
> +}
> +
>   static void
>   xe_guc_log_snapshot_print_lfd(struct xe_guc_log_snapshot *snapshot, struct drm_printer *p)
>   {
>   	struct guc_lic_save config;
> +	size_t size;
>   
>   	if (!snapshot || !snapshot->size)
>   		return;
> @@ -435,7 +517,11 @@ xe_guc_log_snapshot_print_lfd(struct xe_guc_log_snapshot *snapshot, struct drm_p
>   
>   	/* Output LFD stream */
>   	xe_guc_log_load_lic(snapshot->copy[0], &config);
> -	xe_guc_log_output_lfd_init(p, snapshot, &config);
> +	size = xe_guc_log_output_lfd_init(p, snapshot, &config);
> +	if (size < 0)
> +		return;
> +
> +	xe_guc_log_add_log_event(p, snapshot, &config);
>   }
>   
>   /**


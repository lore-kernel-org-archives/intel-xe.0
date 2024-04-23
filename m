Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3EFEC4345F
	for <intel-xe@archiver.kernel.org>; Tue, 23 Apr 2024 19:19:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94DA91135ED;
	Tue, 23 Apr 2024 19:19:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R6xZrlQO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B7301135EB
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Apr 2024 19:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713899958; x=1745435958;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=kqAVsm7a6QNUMA2md/qgkjeRp1FWUNuJ02PeH95U9Sc=;
 b=R6xZrlQOH6o2zAPQ9PJrkjpuqA1AzSoJjHHb47YFgZkTC2VEhz/ud00W
 OZVAJYex18ZmZm9p9+xyvHFC98qPr4Lr3kdfBxf5nbDm82apGL4IoUZLX
 X5thyjzbmZVhvGqSqHrLClt+CfeZB1NS05PR/wr6P4CsYhRpQSeIGejO3
 zoIby0UynTF1gfHWhgpVAKVs2TGBPOGnsM+MclRqdFgHGAjVORJB6kk2K
 6rHL3bKXckhvLcXOrgmbxuC4giiFHNKLU+BLrQWgHmyc2kLrHSQHUXWvj
 KJHZk/dZzSyMncC6vY+fpze/psVwzlqQmYcJhWdtlIHBZicyP5xGl9c8G A==;
X-CSE-ConnectionGUID: CvChVi9IRrKLuZwphcigFg==
X-CSE-MsgGUID: nPlZozICRDyg8CaILPAxhg==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="9372644"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="9372644"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 12:19:18 -0700
X-CSE-ConnectionGUID: UCN7sxXgRI27PgqZ5lr1Xw==
X-CSE-MsgGUID: Kr+JknuJSrCQhR45lxN6+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="47739251"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Apr 2024 12:19:17 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Apr 2024 12:19:17 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 23 Apr 2024 12:19:17 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 23 Apr 2024 12:19:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nkqotPxTMSRaVF7zmSWxe2xq1kZhgaLLfDDuDN4oR/Dwp+bCazThv7zem9sP/VsejFTjJT4HlyvVzn33117riyTt0T/GxW3SOL6qTS6y18aIt806BJmEBES1MHHQczbDRvcIx94EQBOtE321KAFmZDH6yYtx61oAmNaiOpZPJfX/aIVZQuJtLsqsBueTIuXC1Lcbi4KLKOfEOEHaNMMqd6LHrs4qizlkr297smy0KMOtkgTT6WfF1W6G6Oz7bWlTpqNOO3YKpckvkdxhVNG0/QV9MQWxiCaWwllOJMfWyWl4yG49pBsm7ZcFfeJa3TIW0qojdr9chuaaYFejqCGe0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DpeH0KpYVozk7RkXnRIeQCp/bwKNVKw0Ss99wtAJ5p4=;
 b=Q7tsb/m4C7PAqOBKjYvQSFQnafhbfvyaziyGwcO9oFhWo4qoDFdS1rIA7CpfFqLsOXHxEy/oERY2/QFEIO3Zndx5xRWjQPuK7zG3aAI8E2Jn8PJ0YxQ2z3ETz3V5TN6CPy70OAXQz+c761dOXj86tgBGbJvkW78dZ0nJD6EvKq02x5HJElkk8YTppFip6+vMbheYiRwiRIGbplUmPK9mwrEc6IlDQZfApS6hQ9do/k8l3lQBvwFB+kWfSoxr7W0dUVJguQRVN9bF2jWdxy1WWo83PqZ7eOZVNIJy/GjTRrr+FOeQIHo7+bQkQePzpJ1LL3qwHXJB8Ve5ewF65odgvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by SA1PR11MB8524.namprd11.prod.outlook.com (2603:10b6:806:3a9::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.21; Tue, 23 Apr
 2024 19:19:15 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::b867:cbf6:e190:6eb]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::b867:cbf6:e190:6eb%5]) with mapi id 15.20.7519.018; Tue, 23 Apr 2024
 19:19:15 +0000
Date: Tue, 23 Apr 2024 21:19:13 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 2/5] drm/xe: Add helper to calculate adjusted register
 offset
Message-ID: <20240423191913.6j4oz7k23lurflqr@intel.com>
References: <20240423180436.2089-1-michal.wajdeczko@intel.com>
 <20240423180436.2089-3-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240423180436.2089-3-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MI0P293CA0008.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:44::13) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|SA1PR11MB8524:EE_
X-MS-Office365-Filtering-Correlation-Id: 87293f8f-c3c5-4d57-6e62-08dc63ca43f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WnpkNDQ2TGppUXR5UWp0aE5oY3RuVDdBYzVOSU5uV1lnL1hSMWsvVlBZUTln?=
 =?utf-8?B?eTlTOWl4dWxPSVFQZ2NOUUo2cHNmRzhZa04xZ2ptNFJrSFJ1bzBqQmxhMHpS?=
 =?utf-8?B?V3NDV3VtaVh6UGtBdjVHVVNxc3NFTDJyendocEpONUt4RTBuM3d5MzluS2Fl?=
 =?utf-8?B?dGRtU3R0TzgzMlhpV1FkcW56Qi9NMFd2T29mVWV5MVcrSGxkbVYwQ1BIWm95?=
 =?utf-8?B?ZHZwNzNvdHIrSlpkSXJaNjdtTENRREV3bjNvR2xMbUpncTFsWkJqWWZURmpa?=
 =?utf-8?B?ajZmMEwrUTZPZmRJMGRZb1l4eUFhSXB6Z1ZLbURsdjBHTzF0dDAzMzhMQnNG?=
 =?utf-8?B?cVdWaDZnTWtZYUNycVI0MnRMSUx3VFFydGd6TEx1dVJHL2gxN1VaQ0V6YmNk?=
 =?utf-8?B?NEllZ3BPWkxYeHhBSjgxaFRSOXZjYjhmMTBzOHM0bjc2R2lLZ0JiN05xSEQ0?=
 =?utf-8?B?NnRRcXF0bGlzUU5BaGRmVXBDY25qd3VLY3NucUtNUGxXL3VjTUNYcisxWDFm?=
 =?utf-8?B?RFBmOEFlaTk2OGVQcnVIbUJnYzZZd2VFV2tNaXBjWktDYmpCRG53T3NWMzB1?=
 =?utf-8?B?TndGa3h0T3dVeUxDN3dPc3FHVXB3YkF3bm5LMXdvYi9PWmdhN0w1VU5OaUxz?=
 =?utf-8?B?UW5CTDVhd3NKOE5haGdSK21ZT081aTJFQmV1eHhJM0VtN3BHSGtxbnBaNE4v?=
 =?utf-8?B?M043MGRMYzUwVnIzbnoraytmbmJMa0UvWjlSelFvaWVWTzJJSHVzSC9lRUlZ?=
 =?utf-8?B?RUtsSVR4NzhiUnRudEoxSGUwRDdUWHpNNElsK0RxWkZ6WHZMT0RWNHpJZlZD?=
 =?utf-8?B?RlV2SHN2YnByNDJsSnhMaFF2RnpTRUh0bWNhRjAvWFp0bFZ1R3VabnEwYUpY?=
 =?utf-8?B?NUN4S1MwSm9qcGNkNmpiNU5rZm9kdVZpMitXSThOb0NIQXBFNkNETzJMUnk0?=
 =?utf-8?B?YjV6U2RxOWVsSFp4THZmY2RiV3hPOCtPenNydER1Z1pKMURoRTJZOENlSmlx?=
 =?utf-8?B?NElZd2xVTE1CSDRZQ0FIN1JVTlN1aFN5WDJadzhZa2oySUwwaE5tNXVQSmEz?=
 =?utf-8?B?SjNDTzJKcmtWOUthU2pmUytpZmlmQ2N4SjJlSzRFc2g0eXZDQnN5WTNvQ1k4?=
 =?utf-8?B?UDlwK013REpGZXFpcFI4aFVERER6cm9nUE5PUm9LbWp0RnRxSWNkRXJYYzBP?=
 =?utf-8?B?M2NwSkJjTEFYaFp4UnZNclpOYmZhVm96MjZOSWUrMFdnSEIvRk1QQTRNd3J1?=
 =?utf-8?B?OHB2OHhHdDFtRXViWFQ2VTEwS2lVTUhOM1kvdWp4WXFyWTBCUklZRDg5VHJD?=
 =?utf-8?B?QlFtQzRSSnJlYVlwZ2hDQ05zcTdxTGtWczNKWW42emJQZ2t0Nk1oZStFQWtW?=
 =?utf-8?B?bHVLajdUc3haMnVtVnlUUWh6WFpqQnVDcFBNdmphZXEwWlQrbUZ3QVdtRlhy?=
 =?utf-8?B?R1EyQ25KYmJXYWtEbTN1dzIrbmVnMU11ZVRHQWlpMDdWOGZ6ZXJNeXFRWVZL?=
 =?utf-8?B?dGI2NDFsdXhNanVjT0JpUWhnUndiUGlxTTBENzRKbklWb093Zm9WU0VoQXVm?=
 =?utf-8?B?NHhYK2RucFBmTkVvNHgzZi9aRHhxQm8weFlscWw2T0xBc1FqSnh0MTd0dGFZ?=
 =?utf-8?B?MFZhNlI3OWE3VHgrNEZmM29WYnFRdTFGWXBadTlob3g2enErRHk3RlJZL0p4?=
 =?utf-8?B?Mm03a2VySzBjek9sL3ZqYVVmWjA2NnhINkNUOThmQmVXWlVJeFBZU0RRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aW5BQy9CUXFmNTMrM2ZZK3BQQTJ2RnVIdEZFU2NVTTFBTTYxUUQ4dlVXemZU?=
 =?utf-8?B?MzNWcmZyT2cxc1EwVVhwRVN6a2tzYWVxbnBubTFrQWFzUUgyWGc5OFBKMjkz?=
 =?utf-8?B?WjBpZ09zNXJuZlZiNFJqZ3lsWFpzTjA1ck9HMzVuUDF2Y2o1MnJ0Nmp5dVdL?=
 =?utf-8?B?c2lzMDlWRGxGU3V2U3dkTVZ2aFBKRHk4ZTNvVHd3RitlTkdGZEdoTUxRWDJl?=
 =?utf-8?B?cjRqTkFiV25aVEVPSFVnTkxCdUY4VlozNXVOWlBML1hWVytOMFAvRjRTTkRm?=
 =?utf-8?B?aUw5Q0V4TUI2ZG5zYkVPL3hFdkk1NWFkUE1IbkJXeXF2UWdZYi9nMWNDTjZw?=
 =?utf-8?B?QlJGaVpNV3BPNkhsbmVMMUtxYVREWFdpZGVYaFZZaEV4bE9jNXVvYzVrWjZK?=
 =?utf-8?B?ZktsekFId21Ocjg1NzF5MUkrU29oRE1xbzNIZFp2S0VvallxSFBqcG1wUndR?=
 =?utf-8?B?cXoxdWN4UkpycmFGKzRkL2Rnc3Y0KzA3dGpnekpNOEZmcElTdkRFV1lndGFm?=
 =?utf-8?B?ejVIMkx1TVJWTmVkZUJJL1AzOGF5Tlo1d3pzaGJ3UzY4TmZaV05NRUNJYURR?=
 =?utf-8?B?RDh4TnR6STdWdWdqQjRUWTcrTjdOcjgvUEZYOHJ6S2lSdG1XM0RYa0VJbURT?=
 =?utf-8?B?bTJtUFNVNG1NemtxWnZUT2c4ZjZGVnZ4aUgzUlpKUkdPdUEwaHc0ZEhkdXpm?=
 =?utf-8?B?QzdiS0wvWFpTZ3dudTdnZGRXODdDRXFTS1ZCdWpxV1JrUDg5NkN3Z0UwaVNa?=
 =?utf-8?B?QmR1Njh2N3o2ZFF1N0xneGVvOW52OUtMaUZybFZxTVZrbUoyV3krQUZOamV2?=
 =?utf-8?B?ZUJhMlJxRUtaemthRDRQblpic0xPT1dZRVV2ZEEzcFBwVFNyV2NGUjlZekFV?=
 =?utf-8?B?NkRsL3poWlZGazFlQnAwKzVkTWMweHh0d2pMTXB5NjR6MU85ZVlRR2pDRjRv?=
 =?utf-8?B?aFZITW5GSUFJZ1YveERicXlyMWd6M2NrSS9yalNhUUhkTUtZSFFGT0hCR21I?=
 =?utf-8?B?Vjg1V0hYSlQxbnV1aWsxYlVhdkV1a0JpU0dOczlQSVpOaFd2VVdPU0lxZDk1?=
 =?utf-8?B?cXRoa0drYVU4VXB1bk1Yd28zcGNnOFcvVTN3S0xESHAweHR6KzB5bVZadFZw?=
 =?utf-8?B?aEJyRzNPQVNPTS9EaDlpcUNIWEVJREx2U2NpYW1STE1FemZlM2R1Qy9ob0NW?=
 =?utf-8?B?ZmNLMHRuT2c1WGo0NDRrYldXT2cvWjVuSSs3UG1sb2NyTmFjcGY4a0xvS1B5?=
 =?utf-8?B?TEtBdnBIUHJHTnJCaHphNTlBSTBYRzlVaFY3VVNSbXYyeFBiOXJBUzhIWERD?=
 =?utf-8?B?bmNtWmJsc3l5bVZlWSt4Z3hoY05XenlLSkljTFM4eW9CZlBwQkZ0UkVwNFNp?=
 =?utf-8?B?SWpDSkJzb01Qem1PV01KNmRUbVJubnBhWGRPS2d1bG9CTCt4K2JNZVlwK1Rz?=
 =?utf-8?B?L3ZKMlpXVVJxMFRQclBMNHdtc3Z2aEhXMzAzMGdvOWZLSEswRGljZXJyM1pV?=
 =?utf-8?B?ZENUODVvTEgvSTNCaWpvem9ROExqV0pRTVFFaEZGR2M2WnFpNHZqamYrQU5v?=
 =?utf-8?B?akNYZVZDRlRMaDFDa1NjK2J0QmdNck9rWmJNL1dHaml6dnA3Nmdyb3RoSFJE?=
 =?utf-8?B?Umd6TjgrUFoxUWpTd3hoNjN3YXRpVzg3TFBEZ0dJRTNJSld3cnc3eGJiTlpl?=
 =?utf-8?B?N3Vtb3hjV3QrMmlkbnBhQW05bVltNGRsZ3dtSzdSMnlBN0VSQTAxN2FlUStP?=
 =?utf-8?B?OEZNZ0VoV1hIK1NHbDN3WG8xeThWY3Q2SS9KY2lrYkh4ZzlzV2hzYnh2OGJs?=
 =?utf-8?B?QzYxcENzaGMvUUpoOURtbHRES2tpN3hnN2FiTGljY1lSREhSZWpwOW9peWRI?=
 =?utf-8?B?M1V0c0w0OUVUMzBvNlViMm1FQjNJbFJBc21IRnQveEx2c0M1N3p2UmkrMDVI?=
 =?utf-8?B?Um1OWHBLYkpYMGo0TFkwYUZGYmhMeVU5MFdNaDJYM0ZQSTZaVUo5WlNvNFRY?=
 =?utf-8?B?WUIwOUdrdWhyTkcrb2VBaVZpSVNZZUdqYkswckVyY3FBYnN4ZjBNMU5rOE80?=
 =?utf-8?B?Z2lYc09KaTZNYnEydG54cStSaTNhZ1ZSVEE0L2lpblA4K3pDVGQwTExrSVNY?=
 =?utf-8?B?NUllTnBpb3l5NXl6bys1MXFucE9mOU04V1JROWo2enpZRzZWNndDTG4zdGty?=
 =?utf-8?B?SFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 87293f8f-c3c5-4d57-6e62-08dc63ca43f2
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2024 19:19:15.5335 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H3dpJAn1YUkAdTr1jwx1kCFH1XGNkwhtqGnyItC1+QcvABgr5itoMSlgBxk29qR+uOzJrOn6fKh15FeJCxjA+874wJbgVmOAoPBFGVaB6no=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8524
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on wto [2024-kwi-23 20:04:33 +0200]:
> Our MMIO accessing functions automatically adjust addresses for the
> media registers based on mmio.adj_limit and mmio.adj_offset logic.
> Move it to the separate helper to avoid code duplication and to
> allow using it by the upcoming changes to PF driver code.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
> ---
> v2: start using helper (Piotr)
>     make gt param const to allow use in xe_mmio_in_range()
>     assert that we adjust both or none addr in xe_mmio_read64_2x32()
> ---
>  drivers/gpu/drm/xe/xe_mmio.c | 38 ++++++++++++++----------------------
>  drivers/gpu/drm/xe/xe_mmio.h |  7 +++++++
>  2 files changed, 22 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index 334637511e75..2b18e8149ec3 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -423,41 +423,33 @@ int xe_mmio_init(struct xe_device *xe)
>  u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg reg)
>  {
>  	struct xe_tile *tile = gt_to_tile(gt);
> +	u32 addr = xe_mmio_adjusted_addr(gt, reg.addr);
>  
> -	if (reg.addr < gt->mmio.adj_limit)
> -		reg.addr += gt->mmio.adj_offset;
> -
> -	return readb((reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + reg.addr);
> +	return readb((reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + addr);
>  }
>  
>  u16 xe_mmio_read16(struct xe_gt *gt, struct xe_reg reg)
>  {
>  	struct xe_tile *tile = gt_to_tile(gt);
> +	u32 addr = xe_mmio_adjusted_addr(gt, reg.addr);
>  
> -	if (reg.addr < gt->mmio.adj_limit)
> -		reg.addr += gt->mmio.adj_offset;
> -
> -	return readw((reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + reg.addr);
> +	return readw((reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + addr);
>  }
>  
>  void xe_mmio_write32(struct xe_gt *gt, struct xe_reg reg, u32 val)
>  {
>  	struct xe_tile *tile = gt_to_tile(gt);
> +	u32 addr = xe_mmio_adjusted_addr(gt, reg.addr);
>  
> -	if (reg.addr < gt->mmio.adj_limit)
> -		reg.addr += gt->mmio.adj_offset;
> -
> -	writel(val, (reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + reg.addr);
> +	writel(val, (reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + addr);
>  }
>  
>  u32 xe_mmio_read32(struct xe_gt *gt, struct xe_reg reg)
>  {
>  	struct xe_tile *tile = gt_to_tile(gt);
> +	u32 addr = xe_mmio_adjusted_addr(gt, reg.addr);
>  
> -	if (reg.addr < gt->mmio.adj_limit)
> -		reg.addr += gt->mmio.adj_offset;
> -
> -	return readl((reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + reg.addr);
> +	return readl((reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + addr);
>  }
>  
>  u32 xe_mmio_rmw32(struct xe_gt *gt, struct xe_reg reg, u32 clr, u32 set)
> @@ -486,10 +478,9 @@ bool xe_mmio_in_range(const struct xe_gt *gt,
>  		      const struct xe_mmio_range *range,
>  		      struct xe_reg reg)
>  {
> -	if (reg.addr < gt->mmio.adj_limit)
> -		reg.addr += gt->mmio.adj_offset;
> +	u32 addr = xe_mmio_adjusted_addr(gt, reg.addr);
>  
> -	return range && reg.addr >= range->start && reg.addr <= range->end;
> +	return range && addr >= range->start && addr <= range->end;
>  }
>  
>  /**
> @@ -519,10 +510,11 @@ u64 xe_mmio_read64_2x32(struct xe_gt *gt, struct xe_reg reg)
>  	struct xe_reg reg_udw = { .addr = reg.addr + 0x4 };
>  	u32 ldw, udw, oldudw, retries;
>  
> -	if (reg.addr < gt->mmio.adj_limit) {
> -		reg.addr += gt->mmio.adj_offset;
> -		reg_udw.addr += gt->mmio.adj_offset;
> -	}
> +	reg.addr = xe_mmio_adjusted_addr(gt, reg.addr);
> +	reg_udw.addr = xe_mmio_adjusted_addr(gt, reg_udw.addr);
> +
> +	/* we shouldn't adjust just one register address */
> +	xe_gt_assert(gt, reg_udw.addr == reg.addr + 0x4);
>  
>  	oldudw = xe_mmio_read32(gt, reg_udw);
>  	for (retries = 5; retries; --retries) {
> diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
> index a3cd7b3036c7..445ec6a0753e 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.h
> +++ b/drivers/gpu/drm/xe/xe_mmio.h
> @@ -36,4 +36,11 @@ u64 xe_mmio_read64_2x32(struct xe_gt *gt, struct xe_reg reg);
>  int xe_mmio_wait32(struct xe_gt *gt, struct xe_reg reg, u32 mask, u32 val, u32 timeout_us,
>  		   u32 *out_val, bool atomic);
>  
> +static inline u32 xe_mmio_adjusted_addr(const struct xe_gt *gt, u32 addr)
> +{
> +	if (addr < gt->mmio.adj_limit)
> +		addr += gt->mmio.adj_offset;
> +	return addr;
> +}
> +

LGTM:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

>  #endif
> -- 
> 2.43.0
> 

-- 

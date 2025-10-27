Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03A90CCF9EB
	for <intel-xe@archiver.kernel.org>; Mon, 27 Oct 2025 20:13:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A53BC10E17D;
	Mon, 27 Oct 2025 20:13:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AMzZWhVm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99A0C10E17D
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Oct 2025 20:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761595982; x=1793131982;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ji27S6RDVKJ9Q9krnpggSqoc2RJhkH006eghBKqmwHw=;
 b=AMzZWhVmFKYNprvjj49tmI1yTuUeXm1hMm7XMGIDCAVcKefmEVGFExy6
 99mu1AnqAtXjnbZFG1wYH/FQMUrWogVDXu//LyD1LpyZZMb2yNaOCo7tL
 myMFfJHSPkNLdThCF3oTpCf9Gh2PzuM3Gs1DGESfQV7yeVVE/zp/nNHBY
 ow+psOZV15Xc/z0GpkK4iv0oSPaUz7fIUh4Hz9sdTt5oeBOALFOGBvp/b
 XzKuu3bVY0Tgjy0kBbZ+ifbbhCVYB32U1E8szlIAY52uNRHVZPAlvi2Mj
 JEyFVu5QIaB3XdJzsTNYNCVjQo18mISh4rlp6hdbbhdBX1eO6/ju7Sjqj A==;
X-CSE-ConnectionGUID: HTkyjTWYQWmCnsiKMWJyvA==
X-CSE-MsgGUID: UyOWp4LUT/KZtS1r/ii61w==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63781754"
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="63781754"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 13:12:46 -0700
X-CSE-ConnectionGUID: Fw8RGeFxQ0uD2yjxNn/XJQ==
X-CSE-MsgGUID: NdLf70OCRS2E9kGi1WcB8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="189514470"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 13:12:46 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 13:12:45 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 27 Oct 2025 13:12:45 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.31) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 13:12:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m+dIj94PfjPBVNwGQO4D1y2r3fGpWfU7OK+CLj2+FKF53fF3CopvCq0Iy8awM5DvfI8ojGqPbeiuLR720m+BNl2nk7oOSqLe1NWDLt5RUqv5gFjM0bYT3XixuvGwKcLoGifgSQhsCscT9PGr/kflbf9QdR10PXGmow/YboNTk4XvzlLWG145jr2CvwyChXs376V6iWn893G6dhcYlTD9WnlOh4QR9DuIOLA/PboiYF8ByFpUXzAdDSkRKy1OHNjWI0NHGBD8TXO1D8pcYMnkdZbfzVGSP9OIikeYdmZPiwqNJSx0SkBQTKIFPxCIC5S3Q1GdGDIZS9jKooP7P5tK6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5gBDPS5wT5wIClXUw+VELdxeLedzfLZER2WxxeEuJbM=;
 b=T6R+VzpOq/YBE+97bW6OofTDCkwhU0sdX4gIo/ZBnFRg5EwaHVUBrryl9YeHjnScxy/QelSy17tttEtFz+ancNL2R/YwS9S+Nij/3FsnBoWZcz0nGA5s53my5nwO+xowvOT6RSVxHJgBUAIr38+TFXadzUKun+TI68QdDCkH5Bm32qcliehh4U71NfD2c9IdJdFisNdLdyJAkoHezBOmaXidyXCbJsimLEOg8KPa0y9py8goGoXK87JwhBDzMqy7RujYpTtoMv7axlrre9H1KDyT9XSjc71/pXC1uSYhoyv6H4RYHyI7Pbf4v6nW/ZZ3kUKsWnKHhDarxjEj/HsbcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by PH7PR11MB7661.namprd11.prod.outlook.com (2603:10b6:510:27b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 20:12:43 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 20:12:42 +0000
Message-ID: <e9d5224e-b694-44d4-ab88-b8287a088da7@intel.com>
Date: Mon, 27 Oct 2025 21:12:37 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/14] drm/xe/pf: Add functions to bulk configure EQ/PT on
 GT
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20251020182414.576-1-michal.wajdeczko@intel.com>
 <20251020182414.576-6-michal.wajdeczko@intel.com>
 <i5dgkgqu5paensngw45gstdxgdpjaqukuoi3ygioimw4vyia74@vj3vegarb4qb>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <i5dgkgqu5paensngw45gstdxgdpjaqukuoi3ygioimw4vyia74@vj3vegarb4qb>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0046.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::15) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|PH7PR11MB7661:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d42ccb4-6867-4c13-f389-08de15952f34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eGJteFhIVktYZk8wa2xhU3pzWHBucVBKaERDcjl5d2R6eVJnWnByWiszTXpK?=
 =?utf-8?B?MlNvWXZZb2JFZDZnNDE0dy9LZGlXZnpMUjBBK0xkZFZzZGdNZ3F1UzN6cTBO?=
 =?utf-8?B?bmcyRWhMRFRMNW9sZ2RCKzhUVm5Zckx6UDhONnVVVWhvZjhjVnd2dTVpNW82?=
 =?utf-8?B?UUtSdXV5dVlRWE4yeWxXVmM0RVNSanRLYzlZNjZjT2VHN0xFOTBBWnhqZ1RY?=
 =?utf-8?B?NWwxdGdSbFkxZFJ3Wi9ZelFKNXROZGg2TitoS0t2TnpyYWdad3ZvRkdOS1Yy?=
 =?utf-8?B?cDk2UytqQlppWXY0eGFRSEVPUHRzYTRBY2czSHBmS0lMaTlwN0lXeVJpaTNX?=
 =?utf-8?B?d0o3Uk9OMmNxQktsTGU4MFFFWnJCcWUrMXpiRkMvOGJqcnYvdFQ3cGx6eFhY?=
 =?utf-8?B?d2Z2SFd0b3FtcWN3TXRTeER2L3IreStuRnM0K2UyY2RObWxKcGRDN3JjbXdp?=
 =?utf-8?B?S0paNkdjU3grREZwSDNVcFluTlJRcWhTbjRsekdieXV5bEVhZTAzVzdBclNo?=
 =?utf-8?B?dDZuakhmWGVYR2ZZT3hxNzlpYXhwZy84dUt6a00wNjR6RXdLNDgyWmZGL0pP?=
 =?utf-8?B?MldJTUJRZ0FTNEFCZVNQaXNPdW4yaWxMcnBWRytMOVR4ZkxUbE5NdUtKbzBO?=
 =?utf-8?B?am5rWC83bDBlTExpQThqZWJ4V1BocStBaERjb25sU0JHaXh2SzVpa05YWlF5?=
 =?utf-8?B?aDM1N1BVQW9pSHF4OHN4Y1RwSCtxQ09HUFVib0UyMlRPTFN2VW1qckZtbll0?=
 =?utf-8?B?VnRnQ25BazdPQWVrMUozbVFERjMvaEZ2OUtrTlhhVW1MVDR0V0tkTW1KVTdt?=
 =?utf-8?B?UXdYZCs5RjJDK0tYYTJ1T2VVNzEvcnhoZWRkOUhuN0FjbFBYOXBndm8wSGFJ?=
 =?utf-8?B?M21KKzZOL3cycU45RVg3RXRaaWY0RTd5aEVGTHRiRWlUV1BwbjZnWEpsekxP?=
 =?utf-8?B?WmpYeFIwdWZLNUJDcW8rZ2tJeWl4UzhSR0FMRkNIOTJZdDduK2N5bXBMWmt2?=
 =?utf-8?B?UERwWnlGUFBOYi85ZkZ1N1ZlTjU0dWZodnpkYi90S3ljUnFwN2JxUkl6WUtw?=
 =?utf-8?B?a2JXNmVXU3Y1SkNRMyszeTVTVmphNmhIa21PNzB1TkF3Q3ZwV1haK3JQdkJY?=
 =?utf-8?B?dWk3VTFaeUZsWlZmU1FYejB2K0ZPK0ZGaWRCR0lJb2FhRmg3NlRXamdDcVhu?=
 =?utf-8?B?Zlg0SGZ2QWhiZ1dLWGlvRUhQMm0zR1JQSmhjTFcreXQ4S3RuWENxdFk4VHJq?=
 =?utf-8?B?YW9PQjJlMk5pYUpXRlZKNER3L3N0TkNNWjhZbkNMR2xJQ2phYjFOeDlJeXhS?=
 =?utf-8?B?MEJRM3ZRQ0JMUnB4bGx4dGZGTy85WEVXY0xIVDlIR3o1UXpzT2MvOEE3aHJO?=
 =?utf-8?B?RW5La0h3bjR2NjAyL0VnejFkVW9DSm4xYTJ3R3BTaTBBejhxVVpUM3J4ODc0?=
 =?utf-8?B?T3dyeTVienRUazdPTXhBZjJ5S0NOeDhLUDR3Z0VtUkNFQld2K2gwcXgwdjBX?=
 =?utf-8?B?bDJ2VUhkeFg2ektLRkpRcnFTL2VLTWowTXlHYy9wSXk2UDBJb3Vrbm1xcDVt?=
 =?utf-8?B?ZHVWUGVkM0xTK2xnM1RIdUxSQm9HVXpTYkFLTVdkL3BrN2ZKUjhka0pIYXVK?=
 =?utf-8?B?ZlNzRENxMEk4OW81eVVxNlVldlRvSm82V1FLaXFOVG9DUi8zaHVoTUFYa1VV?=
 =?utf-8?B?LzVZQmFCcGxRVWZ5NkRQYmVaWUxnalMwYjFNeE5MN0JBdmNMZGNaQXNtRDRG?=
 =?utf-8?B?ckZITlBOd1VhTWhrZHJHbUR1eVRTZDhHQTdDdGJPOWhBaXRjSGNtQk9vZHda?=
 =?utf-8?B?L2tIa0w2VGh0Q0Q1L09ZcjNpcStBZUlXbXNlZEx2RS9IbFZ6czJlWEJGQ21r?=
 =?utf-8?B?ZFJtVGhnbng2OVpLSGJ2KzdkYnk0QmVuVlgrbW9ZRlB3WHhTRFdCaEZpSjIx?=
 =?utf-8?Q?MklhADa3vEy8KUFpo4siHgVud67Jq/kd?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZmpkMnZrcGRvVGc3ZERPR2w0Ny9FTGJDejFsSTlSa2xUWXlsUEtBN0pPWDB0?=
 =?utf-8?B?d3BlV050OTQvQWtTN2o1WkFBMlZwTitPa2xqVUJaZHZJd3pmNm9aUWp2bGNX?=
 =?utf-8?B?UXBhZFNLdlhFNVpETWZxakpFbnRGdThGOVdBQUxlbk8wMXdTd3hWVUFBUkFJ?=
 =?utf-8?B?U3cvOVVQZmxOaENud2tvWVBXNFlzNEVBSlBqelRaMmdNYkNLWGlMS3plOExy?=
 =?utf-8?B?cXJJTWRpSmhvc3cyV1I5Ri95ZjF4NU53MU1YUEpPRmtkeE52cGZ5TkJjaXRF?=
 =?utf-8?B?T3pwckRUNHFVMlRpS3dSdGZPSFBHMm1xWDN1UXBPWjNUQVpnaU05dDNrcy9X?=
 =?utf-8?B?cWFzaGZDMG9VSko3YWdBbUdyM3VYTlBHRWNoYlJ0ZnM1QUJUa3NINDBBdUlO?=
 =?utf-8?B?cWZTT0FIQ2NhNTk3cXBZZkoyTmxOYVgzNHFYdXgvZlRBcWF0VFpIMXV5aytt?=
 =?utf-8?B?aTlEZmR5TVJrbXNwdVBqS3ZETDhPb0dCWmdTakJsNjdVWGtWYndraldPakhO?=
 =?utf-8?B?b3F2bHZaRWgwK1ZucG5WaFhMaFAyWER6Q3ZmMHJzbGltN1VlQlM0ZHZQMThS?=
 =?utf-8?B?eWNueGgwUmU5VkloWGRjVnlsc292MmtoR0dlNHJ5bkJzdG10clI2QzhlV251?=
 =?utf-8?B?Nml1Z0NzbGp1NWlHMUZ1NFAweCtNeUVhdDZLUEFBWWpOc3lEc0l1TEppNHZ4?=
 =?utf-8?B?M1RIVTZqbEU1SGRWMUJsZHAzRmFyYUltK3NtMnhKWTE5amxobzhseWtCL3k4?=
 =?utf-8?B?QkI1amREOUZETDVlZjBTVlRiZytLUjl3VGwrcUJqc2lZeW43ZzhSTkZ0NGxU?=
 =?utf-8?B?MVl4eDF4Y0tlQ0N4ZWx0bjdqUTNnRWJ2MVZpbXR4UXhPT0tCY0F5WnVEUXA5?=
 =?utf-8?B?ckw2RXdnbnRBTHk3ODZSVTJ0ZWc3SmF1RWhub01USlJCMDRSY0o4bDdCU0pP?=
 =?utf-8?B?N1FzNlMwQm5RTUxqelU0TXdsQXJGVHhCQ0o2TlVJUC8vMHV5RC82NHpEa25B?=
 =?utf-8?B?SDk1NHlSQjExd1ZrSURkakdsd0dYSDgxZThCY29HS2tsdU04SmwxVWEzTWZa?=
 =?utf-8?B?bTN6MzdIZk00UkVxTHlqcjJrdE5CeDdveVAwMnk5ZEZHSVZYWXFhWmg4YU5l?=
 =?utf-8?B?enRTem11K1UvTW4vdzM1ajBPdndZUW0yK3Q4RDR4R3RqODMzMElmOXJIejB1?=
 =?utf-8?B?ZTJFaE5Hc3BpRHYyaDQvcTN1cy9adTBBbVUyZW16S1JjSUVaUDdpZVpuYWJq?=
 =?utf-8?B?TnVNS3g1QkRzT04rT0hKNTdETkxXUkMzRU1QTmtWNUFvQW5KS0NBQ1Rha0ZH?=
 =?utf-8?B?VkQzZXVTaWVzc0FNOEJGVjFZWXRwWjdhT2JLOEpWVm05ZWtRUG1LczExNFZs?=
 =?utf-8?B?d1NhQWhZMXE4TnVKNWczUFFkRDVESW0rLzk0L1B1a05wTWJqTFEvMFZVaTRX?=
 =?utf-8?B?Y2ZzZlFuU1hTd3o1WTdEbnhGdEd3ZUpmRWdDRG9jMVRrMmgwRWJRb2RCQTRh?=
 =?utf-8?B?RHpBeFhkcWtpSFNYZjg0amZmRU1jVUc1djVZbFd5dC9PS0s3NnpCNEdmQ3dv?=
 =?utf-8?B?NGsxWmp2cVp1QnZ4VDJyWlRXRHpxakVuNXVKTWYyUFhuV2ZnRjU4c1VwdU11?=
 =?utf-8?B?V2lUYzNJYUxOcCs3SGtHbjg4V3VGc1I4V2djWWNNTWFJT1V0WXlsUCtrWlE1?=
 =?utf-8?B?Ym9pT3FnU2NpVURscndRU0RFZE16UVFVN0JsREJNZjlzbVNmNW95RVl6RmxN?=
 =?utf-8?B?TjcwRll4Y0YwQ1A2aXZaRXRJT2phaHU2azZ1NnBKWnZnTlJWSk91cysrenB2?=
 =?utf-8?B?NVltT0lKa3MrczV3aDlqelorK2JxYWRTSzJhY1ZhNzQ3dUpRcXJxQ2JCQjZL?=
 =?utf-8?B?QzRQSFRTZHFuQXQvTDFkMUFwTndsdnczTUczb3ZPOVoyUy9la0xvbjF1UzJG?=
 =?utf-8?B?d0FvcXcra3d0a21PY3FGV1dCVWZOOEkxVU1iL0VHSkd2WHpHNVRFV1Nlb3hC?=
 =?utf-8?B?YWhnVGw4aXZtL1JZUTEwSFJnN3NkTjJYK1Z4R3RwUHFFelJsQmVjbkVKZXhT?=
 =?utf-8?B?SzFoV0lyUkt3TXJXNnVRbjdhQXJEU3B3NERSRkRWY1NTYzBqTXlWOWFrME85?=
 =?utf-8?B?bFB5WExnOVVEVXV5KzdTUkpaS3BzeWN5LzFoVzgvd3IvVytkUFprNnJNQnVJ?=
 =?utf-8?B?Z0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d42ccb4-6867-4c13-f389-08de15952f34
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 20:12:42.4985 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0QKcykC26ApmoEXHAihVrzGkzPnNyxouRrv49hsz9JiTNyttO7w5wmcAdgqdbWzqba7uJ74NbTNS7WZZOLxAX4CdBM/cYsAzFgy1XOyzXsc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7661
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



On 10/27/2025 8:03 PM, Lucas De Marchi wrote:
> On Mon, Oct 20, 2025 at 08:24:05PM +0200, Michal Wajdeczko wrote:
>> We already have functions to bulk configure 'hard' resources like
>> GGTT, LMEM or GuC context/doorbells IDs. Now add functions for the
>> 'soft' scheduling parameters, as we will need them soon in the
>> upcoming patches.
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> ---
>> drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 56 ++++++++++++++++++++++
>> drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h |  2 +
>> 2 files changed, 58 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
>> index 0a591b86d94e..99d5fb68174c 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
>> @@ -1778,6 +1778,34 @@ u32 xe_gt_sriov_pf_config_get_exec_quantum(struct xe_gt *gt, unsigned int vfid)
>>     return exec_quantum;
>> }
>>
>> +/**
>> + * xe_gt_sriov_pf_config_bulk_set_exec_quantum() - Configure execution quantum for PF and VFs.
>> + * @gt: the &xe_gt to configure
>> + * @exec_quantum: requested execution quantum in milliseconds (0 is infinity)
>> + *
>> + * This function can only be called on PF.
>> + *
>> + * Return: 0 on success or a negative error code on failure.
>> + */
>> +int xe_gt_sriov_pf_config_bulk_set_exec_quantum(struct xe_gt *gt, u32 exec_quantum)
>> +{
>> +    unsigned int totalvfs = xe_gt_sriov_pf_get_totalvfs(gt);
>> +    unsigned int n;
>> +    int err = 0;
>> +
>> +    mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
>> +    for (n = 0; n <= totalvfs; n++) {
>> +        err = pf_provision_exec_quantum(gt, VFID(n), exec_quantum);
> 
> Given now the function accepts PFID, it's weird to pass VFID(n).

PFID is still VFID(0)

> Any advantage on using that nop macro?

the function pf_provision_exec_quantum() expects "vfid" anyway
so use of the macro was supposed to be self-documenting that
we are not passing any random integer here

but I can drop this macro here if you want

> 
> 
> Lucas De Marchi


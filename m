Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB1ABC5AD49
	for <intel-xe@archiver.kernel.org>; Fri, 30 May 2025 16:10:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 876C810E15E;
	Fri, 30 May 2025 16:10:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gOwnY8+W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 649A510E15E
 for <intel-xe@lists.freedesktop.org>; Fri, 30 May 2025 16:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748621449; x=1780157449;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1z5SgkjTzFi7LOaR9sTNggv+JMJVOgQrErRDbVkyeys=;
 b=gOwnY8+WAvCOJUuYF8i31YhT+zoNtFBytRZjwXlTMmXHJ8u8rXhfHd+T
 UsZm7IDYfiksSiqIrsr2jS2jCSI4s2U/r6oPMk/FAiAhuJPHHd8NBdaJB
 SEenOuczuFI38YkoHY44QidbpJOezZaWU3u9KQm0Zwy5idbwS4SCZm08Y
 Kc5+huIB8Kb5mwdxTxZS04voqKyzvM0kwWKVPh/251iZYzXnujDH+17xN
 xU1kFjcdxNcM+O4V++vgOQ0MNBMosGW5fGY8rIkvFAERa4pCyu4I09ncp
 8iPaLpc2vNFmthlJ2OQA5CnmOpx18z05XozeVdJBvyrVGS592YAocEMVC Q==;
X-CSE-ConnectionGUID: 1GBDssp5S5WTil1oEwYhAQ==
X-CSE-MsgGUID: zbEQtcnaSdqlsa42V/wjaA==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="61771740"
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; d="scan'208";a="61771740"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2025 09:10:46 -0700
X-CSE-ConnectionGUID: 6yOrpfA2QduFdkVo3UzDNw==
X-CSE-MsgGUID: 1AxeGwMgSnqVwO61gcFtZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; d="scan'208";a="144886880"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2025 09:10:46 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 30 May 2025 09:10:45 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 30 May 2025 09:10:45 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.75)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Fri, 30 May 2025 09:10:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tRZl1sigE+oM7X+PVxS2KvJLYj7tHV/dyVe5LINVtVUS79V0JahPAoH+4s/AmVJqHJAeqK2/ciQmXF71+UHuSzelUPL7BEYyJIZzQRqU9nT3MmKn5wdn8XjPY6Z2yb+eXXMFiyg9yiNzHGruk11NJ/YwaRyjiRj8s5BzInAz9pux7VK6bFyyypo0ThU5nJaCGolHMPvwiKw0/tZVgMx8NuYKouDJJdSsyTf7nZqB5Tzlk2x7vRtohsBEzuOL3O8H4R8Mc7qjl1d3EPOL4L1Sl8RXCrcV1cB7AXsxBP3riwr01EQQGYpjb2xAdLu5+Del3QfZSFJEEy4KpjMrfe7XMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=go6ZULNU/SG0XJBd3KpAtYchbva1GLmFcgOrdRwz1qA=;
 b=yfRqyf1DgqEEMmzsdYDm9k98FDXiC1mwl1nrFiomdpawBNQCOInlgZ2+LKM7zYfWV5gc4SVO0yaX1puoJSw8D6DynZsWAvgTGeStW8e1+rA//8Cs5cn2lR3GYvrY+7Z/QBCzI7waE5Eg3650y6NQOGjjJnxgTLKon0A3ymIazl8NDHYWM2E6/mIX5AAlepQAK3q1j/22y6UFFcTDKnixB/vfPBem+efHPV5P63JuPN8xR9pGeuwL7pxertmsSDBKefRaTxqNDLzzLD8iP1TneJzbiyT0V4bgslThVBCG8XSKgi7bzPSZprAqKuSndH8pdr+cKTnlZO1yi0Y2sAmmDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5703.namprd11.prod.outlook.com (2603:10b6:8:22::5) by
 SJ2PR11MB8404.namprd11.prod.outlook.com (2603:10b6:a03:53f::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8769.30; Fri, 30 May 2025 16:10:28 +0000
Received: from DM8PR11MB5703.namprd11.prod.outlook.com
 ([fe80::f734:e507:3083:e454]) by DM8PR11MB5703.namprd11.prod.outlook.com
 ([fe80::f734:e507:3083:e454%5]) with mapi id 15.20.8769.025; Fri, 30 May 2025
 16:10:28 +0000
Message-ID: <3553f342-5b1f-4dc9-baaf-9fddf925ad19@intel.com>
Date: Fri, 30 May 2025 21:40:18 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] Utility function and macro for telemetry reading
Content-Language: en-GB
To: Soham Purkait <soham.purkait@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <riana.tauro@intel.com>, <jani.nikula@intel.com>
CC: <lucas.demarchi@intel.com>, <ashutosh.dixit@intel.com>
References: <20250529175752.1222913-1-soham.purkait@intel.com>
 <20250529175752.1222913-2-soham.purkait@intel.com>
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <20250529175752.1222913-2-soham.purkait@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0028.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::16) To DM8PR11MB5703.namprd11.prod.outlook.com
 (2603:10b6:8:22::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5703:EE_|SJ2PR11MB8404:EE_
X-MS-Office365-Filtering-Correlation-Id: e4b1d6fe-09ec-4423-b7bf-08dd9f947d91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NnkydG1rbjFpV2hRT0tyNll6ei9ILzg0RDhvUlZILzlvRmVMOU5LTUNkVkJw?=
 =?utf-8?B?QVdNcHVob1p2WnRMUWlSL2pDZnYxSXVSendqaXNYS1lQc0tNOVBpSlUzM0c3?=
 =?utf-8?B?MkJHckF3MTM4QmhFOXNjalphNjFLVTJSdnNrK0FUdTVzSkVyK1F0SS9jODN6?=
 =?utf-8?B?bTkveFZhRWZZc0VwRVZ1SXNYWStxaThBZFRGd3hpanRQUlZvRUpBcXBJbDZO?=
 =?utf-8?B?NzVpNlN1QmFwcWR0UFFTei9QUVlrK0dIZWVnbzk2V3RoQVZkSFBDTmx4dDJ4?=
 =?utf-8?B?TlBucDhsSW5LSUtIQjNsMk56aEpyRzU0NU1tUnlFZVZYUFdtMFFVcmlYaXFl?=
 =?utf-8?B?ZG1ZcmZuQWp3Y1U5ckFrS0kxVFo1VXBUWEZBRXBYdStlMWRTdDBmV1dqVzlq?=
 =?utf-8?B?emRHTlkwK0ZWRWNHZDY3WmFpZnNCeWh3YllNUGFsdkFCRUhMeHFzRGRiN0VN?=
 =?utf-8?B?YjQ0ejJualZCWm5pUFV4ankzSjV1K21uT2NtRGlKSUYxN1lUbDk5eXZWRlV6?=
 =?utf-8?B?ZFc2bXo4YlUvd1ZwV1orQXBWQmQ1ejk0VDlJVE9Ya2JxNVlteTlyZG9LUjZO?=
 =?utf-8?B?ZVpIdXBGSEZra3NkcG9mdW1kamN1YURpbnpGWjhoZTh5TlRPRkxEcFNLMWl5?=
 =?utf-8?B?UW5Vb1NPMjdtd2R6WVczejB5RE9hazFveS8xc2txS29qRktMSlJ0WW1vUTM0?=
 =?utf-8?B?dU9DM3hZNzNYY1RrbFlEU0xFZWg3OEt0NDU1eDJEdk5KM05XMkpNa1F0ZFU3?=
 =?utf-8?B?N2dwS0llYlF0d1ZKWk9kVzFjelFPVGZjejdvTk5Ld2FnU3V4N0o4SmFxZXVS?=
 =?utf-8?B?eDFRd2NaWjBwK2Q3bUJ2TTJaL21SeEF4eVFTb3lBdGlDN3J6Q2hvNzNTUmJS?=
 =?utf-8?B?ZHhTenZGWFJ0MXZGMXhKSndIUE90blppZytWSE1ZVGZYcytMbjMwVEVwQU1S?=
 =?utf-8?B?NTFhVG15eWhoQTh2M0tEZDRvVGgrQ1A4eUM3ajdETzdicWplRERQRTlnUnFm?=
 =?utf-8?B?QlRyR2ZoTVQveW0zeEQ5a1EwWE9ITTMwMmgrK0dLN0VXN1doV0hsSUxKRUxY?=
 =?utf-8?B?R2Q4TFZuNzdXa1dSTytuVXlKbm9zSCtmZW1YSDhqRG1rUXVxRlJlaXhEc3Bz?=
 =?utf-8?B?eUpKTVJNVkpyUitVTW82L1UzOHMxSVJ0dXdzVkIzS0FpN3dmRDFhOVNwemhs?=
 =?utf-8?B?b0U3djhCL3BIZG5QT3FjZHpJdVExUlVYbUF3YlJ3SGh3b1o1Z3MvM003YVha?=
 =?utf-8?B?WDRuVXhZZC80VzhmV2E4eGtlM2ZUOVUvQ0ZCR1B4QlVoTXhGY1V3N1BJZFpT?=
 =?utf-8?B?cEY5QTJOZ0xsSzE0ZTVvUWxQMy9pTjY0WWhPUHN0OWZtQndUbnhKTzJna214?=
 =?utf-8?B?U2FSZUtPRGhLOFRwaHhkWjZIdEJ0NzQxdkIxcmdVbkFnekFaaXpvWU0rdDNu?=
 =?utf-8?B?Z3VwOGxMZ2VqOXNKYU1NeFFDMDNEaXJNTzRNaWVtU2JOVjUvNmtYTGpSSjBS?=
 =?utf-8?B?S2xFQnA4RVQvNHE3czBnZVFpRlhhSEcweWZBd0wwenova0g3dHdjWS95d2Ji?=
 =?utf-8?B?VUg4YzRLSjlaRFU0emg2UzAzV2JmbTZrbkV4UGZIRlZldGx1YytJNHY3bkZ5?=
 =?utf-8?B?djVEQ2RNR1VvOFVHOEQ0aktwYWx5UzZSYWx0ZjJnYkUzb2d2R0VXN245MThX?=
 =?utf-8?B?UExpdjZnTmludFlXck1BS0hLMmdrZ215WVV3QjEreDBMTjI1aUY4cWY0eTJL?=
 =?utf-8?B?Z3Rjeld1cFJBNDUrUXZkU25QRGJNWkVrTDM5azM2RFNDMDJQN280WlUwRFNu?=
 =?utf-8?Q?E/bIPa9a6YxeDz//BtwqiJxU1eb7Ghiv/Y5NI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5703.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M1QyQnVQUlJQMmlJdnJoVllaQkhPM0tmYzFnTHVpODEwK0xkbDllMUF3YURl?=
 =?utf-8?B?RmJxSlFwQ2ZvdXZkbnludVFaUk9pMHQvS3k3NVdzajJTT0FSOWF6dUozaTh0?=
 =?utf-8?B?V2FOaXM4dnFFd0RSS1lJWDNMZmliUjBCZkQya29iTkpoNU9OZVhpZWVBUG81?=
 =?utf-8?B?N0hFbEQzRENhbi8wMEcwZmF3TUhacjdNQzNMZllEZUZLSGZITGZJYTZhaVFQ?=
 =?utf-8?B?V1JHcndJSk9jRU9xRE8vRDgwVXc1b3pDS2dXd2g2OVo1ZDE1VnlNd2U5Wkk3?=
 =?utf-8?B?YnJXbWhFMjZSTW1OaDd5L0pSNjRMaER1S3JlK2xndTBRNW1la3hjcExESEhE?=
 =?utf-8?B?ejkyT04rS3ppWmdHZlNyTjBWN3J2MjI2VWV4SkUxTkJTdDN0dXVpSElGR2sw?=
 =?utf-8?B?ZW9LZkRmbER6MS9reFZ2K2VDUThLWEdFMDFQWUZWZ1Ivcm1WZUJJRVBWbHFh?=
 =?utf-8?B?TEZ5TTBZNXFyb2JNVC9GTzFxaG5VamY5bFR5ckZLWEpIWXFHNnNVaDZnZUN5?=
 =?utf-8?B?QVplT21KQ3I5R2JtVnova3dvV3gzN2srT2hNWnl0U1dVMFZCT2pwVW91dHF6?=
 =?utf-8?B?MWFKaE1TVlIvc3ZXSDAxZTh6UW5scmYxV3lOY2xBWk5XdWVrT25RMXV4UnE4?=
 =?utf-8?B?TUxaZWRYWTZZSzl1QlNCS0FldkpQRVlxcGJXRGhpTUJoMjdpS3h5eGFNeWVK?=
 =?utf-8?B?T3dtcHpVUmkydXpLa3ZCMTFiMTc0YjhPU0pURlFqdVYzU2JlZ1FGRmdqeElo?=
 =?utf-8?B?bXdJTFRLdEdKclJCblc4d29YTnd4N0M5QjdLVXk3ZmFjNVk1c3ZCRkxieEhZ?=
 =?utf-8?B?Z0MxY3NDRWxwRExiUytWck5iT2xwMGVwcWFyT1FlNE02clBlTUJMWXBtYVE3?=
 =?utf-8?B?bkFNSlhwS0lpbXFEVEdJMUV2ZXNyYTl4TndUdm1uQWNhVHhwM0ZyZDlOUEJ4?=
 =?utf-8?B?RS9TejBIU2s0WWJWV0JXTkFhWVZaOFF1eG0ycnIrWnlscFhBTERGUTNOQzU4?=
 =?utf-8?B?RG55WnFnMzYyc1Q1bHZKMm5TcHRmSjVORFFWSjJ0MFYwZjFaSnZmNFR5OExV?=
 =?utf-8?B?dHhyRDRaa0tFbnlsUTRGRUdsR1E0Nkc0bEFnNHBzUFB3KzNUak5ET29acjJZ?=
 =?utf-8?B?NVp5NmI0ODg4T09peGtDbWJkOE1OYWwvbTJMV2t5V01OMDVZV082VGFHMWx2?=
 =?utf-8?B?ckEwY2NpRFIvQi84VHlhSHpQazJFeEIzTExXL0N4bEZkNGpYeGZwOHRRcmdP?=
 =?utf-8?B?VnhLeGdacVZkV0dlbndUTXA1d3VyR1FhWDlucnMydlZ6UUNRL0JiY3ZwWXhU?=
 =?utf-8?B?RkcvME5qempFSWVjWnRLeHpPdUNXR3ZjWHNSWWg0SGtqKytUc1ZnSkpUWDFD?=
 =?utf-8?B?Znk5bklkOWZiQzU4WUlJTHk0UnZBNS8rUmp1a2xxZk1LVGZOVklPRDEwajJZ?=
 =?utf-8?B?SUF5cUVQcVNLTXFkNVlLWXVtdUxWN2ZuNGxaeE5YdnhINHJrekM3R3YrUmQw?=
 =?utf-8?B?eGtTUjFmVG1YVmQxekZqTDJvcXJmRzRsbTZ2MnRoUXdQMUhBSG5JK1o5Zkgr?=
 =?utf-8?B?N05FNDYybzRjc0ZickdYTUlUZ1NTd0ZISUpxdk9jMWpBTU0rRDN4bmlGSU9j?=
 =?utf-8?B?eXRCWUw5SkhKdVRDRzF6UVJwbC9mSG5kMnFOTDRvMmoxNFlkZDU1SjQxMFls?=
 =?utf-8?B?aGg0ZklMN3NCR3hQUjJWaVdtcDAwUVVKMUN4MFpEZ1ZsMjVPQk96SkMrY2ZD?=
 =?utf-8?B?MG1FV0JXRHEzRUxFUmNlOFpxaG95OXBja21tRm0xMURnUlVPV1JFZWtOTGUv?=
 =?utf-8?B?dXkyQzIzd2JjMGtzTzNjWElZc2ZFYW9oQTRvQkRzNDRQd3RybmNhYThoRWd2?=
 =?utf-8?B?QzAxSUJyWmVJc1U0anprK2lrb2daMnVTelRnVWE1Tzl0T21tTlNGZGZEQzZX?=
 =?utf-8?B?MGtJRFR0TTdoUGN2cjVyUmhyLzNwTEpuNUppSmpHTjVlYTEzdFdJQ3RIUHlP?=
 =?utf-8?B?VFBUN203ZDh1N09DQ2tyZ28xWXpiK1NvNkppdnA5Q1hjNzRWVEJDSlBWQ3da?=
 =?utf-8?B?emluTVFGODFpdjB0ZDVqS0N3VzkyZ0srdGVwZGNQQ3N4dVJXMVJ6My9xSi8w?=
 =?utf-8?B?dk4rYkVSaFdNMnFMMTVuOWlDanVRYUNISnVqcFozUmRHZzNLNFQxZmlPTDR2?=
 =?utf-8?B?WEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e4b1d6fe-09ec-4423-b7bf-08dd9f947d91
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5703.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 16:10:28.2305 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Knv3aBvLlvnkia9zw4mrXrA2pMmN7t5zULO3OTvMEb5n3tXprNC62aAUzJSSuRRUbpf0+Jyefqa0RbjGeuRYeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8404
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

On 29-05-2025 23:27, Soham Purkait wrote:
> The changes in this patch is taken from
> https://patchwork.freedesktop.org/series/149026/
> Thay are  added only for compilation and does not
> require review.
> ---
>   drivers/gpu/drm/xe/regs/xe_pmt.h | 5 +++++
>   drivers/gpu/drm/xe/xe_vsec.c     | 2 +-
>   drivers/gpu/drm/xe/xe_vsec.h     | 5 +++++
>   3 files changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/regs/xe_pmt.h b/drivers/gpu/drm/xe/regs/xe_pmt.h
> index f45abcd96ba8..b1d4504e4adc 100644
> --- a/drivers/gpu/drm/xe/regs/xe_pmt.h
> +++ b/drivers/gpu/drm/xe/regs/xe_pmt.h
> @@ -10,6 +10,11 @@
>   #define BMG_PMT_BASE_OFFSET		0xDB000
>   #define BMG_DISCOVERY_OFFSET		(SOC_BASE + BMG_PMT_BASE_OFFSET)
>   
> +#define PUNIT_TELEMETRY_GUID		XE_REG(BMG_DISCOVERY_OFFSET + 0x4)
> +#define BMG_ENERGY_STATUS_PMT_OFFSET	(0x30)
> +#define ENERGY_PKG			REG_GENMASK64(31, 0)
> +#define ENERGY_CARD			REG_GENMASK64(63, 32)
> +
>   #define BMG_TELEMETRY_BASE_OFFSET	0xE0000
>   #define BMG_TELEMETRY_OFFSET		(SOC_BASE + BMG_TELEMETRY_BASE_OFFSET)
>   
> diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
> index b378848d3b7b..a46e9580b1f4 100644
> --- a/drivers/gpu/drm/xe/xe_vsec.c
> +++ b/drivers/gpu/drm/xe/xe_vsec.c
> @@ -149,7 +149,7 @@ static int xe_guid_decode(u32 guid, int *index, u32 *offset)
>   	return 0;
>   }
>   
> -static int xe_pmt_telem_read(struct pci_dev *pdev, u32 guid, u64 *data, loff_t user_offset,
> +int xe_pmt_telem_read(struct pci_dev *pdev, u32 guid, u64 *data, loff_t user_offset,
>   			     u32 count)
>   {
>   	struct xe_device *xe = pdev_to_xe_device(pdev);
> diff --git a/drivers/gpu/drm/xe/xe_vsec.h b/drivers/gpu/drm/xe/xe_vsec.h
> index 5777c53faec2..6184b875e4b1 100644
> --- a/drivers/gpu/drm/xe/xe_vsec.h
> +++ b/drivers/gpu/drm/xe/xe_vsec.h
> @@ -4,8 +4,13 @@
>   #ifndef _XE_VSEC_H_
>   #define _XE_VSEC_H_
>   
> +#include "linux/types.h"
> +#include "linux/pci.h"
> +
>   struct xe_device;
>   
>   void xe_vsec_init(struct xe_device *xe);
> +int xe_pmt_telem_read(struct pci_dev *pdev, u32 guid, u64 *data, loff_t user_offset,
> +		      u32 count);
>   
>   #endif
These are merged now 
https://lore.kernel.org/all/20250529163458.2354509-6-karthik.poosa@intel.com/ 
, you can rebase on top of it.

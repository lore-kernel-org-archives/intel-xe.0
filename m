Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 438A0C61DC6
	for <intel-xe@archiver.kernel.org>; Thu, 27 Aug 2026 15:16:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E612510E852;
	Thu, 27 Aug 2026 15:16:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q+OFitQJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA50510E852
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Aug 2026 15:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787843801; x=1819379801;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=hy8o90R8YbpInxn4s2dq7PDfPAgvY1wuV2RX/of1ymE=;
 b=Q+OFitQJC2OmJQkr2gsZFK8xEzV1VuyfvyTBqnT+IXjD5Cv2DtYgrRRn
 FUkc/IrU3MO0q1qWgeCBmFOWy5iiii6T22/9ZhRllpM5yvv6ig4Akn4kN
 W3WAgQWaVY7+hNYMcw5CCnv57viWuTQ87Bh9+qDBYsnQd+SQ0/na8Hc0k
 4P2uD98mOs1kXkZ5Q/09CiXJXNtnCrD/zW+muwI6moBuDea/bzdmkONar
 vKITEtUy3sf8YPVPGBOlJ7yItS1d7fItjd6aju/UaEBOCqwH+H33Mb4sU
 1ECGinK8HZe2o0JrmuquiYrKe135I1KMstra8tHZQ7GrNDsJ9yPgMxl4j A==;
X-CSE-ConnectionGUID: vt3CDXZNQsGepH9QXZWQ6Q==
X-CSE-MsgGUID: A43w9Q1xQui6mDIUjqVXjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11888"; a="88399590"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="88399590"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 08:16:41 -0700
X-CSE-ConnectionGUID: XvNDojMgRnqotBo2VRM1hQ==
X-CSE-MsgGUID: RjYerMD7SMui30/0yQ6mXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="292723668"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 08:16:40 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 27 Aug 2026 08:16:39 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 27 Aug 2026 08:16:39 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.49)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 27 Aug 2026 08:16:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=edipgjOjsxiSMGNb3NXyfUa4Y49gEocxi6DBs5v/2+IYZ2axbTsWAAba3sJZUlA4OweMd4lQxgd3TqsX/J37C8rnnapqrjKFzuaYpUTwkM+TE+EjcruyzCD5/uQF2uhc6arq6fcuLSJDm8dHFObucDZuqyd+sYegMVlV/tZtftp6kX6/MzX7kEdpN6wZpqnBwbiGo6IKt5zI9Ws7GV3f4MAHn86cMjOkuevnbmlvUbxsve+1DTs+QMg5PwpYaIdVCm8kcBkVbKMkiOYY5lOuGIwzfooh3vE4Qp5Ombc1ea9P05Uv+LJ8dipVPD/WQn7f5ZoSGris/7NKrj74qrvD7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VhdQ+1P+Pkwoh+jodlZQDrU17dpEC+DocCIsV7nLl4E=;
 b=iJX4MF6v79bld/4AP4WguG+CiOwf4kNxUMnPp8EEBx3jxtYtYZJfCJ2ptEEfTPmAFT76xul3aueoGSiuUMEj61Li2SkGItkQLtZ8P8pvqN8eOhr+QRDpFq8c0Z5Py8VblZeLXt+HDdAjzNtmJgqVmfvxgwrxOhvcZqHYEPQ5FaeExyqTWVzAoQaUDifqu3/fZHVTS8T+FqqlAL3oQcTQ61K9aisFJLWmVmZhJfTy3UHQQ89J97JjyvekrvNLYV9T34ZZweTl0dT9B/psQPUDebX1N0luYaznb21mzNHc/OZ2Sa1K1SqOm5Yo3uga+3CSJcrsRx40QQrRvU1TdT74qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by CH8PR11MB9507.namprd11.prod.outlook.com (2603:10b6:610:2bd::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Thu, 27 Aug
 2026 15:16:37 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0360.008; Thu, 27 Aug 2026
 15:16:37 +0000
Message-ID: <c0ad1040-6155-4a7c-a92f-ea263514ae43@intel.com>
Date: Thu, 27 Aug 2026 17:16:32 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V18 12/14] drm/xe: Expose bad VRAM pages via debugfs
To: Tejas Upadhyay <tejas.upadhyay@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <himal.prasad.ghimiray@intel.com>, <rodrigo.vivi@intel.com>
References: <20260826135136.204044-16-tejas.upadhyay@intel.com>
 <20260826135136.204044-28-tejas.upadhyay@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260826135136.204044-28-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR06CA0226.eurprd06.prod.outlook.com
 (2603:10a6:802:2c::47) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|CH8PR11MB9507:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c817533-d1b2-4f99-3825-08df044e300b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|56012099006|10067099003|22082099003|18002099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: dYwov29TnCWhEGBTLYqdk03DWs8Z5Wol5qobQWgYXJgEjQ01rNiD8NPKdpgj4ISI5C0Eo8vyirOywHX9azC/a/J2Q1CsI95k24Kwr326o+3W0KAyzCiSpTTXXVudqcVmHUmdieLsr/IAVw01CBx1ou2kUP+ZlZudFmfdQ/erGHpm9bTTVc/ONGWnNtt/F/TnCve8xaZ4xqTpe1SPNMCLcwDH+NwZXdK5wsOg1pXSxWIm+RBKkeKwLkax4qecvvbwWx+fAomv7HYqWKSPemcoSEN7S1HlNvY+sxTSiUrhtpn0VtMjPUnSf3UDCz4aRvJPZ9RvC0ipzap2ImzMBcq5WI0/F//DwQGaW1maR3vAI93+YqisGO2tNQZZqjdLM+V25mdw2ZHezDy78D/DeTQWoC/B+HuOhvx5iZE9OsBIv6wKyq16p6O/yzxMXjFcTch572a93fIluQvCfWxLJA4hGNpGvfi+vyg98+e9AlVUb43haxUftfVSda0VnTknETnORcG3Aff56Enu+1HUh0xkyyRI+MTx+uxCN4ZaMajoeMKkyLLVPUcIv2JfnrhX3FO5BB1rlWlfOSc8FPzPE3pab78dwBB6L+VVHq0Q7TS83gRWYNxoAFCQzPNSw9okiBr8u5/Qtd/WV+RG+vTVPFUToTVUE5aGxuz1azSYmFqVih0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(56012099006)(10067099003)(22082099003)(18002099003)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MjA2WkZaOEVvd3hrdTBwajNTaVkyd1NYTDVjNHo1NTh1RFBYMzFTTUdSdjlI?=
 =?utf-8?B?VWR4WlhkdHJmclh6UldsRDVwZEh4WHp0K1hDc1RBd0FiNG1GcDV0UmlqSXBu?=
 =?utf-8?B?VnVIUGhZUFFaT3ZNSk9tK2xxaVJwaDFBOXdQeFh2NVd1UU16Z0tSTVpsSjhF?=
 =?utf-8?B?ekRDb2dNUzVZNWNpV2JPMUVYaXJodm1IUHUyRFhzYzJvdHF4bnp5K296RTA2?=
 =?utf-8?B?ZWpqR1lLZ0RtNjRiWkd2Zll6NjNIRllBL3YrZ3BZWlpma2M1aEZ0L3Avck1m?=
 =?utf-8?B?NmJybEtVaHc1QnVKNzdzOVdpVVR5ZnI2TWRoRkxpZW4zVFQ1cVJMYnNmeEVn?=
 =?utf-8?B?ZkZDOVd2UDNJT1MycXYrN0RYdCsxUFREWG9XMkhHMHgrYzVoUFFKK2t2VWw3?=
 =?utf-8?B?QjJQaHNlQ05NU2l4RVBWMzVQUlRkdUhJLzIreW43dTg2Q01SMlNnZW5XWldH?=
 =?utf-8?B?QmZmSm9SUDRtZ1ZJVW1kRSs3eXB3bno0MmlpR3duS0pmZUdvWmpLT29aZHZ3?=
 =?utf-8?B?YmNONS9kRVJ5VkV6SzM3OUppS01jTkVvTGhFcTRldXJ4K2ZtbDFHK0VDZC9M?=
 =?utf-8?B?T3J5M3pHenczUDd6UVIxQWM1VUpCdE5PVmk5UXZScGYydGtCbHREblZrV2J5?=
 =?utf-8?B?N1VsN3hKZFk1OXlXNWNQNTBGenFlaDQ5UFhVeFJnREdwRVV5RXplODE5Y3NJ?=
 =?utf-8?B?MlhVOTZsZDRwS2IyWEZEZTJLYXJVejVPVUltK3JjQVppMHRab1ZVdnQ2Yjlr?=
 =?utf-8?B?N0E2dkZYdHdkTkNXRFI5RVdPNDVodWZBOTYxb3RVYXp2VlZKYkwwU0E5b1lK?=
 =?utf-8?B?cUVkc01hR1NnRzNoRHpQaHZoalVuQlVPR0FzR3BLVTFrZktlYk90T1p0TWs1?=
 =?utf-8?B?aDQwRTJRUTRBU1pwSHpUVTNRazAxcld0TXFSTGtYOFl3NFluSlhvOW1SRmpS?=
 =?utf-8?B?ODRZTmxudWNhNEdQcHBlWWZpTEJDc2M2QmExSWt3eE5vcGtIQ1FJekk3UExX?=
 =?utf-8?B?S1I1S0llZ2lSOVp3WXZhRVdyRldGelNtUUZydWV6YVlQK2djaGZraFVjQUlr?=
 =?utf-8?B?UVlUaklLRXRNQXdrVGJBTDVDL2tJL3ZEcGlraWxoNDBhNDlxVE5NTk5WQnNu?=
 =?utf-8?B?Kzdzc2gvOHdPcDc2T2dIbUlIVFRQOXdwREZCZnE4SG5EQlBMSjJMeHo2d3JS?=
 =?utf-8?B?a01WT1pTOEppRkRwY09wUzdvR1dGVFpHem5RZnV2dyt4MEI0QlJFd3U2VTBh?=
 =?utf-8?B?WWZQaUkxNzk0Q3pKc3BKbWxVbUJ5UjhIT2lweVNrUTZFTktybUNucDkrL09W?=
 =?utf-8?B?QjNsSXQrem9JenZtMlZXZ3R5Wlk4NXVIWkk3RlIvRDk2K080cUVwQ0h3ZDhl?=
 =?utf-8?B?V1k5NE14elY0eTdpZEFkaDV5V3lYWVR5WUFLRmd0eTdPbWo4N0M4UlRGTUE1?=
 =?utf-8?B?N2F1M1J1RnZ2Y1N0aHZLNkgyUWJHT3k2dWtLVnE2L0QwUjNXck1VckNGMDRJ?=
 =?utf-8?B?TllmRm14SzFyaGFqQnJSMFJoU05xMHZwTVN5TlFCMHdDY0dGb2NzU3kyY3VZ?=
 =?utf-8?B?UysyRGNKb3VMNkZxOU1qMDI1T1VTelEzamVleVpEQlNWUU1zMnJ3N3hycHN2?=
 =?utf-8?B?RFFsalVNMDVFMElOY3ZHdk8vVGR2WHBrQVJpWVZFN0xuMWhDNEFRcUE0Y1A3?=
 =?utf-8?B?am56Y0hHQTEvaU1hVENHSTNGMkU1R09uZW50alJGVjNJc2M5d09TcElFWG1G?=
 =?utf-8?B?a3pyS2RBSDZKUlVRSXZnaVNUK1dlTkVuQlZGVFU5QmpRVVVzYkQ2K2E0S05a?=
 =?utf-8?B?ZGM1b21uOG1FTWFQTzFJOWZNQWRMaHpIUGdwU3F4VkxTeXhSQnhLalNXNjBU?=
 =?utf-8?B?MEs4d0JkOVdyUlJwcXRNWi9qQ1d2VWczRCtHcHMrNWxQVVljNDNwQXhJZ0g5?=
 =?utf-8?B?a01GYzAvOVZmRitVRUJLaXV2SVUyUXIxV0JOMDhzOU5aNGZWSXI3aGM5Z0Jq?=
 =?utf-8?B?VTVEUW9NOEJXcW1WdVNiN21GQXI0dEZ5bmFTRHhCRUxNYis2ZnRnRjg3cU5F?=
 =?utf-8?B?NnBCS0RIaGFrRmtJejEzdStDdklva3pCdVV2cldPdENWYmZoM09melBMTUhw?=
 =?utf-8?B?WVo1WnRqYzFvWk0xUkhHUzFWMUhlZHJaWDZRbjY0by8wdFE5OEpUVjlRaEZV?=
 =?utf-8?B?c0Y4QmFTYU5TV1dVQ0NzbmxBd0tUdkdCeTg4a3hlYytYR0h0cURxMTExb2oz?=
 =?utf-8?B?T3VDcW5Db2hLV1M3VDk4clFEOWszV0Z0bEV6bnRaRGgyNmIrd1Zka0gwY0Nn?=
 =?utf-8?B?MmF5M1V3K29DT0lackpueHdHR3hSdXhISGFaTHdxRHdleWQxY1F5UEZxRDR5?=
 =?utf-8?Q?3JJwVSdO8vfdP4mQ=3D?=
X-Exchange-RoutingPolicyChecked: iKJCEK2bvdYsOw9Iia7CG/JzFz9Q6CoCZeRPDsKEBCPJnW62CTZyp7zN07VGjtZkGCVu6dpYJdunbUqvN306Vzokis1rzcycQjznK75bXB0lROEJ+MYQd1HeFiCVI3Q565FeeXs7IesyoYUBU0Z1SPgvru+HrqpzzeyOyO95bAQbkonTMq2NAZe01IYfSCaLqXw3q/JnVuF7qxI33A3GfPyMa7Ji7CjVin2Md3c8ci6Z9UhSNxdD3lG2ZVTfXbZoMQLFOsqrAmH/1fQ99iAoVhRbVYirPXWWuVOIO38d96SdnajeBT9x0TMmPKIXykXblckqNf1mRjW9CAv4TM8cCQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c817533-d1b2-4f99-3825-08df044e300b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 15:16:37.2218 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fmnrIAIXda77HzeqSMTsDyKlxzl/G81XpMHf2SleoQ/+Qe/YMq0GP3ja3W93YnmFPvflGz0hNd3cKDtZnCmP5OpW+q8KpYV6glEKXs4gehY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR11MB9507
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



On 8/26/2026 3:51 PM, Tejas Upadhyay wrote:
> Add a debugfs file "vram_bad_pages" that shows offlined and queued
> VRAM pages across all tiles. Each entry displays the page frame number,
> GPU page size, and status flag (R=reserved, P=pending, F=failed).
> 
> example,
> cat /sys/kernel/debug/dri/0/vram_bad_pages
> 
> max_pages: 10000
> 0x0000000000000000 : 0x0000000000001000 : R
> 0x0000000000001234 : 0x0000000000001000 : P
> 0x0000000000080000 : 0x0000000000001000 : R   ← tile 1 addr (includes tile offset)
> 
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_debugfs.c            |  4 ++
>  drivers/gpu/drm/xe/xe_ttm_vram_mgr.c       | 66 ++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_ttm_vram_mgr.h       |  2 +
>  drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h |  2 +
>  4 files changed, 74 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
> index 28135f84e286..e19eafffbb08 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -32,6 +32,7 @@
>  #include "xe_sriov_vf.h"
>  #include "xe_step.h"
>  #include "xe_tile_debugfs.h"
> +#include "xe_ttm_vram_mgr.h"
>  #include "xe_vsec.h"
>  #include "xe_wa.h"
>  
> @@ -773,6 +774,9 @@ void xe_debugfs_register(struct xe_device *xe)
>  	if (man)
>  		ttm_resource_manager_create_debugfs(man, root, "stolen_mm");
>  
> +	if (xe->info.platform == XE_CRESCENTISLAND)

maybe better to move that check to xe_ttm_vram_debugfs_init() ?

> +		xe_ttm_vram_debugfs_init(xe, root);
> +
>  	for_each_tile(tile, xe, tile_id)
>  		xe_tile_debugfs_register(tile);
>  
> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> index 24d134754265..af9e1fa868d7 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> @@ -5,6 +5,7 @@
>   */
>  
>  #include <linux/cgroup_dmem.h>
> +#include <linux/debugfs.h>
>  
>  #include <drm/drm_managed.h>
>  #include <drm/drm_drv.h>
> @@ -874,3 +875,68 @@ int xe_ttm_vram_handle_addr_fault(struct xe_device *xe, u64 addr)
>  	return xe_ttm_vram_reserve_page_at_addr(xe, addr - vr->dpa_base, vram_mgr, mm);
>  }
>  EXPORT_SYMBOL(xe_ttm_vram_handle_addr_fault);
> +
> +static int vram_bad_pages_show(struct seq_file *m, void *unused)
> +{
> +	struct xe_device *xe = m->private;
> +	struct xe_ttm_vram_offline_resource *pos;
> +	struct ttm_resource_manager *man;
> +	struct gpu_buddy_block *block;
> +	struct xe_ttm_vram_mgr *mgr;
> +	struct xe_tile *tile;
> +	u8 id;
> +
> +	man = ttm_manager_type(&xe->ttm, XE_PL_VRAM0);
> +	if (man)
> +		seq_printf(m, "max_pages: %d\n",

is this the same value for PL_VRAM1, VRAM2 .. ?

> +			   to_xe_ttm_vram_mgr(man)->max_pages);
> +
> +	for_each_tile(tile, xe, id) {

as we loop over each tile, shouldn't we add this "bad_pages" debugfs
entry under separate tileN/ folder ?
> +		struct xe_vram_region *vr = tile->mem.vram;
> +
> +		man = ttm_manager_type(&xe->ttm, XE_PL_VRAM0 + id);
> +		if (!man || !vr)
> +			continue;
> +		mgr = to_xe_ttm_vram_mgr(man);
> +
> +		rcu_read_lock();
> +
> +		list_for_each_entry_rcu(pos, &mgr->offlined_pages, offlined_link) {
> +			block = list_first_entry_or_null(&pos->blocks,
> +							 struct gpu_buddy_block, link);
> +			if (!block)
> +				continue;
> +
> +			seq_printf(m, "0x%016llx : 0x%016llx : R\n",
> +				   (gpu_buddy_block_offset(block) + vr->dpa_base) >> PAGE_SHIFT,
> +				   gpu_buddy_block_size(&mgr->mm, block));
> +		}
> +
> +		list_for_each_entry_rcu(pos, &mgr->queued_pages, queued_link) {
> +			u64 pfn, blk_size;
> +
> +			block = list_first_entry_or_null(&pos->blocks,
> +							 struct gpu_buddy_block, link);
> +			if (block) {
> +				pfn = (gpu_buddy_block_offset(block) + vr->dpa_base) >> PAGE_SHIFT;
> +				blk_size = gpu_buddy_block_size(&mgr->mm, block);
> +			} else {
> +				pfn = (pos->addr + vr->dpa_base) >> PAGE_SHIFT;
> +				blk_size = PAGE_SIZE;
> +			}
> +
> +			seq_printf(m, "0x%016llx : 0x%016llx : %c\n",
> +				   pfn, blk_size, pos->status ? 'F' : 'P');
> +		}
> +
> +		rcu_read_unlock();
> +	}
> +
> +	return 0;
> +}
> +DEFINE_SHOW_ATTRIBUTE(vram_bad_pages);
> +
> +void xe_ttm_vram_debugfs_init(struct xe_device *xe, struct dentry *root)
> +{
> +	debugfs_create_file("vram_bad_pages", 0444, root, xe, &vram_bad_pages_fops);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> index d5392beff30c..f354c26c4257 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> @@ -9,6 +9,7 @@
>  #include "xe_ttm_vram_mgr_types.h"
>  
>  enum dma_data_direction;
> +struct dentry;
>  struct xe_device;
>  struct xe_tile;
>  struct xe_vram_region;
> @@ -32,6 +33,7 @@ void xe_ttm_vram_get_used(struct ttm_resource_manager *man,
>  			  u64 *used, u64 *used_visible);
>  
>  int xe_ttm_vram_handle_addr_fault(struct xe_device *xe, u64 addr);
> +void xe_ttm_vram_debugfs_init(struct xe_device *xe, struct dentry *root);
>  static inline struct xe_ttm_vram_mgr_resource *
>  to_xe_ttm_vram_mgr_resource(struct ttm_resource *res)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h b/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
> index dc97b0ad0e51..efcf3e1d4e80 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
> @@ -37,6 +37,8 @@ struct xe_ttm_vram_mgr {
>  	struct mutex lock;
>  	/** @mem_type: The TTM memory type */
>  	u32 mem_type;
> +	/** @max_pages: max pages that can be in offline queue retrieved from FW */
> +	u16 max_pages;
>  };
>  
>  /**


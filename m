Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23451E7717F
	for <intel-xe@archiver.kernel.org>; Thu, 12 Dec 2024 22:57:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E267210E084;
	Thu, 12 Dec 2024 22:57:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ah3F+b5L";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64DF510E084
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Dec 2024 22:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734044261; x=1765580261;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=kj+1VskH7VoSzSBO8qTXOwZ1YU/MPwYLDTLqpbCnKKQ=;
 b=ah3F+b5Lz99aajUs/LCe79FGf+PGU3y3AlMNGnHeCIFlvAoZO2BlAgEx
 RQB09o6sXXQ/lgkttLm/ZgpFwm91wuKi0T4AgF0bJLLCabq14Um1X291V
 VvDAH6NwFNx94uXWFasKObr3dE2RRCIe9wSzuFnEIoaMG4538CiPb5s0n
 HmFaL5L2UjNMNna3qZaEo0cpE4Paf0bEXWxmWpL9IoO6Fm/aby2vB1aSb
 w7WvcvO8r9yb8i+arc9GBgCIDgZfpO3sYDqSiFsruxRhQjOE08x58iOJr
 pFFRg1sk5KArx0VbWZOOW/SUiFdbTlBr3a+54tHrWqE4mu4QNY4H2AN7Z w==;
X-CSE-ConnectionGUID: +V8whRwrSP6T9tBTtCPKTw==
X-CSE-MsgGUID: 7podMTXdR8+bCpLLcpivUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11284"; a="34724161"
X-IronPort-AV: E=Sophos;i="6.12,229,1728975600"; d="scan'208";a="34724161"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2024 14:57:41 -0800
X-CSE-ConnectionGUID: qXbZTLdGS++vJyqzzPx9Lg==
X-CSE-MsgGUID: 4+vTWm+SQy6/lId0qhtPYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="96796261"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Dec 2024 14:57:41 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 12 Dec 2024 14:57:40 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 12 Dec 2024 14:57:40 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.175)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 12 Dec 2024 14:57:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J2JSo5m4BDC8txsAkoLgKxLPwXggJEjoJB8Bfm1Ll2rGzk8iA6dKa5FZaHdLA4XnZebdO2Le4EXlYGHSUE8x0MfNbYcsG0hUDw4U3z4KaGu4NaBpMMJi/eeQvSRBNw933vQm+PWfD6556vTXDiMqzV+AQqe/MRe/zvGSo5JuaJXO2bKB5TasL68FKeo7d9WI1tsC9N4rV8KdTnupmiVR1jvMi4DoEetdg3UEjOuxm+6PD7dDiubNctaA9c49MIZE8fhDxDkrJntmvy7u7bYQoGmXUrzrxVtwa4Cdc5uHE80D3tNdGmqtrXiovUI4cBsRCcorPjTQkgaMDt4SH2E8NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=883u8UjywCu2jvO/hxSc2Wq2poS/bUDOHryCgcDH1d4=;
 b=askdOYRMQQ5e3OmYwXLmTLMG6zFhBHkWiRItp2asf85ToLRPZGIG4uO7w94CxCQRXktiXkKMv/nuVN9DMZF0GvziQoDZaJ/PpF45IamYmVpP14dJ8bv0nG6YZRdVKlsOuHcdoBm/QofYXP7a5c4O9E8SWxKgfl5TA1xkts0NCK710CGO9J5cEaeWTc49eL2J+Pb2Iuzvoa94vDhvp5fdosU4UoggHxMf5NC7+e5OeX5t1rLlxN80cmU57VV/MV2DP+8qW32YqfRAQGoiW9W7morqSFq2S8C/LiG2bpZO3IpO8VguBT6v5x+McD9LVGPWoOm0fOTodT/A84SIx4rH/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7SPRMB0046.namprd11.prod.outlook.com (2603:10b6:510:1f6::20)
 by PH0PR11MB5950.namprd11.prod.outlook.com (2603:10b6:510:14f::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.23; Thu, 12 Dec
 2024 22:57:31 +0000
Received: from PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc]) by PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc%4]) with mapi id 15.20.8251.008; Thu, 12 Dec 2024
 22:57:31 +0000
Date: Thu, 12 Dec 2024 17:57:27 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <matthew.d.roper@intel.com>, <aravind.iddamsetty@intel.com>
Subject: Re: [PATCH 1/2] RFC drm/xe: Add functions and sysfs for boot
 survivability
Message-ID: <Z1tqV9UpBeG_fITD@intel.com>
References: <20241212054945.1091894-1-riana.tauro@intel.com>
 <20241212054945.1091894-2-riana.tauro@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241212054945.1091894-2-riana.tauro@intel.com>
X-ClientProxiedBy: MW4PR03CA0159.namprd03.prod.outlook.com
 (2603:10b6:303:8d::14) To PH7SPRMB0046.namprd11.prod.outlook.com
 (2603:10b6:510:1f6::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7SPRMB0046:EE_|PH0PR11MB5950:EE_
X-MS-Office365-Filtering-Correlation-Id: b37b4654-9603-445f-7495-08dd1b005b9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TVo2WXpvbkQydk1aOG1kcXI1NVJFNFJINWV5QnNYaGtkYXVmSmhkYVJyRVpG?=
 =?utf-8?B?Um03ck94R0pCM2dpd2d4ZUpOY1gxQnoyR05veEVCUFpxQUZ0MTVyMzhlSzdY?=
 =?utf-8?B?UCtOTWcvV3RvcDVLUkRTY0pQd1IyOWV3TTh0Rmp4Yis0OGE3UDQyc2NNZGRm?=
 =?utf-8?B?cHJWWC93ZER3Z3BmZEhCVW5DekJ2R3hxK3pyWE1JbjBXU3FkV3RteWFhZXZH?=
 =?utf-8?B?a1VEVnpuN2dMcEZmL1hpWEtXNXVFUVN6bUhzN2IrRGY5Z3gyNjlCYjdhYlph?=
 =?utf-8?B?MFliZXVsanZjcEhmanJkTk5DR1BBZlRSYUlXNXZ6NXVtQnBhMzlLZW1kM3RR?=
 =?utf-8?B?RUpKdHBxbUhDNUtqOXdaMmdWS1hNKzZTenFOWWNuZUFGak8rYWs2TmtTVU9C?=
 =?utf-8?B?Y3dpU1JlVWFrMVk0MDMzclBqRlp6YVVUUENlS2l3R2xYMENPU2loSmpyUjhO?=
 =?utf-8?B?S002U0xLZVlCb0hldlRCMWV0a0U2NTM5cS83VnI5RTFrOE1XdHZhTzBkTUZv?=
 =?utf-8?B?QUpGZDBFUWxLWXRSZzR0SnB5R1RRMUhWdS95akdWOFoxSytITUhRTSsxZjAz?=
 =?utf-8?B?UVpScDMxUDJLcDNVSWlvd2ErLzVlVEdnNERCbkx0VFVxSHk2cUhyQUlWenhT?=
 =?utf-8?B?SU0wUnRoNFpEQm9xMlJnc0RpRXI3ek1pK21kZmlVMVYvdmZraStOcXU4R3NT?=
 =?utf-8?B?eUhodEovSGlLOTh0aGowdGpGeUZQdHlNQjZJRURYSzdmbU5UVSttcTB4S2Jy?=
 =?utf-8?B?RGpLS2ZxN0JTQnN0Yjd2Y09JV1MydlppTExDbDdZS0hnWWRuMTYrRjFnSTEx?=
 =?utf-8?B?dVEwelF5d2JSMlIxcjgwMWlpakd6K2dhKzJVeGU2TVRjdTl4QVcrZDZBODR3?=
 =?utf-8?B?aEtINnhDMVIxNytDa0N6M2UyRmhreHBNcFN2d1FzOGN5SU9uK3ErdGpJUnJ5?=
 =?utf-8?B?dCtOS01yOEtESi8vYWl6TkxKbTBjMjRKWFpnOFB5cTFwUkY5SkFMUS95dTlo?=
 =?utf-8?B?cE5VV281aGoxcnl3R3FkU0Via0piYXhOZ3RxNlY0L3pxZjlOM01BcldqdCtx?=
 =?utf-8?B?c09hZndZdHEyYjU1bndRUk1JYy9RSVNmRHNFNHhHQkRtVldJbmZTTTRWZ0xh?=
 =?utf-8?B?RFMzRlRHUm5XdDQ1ZlVqbjlURUNreFcvamNqaGJjeUJIQ1c0V3NqK0gyU3Zh?=
 =?utf-8?B?WmJzeTVMSTF5SVZDenh0V3pLcHNkTVA5UjlLSFEyRVdIL3hsdit5WTFLdWh4?=
 =?utf-8?B?R1JLN2RhejV0aDBnUGNDQ0g5THU2enZoTTlQQU9ycHhIRXFzT3l0U2pUTVdz?=
 =?utf-8?B?S1paY0tYbUlhVFVTTlV0ZWRGN1l4clAyUWE3L1Ixb0JuVDNCRVVVbDkyZDNF?=
 =?utf-8?B?UmEwaWM1L2gxZDE0eFVmai84cHhKQWVObFA2Y3kwMGcxL0Ezc1M1N1FmY2NS?=
 =?utf-8?B?MU55UHRwemNHYUdWOFh6cDIvcGpqcllzR3I2MmNQMzF2RDQ5YWFDZDZydy9r?=
 =?utf-8?B?cFZRM0xsWVYxbGx6ZzlONGMrN0lnWGN5MkhZRVM0bmhPZkp6VlhQNno4M1Fo?=
 =?utf-8?B?SEJsMjBUSXZXR2FmdXZhc2NRcmVmcWZQRE4vVWF2Uys2eXRIYm1DL05jVHE4?=
 =?utf-8?B?RUc4SHorSHBBTU5wTzdnb3VTTnZacFJsWDRGMEJqbjd6RXdtUEJhYVdGa295?=
 =?utf-8?B?RW5Yb1JHaHF5VWVBa1paSHFxWEd1U1M5bTdOdk43NmgvTmNYa0lIOTRDTFdi?=
 =?utf-8?B?SG1wUUI3Z3BvVXRoREtXcnpZNGZyQjJFbkpQd0NFMmpBUnZGNXZ0RlFmODVk?=
 =?utf-8?B?R2kzT1ZrdGFjQ0oveUdaUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7SPRMB0046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Rm1TQUJnM25acVFiN1MwNmM5U0RLZzk0RnY0bUV0THN0NHdjekZIVUpJRFda?=
 =?utf-8?B?TzkzNUJGc1BsdmJMSUp0YTlZOHY1eEtONzNFUXdYVm00UmNERzV2REFpWEJ3?=
 =?utf-8?B?R1JPNlBRYkpLY3lTQ0RiWnJIZU8waGRDNURVZEJ4ZUM0SGQ2eks1WHFyUlE1?=
 =?utf-8?B?cmFmM3NXSXpxbTRBaFdWSWR5QUxzTVB3Z2JKYnRmczRiOVhrQTJFRUMwOVls?=
 =?utf-8?B?amt6R3Q5Tmp0NXcvRWgwbmQwS3RsY3IxcUswajJURWNSZ1BwSDdFekdPSEFL?=
 =?utf-8?B?MkVwRXp3Vmk2N0w5WXExZEpYdXA4TDdNUU5aYUJTeWdCUkgrckdCZ0wwK1Ev?=
 =?utf-8?B?ZEFybDhzSFVvazVyREtIU2Raa0R1dDBRTHlSYWdXVlV3NmhIWHNZZ2VTY1VU?=
 =?utf-8?B?QzNWTzY4d0JvVkJTNEVGOHM1ZjIxQ0ZLT3FxYmZnL3FnZFBKcUNMV2dFQmpX?=
 =?utf-8?B?WXpuM3A3VEUwS2VMVkREbUhtcXdFS1FqQytoaFVDeFhOcWhkTmZCUUtXQjZD?=
 =?utf-8?B?Zm9NWWlKelpLYmQ2TzQrTjRxMm05M0RtMXpCZ0RHeDU0UUEzTmxqTEFwR3o5?=
 =?utf-8?B?dkFzMkMyYThwR082WS9icnZIeHQwOGhRMDZxMVFsS05GRHFiZk1nSjRMcGxo?=
 =?utf-8?B?NFNqSkpGUnlCT09JQlFJZmwybzNuSitkbnZZcGYwbDJxUDRKQ2d0Y0dxNWlV?=
 =?utf-8?B?Sk9kSElZeXBFd08wazJvemlGcUZSMERTWlUzczhUMENtbGFFc0lxdWdtN1VP?=
 =?utf-8?B?WElObisrcVcrNWVKZ20zaklTQWFGdEtHSWhMeHRZZXhka09YYUhXMlk4R3N0?=
 =?utf-8?B?UWt0Q3Q3VkdCR3BvcVFBSlVmTlNyR001cFNiQTJUN3BSc01ESms5TXBNVXli?=
 =?utf-8?B?T29qMkYwVUMwQUR5VVlGZmpEM1hwYW5hUk05bTZyK0lJVGRPNHNETjZoTU1k?=
 =?utf-8?B?Q2dBYld1RWRvTFluZ1Z6RC9kZlpXVUt3Y2xRMVREOTFjNFNTVEF4cFZEYnNB?=
 =?utf-8?B?NHRJU1lvb3NTWGVxWjVGUjlqci9Yc2VwQWpTYVdDdmFCRHd0cm5ZalB5MENs?=
 =?utf-8?B?cjQ3SFRCanYvU1hzcEZMZGVwOGlzdUhLK2lWOHJaTktQUlUvQjRWNWI2OWx6?=
 =?utf-8?B?WDJiUFgrOXN3eG5zSVIxU2lHVWRLV05QdVE5WlNsMHFoeEVYZngxSEhXSGR5?=
 =?utf-8?B?NTU3bXZrUnF6MkdiZmFES0wwYUNMZVVVMFRDNFN0VisxVG1nVm9DMzNISHJ2?=
 =?utf-8?B?eVRIVHkwQ2h6WENWeWZxVDVBY0prZUNvOWlkVFBlVzY5VmFqU01Wd2pCT09w?=
 =?utf-8?B?VjBKK0sraGRtYXhDblJVeldUQUNBMEFuRlg3bXdqS2tIZy8wSWRmNm1KYkpR?=
 =?utf-8?B?VHVkbHVwYmJDYUdFUXpUZTlzSWRBekNMK1VnNFZna0ljUlhZUThITWppbXVC?=
 =?utf-8?B?U0NhekF0ZmFUWjZOUGtnR3NJanNkWnh4ZEhJQVpBTHpMb1pCSGg0d3FxUGxP?=
 =?utf-8?B?Ri9wVTlGZ3ZCU2ptcEk1RmpxY2pnVTZMemtGUnB1MGNXZ1ZUVFZYaXo3czNi?=
 =?utf-8?B?M00rTWtQemtYZVhDSnBLYklnc1JKZUZwbngySUl1dy9vdGVyWDhkUkUzbERN?=
 =?utf-8?B?djRFUnpKQ1lCd3BMd3dtazZrbGZld3VBR3RseWxsUGN5WmRlNUlNVGttVkdv?=
 =?utf-8?B?bmF1NFlBOEtrTlVwbzlCSmVkUDg4QXpsbnRLY0daampGc3hBbGxXUys3Z1M0?=
 =?utf-8?B?QXlXb01jeHRIMW9jNTNJNjJJUDNNclJOOFVVNGtaOWY0Z1Q0b21JbW5XbERz?=
 =?utf-8?B?M3lGOHhSblMyazlOTkJuMVpxTUNHRWRVS1dFS1R0N0N1a2k1UWVXdDlIUUJU?=
 =?utf-8?B?cTJqOUNDR0RBL1JKSzlwbmhkQW4wWHIyejljOFljUlA3a2FqWFhkWDk3ck5E?=
 =?utf-8?B?SjZtaC9OUVQ5VFJYK2xEVE9LVmkwMzJFbG9nRmorTXRTNk9nZytuWmNnSURz?=
 =?utf-8?B?cG4rYzZNR2RpUmVLdjlKb241clhRd2owRlhsNStMVU4vWGdWcit0L20rU2xk?=
 =?utf-8?B?VmNBUW1kWmluQmxJeXRCZkV2RitQakR3NDRaMVFFMWdkeXNFZk9UWUFGQkk0?=
 =?utf-8?B?T1puY1g4QjJQRDM1NlBEWU5kdndTNkdvZmdrY3JwTnNkTjhKWVBsM0w0VnRK?=
 =?utf-8?B?Z3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b37b4654-9603-445f-7495-08dd1b005b9c
X-MS-Exchange-CrossTenant-AuthSource: PH7SPRMB0046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2024 22:57:31.0224 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Ja0MhEGP1kMt+6ToW4U6RxCW//tZbP5bPE535aUJyLCleYAG/oZzBMZKem1UCXayl+V6ixHdGBuXNGjog5unw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5950
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

On Thu, Dec 12, 2024 at 11:19:44AM +0530, Riana Tauro wrote:
> Boot Survivability is a software based workflow for recovering a system
> in a failed boot state. Here system recoverability is concerned with
> recovering the firmware responsible for boot.
> 
> This is implemented by loading the driver with bare minimum (no drm card)
> to allow the firmware to be flashed through mei/gsc and collect telemetry.
> The driver's probe flow is modified such that it enters survivability mode
> when pcode initialization is incomplete and boot status denotes a failure.
> In this mode, drm card is not exposed and PCI sysfs is used to indicate
> survivability mode and provide additional information required for debug
> 
> This patch adds initialization functions and exposes admin
> readable sysfs entries
> 
> The new sysfs will have the below layout
> 
> 	/sys/bus/.../bdf
> 		     ├── survivability_info
>              	     ├── survivability_mode

Let's make only one file and get all the info inside the survivability_mode
one.

> 
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile                   |   1 +
>  drivers/gpu/drm/xe/xe_device_types.h          |   4 +
>  drivers/gpu/drm/xe/xe_pcode_api.h             |  14 ++
>  drivers/gpu/drm/xe/xe_survivability_mode.c    | 225 ++++++++++++++++++
>  drivers/gpu/drm/xe/xe_survivability_mode.h    |  17 ++
>  .../gpu/drm/xe/xe_survivability_mode_types.h  |  35 +++
>  6 files changed, 296 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_survivability_mode.c
>  create mode 100644 drivers/gpu/drm/xe/xe_survivability_mode.h
>  create mode 100644 drivers/gpu/drm/xe/xe_survivability_mode_types.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 7730e0596299..dc60512a5c47 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -95,6 +95,7 @@ xe-y += xe_bb.o \
>  	xe_sa.o \
>  	xe_sched_job.o \
>  	xe_step.o \
> +	xe_survivability_mode.o \
>  	xe_sync.o \
>  	xe_tile.o \
>  	xe_tile_sysfs.o \
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 1373a222f5a5..79bd0bd94e9c 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -21,6 +21,7 @@
>  #include "xe_pt_types.h"
>  #include "xe_sriov_types.h"
>  #include "xe_step_types.h"
> +#include "xe_survivability_mode_types.h"
>  
>  #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>  #define TEST_VM_OPS_ERROR
> @@ -341,6 +342,9 @@ struct xe_device {
>  		u8 skip_pcode:1;
>  	} info;
>  
> +	/** @survivability: survivability information for device */
> +	struct xe_survivability survivability;
> +
>  	/** @irq: device interrupt state */
>  	struct {
>  		/** @irq.lock: lock for processing irq's on this device */
> diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
> index f153ce96f69a..4e373b8199ca 100644
> --- a/drivers/gpu/drm/xe/xe_pcode_api.h
> +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
> @@ -49,6 +49,20 @@
>  /* Domain IDs (param2) */
>  #define     PCODE_MBOX_DOMAIN_HBM		0x2
>  
> +#define PCODE_SCRATCH_ADDR(x)		XE_REG(0x138320 + ((x) * 4))
> +/* PCODE_SCRATCH0 */
> +#define   AUXINFO_REG_OFFSET		REG_GENMASK(17, 15)
> +#define   OVERFLOW_REG_OFFSET		REG_GENMASK(14, 12)
> +#define   HISTORY_TRACKING		REG_BIT(11)
> +#define   OVERFLOW_SUPPORT		REG_BIT(10)
> +#define   AUXINFO_SUPPORT		REG_BIT(9)
> +#define   BOOT_STATUS			REG_GENMASK(3, 1)
> +#define      CRITICAL_FAILURE		4
> +#define      NON_CRITICAL_FAILURE	7
> +
> +/* Auxillary info bits */
> +#define   AUXINFO_HISTORY_OFFSET	REG_GENMASK(31, 29)
> +
>  struct pcode_err_decode {
>  	int errno;
>  	const char *str;
> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
> new file mode 100644
> index 000000000000..7e36989efd68
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
> @@ -0,0 +1,225 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#include <drm/drm_managed.h>

this include moves together the linux group below,
on top of it...

> +
> +#include "xe_survivability_mode_types.h"
> +#include "xe_survivability_mode.h"
> +
> +#include <linux/kobject.h>
> +#include <linux/pci.h>
> +#include <linux/sysfs.h>
> +
> +#include "xe_device.h"
> +#include "xe_gt.h"
> +#include "xe_mmio.h"
> +#include "xe_pcode_api.h"
> +
> +#define MAX_SCRATCH_MMIO 8
> +
> +/**
> + * DOC: Xe Boot Survivability
> + *
> + * Boot Survivability is a software based workflow for recovering a system in a failed boot state
> + * Here system recoverability is concerned with recovering the firmware responsible for boot.
> + *
> + * This is implemented by loading the driver with bare minimum (no drm card) to allow the firmware
> + * to be flashed through mei and collect telemetry. The driver's probe flow is modified
> + * such that it enters survivability mode when pcode initialization is incomplete and boot status
> + * denotes a failure. In this mode, drm card is not exposed and PCI sysfs is used to indicate the
> + * survivability mode and provide additional information required for debug
> + *
> + * Xe KMD exposes below admin-only readable sysfs in survivability mode
> + *
> + * device/survivability_mode: Indicates driver is in survivability mode

We need to make in a way that the presence of the file itself is the indication
of the survivability_mode.  No file, no survivability_mode. No survivability_mode, no file.

Which I believe your code is already doing this below...

> + * device/survivability_info: Provides additional information on why the driver entered
> + *			      survivability mode.
> + *
> + *			      Capability Information - Provides boot status
> + *			      Postcode Information   - Provides information about the failure
> + *			      Overflow Information   - Provides history of previous failures
> + *			      Auxillary Information  - Certain failures may have information in
> + *						       addition to postcode information

then this move into the single file...

> + *
> + * TODO: Notify mei about survivability mode
> + */
> +
> +static void set_survivability_info(struct xe_device *xe, struct xe_survivability_info *info,
> +				   int id, char *name)
> +{
> +	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
> +
> +	strscpy(info[id].name, name, sizeof(info[id].name));
> +	info[id].reg = PCODE_SCRATCH_ADDR(id).raw;
> +	info[id].value = xe_mmio_read32(mmio, PCODE_SCRATCH_ADDR(id));
> +
> +	drm_info(&xe->drm, "%s: 0x%x - 0x%x\n", info[id].name,
> +		 info[id].reg, info[id].value);
> +}
> +
> +static int fill_survivability_info(struct xe_device *xe)
> +{
> +	struct xe_survivability *survivability = &xe->survivability;
> +	struct xe_survivability_info *info = survivability->info;
> +	u32 capability_info;
> +	int id = 0;
> +
> +	drm_info(&xe->drm, "Survivability Mode Information\n");

no need for the drm_info here

> +	set_survivability_info(xe, info, id, "Capability Info");
> +	capability_info = info[id].value;
> +
> +	if (capability_info & HISTORY_TRACKING) {
> +		id++;
> +		set_survivability_info(xe, info, id, "Postcode Info");
> +
> +		if (capability_info & OVERFLOW_SUPPORT) {
> +			id = REG_FIELD_GET(OVERFLOW_REG_OFFSET, capability_info);
> +			/* ID should be within MAX_SCRATCH_MMIO */
> +			if (id >= MAX_SCRATCH_MMIO)
> +				return -EINVAL;
> +			set_survivability_info(xe, info, id, "Overflow Info");
> +		}
> +	}
> +
> +	if (capability_info & AUXINFO_SUPPORT) {
> +		u32 aux_info;
> +		int index = 0;
> +		char name[NAME_MAX];
> +
> +		id = REG_FIELD_GET(AUXINFO_REG_OFFSET, capability_info);
> +		if (id >= MAX_SCRATCH_MMIO)
> +			return -EINVAL;
> +
> +		snprintf(name, NAME_MAX, "Auxiliary Info %d", index);
> +		set_survivability_info(xe, info, id, name);
> +		aux_info = info[id].value;
> +
> +		while ((id = REG_FIELD_GET(AUXINFO_HISTORY_OFFSET, aux_info)) &&
> +		       (id < MAX_SCRATCH_MMIO)) {
> +			index++;
> +			snprintf(name, NAME_MAX, "Prev Auxiliary Info %d", index);
> +			set_survivability_info(xe, info, id, name);
> +			aux_info = info[id].value;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static ssize_t survivability_info_show(struct device *dev,
> +				       struct device_attribute *attr, char *buff)
> +{
> +	struct pci_dev *pdev = to_pci_dev(dev);
> +	struct xe_device *xe = pdev_to_xe_device(pdev);
> +	struct xe_survivability *survivability = &xe->survivability;
> +	struct xe_survivability_info *info = survivability->info;
> +	int index = 0, count = 0;
> +
> +	for (index = 0; index < MAX_SCRATCH_MMIO; index++) {
> +		if (info[index].reg)
> +			count += sysfs_emit_at(buff, count, "%s: 0x%x - 0x%x\n", info[index].name,
> +					       info[index].reg, info[index].value);
> +	}
> +
> +	return count;
> +}
> +
> +static DEVICE_ATTR_ADMIN_RO(survivability_info);
> +
> +static ssize_t survivability_mode_show(struct device *dev,
> +				       struct device_attribute *attr, char *buff)
> +{
> +	struct pci_dev *pdev = to_pci_dev(dev);
> +	struct xe_device *xe = pdev_to_xe_device(pdev);
> +	struct xe_survivability *survivability = &xe->survivability;
> +
> +	return sysfs_emit(buff, "%d\n", survivability->mode);
> +}
> +
> +static DEVICE_ATTR_ADMIN_RO(survivability_mode);
> +
> +static const struct attribute *survivability_attrs[] = {
> +	&dev_attr_survivability_mode.attr,
> +	&dev_attr_survivability_info.attr,
> +	NULL,
> +};
> +
> +/**
> + * xe_survivability_mode_required- checks if survivability mode is required
> + * @xe: xe device instance
> + *
> + * This function reads the boot status of the capability register and
> + * checks if it is required to enter boot survivability mode.
> + *
> + * Return: true if survivability mode required, false otherwise
> + */
> +bool xe_survivability_mode_required(struct xe_device *xe)
> +{
> +	struct xe_survivability *survivability = &xe->survivability;
> +	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
> +	u32 data;
> +
> +	data = xe_mmio_read32(mmio, PCODE_SCRATCH_ADDR(0));
> +	survivability->boot_status = REG_FIELD_GET(BOOT_STATUS, data);
> +
> +	return (survivability->boot_status == NON_CRITICAL_FAILURE ||
> +		survivability->boot_status == CRITICAL_FAILURE);
> +}
> +
> +/**
> + * xe_survivability_mode_remove - remove survivability mode
> + * @xe: xe device instance
> + *
> + * clean up sysfs entries of survivability mode
> + */
> +void xe_survivability_mode_remove(struct xe_device *xe)
> +{
> +	sysfs_remove_files(&xe->drm.dev->kobj, survivability_attrs);
> +}
> +
> +/**
> + * xe_survivability_mode_init - Initialize the survivability mode
> + * @xe: xe device instance
> + *
> + * Initializes the sysfs and required actions to enter survivability mode
> + */
> +void xe_survivability_mode_init(struct xe_device *xe)
> +{
> +	struct xe_survivability *survivability = &xe->survivability;
> +	struct xe_survivability_info *info;
> +	struct device *dev = xe->drm.dev;
> +	int ret = 0;
> +
> +	survivability->size = MAX_SCRATCH_MMIO;
> +
> +	info = drmm_kcalloc(&xe->drm, survivability->size, sizeof(*info), GFP_KERNEL);
> +	if (!info) {
> +		drm_warn(&xe->drm, "%s failed, err: %d\n", __func__, -ENOMEM);
> +		return;
> +	}
> +
> +	survivability->info = info;
> +
> +	ret = fill_survivability_info(xe);
> +	if (ret)
> +		drm_warn(&xe->drm, "%s failed, err: %d\n", __func__, ret);
> +
> +	/* Only log debug information and exit if it is a critical failure */
> +	if (survivability->boot_status == CRITICAL_FAILURE)
> +		return;
> +
> +	/* set survivability mode */
> +	survivability->mode = true;
> +
> +	drm_info(&xe->drm, "In Survivability Mode\n");

this one is good!

> +
> +	ret = sysfs_create_files(&dev->kobj, survivability_attrs);
> +	if (ret) {
> +		drm_warn(&xe->drm, "Failed to create survivability sysfs files\n");
> +		return;
> +	}
> +
> +	/* TODO: Pass Survivability Mode notification to required child drivers */
> +}
> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.h b/drivers/gpu/drm/xe/xe_survivability_mode.h
> new file mode 100644
> index 000000000000..0d5c325322a2
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.h
> @@ -0,0 +1,17 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#ifndef _XE_SURVIVABILITY_MODE_H_
> +#define _XE_SURVIVABILITY_MODE_H_
> +
> +#include <linux/types.h>
> +
> +struct xe_device;
> +
> +void xe_survivability_mode_init(struct xe_device *xe);
> +void xe_survivability_mode_remove(struct xe_device *xe);
> +bool xe_survivability_mode_required(struct xe_device *xe);
> +
> +#endif /* _XE_SURVIVABILITY_MODE_H_ */
> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode_types.h b/drivers/gpu/drm/xe/xe_survivability_mode_types.h
> new file mode 100644
> index 000000000000..f9dbb6d80692
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_survivability_mode_types.h
> @@ -0,0 +1,35 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#ifndef _XE_SURVIVABILITY_MODE_TYPES_H_
> +#define _XE_SURVIVABILITY_MODE_TYPES_H_
> +
> +#include <linux/limits.h>
> +#include <linux/types.h>
> +
> +struct xe_survivability_info {
> +	char name[NAME_MAX];
> +	u32 reg;
> +	u32 value;
> +};
> +
> +/**
> + * struct xe_survivability: Contains survivability mode information
> + */
> +struct xe_survivability {
> +	/** @info: struct that holds survivability info from scratch registers */
> +	struct xe_survivability_info *info;
> +
> +	/** @size: number of scratch registers */
> +	u32 size;
> +
> +	/** @boot_status: indicates critical/non critical boot failure */
> +	u8 boot_status;
> +
> +	/** mode: boolean to indicate survivability mode */
> +	bool mode;
> +};
> +
> +#endif /* _XE_SURVIVABILITY_MODE_TYPES_H_ */
> -- 
> 2.47.1
> 

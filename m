Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FF91C02182
	for <intel-xe@archiver.kernel.org>; Thu, 23 Jan 2025 23:25:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1A6810E067;
	Thu, 23 Jan 2025 23:25:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jTIxmmW/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3765410E067
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Jan 2025 23:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737674700; x=1769210700;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=vBYqwFCEJuqi7AZ0ZsrLTL+teDsPBkj/qAVEMclb5rI=;
 b=jTIxmmW/+D8RFV5cPwcIRHjj8ueIzADL/di1jHltrZlITx+y2sO98v1X
 vQYcrE6thfhb2VqnlzYIu68Os1tN8W0/+1dscSQRJu29HSWC/Rdd3BgkF
 ov3IiegEKW5Ld6ZrfZeZwHe4fd0bl0tPe1R7cGgQ3R7BS+RMpV7z/KNoL
 ra53H2FAH7BoagHe7zeKN7JTRGNZU8epNrky3bJSXE4MP3HRreOE1O+jf
 /H7yfCQFnW5jnpcSP7rqemHDlfappx8aRLJhABT6L+fbruORKVWIDWRFB
 4eAPxECFWuRWc0774PJyyTz+CkyGeH4XN6DNytn1lilDnMUJbiBT+aAES g==;
X-CSE-ConnectionGUID: u/JRxuKLSiumvpDYFNAUHA==
X-CSE-MsgGUID: yhaCpr4+QMeg2WkOatjMIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="41034776"
X-IronPort-AV: E=Sophos;i="6.13,229,1732608000"; d="scan'208";a="41034776"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2025 15:24:55 -0800
X-CSE-ConnectionGUID: N+K/EACPQjKVhQMFILPvZw==
X-CSE-MsgGUID: drf6ch4NR6Kwgur9BZbqMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,229,1732608000"; d="scan'208";a="108204736"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Jan 2025 15:24:53 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 23 Jan 2025 15:24:53 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 23 Jan 2025 15:24:53 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 23 Jan 2025 15:24:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a9upGXa7TENXnacpsJ7WJV6aZmrBTWcBpG4zYAfPUUT1jQI3gSg1pd/cqZyOjkbRhy/1bffJUDVBSHW5Iml5MCVaC4b/3GDT+itXHqzVK1ci7YLnsdqSaOaP7k7feAoskSDZoua4J/VOnWrCwnhkMpRoPVMJdOgeQ+QRMmaZyFE9muN4ZsYRCvTD5yynJCyBo1qqNBMzW1o58r929PYsx3w7+WTTE7Mypbl9vLmYtFm9diJIevTEHfiHELcoclmLX5Krk9vLrZJHoU3jHr2wcKauOb3QuuI3PD3WznhBm2r90tqZ2IBF5G6isSm0+2J4LCRw7sM1FHtKp7Xwajl+Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Q1bvzdYHK/IeBxthTHqH+d1RdpcKdJTfwyQId/Gt/s=;
 b=tw/ciu2Fz0hPo8XFLs7rjcIR9cJ/aLMureeOzHsWF6UG7MVJoVxG5E/CJ5N5svI9ThhnxPaor0TtCRFL6fkeFBKuFMf+hoZLahHHBh99wfc7lb2Zm8WoigcCqllsU09Ri6FWgO5AQQ24ZoYHnOVDj/zdX0vQAU1CDZc3LB3g06diJgoKqpqg6yGodh/+kKFNHv9oZUKXT1Ot5Rm5uN0mZQn/tVrbNvTYh9Suu+N+VjzDkc7s2XpZcH+5Vqy9dAKBdsCHi+QI3roDT2NkmyyHQIaLRWN2iwyL9HIiYAYEJa1ZzUEeVjLylrczSqo4RiUuKOOeeWl3Z/gcbVVAKTI7Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by SN7PR11MB7114.namprd11.prod.outlook.com (2603:10b6:806:299::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Thu, 23 Jan
 2025 23:24:10 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1%4]) with mapi id 15.20.8356.020; Thu, 23 Jan 2025
 23:24:09 +0000
Message-ID: <c547a9ec-2570-463e-9bab-de1e66d0ae41@intel.com>
Date: Thu, 23 Jan 2025 15:24:08 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4] drm/xe/uapi: Use hint for guc to set GT frequency
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, Tejas Upadhyay
 <tejas.upadhyay@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <michal.mrozek@intel.com>,
 <szymon.morek@intel.com>, <jose.souza@intel.com>
References: <20250121131605.1115338-1-tejas.upadhyay@intel.com>
 <Z4_KuCgUWvM1eBjE@intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <Z4_KuCgUWvM1eBjE@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR03CA0034.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::47) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|SN7PR11MB7114:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f090f18-890f-4ec0-9f94-08dd3c0509f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZVBhZmJkbVpmQ1l5Z2tDSjZRN3ZFcVdZaXRYN2hIb1dkRjBUaEZkdCtqaVhP?=
 =?utf-8?B?dm9UajJNODg3SWtyb2NVTkZQN3RKb3pEcW9SS2RrRnpuMlBWR2R0SWlqTXla?=
 =?utf-8?B?cGprZDJ3N1VqZVI0eTBrUjE4MTlmOWpnWWNyejZEb1pLVjFnSVNpWWdKbDNr?=
 =?utf-8?B?RlkvL3ZOWHJtaW5oSmxyYTllbExhR2JOTVhiNjRvVEsreFhzbFJhM2N4b3l0?=
 =?utf-8?B?aFJqTFRWNjc5T3crYUNkeVRLeEtzL1ZkcG41eDgvU01uTC90RXZ6S3ZkNjBP?=
 =?utf-8?B?OStIUkhOT1FKTmxFWjJ6d0tGSVBaQ2xobmZDbDFKbWZXbzdVdUpsNXVENzV3?=
 =?utf-8?B?a1Y2UnlvbUFPa0U5WkxZbXdrTzFDVmVIOHJNeWF1VFZ1cUpIb1E1UERZU2l1?=
 =?utf-8?B?U2dCb21vU3NiR0FDMlhNMWQvU0piS2lzQWU2NStxeFpuMEtKMzJsVTdtOCt1?=
 =?utf-8?B?R3F4WXkvbzRrUmZZMi9Na0RYU3ozTDJOUlRFUmZCa3UyL2RsSWxqckYxd2pJ?=
 =?utf-8?B?YThNbzM5SjFOaW12dXcvUDJmRmZLSldDaTZkTlR2a0pkQ3F6QTdkMHhHRkdu?=
 =?utf-8?B?YXZFZWpOaXN4U0thZGx2VGhYU2pxSzdzanowYThCQm1GdHFGY0VvTEtmb0po?=
 =?utf-8?B?Y2tFRHZBUSs2ZC9PTjdWaS91cm5RWkNLT0ppM3M4TSsxRCs2MnNpYnZNZ0ph?=
 =?utf-8?B?L1ZvcTVzYkhtRHZlTks2c0RFRnRYa2RIS2o0TTRJLzVYMFA2ZzUySGpFWlQ3?=
 =?utf-8?B?bm9Wc2lIc0YwQ1RqeVJFdFJ3UVkzSS9iNEpjbG0wUHZ2bWdlY3d3Si94ZzBO?=
 =?utf-8?B?bUVaZkhnNVcxazBUVFNLOUNzYTM2L1p4Kzd4UGp4eitjL1ExTTMydzNBbWlD?=
 =?utf-8?B?RWV3V1p6NXlsWFJIRTBUejFMcVRQdjBQWlFMRzhKNXNKOWI0WEl3SkVnZzRu?=
 =?utf-8?B?cmNlZzNWNE0vaEJ0SjA3Z3Vxb0cydDdZOUxtT0tvT3Ewa2xqNXNkOWJ3bUNC?=
 =?utf-8?B?SlRCOHBmcFRJUXc0aUNwckhvMVJmc1doeWo0VXdyKzNQejVvVnJMb3ozOXZh?=
 =?utf-8?B?dkVCZXJ1OXlIUXYzRVpRN3hQOG44UkJEQnk0K0VGMU4wT1pXQnJrOGk0RGNV?=
 =?utf-8?B?aFVkTHk0OHFOenpBMFg2MDB0Nm9WQVd4ZmpHc0Z0R1NML0JSQ2tzKy9jVSt2?=
 =?utf-8?B?ZGlmL1dSMEtKMTcrajdHWWxZaisvZkRteGhKeElSbzF4cmlVM0NIOU1VMndN?=
 =?utf-8?B?ajFWckxrK2xPcGNKR0FaNk5sNk8xVUxaYVkrenhHWE96M0kvQjBRMXV4Nkx3?=
 =?utf-8?B?Z2Y5WitjVXhHS3cwUU5HZzVkZEhyaGZ6L0llT2I3WnFEd25tMmpSNmtMUFds?=
 =?utf-8?B?c0dDR2RhbWhUUS9CUTNNR2hRbUhGcDdSMEh4VjREVDYyU3ZNNDlCOVRBVWJK?=
 =?utf-8?B?bjFaVjFCemxxdi9Qdm1GT0pVUVpNcHpUakRkeGdsZUJhVVpJUWNWdnZ3WWVS?=
 =?utf-8?B?bmd2R0NTNXhmMWY1VkhvNnhWakJibXlpYVhqWkFPdTVPTTRSblBIYXk4MFpz?=
 =?utf-8?B?SSsvNlk3RjVDckljUEpLU2dDSHJpcFhRQXJvbTBvTmV2ZmtSWjBiUis3eURj?=
 =?utf-8?B?MjQxNDY4cjVxbHYzQU9uaEhLVnYxeml2T1hzR2ZhVnFhSkh1L09nVndodjU0?=
 =?utf-8?B?Z3Q3TnlNNnF6cWs0MVpLMWtUVnR3a0dzRnB4eHlBbXVsT3lIWlpXb0k3MUFk?=
 =?utf-8?B?ejZhQkE5OCttU0xoQ2xGV0tGSmh4c2hzd0RLaGs2WlhZM1FMcnUwRGZSRUNQ?=
 =?utf-8?B?M1piNmN5M2M0M0hySVlEZ3pUajc4S29RUUwxL0Q5MDF1MG1vV3lHNHh3MDRB?=
 =?utf-8?Q?Y0CbIluP5kwog?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WldJKzZvSWFxdUltL201VHpDT2owbzljZFN2cVB2SUVzUmhUM25ldjQ3OWFX?=
 =?utf-8?B?NzcrdWhsd21EU1ZxMS9yVm5qYWx6QzZmemtmMzZWSEVRazR4dUV0eFZ4SVI1?=
 =?utf-8?B?YXUyK1d3dDZiZWNOV1FSM0VqYkVnZWFBUUREQWVNM2ZUNmJZNlowMElXbWJ3?=
 =?utf-8?B?Wi9DNzFuTFlTMmMyRWRtV3VuRFpkb3ZVYXh1dXVZYTRXUGR3cE5pL1QwMXpq?=
 =?utf-8?B?eHM2MS8rN3F3VTFqcDh4UGF3T25haDVPcTYzSkRwN0lNdkFqbytVcHN5RVdN?=
 =?utf-8?B?NWdNOXdmbzYyd3ZNM0tTWFRsSHRuOU1GUnN6NlRyY3h5cW9QaFBWWFMraVN3?=
 =?utf-8?B?bEhoWmRpT1BBaHY4amVVRURkRGJWQVBSamFSdjFBdXY0cDZYb1VPUkowejNh?=
 =?utf-8?B?eHJUVVM0S1ZXaUNmcUgzYVNDWm1QYXR1RGVxemo1TUJjVmJub3NaZjdRSjRI?=
 =?utf-8?B?M3JpeE1BQzdJcDRDem51S01pNkZiRCs2OHJBMDBQRG50WFV0OEVnc0hOTFBn?=
 =?utf-8?B?Mng0cE9uTS9nMnVMcWJvSkRBZEd3dDJQOGdZQm9EUDVla2ZNUjNQUzdQUVVk?=
 =?utf-8?B?QXkzUEkveThoRXp6WStIcnAyOTVhQ3RHd2ZMeWFFV1paL3RGeFR2N2dvQUQx?=
 =?utf-8?B?NGRINUFpT2drQzZwQkVlSEI0T2psalNaOUUrZms5cFhhc0dKOGpmL3dRa2M5?=
 =?utf-8?B?ZTVLT0NMWExzMm9tVmt2RUZvaVFaK3g3RUYvTXI4RlFYVjhsM3FRZUFpTWR4?=
 =?utf-8?B?UkdLMjFraGJDRi9aZkZXNW5GYkxrSGlrZDBGYWhTd200M0RnM1pnc0dJYXhV?=
 =?utf-8?B?c1plVHdmMXA5MlJxSkF2Q1cxY29mR21maXJ0ajFUTG5tVnQ2RFU0cC9jdkpX?=
 =?utf-8?B?d3ArRWd0RVlOT3hDMVlGVWRpbEZ4Q3dnc2Q2WnRZS0EyYjI2VHNkbG5PRzds?=
 =?utf-8?B?V2RCWWFDdStoM3VvUWNsbkhqRFd6SkZsbXdhWVdJR2VtaDNVczQ3SDdvUGJp?=
 =?utf-8?B?U1RYcUprYmZId0VDeHJqOXorN2o2TTlHRXlpTXJkTnFtQ05HRkVNUHRaOC9I?=
 =?utf-8?B?MEFVU2F4VmdtbjVlbUVaL1VOa0Z4R3dqSGxnV3dxVzdZZjNXcFBaUndIblV2?=
 =?utf-8?B?QWg3Tjc4YjdyWTYzNEJxUysvbjlySkFaK0RuamdkbXhKY1ZUakNqTkVFMk90?=
 =?utf-8?B?bStyZnowbFVtZkd1dm5SRVZOWFhwRC9YMWQ5YXJNbzFTRm5lOUxjd05US01C?=
 =?utf-8?B?WWN1TUIyTXJCMUNOMDFndXRSYlBGakRTazAvWldpY1hwbmZuODdQOEtubEtm?=
 =?utf-8?B?Nzh1V0UzWFNySVBWQURyU3JjaXZGTnJnQ0hGcGliWVg5QkRGaEI1aTFBaGZO?=
 =?utf-8?B?L0F1WWFTUTVlYU1wc29WZWpGOHFmZGNzVTNTSEMzajdzZ1A3U0RmNm5rRnAr?=
 =?utf-8?B?ZW9YV2c3UDczeHZsbVFSemh3ZGllWWttZFBsdkp1VXAvdkozOEFyWGlhb2dK?=
 =?utf-8?B?RWgrRWlMcFovZWkvd2FCY0ZPOWU1RXArT2FPNWpqQ0diQUIrUmpkVzhOMHJ5?=
 =?utf-8?B?Mmxad3owMlloUEN6TXdyZ285YkVVMDArNDNMMnBVVEE0MzdCRnZaMTF5QVdT?=
 =?utf-8?B?aExGUU84bkZuWW5GdjYrbURCR1VlVGxVcW0wZlVxRDlkT2hSZDdXZjNjblhN?=
 =?utf-8?B?a2ZsQmpPM1Bib0VnR2JKa3lsdUpwRzBtbWhvcjQ4YnB0MWtGYWZGeEpzK3Jv?=
 =?utf-8?B?dXdkbkw1UUFiVE1BZWlWSi9jTUE3RUNCSVZFMUdRRk9iVDBONVlmb1o4bUpU?=
 =?utf-8?B?UmpHOFZXY1BwcVJmWndzY1B5UEIrT0FLTCs2eGEybnl5Z2gyaWtjQnlVMGtT?=
 =?utf-8?B?L2I5S1E4bzFJU05HNjNkM3pzaHVwU2ZWcG1zbnFuTG9MWjNRa3M0L2svRkF4?=
 =?utf-8?B?Tld6WnkvVmVBVFU2OFBnT2Vzb1oxL1JMTmFPYjNrTGlPeWdtaStBUkhRc1RC?=
 =?utf-8?B?YWpYakx3RDFPTndTMzhOQ3ZxK3RYb1JNazlVNXhTeFYvNTBOOFFlSXcwbStJ?=
 =?utf-8?B?Q3c2NGxOUTk5OEozODIxVnVtZXV4Tm1tNUd4SFVuWVhWYlc5alV5YS8rZjVw?=
 =?utf-8?B?QkFSMjRUV0hBSW90bHZpbGQyOThDL0pYRjk5ZzJRMnpvbHQ4K1dPeW1FL1Bh?=
 =?utf-8?B?VUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f090f18-890f-4ec0-9f94-08dd3c0509f3
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2025 23:24:09.8056 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GYHA68YVlYjlBsfYWVi1OJT2JRYZ4LOQYRfQdzsdAtyn/neqUVOCUDIkB2I8aVkZ/ofxugiZiOuuSmhQJiG29dKjMRPz9ELIFO1WMikXzbQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7114
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


On 1/21/2025 8:26 AM, Rodrigo Vivi wrote:
> On Tue, Jan 21, 2025 at 06:46:05PM +0530, Tejas Upadhyay wrote:
>> Allow user to provide a low latency hint. When set,
>> KMD sends a hint to GuC which results in special handling for that process.
>> SLPC will ramp the GT frequency aggressively every time
>> it switches to this process.
>>
>> We need to enable the use of SLPC Compute strategy during init, but
>> it will apply only to processes that set this bit during process
>> creation.
>>
>> Improvement with this approach as below:
>>
>> Before,
>>
>> :~$ NEOReadDebugKeys=1 EnableDirectSubmission=0 clpeak --kernel-latency
>> Platform: Intel(R) OpenCL Graphics
>>    Device: Intel(R) Graphics [0xe20b]
>>      Driver version  : 24.52.0 (Linux x64)
>>      Compute units   : 160
>>      Clock frequency : 2850 MHz
>>      Kernel launch latency : 283.16 us
>>
>> After,
>>
>> :~$ NEOReadDebugKeys=1 EnableDirectSubmission=0 clpeak --kernel-latency
>> Platform: Intel(R) OpenCL Graphics
>>    Device: Intel(R) Graphics [0xe20b]
>>      Driver version  : 24.52.0 (Linux x64)
>>      Compute units   : 160
>>      Clock frequency : 2850 MHz
>>
>>      Kernel launch latency : 63.38 us
>>
>> UMD will indicate low latency hint with flag as mentioned below,
>>
>> *     struct drm_xe_exec_queue_create exec_queue_create = {
>> *          .flags = DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT or 0
> or 0 ?!
>
>> *          .extensions = 0,
>> *          .vm_id = vm,
>> *          .num_bb_per_exec = 1,
>> *          .num_eng_per_bb = 1,
>> *          .instances = to_user_pointer(&instance),
>> *     };
>> *     ioctl(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE, &exec_queue_create);
> What about moving this block to the uapi documentation?
> we shouldn't miss a good opportunity to document our uapi ;)
>
>> Link to UMD PR : https://github.com/intel/compute-runtime/pull/794
>>
>> V4:
>>    - To make it clear, dont use exec queue word (Vinay)
>>    - Correct typo in description of flag (Jose/Vinay)
>>    - rename set_strategy api and replace ctx with exec queue(Vinay)
>>    - Start with 0th bit to indentify user flags (Jose)
>> V3:
>>    - Conver user flag to kernel internal flag and use (Oak)
>>    - Support query config for use to check kernel support (Jose)
>>    - Dont need to take runtime pm (Vinay)
>> V2:
>>    - DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT 1 is already planned for other hint(Szymon)
>>    - Add motivation to description (Lucas)
>>
>> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
>> ---
>>   drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h |  3 +++
>>   drivers/gpu/drm/xe/xe_exec_queue.c            | 11 ++++++++---
>>   drivers/gpu/drm/xe/xe_exec_queue_types.h      |  3 ++-
>>   drivers/gpu/drm/xe/xe_guc_pc.c                | 16 ++++++++++++++++
>>   drivers/gpu/drm/xe/xe_guc_submit.c            |  8 ++++++++
>>   drivers/gpu/drm/xe/xe_query.c                 |  3 ++-
>>   include/uapi/drm/xe_drm.h                     |  7 ++++++-
>>   7 files changed, 45 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h
>> index 85abe4f09ae2..c50075b8270f 100644
>> --- a/drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h
>> +++ b/drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h
>> @@ -174,6 +174,9 @@ struct slpc_task_state_data {
>>   	};
>>   } __packed;
>>   
>> +#define SLPC_EXEC_QUEUE_FREQ_REQ_IS_COMPUTE	REG_BIT(28)
> I understand why you did that, but I don't believe we should use Xe
> terminology in the GuC ABI... It should follow the SLPC naming and
> likely SLPC_CTX_FREQ_REQ_IS_COMPUTE seems the right choice here...
>
> Vinay?! thoughts?

yup, should be GuC ABI specific. Should be SLPC_CTX_FREQ_REQ_IS_COMPUTE.

Thanks,

Vinay.

>
>> +#define SLPC_OPTIMIZED_STRATEGY_COMPUTE		REG_BIT(0)
>> +
>>   struct slpc_shared_data_header {
>>   	/* Total size in bytes of this shared buffer. */
>>   	u32 size;
>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
>> index 8948f50ee58f..bd33fb318677 100644
>> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
>> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>> @@ -544,6 +544,7 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>>   	struct drm_xe_engine_class_instance __user *user_eci =
>>   		u64_to_user_ptr(args->instances);
>>   	struct xe_hw_engine *hwe;
>> +	unsigned long flags;
>>   	struct xe_vm *vm;
>>   	struct xe_gt *gt;
>>   	struct xe_tile *tile;
>> @@ -553,7 +554,8 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>>   	u32 len;
>>   	int err;
>>   
>> -	if (XE_IOCTL_DBG(xe, args->flags) ||
>> +	if (XE_IOCTL_DBG(xe, args->flags &&
>> +			 !(args->flags & DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT)) ||
>>   	    XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
>>   		return -EINVAL;
>>   
>> @@ -570,6 +572,9 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>>   	if (XE_IOCTL_DBG(xe, eci[0].gt_id >= xe->info.gt_count))
>>   		return -EINVAL;
>>   
>> +	if (args->flags & DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT)
>> +		flags |= EXEC_QUEUE_FLAG_LOW_LATENCY;
>> +
>>   	if (eci[0].engine_class == DRM_XE_ENGINE_CLASS_VM_BIND) {
>>   		if (XE_IOCTL_DBG(xe, args->width != 1) ||
>>   		    XE_IOCTL_DBG(xe, args->num_placements != 1) ||
>> @@ -578,8 +583,8 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>>   
>>   		for_each_tile(tile, xe, id) {
>>   			struct xe_exec_queue *new;
>> -			u32 flags = EXEC_QUEUE_FLAG_VM;
>>   
>> +			flags |= EXEC_QUEUE_FLAG_VM;
>>   			if (id)
>>   				flags |= EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD;
>>   
>> @@ -626,7 +631,7 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>>   		}
>>   
>>   		q = xe_exec_queue_create(xe, vm, logical_mask,
>> -					 args->width, hwe, 0,
>> +					 args->width, hwe, flags,
>>   					 args->extensions);
>>   		up_read(&vm->lock);
>>   		xe_vm_put(vm);
>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
>> index 5af5419cec7a..30dc129a6b09 100644
>> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
>> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
>> @@ -85,7 +85,8 @@ struct xe_exec_queue {
>>   #define EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD	BIT(3)
>>   /* kernel exec_queue only, set priority to highest level */
>>   #define EXEC_QUEUE_FLAG_HIGH_PRIORITY		BIT(4)
>> -
>> +/* flag to indicate low latency hint to guc */
>> +#define EXEC_QUEUE_FLAG_LOW_LATENCY		BIT(5)
>>   	/**
>>   	 * @flags: flags for this exec queue, should statically setup aside from ban
>>   	 * bit
>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
>> index 44b5211066ef..e926f89e4ce9 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
>> @@ -1014,6 +1014,17 @@ static int slpc_set_policies(struct xe_guc_pc *pc)
>>   	return 0;
>>   }
>>   
>> +static int pc_action_set_strategy(struct xe_guc_pc *pc, u32 val)
>> +{
>> +	int ret = 0;
>> +
>> +	ret = pc_action_set_param(pc,
>> +				  SLPC_PARAM_STRATEGIES,
>> +				  val);
>> +
>> +	return ret;
>> +}
>> +
>>   /**
>>    * xe_guc_pc_start - Start GuC's Power Conservation component
>>    * @pc: Xe_GuC_PC instance
>> @@ -1077,6 +1088,11 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
>>   	}
>>   
>>   	ret = pc_action_setup_gucrc(pc, GUCRC_FIRMWARE_CONTROL);
>> +	if (ret)
>> +		goto out;
>> +
>> +	/* Enable SLPC Optimized Strategy for compute */
>> +	ret = pc_action_set_strategy(pc, SLPC_OPTIMIZED_STRATEGY_COMPUTE);
>>   
>>   out:
>>   	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>> index 913c74d6e2ae..be7551756eb9 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>> @@ -15,6 +15,7 @@
>>   #include <drm/drm_managed.h>
>>   
>>   #include "abi/guc_actions_abi.h"
>> +#include "abi/guc_actions_slpc_abi.h"
>>   #include "abi/guc_klvs_abi.h"
>>   #include "regs/xe_lrc_layout.h"
>>   #include "xe_assert.h"
>> @@ -400,6 +401,7 @@ static void __guc_exec_queue_policy_add_##func(struct exec_queue_policy *policy,
>>   MAKE_EXEC_QUEUE_POLICY_ADD(execution_quantum, EXECUTION_QUANTUM)
>>   MAKE_EXEC_QUEUE_POLICY_ADD(preemption_timeout, PREEMPTION_TIMEOUT)
>>   MAKE_EXEC_QUEUE_POLICY_ADD(priority, SCHEDULING_PRIORITY)
>> +MAKE_EXEC_QUEUE_POLICY_ADD(slpc_exec_queue_freq_req, SLPM_GT_FREQUENCY)
>>   #undef MAKE_EXEC_QUEUE_POLICY_ADD
>>   
>>   static const int xe_exec_queue_prio_to_guc[] = {
>> @@ -414,14 +416,20 @@ static void init_policies(struct xe_guc *guc, struct xe_exec_queue *q)
>>   	struct exec_queue_policy policy;
>>   	enum xe_exec_queue_priority prio = q->sched_props.priority;
>>   	u32 timeslice_us = q->sched_props.timeslice_us;
>> +	u32 slpc_exec_queue_freq_req = 0;
>>   	u32 preempt_timeout_us = q->sched_props.preempt_timeout_us;
>>   
>>   	xe_gt_assert(guc_to_gt(guc), exec_queue_registered(q));
>>   
>> +	if (q->flags & EXEC_QUEUE_FLAG_LOW_LATENCY)
>> +		slpc_exec_queue_freq_req |= SLPC_EXEC_QUEUE_FREQ_REQ_IS_COMPUTE;
>> +
>>   	__guc_exec_queue_policy_start_klv(&policy, q->guc->id);
>>   	__guc_exec_queue_policy_add_priority(&policy, xe_exec_queue_prio_to_guc[prio]);
>>   	__guc_exec_queue_policy_add_execution_quantum(&policy, timeslice_us);
>>   	__guc_exec_queue_policy_add_preemption_timeout(&policy, preempt_timeout_us);
>> +	__guc_exec_queue_policy_add_slpc_exec_queue_freq_req(&policy,
>> +							     slpc_exec_queue_freq_req);
>>   
>>   	xe_guc_ct_send(&guc->ct, (u32 *)&policy.h2g,
>>   		       __guc_exec_queue_policy_action_size(&policy), 0, 0);
>> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
>> index c059639613f7..136280c0c6b9 100644
>> --- a/drivers/gpu/drm/xe/xe_query.c
>> +++ b/drivers/gpu/drm/xe/xe_query.c
>> @@ -334,7 +334,8 @@ static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
>>   		xe->info.devid | (xe->info.revid << 16);
>>   	if (xe_device_get_root_tile(xe)->mem.vram.usable_size)
>>   		config->info[DRM_XE_QUERY_CONFIG_FLAGS] =
>> -			DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM;
>> +			DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM |
>> +			DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY;
>>   	config->info[DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT] =
>>   		xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K ? SZ_64K : SZ_4K;
>>   	config->info[DRM_XE_QUERY_CONFIG_VA_BITS] = xe->info.va_bits;
>> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>> index cac607a30f6d..1abad0c6e242 100644
>> --- a/include/uapi/drm/xe_drm.h
>> +++ b/include/uapi/drm/xe_drm.h
>> @@ -393,6 +393,8 @@ struct drm_xe_query_mem_regions {
>>    *
>>    *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM - Flag is set if the device
>>    *      has usable VRAM
>> + *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY - Flag is set if the device
>> + *      has low latency hint support
>>    *  - %DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT - Minimal memory alignment
>>    *    required by this device, typically SZ_4K or SZ_64K
>>    *  - %DRM_XE_QUERY_CONFIG_VA_BITS - Maximum bits of a virtual address
>> @@ -409,6 +411,7 @@ struct drm_xe_query_config {
>>   #define DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID	0
>>   #define DRM_XE_QUERY_CONFIG_FLAGS			1
>>   	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM	(1 << 0)
>> +	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY	(1 << 1)
>>   #define DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT		2
>>   #define DRM_XE_QUERY_CONFIG_VA_BITS			3
>>   #define DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY	4
>> @@ -1124,6 +1127,7 @@ struct drm_xe_vm_bind {
>>    *         .engine_class = DRM_XE_ENGINE_CLASS_RENDER,
>>    *     };
>>    *     struct drm_xe_exec_queue_create exec_queue_create = {
>> + *          .flags = DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT or 0
>>    *          .extensions = 0,
>>    *          .vm_id = vm,
>>    *          .num_bb_per_exec = 1,
>> @@ -1150,7 +1154,8 @@ struct drm_xe_exec_queue_create {
>>   	/** @vm_id: VM to use for this exec queue */
>>   	__u32 vm_id;
>>   
>> -	/** @flags: MBZ */
>> +#define DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT	(1 << 0)
>> +	/** @flags: flags to use for this exec queue */
>>   	__u32 flags;
>>   
>>   	/** @exec_queue_id: Returned exec queue ID */
>> -- 
>> 2.43.0
>>

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A140CCD1A2
	for <intel-xe@archiver.kernel.org>; Mon, 20 Oct 2025 21:54:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE4F910E52B;
	Mon, 20 Oct 2025 21:54:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wq83hP6K";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A55810E52B
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Oct 2025 21:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760997244; x=1792533244;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9tDZF2hcWmjW7lihRuIlH3FNRN3WXyyXlHcE7foTt4s=;
 b=Wq83hP6KiN9qJEUsO1pwdXlhwtcQgfReRx7b1nZAPPMy96a5NbBHrmWa
 yGaJUoIJGdFkRB94Fpd3kybJO4uU1JWSfAwqTpgGNtPY9KI2juRFczolX
 fBkIlMipMG64UhriLuuerwJEORqq1LXPIbprMjC4NRsjAiOm0aXY3Hnmk
 GLGpfPrmXP1cy4de7LmXZrapvfB+VOzhruTHMNrm8wA7vWhpGDyJnwBdj
 y1FKtWAzINVsBJDDQ0tJkYAa7FiDcX/XoUQv5RX0tUVp7WbzGRV9r/f5d
 2x/U3EvBUnxBWCY3dFnxX1dLWW6IHZ2bm4BotRfCr9y+FAYHPLyTGeaa3 A==;
X-CSE-ConnectionGUID: Jlw9k5QETkq7S7+wA+sUlQ==
X-CSE-MsgGUID: uDhCOagZQtensVKZtmoxfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62329526"
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; d="scan'208";a="62329526"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 14:54:03 -0700
X-CSE-ConnectionGUID: iRjcDKN+TUCz7noMYAgiTA==
X-CSE-MsgGUID: 8DloXX+OQ4C3ePFeNwanTA==
X-ExtLoop1: 1
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 14:54:03 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 20 Oct 2025 14:54:03 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 20 Oct 2025 14:54:03 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.38) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 20 Oct 2025 14:54:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZyiMQSop5xueUXdOdhEOwd4V55YbR+dSk2A31F7yOiziSBpEuQbZs7VsffagzlUFEC6UEgTk7VZiv/0Buaw4qi+jTjslL7skBjeu52fVcan56slnYiEUqCDPJe+robTzOZRBrAsjotfszgsU6GQtyi6cyf5nc4v65DrkHMW2NMLnkWVZRnzoFhG47/a6hr4sJzA2BrGha4E0UvvO53FUchEpR8b70EtNh5cKNWADi4RwmjjxStBc94/HdNtPHjxTo0PV2C+9aAIm9U/zZkjPhLAwpzAaLJ19HLZOiBPhqCeji0ckoiSRH5f+joboSVJEE3pgguogOh6CMox36gOeiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xHRtjl0jLsLXnag+KlQjhELMo0u7+uMgIfg5gzrtaOo=;
 b=SxRkCTvXgWnypF84KqR6cO8cD+yb3KrozgeJhDXiXvsvulC11Ct/u/audiFlF1JiEHBX8zt2nL7+AiCjpLAGlStKngUhnQ6vUvAGlOA/0+oCPJMJHKybZLD4AyZbv0PWIQPortkaH+yL4bM4LAhiIPiLPfz34jZiF3Of8WE+jdoPiKAMtRrLmt6l06f6g688+i/AJN9Xmx58GadAVcUwiKvCjeixv7TaUAnERyjznAcGkotjkt016EQljjtsdApUhBCUiFsXnXjKZAr0cVgVesMf0Es9HkDVtBy+fPOcGBpl9VPEwgItghkrF8rZFhkVxJ/gjDZCaxTgd7mruYOTWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV2PR11MB6024.namprd11.prod.outlook.com (2603:10b6:408:17a::16)
 by SJ2PR11MB7619.namprd11.prod.outlook.com (2603:10b6:a03:4d1::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Mon, 20 Oct
 2025 21:54:00 +0000
Received: from LV2PR11MB6024.namprd11.prod.outlook.com
 ([fe80::dc22:ef1e:53e2:f00f]) by LV2PR11MB6024.namprd11.prod.outlook.com
 ([fe80::dc22:ef1e:53e2:f00f%7]) with mapi id 15.20.9228.015; Mon, 20 Oct 2025
 21:54:00 +0000
Message-ID: <ddb0a685-e0fd-428c-b292-7925011d89d8@intel.com>
Date: Mon, 20 Oct 2025 23:53:55 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] drm/xe/vf: Do not disable VF migration on ATS-M
To: Tomasz Lis <tomasz.lis@intel.com>, <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, Satyanarayana K V P
 <satyanarayana.k.v.p@intel.com>
References: <20251020205808.1187308-1-tomasz.lis@intel.com>
 <20251020205808.1187308-5-tomasz.lis@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251020205808.1187308-5-tomasz.lis@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR04CA0124.eurprd04.prod.outlook.com
 (2603:10a6:803:f0::22) To LV2PR11MB6024.namprd11.prod.outlook.com
 (2603:10b6:408:17a::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR11MB6024:EE_|SJ2PR11MB7619:EE_
X-MS-Office365-Filtering-Correlation-Id: d555eb7c-5db1-44a5-ced8-08de10232d06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OXR2VlQwbmNxNU0ySisxaFU4Y0JmQlZTc1RPSDE1aFV6b2JJUXZZNFVpMDF3?=
 =?utf-8?B?QlM4ZytMYWpDNkVOK3p6bG02SzVQVjhhT3pONU14dnZyWXhyb1htaW1INVoy?=
 =?utf-8?B?aHFhYXhjZTQ0VGM4bjY1TnBFaVdKNlZNa3A5SFg5MHcwckpoRjllQzhadGcw?=
 =?utf-8?B?MnJUN1NjVkVaTEdMbHh5MWVVMFdmdHk3dnZkUDFldmlKcTh0RFYvWG15RllI?=
 =?utf-8?B?Z0xsUkZEMTZVWDdUdzVtV2MxZEFTbTZVWHBtVU1rUVRxa1BSKzZmZWFlbmRZ?=
 =?utf-8?B?V3p2cU1uUU53dmNxZHlBQmQvMW5URTlld0hlSDlTd3FBOFQ2QUhTQmJ0NlJI?=
 =?utf-8?B?eXN6RFBqSlhsQVpWSUNpMjNZbU1YWE1hR09SSUJXeDJPNEhmTHA3YzRLbXli?=
 =?utf-8?B?Q05vREdzOExsM3NIeEFZWndOQW9yTGpuSWF4WXNDbDZ4aTZDS0ljRGM0WGc0?=
 =?utf-8?B?eG82Qkx3L0tLNUJFeXRkUWxieUxrcS85SklueURnSTBYOFdVbklOeStLejd5?=
 =?utf-8?B?MUJabG8vNjdXcG82QlFxNFdUTEhDWFhPcTdXZEtNQ2ZEdW5wZzd3TUR5T1l4?=
 =?utf-8?B?UVJVUlNLeFNnRVU2K2NuYy9iUXZ1OEV0ajd2R3k1bm43Y0xvUnRzV1pSOVdu?=
 =?utf-8?B?amgycEZRcUtoRDNtZ2V3U0VwWXNYUFVBaVZ2Wkdpa3k1Z1liSXFDYU5TektW?=
 =?utf-8?B?REsvL2N0S3J5SWRPVndOTVgvWmJMdEFCNCs5a3IwaXZhT1pUWi9Vb2sxMmJq?=
 =?utf-8?B?SHc5WWc5a2l0NlpBWUFCODNlYlI1c0c3c1BPa0hIalgrSU1tZE5BRmo2Ymw2?=
 =?utf-8?B?SWY5dE9kLytmVWRUZTZmKyt5YlFlWGl4aS93azk0dVRYZDJYLzN0TGdMczZl?=
 =?utf-8?B?Q29MTkUrd0c3RCttOXBaWTJiTDY3OHRPemptUlJ6RUxQNE9FTVpSV1QxS1Iz?=
 =?utf-8?B?REI4UEhZTUUxRGJQWlVmQ20wNGZWTmpwRXVoOXFBN015RXBCVGRxS0xjY1RO?=
 =?utf-8?B?VjR0a1NoUFRUam5nZ0ZyUjBYV29Eblh4MG92VmZpSVpHR201eEtOYlUvVVdj?=
 =?utf-8?B?TkJRRDJSclk3V2dnMkhnV1Z3U0JWd0VwUE42cHJwWTJkdzY4NzgyR09maWpL?=
 =?utf-8?B?MThMdk9IUGJzRGc4ZCs5cmhJWnhXRmQzUXFOVVArMXN4Q01LUlhjd3RHZnNl?=
 =?utf-8?B?MSt1TER6aFJtZlBlanNDZ1NoZVpiWWM0b2FDdzdHODUrUnB4MzFDRW9ycG5p?=
 =?utf-8?B?cmlLU2gzcjdYMGJjWU44RHpENkhtOHBJMlZzcnUzR0U5aWFkamM4eTlEN0dG?=
 =?utf-8?B?Q2JDcXJaU0x4MzN0UndwZm8yS0F0ZlhzTXJONUwwMWVRNkN2WFJ5VCtGcHBG?=
 =?utf-8?B?eEJTMC93OGRpL1VQaXBFdUhqaHltR3dxRnZKOHBLdis0WTBtcnEvSEhlUGU3?=
 =?utf-8?B?YTZKOHF4dXpjb1dWdDN5REM1SEZBYXh1L29NdExCMGlBNm5OTVBuaGl1eUU0?=
 =?utf-8?B?bW9BUVRVWEcwY1hoZ1VCdzNpUk1hRVcvbGtuQUplUXFoMzNyTmorRldJRlJV?=
 =?utf-8?B?b1lGVkRRTnRwOHUyOEgzaEdna0FzczJjNktSTTZQZDRvZmtjcEJ5TG9ML0dL?=
 =?utf-8?B?K1JMSFdaWDBaWkpicTN6NVZwODdvUlNVVlVWblZPZVhvTkY1dDBhcEdRSFJD?=
 =?utf-8?B?N0ZmWER5RmVRZkszVmM4MHZKUkI5WnArMGJOcWFQV0tGZmwzWklMVHhsUHlF?=
 =?utf-8?B?WWI3Y3c4Zmpmb294YUJLZFlGT1VYZ1hUejJvRVlXTUl2VnZ0S01TeFlaNG9R?=
 =?utf-8?B?TnBEOGVNVTYxTC9lampRQjdzcno3cjFyWFYzVkJ0T1A1SVBvajIvWDZYUXk4?=
 =?utf-8?B?M2lGRjNPQmdKWTJkRm52UlhwQ0I0UDBmT3ZxTFVpYnhoejhWRFErS0JRWHVv?=
 =?utf-8?Q?Q735LScli2XYjdF/576kc7/Tmyo8YLWU?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR11MB6024.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UHRoL0gyRmtsRmFkYURSaXNrdUNELy9vKys3N09QcmJiTTNCdE8xNXdrS0M4?=
 =?utf-8?B?MlB6YW0vODg3R1ZWR1luSEpZZWNrUjNWVmtsZ3owTmUzbE5IVWxoRmZ3SlMz?=
 =?utf-8?B?WUMwUmhheXhXbFhrZ3dnaG1pSTFKMlZxa1d6SE9GaEtDc05XVWk2bUVhZmsw?=
 =?utf-8?B?bFQxY2pnT01CanE3Vm5CMFNSU2puOFhKdWVqSElCendWVndIL1VUdmJLZm8y?=
 =?utf-8?B?WC9ub1l4WmF4TWlIRndwS2szbVZDWXBXMkkxSXlqZjA2bVVscWw2OTBuSFps?=
 =?utf-8?B?T1Z3eWlTTmFsa0RobURER3UzZ0ZEVTRFcWJrSjgyamxaMmdTU0dlbjNSM2du?=
 =?utf-8?B?VE43cUEvT1ZzTDI3VG5LUzduLzh5OUdyNmFyMXFZRFhLTlY5L294T2pUdTZ4?=
 =?utf-8?B?SktHVFh6dmZHQzNaaEp1VnRYMTVOWGt1dEJ0ZXlOT2Q1ZkFQNXRDdStuRTZM?=
 =?utf-8?B?Y1c1ei92QU1wSk5sQTh3UWNVSVpFQWIvaUs3WDIyUDBBVTBiY0lKdXdZZ0Ux?=
 =?utf-8?B?VHVIbVBMUXJMNEJmU1pueW9EUmlGTzZCMHB1ay9WRWV2d2NybjRBNFowVEZW?=
 =?utf-8?B?eWJhVmU2V3c5ajhFaS9aRkk2NGlDS0xxakRsNVZPdWl2TEhUcDNVVFNERFpG?=
 =?utf-8?B?ZkxUZlNSR1ZYeTZPQk5WalpacFNWQUcvL2laaW4wVWt0dnUydGFjWGJTZ1Q2?=
 =?utf-8?B?WCtvRGhyejhwVnBlcC95U1pOcDdHTlM5VmoycEI4VWVaUy9vejRsVWZlR2FG?=
 =?utf-8?B?eFIzRlpXdFZWTndlWVRTclpVekdNME5HN1dFckErYndvYXNlaHZqY2tXdFFB?=
 =?utf-8?B?dHU2aGtzZ1FUcG1paFY4dGduMlRTVXZNMlgyalIwNWhGeXdyRFEwRW03VU1k?=
 =?utf-8?B?d1p1STFCSnZTUldwTlpHQUNEMGFVOWNEQnVLZW5sQWZUNjlPaUEwSXFSMFNq?=
 =?utf-8?B?V3JuaGVWaURxcjVTSkhkbVFzRGkzN0prbVBGcXQzTE9MRllFYUtIc3Z4WFlR?=
 =?utf-8?B?U3p0eXJkWDJhR3Z4MXdldzFTS0JaY0gzekRxUEMxRk8vME5PZjRtTUJuS05a?=
 =?utf-8?B?NU9QZGFEMTFFejNwZi9nVjZjbldoVTBqaUh1b3NkT2prV0VuN3Vqa0JCTDRr?=
 =?utf-8?B?N292RDE5RTJ6THBuN0I2cDJpdnR4cEltR0w4T1JRRmEvRWc3VzJhdFhwaFd2?=
 =?utf-8?B?R2hPbGVEM3VoNmQvcDNlMzVPbTM3dFRkYW9Cb1lkN2hMenBnMXcrQ1JjNzJh?=
 =?utf-8?B?ZWFMaC9YSU4zb1cxaUxNa01MeFBwQW1mWkVOZFZDYXJydjFPNHhSVHdvOFZz?=
 =?utf-8?B?cS9leTVKZGp2UUFESXl6YlJmVjdjTlpuNU1PMWhNRmFDdVJHdDJHZXF0Z3dF?=
 =?utf-8?B?Y096ODFxVlpzcnM2dHZnaXRxTUlkUkQ1QkFOY2ljYld5QjJJUEJzVHMvUHlY?=
 =?utf-8?B?QWtxRDRyc0cxYWVXNlNkOEpkekQyQjl4UkMxR045M013c2xudklxZEJRQ09S?=
 =?utf-8?B?OHpNMit0Z1REeEpMMVVZVFh1NHN2OTZhUTk3aG54UjZPekdwdmhQRVRXSU1v?=
 =?utf-8?B?MmpWOWxYNEEyYStSbGNSZ3NjQTVkZmVMaElwUDRyWDJyQWtTUnBhVWZBMkJk?=
 =?utf-8?B?d0ErQ0taUm9hakxsaGxOdEhncEdlR0F4L3FxNUZ1c0trYUVFazd3eDd3bmdR?=
 =?utf-8?B?RnJ2THlud082bHhnZ3Bac2JjMVQ4OW1EZFRoOVM4NnAxOWdUS2tiY2dreDNr?=
 =?utf-8?B?WlpMWHN6Vk5xWllVZGhDNDhmOHZhdldRK24wUWlTSFNMR3JYR21ZTURJRHBh?=
 =?utf-8?B?YjB4ekMrN1ZwNXhtMWN5MFg0UmE4VnlpWVdFTHJzZUZFdnFaUTFYOVY4aTN1?=
 =?utf-8?B?aWNwYlFWejlScVQycUU2TTBpelpiOHdydG5VSC9PR3R3dUhSTkxudkRORGJ1?=
 =?utf-8?B?a0ZpK3UxbnRPenVEbWF3ekxWOU5NOWZ4TGwxTGJKWFgvYzllZVI3YVJiaGZW?=
 =?utf-8?B?WitVWGExU3FVSm9oZmJ4M0lmc1hqTVVXQnUreTI3TXNCeHVpdzhnS3RFVVhJ?=
 =?utf-8?B?emJ5dTc4THBuOWQrUVBkYUgwaFVyVU1rcWwxYyt2RGNRSERJakgrQ1h0NFNr?=
 =?utf-8?B?WWZmZVB2c0w4aXRxcXFuSHJvQ2FUZkdRY1FXY3dSOSt3VUQ0UlptL2szWEFD?=
 =?utf-8?B?NWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d555eb7c-5db1-44a5-ced8-08de10232d06
X-MS-Exchange-CrossTenant-AuthSource: LV2PR11MB6024.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 21:54:00.1794 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OiNbvS1vDTNIs+89AHHiWsQZQE9oNzzGLFTSEosiciUXJ6n5ZlwqMtUX6qGNCofyK4zi1x0b/DEsLtNjelipD8EudZsiW+phxSxpZEJT2Bk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7619
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



On 10/20/2025 10:58 PM, Tomasz Lis wrote:
> The ATS-M does support VF migration, and it has graphics ver below
> the currently allowed range. Experimental support of this platform
> should therefore be available.

maybe the wording here should be:

"Our current support for the VF migration depends on the availability
of the MEMIRQ rather than specific graphics version 20."

"Relax our early migration support checks to allow also use some
older platforms like ATS-M for experiments and testing."

> 
> This change allows experimental VF migration support on ATS-M. It
> is also explicitly not allowing ADL, by adding condition on MEMIRQ.
> Supporting VF migration through MMIO interrupts would require
> some special handling in order to achieve reliability.

hmm, but is this something that we still plan to implement?
all official SR-IOV platforms supported by the Xe driver (PTL+) have MEMIRQ

> 
> v2: Add MEMIRQ condition
> 
> v3: Remove platform version check, as only 12+ are supported by Xe
>  driver anyway (Michal)
> 
> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_sriov_vf.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
> index 3a3cd9c35aa8..75760da247f4 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
> @@ -159,10 +159,8 @@ static void vf_migration_init_early(struct xe_device *xe)
>  		return xe_sriov_vf_migration_disable(xe,
>  				"experimental feature not available on production builds");
>  
> -	if (GRAPHICS_VER(xe) < 20)
> -		return xe_sriov_vf_migration_disable(xe,
> -				"requires gfx version >= 20, but only %u found",
> -				GRAPHICS_VER(xe));
> +	if (!xe_device_has_memirq(xe))
> +		return xe_sriov_vf_migration_disable(xe, "requires memory-based IRQ support");

but this looks ok, so

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

>  
>  	xe->sriov.vf.migration.enabled = true;
>  }


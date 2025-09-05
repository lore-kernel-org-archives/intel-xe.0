Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69479CA1013
	for <intel-xe@archiver.kernel.org>; Fri,  5 Sep 2025 21:30:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DABC010EC46;
	Fri,  5 Sep 2025 21:30:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Tkq2c97l";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19B7210EC46
 for <Intel-Xe@lists.freedesktop.org>; Fri,  5 Sep 2025 21:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757107811; x=1788643811;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=xlqZGzxmfdEcY+TzIzNGAM37OX4oorszh9AfZRS5wJ8=;
 b=Tkq2c97lRBTTOUa1qmgPjtg5LUMjHgB8XqYx31uTWaT+gOgcnUnxdtFM
 QuFmJMuElzORqjmYgDtjNgK1LFfd40phFbWiH/Q5ABihkHYwmwr9FZcy/
 dCZzQopGvxAH73+Vg13Zvh/9DLrSl/LQnuIidj1M+OlEm34oGQDe5ZuGN
 VJmJr07kS/YT+3xiwX1dWLjjSp7hR38aaHU5k/NCm9UeQKoYvWMqxrWXj
 D5dQg14KanvSqIzuVhkU6kBCDljh/DgEkvgyjEQRgHI5IjIyYVxMD55t2
 te9iXWv8ri4RS3ChY+3Uei3H41Fjx6Bn7N1NomymFyTJulkMlWXSHQsKW w==;
X-CSE-ConnectionGUID: 0o1Ljem1Qf6c/epqa4sCeg==
X-CSE-MsgGUID: wgIGFyYvSjqhoUaq5A6klw==
X-IronPort-AV: E=McAfee;i="6800,10657,11544"; a="70167496"
X-IronPort-AV: E=Sophos;i="6.18,242,1751266800"; d="scan'208";a="70167496"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2025 14:30:11 -0700
X-CSE-ConnectionGUID: x8uXtJxUQJW4L+RFiklvqA==
X-CSE-MsgGUID: 8gD2BpBeT1SJBPVXHzXzqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,242,1751266800"; d="scan'208";a="172705630"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2025 14:30:10 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 5 Sep 2025 14:30:09 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 5 Sep 2025 14:30:09 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (40.107.101.51)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 5 Sep 2025 14:30:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MmJyA68WNFgEzptTYLEdTXVzv7M1lxOWqvQdQHQ7OPfZjDS4VBi91iRcx1bGqUq4aCQuFDNc/MYUWFfb4HmLgP04Y+Ah0tAaHua3zOWse3zdWrPwRMPx1l9D9hUxK3ohFc6s7C7PlB+kJVfgYcWunxwfEhnBoSmgWQYoTioNI5quCbe6evAFyOlNG0xJzCQtHo+rijIQH5ccMgDw614Zycd3p/NhoA0x00PVblfCdEwoFIbIsPnVmr7mhn09p8F4oNlwvR7KzaomefTJU2WXXuFuk9JUoHoofdMa7R3Opj02C+oNIxjAU2jlPBUaTfGuNr8c5QzKEKBBR4q6S97ffw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/6beCCH0UlU3lx1eKTmoLHg3Y6K9VpDqEbYqupnkdok=;
 b=UZB9b01tzgYpveHSMqtkIHU+TMVRmTSs80zcCDGxHGNl4GBGh8JMbcJcs+eUn7tDkFDSrjBMX4YMhLlVm9GOzUdliu3M4xM2TbMywOKN+7o2u7Y8JzOK0XZWgNKBaJU/ECX6M/AMJ3O4ZK21TBcJFQtd9RmDsFSm8AoZcJDgFacCXhtV9FX1e73w4/B2d6Iqs3Pio0Qcwk/q6qh2JDDGj13VSpXwy0WpTmkEcrwS3ga0459OQRU/xtYR3Iwq7qlnZBlTM8RN3a0lEDtAjxR7PGdnzBkQyD8ydKkr1PssxacNX7L6rzYRZUsv0MDbp68VKGk/0uRMw7WwiyNENWEa8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by CY5PR11MB6512.namprd11.prod.outlook.com (2603:10b6:930:40::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.19; Fri, 5 Sep
 2025 21:30:08 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%5]) with mapi id 15.20.9094.018; Fri, 5 Sep 2025
 21:30:07 +0000
Message-ID: <d83f581a-4839-49b1-b571-49e20df814af@intel.com>
Date: Fri, 5 Sep 2025 14:30:06 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] drm/xe/guc: Update CSS header structures
To: <John.C.Harrison@Intel.com>, <Intel-Xe@Lists.FreeDesktop.Org>
References: <20250805234256.1021020-1-John.C.Harrison@Intel.com>
 <20250805234256.1021020-2-John.C.Harrison@Intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20250805234256.1021020-2-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0015.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::20) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|CY5PR11MB6512:EE_
X-MS-Office365-Filtering-Correlation-Id: 02192a81-6ba7-4588-a2cf-08ddecc362cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZlRBTGJDZ2pMZVpNaW5MTjNzZENvRXNIc09HOWZQSHBSMDEybk82Wkc3Nk9O?=
 =?utf-8?B?b29TRjU2amFKOFRhcDAzd2JldVArcjhZMlZ4OVdBL3lSM3hDb2YxUk5ySTY3?=
 =?utf-8?B?UzlScWZSbmtpaTlKcHlsUnRUeGtBWW96cjR2THIrK0ZSVDRubnp5VVc4cHVL?=
 =?utf-8?B?Nk9pc010OUVTZHZsMDkweHIxUDZYRnp3a1E0cGZJeXZJV2pFV0ZnNXRzT3c5?=
 =?utf-8?B?SXR5cExTS0ZQNm94ejhrVndYc0txQ1IrZzEyZ1lwTFp4RTEvdzZtUnYzVGJn?=
 =?utf-8?B?Y0ppZUZaeU1GYkpSVUxWdThBTE43SFIwTCtBc044a0NCdk5EdWY2d1QvZ2NB?=
 =?utf-8?B?VDdvb1ltZFhvTjZXSXphWCtMano1aEUzSE4zRmN5WUk4OWhMcS9uN3diY3hN?=
 =?utf-8?B?NDFjSDVRVGRTTXJ6SFUrRHI3U1NrUzRuTzBzTmdYNElwL2JiMk1FNTQyVkV4?=
 =?utf-8?B?b2ZZY3VxNXRJYXZnaVVjckpJZURqbUF1VEE0eHJlRHQxUVEwNDNiYWE2MC9D?=
 =?utf-8?B?b1B0bzU1TkU5TUs2a0xJSjlyRHNaQytmVEVjNDZhVXRRNEpGSE5kV3lsUXRZ?=
 =?utf-8?B?bGFlOXF2SmFhU3ZSeVE5ZDNCODBtbHRMT2tyQkRMYzRhRHlZZmFjVGx4QUJp?=
 =?utf-8?B?Y1M2dVNaallJMWlpQ0tBeEt2alZHOW82WVQ2WkRKd1BlMXB0MHhabjhRdGdi?=
 =?utf-8?B?cFBRMnk2VGk5bkJHYjdZcXloNDc4anNMamhOY1RicEhzZTY3NlJOZHZoMkJT?=
 =?utf-8?B?NzdHVHZjL3RYZ2psS0VZbDVzMXJKdkhTU1JBenQ0ck1ML0tvQVFUWk5KTTYr?=
 =?utf-8?B?clBXeG0vVTJUUVlUWERRR0VZaFVpendXbVZCVEsvNjBtQ2Q2VGFJdnMrOXdH?=
 =?utf-8?B?NkkrSDB1VUd6WUdqTXVrLzBFUDdmQzk5YkdqWHBRQ3Vrem5IcVdoaHV6VUti?=
 =?utf-8?B?VFVSQ2d4OEhIaUNyR3hsdmQrYWNmRXZXT0dtQzI3UWt4MUxkLzczeFlYUTZv?=
 =?utf-8?B?bWUyNFFlRkxtZzhYS3hISzVwQlRpNkduOXFWZTlYTHl1QThpVHVKaGsyNStV?=
 =?utf-8?B?Tm9VcjhUbnJGNVdpQ2V4ZG9XK0EwdVZmb3RHQUN3MDZvRXNvWVdJTzdZVzFh?=
 =?utf-8?B?dkxabjlIbHlOV1kxZ0R3MHp6dzVkYlBPSFR1bVNtNG9LVmo0Q3ZwY2RDVEtB?=
 =?utf-8?B?OFRiUmZEcHFRVVM5S1g0NEZYNVgrV05JczMwVUpVNkZObmdyNzR5NzNWUFBX?=
 =?utf-8?B?N1paODQ5cDBQOFdVTVZBaTF4NXlNTkpJSTJNNXl1Q1g4djdsdzhSZFJlUmE3?=
 =?utf-8?B?c3JrT0hiSmIrb2U2WDAxeE11cjM4WkhWVVdlbGRPOHBPR1RRMXRtckRsaVoy?=
 =?utf-8?B?Q2E0SjQycXFzV3d5OXNvRmE5Wit5YytSSTFjY0xwWUtKUXhydG1Mcm1TSWxQ?=
 =?utf-8?B?UVlJWkNnNTc1SmYvcUxDQVNzUEQ4MUtrN1JzRDIyb3NyWWJ4NUFqcFloUWlH?=
 =?utf-8?B?bUU5K2RuOXZoU3BmTnBhWDFRYjZqR0VHT1cwdzc4L21pUmh2d1lmSGkwNzlr?=
 =?utf-8?B?S3RWNC9EY1B4c2dGTlVieGxpdWh0SXUwcXlVRWtqN1VTZnQxV3lIU2tzUFFF?=
 =?utf-8?B?Y1cwSWhjYy9FaXh5bStvRFZSMklocG0xdjd3RjA2MENBTnRFWm8xaFFENm9j?=
 =?utf-8?B?MllxbTlRSTcrTStQeUNvTFhmbDFSR0lVdUltTVNvWmtZTDhlbGR3N2VXVWIz?=
 =?utf-8?B?RE1XeVByREtMT2VPU0tnUDg5WjVmaWhVcEZOOVErMVR3U2FoL0RBdmxUbzJY?=
 =?utf-8?B?eVdTTmptRnR2QkhLZWl3NTBhT0FHQXNVYzA0Nnd1NHFhVmpiaFk1Qng0UFpB?=
 =?utf-8?B?dU13a3hZSzFORFhpNGRqRmc2cWZiRVZVTno4QlNYUFBacW1pdmo4ZGZhQmFL?=
 =?utf-8?Q?fKpGiuzndB0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SkZxU2R2Z1BZZGpycHZqYWVVZmo1cW9nRjJDL2ZkdWZJOXVMWDBOTG9ObDF0?=
 =?utf-8?B?V0JBaVMzMWtCRmhVNGN4WHg1TVRKWGl5Q1MzV29DU2xNYWJkblNNRTkreUkw?=
 =?utf-8?B?OG1IWEJJWTIwWXIxWWx1L3NFNGhBN05XY25vMVQ4ZkFnem5PQitwb2N6SjFk?=
 =?utf-8?B?ckR0L1l3UVN0TEkvWm1tMnZsVW5qb1cycmswYzJEb3VEaC9IK2pKc1VGeWdI?=
 =?utf-8?B?cFpGUmJUSlRIWS8xSXRndVZIdE1ISDJrOGhuN25YNCtGdm5oOEpaRzNuQTkw?=
 =?utf-8?B?N1BJMUF3elM3d2t4cFB0b3BMNjBtMm5MOG5XVDRhalNTa2RET0o5RlBOVUM5?=
 =?utf-8?B?UGJpZ3pxdVlPV00vMFBvOGU0UjVKSmNvOC9PZTcvWElMOFpwMU5qZXBSdnEz?=
 =?utf-8?B?elM5NGh2dFdpKzE3ZVkzejkrTER1dENWKzVRbDMxY1o1WVlmaGNBWFBmZmdv?=
 =?utf-8?B?bmNxSGxnOUhvc3BWSEZZRG1jVWZuOXFya1Jnc0x0ZXNiNjBrMVB6UkFndm40?=
 =?utf-8?B?TTNQeXhPY2M5cno2cmdPWmZKWURqNUIxNjRoZXZXSlQ4eDh4MDNsV1lLZzlZ?=
 =?utf-8?B?MFo4eEZNVytDMUs2S0laS0FCUlhBWm1HYWhLUHZIaXBtaUxMbWduR3ZVd0lz?=
 =?utf-8?B?WEhKdjRaN3lkaWZjYzF3OGlvTG1UOWpnYUU4YjZNbm10U1owQ1MvV3M3N1dH?=
 =?utf-8?B?Y1I5am1OR3dURmRuUS9NRTdvRjIybDh0U1R5bm5EcXVaQzYyZS9UaEVCOTJ5?=
 =?utf-8?B?TERYQzJzblhHZDVaN0VoeWVzcWJGUUlBYnE0S3NwNjZuMWYvdGcva2MrN1Vt?=
 =?utf-8?B?elM2MGY5ZnJGM25FYnY5VEd0clcvWHpKZzNJL3RibE82YjJhOEY5Nm50cFE2?=
 =?utf-8?B?WFhiRlpSd092R1ZJeTlVQUNXczV0ck5IVHhsVUlGMGlPeUN2azIwMGpsNmNr?=
 =?utf-8?B?Q3BwMHlMZDZndkcvSitIWW52ODE3WUhWMkJRN2VSWHpuaXhxRXdEay9tS21L?=
 =?utf-8?B?cUJGQ3pNd2prODR4NTJoMWFOUkdlSlVyai9zN1djc1hhZmFNUHNzMGNkdGZL?=
 =?utf-8?B?dFdZQkllaXJzMlViWG9QeUVIQ3VTa1JOREs2WGozL2FOcWZ2K2xJc3haV0Rj?=
 =?utf-8?B?V1JRZFI0eFh0bkhraUFWSE9TcVh3aW1IZXh3WVFUZE5nbkQ3b0EwNXVVeC9Z?=
 =?utf-8?B?QVBSeE1pSWZTMWJWUnA5eWxWRmZ5ZTZzZXFhTUk5YWtVVDQ3cHFtR1ZmV29x?=
 =?utf-8?B?cHcvLzFYdlkzRUdsZVVMbDEvUStLaVRJeXlOdUFLdUVWUml5cEhFQk9DRENo?=
 =?utf-8?B?bUVjeUMvY2dGSzl4MHJ0d1Yrc281LzJtZ1RZdmoyQU5hQUR6OGZqSWtkRUJP?=
 =?utf-8?B?VFcyeTZESFV1UGNHYkZ3VytNcS8zSFgwRGo0R2toQWZvRStUQVR5UWk0SCsw?=
 =?utf-8?B?QkZLbThzak5FRXNSOE50YTAzOVlUY1V3c25hUHFGQzlPVzVyb2l4YUVSUngy?=
 =?utf-8?B?TDFqVEFwdTlOb3hYSGpWSStSR1RsR2RtMGxub2NadHNvaXQxTjJJUDNiS2pp?=
 =?utf-8?B?TFllR3BhM1NDT2IydnZzRjZnU2dMYmdwQThJVXI1TWNkMGxNZW5wQTZSRzBl?=
 =?utf-8?B?NUF1RU9LZ3FMakt6OEN0V0VVSHZpK1hUMk1KU2k5SlpoeUxMdU1uYmhsM1ly?=
 =?utf-8?B?Yk1rYTdKOG1RUERBQlM4NXBrNXRramd4NUkrK25uUk1PdVN2Y0NyTGp6aGlU?=
 =?utf-8?B?alJ2VGhLR29NeFRIRUJWNE16L2o0azNIUFprWEgxb0FFSkJ3Q09TdTBWZ3NQ?=
 =?utf-8?B?Qjc3MTZiNE00MnRqWnhseHVnUjJYVEVlUHRlWkZVS2FJVWFocWRzbWZuREt3?=
 =?utf-8?B?SHZLblh3eDZOR05xMXdzalBzQWwrUjFQRkF3bVQ1bVpOL2xxN2U5aXRiTW0r?=
 =?utf-8?B?Yk16dHJ2bTYxNCt2RUtRaWk5R0xKVnA3T2RJZHo4d0VqcWVRaHBLM2JMRWFt?=
 =?utf-8?B?RXhuSm1OUHFteXd3UkVEYUhyeG1Kc2lxT1JXblhWekdqQzdFMm9XeS9OeFQx?=
 =?utf-8?B?U1hxUjlwSFFnZEg3THF2Um9pZU9aRVBaTEgxMmhJZHl2Uno5RzVTRUlSTlFw?=
 =?utf-8?B?UURyN0drNlcvbHNQekxDUk1HUUhWY2JXUzZwRUY3YS9mTWg2TkhYcjdQWm94?=
 =?utf-8?B?b2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 02192a81-6ba7-4588-a2cf-08ddecc362cf
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2025 21:30:07.8356 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WBOe2ZmLt/SUe9yDTw9K8DOwiKPjdT8EhhjYt26bXajCvBwT47hJWfDnW9SIZrYS8T43+kYOka4LZJQ2Z0z2gCtesFRKc5PRqDr/uB849Lo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6512
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



On 8/5/2025 4:42 PM, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
>
> Rework the CSS header structure according to recent updates to the GuC
> API spec. Also include more field definitions.
>
> v2: Also pass the new GuC specific structure to a GuC specific
> function instead of the higher level, generic structure (review
> feedback from Daniele).
> Also correct naming of CSS_TIME_* fields.
>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> ---
>   drivers/gpu/drm/xe/xe_uc_fw.c     | 24 ++++++------
>   drivers/gpu/drm/xe/xe_uc_fw_abi.h | 64 ++++++++++++++++++++-----------
>   2 files changed, 53 insertions(+), 35 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
> index a236f1d37248..f037571865ad 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
> @@ -329,7 +329,7 @@ static void uc_fw_fini(struct drm_device *drm, void *arg)
>   	xe_uc_fw_change_status(uc_fw, XE_UC_FIRMWARE_SELECTED);
>   }
>   
> -static int guc_read_css_info(struct xe_uc_fw *uc_fw, struct uc_css_header *css)
> +static int guc_read_css_info(struct xe_uc_fw *uc_fw, struct uc_css_guc_info *guc_info)
>   {
>   	struct xe_gt *gt = uc_fw_to_gt(uc_fw);
>   	struct xe_uc_fw_version *release = &uc_fw->versions.found[XE_UC_FW_VER_RELEASE];
> @@ -344,11 +344,11 @@ static int guc_read_css_info(struct xe_uc_fw *uc_fw, struct uc_css_header *css)
>   		return -EINVAL;
>   	}
>   
> -	compatibility->major = FIELD_GET(CSS_SW_VERSION_UC_MAJOR, css->submission_version);
> -	compatibility->minor = FIELD_GET(CSS_SW_VERSION_UC_MINOR, css->submission_version);
> -	compatibility->patch = FIELD_GET(CSS_SW_VERSION_UC_PATCH, css->submission_version);
> +	compatibility->major = FIELD_GET(CSS_SW_VERSION_UC_MAJOR, guc_info->submission_version);
> +	compatibility->minor = FIELD_GET(CSS_SW_VERSION_UC_MINOR, guc_info->submission_version);
> +	compatibility->patch = FIELD_GET(CSS_SW_VERSION_UC_PATCH, guc_info->submission_version);
>   
> -	uc_fw->private_data_size = css->private_data_size;
> +	uc_fw->private_data_size = guc_info->private_data_size;
>   
>   	return 0;
>   }
> @@ -417,8 +417,8 @@ static int parse_css_header(struct xe_uc_fw *uc_fw, const void *fw_data, size_t
>   	css = (struct uc_css_header *)fw_data;
>   
>   	/* Check integrity of size values inside CSS header */
> -	size = (css->header_size_dw - css->key_size_dw - css->modulus_size_dw -
> -		css->exponent_size_dw) * sizeof(u32);
> +	size = (css->header_size_dw - css->rsa_info.key_size_dw - css->rsa_info.modulus_size_dw -
> +		css->rsa_info.exponent_size_dw) * sizeof(u32);
>   	if (unlikely(size != sizeof(struct uc_css_header))) {
>   		drm_warn(&xe->drm,
>   			 "%s firmware %s: unexpected header size: %zu != %zu\n",
> @@ -431,7 +431,7 @@ static int parse_css_header(struct xe_uc_fw *uc_fw, const void *fw_data, size_t
>   	uc_fw->ucode_size = (css->size_dw - css->header_size_dw) * sizeof(u32);
>   
>   	/* now RSA */
> -	uc_fw->rsa_size = css->key_size_dw * sizeof(u32);
> +	uc_fw->rsa_size = css->rsa_info.key_size_dw * sizeof(u32);
>   
>   	/* At least, it should have header, uCode and RSA. Size of all three. */
>   	size = sizeof(struct uc_css_header) + uc_fw->ucode_size +
> @@ -444,12 +444,12 @@ static int parse_css_header(struct xe_uc_fw *uc_fw, const void *fw_data, size_t
>   	}
>   
>   	/* Get version numbers from the CSS header */
> -	release->major = FIELD_GET(CSS_SW_VERSION_UC_MAJOR, css->sw_version);
> -	release->minor = FIELD_GET(CSS_SW_VERSION_UC_MINOR, css->sw_version);
> -	release->patch = FIELD_GET(CSS_SW_VERSION_UC_PATCH, css->sw_version);
> +	release->major = FIELD_GET(CSS_SW_VERSION_UC_MAJOR, css->guc_info.sw_version);
> +	release->minor = FIELD_GET(CSS_SW_VERSION_UC_MINOR, css->guc_info.sw_version);
> +	release->patch = FIELD_GET(CSS_SW_VERSION_UC_PATCH, css->guc_info.sw_version);
>   
>   	if (uc_fw->type == XE_UC_FW_TYPE_GUC)
> -		return guc_read_css_info(uc_fw, css);
> +		return guc_read_css_info(uc_fw, &css->guc_info);
>   
>   	return 0;
>   }
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw_abi.h b/drivers/gpu/drm/xe/xe_uc_fw_abi.h
> index 87ade41209d0..faceb437fd2f 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw_abi.h
> +++ b/drivers/gpu/drm/xe/xe_uc_fw_abi.h
> @@ -44,6 +44,39 @@
>    *    in fw. So driver will load a truncated firmware in this case.
>    */
>   
> +struct uc_css_rsa_info {
> +	u32 key_size_dw;
> +	u32 modulus_size_dw;
> +	u32 exponent_size_dw;
> +} __packed;
> +
> +struct uc_css_guc_info {
> +	u32 time;
> +#define CSS_TIME_HOUR				(0xFF << 0)
> +#define CSS_TIME_MIN				(0xFF << 8)
> +#define CSS_TIME_SEC				(0xFFFF << 16)
> +	u32 reserved0[5];
> +	u32 sw_version;
> +#define CSS_SW_VERSION_UC_MAJOR			(0xFF << 16)
> +#define CSS_SW_VERSION_UC_MINOR			(0xFF << 8)
> +#define CSS_SW_VERSION_UC_PATCH			(0xFF << 0)
> +	u32 submission_version;
> +	u32 reserved1[11];
> +	u32 header_info;
> +#define CSS_HEADER_INFO_SVN			(0xFF)
> +#define CSS_HEADER_INFO_COPY_VALID		(0x1 << 31)
> +	u32 private_data_size;
> +	u32 ukernel_info;
> +#define CSS_UKERNEL_INFO_DEVICEID		(0xFFFF << 16)
> +#define CSS_UKERNEL_INFO_PRODKEY		(0xFF << 8)
> +#define CSS_UKERNEL_INFO_BUILDTYPE		(0x3 << 2)
> +#define CSS_UKERNEL_INFO_BUILDTYPE_PROD		0
> +#define CSS_UKERNEL_INFO_BUILDTYPE_PREPROD	1
> +#define CSS_UKERNEL_INFO_BUILDTYPE_DEBUG	2
> +#define CSS_UKERNEL_INFO_ENCSTATUS		(0x1 << 1)
> +#define CSS_UKERNEL_INFO_COPY_VALID		(0x1 << 0)
> +} __packed;
> +
>   struct uc_css_header {
>   	u32 module_type;
>   	/*
> @@ -52,36 +85,21 @@ struct uc_css_header {
>   	 */
>   	u32 header_size_dw;
>   	u32 header_version;
> -	u32 module_id;
> +	u32 reserved0;
>   	u32 module_vendor;
>   	u32 date;
> -#define CSS_DATE_DAY			(0xFF << 0)
> -#define CSS_DATE_MONTH			(0xFF << 8)
> -#define CSS_DATE_YEAR			(0xFFFF << 16)
> +#define CSS_DATE_DAY				(0xFF << 0)
> +#define CSS_DATE_MONTH				(0xFF << 8)
> +#define CSS_DATE_YEAR				(0xFFFF << 16)
>   	u32 size_dw; /* uCode plus header_size_dw */
> -	u32 key_size_dw;
> -	u32 modulus_size_dw;
> -	u32 exponent_size_dw;
> -	u32 time;
> -#define CSS_TIME_HOUR			(0xFF << 0)
> -#define CSS_DATE_MIN			(0xFF << 8)
> -#define CSS_DATE_SEC			(0xFFFF << 16)
> -	char username[8];
> -	char buildnumber[12];
> -	u32 sw_version;
> -#define CSS_SW_VERSION_UC_MAJOR		(0xFF << 16)
> -#define CSS_SW_VERSION_UC_MINOR		(0xFF << 8)
> -#define CSS_SW_VERSION_UC_PATCH		(0xFF << 0)
>   	union {
> -		u32 submission_version; /* only applies to GuC */
> -		u32 reserved2;
> +		u32 reserved1[3];
> +		struct uc_css_rsa_info rsa_info;
>   	};
> -	u32 reserved0[12];
>   	union {
> -		u32 private_data_size; /* only applies to GuC */
> -		u32 reserved1;
> +		u32 reserved2[22];
> +		struct uc_css_guc_info guc_info;
>   	};
> -	u32 header_info;
>   } __packed;
>   static_assert(sizeof(struct uc_css_header) == 128);
>   


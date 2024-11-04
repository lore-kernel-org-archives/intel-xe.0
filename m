Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E611AD1BDE5
	for <intel-xe@archiver.kernel.org>; Mon,  4 Nov 2024 19:13:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADB2610E3F7;
	Mon,  4 Nov 2024 19:13:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gs6IYzwx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0593910E3F7
 for <intel-xe@lists.freedesktop.org>; Mon,  4 Nov 2024 19:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730747579; x=1762283579;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=XiMLZAIuGttRhVleavlXvem63tD9ajegaPXT1VGzMiQ=;
 b=gs6IYzwxCPqekj9I70P8IvJfBHjFJsm4N4k3I+rcy4VoNTudZG70KHi+
 GHI84H/WaiPC2ETHDjExlhOewJG+uHaacOjPvsVGTFym+u70w4vwj5Upb
 AsFoM9Nnjwpn9REmOguAjWLozl77V0VS9VTlJcLVwiozu5Se5AyOkvx/2
 PY5WQYISuGK4G+W8jQGTElFCabgIG0LDt5SFgkvblURsIrbpt9D2to2/R
 Snp8fKfZ0W4SrlPVPpl9IUdDdItuBvmSUDPGfuQisMkbwKm4BQXOebYZL
 AlBbE0wUebJpTIdq/+ZxQYKM5d74QXyqtlIapfXaERfzgy8ypi5co4yrt Q==;
X-CSE-ConnectionGUID: gapJTtyqSRqmF4UxdhcMbw==
X-CSE-MsgGUID: P0EpEajXS+CGjZxFKpSbIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="18083804"
X-IronPort-AV: E=Sophos;i="6.11,257,1725346800"; d="scan'208";a="18083804"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2024 11:12:59 -0800
X-CSE-ConnectionGUID: WQjSlfh/TWKZpbGSqz3z+Q==
X-CSE-MsgGUID: rOjPN/vcR/a/w/jUYrGWmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,257,1725346800"; d="scan'208";a="83865339"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Nov 2024 11:12:59 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 4 Nov 2024 11:12:58 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 4 Nov 2024 11:12:58 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 4 Nov 2024 11:12:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OFE9LNUkXGSotigO842aqB3uukbqE07KbIWbGyG/o7SF6WyRwvfuQTxLuJ8PNp1z3Z6XbAX8S3D9XBX1F88a65Xjc6dQpcPRKjJza7ZkCs0XouIVbgg1LKYCrZnPDCzDUE30Qt5/Y8bafPqwWebgMXlowt87wA2aY96bf0JllV1h/56UENkyirVb9tTt4OZbUR1cCLXkd0Kb78FXhiXHjtMULL46X6T/q3FRoYzEi1fGGurULDQcwJYkpPdrSvQtYOLYLrBqDSRWWd099iNoPXHPMw6gInOKe/v7KEv21WGpeoI1tfJvuRaq/byigD+1n97urC1RFZWL+Gt1O2b88g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rLyLH+dTxcxFFnIf1UtGhUBwCNi7avi10pMJ5oNBbzA=;
 b=ZOKr/vn5Foq3zM5MAiMTfgQDxJ1i79ori0O/4iYe7Do176r1Md0PSENsGCgKGG1bsHSygr1pbYItMc7BTWofTRMSlxIdmyC4oNfvqR7p4whDdG0Wpv7QMSEK/y+eA/w2iKy33M3GSnYpEmgANYdTCX0nYFlVZwp3AI1yoktldASFW8x+oX3lPVgF+9+gUGV8MxkAIe9Ok5TooyDtKSmo1+3q/dN3b6TwZ2gepqC88x2/2zX50x93bMN56EfwQS04/OMUiidz1mkY9lhVrnm/6TCHMHxgZVKIjBxpisvKRGspXglr+JrnUpSQ9pBiQsHo0ooaPtU+xFLbRozKeguNpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by DS7PR11MB7908.namprd11.prod.outlook.com (2603:10b6:8:ea::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8114.30; Mon, 4 Nov 2024 19:12:54 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8114.028; Mon, 4 Nov 2024
 19:12:53 +0000
Date: Mon, 4 Nov 2024 11:12:51 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3 5/5] drm/xe: Sample gpu timestamp closer to exec queues
Message-ID: <ZykcsyXx7qkGxDQI@orsosgc001>
References: <20241104143815.2112272-1-lucas.demarchi@intel.com>
 <20241104143815.2112272-6-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20241104143815.2112272-6-lucas.demarchi@intel.com>
X-ClientProxiedBy: MW4PR02CA0010.namprd02.prod.outlook.com
 (2603:10b6:303:16d::8) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|DS7PR11MB7908:EE_
X-MS-Office365-Filtering-Correlation-Id: 9700046a-5c9d-4c54-ce6f-08dcfd04aec0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?azlTdmpDN0dUbE85Yk5BcnpsUVA2ZHFLeWZJZDJOcTloOVhkY2FMcHhiQXpL?=
 =?utf-8?B?TXFHT3BWampXYlI1UTJuRzUwR0tOa1hQbjBQcEJMSmVxbVViMkFjblU5N0Rq?=
 =?utf-8?B?VFBFVWxCUURvMTRHUGh1TWxqeTBtcGpWNnljQWtjMXZDSHk0NWdqMzRORW5p?=
 =?utf-8?B?cDUwTit0dk1mWVZPeVNDdExSTHVyNmhwTEpXVVZCUExVL1FZTVVVQ0RROHNR?=
 =?utf-8?B?QmtrdGdsb3hka3B0KzdUUkRwTzlyK0lnUlN4TjBYY09lOHkxQVRrN3lucWZG?=
 =?utf-8?B?L0hyNmJqeER3Q0tVajNiWElTcXlGU3F4cVpReG54UzNYTU9UTEZ0RGcxME1m?=
 =?utf-8?B?QTdMdE9zZG42ZlFUN1J4dnVhcXJiWTBLbzd1cVQ0TmpJdmQ3S1JlZ2tvUlph?=
 =?utf-8?B?aWwzYUtvZVpCaEYvU0FoYjN5OHFzT3h1VkJtYll0T2dBazIvYmxvVmFnTC8y?=
 =?utf-8?B?djAxNUg4SCt5OUd3cC9QOElnTzI2dTV3NmFzS2FCSEtTeFYrZXdMSTBlZmhD?=
 =?utf-8?B?bk43aXB0cGR1Ly82UE1UWDlpRVdtU0N0NHQ5YmZmcDVVaXY0QnJkK25Jam8w?=
 =?utf-8?B?enJpdk1VMG53dmRiVDdkOGRTa2g2MHZtbDJEd2NqR2tKdGptYVFqQ2g4WkZx?=
 =?utf-8?B?UVN4czlzcVR5TWgrL0RKSTg1OGhadW9hbElFRC8rYlRSYStGYzZOOUlsak04?=
 =?utf-8?B?TmZTWmpXVFYvZzhzc2pUcjE3V2FHaGRvOThrVzZHTnZSOEdIYUI4NGdpK01o?=
 =?utf-8?B?TGQ1Z3UvWG9SZURqNTZPeXBOM2NsOE5CN294NVRVWGF6UmE2OWNBWWlYM1N6?=
 =?utf-8?B?UFUxV2tzTE5xM0RIUkw5cXdsL2x0b1krRG5DTlNHaTRpMWcyZXpYOTlwVDdI?=
 =?utf-8?B?b2pURlRuTGhCdHRDTDFSR1Z5T3pzU1NScHJLYVNwRmhMMk80a0ZLQS9YMEZN?=
 =?utf-8?B?WHduNGNHa2I3OERHZHBuSW5RMHl0N0ZJZDNnazVCL2hnYVo3NFhjRWdnbnF6?=
 =?utf-8?B?OVVNM3dyRlRTSE50UjdnUDhMZ3k0U0tjVFdnZjlweXBOa0l0dURrL0RwUTdp?=
 =?utf-8?B?aTZOc29leGY1R1d4KzltUHVSbUh5Q1Zod2krRmJ4ZzlZSEtXbkxsU0RkK1V2?=
 =?utf-8?B?Z252NzlheFhOQUh5OC9ERmZsOHV2dGhRU0RQTzBMUERHeGY2RTJYM1BEVk5Y?=
 =?utf-8?B?My9jMkhzcExwUFdYT3VyWG9LVTdjQmk4eStNbVRiR2JMdm5ZZVFKMGNGWUNV?=
 =?utf-8?B?SVoyYlUybGo2R0NsL3NZeDUzbmZlN1IrQ0RReFJIdnZPMHpXb0hCKzFRNlM3?=
 =?utf-8?B?dS9oWEt1S1NkS2R5ZDV6NUozRDcyYUV6T0hzWWYvRTNwZytqYkUzVVF0Rkxw?=
 =?utf-8?B?dVdUM1VCTFVRSmEwQUN3RVdJZy9LRUhhZHYvTjdKckZ3VDJRT2hQZzRjNStq?=
 =?utf-8?B?dTludmx3bXJtVklrVHRlcHpDQlQ2a2pLaXhWd0txeVFTL1dsaDlaQ1p1RDU5?=
 =?utf-8?B?NFNLUU0zT2d6eXZpUEVpU1NreENYM2hyU2FrZVZlUlFTVThLNTlvSURySXBQ?=
 =?utf-8?B?M01yQlhRSzhkQ3plMThmd3IvdjRvMlF3eHJSSVFJNHdCZ3N0cXRuZkh1OG1J?=
 =?utf-8?B?Uy9pWjUwTXovSE95eTNPWWswV0tGdjlLNk9ib2ZDcHR5TkhuZFZScWwrSUdP?=
 =?utf-8?B?K1FwRSt0YUhkV2hHRUxIcm1JYy9VbkRMTlVpWE9Vb04yZGdFbzZhWm04TjhW?=
 =?utf-8?Q?En3nxLmoJ2zaad3+eVFTShjW4oB3siVEzRP458W?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ekFUdDFmNE1MUTlqMkdQVnZmR0dCOUZSVzVBb3pYRUN2TlZSeXVvSVFLMzQx?=
 =?utf-8?B?eVJSMlVVTWkxc1Vaa2IvVFZwdVNIRXhySXNRSE4vRkJxa2lQc2txTGhrYUJx?=
 =?utf-8?B?eDNRUE41Ti84S2xJeWdCWFhhaDJESmtWcGpvWDVkaEZkVDlzMzdFbk9nZWdM?=
 =?utf-8?B?WU5FMkltUDYrbFFQcSs4M1hHKzJ0NUUvL0czWi9iM1Z3TTZCMFBQcjlvUm16?=
 =?utf-8?B?b1FnWDNuME5kcU9udDVYT1JJNmFxR0J2ZEUxV29uQnFnQkNNamdhQTRLUzlI?=
 =?utf-8?B?cVBnMmlYOWtueEg5SkhFUGRlemZYb2ZLcjVvNjFWckthMU1RbThxS0IzeWdm?=
 =?utf-8?B?NDFjZVJxNXk1QnRycGtKTHkvdEx5VUJQTWE3SUxDTmtiWTdFazdHbWpJMjJq?=
 =?utf-8?B?bkx4cVplWFRqYUY2SVVpTnhzMjlUVlhnNHNUZFBpRkJ5eExOQmErVW1ib0Zx?=
 =?utf-8?B?Q3RuamZWeXNuWFlRUGt5UC9yUnNWaExTN2dEWVU5czJFcmk1c0dZNjlUMFJB?=
 =?utf-8?B?WWhxMG5ndXZ4eUJYYk5XRk12YlEvbExaRDRoeElxeTQ0TlRSSzhHcFg2U2I5?=
 =?utf-8?B?OGcyeHdFenltaTJrNlNwVjFVdytXQkI0TmdVMzFKQ2hqY0h4cHpEaTFoS2lv?=
 =?utf-8?B?UVBrTDhDQ1FHZWplSjBvTHdOQ1NkeEE2MEswQWdtcU9NQzVvVFZuRmRUV2pC?=
 =?utf-8?B?VEtoc3ZwcGFKL2hBZkhzMllhNTgxU29mK05oTTJFdWh3elRodFVzRnhsdmJH?=
 =?utf-8?B?NUtMUjJndHBWZGtjL2dmNjErWmhCWFB3WTNIdlYveUMyeU1aamdkZlVWVkIr?=
 =?utf-8?B?dGJRU3R6MHFXWXNINHlkQzAwUHBHRnJjM1BleVlweDl4MkVMNWNnZ25NTzBk?=
 =?utf-8?B?YnJMa3pDN2xzTjRKVXlYN0owZlkvcGhUdUlWZDRkajRaOXhjVjVYY09iVVVO?=
 =?utf-8?B?RXFXUzNRMU5jYklVTmJObEpZZ1dIUWtaVkJrRDV2ZXNIS0lsRWhtNDFRNCta?=
 =?utf-8?B?Mjk5YjZtanNhY1JMc1c3S2lLTUNjTDNMcW5wbkgyRlBuemprSThYS2hKUzBa?=
 =?utf-8?B?STlTVXRIZzhqdWwwenhzNzBmcjUwekkvYlAxSzJQay90VGZ0KzFqWlI5eGR3?=
 =?utf-8?B?ZGxVY3M2V1VBb1o3b2RTRTZwcW1zZ092aEIzNVp4MHNXSDBMTnNKQzhieTZw?=
 =?utf-8?B?MkVwNVI3dnVRYzBBUzN6TzlPY0NjSThya21wY1pxYitVZXlvbWpkREwxQVUz?=
 =?utf-8?B?dmVkeENxTUNCeXYvR1JJTUx3Z3JITnV2c2ZxZEQ4bFlTa2tiMk1HS0g3RDA4?=
 =?utf-8?B?eVdGZ043NFVuaHZaUmZiWVIyT1dMK1NxS3VxakRZak9JMGpMYTNJT0t0YjJm?=
 =?utf-8?B?Y2kyM1ZOSFlTMStHYmNzTE80dmFhRHZsUGg2WmE3SkpiOFMrZ09IT2duV2Zs?=
 =?utf-8?B?eTZpQ0RMT2Z6TTFRV3R1ZjVwYzdLNlVSYjJyVzdRbG5ndzVzcFZzcGFUVzNu?=
 =?utf-8?B?M0hsVzc2cyswaU1rVyt5bUgzU2hYMWFMZUU0b2pkT21jSCtRWXVaNWNVSHJK?=
 =?utf-8?B?dlBBak11dGoveHM4M0IxYlRkanpSdkdXL05aL1d1S0Zua0xNd3VxTHFGWi9B?=
 =?utf-8?B?Q2poVjY3c2hEYXBodUZtR0NvUmNHRUJYVHZZcWRPTVBsQmhGc3ZwV2lLZ0k3?=
 =?utf-8?B?bm5lVG9VUXVSVGU2ejZaTStxTnp5S1JRdjJjWDFxQzdBZGorR1hueWF3MTZm?=
 =?utf-8?B?Vm15SHdyKzZIejNpcHhndjJCaERLY3QvUDZSWlNEYUlJaFVlQmtia0YrOTBo?=
 =?utf-8?B?ZWRpT0ExZUViTTF5ekc0ZzlpVFBVMng3dHpGZEsrRGt6Sy9qcEUyaFRlT3JL?=
 =?utf-8?B?RmFFdmZPcEtKN1NQa0hySFVQVXNYZ1Z5UWY2VHR3RlFvV2lNMnFVNmRCZ01W?=
 =?utf-8?B?cjh3elkzQ0pBdlk2WGI3NFFpK1loSG9DUGhGSm51ZDJFMFY3OStFR2pycldx?=
 =?utf-8?B?ODNYUTRsb0RVUFNyRDBVbGN4M1dLRlpqdmp3Y2NpRlk0UWxPQlNxUWFPaDNW?=
 =?utf-8?B?aVFWMDRVd3JIS3RVbGpuaTQxSDBuR2lodWgrZ0t0VXlNV2xTN3JvbkVsVHVI?=
 =?utf-8?B?cjU5UFRkWUhZczJsV2V5bU1ZU1pIWTFLa3JyVkJCb1NZNlJiUVk0aDR3YmZG?=
 =?utf-8?Q?pFNjgPFyFu5EX62S/+8SHnE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9700046a-5c9d-4c54-ce6f-08dcfd04aec0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2024 19:12:53.5463 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +WAy4V9Kxm7SryPS4XtLKX24xcuF0X5OW8lmnqemqe/a0BEXI/npwtRFnJ2GH1Vgjbih4K8M8B78SQo8fggqhFpbtfWwDRPa0D0RlzylMFY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7908
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

On Mon, Nov 04, 2024 at 06:38:15AM -0800, Lucas De Marchi wrote:
>Move the force_wake_get to the beginning of the function so the gpu
>timestamp can be closer to the sampled value for exec queues. This
>avoids additional delays waiting for force wake ack which can make the
>proportion between cycles/total_cycles fluctuate either to more or to
>less than the real value, depending if the delay happened in the first
>or second sample of a top-like application:
>
>	sample 0:
>		read_exec_queue_timestamp
>					<<<< (A)
>		read_gpu_timestamp
>	sample 1:
>		read_exec_queue_timestamp
>					<<<<< (B)
>		read_gpu_timestamp

This is inevitable in sampling where 2 values are sampled in each 
iteration and a ratio is taken. Since you are trying to reduce the delta 
between the 2 values in each sample, this patch does address it compared 
to before, so this is

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Although, I do have some concerns/suggestions which can be addressed 
now/later.

1) gt timestamp is theoretically allowed to tick at different 
frequencies for media vs primary GT. We could run into a compatibility 
issue between run ticks and the gt timestamp at some point. I would 
think q->class and gt used should be compatible.

2) can we cache the "any hwe" early on at driver load and also whenever 
it changes at runtime? The fact that we find the hwe on every fdinfo 
query seems unnecessary.

Thanks,
Umesh

>
>Additional delay in (A) will cause the utilization to be bigger
>than it should. Additional delay in (B) will cause the utilization to be
>smaller than it should.
>
>With this a LNL system that was failing after ~60 iterations, get to run
>to 100 without a failure. This is still not perfect, and it's easy to
>introduce errors by just loading the CPU with `stress --cpu $(nproc)` -
>the same igt test in this case fails after 2 or 3 iterations.
>
>Although not perfect, this could be viewed as just extracting that ugly
>loop to "find the forcewake for any available engine" into a separate
>function, and at the same time improving the results a little bit.
>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>---
> drivers/gpu/drm/xe/xe_drm_client.c | 63 ++++++++++++++++++------------
> 1 file changed, 39 insertions(+), 24 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
>index 24a0a7377abf2..874c2157baf49 100644
>--- a/drivers/gpu/drm/xe/xe_drm_client.c
>+++ b/drivers/gpu/drm/xe/xe_drm_client.c
>@@ -269,6 +269,40 @@ static void show_meminfo(struct drm_printer *p, struct drm_file *file)
> 	}
> }
>
>+static bool force_wake_get_for_gpu_timestamp(struct xe_device *xe,
>+					     struct xe_hw_engine **phwe,
>+					     unsigned int *pfw_ref)
>+{
>+	struct xe_gt *gt;
>+	unsigned long gt_id;
>+
>+	for_each_gt(gt, xe, gt_id) {
>+		struct xe_hw_engine *hwe;
>+		enum xe_force_wake_domains domain;
>+		unsigned int fw_ref;
>+		struct xe_force_wake *fw;
>+
>+		hwe = xe_gt_any_hw_engine(gt);
>+		if (!hwe)
>+			continue;
>+
>+		domain = xe_hw_engine_to_fw_domain(hwe);
>+		fw = gt_to_fw(gt);
>+
>+		fw_ref = xe_force_wake_get(fw, domain);
>+		if (!xe_force_wake_ref_has_domain(fw_ref, domain)) {
>+			xe_force_wake_put(fw, fw_ref);
>+			return false;
>+		}
>+
>+		*phwe = hwe;
>+		*pfw_ref = fw_ref;
>+		return true;
>+	}
>+
>+	return false;
>+}
>+
> static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
> {
> 	unsigned long class, i, gt_id, capacity[XE_ENGINE_CLASS_MAX] = { };
>@@ -282,6 +316,9 @@ static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
>
> 	xe_pm_runtime_get(xe);
>
>+	if (!force_wake_get_for_gpu_timestamp(xe, &hwe, &fw_ref))
>+		return;
>+
> 	/* Accumulate all the exec queues from this client */
> 	mutex_lock(&xef->exec_queue.lock);
> 	xa_for_each(&xef->exec_queue.xa, i, q) {
>@@ -295,27 +332,7 @@ static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
> 	}
> 	mutex_unlock(&xef->exec_queue.lock);
>
>-	/* Get the total GPU cycles */
>-	for_each_gt(gt, xe, gt_id) {
>-		enum xe_force_wake_domains fw;
>-
>-		hwe = xe_gt_any_hw_engine(gt);
>-		if (!hwe)
>-			continue;
>-
>-		fw = xe_hw_engine_to_fw_domain(hwe);
>-
>-		fw_ref = xe_force_wake_get(gt_to_fw(gt), fw);
>-		if (!xe_force_wake_ref_has_domain(fw_ref, fw)) {
>-			hwe = NULL;
>-			xe_force_wake_put(gt_to_fw(gt), fw_ref);
>-			break;
>-		}
>-
>-		gpu_timestamp = xe_hw_engine_read_timestamp(hwe);
>-		xe_force_wake_put(gt_to_fw(gt), fw_ref);
>-		break;
>-	}
>+	gpu_timestamp = xe_hw_engine_read_timestamp(hwe);
>
> 	/*
> 	 * Wait for any exec queue going away: their cycles will get updated on
>@@ -324,11 +341,9 @@ static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
> 	wait_var_event(&xef->exec_queue.pending_removal,
> 		       !atomic_read(&xef->exec_queue.pending_removal));
>
>+	xe_force_wake_put(gt_to_fw(hwe->gt), fw_ref);
> 	xe_pm_runtime_put(xe);
>
>-	if (unlikely(!hwe))
>-		return;
>-
> 	for (class = 0; class < XE_ENGINE_CLASS_MAX; class++) {
> 		const char *class_name;
>
>-- 
>2.47.0
>

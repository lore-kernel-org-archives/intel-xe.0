Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25C55CCF9EA
	for <intel-xe@archiver.kernel.org>; Wed, 29 Oct 2025 01:31:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3DB910E6CE;
	Wed, 29 Oct 2025 01:31:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S3S7sLWi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3C9810E6CE
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Oct 2025 01:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761701510; x=1793237510;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=CLE2aHGbSX2Z270Z20fnpgxeq4iNepSwDIhVNCr0AwI=;
 b=S3S7sLWitZ9jPIFi8EkvG97BUeHSNtSMhdrNNvQWp5QfvQc0hTINfrwt
 /M0E8JZ9Pj2lQyYgR0iAtnZa2PPj2vl9+nKqEnt9RLP+SSouzZe1jjf+9
 pfHjUYUcCTueX/1zoiugXGF/vOXW8Kpw1AADVVHO8CGjNIngEB9yY2YOE
 IBTfKOrj05N0km2zdSAEFV4TZUFMk4URvIP5jsv9NxgyT5NsYoBFXfcTJ
 +86oF6h99g9YpZ3n5B79lNPYwEazG+ZbM3+zsYoWSsnV+lvfqpnvjHRMP
 n58dzMbO5qScZfxT7DZyNfsc0ccgJ3XIkFtvmln2KKB5Rq4uAYFkryhUQ w==;
X-CSE-ConnectionGUID: iDDQZyU7Tbu6hG2CwoaR0w==
X-CSE-MsgGUID: Cqd9Wk+QSIi4+uyedlLo8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63852519"
X-IronPort-AV: E=Sophos;i="6.19,262,1754982000"; d="scan'208";a="63852519"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 18:31:29 -0700
X-CSE-ConnectionGUID: LNBPlIFPR0S/Y0REYEXDNw==
X-CSE-MsgGUID: 2DCzfRn8RDGaZqIqkiLFKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,262,1754982000"; d="scan'208";a="222731200"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 18:31:22 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 18:31:21 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 28 Oct 2025 18:31:21 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.19)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 18:31:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lTn2y8z0p9oc+7MpHUqdNt3mCxjAu932Yt/2VqnRXh2P5DR/pHUyKhjM6Xjzml1XUVgpB4zZ5JP1GU5Q7G0WwSUX74yyLldwtBJQNJFlejJWx0kFtTHQEVqEpkbJZHCHUbGNprZgb4hWklhlRo7Qw7WUuuLiIWFemJDc+rveoknmNexe7YIFRh+DVlCUHlrvn26XLJ6W9M1gjoSaIdlMkZBckj9bOlwta291ayuHOpEMLWdFUPEvw55Zco8p7REQOyKNdd5ilPyXGf0ghUZcHgHTZnpIeYd86A1dArYQyxmtw04RR7i326a5VGvl8QV5Sq+nK0nHTAljK0AqAE+DRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aShGIXwlKW0YAl2J0TgBSslngyyJIQnWmd9f12Pgjqk=;
 b=pOyak5tH+8LoKcRBrf8rB4a1yIMztwhWQN1eM1o1yLimpOT5QBUtonbMB5wiD5aPdHK2ZgRm8xlRqFu2uRBdsFgkz8W2emeWdwVZZUAAJzxW+wC5beT+bUf8ISPCdYNTLfAMR0hVKHOxCy/Ac22ICRIYK5F4qjOhBMoD0ubnvp41WDEwEv6NyGzpZJ6qCsDoC5VTkb8M9/W32ndzLHh1qu7XRA1u3TENLTJ9TY/n0Cp42OHokY/aWwMVLccU63wY5uvfeX66Dxa6QMDxyvhGUyOyx8kGKVoba/A5/ikljgqW9z1uGRPZ0Cu3J2cLXVATwmTBTlI0vWAfOIyD2dgwzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB7505.namprd11.prod.outlook.com (2603:10b6:8:153::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Wed, 29 Oct
 2025 01:31:11 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9253.017; Wed, 29 Oct 2025
 01:31:11 +0000
Date: Tue, 28 Oct 2025 18:31:09 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Nareshkumar Gollakoti
 <naresh.kumar.g@intel.com>, Christoph Manszewski
 <christoph.manszewski@intel.com>, Maciej Patelczyk
 <maciej.patelczyk@intel.com>
Subject: Re: [PATCH] drm/xe/pf: Allow to lock/unlock the PF
Message-ID: <aQFuXW5WUeUu1f6r@lstrano-desk.jf.intel.com>
References: <20251028200521.184592-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251028200521.184592-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR13CA0234.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::29) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB7505:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ab80e81-aabe-44ae-ce9e-08de168ad7d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WlhOd1hMUEFEL0YwdWc2VVZPZmpTUExZZUUwd2JNYVBIRHJsbnI5VWtEKzlP?=
 =?utf-8?B?ZVRldlNKRlRnMUJaMXJoWHhnMlJWRHZ0OFZkMXVLT1pLRUxSVlFOU0RreFpE?=
 =?utf-8?B?QldqUk1BODYzYU4vbXI1UjVDNjZoU1NwekJwN2NtdE5YaUF4WUxvRmdLdWRn?=
 =?utf-8?B?MGRUZWZOSGk4OHJxYk42WEpGaFkya2FBaXFlY1JsZ2QyNFNFQ3lzVndueEhO?=
 =?utf-8?B?dEVWMVhUd2pTckJFK1hUWjdUSWxjcFBIRitYb25jNjRLdWxKZFZmS1cxeVQx?=
 =?utf-8?B?QnpCMlNDZExwdXpESWdHTUVBZlprMGtJdHU0K2ZaUXl6azdaTlZDYjhaNG5B?=
 =?utf-8?B?ZGFsc0grdEhTdzVkYTBBWHFpYS9sUTFoMGNYcEpNN09ESE8xcU5ZZWR1TkhP?=
 =?utf-8?B?UllWcG81bVIzSDJpV0NtN2pTTW1OOEVmbEpnYUFtYVU2MzdTeUdTeTFMZHV4?=
 =?utf-8?B?eXlEa3hFYnkvRDRkNFBJeWxnM3ZYMDVMSThleVVRVnRJZHFZNmdsK0laem1H?=
 =?utf-8?B?QXVrSStxaE9zK0FvOU0zZTJuT3dGcTVrVjhOK3hrUlB2Nk5CNzJGZ0wzN1Jr?=
 =?utf-8?B?c0ppdURZRVFvVndpTkl5dmRTYmdrVjkvR1VodFdPMDB4NmpHWDN2akY3M3V2?=
 =?utf-8?B?czF4Q2VxNHp1bFBIWVVyZURGN0ZVakpPRlRwZ3NaSVNZOW4zUXkwUmpZb29B?=
 =?utf-8?B?RldtalcrSHNsVklCT253RzJZam85UTBEcWJkVzhzUUM3aVZVQVNYcStNakRD?=
 =?utf-8?B?SlRlb3pPeDJBVVFnSGExRnNHQW9heURaeTZEeHhQbnVxVkEzNHVnMWUyNUM0?=
 =?utf-8?B?ZUtTTThxc241T29kN1VydGJFbUdIQk43VWNBZys4QTdzQzdYY1pGOWEwUzFu?=
 =?utf-8?B?VnhQTGtlaXRVU2VYMndBRzAxMFNHZXFvOVIzV0c1YkExOHJBMURkWldBY00v?=
 =?utf-8?B?N1ErUTVBK1RmUHhRRTNIVDNvbmF5UnBoV1hvendDQ1ExbWljSk1PeUZ4WnZ0?=
 =?utf-8?B?c3J3Ky9ndUFmTjRCV2F3a216WmVta01hTzc0bUhBOFZpcHIrMlNoek5CdTly?=
 =?utf-8?B?eFJzMU1WbnIwbStzeUhVOFdkcnBEZUlZUi9uRE5kNnNRYmNvVEE0RDFRTy9l?=
 =?utf-8?B?STBTbVNDUmFNRjhtS0IyYlRMRHZrM2FzK0VWbGlpWFlDUms3RW1tVGdLVGQ2?=
 =?utf-8?B?WnJmN2N5Y25ZM1Y0bXZ2V2MyYkZrUlIwWm9oTUxLUFdCY1BjSmFESTR4MStC?=
 =?utf-8?B?U2N0R3UrZWFoY3pYUXFBeGoxOW1qc0h0VklmcGZScnBxTlc4Q2tPczZqVHBB?=
 =?utf-8?B?dlc2cm1OUEE5WGRTSXBTYkp2cm9Ha3FKOVJDVVozVUMxVzJuTkdRdGxsdXVh?=
 =?utf-8?B?NW9DeEFralVqcmRYUjR1eVduTi8zRG1WdWxRakVKM0Q2ZE1ScGRvTmJFT0Nu?=
 =?utf-8?B?RHBISFBMcktZRVl0eW9UbmVqbmtkVi9YR1E3QW0vSk9pKzViVVpDT2FqRzRX?=
 =?utf-8?B?T0h2M3BmaUxkUXhPMVFWRGFpWURvMmxTcGU1SER3QnE0cEloai9HKytidXVB?=
 =?utf-8?B?dmE1VXpEM1p2emJYbERqTkdiWTRwNjBaOExTdTdUa01xWHFxMlRDQWNTUFFS?=
 =?utf-8?B?VFZPTFNHMUR4NDMxNjIzVWIxNUVYaWpWcG5QQWwyVWhZMmRsdWs3bXZLZGh6?=
 =?utf-8?B?SjNmbWFRQTJrd1hjRmJLekZaVGpnenF5QmZSVTc1ZzZpZEQycVloNmFFcGxx?=
 =?utf-8?B?SmFvc1BpYy91N2FKMnZNKy9ZM0cvTlppa2s4TEV2RjRKMmxVQ0ZPdWl0bUY2?=
 =?utf-8?B?MXhTZ29KNDJjZnRzS2tVTElSTkx1VnE5WWEwc1pOUzNtMmg2L0Jac2xVd2R0?=
 =?utf-8?B?YnZuQXpFT0dMR2lhNmNmUzNxQlRMYTkzYUdXakVYZkZMa01XeVRwMlZNSW43?=
 =?utf-8?Q?TYtAxoLf9jvA15y7cMKDQYRstNhT1X+Z?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d0JvaTlPSHpTalcyYmNKQ213K2pPMzJ4SUhZVkV2TGxkNU96M1lDeXppSXpU?=
 =?utf-8?B?UmFSWTBpdzU3STFmMmlXYUR0VVVBWjIwc1h4Qk9MR0twbGpVeStQRjNXRmFU?=
 =?utf-8?B?Z1RreHBUbjRjSXphS2FjZUJ0clRLMUZqZFdWcm55dlpNcXN1THFhU2FhUDFm?=
 =?utf-8?B?eVFOdTVIMmQ4U09VNVhsWkJnTDhOQlFxSDB0UmxqcUJ1RG9TZ0RCZHowaUFw?=
 =?utf-8?B?ZUI4aVVITXRKWGpwT3ZiYzVvVnBCZUlaVE1CSFZHMjlrc1gwcHhMaGo1TWxu?=
 =?utf-8?B?bzh4dnMxVVQwNXZSaytPMnlnU1cweDF6dzZFdzJXU2JEbHM5UTNLS1JiUW5I?=
 =?utf-8?B?S2szcUtrRjhURDJZR3VxNmpyTXVNckM3bW03YytRSFZYYnhQQkZSdFFQSUQx?=
 =?utf-8?B?MXJsbUtKSlNFQ0p1OGNnS1psbFJYNEhRRUYrYklNRTNkVG41V1J0ekU0cjUv?=
 =?utf-8?B?ZWpqU3dEVEpLb0VoQllPU1FOZ3M5NFJLa1ZPTVhNUDVvOUZMWTJpUVQycDlR?=
 =?utf-8?B?N0NTT1NpbnViNTltVnNIdTRqd3Bqckw2b1ZadDFFU3lZRmZvSEsyNHNhaXly?=
 =?utf-8?B?UnRjclhLTlpuV1kvRkJxZ0tHWlN2REs4UmhDUkZXUjlaOVNYSCtvbExvd3Rp?=
 =?utf-8?B?dWZ4L1hJWC96bFp5SEk4Q3RuRlNaMTJGUFA1clEzUUUzT0I4UUs3OXNVcTRH?=
 =?utf-8?B?QStaaTJLNVZBMElqd0RwcVBUMkNpbS9ZYWZVMm80WU1kYmdBeGJqeEhiT0Uz?=
 =?utf-8?B?THZud0QwRU56a2s1OWdXK284M1FCeTU3dHFuakxRa2RJM1lDRFQxOXVxV1NT?=
 =?utf-8?B?dThjMW1NbThrVVNzZTF5QkM1blQvVkhzOG5DUjgvWVFrSkZEaTVOYVRHangv?=
 =?utf-8?B?b3FwWnl0NmowU1lIOENwZ1JkaWs1aWw3VWdjbFVzWlVrbGcybDhKSEZJc3Zj?=
 =?utf-8?B?ajdjRTZPZDNLMnI5bmp4TnhWT2VsL1ErcEcyK1BobHIxV2JHNW9yMzlSZHRu?=
 =?utf-8?B?dUI2elFqVFZQREJuU3I2WGlnSEpTL3RIS1dtSEFVR1p0VUZKRWpqTnR3cmk3?=
 =?utf-8?B?WEp6N09Kb3Y2Nmw0MUFsL00xYk1Ca1VvWHhiOTMyWnBKSVc1SkZMTjRPU0xD?=
 =?utf-8?B?SlRZZEdwcDV5cTcyOGluUU8vMnpyODE2dG5XcGRxTUFlZjdIdWp0aUJZNTN3?=
 =?utf-8?B?OTJUaFZKWWNEWUp5eURHWVlZcjZkbVREbUhGb29HdGw5eVFMYVE5c2QrMDRE?=
 =?utf-8?B?cGJGV01ZYnc2bFBOTGFjd2xuMVU5c3oxMWRCL000SnhvUndlVjdFSnRHUG5v?=
 =?utf-8?B?TXBqN3pmazBGVEZ1dmdYSTAzQTNhUDIxMjZJNERuUTRLdDVSanFYdWxXamFq?=
 =?utf-8?B?bkV4c05RaVdVZWIraFFCVXBEejdlR2tRNjJYdi9hc0lVTHczUkZjUXpwTE13?=
 =?utf-8?B?c09OTWxTQ0hLa0NrbmJFNnVlbHlFZko1T1dQNHBSeXltV3pybWNScWEzV2lW?=
 =?utf-8?B?V1JhVklzZFgvenV2elFwWXRpYldFaTFZaUFZbjRGcUgyMWkrejYzU1VNWVh1?=
 =?utf-8?B?OEl6bzZXem50VlI2cWNLalNmZW5seldLTVRUMlBoMGpnZzhZa3lOK2hQaU8y?=
 =?utf-8?B?ay9SVzVQak1Od3FRbVR1ZGJvbHVPUk9pdzI3NkVvTTZmN3dxSElIZHVTdGdl?=
 =?utf-8?B?YkJocmJxMnM2bXVCTVdxVGwrZHlDUkFTQi9pVG13K0g3bnN0cUcvNkIybmcw?=
 =?utf-8?B?a0hhR1dUSnF2RGt2VW5tcjIrTFd2aFl1V3FyTENLbXhkaFR6MXZNZXZTdXo5?=
 =?utf-8?B?Q0lndEtobk5taXNzQWpFSUlkcWNQNnhVZGVxYkxPa3RoMW8vSVdUQnJjMHlL?=
 =?utf-8?B?ZDVzVFJUU2hoSkZlVkJCQ09meWlMVEtIRnkxQ2EyQXRKeTZOY0J4dHFkVDFP?=
 =?utf-8?B?SDA4Snk0TldQSVplYWVlS0Ryd1NkVTJMaVNuT0tFelBHMkVESlJFS2ZNei9y?=
 =?utf-8?B?SmNGRG9xaWVENitnUWpKOTY5L3BlM05JaWl2RzdPaGFWT0o0MUZUaUhPa01F?=
 =?utf-8?B?Vk1Rc0pmekNJYU5UYVRSQUpWN3ZhZi9yNmxHcUQ3T2VscmNrNWpBTGl5TTNR?=
 =?utf-8?B?T3UvSWJ4Q1QyQi9uY0k1bmNGUUE5THFkREFoWGp2djF1MEx3Z2pnTmJDK1p3?=
 =?utf-8?B?SVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ab80e81-aabe-44ae-ce9e-08de168ad7d2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 01:31:11.7161 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h3qplSk5gylBRPuyFW9gV2CW6MZbC37qxRy5iQMmwTZfrl/nTma/UmlUx73soMiLjZN1zUu0+AaHMQqTdUsWsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7505
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

On Tue, Oct 28, 2025 at 09:05:21PM +0100, Michal Wajdeczko wrote:
> Some driver functionalities, like eudebug or ccs-mode, can't
> be used when VFs are enabled.  Add functions to allow locking
> the PF functionality for exclusive usage (either for enabling
> VFs or to enable those other features, or simply for testing).
> Add also debugfs attributes to explicitly call those functions
> if needed.
> 

Hmm, I'm not sure about this. Why not just lock the SR-IOV master mutex
in pf_enable_vfs? If the reason is that lockdep blows up — for example,
if the master mutex is annotated with __reclaim and pf_enable_vfs
allocates memory — then you still have a potential deadlock; you've just
silenced lockdep. I'm not certain that's the case, just using it as an
example.

Given that, I'd lean toward saying no — this really, really looks
unsafe. If you'd like, get a second opinion from a locking expert (e.g.,
Thomas), but I think this is a no from me.

Matt

> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
> Cc: Christoph Manszewski <christoph.manszewski@intel.com>
> Cc: Maciej Patelczyk <maciej.patelczyk@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pci_sriov.c        |  7 +++++
>  drivers/gpu/drm/xe/xe_sriov_pf.c         | 38 ++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_sriov_pf.h         |  4 +++
>  drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c | 15 ++++++++++
>  drivers/gpu/drm/xe/xe_sriov_pf_types.h   |  3 ++
>  5 files changed, 67 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pci_sriov.c b/drivers/gpu/drm/xe/xe_pci_sriov.c
> index 735f51effc7a..e1d34860b064 100644
> --- a/drivers/gpu/drm/xe/xe_pci_sriov.c
> +++ b/drivers/gpu/drm/xe/xe_pci_sriov.c
> @@ -120,6 +120,10 @@ static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
>  	if (err)
>  		goto out;
>  
> +	err = xe_sriov_pf_try_lock(xe);
> +	if (err)
> +		goto out;
> +
>  	/*
>  	 * We must hold additional reference to the runtime PM to keep PF in D0
>  	 * during VFs lifetime, as our VFs do not implement the PM capability.
> @@ -157,6 +161,7 @@ static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
>  failed:
>  	xe_sriov_pf_unprovision_vfs(xe, num_vfs);
>  	xe_pm_runtime_put(xe);
> +	xe_sriov_pf_unlock(xe);
>  out:
>  	xe_sriov_notice(xe, "Failed to enable %u VF%s (%pe)\n",
>  			num_vfs, str_plural(num_vfs), ERR_PTR(err));
> @@ -186,6 +191,8 @@ static int pf_disable_vfs(struct xe_device *xe)
>  	/* not needed anymore - see pf_enable_vfs() */
>  	xe_pm_runtime_put(xe);
>  
> +	xe_sriov_pf_unlock(xe);
> +
>  	xe_sriov_info(xe, "Disabled %u VF%s\n", num_vfs, str_plural(num_vfs));
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf.c b/drivers/gpu/drm/xe/xe_sriov_pf.c
> index bc1ab9ee31d9..8cdd25db2cf9 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf.c
> @@ -157,6 +157,44 @@ int xe_sriov_pf_wait_ready(struct xe_device *xe)
>  	return 0;
>  }
>  
> +/**
> + * xe_sriov_pf_try_lock() - Try to lock the PF.
> + * @xe: the PF &xe_device
> + *
> + * This function can only be called on PF.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_sriov_pf_try_lock(struct xe_device *xe)
> +{
> +	guard(mutex)(xe_sriov_pf_master_mutex(xe));
> +
> +	if (xe->sriov.pf.owner) {
> +		xe_sriov_dbg(xe, "already locked by %ps\n", xe->sriov.pf.owner);
> +		return -EBUSY;
> +	}
> +
> +	xe->sriov.pf.owner = __builtin_return_address(0);
> +	xe_sriov_dbg_verbose(xe, "locked by %ps\n", xe->sriov.pf.owner);
> +
> +	return 0;
> +}
> +
> +/**
> + * xe_sriov_pf_unlock() - Unlock the PF.
> + * @xe: the PF &xe_device
> + *
> + * This function can only be called on PF.
> + */
> +void xe_sriov_pf_unlock(struct xe_device *xe)
> +{
> +	guard(mutex)(xe_sriov_pf_master_mutex(xe));
> +
> +	xe_assert(xe, xe->sriov.pf.owner);
> +	xe_sriov_dbg_verbose(xe, "unlocked by %ps\n", __builtin_return_address(0));
> +	xe->sriov.pf.owner = NULL;
> +}
> +
>  /**
>   * xe_sriov_pf_print_vfs_summary - Print SR-IOV PF information.
>   * @xe: the &xe_device to print info from
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf.h b/drivers/gpu/drm/xe/xe_sriov_pf.h
> index cba3fde9581f..2261596bb4fe 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf.h
> @@ -17,11 +17,15 @@ bool xe_sriov_pf_readiness(struct xe_device *xe);
>  int xe_sriov_pf_init_early(struct xe_device *xe);
>  int xe_sriov_pf_init_late(struct xe_device *xe);
>  int xe_sriov_pf_wait_ready(struct xe_device *xe);
> +int xe_sriov_pf_try_lock(struct xe_device *xe);
> +void xe_sriov_pf_unlock(struct xe_device *xe);
>  void xe_sriov_pf_print_vfs_summary(struct xe_device *xe, struct drm_printer *p);
>  #else
>  static inline bool xe_sriov_pf_readiness(struct xe_device *xe) { return false; }
>  static inline int xe_sriov_pf_init_early(struct xe_device *xe) { return 0; }
>  static inline int xe_sriov_pf_init_late(struct xe_device *xe) { return 0; }
> +int xe_sriov_pf_try_lock(struct xe_device *xe) { return 0; }
> +void xe_sriov_pf_unlock(struct xe_device *xe) { }
>  #endif
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
> index a81aa05c5532..7c011462244d 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
> @@ -96,12 +96,27 @@ static inline int xe_sriov_pf_restore_auto_provisioning(struct xe_device *xe)
>  	return xe_sriov_pf_provision_set_mode(xe, XE_SRIOV_PROVISIONING_MODE_AUTO);
>  }
>  
> +static inline int xe_sriov_pf_try_lock_pf(struct xe_device *xe)
> +{
> +	return xe_sriov_pf_try_lock(xe);
> +}
> +
> +static inline int xe_sriov_pf_force_unlock_pf(struct xe_device *xe)
> +{
> +	xe_sriov_pf_unlock(xe);
> +	return 0;
> +}
> +
>  DEFINE_SRIOV_ATTRIBUTE(restore_auto_provisioning);
> +DEFINE_SRIOV_ATTRIBUTE(try_lock_pf);
> +DEFINE_SRIOV_ATTRIBUTE(force_unlock_pf);
>  
>  static void pf_populate_root(struct xe_device *xe, struct dentry *dent)
>  {
>  	debugfs_create_file("restore_auto_provisioning", 0200, dent, xe,
>  			    &restore_auto_provisioning_fops);
> +	debugfs_create_file("try_lock_pf", 0200, dent, xe, &try_lock_pf_fops);
> +	debugfs_create_file("force_unlock_pf", 0200, dent, xe, &force_unlock_pf_fops);
>  }
>  
>  static int simple_show(struct seq_file *m, void *data)
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_types.h b/drivers/gpu/drm/xe/xe_sriov_pf_types.h
> index c753cd59aed2..91da3c979922 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf_types.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_types.h
> @@ -36,6 +36,9 @@ struct xe_device_pf {
>  	/** @master_lock: protects all VFs configurations across GTs */
>  	struct mutex master_lock;
>  
> +	/** @owner: the RET_IP of the owner who locked the PF */
> +	void *owner;
> +
>  	/** @provision: device level provisioning data. */
>  	struct xe_sriov_pf_provision provision;
>  
> -- 
> 2.47.1
> 

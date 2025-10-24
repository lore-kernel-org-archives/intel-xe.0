Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06DEBCCD1BF
	for <intel-xe@archiver.kernel.org>; Fri, 24 Oct 2025 23:21:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADB8C10E05F;
	Fri, 24 Oct 2025 23:21:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nuCnGSSz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B43A410E05F
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Oct 2025 23:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761348074; x=1792884074;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=W1g8EqkkshUL9rB7ubOdNJue+jr9TyKpo7ICkUrdaOg=;
 b=nuCnGSSzJjEDqMad1lj415pXSt0hlXCiIPlJcmPxXlq5mqlkzaB6zl1f
 NtAy7OfLEGYy8X+YtgPiSk/W41n6PLDhIqif8VtcyVdMIX5q/u5LM3x6q
 1DM4vPOez3MpMiP6sl6qhxBcjM+/nBXtCiUG+6bgpeo8croL805IraQgl
 TR2aOrMtKGsRaKEnFLCyZ9xbBUoj5kFXMDF7Lx31vvnJL6wMtlk0IX1m4
 LWMWdzOEAnbTF2Se//iYiLNsVbq1NoY4PU2amiWVHwLE3VYc4kmvV/SdG
 dBrmTDU3vcsVX1vD6sK2gKy5ufPz1xXfWF6pQNyudEyWmii7ZWDr9Tn2t Q==;
X-CSE-ConnectionGUID: /bDLUWVNQU2YrRyiiFQxKA==
X-CSE-MsgGUID: Jcw4QX+pT5OEM89VuhRSww==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63233682"
X-IronPort-AV: E=Sophos;i="6.19,253,1754982000"; d="scan'208";a="63233682"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 16:21:13 -0700
X-CSE-ConnectionGUID: 3rA/WDPkSP2GNGOEb7i6Xg==
X-CSE-MsgGUID: wl2mEO4DSDmsOoOPNEg4vA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,253,1754982000"; d="scan'208";a="208184731"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 16:21:13 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 24 Oct 2025 16:21:12 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 24 Oct 2025 16:21:12 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.0) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 24 Oct 2025 16:21:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gQoFLJ7PrrvixftKALMz8ywqjTSQjR8MylczgizuLx7vfYBhS0jUp7+CA6YntLlNbOnWTxLw9cpN48AnuPn/0/yJZuR+ptYvYB19S3xBd7VEPlUKkx4OOBx8WpVijfuFpfION71lg8urJZ0BbKxFpwMSrEoge/XnjTCo/idYwgY3c+RrN7dX+UQQUctXdclcYQacbZzH9rOHxT0hddrIGDoEwlWDty2XYg/uXoJHa7eN+/yU26zvDQy6jQCHLAR+Fsruyq7fSqthvS0E0AGN6uqV1PSU8ocUcNLWoDYQ5knery6RxP0jmkAIKtUr5H2RFdfIvZEqL4oz3H0cZ+JJTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XWewwDBfqdchKmnTXbk+afLY8kcA08V5h/leK+yD4kQ=;
 b=yINeqxMAPn4bzdc9ZNhLLhq6CJfiNsJYCSdbBLwCCee0vFNBtZRExKlOhc7V2hf5QnkzMqyjgDYleQsdcKyjJU+XKZY/F0lV273Cn5G8jhcJmERfgYWyjDcK0/DCJ0iN/8x17GXozzmsO3csWd8JJH6rXi0DJsaxfVYz3XNqVFUwSdnVnR9w27o5tAlbjBgaLkS54dtLl4tU6M9hPSCH0pVXrkYJfJyKHtmg4itsRH4yXlvHMi75wEfvo8nvHg1hvJfnSFmkX0LSkz72lbXKdS4TDsuDAGVjFZYrAZcfXpu8jQ4MK8MNDfPuEag6Z6wacEYwx2L50Uxre4lhzF3iKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by DS4PPF641CF4859.namprd11.prod.outlook.com (2603:10b6:f:fc02::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 23:21:11 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 23:21:11 +0000
Message-ID: <1ffe8cdd-717f-4d16-bfbc-e0d6028cc46e@intel.com>
Date: Sat, 25 Oct 2025 01:21:07 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/pf: Access VF's register using dedicated MMIO view
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>, =?UTF-8?Q?Micha=C5=82_Winiarski?=
 <michal.winiarski@intel.com>
References: <20251024205826.4652-1-michal.wajdeczko@intel.com>
 <20251024222740.GM1207432@mdroper-desk1.amr.corp.intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251024222740.GM1207432@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BEXP281CA0001.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10::11)
 To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|DS4PPF641CF4859:EE_
X-MS-Office365-Filtering-Correlation-Id: faf3542d-672e-42e8-908e-08de135404a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dlJXMjlWVFNsekQ5cGt1eDI1Sjg4K3N4a0VDSjVOT2VUL0xUc2lCNXN1aWhG?=
 =?utf-8?B?anA2ZXVsMHA0OFFrZ094cjk1ZHM3UlN3Si9nd3k1WDZpR0p0RzhmSnFWUFNL?=
 =?utf-8?B?M3o4ejJsNEt1OGloZGU1a1RtMDRtU2VyQmM3OG4xWjBJY3QrYndzRzRnUXhS?=
 =?utf-8?B?NmpjeGNjTzVTOG1tNi9QRVFTRTNMdzRkd2EyWTBONGJiam5mZ29hZlI5N2NQ?=
 =?utf-8?B?ZHVIR1NYMndjbTBIaC83NHZtbGVNU3U1Vk45QTRBSmxPaW5jbGtSZFNSRWdu?=
 =?utf-8?B?MFVNS1I2Z1FJbk1MOWIvQkc3d2E1THFySFVHVDU5R1o4ZUJ1dnNJTkcwU2Vu?=
 =?utf-8?B?UHVhRldoNW1GQ0U5WCtxSVRRaGR2TFE0T2RVdEo3c3dLd3NFMkVHMUZRSFUy?=
 =?utf-8?B?Zk5hZ1RWSHRhNTFwckFMS2tKNWxlUmtuZDkvamlPZkxwbXM2NHZPRG5naW0y?=
 =?utf-8?B?T1BhZ1l2RVNucmxlWGFVeHNCR1JwRzlUNjJkY3FRa0oydSs4N252Vjc4dG54?=
 =?utf-8?B?bFExZHZ0RDFNTGE2eStmRmR5MmtsVWxUMUdkMVJ1ZFNSL01QTG54RlBoMXdL?=
 =?utf-8?B?SUxuWmJXelZYanppMEF3YWVPQ1hIMTVTL3M2WTJCbGQrVmc3RnpGYVJETmxC?=
 =?utf-8?B?S3VYQU5SS1BkUDRJZyttZVhWTUxYeDE0NFBEN1h1UEROVUhIbDlhbEVLWDNF?=
 =?utf-8?B?a25XYzBHRTNQMmdKOE9jSWtwQ0pZQVVnY05VVkxSUlhCa3RzZ01RRVlXMWdN?=
 =?utf-8?B?WW12dDhacEtqbldpRmwwN3cyakpWOUtmRG9aOVdlNERvbUdkckdITDNxQW9w?=
 =?utf-8?B?dGdlYXcwdGRaVXJ2blJmSEs5VmE2RzlFREM4MTZDUS9kUDllMHBFTU5Wblhj?=
 =?utf-8?B?b1k0TGZXK29Vd0J1SUhVQkNWN2NzQSs1UVpwVVRjOUpJOVN2c2FxL0ZiRFdo?=
 =?utf-8?B?Mk9wcHpoWjdqdGFnTUNjME1KWmRnSC9kNXJFR1pkN1N4NHhhcWo3ckJ3eHEy?=
 =?utf-8?B?NHJVdGxvZkMzbzFJWjR0VG9FYUpXZkZEOVpENklwMUxlTW1XOFhIbnY5SEZF?=
 =?utf-8?B?K1BQWDE4RVpDWVUvbk5PTlNzZHFkRklmL0lrTmx3SzN6QmI4QjBvalR5c0ZC?=
 =?utf-8?B?UDFuSUUzS05pd0hIMFpxY0pZTFk3dkQxZGVaNE4xV3pZWkJpSzBBK2x1OWVJ?=
 =?utf-8?B?ZEZNVzVKM0F2UnpzZ0t3VFNPNWIxZjZGQjhYWjlCaFZsTzBKM1U3Y2k1K3lM?=
 =?utf-8?B?QzlPZHE0Q1FUdnBwRlRINVRVZGtub0QrTCtubEtCWFA3T0dsQ1ZzeDRHaUQy?=
 =?utf-8?B?Y2dob29TUzU5V2xmQXpHK3Exejh0cXBKamMxQ1NvRU8vVWtRZFpNYmZRdXpQ?=
 =?utf-8?B?OU1wMzhBYnh6cStqekdnYTZ5bWhnSHNucEd6d00yS2dKNk1Ed01uQmh5dnpX?=
 =?utf-8?B?ZzZxTXdRMWljN1lGOXBmdHNCWDBrVzZGK1ZGc2pKemVUT2NSa1Q5N3VVQ1hv?=
 =?utf-8?B?NmxlS0Zkbi9JSURaV1dzOTJnbWR6cjl1TDNmaDFjWmNORUQyd3dpNmsrek9I?=
 =?utf-8?B?Yzg2d05kOGZTTStkVU1pTVc0bXZFOWNKT0lLUExzRGVRaXpxSkM0ck4ySzhp?=
 =?utf-8?B?OFBaOHlDMi90NE9LV1RDc0JGNU1odnZDSm9senhTWm5mRG9CT3JXeE1kT3hw?=
 =?utf-8?B?a3YwcGRiRUxSZzJxUzJucVBPbldrT1BKbkc5Z1JJcEtmK3d6UmxpbmIvOXpy?=
 =?utf-8?B?Z0pRTTVXOHV6aHdXNlN3SlJlNS8za051b052R05LVkUxL1hLYWVtTm5Zb0pQ?=
 =?utf-8?B?ZjBucEp5bEh5M3MzOTRJMHBuQlVjSFhJTHZlUElyREdsK0tGRkp2RmswUHJj?=
 =?utf-8?B?MnBNdE5DbFIrWnE3c0VGdGk1OGhPVU1kZWR2elZPR2hWdFhGU2xrL2hRZEkv?=
 =?utf-8?Q?oys7qMuC9mk1UaD3eB6BtlZ7XdoY0dd0?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TDNsL0lmRVVrS003UGoyNmFkOXpPbEJJOTlKbGY5RlJZSW9jelBsb2owTjNt?=
 =?utf-8?B?SXpXNkF2a2tQbjUvNVVKWWx2Zk85QjNuNjNEQjU0M3hyY1dUT1hZY3BMUDdq?=
 =?utf-8?B?NWNrY1ZMRUNNWTk3dGVQY3lyZkxaSHpzTzdmaFE0N0xNZmYwSGdKTUxISzlW?=
 =?utf-8?B?WS9mZXZCWklxRHZKem1aaEEwa0xkdlNiWFMzcXZZR2ZQSXhHcDI4bjZOdHIz?=
 =?utf-8?B?cjZqOWFOYytFVlVjVCtQR2h1bEIzMHcrYkZGZE4vMjNsRmJrK3ZIMlZrMFll?=
 =?utf-8?B?N1NVVnh6ZEtJOUZrUHdwK0M2STYzM253R3o1L2Q5aXpVQVN3M1N6aC95MFFy?=
 =?utf-8?B?UWxaS1dKK2hPRzRNWmxrelJPUGUxK3pRTVdJcHdENUJwb0xWcGJmNFoyQ3dG?=
 =?utf-8?B?WFpYY1BWMzBUcnA1eTk0SzAyMkIyQnBxNktFY0tnSGdtRWdnckhTWEpjZ1pQ?=
 =?utf-8?B?b1VkbEYzNjd6aEdFOGh0dXRGMW0rdzc4c0VYL2dRKzJtV0pyOG41S3RpWGF2?=
 =?utf-8?B?cEtOeGI5djNZbDJ6dlRXbnRNcDFZMG9LNVMwamxuWExYUENDaEMvWHE0VkFz?=
 =?utf-8?B?QWxlWGhPNjdqU0p1Mk1RcHFNczJrLzdqMFIyWEhqMW0ycDhoUExQMkxIRXEx?=
 =?utf-8?B?QkZxZEFPS0NtbS9OY083cTkyV2x0OWVPeGptTEJaL0VnbnllWm50TE9PM3lM?=
 =?utf-8?B?eGd4bFVWOW5Ec2d6NzlIaTdtRG1XNXhkSWtvVWU1K1FMbmVTcVVoQ21wZ2gv?=
 =?utf-8?B?QXFhSE92eXZKenJRNnNvb0M0QWlGYWNTenhOTDhHWjVpdEk1MDNiaFVTcEhh?=
 =?utf-8?B?aUhyUDJ0bVVLeXFWZmFRbml1Q2VBaG5rMGdCN1Vpak54aWR2M09zY1AwcXd1?=
 =?utf-8?B?cGNYR1ZiYXhRYVRrVDNDTXVLMWxvWnhmYU5KWVBFSjRoVENmb21mMUIwNXFp?=
 =?utf-8?B?TUVmc0d2TmRZL3ZjLzRHWWFDSUhpTFY3b0dTaWJHZmQxVlhkOG1YcU96cVRh?=
 =?utf-8?B?Z2tpTzBLYys2K2NKblZSRkdUcUJUenlwLzdGa0xSZ3Q3SVQzWUxWNG1QRnJa?=
 =?utf-8?B?bUZkYkFmOURNZ0NoYTI2L0Nadkc3L2tmNytXN2JEWHcrdkpyeVVTUXErMlFl?=
 =?utf-8?B?WTBGemtTeDg5ZnlsTjcwdDEzWGFQUFh4NUVveFpIS0NocVB1RmlhbFRoSndN?=
 =?utf-8?B?Tk8vbXNkS0t0bURrZmNHSFZwSEpFUnNGZmx6aDhSWWN5aXFQMWFsbzZFQTNS?=
 =?utf-8?B?UUhYTGUvMVZ0MmpaRUgrTmVjeGRWTGdMbUd4T3c4ZjhwZE9IZ0p0cGU1ckw3?=
 =?utf-8?B?ZC83dWNtZC9VTDE2KytTMzRlUXQ4WHhZREV0Wk5IMmh1QTE1dkZ5R01CV1dX?=
 =?utf-8?B?SkFsMW5ZbUREdVQzN3lHUm1YeWlrbS9tVi9aUUFieGRuaGZNcEhZUlUyTDl0?=
 =?utf-8?B?Y2kwWGNBdG9Wa0x5dlRBOGNZMFk2SWhnVE1aUk5UM3h1eTVSMW9PVVY4WW0x?=
 =?utf-8?B?dXlPeDNFQVB1ejc4VzFoYXJoN29uaGV1LzlLR0cwMUtFM3hIYW9tTWpzTEk4?=
 =?utf-8?B?OFdUMThPLy9ES2twRkQ2VzlBMGZpa1BzQ3ljMTlpeWNsUUhNRTFLNXExdFVS?=
 =?utf-8?B?Z0FqejM4VmlycDlJeU5Ud1NEajZBVEVmL01VRW5xVnFHa0xqRGxlakIrdU1K?=
 =?utf-8?B?RFU2eG5VUUJzcWRaR09XWmxvR0ZvQzlsSWxXRDdUMXlhNU85WG9aZ0VPUGNi?=
 =?utf-8?B?SVRJcllwazFzVyt0M0JFNEFBSkd2ZWhBczN4RDVvVlY4SFRuM1BNWlZ0UVpC?=
 =?utf-8?B?d09UZGQ5WmxBMlZYREdveENYSkpVS2QvODlDdmZhUk1NbHVlNG1SWDNQaXpK?=
 =?utf-8?B?aVVRK0h0WUFHWmNNR25YUjIxWmZIRmJlZVBjRDVTNDloZUR3M0V3R0gzb3NE?=
 =?utf-8?B?V3dBemhQTjd3eGpxMU42aHlUYTFuMkxYRytGRUtZMzV3MXFSMjJ4TmN4ZWFh?=
 =?utf-8?B?Z0hocDZtS0NidnJhMmhQczhldWxxNEh1NlVCeWNzUXM3QnRIQkp5M0o1cjhZ?=
 =?utf-8?B?bUdmZmtld0owMUNTM1laMytvb3k3ZTA5OGhUYTFQQjRiMjlCbE5rMHJVRFdR?=
 =?utf-8?B?eU9MVU14dkRheDVTUTZpUjc2R1IyNWNidlp4MlpYMFVFZGtPWGgvZlFkanFI?=
 =?utf-8?B?WHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: faf3542d-672e-42e8-908e-08de135404a0
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 23:21:11.1054 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0/LeHNnru9ei3d82ycDeEJ7pZnLuBxXLf7V7mx0EOYg40JWizuYWTw65IUtW/w4rg/JjRUi6o5vD1Pevwj+lIcXqBf2/y9O80WoPCwl+gCU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF641CF4859
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



On 10/25/2025 12:27 AM, Matt Roper wrote:
> On Fri, Oct 24, 2025 at 10:58:25PM +0200, Michal Wajdeczko wrote:
>> Instead of creating ad-hoc new register definitions with altered
>> register addresses to mimic the VF's access to these registers,
>> prepare new MMIO instance per required VF, with shifted internal
>> location of the register map.  This will allow to use unmodified
>> register definitions in all calls to xe_mmio() functions.
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> ---
>> Cc: Michał Winiarski <michal.winiarski@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_gt_sriov_pf.c | 36 +++++++----------------------
>>  drivers/gpu/drm/xe/xe_mmio.c        | 29 +++++++++++++++++++++++
>>  drivers/gpu/drm/xe/xe_mmio.h        |  4 ++++
>>  3 files changed, 41 insertions(+), 28 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
>> index c4dda87b47cc..0714c758b9c1 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
>> @@ -158,39 +158,19 @@ void xe_gt_sriov_pf_init_hw(struct xe_gt *gt)
>>  	xe_gt_sriov_pf_service_update(gt);
>>  }
>>  
>> -static u32 pf_get_vf_regs_stride(struct xe_device *xe)
>> -{
>> -	return GRAPHICS_VERx100(xe) > 1200 ? 0x400 : 0x1000;
>> -}
>> -
>> -static struct xe_reg xe_reg_vf_to_pf(struct xe_reg vf_reg, unsigned int vfid, u32 stride)
>> -{
>> -	struct xe_reg pf_reg = vf_reg;
>> -
>> -	pf_reg.vf = 0;
>> -	pf_reg.addr += stride * vfid;
>> -
>> -	return pf_reg;
>> -}
>> -
>>  static void pf_clear_vf_scratch_regs(struct xe_gt *gt, unsigned int vfid)
>>  {
>> -	u32 stride = pf_get_vf_regs_stride(gt_to_xe(gt));
>> -	struct xe_reg scratch;
>> -	int n, count;
>> +	struct xe_mmio mmio;
>> +	int n;
>> +
>> +	xe_mmio_init_vf_view(&mmio, &gt->mmio, vfid);
>>  
>>  	if (xe_gt_is_media_type(gt)) {
>> -		count = MED_VF_SW_FLAG_COUNT;
>> -		for (n = 0; n < count; n++) {
>> -			scratch = xe_reg_vf_to_pf(MED_VF_SW_FLAG(n), vfid, stride);
>> -			xe_mmio_write32(&gt->mmio, scratch, 0);
>> -		}
>> +		for (n = 0; n < MED_VF_SW_FLAG_COUNT; n++)
>> +			xe_mmio_write32(&mmio, MED_VF_SW_FLAG(n), 0);
>>  	} else {
>> -		count = VF_SW_FLAG_COUNT;
>> -		for (n = 0; n < count; n++) {
>> -			scratch = xe_reg_vf_to_pf(VF_SW_FLAG(n), vfid, stride);
>> -			xe_mmio_write32(&gt->mmio, scratch, 0);
>> -		}
>> +		for (n = 0; n < VF_SW_FLAG_COUNT; n++)
>> +			xe_mmio_write32(&mmio, VF_SW_FLAG(n), 0);
>>  	}
>>  }
>>  
>> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
>> index ef6f3ea573a2..350dca1f0925 100644
>> --- a/drivers/gpu/drm/xe/xe_mmio.c
>> +++ b/drivers/gpu/drm/xe/xe_mmio.c
>> @@ -379,3 +379,32 @@ int xe_mmio_wait32_not(struct xe_mmio *mmio, struct xe_reg reg, u32 mask, u32 va
>>  {
>>  	return __xe_mmio_wait32(mmio, reg, mask, val, timeout_us, out_val, atomic, false);
>>  }
>> +
>> +#ifdef CONFIG_PCI_IOV
>> +static size_t vf_regs_stride(struct xe_device *xe)
>> +{
>> +	return GRAPHICS_VERx100(xe) > 1200 ? 0x400 : 0x1000;
>> +}
>> +
>> +/**
>> + * xe_mmio_init_vf_view() - Initialize an MMIO instance for accesses like the VF
>> + * @mmio: the target &xe_mmio to initialize as VF's view
>> + * @base: the source &xe_mmio to initialize from
>> + * @vfid: the VF identifier
>> + */
>> +void xe_mmio_init_vf_view(struct xe_mmio *mmio, const struct xe_mmio *base, unsigned int vfid)
>> +{
>> +	struct xe_tile *tile = base->tile;
>> +	struct xe_device *xe = tile->xe;
>> +	size_t offset = vf_regs_stride(xe) * vfid;
>> +
>> +	xe_assert(xe, IS_SRIOV_PF(xe));
>> +	xe_assert(xe, vfid);
>> +	xe_assert(xe, !base->sriov_vf_gt);
>> +	xe_assert(xe, base->regs_size > offset);
>> +
>> +	*mmio = *base;
>> +	mmio->regs += offset;
>> +	mmio->regs_size -= offset;
> 
> I feel like it might be more intuitive to use adj_offset / adj_limit

I couldn't just update adj_offset as it will not be used on the main
GT because it is 0 there and we have this condition:

	if (addr < mmio->adj_limit)
		addr += mmio->adj_offset;

since I didn't want to touch adj_limit here, it was easier to move regs ;)

but if it is OK to change adj_limit in the xe_gt_mmio_init():

./xe_gt.c-686-
./xe_gt.c-687-  if (gt->info.type == XE_GT_TYPE_MEDIA) {
./xe_gt.c-688-          gt->mmio.adj_offset = MEDIA_GT_GSI_OFFSET;
./xe_gt.c:689:          gt->mmio.adj_limit = MEDIA_GT_GSI_LENGTH;
./xe_gt.c-690-  } else {
./xe_gt.c-691-          gt->mmio.adj_offset = 0;
./xe_gt.c:692: -        gt->mmio.adj_limit = 0;
./xe_gt.c:692: +        gt->mmio.adj_limit = MEDIA_GT_GSI_LENGTH;
./xe_gt.c-693-  }

then I can do:

 +	*mmio = *base;
 +	mmio->adj_offset += offset;

> instead to select the appropriate per-VF instance of the registers and
> leave regs/regs_size unchanged, representing the underlying iomap
> itself.  I see this selection of a specific VF's instance of these
> registers as being similar conceptually to selecting which instance
> (primary or media) of a GT's GSI registers we access.  But this approach
> works just as well, so I'm fine if you want to keep it like this.
> Either way,
> 
> Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
> 
> 
> On a slightly related note, I do still have plans to add optional
> allow/deny ranges to xe_mmio structures that debug builds can do runtime
> checks against to ensure an xe_mmio isn't accidentally being used to
> access register ranges it wasn't intended for.  Probably not super
> useful for what you're doing here since the lifetime of your xe_mmio is
> a single function, but I think there are a lot more uses of xe_mmio
> coming in the future, and that will help us catch mistakes in CI.  I'll
> try to get back to working on that soon.
> 
> 
> Matt
> 
>> +}
>> +#endif
>> diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
>> index c151ba569003..15362789ab99 100644
>> --- a/drivers/gpu/drm/xe/xe_mmio.h
>> +++ b/drivers/gpu/drm/xe/xe_mmio.h
>> @@ -42,4 +42,8 @@ static inline struct xe_mmio *xe_root_tile_mmio(struct xe_device *xe)
>>  	return &xe->tiles[0].mmio;
>>  }
>>  
>> +#ifdef CONFIG_PCI_IOV
>> +void xe_mmio_init_vf_view(struct xe_mmio *mmio, const struct xe_mmio *base, unsigned int vfid);
>> +#endif
>> +
>>  #endif
>> -- 
>> 2.47.1
>>
> 


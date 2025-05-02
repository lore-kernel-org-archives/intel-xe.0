Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CC21C3ABAC
	for <intel-xe@archiver.kernel.org>; Fri,  2 May 2025 16:11:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51DE110E0D0;
	Fri,  2 May 2025 16:11:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fVvS3pwi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D153910E0D0
 for <intel-xe@lists.freedesktop.org>; Fri,  2 May 2025 16:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746202278; x=1777738278;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/SRcE8qOR57ErS7yBK2LbOwijb0dj4Znbk1AhYbRWKY=;
 b=fVvS3pwiC0LAMdNt7MSczw8baJwoHdzYZJx223wg0YswedK935pw6fWX
 OO/YT2FvXmqwzHy+zZFFh/8xhPdaBC9QfFzM3Foh7yHgl6eInOXqRAum+
 ujnFKeDA08MbRhpe3eNOH1FxyVHEWOZeOtpIu9xP3C34ZKP1HA9E4xJQV
 J6MkGCDFmBIUZpJVajL1dUig7dDkvXre4ZB9c5JAWQdHSAWv0KNgacb8d
 KHFP5iESuZaXnUaXcw4Zpsnt4S5JKf4dZgMh2/GXpO4HCIvbZaqVRMMUD
 iz4k8qfdcmaocmoMdYASX4VxCL95DNM4mO4Wo8TQnt7sjsZxQuUXFrq5s g==;
X-CSE-ConnectionGUID: 5hcwqjC6Q1inStN4mB6avw==
X-CSE-MsgGUID: XRR3SG27QtCxaAQk20kQWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11421"; a="59271636"
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; d="scan'208";a="59271636"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2025 09:11:17 -0700
X-CSE-ConnectionGUID: g9Fxc/gzQ4W2YGZSLhrVEA==
X-CSE-MsgGUID: BQD3nI1tQMKnJRhrWqxROw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; d="scan'208";a="138694415"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2025 09:11:17 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 2 May 2025 09:11:16 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 2 May 2025 09:11:16 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 2 May 2025 09:11:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fdmJJYYVXTrJDn/gmmrLukdHUok61kYhwwqIEA7OIXy+nykX8fQAk3z09VFeiTrCLZvMmN+D7LMy97A2swlx+RYXxGVUBjvZrTvK2DlxOuscBy54YyvXun5fYldoWpwGsYkbCNNJvekI/aH6wvxDeeEOc8kJZu8ns6BSRRF8wPCNvOJPasI4FJWlw9EnaQM1F+LUHkxUq59FCz7lQyfbvQpArZl1e5fWCKjI7by0ScybyQNC5YJCGKHLTj6T6K3axY0vTWHYinunkAEjY6IhlQq7NW5Yg/EYLQqpG/ShosYNswUnU9r0HyIGTC/FdPoE2pbQlMPYKdNYEaHFgmz3dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IHnoRWoJBNXSfX6KGJcPOA9myqVLJGE5jvVFAtmRN8g=;
 b=dQR+l6x5B8FIVZpiYI/wUJ4CdtRrOhMK8OBLyh5hYpBe9dDLz6iE2meVQF+0u8/4DYPeAnP2upxx6pH/r9xYXfO+9MLNw3Dx7uLXxK0oBUpDpMMacbJvMU6OGvWQcJVB51sVTRe/5PZGkopp1VtM670Ncuegmcptdxuvb56elCVFaxpLUK40cBtBmDhBW1C2tcqWvAqvt9dR2eawPIY7CctIyptsJvfSIaKp3vKqJnUzJp/0iB41MuhnGmNvXwXY3EuajgvQVKKj+BgJd1ZlRp7XAeEH7mglW5htOdHkToitVN4L+nNTNA/cLl+fgfRuH33S9lQsGKELyNOxJCXYDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by DM3PPFD5EE188BF.namprd11.prod.outlook.com (2603:10b6:f:fc00::f53)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.34; Fri, 2 May
 2025 16:11:11 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%6]) with mapi id 15.20.8699.022; Fri, 2 May 2025
 16:11:11 +0000
Message-ID: <c8bf7de5-d62d-49fe-bfc3-b71e5c58680c@intel.com>
Date: Fri, 2 May 2025 21:41:05 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 19/20] drm/xe/svm: Implement prefetch support for SVM
 ranges
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <matthew.brost@intel.com>
References: <20250430121912.337601-1-himal.prasad.ghimiray@intel.com>
 <20250430121912.337601-20-himal.prasad.ghimiray@intel.com>
 <62989f8bbb1d8f57fea227f7afdbc753b492dbcf.camel@linux.intel.com>
 <6206f91e-aef4-400f-891c-6b11bbe4ffca@intel.com>
 <17301febd0068fc40549b5f75773577fa0b4846a.camel@linux.intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <17301febd0068fc40549b5f75773577fa0b4846a.camel@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0021.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::9) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|DM3PPFD5EE188BF:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fe75844-8752-44ca-f643-08dd8993f4a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R0c5VHpZYWtDbXNRckg0ajRUNFhpUE9FUjE5Y2dwYmQvTm43SWVSRHRFR3da?=
 =?utf-8?B?dzVpMXZQM2RueVc3a0VhY1lmK2Y3S0xCZlVKOEJVZHR5WGpMcEVGcEhBNSsw?=
 =?utf-8?B?UFRValBncjVTV0RCV0pHWFlYRHIwTjI0ZXRQOHRWaUM3ODV0bzVleEZLTGR5?=
 =?utf-8?B?T2R0ZjdWUGo3RkZpaERBRlYxY2E4YlppdFZFSkJtRXBXcUFCbVFwWjZqVzRv?=
 =?utf-8?B?bGFzcTJjNjJBMGxuQWVBZ3JhbkpYbFZXNDhYM2lFRGlxN0lZaTQ0OG9NUjF2?=
 =?utf-8?B?YUxnUTdSb0hIbzhtM0NuOVZmNTZodDlaYTNmU2N1bUhSZzZMY0ZtZ3NsTlc0?=
 =?utf-8?B?UU9jaUxPSFh4TWhsbXFPQTIxVDV4U1VyOGxmczk4ZzBpMjFBSjBzUldJYUNK?=
 =?utf-8?B?eWRHMnhSZ2hkdk5wUnRTNUtIaDFoallQV1o5TGdiNzFlVVYwbG13dzZDRUt0?=
 =?utf-8?B?a2RSSlNMNFk3elVnb2tPY0ZXWDFUcExFZDFwOXNZZkVReGtvejR3NkRsVHpo?=
 =?utf-8?B?aVYrczgxZHdocEY4dFNZc0JuWWdIMkNaeTBWK0NGN3dIMzdyYlU3cEo1Q1lG?=
 =?utf-8?B?bHpOZzJPb0xFZDgzQzdWZmtHL1pYVDJNUC9LZU95L0U3OWU1NlJwTWhickM0?=
 =?utf-8?B?ZVhwTEcyWTdETVNCNkFXZURCYjAvQld5eXcxaDVkeGRVSStLQnFiMXdaSUhX?=
 =?utf-8?B?SEZkNStCeGU2cER6eFNLOTBqTmFhWHVtVVZVSld6M1JQQ1VHK3ZNRGhkazZC?=
 =?utf-8?B?UWQ2cGlwZFRtSmp5VHBWenZlcndJYkFXRjg0bXhRSTk5UkRqcTVqdk1wbkN0?=
 =?utf-8?B?YVJKd2IxdlZ3VUFXelh3RTAxc2Q2WkE3MUJsRG1lbUFNRVpwRkJzeE8yUDgy?=
 =?utf-8?B?anJ0clBrcG9ON0tJYWtMbFpOdnEreTdUdE04dklYYXZEc0sxUFNwNDIxOGhL?=
 =?utf-8?B?R20zNEZhRllCNWZSUk1aSUkvUzlkZXRORElER0wyVG9KZ01KT05aMFhkUG5u?=
 =?utf-8?B?bWVyNTczQ0FVU3JwSDVkcFNvSzd6U1ZQNEk0Q3E5aktSSmxQQXZtMVc5cVlE?=
 =?utf-8?B?S29SQnRuVUlLdUxySTU1WlZvTHVWR3JJV3c2bFhyUVNnaWhxVXcwQ09nQnZn?=
 =?utf-8?B?QTM3dm0vbGtZVytRbXZwYnZ4ZWJUOVhYWWFLU21wdE1lQ3JXVTFGcjRVcW9E?=
 =?utf-8?B?TzQwSVVnQmtvZHhtd2RtSmdvcGFIUG95OFN2ZUxaMlBaSWRxZ2gxZVZqbGIv?=
 =?utf-8?B?UHB2Z2Q3ZnFUL0RoQnNWbGFBOHRDdkJmUVowclBuaVc2V0NrNThmYlY2U0U4?=
 =?utf-8?B?bTlSa2hWYTJHa1Q4Tnc5anNGbWVnS0hUeCt3ZzUzSVFCR3N5aEZMVVZTbHgw?=
 =?utf-8?B?VmRPRlhQQno3Tm01a1FTSE5QYzF6dVpyaHpSMloxRTJSOHZkZXhPR3FEWXg0?=
 =?utf-8?B?WHRsc1V0MittYmRuZklzRE9aUlBXd2pjVHE1RWM5RVgwTXk3OUpGRXMxL3NU?=
 =?utf-8?B?S0s5NkliV21LUjRDYU80QXJyY2UxdHFjNzJPOEtrNlJrdVZxWkg0cTloN3NM?=
 =?utf-8?B?eTVzckVLSlBqWnlGZ3VxUnJiK1pRQzdPTHp3NFgrME01YVZWWDJVM0tOcm1p?=
 =?utf-8?B?dTRGVnFoL3V0R3hsb1AvOHowSURDVitxbU1rbjZlZndkNU01YzNtV3hyVGkz?=
 =?utf-8?B?Nk5BZ2JyeXJIcHFuS1NWVmkwTGw5UFh6ckhkZWs3ZHpnSWNPNEFRcnZjQzI0?=
 =?utf-8?B?NFZMeEQ1bHRkVGZXempndWhhbkdySGNuTXk0YTVDWEFsQjR5cDJaZjBzUUw5?=
 =?utf-8?Q?CUUK863hvSIwJsiuo2SE8wvsTz+nZFQFRVrig=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d0RxaVJMQklGRk5oN2ZPYmcyT2VsY0pUQ0psTnV1YkJodEdQL0swd2RJa1hn?=
 =?utf-8?B?WXpuWGtVcERqV2hxM0RhMFU4ZFUzc2paOCtWZWZwa01BN0taa3dOczlLc3pp?=
 =?utf-8?B?d0VHYTU5ZHRFa1ZzMXlNUkVMeklFQVh5VndBNnZrUHJXUytGR2tiZ1loYisw?=
 =?utf-8?B?YUZicktTVjVrZmZjYUtQSWh5bEZORm14RjcrNk1XMVZhaTY0ZnExMy9IUjZN?=
 =?utf-8?B?dWhNQllkeDdHYnZiL0RMNUFhcEt1NkRsRVpTZkZ3NGJvRmNDQ0tUaFpzU3I5?=
 =?utf-8?B?bUFUc05yTnRZV3RnUnluUlBWYTh2TDZwQWVSTE45T0JIbHFxOGx0enFvaCtk?=
 =?utf-8?B?UGJZRUVIalltQUJTQW1HMENkRnJjYjlWRjg2alBuaDYrZVlkUHpJbUZ3bm54?=
 =?utf-8?B?Y2FWL3JZM3FzeGpoZEhyK0hyQUI4ZVlLamlzekJwTlkxdXNCTENrSW0rZ2xO?=
 =?utf-8?B?ZjVKaW9EN3ZreklrQmNNQzI1QU96VEJEN0F2eFk2Q21NMlExUU84VkZWNzJu?=
 =?utf-8?B?aytqZXZGQk96SWJuVmFSSmUzU3NRUVg5VG1HclJoUTBxeFJQT010eERKNTdV?=
 =?utf-8?B?QThrdkJ5cEJRcy95aFNvNlJyRVFyYTZEa2lKSEgySkYxUEM4T2tYc21yR2p1?=
 =?utf-8?B?N2N6VHBLc1gzTm5GRTcvMm1WN0V3eHd3NVpqc1N3ZDNoQ0ZmbUo0ZGoyWit3?=
 =?utf-8?B?c25iM2trUEJIbjhmVXA2SXVXa09NQWpFZUUrZHlGd0FjSk54Q3Q4WTcwMjBD?=
 =?utf-8?B?UXV6ak5Cbi9tV2dhcVZmWFlHYkV3Rkd0UWVzVVVvdXoxMEpaL3FpWXF4dUdP?=
 =?utf-8?B?QlBQcmNaRzYrU3ZXYmhFMURjblFTcUZVZ2t1VGNwbjdZL2M5UU9TaHdtVkRC?=
 =?utf-8?B?STV0eW50bTJZSWFDZ1RUaWFMamFSbVp4NHNpT2VCWkhYMFdzcUd1ekZpdmFX?=
 =?utf-8?B?SXA3dzhCRnlDM0Fhb05sNHF5WjRoTGRhclgyZ1FPWHVnMzdCZ1RjSGRmR0NU?=
 =?utf-8?B?LytUaExEUFQwdkRQU0w4OGlxWitza08wK1MyNE9IdmNGN2ZzRTVmK0VnQmRt?=
 =?utf-8?B?SVY3cnFkK0lEUko5VHpRYTFVWVFWY1JJdkQxano1YXVOVVRnaTJ0dzduWm9n?=
 =?utf-8?B?ZjFhSDN4RVRSMVkvRWZVRVBzc2ZsZk0rYVRxRUxXdUFGazJVekpDeExGRFRN?=
 =?utf-8?B?UVd0cnllME96UjRBeTJmTW9zMFVtQ1ZzOHBaSWJZMDFnZ2dHNnlnaE5vYUZW?=
 =?utf-8?B?QVBQOUxiaGMzeTByU2NzanRsUWludmxHS2ZqNkFtY3ZwWnhhRjRFOXhOWmt6?=
 =?utf-8?B?dW45MjBxeXFjRVo2bkZnWDNDQWM4bGZKL2dNck9mSU5rbm1Wa0ppRU5kNy91?=
 =?utf-8?B?U2J3cjdveUNRQUlyQkwxaFZEWmlJR3lPb1VaNW13SndRbXRwd0paN0JCbWJW?=
 =?utf-8?B?ZmFTTCtFMjg3MDlZSmR5anlIQ0Y1ZzRGNU1FTkhmcEpoWEFPYkZwcS9yS1Fj?=
 =?utf-8?B?b1B4RThZZ0VoZkhqYktsQXZrNDd3ZGpBaGNTUmNlb044TER0QnJrVU05bGFN?=
 =?utf-8?B?UThqbTQwVldQSzBkNkNMNVdLNFpPYUlMS0F1K3VEb3dpUlRUVjVXVG9NMVZ4?=
 =?utf-8?B?ZE5GL2tqU1JydEtUNW82c1pBNndjbUcxWHU0Si9sV252THJGaEROZW12d1Ix?=
 =?utf-8?B?U3NrR0RVNmVqTEV2NGxDQy9ncWlKVThkeERmQTNqQ3hXQnl4aStPY25IUzQz?=
 =?utf-8?B?amlnUFUxeFlJWTdYVjRpUjR3Q1RMeFFpbjJmZ0o3VkIrN3FtL2ZSamREQXln?=
 =?utf-8?B?TWx2RnljTVhiclhVODRzTTFxWUFVNlQ2WGRuQXRJdmgzZUMzUTJaKzVFbFIz?=
 =?utf-8?B?Z0FBQkh6TGF4dWdpSUgxNkNOQmhBc09QUEo0WjAwc1dtckxGbVJ2bzQ5bXdJ?=
 =?utf-8?B?MDdhYmJGZnF5eU0xTEFGM1FjaXdNeUVrMkhNeEI5RUN2cEoyby9DdDR3TGVq?=
 =?utf-8?B?WFV4Uzg1RHVSeE5HZEJFSEN0bnYweXdoNC9LVWo4am0xTTVSZnRjMldKemVB?=
 =?utf-8?B?bEh3bE1KV1VOc1B2NllxcWhoNlp6RDdET28vNS81QitWdU1ZdStDSW9zS08r?=
 =?utf-8?B?OHdKSEZ0RnZDeHFMZ0dKOEJFZWFDT1hVdmhyZTRSYUZISGFBWG4rclJBcitm?=
 =?utf-8?Q?PBm9PdZZBaIDUYDAk8d4axM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fe75844-8752-44ca-f643-08dd8993f4a8
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2025 16:11:11.7752 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N9MA8i/NJDRL+NoSZ2nDXA26xlxOoQduSDqJTPz4/qEJRlS+pGvJUj8dPdwKLqMDqHxBBlUZvy6Og4y/4ob/0ocLOrzmkPFhWXEI0IeUPt4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFD5EE188BF
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



On 02-05-2025 20:09, Thomas Hellström wrote:
> On Fri, 2025-05-02 at 20:05 +0530, Ghimiray, Himal Prasad wrote:
>>
>>
>> On 02-05-2025 19:12, Thomas Hellström wrote:
>>> On Wed, 2025-04-30 at 17:49 +0530, Himal Prasad Ghimiray wrote:
>>>> This commit adds prefetch support for SVM ranges, utilizing the
>>>> existing ioctl vm_bind functionality to achieve this.
>>>>
>>>> v2: rebase
>>>>
>>>> v3:
>>>>      - use xa_for_each() instead of manual loop
>>>>      - check range is valid and in preferred location before
>>>> adding to
>>>>        xarray
>>>>      - Fix naming conventions
>>>>      - Fix return condition as -ENODATA instead of -EAGAIN
>>>> (Matthew
>>>> Brost)
>>>>      - Handle sparsely populated cpu vma range (Matthew Brost)
>>>>
>>>> v4:
>>>>      - fix end address to find next cpu vma in case of -ENOENT
>>>>
>>>> v5:
>>>>      - Move find next vma logic to drm gpusvm layer
>>>>      - Avoid mixing declaration and logic
>>>>
>>>> v6:
>>>>     - Use new function names
>>>>     - Move eviction logic to prefetch_ranges
>>>>
>>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>>> Signed-off-by: Himal Prasad Ghimiray
>>>> <himal.prasad.ghimiray@intel.com>
>>>> ---
>>>>    drivers/gpu/drm/xe/xe_pt.c |  58 ++++++++---
>>>>    drivers/gpu/drm/xe/xe_vm.c | 197
>>>> +++++++++++++++++++++++++++++++++++--
>>>>    2 files changed, 234 insertions(+), 21 deletions(-)
>>>>
>>>
>>> I was thinking a bit around the UAPI, and prefetching foreign
>>> device
>>> regions. That doesn't really fit into the current UAPI.
>>>
>>> What are your thoughts here. IMO this should align somewhat to what
>>> we
>>> do for madvise().
>>>
>>> Let's say we want to prefetch into a foreign device memory region
>>> identified by an fd? I figure we could add that later as an
>>> extension.
>>>
>>> But how does the UMD API for this look? Do we cover current usage
>>> with
>>> the existing UAPI syntax?
>>
>> During Initial discussions one of the way we discussed was using a
>> flag
>> something like DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC for prefetch to
>> madvise assigned preferred location.
>>
>> so it will be two step process from UMD perspective:
>> 1) madvise sets up preferred location: which should also be used in
>> pagefault handler.
>>
>> 2) If user wants to prefetch to same location, user passes region as
>> DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC to vm_bind ioctl.
>>
>> https://patchwork.freedesktop.org/patch/647180/?series=146290&rev=4
> 
> Indeed, thanks for reminding me.
> 
>>
>> or we can simply pass u32 devmem_fd as prefetch_mem_region_instance
>> to
>> vm_bind ioctl,
> 
> But that wouldn't work if we have published UMD using the
> mem_region_instance as the local mem_region_instance, right?

Thats correct.

> 
> So if we want that we'd need an extension?

True. IMO sticking to DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC  makes more sense.

> 
> /Thomas
> 
> 
> 
>>   if we want it to be single step, but w/o madvise that
>> wont work for pf handler.
> 
> 
> 
>>
>> /Himal>
>>> /Thomas
>>>
>>
> 


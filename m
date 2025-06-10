Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEA00C5B552
	for <intel-xe@archiver.kernel.org>; Tue, 10 Jun 2025 14:25:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8761B10E56C;
	Tue, 10 Jun 2025 14:25:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZSXNhTbh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 634F710E570
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Jun 2025 14:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749565524; x=1781101524;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=LRGH+joD9x4cA6ALLM0YWXDGeqd1MTUVSuKtIf0TJFg=;
 b=ZSXNhTbhVMgOJa9QzOTLlIDOdRgbfwd/hFUjl+X7Dt7TVji85Fltj5b6
 hrM76i6bwMBYa5WMDbz0B45f3SWk4KU9K7kjElwkal6tY3mmiZZBstxsX
 BkJHI7bLHig+RaDRk+YCCGdihRFDlYtB5an8z1yoq20NcKlUyC0ytvbSF
 n9z0RQyXE3QZ6uH4N2pe9OJttDSYRdG8Vzg7FYtHyLMrFbMM/XGnr8tAI
 Ls77n5ktXwmXl8au2ofyy9TkhZgG1sQTH3od1x9kDyaErvUFX8gApKoM2
 27W3BhzLIU22yU+H2QeTKhrCWvq4qhTsscsWlF2q8DQR255IppqjCjpPP w==;
X-CSE-ConnectionGUID: V3vjSR/pTDy4oTcShQjsPQ==
X-CSE-MsgGUID: /VHNd3D2QmSkAoR5RmsEGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="51823413"
X-IronPort-AV: E=Sophos;i="6.16,225,1744095600"; d="scan'208";a="51823413"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2025 07:25:24 -0700
X-CSE-ConnectionGUID: A0YILLKsTza1k0zJWEQjaQ==
X-CSE-MsgGUID: sSkYuE/RTmKQjDv4WdVIjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,225,1744095600"; d="scan'208";a="184037175"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2025 07:25:24 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 10 Jun 2025 07:25:22 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 10 Jun 2025 07:25:22 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.89)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 10 Jun 2025 07:25:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pZZ33xU7BTNdJX8AQZ0Tt0hoIr6vlrjTA9dEEMe9k19GlHsVKKt1TfpqzZUbfiALxboMfg6lO8VKG/2cp7WMWmwNqrn4sZ5bFw56OL1uO48MUxD6xGJYNTEe46OQOVtx97ALqUNEAYjjUwD3ngG7Ub28zYvaUpZKFmY0rj4eVPIYFJt9s1sLZOnLgyIhSgmf2WC21VIt/Wgu8uTFK2d+AaTj/QU/0UQcueSTcGWPPiMdewZlvLmXUs6E2hLF3Q/P4bJB+Yh82QkI1kOZS/HVjS0nKDSM1/yXcXjt5jjHcUdiPkHlch9UgwNo7CuGBrZCALLC45DkMoRDQughTH1jcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=doD3aXHQBCz7elW5mXj9LMjZMvAeBeqgMaPUC2jnZbg=;
 b=dYJBSms5g2mKrAIaKjWqQezqrkatd02wue7GhD0j2dW/jMqqnYp/OtiN6iw2SdVksHtFC31v9tHaSPwlm6iVdDlbB5eojNtyjITRfY3e99wdS+sXjf3Zm5H6OShqedUVHScyhv0uSXq37iI1laEnlVj8mNpvHp6wgBZQv3DegtaJu8/42jxFDdapoBGErZL1FDpPFzzLXk/WfHqWE+Htj8+0q4euxBEjNtErAZSjJUmlzq5dKogRhNbHNOtcifCBa/zFZ1LZ5z/v62xqeIiBbQRec4KVgy4FIREapyXJepINZCG8d4TWn9Rm7+5u358xTdIjm56Mm5zkyTjRc9rZYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB7014.namprd11.prod.outlook.com (2603:10b6:806:2b9::15)
 by SJ5PPF8622363CD.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::83c) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.30; Tue, 10 Jun
 2025 14:25:20 +0000
Received: from SA1PR11MB7014.namprd11.prod.outlook.com
 ([fe80::e707:2d60:2891:a02]) by SA1PR11MB7014.namprd11.prod.outlook.com
 ([fe80::e707:2d60:2891:a02%5]) with mapi id 15.20.8813.024; Tue, 10 Jun 2025
 14:25:20 +0000
Message-ID: <705cb146-0ac5-4e5f-adee-556293706ec5@intel.com>
Date: Tue, 10 Jun 2025 17:25:14 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe: Support for mmap-ing mmio regions
To: Matthew Brost <matthew.brost@intel.com>, Matt Roper
 <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <koby.elbaz@intel.com>,
 <konstantin.sinyuk@intel.com>, <yaron.avizrat@intel.com>,
 <moti.haimovski@intel.com>, <didi.freiman@intel.com>,
 <shuicheng.lin@intel.com>
References: <20250609095938.16782-1-ilia.levi@intel.com>
 <aEcByyaKe82P91RT@lstrano-desk.jf.intel.com>
 <20250609215820.GR5080@mdroper-desk1.amr.corp.intel.com>
 <aEd86MvDFJXR+wnE@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: "Levi, Ilia" <ilia.levi@intel.com>
In-Reply-To: <aEd86MvDFJXR+wnE@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TL2P290CA0015.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:2::18) To SA1PR11MB7014.namprd11.prod.outlook.com
 (2603:10b6:806:2b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB7014:EE_|SJ5PPF8622363CD:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e0dc469-cfb4-45b1-78b7-08dda82aa0ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?elI3Q1ZkVU9URTlhWXhFb2Z3a1FKbkkwa3BpK1lYcHdqcmNqMnFnTHN0ZlhG?=
 =?utf-8?B?UXVQOEVIR085S2JnRWpLU0dwUE80OUNRR3dLSFE4Wk0yTytiR1dpaXlDZE51?=
 =?utf-8?B?akhwTnFKTXNQQ0o1cTNjSHZ3LzM4RmZzL2ZYK1IyMHk4TVQ3cTJzV1IzVjlX?=
 =?utf-8?B?aTVva3FRWWxYMGlRK1VuSzVCelUxL251cTZJRlp4R2tyTGdhUTExMEo4YXdn?=
 =?utf-8?B?OGx3VmpOdERiU0dQR0lDcHVOVnozcUF3UEpia2Q4VHZZZHk0THQweXZaQ1I3?=
 =?utf-8?B?RlpXZ2tRWXVPbUhqQ0wxSVBNek9JVk5QYzMvUDZiVjg2RGVOejEwaDBETGRO?=
 =?utf-8?B?eld4TUhVOTZTaCt5RGx2Qk9rVWdBZFQyenU5bXpncCtIdm0zM2pMMkZ5Unph?=
 =?utf-8?B?T2p5TXFOalhyeXJnN2U1UjlQS0lrMy8zS0U5QW5nSnBGa1JrblFxZVpUd2d1?=
 =?utf-8?B?bmU5UlJQQm1FSWQrdzM3YTVhTUdKQ1BiMVhOMEY1QThnNG15ekN3eHlOa3g0?=
 =?utf-8?B?RlpTK1RVYWxYazNMM0RiTWRaSDhQSW14TzZlNHo4eFlraXpxaVpQRHYxaUQz?=
 =?utf-8?B?OVVrNCsxOGJSQkNVb2ZoWjhNVTNMZ052eUVBaTdWREhBRjhuS1BvMHNyTmNm?=
 =?utf-8?B?RmU1cjk1OHA0dCtjRlVrRGtxV1Ztd0did0RkNlhTa2pzQ3kxVnFsSUk3dDEy?=
 =?utf-8?B?WU1YQS9SNGEwMkpMejYrTjdyVXVaQk0zWTU1ZGtNT0FWb21CUGIyWm5JTGhX?=
 =?utf-8?B?aEs5L0NmZWFXSUpBMTJJQlFVd3JEc0J4R2xsUUZCenZ1NEk0VWdSUittQUs0?=
 =?utf-8?B?UFdLUEhtNmltZDRlV3RmSXJTWWpVcGpwMk03SWhGa01ybTJVRGxIbnZoc3Z6?=
 =?utf-8?B?U1ZHbkVBbm9aQytxYkJGNFBGNTI1K0c2amh5ckd0bE1WZ2gyc3VvZVdib3Bm?=
 =?utf-8?B?VndaMHd6S1J6ZFFLU0U1QjRZZ2JKM1VtUEdaMEhWdXZBb2VVYm94VFYyY0Vr?=
 =?utf-8?B?dVcvb3djNkFXaXVMaUtFYktTS20xL3MxZWNBTnlYOTZNcktHV3g1aUw3RGZM?=
 =?utf-8?B?TlZ5cXJDS240Njh1WEVGcXVYbEpadEdLaTlDMHZXZnFPdWhNUUE1N1FMU245?=
 =?utf-8?B?c1FJK29lZ3pnY0dVdGk2b1I5MnhJRiswejNFV21EaGkrUFZIU2lwRnIvSS9C?=
 =?utf-8?B?Ukl6dzFhUTY3NmluODA5Ym55ZjgveVdNbFhoMENTcWUvSis1dU9SRk1qclFD?=
 =?utf-8?B?dTU1Uzl1M2s1SU1DSEtYWEJnZnZlRENFWWRMZ09iYmZkSDVLKzBhSldEbVdF?=
 =?utf-8?B?eFRITkIvemFDVHdXdVFXY2V0UDlhZkhrVVF4amRSYjZSa0lINWI2OTh5ODNI?=
 =?utf-8?B?SlVyaWduQ3JIVHZFWjhoWEdSenhnazlkcjhZQkZFUjQwT3MrWCtFV1ZJeGxh?=
 =?utf-8?B?S1NFNkFGTEVqeVd0eUhDYXRsUjZTMmk5WkJnT3lpL1BkZ1I1VlhlQm51UWdx?=
 =?utf-8?B?Q2dpWGh1MkZ5cUdUancrSGlzYkZlTXhsaU5xWGh0U1JHcWU2ekczVTFOQXZ2?=
 =?utf-8?B?MkVveTBhZGdOemhQU2tGK1EwRnZjaWFhQzZqUExvdUdUZ1BlNTNqeU5HNXY0?=
 =?utf-8?B?a3lVTERvMG1mRjBjdmdDZTBvR0JadWd5a0o3YVVKUW9namk5SVM5c1RvcFd4?=
 =?utf-8?B?YUNTUUk3Q3d2RkZGRUU3NUx3a1E0aWR5T1p0dVB5anZSVWlBL3Y3WVBOc3Fq?=
 =?utf-8?B?aEUxQURmOUlJRi9wWjlDR1RiVjZwbGtlR21kSCtHY29aMHlvTnBCaVdjcUM0?=
 =?utf-8?B?TElrZ0dkZE51ZDd6SUVhaEh6MklxaDJGMDFqeW9xdUtUMHoyR1ZVTnFnRzR0?=
 =?utf-8?B?TVZCYTNrb3dJNk01anpoZno2OU53T2VSOVFwUDFLSHY3NEhaY2tTYWVrS2RW?=
 =?utf-8?Q?dMk6JsU4NHY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB7014.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YmRYYkNPZnJVMVZPUG1SL3NvZ0FFQXB1RnVtUG43d2VCOE05ZWxraFZ1elFk?=
 =?utf-8?B?MzlEVUdicjhMWDNvL2NNMWxSYzdUREt3TCtPUjIxeGJWdnl3SXRYVWNVTVBO?=
 =?utf-8?B?SHZyREIzMzUvUUlobzhTeVRWYXE2SC9WL3lMVm5SY0xXRGRLMkkzV2diSWlk?=
 =?utf-8?B?T3g4VzQ3V2dLb0FZVzNwTEZtaFhlTHd6Y0swUFZOVlpKa0VQZGNiMjdrQk5t?=
 =?utf-8?B?czN3VGtDeFozVDZmR1BMbHV3SklpRnVtTDVIamFxNUdEOHF3R1FBVTJzMmpD?=
 =?utf-8?B?azFmTEhETXVPdmozdUlNZGtYZ2VFZEU3Z2N4cnlsb3lMWG43VE5MWVBlWVU0?=
 =?utf-8?B?bnJoUEg5cXNPNnVweERhL1QwWlpOYnllUWR6VFZWTU16SXFZSElISmNQR04v?=
 =?utf-8?B?UzRyVHJHYVFxS016eHEyZlRPSE5NamdaUFREbmY3RWkwMFBPc0tEdGprVWQw?=
 =?utf-8?B?RUN1cGlZNllLWGZEVWREOU51WUFwZ3NLSnh5WVhBaHV6U2Y0aEk3MlJobTdh?=
 =?utf-8?B?Yy92WFkraXBONHlHYTRiNE9QSWMvaTRMcHhLcHNnVy9VZDF1bUM4Ym1GQXJm?=
 =?utf-8?B?WSttaFhuR0lSZDk3aWtCYXJvSFVaRndqSzkvZXl2Tml1SXQwcGpGV0VDMWhS?=
 =?utf-8?B?cjRZNUJRdmlJQXYxSFB0bDlSS0xuK3hsaG40bk1nYnZBWnZ0aEd5YlZBSS9I?=
 =?utf-8?B?RzR1MVc2Q0ZoNnV6eGhOOFI0ZzY0Wll0Qm84dUxhR3FlYU1YNjlZT0J2ZGZs?=
 =?utf-8?B?ektTNzE0b0lUbktwNHZrZGxsVnVqUXl3cWRZSUhkQmFrREFzaWd6cU00eU12?=
 =?utf-8?B?WlF4c0M5WEJVOFBKaE53T0hrMW1OLzBrUWtvSFVYemxRQVI3VTlCdkhiZXcv?=
 =?utf-8?B?WlM0WEtERHVCakcyTHptaWZvQ3ArTHZ5MXpIUy9aZ3d5RHlHOE56UFlSdy9w?=
 =?utf-8?B?VzNSaW54ZWRBTmltWlBEMHl6MkJheCtFZ29GckhPa2lEQ0ZNNjEybWdqQ1Vl?=
 =?utf-8?B?YVEyM0l1bWp6TFR4TE9SaGlmYWl0Nm5pWEZaZjZSQisrNkNhd1lPTmRWc0V6?=
 =?utf-8?B?SlV1Z2RZbFcxVUZnazI2cXpQejRzekhlUmw0OUdzRDZSdDdCVUIreWhHYXBr?=
 =?utf-8?B?bFpuUXpNdlN1S1FGMm9SQUs3aEZQNGV2aGIrNFJGd1U4SVluZG1TZ1YzL1pH?=
 =?utf-8?B?SlBHcVU3M2hudkNRVXUxdmkrNUs3VjFZeGZiNFhhWi9sN1p1VGZOSHRvMzZm?=
 =?utf-8?B?WFZQcXQvVkZKRzRQWXozZXVGNFBVV2Fhckx6VW5RMmhvT0pyZk9SV1hWdnRL?=
 =?utf-8?B?TWJGVjJnTnd1K2pweHR3VHFQYzRHZk84S0luNWViYys5akZLV0JBN1NobXRF?=
 =?utf-8?B?S1Vydi9nTUwvU0lTWUZpeER4TzUvUkJOb1FhRU9qbzNXYllVNWpHbGJNYzlS?=
 =?utf-8?B?dVpwTTBBaWRrSXMwNTIvOHBadTZXMWN2VDdtRVdSN01PaklCb3ZJaGg3VlVp?=
 =?utf-8?B?aWZvN2ZVM1pVRWdDTm9DTjFJVnF6eVI5cFhHMitkY3o0akRlUitaQ2d1Y0Ru?=
 =?utf-8?B?alpnbWpoK3NsbFhuWkJNaVZZTmhvQXpUendaNkpjMFBGNGJmTVc2Zm5keUpU?=
 =?utf-8?B?ZFFaZ3B6UXNseUc4d3ZLdi9COGZKNkdNNnczQnVTN1gvdjQzNTNuQXE1d243?=
 =?utf-8?B?QVRpc3hPWnZ0V2ZGLzZqTXFxVXNZd0h5WnFUNDBoY0duV1Y0bFo5QXArTXo3?=
 =?utf-8?B?MlYrUmlyQ1hGQmt4eEpGSzdpbWdoTjlxUzVVRFpBM2UvV3NlNk1QMXpGNyty?=
 =?utf-8?B?THgxdWFjeG15R29nRVBHTDZoa1VtaDVJN3BQREo3WVFURDFNQjhOaFVsSkdH?=
 =?utf-8?B?WWZra1hRM2tMZlczTDlxK0RlM21tWXVzWUhQY2VJSTJPZGxraTY0Qnd6OUM4?=
 =?utf-8?B?L0lWNXhVdnRUNk5KZ1VKTUs1Rm5VQktJUXROd1VUYlNDT2JMeWpTS1RUNGsr?=
 =?utf-8?B?bGMzcEh4Z0pNU0lvdWQ3SmJkR3FKWGtGWUFQK0dtbWU1Q0J2OGNPSkdhTGpw?=
 =?utf-8?B?STZJWG9UMUNrNTd6RHFYYjJpcTA3ZnRYM2hsTzMzTmlXa2FJQzFPcXZmbHh0?=
 =?utf-8?Q?AfmTQ+450IsdNCw9vATfx75K7?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e0dc469-cfb4-45b1-78b7-08dda82aa0ef
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB7014.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 14:25:20.1532 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jYKqatmrxP5u7xhGJxdA54hVIREjE/sWpMr7WceK/hipODBhm0ihyUWgwNagGv6uifAUpz0bVE8/llEyPXa4Gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF8622363CD
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

On 10/06/2025 3:31, Matthew Brost wrote:
> On Mon, Jun 09, 2025 at 02:58:20PM -0700, Matt Roper wrote:
>> On Mon, Jun 09, 2025 at 08:46:19AM -0700, Matthew Brost wrote:
>>> On Mon, Jun 09, 2025 at 12:59:38PM +0300, Ilia Levi wrote:
>>>> Allow the driver to expose hardware register spaces to userspace
>>>> through GEM objects with fake mmap offsets. This can be useful
>>>> for userspace-firmware communication, debugging, etc.
>>>>
>>>> v2: Minor doc fix (CI)
>>>>
>>>> Signed-off-by: Ilia Levi <ilia.levi@intel.com>
>>>> ---
>>>>  drivers/gpu/drm/xe/xe_device_types.h |  14 +++
>>>>  drivers/gpu/drm/xe/xe_mmio.c         | 142 +++++++++++++++++++++++++++
>>>>  drivers/gpu/drm/xe/xe_mmio.h         |   4 +
>>>>  3 files changed, 160 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>>>> index ac27389ccb8b..78542de0d48d 100644
>>>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>>>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>>>> @@ -10,6 +10,7 @@
>>>>  
>>>>  #include <drm/drm_device.h>
>>>>  #include <drm/drm_file.h>
>>>> +#include <drm/drm_gem.h>
>>>>  #include <drm/drm_pagemap.h>
>>>>  #include <drm/ttm/ttm_device.h>
>>>>  
>>>> @@ -161,6 +162,19 @@ struct xe_mmio {
>>>>  	u32 adj_offset;
>>>>  };
>>>>  
>>>> +/**
>>>> + * struct xe_mmio_gem - GEM wrapper for xe_mmio
>>>> + *
>>>> + * A GEM object for exposing xe_mmio instance to userspace via mmap.
>>>> + */
>>>> +struct xe_mmio_gem {
>>>> +	/** @base: GEM object base */
>>>> +	struct drm_gem_object base;
>>>> +
>>>> +	/** @mmio: The MMIO region to expose */
>>>> +	struct xe_mmio mmio;
>>> Any reason not this is not a pointer to xe_mmio?
>>>
>>>> +};
>>>> +
>>>>  /**
>>>>   * struct xe_tile - hardware tile structure
>>>>   *
>>>> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
>>>> index 7357458bc0d2..6bfa915a9602 100644
>>>> --- a/drivers/gpu/drm/xe/xe_mmio.c
>>>> +++ b/drivers/gpu/drm/xe/xe_mmio.c
>>>> @@ -408,3 +408,145 @@ int xe_mmio_wait32_not(struct xe_mmio *mmio, struct xe_reg reg, u32 mask, u32 va
>>>>  {
>>>>  	return __xe_mmio_wait32(mmio, reg, mask, val, timeout_us, out_val, atomic, false);
>>>>  }
>>>> +
>>>> +/**
>>>> + * DOC: Exposing MMIO regions to userspace
>>>> + *
>>>> + * In certain cases, the driver may allow userspace to mmap a portion of the hardware registers.
>>>> + *
>>>> + * This can be done as follows:
>>>> + * 1. Define an xe_mmio instance that represents this portion.
>>>> + * 2. Call xe_mmio_gem_create() to create a GEM object with an mmap-able fake offset.
>>>> + * 3. Use drm_vma_node_offset_addr() on the created GEM object to retrieve the fake offset.
>>>> + * 4. Provide the fake offset to userspace.
>>>> + * 5. Userspace can call mmap with the fake offset. The length provided to mmap
>>>> + *    must match the size of the xe_mmio instance.
>>>> + * 6. When the region is no longer needed, call xe_mmio_gem_destroy() to release the GEM object.
>>>> + *
>>>> + * Limitations: The exposed xe_mmio must be page-aligned with regards to its BAR offset and size.
>>>> + *
>>>> + * WARNING: Exposing MMIO regions to userspace can have security and stability implications.
>>>> + * Make sure not to expose any sensitive registers.
>>> This is no secondary issue, it is a primary one. There is no way we can
>>> expose entire PCIe MMIO register space to a non-root user (a root user
>>> itself can just mmap the PCIe MMIO bar bypassing the XeKMD if it wants
>>> btw).
>>>
>>> What is the requirement for this patch? I know on other PCIe devices
>>> I've worked on we had similar issues where we needed to expose a subset
>>> of the PCIe MMIO register space to user space for kernel bypass
>>> submission - everything we needed to expose in that case was 4k aligned
>>> + tied to a single process via a KMD config before mapping to user
>>> space. I suspect to do anything safely here, somethine similar needs to
>>> be done.
>> I don't think it was the original intent of Ilia's patch, but I can
> Yea, I think I figured that out after I sent this - the xe_mmio
> structure through me off here as this structure currently only exists in
> the xe_tile, xe_gt but I'm assuming now xe_mmio_gem_create is called
> with a xe_mmio that is subset of either the one of those, which I can't
> say I love this as a design - I'd rather have xe_mmio_gem_create called
> with a pointer + size to avoid confusion.


Actually my initial implementation was with bar offset and size. But we plan to
use xe_mmio as a "view" on certain portions of the BAR (i.e. hw blocks) in
upcoming platforms, so it lends itself naturally to be "exposed". See the example
from my previous mail, and if you still think it's a bad choice - let's discuss.
- Ilia


>> think of at least one feature expected on an upcoming platform where
>> there is a page or two of registers that the hardware team designed
>> under the assumption that they'd get mapped directly to userspace in a
>> read-only manner (i.e., information read-out only, no control of the
>> hardware).  I think some of the internal discussion was considering just
>> going our own direction and exposing the contents of that register block
>> via an xe_query instead since the contents likely wouldn't be changing
>> after boot, but if this infrastructure exists it might be a simpler and
>> more natural match for the hardware design.  +Cc Shuicheng since he
>> might find this interesting.
>>
>> But if we're allowing this to map registers to userspace in a read/write
>> manner (or map any special registers that have side effects on read)
>> then we probably need a bit more scrutiny of the specific use cases to
>> determine what kind of permissions are required, whether they're safe to
>> access in concurrent / racing manners, etc.
>>
> I think rules basically are - cannot read another processes data, cannot
> issue a write that has any affect on another process. I'd assume if the
> hardware is designed with mapping MMIO space to user processes in mind,
> it would be designed in a way to not violate these rules.
>
> Matt


Sounds reasonable, doesn't |VM_DONTCOPY| + drm_vma_node_allow present in this
patch cover this? Or am I missing something?
- Ilia


>
>> And of course since this is new uapi, the regular graphics upstreaming
>> rules apply and we'll need an opensource userspace consumer fully
>> developed and reviewed before we can merge the kernel changes.
>>
>>
>> Matt
>>
>>> Matt
>>>
>>>> + */
>>>> +
>>>> +static void xe_mmio_gem_free(struct drm_gem_object *);
>>>> +static int xe_mmio_gem_mmap(struct drm_gem_object *, struct vm_area_struct *);
>>>> +
>>>> +static const struct vm_operations_struct vm_ops = {
>>>> +	.open = drm_gem_vm_open,
>>>> +	.close = drm_gem_vm_close,
>>>> +};
>>>> +
>>>> +static const struct drm_gem_object_funcs xe_mmio_gem_funcs = {
>>>> +	.free = xe_mmio_gem_free,
>>>> +	.mmap = xe_mmio_gem_mmap,
>>>> +	.vm_ops = &vm_ops,
>>>> +};
>>>> +
>>>> +static inline struct xe_mmio_gem *to_xe_mmio_gem(struct drm_gem_object *obj)
>>>> +{
>>>> +	return container_of(obj, struct xe_mmio_gem, base);
>>>> +}
>>>> +
>>>> +static inline phys_addr_t xe_mmio_phys_addr(struct xe_mmio *mmio)
>>>> +{
>>>> +	struct xe_device *xe = tile_to_xe(mmio->tile);
>>>> +
>>>> +	/*
>>>> +	 * All MMIO instances are currently on PCI BAR 0, so we can do the trick below.
>>>> +	 * In the future we may want to store the physical address in struct xe_mmio.
>>>> +	 */
>>>> +	return pci_resource_start(to_pci_dev(xe->drm.dev), GTTMMADR_BAR) +
>>>> +		(uintptr_t)(mmio->regs - xe->mmio.regs);
>>>> +}
>>>> +
>>>> +/**
>>>> + * xe_mmio_gem_create - Expose an MMIO region to userspace
>>>> + * @mmio: xe_mmio instance
>>>> + * @file: DRM file descriptor
>>>> + *
>>>> + * This function creates a GEM object with an mmap-able fake offset that wraps
>>>> + * the provided xe_mmio instance.
>>>> + *
>>>> + * See: "Exposing MMIO regions to userspace"
>>>> + */
>>>> +struct xe_mmio_gem *
>>>> +xe_mmio_gem_create(struct xe_mmio *mmio, struct drm_file *file)
>>>> +{
>>>> +	struct xe_device *xe = tile_to_xe(mmio->tile);
>>>> +	size_t size = mmio->regs_size;
>>>> +	struct xe_mmio_gem *obj;
>>>> +	struct drm_gem_object *base;
>>>> +	int err;
>>>> +
>>>> +	if ((xe_mmio_phys_addr(mmio) % PAGE_SIZE != 0) || (size % PAGE_SIZE != 0))
>>>> +		return ERR_PTR(-EINVAL);
>>>> +
>>>> +	obj = kzalloc(sizeof(*obj), GFP_KERNEL);
>>>> +	if (!obj)
>>>> +		return ERR_PTR(-ENOMEM);
>>>> +
>>>> +	base = &obj->base;
>>>> +	base->funcs = &xe_mmio_gem_funcs;
>>>> +	obj->mmio = *mmio;
>>>> +
>>>> +	drm_gem_private_object_init(&xe->drm, base, size);
>>>> +
>>>> +	err = drm_gem_create_mmap_offset(base);
>>>> +	if (err)
>>>> +		goto free_gem;
>>>> +
>>>> +	err = drm_vma_node_allow(&base->vma_node, file);
>>>> +	if (err)
>>>> +		goto free_gem;
>>>> +
>>>> +	return obj;
>>>> +
>>>> +free_gem:
>>>> +	xe_mmio_gem_free(base);
>>>> +	return ERR_PTR(err);
>>>> +}
>>>> +
>>>> +static void xe_mmio_gem_free(struct drm_gem_object *base)
>>>> +{
>>>> +	struct xe_mmio_gem *obj = to_xe_mmio_gem(base);
>>>> +
>>>> +	drm_gem_object_release(base);
>>>> +	kfree(obj);
>>>> +}
>>>> +
>>>> +/**
>>>> + * xe_mmio_gem_destroy - Destroy the GEM object wrapping xe_mmio
>>>> + * @gem: the GEM object to destroy
>>>> + *
>>>> + * This function releases resources associated with the GEM object created by
>>>> + * xe_mmio_gem_create().
>>>> + *
>>>> + * See: "Exposing MMIO regions to userspace"
>>>> + */
>>>> +void xe_mmio_gem_destroy(struct xe_mmio_gem *gem)
>>>> +{
>>>> +	xe_mmio_gem_free(&gem->base);
>>>> +}
>>>> +
>>>> +static int xe_mmio_gem_mmap(struct drm_gem_object *base, struct vm_area_struct *vma)
>>>> +{
>>>> +	struct xe_mmio_gem *obj = to_xe_mmio_gem(base);
>>>> +	struct xe_mmio *mmio = &obj->mmio;
>>>> +
>>>> +	if (vma->vm_end - vma->vm_start != base->size)
>>>> +		return -EINVAL;
>>>> +
>>>> +	/*
>>>> +	 * Set vm_pgoff (used as a fake buffer offset by DRM) to 0 and map the
>>>> +	 * whole buffer from the start.
>>>> +	 */
>>>> +	vma->vm_pgoff = 0;
>>>> +	vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
>>>> +
>>>> +	vm_flags_set(vma, VM_IO | VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP |
>>>> +		     VM_DONTCOPY | VM_NORESERVE);
>>>> +
>>>> +	return remap_pfn_range(vma, vma->vm_start, xe_mmio_phys_addr(mmio) >> PAGE_SHIFT,
>>>> +			       base->size, vma->vm_page_prot);
>>>> +}
>>>> diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
>>>> index c151ba569003..2990bbcef24d 100644
>>>> --- a/drivers/gpu/drm/xe/xe_mmio.h
>>>> +++ b/drivers/gpu/drm/xe/xe_mmio.h
>>>> @@ -8,6 +8,7 @@
>>>>  
>>>>  #include "xe_gt_types.h"
>>>>  
>>>> +struct drm_file;
>>>>  struct xe_device;
>>>>  struct xe_reg;
>>>>  
>>>> @@ -42,4 +43,7 @@ static inline struct xe_mmio *xe_root_tile_mmio(struct xe_device *xe)
>>>>  	return &xe->tiles[0].mmio;
>>>>  }
>>>>  
>>>> +struct xe_mmio_gem *xe_mmio_gem_create(struct xe_mmio *mmio, struct drm_file *file);
>>>> +void xe_mmio_gem_destroy(struct xe_mmio_gem *gem);
>>>> +
>>>>  #endif
>>>> -- 
>>>> 2.43.0
>>>>
>> -- 
>> Matt Roper
>> Graphics Software Engineer
>> Linux GPU Platform Enablement
>> Intel Corporation



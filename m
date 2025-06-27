Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8D00C7EE2A
	for <intel-xe@archiver.kernel.org>; Fri, 27 Jun 2025 21:13:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6754A10E033;
	Fri, 27 Jun 2025 21:13:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FFdGdKAn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C6F010E033
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Jun 2025 21:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751058835; x=1782594835;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=QaHzv84J7yLyVdsF5lbXlcQ5/PAcz5N0H2Pseu31OnA=;
 b=FFdGdKAnIp9GZ58wz/wkR7ZECQnhITXybQ/H7ro8AVcZWM+V0XgvExY0
 +/5Jl4bETCH9D1JsW3beDScgG1ShEm2+UEnL0H6Lm1oWv+Q5tBjB7knV6
 cKZnMAOYQHWmMefhc4zDKo1rET7bd/Lh5EJ59k2IDldU3G9OgJ0xwDvpl
 IACPKAs5TCtX0M22DFQgprOiGpFhGKORWkk/ySfyfG+cgPzsCYeaiTnL1
 Me/+CLD/pKKZgM6JL77/9vJq1nYmwYV22bBG4nzdNo9djRHuHfbqaNAdB
 JXgncMK70GuQmrwRHcpDpbAlzJEfSlw0HqMSsfAuxenndf1k0jELWc76f Q==;
X-CSE-ConnectionGUID: 68G3NAj0TxG7uh6cPqUp3A==
X-CSE-MsgGUID: GbPZwf78QRq9EVaAhV3XeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="53465049"
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; d="scan'208";a="53465049"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 14:13:54 -0700
X-CSE-ConnectionGUID: DHDV2QRBQRWqsnOxB7bO/Q==
X-CSE-MsgGUID: oYksyNYtSbCINrkNS3rGzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; d="scan'208";a="153387791"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 14:13:54 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 27 Jun 2025 14:13:53 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 27 Jun 2025 14:13:53 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.72) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 27 Jun 2025 14:13:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EYCCS0Zc+bmqRRRHu9cgKnkkbxqnt2y7KYNhozASSZCwutn6DJQiXHHbc8i2lvXrvklHBJ108Hr6hC1wc8uy8RzEkQ6I+0SVe94p8RPqTjsW5OY3fbj0SvA1oKaYQVNCQvHX4ma4ZR1R1HreQJB23H0XoJHlHJd4gzFAWW0PCOAZepdKa4oEun6JzyRw4OvKfFB1Vpx10wVoFR6sF9cyV5lZ60qRA4BNmS1NrFr9kBKFh/2uGiY/rjLX7zI8vqLEf1thmoWhAaMYxYPMFoFNG19s9O1ueIwmHGmYeub2Moxor1wLLZIaNNzVhBc8h6+tAk5NtscVS7+s7EmGei3vWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=li4PAbCgCOej3GGhL8n3NL5SmH66qkiyiSt9XMIvIZQ=;
 b=x3gY5gJqAFtrrS0XV3D1SQokIdn4X9TJ8feQP69fxYdYedwbFcpTObdkUDkN0tdVCAXpGLNPy/BbLU1yb57phK0e1+yVXkHsxsocebfhhHZeWLmlCw+n/wG//w4B8xwEp80kTamJLG6NhJqvlq2zC7XPS9gdxGuWrQhaUfoBOEjm96htCW8j39zZfNvSr8Ktqs21sR9kOysoFVg8maxxJ0jT9X2CT71YBYXdzcsQ4/P/EKS5MsbS8PO4GBp4nm9iGUPu/+37+6HES6sNMFoEYlx2ov27OmUpv3ES6T63fsbjDf8Ux9M5XFZPoZnIvRcYwn4vQadjLOoM2ooqM32UhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB5923.namprd11.prod.outlook.com (2603:10b6:806:23a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.26; Fri, 27 Jun
 2025 21:13:51 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8857.026; Fri, 27 Jun 2025
 21:13:51 +0000
Date: Fri, 27 Jun 2025 14:15:31 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Francois Dugast
 <francois.dugast@intel.com>
Subject: Re: [PATCH] drm/xe/hw_engine_group: Fix potential leak
Message-ID: <aF8J88KDr6nheMXG@lstrano-desk.jf.intel.com>
References: <20250627184143.1480-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250627184143.1480-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MW4PR03CA0145.namprd03.prod.outlook.com
 (2603:10b6:303:8c::30) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB5923:EE_
X-MS-Office365-Filtering-Correlation-Id: 25034e79-4f19-4ebe-7901-08ddb5bf83b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cG1HSzY3SGs2eWo4NTZCYWRkMzlYNGZuSUJ4eXBaWGRtS2M1WlFiTjBKMUYr?=
 =?utf-8?B?cDFSZDVIQTZXZUx2TTlGZ3JOdCs1VHRWcDdvcXI4NmZBYU44Mkc2UkRSK1R1?=
 =?utf-8?B?VEtDUlgxc2llWTJudDE0NWExUGs3dTRDbU4vTGcya256dU9FSlRQVFZJRDRs?=
 =?utf-8?B?TWE5eWRDSXBzaVJmMldYaUgxcjhGcWJuTnBRK2QwQjZqUFNEWXBGd3VMajh5?=
 =?utf-8?B?cWRhZXlWcmZPQko5eFdlYjlkMFF4N2xvOUZ3eks3MXkvUEZWc1E2dGp2dHp0?=
 =?utf-8?B?aUwzQ1czRjRhLzhZMFZybUo5MXFySDE4N21jRENmRklvZnBSdWRzUk1kM3dn?=
 =?utf-8?B?VHRUQU1idFNPckFPSm4vODFQUjdrZ05xYXJCRm9nU0xYTUZZRG9nUE9kaGhu?=
 =?utf-8?B?RExGRUhBeFNtZmFaNlhEcFJZNlFFK05yRmxLOWlhK2w3bFFhR29DY1gzbVJU?=
 =?utf-8?B?aVcxdUN1aVNVTGx1SUl0cmNoU0N6RnkvVEZkQnNKRUp2RmhsbWNLbFRRWEFF?=
 =?utf-8?B?dDNQRW96dDU1KzFGN0c1cGRMTWRlMC9YUHo4bXEwc3VHVWFoanN5UUEvSWx4?=
 =?utf-8?B?akpTRWtxeW43UEpmeE1pYVYwbEJYejYvUFdMVlJ3L0hWbDVYSU9Bbm8yTm1a?=
 =?utf-8?B?dXhCdUtlUTc1eVNRL20vbWNPUllEa29UZGhZSS9zK2M4Qjk1Y3V0bTh4Tmdh?=
 =?utf-8?B?STRUTVVGUklJZU9wRG9Vc25lejF3UEhhcG9FdUw2MURDbllSSWZzVDdnWjBz?=
 =?utf-8?B?aWRxeGlXNUsvTlVFaFRkRWQycnhkWHhuU09JQ1Fld2g4ekViencvRkVkcVJK?=
 =?utf-8?B?ZXFHbWc4QzFZeWhpLzFjbnhrelVLQnQxVlp5V1pZMlovL2dRaExZQWM4bUpt?=
 =?utf-8?B?WFM0K2s0L3ErNzZPbE52TzgwMjdGbXh2NEZZR1dmWDlEc3NJT0tFV0taY05R?=
 =?utf-8?B?TEthUkFlZU9uNk9RZWxKTDNQVFNFcXpmQ1JSeXAwN1JNVytzVUtyUTRHeFpS?=
 =?utf-8?B?b2tURy8wZTRNMld1dXhOMktEV1hkRzBhQ1Jpd3dMSktrdDhBRWFqNmlCaFpn?=
 =?utf-8?B?aGQvc1JRajJ4SzVCSDJrdytuMkRRR0RxMm90bDl1czVTQVdhWHg4QWlENlor?=
 =?utf-8?B?SW9DV0g2RUJwdEpjQWRocDJrd21vdHJIYUk4L0V5a2NYT3lCckFjcEhTSUgv?=
 =?utf-8?B?Qy9JaVVRT0xKUEJJNUVhS0hib1FpWngxSWFaYm1iQjNaZ25wRGpTcUNRNm45?=
 =?utf-8?B?RkRCelBBd01mNWNhNlQ5WDFlM24vSXk5QkpLNjh3L0w0NHUxM2FVNXBXSllN?=
 =?utf-8?B?dlg3bW9IR2tuK1cyV2ZKL1N1NTZuSFJoOTJhcnB4dUtXekdyK1NHTHdDdUd4?=
 =?utf-8?B?VjRrWEprZC9GUTRxVHdOSWhLZldIZnd5alhPL1FQeG9lU2tkZGcwMWhrU3Zy?=
 =?utf-8?B?emRXOWtGNVZYOE8wd1QrK1d1ZklaRndDU0JST2tMam05ZVp0a1ZZWDJSM1JN?=
 =?utf-8?B?Y2RZcHFEWi9zUGpJNHZVT0wrdDREempjbDBmL1BNTnJKZlNYN29QUHQ4bFU1?=
 =?utf-8?B?d0FHMFNoTUJmTldVY1hSWU0raytxUFBuemVVQzdPQkRVSVdvY3NRd0g3ZC9p?=
 =?utf-8?B?K1BoVzFHUTNjREhjNkdQY0dGN0NmV20rTlYrejNERmlCbHZTaWRKYjJXVkRF?=
 =?utf-8?B?SHpBUnhXVFZYUElpcnY4OFlRMkxHcS9rOExsS2xuSk1ZMlNJa2x6WlVEVU9V?=
 =?utf-8?B?Y2xrQTQ4Rmh4d2ZxS1BDcHdSTC9LeG5ocjBOcEVKNUF2dmxrL0JMMHgxREdG?=
 =?utf-8?B?ai9sQ1Y1QnAxYmFSakdiakRnRGlmbmwwYWRuVmtBaHJIemJ1dUxyZmF6SG5L?=
 =?utf-8?B?VkgxY25nS25PWlpGM2p6MnFqWFRCTlJzSyt5UHZ3ckQrdmI4OW1pbFNobTc5?=
 =?utf-8?Q?VT/UPTCrToo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Vm9tN2ExenFkTlVYREtrQnB1YzhwWmdIdXBVZ2Q0NlNlcW82anV4TGRubWtv?=
 =?utf-8?B?WnRiUVNPemhTQnYxcXdia0FvTUUrRGk0VjllamZ5RkcvYVg2NmtZeFNaKy90?=
 =?utf-8?B?aCthWDVxR0RCRDI0OWYrOXhNZkZxTWtOaWRidUh6TEw3bkdWWTdUYzdyVitS?=
 =?utf-8?B?NitWZ3BRYWZ1SjVKN0xTeVppMGY0ZktvcTVpZnlOd2pFbWpSVkE3RVEzeE01?=
 =?utf-8?B?V3UzNFdoYzBKOFo4d1hTdUZjazBQclgxM0M0b2x2WnpKQ1FBN3VlLzl3ZTgz?=
 =?utf-8?B?c29FNXhhSEhYSy83dUFHRjV5NCtlQ2RNOTRmc25MY2RZVmZ6QzAvcytBT1R2?=
 =?utf-8?B?VWxUeEVQWk9SdGxIcG5sU01pbVYwMVpnNGc2N3BpVG1ybURhaEs3cG9kdjdz?=
 =?utf-8?B?c2pmYkpvK2pETnZoL1gyeU5Ielp5Z2srRGdyREVEN0pON1N4ODNEMkxDWldZ?=
 =?utf-8?B?bHZTcTg1dlRoWURRbTNlcXpEWm5BRG45WWtod292UFMrbEhqdzQxYUx0RzFO?=
 =?utf-8?B?VUhJN3Fua3RiNlYzVnRENjNBam5ieS9nUWdrR1h3OXlabS9YYTVDaGs0TnFn?=
 =?utf-8?B?RTk1M0NHTnh3dHVEZzhKOTJGQUJqbUdaQURrb2lJckprRWFVZU9wSnV5YVhu?=
 =?utf-8?B?YXpYUkNOR2lHTXkvOFZ6MFlBbzNYeHViamV5YllWc2NaNmZ6bTJ6eGVOeTBN?=
 =?utf-8?B?aVhkTHVVOGREQU9XMU1seFQ0Sm1nQjh3Q2V0ckxJclIzUkYrSjRWcVdoS0th?=
 =?utf-8?B?NUw1aE1FM0lwQ04zL0hPSmlTdzlwYTE0S1Avb3FwS1E4T1NydjY3Y0ZsZFlw?=
 =?utf-8?B?YTlYcEdvWk9qRXlJQlVaZXRWQVBNZk9VUTA5RXZlOGRiUHFXdm9GRlpJWjJs?=
 =?utf-8?B?eUFLSlJZaTczNWY2SVhuUGNrNlRYeTk4NHp4RkpHYnNEU0JIVDNhS0NSUytm?=
 =?utf-8?B?M3pjUks2R0pzRzlYOENhOTJ5b1hhUGRLR2hUR3BPck93b3RjRjBNNFNJRUVv?=
 =?utf-8?B?SkpzUmxJbHp4RUs3L2EvcXNnK1RMd290eWV2WjZwTUNSTUVoZ0dlRHdlOHB3?=
 =?utf-8?B?TnJlejBldTVGRmVNYk52bTRoMGd1dmxvdTJsWWVTcjFyNGppMkFUSnZkdkhS?=
 =?utf-8?B?eDU4V1ZZck5MOWRURzBDQktKSHNCcVQ5a3FpRWV2bHpENUh4dFRvd2ZjbXF2?=
 =?utf-8?B?MnNrTEVsZVVVUUQ2WjAzdFFuWlVYMjd0bmIrOGxISVk4NFhzaEQyS1NyMFBC?=
 =?utf-8?B?TnlBVURkcWhlNXVVaWkrTnVNYzltcDR0aCtnNHFEM3ZuR3FKUGtOM1VPL0dN?=
 =?utf-8?B?SWZzQUdWR3VHb2xONHFOTHBsOU92QVRVMUFMeHZBeFpWNmc3aDZTMVBxV0J1?=
 =?utf-8?B?Ykd2ZkpxUjlrbFFvaSsxR0pXclRkTEhFdDRGb0NObHUyV0hiT1RKbmQ0NVNo?=
 =?utf-8?B?b2g4QVVKSm9QbjRKbC9ZdzVpMCs5d05uQ2pia2pOWklmUElzQnhXTjVUREFs?=
 =?utf-8?B?UW9waitIZFI3YUxXa1E1SExJK2JTVXU4NVA1UzRGNFRMaDZCeU9FV2xlSFZv?=
 =?utf-8?B?WDhNRGFmWXZpREV1R3Rxc09yZGVxZm0yeDJRU3ozU1U2T014WTZSUithb1hS?=
 =?utf-8?B?NGl3eFVEYXNMNjNJeUNEaVp2d1MxeW9IRXlyMy9YenF2NFRBUGFhdS8yME45?=
 =?utf-8?B?eXpnd3E0MWZjMnQ3MUZOTExCNzRqMkFIVmpEUGx2VWlPU3g3VmJ1ejZHOGFC?=
 =?utf-8?B?TmRqOUNBQWRmOEY4bE9USGtIbGJ4d2FsbkJqNUlkZk1xSFpieUUzREp4Y1hR?=
 =?utf-8?B?aVhDcjN4eVY0VzNDYjkydUxBVFlHS281Nm9mVnVNK0NldkVZdVVBUXZuWlhB?=
 =?utf-8?B?QkRITXlERDRpekhnWUpvNzJUZFd0YnlmZm1PUThxQ1Vub3hhdGFPTFovMnF3?=
 =?utf-8?B?R2V6VUxXQjBpb1hPY1R2YW1NMjMzVTdSdWN4YWNZQW5uWjVuYmJYaytwNUxQ?=
 =?utf-8?B?Qmc4NERrYy9XTmh0dDVVY3M4dzZVTWtVYzZXNnRQSlhIc1gvN2x4Y21qNk4v?=
 =?utf-8?B?Z3RPMjFwWXRISEdESUk1TUl6MXRacXJ3Ny9hM0x0cDVQUW85N1V2em8zTUYw?=
 =?utf-8?B?OUkvMnNKUHliejluem1aSVJyeHVxVDlIYVBkR2Y2akNkVXh4bFlQU2NQVUd2?=
 =?utf-8?B?T3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 25034e79-4f19-4ebe-7901-08ddb5bf83b7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2025 21:13:51.1609 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f5fhmyd8xEqyJ8FT9nVFLZ+OSVLH31Yd4RVDSoQys9QnW31/cyE7gOAOvFtTycRwt/mo1pZLSzLVMhkOSmAB6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5923
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

On Fri, Jun 27, 2025 at 08:41:43PM +0200, Michal Wajdeczko wrote:
> If we fail to allocate a workqueue we will leak kzalloc'ed group
> object since it was designed to be kfree'ed in the drmm cleanup
> action, but we didn't have a chance to register this action yet.
> 
> To avoid this leak allocate a group object using drmm_kzalloc()
> and start using predefined drmm action to release the workqueue.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_hw_engine_group.c | 19 +++++--------------
>  1 file changed, 5 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_group.c b/drivers/gpu/drm/xe/xe_hw_engine_group.c
> index 2d68c5b5262a..87a6dcb1b4b5 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine_group.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine_group.c
> @@ -12,15 +12,6 @@
>  #include "xe_hw_engine_group.h"
>  #include "xe_vm.h"
>  
> -static void
> -hw_engine_group_free(struct drm_device *drm, void *arg)
> -{
> -	struct xe_hw_engine_group *group = arg;
> -
> -	destroy_workqueue(group->resume_wq);
> -	kfree(group);
> -}
> -
>  static void
>  hw_engine_group_resume_lr_jobs_func(struct work_struct *w)
>  {
> @@ -53,7 +44,7 @@ hw_engine_group_alloc(struct xe_device *xe)
>  	struct xe_hw_engine_group *group;
>  	int err;
>  
> -	group = kzalloc(sizeof(*group), GFP_KERNEL);
> +	group = drmm_kzalloc(&xe->drm, sizeof(*group), GFP_KERNEL);
>  	if (!group)
>  		return ERR_PTR(-ENOMEM);
>  
> @@ -61,14 +52,14 @@ hw_engine_group_alloc(struct xe_device *xe)
>  	if (!group->resume_wq)
>  		return ERR_PTR(-ENOMEM);
>  
> +	err = drmm_add_action_or_reset(&xe->drm, __drmm_workqueue_release, group->resume_wq);

I was hoping something like this would get added. I suggested a similar
idea to the Xe maintainers a while back, but they didn’t like it. It
seems someone else has now added this at the DRM level. We can probably
update Xe in several places to use drmm_alloc_ordered_workqueue, but in
this case, resume_wq is not an ordered workqueue—although maybe it
should be.

Anyway, all of the above is follow-up work. This patch itself looks good
to me.

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> +	if (err)
> +		return ERR_PTR(err);
> +
>  	init_rwsem(&group->mode_sem);
>  	INIT_WORK(&group->resume_work, hw_engine_group_resume_lr_jobs_func);
>  	INIT_LIST_HEAD(&group->exec_queue_list);
>  
> -	err = drmm_add_action_or_reset(&xe->drm, hw_engine_group_free, group);
> -	if (err)
> -		return ERR_PTR(err);
> -
>  	return group;
>  }
>  
> -- 
> 2.47.1
> 

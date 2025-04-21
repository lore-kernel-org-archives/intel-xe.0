Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91485C369AB
	for <intel-xe@archiver.kernel.org>; Mon, 21 Apr 2025 13:48:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DC6510E39B;
	Mon, 21 Apr 2025 13:48:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gJzHOtTH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1F6610E39B
 for <intel-xe@lists.freedesktop.org>; Mon, 21 Apr 2025 13:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745243310; x=1776779310;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=656qvwk5JFCvuzOioIQAOC9v+9zoqd2oAvbH4LLy0bc=;
 b=gJzHOtTH2gqE0yXyNbuFC9A1o69HaSd5KkyQH3NTc5bRadSe2s1UVKMy
 v3ZGEiqiD0y+kErg6Ox5MdCUjozesoztKrCLE8QKJCGS79FPzUgeh/OGZ
 mATw6dFmykPyMZytsEPC7uR5LfFLlLkXtCZqaPCapyfb3lZdPshYrDmfW
 C+s1ATZj+OXOP2RDAXpfXQFGyteauPdsbZI1JVqWmmZ9pCZpWo4/9xgpq
 z5O2ZE31YYQnIPZh75L/uNw2mQhyI5AToQ3Vtgoj0JFe5HlZWXbYiA9w6
 HsIPaiHG7g7j7tP+lp1pdfCy5QRKzi3ECYzt3Qqc4zEAsou4O0G6KYfy8 A==;
X-CSE-ConnectionGUID: Jzr4cHHGQYKvsu55VAHI2A==
X-CSE-MsgGUID: kBic9eE2R1Kbx/euI9kP1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11410"; a="46483131"
X-IronPort-AV: E=Sophos;i="6.15,228,1739865600"; d="scan'208";a="46483131"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2025 06:48:30 -0700
X-CSE-ConnectionGUID: PjKeTF2TTfmfc8ao7slG9g==
X-CSE-MsgGUID: QPHG3OB/QG+LP2Kh0V1TwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,228,1739865600"; d="scan'208";a="136582948"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2025 06:48:30 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 21 Apr 2025 06:48:29 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 21 Apr 2025 06:48:29 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 21 Apr 2025 06:48:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CFjN/k2l2pzXVm9c+nZHz/3TXNPEo+TtMyOioo4wusXSgW6oOwFLEltY/ce1p8N4LM5N4cyQoNRVmz4+5yKK/VY8bS0U5r0Myeho4o4+YSE4gjjzmGoWIIZPj1mW/ST29sKwJZCzFS5hECnfxARjnKdn2gieHqdUQfAIXBBrM2/eePXwIrv6bgznQBaHppFW0VZr53TojNf301IJOG/nCk1wU5SgVYA+QLYxQ4xSCiNDndTWmSm0lqe616ceBBUloabC1mE5XiX/6DRsbRdP2FggVkeeeRxE/YUTOcEIFK37BVtONaYb/pgs4LkZFnAspzmL/k8dTTLN+6Wl1vhMaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=656qvwk5JFCvuzOioIQAOC9v+9zoqd2oAvbH4LLy0bc=;
 b=xc4S3RTyjobcV3pHT5ukUN19szXSkdd6ZDpw+b3ltTlj69I6C8db3EcqT0E8ZhtKx1Ky2iZ7/a2ARFYtg6ob1jFlXd3QVy5G04uaNCtyqehckjhAEiMkPz2UzvkH09px+byUaAcAn/10/PH2AcTizaFBIbG9O85oWDSMzBbTJqeSddiwmSrlJyfzNpEC+4SK032SP5E7ZSiVHzDtcdRHrLHXFikKM7pPfv+GZkqMznpuFj4ythOzPBtEoAJ44ug8xHCzCKfo+9KHkPJxKZgcNMnYFrji1DuAlI9Xh2clqp9prxiFI03kJ74UvHRjIr9dRYNFvCUWkwzmYt6i/2kfcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by SA3PR11MB7625.namprd11.prod.outlook.com (2603:10b6:806:305::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.32; Mon, 21 Apr
 2025 13:48:26 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::df5a:a32c:8904:15f1]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::df5a:a32c:8904:15f1%7]) with mapi id 15.20.8655.033; Mon, 21 Apr 2025
 13:48:26 +0000
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Poosa, Karthik" <karthik.poosa@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Nilawar, Badal" <badal.nilawar@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>
Subject: RE: [PATCH v1] drm/xe/pm: Wait for lmem ready in resume
Thread-Topic: [PATCH v1] drm/xe/pm: Wait for lmem ready in resume
Thread-Index: AQHbqgfkpGpzN3e0PkCbd23AzW0l7rOcvq2wgBFO13WAACYewA==
Date: Mon, 21 Apr 2025 13:48:26 +0000
Message-ID: <CY5PR11MB62111EE42148A716EDB8F71695B82@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20250410110057.2497056-1-karthik.poosa@intel.com>
 <CY5PR11MB62113A236791FC539318DC9695B72@CY5PR11MB6211.namprd11.prod.outlook.com>
 <978a73ec-075d-4e09-816f-8b682a601317@intel.com>
 <5e8d58bc-003b-41dc-940c-3d01ca4b82e5@intel.com>
In-Reply-To: <5e8d58bc-003b-41dc-940c-3d01ca4b82e5@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6211:EE_|SA3PR11MB7625:EE_
x-ms-office365-filtering-correlation-id: cfedec83-3c05-41d0-3257-08dd80db3101
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?Z3hoSnlFTGw0MUFwUjQ0cy9HTEVRRjdOZjhTK1g4YmJZZ0t5ZjRIci9WSFMr?=
 =?utf-8?B?SXMzUnRJd1RoSlF5bzBMU2Q4c0RNMHV2UzhnMzhqUWt3TSsyWTJGWmFvdTUw?=
 =?utf-8?B?TnF1bDhlR1lKeVNFT1FMTTNBOUdEbXN3cTNuUGlWckJiQ0wrUmlhNHJlMEMz?=
 =?utf-8?B?cHhsb2l2RE00QkIyRi9tcExTNmNFYjQ1eEdSUkY5T0Z6RUtGRWZnYTV6L2FD?=
 =?utf-8?B?RTRhcUF2Q2xYVEFlNGt6MmNqdGF4T3ZCMlp3aXJXTk5kazVQNHI4RUx6Sm9u?=
 =?utf-8?B?U01EanoyVzQwY0R4UnREMG9jeHlheWE0TFV5SnlLL2xNR2Q5UldyaHZVc0xD?=
 =?utf-8?B?SjdCbnVDd3drRWc2bC95bG1YbDZwVEZ5aERlZ2xBZ1ljOGVzUFpIenR0MGU5?=
 =?utf-8?B?YTNvcGZwZXU2Mk9BTU1JeFVoSnVNMzlFc2dKWVFmKzB6R2dqcHdEak95Mll5?=
 =?utf-8?B?eFR5Q2VOd1ZIQ1lFZlhraGNSTUE4K0RJbkJlbEt6RGpnaStxNStXZEZIUEtR?=
 =?utf-8?B?NCtzbmk4S1loaURIbUZ3K0plR1dRVEtPMVpRTlVLVWQwczZnRWRBUzNKYS82?=
 =?utf-8?B?cFVmVnV5TDV2eWl5YUJuQ2NuQU1KTDFvaVlQb0FmWDNZd1hmK1l5aWNTWVh0?=
 =?utf-8?B?dUZoS2tOZTVDRC9NcVIzNFRPUWV0U1BYTXpUbHlrb3VYOXBVbVo3elUrWGpM?=
 =?utf-8?B?SCtBMUV1UzAxRk5Ua0VFb0ZHZU10dU40bE8wN2x4d29XVHFrTDI3TGVlMkhJ?=
 =?utf-8?B?Smp4dEtBWmdQNVlLMThWNi84UWRNOXIrNXVUdWw0YSt4TU9GU1ZnYjJXc05G?=
 =?utf-8?B?SHFWaW01Unk0cHlqNzZWT2wwTU94NHFuWm1WcUwrQ1dGZnJvWWlWdnFlTkI0?=
 =?utf-8?B?L0pOeGpQSmFLTmZxRGhnTzRaeUxmK3pkUXdtc3BpY0xyTk5ZdkRrRktYTHRx?=
 =?utf-8?B?SWo1Q0t5c0RtZ0tsRTFETFBaUnZZbXRnVHlMT1NhUGxpWllpVFRIZ3ZuOUEx?=
 =?utf-8?B?Y1VEWnZTQ29jNURhMEthMmFiRlNFeUs3RUExbUZqd0lDOGNyTGl6bW1Tajht?=
 =?utf-8?B?ZExGdk9TQUZweEh4c04xYWo2ZUxSZW56dUduenE1TFEybGN5OXNHcjdQemF4?=
 =?utf-8?B?eDFUZU1KRWxnK2FCcnhIVERteVVMYUJZQUVJTUIvMjJYTGVXU0FlU0IvU0xl?=
 =?utf-8?B?UkdLMXRWZzJwQUV4eDM1Nm5TK040ZWVFczR5RVRPRlNBaWNBSUxIMnRoOS9y?=
 =?utf-8?B?QWhJSDBVM0haVjlSUDFod09OTzZwK0xQYzE5Sm1YbTMzN2s3ck9NRXg5d2ZX?=
 =?utf-8?B?ZDRNMXFtSUdsZVRoVXVwZlZ5elF1OWM1SHFRWkRQMDJJSm1qVFhVMlJidXEy?=
 =?utf-8?B?bjRDWDd1NEgwbG05WE1MSVZPL2FEYU1neW00ZkVMZ0xVMmI5TGxDMlZaTGNX?=
 =?utf-8?B?WTBQaU11b0dqMGkweElGaGpoNkdBSHl1OWJsKzN1QzBLeVRWZHBkRjAyeGN5?=
 =?utf-8?B?VXg4SHVaeWQxR2VpMk9ucC9waThoVWlxaFdVN0dFSVRXbkJ6ZlRaTEFXdGpv?=
 =?utf-8?B?Z0hNUXpvSGEvb0R2UU5MaVNOSDgvYUExcHN1NkVzZGxJdG5iRzhCV0VnNW9J?=
 =?utf-8?B?TERydUNkZldFR2RWQXd5dG9nNlU2cWVwSFVsVWVXV2d4dUt0b2pCNmRQVDVa?=
 =?utf-8?B?ekoybzJRZ3hPaEJpSkdlZzFOMlJWMFk1U0VJR3ZRTFYzZ2pzb1g0VG1XRmoy?=
 =?utf-8?B?VnFZNjAwR1dxNjZ2SkZuWlN3V2Q1SzZhUFVUbEFjK1VlVzdHSE9LSjE0dSs1?=
 =?utf-8?B?OXdobTBRcVJLRERuUGFkTkxsTTFtdnNTNXBWVFRneUovUUxMTmNORkJvdytq?=
 =?utf-8?B?WXZYMmpqMDZoTXNpQXJQYjBBM2pHL092RDMrYXZQRFFTbFpFZTM1OHZUQldy?=
 =?utf-8?B?a0FlTm5zMFlQV0E3a3N2ZmdoVUxxdWFPQ2NCZERYWTJOUVBKenZxM1pBNDNo?=
 =?utf-8?Q?IX0TMdRPteXbVdUh+u64JV2tJF7HJw=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6211.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TEtRd2lUWFFNbUlKbTNZQlBRaVRXbCtjcXh1TGRhNzFqQzdXUGI5MWdMVFlX?=
 =?utf-8?B?V1FTdnRTYlBaUHkwRFl5czdwWEdKYVA3bzJZYTBVMTRrczRqdXNmS0syL2xT?=
 =?utf-8?B?ODBuVFdSYUZZRWwvb2dIdHZGMFNubGJCcndPWTdIS29oREg2dW0yRmxiQ050?=
 =?utf-8?B?UDdtSzNJUzgrM3FBNXpjRTViUHlscmhYWjNHVE5zaGttRU9VTVQrZnJNVms0?=
 =?utf-8?B?OStnS2tJYmc5UEFuYWk4dm43TFA3UmQyb2pXV2xpRXpUeUxPQTg1RnZXbUt3?=
 =?utf-8?B?RVI1dTN3U0pmSGVLek04bmVKa0lVM2JYbzl1ZU1TNVNSSDNLUEh2OWR2SWpl?=
 =?utf-8?B?MklocHdRT29EdWlqemFGUkY3K0o4bmg1Mkt0K3VWVWJLRWVRMktmc20xSFVH?=
 =?utf-8?B?U20ybkxHc3l6NmhKN0RZKzlGYzRuTEptZ3NIdEJibjBhRHp0SnBpc3FPd2d2?=
 =?utf-8?B?T01ZVG1VVWhsd05KbXhuanRaTWcvSlowdytiK0FzdUw1Y1hMaGJlMnk1eGh2?=
 =?utf-8?B?WmlnQUJlRVI5c1hUaTI0ZDAyTkhlekFEbnpYYXNYK28zMVpuNXlkSFZvb3Ux?=
 =?utf-8?B?aVNSUTRsMmVocitGTnBxalh3WWhVWTR5N2xEcjdUb25taGk2WmwwY3dvUktP?=
 =?utf-8?B?MXpSeVAzU2JiWlM1b1VrY0V4bkJGd3dINEl5ODVkTDNFREhpSDBSZUJ6Nk5N?=
 =?utf-8?B?NnJVT3ltcVpSTTFZbGlkUWtoQ2RxM2ZDSnIwQ2VMdnQ5dE1YSSsxODBqRFov?=
 =?utf-8?B?clJZeHAzSkVZTHZyYnoxK09zbFRKUDdETlpWVTViK0k4aDZwejhQc2szdGtC?=
 =?utf-8?B?YmMyZjZ4N2JaTUkvNTZtUFJqNHY2SnpEaHk5TWYwMmdKa0psTHlydUg3d0xs?=
 =?utf-8?B?TFBOWTFqeC9uR0ZTcDhFSkRDeEc5a2gwbm5TNFJQZUdUc3FLbE9vVGVnNzRY?=
 =?utf-8?B?bXNYcnJFN05laVU0WjJwRXA5L3EvQTVEbWlzbnVNNHVTeTZWanNaQW5DblVl?=
 =?utf-8?B?YkI3QjNXRDYwUHcyUGtLVm9xSW9RajdReUlMMGJtL1hDRVl2dFdqS2xrcFQ2?=
 =?utf-8?B?VXlGaFlmdlF3ajk0OTdXYVJ1R1RzVmlrd0MyTGp4bGY5NmorYUFXaXg0Q3hl?=
 =?utf-8?B?RXcvcWNXRHdnQXNhWkFESXJ2Wm5oQXBKY1ZINXRNdGxxSFp6dXhJeXZBZ0lp?=
 =?utf-8?B?UjFtcExFZE1LZVgxUzgyM1ZNY0hLemNIb2FsZVNkcEhVMis0dlhHM0hFenMy?=
 =?utf-8?B?SC84V2U2OWpEY0JvOHlXU0pHVk56c0FDODlMdGovSUR3d1Nad2lyZUdGRldl?=
 =?utf-8?B?U1BaM2owQzIxc2tZZTMyeWJEZTFHazdVMHFQNFZwVFR2RTJlTGhpWjkwNGRi?=
 =?utf-8?B?SkM3aGMrOHdPOGVjbUNHNkxPOVhHN3c2c0NUQ3JvN3RCdUQvY3ErRHFDNjIr?=
 =?utf-8?B?eVNFMFlJYUVJQjM2Vjhpem5KWkNWTGdPbTVNUk9KWlhMSzl5bW1LQ282RnVy?=
 =?utf-8?B?Qmdtc1Q0WXBVUzgxMTFRaktYcDZjT0cyTEVKME5IcW4rS2IzWnFsTU9aSDlN?=
 =?utf-8?B?NzFMV3ZqS1U5YWhKRW8wTjhKRkFPZ1NlVlFKNFlQSVg2VlBjczBwcnpoL3pC?=
 =?utf-8?B?dm9PZmYwS3Y2OUg4L0J2RHZObklTMyt3NDRySm5EcUEyeXZZdHpsK1dBOEhJ?=
 =?utf-8?B?Q2dPQVhKKzFSeFB5VXlNMFhSWkNRdGdrK0ZxbzZmTUxIM2tBMjZJWkZmalk0?=
 =?utf-8?B?NUQ5L3FZK3pUTEpkTzlIVjM0VGRpWDdrV0w4S2IwWFAxMFdMV0NMdUtTY0lt?=
 =?utf-8?B?d2hleitFZHNwWFRmbFdaSFdkYVpNQ2R4MDN5NFRoQ0dUdFNDTmRNQXlzNnQ2?=
 =?utf-8?B?NEVxSjkzT0RiRkk4V0RDQVpGNmRldm5wQWh6UTdjOENzT2lrdUQ1QjZ4bGVB?=
 =?utf-8?B?UDZNVUliN2lqNWY5djZpM2hWenNqeXJ1S3dOc0d0M3hxN0pSZjNyZDY2cjZV?=
 =?utf-8?B?MGszeEs1eVY4bzNpRWpHdWVFR2JIQWZJUm80ZFNBblNvN1VYK3UxVzdNODBn?=
 =?utf-8?B?MmZ4RVkrMFE1blVHTWdyZnZPTEpZaG00Ny9pWUlPeXpCUW1UTmwvMFhRUE1s?=
 =?utf-8?Q?Vdsgk/DWAK1g6r+KTsL8336Qp?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfedec83-3c05-41d0-3257-08dd80db3101
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2025 13:48:26.4603 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DfkOe3h1uUmr8KXXIWJT4MrREd4M1oKp1TaxAQoqBAlmX0veDOfxBtwBIsnD2CFMfvN9xgtv80T0dyT1w8tn9F4yilMf1IcPMFw9ifMGboM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7625
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUG9vc2EsIEthcnRoaWsg
PGthcnRoaWsucG9vc2FAaW50ZWwuY29tPg0KPiBTZW50OiBNb25kYXksIEFwcmlsIDIxLCAyMDI1
IDU6MDAgUE0NCj4gVG86IEd1cHRhLCBBbnNodW1hbiA8YW5zaHVtYW4uZ3VwdGFAaW50ZWwuY29t
PjsgaW50ZWwtDQo+IHhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogTmlsYXdhciwgQmFk
YWwgPGJhZGFsLm5pbGF3YXJAaW50ZWwuY29tPjsgVml2aSwgUm9kcmlnbw0KPiA8cm9kcmlnby52
aXZpQGludGVsLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MV0gZHJtL3hlL3BtOiBXYWl0
IGZvciBsbWVtIHJlYWR5IGluIHJlc3VtZQ0KPiANCj4gDQo+IE9uIDE1LTA0LTIwMjUgMTE6MDEs
IFBvb3NhLCBLYXJ0aGlrIHdyb3RlOg0KPiA+DQo+ID4NCj4gPiBPbiAxMC0wNC0yMDI1IDE3OjM2
LCBHdXB0YSwgQW5zaHVtYW4gd3JvdGU6DQo+ID4+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0t
LQ0KPiA+Pj4gRnJvbTogUG9vc2EsIEthcnRoaWs8a2FydGhpay5wb29zYUBpbnRlbC5jb20+DQo+
ID4+PiBTZW50OiBUaHVyc2RheSwgQXByaWwgMTAsIDIwMjUgNDozMSBQTQ0KPiA+Pj4gVG86aW50
ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+ID4+PiBDYzogR3VwdGEsIEFuc2h1bWFuPGFu
c2h1bWFuLmd1cHRhQGludGVsLmNvbT47IE5pbGF3YXIsIEJhZGFsDQo+ID4+PiA8YmFkYWwubmls
YXdhckBpbnRlbC5jb20+OyBWaXZpLCBSb2RyaWdvPHJvZHJpZ28udml2aUBpbnRlbC5jb20+Ow0K
PiA+Pj4gUG9vc2EsIEthcnRoaWs8a2FydGhpay5wb29zYUBpbnRlbC5jb20+DQo+ID4+PiBTdWJq
ZWN0OiBbUEFUQ0ggdjFdIGRybS94ZS9wbTogV2FpdCBmb3IgbG1lbSByZWFkeSBpbiByZXN1bWUN
Cj4gPj4+DQo+ID4+PiBBZGQgd2FpdCBmb3IgTE1FTSByZWFkeSBkdXJpbmcgc3lzdGVtIGFuZCBy
dW50aW1lIHJlc3VtZS4NCj4gPj4+IFRoaXMgd2FpdCBpcyB0aGVyZSBpbiBwcm9iZSBhbmQgaXMg
bWlzc2luZyBkdXJpbmcgcmVzdW1lLg0KPiA+Pj4NCj4gPj4+IFNpZ25lZC1vZmYtYnk6IEthcnRo
aWsgUG9vc2E8a2FydGhpay5wb29zYUBpbnRlbC5jb20+DQo+ID4+PiAtLS0NCj4gPj4+ICAgZHJp
dmVycy9ncHUvZHJtL3hlL3hlX2RldmljZS5jIHwgMiArLQ0KPiA+Pj4gICBkcml2ZXJzL2dwdS9k
cm0veGUveGVfZGV2aWNlLmggfCAxICsNCj4gPj4+ICAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3Bt
LmMgICAgIHwgOCArKysrKysrKw0KPiA+Pj4gICAzIGZpbGVzIGNoYW5nZWQsIDEwIGluc2VydGlv
bnMoKyksIDEgZGVsZXRpb24oLSkNCj4gPj4+DQo+ID4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL3hlL3hlX2RldmljZS5jDQo+ID4+PiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZp
Y2UuYyBpbmRleCA3NWU3NTNlMGE2ODIuLjRjMGQ5ZWI1MWQxZg0KPiA+Pj4gMTAwNjQ0DQo+ID4+
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlLmMNCj4gPj4+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS94ZS94ZV9kZXZpY2UuYw0KPiA+Pj4gQEAgLTYzMCw3ICs2MzAsNyBAQCBzdGF0
aWMgYm9vbCB2ZXJpZnlfbG1lbV9yZWFkeShzdHJ1Y3QgeGVfZGV2aWNlDQo+ICp4ZSkNCj4gPj4+
ICAgCXJldHVybiAhIXZhbDsNCj4gPj4+ICAgfQ0KPiA+Pj4NCj4gPj4+IC1zdGF0aWMgaW50IHdh
aXRfZm9yX2xtZW1fcmVhZHkoc3RydWN0IHhlX2RldmljZSAqeGUpDQo+ID4+PiAraW50IHdhaXRf
Zm9yX2xtZW1fcmVhZHkoc3RydWN0IHhlX2RldmljZSAqeGUpDQo+ID4+PiAgIHsNCj4gPj4+ICAg
CXVuc2lnbmVkIGxvbmcgdGltZW91dCwgc3RhcnQ7DQo+ID4+Pg0KPiA+Pj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2UuaA0KPiA+Pj4gYi9kcml2ZXJzL2dwdS9kcm0v
eGUveGVfZGV2aWNlLmggaW5kZXggMGJjM2JjOGU2ODAzLi42MGJjOTJmOWFiMjINCj4gPj4+IDEw
MDY0NA0KPiA+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZS5oDQo+ID4+PiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlLmgNCj4gPj4+IEBAIC00Nyw2ICs0Nyw3
IEBAIGludCB4ZV9kZXZpY2VfcHJvYmVfZWFybHkoc3RydWN0IHhlX2RldmljZSAqeGUpOw0KPiA+
Pj4gaW50IHhlX2RldmljZV9wcm9iZShzdHJ1Y3QgeGVfZGV2aWNlICp4ZSk7ICB2b2lkDQo+ID4+
PiB4ZV9kZXZpY2VfcmVtb3ZlKHN0cnVjdCB4ZV9kZXZpY2UgKnhlKTsgIHZvaWQNCj4gPj4+IHhl
X2RldmljZV9zaHV0ZG93bihzdHJ1Y3QgeGVfZGV2aWNlICp4ZSk7DQo+ID4+PiAraW50IHdhaXRf
Zm9yX2xtZW1fcmVhZHkoc3RydWN0IHhlX2RldmljZSAqeGUpOw0KPiA+Pj4NCj4gPj4+ICAgdm9p
ZCB4ZV9kZXZpY2Vfd21iKHN0cnVjdCB4ZV9kZXZpY2UgKnhlKTsNCj4gPj4+DQo+ID4+PiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3BtLmMgYi9kcml2ZXJzL2dwdS9kcm0veGUv
eGVfcG0uYw0KPiA+Pj4gaW5kZXgNCj4gPj4+IDRlMTEyZmJhY2FkYS4uMmU1OTY3MDY2MGMxIDEw
MDY0NA0KPiA+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3BtLmMNCj4gPj4+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9wbS5jDQo+ID4+PiBAQCAtMTgyLDYgKzE4MiwxMCBAQCBp
bnQgeGVfcG1fcmVzdW1lKHN0cnVjdCB4ZV9kZXZpY2UgKnhlKQ0KPiA+Pj4gICAJaWYgKGVycikN
Cj4gPj4+ICAgCQlyZXR1cm4gZXJyOw0KPiA+Pj4NCj4gPj4+ICsJZXJyID0gd2FpdF9mb3JfbG1l
bV9yZWFkeSh4ZSk7DQo+ID4+IEluIFhlIHdlIGFyZSByZWZlcnJpbmcgdGhpcyBhcyBhIHZyYW0u
DQo+ID4+IERvICB3ZSBoYXZlIGFueSBzcGVjLCB0aGF0IGRvY3VtZW50IHRoaXMgPw0KPiBJIGNh
biBjaGFuZ2UgdGhlIEFQSSB0byB3YWl0X2Zvcl92cmFtX3JlYWR5Lg0KPiBBbHRob3VnaCBJIGRp
ZG4ndCBmaW5kIGFueSBzcGVjaWZpYyBtZW50aW9uIG9mIHRoaXMgaW4gYW55IHNwZWMsIGl0J3Mg
cHJ1ZGVudCB0bw0KPiBpbmNsdWRlIHRoaXMgd2FpdCBoZXJlLCBhcyB0aGlzIGlzIGRvbmUgaW4g
cHJvYmUuDQpBZGQgZmlsZSBuYW1lIHhlXyogIGFzIHdlbGwgcHJlZml4IHRvIGZ1bmN0aW9uIGlm
IGl0IGlzIG5vdCBzdGF0aWMuDQpUaGFua3MsDQpBbnNodW1hbiBHdXB0YS4NCj4gPj4+ICsJaWYg
KGVycikNCj4gPj4+ICsJCWdvdG8gZXJyOw0KPiA+Pj4gKw0KPiA+Pj4gICAJeGVfZGlzcGxheV9w
bV9yZXN1bWVfZWFybHkoeGUpOw0KPiA+Pj4NCj4gPj4+ICAgCS8qDQo+ID4+PiBAQCAtNDc4LDYg
KzQ4MiwxMCBAQCBpbnQgeGVfcG1fcnVudGltZV9yZXN1bWUoc3RydWN0IHhlX2RldmljZQ0KPiAq
eGUpDQo+ID4+PiAgIAkJaWYgKGVycikNCj4gPj4+ICAgCQkJZ290byBvdXQ7DQo+ID4+Pg0KPiA+
Pj4gKwkJZXJyID0gd2FpdF9mb3JfbG1lbV9yZWFkeSh4ZSk7DQo+ID4+PiArCQlpZiAoZXJyKQ0K
PiA+Pj4gKwkJCWdvdG8gb3V0Ow0KPiA+Pj4gKw0KPiA+Pj4gICAJCXhlX2Rpc3BsYXlfcG1fcmVz
dW1lX2Vhcmx5KHhlKTsNCj4gPj4+DQo+ID4+PiAgIAkJLyoNCj4gPj4+IC0tDQo+ID4+PiAyLjI1
LjENCg==

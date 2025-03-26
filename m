Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D144FC36010
	for <intel-xe@archiver.kernel.org>; Wed, 26 Mar 2025 09:48:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9731910E68B;
	Wed, 26 Mar 2025 09:48:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O4BWFiwO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABCCC10E68B
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Mar 2025 09:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742982511; x=1774518511;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ZJBOzpup6xT/ASQck026+sZ5fu7AAU0qkh1Sgf5jjQk=;
 b=O4BWFiwOQVcYBAIU+oJPvVEvFUbsZGKHvAla8QpdhjSZVYLlHuacym7x
 SuIf7Ula4T/NO4hysIy5hZcqjqYxRj6WrSO8HsK+UY5Wl0GAmHmLx/sbm
 78W6R6pIxIdoylJGY5LW4QVHrv7VzkY9ztmAJCHOyk5PM64+91ULDyFyK
 hUDJ26MUk3ge3DWSY52zi/y0jHv3FoAULusRvgqq1TJS08ZXl4dL/piXs
 7lFGP4x4FkOSAFQ6EhZj3DkmDa0VY0RQoWBSmVPs8tA6NDh6dHHNCqnrk
 RFiQ+La3kANEQwRJATLKyPIoe5XdSMH6QwTvIsaSq3s+l/e9MB0W5yp+A Q==;
X-CSE-ConnectionGUID: I5EtdiTFRCCkZshV5QifUA==
X-CSE-MsgGUID: UsTs7MhDSZKvmF4f9yZ93w==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="61651772"
X-IronPort-AV: E=Sophos;i="6.14,277,1736841600"; d="scan'208";a="61651772"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2025 02:48:31 -0700
X-CSE-ConnectionGUID: emq0S97zS/eRhIGfK5DR4A==
X-CSE-MsgGUID: Wz1iKHZ1TgKEWwre6mlVoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,277,1736841600"; d="scan'208";a="125170861"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2025 02:48:30 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Wed, 26 Mar 2025 02:48:29 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 26 Mar 2025 02:48:29 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 26 Mar 2025 02:48:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LtzfqZ65+BinS7kNjKJrQVd9U7Th16iHXhoxS4001D4fryli2Shz/EVkfQFFQOGV+mgIRKokhJsBrLMTurkdFk0yFCwLO5VbWdbh6n8twFm5DhGB2WDi0Ksc9HTF3SZ4aSC4ajOkrR6LQlnRDoBoSB/JyQFd46UZTlNs2DFSPml3JbaIxox9kpP+loqaUU0v6UWnR1hGt3Q/Io/XxlUPsq1q+LRXOKW6fhO3rhM+Mzkw7GAfP6HYvWT2grxcEQVNL/nljPyG+bru/H5qv5kfB7196oJT4xmqI7PuUBby+nn2UX8wcL2ldc4wXbj10mgzAiKRniXdepgWeOQqok6bgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=68C6T7AcOL8VcBvp9SaLD5HyVbiPfUePlwBpelYK2LE=;
 b=RkK0mfeO5o6Y9WMxzyffBbIDAk5gxRV9GQ+uW/hjJ63lSgp91wKRV14oeyE417OvHb9Bdj3J7RCEvxqq/5yYC1bFh/F2h0mqlsrATqwTV+rP38PnFBd/afdxuHjnEzkSxhRoPEV1W1nJxLBXqLws9zhtX+pdoFMKYK7a+qTD4Qw26IgV1t6vJsVON1H69uq5HC7/zgcFxZIo5jQAPsjkDMHrCnJRkCedc3by52YmqYhDsqQ5RoadVugd8rb0F+xZW5aqZw1D6U0dti7Edfsd5W0rW6gcgjnGHMoXeKfYqSJhXcXkInRx2j4VsmUbFqkeR8cq+0PtnNgxQUKPrPmidw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by PH0PR11MB7469.namprd11.prod.outlook.com (2603:10b6:510:286::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.43; Wed, 26 Mar
 2025 09:48:25 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%4]) with mapi id 15.20.8534.043; Wed, 26 Mar 2025
 09:48:25 +0000
Message-ID: <9cbd694d-8c60-4af6-abc2-522b6931d20b@intel.com>
Date: Wed, 26 Mar 2025 15:18:19 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/5] drm/xe: Make the PT code handle placement per PTE
 rather than per vma / range
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>, Matthew Auld
 <matthew.auld@intel.com>
References: <20250326080551.40201-1-thomas.hellstrom@linux.intel.com>
 <20250326080551.40201-6-thomas.hellstrom@linux.intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20250326080551.40201-6-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0P287CA0013.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::13) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|PH0PR11MB7469:EE_
X-MS-Office365-Filtering-Correlation-Id: 74e7a36e-e65b-42f8-b649-08dd6c4b5a61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V0MvWkF5Z0FnSDVaOFRVeEJDZmRXNG1xazh0Y3FJVjA1bjBTZ2sxd09HR3Jw?=
 =?utf-8?B?a0FrN1cydjhBMFFTbGdTeS9jT0JoT3BPaEJ3UFJ0YXpRVHVXSXVRTm1yZndB?=
 =?utf-8?B?Z1RrYS9zZ2NBejZnR1ZGbCtJQStUYXJLelhHRlV0cmdkUHVLNnVaWmp4SUF2?=
 =?utf-8?B?elBpVmZFUHBieDV0bHVWTW5od3J0OGFXRUcxeWlPSE9zT1dXYkhSSmI5c1dP?=
 =?utf-8?B?WFlzaVFCc20yaSt3dGxMS0l5Q0VGR3pDcW9BcFZVSWV1RkhJRnBJQlhaQ2hN?=
 =?utf-8?B?ZWtORjV1dnR6YUQwRXRObWcybkFEdkVMK2wwd2FCbXJ4WE8zalQzcExWWHM1?=
 =?utf-8?B?ajhObXdwUEkrOEg1Sk02YU5jWjdJT3RlZ1VPWGxkNXE0VzZTMzB4bm9HVkFI?=
 =?utf-8?B?OExwNDU4WCtqUzNCQ1JFOWJxQU00ZFhkT2g1eW05bk1yQmFDdU83aTRUTEpi?=
 =?utf-8?B?S055ZzVjQjRIOWJuR0tIN2NMUWJEZnVUemdIOXlzMzdGMk9CUE5yZlFQd08y?=
 =?utf-8?B?SXVRakxoRTdwa3E1eUU1MW16eUdkczZyL05FSEFHVy9HMHV2SW9CZWJPWVBS?=
 =?utf-8?B?RnA0OXAxWm1kOUxzeGtRdU4ySU1LaWYrK1gvZGxjK0Y3dUVzOVBBNVNiU2FT?=
 =?utf-8?B?YkJ4ZE1QeGF2d1NkRTZQKy9lVHJ6azZmenBKRFgrQ1JNVXh6RnB3UDBDTnc5?=
 =?utf-8?B?Z1hzejVoMVNpZy9LT2dUSFpBb1ZhVEFUY201Y1pPb3B0ZFJBWW90OUNldTZl?=
 =?utf-8?B?cHFOclVzYXpMVkMvWmVpQlJva2cySWtiYS9iMDRzUEpnTDNMSlA4SzlwMEJQ?=
 =?utf-8?B?b3EzR2l2TzIyMGlqSjlZWDBuNTFOamtrSE9pbmhERFFBZHJHTzUzSDc0V0NT?=
 =?utf-8?B?TjdVb29JbHFkdndsYTR4QkdXYkNiVVgzSnRPakQrVnh3Q09JaWxleVJRdDRl?=
 =?utf-8?B?Q2RIMXZwNTZESTBQLzdOdzZGc0J5T3lWSW51MTJTU0tpQno2WThZZ0tVUEZW?=
 =?utf-8?B?VnpMd2EvZ1ZUM1gxYlhPcjNIQTRheEk0SzhOT2R3NVUzTERCZktEMUpyK29s?=
 =?utf-8?B?Znp6QTE4VHNJTVVIL01PdVNLZ2tpUklnSmtHMTlTQ05aMUpTR3ZweE1xaG1L?=
 =?utf-8?B?dE1zeldtR0ZXeEdpeEt3Yk5wVmlrUzlPR3p6QnczQmp5bXJwOGVZZlB4S3dN?=
 =?utf-8?B?Zzl6TFNJMDNjUmd3TXZPZzh6OXlHZ0ZZVktKYitoY2xOS0JIQnRsanpHMjVW?=
 =?utf-8?B?UnNSSDhuRHowckRLeTZWWWNzQms2YTNmck1uZE1WNElxVjNSUkllZ1d1TzR2?=
 =?utf-8?B?SVVVR0hCajF6MTN5ejVlM1dOcXpEZ01VWFY2ck1VU3QxT25IVTZJTFY2aTEv?=
 =?utf-8?B?Uk04L0RGY2R4YXlNYTI0Y3VtSVpRRndJWW8xNkJCZVhSbStPbDcwaUR0TVpo?=
 =?utf-8?B?dTk2RHdQdGxiUUFxcHhuMllCS29Dbk9WVU9UNGgrZGpMdjNkaDh6THhlcTZm?=
 =?utf-8?B?YVFmekd1L3NnZHpPclF3V1lRb2dtUXYvZnl3M0JYN1dIeG12dU5kNy80cmxB?=
 =?utf-8?B?TGg4OVpQNmdsSno2a1Q3ZVVKM01NL3hQVDAwalhqSTFpdXNWamlVbWRtUWZl?=
 =?utf-8?B?SGhxUk9FZmdkK2JNalM3MjAxd3daNGJSejdTb2Z5NUFIYlhHd3hGVzdBWG5G?=
 =?utf-8?B?U1FKNlRKK3lzVUZzaHdMaXR5bXNOQUlLM2R4RDFIcFZJZSs3Q2Z6MS8yMUZR?=
 =?utf-8?B?YjYxRklJNll1eDVXMXovZ3FUT1pqd2tMcjFkbUxDU1Flb0t5Nno1K0xUSjdO?=
 =?utf-8?B?em5IaXAzNE92MXV2bGhGc2o5N1o4KzNIeDZEbjlSL0t1RmU0TU10Ykg3cU9D?=
 =?utf-8?Q?6qrfOs55AclY6?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bHkxa0hjYnc0ZWFhUEFkQnZHcGdLZDZEdG5VaVRUeDZzUnFjOHZ5MDE5WW0x?=
 =?utf-8?B?WVY0NFhxVzBTWFVGODVDZm9MM1FHakNJV2ZudFBlK3dHcFhYTWtPNGE5YUZa?=
 =?utf-8?B?MDJrUFlpZ3ZGa1EzQmVsamgyOHRjRVpYeWdQbTdPOW9NNi9NS2Fpdytjb0E0?=
 =?utf-8?B?SWxjSkMzZXZQYnZPN3g3MGtSVHg5L3NYNlN3R3krMHVrVXNBU2FDQ3VpSUtB?=
 =?utf-8?B?d3VmOWoycEtHUjhpaVVCL3czVWFUMm9jcVBVREdBZkxEbGV0WWNldW80L1N3?=
 =?utf-8?B?L1gwN1JnNnJYZDBJeEc2c2xlNXRGRGlJU3BqemwrdVJYNVNaQWs0SFZkbTE1?=
 =?utf-8?B?RnR0NUo1Um1WK1M5OHlWMDhQK1FiaHNjVk4rYnRtSFY4QjR5M3lPbHQ1K2FX?=
 =?utf-8?B?bVB4cVVUekRYSXJFUHViREtRRUkvclFEN3ZWQitZampvaWVUWWtGK05ubUVZ?=
 =?utf-8?B?bGZoWjY5L0Z4bTVSSHBjSEJMUDF3OXUzNUFzdzNoaVhaNmRkaTlrOXAzQlFm?=
 =?utf-8?B?T3pGdkthSloyTy9PRmZ5NlJPWGhmMlFveFRtOWw0dzlwR1hWODBPTGduVVJ3?=
 =?utf-8?B?VWRqWGhsM1J5dnU0eHB1SHZQNThibldvS3ZEeEdPZUZlRFBOb1JBanNWdU9Y?=
 =?utf-8?B?akd0aWRuMFdhNTJza3Z4dmlwYzg0SFR4WHlkdW1LdGZqMTFMTGdlQ08weGpO?=
 =?utf-8?B?Ujdkc0dKYkNFM2xrbWNDdktUYS85SGlHOXRjOHNUL2NBSlF0SHdnNkV1YjNV?=
 =?utf-8?B?ZGJZWVJyWHJGbVM4NklONHFoeGdrUThjMy9vRzByTy9QVC9hTWpXeXBoZ0JN?=
 =?utf-8?B?SWRXL3lVY1ZhNVdnblZtS0JyemlFVVVNWWV3MDl3aEJkZzNiNDlYaFRINWpj?=
 =?utf-8?B?bEZ2VDI0dVVQWnFHVU91VmxsS0NOdDhMdXhiamdNYWk4UTU3bzIzN0ZsMnBn?=
 =?utf-8?B?R1E2SjE3TzZVenlHRzZkZHkzKzhNUHFidk1XZmliV1NKZE1kQzl3UVZuaHhl?=
 =?utf-8?B?K2hPbnl3SUhtNGZLZ3A0S0NXKzJnTllGdG9uZVhNK3FtcDRPN3drWk9VT1Qr?=
 =?utf-8?B?TjdsY1hjU2hYZGtMd1lxMnZVQVppQ2hPVTRBc2RCV3FNTXNtb2dEMkRWbExv?=
 =?utf-8?B?NEdNR29EYmxSU29wNllMR0pMZW1Ycm9NWGdWZlk4ZndGTDBYNlZiYjNzNFVo?=
 =?utf-8?B?ZjJKNXVueEpiOGlLMWdVbDhyTHFPTm5FYktkNkhtV1pKQzRvOWRIcVkvZXFH?=
 =?utf-8?B?ZFRzSmcxSml6ZThjUDBHUWp6N3piOWx0eHBUa2prK1lLVHFpaHNqbmJMdlJU?=
 =?utf-8?B?V2lKYm0yeHVVdXlIaGdmWSs1QU02SmJ6NTRRVldHSlRkeFJmcXBiRysvSGl6?=
 =?utf-8?B?R3dFUFljeWM4RTN6TmZiUEtNSFVHRVZlQmdhekVsWmVJSnhSN3h2blQ2K0hJ?=
 =?utf-8?B?L0tRby9YeUV5eDN1MTkrSlVna1pSNVBsTjFyRmc4eW5kS2U5ZlhuNXNGNThj?=
 =?utf-8?B?YXladEcwSXhUQnR3aEI3dFlNSGEySTI0QTlaZ3RGY0FnY2MraEZWZkRiRlZH?=
 =?utf-8?B?MWt0cUZ0S2N3b2loZGpWOWovOCt6Q1dMY09TODQ3MHE0WHVoTjFYM1gzMFcx?=
 =?utf-8?B?c29Lb0pEbForbFg4R0xDakhubXRsamlXeVJOakdJUSs0eTVMK3FjRkZSeGZC?=
 =?utf-8?B?cnNyNkhPYzhFUndMNEpvYkFpN3NVbHdIRk5VTDZBRTRTZnp6MFU2UkpGTWI0?=
 =?utf-8?B?aDlmLzlvUTdFZUpyY2djb0loZVh4amZTUzNDcnEyZzFVaVZaOHJJdmI3UmRC?=
 =?utf-8?B?R2pCZllBZGt6cXByNTViNUh5Zm5ackYvN0VzZWdXV3VOT2RrOG84bjJTMktz?=
 =?utf-8?B?YjhJMysvTDdhZy9GVGQ1NlZ2WDZtRkhpd09LcnNJc2VhNzcwbHBrTmxQcS9J?=
 =?utf-8?B?WUtJNVM3N09jWHZ6dVN3b3dwd0ljODdmQUNEWi9zeFExQ290K0VGOWpsRWcv?=
 =?utf-8?B?bXV2czJxczg5cS9vY0czR09RaUxqWTVRR2VkeE11TXB2S0ZZNnJGdWFSUDlQ?=
 =?utf-8?B?TFFORUFNbjlRSXRzSHZ3V2NaK0JDWjN0ZXVxenkzR0hia3JQMzdMR3RoUkZo?=
 =?utf-8?B?OUVacGVlSkx2UU95eTlHWWNQLzJ1aGRib2Y3d3NrcHJsZXBCN0toeG15VGhS?=
 =?utf-8?Q?GJNv+Z62PFNdPde3fTNPnLc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 74e7a36e-e65b-42f8-b649-08dd6c4b5a61
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 09:48:25.3904 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XupjKo/TgBuYPajzO74XozxnWUruPR5e7PJ+xlG75vpTM00Rj5PRutKpuwPsjVG9OmWHWErN37rW+wT7kxsc36AXmbv8zxciT9lyslQQgbs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7469
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



On 26-03-2025 13:35, Thomas Hellström wrote:
> With SVM, ranges forwarded to the PT code for binding can, mostly
> due to races when migrating, point to both VRAM and system / foreign
> device memory. Make the PT code able to handle that by checking,
> for each PTE set up, whether it points to local VRAM or to system
> memory.
> 
> v2:
> - Fix system memory GPU atomic access.
> v3:
> - Avoid the UAPI change. It needs more thought.
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_bo.c |  12 +++-
>   drivers/gpu/drm/xe/xe_pt.c | 120 +++++++++++++++++++------------------
>   2 files changed, 70 insertions(+), 62 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 9d043d2c30fd..3c7c2353d3c8 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -2116,10 +2116,16 @@ uint64_t vram_region_gpu_offset(struct ttm_resource *res)
>   {
>   	struct xe_device *xe = ttm_to_xe_device(res->bo->bdev);
>   
> -	if (res->mem_type == XE_PL_STOLEN)
> +	switch (res->mem_type) {
> +	case XE_PL_STOLEN:
>   		return xe_ttm_stolen_gpu_offset(xe);
> -
> -	return res_to_mem_region(res)->dpa_base;
> +	case XE_PL_TT:
> +	case XE_PL_SYSTEM:
> +		return 0;
> +	default:
> +		return res_to_mem_region(res)->dpa_base;
> +	}
> +	return 0;
>   }
>   
>   /**
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 9e719535a3bb..82ae159feed1 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -278,13 +278,15 @@ struct xe_pt_stage_bind_walk {
>   	struct xe_vm *vm;
>   	/** @tile: The tile we're building for. */
>   	struct xe_tile *tile;
> -	/** @default_pte: PTE flag only template. No address is associated */
> -	u64 default_pte;
> +	/** @default_pte: PTE flag only template for VRAM. No address is associated */
> +	u64 default_vram_pte;
> +	/** @default_pte: PTE flag only template for VRAM. No address is associated */
> +	u64 default_system_pte;
>   	/** @dma_offset: DMA offset to add to the PTE. */
>   	u64 dma_offset;
>   	/**
>   	 * @needs_64k: This address range enforces 64K alignment and
> -	 * granularity.
> +	 * granularity on VRAM.
>   	 */
>   	bool needs_64K;
>   	/**
> @@ -515,13 +517,16 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff_t offset,
>   	if (level == 0 || xe_pt_hugepte_possible(addr, next, level, xe_walk)) {
>   		struct xe_res_cursor *curs = xe_walk->curs;
>   		bool is_null = xe_vma_is_null(xe_walk->vma);
> +		bool is_vram = is_null ? false : xe_res_is_vram(curs);
>   
>   		XE_WARN_ON(xe_walk->va_curs_start != addr);
>   
>   		pte = vm->pt_ops->pte_encode_vma(is_null ? 0 :
>   						 xe_res_dma(curs) + xe_walk->dma_offset,
>   						 xe_walk->vma, pat_index, level);
> -		pte |= xe_walk->default_pte;
> +		if (!is_null)
> +			pte |= is_vram ? xe_walk->default_vram_pte :
> +				xe_walk->default_system_pte;
>   
>   		/*
>   		 * Set the XE_PTE_PS64 hint if possible, otherwise if
> @@ -531,7 +536,7 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff_t offset,
>   			if (xe_pt_is_pte_ps64K(addr, next, xe_walk)) {
>   				xe_walk->vma->gpuva.flags |= XE_VMA_PTE_64K;
>   				pte |= XE_PTE_PS64;
> -			} else if (XE_WARN_ON(xe_walk->needs_64K)) {
> +			} else if (XE_WARN_ON(xe_walk->needs_64K && is_vram)) {
>   				return -EINVAL;
>   			}
>   		}
> @@ -603,6 +608,44 @@ static const struct xe_pt_walk_ops xe_pt_stage_bind_ops = {
>   	.pt_entry = xe_pt_stage_bind_entry,
>   };
>   
> +/*
> + * Default atomic expectations for different allocation scenarios are as follows:
> + *
> + * 1. Traditional API: When the VM is not in LR mode:
> + *    - Device atomics are expected to function with all allocations.
> + *
> + * 2. Compute/SVM API: When the VM is in LR mode:
> + *    - Device atomics are the default behavior when the bo is placed in a single region.
> + *    - In all other cases device atomics will be disabled with AE=0 until an application
> + *      request differently using a ioctl like madvise.
> + */
> +static bool xe_atomic_for_vram(struct xe_vm *vm)
> +{
> +	return true;
> +}
> +
> +static bool xe_atomic_for_system(struct xe_vm *vm, struct xe_bo *bo)
> +{
> +	struct xe_device *xe = vm->xe;
> +
> +	if (!xe->info.has_device_atomics_on_smem)
> +		return false;
> +
> +	/*
> +	 * If a SMEM+LMEM allocation is backed by SMEM, a device
> +	 * atomics will cause a gpu page fault and which then
> +	 * gets migrated to LMEM, bind such allocations with
> +	 * device atomics enabled.
> +	 *
> +	 * TODO: Revisit this. Perhaps add something like a
> +	 * fault_on_atomics_in_system UAPI flag.
> +	 * Note that this also prohibits GPU atomics in LR mode for
> +	 * userptr and system memory on DGFX.
> +	 */
> +	return (!IS_DGFX(xe) || (!xe_vm_in_lr_mode(vm) ||
> +				 (bo && xe_bo_has_single_placement(bo))));
> +}
> +
>   /**
>    * xe_pt_stage_bind() - Build a disconnected page-table tree for a given address
>    * range.
> @@ -629,9 +672,8 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
>   {
>   	struct xe_device *xe = tile_to_xe(tile);
>   	struct xe_bo *bo = xe_vma_bo(vma);
> -	bool is_devmem = !xe_vma_is_userptr(vma) && bo &&
> -		(xe_bo_is_vram(bo) || xe_bo_is_stolen_devmem(bo));
>   	struct xe_res_cursor curs;
> +	struct xe_vm *vm = xe_vma_vm(vma);
>   	struct xe_pt_stage_bind_walk xe_walk = {
>   		.base = {
>   			.ops = &xe_pt_stage_bind_ops,
> @@ -639,7 +681,7 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
>   			.max_level = XE_PT_HIGHEST_LEVEL,
>   			.staging = true,
>   		},
> -		.vm = xe_vma_vm(vma),
> +		.vm = vm,
>   		.tile = tile,
>   		.curs = &curs,
>   		.va_curs_start = range ? range->base.itree.start :
> @@ -647,26 +689,22 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
>   		.vma = vma,
>   		.wupd.entries = entries,
>   	};
> -	struct xe_pt *pt = xe_vma_vm(vma)->pt_root[tile->id];
> +	struct xe_pt *pt = vm->pt_root[tile->id];
>   	int ret;
>   
>   	if (range) {
>   		/* Move this entire thing to xe_svm.c? */
> -		xe_svm_notifier_lock(xe_vma_vm(vma));
> +		xe_svm_notifier_lock(vm);
>   		if (!xe_svm_range_pages_valid(range)) {
>   			xe_svm_range_debug(range, "BIND PREPARE - RETRY");
> -			xe_svm_notifier_unlock(xe_vma_vm(vma));
> +			xe_svm_notifier_unlock(vm);
>   			return -EAGAIN;
>   		}
>   		if (xe_svm_range_has_dma_mapping(range)) {
>   			xe_res_first_dma(range->base.dma_addr, 0,
>   					 range->base.itree.last + 1 - range->base.itree.start,
>   					 &curs);
> -			is_devmem = xe_res_is_vram(&curs);
> -			if (is_devmem)
> -				xe_svm_range_debug(range, "BIND PREPARE - DMA VRAM");
> -			else
> -				xe_svm_range_debug(range, "BIND PREPARE - DMA");
> +			xe_svm_range_debug(range, "BIND PREPARE - MIXED");
>   		} else {
>   			xe_assert(xe, false);
>   		}
> @@ -674,54 +712,18 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
>   		 * Note, when unlocking the resource cursor dma addresses may become
>   		 * stale, but the bind will be aborted anyway at commit time.
>   		 */
> -		xe_svm_notifier_unlock(xe_vma_vm(vma));
> +		xe_svm_notifier_unlock(vm);
>   	}
>   
> -	xe_walk.needs_64K = (xe_vma_vm(vma)->flags & XE_VM_FLAG_64K) && is_devmem;
> -
> -	/**
> -	 * Default atomic expectations for different allocation scenarios are as follows:
> -	 *
> -	 * 1. Traditional API: When the VM is not in LR mode:
> -	 *    - Device atomics are expected to function with all allocations.
> -	 *
> -	 * 2. Compute/SVM API: When the VM is in LR mode:
> -	 *    - Device atomics are the default behavior when the bo is placed in a single region.
> -	 *    - In all other cases device atomics will be disabled with AE=0 until an application
> -	 *      request differently using a ioctl like madvise.
> -	 */
> +	xe_walk.needs_64K = (vm->flags & XE_VM_FLAG_64K);
>   	if (vma->gpuva.flags & XE_VMA_ATOMIC_PTE_BIT) {
> -		if (xe_vm_in_lr_mode(xe_vma_vm(vma))) {
> -			if (bo && xe_bo_has_single_placement(bo))
> -				xe_walk.default_pte |= XE_USM_PPGTT_PTE_AE;
> -			/**
> -			 * If a SMEM+LMEM allocation is backed by SMEM, a device
> -			 * atomics will cause a gpu page fault and which then
> -			 * gets migrated to LMEM, bind such allocations with
> -			 * device atomics enabled.
> -			 */
> -			else if (is_devmem)
> -				xe_walk.default_pte |= XE_USM_PPGTT_PTE_AE;
> -		} else {
> -			xe_walk.default_pte |= XE_USM_PPGTT_PTE_AE;
> -		}
> -
> -		/**
> -		 * Unset AE if the platform(PVC) doesn't support it on an
> -		 * allocation
> -		 */
> -		if (!xe->info.has_device_atomics_on_smem && !is_devmem)
> -			xe_walk.default_pte &= ~XE_USM_PPGTT_PTE_AE;
> -	}
> -
> -	if (is_devmem) {
> -		xe_walk.default_pte |= XE_PPGTT_PTE_DM;
> -		xe_walk.dma_offset = bo ? vram_region_gpu_offset(bo->ttm.resource) : 0;
> +		xe_walk.default_vram_pte = xe_atomic_for_vram(vm) ? XE_USM_PPGTT_PTE_AE : 0;
> +		xe_walk.default_system_pte = xe_atomic_for_system(vm, bo) ?
> +			XE_USM_PPGTT_PTE_AE : 0;
>   	}
>   
> -	if (!xe_vma_has_no_bo(vma) && xe_bo_is_stolen(bo))
> -		xe_walk.dma_offset = xe_ttm_stolen_gpu_offset(xe_bo_device(bo));
> -
> +	xe_walk.default_vram_pte |= XE_PPGTT_PTE_DM;
> +	xe_walk.dma_offset = bo ? vram_region_gpu_offset(bo->ttm.resource) : 0;

LGTM
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

>   	if (!range)
>   		xe_bo_assert_held(bo);
>   


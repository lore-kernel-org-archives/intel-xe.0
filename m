Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E60AE606A319
	for <intel-xe@archiver.kernel.org>; Thu, 22 Oct 2026 04:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UeC9Gh5P
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89CEE10E2AB;
	Thu, 22 Oct 2026 04:36:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9331410E2AB
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Oct 2026 04:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792643796; x=1824179796;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3cN7UoVJa11q4b4r1TsauXchO5H+B6RJC5c9Z/Hf+P0=;
 b=UeC9Gh5P3hgdQYhtBemw+rp28VLnB/vEZlAXFy5XLQVM4zn/QYK5xpoU
 jgAvEKJxnVj7aBB8c/cz93s3MdjdMtxAQGB0SJZEFxtOuq/UXWXCPWesB
 1tUGWUeoaD1npJjWUy1jbtHWuzdZnZYLsagtuK7F4E12vH30moDcICyYD
 aDku33pFZlRt3/B+JbBpEL8C5qY8sD4iLOB9lR4Nuxe5VGhLeNL/wuZqx
 9+okUNmPfvvCL8d8dL7dVqb2W9Fepgw6j6E/Txu4Jz16kgPDqjvmzgnwy
 cnKfdwrX2AXqcAULNszvoJN3RpUOHy2INmoGhjyBO2BN5aCu7gBOpCkCd A==;
X-CSE-ConnectionGUID: 92+0q3jqQ6WvuBlnNQoIlw==
X-CSE-MsgGUID: oLTX879rTjmNbiP278nsvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1419234"
X-IronPort-AV: E=Sophos;i="6.27,171,1787036400"; 
   d="scan'208";a="1419234"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 21:36:36 -0700
X-CSE-ConnectionGUID: HpU23RPlQ0augXECbINEFQ==
X-CSE-MsgGUID: M6oGMYBZRZiArYz6mQU3Gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,171,1787036400"; 
   d="scan'208";a="3612213"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 21:36:36 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 21 Oct 2026 21:36:35 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 21 Oct 2026 21:36:35 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.45) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 21 Oct 2026 21:36:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gP785J8XH3i0ZBTwmEwmUM/aCwhv15T5wCYj/0LpYegxxYLG5OSPEfPsKoJnuM8EpSmQLS8uvTa7PKjvirU5vqy+2xGlCD7P8/8q0/dDUb5Do3iFMYE401REOSg0osBEL48Q4rfsWXEjIrgxUPreYVLMlwXJe7JmtGA7CFo2bFGKymkEgNXp+QJjkPAvS4o7NvMpjj81IJaQHSd/8BpQMYNeMQG+LP462zRCN5Lsk6QYnWgMcdVmO/I7YWrUApMOgBzYFXD9v8unnBtG/Hur0kaCyRA95iT7ACs/ndz1TGKY8lLzQMP+hwuIDGdp2c9IsdoA4zOwgYi1T839P6Igvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eGBrkR+3zuWVSfq2pnsoQeAie/lfL59Lww1XkS5YT7A=;
 b=vz7m4DiMAOwPS49nQLHbA+bhWyLbUXjPgaM3BGaaVMPwJX0KBHYqm16yQhA/mKLwPABtdTd1qAeTPASbW0Dye3vfWJSFMuB26+DqBoka258JaJQFde+IBkgmvIwbM0t3smmyhTBeQdB9035tsFGlUoyQ0Qqb/3MzAVtaGF0mVfCSwezgvW6ODP9J7iVFS9TlG/dsBr/Ghi2ON4lgiMtrSvQvLHq33NESXuBW/MawbCGXI8L0ulIRUkZbKxCHGkYQ6PoQCO9L6Es0qlFWirx0zj+e4MXwAReFtaCyI/vlv4kapnkXd4uxy7zjTxR20/Pn466IRSnnZVu2Ig1IIEqkHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7955.namprd11.prod.outlook.com (2603:10b6:208:3dd::6)
 by PH3PPFB8E59DF50.namprd11.prod.outlook.com (2603:10b6:518:1::d44)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Thu, 22 Oct
 2026 04:36:28 +0000
Received: from IA0PR11MB7955.namprd11.prod.outlook.com
 ([fe80::6021:79ca:45d2:ae46]) by IA0PR11MB7955.namprd11.prod.outlook.com
 ([fe80::6021:79ca:45d2:ae46%4]) with mapi id 15.21.0472.016; Thu, 22 Oct 2026
 04:36:28 +0000
Message-ID: <d2583ff6-1397-477e-8cf5-a48324819cd0@intel.com>
Date: Thu, 22 Oct 2026 10:06:18 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 3/9] drm/xe/hw_error: Guard csc_hw_error_work() with
 runtime PM
To: Raag Jadav <raag.jadav@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <michal.wajdeczko@intel.com>, <lukasz.laguna@intel.com>,
 <matthew.d.roper@intel.com>, <matthew.brost@intel.com>,
 <mallesh.koujalagi@intel.com>, <rodrigo.vivi@intel.com>
References: <20261020023641.200658-1-raag.jadav@intel.com>
 <20261020023641.200658-4-raag.jadav@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <20261020023641.200658-4-raag.jadav@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0303.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:220::14) To IA0PR11MB7955.namprd11.prod.outlook.com
 (2603:10b6:208:3dd::6)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7955:EE_|PH3PPFB8E59DF50:EE_
X-MS-Office365-Filtering-Correlation-Id: f25b62ec-7ace-47e5-b432-08df2ff60943
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|22082099003|18002099003|10067099003|4143699003|261009223027099003|11063799006|261021121427099003|56012099006;
X-Microsoft-Antispam-Message-Info: 4rX3JqCBRcPAQ6BLgwwt6Z4YcwweZ88iVEaLQsKXPet3himA4Y8MGiCLeU8dHVFIszQ55DVDJ7bxkkOYZNckC1CddJLQ/OKQrBlC60+BPf9Tb8fez7QlwAzZIjvs5nKHSPT5ZM4hwyC4W0eN8su2bsQP197s8vbsXY9e1SLZZe+W6DupJgpNnaJjBbZEDdfJFyfHoWM5csY9ZquYgUajMa9hqfJhhMSMLXwY3xtmaP+y1E93YdirYk+NU8itIb2fR8YWWNnz/3g0aQ8h125vIP8aAxwEJTH/4lhptCOz577G8Ga1SJeWVC68O+/Z8NrlgMcquQuTLxAj0/4QU2xKydA2c0fA7FAna9ZVlWtsVCZZdrpkJVfDXvioCuP6Imdpe7QuvWzx2RV9TqZhGZ7vT4564mp+dVa6Vnhopit9nsgyIhNbhx3Fe7WtabRZDQG+1udKI5nJJC0uQlJ3yJDGJD8wkYfaQejEnSWsn5l4ld7re9FyjmKW678nFwy1kqUiwT2SC5UrOsIpuDkExOhtzWDEKiwWtKFbZhayzfCg1+IF2e0oMES5lCA9Y5K0Gv9RmyCnl0tVr4FxUhBP47xpzeP/FsffNuFkUlfBF3tu+tVa+E2KZzhxshuSN9xOTOpDsjmTVUaahACCg2SsXAtbaI308a7Bv1aqK8WkvHlVYIE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7955.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(22082099003)(18002099003)(10067099003)(4143699003)(261009223027099003)(11063799006)(261021121427099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V0pNV3Z6dXgvSlFsZ2UwaCtkRk12T3hWN2szVDF1clcxWm96dDc4eWVIUFQ2?=
 =?utf-8?B?dG9XMzNHcUtFTGRrWFl3SHBVQVRWaXJZakZtNGFIU21ONlhGSHBOOUduWE50?=
 =?utf-8?B?c0R6SFBNRW9DQjkrQkdvQTVLNkJHRy8xeDA0UjZKVVdYS2xtTDdzdUNWK1BE?=
 =?utf-8?B?UFNYWUVMSm1pT1d6UEFWTlZramJDdWZCWndrcEw0N2tpTFo4SU5kYm44TS9a?=
 =?utf-8?B?WmJMUnlKUW5USytHRVR0U2hlUEN2bWx5b0k1RFd6b2ZKQVo2NjZ4Ui9mNHlm?=
 =?utf-8?B?YlIxQ0xJWmtROFhPTDcwR1dnZk5SaTFxbTZvQmhPWTRlTzNzMmY3bWtXUUIy?=
 =?utf-8?B?eUVnaGNIM2hvSjJWamw1ZVdXTGZIRWpTcjBXdlg4RmIxR1lhOWFKMzJ3Rk5Y?=
 =?utf-8?B?NzkyZklwT2xXYi9wMW9SL0dPQWJYUGZ2SE5tSW5BWUlJdGZrV2xTN1dzdEZI?=
 =?utf-8?B?TytMc21NUnE1S2VuVmFXZXBuNWpMWXpzQU9iR21Md3d0V090WUdPZ1dZd0Ew?=
 =?utf-8?B?eFFBRkYrMCtRTG9ESHdNTEw0TS9oYmttYmpweEE2WC9JZldoUzVvVmJGRGtn?=
 =?utf-8?B?NE5PNWFmUTE0V3l5Q29Sb2lZaG9SL0ZBaW1oeVJONTFJK3pDWWZrRW1hak91?=
 =?utf-8?B?U0d1RE1ZcUxPVC9TWkdBajQ1Mjl6Skc5L1orb2ZLSnRka09qOFROL3VKRFhk?=
 =?utf-8?B?YTBxTlpsWk9Pb3Q2YkZxbE9zZDEwc1U5TFovUzFNb1ZUWUhiVGJKWWVDVWxi?=
 =?utf-8?B?VHo5R1FWOGUyRk9ZT2Y5d0hQVVVoY0FPNC9jemdWN2drblpmWXA1VXI4dUky?=
 =?utf-8?B?SGZBVVJDT1duY2I4amRLODNvN1Nlc1pQTzRtcHluMTBBWXlPTWhJNmpNMExB?=
 =?utf-8?B?WnYzcjdXV1J4c0h1NWpyaWtza3NFT0FFSGswSUFMM3Y1eUt3c3MyQWw2TG9q?=
 =?utf-8?B?TW5MRzJ1QnRHb1NJRXpJWTZjL2dmS0djWnMyQ0NpTHg0c2NUWktDWlZkVC9T?=
 =?utf-8?B?bFZlOU5qc2k2TmFDMW93VzZlTmZSSVlOOE15YXJTMDVSQytUT0JDWTFMSjVO?=
 =?utf-8?B?R3ZlQitsbDloSml0aDhZRHpnUTdob0RqQy81eEw2b0M2ODJFZENJSnhZRFdX?=
 =?utf-8?B?cjBPeHlrcHoraE1LdjR2OXFNNExMYWVNQ0t6MUgvV0hrUSs5clE2bWRaK3BD?=
 =?utf-8?B?OWZMeGszcjl3K2xFMFdoRW5KRUFNTmhVLzU5dWRlbkRNRnpHMUVSY1p5ejQ2?=
 =?utf-8?B?OU96SFkvZGphc0J5MXQyd25xeFNFTXRyUG9URXVEcjdVTDFLeDRCT1pUY2NE?=
 =?utf-8?B?TFF0Ti84WnBtWWpodWxaQTB3Y3J5YjZUZURaNG1DcVV5T2dOcEg4eVA5bGhS?=
 =?utf-8?B?THNmNFkrWFRiQ2FQaldsN01xT0hpTkJvZnc2WXFKNkh5Uzc0Uk1Vem8xQ0Zo?=
 =?utf-8?B?RGFrN0gzT1VvRXYydTZSYm5yOTBTS2gyR1BmTzJBekpQbkwwQ0VRSktXTk52?=
 =?utf-8?B?SFd3N0phTlhNS2Jjd1JyeEVXNEgrcmNjVWtEeDlTbWt4ZVFWYWdsWmd3OFNL?=
 =?utf-8?B?d1V4TFo4M0FqQ0lZUXNsK2NLNTk2R3UvbkpWeDU5MXBpaUVKRmZLUnI3R2ZV?=
 =?utf-8?B?ZmhrWUpId3hsMURidlpYQ0ZyOTVubjhPRGdRMWZmYmhtZXNhZGFqRlVlUkVn?=
 =?utf-8?B?YVkya1MrU1A0ZzFPNklYLzNwRXZPdmJEUFBLMldoSXFGMGUwMWo1bDhNczMz?=
 =?utf-8?B?Wkk3bWY3b1IwZXYvQ0o3RkNRWXdsRk1oNUwwT25xWVoySm5hTWIva24zRGZs?=
 =?utf-8?B?dXFxRU9udEVaSFJxSmpYUko2bUdISmZiUzZHRVNUbHo2c1poeXovQUppRXpq?=
 =?utf-8?B?aTk4SWpjbkRGbXR4QXNDZkRDU0NWMm5ZSFpUV0lvclA5NkVWN09ZQk9RUnBs?=
 =?utf-8?B?SndVN2JEbmkwS2x3d3ZmSDRwMmFxUUNRdEtyR0dObktHSzRnNTQ3L0xnbnJl?=
 =?utf-8?B?K0NsLzRISWdNLzBoRkx6TmljZmJNL3VtUlNYMVdXS09GNUZxV2Y5L2RYeStC?=
 =?utf-8?B?eW5mK3JxREk3MEFZa2pBTEVCRk0zdWhPRHh4L29rbmlWYXRyTWhZYi93NHZY?=
 =?utf-8?B?YTQ2aXlGZU9RczFiYjlLc1duUkI5R1BlWWM3dll1ampiWXpSTVZPV1BZZTFk?=
 =?utf-8?B?elVNalhGZFExZHMxRzM4MXJQU3crbkIxRHMxaGVQekV4aE02elRMeEhwT293?=
 =?utf-8?B?Nm9OSjBnWkhvQnYrajlEYUcxMjYzYmpSeTJzcWRTdnBFcjdRdDdOdWI5bC93?=
 =?utf-8?B?elI0YjY4Ym5kM1NpSHpLWFVaUjArMjNCRG11aVNOcTRZTExHR2U2UT09?=
X-Exchange-RoutingPolicyChecked: fhiWda3AXmkiPZlcu9i9ikqGGP2ltOFJ1iyjeCt2rx4Lq6n3E/WpQ1XzrbSSLjwQ2EYeuSDtKU6SC68i7Yekp0QPuSU2nbjryqX9erNtEmSMKx8mTU3D/A4TZHzXuqtg+jA+ZVq7chS7YpDZTQngqnYF9pl8ZwxpjwrEARrX4PzWHvYSkRKy7x6S6csjxupKN/TSWPkBQ4hlyYY5sBIG/DVZCuoVE7ijH44ysLTNESlqMjl2pxpdrrl1s68uAzj5Lk2jQ5JD2OSwvdNDmTgG/JUBGOzzPo33htmRJbEGYR+MD2837VVYLC4YGTRvSVuBps1Q2DPgkc3v9GKfJLhLlg==
X-MS-Exchange-CrossTenant-Network-Message-Id: f25b62ec-7ace-47e5-b432-08df2ff60943
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7955.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 04:36:28.0568 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: atv1EUYYwkwZ0kV+avKbBLqT201/muHQvy3Qn87V7vFgUXO62wNfMxhiAOgaVhsrBCs+x8li8Naql+X9UB8nog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFB8E59DF50
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 20-10-2026 08:06, Raag Jadav wrote:
> xe_device_declare_wedged() callers are expected to hold a runtime PM
> reference. Fix it.
>
> Fixes: a7df563b45b0 ("drm/xe/xe_hw_error: Handle CSC Firmware reported Hardware errors")
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>

Reviewed-by: Riana Tauro <riana.tauro@intel.com>

> ---
> v10: Guard wedge callers with runtime PM (Sashiko)
> ---
>   drivers/gpu/drm/xe/xe_hw_error.c | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
> index f53a6b3055de..ac720710c8e8 100644
> --- a/drivers/gpu/drm/xe/xe_hw_error.c
> +++ b/drivers/gpu/drm/xe/xe_hw_error.c
> @@ -14,6 +14,7 @@
>   #include "xe_drm_ras.h"
>   #include "xe_hw_error.h"
>   #include "xe_mmio.h"
> +#include "xe_pm.h"
>   #include "xe_survivability_mode.h"
>   
>   #define GT_HW_ERROR_MAX_ERR_BITS		16
> @@ -170,6 +171,7 @@ static void csc_hw_error_work(struct work_struct *work)
>   	struct xe_tile *tile = container_of(work, typeof(*tile), csc_hw_error_work);
>   	struct xe_device *xe = tile_to_xe(tile);
>   
> +	guard(xe_pm_runtime)(xe);
>   	xe_survivability_mode_runtime_enable(xe);
>   }
>   

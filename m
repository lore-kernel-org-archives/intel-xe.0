Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E30B3C87FCB
	for <intel-xe@archiver.kernel.org>; Wed, 30 Jul 2025 08:55:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86CB810E42E;
	Wed, 30 Jul 2025 08:55:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gz5OBmDc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E02BD10E42E
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Jul 2025 08:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753865744; x=1785401744;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=HHW1Q/TF7EjycMG4kDIb44vWU+K3cY9mT68mXogeHXk=;
 b=gz5OBmDcZRzDj/70bLtIVCXgW9sN9CZbD4D2hOCemFaPhTD8fI7fsAZr
 lk16q8R/9MfbvjSzGxJJQNy2ZdmnUsJOqRsun55/+pf0c/ic4gKVq3RdS
 56WM4QlfsrjHSH22pHXfSOx0YwBz8bacRPjpe15Q/aSzbtcDOOQigwsKK
 5U0wQRsgoiCViJ3tggII+TOonmway7OgonGSa3oLyytzC6Tu7uwZZcsyw
 K515cmi8bQn81U5qCdjlmzxnV0ins3eN1EVLVSzO1YpCC7cCiJaPT3GqN
 n3NVbrYuUwODktdkkAeFc6a1JCX+u6ykeiczvnW67QN+vQMCE4u+cvVl1 A==;
X-CSE-ConnectionGUID: aDLRM97cTt27js/755XKXA==
X-CSE-MsgGUID: d/b1uB3YTLCUV5wiREvNvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="56308644"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="56308644"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 01:55:43 -0700
X-CSE-ConnectionGUID: wLO/2uEHSFqBs6l913R6og==
X-CSE-MsgGUID: H9wZZLiPRxqw0vg6QpuRIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="167144974"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 01:55:43 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 30 Jul 2025 01:55:43 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Wed, 30 Jul 2025 01:55:43 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.68)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 30 Jul 2025 01:55:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bNCswz6Z2KYkXmccdCYl2R19oF6Zae4ssY+BevByKvEz5j/xr1w8+63T3wGw1M8nPl5ZasscOfo+LyIPksTvtzalO1L2uuXsnLr0uthy7pSYOb60lj7CSOppMGVscs3mBMHNpM7lXnfYFXxWcz5OrVG+2fpSPiNVJtQHURTOj8gIcCxsmqPoeOP9Dil93to68kmoN/G7SjZavYd8oY8H6XrwnUv+udg8GN1/7ClDAhguBE077x8/sfX7nomyNRjqlexkRRKjijAiM5weRwp7BM5l1n2NyOWy79hIEOb3xMSeBJQt6OeJMMVKYJfvHX7sPj2RBLQks8hSLs9+ondPOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iZEVkHXpHdWjq0BY+2oBReq+mS2NwAqYXf4OmXwzi6s=;
 b=H0R7sHOjF8gYHZ2pqrU71KnITsyCmul1hoMxgfAZviwUotHjWKh366a/tppvf3294jozqutxuhm1eCbai+Uftl1EutCa4cvogPxJpOZljnO/2z1D3UJmPOkY+tZb3j/yuDz44FBGxaRmpYvjtvGiYRS/YacpoCsMu5L52YnXFCKwG2M8d58513UQERY2A8AF1KC1YlAGhRYCrU/Ks016j9twbVlQNeptVC8j5EJSJhjNrdjtuDEI9mwk8FJgcF139Yk16zEj2zjTzCMmJhCK4CjcFBhzybtwASvtGx1St8QgkYzs98y+4X3FfBQgs0JNaKyQ5CFGeaYURow9iO00vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV2PR11MB6024.namprd11.prod.outlook.com (2603:10b6:408:17a::16)
 by IA3PR11MB9206.namprd11.prod.outlook.com (2603:10b6:208:574::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.23; Wed, 30 Jul
 2025 08:55:22 +0000
Received: from LV2PR11MB6024.namprd11.prod.outlook.com
 ([fe80::dc22:ef1e:53e2:f00f]) by LV2PR11MB6024.namprd11.prod.outlook.com
 ([fe80::dc22:ef1e:53e2:f00f%5]) with mapi id 15.20.8989.010; Wed, 30 Jul 2025
 08:55:22 +0000
Message-ID: <208afa43-ee53-4d91-bab9-7a50ef98f078@intel.com>
Date: Wed, 30 Jul 2025 10:55:11 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/10] drm/xe: Add new helpers to log hardware errrors.
To: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <riana.tauro@intel.com>, <rodrigo.vivi@intel.com>,
 <himal.prasad.ghimiray@intel.com>, <anshuman.gupta@intel.com>
References: <20250730054814.1376770-1-aravind.iddamsetty@linux.intel.com>
 <20250730054814.1376770-3-aravind.iddamsetty@linux.intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250730054814.1376770-3-aravind.iddamsetty@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0018.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:15::20) To DM4PR11MB6020.namprd11.prod.outlook.com
 (2603:10b6:8:61::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR11MB6024:EE_|IA3PR11MB9206:EE_
X-MS-Office365-Filtering-Correlation-Id: 76c577ec-6464-4012-512b-08ddcf46d0df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V3hMQ1E4WmR4OGpTeXVQd29lT0hqTU5sYWpKNWlmT3Rrcyt6OUFGZkNQTWpX?=
 =?utf-8?B?UTZsM3Rad0xKYWZWK0pRNkZoa0tFZnlkL3o0ejFtZ1dKRlNLRFh6dWRIdUlJ?=
 =?utf-8?B?dFZ3M240NmZMM1c1dUNQUVpSZVJxZkc0c1dsODk1Sm1hSHVUZlRTSXVNbVhO?=
 =?utf-8?B?ZGlvOEZlUjlOckhMb2hqUkllU0JadHBBWlYwR1NxZUd5UHQrM3JDTzVmV3RH?=
 =?utf-8?B?N0h3a1ZwRmg1aExjaXZORlM0Z1p1MlpLZ01WdVhFYzFNaStjYzJLb3RMc3Bz?=
 =?utf-8?B?R2RzTHRGbmdoVEVwRjQ2MmJ5ekFBeDJFNTdTS0JER3FSMnFlWlJOMkJTSmpv?=
 =?utf-8?B?ME9LMDFwdnlVbENuYm1FdXFNSzRBZmE1c1prMmdsMzJHS1JhbzdnbWU4TGlj?=
 =?utf-8?B?UWZ3SWxPcXM0MGtiamZjK0k2Rk9EOTZXOVZkby9FUXV4RUVVU3hTWFZaTzR2?=
 =?utf-8?B?WEVqRFVZOTEzZ3hmWHVqREJaNWJJRmNZM3kzNnptS3NUWW0wdmdKeW5ac2Q0?=
 =?utf-8?B?RkJld0tNS2REMmM4V05aWEhBYjVtSExvZmU2ZGE3bmZkZFBweGVIcHFKdVU0?=
 =?utf-8?B?SHF4UERWdlNTM2dDWUUyTDJWTTVWTDJweDZWTEFBVSt3Ump4OHVMZ1lYbFBj?=
 =?utf-8?B?QWc2dys0My9wVlM5NFlUWC84dzNhWExXd3NZNFpjZGh1S0NCTERJQWlDUzNG?=
 =?utf-8?B?VTRZOFNzQklBOCtzUHlYSEoxNDFuODJZKzg4K1grajZzc2N6N1UxVXowSjhz?=
 =?utf-8?B?VFM5VmtCM1lxbm80eDUvR096cmtwYkVQdnlWbkVUV2ViMm9MZWQxTm9Db05K?=
 =?utf-8?B?cXVPVVVEU2srbE51UEtRY21GS1Z4Yit1aFdraW94aGkrOTBJdE9LbU9yaDhW?=
 =?utf-8?B?ajZFN2ZBN01wZ21HbDhvUTc5V2NNc3huZTUzcGpsOU1naVJVNlYrTWZzbDkz?=
 =?utf-8?B?aEtCMmRWUEMrdVBkRzR4amFxOFVCVW9RUENOWXNyRk1VNzNiWGE4cXN6cVlK?=
 =?utf-8?B?TzYzVXlCTys5ZXFwRkxtdkI3bmllL1JJNXczUG5VVFFRbzZDZkp6NnRlMERo?=
 =?utf-8?B?TjhsZGZKemw1TC9ZeTdOYW9MM1MxaVZyT1lLUE9WWHFkcXhZWXVDeXQ2ajRR?=
 =?utf-8?B?VklBMU9Ya3lJWHV1UTA3bUNzdzJJbE9LY0QwTzJvWjNsNGEyZ1pGZ1RZT0VW?=
 =?utf-8?B?NERCTkdDZ3lzczdlcFFTUHdYeS9CZnB5N21URUVTbjJXTWp2S0ZVQ2NnL0lS?=
 =?utf-8?B?MU52UkwrM3JwU3lia3M0alAzbnNTWmVvREl6TW5vNURkM0NYZHdJRUpGUTdT?=
 =?utf-8?B?Zmk4S2Y5azNtVThXOXpINkZhZTFXL0RrbmRNYmFwMG5XcjJwRmwrckJxdnI4?=
 =?utf-8?B?YmxWcmJNMFErem9hQlE5YU9SNTNjMGJsdFlkbkwwS2ZOakdjVysvODUwcU44?=
 =?utf-8?B?bHp0VFE1L0hKbFc4eWdYbDZXUklqTkRmM04yTTdIVkdxbXNxQndldzh3eVc0?=
 =?utf-8?B?aFpHWEFiemlMZkFpaDAxMjlDd0I4ckZnc1lXMTZhSjdMZE1YTVE2VlN2MVF2?=
 =?utf-8?B?R1piemxkdk5JKzFLcU5raTZOYnBGLzduWTZNK0J5ZnljbkJzdTFFcDhKVkFF?=
 =?utf-8?B?WE9rOTZJRy80WTB6MDNBbyswQ0NpSFBxSXdRWjhMTUVkSisram5id1ljSENZ?=
 =?utf-8?B?L0hoTEhDTzNyOWZrQUsrY2h1aVBVZU9WaVlYZmdXcWZzZkZrRmhMNWg1MTBz?=
 =?utf-8?B?WUNoMy9sdzZROXVRNGl6WmhxR2ZUa0J6YjFRY0hxQ09BVGgzVWpmMzdaV0Zw?=
 =?utf-8?B?R3RFYmdnS2N5bk50Y2thTWhlYmZwT0dRYTl5UEZ5QW9BZ3VXcDY0Yngxbzdv?=
 =?utf-8?B?dEM3bUdSZ2lRcUNBK3V4Q2UreHdJY1VoOVVmVHJnQ3dTZjhOVGIrTWtCM3pt?=
 =?utf-8?Q?Mo4mpxyXZFo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR11MB6024.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MXhYb2hHQmRwVmtqeDBtTitqWllyNXBZcCt3aHdTcUpyVlNwZGFzbmlOMnNU?=
 =?utf-8?B?SXV1N05lZnAxaDJsK1ptV1JwbUJZWU1uU1plRHdOR0V2NTFOeGNLM0lZSi90?=
 =?utf-8?B?WDcwV25pbUgxWGNySXgydC9KTzM1ZFMrMG51N3ZFRzc2c2pidUVFZ21zaFk3?=
 =?utf-8?B?bWFQTUg3RzlqTEp1cEp0K0F1MmhXOHhJSWQ0d1BlaFZpaUt6b2JzcGtQZlZ2?=
 =?utf-8?B?WTQ0c3BnL2sybVNOUVluMEN5ZHJKSHlta01iWXozbW9pL0N3THMrZUh4T0Jm?=
 =?utf-8?B?MzdnbzRib1NOTmxzMm8xOVZHZ2NKVTFzSkQ4aWg5M3N5eGxDUXlyTkpIRmox?=
 =?utf-8?B?Njl4alpmTEM1Z0ZmODI4Z1BKL3ZUWVdITGFLMzFpM216bi9nV204andJUXRh?=
 =?utf-8?B?THVCbjd4R0dUd0gwWGtkZmJ2OVMydVczR3RZWnZKSlhoK1J6aE5UcFpraUVo?=
 =?utf-8?B?T0Z5bE1YRXh3czdUKzhhZ2lMR1RCeGc4VDZWYWVseHh3VXRDenFiSkFRdC9Y?=
 =?utf-8?B?b0NuVXhMWjd2ZnplbGNrOUp5ZTVkRk9jbmNVNFR5RDBNbEVDMmRPWlRjNzJi?=
 =?utf-8?B?UUpCOTRndVZCVFVKWG5SRUIyekJqa3JyZEJlTlhsamhPN1d1ZW1aOGVyOC8z?=
 =?utf-8?B?Q09hcjE2ODN2VGtab2VyMWE3VEZocDg4dWRpWTNnWWRZdXgxdDFnYjhVYVlw?=
 =?utf-8?B?S3BTSXVCUXhiVmxoT240a3VJK2YzeE5qMEpXSi9wd2FFTFhaaUU4MnpqK3p1?=
 =?utf-8?B?ZTMzT1pVNWxRcXd0dElqWmhjNEFsN3U5T3J3U0lmcG80V3A3Ym9va1ZYZmlB?=
 =?utf-8?B?ZHRYb3BIbS9LdVVGeXZBci9EdnJuWklvdFpUVUZqajlYZGVtME1oYWxkZGov?=
 =?utf-8?B?c0g1di9nUzlaV1dxc05PRk9TT2pzYXUrRDY3b00rNlpzSWpBSGpkNW1lbnNk?=
 =?utf-8?B?S0x2NlRWa0F5NFh4am5sZzl6aXkxdzhsSk1jcUl0NEx1U016TzZZZC9QbG53?=
 =?utf-8?B?MElsQ0YxUWVJUldCeVRIQUljZGNtRC9yc0JuTm4rU3VuUmhsUkh4WHRHQ1Q1?=
 =?utf-8?B?cTh0cWp0RVJLMjRRZ1pHNDJleWgzRC9jOEovalZKejdsT0RjenoyZjRmYVA4?=
 =?utf-8?B?RHlVWFI1dFZuL2s3dXdvTXlTVFk4dDRhNHBHbEtsUWRYM2NqYWtoMENYRXFL?=
 =?utf-8?B?MzJvd1d0SlY0YkxxbUlFZElXMkZ5eGl4M2JSYjZtWkQ5UzlFQWxnT1N6cFU2?=
 =?utf-8?B?bkU2SkVhN0xrLzBGeUF0d01QM0NLMWpQbGgvV2t2RlpNVTlXeldVUFlKN0NE?=
 =?utf-8?B?UnhzdnVwSCtUV1hsY3owN2FHTHhxZzY1V0hXV3Q3SlpNdWtHYVBpWkVvOFVa?=
 =?utf-8?B?VzVmbHZSQ3FuYWRManV1cGVpZ0FnNVV6eWFDTmhyQTA1UDlIaTU4Z1UxZHQy?=
 =?utf-8?B?M242VUdyM3U3RXBwcjA1Yk5WTWk3d1Nwc0pPOUl3N21tUmVkSHRWT2hCNHRS?=
 =?utf-8?B?TEhvUW5QVTFlRjJVYXZqYmgzc0MxRzVVN0VoN1p5c01OTDhiekxrT3VmZ3hK?=
 =?utf-8?B?U0JIRXNGUXl6Vy9DUFhnQ3VWZWt1OUk2L0lBbWhIRWV6Ri9QUEQ2OWtsOHRW?=
 =?utf-8?B?ejd4RXB2Q01tTktZV1RXTFFPVVIxVU1sR1lDRkhyUkhmMytZRmpoSjdObkFn?=
 =?utf-8?B?Y3czTG5Vc2VIN0dzandXNXNHMWxKYnNCTi92djFmdnJLY2IyLzhPcFE0a2tD?=
 =?utf-8?B?RVphQnUvWHliYmVrUUFUUXN6M2s1N2lrWG5ZbW1SaFRBMDBFQnI1Sis5R1ov?=
 =?utf-8?B?cEtFb0N4MWZOaTF4UU1JVUxRQ2FuZm8wSUljR1BaL0hOUTdlKzRReTFnQ0hz?=
 =?utf-8?B?WlpEZW5yd29tL2NDMVJJbUI1cG5SNlRaVFpDdUcxaXY2R3BQYzI3d0hJRFRi?=
 =?utf-8?B?M2VtcEVvNmpwN3BBTm5BM1lvbCtBeHRzYWlLQ3k3TEtjSkNqZ2VQajY2c2li?=
 =?utf-8?B?UmUybGdVY1lLa3ZiUkRkMjNoam5tRlNmZ1ZoekowVXA5NGNlQkdyS25yMDIy?=
 =?utf-8?B?UlJXMmpiUndGRjdyeUdOMzBRaTJGUHJqdkgwNWZER1poQTRvdThCVlBIRWJ3?=
 =?utf-8?B?c1BEM3V6UFRsZ243QkUrV2cvL1p3NHpZaHhQV3FOUlU5OWRsN0ZMY3paaCtO?=
 =?utf-8?B?Q0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 76c577ec-6464-4012-512b-08ddcf46d0df
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6020.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2025 08:55:22.5723 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kMLiUPt98nBdrMw7zpdGRJjvUu2iL6lbHKv12qft42ED9nIePbHCPmOnddS+B1XGZWhxwfmXohupwEOp/K1X1jhrCxTGiu8b3T50XY6ExfY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9206
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



On 7/30/2025 7:48 AM, Aravind Iddamsetty wrote:
> From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> 
> Introducing xe_gt_log_hw_err and xe_gt_log_hw_err helper to
> report gt specific hardware errors.
> 
> v2
> - use _gt and _fmt instead of gt and fmt.
> - Messages should be same.
> 
> Cc: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
> Reviewed-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_printk.h | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_printk.h b/drivers/gpu/drm/xe/xe_gt_printk.h
> index 11da0228cea7..2f9baf7d191b 100644
> --- a/drivers/gpu/drm/xe/xe_gt_printk.h
> +++ b/drivers/gpu/drm/xe/xe_gt_printk.h
> @@ -46,6 +46,13 @@
>  #define xe_gt_WARN_ON_ONCE(_gt, _condition) \
>  	xe_gt_WARN_ONCE((_gt), _condition, "%s(%s)", "gt_WARN_ON_ONCE", __stringify(_condition))
>  
> +#define xe_gt_log_hw_err(_gt, _fmt, ...) \
> +	drm_err_ratelimited(&gt_to_xe(_gt)->drm, HW_ERR "GT%d reported " _fmt, \
> +			    (_gt)->info.id, ##__VA_ARGS__)
> +
> +#define xe_gt_log_hw_warn(_gt, _fmt, ...) \
> +	drm_warn(&gt_to_xe(_gt)->drm, HW_ERR "GT%d reported " _fmt, (_gt)->info.id, ##__VA_ARGS__)
> +

hmm, I'm not sure this is right place for such specific helpers

please consider moving them to xe_gt_hw_err.h or at least redef as:

#include "xe_gt_printk.h"

#define xe_gt_hw_err(_gt, _fmt, ...) \
	xe_gt_err_ratelimited((_gt), HW_ERR _fmt, ##__VA_ARGS__)

#define xe_gt_hw_warn(_gt, _fmt, ...) \
	xe_gt_warn((_gt), HW_ERR _fmt, ##__VA_ARGS__)

as likely the output as below is also acceptable:

[] xe 0000:8c:00.0: [drm] *ERROR* GT1: [Hardware Error]: blah blah

vs yours

[] xe 0000:8c:00.0: [drm] *ERROR* [Hardware Error]: GT1 reported blah blah

>  static inline void __xe_gt_printfn_err(struct drm_printer *p, struct va_format *vaf)
>  {
>  	struct xe_gt *gt = p->arg;


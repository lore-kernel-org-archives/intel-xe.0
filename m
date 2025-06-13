Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 932E0C71136
	for <intel-xe@archiver.kernel.org>; Fri, 13 Jun 2025 16:38:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 545B010E013;
	Fri, 13 Jun 2025 16:38:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K0wMSORR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A2D510E013
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Jun 2025 16:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749832709; x=1781368709;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=+K86vjRfI8uewG6U7Celeq2pXyvztQX7Lm9tLRxMYv8=;
 b=K0wMSORRszz7fAdJHObiDo7D5UipVfgOQerZ+41MEuZMnRo7oeA1OVjf
 1qTgEJGo9RUPpa5neZw0s2d4ziukBTJ9Cr5r+dkwl5fAR1UloN6I+kavB
 1DUWJSS70SG31XYxE7oTssTHWWRxbQGjtKZoiEzVkeZFg67RBJ/eKi0fP
 eUDV3fmvKsZr4k7bf9TjVLaxaoCTIKJd8p6dQnl1EpthqGEjlmvY04NQZ
 68Unwqc6SoMixWLEjl5umRiX6a5b7XIun1aVN0rUW6lrSBcwWcaXnnZl1
 Ll7vFylFTcseOH+6wAemEWqkhjTOm7VMvvutW+eKLvuwzcREeksRBLHgC A==;
X-CSE-ConnectionGUID: 627mJ8wnScyrhD9SGp4tkQ==
X-CSE-MsgGUID: kLIg4GMnTZ2JlY7lylzuAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="52149361"
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; d="scan'208";a="52149361"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 09:38:29 -0700
X-CSE-ConnectionGUID: IbkoKqLIRfuiftdZkd8M6g==
X-CSE-MsgGUID: 0ARrThHxTZOXA3BGTnLKFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; d="scan'208";a="178851602"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 09:38:30 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 13 Jun 2025 09:38:26 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 13 Jun 2025 09:38:26 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.40)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 13 Jun 2025 09:38:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wkPUtk/kMvAWvynG50gedniuDJBnculB/31j04g0QFis2pT7f6x0YnJZ7fubiqDmrKeXQeMJc02SToK5/jIsDxLiVYW9RgMiz+Nu2juAKOFcGV8IpfE2SY2ifpCIokQoGlgdvdcDkwkZZf33QYUew4o5HNpayqo/hBn0H4mMX32jRd7FgJ6d8P9FKcwH1ebjEHxmTSJUodot4GIGsX/GIzf2+zNSxGddfqlIT6xwJFbrfPnFcZJHTWoL+LihU7dYwlb/nkcXEsL+9/LcrYZXiEUElF5Tfv6KiXffpEGf52ukkz9lwIRqrQvl5HyaTcUbxDumrsG1esushPG/y7w9cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J12hAcUcMEmW/sMCKPbLrH/3U5iSJByb9SEtv9CnxVo=;
 b=hkSlj1fm8IoM4i6NGPxY7TB6dM0a6ySBJPRxCYBnbak8Cc0qoBP9qHJXOACUrvJTrJZHKCaXdc2vT57aryaVLdV7RxEX1XXUhpaZR23IQxl6y6XHd591Wa5QYYNKj6yRMQQGhgeUkv3+w8fL3UJFTyJsPfEiERVAf5b5FsTR8tyXh0Qn2IvoKYXFgDxjOnzv0NDwP38/Yj80QRfz3U7xyaa4q2IV21MG9OiJm6A0Yp9cy6HIWeJ9ZQpY3lR5IJ8d/ZbFDCUg5DsX71TaRzEyxZzmToOYpuDg3/wi0MPZdDxWgjWmRyTOiLBQjPx3bM6aRU9hJyRNuZp1kgO3q8Lagw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by PH3PPF23335A1E7.namprd11.prod.outlook.com (2603:10b6:518:1::d0e) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Fri, 13 Jun
 2025 16:38:22 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8835.018; Fri, 13 Jun 2025
 16:38:22 +0000
Date: Fri, 13 Jun 2025 09:38:12 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <lucas.demarchi@intel.com>
Subject: Re: [PATCH] drm/xe: Move LRC_ENGINE_ID_PPHWSP_OFFSET outside of
 parallel offset
Message-ID: <aExT9LQ-OsDMMLen@unerlige-desk.amr.corp.intel.com>
References: <20250612172850.4170428-1-matthew.brost@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250612172850.4170428-1-matthew.brost@intel.com>
X-ClientProxiedBy: BY1P220CA0014.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::9) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|PH3PPF23335A1E7:EE_
X-MS-Office365-Filtering-Correlation-Id: e52f2bb1-df3a-446d-c2f2-08ddaa98b5ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MkJkbFowS2d4Sm05Y2pSMFVPNmc0QzJZQnpYWENLNG1PRHI5UXRKUm5VbWJw?=
 =?utf-8?B?Yms2NHkyaUE2cVFwQXNHLzNGbVNHNWhsSU0wQzZ5U2VFRytyWklnUXFFejV3?=
 =?utf-8?B?YWM3M0RocXVBN0J2aUVKQi9OOFVVMHVzdTlqMWl4SStDMjlVSjlYTEZ4WEtq?=
 =?utf-8?B?S1hEUnFHWnhYbWZnc3J6TjN4a2IwbmdLQ1dUUVRvakNPVVY3N2s2WGYrLzBm?=
 =?utf-8?B?SjFwcmoyTy9uUW1tZWxxSmQ5cGFZN1NiZjg5YmE0MEJQWEIyOXFORlhTTm9P?=
 =?utf-8?B?dWMva0hvZHNUaGpjYmZZMTBOa01kT0pMbXRaaGhNMU9zeXVLK1ovNHU5TG9q?=
 =?utf-8?B?WSttdW5naTJuSWpnaWI2NmpZaVByTjg4Z2J4eTlzMkk2NU9neFpDcWRrTUQz?=
 =?utf-8?B?VisvdHZhK2tkWFZTWmF5UzFuaCsvUVVacURYUlJpYVlYRTFpRkhIcGpVY2R1?=
 =?utf-8?B?VUdRNE1zK2piKy8xdExwYmVwdlBqRzNCaDh6RE9PaFhJTUk4Q0l6cmE0Tmw5?=
 =?utf-8?B?QysxYzVhbTNFMjBUWEEyTktwdWs3dDFvUlNSYnVzNGlnQjdZZmZDZTFYUE54?=
 =?utf-8?B?QXhCb1ZuL3hIU1pBVXpCNFhCM2ZUUHRZVHZyQjJ6K2lOaHd2T1l0WkJoUUds?=
 =?utf-8?B?NWsyR2MvZlArM3dJWVR2M2tZSjlTTlVoMzdMWElDaDhBTWNhelA1YzdEOUdo?=
 =?utf-8?B?ZWVBMkszekxsRHl5cklxM0tvbm44OUlFRFJyVGpGMW5QTUFGSGEzbklBdTMv?=
 =?utf-8?B?ME10SmhvOVZRSjlGcXR1VjlKWHpUK2M3OWtJeEdseVV4TDNlM3l4blNXWnl6?=
 =?utf-8?B?VFpJYmNDYk1nanp5OEJrdHIrR0lZVDd0cWVwb0hJMExoWndvbVNrem5xai9B?=
 =?utf-8?B?Z3g5dWhFeE5pT3FIMXZXenp1eTN5N1FmT2lxNnNuRFN1QkJWaUFLTFh3dmQx?=
 =?utf-8?B?WHpvQzh6MFViN2lPL2lVeVBBQ1IyUTFwMTZBbm0zMVNOUlU1em1SdlQ4cjZ0?=
 =?utf-8?B?VWdCQnNmcGsrZVZaWk9xazJWRm8wb3Bia253MnBQWEoxRkJaQTVUalNHNlRU?=
 =?utf-8?B?aDhDdU9OeHJuNTIrZngyUDlqWEl2LzI0YnpNTyt4Kzllait2anpLTUtZM1Bm?=
 =?utf-8?B?c0QyejlmT3lnNG1QWU1zMmVPRC81OGY4TGpxMGRUYkFVN2pITFUzc0M5RFE1?=
 =?utf-8?B?cFRtaFlna3VRS2IxbGVoYklEVWhnNmlOdG5pN0ozZjdaN3A3U2VZQ1FPVHlG?=
 =?utf-8?B?T2ZYYlc3RUpYNkZ0WC9aS1dtZVMvV0Fma0hkQkJUWFRZVE9CSHo3YSt3Mk5k?=
 =?utf-8?B?V3BTeENoWjl1UEVXVHFoY21sTko0TGFhOWVhVkpTSkNQZXBaTmxUQlJwUjBS?=
 =?utf-8?B?YmE4blFFbkhZbXQ1aTVzMzVRb2o1MTZKd2ZkRENoRG1yUEJWZklBR0VKZ3Jp?=
 =?utf-8?B?amJ1OUdlR1NTbmxUem51QUZSdEhSalFNNEU2QVNhWlU3d1RvSzhJTmcrVU5B?=
 =?utf-8?B?dGxveldHWHBIdUJmTFFXZUhCWDY4UUxneVhRY1NyWU4xSXVoUXRscmMxN2M3?=
 =?utf-8?B?VHIvbStSSTYxaUh6aVEzRWFqdHdKK2NTamVHaHQ4SDZQbFBkUEgrc1V6RXBY?=
 =?utf-8?B?b3lHcis2SEk5RVh6RThDVGIvTXJ0Wmt1VHlqaW1tMmQ3bzFyakl0TlRQYm5y?=
 =?utf-8?B?anNNZ0JkaGZxdnFDWVluQktNaXpMZE1SNzdVVVd2NTN4OVc3aEM3RFUzWm5H?=
 =?utf-8?B?ZFplRHJKMlFyZUNBbTdxVmY5eXhxd0tkWjVZT3N4LzFQcjFsbys0MDBXMXVh?=
 =?utf-8?B?b2tqd285UlR3anV6bm9lNHErNmwrenFFZFhhR0djYjFmRUMyeUN1WFJQR1lV?=
 =?utf-8?B?YlhzNHZJYVVhMDZMemJjWGNmNDJtMnlXUlpmWjVrbzFrY2tpYVZDYUNwRm1C?=
 =?utf-8?Q?i9yGHdHAIYU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aFRaMW95cG4wMnhCMXRUSW80QStyaDZLTzFpL1ByTGxDdlZFWmNJZThLc0pm?=
 =?utf-8?B?RXpvL084cFRxdDlRc3VjSytFYlh4Mmg3elpiSFo5Yzk0YTdTYmVabVBkVTdP?=
 =?utf-8?B?Tm9JTm5hZllpN1UxNzE1MDhoeDRBOUkvcFo0TEplQnZ5WDh5UHJ6YjBjSjJS?=
 =?utf-8?B?bCthUlM3dFdlVGFPNk0xZTBaVElrSzRsQkFHVEJCYmYwWEQzUVhwRkxxaSt3?=
 =?utf-8?B?dEhMRk9tK2FReEhsSjdqbndQVUxaUUJ5emNOcmt1OUNLc2RZc3hhRGpkNFNw?=
 =?utf-8?B?V2UzeThjQUtQRlVHNHF0NlQyQWx3MEFXU24wcVRWcHR1VGIwekNrZWJWWFFQ?=
 =?utf-8?B?UFpNMXZPd1p0VEJ2SUxMaHhsbzBqZW1qbzQxbHNnK2ptanlVNlNqcG8wSTgv?=
 =?utf-8?B?NmE4d2pBTHQ1NjVCRHgzdTJpZ1kvalBtZ1AxYmd1TUM4V0FpTkdGY21HbHRE?=
 =?utf-8?B?RVo2a1BpdmxKM3dxYit3TDlJZi9vUWdJTVhJdFFYc3A5ZHdmZk5nQVFzSXR0?=
 =?utf-8?B?QTZiMlBGc01WLzA4eXVFWnorTEZhWmI3b1o1c3N4SDl2ZmNVaEx2WXBtOEpJ?=
 =?utf-8?B?YmFUTjhaKzYzd0VKSjg3L0ZVa1pJUWhpR1lzNmp4Lzc4VFVpTjAybkRjNFhh?=
 =?utf-8?B?b3JGaXliaGRxS0xHOTgzYUVydkdZb1lvdmpZazBHaVhmeXNZb0paSXN0NjBE?=
 =?utf-8?B?dkNYL1ZEakkzTTNzdCtQYzY3KzR5VlBFcythMVNna1M5SUd2bHIrRm9yWHhw?=
 =?utf-8?B?SlZlTGxjNmxLdXM3ZXNybS94a1o0dGhSSFBqZmhJb1I1NDF1b2hMWk1mdHhP?=
 =?utf-8?B?MFVpMnd5eDF2dGJ4Q29FUVNvTW1QUDlndGV3NTNsRjhEMDFRN2gxbk9EVXlo?=
 =?utf-8?B?RmN3M2ZTc1BxcGtkKzFJMmFRVkhxajF6eUhHZ2xLZi9XUjlMblBwd2RtTUVi?=
 =?utf-8?B?NmJaOTE1UEtGcUIyLzlhRTJpNTEyY3NtdW93VlNKTFY5MlU4Y2hXZHJuTVlX?=
 =?utf-8?B?RUlLaUZLVkJKMEUzK1UzUzdyUEVOeW5UOXpsdk5aRmF5VHFmb3R3ZzhKOWR0?=
 =?utf-8?B?NWZLVnR2a2hENjhnOVNBa0hXRmVEYW5ja1FOQ1hHRkNnUDJCQnFtQXhXUkwy?=
 =?utf-8?B?UkQraTVTbGRMRjlyWEVDUHhQL0ExU3JOV3ZSRVFTSHNIQTJXK2kvcDNYdENC?=
 =?utf-8?B?Q0hxTUdvdW9FaTlNZkFXbFdLRHd4ZkpjMnJsMEhPUVp2Q2gxZDNZUExPNEI0?=
 =?utf-8?B?MUxmLzJvQy9XdDU5OUVTbDYxdDRMSG04SCtyUXFEUHVZQ2p5K2tWQVVxVkZU?=
 =?utf-8?B?ZjF2a2ZINkt0cUdRb1MzWnFyYjNXbXNHWndWT0NqZnFlQ3B0ZWZteTNKWDBY?=
 =?utf-8?B?cG9vQVBick5SaUdnRllPdkp0Q0hJaDhNTjJ6NWtza0dUb1FCZnZPQSt5Z3pK?=
 =?utf-8?B?UkJYczhaRUdxbUllYmsxeFljOUJBd09XbWdyMklBby9OaXpzUmVzemFjOEJr?=
 =?utf-8?B?R3pNeUY5azBSNUJRK01VMEFKVXlQVlFyVGp6cGxrL0s1RU95RzJDL3FuWk9C?=
 =?utf-8?B?R1RIdjJ3dmhtQ1k5c2NnekxJYWNLWDJTMS8vWHB0WXFVRi8zUHJJUGlLRGJ1?=
 =?utf-8?B?ZzhENkRzVzV5SDhPRVg1UzkveVFKOEhmcjRNd1dyYTRBWUlCV0xIS2w3R0Nn?=
 =?utf-8?B?WTdJaGcxWlRoVGRxYWk1bXRKa0hSZWNqWXZkSGp1STlzaEduSFA0TjYrSDdI?=
 =?utf-8?B?bXJrQmFsNCtxbUpGKzlOblhZSjRsWmdjS3I0ZnBISGxHSU14am1yRi91VVRY?=
 =?utf-8?B?dDIzalQ2UzQ1SzE1Rk5yYWxwOWIrWjBsM21VOTJFb1EwRXZRby9rTVo0ZzJV?=
 =?utf-8?B?eHE5bUdHaWdXS1lrWjM4ZWN3eDlDQXo3YUZqajMrK21ucG1ydjlHWExsYUdq?=
 =?utf-8?B?aGZRQm5sVktsQkY0cFc3K245ZDdZeXZxMWlNTEVXcThEdzVJWG92dHhhMTBz?=
 =?utf-8?B?RkJrZTA1eFp5dWdkU255ajNmUFZGaFl4TjVCaS9vZ2l6ODZIYy9Dd3d6TVo3?=
 =?utf-8?B?Smd4RFc1N3Q2TnF4dHpmV255ODJmQ3Y0alBJbVJGQ3J6Q0ltVTZkaGNkck0v?=
 =?utf-8?B?Rm0vNU9DZ0pwOHNuSEhzVnZtdHViK2haYUtCWnE2SmlvaHVzK1E1aUFQWitO?=
 =?utf-8?Q?QYgEwXrm+TGvxuvl7ZCDrgU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e52f2bb1-df3a-446d-c2f2-08ddaa98b5ff
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 16:38:22.5123 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lme9mMPwI4nU0oDOrDc9W8uy3wfLyJLoa6nN8C28yURl77A46E9XK4Xu9mxPxFXG4z6nFl7cf3toXUQf1S1yaPRQCIQLto7NJsD/miOBJvY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF23335A1E7
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

On Thu, Jun 12, 2025 at 10:28:50AM -0700, Matthew Brost wrote:
>The parallel scratch layout spans 2k and LRC_ENGINE_ID_PPHWSP_OFFSET
>lands within than space. This happens to be ok as the offset lands in
>reserved part of guc_sched_wq_desc, but for future safety move
>LRC_ENGINE_ID_PPHWSP_OFFSET to the unused offset of 1024 below parallel
>scratch layout.

Oh, didn't know that. If you could add that info in a comment above
LRC_PARALLEL_PPHWSP_OFFSET, it would help anyone adding new stuff in
future. Ideally we should update the bspec at some point here - 77575
and guide everyone to look there for overlaps.

Change LGTM from utilization perspective, so with or without the above,

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Thanks,
Umesh

>
>Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>---
> drivers/gpu/drm/xe/xe_lrc.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
>index 529c6a972a55..6fb2a2ca4e78 100644
>--- a/drivers/gpu/drm/xe/xe_lrc.c
>+++ b/drivers/gpu/drm/xe/xe_lrc.c
>@@ -654,8 +654,8 @@ u32 xe_lrc_pphwsp_offset(struct xe_lrc *lrc)
> #define LRC_SEQNO_PPHWSP_OFFSET 512
> #define LRC_START_SEQNO_PPHWSP_OFFSET (LRC_SEQNO_PPHWSP_OFFSET + 8)
> #define LRC_CTX_JOB_TIMESTAMP_OFFSET (LRC_START_SEQNO_PPHWSP_OFFSET + 8)
>+#define LRC_ENGINE_ID_PPHWSP_OFFSET 1024
> #define LRC_PARALLEL_PPHWSP_OFFSET 2048
>-#define LRC_ENGINE_ID_PPHWSP_OFFSET 2096
>
> u32 xe_lrc_regs_offset(struct xe_lrc *lrc)
> {
>-- 
>2.34.1
>

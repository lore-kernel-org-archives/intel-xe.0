Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3DCAC36008
	for <intel-xe@archiver.kernel.org>; Wed, 26 Mar 2025 09:31:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 722EB10E68F;
	Wed, 26 Mar 2025 09:31:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KhFFoy7A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BF1B10E68F
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Mar 2025 09:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742981499; x=1774517499;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ttuY3Da0UE6wyPhLIWikWBWR++IIHp2PCaLEVsawewo=;
 b=KhFFoy7ARfGCcxeUuNqFXDKJj0RtqaRye4vkpqKf7v5IXBXaR52uNtQF
 iUXC7/V1HsL9UFyQ9xFbxaJo8TuGW9Wi9fdWR20l1SGYHy9qoc5v7adwj
 vW8AQQc3PhkgIKXb8mriMMIVQJyJ/ZsikY6uh595kNZ/8o+068oIsGeA0
 AqJhujqsHQnF3FLnJaMwvwyKte9FpfqCaZ7xk82H0MHNhO/sjD57pku6F
 8D/bA4YNBCW9cjtpRE4Cu32EiUN2PRzugxx0m12gzcp4iIX627BDguZCp
 uOIymr3Os4arZfcxs/ztJ0VVGlokp7JcQ6Q+Hf54NWzsgHBK57FR7iutW w==;
X-CSE-ConnectionGUID: 1v2lGn9ESa6JuevbKKBXFA==
X-CSE-MsgGUID: eNh8sQYzTMuLep9RtBn1VQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="48046532"
X-IronPort-AV: E=Sophos;i="6.14,277,1736841600"; d="scan'208";a="48046532"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2025 02:31:39 -0700
X-CSE-ConnectionGUID: Rc+kWfBiStyPHk2ubkFvRw==
X-CSE-MsgGUID: jWjnU4j1QRmPjC7vyOeYZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,277,1736841600"; d="scan'208";a="129879223"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2025 02:31:39 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 26 Mar 2025 02:31:38 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 26 Mar 2025 02:31:38 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 26 Mar 2025 02:31:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rQLtR/WUw1VpjiXopn4/mtEklcwoGGcRRMMPRTYJU9cbhPFJQZ/Oh0szYS+y231SWN124SuhLpIL5t8FzZqZpLDtQh0fSA5K/meOQlwMzsHSM5S/j82ea7z/w7H51WxXG6Ulo/zPwoIgi4TSJdUJiv3MXzpkWpLQA2FxcAwbSXJH5lAj17lTgWPJherJ5TwLklQJkc8rn+gqmN10LkPPLnIWgfOCANC7QStcluW0Bhr5By4Y+srWZJ3GD30uPPjGelll5fULotf1KcwY14DYL646l5JIENl4WkTrbtGsc9jUSC5DsahHVa6LQGWgMo2ab0fm8iWMryCFcp6tVY2GNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q68CaSJ6ZadPZ1al2A9THfFZli1HLsXkQ9EZnDdikkI=;
 b=x59EQTY2J8ANahhI8S3Q3A4GEK2ig4Mn21p7aE3dMPq1riuy/6tfjQS5Po4oHbeX7JkxpD3+TRB1kXceNlnxa+1Xupe5OMOKYhkuXJR97KYjYEeMLYqGxN+bRXRs45wg+G5HbUfPtQVI/VLjC9/n/kepN66i6I1xTtseVtePKWXT5xK3HifC/crJKePcWPbMrFZ+i5ICg0GQKQD6+IOZS11bq6jXRtis3BOvV+sosHzAmRj0mAy5+NgFEbb/iSYrs8M1NpAF6UeeEC7bUSbWQtxTt5XygszSW/oQ99+MK4TLqki8asEBpFSTQeqMwsn7bknutUkJWjiN//fsBrsZRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by DS7PR11MB7885.namprd11.prod.outlook.com (2603:10b6:8:d8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 26 Mar
 2025 09:31:36 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%4]) with mapi id 15.20.8534.043; Wed, 26 Mar 2025
 09:31:36 +0000
Message-ID: <079ba9a9-2a31-4b73-bb9a-078e12b9ae10@intel.com>
Date: Wed, 26 Mar 2025 15:01:29 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/5] drm/xe/svm: Fix a potential bo UAF
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>, Matthew Auld
 <matthew.auld@intel.com>
References: <20250326080551.40201-1-thomas.hellstrom@linux.intel.com>
 <20250326080551.40201-3-thomas.hellstrom@linux.intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20250326080551.40201-3-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1P287CA0007.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::24) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|DS7PR11MB7885:EE_
X-MS-Office365-Filtering-Correlation-Id: 00720ee4-d4da-40e0-428e-08dd6c4900b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RVZNdy8xQ0EzSXZFZzg3cjA5TDgzNmdaY0hBWmhtRk43SkdPTW90VkdaUFRN?=
 =?utf-8?B?NUNtUjNBQVNXOC9NSDBUZEJEUkpaaHlKRTdBZC9tUFVyUnhGS05makJnaEZC?=
 =?utf-8?B?aWVaS01uOHBwdlV3dDhMZHZVMGYwcHZEVVZuVGJNTS9nSC91Ym8xSS84SkNs?=
 =?utf-8?B?Y3A1aG5ENC9nODFOckVVZ3pMcjVrdGhtaGZKc0RQSG5kSG9hcm1UdTNXejF1?=
 =?utf-8?B?OHdRL0Njd055NGZpWEFjYmhNS0p1dWhOeDJCbnNGL2pHUjNvdlArVVFUZVZ3?=
 =?utf-8?B?NThqS1MvcnpBV0Y1dFBza0lnSUl4L2xKWFJ3K2NOSUc4bU40NThNeDdHTHVN?=
 =?utf-8?B?c1Y5bGZTYkhsaG1SeU5uTVZJdUlVTGlDdm91NThNTmdDLzhuSlQ4YzcrQ2RF?=
 =?utf-8?B?cENhU1BUeEZjNi81K3A3ZGliUDNJZHZxZENaWkZzRTNLaVUwd0ZoUHVmRXRD?=
 =?utf-8?B?M05XdjZUNFoyMnphUXpXUDgvTURBckJpcUhrRGFTVHg5SnVZMUE4QkpWMnJv?=
 =?utf-8?B?VnVQellIWWRkeEhnM1pPOE9hQk9FOWIwVFFTR0ZDb2tOOFpjWUkwa0tTb2ph?=
 =?utf-8?B?T1FHNnN6anJEMjgrZ0hMbUoxK1NIcDc3bE5zQk9nUHB4SUU1RSthTEZ0NlAy?=
 =?utf-8?B?cUM4VWNoTHNZbE5wQ0N0S2N1aFllVGxRcjFtQWpiS3JFWHc2V21Dd3RxdStl?=
 =?utf-8?B?VXhnT2ExeGlnczd2RkxBOFh3ODF6a1kyRTFodXpDUnA3V1JDSkpGN24ya1Jy?=
 =?utf-8?B?aDQ0NzVCRFA4NHNFK3pWVS9PRjREV3hoN0VIblNLRStBVEpvaUFxd2tSdUdO?=
 =?utf-8?B?cmFhbjlpdlBya2pmaWdJMzI0MHF2cU9LRVpzanJlaWdUbXQzWTcyNlp5a2Vu?=
 =?utf-8?B?aytHOFFlR2ZyS28zR0UxU2NobFJjS05CT05jdU5Pci9qbmpSdm1MU0tWbmVp?=
 =?utf-8?B?cE5xa1hmU2w4ZzRQc1NDNFNvYzYrQkVqQ3l1emY1czUvcDR6WUtpT0NJajQr?=
 =?utf-8?B?ZG04eDdmU1VGUkgwR1UyS3dKNENRQmlWMng5OU8vNWdxeVNQQXN3RzNyenE4?=
 =?utf-8?B?QTRZUm1UUkt5RGMveW81WGViQmpyZWg0WGVWNEpVTFhzWnhUb2YxUld1RHJl?=
 =?utf-8?B?QnB1ZUhnWEVQdjdWeEVjRW1VRU14anFheFYzTTBLREdDUEI3NXNkZys3aUox?=
 =?utf-8?B?b1hNZy9YOGwzSml1d0dSTGZLNElmdHRvRWpVR2sxZ2xKczN0eXZOanRDN29a?=
 =?utf-8?B?RjVxK3BudmpoeWZNdHlVdTlMMzVyVUlPQ1VCU2ZzSFV1eTBmY011dTBsTGhR?=
 =?utf-8?B?TmI4bHIvWE1Xd3NDczlUZ2lPNWYzUXljclhWWWZhQlhMUStERDlPMVZQMmpj?=
 =?utf-8?B?cnF0QTNDWTJNbDFZRnpDRy9iamZmMTZRYlBsRVFJWkdOSDJWMkdpV3QvVHo2?=
 =?utf-8?B?emQ0U2Nhbys3S0VuZUdFR0FNeXMrNms4TlZNaFgvUHNQVW1pcVZkNG4vUVMx?=
 =?utf-8?B?TmlGbDcxdklkT2ZOdG5Vc3doTUE3UGdjT2R2N3RNYU9BbmZwRll2RjBvUHNi?=
 =?utf-8?B?T0IraTNWMEF3RjBXVFlsVXZ4WHQ2RXlzZnJYTTFGakUwN1BpbGpKZDd2cDgy?=
 =?utf-8?B?SzZxK3NlUHlVTUNNTGowQlk4MFVTQXRzNU1ST3lEZTB0ZHl4MlcvOHl6NURr?=
 =?utf-8?B?NnJrbnN6ckNpY05ZQ0phQVJwYTd3NU5DSms3Yi9mSVBTeENaV2tXbTNXQXdN?=
 =?utf-8?B?a3BCSFg3NTgxSFBIbkViQXRFZW91akRERlYyOW9NYWZ1blpONGxXRCtpRjBH?=
 =?utf-8?B?Mm1rUElQdUFKNUh0bVRQZy9jSWs5b0lKeXFyZHZYSnJ0MlVKM083V0hFQkxR?=
 =?utf-8?Q?lX2rAqPHLq3Wu?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NVhjNkszcStXbFJIV0hvait2WGNFbW9xY3hiTTNQK3VpeHZtSWp2S1dUWmJN?=
 =?utf-8?B?QWRFcDR6RUNuMlpPaVh5cmwwMkZDeFZ4Y0hpM3NibHZKbGI3YWc2aHlCNE5r?=
 =?utf-8?B?WDdJeHNiT2UyV3F0QXpoWHJGS3V5NUdpa3NESnBvYlRyVlNmbkV1STVtTHVP?=
 =?utf-8?B?QVNBNlpMa2NXMjBrbEhmU3NTOWxWRGc2ZzhGbEh0YkpMQmg5UDZBMm5PMktW?=
 =?utf-8?B?bktIVmVoTHlDK09NZmUzMmM2bHpCcjNtOS9WbUIvd0xBTUc1aDJ2TGppd2lE?=
 =?utf-8?B?Z20yRCtqUUpGZU91MEE5dEZuVUpiTC9OeEJja3Fpd3FVbnE1Z1l5L00xWGlN?=
 =?utf-8?B?ZDY5VVNHNE1OMHlMZTFySEdLNzllOEVyeEhSeDZReDJNOTRwa2NqbnZrSW1z?=
 =?utf-8?B?c0hPT1QweFo4aGRoUG9vMEs2TU5SMGtyQkh5NmpCM2hsakFkZHdXMFdRSkYx?=
 =?utf-8?B?RXhiSUJMby8vN1NtNkRYL3czbTQ2Wjh3cXUvcnlOWmpLNGt6VXk0QlVTaXVY?=
 =?utf-8?B?MGJ2djcxTlJRTmpNNVBlTjB6a1ZiRG54VEQvV0Z4UUZ2ZDZTR20vQTBaZkRW?=
 =?utf-8?B?NXhpanNSbUVQK2hNM3AxekxTNWFzTmUvZmZOTkdiRTVqOTlxb1JNTTdvbVVH?=
 =?utf-8?B?alBrV29MajlORnRKS2RFK0NwMkxUL2lHZ3BBQ29qU0NObTRNTG96MEhmSFNE?=
 =?utf-8?B?THA0T1V1R0dPUzJKa3NxRExTVUtUN3M2bnQwZzIyYWNuaEcwZVZ4Z0Z1dUZZ?=
 =?utf-8?B?U0w2OXRac0RFZFZ6ODNaMGJURURWSFJOd25DSXR6ZmQrVGRKUS9ORkNNRFR1?=
 =?utf-8?B?QnM5dWlGRmFVNEYrL1ZFN3ErRy9nWFJiNTV0TEh1ZTdaNkJIS0FUbW54dkJO?=
 =?utf-8?B?VWRPN3pZYk9NeHpzOVczek9rRnVvTnBuQytqUjZaVmRrdDdEMHpwdGloaU54?=
 =?utf-8?B?L3RSaFpMb25yTmRKaHNyYlFBMTM0NkdXeE0xUWNWelowbjV4aWVTWWR1U21m?=
 =?utf-8?B?b3g5Z0lQWUphRndjcmtCc3o3aDU4RDdWUlBucUpWU2ZzOHhwcFJ0SnUzSEFj?=
 =?utf-8?B?d0VQMTZxdGdTQ1VkS0Y2YUdjUWp4YnZ6Mmk5UWRpTTRLZnJRbGpKbHlpMkE5?=
 =?utf-8?B?ZERWQmVhUktvZll0NUVEWEt4OHJyaFNINURZR3BzemluVzI2MUZHT05COTZq?=
 =?utf-8?B?RlBaSVdBVkxYanVZdDZSZG1WYTR0OVJHLzZ0bWFZWVZMcE9Yc0YwdnlRb1Bj?=
 =?utf-8?B?VVc4Q1FmelhFWWtXbHVrV2owcTVIdUF1Sm5oZXlaT2tySmNjSGlJRlR4OGc0?=
 =?utf-8?B?M210SEgvZFVvKzIvWjZRb2hIUk1nYkU3QW1DUHg4bmtxTWw5bkdIbXN4REo4?=
 =?utf-8?B?eVZyNUtURWlhRTFwNUNKeWhmZ3NwYWIrSWF4QmVEUXhRSGljR2xxWWFaMzlZ?=
 =?utf-8?B?RDV4T3NtLzBUVE1yQUcrVm8zVmZsRjd4MnRTRitDMTAxeXJBZWwzZ08vRXF1?=
 =?utf-8?B?UWNpVC9vRVZjcE4wREg4ZWJBWkl3YmdjeEpueGtHWktlK1g5V216aDE3Q1p1?=
 =?utf-8?B?QnMreVpaV1djUHF0U25FZDJ4RTVjbW9GdW1WcnlpbHJuM1JrS1RjQmlDRTJG?=
 =?utf-8?B?WVNXb0lVK1BqSGF1YmtQZUJVNklhYlByQ0xheUtUSGhBWklHRVFsT3ZMcXIz?=
 =?utf-8?B?d2NJVEdZNzA0R1FFQkZhanQ3WXU4OGFiSHk1a09rQ3FPRGhsdVlWRE9kUkZ2?=
 =?utf-8?B?dkFYKzRGL2UzWUZCdmY3c3Q3VDFtN0ZmS3RpcC9vVE9zcEhWTnloQng2ck5p?=
 =?utf-8?B?Zld2YUcwQjNSMzlwR09BMnZTMVJON2Q5U1I1eWhpNG9PbmZTdTU2cEJiNTRa?=
 =?utf-8?B?ZGtrSTZyYldENlZBaUhqT0FJWklwZW5qMG95Y1d3Q25GRlZaZ3VudWUxOTZ4?=
 =?utf-8?B?a3dRTWlla3dzVDVFam5nRzVjeHY0RnhIMkFQbHg5eVZOelVOSXUvVTRKb0d3?=
 =?utf-8?B?cWg5clFRdEdMT1dSZUhCT3hSVFdBTFV3dmtMazd6cnA4aTlEbzVCZDNFYlJj?=
 =?utf-8?B?alRiM3hDc0c0ekVpMDBlRW4wZUFrQnRjem1RRml2NGtWSXhqNzJuOHpkVGpY?=
 =?utf-8?B?QUQwRzA3ZmZBUEZGMWNHbHR3YWVwL0hQNDhGZEduc094eGJqRHIwZHhQOWxF?=
 =?utf-8?Q?vukX6IzH4Zaz13w4k8JVJ1c=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 00720ee4-d4da-40e0-428e-08dd6c4900b9
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 09:31:35.9761 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N6PkYpmBFk2eKOUxSHpzqPJDwwCy+4QPOAVmMnSClTUHdkp0uYyBWlOBbi+B0xJvtfbcuump/OyWhO6eMB0MG419TjUvKXjRqjcs3tfyFKw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7885
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
> If drm_gpusvm_migrate_to_devmem() succeeds, if a cpu access happens to the
> range the bo may be freed before xe_bo_unlock(), causing a UAF.
> 
> Since the reference is transferred, use xe_svm_devmem_release() to
> release the reference on drm_gpusvm_migrate_to_devmem() failure,
> and hold a local reference to protect the UAF.

Fixes tag ?

> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_svm.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index 52613dd8573a..c7424c824a14 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -702,11 +702,14 @@ static int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
>   	list_for_each_entry(block, blocks, link)
>   		block->private = vr;
>   
> +	xe_bo_get(bo);
>   	err = drm_gpusvm_migrate_to_devmem(&vm->svm.gpusvm, &range->base,
>   					   &bo->devmem_allocation, ctx);
> -	xe_bo_unlock(bo);
>   	if (err)
> -		xe_bo_put(bo);	/* Creation ref */
> +		xe_svm_devmem_release(&bo->devmem_allocation);
> +
> +	xe_bo_unlock(bo);
> +	xe_bo_put(bo);
>   
>   unlock:
>   	mmap_read_unlock(mm);


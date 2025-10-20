Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFBF2CCD1A2
	for <intel-xe@archiver.kernel.org>; Mon, 20 Oct 2025 23:47:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7420510E53B;
	Mon, 20 Oct 2025 23:47:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FKe7WYLc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1FAF10E53B
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Oct 2025 23:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761004026; x=1792540026;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Kzf5etWEAeE/XT4WUM4egM0xWrT/qGWBe1IlqYI6t40=;
 b=FKe7WYLcg9osELeqVbwKG9DkNj8sYeArE/c3zIimEgeDthCeCABiI2lh
 aLwBufVesbBUtr5++hb5YHnCvBFvWVA7xubt15GEt1fOag96utNILHm+c
 l9WjRHPjLJ6vWBjE/E6no1p7JO9HE10zJn1QOjl0PnCPOBBdYrpUJtUGX
 +6X8XF25BRAIbHb7b3bC46af8ZJlVUNuOHN0mT6SgqOTcNxVMCy2pLO5N
 4YGtXCGOx5v3kvbvvzyzMg3WCbnU5dbqwxoDHQbANZWkA2ThEgi5dV461
 KBkLlPwHaMXK26KkIr937h70/zw5tHmtajDH76RIHlAzvvWbh77Eij5M6 A==;
X-CSE-ConnectionGUID: MkGELSvWSPacA16Plfsbng==
X-CSE-MsgGUID: Wko5IM9pRceALIKCRduT1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63276332"
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; d="scan'208";a="63276332"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 16:47:06 -0700
X-CSE-ConnectionGUID: 9o7BSG9CS464CXm33pGLlw==
X-CSE-MsgGUID: Tj2VpFkZSBeGpJu0JGpyqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; d="scan'208";a="183154197"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 16:47:04 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 20 Oct 2025 16:47:04 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 20 Oct 2025 16:47:04 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.33) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 20 Oct 2025 16:47:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KyAFmf9A+vznYXwo4BeOMggaxsnj3OchE4FaTNSHhYzwK8/M0j8ZyCzTb2ckJuGq3ou7QW2WarrxijGQaRlvKf4nHD6RaN7BnOWOk9Qjeu38sJ4k/Y2S/c+0d0RvyxCn7xFW1HG0iG+SqvpwjpfHCJitTto1iBTODsFOR99jH/qeISk0/Bl5i9qo1fxAvCKJxzzeXEcHaym6Fh2jms8or9RUwV6x2e1hz2cSxeTiy1sMTd423WWPa9kURoovaa7+6LXEWFbEjPsy69QDnTfA3g9qRC6/lCpBMmjSTOe7OKE3LfEG7DnCDeZ5WE8NkBwLiAiZj5IhUkYB24onoGm+Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m/qd04EELpf9gwZtoWOibW7A83ULCsE9H/UcXvWniyo=;
 b=oSYikXH/Dj6axdUIpwBR7Av/ixccgsvlE5gp5JeENwbTV9p28154wLMz07V7MY3wbrYc1eZ9luQKABh/zmYNPYTnKQHCereuxSVnHwYi6q5q6hLPw2bcOm6pMlKG6GD+SBTItALlMe+IfZos51He8Py9KYApDGVWNEd+NJFQ7TVzCHRWzak+KzEJmMCDr9S+aErWfXXRDB3TubBTwIEFnSsczQGTIwP78WLL50mf6Ys0AKdLx7L/pi40kV2SnrU3ZGtfz4Vc3cMGDeicC/PLhoR79xYJmumKLlbCzIdx7WniSafOWGZRATITlryhOpFQfLx6bzUNWn4n+igWmakWtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9226.namprd11.prod.outlook.com (2603:10b6:208:574::13)
 by PH7PR11MB6379.namprd11.prod.outlook.com (2603:10b6:510:1f9::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Mon, 20 Oct
 2025 23:47:02 +0000
Received: from IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09]) by IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09%6]) with mapi id 15.20.9228.015; Mon, 20 Oct 2025
 23:47:01 +0000
Message-ID: <3784d12b-26ea-4554-ad48-f90885fca2d3@intel.com>
Date: Tue, 21 Oct 2025 01:46:57 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] drm/xe/vf: Fix GuC FW check for VF migration
 support
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>, Lucas De Marchi <lucas.demarchi@intel.com>
CC: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, Satyanarayana K V P
 <satyanarayana.k.v.p@intel.com>
References: <20251020205808.1187308-1-tomasz.lis@intel.com>
 <20251020205808.1187308-3-tomasz.lis@intel.com>
 <05e13fdb-cad6-43da-95e2-174ccc919833@intel.com>
Content-Language: en-US
From: "Lis, Tomasz" <tomasz.lis@intel.com>
In-Reply-To: <05e13fdb-cad6-43da-95e2-174ccc919833@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0029.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::29) To IA3PR11MB9226.namprd11.prod.outlook.com
 (2603:10b6:208:574::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9226:EE_|PH7PR11MB6379:EE_
X-MS-Office365-Filtering-Correlation-Id: a294e8c7-b3d2-4ff4-875e-08de1032f739
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cDArT3Z5Zy81Z0pmM2dXcjBDY2xuOW5aZWlqdnVxK0llMGw3eWVnY3hHZm1h?=
 =?utf-8?B?K0FreXllaXQ0WUZOMEZRNXp1NUtOaU93MHN5cXNYY2hENWVaQm5EVHRsVlNq?=
 =?utf-8?B?T3JmRGRKN3NJM1lyMzU1OXRjTkgxTEZZUFJLeHRPU0pVQUFxY2Iwb1R0ZkZl?=
 =?utf-8?B?NFB6NEoweEJ5bzduMGVoVUlCaU1VVmsvcThTbDY1SHBMekRHYmZJLzc3cUF1?=
 =?utf-8?B?U0xMT21ZNzBWWkZYRmw3eFU3cy9KdTRtYlUvdEFVcTVieDMxOUJXS1BGc1hH?=
 =?utf-8?B?MEFMVUJPd2wzdEx5Wi95OFVPRStWM2FiY3J4NDFMdFRWdzltVmVjT01OSHlS?=
 =?utf-8?B?S1RIajRaM1Z1bU5wOFVRN0J3UkFRcU5vRnlXRDdHMTRwdVIwRXpkck80U1BQ?=
 =?utf-8?B?RnJ6QjIrVXhaZXlnT0FyQUpOWDNaTnkzUWZ1MXNJSzlpZXpVelJlbDVmUm8z?=
 =?utf-8?B?Y085UkJydHNoL3dheHZRa2J1WEpocHlQUm9nano1aVRqTkdLbnNUU2N5Y3dR?=
 =?utf-8?B?WFI0a2VPc0tISnl2SElqczNjSXN4UmdQc3VHMm55TS9ZYlZpbmdXcU9xblRT?=
 =?utf-8?B?UDFDNmFwMmZLT2cxR3FnNVZvTXJYejNUNjZlSVNmWXo5UW1ERmlmS2o5eVdW?=
 =?utf-8?B?bU02Z2xvTEtnSlBMZTliOHNjeVNvU2FoM0Y5ZUlPbXhtQldXUld2R2ZSV0xK?=
 =?utf-8?B?ZEZmM2tkdlhjaVFLbDM5TE9iN2FJWUlaNW14b1RZWVFMeVJhYnpIdGVmc3JR?=
 =?utf-8?B?UERWb1VsTE5nZVZpK1ErZWQ3czRKK09tK0VaN0RwVGMxNnNSdHZ5ZEtVL0d5?=
 =?utf-8?B?SmlhMWxpNUh6UENtVDhIZTB0V1MrMHhLRFVKek1NbXZDcHN5ZmFjN2pKanR3?=
 =?utf-8?B?VThOSm53cW51OGVPbDlBK0xlK2lJV3NVMnJkdnhGWnFpTytvSlhzRDZoQWJh?=
 =?utf-8?B?ektWNHYxL2pkUGkyYjMyVml2RUdKNkZBNE15d2pFZnhSRzlvZ2Qydmw4czZW?=
 =?utf-8?B?aDlHdTcvc3VWVXpOZXRmMGgwQjB2WWk0S3lhR2xzU0ZhWVVhVXpORWQ2bFNa?=
 =?utf-8?B?UFYvampKMDhwdmNmM1hEeGhWM0FOL25zUHhqenl5Y0V5SDB1bFhweENDOGdV?=
 =?utf-8?B?UzJlOXBnUTVycnJXWCt0RkNWWlU5U0VvRDdMQXBLaU1kMDhIR0JkRFBIbEkx?=
 =?utf-8?B?aGRtRTdnNWtkcWJRdHplS2p1a2lGR3Y4cnZvdnNUR29WQ1VXS2g2THd4T2NJ?=
 =?utf-8?B?dFcvQ2I1NlZkUlRRKzFMcmpvU1FIQ1FmWnc0WVBNb3pRbGVCWUtKYUN3VEdI?=
 =?utf-8?B?R3gxaVU5c0VoSnVsdjVuVmZjaW5PaW5mNFJJVmNFMW54NGw0Ync0c0JueDFq?=
 =?utf-8?B?WU9semlqQnoycjNjZUVmc28yM3hTWnRvRnhKbGh2YlBuZHNpcjQ1NS82K1hw?=
 =?utf-8?B?L29ueFJnTnZudnYvT3BzYlNNY0RmMC84VG0vUGtDZEVaS1ZDY1RvdThtcmxF?=
 =?utf-8?B?a1dvdGZmTHR0U2svSS92MjM4dFlCaTZucVljb2duQlExOFhRUkpEekkrVnVN?=
 =?utf-8?B?R0xZdWlLdDdKZHViSnRFb0pyNk92Y0xTV3dLUEpaYk5Dc25zZXdZd1FxOGRo?=
 =?utf-8?B?aFhWUk5ldXRXS2FxTHhlYjN5QzZtWXBPY0tHYlBjVnlQSWUvaENpOFBBQStZ?=
 =?utf-8?B?OWtTNk1hSUVOOW9ZcW1DLzYzVlV0RVhMbTZRZ2FQRmsyWHg0YXMxTSs0OWNp?=
 =?utf-8?B?czdmZHdwaGJZYVFKU1FVeENhN3ZjRHE3R2tFSWlvTWwxQzNUNElJQnZyeGF6?=
 =?utf-8?B?RCtmSDdCb1M3TlRZbXRkYmhiQWhidWNjN3lJUnFyY0dSS25hb0toY2oyQ3kz?=
 =?utf-8?B?TkZ1WmI2bm9WaW0rc2I3bTBNbWVteVJ2bUZWR2l0b0xSdVE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9226.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SmFXdFNZdXpMT0ZONzV2YlB3VDdNVVhBZFZ4d1hzSGwrOUdKSDFyWjduR0w5?=
 =?utf-8?B?Ynd0RVRVTmt4TER5cGltS2pxUWZza3F6UXJ6bW9pMWZHQjU5SHJxRm1Sd3dS?=
 =?utf-8?B?NjV4UWlVaGVTU2dXK1ovZGt6RnBmYlcrY25HTEJvSFhrRWhVVVBJV0RxZUZ0?=
 =?utf-8?B?S092cDlSbWlnWW5lbjQ4NnFmOVRIS2hCK3dHNnpkdUt0TGFFN1Nkb3BXdWZS?=
 =?utf-8?B?M1NuZFpZMjBFRGE5a1EvZkRvQThaNmZWNlF4cVZJMU4xaFlEZnI2dld4V0s5?=
 =?utf-8?B?YVRKYVRDSzk1dUNSYmpMamlsUTJqcVplRHRlRnhrQkZNanFKdXp4U3BEZTRM?=
 =?utf-8?B?Ylk0Ky9qdm1DWTR0cTNJV2ZCMklFWXN6Yk5Ec0Z5U29JRUJtQnkzY0ZqUVBo?=
 =?utf-8?B?aHRpSE9jK3EyaHZxQXhIWkZRUGV4L1V5RjF5bzJtUk8zbklCamMrL1BPeFlD?=
 =?utf-8?B?MEI4ZFBGT2c5SkVZbWFaMUtqeGRrQ2YrK1N6VWxzUHBpeUQrbTZGekNsMGlq?=
 =?utf-8?B?V0Nka3A4WjI5VVFzYVFybmkwM25QaXZBSTZTNVNCYmNRVWpFb2tGY0RyZzgv?=
 =?utf-8?B?ZG5Yc1FLRWthL2c5T2V2cUhjSWZJemtRMlpLOTdUUEVrOW42cFpNWXlPZm1W?=
 =?utf-8?B?M0VCK1VJSXJhcWZxdnVFaENZZ09ld01halgzQ3NIT0xqTWkvNy9sRTdMUFBX?=
 =?utf-8?B?dUJ3VnMybU11dzhxZlZJQXl0M2hZWWhJSVVmeFdQNmNJTXdQTEFjNElBZEVs?=
 =?utf-8?B?OUR3NFhvcDB3QytuVVBFRXAxSWUvOEpHNzE0cXFLODN0dVdONDd3NHkrZ0Vl?=
 =?utf-8?B?TFQ0ei9HRS8veStydVVYWXdXL0syRzN3ZkJqTHlTeThnelVBSS8xeS81ck15?=
 =?utf-8?B?QWJhRXRzUThHY0REejBPQ1BsQWdkejVCbGd3RERsR0hRd3hLT0J4YlZuZElF?=
 =?utf-8?B?dHNtV0VndzRWREsybTBITmpkRitmRFAwa0ZPeUNjelZ6eEtjNlVIZDl3RDZV?=
 =?utf-8?B?UmRXK1BGTlF1dzRXZ1Q1bTdyMVZ6ZnV6dnhGVlZOU3U2Q1dpRGVEc21BT2pZ?=
 =?utf-8?B?Z28wZU1HK0RhRnF3OTRIOHpuNkRKRUVQcnB2aWtjVklCVlpDQmpEenM3RjRZ?=
 =?utf-8?B?K29TTGRzeXBad21rSVk5US9wM0NLZU5qUitvbFJHYnE2TGNGSWZvT2xGUllj?=
 =?utf-8?B?N3hjWHRNZ2M5WEVYSTRUU0MrTjBkaTduQm81cm1WN3pNL29qYndpbDNscVBT?=
 =?utf-8?B?M1duaVRLb0pTOUtlMWRNQjFSdE1OcUovOWpxaGk0a3hMbHNlc0tkTllmei9Y?=
 =?utf-8?B?U0NwL0owbXVMcnRFOEsrS0UwdTFWQ2VvK3ZnM21DM1hMQU5JRmtWbVNrb2tR?=
 =?utf-8?B?OW40RFRxUEx0cXcxelhRdnIrclRaUTJiZWtKWjJlbVd1M1RFbndqbVRmK0Fr?=
 =?utf-8?B?QUZVRXFvNEEyZys1dm5WZmlLaXV2cHBnMUp1QVJLUHJIa1FSN0huajFzYWdr?=
 =?utf-8?B?ZmR0eUJOZlpnNTdRRUxhazUva21zc3QzVmdEVS94Y3dnbXRhUzRhM1dqVlR0?=
 =?utf-8?B?eHRrbjhCSUNSZ21LWDVRZEVQMWVRQ1YyaE1FRUJjbTRUN0tTaVpNY2lQNzRS?=
 =?utf-8?B?dldzTE0wa2FmRndpZm1tb1JDRWRKRU85KzNiVHR4bE5mRU9qWnNsemt0bVlZ?=
 =?utf-8?B?eFdRSnNoOUYxTTFGYm5lVEFuTzV4UzNGRHZtVHVqbmlzYXA4djlXLzNSRnRr?=
 =?utf-8?B?YkZTTmNqZVRrNER1SXhSNEdMT1JRbFkyd0lVNXQrMTNtLzBHejJodm9rV3dJ?=
 =?utf-8?B?ZU1wY0o5WXhpVXBOdzVDdEU1RytmM2htbVMzZ1JmZXFHYVZFbHc5UXZoU1pN?=
 =?utf-8?B?VWVwZG9GeFdJSU8zaStWSlU4NXZLNi9yYklqOGk5aGdNWEVRSWZCcDQycXlR?=
 =?utf-8?B?QXRGODNJc1lZTFBtTHFKNEsydHZaVHZEb3cwSlFGMnFhN0R5ZnBYUWFHb0Fq?=
 =?utf-8?B?WmpTeTdMd2tFQ0dZUUlnOXRsVzZwU2FyUzVvWjM3SlQ2bkxHY2tSN21aRXZp?=
 =?utf-8?B?ZklBdFV5azBhb1ZtQnRmRFc3UzFZQkIrSFljeUFwNm53ZzEySG1hZVpNYW4r?=
 =?utf-8?Q?gYLsmoF8/1/6q8e7cP2yCoM8H?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a294e8c7-b3d2-4ff4-875e-08de1032f739
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9226.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 23:47:01.8321 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pnaOJovdSIUtf4zFEHVPwsUF7PQ/ghtlC4V4z2bhOmygjtroOvaYHjiHk6lRJ0opY5QG0SOnxNVkQUZhhaNb/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6379
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


On 10/21/2025 12:17 AM, Michal Wajdeczko wrote:
>
> On 10/20/2025 10:58 PM, Tomasz Lis wrote:
>> The check whether GuC ABI version meets requirements shall be
>> performed after said version is received from GuC.
>>
>> Doing it in wrong order was triggering a warning:
>> xe 0000:00:02.1: [drm] Assertion `gt->sriov.vf.guc_version.major` failed!
>>
>> With this change, dislodge part of the VF migration support check
>> and moved it to after GuC handshake.
>>
>> v2: Use xe_sriov_vf_ccs_migration_bb_needed()
>>
>> v3: Update commit message, move check funct to ccs module (Michal),
>>   rename xe_sriov_vf_migration_disable(), remove its duplicate
>>
>> Tested-by: Matthew Brost <matthew.brost@intel.com> #v1
>> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6349
>> Fixes: be5590c384f3 ("drm/xe/vf: Enable CCS save/restore only on supported GUC versions")
> hmm, but this was likely working fine until this:
>
> commit ff1d2b5e3d28a62e79c89d2b2ab28ef5eaab84d8
> Author: Matt Roper <matthew.d.roper@intel.com>
> Date:   Mon Oct 13 13:09:50 2025 -0700
>
>      drm/xe: Read VF GMD_ID with a specifically-allocated dummy GT
>
> so maybe Fixes: shall point that commit instead?
>
> @Lucas ?
Will accept whatever you say is right. It looks like the fix tag relates 
to a commit, and I filled it with the commit which introduced the code. 
The comparison never worked, though maybe before Matts commit that fact 
was concealed. Since the commit I pointed, we were not comparing with a 
version received from GuC.
>
>> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_sriov_vf.c     | 24 ++++++++----------------
>>   drivers/gpu/drm/xe/xe_sriov_vf.h     |  1 +
>>   drivers/gpu/drm/xe/xe_sriov_vf_ccs.c | 25 +++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_sriov_vf_ccs.h |  1 +
>>   4 files changed, 35 insertions(+), 16 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
>> index 911d5720917b..3a3cd9c35aa8 100644
>> --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
>> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
>> @@ -133,7 +133,7 @@ bool xe_sriov_vf_migration_supported(struct xe_device *xe)
>>   	return xe->sriov.vf.migration.enabled;
>>   }
>>   
>> -static void vf_disable_migration(struct xe_device *xe, const char *fmt, ...)
>> +void xe_sriov_vf_migration_disable(struct xe_device *xe, const char *fmt, ...)
>>   {
>>   	struct va_format vaf;
>>   	va_list va_args;
>> @@ -156,25 +156,15 @@ static void vf_migration_init_early(struct xe_device *xe)
>>   	 * supported at production quality.
>>   	 */
>>   	if (!IS_ENABLED(CONFIG_DRM_XE_DEBUG))
>> -		return vf_disable_migration(xe,
>> -					    "experimental feature not available on production builds");
>> +		return xe_sriov_vf_migration_disable(xe,
>> +				"experimental feature not available on production builds");
>>   
>>   	if (GRAPHICS_VER(xe) < 20)
>> -		return vf_disable_migration(xe, "requires gfx version >= 20, but only %u found",
>> -					    GRAPHICS_VER(xe));
>> -
>> -	if (!IS_DGFX(xe)) {
>> -		struct xe_uc_fw_version guc_version;
>> -
>> -		xe_gt_sriov_vf_guc_versions(xe_device_get_gt(xe, 0), NULL, &guc_version);
>> -		if (MAKE_GUC_VER_STRUCT(guc_version) < MAKE_GUC_VER(1, 23, 0))
>> -			return vf_disable_migration(xe,
>> -						    "CCS migration requires GuC ABI >= 1.23 but only %u.%u found",
>> -						    guc_version.major, guc_version.minor);
>> -	}
>> +		return xe_sriov_vf_migration_disable(xe,
>> +				"requires gfx version >= 20, but only %u found",
>> +				GRAPHICS_VER(xe));
>>   
>>   	xe->sriov.vf.migration.enabled = true;
> as said earlier, we should change the logic to
>
>   	xe->sriov.vf.migration.disabled = true;
>
> and set this in xe_sriov_vf_migration_disable()
not sure where this is going, but will invert.
>> -	xe_sriov_dbg(xe, "migration support enabled\n");
>>   }
>>   
>>   /**
>> @@ -198,6 +188,8 @@ int xe_sriov_vf_init_late(struct xe_device *xe)
>>   {
>>   	int err = 0;
>>   
>> +	xe_sriov_vf_migration_ccs_bb_support_check(xe);
> why not move that to xe_sriov_vf_ccs_init() called just below?
>
> then you will not have to export
>
> 	xe_sriov_vf_migration_ccs_bb_support_check
> nor
> 	xe_sriov_vf_migration_ccs_bb_needed
>
> as everything will be in xe_sriov_vf_ccs.c

right, at this point it makes sense.

-Tomasz

>> +
>>   	if (xe_sriov_vf_migration_supported(xe))
>>   		err = xe_sriov_vf_ccs_init(xe);
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.h b/drivers/gpu/drm/xe/xe_sriov_vf.h
>> index 4df95266b261..e967d4166a43 100644
>> --- a/drivers/gpu/drm/xe/xe_sriov_vf.h
>> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.h
>> @@ -14,6 +14,7 @@ struct xe_device;
>>   void xe_sriov_vf_init_early(struct xe_device *xe);
>>   int xe_sriov_vf_init_late(struct xe_device *xe);
>>   bool xe_sriov_vf_migration_supported(struct xe_device *xe);
>> +void xe_sriov_vf_migration_disable(struct xe_device *xe, const char *fmt, ...);
>>   void xe_sriov_vf_debugfs_register(struct xe_device *xe, struct dentry *root);
>>   
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
>> index a2d61b37ff21..02d0fcd26399 100644
>> --- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
>> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
>> @@ -10,6 +10,8 @@
>>   #include "xe_device.h"
>>   #include "xe_exec_queue.h"
>>   #include "xe_exec_queue_types.h"
>> +#include "xe_gt_sriov_vf.h"
>> +#include "xe_guc.h"
>>   #include "xe_guc_submit.h"
>>   #include "xe_lrc.h"
>>   #include "xe_migrate.h"
>> @@ -275,6 +277,29 @@ bool xe_sriov_vf_migration_ccs_bb_needed(struct xe_device *xe)
>>   	return !IS_DGFX(xe) && xe_device_has_flat_ccs(xe);
>>   }
>>   
>> +/**
>> + * xe_sriov_vf_migration_ccs_bb_support_check - Check for disable migration due to FW version.
>> + * @xe: the &xe_device instance.
>> + *
>> + * Performs late disable of VF migration feature in case GuC FW cannot support it.
>> + */
>> +void xe_sriov_vf_migration_ccs_bb_support_check(struct xe_device *xe)
>> +{
>> +	if (!xe_sriov_vf_migration_supported(xe))
>> +		return;
>> +
>> +	if (xe_sriov_vf_migration_ccs_bb_needed(xe)) {
>> +		struct xe_gt *gt = xe_device_get_gt(xe, 0);
>> +		struct xe_uc_fw_version guc_version;
>> +
>> +		xe_gt_sriov_vf_guc_versions(gt, NULL, &guc_version);
>> +		if (MAKE_GUC_VER_STRUCT(guc_version) < MAKE_GUC_VER(1, 23, 0))
>> +			return xe_sriov_vf_migration_disable(xe,
>> +				"CCS migration requires GuC ABI >= 1.23 but only %u.%u found",
>> +				guc_version.major, guc_version.minor);
>> +	}
>> +}
>> +
>>   static void xe_sriov_vf_ccs_fini(void *arg)
>>   {
>>   	struct xe_sriov_vf_ccs_ctx *ctx = arg;
>> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
>> index 0e6b27016dac..2844628269d1 100644
>> --- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
>> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
>> @@ -15,6 +15,7 @@ struct xe_device;
>>   struct xe_bo;
>>   
>>   bool xe_sriov_vf_migration_ccs_bb_needed(struct xe_device *xe);
>> +void xe_sriov_vf_migration_ccs_bb_support_check(struct xe_device *xe);
>>   
>>   int xe_sriov_vf_ccs_init(struct xe_device *xe);
>>   int xe_sriov_vf_ccs_attach_bo(struct xe_bo *bo);

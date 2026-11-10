Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF3A160A380E
	for <intel-xe@archiver.kernel.org>; Tue, 10 Nov 2026 14:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WExIN/Rf
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4C5C10E277;
	Tue, 10 Nov 2026 14:58:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3D3D10E277
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Nov 2026 14:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794322722; x=1825858722;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=rYsZ0GdMmrA1aGDfB/gAhj6zkdC9cQp7ZAChFj5uENU=;
 b=WExIN/Rf448u4nKNogVwyrvRD3v9lpp7emVr/MHTHHiO9Cjyiu8E/fZT
 AlZczjZ0q6LT1Crkyfp235c5lxW+xJyEhWgxXiT4b52+/mjb1LKpX/5Yf
 CUKKa3S2NALE3Pjiyr7lRHzjvYXk99VVIaaJvQGnbS97HPPbZb8yQ1Sqz
 AXdAQ4kg1lHJ8j8Hn8sw9wsL6omfRPKmQvBCNr/p5yPI3mOGTL1YDGbZc
 ovUKj9BIvPYr/c+Mhre2W8gNVp04nuxPQI58zVeU9vMoD9zmkAcYuzt4T
 kRBaLksE7E2QpXX/tDvK8g9wpyiRSHpBzw13inTO+KV4ve2TcAPSGz7Pz g==;
X-CSE-ConnectionGUID: BbjaPrsvSnqKFJ08YgwZYA==
X-CSE-MsgGUID: 5rVS3i18SDGcP9DuWPRPtg==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="2963547"
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="2963547"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 06:58:41 -0800
X-CSE-ConnectionGUID: S5BKMiKfTza1U46WihzKVw==
X-CSE-MsgGUID: 3pJ5dJNBQT6tQJrnRU5IGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="8766750"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 06:58:41 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 10 Nov 2026 06:58:39 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Tue, 10 Nov 2026 06:58:39 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.68) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 10 Nov 2026 06:58:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y6O7A75jcn/e4X99HsYIRDDC1gCouKBva2rStuLmikTe9kyC3MHZT1V2RgyKFKXes5E2gKyEV4G4rw6YorhzGKe9FvB/oDNf4S7gwodoSgg5Wfbxck/5vaQz3gyLV4aKp1Aas6emQ2fL4zdGZNc55xUoIVz5rwAYaPPuH99j+V9OaCjC3s4yDzyz34VAc2WYqn7Xq8OrXaQtyG6PeYFM1GzsPnWyWdB7YYLa7RIEe3YoH282C6+n81vSe4aZFhtSKBWt5D575FjH7CmpMQ9JQlJ6TpbnNHwrfYnuNrnhY4yc+nbmZUdcvViD13VGM+C8sEAp4e807pgwlVX+87Q0KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vaaThyUkTO+n7LFnH15t+8bJKi3IJo7jcF3kuSuBr1Y=;
 b=wrsUF3F1zr/vFfrF+efKXP6jRZcAwiJo4/NAGe8Yj2TMda5NwkcOikqVj34BzEfmmcP6Myx6cFh/gC0LnNf9xXF9G6/KZH9lVvwUZABQQp0ntDb1dvegnEwwhprcEtrNJnWVcloO7y8Ifw0+/N8+U+OeB7H5VTsSFnpmW8vfIwqXwIg0mAwwAdznggWW5Cvh8uM0Qxs+HMmTDZLolkbD2XW4zTLaEMwHWkW6LyiG8bNE4BJNWI1wLwcQJ60gqEsrmCgP/KbAflGCHw6FI08STIqJxDNjTfT+r8gKkk4xsQzBHTlhXJx0oEH3pjBi+mtcqnLFlvk9UWpRuNEv1TL4aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV0PR11MB9792.namprd11.prod.outlook.com (2603:10b6:408:385::5)
 by PH0PR11MB5062.namprd11.prod.outlook.com (2603:10b6:510:3e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Tue, 10 Nov
 2026 14:58:37 +0000
Received: from LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8]) by LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8%5]) with mapi id 15.21.0615.007; Tue, 10 Nov 2026
 14:58:37 +0000
Message-ID: <6a332e0b-c447-4841-9f73-ff4f22a5694a@intel.com>
Date: Tue, 10 Nov 2026 20:28:28 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/6] drm/xe/cper: Add software CPER emission entry point
To: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>,
 <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <matthew.brost@intel.com>, Aravind Iddamsetty <aravind.iddamsetty@intel.com>
CC: <anshuman.gupta@intel.com>, <vinay.belgaumkar@intel.com>,
 <riana.tauro@intel.com>, <karthik.poosa@intel.com>, <sk.anirban@intel.com>,
 <raag.jadav@intel.com>, <jani.nikula@linux.intel.com>
References: <20261105085348.1467925-8-mallesh.koujalagi@intel.com>
 <20261105085348.1467925-9-mallesh.koujalagi@intel.com>
 <f58d57bc-05c2-42fc-94af-dbd5ea260323@intel.com>
 <d7c8f01c-2e27-4e1a-93a2-35dfdbe0c5b2@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <d7c8f01c-2e27-4e1a-93a2-35dfdbe0c5b2@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0098.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a8::10) To LV0PR11MB9792.namprd11.prod.outlook.com
 (2603:10b6:408:385::5)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV0PR11MB9792:EE_|PH0PR11MB5062:EE_
X-MS-Office365-Filtering-Correlation-Id: c04d0525-3a38-453f-7ba9-08df3f3b19a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|4143699003|56012099006|11063799006|22082099003|18002099003|6133799003|10067099003|261009223027099003|261028144727099003|261102123227099003|261021121427099003|261021123027099003|261026140227099003|261026121527099003|261022075727099003|261022105027099003|261022113327099003;
X-Microsoft-Antispam-Message-Info: 62MIPRSEFITXNexdzb9WM21zD+RHYakt0YeVzthwbFnL63uQTyujz4gQTKU+V/f8DO8etiuPhT48OlHK9JoUvFmtuwU81v4x+V4C3yKzMmAyh+m1ZqU5DF0MQEuIsgaQ88UrEP9iVD6kYAzc2Emsz+5PWdILB4nietvOa8qYMaxmSSY8qnR2jhPK8AuSRk9/WVYSWjvuVWKVlNGCxRKOwT2HItfS5uENkPwxwrXiTBRodkjWt66kd+WrewL70eftKos+D2amkULh/bwJLfR5sdHZSagYIehMdsZfNejoXoDFj5+yh0+qTOgXgqjJ4uEfH4D/AW9o7moWDJTPQkzqi9hBACcGXl2CSZF25E6iMC6598lsObTQC7Wp1xH8fsaoseoqLxyrbUIRSLC1cdJFbw2D/TuMRyWahtJi4DU1CoFYOf7gJOz0ogpkal27pB1bxKGW12Afg4CvD0nf7qPVtHpX2ngUYh1fyl/zSPqZZyYB6jT1kozh83Z1PG8ZRJ58a7Ta4TqtYj3qv+BMT1E7h3nIp+IENIHGpea2KAbXhgp1tOu/8sMAsIHj3ymXE8yiMCqH5mVJEBlGV/64WHC2Ze7gWa0+OMU2wkHNl54zT22UR2JeOpp5PtRkth3Y3eRZ3CfW/SKYrkukqa6i6v+/zEyTQ9HSPG3aTHolSIOhUdE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV0PR11MB9792.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(4143699003)(56012099006)(11063799006)(22082099003)(18002099003)(6133799003)(10067099003)(261009223027099003)(261028144727099003)(261102123227099003)(261021121427099003)(261021123027099003)(261026140227099003)(261026121527099003)(261022075727099003)(261022105027099003)(261022113327099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TnZ2Qm1PVCt2OWhqVVFiTXVFMVdwNFBmTGJtaTEzdGlXemwwVm92VnFERFh2?=
 =?utf-8?B?aW9JcXlSbFAzU0YydEhxZFZ1UFdJWStxN01qT1dGd2tienBMVkE4SGlocndH?=
 =?utf-8?B?SHB1RSs1OVJOeHUxN3VybFlMNjRKajJGSlVXb3hRSFgwKzRFK3llU0FkV1lj?=
 =?utf-8?B?dWdPWTl2eHVtWjdDdExFdzdmNSsxYkhtbnk5cVNEVFpLU0Y4Smc1Q0htMUJ1?=
 =?utf-8?B?Y01YQnRwN2Q3enVqcGtsMDUwMEE5dHlJVGdQeDNqVUczcFlRZWFTektPMEMy?=
 =?utf-8?B?MVhYQmNXWWhPekJBOUtzKzNESXNyVDJXVFpzQjQ3S2ZiYTZtRjdyZG1ML3dx?=
 =?utf-8?B?MU1tR0NEUWlodzlhRFpPNng5b2tZZTUrS3lSUHBmOUVrMHgyMEpvUTNTWTZK?=
 =?utf-8?B?cVZ1VzdMYWlHakFhUlJMdVE3Y3hLekNlQ3U5UVJtb09hRnJhUWlnV1ZRc3Bt?=
 =?utf-8?B?OUFaVFRZbEJ3aGs1dm9OQkV6bGo1M1pkMUxPUWVndUlWZkUxN240Q3VJZmRE?=
 =?utf-8?B?L1dMZkdHWjJoZHUyTXJtZU9tTGNoMkF3Y05QVmU5OWowVUl1R2ptNFZzUXht?=
 =?utf-8?B?N3BPTzZMaG1JUVNPcit4QVNESXlBSkw5S0RwY1JxUys0VkVna3BHMWhYeDNE?=
 =?utf-8?B?d1dnRTNTMTRSUGVjdmdrSDRLZTBrYmNKdmRKRkVTUEZ3QVU2b0I1WGtOeVlt?=
 =?utf-8?B?QmRVMzVIcmNVMHBtMm91R2p0MURHb1R6ZE9uZEduUEs3N2o2YUhZQURtVStS?=
 =?utf-8?B?OUFIYlY4djNwQjFScEV3ZGY1MWk4M1NnOFBNT0VibWw1YktSVHJCVGNMQk9a?=
 =?utf-8?B?UkVTTkpDT0xMMnRjb0liVzgxWW9KUHdDTGVyMFJSN2RCMldvZjNJRWdrTDZ0?=
 =?utf-8?B?aVdNelpjaUpHWFRmczMwa05ZZkdsR2tPREl1OEtBUmFLOUkzY1RnUGpsRDIz?=
 =?utf-8?B?RGdqUmI0clhWeDllTnFSTzc5dUYzNUdBb0x3NDZjaEVocEpOcHBoL1BCNzk1?=
 =?utf-8?B?VlVicVlydzRKVFJQSlZXNzc3cXJYYUwrTGN6Vm9VWW5FaHN4TGtiRGVXU3By?=
 =?utf-8?B?b29DLzFIR1BBaXdLYlcvSWJmZEVQS2V3YW4zVGJYaW5PZDhtcWd2UGkwWGVj?=
 =?utf-8?B?Ti8zYmdBYWJ6TldtZkZJVW9seDdNU21pR1pNSnRUYUdRMXBRL0k0UHk4MGsy?=
 =?utf-8?B?emRyM2RiU2ord2IwRzRvbXpXaTVFVThiVW9pUS9TYWJKOVZ0T1RVZnQzVjNl?=
 =?utf-8?B?bTdYeHVaY0syMTR3Sm5uTXNPa04xRFZ3MlNXRHNOaUFpMUg2d0dtQ3ZEMVM1?=
 =?utf-8?B?ZWljZzdqUXNyUis3dDdXYTRyL1pBM2FteHdxOC9EZS9qeWN6L1VCMHFWVEdL?=
 =?utf-8?B?NDU3cDR6eHdXZmtqUFVTL2YrTy9Jd2JRNU1MQ2hqMzVVdmQ5dGNqc2dBUDgr?=
 =?utf-8?B?RUNOaE8wTzE1dUQ5ZllHTEVjTGt2bjVMaXlZQjFTV1lLS1huaVJ0NUVrSTVU?=
 =?utf-8?B?UjBIaEZ1WmMva0NGZlp4Zk9UVnRKaWlIOG45TEs2Y1lORE1qYnVhOUNTTlVs?=
 =?utf-8?B?Z21HRUdXVmtRUERyWDJOVXNaczVySWkxQ1dvODREWHBYNWNDYTMwY1ErNVA2?=
 =?utf-8?B?Z3lXbEhQU3hpSXQrUXdUbkZwb0hWcENiMTVYcWpIUHdpYTlVdEkzWkgwRE9J?=
 =?utf-8?B?QWp5UXRoeSticHIzSlltYUhLQ00vZ1d3Y3lCb250Mzk0U2tWc3ZOMmZLQlF1?=
 =?utf-8?B?dHBtT0RtOEl1Unc5SWVQd3M2eDE0WGZLdXRrR1lmRGlUVUN5ejVLdGc1dGhZ?=
 =?utf-8?B?QW9WTXZ1SjVWSkI2dHJGaHRPd3FJK21ucm5HV0VSTHZGUjdLajJmQ0k4ekNu?=
 =?utf-8?B?cjZuQmhibTRQVDRIUWlmdVlya3hvQm9HaUpTOVdhbnRVS0tEZ2N6NGEvNWg2?=
 =?utf-8?B?aFRKREp4Q3dGRWdsNThORnJIMm1FVFU5MkJGODJOdWF3bjJRaS90WUVJemVK?=
 =?utf-8?B?allNKzlSVXg2TWF1K21JK2gxYWE4dlN1SHpGdjhrazlnekczNUtYRWFoQncy?=
 =?utf-8?B?ellsOGlhb3VmZmd4c1R2S3pteVZIL0xUUEN3eWYvdHBQdXdqd0RxOUlFMjE1?=
 =?utf-8?B?d0ZTdXZGdjRLMlA0SXQ2NDlWSHFleTg1U1U1clRxcnVkeURVV0d0TkYxUGQv?=
 =?utf-8?B?YmRLOVdPWHZabVFlK0lqeFFia0trcldMdnJnZ1Y1SzhqOXJqa25lSzFKNlk3?=
 =?utf-8?B?aW5ObGk0R1Z6Sk1CWXFpRnBVR1hCS3ZlZG92OER0S3ROWWNSYkp0cnR1eTdD?=
 =?utf-8?B?K3RGLzdWa0xKNTFtT1ZEdE1uenI0UytyWGV3bmlYR0dXV1V1enRTZz09?=
X-Exchange-RoutingPolicyChecked: Zqt4SUmk6aqABZK4GzdwY1VtjpB2kofE4vo1kouKyVZpe0TlarxnCHd3uZlIxh2f0qPq6AeXzRoq7mpf0nXcl+eOrjVwRHIuLeYIYOJjfQQL3nEYBYZBBAgWqUPtiOq4bLXfv+ai2DjoTX0spIrduRWtURLK2lYMZk/VBUntDrGLeFsztYaX/4kpjlHd0Bs7vQPFJdJQcz9uLU8F33LpGuBl8lCmrIclsT3R2q10X+zJk0ltZZQe1piruf3V5Nkfo9o2mc2uf+OoYntU+QMS36QHBCMfZsem9roFAWgTEVupCf1ml1tPw+XHA5RNtQC2808vA2QEnEfU1eGX9w9vfg==
X-MS-Exchange-CrossTenant-Network-Message-Id: c04d0525-3a38-453f-7ba9-08df3f3b19a9
X-MS-Exchange-CrossTenant-AuthSource: LV0PR11MB9792.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 14:58:37.7329 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: whvOAiE2YxhfbrldMjcn262m7i6AndWGqTftjbYrv8aVd1ncMPmU5kKr0RUp4tnVZvd7Re1dYasRwJv+fRmNWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5062
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


On 10-11-2026 19:19, Mallesh, Koujalagi wrote:
>
> On 10-11-2026 06:58 pm, Nilawar, Badal wrote:
>>
>> On 05-11-2026 14:23, Mallesh Koujalagi wrote:
>>> Add a software CPER emission handler for CRI SIGIDs.
>>>
>>> Keep hardware CPER handling unchanged and return early
>>> when the Xe device is unavailable.
>>>
>>> Cc: Badal Nilawar <badal.nilawar@intel.com>
>>> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>>> ---
>>> v3:
>>> - Handle early PCI probe where xe device is null. (Sashiko)
>>> ---
>>>   drivers/gpu/drm/xe/xe_cper.c | 22 +++++++++++++++++++++-
>>>   1 file changed, 21 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_cper.c 
>>> b/drivers/gpu/drm/xe/xe_cper.c
>>> index bb90030bcd2d..db3513c59834 100644
>>> --- a/drivers/gpu/drm/xe/xe_cper.c
>>> +++ b/drivers/gpu/drm/xe/xe_cper.c
>>> @@ -32,6 +32,11 @@ static bool is_hw_sigid(enum xe_sigid sigid)
>>>       return in_range(sigid, INTEL_SIGID_GPU_XE_HARDWARE_START, 
>>> INTEL_SIGID_BATCH);
>>>   }
>>>   +static bool is_sw_sigid(enum xe_sigid sigid)
>>> +{
>>> +    return in_range(sigid, INTEL_SIGID_GPU_XE_SOFTWARE_START, 
>>> INTEL_SIGID_BATCH);
>>> +}
>>> +
>>>   /* CPER platform_id GUIDs (RFC 9562 UUIDv5) for each PCI device 
>>> ID. */
>>>   static const struct xe_device_guid_entry xe_device_guids[] = {
>>>       { 0x674C, GUID_INIT(0x9046afe5, 0x9041, 0x5124,
>>> @@ -240,6 +245,12 @@ static void cper_emit_hw_err(struct xe_device 
>>> *xe, int cper_sev, enum xe_sigid s
>>>       xe_cper_emit_counter(xe, cper_sev, sigid, counter, &response);
>>>   }
>>>   +static void cper_emit_sw_err(struct xe_device *xe, int cper_sev, 
>>> enum xe_sigid sigid,
>>> +                 u32 component, u32 location, const void *data,
>>> +                 struct va_format *vaf)
>>> +{
>>> +}
>>> +
>>>   /**
>>>    * xe_cper_emit() - Emit a CPER record for a SIGID log entry
>>>    * @xe: The &xe_device
>>> @@ -268,12 +279,21 @@ void xe_cper_emit(struct xe_device *xe, int 
>>> cper_sev, enum xe_sigid sigid,
>>>             u32 component, u32 location, const void *data, size_t len,
>>>             struct va_format *vaf)
>>>   {
>>> +    if (!xe)
>>> +        return;
>>
>> xe is expected to be valid here. Silently returning on NULL would 
>> hide a caller bug.
>
> During early probe function xe is null, only passed pdev (pcie device) 
> to emit logs. In that
>
> case we need to handle it.

Ok, But why do we need SIGID logging for early probe functions? Why not 
use drm_error/info?

Thanks,
Badal

>
>>
>>> +
>>>       if (is_hw_sigid(sigid) && !IS_ERR_OR_NULL(data)) {
>>>           cper_emit_hw_err(xe, cper_sev, sigid, data);
>>>           return;
>>>       }
>>>   -    /* TODO software CPER */
>>> +    if (xe->info.platform == XE_CRESCENTISLAND) {
>>
>> Introduce has_driver_cper flag here.
>
> Ok, will update next revision.
>
> Thanks,
>
> -/Mallesh
>
>>
>> Thanks,
>> Badal
>>
>>> +        if (is_sw_sigid(sigid) &&
>>> +            (cper_sev == CPER_SEV_RECOVERABLE ||
>>> +             cper_sev == CPER_SEV_FATAL))
>>> +            cper_emit_sw_err(xe, cper_sev, sigid, component, 
>>> location, data, vaf);
>>> +        return;
>>> +    }
>>>   }
>>>     static ssize_t cper_on_query_show(struct device *dev, struct 
>>> device_attribute *attr, char *buf)

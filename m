Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE1A0C3ABDD
	for <intel-xe@archiver.kernel.org>; Tue, 20 May 2025 09:28:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75EEE10E080;
	Tue, 20 May 2025 09:28:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mxB6P7U8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F23510E080
 for <intel-xe@lists.freedesktop.org>; Tue, 20 May 2025 09:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747733293; x=1779269293;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=XOrXoPeJPVVHGxyEKPrwNCKS57+fJ3VHQpTXvkXYV6A=;
 b=mxB6P7U86JTHkH9kRhv7laUzssTuNiMFLAp+vEL9E3IL6bWSC6sf5/mn
 ujA9MzDjhlJ75Z22FIKqIBEbN6tpBBCF5f+rMhk6nbNaJiElq6k1K1zAO
 v/AyvL3JLFp9K+tUVg6OaWGsFshWcxddUrdspZ9eh/3Vm2zUfzPlXVcGa
 aafeI+RfQK0iw7/nOcieYQJDGHHIbxKADYKDpLquTYMKAwXO8F35aMBmv
 KOMwADrh1pDW733F+XSEhTDrSJXbKlWLNajLQ+QtqV79MUn5hK2jKbNV3
 1m8vQxhaWJjxPcPe3S38q+aRWhSLMS2fqPgI4YX8/JWu1tvEayoDXIOjX Q==;
X-CSE-ConnectionGUID: YJhcCAfPTA2rDwiyRabobQ==
X-CSE-MsgGUID: DnpJ6jmyTQya7EYNPeIqgA==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="49811766"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="49811766"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2025 02:28:12 -0700
X-CSE-ConnectionGUID: 0fOy9nVNTiC5c0/XxOcwCw==
X-CSE-MsgGUID: mP2j+Hi/SE2Bl4G7pdqWyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="162941460"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2025 02:28:08 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 20 May 2025 02:28:07 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 20 May 2025 02:28:07 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 20 May 2025 02:28:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DR1RJkoZVSH28llNOXOBRzjUddixvA7Fp7+Fhx7PWFP+4x2ujPkkp+WJj0VdYjrxIK6O/UoVDP6zDOzag4S9mwKPYCVq/v+NR+8ACBOcu2rDCu6JBG09J3kQsFkUQoZtA8kYlbR/VE/zeb0na5LcC4tTS1Npd5GhaVnSTCTIFmkiBiAF1N2Cw3NDtAI4dtdwahtggHqnzj2QtG21lrrVz8lUtL4lRu/slX6xb0JdYzTBzPt/6m3bTzQmsVRUCHvnYum7TVa4H2jdDdsHI5V+UHH9uMmXG7/4qYJFCXsgik5O4pxQXrajdJzsaVybi/0JDE2s/NeOcAIlifo3ynjsqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wrolpHbZ1WBKZaOuqiFmUHfGNROKWOSoanazBW7H7iU=;
 b=RVGPBctSQpcrALoqCUfZsMYfrL36djkfKsTWhDagmri280QXKOOWJdMdlokUQ0Tjy1z1VCAzHcIiWG8pX/m+bHDE/6ZXCQ9R+IZFNZH75Gu2pmRaijXQ/Vpym8+Em5W+MZLMd3RQ4vG3KIX9RSel15NXwdSi4QlMmgvpP2p3azw/r//fz2TJhfFdCJg1Fc6EC9v1px5OEbHFgzKfoJ7SIcD94BzsuCam+kYd4Z3OgBZmws5qjDI+b9lVGPo9S4InIZfD8njvvIrM0N0k52nNdEhPKvrP1KkuVeTRstUwRzgeFdbsHElDXShXEt7qdIRY9VQU1i0AknYGNaG+ONEApg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by PH7PR11MB5818.namprd11.prod.outlook.com (2603:10b6:510:132::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Tue, 20 May
 2025 09:27:51 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%7]) with mapi id 15.20.8699.022; Tue, 20 May 2025
 09:27:51 +0000
Message-ID: <eab2c34b-d89a-46f5-9147-bb9060b4a5c1@intel.com>
Date: Tue, 20 May 2025 14:57:45 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 18/32] drm/xe/vm: Add attributes struct as member of vma
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
References: <20250407101719.3350996-1-himal.prasad.ghimiray@intel.com>
 <20250407101719.3350996-19-himal.prasad.ghimiray@intel.com>
 <aCTik0GGPGymStmr@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <aCTik0GGPGymStmr@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1PR01CA0176.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::11) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|PH7PR11MB5818:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c93cc5c-e2b2-4eee-1bf0-08dd978097ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WlExTDNBSnhsUjRiV3BQUEw4Tk56WEZYb1RCOWlRbDIrbkhDUUFSZmRyWTR0?=
 =?utf-8?B?SnIxOENVR2JyUlo2ZHppazJiMFJqai81bzFIdFNJNzYxVkxMWGxwdU0rRE5B?=
 =?utf-8?B?NUdRVzBLNXlKNnFnVTVhdEM0OEpicnBacWZSQVY4a1BaYTh6aS9pQ2xUbzFE?=
 =?utf-8?B?VUhUbWg5bzFHS284bFJSekdzNVlzeUF0aXJHYU1GaUNxZjZmMmZaZVdheXB4?=
 =?utf-8?B?RkVLZGRLeWRQeENtMDRxc0lLT0RpdVA1OTlRanN5dWU5WGJMbFhQam9sL3dz?=
 =?utf-8?B?eFlybmdyZnl2Q0I4ZWo1MFJ2d1NkMEtNQzhqNnpsQkRTcCtNc2dMRlRRTE0r?=
 =?utf-8?B?V0hSL3A0Sm10azA5b0htS2dOdVlQVU9HR0RDMWwydERsMENXaEZHNjBaVnYx?=
 =?utf-8?B?azRGb1VVb21kaHptZXVDTzh3SjlOT0FIdEdDT21GMzNrNlBCOGl6ZHNudjJV?=
 =?utf-8?B?S1VOeWFIWlBjN3l5S1ptNG42ODVoZHBZZ1NtT1ZGTWNMWXgxNEZrcit3Q3FH?=
 =?utf-8?B?emJSTVpkdG5Sb2wyWXBvVGJ6K0FHeVY5TE1SMWQza2pRcFhhcEdjWUVtMTBn?=
 =?utf-8?B?RHpyZStPZmc5RHZsMkpIdWxEKzBvM1M5WmkvZ1QvMjJvbkZGbFJoenBwY0dH?=
 =?utf-8?B?NERLdW9WQ0JxSCsvelVzQnVvUEI5L3cxN05OSE5WdHpVV1VVak1FelZCektt?=
 =?utf-8?B?RHVFQ09TL3p1RG5ZWHVISjU5ZDcwRTJRSWdGR0hHb1c1SkdvMHN0aE1FSDI1?=
 =?utf-8?B?dk10cEdYTmY3TkhqQ0N1cFdIN1R0VTdsWGJOeHd1akgzejdxOWpPYVczL3ky?=
 =?utf-8?B?Qm9YMjdYMitCRkVzcUowSkh0OEZnamlwM3RjdWxSZkYycU1WQzdxZTV3Ymxv?=
 =?utf-8?B?a3dWTkRDS1VrU2IvUmtuNGJObUZxQTBBWC90cmp6RE5OcGhtVzJCcWxXMXRT?=
 =?utf-8?B?dHpiT09UWFB1NDUySkE0aFZCNGpPQlZPWjdzeDZvaXc2dlhZUTN1N2VwUkZL?=
 =?utf-8?B?ejU2SkhUeFFHZHdOcEl0dHNGeC9nUlVMRzlVc1c3bEpMQVFEaTdKTzVGTk51?=
 =?utf-8?B?U1pubHF2WjdobEtwL3phenIrMUxPMDJ0ZEdJRDVsa1VmN0hUeFdWSklyVUdq?=
 =?utf-8?B?NHphYnArOHgrNkFDWTJZL3lPeUFadkt6eFBlSFlLdzN1SWhnQ3FKNnVZUzR2?=
 =?utf-8?B?YXdGT0k0amxyV0Q4UCtDeEZsK1ZoQWkvMFAzc0I1MkwxdmF2UmtPTXhQSkVP?=
 =?utf-8?B?Qzk4R2lHN0Y3SitFa3pMZmV2eVhzeTdDZ1FlRmlMYzBhTHdaZFBNZjJNN2Zj?=
 =?utf-8?B?V0pIT2VVR1p4bERYd1IvamRXNmJidlA4Q3Q0dXV3NGVRL0VTSk9rbDFyT3lZ?=
 =?utf-8?B?bWdnQThXcCsrTEoxQnd4M1lwREtVeXhMR1JnazR3TnRRRTRKejRsd0wrTExk?=
 =?utf-8?B?NmR0WFpZZWhkZzNTZy91RmdnQWdDZS9QWUpoVEpTYXVMQWZVRVgwUmdmR2hT?=
 =?utf-8?B?bEFOZzc3aDdvZHFwdllaOGxEeTdLVmtoV1hWWUw5anlFbHZha05Sb2dSRHd3?=
 =?utf-8?B?V3c3UkdjY2YxNmlrSER5RG5CWFpvUUR2RTBET3Q0eExlemN6VGQ1NFlQcEhD?=
 =?utf-8?B?dzVmTDljMlRYN3RXQlJOWkZYbkRwbCtWcTIyMkxlTStSSzFEVng3eHcraDdO?=
 =?utf-8?B?bENMNi9mdVJERVozdXFoNFkxNFVITmRzSXg0WTFNdGpJdmN2Q04wd1hvWW54?=
 =?utf-8?B?NEEyanZOMWxEUGVNWUJRT0JnZEVLcjF0RDA0WW53eitxa3lQZVFKV0FOMW1B?=
 =?utf-8?Q?3maB6AGnxQy8fK9EQWtdkUKBnTT+u8eXhfKL4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SDk0N2tkdDc1NTFEZ0FpbEJLZ2ZPNGdkN0wwVDFjQ2xJL0lhcGltMzEwbG5x?=
 =?utf-8?B?N1RpTjY4Wjc1WUlac291elN4aWxRNVo1YjF4MEd3TWpFdG9YaWl1OUN1Z1Fp?=
 =?utf-8?B?Z1lpZFRmVDcyOGpqVlFabXFTQWN1dWRGaFZZYjVMdEtMaHRKQkYzWnZPbm9E?=
 =?utf-8?B?d0FlOWI1ZllrRmhtanE4R25wcFhBMkdJZ0hkaCt6by9CSDRHZnp3YytIM2ZK?=
 =?utf-8?B?ZGVPWGN0N0VWS0pwSXJrVzdNR2RIYXNRWWUzWUZxeHdIbmxpVzhDTDU1N1Fq?=
 =?utf-8?B?aUh4aEpoOHZzRC9OdnBERS9uaFRLM3htakFRbDdmQ1ZmWUp1SzJkU0VIMXIw?=
 =?utf-8?B?NHRtWW5ubmlkRW44UDFacW9aMGxTUUg5Y2JHN3hEZUJPNldDWWdsMWNJdjYz?=
 =?utf-8?B?NlNxVDU5UE9qMkNYY0kyT0Zsbmpya3pGYVFYLzVNdTMvYkNBalJsaEhGcmVI?=
 =?utf-8?B?R1pHUFpFei8vSjkzbzdEaE42dUMvOXdrQVVxSVFvdTBZM1l6NkhSSGZ3T0pZ?=
 =?utf-8?B?dDFaaWRSc2dFZm1MazNhdGFyWVlqQ3p5TURYd1R2NjhhbktLSVlUODkrekJ0?=
 =?utf-8?B?RFE2Y0hsUXNwczFVVkR1VVdXRldsT2Z0ZFBPWUNiazVUM080TGY2ZEMvSUF6?=
 =?utf-8?B?b3BTZjQ5a1lHZ0VOdTZSbUFNTEZpc1FWRHV3MUpmS2dxQXo0OWxhRWJSZm9s?=
 =?utf-8?B?bHNQM2JiZ3Ria1c1V3g5VGhzZUU3REVLOUFmN1Rvd0Y1MUlJZjFyeWdjYTRY?=
 =?utf-8?B?U0NUMGdadFlyc2FvNjhmcmM0VThtQ05lYXplekZZRG9ESzNIa1F0WUZWRkRU?=
 =?utf-8?B?cklncG5BazNZUVNFK3VFQzBib004R0xjSFdBWVlUT3pPbnV1QW85VjV0dVg5?=
 =?utf-8?B?dFRpMGpOOUZTTWFaRzMxbDg1R3ZpaW9KY0ZqbTJ4c0daZ1ZlUHUreUszT2E1?=
 =?utf-8?B?c0NTcXJDVmx1WHEwUkd2cjB4Nzh2Z2dkdVYxU3dQRWdjVld4b04xc01CczBq?=
 =?utf-8?B?L1c1UzdXS1E2Z1NyM3NSSGNCcFdWZXZoSzhHb09NV0V1MktBWEhkbVZ2QWxx?=
 =?utf-8?B?SCt0SGI3VHVINFN1VENjYmNlR1ZodGkyVmo4MjVsdzV2eWlhTDFDY2JnV2hK?=
 =?utf-8?B?V2JQeUNxTFBlRTVYaVlINDdYNEVjdVRCbTd3UVhoV0Z0VmFMdXpjbXluNy91?=
 =?utf-8?B?a1NCdG4wNjQyNm5tT2l4ZXA2WmsyeERJKzBKR2NvMkc1aVpHek5XN0tQRUlj?=
 =?utf-8?B?VG5vYk5MNWp2QkpBcjZEVEhYUjZOWVp0alZ4Q3Y0bENCOXNwWENTY2l6emVp?=
 =?utf-8?B?RVBOZ3Y1c215TmVTcFFjalN3anB1a1prRlJGNjhENWNjdHhsYWM3aEhHTGQw?=
 =?utf-8?B?bU5lcmxrK2NLMFRCV3RXL0x3VTJKbTg5MkJocFQ3Z2l0eTYwQklPRzhyaHlJ?=
 =?utf-8?B?U1NTZVdsQ2liV2JqSjV3TXJTUUNlMmJZS3RRMjI3N1ZLYlBSelRERzh4RE9C?=
 =?utf-8?B?ajZNVi80UnJIbnBGbFI4b3VqbHFtRGc2TUxwcmhYYVZRL2tlcTI2WVN3RklU?=
 =?utf-8?B?TDJsY0ZtQjkwS2dFL0FUcWRaTjRSNkdjRXpIWkZ0OGVRWGEzaUIzM24yeFFt?=
 =?utf-8?B?djVxQzkzd1BMRFRibmpWNU5lTE1MeVdVVEM1Wkc0Q0FRZ3I0anF4NHp4TEhu?=
 =?utf-8?B?SWRGbFpSWFZOeWtUditaNnkxM1liQ0RWZFcvZ0t2Y21OOEpHYXlDQ2twQXJi?=
 =?utf-8?B?SFJ0SHBVWEFUbHZ6bDRsdWNMNGlFc2hROEZVNUIzTnJPVE1DSHFNM3NBSkRM?=
 =?utf-8?B?QmREVm1RUkNsbDM4ckxaL1JZMnZVUGkzamhFS0FKRk11Wnd1UEJJY0prekdy?=
 =?utf-8?B?bklMZVZBNzQzTFJyZVkwQy9EdTVRbXZ2WUtrTHowb1pTV2dBcDZySURPcVU0?=
 =?utf-8?B?eUtIMEVjbGtpOCszdytENlFieDN4c3E3b2ZISTNDdHVmVnY5aE1LRUIvQkgy?=
 =?utf-8?B?NmJ3anRqaFpvblBZWmljNkVKSW5VQWh4bTR3aTFGcUFLSS83L1NaNkw2Wm9S?=
 =?utf-8?B?NWtMTkEra29CTzFScG5KbFNQc0h4Wk9RNU8wZUJpWitvWnpGN1hDeDY1d0Y5?=
 =?utf-8?B?VmZiZGxNR1ZPUEpNb3k1cTk0Z05NazJtdXZsWGxPMEdqMVBZc3A3Tm5xZkVQ?=
 =?utf-8?Q?oDqWq27alYVqtFueVTCmFCY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c93cc5c-e2b2-4eee-1bf0-08dd978097ca
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2025 09:27:51.7519 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a584sADgU+HDLySOfjYjIJ2Cv8DPhqVSaQ3FV9XGegzfBW6gKBNQW+tJswaT2Q/9yRf2eUmDPbW4z7VYBxRTDQkR2MuTUFvjDPr/OPL0hF8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5818
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



On 15-05-2025 00:06, Matthew Brost wrote:
> On Mon, Apr 07, 2025 at 03:47:05PM +0530, Himal Prasad Ghimiray wrote:
>> The attribute of xe_vma will determine the migration policy and the
>> encoding of the page table entries (PTEs) for that vma.
>> This attribute helps manage how memory pages are moved and how their
>> addresses are translated. It will be used by madvise to set the
>> behavior of the vma.
>>
>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_vm.c       |  6 ++++++
>>   drivers/gpu/drm/xe/xe_vm_types.h | 20 ++++++++++++++++++++
>>   2 files changed, 26 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>> index 27a8dbe709c2..1ff9e477e061 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.c
>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>> @@ -2470,6 +2470,12 @@ static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
>>   		vma = ERR_PTR(err);
>>   	}
>>   
>> +	/*TODO: assign devmem_fd of local vram once multi device
>> +	 * support is added.
>> +	 */
>> +	vma->attr.preferred_loc.devmem_fd = 1;
> 
> Assigning a value of '1' is a bit odd... I'd prefer using a define or
> something similar to indicate the intended behavior. I noticed a few
> other assignments to '1' in the final result—same comment applies to
> those.

Sure

> 
>> +	vma->attr.atomic_access = DRM_XE_VMA_ATOMIC_UNDEFINED;
>> +
>>   	return vma;
>>   }
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
>> index d3c1209348e9..5f5feffecb82 100644
>> --- a/drivers/gpu/drm/xe/xe_vm_types.h
>> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
>> @@ -77,6 +77,19 @@ struct xe_userptr {
>>   #endif
>>   };
>>   
>> +/**
>> + * struct xe_vma_mem_attr - memory attributes associated with vma
>> + */
>> +struct xe_vma_mem_attr {
>> +	/** @preferred_loc: perferred memory_location*/
>> +	struct {
>> +		u32 migration_policy; /* represents migration policies */
>> +		u32 devmem_fd; /* devmem_fd used for determining pagemap_fd requested by user */
>> +	} preferred_loc;
> 
> I'm a little unclear on how these variables work.
> 
> In the uAPI for migration_policy, I see MIGRATE_ALL_PAGES and
> MIGRATE_ONLY_SYSTEM_PAGES (these should probably be normalized with a
> DRM_XE_* prefix, by the way), but it's unclear to me what exactly these
> mean or how they're used based on the final result—could you clarify?

With multi-device support the idea was to have flexibility to move only 
system pages to preferred location or also move pages from other vram 
location to preferred location.

> 
> Likewise, I'm confused about the devmem_fd usage. It can either be
> assigned a devmem_fd from the uAPI, but in some cases, it's interpreted
> as a region. I assume this is anticipating multi-GPU support, but again,
> the plan isn't clear to me. Could you explain?

The devmem_fd is intended to be used to determine the struct drm_pagemap 
*, which in turn will be used to identify the tile associated with VRAM 
for allocation and binding. The changes that introduce the 
devmem_fd->drm_pagemap->tile [1] linkage will be part of the upcoming 
multi-GPU support.

To ensure that the current changes are easily scalable and can be 
extended for multi-GPU support, I am defining devmem_fd in the UAPI and 
using it in the KMD as a region placeholder until multi-GPU support is 
integrated.

[1] https://patchwork.freedesktop.org/patch/642773/?series=146227&rev=1


> 
> In general I agree with the idea of xe_vma_mem_attr though.
> 
> Matt
> 
>> +	/** @atomic_access: The atomic access type for the vma */
>> +	u32 atomic_access;
>> +};
>> +
>>   struct xe_vma {
>>   	/** @gpuva: Base GPUVA object */
>>   	struct drm_gpuva gpuva;
>> @@ -128,6 +141,13 @@ struct xe_vma {
>>   	 * Needs to be signalled before UNMAP can be processed.
>>   	 */
>>   	struct xe_user_fence *ufence;
>> +
>> +	/**
>> +	 * @attr: The attributes of vma which determines the migration policy
>> +	 * and encoding of the PTEs for this vma.
>> +	 */
>> +	struct xe_vma_mem_attr attr;
>> +
>>   };
>>   
>>   /**
>> -- 
>> 2.34.1
>>


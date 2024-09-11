Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F5DCEE57D7
	for <intel-xe@archiver.kernel.org>; Wed, 11 Sep 2024 20:41:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B97A10EAA2;
	Wed, 11 Sep 2024 20:41:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DXrYDrAt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E25CD10EAA2
 for <Intel-Xe@lists.freedesktop.org>; Wed, 11 Sep 2024 20:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726087278; x=1757623278;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=TPpbwsbm3D9UUAXopYl0Hj1/waBf5TY0Aaa5rlf3m3A=;
 b=DXrYDrAtuaF1X32DGj3G/NJTeQV6i+8uOlncZR5QrJN4egyredRfwwbK
 ZV7Ix6RkSljCzdaIPLTJzXJ9X5u/1QRBQ6RTHfV5QB5FFl+I9yfM3MsMe
 +rfKhYArORhB5GhnMT4l0+IjHtiHtGlq6ysxmZ5QdR5k4LrrnOC9dmBzg
 DQHiJv2KLzlNqusypiIhzRxl1bdaIwzu8vzeF+4/g+hhYpULMla0eUaF1
 hWLipf6VxIANRLTs3ljCmXcDz9quPWxjjJgnaNRStG1r5zbokQeg5LWst
 NeeJWhjC/MaKsVyX5U1yJIeOvZ0TukjA0v3Ndt/NZlfxMdaKiRytSZGUe A==;
X-CSE-ConnectionGUID: b7XO3H1gQGq7HjVN5zDZrw==
X-CSE-MsgGUID: 4KCICyorTBq2+WQplPOmbg==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="25071801"
X-IronPort-AV: E=Sophos;i="6.10,221,1719903600"; d="scan'208,217";a="25071801"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2024 13:41:17 -0700
X-CSE-ConnectionGUID: ymSL/4AmSMeKoakoUg7MaQ==
X-CSE-MsgGUID: B9LgB8zhSc+rGmALXY78gA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,221,1719903600"; 
 d="scan'208,217";a="104935652"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Sep 2024 13:41:17 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 11 Sep 2024 13:41:16 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 11 Sep 2024 13:41:16 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 11 Sep 2024 13:41:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bi+muHqli0l3PTsC9zMXVSuC29nr0XDHEjoDOsXupTiod47WsJv0uz48ILuF2MYt7yNEGUQBKwlWnBLFcrF2ZPfIJf0wYzUnqlfz4gC1h13CPV70YzKTAHBJDfaBUUyP8ZA51BjIjE+ia+pMPc20epynp1+u6Ye0Bk/uPDj3ECN3whd1EfL5fdwqQUvmxrqAosnLF65LJyswOuUVROBIOahAaXKWW+TCf4p13LqwTvjtipR/wAYmxCz3pYEdYqDgnyFf/Mkx/x26IaoOMJXmSnwM/zuDrCDVZfuoW39x6XchuMYFm+xHXzMof5WPyPqN1Su/Y4ih64atWKfJp9uisA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RgHN8TPlqpUU5sWs7NDEFTN50gf9Q1T5pIXgMhjzIwc=;
 b=vr6qqtfqGzVqqtX0KR43/rPBTOiaiZPNHTx9LApp1TtBt4461/7igQdSmRsCB5bXmMtCM8fbEd4CQ42P9e4Nl9lb5Y8k/xBANBmEXJoTBQeV4NoDEZY9P9P+rv69vvwCwqtFO4Ajp5xnb+p5/wGhXikpixWL1uFB4s3rwNfsyFvERWkWKC1tTHFVpqzR9aGbO93+dn3C8mkxHkkyWPMrvqoGnay3wx8Z/5LqNs8PI28223MsfaagagP1NwCk6lw9wi13ydn36EjzgXF9DkoI6qnopq8Kx74LzC74s87lCwp60gwzdceltCWSrZ6K+ltLoJwLttGr46uKpNz3bw6ZcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by SN7PR11MB7665.namprd11.prod.outlook.com (2603:10b6:806:340::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24; Wed, 11 Sep
 2024 20:41:14 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%4]) with mapi id 15.20.7962.016; Wed, 11 Sep 2024
 20:41:13 +0000
Content-Type: multipart/alternative;
 boundary="------------nbF0q1G00K02TktnZ06WHScL"
Message-ID: <ba7d85a5-4dff-4dae-a6f7-1a0dff22f0bd@intel.com>
Date: Wed, 11 Sep 2024 13:41:10 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 10/10] drm/xe/guc: Add a helper function for dumping
 GuC log to dmesg
To: Julia Filipchuk <julia.filipchuk@intel.com>,
 <Intel-Xe@Lists.FreeDesktop.Org>
References: <20240905205106.1063091-1-John.C.Harrison@Intel.com>
 <20240905205106.1063091-11-John.C.Harrison@Intel.com>
 <f9fe6a1c-700c-419e-bc9c-86165b30c1f2@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <f9fe6a1c-700c-419e-bc9c-86165b30c1f2@intel.com>
X-ClientProxiedBy: BY3PR04CA0029.namprd04.prod.outlook.com
 (2603:10b6:a03:217::34) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|SN7PR11MB7665:EE_
X-MS-Office365-Filtering-Correlation-Id: eed6d106-087d-43f9-9a16-08dcd2a213b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OEROSHNjcnZiQTc3SzRSc0ZYZWU4TUUvRDVWU2tQVndTVU1RWlJPL0RUakJL?=
 =?utf-8?B?YXNLMWRjclVjN1FxVEJkeHRvczBCZWJwSEwyeHg0TUpwUjh1SDVINjlpOTVZ?=
 =?utf-8?B?MGp3QzlERmlxZjN3QkNOSkhMUWpaV2RIbGl2ZEFHNllycXZFSzMwemowbmxZ?=
 =?utf-8?B?dldLQmtrUG4xRzZoY3RnWWNkYzVYR0JLNGZpeFJoUWY4Tm9NcVFRV0dhd3o3?=
 =?utf-8?B?TE9qVkhMLzM4dmZjbGhLT2NRc3BwMFUyY1JEMWQyVGhwci9DTmM4cXB1SWtm?=
 =?utf-8?B?VVViR1NVQXJTc2hPU3NGOTkrdFZlbHpRTTlidkxxV21kRHQwN3h2T2ptN1NK?=
 =?utf-8?B?WmVDSUpBTElkNHFkTUtib1FWVTc2QURtWWxYTG01cGFmREkyMkd6SzNWaXVY?=
 =?utf-8?B?elhCSWhkYVRZdVNMTjYrZmFCY1dFRVhwWlJhREFldW5SVldqaXJVN0FScTFW?=
 =?utf-8?B?d2dXZGZaeFliRVhSQ2VhK3dhUGY0L2VGRSt2ZkQxWGg0WisyMWlGMjZNVDhK?=
 =?utf-8?B?QXhLc1RpbHdXd2dHUFlpeE04M0U4WFhuUFBBR3V0M3FMdGZBSFRWaklxSE45?=
 =?utf-8?B?WHM2ck5vNUVDcHA0U0k0eGRSOVltMktNbWNsUng1UEcxUG95aHVQYnY1T3Va?=
 =?utf-8?B?UDB4QkdUbHQ0NE9Na3JQck11YkZldUJDL0wrQmhpN1A0OWZnWW0rVlhDcTNI?=
 =?utf-8?B?cjRVbmhwNVlGRWRQSWVUOWs3MVNPaUpQUm1QVy8yd0QrcXNmWWpnOW41cWxj?=
 =?utf-8?B?a0pMWkR1SGt4QWUvbDFRZ3k3ckNVajNZdFFIbkE1dlhnOWFtV2ZhRmJwcWhQ?=
 =?utf-8?B?N2lGbGkzc0ZyODU2dmxYWGNER3ZtNXU5UHRBNTJ4bFRWS1BCMXY5dk9XdEVL?=
 =?utf-8?B?RXY5NW0vZ0lHcXhrc1dOc0sxTkZkUjhFY09oYjRQU1JIeituSUtWdG81aDhZ?=
 =?utf-8?B?dVJER2xUME4vYU5Xb2dPcE9iUEdOdm5YZVNHVWVzVVgvU0poV0YwNXREUTcy?=
 =?utf-8?B?MjJjem1iNCtiZTZmbHhNRDI5V3RnZkNEblNLOXFBYldMaXVNQmV0ZEFGRGR4?=
 =?utf-8?B?TU5LU0xtbkJoTHc5ZEQxa0FhZ0NiNVplZm1SdzFsRGdscXhUTzBoYkZzRGVp?=
 =?utf-8?B?MGRXMUI5eGJDSm94Q1l6eHowcUFoY3RYV2FVU05QdlBYc0NuWU12T2h4NEdU?=
 =?utf-8?B?aGZMUW9jRXVEd0dkYmszS2hCTVEvWjBwMWFUVjUxMFZEYjZaNm9QU1REYis1?=
 =?utf-8?B?T1BTZzg2VjQ5YTE3eTdwbHZCMTBGT081MHhHaFRqY2xPVnVtNFRlUlBwNnR3?=
 =?utf-8?B?Y3lNSzRLR0E2cFI4dUFYK1VqSElBNHVYMnFKbkpkWlg4b21rWmJEd1ZkclZF?=
 =?utf-8?B?STYzdUY0TDVYRSs0VTZmU0NRM2tJM2NFWmN5a3JseWxNNkc3dWQrU3VkdlUw?=
 =?utf-8?B?WGM4R1VzN1R6VVB3QjVwRVJhM2hMVTgxbXg3YnIwdEJDcm9nZ3V1RDBId1hT?=
 =?utf-8?B?aFdMMDhBMGh0aU9ud1g0WWZxUjNOaVpSdm5KWlJrZ3NQVllUM21ZNTVTdzRn?=
 =?utf-8?B?cTJhSDRiVjdmNU9UcTJ6SzdJM3IvVkthUng5UDNuMndzbTNtTW42TkNieFE5?=
 =?utf-8?B?dnlzYi9tOTBOcWtnZkJWdkZLRTBJSFJoTFVuL2tWa3JEQVRyblViOG80T04y?=
 =?utf-8?B?dnVIa2NKUlQ0bTBvVGFsOUtQUUhuSTFOVUFjaGRiY0tlQllDWEw2SWx0WkNZ?=
 =?utf-8?B?dHBBN0E4Rll0VGZ5YSt3dnR6alZXWkdXWXViVllKQWhaWGdCanJVcEVLeHh6?=
 =?utf-8?B?OWJqcUhCYzRXNUl5aXRYUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?elBrVmpsY29KblNyWHdBV1plSEQxZ1NTL0VrS003alg5cjQ3Z0lDQWlXTjZ5?=
 =?utf-8?B?cTJvSTViekduV1M5cVgvaHFnbU82ZEdSQlpqMjJUQkJrcG1RcmJ4VFR3MGNo?=
 =?utf-8?B?M0hrbW5RWWp5ejJVRU5sbW82QzBFcEdXZGhvc3pxR1daaitwVmE1V2R2MlZY?=
 =?utf-8?B?Y29WWDRvenhYWmJZdWNDMnBzdWgwU2hOSW0vQmE2YldsN3graEhXejY1US91?=
 =?utf-8?B?Q0R2VWN1cUJqN05abHZLZmVmbjBJK21XektJY3kzalZvSjlEcjVvMFJQb0s5?=
 =?utf-8?B?VWRrQzM5N1hXdW95STlQcFhZeVptNVAxMUNtWmlhL05xdGpKdHhPS3RqdkZv?=
 =?utf-8?B?MSs5a2RSeE5NU053ZmFiWDU3ZTh3TTkwa0d1blJCdVNFZWNlZTFQRzZIN05E?=
 =?utf-8?B?L285YTJydE8yV1dCd21WaGhrSVJ5K0tHRS9HQjV0d2FRcWRhTlUxMitGaWVq?=
 =?utf-8?B?QkZSTjgrUEJsUzcvbW9nbjErZTYwSkNseGhDWDVDSzUyZkt6bTVnMkZUK25n?=
 =?utf-8?B?aFVQWk9XSUs1M0ZNTllXZDNjS25BTitKaWx1Rm5wWGdEQktUU0VKTnB5Z1No?=
 =?utf-8?B?UkJQa0h5a0YvZ3RWaHNRRklGWG9hL1VpYWdOQW5ycmNFTWlxT1hHcDl3MzFX?=
 =?utf-8?B?WjBVdjFKRHVocWpiTDY4VW5IWlNiUmFvWTRTZmhmdlFKb01CVGtlM2FjS3Ju?=
 =?utf-8?B?akVkWnVkSjJ6NmxBMzZ2UXpsMEkxRjZaOEdIUGhYSFNZeGlFQWs1UnpnTHlG?=
 =?utf-8?B?MUhmS3MyclZqWHNSaERrckc1TUk0MEVhbXVoM0J4N2FZOHpxdTVCVTB2Nmg0?=
 =?utf-8?B?eFJSOGNjRDVtMFZ2aEJIc0tMUi91K1czZm1UUmJXVDhJaG9OR1NMUXdHUUxv?=
 =?utf-8?B?eWdRVWVaRnM1UU1XRmNBTkJuMEFIOUVTck8rQ2NxRUhJR0I1MzZxNGxSWmY1?=
 =?utf-8?B?SVR5Y01ZUms4aHF1ZkN6Myt6dmgzdEJOYmFmaDFIa0pXTWtqUzN4R0J1SUJ5?=
 =?utf-8?B?dkJKeWRRaEdoSzQ2U1VZc084L3NpbFhiUzR2NlhQTTI2YWROa21vVHpyS0tT?=
 =?utf-8?B?TUk5dFFXSWVyQ1JzZFZVSUVvOTVWZEhtOS9yaFBsb3hVQTltOEJDQXVBbm1W?=
 =?utf-8?B?dWpGQzMyeDNVRmYxK2gzdkpmek4zanpiRXgxSUljd2Nlb0NhMzFKT3BacWZj?=
 =?utf-8?B?WU1rYWdqcjlVbDBmQzZUN0FVa3BWNW5CTTV1SVZBVXZVbE05U2cxL1ZHMUoz?=
 =?utf-8?B?U1RBM2Uzd2lLNXdGdTRNa1BsSDBKRk5iR2VWZWJpNVJjRms5NXVSY0VmY1BS?=
 =?utf-8?B?UjJtL25CQjE1ZVdVSmtwQ0JrcDVyWjg0UWtCekZseGQ2SzhuYWdaQjZTZ2wv?=
 =?utf-8?B?ZjhXNDNHSjlVQURBNU0rVUx3UU9EM1RFM2JqTXNPRGMyRlhmbmUwcXVvR3Rl?=
 =?utf-8?B?NDhrRnlSbmRaY2xua0YwK1ZESTl2VFY4VFVrYkpDOHBhRFVCQnJCSlhxemRY?=
 =?utf-8?B?c254aWppb1FseFJyeWloMWxZUHdPTlVRNUJQWnlaSWREZ2V6eE9Ob2dFNnVZ?=
 =?utf-8?B?aFpIRXV4UnF1QTREWlBGcDRzRm1rWG5JdVVDSVJ3QzBBQ0tJSTZjakk4WVo4?=
 =?utf-8?B?QWRKSEI2aDh5aG1qZ3E0Zyt1aG9hbkxxc0cwUUlqWHE1YU1vNXQ2cXV5aGc0?=
 =?utf-8?B?VkpaY2ZaMHN0ajJBL0F5MWRUVm5aNXNvSDJFVkpWQVJsZUx5WkQ2TjVhU0g2?=
 =?utf-8?B?VXU2dFNUYnZrUXZMNnYxZUtTRm80WHM1ZjVLUmpOOVNGbGVsemdJeXB0YTdw?=
 =?utf-8?B?dHgyTHVFbXlwYkFXbWYwTnRWZVlhdm43aVB0V1p4V3hqTGJNWmNtcFRzSDFZ?=
 =?utf-8?B?WWVvdFgzN3BZc1YvWEdob1Y2aWwwTVNidlkwNTB3YlNscDBHU09USThDT1A2?=
 =?utf-8?B?SkpKd3dMQzNWQlZtSWVpaUpBTjQwa2pVRVhvUXI5aDdvL0N4eDA4dXQ2eFVZ?=
 =?utf-8?B?aTdVcldvNTZFR3FxZE01a3VKTGtxQ3RQTjhEOGprQkhDdnMyRVVhZEJRR05K?=
 =?utf-8?B?T0M0Y2RkUlk0SU9CWVEyY3F0dkNjd0RDaDNGZ3FPK05mM05ZMDhxalZHbEVW?=
 =?utf-8?B?U3V4dkJlSHIrazFzOFRMMFc0ZFNxei9kcTNOdjV4NXpVRjVteTZ1aEpBWE53?=
 =?utf-8?B?cXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: eed6d106-087d-43f9-9a16-08dcd2a213b6
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 20:41:13.8611 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eJ5QyXnDr3G8mwHbLjCm92LrigusQNPMScY0sNhnT7UDYlHjVaSx/+5riunS+qCwwxn/nKrWSFWVzw5KEIlYoB4LGrZ9tvJddyFL7Pr4Xgc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7665
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

--------------nbF0q1G00K02TktnZ06WHScL
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 9/11/2024 13:36, Julia Filipchuk wrote:
>> @@ -214,6 +214,24 @@ void xe_guc_log_snapshot_print(struct xe_guc_log_snapshot *snapshot, struct drm_
>>   	}
>>   }
>>   
>> +/**
>> + * xe_guc_log_print_dmesg - dump a copy of the GuC log to dmesg
>> + * @log: GuC log structure
>> + */
>> +void xe_guc_log_print_dmesg(struct xe_guc_log *log)
>> +{
>> +	struct xe_gt *gt = log_to_gt(log);
>> +	static int g_count;
>> +	struct drm_printer ip = xe_gt_info_printer(gt);
>> +	struct drm_printer lp = drm_line_printer(&ip, "Capture", ++g_count);
> Increment of non-assigned value "g_count". It is static so zero
> allocated but suggest to assign to 0 for clarity.
Assigning a static to zero will cause the checkpatch tool to complain 
that you are unnecessarily providing a value that is the default.

John.

>
> Reviewed-by: Julia Filipchuk<julia.filipchuk@intel.com>
>

--------------nbF0q1G00K02TktnZ06WHScL
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    On 9/11/2024 13:36, Julia Filipchuk wrote:<span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:f9fe6a1c-700c-419e-bc9c-86165b30c1f2@intel.com">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">@@ -214,6 +214,24 @@ void xe_guc_log_snapshot_print(struct xe_guc_log_snapshot *snapshot, struct drm_
 	}
 }
 
+/**
+ * xe_guc_log_print_dmesg - dump a copy of the GuC log to dmesg
+ * @log: GuC log structure
+ */
+void xe_guc_log_print_dmesg(struct xe_guc_log *log)
+{
+	struct xe_gt *gt = log_to_gt(log);
+	static int g_count;
+	struct drm_printer ip = xe_gt_info_printer(gt);
+	struct drm_printer lp = drm_line_printer(&amp;ip, &quot;Capture&quot;, ++g_count);
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">Increment of non-assigned value &quot;g_count&quot;. It is static so zero
allocated but suggest to assign to 0 for clarity.</pre>
    </blockquote>
    Assigning a static to zero will cause the checkpatch tool to
    complain that you are unnecessarily providing a value that is the
    default.<br>
    <br>
    John.<br>
    <br>
    <blockquote type="cite" cite="mid:f9fe6a1c-700c-419e-bc9c-86165b30c1f2@intel.com">
      <pre class="moz-quote-pre" wrap="">

Reviewed-by: Julia Filipchuk <a class="moz-txt-link-rfc2396E" href="mailto:julia.filipchuk@intel.com">&lt;julia.filipchuk@intel.com&gt;</a>

</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------nbF0q1G00K02TktnZ06WHScL--

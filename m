Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5B44C8303C
	for <intel-xe@archiver.kernel.org>; Fri, 11 Jul 2025 05:23:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9465610E9AC;
	Fri, 11 Jul 2025 05:23:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QmHPNCiD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBE5D10E9AC
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Jul 2025 05:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752211439; x=1783747439;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=qRc6aDMbyUdeoXM2PmbMkwyp+U4xANXo7aiXm52+YzE=;
 b=QmHPNCiDP49tCYFw9SuCGDsWTOSw+OkOkgg9yGouoHIb+Mn3C6YBlRHy
 HA+vcAdssNkamHEqhsIMf8J9ocnQew3da4pfosSTtYcWGjOdlOoIu7+Uc
 9yY7jTTlpMsU3VXgY13HoU0V0mnZOl+uWPs09HWlZtefwxct76P6z/G+F
 AgCJalO7XqMeReVkXNrj34EdSA6iFukW1Ov6LpbHHXx1EPmryqRDHTD8K
 6wYb8Vut6BPSJCWxwpOoggAN3VHlG5JSwV4F8Hl6zraW+x1GJBXAEXzGQ
 7+VVdI3sprHZZYtD0DL5iPQg6nMsNXaRC6Gc9lL0aIRvIajBmcdNcsyht A==;
X-CSE-ConnectionGUID: 8VtTmlM1ROqkl4jSJELFxA==
X-CSE-MsgGUID: F2KPOgHwReegr6VlXJLYnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="54636180"
X-IronPort-AV: E=Sophos;i="6.16,302,1744095600"; d="scan'208";a="54636180"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 22:23:59 -0700
X-CSE-ConnectionGUID: dP8VfZjEQsW1+we3gWA2aQ==
X-CSE-MsgGUID: GfUwofWcQWueCobUzGgevw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,302,1744095600"; d="scan'208";a="156063847"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 22:23:55 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 22:23:53 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 10 Jul 2025 22:23:53 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.64) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 22:23:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mo3ctDdLAW+AHv1+BlfbYWLDliuKg9q+FzyKA7VF+EoYXy3vu/v2Sm57hKEjt5KU43UI0w2asYZQC0NrUL7IDZdZRmRAaLHlTA2R0HwUNv86nz7PzALXrelMeBFB8LgscN7A+yykU5icAlKWBZS6HHLoubmYS3fa7EgrMM0VkxNu4ONzjOl/OWVJp4lqqhEZ5UOseM0gAvxA1ooJDgw3Pum4r7Z2IEwjR1KmgoaXhrqT9G55wxPaB8raTBfLQOhzTAnyZfbMtpdYDD2Je8cEf/grg0OLhiCu1O4dUxoowbTt5V3gH31tp/WFjthKHjflsMAwCdP2ysK5+JobJ2iEBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ll78JLiXhuNHSXByqysS3GCpQeGRiMazMpjwzJbZoWU=;
 b=OlvjrUiMCmVVeHOzgxn2TjALneOCLzstBwTpnraiyVUjr3ib2/aKhrlxwTv1613xTndiB7kroZqvYR36xr+Zz+rQB332eXFP1HvRU+kNGLLKqzax3+Z6u8n5MEuWZbXNRu9f5kUBVgFzVXk1ENscMZDZ13ifTbi8Bm1xT9NRwieun+dFbsAMSFLUIpQzV+/cDEfol1V+PXrxaD2jqprxRaz1+KUwSrapAbeLPFIUagBGPtGblX9Vimb8hL4BN9MmiPrTAfuQ/80f3T4Pz7xcq3FsPtal1Cp+hWpIawgUJFMgpp8VCl+kFIFJUtE7pnYeAWjvSzU522DI6tmSlkKELQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 DS0PR11MB8181.namprd11.prod.outlook.com (2603:10b6:8:159::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.29; Fri, 11 Jul 2025 05:23:50 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%6]) with mapi id 15.20.8901.024; Fri, 11 Jul 2025
 05:23:50 +0000
Message-ID: <05a87ac8-5287-4144-a939-9c8d461103d0@intel.com>
Date: Fri, 11 Jul 2025 10:53:42 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/9] drm/xe/xe_survivability: Add support for Runtime
 survivability mode
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <lucas.demarchi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <raag.jadav@intel.com>,
 <frank.scarbrough@intel.com>, <sk.anirban@intel.com>
References: <20250709112024.1053710-1-riana.tauro@intel.com>
 <20250709112024.1053710-6-riana.tauro@intel.com>
 <aG7-7Lqw79Y8azK1@unerlige-desk.amr.corp.intel.com>
 <e2880cff-fcc8-4c9c-9ff2-e446327fbcb8@intel.com>
 <aG_0lw07ql_S2dib@unerlige-desk.amr.corp.intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <aG_0lw07ql_S2dib@unerlige-desk.amr.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0062.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::20) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|DS0PR11MB8181:EE_
X-MS-Office365-Filtering-Correlation-Id: 077cc186-549a-4d86-59c6-08ddc03b1e67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bWpqaDMyTE1YQ3dxSjhhWnZOcnNBdnlISVNMUmZPRkptVkpKbmlYVm5rSmRJ?=
 =?utf-8?B?Z05hRGl1djBRV2pnb1p2THN2UW1RT0xPdGJ3amViWXdqanRqNDhQdHVPSHU0?=
 =?utf-8?B?dndiM0VXRjd4Rkw0Y0Z6eC9NdlpERmhCNzhhSlFlaWRoaHFvaWpUajhsNGNE?=
 =?utf-8?B?SXJ3azRxT1Y1QXZ3WTZJSzBNMGJlWktuaXlNcEFyLzBsRWdWS0Q3SkM0cHhs?=
 =?utf-8?B?ZHpSWVJYNXpJYXlBSU5ydFZkNXBLSlJ6RGhFbDBKN0t3M3ZZenllcEUwUkts?=
 =?utf-8?B?RE96RTkvSGVlSlRyeDJIUWhvSnFlTmcwcTJiQUpVTmxvUDQ4R2dkZ1h2eHk1?=
 =?utf-8?B?MkxBN08vSjBKc2d5MThpNkxFQkJVUUpOaGhBa3ViTW96bUlJY0pEaTVpT01u?=
 =?utf-8?B?KzVwSzdhQzB4aEY3YnNCVkl0V3pFRjY0aE5xUk4zNHdsTE9MbitTTE5zYSsv?=
 =?utf-8?B?OGt1cWlFWHVtTzFKakdWU2ZVNzdGMmE1Z01zcGtCR0JMUUliTmsyY2owRkYw?=
 =?utf-8?B?VjhTNEZXeXhNSThSQmNqZkZtWHdka2JBZFpWUHQyWVRkamxiQ0xERERIRnBk?=
 =?utf-8?B?TklLVUlKV21yZ2V3RXc3c2VQUDA0WGlFc2UwOHVsVmRVWjEyblZFajVRSU5o?=
 =?utf-8?B?ZHdjZlZsVmFtYWE1clVsaWN4eC9ITWFKSlEra1h1L1AwZVl3emRjdENSbTJI?=
 =?utf-8?B?ZHY2b25QUm1rSWRGZWJkUlVrWnFQQTd4aHlSVS9HaWhCaUZ2V3lNOC82QzJY?=
 =?utf-8?B?RkZGZUt5K1ZEQnJDNkVmaUFvWVNmdld6a3FIWmNiZERuZ0ZpMmFpUlg0WnZP?=
 =?utf-8?B?Qmh6bmV5blh2YVBhSGJVSWJ5K2gzTnYraTVQRzF2RUZlT1FIcHBFWkN0c25J?=
 =?utf-8?B?OXRlWnpsejB4WDBFY1VqUFMrM1BoM0hnUDdNcHpzOW00aXIvQ0JnRmVld05m?=
 =?utf-8?B?b3V4NEFKMEEwSFMyQW9FQU55ZCttWndkL1hscTg5YUUreFRZczVKR3NleEdH?=
 =?utf-8?B?ODVRRFIra0k2T3BCZXpBd1dZK1kyTGh6dUVmWDhyeERQcEpGcFdhMjZ0ZzFo?=
 =?utf-8?B?TjZEQjhWZjRmaFZ3YTkvUkFMYlo2U085OHREOVhocnl5bmJNb2dtNHY5YUFa?=
 =?utf-8?B?TXZuZ2U5akFuWkYyaGFDb0pORXBFL2tKeGYyclRrUFRMQ1I4UUcyTFlFZE5w?=
 =?utf-8?B?L2c0UGFYK0h4Zkx2YXlwcGxDUlg4THJ6cnZzaG5MZVVpa2p0ODhIVWZPL3hK?=
 =?utf-8?B?YWNVSFBpZjE1NVVJSko2SjEyaUFCQWR1UUFsOHM5bUdYWWJCUnNXeGNJRXZk?=
 =?utf-8?B?bWczVmpWNThybmlaSHAvMnFCV2lpNG1KY01DL011QmxDTDByanlSdzkzbXQ1?=
 =?utf-8?B?Vm5HNHg3MXRNRGRnRHF1d0hXZjFUaXd0VmRuZjhVTHZQQlZGY3Blci9ERUl5?=
 =?utf-8?B?dTl0ZDMrb2RNeXFGY1pzbkMyQU4zTlM0VDgwajA4d3lWNDZXWmticXJBR0ZF?=
 =?utf-8?B?SjFxczgrT0NJOFNTUU1VQVpGQW14c0ZTcXFNSmRrSTNpa3psaHl0Q2NQY1M2?=
 =?utf-8?B?bW9zZzhBemVPMDFCMEwrVGpDWFlrRVNkdFR4Smp4SldPSFU4NjVGWUNQZzQ5?=
 =?utf-8?B?NzdvNStadXROalJ5cXpxd0U1aHcyRU13TytXczkwdlEyWXZmdVR4QjlQbGs4?=
 =?utf-8?B?d01zTWFnRTA3dUtSaWNZZlR4dHRLVWxXc0hrcDhSMzFkUnhQK1NzRmNOQ0lS?=
 =?utf-8?B?Y2hvWTkycmtQdjFQWmFXaldIMkpWZG5uL3FZZVI2OXkrMWtLWGw5M3BrTjZo?=
 =?utf-8?B?bFhxbkVYOWNOdXllRzlheVhYdTRzWU0vZ3NhS0lqVnV2TFFOV0NUOGxyMWg1?=
 =?utf-8?B?WjZObnJuSXkzK0g0RFQzT1QyU0ZTUUhHQjVwTnlqU1JkLzI4bVdyc1JSZ2pm?=
 =?utf-8?Q?aNmvFqgFPVI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eG5XTFlDdWswOCsvZzNON2NMUllBcmxGSVR3a2tJNEIxWkIzYzRZYSsyNzEy?=
 =?utf-8?B?Nks3NUYzeUxLMHJaNVJwSTNyWCt2QjhreVZHaUJnak1oVjJRbWxiWEJpUjJs?=
 =?utf-8?B?VDBxb2ZSVTF3ZWg5dk1PbVdoL0c5R0hTenFtZm16SGN2UDUyaDBNMEpUU2Qz?=
 =?utf-8?B?eWVvZ290Zy9iOGU1WHNPaXdPQTI4R2RHNTg1RTNxNC9qMmthUFhWemxacmww?=
 =?utf-8?B?czdmS2dCSWtRNUk3MTdXOW5mZFVSelN5bERkZTBFUnhuTGdOMGpqa05BVjdn?=
 =?utf-8?B?VGpMY3ArNFhQalV4OXc3SEZlbkFKaHo5a092QnBFeHNVMU0wclBOd1FMTENG?=
 =?utf-8?B?Y0h0K1lYSFppdXNlbGlOcEdJeW1lQ2pDcW9wRjVqTVhLc09tK2cxZDhzMkRP?=
 =?utf-8?B?eHdGcnVQSEpnWXAxV2hyZjhJR3V2U21qZzhSUEtoWDVYY2xwbjh1UDB6dGw2?=
 =?utf-8?B?UGZ5U0VybHYzQUlPNklxN0Z2aXFNbHd2Mm1ZeHRZbWEzQ1JTZ0tlUi92eEtY?=
 =?utf-8?B?bzNhUlQ2OXE2STRDOGoyWjlpQ1lyYXB3WUlzb2FVYUduRjRCVTlUeXV6ODhw?=
 =?utf-8?B?Rk1QMjNBTGNWZUdJZi9wZ1pyb0x4dzhBY0JkY0JNK1hjS083b3RUZmd6U2sr?=
 =?utf-8?B?TFZ5UFZjZmFpMzJVajE4N3h1V1ZMak9BOGxGRlBnQW1raWphQVdmUDJRbkZo?=
 =?utf-8?B?WENoV3dTYTBkNm1NbmdsNjg0ODQ3VGJUa2NqelYreGxwNmprekxGVFlML3dH?=
 =?utf-8?B?NmlPTDNDR0JSUTIzR2V3Y0w5WVhuOVFCTlBFVTk0L3FsSnUwSURkdnhRMkhJ?=
 =?utf-8?B?ZEUrYW1iYldyRjFNcHJOVit2MzZYMnY5ZDVTeEFHT0U0OXA3WDhwd0xvTk9T?=
 =?utf-8?B?RWd5N2kreExqczhMK1U4ZXZQTkpHR2FlZlhyaVI0TElEV3ZBbDg5SjFFdEVz?=
 =?utf-8?B?UTBiN1ZZVW1kY29EMWZGbnMyYWpXWmgrY2lwaUtWVnUyakRFaVY3SStvQ0Zi?=
 =?utf-8?B?b2VFUXVWUzdHeFVFRWV6dm1jWFY0SjdLSHZobWpWYm8wKzVlVjMzWWM3TW1y?=
 =?utf-8?B?SUM5czUzcGdzL1A0QWpNQ2prYmtJNGVveEM1TnJyR3VCQ1dQTm83NTl0Qmp2?=
 =?utf-8?B?ZUNaVUY2TTlJQzlvOHRlamZmRm5veWNja2pIeHMwWVY4Z01COExwN2tBNnFL?=
 =?utf-8?B?eVVUUEZvZDU2ZUVMbUpRYW1mc0pBdWxZRWswRldOeDBxd1o4MlpkbVJ0RlRq?=
 =?utf-8?B?TndUK1lPbW1NbEpGbDU0VkRrYlhSQWdOYkNDZzA1MWhGdm1KRjRrd1RvYU5F?=
 =?utf-8?B?M1MzaHlXQmdhV3hkVmlhZ3hkODZRb25YQm11UWN5SGl0L3N2QmVIUUJXcXFu?=
 =?utf-8?B?bTd5S04yejE1QmNEYUhnV0tTSjJNaVZ5YktoVXlXN3ZmMDNkcGU5Vk1OQ0hv?=
 =?utf-8?B?OFl1UWljbEdtcjlvWFBVWUI3MlhpcWhSUDVXdVI5VS9HSVdtV3FIL1NQcEhL?=
 =?utf-8?B?YXpqQTllTWtWa1JyTi95VVJINTNHbkpIVmhHNk0xeDNLaVdiQzFHRTBGOGxN?=
 =?utf-8?B?WXF5ZExGcWVqUXc4ajBvY0JHV0ZocVk3Z2VOZlNXMlFRb2pybmhRSjg1UnZq?=
 =?utf-8?B?T3Jyd1V5bEl0Z1NHMWhETy9DV29tYVhEeis0WjJSVHNyZyt1eUNROVBCZjVH?=
 =?utf-8?B?MWJxR2VYYU5DeFNsOVdNak1KbXNRcWc5aWREMFNYUklGakdXeGxoV2Q2SjEr?=
 =?utf-8?B?ZzlNTVd2d1lFZ2h2NzB1eldzVGFlK2loalV2WDdXZ1o5elNwek9LcHc4d2tI?=
 =?utf-8?B?dVc1VDZ5cUJGMlVIbVozbjhab3JIT2FqTjRYZmlGeUNrTlg3dkxSTGduKzZV?=
 =?utf-8?B?d3JoUlVBbjZCaVBDU2pZUTBxZmp4MDh1VExuTmxoWUxsVW9YcHhlVmVIbC9Q?=
 =?utf-8?B?QUswcExZcFlQaTJpcU8rbWptb0pYU2NuVkpISk1UMGFKS3QybzcvY0JtSERs?=
 =?utf-8?B?TzdlWU9KRE1DTlFMYkVad1BTWGtQcGNwWTFzUnRyR1JvUzlGYVU2Wk9NZ1dh?=
 =?utf-8?B?dCtETFg4WW42ZURtNW14RklLV2RZaGxMWWYxODlZZUk1Q0wxc1NDUzRCekxa?=
 =?utf-8?Q?YM43C6BvPwRdXnVALYPM67T35?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 077cc186-549a-4d86-59c6-08ddc03b1e67
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2025 05:23:50.6266 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9R6gKEMVk44iuiythzdPnZCMQvXhkUXVsOYnvwlwIb093D0VbilP7tEDukZlwMFgDro4naZDKhGWxPY+XU0EUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8181
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

Hi Umesh

On 7/10/2025 10:42 PM, Umesh Nerlige Ramappa wrote:
> On Thu, Jul 10, 2025 at 11:29:44AM +0530, Riana Tauro wrote:
>> Hi Umesh
>>
>> On 7/10/2025 5:14 AM, Umesh Nerlige Ramappa wrote:
>>> On Wed, Jul 09, 2025 at 04:50:17PM +0530, Riana Tauro wrote:
>>>> Certain runtime firmware errors can cause the device to be in a 
>>>> unusable
>>>> state requiring a firmware flash to restore normal operation.
>>>> Runtime Survivability Mode indicates firmware flash is necessary by
>>>> wedging the device and exposing survivability mode sysfs.
>>>>
>>>> The below sysfs is an indication that device is in survivability mode
>>>>
>>>> /sys/bus/pci/devices/<device>/survivability_mode
>>>>
>>>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>>>> ---
>>>> drivers/gpu/drm/xe/xe_survivability_mode.c    | 42 ++++++++++++++++++-
>>>> drivers/gpu/drm/xe/xe_survivability_mode.h    |  1 +
>>>> .../gpu/drm/xe/xe_survivability_mode_types.h  |  1 +
>>>> 3 files changed, 43 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/ 
>>>> gpu/ drm/xe/xe_survivability_mode.c
>>>> index fefb027b1c84..ca1cfa13525a 100644
>>>> --- a/drivers/gpu/drm/xe/xe_survivability_mode.c
>>>> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
>>>> @@ -137,7 +137,8 @@ static ssize_t survivability_mode_show(struct 
>>>> device *dev,
>>>>     struct xe_survivability_info *info = survivability->info;
>>>>     int index = 0, count = 0;
>>>>
>>>> -    count += sysfs_emit_at(buff, count, "Survivability mode type: 
>>>> Boot\n");
>>>> +    count += sysfs_emit_at(buff, count, "Survivability mode type: 
>>>> %s\n",
>>>> +                   survivability->type ? "Runtime" : "Boot");
>>>>
>>>>     if (!check_boot_failure(xe))
>>>>         return count;
>>>> @@ -288,6 +289,45 @@ bool xe_survivability_mode_is_requested(struct 
>>>> xe_device *xe)
>>>>     return check_boot_failure(xe);
>>>> }
>>>>
>>>> +/**
>>>> + * xe_survivability_mode_runtime_enable - Initialize and enable 
>>>> runtime survivability mode
>>>> + * @xe: xe device instance
>>>> + *
>>>> + * Initialize survivability information and enable runtime 
>>>> survivability mode.
>>>> + * Runtime survivability mode is enabled when certain errors cause 
>>>> the device to be
>>>> + * in non-recoverable state. The device is declared wedged with the 
>>>> appropriate
>>>> + * recovery method and survivability mode sysfs exposed to userspace
>>>> + *
>>>> + * Return: 0 if runtime survivability mode is enabled or not 
>>>> requested, negative error
>>>
>>> is the "not requested" still applicable here?
>>
>> Copied it from boot survivability. Not applicable, will remove this
>>
>>>
>>>
>>>> + * code otherwise.
>>>> + */
>>>> +int xe_survivability_mode_runtime_enable(struct xe_device *xe)
>>>> +{
>>>> +    struct xe_survivability *survivability = &xe->survivability;
>>>> +    struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>>>> +    int ret;
>>>> +
>>>> +    if (!IS_DGFX(xe) || IS_SRIOV_VF(xe) || xe->info.platform < 
>>>> XE_BATTLEMAGE) {
>>>
>>> Do you think this condition can be better handled with a 
>>> has_runtime_survivability for platforms that support it?
>>
>> Was used once so added it here. Can be split out to a different function
> 
> Oh, not a different function. I mean a has_* property. More like entries 
> defined in xe_pci_types.h under struct xe_graphics_desc.

That might be unnecessary for now, since the function says not 
applicable prior to bmg.
If in future, this is not consistent then we could add per pci_desc

Thanks
Riana

> 
> Regards,
> Umesh
> 
>>>
>>>> +        dev_err(&pdev->dev, "Runtime Survivability Mode not 
>>>> supported\n");
>>>> +        return -EINVAL;
>>>> +    }
>>>> +
>>>> +    ret = init_survivability_mode(xe);
>>>> +    if (ret)
>>>> +        return ret;
>>>> +
>>>> +    ret = create_survivability_sysfs(pdev);
>>>> +    if (ret)
>>>> +        dev_err(&pdev->dev, "Failed to create survivability mode 
>>>> sysfs\n");
>>>
>>> You do not return ret in the above if condition. Is that intenational?
>>
>> yeah this is intentional. The device has to be wedged since it is not 
>> usable on such errors even without the sysfs.
>>
>> Thanks
>> Riana
>>
>>>
>>> Regards,
>>> Umesh
>>>
>>>> +
>>>> +    survivability->type = XE_SURVIVABILITY_TYPE_RUNTIME;
>>>> +    xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_VENDOR);
>>>> +    xe_device_declare_wedged(xe);
>>>> +
>>>> +    dev_err(&pdev->dev, "Runtime Survivability mode enabled\n");
>>>> +    return 0;
>>>> +}
>>>> +
>>>> /**
>>>>  * xe_survivability_mode_boot_enable - Initialize and enable boot 
>>>> survivability mode
>>>>  * @xe: xe device instance
>>>> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.h b/drivers/ 
>>>> gpu/ drm/xe/xe_survivability_mode.h
>>>> index f6ee283ea5e8..1cc94226aa82 100644
>>>> --- a/drivers/gpu/drm/xe/xe_survivability_mode.h
>>>> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.h
>>>> @@ -11,6 +11,7 @@
>>>> struct xe_device;
>>>>
>>>> int xe_survivability_mode_boot_enable(struct xe_device *xe);
>>>> +int xe_survivability_mode_runtime_enable(struct xe_device *xe);
>>>> bool xe_survivability_mode_is_boot_enabled(struct xe_device *xe);
>>>> bool xe_survivability_mode_is_requested(struct xe_device *xe);
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode_types.h b/ 
>>>> drivers/gpu/drm/xe/xe_survivability_mode_types.h
>>>> index 5dce393498da..cd65a5d167c9 100644
>>>> --- a/drivers/gpu/drm/xe/xe_survivability_mode_types.h
>>>> +++ b/drivers/gpu/drm/xe/xe_survivability_mode_types.h
>>>> @@ -11,6 +11,7 @@
>>>>
>>>> enum xe_survivability_type {
>>>>     XE_SURVIVABILITY_TYPE_BOOT,
>>>> +    XE_SURVIVABILITY_TYPE_RUNTIME,
>>>> };
>>>>
>>>> struct xe_survivability_info {
>>>> -- 
>>>> 2.47.1
>>>>
>>
>>


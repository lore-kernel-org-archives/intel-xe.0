Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2665A606A319
	for <intel-xe@archiver.kernel.org>; Thu, 22 Oct 2026 16:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MWdChA0x
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6EB611282D;
	Thu, 22 Oct 2026 16:55:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CC13112817
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Oct 2026 16:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792688099; x=1824224099;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=hmBj5LGRmd+kGLs1HiNbCgqAkaKY00FfRbhAHw4RhOM=;
 b=MWdChA0xWmIqRUN/2eFLDTnVW84nhZCj+KWiyqCL3pyI0SkKUYO5jyn1
 Hhi6MSNEiqos7bSl54RnU5vHxMWo8o6WXpHyDMY+/r+mXs/f3p1d+GNvR
 F8eFYX4cB0X+eRD5oFwDig4DqialzfNfSCosVdiEsI1v8s+gAKQMDaXxT
 rtsCmb7M1ZKTEjzrcaHprWxiV1vmzOJ/yQl9iWomkSSL26uOShzHRHR7X
 5vHQRyNZGFjb+yLm5N3Beo09buGowB0dSLr8aF+dv7IPF45iV8TkYtzhs
 eDvfiRN4C4WaGKSaJpv0asnnI6T8rs+wjM3qZGCoIPTYHhEeb9YBtW4h5 g==;
X-CSE-ConnectionGUID: 08IxrJS0QBeCwcI3tnQUEg==
X-CSE-MsgGUID: E6MLIjzKRrySheUQGuJPEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1317978"
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="1317978"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 09:54:58 -0700
X-CSE-ConnectionGUID: e6ZbLaloTpWaAuYTRgmbyw==
X-CSE-MsgGUID: V/YxfYFTQ4Khm/0IeTCVMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="3352468"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 09:54:58 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 22 Oct 2026 09:54:57 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 22 Oct 2026 09:54:57 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.47) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 22 Oct 2026 09:54:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S8VAPNbbvYx5jp/CCiD5frrMLSwPJkdlBe87odbR3WhVV47v3jakRpYS09pJhID2cCpS63RRAG8lz1j5Ty8IMSr/vSVRBn8JUOC5217Eme+S6XoQjHaMXwfO1MZ7eAVD+KUd1e8NffbguvK3Vn5drlc7FRqRAesCLcmz2UPR33S1lfXXo9fc0I3FHzuCVJHmyAMW1MMLGGMLKQIqhhW0R98ufLG79sNfgh64TKFM7jUFis9emoefVNv5KUJBxt1cjVeX49PwDr64BbRLz9f4Pnz9EdB17T+0K9QwixNWrq7AcfjCTs5o0cYyQwIEefczK+v28ltJFOW+VVxejG4jUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JJpCqABQf6iKblx5kDOrxJyDubqOKS7+1T6TsubvQ5g=;
 b=MmmTYD1WViFauP3/2AqCODh4TfUWfCXSWgI3n0vSl1bBQXd1i6vpQdm90mGzQXfjLRoXxxU5CVSwJeMbfTgChiTC7gWq4vx9HF+xQeyqdlie54SbpU4lg+XklUpmxj66JkIHw+OE6tjbEJ9qzGjeTt8aznczOjBbWZJn0EsmGAPF6MwTHvPn/w4c8wUTiKX57TVbd52kQhicdYAPL/uC8TR+yMz4Ku5yoN0u0Pe/xDtD53qFqt3y+G2A1P0OTPd4NpGOU+YBlymZ6P2anVwZ/mhyV4K1bdSY14XHKd9J5ldAUhGEILGctHi9EtnAYwstDrc8Sb8TsJb0p4yBp5SGUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV0PR11MB9792.namprd11.prod.outlook.com (2603:10b6:408:385::5)
 by SA3PR11MB8076.namprd11.prod.outlook.com (2603:10b6:806:2f0::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Thu, 22 Oct
 2026 16:54:55 +0000
Received: from LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8]) by LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8%5]) with mapi id 15.21.0546.016; Thu, 22 Oct 2026
 16:54:55 +0000
Message-ID: <03767785-851a-4b84-8271-388d33d7669c@intel.com>
Date: Thu, 22 Oct 2026 22:24:45 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/12] drm/xe/cper: Construct CPER record for hardware
 errors
From: "Nilawar, Badal" <badal.nilawar@intel.com>
To: Raag Jadav <raag.jadav@intel.com>, <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <daniele.ceraolospurio@intel.com>,
 <riana.tauro@intel.com>, <mallesh.koujalagi@intel.com>,
 <aravind.iddamsetty@intel.com>, <himal.prasad.ghimiray@intel.com>,
 <arvind.yadav@intel.com>, <syed.abdul.muqthyar.ahmed@intel.com>,
 <nitin.r.gote@intel.com>, <pravalika.gurram@intel.com>
References: <20261009104602.1075405-14-badal.nilawar@intel.com>
 <20261009104602.1075405-18-badal.nilawar@intel.com>
 <as9Zvxl3-Lx4H6En@black.igk.intel.com>
 <332beff5-53b6-4043-8b60-7c73ca780eff@intel.com>
Content-Language: en-US
In-Reply-To: <332beff5-53b6-4043-8b60-7c73ca780eff@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0349.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:21f::8) To LV0PR11MB9792.namprd11.prod.outlook.com
 (2603:10b6:408:385::5)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV0PR11MB9792:EE_|SA3PR11MB8076:EE_
X-MS-Office365-Filtering-Correlation-Id: 12bdf949-962c-4865-7f90-08df305d3272
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|56012099006|4143699003|11063799006|261009223027099003|22082099003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info: dgoHKPIOBt1Na9om6aRaNHGVztMX44X9rpVED/0DpYpNvfSYxUPDtqBNKDPl8Y3NgM7Zvwkt9O3P9Xdol+vwL54kT2sSORRm2TnRWfnuO/OJlEI636IQqRRRw3651pPeWriyiP4suRLQ/gEeTmMx7Cuz30LA3+qU6PY1i2AOMHzwWjC79C8QBXeaW6BSV9gpOv7eOAEpVb/XSnoEzIRj411Kl4YzytxLutc2z4/zozOy+Qx99O4neAuXdWatwE5s3/yr6Yy72OI9SQLJ7S7lr11Y1dvy8+quXBDuTQDuoo6JJzZXTbKnI3GLNkxmddGXm6vr9boRjET2VqICzMWTuKvny4zi88aIvuKcWXqiDopluguEbJR6m8FHTD4zgSEpIAMpIBi3DIi6VtOXF1cQKOQj9MB+jW07IpouihVx4SSch/7zIK/l6Mw80al6xdcFr7Y1gQ7RQVmrfcv0p8/Sndi8J6BrZWdtniNCsBmAUUIEqyjpj5m9UQRWhNqCDajTnVNeR8R7XgAG5x2r4fjyIY/gmwBDKX9xRAJTE/Zr8sLw8IMtxf4HlmJV8VYgIohvuOaHKC+T4R3T0xVLo8z9BauaWr93qLJgNJgVHuUCM6cPLpPZE6j5+hABNTna6Q1KPenyjgsVk4Q/RhXHRvqT/PTPmK/7pfdbRSCKZN9qw/A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV0PR11MB9792.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(56012099006)(4143699003)(11063799006)(261009223027099003)(22082099003)(18002099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?akE0c3VFZm0zMGZtNjdCRzVSeUpCaFNydWxIOFo1Ny85VEVaazlHVE8vWGpZ?=
 =?utf-8?B?QXpDNW5TYTF4OHV4ajhqdGVjdFRlQWowMnJPV0NHSThaNVlCQVhHSXF4QXZM?=
 =?utf-8?B?UmlUL0ZaTUpjeU10SlkybFIvRHBDdm1ocTdaclB4dTZQeDdQWUhhdzNrUkdR?=
 =?utf-8?B?QXdWZHB4V0MxblFvek1CL3MwVXM3eEthUEhjcDRDS3krY1NqR20vOVhXN1Fw?=
 =?utf-8?B?bmxRSHp4Z1o1dG56OHNDYjZNZGIwSVJtU2hnQ3VHenVOVEIyaFF3MGkxYUR1?=
 =?utf-8?B?UE5SbG5nVGRwOVlFd0JlOFhTYy9VZTlzalZYSzU4MWdFNjh2ZlkwWmVyZXo4?=
 =?utf-8?B?M2g3ZG1KLzR4RjIxK0JWUHk2VEV6aUl2Sk4wb3lCRldPUnJJaEJUVmRRYkxB?=
 =?utf-8?B?VDlOZE5QdHNDTlRlM1ZxdEg3WE9lRzBJbmRsVU9rTDFScnVHMy8xTHliZGNH?=
 =?utf-8?B?TGNiMU5Ja1UxcFRSTExZdUJsYXBlbWFCV21LTVY5TkZRdXFLL1dwOTdpWW9P?=
 =?utf-8?B?U0QycVE0Vk5jZmRvcE5GeDZHcGNqemlGRFYwcExRbzM4dU80aTBnRDgxV29k?=
 =?utf-8?B?cms0NFhDVkVRQXJDTmhOYUtpQXlnM21UMmh1bnBBSWlQdlo2VExsbXY4d3Vl?=
 =?utf-8?B?N1JsN0Z5L3dBOWtSTnZsdGhOU3U5MUJ3Q2tMc0NNMjg0aHZwOU10dDZnamow?=
 =?utf-8?B?dFQxY3lzQ043ajVZR25ZbExSd09MaXBVblY5NUJ0b0lWaWFuR0hRbUhWTGdw?=
 =?utf-8?B?bTMyR0JRZnRlYnRHeDM1akRHQW9DOCtXWjVaWDE5Tm5YZXFkRjl5WnM0NEE0?=
 =?utf-8?B?NFhqYXFVa2MvdUp0dnhPVWpJaG92dWNpWC93eTVjN3FURWRReVB5WVZ2K2cx?=
 =?utf-8?B?aDVGZHQ5U05xUEVvcjYwRzR3UVF6T2RvTjlVU2FGSGIyQjc4a3FGWVArSlVo?=
 =?utf-8?B?MEZQSEdROG9xRnhnUkYzaXJrOXVqaUN1TGxhb3pOZHA3TTVxNWMyUlZqd0hJ?=
 =?utf-8?B?TGs5VjA5UmtkU3NGampDOVdEMmUyK1ZteGxaRU93RXBFU244TDkwUXRXZ204?=
 =?utf-8?B?TjI5ZE45SnJZNlpna0pXUFJFMzBIT1JpcWVYc0EvTlg5VU4zaWFwdnhyVEhm?=
 =?utf-8?B?RDVvLzArbjV0aVNzc1kvL0pwZm5nZ1Aya21sSnNNcVhKTEdOd0ZCY0U2bmIw?=
 =?utf-8?B?ejRSMGpnNktMRFl1S2QxaHdJaWJTMWpVbFliTmpkKzJ0SXpLSE5zNnY3VVMv?=
 =?utf-8?B?SWFBWkY5NGQ2L1Yvc0I3SjZvajJSYktpRUhrMXQ1dkNFTkpSaVpZdlJPYmd3?=
 =?utf-8?B?aFdwdTIyYXZZSW5rYm96WlVDejdRSnBOOS8xMWtJZTA0V0FjOFBLSjQvbVFj?=
 =?utf-8?B?dFBTM29wVzIzWk9TTWhiSG5VdVFqLytIUEZDdHlENDduRWxzYlBlMWtuTmk1?=
 =?utf-8?B?MXlFNFk2UDF2VzYwRmdPbW1jdmVxeVlGNTQvRU1YRksyNlB3b3F0NERRNmh0?=
 =?utf-8?B?b0RKLzBxQzVyRXRXeEE2ODlyTlptQmFjalBNbWRWZ2phYTkvWXpob3d3cllS?=
 =?utf-8?B?enNYanVnb3ppaUZpQXVFelM3aDdLL2xwUHFGQ3hYaTE5WDZOdDB0cUQzYkxp?=
 =?utf-8?B?bEFNWFFkUDlWdnMzbTUyQ3VOWU1LcytsS0R0MGlJTDBQcmZ5Q21UdUxoK1hN?=
 =?utf-8?B?anpaL2w0WU03MDQ1V0k1K242czE2TVpaNjU4UHJsbTUrSmdvazNTSGpNZko1?=
 =?utf-8?B?Z2dTZDZIbW1Db0JHOW5zelhUMFM4Nm1NVE9zTEVVb2lDWlRONzRvTHJPQktp?=
 =?utf-8?B?bHlnck9jVjBIVTJqNUZ2K1hOZUZRZktZS1dRSlU4MUdDTVpydFd5Wk5sM0Ju?=
 =?utf-8?B?YW1RZXA2VkU1YzhOWWIxQmxWYmpYNEh2cHd5REltOHRUeVFWcEJvWFFEYzhU?=
 =?utf-8?B?ZHpxL05kTm5QR2tZNUxZSk95K1hodnVTMFVOL3p6M212SVdBelJ5Z25HVGVO?=
 =?utf-8?B?WUpqcHhSaDQ4NGdUcnJWc3hlR2tSK0NNTG1SWjRMeDhITS8wOWJkRkdETmh1?=
 =?utf-8?B?cW1nM1QzL3hNeWFLWTJuMnVxdGV3WGpDQUJ6T1hwMUJ0TUNYV2YxcWQ1VCtD?=
 =?utf-8?B?MDN2ZDEraTYvVWJOeUJabXNyNGNaQnk1UG1aYTZacUZsS1BRMnIxS3FFcHI5?=
 =?utf-8?B?djFyL2o5S1ZKZUNEMFVXOVBkNlA2YUtGZko1OTYyTWo4YnhHWkdNSVo0Mmpk?=
 =?utf-8?B?Znhaak9KaXlQSTRQWXJRdjJHc2NiY2pMRjhOaWxCNmlvOURrNDVmcmZ3RlNy?=
 =?utf-8?B?djJaMU5BSk5NdmlwNmVpQkFjNitQZnVUOG9HNWZocWNJUGVWMlVKQT09?=
X-Exchange-RoutingPolicyChecked: qOp8hPNakWUV2Kvh8PAVnW2eeKGMzA2J7MU+EpIe7ci5Y1TJbhywMVDhUWr3NZDujaMISuoXndn/rjyh6bm2vDXVXEAqzI95PDnhCMz47lAchXGVqgPpIgvpwseLC3bZsze1YNrgh3jILRdiL60VO9TzyiSsaA7/EkeZs+Hhq4VslKUTIRg1t3fYxJ9qX/Rm8wAVJWfcM9MlcO7HG48rf80OSK3tfVdGH4guvxNIWtj3mvj44JbIa+Rm95AORIRjqEdReEPIUqCwVTA2DP31nroEVO8EvOAQpS2wc+pQ+CFNVXBvoayloi6pVoKi4btEKxymIMHMRQoaD0iHIHbcSQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 12bdf949-962c-4865-7f90-08df305d3272
X-MS-Exchange-CrossTenant-AuthSource: LV0PR11MB9792.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 16:54:54.9682 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9SE9c7fKlcs6I1FAuHrAld936+nuuP0bysMm6TSxFIPJZQaNk/TiryBsxPstLB2gbtvOOLtbXnvM2bZfjb3EYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8076
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
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 22-10-2026 19:10, Nilawar, Badal wrote:
>
>
> On 14-10-2026 16:00, Raag Jadav wrote:
>>> +static const struct xe_platform_id_entry xe_platform_ids[] = {
>>> +	/* 0x674C  platform/8086:674c */
>>> +	{ 0x674C, GUID_INIT(0x9046afe5, 0x9041, 0x5124,
>>> +			    0x86, 0x14, 0x92, 0x55, 0x0d, 0x9e, 0x9d, 0xa6) },
>>> +	/* 0x674D  platform/8086:674d */
>>> +	{ 0x674D, GUID_INIT(0xf95911b8, 0x6564, 0x5905,
>>> +			    0xa6, 0xa7, 0xb9, 0xbf, 0x54, 0xab, 0x6c, 0x27) },
>>> +	/* 0x674E  platform/8086:674e */
>>> +	{ 0x674E, GUID_INIT(0xb8d24106, 0x0108, 0x59f1,
>>> +			    0x8f, 0xfc, 0x9f, 0xc4, 0xa9, 0xc9, 0xb7, 0xb0) },
>>> +	/* 0x674F  platform/8086:674f */
>>> +	{ 0x674F, GUID_INIT(0xdd8dd88e, 0xef2f, 0x59b1,
>>> +			    0x99, 0x15, 0xdb, 0x6f, 0x1d, 0xc9, 0xb4, 0x5d) },
>>> +	/* 0x6750  platform/8086:6750 */
>>> +	{ 0x6750, GUID_INIT(0x1dd66c44, 0x87d5, 0x524a,
>>> +			    0xad, 0x6e, 0xfc, 0x18, 0x9d, 0x42, 0x6f, 0x1a) },
>>> +	/* 0x6751  platform/8086:6751 */
>>> +	{ 0x6751, GUID_INIT(0x17d0dd04, 0x2fad, 0x5400,
>>> +			    0x99, 0xc8, 0x9b, 0x45, 0x51, 0x3b, 0x67, 0xe3) },
>>> +};
>> This is unrelated to cper and shouldn't be here. I'll rely on Matt's
>> input on how to deal with these.
>
> Agreed, I don't think this is the ideal place either. For now, I'll 
> keep it here and, based on Matt's input, consider moving it to 
> xe_pci.c, which maintains the PCI ID list for the platforms supported 
> by Xe.
>
One reason I placed the table here is that these aren’t general-purpose 
platform GUIDs; they’re UUIDv5 values generated specifically for CPER’s 
platform_id field, using platform/8086:<device-id> as the name.

Since CPER is their only consumer, keeping the mapping with the CPER 
code seems reasonable to me.  I’m happy to follow Matt’s input if 
there’s a preferred place for this kind of mapping.

$ uuidgen --sha1 -n "$INTEL_NS" -N "platform/8086:674c"
9046afe5-9041-5124-8614-92550d9e9da6

$ uuidgen --sha1 -n "$INTEL_NS" -N "platform/8086:674d"
f95911b8-6564-5905-a6a7-b9bf54ab6c27

$ uuidgen --sha1 -n "$INTEL_NS" -N "platform/8086:674e"
b8d24106-0108-59f1-8ffc-9fc4a9c9b7b0

$ uuidgen --sha1 -n "$INTEL_NS" -N "platform/8086:674f"
dd8dd88e-ef2f-59b1-9915-db6f1dc9b45d

$ uuidgen --sha1 -n "$INTEL_NS" -N "platform/8086:6750"
1dd66c44-87d5-524a-ad6e-fc189d426f1a

$ uuidgen --sha1 -n "$INTEL_NS" -N "platform/8086:6751"
17d0dd04-2fad-5400-99c8-9b45513b67e3

Thanks,
Badal

>
> Thanks,
> Badal
>
>>> +static const guid_t *lookup_platform_id(const struct pci_dev *pdev)
>>> +{
>>> +	unsigned int i;
>>> +
>>> +	for (i = 0; i < ARRAY_SIZE(xe_platform_ids); i++)
>>> +		if (xe_platform_ids[i].device_id == pdev->device)
>>> +			return &xe_platform_ids[i].platform_id;
>>> +	return NULL;
>>> +}
>>> +

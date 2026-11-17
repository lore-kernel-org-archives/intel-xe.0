Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24931606A893
	for <intel-xe@archiver.kernel.org>; Tue, 17 Nov 2026 08:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ltW38bZ8;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=lmkhZUOa
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCEEF10EB6A;
	Tue, 17 Nov 2026 08:49:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5F3510EB6A
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Nov 2026 08:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794905359; x=1826441359;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=p9znOew7DLt46wLHJlwvPjIXzftMB9bwNvoIKMP2FsE=;
 b=ltW38bZ87QwyX3h6kGUzzT8769GMMtZCoPUKIyJHiY1oTxJ0y56Q/eR1
 paFpzQ0IvBHi5Jsf8HTFa9Ey7CXQiA7b7tDQRGcgo46T30hSSjkAYMp0n
 NPm2TC+Thlss+HL5ax3mDk+5d6LwqDmtoXOSmDqRyLkydr4/u5GTyQHXB
 Rkv9bdiW/YCS/FKD3th9LASCctTutoTi/Iilf6GcpBy18zuxwT4xgmSCt
 8zsC779rcd2RhA04lnC+wYAma2CIOp7QiOc4dFNVFRVix8Yjh3Mkm/PDF
 A5yVx9g1vXEWZF3oI92jiq55plit/D7PLRBUHOi6e+Eat+xRatHYUp8q1 Q==;
X-CSE-ConnectionGUID: ZEe6jiloTDWv0krfTd+ayg==
X-CSE-MsgGUID: Y325JYywSjeYDH2LZJpLKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3580865"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; d="scan'208,217";a="3580865"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2026 00:49:09 -0800
X-CSE-ConnectionGUID: rPJ0xuU1Rne+AiiXCiy4Bg==
X-CSE-MsgGUID: x4tpqlXmT9GF2H5mby5E0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; d="scan'208,217";a="9914024"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2026 00:49:07 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 17 Nov 2026 00:49:07 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Tue, 17 Nov 2026 00:49:07 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.40) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 17 Nov 2026 00:49:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lVoXlfHs/TRfOLR5bzHO19D5u1XVTsLP4wEsUNfNk6PgKhGWIs9gSbcYuuK2IyB4DTxvsos5bCUeV/z29B2fhtlCB0pbugTCu3eRgyKGT1beWGDnY+OUxjDWhZ4RSA4uk3z4G81jH8rMC2/scMe1+q0treXu3jIRt6Uoe0fWl8TrvKfSkDwCSQgH+ASsKPMAKgEiloWeHxtBq+61itwVfCf1E5wmy/xFyGfwwNIZXmMhj6rYf0kBcXndiKmndksrlkuDUl703L2/lczQF0lRn1iIrVaI9msLQQ2CyDN4rzw8QUeBOW5PtzOBm2Cf3H2XD5UCPCYOLj7Ae2uT9g1hUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FbfP9XLYP/mk58DLr5kO7zXq9oDOWbqB6TJGOBjMU5w=;
 b=NIb+hMOCIat/uLYAUMIf6nn9lXyLPuKGgLZyRiDpjyzOWX8kuyAoVt05CaiGXO5MQyOU1SDvLqwtVl7UqPPLldPaNyJHtxNQKB/eeUUFqbZmS0hME7+5otdYck4p1GDKKGS/szegSnTswMsaubfbUUc8J8YQFRN8jp/mij9RE+oyaKMcz/XnMEAnCRxMrV0jtVT2wzmqYINZmUejzyJFu/PwMmOK6se2Vmmr1tWLXgSqYtdtx12wj8d3wRNBJnqtsLbm+oErgyvJXjUXiLAmmhuFXqtFz0cX+n20Ccu4gPCKovxMJo4E8fanwqz5B/Buq9m/T1da+bBkIbfh6iUIKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FbfP9XLYP/mk58DLr5kO7zXq9oDOWbqB6TJGOBjMU5w=;
 b=lmkhZUOabM8buJnCH7lFcYawPY2WvyOKYFGlIJxXWT/GDRedx4wfxizY4tqATeaswUD/g7zQ3HwjyAgQQQooPufE1o4BdxRxp/RG3Q61wDFkrqBw/zB0hjdaPpa8XT4ZbMSnjBTIiNybOL9z3P6MD632s2h9mR5ZwL2g75P/utA=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7862.namprd11.prod.outlook.com (2603:10b6:208:3dc::8)
 by SA1PR11MB5801.namprd11.prod.outlook.com (2603:10b6:806:23d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 08:49:02 +0000
Received: from IA0PR11MB7862.namprd11.prod.outlook.com
 ([fe80::3b4e:43a6:6e22:22f]) by IA0PR11MB7862.namprd11.prod.outlook.com
 ([fe80::3b4e:43a6:6e22:22f%5]) with mapi id 15.21.0615.009; Tue, 17 Nov 2026
 08:49:01 +0000
Content-Type: multipart/alternative;
 boundary="------------8d1tZmOEGkhWSX0giROnAlVE"
Message-ID: <995b59c3-e985-464a-8917-f88c8b9abf02@intel.com>
Date: Tue, 17 Nov 2026 14:18:51 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/6] drm/xe/cper: Add software CPER emission entry point
To: "Nilawar, Badal" <badal.nilawar@intel.com>
CC: <anshuman.gupta@intel.com>, <vinay.belgaumkar@intel.com>,
 <riana.tauro@intel.com>, <karthik.poosa@intel.com>, <sk.anirban@intel.com>,
 <raag.jadav@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <jani.nikula@linux.intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
References: <20261112134636.1860446-8-mallesh.koujalagi@intel.com>
 <20261112134636.1860446-9-mallesh.koujalagi@intel.com>
 <986988d2-acc0-4dac-a5d5-60d7d0fe5c82@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <986988d2-acc0-4dac-a5d5-60d7d0fe5c82@intel.com>
X-ClientProxiedBy: MA5P287CA0336.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:222::14) To IA0PR11MB7862.namprd11.prod.outlook.com
 (2603:10b6:208:3dc::8)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7862:EE_|SA1PR11MB5801:EE_
X-MS-Office365-Filtering-Correlation-Id: acda2a3b-183a-4c57-f097-08df4487a00a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|56012099006|4143699003|11063799006|261022113327099003|261022105027099003|261026140227099003|261026121527099003|10067099003|261021123027099003|261021121427099003|261028144727099003|261102123227099003|261009223027099003|22082099003|18002099003|6133799003|8096899003;
X-Microsoft-Antispam-Message-Info: dWwV+21mkhYz9LOhJkaWMXCr4KDq6JWlUpfMaWLWlhNsitntMGnZcLoYo6Ozv8gvjpddRyZ5MXpxJUNk2AOEtU5YALB1MFWUxEgIzp0OxnVRLVxtNIGFdRwiOxJ/O6QkeAIc5DlvGqOUPj40D/bXrYkrTtU0Boiq3o86n1Vgcyf7jSeaikTs+RsntQ9x/yMtruYqVRV9kp7GDNCYl/DOY1MRDIsHyFWaAZ6RK3kDiAOly3wB7oUxtLmdObiKKm9uCn35FD0Cyd1bwE9un4y6+6G4QsUppFQRaIv4cAW6lwhD66ReC+H9ltKV923odKuJYS8OcwmLPci6p8aRldagCOex/ooSl0G8RX+S4ig+pMpwGo3ZmBeSKlzLXrev85/criSR05Hkt6Zrb7JvpInvmVKplRQY6zEP2dH6q+4ueTf6Ty+JGbfqzgAizZOZRj5We421Dv6EPYmoyrqKlASOK/2PuhXf8d01olovf4GJsVTVvd+lA4n4abvR55Fmyy8jABk7Kh3gczWIfwzUaiBIv8gxJ7ASeY/nS+/GSfRCS3kl94ZuCqiLbVB7/spNP/IYEnhaXtmobojj2G9HwoP5xzvBjYvUprWIODlOlYOKH+6exR9XFIeEqXpqBL+tKkwAfmrU/QFSR2oTvhT2QrDHBwTl96tqUBwP526vokkePjU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7862.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(56012099006)(4143699003)(11063799006)(261022113327099003)(261022105027099003)(261026140227099003)(261026121527099003)(10067099003)(261021123027099003)(261021121427099003)(261028144727099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003)(6133799003)(8096899003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VlVtUW5sdkt6VXdqSDdrQTVSSDNVYlpSNEdNdVgzbEJjNUhCbW5IVEVia1Vp?=
 =?utf-8?B?b1V1SWRENlVTZk1zaFlqYlV3Y2U2bW9mNklCMFVLaG16eWh1Qm4yN0kzSWZl?=
 =?utf-8?B?TzRab2J4S3lBSGs4MmpYL3o0NldOdEtIM3VjcnYyQnB3S0RIWTkrZ0pYSHlY?=
 =?utf-8?B?bXNkRkFXeE9CMHgxS3RtcThpMEpnUlFuR2c0ODdwYURkQmFMWTNXbjNqYjd4?=
 =?utf-8?B?YkRSTWwxUlZ3TlVCL1hCMmpReVRvcjJLSEtXSWc5a3lFbjFwcDhOSkU2OVM1?=
 =?utf-8?B?cUdmdEF2eTBaTk1nOVRvSnp0TGVORGE0YUVXUVhpZGpuRHp3LzVpYURhR1hE?=
 =?utf-8?B?dTIzQXBuNXNvTTdwWHdOZ05pSGlvcG1mNE8wSEs4L3ZPN21xcWxyTXUwb00x?=
 =?utf-8?B?TlVPa1QvZ1lrRmNSV1N0QTA0OEg0NG5FU0NhZU93Mk9nYnpaVFU2TjQ5bG5l?=
 =?utf-8?B?aTR0RFZ2QkxaWUFybDU1OFVNbGNoN3YzeCtweUowU3hYY2prRUxzd0ZuK3oz?=
 =?utf-8?B?QlRWT1poQmlVbHhoam95T2RWM2p4THpRREt4c1Arc0IrMDA3WU95bWljNFp5?=
 =?utf-8?B?N2JyU001VzdzMnVuVzA0U1UvN21PZnZvQmN1UUhmaTFkcHBnYk14N2VzMjc2?=
 =?utf-8?B?UnF0eStsMk5MUDVZczNMamNLK3dlQzBjMXFueFBwYmtKME0wWTBySTJyNzZJ?=
 =?utf-8?B?WlNQTi9lQXczelZvMW5wZHJxQ3NaZDhjOWo4TmgrY2FYbmFNVmR1V3lyZGtv?=
 =?utf-8?B?Z3M0TzdNTVV6VFBBYUFVUkRGNnFiazYveVhpNGgzTGR3NUtISDhtUUxrMHBX?=
 =?utf-8?B?cEF3ZTdQemdCMDdqYkFqUkJ3OWRjTlVqeG05amJKUGVpVW82dUNYM2dSbFVq?=
 =?utf-8?B?Snh0QUYyaUtyRTducDgzeU50L2k5em9NYmtZeXR2bTV4d29FNUMxcjNpYVdy?=
 =?utf-8?B?T25rUkFERlhIaEtGc2RhNVpoU1pFellOYlY2aU1kMU1rYk9wS0FLTG9ZNW1D?=
 =?utf-8?B?VUVlc1I3eWhBUmpQYkgybDIxTGRUVFRNRUZrL2txOGhTWkl6a2xNcXU1RDlH?=
 =?utf-8?B?N0FUUjNXYzdEMzY0d1JNaG5YT1hCbHEwSXpNdzczUWtacitqQkZkZjI5azVZ?=
 =?utf-8?B?dkhvRFNhSUd2dXVFbUhBTGZuZENUOHpsUVZ4RElZQ2w4QlFrSEVyaTEzM2Ur?=
 =?utf-8?B?cmJsaXh3cTBYYjV6cDI1SC85R0JLelZvdmZteVJOSjhzYXk2aUFlYWVJM0My?=
 =?utf-8?B?dFZaWSt5R3JrblNZTVhiMHFhNWdVNlJjNnRVYXovYmxrUkEyM09IZHhOa0Z5?=
 =?utf-8?B?Q2NYcTB3RVlGUTlTRHphZW9qbEt1R2FRZWNXTUlEVVFpU1hTVHYvTk0zNFVu?=
 =?utf-8?B?RFBGVXdTUzNYYytucFV2OWFEZEtnZENUNFRJZEdkeVN2T1BmVE1VSzNNSTBB?=
 =?utf-8?B?TUtMUmJjd2NzZ1FpSG4vdm5UNjFBY2ZLbzdJby81WWZGQWh4V0hqOGphNDZo?=
 =?utf-8?B?cnZQTGtjZXVvU01CTkxtZmRIaUdiVEZoNjRBRXZIMWd3NnpCV3dIUlVOL2pi?=
 =?utf-8?B?WGd3dlRyV1VMUlBJa3dybnJpdXo2QkFBOVo2VjVyOHQwUkZhVTdDbnZCTnJY?=
 =?utf-8?B?R1pGR2hrS0U3NzY0aFZQOHo1a2pjYTBsd2dURkFPaWkxV0xXaUJLOEp4dWs1?=
 =?utf-8?B?eUxIUHh2ZC8vamdtbWdaQitYdkRyRWR4SzhOVERSRVBJS1p6UnlDekJFa3g5?=
 =?utf-8?B?OC9taGk0a0MwK2NyZTQ2eDlyeDRQR0VHcFNkc2NIbjUvdEx0Sm1vYlZMQjkv?=
 =?utf-8?B?YWozcmoxVzByeWlPUXRSanNQNWpBUnY3ZS9LQTJMSy9va3ZvY0s5Qm5LN3pX?=
 =?utf-8?B?V25Xd1MwMk5qdVUrWW9oK1dVOXRlOUd2R0h6bFFtaC9oelRZaDJTV1Viemtu?=
 =?utf-8?B?bVBBSnUwdXVqOEMwOFh2bVFEOStoVVNCa1NidldkY0UwOThtKzlmYVE5MUNh?=
 =?utf-8?B?SlpVZThzQmgyYjZoYjV5N3F2ZHlROU5Hc3VNSDFmeUVjYVJOYXVsSUpwUUxT?=
 =?utf-8?B?T2h5czB3RUQ2VUdZeGtEVUIrUTBsSFVlb3NsZjVzenUveGY1MHpmNndaRk1Z?=
 =?utf-8?B?Szc5blpnK0pRaFB2RGdrdjlOTE03V2l0dnZ1d2dtRHRiNnI3aFJTaW8xeXpH?=
 =?utf-8?B?NDN4bUxhNzhMNkZGdStyc2kzbWJTbHBZR1NqczViaDFtaU15dzJOeHRuL3M5?=
 =?utf-8?B?UFRBVDlLY0RPbE9BR24vMk5wOSs2bHZrRGJVd1hOQWhDcVZlOVVLNnA2bzhl?=
 =?utf-8?B?QTgxcDFrc1ZNOStpNWtOUlE0aVlUaitjU0FCM0ZQOGVKREZRZ1d5NVYrcVVn?=
 =?utf-8?Q?YEeKxAegZZQ465nM=3D?=
X-Exchange-RoutingPolicyChecked: xKKnSgfBvtEKOcNsTWMgKvM7hezz6FV8WGncHqu7JEnzcRrkBL5sBGQkMfm0loDbPQ32mGLLaabNSvvLlbNfTZ0Ng6XlQbQ+tzRfAkjd7OG2XxE6OBX37AmVwtsyZS5OhPUPinYoVGBCtkwY6pj4aI5bgsV9cnv6VJFVXpf01diiEEJQACWVjFGt64qkYmXhVU1xQ80Q/pz+f5MNKXB2K7yX+wqSdP6j6h6LojCvzsZpvU4gnqQWG13ETJhj89PXO5241N4YQYfLrFKJu0drpiChkMg9k6vs4qah5woYSPHqtcYjsmSyroLmve6tPum+HX7kAXMekKxQvJCpdVG22g==
X-MS-Exchange-CrossTenant-Network-Message-Id: acda2a3b-183a-4c57-f097-08df4487a00a
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7862.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 08:49:01.0189 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DnTyAOJXLycZyla7gsn0Vy7DqNmoYR4WCSUHmIgJvrSv696WHk4ZdI31+ynSYFaDkfFRU9LIihB2J8B2QOuXcFSUfbu1+LqpoZbrxTxJvSk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5801
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
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--------------8d1tZmOEGkhWSX0giROnAlVE
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 17-11-2026 01:00 pm, Nilawar, Badal wrote:
>
>
> On 12-11-2026 19:16, Mallesh Koujalagi wrote:
>> Add a software CPER emission handler for CRI SIGIDs.
>>
>> Keep hardware CPER handling unchanged and return early
>> when the Xe device is unavailable.
>
> I think no need to mention this explicitly.
>
hmm, ok
>> Cc: Badal Nilawar<badal.nilawar@intel.com>
>> Signed-off-by: Mallesh Koujalagi<mallesh.koujalagi@intel.com>
>> ---
>> v3:
>> - Handle early PCI probe where xe device is null. (Sashiko)
>>
>> v4:
>> - Add has_driver_cper flag. (Badal)
>> ---
>>   drivers/gpu/drm/xe/xe_cper.c         | 22 +++++++++++++++++++++-
>>   drivers/gpu/drm/xe/xe_device_types.h |  2 ++
>>   drivers/gpu/drm/xe/xe_pci.c          |  2 ++
>>   drivers/gpu/drm/xe/xe_pci_types.h    |  1 +
>>   4 files changed, 26 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_cper.c b/drivers/gpu/drm/xe/xe_cper.c
>> index bb90030bcd2d..dd6d4251dd1d 100644
>> --- a/drivers/gpu/drm/xe/xe_cper.c
>> +++ b/drivers/gpu/drm/xe/xe_cper.c
>> @@ -32,6 +32,11 @@ static bool is_hw_sigid(enum xe_sigid sigid)
>>   	return in_range(sigid, INTEL_SIGID_GPU_XE_HARDWARE_START, INTEL_SIGID_BATCH);
>>   }
>>   
>> +static bool is_sw_sigid(enum xe_sigid sigid)
>> +{
>> +	return in_range(sigid, INTEL_SIGID_GPU_XE_SOFTWARE_START, INTEL_SIGID_BATCH);
>> +}
>> +
>>   /* CPER platform_id GUIDs (RFC 9562 UUIDv5) for each PCI device ID. */
>>   static const struct xe_device_guid_entry xe_device_guids[] = {
>>   	{ 0x674C, GUID_INIT(0x9046afe5, 0x9041, 0x5124,
>> @@ -240,6 +245,12 @@ static void cper_emit_hw_err(struct xe_device *xe, int cper_sev, enum xe_sigid s
>>   	xe_cper_emit_counter(xe, cper_sev, sigid, counter, &response);
>>   }
>>   
>> +static void cper_emit_sw_err(struct xe_device *xe, int cper_sev, enum xe_sigid sigid,
>> +			     u32 component, u32 location, const void *data,
>> +			     struct va_format *vaf)
>> +{
>> +}
>> +
>>   /**
>>    * xe_cper_emit() - Emit a CPER record for a SIGID log entry
>>    * @xe: The &xe_device
>> @@ -268,12 +279,21 @@ void xe_cper_emit(struct xe_device *xe, int cper_sev, enum xe_sigid sigid,
>>   		  u32 component, u32 location, const void *data, size_t len,
>>   		  struct va_format *vaf)
>>   {
>> +	if (!xe)
>> +		return;
>
> Add a TO DO to track a future enhancement to handle this using pdev 
> instead of xe.
>
Ok, will update it like

/* TODO:  Handle using pdev instead of xe */

>> +
>>   	if (is_hw_sigid(sigid) && !IS_ERR_OR_NULL(data)) {
>>   		cper_emit_hw_err(xe, cper_sev, sigid, data);
>>   		return;
>>   	}
>>   
>> -	/* TODO software CPER */
>> +	if (xe->info.has_driver_cper) {
>> +		if (is_sw_sigid(sigid) &&
>> +		    (cper_sev == CPER_SEV_RECOVERABLE ||
>> +		     cper_sev == CPER_SEV_FATAL))
>
> Nit: Severity check can fit on a single line.
>
Ok

>
> With comments addressed this is
>
> Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
>
Thanks Badal!
>
> Thanks,
> Badal
>
>> +			cper_emit_sw_err(xe, cper_sev, sigid, component, location, data, vaf);
>> +		return;
>> +	}
>>   }
>>   
>>   static ssize_t cper_on_query_show(struct device *dev, struct device_attribute *attr, char *buf)
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>> index 933f5d27aa62..d992ff8d2fc9 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -170,6 +170,8 @@ struct xe_device {
>>   		u8 has_device_atomics_on_smem:1;
>>   		/** @info.has_device_uid: Device supports unique 64-bit GPU SOC ID */
>>   		u8 has_device_uid:1;
>> +		/** @info.has_driver_cper: Device supports driver-generated CPER records */
>> +		u8 has_driver_cper:1;
>>   		/** @info.has_drm_ras: Device supports drm_ras (Reliability, Availability, Serviceability) */
>>   		u8 has_drm_ras:1;
>>   		/** @info.has_fan_control: Device supports fan control */
>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>> index ce231069880a..c615eddb2abc 100644
>> --- a/drivers/gpu/drm/xe/xe_pci.c
>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>> @@ -475,6 +475,7 @@ static const struct xe_device_desc cri_desc = {
>>   	.dma_mask_size = 52,
>>   	.has_display = false,
>>   	.has_device_uid = true,
>> +	.has_driver_cper = true,
>>   	.has_drm_ras = true,
>>   	.has_flat_ccs = false,
>>   	.has_gsc_nvm = 1,
>> @@ -802,6 +803,7 @@ static int xe_info_init_early(struct xe_device *xe,
>>   	xe->info.is_dgfx = desc->is_dgfx;
>>   	xe->info.has_cached_pt = desc->has_cached_pt;
>>   	xe->info.has_device_uid = desc->has_device_uid;
>> +	xe->info.has_driver_cper = desc->has_driver_cper;
>>   	xe->info.has_drm_ras = desc->has_drm_ras;
>>   	xe->info.has_fan_control = desc->has_fan_control;
>>   	xe->info.has_fixed_vram_channels = desc->has_fixed_vram_channels;
>> diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
>> index 74a6cd461b21..e7bf46ea729f 100644
>> --- a/drivers/gpu/drm/xe/xe_pci_types.h
>> +++ b/drivers/gpu/drm/xe/xe_pci_types.h
>> @@ -42,6 +42,7 @@ struct xe_device_desc {
>>   	u8 has_cached_pt:1;
>>   	u8 has_display:1;
>>   	u8 has_device_uid:1;
>> +	u8 has_driver_cper:1;
>>   	u8 has_drm_ras:1;
>>   	u8 has_fan_control:1;
>>   	u8 has_fixed_vram_channels:1;
--------------8d1tZmOEGkhWSX0giROnAlVE
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 17-11-2026 01:00 pm, Nilawar, Badal
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:986988d2-acc0-4dac-a5d5-60d7d0fe5c82@intel.com">
      
      <p><br>
      </p>
      <div class="moz-cite-prefix">On 12-11-2026 19:16, Mallesh
        Koujalagi wrote:<br>
      </div>
      <blockquote type="cite" cite="mid:20261112134636.1860446-9-mallesh.koujalagi@intel.com">
        <pre wrap="" class="moz-quote-pre">Add a software CPER emission handler for CRI SIGIDs.

Keep hardware CPER handling unchanged and return early
when the Xe device is unavailable.</pre>
      </blockquote>
      <p>I think no need to mention this explicitly.&nbsp;</p>
    </blockquote>
    hmm, ok
    <blockquote type="cite" cite="mid:986988d2-acc0-4dac-a5d5-60d7d0fe5c82@intel.com">
      <blockquote type="cite" cite="mid:20261112134636.1860446-9-mallesh.koujalagi@intel.com">
        <pre wrap="" class="moz-quote-pre">Cc: Badal Nilawar <a class="moz-txt-link-rfc2396E" href="mailto:badal.nilawar@intel.com" moz-do-not-send="true">&lt;badal.nilawar@intel.com&gt;</a>
Signed-off-by: Mallesh Koujalagi <a class="moz-txt-link-rfc2396E" href="mailto:mallesh.koujalagi@intel.com" moz-do-not-send="true">&lt;mallesh.koujalagi@intel.com&gt;</a>
---
v3:
- Handle early PCI probe where xe device is null. (Sashiko)

v4:
- Add has_driver_cper flag. (Badal)
---
 drivers/gpu/drm/xe/xe_cper.c         | 22 +++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_device_types.h |  2 ++
 drivers/gpu/drm/xe/xe_pci.c          |  2 ++
 drivers/gpu/drm/xe/xe_pci_types.h    |  1 +
 4 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_cper.c b/drivers/gpu/drm/xe/xe_cper.c
index bb90030bcd2d..dd6d4251dd1d 100644
--- a/drivers/gpu/drm/xe/xe_cper.c
+++ b/drivers/gpu/drm/xe/xe_cper.c
@@ -32,6 +32,11 @@ static bool is_hw_sigid(enum xe_sigid sigid)
 	return in_range(sigid, INTEL_SIGID_GPU_XE_HARDWARE_START, INTEL_SIGID_BATCH);
 }
 
+static bool is_sw_sigid(enum xe_sigid sigid)
+{
+	return in_range(sigid, INTEL_SIGID_GPU_XE_SOFTWARE_START, INTEL_SIGID_BATCH);
+}
+
 /* CPER platform_id GUIDs (RFC 9562 UUIDv5) for each PCI device ID. */
 static const struct xe_device_guid_entry xe_device_guids[] = {
 	{ 0x674C, GUID_INIT(0x9046afe5, 0x9041, 0x5124,
@@ -240,6 +245,12 @@ static void cper_emit_hw_err(struct xe_device *xe, int cper_sev, enum xe_sigid s
 	xe_cper_emit_counter(xe, cper_sev, sigid, counter, &amp;response);
 }
 
+static void cper_emit_sw_err(struct xe_device *xe, int cper_sev, enum xe_sigid sigid,
+			     u32 component, u32 location, const void *data,
+			     struct va_format *vaf)
+{
+}
+
 /**
  * xe_cper_emit() - Emit a CPER record for a SIGID log entry
  * @xe: The &amp;xe_device
@@ -268,12 +279,21 @@ void xe_cper_emit(struct xe_device *xe, int cper_sev, enum xe_sigid sigid,
 		  u32 component, u32 location, const void *data, size_t len,
 		  struct va_format *vaf)
 {
+	if (!xe)
+		return;</pre>
      </blockquote>
      <p>Add a TO DO to track a future enhancement to handle this using
        pdev instead of xe.</p>
    </blockquote>
    <p>Ok, will update it like</p>
    <p>/* TODO:&nbsp; Handle using pdev instead of xe */</p>
    <blockquote type="cite" cite="mid:986988d2-acc0-4dac-a5d5-60d7d0fe5c82@intel.com">
      <blockquote type="cite" cite="mid:20261112134636.1860446-9-mallesh.koujalagi@intel.com">
        <pre wrap="" class="moz-quote-pre">+
 	if (is_hw_sigid(sigid) &amp;&amp; !IS_ERR_OR_NULL(data)) {
 		cper_emit_hw_err(xe, cper_sev, sigid, data);
 		return;
 	}
 
-	/* TODO software CPER */
+	if (xe-&gt;info.has_driver_cper) {
+		if (is_sw_sigid(sigid) &amp;&amp;
+		    (cper_sev == CPER_SEV_RECOVERABLE ||
+		     cper_sev == CPER_SEV_FATAL))</pre>
      </blockquote>
      <style>@scope { a {
    text-decoration: none;
    color: #464feb;
}tr th, tr td {
    border: 1px solid #e6e6e6;
}tr th {
    background-color: #f5f5f5;
} }</style>
      <p style="font-style: normal; font-weight: 400; line-height: 20px;">Nit:
        Severity check can fit on a single line.</p>
    </blockquote>
    <p>Ok</p>
    <blockquote type="cite" cite="mid:986988d2-acc0-4dac-a5d5-60d7d0fe5c82@intel.com">
      <p style="font-style: normal; font-weight: 400; line-height: 20px;"><br>
      </p>
      <p style="font-style: normal; font-weight: 400; line-height: 20px;">With
        comments addressed this is&nbsp;</p>
      <p style="font-style: normal; font-weight: 400; line-height: 20px;">Reviewed-by:
        Badal Nilawar <a class="moz-txt-link-rfc2396E" href="mailto:badal.nilawar@intel.com" moz-do-not-send="true">&lt;badal.nilawar@intel.com&gt;</a></p>
    </blockquote>
    Thanks Badal!
    <blockquote type="cite" cite="mid:986988d2-acc0-4dac-a5d5-60d7d0fe5c82@intel.com">
      <p style="font-style: normal; font-weight: 400; line-height: 20px;">Thanks,<br>
        Badal&nbsp;</p>
      <blockquote type="cite" cite="mid:20261112134636.1860446-9-mallesh.koujalagi@intel.com">
        <pre wrap="" class="moz-quote-pre">+			cper_emit_sw_err(xe, cper_sev, sigid, component, location, data, vaf);
+		return;
+	}
 }
 
 static ssize_t cper_on_query_show(struct device *dev, struct device_attribute *attr, char *buf)
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 933f5d27aa62..d992ff8d2fc9 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -170,6 +170,8 @@ struct xe_device {
 		u8 has_device_atomics_on_smem:1;
 		/** @info.has_device_uid: Device supports unique 64-bit GPU SOC ID */
 		u8 has_device_uid:1;
+		/** @info.has_driver_cper: Device supports driver-generated CPER records */
+		u8 has_driver_cper:1;
 		/** @info.has_drm_ras: Device supports drm_ras (Reliability, Availability, Serviceability) */
 		u8 has_drm_ras:1;
 		/** @info.has_fan_control: Device supports fan control */
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index ce231069880a..c615eddb2abc 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -475,6 +475,7 @@ static const struct xe_device_desc cri_desc = {
 	.dma_mask_size = 52,
 	.has_display = false,
 	.has_device_uid = true,
+	.has_driver_cper = true,
 	.has_drm_ras = true,
 	.has_flat_ccs = false,
 	.has_gsc_nvm = 1,
@@ -802,6 +803,7 @@ static int xe_info_init_early(struct xe_device *xe,
 	xe-&gt;info.is_dgfx = desc-&gt;is_dgfx;
 	xe-&gt;info.has_cached_pt = desc-&gt;has_cached_pt;
 	xe-&gt;info.has_device_uid = desc-&gt;has_device_uid;
+	xe-&gt;info.has_driver_cper = desc-&gt;has_driver_cper;
 	xe-&gt;info.has_drm_ras = desc-&gt;has_drm_ras;
 	xe-&gt;info.has_fan_control = desc-&gt;has_fan_control;
 	xe-&gt;info.has_fixed_vram_channels = desc-&gt;has_fixed_vram_channels;
diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
index 74a6cd461b21..e7bf46ea729f 100644
--- a/drivers/gpu/drm/xe/xe_pci_types.h
+++ b/drivers/gpu/drm/xe/xe_pci_types.h
@@ -42,6 +42,7 @@ struct xe_device_desc {
 	u8 has_cached_pt:1;
 	u8 has_display:1;
 	u8 has_device_uid:1;
+	u8 has_driver_cper:1;
 	u8 has_drm_ras:1;
 	u8 has_fan_control:1;
 	u8 has_fixed_vram_channels:1;
</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------8d1tZmOEGkhWSX0giROnAlVE--

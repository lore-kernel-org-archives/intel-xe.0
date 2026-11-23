Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59439606A31E
	for <intel-xe@archiver.kernel.org>; Mon, 23 Nov 2026 14:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jPIbdnV5;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=DTOAIeqr
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C9FA10EC28;
	Mon, 23 Nov 2026 14:50:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7BE210EC28
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Nov 2026 14:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795445448; x=1826981448;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=6tDdyKaF1WxDxi+CQI7odBFfB3H7YBBtFQKcti2nLig=;
 b=jPIbdnV5i1I5Gd02ftDY8Kze7fyVv4HwMBFUSmk89hoEsN4q/gldUFj+
 vXgzlJP7eHkwEQOxHl1wDSLOHPduyPOJaWH2mePJFunNAp35IfyIf30Ot
 Aw1YD4WSaxG40S+VrD+JoW2ZL+bVsOV9QHLx2k0Pjyzl023E8fbpzwJL9
 YJ+eQvdqCFssV1gYL+vg4DPIShtDRG6yL69KeMj+pUrblpEz+CC70itmQ
 z/qOT9xK1DHBR7S/BrA34aiUN1M/sQGRMJnDDPERszwFhF9rFCFdDnqkQ
 HdCvynKcCEvl45RiDNn7pEFtwg4ku3MUK12rVN9HrMbnxjiwErKBcOpPF g==;
X-CSE-ConnectionGUID: I8nHn9KvQOyxbNt2xx112g==
X-CSE-MsgGUID: SOsjI4meQP2588edN7fUpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4230546"
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; d="scan'208,217";a="4230546"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 06:50:47 -0800
X-CSE-ConnectionGUID: 6z0r7uV6StyBABJ9kUOHrA==
X-CSE-MsgGUID: I5V5nqeSQ/iGnyVsMgLvFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; d="scan'208,217";a="11513785"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 06:50:46 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Mon, 23 Nov 2026 06:50:46 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Mon, 23 Nov 2026 06:50:46 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.25) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 23 Nov 2026 06:50:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N8ZRRBAa4eL9DyWdyVOHHZFiU8uhqqA1qdevAst1GM2tYJnvgOIv3bM1+RevPQwkfsHhHOD2eYo37YuoAmiqDrOGr3cYUJ00LdjKTNQOHEUoVlLCQ1hwYI4Zlq5523kOu5Q+sh+UPFMnYSgy/PjftaMWF8aFQA1IEis8266T3vurt8SzoUtv+4Y8QbMy+85FK65xzrpvl3Sw3pte0Luz7OPT699HCpA0nMLGBKjRGSO/TcQ4YNvHjVcJKB5ESi5hl6OuaMZ2D5mCjLX6WS7Mi+r430+lYF7OE0wp7xV+UN79U3EUUSVl2d+rhkFBZyRyYp0KSi4+tjsQbexB/Gen+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XUu6zxU86Ciq46RR8koSlM0NuOPT/OSqlhZ6AaFMB4M=;
 b=weVNDp27/G1kEY5/lA8rVVQaYjEYerQib+JAYbHuUpRrMbmj2cDRt85fnenCrp9dK5nVygDzKi8gBLop7OpweD9VfHe7/h/0s2hAH05NEM21pp3aarqR+YlG+bq9OwYfiuJyn2tUgesFL9RsdK30BGTp/VEEcivS+To6LBDnSG53pXn6Tf88c4iQPQF9FdQSnbtAGdExFEQZTXypej1v8YEL+pOKQVripAG1vbYombsl3m34fViavodXNwGApC+sKoBjHpttBmQBkRF3lrSt/p51CzcqzC3VE+uPk1zXfwXaxdFQcNRnCDKMtXGN6eKZZPYG3ZJI6j0w71KsrCTN7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XUu6zxU86Ciq46RR8koSlM0NuOPT/OSqlhZ6AaFMB4M=;
 b=DTOAIeqrw7YOO4SZppm6ZquUrnSgPl+DY52QMHo8Fv4QsikUmD7xElNGh1vknyt3XCVBabHySOveD9P4cKTr7m0+xGod9mcaHuvndASfokHMM3kiaxGWpne+ZP3ZwAlP68ZHnqctpdA8nkYCKEJYs/rqtFRkbYWBwlwG3ezCTHc=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7862.namprd11.prod.outlook.com (2603:10b6:208:3dc::8)
 by MN2PR11MB4533.namprd11.prod.outlook.com (2603:10b6:208:264::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Mon, 23 Nov
 2026 14:50:44 +0000
Received: from IA0PR11MB7862.namprd11.prod.outlook.com
 ([fe80::3b4e:43a6:6e22:22f]) by IA0PR11MB7862.namprd11.prod.outlook.com
 ([fe80::3b4e:43a6:6e22:22f%5]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 14:50:44 +0000
Content-Type: multipart/alternative;
 boundary="------------Wx0rH0ZCPJvGvtWP9cHn9XvO"
Message-ID: <cf739c17-afdc-4d30-a912-400a8519a250@intel.com>
Date: Mon, 23 Nov 2026 20:20:35 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/xe_ras: Skip gpu_health sysfs commands when
 wedged
To: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
CC: <soham.purkait@intel.com>, <riana.tauro@intel.com>,
 <raag.jadav@intel.com>, <anshuman.gupta@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20261119163913.1760721-2-ravi.kishore.koppuravuri@intel.com>
 <20261123065719.1782607-1-ravi.kishore.koppuravuri@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20261123065719.1782607-1-ravi.kishore.koppuravuri@intel.com>
X-ClientProxiedBy: MA5PR01CA0073.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b7::12) To IA0PR11MB7862.namprd11.prod.outlook.com
 (2603:10b6:208:3dc::8)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7862:EE_|MN2PR11MB4533:EE_
X-MS-Office365-Filtering-Correlation-Id: f69a3e87-90ce-45aa-03e5-08df4971266c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|18096099006|261009223027099003|22082099003|18002099003|20046099003|13003099007|8096899003|261022105027099003|261026121527099003|261026140227099003|261028144727099003|261021121427099003|261102123227099003|56012099006|4143699003|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info: Sfg6GUzlri67HPAEUNOVaUFtvpBHwzJEheDiq2yTDtmP96irlpEnpu1w4D86Da3Pa1PD12tsYnTYjYonizSN8LV+/ncLTnyNFj+Vtoq0i8qpLDAmBts7pS9JkNUCngwCc+yCLTUwmjNbcvZzWccNuttNKQP/Z740TyUb0xGAG+rmPrsSKxjygx8vkZmGM1ScNcRCLMVsOijLqf1H0Zec1iBcljaMG/L7HGoiohjmEeCllbBpPd0OnZ8PBAVCCdc26SGxliZUWkihKHEbjbuSW+1mx3hePYzxbbHS1Zy+d2sKBvQhTHEackM+E9MtBrMDT69X6lSFsTt+RzhGVwxr9srQFkeyYAcfVJfeZLbhZHmmwlLM707BBhS9njn6NCbGp1oLGGWODvCbuQSrFvkVSGhN+sTFzajixnjvkVac/q5jJwq8tqMr9ugQqwWXzmmntXY6wiX72xUDTW4ZFXgyclYo4zN7b/ucgjnSHhp/Toj8Imu++B1eWRsjUaOeocPTrrWtwft0Wzwh+TdrgYkz+m7vFZ1btsKTqELANYoRTgWALYBqd0BGuXEETcJHJtRc4qfq5o5U07kKvSrmdogU2QdnU45X6uDgELhIk5Sgcms=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7862.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(18096099006)(261009223027099003)(22082099003)(18002099003)(20046099003)(13003099007)(8096899003)(261022105027099003)(261026121527099003)(261026140227099003)(261028144727099003)(261021121427099003)(261102123227099003)(56012099006)(4143699003)(10067099003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q2pMYTVpOUZIM0paaEt2YWxMSmFQdFF2NW9XcWNiODl0WlNsMjg5YmNMRzN3?=
 =?utf-8?B?dzhUOUV3UlQ5ZC9oQTJJdm9mMkNlbEpGY3o3TEFaOURESWpUWERvcnZCa3Z4?=
 =?utf-8?B?S0tGU2MzNjlHTW9pVWh5bmcvRXNUeDUrTmVMQVB4RGdxUVQ0d0YyTmJYY0ZC?=
 =?utf-8?B?bmxXc1Z5MXZzVkU0MFpxVEhlWmZXSnMweHcxT1BocmY5bkFZTjcvdWtWZlpq?=
 =?utf-8?B?bVRRclVmYkxQYjRxNy8vMERSVVIrRVkwR1V6M3RhVzhFWmxpN0lhSUNra3h2?=
 =?utf-8?B?dkRYMVlxQTdsQ3ZlR3pydzFMam9ZUGdBVjdhdHU1VXpkZ0hkTWRVWk5maFdu?=
 =?utf-8?B?MWNiekxISzd0QmJBYVZLTGFSbktkcmNhNVJNWHFVTlJZWkxHcVk4ZkZQeVd5?=
 =?utf-8?B?emVhaXRvQkY5U0k0WXlEcEZFNUg5TGZ4cmt4eWh6VTFkUDIzS08yMEVablgr?=
 =?utf-8?B?R2hkcDUwa2cxbkd5WW56Z1RXcGpmY3IrNTRVbVBhc3IyT2VvSHJCUWlVRXo1?=
 =?utf-8?B?YjJ5R1pBbVROMCs0cFk2RVd3TWVITjlIM2NQbHNoS3lmWC9oeVJURzY4WUxD?=
 =?utf-8?B?N21FQ09lUWs5MDQ1T3FYdGJnUmdqK0hTOFZwbkVsdnZuRHkwSHgwelREOU43?=
 =?utf-8?B?Q21LL3JOK2NUaFgzUndoRURRRGVLbHZqV2xTOGU5MHJod2lQMDZGM3p5ZmNj?=
 =?utf-8?B?MU1kWW9aMUhRNXJVSzNkeXA4Y0luNEVoamRBbmZPd3M5d3MrUndBcHZVYUtK?=
 =?utf-8?B?VXBpOVBtSVBLNTkwVXhHaXJnbjhSM1lFN0x3K3VwUmhiUGJMYzk2Zi9yT3Js?=
 =?utf-8?B?QnJraS9wdzVUb1dVMTJpZzdUSi8wa241dWtQVFVGTmhrSVQybFVqL29ycTFw?=
 =?utf-8?B?aGpiV0N5czlPUktMUUFTck5pLzEwYUtYRXZMQ0JjWVJYVW9tTmE5S3dGVmNH?=
 =?utf-8?B?Qk9BM2tNbWFBZHU2cXNGWnJHU09BSU5FTm1EMHFqeSt5OGk2bkttSkhOc2N0?=
 =?utf-8?B?VVNvMnY0YkVzM0FNTFcvOVRTWEtYVlByTUh2SU1nR3lVWUNidFdlaURUV3Rt?=
 =?utf-8?B?MkQwRXMwb3dLQk1ZejZWQjB0aElNMjMraVlhSWpJaDdJSFpvYW5lYkVDRkRY?=
 =?utf-8?B?Umt5NFd1UThrQ0xtR3l2WEV5eWkwT2hQNHVxZmc1ajVMMTRHcTkvOEFsZjZx?=
 =?utf-8?B?a0lmK25LVytwUkJ5ZysrT1crQVNsWWU3VGtBUHcwOUtWVnJHVXM2OVRMWjEw?=
 =?utf-8?B?UG96eUdCV2thQ2QvZHJ2TnhHRnFZN3JLS3V5VDdUQXdoNkhpRWFCR0JUcUU5?=
 =?utf-8?B?TWJ4VGloVVgzKzJpb2N0blFzYnBHTXFwNmhCVDRIZFRzeFNvdTdzc1B2dUQv?=
 =?utf-8?B?MmVNcXhUQTBoVlVSMmZySmx2Q2plQllGTWdUTG5GQVh5OGxiMHd1RWt1Qyt2?=
 =?utf-8?B?WUdNYTIrTHppNHRDRFhxOXR0NWhQVklJWVp0clROZWZjcFU1ZDczOUxIQ3Bp?=
 =?utf-8?B?NWdSWVpRZGM4U1dQcEhzNUsxL3pmTGtZN056NzFKWUZtQ1BWampldGpXeDBB?=
 =?utf-8?B?a2NKOVpIQlBYNGVJK1BLeUV4NXR4UW0zNkZIWUN0NkhLM1ExT2ZhanpKUjNo?=
 =?utf-8?B?M1RyNEtzR2hpdkVPWVpDRmI0S1VjUXlxZnBXV3BmY1RnWW8zTk9VZHN0UEdC?=
 =?utf-8?B?N0Z6S1lxTmFQc0xEd0VFUEFMaldUaVBQeDFNNU10LzY4OTZsNnl0MUh5TFly?=
 =?utf-8?B?bWFXVlVjeUxiYWVJREJxRHRLUG5SL2xMaWdiT3k0di9NWUh0SHBqSEdkRWs2?=
 =?utf-8?B?UDJZNzhvQmxMWlRPS21lTlRuNk1kd3grOS9VYStrL1RUMFNGdjlraFVEUDlM?=
 =?utf-8?B?KzNjNDgwSFJXd2M3RXdqcXR3ZXdNMkpUWEc5dFNDR3ZIaWdDTEVEaUZMNlhV?=
 =?utf-8?B?azBKRFp4S3MxSERlYmJ0WVJ0eXlqaW1rcmk1ZkNXcG8yaU85ejN6YXhOUW5j?=
 =?utf-8?B?TU00TDFDV0U4am1OTmhoeE9PQVhpTG13dkxNbnBGRUcyKzc4WXR6Mkd5eVpB?=
 =?utf-8?B?RGtCMUs3NGphTDRnRXBlalFNQWNQQVgwcjZWWHR2RnRHT0wzSFNnSHA3bGlR?=
 =?utf-8?B?b1l1emFpZkFJOFNwakVMTlVJb3ZKb2s4NEMxeHlVTmZsNkw4UDBzRUFHdzRL?=
 =?utf-8?B?SmtlZ1Z0NEZmZHFUc1hYQkZEa0hSbjJ6eGdxenRJbkxmSHo3MnZaeDFTVWNJ?=
 =?utf-8?B?d3RoR3R1UWMyVUlqOEg1V1ZiVCtYYkNzY0w1TStmbVgyU3BVMnQ0SUl6VEV0?=
 =?utf-8?B?RVdBRFZpbkV6eEtKSUVzUUtXcEhmODRXNTBXdjlZY3p5dm5iNzBQeEp5YU5t?=
 =?utf-8?Q?kCBfQ/4G15O5h5Xo=3D?=
X-Exchange-RoutingPolicyChecked: T7sS3Xzoqd15jGase+/OO6LKtPhuRsd2PbkKjXUfEIWe+X5E8BmGKUMkmTjiuHGywI2JT6FeqHEGkb9ljhP5lFg4CfqWR+aTuGlXnkSgy2usy6vthydNGITy8aodZoN1AdzYEIqn6ZbRrB7n9cMd2+fWevlE0hMeLZtsh3+bEaQyUojCbPKt7wLfMNpYZtYGTcRDcRBcdXwEOKUSfa4XBg+uYCnnWkE964EkDGCDgQZfi360CrYW6Wd+YuwHDfKq31O2GMA1UBKzpXUPyzRxUNAqbPZLvHW736pVT9CkCh5IHYj0bYBze8hhDKwzTt+MoBWBok7pGMTBPfHdUkTbTw==
X-MS-Exchange-CrossTenant-Network-Message-Id: f69a3e87-90ce-45aa-03e5-08df4971266c
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7862.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 14:50:43.9354 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6v/DbDdjckIexhExhwVKuIpc0n/Qs5UUQlsb7hJIwomywvqHLNAkKWJzbkNLvt1GjaGIAJ6e6cVmR/4Hq7hXCE7C1ZglfS8o2xDTgHWXFzM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4533
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

--------------Wx0rH0ZCPJvGvtWP9cHn9XvO
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 23-11-2026 12:27 pm, Ravi Kishore Koppuravuri wrote:
> Accessing the gpu_health sysfs attribute sends a command to the system
> controller. Add a guard to skip the command when the device is wedged.
>
> Do not skip when the wedge mode is XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET,
> as this mode is intended for debugging hangs.
> Signed-off-by: Ravi Kishore Koppuravuri<ravi.kishore.koppuravuri@intel.com>
> ---
> V2:
>    - Added support for not skipping when wedged in
>      XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET mode (Riana)
>    - Removed xe_device_is_in_reset() from the guard (Riana)
>    - Removed log message from the guard (sashiko, Mallesh and Riana)
> ---
>   drivers/gpu/drm/xe/xe_ras.c | 6 ++++++
>   1 file changed, 6 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index 0fb891d00b36..3c563ef67614 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -1134,6 +1134,9 @@ static ssize_t gpu_health_show(struct device *dev, struct device_attribute *attr
>   	size_t rlen;
>   	int ret;
>   
> +	if (xe_wedged(xe) && xe->wedged.mode != XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET)

Please use  !xe_wedge_mode_is_no_reset(xe) instead of xe->wedged.mode != 
XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET, has done in patch

https://lore.kernel.org/intel-xe/20261119102344.2053821-3-raag.jadav@intel.com/

> +		return -ECANCELED;
> +
>   	xe_sysctrl_create_command(&command, XE_SYSCTRL_GROUP_GFSP, XE_SYSCTRL_CMD_GET_HEALTH,
>   				  &request, sizeof(request), &response, sizeof(response));
>   	guard(xe_pm_runtime)(xe);
> @@ -1177,6 +1180,9 @@ static ssize_t gpu_health_store(struct device *dev, struct device_attribute *att
>   	if (state < 0)
>   		return -EINVAL;
>   
> +	if (xe_wedged(xe) && xe->wedged.mode != XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET)

ditto,

Thanks,

-/Mallesh

> +		return -ECANCELED;
> +
>   	request.health = state;
>   
>   	xe_sysctrl_create_command(&command, XE_SYSCTRL_GROUP_GFSP, XE_SYSCTRL_CMD_SET_HEALTH,
--------------Wx0rH0ZCPJvGvtWP9cHn9XvO
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 23-11-2026 12:27 pm, Ravi Kishore
      Koppuravuri wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20261123065719.1782607-1-ravi.kishore.koppuravuri@intel.com">
      <pre wrap="" class="moz-quote-pre">Accessing the gpu_health sysfs attribute sends a command to the system
controller. Add a guard to skip the command when the device is wedged.

Do not skip when the wedge mode is XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET,
as this mode is intended for debugging hangs.</pre>
    </blockquote>
    <blockquote type="cite" cite="mid:20261123065719.1782607-1-ravi.kishore.koppuravuri@intel.com">
      <pre wrap="" class="moz-quote-pre">
Signed-off-by: Ravi Kishore Koppuravuri <a class="moz-txt-link-rfc2396E" href="mailto:ravi.kishore.koppuravuri@intel.com">&lt;ravi.kishore.koppuravuri@intel.com&gt;</a>
---
V2:
  - Added support for not skipping when wedged in
    XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET mode (Riana)
  - Removed xe_device_is_in_reset() from the guard (Riana)
  - Removed log message from the guard (sashiko, Mallesh and Riana)
---
 drivers/gpu/drm/xe/xe_ras.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index 0fb891d00b36..3c563ef67614 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -1134,6 +1134,9 @@ static ssize_t gpu_health_show(struct device *dev, struct device_attribute *attr
 	size_t rlen;
 	int ret;
 
+	if (xe_wedged(xe) &amp;&amp; xe-&gt;wedged.mode != XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET)</pre>
    </blockquote>
    <p>Please use&nbsp; !xe_wedge_mode_is_no_reset(xe) instead&nbsp;<span style="white-space: pre-wrap">of xe-&gt;wedged.mode != XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET, has done in patch </span></p>
    <p><a class="moz-txt-link-freetext" href="https://lore.kernel.org/intel-xe/20261119102344.2053821-3-raag.jadav@intel.com/">https://lore.kernel.org/intel-xe/20261119102344.2053821-3-raag.jadav@intel.com/</a></p>
    <blockquote type="cite" cite="mid:20261123065719.1782607-1-ravi.kishore.koppuravuri@intel.com">
      <pre wrap="" class="moz-quote-pre">
+		return -ECANCELED;
+
 	xe_sysctrl_create_command(&amp;command, XE_SYSCTRL_GROUP_GFSP, XE_SYSCTRL_CMD_GET_HEALTH,
 				  &amp;request, sizeof(request), &amp;response, sizeof(response));
 	guard(xe_pm_runtime)(xe);
@@ -1177,6 +1180,9 @@ static ssize_t gpu_health_store(struct device *dev, struct device_attribute *att
 	if (state &lt; 0)
 		return -EINVAL;
 
+	if (xe_wedged(xe) &amp;&amp; xe-&gt;wedged.mode != XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET)</pre>
    </blockquote>
    <p>ditto,</p>
    <p>Thanks,</p>
    <p>-/Mallesh</p>
    <blockquote type="cite" cite="mid:20261123065719.1782607-1-ravi.kishore.koppuravuri@intel.com">
      <pre wrap="" class="moz-quote-pre">
+		return -ECANCELED;
+
 	request.health = state;
 
 	xe_sysctrl_create_command(&amp;command, XE_SYSCTRL_GROUP_GFSP, XE_SYSCTRL_CMD_SET_HEALTH,
</pre>
    </blockquote>
  </body>
</html>

--------------Wx0rH0ZCPJvGvtWP9cHn9XvO--

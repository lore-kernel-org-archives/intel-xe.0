Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75ADA606A32C
	for <intel-xe@archiver.kernel.org>; Sat, 21 Nov 2026 07:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TyMwpUdY;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=DbvnBLZi
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A41810E0C0;
	Sat, 21 Nov 2026 07:40:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89AF510E0C0
 for <intel-xe@lists.freedesktop.org>; Sat, 21 Nov 2026 07:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795246824; x=1826782824;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=8LEeEnPR3iQBhlHGySQGoeS/aSIPxGgCAZR/5IHm/WQ=;
 b=TyMwpUdYlsv486+nu9HwVFo0sJ0BZNbWDM1uEMW/BQxoERMU1PkZkChi
 cmrhFxYD5jIFXh9vH9bbNOA9iQe1v+ucj86dP4r3U1fjx9ZkGTzg+KSMr
 WUOpCIQ/TfodWcC12kMrCUDZeDzhYf2gBpI9S0e9TSVV+kQFRX8ErIe3o
 3s0wvNmNwnDjxnnR7MS0Tlv+4s1RQTfq3lrG3N1QYAL+/0i5aNjzJmAwv
 tuZ2lyr+9UgvQlkIFq54Vsri4sdFHs3e6I/xZbZU66Mg2tkoKbWTMG7ss
 BJ5MgoBXNAfp2M5blIR3S2fZnw8vN2k4BaQooJrUotVdPkmxDCCy8mNwq w==;
X-CSE-ConnectionGUID: UgOYHN5sQ2yHmeQSIZ+H1A==
X-CSE-MsgGUID: OR8dxPZzS7qjdxTaf6oY8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4023180"
X-IronPort-AV: E=Sophos;i="6.27,224,1787036400"; d="scan'208,217";a="4023180"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 23:40:24 -0800
X-CSE-ConnectionGUID: LN8zNFxMT3WZSrjITa23Ww==
X-CSE-MsgGUID: vk1M5gDhSx6tAyvQlEO1hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,224,1787036400"; d="scan'208,217";a="11288583"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 23:40:23 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 20 Nov 2026 23:40:22 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Fri, 20 Nov 2026 23:40:22 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.65) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 20 Nov 2026 23:40:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tba920WOFOMnr/O1IIP+xhu+uQKyZ0BUrkAud0iGYbfmSvk/aTGKkVuOpR2Kk5TzPG1YxT+VhnNN4QeFGcPfZFXL/f9C+OUP4saOUOaMQc7VcDRSiEuOWe0iToPjRu5AXcQFU9QLVLnn3yJWOGB2foTOp4Kjw9xCQ3Geizz4bXddx/FffEKQjYHuwHnaAiD7ua3hkN4j3LBH1xz6dWahE+4RtXgf/aEY5i+3f/0OmN0B/HX/g2jSPFjJK1rPxKpxEF5PScIZLgBQ0D6T32t5JuU1K98xKkHgYk+gFUOLtYt+xZz0zQ8bjUsEryP8IC/tdrz5EoeSX9Nb19Dpft9lOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bCzZHEYlu7kI/3oNfUs0RcznWU5R0te1kfGoZy7x/J0=;
 b=pG7JiIqnWdiMyA7XEvyleaKySGmizlmBcJJg7i+tXNufXUjk0WpbsfK4N0/C5yoRmWLjc9qmqlQC4RRsYs5QGgZ+JGkqD7y1T2p80R75ViDh45Hfcn3SyZE7IPXbs4AC3Aq6Xkn5B4iesG7CfJmGKYhbdlMFXo9Zjp+uXv5/hY2wDWcZsdZCvFGe0Fsf2CyfUW8I+dnnnj0zxPL3zXVNWddR9CjY+KfO47gXPDjjFUQt1djD8dcvTQo67BiW5Gk2opGqoDya0NYzL0Lp4UmMA87gUfV1QQf0RFRoU7YZ4XA825O8Kh6LHCpmQfrov8Yjt3UaWaI2B92A236yAZaDoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bCzZHEYlu7kI/3oNfUs0RcznWU5R0te1kfGoZy7x/J0=;
 b=DbvnBLZi7nWfws00pQq8pm82GIWLBurAGui7HuD2pzXmKHfx49+rOvSL7+8rmmy2FCPw++JBeay7DnWJZ2wLw1eS1HmyMIkN8AJ70Fvzv8uFQ+5D37RjBkHJUbEHSz283KPK+0BTAgDLJwLjWA9zDde0jmAD6TIg9+U49RUa0s0=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7862.namprd11.prod.outlook.com (2603:10b6:208:3dc::8)
 by DS6PR11MB658360.namprd11.prod.outlook.com (2603:10b6:8:52b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Sat, 21 Nov
 2026 07:40:09 +0000
Received: from IA0PR11MB7862.namprd11.prod.outlook.com
 ([fe80::3b4e:43a6:6e22:22f]) by IA0PR11MB7862.namprd11.prod.outlook.com
 ([fe80::3b4e:43a6:6e22:22f%5]) with mapi id 15.21.0639.011; Sat, 21 Nov 2026
 07:40:09 +0000
Content-Type: multipart/alternative;
 boundary="------------6qH09Pm7WR6EKGIy3xdVUz22"
Message-ID: <81b4c00c-33a0-44a0-b7a3-0a13f6bebf59@intel.com>
Date: Sat, 21 Nov 2026 13:09:59 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/6] drm/xe/cper: Emit software CPER records
To: "Nilawar, Badal" <badal.nilawar@intel.com>
CC: <anshuman.gupta@intel.com>, <vinay.belgaumkar@intel.com>,
 <riana.tauro@intel.com>, <karthik.poosa@intel.com>, <sk.anirban@intel.com>,
 <raag.jadav@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <jani.nikula@linux.intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
References: <20261119060019.2031897-8-mallesh.koujalagi@intel.com>
 <20261119060019.2031897-11-mallesh.koujalagi@intel.com>
 <3e63b622-21ec-41eb-beb1-cbe37d062d14@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <3e63b622-21ec-41eb-beb1-cbe37d062d14@intel.com>
X-ClientProxiedBy: MA5P287CA0055.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d3::8) To IA0PR11MB7862.namprd11.prod.outlook.com
 (2603:10b6:208:3dc::8)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7862:EE_|DS6PR11MB658360:EE_
X-MS-Office365-Filtering-Correlation-Id: eecdddcb-90d7-4653-6fd5-08df47a2ab5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|4143699003|261022105027099003|11063799006|56012099006|261009223027099003|10067099003|261102123227099003|261021121427099003|261026140227099003|261022113327099003|261028144727099003|18002099003|22082099003|6133799003|8096899003|3023799007;
X-Microsoft-Antispam-Message-Info: H3h2oXkmXfVbD1nhjk+F9w9b/FMYQL1FpEFcFueJhv9D1FhktEaztNiHNiF3gtqw6nEIq8hzFxAv9BMr2KlM9VB2poPpadNSJ8kTDDlWVl6dao7h17IxrMUA1cInj71XI+rpbP7ZYAbDQuJeLLgiWTwJZTj3LmXM4OFuSxLFdJ3T8bBNOZNv9iK2VDeUMcMSlAznr0Kk3IC0q4nQseX1h4RPHhD9aME/y7DZSDN40821hCSXlAMD5VMlC/GWCfnePClBhAneUTj8N/Ldta4wxm5OXeK4gBPk7c4l1k7qBi8hSeeEjEBDgVrqHcz4Wp9H3LtClpB1tBpMvSKMsHfzpI7npgMLLDKhZbKXoQijFbEJ2UboloYk0K4mgIDH4g36EkSU4Xw4DPCkFB+Yb2frwLoUzV/o1vatAdR0KeKbTZk1blbFEKvzltIr2LeJzK6MZI2ZyC6VctjrIlvpHlnynGSzcpOvgdB9Zt8IsQ980BnRlxqvIfNDt2Gp/qdYTWzb6TEEsl10w2Hdix6wIPLF4+RGGUdliaqBE1nSqz1B7gA1F9O7k0ouQyIR18In1tyAj/N4GIVSkciKIkU0UPLGqO7LmHK1Dyu5nuhs6M4GcbTh6GAhK1uD9ix6zCtVp8doa+15VNtOZY1OzHmwUP3nAtKEdJj/ogUZmHWQW9Qb0+c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7862.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(4143699003)(261022105027099003)(11063799006)(56012099006)(261009223027099003)(10067099003)(261102123227099003)(261021121427099003)(261026140227099003)(261022113327099003)(261028144727099003)(18002099003)(22082099003)(6133799003)(8096899003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bXpTbjZ0SENNUDVXbm5wZG0waXQ2Q3VreWJZNFZCaC85T3dXUlFoYjFrNzEx?=
 =?utf-8?B?WC8wUnNZSlF0amtKMTBGUDBUNlFYZWFuY3B1SGU1SURlUHNJcWtodG50U1Yr?=
 =?utf-8?B?NmlBMVl2Mng2S1VEK2NHbDFBdVpNSjBiTjdMcnl6KzRXMHlXcWxDZDdQLy9C?=
 =?utf-8?B?YjgzblhacDdsTC9rdVNybVQ0VzRQQTk0ODZTeUsvbFQ0ZmhUVThBRW5jZjRH?=
 =?utf-8?B?T1JrWXpkQU5UM1lZb3RDUWZ0WGs1WE1hQURYWWVYVGtDd0RmTWUxK1kxaFcr?=
 =?utf-8?B?QkNDbU9CbWg5WEVHb29saVJLc1EwNWREZjZ6MVBMNjZKbzkxZklaMTIrd0FG?=
 =?utf-8?B?SlRLUERCd0R0UWE3dEhvQ2FqN3U5MmMxUkQ4YTVabnp4YVpsb3VjSXErV2s1?=
 =?utf-8?B?TldDM2IyYTQzZzY1bmtxdWFaUGlmT2pEWXVPZHpkVHZiSG52RkI3cnNUb2RU?=
 =?utf-8?B?MVRRQnQ3OFdNbHBUd1BPMzltdlhjbjFnSk9zdmVod04rSmtzdEZKd1RSRFo3?=
 =?utf-8?B?V1cwL0ZQZTV6MUpwWVM5Mm1GanZvOVV6TEtZM2tlajNSWFVVblVRMDVNYXRv?=
 =?utf-8?B?SG5ka3lzd3U0Qmh3UGJlT3phZHdsclVZUE9UWTBCRzBtakNXbkdZWll3SVpp?=
 =?utf-8?B?bDFyOHYxWVZmRER6ajRpVkFZS0JCcm5CbldzdmlzSVBaYnEvdW9ReVBJdnFi?=
 =?utf-8?B?Zk1yZHJVMFVxbW1hR0pGSGw4Z252ZjQ4TUdsMzdMaEV4OTQ4dXdIamZBUUFT?=
 =?utf-8?B?U3NMNG43bjNuK2NuZG80K0srejhQOHkxd05LcmtzdU4zb2I4VUZtc0ExZjdW?=
 =?utf-8?B?bGlJdFFQZklkNEhxYTlGWlY5alNYYlFJaXdBdTJ0U2tXUERHb2JqNjZUcVVS?=
 =?utf-8?B?ZmNJV1lOdkNQeFZkdEJEUjlVSGdSWTFJSkNtWGl3RGpuZ0kxK2EzVHJTSkhi?=
 =?utf-8?B?eTJMRTAvUkQ5RmQ3cjdTKzdnSkYvZnVONm5icVRuWU5IcHF0eFgzaVNYSTRh?=
 =?utf-8?B?THZXRTRhaFY3SmR1YzBnb0lJZUFZektHaUIvRWlvWG1PeHdJN0NOWml5MG1I?=
 =?utf-8?B?ZHdvY3lOQlhDVHhIMU1sdzFzZXpDcjVTOC96YjBucUo5aTl0MERDTGFUVDRh?=
 =?utf-8?B?dWhMSCthbGI0WXZteDBXc0RZQXNqa3hDb2UzdU13ekpUc0xtYjlGV0sybVMw?=
 =?utf-8?B?RkYvQXYzbzg3YmdwQm1lWWFMRU1YZUI0c01DcGFvNkJCQXc4WjY2b1pPWExp?=
 =?utf-8?B?OFZ0NnE2YkJ0UUQ3cWhLaGxmWlMxN21mK1AwbnYyQkJ6ZFZmMlVqRFJuSStT?=
 =?utf-8?B?Q05JbjUwRHFuZVRpeXE4Y1hNZW1nY1lqd3dXTXRORlQ0WmNIU3Iydngvb0s3?=
 =?utf-8?B?YnFLeENqQkZOTWJCc3lMNHhWRVNtZEFYZ0N0eGFwTm4rb09hK1p5OWl0bTl0?=
 =?utf-8?B?QnNmd3VURDVoS3d4NzFoYzVYNXIvampxNDZwZEQwOVdidk1ndk5ram9QTnlt?=
 =?utf-8?B?MVFibVZza1RVbXorVURibExjcHYwVmt6SldXaWJUUzJCY0MyM2tyUU9TWE5I?=
 =?utf-8?B?dG8wMlVXdUU0RE9jTFVsZExpb2RCNGR5NzVkbmh3Zks4cVlDanlJZEhNb2VO?=
 =?utf-8?B?Uy9kQ2FaQUdZblRJSjVXYmxFSUQ1R3oyZTBmYThOWTJwZ2g1TURmTGRCTzV4?=
 =?utf-8?B?aS8wcnR0VUtaVWVMM3M5OGVSY29JZTNoWkdka2dhdVluR2ZEaDU1a0xGaEZY?=
 =?utf-8?B?ODB6WVBlamNGN1RtTXpCaFZtNXBKYStiWHBsa3F2elpoQU0yMC9PN1ZkcHU2?=
 =?utf-8?B?bXVGdVQzcXdVczNVZTVHVGJPZnpPMUovbDdMbmVZRUlRVWk2TXVpUWFSbGc0?=
 =?utf-8?B?UVZlK09KVGdqcHZ2dGtoeHRFOENVRHlQNjgzNEJidmhzUjlzRXBtUkdEWTZ4?=
 =?utf-8?B?RHJERmE5cmJ6V21BS2xGc3oyYXpyL0M2M1J1d3dEaVF3Tzc3UTVyb0p6K2JL?=
 =?utf-8?B?L2J2VWhOWDJFY0JnTlFoVUU3a0psbjNRTkkzY1owekhRYTRVTkJxQ25YSEo0?=
 =?utf-8?B?Y2FNeENOcFhmS0tqTTdPalF6TGU4YVh6NHpPR3lDdyt4ZlBmK3FzUWpxVHI1?=
 =?utf-8?B?eDB1Y0ZzUlJFNWp1RTU4Y25ucDlLdGdCOWszOFBPWFl2d0IyaFVxTER2WVVL?=
 =?utf-8?B?WVAwZ3Q1L3BiUGN6VldRRnFSN01xMlRPYWJRbm1nNDcyQ2d4b3UrTjR2Y2F0?=
 =?utf-8?B?NmphMmh5ZnN1dkZ2RjdmWkUxVFNIeHcwejlHcUlFZm9sZDhTR0RQMXNhbjly?=
 =?utf-8?B?QmYwNHpJNjhERHlLc29SVXQrdFdQazZOemM2c3ZkRFdPeG5aR2ZKWXUrampH?=
 =?utf-8?Q?QBlfNJ5Z6IPJA2V8=3D?=
X-Exchange-RoutingPolicyChecked: ixj0au7t/CZbs3EykjbiOPxBvmmQIIQXPXLvWrpj2p1kIreO8MbFMtyrjHJsIJ9w1vPZCendZWrt0hI0YIi51t725Ol1aQEn5Kuebu1r24Y/acXwE5reMMJeW8vjuPp52t1yX60zfu1Ydc2MpcXY/N2aAISaU7SsKhLMmSaSXsh6mFxZhhqKqdIuMHAQ4eAIU7jCh0FzUrRl8xr/QFxfkwPyxzwMPwoArYr0fGLGIw9DLuc0f6sIG85Pjghnqi+QhCD5QDugNIgIpwbvx23S8t/NdPNVJWPEX39fGcTnPBIGwEJy7ycqm2ubiTo+VN7j91SpdvxOrkPZbqm1uRAMyw==
X-MS-Exchange-CrossTenant-Network-Message-Id: eecdddcb-90d7-4653-6fd5-08df47a2ab5a
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7862.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2026 07:40:09.6465 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3azDwjxeAfeerCStz/prSYu53Ump2CODfzr0iZNBQjK6HWi3GCIkjuhCaYPZgb0fTHlX1hdONqjZ6LrIXCD3MbanRzHQyvQwok4IxzpYo70=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS6PR11MB658360
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

--------------6qH09Pm7WR6EKGIy3xdVUz22
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 21-11-2026 12:25 pm, Nilawar, Badal wrote:
>
>
> On 19-11-2026 11:30, Mallesh Koujalagi wrote:
>> Emit CPER records for software SIGIDs and attach the
>> formatted log message as record data.
> s/record data/info data/
hmm, ok
>> Cc: Badal Nilawar<badal.nilawar@intel.com>
>> Signed-off-by: Mallesh Koujalagi<mallesh.koujalagi@intel.com>
>> ---
>> v4:
>> - Emit complete message. (Badal/Aravind)
>>
>> v5:
>> - Move initialization closer to use. (Badal)
>> - Warn if CPER Message allocation failed.
>> - Emit CPER record header without msg if allocation failed.
>> ---
>>   drivers/gpu/drm/xe/xe_cper.c       | 10 ++++++++++
>>   drivers/gpu/drm/xe/xe_cper_types.h |  4 ++++
>>   2 files changed, 14 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_cper.c b/drivers/gpu/drm/xe/xe_cper.c
>> index 4cb83896c6b5..558f58694511 100644
>> --- a/drivers/gpu/drm/xe/xe_cper.c
>> +++ b/drivers/gpu/drm/xe/xe_cper.c
>> @@ -258,6 +258,12 @@ static void cper_emit_sw_err(struct xe_device *xe, int cper_sev, enum xe_sigid s
>>   	struct xe_cper_intel_hdr ihdr = {};
>>   	struct xe_cper_driver_error_class *driver = &error_class.driver;
>>   	u64 timestamp;
>> +	char *msg;
>> +	size_t msg_len;
>> +
>> +	msg = kvasprintf(GFP_KERNEL, vaf->fmt, *vaf->va);
>> +	if (!msg)
>> +		xe_warn(xe, "Failed to allocate CPER message\n");
>>   
>>   	driver->error_type = cper_sev;
>>   	driver->error_component = component;
>> @@ -265,8 +271,12 @@ static void cper_emit_sw_err(struct xe_device *xe, int cper_sev, enum xe_sigid s
>>   	if (IS_ERR(data))
>>   		driver->cause = -PTR_ERR(data);
>>   
>> +	msg_len = msg ? strlen(msg) + 1 : 0;
>>   	timestamp = ktime_get_real_ns();
>> +
>>   	cper_init_intel_hdr(xe, &error_class, timestamp, sigid, 1, &ihdr);
>> +	cper_record_emit(xe, cper_sev, &INTEL_CPER_NOTIFY_DRV_ERROR, &ihdr, msg, msg_len);
>> +	kfree(msg);
>>   }
>>   
>>   /**
>> diff --git a/drivers/gpu/drm/xe/xe_cper_types.h b/drivers/gpu/drm/xe/xe_cper_types.h
>> index c9ea8b1694a9..88a83ef86b23 100644
>> --- a/drivers/gpu/drm/xe/xe_cper_types.h
>> +++ b/drivers/gpu/drm/xe/xe_cper_types.h
>> @@ -40,6 +40,10 @@
>>   	GUID_INIT(0x4ae12aef, 0x8745, 0x5fc7, \
>>   		  0xb9, 0x96, 0x71, 0xee, 0xbb, 0x51, 0xf2, 0x23)
>>   
>> +#define INTEL_CPER_NOTIFY_DRV_ERROR \
>> +	GUID_INIT(0xcef7e934, 0x51e7, 0x535f, \
>> +		  0xa6, 0x78, 0x5a, 0x4c, 0xcc, 0xb6, 0x96, 0x09)
>> +
>
> With a comment addressed:
>
> Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
>
Thanks for r-b!
>
> Thanks,
> Badal
>
>>   /* Section Types */
>>   #define INTEL_CPER_SECTION_ACCEL_GENERIC \
>>   	GUID_INIT(0xea9d8f84, 0x4258, 0x5227, \
--------------6qH09Pm7WR6EKGIy3xdVUz22
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 21-11-2026 12:25 pm, Nilawar, Badal
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:3e63b622-21ec-41eb-beb1-cbe37d062d14@intel.com">
      
      <p><br>
      </p>
      <div class="moz-cite-prefix">On 19-11-2026 11:30, Mallesh
        Koujalagi wrote:<br>
      </div>
      <blockquote type="cite" cite="mid:20261119060019.2031897-11-mallesh.koujalagi@intel.com">
        <pre wrap="" class="moz-quote-pre">Emit CPER records for software SIGIDs and attach the
formatted log message as record data.</pre>
      </blockquote>
      s/record data/info data/</blockquote>
    hmm, ok
    <blockquote type="cite" cite="mid:3e63b622-21ec-41eb-beb1-cbe37d062d14@intel.com">
      <blockquote type="cite" cite="mid:20261119060019.2031897-11-mallesh.koujalagi@intel.com">
        <pre wrap="" class="moz-quote-pre">Cc: Badal Nilawar <a class="moz-txt-link-rfc2396E" href="mailto:badal.nilawar@intel.com" moz-do-not-send="true">&lt;badal.nilawar@intel.com&gt;</a>
Signed-off-by: Mallesh Koujalagi <a class="moz-txt-link-rfc2396E" href="mailto:mallesh.koujalagi@intel.com" moz-do-not-send="true">&lt;mallesh.koujalagi@intel.com&gt;</a>
---
v4:
- Emit complete message. (Badal/Aravind)

v5:
- Move initialization closer to use. (Badal)
- Warn if CPER Message allocation failed.
- Emit CPER record header without msg if allocation failed.
---
 drivers/gpu/drm/xe/xe_cper.c       | 10 ++++++++++
 drivers/gpu/drm/xe/xe_cper_types.h |  4 ++++
 2 files changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_cper.c b/drivers/gpu/drm/xe/xe_cper.c
index 4cb83896c6b5..558f58694511 100644
--- a/drivers/gpu/drm/xe/xe_cper.c
+++ b/drivers/gpu/drm/xe/xe_cper.c
@@ -258,6 +258,12 @@ static void cper_emit_sw_err(struct xe_device *xe, int cper_sev, enum xe_sigid s
 	struct xe_cper_intel_hdr ihdr = {};
 	struct xe_cper_driver_error_class *driver = &amp;error_class.driver;
 	u64 timestamp;
+	char *msg;
+	size_t msg_len;
+
+	msg = kvasprintf(GFP_KERNEL, vaf-&gt;fmt, *vaf-&gt;va);
+	if (!msg)
+		xe_warn(xe, &quot;Failed to allocate CPER message\n&quot;);
 
 	driver-&gt;error_type = cper_sev;
 	driver-&gt;error_component = component;
@@ -265,8 +271,12 @@ static void cper_emit_sw_err(struct xe_device *xe, int cper_sev, enum xe_sigid s
 	if (IS_ERR(data))
 		driver-&gt;cause = -PTR_ERR(data);
 
+	msg_len = msg ? strlen(msg) + 1 : 0;
 	timestamp = ktime_get_real_ns();
+
 	cper_init_intel_hdr(xe, &amp;error_class, timestamp, sigid, 1, &amp;ihdr);
+	cper_record_emit(xe, cper_sev, &amp;INTEL_CPER_NOTIFY_DRV_ERROR, &amp;ihdr, msg, msg_len);
+	kfree(msg);
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_cper_types.h b/drivers/gpu/drm/xe/xe_cper_types.h
index c9ea8b1694a9..88a83ef86b23 100644
--- a/drivers/gpu/drm/xe/xe_cper_types.h
+++ b/drivers/gpu/drm/xe/xe_cper_types.h
@@ -40,6 +40,10 @@
 	GUID_INIT(0x4ae12aef, 0x8745, 0x5fc7, \
 		  0xb9, 0x96, 0x71, 0xee, 0xbb, 0x51, 0xf2, 0x23)
 
+#define INTEL_CPER_NOTIFY_DRV_ERROR \
+	GUID_INIT(0xcef7e934, 0x51e7, 0x535f, \
+		  0xa6, 0x78, 0x5a, 0x4c, 0xcc, 0xb6, 0x96, 0x09)
+</pre>
      </blockquote>
      <p>
        <style>@scope { a {
    text-decoration: none;
    color: #464feb;
}tr th, tr td {
    border: 1px solid #e6e6e6;
}tr th {
    background-color: #f5f5f5;
} }</style>With a comment addressed:</p>
      <p>Reviewed-by: Badal Nilawar <a class="moz-txt-link-rfc2396E" href="mailto:badal.nilawar@intel.com" moz-do-not-send="true">&lt;badal.nilawar@intel.com&gt;</a></p>
    </blockquote>
    Thanks for r-b!
    <blockquote type="cite" cite="mid:3e63b622-21ec-41eb-beb1-cbe37d062d14@intel.com">
      <p>Thanks,<br>
        Badal</p>
      <blockquote type="cite" cite="mid:20261119060019.2031897-11-mallesh.koujalagi@intel.com">
        <pre wrap="" class="moz-quote-pre"> /* Section Types */
 #define INTEL_CPER_SECTION_ACCEL_GENERIC \
 	GUID_INIT(0xea9d8f84, 0x4258, 0x5227, \
</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------6qH09Pm7WR6EKGIy3xdVUz22--

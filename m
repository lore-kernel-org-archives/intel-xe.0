Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1907606A31A
	for <intel-xe@archiver.kernel.org>; Thu, 29 Oct 2026 08:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=K1h2VRXS
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6D26112064;
	Thu, 29 Oct 2026 08:07:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 545BE112064
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Oct 2026 08:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793261245; x=1824797245;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=YGHO9c9PID9R9FLyRIhG36gjH6LJonmypqNeiztAxD0=;
 b=K1h2VRXSxIiYpSH0lPrQfXK4lE0877UJiQqqC//N8gTU39Lix+bIa0d3
 CXQHbxVTF0+aOlsWyvCNJJJfzw/A2oCtD9n5b/Y4Y1dc+0/GRoCgdRGXp
 XtJf6vDOIha25Z8T1mXicpbsbqg+lCwgwwHg0diCnZeSf+SQCAfIG8mZb
 2nGihCLWyaqzLlIRuEczc2ki2FaZem3mg34OG+DQ0dzPLbVXZvIBdmVcC
 e8u0zgSoRT1xPU5JqNzsY78WZ845KJjjTEZkvu+HGRT0NwFs8zfhEjMsM
 gxNsS4CbwZD4uGu2islduZnCVT9OCEdNLbVhKynIBqkHZ0XwUHnsNAb8c A==;
X-CSE-ConnectionGUID: dPKdfOM3QQeoZHI7sUOnIQ==
X-CSE-MsgGUID: ukv4ibRNRDKG6agcOGyIEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1880076"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="1880076"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 01:07:24 -0700
X-CSE-ConnectionGUID: Zq+SPPF7TQCSVM+EW2aqZw==
X-CSE-MsgGUID: twzh/XwCQiycIlEgNVTISg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="5600397"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 01:07:24 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 29 Oct 2026 01:07:23 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 29 Oct 2026 01:07:23 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.53) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 29 Oct 2026 01:07:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RZXQ/qxCtJ+5JzqVmNHZyNmo4kxGQK1UJ0aJd3dfZ6kxQ2cSrXleshAYQZ5TXsa+pVbGeeyCc6Vraf0RzjEYcPpDKwPGmRgRMwpK1Tq4Xiihd8vhmVpI5O0O/+rHA7Drrzp7nleX+4qi1dMrC8e9O0yH6rkU8QtB3OplUg3Y2S+7LjBnS/CVtsocxUAUDlkduW5G27S3oVlp8hUysfiRGkPFpwX7pfeby6wk7u2jSAefAW6yKcNQpGxW/qwmBZvECOYWXxiXa9mW6UXSgiEqg15j0u4j3VwO7RgUEEScJIA0LnrrIyRjgDRU3NN50GQI5V+NrEqmwBmAX4FboxZnhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NjOAUxl/6q3Xw/Nh94J+eG95FWlcUb1J1W+FrtZGY6c=;
 b=b0DL723cLPqWeTw5wwIObJDggV9mMdS4aE27KMqMXJtd3gr8oBhxNx8sDcosRv+9OovOq93cfN3dhqVD7tAg02HNho0Z8U0FsK1ST3R3SwIlQCGI5fdgOSaueBhXaHAq0h88xgYeb63bd3p53K3T41lLv00tXqChs9WM9w1fwQRYT1UXjhiRrWfiZAjcEMIfxhCIUQEOjizt7iYjgRYw4s5bRXNTnWNOGsp/PZrlGVEzGhO+6Zsh+FJmFr7bbrLJgBny8IjfE5GxhTxguPi+xuwQNKtQKODbdc6LA6ozMFGbcyTX21yfc3RR3boXTGjRqKUc+khH7msRJr1oqmgxMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 CH3PR11MB8546.namprd11.prod.outlook.com (2603:10b6:610:1ae::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.8; Thu, 29 Oct 2026 08:07:21 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0546.021; Thu, 29 Oct 2026
 08:07:21 +0000
Message-ID: <4feec7c1-5e02-42bb-a9e4-ca9383d895f1@intel.com>
Date: Thu, 29 Oct 2026 13:37:12 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/9] drm/xe/hw_error: Reuse CSC worker for generic
 error handling
To: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <badal.nilawar@intel.com>,
 <raag.jadav@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <tejas.upadhyay@intel.com>
References: <20261026060459.771448-11-riana.tauro@intel.com>
 <20261026060459.771448-12-riana.tauro@intel.com>
 <f99f8a5b-9810-4c1d-93c2-6c50f2b3397c@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <f99f8a5b-9810-4c1d-93c2-6c50f2b3397c@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0043.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::14) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|CH3PR11MB8546:EE_
X-MS-Office365-Filtering-Correlation-Id: 7df2317f-8659-4441-adf6-08df3593a80a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|261028144727099003|11063799006|4143699003|56012099006|261009223027099003|261026121527099003|261021121427099003|261021123027099003|261026140227099003|261022105027099003|10067099003|261022075727099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: eI5WlAwSXENtNcWXHYh6BPUxtaOBPRdTmElueO0OLGAxbL+MTlgCKa3VX75RwAwzeAwTCtg1VLPNOA0rO8uR8PJ/bHT+Ahtli8YjXGqFLCajJ7yAPKwolQtOP6Ik4lixnilotPuh2l201EuVsU2lztym3gW8CzBawM4kO+GzxflC9hVeTrBwYvp/jXRpSOEssnoKLqaCXExakFWVvK/MG1nwwb/Im41jdmdSVZZM6D4QdABjfliGh3LWli3joH97u9BfjYjJlM+EBPZOisBVcwz1BiXxkIoh0RNOVb7fvCrC5RzMe15UFGkpwdAWnC0qp2836n+i2wJft2TVbNhADdSmRwQpL5zbaqPwDjh2+Qu+PvQI+Krxp5NIFKMRDVG3sdFm9h4Rl+OftZ4+aX4FT06JF9rZlCs73cG3FZH3Bdm6LTdr4XIzOegIVrHFXLiTyCrrleMwky+n3FhoUUQ4GMS+6IsagOfWqsOauuVXA1/uiVPy2XzacPAUnMNjd9YO02+MyB9CDPJwz6yFvktUm5OPRWvroO1EIjceennUsD/vDFRhq2r7jR40LxyOgRdAhEm/kjK0cuharmNcvt9TKPU2dBB9SH26CT9WXaOopmYXYnEo380laybhClDbQlwWn85kTK7sPrkrBGIGFBbJyt4Fw3Qq/HrlJ/YAoyfd7T8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(261028144727099003)(11063799006)(4143699003)(56012099006)(261009223027099003)(261026121527099003)(261021121427099003)(261021123027099003)(261026140227099003)(261022105027099003)(10067099003)(261022075727099003)(22082099003)(18002099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ODk0NElidk1tUlo2dlcvYis3Nk9XSjBudVpxdTFKdS9HblVYTTEzbjlHWjlN?=
 =?utf-8?B?aEhmb3NtOHJFRkQyYmZiZ1dGWHlIQlpTTFlxaE1rYXFZNis1MFptMVBsQXJW?=
 =?utf-8?B?Wk5BN3dwcFRrRnJIU0tuNzVHakNZSENRRVlVTGtZVmxxazVSbjFEayt0OWNl?=
 =?utf-8?B?cHVqQTZSYTc2ZmNOQ09Hc25vQnd0VjUxRG8yeldEY3BLYVlFUHlKNm9IOGp2?=
 =?utf-8?B?OFR2SmFIaExKRDlNWm9Ic2kvNHppdXJLVitaWmw1bHN4ZG42U2xXMkFWSWZo?=
 =?utf-8?B?OWJoMUJQRDN6bFhKWEFZN0N5Vll4cEFVS3JxcUlmR3J5UER6WFRLMUlYa1Jm?=
 =?utf-8?B?d0sxSHZLOFlqVGlBTWY3UUlzYmt2MzIrZy9SUXhxeVZEeWFuOGNjSGZsQThz?=
 =?utf-8?B?WW1kVytDMjY0TWtrVXlXSHNhLy9OQmxhV1h0clIwems4Z1lJdDFVQnRlVUdU?=
 =?utf-8?B?TGdWcmhIcENzTFRCQU9SdGNLM2puc0lnc2llMmpkNXpwdVB3Ym9mZ3Vkczhz?=
 =?utf-8?B?TVp4RTFucXVRUDBBb2w5bWRGV3l0K1FWNDVKWkhQTm1ianhWaFYyZmFnNUlU?=
 =?utf-8?B?Z2Myc2t4MzROMzRucGRTQ1grNFF5Q0FuK0Q1YzZUNXNPYlI3ZExIOUlLdFlU?=
 =?utf-8?B?RjBtYW11VXhxZXZFVXQ0cWF6dnpHK0xBR3ZEeFgvUzRRSzkyd0YxOHc1RkxE?=
 =?utf-8?B?bEtUbVV6Nnp6eGNweHhZM011NzhTVGEyREZ3WUFSRWJ0SkszUEhSZTNWdU8x?=
 =?utf-8?B?MEgycXZyTlNhcW9xV21RUExNZjY0MWRrbU5xZjM4UUQ1azJIbEVDV1FkdE15?=
 =?utf-8?B?ZTNzY3RsWVFqL1phMXJpRGIyOEVEajNYVm9PaE9NMXJ5U2RBT2g0VlE2elNH?=
 =?utf-8?B?b3VOajZHUlRXSTJ0UXRDclBuWGhDSmlyWDNrM0lGUE5kRThBNWJvK0t5R1pF?=
 =?utf-8?B?UFhjOTB0VmtLWXY4UEthVFBkT21FTmQybmZ4cTJtOXY0dWNzMm5lbTQ4Rm1W?=
 =?utf-8?B?TDJ2cXBaQjJqRGZhNE1nb3c5YjZDQ3kzVDJsOTUwS2lpblV3dnBqLzk3K3p5?=
 =?utf-8?B?YzF4OXdabFpYbERzanRpanVRN212WGk3bzh2V0JhNjlrV0E1TkcvWkI3aXFI?=
 =?utf-8?B?VWdScStvcHd5a3NoM3c0SThVd1UwcVVKSjcxbDRWZmNZcFdPQ1lqMmZqbUZn?=
 =?utf-8?B?VHFuZmozRWZKUmZMbmE4TW50NEVHekVqVWxTbkE1emMzc1N5bW12MHJPWlFJ?=
 =?utf-8?B?R3BSMDJUdXRUYk1QUjJOelpUNElLNmtnTUNiMWdSMXhubHJmQ3BVWWNVbGFs?=
 =?utf-8?B?bWR3QStLU1RNQTl3dEJRam5tQ0FUaGlvM1RhQmsvemFaQ0pBRzN0ZlRkdmpF?=
 =?utf-8?B?L2VPNzBwWFBXMHdxQ2ExK1M2dXJXOGJqOE9NbnVKbXhHT1h2bWVxREhnMkRU?=
 =?utf-8?B?bTd0Q3RVU0FFeEVlZUZ5WS9ka0hQZFNDc0FkYXhaYUd0K0ozMzQ1aU9UUTF6?=
 =?utf-8?B?TnlNb2VLakZEL2VSVkMwbXhZcjBjWU1yRkYvV1hjNlB5OHFjM1pQUmFQTDlU?=
 =?utf-8?B?VTViano5enIvZEljTW9DeE9TMml2Ny9ieW4ycGhnV1NMYTBYQ3drTDFNaHho?=
 =?utf-8?B?clRuQlBZVHp4c1d3Nlk0eXFhdHBMS3ZvUHI3SHE0dlhPMG5ydWVPTklkQmVI?=
 =?utf-8?B?MkVnNzU4NHE3aXBUOS9mT3FlSFpEbFZ5K2xua0tXcFNmd1JSVHdLSTFSVWxa?=
 =?utf-8?B?YUpnWlN0T3M1M2UrMnpLUUtKNExXemNMOGkrVDBHeXNJbzRPdlN3MXEzTm1D?=
 =?utf-8?B?VHZqNHAzRjRFeEljbFV5NHZUNjBreUV3K3YzRHVQSGZwN1hHMlpId3I3WFRy?=
 =?utf-8?B?Y1JZNnhjT1JUaUFCUDU1WVd6RU5paTYxSEU1eUxGRjhXeE5kVnNhRzlIbFBj?=
 =?utf-8?B?akJ3cGVhU041a1NQMWg2c3pndWlnNkRaMHhPd2hYRk1hcUwxNm9pdVlEc0hM?=
 =?utf-8?B?MFlaQzhzd1J6VXdyRTRub0dmcStLOVRDWVZXQTVyTks1NjdCdnUxY25CdUxa?=
 =?utf-8?B?ZzVyMDVzYUtpSzEvMkRjVFpxUlpIU2RiRGdERFJVZ3dnWndLY2lrNmpQb1Z0?=
 =?utf-8?B?bGFveStPd3NQMXBreFcwL1ZtWG93ODlMSkhXZlliZlRIVEF6RUhBWFdoQmlp?=
 =?utf-8?B?YTZ1eEcweEo2Nk1KOXdobnlTa2hXZkpkdkZtc3hkamFuYmZZZ08zZXBzSVNw?=
 =?utf-8?B?UW52Y0Q0UWdrVnZCNUkrK3l4azVlRVlMMzN4emJMSlozTElyZ0VGVmVpaEha?=
 =?utf-8?B?ZTh6OHhQbm1Ed3RCNm9DNkRld1YwVWtyNHdYbnU3eHZPSUptUFVrUT09?=
X-Exchange-RoutingPolicyChecked: qSm4sIABQYc3g5E0YpZowWx2j/aR9Xx1/2CTP0nTgzzyr2eP/AsU/9/YkP4o/6BxDpBjXY8I+yN1RzMyfXAjmpsapdYogeC4E9/oqi02HzZBPNZE6eUqO6GG9Xbod3AVS7TW//S7K2klaH3HfLJQmtTfCDOl97SfD2IgqY7OhMqvwzVZhPCX14F1Hapjm8IMutjr+ON2DUqbWTVXERB4eEivXNtCMUcXMa1t6Cc+c4ocyaAxs6tEyR2r5lSPEO0FyJF97+golZdDZZRMqIkTlfqk1JBpqrqg35jEGPs3DYez+rbcaDvj3tUs9aCKa+BYZZ13K8jB9ksSy9rbt2kPeg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7df2317f-8659-4441-adf6-08df3593a80a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 08:07:20.9741 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7V1VKmFLcJChZeU0KHEUf0mhJ/X/VPuF/+05Eri3K5+wu1o2fO+tAGwt5BdoaVIzeM1ytyKTmMBD420Z653WCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8546
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


On 27-10-2026 18:31, Mallesh, Koujalagi wrote:
>
> On 26-10-2026 11:35 am, Riana Tauro wrote:
>> Convert the CSC hardware error worker to a delayed work item so it
>> can be reused for generic hardware error handling in later patches.
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_hw_error.c   | 10 +++++-----
>>   drivers/gpu/drm/xe/xe_tile_types.h |  6 +++---
>>   2 files changed, 8 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_hw_error.c 
>> b/drivers/gpu/drm/xe/xe_hw_error.c
>> index ac720710c8e8..41ddd997478b 100644
>> --- a/drivers/gpu/drm/xe/xe_hw_error.c
>> +++ b/drivers/gpu/drm/xe/xe_hw_error.c
>> @@ -166,9 +166,9 @@ 
>> static_assert(ARRAY_SIZE(pvc_master_local_nonfatal_err_reg) == 
>> XE_RAS_REG_SIZE);
>>                            pvc_master_local_fatal_err_reg : \
>>                            pvc_master_local_nonfatal_err_reg)
>>   -static void csc_hw_error_work(struct work_struct *work)
>> +static void hw_error_work(struct work_struct *work)
>>   {
>> -    struct xe_tile *tile = container_of(work, typeof(*tile), 
>> csc_hw_error_work);
>> +    struct xe_tile *tile = container_of(work, typeof(*tile), 
>> hw_error_work.work);
>>       struct xe_device *xe = tile_to_xe(tile);
>>         guard(xe_pm_runtime)(xe);
>> @@ -204,7 +204,7 @@ static void csc_hw_error_handler(struct xe_tile 
>> *tile, const enum hardware_error
>>                            hec_uncorrected_fw_errors[err_bit], 
>> severity_str,
>>                            err_bit);
>>   -            schedule_work(&tile->csc_hw_error_work);
>> +            schedule_delayed_work(&tile->hw_error_work, 0);
>
> hmm, what is rational to use delay work? and making CSC work as 
> generic hardware error handling?
>
> do u see any impact when we trigger fault injection etc.

This is used in patch [4]
We shouldn't have csc error injection in systems with sysctrl. So 
shouldn't affect.

Thanks
Riana


>
>>           }
>>       }
>>   @@ -513,7 +513,7 @@ void xe_hw_error_irq_handler(struct xe_tile 
>> *tile, const u32 master_ctl)
>>       enum hardware_error hw_err;
>>         if (xe_fault_csc_hw_error())
>> -        schedule_work(&tile->csc_hw_error_work);
>> +        schedule_delayed_work(&tile->hw_error_work, 0);
>>         for (hw_err = 0; hw_err < HARDWARE_ERROR_MAX; hw_err++) {
>>           if (master_ctl & ERROR_IRQ(hw_err))
>> @@ -551,7 +551,7 @@ void xe_hw_error_init(struct xe_device *xe)
>>       if (!IS_DGFX(xe) || IS_SRIOV_VF(xe))
>>           return;
>>   -    INIT_WORK(&tile->csc_hw_error_work, csc_hw_error_work);
>> +    INIT_DELAYED_WORK(&tile->hw_error_work, hw_error_work);
>>         process_hw_errors(xe);
>>   }
>> diff --git a/drivers/gpu/drm/xe/xe_tile_types.h 
>> b/drivers/gpu/drm/xe/xe_tile_types.h
>> index e1368c04846a..0f41738635c5 100644
>> --- a/drivers/gpu/drm/xe/xe_tile_types.h
>> +++ b/drivers/gpu/drm/xe/xe_tile_types.h
>> @@ -7,7 +7,7 @@
>>   #define _XE_TILE_TYPES_H_
>>     #include <linux/mutex_types.h>
>> -#include <linux/workqueue_types.h>
>> +#include <linux/workqueue.h>
>>     #include "xe_lmtt_types.h"
>>   #include "xe_memirq_types.h"
>> @@ -118,8 +118,8 @@ struct xe_tile {
>>       /** @memirq: Memory Based Interrupts. */
>>       struct xe_memirq memirq;
>>   -    /** @csc_hw_error_work: worker to report CSC HW errors */
>> -    struct work_struct csc_hw_error_work;
>> +    /** @hw_error_work: delayed work to handle HW errors */
>> +    struct delayed_work hw_error_work;
>>         /** @pcode: tile's PCODE */
>>       struct {

Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32CEF606A31A
	for <intel-xe@archiver.kernel.org>; Thu, 29 Oct 2026 08:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DnSZpP9m
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF03D10E7D5;
	Thu, 29 Oct 2026 08:18:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3717110E7D5
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Oct 2026 08:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793261889; x=1824797889;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=KLx0zQSaK7/okNsdMWCJ0DO+RjOc0LblIf8YGLvMw4s=;
 b=DnSZpP9m+ytwJSNlEJVue5YmXh8mRqpDwIYcBsZ0820kYzTFqnvxp9NO
 2mzBUloP99uZ2HQNnHk0ZkuxA6LxPV9un3Ue3kb001H75XQkyVGjLyrbc
 UZtqxINYRRINoy6GpNJDanra/QZxXXYbU+W9dLI/nyoNMmc35C0JQO9wM
 pZYDIkeA/w/TKzM13n8CdBMkWHn+Qk8uXajSyIqCA2cC8Tk5whnjbhWkp
 04RdHVoDBevPfJbxkTOVQxbNo8zby15T42kMWANnXRf1rsi7EIP0ogI9d
 jURUw9tqj1qwDnn8XkHr4rv8hhiUyNq3kST91A9pfg6hvtvwGos4FMmLO g==;
X-CSE-ConnectionGUID: rEiK47T6TL+lcXCjvEb8vw==
X-CSE-MsgGUID: twbdVKmmQuatfgleDS0/8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="2030171"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="2030171"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 01:18:08 -0700
X-CSE-ConnectionGUID: 7wptEPLjQ+ays2+FPVFWhw==
X-CSE-MsgGUID: yEyRa3xPToa3WM6w7+pcHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="5025195"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 01:18:08 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 29 Oct 2026 01:18:08 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 29 Oct 2026 01:18:08 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.15) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 29 Oct 2026 01:18:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E99neHoLIRpXDXhV9Jo1Y5GxCyTm3cWYhzhG/aZTqeKFRCS5NoDzqLgym+Dma9IRxkUkjq06WER3mTdGmm1QQdB1IS75C53uxgSyEfRj1+FK1SmlBZ9QOwn6250Tgd9+eB4OwBLTQr+O/iU7EjqQN+f/HCCLJozrm5uffE5VCIP2wPIy7ksjb5n8jkvTmPak1vVLNyf4weKZFzjp2nOhElRUjxCy+Qmif18PY0WLSuK4qHOKtnvSupSfZIgRu6IUIfn0Nz/GnevqrMJxPQfCiRJ6tEMpStLsTOtCh1IexBjBkzWQt7dfu3CCSwUvVeRqyysIJ8f6TdtKbA4KoJH6uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rsFB1ejnyAyW6fcu1rdta48W1fnDkPgauuGYSGtz7Ic=;
 b=TUcb2ScYk1n/SCNcg3QIQYH9fBkPjqoHWDPZlTWjTPtb+6fqRjqvLBYICIJJQOSOLFl8I/tHceBpHSGqSWmMnJlbly17zTyS8ZxCq7vNxXIdxMJf+fuuve8j7XGu+BmGB4Vx90TKHO3m4CSZ7OGe16LGSBMO+A5yjZc9HnJoaefeO5Pt7yAQpSsZnhHZaqswTIGSA++X9UppZAin1oC4rxz3Vf+oVLRtdNZMP0+TJArezktRXPQwG0u/hADI6/A6vwpA1toQByR5YbxaZcifA1Xybq303j3GPWGop1VB2XMxGmQAbJN0zmu06EQM58NS8+Hjk0fCi8X6gCWaEm8zOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.8; Thu, 29 Oct 2026 08:17:59 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0546.021; Thu, 29 Oct 2026
 08:17:59 +0000
Message-ID: <d39d725e-eeaa-4f7a-9a27-be440e388429@intel.com>
Date: Thu, 29 Oct 2026 13:47:50 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/9] drm/xe/xe_hw_error: Handle non-fatal errors routed
 via direct IRQ
To: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>, "Upadhyay, Tejas"
 <tejas.upadhyay@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Gupta, Anshuman" <anshuman.gupta@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "aravind.iddamsetty@linux.intel.com"
 <aravind.iddamsetty@linux.intel.com>, "Nilawar, Badal"
 <badal.nilawar@intel.com>, "Jadav, Raag" <raag.jadav@intel.com>,
 "Koppuravuri, Ravi Kishore" <ravi.kishore.koppuravuri@intel.com>
References: <20261026060459.771448-11-riana.tauro@intel.com>
 <20261026060459.771448-15-riana.tauro@intel.com>
 <DS0PR11MB8718FF0E8B9E8E9D88D87E1981612@DS0PR11MB8718.namprd11.prod.outlook.com>
 <fd0b47b3-ab33-41e3-9182-ef114a1a2d99@intel.com>
 <2ba9e0c5-8555-4cd3-83db-6858c014c427@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <2ba9e0c5-8555-4cd3-83db-6858c014c427@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0066.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::8) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|IA1PR11MB8200:EE_
X-MS-Office365-Filtering-Correlation-Id: bd4d91c9-50f4-4d47-5c0c-08df35952480
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|1800799024|376014|6133799003|22082099003|18002099003|56012099006|4143699003|11063799006|261022075727099003|261021121427099003|261022113327099003|261028144727099003|261021123027099003|261022105027099003|10067099003|261026121527099003|261009223027099003|261026140227099003|260925021911599003|260925021311599003|260925022911599003;
X-Microsoft-Antispam-Message-Info: kBKtNWEvTyTnArsecm0w2XSFCxJWyQjDFrGPOjiUUSPbLfxmPffd5BodhYMjb4y2VKEDqCWeXFbxxIJTfGFRp9kcspbWUGzxZ6jIXnBIdWp1HfxauPzza6R6wpaI0k8YTukYOutGhcRuDiCWLM3GkUkApPI7vZF3Syx4ALn14FS9SYDXP0sV1TADwwl5w7RBQlQ5p4WsVveVAduz5gF3PHBtN+mwAAILAZCgKxNx8jfHlSGRM0KzSfCF3UDKPVBBzAbhwA7AwsY7S+HbR4IFERn4S+34volEfHo5ZFaauH4dBovnsqV1ZgiR0gFsyVv/h3rSPQL/2bKhYg9QFCL2SilF3SdvOjS+edlYvMj0FrGwYKCcog8AARJp404rFn7eZD9+VAH57/nN+b+2KzkJh++g//q32R9hEafEozx5T9CnW6XU96MeniqPWSa45FsXBt419KqOec2qEVr2dCNGdoRfJ339Jj7Zt9xq1PjvUWD9Kn1Bd4a4GtL0UJGnKlK9E83s0abTq2lCQfgU5trq+0ZDIsZU7ME9pNGfJC+4drhc70Yey/qeaYRTUnHP6RvALzSDh8nxGz8qD22XxUtkqck/0PFi3ei3Ngmg28cNiYXsyG+HgxqcVggEMYQLvVGKl30o++mfEGYQqXMG6RFSxyDvsdMmSmZ+hl+4r1W9LNQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(6133799003)(22082099003)(18002099003)(56012099006)(4143699003)(11063799006)(261022075727099003)(261021121427099003)(261022113327099003)(261028144727099003)(261021123027099003)(261022105027099003)(10067099003)(261026121527099003)(261009223027099003)(261026140227099003)(260925021911599003)(260925021311599003)(260925022911599003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?alRNZC9QSEVOUkZaeVNRc3NrNmlaYUN5SW9heGhuSG1XWmZJN0gxeHFRK3lw?=
 =?utf-8?B?TVJ5d3pnWFlQYjBKdDJrblY2SEFrVFlvckViNXBGV1FYMkF3YTFtZm5SNlUv?=
 =?utf-8?B?R3FMTm1KS2g5MitjQ2RnTldEN3RKUm1tYnk5RTlTeUhvMkY5emVoN2Iwd1dM?=
 =?utf-8?B?NitMK05tZytLUHZFZVRBSzBlNUlhV3JtRXgvTmNlUzBQM0JjcDdQQjNCUE9y?=
 =?utf-8?B?VFJMcHhTZTJURHYvOWRrTElqMW84ZTRuRXg1RDM1d0M3cmxVNC91SDlROERi?=
 =?utf-8?B?dGFjMFJxc083cUNUaU1ucXJxbklFZWNScUFxTGJGekN1K3BZdk9CMnJQNlpT?=
 =?utf-8?B?dW5peXJlTWpFaDhhNlhBMXhjUGRyRTRyNVVNYzc2eGxIZTcxM0Rocm4yaWcy?=
 =?utf-8?B?Ymd0MHBkemI1NVhnYXNJVEFObjlCL2JPWThLYlBNOVNWYi9iQzcwZ25KT2x0?=
 =?utf-8?B?ZXJ4SjNTQUlpakpmMjZWaDU3TnJCMDRyNkZnNWxLU3NrYTQ5ZGhYdlJLb0xX?=
 =?utf-8?B?aStjWitLK3VoSG5DUzlEbEM0bFYvaVdKVDMxS2ZQSDhIa1dKK2JzOGR0UTlS?=
 =?utf-8?B?R01qU1U1YmFLMGxTVUljZjlWblFNWlRMOFVxbjhMdUswMTBaK3Z6RTJFbDV2?=
 =?utf-8?B?cEN0TUVYWGtrN2dheUFHYTdlWHg1WFRUT1B3WTdRWWxmUWZOWE5IVU4rWjcw?=
 =?utf-8?B?ZkhXaGdnUXROVWpjSWFMRnJ0akNKcnNpMHY1aFhVWHRJRWx5cHRBNlVkb2o3?=
 =?utf-8?B?S2pLR05XNUNCejczSjRSZTJxdUJpWENmSXNYQlloSUNiY1RZL1ltMnZ6ckNX?=
 =?utf-8?B?NFhwakxKRmViY20zTjJEKzdKand3R2t6SUxnYWRWenpYc2N6RzhFQ1d5dXNo?=
 =?utf-8?B?bTBSK1NoclcxZVM3UG1LUVd4Qk90MjcrQi8xdFlSVFVEWndxWGNwWnRhM1VS?=
 =?utf-8?B?cGg0WTcxcHRueUxuRmFuTG5HTzBiSmdzUHB0Q1RNUE1ZK3dyZlcyUkNoclpQ?=
 =?utf-8?B?SmtHMUdBbjA2SER5OU5BZ1JwMGR1V0R5SXYzV3hJSXQxeXpKeVc5TmZSUndY?=
 =?utf-8?B?V20rV0hSRlFwSDRnVzB1S2NXUUgwUnlSbFNZWE1WWGI5eWtxblhjTGRMSzll?=
 =?utf-8?B?RGJpSU83ZS9lM2FhTzJZWkd2MHRDc09xTTdyeTJ1ZUpDc3NKY0lMZkw2SVpX?=
 =?utf-8?B?Y3pSUlZoWDk4TXJnNnlXRklSVXJiQlpKMUJoaTJPYit0N09tMFVOU1BleVJG?=
 =?utf-8?B?alEwM3NsYnBQbTBYNmZVMUxYYkErQlRPazZwU3liZ0JyaEE0T1VvL0hWanBW?=
 =?utf-8?B?T3NUSHhtMmlzRkJhQ2N6TzRDQTRtUFc0aFVaNTUvQjVKaDBFMk5FTkpKWE5v?=
 =?utf-8?B?aFdqWkMwOGRTNlMvb1pwbEpCbDI4cEMzZ1pUVWNSTGZmK3MyLzZ3RW13SE54?=
 =?utf-8?B?bXgxWENGOEpvd1pzNXE2bWJEQkJPdFdtU25SaFFqY0RHRFZyS2UyZUpDQmlG?=
 =?utf-8?B?bTdyVEdIWDloM2dsWExxWmtJVGFnNFdhMVI2ZFlwVUdrNUx0V09iQ0Fic3Ur?=
 =?utf-8?B?YTNaVUNNTVdWZmxDc3dCaUZRZHd0cDZhQzNnWXdiNFlqVXcyaUlLUFRkNFF4?=
 =?utf-8?B?QXJPWDlnMWY3OG9Kc2JIMTI0R2o5TXlpOVhId2lONksyMkFOVnU2TGl5MnBj?=
 =?utf-8?B?S2JWVUpTUzh0TDZ6Zzd6TldoNTBtQU1zd1c1K0RzTUxrRVRnSXFFcE5hVVBH?=
 =?utf-8?B?eUhsOVBJR0RZNDNSQ3Jlb0ZWQjNLd1Y2RjN6SGJNd1NOaFBSc0RhVmNsbVFD?=
 =?utf-8?B?c2V1a1pTeHpIVkhVUkh2cWVPQ3k5UUpqMEpMWDhXNEREMGpObk1pTFdoTmxS?=
 =?utf-8?B?ZllLekZSeW02Vi90M2JvdnBIM29hUGdHTG0wa2tMakdVdlFHRXE1TXNZWEJh?=
 =?utf-8?B?UHp5dmFTNVhnclJRZHorbDR3emRLdnYvcytkb0FBeWtCd2o1L0ZCbWJLN3A1?=
 =?utf-8?B?UzJMbFkwVnFBa2xZZW0xRlIySEUxem5tSzQrM1IvakFERlhyYytQRFlKVXJ1?=
 =?utf-8?B?YkcvL0h4NFZLVWF3Q0U5V09nU3MxR25NbVdlbS9TNE0zeHhBbG0zTldQOWUr?=
 =?utf-8?B?UVRacDdFb3k5U29LZlQzUDF5VUhZVkxUR0I4Z0ZBWFVJQzRtWVgvTHJTRU5T?=
 =?utf-8?B?azB2Ny9ySVphZkt3V204RW5OekRwUDJYMENsNytHR2hEMjRTMFNXTHQrK2Fx?=
 =?utf-8?B?TWVKcnZ2R3llMjVNZHZmc0xtNFlCYll4SlBTSkIwTXdXSDVjQlpBRzBVK2hs?=
 =?utf-8?B?RU1BSHlscm1uczY2aStEL0NjUlFIVmkvVnA0MEY0am56WUJPZ0tRQT09?=
X-Exchange-RoutingPolicyChecked: ojXsuTpkLF+D7N7drDspgtZct7532XbV2bbwmw5dKN5YuTl1BVOtFpo47mJ5mtBwnk1WVpuQfyJdQaYglTsSebQdJOjFxdiouIjFEPLLv0vOsmPpeIPaUI+UX7Xd39Yeb6kZhlYggaZLbTQ3D66Us5xZp8ZqRi/tgSu3jusPhe+bCnaJ0YmURx80gbXop2A2IOVdzyKtG3VsTRMaFM6aA/lQFUIc5t6PiNGVkadOK/0vjHOEV5Dm4W1YwnsKvifq0ED1z6MdVaA003B91VJFr2Sd9CRZ758PhMYwq8ucQ4NjDtLcDOluWjQlUlszDC/bg+KSZKe0deFg5yzoYXomDg==
X-MS-Exchange-CrossTenant-Network-Message-Id: bd4d91c9-50f4-4d47-5c0c-08df35952480
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 08:17:59.2322 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7rDTqFz2xuaK9b9pq+dKKjtN+PNp8Oms1bhWyR0/S9L1w/frlOLY11tLDem+l/WtO7pXmVsnfM23gHMLuYp49A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8200
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


On 29-10-2026 12:06, Mallesh, Koujalagi wrote:
>
> On 26-10-2026 07:38 pm, Tauro, Riana wrote:
>>
>> On 26-10-2026 16:19, Upadhyay, Tejas wrote:
>>>
>>>> -----Original Message-----
>>>> From: Tauro, Riana <riana.tauro@intel.com>
>>>> Sent: 26 October 2026 11:35
>>>> To: intel-xe@lists.freedesktop.org
>>>> Cc: Tauro, Riana <riana.tauro@intel.com>; Gupta, Anshuman
>>>> <anshuman.gupta@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>;
>>>> aravind.iddamsetty@linux.intel.com; Nilawar, Badal
>>>> <badal.nilawar@intel.com>; Jadav, Raag <raag.jadav@intel.com>;
>>>> Koppuravuri, Ravi Kishore <ravi.kishore.koppuravuri@intel.com>; 
>>>> Koujalagi,
>>>> Mallesh <mallesh.koujalagi@intel.com>; Upadhyay, Tejas
>>>> <tejas.upadhyay@intel.com>
>>>> Subject: [PATCH v2 4/9] drm/xe/xe_hw_error: Handle non-fatal errors 
>>>> routed
>>>> via direct IRQ
>>>>
>>>> Process, log and recover non-fatal errors routed via direct IRQ.
>>>> Double-bit ecc errors belong to non-fatal error category and are 
>>>> reported via
>>>> irq. For pages that belong to critical BO, wedge the device with 
>>>> bus-reset as
>>>> the recovery action.
>>>>
>>>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>>>> ---
>>>>   drivers/gpu/drm/xe/xe_hw_error.c | 37
>>>> ++++++++++++++++++++++++++++----
>>>>   drivers/gpu/drm/xe/xe_ras.c      |  9 +++++++-
>>>>   2 files changed, 41 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_hw_error.c
>>>> b/drivers/gpu/drm/xe/xe_hw_error.c
>>>> index f7799c3c08aa..269ce6a19a80 100644
>>>> --- a/drivers/gpu/drm/xe/xe_hw_error.c
>>>> +++ b/drivers/gpu/drm/xe/xe_hw_error.c
>>>> @@ -5,6 +5,8 @@
>>>>
>>>>   #include <linux/bitmap.h>
>>>>
>>>> +#include <generated/xe_device_wa_oob.h>
>>>> +
>>>>   #include "regs/xe_gsc_regs.h"
>>>>   #include "regs/xe_hw_error_regs.h"
>>>>   #include "regs/xe_irq_regs.h"
>>>> @@ -15,7 +17,9 @@
>>>>   #include "xe_hw_error.h"
>>>>   #include "xe_mmio.h"
>>>>   #include "xe_pm.h"
>>>> +#include "xe_ras.h"
>>>>   #include "xe_survivability_mode.h"
>>>> +#include "xe_wa.h"
>>>>
>>>>   #define GT_HW_ERROR_MAX_ERR_BITS        16
>>>>   #define HEC_UNCORR_FW_ERR_BITS            4
>>>> @@ -166,12 +170,36 @@
>>>> static_assert(ARRAY_SIZE(pvc_master_local_nonfatal_err_reg) ==
>>>> XE_RAS_REG_SIZE);
>>>>
>>>> pvc_master_local_fatal_err_reg : \
>>>>
>>>> pvc_master_local_nonfatal_err_reg)
>>>>
>>>> +static const char *hw_err_to_str(const enum hardware_error hw_err) {
>>>> +    switch (hw_err) {
>>>> +    case HARDWARE_ERROR_CORRECTABLE:
>>>> +        return "Correctable";
>>>> +    case HARDWARE_ERROR_NONFATAL:
>>>> +        return "Non-Fatal";
>>>> +    case HARDWARE_ERROR_FATAL:
>>>> +        return "Fatal";
>>>> +    default:
>>>> +        return "Unknown";
>>>> +    }
>>>> +}
>>>> +
>>>>   static void hw_error_work(struct work_struct *work)  {
>>>>       struct xe_tile *tile = container_of(work, typeof(*tile),
>>>> hw_error_work.work);
>>>>       struct xe_device *xe = tile_to_xe(tile);
>>>>
>>>>       guard(xe_pm_runtime)(xe);
>>>> +
>>>> +    if (xe->info.has_sysctrl && XE_DEVICE_WA(xe, 14028434957)) {
>>> I think you should have all these in 1 patch for 14028434957
>>
>> I can combine 3 and 4.  If i combine all usages, it would be 
>> difficult to review.
>>
>> Thanks
>> Riana
>>
>>>
>>> Tejas
>>>> +        /* If the device is in reset in AER path, skip processing
>>>> hardware errors */
>>>> +        if (xe_device_is_in_reset(xe))
>>>> +            return;
>>>> +
>>>> +        xe_ras_process_errors(xe);
>>>> +        return;
>>>> +    }
>>>> +
>>>>       xe_survivability_mode_runtime_enable(xe);
>>>>   }
>>>>
>>>> @@ -433,12 +461,13 @@ static void hw_error_source_handler(struct 
>>>> xe_tile
>>>> *tile, const enum hardware_er
>>>>           return;
>>>>
>>>>       /*
>>>> -     * Hardware errors are reported through System Controller on the
>>>> platforms that
>>>> -     * support it, and never routed as direct IRQ to SGUnit. So we 
>>>> should
>>>> never be
>>>> -     * here for those platforms.
>>>> +     * Non fatal errors are routed as a direct IRQ on platforms 
>>>> that support
>>>> +     * system controller.
>>>>        */
>>>>       if (xe->info.has_sysctrl) {
>>>> -        drm_err_ratelimited(&xe->drm, HW_ERR "Invalid error
>>>> routing\n");
>>>> +        drm_err_ratelimited(&xe->drm, HW_ERR "%s %s reported\n",
>>>> hw_err_to_str(hw_err),
>>>> +                    severity_str);
>>>> +        schedule_delayed_work(&tile->hw_error_work,
>>>> +msecs_to_jiffies(MSEC_PER_SEC));
>
> hmm, why we are scheduling hw_error_work worker after 1 sec, if we get 
> AER before and after 1 sec, what is impact?

Its a best case scenario that if there is a non-fatal error which is 
accompanied with a fatal at the same time. We will wait
for AER to get triggered to avoid unnecessary handling of non-fatal errors.
  It is not guaranteed that we will see a AER in 1sec because even that 
is a worker.

If we get AER when irq handling is in progress, it will wait for it to 
complete before triggering a reset,

After 1sec is a same as normal scenario of irq followed by AER

Thanks
Riana

>
> Thanks,
>
> -/Mallesh
>
>>>>           return;
>>>>       }
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_ras.c 
>>>> b/drivers/gpu/drm/xe/xe_ras.c index
>>>> db3cbc186a51..e6a0ee468b17 100644
>>>> --- a/drivers/gpu/drm/xe/xe_ras.c
>>>> +++ b/drivers/gpu/drm/xe/xe_ras.c
>>>> @@ -628,8 +628,15 @@ static u8 handle_device_memory_errors(struct
>>>> xe_device *xe, struct xe_ras_error_
>>>>           break;
>>>>       case XE_RAS_MEMORY_DB_ECC:
>>>>           ret = handle_page_offline(xe, info->sw_address, true);
>>>> -        if (ret)
>>>> +        /*
>>>> +         * Double-bit ECC errors are non-fatal errors and are 
>>>> reported
>>>> via IRQ.
>>>> +         * Wedge the device with a bus reset for errors that require
>>>> SBR to recover.
>>>> +         * TODO: Trigger SBR using pci_reset_bus
>>>> +         */
>>>> +        if (ret) {
>>>> +            xe_wedge_declare(xe,
>>>> DRM_WEDGE_RECOVERY_BUS_RESET);
>>>>               return XE_RAS_RECOVERY_ACTION_RESET;
>>>> +        }
>>>>           break;
>>>>       default:
>>>>           return XE_RAS_RECOVERY_ACTION_RESET;
>>>> -- 
>>>> 2.47.1

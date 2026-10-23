Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D40BD606A326
	for <intel-xe@archiver.kernel.org>; Fri, 23 Oct 2026 06:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GXa5NFH6
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C4DA10E529;
	Fri, 23 Oct 2026 06:16:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F53910E4D8
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Oct 2026 06:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792736203; x=1824272203;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=y7F7KhupXH2JDMiguMd4+9eD7Zmhp/i7gVUr4mgXfvQ=;
 b=GXa5NFH6dZqr+HiPjdSQri+llOgQikAZw/p4ynNlKK/pxL/BmU3QsNEE
 plvNN6TlROeYCmNoEF/jfF6gCC7v13TfRxQFuNVCNfnGAFSDCvRBoneVb
 VpARvKIEpMm8RcHl/h9t/oUX2R0UkFb+Rc75qKJZw8CpQAcoZXJaoA0LI
 wBgDAJEHtFNjHM1eSOUKNhDWzCA5SOoFZ7jx7EHIyKtzSapgKrj/chMAK
 gkKQW2Wop2usZEF2iJdDnClYtmVzDzo44gxheOlnydyjZIRS1UykaXlDd
 pUqX6/nPopRUEQY89MLmongtBs34+s9C+4AUX4EO0VJpUAkASV9JZH6yZ g==;
X-CSE-ConnectionGUID: ft2KTajpQLubq+8mGp6A6Q==
X-CSE-MsgGUID: g+OZ9YKSQpGKSiuDZmOq6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="1387080"
X-IronPort-AV: E=Sophos;i="6.27,173,1787036400"; 
   d="scan'208";a="1387080"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 23:16:42 -0700
X-CSE-ConnectionGUID: 8CX2mr8HSBaOKiRrxBDV8Q==
X-CSE-MsgGUID: yOcwbjbATNKy3j5RtNY8Qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,173,1787036400"; 
   d="scan'208";a="3437126"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 23:16:42 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 22 Oct 2026 23:16:41 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 22 Oct 2026 23:16:41 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.19) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 22 Oct 2026 23:16:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Biog03bhHRGwt+3+t/+129JsEs+EPMLAqMqJ3aU2F+S38+lbCMAQYl2Ikq82vkPj6sxq6wVae1P7itoKpt0vGdDcBUJB/3KJIVWlLSh2yWUJXWINCJ631etDEAU71+Xe3cYNBPEBxvIvPnD3uDtLvhhiQocphYMKAf5wc9C5YNxKKZmtWY7nN0nuOyobeXmJjUHFs/hVx+kRJ9utZdRKGXHUGS4JYF0FcH4lpDsFV2mW7dBe958SYpQNtLl/bbsooYTVVpZwNc1wJG3hzMDroHtGAMGPaF9mYrTCicuR5n7mAdWSAdFxnVPsv+2HPTWPsWpZM5ZYETFWJYPcIGEmkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DKhVT+NyCxx1P35AWC4A8VITS5u/2YvfKtkeS9SpIo4=;
 b=gbT58qwO1GikBI0F6cu9Fzl9rSnH6gidPdsGv0T1hSsXUEdnWVTsVWeBrMbursGMJsMzCBxA1ioFRHr667cV1m38wUB8biH3n/0iO5wzjdYNW9SS7PecWuKszuJz9MUPzjZdcMJJtQ0gFYzyiGo0qv8rnf+3kZun0luzAZbXAbBVNfbseRGCSUjgUbwx1DRWQ0WRh0O7MRQLE2Fh51em1pw8+lzz50yXqVvuxYKvLVv9Dv4UpoSiqvHH1VpTRKRKRQHKnmpoH15W1vxmJY8zEfCHQT8o/1z0rGNFYFbMrRSCPVMOFxNFDcOxx3LzAtTDa7uTmIP1E8B1Ov7mV9Ml7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by SA0PR11MB4734.namprd11.prod.outlook.com (2603:10b6:806:99::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.19; Fri, 23 Oct
 2026 06:16:39 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%4]) with mapi id 15.21.0546.017; Fri, 23 Oct 2026
 06:16:38 +0000
Message-ID: <854d747f-88f9-40dc-b4d0-d801b3225a6b@intel.com>
Date: Fri, 23 Oct 2026 11:46:29 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 09/13] drm/xe/xe_ras: Report soc internal errors using
 SIGID
To: Badal Nilawar <badal.nilawar@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <daniele.ceraolospurio@intel.com>, <raag.jadav@intel.com>,
 <riana.tauro@intel.com>, <aravind.iddamsetty@intel.com>,
 <himal.prasad.ghimiray@intel.com>, <arvind.yadav@intel.com>,
 <syed.abdul.muqthyar.ahmed@intel.com>, <nitin.r.gote@intel.com>
References: <20261023043422.681260-15-badal.nilawar@intel.com>
 <20261023043422.681260-24-badal.nilawar@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20261023043422.681260-24-badal.nilawar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0161.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ba::12) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|SA0PR11MB4734:EE_
X-MS-Office365-Filtering-Correlation-Id: 070e36b8-0737-4ba9-b32a-08df30cd3290
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|4143699003|11063799006|56012099006|22082099003|18002099003|10067099003|261022113327099003|261022105027099003|261021123027099003|261021121427099003|261009223027099003|261009223327099003|261009221227099003|261009221727099003|261009220027099003;
X-Microsoft-Antispam-Message-Info: O1B2AOsWc1OLDTVsAdnqXBBWRaxui87VMV+z6PEk/IG0cUTTH5z0cKDnNxRjPoNHR2fGBzbm7Ld5TJDnZXCSzvJL4CjhT2gPB6Y/MTQv7qNPLyRx7hRfHD6JM9ddFl+6brTzETHicSeqds0Wf9K7LDOufiDtNnyNSmej5OWubnPe+tQDVVVvnkOs9e/FHiWC4A5SQpapt1oOd4XndGUH+jab5wSmcprTQKKSmg00RUpDMSLO9aJ7ZIaYMtEG32k5yQQaHIWxw9JzDO7HkJXB1RW7lxmL/wNgPFgj+34C4gWYRZHEeq8zwtC0221HlvzYvx8qwXF61xNMkytkT2Bx2xoCdNbu8j/XhDtMjN5Jie9E5n3q4QP0ZaULkCMcV9qF7+7rYCNmll378x/Z9lo7hMqvQVmzSGHxaA3mg9WLdA1kguGHHChmGk4DLQruHjYNnv3VEE/sMAuqAJb5VQeHYREX02SBIhucoLHkKLIGqX9Uf7MDuL+e4XTagmD6zi2+mIUl9DaCjLPTeRDUsjerKIqhUvjjRGuU0FxNls8ImIdxNXFyk07GqPG8EbDxZ8a1R59oX82QWPNfjYbtxUYfp7hR4MddvwDEHFuGtRRJkP1+CJi96zwWqmKE8RNrrnFVqYTicpgRES6fSxfZT3L3lmXZIRYsQ1wdIDa7dyexPV8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003)(10067099003)(261022113327099003)(261022105027099003)(261021123027099003)(261021121427099003)(261009223027099003)(261009223327099003)(261009221227099003)(261009221727099003)(261009220027099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R2lFWG41NzVPTGNkNWpFSWQ3Q2Y2K1dtbFpUcnJ6NE81ZVVMa3lhaGM1eHU2?=
 =?utf-8?B?SFR0WXNMR3hmSU5OaXdnKzNUejVZcjQwVTd1NzNXRTVnSUpOTmIwdzcraDNi?=
 =?utf-8?B?TEp5R1VDcWx4Zmx5NFZYVzdzdERwZ0Vva0xXWGg1UnM0MmY5bk8zSXZnTHpw?=
 =?utf-8?B?VFlJRTVqWDUza3R2TU01MFdGSUp5Z2t6Nmdtek1ubURxZ01jMS9VOHRZOC9Q?=
 =?utf-8?B?d0IrR2wzaXRwcGV2NlphOXY5SVB6dUhLNFZVdU9pVkNmRHZHQmk0K0dQU1RH?=
 =?utf-8?B?d0t2ZnF1ckFXODRlS2E2VWNVRG9jUVBnOE1BMkpIcXhoc1JmTjZDUktjUkVT?=
 =?utf-8?B?eDh6QXE4TXRHZzBrbGhWcEtuRmdsbDNRNU9pREhJS0FNcWJPaHZEMG5BRkor?=
 =?utf-8?B?Zkc3VDB3VHY5TFBZczMzR2tlYVk1UFpsd1ZOVFJtTkZqWGNVR0pUTW13MjFp?=
 =?utf-8?B?amNpUzEwdFRQR2xSMVcvcEZQbTZtMnNic25FZWxMaVBxaXNvT1YyNTN0SXdk?=
 =?utf-8?B?K0VQVU8weU9Ud3ZlcFpWUEQraFpTUFoybHBadDJQb1dBeTI1VGNZSzY4QldD?=
 =?utf-8?B?RmFFeHN6VFljMUFoYU5xcCtLa0RUeFZ0N2t4S1VWMHp3b1hOQU8xU1pvZWQ1?=
 =?utf-8?B?RWQ3UXhTNWE5VEY0d3pmalhKcEttYWNnRWExTHY1QjlOQ0xicmtJSFNpdnlJ?=
 =?utf-8?B?TDRUSkkxcFM3N3BDRHlmbm1lWi9mYVk5b2lvWlgvYU1QMk02clo0V0pNblA3?=
 =?utf-8?B?WDVjencydURySC85VGt2Z0VkQ3hMUGtJeGRNU2lrYUVEL2MrdCt0R2NNMUhp?=
 =?utf-8?B?VUczbHR3SkxuS0pWdnRha2FJS3RvNmozNXlZTW1jbWxuaWdQaFBiRnlURkUx?=
 =?utf-8?B?SGdnVFdtRFI1YmxaUG5DeGw4U1NCaVYrRmVJK3BEVzd0dFJiSDVnbGxwQlBU?=
 =?utf-8?B?U2ZDNTA5QXZzdG9DSnZWWGxkWHV0OTZURUxPL0t0dFg3VHhxUlhoejhGU3hY?=
 =?utf-8?B?QjBRaHN2WG1SUXlobUN5V0Jna3F6MDN5YWo5VUsvMDQyZ295MGFldUtHOUtn?=
 =?utf-8?B?VHRXNjNIcHNRY0VtZUFMK0VPLzZZVnN2c1kyUThXZ2RyYlU4cUVWcXl0dndl?=
 =?utf-8?B?SkZ3ZzlldGFvQWxzTVlSM09rQTd0VGFHaVBxMkNFd3BzaWRKcEJrRXo4TkhD?=
 =?utf-8?B?cEt2NDlEdFJkdmw5aXVEaXV2M0F6U3pjRDc0NDBoREVFSWZ4UU45UWg1R08x?=
 =?utf-8?B?VXdHV2kwZjZJS2FsNmlueFhQTncySVZadThZRlEweVJGbzYzS0VRQTRlTnl6?=
 =?utf-8?B?bVF0Qm9lc3lrRTJrR1poT1Nnc0xnZXJrOWNrQVBJMjVTeVZjZVZkcVAzdkFN?=
 =?utf-8?B?em01eFQ4azBzVFVIOEpjK21Yc1NCL0tDK09SNDVUeFlNV1ZHNUFsWmliYzEx?=
 =?utf-8?B?RTU4dnUrN3QyMzZTZ01xY29PT2x1WTY3NitsTzF0M2l2QVA0T3FTbXRzYjRm?=
 =?utf-8?B?bC9lbUhjV29KZmdvUDdnanZrOXFYT3kzYjM1a0pURmVWYlFoUHV4VTJCQ2dE?=
 =?utf-8?B?KzZwNXRjT21JOVlZZk1WYUprblBRanpqUjlkYWoveU13SkMwQ1NFbkFNMmhk?=
 =?utf-8?B?SUp1ZUtFVjEvTW1Ua1Y0QWNjQ0prd3h6Q2hrV242QzR6a3dWZDdYSFBsc1hR?=
 =?utf-8?B?YU9KVHV0MTc1b09rTEtxaEJrdDVtRXMrTG9hWURJSm5CNEVtNTdCUkVFcTVx?=
 =?utf-8?B?RWpCbHJKVHExL1FmaXc5c0FNRXpUTjBlYVpUMXp2RDNNcEpMVS9uclBPZ1Np?=
 =?utf-8?B?Kzg1RVBVakdPUEwxazNRZC9HbTlsZmFNcTJwOHRBNXN0T1BuMlFJMlFYek5L?=
 =?utf-8?B?UER1MEsrRDZVZ0xJdmtNTkF3WndwQjJWN1UvR3JKa0lhYkFXMXBMRmYyS1JQ?=
 =?utf-8?B?c1gvTGhYdEtaT1VLYndjOThLTXlqMkhqbzE0L3M0V3VDTXFJV25QemI4dVlR?=
 =?utf-8?B?L3ZGS01qL0xYQ1lnWEtsSk14SSs2RVpxUkNMVkpnaytHZ0dhRFhNUFQ2Y3F6?=
 =?utf-8?B?WW56MmdnL2JtbTZ0Z0VkS2hRMml3R2xxV1ZuSTBvTEMxNGM3WWtmVlo1Ukl3?=
 =?utf-8?B?R2lKSWFITkFWeEFsaTB1WGhpaVZhZThmTkF0Mm13cFVwNDJObFlkeTlIUWtG?=
 =?utf-8?B?RSsxbnZJaVlMSFpZK1lGM1JUVUZ0Y1VIR0FScmMvTEJwRFJrMmY5dlk1b3Bk?=
 =?utf-8?B?TnZzR2R4UkJyMVk3WFl5RlJVbmY5NWROcHFCVGh4TWtMR0JOdndGQ1BsQXJH?=
 =?utf-8?B?bmFHVG43TVFNRlVxSDZhRkQvU0VvdVMzUXhKNGxmZi9EeVJhQ1VyTkRtdnpn?=
 =?utf-8?Q?P0UxxtuzZDc3p2kw=3D?=
X-Exchange-RoutingPolicyChecked: O7vEOKjV7+2X45bDnailiZcKQ3DOSEVujNV0cThHZUHIEYUzMMWFgm1VkXgb9CcRr0hwubnLx1YMPao1Xbsv0TC3Egk3uNAoQrXgQ7xV923qbZ3OlpKuFm+fu4cv3tyvLPUDz4UCVFC81FRFy3DB0rdZFp1q6rNT4uDKwl2HszhHqRZl+r444gOgbIdHnxz8N2O0v+F6zV47MpAc12XvmvcHNL2BaoDSBPti5biv0IQmCt69khhgdFYbp3V1fHivwqW/571pcDkbiCCrwU2qMtdM/+DtJ7Rz92ksGWgNQXNa2XW3HLX2e8sfeNn/NYTCtSRmkcyQ9i9GYTAI/vbHzA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 070e36b8-0737-4ba9-b32a-08df30cd3290
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 06:16:38.7858 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /dRee9vh/qPlvucX6uHVCvNCgtE1iwyhQaSVBeUubxVEHU5jzQB9NLMpCpBQoR7BFZLoysGwJgwFJHvxtW+0x6+/xgFR/WWap6viegcKgjw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4734
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
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 23-10-2026 10:04 am, Badal Nilawar wrote:
> Use xe_log_* helpers to report soc internal errors.
>
> Example:
> 	xe 0000:03:00.0: [drm] *ERROR* SIGID=205 FATAL
> (020600700000000000000000) [Hardware Error]: SOC_INTERNAL:
> PUNIT error detected: 0x00000002
>
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
LGTM,
Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> Cc: Riana Tauro <riana.tauro@intel.com>
> ---
> v5:
>    - Log unknown soc internal errors
> ---
>   drivers/gpu/drm/xe/xe_ras.c | 16 +++++++++-------
>   1 file changed, 9 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index 1f94dd1fb91b..4408fc530900 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -608,7 +608,6 @@ static u8 handle_soc_internal_errors(struct xe_device *xe, struct xe_ras_error_a
>   {
>   	struct xe_ras_soc_error *info = (void *)arr->details;
>   	struct xe_ras_soc_error_source *source = &info->source;
> -	struct xe_ras_error_class *counter = &arr->counter;
>   
>   	if (source->csc) {
>   		struct xe_ras_csc_error *csc_error = (void *)info->details;
> @@ -622,9 +621,8 @@ static u8 handle_soc_internal_errors(struct xe_device *xe, struct xe_ras_error_a
>   		 * is required.
>   		 */
>   		if (csc_error->hec_fw_error) {
> -			xe_err(xe, "[RAS]: CSC %s detected: 0x%x\n",
> -			       sev_to_str(counter->common.severity),
> -			       csc_error->hec_fw_error);
> +			xe_log_comp_fatal(xe, SOC_INTERNAL, &arr->counter, sizeof(arr->counter),
> +					  "CSC error detected: 0x%08x\n", csc_error->hec_fw_error);
>   			xe_survivability_mode_runtime_enable(xe);
>   			return XE_RAS_RECOVERY_ACTION_DISCONNECT;
>   		}
> @@ -632,15 +630,19 @@ static u8 handle_soc_internal_errors(struct xe_device *xe, struct xe_ras_error_a
>   		struct xe_ras_ieh_error *ieh_error = (void *)info->details;
>   
>   		if (ieh_error->global_error_status & XE_RAS_SOC_IEH_PUNIT) {
> -			xe_err(xe, "[RAS]: PUNIT %s detected: 0x%x\n",
> -			       sev_to_str(counter->common.severity),
> -			       ieh_error->global_error_status);
> +			xe_log_comp_fatal(xe, SOC_INTERNAL, &arr->counter, sizeof(arr->counter),
> +					  "PUNIT error detected: 0x%08x\n",
> +					  ieh_error->global_error_status);
>   			punit_error_handler(xe);
>   			return XE_RAS_RECOVERY_ACTION_DISCONNECT;
>   		}
>   	}
>   
>   	/* For other SoC internal errors, request a reset as recovery mechanism */
> +	xe_log_comp(xe, ras_sev_to_cper_sev(arr->counter.common.severity), SOC_INTERNAL,
> +		    &arr->counter, sizeof(arr->counter),
> +		    "Unknown error detected (csc=%u ieh=%u)\n",
> +		    source->csc, source->ieh);
>   	return XE_RAS_RECOVERY_ACTION_RESET;
>   }
>   

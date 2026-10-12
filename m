Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B59A5CA9ED0
	for <intel-xe@archiver.kernel.org>; Mon, 12 Oct 2026 23:08:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C21810E69C;
	Mon, 12 Oct 2026 23:08:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B020510E69C
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Oct 2026 23:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791846487; x=1823382487;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=vzZOUKANWBi4DOoSOewfovoERoWBS5Z3FKAzBQLMIiQ=;
 b=Jqg6o/7DaPb+eQWoTTwUEaxv7u5qFwDfvyCkqLn146bzoDiHz26ds3/g
 OpH8mQ4KwqVdmXZ+uIrugcUU/mjnY7eap7dBr5x7EOaZ0VMad7eOUQPa9
 RQAU5BtDmWQQpVpWKAP9bW/l/h9xmJ5S07cbCo0x14YK7ew+xXfWmUmIa
 aqia8Py8PYboGtFxCxg9hXL38Xe/bUQY03EtQJsmMEgh+7OXcNT1jzBk2
 V3Sr+MhHUxeR+3iRjaRc09b2CwoLaaxiwofmlq17VAelXC0ufLzTDXjHy
 HPQqYm8rFTOnkcSW5k+TyIJIAAmoqmLLXxV32j4T5MiyWl1sM0rfd1uUt w==;
X-CSE-ConnectionGUID: BJwbHVQTTsqbzTZA4LJ8pQ==
X-CSE-MsgGUID: VZqfqYEERKSCEZAcFgfTDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="453662"
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="453662"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 16:08:07 -0700
X-CSE-ConnectionGUID: fFln6hThSV2AOnwDUjq3Iw==
X-CSE-MsgGUID: wpEaCoD1TPmmetyYRydDIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="967883"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 16:08:06 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 12 Oct 2026 16:08:05 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 12 Oct 2026 16:08:05 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.54) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 12 Oct 2026 16:08:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sTZUw9IbQbrq+qh7ILe4WdNvlsEsTNEmCuMXfqI906fzGqT82s8FRySRUxqVWqOmGPdwJ6V5OQ28JssLQki5aWLuvdpLZ1cynNUB2W3OoM5h5z8l/paqO49nffD5/CQ2fbf06fTeMgENFh2+28VZBt8eDG9zk+0HOdOVjmDYIMsUAhokib1pgzNFaDZUMAb5gq9Ysw7RT6Ikz74Dy/+h6OnzSJKFeuycuP9QnzTYqJd9QD6wSpjJ1w5Ae0wyRY43tT/s6VZAsZxZlOJq9wMEfv3Ow2T1pzZG4w1tmSYClnE3C0qH6nbLSi5zC63xHGLV/tVAtWFof2C9fc2Ej7gAjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WaTLRESs57+rY8nXvqZaxfcLJk3Auz3KOS6R115Dfio=;
 b=xHUZRvzAmtXOQdR3QqaWo5yOhiIwIXLZXUvLRJIwpJptAw4Rd6zuHk/lm3kurMPENuEoYZGIN6lMWXsw8iZBmtGkQpMUdJIw+eSj0ba3bDdgiW7DrmCTdYOHphM5AVWLUWDzFAtcV6ompxjL2ZH6Q7ARkItGJa4kBnv+kffS2xPKaaxvTYPr596puqZ4rpiBOs5K/KVjzf3A4mZKyMjn4qSUzv70s/5BRfiOs55le5WCHKeMT503rRDd7gN+eZKR3rgSRWUZZlWXhOSCZoSOmfOXzOEUJ9rx0+c4KniUk1oU7zh/lZp7wJsRqnV79r/6zgXqNzi4gOnJCXwSCOoiIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by DS7PR11MB8808.namprd11.prod.outlook.com (2603:10b6:8:257::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Mon, 12 Oct
 2026 23:08:00 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%6]) with mapi id 15.21.0472.015; Mon, 12 Oct 2026
 23:08:00 +0000
Date: Mon, 12 Oct 2026 16:07:57 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <michal.wajdeczko@intel.com>,
 <aravind.iddamsetty@intel.com>, <mallesh.koujalagi@intel.com>,
 <alan.previn.teres.alexis@intel.com>, <julia.filipchuk@intel.com>
Subject: Re: [PATCH v6 4/7] drm/xe/guc: Cleanup error codes and handling for
 CT errors
Message-ID: <as1oTcTay3FiC0Jr@soc-5CG1426VCC.clients.intel.com>
References: <20260922231758.2695562-9-umesh.nerlige.ramappa@intel.com>
 <20260922231758.2695562-13-umesh.nerlige.ramappa@intel.com>
 <99616b68-6ecd-4853-9a99-4e4e03f04f6b@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <99616b68-6ecd-4853-9a99-4e4e03f04f6b@intel.com>
X-ClientProxiedBy: MW4PR03CA0353.namprd03.prod.outlook.com
 (2603:10b6:303:dc::28) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|DS7PR11MB8808:EE_
X-MS-Office365-Filtering-Correlation-Id: 194c742a-9e6a-461e-12bb-08df28b5a91c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|376014|366016|56012099006|5023799004|11063799006|4143699003|261009223027099003|10067099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: ESljOlLJTEQ6LeQ2Cc8qfcNR11bCIgjCQBJX77EFNRSYPkyIJHpWrM63kidOaRS74ppfiY26om/2AJlfYdBFQBNGMICtPEKVIRJMdCYgoB4bDb6MG03FSnVLIpkMCG9p2RJIXtYYLWVDi3CZ8CQeWrLNBSyWwTaAAXgiVH1070HV15czuEn0EAkigPCMc8up/wArHjxBmMKw+UVVGjNf/gKi7n09xMinHqDIrgSWOmcdzCnIU/15aRmx14dbi9IMCcH0Xc5fmD7RprGj7tnvsep1tmGevvEymt2lYZQOPu9ztugoCWD9aYarTIgMJzRilv4qKFyaWElQgylntLIWvNVzGd4oi3edqCVAiJ5zYPwGGcR4NILe7xJlfgGn7ZFvKn1DxXEw47XubJ/brQkBjZTC6c5Nn5gPjoKufQazW2UAEDXyO4t3e3TCFFzslBV2H66SounIw1CGAlqB02cvUWloZSCaJZXCFd9LcPg2BaiKUIQfLQbtH38253QFfWdVfcBmI9uqXfjCrWCVf/6JuDOgaiGXp32S8SzNiAPU9CiJI6ZG7mrbpkwe9Sobsamcbt5UVqJZSxER1hIgwbFoAe06YCAPXcsbzsM57BzCf7oTBe6ewmEkhvjf49BzQsYZQoxETzH1uEkqc3W9Nwg7UejeYCdy8lLXBWFQVrI0KRQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(56012099006)(5023799004)(11063799006)(4143699003)(261009223027099003)(10067099003)(18002099003)(22082099003)(6133799003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RjJsVEJDc0VzbHJ6Qkh2QlFNYkdFSmlGYlhQb1cyNmNYZFZtZjhQMm9jS1NT?=
 =?utf-8?B?Z2ZMR2xQSEFCUm9kSU1XdmlEemRpUkR0R1VoaWg4NC8zajhMc2ROQ0NwSzZL?=
 =?utf-8?B?NUZMU3d2eis0aGRSUWszNHVOZWd0NGpac1pyWUx1V0Z3NTdTRTUrNkVwSDh3?=
 =?utf-8?B?MlFrTzNTMU4wQ3BGOGlMQUZ1VUgrdlVRRFpUbkhKaEZiUmFXU2FPOEhSMEZy?=
 =?utf-8?B?SWoyRjdzOXdiRUxCazlOTHphSWszb05zcGhpWFZxRW1hWHEycGphV2VXQmY4?=
 =?utf-8?B?dndJZzMzRzlKUmhsRGphSFZZbG5mR3lJQVd5WlVIbUNDVTFmK0QyNEJVOFJD?=
 =?utf-8?B?eUxkY3o3b2V6eEE1Snlsb1AwY0QzdHdMdDZLNThTcjNvYlY2MEYzekFkUDNt?=
 =?utf-8?B?UjMvQWlXUHVSUG44eXl3RzJDQk56aVI2cUs3Y3dFQnJaaE4wM2tzVlZDN3dC?=
 =?utf-8?B?d3VrMjFmSm5RRFczbEhMSlJaaXRyRzJRZW1LaXJnVDFRTWNkRG5iSEY3R0E0?=
 =?utf-8?B?OGdheU0xa2xidW9RbHFoL2xjenRucENYbld3K1VJMTNndGVHcEpNRm00d2t3?=
 =?utf-8?B?elY2MThGRHVMUkljd1dqNVdobjloUHRRaWh2L3dUNzNhT1NMQmdQLzFXV2M4?=
 =?utf-8?B?dDZGZ3F1dUtDRGRwWmc5WkVBbFhTSUhhRFVtbDUwSm9DaDFBZEtzTUVqTDRG?=
 =?utf-8?B?VERsek5vbHZNQlEvL2xLa29EN1NaZk1BM0oyenRRZGxvNmk0V2NCc1RNY0Z6?=
 =?utf-8?B?QytUWTRCbXlpOWFicSs2alZZOW03QXlURlFXZ0NLaXBYYi96M3kvUTE1dnlE?=
 =?utf-8?B?MHI2NTdyRXNZOVhLSE5VdytBMTBBaUNOaEF0Uko5eVZjbDhNRUE3enFNOW9p?=
 =?utf-8?B?ZVBUS2ZDZG1vRUpkRmc0NjFZTmZzOHZLZkFWT1NxL0h3S25ZUGtMa0JlYW5C?=
 =?utf-8?B?VTMxdjZMWW8zMExQcUMvb3dHTEs3YVFqcjBrTENyNUF5azI2NXdUTnlXZFY5?=
 =?utf-8?B?aTYyZVRqSkpBNlJIM0krcDJQbFoxa0V6MmpkWFV2VFV3UDZjNmtHZERzbHRU?=
 =?utf-8?B?RWd5N1UrM3REV2MwMkdqMjdOcXovYnQ4WXp1ZDViRlkrQTlDNXdZcnFISUZE?=
 =?utf-8?B?QWprZGdOODdTOFF0WVRUN3lTMU04SkRKaEM0bDlxdm5qa0FCWDkyeFNsRHhm?=
 =?utf-8?B?ZjBmLy9wZ04xQnR1ZTZEYkZUV2NVRDlETWR6WDFhTEx0Q3phRVZtSm51aGUy?=
 =?utf-8?B?eW40bG13cUI4ckRZM3dKN0tQN0NKb1VKRUE0WFlIVDNVdUhnOWY4c1ZpbXUx?=
 =?utf-8?B?V21DUysyaEozQnA3R0R1MXptSHpQZVRlZERZUUNTbXdhTitscCt0MVV5Y3Ni?=
 =?utf-8?B?QnlKN3haYzV5NlZndlArYmxJSVVkekV1R2t4RGtZNVJzSk84a1paR2xldjBR?=
 =?utf-8?B?MDJpc3hBY1RPWGpXM3J2eVFzaDQvdzB4bzBSWWNDTG5xVFpVR2VEWUh4YXlY?=
 =?utf-8?B?OVJjQUVqNjB5R1lzRjVoYzdzb0V4L1NBc2tiNkRpZ1UvQmJkYnUyYVErSUlN?=
 =?utf-8?B?VFRkZW1XbWxIcDRUWFQ3VjBoYmZlRnF0RWEwNzlnMXg5bW42RVBmczlIWmx1?=
 =?utf-8?B?RXpuQXpiV3NVbXZzMjRnNkVRdzZaeGY5RDZXeE4rQXdPRGZJUjBQQXozQzFQ?=
 =?utf-8?B?M0R1SGJQSUR5aDEzRnBKMWMrN20zRkJYdU5LWDJCUkc4WldtRWNMZjNmUUhJ?=
 =?utf-8?B?bVpscDBoRE5LVjJuUXE3T2wxK2FrMWVFK1hydUhJdGpHVTdiUTVRUS80SFF5?=
 =?utf-8?B?N29wQ0lmdHdKSFhCcmt2MUIvdnNud29Yb3pMTzUwQUpoTE5HMWQ4VnBBVTZY?=
 =?utf-8?B?NUxzaEovR3kzQVQ2L3BZUzJ6Z3pLcTIvWXBPSjAwQ000WmhhMzJDVmVBdmgz?=
 =?utf-8?B?U1U4N2ZtYjg0cVB1V2ZiV1VQNm0xaUFrMDhoUVp0b0xXQzNKOVo4WWtxT0Qy?=
 =?utf-8?B?NEFLa0tEanRBQTJrZ3dCeGZqM2FpRVBOOFJzVSt5Qm1IMW9qeUJIVUpqUUNp?=
 =?utf-8?B?VXdsWkRiYklxMm96OU5oWnBIK3J0emdCNURjNnErZWhSM3JJdjhzVFBlbGE5?=
 =?utf-8?B?WVp6K1RzS1VSMmE2bDkrYmNKL1FTQ3lVcFhyaklPVGR4RFpNR0NNekN1c1h2?=
 =?utf-8?B?aG9JTHlON1A4THVjS08yZVhFS05BZEIzZlNLYVoreDEvNHBDMFJmQ0RROCtU?=
 =?utf-8?B?VHcyVUExRU44UjYxUUVwNWRocW1pcFpFNC94SW1Rb2VWMDlUR1VQdCtOTmtn?=
 =?utf-8?B?YlJDbHFGRXJ6NERMWTN2dGRIY0Ira2E0ckpoS2NoQUdyaCtYMXpuUFpSMGFk?=
 =?utf-8?Q?1KuPo/hseoHlPkeQ=3D?=
X-Exchange-RoutingPolicyChecked: QupZ/QFHKbaOwA2okCYnQzp59+JeQdbc27Dcs1/AGUgtlASSJG2VwRG46tPEJabJ4dfYmCNDb3SfFbT1s1qAZp5a98SiYUzmDzVJbh48cH+FpQxZq+VxIWaytmWrMFCLQgXYU17hH+WNQIsjT9RZsxUpn+3WIwpsIZkixJY3i/zPluNToCDkCi6n7YQf6v0tM+TxcXbgNj2mkBwfiuZ5JXsD0+xhNDCOzVKg+poglGZwY3rgVBfsdoGgFWX7ooN6JGbVzlVLYzwywPnVBzS6wfsfbghR3GGLwZnUo8LvEZFTV4G00QzN0xo2++0O7hNKYR7JiR1Trus+h38NP027dQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 194c742a-9e6a-461e-12bb-08df28b5a91c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 23:08:00.3488 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bTW46SPvfEQqazdgUqUg0E/kfpdRyzRLovrVvju26x3f5NleiXzu8sTzMeczVepygmsAwVtcHfvZ5iVFqEiM6SpHlW9Iat5NAsZgPo0u4lM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB8808
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

On Thu, Oct 08, 2026 at 03:17:12PM -0700, Daniele Ceraolo Spurio wrote:
>
>
>On 9/22/2026 4:18 PM, Umesh Nerlige Ramappa wrote:
>>Instead of always returning -EPROTO for most errors, use different error
>>codes based on the error type. -EPROTO is retained for the cases that
>>are genuine protocol violations by the GuC.  The remaining cases now
>>report what actually went wrong.
>>
>>A CTB that has been flagged broken reports -ECONNABORTED rather than
>>-EPERM. These errors are not contained within the driver: they reach
>>userspace verbatim through the gt freq sysfs knobs (min_freq_store() ->
>>xe_guc_pc_set_min_freq() -> xe_guc_ct_send()) and through the VFIO
>>SR-IOV migration callbacks (xe_sriov_vfio_suspend_device() ->
>>xe_sriov_pf_control_pause_vf() -> xe_guc_ct_send_block()). -EPERM reads
>>as a privilege failure, so a user who hits a broken CT is told
>>"Operation not permitted" and retries as root to no effect. Worse,
>>xe_sriov_vfio.c already returns -EPERM for its own "not a PF" check,
>>so the two are indistinguishable to migration tooling.
>>-ECONNABORTED ("Software caused connection abort") says what actually
>>happened: the driver aborted the channel after detecting corruption.
>>
>>Note that -ECONNABORTED must stay distinct from -EPIPE. -EPIPE means
>>corruption was detected now and transitions the CTB to broken, which
>>g2h_err_is_fatal() classifies as fatal; -ECONNABORTED means the CTB was
>>already broken and is benign. Merging them would make receive_g2h()
>>re-declare the CT dead and re-kick a reset on every dequeue iteration.
>>
>>receive_g2h() used to escalate to CT_DEAD + kick_reset() by matching the
>>two error codes that dequeue_one_g2h() could return on a fatal error.
>>Invert the check to simplify reset handling.
>>
>>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>>Assisted-by: Claude:claude-opus-5
>>---
>>v2: (Michal)
>>- Sync order of errors in g2h_read and __guc_ct_send_locked
>>- For CT errors use EPIPE and for HXG errors use EPROTO
>>- Convert the non-fatal EPIPE to EPERM in the helper
>>
>>v3: (Michal)
>>- s/EPIPE/EPERM/ in __guc_ct_send_locked
>>- Add ct_corrupted helper
>>- Add error documentation
>>- Remove "reset required" string from logs
>>
>>v4: (Sashiko)
>>- s/EPIPE/EPERM/ in retry_failure and xe_guc_ct_send doc
>>
>>v5: (claude-opus-5)
>>- Revert reodering of error checks in send path (claude-opus-5)
>>   When broken is set to true (CT_DEAD) and reset is in progress
>>   (kick_reset), we have a broken + STOPPED state. A no_fail send will
>>   bail out with the reordering instead of retrying in 5s. Hence retain
>>   earlier behavior.
>>- Update error DOC
>>
>>v6:
>>- s/EPERM/ECONNABORTED/ for the broken CTB state, since EPERM reaches
>>   userspace via sysfs and VFIO and reads as a privilege error
>>---
>>  drivers/gpu/drm/xe/xe_guc_ct.c | 217 +++++++++++++++++++++++++--------
>>  1 file changed, 169 insertions(+), 48 deletions(-)
>>
>>diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
>>index 9d9bb3028d52..8ba39e4241da 100644
>>--- a/drivers/gpu/drm/xe/xe_guc_ct.c
>>+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>>@@ -37,6 +37,98 @@
>>  #include "xe_sriov_vf.h"
>>  #include "xe_trace_guc.h"
>>+/**
>>+ * DOC: GuC CT Error Codes
>>+ *
>>+ * Every failure below that takes the CT down - i.e. one that runs CT_DEAD() -
>>+ * is reported with xe_log_err(), so it is tagged with the GUC component and
>>+ * carries the error code in a structured SIGID entry. Failures that are simply
>>+ * returned to a caller are left for that caller to report, if it needs to.
>
>This paragraph about xe_log_err is not true until patch 7, so I'd move 
>it there.
>
>>+ *
>>+ * Send path - xe_guc_ct_send(), xe_guc_ct_send_locked(), h2g_write()
>>+ * ------------------------------------------------------------------
>>+ *
>>+ * Channel-state rejections - the message was never queued, nothing is corrupt:
>>+ *
>>+ * ``-ENOTRECOVERABLE``: the device is wedged. No CT traffic can make progress
>>+ *   until the device is recovered.
>>+ * ``-ECONNABORTED``: the H2G CTB was flagged broken by an earlier corruption
>>+ *   check, so the driver aborted the channel. It stays unusable until the CT is
>>+ *   restarted, which clears the flag.
>>+ * ``-ENODEV``: the CT channel is disabled. Don't retry until it is enabled.
>>+ * ``-ECANCELED``: the CT channel is stopped or a GT recovery is pending, so the
>>+ *   message was dropped. Often benign; retry after the reset/recovery completes.
>>+ *
>>+ * Internal flow control - never seen by callers, handled by the send helpers:
>>+ *
>>+ * ``-EBUSY``: not enough H2G room or G2H credits. Triggers a flush, a wait and
>>+ *   a retry.
>>+ * ``-EAGAIN``: the message would wrap the H2G ring, so the tail was NOP-filled
>>+ *   and reset to 0. The write is reissued immediately.
>>+ *
>>+ * Hard failures:
>>+ *
>>+ * ``-EPIPE``: H2G descriptor corruption found before writing - non-zero status,
>>+ *   or head/tail out of range. Marks the CTB broken.
>>+ * ``-EDEADLK``: H2G credits never recovered after waiting ~1s. An async GT reset
>>+ *   is requested before this is returned.
>>+ * ``-EPROTO``: the MMIO CT enable/disable handshake got an unexpected reply.
>>+ * ``-ENOMEM``: internal allocation failure (fence lookup under GFP_ATOMIC, or the
>>+ *   G2H workqueue at init). The blocking path retries the allocation with
>>+ *   GFP_KERNEL.
>>+ *
>>+ * Blocking send only (xe_guc_ct_send_recv()) - the H2G went out, the reply is the
>>+ * problem:
>>+ *
>>+ * ``-ETIME``: no G2H response within 1s, even after flushing the G2H worker.
>>+ * ``-EIO``: the GuC replied RESPONSE_FAILURE; error and hint codes are logged.
>>+ * ``-ELOOP``: the GuC kept replying NO_RESPONSE_RETRY until the request hit
>>+ *   GUC_SEND_RETRY_LIMIT. (NO_RESPONSE_BUSY is not an error - the waiter re-arms.)
>>+ * ``-ECANCELED``: the pending fence was canceled while waiting, because the CT
>>+ *   was stopped underneath the waiter. Retry after the reset completes.
>>+ * ``-ENOTRECOVERABLE``: same as above, but the device got wedged in the
>>+ *   meantime, so there is nothing to retry.
>>+ *
>>+ * Receive path - g2h_read(), parse_g2h_msg(), dequeue_one_g2h()
>>+ * -------------------------------------------------------------
>>+ *
>>+ * Channel-state rejections - the same four codes as the send path, checked against
>>+ * the G2H CTB. g2h_err_is_fatal() treats exactly these as benign; anything else
>>+ * declares the CT dead and kicks a reset:
>>+ *
>>+ * ``-ENOTRECOVERABLE``: device wedged.
>>+ * ``-ENODEV``: CT disabled.
>>+ * ``-ECANCELED``: CT stopped.
>>+ * ``-ECONNABORTED``: G2H CTB already flagged broken.
>>+ *
>>+ * Hard failures:
>>+ *
>>+ * ``-EPIPE``: G2H descriptor corruption - non-zero status, head/tail out of
>>+ *   range, or a declared message length larger than the data actually available.
>>+ * ``-EPROTO``: HXG protocol violation. Either the G2H origin field is not the
>>+ *   GuC, or a FAST_REQUEST H2G came back rejected. FAST_REQUEST fences aren't
>>+ *   tracked, so there is no caller to report to and the failure is escalated to a
>>+ *   reset instead.
>>+ * ``-EOPNOTSUPP``: G2H carried an HXG type this driver does not handle.
>>+ *
>>+ * Reported but not returned
>>+ * -------------------------
>>+ *
>>+ * These never reach a caller: they are detected in a void path or in a G2H
>>+ * handler whose return value is swallowed. They are reported and the CT is
>>+ * declared dead, which is the only escalation available:
>>+ *
>>+ * ``-EHOSTDOWN``: the GuC sent a crash dump or an exception notification, i.e.
>>+ *   the firmware itself died. A reset is kicked to reload it.
>>+ * ``-ETOOMANYREFS``: G2H credit accounting went wrong - a release would push
>>+ *   the free space past the usable size of the CTB, or there was no outstanding
>>+ *   G2H to release. Indicates a driver-side bookkeeping bug, not a GuC one.
>>+ * Any error from a G2H action handler: the handler for a given G2H failed while
>>+ *   processing it. The code is whatever the handler returned and is reported
>>+ *   along with the action and the raw message, from both the worker
>>+ *   (process_g2h_msg()) and the IRQ fast path (g2h_fast_path()).
>>+ */
>>+
>>  static void receive_g2h(struct xe_guc_ct *ct);
>>  static void g2h_worker_func(struct work_struct *w);
>>  static void safe_mode_worker_func(struct work_struct *w);
>>@@ -929,6 +1021,23 @@ static bool vf_action_can_safely_fail(struct xe_device *xe, u32 action)
>>  		 action == XE_GUC_ACTION_REGISTER_CONTEXT);
>>  }
>>+static int ct_corrupted(struct xe_guc_ct *ct, struct guc_ctb *ctb,
>>+			u32 reason_code, const char *msg, ...)
>>+{
>>+	struct va_format vaf;
>>+	va_list va_args;
>>+	int err = -EPIPE;
>
>nit: the err variable is only used for "return err" and AFAICS this 
>doesn't change in future patches, so you could just do "return 
>-EPIPE".
>
>>+
>>+	va_start(va_args, msg);
>>+	vaf.fmt = msg;
>>+	vaf.va  = &va_args;
>>+	xe_gt_err(ct_to_gt(ct), "GUC: CT: %pV", &vaf);
>>+	va_end(va_args);
>>+
>>+	ct_dead_capture(ct, ctb, reason_code);
>>+	return err;
>>+}
>>+
>>  #define H2G_CT_HEADERS (GUC_CTB_HDR_LEN + 1) /* one DW CTB header and one DW HxG header */
>>  static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
>>@@ -953,23 +1062,22 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
>>  		u32 desc_status;
>>  		desc_status = desc_read(xe, h2g, status);
>>-		if (desc_status) {
>>-			xe_gt_err(gt, "CT write: non-zero status: %u\n", desc_status);
>>-			goto corrupted;
>>-		}
>>+		if (desc_status)
>>+			return ct_corrupted(ct,  &ct->ctbs.h2g, ct_id(H2G_WRITE),
>
>&ct->ctbs.h2g is already avilable in the local h2g variable, so you 
>could use that
>
>>+					    "write: non-zero status: %u\n", desc_status);
>>  		if (tail > h2g->info.size) {
>>  			desc_write(xe, h2g, status, desc_status | GUC_CTB_STATUS_OVERFLOW);
>>-			xe_gt_err(gt, "CT write: tail out of range: %u vs %u\n",
>>-				  tail, h2g->info.size);
>>-			goto corrupted;
>>+			return ct_corrupted(ct,  &ct->ctbs.h2g, ct_id(H2G_WRITE),
>>+					    "write: tail out of range: %u vs %u\n",
>>+					    tail, h2g->info.size);
>>  		}
>>  		if (desc_head >= h2g->info.size) {
>>  			desc_write(xe, h2g, status, desc_status | GUC_CTB_STATUS_OVERFLOW);
>>-			xe_gt_err(gt, "CT write: invalid head offset %u >= %u)\n",
>>-				  desc_head, h2g->info.size);
>>-			goto corrupted;
>>+			return ct_corrupted(ct,  &ct->ctbs.h2g, ct_id(H2G_WRITE),
>>+					    "write: invalid head offset %u >= %u)\n",
>>+					    desc_head, h2g->info.size);
>>  		}
>>  	}
>>@@ -1034,10 +1142,6 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
>>  				     desc_read(xe, h2g, head), h2g->info.tail);
>>  	return 0;
>>-
>>-corrupted:
>>-	CT_DEAD(ct, &ct->ctbs.h2g, H2G_WRITE);
>>-	return -EPIPE;
>>  }
>>  static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
>>@@ -1061,7 +1165,7 @@ static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
>>  	}
>>  	if (unlikely(ct->ctbs.h2g.info.broken)) {
>>-		ret = -EPIPE;
>>+		ret = -ECONNABORTED;
>>  		goto out;
>>  	}
>>@@ -1213,7 +1317,7 @@ static int guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
>>  	return ret;
>>  broken:
>>-	xe_gt_err(gt, "No forward process on H2G, reset required\n");
>>+	xe_gt_err(gt, "No forward progress on H2G\n");
>>  	CT_DEAD(ct, &ct->ctbs.h2g, DEADLOCK);
>>  	return -EDEADLK;
>>@@ -1246,8 +1350,9 @@ static int guc_ct_send(struct xe_guc_ct *ct, const u32 *action, u32 len,
>>   *
>>   * * -ENOTRECOVERABLE: the xe device is wedged. Stop submitting new GuC work; the
>>   *   request cannot make progress until the device is recovered.
>>- * * -EPIPE: the H2G CTB is marked broken. The channel stays unusable until the
>>- *   CT is restarted, which clears the broken flag.
>
>Isn't -EPIPE still a valid code here? coming all the way back from 
>h2g_write.

Hmm, yes. EPIPE is still valid error. I will add that.

Umesh
>
>>+ * * -ECONNABORTED: the H2G CTB is marked broken, so the driver aborted the
>>+ *   channel. It stays unusable until the CT is restarted, which clears the
>>+ *   broken flag.
>>   * * -ENODEV: the CT channel is disabled, messages not expected in this state.
>>   *   Don't retry until it is enabled again.
>>   * * -ECANCELED: the CT channel is stopped or a GT recovery is pending; the
>>@@ -1358,7 +1463,8 @@ int xe_guc_ct_send_g2h_handler(struct xe_guc_ct *ct, const u32 *action, u32 len)
>>   */
>>  static bool retry_failure(struct xe_guc_ct *ct, int ret)
>>  {
>>-	if (!(ret == -EDEADLK || ret == -EPIPE || ret == -ENODEV))
>>+	if (!(ret == -EDEADLK || ret == -EPIPE || ret == -ECONNABORTED ||
>>+	      ret == -ENODEV))
>>  		return false;
>>  #define ct_alive(ct)	\
>>@@ -1663,8 +1769,7 @@ static int parse_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
>>  	origin = FIELD_GET(GUC_HXG_MSG_0_ORIGIN, hxg[0]);
>>  	if (unlikely(origin != GUC_HXG_ORIGIN_GUC)) {
>>-		xe_gt_err(gt, "G2H channel broken on read, origin=%u, reset required\n",
>>-			  origin);
>>+		xe_gt_err(gt, "Invalid G2H origin=%u\n", origin);
>>  		CT_DEAD(ct, &ct->ctbs.g2h, PARSE_G2H_ORIGIN);
>>  		return -EPROTO;
>>@@ -1682,8 +1787,7 @@ static int parse_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
>>  		ret = parse_g2h_response(ct, msg, len);
>>  		break;
>>  	default:
>>-		xe_gt_err(gt, "G2H channel broken on read, type=%u, reset required\n",
>>-			  type);
>>+		xe_gt_err(gt, "Unexpected G2H message type=%u\n", type);
>>  		CT_DEAD(ct, &ct->ctbs.g2h, PARSE_G2H_TYPE);
>>  		ret = -EOPNOTSUPP;
>>@@ -1804,6 +1908,7 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
>>  	xe_gt_assert(gt, xe_guc_ct_initialized(ct));
>>  	lockdep_assert_held(&ct->fast_lock);
>>+	/* Keep in sync with g2h_err_is_fatal() */
>>  	if (xe_device_wedged(xe))
>>  		return -ENOTRECOVERABLE;
>>@@ -1814,7 +1919,7 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
>>  		return -ECANCELED;
>>  	if (g2h->info.broken)
>>-		return -EPIPE;
>>+		return -ECONNABORTED;
>>  	xe_gt_assert(gt, xe_guc_ct_enabled(ct));
>>@@ -1830,10 +1935,9 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
>>  			desc_status &= ~GUC_CTB_STATUS_DISABLED;
>>  		}
>>-		if (desc_status) {
>>-			xe_gt_err(gt, "CT read: non-zero status: %u\n", desc_status);
>>-			goto corrupted;
>>-		}
>>+		if (desc_status)
>>+			return ct_corrupted(ct,  &ct->ctbs.g2h, ct_id(G2H_READ),
>
>Here as well you already have &ct->ctbs.g2h in a local g2h variable.
>
>>+					    "read: non-zero status: %u\n", desc_status);
>>  	}
>>  	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG)) {
>>@@ -1854,24 +1958,24 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
>>  		 *
>>  		if (g2h->info.head != desc_head) {
>>  			desc_write(xe, g2h, status, desc_status | GUC_CTB_STATUS_MISMATCH);
>>-			xe_gt_err(gt, "CT read: head was modified %u != %u\n",
>>-				  desc_head, g2h->info.head);
>>-			goto corrupted;
>>+			return ct_corrupted(ct,  &ct->ctbs.g2h, ct_id(G2H_READ),
>>+					    "read: head was modified %u != %u\n",
>>+					    desc_head, g2h->info.head);
>>  		}
>>  		 */
>>  		if (g2h->info.head > g2h->info.size) {
>>  			desc_write(xe, g2h, status, desc_status | GUC_CTB_STATUS_OVERFLOW);
>>-			xe_gt_err(gt, "CT read: head out of range: %u vs %u\n",
>>-				  g2h->info.head, g2h->info.size);
>>-			goto corrupted;
>>+			return ct_corrupted(ct,  &ct->ctbs.g2h, ct_id(G2H_READ),
>>+					    "read: head out of range: %u vs %u\n",
>>+					    g2h->info.head, g2h->info.size);
>>  		}
>>  		if (desc_tail >= g2h->info.size) {
>>  			desc_write(xe, g2h, status, desc_status | GUC_CTB_STATUS_OVERFLOW);
>>-			xe_gt_err(gt, "CT read: invalid tail offset %u >= %u)\n",
>>-				  desc_tail, g2h->info.size);
>>-			goto corrupted;
>>+			return ct_corrupted(ct,  &ct->ctbs.g2h, ct_id(G2H_READ),
>>+					    "read: invalid tail offset %u >= %u)\n",
>>+					    desc_tail, g2h->info.size);
>>  		}
>>  	}
>>@@ -1888,11 +1992,10 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
>>  	xe_map_memcpy_from(xe, msg, &g2h->cmds, sizeof(u32) * g2h->info.head,
>>  			   sizeof(u32));
>>  	len = FIELD_GET(GUC_CTB_MSG_0_NUM_DWORDS, msg[0]) + GUC_CTB_MSG_MIN_LEN;
>>-	if (len > avail) {
>>-		xe_gt_err(gt, "G2H channel broken on read, avail=%d, len=%d, reset required\n",
>>-			  avail, len);
>>-		goto corrupted;
>>-	}
>>+	if (len > avail)
>>+		return ct_corrupted(ct,  &ct->ctbs.g2h, ct_id(G2H_READ),
>>+				    "G2H channel broken on read, avail=%d, len=%d\n",
>>+				    avail, len);
>>  	head = (g2h->info.head + 1) % g2h->info.size;
>>  	avail = len - 1;
>>@@ -1938,10 +2041,6 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
>>  			     action, len, g2h->info.head, tail);
>>  	return len;
>>-
>>-corrupted:
>>-	CT_DEAD(ct, &ct->ctbs.g2h, G2H_READ);
>>-	return -EPROTO;
>>  }
>>  static void g2h_fast_path(struct xe_guc_ct *ct, u32 *msg, u32 len)
>>@@ -2033,6 +2132,27 @@ static int dequeue_one_g2h(struct xe_guc_ct *ct)
>>  	return 1;
>>  }
>>+/*
>>+ * Errors reported by dequeue_one_g2h() come in two flavours: either the channel
>>+ * is simply not available right now, which is expected and handled gracefully,
>>+ * or the channel state or the message itself is inconsistent, in which case the
>>+ * only way forward is to declare the CT dead and reset the GuC. Since the
>>+ * former is a short and well known list, check against that and treat anything
>>+ * else as fatal, so that new error codes don't silently escape the escalation.
>>+ */
>>+static bool g2h_err_is_fatal(int err)
>>+{
>>+	switch (err) {
>>+	case -ENOTRECOVERABLE:	/* device wedged */
>>+	case -ENODEV:		/* CT disabled */
>>+	case -ECANCELED:	/* CT stopped */
>>+	case -ECONNABORTED:	/* CT already declared broken */
>>+		return false;
>>+	default:
>>+		return true;
>>+	}
>>+}
>
>Unless I'm missing something, if we call ct_corrupted from g2h_read 
>that would call ct_dead_capture immediately but also escalate an 
>-EPIPE error, which would be considered fatal here leading to a second 
>call to ct_dead_capture(). However, we do want to have kick_reset() 
>called here in that case, so from that POV -EPIPE is indeed a fatal 
>error. Maybe we just keep the double call to ct_dead_capture for 
>-EPIPE, since it shouldn't have any adverse consequences? This also 
>seems to be an existing behavior, because the current g2h_read code 
>returns -EPROTO which is similarly considered fatal.
>
>On a side note, process_g2h_msg() always returns 0 even when there is 
>an error and CT_DEAD is called, so kick_reset is never called in that 
>scenario. This seems to be on purpose because the crash handlers 
>explicitly call kick_reset and return zero, but I am not sure that all 
>handlers are correctly coded for that. Something to double-check after 
>this series has landed.
>
>Daniele
>
>>+
>>  static void receive_g2h(struct xe_guc_ct *ct)
>>  {
>>  	bool ongoing;
>>@@ -2070,8 +2190,9 @@ static void receive_g2h(struct xe_guc_ct *ct)
>>  		ret = dequeue_one_g2h(ct);
>>  		mutex_unlock(&ct->lock);
>>-		if (unlikely(ret == -EPROTO || ret == -EOPNOTSUPP)) {
>>-			xe_gt_err(ct_to_gt(ct), "CT dequeue failed: %d\n", ret);
>>+		if (unlikely(ret < 0 && g2h_err_is_fatal(ret))) {
>>+			xe_gt_err(ct_to_gt(ct), "CT dequeue failed, forcing GT reset(%pe)\n",
>>+				  ERR_PTR(ret));
>>  			CT_DEAD(ct, NULL, G2H_RECV);
>>  			kick_reset(ct);
>>  		}
>

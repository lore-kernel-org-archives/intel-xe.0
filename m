Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85709606A31A
	for <intel-xe@archiver.kernel.org>; Thu, 29 Oct 2026 11:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MJ4qOyO1
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ACA010E7E7;
	Thu, 29 Oct 2026 11:34:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B82B10E7E7
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Oct 2026 11:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793273690; x=1824809690;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=CGlD+VLXEM+ZiCwV8hRZDXGIQKDM+4lH9px9bZM3sJQ=;
 b=MJ4qOyO1qDMIamO04uCNrI8TbzD1dZCDgN8Oj68I2rzV5+oAjUxnqR27
 utj7bIchcQxjGMxB8M843AkYKVz+Xm5gDXKUgFOsGvsqWjv1jhntkFu4X
 Nz7vCyLV1Kd3PM2nz+LgOABtX8hvpkCyKfwFq4TCg7NgWXJBUFwzJji2o
 sGwtfuE6GsAhTyARsca2kzrGAYqFkbIKNsg4tpFhzyBIElp8U8mq0SMIz
 lNoisjpT2DAQsgXIbOIBl0dvFegsIXtOOcI4yzAOTIZPHsFbmL3lSTYuv
 ZYiQOKioaKrGHcARofSTrsIrt+JaHi0VxeWlqR2H1PnEba/0h9ZcLwXMx w==;
X-CSE-ConnectionGUID: lvXyWYYsTwWdg0FUvwaUpA==
X-CSE-MsgGUID: kDlB5UPbQK2r9MhE8r9Ibg==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="2018368"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="2018368"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 04:34:49 -0700
X-CSE-ConnectionGUID: Y0C4pepFSIC/ut0spCqMIw==
X-CSE-MsgGUID: QPi6Cv1ES5y3JPMydrmstA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="5131308"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 04:34:49 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 29 Oct 2026 04:34:48 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 29 Oct 2026 04:34:48 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.5) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 29 Oct 2026 04:34:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fvP/ewfmMZszWUdHQgrk192Rc2ELPY41MqULDwkNA3k5/uBcv0Wd2U5QgHV5TtT7oJn9MfO7c8em1pk7X0ucS142FxqHPsSNCKkClZYf6gfHfss3Vbm6VjOQB5rkQrVqOndB9ZB53KdQsxSyZx6IdascSkqkQe7jJjECSszt3LxB7g9E7F/VJEKx3ktv8xJLAzP3NM34eGWDHkoPDR7wZvrKV8XCCZvh7cW/QEHdGZ1ROjYgl/yBe0FmegY2u+OhBr6AQNh9xQCKqd3gf7RkYomVYm1L+Z+vVK50MUKziT1pobZ1LuhECk+vRE7eN9eke01beNxLDvgPE3e6wCcIIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D6ySKXJUhuRr8tI0jDgKApkn8+mWce1uHcZp1upxNXI=;
 b=LApjb69rBAOwZ297Ao2B5YythuU/QQZ8KgmtZ/HuU1F4/3XyD/s/V76FWI7v6kS/8CCjdvJHDAUmCq2q9FFJt6QjRDbBiIABegJfnwk2fTGQfbUaiL/NTLMRaBZm6ehV9Sfe8gNaED1chVlqpuitVbMA147rNC7xQ8TGxAEkmVT0J2EVxRtC1u1BB5cJtKP3geOiSqwN5MU2SovnKZJTNovfCq59NNrAGKV7Vg1TZzqF/dWY8rXPAjjjBH9ncOtqGYANuJBa3YpridXqCoq5Uzs5FFf0IEGwX2MLVP4YumMESSIJdOHrdPtm4gH0V7Y1rRlk0D3LKakkmC2uRWwm2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB8856.namprd11.prod.outlook.com (2603:10b6:8:253::22)
 by IA3PR11MB126088.namprd11.prod.outlook.com (2603:10b6:208:54b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Thu, 29 Oct
 2026 11:34:41 +0000
Received: from DS7PR11MB8856.namprd11.prod.outlook.com
 ([fe80::6613:5e2:a45:1111]) by DS7PR11MB8856.namprd11.prod.outlook.com
 ([fe80::6613:5e2:a45:1111%4]) with mapi id 15.21.0546.012; Thu, 29 Oct 2026
 11:34:41 +0000
Message-ID: <c652ebce-4e73-483c-8b5d-82dcaf453d7a@intel.com>
Date: Thu, 29 Oct 2026 17:04:31 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/9] drm/xe/hwmon: initialize fan-control backend and
 table cache
To: "Purkait, Soham" <soham.purkait@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <rodrigo.vivi@intel.com>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>, <riana.tauro@intel.com>,
 <sk.anirban@intel.com>, <mallesh.koujalagi@intel.com>,
 <ravi.kishore.koppuravuri@intel.com>
References: <20261015190751.1268916-1-karthik.poosa@intel.com>
 <20261015190751.1268916-2-karthik.poosa@intel.com>
 <244e9d47-794d-4290-9bdf-d6c83a6f0fbe@intel.com>
Content-Language: en-US
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <244e9d47-794d-4290-9bdf-d6c83a6f0fbe@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0005.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::22) To DS7PR11MB8856.namprd11.prod.outlook.com
 (2603:10b6:8:253::22)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB8856:EE_|IA3PR11MB126088:EE_
X-MS-Office365-Filtering-Correlation-Id: 523366ae-a3fb-4a64-1abd-08df35b09f1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|261028144727099003|4143699003|56012099006|11063799006|261022105027099003|261009223027099003|261026121527099003|261026140227099003|261022113327099003|261022075727099003|261021121427099003|10067099003|261021123027099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: 2TPvlMvZImPm5D7K4CCSHFTskf1nSZmstdI8EUVBL/nV5M3/yYDdpSzNkRWuwCqa7DF3KCizNQAgaAvakkcQlzlFT1OBwMXqP1FDsToidZAeizG+F9Y0vC0ds40lGY3X3GydgaJsd3B6ygCM++U985jvEEQ0F9QfEpU+uLeilvMPr2PmXXhkc/6ZpJYjqaflHdInWlvoEOs0+fL2B/94q85d9cQd+Mw5qtte25F3v52Qf2ygzpF6AXD6QRIHiqaOyUkq+ePAQ/ziEH6FZZ9wJkRIAWl25rsy1c/fTfGDxAA8Qgro145hgIFVtTKV065cGxXbkBRDJKmmPXAetM29rhisFkT2KQANtyIH+raODMzvW0x0YV82RxSlB9bQJTBX/poMFR9keT5QmppBkMmX6cx5162cQTlo5Zhyh2C6Wx583qwuOxUtgtnfAIhYsHFnhcyziTg3pVGzclk16RgRwQS0YSuF/TwnkiXm8ebG06Da9cwbltAJb6TLdGFaE/B4uttWd0uRDEEMBdLF4eEBUGe4BEndgjVdIFFPiJB4fXfp1dAc9lOJafJ9hWF/zCEyfNE0JgMGw/ptqRRxgH0eHYADozNR2TtQl8FNhmS/TOueCsSotvmONJFgeSk3mWAJr79tjYdj8bQy+2wPVe0ASXQP1S1OShKUFiv++NQE7mw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB8856.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(261028144727099003)(4143699003)(56012099006)(11063799006)(261022105027099003)(261009223027099003)(261026121527099003)(261026140227099003)(261022113327099003)(261022075727099003)(261021121427099003)(10067099003)(261021123027099003)(22082099003)(18002099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bFdlOU9ZZzJiOWlXazBiMTQzQzVnUStnam1vMTcrOVdCQ1pxVjZIUXBnTFp6?=
 =?utf-8?B?QjdST2pVajhVZUx2NU5CbC9Rai9IQkM5M3NTS2RIck1hb1c4U3N1YVJRdTVu?=
 =?utf-8?B?VGJRdE02U2JTalZEblFJekNRRWZBWlY2SnBRRVZrb1lDOXJnVWhWcEYweHM5?=
 =?utf-8?B?cWxKY1M4UkQ1NFM3VnMyb25CQis1TWtDNjdubllKMjFWWVpvRi95cmVmZzkv?=
 =?utf-8?B?Y2JYY2U5QkJtYjdSa3NNb3lXeEovY2h2WTlESEhzUjBUbktmTnlpQzZXbTNZ?=
 =?utf-8?B?UTRIQ3Q4dVJPUk43dXVGbjJad041alJBbnpXUjJ3d0NNdUFPd3RRMTdKeUtW?=
 =?utf-8?B?UEMrZllQNzkxUk9ZbEZVRm9GbFVGNWN4NU8xc1ZVMkc2ODd3emdTbU5PVUhJ?=
 =?utf-8?B?akJ5L0JOVzdldmJEMWg3UWMrNksrTVVFSzcydlJXZVVxbTdiQWY0bSs0V2wx?=
 =?utf-8?B?WjhFSk1KaUoxa3dQMGtUdFRyRnZBTllKMUphTFBzRXk2Yk91NHM1bkVva3VM?=
 =?utf-8?B?L1RJYVU3dWc0SklNWERaZ0xQNGVqNVIyR1g1ZEpIVkVRMk9xdXFTaVlKbW9H?=
 =?utf-8?B?WnZkODVBZHFWYXdNL3lPTFlUWGxPM3AyM216cG9QRmdSQUgxbkM0bzBsbTE1?=
 =?utf-8?B?SjFKLzdJZ0UwcHVHZ000RlRMQ2wzRUdsamUwZE9NMXBrOTRHZnZ0Z2JuK2JS?=
 =?utf-8?B?UXN3alJ5WVZtT0dGRTg1cTBVclE3Sjd3cTdOR2I2MHJMTnVianQ3Z3V1b0JZ?=
 =?utf-8?B?WWNNYVdXN1M2SmZKTngxL2NKZGJodSsydnJwZWZ1R0RxV3MxcmZybllFM1ls?=
 =?utf-8?B?WXA2b0dXcndmdS9YeUlVTlVZbGJFazNCdHZiNVhxWFY4ajg5aVp3ODE3dkh4?=
 =?utf-8?B?bEtWSkRkc2F3UHErbnMwVGhReGFPZURiNmNaQk9oZ3B6NEZvdFJvTVh1Q3VF?=
 =?utf-8?B?YWZPdVRXd001ZHVJcWE4YVpmUGNvOEJsMUNtaUNqYkRUNStEZGpRUVlpZFhq?=
 =?utf-8?B?ZTVBYzZOSjJvVFFjV2dORUVXVktXRytURVVvcTRJc2VJSExIdkNVKzJOMitt?=
 =?utf-8?B?cCtaeUFaZUdQK292a2V2OXNyazJLVkNKQjdPSVV0ZWIvTTMwY2lxaG9sMy9Y?=
 =?utf-8?B?NWFtcG5kRkJCdEcxcmYvNXJGak5nNTlsT0ZJdTJJSy93bCtCOWRVY1IyZDRR?=
 =?utf-8?B?MXZDdEtGRkkvUWFSeHpvL2tROWxCcEdaVFM1b01Nd01HaFBUVjlMNFRub25O?=
 =?utf-8?B?T3RaSVZSN1J0VmhEcE5tZ1BhUHVRVGpxYTI3NGxaTy9td3lZWVRwaFQwdjVp?=
 =?utf-8?B?STA2Tm1TNVJPN2NBREZHM2RzSVZQeUtoeEI0Y3FwNVA5UHQxMlVzbUNOVjJx?=
 =?utf-8?B?VG1HL3ZmTTFIL1ZxYlAvakNyZ2pNd0RrbFJVUzhhN2hRQk81eUYvNzRvcmlk?=
 =?utf-8?B?K2pMYmxRanF4M29zYkZvRGIyMm5VeG0zckJmUCswNGkxUFJ4RG82WGVyNnEv?=
 =?utf-8?B?ZEhLUk95QVRIUzlxMFFPK0JscFJqckJvQUFZeVlUYS9meGYvR3dZRk1WNC9B?=
 =?utf-8?B?UDRWcTlEN0txejUvT1BGcFRvRkF1ODZQUjV4TWM4aXpOZU1EaUNYZk1HQ1E1?=
 =?utf-8?B?V0FKcU1weHhVTy85YUYwRmtxMDloc2xCSXI4NVFtWk0zS0RPTmtTUm53Q2Fw?=
 =?utf-8?B?UU5SYlpFSlZRNHBmVHhML2J1UGs4cG94cmJoNFJURmxZd3k4N2hXY1NYc0tI?=
 =?utf-8?B?QnRIY3BhNFlIQ0pySXhaU3NVSTI3MlQ4b0NFLzBJZmd0KzFDR1RxMnYrdXRH?=
 =?utf-8?B?RjVrZHJZNjdzTzU0anRhb3VqcmFEVUJQQWZicVd2aXpDOFR6VU1RVmVoR2ZT?=
 =?utf-8?B?Y1VYM0FTWmU2T3FhLzMycTRjK2hHVWRvZ1k3cnBkL05BS3dGVEczOHZyU1M1?=
 =?utf-8?B?eXBqUkZhWTlwQTN0KytDR0tmajVkZjlYOTZiVUcrR2Q5dFF5dXREL2hpU29k?=
 =?utf-8?B?b2l5UE1ZL2Jmc2xiZkYwTXVZZEhzT0tBMVRTV0VzdVptZDF1R3dhVHRDckpB?=
 =?utf-8?B?UE9FV1dZY3RtWW5tTXpPTUpNQjhEUng2a2pmbVhhSHlhL0tZRjAzTXpJWlJE?=
 =?utf-8?B?TmxKd040ZTA4V0JHejBDSFhTbDJ6bWpIc0lVSGFsT0lqMHJiSi9yWGhwK2NF?=
 =?utf-8?B?YzNKTVhJUytJbnYyRk9sc2dNZWNqR3ZvVklJZUxMc2FIbXZWb2ZwWXJjcUM3?=
 =?utf-8?B?WGExSXoyeUFqNWU1TGMxZitCRHkwVWVIc21MMndjWmN4YUVmcmdENDFYM3Jw?=
 =?utf-8?B?eEs3M1VORC9xVmE2Ry9lUUpaRGkvME0wNlpRYzlDTC9iQ3dvNFhxUT09?=
X-Exchange-RoutingPolicyChecked: I6munbgwGN/l06oPyQ/ZTDhDX8DGHcA/wt77vDG2nzqtCKaL6N9r5SUa8DJPBqH7OJHIjnhGWcdftlLsvWxGZCwrRnNOm5qegUG94VZiMRTUy5/ul1C1q7yoY/F7YjurWxsCn1oQYpxD1pv7KLwUqUklIrTp1zCa2jxOax6lPOEIkHuI9bx/dYWfMnZm2JY3b1nnGoFYhqGXy0AXxbWUl8VOjbaH0qWIk/UDQWKshZV4mjDK3+lyV2AuBVIUD7ruapNNpe7XV6M0i86SesKGj67JUnvNyp6RDi9Qmv7Q7dGBxHGF4v4A5jeBgO9vexa/nNfC4zKimlq1j85NmOrrSw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 523366ae-a3fb-4a64-1abd-08df35b09f1c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB8856.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 11:34:41.3787 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o+aR9ERDEdWDmWPgTioGb6ZhhDsQ6xhuYS6/3bjRbIVPT/Pwa9fzzGlYQQt2NuaPmUwRh9UYcvH0FdU4eLVUSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB126088
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


On 29-10-2026 00:16, Purkait, Soham wrote:
>
> Hi Karthik,
>
> On 16-10-2026 00:37, Karthik Poosa wrote:
>> Initialize Xe hwmon fan-control support by detecting fan count,
>> reading stock fan control points and min PWM.
>>
>> v2:
>>   - Avoid user table initialization during probe. (Badal)
>>   - Move unused code to appropriate patches.
>>   - Use xe helpers for dmesg logs.
>>
>> v3:
>>   - Rebase.
>>   - Refine a few debug log messages and comments.
>>   - Update xe_hwmon_read_fan_control_info() to return on any stock table
>>     read failures.
>>   - Avoid returning when num_fans is 0 in
>>     xe_hwmon_get_preregistration_info(), ensuring thermal mailbox
>>     initialization is not skipped.
>>   - Remove XE_PCODE_FAN_CONTROL_TIMEOUT_MS which is unncessary as default
>>     timeout itself is now 10ms.
>>   - Use xe_pcode_read() instead of xe_pcode_read_timeout().
>>   - Rename fan_control_point_count to point_count in struct fan_table.
>>   - Resolve kgdoc warnings.
>>   - Add valid check for stock table fan point count.
>>   - Use the fan-enable bitmap reported by FSC_READ_NUM_FANS when enumerating
>>     fans. This avoids assuming contiguous fan indices and allows masks with
>>     gaps to be represented correctly in the hwmon interface.
>>
>> Signed-off-by: Karthik Poosa<karthik.poosa@intel.com>
>> Assisted-by: LLM
>> ---
>>   drivers/gpu/drm/xe/xe_hwmon.c     | 167 +++++++++++++++++++++++++++---
>>   drivers/gpu/drm/xe/xe_pcode_api.h |   5 +
>>   2 files changed, 157 insertions(+), 15 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
>> index 42acfeb8818c..f2bd20f8b0a2 100644
>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
>> @@ -21,6 +21,7 @@
>>   #include "xe_pcode_api.h"
>>   #include "xe_sriov.h"
>>   #include "xe_pm.h"
>> +#include "xe_printk.h"
>>   #include "xe_vsec.h"
>>   #include "regs/xe_pmt.h"
>>   
>> @@ -137,14 +138,51 @@ struct xe_hwmon_energy_info {
>>   	long accum_energy;
>>   };
>>   
>> +enum fan_table_type {
>> +	/** @STOCK_FAN_TABLE: firmware-provided fan table */
>> +	STOCK_FAN_TABLE,
>> +	/** @USER_FAN_TABLE: user fan table written through sysfs */
>> +	USER_FAN_TABLE,
>> +	/** @FAN_TABLE_MAX: number of fan tables tracked per fan */
>> +	FAN_TABLE_MAX,
>> +};
>> +
>> +/* Check if a fan is enabled based on the fan_enable_mask got from FSC_READ_NUM_FANS. */
>> +#define IS_FAN_ENABLED(fan) (hwmon->fan_enable_mask & BIT(fan))
> If this macro is called from any function having no local variable 
> named hwmon it will break. Should it take hwmon as an argument ?
yes will change this
>> +
>> +/* Maximum number of fan control points supported by each fan. */
>> +#define MAX_FAN_CONTROL_POINTS	(10)
>> +
>> +/* Fan control point index: bit31 selects fan table type; bits30:0 control point index. */
>> +#define FCP_INDEX(FAN_TABLE_TYPE, POINT_NUM) (((FAN_TABLE_TYPE) << 31) | \
> Cast to u32 ? shifting the signed enum into bit 31 could lead to UB.
okay
>> +						((POINT_NUM) & REG_GENMASK(30, 0)))
>> +
>>   /**
>> - * struct xe_hwmon_fan_info - to cache previous fan reading
>> + * struct xe_hwmon_fan_info - cached fan telemetry and control state
>> + *
>> + * Each fan keeps the latest tachometer sampling state along with two fan
>> + * tables: the stock table discovered from firmware and the user table managed
>> + * by hwmon sysfs writes.
>>    */
>>   struct xe_hwmon_fan_info {
>>   	/** @reg_val_prev: previous fan reg val */
>>   	u32 reg_val_prev;
>>   	/** @time_prev: previous timestamp */
>>   	u64 time_prev;
>> +	/** @fan_table: fan control tables */
>> +	struct fan_table {
>> +		/** @point_count: number of fan control points */
>> +		u8 point_count;
>> +		/** @fcp: array of fan control points */
>> +		struct fan_control_point {
>> +			/** @temp: temperature in degree celsius */
>> +			u8 temp;
>> +			/** @speed: fan speed in percentage */
>> +			u8 speed;
>> +		} fcp[MAX_FAN_CONTROL_POINTS];
>> +	} fan_table[FAN_TABLE_MAX];
>> +	/** @min_pwm: minimum fan PWM */
>> +	u32 min_pwm;
>>   };
>>   
>>   /**
>> @@ -193,6 +231,8 @@ struct xe_hwmon {
>>   	int scl_shift_time;
>>   	/** @ei: Energy info for energyN_input */
>>   	struct xe_hwmon_energy_info ei[CHANNEL_MAX];
>> +	/** @fan_enable_mask: bitmask of available fans */
>> +	u32 fan_enable_mask;
>>   	/** @fi: Fan info for fanN_input */
>>   	struct xe_hwmon_fan_info fi[FAN_MAX];
>>   	/** @read_power_limit_from_pcode: pcode accepted power limits write for the channel */
>> @@ -1075,17 +1115,112 @@ static int xe_hwmon_pcode_write_i1(const struct xe_hwmon *hwmon, u32 uval)
>>   			      (uval & POWER_SETUP_I1_DATA_MASK));
>>   }
>>   
>> -static int xe_hwmon_pcode_read_fan_control(const struct xe_hwmon *hwmon, u32 subcmd, u32 *uval)
>> +static int xe_hwmon_pcode_read_fan_control(const struct xe_hwmon *hwmon, u32 subcmd, u8 fan_num,
>> +					   u32 *uval)
>>   {
>>   	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
> Nit: blank line after variable declaration
ok
>> +	return xe_pcode_read(root_tile, PCODE_MBOX(FAN_SPEED_CONTROL, subcmd, fan_num),
>> +				     uval, NULL);
>> +}
>> +
>> +static int xe_hwmon_get_fan_enable_mask(struct xe_hwmon *hwmon)
>> +{
>> +	int ret;
>>   
>>   	/* Platforms that don't return correct value */
>> -	if (hwmon->xe->info.platform == XE_DG2 && subcmd == FSC_READ_NUM_FANS) {
>> -		*uval = 2;
>> +	if (hwmon->xe->info.platform == XE_DG2) {
>> +		hwmon->fan_enable_mask = GENMASK(1, 0);
>>   		return 0;
>>   	}
>>   
>> -	return xe_pcode_read(root_tile, PCODE_MBOX(FAN_SPEED_CONTROL, subcmd, 0), uval, NULL);
>> +	ret = xe_hwmon_pcode_read_fan_control(hwmon, FSC_READ_NUM_FANS, 0,
>> +					      &hwmon->fan_enable_mask);
>> +	if (ret) {
>> +		xe_warn(hwmon->xe, "failed to read number of fans, ret=%d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	/* Check if fan mask exceeds FAN_MAX and log a warning if it does */
>> +	if (hwmon->fan_enable_mask & ~GENMASK(FAN_MAX - 1, 0)) {
>> +		xe_warn(hwmon->xe, "fan enable mask exceeds maximum supported fans\n");
> Reset the mask to 0 so IS_FAN_ENABLED() stays false in case fan mask 
> exceeds FAN_MAX.
how about clamping to FAN_MAX ?
>> +		return -EINVAL;
>> +	}
>> +
>> +	xe_info(hwmon->xe, "Number of fans detected: %u\n",
>> +		hweight32(hwmon->fan_enable_mask));
>> +	return 0;
>> +}
>> +
>> +static int xe_hwmon_read_fan_control_info(struct xe_hwmon *hwmon)
>> +{
>> +	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
>> +	int point;
>> +	int fan;
>> +	int ret;
>> +
>> +	for (fan = 0; fan < FAN_MAX; fan++) {
>> +		u32 stock_fcp_count = 0;
>> +
>> +		struct xe_hwmon_fan_info *fi = &hwmon->fi[fan];
>> +
>> +		if (!IS_FAN_ENABLED(fan))
>> +			continue;
>> +
>> +		ret = xe_hwmon_pcode_read_fan_control(hwmon,
>> +						      FSC_READ_STOCK_FAN_CONTROL_POINTS,
>> +						      fan, &stock_fcp_count);
>> +		if (ret) {
>> +			xe_err(hwmon->xe,
>> +			       "failed to read fan %d stock table point count, ret=%d\n",
>> +			       fan, ret);
> Why not continue for the rest of the fans marking the current one ?
yes we can continue, you want to mark current fan invalid ?
>> +			return ret;
>> +		}
>> +
>> +		if (!stock_fcp_count || stock_fcp_count > MAX_FAN_CONTROL_POINTS) {
>> +			xe_warn(hwmon->xe,
>> +				"fan %d stock table point count %u is invalid\n",
>> +				fan, stock_fcp_count);
> Ditto.
okay
>> +			return -EINVAL;
>> +		}
>> +
>> +		fi->fan_table[STOCK_FAN_TABLE].point_count = stock_fcp_count;
>> +		xe_dbg(hwmon->xe, "fan %d stock table point count is %u\n", fan,
>> +		       fi->fan_table[STOCK_FAN_TABLE].point_count);
>> +
>> +		/* Cache the stock fan table for later use. */
>> +		for (point = 0; point < fi->fan_table[STOCK_FAN_TABLE].point_count;
>> +		     point++) {
>> +			u32 fcp = 0;
>> +
>> +			fcp = FCP_INDEX(STOCK_FAN_TABLE, point);
>
> nit: u32 fcp = FCP_INDEX(STOCK_FAN_TABLE, point);
>
> Regards,
> Soham
ok
>> +			ret = xe_pcode_read(root_tile, PCODE_MBOX(FAN_SPEED_CONTROL,
>> +								  FSC_READ_FAN_TABLE, fan),
>> +					    &fcp, NULL);
>> +			if (ret) {
>> +				xe_err(hwmon->xe, "failed to read fan %d stock point %d, ret=%d\n",
>> +				       fan, point, ret);
>> +				fi->fan_table[STOCK_FAN_TABLE].point_count = 0;
>> +				return ret;
>> +			}
>> +
>> +			fi->fan_table[STOCK_FAN_TABLE].fcp[point].temp =
>> +						REG_FIELD_GET(FAN_CONTROL_POINT_TEMP_MASK, fcp);
>> +			fi->fan_table[STOCK_FAN_TABLE].fcp[point].speed =
>> +						REG_FIELD_GET(FAN_CONTROL_POINT_SPEED_MASK, fcp);
>> +			xe_dbg(hwmon->xe, "fan %d stock point %d: temp %u C, speed %u\n",
>> +			       fan, point, fi->fan_table[STOCK_FAN_TABLE].fcp[point].temp,
>> +			       fi->fan_table[STOCK_FAN_TABLE].fcp[point].speed);
>> +		}
>> +
>> +		/* Read minimum fan PWM */
>> +		ret = xe_hwmon_pcode_read_fan_control(hwmon, FSC_READ_FAN_MIN_PWM, fan,
>> +						      &fi->min_pwm);
>> +		if (ret)
>> +			xe_warn(hwmon->xe, "fan %d min pwm unavailable, ret=%d\n", fan, ret);
>> +		else
>> +			xe_dbg(hwmon->xe, "fan %d min PWM %u\n", fan, fi->min_pwm);
>> +	}
>> +	return 0;
>>   }
>>   
>>   static int xe_hwmon_power_curr_crit_read(struct xe_hwmon *hwmon, int channel,
>> @@ -1615,17 +1750,12 @@ xe_hwmon_energy_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
>>   static umode_t
>>   xe_hwmon_fan_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>>   {
>> -	u32 uval = 0;
>> -
>>   	if (!hwmon->xe->info.has_fan_control)
>>   		return 0;
>>   
>>   	switch (attr) {
>>   	case hwmon_fan_input:
>> -		if (xe_hwmon_pcode_read_fan_control(hwmon, FSC_READ_NUM_FANS, &uval))
>> -			return 0;
>> -
>> -		return channel < uval ? 0444 : 0;
>> +		return IS_FAN_ENABLED(channel) ? 0444 : 0;
>>   	default:
>>   		return 0;
>>   	}
>> @@ -1858,11 +1988,18 @@ xe_hwmon_get_preregistration_info(struct xe_hwmon *hwmon)
>>   		if (xe_hwmon_is_visible(hwmon, hwmon_energy, hwmon_energy_input, channel))
>>   			xe_hwmon_energy_get(hwmon, channel, &energy);
>>   
>> -	/* Initialize 'struct xe_hwmon_fan_info' with initial fan register reading. */
>> -	for (channel = 0; channel < FAN_MAX; channel++)
>> -		if (xe_hwmon_is_visible(hwmon, hwmon_fan, hwmon_fan_input, channel))
>> -			xe_hwmon_fan_input_read(hwmon, channel, &fan_speed);
>> +	if (hwmon->xe->info.has_fan_control) {
>> +		xe_hwmon_get_fan_enable_mask(hwmon);
>> +
>> +		/* Initialize 'struct xe_hwmon_fan_info' with initial fan register reading. */
>> +		for (channel = 0; channel < FAN_MAX; channel++)
>> +			if (IS_FAN_ENABLED(channel))
>> +				xe_hwmon_fan_input_read(hwmon, channel, &fan_speed);
>>   
>> +		/* Fan control tables initialization */
>> +		if (xe_hwmon_read_fan_control_info(hwmon))
>> +			xe_warn(hwmon->xe, "Fan control tables are not available\n");
>> +	}
>>   	return xe_hwmon_init_temp_info(hwmon);
>>   }
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
>> index 00c4fc7d0124..0349b24a8259 100644
>> --- a/drivers/gpu/drm/xe/xe_pcode_api.h
>> +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
>> @@ -83,6 +83,11 @@
>>   
>>   #define   FAN_SPEED_CONTROL			0x7D
>>   #define     FSC_READ_NUM_FANS			0x4
>> +#define     FSC_READ_STOCK_FAN_CONTROL_POINTS	0x5
>> +#define     FSC_READ_FAN_TABLE			0x7
>> +#define     FAN_CONTROL_POINT_TEMP_MASK		REG_GENMASK(7, 0)
>> +#define     FAN_CONTROL_POINT_SPEED_MASK	REG_GENMASK(15, 8)
>> +#define     FSC_READ_FAN_MIN_PWM		0x8
>>   
>>   #define PCODE_SCRATCH(x)		XE_REG(0x138320 + ((x) * 4))
>>   /* PCODE_SCRATCH0 */

Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B11DE606A325
	for <intel-xe@archiver.kernel.org>; Wed, 18 Nov 2026 06:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TR6aPsRN;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=WNvWeaiW
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76B9110E22B;
	Wed, 18 Nov 2026 06:46:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 093AD10E22B
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Nov 2026 06:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794984358; x=1826520358;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=soU+RQ8s+CSG7dqWKS/UxRj2FT8xSqbAQYbsLVxeCOc=;
 b=TR6aPsRNXF4NVgTcZexIZUZyHbqY52Pfb/pCG7OoWZ/F+x4kHHubSu2x
 AxYlT8it6y8z1q8ei/eTO4pdJloQjZHU+pC6cLlp4wSMvwQXCeBWWLGOl
 JgVScSEdecONVdc0q2zbahI13EyriK3akMNwNu/X96T9OJE4Tx7KNbxEH
 qHFiysYr5QoDl13SjF75FsUWnvIHEkFQHX87qUj1ln9kgmIu5xhJLg8N5
 evO21kMiITR2wsr/ouDn2t1nDIh8ffw6k0TrZ0h57k5pejArYYMglxcPT
 G3+wJVvh1gm4GzMxE7J0DOpKWQjznp5TYCHKN0kx7NLwCGySrTh+HsYCU Q==;
X-CSE-ConnectionGUID: QyLjviWbTAKPM7SN2VhPvw==
X-CSE-MsgGUID: 1dJVQQlaSFyfMyUnDYY/Vg==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3790445"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3790445"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2026 22:45:56 -0800
X-CSE-ConnectionGUID: r+jCLD5vRPebd/VEMZYSPQ==
X-CSE-MsgGUID: wiySF/+ORSORNkxpJnkWEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; d="scan'208";a="10064396"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2026 22:45:54 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 17 Nov 2026 22:45:54 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Tue, 17 Nov 2026 22:45:54 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.10) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 17 Nov 2026 22:45:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SfNcEwcN338RcKRa6boQTWulLLX/Eg182GQQn5BNGApxVIC3so4YxUVsa//dmxpE3AScZBImb9YuUS/B2UgZCfVulcdHznro7kCaPll2ma/rqt22MnMG/atJUgPvuBZo3JeK5hvOkEnFoyLQ2KnTuftcaPWp4pzyaWBoNUPBprRYxivQTGA3xYo5TC1iZi0bST0ug9t2ES7k3mtD7JR3ZnQ55ZnVe4wW+EOL5p4m9cW+EmdXyGdkoGCDORVUdG/TgN3qDwm0BBqYrUywWUqsDvcs3K3NGbiZgCwNS2eoUNkdtZmj/hvPRPntYEw/Nnp6cT2SSvGBhpJoN2txufOLeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6x9f8h+pWMTpJGkP9yIiKKZITxAUFwCbRBZiH+BlnYw=;
 b=CaR1TaD43LyFE1260NDMhtOPQ+w4Xh1ZwFfRPtcq1c9ZajvWQ0ejr22lieMXhYsBwK0N2Qk55Jqcig4YHhIfQmhLvl2vzVJoDBnLRzOsR1lxBznS8uKwh7+NWwZHNOkZazyHYIeqfgiKLkxXzEEARbsgCMtNxSToWW/c76Y0+74JKHWjbLqm+5I0E3SYLjz5smsaVfdjsRsQIWXHx+euDK3VWt/ffBuvsOq5ZJBLRUriz9mtL218VkvhJFR83rzTpfAfgSibnNnMI1p6JNtOzzSf/zaCXa9FbQE4tvLvtigMed7HPxrYpWoxPscPhXuBB9p+I1sjSMLbawAzJ2nBTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6x9f8h+pWMTpJGkP9yIiKKZITxAUFwCbRBZiH+BlnYw=;
 b=WNvWeaiW0fqtMTHA6q7OBf1qYAd4iNtZ8UI/KM/bXDR0rJwkLf2x9Bl0IaWSa7XUxbjGO8/gF47X+2OztO1+KjVnDMNfeeZFCFz5OOu4ZeaEJoQlV+96PqxydCbQ7xmMt1Jz65rEaSPMtQsVunzTr1AN7DaCKOpyfUUjHRr2uT8=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV0PR11MB9792.namprd11.prod.outlook.com (2603:10b6:408:385::5)
 by PH9PR11MB509077.namprd11.prod.outlook.com (2603:10b6:510:3e4::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 06:45:47 +0000
Received: from LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8]) by LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8%5]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 06:45:46 +0000
Message-ID: <c57fd116-7adf-4618-9f2c-048237c22162@intel.com>
Date: Wed, 18 Nov 2026 12:15:40 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/xe/pcode: Add MEMORY_CONFIG mailbox definitions
To: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <sk.anirban@intel.com>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>
References: <20261118062301.4135537-1-naresh.kumar.g@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20261118062301.4135537-1-naresh.kumar.g@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0020.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:177::9) To LV0PR11MB9792.namprd11.prod.outlook.com
 (2603:10b6:408:385::5)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV0PR11MB9792:EE_|PH9PR11MB509077:EE_
X-MS-Office365-Filtering-Correlation-Id: 0cec8500-fd4d-4621-3f66-08df453f9369
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|10067099003|261022113327099003|56012099006|11063799006|261026121527099003|261026140227099003|261028144727099003|261021121427099003|261022105027099003|261102123227099003|261009223027099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: Pm7nuXIS66/vM+c3BxEX1sInno9+e9VApazcjj62FurwhTIQxSwC1p3DUYcfv1dWHcPijJqedGFdqzRyuTJyzsleOycxZjV+n+SjkAx4yGDSL4C794wPkUbEhThWVGERkC9hAa71v0aEE+9KlEiWob3j5eNI4qD9AmpcYuvqn488M6J/5cS+/tNlgwTS/liB2iWdEEQqhVWfjQzTorktIw20NyUY3X5arSBZDD8nJmj/E83BZO61MCr8MC/QaDD0DCvyDd9FXf021u14RWrq5qB1IG5FZ9exmozsX2nk2T4S3ctnX6lcTMZEVHYbXVuHUTX2UILTxgk/lQc/OxrCu6z7pxGhsWV0f5VTEwxu/w344i174fhzbQN5o/w/BTrwjO2uXN8Npg1ux+V/+NLYjMO5gT2HP+D1sR4uw3UlTV82FwzInIM14bWETvUEfPMseN6hb5yg+Z837gGXaiPlnes7zbGHCn4jXY72Hyln7Z+iaG7HkbDDcdX+tKFTEH3VYpq9uBUjCnyybseckRmI3WLxTocPzS26HBEjWKchKFnJgD/qHcCO2gqCDHR1PfkdB1yG+FPCVOez6Asj/a/77GVmyVMluTsEmyWNzGS5pKYynxFIMGRYbbSHgyrR97v+jPlwcfwxc8458J4qBpNKYi9mncYqCjbSeT9dVu5w/TQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV0PR11MB9792.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(10067099003)(261022113327099003)(56012099006)(11063799006)(261026121527099003)(261026140227099003)(261028144727099003)(261021121427099003)(261022105027099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?anRLVGp5YXBlKzhTaVgxaHZLVGgwQmZIbjlBWnY3MlhyUC9jRWxQQVROdVVp?=
 =?utf-8?B?dDNpVXZ6T2FzMUtUUVJCME1OQmdHUnlBaktJU1VyTFR2WE8zWjJ5RG1VSGE4?=
 =?utf-8?B?RjN6R0J5dVFxeWF2NmJxYjA4NjhPbWRHVmJpMFR0WmNpaG16UDdXVFNDaDJr?=
 =?utf-8?B?bENvYVlGai9kTFhuQzU5TXozOENKODZFcy9zWm5ydHh5bVlmakZObS9OamU0?=
 =?utf-8?B?UWxUeGVkMmM2cWErWHUxckR6aER3ZkpvemhZQk5UR0xFTWdKMzc3T0NWeVpL?=
 =?utf-8?B?b3VMblRLVm5ORWRoSDJqdFdFd2U5WFJsM2w5VVZqcktSNVpsL0hLTlNqVm5J?=
 =?utf-8?B?MGRyLzR4a0dXeVBmTE5kYTQ0MmhDZ2RLT3RJNTMyWFBoK1JKR0JzVXhzUC9Z?=
 =?utf-8?B?SW1nOFJBQ1Q5YVM4MDVMejhuakFRcDhuSHhJb1lDWWdtVjV4UEhjaDVYRWtX?=
 =?utf-8?B?RWpOVlZmcTFtSzRvWkhzK2RnVHpwU1JoZWErVXp4MkJVR0NwZWJWdlZQajA3?=
 =?utf-8?B?V1dXUnFqcmZwZ2RtQTlYYVdJeUtiRDJlVHQ3RzVVSzJMdUxSOUNCVUl1enEv?=
 =?utf-8?B?N2V2WG1FOHVYSmVHaUczdUZBYko5MFQ2MFBYT212REFwTGIzUUIxRWt1Zkdl?=
 =?utf-8?B?cXFkUEpMZTM5OGNlWkFqZnAvM2xEMnVPSG9Va3BGRHNuRUVseWl6RS83RXhl?=
 =?utf-8?B?S2pMaXJtKzdHY2JEWWovK0ZhaHlpSmRkbjNrZzhhV1N2ZldSVWRua1RBRy9E?=
 =?utf-8?B?cU1RcVVUdnBuVHJvU1VhSlN2cHRNVkd4MmJETjZuRE9NNzQ0QWgyK1JEdC84?=
 =?utf-8?B?QlVodzZOU1JzalhwL3AwR2JkbHlPRnQ0UnhwN1E4MjcvbVk2TXVhdU1nRDEz?=
 =?utf-8?B?R1JuTFZaYlhzSnFrOEdNdnZQWlM1aDZCVDFoWXdDT2w4WEVrRThaK3BVNEFY?=
 =?utf-8?B?eEFwRzVrZ2tCRzV0RUdHVGdRZ0VpQ3FQUGo0cC9XSHVUZ20rOTBvRUN5a3dG?=
 =?utf-8?B?LzJJSm00UUVJek40TWhkeWdSS1BDNU1rUWFxeElyS25UeG5DVjl6c0QzVFZz?=
 =?utf-8?B?b2VjQVo2dEZFM2NKd0hiYjEyTlZ1T1lJREJHVEVVZTZBTE8zM3R0YkFxUm42?=
 =?utf-8?B?RzltT04wQjVsUjB4K2JzRjhoaDRQQmRXOG9ZZDVibWFGZUFjU21mcm9VZmEz?=
 =?utf-8?B?RlpDeTJBM2FvbU42UXh4WW1BbXF2ZkV2ZExNc01ONWNQanF0bnZTSkVRRVRo?=
 =?utf-8?B?cWVKaEFSc0N3RlplckJkcDNoRC95ZGErRTY0bjdtUTZUdCt3Z0U5c2daZllp?=
 =?utf-8?B?ZUZhZkZiMVdQeDd5SXFCMVdLWjNqMmVWaFk3R090QVQvL0ZZSGU5UXNQQkVm?=
 =?utf-8?B?dFI0TG1xMzhzaUVqTG5ySHlScmVQQmlTUFdCUzJwVDFQTFdsY2liWE9vOFFQ?=
 =?utf-8?B?TWQyL0hqRHVzaFJXejlzTEN2bFN1MlJKaXlnZkk3SHNBK3VQYllHWHdMT2E2?=
 =?utf-8?B?LzJHR0wxWnFRQzRSRzZYNzVMUlVuelNFY0c0RjhwTWxZVEM2S2IzdXdVcmU3?=
 =?utf-8?B?c0FNbHRIWVRJVVZyUllndDVzSTFFN29OSEdpS1dkS3dIdjdBRVdHU2dGNVM5?=
 =?utf-8?B?SWRNTThETGwvZjJVTDZqTUdiZG1Pdi9JWVd5VlJiNlJxVmlSM09ZYllvN0lS?=
 =?utf-8?B?eDNWckZvTnM0NndGV2xTZDJvV1U2OTdFR2hiNVVqTFhFNityNGJNMjB6Y283?=
 =?utf-8?B?L2pHUUhEUlM0WnFyQUp0NGJrNVlJVUhoUW9uMDhNeEE0Umt2akkyMS9wanNw?=
 =?utf-8?B?U3AzUHBXa0ZkdlR3TXJJU1loYWdzOXpMdHM5TElLNzl3cUVqcTdLTlp0UWVY?=
 =?utf-8?B?OVBCVFVQKzl6RDVFZ0RHdUhFYVl1eWRQNzFMclpLcFRMOFpuTkRPSXdRN2lU?=
 =?utf-8?B?TXl1NUg2NXJpQlkwY0lSZENkVFovb2c4NHZ3Z2NUbUVWcEk5VEFVUHZQeHJ6?=
 =?utf-8?B?ZHdnVXRvUkVtVkJBaGprbG5qc01rS0R0WDNHNU1acGYrdXlJcHhFR0hQTGRN?=
 =?utf-8?B?MVQ1WDFzZ05OdmJVNnVydjdrN3ZReWF0VWROZUEzWHRRc1JIeGZXbTFyY3dO?=
 =?utf-8?B?SkREZitwUHdyNDNRT0xpbXM3N3dvVWgvT3ROVFIvbkZYRGNrbHd1cmVjUmc5?=
 =?utf-8?B?V0lwbTZMaUJpaCtnYm9aWklBbUJTNGtjakYwZEFDUTJwVFYrTzFGM2JidnpL?=
 =?utf-8?B?NTJUVTZrcFFmQ0lacWJtSTh5d2Q3NVovZi90SC9Sb2FTaFdZWG0rbDZ4ek9Y?=
 =?utf-8?B?Nm56QkN6ejVCTEtmZVljQms0enJqOU04SjNvTjdlZVVybVgwOEM5dz09?=
X-Exchange-RoutingPolicyChecked: BPdH0DUDCkN43n4731s6fWO8zStvCyLYHRptaW4/H01al0T87RsdnuV5kSxzzUYTdHz3obigXvpYHuI2dZrD1Tank9jftYwGIzy8nCCYNs6eFwQYH9MSnM8opFTY7DaJKgB3N4bHbYP+faXU6cbf7hn/d+irx07hPmbNXHDtfmg/tYFMIPDZBRBCbfe8ZwSpCu8XiAlxL8YWTtC+yiBU6ce7/SsZ2wqN6+7Toh/J6hpMFcqj9qVL9GV+e2/tGoGCECd8+XSmMDTanX/3UHQdcUfpY2Hu7IoOp4INW5/NIJ5Y/GTEdWFicnRzWwbNL/uwknrRG7V7Y+jEMhPWyoy/9A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cec8500-fd4d-4621-3f66-08df453f9369
X-MS-Exchange-CrossTenant-AuthSource: LV0PR11MB9792.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 06:45:46.9003 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: raT2SsbnZrZzpmiiKqVV475TAK7NYyFehhWo05bnPSj15oBpJ+RFP7dM9CB90HQRVV+LpRPCDW+kbLmAewJWXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH9PR11MB509077
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


On 18-11-2026 11:52, Nareshkumar Gollakoti wrote:
> From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>
> Add the PCODE MEMORY_CONFIG command and its READ_MAX_BANDWIDTH and
> READ_MAX_FREQUENCY sub-commands. They report the maximum achievable
> memory bandwidth in Mbps and the maximum achievable memory frequency
> in MHz.
>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_pcode_api.h | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
> index 00c4fc7d0124..f05846931059 100644
> --- a/drivers/gpu/drm/xe/xe_pcode_api.h
> +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
> @@ -81,6 +81,10 @@
>   /* Domain IDs (param2) */
>   #define     PCODE_MBOX_DOMAIN_HBM		0x2
>   
> +#define   PCODE_MEMORY_CONFIG		0x70
> +#define     MEMORY_CONFIG_SUBCOMMAND_READ_MAX_BANDWIDTH 0x0
> +#define     MEMORY_CONFIG_SUBCOMMAND_READ_MAX_FREQUENCY 0x1
> +

The PCode mailbox ordering seems inconsistent: 7E, 7D, 25, 5C, 6E, 70, 
7E. Clean up can be done in separate patch.

Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>

Thanks,
Badal

>   #define   FAN_SPEED_CONTROL			0x7D
>   #define     FSC_READ_NUM_FANS			0x4
>   

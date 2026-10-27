Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79423606A31D
	for <intel-xe@archiver.kernel.org>; Tue, 27 Oct 2026 07:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VUt82eZX
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F6B610E0A0;
	Tue, 27 Oct 2026 07:28:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CD1E10E0A0
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Oct 2026 07:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793086093; x=1824622093;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=WjQQGVcgDbL23C+FZtJq8ylk97R4NeKJgsNekU7e4YQ=;
 b=VUt82eZXADjIOc8jreca64nL7Ch9Yc8oa7PLyBNghozWT8XPZIv8/RP8
 3MXFAe0xePHuL5l1fJUB4DBaf9fCb949vL9KLMRPbVixzFvIpSvXZR5kD
 qZwa8JsBTegEJxDH4XC964qtMDUV2Dbd/4WCq0+YLK2HcG04G9xdHo4fn
 hAwmU2HWfhUSqdzV934UhVxv59y9Uj37jBsRd2wHxxs5m4jBS5vwjCVDb
 skhB2n0fEe7gFNH55fTSghi5NIGh+Zr4X7k+Yz3jFU1FJJ4pUbVUc+WRm
 9bMrtUZDtZA0hazzZqud2tnAtxbL+95uTJ0uW2I6tda03iqncccHpiX4Z g==;
X-CSE-ConnectionGUID: j06cWwZHRpuEyb5r4nt/ig==
X-CSE-MsgGUID: /TSDjod5Q2aqzfBxsmU6+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1681104"
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; d="scan'208,217";a="1681104"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 00:28:12 -0700
X-CSE-ConnectionGUID: sfiZ5yiYSlev2gKLwoAR4g==
X-CSE-MsgGUID: j2x7VHnsRIyUOm2s7UYgBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; d="scan'208,217";a="4626811"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 00:28:12 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 27 Oct 2026 00:28:11 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 27 Oct 2026 00:28:11 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.17) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 27 Oct 2026 00:28:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ikqMrAm+2FJHoSQSJ7j+IUs0aqZRzzV5YBdX4gFs+PDaj7fJGDKS0QebTaR6eqD7wWdbseB5vxbSSKUPzaDqWz6FExr6mdziiFXoX7l7mwCVtV5gS//OUrtZ3+MvdsBKxIxLYRBsN8cLuXyFnVSvf7yl4NsUtBf2RNwY1pCETZozImnwgBD0dQkVVomeFC31ibKZ5Uso/gFn2mWODWmW3+PnExCOYVjea/SCRnKqXYmZ2/Wrz6hURan1uppieleJe4KPx0MvJqyu8h8YEpYh+8ZCOzaUD9hIZEPNygIlVbS+/wcgbWBN1KwiowTGFLxkzqFKgNPra/B/Bka1UOZVfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9vnQzcdyM57OIFPD28pr5nnahLsOUdiU7cqDCRuF1Hk=;
 b=MxXvI0I78fJn1hpKT2MVFHcfsZM5qmvo36TRc5p0AeBhb4ITw3cD7wnviTA+9FKnEFSHKS8sYB1emIRLH2kIx2bcnQfVOZNukDCaJnnTafk+MtCtt4zjQnIoFKuFzMHsMwzNbN3juJBYugewEBNnbj/d7c616qsqZigl2ObUC3420Ghd258F7ewCMd32uJFxxHo36Tke/gfJMBFWqYTUdcHM6UkghMQvoqUQMqCU5Aw65gQZCy7IUXa+sbC9/VjA9s9tVMGm7YQEC/jXz/L84imhhKvc9kz3oFpdHb+fZ025gb/mOjTw0kwnX12GESQ9DU4AaYNicH3nVu5IZojDPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV0PR11MB9792.namprd11.prod.outlook.com (2603:10b6:408:385::5)
 by CY8PR11MB7924.namprd11.prod.outlook.com (2603:10b6:930:7a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 07:28:10 +0000
Received: from LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8]) by LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8%5]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 07:28:09 +0000
Content-Type: multipart/alternative;
 boundary="------------SAyzlefiN0bgfzPGMnFQYR0O"
Message-ID: <7882eb1d-a0ea-46db-b742-80da1f23fa70@intel.com>
Date: Tue, 27 Oct 2026 12:58:00 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] drm/xe/cper: Let caller initialize error_class
To: Mallesh Koujalagi <mallesh.koujalagi@intel.com>,
 <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <matthew.brost@intel.com>
CC: <anshuman.gupta@intel.com>, <vinay.belgaumkar@intel.com>,
 <riana.tauro@intel.com>, <karthik.poosa@intel.com>, <sk.anirban@intel.com>,
 <raag.jadav@intel.com>, <michal.wajdeczko@intel.com>,
 <aravind.iddamsetty@linux.intel.com>
References: <20261021162508.265700-7-mallesh.koujalagi@intel.com>
 <20261021162508.265700-10-mallesh.koujalagi@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20261021162508.265700-10-mallesh.koujalagi@intel.com>
X-ClientProxiedBy: MA5P287CA0129.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d2::14) To LV0PR11MB9792.namprd11.prod.outlook.com
 (2603:10b6:408:385::5)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV0PR11MB9792:EE_|CY8PR11MB7924:EE_
X-MS-Office365-Filtering-Correlation-Id: 6faee1bb-5162-435c-dc38-08df33fbd9f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|1800799024|376014|6133799003|18002099003|22082099003|8096899003|10067099003|4143699003|11063799006|56012099006|261021121427099003|261022105027099003|261022075727099003|261021123027099003|261022113327099003|261009223027099003|261026140227099003;
X-Microsoft-Antispam-Message-Info: SrNv8U4MYA+ffcsSKkcSkflMr+3S1SDTOYFPYnM+soVyGYoHaUWylvMhOxtm6HWvwW5ZEQF0rwpB12SSbHptWMA/801ef3mPHh05ATgjRe3FfB1aitLhZDYcgmv0H9XncA8ItYnsYl8QL2ktm3gI+44y9MGNxl0gYDsYL/FIiv1/QANPWRFsgNZD8mZt53HaQ+QlQoeUKipjcZRQNPKDRtKjsCUVNj4zHzKOGMzfXd5qHmf9pa3jZbReDgPJrcOHyF3ndUuW2sBbdmopaTqOJYexlAoOMbJosECX4HydwcIPzcGXzom0SWBVkN3IngkuWqNZLKMjtdBhxMj+buuWx9j/N9u+mIrXcARD5uO6FMIzYHXUDwgC2y7HxiCfsRDcKTgAiH+yU7348PPYg4SYu5Osmw8/p6jllm/BkR0IggdZ0CdPEBAULF48Zv8McT7MlcQ5IXr05pHFgbplY8Mk9YOQghHBo61xB66tqOmgLu0VmAyBkDI+E/K/qxQ2l5q1fbZMK3vg3FAVyJfstMTVmdcvlsiN4IJDIxTVzI2/zPrk9ZGEyyR/6Nuy/Tt27HzPsUWZ/jHQc5rBNHbBoQPzlX3DSrPaVoWHUmgtoBSj4awKkMChGd+U4NqkDLkZ8VQ3muC0lfoZYUXk0jchpwT7QnNCfCS2IJgBn1DhbNwWJk8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV0PR11MB9792.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(6133799003)(18002099003)(22082099003)(8096899003)(10067099003)(4143699003)(11063799006)(56012099006)(261021121427099003)(261022105027099003)(261022075727099003)(261021123027099003)(261022113327099003)(261009223027099003)(261026140227099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZjJMeEVvVEZtNjd2VWpjUVJjZlFFK0dXWk43Wi9BNkV5RUFVR05peTJTYk1B?=
 =?utf-8?B?TUZwaDBIa2FkM1VUTS9GUnp5WlBkNDB0Ky80enlJWGt3RTFBZnUydWM5Rytu?=
 =?utf-8?B?bXIyaFdxeFVKRDM3OVQySDBjYWxUUXpRR3ZTaWQ5T0dnUVJqYnNsQXBqY2Ja?=
 =?utf-8?B?RjJESThQdTZyMisxWFpBclViQUl5U2FaVllRSmkzT3FkN01OUTIxQmVOSmVi?=
 =?utf-8?B?RlIrcktkTmoxcEpPdmRsZkdzK3U3YVlKemJMWmhicnFMMFlKMmlKbDBkZ3VR?=
 =?utf-8?B?WFR1YUpSQ1liYm9wekVxTkxGQzkzMHpQMm5DZTZOY2tJalB5OXRFajVrcWRj?=
 =?utf-8?B?RWtUK014UDFDSTlFWDZWb2RtaDZrY3lDNWtPcXlsOGRMTlduYy9IamNhd2pi?=
 =?utf-8?B?bmw3cVpqeTBiTEoyZjh3MlNMVkpJK2ZtOXdOOFVRelcxZEhubG5VaXRBR2VT?=
 =?utf-8?B?cXBJOCs4QzRkMlBKSDI1b2YwYWhZamhtTmxCeStpd0xhRWxvNVBqbjNOK0k0?=
 =?utf-8?B?d1YzVVF6QVZDaXM3UWg3dXVHUlFCM1YrdHhFR3JPT0dXY2lPeEpJMWU0dERL?=
 =?utf-8?B?d3FuMDZjWHBmU2JiUnZrc0ZoL24xZzFGRHBqbDV3S1lnaDRRNEd1T2Y5TDVF?=
 =?utf-8?B?b0tZNUFYMTVJQktpSTBoMGtrM2pmODVHS0x6akJZL2pCOWUvSTB0Yjh5d0Fk?=
 =?utf-8?B?TjZZK1ZHbGNsdUlGNENTZGhQR2o4THdnSVAxSW1tRDVZaExibE5VSjBsZk5k?=
 =?utf-8?B?R0FuYzVmNjlOcTEwelNvem1Dd0YvdzNNd0VBMU51QTBSeFBnOTMreU9iVHpS?=
 =?utf-8?B?MFRTN2s1ZHM3ZXBRd0w3ODh3dDhpcnFDU3U5dzFyOFhWOVovNW5jODlBek81?=
 =?utf-8?B?R0xaRFFPYUJKRXlRMzJnYnJxQUg4NzAzSk9YNHIvSUFtL1Rla1llb0NTTUlM?=
 =?utf-8?B?TEpWV3VYenRtVDE1N1VTYWZHeTI2akFLL2thUktwT0owNlN0WE5HUDc3ZTMz?=
 =?utf-8?B?dDczencwWkJOVFNNY2xLT0RDRGZGYlBvVmRoMXNYWUFIZm9ObzBxL0Z3aitM?=
 =?utf-8?B?Ti8xanI2L1A3WmtOWkJWRUphcUwreGRMWEpIcEpwT1V3OXFzOTIxdmxtTVlJ?=
 =?utf-8?B?YnFMdVNUNlQ2MVduNGNMcFJGMVowbWhJdzU2SUIzY2NHYTRUajFWZUowTml4?=
 =?utf-8?B?UTRNYlQyaFpWSEU5OTA2K0JDdlRZY004WW9nRlkrTmRMbHZhSzdyZmRhS09L?=
 =?utf-8?B?NCtBRHM1VmpIZC9vTUxyR0VzUUdmVlpTNHJMY3VKNjBMZVFoT25GelJEVnVO?=
 =?utf-8?B?YmhSbFlyR3lHcFY2d1JwT3pmSkVMa3Bvc3pNZnRNNHh0WW5CemxvVUdxMnlp?=
 =?utf-8?B?WjRJOFNlSzBEZzRrWWh5a3lwRXdsdmFVMFFIdjNwMTNRMkF6WlQ0ZG4yUGls?=
 =?utf-8?B?dzREc2Y5SHE0eGcrODN4MzdmQVNGTXovV2ZWY0k3WmF3b2NjRWlvd09qeDdv?=
 =?utf-8?B?NC84RmRYQ1NSaWNHRjg3Umxxa0Q5OGVjVVlZQ3cyRk8wa3NjemFmM2NvU3l5?=
 =?utf-8?B?OHVrMGtUKzVkWThVcVJrWHRiRTJicXhOMHNKbmI1Zm1uemc4dmFRamc2VHIr?=
 =?utf-8?B?cXBtOGtMOFJ3MUdYQzk0dTNHM29Wa2g4WFZ2TkJPSVJKbVJFRW4wWFdYNXNZ?=
 =?utf-8?B?dXVlNVVwdUx0ZVRVcUpoZTFyaDAybXlrekgvZ2kvVy9EVUhUZ3RLTW0xcVRN?=
 =?utf-8?B?V3BBaGlLaWUvTVhINy8vOWtudVZTeHdiaWQydnRPRitiUG1hTEtjWUVuUk1u?=
 =?utf-8?B?cFlNbGUvVm1mTEY0bmF4dnRUckFnVWhOb1dEZ2Y5MEhuSUxsNjNZWTg1SVlS?=
 =?utf-8?B?d0xZNkUrNm4wbHJydjFGRnQycHBkSDhPTnQ3S3p2MDJWbWdTOTJNRTdqcFUy?=
 =?utf-8?B?bjFRRU1lVVh4WFluQXNPdVkxb2ZSZlphcGU2TmNVK3ZtSkljc09aekVQL2lD?=
 =?utf-8?B?RDlndGg3YTRtRTIxaENwakI0bllxeHVKVU9JaExrNTV2QUFVN05iQ1R4dERS?=
 =?utf-8?B?L21jMFVzSWlpeStHaUJ4bGRjTSs4L3owelBrbnZISjJpMDJoalBjQnNxMjlx?=
 =?utf-8?B?OUxQWkV5OTM4TmcyMnhpRThWTENsdldmSVl5eUVWYWx6VGFxeVk3MTl5TXEx?=
 =?utf-8?B?Q0RGRDRDTGJHaFlkc1RCNVZJRGQ5MU5BcHgvbTlGTEk1NXExbUg1dGltUUZT?=
 =?utf-8?B?Tjh5ZFFCdUlUbldpRkx5U2VQa1BKdGZKVEpEd3VOZUlYVXJkQXA3ejBtTzJ1?=
 =?utf-8?B?WlExWGxaTjljR0ZGRXNEYmJqbjlkbS9lOEtHWG1rUVZDc3ZVK1g1Zz09?=
X-Exchange-RoutingPolicyChecked: IKR9u/lMq6yGvFT6Qx/NLKRA2uQ6b6zj/DCcqzQIy00XyvQFvMf0zd7dm+CQIgpZrpZfgk9Sx7VDShJZdwLhSWP4wvjWZMamHvtwEFfQt7AMIlvkv0bNhszZuyAd29WmLfQFtP0d8NVoTrB6uFaMz82dhbgwdW0eoKUY+xQduMljBXOFidsgrQAgWUtsup00kwqaetRrqAFhZ/pnrc3leSOz0KJmRW2m84d8DrAlHXhwl2YXgsso5htKkUgurYnnrd/+mTd0zxsWuHu0v3KKoDPJjPhesju5KTAxzFDs7+TQy6DWmKjdpVmcyVxyBritdvULcrF85kTNKqSK77VEDw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6faee1bb-5162-435c-dc38-08df33fbd9f3
X-MS-Exchange-CrossTenant-AuthSource: LV0PR11MB9792.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 07:28:09.9227 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rlH5zbKGIcxv+RYNOT50BdyJAxrng9Vuu+eUJRdKMVV7vwUo8dF/cHN2Qke59+VAi4zxBul4YAmpMs/IKftLDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7924
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
X-Spam-Status: No, score=-14.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--------------SAyzlefiN0bgfzPGMnFQYR0O
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 21-10-2026 21:55, Mallesh Koujalagi wrote:
> Move error_class population from
> xe_cper_init_intel_err_hdr() to its caller.
>
> This decouples the helper from the RAS-specific error_class format
> and allows future paths to provide their own encoding.
>
> Signed-off-by: Mallesh Koujalagi<mallesh.koujalagi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_cper.c | 12 +++++-------
>   1 file changed, 5 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_cper.c b/drivers/gpu/drm/xe/xe_cper.c
> index 0fedef06e138..1dab6ea93fea 100644
> --- a/drivers/gpu/drm/xe/xe_cper.c
> +++ b/drivers/gpu/drm/xe/xe_cper.c
> @@ -91,12 +91,9 @@ static void fill_cper_error_class(struct xe_cper_error_class *dst,
>   	dst->cause = src->product.cause.cause;
>   }
>   
> -static void xe_cper_init_intel_err_hdr(struct xe_device *xe,
> -				       const struct xe_ras_error_class *error_class,
> -				       u64 first_timestamp, u32 sig_id, u32 error_count,
> -				       struct xe_cper_sec_intel_err_hdr *ihdr)
> +static void xe_cper_init_intel_err_hdr(struct xe_device *xe, u64 first_timestamp, u32 sig_id,
> +				       u32 error_count, struct xe_cper_sec_intel_err_hdr *ihdr)
>   {
> -	fill_cper_error_class(&ihdr->error_class, error_class);
>   	ihdr->validation_bits |= XE_CPER_VALID_LOCATION;
>   
>   	if (first_timestamp) {
> @@ -428,8 +425,9 @@ void xe_cper_emit_counter(struct xe_device *xe, int cper_sev, enum xe_sigid sigi
>   	for (i = 0; i < count; i++) {
>   		struct xe_cper_sec_intel_err_hdr ihdr = {};
>   
> -		xe_cper_init_intel_err_hdr(xe, &entries[i].hdr.error_class, entries[i].timestamp,
> -					   sigid, entries[i].hdr.counter, &ihdr);
> +		fill_cper_error_class(&ihdr.error_class, &entries[i].hdr.error_class);

in hw cper v5 fill_cper_error_class(() is eliminated.

Thanks, Badal

> +		xe_cper_init_intel_err_hdr(xe, entries[i].timestamp, sigid,
> +					   entries[i].hdr.counter, &ihdr);
>   
>   		xe_cper_record_emit(xe, cper_sev, &INTEL_CPER_NOTIFY_GPU_ERROR, &ihdr,
>   				    entries[i].einfo, entries[i].einfo_size);
--------------SAyzlefiN0bgfzPGMnFQYR0O
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 21-10-2026 21:55, Mallesh Koujalagi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20261021162508.265700-10-mallesh.koujalagi@intel.com">
      <pre wrap="" class="moz-quote-pre">Move error_class population from
xe_cper_init_intel_err_hdr() to its caller.

This decouples the helper from the RAS-specific error_class format
and allows future paths to provide their own encoding.

Signed-off-by: Mallesh Koujalagi <a class="moz-txt-link-rfc2396E" href="mailto:mallesh.koujalagi@intel.com">&lt;mallesh.koujalagi@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_cper.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_cper.c b/drivers/gpu/drm/xe/xe_cper.c
index 0fedef06e138..1dab6ea93fea 100644
--- a/drivers/gpu/drm/xe/xe_cper.c
+++ b/drivers/gpu/drm/xe/xe_cper.c
@@ -91,12 +91,9 @@ static void fill_cper_error_class(struct xe_cper_error_class *dst,
 	dst-&gt;cause = src-&gt;product.cause.cause;
 }
 
-static void xe_cper_init_intel_err_hdr(struct xe_device *xe,
-				       const struct xe_ras_error_class *error_class,
-				       u64 first_timestamp, u32 sig_id, u32 error_count,
-				       struct xe_cper_sec_intel_err_hdr *ihdr)
+static void xe_cper_init_intel_err_hdr(struct xe_device *xe, u64 first_timestamp, u32 sig_id,
+				       u32 error_count, struct xe_cper_sec_intel_err_hdr *ihdr)
 {
-	fill_cper_error_class(&amp;ihdr-&gt;error_class, error_class);
 	ihdr-&gt;validation_bits |= XE_CPER_VALID_LOCATION;
 
 	if (first_timestamp) {
@@ -428,8 +425,9 @@ void xe_cper_emit_counter(struct xe_device *xe, int cper_sev, enum xe_sigid sigi
 	for (i = 0; i &lt; count; i++) {
 		struct xe_cper_sec_intel_err_hdr ihdr = {};
 
-		xe_cper_init_intel_err_hdr(xe, &amp;entries[i].hdr.error_class, entries[i].timestamp,
-					   sigid, entries[i].hdr.counter, &amp;ihdr);
+		fill_cper_error_class(&amp;ihdr.error_class, &amp;entries[i].hdr.error_class);</pre>
    </blockquote>
    <p>in hw cper v5&nbsp;<span style="white-space: pre-wrap">fill_cper_error_class(()  is eliminated. </span></p>
    <p><span style="white-space: pre-wrap">Thanks,
Badal </span></p>
    <blockquote type="cite" cite="mid:20261021162508.265700-10-mallesh.koujalagi@intel.com">
      <pre wrap="" class="moz-quote-pre">
+		xe_cper_init_intel_err_hdr(xe, entries[i].timestamp, sigid,
+					   entries[i].hdr.counter, &amp;ihdr);
 
 		xe_cper_record_emit(xe, cper_sev, &amp;INTEL_CPER_NOTIFY_GPU_ERROR, &amp;ihdr,
 				    entries[i].einfo, entries[i].einfo_size);
</pre>
    </blockquote>
  </body>
</html>

--------------SAyzlefiN0bgfzPGMnFQYR0O--

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F35ACD4F24
	for <intel-xe@archiver.kernel.org>; Tue, 12 May 2026 16:19:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED5AA10E27F;
	Tue, 12 May 2026 16:19:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lM1ED0pC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CCAF10E27F
 for <intel-xe@lists.freedesktop.org>; Tue, 12 May 2026 16:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778602758; x=1810138758;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=VKxT8iZFR+D8tUkw6654S075zlksT/ZvJMRC6ESZFK0=;
 b=lM1ED0pCcTfMQz7C8hqZJzfnjjL5cWMECgEmwqlnSh9vuGwoGNCKL5Eo
 k4QdOUDI/dH//r764DiXbXhfMFAqjjGcsns+MStjYM5FAyroKvGFAyIAh
 ljxzcP8IvK2KMm7aUya3+1sybKZmkEypNAUMNg95aww4vZilAYCMUZfau
 Jv9pwp2hfEQqGgvmP/osckyAFeoDvvp22CNag5ZwEizbNKpAZ+bJiPuZq
 3YTvUPh82GwRejaUxjiytCeXNW1l4jtuB+JsgXCLChwGdrPAIygw0ydJl
 YF52vygPqLwQABtIRL+p79dYIXxGn2xbXtMgel7RIN7kskrXGt6eFVSdw A==;
X-CSE-ConnectionGUID: hTVFUOGpRKi2GOMdW6EdDg==
X-CSE-MsgGUID: YsLYvvkPRJGTIADW/9HaMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="79695461"
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; d="scan'208";a="79695461"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 09:19:18 -0700
X-CSE-ConnectionGUID: lfT0plTORlSV0ANPuLzoEg==
X-CSE-MsgGUID: 3IF5lOpWQlikjtt7PvLpKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; d="scan'208";a="236827643"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 09:19:18 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 12 May 2026 09:19:17 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 12 May 2026 09:19:17 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.46) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 12 May 2026 09:19:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nVr4fTCbwG24NZSyyEDqo6UlS5+q2a43IsWENlZALVQQzk6O3YdRiLqeD7vVS+YTkW23L59DpSI+LSW0/DM6RkSl/aqBpHqjyuPjTq/6zIIjQFv5MMVk3SLSGLkv+go2O7xb8O+BspD09jtkZufbcqHpkSehKxvcA7Tx5H5FmrtorVbrlP7pO4bwEfgUykNzBXuO+3gT5PmfnXc43fJr/LcRTL0c3R0xPqJyoNsqF570xhyxVTrj5tUC0o+5EU6fwkE+5gCmM0PoBCwg+MS6FihOYal34c0ZdAaYKPy3sBRpNukaAUqV8TEhnO3H6KNyQ3xzT0D8jIS4gOd3t6XiMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yj4p4jRG5QZLsJp9EeIFIqX29xx8pJ6viWrBlNitfxo=;
 b=hAi+IDzwt8pqBsRtk6gOneZktfLUTn5sXmvfcvu7rhKD0TZRW5ojhjRVQHtPDC3DLTgz8zxbKg+MzDz7CVnpEa7lD2gUSAp5TqIYYixSUx/yYAcBGWDtrabfGCxvD8BB3k8q9rfP6NKMiPo8ofKoTSxOEPpTy30wYF9KLONl0FNWuzT/mhNVFLloSq8t7PMI7ZDI6SSuy5G9by7RqRnvzhZWpUytr6+ox0Ra+OTIaBSCAGPiddwI6fcARfZJ2+5jIu6i0CctfjA7K/ur/DfeoAzuAKRbq7UIqpbHBSQu1R+YL24u+zrGBzQb8btR1UdnWvXzTQ138dAHsKKnjbJLUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA3PR11MB7556.namprd11.prod.outlook.com (2603:10b6:806:31f::21)
 by PH3PPF2B89F77E0.namprd11.prod.outlook.com (2603:10b6:518:1::d11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Tue, 12 May
 2026 16:19:14 +0000
Received: from SA3PR11MB7556.namprd11.prod.outlook.com
 ([fe80::3b95:cfb:be21:788c]) by SA3PR11MB7556.namprd11.prod.outlook.com
 ([fe80::3b95:cfb:be21:788c%3]) with mapi id 15.20.9891.021; Tue, 12 May 2026
 16:19:14 +0000
Message-ID: <da9a526e-4603-4446-a28d-fdcc857db771@intel.com>
Date: Tue, 12 May 2026 21:49:03 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/6] drm/xe/xe_ras: Move xe drm_ras registration
To: "Tauro, Riana" <riana.tauro@intel.com>, Raag Jadav <raag.jadav@intel.com>, 
 <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <badal.nilawar@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <mallesh.koujalagi@intel.com>, <soham.purkait@intel.com>, "Umesh Nerlige
 Ramappa" <umesh.nerlige.ramappa@intel.com>
References: <20260504065614.3832331-8-riana.tauro@intel.com>
 <20260504065614.3832331-13-riana.tauro@intel.com>
 <691a88c5-49eb-4b9c-96c7-8054b3224632@intel.com>
 <afjH2EZD9-kIH2Va@black.igk.intel.com>
 <d318ba84-db58-43f4-bb65-03d1ace29030@intel.com>
Content-Language: en-US
From: Anoop Vijay <anoop.c.vijay@intel.com>
In-Reply-To: <d318ba84-db58-43f4-bb65-03d1ace29030@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0019.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:177::16) To SA3PR11MB7556.namprd11.prod.outlook.com
 (2603:10b6:806:31f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR11MB7556:EE_|PH3PPF2B89F77E0:EE_
X-MS-Office365-Filtering-Correlation-Id: 28040100-6fbf-4eed-ad43-08deb04234fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|22082099003|18002099003|56012099003|11063799003;
X-Microsoft-Antispam-Message-Info: wWSoy0eENXznwrc7u6CV6nz9CGlJvB3Qv6mcAuD727UhnNwPmDR9g7dHOKVlBngGnQLgpOifZPoFRrL0XuLcqiIg4QVDUk330p/KTPbh/ZBVDi88n6snx6He9IBbHTMsdIo6v87+aX3pXOOOB3NVm7L/woE9QTSKSrlXSRwR/7STakRav6qOWqp1fEyFuuvLVogR8WQQyX+NggUTMqegORd+7x0PkNt18fXp7ee0BsPK60Uoj/EhMoVLIkx7bBWzhIcwfRJnO+X2z35xfJoRn8ceWFGUUkYXwhTuGfX2TYYjEhxW0TqGnHHg9zUV1yTq7Q0P/bnZQttSpURhO8u4acO0GOOyylWKbCdaoJ79pbQcODNCCAPTblH1jOeYvq3X/RpQWO9F6HuPfuCTBOQSmeNXLCepOWfey0IQ5oRHYPDXqpD7KBXOsyLJ+R3q8qTcydOoYrbZNxqVykOsOx3CotA00sMEk02tRBA8kOb90d1azJUlKvKT8JStWD9tGpT6hXG0PurS1qSLNFK1XjxAiq0Yzmf0LmKzHg0r1eYnT9Eb/asFo3LbG4sgEon6gkOQqgBMK+imr1LvGNX5aoilmZ91VB9lqNjELJb2/i/8iXU5hVM7Jum+SAqwAxoZGCtbGxmvjNO3OS8BiQxzp3CapeUOrer5UTeF9cFlF5Rqh6MKw8WwO+FjzKaXvyNNGz5Q
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB7556.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(22082099003)(18002099003)(56012099003)(11063799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Zk1CenF5SFVpekUrSFZDT1dESXZqTGg0VGVrUW94SVBUa3pvZWNROVZPTFgw?=
 =?utf-8?B?d1BkaVYzY1l4OHU2Z2Y4UGVhZmFqMUZMNWJ1bDI1RXUzWmhEcitJL1ZpaWpn?=
 =?utf-8?B?bnFWcDNSaEhiTTZtbWY5NjE1Y1ZSMHl0OURLYWh2R3oyWHJCVG9qUEFvaGZn?=
 =?utf-8?B?S2RibWFtRlA0R0tORGtEVU9SaXR5bkdnWm16NjkvckEyZ21sOTQ3cUNNSzJ3?=
 =?utf-8?B?azI4dytBMGwvbUxOT2dPWHhMdDJ5WGw0b1Z6dUZEUXFDcUZyUVZCbGtpaFhV?=
 =?utf-8?B?OSs0VmYxSmJ2NFZ0L3JySnVLcWlwaUlpWmhNT0xDSUZMR1RGeXBCdE92SC9L?=
 =?utf-8?B?MXV3cDRzMHhibXNNc0QxWTJoN2FoRUZ0aWJ2MitkZlp3VEszQ0pYN1c0Rk9J?=
 =?utf-8?B?RG9xaDV6d2VlcE5uT0JSWjIyWDBhYnE4ZHdpbHU5Sy9yMENpdDZwS1BnWTlv?=
 =?utf-8?B?ZjlNaWovd216aVIxcy9IZmZnU2xDcy9Vck0vWHFLVmI0R0VjNzJldFlSTEU3?=
 =?utf-8?B?TWNGMS8ramtBN0dhc2s4UUU4NHJTUHVwaG11NzRKRjc3SzkvbjkzQ2M2ZzFa?=
 =?utf-8?B?c0kyb1YyQXhhKzJ0QnQ2TkpBUU1BU1N3T3NKbmZJZHJwbFlUNytPbCtpWVc2?=
 =?utf-8?B?STg2REtzR3BHSnF6a05scVdqN0xQQUE0TmUvVXlDTUd0ZTU0czFGTTVYM0hB?=
 =?utf-8?B?Y3JYT3l0Z2pobENGaytPV1R2TWNObmhIRzJwMnF2YjMrN1BjbUYvbkR2NEpx?=
 =?utf-8?B?M0ZWZThSS2VXdVZ5OCtPK21KYVNpUlJzUlFzSWk1YVp2SWtTNElIV0RUa2cv?=
 =?utf-8?B?OTQweGJFeHhBMVJVMmtrM3hRUU91NDMzdE43V085M0loUHhpaDBBYjRFNmlQ?=
 =?utf-8?B?S0VWMEI2WmRIODlLT1RRa05Uak93dzZVdTdnTVZvVnEwNkYwSGJUVUF1U2pJ?=
 =?utf-8?B?YTl0YjBLbjNkb3pnbzRQMVpydnpBaGNEZkV5OXZid1lDVFhralZxbkx5SG1a?=
 =?utf-8?B?bERWYkpVMldwRE5hb0k4Z242dFNVcUlwY3YzaE11OTA4a1YrVUk3SExSVno4?=
 =?utf-8?B?L1VBaTVQdG5aOFpaVjF5YlJSYlRhRTBZU1UzaEE0YlJyVnNPZHBmdE8rOE80?=
 =?utf-8?B?RmFUN0VhdEh6ZkdKbDJXNC9VVWZIbkFzakhCNHlWTlR2a0MzdkpkTkRBTm1E?=
 =?utf-8?B?dGd3aUpIRVFmRDVKMExheVprMHpXZ0JzZ01KdDNPNVNQakd3M3VOQUV0YnZo?=
 =?utf-8?B?TjU3cks4UDUzL29TUTRPODZuNzRDWGorSnpGVG16UGFBaVdQRS9DM25nbXQr?=
 =?utf-8?B?YWdnSDVRR0pmd29lVVJxcGNiaVR1M3ByRGVFV2gyTTlqQ0pBQUhqOEJWMmlO?=
 =?utf-8?B?QkhZbkoyVEJGUmVPbm5jQWVaLzQyenhWT1o5c0h5Y3R6WldrZlUwTjZDVVpi?=
 =?utf-8?B?OWpia0Z0bURuUzdCYm5yUXpoZ3o1RlpxZ20wM0p0cDNBa05DdGdZZTNiYmpR?=
 =?utf-8?B?NnA2aFhpbVJhQTNJNG1RT2Y5SkNuQ2VXYUo4ZVhJU1pxb2ZzQjViM1pFL01G?=
 =?utf-8?B?emhwUUNleFQ0ZGdMMGd6dnA2dXVWTW5KbXJESVJreG5aZmp2NWpHSmlKQkRD?=
 =?utf-8?B?cGlLKy9yc3VkQmRpZWJJRWN2U1BHQWNqSDZ3b0tuTFB3TVNCZ0xFOVRMNXBi?=
 =?utf-8?B?VW16RWt1UDB2OFdSaHR3SmRqb1pTSGJBakd6bWJVV0xWeUlRbTRXbTVPSnhC?=
 =?utf-8?B?QVA5OTNicGlwcEtoK0wwWlBHcE5mbjlzSHF6ZWJaUXRmUENDclFFUlZDa1NO?=
 =?utf-8?B?U2JBazRySDdqTlE2QkVERVFJcEJEZ3RlYWZwZStldWEzblFOMExNV0ZTM2Na?=
 =?utf-8?B?V0QzdEw2TUVPbnNINllKMlVGSlZxc2FrNjcwaE5tbVhzRUhBQlBvUDJ5QUU1?=
 =?utf-8?B?eTh4RlpUTWM1Z1U4dVA2emFPNWo4WEE5aVN2azVLTU1Nc2tySWxWbllVaGRV?=
 =?utf-8?B?Wk1GK3hUd0JpSVYrc0kvUHl2NDZJdTMwVjFUSWNXS09DaHVlYmU1c0lQenFK?=
 =?utf-8?B?MzIyK3FnaWNjdzkwTzd0Qlc0QUcxVmVYSVprOHdPaCtBS1FDd1Z4Q2VWRTlW?=
 =?utf-8?B?U0RkREFmUG95UFY4bjh1bHJDQXVXWUhPTmhoblM5bllJRU9BOU9WTEdPbk15?=
 =?utf-8?B?RkVLY3ZFR3NKdUExamtDSEFpS0I4bHV5cFZLRXVaZWExbVpJbFl5TGpQVFAv?=
 =?utf-8?B?akRSVkJLaXVZeUpLU2VSUkl2UFZXTXRmR2R1cWM2QTBMMFB4VnB1b2VSNXI5?=
 =?utf-8?B?ZnNIOWR6c2MvU1U1N2FFTmoveFRCOFR1eDNrbUdHWmJwN2dTb0JiNGR2bTNx?=
 =?utf-8?Q?PRxzj5bfq49nNIiM=3D?=
X-Exchange-RoutingPolicyChecked: PUNSNNwtEJcNe7G4N9UoYMIdSQ1PRRSPfaF1KVg9KBzxrzzbF7nsGGnbSdDmxA795+NyH3Y3EtDzbifwgZPnnKzBYLcWkJGEq04ykHzmif/GxR/sjuVUYheIT9RRTaYQHrdVjjlAnUS4fmeK1O+o5Hx9UpAKSTQ1eKahabzbcQZs7LC5WMmoK86EpAkJH1qPIaj9makhOT/aVT9D67iY0Jsn7omdrVZsvQpXoAf6eQ1dRsuBbYd8hRxuK85GYo2AtuAbnZtpO49gJwf6+71GmjNsn3GPvE82tTp6Oanf/7kB1Ko1N+Ry1YP9OaGzuoJb4Y5VJY/4FMpkarIlk928Fw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 28040100-6fbf-4eed-ad43-08deb04234fc
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB7556.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 16:19:13.9847 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C1bIBbM0bCwZnPPoDYJKDPZtqhNHbPpEA2yAnDjiqGKZ6mu0+/yF2OvlCWcXCHBgqU4j9Z/7puf3sI+sMis4LQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF2B89F77E0
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


On 12-05-2026 10:34, Tauro, Riana wrote:
>
> On 5/4/2026 9:52 PM, Raag Jadav wrote:
>> + Michal
>>
>> On Mon, May 04, 2026 at 04:23:14PM +0530, Tauro, Riana wrote:
>>> On 5/4/2026 12:26 PM, Riana Tauro wrote:
>>>> Move xe drm_ras registration to RAS initialization flow and keep
>>>> hardware error initialization for processing errors reported
>>>> via irq.
>> ...
>>
>>>> +void xe_ras_init(struct xe_device *xe)
>>>> +{
>>>> +    int ret;
>>>> +
>>> Needs an SRIOV_VF check here. Will add it in next rev
>> Rather, reuse vf_update_device_info() (which I think also should've been
>> done for other sysctrl flags).
>
> sysctrl might have other functionality which might be applicable for VF.
> @Anoop Will sysctrl be used for any functionality in VF? Are we okay to
> disable sysctrl flag for vf?
>
> Thanks
> Riana

SoC re-mapper and sysctrl are explicitly disabled for SR‑IOV VFs.

Thanks,

Anoop

>
>> Raag
>>
>>>> +    if (xe->info.platform != XE_PVC)
>>>> +        return;
>>>> +
>>>> +    ret = xe_drm_ras_init(xe);
>>>> +    if (ret)
>>>> +        drm_err(&xe->drm, "Failed to initialize xe_drm_ras %d\n", 
>>>> ret);
>>>> +}

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19050C79FAD
	for <intel-xe@archiver.kernel.org>; Wed,  9 Sep 2026 05:23:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1D7C10E152;
	Wed,  9 Sep 2026 05:23:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OQdNegr/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 024B910E152
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Sep 2026 05:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788931401; x=1820467401;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=URBXjKhXxZX5LWtRCCzlz+WFII1geZ0XsBLx5PD0mK8=;
 b=OQdNegr/8rJURBkDKygjUJyW1ZA1H4inEf3OldL6I/y3iE4ejdrbxxOa
 JaADDJY826Pxp1FzJtrWCoOtX/2G3g4x6Z9VffOc4uZT0OeCdBCQvSz0m
 dCjS/MyXOVlxSBE5B70PxDo/nbpTMeHoZI7DGL76DvUaOtluiEQaO4+Tt
 rKeE+Fa6WaIjy3pAfa/CfJYqV5CkojSOBJX3sR4NLDYLlgTFLZ8oc4zyW
 9CJEUHl2YrY9dbp59OZk1axMf6EuuDm+7MWAg7+CJ0T5Ygr3cf5jk35lm
 FLSkQGHYUiJi3DAnhgxzZ2YMERl50sbchRgRKIMBlKr5w4jzTisFyKuhB g==;
X-CSE-ConnectionGUID: gJS7tC4GRvOQKT5d5UD5rw==
X-CSE-MsgGUID: jEV/iML1TOWlK1vJyP7ByA==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="89377326"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="89377326"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 22:23:20 -0700
X-CSE-ConnectionGUID: CDd0DGfBQc+sVfT0IJoLbw==
X-CSE-MsgGUID: pyycFdNSTGG4FVpkZpWodw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="296147977"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 22:23:20 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 8 Sep 2026 22:23:19 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 8 Sep 2026 22:23:19 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.23) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 8 Sep 2026 22:23:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NjSUa9F0YzES3Da/AhDdqJTaeSYAWx0YLLtbXssOCfPxbXCyc5zz8ebKTstFJmkWTy5yB+/rr/ysRI+7ETTM3rjdh5POtyx8HBcmSWZMBht4x8Ra5Ko//Bv/pj4JMLzeYFfpct/DqgOjHU3xp34OW9JDXaEqca4+gQEsrFU1ULt41Gzk+ZP87olljr80Ya8rlZLaEAZ797c0TGr9K1FAuDJRAwirfhF9Ketk2XRX+POKFiyL1KxhIdZOtJyEkQU+585ANZS7bsvAu3MscVd0eT0HgJ297X8PTUmGs8/D9MiUoSf4NGi9nz3waEl2BmntO2pgBEMQ0QW6mbqxDpU4dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cjwCZ9NpmV6ArcB0VNUiu3+Vak92PuvM0gtksQtxu9Y=;
 b=AVrthaJ4vfJwOA7nJKM38bDDmB8Vj0fQxKsxIhNx8dtndMPHVHrowv5UkHPJVM+h0zQe6Ilw964UI7FCjqkvqMRHQlaUxcCxiaVDQeAkCz3XyeL9JKBHjyyjU9hpcXAGSg8ifDg9Xz9ePO8TEUpW1cSjx52iFdhuxKqNuwRaQED0Y9M+3BtuiuWdi+OPCBTUgIHTTHn8ubYszQ/cUG7A3g77Z/XAIskSNy5CdLOMpb351+JOjbE0R8/90/beZnqopY+oF4osNQhQiv/7Q5ulhr4EANCfr2Ho/Fbfr7wxABcP1Btq606VsMcPF1B9jH7mhYSNPxWu/09yTdYhi7dv/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SA1PR11MB9636.namprd11.prod.outlook.com (2603:10b6:806:4dc::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Wed, 9 Sep 2026
 05:23:18 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0382.014; Wed, 9 Sep 2026
 05:23:18 +0000
Message-ID: <6f497200-200a-4b9c-9a34-be9a5950b9bc@intel.com>
Date: Wed, 9 Sep 2026 10:53:09 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] drm/xe/xe_ras: Add function to get maximum pages
 firmware can store
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <badal.nilawar@intel.com>,
 <raag.jadav@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <mallesh.koujalagi@intel.com>, <soham.purkait@intel.com>,
 <tejas.upadhyay@intel.com>
References: <20260907094706.1407436-8-riana.tauro@intel.com>
 <20260907094706.1407436-12-riana.tauro@intel.com>
 <3cd8b5ff-40e2-414d-8b41-5ca524d70775@intel.com>
 <6022bd05-ffc7-4c79-be42-265f8ab50235@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <6022bd05-ffc7-4c79-be42-265f8ab50235@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0143.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d7::10) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SA1PR11MB9636:EE_
X-MS-Office365-Filtering-Correlation-Id: 9278c98d-2226-4f43-6d02-08df0e327499
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|4143699003|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: b0Ji6C5PoXGNGdik2yPXVlxwgQ0PI71H/QQSiqQgQpy3EhPczs74/zIX6DKatg7hWcotGO+2/vunUWAN1ly3kF3233tIdLZcuSIme1yc2P1dZsD+4nKIOAXMcLZJtm6pCRjdVfzRL2Z5BX8ADSZMSPpz6KFAphngXH3p2znPSIiaM1ldflpsDXEQKqOJiIQ4YGjknuwXLNfelUFJB4ScdfwnbJBZl1DF/0/mMlc2+3qARDuQ/1PCbDBlHpLj1hMlVwhuqcWNL/bCUBLVtg1z5i7ymcgVyfGFhoTHCDZmW0FebOXY+4W9arkNk1AeBhFyiK09QZd51BANq5ZCuB2v8mEhE0L9F2Do44/68g7U7vxSkkn8xfZ0+oC7S1n8Afy56xNIiDdjLZKbdXW5ifsHKBnhZ9l86wpRd/Uq8mtZnJnxZ2/VjB5QHUgSZGnYw0rIg4Bl+e08RuLS7zHAGOpRWKLHYStc3NJRhCheA72oj+foqKFpXQEQuICSGURxCneJlg8eTFLfLscqJ7J2LDJi1yIAP7yZMKVXA753rYrgrxudyDkyWid6XamZB1lqJXgeX9jXgn845D+bMZNCYwBQROrape9lQG/D0KROCxjUFhiquLOeihhE/RU01mUJCrmcUc84Ul7TFy4cuzkOj6gdIrRtJIUGOjxUnVjgjE6zE28=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(4143699003)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OFhzSkxjdHFZWjFuc09qcFNDdU1Ra1UwWXN0R0NlTXNOTFVOamRSQVVwQnlJ?=
 =?utf-8?B?SWJuSkFhclZTTEF2clNzTXRoWHlTdTN2dnN2NUFaczd3ejNybEd5Vm1ubkRl?=
 =?utf-8?B?SEVlemxDSmQwYmFNRlVJS2Rjb2I0cVNVMWs1THBmWHk4NXZXMjVGUDZtMXBx?=
 =?utf-8?B?eXRJenFFRGVMelM3VFM4cEZycG5hYVEyZzJPUFpqa0N1bUdnQkxrMHdZdlpq?=
 =?utf-8?B?bXhkZFN5cGNYWi9rU0lnWGVWVi9JR29Za1hFUHkrWVZ3Z3V2ODhORnBnaHVG?=
 =?utf-8?B?SjFnNWo3MndQeG9zUlpXZEd3cy9qOHZXMlRyR1JDWkQ5c1hCbDh5NGRkdjYv?=
 =?utf-8?B?QlZXdjYwWWtscDdqaENKZFpibTVQR0cwRk5uUDl6THg1RHRmNVdheHRDalNa?=
 =?utf-8?B?eGNwTWdvMjUxWjdTMHVLblRQUzIzZXhkYjFPVWUwVzhPYTdBUlo5Ly9sbVNX?=
 =?utf-8?B?NldBT0xvWnA3TG1tSUU1RXZIYU1ZaGpDNVYxK0thSDRReVR3VnJxWGsremVD?=
 =?utf-8?B?aThtblM4bHJNcHVHSTlSUDJYcTlyMnU4QmdjUVdQblpnNE8xbkJnUCtBYkZD?=
 =?utf-8?B?ZllEVlQrNU1NZnJxTktHWWtxV25jQlQ2eThiSXlGL0llUVozdnczbjRCUFVj?=
 =?utf-8?B?aCsxTzROL0N4VWs3RUs2TVIzcFdCN09yb1poV2J3ZHA3M25GREtSMWs1V3VT?=
 =?utf-8?B?OEpKbGdvS2VPK0d6c3VyY3VkN0FWaVZXbjY5WmRVMkhNN2hBQldTb1FwU2R4?=
 =?utf-8?B?Rklxc0tpUlZBQ1A1V0dGZlhBUlg2cFdCcDlvK2cxaUNORE1QaTFWSDdCR2gz?=
 =?utf-8?B?TmtnM3ZkblEwb0lwZnMrYnVUTVBKUDMwc0NZU08waGZVRGtRaGVnUE1acFhD?=
 =?utf-8?B?aWZWV0I3NS9tOFdYWndDOWg5ZmlyOTcreXdkS0pNYlBGaDVzd3RMcnJWc1lG?=
 =?utf-8?B?c0J3MWdVdEt1TnVycVR3aDlyVGhhWG1lMTdyZUVpeFF1cmtvRmlpSnVqemZZ?=
 =?utf-8?B?YXU4cXE4SytXOUxqMVNGVEpIK0F6M0FONVMrbVlrWVROMmR4WEt3SWZ5YXN1?=
 =?utf-8?B?QXlYNzU5cGhsWVNCNGt5TVRqMzVvS3h3NzlYdVN0Zk1WN1B5TDhlVlRvejJR?=
 =?utf-8?B?L0xxRUVqVURhRkEvL0Y4eWdva250S014MlR0cDhWakR2NTZ4MDB2WjFLZHMw?=
 =?utf-8?B?WUgyZWdUeDJiN3B3Vnk0TmxTNEtJQ2JheG1XVTZ1WkVqQjdyTkxIQlgzZGE2?=
 =?utf-8?B?SVZDR0ZVZ2RiUElCcEY1VnFobWJxbFJ3THJDMjRhMFo4RENGUTdKL2xBWXgy?=
 =?utf-8?B?WDRpbEVjWkNDT1JUVXhUS3dCdFVWOE5JZHR4dlpBeGJvQ0ErdS9Ja0NQS2NP?=
 =?utf-8?B?c1NpY3VML1JneW03YlExMjNUZldBNTNjWlBwSENMN0xJNTk2N0RvR2pJeGJw?=
 =?utf-8?B?V0Z0c0ZPUURMLyswWkNiYnJvSlRVMHVhdUY1YXhOYmdVeHpvemlNci9UVE5D?=
 =?utf-8?B?VkZyNlJMZVVsMmhBM0ltNllhWDF3ZWgvejJyRVY4WFRXUEVqekhzTXhPV3FV?=
 =?utf-8?B?cDQrTkdabExpWjR1a1YrcTdSa0tRL1RGY0c2bFJDY0xUNzY4Znd1NDJqMFkv?=
 =?utf-8?B?d2pYRFEzcnhLbHRodktxVDBjeDFqMXpySU1rbnZRdUN1Z3A5SWw1Nk4xTFdo?=
 =?utf-8?B?b1MyWVZiYWwzNG8vbmhpWDVhMUl4M1JSdk16Y3JtWFM0cU5BR3MxSE0xRHpT?=
 =?utf-8?B?MTFZUGhKZm5YcnBMdWNLNis1b2swbnJ6SzZHd1dZbUh0N0lWMDh0Wmc3NnhF?=
 =?utf-8?B?TkFReWo2ZzRMRVRna0NLQ1p1dG9aS1N1Q2FSMkp4UlhVcUo4THRqdzAvdGJp?=
 =?utf-8?B?eDJLdU5hcnBLMFFOYkpwWjlvQllTVHFuWk1JUms3eFR5dHFuMVBoVEU2bW1I?=
 =?utf-8?B?SnNaM3lpbjZpcjNqN3NZWTRzS2Vqa2tHUHVjdkxDYzlLTndHNHQxWjA3THZh?=
 =?utf-8?B?WnZzY0padEJpRXFNenNrMkFsWTFaUmhyTTdSZGEyd21iMkhlU3drNkwvd29L?=
 =?utf-8?B?RlJQYmZLWm9mVmtVMGJOMEdtZTUwc2d2OXZvSGVGRkxkU1V3YUV3bXFGVXRl?=
 =?utf-8?B?S0lOeWdmOVdtNnZ2U1ZmTWlmMEpFbU4zalFUVXFrWnB6UnlzUlpBQUNZakZJ?=
 =?utf-8?B?QVpIdW5kc2crWWRSdG1FU1ZXUWJrZm5OWGloMjRENmM3UFU0OXpWMElGZ3Rn?=
 =?utf-8?B?aTliSnVZTGVpRzdMU3hnWHF6YWllSnFiZkp5dTRsTDlPZlZUK1NPTXp1VWdN?=
 =?utf-8?B?Q3kzd0dBYnBEd3pGZEZSdVZUcmNqTVJEdUhmN1FHYzdIMXNmUUNqdz09?=
X-Exchange-RoutingPolicyChecked: PRKk5BmoZaiZtsH9ITQYpONV4ZcwVpyqSVuAUJ++3S0ofiTJoxXF03vo6XMdw/suQTPZPUdVi+OqlbiP1J3Om6iSF9iaGTpTg1Ar+UjLP8pcxt9IPipKzO2Z3V9hBnmjayGrrnSjfeSlUL9iF4RW6Ng3VmbF9Vzfm7UDJe17KNsetMbnNKKZl1PXAdhA+ycAzdtLWNtTtjBZm9sW3pEeXaQuUeXYyb59BKRyVhqv2YkYWlYCSgJgR8KnWdtIVBKjwooe8PvZb3kFVb+hgbKmGYDBgjOlw6Mpg4gqHE85LxC40TXkuwAEssPZZ+CzG0Ijno49luctGxJvHcUMm3SNwA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9278c98d-2226-4f43-6d02-08df0e327499
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 05:23:18.1187 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BS1iMa37pTlqMzCuG7VQuiy+tcU4v/QysXNTFw50xpV/B9RHeO4BGY1mHUgzsgraS8NyBISvSRMUCOaoG6/AMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB9636
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


On 08-09-2026 00:54, Ghimiray, Himal Prasad wrote:
>
>
> On 08-09-2026 00:51, Ghimiray, Himal Prasad wrote:
>>
>>
>> On 07-09-2026 15:17, Riana Tauro wrote:
>>> Add function to get maximum number of pages that firmware can store for
>>> offline tracking. This will be used in sysfs while reporting bad pages.
>
> currently reporting in debugfs, and we might move to netlink, rectify 
> commit message.

Retained the previous version commit message by mistake.
  Will fix it with general commit message in v3. Thank you for the Rb.

Thanks
Riana

>
> With this Nit addressed. RB holds.
>
>>>
>>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_ras.c       | 4 ++++
>>>   drivers/gpu/drm/xe/xe_ras.h       | 5 +++++
>>>   drivers/gpu/drm/xe/xe_ras_types.h | 2 ++
>>>   3 files changed, 11 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
>>> index b5b0c1a3a663..7058482e32a9 100644
>>> --- a/drivers/gpu/drm/xe/xe_ras.c
>>> +++ b/drivers/gpu/drm/xe/xe_ras.c
>>> @@ -381,6 +381,7 @@ static void get_offlined_list(struct xe_device *xe)
>>>       struct xe_sysctrl_mailbox_command command = {0};
>>>       struct xe_ras_offline_list_response response = {0};
>>>       struct xe_ras_offline_list_request request = {0};
>>> +    struct xe_ras_state *state = &xe->ras.state;
>>>       u32 count = 0, total_pages = 0;
>>>       size_t rlen;
>>>       int ret, i;
>>> @@ -412,6 +413,9 @@ static void get_offlined_list(struct xe_device *xe)
>>>           for (i = 0; i < response.pages_returned && i < 
>>> XE_RAS_NUM_PAGES; i++)
>>>               handle_page_offline(xe, response.page_addresses[i], 
>>> false);
>>> +        if (!state->max_pages)
>>> +            state->max_pages = response.max_entries;
>>> +
>>>           count += response.pages_returned;
>>>           if (!response.pages_returned)
>>>               break;
>>> diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h
>>> index 6e65443cd262..c411a6cb3731 100644
>>> --- a/drivers/gpu/drm/xe/xe_ras.h
>>> +++ b/drivers/gpu/drm/xe/xe_ras.h
>>> @@ -27,4 +27,9 @@ static inline bool 
>>> xe_ras_get_disable_page_offline(struct xe_device *xe)
>>>       return xe->ras.state.disable_page_offline;
>>>   }
>>> +static inline u32 xe_ras_get_max_pages(struct xe_device *xe)
>>> +{
>>> +    return xe->ras.state.max_pages;
>>> +}
>>> +
>>>   #endif
>>> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/ 
>>> xe_ras_types.h
>>> index ca459e785add..9f23970fd5a1 100644
>>> --- a/drivers/gpu/drm/xe/xe_ras_types.h
>>> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
>>> @@ -423,5 +423,7 @@ struct xe_ras_set_health_response {
>>>   struct xe_ras_state {
>>>       /** @disable_page_offline: cached configfs policy, immutable 
>>> after init */
>>>       bool disable_page_offline;
>>> +    /** @max_pages: Total number of pages that can be stored by 
>>> firmware */
>>> +    u32 max_pages;
>>
>> LGTM
>> Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>>
>>>   };
>>>   #endif
>>
>

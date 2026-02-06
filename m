Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5EFCEE6B48
	for <intel-xe@archiver.kernel.org>; Fri,  6 Feb 2026 19:03:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2C9A10E8DB;
	Fri,  6 Feb 2026 19:03:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dZ3BHcdL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFB0710E8DB
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Feb 2026 19:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770404595; x=1801940595;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=/enSzwWy8zH7cPrili3kXogbmtOT6qdkq/fOG+WrcaA=;
 b=dZ3BHcdLMhizcCYUufB7BT9ObRkojy4ajz2usuZ6r5IUbGicDvGS2cGI
 EgnlX158p/mefC9QQZlMgJ1sACWaoSXv2nLGwgZK3wdsgbt89dqWC/xoE
 o5aw2lMp5CiXgLX8X8e3XAeC2ps/iLB3XBgc8BRXOkY9KIda2WgoxS+bg
 8n4gCgxFXaC9SgcBzi34BBjaFKowCp79w7s3pCBNHvcQvilmKEX3/mWWy
 JNJtB3E35KLNwvu/C44vjRxa6YWxR04PvJnesEcRrvisKjfaErTjFHq2G
 YKsMsDor4q4ylWdJ3buh51/7AhhUUqEvzc86SLA6jJxismL9EqKUrpnRy A==;
X-CSE-ConnectionGUID: IxzYScnHQ6WjQuSNGgz1SQ==
X-CSE-MsgGUID: 5dmmO0sTScuiAXxKjs6KIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="70632262"
X-IronPort-AV: E=Sophos;i="6.21,277,1763452800"; d="scan'208";a="70632262"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2026 11:03:14 -0800
X-CSE-ConnectionGUID: 88LBd/OiS1iBW18xJuhPBg==
X-CSE-MsgGUID: t7pqB8KjQzalwjRHhHhemg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,277,1763452800"; d="scan'208";a="241361967"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2026 11:03:10 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 6 Feb 2026 11:02:59 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 6 Feb 2026 11:02:59 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.39) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 6 Feb 2026 11:02:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l2avYB+03UYemU2jyUx3j6Az4ZpUGIYVt8d7uRwqI+uwPzWvfuVfPisCPtQ+jlGeEtMfk0WqALheeFdP7dhvrixQj4SivJ8x+IIbZN6lC3+sGZ+rNQ4r6/X5QDU1KnBJTmTVdZWKpGf0AEL+ahlExExnH4U/fSTScvQERSgA9zjcKNGC5RiuBl6nn6WvN2dRcXc7gNcBpVASqw8GuzHETdGwbvMb6JMaXGzI6r1MPBCrvzZidz0yeZIvk5VmFIKEiyMf6JmHNGVKlsmI5d/DMzDu0RYjG0b1w1mqSGvudVTLdzK0+hIW7w2lNngnL9GvONjL7bfED8iycT6uEoMNKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/enSzwWy8zH7cPrili3kXogbmtOT6qdkq/fOG+WrcaA=;
 b=B13e6Bo1qhMHXE6b1scGaZViJp28krKMai9WzWZdk7RKF5RXGSp2LDoPijm5IW/Nd1F50i6Tpi8NuDDjJGD2wqDBn5DDewD30EwgaoHzNXR68HxjcshqBdvVjMiaT6W+bnKy/vQto8988gMjgWdgJ8qlDtc+iFjwX402XoIAl+EEHIrA20iSyogT8HBvfP+sami1MG2fpqi/PKNHBlds1cEeNFifh/VN6pAGsMnNQBX9tJ4dWZwMA2sTWLPIVnugvevKCUT3cMkxrGa5ylnQxjFElA9Yybna5CQcqL8bj1HwJ8UDFk82T6P7NXfVaN58iQvxMUqfmdi1N45oJxAZIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7821.namprd11.prod.outlook.com (2603:10b6:208:3f0::22)
 by IA1PR11MB6324.namprd11.prod.outlook.com (2603:10b6:208:388::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.16; Fri, 6 Feb
 2026 19:02:55 +0000
Received: from IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::6518:db96:947d:6203]) by IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::6518:db96:947d:6203%3]) with mapi id 15.20.9587.010; Fri, 6 Feb 2026
 19:02:55 +0000
Message-ID: <c81100c1-42e9-4a44-9d6c-44150772e554@intel.com>
Date: Fri, 6 Feb 2026 11:02:52 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] drm/xe: Enable Wa_14025515070
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20260130210120.2682085-5-julia.filipchuk@intel.com>
 <20260130210120.2682085-6-julia.filipchuk@intel.com>
 <019f9fc5-5695-4b65-b39c-8de2ee278f9e@intel.com>
Content-Language: en-US
From: Julia Filipchuk <julia.filipchuk@intel.com>
Organization: Intel
In-Reply-To: <019f9fc5-5695-4b65-b39c-8de2ee278f9e@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0074.namprd04.prod.outlook.com
 (2603:10b6:303:6b::19) To IA1PR11MB7821.namprd11.prod.outlook.com
 (2603:10b6:208:3f0::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7821:EE_|IA1PR11MB6324:EE_
X-MS-Office365-Filtering-Correlation-Id: e544ba18-bab3-45dc-41fa-08de65b255d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b2hRcXB2TG83a1RIY3JCRldaK2JtODIxWUcraDFFTjFLcGZPaEpkOGxzUStT?=
 =?utf-8?B?eWdDVVF4K2M5MXAraklBWThqeVBERk5ZRFFSRk4rZWVxc0VudU9JRmdGaCs0?=
 =?utf-8?B?a3ZsanFuOVVlRFY5NUxtSVY1TnA5azdaREF6Mkx0elZjQndWdktsOW56aW9l?=
 =?utf-8?B?eHc5VjhkeHNXNkFyR0lsYkc2K3JiNFVRYm9ibGJFRGp6Y2VtelZydGdaKzBW?=
 =?utf-8?B?MlJjK3BYdnRDQXYybFhmOTE0ZjFMMHhaRExDQ2ZObDQ4Q1VSODdFWHZXcmlR?=
 =?utf-8?B?ZnFHZmJ4YUlNR0E2QTBRZ2xMZTU4dEJVU1pVMU1DTDlpOG1WT3hYaGtPYTVW?=
 =?utf-8?B?RUg2OHZLM2ZZVEI1Skw5R2ZDaU02SE93VTdIVXdTWVU0NGx1clIzWHp1blZH?=
 =?utf-8?B?ZnRuTlVJdjR3NGhMTnUySFZOSEg5dnhVWnd6RUE3djI3L2lqN2ZMQkMrSnlK?=
 =?utf-8?B?QnVPcEZsMWR3a1I1dFpuVSswL3JBQXQzSXBWWElmYTF5RTNDaExBdk5QRjRk?=
 =?utf-8?B?WEJteGFWSDdrR3J1bjF5RDMrbUQxYURGYVcwU0ZQcVNsbmYwd0tKc1kvVjZw?=
 =?utf-8?B?dUcxUmVjbWNHMjU1NVg0YWxWQnVBRHRFVGhCaGgyOFlJdFQxNU1wT2hIWmtB?=
 =?utf-8?B?OUozOU5VdkNYOFRtUHByY3FNOGRCZlVCYVRsS2RYRXNJd3ozUHhMV1J3YURu?=
 =?utf-8?B?cDNzNTZndnNDcDBLS29qMGZGazhIWWF5d2hDR2tnSWw5aWR2WEtZUk1EUVQv?=
 =?utf-8?B?M2ZSczRqQ0xFY3BQd1JwOTcrTGtXL2V4dWtOYjBYek81SFpaLzVLdnNwWTNz?=
 =?utf-8?B?d0lLSWZDU2VlNHl4WWNSSnc5S1F5eDZMcjNCOS80TG5icnRnVGNCbFJaK1d0?=
 =?utf-8?B?emY1SWJxUHVDRWdmZS9QM2hENHZRSjRuTkhUeGh5WDNMcmF6SEg0enZvbWc1?=
 =?utf-8?B?bkJrTCtoRHcvejV3c1RLNG1LWkd2cnM4MXY1b1dmbTcvRVQwbStldU1FSUtt?=
 =?utf-8?B?eWhCeldpbHdxQnRIdjBMMTcxMEpLZWowZUVBZm82Q2RZRDZBTmpSbUsxUTkx?=
 =?utf-8?B?OURCd2M5ZTllbGhucFlkYjhaT1ZRd0xwaUVNTVh1YTYrQzRsSGJYT0R3TWo2?=
 =?utf-8?B?OFVuK0xRVWZURFBzWnpPY0JRQUZIVTh6eXdrc3hNVi92VW5UM3BuTHNrQ05X?=
 =?utf-8?B?Vi9xa0daZ3lCZWVwUU9sNXVjUkVLRkx3MWU2bkoxYlJmQnppa3dScGNBcEx3?=
 =?utf-8?B?TXhGVlZFMytqQzRWWkhmU0EvSWxUY2l2b0JNYlp0dFNLeitONEx1RGorTE0x?=
 =?utf-8?B?bDJSTnVkUmtZb0t3emlja1drM2ZGbHpnekNyQzhzNnhkMk9kYmhraFk5RzlC?=
 =?utf-8?B?SDM3ZlZkeFQyQ1lxZlhSSWR6NkZFUTNhdWkyb0JnMG9LbVgvb1EyMlBXTDF6?=
 =?utf-8?B?dk5GWnFNakZXcHUwek83eTM1eEtLcmJEZVF4bFc4T1pqbnNjQXhucmtDSW9I?=
 =?utf-8?B?TXZPcGVlaUE2Ui9ZdGhqbGJqc0hScXoxaDZXOXJUTGFvbXVaVW8ySmJ1d2ty?=
 =?utf-8?B?VzVSZnFiU3RwMlphMGg1TUhiM3ZKOFFQMzJZZU8rUGI4VFNuOXBVL3B5Q0kv?=
 =?utf-8?B?OHJwZlVHakdiaStIQWVVdktxSFczWEt5ZmVYWmtuTmdFUlY5ak1ReEFKRUVn?=
 =?utf-8?B?bFQxU3REZDV6ZGYrSm1iVnAvZlhHWGRpY0RzZ1g4azZaR0E5YkE4RTdhdmlS?=
 =?utf-8?B?OXhsV3BLbXllRXBZWktweUpuMmdOa01lbGg3Tlg4TUdISTFoR0xGVER4b3Bx?=
 =?utf-8?B?NTdJNThpbGR4K3VMalhadHJudEpsRitlTG5mdUs3V0Z4YVVkNHFtRUZ1bW5k?=
 =?utf-8?B?VHh2a0dOOTZLUmFtbXg5QnIvZ25GRkVtbGcvenZZOXZWTklRQm83UkduMmc3?=
 =?utf-8?B?dTBKM3NyMTlHckxoMjd0b1psTTBlSmNYL3RLYlNKUU51NnloSkxrenBlTjcw?=
 =?utf-8?B?bUYzbFkyWTZ0SVVtUzl0QzY0WkJIYkUwR2JsQ1RVT3B2Z2FuTHJJV3VSN3M3?=
 =?utf-8?B?RjNKdStOQm5sd1pFMTd6c201eGZwMDMzSkRkemlvWEx1VnpvTXhQK3ZUZWRF?=
 =?utf-8?Q?tPes=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7821.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S2lqNzVVbVNOWFVSNWlES0M5REhoY0VFdmE5QnN6R3k2RzhPWU9UUW1admM1?=
 =?utf-8?B?ekRoYlUyVHR0SmhKazVEZnhRQ1dkbjhLTGVNc1FvdFJLcStKdDg5dWxaQldX?=
 =?utf-8?B?U25qWm5BWkZtVGloK3RsdFYzMFhNQ3FYTmV6aGs2VC80cTVoTjdIeTE1Q2NF?=
 =?utf-8?B?MnEyVUdFM1dQTlEvNHFjWWpkbjJIOVNJTmdiYU1oTnZKUkdSTmRFOGpBc1ZO?=
 =?utf-8?B?Z2JhbjZFYWVFSm8rMzhlNHdpRTE3S1RUeFFHRWI1eUtKV3hMcjlXem4wKzF4?=
 =?utf-8?B?ZmdFMTF3TjRWM0lncTRTejBLYThmOXZZZTk5aVlxeENDTkxkSHJiTU1WVE5N?=
 =?utf-8?B?VTZVTkNxVzVLSlhMM2RYZ1BxR1I2bFRYVktqQjFjbG5zTkJ6Y29YOWZJcSsx?=
 =?utf-8?B?VkpuSCtlL2trek5RNXF6Rm13clFYSEdjVWlrcS9YbytHN21lZ1REdkhoNGY4?=
 =?utf-8?B?WnNjbmY2TXNqbzNuNGhyWVZoRG5tS1F3b1VndHYvTVZYTjZ0ZTlDMW1BT0p4?=
 =?utf-8?B?SlNsS3JnR1BiQUw3Q3VkVkZIU3lFejExVXRHS296Y0ljclRzQXpibVRyNHNO?=
 =?utf-8?B?UDE5dllxYWxkY3FxRXN1VHA4UjJNRTNsZlNSVlExUzQ0YThPam9YcDdWc1dq?=
 =?utf-8?B?a3lJYWxML0phYXVWaDVhVEhOTDQ4VTNXODVmUVVHZ21WS0xtdnBWRU80bGpK?=
 =?utf-8?B?a0JiQ21rMWF0WTRJNkMwWm9YSnJkNTFHbElqSFl3ZUF4VDNJUU4yczhPZjNw?=
 =?utf-8?B?b3ZkL04wWWZLdG9XaTNBUnVsVGpVQkNzRnRzSStEU0w2YU1BOGMzVnVqcXJS?=
 =?utf-8?B?eDR6N0wxRWFMUzZRRkpUc2R2d0lRbDd6TmNXMGhMNzNpd0lVTVcxWU9KT3Qx?=
 =?utf-8?B?aXVubUFtNjhkcXFiMGN2RGNGWSs5a0Y3L3NaSnM5V0R0STByL21xTU1lL0Yw?=
 =?utf-8?B?Y3F3d05nY3A2aTNzZUJIem1mczVSM1dtWFVHU0J1V2ZaNjF2YWtNUGVYQ0Jv?=
 =?utf-8?B?UEJVdWdSYldtM1RHZzUzTDNLU0h3ZktiZkpQSkFtN2Ezazd5aVBPTEJ2cTZi?=
 =?utf-8?B?ZFBmQkUwZjVYZFBNWmdIN2xtYkhQSTVIUUxRV2dKZW5NeVVLakVLMTZueDNR?=
 =?utf-8?B?MTI1MVAyam1pNUo4U2gvU2YwdWpZRDkybWtMeFhVN2xnUGhlRUlpWloreTNI?=
 =?utf-8?B?c05WdkxmdVVJMVpnWmpOdHhTdjJNZzhQUXRkU1Ryek56b0UzcFFIVjk2TGNZ?=
 =?utf-8?B?enRFbUlNaHJhVGNWSFFrWjUrc0pSWkVCNCtYMkg1eUtiWStmK1NnTzBwc2FG?=
 =?utf-8?B?Y1d2aDJ1amlWYXgzMTBPQUFya0ZHNjNLYUVxMGVmcEdjM3FRZTRBSkE5TEVL?=
 =?utf-8?B?VGYyWkZ6M2I5SGhNWExqMnZodCtZTTEvYWhLRVIyQkZ1T0dUV3VMV09FUW1F?=
 =?utf-8?B?SEVFenJRT0dOZlNzZUJKd0VwUnI0dEdRZWVyb0w5WE9weEVaODBSSXJEcnN0?=
 =?utf-8?B?a2VzTkNsa2VBUTIyaHZHaGVaMjk2dEtQbk5TTTdCUGJVUXJxOUl4bjFKcTRD?=
 =?utf-8?B?VnJOY2VkSTdtMkYxeFpSdFRRdGhMb2M2WVNZT2k2eXRvbXZoSHNhcmszaUda?=
 =?utf-8?B?MmI0aHg1NitkV25USS9lMDVZcEpTMXBnT0kwVmJqTkpYSFpEdnM2ZnZvY09J?=
 =?utf-8?B?elBqQmlaL2FuOUdBRHZPMHZaWkd1VmNkNDQ4RFlJWTM2MFlPU3lhL0Y4TUhi?=
 =?utf-8?B?TTJ4L0ZnS2JaSC9GdUMrajlKc1dTWDZ0MEVBZnRZSzl4ZzRwVmsxTWcvNFdl?=
 =?utf-8?B?RkZIUlZ2ckVLMGwxVG5YK2x0OStWQjNQZHBNN29DZTNZU2ZLSHUzK2h2c3NO?=
 =?utf-8?B?ZGF0QS9rKzhhMGQvQUVmQ0Q0RWpHMjBxcXIwQlJIWU9NN1lVRVpsZUtMbVFC?=
 =?utf-8?B?RER2dWUxVG9SSDVVYXZiWFRGSUNMZXNXc1Z4bnROY0xIaExkbEkzOFFqYVMx?=
 =?utf-8?B?a0FYVHVCS3piMDRxVVpUZ2dzbWdHM05aeHc2Lyt3NzlENFVZRU50aEh2eWVx?=
 =?utf-8?B?MjRjS3dyeXBsa1hlZGE5VlQ4NU1Xa0JWdTRzdkxGdlVHRDIxVzc0WGVlS2xM?=
 =?utf-8?B?NlFTcnA2L1BCWWRzY0NvUzZ2UTZBdHZSaXhiYUwwRjlzOTY4ZkZiUVVxNmEv?=
 =?utf-8?B?cHc5Rzk3Qlg1aFJHZDNEbENiVGplYWdTeXRWZkdSRmgyWHVidUNmWk5tSFhY?=
 =?utf-8?B?UUY3ZFpjbkcxTmd5aG15T3Z1WUZjbXdDSWxtMjMxOFc0dnJPVU4vN3BiNW5T?=
 =?utf-8?B?M2pRQy96TXFyZjl5azBzZVJOcnAwYjZSMVVLa3R5dWU1Mzk3SEF1aG8xS1dJ?=
 =?utf-8?Q?fKHI7gb3t7EH5Sy4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e544ba18-bab3-45dc-41fa-08de65b255d1
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7821.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 19:02:55.2582 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /UgfRzJlRWxDT+3aAMpSuP7z+ouLCXzPtH3GVKQvX45iBO9CDXkLEb7Az/8ZHq++NlaYhSSm/hpZ7I1QfwlneXkSL1qG7bIIMHe8B/5iNd8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6324
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

On 2/2/2026 5:02 PM, Daniele Ceraolo Spurio wrote:
> Maybe we could try to make this define a bit shorter? something like:
> GUC_WA_KLV_CLR_CS_INDIRECT_RING_STATE_IF_IDLE_AT_CTX_REG
Shorter KVL enum name now: GUC_WA_KLV_CLR_CS_INDIRECT_RING_STATE_IF_IDLE_AT_CTX_REG


> With v70.53.+ I can't understand if you mean "70.53 or newer" or "70.53.*"
> (although both mean the same thing). Maybe just v70.53+ would be clearer?
> Also, shortening some of the words should make this fit within the 100 char
> limit, e.g. "indirect ring state requires a WA present in GuC v70.53+"
Using shorter, clearer suggestions.




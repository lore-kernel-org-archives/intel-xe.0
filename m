Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDBED606A319
	for <intel-xe@archiver.kernel.org>; Fri, 23 Oct 2026 05:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iO8feWB6
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DC2810E545;
	Fri, 23 Oct 2026 05:34:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B19D410E545
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Oct 2026 05:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792733684; x=1824269684;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=JYa97L6hjA2TyrYKvYCQBNWWLbOetsrrqmEwtuv4TqY=;
 b=iO8feWB63CTjFKTlGBogYqP1pyfIU/EI8tdOaYk04wB3UHRoTZKcf/2m
 5eKCfJkm5NhlA0FoYLm7d5gigCcvfAlw1EDF+w3MSy2EmvT/+3dyDHfmL
 EuN6bHz4+N7Yis+9MKMvwjxJmTMUyMDQroQjWIP+VG851GHTrJkr2Afq8
 tGQNkEwhJ6JeqhgzYHE5ZcfLy/WANrG5C889Su8wm/PUuthwEnRykuqsg
 Flv1b3Gn9GDcsu8VLw1iw3AddUURiUOp3eG3PyR9DakT3uspFTmxoRp2t
 gbOipsUx/YuAAVi0GkRGYsQv+iqfwa25xDrYLMyDKhgaBJLll2J2WklQD g==;
X-CSE-ConnectionGUID: 19ogr2zIQaWST9TcyjlTIQ==
X-CSE-MsgGUID: +7cOZhDdSRy8nU172ar1Mw==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="1393839"
X-IronPort-AV: E=Sophos;i="6.27,173,1787036400"; 
   d="scan'208";a="1393839"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 22:34:11 -0700
X-CSE-ConnectionGUID: kP98AVFhRPm6M1F/2Rp7kw==
X-CSE-MsgGUID: gHk7od9tRkSxiL/TigcthQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,173,1787036400"; 
   d="scan'208";a="4026968"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 22:34:11 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 22 Oct 2026 22:34:10 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 22 Oct 2026 22:34:10 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.1) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 22 Oct 2026 22:34:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZpnRlVW6vXntwCc5VMRe50CiiK+XXceAQc4Sv0ahQ2LOdze/gAy6G3csr+b8/8EEe5UfNAeO7Zq5UsfNsa+ValqSpJ7ece3zKEwqmJRS+5pw7eahUEgrY5WvuYCM711OMO5t9HeG3Zvv0yGNrH6v6x1VBDDyc7w2Dv2Uubbykb2Pvn87Tu9lExiRvENRPfPCuGmrMXU963GfRW3UkRU2IT7WhG8Ww/oKZrV7bzxigJ/LLljcMSbR3s6m0jEsgOCtSM2JhIUtVL3ubMyKrsoaA827Q+XQ+yWIaWKYbLa9sZTPu45o8769PDV23XBfF0y5zCAZW4ssO+wz/j5esKVrxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=78T9qpBE1roVDmwre9DPHZUBhxkV2ecTSW3Hwx/UyIg=;
 b=OiuUxoK+9o13SIVS33xDgsi7HYx6J45EU/HUau08PGO/UTBsrgKygnXoEIElmaAIu76KBbG2VmCgj/KcTZK6dLlgLChdtQT4dD5uhRAOIMnhlpG2McjQ8qatKsy0E/DTcXe2pIwLsWcTbR5JozVPSqq1PFh7vJyjeNNwsVGXR67X+UKclw1j7gQWNLHbI3DPrdPbrJdFWu2B6bDj1d62Xna2QVQD+OwaloHY4YR09If8XVbOsd7z7ifEOQrQlyxKqnyegWx9hAb9KP7yAGfGPUART3S8bUe+leD8zmwWKCqURO5ffl01sdh0/m6VYHnlfPytMZTJc08K6cy+dSUS2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 PH3PPF73E424DB7.namprd11.prod.outlook.com (2603:10b6:518:1::d2e) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.16; Fri, 23 Oct
 2026 05:33:57 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0546.016; Fri, 23 Oct 2026
 05:33:57 +0000
Message-ID: <7a1417ab-b7b3-4fe9-ad90-98b293732106@intel.com>
Date: Fri, 23 Oct 2026 11:03:50 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] drm/xe: Access GT MMIO after pcode init
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Karthik Poosa <karthik.poosa@intel.com>
References: <20261020173943.669600-5-vinay.belgaumkar@intel.com>
 <20261020173943.669600-7-vinay.belgaumkar@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <20261020173943.669600-7-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0162.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1cf::17) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|PH3PPF73E424DB7:EE_
X-MS-Office365-Filtering-Correlation-Id: 06d1c064-e7ef-4cd8-f154-08df30c73b98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|261022105027099003|56012099006|261022075727099003|4143699003|11063799006|261009223027099003|10067099003|261021121427099003|261021123027099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: GJvQ0qcQJ4V+E9ychX/wAEXJpeagDj+jbTnDIk8YjU8O3mTNUft9N8CLgRCUsk0WRgXUIuuhNxzHPMYNSrxPW1Yw1nI92hkaIn790IHYteRBo+q1xu4vgPf41AH1XyeWmRC3D0R1GbeunzPxGyAM5Uz3uGXhbnON6dbcinGhUqjR1NhQpxZcAePADmx2ULcNrLFkNqDU916afDDBm4iyF3KTWe0s9itiIEoXI4ZzAPpSrQds1vMny+CS8FXyFgIp0SjNE6ZnfqL8D3ZGgisnhTIV8pPBDD9nSStNjYi6NlkGXCYduGGVNFHDLjznljc+9lCSDwwHW9qVmxJMMCmLm08Z0lUz2hpB1VFDfMA/7PjZOJdaFTdif8ONk2KM5l/UiKV9aRg8bqOz4IbbRs4ID03SmH/FNr4946JdC5HGCc/lPjspc3JTl4Zm7XjLQ5KTkIG0KQSnIE7++5DMI7S5Qf8lEHc7xb2ZQm3qL+6em6pJwBUB9l79f2MOwsjSmfVUcwiekYbdsRjdghvLKdxUgesB8elVoRs2JTnh1SAFZKLwQjaaGButOpltPbZ+vrE7vn4lbgUSQov5NrZfQn8ntEzPR9dALoqIoa3ZpfYp/mOiYIRYaDPHleKLHFyQzSAYZwLJt6ridRe80bH0FJL06nYvH6eSQn4+U08skeqfaZk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(261022105027099003)(56012099006)(261022075727099003)(4143699003)(11063799006)(261009223027099003)(10067099003)(261021121427099003)(261021123027099003)(18002099003)(22082099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WXJ6VWFpK1QvSEVPWnFidVhSNjRGeVdvTmVpUDhCNUgxRDBBcXcxRzBoWVlv?=
 =?utf-8?B?ejBCWjlvdndCOXhLL1htU09yZTg5RE5uenk0dXJFb3pvTGVLcitiUmJkK0hy?=
 =?utf-8?B?VzF2dzQwclg4cDd4anpPZVBNdFZ0SzhVblcxQTFpckQxUjErUHZROXVGbWVF?=
 =?utf-8?B?ckNMUUVZUWJSOWJYVlUzc09iSHhNUnQzTnB1ckNxcW9qa0srRlAxYUpDQWh2?=
 =?utf-8?B?Q2JXc21NTklsNWUvL3VJbWRUSk1ob2ppcm5SRlZuUGdRdDNxQVRGai8rcnN5?=
 =?utf-8?B?ZkVjSXpUSnlTT3lEckU5Tjl4OEZJa0tqLzdxVDRieHdRd3VFUVo3eEMxYWVR?=
 =?utf-8?B?Zkx5MHNNQ3JuZFdUM1lhcTZiVE5hbzBPbTJEekN4UTdCSkRlcDNURjAxSGxO?=
 =?utf-8?B?MU1kWEFjeVVocXlNNU9LcUF2VmtUaC83TUZURXZkc0paVFB0dWpySFBNUlV1?=
 =?utf-8?B?RDl1L0FyQWVKek5kcmNQQXg4eEZmMnlqOTlGWVhPOGNFOVFYdFJFeWMwUU50?=
 =?utf-8?B?TUIxakw0dUZ3ZmVVWmcrWTRvSWV4M3dwamREZmtHYkdVTXNDdVRyWVVRTHZF?=
 =?utf-8?B?Q3hPRmZMSzRubmJUM3dtWkhjUnZ5Qzd2ZGppNmsrRW1vQXpGVmNIMmVEanlP?=
 =?utf-8?B?b25oNmJqcUNJYlhNRkNnTXpRMDlXUm1NSDZYdmJqODk3N2hZdFRWR0ppQWZI?=
 =?utf-8?B?YllwMjRmR2lQTHV1T0k4NW9mdnlPaGVrNEhUTG9kbEJLa2pmSVBZN01VMUFM?=
 =?utf-8?B?aDVERU41WktBa1pUbWZzNzN3U2NoOWpCcUpxa2tnQjJnYXhIM3RWZjBTMXNF?=
 =?utf-8?B?ZFNJL0lWT29uaXVwTW5JckpPdldJcTlwNTFTeXhMNUNHY0luekhHYlBkTyt4?=
 =?utf-8?B?dnM0RWVGNTVWbXZNRzVBVmR5RUVsSEdYbHlXSm5NSkVnemZRQzlyZHhmTGJr?=
 =?utf-8?B?V2c5MFNWanByYlNPR3M2cmwxdTE2NXdCd3VidkhuNFBaNERJRlJBZGNvOUgy?=
 =?utf-8?B?S0xvRUs4WEcvRUUrZ0dMdVA2SE5tMm1KdWNZV2dsMGFYc2VjdW5kTGZmKzJE?=
 =?utf-8?B?OEF5N3lNVEh4TElqUldPbFdhOWFwMVl5U2hkS0ExTEhNMVNQOXJYS2Q1MWFy?=
 =?utf-8?B?VFJydlJ5S0ZrYWwvVnFYWDFKK2lNaVJnTndtMkNvRnVqcmlkalJFditvQzEw?=
 =?utf-8?B?elJpeVlKOVBpbzZZS2ZaYUR2T0J6cnEyZVBRWUM3SHZGdC9YUVJ0MVhiYUhk?=
 =?utf-8?B?M3lJRnZHekdsMWFseFYvYW9weEdnY205Zjh2cTVxUlNqdGJ2QW03RWw3dC80?=
 =?utf-8?B?ODhwREZ2NGJNU1BmQ0prN0U4VTdjYmVKQWVCMnA5NkpjZTdSVEhua2V5U2tB?=
 =?utf-8?B?STlvV1p4VlVtY0lGd2NKbVcvNUltSXM4by9QZXFXSnZaU1Zzd2FDMXVzKzc1?=
 =?utf-8?B?ZlBaS2dNRVNSQ2lQbmNWSnpyM1AzYmE5aEtWUldOYjRoWjZuSmlRNlZKSXlP?=
 =?utf-8?B?SUdoQThnd2IyVDNCUkdzTVE0d3F3ZmY0U0FxMmQwWVhWVEwyeGdPbi96c0ZE?=
 =?utf-8?B?V2RuYlUzU0lITG5PMzkwQmh0dGZQUmc3a3lUdFJLemY1ZkRBaG1rVXBnbngy?=
 =?utf-8?B?NHlQQm12WFZxRXZ6QWRpWVo1T0RwdEl6K0dpYTZaT2ZLbUxHdXp5ZFJ4VERU?=
 =?utf-8?B?cXJ1aFloNU9hamRiTThYOCtXSFVCT2htNjF3dkJzOHgwNWhORkh0aHhzUDhv?=
 =?utf-8?B?ZmJESTNwVUtLMk1EdEswbXpyZXA5NGJiMXJqSUtVQW5TUjE2N3pSOFhQU3pE?=
 =?utf-8?B?RWRpZVltYnY2S0o4SGsrU2dGaEVFQTVpRFk1Wm1ZbG8rZFV0VkdVeFRKQXkx?=
 =?utf-8?B?Ni9vVUcwSkRWb2hjdlFGM005bWpjcThTR1RXV2JuaUt0b0hJcDY3MTZJSjdB?=
 =?utf-8?B?eVhINEVza3Rpc1Fhc2lubm00eVNtU24rdU40Z0hTd0o2a2ZEbUFWSlg2aVhD?=
 =?utf-8?B?dUpPcDZmRlJuVXpKdkF0ZEhUSDl4TDBxVkREYVFSK0tqYXBjZkJ4UXplN3NF?=
 =?utf-8?B?YkhEcUhiUXhpSG93enFuMnZSU2J0YXV4VElsMFpIN2gxU0dweVlIMElMY0Jn?=
 =?utf-8?B?V2x2T0FHMTVYTVlRbVBlSGNHSEJzdHJNQ1RMVVhvYzJiZ0ZpdzdhSWJoUW51?=
 =?utf-8?B?WE9UVWxpZ21ncGlnL3ZUZDIvSVJYSXBNV2t3TW02S29VR3dobEw1MHRET2x6?=
 =?utf-8?B?Y1VVRklhdjc3cnFKTXhveHdPQml6RXhCbzRmTk9oOUxOVmZPUGg3VEgvU0Jz?=
 =?utf-8?B?WXNIY2hla3pmMXgwTmlWZjRUUmxJbmFVSU5PYVZvNVlYVHA1d3dRdz09?=
X-Exchange-RoutingPolicyChecked: dfXvJ3j1HrhjhOEpp+112zTo236v6ZTAAnKdnD/4zpc8DopWb+reUIV870nfkaP6rNb4wsxXf1Y7Wo1pV5L5chl7cAO45NK5R/1z57uoBiMOkxNkW8tK4jE5Ot8/cuDZZWd/ksxEKnzZd9u9WhQfFItF7FlZ4cczJip04yZ/ONx2cdB/qLkAHTeD7VHx+hAcS7tyGexKjslCSqHQNp4OWHxeZUBgCwioADBi0/q78xjRM9t+SgtguhiOg31PetzgB9224yiMYyC9QErI/js0eysUpKuaqR8cgI0bVFuy4sFrg4cM5MbDZZ8p18f9Wn0zZ2ozAkF99mPcy3SHXVnucw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 06d1c064-e7ef-4cd8-f154-08df30c73b98
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 05:33:56.9861 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YoN7pOlfew8FhMxxI3f68BJV5lF/Awa9yXkgsQBMaOcJ1b2GzOWRdoxYGK09+WJ4BJqlBn0jzQ0TDojZfQ5WMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF73E424DB7
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

Hi Vinay

On 20-10-2026 23:09, Vinay Belgaumkar wrote:
> Allow pcode initialization to complete before we start poking around
> the GT MMIO space during resume as these accesses go through sgunit.
> We do write to MMIO registers in xe_wa_apply_tile_workarounds(), but
> those are in uncore space. Those accesses remain viable even during
> d3cold suspend.
>
> v2: Clarify about xe_wa_apply_tile_workarounds (Karthik Poosa)
>
> Cc: Karthik Poosa <karthik.poosa@intel.com>
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_pm.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index daa7ba2df317..1f5097875bcd 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -241,9 +241,6 @@ int xe_pm_resume(struct xe_device *xe)
>   	drm_dbg(&xe->drm, "Resuming device\n");
>   	trace_xe_pm_resume(xe, __builtin_return_address(0));
>   
> -	for_each_gt(gt, xe, id)
> -		xe_gt_idle_disable_c6(gt);
> -
>   	for_each_tile(tile, xe, id)
>   		xe_wa_apply_tile_workarounds(tile);

Currently we are not accessing any gt mmio in this function. Do we need 
this function before device is ready.
To avoid any other additions causing the same issue, can we move this 
after pcode init and add a comment .

Thanks
Riana

>   
> @@ -251,6 +248,9 @@ int xe_pm_resume(struct xe_device *xe)
>   	if (err)
>   		return err;
>   
> +	for_each_gt(gt, xe, id)
> +		xe_gt_idle_disable_c6(gt);
> +
>   	xe_display_pm_resume_early(xe);
>   
>   	/*
> @@ -698,13 +698,13 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>   	xe_rpm_lockmap_acquire(xe);
>   
>   	if (xe->d3cold.allowed) {
> -		for_each_gt(gt, xe, id)
> -			xe_gt_idle_disable_c6(gt);
> -
>   		err = xe_pcode_ready(xe, true);
>   		if (err)
>   			goto out;
>   
> +		for_each_gt(gt, xe, id)
> +			xe_gt_idle_disable_c6(gt);
> +
>   		xe_display_pm_resume_early(xe);
>   
>   		/*

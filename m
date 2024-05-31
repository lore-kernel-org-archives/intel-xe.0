Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D06FFC25B75
	for <intel-xe@archiver.kernel.org>; Fri, 31 May 2024 13:56:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ECFF10E1E9;
	Fri, 31 May 2024 13:56:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L03sr23u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB77410E1E9
 for <intel-xe@lists.freedesktop.org>; Fri, 31 May 2024 13:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717163807; x=1748699807;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=VaoiHvbXULQL6H1CiQ8yF67vZk43P4Jy5c1gmvL1mKY=;
 b=L03sr23uG/rzJ19qW1cXzmjJ4Uyl5w/LPDyNNDTVR/ZohN7ONaZ8+2dW
 2WKNbVkzozRNQGx/MAUSWDZIXWKNqLAoLvUDinTxEgbfIchHCVAR6okJF
 dv5mscoFqXpi9e+pbvHTR9TGXIGI19msSMgIoEy/aPPxyO7W1lDCfI0zO
 /i3e27IBBLItRmzYQ/1iKdKa/Y5qohmMC7JM8fCXNByieZ3ZDkbOkK1bU
 nxo5+a8kPdthPSSC447eP+7psfFxRAuFxMylFI7AZ/77XhOFFRCGTqVCe
 8ajQhndYheG6BuEFjrtjeqRoK05bEfiICNdDjQ7sJ+zGEjRoHNs2fL8NI w==;
X-CSE-ConnectionGUID: 3Hu+FegVRrKyIoFAlj8ptg==
X-CSE-MsgGUID: 1Ey8HigAToe6K/SVdASNYw==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="13828204"
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; d="scan'208,217";a="13828204"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2024 06:56:46 -0700
X-CSE-ConnectionGUID: UeugeVDvTKK+dZwO9UsuBw==
X-CSE-MsgGUID: kNOUXXMzTGyJV9N1A3XRIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; d="scan'208,217";a="40720135"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 May 2024 06:56:45 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 31 May 2024 06:56:44 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 31 May 2024 06:56:44 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 31 May 2024 06:56:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FpVlfpnYJEKL3QxfRvS20FlOWKvb4zhik9G3OpupvJZLMjT7WU9zBuxZe//cgwGk95Thceq9LDRlk+CaA6ysqke6QTzmm5r4i1jMRTWE91eM2ck0vYeCiLz+a/IF7EZGUyleHO9uP3+jURnP2/PMBYQHF9ZA4z8YyYUpT7a78rcGq5bKXNjHxjqcFL7meNX6Z2Npt+oidpGBpvLoslT34ahSduMGYAXO4TUQSCU3yJLqyxpoatsXvTsuLR5TvbBQ9QK6AsZwcwbVkele9SpYGfQjqyo/2ZE5+oZXRPNSOcttx/x3ac6EdHonJCUQpQwnNZAicjGx2hSScEKHudLd7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BP7/RvU8BLzXBDbKu99/zdnbh33oYVL8aUCyqF5p12o=;
 b=YzUkxyQj+SWwfRxP0aMjMGE9piZSWSDUue71RqEOWEzQmRPr6yee+6AO3AcLGyq0PLGnhRAHTJKKW8K9GoIbkt6GwmtxDHEDuPLZ+U0qAKRL3qd21vxGWx2C/ie4wZ7eUd/rwnXM6dCg/oqQCCUv6nWFZFojpQAOoBEbqaAZaQXLHyde2eE/VD0Mp343RIrKzbd+sFMobLzKXByH708cz7JQ0D2slZTWw8Jg/uNEcW8koY2pxktX0oA7enNfOMxeuhyFa4ulcizWPwFjX0Cnl4q8yqKi65+ij6sydCR4U2BN1jxjUlYiKnd4nRibJVSJUS6XdW1R/Xnwwek3TXog6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by CH3PR11MB8361.namprd11.prod.outlook.com (2603:10b6:610:172::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35; Fri, 31 May
 2024 13:56:42 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%5]) with mapi id 15.20.7611.030; Fri, 31 May 2024
 13:56:42 +0000
Content-Type: multipart/alternative;
 boundary="------------UHpQuS8cmcqZV5ux7PgZMSiA"
Message-ID: <41051b48-6217-46d2-afca-ba3d11c61daa@intel.com>
Date: Fri, 31 May 2024 19:26:33 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe: Fix xe_force_wake_assert_held for enum
 XE_FORCEWAKE_ALL
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Badal Nilawar <badal.nilawar@intel.com>
References: <20240531064845.930740-1-himal.prasad.ghimiray@intel.com>
 <20240531064845.930740-2-himal.prasad.ghimiray@intel.com>
 <ZlnOVvmtsrWS80Ff@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <ZlnOVvmtsrWS80Ff@intel.com>
X-ClientProxiedBy: MA0PR01CA0121.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::11) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|CH3PR11MB8361:EE_
X-MS-Office365-Filtering-Correlation-Id: 151fb13e-5ad4-469e-44c1-08dc81798068
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N0tBY2puRGs1NVFodHROQ2hQbkZZd0piMDFjMGt0NGJlMnhoSGs1M1VoSHN3?=
 =?utf-8?B?QWtTdFhibHhKS0NUOUNVM2tjQW84QnF6bWNjL1J4N0oyZ0xtSHpMcUxGeGtC?=
 =?utf-8?B?c1JoTEFkUEp1bThmNVUxNE8rZnFvSHZEMEIvNHFLalpmRE1HYkNUNlJqT21J?=
 =?utf-8?B?T3RZZFVaaEJOb0VTYVFidXQyTzJKMUt6RnplaXNSRmxsMnViV2c4cVBxZFhE?=
 =?utf-8?B?SVdtNTkyZE0xNDRnM3l4MWZUdW5ETmo5U0ZvNUlhNTBPbWZNS2ZCR2VWWG1I?=
 =?utf-8?B?RVhKYXUyY2xBVTh0MHNubmFqSEltaXlZNFBKWHVrdVNVZFE5TTNWR1RZdVdv?=
 =?utf-8?B?dUhZSGErRVVFZ2ROemUxUUZNQjhLNGVIZFA2blJTVXNWY05vZS9LTEg1RWpp?=
 =?utf-8?B?dTNBc2J5Mm56eFYwdjVFUDhWcEV4bkJyallUcFJtczRrOUNCWVljclhFRHo1?=
 =?utf-8?B?MzhUbkhkaFhWdlZxaTZ4bUlvLzhTWXhqVzVINXQ2Rnc3OEZQZUYxWmFPMmRh?=
 =?utf-8?B?S0Y3N1dxbjdxemo4R0xXV3FEQzFkRXBVekMvVHdiWCtlOVg0VDlxenUxRElq?=
 =?utf-8?B?MGVzdFAwZjdTcmVYL3FVdmxQYXZmNG1JL2Q1MW5UT1Q3MzgrUFFyY1NZZU84?=
 =?utf-8?B?SHE4VnA0N0xXWFhDR1htM1Fia1NOWThjVVEwcVEyV0pURFd6aHl3UW1tb3k4?=
 =?utf-8?B?U1pwNEx5U0xXUTdTNkoxcEplcTNpTHZUVld0YmJLemlna2ljUTBuYjR1U2J6?=
 =?utf-8?B?ZXpHWi9NWGhHTGhNckpSa01OdU5sR1BYTm02L1BJSlZMWTl6NUEyYm9ldW9y?=
 =?utf-8?B?VHBJanZ0OEQvcFpsMEMwUU02eVZVdTA4bEJFNExWWmNjdmg3T0Y4OHBCaDZB?=
 =?utf-8?B?Ni90SWd0ZmFjV01qbEdvTkRheFh2cGlwMHFjNmNJOTloQktLTmQwREtLbFFz?=
 =?utf-8?B?M2ExajJXSHFMYkpmNVBOVlFEbVRELyt1TFhhUEhXTVpYajNEY0cwNzk5cjlN?=
 =?utf-8?B?SDRPb2ZONE1QbUpLeHdON3BtVUczS3RBQzh4TGt0enFyaUlFWndBSnlLa21Y?=
 =?utf-8?B?MUhlSUtLMzU1ZmdjakNlUnhwRzRENnZVdmEwcmN0blV6Q1IzdDNpYi84REU1?=
 =?utf-8?B?ZnpiR2ZuQ2lDVnpJcUFjUnpUaHBFaUFPU0I4RXVHOTZ1VnVqQVhocWN1Tm1W?=
 =?utf-8?B?TTNVUVZBME4ySW1OVUhpek5EWGZSak1EbURQYlVMYmhrNGlMSXJUREdkR1lT?=
 =?utf-8?B?eGVoeTNBYlpsTW9tV2tNajlhK1hxZVZ0VGU5dXVCNTQzTVozYk9lV29aeFJy?=
 =?utf-8?B?SU9PaEJGWE9BakluTHJOWDBTQ3E0eUd3OHJ2NU0xU1l3Z0pRWUhhLzEwZ043?=
 =?utf-8?B?Zld2azJXZGJCY3FkNFFDZlVHdG1Pci9hZnkwMUVocXdiSFhJT0xlSWJqd0pq?=
 =?utf-8?B?ZUo1UzlvNzhObUJjc3NnREtuRUQ0djNPdmloMG95NEpDQUN4UTIvU2FsRTI0?=
 =?utf-8?B?TFQ1T3VLcUFJUi9ZeEc2cE1iM2pjcCtpV0VCVkxxODN4aTBJTm9xL3FtQmpm?=
 =?utf-8?B?QkJxRk40VEJOaXZLeHhmY0pUUG9KWGoyU1VQa2IxQXFXK3prQ3MzKzJHK1h5?=
 =?utf-8?B?ZzZheFhzMElUdFgvQlBVbzRlSUU3Qzlsd3ErYTYwQ3FScW1Tc045bFNDVTlL?=
 =?utf-8?B?UWFUcHZPY051S3BWZktGMGp1dUdyMCtZSkhhb3dDdkVTZW83alNjdTBBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Vlp6QlZZOE55Nm5aTUxNTVlWcy9GbUZBR3JFaEZud3hQUEZPRmtabGlMQjdm?=
 =?utf-8?B?aWhqQ3VUbEs2VzlWbGxLcVd0dlpKbERkdzRKaU1CdnhINUczK082SVlFSVVS?=
 =?utf-8?B?Sjc2ZHNyQkdWdHN6b1RDalhVWGZKNVloUXFsTW1vODVFOVBlbWk4YXZvRWgy?=
 =?utf-8?B?RDhhNS92b3ZnbEhramU0QUJzeWhCd3dUR2IvVjg1N0cxOVZ0dW53Z3QzQ3hT?=
 =?utf-8?B?MldYZU9PbnJXN0VvSEJJa0VUbDRDR21yM3pYbGhWSitSd0F0U1NvdkJ1S2gw?=
 =?utf-8?B?NGdVSHRielZEUXZDQ1NkdWk2a01UNjIwMFMzUU9sOGdrRXJsTFpCTVUvMFhR?=
 =?utf-8?B?R201bG92akptZnh4alVOZWNZS1RlQk5xaWxYbFQ3Q2NiNVVNajhzR1hNY1ZG?=
 =?utf-8?B?NVBWelM5emdRVGZjemJXcG5wSHBlMDhIWDNmZ1d5QWtNaW1kNFpFNEh4azZ0?=
 =?utf-8?B?Rkl4TmdtZDBEaGZHV3BBZEdhRm5XaXNSMEh6ZzNhNHJ1emZYZWswcmpsK1pD?=
 =?utf-8?B?TmdRbjhKWndlOUwrTFNxc1R4SDVpOXNvQVAvbm1ieEMxTGp2eG10YlJqZmRH?=
 =?utf-8?B?Ti94Vm83WXRXZ3NtMEFZUXhSa01PVFhSdDlMZ1FKMTVTVXlEYnA3RytSZjlv?=
 =?utf-8?B?dDVVZmdHL0dmMWpORVNNVG1uanhpRjNLcWN5dk5qRm9qb2FZdXhhT1JRZ2k5?=
 =?utf-8?B?QzFSVjNCZzhFcnU5QnJuenQrNHdRVysxVldSeDRvTGN0eXNaTksrenFMdUNn?=
 =?utf-8?B?WnZMMUcycnEzV3N2eTVsUVJnTTZ6ZHpMNFhrejlpUjhsK3N1K1NHN3g2TVJv?=
 =?utf-8?B?SVlqbFJOKzlQUmtzK2JXcytPUFJMUGRWSkVCNklBUE11ZkNZNXlBbzBDVnRh?=
 =?utf-8?B?LzZkRVdWNlUyRzlhZjdnSXBHYTM1bXBjNmZ5NTNPaTBqbzh1eFFKUUNYdlBK?=
 =?utf-8?B?N1RndjZHSjNKcFpnMXdLbGxrU2ZmSnpsOFNqdE5oeE0xT3AzVUJTOGwyN1g4?=
 =?utf-8?B?RndCZmZxdkZDd0gwdU9IM2Yyb3duYnUxVk9vY1orYldaKzZUUTduNnNrVlEz?=
 =?utf-8?B?MHc5WFkwT0JmcUZhU0ZjZ3BTYU9iMHQxTFdDSy90UG1ydjcrZWZVTHc1cGhq?=
 =?utf-8?B?RHY2ZXlHbytZWWZkSVY2VGovWFB1bmR6Y1lSU0Y1TnhqT1BCN1BDMkxvZnh6?=
 =?utf-8?B?QzgyM21JWTd1enZvQTVINVI5UjJQSkhFdm5HaUlOcTJBUTJYVHRsYWM4VEdy?=
 =?utf-8?B?MnA2NW5RTG1VWFFxcnRqK3p1djhKMjE3R0dOZ0tNWmFjcy90bGNuZG1kUFVp?=
 =?utf-8?B?UUxrZVJQU2tBSVFSdkp0dXAyVWN1MHhEVWY5RmxVVmRHend2QkpPendhRUhr?=
 =?utf-8?B?eHhPbkJUaTl4K3FNRlZ0RGJ2T1ZHc05IMkhlQVc4NithZFZQUkhyWTFrZG1s?=
 =?utf-8?B?dDhaTXBwdWVhcmZZdHRMZEVvQmNsMXJmZGFHcm12MFJYNVAzSWp2eDVVQUVh?=
 =?utf-8?B?eUVOcHBQWHN1TkgzdzhNMUxsY1d4ZGJyd21rSDhOZTdCZG1VK3VSNlNiMlRt?=
 =?utf-8?B?Y3JnSml6WVM5YzkyMmx5R2djM2pnRUVuQ3RMWng2RFMzUXBJRjNGdFc4VjM5?=
 =?utf-8?B?aGFxa2hzN3ZMQmZLbE4wUHJhZUVrM0lBbUIzQ1dGd291eHNvMVdSQnBEZ1hZ?=
 =?utf-8?B?dTdGZ1lFY3ltZHFzSkZNNTA5YVBWU1RpMFF3aC9Eb3ppeVAzeUN4SnFudlBN?=
 =?utf-8?B?VHd6bDdjdTdOL0piVXZYczlqalRJdWRKSDA3QkZUSFlqSkoyY0RUZ3ZSYzRV?=
 =?utf-8?B?bWw0MG8zV1ZBNWpoNHJQVkR3eTBCQkRLNEtUZHlkSWtFd0g3QXowQmVJOEIz?=
 =?utf-8?B?QVVDWnY4bnlIZlRrdGdENTAwcEo5R0p1c0NZdGdVQTJsVlh1ZlBOTjFWWW5i?=
 =?utf-8?B?VFkva1duM2x5MHk5RlNIZ0s3V0lWbnVYYm96QlNjK2R1aEpTekdER011bWFS?=
 =?utf-8?B?bFYxTk9UdjlxSXpLQUs1TkxTU1lhNXhsVm9OMnd6RHJxV2tqS3RlZVdNdzVs?=
 =?utf-8?B?U2F6ZkNCdXVyakVGK25hSTJZR21tRXpVWDIrUVRQMEJ6RHFZL0FYQXh0S0Ux?=
 =?utf-8?B?Z3pJZFVWblQ4VlJJeDNxNDBES0V0bGJpcWVYb2ZWNVBnZFBGZlNkeWkvYnVq?=
 =?utf-8?Q?Ri9rcHKIuGJAcHkostTEPWs=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 151fb13e-5ad4-469e-44c1-08dc81798068
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2024 13:56:42.8343 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QwGPAEXdk2IS3RjyAtsjiift6h9xr1bF8go5ZDURhgOGoKqikHPhD/CzRHDX9l2QgTKZ7xqJPU3QrN9fQCjgCnMEYcv85qSasgWj2voXe8M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8361
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

--------------UHpQuS8cmcqZV5ux7PgZMSiA
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 31-05-2024 18:49, Rodrigo Vivi wrote:
> On Fri, May 31, 2024 at 12:18:45PM +0530, Himal Prasad Ghimiray wrote:
>> Make sure that the assertion condition covers the wakefulness of all
>> supported domains for XE_FORCEWAKE_ALL.
> The most important part is missing here: why? what issue are we trying to solve?

Hi Rodrigo,

AFAIU,  xe_force_wake_assert_held is designed to trigger an assertion if 
the provided domain is not awake, which works correctly for individual 
domains. However, the assertion condition becomes incorrect for 
XE_FORCEWAKE_ALL.

For instance, if we assume all domains are in sleep mode, invoking 
|xe_force_wake_get(fw, XE_FORCEWAKE_GT)| will only awaken the "gt" 
domain. Subsequently, another function needs that all domains are awake 
and utilizes |xe_force_wake_assert_held(fw, XE_FORCEWAKE_ALL)|.

In this scenario, the condition will inaccurately return success because 
|fw->awake_domains| (0x1) & |XE_FORCEWAKE_ALL| (0xFF) will still be 0x1 
and Ideally it should have asserted.

>
>> Cc: Rodrigo Vivi<rodrigo.vivi@intel.com>
>> Cc: Badal Nilawar<badal.nilawar@intel.com>
>> Signed-off-by: Himal Prasad Ghimiray<himal.prasad.ghimiray@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_force_wake.h | 7 ++++++-
>>   1 file changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/xe/xe_force_wake.h
>> index 83cb157da7cc..4c986d72cba7 100644
>> --- a/drivers/gpu/drm/xe/xe_force_wake.h
>> +++ b/drivers/gpu/drm/xe/xe_force_wake.h
>> @@ -32,7 +32,12 @@ static inline void
>>   xe_force_wake_assert_held(struct xe_force_wake *fw,
>>   			  enum xe_force_wake_domains domain)
>>   {
>> -	xe_gt_assert(fw->gt, fw->awake_domains & domain);
>> +	enum xe_force_wake_domains is_awake;
>> +
>> +	is_awake = (domain == XE_FORCEWAKE_ALL) ?
>> +		    fw->supported_domains : domain;
>> +
>> +	xe_gt_assert(fw->gt, (fw->awake_domains & is_awake) == is_awake);
>>   }
>>   
>>   #endif
>> -- 
>> 2.25.1
>>
--------------UHpQuS8cmcqZV5ux7PgZMSiA
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 31-05-2024 18:49, Rodrigo Vivi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:ZlnOVvmtsrWS80Ff@intel.com">
      <pre class="moz-quote-pre" wrap="">On Fri, May 31, 2024 at 12:18:45PM +0530, Himal Prasad Ghimiray wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Make sure that the assertion condition covers the wakefulness of all
supported domains for XE_FORCEWAKE_ALL.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
The most important part is missing here: why? what issue are we trying to solve?</pre>
    </blockquote>
    <p>Hi Rodrigo,</p>
    AFAIU,&nbsp; xe_force_wake_assert_held is designed to trigger an
    assertion if the provided domain is not awake, which works correctly
    for individual domains. However, the assertion condition becomes
    incorrect for XE_FORCEWAKE_ALL.
    <p>For instance, if we assume all domains are in sleep mode,
      invoking <code>xe_force_wake_get(fw, XE_FORCEWAKE_GT)</code> will
      only awaken the &quot;gt&quot; domain. Subsequently, another function needs
      that all domains are awake and utilizes <code>xe_force_wake_assert_held(fw,
        XE_FORCEWAKE_ALL)</code>.</p>
    <p>In this scenario, the condition will inaccurately return success
      because <code>fw-&gt;awake_domains</code> (0x1) &amp; <code>XE_FORCEWAKE_ALL</code>
      (0xFF) will still be 0x1 and Ideally it should have asserted.<br>
    </p>
    <blockquote type="cite" cite="mid:ZlnOVvmtsrWS80Ff@intel.com">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
Cc: Rodrigo Vivi <a class="moz-txt-link-rfc2396E" href="mailto:rodrigo.vivi@intel.com">&lt;rodrigo.vivi@intel.com&gt;</a>
Cc: Badal Nilawar <a class="moz-txt-link-rfc2396E" href="mailto:badal.nilawar@intel.com">&lt;badal.nilawar@intel.com&gt;</a>
Signed-off-by: Himal Prasad Ghimiray <a class="moz-txt-link-rfc2396E" href="mailto:himal.prasad.ghimiray@intel.com">&lt;himal.prasad.ghimiray@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_force_wake.h | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/xe/xe_force_wake.h
index 83cb157da7cc..4c986d72cba7 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.h
+++ b/drivers/gpu/drm/xe/xe_force_wake.h
@@ -32,7 +32,12 @@ static inline void
 xe_force_wake_assert_held(struct xe_force_wake *fw,
 			  enum xe_force_wake_domains domain)
 {
-	xe_gt_assert(fw-&gt;gt, fw-&gt;awake_domains &amp; domain);
+	enum xe_force_wake_domains is_awake;
+
+	is_awake = (domain == XE_FORCEWAKE_ALL) ?
+		    fw-&gt;supported_domains : domain;
+
+	xe_gt_assert(fw-&gt;gt, (fw-&gt;awake_domains &amp; is_awake) == is_awake);
 }
 
 #endif
-- 
2.25.1

</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------UHpQuS8cmcqZV5ux7PgZMSiA--

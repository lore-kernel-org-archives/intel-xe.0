Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 791ADC4345F
	for <intel-xe@archiver.kernel.org>; Fri, 26 Apr 2024 15:52:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F04410E3C3;
	Fri, 26 Apr 2024 15:52:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UG3Obpzv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 174FF10E3C3
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Apr 2024 15:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714146760; x=1745682760;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=5tKnbKlHBMeEbkNvVBrRk9dITfjNoPVXCUetHZNCn+I=;
 b=UG3ObpzvileKACW76Ol6NQAYSTmXZ72gFuaZMMU7AdheyP6EC9fHIb7W
 +5eb+uqavmMLsLP5djaskc9OfUesgImJl8rd+6jdro8BOUm8N9j8/01xU
 zwIw3xA6oJOXY8vZmuMZ7xCHAUkAmxz2FHsSl3iBDLOTUzjtAlz8EAFXz
 nnbD24MoWhrPcUIvZMLpsbXJ2isLtzozeYledzfUvdSHbPSEDqkYp0j3q
 jPQrYp55GjWElBq95FCJ1h6zmPq91YpH4sFpcmwTKWlUt8hRFCQuPM/EH
 cfH5R86yqdEXOQU+HhtrFi/nAVKZRVBj5vRovgWj6S95hfT7g08AliAER w==;
X-CSE-ConnectionGUID: 1dijslTaS4uAYfasVlHQxA==
X-CSE-MsgGUID: yZcaFryVRi2FeoJCGZtndQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="10100743"
X-IronPort-AV: E=Sophos;i="6.07,233,1708416000"; d="scan'208";a="10100743"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 08:52:25 -0700
X-CSE-ConnectionGUID: 2UCUYt11TIuRExlf5b8WXA==
X-CSE-MsgGUID: N6iP9IV+SUG3RK1fsaxPUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,233,1708416000"; d="scan'208";a="25486419"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Apr 2024 08:52:24 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 26 Apr 2024 08:52:23 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 26 Apr 2024 08:52:23 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 26 Apr 2024 08:52:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cOSJRBYJm6T6kjgzh79wl1kkDdBj2uInpExYfk98mhtd/RlITnMXaOgmFo57c2PYy4GD9JWrqfiLpZ2ILe0mKvqJUgOs2kjg4juFdB4kzS+OyMg+gdrntNLjVTxzCppT5MvaRfSVw2XyxHZ3I+KIj6goF4eHoH0pa7l4pibeaO8iMQBtgaaKtPl5KWImpG68Sg7OZ+zykRhZMkr9LvqNbqvPeiindXAWD0MWri/zA2KZSLT9/aSkyVw4v+qzcNZ585K43sj9FH2CqeToweKC2CRKF6rB2lq8OkN1guLUY6kJvJ5xklP/OFbgnxMzZKQODxEYQySr3Li9WxfCBIqGaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=12nDqz5o3wqzfa0Qoj9GKUgkeJ30EMfCCZNojM15MgQ=;
 b=mGm7GJmH0d5UtgVjUXpDBfOCwf39TqWIlBWLi52WYSGOYuYlv4suL8o10W8uCpJuA+Ad+pjqB0oY9ZPiJiBZ266fdJ/E2BWJhvLYmL6LupAGvgehzHk5RCbwecsqcDh6QhloM4r+M6XfFqeyN/KHACkqF/BnVMlR3YYFILvLlkcsy1a8gJlTICB4FAoTufM/CBIv5utyVerkUPeKnLjJTq13p6YbfDyI75RnBoeiQfbhslRXkB6Utlz7q93psNdY9pknr1ajwR+9yptg7j6ZD4vYvl5NJXjpFCwtxCZUrEqLYRsvVH+oE3fgSAtL75ZfpLcFdniM21RkfpBldbP/6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by PH7PR11MB6793.namprd11.prod.outlook.com (2603:10b6:510:1b7::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.22; Fri, 26 Apr
 2024 15:52:21 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::3718:5daf:6e25:6127]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::3718:5daf:6e25:6127%4]) with mapi id 15.20.7519.023; Fri, 26 Apr 2024
 15:52:21 +0000
Message-ID: <72455dcc-00aa-4f30-b98c-3fbc79156a59@intel.com>
Date: Fri, 26 Apr 2024 08:52:19 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] drm/xe: Move xe_gt_init_early() where it belongs
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, <michal.winiarski@intel.com>,
 <matthew.brost@intel.com>
References: <20240425182410.2705061-1-lucas.demarchi@intel.com>
 <20240425182410.2705061-4-lucas.demarchi@intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <20240425182410.2705061-4-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0281.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::16) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|PH7PR11MB6793:EE_
X-MS-Office365-Filtering-Correlation-Id: 4819c840-75f7-4c74-725f-08dc6608dbce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dlBDc2g0ajAycEk4SWI2YlRNd3E0SERwSFNPMXFWQ0hzbldLZUxsdVpDVHdr?=
 =?utf-8?B?SkVsYzdUc0JEakJvTXVzMkl2bkxBQlJQQ2I1d0RlTndsY2M1cy9mSURjSi9F?=
 =?utf-8?B?dXdnT2IzMXl6c1BudTErL3QwY2hMbE5tUU8vNzJpRWZoRXNZVzVxclkzWlpa?=
 =?utf-8?B?WGhCVXhCdkkzd0pOb2diNWQxTGdEbXdTWXUvNUxwemtIQnkrQ3JyckJTdGhs?=
 =?utf-8?B?QVZES1dnblJKVjhXQzlYQUd6UFJZeXc4OFZXRGFRcGtLRXVkcmNUbXFZU1J2?=
 =?utf-8?B?cDV3NTdFM2lxakZuT1o2bFBXSVlNeUR4Y1B5UkRhQi8wajM5YW13czlLRFdx?=
 =?utf-8?B?alFCOGN5c2sxUHdadWJueURzbjBPakdLdkJOMG9GNGZwYkJWMXUrdFFHUDlJ?=
 =?utf-8?B?RlFzOWxsTys3KzJkY01SMmV3VExHZ2k3TVpxakNCNlNvMk9rWkZPY3NwcWZv?=
 =?utf-8?B?V2F0eTdJd3VEQlhIcVZsc3F2Y3hqQU1nQXpHTk96ZVZCNU5pc2t5RWgwdnc2?=
 =?utf-8?B?WHpCcVJiNXpmejN2L25hMW4xZzhXcTFycjJIUkVGT0lqQnQ4NU5kVDZYRysr?=
 =?utf-8?B?bnNjc2FUUHV0S3ZHMU5KRi9OaEZkeVh5NUJuZTZOa3dzRlNIMUp4OEE0NjBx?=
 =?utf-8?B?OGZDOXlUb2FOd1A2OTBXWWtKUGcwaERvNEpVUkZZeDJJT3hYRm5hQVhYVVht?=
 =?utf-8?B?QlZqSnJrcjUrUkM4ZHJxMlRFQjU5aHEyOWZxZmN4aXVpMzhVUTJRV1RWOVFF?=
 =?utf-8?B?Y1BzbmF3UGtiZXEycTB1K2psSy9lUTlMZXRRK0ZTRUh4ZzMrM1V5QlJ0aFhn?=
 =?utf-8?B?c1FOMzJBTXlkb0p5NXJkdVNVT29waUx4aDhQR1BkUUNmMFR6Vk9POXdXRGxY?=
 =?utf-8?B?a0RLSGJHTGp3WS9Jb1VKWk9nbWtMZG8rVzE2WWJ0YmFCRDFvSEVlQUJ0eEtj?=
 =?utf-8?B?cStpbXBvQWNkY1d1ZlFaSTdQZzlCZGJQbDMwejI5bERnZy9GMWpSRjIwUkdD?=
 =?utf-8?B?Yk91MlQrdElNckdFRXRyQk1Ob1pnMkJEYmxwQmpIaWl1YW5KRk1uQmhIREk2?=
 =?utf-8?B?OEgxK2VjV3RjejZXekp6a1lMQmRtWm9pWi9HZXlwSmJ5SDl3aFpPdWtvcmEw?=
 =?utf-8?B?UDlBclZVcGlneUlWQ2tpU25ZdzJLYkpGZFBjTnIyOU1HRHg5aGxVOGF6bE9m?=
 =?utf-8?B?MTRmRWdYU282WHpZMWR2YytZaTE4eUkyMldtMHB3Q0xQV0VtMkFQMFhuaEpY?=
 =?utf-8?B?bWU5RnVVMDgyOXlPenFsbEp4NmcyTFAxUGNQNjhJTDRqWmdoOE5Pcmpld0Na?=
 =?utf-8?B?ZVVHM2ROOXpjdXdQV2NhYVViY0hhQjV0dWlzeXc3K3NIMUh6NjhmaGxDRUtX?=
 =?utf-8?B?dk9Qd3FZaE1FVy9aUkE4SEdVR0pxbzd6bU9iMHBpcDM1QVpndS9aVFdrdzdu?=
 =?utf-8?B?RG10QndERDZIM0JKdUdzbjdYUDllTHU5elVKZkFTZ0ZEZG4wRExBSkhzQjE5?=
 =?utf-8?B?TzhXZTRmQ2JaRkRXSmxsZHBydnE0YldUWDFXZEVOcUkwSE9wQldEdmxXSFMz?=
 =?utf-8?B?M3lJK0NIdUlkMThrN0J5c3BQY043aTN2UVFuUVNEOXJ2RDRkYzVWN21jUHJu?=
 =?utf-8?B?cDVYc1lvTnVBOFBtQ284UUF0YkwwUkgzRjdocERlNHVJUFdPaDZ5VWFPYXQx?=
 =?utf-8?B?cFBrRTgxeVB6SWFFNkw2Z1VId0VhWkZQZGVLeUhVK3BMOTNzRENQYmFBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MFEyK2VBQW5ac2NRenJuWndMa2EwQ0lzRHprRXl1dFMrL0VPRDlIZm1RRE5l?=
 =?utf-8?B?K21QQ1FuL0tERmRlNE5JdU05ZmdGZkUyU3dXcWZuSnR5b3gxa1JHelJuUEFx?=
 =?utf-8?B?SW9id1JIUEFFUUlQbHo0ZjlPV0EzcnFQS1BPcVY0K0o1RXRxa0h3Q2xobmdn?=
 =?utf-8?B?NjdzMjBnRTNPTkt0VlhKa2V6a1J1OXM5bjdlZ2ZIc2M3VnZ6blhSRzYwZkFi?=
 =?utf-8?B?aVBGZ0c1RVBwRTY3WFZodFlyRGV0V0lnVWRDRmFRTEJLTlQrbE9sUkhkdUNH?=
 =?utf-8?B?OWlyVDZndU1RVmJvT3hnbmQyM0xVc1JJMmtHSVAzU3VYdFB3UmFDNDVXQ0lY?=
 =?utf-8?B?ZEYxTlpPc3JqMEFocGI0MzlydkdXaUFaQ2lFTlVVaUo4dEJlVmNxa1V1Nm1q?=
 =?utf-8?B?eUkzME8yU2REZTJtNWpIR1NVSENqeUJNd1ZMRnp6V1QrTnZaZ3RTcmlxdzB0?=
 =?utf-8?B?eXhvOEkxam91Z28ydmhIK1Zia1hmMkV0WU1UZXFVRUJHQkhBODNuRittaVph?=
 =?utf-8?B?Z2VoNjFXenVkWWlBeGtPemczOUttU1Y1OW9vMVF3ZDVieGE0OUFtZ0t6Nm0w?=
 =?utf-8?B?ZnVRTktiM1gxY05OTUxIOGdDUDIwblNlUlkydXpDaWlCbGdlYVBTcTNPUXV2?=
 =?utf-8?B?MTJZZ1dCWG1JVDdxSmFIaUdlbXdFMTQ4a3k0N1NDZVNBRGszR3NSRUFha0w1?=
 =?utf-8?B?bDBKSC9IdHdVTFBybVQwUXZ2WXJFcUpUVWNqSDA4RytKUFJ4UzBJbzNmcFY4?=
 =?utf-8?B?MHZWdUsrUDAxNmd4WGtTTHZUdWJvbFlKbDBYMW9ra1ZDUTRIUEtjckZrQ3hR?=
 =?utf-8?B?cFJ2OSt2UmNiMzc0UlRyMXBxcmQxdGNMUE1KTWNYVUZQN01LQTNCSk01STQ3?=
 =?utf-8?B?YVBIQyt3N2gzUEQ2TkJoY08xSEd3MFl0cDBTeE1FT3dsdDRoL3ArVjJNV3NL?=
 =?utf-8?B?T2ZLbmpldWlDbStPMmdRTUN5Tm1aWlU3d0hIVUtoMWdNcTZOSXMwdVJKWkw4?=
 =?utf-8?B?MDk1Rk84ZVBJSzQzMmRILzN2dFBJVVI3MndSbTZIMlhJOStRQUdlSUF0Ums1?=
 =?utf-8?B?MnVJTU9jTHNVbnA1aU9razdoQnQ3dTUxY0puZVdFYm9NRUlZQ3dIV2RGbWw0?=
 =?utf-8?B?Vi9iRHV1ellXWXBvYzVZaXRURVpYWXcvajZVc0NsM2xMZGZmR0NoKzJGU1JR?=
 =?utf-8?B?T1BRNExNSmlvM1ZFUDhOc1BHS1RnZDdtaU9MUVdZa3EyWDMyaG9BcURubDcw?=
 =?utf-8?B?clNRWS9iNWg3cjJOcU5OTjRhUTYvUFBjR0JqRDYvMnFWcUFOR1NxRmdEbU5p?=
 =?utf-8?B?OS9KekJRdGlmMXJXSHpXZHI4RDZWa3MxTnlreFp6cW9OZWpYcVVNSXJ3SFlG?=
 =?utf-8?B?aFhsK0VhU1NJZ3NkNnpsc3VPR2NHT2hrZCtXREh3MlRTbGJVclg5TEFoV3NM?=
 =?utf-8?B?UHNKQVFqWEtSdWVCSVhhaFJCaFF3YnM2b3JNQnFaS1Q4NWNLeXRwd3hPT0Fm?=
 =?utf-8?B?L1F1bHBFSVh2MmlrbVlLZW8zbWc2VHlyTmMzMFVmdS9mZ283M2Z1MTdTZUVH?=
 =?utf-8?B?TzlWSWxnaEo0S0JyYUc2bzBCYW56V1pMYlRqQVI1RDRmY2NreHJBWC9WV0sw?=
 =?utf-8?B?eVJncDROT2h5TnRkRStGbkpYbEZRQ3RVa2JsZHI0S2JoN3N2bTRpcHhYVjJm?=
 =?utf-8?B?TjBaOGpTcTlBRVQ5NWpGREZIeEhwOEk0WnhSMGwwSmsxMmVTS2JHVmVURlVK?=
 =?utf-8?B?ZWdsRUdRc1l0NmJsNElIamI2LzB0VTlRVGsrejhSVVZJVlB6NWF5OVNKY3cr?=
 =?utf-8?B?NnhXNjdRWGw0OXJPTjVuMkFTT3RPU2ltREV4NkRXWDZuU0JCczZkNkRoR09Z?=
 =?utf-8?B?VmtGK0x1NTU1M0NHeDBpSHVnUWZWcnB6bUxTM1JNcTYva01YQ09HWW03OHlY?=
 =?utf-8?B?a2lZcGpQQnFQVW41NlZsN0U3Q3QxZzFoMUJmcFhpODI0UFhqaVBTOS91S0ZT?=
 =?utf-8?B?c1BSYU5qd3lnWXV5UWJaSmFuNFN6cjZ1cnp6S0swalU0NExGak5kZ042NEJJ?=
 =?utf-8?B?bU9zZGNvc0Jpb3FOWE0vOXdndkhUWWRYT3o2blNvSHNkMVhSdHp6bW80Y09a?=
 =?utf-8?B?ZUE4ZzdaNEI5TWRWdEFkeHAxbDNna1B6eCtORndDV1N3MHNOazRvU01xMHlU?=
 =?utf-8?B?bEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4819c840-75f7-4c74-725f-08dc6608dbce
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2024 15:52:21.5471 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mc82Npii3B8ZNo2CQLN0GHgN+id3jOyIfFicUF/bQVx/LBCuoqpHZiySqIqzwiE2T5zjSiQAJFJh4p+Dz/aArJ74WQXkhW7wStU2aSRVkbM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6793
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


On 4/25/2024 11:24 AM, Lucas De Marchi wrote:
> Early shall be early enough, stop doing other things with gt before it.
> Now that xe_gt_init_early() doesn't need forcewake and doesn't depend on
> the fake engine_mask initialization, move it where it belongs: it
> doesn't need to be after hwconfig config anymore.

LGTM,

Reviewed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_device.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index bb4fbae5edb6..8d04283b3617 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -566,6 +566,12 @@ int xe_device_probe(struct xe_device *xe)
>   
>   	xe_ttm_sys_mgr_init(xe);
>   
> +	for_each_gt(gt, xe, id) {
> +		err = xe_gt_init_early(gt);
> +		if (err)
> +			return err;
> +	}
> +
>   	for_each_gt(gt, xe, id)
>   		xe_force_wake_init_gt(gt, gt_to_fw(gt));
>   
> @@ -604,12 +610,6 @@ int xe_device_probe(struct xe_device *xe)
>   	if (err)
>   		goto err;
>   
> -	for_each_gt(gt, xe, id) {
> -		err = xe_gt_init_early(gt);
> -		if (err)
> -			goto err_irq_shutdown;
> -	}
> -
>   	err = xe_device_set_has_flat_ccs(xe);
>   	if (err)
>   		goto err_irq_shutdown;

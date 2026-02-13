Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE22CEDF165
	for <intel-xe@archiver.kernel.org>; Fri, 13 Feb 2026 13:57:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B053510E2F1;
	Fri, 13 Feb 2026 13:57:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AXtzS6/l";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8528D10E2F1
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Feb 2026 13:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770991061; x=1802527061;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=uC5AdfSpCpGORvwUyfemlL0EMhbZyYg5ZjHDw0YmhZM=;
 b=AXtzS6/lZkGFl0ov7bXhZ9wWY5hwsXfMLuItmC4XhP/T1aPXOK0Z9SpJ
 lZ2BPzaEY2ilu145nJXrfwLRss4nCckrZPM3uJwc+BZTeUal1aqSrBbEG
 syuIb+6JhWzderpSf3c14KCEQYMCK2KZdujKr+m/0eDAQGZi199U+OUP1
 heV7fKPxq/pD/EZ6OCXIrGQYuMdMHcN9CUpkAusc975swlAEfKtX/i6PY
 sh7AkACc2+ShW4qmM1vMsR0yWw6ns0hFr7SpdXdGD+JC+mWJ3OJhOYp7t
 MCvDt7pyP4ftI3Qd23jU0xVrrfJ5z0FZL1qlRGZPOfbJJT3HcrNbAB/27 g==;
X-CSE-ConnectionGUID: ITkFqBqCRTuFpPP2ahryVA==
X-CSE-MsgGUID: rileqyi3RKincEqBLRwUAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11700"; a="89587498"
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; d="scan'208";a="89587498"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 05:57:41 -0800
X-CSE-ConnectionGUID: tijAky91RZ60vG1kQn9hLQ==
X-CSE-MsgGUID: bMPgejH9Tnq/wjrqMkdVzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; d="scan'208";a="242338356"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 05:57:41 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 13 Feb 2026 05:57:40 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 13 Feb 2026 05:57:40 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.50) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 13 Feb 2026 05:57:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ai0pLZKh6+ENj4uWnW6pw1XF+bM9lxA10wcHTJlqWS5l/blU9fZ4Oa+D+sd928AtrJ25i0XqhklAYboi0BJ6IunX2AagEep2s6SIRArR1mQ1kt9LoQoaKc5aWHhPCvLYFNh4POxGi8XG9JVvSgdlqi2R5nDZh/e9+xeIqj6lpxoW17Ywxl7fPFeHNG2+iH+LKfjB3NROcqcURN24on+rlm+drM7CV5uoIb55i3ym0xu2qimHFAuaovRORwHHDa/WAcyCYW9TlayhIi1rjr3wAEOCaYDPfr87id6iarvDycXtm06h4oXL0AlI1E5C9B45tXvWjUX5ipVsS+XK6dwRXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ht0YVrr7I0BGqgydoDpSOG8UT9/FL1zZAUOkpaoMC7U=;
 b=o1NOWO/19NTYo0hbf1p3Fp89X+RbCXXZb1xFnpQj+b0OpGissK2as3oUThcJO47S2xTNUt4SrRT61enkHhI1xF7TiXE78k1E8FGb04+TQnBJxTzlhsJ+iKdRVdX5hAwAM6xtCOocbcejo4AjZfBOjKBmcuavNLHpv5MyvlG80MxVuat30IWMQDi+baWypf5ZytfFYTOGzEfSryK0xPJpJtL/wVRrvhBTH3uz9NuBsIJCq34h9j7IFdAdztRzfJtzNAP8rRwJazbdCfXx39wrdvcCPjhkPGeS84PZK859wvaPetHFTfy9rCK5engLVlvgErh2JFxkj10jfRt3zCq+eA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by CY5PR11MB6488.namprd11.prod.outlook.com (2603:10b6:930:30::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.13; Fri, 13 Feb
 2026 13:57:37 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::1171:db4d:d6ad:3277]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::1171:db4d:d6ad:3277%3]) with mapi id 15.20.9611.012; Fri, 13 Feb 2026
 13:57:37 +0000
Date: Fri, 13 Feb 2026 14:57:33 +0100
From: Francois Dugast <francois.dugast@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/xe: Avoid touching consumer fields in GuC
 pagefault ack
Message-ID: <aY8tzTYJkkBnS0Wi@fdugast-desk>
References: <20260212204227.2764054-1-matthew.brost@intel.com>
 <20260212204227.2764054-3-matthew.brost@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260212204227.2764054-3-matthew.brost@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: DUZPR01CA0086.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46a::13) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|CY5PR11MB6488:EE_
X-MS-Office365-Filtering-Correlation-Id: e5852f2a-22b3-433b-9a71-08de6b07d829
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VVdhaFVURTB3Vk1qaGFyRFliUzZxZDBPS0ozeVpYR2JuNzY3Szd4ZUM1Y3lo?=
 =?utf-8?B?dkNoS0hRSkRyUzlhZFhJYnNNb1BjSWMrNTAvR29RZUZpd2FFcmVHWHlJcWVv?=
 =?utf-8?B?M1N5VlBpTDNRaExhVmJRQjlSMU03by8vRnZVSnUyQVdkK25oRGtySFpjNXFy?=
 =?utf-8?B?SWZvTjQyNmRuODdvQXRFNDk0VElyZUFqUmpjT241ck1yQk1nY0ZYQkxxVFQx?=
 =?utf-8?B?RmRsdmdaY2FFdEd0QVNEanIrS1YybVlDb1FFYWJTWTNWcTYvbEtHemtIbk1x?=
 =?utf-8?B?NEdUdGkyZzZEazZaRGh6QlpNWVU1dXNBZ1RxejAxb0dvRFJqOHg4ZjBLY2NV?=
 =?utf-8?B?cVF2TmN3U1JvRWN1aCtDZW9MYkVhVU8zOWtJemUxWm5MVVhrU0dMbStiS2tm?=
 =?utf-8?B?RDBBMFhpQVZMV2NlNWV1bXUvdDk1ZllVbjNwcGRMVm5MRENQdWRTamQ1ZGRL?=
 =?utf-8?B?aU9MdTdVTytZY09JekZoSGdKR29DMUtUM041QkhpSCt4MW9keURDYk9LMXUr?=
 =?utf-8?B?OW42VGo1NEFIVldqdnl5WStNMmVxYnNiQWNtNk5OdDdCR0NqQ255YktmdVph?=
 =?utf-8?B?OFpvbHhMeWhrdUwrcDROOXJQbk5NSzFyTnI0NGlHTXA4Y0pOL0pZQWdxUkNC?=
 =?utf-8?B?RXBTT2ZVeCs1RUUxUFBHaHpEcTN6U0crclEzMlZvMk5QTXFBM0wrRlpUVGti?=
 =?utf-8?B?OE5sU3NRb2V1WVgrb1VoMFJ2dUZMVDRTQk1sYU43ZUZyQm03YjVxdk5SUkNU?=
 =?utf-8?B?WlJKQWNDLzI5UXA1RlozUmFERkp5cjFwamRCaFlBaGJxSDdlckt0c0EzVG9P?=
 =?utf-8?B?WWlSakp0dllFbngwS202eHczY1QwWHg3cjNpT2lEZEorVHZVY0UwZkdrVk0x?=
 =?utf-8?B?WWllQXVXMUh2bTRaS0ZSMzdzdE9qRi8ra05BeHVSMW42ZU4wK2s0SHpiZy80?=
 =?utf-8?B?RGlHVkd5WVFEdFluNmVhWjZqUEdBREZVcHVaNnhQSTZZdERNdDh6RUVjcjYx?=
 =?utf-8?B?QkxWSFNHUUtjQkE3cEpORllESjdORVkwQU5GNERjWFFlSG9QbituYzFvVHdK?=
 =?utf-8?B?cVFqazkxcy9LOTZQMmRTRUpuVlBjcFVEd0M5UElJcUd0UTlocXRTQUM5SDQ5?=
 =?utf-8?B?SmlPYUhKM2lZd3U5d2c5QWRpNG1yTEk2c0NPOGJhMGttT3VWUWx6RjlhSXdW?=
 =?utf-8?B?UC9uOTBpT1UvUjkxMUlHMi85Tm1tWmpVYjhXaS9kQ3JrdHoxN0xzcmhrNVB2?=
 =?utf-8?B?bzZydVk0blZvU1gzUnFTVExnL2hxbDkwL1Q1VDViT250YXIySmFQLzJIb0I3?=
 =?utf-8?B?RER0MmEyZ2xCcGdDeWhFRTFYNVJVOVdTZVlSVUQyZFRjYm5veHBNT2FNWkdl?=
 =?utf-8?B?ajlFZ2Z2bW0zVjcxUVI4NDkyeUFFNmxlRGhSWVhCZlJHdW1MRERNdGVQWTVQ?=
 =?utf-8?B?V3Z2d0gzL2ROaER6YmgzZHhzSzl6b2xTSUV3Ym1IQVBIam9VK2ZHbUF6SmRs?=
 =?utf-8?B?MFNFa05rUWFkRE96TXk1aEN0YjdIaHJVclI2STlWVjlhVFpsMmxEejZ3OGww?=
 =?utf-8?B?d1A1NVZZWGtTWUJvdWxJcXAvYjUzcE83U3BUdzFoTEJneDNMNUxsM1ByWGhx?=
 =?utf-8?B?bzV5SmFKZjVCOUovdmErZkFiYTM5SGFjM1BXdkxqazJGeWIzTjA5blV0bUJh?=
 =?utf-8?B?bHZXOVgxZVVxM3NxeXlUL2d1Z3RjeFRRWUdrSlY2Yi9XM0todHNqcnRmSmhi?=
 =?utf-8?B?d0Y5VlNvTGxseFdYZG9rRkkvRVJiNDZOTVBWRDhpb25JOGJNVXNkckdzZG53?=
 =?utf-8?B?L0F2aXpqNVJORThNY21LL2Jtd0RFTEhSYVlieUZQOGxFbVhTc0FiVysrTzI1?=
 =?utf-8?B?R3NFQjBuQ2dwSy9jaUZKbVVZWmJ4SUVkejkvb01jVGlHaXkzdVBNbElQYit0?=
 =?utf-8?B?NXJoYWlZNWQya0FOUmlwRTgydXJ3d3ZFZU9ZRVZLL0VPQXZrL2ZVSGpJK25q?=
 =?utf-8?B?MGwvSW5zR3g0TSt2MmF4anh0MWJBVjR1eDFVZ2NHd3NvK3RKNTErSXR5MmN0?=
 =?utf-8?B?VTJFY2tRM2FtNVN2OGFuZ1I3dmpkTXR6SHVhcFJPanlaUEt0QWllcW5RZXBF?=
 =?utf-8?Q?n92c=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SEE1dUZmNUxtYW9CRXJaSEJNMWJxQ1I0RXVkV1JhOWpBNFRTRlNFSitLUTdz?=
 =?utf-8?B?MnE5cnJPQlM3Tlo3SDd5OHZwVnhsVTV2WXhkNTREc05CZUtreHY1ckdhdnJN?=
 =?utf-8?B?WTdtdVlPM3lLMG5kcGRlSmlMMXhnbWo1ZEN0NGk5TmdsSjdsMFMyekhGYm9i?=
 =?utf-8?B?dW9sRUxJcnE0ZXVpOTJjSVVTOTFoOFQ4OTZkM1VuMy9IbTJndjhnbHdtdXRV?=
 =?utf-8?B?djN5TGNwdVNpdVF1NlZsSTkwb3BsY1RyeU10bEg5MGk4NVNRamwzbDZaenFp?=
 =?utf-8?B?aGp1VldvUkhleW50RHJQeFZqd0MyNGRIZlBWQ0dqQ25GWnR4SXRHTUZkOEEv?=
 =?utf-8?B?M2JzSFlicTZYT1EvY3J4TnJuZU5MaWpiZUhaY3hUcE03VDVwZmtVb0lXWXJQ?=
 =?utf-8?B?SEdxZ1YrWURnZUlzTURhL0paUCs2Y1FpZXhKaEQ2MWFycVJoUTA4cUYvSUlQ?=
 =?utf-8?B?WW1adUVwbnVVOUwyU2RSNGRsNGVjcHZkbHA0Z1p0SUJ5b2w2SG52SEpNUGk0?=
 =?utf-8?B?VFhVWDdaOExrbUdROUdqYkgwSlN6d2ZCVGxsa2sveHZGQUwrNmdWaU9vMERR?=
 =?utf-8?B?QnlsaG5yWDlmODIvR3hLWmZMSm1SU2QzdWtVNVpUaXVrRG44cEJzNkJsb0FN?=
 =?utf-8?B?cG0rZ25mVnJrNkgyRnhGeFU5TVBhYzVOcDdCZ3FVamk5WkdBZnZpZ2dncjNw?=
 =?utf-8?B?TzRhNyt1dUQ3bXdMNVR1R0dVZjBrVzhvdUgzaXZvendNTHBZOHAwNjFwV3Fw?=
 =?utf-8?B?SldselMrWEtJdGFxOEZMcnZGUkZQNU1XYktDdVIwRVN1QTZSalFNVXVlcUJD?=
 =?utf-8?B?ZFVxRUJ1RjJqZW50clVZRFgxR1BJWDNhQWlBUzBNVXlpeWZxVms3RkdMVmRa?=
 =?utf-8?B?SlZ1T3h2OWhFbUVzTVZ1SEo2eHBLdHAzaGNWd2dWQmtSRTV0VytEcjdTMFBq?=
 =?utf-8?B?Tk96Vk1BYnU1QkNYTC9XaEkrRUhCWXRMUjBlUSsyem5yWkdrcUZpSFhrem5o?=
 =?utf-8?B?bU5IbHF3ZkxJeWh2WUVNOGhHNTZCa0xOUUErcHU3ODU0eDdHZStYNTZ1VmYr?=
 =?utf-8?B?TGRpY0Y0a3l2MWVWUEhPVGZ2R1hETHFqRmRDRWJlSG5SeW1hRG9HNXZVZ3Bs?=
 =?utf-8?B?VVplVDViOWFFcWZQbXlkTjJ1WnZTNDVnV3M2c0l0RUNuNlN5dXZMSU8yZTll?=
 =?utf-8?B?SDJoN0RiNzJhdk5acWI3a0E5OEYyTnd4NldDMWJkc1owcStta1dvM0dTMmtN?=
 =?utf-8?B?dWZOU2VkUTZERVFNbHFSUHdoS3JoVFRBUVVnZXVBK3hXeHZIdWNneGJLZk82?=
 =?utf-8?B?SW5yZGZydVdCM3ZmNWYzc09OcFZmWVRycjhWY1g5bGZTdm4yWTc2Y0VCaytV?=
 =?utf-8?B?M2hYV09qazl1Y0E3Q1R2d09KKzVSUnM3T1E0TmhBSllxVjRpNUhldnlDMXQ5?=
 =?utf-8?B?ajRkeWxFRERONm5HNUFWYmJzWWVoNE9jeHE4d2IwME9uMWI1WWZlM1FVK1hm?=
 =?utf-8?B?N0FnM3J3VzZiZC9kQlR1eDE4RmpnOGpUNzFOWVpMTHhtYnZRTEx0WEVnRVFP?=
 =?utf-8?B?VmYyTHlhRlN4UmFyVTdRUWJ4MzEvZnhyaVh0REMrS2hwL2tjMGdvTWVKUEVK?=
 =?utf-8?B?bGRTY0h5SEZmazB0UitDSVJYUXdMbE9obGN6U2ROV3BHMXkwaXNtY0FBNnpF?=
 =?utf-8?B?Z1d0ODR6WHRIMit2Z3EzaGVtbHlBekZRSitIVlZpRU5wMjN1TG1nZldlRkZq?=
 =?utf-8?B?OFpQNjBKSEFON2VBRzRtVkVpSVc1bUJ0dVVSNFRWL1N5WTBEWjZncnRaeGo0?=
 =?utf-8?B?QUpkZUdXMEgvNitXRmMvdUJwaGV1dCszS0ZDaW4vVE10MHBTTDVVbmVtSEpL?=
 =?utf-8?B?OUZKS1RuU2lXekVMbHN6YUppL1lleUhZN29Id3UxU2Q0VUR2T1MyNmVZV3l3?=
 =?utf-8?B?Q3lTWnJXT2xwVEJzenBMZEFBRHg5cUpLOGszamhTWkVvcHB5cjUxVzhCVkNO?=
 =?utf-8?B?SXdhM3NQSVJhdDNVejRIUEdsU1V0aUpTeHk5U2FoZHd5bHhmRDJYU2JLUW9Q?=
 =?utf-8?B?akc2QVdEbVhWVSszS2ZMMFVtZnArQ3RCZEVRdm1vdTB1eTVGU0ZUMlR1VGpn?=
 =?utf-8?B?Q210WjUzeEtwOVNJTkdnbnlXcG1MYTl0ZkduR0t6dE1uV3BBWWRIekFuS3Ev?=
 =?utf-8?B?VWpBSzI5K3FkM1MwL1d5S3l2TG5Sd1Z3VEdwUExYakpvOWNJaDJwc0VhMUpp?=
 =?utf-8?B?cFRyQ2VWRWRpZlpKUHVnaG54Yy92My9qSmpjUXl6c09oTUNLZGVYbVF6YXVv?=
 =?utf-8?B?alBTVytmc3lVSVI4TXRYbU5WT0FhNEZSdmtDTzRLbHR6b0hzZkpMd3A5bDY0?=
 =?utf-8?Q?JvYyrRpVgdlCC3BU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e5852f2a-22b3-433b-9a71-08de6b07d829
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 13:57:36.9737 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G5aVMy96/Kr25VJrKAX2rixyshYcTbHIqX+HDOoba/Iu2QnZvc8UtLoEcgCM+zIltulWcu3+96jGiTDnMHx09OT6Pk6kjfRE4FXyp+uzk90=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6488
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

On Thu, Feb 12, 2026 at 12:42:27PM -0800, Matthew Brost wrote:
> The GuC pagefault acknowledgement code is designed to extract the fields
> needed for the acknowledgement from the producer-stored message so that
> the consumer fields can be overloaded to return additional information.
> The ASID is stored in the producer message; extract it from there to
> future‑proof this logic.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Francois Dugast <francois.dugast@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_guc_pagefault.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_pagefault.c b/drivers/gpu/drm/xe/xe_guc_pagefault.c
> index 1166b0a5fa21..d48f6ed103bb 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pagefault.c
> @@ -17,6 +17,7 @@ static void guc_ack_fault(struct xe_pagefault *pf, int err)
>  	u32 pdata = FIELD_GET(PFD_PDATA_LO, pf->producer.msg[0]) |
>  		(FIELD_GET(PFD_PDATA_HI, pf->producer.msg[1]) <<
>  		 PFD_PDATA_HI_SHIFT);
> +	u32 asid = FIELD_GET(PFD_ASID, pf->producer.msg[1]);
>  	u32 action[] = {
>  		XE_GUC_ACTION_PAGE_FAULT_RES_DESC,
>  
> @@ -24,7 +25,7 @@ static void guc_ack_fault(struct xe_pagefault *pf, int err)
>  		FIELD_PREP(PFR_SUCCESS, !!err) |
>  		FIELD_PREP(PFR_REPLY, PFR_ACCESS) |
>  		FIELD_PREP(PFR_DESC_TYPE, FAULT_RESPONSE_DESC) |
> -		FIELD_PREP(PFR_ASID, pf->consumer.asid),
> +		FIELD_PREP(PFR_ASID, asid),
>  
>  		FIELD_PREP(PFR_VFID, vfid) |
>  		FIELD_PREP(PFR_ENG_INSTANCE, engine_instance) |
> -- 
> 2.34.1
> 

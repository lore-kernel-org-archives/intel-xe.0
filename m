Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E17CC3DA49
	for <intel-xe@archiver.kernel.org>; Tue, 23 Jul 2024 22:11:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2F0C10E0A0;
	Tue, 23 Jul 2024 22:11:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OGS4oUvn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 534CD10E0A0
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Jul 2024 22:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721772716; x=1753308716;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=jz9hkMXm4cSTrbtHpGJQvAVMHK4kRcg/VxY3pUt3JpM=;
 b=OGS4oUvnPn4I8SHc45AeB8DMU35GcwP9c966WyhkaxtcjkgV23bszPR5
 8vg81PrBKE4GiVQY8SN/jiVTaRsXlFJC2VAJY8YuBL4vywVV5oe3u/4hB
 eBVQF4H+OcpxfjCJE18uQQ+WMbOji7KnoMGTm31ams0BZHUXVZZRjz5i8
 /YkRCV8IZjYKRixSiVMFKEFsJcSRZ5X8/xcBCeaFSgNKrqyZTwFoQ4TRn
 2BbKmwH1JbvlcecOqS0QDdH+8UbySPZpM6m20aRxBhWBNuV580sPcWcQG
 WjSpANai5jlmcnFxkZ/GDWRFkyQkqMqI9jIEk7j+P9I50YWgEux/Farus g==;
X-CSE-ConnectionGUID: GcubOZd+S7mVuUrsVNn9AA==
X-CSE-MsgGUID: mXml7+BuRwqKzjPgpRN2pw==
X-IronPort-AV: E=McAfee;i="6700,10204,11142"; a="30087236"
X-IronPort-AV: E=Sophos;i="6.09,231,1716274800"; d="scan'208";a="30087236"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2024 15:11:50 -0700
X-CSE-ConnectionGUID: Ai4rf7ZnRJW5ZMZnKc4VGg==
X-CSE-MsgGUID: eEMagfhjRR2TUsceNg+Ptg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,231,1716274800"; d="scan'208";a="52093622"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Jul 2024 15:11:49 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 23 Jul 2024 15:11:49 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 23 Jul 2024 15:11:49 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 23 Jul 2024 15:11:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uXPvm54tWhBtADPG9sCqnjbY23iz3Rg67SwUt0a106M2PYfFjpVB4nO0G+w5RXw3MV2IpwT9LHAy0k5pdT/F8RpjVElbYJ3A8kaZEMxuXN6TGw0gY1mBVx3c6GR8vWm7MSt4994pkZUsygpZ5zaqoIQAIze2d1rcUsVMx5kBohi3E732E2KWF7zmpO6rfkBOlVd0k5ghuCG9Wn5o9jwMMfsLMJeqd+UsVRJ6K3W9dwHudvpaPyzZ3ff98nnQglMRH/oy1EbURgEa0sIz0sWVvc8iIGv3H/gNB7+rxgbaZAI0Lt7DiF8DQl9W6oVPKHjr++epnsrbA64BxfLjvnSp7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MMcJa1zDM7p6nrmxC+ViWh9ZZjhvee/KvKbQXGQmchI=;
 b=llOSYUeRfkQYegcMn4NnecCNW7qfVK7DrNBNQRQcNapabn9ay43hmY13Aic1imtEg9jQ7Ixobl0y+JzAkTbhAssk+nS2COqeuWB/ddJ66q3D83/m0EIz52wd2L5S3//BxCMd3VYn686OmU5jDx+9rSxKByEI29SwKwdRP6fYbQyu+ZxpOkZvawHk3RWO+67TeSCzA/KJ+l4i/a5jD/JMst8+A6qYR0lUuGneMD9DRxSnhlKWV6PJE6q96NxdpluNBzAeongOy9X/ujDdVnp+WSX6PEvmruOzFO/D2soXbEAjG1AL6sGjhFf5XQ31C57YF4sPuhmpUvpN+BitxDYtuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by CY8PR11MB7135.namprd11.prod.outlook.com (2603:10b6:930:61::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.28; Tue, 23 Jul
 2024 22:11:46 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%5]) with mapi id 15.20.7762.027; Tue, 23 Jul 2024
 22:11:46 +0000
Date: Tue, 23 Jul 2024 15:11:44 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v4 4/4] drm/xe: Fix use after free when client stats are
 captured
Message-ID: <ZqAqoHYLn07dpb5s@orsosgc001>
References: <20240718210548.3580382-1-umesh.nerlige.ramappa@intel.com>
 <20240718210548.3580382-5-umesh.nerlige.ramappa@intel.com>
 <Zp6sSSI-48U0k37e@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <Zp6sSSI-48U0k37e@intel.com>
X-ClientProxiedBy: MW2PR16CA0031.namprd16.prod.outlook.com (2603:10b6:907::44)
 To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|CY8PR11MB7135:EE_
X-MS-Office365-Filtering-Correlation-Id: 022f2c58-df87-4487-762f-08dcab64713b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R1VjUmdLRGZnTlQrUWNPUGttWENxZll2bXltSG1tSVBvRmhaNVpSa0NNVUht?=
 =?utf-8?B?MWhoNDRWRm5ZaTVhNXV6bjkvQ0F5LzhFN2JFejVtVHRJWi8zeFBCVGlybCth?=
 =?utf-8?B?KzFzdTNVZk02UU15YUNEN2NOUEkySFA1VEpWU0luNjN3SC9SNlJiRHlETXpG?=
 =?utf-8?B?Vnd1c3hIWFRSS3h1L3RLdmlpaUkzUUoxdFZobkEwTkkzbng5RnoveExjVFpM?=
 =?utf-8?B?Sm04U0I2VkZMOGt4SG91eUFabEdoaHdPWlZMQUQvRlhUQXkxZllncGpaSGpl?=
 =?utf-8?B?cmxySUJvdTVwWTUwd0hQN2hVTnVZaUtjTmJMUGtEaFZ0THZPTS9Hd3RSbisz?=
 =?utf-8?B?YTNtWm1qdFVBK0ZaeUJlTzdwVXZIaGdqU2RyMnFKUk5yTWprMTkvaEQzRE8r?=
 =?utf-8?B?eStEK0NwcTJJRFhUSjFGTjJPVWZ6d1l0Z0U5cTA2bituVXJPSnFMK295SXE0?=
 =?utf-8?B?T2szRUVpMjM3M2ErMUxnM21sU2JBRWdFYWMvUk5qYmVpRUt0TWwyS2w4U2h6?=
 =?utf-8?B?djRna1I5VHhhcndEVUZXTlQ5MU5FeFNXWDQrNXRacEJlaDFzMk9ZUk4rZ1Vu?=
 =?utf-8?B?eWZsVk1hd3dzbCt6V1hWOFZSUFFJTVlUSmN1bmVVUWdDbmJGd2xsdHFjMVhi?=
 =?utf-8?B?NWt4VkkrTkNMenNjcnVLSm44Yi8wKzF0UjltemhieTJuaGtlMjFJSGFTUHhV?=
 =?utf-8?B?Z3h3YzZvU1B3VW1ubWhEVGZwSjBpN0NaMXN4Q2pNa0hYZURJOVFMS1RuZGJV?=
 =?utf-8?B?R1VPemlFTVI5cnNwRFZzUER1Mk9jN0dKcDFWRThSZ25qdEFZd0VxYzRvbncz?=
 =?utf-8?B?NGxTZjFLVzk1ck0wRTdJNGk4QUx1UTB3cmxaV0RyRlpxQUJmVk5VOUZtWDFm?=
 =?utf-8?B?T1FrSm9KYUdaQWlzNEJIMnBXdVdRNHVuMDNQZE01NHRaQzdheXYvZDd6UkNN?=
 =?utf-8?B?QmhoSGlYMHVmck1IVlNGZ1ltK05PZzd4VUZoTkgxNTQ3aUVJd2w4eGpGQTlW?=
 =?utf-8?B?Q0cxVk4yendTUTFONXRoQkNTdFM1M0tiV2szc0M2bk42MzlGd1AvVHZiSTZm?=
 =?utf-8?B?SnA4WDJ4c0JiUEUrcjVBQVI2dUZuZ2F0QVplVDM0bEdOOUxlMnNvUGVHTlYx?=
 =?utf-8?B?T3YvMzdQNEI3QlJGNHRNM21wVnBxdkxQNUY4UTRsMjE4eWt2em0ySjdQTGlv?=
 =?utf-8?B?Z0QxRXNOakxaNEJQajBGZ2llK2FRVXFXWUtTYldLRzk0cmhNOWg5cmxvdjNS?=
 =?utf-8?B?a2R1Yk1YRmt0OXNweC9yRUI5Q1ZtZEs1MUt3Q2p5ZWQvNDVPdkJKbUxURXRO?=
 =?utf-8?B?b1lIQ0xXSW8vZ3YvTUxRaTJnMkgxM1phMnZnaG1LOUZ1VjI3dUF1RW5jelZr?=
 =?utf-8?B?UVIxK1hMbDlHTE1GcXBLR2FKYW1NQWpMUndaVEprZkRjd09LV3QvTXRCWU1R?=
 =?utf-8?B?anZoYVdXVFFwcmdwd0pXMXFlNnNiZXJEZEVSNzk0UjJXV2x0bUdrKzNHRGZE?=
 =?utf-8?B?UWtXRFcwOHJObUtmOU1mK1UveWVpY0VQNjJsU3I4UVpPSzMzK3k3TzZKc243?=
 =?utf-8?B?dzMyd2p6OFRrS2VkYTlraTRCcVBUYU4yZHllOW12REtJL2kzR2k2NEM4ZU5L?=
 =?utf-8?B?b3lSK1czWWdUYS84WjI4b1luY2tENkZPMThzM0podlh3MnRXblo5cHg2dkZo?=
 =?utf-8?B?ZXRUbWVFMFZXcXFWMEFBc3Y3MFhuTmdHMzdvUHJWNWx0bkFwdVUyaVZ3UzYx?=
 =?utf-8?Q?EPvOqMYdyPGiDL2bZM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SU5ITHBDTlZwc3c5MjBlaXdNUE85QzBuTTZpWFdqZ1g0MzYydWQ2UGRJS2o5?=
 =?utf-8?B?L3QzRzk4Y2c3L3VpZ1VteWdJSkNLRWUzVmdaOVdIU0NNWXNtTEtCVXF6OGRC?=
 =?utf-8?B?YWorcTRSZ0hweXZIQWx4cUhYeEdpTTg5SEdLQnE5dkJXbkRPSzBaaHluZHJH?=
 =?utf-8?B?QWN4RHJRWk5sYnBDU08xbVlNWHZYSmlyV1J6Qy8yb2JUcm42S0gweFh4UU5W?=
 =?utf-8?B?dUpVTktsNTZoYzB6TEVrWU5ZcGN3NkNQVllMK3lWalVWd1ZxNy9Ib3JwQ1lz?=
 =?utf-8?B?blVjZkRYUjdiUTkrdDYzam1ZVGllTnkwZ3NqRWF1YkxQdjRPTWhRNE85WlUv?=
 =?utf-8?B?a0x6WDcyc2ZMTlR4VzhEMG1DMzZpRzl4QkVSV0Y0cmdVaUgyWmIrRVl1MXRm?=
 =?utf-8?B?MWtLbStTNDhSU0ZMWGE2azZneDJGdENwMkwxTVRCTGlEd2pBVWlMc0pyd214?=
 =?utf-8?B?RVB2alg4Q05IQmlIK0RGZXdBRmEwdC9NM0FUT0haS3JSc3RUb0xzbUVhV2dZ?=
 =?utf-8?B?cjZkTVZCZFZINW1QMnBBM3lFdkwzYWNINmErSlZYQlJVTWJucnBMaWd2WmdU?=
 =?utf-8?B?OW1UN3F0WS94azF6N0VZakdPUGhGYnRIZTdueUx3Sm80amhTWnFwbzVPYm5T?=
 =?utf-8?B?emttM1dHY2szT1g5NnZyWEpMMXcxSWVKRXNXSktXakxXRG91S2JhVnVhTkFV?=
 =?utf-8?B?WkZtdDlLQVQ5N3N0SWtnQ3Z5Mjh3WVZNYTJoTUFXc3hoZ2dLZ0xnRXRXRkgv?=
 =?utf-8?B?emowK2llR09kYjZVUkdnMW56ZUNwVU00Nk4xMll1ZU1FWTI0LzVuNVM0S0J2?=
 =?utf-8?B?NVI1b2tOR3NQbG5JOGpiSlpnTHNxTzM1UVUxYWx6bmpCSjRVbEFnSFh0eDlR?=
 =?utf-8?B?VUlHcXBLYzRSSkFWa0RIZ1g5WU5mL2dMeU83QnUyWkIxZnQzZ3FKTU11QVgx?=
 =?utf-8?B?UFJwQkt6a3VNOHVwYUZzRUNhNENNcnN2QlJwL2E2RW1JWURyVEpRUFc0bmR3?=
 =?utf-8?B?L0JPajlOVDd0MDg1bXRpdk9YY1l2TjY5MGl0QVUrRGF0Z1VmNmtMVldRNFRC?=
 =?utf-8?B?RDBqc2ZLbHg2Y1dxR3V6b0Q2RnBjRkkrVFo4ZW9LRmNZbW5hZ0NEczVUUWZZ?=
 =?utf-8?B?bUh1enRnTFAyaXpvbGwwTUs0YTFWdjhpUmFuZ2ZpTDJUVjYvM0g0aEhldGMz?=
 =?utf-8?B?Tzc0MWh0RU54elZ5Qm12S3hIWXBWcjFraVVBa1FiNlVxZ3FvYUlNbmd3Ym5y?=
 =?utf-8?B?Q0Uyb0kwUU1KNnpzN3N0M2QvRkNQREQydE1iS1N3OG55QWRqMktxRll0NFBP?=
 =?utf-8?B?NkNMdVlUZXcrcjdPZkVzc01IREgxZGs0SWhoem12QlRnc1dubmg4Nk92dHkw?=
 =?utf-8?B?NHplZDNTOEVxQ1A4UFdCZVZUM1NIenFFcThPa3YwaVJ4NVlNMm1YeXhmTDky?=
 =?utf-8?B?U1c2SldpUHRSbGZDM3RnVTVtMUlLRUwwV05UeXpObTloUjZsZXNSaTRtNmtt?=
 =?utf-8?B?eEJUZHR4UWFzdXp5MWdpRTlQYXdBSklha2YyV2x0UzFvMDNFWk8wdlVzWS8y?=
 =?utf-8?B?Z2JUbngxUmhyc1dUY0VabmNaWXdGN1phampXNE1tVFVFeGZsdFArZ3Ivanln?=
 =?utf-8?B?dDFUeThzUjNrbHRlS3RuQ0ZOYjBmV0tUeFIvdkFwa0tDTUgzZzExcGNmTEpI?=
 =?utf-8?B?dGlPTmozNU1Zd09acGRXazFNcEZxcGd1Q3Z2c3NOQnFhdjBybnpFNDMweDRP?=
 =?utf-8?B?S0FmalpIaG1qTUE2TUpRVDl0WnZEdFJIWVp2MGxDL0Nvc0I4OG9SZFIzb2tT?=
 =?utf-8?B?R1NsZjdMa0RSLythbmdrVll2Q3pQc2ZFMTJIRldmNzhaNGNLeGdSK0xrUURM?=
 =?utf-8?B?UmJLOFJCRmdGL1ZwcERvNEhKayt3UjNMQWFwTEcrQkJmcFZRZWdoaUZBaTNC?=
 =?utf-8?B?d0cwNjF0c1pkZzlkbUQ4RW9PT3U2a1UreVMvanFteW95cEJSTWNGQm1rR21B?=
 =?utf-8?B?bWhSMTM3S25LbnNZYlV0ZUNsVUo3SHJKYnduMzZVSHgzTGUxTm5iQmZwV2p4?=
 =?utf-8?B?ZGk3TlVFNmU1dzJSa3lyeWp4RXlnZUwwMkl6MTZUV1VKbHdxR012ZE02UWZz?=
 =?utf-8?B?cG83K2dTd09DN2dQZkIvOWJwejBpd3BLU0laQVJIbmJEU3BtVVVDUE1IeHUw?=
 =?utf-8?Q?2zHVuR7IGvVQzpTjl7mdgSY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 022f2c58-df87-4487-762f-08dcab64713b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2024 22:11:46.5601 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V9Vwz2P8ql67GwjtwIjYen7Ix6KfjnOG09Lgsu2XGGMynDBeQN2WUC/APTAgKQ5GG30tSiT/0q9U7n4ywPKPL7/+zMbphuSlN4ZOcNexxmU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7135
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

On Mon, Jul 22, 2024 at 03:00:25PM -0400, Rodrigo Vivi wrote:
>On Thu, Jul 18, 2024 at 02:05:48PM -0700, Umesh Nerlige Ramappa wrote:
>> xe_file_close triggers an asynchronous queue cleanup and then frees up
>> the xef object. Since queue cleanup flushes all pending jobs and the KMD
>> stores client usage stats into the xef object after jobs are flushed, we
>> see a use-after-free for the xef object. Resolve this by taking a
>> reference to xef from xe_exec_queue.
>>
>> While at it, revert an earlier change that contained a partial work
>> around for this issue.
>>
>> v2:
>> - Take a ref to xef even for the VM bind queue (Matt)
>> - Squash patches relevant to that fix and work around (Lucas)
>>
>> v3: Fix typo (Lucas)
>>
>> Fixes: ce62827bc294 ("drm/xe: Do not access xe file when updating exec queue run_ticks")
>> Fixes: 6109f24f87d7 ("drm/xe: Add helper to accumulate exec queue runtime")
>> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1908
>
>Hi Umesh,
>
>first of all thanks for this fix.
>
>But I'd like to ask you for a next time to provide the fix in a single patch
>or have the first patch as a dirty fix and a refactor on top, so it gets
>easily backported to the fixes and stable branches.

Sure, I will keep that in mind in future.

>
>For drm-xe-next-fixes I'm now picking this entire series. But for any
>stable we will need to provide a backport that applies there.

Thanks,
Umesh

>
>Thanks,
>Rodrigo.
>
>> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
>> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_drm_client.c       |  5 +----
>>  drivers/gpu/drm/xe/xe_exec_queue.c       | 10 +++++++++-
>>  drivers/gpu/drm/xe/xe_exec_queue_types.h |  7 +++----
>>  3 files changed, 13 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
>> index 6a26923fa10e..7ddd59908334 100644
>> --- a/drivers/gpu/drm/xe/xe_drm_client.c
>> +++ b/drivers/gpu/drm/xe/xe_drm_client.c
>> @@ -251,11 +251,8 @@ static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
>>
>>  	/* Accumulate all the exec queues from this client */
>>  	mutex_lock(&xef->exec_queue.lock);
>> -	xa_for_each(&xef->exec_queue.xa, i, q) {
>> +	xa_for_each(&xef->exec_queue.xa, i, q)
>>  		xe_exec_queue_update_run_ticks(q);
>> -		xef->run_ticks[q->class] += q->run_ticks - q->old_run_ticks;
>> -		q->old_run_ticks = q->run_ticks;
>> -	}
>>  	mutex_unlock(&xef->exec_queue.lock);
>>
>>  	/* Get the total GPU cycles */
>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
>> index 3336a01a1006..69867a7b7c77 100644
>> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
>> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>> @@ -37,6 +37,10 @@ static void __xe_exec_queue_free(struct xe_exec_queue *q)
>>  {
>>  	if (q->vm)
>>  		xe_vm_put(q->vm);
>> +
>> +	if (q->xef)
>> +		xe_file_put(q->xef);
>> +
>>  	kfree(q);
>>  }
>>
>> @@ -649,6 +653,7 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>>  		goto kill_exec_queue;
>>
>>  	args->exec_queue_id = id;
>> +	q->xef = xe_file_get(xef);
>>
>>  	return 0;
>>
>> @@ -762,6 +767,7 @@ bool xe_exec_queue_is_idle(struct xe_exec_queue *q)
>>   */
>>  void xe_exec_queue_update_run_ticks(struct xe_exec_queue *q)
>>  {
>> +	struct xe_file *xef;
>>  	struct xe_lrc *lrc;
>>  	u32 old_ts, new_ts;
>>
>> @@ -773,6 +779,8 @@ void xe_exec_queue_update_run_ticks(struct xe_exec_queue *q)
>>  	if (!q->vm || !q->vm->xef)
>>  		return;
>>
>> +	xef = q->vm->xef;
>> +
>>  	/*
>>  	 * Only sample the first LRC. For parallel submission, all of them are
>>  	 * scheduled together and we compensate that below by multiplying by
>> @@ -783,7 +791,7 @@ void xe_exec_queue_update_run_ticks(struct xe_exec_queue *q)
>>  	 */
>>  	lrc = q->lrc[0];
>>  	new_ts = xe_lrc_update_timestamp(lrc, &old_ts);
>> -	q->run_ticks += (new_ts - old_ts) * q->width;
>> +	xef->run_ticks[q->class] += (new_ts - old_ts) * q->width;
>>  }
>>
>>  void xe_exec_queue_kill(struct xe_exec_queue *q)
>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
>> index ded9f9396429..1408b02eea53 100644
>> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
>> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
>> @@ -38,6 +38,9 @@ enum xe_exec_queue_priority {
>>   * a kernel object.
>>   */
>>  struct xe_exec_queue {
>> +	/** @xef: Back pointer to xe file if this is user created exec queue */
>> +	struct xe_file *xef;
>> +
>>  	/** @gt: graphics tile this exec queue can submit to */
>>  	struct xe_gt *gt;
>>  	/**
>> @@ -139,10 +142,6 @@ struct xe_exec_queue {
>>  	 * Protected by @vm's resv. Unused if @vm == NULL.
>>  	 */
>>  	u64 tlb_flush_seqno;
>> -	/** @old_run_ticks: prior hw engine class run time in ticks for this exec queue */
>> -	u64 old_run_ticks;
>> -	/** @run_ticks: hw engine class run time in ticks for this exec queue */
>> -	u64 run_ticks;
>>  	/** @lrc: logical ring context for this exec queue */
>>  	struct xe_lrc *lrc[];
>>  };
>> --
>> 2.38.1
>>

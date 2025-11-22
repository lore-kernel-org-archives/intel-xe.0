Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAF11CFD2E3
	for <intel-xe@archiver.kernel.org>; Sat, 22 Nov 2025 18:57:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FE2110E0AB;
	Sat, 22 Nov 2025 18:57:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KwS67MzV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3E8F10E0AB
 for <intel-xe@lists.freedesktop.org>; Sat, 22 Nov 2025 18:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763837841; x=1795373841;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=iuiz2iwEQaRJU+UCDhOr4DocSI4oVf0AWr6fAOgtFv0=;
 b=KwS67MzVa9ojLs5ASTh+ks6UFNWQrVTS+dqPf8UV/2WVjgqeDQW96l8d
 EDeXKFdCgGAVweAtd42RvfTofcNFRthC9W5Msn0Dgy1JEN9+3Ziq3pBe+
 gVvo8mhuZWqZ0wpHjHTBowz1p7iJcKZR4C2SFhrTUVH6+4C9avdhKtpWd
 o+gtd8XVm8Qu3I1QQ4Glds+YzvPn5QRgSMj3mwSf4gYZk8hA9zgiUHJLc
 e9af8hZtD8eTc3E2V5kU2aa7l28ziLld+9WBFgUv5X9opsHfTvcV//7HR
 docXvOvwmKMpk+WWii1uGaioxCp9b1frd5kiNRH8Jv1pSqkquMvYOBb9l A==;
X-CSE-ConnectionGUID: 7I3oeRvGTcCKVxgJidKcfg==
X-CSE-MsgGUID: 4OGTMtK+SFW5gvvVf3tOcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11621"; a="83290158"
X-IronPort-AV: E=Sophos;i="6.20,219,1758610800"; d="scan'208";a="83290158"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2025 10:57:20 -0800
X-CSE-ConnectionGUID: A0RQeI5NS7mhA8bzuIaUsA==
X-CSE-MsgGUID: nrnAP2xjQ56Rs6P6TSQU+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,219,1758610800"; d="scan'208";a="191838000"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2025 10:57:19 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 22 Nov 2025 10:57:19 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sat, 22 Nov 2025 10:57:19 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.48) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 22 Nov 2025 10:57:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fyj0XAouRv/mVgQWAGiRuFi4PJAQvowT+usFs4JQApN6ACElkFAe2WT6dtlarPdQ03FceDjZ7zGUk/a5ntsl8pJn/nQOxkimYRZq/aXX/vMx+s1/NrWgYz6u21fUVM2nKXHO5KNS3szwwl/TBvNzKs4Qx558IqzAUwkF7pJ8vDWc8WtNrYwxk1XK2XaCgeab8a1zh90fwSgIQUp09Q+h0Hykb8VGOF3hXVMFarRdMON4JnCeYqrve3ZmFiWYZYm123EixytKbyn46WAYsC4mdL+iPbPmOKPAawH4isBR1XJjzFKqLxQ6l41jAyCX4p8+B92yj46uZO8pa++TXka0LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R2RasX/6NMprRpE3WkCYO9pjFLC7wxWKEJdrqCU53dU=;
 b=N9GF9MAA679Hb5J5FSOPaAExSJeSoVSF6WEsF49ZuByXpI5Qs4bwREpHYfk/V6lStfq6XJ4oN1huf9/ckFQl4SGIv6jKblI890O5xpBPYBy0n3U2YujQ7Y66Cqx/GO89/wjYahQVHx+5fUyQjXWHSGKLg47G9f+K+o2rMkd7goXMrKNKpS1/zvJsc4qywuZe8akIOBAAdeoj8/0fhD6PswdMwVsa6haEe5lxjGF7MKwYvBNYkf62E8Q7r21M7ZzBqfrr4WjhuXYBM/CXnFxrfAcH904R7tgvrcrciA9BD7kqlqzUxfxqbtcedzHpT8kcGNhOPHvO/wH3v/c5SR8XEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by SA3PR11MB7527.namprd11.prod.outlook.com (2603:10b6:806:314::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.15; Sat, 22 Nov
 2025 18:57:16 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%5]) with mapi id 15.20.9343.011; Sat, 22 Nov 2025
 18:57:16 +0000
Message-ID: <48299251-5f13-4377-a42c-213a2a325fa2@intel.com>
Date: Sat, 22 Nov 2025 19:57:11 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 2/5] drm/xe/soc_remapper: Use SoC remapper herlper from VSEC
 code
To: "Anoop, Vijay" <anoop.c.vijay@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <rodrigo.vivi@intel.com>, <aravind.iddamsetty@intel.com>,
 <riana.tauro@intel.com>, <badal.nilawar@intel.com>,
 <anshuman.gupta@intel.com>, <umesh.nerlige.ramappa@intel.com>,
 <matthew.d.roper@intel.com>, <michael.j.ruhl@intel.com>,
 <mohamed.mansoor.v@intel.com>, <kam.nasim@intel.com>
References: <20251122045803.3616201-7-anoop.c.vijay@intel.com>
 <20251122045803.3616201-9-anoop.c.vijay@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251122045803.3616201-9-anoop.c.vijay@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DU6P191CA0057.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:53e::15) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|SA3PR11MB7527:EE_
X-MS-Office365-Filtering-Correlation-Id: 77ab689e-40c8-4461-d59a-08de29f8f462
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L2VVaVJkbnpsQzRGOVZ3cUhUK1FyMjRpNlJ5MXR4MkNDeUlMbXRuVVhNaE01?=
 =?utf-8?B?dzdXTloxbi9Ra0NrQ29jbWhsSTNnZTlzL0c1aVFsaTRZek1DOUVpTUJIeXR4?=
 =?utf-8?B?TmFaemYrZkdtRjV1SUduL3Iva1VUaXRrR3ZwbnpOaEhVY3BqdnE5NU1TTE5h?=
 =?utf-8?B?anVUM3VkeGRkK0phUGVBUUdoVDViUUlkZzVyN0ZXcGRIc0c1ckRqUHpONXBX?=
 =?utf-8?B?OUxycFBlOG42bGZ4ZXVraEdUeUxYdWIrYnlxZk8zVlpSdTlSeTJzNE1sbW5p?=
 =?utf-8?B?TDdwdHRqYklLdEFqcXZobkhhVmVGOUVTU0s1QmhVSDUvZTVobzRRemFxcW1t?=
 =?utf-8?B?WkRPbTVJelRyem9SQTJmck5nMVdEakV1VDI4NnFzbEg3YURJWFNoa3d2dytK?=
 =?utf-8?B?OElTVG9SWkRGOTFOWkxYZ1JNZlMwQzM3b2VQVG4razltek13U1pTd2ZUeHht?=
 =?utf-8?B?dXpyREcrQVJ2TmhFY3Y5YnpDdHlxblloQ0tzdTBZNnZHZGJjQk4veHRxRGVV?=
 =?utf-8?B?NFc2LzlrTjNTLzBNNERTczJBNGY3dzJ5QytHWDJQSHZnNy9oVW1JY3NSZzVu?=
 =?utf-8?B?aVIvYW1waENicXRhc0RyTHRwNVJJNUdDWndMNDBaSVRuWTZiZjVoQ0FTT1Ba?=
 =?utf-8?B?ZTI4RTdXcFhxUVlXWkVyVW1aKzE5ckpidkdEYytFajFOc2Vtd2tEVE9mVHJ1?=
 =?utf-8?B?UGdUTHdLN1BMYlIrbFpIa252OFdHb2NrSDZMQzZYdEQ1dUhiQjQ3STJoelhD?=
 =?utf-8?B?aHo2R0greng2enVjL0FJanlFdHhMeG9iTWNPVllyczJCMi9YQ1doZWN0V1Nn?=
 =?utf-8?B?SzZmOVgyUktJd1FzUGQzdWZQMTVBUXRJMHl2ajNJN1AxNmdhYUt5akpkeDA1?=
 =?utf-8?B?a3JRNVNTa0hiTXQxblRLM1RuU21BTG5lNXBmb3pET0ZGdWQzTTZCN3ViRTIr?=
 =?utf-8?B?ZUFlQllUNGczSDdQK3dnRHp2aDQvaHV4ckc4bGNKeE5NRjJ0bFJSZklUNVRX?=
 =?utf-8?B?VjZ0QWpTN285a0hjMlB4RWsycWY1ZXgxZGdBeklnU3lJdFdjSkJlRnl3L2RD?=
 =?utf-8?B?NTZnN1JFc2V2UFRTUXBsbHMwYmtUTDlablc1M0c5WEg5dTNHejZxSWFRSkpF?=
 =?utf-8?B?bThDUy9pRlQzQ3pYa2xYdkRnVkZSek90Z2F2VEY4Y1BXaXM0eGl6WHpLSE9H?=
 =?utf-8?B?b3RMb3VyYzEwcUl3TVZSUkdOV2YzbTFpcWJMNjByZTA2U1BaVFJnOXpVcFFE?=
 =?utf-8?B?dFZwTzRiVEtVYzhFcGxQUWJkVmFhSU9jNmFMeXhFcmh5cXpZK1ZHMGxRNGRh?=
 =?utf-8?B?eXJReHkyMksrOVhLUWZwYnpKbmdzVE5oaGlvVDRNVGt1MVpJQlA3NnBWY3gr?=
 =?utf-8?B?bXJuZXBHbXluZjhuOGZ1a2duTVVlTWV0aFFxdUgySFE0bFRkV0k5cHBVeUh3?=
 =?utf-8?B?ak5tbG1taHpLZlNjMEFQM2lkalRDbE01bVhjOG1sanNraFlOTWRjS1NNY1dQ?=
 =?utf-8?B?SDFEZTlCTEp3b0lHN2VJSWlwWkJiTnlWL3VnY0tzeFdPalFMNXhMRXJUa3ZT?=
 =?utf-8?B?c1JUY2VNY2hLQmtBN3NtbXVmYmdsRUY4T0YwOCtTUW1wNWNHNmZ0L3lseFBl?=
 =?utf-8?B?dkpoSngyWVdoSDlWREU0YnNwcjFSSFVQdVVBSjB6WlVSS01tSlFRcjBnL0x5?=
 =?utf-8?B?cU9ma2VGU0FKd2VTVXJET1p6ZGxWY0FvR0NjdzIrN05LNmtCNnh5YmpQMzNH?=
 =?utf-8?B?R0E0a1dZZEl4UUZoMWRnMEVFcmsvSmtHckk0eDQzTXNva1I5Q0xQVEVPUU1u?=
 =?utf-8?B?R1ZhdnMwOTZLbWVpVGUwdjJjaGRNeXliL3V3K3UvUkRNdDlzaDRiMVpSRy9C?=
 =?utf-8?B?L1VSU1ZMOExhbkN6NkVXWkdEWGpoY21kcEd4OFg5ZWNvKzJRajZzdWUwNHF5?=
 =?utf-8?Q?VTgnt+h2kXesTlTsCmTOrjNqFmLUykTW?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MzRSdHh5ME1qV0ozUGJXU0ZKS1REaVBYSmxPNUF3K3dvSElMem4wZGVXKzB5?=
 =?utf-8?B?RVY2anNsRnZXVTF4VmtWdVBpZ1ZSSFJ3MjZrMVp1MmcvU2puWEMwK2swcTNR?=
 =?utf-8?B?bnEzWk9SRUNjMHNrelljNEdUR3d6Y0FQSXhuaFRJOWM5UzluM2MxUHdaWkww?=
 =?utf-8?B?ZEM1c3N3SEg5ckY4UjM0VUk0TFdVQUdRNlNwMDhseTJ2TGlrd3ZaRnNLRUN5?=
 =?utf-8?B?TllWSldHNWkwN2JlUkF1SGp1WWMrbVhYOW5mQXJWLzV1dm15QkMrRXozcnh4?=
 =?utf-8?B?T3FGbjhDczRLT3kvVTdIY29OcVZHZ1VvdEdOcGovcHBIcWwwL3d6N3lYVnVT?=
 =?utf-8?B?ak5ENi94U0Jwdk5sU0NYNWhEZ3hHeVVOOGFVSzFialJSR05KU2lEMlA3djNs?=
 =?utf-8?B?NlVuc3ZHYUdEZi9odnlXK0VBY3p1S1U0YjRkOTE0VUZjRDNNeTNoK2pNVmNo?=
 =?utf-8?B?YS8vRlpGYnpEbFZKQmV4MkNrVE5tdEhOMUtOVFFMemtYQWt2NlZDK3FoR2ps?=
 =?utf-8?B?WWltT2pvTmFPSFYvdTRmU24veFF4alJKdkp5NWlpVHRHSk94Zlo4QXdGWVBp?=
 =?utf-8?B?eHZjaUhoVnJFVUw2S1hKcDhuZng1UjI4T0VGTVg1RUtwN3FSZlBaVHRDZjlJ?=
 =?utf-8?B?NjhvQjlIWHp5TExueHMzQ2dWMjRSblBycitWcWF4U2JLV0NhVW9tdm02QSs2?=
 =?utf-8?B?VldlUHEvNHVFMmFmWUs4Z3RSREFkY290VnYwSHpOVUxmbXFvUDVSajNocUxw?=
 =?utf-8?B?K0RPN1A2N3R1ZytQeGJ6YlNjQ1ZPY29zOEt3U0tiQ25JOFNDRnZUdFpSeUZV?=
 =?utf-8?B?UnlEL3Z1ZEdvTlErSk1Wb0tJUUVETUdmMlZGMmhGSnRqTjhBZDBnRVFJUmpu?=
 =?utf-8?B?cHNwalJ5M1lGeVJlb3I1UjdRQ3FoQ04wNlJWMm9pSGRHYUw0OHM0VmVIc0oz?=
 =?utf-8?B?anU1V0YrMU81V2dHeUI3SHg0ekE4MW9PdkRzNXNmYnFqNmt3by85bVErdTRk?=
 =?utf-8?B?OTR3UHVJNFZjTEdGSHlmcHZIL3BwMng0Ui9MNndQQ2UyMnlPbmQ3cGJrNy9L?=
 =?utf-8?B?cVgwaVJGTmNRc1dHU1QweHpxZVI5ZWhheTRXT3ZIamh4UEZrcmF5WFVLd1JI?=
 =?utf-8?B?VmlHNlFwSGtCa2RQVzluZDdTeko4ZERPTjFxTzkrcFlZMGc2b1BSaUNJb3ln?=
 =?utf-8?B?RmRjQXZjcDJrYlgvNXhqU2lZZDAwMXdCQkY2U09SS2dTNEw3UHhoZVR0ZVRo?=
 =?utf-8?B?dXVIOFlKalh3UTBORXV2NnA2WjRUa01VL01hc3IzWnhiVGp6V08yOGNpZmNB?=
 =?utf-8?B?cElJM0ZnOHlXNjRmWnBXcWtsN0U2TXBEYzlHZnRWeHdsSm5Ibi9nVS96UFBl?=
 =?utf-8?B?bFl0c2RUVGV3Smo5RUV4RG5DMGI2QUtPcmdGbE55ZFhrL3F3R0pkNS9Eei9B?=
 =?utf-8?B?UUFTeXhmYzY1YU1Ua1c1ajViQW9uejh3REJqN2svR1lIeFlnSHdUMi82c0M2?=
 =?utf-8?B?cCtSOFFUdHBpZjMyUyt2TDFSYWRaR3pNQ0FMUENoWWthY1RPaVI5bWZkTElC?=
 =?utf-8?B?K3h0cjVCK0hhNGU4YlY0Z2Uxclp3SDhFMkVDZ09valY2ZGhnSTIyL2l1cUdI?=
 =?utf-8?B?NEI3VVFzSWFHRVVLeWpqbU1zWjJPUkRyczZ4dHZFeS9FWWhkdmxHNzY3QkVk?=
 =?utf-8?B?cXd0eE1hTmNJWFZzc2ZIRVlaNVJKaUJFa29iNDFBUWY1QVIwa0tMUXF4Q1FX?=
 =?utf-8?B?RUNWR1RlOExCOFpndTFyTnJyMnJFK1VuaXRCUlA2M2hCblZWaXZrNnZaci9s?=
 =?utf-8?B?QVNIVmJrSG1UYUpYd3FRQ0M3VWcvK0pERklsU1A5dk1pbitEVFNCZzEwTnp6?=
 =?utf-8?B?OGdhSGZzbEVWTzBIR3ZKWmRnUHEweUpId2dTckhyR01VMlZ6ZEUzUDBJbmh6?=
 =?utf-8?B?WDZ0d1NyRWpzOGZUSUpaWEs5TG9mdzZGU2dodkQyd3RmUWdaSnk0U3l4bmRs?=
 =?utf-8?B?anhoODU5Rnk2N0gxeUxEc0ZOZjhOOFpEN1hiQjZoUFlJcGo3RTFqKzBPMTd3?=
 =?utf-8?B?QVhFa3dVMExEaXEvZFFYY1I5V1pNQ0Q0djg4VzdraHlFaHJoYnFKZWc4emJ6?=
 =?utf-8?B?L2xTaWEvcHNwYlc4ZEhnYkVmS3dRRWFxZWFnTDVOZko0NURoS3ZlYUtZd0Rw?=
 =?utf-8?B?WEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 77ab689e-40c8-4461-d59a-08de29f8f462
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2025 18:57:16.3659 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ncrz+5TEP9TbNlW5NoGqkiIKlp7dnLs9OmV8V08GvamIMz/3M5P4nbT7xE5NSdBiEdMKRhQg7BfRvWnII4PV4rapKjGYDBBnUJLh391D8CM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7527
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



On 11/22/2025 5:58 AM, Anoop, Vijay wrote:
> From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> 
> Since different drivers can use SoC remapper, modify VSEC code to
> access SoC remapper via a helper that would synchronize such accesses.
> 
> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_pmt.h               |  3 ---
>  drivers/gpu/drm/xe/regs/xe_soc_remapper_regs.h | 13 +++++++++++++
>  drivers/gpu/drm/xe/xe_soc_remapper.c           | 18 ++++++++++++++++++
>  drivers/gpu/drm/xe/xe_soc_remapper.h           |  1 +
>  drivers/gpu/drm/xe/xe_vsec.c                   |  4 ++--
>  5 files changed, 34 insertions(+), 5 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/regs/xe_soc_remapper_regs.h
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_pmt.h b/drivers/gpu/drm/xe/regs/xe_pmt.h
> index 0f79c0714454..240d57993ea6 100644
> --- a/drivers/gpu/drm/xe/regs/xe_pmt.h
> +++ b/drivers/gpu/drm/xe/regs/xe_pmt.h
> @@ -18,9 +18,6 @@
>  #define BMG_TELEMETRY_BASE_OFFSET	0xE0000
>  #define BMG_TELEMETRY_OFFSET		(SOC_BASE + BMG_TELEMETRY_BASE_OFFSET)
>  
> -#define SG_REMAP_INDEX1			XE_REG(SOC_BASE + 0x08)
> -#define   SG_REMAP_BITS			REG_GENMASK(31, 24)
> -
>  #define BMG_MODS_RESIDENCY_OFFSET		(0x4D0)
>  #define BMG_G2_RESIDENCY_OFFSET		(0x530)
>  #define BMG_G6_RESIDENCY_OFFSET		(0x538)
> diff --git a/drivers/gpu/drm/xe/regs/xe_soc_remapper_regs.h b/drivers/gpu/drm/xe/regs/xe_soc_remapper_regs.h
> new file mode 100644
> index 000000000000..9edf234227a9
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/regs/xe_soc_remapper_regs.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +#ifndef _XE_SOC_REMAPPER_REGS_H_
> +#define _XE_SOC_REMAPPER_REGS_H_
> +
> +#include "xe_regs.h"
> +
> +#define SG_REMAP_INDEX1			XE_REG(SOC_BASE + 0x08)
> +#define   SG_REMAP_TELEM_MASK		REG_GENMASK(31, 24)
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_soc_remapper.c b/drivers/gpu/drm/xe/xe_soc_remapper.c
> index f5a02abd6ab1..85d37a86117a 100644
> --- a/drivers/gpu/drm/xe/xe_soc_remapper.c
> +++ b/drivers/gpu/drm/xe/xe_soc_remapper.c
> @@ -5,8 +5,26 @@
>  
>  #include <linux/spinlock.h>
>  
> +#include "regs/xe_soc_remapper_regs.h"
> +#include "xe_mmio.h"
>  #include "xe_soc_remapper.h"
>  
> +static void xe_soc_remapper_set_region(struct xe_device *xe, struct xe_reg reg,
> +				       u32 mask, u32 val)
> +{
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&xe->soc_remapper.lock, flags);

we are converting Xe to scoped based locks, so:

	guard(spinlock_irqsave)(&xe->soc_remapper.lock);

> +	xe_mmio_rmw32(xe_root_tile_mmio(xe), reg, mask, val);
> +	spin_unlock_irqrestore(&xe->soc_remapper.lock, flags);
> +}
> +

btw, all public functions must have kernel-doc

> +void xe_soc_remapper_set_telem_region(struct xe_device *xe, u32 index)
> +{
> +	xe_soc_remapper_set_region(xe, SG_REMAP_INDEX1, SG_REMAP_TELEM_MASK,
> +				   REG_FIELD_PREP(SG_REMAP_TELEM_MASK, index));
> +}
> +
>  int xe_soc_remapper_init(struct xe_device *xe)
>  {
>  	spin_lock_init(&xe->soc_remapper.lock);
> diff --git a/drivers/gpu/drm/xe/xe_soc_remapper.h b/drivers/gpu/drm/xe/xe_soc_remapper.h
> index 3cfd44f1fd74..75431b94e66a 100644
> --- a/drivers/gpu/drm/xe/xe_soc_remapper.h
> +++ b/drivers/gpu/drm/xe/xe_soc_remapper.h
> @@ -11,5 +11,6 @@
>  #include "xe_device_types.h"
>  
>  int xe_soc_remapper_init(struct xe_device *xe);
> +void xe_soc_remapper_set_telem_region(struct xe_device *xe, u32 index);
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
> index 8f23a27871b6..3e217fb75394 100644
> --- a/drivers/gpu/drm/xe/xe_vsec.c
> +++ b/drivers/gpu/drm/xe/xe_vsec.c
> @@ -16,6 +16,7 @@
>  #include "xe_mmio.h"
>  #include "xe_platform_types.h"
>  #include "xe_pm.h"
> +#include "xe_soc_remapper.h"
>  #include "xe_vsec.h"
>  
>  #include "regs/xe_pmt.h"
> @@ -163,8 +164,7 @@ int xe_pmt_telem_read(struct pci_dev *pdev, u32 guid, u64 *data, loff_t user_off
>  		return -ENODATA;
>  
>  	/* set SoC re-mapper index register based on GUID memory region */
> -	xe_mmio_rmw32(xe_root_tile_mmio(xe), SG_REMAP_INDEX1, SG_REMAP_BITS,
> -		      REG_FIELD_PREP(SG_REMAP_BITS, mem_region));
> +	xe_soc_remapper_set_telem_region(xe, mem_region);
>  
>  	memcpy_fromio(data, telem_addr, count);
>  	xe_pm_runtime_put(xe);


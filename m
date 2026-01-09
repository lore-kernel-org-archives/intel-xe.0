Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A14E7D26D6E
	for <intel-xe@archiver.kernel.org>; Fri,  9 Jan 2026 16:00:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64B3E10E8FD;
	Fri,  9 Jan 2026 16:00:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X4hYAYyG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A977F10E8FB
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Jan 2026 16:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767974443; x=1799510443;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Wo6+NO6LpTUsP8eQ6SQ4lRFUuO+UEXmVCUOqtsn78Do=;
 b=X4hYAYyGCZ61g/0svmY3knHAx8kiHfW7etC6DhJfjNeIb7ZAscg4kJEw
 SkZqwbU42qubEVCyVKFAWD2gkCf3W0Ys11lT4CpIssjtfgk6//h1Gf7wu
 W8ohy2wqi6HbzO9i610b/LA4UrfF3W1t6IfN+HaR+iCYcbWs7z76QLNOQ
 oLJmMbiI7Zv4tcAgUfw3mxAIGyPaoDpKkUIVhQN815WwVAnJBHFgMRnRN
 OPFIQAp67XCB89o6Qb9kFR8eF5dF+9TGZHCx+FD6skmQ01FGnML/NxsOB
 nsKcHFRRuUjxt6nonf1xM6aqRusFjbFGlHQC7rharJawEzKmtADeunzUq g==;
X-CSE-ConnectionGUID: EL124wf/RfWqUCBdiUi8mw==
X-CSE-MsgGUID: rVbA6tNPRaSQZnocxlr/MQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11666"; a="73202897"
X-IronPort-AV: E=Sophos;i="6.21,214,1763452800"; d="scan'208";a="73202897"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 08:00:43 -0800
X-CSE-ConnectionGUID: gCInrX+8TWeL4LWin6NSUg==
X-CSE-MsgGUID: 4A35TTAUQUC8GWi9kYXHYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,214,1763452800"; d="scan'208";a="203930056"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 08:00:43 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 9 Jan 2026 08:00:42 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 9 Jan 2026 08:00:42 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.18) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 9 Jan 2026 08:00:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AxydSivRKhHj0Eff9IEdFJ3FBn/zPYmkVBvt8GncDloAWa3u/YPOAoVyBn0Kd9NdR4aSG/rsF+r/DqAyAFHREsK0XT1H5XqoFI9gNtB6CmiDqKT+2wewJzLiWjzUuLwg8j0GcLwoPvTe251uXm54qrHkM3qfi6d0+0fkYT/ciSzuI43kdtHhgZ0GA42aTTyZWfk8qG1akkcw0AYDBNrDBFOoyiek3RxIwAcHzu4KqMqXnjEMGDir5F4ZeFFMsafwV7X8t936HQ+3psXb96W1pv1oI5M9XwDvSAcZjOKiHE0nnSQ0Xi4AMvugGhQ2jTuiDiUemW/f7cj8Fgv/7UhfDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6G8/V/Fa4czEkQbYnLgZ7rWIZGizwZ8nOnLa1T7VWbc=;
 b=kRurct2j38VlfxpI7h7VW/fziCQ+7bYY9mqlR+G5WZFgq9TAUvsx6JZXM1hj2UfJm7gu8WswFjzPhHeR/6S/nDEOUeitxL+M1atxUAWjtAyk2yFzaScao7MisgRQQAlA6WVqrtnQLQAjiLkPW/Uurj+jcrpQo4QNXVoL3xkT9sJxhsEZAvnk3Shqh66ARojW7DOb+sZkYLU5EiRFc0l2SopOhW20Mdd3zSDIerlipPmT0ezt+pf9Qim2EKUAOWhqUntAwwDgERi7ombl4bH9xijHUAjrdlcXPdifDTYwECpedFWI0JotEz2hABEgxwM3/VrF7luwyj2IDZHcK6dnBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5482.namprd11.prod.outlook.com (2603:10b6:408:103::16)
 by DM6PR11MB4674.namprd11.prod.outlook.com (2603:10b6:5:2a0::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.5; Fri, 9 Jan
 2026 16:00:39 +0000
Received: from BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::d269:c67e:1cc2:d1ca]) by BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::d269:c67e:1cc2:d1ca%6]) with mapi id 15.20.9499.004; Fri, 9 Jan 2026
 16:00:38 +0000
Message-ID: <b50dcb97-870e-4f4c-8b61-6f6bb30c5709@intel.com>
Date: Fri, 9 Jan 2026 17:00:34 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] drm/xe/mert: Fix kernel-doc for struct xe_mert
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20260109151219.26206-1-michal.wajdeczko@intel.com>
 <20260109151219.26206-3-michal.wajdeczko@intel.com>
Content-Language: en-US
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <20260109151219.26206-3-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P194CA0049.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:803:3c::38) To BN9PR11MB5482.namprd11.prod.outlook.com
 (2603:10b6:408:103::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5482:EE_|DM6PR11MB4674:EE_
X-MS-Office365-Filtering-Correlation-Id: 37469fa1-d9c1-4450-5523-08de4f983ae3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WXYvQndoaGQ1UE1PdlkrTjJxU3RTcU5NcEFOczFRWFlhbUY3UTZRV3g0VElG?=
 =?utf-8?B?RWtXTGR4TDFSdlJZTktmU044WFBGK0E5QXdwM25SK0xnTWNNMDdjb2pHNmJP?=
 =?utf-8?B?Wk8wb0RqVEVzSUk1bW1NVUltcURUb1U1WkdMbXRZMzJUOUdsU2w3Umc5SFRH?=
 =?utf-8?B?ek9idGc0WVN3bHlTVTN2ZzBHVkNmb1dDMVBUT0NDUTM2QmhEeEU3WDlLOGJN?=
 =?utf-8?B?MkZOeTBvSUllR29ESnppSWcvUC9Ic3lxUnpBYW9ST3c3M3FKTzlISkMvYmxS?=
 =?utf-8?B?WkE0K0RKMzNjNEpOQloxN1gvQTRveC9FL2dWTE9yNnNJUElvMWhoNEVFYXEv?=
 =?utf-8?B?d3hOQWR6Y0lCUVJHNENORmlsM2ozeW5qcmRCMzVjVGZDSHZqYzdybVVqam5n?=
 =?utf-8?B?SlRGZFdYQi80Z0QxUjc5MEtsaHNGOTdTdmRBRHJKZGVySjl5aXBYekVrQXA1?=
 =?utf-8?B?Ryt4L2xuYzdNeCtMb1FKeEg5ZExKU1pId0VIYTVnUFhsZE9Qa3BYcnN1MjVK?=
 =?utf-8?B?MFg5RjR0a2Q0V05yTmtxM1NrMzlPbldqUVpwM3dNMFRIOUVIUGRySlZMdnNK?=
 =?utf-8?B?TXJ6WVBaWkpRQnRlUXhwWWcyWTVJOE1mVncyWjNXckFueWF2dmdJVldtdkFa?=
 =?utf-8?B?RVNLM3BpY0xIMVh4VVFHa3NBL3ZnU1pycnovaFBQRDRGNHZQcDJSOVM4S1Zh?=
 =?utf-8?B?ZGxYUWJoQTBRMzFNdTBWZ09xSnY0QUg2NmVqNmphaGd0djFGWmZpa2haNzlT?=
 =?utf-8?B?V3JvL012Wm9zajF3RjBUckZEeUtjckYwdytlSkh6M0VBZU1SS3BOc1FMU3hO?=
 =?utf-8?B?TnI0TWdMeWpvQ083SHIwa3ZlbHZEWnYxUDJzSzdFVVYzaUtpUWJ2VjlFNmdP?=
 =?utf-8?B?Vms3cUU4YXhDZVQ0Y1dhd1dyaFYvekQwVVlOYzRFWWdteFRXYW96VW1ObXJS?=
 =?utf-8?B?TWxjZFloK3hpVElZYUFDaG1lUFg4enhVWnZTbnJLak9GTW15UEZybmlkRGla?=
 =?utf-8?B?R3BlNEVza1QweWZsK1BjVGJQTkI2Wlo5Y1h1ZE4yRGJCMCs1eEF1Y09kRXd1?=
 =?utf-8?B?dUpOMHFxQitGR1NGSXVQSkJqdVU2MEtSYjJUYUx1SzFmMjF0YmpyZWl0bElp?=
 =?utf-8?B?VVZDR25lamxRdWFSeHFOcW1COGZEWVZsM0dGdFR2MGtENXRMOGhML1VjQUNt?=
 =?utf-8?B?SnBoMWVjMDRreU5xZVNsU25pSWNuTWZ4OEUwVlRjc3ltRGlHT2JTOHZOeDE4?=
 =?utf-8?B?WnI4NENkMXVMNGRMS1FteWc5UjlzUDR5Qkgzczh0RVJ5NnBTb2c0UWFYTFMw?=
 =?utf-8?B?c3NRMEpqWmFYRU1OUnV4aGJsUHhna0RYYzRPeGhkNFREblMwL2JnancyRzh2?=
 =?utf-8?B?a2s4NFBFMDFPMXJQYzZLaU5KaUVWVjluZEV5dWo3b1UrMEJ0MjczK2NXSjhI?=
 =?utf-8?B?a1BvU1F0NmRYUnNtNFYxM1dRTVh1K3g5a0hGRFdKSDR5dWpiTDU3aG16S2pq?=
 =?utf-8?B?enFvNk92NzM0Zm03UEFsbnJ6WmpIUkN2VUd3a241UG9ETnpSK0RJdkFGMDZU?=
 =?utf-8?B?dTBwZkxOZEhpVitmQVNYbUN6NmlWVUgyVnJtbFVOOE9rQWJJTStaN0RzRTNj?=
 =?utf-8?B?K2kyREk4bklIUHZmNHRQdEJrR3kyNnFUV2xYcjlzdk82YjUwdXBuMG85OUpy?=
 =?utf-8?B?S0hCdHl6OUhmVXJEb1AvdTJjdTkyNEpHWkR1TkxhdXcyQ1ZQREdRWWJGZDk3?=
 =?utf-8?B?U2JwQ1FIUUQ0eXllVkpBV1FiMVByeFJMV2ZoWlJOeC9LQURYMHV6VHBheWNl?=
 =?utf-8?B?N0NvWG5LVVpSY1htclo5ZWdXYjcwQVkzNVNYUzZldzR6eDBNL05xbzY0Rjc1?=
 =?utf-8?B?RHJxSXNkQjdaYkNLZERaV2ZTb1B6WlpMTHNSdFZOS1JoSG9RTWVFOHhUY0xy?=
 =?utf-8?Q?DozNZSpyCZbtMLHVekdz1kGVyhgE3YjZ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5482.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cm5vcDFYeDNONWhEeklZcjhTRkhOcUNSWElhWUxwWTRTL1RwengvY2ZPUXVR?=
 =?utf-8?B?Z0g3ZElQTHNza2FwU1k5QlBOaGhmZ3BKWlQxZHRJQndsdjJESU5lSTFqakow?=
 =?utf-8?B?Y3p2R2RxOWo1TS9pV3B2WDAzNlV0R0gzM0V5VXl3bC92ay9Pc2g0VERvZW9a?=
 =?utf-8?B?d0VxOUlrSFJpM3Yxc1dXUUV6RU5zN2xEWW1Ja3I2RU9uVzlHWlM0dUJxSEVl?=
 =?utf-8?B?ZXZMdkpyS1BOdTlBK3FOYXFGMlZYKytnUGtrcjZKN1ZMeGhSWDdha21qM05z?=
 =?utf-8?B?YUZremFrQ24rQ1BLOHJLbEtWaWhuSVJpa2hUVWdmWTlrV1VpVThVYWcrT1Ba?=
 =?utf-8?B?WW4zcXQzMC9oRHptZy9Uei9KaElhcm5rb01ya1Q4b2RRVUs5eEtCaEQ2Mmkw?=
 =?utf-8?B?ZXZUSEZLcm5kNnd5VVFIRTN5ZEdJNElKNStPRmF6MnZwMkgzeDFIRmpJZk9D?=
 =?utf-8?B?VXd4K1p1bm1tREN1eStKSjRhbXJaVHNUYWR1UHlyWDNGUmxnaDlUWVo4WUpX?=
 =?utf-8?B?b3VjOXAvVzdEK2RBRFJWZ3Y3RXhWTmNVNTBGSVJoK280V3BrTTVUOXlCVzRx?=
 =?utf-8?B?bWM0UUh4azk0eWhmdDc5ajU1MDV0QWEvWmJndHdJRzJZUXluTlJlMVE2U1Rz?=
 =?utf-8?B?Z0pIanZ6YTNCUW5SYWhLZHppQVllbDB4UnJVeno0cDVyZUZRVmVsdGE4SHdn?=
 =?utf-8?B?S2FwMG5LUkJ2dVVjL1FlMUhXOWVYZDhQWnJnUXJaUGNwa1B1Zkx3bGE5cHJP?=
 =?utf-8?B?SGF6T3RnTmV1MFN6Zk9iQk10NkRndEp6MG05SmlqU3E5T21MTm9ReEZNWkxz?=
 =?utf-8?B?aTU5R0t0azdOc2xEZ21McjVQdDBPN3hhZkxpTWRvSzhhVGRTNGtsQ3dSRHNz?=
 =?utf-8?B?WkJBRjF2YURuUXhtaE5DUGxvRHlwRkpGNDJzV2hoWVNPamNFRWc5UWFFWTRo?=
 =?utf-8?B?K0dxTUpzbitBLzBXaFVmY1V0dFZjcHZYWkJkeHh6cEpDTkQrNVZXRkZsZG1P?=
 =?utf-8?B?VnlBT28rQTBhbElzelFoWkVyMm01K2FGcURZRHBzSmtnTE1vUkJkU0hSZzA1?=
 =?utf-8?B?bVlzbXBvbEJGTXBhT0w4MFczbUZkTDM1TFl6ZzMzb0M3VGV1MTcwSEFCWGha?=
 =?utf-8?B?bFZSVlZQeEUvblN4UXlRb0dLUElud2FISEFPOWVxL3ByckNPb1MxaTdtM1BH?=
 =?utf-8?B?UlJHRjN3a0JOOU5FMGpJNS9TZnhNdnFMMFdsWTRHd1lSSWhQNnRINDJNbVpv?=
 =?utf-8?B?eEllU2hTZEVCRFdJUlVuZ1RoNWNqOU9ORytPOXphSUlnT2lMZ0hXbDNWTUF5?=
 =?utf-8?B?VmR1N1AwS0VjNW51anl4NW80YTlHM0dudkVPd3VFeEhyb0NQcTU3a05qb0xO?=
 =?utf-8?B?Z09SNHQwZFk5dUx0TDlUSlhYbkJIcEhRdE9KMkxDWTl4OEdabnJHMG5GOEpT?=
 =?utf-8?B?NnR1VWRhYTdMT0RaNm5SM2FHVUIvVldOQmloY1U0R3dHTUwxVHpDbFVIY0Fr?=
 =?utf-8?B?V2taTHZRMW0zZWx0NDFDWHpJN2VTYWdLMU93bFAwbDVvaUZOanlxVHZ1elQ2?=
 =?utf-8?B?THcwNi9zb0Q1Skt2S2QvSFdMUis0Z0RaNTNkbk9vWC9uVTNEdGhmVUFVSWNQ?=
 =?utf-8?B?MFVJSDVYZVM4UFVTZXI5Tk8rSkJOY0gyQml0Z3dBMlhDRGNUT0QyQ2RyTTV5?=
 =?utf-8?B?RGJhbFhwNG1ONGlhZ2VwNzB1WVBXRk93WjBzL3pkd2tBYUtJZkk1SGRTYkZ0?=
 =?utf-8?B?UThveE1WSyt0TU1uRnVwNVlNTVhFU29LdU5jYjFwUStYdm9peloyb0pPb0tM?=
 =?utf-8?B?dCt2OFVZNUhMK0NackllN0tsOHR2c3luZDVIYzZWNlBZRXJZLzJFTjhLZUlV?=
 =?utf-8?B?a2tXVzdqTXY0b2YvSzJVOGM5ZnNzVjVaZnh6eksremdmdzllRmpiWi8rcjFC?=
 =?utf-8?B?eWFrN0xpaEVKdXhUTzFxM1hHM3ZEbzhmS05kRE9oajlFWVlGZCtMUEhLNE9Y?=
 =?utf-8?B?SVFPSUp6YnZScFQwWjUxOTd2Z3cwNlFja3p5MUdXY3dXT0NGMUNPUGxtRkNr?=
 =?utf-8?B?YlVuVDArb2haMEIrS0xaN3ArSVA1cUR5N213b1Y5TS9zSDNnbEJRaWNkQWJG?=
 =?utf-8?B?SmRoVGJRZDdiemo5dWxZNkVCc1VWUDVVTlBIazI4blVuNXlzeGtueEFRZXZR?=
 =?utf-8?B?K2VjWnBnOUliS0cwN3hoV2llVkk1Y2phZzdsbXpVRlBHejNUTnpXTUFyeVJZ?=
 =?utf-8?B?Uld2MnpvWGlaY29tWXIwVFVtWnFyUzBvc2ZsVit1YjVyTms1MTFKejBFZ0xv?=
 =?utf-8?B?TGZDUmJuVUNzY2RneHQ3N2J3cUgyYUJneGJSSExOVmdCaXB0TWs0UT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 37469fa1-d9c1-4450-5523-08de4f983ae3
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5482.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 16:00:38.1000 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cInKmm8y0owizn59eF9h/AKLwDkVTg82I0D6rVmSc9uaUuKWOytFZGNY/uV1quhUC+62O6bvDZrWFyo7GRVAPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4674
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


On 1/9/2026 16:12, Michal Wajdeczko wrote:
> Add simple top level kernel-doc for the struct itself to allow the
> script recognize that and fix tag of the one member.
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>

Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>

> ---
>   drivers/gpu/drm/xe/xe_mert.h | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_mert.h b/drivers/gpu/drm/xe/xe_mert.h
> index 0de8243e46bd..0e27f9fa24bb 100644
> --- a/drivers/gpu/drm/xe/xe_mert.h
> +++ b/drivers/gpu/drm/xe/xe_mert.h
> @@ -13,12 +13,15 @@
>   struct xe_device;
>   struct xe_tile;
>   
> +/**
> + * struct xe_mert - MERT related data
> + */
>   struct xe_mert {
>   	/** @lock: protects the TLB invalidation status */
>   	spinlock_t lock;
>   	/** @tlb_inv_triggered: indicates if TLB invalidation was triggered */
>   	bool tlb_inv_triggered;
> -	/** @mert.tlb_inv_done: completion of TLB invalidation */
> +	/** @tlb_inv_done: completion of TLB invalidation */
>   	struct completion tlb_inv_done;
>   };
>   

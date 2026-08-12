Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC071C5AC67
	for <intel-xe@archiver.kernel.org>; Wed, 12 Aug 2026 00:09:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91B6510E3A7;
	Wed, 12 Aug 2026 00:09:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QqWYNUlp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7F2010E3A7
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Aug 2026 00:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786493363; x=1818029363;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0/umSwGDSokS1r/ZTNtiRPjPnVdXu49OB/kY3NsqBY8=;
 b=QqWYNUlpNRvISTLdjfPA3SHb7SpOWCOfmEd8CxwEpRziZdzChdFWHy2P
 MxTluuMpcwgqbjxj+hU12/Dezt9ZQyNLxt7zEmLB3I7IfXfKcceNo3WdI
 anbJcwxHby1DOY8Jo3/X2htYzoDCnaApb7sHuGtzIztfdrVGj6SnKmUZF
 9m+3Nm8xI2znLhx1gypZfWrj/k+cTyvso9qYGe7d/IM5CyOK/GW996gHR
 5u/phZ9hZLQNJ+QBBfDTnFptrqsRYTG4hGXXcKWWklrBEExX369+HsmK5
 vP4wG76bzvZCU0FovH4mZwu6vaOmTVj/RLK2SbIGY5IIWKalm7EyaQDK7 Q==;
X-CSE-ConnectionGUID: 7eHYM3WfSF+J2EdNZee5Rg==
X-CSE-MsgGUID: IM3kpacVSCq/DpXjV1xyKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="87057292"
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; d="scan'208";a="87057292"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 17:09:23 -0700
X-CSE-ConnectionGUID: 7c8BkClIS8iLNXOftwf4zw==
X-CSE-MsgGUID: BE9aJ4W9Qbev1knhVJvpoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; d="scan'208";a="259633923"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 17:09:22 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 11 Aug 2026 17:09:22 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 11 Aug 2026 17:09:22 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.58) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 11 Aug 2026 17:09:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wAbDwe/eS+6+iW+6PuJqx4CKMKAODc92OMuQaxzQWFU0DvRG2jqwJm63msnpwpZmExaKXLmSLsatCquwaEjf/T9ZuF63GIV+5MrKCYl9er588z/H4XaSlnPEHvEn2dmcQ6ix276XG/7rLiiJaSvlLMOoB5MdX50KND3+Jzk631L91zS+Upa98OIjsh0Y+SNYFDOaB/jb+h2ZxU35m6UWb+PWuwNhpzNQP4Xz+v8SjBT55/GRvammlkHTehGWQ1Wj/HbVXzEuMXxGSkZ1+R91/cHYOaOoqYz7vgxBzn/ciwOrBd1eQnTT/fuKBSjQjwSxerYA1tuafpdCNSwlL0A+ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zoTbtxOUlmi2Hn2P+JXwefpOwc7jfEw4IthdVP9X6wU=;
 b=N9eKT9lo6yaFG4coPakiw4MRYHHVAFmZsSO3EVgqDFTOFsVX6xZ0dCScNUKQTgI1fspt12gz+DQL1cGGwrsH4xzMq2eMPOBPZ9yWoyicTtMFq8pTeFdenIa5xFrMPVvrH0f0ZPTLvY/MXE8iuxlJTgohiy3md81F0Ob0fqxkWxPTMkg8qxhKDAylOVjhtemz8F3leS97FpGuOWAEQeJmSEk+oyncvEPTLyA3q4Eo1hdtfC9jErbU4VZ4vEINcUUo8Gw8XRCMq8bZvGTuKUspg1xSdcJHxN4HQRGe/eSGObMDWANP4gOtOcYHgTm1PxuOub6wWZ0IjvKfgybPh1nhqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by CY8PR11MB6842.namprd11.prod.outlook.com (2603:10b6:930:61::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Wed, 12 Aug
 2026 00:09:19 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%5]) with mapi id 15.21.0292.024; Wed, 12 Aug 2026
 00:09:18 +0000
Message-ID: <cac58bb4-22b9-4f2d-b430-02562a43b380@intel.com>
Date: Wed, 12 Aug 2026 05:39:11 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/23] drm/xe/log: Introduce structured
 component/location identifiers
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Aravind Iddamsetty
 <aravind.iddamsetty@intel.com>, Raag Jadav <raag.jadav@intel.com>, "Riana
 Tauro" <riana.tauro@intel.com>
References: <20260730152121.576-1-michal.wajdeczko@intel.com>
 <20260730152121.576-4-michal.wajdeczko@intel.com>
 <e58bf20d-6583-44ad-83b1-69950b766c45@intel.com>
 <e84496d6-d47f-4319-b2ed-c0a862d1b80c@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <e84496d6-d47f-4319-b2ed-c0a862d1b80c@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0120.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::9) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|CY8PR11MB6842:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c02d206-80ca-4f2a-bf1d-08def805f401
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|6133799003|3023799007|4143699003|56012099006|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: bPpGNX6TxSOMjT1euaLHVZyxjQfNwkxp0GOqARRP+uKUUFcpoySlNqMcFiEKdq4TqbfMZq20RaGIVFjkGTtjesbyZY43ySYillW5UnrXhVjTUWRwGKvYbIhiDtlTmyhLonJStteuPPpY/My0PrQ+OCRDVYQKz7bzITKHTJojprJHTpNW4Ica4AIcVH2Mz3A1APUTXNLKXbaiVpstqqjrwhO4Dvq+Om5n72SVkzwTRCdtZMN04O953bFmBKIuJElMWg9sYM9lvaJIc1yz7mOUOWLLCAL4NMOV8fXcpft0jiEIlwM74lTUDTg92QykutqYOJ/JpK5HXIu4OpWaTqCK73SLsRC5t7azEgVNgn2ljuqVd4qSCmK2wgH8G/WtnR7aR70ZmsyxHkCQOd5/9UPxO1Wp0bJflPeQFCZYnQezP/1QBn89EC21SGSs/Nmh/13qFWGN26gN39d26bB3U0ijcPnjcbxuNcWZkPIwt+waE3XB8NXO5wOgOTgIagC0sa3RXgAz9ZQ+kkLJxvYK4HEZB7OVR/s6bCmpIXGU+8iosQKq9pjvXVGAr0bteYmziyADBpwTI8aHxk4raSPWM+h168+IFu3+cGSL1o+6L3pySs2dglUtW3acfaZNFvqdlqLF4RBmjJovMWhf3neMI7UJ5N/QpwokzaJ7PcATnPMXA/c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(6133799003)(3023799007)(4143699003)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R0s4OXM2K3FzOGhCREpIUzZndTNITStVOHdlY1hmaVZqRzVHUU5ZcU9FbG5t?=
 =?utf-8?B?cEEzbjd5SU53RTlyeGM5UklOeFB6VGRIeVZxemVlNlBIZ3BMb2Zqc3RSMmo3?=
 =?utf-8?B?c2FlbUZpd0tVUHNQNCtxWGZwY2FydHBJVWlHNXNxbU0zc3RKL2t6STJMbi9L?=
 =?utf-8?B?aWozN1FYTXZUaHBVTzFKNTUxUWZqdnhLZmRua0Z6NFlPSWlyT0VCTjZtYzdU?=
 =?utf-8?B?WFRUMEhIZ2svVnRDK0tzWUZQTmpyclRnOERDRnBnb3BJemVjcFJYZmgxejFD?=
 =?utf-8?B?MDY5QU1IY1ZXY0RhYlhmeHlhMmh6eXBoSlJ0R2x0ZzdsUzhHeUlEM3lCNm1I?=
 =?utf-8?B?eEUrb1dhblBKKzFPSi9LVnBsYSszZmwvMXZLSUdOUHU4ckpabkNzdFpkMUFz?=
 =?utf-8?B?OFN6eEtaQ29KUGpseDRlNXdLR1Rydno0VWpZZmhtSW1WeENZYVMzZjdzUUNm?=
 =?utf-8?B?NC9SMEphcERjaVNXcnE2a1ZIcWVkWEFWWEZ0QVZqUHNodWRQNzFKWVBUWjYv?=
 =?utf-8?B?R2ZrOEczaVNhUE0vYXRQNEpmMmhucEJRTC9wNHVjZFVsRW1TdlJuWjN6L3dK?=
 =?utf-8?B?cTBGQ1gzcTNubU1IbFBzMFlJV2IraFBTM0pFZ0tXSUw0UW03VVhlbWhjOTRp?=
 =?utf-8?B?aTRZUW9YTUR2MENhTEt3bkZxSVc3YlQ5NGNTZnJnallCV3doYkVpYi8xeFo0?=
 =?utf-8?B?bGttRExpMVZpYjNoTithQ21hTk8zV0UzYmtmUnRJODIvMy8vSFhtOFZVQXFP?=
 =?utf-8?B?S3ZPeTkrckpyVXhlOUQva0xrWFhrbkZZL29yVVR0VS9HTW1Ea2xBY1ZRLytx?=
 =?utf-8?B?aTJEbjMvbGpMR1N0N2tNVHcyRFdvUUllK3JZZWV2WmNqdTFRWUdtNWx6TXAx?=
 =?utf-8?B?TTJXWlNJSERFKys0MHRnbW5mSUREc0t4WWU0ZEt0RnpiVytLZ3BnSDA2UWlQ?=
 =?utf-8?B?ek1aTkcwUFh4Y25TbWY5Q0ZXdVB2T2QxNEVGT0pwQVRjNitJeFNHSmd3dUpT?=
 =?utf-8?B?K2hxMTBPRUtFRWR4TTBuck9JVmU1RFhTUzdKZVZyb3YwSjdYZHVhTzNvaUcy?=
 =?utf-8?B?MVVWZHU1RVFxQi9jVGQ2azVNcTdibGtOV05nZTYrRTI2KzcwOWVrVEkwY202?=
 =?utf-8?B?Y1N2TE5RWWFSS2JRdHdKZFVTRk1YQ1pTbGVHM3BFQ2xPYms0QTZsMmw0ZDZy?=
 =?utf-8?B?bzZHWnJBeWZUNUJEVkJndE9LY2hERU9TbjJoSmcyRndIK1h1aFhrcWwwZmFx?=
 =?utf-8?B?WHBmV29xZktjNHdJL1A0aGpDMkNIYkVuVE1HVCt3RUx5QUZadzd5bWRJVkZm?=
 =?utf-8?B?a0NidkhucmE1Rld4YWQxWnQ5dHppaFpsTXVJa053cW9zdXZpRHhxdDhBNUZI?=
 =?utf-8?B?TUNoaHhNUDFBQU9TMVBSS3ZQRXN6Qmp6N1ZIWlRJRXZSVkVRNmh0SDQ4UXpP?=
 =?utf-8?B?U1hwS2F0OXBEWkhPcWNEMmZSVUx3VTE5ZUU3ZlRYdExCc2paSE1PSm53V2tK?=
 =?utf-8?B?eDRVYUoxdUdBcTIrSnFBbTVVRGxMbEFGR3gwWlY5VzM0bm4vMUU0U01ueU1h?=
 =?utf-8?B?elcyaXkvdFdab2NNQmJuZlZZQ3lxa2w2clN3MHQvbGRVZ09udW5VQUR0dktW?=
 =?utf-8?B?bVRyRmo5dEdrdElPazhwZ3Z3em9IVTQ2V2lZdXZLYTRqdlJWNmxyQXVRUGZV?=
 =?utf-8?B?cHJoNUZhVVNLdGRaNEdvOUVGdGd6eVpLOHBRY1c3L2MxY0Y0TE1ObXlNZloy?=
 =?utf-8?B?OXRNUCtIZlNQdDRKUk41by9KMTlsbmhpZGFpd29lMitSR3Z2NHg4Q0U1MTBK?=
 =?utf-8?B?TnJrbENXSi8vWVdDemtnYnRVUzRTUTVvTTZ3eEhQSmJpL2lrOW5VZUIrWlg1?=
 =?utf-8?B?Y1BZZVBmUFlJb2VReXBvMkRldVMyb1I5QUdpK3h3UVRKSHJMb1pPdjhOT3o1?=
 =?utf-8?B?Y3Y1a0R5RDMzRmRxUGcxUXg3Y0hUWjZJVmpZT1ArNDNPSWNBa0Q5dUtkR2dj?=
 =?utf-8?B?UlRiUnp2L2JuUDU3aEdPNGxxc3pMd1BvYzdNR2s0L3BFTjM0cG5LUGdXU3dK?=
 =?utf-8?B?QzhqcnJLZG9TYW03V0FnS2xDeVAwRWs2cXZvTUYraVMzSHluMzZlcUZRYmE4?=
 =?utf-8?B?dnlqdVU0SVk3dkRFQnY1cUczUW1Teks4UXMrRkdkYmhRMlA5TFoveUFzeWVp?=
 =?utf-8?B?NWJLRUdoUndFYW9uV0dxUEl1b2hiK3lnOVgvSkVFWW85RDA4b3FPRGVqK2c4?=
 =?utf-8?B?dnJnNEFGb0ExeXJwQXI2akNTWTUrU0NxUzFEdys3bmNlSm9hZHV1aFRGQlNs?=
 =?utf-8?B?aHN1VkxDU3diOXdUdG5ORlRuQ0lvVVpRYzRMLy8yQTA0dmFnYzhqeWVXeXZs?=
 =?utf-8?Q?0FLKIFVwNYayMMII=3D?=
X-Exchange-RoutingPolicyChecked: YqOMb9fWUcl40VFaay30sRXNjzC4a0B+u8ji1P42Bf9yb6mLkcXKaHsM1GAcM8ACStLIUEvMHu63lAnLHznphzmxOW1MezKdl54ILyUh9tqMpNquZlyYAJpqN22Zh44ZlQx2GOZLYvpdJkb9wVwgFlDqZgN9DkZnBPHobj/XDBp5cZvUeCfOxaHMuPcBJrHPIlKObtdzCGRKApfkOegqZLpC6jWnA0LK7z6UeyTlb0PkYoWtSUtp/Yqud+ojuksf7A3MdrHOPV3Sa95ZP7oI4gU7tTs3HkylQKzaQmL/o0hav7jddflBdJhYZL0KM2PXMs12u/QMyyOkhYNl8bW3HQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c02d206-80ca-4f2a-bf1d-08def805f401
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 00:09:18.7556 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1QJvpxRkDZ4QsyumMN3NWH24AyJKTg+Q8k5FkLvQAWdMAVqORoglRRcrlqH7I1BoyzhvRdDM6YqyMDWp+dGVmGrJVNgw4jwBwPsIh+rnf3A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6842
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


On 04-08-2026 08:49 pm, Michal Wajdeczko wrote:
>
> On 8/3/2026 10:00 AM, Mallesh, Koujalagi wrote:
>> On 30-07-2026 08:50 pm, Michal Wajdeczko wrote:
>>> Introduce structured identifiers for each component type that
>>> could emit a SIGID log entry and for their locations. We plan
>>> to store those IDs in the CPER records for better filtering.
>>> Define also structured identifiers for the supported locations.
>>>
>>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>> ---
>>> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>>> Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>>> Cc: Raag Jadav <raag.jadav@intel.com>
>>> Cc: Riana Tauro <riana.tauro@intel.com>
>>> ---
>>> v2: fix typo, define reserved ids (Michal)
>>> v3: fix kernel-doc to match code (Sashiko)
>>> ---
>>>    drivers/gpu/drm/xe/abi/xe_log_abi.h | 186 ++++++++++++++++++++++++++++
>>>    1 file changed, 186 insertions(+)
>>>    create mode 100644 drivers/gpu/drm/xe/abi/xe_log_abi.h
>>>
>>> diff --git a/drivers/gpu/drm/xe/abi/xe_log_abi.h b/drivers/gpu/drm/xe/abi/xe_log_abi.h
>>> new file mode 100644
>>> index 000000000000..4861a5b58c10
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/xe/abi/xe_log_abi.h
>>> @@ -0,0 +1,186 @@
>>> +/* SPDX-License-Identifier: MIT */
>>> +/*
>>> + * Copyright © 2026 Intel Corporation
>>> + */
>>> +
>>> +#ifndef _ABI_XE_LOG_ABI_H_
>>> +#define _ABI_XE_LOG_ABI_H_
>>> +
>>> +#include <linux/bits.h>
>>> +#include <linux/bitfield.h>
>>> +
>>> +#include "abi/xe_sigid_abi.h"
>>> +
>>> +/**
>>> + * enum xe_log_component_bits - bits for components structure definitions
>>> + *
>>> + * Component identifiers are structured based on::
>>> + *
>>> + *     COMPONENT = CLASS(8b).TYPE(8b)
>>> + *
>> Are 8b sufficient for CLASS and TYPE?  In future we need to increase that.
> we can make it 16b and 16b (as component parameter is already u32)
>
> but ...
>
> are you sure that we will define anytime soon more than 255 component types per class, or have more than 255 classes?

I don't think so,  sooner we will exceed 255 type per class or 255 
classes since we support component parameter is u32 (with more headroom) 
when real requirement emerges we can change that time.

Making 16 bits for class and types are not going make sense as now which 
is unnecessary consuming extra bits.

>>> + * and the structure looks like this::
>>> + *
>>> + *     ├── SYSTEM(0)
>>> + *     │   └── ...
>>> + *     ├── DRIVER(1)
>>> + *     │   └── ...
>>> + *     ├── FEATURE(2)
>>> + *     │   └── ...
>>> + *     ├── FIRMWARE(4)
>>> + *     │   └── ...
>>> + *     └── HARDWARE(8)
>>> + *         └── ...
>>> + *
>>> + * Examples::
>>> + *
>>> + *     COMPONENT(0.type) = SYSTEM.type = system component
>>> + *     COMPONENT(1.type) = DRIVER.type = driver core component
>>> + *     COMPONENT(3.type) = DRIVER_FEATURE.type = driver feature
>>> + *     COMPONENT(5.type) = DRIVER_FIRMWARE.type = firmware driver component
>>> + *     COMPONENT(9.type) = DRIVER_HARDWARE.type = hardware driver component
>>> + *
>>> + */
>>> +enum xe_log_component_bits {
>>> +    /* private: */
>>> +    XE_LOG_COMPONENT_CLASS_MASK = GENMASK_U16(7, 0),
>>> +    XE_LOG_COMPONENT_TYPE_MASK = GENMASK_U16(15, 8),
>>> +    /* private: component classes */
>>> +    XE_LOG_COMPONENT_CLASS_SYSTEM = 0u,
>>> +    XE_LOG_COMPONENT_CLASS_DRIVER = 1u,
>>> +    XE_LOG_COMPONENT_CLASS_FEATURE = 2u,
>>> +    XE_LOG_COMPONENT_CLASS_FIRMWARE = 4u,
>>> +    XE_LOG_COMPONENT_CLASS_HARDWARE = 8u,
>>> +    XE_LOG_COMPONENT_CLASS_DRIVER_FEATURE = XE_LOG_COMPONENT_CLASS_DRIVER |
>>> +                        XE_LOG_COMPONENT_CLASS_FEATURE,
>>> +    XE_LOG_COMPONENT_CLASS_DRIVER_FIRMWARE = XE_LOG_COMPONENT_CLASS_DRIVER |
>>> +                         XE_LOG_COMPONENT_CLASS_FIRMWARE,
>>> +    XE_LOG_COMPONENT_CLASS_DRIVER_HARDWARE = XE_LOG_COMPONENT_CLASS_DRIVER |
>>> +                         XE_LOG_COMPONENT_CLASS_HARDWARE,
>>> +    /* private: reserved identifiers */
>>> +    XE_LOG_COMPONENT_NONE = 0u,
>>> +};
>>> +
>>> +#define MAKE_XE_LOG_COMPONENT(_CLASS, type) \
>>> +    (FIELD_PREP_CONST(XE_LOG_COMPONENT_CLASS_MASK, \
>>> +              XE_LOG_COMPONENT_CLASS_##_CLASS) | \
>>> +     FIELD_PREP_CONST(XE_LOG_COMPONENT_TYPE_MASK, (type)))
>>> +
>>> +/**
>>> + * enum xe_log_location_bits - bits for location structure definitions
>>> + *
>>> + * Location identifiers are structured based on::
>>> + *
>>> + *     LOCATION = TYPE(8b).ID(8b)
>>> + *
>> Are 8b sufficient for Type and ID?
> we can make it 16b & 16b (as location parameter is already u32)
>
> but ...
>
> do you have any new location candidates in mind that would require more than 255 IDs or that we would need to define more than 255 location types?
>
> currently we have:
> 	TILE	max ID = XE_MAX_TILES_PER_DEVICE(2) = 2
> 	GT	max ID = XE_MAX_GT_PER_TILE(2) * XE_MAX_TILES_PER_DEVICE(2) = 4
>
> even if we add:
> 	VF	max ID = 63
>
> still everything < 255
>
> unless we would like to use someday:
> 	PASID	-> 20b
>
> but then 16b/16b wont work either
>
> I can change location bits to TYPE(8b) and ID(24b) if you think it is required now

Looking at current use cases, 8 bits seem sufficient, however we plan to 
use something like PASID as a location

identifier in the future, where ID's can grow to 20bits, in that case we 
need to use

LOCATION = TYPE(8b).ID(24b) rather than 16b/16b. In future the pressure 
is much more likely to come from the ID

source. For the current known use cases, 8b/8b looks fine right?

Thanks,

-/Mallesh

>> Everything else looks good.
>>
>> Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>>
>>> + * and the structure looks like this::
>>> + *
>>> + *     ├── DEVICE(0)
>>> + *     │   └── MBZ(0)
>>> + *     ├── TILE(1)
>>> + *     │   ├── Tile0(0)
>>> + *     │   ├── ...
>>> + *     │   └── TileN(n)
>>> + *     ├── GT(1)
>>> + *     │   ├── GT0(0)
>>> + *     │   ├── ...
>>> + *     │   └── GTn(n)
>>> + *     └── ...
>>> + *
>>> + * Examples::
>>> + *
>>> + *     LOCATION(0.0) = NONE
>>> + *     LOCATION(1.0) = DEVICE.0 = "Device"
>>> + *     LOCATION(2.1) = TILE.1 = "Tile1"
>>> + *     LOCATION(3.2) = GT.2 = "GT2"
>>> + *
>>> + */
>>> +enum xe_log_location_bits {
>>> +    /* private: */
>>> +    XE_LOG_LOCATION_TYPE_MASK = GENMASK_U16(7, 0),
>>> +    XE_LOG_LOCATION_ID_MASK = GENMASK_U16(15, 8),
>>> +    /* private: location types */
>>> +    XE_LOG_LOCATION_TYPE_DEVICE = 1u,
>>> +    XE_LOG_LOCATION_TYPE_TILE = 2u,
>>> +    XE_LOG_LOCATION_TYPE_GT = 3u,
>>> +    /* private: reserved identifiers */
>>> +    XE_LOG_LOCATION_NONE = 0u,
>>> +};
>>> +
>>> +#define PREP_XE_LOG_LOCATION(type, id) \
>>> +    (FIELD_PREP(XE_LOG_LOCATION_TYPE_MASK, (type)) | \
>>> +     FIELD_PREP(XE_LOG_LOCATION_ID_MASK, (id)))
>>> +
>>> +#define MAKE_XE_LOG_LOCATION(_TYPE, id) \
>>> +    PREP_XE_LOG_LOCATION(XE_LOG_LOCATION_TYPE_##_TYPE, (id))
>>> +
>>> +/**
>>> + * DEFINE_XE_LOG_COMPONENTS() - Define log components.
>>> + * @define: name of the inner macro to expand.
>>> + *
>>> + * Use this super macro to define custom code for the log components.
>>> + * The following parameters are available for each component::
>>> + *
>>> + *     define(CLASS, ID, TAG, SIGID, NAME)
>>> + *
>>> + * where:
>>> + *
>>> + *     @ID is the unique component identifier within CLASS.SUBCLASS.CATEGORY
>>> + *     @TAG is unique component tag (across all components)
>>> + *     @SIGID is the default xe_sigid for the component (without the XE_SIGID_ prefix)
>>> + */
>>> +#define DEFINE_XE_LOG_COMPONENTS(define) \
>>> +    /* */                                    \
>>> +    define(SYSTEM, 1, PCI, SW, "Linux PCI Subsystem")            \
>>> +    define(SYSTEM, 2, DRM, SW, "DRM")                    \
>>> +    /* */                                    \
>>> +    define(DRIVER, 1, XE, SW, "Xe Driver")                    \
>>> +    define(DRIVER, 2, PROBE, PROBE, "Driver Initialization")        \
>>> +    define(DRIVER, 3, WEDGED, WEDGED, "Device Malfunction")            \
>>> +    define(DRIVER, 4, RTP, SW, "Register Table Processing")            \
>>> +    define(DRIVER, 5, WA, SW, "Workarounds")                \
>>> +    define(DRIVER, 6, PAGEFAULT, MEM_FAULT, "Page Fault")            \
>>> +    /* */                                    \
>>> +    define(DRIVER_HARDWARE, 1, REGS, IO_BUS, "Registers")            \
>>> +    define(DRIVER_HARDWARE, 2, GGTT, IO_BUS, "Global GTT")            \
>>> +    define(DRIVER_HARDWARE, 3, GT, GT_TDR, "Graphics Technology")        \
>>> +    define(DRIVER_HARDWARE, 4, LMTT, IO_BUS, "LMEM Translation Table")    \
>>> +    define(DRIVER_HARDWARE, 5, MEMIRQ, IO_BUS, "Memory Based IRQ")        \
>>> +    /* */                                    \
>>> +    define(DRIVER_FEATURE, 1, PF, SW, "SR-IOV Physical Function")        \
>>> +    define(DRIVER_FEATURE, 2, VF, SW, "SR-IOV Virtual Function")        \
>>> +    define(DRIVER_FEATURE, 3, SURVIVABILITY, SURVIVABILITY, "Survivability") \
>>> +    define(DRIVER_FEATURE, 4, RAS, SW, "Reliability, Accessibility, Serviceability") \
>>> +    /* */                                    \
>>> +    define(DRIVER_FIRMWARE, 1, GUC, RUNTIME_FW, "GuC")            \
>>> +    define(DRIVER_FIRMWARE, 2, HUC, RUNTIME_FW, "HuC")            \
>>> +    define(DRIVER_FIRMWARE, 3, GSC, RUNTIME_FW, "GSC")            \
>>> +    define(DRIVER_FIRMWARE, 16, PCODE, DEVICE_FW, "PCode")            \
>>> +    define(DRIVER_FIRMWARE, 17, SYSCTRL, DEVICE_FW, "System Controller")    \
>>> +    /* eod */
>>> +
>>> +/**
>>> + * enum xe_log_component_tags - TAGs of all supported components
>>> + */
>>> +enum xe_log_component_tags {
>>> +    /* private: */
>>> +#define MAKE_XE_LOG_COMPONENT_ENUM(_CLASS, _ID, _TAG, _SIG, _NAME) \
>>> +    XE_LOG_COMPONENT_##_TAG = MAKE_XE_LOG_COMPONENT(_CLASS, (_ID)), \
>>> +    XE_LOG_COMPONENT_##_CLASS##_##_ID = XE_LOG_COMPONENT_##_TAG, \
>>> +    /* eod */
>>> +    DEFINE_XE_LOG_COMPONENTS(MAKE_XE_LOG_COMPONENT_ENUM)
>>> +#undef MAKE_XE_LOG_COMPONENT_ENUM
>>> +};
>>> +
>>> +/**
>>> + * enum xe_log_component_sigids - SIGIDs of all supported components
>>> + */
>>> +enum xe_log_component_sigids {
>>> +    /* private: */
>>> +#define MAKE_XE_LOG_COMPONENT_SIGID(_CLASS, _ID, _TAG, _SIG, _NAME) \
>>> +    XE_LOG_COMPONENT_##_TAG##_SIGID = XE_SIGID_##_SIG, \
>>> +    /* eod */
>>> +    DEFINE_XE_LOG_COMPONENTS(MAKE_XE_LOG_COMPONENT_SIGID)
>>> +#undef MAKE_XE_LOG_COMPONENT_SIGID
>>> +};
>>> +
>>> +#endif

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDA87CDE00C
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jun 2026 23:06:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0F7010F3BE;
	Thu, 25 Jun 2026 23:06:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kh48+kOG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75FA310F3BE
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Jun 2026 23:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782428793; x=1813964793;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=cduwrZboSMMvlQde30qnBmRGRBw73RmVxI8qHJa7VHc=;
 b=kh48+kOGoepxX0ySJ2Sj/xmuCb3jF/LTUm50xZKizVkroHAW1yC0zVg+
 rnjxlAprKF87oZ3m2hdXRFajtcyAQuukqzDZ9wHi0mjeG/6wNf/kRVjmw
 3ky/CQz2oXnGYpRAnNo88P8KMmKIxh6CIroSkUB/WWGdL1/na7CAvtsDo
 Dywax3Y+gHUXT7/cLd32PAULYgRZWwcgtNFFLmscifRKdnV1sD9gX7XYQ
 0DkBdrxDtkruI/93tuCG1ZXtlOdc3o9s+EiPO+M+I2hrR9cNipWXT3qNs
 rURhjGS8eheh//AV4BWrJ56XXJlKGxrM/91oZo5VE7qyRqTNJvtWf9O3k A==;
X-CSE-ConnectionGUID: YYiUU7ahSd+4q24Cq8NW+g==
X-CSE-MsgGUID: 63IHHdnURoOrpC5Kq5EqiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11828"; a="83320908"
X-IronPort-AV: E=Sophos;i="6.24,225,1774335600"; d="scan'208";a="83320908"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2026 16:06:33 -0700
X-CSE-ConnectionGUID: mDpOgKj1QVqDgU1ZwsTOPg==
X-CSE-MsgGUID: D3Row4SGSsei5eLjom0K/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,225,1774335600"; d="scan'208";a="250060713"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2026 16:06:32 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 25 Jun 2026 16:06:31 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 25 Jun 2026 16:06:31 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.8) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 25 Jun 2026 16:06:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HTaRUarMM87xJalLWDvOopz9EHFK8xCXTivRkf63I2AJzF9VJomyKIklhL9O5uJ9SFrWB8k2r6Cc6uatmoWrMiE3ax3orrLJhtZq6wj+0C3jWgXzrzzDtSwF29Ag6HlOsmKOCqBWESkpgB4sUamxpEKnOaLS1zd642KmfZJ2CK9N0oP5tZ667hZKCyohk13TjZndzB+jyf7hSC0v/IAt+8zUAiH/Oq4We8Br+98HBVUUs1E1EzVmU3RNIDuoIXKGX63+QiAZJ8HNr+myZJ0SBV+JDK9/ZKEqURqhn2NZmf2bs9NYYTOIhHAkRHoNKUnvKZxyltt26Y0kIUR4T/wxTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hnarN09rNS6F6Wk0kn1l6Lr/3r+Caf+3OBxdv0AYUOY=;
 b=wCJxqnVxqnpAcExvG/Emb9ZwMzTjdZYRI+GGKbB84oYxYITchTxgUawI/QZ87yBmQwGBzAWL81cxYV1rDUr6lj+7Ovd5R84akV6gblCdg90nMu5Gc/GR0KV8gUgjkpZlB5Fx76SeOYiwrV9s9lGjZ1zzszJorYCgmmyhiksgZH3eithZCNsd/eDirApgk4yl2I+52r2xhIGH8uIF38B9m9FCEZu43qYuy4tVwvzPAvMvGBI7sjkfF8ycDPPSBg/s+NG9rAgWeNF5lVYP1XyTkqMGFu7pzDv3wW2n4sHA/rgWq7ocVaxbBcK2h4jW3fpm0/HN2uuu+MgWSfF27fHZ3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by DS3PR11MB9795.namprd11.prod.outlook.com (2603:10b6:8:363::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.16; Thu, 25 Jun
 2026 23:06:29 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%3]) with mapi id 15.21.0159.016; Thu, 25 Jun 2026
 23:06:29 +0000
Date: Thu, 25 Jun 2026 16:06:23 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 1/4] drm/xe/oa: Rename last argument of
 WHITELIST_OA_MMIO_TRG
Message-ID: <aj20b32ww8zWw0dF@soc-5CG1426VCC.clients.intel.com>
References: <20260617015422.226177-1-ashutosh.dixit@intel.com>
 <20260617015422.226177-2-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20260617015422.226177-2-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4P221CA0027.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::32) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|DS3PR11MB9795:EE_
X-MS-Office365-Filtering-Correlation-Id: fefc2227-5171-49ac-0894-08ded30e63aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|22082099003|18002099003|4143699003|5023799004|56012099006|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info: Vjio5iAO84clFq5j/MhGHgzR9beJU156iHI7k7/LHzCLIzv2nlU+fao/8rjDckWT9MzILsKV0pg8Ptc9ORB26tMHie2+OgdyMB8hwKOXd3u42ZDcbL76FnwfnFUih9gevFijqyqF9e7FGigGYfYAIVYjXCGpmJgXSMcFu96lWLg42gsm29TJFDNDheHRsKNTw4o7O3dt1MxL1JzJWBAghHO+JBrsosWlXjVAAq4l40soVXyrF9JbJ573N+xu7a80yWX2yNNpac7uoMvGZZkqzHAfdJ61ib0AZwusZRVy4bbNVhkMnFQ+h/9sIQxqPBe3IKFUWS0jlJmKoeXbysMxnTaWbH0kirkisr28BhJJrPRExumFIO9Q5BhFF4kgSlaYwHhBIRDsXe+TZ7c+3th3N/rWEqMZFImKLNJWw1QQ1PBB0INRBXXyEzrLm1yNxvGX63SBDtjqvLtdEdQKAOMtHVygh8stIIRDNYn2SAazBIkq+JFPBpSipZ4I/2hIAfdhP77JDjN9g9/BFdhIBo4TPMaXUDEqLi5/pEXtLtZs6pF+jrh3Wd7ghKn1bC+g1/w6sFIZE0lHh2OaUBZ+bFtEIJYr+VI39VrDulrA5ycwmiDZmSeDWgIQp2v+Q5zvyVpGeZzGUxa4t3rFpDoI3iiGHZ//HhfhWjZq3+hE93+a+tI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(22082099003)(18002099003)(4143699003)(5023799004)(56012099006)(11063799006)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SUlRY1BER2RJWkxVSTRFdGZ3ejRlaXRGcXpnaVpXV1cyVnhmaUhHK292UWkz?=
 =?utf-8?B?VU9DMm1kY2dUem1pTXVSYnVmNUNjRzltajFZWTRnTk56WHBHRytPTFpzUlU3?=
 =?utf-8?B?NnZoenZPZWZHRGF4c1M5eHVWSkJYbTdzN2FjQloxVCtLVEt2djZlYUd2RFZr?=
 =?utf-8?B?Yk9uV3duMTdHbnhFczlPRWNwdDk5V25tOHRvaCtjbCsvY0Q4Y29UU09UelB1?=
 =?utf-8?B?ZkMvK2dFTHhxQnUvaElJcW1BNjAzYjJxbzVydldTbE04bFpqdThzYUZIWURt?=
 =?utf-8?B?QnovZko1OXBqM2hnVDd2Mm1pQm1XQUtpL0hMMkxqbElEWFJ4K0RmUWJZaURs?=
 =?utf-8?B?SjJUWlowUFVoaU1FeHVGYmpKK1l0cjdZWUVrWVFkS3RoYjI5cEZtQW9qMVg4?=
 =?utf-8?B?ZzZWeDIzRWZKeVIrcnNucGU3ZVcxaGlZakg4ZGZNZjZ3dDRmL09GYkVoRnBB?=
 =?utf-8?B?MGl5MUl0N0J4WmRBMlFvSTFGSnJoUjhFMlF0NXdia0x6VXNvQnFYR3AzV09C?=
 =?utf-8?B?MEpOTXl3UnpLZGl6SHNBWGNCNmhaWldUZjZydTVza1JpN1R5Wk1HNXlmZ1oz?=
 =?utf-8?B?UWg4S1pDc3dOODRkazBHRXZIK0tDaEJwUkFSYUNObDFjc0dlbVBqOGNMZitU?=
 =?utf-8?B?K0s0Z3U4TEwzOEtzSUtrUHd5dGUvQmdZcWk3Q1c5TDhUWXlaMUtNNEhBV1R2?=
 =?utf-8?B?bmZVZGlUVGxISHpZWTlwTlluQWZ1VFo3TnZIZG4rNkhpTWVJZzJHN1NoSDI5?=
 =?utf-8?B?dER6Q1p6YklLdm5vekVNOVFkWjlvYlNsRzhtWDJjb0RPZFJKVXVMYksyTXNS?=
 =?utf-8?B?M1JKajZpUXhxYzJjeWh0OEM2YjJlTDJlSTN4N08remt3SVNrcW5WZnpkdXow?=
 =?utf-8?B?VmVGeE5YLzRTczhKQ1FRdUEvVXErajQ5YXEzWUNkdEtGS3BWdFdNTlBESUtW?=
 =?utf-8?B?bnRRZEpWSFBSbzVwRUhNRUQzcDR3Q05EcFVUaFpINmRKRXhONWhhaURsaHE0?=
 =?utf-8?B?b0hZNzE2eXd4L1VnQy9IbnljOXRUZytDTmo2c1FSeVRPL0Fjci9IeTBLWXk4?=
 =?utf-8?B?YzNmUlU4dWlxQ2paWHd4byszc1ZwMjFrOUdVQmIyNVNXRlRSczJPTlA2SXAy?=
 =?utf-8?B?eUdJbkI1LzZDakNtUlV5dXMrS1dqL0dYd3o0aHVGVFlUNnlYQURhVUI1bDNv?=
 =?utf-8?B?TlU2dW1kVDl5RmtiNHk1SVhoLzlEK1ZXOCtEUHVMSFBmS1lCbWM1enp5TDFK?=
 =?utf-8?B?V2ZFc0hJUXAyNzlYR2ZKdnVNMnMxM3k5cllUTHN5WVhlQ3JsdDhsL0Q5eG16?=
 =?utf-8?B?OUtQbjFqZ0JnYjlmZktBKzRSaVowaityVGJBS3JNaUVQbERJUy8rUEZRQ0dY?=
 =?utf-8?B?TkpDNUI2VnFjWWRlWk9yV3liN3lPVHF2Wmp4OUFWZ2xrUWxMeWZtbnZ0Y0Ro?=
 =?utf-8?B?SFZkbldSeEJJK3NzNXZadDlVTFUrS0lGUUhCbGJMb29VVEhIcW95K2l2WFJw?=
 =?utf-8?B?MHAwclhlQ21HVDZxdlFuTlJRSUdiUDZBcXpvcGdmVmZzVEFkM25lYXZITzNl?=
 =?utf-8?B?Z1EzN2dBN1I5bTdiQ0J5WTdRK1lnTjkza2tHbWZxakhYdmxhcGhQdkROZTQ5?=
 =?utf-8?B?SWZ5cjBxOU5xaVpLUUpEYWlUL2MyOWFkdXV0WWZ5ME15VjdoYzQyUytTSEN0?=
 =?utf-8?B?M0h2aERBT0ZJdTQ5T1g1cUhKY3poaGZJZmZ3ZTJaUnZ1RjBUdXVIeUd4WDMy?=
 =?utf-8?B?Z0l2ckk3WEUzNTlJTjZkTUZISlpKN0hRSmRZQnFOQkVFU0JqS1IrQkFiTlJI?=
 =?utf-8?B?WDQyeWE1MlFJTGZvZDd5SDFqVzdXQkExUkJUNjlRRjM1dGhuVWNVVmVqU2F6?=
 =?utf-8?B?MFEvdVoyMEt2bm03SG1nZWcxRGxGNll5WmZCa1ZqbjFHTlVyN3o5blRSdTll?=
 =?utf-8?B?VzNGVDdjZ29LeDA2dG9YNHltdTdGYnVtNmE0WHlYVUsxTlJaRGV1OXNsc1Y1?=
 =?utf-8?B?Z09icXhVSVFPcW8vQS9UM0duMUlobldRQy8rR1lMaEtwVWRrNlRYWVV3b0Za?=
 =?utf-8?B?aGVjU25OcFVJekIvVHRoZnpqNzVLZlhQU1FIZGlYa2RaL0drVms5YTNwVEo2?=
 =?utf-8?B?aE9rTElJeG9RYmk1THY0OFhKV3lHa3o3WTg2THBFYmxUK3plcFRMZUtUMnhC?=
 =?utf-8?B?cmNzalBjQWtLYUR0YzBIeXpmUVJQS2hFemhLWmtraHJxWklObWtDMUJka2Ji?=
 =?utf-8?B?WFZPYlNZbmJBc3F5YloxY2twenFLVUZtSUU0cEppTUs4OWJMRnJaVEFKaUdY?=
 =?utf-8?B?ZHRwUjdVWnhwS0hKT0pma05SM0JLV2JVcDgrVGJMV1FrZzVsS3lFQkxEczFI?=
 =?utf-8?Q?BdjpRaFH6xYAMKww=3D?=
X-Exchange-RoutingPolicyChecked: sb8Ww9BybjLVoQJHdq4b7yTADyL9hsVvsBCBBhv/OfIjJIovgQzyYahLz8v/z6w7Ifk4nO/8GXGVOOb0R8Mr5aXgzqMvg6NS8jJrOmUqYDuvsSSggZI8MQW9ixmgunqzvFMu56Us5wyDBVtlFyrCVpGkO4FwrcM7MgT4ufTGA5bT8kytHFdVQt3XRWEToTW2U9lYnkX4Fer+WVwoSHuWrsI3SG4RATrx7jMV0P5Wb+UlbxVDICpyq/uavB+NdKEkK1/oFEEp1oaDYrD0Ot8OFSIjYhvxsUOYmGnw4RJO/GTo8fO464en+ZlQM41Rzs7I6GiKy54dL+H9kE699Oz23Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: fefc2227-5171-49ac-0894-08ded30e63aa
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 23:06:29.0089 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1R2sHlZr3Fqw2gEYe2ZNTjQ2m5070ZVxdPOy7vH6Ivn7Mz+/AlxGyyXnckgYXEHYhbavX2vFFHzK6Okm6eumGP3v59kpLlECfs8+4Lowmmg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS3PR11MB9795
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

On Tue, Jun 16, 2026 at 06:54:19PM -0700, Ashutosh Dixit wrote:
>OA head pointer registers are not used by UMD's and do not need to be
>whitelisted, the last argument of WHITELIST_OA_MMIO_TRG is actually used
>for whitelisting tail pointer and OA buffer registers. Rename the argument
>to tail_buf to reflect this. OA head pointer is sometimes provided to the
>WHITELIST_OA_MMIO_TRG to have the correct register offset alignment (16)
>for RING_FORCE_TO_NONPRIV_RANGE_4.
>
>Fixes: ed455775c5a6 ("drm/xe/rtp: Refactor OAG MMIO trigger register whitelisting")
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

I don't see a real bug that this patch is fixing in ed455775c5a6. It 
just renames the last field of the macro.

I think you can safely drop this patch. The whitelisting alignment 
breaks only for MERTOA. Patch 2 in this series is fixing that and it has 
the right Fixes tag.

If you plan to remove HEADPTR from OAM and OAG as well in future, you 
could use this patch.

Regards,
Umesh

>---
> drivers/gpu/drm/xe/xe_reg_whitelist.c | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
>index 2e84b1c49f374..a17ebacc1455b 100644
>--- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
>+++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
>@@ -104,10 +104,10 @@ static const struct xe_rtp_table_sr register_whitelist = XE_RTP_TABLE_SR(
> 				   RING_FORCE_TO_NONPRIV_ACCESS_RW))
> 	},
>
>-#define WHITELIST_OA_MMIO_TRG(trg, status, head) \
>+#define WHITELIST_OA_MMIO_TRG(trg, status, tail_buf) \
> 	WHITELIST(trg, RING_FORCE_TO_NONPRIV_ACCESS_RW), \
> 	WHITELIST(status, RING_FORCE_TO_NONPRIV_ACCESS_RD), \
>-	WHITELIST(head, RING_FORCE_TO_NONPRIV_ACCESS_RD | RING_FORCE_TO_NONPRIV_RANGE_4)
>+	WHITELIST(tail_buf, RING_FORCE_TO_NONPRIV_ACCESS_RD | RING_FORCE_TO_NONPRIV_RANGE_4)
>
> #define WHITELIST_OAG_MMIO_TRG \
> 	WHITELIST_OA_MMIO_TRG(OAG_MMIOTRIGGER, OAG_OASTATUS, OAG_OAHEADPTR)
>-- 
>2.54.0
>

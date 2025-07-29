Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C75FC87FCA
	for <intel-xe@archiver.kernel.org>; Tue, 29 Jul 2025 04:04:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE6E410E5BC;
	Tue, 29 Jul 2025 04:04:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O3ZCrh8t";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C7C510E5BC
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Jul 2025 04:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753761885; x=1785297885;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=FIo0T9lyvzbeXnrmp/JdDF3FGD/3RTYsOeS48peiuMY=;
 b=O3ZCrh8tN7S8T4ko8FqKhi51tMPB1ZqGRS5JpdB1jH5R4wR3antNK7wC
 RZl7ZeoV0KhH9rn8gZL0oBT/UvMe126RBTdlOqVC49Gwa3kn9SgK9DGx0
 EPscMeYDEjyKFkZKTWd7FcryuQjUjq/lFNlVrIpPN8Yc7rfDjppDzj33m
 vDWUaqKWK6lBpcOpZHP34DiGiqvv+gwt0RV5Ra6UT82tDWbi+SH1moG65
 ASW9A7OOWIBGtfzeDNux9Kyr3UWq6g5TcO5Ezq2YOVps6eth4xJfb4Cvd
 024wiJFAVrSmM9/ka5acfP2q5DDLwpX94qH+VaNqF0+uxBHa8uCWG4H20 Q==;
X-CSE-ConnectionGUID: c9Z6qEpqT2Wx0Tr3Xhi9JQ==
X-CSE-MsgGUID: MXPd/nhiQQmKvSwZkraVDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11505"; a="59823073"
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; d="scan'208";a="59823073"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 21:04:10 -0700
X-CSE-ConnectionGUID: q0KnY9UdQXCVeUUdPnxN1A==
X-CSE-MsgGUID: T55OPtOyQIuue3Y9QKf+Zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; d="scan'208";a="163366632"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 21:04:10 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 28 Jul 2025 21:04:09 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 28 Jul 2025 21:04:09 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.87)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 28 Jul 2025 21:04:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xYVKrAMkODHkmFOwiXmxb4nc0IVT5Qz4YN3pN08kUArasLUXdMRimybNmW2UbH0tZxXV38JPal0nkV3hpZOpLyaOT1yIvbWSda/7SMGS/rNsq/GQkytvF0XtfHC95DwwRqQGzLZDdxS1hnh3127FogXz1aV0RXIRJ0A00AOWlFHTgBjt3lEwDoEHGs7qFX5fKx0elMtIcUpP42kjMo4lLBZ5AZUfpmOKKmYv1QrMpMPXkZAFZa9LOz3yzYU1GHHjemCexdENrpNTyNqOkRYMzjBmzuqPCwuty0OxlYJAW+NzS6ZhAMKcMMNVHzqkEJKfbDl/Y5PVKM+1DtKa3Q9ASQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QledB//5AZeFtdV3kygMU6Xng/KlO2tHsmAiOXl6DYg=;
 b=HvLCDV80TC18aV2TP/mORop5yjaqrdd614CgfdslNvNio0h3womhL3AfMVtfGAlQzH+ptm+QUyz2/jdNgK6l4E7/CPGo4a5wx8QCUEMd2GXGN/X19sZgcolis1Ijf8CpZr0T3uA3qIEr7lLobmijN5jwlt/BURa4ivE2KMd+rIvZ3LojA43StitRRQTO5qzXkJaXDxKSdtuj5HW1BnhM7evvzalVVHZTEyHAIAuties40AWwaLSJiXhXpCI4b1xttuwOise1pRKoo6Utr2HGWoS4KGPcCXfwTONYn2k07oFsnM1LmyAEmka8iQWapn5KU0iStMRhcmIyxdrVTMsWaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB6441.namprd11.prod.outlook.com (2603:10b6:208:3aa::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Tue, 29 Jul
 2025 04:04:06 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8964.026; Tue, 29 Jul 2025
 04:04:06 +0000
Date: Mon, 28 Jul 2025 21:04:04 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v5 11/23] drm/xe/svm : Add svm ranges migration policy on
 atomic access
Message-ID: <aIhINCpc7TIC/sSQ@lstrano-desk.jf.intel.com>
References: <20250722133526.3550547-1-himal.prasad.ghimiray@intel.com>
 <20250722133526.3550547-12-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250722133526.3550547-12-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: MW4PR03CA0188.namprd03.prod.outlook.com
 (2603:10b6:303:b8::13) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB6441:EE_
X-MS-Office365-Filtering-Correlation-Id: c15dc4b9-4af4-4c93-1cbe-08ddce54f65b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?G7oEJFDU2z8W90zILUHryDu66pcMNp82mTV9I/NqNOVA0YUjrIBMA/BoaL4V?=
 =?us-ascii?Q?xA0P+mKWLjVEW52Wf4NPh3vgIBB46c4DTDp1PQ6aR5LAKEftZUYCVpLL07Wy?=
 =?us-ascii?Q?muk0zfWcEv9L6Z9khzkiIE2RMhnxYaw5ZjjMxEEBP1MVNx0kE+AMiTWPVynM?=
 =?us-ascii?Q?VFeuqUe1HedKWrtWDgTUStpkh1mUGzxDzr/F7C9rCkXYkKRr75w+EA0vL4QS?=
 =?us-ascii?Q?qolx7syc2DqPdEml5XdlmMbdFvtXEXJBEceRVHBJMBpd+5XWyGesB+NsExIL?=
 =?us-ascii?Q?qaisOoPq/tDmSXpmGn/C1LJdQVQGKGP4yZvgawYxSwh6S4aJKWKC3wntXC4Q?=
 =?us-ascii?Q?1WuXOZRbJWc6YHFS4C4aXFZAmgbQ1ggXFosgrpLD+m/zY/KScYCIzDwN6u44?=
 =?us-ascii?Q?B7CadnpfYkJiuk68+aMsJJgEe41g7bZCloFNkbaSD86yK0Rqy7drDFGSTAXu?=
 =?us-ascii?Q?7pMj/qAZV5IWUFgH4gNDylvIaW6EK4uO/biy/0U/edFAhs5bVEHv521m1i1q?=
 =?us-ascii?Q?t7miS/t3nIzq9chQx8+FYdobjsc3pOW2/TjEAXEjqv95cSnMrVPFn0QUwpF7?=
 =?us-ascii?Q?b/cJlNVJqV36i6JwLeS5eMbIijrfKrcphPgBeDIXIxcA5MbWbeLDJ0bLcerg?=
 =?us-ascii?Q?wqIV8nHVLCAzXankwkBs2HjFLXiwVkrQyH8p267bWUA3B6M1wBXnAEItt01f?=
 =?us-ascii?Q?D/LCqMc715Nof1e6SiwLAN8EOAf8UG6rsmqECITFWSYXjHdSGvjzSV+7zCrv?=
 =?us-ascii?Q?GxolwzyahHG95qcinV2giLUZ3JjM+bhH3vsM6QNWdnjmsdHQdKnP12hqe2hK?=
 =?us-ascii?Q?/FNMTL4I88g8Lghmhu9mTHNAeIa1sgSmAMWldtxJr9jemf1Gg5kVO20TCUqQ?=
 =?us-ascii?Q?SkHoRemc9opiDaSCcXNLjVrFqB4YIbeQc2rmh0SO2zVGREFNBJM0ulnJoSJs?=
 =?us-ascii?Q?jQYxHvHiskB6Y26O5/M7TjA80WvAyFm2qzG6ysXr5mhdabjKOCr81HvbtdKS?=
 =?us-ascii?Q?4NfVSQ7pn1ZHZ7BB7P/IQQkkDp13FUtM1tgLCFDWZn19IYTms5ocFLPFgmjY?=
 =?us-ascii?Q?xPLfQTbR7JVsphxAkv3jZljFbL53d4ynB+i7Elszgli8tscDwKf/V9uH0J9i?=
 =?us-ascii?Q?GSi8m0oiRx52LsyW0VDnhEnmYOjBx85RzsbxT4Om8cJgI0jesjXL9/7JLgaD?=
 =?us-ascii?Q?6FPw7VQ5STXj8gAaQ0r9qhok0I7i/cPFfY7gTj4NFcQfhnJfTFv+jkfyvbj+?=
 =?us-ascii?Q?3V05d+f4mHXofT75TbGNmhQBiMLqqBSINtIH5iYV/I68fZLeER7BCAZk38h6?=
 =?us-ascii?Q?zGKdCk9Yo6qOflkwSN/7e7Zj70vXiCJlxk4WSZv+BDbD7SZI0qqBhSdXQOry?=
 =?us-ascii?Q?Y9z5Wh7Da3kVYft/GDtYZxCQ5QSLtCEdm9D6VT1EBtUK0MT3jR3ucrs1cNa+?=
 =?us-ascii?Q?Pfb9NhyvyGE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rTHVb3CswxVtjGXxYdg+eA46iG1U8gfh9ISG6ejyq1uyxWzXu3348YFGz61R?=
 =?us-ascii?Q?ho5xlBKKMfMk0OveOH0Y7pYwG2aff+qv464mse1yE5Mp3RbPDYf9WZWHWhTG?=
 =?us-ascii?Q?XfD2GiJL1TRHwUCYE7wW+UxDyOGQvmT+tdlTymqv3Se4AfUCK25ICC4+yAEa?=
 =?us-ascii?Q?Smkkux+jSyaSTllTX9wBnwQnCRsdHcw/mt5jSb3gjQUoUCSYpS4dnNJR+0MA?=
 =?us-ascii?Q?OyIa284xF33JVocTALZLaX+CFgYAxHLag7Y4zFentzBLU8uZJ0Dr+3zv27be?=
 =?us-ascii?Q?+xXTwX+/K8K5M7LezNHsIRNtc+JDX6moEJtro9XBEurTiUF5M55LiSOFrpp7?=
 =?us-ascii?Q?pcWrfEBb5uRax/KM1VZJj8sT/q+zbe4P/3bytHdlczqIaGM2dOK7yX3BGf5y?=
 =?us-ascii?Q?zmXYfk1ZqeLidFu0YLNs8rHmv+v2ZAad+pzMvCiguAgWgc43EvLFeqeIpzan?=
 =?us-ascii?Q?Pq3Tn9P/UZ1cUN9hQylgvA0RBnq9woL1DoBw//Fh66dxUc8bBrXjsEydBh8j?=
 =?us-ascii?Q?zInOyaNq0LdCNK50/3qo81SWlwWxbnr/5cuDo0+5n8EEzDXVWxEQJGpK2SCa?=
 =?us-ascii?Q?/Fg1myLeZjoDW1PXhxdQ5qbsx6TpatpALMe95ItBZm41hfNuCE4/zA3dqHW4?=
 =?us-ascii?Q?bSlUVvx0Uulnt4HLilcR7DbDtlVIa5MrVl1aKUA4bF6X1CtDyYtikkwYkgjl?=
 =?us-ascii?Q?kBPeomZrrWYlEh1CjCID7j4GDawroFsDn5op0D0IcEJJqGddJMzRmxdSGP4X?=
 =?us-ascii?Q?684dZM4AWVpgpREn0H4AtwdJMnPzNPxumTjc3DH8YyCq6AivzshczE074Yf9?=
 =?us-ascii?Q?s5rNVQ1b9RxvQvdxvoX5Yu+okosmo26yZXpEF5+VwR1Ed4PGQFN9A6CC4E6B?=
 =?us-ascii?Q?dHASxBzeC4LYLwz1CcbeHsC2Uf/l7lAtAW0tb2RpjK7HNd1H9/ySF7ot82N+?=
 =?us-ascii?Q?0Por7tYI+CN3yUb9xu10nra0H4a7j1VcLJSgBy8/jxtIwgT5GSjkLQRkcNlr?=
 =?us-ascii?Q?UMcJYKizaWTlFLnZEDZqXgALz61fv9d9EFElw2E0eF71O1CasbLaZjCbI+mw?=
 =?us-ascii?Q?X1l7fuGOnOCn7Djpj3Two7pCZhcCjit6s8GLpgXTbMJ6hWqefU11dzLZW6AB?=
 =?us-ascii?Q?uquzgOnndhEfL7pWwqLw2A3684bNFSahUFe2XLFBCH3crMeVf0NnyqA+fDTV?=
 =?us-ascii?Q?G0oOzGUw4qiaYga0EnV6w30isMW4PGhI1InrrXY9LCWxCa400sfzGQZD0tlw?=
 =?us-ascii?Q?vruY87TpwnQuQIND8/OnKqbFeT8KYG+iVxvfYsCIu17BAOPeMQ9CGFR6zbce?=
 =?us-ascii?Q?UIz5z9j28T2AEs+9KeN7tJb967YCUCQms6E+/mSnAEql7VwvDU/fTBzWwewM?=
 =?us-ascii?Q?x/rQI8BJFnY2lAPGSZZuGvDDLFmTGZmfs0XI1bTP9jBqP5OPRjr1H+7vbYJE?=
 =?us-ascii?Q?2vcYPosLT129J1WnBPhFix71QJfxNPxHwfD2mifILJf6o0eOuUtPFaLMiBmu?=
 =?us-ascii?Q?7fzIvnMBAQXDIt/KwJ2KbSXrpAABQnykdY9Fwx5CLrmArFWzFQN9lbTPSVla?=
 =?us-ascii?Q?dj6jdFEG5fc5UsWi9OaGXmy83Id3FxYn4BNmkNxKJ5GxcwMi4WgLYWsszZvw?=
 =?us-ascii?Q?YQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c15dc4b9-4af4-4c93-1cbe-08ddce54f65b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2025 04:04:06.3784 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XCgwhIKu8njzwusG/Tbv4zRyZQsuGvF8UUn6o4WRMAJrnC0zVvHNrTV9icCWOijU9OM4RZaiXUFn2JTzbMaiZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6441
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

On Tue, Jul 22, 2025 at 07:05:14PM +0530, Himal Prasad Ghimiray wrote:
> If the platform does not support atomic access on system memory, and the
> ranges are in system memory, but the user requires atomic accesses on
> the VMA, then migrate the ranges to VRAM. Apply this policy for prefetch
> operations as well.
> 
> v2
> - Drop unnecessary vm_dbg
> 
> v3 (Matthew Brost)
> - fix atomic policy
> - prefetch shouldn't have any impact of atomic
> - bo can be accessed from vma, avoid duplicate parameter
> 
> v4 (Matthew Brost)
> - Remove TODO comment
> - Fix comment
> - Dont allow gpu atomic ops when user is setting atomic attr as CPU
> 
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pt.c         | 23 +++++++++--------
>  drivers/gpu/drm/xe/xe_svm.c        |  2 +-
>  drivers/gpu/drm/xe/xe_vm.c         | 40 ++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_vm.h         |  2 ++
>  drivers/gpu/drm/xe/xe_vm_madvise.c |  9 ++++++-
>  5 files changed, 64 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index b499006df2cf..96d0ffe8154e 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -640,28 +640,31 @@ static const struct xe_pt_walk_ops xe_pt_stage_bind_ops = {
>   *    - In all other cases device atomics will be disabled with AE=0 until an application
>   *      request differently using a ioctl like madvise.
>   */
> -static bool xe_atomic_for_vram(struct xe_vm *vm)
> +static bool xe_atomic_for_vram(struct xe_vm *vm, struct xe_vma *vma)
>  {
> +	if (vma->attr.atomic_access == DRM_XE_ATOMIC_CPU)
> +		return false;
> +
>  	return true;
>  }
>  
> -static bool xe_atomic_for_system(struct xe_vm *vm, struct xe_bo *bo)
> +static bool xe_atomic_for_system(struct xe_vm *vm, struct xe_vma *vma)
>  {
>  	struct xe_device *xe = vm->xe;
> +	struct xe_bo *bo = xe_vma_bo(vma);
>  
> -	if (!xe->info.has_device_atomics_on_smem)
> +	if (!xe->info.has_device_atomics_on_smem ||
> +	    vma->attr.atomic_access == DRM_XE_ATOMIC_CPU)
>  		return false;
>  
> +	if (vma->attr.atomic_access == DRM_XE_ATOMIC_DEVICE)
> +		return true;
> +
>  	/*
>  	 * If a SMEM+LMEM allocation is backed by SMEM, a device
>  	 * atomics will cause a gpu page fault and which then
>  	 * gets migrated to LMEM, bind such allocations with
>  	 * device atomics enabled.
> -	 *
> -	 * TODO: Revisit this. Perhaps add something like a
> -	 * fault_on_atomics_in_system UAPI flag.
> -	 * Note that this also prohibits GPU atomics in LR mode for
> -	 * userptr and system memory on DGFX.
>  	 */
>  	return (!IS_DGFX(xe) || (!xe_vm_in_lr_mode(vm) ||
>  				 (bo && xe_bo_has_single_placement(bo))));
> @@ -744,8 +747,8 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
>  		goto walk_pt;
>  
>  	if (vma->gpuva.flags & XE_VMA_ATOMIC_PTE_BIT) {
> -		xe_walk.default_vram_pte = xe_atomic_for_vram(vm) ? XE_USM_PPGTT_PTE_AE : 0;
> -		xe_walk.default_system_pte = xe_atomic_for_system(vm, bo) ?
> +		xe_walk.default_vram_pte = xe_atomic_for_vram(vm, vma) ? XE_USM_PPGTT_PTE_AE : 0;
> +		xe_walk.default_system_pte = xe_atomic_for_system(vm, vma) ?
>  			XE_USM_PPGTT_PTE_AE : 0;
>  	}
>  
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index c093dc453e32..49d3405aacb9 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -813,7 +813,7 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>  			IS_ENABLED(CONFIG_DRM_XE_PAGEMAP),
>  		.check_pages_threshold = IS_DGFX(vm->xe) &&
>  			IS_ENABLED(CONFIG_DRM_XE_PAGEMAP) ? SZ_64K : 0,
> -		.devmem_only = atomic && IS_DGFX(vm->xe) &&
> +		.devmem_only = xe_vma_need_vram_for_atomic(vm->xe, vma, atomic) &&
>  			IS_ENABLED(CONFIG_DRM_XE_PAGEMAP),
>  		.timeslice_ms = atomic && IS_DGFX(vm->xe) &&
>  			IS_ENABLED(CONFIG_DRM_XE_PAGEMAP) ?
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 7f3d0ad04b3f..be51fcf322ec 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -4177,6 +4177,46 @@ void xe_vm_snapshot_free(struct xe_vm_snapshot *snap)
>  	kvfree(snap);
>  }
>  
> +/**
> + * xe_vma_need_vram_for_atomic - Check if VMA needs VRAM migration for atomic operations
> + * @xe: Pointer to the XE device structure
> + * @vma: Pointer to the virtual memory area (VMA) structure
> + * @is_atomic: In pagefault path and atomic operation
> + *
> + * This function determines whether the given VMA needs to be migrated to
> + * VRAM in order to do atomic GPU operation.
> + *
> + * Return: true if migration to VRAM is required, false otherwise.
> + */
> +bool xe_vma_need_vram_for_atomic(struct xe_device *xe, struct xe_vma *vma, bool is_atomic)
> +{
> +	if (!IS_DGFX(xe))
> +		return false;
> +
> +	/*
> +	 * NOTE: The checks implemented here are platform-specific. For
> +	 * instance, on a device supporting CXL atomics, these would ideally
> +	 * work universally without additional handling.
> +	 */
> +	switch (vma->attr.atomic_access) {
> +	case DRM_XE_ATOMIC_DEVICE:
> +		return !xe->info.has_device_atomics_on_smem;

I think this is is_atomic && !xe->info.has_device_atomics_on_smem;

We really only want strick migration if the fault is an atomic one.

> +
> +	case DRM_XE_ATOMIC_CPU:
> +		XE_WARN_ON(is_atomic);

I think we should nack the fault if an atomic occurs and
DRM_XE_ATOMIC_CPU is set - both for SVMs and BOs.

> +		return false;
> +
> +	case DRM_XE_ATOMIC_UNDEFINED:
> +		return is_atomic;
> +
> +	case DRM_XE_ATOMIC_GLOBAL:
> +		return true;

As with above, I think this is is_atomic to only implement strick
migration on atomic faults.

Matt

> +
> +	default:
> +		return is_atomic;
> +	}
> +}
> +
>  /**
>   * xe_vm_alloc_madvise_vma - Allocate VMA's with madvise ops
>   * @vm: Pointer to the xe_vm structure
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index 0d6b08cc4163..d5bc09ae640c 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -171,6 +171,8 @@ static inline bool xe_vma_is_userptr(struct xe_vma *vma)
>  
>  struct xe_vma *xe_vm_find_vma_by_addr(struct xe_vm *vm, u64 page_addr);
>  
> +bool xe_vma_need_vram_for_atomic(struct xe_device *xe, struct xe_vma *vma, bool is_atomic);
> +
>  int xe_vm_alloc_madvise_vma(struct xe_vm *vm, uint64_t addr, uint64_t size);
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
> index f64728120d7c..62dc5cec8950 100644
> --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
> @@ -85,7 +85,14 @@ static void madvise_atomic(struct xe_device *xe, struct xe_vm *vm,
>  			   struct xe_vma **vmas, int num_vmas,
>  			   struct drm_xe_madvise *op)
>  {
> -	/* Implementation pending */
> +	int i;
> +
> +	xe_assert(vm->xe, op->type == DRM_XE_MEM_RANGE_ATTR_ATOMIC);
> +	xe_assert(vm->xe, op->atomic.val <= DRM_XE_ATOMIC_CPU);
> +
> +	for (i = 0; i < num_vmas; i++)
> +		vmas[i]->attr.atomic_access = op->atomic.val;
> +	/*TODO: handle bo backed vmas */
>  }
>  
>  static void madvise_pat_index(struct xe_device *xe, struct xe_vm *vm,
> -- 
> 2.34.1
> 

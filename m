Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3065ACCD184
	for <intel-xe@archiver.kernel.org>; Tue, 14 Oct 2025 05:11:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C47E210E531;
	Tue, 14 Oct 2025 05:11:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j53gXQlf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BE7110E531
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Oct 2025 05:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760418683; x=1791954683;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Wiw1n3952ofDHC/MkiPozXlvTuXvW5opq5XSVQN8xdo=;
 b=j53gXQlfvP27XuydsiObIDBoX1n1QsR4jjmmbwjp197kTNHMXyrDqxfB
 DzCdgtGO1ytdbAElQa2OtNoFjuD+ykRt9fN419Kq0kfoJLkCuG3L2dOjx
 NF2VBdmsGSZY1oRkdNVQ/zYwKTWEFQ6jnh4nxlcds6AXi6u2GqhE5WnYj
 9lYSt9PpI1aVUJaiOe65FAk6vj0nJ9kZ7YBjVikAnwZ6nVfVSkeqyeYfQ
 zV5Z8gaMglOQCwukwCd4EgFrCSBtlnSj5ONIGhE9ndfYAEnaoyfMoTcPY
 ddNBhJ8qoBZ/QRJN2WYnq28A9qkVjg4RDRT3v8DknYWjvPbax3TUQ1oqC Q==;
X-CSE-ConnectionGUID: qB2bJ7/DSY2jHKMrHglJAw==
X-CSE-MsgGUID: wQ+nkrT0RG6BcWFgducB+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="80206396"
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="80206396"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 22:11:23 -0700
X-CSE-ConnectionGUID: 7H8wJwz8QayM+0c4yZMF4w==
X-CSE-MsgGUID: zU9CyVDoQOmVHpGsZL1cDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="182560891"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 22:11:22 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 13 Oct 2025 22:11:22 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 13 Oct 2025 22:11:22 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.2) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 13 Oct 2025 22:11:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RrJGj7IsjxDHpm1jixu53Nrj5lohOh7IlFrAuh4qWPV66o2E9BrOUEp+QIyDmk/hI//8yOi4q8xZo296l3BeCbeU3Ju9jHOZUVCevanhnny/MAX2txI6KfHrYD2X6OwP/cB2gDBpFzW+GI1VXPt2+RAtCMmKYMvkFtGaVFi9FG8FboxCC7TfGztglDvfQ9Hnn2daldrR55d3aTxSvsvzV/XQ48qMMvU1Jwm00l8vOdnCgJF14MaBheoPduA46GgLzL852DQc7h3uAjvaWBiWSs/hI+342zmFjqIpsvl9SIhrIHTWVs7uWHOTE1iBvNBDphqLh5zYoicVUyA3WuSptA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JCJRlwKO6+/XHYttisanL1BqAciHcs6t12NQ0qSmvxA=;
 b=Ay4FXSJo4fg3Wq/cHd/pqKwiui8GzphplHoJANQiIoVCHgUSwteNRNMEKXWy7yrzSS04gI1X1M7f3Jk5a0NMUR3vxWfn7AXNVCqRc9XHRALkVZQ8+5Cbidv9DvebDwhj4l/DQ1xBD0ndnBsmdIjyhiEyPw30Wvbj8ULTuQpy8YO4rpODyN7kvIYQPn+7h/knCTIlacEyTtiv4QplgCqd4dJioAVRsoOUL1MQ60+zFCzbWapXFBxSuQuRkos+pcGWdnshiQxafxCIijAA+9x9UCbNC3C8LrkofGwhXpNsJB9A7tzmZqd6wXLH4wbIsqhR4EKsIpTywAFrn+3AZa8FHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by LV2PR11MB5975.namprd11.prod.outlook.com (2603:10b6:408:17d::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Tue, 14 Oct
 2025 05:11:18 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5%5]) with mapi id 15.20.9203.009; Tue, 14 Oct 2025
 05:11:18 +0000
Date: Mon, 13 Oct 2025 22:11:15 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>
Subject: Re: [RFC PATCH] drm/xe: Retain vma flags when recreating and
 splitting vmas for madvise
Message-ID: <aO3bczENGyIIQJDS@lstrano-desk.jf.intel.com>
References: <20251013185348.88033-1-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251013185348.88033-1-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: MW4PR04CA0084.namprd04.prod.outlook.com
 (2603:10b6:303:6b::29) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|LV2PR11MB5975:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f7c32d7-0cc6-4672-ba9c-08de0ae01b6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?kFOOamz7BHVWYoau253Gt3cc+4gQa/iE40t7jyvC4yI6Rm8iabj1PvBgiT?=
 =?iso-8859-1?Q?T+gqAiZnvH80Mjv7VNb4fIpWKUEScnxlvSA/0CJfv6ZgBRRKPvQ3G5GPUa?=
 =?iso-8859-1?Q?0Eu+0PQKCN0Zc8t6/CVrF2aDkWcZdZ+xejKeSngz/R5nsLC+9pVnf9I3RS?=
 =?iso-8859-1?Q?cCC5HiHjlpWgYZ/x0mzYpa3Iwg58Mi1kBuY1GsLo9KEehO99s8aTWpsIKx?=
 =?iso-8859-1?Q?bVkK3wCld29vqvgF4092o0nVCRfX9UmcA3IzcKjMFnigv0ICzjlkuZ8sNA?=
 =?iso-8859-1?Q?C9zkq0+KVVB6edZN9r2rGH4IEPHjMIHaV82+opFitRmyoHw0T2PscaecRr?=
 =?iso-8859-1?Q?gJY1W0s7SJDsGt65EBbH4u7jJaw1lWxB7RKwYzMGVpd70NoyyDpUjeK+C/?=
 =?iso-8859-1?Q?+qhcPC9Uz0Rws44Kg1cmOyy/zV7FSWSddMX8qR1zaVg019rYh0c1j9wosI?=
 =?iso-8859-1?Q?TsKH5d4+0aVe40v3DOaQau86s5C1yO7GQFSVk1Le7YUQouR/yQkzJkLU1S?=
 =?iso-8859-1?Q?ttsiWQsCoMvZKX1lk316gU1fGHsO5+2yTJzw8CVWNo2rKPQj+db7JHYuOb?=
 =?iso-8859-1?Q?usFPXp+B5XPfmHkzsuhtknLJjIvM5d1KjQdsUPyXSvLUlC2hIPDZrFT+4B?=
 =?iso-8859-1?Q?mRA6vwJidMHLt4oVW5by2sYDEQf0rVXv846WZsV7onVKFvXLVejP16r+De?=
 =?iso-8859-1?Q?RD9fC0wrDXAlTznGyxjwd/jgtt/V71Cri3br1fpJD3/ZVo3BKUd4+z+Wnc?=
 =?iso-8859-1?Q?TNwRvtQGmvM52EJEoVDq3I6wLMH+CaXRlPacbFIiWBTMHhdeibz+2jjvnb?=
 =?iso-8859-1?Q?m2s8mnzHL2b7xWyVqAlOferM5XWn/wLCRzLTdwG5U27m76XK+5YxucsYuR?=
 =?iso-8859-1?Q?Cgg/HcDtiIDNnn1qZ2V1zEu/1RZvN1GMAvNbzwCDJ3ncnGn64kX8U+smz/?=
 =?iso-8859-1?Q?4iR4XqFHuKu4u/R9sV5QvP+RuI7Kx+ZIHXuhuFrE16HNSFCYuMpxrJb42M?=
 =?iso-8859-1?Q?IPy4J1uKVXN6a/akJsf/MNTOxlBLgxiuz1JxsQDyGwRIn6TAfFCPsnFjcd?=
 =?iso-8859-1?Q?z2SGePo2svmhbwcOOVzXuirPqi/hzVljKUplkMW8O1c1+9o6TGU6S8448l?=
 =?iso-8859-1?Q?nlIDt7AVLBvLiwIlkcEhpQohnPiQdHBtCVx4dgLLxAa5HNH9JqJ/tVTebM?=
 =?iso-8859-1?Q?iEV5ZfUfbTVHCtHz/HyId/MO7fYdXM1gJnZOUIxVXthvhOr5+htvcci5OC?=
 =?iso-8859-1?Q?Js/A99MIO+yjGP+dBqgTRk6lNElg03Oxkjr2MUE9ULJ4ixjTPzEoJfs8+I?=
 =?iso-8859-1?Q?WE8adw2GHmumnb/pXtvDKo0RlIL/rY9FFiv3dIcMHEOn4SxB0UPrkFZQ/w?=
 =?iso-8859-1?Q?Qy9n+IozbnItiY+kxCEL6deGZdfhVO7cEV2hnNO0F5V7g8GoERbx2Ovmy7?=
 =?iso-8859-1?Q?POVm9lm7QYWlpqeUsYkqe4IrF29q51vSGifu46humIq3A1bgGfkRJGZMx+?=
 =?iso-8859-1?Q?0AwrkrN+TM5AUyNO8yelVa?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?BVsUBkIZqrK3d3polWIFZW2n8cxYjfFcaA6ms8mIz34niPeB2UonxIIXr6?=
 =?iso-8859-1?Q?PuyIWwp++sZUFu70nSxKiEO42D3EaxqGaw+xzjiGAkkBlNfNbx6JGbqaX1?=
 =?iso-8859-1?Q?kmPq1nEwXaEGwHcrs+Qohp83V9tl7PmEZ6yhR2rSgtj9uBThn5p0ghBYR3?=
 =?iso-8859-1?Q?xYADq9XWpu2U4ldsHJ2WdNUoLUYb/jdESmxb8rwY050gVyCDRwsFjxe76y?=
 =?iso-8859-1?Q?Khfcuy7aLK4KISY+P+9SZIJmhKExNgGuJ19aH8jYRhaU3vdpBjP/TuI9jQ?=
 =?iso-8859-1?Q?dbv4fSLQyxHpf7eN6KROBHLIwlQgMLtSd76Ya71kBhDa5iMlNzp0Xw5fif?=
 =?iso-8859-1?Q?i2qO79Wz3IfgYFLhx1rl0mpq+EsqPq6WtwfSJx59snAJrMITFYoix8D9+p?=
 =?iso-8859-1?Q?mrV+vfewbeRvidRDy2DHbdkMgUqgiUy8MQARoYmIrUpSZOEEuBIypFmZo5?=
 =?iso-8859-1?Q?iNXSeM089CAUqJJjLVwO9SBtFiKsLlkyg2EH05T5ixgOYA5ZfJWiMsrYoh?=
 =?iso-8859-1?Q?SNKWiWMC3wg/v39/Ml01Jpge1oqJDGrI5fZLxzHTfWMYAeVIlliDN+zTeF?=
 =?iso-8859-1?Q?hZgRoTxKwHS91yeSVKl12WeS4Zblm/OfZejYgWuMzN1Nn/6xDeXhdrQTX/?=
 =?iso-8859-1?Q?eUVA5ni7dtI1XNN/3tsS4BJKiYmGO0ZwdKpbyEkuwSygTyzfbb1H8Iwo0n?=
 =?iso-8859-1?Q?EQBrZcfCIWHxOKPXIEoS4EQ4Yr4Kfl2/2W4ByFvoKMTzECWAvvkvEQLQML?=
 =?iso-8859-1?Q?QETGwNkGLzlg4E51ZRC4SgNUBVtYsiU7cwezVdjWodleYRcA0LPv6An2sE?=
 =?iso-8859-1?Q?sDCqBmW9z4lzlUk9yY9lGvSAEUERXxP2NXXbxBO33FFVJfjMW4lU+MK9WZ?=
 =?iso-8859-1?Q?IRSCXjWrGEoXYHjrI8diEUzEEzAojiAtG5TKsOhzEY/hTRL70CLxlHfqTV?=
 =?iso-8859-1?Q?FMzrcuK7G5oEl3mBQBjP4324Jl9C8B0OuJWtnb5Mo1PcsfOsbkUElhLQ0u?=
 =?iso-8859-1?Q?2cgaFs+w3asQfAc2GAwo83/qkg1XS8AwUwiFHmKU5mJ59sssn7Zy+4jf6j?=
 =?iso-8859-1?Q?fIlXgNBHVfQRU5scxF7LfG2hZNK0c2mTV3pRFHoHvHV2fD8DlQ26cyG3O9?=
 =?iso-8859-1?Q?ri4XyoNqcLoBNwwn5pZJEB6j1vjVWf7Z5olt4XSuXb59TCwdNN8BxOARYl?=
 =?iso-8859-1?Q?6CBObxDquMKxKa8UmMLJ1hSMaLMLOAnS/LTT/8KacS2UOTHFjWh3cKI9Ob?=
 =?iso-8859-1?Q?W6xnrT6PA0aeN327Z1OfznliANA9wHhNAxcrle6eN/7bwEH5FD+6L4XBSe?=
 =?iso-8859-1?Q?2F7X5tSzpxsujTj+L/8Y+D7Y0VRFdtur0sTZUBTN+m9QVg4tM5CAPiH0my?=
 =?iso-8859-1?Q?5y6UIMikgA/KH+xcNE42mb5B0rN/oQTzWf9ViPs3cTsQDDU68UoCwljJwb?=
 =?iso-8859-1?Q?VcjFCzcUw2iYSNPDkkmzEjD57nyX4FRaGkBDiDMFFGNPfd35LjFOgwGyam?=
 =?iso-8859-1?Q?WiLd19asijFBKQhtqRnO7S0zv4K811xXDH56GdRSSnGpCah1rxsqUVpZlJ?=
 =?iso-8859-1?Q?QzoFqquoK589zEF//uoeCJJsXXEVioUKJhJlNC5A5/i32yJSjBKFxCV7PR?=
 =?iso-8859-1?Q?BFIxkevA77Q6wPtYgxsndMtWUV5Az9+sgcmidQdEP5WqxDcpok3+VXkQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f7c32d7-0cc6-4672-ba9c-08de0ae01b6c
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 05:11:18.4215 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RQGQ4bH4hahCTXrpN36IJS4MZwiOPLuMRbPg2tWwSXhTYfl7nyccwqJ48xlnhWe/lT4sBtKeRiPGR2y+CR2+4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB5975
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

On Mon, Oct 13, 2025 at 08:53:48PM +0200, Thomas Hellström wrote:
> When splitting and restoring vmas for madvise, we only copied the
> XE_VMA_SYSTEM_ALLOCATOR flag. That meant we lost flags for read_only,
> dumpable and sparse (in case anyone would call madvise for the latter).
> 

I don't think the above flags should be possible to set / needed to be
retained upon split / restore but non the less a good cleanup. 

> Instead, define a mask of relevant flags and ensure all are replicated,
> To simplify this and make the code a bit less fragile, remove the
> conversion to VMA_CREATE flags and instead just pass around the
> gpuva flags after initial conversion from user-space.

Also a good cleanup. So if CI is clean:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pt.c       |  4 +-
>  drivers/gpu/drm/xe/xe_vm.c       | 86 +++++++++++---------------------
>  drivers/gpu/drm/xe/xe_vm_types.h |  9 +---
>  3 files changed, 32 insertions(+), 67 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index e39da95f3a05..d22fd1ccc0ba 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -2022,7 +2022,7 @@ static int op_prepare(struct xe_vm *vm,
>  	case DRM_GPUVA_OP_MAP:
>  		if ((!op->map.immediate && xe_vm_in_fault_mode(vm) &&
>  		     !op->map.invalidate_on_bind) ||
> -		    op->map.is_cpu_addr_mirror)
> +		    (op->map.vma_flags & XE_VMA_SYSTEM_ALLOCATOR))
>  			break;
>  
>  		err = bind_op_prepare(vm, tile, pt_update_ops, op->map.vma,
> @@ -2252,7 +2252,7 @@ static void op_commit(struct xe_vm *vm,
>  	switch (op->base.op) {
>  	case DRM_GPUVA_OP_MAP:
>  		if ((!op->map.immediate && xe_vm_in_fault_mode(vm)) ||
> -		    op->map.is_cpu_addr_mirror)
> +		    (op->map.vma_flags & XE_VMA_SYSTEM_ALLOCATOR))
>  			break;
>  
>  		bind_op_commit(vm, tile, pt_update_ops, op->map.vma, fence,
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 179758ca7cb8..9c29608aa3bc 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -642,6 +642,12 @@ static void xe_vma_ops_incr_pt_update_ops(struct xe_vma_ops *vops, u8 tile_mask,
>  			vops->pt_update_ops[i].num_ops += inc_val;
>  }
>  
> +#define XE_VMA_CREATE_MASK (		    \
> +	XE_VMA_READ_ONLY |		    \
> +	XE_VMA_DUMPABLE |		    \
> +	XE_VMA_SYSTEM_ALLOCATOR |           \
> +	DRM_GPUVA_SPARSE)
> +
>  static void xe_vm_populate_rebind(struct xe_vma_op *op, struct xe_vma *vma,
>  				  u8 tile_mask)
>  {
> @@ -654,8 +660,7 @@ static void xe_vm_populate_rebind(struct xe_vma_op *op, struct xe_vma *vma,
>  	op->base.map.gem.offset = vma->gpuva.gem.offset;
>  	op->map.vma = vma;
>  	op->map.immediate = true;
> -	op->map.dumpable = vma->gpuva.flags & XE_VMA_DUMPABLE;
> -	op->map.is_null = xe_vma_is_null(vma);
> +	op->map.vma_flags = vma->gpuva.flags & XE_VMA_CREATE_MASK;
>  }
>  
>  static int xe_vm_ops_add_rebind(struct xe_vma_ops *vops, struct xe_vma *vma,
> @@ -958,11 +963,6 @@ static void xe_vma_free(struct xe_vma *vma)
>  		kfree(vma);
>  }
>  
> -#define VMA_CREATE_FLAG_READ_ONLY		BIT(0)
> -#define VMA_CREATE_FLAG_IS_NULL			BIT(1)
> -#define VMA_CREATE_FLAG_DUMPABLE		BIT(2)
> -#define VMA_CREATE_FLAG_IS_SYSTEM_ALLOCATOR	BIT(3)
> -
>  static struct xe_vma *xe_vma_create(struct xe_vm *vm,
>  				    struct xe_bo *bo,
>  				    u64 bo_offset_or_userptr,
> @@ -973,11 +973,8 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
>  	struct xe_vma *vma;
>  	struct xe_tile *tile;
>  	u8 id;
> -	bool read_only = (flags & VMA_CREATE_FLAG_READ_ONLY);
> -	bool is_null = (flags & VMA_CREATE_FLAG_IS_NULL);
> -	bool dumpable = (flags & VMA_CREATE_FLAG_DUMPABLE);
> -	bool is_cpu_addr_mirror =
> -		(flags & VMA_CREATE_FLAG_IS_SYSTEM_ALLOCATOR);
> +	bool is_null = (flags & DRM_GPUVA_SPARSE);
> +	bool is_cpu_addr_mirror = (flags & XE_VMA_SYSTEM_ALLOCATOR);
>  
>  	xe_assert(vm->xe, start < end);
>  	xe_assert(vm->xe, end < vm->size);
> @@ -998,10 +995,6 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
>  		if (!vma)
>  			return ERR_PTR(-ENOMEM);
>  
> -		if (is_cpu_addr_mirror)
> -			vma->gpuva.flags |= XE_VMA_SYSTEM_ALLOCATOR;
> -		if (is_null)
> -			vma->gpuva.flags |= DRM_GPUVA_SPARSE;
>  		if (bo)
>  			vma->gpuva.gem.obj = &bo->ttm.base;
>  	}
> @@ -1012,10 +1005,7 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
>  	vma->gpuva.vm = &vm->gpuvm;
>  	vma->gpuva.va.addr = start;
>  	vma->gpuva.va.range = end - start + 1;
> -	if (read_only)
> -		vma->gpuva.flags |= XE_VMA_READ_ONLY;
> -	if (dumpable)
> -		vma->gpuva.flags |= XE_VMA_DUMPABLE;
> +	vma->gpuva.flags = flags;
>  
>  	for_each_tile(tile, vm->xe, id)
>  		vma->tile_mask |= 0x1 << id;
> @@ -2298,12 +2288,14 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
>  		if (__op->op == DRM_GPUVA_OP_MAP) {
>  			op->map.immediate =
>  				flags & DRM_XE_VM_BIND_FLAG_IMMEDIATE;
> -			op->map.read_only =
> -				flags & DRM_XE_VM_BIND_FLAG_READONLY;
> -			op->map.is_null = flags & DRM_XE_VM_BIND_FLAG_NULL;
> -			op->map.is_cpu_addr_mirror = flags &
> -				DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR;
> -			op->map.dumpable = flags & DRM_XE_VM_BIND_FLAG_DUMPABLE;
> +			if (flags & DRM_XE_VM_BIND_FLAG_READONLY)
> +				op->map.vma_flags |= XE_VMA_READ_ONLY;
> +			if (flags & DRM_XE_VM_BIND_FLAG_NULL)
> +				op->map.vma_flags |= DRM_GPUVA_SPARSE;
> +			if (flags & DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR)
> +				op->map.vma_flags |= XE_VMA_SYSTEM_ALLOCATOR;
> +			if (flags & DRM_XE_VM_BIND_FLAG_DUMPABLE)
> +				op->map.vma_flags |= XE_VMA_DUMPABLE;
>  			op->map.pat_index = pat_index;
>  			op->map.invalidate_on_bind =
>  				__xe_vm_needs_clear_scratch_pages(vm, flags);
> @@ -2616,14 +2608,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
>  				.pat_index = op->map.pat_index,
>  			};
>  
> -			flags |= op->map.read_only ?
> -				VMA_CREATE_FLAG_READ_ONLY : 0;
> -			flags |= op->map.is_null ?
> -				VMA_CREATE_FLAG_IS_NULL : 0;
> -			flags |= op->map.dumpable ?
> -				VMA_CREATE_FLAG_DUMPABLE : 0;
> -			flags |= op->map.is_cpu_addr_mirror ?
> -				VMA_CREATE_FLAG_IS_SYSTEM_ALLOCATOR : 0;
> +			flags |= op->map.vma_flags & XE_VMA_CREATE_MASK;
>  
>  			vma = new_vma(vm, &op->base.map, &default_attr,
>  				      flags);
> @@ -2632,7 +2617,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
>  
>  			op->map.vma = vma;
>  			if (((op->map.immediate || !xe_vm_in_fault_mode(vm)) &&
> -			     !op->map.is_cpu_addr_mirror) ||
> +			     !(op->map.vma_flags & XE_VMA_SYSTEM_ALLOCATOR)) ||
>  			    op->map.invalidate_on_bind)
>  				xe_vma_ops_incr_pt_update_ops(vops,
>  							      op->tile_mask, 1);
> @@ -2663,18 +2648,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
>  			op->remap.start = xe_vma_start(old);
>  			op->remap.range = xe_vma_size(old);
>  
> -			flags |= op->base.remap.unmap->va->flags &
> -				XE_VMA_READ_ONLY ?
> -				VMA_CREATE_FLAG_READ_ONLY : 0;
> -			flags |= op->base.remap.unmap->va->flags &
> -				DRM_GPUVA_SPARSE ?
> -				VMA_CREATE_FLAG_IS_NULL : 0;
> -			flags |= op->base.remap.unmap->va->flags &
> -				XE_VMA_DUMPABLE ?
> -				VMA_CREATE_FLAG_DUMPABLE : 0;
> -			flags |= xe_vma_is_cpu_addr_mirror(old) ?
> -				VMA_CREATE_FLAG_IS_SYSTEM_ALLOCATOR : 0;
> -
> +			flags |= op->base.remap.unmap->va->flags & XE_VMA_CREATE_MASK;
>  			if (op->base.remap.prev) {
>  				vma = new_vma(vm, op->base.remap.prev,
>  					      &old->attr, flags);
> @@ -4238,7 +4212,7 @@ static int xe_vm_alloc_vma(struct xe_vm *vm,
>  	struct xe_vma_ops vops;
>  	struct drm_gpuva_ops *ops = NULL;
>  	struct drm_gpuva_op *__op;
> -	bool is_cpu_addr_mirror = false;
> +	unsigned int vma_flags = 0;
>  	bool remap_op = false;
>  	struct xe_vma_mem_attr tmp_attr;
>  	u16 default_pat;
> @@ -4268,15 +4242,17 @@ static int xe_vm_alloc_vma(struct xe_vm *vm,
>  				vma = gpuva_to_vma(op->base.unmap.va);
>  				XE_WARN_ON(!xe_vma_has_default_mem_attrs(vma));
>  				default_pat = vma->attr.default_pat_index;
> +				vma_flags = vma->gpuva.flags;
>  			}
>  
>  			if (__op->op == DRM_GPUVA_OP_REMAP) {
>  				vma = gpuva_to_vma(op->base.remap.unmap->va);
>  				default_pat = vma->attr.default_pat_index;
> +				vma_flags = vma->gpuva.flags;
>  			}
>  
>  			if (__op->op == DRM_GPUVA_OP_MAP) {
> -				op->map.is_cpu_addr_mirror = true;
> +				op->map.vma_flags |= vma_flags & XE_VMA_CREATE_MASK;
>  				op->map.pat_index = default_pat;
>  			}
>  		} else {
> @@ -4285,11 +4261,7 @@ static int xe_vm_alloc_vma(struct xe_vm *vm,
>  				xe_assert(vm->xe, !remap_op);
>  				xe_assert(vm->xe, xe_vma_has_no_bo(vma));
>  				remap_op = true;
> -
> -				if (xe_vma_is_cpu_addr_mirror(vma))
> -					is_cpu_addr_mirror = true;
> -				else
> -					is_cpu_addr_mirror = false;
> +				vma_flags = vma->gpuva.flags;
>  			}
>  
>  			if (__op->op == DRM_GPUVA_OP_MAP) {
> @@ -4298,10 +4270,10 @@ static int xe_vm_alloc_vma(struct xe_vm *vm,
>  				/*
>  				 * In case of madvise ops DRM_GPUVA_OP_MAP is
>  				 * always after DRM_GPUVA_OP_REMAP, so ensure
> -				 * we assign op->map.is_cpu_addr_mirror true
> -				 * if REMAP is for xe_vma_is_cpu_addr_mirror vma
> +				 * to propagate the flags from the vma we're
> +				 * unmapping.
>  				 */
> -				op->map.is_cpu_addr_mirror = is_cpu_addr_mirror;
> +				op->map.vma_flags |= vma_flags & XE_VMA_CREATE_MASK;
>  			}
>  		}
>  		print_op(vm->xe, __op);
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index 413353e1c225..a3b422b27ae8 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -345,17 +345,10 @@ struct xe_vm {
>  struct xe_vma_op_map {
>  	/** @vma: VMA to map */
>  	struct xe_vma *vma;
> +	unsigned int vma_flags;
>  	/** @immediate: Immediate bind */
>  	bool immediate;
>  	/** @read_only: Read only */
> -	bool read_only;
> -	/** @is_null: is NULL binding */
> -	bool is_null;
> -	/** @is_cpu_addr_mirror: is CPU address mirror binding */
> -	bool is_cpu_addr_mirror;
> -	/** @dumpable: whether BO is dumped on GPU hang */
> -	bool dumpable;
> -	/** @invalidate: invalidate the VMA before bind */
>  	bool invalidate_on_bind;
>  	/** @pat_index: The pat index to use for this operation. */
>  	u16 pat_index;
> -- 
> 2.51.0
> 

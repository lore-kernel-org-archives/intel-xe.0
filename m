Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 538F1D19523
	for <intel-xe@archiver.kernel.org>; Mon, 26 Jan 2026 23:24:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1DF310E4D0;
	Mon, 26 Jan 2026 23:24:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PyftZK95";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E44810E4C1
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Jan 2026 23:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769469847; x=1801005847;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=QkqIQ6m8T2gy0NY5cdfJ1YzMtFAvToj3sNHxjjdjSXc=;
 b=PyftZK95tFrSNjd6NWRFAihFGgVNbiYaeanfcYfsGE5LbeguorjHTG0O
 5z61RbUGdM8aVy9icMl3TwZGeqMz4KKgDEVl6YSyP3WTLjMREwufIFH2u
 uB6pv3b+7BnYK/gW6Hc9VAhYMx80+aVxXXTqzgKus+B7pIOZ1pAFT/SfV
 PvpESq1VYtZ16GMar2cyWnh0rEr0jZGMc3V4804nzERz6v0kKhRKJXYS7
 KbL8qJdzKIBZP5SWvzhdU/Ty9bhdRc+wL4JZvPd+MU5z69XTEG+tur0Ut
 KRvOZY40Sk3S3I5s0PXoDmSzOabc7n4nkU1a4R4YqLPIZZ+TRtYhNjSUD A==;
X-CSE-ConnectionGUID: SSiSXfUUSW+FPvX7ZmODRA==
X-CSE-MsgGUID: nXnylbp4TYWapFr6KK5y4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="69856650"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; d="scan'208";a="69856650"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2026 15:24:06 -0800
X-CSE-ConnectionGUID: ctFhzfdrT268nHcLzAYrKg==
X-CSE-MsgGUID: Le5oe9CBQBK0pPtPpyk6pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; d="scan'208";a="208046578"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2026 15:24:06 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 26 Jan 2026 15:24:05 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 26 Jan 2026 15:24:05 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.41) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 26 Jan 2026 15:24:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cq1IoMWRu5IouZPxey0PLE408jUaC5LD2mxOn6m/aaLpjGgfFr27ruGZcK+uallKaMdbCXZAtiQGLtKZl8SeR/iYy/edEbaTQFpdcA5A9dKEj0sogGRves7Y2HvNLISXIzkig+cdYrkEEx9DodXHjm5UeWQ74uDKuFSLQQ9R8AY1Rc7WgfvVM8t2Pqmh9Dg0FwWeHu1ugriu47SQ42eZel34T3t7CZrHIdFuliYfpRNBXMO4mS1JkD+80jNi7U7RQgpZRIgMunwupkHHH7KHrZwZ8RqQDC/EziZzSJT9Czvg07yClYMNCHgw30AWbhvEefd6ZC+2v63M9V/0arsN3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J+b3y8FJY6/yCAiDGyD4LMB27YpEpepoe78sb4kHKgw=;
 b=trpWAslSn1BjHc872hLYtssaQ+ksMHmK/xIBix33tVJfoEG/PhlviSvMbsO6nqkTdAUmfWUDLu6R48+ilR73Y/2Ma2LNlRBy3OEzb1XaRBkkW6dILJgt8ot0rWcyPLRk/dWR87mxNvlhET6fSplq0dtVdm3C9vnC2DxIOYa6XeUnYaQbHoLmEgJ1MtuLJu6E9oo0JDj/W6OXQYBLA4+TT5x02tgEHHcAKe5bXnXHleQxjtr6FcJJdV67eU5l5ZI0wKj8yoL59sj/9NHlPUvgyGbylB+eeqsYYgno+mYJfiDg3zt9jcu4fe4l6YssoNwXAXakT5HYf9vVRG4QLqaYPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB6697.namprd11.prod.outlook.com (2603:10b6:510:1ab::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Mon, 26 Jan
 2026 23:23:58 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%6]) with mapi id 15.20.9542.010; Mon, 26 Jan 2026
 23:23:58 +0000
Date: Mon, 26 Jan 2026 15:23:55 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [RFC PATCH 0/3] drm/xe: Enable ATS.
Message-ID: <aXf3iylQYAVbxNfp@lstrano-desk.jf.intel.com>
References: <20260126125207.1119351-1-dev@lankhorst.se>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260126125207.1119351-1-dev@lankhorst.se>
X-ClientProxiedBy: MW4PR04CA0300.namprd04.prod.outlook.com
 (2603:10b6:303:89::35) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB6697:EE_
X-MS-Office365-Filtering-Correlation-Id: ea53db77-6142-4154-4ef0-08de5d31fb17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8bwK6NiQFsUaqCQ33hIfXsJIwhupAaUchyH7KtNizt7bRdQt+0gzaB7Ne8c+?=
 =?us-ascii?Q?K8Ik2i+HL1ucxtYrnvPkUnNwVTuJ94+MyNW70QiwWXFQiz0fLw6RxO/TqfC7?=
 =?us-ascii?Q?e34cqMgopwdCGn+PO4kn0M6q0U4i9ezpYiza04+lVcn1WYThqsg66TEEBeVS?=
 =?us-ascii?Q?PszAEhc6BWudG6Ior6/eYJ+svtBEVbp8Zn4Aw/aOErnKVYl2vuNe4iyswM2Q?=
 =?us-ascii?Q?ApdRNml0v+gWfWMIxPK9RPCmWcmYZkL4hIqrD20VeGkY0O8BziLzQthtzsoL?=
 =?us-ascii?Q?XVspG5w1q86Wl7Pb4ajFa+JrwqKaPsgl3Edy/6uvXiefScCHibDDJvakWcd0?=
 =?us-ascii?Q?s18YUR4UFt1dM8xzWxQeUEzSP7PlEFaG0LGOIUqw12yaW0ZFwCJTSXcA6PxL?=
 =?us-ascii?Q?jYXSOBoDo2drUMSss+zTMWpKTjYxGb5RikU4zN4aArbkF4SB8t2AM7D9S1+s?=
 =?us-ascii?Q?LKG1eZdDNWtV9VSsB/J9KcZu7U/HaeYE3zvTJyM9TJpUhJPEmioeUe/XhK+p?=
 =?us-ascii?Q?b7vwFmt0dCQQ3T4gXbB4d7L2EaHg3qRy9K7220tCMMJclbO/oXwxh9SZnNsQ?=
 =?us-ascii?Q?aJUzxCrv9amUScs8NzS+ov2C2xiXqhKHt1vMTnajCHfK2kBZLzKLUEx+4kdn?=
 =?us-ascii?Q?vzLpLRgoj1gO/fsL+Jne078R63Za3slaSE90t0IGLgNuEM9Brvca3pJeJopq?=
 =?us-ascii?Q?Mh9/+RQJ1zTyAeOHcniqjUaIdyR69OqxxhdFWWHyamauWrEso/XZYm0rDH+B?=
 =?us-ascii?Q?TyQ9dIdHLsESdTE99oRaY+iWn9FhSCKR2gy3D1Rd4qnjJBi+Upg2PKfjIs7a?=
 =?us-ascii?Q?LfiFsLMR8ZIRtiD4E/HDyH+e1oxhQ2FUSflLKFRlVV83ljyamlYuFVXnmGuJ?=
 =?us-ascii?Q?aNkwTd+CCXeH/9nRop6JqnD3rhXiJRRJbkFgAlq3R+j8ELVbD7p2XmKhqrjG?=
 =?us-ascii?Q?XAOPJ1q7SwbrjrkelGSxA4dNtfxSDvK7YfNEIlJUEntBd1wbPp2jwHcIhEiT?=
 =?us-ascii?Q?M3fuLBbm3qU+dUtyggxDdnD+1+FsckgpJg9fEMUsYZPELudrNig99nknmgZ7?=
 =?us-ascii?Q?LsFsgzAw+ZM31fRZVmOh3iKoBov6ea1/3Bly1n8qLFBTB9mmnxQXEWQ+NR5+?=
 =?us-ascii?Q?abWXp4s0vsHRokGzyW47oEXdBfU+jeMy73/UcrHDNUOPpmddsYGC1GKULb2B?=
 =?us-ascii?Q?6/366Lq6v9Fzg+m4i9fUU0K28JEFnaAu35XE373dOh6yUKB87DE1NyXfsmnI?=
 =?us-ascii?Q?wfdrhii35lbxhiXxXCwJ3NeOAn8/8tbMjmlZ9D3Np5oo4co7H/t1gPPUYd3+?=
 =?us-ascii?Q?xkJSz/KzfFmDGuWYginvorB97bH6k2gMLRo46itzIk1xou0Bp9u2PIN0D0fJ?=
 =?us-ascii?Q?H0rnS++BbPr0ImhiD3vD8zN0QDMRerJt9gZy0nHoqU7kMelNrZpfZ28FCIfU?=
 =?us-ascii?Q?p6AP8GXWfKvdBXSHI/6TN23dZvhwhN9Nu5WypJlimym271bcIlMVoZQfA0qj?=
 =?us-ascii?Q?BUgZCwaJP9BerN84UooWYn5WsYD8MhfzNaVYGW1F26LJWfNIUMZJsA4kz3O2?=
 =?us-ascii?Q?ltapgc9ji8g6OA2bNLA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uaX/qf3Ij17JXchRgFxRjyQ0fouQBwWTRkE+7SGH19ISAZAdvEMW8tWk01+S?=
 =?us-ascii?Q?glgyc9IVT4AzILqNVdmLwAqc+X9S/+wEQ7h6U0ewAL+JSTckH4ja1wYwWcJZ?=
 =?us-ascii?Q?RkxcqYhoOwc/47My/+CEkBwm2tBD3hdUSRwwwmkZXtvWTgcriy6hCICHyoF6?=
 =?us-ascii?Q?ytyLvsnGAita5rvWNxYBtU3nQo97ix6/OZEEKKtdvyzxe7DrJMXV38xSQnqN?=
 =?us-ascii?Q?gyMVIbI3J+WTv2fwQqcXw3FPHfne0GtuhTg3V6RZb2ml2CAxJnh6BUYEscQA?=
 =?us-ascii?Q?fmwmo3jc9gW+6p8ErIDjOy5yqG9EWedY8JsqJBCefrN4py+XuQmoNoDC2TQy?=
 =?us-ascii?Q?cJxTRgXNYYdTBgFDUyxOvRP0nbXv6trvno38G6trUy7JOPIUC0dEIUiTBDk3?=
 =?us-ascii?Q?1Xitq5GRX9BS4EtKdUW7QXPhKM4lULxap1jMnHpuRspBu2x/ykfzdxJkvBIG?=
 =?us-ascii?Q?0UOOom+tcJM9w9eOBNQAEm2bW+YUBqppaQ8w+657EMb3LU2Oi05+k6k85gBT?=
 =?us-ascii?Q?JWHVTDfqDtqvAegzLO4gYWOZX9xy8GuT1i1EcqT9UEVmlHERiNY+k/miJAh4?=
 =?us-ascii?Q?lsE+Qc50dqq3t37ZEV5DX+40XBYHIBYERkVDG/lQYQ+zbKYh95Sv/ZwocCO6?=
 =?us-ascii?Q?gfJc5noy/CIxWnJ0XgD2HUzr5MZQB4HLvf7L/mCGHLF/wD32bxlumbsIZUdG?=
 =?us-ascii?Q?wsqC4K03PpayQfqtSabBPu1CwmN+8eVRG52B+M8FXx46deT0+1F7dmUXPlZq?=
 =?us-ascii?Q?tj0FOk8uIaRtng0DVHzBBPJRpXv57IVOPOstRHUAwrfyh7IUi1AMJxH2GGYj?=
 =?us-ascii?Q?zEWQrAGOK4bM4MEp6Ci0m7cEK00hfxqE+1gI7FlN8dBn796YXtlsheF4rQNi?=
 =?us-ascii?Q?Xc41fLmkd/giAZGwSoAlFtYSaFJxosapgV52EL7Tq8qQ2Ml01VREEAAPTakh?=
 =?us-ascii?Q?thqKmhciiwGAdmqst6Lky4jZE2GKP8tQ3/DLq/qlmoS0nhQ7UpshOtBdT3IQ?=
 =?us-ascii?Q?94QLoFSOZxvDhYBuAdI+dwUv0F7s+ZvjfsT8PsLUv47IDe4IUgabe4uLb2Oq?=
 =?us-ascii?Q?ojQVy5c7F7Kcxax0+onTAZa/qM+tKBq091J5E2+vvWADZBjTsDVvKnlu234a?=
 =?us-ascii?Q?PAaAZT0hSCRo49GOsXHdjArnqNcS3Nfs3AC8qpoQnSbkmFGUl40rCP4N8wN/?=
 =?us-ascii?Q?FfhT9RSnBmzAdcjBGTVZKFIiRCROast04/AdjFjjInqvzIg6wpmO0Vx7Tz0q?=
 =?us-ascii?Q?+SKOx8Ck8YeLfeddrA2XCJpxUkfD0XfkbYFppF+BlkK0YBmHii/QkcSG6sw3?=
 =?us-ascii?Q?udoyT4r6fD6SbRdoXdWfBkwt/NZBGnk7wXgAAnNQVttH9X4j3G2bKXQIrjx6?=
 =?us-ascii?Q?LLLcSRhkj1Fdcu+tBWsIEMxOKk34ptZ0bnuHC7QpPyLvpWTcKX/SNUeIQwhx?=
 =?us-ascii?Q?LgsXDwWY0OEkdhW6XhsP4et4KdEi9dBgpHlO2nniYLJYEEGVODscmXbdajpb?=
 =?us-ascii?Q?ODO6VIbD9+RJ0IuADXdNLHsnDPCsJ6QyKXmxsBp4MdA35DI0u8GYSaaGiQWK?=
 =?us-ascii?Q?ZV23WTUiXhO0G4TSYhX7EY970r2caogkhP6GIjFg04S6Jm6zHv5DRU7KLyP+?=
 =?us-ascii?Q?9R/w4LNdw0tJM27CKFpn4VuMWFNVt/VQFyk+0P6rY+Iq/3q46eVKNJGN4ND4?=
 =?us-ascii?Q?e7Fu13vioHoKM39q8vQxes8aDMevz5rdrxYAuHEUoIVmqm7BGq6IPeuWrbzx?=
 =?us-ascii?Q?yV2fTIXQww=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ea53db77-6142-4154-4ef0-08de5d31fb17
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 23:23:58.1834 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QBzfgvq2LCE1Ngq3W7dZVakv4SUVZ/9cqs/EbUxzPEGf9Nz3tjZgcOlZWIr0TFfOamuO7crEQj7LhqPIwyljqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6697
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

On Mon, Jan 26, 2026 at 01:52:04PM +0100, Maarten Lankhorst wrote:
> RFC since I believe while the patches work, it might need some help to
> validate the semantics, and whether we want to set ATS unconditionally.
> 

I think it would be good to perf numbers of various benchmarks /
workloads to determine the impact of ATS, plus maybe Kconfig / configfs
knob or something to toggle this for quick experiments.

Patches themselve make sense to me.

Matt

> Add the relevant wiring to enable the ATS flag in PASID, and add a minimal
> selftest to validate ATS works and doesn't break on the first access to
> system memory.
> 
> Last patch is untested, hope to see what CI thinks. :-)
> 
> Maarten Lankhorst (3):
>   drm/xe: Force page fault
>   drm/xe: Set the bits in PASID to enable ATS.
>   drm/xe: Add migration selftest for validating job submission and basic
>     features work
> 
>  drivers/gpu/drm/xe/regs/xe_gtt_defs.h   |  1 +
>  drivers/gpu/drm/xe/regs/xe_lrc_layout.h |  1 +
>  drivers/gpu/drm/xe/xe_device.c          |  7 ++++
>  drivers/gpu/drm/xe/xe_lrc.c             |  6 ++++
>  drivers/gpu/drm/xe/xe_migrate.c         | 46 +++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_migrate.h         |  1 +
>  drivers/gpu/drm/xe/xe_pt.c              | 36 ++++++++++---------
>  7 files changed, 82 insertions(+), 16 deletions(-)
> 
> -- 
> 2.51.0
> 

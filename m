Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5649AD1266A
	for <intel-xe@archiver.kernel.org>; Tue,  2 Dec 2025 19:01:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17C6110E67E;
	Tue,  2 Dec 2025 19:01:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VMeD/Ezi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35BF210E67E
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Dec 2025 19:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764702077; x=1796238077;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=8dZQDm0yJ/CsETOZXunekDAzhqZuHw+lQMTwtr8i01Y=;
 b=VMeD/Ezi0mWfeuvRMCx4I4E4QBCyTxnevUEUijEtFoqV0ceEWxh//vmk
 dHv8Yt6+4RRtUjVVP0qHClM4RR13OnlIpSff4jb/WeHqW74qjKWn/bOzb
 mK9gs1tKdtYvrwj5ulQWaHFIkaNPAFHp4AGJM1cV699qctaZ8Ay+UStxn
 rT7f+5XayQg6bxtkEDMwA5C45D1KXVqheqyHN7y0hs+1C4BKu9Oz2TsQk
 9ve4tY8zBioaZh7d+dQ7wtXAlLW22stt/xINf68vABe4ki5nJSa9U+VQ+
 h9+UGevZZ6l2xo3OOMLmz/xAl6/75masU46KTh4H9brKFUrGqVUJWgYZc A==;
X-CSE-ConnectionGUID: M++c9wdaQyypL8++rcDRDA==
X-CSE-MsgGUID: YudJLSxAR4i9MPBmWeG7yQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="66574903"
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="66574903"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 11:01:16 -0800
X-CSE-ConnectionGUID: TExGnKvtQ7ORW1hLJZLXnw==
X-CSE-MsgGUID: njH4cMjDRCepDSbNuKCbrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="194699375"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 11:01:15 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 11:01:14 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 2 Dec 2025 11:01:14 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.7) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 11:01:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eQX1WokVqto8sGLzGy7XVz4M2lFjbZxIRT9lXuq0JktrKq2mqT7MBsdRXmhZG6a36iFuxRCFXY1LwgZhjyJWana0fHHNPfXMGdcvbqwYOqMRBjFcVSzBou6xLkJ5nCi92ane7DDAzKZLBoctQ/kKGQHAJhnAjqgD5rLdiraV0st7GSN55aUa/MjZJQV6f/2eq8qJrefi43UqzcrIs5f9umq2Ymi4HRyqLXe+Yi6C3Jhk106EavtgdYpB++fzb1Qq5cVAOX++bBMAF1E/rt+S7/Wp2mqbd0kRiupfF5cf6qNL5Mqy3xlncfY8n5oy6jWBnuE70iRTG5ygbiwBGYpA/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j+gStYLnWI8pnv/mj5rGYc0pi9zo/Qb4pndkTRHD7uQ=;
 b=wJRYu39OlXkKKooajfhbUn2Yf0hx1VaMsgQaRawUefwnrXwrCsgt2Ahp5U48RZ0cMjLLX/y9PEJvBsjCZMEmqp4xTzGtHgR9nl5q3erhw4xpFJ7vfeLgYiSnFuZo7PD8PNBHa+MhRI+1eBmKdAWgdcYzwMs9JELBx0YD4r8YiKy8ciVscXM+OWnr8f32VtTmWopvIu7LfhfMKTB0IcAp7umkdun/+GiTjiIurEz6jssllByXtgjsoT1X4/bthXTzHZdcjP6/QmspOgeTR3Dwi3bwc6LsK2jn6KuFXVTjgzFLC8DhnuVZEYRMxVjhJayB7wz2NNrhbYS10Gv/YTyOzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS7PR11MB7740.namprd11.prod.outlook.com (2603:10b6:8:e0::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Tue, 2 Dec
 2025 19:01:12 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9388.003; Tue, 2 Dec 2025
 19:01:10 +0000
Date: Tue, 2 Dec 2025 11:01:08 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Arvind Yadav <arvind.yadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <pallavi.mishra@intel.com>
Subject: Re: [RFC v2 8/9] drm/xe/uapi: Add UAPI for purgeable bo state to
 madvise query response
Message-ID: <aS83dKXLLHvvSHas@lstrano-desk.jf.intel.com>
References: <20251201055309.854074-1-arvind.yadav@intel.com>
 <20251201055309.854074-9-arvind.yadav@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251201055309.854074-9-arvind.yadav@intel.com>
X-ClientProxiedBy: MW4PR03CA0052.namprd03.prod.outlook.com
 (2603:10b6:303:8e::27) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS7PR11MB7740:EE_
X-MS-Office365-Filtering-Correlation-Id: ec1f5f09-99bb-423c-c473-08de31d52839
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?gjKgvatArcmGeWwNRsZ2PQXnc39s+joFnUz3WC9WP/hF5HxauZEfXHdAxf?=
 =?iso-8859-1?Q?6w5OOMy1Djvf7T3R0Jpa/2qjeN4R100tTdRECmTyuj5+tmRqxu7wgVk1U4?=
 =?iso-8859-1?Q?pcAPwBYs02i+wibtpkYSqZCWB2ouIU0OSqf2/AZw9ObObbrsCwWn4Kt1SI?=
 =?iso-8859-1?Q?c2knm8g8/Id+5a+ch03Mt7F6YHLJL7gWjH0pYsp6m+LfZCAQEAK9jtta4N?=
 =?iso-8859-1?Q?fpgb//1CrmG569pMhBdmZeHqyHWd+WktTLGYVqr7Zegg94c9vfPE3VR53f?=
 =?iso-8859-1?Q?NaBSqUE7wc8vOAm9zU6+FHAMHi+OBNm4s2B0vw/8uwjZruwQto0oVz37dS?=
 =?iso-8859-1?Q?L+VIkhNxSfy+Wwe8dSVIJwV2hNK4HwQCcytcwlt7LeIEey8aBxdXWL/Yyb?=
 =?iso-8859-1?Q?8TsKh91w9rWf6NwOtMhuriwMH4Dyk50IPGjWOWIxY0lSd7KS2PgY68qKiz?=
 =?iso-8859-1?Q?YmrJ5M+Mpuz+V+Zd1+rp8peL3Joc/wbMdeB+WKJV3OSQb6b1yDFz7V4wjp?=
 =?iso-8859-1?Q?nenC20AURjnjCE1O1ntbxI7NNUQAcvYL8FrX29bXnVuUgeuyevWVqGC7YM?=
 =?iso-8859-1?Q?ua35rbEQiuTbT0ATG8t3YOTnqMEyn6q2tU44SAV5q0G6eYv1GrOPpqU6GA?=
 =?iso-8859-1?Q?ooiUYvPsmXi283azwdxAdIZexER4SdkIFSKYQFpGQH/NBeekjJGRP08H76?=
 =?iso-8859-1?Q?fg7G8at0I0pmO8OZIXR2GGkRlrHiKjgduRSeLW9g5SqDJ3LiA+pfxxrp8+?=
 =?iso-8859-1?Q?XWI8EKSpAhRBd3FxdKRKuEBad6adgo3kWnPS+Uh57d0IjGNecq3WkA75k8?=
 =?iso-8859-1?Q?jcsxiQYm9wvxDHeQgeZOvMJg68OYK85SWYvVfgyBVOgmjrV+6Bdiee8Ebb?=
 =?iso-8859-1?Q?UJbBM/aFcpJfjFoCX9bG3a5YkQeTfplUanGgrW3gcBJp19e0JBosWnGuX5?=
 =?iso-8859-1?Q?l0/+W4yuJ3yIELLA0JVzqVjdsGGVRWY1gsZ1kZO8weAMRdXl5r2AtjlRaz?=
 =?iso-8859-1?Q?0FQh5ub056Jer0XZHLdD/P0Zf+YD3kH0zB8yApIdyNuINwAJy4LLf5mn1M?=
 =?iso-8859-1?Q?/Va+Ic0JM8gM5bea1+eJ/xehc29pDABYzODQju96sR+1fV3SDNgBF6RuX3?=
 =?iso-8859-1?Q?GsmHLLrds8SZWl7Trzq3glDJ4aFVtWrX+/PiG60LVnbd3DdyczzSNgxVHD?=
 =?iso-8859-1?Q?dm56fCcK53V2ukWGjYLfH3J+soran/quCYpkxts8ySbOL7lNrFskdOpln0?=
 =?iso-8859-1?Q?1oWtGKfItGQwPeD51+KF7lYtvGdXtFQkrp1Sqm1539PJGo5db/j82ecGxw?=
 =?iso-8859-1?Q?NxR6KB9QAsS34GDPcWngBN3ySiR+DDnBGefelRz4tzb3hz6PAZbwDsS4HY?=
 =?iso-8859-1?Q?7E2wzMjGzA7ZVIyGfXTkOoXZ7eEdZtDGQ93Tteh1Jz5d9dtxXG7dqngx3N?=
 =?iso-8859-1?Q?rOBizNEiSq0jGKufkiis6GxwEdVsoVSimJCIEkPQM0LTdMQMvqXzuECc6R?=
 =?iso-8859-1?Q?vUo74rcfs4ZuSNVL9GHiaE?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?KI+lGtxo3hcwrj0H0UmCtQ9bPHS4bWI8o+M+s1nNmIh7XYiYpzhpXtgPL2?=
 =?iso-8859-1?Q?ROZ7WlN9SVMMp4bAsAyDHca4hG8+k2FjtR9qG/JQTzCkOMujemxPnO5aW3?=
 =?iso-8859-1?Q?tMW+ZM11UaxfvBiV0tQgS1EaYt3oUd2ZN3eKiitxvvhU3d4zWih5zq2wrx?=
 =?iso-8859-1?Q?u26/jJpATzIntEHJIXrRXUkK5kPErlnUDpllchBaNNMsJIG7b3EkSxaBhZ?=
 =?iso-8859-1?Q?n1N5iwAewkywfMyfprRPSGeMNmJsBHpKCCaOPnZo4VuV6pXlof1P5G0/e6?=
 =?iso-8859-1?Q?tR6IIuxk6L2r3fgZOIuHWJ4Xaf3p4u4z7SsohKT5aHQiqhhwIdPVQJUtiZ?=
 =?iso-8859-1?Q?zxHmYrmqzs0+3+CD6Xs17YI8t+lOApy/tK5IOuQsJYvr4cPnV7HwYVHKjn?=
 =?iso-8859-1?Q?NEugXbmk8lDEKD4ODFYb/08wO2TKUe2ijNRlGoxF1vuhLqZoLxBGXyaAtK?=
 =?iso-8859-1?Q?fBuxHek3IV74BZMQOEmlLe45XIZU2Ep4lncYd7uuDdcjs7NbgA7FGLl2j3?=
 =?iso-8859-1?Q?d/YkNhbSTnJ2JYxq+2HgF3B51c4YpVtFHq6dq9EeOUjij1lWRaUN5Nnt6z?=
 =?iso-8859-1?Q?+CEIsYNFNBX1F7+Cd1BKFb2OVA2AB4sxDYd+uh/ckDhMBEkAxRoHjyOQyY?=
 =?iso-8859-1?Q?vnd1q4aWdt0mo9OCl2XGFir1ZWD0bB6k2idwZLkGMuC5bKg5k/cCuRcMwi?=
 =?iso-8859-1?Q?JY4SAB+9FPbPfX3SEGsLNvAZF/7DQJOr1NduEmnVcr28K+FnB5pqf9zSIK?=
 =?iso-8859-1?Q?doCAmF2URvjgoKQuAjUowvEnHlGn5E+tDGUrZn0v3ZWOZqQcvqu5my+iww?=
 =?iso-8859-1?Q?4JCkj/pWVzCqQSG2NaoIoXFDvBYq0E6QJWjGDzFyibi9hhUCcj3BahVIly?=
 =?iso-8859-1?Q?THbAiuUOShh9cqLOLslvFZ06SkoBY6rCjlMQMr5C6nYEJ3leNgaC3a3ask?=
 =?iso-8859-1?Q?SI0ma078nG2GVikySmP7mXl+tiS2OxmUj7/y4cHsX9/RDh0quM8nRnuu3n?=
 =?iso-8859-1?Q?85bzO9FaS+vKcrL90xyb0d6niinCw6a64pIOcCD7N5Q7Y3ytw+Fag2s/Z6?=
 =?iso-8859-1?Q?IxBJ0IQGv0fY5HjZgKMP01gfIgrpM5YHp8au5SUugIaH4vvkvAeYjEcy1J?=
 =?iso-8859-1?Q?xOHcFs4TcS4RhrquBi4b+PeIdyYGHijospvYTOVAXsBxL+9d5iH9WvnKlw?=
 =?iso-8859-1?Q?QYHNrRpiImLmMBa/7WW5tjrqvtbTqr1r36pyFOLBqYhvOhbj+zxmtbwcsN?=
 =?iso-8859-1?Q?7AhkAdLOUviM4T0sHnO/wkZ0IZ9Zhww6A2dzZ+bCkxz0cBXHkYhfe5nIMm?=
 =?iso-8859-1?Q?PCZOR6aLHhr6BrfbTpe4IjsMU1raouC8HCOhr5cJ+U4Qqv79l6pk3rd9qS?=
 =?iso-8859-1?Q?1j6hNndMT5bkTEjn+J+IJa5hhhsJ/tQyGoX4WErtukGsost3bpFzxkWlQt?=
 =?iso-8859-1?Q?bLbEAUyYavmTvWxZ8PokfRCmOBAIcqHLjxpJAasIOJDMGLG+ZHk+x4Bbt8?=
 =?iso-8859-1?Q?AoLbp/T1C8qOH7r+nIJT3ka4TST7HYGWaT3NNcUq6nwR9dmNxp+jcLhjR1?=
 =?iso-8859-1?Q?lnPHGR3CuyJhgrs7q24t+wwBcOxEz7IAkGwu0wmFFB1IFXaFgkw6lvdpN+?=
 =?iso-8859-1?Q?FBIKeIQ/+5nATZNtADbBzC+B2+zk7lG+ios2EOPQ6/fMWMOG8PM2ynoA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ec1f5f09-99bb-423c-c473-08de31d52839
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 19:01:10.7511 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UnWDUpguWFMJCI9NL2NgwbohXfFOp13dY8BWScQYEQmCCbglvmqJWiaHpwJcfYPAFiJe8ocE3oE197ThBXlDbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7740
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

On Mon, Dec 01, 2025 at 11:20:18AM +0530, Arvind Yadav wrote:
> From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> 
> Complete the purgeable buffer object UAPI by adding the response
> structure to drm_xe_mem_range_attr for querying current purgeable
> state of buffer objects within a memory range.
> 
> This allows userspace to determine the current state of BOs:
> - DRM_XE_VMA_PURGEABLE_STATE_WILLNEED (0): BO actively needed, has backing store
> - DRM_XE_VMA_PURGEABLE_STATE_DONTNEED (1): BO eligible for purging, still has backing
> - DRM_XE_VMA_PURGEABLE_STATE_PURGED (2): BO purged, backing store freed (read-only)
> 
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
> ---
>  include/uapi/drm/xe_drm.h | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 02d63938d16f..8f289a2849ff 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -2147,10 +2147,14 @@ struct drm_xe_madvise {
>  		 *  - DRM_XE_VMA_PURGEABLE_STATE_DONTNEED (1): Hints that BO is not
>  		 *    currently needed. Kernel may purge it under memory pressure.
>  		 *    Only applies to non-shared BOs. Returns retained=1 if not purged.
> +		 *
> +		 *  - DRM_XE_VMA_PURGEABLE_STATE_PURGED: Read-only state indicating
> +		 *    the BO purge state.

This is tricky one. Since the value of purgable state can immediately
change after getting populated, is there any value in reporting this to
user space? My guess is no. So with that, I'd probably remove this uAPI.

Matt

>  		 */
>  		struct {
>  #define DRM_XE_VMA_PURGEABLE_STATE_WILLNEED	0
>  #define DRM_XE_VMA_PURGEABLE_STATE_DONTNEED	1
> +#define DRM_XE_VMA_PURGEABLE_STATE_PURGED	2
>  			/** @purge_state_val.val: value for DRM_XE_VMA_ATTR_PURGEABLE_STATE */
>  			__u32 val;
>  			/**
> @@ -2224,6 +2228,15 @@ struct drm_xe_mem_range_attr {
>  		__u32 reserved;
>  	} pat_index;
>  
> +	/** @purge_state_val: Purgeable state configuration */
> +	struct {
> +		/** @purge_state_val.val: value for DRM_XE_VMA_ATTR_PURGEABLE_STATE */
> +		__u32 val;
> +
> +		/** @purge_state_val.reserved: Reserved */
> +		__u32 reserved;
> +	} purge_state_val;
> +
>  	/** @reserved: Reserved */
>  	__u64 reserved[2];
>  };
> -- 
> 2.43.0
> 

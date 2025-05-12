Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C84B9C3ABC3
	for <intel-xe@archiver.kernel.org>; Mon, 12 May 2025 20:29:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EA4610E1DB;
	Mon, 12 May 2025 20:29:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="isWAIa6Q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C866110E1DB
 for <intel-xe@lists.freedesktop.org>; Mon, 12 May 2025 20:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747081742; x=1778617742;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=VVL9Ij7FIfid8V6YFVhhq8TYsaxDKFAehhVINAKIb6M=;
 b=isWAIa6QIPdFLSzzQ6Pp9XP29edWFM+D3xK7Ns6UjnNkc/hOlTSMKADI
 BFe5owtfiJxAuoR2p5U6bF41NlGTLuXfLF5Olms37BlvmBkfFBJPJhIUs
 FUXGvSrUzCZIqe1opl7d5ArwD3WbxuMoWUZi8/Hf9xxNI8eR+hv6+qhQS
 nj7UBjfHJ76+Wu1dZNpjavNghM4v0iETZEuJPIATOJCf2wXMXn4KdqV0L
 Y19K2bTYWa7CkN0CQihNjSJOHGD6eo0g0sjetJz5/gC2aTVHo6nK/H/Y7
 PUR+0F0Wll4EM1i30cAZN71fqYyHKZ94TWv1ucgdOno///NZ+PAZ3cVSo g==;
X-CSE-ConnectionGUID: yb68wiOBRBqh8lyozEIe3w==
X-CSE-MsgGUID: 5gOpMyKMTq674b0fwbSEWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="74296361"
X-IronPort-AV: E=Sophos;i="6.15,283,1739865600"; d="scan'208";a="74296361"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 13:28:56 -0700
X-CSE-ConnectionGUID: jDVbhWJJTzSdQVwVhdM5tg==
X-CSE-MsgGUID: advyRDqtTq+RJAhW2sTt3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,283,1739865600"; d="scan'208";a="142354626"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 13:28:35 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 12 May 2025 13:28:34 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 12 May 2025 13:28:34 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 12 May 2025 13:28:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vnvUk3fuzhku35ooO96BVh3z0ti+9cRZGcJ9vjbsuC94+mGNCY+MlSZUXATEN0LLvyd8kmolz/Qyx3UJpcuDMgpEuV40DXTqqviGg8BEF3PsvElRtk09zpnS6ji7p/26LHmwmhFstL7CbexkHusiDzta67gF/63l6rO8e4pPiBw00T8LiikkK5e18KsnelL0VcQEu/aaSgNBBUw5tUQuH4v6R3GPMFI4KuXRUhWICNuRF8z8mnQWebJ3yp3Wl4LadiG2aHOPqM2TjczcFp6VFmLyelB0wioZ9WBg/JaioygjcbgZnKW0orgsDDiXjJqMIZWSIJkzOW/HeMINV0/JlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PQW+iYYaRzBweyFXzL+bceDo7tsRmfz1mcREG8AIQFI=;
 b=uL4iNTeiq25c7vKJKY3nEZCSIikDMZGw4/rB3Oex8Dc0E9i46am6JdmldTY0TT3d5Ap5/u4PUV/L2rW6wM7ofcC2/YQlWnTIMjq7xWWRpkWgCCF7YLIJwCMwWm5M0IdnYVd7eHn1H87c1jAKFiuajOS4hsWpCAUwPtAQuiTZojSVDq03iS7szeSxznwlOIaCRuUnmfka7isqH7ODOI9ihp/VQ55/VU4XJ42wEmKbKlxvuf5/pOnbxFV9LZQ0xBUjxaYNTGzQ2o2ToaA1Z+2h/QxqrLs0RPQDmzMwN0bfS4bjPxkVSsLu7EyFEKDTNnF9XnjPvr+ubsPaIJxO9nmFOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SN7PR11MB6996.namprd11.prod.outlook.com (2603:10b6:806:2af::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.28; Mon, 12 May
 2025 20:28:22 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.8722.027; Mon, 12 May 2025
 20:28:22 +0000
Date: Mon, 12 May 2025 13:28:19 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Aradhya Bhatia <aradhya.bhatia@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw=?= =?utf-8?Q?=3A?= failure for
 drm/xe/xe2hpg: Add Wa_22021007897 (rev3)
Message-ID: <20250512202819.GJ5080@mdroper-desk1.amr.corp.intel.com>
References: <20250512065004.2576-1-aradhya.bhatia@intel.com>
 <174703926548.68358.10319035322959910520@c664b1dc75d1>
 <de56374a-5923-4106-8bb7-9a2175b01046@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <de56374a-5923-4106-8bb7-9a2175b01046@intel.com>
X-ClientProxiedBy: SJ0PR05CA0003.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::8) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SN7PR11MB6996:EE_
X-MS-Office365-Filtering-Correlation-Id: fe6a7a04-1b0b-46e9-135d-08dd91938a32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xBN9ozW9VzzJY4EN5Muntsg25/FqwgCpL1VUlIp9qG7r1otWB6kNyXcaH/KG?=
 =?us-ascii?Q?Z5ib/LD/i9vLGnP8eMhQFVYfcmZvQsxN285JoouJVkQzOwN5sszAyELlwxHy?=
 =?us-ascii?Q?qcHqmVK5x+wrVs8PQWiN+Ol7FH4nfKmddqS6QE2qSiBFiWXMNr+ZURUzvrqE?=
 =?us-ascii?Q?uwPNzJ0nyVr6T0cgiRPDf7Ct/K+KlOu5PtkyhE+7KfuJ190byJhdyDBZAo3e?=
 =?us-ascii?Q?eAOMSH2+2P9Y7DZk+GVpw0Fz0aXMV0srusyPmBBPt6eluk/27BNadAcsKdxy?=
 =?us-ascii?Q?hdgv4lFI05DQDo9CbLn7AD4eLsSmrL3fdKYqHHs4TaOa8xddKPrSR9J66YWs?=
 =?us-ascii?Q?0Xn0bjOr/Q1gc9pJYOk75e9nplfwHA8MKRhDERFcyl4mc0ouT+cjkniPiugZ?=
 =?us-ascii?Q?HHqRM3hiraIa0W4wYFVK3y/Kk/EO7G6zspp6AgRUsCOpUPDSTBkJySp2BY7x?=
 =?us-ascii?Q?fclRY3zNkdJfNfbjhR1L+CicL7vbFBlyALWbBvkrm2XHas/wReGHPJc1zXEz?=
 =?us-ascii?Q?GS4yJt4BoXZkRfm3sEmT9dNZ1eRJkZecLZBwH5B8oZQn2BZAHO9LrPLuU0UD?=
 =?us-ascii?Q?vz6shl5VQ8XneIaxGPH+/rEZhUxko/IaUb3E4fLQjIL7eqcQOogDjBh6SnZP?=
 =?us-ascii?Q?XDk0GbUP6smewQuScMxb/mRiULF/IFd55Vfa8NK/JsJzY0BgTBW0LPesrfvO?=
 =?us-ascii?Q?t8VBQJuwZoxQF0Grob4XuQk5PH8fBalem+GdhjXaZczoAUktbDLHCXpvK0mV?=
 =?us-ascii?Q?Z+vbn9z7fVJysu76tiTH8WaCeCRxWDwHZpetrtPdfjuf5xj3AHYhZtT0dQvp?=
 =?us-ascii?Q?C6lqQngsynmdzW8lM6dr3nVdQ65GINo5rBP0TdrrfxSWGnhUhYLrLG7QitSK?=
 =?us-ascii?Q?S3jM4Ijl09fX9XieWSSWBBspQysP20WlnQNrzONMko+D58VucVUGUM8xvBQG?=
 =?us-ascii?Q?qi1wvh0I2bjgv2/lLLsdg1Vk3zoSvw/MTq6HACzi5HICt2h4CKQRa7r/+sNV?=
 =?us-ascii?Q?m1Qo+3GzTQyoS+0U2D7WKXTKHbKSjZOmbOmNN6i6RwVh1f9gS8BERiGEWenq?=
 =?us-ascii?Q?LUaFyCtx8tDQ3qIYt1BZ4zvGm2Eh7r1+x5un1pgI1ouE+T14TkzbulU3tQi0?=
 =?us-ascii?Q?5wuKiumhJWMi+6O38n+FH/y4wxM08HGupib7wn54ACMN6zqTZL31rjD36BnU?=
 =?us-ascii?Q?PSSzSF4mHURzcL9qxYFG3kAwy7Hvh/KuGlnayvFUGBZY/z+nOtOSbkB+bRKH?=
 =?us-ascii?Q?rLiBB05UV17mvacodVfhtUzUViaoHyBGJL5hSRrcfVPQq01AyGOPYWmSxURz?=
 =?us-ascii?Q?IkzzUw2G8E46URSndBPBkfy+8RwumQmMQ7wnvKLCBvuymXEoBnKP/oXQ3cn5?=
 =?us-ascii?Q?Eg97ws0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xrDjZmySLBbqOcloklZ5xuBt+hHgZ+/eFsTa3UHRUmIuibLNarsYu6lMyzIX?=
 =?us-ascii?Q?NXc752sYhAMpaO2WO4gSVzp/SvHb33/kkp+hRzbAI0K1dtYdYU0JpDFoi0pm?=
 =?us-ascii?Q?Ai5j3JV9astF6XE1os7dKgeFDMvRBB8J2lCBc0SzzJoelZCsWvFudoXVLQNx?=
 =?us-ascii?Q?AyPOru7F0/JuY5Y1Iuq8FPFj6h61mnC5f65VCear/6TNtwrdj9x8+AU3Bgoy?=
 =?us-ascii?Q?7kdEyXRBoYG33su5RfQpTJzQyuIJLBiDvmCYHqh7Tn6cXLEZ5h887722Og4R?=
 =?us-ascii?Q?+zuXcX1tOvsuFk0LPT7R2bRQ4HA2lmyxrEWlopfIiWPvmnTd+aUJHI9+Z6yv?=
 =?us-ascii?Q?5iGZlphMVHd1a127VRtYOiZxcvkEkTMe65FRaowQC0nna0t2W4nhFPHJqOC6?=
 =?us-ascii?Q?Cf7SANHDLuEaDsZV6RL51td5Tb7OJMyi92oU2wSV/9pK7IZX07IxbDxCyNyO?=
 =?us-ascii?Q?g6q7cYJcnKJgyyaZxCI6zkmmmNtcCkZhug8EFpoKRbh3u4jvkss38ula4tG5?=
 =?us-ascii?Q?KKRk7b0rqdbyUJqAI49W5UpjSkwMW+3ub6e8LlGl1KxR7QZEaNU4A+p26YC7?=
 =?us-ascii?Q?DOC1bwMAIGIsZuQLPTNTRK78uxUBBuDcChxwD2Ec8OQ6OImwbUEXJdW959SH?=
 =?us-ascii?Q?bo3IO0IFKc/v2ZBkIfeks+1Nbtn0p1ZwjpeKETavNVxacvSW/xbvwCtslthX?=
 =?us-ascii?Q?DdRxWGYuAposzsH7o3yMVYvCDwaYCCz5ED97x+lG1DHYVSmyM2/j5wGI3PXg?=
 =?us-ascii?Q?0/a97+0CPNqawwiGg7r8nvvzQxautXbwBwTqwNDMgabQjLBq4xKjFWrMRozM?=
 =?us-ascii?Q?9/TASmsLV2TqT/YZdGtYd0VEqEYL73Y4SzDNoAoZ7FnsNQW3fg7xSSNljZTu?=
 =?us-ascii?Q?Fl8M3rUSFIesan1O12HBB88yl+0Q+XK6BCaebNgeMjQi2v4xU3DaRHZmxiYb?=
 =?us-ascii?Q?ShI1W/yUmN8Rfl4mOJSa6lSOPN/IK+9jaNsVSpGuHgUrM9Tzd3dg6TCxer6q?=
 =?us-ascii?Q?tdNFhTsnxxXyUNxlJq7M8d7n7gcGwIsKsINy7RZDWnyjx7CkEof5LgGg36ac?=
 =?us-ascii?Q?50LamuZNBcmiSLeyDpnQaPelj28Jvi7SsV+K3f64u06lkbj0mo276b+7/1Qi?=
 =?us-ascii?Q?K5hC1z87P6nxCqEjg/tMz2WJqCkdw7/7FgOWJQnuKyYgQc9G4rwGbJu//0j8?=
 =?us-ascii?Q?30l6IyZl15+j+AyjdB9dXKkEPDrPDqO5YDBTTdd1h5ypcBdeGxcQLBFjwHWX?=
 =?us-ascii?Q?DTAA7WXIvNj3XEyn8Tf6cI2xHM1MPAcUUQHtmJNuokL1L6WcM0JBI55YFWpr?=
 =?us-ascii?Q?q8za6lAhd/1T1kpvY0OajfshpULKiN/4YIKnyjx/vnBsfmcmAv1FdxvLpAKp?=
 =?us-ascii?Q?iQ5/hkHpuSYh3T5FVGAQPVkNdxhlRDewxQIKFOCTC5ZT6QHW3Gvy6TpPnFdk?=
 =?us-ascii?Q?qXRsWcb9I3bdXu0okqIQIp65l6cAk9/hCtbpzZAscHmz3Alinq1JGjVmxgPk?=
 =?us-ascii?Q?OaoW4TDZM6DeiwE4ywh3zOSOg1ddA66EIY39zNZSo4NugBWmw0NCNdxmMMnN?=
 =?us-ascii?Q?+0kr/d+TenKacuFVekGLNTStfH6tvXOkWDNEH4kr/AAQNTjfwitYokF2hMZk?=
 =?us-ascii?Q?Kw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fe6a7a04-1b0b-46e9-135d-08dd91938a32
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 20:28:22.5048 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oSdwb4+kc21k7u+A4tGQGdbvPUtLQBjZL3QWcNE2qWS0zAkC4xG9vJ21WR+ooV+rlPTiyLZOCtBuJSzk07kGQXubvqatBXhiDnv8p2H8QKg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6996
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

On Mon, May 12, 2025 at 02:17:06PM +0530, Aradhya Bhatia wrote:
> Hi,
> 
> On 12-05-2025 14:11, Patchwork wrote:
> > == Series Details ==
> > 
> > Series: drm/xe/xe2hpg: Add Wa_22021007897 (rev3)
> > URL   : https://patchwork.freedesktop.org/series/148672/
> > State : failure
> > 
> > == Summary ==
> > 
> > CI Bug Log - changes from xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9_FULL -> xe-pw-148672v3_FULL
> > ====================================================
> > 
> > Summary
> > -------
> > 
> >   **FAILURE**
> > 
> >   Serious unknown changes coming with xe-pw-148672v3_FULL absolutely need to be
> >   verified manually.
> >   
> >   If you think the reported changes have nothing to do with the changes
> >   introduced in xe-pw-148672v3_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
> >   to document this new failure mode, which will reduce false positives in CI.
> > 
> >   
> > 
> > Participating hosts (4 -> 4)
> > ------------------------------
> > 
> >   No changes in participating hosts
> > 
> > Possible new issues
> > -------------------
> > 
> >   Here are the unknown changes that may have been introduced in xe-pw-148672v3_FULL:
> > 
> > ### IGT changes ###
> > 
> > #### Possible regressions ####
> > 
> >   * igt@kms_atomic_interruptible@legacy-dpms:
> >     - shard-dg2-set2:     NOTRUN -> [SKIP][1] +2 other tests skip
> >    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-432/igt@kms_atomic_interruptible@legacy-dpms.html
> > 
> >   * igt@kms_flip@absolute-wf_vblank:
> >     - shard-dg2-set2:     [PASS][2] -> [SKIP][3] +12 other tests skip
> >    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-433/igt@kms_flip@absolute-wf_vblank.html
> >    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-432/igt@kms_flip@absolute-wf_vblank.html
> > 
> >   * igt@kms_pm_rpm@universal-planes:
> >     - shard-adlp:         [PASS][4] -> [SKIP][5]
> >    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-adlp-8/igt@kms_pm_rpm@universal-planes.html
> >    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-adlp-9/igt@kms_pm_rpm@universal-planes.html
> > 
> >   
> > #### Warnings ####
> > 
> >   * igt@kms_bw@linear-tiling-3-displays-3840x2160p:
> >     - shard-dg2-set2:     [SKIP][6] ([Intel XE#367]) -> [SKIP][7]
> >    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-433/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html
> >    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-432/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html
> > 
> >   * igt@kms_chamelium_hpd@dp-hpd-storm:
> >     - shard-dg2-set2:     [SKIP][8] ([Intel XE#373]) -> [SKIP][9]
> >    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-435/igt@kms_chamelium_hpd@dp-hpd-storm.html
> >    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-432/igt@kms_chamelium_hpd@dp-hpd-storm.html
> > 
> >   * igt@kms_cursor_crc@cursor-onscreen-64x21:
> >     - shard-bmg:          [SKIP][10] ([Intel XE#2320]) -> [SKIP][11] +1 other test skip
> >    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-8/igt@kms_cursor_crc@cursor-onscreen-64x21.html
> >    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-bmg-5/igt@kms_cursor_crc@cursor-onscreen-64x21.html
> > 
> >   * igt@kms_feature_discovery@display-3x:
> >     - shard-bmg:          [SKIP][12] ([Intel XE#2373]) -> [SKIP][13]
> >    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-5/igt@kms_feature_discovery@display-3x.html
> >    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-bmg-5/igt@kms_feature_discovery@display-3x.html
> > 
> >   * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:
> >     - shard-dg2-set2:     [SKIP][14] ([Intel XE#455]) -> [SKIP][15]
> >    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html
> >    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html
> > 
> >   * igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area:
> >     - shard-dg2-set2:     [SKIP][16] ([Intel XE#1489]) -> [SKIP][17] +1 other test skip
> >    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-436/igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area.html
> >    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-432/igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area.html
> > 
> >   * igt@kms_psr@fbc-psr-primary-page-flip:
> >     - shard-dg2-set2:     [SKIP][18] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][19]
> >    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-466/igt@kms_psr@fbc-psr-primary-page-flip.html
> >    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-432/igt@kms_psr@fbc-psr-primary-page-flip.html
> 
> These possible regressions do not seem related to the patch.

Applied to drm-xe-next.  Thanks for the patch and reviews.


Matt

> 
> Rgeards
> Aradhya
> 
> 
> > 
> >   
> > Known issues
> > ------------
> > 
> >   Here are the changes found in xe-pw-148672v3_FULL that come from known issues:
> > 
> > ### IGT changes ###
> > 
> > #### Issues hit ####
> > 
> >   * igt@fbdev@info:
> >     - shard-dg2-set2:     [PASS][20] -> [SKIP][21] ([Intel XE#2134]) +3 other tests skip
> >    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-436/igt@fbdev@info.html
> >    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-464/igt@fbdev@info.html
> > 
> >   * igt@fbdev@unaligned-write:
> >     - shard-bmg:          [PASS][22] -> [SKIP][23] ([Intel XE#2134])
> >    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-2/igt@fbdev@unaligned-write.html
> >    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-bmg-5/igt@fbdev@unaligned-write.html
> >     - shard-adlp:         [PASS][24] -> [SKIP][25] ([Intel XE#2134])
> >    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-adlp-3/igt@fbdev@unaligned-write.html
> >    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-adlp-2/igt@fbdev@unaligned-write.html
> >     - shard-lnl:          [PASS][26] -> [SKIP][27] ([Intel XE#2134])
> >    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-lnl-3/igt@fbdev@unaligned-write.html
> >    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-lnl-1/igt@fbdev@unaligned-write.html
> > 
> >   * igt@intel_sysfs_debugfs@xe-base:
> >     - shard-dg2-set2:     [PASS][28] -> [SKIP][29] ([Intel XE#4208] / [Intel XE#4618]) +2 other tests skip
> >    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-432/igt@intel_sysfs_debugfs@xe-base.html
> >    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-464/igt@intel_sysfs_debugfs@xe-base.html
> > 
> >   * igt@kms_addfb_basic@bad-pitch-999:
> >     - shard-dg2-set2:     [PASS][30] -> [SKIP][31] ([i915#6077])
> >    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-433/igt@kms_addfb_basic@bad-pitch-999.html
> >    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-432/igt@kms_addfb_basic@bad-pitch-999.html
> > 
> >   * igt@kms_async_flips@async-flip-with-page-flip-events-tiled-atomic@pipe-d-hdmi-a-1-y:
> >     - shard-adlp:         [PASS][32] -> [DMESG-WARN][33] ([Intel XE#4543]) +3 other tests dmesg-warn
> >    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events-tiled-atomic@pipe-d-hdmi-a-1-y.html
> >    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-adlp-4/igt@kms_async_flips@async-flip-with-page-flip-events-tiled-atomic@pipe-d-hdmi-a-1-y.html
> > 
> >   * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:
> >     - shard-dg2-set2:     [PASS][34] -> [SKIP][35] ([Intel XE#4208] / [i915#2575]) +130 other tests skip
> >    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-436/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html
> >    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-464/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html
> > 
> >   * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
> >     - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#2327]) +2 other tests skip
> >    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-bmg-3/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html
> > 
> >   * igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:
> >     - shard-dg2-set2:     [PASS][37] -> [SKIP][38] ([Intel XE#2231] / [Intel XE#4208]) +3 other tests skip
> >    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-466/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html
> >    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-432/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html
> >     - shard-bmg:          [PASS][39] -> [SKIP][40] ([Intel XE#2231] / [Intel XE#4996])
> >    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-5/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html
> >    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-bmg-5/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html
> > 
> >   * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
> >     - shard-bmg:          [PASS][41] -> [SKIP][42] ([Intel XE#2231])
> >    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
> >    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-bmg-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
> > 
> >   * igt@kms_big_fb@linear-16bpp-rotate-270:
> >     - shard-dg2-set2:     NOTRUN -> [SKIP][43] ([Intel XE#316]) +1 other test skip
> >    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-463/igt@kms_big_fb@linear-16bpp-rotate-270.html
> > 
> >   * igt@kms_big_fb@linear-64bpp-rotate-90:
> >     - shard-adlp:         NOTRUN -> [SKIP][44] ([Intel XE#316])
> >    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-adlp-8/igt@kms_big_fb@linear-64bpp-rotate-90.html
> > 
> >   * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
> >     - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#1407]) +1 other test skip
> >    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-lnl-4/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html
> > 
> >   * igt@kms_big_fb@x-tiled-addfb-size-offset-overflow:
> >     - shard-dg2-set2:     NOTRUN -> [SKIP][46] ([Intel XE#829]) +3 other tests skip
> >    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-432/igt@kms_big_fb@x-tiled-addfb-size-offset-overflow.html
> > 
> >   * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
> >     - shard-adlp:         NOTRUN -> [DMESG-FAIL][47] ([Intel XE#4543])
> >    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
> > 
> >   * igt@kms_big_fb@y-tiled-addfb:
> >     - shard-lnl:          NOTRUN -> [SKIP][48] ([Intel XE#1467])
> >    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-lnl-5/igt@kms_big_fb@y-tiled-addfb.html
> > 
> >   * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:
> >     - shard-dg2-set2:     NOTRUN -> [SKIP][49] ([Intel XE#1124]) +2 other tests skip
> >    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-463/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
> > 
> >   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
> >     - shard-adlp:         [PASS][50] -> [DMESG-FAIL][51] ([Intel XE#4543]) +10 other tests dmesg-fail
> >    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
> >    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
> > 
> >   * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
> >     - shard-lnl:          NOTRUN -> [SKIP][52] ([Intel XE#1124]) +1 other test skip
> >    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-lnl-7/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
> > 
> >   * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
> >     - shard-adlp:         NOTRUN -> [SKIP][53] ([Intel XE#1124]) +4 other tests skip
> >    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-adlp-8/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
> >     - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#1124]) +5 other tests skip
> >    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-bmg-2/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
> > 
> >   * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
> >     - shard-lnl:          NOTRUN -> [SKIP][55] ([Intel XE#2191])
> >    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-lnl-2/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
> >     - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#2314] / [Intel XE#2894])
> >    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
> >     - shard-adlp:         NOTRUN -> [SKIP][57] ([Intel XE#2191])
> >    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-adlp-6/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
> > 
> >   * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
> >     - shard-bmg:          [PASS][58] -> [SKIP][59] ([Intel XE#2314] / [Intel XE#2894])
> >    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-2/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
> >    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
> > 
> >   * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
> >     - shard-dg2-set2:     NOTRUN -> [SKIP][60] ([Intel XE#4208] / [i915#2575]) +27 other tests skip
> >    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-464/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html
> > 
> >   * igt@kms_bw@linear-tiling-3-displays-2160x1440p:
> >     - shard-lnl:          NOTRUN -> [SKIP][61] ([Intel XE#367])
> >    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-lnl-5/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html
> > 
> >   * igt@kms_bw@linear-tiling-4-displays-2160x1440p:
> >     - shard-bmg:          NOTRUN -> [SKIP][62] ([Intel XE#367]) +2 other tests skip
> >    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-bmg-3/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html
> >     - shard-adlp:         NOTRUN -> [SKIP][63] ([Intel XE#367]) +1 other test skip
> >    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-adlp-4/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html
> >     - shard-lnl:          NOTRUN -> [SKIP][64] ([Intel XE#1512])
> >    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-lnl-8/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html
> > 
> >   * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:
> >     - shard-dg2-set2:     NOTRUN -> [SKIP][65] ([Intel XE#455] / [Intel XE#787]) +26 other tests skip
> >    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-466/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html
> > 
> >   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs:
> >     - shard-lnl:          NOTRUN -> [SKIP][66] ([Intel XE#2887]) +4 other tests skip
> >    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-lnl-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs.html
> > 
> >   * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
> >     - shard-adlp:         NOTRUN -> [SKIP][67] ([Intel XE#455] / [Intel XE#787]) +15 other tests skip
> >    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-adlp-4/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
> > 
> >   * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4:
> >     - shard-dg2-set2:     [PASS][68] -> [INCOMPLETE][69] ([Intel XE#3862]) +1 other test incomplete
> >    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html
> >    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html
> > 
> >   * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:
> >     - shard-bmg:          NOTRUN -> [SKIP][70] ([Intel XE#3432])
> >    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html
> > 
> >   * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
> >     - shard-lnl:          NOTRUN -> [SKIP][71] ([Intel XE#3432]) +1 other test skip
> >    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-lnl-5/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html
> > 
> >   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1:
> >     - shard-adlp:         NOTRUN -> [SKIP][72] ([Intel XE#787]) +23 other tests skip
> >    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-adlp-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1.html
> > 
> >   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:
> >     - shard-bmg:          NOTRUN -> [SKIP][73] ([Intel XE#2887]) +5 other tests skip
> >    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-bmg-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html
> > 
> >   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6:
> >     - shard-dg2-set2:     NOTRUN -> [SKIP][74] ([Intel XE#787]) +132 other tests skip
> >    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html
> > 
> >   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4:
> >     - shard-dg2-set2:     [PASS][75] -> [DMESG-WARN][76] ([Intel XE#1727] / [Intel XE#3113])
> >    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4.html
> >    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4.html
> > 
> >   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6:
> >     - shard-dg2-set2:     [PASS][77] -> [INCOMPLETE][78] ([Intel XE#3124])
> >    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6.html
> >    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6.html
> > 
> >   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-4:
> >     - shard-dg2-set2:     [PASS][79] -> [INCOMPLETE][80] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522]) +1 other test incomplete
> >    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-4.html
> >    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-4.html
> > 
> >   * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
> >     - shard-adlp:         NOTRUN -> [SKIP][81] ([Intel XE#2907])
> >    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-adlp-9/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
> > 
> >   * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:
> >     - shard-bmg:          NOTRUN -> [SKIP][82] ([Intel XE#2652] / [Intel XE#787]) +8 other tests skip
> >    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-bmg-6/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html
> > 
> >   * igt@kms_cdclk@mode-transition-all-outputs:
> >     - shard-dg2-set2:     NOTRUN -> [SKIP][83] ([Intel XE#4418])
> >    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-434/igt@kms_cdclk@mode-transition-all-outputs.html
> > 
> >   * igt@kms_cdclk@plane-scaling:
> >     - shard-bmg:          NOTRUN -> [SKIP][84] ([Intel XE#2724])
> >    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-bmg-4/igt@kms_cdclk@plane-scaling.html
> > 
> >   * igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
> >     - shard-dg2-set2:     NOTRUN -> [SKIP][85] ([Intel XE#4416]) +3 other tests skip
> >    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-436/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html
> > 
> >   * igt@kms_chamelium_color@ctm-0-50:
> >     - shard-bmg:          NOTRUN -> [SKIP][86] ([Intel XE#2325]) +2 other tests skip
> >    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-bmg-8/igt@kms_chamelium_color@ctm-0-50.html
> > 
> >   * igt@kms_chamelium_color@ctm-blue-to-red:
> >     - shard-dg2-set2:     NOTRUN -> [SKIP][87] ([Intel XE#306])
> >    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-466/igt@kms_chamelium_color@ctm-blue-to-red.html
> > 
> >   * igt@kms_chamelium_color@degamma:
> >     - shard-adlp:         NOTRUN -> [SKIP][88] ([Intel XE#306]) +1 other test skip
> >    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-adlp-9/igt@kms_chamelium_color@degamma.html
> >     - shard-lnl:          NOTRUN -> [SKIP][89] ([Intel XE#306])
> >    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-lnl-3/igt@kms_chamelium_color@degamma.html
> > 
> >   * igt@kms_chamelium_edid@hdmi-edid-read:
> >     - shard-adlp:         NOTRUN -> [SKIP][90] ([Intel XE#373]) +4 other tests skip
> >    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-adlp-2/igt@kms_chamelium_edid@hdmi-edid-read.html
> > 
> >   * igt@kms_chamelium_hpd@dp-hpd-storm-disable:
> >     - shard-bmg:          NOTRUN -> [SKIP][91] ([Intel XE#2252]) +3 other tests skip
> >    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-bmg-5/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html
> > 
> >   * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
> >     - shard-dg2-set2:     NOTRUN -> [SKIP][92] ([Intel XE#373]) +5 other tests skip
> >    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
> > 
> >   * igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode:
> >     - shard-lnl:          NOTRUN -> [SKIP][93] ([Intel XE#373]) +2 other tests skip
> >    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-lnl-7/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html
> > 
> >   * igt@kms_content_protection@legacy:
> >     - shard-adlp:         NOTRUN -> [SKIP][94] ([Intel XE#455]) +10 other tests skip
> >    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-adlp-8/igt@kms_content_protection@legacy.html
> >     - shard-dg2-set2:     NOTRUN -> [FAIL][95] ([Intel XE#1178]) +1 other test fail
> >    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-466/igt@kms_content_protection@legacy.html
> > 
> >   * igt@kms_content_protection@lic-type-0:
> >     - shard-lnl:          NOTRUN -> [SKIP][96] ([Intel XE#3278])
> >    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-lnl-3/igt@kms_content_protection@lic-type-0.html
> > 
> >   * igt@kms_content_protection@lic-type-0@pipe-a-dp-2:
> >     - shard-bmg:          NOTRUN -> [FAIL][97] ([Intel XE#1178]) +3 other tests fail
> >    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-bmg-2/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html
> > 
> >   * igt@kms_content_protection@uevent:
> >     - shard-dg2-set2:     NOTRUN -> [FAIL][98] ([Intel XE#1188]) +1 other test fail
> >    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-432/igt@kms_content_protection@uevent.html
> > 
> >   * igt@kms_cursor_crc@cursor-offscreen-32x32:
> >     - shard-bmg:          NOTRUN -> [SKIP][99] ([Intel XE#2320]) +3 other tests skip
> >    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-bmg-2/igt@kms_cursor_crc@cursor-offscreen-32x32.html
> >     - shard-lnl:          NOTRUN -> [SKIP][100] ([Intel XE#1424]) +1 other test skip
> >    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-lnl-1/igt@kms_cursor_crc@cursor-offscreen-32x32.html
> > 
> >   * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
> >     - shard-bmg:          [PASS][101] -> [SKIP][102] ([Intel XE#2291]) +4 other tests skip
> >    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-7/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
> >    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-bmg-5/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
> > 
> >   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
> >     - shard-adlp:         NOTRUN -> [SKIP][103] ([Intel XE#323]) +1 other test skip
> >    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-adlp-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
> > 
> >   * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:
> >     - shard-lnl:          NOTRUN -> [SKIP][104] ([Intel XE#309]) +2 other tests skip
> >    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-lnl-5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html
> > 
> >   * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
> >     - shard-bmg:          NOTRUN -> [SKIP][105] ([Intel XE#2291])
> >    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
> > 
> >   * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
> >     - shard-bmg:          [PASS][106] -> [FAIL][107] ([Intel XE#1475])
> >    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
> >    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
> > 
> >   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
> >     - shard-dg2-set2:     NOTRUN -> [SKIP][108] ([Intel XE#323]) +2 other tests skip
> >    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-434/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
> > 
> >   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
> >     - shard-bmg:          NOTRUN -> [SKIP][109] ([Intel XE#2286])
> >    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-bmg-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
> > 
> >   * igt@kms_cursor_legacy@torture-move@pipe-a:
> >     - shard-dg2-set2:     [PASS][110] -> [INCOMPLETE][111] ([Intel XE#3226]) +1 other test incomplete
> >    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-466/igt@kms_cursor_legacy@torture-move@pipe-a.html
> >    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-463/igt@kms_cursor_legacy@torture-move@pipe-a.html
> > 
> >   * igt@kms_dp_aux_dev:
> >     - shard-bmg:          [PASS][112] -> [SKIP][113] ([Intel XE#3009])
> >    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-2/igt@kms_dp_aux_dev.html
> >    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-bmg-6/igt@kms_dp_aux_dev.html
> > 
> >   * igt@kms_dp_link_training@non-uhbr-mst:
> >     - shard-dg2-set2:     NOTRUN -> [SKIP][114] ([Intel XE#4354])
> >    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-463/igt@kms_dp_link_training@non-uhbr-mst.html
> > 
> >   * igt@kms_dp_link_training@uhbr-sst:
> >     - shard-lnl:          NOTRUN -> [SKIP][115] ([Intel XE#4354])
> >    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-lnl-6/igt@kms_dp_link_training@uhbr-sst.html
> > 
> >   * igt@kms_dp_linktrain_fallback@dp-fallback:
> >     - shard-bmg:          [PASS][116] -> [SKIP][117] ([Intel XE#4294])
> >    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-7/igt@kms_dp_linktrain_fallback@dp-fallback.html
> >    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-bmg-6/igt@kms_dp_linktrain_fallback@dp-fallback.html
> > 
> >   * igt@kms_dsc@dsc-with-output-formats:
> >     - shard-bmg:          NOTRUN -> [SKIP][118] ([Intel XE#2244]) +1 other test skip
> >    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-bmg-4/igt@kms_dsc@dsc-with-output-formats.html
> > 
> >   * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:
> >     - shard-lnl:          NOTRUN -> [SKIP][119] ([Intel XE#4422])
> >    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-lnl-5/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html
> > 
> >   * igt@kms_fbcon_fbt@psr-suspend:
> >     - shard-dg2-set2:     NOTRUN -> [SKIP][120] ([Intel XE#776])
> >    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-435/igt@kms_fbcon_fbt@psr-suspend.html
> > 
> >   * igt@kms_feature_discovery@psr1:
> >     - shard-adlp:         NOTRUN -> [SKIP][121] ([Intel XE#1135])
> >    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-adlp-4/igt@kms_feature_discovery@psr1.html
> >     - shard-bmg:          NOTRUN -> [SKIP][122] ([Intel XE#2374])
> >    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-bmg-3/igt@kms_feature_discovery@psr1.html
> > 
> >   * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-dp2-hdmi-a3:
> >     - shard-bmg:          NOTRUN -> [FAIL][123] ([Intel XE#3321]) +1 other test fail
> >    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-dp2-hdmi-a3.html
> > 
> >   * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4:
> >     - shard-dg2-set2:     [PASS][124] -> [FAIL][125] ([Intel XE#301] / [Intel XE#3321])
> >    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4.html
> >    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4.html
> > 
> >   * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
> >     - shard-adlp:         NOTRUN -> [SKIP][126] ([Intel XE#310]) +2 other tests skip
> >    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-adlp-1/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
> > 
> >   * igt@kms_flip@2x-plain-flip-interruptible:
> >     - shard-bmg:          [PASS][127] -> [SKIP][128] ([Intel XE#2316]) +9 other tests skip
> >    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-7/igt@kms_flip@2x-plain-flip-interruptible.html
> >    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-bmg-5/igt@kms_flip@2x-plain-flip-interruptible.html
> > 
> >   * igt@kms_flip@2x-wf_vblank-ts-check:
> >     - shard-bmg:          NOTRUN -> [SKIP][129] ([Intel XE#2316]) +1 other test skip
> >    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-bmg-5/igt@kms_flip@2x-wf_vblank-ts-check.html
> > 
> >   * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4:
> >     - shard-dg2-set2:     [PASS][130] -> [FAIL][131] ([Intel XE#301]) +6 other tests fail
> >    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4.html
> >    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4.html
> > 
> >   * igt@kms_flip@flip-vs-suspend@b-hdmi-a3:
> >     - shard-bmg:          [PASS][132] -> [INCOMPLETE][133] ([Intel XE#2049] / [Intel XE#2597])
> >    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-1/igt@kms_flip@flip-vs-suspend@b-hdmi-a3.html
> >    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-bmg-2/igt@kms_flip@flip-vs-suspend@b-hdmi-a3.html
> > 
> >   * igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a3:
> >     - shard-bmg:          [PASS][134] -> [FAIL][135] ([Intel XE#2882]) +1 other test fail
> >    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-1/igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a3.html
> >    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-bmg-6/igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a3.html
> > 
> >   * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling:
> >     - shard-lnl:          NOTRUN -> [SKIP][136] ([Intel XE#1397] / [Intel XE#1745])
> >    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling.html
> > 
> >   * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-default-mode:
> >     - shard-lnl:          NOTRUN -> [SKIP][137] ([Intel XE#1397])
> >    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-default-mode.html
> > 
> >   * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:
> >     - shard-adlp:         [PASS][138] -> [SKIP][139] ([Intel XE#2351])
> >    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-adlp-6/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html
> >    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-adlp-2/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html
> >     - shard-bmg:          [PASS][140] -> [SKIP][141] ([Intel XE#2231] / [Intel XE#4954])
> >    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html
> >    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html
> > 
> >   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
> >     - shard-bmg:          NOTRUN -> [SKIP][142] ([Intel XE#2293] / [Intel XE#2380]) +3 other tests skip
> >    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
> > 
> >   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:
> >     - shard-lnl:          NOTRUN -> [SKIP][143] ([Intel XE#1401]) +3 other tests skip
> >    [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-lnl-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html
> > 
> >   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
> >     - shard-lnl:          NOTRUN -> [SKIP][144] ([Intel XE#1401] / [Intel XE#1745]) +2 other tests skip
> >    [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
> > 
> >   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
> >     - shard-bmg:          NOTRUN -> [SKIP][145] ([Intel XE#2293]) +4 other tests skip
> >    [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html
> > 
> >   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:
> >     - shard-dg2-set2:     NOTRUN -> [SKIP][146] ([Intel XE#455]) +2 other tests skip
> >    [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html
> > 
> >   * igt@kms_force_connector_basic@prune-stale-modes:
> >     - shard-lnl:          NOTRUN -> [SKIP][147] ([Intel XE#352])
> >    [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-lnl-3/igt@kms_force_connector_basic@prune-stale-modes.html
> > 
> >   * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render:
> >     - shard-dg2-set2:     NOTRUN -> [SKIP][148] ([Intel XE#651]) +12 other tests skip
> >    [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html
> > 
> >   * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-plflip-blt:
> >     - shard-lnl:          NOTRUN -> [SKIP][149] ([Intel XE#656]) +18 other tests skip
> >    [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-lnl-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-plflip-blt.html
> > 
> >   * igt@kms_frontbuffer_tracking@drrs-slowdraw:
> >     - shard-lnl:          NOTRUN -> [SKIP][150] ([Intel XE#651]) +5 other tests skip
> >    [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-slowdraw.html
> > 
> >   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:
> >     - shard-bmg:          NOTRUN -> [SKIP][151] ([Intel XE#4141]) +8 other tests skip
> >    [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html
> > 
> >   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move:
> >     - shard-dg2-set2:     [PASS][152] -> [SKIP][153] ([Intel XE#783]) +3 other tests skip
> >    [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move.html
> >    [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move.html
> > 
> >   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:
> >     - shard-dg2-set2:     [PASS][154] -> [SKIP][155] ([Intel XE#2351] / [Intel XE#4208]) +15 other tests skip
> >    [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html
> >    [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html
> > 
> >   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
> >     - shard-bmg:          NOTRUN -> [SKIP][156] ([Intel XE#2312]) +9 other tests skip
> >    [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html
> > 
> >   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-blt:
> >     - shard-adlp:         NOTRUN -> [SKIP][157] ([Intel XE#651]) +7 other tests skip
> >    [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-adlp-9/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-blt.html
> > 
> >   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-fullscreen:
> >     - shard-bmg:          NOTRUN -> [SKIP][158] ([Intel XE#2311]) +12 other tests skip
> >    [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-fullscreen.html
> > 
> >   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff:
> >     - shard-bmg:          NOTRUN -> [SKIP][159] ([Intel XE#2313]) +12 other tests skip
> >    [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff.html
> > 
> >   * igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw:
> >     - shard-adlp:         NOTRUN -> [SKIP][160] ([Intel XE#656]) +19 other tests skip
> >    [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-adlp-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html
> > 
> >   * igt@kms_frontbuffer_tracking@plane-fbc-rte:
> >     - shard-bmg:          NOTRUN -> [SKIP][161] ([Intel XE#2350])
> >    [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-bmg-2/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
> > 
> >   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:
> >     - shard-adlp:         NOTRUN -> [SKIP][162] ([Intel XE#653]) +6 other tests skip
> >    [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html
> > 
> >   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
> >     - shard-dg2-set2:     NOTRUN -> [SKIP][163] ([Intel XE#653]) +6 other tests skip
> >    [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
> > 
> >   * igt@kms_hdr@invalid-metadata-sizes:
> >     - shard-bmg:          [PASS][164] -> [SKIP][165] ([Intel XE#1503]) +1 other test skip
> >    [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-2/igt@kms_hdr@invalid-metadata-sizes.html
> >    [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-bmg-6/igt@kms_hdr@invalid-metadata-sizes.html
> > 
> >   * igt@kms_joiner@basic-force-ultra-joiner:
> >     - shard-adlp:         NOTRUN -> [SKIP][166] ([Intel XE#2925])
> >    [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-adlp-3/igt@kms_joiner@basic-force-ultra-joiner.html
> >     - shard-bmg:          NOTRUN -> [SKIP][167] ([Intel XE#2934])
> >    [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-bmg-4/igt@kms_joiner@basic-force-ultra-joiner.html
> >     - shard-dg2-set2:     NOTRUN -> [SKIP][168] ([Intel XE#2925])
> >    [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-436/igt@kms_joiner@basic-force-ultra-joiner.html
> >     - shard-lnl:          NOTRUN -> [SKIP][169] ([Intel XE#2934])
> >    [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-lnl-4/igt@kms_joiner@basic-force-ultra-joiner.html
> > 
> >   * igt@kms_joiner@invalid-modeset-big-joiner:
> >     - shard-adlp:         NOTRUN -> [SKIP][170] ([Intel XE#346])
> >    [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-adlp-8/igt@kms_joiner@invalid-modeset-big-joiner.html
> > 
> >   * igt@kms_joiner@invalid-modeset-ultra-joiner:
> >     - shard-bmg:          NOTRUN -> [SKIP][171] ([Intel XE#2927])
> >    [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-bmg-6/igt@kms_joiner@invalid-modeset-ultra-joiner.html
> > 
> >   * igt@kms_plane_lowres@tiling-none@pipe-b-edp-1:
> >     - shard-lnl:          NOTRUN -> [SKIP][172] ([Intel XE#599]) +7 other tests skip
> >    [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-lnl-4/igt@kms_plane_lowres@tiling-none@pipe-b-edp-1.html
> > 
> >   * igt@kms_plane_multiple@2x-tiling-none:
> >     - shard-bmg:          [PASS][173] -> [SKIP][174] ([Intel XE#4596])
> >    [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-7/igt@kms_plane_multiple@2x-tiling-none.html
> >    [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-none.html
> > 
> >   * igt@kms_plane_scaling@2x-scaler-multi-pipe:
> >     - shard-bmg:          [PASS][175] -> [SKIP][176] ([Intel XE#2571])
> >    [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-7/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
> >    [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-bmg-5/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
> > 
> >   * igt@kms_plane_scaling@intel-max-src-size:
> >     - shard-lnl:          NOTRUN -> [SKIP][177] ([Intel XE#3307])
> >    [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-lnl-6/igt@kms_plane_scaling@intel-max-src-size.html
> > 
> >   * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:
> >     - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][178] ([Intel XE#4212])
> >    [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-434/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html
> > 
> >   * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
> >     - shard-dg2-set2:     NOTRUN -> [ABORT][179] ([Intel XE#4760]) +1 other test abort
> >    [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-434/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
> > 
> >   * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d:
> >     - shard-dg2-set2:     NOTRUN -> [SKIP][180] ([Intel XE#2763] / [Intel XE#455]) +3 other tests skip
> >    [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d.html
> > 
> >   * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
> >     - shard-adlp:         NOTRUN -> [SKIP][181] ([Intel XE#2763] / [Intel XE#455]) +1 other test skip
> >    [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-adlp-9/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
> > 
> >   * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c:
> >     - shard-adlp:         NOTRUN -> [SKIP][182] ([Intel XE#2763]) +2 other tests skip
> >    [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-adlp-9/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c.html
> > 
> >   * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b:
> >     - shard-bmg:          NOTRUN -> [SKIP][183] ([Intel XE#2763]) +19 other tests skip
> >    [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-bmg-7/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b.html
> >     - shard-dg2-set2:     NOTRUN -> [SKIP][184] ([Intel XE#2763]) +5 other tests skip
> >    [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-435/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b.html
> > 
> >   * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-a:
> >     - shard-lnl:          NOTRUN -> [SKIP][185] ([Intel XE#2763]) +7 other tests skip
> >    [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-lnl-8/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-a.html
> > 
> >   * igt@kms_pm_dc@dc6-psr:
> >     - shard-adlp:         NOTRUN -> [SKIP][186] ([Intel XE#1129])
> >    [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-adlp-6/igt@kms_pm_dc@dc6-psr.html
> > 
> >   * igt@kms_pm_rpm@basic-pci-d3-state:
> >     - shard-dg2-set2:     [PASS][187] -> [FAIL][188] ([Intel XE#4741])
> >    [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-464/igt@kms_pm_rpm@basic-pci-d3-state.html
> >    [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-435/igt@kms_pm_rpm@basic-pci-d3-state.html
> > 
> >   * igt@kms_pm_rpm@dpms-lpsp:
> >     - shard-bmg:          NOTRUN -> [SKIP][189] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836])
> >    [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-bmg-2/igt@kms_pm_rpm@dpms-lpsp.html
> > 
> >   * igt@kms_properties@get_properties-sanity-atomic:
> >     - shard-adlp:         NOTRUN -> [FAIL][190] ([Intel XE#5017])
> >    [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-adlp-1/igt@kms_properties@get_properties-sanity-atomic.html
> > 
> >   * igt@kms_properties@get_properties-sanity-non-atomic:
> >     - shard-dg2-set2:     NOTRUN -> [FAIL][191] ([Intel XE#5017]) +1 other test fail
> >    [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-463/igt@kms_properties@get_properties-sanity-non-atomic.html
> > 
> >   * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:
> >     - shard-lnl:          NOTRUN -> [SKIP][192] ([Intel XE#2893] / [Intel XE#4608])
> >    [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-lnl-3/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html
> > 
> >   * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-a-edp-1:
> >     - shard-lnl:          NOTRUN -> [SKIP][193] ([Intel XE#4608]) +2 other tests skip
> >    [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-lnl-3/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-a-edp-1.html
> > 
> >   * igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:
> >     - shard-adlp:         NOTRUN -> [SKIP][194] ([Intel XE#1489]) +1 other test skip
> >    [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-adlp-1/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html
> >     - shard-bmg:          NOTRUN -> [SKIP][195] ([Intel XE#1489]) +4 other tests skip
> >    [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-bmg-6/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html
> >     - shard-lnl:          NOTRUN -> [SKIP][196] ([Intel XE#2893]) +2 other tests skip
> >    [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-lnl-7/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html
> > 
> >   * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
> >     - shard-dg2-set2:     NOTRUN -> [SKIP][197] ([Intel XE#1489]) +2 other tests skip
> >    [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-435/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html
> > 
> >   * igt@kms_psr2_su@page_flip-nv12:
> >     - shard-dg2-set2:     NOTRUN -> [SKIP][198] ([Intel XE#1122])
> >    [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-432/igt@kms_psr2_su@page_flip-nv12.html
> > 
> >   * igt@kms_psr@fbc-psr-sprite-plane-onoff:
> >     - shard-dg2-set2:     NOTRUN -> [SKIP][199] ([Intel XE#2351] / [Intel XE#4208]) +5 other tests skip
> >    [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-464/igt@kms_psr@fbc-psr-sprite-plane-onoff.html
> > 
> >   * igt@kms_psr@fbc-psr-sprite-render:
> >     - shard-lnl:          [PASS][200] -> [SKIP][201] ([Intel XE#2351] / [Intel XE#4996]) +3 other tests skip
> >    [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-lnl-5/igt@kms_psr@fbc-psr-sprite-render.html
> >    [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-lnl-1/igt@kms_psr@fbc-psr-sprite-render.html
> > 
> >   * igt@kms_psr@fbc-psr2-cursor-render:
> >     - shard-lnl:          NOTRUN -> [SKIP][202] ([Intel XE#1406])
> >    [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-lnl-3/igt@kms_psr@fbc-psr2-cursor-render.html
> > 
> >   * igt@kms_psr@fbc-psr2-cursor-render@edp-1:
> >     - shard-lnl:          NOTRUN -> [SKIP][203] ([Intel XE#4609])
> >    [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-lnl-3/igt@kms_psr@fbc-psr2-cursor-render@edp-1.html
> > 
> >   * igt@kms_psr@pr-sprite-blt:
> >     - shard-dg2-set2:     NOTRUN -> [SKIP][204] ([Intel XE#2850] / [Intel XE#929]) +9 other tests skip
> >    [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-466/igt@kms_psr@pr-sprite-blt.html
> > 
> >   * igt@kms_psr@psr2-sprite-blt:
> >     - shard-bmg:          NOTRUN -> [SKIP][205] ([Intel XE#2234] / [Intel XE#2850]) +7 other tests skip
> >    [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-bmg-4/igt@kms_psr@psr2-sprite-blt.html
> > 
> >   * igt@kms_psr@psr2-sprite-plane-move:
> >     - shard-lnl:          [PASS][206] -> [SKIP][207] ([Intel XE#2351])
> >    [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-lnl-3/igt@kms_psr@psr2-sprite-plane-move.html
> >    [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-lnl-1/igt@kms_psr@psr2-sprite-plane-move.html
> > 
> >   * igt@kms_psr@psr2-suspend:
> >     - shard-adlp:         NOTRUN -> [SKIP][208] ([Intel XE#2850] / [Intel XE#929]) +7 other tests skip
> >    [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-adlp-1/igt@kms_psr@psr2-suspend.html
> > 
> >   * igt@kms_rotation_crc@multiplane-rotation-cropping-bottom:
> >     - shard-adlp:         NOTRUN -> [FAIL][209] ([Intel XE#1874])
> >    [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-adlp-4/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html
> > 
> >   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
> >     - shard-adlp:         [PASS][210] -> [SKIP][211] ([Intel XE#4950] / [Intel XE#4996])
> >    [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-adlp-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
> >    [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-adlp-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
> > 
> >   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
> >     - shard-bmg:          NOTRUN -> [SKIP][212] ([Intel XE#3414] / [Intel XE#3904]) +1 other test skip
> >    [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-bmg-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
> >     - shard-dg2-set2:     NOTRUN -> [SKIP][213] ([Intel XE#3414])
> >    [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-436/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
> >     - shard-lnl:          NOTRUN -> [SKIP][214] ([Intel XE#3414] / [Intel XE#3904])
> >    [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-lnl-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
> > 
> >   * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
> >     - shard-adlp:         NOTRUN -> [SKIP][215] ([Intel XE#3414]) +1 other test skip
> >    [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-adlp-9/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
> > 
> >   * igt@kms_scaling_modes@scaling-mode-full:
> >     - shard-bmg:          NOTRUN -> [SKIP][216] ([Intel XE#2413])
> >    [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-bmg-6/igt@kms_scaling_modes@scaling-mode-full.html
> > 
> >   * igt@kms_universal_plane@universal-plane-sanity:
> >     - shard-dg2-set2:     [PASS][217] -> [SKIP][218] ([Intel XE#829]) +1 other test skip
> >    [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-435/igt@kms_universal_plane@universal-plane-sanity.html
> >    [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-432/igt@kms_universal_plane@universal-plane-sanity.html
> > 
> >   * igt@kms_vrr@flipline:
> >     - shard-bmg:          NOTRUN -> [SKIP][219] ([Intel XE#1499])
> >    [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-bmg-5/igt@kms_vrr@flipline.html
> > 
> >   * igt@kms_vrr@negative-basic:
> >     - shard-bmg:          [PASS][220] -> [SKIP][221] ([Intel XE#1499])
> >    [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-8/igt@kms_vrr@negative-basic.html
> >    [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-bmg-4/igt@kms_vrr@negative-basic.html
> > 
> >   * igt@xe_ccs@ctrl-surf-copy-new-ctx:
> >     - shard-adlp:         NOTRUN -> [SKIP][222] ([Intel XE#455] / [Intel XE#488])
> >    [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-adlp-6/igt@xe_ccs@ctrl-surf-copy-new-ctx.html
> > 
> >   * igt@xe_copy_basic@mem-set-linear-0x3fff:
> >     - shard-adlp:         NOTRUN -> [SKIP][223] ([Intel XE#1126]) +1 other test skip
> >    [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-adlp-9/igt@xe_copy_basic@mem-set-linear-0x3fff.html
> > 
> >   * igt@xe_copy_basic@mem-set-linear-0xfd:
> >     - shard-dg2-set2:     NOTRUN -> [SKIP][224] ([Intel XE#1126]) +1 other test skip
> >    [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0xfd.html
> > 
> >   * igt@xe_eu_stall@blocking-read:
> >     - shard-adlp:         NOTRUN -> [SKIP][225] ([Intel XE#4497])
> >    [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-adlp-2/igt@xe_eu_stall@blocking-read.html
> >     - shard-dg2-set2:     NOTRUN -> [SKIP][226] ([Intel XE#4497])
> >    [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-466/igt@xe_eu_stall@blocking-read.html
> > 
> >   * igt@xe_eudebug@basic-read-event:
> >     - shard-lnl:          NOTRUN -> [SKIP][227] ([Intel XE#4837]) +4 other tests skip
> >    [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-lnl-5/igt@xe_eudebug@basic-read-event.html
> > 
> >   * igt@xe_eudebug@basic-vm-bind-metadata-discovery:
> >     - shard-bmg:          NOTRUN -> [SKIP][228] ([Intel XE#4837]) +10 other tests skip
> >    [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-bmg-3/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html
> > 
> >   * igt@xe_eudebug@read-metadata:
> >     - shard-adlp:         NOTRUN -> [SKIP][229] ([Intel XE#4837]) +5 other tests skip
> >    [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-adlp-6/igt@xe_eudebug@read-metadata.html
> > 
> >   * igt@xe_eudebug_online@resume-dss:
> >     - shard-dg2-set2:     NOTRUN -> [SKIP][230] ([Intel XE#4837]) +3 other tests skip
> >    [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-435/igt@xe_eudebug_online@resume-dss.html
> > 
> >   * igt@xe_eudebug_sriov@deny-sriov:
> >     - shard-bmg:          NOTRUN -> [SKIP][231] ([Intel XE#4518])
> >    [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-bmg-1/igt@xe_eudebug_sriov@deny-sriov.html
> >     - shard-dg2-set2:     NOTRUN -> [SKIP][232] ([Intel XE#4518])
> >    [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-432/igt@xe_eudebug_sriov@deny-sriov.html
> > 
> >   * igt@xe_evict@evict-beng-large-external-cm:
> >     - shard-adlp:         NOTRUN -> [SKIP][233] ([Intel XE#261] / [Intel XE#688]) +1 other test skip
> >    [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-adlp-1/igt@xe_evict@evict-beng-large-external-cm.html
> > 
> >   * igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen:
> >     - shard-lnl:          NOTRUN -> [SKIP][234] ([Intel XE#688]) +3 other tests skip
> >    [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-lnl-5/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen.html
> > 
> >   * igt@xe_exec_balancer@once-parallel-rebind:
> >     - shard-dg2-set2:     NOTRUN -> [SKIP][235] ([Intel XE#4208]) +98 other tests skip
> >    [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-464/igt@xe_exec_balancer@once-parallel-rebind.html
> > 
> >   * igt@xe_exec_balancer@twice-virtual-basic:
> >     - shard-dg2-set2:     [PASS][236] -> [SKIP][237] ([Intel XE#4208]) +286 other tests skip
> >    [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-464/igt@xe_exec_balancer@twice-virtual-basic.html
> >    [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-432/igt@xe_exec_balancer@twice-virtual-basic.html
> > 
> >   * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:
> >     - shard-bmg:          NOTRUN -> [SKIP][238] ([Intel XE#2322]) +2 other tests skip
> >    [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html
> >     - shard-dg2-set2:     [PASS][239] -> [SKIP][240] ([Intel XE#1392]) +2 other tests skip
> >    [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-434/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html
> >    [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html
> > 
> >   * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr:
> >     - shard-dg2-set2:     NOTRUN -> [SKIP][241] ([Intel XE#1392])
> >    [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr.html
> > 
> >   * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind:
> >     - shard-adlp:         NOTRUN -> [SKIP][242] ([Intel XE#1392]) +2 other tests skip
> >    [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-adlp-3/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind.html
> > 
> >   * igt@xe_exec_basic@multigpu-no-exec-rebind:
> >     - shard-lnl:          NOTRUN -> [SKIP][243] ([Intel XE#1392]) +2 other tests skip
> >    [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-lnl-3/igt@xe_exec_basic@multigpu-no-exec-rebind.html
> > 
> >   * igt@xe_exec_compute_mode@once-bindexecqueue-userptr-rebind:
> >     - shard-bmg:          [PASS][244] -> [SKIP][245] ([Intel XE#4954] / [Intel XE#4996]) +1 other test skip
> >    [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-1/igt@xe_exec_compute_mode@once-bindexecqueue-userptr-rebind.html
> >    [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-bmg-5/igt@xe_exec_compute_mode@once-bindexecqueue-userptr-rebind.html
> > 
> >   * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-prefetch:
> >     - shard-adlp:         NOTRUN -> [SKIP][246] ([Intel XE#4996]) +2 other tests skip
> >    [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-adlp-2/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-prefetch.html
> > 
> >   * igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-imm:
> >     - shard-dg2-set2:     NOTRUN -> [SKIP][247] ([Intel XE#288]) +8 other tests skip
> >    [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-435/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-imm.html
> > 
> >   * igt@xe_exec_fault_mode@once-userptr-invalidate-race-imm:
> >     - shard-adlp:         NOTRUN -> [SKIP][248] ([Intel XE#288]) +7 other tests skip
> >    [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-adlp-8/igt@xe_exec_fault_mode@once-userptr-invalidate-race-imm.html
> > 
> >   * igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
> >     - shard-adlp:         NOTRUN -> [SKIP][249] ([Intel XE#2360])
> >    [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-adlp-2/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html
> > 
> >   * igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset:
> >     - shard-bmg:          NOTRUN -> [SKIP][250] ([Intel XE#4943]) +13 other tests skip
> >    [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-bmg-2/igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset.html
> > 
> >   * igt@xe_exec_system_allocator@process-many-mmap-free-race-nomemset:
> >     - shard-dg2-set2:     NOTRUN -> [SKIP][251] ([Intel XE#4915]) +70 other tests skip
> >    [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-466/igt@xe_exec_system_allocator@process-many-mmap-free-race-nomemset.html
> > 
> >   * igt@xe_exec_system_allocator@process-many-stride-mmap-shared-nomemset:
> >     - shard-bmg:          NOTRUN -> [SKIP][252] ([Intel XE#4996])
> >    [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-bmg-5/igt@xe_exec_system_allocator@process-many-stride-mmap-shared-nomemset.html
> > 
> >   * igt@xe_exec_system_allocator@processes-evict-malloc:
> >     - shard-adlp:         NOTRUN -> [SKIP][253] ([Intel XE#4915]) +84 other tests skip
> >    [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-adlp-4/igt@xe_exec_system_allocator@processes-evict-malloc.html
> > 
> >   * igt@xe_exec_system_allocator@threads-many-large-new-nomemset:
> >     - shard-bmg:          [PASS][254] -> [SKIP][255] ([Intel XE#4996]) +5 other tests skip
> >    [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-2/igt@xe_exec_system_allocator@threads-many-large-new-nomemset.html
> >    [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-bmg-5/igt@xe_exec_system_allocator@threads-many-large-new-nomemset.html
> > 
> >   * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free-huge-nomemset:
> >     - shard-lnl:          NOTRUN -> [SKIP][256] ([Intel XE#4943]) +9 other tests skip
> >    [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-lnl-2/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free-huge-nomemset.html
> > 
> >   * igt@xe_exec_threads@threads-bal-shared-vm-userptr-invalidate:
> >     - shard-bmg:          [PASS][257] -> [SKIP][258] ([Intel XE#4954]) +11 other tests skip
> >    [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-8/igt@xe_exec_threads@threads-bal-shared-vm-userptr-invalidate.html
> >    [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-bmg-5/igt@xe_exec_threads@threads-bal-shared-vm-userptr-invalidate.html
> >     - shard-adlp:         [PASS][259] -> [SKIP][260] ([Intel XE#4996]) +13 other tests skip
> >    [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-adlp-1/igt@xe_exec_threads@threads-bal-shared-vm-userptr-invalidate.html
> >    [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-adlp-2/igt@xe_exec_threads@threads-bal-shared-vm-userptr-invalidate.html
> > 
> >   * igt@xe_exec_threads@threads-hang-rebind-err:
> >     - shard-adlp:         [PASS][261] -> [SKIP][262] ([Intel XE#4945] / [Intel XE#4996])
> >    [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-adlp-6/igt@xe_exec_threads@threads-hang-rebind-err.html
> >    [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-adlp-2/igt@xe_exec_threads@threads-hang-rebind-err.html
> > 
> >   * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init:
> >     - shard-adlp:         [PASS][263] -> [DMESG-WARN][264] ([Intel XE#4792])
> >    [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-adlp-3/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init.html
> >    [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-adlp-9/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init.html
> > 
> >   * igt@xe_media_fill@media-fill:
> >     - shard-bmg:          NOTRUN -> [SKIP][265] ([Intel XE#2459] / [Intel XE#2596])
> >    [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-bmg-4/igt@xe_media_fill@media-fill.html
> > 
> >   * igt@xe_mmap@pci-membarrier-bad-object:
> >     - shard-adlp:         NOTRUN -> [SKIP][266] ([Intel XE#4045])
> >    [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-adlp-9/igt@xe_mmap@pci-membarrier-bad-object.html
> >     - shard-lnl:          NOTRUN -> [SKIP][267] ([Intel XE#4045])
> >    [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-lnl-3/igt@xe_mmap@pci-membarrier-bad-object.html
> > 
> >   * igt@xe_module_load@many-reload:
> >     - shard-dg2-set2:     [PASS][268] -> [FAIL][269] ([Intel XE#4208])
> >    [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-466/igt@xe_module_load@many-reload.html
> >    [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-464/igt@xe_module_load@many-reload.html
> > 
> >   * igt@xe_module_load@reload:
> >     - shard-dg2-set2:     NOTRUN -> [FAIL][270] ([Intel XE#4208]) +1 other test fail
> >    [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-464/igt@xe_module_load@reload.html
> > 
> >   * igt@xe_oa@buffer-fill:
> >     - shard-adlp:         NOTRUN -> [SKIP][271] ([Intel XE#2541] / [Intel XE#3573])
> >    [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-adlp-1/igt@xe_oa@buffer-fill.html
> > 
> >   * igt@xe_oa@closed-fd-and-unmapped-access:
> >     - shard-dg2-set2:     NOTRUN -> [SKIP][272] ([Intel XE#2541] / [Intel XE#3573])
> >    [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-436/igt@xe_oa@closed-fd-and-unmapped-access.html
> > 
> >   * igt@xe_peer2peer@write:
> >     - shard-bmg:          NOTRUN -> [SKIP][273] ([Intel XE#2427])
> >    [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-bmg-3/igt@xe_peer2peer@write.html
> >     - shard-adlp:         NOTRUN -> [SKIP][274] ([Intel XE#1061])
> >    [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-adlp-4/igt@xe_peer2peer@write.html
> >     - shard-lnl:          NOTRUN -> [SKIP][275] ([Intel XE#1061])
> >    [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-lnl-8/igt@xe_peer2peer@write.html
> > 
> >   * igt@xe_pm@d3cold-multiple-execs:
> >     - shard-bmg:          NOTRUN -> [SKIP][276] ([Intel XE#2284])
> >    [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-bmg-8/igt@xe_pm@d3cold-multiple-execs.html
> > 
> >   * igt@xe_pm@s4-vm-bind-userptr:
> >     - shard-lnl:          [PASS][277] -> [ABORT][278] ([Intel XE#1794]) +1 other test abort
> >    [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-lnl-5/igt@xe_pm@s4-vm-bind-userptr.html
> >    [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-lnl-2/igt@xe_pm@s4-vm-bind-userptr.html
> > 
> >   * igt@xe_pmu@fn-engine-activity-load:
> >     - shard-bmg:          NOTRUN -> [SKIP][279] ([Intel XE#4650])
> >    [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-bmg-8/igt@xe_pmu@fn-engine-activity-load.html
> > 
> >   * igt@xe_pmu@gt-frequency:
> >     - shard-dg2-set2:     NOTRUN -> [FAIL][280] ([Intel XE#4819]) +1 other test fail
> >    [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-435/igt@xe_pmu@gt-frequency.html
> > 
> >   * igt@xe_pxp@pxp-optout:
> >     - shard-adlp:         NOTRUN -> [SKIP][281] ([Intel XE#4733])
> >    [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-adlp-8/igt@xe_pxp@pxp-optout.html
> >     - shard-bmg:          NOTRUN -> [SKIP][282] ([Intel XE#4733])
> >    [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-bmg-2/igt@xe_pxp@pxp-optout.html
> > 
> >   * igt@xe_query@multigpu-query-cs-cycles:
> >     - shard-dg2-set2:     NOTRUN -> [SKIP][283] ([Intel XE#944]) +2 other tests skip
> >    [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-435/igt@xe_query@multigpu-query-cs-cycles.html
> > 
> >   * igt@xe_query@multigpu-query-invalid-extension:
> >     - shard-adlp:         NOTRUN -> [SKIP][284] ([Intel XE#944]) +2 other tests skip
> >    [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-adlp-9/igt@xe_query@multigpu-query-invalid-extension.html
> >     - shard-lnl:          NOTRUN -> [SKIP][285] ([Intel XE#944])
> >    [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-lnl-8/igt@xe_query@multigpu-query-invalid-extension.html
> > 
> >   * igt@xe_query@multigpu-query-topology-l3-bank-mask:
> >     - shard-bmg:          NOTRUN -> [SKIP][286] ([Intel XE#944])
> >    [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-bmg-5/igt@xe_query@multigpu-query-topology-l3-bank-mask.html
> > 
> >   * igt@xe_spin_batch@spin-basic:
> >     - shard-lnl:          [PASS][287] -> [SKIP][288] ([Intel XE#4996]) +19 other tests skip
> >    [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-lnl-4/igt@xe_spin_batch@spin-basic.html
> >    [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-lnl-1/igt@xe_spin_batch@spin-basic.html
> > 
> >   * igt@xe_sriov_auto_provisioning@exclusive-ranges:
> >     - shard-dg2-set2:     NOTRUN -> [SKIP][289] ([Intel XE#4130]) +1 other test skip
> >    [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-466/igt@xe_sriov_auto_provisioning@exclusive-ranges.html
> >     - shard-lnl:          NOTRUN -> [SKIP][290] ([Intel XE#4130])
> >    [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-lnl-1/igt@xe_sriov_auto_provisioning@exclusive-ranges.html
> > 
> >   * igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs:
> >     - shard-bmg:          NOTRUN -> [SKIP][291] ([Intel XE#4130]) +1 other test skip
> >    [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-bmg-3/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs.html
> > 
> >   * igt@xe_sriov_scheduling@equal-throughput:
> >     - shard-lnl:          NOTRUN -> [SKIP][292] ([Intel XE#4351])
> >    [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-lnl-7/igt@xe_sriov_scheduling@equal-throughput.html
> > 
> >   * igt@xe_vm@bind-array-enobufs:
> >     - shard-dg2-set2:     [PASS][293] -> [FAIL][294] ([Intel XE#4971])
> >    [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-463/igt@xe_vm@bind-array-enobufs.html
> >    [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-432/igt@xe_vm@bind-array-enobufs.html
> > 
> >   
> > #### Possible fixes ####
> > 
> >   * {igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1}:
> >     - shard-lnl:          [FAIL][295] ([Intel XE#911]) -> [PASS][296] +7 other tests pass
> >    [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-lnl-7/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html
> >    [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-lnl-6/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html
> > 
> >   * igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1:
> >     - shard-adlp:         [FAIL][297] ([Intel XE#3884]) -> [PASS][298]
> >    [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-adlp-1/igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1.html
> >    [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-adlp-2/igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1.html
> > 
> >   * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
> >     - shard-bmg:          [SKIP][299] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][300]
> >    [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
> >    [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-bmg-7/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
> > 
> >   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
> >     - shard-dg2-set2:     [INCOMPLETE][301] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4345]) -> [PASS][302]
> >    [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
> >    [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
> > 
> >   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4:
> >     - shard-dg2-set2:     [INCOMPLETE][303] ([Intel XE#3124]) -> [PASS][304]
> >    [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4.html
> >    [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4.html
> > 
> >   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6:
> >     - shard-dg2-set2:     [DMESG-WARN][305] ([Intel XE#1727] / [Intel XE#3113]) -> [PASS][306]
> >    [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html
> >    [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html
> > 
> >   * igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:
> >     - shard-adlp:         [DMESG-WARN][307] ([Intel XE#4173]) -> [PASS][308] +1 other test pass
> >    [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-adlp-1/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html
> >    [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-adlp-1/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html
> > 
> >   * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
> >     - shard-bmg:          [SKIP][309] ([Intel XE#2291]) -> [PASS][310] +3 other tests pass
> >    [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
> >    [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-bmg-8/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
> > 
> >   * igt@kms_cursor_legacy@flip-vs-cursor-toggle:
> >     - shard-bmg:          [SKIP][311] ([Intel XE#4996]) -> [PASS][312] +6 other tests pass
> >    [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html
> >    [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html
> >     - shard-dg2-set2:     [SKIP][313] ([Intel XE#4208] / [i915#2575]) -> [PASS][314] +2 other tests pass
> >    [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-464/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html
> >    [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-436/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html
> > 
> >   * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
> >     - shard-bmg:          [SKIP][315] ([Intel XE#1340]) -> [PASS][316]
> >    [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
> >    [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-bmg-2/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
> > 
> >   * igt@kms_dp_link_training@non-uhbr-sst:
> >     - shard-bmg:          [SKIP][317] ([Intel XE#4354]) -> [PASS][318]
> >    [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-4/igt@kms_dp_link_training@non-uhbr-sst.html
> >    [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-bmg-7/igt@kms_dp_link_training@non-uhbr-sst.html
> > 
> >   * igt@kms_fbcon_fbt@psr-suspend:
> >     - shard-lnl:          [FAIL][319] ([Intel XE#4164]) -> [PASS][320]
> >    [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-lnl-7/igt@kms_fbcon_fbt@psr-suspend.html
> >    [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-lnl-6/igt@kms_fbcon_fbt@psr-suspend.html
> > 
> >   * igt@kms_feature_discovery@display-2x:
> >     - shard-bmg:          [SKIP][321] ([Intel XE#2373]) -> [PASS][322]
> >    [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-5/igt@kms_feature_discovery@display-2x.html
> >    [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-bmg-7/igt@kms_feature_discovery@display-2x.html
> > 
> >   * igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:
> >     - shard-bmg:          [SKIP][323] ([Intel XE#2316]) -> [PASS][324] +13 other tests pass
> >    [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html
> >    [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-bmg-7/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html
> > 
> >   * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:
> >     - shard-dg2-set2:     [FAIL][325] ([Intel XE#301]) -> [PASS][326]
> >    [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html
> >    [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html
> > 
> >   * igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1:
> >     - shard-lnl:          [FAIL][327] ([Intel XE#886]) -> [PASS][328] +1 other test pass
> >    [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-lnl-5/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html
> >    [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-lnl-1/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html
> > 
> >   * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2:
> >     - shard-bmg:          [FAIL][329] ([Intel XE#3321]) -> [PASS][330] +2 other tests pass
> >    [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2.html
> >    [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2.html
> > 
> >   * igt@kms_flip@flip-vs-suspend-interruptible:
> >     - shard-bmg:          [INCOMPLETE][331] ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][332] +1 other test pass
> >    [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-3/igt@kms_flip@flip-vs-suspend-interruptible.html
> >    [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-bmg-8/igt@kms_flip@flip-vs-suspend-interruptible.html
> > 
> >   * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:
> >     - shard-adlp:         [DMESG-FAIL][333] ([Intel XE#4543]) -> [PASS][334] +10 other tests pass
> >    [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-adlp-2/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html
> >    [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-adlp-1/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html
> > 
> >   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
> >     - shard-adlp:         [DMESG-FAIL][335] ([Intel XE#4543] / [Intel XE#4921]) -> [PASS][336] +1 other test pass
> >    [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-adlp-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
> >    [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-adlp-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
> > 
> >   * igt@kms_hdr@static-toggle:
> >     - shard-bmg:          [SKIP][337] ([Intel XE#1503]) -> [PASS][338]
> >    [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-6/igt@kms_hdr@static-toggle.html
> >    [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-bmg-2/igt@kms_hdr@static-toggle.html
> > 
> >   * igt@kms_plane_multiple@2x-tiling-4:
> >     - shard-bmg:          [SKIP][339] ([Intel XE#4596]) -> [PASS][340] +1 other test pass
> >    [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-4.html
> >    [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-bmg-3/igt@kms_plane_multiple@2x-tiling-4.html
> > 
> >   * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format:
> >     - shard-adlp:         [SKIP][341] ([Intel XE#4950]) -> [PASS][342]
> >    [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-adlp-6/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format.html
> >    [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-adlp-9/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format.html
> > 
> >   * igt@kms_pm_dc@dc5-psr:
> >     - shard-lnl:          [FAIL][343] ([Intel XE#718]) -> [PASS][344]
> >    [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-lnl-5/igt@kms_pm_dc@dc5-psr.html
> >    [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-lnl-6/igt@kms_pm_dc@dc5-psr.html
> > 
> >   * igt@kms_setmode@clone-exclusive-crtc:
> >     - shard-bmg:          [SKIP][345] ([Intel XE#4954]) -> [PASS][346] +9 other tests pass
> >    [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-6/igt@kms_setmode@clone-exclusive-crtc.html
> >    [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-bmg-1/igt@kms_setmode@clone-exclusive-crtc.html
> > 
> >   * igt@kms_setmode@invalid-clone-single-crtc-stealing:
> >     - shard-bmg:          [SKIP][347] ([Intel XE#1435]) -> [PASS][348]
> >    [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-4/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
> >    [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-bmg-7/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
> > 
> >   * igt@kms_tiled_display@basic-test-pattern:
> >     - shard-dg2-set2:     [FAIL][349] ([Intel XE#1729]) -> [PASS][350]
> >    [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern.html
> >    [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern.html
> > 
> >   * igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind:
> >     - shard-dg2-set2:     [SKIP][351] ([Intel XE#1392]) -> [PASS][352]
> >    [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind.html
> >    [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-434/igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind.html
> > 
> >   * igt@xe_exec_compute_mode@many-execqueues-userptr-unmap:
> >     - shard-adlp:         [SKIP][353] ([Intel XE#4945]) -> [PASS][354]
> >    [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-adlp-6/igt@xe_exec_compute_mode@many-execqueues-userptr-unmap.html
> >    [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-adlp-2/igt@xe_exec_compute_mode@many-execqueues-userptr-unmap.html
> > 
> >   * igt@xe_exec_fault_mode@many-userptr-invalidate:
> >     - shard-lnl:          [SKIP][355] ([Intel XE#4996]) -> [PASS][356] +16 other tests pass
> >    [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-lnl-8/igt@xe_exec_fault_mode@many-userptr-invalidate.html
> >    [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-lnl-7/igt@xe_exec_fault_mode@many-userptr-invalidate.html
> > 
> >   * igt@xe_exec_reset@spin-signaled:
> >     - shard-adlp:         [SKIP][357] ([Intel XE#4996]) -> [PASS][358] +5 other tests pass
> >    [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-adlp-6/igt@xe_exec_reset@spin-signaled.html
> >    [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-adlp-2/igt@xe_exec_reset@spin-signaled.html
> >     - shard-bmg:          [SKIP][359] ([Intel XE#4954] / [Intel XE#4996]) -> [PASS][360]
> >    [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-6/igt@xe_exec_reset@spin-signaled.html
> >    [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-bmg-3/igt@xe_exec_reset@spin-signaled.html
> >     - shard-dg2-set2:     [SKIP][361] ([Intel XE#4208]) -> [PASS][362] +3 other tests pass
> >    [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-464/igt@xe_exec_reset@spin-signaled.html
> >    [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-466/igt@xe_exec_reset@spin-signaled.html
> > 
> >   * igt@xe_pm@s4-basic:
> >     - shard-lnl:          [ABORT][363] ([Intel XE#1794]) -> [PASS][364] +1 other test pass
> >    [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-lnl-2/igt@xe_pm@s4-basic.html
> >    [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-lnl-8/igt@xe_pm@s4-basic.html
> > 
> >   * igt@xe_pm@s4-vm-bind-unbind-all:
> >     - shard-adlp:         [ABORT][365] ([Intel XE#1794]) -> [PASS][366]
> >    [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-adlp-9/igt@xe_pm@s4-vm-bind-unbind-all.html
> >    [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-adlp-8/igt@xe_pm@s4-vm-bind-unbind-all.html
> > 
> >   
> > #### Warnings ####
> > 
> >   * igt@kms_big_fb@4-tiled-16bpp-rotate-270:
> >     - shard-dg2-set2:     [SKIP][367] ([Intel XE#316]) -> [SKIP][368] ([Intel XE#829])
> >    [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-433/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html
> >    [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-432/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html
> > 
> >   * igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:
> >     - shard-adlp:         [SKIP][369] ([Intel XE#607]) -> [SKIP][370] ([Intel XE#4996])
> >    [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-adlp-1/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html
> >    [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-adlp-2/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html
> > 
> >   * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
> >     - shard-adlp:         [SKIP][371] ([Intel XE#1124]) -> [SKIP][372] ([Intel XE#4996])
> >    [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-adlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
> >    [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-adlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
> >     - shard-lnl:          [SKIP][373] ([Intel XE#3658]) -> [SKIP][374] ([Intel XE#2351] / [Intel XE#4996])
> >    [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
> >    [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
> > 
> >   * igt@kms_big_fb@linear-16bpp-rotate-90:
> >     - shard-dg2-set2:     [SKIP][375] ([Intel XE#316]) -> [SKIP][376] ([Intel XE#2351] / [Intel XE#4208]) +2 other tests skip
> >    [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-432/igt@kms_big_fb@linear-16bpp-rotate-90.html
> >    [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-464/igt@kms_big_fb@linear-16bpp-rotate-90.html
> > 
> >   * igt@kms_big_fb@linear-32bpp-rotate-270:
> >     - shard-dg2-set2:     [SKIP][377] ([Intel XE#316]) -> [SKIP][378] ([Intel XE#4208]) +3 other tests skip
> >    [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-464/igt@kms_big_fb@linear-32bpp-rotate-270.html
> >    [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-464/igt@kms_big_fb@linear-32bpp-rotate-270.html
> > 
> >   * igt@kms_big_fb@y-tiled-64bpp-rotate-180:
> >     - shard-dg2-set2:     [SKIP][379] ([Intel XE#1124]) -> [SKIP][380] ([Intel XE#2351] / [Intel XE#4208]) +5 other tests skip
> >    [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-463/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html
> >    [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-464/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html
> > 
> >   * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
> >     - shard-dg2-set2:     [SKIP][381] ([Intel XE#1124]) -> [SKIP][382] ([Intel XE#4208]) +10 other tests skip
> >    [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-464/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html
> >    [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-464/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html
> > 
> >   * igt@kms_big_fb@yf-tiled-32bpp-rotate-90:
> >     - shard-dg2-set2:     [SKIP][383] ([Intel XE#1124]) -> [SKIP][384] ([Intel XE#829]) +1 other test skip
> >    [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-434/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html
> >    [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-432/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html
> > 
> >   * igt@kms_big_fb@yf-tiled-addfb:
> >     - shard-dg2-set2:     [SKIP][385] ([Intel XE#619]) -> [SKIP][386] ([Intel XE#2351] / [Intel XE#4208])
> >    [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-435/igt@kms_big_fb@yf-tiled-addfb.html
> >    [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-464/igt@kms_big_fb@yf-tiled-addfb.html
> > 
> >   * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
> >     - shard-adlp:         [SKIP][387] ([Intel XE#4996]) -> [SKIP][388] ([Intel XE#2191])
> >    [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-adlp-6/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
> >    [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-adlp-2/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
> > 
> >   * igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:
> >     - shard-dg2-set2:     [SKIP][389] ([Intel XE#2191]) -> [SKIP][390] ([Intel XE#4208] / [i915#2575])
> >    [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-436/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html
> >    [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-464/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html
> > 
> >   * igt@kms_bw@linear-tiling-3-displays-1920x1080p:
> >     - shard-adlp:         [SKIP][391] ([Intel XE#4996]) -> [SKIP][392] ([Intel XE#367])
> >    [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-adlp-6/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html
> >    [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-adlp-2/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html
> >     - shard-bmg:          [SKIP][393] ([Intel XE#4996]) -> [SKIP][394] ([Intel XE#367])
> >    [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-6/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html
> >    [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-bmg-3/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html
> >     - shard-dg2-set2:     [SKIP][395] ([Intel XE#4208] / [i915#2575]) -> [SKIP][396] ([Intel XE#367])
> >    [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-464/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html
> >    [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-436/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html
> >     - shard-lnl:          [SKIP][397] ([Intel XE#4996]) -> [SKIP][398] ([Intel XE#367])
> >    [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-lnl-8/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html
> >    [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-lnl-3/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html
> > 
> >   * igt@kms_bw@linear-tiling-4-displays-2560x1440p:
> >     - shard-dg2-set2:     [SKIP][399] ([Intel XE#367]) -> [SKIP][400] ([Intel XE#4208] / [i915#2575]) +3 other tests skip
> >    [399]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-464/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html
> >    [400]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-464/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html
> > 
> >   * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:
> >     - shard-dg2-set2:     [SKIP][401] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][402] ([Intel XE#4208]) +21 other tests skip
> >    [401]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-466/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html
> >    [402]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-464/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html
> > 
> >   * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
> >     - shard-dg2-set2:     [SKIP][403] ([Intel XE#2907]) -> [SKIP][404] ([Intel XE#4208]) +1 other test skip
> >    [403]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-434/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html
> >    [404]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-464/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html
> > 
> >   * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
> >     - shard-dg2-set2:     [SKIP][405] ([Intel XE#2907]) -> [SKIP][406] ([Intel XE#829])
> >    [405]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-463/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html
> >    [406]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-432/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html
> > 
> >   * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:
> >     - shard-dg2-set2:     [SKIP][407] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][408] ([Intel XE#2351] / [Intel XE#4208]) +3 other tests skip
> >    [407]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-434/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html
> >    [408]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-464/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html
> > 
> >   * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs:
> >     - shard-adlp:         [SKIP][409] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][410] ([Intel XE#2351])
> >    [409]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-adlp-9/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs.html
> >    [410]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-adlp-2/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs.html
> >     - shard-bmg:          [SKIP][411] ([Intel XE#2887]) -> [SKIP][412] ([Intel XE#2231])
> >    [411]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-7/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs.html
> >    [412]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-bmg-5/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs.html
> >     - shard-dg2-set2:     [SKIP][413] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][414] ([Intel XE#2231] / [Intel XE#4208])
> >    [413]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-434/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs.html
> >    [414]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs.html
> >     - shard-lnl:          [SKIP][415] ([Intel XE#2887]) -> [SKIP][416] ([Intel XE#2351])
> >    [415]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-lnl-5/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs.html
> >    [416]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-lnl-1/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs.html
> > 
> >   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc:
> >     - shard-dg2-set2:     [SKIP][417] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][418] ([Intel XE#829]) +2 other tests skip
> >    [417]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc.html
> >    [418]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc.html
> > 
> >   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
> >     - shard-dg2-set2:     [INCOMPLETE][419] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124]) -> [INCOMPLETE][420] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4345])
> >    [419]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
> >    [420]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
> > 
> >   * igt@kms_chamelium_color@ctm-limited-range:
> >     - shard-dg2-set2:     [SKIP][421] ([Intel XE#306]) -> [SKIP][422] ([Intel XE#4208] / [i915#2575])
> >    [421]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-463/igt@kms_chamelium_color@ctm-limited-range.html
> >    [422]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-464/igt@kms_chamelium_color@ctm-limited-range.html
> > 
> >   * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
> >     - shard-dg2-set2:     [SKIP][423] ([Intel XE#373]) -> [SKIP][424] ([Intel XE#4208] / [i915#2575]) +17 other tests skip
> >    [423]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-463/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html
> >    [424]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-464/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html
> > 
> >   * igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
> >     - shard-adlp:         [SKIP][425] ([Intel XE#4996]) -> [SKIP][426] ([Intel XE#373])
> >    [425]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-adlp-6/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html
> >    [426]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-adlp-9/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html
> >     - shard-bmg:          [SKIP][427] ([Intel XE#4996]) -> [SKIP][428] ([Intel XE#2252])
> >    [427]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-6/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html
> >    [428]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-bmg-4/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html
> >     - shard-dg2-set2:     [SKIP][429] ([Intel XE#4208] / [i915#2575]) -> [SKIP][430] ([Intel XE#373])
> >    [429]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-464/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html
> >    [430]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-435/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html
> >     - shard-lnl:          [SKIP][431] ([Intel XE#4996]) -> [SKIP][432] ([Intel XE#373])
> >    [431]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-lnl-8/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html
> >    [432]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-lnl-6/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html
> > 
> >   * igt@kms_content_protection@atomic:
> >     - shard-dg2-set2:     [FAIL][433] ([Intel XE#1178]) -> [SKIP][434] ([Intel XE#4208] / [i915#2575])
> >    [433]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-434/igt@kms_content_protection@atomic.html
> >    [434]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-464/igt@kms_content_protection@atomic.html
> > 
> >   * igt@kms_content_protection@srm:
> >     - shard-bmg:          [SKIP][435] ([Intel XE#2341]) -> [FAIL][436] ([Intel XE#1178]) +1 other test fail
> >    [435]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-4/igt@kms_content_protection@srm.html
> >    [436]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-bmg-1/igt@kms_content_protection@srm.html
> > 
> >   * igt@kms_cursor_crc@cursor-random-512x170:
> >     - shard-dg2-set2:     [SKIP][437] ([Intel XE#308]) -> [SKIP][438] ([Intel XE#4208] / [i915#2575]) +1 other test skip
> >    [437]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-464/igt@kms_cursor_crc@cursor-random-512x170.html
> >    [438]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-464/igt@kms_cursor_crc@cursor-random-512x170.html
> > 
> >   * igt@kms_cursor_crc@cursor-sliding-max-size:
> >     - shard-lnl:          [SKIP][439] ([Intel XE#1424]) -> [SKIP][440] ([Intel XE#4996]) +1 other test skip
> >    [439]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-lnl-4/igt@kms_cursor_crc@cursor-sliding-max-size.html
> >    [440]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-lnl-1/igt@kms_cursor_crc@cursor-sliding-max-size.html
> > 
> >   * igt@kms_dp_link_training@uhbr-mst:
> >     - shard-lnl:          [SKIP][441] ([Intel XE#4354]) -> [SKIP][442] ([Intel XE#2351] / [Intel XE#4996])
> >    [441]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-lnl-7/igt@kms_dp_link_training@uhbr-mst.html
> >    [442]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-lnl-1/igt@kms_dp_link_training@uhbr-mst.html
> >     - shard-adlp:         [SKIP][443] ([Intel XE#4356]) -> [SKIP][444] ([Intel XE#4996])
> >    [443]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-adlp-1/igt@kms_dp_link_training@uhbr-mst.html
> >    [444]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-adlp-2/igt@kms_dp_link_training@uhbr-mst.html
> >     - shard-bmg:          [SKIP][445] ([Intel XE#4354]) -> [SKIP][446] ([Intel XE#2231])
> >    [445]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-5/igt@kms_dp_link_training@uhbr-mst.html
> >    [446]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-bmg-5/igt@kms_dp_link_training@uhbr-mst.html
> >     - shard-dg2-set2:     [SKIP][447] ([Intel XE#4356]) -> [SKIP][448] ([Intel XE#2231] / [Intel XE#4208])
> >    [447]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-466/igt@kms_dp_link_training@uhbr-mst.html
> >    [448]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-432/igt@kms_dp_link_training@uhbr-mst.html
> > 
> >   * igt@kms_dsc@dsc-with-bpc:
> >     - shard-dg2-set2:     [SKIP][449] ([Intel XE#455]) -> [SKIP][450] ([Intel XE#4208]) +7 other tests skip
> >    [449]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-463/igt@kms_dsc@dsc-with-bpc.html
> >    [450]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-464/igt@kms_dsc@dsc-with-bpc.html
> > 
> >   * igt@kms_dsc@dsc-with-formats:
> >     - shard-dg2-set2:     [SKIP][451] ([Intel XE#455]) -> [SKIP][452] ([Intel XE#2351] / [Intel XE#4208])
> >    [451]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-436/igt@kms_dsc@dsc-with-formats.html
> >    [452]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-464/igt@kms_dsc@dsc-with-formats.html
> > 
> >   * igt@kms_feature_discovery@display-3x:
> >     - shard-lnl:          [SKIP][453] ([Intel XE#703]) -> [SKIP][454] ([Intel XE#4996])
> >    [453]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-lnl-7/igt@kms_feature_discovery@display-3x.html
> >    [454]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-lnl-1/igt@kms_feature_discovery@display-3x.html
> >     - shard-adlp:         [SKIP][455] ([Intel XE#703]) -> [SKIP][456] ([Intel XE#4996])
> >    [455]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-adlp-1/igt@kms_feature_discovery@display-3x.html
> >    [456]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-adlp-2/igt@kms_feature_discovery@display-3x.html
> >     - shard-dg2-set2:     [SKIP][457] ([Intel XE#703]) -> [SKIP][458] ([Intel XE#4208] / [i915#2575])
> >    [457]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-466/igt@kms_feature_discovery@display-3x.html
> >    [458]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-432/igt@kms_feature_discovery@display-3x.html
> > 
> >   * igt@kms_feature_discovery@dp-mst:
> >     - shard-dg2-set2:     [SKIP][459] ([Intel XE#1137]) -> [SKIP][460] ([Intel XE#4208] / [i915#2575])
> >    [459]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-434/igt@kms_feature_discovery@dp-mst.html
> >    [460]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-464/igt@kms_feature_discovery@dp-mst.html
> > 
> >   * igt@kms_feature_discovery@psr2:
> >     - shard-dg2-set2:     [SKIP][461] ([Intel XE#1135]) -> [SKIP][462] ([Intel XE#4208] / [i915#2575])
> >    [461]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-436/igt@kms_feature_discovery@psr2.html
> >    [462]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-464/igt@kms_feature_discovery@psr2.html
> > 
> >   * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
> >     - shard-bmg:          [SKIP][463] ([Intel XE#2316]) -> [FAIL][464] ([Intel XE#3321])
> >    [463]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
> >    [464]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
> > 
> >   * igt@kms_flip@flip-vs-expired-vblank:
> >     - shard-dg2-set2:     [FAIL][465] ([Intel XE#301]) -> [SKIP][466] ([Intel XE#4208] / [i915#2575])
> >    [465]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-432/igt@kms_flip@flip-vs-expired-vblank.html
> >    [466]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank.html
> > 
> >   * igt@kms_flip@flip-vs-suspend:
> >     - shard-dg2-set2:     [INCOMPLETE][467] ([Intel XE#2049] / [Intel XE#2597]) -> [SKIP][468] ([Intel XE#4208] / [i915#2575])
> >    [467]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-463/igt@kms_flip@flip-vs-suspend.html
> >    [468]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-464/igt@kms_flip@flip-vs-suspend.html
> > 
> >   * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:
> >     - shard-lnl:          [SKIP][469] ([Intel XE#1397] / [Intel XE#1745]) -> [SKIP][470] ([Intel XE#2351])
> >    [469]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-lnl-2/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html
> >    [470]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html
> > 
> >   * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:
> >     - shard-lnl:          [SKIP][471] ([Intel XE#2351]) -> [SKIP][472] ([Intel XE#1401] / [Intel XE#1745])
> >    [471]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html
> >    [472]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html
> >     - shard-bmg:          [SKIP][473] ([Intel XE#2231] / [Intel XE#4954]) -> [SKIP][474] ([Intel XE#2293] / [Intel XE#2380])
> >    [473]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html
> >    [474]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html
> > 
> >   * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:
> >     - shard-bmg:          [SKIP][475] ([Intel XE#2311]) -> [SKIP][476] ([Intel XE#2312]) +18 other tests skip
> >    [475]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html
> >    [476]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html
> > 
> >   * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:
> >     - shard-dg2-set2:     [SKIP][477] ([Intel XE#651]) -> [SKIP][478] ([Intel XE#4208]) +33 other tests skip
> >    [477]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html
> >    [478]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html
> > 
> >   * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-move:
> >     - shard-dg2-set2:     [SKIP][479] ([Intel XE#651]) -> [SKIP][480] ([Intel XE#2231] / [Intel XE#4208]) +1 other test skip
> >    [479]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-move.html
> >    [480]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-move.html
> >     - shard-lnl:          [SKIP][481] ([Intel XE#656]) -> [SKIP][482] ([Intel XE#2351] / [Intel XE#4996])
> >    [481]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-lnl-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-move.html
> >    [482]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-move.html
> >     - shard-bmg:          [SKIP][483] ([Intel XE#2311]) -> [SKIP][484] ([Intel XE#2231] / [Intel XE#4954]) +1 other test skip
> >    [483]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-move.html
> >    [484]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-move.html
> > 
> >   * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
> >     - shard-bmg:          [SKIP][485] ([Intel XE#2312]) -> [SKIP][486] ([Intel XE#2311]) +13 other tests skip
> >    [485]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
> >    [486]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
> > 
> >   * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-render:
> >     - shard-adlp:         [SKIP][487] ([Intel XE#656]) -> [SKIP][488] ([Intel XE#4947])
> >    [487]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-adlp-9/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-render.html
> >    [488]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-adlp-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-render.html
> >     - shard-lnl:          [SKIP][489] ([Intel XE#656]) -> [SKIP][490] ([Intel XE#2351])
> >    [489]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-lnl-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-render.html
> >    [490]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-render.html
> > 
> >   * igt@kms_frontbuffer_tracking@drrs-suspend:
> >     - shard-dg2-set2:     [SKIP][491] ([Intel XE#651]) -> [SKIP][492] ([Intel XE#2351] / [Intel XE#4208]) +12 other tests skip
> >    [491]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-suspend.html
> >    [492]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-suspend.html
> > 
> >   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc:
> >     - shard-bmg:          [SKIP][493] ([Intel XE#4141]) -> [SKIP][494] ([Intel XE#2231] / [Intel XE#4954])
> >    [493]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc.html
> >    [494]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc.html
> > 
> >   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:
> >     - shard-dg2-set2:     [SKIP][495] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][496] ([Intel XE#2231] / [Intel XE#4208])
> >    [495]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html
> >    [496]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html
> > 
> >   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
> >     - shard-bmg:          [SKIP][497] ([Intel XE#2312]) -> [SKIP][498] ([Intel XE#4141]) +9 other tests skip
> >    [497]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
> >    [498]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
> > 
> >   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
> >     - shard-bmg:          [SKIP][499] ([Intel XE#4141]) -> [SKIP][500] ([Intel XE#2312]) +8 other tests skip
> >    [499]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
> >    [500]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
> > 
> >   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-blt:
> >     - shard-dg2-set2:     [SKIP][501] ([Intel XE#651]) -> [SKIP][502] ([Intel XE#783]) +4 other tests skip
> >    [501]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-blt.html
> >    [502]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-blt.html
> > 
> >   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-msflip-blt:
> >     - shard-bmg:          [SKIP][503] ([Intel XE#2231] / [Intel XE#4954]) -> [SKIP][504] ([Intel XE#2311])
> >    [503]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-msflip-blt.html
> >    [504]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-msflip-blt.html
> >     - shard-lnl:          [SKIP][505] ([Intel XE#2351]) -> [SKIP][506] ([Intel XE#651])
> >    [505]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-msflip-blt.html
> >    [506]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-msflip-blt.html
> > 
> >   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-pgflip-blt:
> >     - shard-dg2-set2:     [SKIP][507] ([Intel XE#653]) -> [SKIP][508] ([Intel XE#783]) +4 other tests skip
> >    [507]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-pgflip-blt.html
> >    [508]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-pgflip-blt.html
> > 
> >   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-render:
> >     - shard-adlp:         [SKIP][509] ([Intel XE#653]) -> [SKIP][510] ([Intel XE#4996])
> >    [509]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-render.html
> >    [510]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-render.html
> >     - shard-bmg:          [SKIP][511] ([Intel XE#2313]) -> [SKIP][512] ([Intel XE#2231] / [Intel XE#4954])
> >    [511]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-render.html
> >    [512]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-render.html
> >     - shard-dg2-set2:     [SKIP][513] ([Intel XE#653]) -> [SKIP][514] ([Intel XE#2231] / [Intel XE#4208])
> >    [513]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-render.html
> >    [514]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-render.html
> > 
> >   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt:
> >     - shard-bmg:          [SKIP][515] ([Intel XE#2312]) -> [SKIP][516] ([Intel XE#2313]) +14 other tests skip
> >    [515]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html
> >    [516]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html
> > 
> >   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:
> >     - shard-bmg:          [SKIP][517] ([Intel XE#2313]) -> [SKIP][518] ([Intel XE#2312]) +21 other tests skip
> >    [517]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html
> >    [518]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html
> > 
> >   * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
> >     - shard-dg2-set2:     [SKIP][519] ([Intel XE#455]) -> [SKIP][520] ([Intel XE#783])
> >    [519]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-434/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
> >    [520]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-432/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
> > 
> >   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:
> >     - shard-dg2-set2:     [SKIP][521] ([Intel XE#653]) -> [SKIP][522] ([Intel XE#2351] / [Intel XE#4208]) +10 other tests skip
> >    [521]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html
> >    [522]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html
> > 
> >   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:
> >     - shard-dg2-set2:     [SKIP][523] ([Intel XE#653]) -> [SKIP][524] ([Intel XE#4208]) +31 other tests skip
> >    [523]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html
> >    [524]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html
> > 
> >   * igt@kms_getfb@getfb-reject-ccs:
> >     - shard-dg2-set2:     [SKIP][525] ([Intel XE#605]) -> [SKIP][526] ([Intel XE#4208] / [i915#2575])
> >    [525]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-434/igt@kms_getfb@getfb-reject-ccs.html
> >    [526]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-464/igt@kms_getfb@getfb-reject-ccs.html
> > 
> >   * igt@kms_joiner@basic-max-non-joiner:
> >     - shard-dg2-set2:     [SKIP][527] ([Intel XE#4298]) -> [SKIP][528] ([Intel XE#4208])
> >    [527]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-434/igt@kms_joiner@basic-max-non-joiner.html
> >    [528]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-464/igt@kms_joiner@basic-max-non-joiner.html
> > 
> >   * igt@kms_joiner@invalid-modeset-big-joiner:
> >     - shard-dg2-set2:     [SKIP][529] ([Intel XE#346]) -> [SKIP][530] ([Intel XE#4208])
> >    [529]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-436/igt@kms_joiner@invalid-modeset-big-joiner.html
> >    [530]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-464/igt@kms_joiner@invalid-modeset-big-joiner.html
> > 
> >   * igt@kms_plane_lowres@tiling-yf:
> >     - shard-adlp:         [SKIP][531] ([Intel XE#455]) -> [SKIP][532] ([Intel XE#4996]) +1 other test skip
> >    [531]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-adlp-8/igt@kms_plane_lowres@tiling-yf.html
> >    [532]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-adlp-2/igt@kms_plane_lowres@tiling-yf.html
> >     - shard-bmg:          [SKIP][533] ([Intel XE#2393]) -> [SKIP][534] ([Intel XE#4954])
> >    [533]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-2/igt@kms_plane_lowres@tiling-yf.html
> >    [534]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-bmg-5/igt@kms_plane_lowres@tiling-yf.html
> >     - shard-lnl:          [SKIP][535] ([Intel XE#599]) -> [SKIP][536] ([Intel XE#4996])
> >    [535]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-lnl-7/igt@kms_plane_lowres@tiling-yf.html
> >    [536]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-lnl-1/igt@kms_plane_lowres@tiling-yf.html
> > 
> >   * igt@kms_plane_multiple@2x-tiling-yf:
> >     - shard-dg2-set2:     [SKIP][537] ([Intel XE#5021]) -> [SKIP][538] ([Intel XE#4208] / [i915#2575])
> >    [537]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-464/igt@kms_plane_multiple@2x-tiling-yf.html
> >    [538]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-464/igt@kms_plane_multiple@2x-tiling-yf.html
> > 
> >   * igt@kms_plane_multiple@tiling-y:
> >     - shard-dg2-set2:     [SKIP][539] ([Intel XE#5020]) -> [SKIP][540] ([Intel XE#4208] / [i915#2575])
> >    [539]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-433/igt@kms_plane_multiple@tiling-y.html
> >    [540]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-464/igt@kms_plane_multiple@tiling-y.html
> > 
> >   * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
> >     - shard-dg2-set2:     [SKIP][541] ([Intel XE#2763] / [Intel XE#455]) -> [SKIP][542] ([Intel XE#4208] / [i915#2575]) +2 other tests skip
> >    [541]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html
> >    [542]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-464/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html
> > 
> >   * igt@kms_pm_backlight@bad-brightness:
> >     - shard-dg2-set2:     [SKIP][543] ([Intel XE#870]) -> [SKIP][544] ([Intel XE#4208]) +1 other test skip
> >    [543]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-464/igt@kms_pm_backlight@bad-brightness.html
> >    [544]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-464/igt@kms_pm_backlight@bad-brightness.html
> > 
> >   * igt@kms_pm_dc@dc5-retention-flops:
> >     - shard-dg2-set2:     [SKIP][545] ([Intel XE#3309]) -> [SKIP][546] ([Intel XE#4208])
> >    [545]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-435/igt@kms_pm_dc@dc5-retention-flops.html
> >    [546]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-464/igt@kms_pm_dc@dc5-retention-flops.html
> > 
> >   * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:
> >     - shard-dg2-set2:     [SKIP][547] ([Intel XE#1489]) -> [SKIP][548] ([Intel XE#4208]) +10 other tests skip
> >    [547]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-433/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html
> >    [548]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-464/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html
> > 
> >   * igt@kms_psr2_su@page_flip-p010:
> >     - shard-dg2-set2:     [SKIP][549] ([Intel XE#1122]) -> [SKIP][550] ([Intel XE#4208]) +1 other test skip
> >    [549]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-466/igt@kms_psr2_su@page_flip-p010.html
> >    [550]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-464/igt@kms_psr2_su@page_flip-p010.html
> > 
> >   * igt@kms_psr@fbc-psr-no-drrs:
> >     - shard-dg2-set2:     [SKIP][551] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][552] ([Intel XE#2351] / [Intel XE#4208]) +8 other tests skip
> >    [551]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-435/igt@kms_psr@fbc-psr-no-drrs.html
> >    [552]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-464/igt@kms_psr@fbc-psr-no-drrs.html
> > 
> >   * igt@kms_psr@fbc-psr-sprite-render:
> >     - shard-dg2-set2:     [SKIP][553] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][554] ([Intel XE#2231] / [Intel XE#4208]) +1 other test skip
> >    [553]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-434/igt@kms_psr@fbc-psr-sprite-render.html
> >    [554]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-432/igt@kms_psr@fbc-psr-sprite-render.html
> >     - shard-bmg:          [SKIP][555] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][556] ([Intel XE#2231] / [Intel XE#4954]) +1 other test skip
> >    [555]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-7/igt@kms_psr@fbc-psr-sprite-render.html
> >    [556]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-bmg-5/igt@kms_psr@fbc-psr-sprite-render.html
> >     - shard-adlp:         [SKIP][557] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][558] ([Intel XE#4996])
> >    [557]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-adlp-9/igt@kms_psr@fbc-psr-sprite-render.html
> >    [558]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-adlp-2/igt@kms_psr@fbc-psr-sprite-render.html
> > 
> >   * igt@kms_psr@psr2-basic:
> >     - shard-dg2-set2:     [SKIP][559] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][560] ([Intel XE#4208]) +15 other tests skip
> >    [559]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-433/igt@kms_psr@psr2-basic.html
> >    [560]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-464/igt@kms_psr@psr2-basic.html
> > 
> >   * igt@kms_psr@psr2-sprite-plane-move:
> >     - shard-adlp:         [SKIP][561] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][562] ([Intel XE#4947])
> >    [561]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-adlp-8/igt@kms_psr@psr2-sprite-plane-move.html
> >    [562]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-adlp-2/igt@kms_psr@psr2-sprite-plane-move.html
> > 
> >   * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
> >     - shard-dg2-set2:     [SKIP][563] ([Intel XE#2939]) -> [SKIP][564] ([Intel XE#2351] / [Intel XE#4208])
> >    [563]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-436/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
> >    [564]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-464/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
> > 
> >   * igt@kms_rotation_crc@bad-tiling:
> >     - shard-dg2-set2:     [SKIP][565] ([Intel XE#3414]) -> [SKIP][566] ([Intel XE#4208] / [i915#2575]) +2 other tests skip
> >    [565]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-466/igt@kms_rotation_crc@bad-tiling.html
> >    [566]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-464/igt@kms_rotation_crc@bad-tiling.html
> > 
> >   * igt@kms_rotation_crc@primary-rotation-90:
> >     - shard-dg2-set2:     [SKIP][567] ([Intel XE#3414]) -> [SKIP][568] ([Intel XE#829])
> >    [567]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-464/igt@kms_rotation_crc@primary-rotation-90.html
> >    [568]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-432/igt@kms_rotation_crc@primary-rotation-90.html
> > 
> >   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
> >     - shard-bmg:          [SKIP][569] ([Intel XE#2330]) -> [SKIP][570] ([Intel XE#4954])
> >    [569]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-8/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
> >    [570]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-bmg-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
> >     - shard-lnl:          [SKIP][571] ([Intel XE#1127]) -> [SKIP][572] ([Intel XE#4996])
> >    [571]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-lnl-4/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
> >    [572]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-lnl-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
> > 
> >   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
> >     - shard-dg2-set2:     [SKIP][573] ([Intel XE#1127]) -> [SKIP][574] ([Intel XE#4208] / [i915#2575]) +2 other tests skip
> >    [573]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
> >    [574]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-464/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
> > 
> >   * igt@kms_rotation_crc@sprite-rotation-90:
> >     - shard-adlp:         [SKIP][575] ([Intel XE#3414]) -> [SKIP][576] ([Intel XE#4950] / [Intel XE#4996])
> >    [575]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-adlp-9/igt@kms_rotation_crc@sprite-rotation-90.html
> >    [576]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-adlp-2/igt@kms_rotation_crc@sprite-rotation-90.html
> >     - shard-bmg:          [SKIP][577] ([Intel XE#3414] / [Intel XE#3904]) -> [SKIP][578] ([Intel XE#4954])
> >    [577]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-7/igt@kms_rotation_crc@sprite-rotation-90.html
> >    [578]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-bmg-5/igt@kms_rotation_crc@sprite-rotation-90.html
> >     - shard-lnl:          [SKIP][579] ([Intel XE#3414] / [Intel XE#3904]) -> [SKIP][580] ([Intel XE#4996])
> >    [579]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-lnl-5/igt@kms_rotation_crc@sprite-rotation-90.html
> >    [580]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-lnl-1/igt@kms_rotation_crc@sprite-rotation-90.html
> > 
> >   * igt@kms_setmode@clone-exclusive-crtc:
> >     - shard-adlp:         [SKIP][581] ([Intel XE#4996]) -> [SKIP][582] ([Intel XE#455]) +1 other test skip
> >    [581]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-adlp-6/igt@kms_setmode@clone-exclusive-crtc.html
> >    [582]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-adlp-8/igt@kms_setmode@clone-exclusive-crtc.html
> >     - shard-dg2-set2:     [SKIP][583] ([Intel XE#4208] / [i915#2575]) -> [SKIP][584] ([Intel XE#578])
> >    [583]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-464/igt@kms_setmode@clone-exclusive-crtc.html
> >    [584]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-432/igt@kms_setmode@clone-exclusive-crtc.html
> >     - shard-lnl:          [SKIP][585] ([Intel XE#4996]) -> [SKIP][586] ([Intel XE#1435])
> >    [585]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-lnl-8/igt@kms_setmode@clone-exclusive-crtc.html
> >    [586]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-lnl-4/igt@kms_setmode@clone-exclusive-crtc.html
> > 
> >   * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
> >     - shard-dg2-set2:     [SKIP][587] ([Intel XE#1500]) -> [SKIP][588] ([Intel XE#4208] / [i915#2575])
> >    [587]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> >    [588]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> > 
> >   * igt@kms_tv_load_detect@load-detect:
> >     - shard-dg2-set2:     [SKIP][589] ([Intel XE#330]) -> [SKIP][590] ([Intel XE#4208] / [i915#2575])
> >    [589]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-463/igt@kms_tv_load_detect@load-detect.html
> >    [590]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-464/igt@kms_tv_load_detect@load-detect.html
> > 
> >   * igt@kms_vrr@cmrr:
> >     - shard-dg2-set2:     [SKIP][591] ([Intel XE#2168]) -> [SKIP][592] ([Intel XE#4208] / [i915#2575])
> >    [591]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-466/igt@kms_vrr@cmrr.html
> >    [592]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-464/igt@kms_vrr@cmrr.html
> > 
> >   * igt@kms_vrr@flipline:
> >     - shard-dg2-set2:     [SKIP][593] ([Intel XE#455]) -> [SKIP][594] ([Intel XE#4208] / [i915#2575]) +9 other tests skip
> >    [593]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-433/igt@kms_vrr@flipline.html
> >    [594]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-464/igt@kms_vrr@flipline.html
> > 
> >   * igt@kms_writeback@writeback-check-output-xrgb2101010:
> >     - shard-dg2-set2:     [SKIP][595] ([Intel XE#756]) -> [SKIP][596] ([Intel XE#1926])
> >    [595]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-432/igt@kms_writeback@writeback-check-output-xrgb2101010.html
> >    [596]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-432/igt@kms_writeback@writeback-check-output-xrgb2101010.html
> > 
> >   * igt@kms_writeback@writeback-fb-id:
> >     - shard-dg2-set2:     [SKIP][597] ([Intel XE#756]) -> [SKIP][598] ([Intel XE#4208] / [i915#2575]) +2 other tests skip
> >    [597]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-463/igt@kms_writeback@writeback-fb-id.html
> >    [598]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-464/igt@kms_writeback@writeback-fb-id.html
> > 
> >   * igt@xe_ccs@block-multicopy-compressed:
> >     - shard-adlp:         [SKIP][599] ([Intel XE#4996]) -> [SKIP][600] ([Intel XE#455] / [Intel XE#488])
> >    [599]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-adlp-6/igt@xe_ccs@block-multicopy-compressed.html
> >    [600]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-adlp-9/igt@xe_ccs@block-multicopy-compressed.html
> > 
> >   * igt@xe_compute_preempt@compute-preempt-many:
> >     - shard-dg2-set2:     [SKIP][601] ([Intel XE#1280] / [Intel XE#455]) -> [SKIP][602] ([Intel XE#4208])
> >    [601]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-434/igt@xe_compute_preempt@compute-preempt-many.html
> >    [602]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-464/igt@xe_compute_preempt@compute-preempt-many.html
> > 
> >   * igt@xe_copy_basic@mem-set-linear-0x369:
> >     - shard-dg2-set2:     [SKIP][603] ([Intel XE#1126]) -> [SKIP][604] ([Intel XE#4208])
> >    [603]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-464/igt@xe_copy_basic@mem-set-linear-0x369.html
> >    [604]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-464/igt@xe_copy_basic@mem-set-linear-0x369.html
> > 
> >   * igt@xe_eu_stall@invalid-gt-id:
> >     - shard-dg2-set2:     [SKIP][605] ([Intel XE#4497]) -> [SKIP][606] ([Intel XE#4208])
> >    [605]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-464/igt@xe_eu_stall@invalid-gt-id.html
> >    [606]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-464/igt@xe_eu_stall@invalid-gt-id.html
> > 
> >   * igt@xe_eudebug@basic-vm-access-userptr-faultable:
> >     - shard-dg2-set2:     [SKIP][607] ([Intel XE#4837]) -> [SKIP][608] ([Intel XE#4208]) +19 other tests skip
> >    [607]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-464/igt@xe_eudebug@basic-vm-access-userptr-faultable.html
> >    [608]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-464/igt@xe_eudebug@basic-vm-access-userptr-faultable.html
> > 
> >   * igt@xe_eudebug@basic-vm-bind-ufence-sigint-client:
> >     - shard-adlp:         [SKIP][609] ([Intel XE#4837]) -> [SKIP][610] ([Intel XE#4945] / [Intel XE#4996])
> >    [609]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-adlp-1/igt@xe_eudebug@basic-vm-bind-ufence-sigint-client.html
> >    [610]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-adlp-2/igt@xe_eudebug@basic-vm-bind-ufence-sigint-client.html
> >     - shard-bmg:          [SKIP][611] ([Intel XE#4837]) -> [SKIP][612] ([Intel XE#4954])
> >    [611]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-5/igt@xe_eudebug@basic-vm-bind-ufence-sigint-client.html
> >    [612]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-bmg-5/igt@xe_eudebug@basic-vm-bind-ufence-sigint-client.html
> >     - shard-lnl:          [SKIP][613] ([Intel XE#4837]) -> [SKIP][614] ([Intel XE#4996])
> >    [613]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-lnl-8/igt@xe_eudebug@basic-vm-bind-ufence-sigint-client.html
> >    [614]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-lnl-1/igt@xe_eudebug@basic-vm-bind-ufence-sigint-client.html
> > 
> >   * igt@xe_eudebug_sriov@deny-eudebug:
> >     - shard-dg2-set2:     [SKIP][615] ([Intel XE#4518]) -> [SKIP][616] ([Intel XE#4208])
> >    [615]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-464/igt@xe_eudebug_sriov@deny-eudebug.html
> >    [616]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-464/igt@xe_eudebug_sriov@deny-eudebug.html
> > 
> >   * igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen:
> >     - shard-adlp:         [SKIP][617] ([Intel XE#688]) -> [SKIP][618] ([Intel XE#4996])
> >    [617]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-adlp-3/igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen.html
> >    [618]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-adlp-2/igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen.html
> >     - shard-lnl:          [SKIP][619] ([Intel XE#688]) -> [SKIP][620] ([Intel XE#4996])
> >    [619]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-lnl-3/igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen.html
> >    [620]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-lnl-1/igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen.html
> > 
> >   * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null:
> >     - shard-adlp:         [SKIP][621] ([Intel XE#1392]) -> [SKIP][622] ([Intel XE#4996]) +1 other test skip
> >    [621]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-adlp-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null.html
> >    [622]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-adlp-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null.html
> >     - shard-bmg:          [SKIP][623] ([Intel XE#2322]) -> [SKIP][624] ([Intel XE#4954]) +1 other test skip
> >    [623]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null.html
> >    [624]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null.html
> >     - shard-lnl:          [SKIP][625] ([Intel XE#1392]) -> [SKIP][626] ([Intel XE#4996]) +1 other test skip
> >    [625]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-lnl-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null.html
> >    [626]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-lnl-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null.html
> > 
> >   * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race:
> >     - shard-dg2-set2:     [SKIP][627] ([Intel XE#1392]) -> [SKIP][628] ([Intel XE#4208]) +2 other tests skip
> >    [627]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html
> >    [628]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-464/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html
> > 
> >   * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-imm:
> >     - shard-adlp:         [SKIP][629] ([Intel XE#4996]) -> [SKIP][630] ([Intel XE#288]) +1 other test skip
> >    [629]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-adlp-6/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-imm.html
> >    [630]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-adlp-1/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-imm.html
> >     - shard-dg2-set2:     [SKIP][631] ([Intel XE#4208]) -> [SKIP][632] ([Intel XE#288])
> >    [631]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-464/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-imm.html
> >    [632]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-435/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-imm.html
> > 
> >   * igt@xe_exec_fault_mode@twice-userptr-prefetch:
> >     - shard-dg2-set2:     [SKIP][633] ([Intel XE#288]) -> [SKIP][634] ([Intel XE#4208]) +42 other tests skip
> >    [633]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-464/igt@xe_exec_fault_mode@twice-userptr-prefetch.html
> >    [634]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-464/igt@xe_exec_fault_mode@twice-userptr-prefetch.html
> > 
> >   * igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:
> >     - shard-dg2-set2:     [SKIP][635] ([Intel XE#2360]) -> [SKIP][636] ([Intel XE#4208])
> >    [635]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-463/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html
> >    [636]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-464/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html
> > 
> >   * igt@xe_exec_system_allocator@many-execqueues-mmap-new-huge:
> >     - shard-dg2-set2:     [SKIP][637] ([Intel XE#4915]) -> [SKIP][638] ([Intel XE#4208]) +273 other tests skip
> >    [637]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-466/igt@xe_exec_system_allocator@many-execqueues-mmap-new-huge.html
> >    [638]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-464/igt@xe_exec_system_allocator@many-execqueues-mmap-new-huge.html
> > 
> >   * igt@xe_exec_system_allocator@many-execqueues-new-busy-nomemset:
> >     - shard-adlp:         [SKIP][639] ([Intel XE#4915]) -> [SKIP][640] ([Intel XE#4996]) +6 other tests skip
> >    [639]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-adlp-2/igt@xe_exec_system_allocator@many-execqueues-new-busy-nomemset.html
> >    [640]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-adlp-2/igt@xe_exec_system_allocator@many-execqueues-new-busy-nomemset.html
> > 
> >   * igt@xe_exec_system_allocator@many-large-execqueues-mmap-new-race:
> >     - shard-adlp:         [SKIP][641] ([Intel XE#4996]) -> [SKIP][642] ([Intel XE#4915]) +2 other tests skip
> >    [641]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-adlp-6/igt@xe_exec_system_allocator@many-large-execqueues-mmap-new-race.html
> >    [642]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-adlp-2/igt@xe_exec_system_allocator@many-large-execqueues-mmap-new-race.html
> > 
> >   * igt@xe_exec_system_allocator@many-mmap-huge-nomemset:
> >     - shard-lnl:          [SKIP][643] ([Intel XE#4943]) -> [SKIP][644] ([Intel XE#4996])
> >    [643]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-lnl-4/igt@xe_exec_system_allocator@many-mmap-huge-nomemset.html
> >    [644]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-lnl-1/igt@xe_exec_system_allocator@many-mmap-huge-nomemset.html
> >     - shard-bmg:          [SKIP][645] ([Intel XE#4943]) -> [SKIP][646] ([Intel XE#4996])
> >    [645]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-6/igt@xe_exec_system_allocator@many-mmap-huge-nomemset.html
> >    [646]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-bmg-5/igt@xe_exec_system_allocator@many-mmap-huge-nomemset.html
> > 
> >   * igt@xe_exec_system_allocator@threads-many-stride-mmap-nomemset:
> >     - shard-adlp:         [SKIP][647] ([Intel XE#4945]) -> [SKIP][648] ([Intel XE#4915])
> >    [647]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-adlp-6/igt@xe_exec_system_allocator@threads-many-stride-mmap-nomemset.html
> >    [648]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-adlp-1/igt@xe_exec_system_allocator@threads-many-stride-mmap-nomemset.html
> >     - shard-dg2-set2:     [SKIP][649] ([Intel XE#4208]) -> [SKIP][650] ([Intel XE#4915]) +1 other test skip
> >    [649]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-464/igt@xe_exec_system_allocator@threads-many-stride-mmap-nomemset.html
> >    [650]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-466/igt@xe_exec_system_allocator@threads-many-stride-mmap-nomemset.html
> > 
> >   * igt@xe_oa@invalid-oa-format-id:
> >     - shard-adlp:         [SKIP][651] ([Intel XE#4996]) -> [SKIP][652] ([Intel XE#2541] / [Intel XE#3573])
> >    [651]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-adlp-6/igt@xe_oa@invalid-oa-format-id.html
> >    [652]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-adlp-4/igt@xe_oa@invalid-oa-format-id.html
> > 
> >   * igt@xe_oa@oa-unit-exclusive-stream-sample-oa:
> >     - shard-dg2-set2:     [SKIP][653] ([Intel XE#2541] / [Intel XE#3573]) -> [SKIP][654] ([Intel XE#4208]) +9 other tests skip
> >    [653]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-466/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html
> >    [654]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-464/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html
> > 
> >   * igt@xe_oa@syncs-syncobj-wait-cfg:
> >     - shard-dg2-set2:     [SKIP][655] ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501]) -> [SKIP][656] ([Intel XE#4208]) +1 other test skip
> >    [655]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-464/igt@xe_oa@syncs-syncobj-wait-cfg.html
> >    [656]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-464/igt@xe_oa@syncs-syncobj-wait-cfg.html
> > 
> >   * igt@xe_pat@pat-index-xe2:
> >     - shard-dg2-set2:     [SKIP][657] ([Intel XE#977]) -> [SKIP][658] ([Intel XE#4208])
> >    [657]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-464/igt@xe_pat@pat-index-xe2.html
> >    [658]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-464/igt@xe_pat@pat-index-xe2.html
> > 
> >   * igt@xe_pat@pat-index-xelpg:
> >     - shard-dg2-set2:     [SKIP][659] ([Intel XE#979]) -> [SKIP][660] ([Intel XE#4208])
> >    [659]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-466/igt@xe_pat@pat-index-xelpg.html
> >    [660]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-464/igt@xe_pat@pat-index-xelpg.html
> > 
> >   * igt@xe_peer2peer@read:
> >     - shard-dg2-set2:     [FAIL][661] ([Intel XE#1173]) -> [SKIP][662] ([Intel XE#1061] / [Intel XE#4208])
> >    [661]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-434/igt@xe_peer2peer@read.html
> >    [662]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-464/igt@xe_peer2peer@read.html
> > 
> >   * igt@xe_pm@d3cold-mmap-system:
> >     - shard-dg2-set2:     [SKIP][663] ([Intel XE#2284] / [Intel XE#366]) -> [SKIP][664] ([Intel XE#4208]) +1 other test skip
> >    [663]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-464/igt@xe_pm@d3cold-mmap-system.html
> >    [664]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-464/igt@xe_pm@d3cold-mmap-system.html
> > 
> >   * igt@xe_pmu@fn-engine-activity-sched-if-idle:
> >     - shard-lnl:          [SKIP][665] ([Intel XE#4650]) -> [SKIP][666] ([Intel XE#4996])
> >    [665]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-lnl-5/igt@xe_pmu@fn-engine-activity-sched-if-idle.html
> >    [666]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-lnl-1/igt@xe_pmu@fn-engine-activity-sched-if-idle.html
> >     - shard-bmg:          [SKIP][667] ([Intel XE#4650]) -> [SKIP][668] ([Intel XE#4954])
> >    [667]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-7/igt@xe_pmu@fn-engine-activity-sched-if-idle.html
> >    [668]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-bmg-5/igt@xe_pmu@fn-engine-activity-sched-if-idle.html
> >     - shard-dg2-set2:     [SKIP][669] ([Intel XE#4650]) -> [SKIP][670] ([Intel XE#4208])
> >    [669]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-434/igt@xe_pmu@fn-engine-activity-sched-if-idle.html
> >    [670]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-432/igt@xe_pmu@fn-engine-activity-sched-if-idle.html
> > 
> >   * igt@xe_pxp@pxp-stale-bo-bind-post-suspend:
> >     - shard-dg2-set2:     [SKIP][671] ([Intel XE#4733]) -> [SKIP][672] ([Intel XE#4208]) +2 other tests skip
> >    [671]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-466/igt@xe_pxp@pxp-stale-bo-bind-post-suspend.html
> >    [672]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-464/igt@xe_pxp@pxp-stale-bo-bind-post-suspend.html
> > 
> >   * igt@xe_query@multigpu-query-engines:
> >     - shard-dg2-set2:     [SKIP][673] ([Intel XE#944]) -> [SKIP][674] ([Intel XE#4208]) +3 other tests skip
> >    [673]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-463/igt@xe_query@multigpu-query-engines.html
> >    [674]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-464/igt@xe_query@multigpu-query-engines.html
> > 
> >   * igt@xe_render_copy@render-stress-0-copies:
> >     - shard-dg2-set2:     [SKIP][675] ([Intel XE#4814]) -> [SKIP][676] ([Intel XE#4208])
> >    [675]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-434/igt@xe_render_copy@render-stress-0-copies.html
> >    [676]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-464/igt@xe_render_copy@render-stress-0-copies.html
> > 
> >   * igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:
> >     - shard-dg2-set2:     [SKIP][677] ([Intel XE#4130]) -> [SKIP][678] ([Intel XE#4208])
> >    [677]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-466/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html
> >    [678]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-464/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html
> > 
> >   * igt@xe_sriov_flr@flr-vfs-parallel:
> >     - shard-dg2-set2:     [SKIP][679] ([Intel XE#4273]) -> [SKIP][680] ([Intel XE#4208])
> >    [679]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-434/igt@xe_sriov_flr@flr-vfs-parallel.html
> >    [680]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/shard-dg2-464/igt@xe_sriov_flr@flr-vfs-parallel.html
> > 
> >   
> >   {name}: This element is suppressed. This means it is ignored when computing
> >           the status of the difference (SUCCESS, WARNING, or FAILURE).
> > 
> >   [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
> >   [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
> >   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
> >   [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
> >   [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
> >   [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
> >   [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
> >   [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
> >   [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
> >   [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
> >   [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
> >   [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
> >   [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
> >   [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
> >   [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
> >   [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
> >   [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
> >   [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
> >   [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
> >   [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
> >   [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
> >   [Intel XE#1467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1467
> >   [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
> >   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
> >   [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
> >   [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
> >   [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
> >   [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
> >   [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
> >   [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
> >   [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
> >   [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
> >   [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
> >   [Intel XE#1926]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1926
> >   [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
> >   [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
> >   [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
> >   [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
> >   [Intel XE#2231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231
> >   [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
> >   [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
> >   [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
> >   [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
> >   [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
> >   [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
> >   [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
> >   [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
> >   [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
> >   [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
> >   [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
> >   [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
> >   [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
> >   [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
> >   [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
> >   [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
> >   [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
> >   [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
> >   [Intel XE#2350]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350
> >   [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
> >   [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
> >   [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
> >   [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
> >   [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
> >   [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
> >   [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
> >   [Intel XE#2427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427
> >   [Intel XE#2459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2459
> >   [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
> >   [Intel XE#2571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571
> >   [Intel XE#2596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2596
> >   [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
> >   [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
> >   [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
> >   [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
> >   [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
> >   [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
> >   [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
> >   [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
> >   [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
> >   [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
> >   [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
> >   [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
> >   [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
> >   [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
> >   [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
> >   [Intel XE#2934]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934
> >   [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
> >   [Intel XE#3009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009
> >   [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
> >   [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
> >   [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
> >   [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
> >   [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
> >   [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
> >   [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
> >   [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
> >   [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
> >   [Intel XE#3226]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3226
> >   [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
> >   [Intel XE#3278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278
> >   [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
> >   [Intel XE#3307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3307
> >   [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
> >   [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
> >   [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
> >   [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
> >   [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
> >   [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
> >   [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
> >   [Intel XE#3658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3658
> >   [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
> >   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
> >   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
> >   [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
> >   [Intel XE#3884]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3884
> >   [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
> >   [Intel XE#4045]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4045
> >   [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
> >   [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
> >   [Intel XE#4164]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4164
> >   [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
> >   [Intel XE#4208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208
> >   [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
> >   [Intel XE#4273]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273
> >   [Intel XE#4294]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4294
> >   [Intel XE#4298]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298
> >   [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
> >   [Intel XE#4351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4351
> >   [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
> >   [Intel XE#4356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4356
> >   [Intel XE#4416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4416
> >   [Intel XE#4418]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4418
> >   [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
> >   [Intel XE#4497]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4497
> >   [Intel XE#4501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501
> >   [Intel XE#4518]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518
> >   [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
> >   [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
> >   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
> >   [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
> >   [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
> >   [Intel XE#4609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
> >   [Intel XE#4618]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4618
> >   [Intel XE#4650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650
> >   [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
> >   [Intel XE#4741]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4741
> >   [Intel XE#4760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4760
> >   [Intel XE#4792]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4792
> >   [Intel XE#4814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4814
> >   [Intel XE#4819]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4819
> >   [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
> >   [Intel XE#488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
> >   [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
> >   [Intel XE#4921]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4921
> >   [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
> >   [Intel XE#4945]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945
> >   [Intel XE#4947]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947
> >   [Intel XE#4950]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950
> >   [Intel XE#4954]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4954
> >   [Intel XE#4971]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4971
> >   [Intel XE#4983]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4983
> >   [Intel XE#4996]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996
> >   [Intel XE#5017]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5017
> >   [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
> >   [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
> >   [Intel XE#578]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/578
> >   [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
> >   [Intel XE#605]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/605
> >   [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
> >   [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
> >   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
> >   [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
> >   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
> >   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
> >   [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
> >   [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
> >   [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
> >   [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
> >   [Intel XE#783]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/783
> >   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
> >   [Intel XE#829]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/829
> >   [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
> >   [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
> >   [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
> >   [Intel XE#911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/911
> >   [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
> >   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
> >   [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
> >   [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
> >   [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
> >   [i915#6077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6077
> > 
> > 
> > Build changes
> > -------------
> > 
> >   * IGT: IGT_8359 -> IGT_8361
> >   * Linux: xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9 -> xe-pw-148672v3
> > 
> >   IGT_8359: 807f0cbcc771d1d0bb0d27a78231a5f92dc02126 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> >   IGT_8361: 8361
> >   xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9: b0db97d4270c697ade930cfefdb7aaef12cd80c9
> >   xe-pw-148672v3: 148672v3
> > 
> > == Logs ==
> > 
> > For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v3/index.html
> > 
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation

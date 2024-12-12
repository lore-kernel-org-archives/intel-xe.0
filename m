Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85662E77182
	for <intel-xe@archiver.kernel.org>; Thu, 12 Dec 2024 16:29:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2763089F63;
	Thu, 12 Dec 2024 16:29:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="njrhkXwE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F34310E1F8
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Dec 2024 16:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734020968; x=1765556968;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=piuFIIjjZXYj22o4kIdhDAA4h/qSf/7cvGGY6VpLR3c=;
 b=njrhkXwEwEMy255JLbfe8th7T/O4F9nvkJIY9FtcJz2aS9XzDHARPhEg
 stM8yfJZRgHkHYq7oZLCd1Bh3yy1XSKVwGVli9cD8iBDuD9RN9SJj5f7v
 dVDREGl6O2jCBETc1PpB/oY9Oj1qgDqdHl74doVsp+sRrk05N0ddESNYn
 7En9IsnX2MhUvGr3Z5VRTp244MFBPWU4CO54upbk5OSIo/YZOW/lF1NdT
 JzISkxWaxlJNfPU3xxR9naIvHi17g4LBIth6QfpTMzLaSk+eTK824hl0M
 l2vvA25fq/gOgslQzOz9psacUrJ9vzFIQ2BZ8LxD8bmp1lf+uJ3i+G68W A==;
X-CSE-ConnectionGUID: x3/DInnDRPm9ZDkAM/gwBg==
X-CSE-MsgGUID: 6n5Fw+YsSqORyVkZ6nyWZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11284"; a="45137648"
X-IronPort-AV: E=Sophos;i="6.12,229,1728975600"; d="scan'208";a="45137648"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2024 08:29:27 -0800
X-CSE-ConnectionGUID: YK4wDpVdQyGzngvdGqmwqg==
X-CSE-MsgGUID: MddTkPS+SBStVMjDYRNPkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="127274592"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Dec 2024 08:29:27 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 12 Dec 2024 08:29:26 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 12 Dec 2024 08:29:26 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 12 Dec 2024 08:29:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u7g1Nk/CyV9oDkdmfE7OfJ393NGv8VhqiXPaG1f2TK5hbgQWHUFqu6MEtGe7uKloQu6bHyyisklapevLnaQVgM8BWzfXOouxemL4W+IcHL6x79aHN9vYRE8rVWYw87OZ/zW2bGtnpHVcM7IfUsnwxCdfr+enFxDqzGuqVINN2RnK8dwpKgflsZB9O8nvCOTRgIdFEna1D0Dp5Ww3B7UvooECTlXg+oemt++hst3+Cq9HWIkZYAPZXuHaVM6Ci7RaYcFUoTIESoGw2IzsB2xlnIbS9zCxeMoh7E0Rtai4xlifWy8XWFRrDSU49ypGvOZ6s1IC40/HjoxYQTq0LoRhog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pInTxM8e0hjSC8X/Z5+wlVQBFF8+fXvm+lN6aOi+rMA=;
 b=rsWrRkIis0hvi6UPEs/FmlCo3EA6jIRl3Z/d/SUifJQQQrAOQg4ihvJlkXmgAaSS+xcZ1S+aRkiEq4QrGZnqrvDzXxEW2rueSK/nvDx8tSLTXo3MnQWnI23duXCmBq93xKk2c8LiLkbcrkuj0Q3CBjjEwfotf/HtqrWfxr/stMXsADlcZRd1bZgtMqyEzKZXOLYDeV74xhSviKAxJomr3T5oIqkvvuNjXUP52s2mgX0gDjOx6K9PMaPO0KR9pqmg+sLsazQZWLiB65+A3QrKZjN7DtvqyY7TFnoNz+xfXWeGIVk5Ss8zuabGg3o/hbgZvT5PtzuNoRPc4rBvFoG/zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB6520.namprd11.prod.outlook.com (2603:10b6:8:d0::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.16; Thu, 12 Dec
 2024 16:29:21 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8251.015; Thu, 12 Dec 2024
 16:29:21 +0000
Date: Thu, 12 Dec 2024 08:30:03 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Fix fault on fd close when wedged
Message-ID: <Z1sPi9G00q6advpY@lstrano-desk.jf.intel.com>
References: <20241211225332.1136152-1-lucas.demarchi@intel.com>
 <Z1pd3co1pwBPvExA@lstrano-desk.jf.intel.com>
 <ffgubo3r4kue5fmlbb6grii3t3rfafnpk5av4ieht7em7du7xw@svwhtkn3exfq>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ffgubo3r4kue5fmlbb6grii3t3rfafnpk5av4ieht7em7du7xw@svwhtkn3exfq>
X-ClientProxiedBy: BYAPR11CA0052.namprd11.prod.outlook.com
 (2603:10b6:a03:80::29) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB6520:EE_
X-MS-Office365-Filtering-Correlation-Id: c9de77ce-cbd3-401c-bfc7-08dd1aca2237
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2hVEwXk15wGO8XIKRvr/6QFkzJU3Hl4PUNa9Xwa6GlsDksUPStvtdTia1ae3?=
 =?us-ascii?Q?CoIJV7D84QgtfUABiaYD7fUNKUV68MdKrWCB9Wos5hhjQluoX5wpFcp9oeBN?=
 =?us-ascii?Q?UmCtSOL3AGu+EqXRKSDOpR1CW4PEFwZnxngHhveEE5oDzpkU4R8FooxYIf/o?=
 =?us-ascii?Q?aDhOa4juiz5WJ+lWyWxOaGqQsCawhWOCdfBMm74qjWIBTHtDyybjCW8iLBWT?=
 =?us-ascii?Q?r7Ru2HsbkiP5EF5denv8bcFTKAYI+KOguYxyuXnf0IF2G06GGak5wO0ByaR2?=
 =?us-ascii?Q?IFb8KzTu8FYJnOlbsWGfSK4iVhq/mlhL1+iHMEfmutHbdbnJ53XHbkGdPYRx?=
 =?us-ascii?Q?oaEL4QsBkGxQtgLl2i+eMMosD6RCDCyEUMlY8bvtQOmoBZHbQIDblGAou+fk?=
 =?us-ascii?Q?TWp22325rweKyVIBlwyAhAi0kCsQQ6S3evhGSQ7WnvxZ30jIiYzC7PCM8VcN?=
 =?us-ascii?Q?vEJJqsHdQZHTFBPYdXzs+UL6jp1MpFq1HGfabBmCMk9RWjudj4T2qyrHtKGG?=
 =?us-ascii?Q?ZBq02iOgA0ZUf6olaqwwKFzwZhSIVltEi24aLr9epNZ5cy17y6Bs7swXaoQx?=
 =?us-ascii?Q?SaiiPBSXXpflPxBjsMLoLxZVoQ2Mnkpc8nNk8gS9P+qSyLfULST20y3dNqDJ?=
 =?us-ascii?Q?WrxhfoWX1Hhhq9MJmviEnyyVXqoFV/+gW3nFv4CYoR9pjISOX7Ba3tXcfzDz?=
 =?us-ascii?Q?ylj0PXDRmQEh/8ADQ4fBdlKW6MMqfDGsGE+p3ChKVBMpyCvkB+qWdu8tAR92?=
 =?us-ascii?Q?iNCUkwdiei66tzn6y6A2DnIFpi50l4THThgmIgcWhCtZaMNseqgoxoYJ5v/C?=
 =?us-ascii?Q?0X89pTGmt6RClGhT6EepHeDTpeetJqtTfTkX/AfvdvviC59k+p+PQatQpQUK?=
 =?us-ascii?Q?Oc+6uNglfO0QNefrm7jPlshBfgFQw3pu4q3EJXxy3n35PrQXNlx8pVTw9cPp?=
 =?us-ascii?Q?hU4EV8ZYOk8WgDrBULpSeecBe28BzTlG59RpWjXXcS3xxiS3VXj6KO16blrP?=
 =?us-ascii?Q?Vqq8OQLtc1Hu+N4W1hygzEWK5nIoJr2wBpFWDZx9VyXeEj+F6b4PTrtUirhx?=
 =?us-ascii?Q?7o49ICXmJ3ZlP4YNObW2Th49/Ufk8ZNdc7Um53/defFeaqkyMgr1OfaAmZjT?=
 =?us-ascii?Q?rsiK/NTpYp5P772o0/zWHdx/LTOdg2yOZ/hkQTZ/CdfdUr6gjKhdIBsMr9Mu?=
 =?us-ascii?Q?5eORFTk7ZA35wpIx5jqcwmLxWCpmdNsj9gtAh9y1za9k25jgCKbrrqBawXGy?=
 =?us-ascii?Q?rQCnugSvRZLtoXxUBjzN7wT0L9U78B+OLKuozCJb2BF0ToURS41NrkSHNJgM?=
 =?us-ascii?Q?3T3hgfb/L1np4ruhHc4prq7TjIh937SeJ6TmhlUXBl3vscFqhpleC9V/vIHs?=
 =?us-ascii?Q?Ken+1Q8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OTvF8HMzpIoHFwpxnwRv7CW4w9ONOPgy0SGTof/I9I9DEOnlUqhYK8GC/FtF?=
 =?us-ascii?Q?hZ0ix792CooPf7b6RS7Jo8QODUlbaavjtt2SZ0jq6l07/6b1clPfxsBT/bnX?=
 =?us-ascii?Q?NJlEixQtKt/NplP5gUkBRvoQZ8uissHznBgz8rin0QO629yuK8if8rOWrRQH?=
 =?us-ascii?Q?nDlCp839Vx+5/WwT0YQIM9A3inUfcbDD1bx0kjEbQRxU8TF05Uc0DpTvfBxI?=
 =?us-ascii?Q?jzRMC6ct+mPgcovQAd7rUsLvyqB0l9vG6bAadiRhiL2lcB53b/sdUrLZ0/sr?=
 =?us-ascii?Q?P8jgBN9vdmsyVW0JXaGD/gGoZBP23TweyyWijfG/qzx7rCiDWKvTZt7P+tWz?=
 =?us-ascii?Q?ONOLwn0oLYmHaVw6takzyxR0nozMSpvDeZixy6913kqlwHlVrFmoMZganX/x?=
 =?us-ascii?Q?vBAFhQ+jtslVYujKo/hiUHhcwot7m7rEl8+A1A2Qx+ujdjA+7XTNY7Y34mWg?=
 =?us-ascii?Q?1YjqDLF55bLdVTvD53URZUsypGAQGNzB9oo80ixm//sB1w0DMYCjYCk04Ha1?=
 =?us-ascii?Q?tGyBrdsliKm6Bk8rsbOersIoUPOMMdBz3srg8VXdKVKTvLWB7vXr58e9Ezmz?=
 =?us-ascii?Q?4/hbQFBoPxzdMYvG9ar12L+OZ36lWLdQM31IyO84vJhA5Y1B8Je0lS371fzD?=
 =?us-ascii?Q?wO8e/hFJE2RG5Xis8+tAycwfsOBhufwXAQG1o8waAwtw6d7RNYBH2edeh1Am?=
 =?us-ascii?Q?laIbnh88gCekBfi5R6OUYUDIYyfSN7+3euXcx0geFzp4Hmi7KaQdpAQCUKUj?=
 =?us-ascii?Q?UY4UDR4nRHqTAd4iHtGFQZHa+qWacCk9HvG7eBe7DM1Vsccn2wJ+730I5uKn?=
 =?us-ascii?Q?ze+26yyscqyDSQe2LT+IoYudlIZlpSlCRVK1buZvfs76aaIN5IIgGVHLsJYh?=
 =?us-ascii?Q?HvibFYwkKhB7R0c5wMKKz9EugSCTmdk6nBXkl2mYo2GbdVG02VOsvD472RBM?=
 =?us-ascii?Q?0EWMGTOEwiGtUBbuS1/3+9BOdH5djrvt3XR2J7OMag4j4JlAW2wpxlQGFT+i?=
 =?us-ascii?Q?Y2Pn9VMIYCLeOXVNjJxS19nbDZnhnf6AY3TrsSyr7+D/7GghlY/rlenoaZYA?=
 =?us-ascii?Q?yPCHxsdJ0d7QRWiIwEVP8LYqAK2qCj6vzcRPw5Wue2RAHXWziy0J+1kSb+s1?=
 =?us-ascii?Q?dofHwANixSBFaB5z+RkqMXBHtlrXwx150C0HIDxxPiGjQmJTpWMR8kyWe8tf?=
 =?us-ascii?Q?yzKaCCzti5xbrRUwX9vOrLv1IaN2A7eAR7Q/kYbVutiXnczDoXHtlVySqoUw?=
 =?us-ascii?Q?zKCoQxqkTqJv8TDaow4ecp2NazL7wmshj1JhlNCDsG8SLueVyrkOX2M7XG6C?=
 =?us-ascii?Q?2LO2xToWlvFgcZy70pi2Qzus43FCB/zviEylkD3B0ZJlKx84YpUM0vCufaF6?=
 =?us-ascii?Q?+A1t/6UHe1rp7n+GJP1paKr5Perl4HSsG+eiY3bFMCk+TnjWzSnAeG+fRVgs?=
 =?us-ascii?Q?hjr3PMPalpXxTodFjnBUL5b+1dQK8S60xxqsCbGQZQgVq+i7XJ2w6+KJ+Nna?=
 =?us-ascii?Q?0n1BONVzTXXl7Mxvc2kmy0fiZ9PuCRRmf3kW65c6ORnaduI4c1tXUmCYf2oC?=
 =?us-ascii?Q?ZJQi4fmyMUajC6MhlcYSbn+dmwX9cjm8fLz88/eCAwBqnzeTYUnV8VXZ6O3u?=
 =?us-ascii?Q?ig=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c9de77ce-cbd3-401c-bfc7-08dd1aca2237
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2024 16:29:21.8123 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x4Nnb8nHTNN6j3golxGg/WxayJGNHZf2qF9V0xlPqHHVZg2Pfb9BYMxkyPTVh8B3qWqqo363gNOulV6bVRVFcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6520
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

On Wed, Dec 11, 2024 at 10:26:15PM -0600, Lucas De Marchi wrote:
> On Wed, Dec 11, 2024 at 07:51:57PM -0800, Matthew Brost wrote:
> > On Wed, Dec 11, 2024 at 02:53:32PM -0800, Lucas De Marchi wrote:
> > > If device is wedged, the final run ticks update for the client should be
> > > skipped as it's already unmapped. Fix this pagefault when forcing a
> > 
> > Where does exec queue get unmapped on wedging a device?
> 
> it's the lrc we are trying to read: lrc->bo, with offset == timestamp.
> 
> I thought it was part of the the xe_gt_declare_wedged(), but I'm not
> following what triggers it - the only thing that should trigger that
> would be the xe_lrc_put() and the refcount reaching 0. Something is not
> adding up here, I will have to trace the destroy to see what's going on.
> 

Quick reached the same conclusion - accessing the LRC BO should be safe
until the final put, hence my question. It does appear something else
weird is going on here.

Matt

> Lucas De Marchi

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA7C4C87FCE
	for <intel-xe@archiver.kernel.org>; Fri, 25 Jul 2025 14:58:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6850310E20A;
	Fri, 25 Jul 2025 14:58:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RbWb8a2I";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E767F10E20A
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Jul 2025 14:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753455513; x=1784991513;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=H5h02Zq59NPCU2B8eRkYsNrmR6+e5hTel/dk6EuQDsg=;
 b=RbWb8a2I5NZg8ZsMTkWiLeDBahPiOhKH6reEGuIvXlZwNi/BDPXUMes/
 gZk+f2i3d09sOtmHJQtYnmHKJVnsTIeQ9t5sq5SJ9DLRNm8kF2nJPwT/8
 hEnm22oCejNaKQxdaFk4ImxNj3+Jf69UgT/vHiUFyA3zkJVNKUhKSyT7B
 YrrO983IACjMck/137Mi6UXfabHFb35AItpbJtnxoYU7eCRhHsv1Rt+Np
 kCrqQawhY5uwXgfxb/Hs7z6ONai5VH0dnW8idzATWRs+7Tpw6Q6cBGz3u
 FpVfoU15PUzy3489DW+FoJODlVix8qstt/F6RLLj/t9MA3zYF3P0M92MI w==;
X-CSE-ConnectionGUID: fN1JFJB7QkaatsMsBU91Aw==
X-CSE-MsgGUID: vwyk0eICSzGPBnBBbJRoaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11503"; a="58411707"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="58411707"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2025 07:58:26 -0700
X-CSE-ConnectionGUID: 6We8g3dcQTusKcgLYONa0Q==
X-CSE-MsgGUID: ChiT4Pz4SUyD1D1a0EkkHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="161724547"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2025 07:58:26 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 25 Jul 2025 07:58:26 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Fri, 25 Jul 2025 07:58:26 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (40.107.100.79)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 25 Jul 2025 07:58:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HZIen+Jthq34qVvpsSjfdZ3KmKbaLMPcVjjpbtpU1HSKI2uNQ2O/YrfUICOXQbqJI8hEmtMmZnvjaCrRRMfUxqQx3SyL9oLIVB0BheFU/I+pVIRL2XmWTkTdnVNQS4wByOdW5h3tF50amy6cHelx8ACnDmZ/fDwO75hXVrjSfdxT4HeCciTQpl0KT5YMp9gn3WQn6v7iIvUzv8av9p+LnPFYXi4Fl/WXmneOYAtScNU7j9fvGH4b1LI0V4fXhIWsTVxRIGLOz7wJyYBtOr3Q1HaFddCmQity0vdDYK3gSVOLIPMIl0eMWgwDK2DcCPCcKRraOd74J6N4gXIKwnDI7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0CjWp5YBJQ3Gof+FWmfQTFtWbcXPVRH2fDC+QOELLaM=;
 b=HILFP4gK74mFa47YEdQcWMgP+2Qq5D9Ov4MPk95U1C+08bDiawTWVW5EUveHBAt7R5TS4o8reiHy1hvFQAHTg/sotk2v6bVRQaXOnJ5eKUe6HC7Sx6lP2tgfn+tPlvo0oEWD/XICQB1jfK431NWP6aVrxfEi+0iotZjOx+iefmpuGEaTSDoIIG4I7NdzvDSypj02nNZKF7lDnDGkCXGXle8DJpd6wpHCe3VWXABnaXO8YBhP89hfa4Gt6XzNqS7MaNre+MdUbBy4HcDG8WsZKRIPEbdvcvrz24eXtRNe9tWq36NcI2+4W2p1VbfrltGx98ROKviAcbfSsX/KlAYwbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB8427.namprd11.prod.outlook.com (2603:10b6:806:373::19)
 by DS0PR11MB7621.namprd11.prod.outlook.com (2603:10b6:8:143::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.27; Fri, 25 Jul
 2025 14:58:22 +0000
Received: from SA1PR11MB8427.namprd11.prod.outlook.com
 ([fe80::b156:b61b:d462:b781]) by SA1PR11MB8427.namprd11.prod.outlook.com
 ([fe80::b156:b61b:d462:b781%5]) with mapi id 15.20.8964.021; Fri, 25 Jul 2025
 14:58:22 +0000
Date: Fri, 25 Jul 2025 10:58:18 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/devcoredump: Defer devcoredump initialization
 during probe
Message-ID: <aIObistOwsS5h2_6@intel.com>
References: <20250725065543.3827989-1-balasubramani.vivekanandan@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250725065543.3827989-1-balasubramani.vivekanandan@intel.com>
X-ClientProxiedBy: SJ0PR03CA0298.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::33) To SA1PR11MB8427.namprd11.prod.outlook.com
 (2603:10b6:806:373::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB8427:EE_|DS0PR11MB7621:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ff1b0ad-5bf8-421e-e501-08ddcb8bb322
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0ApdkOnleumh/WRlLjvSnB79ICbx6FSroUoHFVMZ55eIOmiAVawMte/KhXUt?=
 =?us-ascii?Q?GaDN7aq+312K5KzNc4/rHKPMEuEWpLJvd6T+W0K/AwBDOWNQMJC5CUDczgwJ?=
 =?us-ascii?Q?TIn5zVZEJf/nJATnDARKyPqt1GsFP7jMWtXT2uoqWltOP87q1VvZKsbLp+cy?=
 =?us-ascii?Q?aifO37VaBQSoYIZtTxQm928kSDu4ZC+kEtXMAgxrmYv82qXLDuUewHyjRWWg?=
 =?us-ascii?Q?BOSNMQ79BYN5JFpEAz3fBVzf973dra7lCZuo3Jxg2HhUrD/ex+XauuHaOBwb?=
 =?us-ascii?Q?r2Pa/LfYzSddZqYaPqp0CiFY095OrqD+P3i1uo4rX99uWgFoVIsBQf9htTy4?=
 =?us-ascii?Q?JgOokvsg14yLGi8t+1vA8pa+HtUdv6gc6mXlIDMO0kPI95uWf8vKpKm87TV6?=
 =?us-ascii?Q?lkEHVuANWVRcw1rllIrNctia707JBwPbfgvfzKfJRg0CPpdQx3oliQ6pztql?=
 =?us-ascii?Q?OQXF10wrSJ/uiLI9/iRry+xu+/f/g75fJNNZnCzAao2p5CJ8RYnHenl3zOba?=
 =?us-ascii?Q?/x/YpqyFrGu9gnmFBpF78PcUPz6fcVBXICQNdFJPlH/ffsJheGe3cx9ma9n2?=
 =?us-ascii?Q?hb140kcC7R845UVhIzfMUDhdg8Dmm+QLZR0uRZLyQBBeDRJqZkUu7r8ZzKnr?=
 =?us-ascii?Q?LJU4IN7EoZvvom8lCrw6UZ1dgsVWfReOa9sH1IxPQbc3CUhiL70XkgpU0wDV?=
 =?us-ascii?Q?7ObTddGgpk4CvlI9XCkv5gQYr5AQE4GPNRS2eTLXiZMNdFw+c6kDLAzgg0ib?=
 =?us-ascii?Q?0rLBG4xB2fa04Fj782EvgDtyz6MBGCDfRWwPZbVwgNZ4kP/R245/Ac6Sv4YW?=
 =?us-ascii?Q?2qGZ7Rw7UwZXY2SWtjYUWjePubd0OMmE+N7AvuuUnKltcg1ygv6S1ghnaLlb?=
 =?us-ascii?Q?Up2Nu8ASVaIuwzejFTVx0WVTv9/ateFOl4vFYsL6LybP2z6KcOwej4LobabQ?=
 =?us-ascii?Q?eu6Rg51y6dTBfJJ/uVc/Xstpkvbnnn4jE2QnlOL+hWsCnkxqVPpNcniPx2rX?=
 =?us-ascii?Q?xtG1y1S9L1k8xfhoYhr4DLTbQ8531I+aThDqB1OAsed/WXmzqXVXtk85OGbJ?=
 =?us-ascii?Q?Q8iz0wUhKLz4UttCoyBiyzKazZhezvAucw3a3+abMpzwPD+KR7lSd6FtUGA9?=
 =?us-ascii?Q?olbQH2kCUKuCvC8Tw1zYkI5hH1BeMLQy9VJqN4qSk1yLc6sF6RPXqJpE71uV?=
 =?us-ascii?Q?QLdKvJEdV7pZv+TFEEIYSjx3dS8FoArI0DXAhV0JK7YA9dnfjY7FFv9BA+P0?=
 =?us-ascii?Q?iBXg8NosFUQPZdvrupUOHmPHensv+tlpvupTutBIpX7v9lirsOlLYa7g8CJd?=
 =?us-ascii?Q?KtcYVBlXYENTCx8+AqbljuiqSqr86X/VXtQMWaWWOI6niTzMLml9TmQu3iCL?=
 =?us-ascii?Q?Bj0cQiwpLS5Z4Y+TfjCMgTcgPrmIsWoVuCOGKtvF+x47BV+dg1XCSFBt7o+u?=
 =?us-ascii?Q?SLLkNk2dib8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB8427.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?H/6l3DdSNjisAAMrFjLBNaEipTd+giDaA8gbTQE7bQSl2ItgGjrUCQ3IBLQL?=
 =?us-ascii?Q?sikdbWt26mS1j5wabHQTzberBJG6/ubKv52xbpvIjV5MQ2cUg+/L8Fqk0cYb?=
 =?us-ascii?Q?Raicp0BmvJ/wwq1nwaRHPzKqYNlesjmVecuAifWcA6ARq3OGIDfRbMoMbS7Y?=
 =?us-ascii?Q?9++HZn53QvlGdt6PKE2yU6SFy/u9fJ8j3q87uvwVtZCD4ZI5qv/vYUAp2Cj+?=
 =?us-ascii?Q?3qGF+cpFFlFlg0DbrI/wag45pyiIeZH9W5eNVaCujNzAEEVzVo74PDsp6E6f?=
 =?us-ascii?Q?JZmpNt8JS2x2ZWtcmaEYdkHfGnqsZRPJr89DMAgDhxHcsYsVugdPxdkBAOu+?=
 =?us-ascii?Q?EIGlH2g1cFaYiIC04EQbGJuG+MaVKRIEtPGHbTnPpWIKA/6TqX4L3S77Ipw6?=
 =?us-ascii?Q?IGqv4EqWbcHyDqgFJyOEjHjM/KcNphxsiuZDi7NlCnYhz4W1AUN7E582yGwu?=
 =?us-ascii?Q?12/lj3JrpjkimCHNJB6Sk2mSiXSyuo3xUT8OKAPq+14fMX8a4/TUJQtZPBz0?=
 =?us-ascii?Q?00Qi8mFXYmqBQoPiZ8gzGronJruaHkKn7jaDsuipYlxZLtIRs6RBDFkHz9H+?=
 =?us-ascii?Q?rWmboOObv+jvrjK72lvkTS4MaCiekdXBz8+c5wQad7HtbkXAhcAHXA/yYXxI?=
 =?us-ascii?Q?k8B7t5OXTJZgn0HHHzhSzEL+t21M0sJSVh3ODpsRHUr1/vQTqZtMzt46zVBj?=
 =?us-ascii?Q?+Djk7mH0znq3RAh0tN8TmQImbg1WIYOyBjEyX8fm3R2GH1zrnxXzfmYfTWDd?=
 =?us-ascii?Q?dGOLZ8DdWZIzC684eNjnmSusv7BXDuvO7fGIAD/6pvIYYfysX8rUv/92uxQw?=
 =?us-ascii?Q?IuaOVEM6JMxTSiS2bL+QqLTNxs2od605JGrhvO58cyGk4u32vnsYPfceDHsd?=
 =?us-ascii?Q?3wubhnmSV0L2skXP1ilrw+x7vsNc8gbcceNRsMyvHOmM5dN7spKZRWpMU8zB?=
 =?us-ascii?Q?uayB8IdGym+5zI0JYIpsjFFwCpE1C6auhXoIlKOzU21F7wq2Ip3zyBxQDfzD?=
 =?us-ascii?Q?e/y4ylm85Kn8GMtLwhTrTHkpmI1ZcwHY0dG7afrGydVW9C7YK4TtUaFuD/dC?=
 =?us-ascii?Q?MADUmw7D9R6Jwv7ycH7LdWJ0Mers6Yi/1gHTkTNAd4sm1zncKwl5dzbF9Ler?=
 =?us-ascii?Q?5M1Vxo4QNAbfOJyLdvaiDpmZmYhZ2eahSlyo5I8HQ3FQCiK8GDXWezvDLSha?=
 =?us-ascii?Q?Cxj9hfW3cxZ+M+uzbV+figE9gUvlcsGidsUWQWCgLkTViJH1bp5tmbebdoGY?=
 =?us-ascii?Q?nDFm7zei8mmvy4yrPxfo372Tb8Q2suAa+nttTtE/ksgRWPR9R6q0fCbKp6nP?=
 =?us-ascii?Q?DOtKmBscEnXuPIg9ncCr2vlQCksUpESYc1O8egs5tCGbUJPADzLfU22gjNzR?=
 =?us-ascii?Q?3vWg60qB/8YLxc8EouZUn7xg2SWzoWZlbUTYDujihrNl7N3cTiZTaGsiIhax?=
 =?us-ascii?Q?7iKYACbgofo2nhbYzu8M9ymyvh7C0ckeFmzg6ADp+XRIhLXWcGuSzpTlvsRf?=
 =?us-ascii?Q?bGgoiJ1i+04IiZ88XJVeoMdfoItE54ixJQiZrObaIcN+vovcV5n7w9t9xPWk?=
 =?us-ascii?Q?0+ORnZgmpEMenKhZQmN7V55nfUoaZYiPVzkfGaGl?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ff1b0ad-5bf8-421e-e501-08ddcb8bb322
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8427.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 14:58:22.5514 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n0Zw8UfYJ6i33HIzBnqPok5iRUUWihC+nsU5cKahHBEPsf2c/iOt/7xLYCPFvT1QhreYxbO0/7gBUdqg8q6pxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7621
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

On Fri, Jul 25, 2025 at 12:25:43PM +0530, Balasubramani Vivekanandan wrote:
> Doing devcoredump initializing before GT though look harmless, it leads
> to problem during driver unbind. Because of this order, GT/Engine
> release functions will be called before xe devcoredump release function
> (xe_driver_devcoredump_fini) leading to the following kernel crash
> because the devcoredump functions might still use GT/Engine
> datastructures after those are freed.

I agree on moving this initialization a bit further, but I'd like
to have a commit message that explains the problem a bit better.

looking to xe_driver_devcoredump_fini it is just a dev_coredump_put()
so, it is not reading anything on the gt... not triggering the
__xe_devcoredump_read().

So, please explain the flow that is causing the below's error better.

> 
> BUG: kernel NULL pointer dereference, address: 0000000000000000
> Workqueue: events_unbound xe_devcoredump_deferred_snap_work [xe]
> RIP: 0010:xe_engine_snapshot_print+0x47/0x420 [xe]
> Call Trace:
>  <TASK>
>  ? drm_printf+0x64/0x90
>  __xe_devcoredump_read+0x23f/0x2d0 [xe]
>  ? __pfx___drm_printfn_coredump+0x10/0x10
>  ? __pfx___drm_puts_coredump+0x10/0x10
>  xe_devcoredump_deferred_snap_work+0x17a/0x190 [xe]
>  process_one_work+0x22e/0x6f0
>  worker_thread+0x1e8/0x3d0
>  ? __pfx_worker_thread+0x10/0x10
>  kthread+0x11f/0x250
>  ? __pfx_kthread+0x10/0x10
>  ret_from_fork+0x47/0x70
>  ? __pfx_kthread+0x10/0x10
>  ret_from_fork_asm+0x1a/0x30
> 
> Fixes: 4209d635a823 ("drm/xe: Remove devcoredump during driver release")
> Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index d04a0ae018e6..ae48cd3c7bf0 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -821,10 +821,6 @@ int xe_device_probe(struct xe_device *xe)
>  			return err;
>  	}
>  
> -	err = xe_devcoredump_init(xe);
> -	if (err)
> -		return err;
> -
>  	/*
>  	 * From here on, if a step fails, make sure a Driver-FLR is triggereed
>  	 */
> @@ -889,6 +885,10 @@ int xe_device_probe(struct xe_device *xe)
>  	    XE_WA(xe->tiles->media_gt, 15015404425_disable))
>  		XE_DEVICE_WA_DISABLE(xe, 15015404425);
>  
> +	err = xe_devcoredump_init(xe);
> +	if (err)
> +		return err;
> +
>  	xe_nvm_init(xe);
>  
>  	err = xe_heci_gsc_init(xe);
> -- 
> 2.34.1
> 

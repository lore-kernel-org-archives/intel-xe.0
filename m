Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBF0DC47258
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jan 2024 16:55:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C6C010E95B;
	Thu, 11 Jan 2024 16:55:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 982DF10E979
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jan 2024 16:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704992139; x=1736528139;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=GtRqs3cZjpoYyzPOFxJzEj9t9m/HuNR7WVT3x3s0Uc4=;
 b=UgRWIP5BHp+gy1l7uo4+5XsfB0pYNOROEROpd2URS1zixzfgQm44b7nz
 jcbT1iyodm7lj80uw7rn6MvYA1A3PybYuOnV5U4vXVMFvEbQf7cejMjNI
 WOO1v6omIjwm7UYJjBT3Ya+hCAIJAAKxLPJVjeVpaPv8VAKUQexn3izfu
 hFaCXCotezmG8FdH7BZj0FxqXt/Sv4YQ5QSVRwO83r5/dqYqSZ8L8hc57
 K31uP7WsWI2RqfxB4yrWJGmbEFiM+KqhiOlc+6Z439e7hVkQSMjo+0XuK
 dk+7hrL/z5PtliZpTkU+29CyOZGkgu3Wcyyx5cCqjqBFTqJkKXnIwJKOa g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="463197178"
X-IronPort-AV: E=Sophos;i="6.04,186,1695711600"; d="scan'208";a="463197178"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2024 08:55:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="732281628"
X-IronPort-AV: E=Sophos;i="6.04,186,1695711600"; d="scan'208";a="732281628"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Jan 2024 08:55:40 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 11 Jan 2024 08:55:40 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 11 Jan 2024 08:55:39 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 11 Jan 2024 08:55:39 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 11 Jan 2024 08:55:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XbrXGGvxgpoWZCnG6Fv3EIVMKX7K7Z4ZI7/m+NXygSHunxv4w9132nUOkuqCIuotRgTLmEwQkv+dpgSXc/OuSSdQ96HuvOH4gbLI/Nm6QPrJ966Ir//CQepoQAbetKChdXtBLmIIJIM72q/WisH4+xskuGf1O/7wv4HrJB9X1owGMiBA+BvVzZBpooOFxYezYr1x9W+nj8JMR6v8zKn2Tk6ilOT7XEC26EtuyWt9svy4AD0YYNX+6iQ9ye2k5AKf4o0rQVeNT2Nggh39napGNpqVuxNl3u9XvRbJBpRn2MCMs0TRDSwT/SaY+G4ytZxS4bdT/nwo4dDwCFoeK8LU+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MaujTiMU65moWsZpxk7NnD73Upr3XfAMqkGJcpplnGM=;
 b=eZsP/y3Uud0AmATTnDvsDiDvXfhr0bVqLVlysk4CyX6e2bPpJE/4ongoTRmjhovRe0Rq68v8oqJn7NCgLkckVOwcyLNHtQPuBwaox/p/V83KvdkzwipviWwSrHNSVHCc115z4lQiAz4Y7wSMR1qsBw9G2jP+TLshS+AeT0CnR5xxiEZ54mZ5oM0+q6SeO45Zm6NtSlAm+Bnqdn8Kywd4ZtUIR8WK4K0PBuXkWlq4ScD676fxV0muwCg4JGT6eyl+q40PBrNRL211a+aVVV0cmvBabnwWIRnkOPvH6f4SbRl0d4zyl3QmsU4nT5geDUBwSH/UGJXgMgSIkNrIHu9qLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by BL1PR11MB5493.namprd11.prod.outlook.com (2603:10b6:208:31f::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.21; Thu, 11 Jan
 2024 16:55:36 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda%4]) with mapi id 15.20.7181.019; Thu, 11 Jan 2024
 16:55:36 +0000
Date: Thu, 11 Jan 2024 16:54:19 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH] drm/xe: Add DRM_XE_LOW_LEVEL_TRACEPOINTS
Message-ID: <ZaAdO8A4xB/LHOEm@DUT025-TGLU.fm.intel.com>
References: <20240105164530.1328374-1-matthew.brost@intel.com>
 <nzbnpizowkvrsb2g62aashk5ne7kicycifa6kuvrvbgqvznrht@crh6l4ruujnh>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <nzbnpizowkvrsb2g62aashk5ne7kicycifa6kuvrvbgqvznrht@crh6l4ruujnh>
X-ClientProxiedBy: BY5PR16CA0025.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::38) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|BL1PR11MB5493:EE_
X-MS-Office365-Filtering-Correlation-Id: 49f21965-8cba-4366-1978-08dc12c621e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qmA0gywNl0KQTHRw6IW+RKo6jNXSqAMPWklKLv+JcDMXfIm7GP+rUeMQpTjIqkV4ut8lqfFxPiSHvUyd4dw+4AEGEKAlZ+TvlEmNuCsuL4pY0v1SazsbQN2qTQ/Lhpt6zRkRHh/QDuqgd3znUFlfsAfntD5q0LBUUocwYbXEGptlfkb50DZTktduZy9UA3qQ6M28AJncKya/Xxr5P4X80cyLL8+Sfk9u1guB7JY8QReNNKNFjVkPKURgGZG+fmy16z/IzyjcEJB47gbyma4OA0l+y4KmQxtOL3aCPXaAYh6piAoBdxHmC/E9EOMF+9i9JT3EhsdxFhAgoqmFF8tYGZ6XnZCfkmgUW1vLk+VVo0HwaD4Qnyxyh5lxgrRBDPOZqmyiLqckGTM1uYvArm7x5xbRkIQU0YPpEoF5LV4wqZ1ABvO3AsRzh94ct6sbUHGqG4qfYIe+agI/xNOCtpiN72rKnJ3Ig+bi2prmI1UB2IbNtXNV8n+2mQL2PBakf6rwObX0iIUFeNgfEqVhlAil0ecVNFiox0W69s5ZOGP+JS4v2XCYmlAAjCvXTA6BZY9S
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(366004)(39860400002)(376002)(346002)(396003)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(30864003)(4326008)(6862004)(8676002)(38100700002)(316002)(5660300002)(6506007)(6512007)(2906002)(6636002)(6666004)(8936002)(66556008)(66476007)(66946007)(66574015)(26005)(44832011)(478600001)(6486002)(83380400001)(41300700001)(82960400001)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?qjeOP4EjawLkJHv9kByxWZpaioqdzoP6cuiCbWc/5OS2P7+/RMOs5SeNgY?=
 =?iso-8859-1?Q?+7R3GTKVUyhhk+AYvc8Q95ysCBq0EXfxlEDC1rpfDmlmw8dTPdd6L/iDz9?=
 =?iso-8859-1?Q?prMDvFnh6O1p7qMp2TH21GKdoCH96UKZT5XvxaV24HfgBWgKWCxA5aF+wi?=
 =?iso-8859-1?Q?87YPa0MgJt0SSQOPSu4cgFayLTCKtY+iOzL+A2yFtDB1R/LVXGgByU4mmz?=
 =?iso-8859-1?Q?YAVzdn6hrHN10uUcKa9+DCJw4E8y5nnzCj58W0Cs42J8L+aInUdWrPEWzo?=
 =?iso-8859-1?Q?v002MGCdzFChVO421baZ3U6MVmjNF9m8j87g97nT0RM64ejfVCRJBwRw4T?=
 =?iso-8859-1?Q?bqnjXclYMYi4cjegpAiomqRUQazM8KwQb7z8Qm4j1+Wq7XcgRWm0liAlYv?=
 =?iso-8859-1?Q?KgWM4vpRMw8ehQBgB2c2x1fNndp1Bbz14nxjfGDi9bELGftkgDioewsm1H?=
 =?iso-8859-1?Q?pQDGlQJCLVZlJ7iYCCjDi6zk+hnn6RF4or4G7xZaBTXa3UpA8nBesaq6D+?=
 =?iso-8859-1?Q?0wkkqOdtJUrepILRrxsTAjZvD/sEgHQxrk7Zv8Gw9bCcU1QXesp7PXsLqV?=
 =?iso-8859-1?Q?YXvB8nju+7ojfYtQCs62YSk4sMWcXn0+sEjRqCdCIIpbQMPytVJgE1zQH0?=
 =?iso-8859-1?Q?QLtuUKT9eAI/QOOidDaOTe1GQHN3+qKj7Nlv/56zkwQzJyHTh9P244Zp91?=
 =?iso-8859-1?Q?QRU/DQXfWgxuY1FxRjJd6U63kjol6/kkdTb+g/76hDUhQSXL6m44ulBwz4?=
 =?iso-8859-1?Q?gKyf/CK+unB71bpA83Fo12l/mz5wk5gOZLpE2v4Lk37m1QY9Y9O3AigvtV?=
 =?iso-8859-1?Q?bslN8CsW8Jdl0DWmN84XAPRHTH5yReHCnbEFj/xT4/hHls/2IAvPzOioq/?=
 =?iso-8859-1?Q?zDAu02gaRwmptyeOKOHF5vrsmPJi/SBQAo86ltv8Mv3Cn6pdJU//6wtqRH?=
 =?iso-8859-1?Q?lcLeLN+stIg3wh+Wqe8YX4PFMiyfH46QWeRquS4rdYPZKy6wN4nM81z4Ru?=
 =?iso-8859-1?Q?yJ4coyGLcdX/O+3KHiDlfac6NndrhMvXlVNVsznmhYLI3KqWASDw7geOkZ?=
 =?iso-8859-1?Q?AnNYK7zV5NwobMd7fq4zY+xArHTZPgT8hoh8jfoVot8JEWf3b4kyT+In5x?=
 =?iso-8859-1?Q?Or/AohqA5xWrAHHwphEYYbGhPyHpOwZTrtLp0SdhE1bqKW+1Cg1/xfeEBN?=
 =?iso-8859-1?Q?/FJVBsn55Sby5bWYJpYJmlDUNJlZd3y8MGwLNEVTriJEnrtxaje2JaqcSg?=
 =?iso-8859-1?Q?6DHJULZjeoF+KIzRNfX1rb261PeW/VZYjfC5gSXyDI9Y6jKUaaM6u0A091?=
 =?iso-8859-1?Q?Ad09jerzl9u7lQeUXMDM/hp32MkG3ZKzAlRYp2ZL37hNE7EelbqRQz/MgU?=
 =?iso-8859-1?Q?tj5qdMPJ756E5VzdZMLrLf3vFZB7strK+gZe96Ti8y+xsiIeWMXDzt3J9x?=
 =?iso-8859-1?Q?gOmZyCsigQrW94boXq4Hk9cpyQmem9gdO3oUfcPq6X9szm6PtixcYDjIqf?=
 =?iso-8859-1?Q?XptMcQd2B/okTKGgD8YV/nn2F8yVB/iqv5bF5v9cMU5PDxn2R4bmmSahd1?=
 =?iso-8859-1?Q?SeZPE/VGqQmMGKpChyoNw6PdN4WaepoOPHvbAV6xKKJ/jRp03MW7Ud5obC?=
 =?iso-8859-1?Q?BV08OX9m/z32nAJuOevsI2CmnkuCFWMInlbkFRODyTvhX8p5cwI7o7kA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 49f21965-8cba-4366-1978-08dc12c621e1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2024 16:55:36.2247 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WH6DS61wBknPQjwpRFXeyFptmr8rNV3TWnx87zA6/DtHOVW99ZylH+IzDgbxg6m5z2lYMJhFB7sye0L+r3lArA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5493
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Jan 11, 2024 at 08:52:03AM -0600, Lucas De Marchi wrote:
> On Fri, Jan 05, 2024 at 08:45:30AM -0800, Matthew Brost wrote:
> > Trace events are uABI. The Xe trace events currently implemented are
> 
>  ^^^^^^^^^^^^^^^^^^^^^
> 
> Reference needed and from all previous discussions I've seen, this is
> debatable because of the way tracepoints are implemented: tools should
> read what are the supported tracepoints for the running kernel and read
> the format it uses before blindly using it.
> 
> If it was simply UABI and couldn't change like it's implicit here,
> moving it behind a config option wouldn't really change that.
> The distro may have chosen to enable that config and end
> users making use of that.
> 
> Just looking at the latest pull requests for 6.8, I see several
> tracepoints changing signature without regard to uabi.
> 
> 2dd6e29a3ea8 ("svcrdma: Update some svcrdma DMA-related tracepoints")
> 848760a9e701 ("svcrdma: DMA error tracepoints should report completion IDs")
> c13fbb7de2fc ("bcachefs: Improve would_deadlock trace event")
> f6e70c59edee ("nfs: print fileid in lookup tracepoints")
> 

This is based on past experience of changing some of the i915
tracepoints only to have that change reverted. 

> > developer only and subject to change. Hide all Xe behind
> > DRM_XE_LOW_LEVEL_TRACEPOINTS so these are free to change going forward.
> 
> I'm not against moving them behind a more advanced config option,
> but the justification above would need to be reworded.
>

I'll just change the wording.

Any input on Gustavo Sousa of adding another macro? I'm against it.

Matt
 
> Lucas De Marchi
> 
> > 
> > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> > drivers/gpu/drm/xe/Kconfig.debug |  10 +
> > drivers/gpu/drm/xe/Makefile      |   4 +-
> > drivers/gpu/drm/xe/xe_trace.h    | 339 +++++++++++++++++++++++++++++++
> > 3 files changed, 352 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/Kconfig.debug b/drivers/gpu/drm/xe/Kconfig.debug
> > index 549065f57a78..a8785e71e224 100644
> > --- a/drivers/gpu/drm/xe/Kconfig.debug
> > +++ b/drivers/gpu/drm/xe/Kconfig.debug
> > @@ -105,3 +105,13 @@ config DRM_XE_USERPTR_INVAL_INJECT
> > 
> > 	 Recomended for driver developers only.
> > 	 If in doubt, say "N".
> > +
> > +config DRM_XE_LOW_LEVEL_TRACEPOINTS
> > +       bool "Enable low level trace events"
> > +       default n
> > +       help
> > +         Choose this option to enable low level trace events.
> > +
> > +	 Recomended for driver developers only.
> > +
> > +	 If in doubt, say "N".
> > diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> > index 53bd2a8ba1ae..9d33e6975ba0 100644
> > --- a/drivers/gpu/drm/xe/Makefile
> > +++ b/drivers/gpu/drm/xe/Makefile
> > @@ -129,7 +129,6 @@ xe-y += xe_bb.o \
> > 	xe_sync.o \
> > 	xe_tile.o \
> > 	xe_tile_sysfs.o \
> > -	xe_trace.o \
> > 	xe_ttm_sys_mgr.o \
> > 	xe_ttm_stolen_mgr.o \
> > 	xe_ttm_vram_mgr.o \
> > @@ -142,6 +141,9 @@ xe-y += xe_bb.o \
> > 	xe_wa.o \
> > 	xe_wopcm.o
> > 
> > +# trace support
> > +xe-$(CONFIG_DRM_XE_LOW_LEVEL_TRACEPOINTS) += xe_trace.o
> > +
> > # graphics hardware monitoring (HWMON) support
> > xe-$(CONFIG_HWMON) += xe_hwmon.o
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
> > index 95163c303f3e..7163ac9b8eae 100644
> > --- a/drivers/gpu/drm/xe/xe_trace.h
> > +++ b/drivers/gpu/drm/xe/xe_trace.h
> > @@ -21,6 +21,7 @@
> > #include "xe_sched_job.h"
> > #include "xe_vm.h"
> > 
> > +#if defined(CONFIG_DRM_XE_LOW_LEVEL_TRACEPOINTS)
> > DECLARE_EVENT_CLASS(xe_gt_tlb_invalidation_fence,
> > 		    TP_PROTO(struct xe_gt_tlb_invalidation_fence *fence),
> > 		    TP_ARGS(fence),
> > @@ -597,6 +598,344 @@ DEFINE_EVENT_PRINT(xe_guc_ctb, xe_guc_ctb_g2h,
> > 			     __entry->tail, __entry->_head)
> > 
> > );
> > +#else
> > +#if !defined(TRACE_HEADER_MULTI_READ)
> > +static inline void
> > +trace_xe_gt_tlb_invalidation_fence_create(struct xe_gt_tlb_invalidation_fence *fence)
> > +{
> > +}
> > +
> > +static inline void
> > +trace_xe_gt_tlb_invalidation_fence_work_func(struct xe_gt_tlb_invalidation_fence *fence)
> > +{
> > +}
> > +
> > +static inline void
> > +trace_xe_gt_tlb_invalidation_fence_cb(struct xe_gt_tlb_invalidation_fence *fence)
> > +{
> > +}
> > +
> > +static inline void
> > +trace_xe_gt_tlb_invalidation_fence_send(struct xe_gt_tlb_invalidation_fence *fence)
> > +{
> > +}
> > +
> > +static inline void
> > +trace_xe_gt_tlb_invalidation_fence_recv(struct xe_gt_tlb_invalidation_fence *fence)
> > +{
> > +}
> > +
> > +static inline void
> > +trace_xe_gt_tlb_invalidation_fence_signal(struct xe_gt_tlb_invalidation_fence *fence)
> > +{
> > +}
> > +
> > +static inline void
> > +trace_xe_gt_tlb_invalidation_fence_timeout(struct xe_gt_tlb_invalidation_fence *fence)
> > +{
> > +}
> > +
> > +static inline void
> > +trace_xe_bo_cpu_fault(struct xe_bo *bo)
> > +{
> > +}
> > +
> > +static inline void
> > +trace_xe_bo_move(struct xe_bo *bo)
> > +{
> > +}
> > +
> > +static inline void
> > +trace_xe_exec_queue_create(struct xe_exec_queue *q)
> > +{
> > +}
> > +
> > +static inline void
> > +trace_xe_exec_queue_supress_resume(struct xe_exec_queue *q)
> > +{
> > +}
> > +
> > +static inline void
> > +trace_xe_exec_queue_submit(struct xe_exec_queue *q)
> > +{
> > +}
> > +
> > +static inline void
> > +trace_xe_exec_queue_scheduling_enable(struct xe_exec_queue *q)
> > +{
> > +}
> > +
> > +static inline void
> > +trace_xe_exec_queue_scheduling_disable(struct xe_exec_queue *q)
> > +{
> > +}
> > +
> > +static inline void
> > +trace_xe_exec_queue_scheduling_done(struct xe_exec_queue *q)
> > +{
> > +}
> > +
> > +static inline void
> > +trace_xe_exec_queue_register(struct xe_exec_queue *q)
> > +{
> > +}
> > +
> > +static inline void
> > +trace_xe_exec_queue_deregister(struct xe_exec_queue *q)
> > +{
> > +}
> > +
> > +static inline void
> > +trace_xe_exec_queue_deregister_done(struct xe_exec_queue *q)
> > +{
> > +}
> > +
> > +static inline void
> > +trace_xe_exec_queue_close(struct xe_exec_queue *q)
> > +{
> > +}
> > +
> > +static inline void
> > +trace_xe_exec_queue_kill(struct xe_exec_queue *q)
> > +{
> > +}
> > +
> > +static inline void
> > +trace_xe_exec_queue_cleanup_entity(struct xe_exec_queue *q)
> > +{
> > +}
> > +
> > +static inline void
> > +trace_xe_exec_queue_destroy(struct xe_exec_queue *q)
> > +{
> > +}
> > +
> > +static inline void
> > +trace_xe_exec_queue_reset(struct xe_exec_queue *q)
> > +{
> > +}
> > +
> > +static inline void
> > +trace_xe_exec_queue_memory_cat_error(struct xe_exec_queue *q)
> > +{
> > +}
> > +
> > +static inline void
> > +trace_xe_exec_queue_stop(struct xe_exec_queue *q)
> > +{
> > +}
> > +
> > +static inline void
> > +trace_xe_exec_queue_resubmit(struct xe_exec_queue *q)
> > +{
> > +}
> > +
> > +static inline void
> > +trace_xe_exec_queue_lr_cleanup(struct xe_exec_queue *q)
> > +{
> > +}
> > +
> > +static inline void
> > +trace_xe_sched_job_create(struct xe_sched_job *job)
> > +{
> > +}
> > +
> > +static inline void
> > +trace_xe_sched_job_exec(struct xe_sched_job *job)
> > +{
> > +}
> > +
> > +static inline void
> > +trace_xe_sched_job_run(struct xe_sched_job *job)
> > +{
> > +}
> > +
> > +static inline void
> > +trace_xe_sched_job_free(struct xe_sched_job *job)
> > +{
> > +}
> > +
> > +static inline void
> > +trace_xe_sched_job_timedout(struct xe_sched_job *job)
> > +{
> > +}
> > +
> > +static inline void
> > +trace_xe_sched_job_set_error(struct xe_sched_job *job)
> > +{
> > +}
> > +
> > +static inline void
> > +trace_xe_sched_job_ban(struct xe_sched_job *job)
> > +{
> > +}
> > +
> > +static inline void
> > +trace_xe_sched_msg_add(struct xe_sched_msg *msg)
> > +{
> > +}
> > +
> > +static inline void
> > +trace_xe_sched_msg_recv(struct xe_sched_msg *msg)
> > +{
> > +}
> > +
> > +static inline void
> > +trace_xe_hw_fence_create(struct xe_hw_fence *fence)
> > +{
> > +}
> > +
> > +static inline void
> > +trace_xe_hw_fence_signal(struct xe_hw_fence *fence)
> > +{
> > +}
> > +
> > +static inline void
> > +trace_xe_hw_fence_try_signal(struct xe_hw_fence *fence)
> > +{
> > +}
> > +
> > +static inline void
> > +trace_xe_hw_fence_free(struct xe_hw_fence *fence)
> > +{
> > +}
> > +
> > +static inline void
> > +trace_xe_vma_flush(struct xe_vma *vma)
> > +{
> > +}
> > +
> > +static inline void
> > +trace_xe_vma_pagefault(struct xe_vma *vma)
> > +{
> > +}
> > +
> > +static inline void
> > +trace_xe_vma_acc(struct xe_vma *vma)
> > +{
> > +}
> > +
> > +static inline void
> > +trace_xe_vma_fail(struct xe_vma *vma)
> > +{
> > +}
> > +
> > +static inline void
> > +trace_xe_vma_bind(struct xe_vma *vma)
> > +{
> > +}
> > +
> > +static inline void
> > +trace_xe_vma_pf_bind(struct xe_vma *vma)
> > +{
> > +}
> > +
> > +static inline void
> > +trace_xe_vma_unbind(struct xe_vma *vma)
> > +{
> > +}
> > +
> > +static inline void
> > +trace_xe_vma_userptr_rebind_worker(struct xe_vma *vma)
> > +{
> > +}
> > +
> > +static inline void
> > +trace_xe_vma_userptr_rebind_exec(struct xe_vma *vma)
> > +{
> > +}
> > +
> > +static inline void
> > +trace_xe_vma_rebind_worker(struct xe_vma *vma)
> > +{
> > +}
> > +
> > +static inline void
> > +trace_xe_vma_rebind_exec(struct xe_vma *vma)
> > +{
> > +}
> > +
> > +static inline void
> > +trace_xe_vma_userptr_invalidate(struct xe_vma *vma)
> > +{
> > +}
> > +
> > +static inline void
> > +trace_xe_vma_usm_invalidate(struct xe_vma *vma)
> > +{
> > +}
> > +
> > +static inline void
> > +trace_xe_vma_evict(struct xe_vma *vma)
> > +{
> > +}
> > +
> > +static inline void
> > +trace_xe_vma_userptr_invalidate_complete(struct xe_vma *vma)
> > +{
> > +}
> > +
> > +static inline void
> > +trace_xe_vm_kill(struct xe_vm *vm)
> > +{
> > +}
> > +
> > +static inline void
> > +trace_xe_vm_create(struct xe_vm *vm)
> > +{
> > +}
> > +
> > +static inline void
> > +trace_xe_vm_free(struct xe_vm *vm)
> > +{
> > +}
> > +
> > +static inline void
> > +trace_xe_vm_cpu_bind(struct xe_vm *vm)
> > +{
> > +}
> > +
> > +static inline void
> > +trace_xe_vm_restart(struct xe_vm *vm)
> > +{
> > +}
> > +
> > +static inline void
> > +trace_xe_vm_rebind_worker_enter(struct xe_vm *vm)
> > +{
> > +}
> > +
> > +static inline void
> > +trace_xe_vm_rebind_worker_retry(struct xe_vm *vm)
> > +{
> > +}
> > +
> > +static inline void
> > +trace_xe_vm_rebind_worker_exit(struct xe_vm *vm)
> > +{
> > +}
> > +
> > +static inline void
> > +trace_xe_guc_ct_h2g_flow_control(u32 _head, u32 _tail, u32 size, u32 space, u32 len)
> > +{
> > +}
> > +
> > +static inline void
> > +trace_xe_guc_ct_g2h_flow_control(u32 _head, u32 _tail, u32 size, u32 space, u32 len)
> > +{
> > +}
> > +
> > +static inline void
> > +trace_xe_guc_ctb_h2g(u8 gt_id, u32 action, u32 len, u32 _head, u32 tail)
> > +{
> > +}
> > +
> > +static inline void
> > +trace_xe_guc_ctb_g2h(u8 gt_id, u32 action, u32 len, u32 _head, u32 tail)
> > +{
> > +}
> > +#endif
> > +#endif
> > 
> > #endif
> > 
> > -- 
> > 2.34.1
> > 

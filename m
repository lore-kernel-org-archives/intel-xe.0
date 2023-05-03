Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CB1FC77B7F
	for <intel-xe@archiver.kernel.org>; Wed,  3 May 2023 15:28:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52D9710E128;
	Wed,  3 May 2023 15:28:24 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D58C89349
 for <intel-xe@lists.freedesktop.org>; Wed,  3 May 2023 15:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683127702; x=1714663702;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=wQX93a2OFZPEb3q+71mNEvowg+N6UlNevKnHPTRbSJ4=;
 b=ldFNiJ7hR1cc+CE5zJLdM7Hr+Kc95I3Qt0aNdJEWi1ZSPFnA6ZNWtNfX
 KVQ/ajaGOZiT8lWCZHZJNHD2c4fHCejP924oquxP4iE24hLzKim4n9ekH
 VilXK8BUpMid/4zLpqixzy/jhEDXfZYK29EktOmneeqPFWbPCpXgzQVjX
 2e0uRfo42hdqSxd5SN7J/6Kifs4ERT/NxRiF5Ebg33heq2r992/gvLN6e
 Lbb/F78GUMTjMPGcR/nFOJd1suE5zvQu4DhS0mHRhcqYCDCQKW4qTbG8e
 VuGRY2vxiZAT12Nj75863zOVfB+62BbhGnwyhbinRdWstqaaujAAg98xX A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="376748629"
X-IronPort-AV: E=Sophos;i="5.99,247,1677571200"; d="scan'208";a="376748629"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2023 08:28:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="729376489"
X-IronPort-AV: E=Sophos;i="5.99,247,1677571200"; d="scan'208";a="729376489"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga001.jf.intel.com with ESMTP; 03 May 2023 08:28:01 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 3 May 2023 08:28:01 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 3 May 2023 08:28:00 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 3 May 2023 08:28:00 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.109)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 3 May 2023 08:28:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ecrO80HY7j5YhW5krBqqZZmDVEtlR3VbTKXDcAz+1xcgEHl1/KiS4fhzdZjkMD5Mdy7+8NgauPQ2cdhIy1RupJJ1zSjEEzK9VRhk3HYRNUakqR2+m0JCZmebP/8oIuQCUkFC2V63L3+TLnDzCOZQks+xcyigQghpagJ86G9Ks/HErWdJ3e5BEmdB6Px1UeO29pTQ9CoaN5XJodXeZKODbpz/mt5TpCztvL4HBntF+bMluIVINF1t8s5EVGJJr5k6F470SuJxBaDSFbHuxd9hiOWpRT/09IHGUlVtGExUf/bcGXdMiFfzPzfFVfXN3nw8Ak2cU37qkGu3/zan+ICSOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V6PH+xDu4jfGsK4mzh/Mn3o5gPtqE8nwUCYw2jO/4cE=;
 b=nDeU1SFDgLhjxYr9GGygvXIPXd/wdAMXheocXnBrR56AcEGx+UO4sApKPaNKQSy8HJhzZUXEQDDw+POODTjxkdIwhzST8r4zOBGkJ0UENvMpm+7tVSAuuOOBa1CmlrisKFhninKoi56IWCQ9qaUhzufG70KFx9eVsk/UMs9bOaDhv68GJvyL7MJqv6oM7OkY5wssIQxXiWH8UzfiitnRCHeaXp3GL1ukasXXJCRrGZeG+ZxKtV9WQNDV35MCWWxjGBEfY0xn068TDc69MTdsw7InChqSj5u1yDvQNVdQ+9z5mXyGDJfmle+mPnlAh4d0L0FWL8Fk3djR74zm1NzcFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY8PR11MB6961.namprd11.prod.outlook.com (2603:10b6:930:5a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.31; Wed, 3 May
 2023 15:27:59 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%4]) with mapi id 15.20.6340.030; Wed, 3 May 2023
 15:27:58 +0000
Date: Wed, 3 May 2023 15:27:41 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <ZFJ9bXFtcYAH1mwF@DUT025-TGLU.fm.intel.com>
References: <20230502001727.3211096-1-matthew.brost@intel.com>
 <21f0b213-c307-2fbd-1312-74b26287d352@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <21f0b213-c307-2fbd-1312-74b26287d352@linux.intel.com>
X-ClientProxiedBy: SJ0PR05CA0002.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::7) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY8PR11MB6961:EE_
X-MS-Office365-Filtering-Correlation-Id: 085ed1d5-7a5d-4ee7-bd8a-08db4beaf9c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Zz0BhCGoEX3F2Ilsr0gEcdLjJkJ5pklNt5hARegkL8SLCCbp1gJ3zYYlnY/5l70gvds72uuUy/MFG1VOvKIsoWSevT7PedlVPg6TCUbIJs/DTzBDN3lvcjPwSVsAe207Wp9f+MIT1KPpv2DCHputKq3vz7D8HHKgpZS7+epEUzVtV0h5GIlUQ7g06c7PGtpNesUx9ddbOeq8KjceXw4Gw2Wqg1b9Z0j3dYNBsbAj3nKAS1hASHj7UN0BqBk5ONMAzsogXp1Dk6gS/1xuv3GSjE05zHhjKQ+r463WLOjwZK1B7tvWEN4F1D7qAMFqxFofJFxXx9V90zNIPTVNG31B/C4ZfLtv5xchLIVkCZDvuJeQsYfNrns0GYcq2xCqZmMkeBHZb5u7j784BZtlYiKaWCs7CWVAYrMRCWciLRN4iNmpnM8fYLHF1NDnX5YdFXu2bhFzS5xdMyL6BAwGwiXgwK3/uEczBV4C2nNZmhJap2oWkbRRBrldQRTiiAWbdT43FubkNPTvy7ZY/f6ivE3Uuw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(39860400002)(136003)(396003)(346002)(366004)(451199021)(53546011)(66574015)(83380400001)(186003)(6916009)(66476007)(66556008)(4326008)(41300700001)(2906002)(8676002)(8936002)(44832011)(66946007)(5660300002)(6512007)(6506007)(316002)(82960400001)(26005)(86362001)(478600001)(966005)(38100700002)(6666004)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?+1PJ7XDq3iO1aeqSY6yrm1ZgmAS7qa4Rk6/imhgZWSxzOX4nwIo+ouWuUa?=
 =?iso-8859-1?Q?Glkluyhy6NgxJATsyIY46UJbLKYKLQO0o+o53Dt6v6HbguoJ5xh0TFpPzh?=
 =?iso-8859-1?Q?6SKGgJXUoKUN3ns5x3vM1ZoS7hX+ntUIz+3bwMBHFcHT+2+5xH3zfb75Tz?=
 =?iso-8859-1?Q?zt8KypMFaoUnziWFTtGnk7pcwO0M/BPMYvl3PPwo7e421KEe9WnKAjtaPd?=
 =?iso-8859-1?Q?ilM8LbF4KdBe6rdAx6AAFB6Di/9tc9eyMqyHF2k2hPk++OETwxAVvo9E6L?=
 =?iso-8859-1?Q?wl/iPu1878yHtbHlxGSL4LEngWqwZFBeL6XoZf44FqssrnGDXkgCK5V7TX?=
 =?iso-8859-1?Q?XUDIHhT7a0GbTnet9SGeO6m3qAa4ATEw1MHKFmSTGiz3b/ybWcVLmuA8p/?=
 =?iso-8859-1?Q?+RjqPS0M5ckEW8RwK1zOFV6cqdzqS2Jpq7oUtYjymXS+0McTYeYxtTbbIc?=
 =?iso-8859-1?Q?kKCY7rd3w0Rc5SdXfr/LBucGFfd++EBTk6f2QFfXG4FPEMLeS2mRiOB7Fx?=
 =?iso-8859-1?Q?+sScRLywZ3DN/KJtYrUixZy+qc0nH4K2wTB/oJLxCY0RmkghE0KP3DUJ2M?=
 =?iso-8859-1?Q?r8JHy53oIM87YYiU3GlPY1zYG76OWumxndcOggWlxMtj1UM3zqJEiQInDi?=
 =?iso-8859-1?Q?7e2s/l2jhjuXOe6xs33CqZA5iYqVnZ6prxvMzk4XH6bOe+qld/4mTh1MV5?=
 =?iso-8859-1?Q?vyB/ilsIGO2rWagcxNNdh1Cwc+AGC/kndadqyqAcC/Xf8P37HAIIqPER/c?=
 =?iso-8859-1?Q?925vOxWyuK2R5i/m2JWd3FgaJ8LBsD+er/RHd2EwXG17yxSSwpj7yVNQHX?=
 =?iso-8859-1?Q?XBJkCVQ/XTNtMNFfJ9s7XQm/KxZawCwVKxCfGJ9dCY5wwcWjB/NzZCD8ql?=
 =?iso-8859-1?Q?n7X21LFcWuUe7jzDLM4SqN8QhAXtCnm1nPFptCvhtbaWK5EtZWoiHZUlqx?=
 =?iso-8859-1?Q?pkEgceOZU2RXGFTv/CWyemAsYipbaA6rWgVH421Ia1AuLogKwXbadMOYYA?=
 =?iso-8859-1?Q?yF+2hh/wfsGEu7nGEMv8WHD7/+iuZweYoxwOU9xXCDSAov4g3TL62Fuhp3?=
 =?iso-8859-1?Q?CkGM/sDYfPsPVj9iMHtSb2hFp4xbb1itN9kBK6fyvQ5fVGhDQpkeQjYs/k?=
 =?iso-8859-1?Q?k6Huun6awD2GCTmDOa2X55hyvPEUAHtAV94uC6507FXWkAJerdC72mC3W6?=
 =?iso-8859-1?Q?6E7vmU0YndcM5tMoHXwIIRwXczS/0li/ygkSE2jWrXR4T1RwCxwJA36h6w?=
 =?iso-8859-1?Q?309Y+PT7E1yzC0gpGYmd2gx5LlpTVc88VDu2+8CYJ0MC6B7WXPC1UdN1t0?=
 =?iso-8859-1?Q?ZOjv23fMwIech3oX8kCVJ79VhU4r3ldAlnqATK/mBMYqIxuO85G33GlFYX?=
 =?iso-8859-1?Q?efPSR49JSCmHKhTYIRe3Lyyk7jhaRxCtzfiwcBClvXdVZYvanzC9r5mNtT?=
 =?iso-8859-1?Q?MyN85R0kDguIvLtOjvWBdPYtUc+eK+cETYe903UNGyUtLjL80EN/lLKeeo?=
 =?iso-8859-1?Q?TkGx2TC4pt1seIzvpRbfx3fYu3IFBJMyinTJuu7OxIr0fa71iEAU/HZx+h?=
 =?iso-8859-1?Q?+XN507hik3HrJqaG5MMhXZf8gIjf+/SmDIiZwPkRcQPMiFWmJCYh2HkMYR?=
 =?iso-8859-1?Q?SEp9JlvwPYO+r27nW6an7fmnnxME+tHdqYxSDiRn68s+CW/D7WrBUJ8A?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 085ed1d5-7a5d-4ee7-bd8a-08db4beaf9c1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2023 15:27:58.8941 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yJDgxJdIVg5+lErTk2kOmNLVl+qJ2B2jWwRPkMzPhvaDcOwpPk/QcgMSWck4qrJjHRKqvCyfqg6+t5X0FP/gZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6961
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 00/31] Upstreaming prep / all of mbrosts
 patches
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

On Wed, May 03, 2023 at 02:37:14PM +0200, Thomas Hellström wrote:
> Hi, Matthew
> 
> On 5/2/23 02:16, Matthew Brost wrote:
> > Series includes:
> > 
> > - DRM scheduler changes for firmware backends (1 to 1 entity to scheduler)
> > - LR workload story
> > - VM LRU handling
> > - GuC doorbell submission
> > - Basic GPUVA
> > - Sparse binding support
> > - GPUVA + extobj + drm exec (collaboration with dakr + Francois Dugast)
> > - GPUVA + userptr (minimal, more can be once Nouveua has userptr)
> > - Fix fencing rules for compute / fault mode
> > - Remove async worker for VM + error handling updates
> > - Kernel doc for VM bind
> 
> It would be beneficial to the reviewer if  you could make separate series
> where applicable with links to previous discussions and add information
> about whether all design issues /discussions were resolved or if anything
> was remaining and a brief guidance as to what is in each patch of the
> series.
> 

Basically nothing has been reviewed, sad but this where we are. Most of
this code is 2-3 months old too, I can't maintain like 5 branches out
code and keep everything stable, hence 1 large series. Going forward,
I'd ask for timely reviews, I make an effort to review code actively and
if I'm asked review code I do it in a timely manner. In case, I think
the team is just going to have get through this. Again this isn't truely
upstream either, we just need to get this our repo. Any of the common
code will also go through reviews on dri-devel before we go upstream.

Matt 

> /Thomas
> 
> 
> 
> 
> > Series is not fully ready for upstream and some of these things need to
> > get merged upstream first but overall it is largely correct and
> > certainly step in the right direction. Based on its size and the fact it
> > took me 8 hours to rebase this today I'd say let's get this tree and
> > fixup everything else in place.
> > 
> > Minor uAPI breakage, IGT series:
> > https://patchwork.freedesktop.org/series/117177/
> > 
> > gitlab link:
> > https://gitlab.freedesktop.org/drm/xe/kernel/-/merge_requests/344
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > 
> > Christian König (1):
> >    drm: execution context for GEM buffers v3
> > 
> > Danilo Krummrich (2):
> >    maple_tree: split up MA_STATE() macro
> >    drm: manager to keep track of GPUs VA mappings
> > 
> > Matthew Brost (28):
> >    drm/sched: Add run_wq argument to drm_sched_init
> >    drm/sched: Move schedule policy to scheduler
> >    drm/sched: Add DRM_SCHED_POLICY_SINGLE_ENTITY scheduling policy
> >    drm/xe: Use DRM_SCHED_POLICY_SINGLE_ENTITY mode
> >    drm/xe: Long running job update
> >    drm/xe: Ensure LR engines are not persistent
> >    drm/xe: Only try to lock external BOs in VM bind
> >    drm/xe: VM LRU bulk move
> >    drm/xe/guc: Read HXG fields from DW1 of G2H response
> >    drm/xe/guc: Return the lower part of blocking H2G message
> >    drm/xe/guc: Use doorbells for submission if possible
> >    drm/xe/guc: Print doorbell ID in GuC engine debugfs entry
> >    maple_tree: Export mas_preallocate
> >    drm/xe: Port Xe to GPUVA
> >    drm/xe: NULL binding implementation
> >    drm/xe: Avoid doing rebinds
> >    drm/xe: Reduce the number list links in xe_vma
> >    drm/xe: Optimize size of xe_vma allocation
> >    drm/gpuva: Add drm device to GPUVA manager
> >    drm/gpuva: Move dma-resv to GPUVA manager
> >    drm/gpuva: Add support for extobj
> >    drm/xe: Userptr refactor
> >    drm/exec: Always compile drm_exec
> >    drm/xe: Use drm_exec for locking rather than TTM exec helpers
> >    drm/xe: Allow dma-fences as in-syncs for compute / faulting VM
> >    drm/xe: Allow compute VMs to output dma-fences on binds
> >    drm/xe: remove async worker, sync binds, new error handling
> >    drm/xe/uapi: Add some VM bind kernel doc
> > 
> >   Documentation/gpu/drm-mm.rst                 |   43 +
> >   drivers/gpu/drm/Kconfig                      |    6 +
> >   drivers/gpu/drm/Makefile                     |    4 +-
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c   |    3 +-
> >   drivers/gpu/drm/drm_debugfs.c                |   41 +
> >   drivers/gpu/drm/drm_exec.c                   |  248 ++
> >   drivers/gpu/drm/drm_gem.c                    |    3 +
> >   drivers/gpu/drm/drm_gpuva_mgr.c              | 1779 ++++++++++++
> >   drivers/gpu/drm/etnaviv/etnaviv_sched.c      |    5 +-
> >   drivers/gpu/drm/i915/display/intel_display.c |    6 +-
> >   drivers/gpu/drm/lima/lima_sched.c            |    5 +-
> >   drivers/gpu/drm/msm/msm_ringbuffer.c         |    5 +-
> >   drivers/gpu/drm/panfrost/panfrost_job.c      |    5 +-
> >   drivers/gpu/drm/scheduler/sched_entity.c     |   84 +-
> >   drivers/gpu/drm/scheduler/sched_fence.c      |    2 +-
> >   drivers/gpu/drm/scheduler/sched_main.c       |   88 +-
> >   drivers/gpu/drm/v3d/v3d_sched.c              |   25 +-
> >   drivers/gpu/drm/xe/Kconfig                   |    1 +
> >   drivers/gpu/drm/xe/regs/xe_guc_regs.h        |    1 +
> >   drivers/gpu/drm/xe/tests/xe_bo.c             |   26 +-
> >   drivers/gpu/drm/xe/tests/xe_migrate.c        |    6 +-
> >   drivers/gpu/drm/xe/xe_bo.c                   |  100 +-
> >   drivers/gpu/drm/xe/xe_bo.h                   |   13 +-
> >   drivers/gpu/drm/xe/xe_bo_evict.c             |   24 +-
> >   drivers/gpu/drm/xe/xe_bo_types.h             |    1 -
> >   drivers/gpu/drm/xe/xe_device.c               |    2 +-
> >   drivers/gpu/drm/xe/xe_dma_buf.c              |    2 +-
> >   drivers/gpu/drm/xe/xe_engine.c               |   50 +-
> >   drivers/gpu/drm/xe/xe_engine.h               |    4 +
> >   drivers/gpu/drm/xe/xe_engine_types.h         |    1 +
> >   drivers/gpu/drm/xe/xe_exec.c                 |  117 +-
> >   drivers/gpu/drm/xe/xe_execlist.c             |    3 +-
> >   drivers/gpu/drm/xe/xe_gt_pagefault.c         |   84 +-
> >   drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c  |   14 +-
> >   drivers/gpu/drm/xe/xe_guc.c                  |    6 +
> >   drivers/gpu/drm/xe/xe_guc_ct.c               |   12 +-
> >   drivers/gpu/drm/xe/xe_guc_engine_types.h     |    9 +
> >   drivers/gpu/drm/xe/xe_guc_pc.c               |    6 +-
> >   drivers/gpu/drm/xe/xe_guc_submit.c           |  398 ++-
> >   drivers/gpu/drm/xe/xe_guc_submit.h           |    1 +
> >   drivers/gpu/drm/xe/xe_guc_types.h            |    4 +
> >   drivers/gpu/drm/xe/xe_huc.c                  |    2 +-
> >   drivers/gpu/drm/xe/xe_lrc.c                  |    8 +-
> >   drivers/gpu/drm/xe/xe_migrate.c              |   31 +-
> >   drivers/gpu/drm/xe/xe_pt.c                   |  198 +-
> >   drivers/gpu/drm/xe/xe_sync.c                 |   26 +-
> >   drivers/gpu/drm/xe/xe_sync.h                 |    2 +-
> >   drivers/gpu/drm/xe/xe_trace.h                |   20 +-
> >   drivers/gpu/drm/xe/xe_vm.c                   | 2567 +++++++-----------
> >   drivers/gpu/drm/xe/xe_vm.h                   |  135 +-
> >   drivers/gpu/drm/xe/xe_vm_madvise.c           |  125 +-
> >   drivers/gpu/drm/xe/xe_vm_types.h             |  324 ++-
> >   drivers/gpu/drm/xe/xe_wait_user_fence.c      |   43 +-
> >   include/drm/drm_debugfs.h                    |   24 +
> >   include/drm/drm_drv.h                        |    7 +
> >   include/drm/drm_exec.h                       |  115 +
> >   include/drm/drm_gem.h                        |   75 +
> >   include/drm/drm_gpuva_mgr.h                  |  759 ++++++
> >   include/drm/gpu_scheduler.h                  |   29 +-
> >   include/linux/maple_tree.h                   |    7 +-
> >   include/uapi/drm/xe_drm.h                    |  128 +-
> >   lib/maple_tree.c                             |    1 +
> >   62 files changed, 5543 insertions(+), 2320 deletions(-)
> >   create mode 100644 drivers/gpu/drm/drm_exec.c
> >   create mode 100644 drivers/gpu/drm/drm_gpuva_mgr.c
> >   create mode 100644 include/drm/drm_exec.h
> >   create mode 100644 include/drm/drm_gpuva_mgr.h
> > 

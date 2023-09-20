Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4071CCD4933
	for <intel-xe@archiver.kernel.org>; Wed, 20 Sep 2023 23:12:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D238C10E44B;
	Wed, 20 Sep 2023 23:12:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A46AB10E44B
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Sep 2023 23:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695251571; x=1726787571;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=XswI3r0S1aTOniz1vgs3/0hkeMNUOzSFnDPQx/nvfkM=;
 b=EPCpE0GfrDpqxZQNvFxetbwSV1mWMr0Njk+QKMvTKXDYulU2YqEaaLKB
 /QygIMZU3HL/asFqmjzZ1e5xLv/acRMO7S0AR3MgMRdMK+GMDFtSix9xS
 o7cNWfNf/iqgfJrhRSmASySZx0CZSOnxZlhPiHwc0dAKq9roWOytmjJFh
 xuwWmiTIHRkj2w6Ope/bF/D8EM7v9H5VPx70jraT47pozuIrCOqraGD17
 gNSQqcnc9uQpZwjhfCVQIyVxvDb4pHMNhScRGVRRmrLTqYgVZ+DGI2h0l
 YXLblNk9GgafGH2wLuLSlsu2ruQMHrS/SmxP67VkJXNhTWy06PJjKYs7B A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="384202213"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; d="scan'208";a="384202213"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2023 16:07:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="696507631"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; d="scan'208";a="696507631"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Sep 2023 16:07:31 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 20 Sep 2023 16:07:31 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 20 Sep 2023 16:07:31 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.177)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 20 Sep 2023 16:07:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aeZkXa4pFRUMfrak/nWi1Al3LCMD2JmeH1BcJ7i8URGqOc0TZXNlMCkceCMJgaW+gXeuenjJUjQXS+mpc5vCLlAiv4/mSXjGn9q/8V6KlFs4VULP0o483C5i+MSemkatkRG5C1CrBqyijfqo7bOdNFVpjsIAD53qpWmz9rb9YIKWqcFKFA7QH2s/bVJn3iDD5tT1tc9ZAXHmY80M+oQUyoYwjFFk91Xdi50je3H9XOVt4+bzILWryimDpR+/BkQ8KU5UDKr40cC/aCmHeL1mertIkWiIQh86SJibyaTu5aPI262CudVFmaBMXJR0ssDbcGMoLT31NKbXaw1rWSLjNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MvvsOEqSk3DBPbcbOGQwQYX/SNlc21s//i0+jAxd/ss=;
 b=H2338ynNIvb7DAbeIVBgm/69EPI/o8ebR2kj7SDzjAWWukVIsPrdiuMXzZnTteAx2IosoHbx/AVKZ24KC3nvjQVafBx1QP8ZPtoDqLCvnZYfu1S8jfQgI3tilanPHLQXnhv57JzpCazw4VAh7rrtNcqwYxjnnlBoAC+p4c63c5GXxJ7wjzu/+3KLqRuj/O3Yj1BdU6ogQ/z6CsTsRo+AzFhsnbqlXa/C4ZrfLpY5lKsnwuEzdp9y57ucQLqIBp9abjR2lEdJAQvWcraAMxcWDx0qhUxVAvdGCNno8pI28rzwtceW5DLqWz23QK0blv9ueHPF9582iw97MIKACPkeCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 IA0PR11MB8400.namprd11.prod.outlook.com (2603:10b6:208:482::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.20; Wed, 20 Sep
 2023 23:07:25 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66%4]) with mapi id 15.20.6768.029; Wed, 20 Sep 2023
 23:07:25 +0000
Date: Wed, 20 Sep 2023 16:07:22 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Message-ID: <20230920230722.GL233750@mdroper-desk1.amr.corp.intel.com>
References: <20230920192940.135004-1-rodrigo.vivi@intel.com>
 <20230920211455.GJ233750@mdroper-desk1.amr.corp.intel.com>
 <ZQtqFOiWZTlNkTSi@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZQtqFOiWZTlNkTSi@DUT025-TGLU.fm.intel.com>
X-ClientProxiedBy: SJ0PR03CA0120.namprd03.prod.outlook.com
 (2603:10b6:a03:333::35) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|IA0PR11MB8400:EE_
X-MS-Office365-Filtering-Correlation-Id: 38f2be05-86b8-4852-d29e-08dbba2e5a78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mUIqUIaFo0t8OnErK02OP7DyNx25PnjVxNTWaMXlQSqIaKpf42PPfbiTE7o4G6HYg623oPbRGmggCn3TyOoi9DhykJXoD4wL8G0PEyLHOnAQ5tM5D0o0oy9xxRpPT2lvZ/dhteRObrvUaivRXLoJmLK4l2tl1D0VbqKJM0RLbDZf8Xx3dwbUiyuYgYboNhK0CgOKDOq4K7IRI8Fqt5SOvqDdUlfhxoRW6rIk8YElmxdQHAXeIkTR0BMjER+V0VC5X0t1du+7eFYpGq18S+Ki7Z8NBt98QMIV8jmqEQV5AHDCqQ7G/t2WmU2uFN9SBJkUmiXprYAqipkFZfv+Kclx1d52eKazKp3XbfkCAZFt8P+BIqC3Mzqh+oxG+OG4FPf6aR5UiJf1ZBmge9Nbf37IQ9Z+UBIiIeuIdJ/kWi5EqTLTS2F15RLHaQjjczmbHIW5YibkYiT4yzgOqbF3qs6OPgSwcgz8xXcTPjDFODfGw9e9WSE5fJTDFi1/vVI9jEMCBUKsiPz16KfDstUyOEmbh6asFH9CQhreK8Wv3FyywZJvYqPHC2FLLSqrLUnZdgSu4zyNvKzODRXHL0QqbQv0LA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(396003)(136003)(376002)(346002)(451199024)(1800799009)(186009)(6666004)(6506007)(6486002)(6512007)(478600001)(2906002)(83380400001)(966005)(1076003)(26005)(41300700001)(6636002)(316002)(66556008)(66476007)(66946007)(5660300002)(6862004)(8676002)(8936002)(4326008)(33656002)(38100700002)(82960400001)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?H0HsoimXNGQZsWvo/1UgNinQiEsG178PDfZkfvLTF1X6zspbnyO5CDVHHO/I?=
 =?us-ascii?Q?4tvKN9ApO914SONBmAd/w5Wf80b+3s9/M/fHVaY1ST8+4WkJlYH87doX9vHv?=
 =?us-ascii?Q?f4CksBrKHJuZCU9ZGwdkvmTA4vPzO32gno7ZY1Dbj8sFb2uv9K+mxsAjDDud?=
 =?us-ascii?Q?8iYcoGIUtq8D5eXydHFFCgreAS5KMGMruCsDI7R5GvqCDSzk9EcQjGhXXmzo?=
 =?us-ascii?Q?JNBKzbyymJ0fTXvazipaiNQUVHJdFtm4ncjx1l+ie7X7QmoebsQXVSSvYwwE?=
 =?us-ascii?Q?TfCFW+xeSel51CCQculcJURTUsxGECSc2MPq3isQHXS8MRhFsqTQzFRyBavY?=
 =?us-ascii?Q?/puni2oK7XAgaIcdDJhM6bls+IwhdsTQAykZXtIXV4CWh1nQ+KZn4/c/XL2H?=
 =?us-ascii?Q?9ISjaLltQ4Vt50WSqaeEvL/dq1ctyrd/TFNjoMeJ3xR5lplyQFSGiiAF/xga?=
 =?us-ascii?Q?7W+vLNUZi3aD9efYWimPGbOIqWwy7MACU7nHoQNKYClH9lTORbWJfEboBHko?=
 =?us-ascii?Q?Gg6rxOJkHF3Z9pnn+xU1/k33UUIMJMduaNZweuLfSHmjOr/2+LXhQEF/TtQS?=
 =?us-ascii?Q?amucvBPMMcBVAQ+bj5iGE95VMxYU1ZooguTo1fNuh02YfmdqKoEZzyFFKlnQ?=
 =?us-ascii?Q?kvc5niALABCkwVherQGkRPCtb6xm/BI2TjEinb0+01awq7P2eYsF5WNDsZIK?=
 =?us-ascii?Q?8QzEUEgz/M4G7Ku7ZY6C48bXOUeVB56x+wTamOptQf1Dl5K5IdTgyprF/BmE?=
 =?us-ascii?Q?dpXnpAgDI/qnLUe0fie3Odovi/8cmlsEhTCKuA7Gnh1P5lO2zt7daFmyI5ed?=
 =?us-ascii?Q?WZDpC5aCW4LRO+a29QjbL1rp5bBvO0xLw0swN8ozQ5r0qYL/AbV/9siKPqts?=
 =?us-ascii?Q?jfyzwz13QJeOW3R6SWJ9ll7lyPQc9g53dy+YDoDiqpdFtTDZQ8r7X6K5qdeI?=
 =?us-ascii?Q?vFVKK1UmJVdm3HX+iT21YhV3gfm3PlnyNvXdBD+rE9V5XcLHee3YpP4hmbcZ?=
 =?us-ascii?Q?EKg9ilxQL+e/ZX3B4NZsnxxHTTGFe7ScqkjXBTqcMDMW6bHTqSnsU4qFh5TS?=
 =?us-ascii?Q?S5sM3LqMN44RejG7TPTiXjYCLBgPd0Gj2wbqOHHGXHTWQb4dah1Ezi2mdaUa?=
 =?us-ascii?Q?7twWtKPuiircg5U2odljgkusFrqAKA70PLZDaVH4+72/zcoquLSgPTJJA61a?=
 =?us-ascii?Q?dBEM4nblufAvEgLYMF2k1GoQDuwsXVgJxZ/FyZOqUcn7HrKKciYrwywwCNyT?=
 =?us-ascii?Q?qbOYTyCpMEWvDLzk2vggXMA7WcHS9UEm+VO29ksX7crtFaKyVOTioyJUypzz?=
 =?us-ascii?Q?yzZgHejVpxhmMDyZ2VzONgvKeDz8LpRsW7MwJ6KL8iDX3POJ2Re2er1Vc1OW?=
 =?us-ascii?Q?NKF6d6843iuRQMEehBoCSN86YN1cYk7UG6A4F2gizbKq79EeYd7MBZSbAFgL?=
 =?us-ascii?Q?s9oNcCOLCqgFaL+IBIreFI4dAjn2hWf139vIImU3Y/xQruZFgxUSw4PkjQ2C?=
 =?us-ascii?Q?cn5ojErFwHNirOrKDfFKajro/JbX7QGk09on8eTuHzDS9+9DshA2RhB2Buak?=
 =?us-ascii?Q?WSc+cTVRXNSRMon0r/YO11ONhgMX5vIlRFFMInzEUSyifQd+P3joxpJaomME?=
 =?us-ascii?Q?tg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 38f2be05-86b8-4852-d29e-08dbba2e5a78
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2023 23:07:25.3486 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uttEglY1tbawNEs7eZT5gtaYkhCJ22jRi4Oyaho6BfLhBcWHTl/vkitYd8ug7jy/XeOCgnevXfuCkDhqsSzx/AXLTowQzvZJj8tTs5v7eE8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8400
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 00/20] uAPI Alignment - take 1 v2
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
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Sep 20, 2023 at 09:54:28PM +0000, Matthew Brost wrote:
> On Wed, Sep 20, 2023 at 02:14:55PM -0700, Matt Roper wrote:
> > As a follow-up to this series I just noticed one other uapi thing that
> > doesn't make sense:
> > 
> >         struct drm_xe_vm_madvise {
> >         ...
> >                 /*                                                                                                     
> >                  * Setting the preferred location will trigger a migrate of the VMA                                    
> >                  * backing store to new location if the backing store is already                                       
> >                  * allocated.                                                                                          
> >                  *                                                                                                     
> >                  * For DRM_XE_VM_MADVISE_PREFERRED_MEM_CLASS usage, see enum                                           
> >                  * drm_xe_memory_class.                                                                                
> >                  */                                                                                                    
> >         #define DRM_XE_VM_MADVISE_PREFERRED_MEM_CLASS   0                                                              
> >         #define DRM_XE_VM_MADVISE_PREFERRED_GT          1
> >                 /*                                                                                                     
> >                  * In this case lower 32 bits are mem class, upper 32 are GT.                                          
> >                  * Combination provides a single IOCTL plus migrate VMA to preferred                                   
> >                  * location.                                                                                           
> >                  */                                                                                                    
> >         #define DRM_XE_VM_MADVISE_PREFERRED_MEM_CLASS_GT        2                                                      
> > 
> > memory-specific stuff like madvise should be operating on tiles, not
> > GTs.  From a quick glance at the code, it seems to be comparing the
> 
> IMO we expose either GTs or tiless to the uAPI not both. This includes
> the query API, bind, madvise, etc...
> 
> If I had to pick one, I'd say we stick with GTs. Internal we then map GT
> to a tile if needed.

I don't understand why we'd want to do this; GTs are unrelated to memory
so it makes it confusing if userspace needs to pass in a
seemingly-unrelated identifier.  If we're not going to use the tile
(which at least roughly describes which pool of VRAM we want), then it
seems like a hardware engine would be a little bit less confusing as an
identifier than a GT; the hwe at least reflects how they're likely to
access the memory and is probably more aligned with the way userspace
code is thinking about things.


Matt

> 
> Matt
> 
> > value it gets against tile_count (which is good), but we still don't
> > want someone passing in a GT ID instead of a tile ID for something like
> > this.
> > 
> > 
> > Matt
> > 
> > On Wed, Sep 20, 2023 at 03:29:20PM -0400, Rodrigo Vivi wrote:
> > > v2:
> > > This v2 has 3 extra patches that was missing on yesterday's submission.
> > > But that aligns with the IGT series sent yesterday.
> > > 
> > > Also I'm glad that Mesa reacted super fast and we already have the MR
> > > ready that aligns with v1 sent yesterday:
> > > 
> > > https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/25300
> > > 
> > > Thank you Jose!
> > > 
> > > v1:
> > > As a result of the uAPI review efforts started by Thomas[1],
> > > we have identified many updates on our uAPI that would lead to
> > > breakage in the compatibility. What it is not acceptable after
> > > we are merged upstream. So, let's break it before it is too late,
> > > and start upstreaming a good, reliable and clean uapi.
> > > 
> > > Most of this work on putting these patches together for a single
> > > shot was led by Francois.
> > > 
> > > The IGT counter part of this series is available as well[2].
> > > 
> > > [1] - https://lore.kernel.org/all/863bebd0c624d6fc2b38c0a06b63e468b4185128.camel@l\
> > > inux.intel.com/
> > > [2] - https://lore.kernel.org/all/20230919142000.91363-1-rodrigo.vivi@intel.com
> > > 
> > > Ashutosh Dixit (1):
> > >   drm/xe/uapi: Use common drm_xe_ext_set_property extension
> > > 
> > > Francois Dugast (5):
> > >   drm/xe/uapi: Separate VM_BIND's operation and flag
> > >   drm/xe/vm: Remove VM_BIND_OP macro
> > >   drm/xe/uapi: Remove MMIO ioctl
> > >   drm/xe/uapi: Fix naming of XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY
> > >   drm/xe/uapi: Add documentation for query
> > > 
> > > Matthew Brost (4):
> > >   drm/xe: Fix xe_exec_queue_is_idle for parallel exec queues
> > >   drm/xe: Deprecate XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE
> > >     implementation
> > >   drm/xe: Rename exec_queue_kill_compute to
> > >     xe_vm_remove_compute_exec_queue
> > >   drm/xe: Remove XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE from uAPI
> > > 
> > > Mika Kuoppala (1):
> > >   drm/xe: Extend drm_xe_vm_bind_op
> > > 
> > > Rodrigo Vivi (6):
> > >   drm/xe: Kill XE_VM_PROPERTY_BIND_OP_ERROR_CAPTURE_ADDRESS extension
> > >   drm/xe/uapi: Document drm_xe_query_gt
> > >   drm/xe/uapi: Replace useless 'instance' per unique gt_id
> > >   drm/xe/uapi: Remove unused field of drm_xe_query_gt
> > >   drm/xe/uapi: Rename gts to gt_list
> > >   drm/xe/uapi: Crystal Reference Clock updates
> > > 
> > > Umesh Nerlige Ramappa (3):
> > >   drm/xe: Fix array bounds check for queries
> > >   drm/xe: Set the correct type for xe_to_user_engine_class
> > >   drm/xe: Correlate engine and cpu timestamps with better accuracy
> > > 
> > >  drivers/gpu/drm/xe/xe_device.c           |   1 -
> > >  drivers/gpu/drm/xe/xe_exec_queue.c       |  99 ++-----
> > >  drivers/gpu/drm/xe/xe_exec_queue_types.h |   6 +-
> > >  drivers/gpu/drm/xe/xe_gt_types.h         |   2 +-
> > >  drivers/gpu/drm/xe/xe_mmio.c             | 102 -------
> > >  drivers/gpu/drm/xe/xe_pci.c              |   4 -
> > >  drivers/gpu/drm/xe/xe_query.c            | 186 +++++++++++--
> > >  drivers/gpu/drm/xe/xe_vm.c               | 221 +++++-----------
> > >  drivers/gpu/drm/xe/xe_vm.h               |   1 +
> > >  include/uapi/drm/xe_drm.h                | 322 +++++++++++++----------
> > >  10 files changed, 440 insertions(+), 504 deletions(-)
> > > 
> > > -- 
> > > 2.41.0
> > > 
> > 
> > -- 
> > Matt Roper
> > Graphics Software Engineer
> > Linux GPU Platform Enablement
> > Intel Corporation

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation

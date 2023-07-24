Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BE20C001B0
	for <intel-xe@archiver.kernel.org>; Mon, 24 Jul 2023 15:16:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3CF510E0AB;
	Mon, 24 Jul 2023 15:16:32 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A91A310E0AB
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Jul 2023 15:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690211789; x=1721747789;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=AQfCDG6U6Hf40hP+flqOggNTalTRDryT4pNK9iVLzK0=;
 b=Wi8G+4pQGJtlYoIMzTGxvQWyUb8Vp3SYO+gvs1uoe9sbV9kbkHkSPl0G
 u+xqyAAJdwhR1W0ZnsOaHiRk7t62SqsOd9lGPUIPdzhJoNgrn6Ur1xYUt
 Gs5wZRv9XPC1DtT352Nv+trn/uFEqzpAfay44W6AZQMo4tjiVJtEmWLH0
 uqR8ggOqf8QYZ7ZN1RjQJqEIXCjUyEqEEmUq/dskc4JYbVkz2y0Y2jIhk
 QlylmZ3Rhh4mw2H9gbMQzHbuiNdHkQkmm3Z803O51XZzXrgD67DHdby9C
 8T4FkuBTs/9FoddmpHZKW38ifCaMZBc431vHA3mIZy3qL6Q/rRXF9PWrz w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="364930161"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; d="scan'208";a="364930161"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2023 08:16:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="728931223"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; d="scan'208";a="728931223"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga007.fm.intel.com with ESMTP; 24 Jul 2023 08:16:29 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 24 Jul 2023 08:16:28 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 24 Jul 2023 08:16:28 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 24 Jul 2023 08:16:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eIqAdu93wjmls5atl9AuoqfjVkD8wZRJDe0rN0t8KG6awFE8rxv9JK0JVSi9DX0D2lMtXbld9Lsj1Tm80oNJWnwjZAWQKTCEYycwSTCdc7YQSh+RRBRLfV73fEcWPJRyuGL1dtkH/iiufmcqj4UszNpEworjc/lpDan0z8Iv3YkGoJbHvEdhGMpliFigvu4u203g3IqIjzcp0zBZUIsULMnWHqgN2qBmzlqXxd6EEGVF4oas5R7fQZAOATzvGOTyM9nlO1yJDJylOVnih3TDOKHv8hnHiS3HAmNLMQpogczQB/7+TyjHHcaupkqTB7mRxjfb0xovn7hbSNbajizeEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ixl7myDv4PslXNeSxdBl0yhn4tnmSbeZlBx30Dz75ds=;
 b=abL7MSMPFRylgWLtNYye836jG43Vixb5aCwVXuAtaxerw5r1s0Lc7l/1erA7VA626QM682lTWXG0vN93FUgQ+JJdiV8b1Tmq1A4k9+sxlNexZr7yfkp+BU9EtpokQdh7CZ2nNhuhoCSiVbQofbqYOLjrtr/UyEUjcTiYr/i9CBzkh0Zt4E5VXY0Ar6I57m0ekMFpmNHJ2Ebay0g+VtBuFA0RF9YA9QCcb6Z6nwVkeZWxvhm+WtH87OIfA6Kjjfv4q9rRUmM2GulkkANQTIdDbroqulCuOB389dVlOOHiZwaJPOQYriSp/ap/SUG22VgBkJRh3xgR5CXOtqJirgof2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 DS0PR11MB7507.namprd11.prod.outlook.com (2603:10b6:8:150::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6609.32; Mon, 24 Jul 2023 15:16:21 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::de6b:b5a9:e542:b41]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::de6b:b5a9:e542:b41%5]) with mapi id 15.20.6609.031; Mon, 24 Jul 2023
 15:16:21 +0000
Date: Mon, 24 Jul 2023 08:16:18 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230724151618.GD138014@mdroper-desk1.amr.corp.intel.com>
References: <20230721175557.1513250-3-matthew.d.roper@intel.com>
 <t4z4llhy4g2kqz45utcucexv6hzh2gc6ktrndxjsgevi7fgmhz@e2euksrkr7i2>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <t4z4llhy4g2kqz45utcucexv6hzh2gc6ktrndxjsgevi7fgmhz@e2euksrkr7i2>
X-ClientProxiedBy: BYAPR05CA0036.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::49) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|DS0PR11MB7507:EE_
X-MS-Office365-Filtering-Correlation-Id: a4d4c8d3-59dc-4a14-1b17-08db8c58ef56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WOM1ghU2PFHfnIDwnO7pqbu0Ld7KluiHLE7oA4V6GF3XVwrHae0Qt9Is7OOWSMqY8Xsp6OhN52QNCHoMEJkMr8vj0xQuGvwMWWjp7rxp7JG1Vq+7MWtnYAtGapdXF8jHU8M2UOvJJ/JqZ5QdwV5dqiu/xqMpi7fpif2DFpPBFs7fruvv/Ba0ZFy2YpBHbONIly6M01AIkS08rlQHWVUJ1vcbZpBaJJYuaH9dBuK7Ib42VBgVPIOWJqKDjhcV36B+0dGq3V9KTkJQm6SzsRzS4KFyyUcHo3TC3jZE9cTmBsPmZE3XCMXRz2s1LA8/cd8GtNgwpBhV+Zby8GS0oQqxOqBKuxNXCy0f1PyM/3BG/gsmbFl9Wl8kwIhqWNOhdb3E7f4RCSXvxEkgQCvffslskjwJqjAEQhwYLCPfqc6U27RssuYtABxbhnkUfhU3s1z1WM34E09BvwUprby7ShQZimhi9RC5Yzas+WeEqDO0J7NfQejxPFf9AK9YBbsro48hRXil62PsHveXT0sFe9EuGlv5rDogvWk3lXsbsBbQeAwvj8AtKKtFihzo0awkboon
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(396003)(136003)(346002)(376002)(39860400002)(451199021)(186003)(2906002)(83380400001)(6636002)(478600001)(4326008)(66946007)(66476007)(6512007)(66556008)(6666004)(6486002)(41300700001)(316002)(86362001)(33656002)(5660300002)(26005)(1076003)(6506007)(38100700002)(82960400001)(107886003)(6862004)(8936002)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rpz56juepxxW1lwDxAH1uZS+RtEoQeSHtrJSIRknKwqpqkt4Z2EN4T4HJpt8?=
 =?us-ascii?Q?9CD3w+ZH3zqorL7uVAPBjitW4JGK08LEF0SzToLl68JcHEILKDeZNV6GuZ/W?=
 =?us-ascii?Q?TET357phOE+mjezGlej+q2GyQ2y/J3X4mzypD28BvpS/9e07yTGzkz5BbHOf?=
 =?us-ascii?Q?DVrUy/W7EwoTibB6betMU0dvMmz7rtHSVOH4QrdAvxs9hN9XRPToKkdjVGm2?=
 =?us-ascii?Q?3x+vykTgAFnRLDi27rd1w54zieHoeMarTB64YMqGwCIaYbeM+wVPSKqwnjZw?=
 =?us-ascii?Q?EpwUfujspXVOGtPStgPsGVpRzMzM8T8XRwsSpTYDbdy3c7ihc63DTRQijXK0?=
 =?us-ascii?Q?UGQmU55XUeq0ljhJEWlUHWD1SHCGe6WQwaeK6lFv18FTqQv1Dv91b4QWQIsE?=
 =?us-ascii?Q?k+pkXBZvsGiN0r7KO0rRHPi6Zjpn+KryZDEoL5cY1NeNtXMEaDfDCPRjd+SY?=
 =?us-ascii?Q?b877KvKdwgAiSjyPnyzpiX68V4ZIbt9a5qgvTHM5Vc7pEMiysDkPN8MXeSra?=
 =?us-ascii?Q?kfXyVdhPAqiAd8Eprav9XdMYJjZ0pan9iqgehz202L1zLFsLEo7AJkfFZTSD?=
 =?us-ascii?Q?EBWwrX65NjgTUbAOvGswvKbR9H51sxicsiDDLconLWhOuM6qC47571RIaeKJ?=
 =?us-ascii?Q?jdIgJw87zADspglN7sAEAf80THXFdxVZz+kG394tzPMNc51anphq5LYh+n8V?=
 =?us-ascii?Q?XQgavKPY0kH+Qc7UUSwwDxr/UV8BZFevgwX75q9tnFINnvip390gFvd7S+yT?=
 =?us-ascii?Q?j2gRjSRPved/bVTRj6wsD9eQGY7365g97eoAR9zv+yseuK0uvkjyv119hqMq?=
 =?us-ascii?Q?o/0H6MyMHotswS6ophpZ7TniDJP3Nb1MVRJ1QL1jpZEWoyo+geWXe559N3Fp?=
 =?us-ascii?Q?v3PlvYUXOnPRqUtr0FZGtyPuKd6WQaHBmGRcUmWSTEWCCFjUerVojM5Uj707?=
 =?us-ascii?Q?BpSJcAedMr6vdVS57ksPB/3hO8l/2ru/xmRHBdUnPMHx8XlkiRpo3L7MjExO?=
 =?us-ascii?Q?Hp0uCt1gjKn5zMxUshzVJqG2Lwlw419pZJYGQgmEl+MFFUnkS+KbwBnRCvf8?=
 =?us-ascii?Q?1W8H8hlPzXIzWco4j37WJDB6WrMw0NHeqMkazXx4X9rdFMNVoEFzB+nbtPor?=
 =?us-ascii?Q?ZVr3oWGA7Z1WKeOEUjBHhWLFenoob+InPGv7QSHKuFnvMiGN3Vj8bq8RD85+?=
 =?us-ascii?Q?DlhmbRFBLEcRPVQ5VMYGaqrAWjftrb08L9Cps+rfPEqO4B06vwfrqfj2BaRU?=
 =?us-ascii?Q?kHOEgBbFhZtRTxPxtVsLBhnyE588nCS5+j1U+E3uHvmwXBArGo1lwdlwtb6U?=
 =?us-ascii?Q?+3dcNc31rAH5DghffQ/qxEhkjfwVWjFkFfN41GY9QlpZlUsz3CT5C6DWTe9d?=
 =?us-ascii?Q?SF4wZXcV6FNQGPjbTIwbPDOlxserMtwVi/3/dKS/YEumBe4lSvnZ3+5zTcWz?=
 =?us-ascii?Q?BWk2d6N4jGEfKrvawHducWU0fMj/IJWMOeqCQSK/vP1cKwMIiS2YpPoy8OL+?=
 =?us-ascii?Q?t7aG/5PAv41PqmrI47rywAjyuqHEGbI7n4b9HYAkNQN5/wT7h8i4LbMj6165?=
 =?us-ascii?Q?1GRMBlmB1gritLl5q0iFClIpu3HOFYI1/1TZis7KetxRV+OUgIGolbmrYMYc?=
 =?us-ascii?Q?Hw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a4d4c8d3-59dc-4a14-1b17-08db8c58ef56
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2023 15:16:21.6697 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UaOTWWx5X4zMxzf9lO2KW9EeWgJFETb6Uz2RS5GFkksuIGgbWzgxUpnx4FQRU5QL1t6Y2AxOPtuYdMsAvtFeiLug0j7eV1eOugD1HkAHbmg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7507
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe/mtl: Map PPGTT as CPU:WC
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
Cc: intel-xe@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Jul 21, 2023 at 01:54:02PM -0700, Lucas De Marchi wrote:
> On Fri, Jul 21, 2023 at 10:55:58AM -0700, Matt Roper wrote:
> > On MTL and beyond, the GPU performs non-coherent accesses to the PPGTT
> > page tables.  These page tables should be mapped as CPU:WC.
> > 
> > Removes CAT errors triggered by xe_exec_basic@once-basic on MTL:
> > 
> >   xe 0000:00:02.0: [drm:__xe_pt_bind_vma [xe]] Preparing bind, with range [1a0000...1a0fff) engine 0000000000000000.
> >   xe 0000:00:02.0: [drm:xe_vm_dbg_print_entries [xe]] 1 entries to update
> >   xe 0000:00:02.0: [drm:xe_vm_dbg_print_entries [xe]]  0: Update level 3 at (0 + 1) [0...8000000000) f:0
> >   xe 0000:00:02.0: [drm] Engine memory cat error: guc_id=2
> >   xe 0000:00:02.0: [drm] Engine memory cat error: guc_id=2
> >   xe 0000:00:02.0: [drm] Timedout job: seqno=4294967169, guc_id=2, flags=0x4
> > 
> > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> > ---
> > drivers/gpu/drm/xe/xe_bo.c | 17 +++++++++++++----
> > drivers/gpu/drm/xe/xe_bo.h |  1 +
> > drivers/gpu/drm/xe/xe_pt.c |  3 ++-
> > 3 files changed, 16 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> > index 828a9fea420b..d04538e65f11 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.c
> > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > @@ -301,6 +301,7 @@ static struct ttm_tt *xe_ttm_tt_create(struct ttm_buffer_object *ttm_bo,
> > 	struct xe_device *xe = xe_bo_device(bo);
> > 	struct xe_ttm_tt *tt;
> > 	unsigned long extra_pages;
> > +	enum ttm_caching caching = ttm_cached;
> > 	int err;
> > 
> > 	tt = kzalloc(sizeof(*tt), GFP_KERNEL);
> > @@ -314,10 +315,18 @@ static struct ttm_tt *xe_ttm_tt_create(struct ttm_buffer_object *ttm_bo,
> > 		extra_pages = DIV_ROUND_UP(xe_device_ccs_bytes(xe, bo->size),
> > 					   PAGE_SIZE);
> > 
> > -	/* TODO: Select caching mode */
> > -	err = ttm_tt_init(&tt->ttm, &bo->ttm, page_flags,
> > -			  bo->flags & XE_BO_SCANOUT_BIT ? ttm_write_combined : ttm_cached,
> > -			  extra_pages);
> > +	/*
> > +	 * Display scanout is always non-coherent with the CPU cache.
> > +	 *
> > +	 * For Xe_LPG and beyond, PPGTT PTE lookups are also non-coherent and
> > +	 * require a CPU:WC mapping.
> > +	 *
> > +	 */
> > +	if (bo->flags & XE_BO_SCANOUT_BIT ||
> > +	    (xe->info.graphics_verx100 >= 1270 && bo->flags & XE_BO_PPGTT_BIT))
> > +		caching = ttm_write_combined;
> > +
> > +	err = ttm_tt_init(&tt->ttm, &bo->ttm, page_flags, caching, extra_pages);
> > 	if (err) {
> > 		kfree(tt);
> > 		return NULL;
> > diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> > index 72c68facd481..fd103b64f446 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.h
> > +++ b/drivers/gpu/drm/xe/xe_bo.h
> > @@ -31,6 +31,7 @@
> > #define XE_BO_DEFER_BACKING		BIT(9)
> > #define XE_BO_SCANOUT_BIT		BIT(10)
> > #define XE_BO_FIXED_PLACEMENT_BIT	BIT(11)
> > +#define XE_BO_PPGTT_BIT			BIT(12)
> 
> we have XE_BO_CREATE_GGTT_BIT. To make name consistent and close to a
> similar flag, this should probably be
> 
> #define XE_BO_CREATE_PPGTT_BIT		BIT(6)

We actually *don't* want consistent naming here since these are
completely different things.  GGTT_BIT indicates that the object is
intended to be bound into the GGTT's address space, whereas PPGTT_BIT
indicates that the object *is* the PPGTT.  Maybe I should rename this
one to XE_BO_PAGETABLE_BIT or something to make them less similar.


Matt

> 
> While at it, let's remove the _BIT that is agains our naming
> convention.
> 
> Although here I think what we actually need is the XE_BO_NEEDS_CPU_ACCESS
> from Matt Auld's  series. Cc'ing him.
> 
> Lucas De Marchi
> 
> > /* this one is trigger internally only */
> > #define XE_BO_INTERNAL_TEST		BIT(30)
> > #define XE_BO_INTERNAL_64K		BIT(31)
> > diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> > index a458224a88ca..fe91b10f951e 100644
> > --- a/drivers/gpu/drm/xe/xe_pt.c
> > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > @@ -221,7 +221,8 @@ struct xe_pt *xe_pt_create(struct xe_vm *vm, struct xe_tile *tile,
> > 				  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
> > 				  XE_BO_CREATE_IGNORE_MIN_PAGE_SIZE_BIT |
> > 				  XE_BO_CREATE_PINNED_BIT |
> > -				  XE_BO_CREATE_NO_RESV_EVICT);
> > +				  XE_BO_CREATE_NO_RESV_EVICT |
> > +				  XE_BO_PPGTT_BIT);
> > 	if (IS_ERR(bo)) {
> > 		err = PTR_ERR(bo);
> > 		goto err_kfree;
> > -- 
> > 2.41.0
> > 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation

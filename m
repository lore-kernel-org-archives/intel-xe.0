Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D834C4167B
	for <intel-xe@archiver.kernel.org>; Thu,  7 Dec 2023 16:32:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 192F410E924;
	Thu,  7 Dec 2023 16:32:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A0DE10E924
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Dec 2023 16:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701966742; x=1733502742;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=2dKv2D9cOOK8+h/GUVRP2ZqT9cEcBk+CPJ34UkKMais=;
 b=WoJiJGZVWkq2wxX+hUNCTG6PgQzn38vz+8aU366HA7ptHW4GaVEafsRS
 iwh7bm9G6m6XpW7gJNZIuo7wnAVbFmcqySV8K7RsbWB4zBRyHnyM9njAX
 x957+gmLYcHIuvRgqFvF3bpBfaub9mhnDBYsl+3pq2L+dbAb7BRxElF4P
 vl8WkWLotfIDGCcuthrgQ6my9RhEYGBmzGYr20Nw1lWALgK2Xw7quApaI
 DGqmaBHQTYIrjJkVS0AtZSVijgtnkWKCmW7+BwmslEuR5dwIHNqLM8CeZ
 PcKXeUK/mC4A/zlgSp3qdGkyAgqv6RlcFomsVjLfS456cE0ny5T5/+BeM A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="397050577"
X-IronPort-AV: E=Sophos;i="6.04,258,1695711600"; d="scan'208";a="397050577"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 08:32:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="765155375"
X-IronPort-AV: E=Sophos;i="6.04,258,1695711600"; d="scan'208";a="765155375"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Dec 2023 08:32:19 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Dec 2023 08:32:18 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Dec 2023 08:32:17 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 7 Dec 2023 08:32:17 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 7 Dec 2023 08:32:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WPaFqtbVUtttKy1IPc2DWckmpERPhRcyl3VsrTUJ2Pm9qk+vbG18hJTj50gTAcOby2ztZbi7YpZlj8TkdPIgNeeTz71DNBB3k1C6f0RlAHvfKlfC3jnxODJZhDrtmtcfST4HXUf/iGQvnemA0irikhZdzN71RpUXJUqLOoASTPI6JjxZqbCtYqnzPEFJmdTKnSoxIU7m6/8k8BgFKuqvyCOtO5i4iAA1HCs+uUHPcf2xkbHSA+hIhweQDOtDltZRFWB+YZ8XJ4tMBCMowB/RaQeiC7plgPt7LpwAYU5jzqYaFIKo1yJi7lB5ITkc1cMzA8CEDNP0kHAhdx2gvJx0tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y5qIHg+eiA6SlY59UHTRz8SkTwvkGhiBmAyEGlw346g=;
 b=Dw1y4thJA7oQSBznbrFujv/XgG7VcqcJNFHOqOy1mfAd1q4itIjA3BswFXQhmm1aftgfMl0w+vCB7FuyO7nuYfJOkJ62+jW8+SzZ8NjZJyw5eogPjQoyT1DqdwczqUfy8UUd7jsbtajpR/tNMbehstPsO1P4A6TEmEe6EYzfXb+TaKmwOIAtLY6v7vz6CJMgiFveCF++xGfEdtfZMGt/j9RDYO7JH7py/IX4xxK4rcIuVbb8b6VNuKdKCvwYVb7gItQuT/lVPEaTl7SzhF+tGXOu8zSgvKtiS4GeJ1SIfGSHvk4KtzhGfajNSDOKquOuJM/MnQIIWO1J1hkxbdMHVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by BL1PR11MB5303.namprd11.prod.outlook.com (2603:10b6:208:31b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.25; Thu, 7 Dec
 2023 16:32:15 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0%7]) with mapi id 15.20.7068.027; Thu, 7 Dec 2023
 16:32:15 +0000
Date: Thu, 7 Dec 2023 08:32:13 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH] drm/xe: Replace the scratch pages with NULL PTEs
Message-ID: <20231207163213.GZ5757@mdroper-desk1.amr.corp.intel.com>
References: <20231207154423.35666-1-thomas.hellstrom@linux.intel.com>
 <dktre5juul24vbetvhi67r3n2gnlnjihppf74vddyrobxetxc7@5nha57x4mdwb>
 <301e0414-c632-dd88-b67c-87a3d24544a9@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <301e0414-c632-dd88-b67c-87a3d24544a9@linux.intel.com>
X-ClientProxiedBy: SJ0PR05CA0062.namprd05.prod.outlook.com
 (2603:10b6:a03:332::7) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|BL1PR11MB5303:EE_
X-MS-Office365-Filtering-Correlation-Id: 155f5987-4f32-4f64-7acc-08dbf742125c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: K0UrZ6EiEg+TemvVWZVR2bVpPN0NlYRu+RRsqjP3IgM7TRFkdRefmNxhTlwE7MsQUHLPy/oPw5yS52EE/AKSOoWLQEndmfb83Sf07f+s3BLZ8zk3CuAadeZVKVWsYIIPIuELLGbiPhXL2F8IUGP3JlgS1Ec13vxaedu/Y63Trdai5TMOZl9GPoOvb93ZWTWJwATsZN1A48vyh/zLalTWjgI1YgZnpFhvvqxSKy0vbSBl1mLYU8QwFVzHjxKtjvmjGItp+LV+yqpQHP5OUW25NUa7/IqfiUpsRaLmJc1GGWvX30AVYmQZtH7Z97HrBOtS3rlJd6CP2bORDE41FioNON527RNwOK6ImJyUKC43vMqPm8jb2hlfi7EZhlabJTe0sTnnyfFxRVEMq59j/t0DpSRlsLlrqgFqkJbP9Db6jqgXS0OwTxGir4kdukjBniCZWVi5SGHfNOdBbMYlepgwiFmiBHsO0U9g9TDC+K5wrYzhRhllPDq32h2kJ2oPQEasn/P8yd6zZ9uVPgQ8dHbg1Y60b4cPi//enKrnrV1ojfJKPI4kdUK+qR/Fefo5nCI0
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(346002)(396003)(366004)(39860400002)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(83380400001)(66574015)(66899024)(1076003)(6512007)(6506007)(53546011)(26005)(316002)(66946007)(66556008)(66476007)(54906003)(6916009)(5660300002)(33656002)(30864003)(2906002)(8676002)(86362001)(8936002)(4326008)(41300700001)(38100700002)(82960400001)(6486002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?vUp3J3zE82Ey4qVsFyTqSQByd88uSHF1FNLSAtntB7DVvI0aLfJ6Kaw3vr?=
 =?iso-8859-1?Q?+RSyFEfQWgFCNd7GzXpCtsLVqIO5gQL0UgDcP8ApkqPIr/UgPzSARd/J/T?=
 =?iso-8859-1?Q?l67BJMdAQ7ciKI2kBf29AgaMxM9I160FaOR3ZgUIt3qkoTjkz+2a23E2AK?=
 =?iso-8859-1?Q?sD+U9XgX2uv3MzwMGzsL1flRhfhMQde/GKBSJ+nhmvAu23CvZaUorcuhzL?=
 =?iso-8859-1?Q?obthBxwSGjyw4haBlYkbGHiKoaV6yKzYWQiOPC84lqB9kXu1dz+CaHprov?=
 =?iso-8859-1?Q?djkhMRY1ZFMEG5vNXMv+ogUNTU1xO3Yi21aD76WVlSLv7l+YRvA/Phr85G?=
 =?iso-8859-1?Q?yqfB2sgVPCGPQWZfyhVl35PaZCrWsIu1u2X4ExT/qQAr1c+/pX7FNCLx/R?=
 =?iso-8859-1?Q?ED8aXpl9lhXyn+Scb392SWLMleHNPt0wVjAlNvvNBpsBAwv9fSwg8te/m/?=
 =?iso-8859-1?Q?1n/M4jN5+0exRfS4csYFSM231RLHrDM+CiAAAC9Csyx/foJpBBKNeWg8CT?=
 =?iso-8859-1?Q?HCzuT/8mBW8EoTdXs7uzDIf5Yn6GlqCGpf4L++Vrdg6Xnxs2INQ85oPu45?=
 =?iso-8859-1?Q?eOWY2dtw7bEIzuZ4xskRa50BT2nVar4UXuTQWC6+NGwX1RhaWH8qxwKUaC?=
 =?iso-8859-1?Q?6YMdQojqu9h2X7J2cYQ5JuhShgJ4g3Q4wrEVsKdS78jnJ4nn7uxjoCUfMl?=
 =?iso-8859-1?Q?RsCuG25fBDPvjBk3QWs51a9T0mI4LpuoWU+oqArYYs0xo1egdpiMW4S1SA?=
 =?iso-8859-1?Q?iWcT2azzQdyWZFiG2KC64vx6aj0kHXIReONoio7UKpHyMwxqYBtQDid+kF?=
 =?iso-8859-1?Q?PsPO6FbCuOYE43fW5uYpljlFQQefuNV+HuEP8wxtIKIvclNs4QyEsqmM8F?=
 =?iso-8859-1?Q?NNkKVovYzc9Szy5EIlon74q6cG3RndZkmrNlSz2lapGRwoUKlxKnPXx/BE?=
 =?iso-8859-1?Q?Rxlk1HSJLtVEbR04W9YPbJV+idkquZkMl5B4wdowoRlDp7ll20DSiYhxQ7?=
 =?iso-8859-1?Q?ToWnVvusYyBPkW4ShmplTgYP+5r6PMZgPN+ThvKN2A5SAM++/e1VZ9ff4h?=
 =?iso-8859-1?Q?eClwZj56s52/1LyyuPEeD3l60usV1lYEX8cg2rou1rixoomhjcW0DWBpoG?=
 =?iso-8859-1?Q?08qVk3y4q41OWAj5LzeqfTt1veuo7UacracHpZwWxitzTw5kBWZAUfuJsZ?=
 =?iso-8859-1?Q?FJRg9me7AUG7O3gC9a9ey2ra1GcKwgrpdNw03XCKtD//taPq76ENPv4/e8?=
 =?iso-8859-1?Q?5YZWHmDhYchdTKJfQej1EvHVZ7jcGL5LozZ0J8g8ACUGNLxd/j/hksGRf6?=
 =?iso-8859-1?Q?NiaHMYHgT70XOAPjjWSIrFQwhyCFSsib06xJ8bGHb5vq5701ij5VYBP1cp?=
 =?iso-8859-1?Q?1TOy7hJ1XOuoqJUMzXYJnD5pE2jzGMjKBibCYVIn2aZHy5ZWHtXMCxMXXB?=
 =?iso-8859-1?Q?D8R7Z+NLCGxZbKcf7WaguQa7tp/5vrk7dp6PlHnWLzKYr0xCaT6e4+NWoZ?=
 =?iso-8859-1?Q?Q+cCK/ub0o5KqvPpTTInghhHzFoKECtstdeCMbSPPyJCkddeJ2syG4zCLO?=
 =?iso-8859-1?Q?lwCyEduiEmDeTpFJn2LTm9eTP+barwiltNV/3MrP46ejJaKu63Tnoe7sJ9?=
 =?iso-8859-1?Q?elrc8q8V4FPHbkKemSUoMG1gubRPPwPgrPqhkK/GKFqqYcESrd75PF5w?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 155f5987-4f32-4f64-7acc-08dbf742125c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2023 16:32:15.2518 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pDBT8J4c9CSWuOWi0lRO0Zuv5PiXfk8CSQbyvSBGQSSJuPp972TJC2nMqHVc1rBLrM1AGRvVS0efXHfA5bvewEqK7KdHOgH6XtEE8djL1qo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5303
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Dec 07, 2023 at 05:25:01PM +0100, Thomas Hellström wrote:
> + intel-xe cc.
> 
> 
> On 12/7/23 17:17, Lucas De Marchi wrote:
> > On Thu, Dec 07, 2023 at 04:44:23PM +0100, Thomas Hellström wrote:
> > > Replace the scratch pages with NULL PTEs that return 0 when reading and
> > > do nothing when writing.
> > 
> > but don't we want to keep scratch so we can check when things go wrong
> > and writes go where they shouldn't?
> 
> The argument against that was that apps that incorrectly writes to scratch
> and then reads back the same value wouldn't notice that it did something
> wrong, and the case you mention would to some extent be captured by not
> having a scratch page at all and check for pagefaults?
> 
> I admit I haven't been following the discussions around scratch pages long
> enough to know the historical uses for it. Cc'ing Joonas for further
> discussion.

It seems like null PTE is probably the best thing to do for real-world,
production use.  But for developer use we might want to add a kconfig
option at some point that brings back the scratch page and pre-poisons
it, since that might be useful in some debugging situations.


Matt

> 
> /Thomas
> 
> 
> > 
> > Lucas De Marchi
> > 
> > > 
> > > Cc: Brian Welty <brian.welty@intel.com>
> > > Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > ---
> > > drivers/gpu/drm/xe/xe_pt.c       | 68 ++++----------------------------
> > > drivers/gpu/drm/xe/xe_pt.h       |  3 --
> > > drivers/gpu/drm/xe/xe_vm.c       | 45 +--------------------
> > > drivers/gpu/drm/xe/xe_vm.h       |  5 +++
> > > drivers/gpu/drm/xe/xe_vm_types.h |  2 -
> > > 5 files changed, 14 insertions(+), 109 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> > > index 35bd7940a571..ce2846d56b04 100644
> > > --- a/drivers/gpu/drm/xe/xe_pt.c
> > > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > > @@ -50,17 +50,14 @@ static struct xe_pt *xe_pt_entry(struct
> > > xe_pt_dir *pt_dir, unsigned int index)
> > > static u64 __xe_pt_empty_pte(struct xe_tile *tile, struct xe_vm *vm,
> > >                  unsigned int level)
> > > {
> > > -    u16 pat_index = tile_to_xe(tile)->pat.idx[XE_CACHE_WB];
> > > -    u8 id = tile->id;
> > > +    struct xe_device *xe = tile_to_xe(tile);
> > > +    u16 pat_index = xe->pat.idx[XE_CACHE_WB];
> > > 
> > > -    if (!vm->scratch_bo[id])
> > > +    if (!xe_vm_has_scratch(vm))
> > >         return 0;
> > > 
> > > -    if (level > 0)
> > > -        return vm->pt_ops->pde_encode_bo(vm->scratch_pt[id][level -
> > > 1]->bo,
> > > -                         0, pat_index);
> > > -
> > > -    return vm->pt_ops->pte_encode_bo(vm->scratch_bo[id], 0,
> > > pat_index, 0);
> > > +    return vm->pt_ops->pte_encode_addr(xe, 0, pat_index, level,
> > > IS_DGFX(xe),
> > > +                       0) | XE_PTE_NULL;
> > > }
> > > 
> > > /**
> > > @@ -135,7 +132,7 @@ void xe_pt_populate_empty(struct xe_tile *tile,
> > > struct xe_vm *vm,
> > >     u64 empty;
> > >     int i;
> > > 
> > > -    if (!vm->scratch_bo[tile->id]) {
> > > +    if (!xe_vm_has_scratch(vm)) {
> > >         /*
> > >          * FIXME: Some memory is allocated already allocated to zero?
> > >          * Find out which memory that is and avoid this memset...
> > > @@ -194,57 +191,6 @@ void xe_pt_destroy(struct xe_pt *pt, u32 flags,
> > > struct llist_head *deferred)
> > >     kfree(pt);
> > > }
> > > 
> > > -/**
> > > - * xe_pt_create_scratch() - Setup a scratch memory pagetable tree
> > > for the
> > > - * given tile and vm.
> > > - * @xe: xe device.
> > > - * @tile: tile to set up for.
> > > - * @vm: vm to set up for.
> > > - *
> > > - * Sets up a pagetable tree with one page-table per level and a single
> > > - * leaf bo. All pagetable entries point to the single page-table or,
> > > - * for L0, the single bo one level below.
> > > - *
> > > - * Return: 0 on success, negative error code on error.
> > > - */
> > > -int xe_pt_create_scratch(struct xe_device *xe, struct xe_tile *tile,
> > > -             struct xe_vm *vm)
> > > -{
> > > -    u8 id = tile->id;
> > > -    unsigned int flags;
> > > -    int i;
> > > -
> > > -    /*
> > > -     * So we don't need to worry about 64K TLB hints when dealing with
> > > -     * scratch entires, rather keep the scratch page in system memory on
> > > -     * platforms where 64K pages are needed for VRAM.
> > > -     */
> > > -    flags = XE_BO_CREATE_PINNED_BIT;
> > > -    if (vm->flags & XE_VM_FLAG_64K)
> > > -        flags |= XE_BO_CREATE_SYSTEM_BIT;
> > > -    else
> > > -        flags |= XE_BO_CREATE_VRAM_IF_DGFX(tile);
> > > -
> > > -    vm->scratch_bo[id] = xe_bo_create_pin_map(xe, tile, vm, SZ_4K,
> > > -                          ttm_bo_type_kernel,
> > > -                          flags);
> > > -    if (IS_ERR(vm->scratch_bo[id]))
> > > -        return PTR_ERR(vm->scratch_bo[id]);
> > > -
> > > -    xe_map_memset(vm->xe, &vm->scratch_bo[id]->vmap, 0, 0,
> > > -              vm->scratch_bo[id]->size);
> > > -
> > > -    for (i = 0; i < vm->pt_root[id]->level; i++) {
> > > -        vm->scratch_pt[id][i] = xe_pt_create(vm, tile, i);
> > > -        if (IS_ERR(vm->scratch_pt[id][i]))
> > > -            return PTR_ERR(vm->scratch_pt[id][i]);
> > > -
> > > -        xe_pt_populate_empty(tile, vm, vm->scratch_pt[id][i]);
> > > -    }
> > > -
> > > -    return 0;
> > > -}
> > > -
> > > /**
> > >  * DOC: Pagetable building
> > >  *
> > > @@ -1286,7 +1232,7 @@ __xe_pt_bind_vma(struct xe_tile *tile, struct
> > > xe_vma *vma, struct xe_exec_queue
> > >      * it needs to be done here.
> > >      */
> > >     if ((rebind && !xe_vm_in_lr_mode(vm) && !vm->batch_invalidate_tlb) ||
> > > -        (!rebind && vm->scratch_bo[tile->id] &&
> > > xe_vm_in_preempt_fence_mode(vm))) {
> > > +        (!rebind && xe_vm_has_scratch(vm) &&
> > > xe_vm_in_preempt_fence_mode(vm))) {
> > >         ifence = kzalloc(sizeof(*ifence), GFP_KERNEL);
> > >         if (!ifence)
> > >             return ERR_PTR(-ENOMEM);
> > > diff --git a/drivers/gpu/drm/xe/xe_pt.h b/drivers/gpu/drm/xe/xe_pt.h
> > > index d5460e58dbbf..6f7359ac55bd 100644
> > > --- a/drivers/gpu/drm/xe/xe_pt.h
> > > +++ b/drivers/gpu/drm/xe/xe_pt.h
> > > @@ -26,9 +26,6 @@ unsigned int xe_pt_shift(unsigned int level);
> > > struct xe_pt *xe_pt_create(struct xe_vm *vm, struct xe_tile *tile,
> > >                unsigned int level);
> > > 
> > > -int xe_pt_create_scratch(struct xe_device *xe, struct xe_tile *tile,
> > > -             struct xe_vm *vm);
> > > -
> > > void xe_pt_populate_empty(struct xe_tile *tile, struct xe_vm *vm,
> > >               struct xe_pt *pt);
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > > index e09050f16f07..868b9a2a5d02 100644
> > > --- a/drivers/gpu/drm/xe/xe_vm.c
> > > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > > @@ -1332,7 +1332,7 @@ static void vm_destroy_work_func(struct
> > > work_struct *w);
> > > struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
> > > {
> > >     struct xe_vm *vm;
> > > -    int err, i = 0, number_tiles = 0;
> > > +    int err, number_tiles = 0;
> > >     struct xe_tile *tile;
> > >     u8 id;
> > > 
> > > @@ -1397,17 +1397,8 @@ struct xe_vm *xe_vm_create(struct xe_device
> > > *xe, u32 flags)
> > >         }
> > >     }
> > > 
> > > -    if (flags & XE_VM_FLAG_SCRATCH_PAGE) {
> > > -        for_each_tile(tile, xe, id) {
> > > -            if (!vm->pt_root[id])
> > > -                continue;
> > > -
> > > -            err = xe_pt_create_scratch(xe, tile, vm);
> > > -            if (err)
> > > -                goto err_scratch_pt;
> > > -        }
> > > +    if (xe_vm_has_scratch(vm))
> > >         vm->batch_invalidate_tlb = true;
> > > -    }
> > > 
> > >     if (flags & XE_VM_FLAG_LR_MODE) {
> > >         INIT_WORK(&vm->preempt.rebind_work, preempt_rebind_work_func);
> > > @@ -1415,7 +1406,6 @@ struct xe_vm *xe_vm_create(struct xe_device
> > > *xe, u32 flags)
> > >         vm->batch_invalidate_tlb = false;
> > >     }
> > > 
> > > -    /* Fill pt_root after allocating scratch tables */
> > >     for_each_tile(tile, xe, id) {
> > >         if (!vm->pt_root[id])
> > >             continue;
> > > @@ -1465,19 +1455,6 @@ struct xe_vm *xe_vm_create(struct xe_device
> > > *xe, u32 flags)
> > > 
> > >     return vm;
> > > 
> > > -err_scratch_pt:
> > > -    for_each_tile(tile, xe, id) {
> > > -        if (!vm->pt_root[id])
> > > -            continue;
> > > -
> > > -        i = vm->pt_root[id]->level;
> > > -        while (i)
> > > -            if (vm->scratch_pt[id][--i])
> > > -                xe_pt_destroy(vm->scratch_pt[id][i],
> > > -                          vm->flags, NULL);
> > > -        xe_bo_unpin(vm->scratch_bo[id]);
> > > -        xe_bo_put(vm->scratch_bo[id]);
> > > -    }
> > > err_destroy_root:
> > >     for_each_tile(tile, xe, id) {
> > >         if (vm->pt_root[id])
> > > @@ -1556,24 +1533,6 @@ void xe_vm_close_and_put(struct xe_vm *vm)
> > >         vma->gpuva.flags |= XE_VMA_DESTROYED;
> > >     }
> > > 
> > > -    /*
> > > -     * All vm operations will add shared fences to resv.
> > > -     * The only exception is eviction for a shared object,
> > > -     * but even so, the unbind when evicted would still
> > > -     * install a fence to resv. Hence it's safe to
> > > -     * destroy the pagetables immediately.
> > > -     */
> > > -    for_each_tile(tile, xe, id) {
> > > -        if (vm->scratch_bo[id]) {
> > > -            u32 i;
> > > -
> > > -            xe_bo_unpin(vm->scratch_bo[id]);
> > > -            xe_bo_put(vm->scratch_bo[id]);
> > > -            for (i = 0; i < vm->pt_root[id]->level; i++)
> > > -                xe_pt_destroy(vm->scratch_pt[id][i], vm->flags,
> > > -                          NULL);
> > > -        }
> > > -    }
> > >     xe_vm_unlock(vm);
> > > 
> > >     /*
> > > diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> > > index 9a0ae19c47b7..b92d8f54011d 100644
> > > --- a/drivers/gpu/drm/xe/xe_vm.h
> > > +++ b/drivers/gpu/drm/xe/xe_vm.h
> > > @@ -61,6 +61,11 @@ static inline bool
> > > xe_vm_is_closed_or_banned(struct xe_vm *vm)
> > >     return xe_vm_is_closed(vm) || xe_vm_is_banned(vm);
> > > }
> > > 
> > > +static inline bool xe_vm_has_scratch(const struct xe_vm *vm)
> > > +{
> > > +    return vm->flags & XE_VM_FLAG_SCRATCH_PAGE;
> > > +}
> > > +
> > > struct xe_vma *
> > > xe_vm_find_overlapping_vma(struct xe_vm *vm, u64 start, u64 range);
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_vm_types.h
> > > b/drivers/gpu/drm/xe/xe_vm_types.h
> > > index 23abdfd8622f..a5762e99e6aa 100644
> > > --- a/drivers/gpu/drm/xe/xe_vm_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> > > @@ -158,8 +158,6 @@ struct xe_vm {
> > >     u64 size;
> > > 
> > >     struct xe_pt *pt_root[XE_MAX_TILES_PER_DEVICE];
> > > -    struct xe_bo *scratch_bo[XE_MAX_TILES_PER_DEVICE];
> > > -    struct xe_pt *scratch_pt[XE_MAX_TILES_PER_DEVICE][XE_VM_MAX_LEVEL];
> > > 
> > >     /**
> > >      * @flags: flags for this VM, statically setup a creation time aside
> > > -- 2.42.0
> > > 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation

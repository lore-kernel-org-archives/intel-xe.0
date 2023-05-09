Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89441C7EE22
	for <intel-xe@archiver.kernel.org>; Tue,  9 May 2023 22:05:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BF5610E3DC;
	Tue,  9 May 2023 22:05:46 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B219D10E3DA
 for <intel-xe@lists.freedesktop.org>; Tue,  9 May 2023 22:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683669944; x=1715205944;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=GFHcV7sK28WGe8oyo0xGEquARmoPpcnj170F/3CnxIM=;
 b=NsW11wTTspwam/KNO98Z7mnyHzUwSeCE+wHhDqkzjb9WaNAUJdi/R2yj
 fEHeEGqRUfAlSHE2qB2H7wyiimhG8A/M9V8OhntQiLn2GsaliSwVbE3tP
 IsZsM3Wem7Yy/J6aPW6UV83OinOle7oyVq/LIQ5Bus6p6cGu+uqZYa29H
 Hr7LoaUXMomruu9X5OlesBZS/K0ir2ObuF2hU/aQV/qFKHxp5YZ3TCak1
 0tQ01dgT5dI/lWxlzdrBfkR9I/bT195Y+sJQfxsYC6VqMDhbQ5/I4ac+t
 HGI3mhH1ivhqnLHmloEmKzIavn9NMuaBV/21yR+p8ezIVbxw+QXD/vjN7 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="413344993"
X-IronPort-AV: E=Sophos;i="5.99,262,1677571200"; d="scan'208";a="413344993"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2023 15:05:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="810889052"
X-IronPort-AV: E=Sophos;i="5.99,262,1677571200"; d="scan'208";a="810889052"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga002.fm.intel.com with ESMTP; 09 May 2023 15:05:40 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 9 May 2023 15:05:40 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 9 May 2023 15:05:40 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 9 May 2023 15:05:40 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.45) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 9 May 2023 15:05:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ezlLGV/x35jgWuXE/XTsweoIzEie/BTH7Tm94MAF5DLysqPGsNReAFf3JayBZz0DkYTHzX4N1tqtqh16eUtglOWhzELp81/B87aE8lq62VJew/a9//hfDs+QFYAK9Xhikoxc9uVcWxWy7qnYgxAjiPwKyyiH0Z9Hhfq3A+ZvY58ABRzGXt1qVe4QPMlXXf5I7tMMphKNFRN39EkRl1+d/W1PjtO8t+4YXZZyJ3XKXlRdl37gVaIo6/uVgNNTy3P7et4XDqKt1JriVpQDqL5nS0CzoJ7Yt+aQYGj5MsGVDvX3hQYk4CH9IRA+cKkHuQwB1qzLfYHeAIA6axSJ/akK5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H0K5+j2Ngidc64AAOps87tzq2VIZXPl5A3VO4445qgI=;
 b=HLMKTBYBd/UGSsrIr5SeqLNp4S1Jf19GLRFyUulQjY6YlXTdSDRBrfRlQpqUS+7mHouvO59MecBgaZagZtOmwOVrOvJgh06iocvBpwqFUVbujOOm4mhm0CyD6FfUtj4X/8wb5gH0qZudZq+cwtMpPy/9cRqxo7FD0G93TlBgbrLkT0VlffZaEhnumuyfEN24wvVuScGCUOnOlJ/YQGmqseoEo1r8KmgeqERuMf9LhIa6+4jLBZFceeOB93KlDSSGUu76J0JJ+NYM98/BYxhO3/GjysGcF5b85g2WXmry/qIVIRpEWwZ9kVI3oQJy/FrHLRDCNFA26OtJQ+NMbV9X4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB5472.namprd11.prod.outlook.com (2603:10b6:5:39e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Tue, 9 May
 2023 22:05:38 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%4]) with mapi id 15.20.6363.032; Tue, 9 May 2023
 22:05:38 +0000
Date: Tue, 9 May 2023 22:05:02 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <ZFrDjttRaPf6hBeo@DUT025-TGLU.fm.intel.com>
References: <20230502001727.3211096-1-matthew.brost@intel.com>
 <20230502001727.3211096-9-matthew.brost@intel.com>
 <ef984a4c-82a3-4e4d-f0ad-2d50558b3051@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ef984a4c-82a3-4e4d-f0ad-2d50558b3051@linux.intel.com>
X-ClientProxiedBy: SJ0PR03CA0197.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::22) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB5472:EE_
X-MS-Office365-Filtering-Correlation-Id: eb730524-ff7d-473d-22b0-08db50d9854d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aYQjxONQcaY1X56GyoV28hT0gSoa/jcNL3CEbYmDhqSmR0QlYCbPR7ct8pN4YU5rFP0Nel8QQ0InavO0p0arSJEjOMFhg5+AjQKQINcsQ4AYpZ6YMfR14zuu2WWDIksCgeJou81YTybxmEHe3QOLFy008jpDyNZzNO6mE0GsPiEme54H5BsI43F0/2J0eg3yNRTQ4pOeHweZapPACNBHzjd5iX0I7ow+gr4IT/Fzk/r+t3P6H6RR2tvycUQlalE3I9Gibuq/zIMI6BJscp0+XOVO6Wcx+EJqZnVAN1j+yB0gmgq7A/3bWkvADg+DDOY2uWP9pvN7FPtlpUOMo6g0vWYdsvG82OcIQFHzsF4ocvpyinw0pTPuFlCxdXBlIymkPbSe9laFvElzKQqgEYMnv2g+ztlMtkczj/LQzTsO+ocOMBv4kbKATkpRX2WVOjsv5xu7pHWQTvRn6WmBjTBeLuD7ZayC6qqtq2MU2gkw2H8k5YxPgNBXsviucZJARch7Ete8AQk6NkiYr3fz2b2pc3/gpVk+oPX81VacwBfw3YXLnAQ126FP64KVw80gAYiM
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(376002)(396003)(39860400002)(366004)(346002)(451199021)(6916009)(4326008)(478600001)(316002)(66946007)(66556008)(6486002)(66476007)(86362001)(83380400001)(53546011)(26005)(6506007)(6512007)(6666004)(8936002)(5660300002)(41300700001)(8676002)(66574015)(186003)(38100700002)(2906002)(44832011)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?by0ftfJSsOJ5EwHWVXRhfmky3Mht4exEJeAPOV1E/VGJaMPgKgHkpUK+cJ?=
 =?iso-8859-1?Q?NGOrvWQzWJM0yA9K4VWF9n/sUsCe1+BRReGaUCUwEGulDaPDIli2HzD8Zt?=
 =?iso-8859-1?Q?rXfzIccUANPx0qJtZJJ9FlOqx4Tf6YNxBrCLcl0hAE2v7//6u57wIoZ5Al?=
 =?iso-8859-1?Q?s7A6c2R2xEFUjPhPtv3q3Z+VIUOO/vTm604u7GNkeC9bjkhtknlb/60UVe?=
 =?iso-8859-1?Q?XZcEkOjODeL40IRqOWgCeiYI3laEfRIo8cj20X8hduB0+oG7G1MtyeCvL8?=
 =?iso-8859-1?Q?8CNhfq4JB/njaJcBu4E54dD5Ejx/hMPFvQ40cqKJVxMyQf4CWQjK1/BMyT?=
 =?iso-8859-1?Q?7PLqpSLcSaEW75f7VcW3fpcjvr/nuBmupEBRhu4ZvnUwXfvukCLnAHOJVD?=
 =?iso-8859-1?Q?lcbK5Rv0cK7bHWm+4yey/RejmCw45I7ETDA9rg6fzSgArNH8lcLaoJDryk?=
 =?iso-8859-1?Q?Pu+3QZjS/ETMGd8FS3Kd6LOyoYU69fduEE/e9nFklFfkDtt+UifclNHjBA?=
 =?iso-8859-1?Q?302wohwaY3kGfUBXA7jT4vRDRz2/3iCwjWOIAnR6f0Sj7l2DAFfjUU9O/g?=
 =?iso-8859-1?Q?8wiwdEc3G1lsBb9Je8GvflrKO0zt+dGlKzixTkzXqtbeOo2rbxgFUZh/Y8?=
 =?iso-8859-1?Q?TwfXOiX8mnJtBbZjzGnHnZ8PjVcVAgRjNcHyBcLCgHG6ciENBkZlbVwtmt?=
 =?iso-8859-1?Q?k0klqHWgQJ85b5a6tnKw6GpWJFSa/zZN6V8nU0XyQGu6Uu3sjhwe0veFww?=
 =?iso-8859-1?Q?XkvBMghgSTWONKMvzXYBajzb4c4JtX/P2thUi7DNWZNtCmPX2//HzpgvY7?=
 =?iso-8859-1?Q?asRhXRfGkmfFbyQnJyVMfFDhdNufpY3awe3zmRqdloOgSotvZiiROBgNc2?=
 =?iso-8859-1?Q?bE2ulztIWT9CMR1H+wQc6zRrRlja7kG3mRIgzBENkir+gohrzqnlVrRFDY?=
 =?iso-8859-1?Q?qK2h/ullRtrL5qbCQn6P+xys2QfEyn4s7euvTjsn70dkVF7aJS6mIru9TZ?=
 =?iso-8859-1?Q?JEjdz22AJQHWok4tprv/Zv3BD3Mt4yGxleKNElT0EflFNOa+3wpzuSjPqP?=
 =?iso-8859-1?Q?u8OaTzw9trZ2Iln3BKq2y2ERsTLjRUyzg5Lr9ERtbNAnfSuukqVwfqMiin?=
 =?iso-8859-1?Q?zwbDSWmJxzNasDVFpRV08/Xk1aEg6Gf45s2Y+3f85rIFPuUYuVoEfe8c7j?=
 =?iso-8859-1?Q?dUr3AwPBjO9Dtrhatp3A++Sk8tEiyG6nyvWDVS0EzTEkHmvY3mct4NBJsx?=
 =?iso-8859-1?Q?U6cFhy0szj4gMhL6A+k/u2PlGrpi5ApEi8uQdgx5kL6nda173SAZ7Pfo/n?=
 =?iso-8859-1?Q?j5LAFiZrx6Kfh16FWps0p9JHHitxCXQRODRSnEdk5UE72m5hnXtvRJpOox?=
 =?iso-8859-1?Q?gO1UHjFYB1RrbiWjuVtAnJYJngFRoy1nis2xCe6cBrN1hXejejJmHLPLsM?=
 =?iso-8859-1?Q?VCQ2gy1VbtJ2uA7+pDCzJ7Tg3u3Oesw+9OzmU3M719WuP6PE3oI9NU1F1T?=
 =?iso-8859-1?Q?NbIfa2H+itNhLlX/NNgW/t5U01LZ4px7n0XO9o65YXl9Ne4M7NzodBg0Fc?=
 =?iso-8859-1?Q?RDLjuw0H/+AszPbCSIjne4jwBfCbf08zllU8obAiepGUfnLtoy+iSSNZ00?=
 =?iso-8859-1?Q?XuzJ9Gd+Z6MvbiHcU8enrXrE0DdSCFq6CboDqsntfceFyXeRSj5UITxQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: eb730524-ff7d-473d-22b0-08db50d9854d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2023 22:05:38.0819 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4UpYUm8JqeBeIvi+lWkYYh9GjFZTz6H/Z533/5paZ2wQ/vtppTmOaAHr6x41FzUZOQ8CgUXczpQ5UmvIabQJtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5472
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 08/31] drm/xe: VM LRU bulk move
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

On Tue, May 09, 2023 at 02:47:54PM +0200, Thomas Hellström wrote:
> 
> On 5/2/23 02:17, Matthew Brost wrote:
> > Use the TTM LRU bulk move for BOs tied to a VM. Update the bulk moves
> > LRU position on every exec.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_bo.c       | 32 ++++++++++++++++++++++++++++----
> >   drivers/gpu/drm/xe/xe_bo.h       |  4 ++--
> >   drivers/gpu/drm/xe/xe_dma_buf.c  |  2 +-
> >   drivers/gpu/drm/xe/xe_exec.c     |  6 ++++++
> >   drivers/gpu/drm/xe/xe_vm_types.h |  3 +++
> >   5 files changed, 40 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> > index 3ab404e33fae..da99ee53e7d7 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.c
> > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > @@ -985,6 +985,23 @@ static void xe_gem_object_free(struct drm_gem_object *obj)
> >   	ttm_bo_put(container_of(obj, struct ttm_buffer_object, base));
> >   }
> > +static void xe_gem_object_close(struct drm_gem_object *obj,
> > +				struct drm_file *file_priv)
> > +{
> > +	struct xe_bo *bo = gem_to_xe_bo(obj);
> > +
> > +	if (bo->vm && !xe_vm_no_dma_fences(bo->vm)) {
> Is there a reason we don't use bulk moves for LR vms? Admittedly bumping LRU
> doesn't make much sense when we support user-space command buffer chaining,
> but I think we should be doing it on exec at least, no?

Maybe you could make the argument for compute VMs, the preempt worker in
that case should probably do a bulk move. I can change this if desired.

Fot a fault VM it makes no sense as the fault handler updates the LRU
for individual BOs.

> > +		struct ww_acquire_ctx ww;
> > +
> > +		XE_BUG_ON(!xe_bo_is_user(bo));
> 
> Also why can't we use this for kernel objects as well? At some point we want
> to get to evictable page-table objects? Could we do this in the
> release_notify() callback to cover all potential bos?
> 

xe_gem_object_close is a user call, right? We can't call this on kernel
BOs. This also could be outside the if statement.

Matt

> /Thomas
> 
> 

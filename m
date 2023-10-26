Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2CC9C25B6B
	for <intel-xe@archiver.kernel.org>; Thu, 26 Oct 2023 19:40:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91AC610E87A;
	Thu, 26 Oct 2023 19:40:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46F6110E87A
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Oct 2023 19:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698349214; x=1729885214;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=bbG7cjJf2CLRP/pa++XvksyPjGTQbvQloHJsfKWzBcQ=;
 b=Eh4qNOEqWnpxa1bbRAh96rnmBdgCiOzamnkRBHB9kS4NyRidGmJm32Zg
 aZrtO5Dtd8c/EJUrKWRYK9yTdpks4B9Yw2F/zZV3KjUYCaJOpOmrjtFT7
 Y8S0mvifn8PRZSv5dyWwlgceaPLe78zGcZIfinZbQLgBaka2fra/oH05R
 mdV5c23iV5iSp+3zKo4pLeOpk50+df5h7nAzdB8Nf0/4nWeDqSOB1JhHU
 HidzxKs28DM3g1++/1D3Tt/fOCmR2dKrbxysGvJeKDoP5QZzfdUIRKrXm
 GXv86u2mGvRKmMvcfBfoQREP1vRYKnf4jLeqPMXwMpTBimce6T/g9Dxpz w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="9176588"
X-IronPort-AV: E=Sophos;i="6.03,254,1694761200"; 
   d="scan'208";a="9176588"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2023 12:40:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="825103483"
X-IronPort-AV: E=Sophos;i="6.03,254,1694761200"; d="scan'208";a="825103483"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Oct 2023 12:40:13 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 26 Oct 2023 12:40:13 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 26 Oct 2023 12:40:12 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 26 Oct 2023 12:40:12 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 26 Oct 2023 12:40:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wg9bADZHpc3H02JYaBUZxp0E2ra/bYWk3Q2/kQZcs/GQnVxv0MYA9iSkX8WaJoplKlcA0pcg86BhpsfpCBTMLuwtKsxFgK+t53rb8052mX2sUpNjzNV+pI6W6tzT5Gz+awC5pgZk3hZptmrtNPhyT+NZHzMhuqo1pDImMKIziz/+Y2aMGgdItIP0nmEB2YDqaRG0qT3CjfAXyhg+638oxc11Cjl33dBm3amh/MJAyVMWcUPfcsRFmlPxXdoVaKIbcEFERkonNUZTs3WQApp3l+DpTra/Ys7Jdzl4vPk2Q0h12yVp9kLRfFL0ibjFBJNAvJn25f51LPxA969KBjiyxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8pv78e7Ti/ohI/Rx9/KnREgs+ry3+ndyT+Qedng+H7I=;
 b=BssP10qZLWBC84dtAtoBZG8P/pph9Rm7n6Aly0xeXjw/VUlLNQrqIC1W6d7srPZJEmYk3q1knELfUZD/W/GsOVPzAz7VRkvcP4z/zkvryZ39fQdr0LQdsZOeXi6nyqX5UW4GTiAxdxidXhR3EbsU39ucfnXJndeCigJ4WlhtTc3HIRsgH/ImYNLx6egOmVgqY4Vkg5karIa/OQlEIf08XiYK52irqEJCS5hnXPT9H6FfLrLwACVfq6QCX4h0wHjBERFOtIGq2x9ukpM8GmNONMyACDV5tqOK8wzv0uqG4NA+nZLNx3aiw9bTvNE+aHFCpunIHmAZdEr3eRBVnTYf1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH3PR11MB7390.namprd11.prod.outlook.com (2603:10b6:610:14e::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.33; Thu, 26 Oct
 2023 19:39:57 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::3f66:aa7d:51d5:777]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::3f66:aa7d:51d5:777%7]) with mapi id 15.20.6933.022; Thu, 26 Oct 2023
 19:39:57 +0000
Date: Thu, 26 Oct 2023 19:38:37 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Message-ID: <ZTrAPZSNhchx/VeS@DUT025-TGLU.fm.intel.com>
References: <20231025173937.197744-5-matthew.auld@intel.com>
 <20231025173937.197744-8-matthew.auld@intel.com>
 <ZTmCBBn11tCzpT6Z@DUT025-TGLU.fm.intel.com>
 <bfa98ab2-0fb1-5cf1-6c7c-fe7a9962aa86@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bfa98ab2-0fb1-5cf1-6c7c-fe7a9962aa86@intel.com>
X-ClientProxiedBy: SJ0PR03CA0176.namprd03.prod.outlook.com
 (2603:10b6:a03:338::31) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH3PR11MB7390:EE_
X-MS-Office365-Filtering-Correlation-Id: 531eb6f4-012d-4e6b-b1b8-08dbd65b557a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: op7LUR0HRJi8jocNqb85/Ng5ENRWGTjIhfocfsTebjwkGsMTbAmYCfS8znWJ7kvWZ5cF/1M8mT/eeOIT/oJqo/vfHBnjTE8Fk8OdySggGa5uhq7282agKgupiGLwNDKMYzA0r4Eg+0AGmzv3aUQZ8lrRno+Wd5t569qAyFijSOTrM1GZ88wl8lZ2752GttQ0tK+nT58evG91J2idB7E2ZHFJ1zHWT//YodGhwGI6Mdy+sx99V8rJHx2smbSn4DCSEoS5gNGQcdnGyTrpmJExqQ4IfiR5bKiL8k7JGIsnRdRinHSsj4/fmCLj21N0C9QYPT9NSnpv6BZX7d8c3mc82oXTf567G2NOBRKGlMdr1YFaCfQAuyy6LZAgUnsQS2N8VqhzdJgHNVrQuQosxg/6hm7L2DUwfm03zAOCFQXLux1OG7PfwlULdia0h8WJjQEpSijeQQcqKGNjronI1k4W15/DhSwVrSZ6fgbKGRaoxV96DxNC+9KVYRa1L4pN3scvS9xqzmFB6/B0SvV5U7X3v8MEd9kT/03q7NYNZW12ep8E96sShUnxU5TrfDMMAC9E
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(39860400002)(376002)(346002)(136003)(230922051799003)(1800799009)(64100799003)(186009)(451199024)(41300700001)(44832011)(316002)(6636002)(66946007)(66556008)(26005)(66476007)(8936002)(2906002)(478600001)(5660300002)(8676002)(4326008)(6486002)(6862004)(6506007)(53546011)(6512007)(83380400001)(38100700002)(66574015)(6666004)(82960400001)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?y/djH+TZuX4uMVuyotgZt1lPUi9s81xyWNlRUGRGxxQzXC2Knh7tK0xewT?=
 =?iso-8859-1?Q?8tDptx0TJym3ihbVaBy3Nl5uEuLL8yjU0phbDa9tWb4jE0Gsn36p+OWQnl?=
 =?iso-8859-1?Q?SkX7jqAzgN5LWHQSYEkYvzC2euRjpM6kQqlln0z+wb2jQY0pb6tuXAgXLQ?=
 =?iso-8859-1?Q?zUXe4rJYzO2HAdpwviZtW60h9f0D9CE707SwLUxdo5Shw/S2gfKg1S5i7Q?=
 =?iso-8859-1?Q?mPyzNsmUPpWbE3n9cKAbwhyVftX8zvoN7pK9HT2ItWZiSo5u3eJ/tF8Nlk?=
 =?iso-8859-1?Q?m4WoJ1k2wl+Qsiu20rLTNKSpsak5UcYubQjlygCFc7pgAZjj6XIqo6hroW?=
 =?iso-8859-1?Q?bPngAR0anQKpF/rrsbMHkC7dKhfHzV+gJRc+MVPe/mQdeBAt4FBzruZNIB?=
 =?iso-8859-1?Q?0bwxxK+pFNTrf7kV3CnRekKeMsixIPHJbddZ/4UZNpBKo874tH+IZJJnt5?=
 =?iso-8859-1?Q?elJkYUgYtqKySbw3sNkpNjZq7orEc7j3DuKIsfXy+xMA0lLdike1SB34ip?=
 =?iso-8859-1?Q?XACUH7En3e2ohcBAG7XJgF07lV4WhZom8ylYO2hryYcDFZYYu+40oH1iTW?=
 =?iso-8859-1?Q?76OVykbWGjDYWl6pXnQwqcC7n3I+ruoVR4JZ9+CsQ0bO/TF36W2l0B8qwt?=
 =?iso-8859-1?Q?n8DuMXfbyf+jjcrjSXwfrcA3cBYXWHBT0mwZnYSLJKa7UcUatPOIFNxP0+?=
 =?iso-8859-1?Q?TykakALqRi6WHMa1RmvbZRMh9TBhH0l7Kxy97By4fEIQfWPwj7uC6V10n3?=
 =?iso-8859-1?Q?EqNlYQL426Hv3MSmXT18nNtdUHjFi/go2ceG05U0dgIupei9ftmE2DklIT?=
 =?iso-8859-1?Q?Yr42JhEVggUcUViVL9TLAeGAZAipg2EeZRmUrm/MuB/UBTS77dITwMAtsU?=
 =?iso-8859-1?Q?IddTjvb1jqidJJ0YrsKuJ3jgTvacHx4Edyrd/YnJfZQSDNyhkZYupIobn9?=
 =?iso-8859-1?Q?Pif+vpRvAqVPg3UfIhnnBhT3hkmC6gauIpT00tgSYKc4zHS3kRXTwaXao3?=
 =?iso-8859-1?Q?GdEeME22C6EGmKIeF4YwR6zZB9PmLT4NC25ReuQt/aQ36nfMZohTUNhhdN?=
 =?iso-8859-1?Q?oyhVW1II9kZ3GkmuGJmQ6v6crB1pVz4crNj0o+q+zfcBHMFtW6N8pN968h?=
 =?iso-8859-1?Q?TOvewvpfXpg6a/gPqMGYFli5Hnv9fX0CNy/mZzTmzcWkfih9bgmjVkQDEu?=
 =?iso-8859-1?Q?3dzZ2U+3Ip5DMrjSkMiA8mUe/AogDx703Me70p/+Mw+wXe1cM+Al4Hhk9N?=
 =?iso-8859-1?Q?Tyk5sMN458+WuhxTlFd5yQc1jV9c8FfuynGqsBbrf8n6c4GQd8jnNWnZz4?=
 =?iso-8859-1?Q?5Z7EuFbpkIUOOnPrStQM/ym+PkhuYMnbqZdquTOLuzJ2vxsds8x1M4EWs+?=
 =?iso-8859-1?Q?Wk/RuY0rPspwWwb+zW3SuQ4eQ7g5zicOU+718FFF9NvKWf/eSk8MxUKJ9R?=
 =?iso-8859-1?Q?D2f17vlH301W7F/UWiYP76iJQxSiO+Xzasu+LkQq9aCUe59RQmptDUS1aH?=
 =?iso-8859-1?Q?7ErY3CeKvsKSwr3Agvn5N55sN4WVXsnpyhkg/r5GIKEPH1TfzW9DBd0DrT?=
 =?iso-8859-1?Q?Af1NCUHknwGSU36XqcB1NR5utvbC3+6NVXp8Xi6qr5oZaY9bjRW33t5n8i?=
 =?iso-8859-1?Q?VXfWxUv5aUJqewrvac2kPdQNVVj6q3xWIerhMdlEr8OKZLaj92bPEnPQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 531eb6f4-012d-4e6b-b1b8-08dbd65b557a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2023 19:39:57.2711 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zBH5b3b47YBdnZ7Y+ane/IWPg8kHiJYLqn8NVPyZaKRMOeBII8k+xIo/c73GKvzS/i/QFERLL56G9xuGQT3UhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7390
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 3/3] drm/xe/bo: sync kernel fences for KMD
 buffers
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

On Thu, Oct 26, 2023 at 10:17:19AM +0100, Matthew Auld wrote:
> On 25/10/2023 22:00, Matthew Brost wrote:
> > On Wed, Oct 25, 2023 at 06:39:41PM +0100, Matthew Auld wrote:
> > > With things like pipelined evictions, VRAM pages can be marked as free
> > > and yet still have some active kernel fences, with the idea that the
> > > next caller to allocate the memory will respect them. However it looks
> > > like we are missing synchronisation for KMD internal buffers, like
> > > page-tables, lrc etc. For userspace objects we should already have the
> > > required serialisation for CPU access via the fault handler, and
> > > likewise for GPU access when vm_binding them.
> > > 
> > > To fix this serialise against any kernel fences for all KMD objects at
> > > creation. This seems to resolve some severe corruption seen during
> > > evictions.
> > > 
> > > Closes: ?
> > > Testcase: igt@xe-evict-ccs
> > > Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> > > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > ---
> > >   drivers/gpu/drm/xe/xe_bo.c | 10 ++++++++++
> > >   1 file changed, 10 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> > > index 61789c0e88fb..26a103aa5d48 100644
> > > --- a/drivers/gpu/drm/xe/xe_bo.c
> > > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > > @@ -1272,6 +1272,16 @@ struct xe_bo *__xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
> > >   	else
> > >   		ttm_bo_move_to_lru_tail_unlocked(&bo->ttm);
> > > +	/*
> > > +	 * TTM can give us VRAM that still has active fences i.e GPU might still
> > > +	 * be accessing it. To keep things simple just sync any kernel fences
> > > +	 * here, if the buffer is KMD internal. For normal userspace objects we
> > > +	 * should already have the required pipelining or sync waiting.
> > > +	 */
> > > +	if (type == ttm_bo_type_kernel)
> > > +		dma_resv_wait_timeout(bo->ttm.base.resv, DMA_RESV_USAGE_KERNEL,
> > > +				      false, MAX_SCHEDULE_TIMEOUT);
> > > +
> > 
> > So this is the case where we create a kernel BO within a VM (e.g. memory
> > for page tables) and the memory we received is also within the same VM
> > (bo->ttm.base.resv == VM resv object)? The memory we received could
> > still be being used thus we need to wait for the memory to be idle? Is
> > that right? Also how did you arrive at the DMA_RESV_USAGE_KERNEL slot to
> > determine idle?
> 
> Yeah, if the BO dma-resv is the same as the vm, then waiting on the vm
> dma-resv would also work, or using the KERNEL fences inside as dependencies
> if we want to pipeline it.
> 
> In TTM when evicting VRAM it can be done async. When TTM finds appropriate
> BO(s) to evict we don't need to sync wait on any fences (like for userspace
> job etc). In our xe_bo_move() callback when handed some object to evict, we
> just keep the pipeline going, and schedule the move from VRAM -> TT, using
> the dma-resv fences as input dependencies for the copy job (if any). At the
> end of xe_bo_move() we call ttm_bo_move_accel_cleanup(), passing in the
> final fence for the copy job. TTM then adds that fence as USAGE_KERNEL into
> the dma-resv of the object being evicted. The other important step is
> attaching that same fence onto the actual VRAM resource manager, as per
> ttm_bo_move_pipeline_evict(). With the fence attached to the VRAM manager
> the buddy allocator blocks are all freed, even though the memory ranges they
> represent are potentially still being accessed by the GPU. The next users
> that come along allocating memory from the VRAM manager, will get the copy
> job fence that was attached added to their dma-resv with USAGE_KERNEL. See
> ttm_bo_mem_space()/ttm_bo_mem_force_space() -> ttm_bo_add_move_fence().
> 
> So with all that waiting for DMA_RESV_USAGE_KERNEL here for KMD internal
> stuff should be enough.
> 

Makes sense. Can you adjust the comment explaining why the kernel slot
is the correct slot?

Matt

> > 
> > Matt
> > 
> > >   	return bo;
> > >   }
> > > -- 
> > > 2.41.0
> > > 

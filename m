Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 188F5C0015E
	for <intel-xe@archiver.kernel.org>; Wed, 19 Jul 2023 22:20:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E01C010E522;
	Wed, 19 Jul 2023 22:20:40 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A153A10E522
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Jul 2023 22:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689805238; x=1721341238;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Qkh7cC9X0PxiZGO2yE7yTn31STqM66kUQI5yM53yyhA=;
 b=npZ8kcQ4M36EW3PVFqQXJ54KMi7aIeKZbz173Gn0p9lufdyDwIr4FJ3l
 daZj2tKat56fnYJ4VObAdEY9PKPt2JaUjUp/AJZAe6zbawUxKCAqy9ZbQ
 xsmyaasYQ2OCJ3KElFsPefIpmfrfFc4kWzc1JkZG6p8uBoh7b26pImeK/
 mF7IGekHHLZQy9zCnxRaNLJUKFwpRD8trR5CkuFx+6uHqDSzozts6hAAB
 y7INdjjJSX2/Vwtn7QGbhiLEBATff1hwQaF2n6qx00F4ucBfg4mhHSPuQ
 PvJGzJd+u/hrCFUFoUAvbdm00NteHl7N9bLD7Tu9DtdIjcce0E8x8uGTQ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="452957638"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; d="scan'208";a="452957638"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2023 15:20:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; d="scan'208";a="867630700"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga001.fm.intel.com with ESMTP; 19 Jul 2023 15:20:35 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 19 Jul 2023 15:20:33 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 19 Jul 2023 15:20:33 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.175)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 19 Jul 2023 15:20:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fVtue4QlEeHefQPvYa2CfZEzHPYWZwAZjdiwsKzRpyASPr/V3jw5ZuXlr2vNngAONFmLyyQq1RtNpx50CXJ/vC8XB1cDBf8/ct/H4tpoem6KYlnRJxU+H+t+sElOCcab9nHltiE2j9JWUAXpgCCmChksdFxkdA9o81qnxklIITrCypeB7Wu0cVx4RiEpxUxNppkkX5bTnDpZVs8jB3o07ZQYGCDSr4O8EOuFHR2rnwlqweVvggN7s0q9bXte55WC3cfAMOqocU0ERg0nDpmV2ZGBEnv/AdhpmVi8pZFv+0yS6nebtw76vGMgBEP2xyDRu/uGBhkpYWv3L/oZmD7D9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A0NF6VVDTmcZVn7NRnfKQs2GXsYkwPjsGbgP2B7heY8=;
 b=h866SysWUmBOXITMBq/FPcXut2c0tQYFBjk84u8K0jwmnxpInCo543lz/ak1bhw0dmDOIvj9+03YPq2E80PtO2T3LOdSvxPCMmsfVnlKLbF1ZThx+IhmvaKNPQAo0MLWM2VRHhdE5aoVdXLnXZ8ggB2r0rE14M4mi18I3O1/Vc2k+Tz2CGAglQe6fLRYojkFPxzfReEbiG9EzmpOxfndYJRJnS3d2FkSN+cDP8X6/bre+ipWZRVhUsT0YfVZ5zE/2kNr+jtlFAsDQyCJ2gZ9mcklK6SXHiGrfy762AFjxqVzG82T2J150ghdbJrBUX93MsA6KyS+o+asb3ia90LANw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CO6PR11MB5636.namprd11.prod.outlook.com (2603:10b6:5:357::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.24; Wed, 19 Jul
 2023 22:20:30 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::5645:50f0:9b06:1dd0]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::5645:50f0:9b06:1dd0%3]) with mapi id 15.20.6588.031; Wed, 19 Jul 2023
 22:20:30 +0000
Date: Wed, 19 Jul 2023 22:19:47 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <ZLhhgzKqdhH+G24O@DUT025-TGLU.fm.intel.com>
References: <20230711212748.2029455-1-matthew.brost@intel.com>
 <20230711212748.2029455-3-matthew.brost@intel.com>
 <1ebf9a3b-fcfc-e30f-eec5-e9c87c5be761@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1ebf9a3b-fcfc-e30f-eec5-e9c87c5be761@linux.intel.com>
X-ClientProxiedBy: SJ0PR05CA0104.namprd05.prod.outlook.com
 (2603:10b6:a03:334::19) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CO6PR11MB5636:EE_
X-MS-Office365-Filtering-Correlation-Id: 97a7e5bf-58e0-43d4-9399-08db88a65c9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +ky2JjY+T1KGmL6sio9tTjNoVukDiPv0FN/upXcqC9ZMF22F7chpOvoHHRBqHyqziJdFu/lvSORHlUTCp4nZpMT+4FAtcnXnZMK6wpU3NBAyPhRGaQ5le64pRS6PUgM0eveUUXyW9LRYfy5lZTXtwkHgj6oUUMsYehxsZ+BybEEMuMseC2xsir1caQpB++xbLSRYVFrh/bQANYs0JrNMxT+eZ0BKpp0kas+jo9n94QcSg4ncu77+j5kgAB9sSwhLi2Yq3Nqxtu52uwb5q9j/psFUugjXEyu6Z4016VJ1CdFQx9vmY1Wxk+JrXA0lGj5BepUlgVXhSkZ7xSkrSuVT4ugHUdKzjk+bNi3lEj8kSR0SXgm4C0mfV/DQFE2HNSPRuqEqTt5iWY7BwO5mYyRzKR94S9jKR7pSqwFf8pQoNg6NoYBoc29oJDQyH+P4qbgu39yX4NN72AmocOzGNNb/rm5B9Tg5JWLbjUwgJ3smIl9a/43BzS/iHwIJqX9HnCV8Hhu7adbC18lkPy49Maekpp/0v2dozDOWwAUO+2WwESXQEC2Lrhs72ZL3mXXhFu5d7GT9utkQ9ALxKWvhLh5LP26hSyw+2vuNvt8SykqQLmUmkEZAwUXZs2P1ovVAqn8PNtBAIs5q9WjGXKEe3d+qgA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(376002)(39860400002)(136003)(366004)(396003)(451199021)(6666004)(6486002)(478600001)(83380400001)(66574015)(86362001)(30864003)(2906002)(26005)(186003)(53546011)(6506007)(66476007)(6512007)(38100700002)(44832011)(66946007)(4326008)(316002)(5660300002)(41300700001)(66556008)(6916009)(8676002)(82960400001)(8936002)(10944003)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?LKLP0wd13PHL6pmWVYcb+/6mJ9OeD7JfcHHXf12zzq1w5i4bVNpTuPDI9J?=
 =?iso-8859-1?Q?+JVuiilfVgSczM2dd8r0rZk7SmJt9/LSDDocFvHqtuLmM8eW3Iu2vTpYOr?=
 =?iso-8859-1?Q?a4cdGpD48HTE+yYkMaC7tKO62ZPMcq6gYPT76/r+RAGMjtE7OfKsgtVJHc?=
 =?iso-8859-1?Q?39iOMf+lPc5VDls5+J00H4Ldtl03g6zEBTnrWUxb/orcwv3qPvurVKsxS8?=
 =?iso-8859-1?Q?mGawjJs21tfOjpUJKYXEML792fyacDOW/0lkMKyZzsK6qtjegkE6PeBGbQ?=
 =?iso-8859-1?Q?MJrzEyxYm2BUcB3R7vPFSNrlqLOZr8A14fytfHAYq/qrWElsuzs7PLwpAl?=
 =?iso-8859-1?Q?yMIlI6xuSCW90D5aatwiuMD9nX3FnkDOWSHTrOTpyaTLqS2ebIh+xgGZu8?=
 =?iso-8859-1?Q?wSCZuW11Ej0lWvKATvMuwocZJ2irTUoZdVM/Xm4aRSsFvVdv2gi7vARRdd?=
 =?iso-8859-1?Q?1YcoV/q0cwqrc2XnuGaOwp5shbiPzK/f0wqoz8mWoFq2RqAciMtLVKD9Pw?=
 =?iso-8859-1?Q?BA4VQO80r/BAa8ewfvf66HsPzILkC/36NJIuD0hM3YE6uU/RJhnYiEtC9g?=
 =?iso-8859-1?Q?O54GO5s6Waur45TeSP27hnyjMH8HrjefHxHVitoIg5YcslPIhrLK5kIEzD?=
 =?iso-8859-1?Q?9aixMajvW2e8mQVE3/mbUiw6blE2yykkojdJrivzfH2qNSTBWaWqncF3Ws?=
 =?iso-8859-1?Q?KPiJqGBmg+FPGAy2NO0mrjOAfR0hAzQ4Pq2ehMWcvc8+4nPbjvVn+G+EJs?=
 =?iso-8859-1?Q?3+yKHDmtw9gIqJhM48hfh5UwGjXv77XWm3FVFSvincfbVsd3lblOZL3cTq?=
 =?iso-8859-1?Q?hMVPslB02v+AXAUr/46NUo4vooEKbYmcz3GGGQ7mXLBXAVVThxMmX7NtcF?=
 =?iso-8859-1?Q?/MK1aOr8h+IwPuNOIGvb2d5WZlw68ZyiQA9HxMfnBLX+G/CGV9MtZOMvLU?=
 =?iso-8859-1?Q?rGrjpS4KQoukHeynm/w5E2mFYgkiSxOXP9Owj1Y0fV0J3Y2e0e8uTj1W9J?=
 =?iso-8859-1?Q?5cwszYDQrS8h8Q8BIudFaIwOMbnB5hNSZ1lV2bkqJ6VRGb0+IvG7WY1v9b?=
 =?iso-8859-1?Q?RpN2OPxRZ/StsNltJnybmeOZTvT79f/uNQQbA1ynKi06Bg+YNnJAlDPJ70?=
 =?iso-8859-1?Q?CD0IvGYKNV/sgZBH0loIDP+V69T7HGeW6EQOyxP0VGeBxUaD9+MMfmec3G?=
 =?iso-8859-1?Q?VJqCc/dWTAu3/Lk2GRaxftYe8iSRhW68/5gRXhIXVAM2tSSaeghKkvngLo?=
 =?iso-8859-1?Q?nMl8ZIqaylwsZBZywT0UWN81KDG2x+YLb+wrUaF2UguzqbVEaOqW5KeAIx?=
 =?iso-8859-1?Q?7jdld7QIStzDS1aOL66jgIN6vuEwN1tOhSYdMrNW3ECIQu4ahmxE87+4nh?=
 =?iso-8859-1?Q?YCc+hYeNCIlHtKaLcSCAhyDvI68Zj9UcbIrhAzK0gQmhZNk95baoupBsFw?=
 =?iso-8859-1?Q?4PZqAy18STLJ7BbvfbOuYmJkmvqOyZpJ0DlF1lnLcK9om9Nqkan+KzT28Q?=
 =?iso-8859-1?Q?iolt01z4DpYUIQwzN1ADVPsOHtZaQXtiaD7/0e8EcolnT2c3JIqYwVcFvT?=
 =?iso-8859-1?Q?wyB7CvU10UUHLC/aGBEpBTFznzvi3dD0Z7lF06R6L8v+6We2Co9pOxFip0?=
 =?iso-8859-1?Q?g5v21ir+1oZHz4W8BGlhjfA8YqDSzzKN+t/m6TNBE95aR2cIkZ1HZiCg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 97a7e5bf-58e0-43d4-9399-08db88a65c9d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2023 22:20:30.5120 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /SyIxcXPorTU3hbVqb16wivqv8SAY+PDROqwnuB0P9whnHfImUWSVxMul7f9Xk7VeYZzzI++QMveqUB8bEkfHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5636
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/5] drm/xe: Reduce the number list links in
 xe_vma
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

On Sat, Jul 15, 2023 at 03:11:59PM +0200, Thomas Hellström wrote:
> Hi, Matthew,
> 
> On 7/11/23 23:27, Matthew Brost wrote:
> > Combine the userptr, rebind, and destroy links into a union as
> > the lists these links belong to are mutually exclusive.
> > 
> > v2: Adjust which lists are combined (Thomas H)
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_bo.c       |  6 +++--
> >   drivers/gpu/drm/xe/xe_exec.c     |  2 +-
> >   drivers/gpu/drm/xe/xe_pt.c       |  2 +-
> >   drivers/gpu/drm/xe/xe_vm.c       | 45 ++++++++++++++++----------------
> >   drivers/gpu/drm/xe/xe_vm_types.h | 28 +++++++++-----------
> >   5 files changed, 41 insertions(+), 42 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> > index 6353afa8d846..ca7f74ecb753 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.c
> > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > @@ -474,8 +474,10 @@ static int xe_bo_trigger_rebind(struct xe_device *xe, struct xe_bo *bo,
> >   			}
> >   			xe_vm_assert_held(vm);
> > -			if (list_empty(&vma->rebind_link) && vma->tile_present)
> > -				list_add_tail(&vma->rebind_link, &vm->rebind_list);
> > +			if (list_empty(&vma->combined_links.rebind) &&
> > +			    vma->tile_present)
> > +				list_add_tail(&vma->combined_links.rebind,
> > +					      &vm->rebind_list);
> >   			if (vm_resv_locked)
> >   				dma_resv_unlock(&vm->resv);
> > diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
> > index ba13d20ed348..bc5bd4bdc582 100644
> > --- a/drivers/gpu/drm/xe/xe_exec.c
> > +++ b/drivers/gpu/drm/xe/xe_exec.c
> > @@ -120,7 +120,7 @@ static int xe_exec_begin(struct xe_engine *e, struct ww_acquire_ctx *ww,
> >   	 * BOs have valid placements possibly moving an evicted BO back
> >   	 * to a location where the GPU can access it).
> >   	 */
> > -	list_for_each_entry(vma, &vm->rebind_list, rebind_link) {
> > +	list_for_each_entry(vma, &vm->rebind_list, combined_links.rebind) {
> >   		XE_WARN_ON(xe_vma_is_null(vma));
> >   		if (xe_vma_is_userptr(vma))
> > diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> > index a8d96cbd53e3..3b43b32f4a33 100644
> > --- a/drivers/gpu/drm/xe/xe_pt.c
> > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > @@ -1690,7 +1690,7 @@ __xe_pt_unbind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_engine *e
> >   	}
> >   	if (!vma->tile_present)
> > -		list_del_init(&vma->rebind_link);
> > +		list_del_init(&vma->combined_links.rebind);
> >   	if (unbind_pt_update.locked) {
> >   		XE_WARN_ON(!xe_vma_is_userptr(vma));
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index 5f4f6dab270a..b2847be6de6a 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -467,7 +467,8 @@ int xe_vm_lock_dma_resv(struct xe_vm *vm, struct ww_acquire_ctx *ww,
> >   		list_del_init(&vma->notifier.rebind_link);
> >   		if (vma->tile_present && !(vma->gpuva.flags & XE_VMA_DESTROYED))
> > -			list_move_tail(&vma->rebind_link, &vm->rebind_list);
> > +			list_move_tail(&vma->combined_links.rebind,
> > +				       &vm->rebind_list);
> >   	}
> >   	spin_unlock(&vm->notifier.list_lock);
> > @@ -608,7 +609,7 @@ static void preempt_rebind_work_func(struct work_struct *w)
> >   	if (err)
> >   		goto out_unlock;
> > -	list_for_each_entry(vma, &vm->rebind_list, rebind_link) {
> > +	list_for_each_entry(vma, &vm->rebind_list, combined_links.rebind) {
> >   		if (xe_vma_has_no_bo(vma) ||
> >   		    vma->gpuva.flags & XE_VMA_DESTROYED)
> >   			continue;
> > @@ -780,17 +781,20 @@ int xe_vm_userptr_pin(struct xe_vm *vm)
> >   	list_for_each_entry_safe(vma, next, &vm->userptr.invalidated,
> >   				 userptr.invalidate_link) {
> >   		list_del_init(&vma->userptr.invalidate_link);
> > -		list_move_tail(&vma->userptr_link, &vm->userptr.repin_list);
> > +		if (list_empty(&vma->combined_links.userptr))
> > +			list_move_tail(&vma->combined_links.userptr,
> > +				       &vm->userptr.repin_list);
> >   	}
> >   	spin_unlock(&vm->userptr.invalidated_lock);
> >   	/* Pin and move to temporary list */
> > -	list_for_each_entry_safe(vma, next, &vm->userptr.repin_list, userptr_link) {
> > +	list_for_each_entry_safe(vma, next, &vm->userptr.repin_list,
> > +				 combined_links.userptr) {
> >   		err = xe_vma_userptr_pin_pages(vma);
> >   		if (err < 0)
> >   			goto out_err;
> > -		list_move_tail(&vma->userptr_link, &tmp_evict);
> > +		list_move_tail(&vma->combined_links.userptr, &tmp_evict);
> >   	}
> >   	/* Take lock and move to rebind_list for rebinding. */
> > @@ -798,10 +802,8 @@ int xe_vm_userptr_pin(struct xe_vm *vm)
> >   	if (err)
> >   		goto out_err;
> > -	list_for_each_entry_safe(vma, next, &tmp_evict, userptr_link) {
> > -		list_del_init(&vma->userptr_link);
> > -		list_move_tail(&vma->rebind_link, &vm->rebind_list);
> > -	}
> > +	list_for_each_entry_safe(vma, next, &tmp_evict, combined_links.userptr)
> > +		list_move_tail(&vma->combined_links.rebind, &vm->rebind_list);
> >   	dma_resv_unlock(&vm->resv);
> > @@ -845,10 +847,11 @@ struct dma_fence *xe_vm_rebind(struct xe_vm *vm, bool rebind_worker)
> >   		return NULL;
> >   	xe_vm_assert_held(vm);
> > -	list_for_each_entry_safe(vma, next, &vm->rebind_list, rebind_link) {
> > +	list_for_each_entry_safe(vma, next, &vm->rebind_list,
> > +				 combined_links.rebind) {
> >   		XE_WARN_ON(!vma->tile_present);
> > -		list_del_init(&vma->rebind_link);
> > +		list_del_init(&vma->combined_links.rebind);
> >   		dma_fence_put(fence);
> >   		if (rebind_worker)
> >   			trace_xe_vma_rebind_worker(vma);
> > @@ -883,9 +886,7 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
> >   		return vma;
> >   	}
> > -	INIT_LIST_HEAD(&vma->rebind_link);
> > -	INIT_LIST_HEAD(&vma->unbind_link);
> > -	INIT_LIST_HEAD(&vma->userptr_link);
> > +	INIT_LIST_HEAD(&vma->combined_links.rebind);
> >   	INIT_LIST_HEAD(&vma->userptr.invalidate_link);
> >   	INIT_LIST_HEAD(&vma->notifier.rebind_link);
> >   	INIT_LIST_HEAD(&vma->extobj.link);
> > @@ -1058,15 +1059,14 @@ static void xe_vma_destroy(struct xe_vma *vma, struct dma_fence *fence)
> >   	struct xe_vm *vm = xe_vma_vm(vma);
> >   	lockdep_assert_held_write(&vm->lock);
> > -	XE_BUG_ON(!list_empty(&vma->unbind_link));
> > +	XE_BUG_ON(!list_empty(&vma->combined_links.destroy));
> >   	if (xe_vma_is_userptr(vma)) {
> >   		XE_WARN_ON(!(vma->gpuva.flags & XE_VMA_DESTROYED));
> >   		spin_lock(&vm->userptr.invalidated_lock);
> > -		list_del_init(&vma->userptr.invalidate_link);
> > +		list_del(&vma->userptr.invalidate_link);
> >   		spin_unlock(&vm->userptr.invalidated_lock);
> > -		list_del(&vma->userptr_link);
> >   	} else if (!xe_vma_is_null(vma)) {
> >   		xe_bo_assert_held(xe_vma_bo(vma));
> > @@ -1087,9 +1087,6 @@ static void xe_vma_destroy(struct xe_vma *vma, struct dma_fence *fence)
> >   	}
> >   	xe_vm_assert_held(vm);
> > -	if (!list_empty(&vma->rebind_link))
> > -		list_del(&vma->rebind_link);
> > -
> >   	if (fence) {
> >   		int ret = dma_fence_add_callback(fence, &vma->destroy_cb,
> >   						 vma_destroy_cb);
> > @@ -1443,11 +1440,12 @@ void xe_vm_close_and_put(struct xe_vm *vm)
> >   		/* easy case, remove from VMA? */
> >   		if (xe_vma_has_no_bo(vma) || xe_vma_bo(vma)->vm) {
> > +			list_del_init(&vma->combined_links.rebind);
> >   			xe_vma_destroy(vma, NULL);
> >   			continue;
> >   		}
> > -		list_add_tail(&vma->unbind_link, &contested);
> > +		list_move_tail(&vma->combined_links.destroy, &contested);
> >   	}
> >   	/*
> > @@ -1475,8 +1473,9 @@ void xe_vm_close_and_put(struct xe_vm *vm)
> >   	 * Since we hold a refcount to the bo, we can remove and free
> >   	 * the members safely without locking.
> >   	 */
> > -	list_for_each_entry_safe(vma, next_vma, &contested, unbind_link) {
> > -		list_del_init(&vma->unbind_link);
> > +	list_for_each_entry_safe(vma, next_vma, &contested,
> > +				 combined_links.destroy) {
> > +		list_del_init(&vma->combined_links.destroy);
> >   		xe_vma_destroy_unlocked(vma);
> >   	}
> > diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> > index f17dc5d7370e..84bf1620214c 100644
> > --- a/drivers/gpu/drm/xe/xe_vm_types.h
> > +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> > @@ -49,21 +49,19 @@ struct xe_vma {
> >   	 */
> >   	u64 tile_present;
> > -	/** @userptr_link: link into VM repin list if userptr */
> > -	struct list_head userptr_link;
> > -
> > -	/**
> > -	 * @rebind_link: link into VM if this VMA needs rebinding, and
> > -	 * if it's a bo (not userptr) needs validation after a possible
> > -	 * eviction. Protected by the vm's resv lock.
> > -	 */
> > -	struct list_head rebind_link;
> 
> The rebind_link and the userptr_link are not combinable. To be combinable
> they need to either be protected by the same lock or be kept mutually
> exclusive by some other *simple* argument, like construction / destruction,
> used for different subclasses etc.
> 

This is definitely safe, I think you are getting confused as we have a
lot of lists.

> The userptr_link is protected by the userptr.invalidated_lock and the

No, userptr.invalidate_link is protected by userptr.invalidated_lock.

combined_links.userptr is protected by vm->lock in write mode. I'll add
comment for this.

Yes, the combined_links.userptr & combined_links.rebind links have
different locks but this is 100% safe.

See xe_vm_userptr_pin, we safely move from userptr.invalidate_link ->
combined_links.userptr -> combined_links.rebind with the correct locks
(vm->lock is held throughout, dma-resv lock grabbed when using
combined_links.rebind).

We add to the combined_links.rebind with the dma-resv lock in
xe_bo_trigger_rebind which has mutually exlusive execution with
xe_vm_userptr_pin as the former is for VMAs with a BO and the later is
for userptrs.

We remove from combined_links.rebind in combined_links.rebind which has
both vm->lock & dma-resv lock. This makes it safe with both
xe_vm_userptr_pin & xe_bo_trigger_rebind.

In xe_vm_lock_dma_resv we move from notifier.rebind_link ->
combined_links.rebind and we have both vm->lock and dma-resv lock. Again
safe with everything above.

xe_vm_rebind we remove from combined_links.rebind and we have both
vm->lock and dma-resv lock. Again safe with everything above.

Lastly in xe_vm_close_and_put we use combined_links.destroy but again
have vm->lock and dma-resv lock.

All safe.

> rebind_link by the vm resv, and no simple argument can be made. In fact
> let's say that a userptr sits on or is being moved to the rebind list, and
> then the invalidation notifier gets called, which will try to move it to the
> userptr list again using the userptr link. In the best case it will fail the
> move since the list is not empty, in the worst case list corruption due to
> the list head is currently being modified.
> 
> So IMO for any list head being combined like this, we need to kerneldoc why
> this is possible, using either the lock argument or another simple argument
> like detailed above.
> 

I'll update the kernel doc.

Matt

> I *think* the notifier.rebind_list and the userptr_list are combinable,
> though, using the different vma subclass (userptr/bo) argument.
> 
> Thanks,
> 
> Thomas
> 
> 
> > -
> > -	/**
> > -	 * @unbind_link: link or list head if an unbind of multiple VMAs, in
> > -	 * single unbind op, is being done.
> > -	 */
> > -	struct list_head unbind_link;
> > +	/** @combined_links: links into lists which are mutually exclusive */
> > +	union {
> > +		/** @userptr: link into VM repin list if userptr */
> > +		struct list_head userptr;
> > +		/**
> > +		 * @rebind: link into VM if this VMA needs rebinding, and
> > +		 * if it's a bo (not userptr) needs validation after a possible
> > +		 * eviction. Protected by the vm's resv lock.
> > +		 */
> > +		struct list_head rebind;
> > +		/** @destroy: link to contested list when VM is being closed */
> > +		struct list_head destroy;
> > +	} combined_links;
> >   	/** @destroy_cb: callback to destroy VMA when unbind job is done */
> >   	struct dma_fence_cb destroy_cb;

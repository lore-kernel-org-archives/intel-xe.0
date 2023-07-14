Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D26EDEB64DA
	for <intel-xe@archiver.kernel.org>; Fri, 14 Jul 2023 03:57:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9174710E101;
	Fri, 14 Jul 2023 03:57:27 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 846B410E101
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Jul 2023 03:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689307045; x=1720843045;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Ck3stIYxl3a3Ld0TJg0czuC4hr+hhRhXxpfE/rzRc4Q=;
 b=QT9Wx8QsYQSMPmBrtKHhQiM1++9GFVYF/H8Nt/XFQoF5+uBKXOAewRZW
 /TTHh9Vd6Gg+g3n8pAUTehQRfoFsppwPOcIZ9f5BwfYdxTi9CXa56nfU2
 8pNgVR7mVKM8TKpnnIvGn/ERnvWYMFAOL/vDVzDa+cRQMRCCKka+PkTBX
 TPI9VpAABHWdPRCZytovBUjqkRVJqdTm2Igxegiz6QOCgAEeLL5J2SqRl
 V5tnrVJu66dN9FFEFw+GemAJMEWcUaPP2kw/XB78nKrfVCfP9dnGU5lE6
 9gt7Kh616EyfVfH4h+UsmQNERBMcK7No8Lo2YQQO8EScC7AAtJWeLLRai A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="429148778"
X-IronPort-AV: E=Sophos;i="6.01,204,1684825200"; d="scan'208";a="429148778"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2023 20:57:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="751889085"
X-IronPort-AV: E=Sophos;i="6.01,204,1684825200"; d="scan'208";a="751889085"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga008.jf.intel.com with ESMTP; 13 Jul 2023 20:57:24 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 13 Jul 2023 20:57:23 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 13 Jul 2023 20:57:23 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.106)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 13 Jul 2023 20:57:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BnnqolzYPkAbgR+YDhbmW0xHHEOBdwOGNcOzQRUtTX5FTsDxQGIvRqCzxYrQmuJ+rSfIUiD/29KVC3VDwFGGJpla8oyqC5BikAKyG3dc/vzLPm/0VtzY1mx45ppMfrE3NXNGv0Xcw0LGZ/O7CND3ERjChgfrXr6/WD3U1Q/9Xvmghx2rsQ4TBMWxZUwYaD0TORjjTNMYUNVy5qGyfkXB8IU/qVe9Fi53MgwO6Kh4msJJYF9/03hmvBMJt10bI87h0+AhGXiO9FbSe3718uXiHY+gMYYOeqQ5LB8s0mGNYNxAa1w8d2VIzJ4kbkYFUmti6ljNWopZ8GqYotzYXMR6HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NIhyqTFYvChdItTZ5RU0tGe75Sam8uFdgSVNOUJDLLQ=;
 b=XeBncmw2wFy5kAPFt0Tgh1sqd+EnUDWJnARCeUkBnLdJDhhAaAHefwVKjPl0Wfn3wgzBIWV04iqrrKUeG5ufxCkAKOfUMsfs5H9kAdvd7e9MNOOYKtvdESZotbAd7lj32NKlBSILcj9cL9GIZGYu2EIXrECFlYBTBMtnm1+TENGoTdu1Z9Cw368ahW3DHO2V+7L8Olji+L/PxNvncgQQKI4XsEJ1SD71rEDjAlqPVcFrE9VKs/ERu4WR8UQzAySl8vBcb4q1XAD+qSoWKiCyd9Agx+HRMj6OYuX0POZMFT8DFEvW1RiHZO1v/C7M4G8S3t9xtzgjFUteFOdsItV/Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MN2PR11MB4680.namprd11.prod.outlook.com (2603:10b6:208:26d::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.26; Fri, 14 Jul
 2023 03:57:16 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::c65d:c846:f197:3ca5]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::c65d:c846:f197:3ca5%4]) with mapi id 15.20.6565.028; Fri, 14 Jul 2023
 03:57:16 +0000
Date: Fri, 14 Jul 2023 03:56:27 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <ZLDHa2RV07IAZnrJ@DUT025-TGLU>
References: <20230711212748.2029455-1-matthew.brost@intel.com>
 <20230711212748.2029455-3-matthew.brost@intel.com>
 <ZLBcDIPK7xT2qANE@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZLBcDIPK7xT2qANE@intel.com>
X-ClientProxiedBy: SJ0PR03CA0033.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::8) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MN2PR11MB4680:EE_
X-MS-Office365-Filtering-Correlation-Id: 9aa66c85-648b-45a1-247b-08db841e698b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: k0aCG3HyJcbTzV9Qyp57tQ0dkMdAyIfjaKt3QAhvjm0iAB0Dq3dqZ8llo6H34Asnu21pVBgQ14f51D+cmQR/acq+I2wnJSfB8XF9Pme+v1kfod23+Jv9WK9hFnjCu8DeeYEwPdPeuv0KxNoZaNh3H8k4cWwnDW1fV8eEHuuWh5aMFV9xPBL3HcDvQGfRSOsKKO7uU9uzqYSEu136kdRXwaOkEnz/kXlPWpJZYi9caME3VmrTrBXkGbeyJjjPnLJN6Vci0w/kvB+6ngNTFuUR0B/16Qt34OEsds4OS90S49GS7io3UtpSQRJE87s9Vb3KAUf+/2MGuPhMS7xxydk6noTSFQJpDB5AanrFMKJZgicAohM5Fa0WeFTFoWdfV3UAfxYa7Ht1sEKq5q2VI3K4c1ukSl0X7NJtCnC8pS7Rj7aGBA13YSyX1Ccc2tEyCZRyfw5xK2C9SagVOYzV2m7liOamkTfJWrCqMJ6cIzm7Vw+9JkrukqX1w+dUvEl7Gxa/zqEUQ5I2ZAgDWiJ6UexUBndksyoWXqnvM6fU8VQ4p8FwRBCa2Ok/paiI0DKIGo6f
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(39860400002)(396003)(346002)(366004)(136003)(376002)(451199021)(66556008)(33716001)(9686003)(478600001)(6636002)(4326008)(6486002)(6666004)(41300700001)(316002)(66946007)(86362001)(66476007)(83380400001)(186003)(82960400001)(26005)(38100700002)(6512007)(2906002)(6862004)(8936002)(44832011)(5660300002)(8676002)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?n8Zk+6vYqMdgTapw4eL4s32QxJFx6VWqKd0M1xv7LSVUsFgkCHUb3dM64F9q?=
 =?us-ascii?Q?W11S01YMx66vs/0nkl9TfQLrXbikbqlPT5l8jKIMQVA0tr6qwU1qI+VWQEra?=
 =?us-ascii?Q?8vkhhGuJR5nuhebEJfpX1QtDnJ0yDDeo8WmI+0CBeaR6BLI/Sczs1PV11d+P?=
 =?us-ascii?Q?WstQmBczLnChLTrnfVAhPczaGuO4Y+FyQ71Su8mOSd522tYopA1Cbu0EWIXV?=
 =?us-ascii?Q?2f60uUVJ0W9jsfEscxBZVpjLM9rkYEixG7MDaQV6zRSMlbMvnGXYWkL9Rex7?=
 =?us-ascii?Q?49exxDFqVtLKzElxh629DYzYp8PNq5kgkVFt33BoSThc96ufLkVmwsVcl8eY?=
 =?us-ascii?Q?zoWvpw2QndDsIwjejLBcyQUO7cuVFcebBg8h9HEJOT1M/MGzvM+4FIOcC/Gh?=
 =?us-ascii?Q?O0R8lDlm63hk9dl1rPhtVLPTusLal85h4pZRHoKdNCL4b5Hy07GGESHvLEBR?=
 =?us-ascii?Q?/ZjOkVYLt5BnNOQevgjn+uRK4XzyoxECn67AUAkCFE/ZdVYdiwRoECLbvsaI?=
 =?us-ascii?Q?MhHEvPp2i68NWKHSbp4ADzOOvRnQn7hoT2V/C1Mfdj0s3D/EruOAwsFlEc4v?=
 =?us-ascii?Q?DitYgW/5XUvsO/0/pv4ZP9kMx8OcFeQ+Pxou6pFBJVHcSdcOZmCSQ3B3wtx5?=
 =?us-ascii?Q?6m+R2sgIObTvyiOWiTG9LD4agmmGtqGlRHNhzRO019A7UO0S9VGeL+81nQel?=
 =?us-ascii?Q?a5huTHkZ/qEFpEZTFEXOs18VIA19LQGeiZQjcheuHgGH3uji7kz4KkuFIDU2?=
 =?us-ascii?Q?Oe+Y9scTkPYCCudRCj1FD1MfQwxaienuZkXQ19eGfE+NjxvnIeP6+5IyjVMQ?=
 =?us-ascii?Q?qUI/jPs1aSBxE95TIrANNIqMiLuOWtVyHZsevLY0ANdtbQOAlQX1uIzheqc5?=
 =?us-ascii?Q?jdXTvmv+UfDE+Vl7sei9MelATgeHhJLP+Qvw88+Rt+wceCja3G6u4rKNpdoS?=
 =?us-ascii?Q?r4A8FitN7zOSLu7Atc3rm1PHpVDqDnbSS44bwh4VfWEOOjG6umHvcCi+qNl2?=
 =?us-ascii?Q?uU2sTQ3GGFGTpHxUZwFBY2V9y4rfj+JCp3XIgk7BzbUqwFwJLl3LU9VW90Ef?=
 =?us-ascii?Q?l1NJKgGSFWo1O8gI89bcGMPicp2JV5d7Dw9tmWvp/lmp95Cr3A/qFZe1+nJ6?=
 =?us-ascii?Q?5cDTPRvAdFBSssYswyy6inbNOb1fIX1gK/9WOEw6HT8MoZOhAqPoQzBzWvS/?=
 =?us-ascii?Q?dYajL4O+X1NrTK5CXybTM8e2kd3GiZP3LxzBRmQZRbFy3rQciY5nbC3/6mXw?=
 =?us-ascii?Q?P2hEcY8B6foB69toOarI2qyp9iTMyeyVzPD5Wa7mFbbanG/nPq5A7OyaRkMF?=
 =?us-ascii?Q?MGXj52NaOMsF3FNGYmHILN8hSb8qds6XNyhWdJyHEpHRlsYe5CAPr/fI93og?=
 =?us-ascii?Q?Jz0HUHbLoEsZQa1QvwetO8R6LeCkVHCT71CDYMMsx25YdAEnnyEhj9fCWuGE?=
 =?us-ascii?Q?3+bdXFmdsWANllgIRncLGLhu+FU9nhDAMLpGbyvE5wkQstQA1O2idRXG0TfT?=
 =?us-ascii?Q?+vUutDhj1YcCmEI83tKQZoS8qMeheb11p7Drv46o/lop+xVRMe/PftyjDXzR?=
 =?us-ascii?Q?+bis5fhLC1E8UkR3ns7O6z1qoBA0SFBU4NTfZ1if87WSwCwFRdqL0KWPdb3c?=
 =?us-ascii?Q?LA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9aa66c85-648b-45a1-247b-08db841e698b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2023 03:57:15.9104 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8jdMjGXwsGMv9rBYJw/LuW/sqQgyTpMrkuIO7kpuh7fEfUmrzorxlRWfF+kZZQrudim79QIwIq8+gV/b9Ul8cw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4680
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

On Thu, Jul 13, 2023 at 04:18:20PM -0400, Rodrigo Vivi wrote:
> On Tue, Jul 11, 2023 at 02:27:45PM -0700, Matthew Brost wrote:
> > Combine the userptr, rebind, and destroy links into a union as
> > the lists these links belong to are mutually exclusive.
> > 
> > v2: Adjust which lists are combined (Thomas H)
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_bo.c       |  6 +++--
> >  drivers/gpu/drm/xe/xe_exec.c     |  2 +-
> >  drivers/gpu/drm/xe/xe_pt.c       |  2 +-
> >  drivers/gpu/drm/xe/xe_vm.c       | 45 ++++++++++++++++----------------
> >  drivers/gpu/drm/xe/xe_vm_types.h | 28 +++++++++-----------
> >  5 files changed, 41 insertions(+), 42 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> > index 6353afa8d846..ca7f74ecb753 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.c
> > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > @@ -474,8 +474,10 @@ static int xe_bo_trigger_rebind(struct xe_device *xe, struct xe_bo *bo,
> >  			}
> >  
> >  			xe_vm_assert_held(vm);
> > -			if (list_empty(&vma->rebind_link) && vma->tile_present)
> > -				list_add_tail(&vma->rebind_link, &vm->rebind_list);
> > +			if (list_empty(&vma->combined_links.rebind) &&
> > +			    vma->tile_present)
> > +				list_add_tail(&vma->combined_links.rebind,
> > +					      &vm->rebind_list);
> >  
> >  			if (vm_resv_locked)
> >  				dma_resv_unlock(&vm->resv);
> > diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
> > index ba13d20ed348..bc5bd4bdc582 100644
> > --- a/drivers/gpu/drm/xe/xe_exec.c
> > +++ b/drivers/gpu/drm/xe/xe_exec.c
> > @@ -120,7 +120,7 @@ static int xe_exec_begin(struct xe_engine *e, struct ww_acquire_ctx *ww,
> >  	 * BOs have valid placements possibly moving an evicted BO back
> >  	 * to a location where the GPU can access it).
> >  	 */
> > -	list_for_each_entry(vma, &vm->rebind_list, rebind_link) {
> > +	list_for_each_entry(vma, &vm->rebind_list, combined_links.rebind) {
> >  		XE_WARN_ON(xe_vma_is_null(vma));
> >  
> >  		if (xe_vma_is_userptr(vma))
> > diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> > index a8d96cbd53e3..3b43b32f4a33 100644
> > --- a/drivers/gpu/drm/xe/xe_pt.c
> > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > @@ -1690,7 +1690,7 @@ __xe_pt_unbind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_engine *e
> >  	}
> >  
> >  	if (!vma->tile_present)
> > -		list_del_init(&vma->rebind_link);
> > +		list_del_init(&vma->combined_links.rebind);
> >  
> >  	if (unbind_pt_update.locked) {
> >  		XE_WARN_ON(!xe_vma_is_userptr(vma));
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index 5f4f6dab270a..b2847be6de6a 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -467,7 +467,8 @@ int xe_vm_lock_dma_resv(struct xe_vm *vm, struct ww_acquire_ctx *ww,
> >  
> >  		list_del_init(&vma->notifier.rebind_link);
> >  		if (vma->tile_present && !(vma->gpuva.flags & XE_VMA_DESTROYED))
> > -			list_move_tail(&vma->rebind_link, &vm->rebind_list);
> > +			list_move_tail(&vma->combined_links.rebind,
> > +				       &vm->rebind_list);
> >  	}
> >  	spin_unlock(&vm->notifier.list_lock);
> >  
> > @@ -608,7 +609,7 @@ static void preempt_rebind_work_func(struct work_struct *w)
> >  	if (err)
> >  		goto out_unlock;
> >  
> > -	list_for_each_entry(vma, &vm->rebind_list, rebind_link) {
> > +	list_for_each_entry(vma, &vm->rebind_list, combined_links.rebind) {
> >  		if (xe_vma_has_no_bo(vma) ||
> >  		    vma->gpuva.flags & XE_VMA_DESTROYED)
> >  			continue;
> > @@ -780,17 +781,20 @@ int xe_vm_userptr_pin(struct xe_vm *vm)
> >  	list_for_each_entry_safe(vma, next, &vm->userptr.invalidated,
> >  				 userptr.invalidate_link) {
> >  		list_del_init(&vma->userptr.invalidate_link);
> > -		list_move_tail(&vma->userptr_link, &vm->userptr.repin_list);
> > +		if (list_empty(&vma->combined_links.userptr))
> > +			list_move_tail(&vma->combined_links.userptr,
> > +				       &vm->userptr.repin_list);
> >  	}
> >  	spin_unlock(&vm->userptr.invalidated_lock);
> >  
> >  	/* Pin and move to temporary list */
> > -	list_for_each_entry_safe(vma, next, &vm->userptr.repin_list, userptr_link) {
> > +	list_for_each_entry_safe(vma, next, &vm->userptr.repin_list,
> > +				 combined_links.userptr) {
> >  		err = xe_vma_userptr_pin_pages(vma);
> >  		if (err < 0)
> >  			goto out_err;
> >  
> > -		list_move_tail(&vma->userptr_link, &tmp_evict);
> > +		list_move_tail(&vma->combined_links.userptr, &tmp_evict);
> >  	}
> >  
> >  	/* Take lock and move to rebind_list for rebinding. */
> > @@ -798,10 +802,8 @@ int xe_vm_userptr_pin(struct xe_vm *vm)
> >  	if (err)
> >  		goto out_err;
> >  
> > -	list_for_each_entry_safe(vma, next, &tmp_evict, userptr_link) {
> > -		list_del_init(&vma->userptr_link);
> > -		list_move_tail(&vma->rebind_link, &vm->rebind_list);
> > -	}
> > +	list_for_each_entry_safe(vma, next, &tmp_evict, combined_links.userptr)
> > +		list_move_tail(&vma->combined_links.rebind, &vm->rebind_list);
> >  
> >  	dma_resv_unlock(&vm->resv);
> >  
> > @@ -845,10 +847,11 @@ struct dma_fence *xe_vm_rebind(struct xe_vm *vm, bool rebind_worker)
> >  		return NULL;
> >  
> >  	xe_vm_assert_held(vm);
> > -	list_for_each_entry_safe(vma, next, &vm->rebind_list, rebind_link) {
> > +	list_for_each_entry_safe(vma, next, &vm->rebind_list,
> > +				 combined_links.rebind) {
> >  		XE_WARN_ON(!vma->tile_present);
> >  
> > -		list_del_init(&vma->rebind_link);
> > +		list_del_init(&vma->combined_links.rebind);
> >  		dma_fence_put(fence);
> >  		if (rebind_worker)
> >  			trace_xe_vma_rebind_worker(vma);
> > @@ -883,9 +886,7 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
> >  		return vma;
> >  	}
> >  
> > -	INIT_LIST_HEAD(&vma->rebind_link);
> > -	INIT_LIST_HEAD(&vma->unbind_link);
> > -	INIT_LIST_HEAD(&vma->userptr_link);
> > +	INIT_LIST_HEAD(&vma->combined_links.rebind);
> >  	INIT_LIST_HEAD(&vma->userptr.invalidate_link);
> >  	INIT_LIST_HEAD(&vma->notifier.rebind_link);
> >  	INIT_LIST_HEAD(&vma->extobj.link);
> > @@ -1058,15 +1059,14 @@ static void xe_vma_destroy(struct xe_vma *vma, struct dma_fence *fence)
> >  	struct xe_vm *vm = xe_vma_vm(vma);
> >  
> >  	lockdep_assert_held_write(&vm->lock);
> > -	XE_BUG_ON(!list_empty(&vma->unbind_link));
> > +	XE_BUG_ON(!list_empty(&vma->combined_links.destroy));
> >  
> >  	if (xe_vma_is_userptr(vma)) {
> >  		XE_WARN_ON(!(vma->gpuva.flags & XE_VMA_DESTROYED));
> >  
> >  		spin_lock(&vm->userptr.invalidated_lock);
> > -		list_del_init(&vma->userptr.invalidate_link);

This doesn't, will remove.

> > +		list_del(&vma->userptr.invalidate_link);
> >  		spin_unlock(&vm->userptr.invalidated_lock);
> > -		list_del(&vma->userptr_link);

This does.

Matt

> 
> this chunk has nothing to do with the combined_links, so it needs a separated patch.
> 
> >  	} else if (!xe_vma_is_null(vma)) {
> >  		xe_bo_assert_held(xe_vma_bo(vma));
> >  
> > @@ -1087,9 +1087,6 @@ static void xe_vma_destroy(struct xe_vma *vma, struct dma_fence *fence)
> >  	}
> >  
> >  	xe_vm_assert_held(vm);
> > -	if (!list_empty(&vma->rebind_link))
> > -		list_del(&vma->rebind_link);
> > -
> >  	if (fence) {
> >  		int ret = dma_fence_add_callback(fence, &vma->destroy_cb,
> >  						 vma_destroy_cb);
> > @@ -1443,11 +1440,12 @@ void xe_vm_close_and_put(struct xe_vm *vm)
> >  
> >  		/* easy case, remove from VMA? */
> >  		if (xe_vma_has_no_bo(vma) || xe_vma_bo(vma)->vm) {
> > +			list_del_init(&vma->combined_links.rebind);
> >  			xe_vma_destroy(vma, NULL);
> >  			continue;
> >  		}
> >  
> > -		list_add_tail(&vma->unbind_link, &contested);
> > +		list_move_tail(&vma->combined_links.destroy, &contested);
> >  	}
> >  
> >  	/*
> > @@ -1475,8 +1473,9 @@ void xe_vm_close_and_put(struct xe_vm *vm)
> >  	 * Since we hold a refcount to the bo, we can remove and free
> >  	 * the members safely without locking.
> >  	 */
> > -	list_for_each_entry_safe(vma, next_vma, &contested, unbind_link) {
> > -		list_del_init(&vma->unbind_link);
> > +	list_for_each_entry_safe(vma, next_vma, &contested,
> > +				 combined_links.destroy) {
> > +		list_del_init(&vma->combined_links.destroy);
> >  		xe_vma_destroy_unlocked(vma);
> >  	}
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> > index f17dc5d7370e..84bf1620214c 100644
> > --- a/drivers/gpu/drm/xe/xe_vm_types.h
> > +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> > @@ -49,21 +49,19 @@ struct xe_vma {
> >  	 */
> >  	u64 tile_present;
> >  
> > -	/** @userptr_link: link into VM repin list if userptr */
> > -	struct list_head userptr_link;
> > -
> > -	/**
> > -	 * @rebind_link: link into VM if this VMA needs rebinding, and
> > -	 * if it's a bo (not userptr) needs validation after a possible
> > -	 * eviction. Protected by the vm's resv lock.
> > -	 */
> > -	struct list_head rebind_link;
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
> 
> this is a good optimization, but from the organization point of view and naming
> this is getting confused... if we could at least find a generic name that makes
> sense for these mutual exclusive operations other then 'combined_links'.... :/
> 
> but well, I'm also not good with names.
> 
> with separated patches,
> 
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> on both...
> 
> >  
> >  	/** @destroy_cb: callback to destroy VMA when unbind job is done */
> >  	struct dma_fence_cb destroy_cb;
> > -- 
> > 2.34.1
> > 

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 009B0C83F01
	for <intel-xe@archiver.kernel.org>; Wed, 30 Aug 2023 21:04:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E8C310E5D5;
	Wed, 30 Aug 2023 21:04:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14F0E10E5D5
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Aug 2023 21:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693429492; x=1724965492;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=cYjAlh98VreTW+ejUpWxDnofYvSYIgflZlCRWD72VrU=;
 b=FNDYdhGIjQT5pknir4g8pcA8Niad5yRnueCTJ8bDghl26SMGFCSKT7sY
 gAXN5B0pSMamDwzmPnygglvFlT5LxvcVBYjj1i9M1d+4+PaJDY9IUBTP0
 dAtit0rGJhD9v0TjdD90euuY2miARs5iINpLhW61hMGT6WMotCdrjhUYv
 0oCgN3xbt56UxXf/GNEkuN50JbkteUaRUwRb5xn9n7PZ+yNKwuevY09tF
 f5kDKOwuvMndgrV0VtdX7MJABaBH/24ht4pclsXmFx046ZrQr21038qLy
 5qc5V7+Pxsl41GwOrzPfve7457junrEME1Lwzi78pXbao+n58o+AnpvGv g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="406743088"
X-IronPort-AV: E=Sophos;i="6.02,214,1688454000"; d="scan'208";a="406743088"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2023 14:04:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="716060148"
X-IronPort-AV: E=Sophos;i="6.02,214,1688454000"; d="scan'208";a="716060148"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga006.jf.intel.com with ESMTP; 30 Aug 2023 14:04:50 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 30 Aug 2023 14:04:50 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 30 Aug 2023 14:04:49 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 30 Aug 2023 14:04:49 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.171)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 30 Aug 2023 14:04:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FJlzhqiCq7bXQMTchw/0YglwEoIlVwtyVIDWcX6CVvGFDbow7OkMQr/tR2fECCRwh2ngg1NKLkbmoj18nu4Bh+JRkz5S7BS28JdfW0FtM3hplIhdtuQ/ixgop8hysG7K1DbgBWbug7HkrqLPp+aTLrUjNtmMs5+aGacgpI8vryFVXIN1JkSmz/4Fg7Wn9r6xilTc1jWGc/JwvLWPHBRBf3YJ40euTLbkeWxYaqYj+XXQcZ0SxNuujgOsSyQlXdv/E/Y7mpGEu3QnL3zM/tUUwZsXC5mOTFLc/e2YyqoeDcYUlU7b9McN4nyFSCJNoZEkxZLwKPt7Yy3ymKEFrsN/Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u5oD6qYDjIdnSRXX7i5JIDbBEyLOcyVwJl5Fpd5xrts=;
 b=XelsZvj0JkuaZBe6WGtZM7jrvlBy+/Mw8Ts6iUjz7CwnpXnc9c167CKtVB1CwqC8q3XODokskC/RD8dCrq4joITfj8IM12ouHYUWEiNVacmcsxzuCCEp8fIo6WQI7Yl7+COebc0Z7p71jiaWwgiO3hz6RQnfGY6lFr6JuWw9pQqXxb+/kSlvoeKcL6K+tPpLqa7zJ6rpjsrdee+M8ZJu6DI/NpBhQkSxQ5hzWmMXR+f2Cojsyi75x0iSNsIS9yH7b0d3rzjxX0CQJjNDxobmSpaQaHkmBvQglQe1Bkk/dN+17DD6mKTiHJC3/7KV0xaKejMjyO+gY8J+bRlJ2R6pgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CH0PR11MB8167.namprd11.prod.outlook.com (2603:10b6:610:192::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.35; Wed, 30 Aug
 2023 21:04:47 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6745.020; Wed, 30 Aug 2023
 21:04:47 +0000
Date: Wed, 30 Aug 2023 17:04:41 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Nilawar, Badal" <badal.nilawar@intel.com>
Message-ID: <ZO+u6e06mWzZqX2d@intel.com>
References: <20230824174618.1560317-1-badal.nilawar@intel.com>
 <CY5PR11MB621124B2BA3F61F7DF797A0C95E0A@CY5PR11MB6211.namprd11.prod.outlook.com>
 <f7e1d567-a7ce-fe10-87d9-3b5c3b104bf6@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <f7e1d567-a7ce-fe10-87d9-3b5c3b104bf6@intel.com>
X-ClientProxiedBy: SJ2PR07CA0010.namprd07.prod.outlook.com
 (2603:10b6:a03:505::27) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CH0PR11MB8167:EE_
X-MS-Office365-Filtering-Correlation-Id: adc99860-4038-428d-6a48-08dba99cbdf0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YXW8SkxbmEvnstxLyI1qXPIWPT6DHETawMqbTa7VuxQadziEb3AZUkT0dwwrkEi3e1n8IoSyTx0jRA7xw2t5JX6tEoClurtqWHirmgS1myYxDj05+9gRObtxyABlWL1OHvlkYe2XqEDa4dGs7n3Vb5saIxRCOzELePOhhjMiW1SCF1VzCHhNfUWGhlNG/igcaKOSR+bYiB9jpStTYRJCD/T3gSwrLrYghC+LUzRcarXfPAVIw9q9HYBfVrMSL1cLj5PsQ5d3tE0ywtxttC0hZBKpKMlieF4tvGPob9C1eb7eBB6Jqu23iNlAUkpPMbm0POArm3Mqtu00IB3sNoIzV4TLFvTl0u8XZt0K6M5k4hEVnT7OS3Kok1xKHBMvu/jXIY0hQ3rwwaTmFTPy/fU5raPl0QdlGy70tSu2/ksWY1UkUJh84lgj35KH0/H4Q7uPFPLU5X1ZDaHh3JYuzj2CFOcVsW3tkrzSGXZXlBQDPd1ZIyBsT7/y8MQy10BqpMbfveHJFlN8ezI9Kj1R5IxBCJZbxKcFNcpo3szQgXkBQsxEBwaonbuhGbm+ibv3Z1B5/1BFdBDupEeU2ZnIaKHfjtiHYwVh/NkeSjjlJVKRfps=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(346002)(376002)(39860400002)(136003)(186009)(451199024)(1800799009)(6486002)(6506007)(86362001)(6666004)(36756003)(26005)(107886003)(2616005)(83380400001)(6512007)(6636002)(316002)(53546011)(5660300002)(66556008)(66946007)(66476007)(38100700002)(37006003)(41300700001)(54906003)(44832011)(2906002)(478600001)(82960400001)(6862004)(8936002)(4326008)(15650500001)(8676002)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zMwVlYcYEH2kl2TZQG12Wc4sAtZvE0iyNyGSXTWhj44zCYsQ/rr870pHuSd7?=
 =?us-ascii?Q?FruDlKrMnTn0D+0g0OKeZCE5SeepeeVLTz2QKLsBDKvl+3+RS/vZ65GKH/kr?=
 =?us-ascii?Q?DJ3HQGt9Y59oK1+Zwnz2mpvCOnlg3wEpuVaf6Ahb/5x3800acLh/XPU6ZjxX?=
 =?us-ascii?Q?UVtyVi3NVhcDESNWdvbLv7R6yXYuc6dVxn0aUprhBnZc9wIv1woTKUAI0rbl?=
 =?us-ascii?Q?7PMDwn49fvLdLbKsu0Ziaj8PayE58pcFWtx0JCyyn/Ur9zV/iEf6a9E6kP4I?=
 =?us-ascii?Q?re40x/qBJQ9bvIjzhbQRWa8AgrBO/8EqyKFRi3qQft4iXzUygK729k09AXYd?=
 =?us-ascii?Q?nE1od/PdxGxs2FQKUI4GPDboz2r5mlzpu2HFUbo32VIaQW8mZrAYVOx0qgGG?=
 =?us-ascii?Q?kJiApyeYnYzdq6lK1V6qtBAOdBQVyofoRVuPiP+f/lxySspcLVxXh/PtMCLL?=
 =?us-ascii?Q?bhGhSPmtPL87iMUzEHftorSD4VN9IYI8yyHdabjvOismINNphgW6uN324k8/?=
 =?us-ascii?Q?yuSw045omccKdL0Op++lzNXaQhTcqY8xJGJzzelBBnSSK+hotfe1MD/y6oKF?=
 =?us-ascii?Q?MXsv6E2yj0Cxt2xt3ER6xJ/CqgRCVDA8UhrddR+cAgOVaGo58QSBHr3k7lCm?=
 =?us-ascii?Q?Z+6cXz+CQzXRs7CPKleh85Mmnv5iECBTAd1zeGu6PaJI0sK+iRtRk26CvI09?=
 =?us-ascii?Q?BBu9/D+YSwqNlqMWknMVKunw9Z2LXjQDe18qCQjI2a6gwtvWHT8te7v8ykLT?=
 =?us-ascii?Q?GHFYuG2Pyn7df7k9hEhLYDXodgLgEbCJq9G1tWvVuZYZqMMuqc5S6tTYAyPk?=
 =?us-ascii?Q?mMQkFTN4PFKjrqLTXnihLrlL6MFrTUm84wp4Dw2AxcH/UblavExkiuWYafM3?=
 =?us-ascii?Q?g05XKWdBvRTtSJ/KS9M2bntR+mmOHwPuhsSx/wPNt5nLzoIU1pTuxlkkd3MH?=
 =?us-ascii?Q?X/mn6DphT7cn19CYIRiKTzHOTgxcQZbexSVXtUrMUIAMndE9uJlJR6JdEJe0?=
 =?us-ascii?Q?qQHdhHBVq0ayocrgmXMUcOuDtYwV9fJm8agv3U3sU3gpRqEeIJB58Vk2Jtil?=
 =?us-ascii?Q?cJaW99z52GMUz6t74dI/m04/3qvMZ0g0BnHr+hAi1da+3EDPVOfpVPDadkyN?=
 =?us-ascii?Q?kPvTL+5S/8ahFy+oriXU4ThWRwKuN3wc+FVnoeNl08Mn9sybalD/RyitXGPT?=
 =?us-ascii?Q?bok88pRVid1lmYRzoGDkr1jy0exTnifTC0oaD420hBc8vxN+1qjBUPiTp0iT?=
 =?us-ascii?Q?5WVmMMZKEK5DDglCD+7SF6/ahk6d42yVwbBx24gFFrAETBvHUnT7U7JEUmBR?=
 =?us-ascii?Q?hbBaeU20heq8V2TR2o+X7DJuKNgm6t7IaXcuE4h2WPXo/ByyIvo4x8muX9J+?=
 =?us-ascii?Q?QJ1e8NkJaaKYKLSuf8qx3GdJFX0ktxERc4mY8YBapV8IXI0tjnWg+u304hRQ?=
 =?us-ascii?Q?5zWRfdElKQ6yCU5xHwPJOBbquwPGMfDD1jC4cqr33HXx5wZwY39W/6d+QODh?=
 =?us-ascii?Q?yncsX5SaM+UmlW43QV9QX0x+nOMAHV9xfwU+EKhm9diQw0fxoMqQs671TKov?=
 =?us-ascii?Q?mTVvTaEzLvr7obbUXUqohVxF91KK+EDkvmlO5Pg6UnOQJzyUy+KQNvpZPseH?=
 =?us-ascii?Q?Kw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: adc99860-4038-428d-6a48-08dba99cbdf0
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2023 21:04:47.2560 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 89hLRBKTTls0tXB9772Pq/16uBve0482b1mG7ukVb72sBsDO35RlHlF+MnN5Subh+fpiHCn7sPwmw4/QqZgSLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8167
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC PATCH] drm/xe/dgfx: Release mmap mappings on
 rpm suspend
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Auld, 
 Matthew" <matthew.auld@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Aug 28, 2023 at 10:00:31PM +0530, Nilawar, Badal wrote:
> 
> 
> On 28-08-2023 17:46, Gupta, Anshuman wrote:
> > 
> > 
> > > -----Original Message-----
> > > From: Nilawar, Badal <badal.nilawar@intel.com>
> > > Sent: Thursday, August 24, 2023 11:16 PM
> > > To: intel-xe@lists.freedesktop.org
> > > Cc: Gupta, Anshuman <anshuman.gupta@intel.com>; Auld, Matthew
> > > <matthew.auld@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>
> > > Subject: [RFC PATCH] drm/xe/dgfx: Release mmap mappings on rpm
> > > suspend
> > > 
> > > Release all mmap mappings for all vram objects which are associated with
> > > userfault such that, while pcie function in D3hot, any access to memory
> > > mappings will raise a userfault.
> > > 
> > > Upon userfault, in order to access memory mappings, if graphics function is in
> > > D3 then runtime resume of dgpu will be triggered to transition to D0.
> > IMO we need a configurable threshold to control the behavior of mmap mappings
> > Invalidation, if vram usages is crosses to certain threshold, disable the runtime PM for
> > entire life time of mapping.
> Agreed. Other option could be disable rpm on server descrete graphics for
> entire life time of mapping. But mainitaning threshold is more promising and
> gives control to user.

what use cases we have here for this?
I believe that for discrete we could entirely block rpm if we have display
or if we have shared dma_buf. any other case we should handle?

> 
> Regards,
> Badal
> > Thanks,
> > Anshuman Gupta
> > > 
> > > Cc: Matthew Auld <matthew.auld@intel.com>
> > > Cc: Anshuman Gupta <anshuman.gupta@intel.com>
> > > Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> > > ---
> > >   drivers/gpu/drm/xe/xe_bo.c           | 53 ++++++++++++++++++++++++++--
> > >   drivers/gpu/drm/xe/xe_bo.h           |  2 ++
> > >   drivers/gpu/drm/xe/xe_bo_types.h     |  6 ++++
> > >   drivers/gpu/drm/xe/xe_device_types.h | 20 +++++++++++
> > >   drivers/gpu/drm/xe/xe_pm.c           |  7 ++++
> > >   5 files changed, 85 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> > > index 1ab682d61e3c..4192bfcd8013 100644
> > > --- a/drivers/gpu/drm/xe/xe_bo.c
> > > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > > @@ -776,6 +776,18 @@ static int xe_bo_move(struct ttm_buffer_object
> > > *ttm_bo, bool evict,
> > >   		dma_fence_put(fence);
> > >   	}
> > > 
> > > +	/*
> > > +	* TTM has already nuked the mmap for us (see
> > > ttm_bo_unmap_virtual),
> > > +	* so if we moved from VRAM make sure to unlink this from the
> > > userfault
> > > +	* tracking.
> > > +	*/
> > > +	if (mem_type_is_vram(old_mem_type)) {
> > > +		spin_lock(&xe->mem_access.vram_userfault_lock);
> > > +		if (!list_empty(&bo->vram_userfault_link))
> > > +			list_del_init(&bo->vram_userfault_link);
> > > +		spin_unlock(&xe->mem_access.vram_userfault_lock);
> > > +	}
> > > +
> > >   	xe_device_mem_access_put(xe);
> > >   	trace_printk("new_mem->mem_type=%d\n", new_mem-
> > > > mem_type);
> > > 
> > > @@ -1100,6 +1112,8 @@ static vm_fault_t xe_gem_fault(struct vm_fault
> > > *vmf)  {
> > >   	struct ttm_buffer_object *tbo = vmf->vma->vm_private_data;
> > >   	struct drm_device *ddev = tbo->base.dev;
> > > +	struct xe_bo *bo = ttm_to_xe_bo(tbo);
> > > +	struct xe_device *xe = to_xe_device(ddev);
> > >   	vm_fault_t ret;
> > >   	int idx, r = 0;
> > > 
> > > @@ -1107,9 +1121,10 @@ static vm_fault_t xe_gem_fault(struct vm_fault
> > > *vmf)
> > >   	if (ret)
> > >   		return ret;
> > > 
> > > -	if (drm_dev_enter(ddev, &idx)) {
> > > -		struct xe_bo *bo = ttm_to_xe_bo(tbo);
> > > +	if (tbo->resource->bus.is_iomem)
> > > +		xe_device_mem_access_get(xe);
> > > 
> > > +	if (drm_dev_enter(ddev, &idx)) {
> > >   		trace_xe_bo_cpu_fault(bo);
> > > 
> > >   		if (should_migrate_to_system(bo)) {
> > > @@ -1127,10 +1142,25 @@ static vm_fault_t xe_gem_fault(struct vm_fault
> > > *vmf)
> > >   	} else {
> > >   		ret = ttm_bo_vm_dummy_page(vmf, vmf->vma-
> > > > vm_page_prot);
> > >   	}
> > > +
> > >   	if (ret == VM_FAULT_RETRY && !(vmf->flags &
> > > FAULT_FLAG_RETRY_NOWAIT))
> > > -		return ret;
> > > +		goto out_rpm;
> > > +	/*
> > > +	 * ttm_bo_vm_reserve() already has dma_resv_lock.
> > > +	 * vram_userfault_count is protected by dma_resv lock and rpm
> > > wakeref.
> > > +	 */
> > > +	if (ret == VM_FAULT_NOPAGE &&
> > > xe_device_mem_access_ongoing(xe) && !bo->vram_userfault_count) {
> > > +		bo->vram_userfault_count = 1;
> > > +		spin_lock(&xe->mem_access.vram_userfault_lock);
> > > +		list_add(&bo->vram_userfault_link, &xe-
> > > > mem_access.vram_userfault_list);
> > > +		spin_unlock(&xe->mem_access.vram_userfault_lock);
> > > 
> > > +		XE_WARN_ON(!tbo->resource->bus.is_iomem);
> > > +	}
> > >   	dma_resv_unlock(tbo->base.resv);
> > > +out_rpm:
> > > +	if(tbo->resource->bus.is_iomem &&
> > > xe_device_mem_access_ongoing(xe))
> > > +		xe_device_mem_access_put(xe);
> > >   	return ret;
> > >   }
> > > 
> > > @@ -2108,6 +2138,23 @@ int xe_bo_dumb_create(struct drm_file
> > > *file_priv,
> > >   	return err;
> > >   }
> > > 
> > > +void xe_bo_runtime_pm_release_mmap_offset(struct xe_bo *bo) {
> > > +	struct ttm_buffer_object *tbo = &bo->ttm;
> > > +	struct ttm_device *bdev = tbo->bdev;
> > > +
> > > +	drm_vma_node_unmap(&tbo->base.vma_node, bdev-
> > > > dev_mapping);
> > > +
> > > +	/*
> > > +	 * We have exclusive access here via runtime suspend. All other
> > > callers
> > > +	 * must first grab the rpm wakeref.
> > > +	 */
> > > +	XE_WARN_ON(!bo->vram_userfault_count);
> > > +	list_del(&bo->vram_userfault_link);
> > > +	bo->vram_userfault_count = 0;
> > > +}
> > > +
> > > +
> > >   #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
> > >   #include "tests/xe_bo.c"
> > >   #endif
> > > diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> > > index 0823dda0f31b..6b86f326c700 100644
> > > --- a/drivers/gpu/drm/xe/xe_bo.h
> > > +++ b/drivers/gpu/drm/xe/xe_bo.h
> > > @@ -247,6 +247,8 @@ int xe_gem_create_ioctl(struct drm_device *dev,
> > > void *data,
> > >   			struct drm_file *file);
> > >   int xe_gem_mmap_offset_ioctl(struct drm_device *dev, void *data,
> > >   			     struct drm_file *file);
> > > +void xe_bo_runtime_pm_release_mmap_offset(struct xe_bo *bo);
> > > +
> > >   int xe_bo_dumb_create(struct drm_file *file_priv,
> > >   		      struct drm_device *dev,
> > >   		      struct drm_mode_create_dumb *args); diff --git
> > > a/drivers/gpu/drm/xe/xe_bo_types.h
> > > b/drivers/gpu/drm/xe/xe_bo_types.h
> > > index f6ee920303af..cdca91a378c4 100644
> > > --- a/drivers/gpu/drm/xe/xe_bo_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_bo_types.h
> > > @@ -68,6 +68,12 @@ struct xe_bo {
> > >   	struct llist_node freed;
> > >   	/** @created: Whether the bo has passed initial creation */
> > >   	bool created;
> > > +	/**
> > > +	 * Whether the object is currently in fake offset mmap backed by
> > > vram.
> > > +	 */
> > > +	unsigned int vram_userfault_count;
> > > +	struct list_head vram_userfault_link;
> > > +
> > >   };
> > > 
> > >   #endif
> > > diff --git a/drivers/gpu/drm/xe/xe_device_types.h
> > > b/drivers/gpu/drm/xe/xe_device_types.h
> > > index 750e1f0d3339..c345fb483af1 100644
> > > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > > @@ -328,6 +328,26 @@ struct xe_device {
> > >   	struct {
> > >   		/** @ref: ref count of memory accesses */
> > >   		atomic_t ref;
> > > +		/*
> > > +		 *  Protects access to vram usefault list.
> > > +		 *  It is required, if we are outside of the runtime suspend
> > > path,
> > > +		 *  access to @vram_userfault_list requires always first
> > > grabbing the
> > > +		 *  runtime pm, to ensure we can't race against runtime
> > > suspend.
> > > +		 *  Once we have that we also need to grab
> > > @vram_userfault_lock,
> > > +		 *  at which point we have exclusive access.
> > > +		 *  The runtime suspend path is special since it doesn't really
> > > hold any locks,
> > > +		 *  but instead has exclusive access by virtue of all other
> > > accesses requiring
> > > +		 *  holding the runtime pm wakeref.
> > > +		 */
> > > +		spinlock_t vram_userfault_lock;
> > > +
> > > +		/*
> > > +		 *  Keep list of userfaulted gem obj, which require to release
> > > their
> > > +		 *  mmap mappings at runtime suspend path.
> > > +		 */
> > > +		struct list_head vram_userfault_list;
> > > +
> > > +		bool vram_userfault_ongoing;
> > >   	} mem_access;
> > > 
> > >   	/** @d3cold: Encapsulate d3cold related stuff */ diff --git
> > > a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c index
> > > 0f06d8304e17..51cde1db930e 100644
> > > --- a/drivers/gpu/drm/xe/xe_pm.c
> > > +++ b/drivers/gpu/drm/xe/xe_pm.c
> > > @@ -172,6 +172,8 @@ void xe_pm_init(struct xe_device *xe)
> > >   	}
> > > 
> > >   	xe_pm_runtime_init(xe);
> > > +	INIT_LIST_HEAD(&xe->mem_access.vram_userfault_list);
> > > +	spin_lock_init(&xe->mem_access.vram_userfault_lock);
> > >   }
> > > 
> > >   void xe_pm_runtime_fini(struct xe_device *xe) @@ -205,6 +207,7 @@
> > > struct task_struct *xe_pm_read_callback_task(struct xe_device *xe)
> > > 
> > >   int xe_pm_runtime_suspend(struct xe_device *xe)  {
> > > +	struct xe_bo *bo, *on;
> > >   	struct xe_gt *gt;
> > >   	u8 id;
> > >   	int err = 0;
> > > @@ -238,6 +241,10 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
> > >   	 */
> > >   	lock_map_acquire(&xe_device_mem_access_lockdep_map);
> > > 
> > > +	list_for_each_entry_safe(bo, on,
> > > +				 &xe->mem_access.vram_userfault_list,
> > > vram_userfault_link)
> > > +		xe_bo_runtime_pm_release_mmap_offset(bo);
> > > +
> > >   	if (xe->d3cold.allowed) {
> > >   		err = xe_bo_evict_all(xe);
> > >   		if (err)
> > > --
> > > 2.25.1
> > 

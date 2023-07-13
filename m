Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAE15C001DD
	for <intel-xe@archiver.kernel.org>; Thu, 13 Jul 2023 18:13:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B03F210E75C;
	Thu, 13 Jul 2023 18:13:55 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B459510E75A
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Jul 2023 18:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689272033; x=1720808033;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=JzMdx4G4SYpBwmUUFFsjz/xyxRaFlNyUL1EDUuhSzK4=;
 b=EyvpGmdnj6MLqEMn1DTeQmF6zEIQwoDH164ZUOBD7A6DivU98038GqW1
 uY4atsj3AhyQuHS6CEAgUKguJBZN6EjdXiR4PmZxU2XEKhvLbakBbl7pr
 HCK402cTuNLUuuCLgxeI3lFdC4GI+mrWXB9VPhCfDVGz4Diqq9j8yAibF
 YAtxijMhOn0idfjUAtkEk3oInOoPczYTb7OA319YRgErwqXOlXLN5XcMW
 wKkIO/D6o3gZeGubmIkPzJIYJR7l3cZhKLFSt8zYQl7PDlJfm5SThzMPr
 hAcftoRV79aYPfqi04/HvaLsKstNlO8DoSaTpflwfPej7D2jwOzXpbhOJ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="345593369"
X-IronPort-AV: E=Sophos;i="6.01,203,1684825200"; d="scan'208";a="345593369"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2023 11:13:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="716041447"
X-IronPort-AV: E=Sophos;i="6.01,203,1684825200"; d="scan'208";a="716041447"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga007.jf.intel.com with ESMTP; 13 Jul 2023 11:13:51 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 13 Jul 2023 11:13:51 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 13 Jul 2023 11:13:51 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 13 Jul 2023 11:13:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kSdb0fcIRO197rc0P9XO/yYW6/nhASXrsS0cXFta/KdCbEwjMz5BXmESbYxQFxwRCjOz0PnbhZdT89jqy3QH9icI49Tx/rOWmAaH+CF0FfAJP+IObxscfBvgGCJ3YMek/xOMMtOV9qysAVd3KiVVvxq0dWyZQD/dp0KwQ3b9iJtU6ql6dSo0aqbOqHL4gcqRA27xn41oEqxJcs+7h/7/mH9BTeXMEj5TNTmE3gmBjiC/3s30TaiRif6itWduZqVrLlfA2dHEdrRStd5I7eJWO5Oz2wbmMkv+Hfx6ldjMAYLqAhCCG560iT3f3NfXFolsCUVyVFvipQ+HKVxxlYIfCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JsxJOoL3UNQWI0B1Dnayl35h/r46ipfM7GTLRFz/J3Y=;
 b=WDlpbeCEwYA6ykrrn5SfaPJx/7xWLsUWa3PMuXzcaTfYEhIWSTSbV0dflm1ZPyNWf6F3s7bSm1sIfvyrN9QwI2r348SilrTnX6aXHh7E8LVft/3O9mmeMAPuJc21XnPKU2d15EOmsoS4sp+Gop6IuoRHNx7beH2rOg+plgLNadVzjG4jZzQINGw8tqIaTnV5wA9qpFPRLSn9LRCp91WVhDkIElK0Fuok9cLs63Dc0CPKcMfvvq4ug/EqnjIxMg9r2bf4r+wIEFrBeM8CDGxYsg9XfxAvCkaBexAHYsHAJQtLWjXU4thl7qzjRbct0IZPN3b9rdJWlalGJGqdPgdNJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by BL1PR11MB5224.namprd11.prod.outlook.com (2603:10b6:208:30a::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.24; Thu, 13 Jul
 2023 18:13:47 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::c65d:c846:f197:3ca5]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::c65d:c846:f197:3ca5%4]) with mapi id 15.20.6565.028; Thu, 13 Jul 2023
 18:13:47 +0000
Date: Thu, 13 Jul 2023 18:13:01 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Message-ID: <ZLA+rYKwFuo9RiJS@DUT025-TGLU>
References: <20230713131711.7-1-francois.dugast@intel.com>
 <20230713131711.7-3-francois.dugast@intel.com>
 <ZLADblgo7aS6fTNi@DUT025-TGLU>
 <d096a0e9-fdd0-ba2a-682d-99cf30cabf4d@amd.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d096a0e9-fdd0-ba2a-682d-99cf30cabf4d@amd.com>
X-ClientProxiedBy: BYAPR02CA0018.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::31) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|BL1PR11MB5224:EE_
X-MS-Office365-Filtering-Correlation-Id: 10f4b7b4-3622-4044-a371-08db83cce710
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Y8rO18i0iB4GrPjx2ZdCOWksD16Mr31PRyOYmjOZaOCWqIsULHNZhsbXzqmCF6PmrPuj9zt1WYc9dJ7gXZ3S3dtooHw5nLvS1Ok1iGTbpIRcq5Be08lxo6AH9awbxuQWb0GYOZZp9F9d8C8IfX47gul6VwzY9yij9N7eTb5zxWgPAOxds2uVwXiFgvxg1PlDnE6Un0npbqhcInCumwMsjqptLg6m4Oi4QlPNM4BiwpPvTBbq0dkiQE95lP5hQQ+W0vNQ2xyesWMgkgQDDFIuGLjIOW7bD828OUtzoivANxdxODY5v5AHH78gO09HID7qi8BWL9HU/15iVFDOlv70aAha5sEiNaWTgt+Dr9zVfZ7V3IeO7dqM7RQGi/GicUwZQhtT0GiScYqM+Egx92EkT2oIh0Ry34+9cVmjLTm+scNDjy2covUHVTPV1rlzDPMDuXSzZPKsRDgpC0xwu4eVsynYO9ovPI+1hixoRdtEAIPHULvEgnDLdZJ6B+Wj3Z6QDkdS5nTVP9bC6nKJEXsWqu0FS01kuOlQx2rPHw/mVALFVnmM0eUI0NTuv2IA6lqT2x3QwG9TSL/B9ftIr/f5huNFkIE8A3FSmdqYUp8aK84z34ryNWSNi+fzSmDPyYTV
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(39860400002)(136003)(366004)(346002)(376002)(396003)(451199021)(44832011)(4326008)(6916009)(66556008)(66946007)(66476007)(41300700001)(316002)(2906002)(30864003)(478600001)(8936002)(5660300002)(8676002)(6666004)(6486002)(6512007)(33716001)(26005)(9686003)(6506007)(186003)(66574015)(83380400001)(38100700002)(82960400001)(86362001)(21314003)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?hkDihSAM9PDRvOIsApEnGhh8UjUniJny6fNdd+550xuRVsmCPMukR/fuCD?=
 =?iso-8859-1?Q?lSkXcb2BbDhSOPGPSSHkA+uNRMeoPc1LqjEkNwitlqcTFr3kxruJwpj94w?=
 =?iso-8859-1?Q?LOAGFD1zliMqTGb1gZGf1I6kEzWmhm9yDhvVhb8m5b/aBeYKHF4rL5nQZQ?=
 =?iso-8859-1?Q?L6ZLe1o7DMymfSYmJB1BqNNqzDOUhzvpBXBur9X5JrziAILORsY5pOeHnh?=
 =?iso-8859-1?Q?WLfKLgZOX1UWg+4uYITNkGfVEAablSSqfV/ezXBaEXsM7/F6wlolGjwras?=
 =?iso-8859-1?Q?NbqW7ew0BCMdhv61NEzOb25oJGgbM9lubbcBw81Ah/x3KR8iIEU5PkcG1G?=
 =?iso-8859-1?Q?3OV6NeoPincotPWEU2b93UnpOKPBkCkxTnMyCq4G3NwjHtPgG1MyRlAdNC?=
 =?iso-8859-1?Q?kmOXP9IUFEzaagqCkn9hVfE6r/XNAvPTGW4ZxTfHj0Y89bsyW67BwfVBF+?=
 =?iso-8859-1?Q?dQDSdVAeut+yWcCVsEdKRbwVrXSiWoqBcCrY2nWzislmmJZ6hagqr3/kT0?=
 =?iso-8859-1?Q?9852Cb0AYp6EEs/XbEBz7T74MnGXERJfbdNTWhHPgeI38FQwJhVwimgEl6?=
 =?iso-8859-1?Q?5106AXVcYqM3QCP/EpHMabZYAg3Uh8GlVLhM0hnTmUiJvH5bfJqKWH1IBj?=
 =?iso-8859-1?Q?76sW22rEW/2cUY16P/p2blBWp8wdkc+sso5gzM676xeXieQM4wE58kNKWd?=
 =?iso-8859-1?Q?yhqY8iS5z/zgWVWhLlhmDNmDmBfFeVNT4kXkgzG3pmZixThq+xhApDVK5S?=
 =?iso-8859-1?Q?QRrCmu3f1cPPzHFNd/dS714V16kKPVzaz10swwFDDw5Vd2y9eNUHuF9+kD?=
 =?iso-8859-1?Q?qQehNTEVaXbgIc3OIAryY1U9yA8SHRUwiFJW/rnqS80xyrODBk/OGvyBCb?=
 =?iso-8859-1?Q?VLTRiwMnTu79WRT8ztdbrrz3JAvebS4eHRua6O25C600ZL3jL/G3N+nQ5q?=
 =?iso-8859-1?Q?XsP37jL5DmPHElH12zS/YIIyIyK8h00HmAynC0EKQoY+leQM4xVObLjX6q?=
 =?iso-8859-1?Q?nd6MrW88aVr8keUJ4FRMcIspnHZvPhvAzfy5BoJr9AzwWoVc8gpOE9UN8+?=
 =?iso-8859-1?Q?QlL1PGvvNuPwdYh33p5/uujLkiifnAQ3kLzBjyQvnkSLzTFxP5KFMGMOTT?=
 =?iso-8859-1?Q?ZKZSXknJvww1s7NuDOCnzQGbGzUkS+CIOi+fUNhXbSgV57gIlbQ2rlFVzv?=
 =?iso-8859-1?Q?oBXtun72lP2qUHdvc96rLD8wT2yiRC9KDW/vEuoVbq7oAILngHvOCwRvur?=
 =?iso-8859-1?Q?o6Q3mJUDh2gGhRyaUM2LVh1xVrghqJ9joGbhpHsWqcsU8+E02pGQT0ItUk?=
 =?iso-8859-1?Q?Ahl/xAjdcc3FwhSfORKI6hUhzRm4buBMJaVBWY+dpoj7k+oOv5aJBT8nQD?=
 =?iso-8859-1?Q?Kj+lRmtKyigfkLGEqGIpEeAiTPicfrCAtcsWla0zN7wF8ZPHCAqdq1yflk?=
 =?iso-8859-1?Q?I8pBWL8QbDG1XPzYLihBiApfoXWa20+kD6uNkpkQQqFZB2lhxF3SoShosJ?=
 =?iso-8859-1?Q?7cyobjUl88+32p4WLL/YPV9Eh6tfdDGx7XD+uHYzipKFS9nmxmr4RdHEzh?=
 =?iso-8859-1?Q?70BiMnauGfGz6AGaZyN+w2+ta04Ha516082yCkswp7/xZulKwqL2kCH7kA?=
 =?iso-8859-1?Q?XulscqpBEyjI0zytAqLc5MAQMRj3IAWy6z7wS+isJWwIPdeZoKR6/heg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 10f4b7b4-3622-4044-a371-08db83cce710
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2023 18:13:47.7944 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q4WT+bMMPndo1ZkkWfLe9wqFRW11+TJb2lFL/icMbRHAvtMDtwn7ndAhQLwfTb6XFiE8UQpPR71fGsh4otLIfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5224
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 2/2] drm/xe: switch to using drm_exec
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
Cc: Francois Dugast <francois.dugast@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Jul 13, 2023 at 04:35:57PM +0200, Christian König wrote:
> Am 13.07.23 um 16:00 schrieb Matthew Brost:
> > On Thu, Jul 13, 2023 at 01:17:11PM +0000, Francois Dugast wrote:
> > > Replace the use of ttm_execbuf_util helpers with the drm_exec helpers.
> > > 
> > > v2:
> > > - Call dma-resv locking functions directly in xe_bo_lock and
> > >    xe_vm_lock functions (Matthew Brost)
> > > - Switch to execution context for GEM buffers v7 (Christian König)
> > > - Use DRM_EXEC_INTERRUPTIBLE_WAIT
> > > 
> > > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > > ---
> > >   drivers/gpu/drm/xe/Kconfig           |   1 +
> > >   drivers/gpu/drm/xe/xe_bo.c           |  29 +++-
> > >   drivers/gpu/drm/xe/xe_bo_types.h     |   1 -
> > >   drivers/gpu/drm/xe/xe_exec.c         |  30 +---
> > >   drivers/gpu/drm/xe/xe_gt_pagefault.c |  55 +-----
> > >   drivers/gpu/drm/xe/xe_vm.c           | 246 +++++++++++++--------------
> > >   drivers/gpu/drm/xe/xe_vm.h           |  32 ++--
> > >   7 files changed, 168 insertions(+), 226 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
> > > index d44794f99338..b739faa401d3 100644
> > > --- a/drivers/gpu/drm/xe/Kconfig
> > > +++ b/drivers/gpu/drm/xe/Kconfig
> > > @@ -8,6 +8,7 @@ config DRM_XE
> > >   	select SHMEM
> > >   	select TMPFS
> > >   	select DRM_BUDDY
> > > +	select DRM_EXEC
> > >   	select DRM_KMS_HELPER
> > >   	select DRM_PANEL
> > >   	select DRM_SUBALLOC_HELPER
> > > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> > > index 6353afa8d846..aafe69ed4320 100644
> > > --- a/drivers/gpu/drm/xe/xe_bo.c
> > > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > > @@ -1806,17 +1806,32 @@ int xe_gem_mmap_offset_ioctl(struct drm_device *dev, void *data,
> > >   int xe_bo_lock(struct xe_bo *bo, struct ww_acquire_ctx *ww,
> > >   	       int num_resv, bool intr)
> > >   {
> > > -	struct ttm_validate_buffer tv_bo;
> > > -	LIST_HEAD(objs);
> > > -	LIST_HEAD(dups);
> > > +	struct dma_resv *obj;
> > > +	int err;
> > >   	XE_BUG_ON(!ww);
> > > -	tv_bo.num_shared = num_resv;
> > > -	tv_bo.bo = &bo->ttm;;
> > > -	list_add_tail(&tv_bo.head, &objs);
> > > +	obj = bo->ttm.base.resv;
> > > +	ww_acquire_init(ww, &reservation_ww_class);
> > > +
> > > +	if (intr)
> > > +		err = dma_resv_lock_interruptible(obj, ww);
> > > +	else
> > > +		err = dma_resv_lock(obj, ww);
> > > +
> > > +	if (unlikely(err))
> > > +		return err;
> > > +
> > > +	num_resv = max(num_resv, 1);
> > Why? If the user ask to reserve 0 fences this will reserve 1.
> 
> Reserving 0 fences is illegal. The dma_resv object will complain about that
> in debug builds IIRC.
> 
 
Maybe if you call dma_resv_reserve_fences with 0 or try to install a
fence without reserving something will complain but certainly can do
this:

dma_resv_lock
do something without calling dma_resv_reserve_fences
dma_resv_unlock

Matt

> Christian.
> 
> > 
> > > +	err = dma_resv_reserve_fences(obj, num_resv);
> > > +	if (err)
> > > +		goto out_err;
> > > -	return ttm_eu_reserve_buffers(ww, &objs, intr, &dups);
> > > +	return 0;
> > > +
> > > +out_err:
> > > +	dma_resv_unlock(obj);
> > > +	return err;
> > >   }
> > >   void xe_bo_unlock(struct xe_bo *bo, struct ww_acquire_ctx *ww)
> > > diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
> > > index f6ee920303af..bc67263c6713 100644
> > > --- a/drivers/gpu/drm/xe/xe_bo_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_bo_types.h
> > > @@ -11,7 +11,6 @@
> > >   #include <drm/drm_mm.h>
> > >   #include <drm/ttm/ttm_bo.h>
> > >   #include <drm/ttm/ttm_device.h>
> > > -#include <drm/ttm/ttm_execbuf_util.h>
> > >   #include <drm/ttm/ttm_placement.h>
> > >   struct xe_device;
> > > diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
> > > index ba13d20ed348..32a6e16ec177 100644
> > > --- a/drivers/gpu/drm/xe/xe_exec.c
> > > +++ b/drivers/gpu/drm/xe/xe_exec.c
> > > @@ -6,6 +6,7 @@
> > >   #include "xe_exec.h"
> > >   #include <drm/drm_device.h>
> > > +#include <drm/drm_exec.h>
> > >   #include <drm/drm_file.h>
> > >   #include <drm/xe_drm.h>
> > >   #include <linux/delay.h>
> > > @@ -95,23 +96,18 @@
> > >   #define XE_EXEC_BIND_RETRY_TIMEOUT_MS 1000
> > > -static int xe_exec_begin(struct xe_engine *e, struct ww_acquire_ctx *ww,
> > > -			 struct ttm_validate_buffer tv_onstack[],
> > > -			 struct ttm_validate_buffer **tv,
> > > -			 struct list_head *objs)
> > > +static int xe_exec_begin(struct xe_engine *e, struct drm_exec *exec)
> > >   {
> > >   	struct xe_vm *vm = e->vm;
> > >   	struct xe_vma *vma;
> > > -	LIST_HEAD(dups);
> > >   	ktime_t end = 0;
> > >   	int err = 0;
> > > -	*tv = NULL;
> > >   	if (xe_vm_no_dma_fences(e->vm))
> > >   		return 0;
> > >   retry:
> > > -	err = xe_vm_lock_dma_resv(vm, ww, tv_onstack, tv, objs, true, 1);
> > > +	err = xe_vm_lock_dma_resv(vm, exec, true, 1);
> > >   	if (err)
> > >   		return err;
> > > @@ -128,8 +124,7 @@ static int xe_exec_begin(struct xe_engine *e, struct ww_acquire_ctx *ww,
> > >   		err = xe_bo_validate(xe_vma_bo(vma), vm, false);
> > >   		if (err) {
> > > -			xe_vm_unlock_dma_resv(vm, tv_onstack, *tv, ww, objs);
> > > -			*tv = NULL;
> > > +			xe_vm_unlock_dma_resv(vm, exec);
> > >   			break;
> > >   		}
> > >   	}
> > > @@ -153,14 +148,10 @@ static int xe_exec_begin(struct xe_engine *e, struct ww_acquire_ctx *ww,
> > >   	return err;
> > >   }
> > > -static void xe_exec_end(struct xe_engine *e,
> > > -			struct ttm_validate_buffer *tv_onstack,
> > > -			struct ttm_validate_buffer *tv,
> > > -			struct ww_acquire_ctx *ww,
> > > -			struct list_head *objs)
> > > +static void xe_exec_end(struct xe_engine *e, struct drm_exec *exec)
> > >   {
> > >   	if (!xe_vm_no_dma_fences(e->vm))
> > > -		xe_vm_unlock_dma_resv(e->vm, tv_onstack, tv, ww, objs);
> > > +		xe_vm_unlock_dma_resv(e->vm, exec);
> > >   }
> > >   int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> > > @@ -173,14 +164,11 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> > >   	struct xe_engine *engine;
> > >   	struct xe_sync_entry *syncs = NULL;
> > >   	u64 addresses[XE_HW_ENGINE_MAX_INSTANCE];
> > > -	struct ttm_validate_buffer tv_onstack[XE_ONSTACK_TV];
> > > -	struct ttm_validate_buffer *tv = NULL;
> > >   	u32 i, num_syncs = 0;
> > >   	struct xe_sched_job *job;
> > >   	struct dma_fence *rebind_fence;
> > >   	struct xe_vm *vm;
> > > -	struct ww_acquire_ctx ww;
> > > -	struct list_head objs;
> > > +	struct drm_exec exec;
> > >   	bool write_locked;
> > >   	int err = 0;
> > > @@ -293,7 +281,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> > >   			goto err_unlock_list;
> > >   	}
> > > -	err = xe_exec_begin(engine, &ww, tv_onstack, &tv, &objs);
> > > +	err = xe_exec_begin(engine, &exec);
> > >   	if (err)
> > >   		goto err_unlock_list;
> > > @@ -412,7 +400,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> > >   	if (err)
> > >   		xe_sched_job_put(job);
> > >   err_engine_end:
> > > -	xe_exec_end(engine, tv_onstack, tv, &ww, &objs);
> > > +	xe_exec_end(engine, &exec);
> > >   err_unlock_list:
> > >   	if (write_locked)
> > >   		up_write(&vm->lock);
> > > diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > > index 125e4744fa38..94f59c29ba9b 100644
> > > --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > > +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > > @@ -8,8 +8,8 @@
> > >   #include <linux/bitfield.h>
> > >   #include <linux/circ_buf.h>
> > > +#include <drm/drm_exec.h>
> > >   #include <drm/drm_managed.h>
> > > -#include <drm/ttm/ttm_execbuf_util.h>
> > >   #include "xe_bo.h"
> > >   #include "xe_gt.h"
> > > @@ -84,11 +84,6 @@ static bool vma_matches(struct xe_vma *vma, u64 page_addr)
> > >   	return true;
> > >   }
> > > -static bool only_needs_bo_lock(struct xe_bo *bo)
> > > -{
> > > -	return bo && bo->vm;
> > > -}
> > > -
> > >   static struct xe_vma *lookup_vma(struct xe_vm *vm, u64 page_addr)
> > >   {
> > >   	struct xe_vma *vma = NULL;
> > > @@ -110,10 +105,7 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
> > >   	struct xe_vm *vm;
> > >   	struct xe_vma *vma = NULL;
> > >   	struct xe_bo *bo;
> > > -	LIST_HEAD(objs);
> > > -	LIST_HEAD(dups);
> > > -	struct ttm_validate_buffer tv_bo, tv_vm;
> > > -	struct ww_acquire_ctx ww;
> > > +	struct drm_exec exec;
> > >   	struct dma_fence *fence;
> > >   	bool write_locked;
> > >   	int ret = 0;
> > > @@ -171,20 +163,7 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
> > >   	/* Lock VM and BOs dma-resv */
> > >   	bo = xe_vma_bo(vma);
> > > -	if (only_needs_bo_lock(bo)) {
> > > -		/* This path ensures the BO's LRU is updated */
> > > -		ret = xe_bo_lock(bo, &ww, xe->info.tile_count, false);
> > > -	} else {
> > > -		tv_vm.num_shared = xe->info.tile_count;
> > > -		tv_vm.bo = xe_vm_ttm_bo(vm);
> > > -		list_add(&tv_vm.head, &objs);
> > > -		if (bo) {
> > > -			tv_bo.bo = &bo->ttm;
> > > -			tv_bo.num_shared = xe->info.tile_count;
> > > -			list_add(&tv_bo.head, &objs);
> > > -		}
> > > -		ret = ttm_eu_reserve_buffers(&ww, &objs, false, &dups);
> > > -	}
> > > +	ret = xe_vm_bo_lock(vm, bo, &exec, xe->info.tile_count, false);
> > >   	if (ret)
> > >   		goto unlock_vm;
> > > @@ -227,10 +206,7 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
> > >   	vma->usm.tile_invalidated &= ~BIT(gt_to_tile(gt)->id);
> > >   unlock_dma_resv:
> > > -	if (only_needs_bo_lock(bo))
> > > -		xe_bo_unlock(bo, &ww);
> > > -	else
> > > -		ttm_eu_backoff_reservation(&ww, &objs);
> > > +	xe_vm_bo_unlock(vm, bo, &exec, true);
> > >   unlock_vm:
> > >   	if (!ret)
> > >   		vm->usm.last_fault_vma = vma;
> > > @@ -498,10 +474,7 @@ static int handle_acc(struct xe_gt *gt, struct acc *acc)
> > >   	struct xe_vm *vm;
> > >   	struct xe_vma *vma;
> > >   	struct xe_bo *bo;
> > > -	LIST_HEAD(objs);
> > > -	LIST_HEAD(dups);
> > > -	struct ttm_validate_buffer tv_bo, tv_vm;
> > > -	struct ww_acquire_ctx ww;
> > > +	struct drm_exec exec;
> > >   	int ret = 0;
> > >   	/* We only support ACC_TRIGGER at the moment */
> > > @@ -534,28 +507,14 @@ static int handle_acc(struct xe_gt *gt, struct acc *acc)
> > >   	/* Lock VM and BOs dma-resv */
> > >   	bo = xe_vma_bo(vma);
> > > -	if (only_needs_bo_lock(bo)) {
> > > -		/* This path ensures the BO's LRU is updated */
> > > -		ret = xe_bo_lock(bo, &ww, xe->info.tile_count, false);
> > > -	} else {
> > > -		tv_vm.num_shared = xe->info.tile_count;
> > > -		tv_vm.bo = xe_vm_ttm_bo(vm);
> > > -		list_add(&tv_vm.head, &objs);
> > > -		tv_bo.bo = &bo->ttm;
> > > -		tv_bo.num_shared = xe->info.tile_count;
> > > -		list_add(&tv_bo.head, &objs);
> > > -		ret = ttm_eu_reserve_buffers(&ww, &objs, false, &dups);
> > > -	}
> > > +	ret = xe_vm_bo_lock(vm, bo, &exec, xe->info.tile_count, false);
> > >   	if (ret)
> > >   		goto unlock_vm;
> > >   	/* Migrate to VRAM, move should invalidate the VMA first */
> > >   	ret = xe_bo_migrate(bo, XE_PL_VRAM0 + tile->id);
> > > -	if (only_needs_bo_lock(bo))
> > > -		xe_bo_unlock(bo, &ww);
> > > -	else
> > > -		ttm_eu_backoff_reservation(&ww, &objs);
> > > +	xe_vm_bo_unlock(vm, bo, &exec, true);
> > >   unlock_vm:
> > >   	up_read(&vm->lock);
> > >   	xe_vm_put(vm);
> > > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > > index 6c216350084b..c89b10d5feb5 100644
> > > --- a/drivers/gpu/drm/xe/xe_vm.c
> > > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > > @@ -7,8 +7,8 @@
> > >   #include <linux/dma-fence-array.h>
> > > +#include <drm/drm_exec.h>
> > >   #include <drm/drm_print.h>
> > > -#include <drm/ttm/ttm_execbuf_util.h>
> > >   #include <drm/ttm/ttm_tt.h>
> > >   #include <drm/xe_drm.h>
> > >   #include <linux/delay.h>
> > > @@ -321,11 +321,8 @@ static void resume_and_reinstall_preempt_fences(struct xe_vm *vm)
> > >   int xe_vm_add_compute_engine(struct xe_vm *vm, struct xe_engine *e)
> > >   {
> > > -	struct ttm_validate_buffer tv_onstack[XE_ONSTACK_TV];
> > > -	struct ttm_validate_buffer *tv;
> > > -	struct ww_acquire_ctx ww;
> > > -	struct list_head objs;
> > >   	struct dma_fence *pfence;
> > > +	struct drm_exec exec;
> > >   	int err;
> > >   	bool wait;
> > > @@ -333,7 +330,7 @@ int xe_vm_add_compute_engine(struct xe_vm *vm, struct xe_engine *e)
> > >   	down_write(&vm->lock);
> > > -	err = xe_vm_lock_dma_resv(vm, &ww, tv_onstack, &tv, &objs, true, 1);
> > > +	err = xe_vm_lock_dma_resv(vm, &exec, true, 1);
> > >   	if (err)
> > >   		goto out_unlock_outer;
> > > @@ -367,7 +364,7 @@ int xe_vm_add_compute_engine(struct xe_vm *vm, struct xe_engine *e)
> > >   	up_read(&vm->userptr.notifier_lock);
> > >   out_unlock:
> > > -	xe_vm_unlock_dma_resv(vm, tv_onstack, tv, &ww, &objs);
> > > +	xe_vm_unlock_dma_resv(vm, &exec);
> > >   out_unlock_outer:
> > >   	up_write(&vm->lock);
> > > @@ -397,68 +394,43 @@ int __xe_vm_userptr_needs_repin(struct xe_vm *vm)
> > >    * xe_vm_lock_dma_resv() - Lock the vm dma_resv object and the dma_resv
> > >    * objects of the vm's external buffer objects.
> > >    * @vm: The vm.
> > > - * @ww: Pointer to a struct ww_acquire_ctx locking context.
> > > - * @tv_onstack: Array size XE_ONSTACK_TV of storage for the struct
> > > - * ttm_validate_buffers used for locking.
> > > - * @tv: Pointer to a pointer that on output contains the actual storage used.
> > > - * @objs: List head for the buffer objects locked.
> > > + * @exec: Pointer to a struct drm_exec execution context.
> > >    * @intr: Whether to lock interruptible.
> > >    * @num_shared: Number of dma-fence slots to reserve in the locked objects.
> > >    *
> > >    * Locks the vm dma-resv objects and all the dma-resv objects of the
> > > - * buffer objects on the vm external object list. The TTM utilities require
> > > - * a list of struct ttm_validate_buffers pointing to the actual buffer
> > > - * objects to lock. Storage for those struct ttm_validate_buffers should
> > > - * be provided in @tv_onstack, and is typically reserved on the stack
> > > - * of the caller. If the size of @tv_onstack isn't sufficient, then
> > > - * storage will be allocated internally using kvmalloc().
> > > + * buffer objects on the vm external object list using helpers provided
> > > + * by drm_exec.
> > >    *
> > >    * The function performs deadlock handling internally, and after a
> > >    * successful return the ww locking transaction should be considered
> > >    * sealed.
> > >    *
> > > - * Return: 0 on success, Negative error code on error. In particular if
> > > - * @intr is set to true, -EINTR or -ERESTARTSYS may be returned. In case
> > > - * of error, any locking performed has been reverted.
> > > + * Return: 0 on success, Negative error code on error.
> > >    */
> > > -int xe_vm_lock_dma_resv(struct xe_vm *vm, struct ww_acquire_ctx *ww,
> > > -			struct ttm_validate_buffer *tv_onstack,
> > > -			struct ttm_validate_buffer **tv,
> > > -			struct list_head *objs,
> > > -			bool intr,
> > > -			unsigned int num_shared)
> > > -{
> > > -	struct ttm_validate_buffer *tv_vm, *tv_bo;
> > > +int xe_vm_lock_dma_resv(struct xe_vm *vm, struct drm_exec *exec,
> > > +			bool intr, unsigned int num_shared)
> > > +{
> > >   	struct xe_vma *vma, *next;
> > > -	LIST_HEAD(dups);
> > > +	struct drm_gem_object *obj;
> > >   	int err;
> > >   	lockdep_assert_held(&vm->lock);
> > > -	if (vm->extobj.entries < XE_ONSTACK_TV) {
> > > -		tv_vm = tv_onstack;
> > > -	} else {
> > > -		tv_vm = kvmalloc_array(vm->extobj.entries + 1, sizeof(*tv_vm),
> > > -				       GFP_KERNEL);
> > > -		if (!tv_vm)
> > > -			return -ENOMEM;
> > > +	drm_exec_init(exec, intr ? DRM_EXEC_INTERRUPTIBLE_WAIT : 0);
> > > +	drm_exec_until_all_locked(exec) {
> > > +		err = drm_exec_prepare_obj(exec, xe_vm_gem(vm), num_shared);
> > > +		drm_exec_retry_on_contention(exec);
> > > +		if (unlikely(err) && err != -EALREADY)
> > > +			goto out_err;
> > > +		list_for_each_entry(vma, &vm->extobj.list, extobj.link) {
> > > +			obj = &xe_vma_bo(vma)->ttm.base;
> > > +			err = drm_exec_prepare_obj(exec, obj, num_shared);
> > > +			drm_exec_retry_on_contention(exec);
> > > +			if (unlikely(err) && err != -EALREADY)
> > > +				goto out_err;
> > > +		}
> > >   	}
> > > -	tv_bo = tv_vm + 1;
> > > -
> > > -	INIT_LIST_HEAD(objs);
> > > -	list_for_each_entry(vma, &vm->extobj.list, extobj.link) {
> > > -		tv_bo->num_shared = num_shared;
> > > -		tv_bo->bo = &xe_vma_bo(vma)->ttm;
> > > -
> > > -		list_add_tail(&tv_bo->head, objs);
> > > -		tv_bo++;
> > > -	}
> > > -	tv_vm->num_shared = num_shared;
> > > -	tv_vm->bo = xe_vm_ttm_bo(vm);
> > > -	list_add_tail(&tv_vm->head, objs);
> > > -	err = ttm_eu_reserve_buffers(ww, objs, intr, &dups);
> > > -	if (err)
> > > -		goto out_err;
> > >   	spin_lock(&vm->notifier.list_lock);
> > >   	list_for_each_entry_safe(vma, next, &vm->notifier.rebind_list,
> > > @@ -470,14 +442,10 @@ int xe_vm_lock_dma_resv(struct xe_vm *vm, struct ww_acquire_ctx *ww,
> > >   			list_move_tail(&vma->rebind_link, &vm->rebind_list);
> > >   	}
> > >   	spin_unlock(&vm->notifier.list_lock);
> > > -
> > > -	*tv = tv_vm;
> > >   	return 0;
> > >   out_err:
> > > -	if (tv_vm != tv_onstack)
> > > -		kvfree(tv_vm);
> > > -
> > > +	drm_exec_fini(exec);
> > >   	return err;
> > >   }
> > > @@ -485,20 +453,16 @@ int xe_vm_lock_dma_resv(struct xe_vm *vm, struct ww_acquire_ctx *ww,
> > >    * xe_vm_unlock_dma_resv() - Unlock reservation objects locked by
> > >    * xe_vm_lock_dma_resv()
> > >    * @vm: The vm.
> > > - * @tv_onstack: The @tv_onstack array given to xe_vm_lock_dma_resv().
> > > - * @tv: The value of *@tv given by xe_vm_lock_dma_resv().
> > > - * @ww: The ww_acquire_context used for locking.
> > > - * @objs: The list returned from xe_vm_lock_dma_resv().
> > > + * @exec: The @drm_exec given to xe_vm_lock_dma_resv().
> > >    *
> > >    * Unlocks the reservation objects and frees any memory allocated by
> > >    * xe_vm_lock_dma_resv().
> > >    */
> > > -void xe_vm_unlock_dma_resv(struct xe_vm *vm,
> > > -			   struct ttm_validate_buffer *tv_onstack,
> > > -			   struct ttm_validate_buffer *tv,
> > > -			   struct ww_acquire_ctx *ww,
> > > -			   struct list_head *objs)
> > > +void xe_vm_unlock_dma_resv(struct xe_vm *vm, struct drm_exec *exec)
> > >   {
> > > +	struct drm_gem_object *obj, *skip = xe_vm_gem(vm);
> > > +	unsigned long index;
> > > +
> > >   	/*
> > >   	 * Nothing should've been able to enter the list while we were locked,
> > >   	 * since we've held the dma-resvs of all the vm's external objects,
> > > @@ -507,9 +471,13 @@ void xe_vm_unlock_dma_resv(struct xe_vm *vm,
> > >   	 */
> > >   	XE_WARN_ON(!list_empty(&vm->notifier.rebind_list));
> > > -	ttm_eu_backoff_reservation(ww, objs);
> > > -	if (tv && tv != tv_onstack)
> > > -		kvfree(tv);
> > > +	drm_exec_for_each_locked_object(exec, index, obj) {
> > > +		struct xe_bo *bo = gem_to_xe_bo(obj);
> > > +
> > > +		if (obj != skip)
> > > +			ttm_bo_move_to_lru_tail_unlocked(&bo->ttm);
> > > +	}
> > > +	drm_exec_fini(exec);
> > >   }
> > >   #define XE_VM_REBIND_RETRY_TIMEOUT_MS 1000
> > > @@ -536,10 +504,7 @@ static void preempt_rebind_work_func(struct work_struct *w)
> > >   {
> > >   	struct xe_vm *vm = container_of(w, struct xe_vm, preempt.rebind_work);
> > >   	struct xe_vma *vma;
> > > -	struct ttm_validate_buffer tv_onstack[XE_ONSTACK_TV];
> > > -	struct ttm_validate_buffer *tv;
> > > -	struct ww_acquire_ctx ww;
> > > -	struct list_head objs;
> > > +	struct drm_exec exec;
> > >   	struct dma_fence *rebind_fence;
> > >   	unsigned int fence_count = 0;
> > >   	LIST_HEAD(preempt_fences);
> > > @@ -582,8 +547,7 @@ static void preempt_rebind_work_func(struct work_struct *w)
> > >   			goto out_unlock_outer;
> > >   	}
> > > -	err = xe_vm_lock_dma_resv(vm, &ww, tv_onstack, &tv, &objs,
> > > -				  false, vm->preempt.num_engines);
> > > +	err = xe_vm_lock_dma_resv(vm, &exec, false, vm->preempt.num_engines);
> > >   	if (err)
> > >   		goto out_unlock_outer;
> > > @@ -662,7 +626,7 @@ static void preempt_rebind_work_func(struct work_struct *w)
> > >   	up_read(&vm->userptr.notifier_lock);
> > >   out_unlock:
> > > -	xe_vm_unlock_dma_resv(vm, tv_onstack, tv, &ww, &objs);
> > > +	xe_vm_unlock_dma_resv(vm, &exec);
> > >   out_unlock_outer:
> > >   	if (err == -EAGAIN) {
> > >   		trace_xe_vm_rebind_worker_retry(vm);
> > > @@ -1105,27 +1069,17 @@ static void xe_vma_destroy(struct xe_vma *vma, struct dma_fence *fence)
> > >   static void xe_vma_destroy_unlocked(struct xe_vma *vma)
> > >   {
> > > -	struct ttm_validate_buffer tv[2];
> > > -	struct ww_acquire_ctx ww;
> > > +	struct xe_vm *vm = xe_vma_vm(vma);
> > >   	struct xe_bo *bo = xe_vma_bo(vma);
> > > -	LIST_HEAD(objs);
> > > -	LIST_HEAD(dups);
> > > +	struct drm_exec exec;
> > >   	int err;
> > > -	memset(tv, 0, sizeof(tv));
> > > -	tv[0].bo = xe_vm_ttm_bo(xe_vma_vm(vma));
> > > -	list_add(&tv[0].head, &objs);
> > > -
> > > -	if (bo) {
> > > -		tv[1].bo = &xe_bo_get(bo)->ttm;
> > > -		list_add(&tv[1].head, &objs);
> > > -	}
> > > -	err = ttm_eu_reserve_buffers(&ww, &objs, false, &dups);
> > > +	err = xe_vm_bo_lock(vm, xe_bo_get(bo), &exec, 0, false);
> > >   	XE_WARN_ON(err);
> > >   	xe_vma_destroy(vma, NULL);
> > > -	ttm_eu_backoff_reservation(&ww, &objs);
> > > +	xe_vm_bo_unlock(vm, bo, &exec, false);
> > >   	if (bo)
> > >   		xe_bo_put(bo);
> > >   }
> > > @@ -2125,21 +2079,6 @@ static int xe_vm_prefetch(struct xe_vm *vm, struct xe_vma *vma,
> > >   #define VM_BIND_OP(op)	(op & 0xffff)
> > > -struct ttm_buffer_object *xe_vm_ttm_bo(struct xe_vm *vm)
> > > -{
> > > -	int idx = vm->flags & XE_VM_FLAG_MIGRATION ?
> > > -		XE_VM_FLAG_GT_ID(vm->flags) : 0;
> > > -
> > > -	/* Safe to use index 0 as all BO in the VM share a single dma-resv lock */
> > > -	return &vm->pt_root[idx]->bo->ttm;
> > > -}
> > > -
> > > -static void xe_vm_tv_populate(struct xe_vm *vm, struct ttm_validate_buffer *tv)
> > > -{
> > > -	tv->num_shared = 1;
> > > -	tv->bo = xe_vm_ttm_bo(vm);
> > > -}
> > > -
> > >   static void vm_set_async_error(struct xe_vm *vm, int err)
> > >   {
> > >   	lockdep_assert_held(&vm->lock);
> > > @@ -2577,17 +2516,12 @@ static int xe_vma_op_commit(struct xe_vm *vm, struct xe_vma_op *op)
> > >   static int __xe_vma_op_execute(struct xe_vm *vm, struct xe_vma *vma,
> > >   			       struct xe_vma_op *op)
> > >   {
> > > -	LIST_HEAD(objs);
> > > -	LIST_HEAD(dups);
> > > -	struct ttm_validate_buffer tv_bo, tv_vm;
> > > -	struct ww_acquire_ctx ww;
> > >   	struct xe_bo *vbo;
> > > +	struct drm_exec exec;
> > >   	int err;
> > >   	lockdep_assert_held_write(&vm->lock);
> > > -	xe_vm_tv_populate(vm, &tv_vm);
> > > -	list_add_tail(&tv_vm.head, &objs);
> > >   	vbo = xe_vma_bo(vma);
> > >   	if (vbo) {
> > >   		/*
> > > @@ -2596,16 +2530,10 @@ static int __xe_vma_op_execute(struct xe_vm *vm, struct xe_vma *vma,
> > >   		 * take a reference here.
> > >   		 */
> > >   		xe_bo_get(vbo);
> > > -
> > > -		if (!vbo->vm) {
> > > -			tv_bo.bo = &vbo->ttm;
> > > -			tv_bo.num_shared = 1;
> > > -			list_add(&tv_bo.head, &objs);
> > > -		}
> > >   	}
> > >   again:
> > > -	err = ttm_eu_reserve_buffers(&ww, &objs, true, &dups);
> > > +	err = xe_vm_bo_lock(vm, vbo, &exec, 1, true);
> > >   	if (err) {
> > >   		xe_bo_put(vbo);
> > >   		return err;
> > > @@ -2687,7 +2615,7 @@ static int __xe_vma_op_execute(struct xe_vm *vm, struct xe_vma *vma,
> > >   		XE_BUG_ON("NOT POSSIBLE");
> > >   	}
> > > -	ttm_eu_backoff_reservation(&ww, &objs);
> > > +	xe_vm_bo_unlock(vm, vbo, &exec, false);
> > >   	if (err == -EAGAIN && xe_vma_is_userptr(vma)) {
> > >   		lockdep_assert_held_write(&vm->lock);
> > >   		err = xe_vma_userptr_pin_pages(vma);
> > > @@ -3338,24 +3266,47 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> > >   	return err == -ENODATA ? 0 : err;
> > >   }
> > > +struct drm_gem_object *xe_vm_gem(struct xe_vm *vm)
> > > +{
> > > +	int idx = vm->flags & XE_VM_FLAG_MIGRATION ?
> > > +		XE_VM_FLAG_GT_ID(vm->flags) : 0;
> > > +
> > > +	/* Safe to use index 0 as all BO in the VM share a single dma-resv lock */
> > > +	return &vm->pt_root[idx]->bo->ttm.base;
> > > +}
> > > +
> > >   /*
> > > - * XXX: Using the TTM wrappers for now, likely can call into dma-resv code
> > > - * directly to optimize. Also this likely should be an inline function.
> > > + * XXX: This likely should be an inline function.
> > >    */
> > >   int xe_vm_lock(struct xe_vm *vm, struct ww_acquire_ctx *ww,
> > >   	       int num_resv, bool intr)
> > >   {
> > > -	struct ttm_validate_buffer tv_vm;
> > > -	LIST_HEAD(objs);
> > > -	LIST_HEAD(dups);
> > > +	struct dma_resv *obj;
> > > +	int err;
> > >   	XE_BUG_ON(!ww);
> > > -	tv_vm.num_shared = num_resv;
> > > -	tv_vm.bo = xe_vm_ttm_bo(vm);;
> > > -	list_add_tail(&tv_vm.head, &objs);
> > > +	obj = xe_vm_gem(vm)->resv;
> > > +	ww_acquire_init(ww, &reservation_ww_class);
> > > +
> > > +	if (intr)
> > > +		err = dma_resv_lock_interruptible(obj, ww);
> > > +	else
> > > +		err = dma_resv_lock(obj, ww);
> > > +
> > > +	if (unlikely(err))
> > > +		return err;
> > > +
> > > +	num_resv = max(num_resv, 1);
> > Same question as above here.
> > 
> > Matt
> > 
> > > +	err = dma_resv_reserve_fences(obj, num_resv);
> > > +	if (err)
> > > +		goto out_err;
> > > -	return ttm_eu_reserve_buffers(ww, &objs, intr, &dups);
> > > +	return 0;
> > > +
> > > +out_err:
> > > +	dma_resv_unlock(&vm->resv);
> > > +	return err;
> > >   }
> > >   void xe_vm_unlock(struct xe_vm *vm, struct ww_acquire_ctx *ww)
> > > @@ -3364,6 +3315,43 @@ void xe_vm_unlock(struct xe_vm *vm, struct ww_acquire_ctx *ww)
> > >   	ww_acquire_fini(ww);
> > >   }
> > > +int xe_vm_bo_lock(struct xe_vm *vm, struct xe_bo *bo, struct drm_exec *exec,
> > > +		  int num_resv, bool intr)
> > > +{
> > > +	int err;
> > > +
> > > +	drm_exec_init(exec, intr ? DRM_EXEC_INTERRUPTIBLE_WAIT : 0);
> > > +	drm_exec_until_all_locked(exec) {
> > > +		err = drm_exec_prepare_obj(exec, xe_vm_gem(vm),
> > > +					   num_resv);
> > > +		drm_exec_retry_on_contention(exec);
> > > +		if (err && err != -EALREADY)
> > > +			goto out_err;
> > > +
> > > +		if (bo && !bo->vm) {
> > > +			err = drm_exec_prepare_obj(exec, &bo->ttm.base,
> > > +						   num_resv);
> > > +			drm_exec_retry_on_contention(exec);
> > > +			if (err && err != -EALREADY)
> > > +				goto out_err;
> > > +		}
> > > +	}
> > > +
> > > +	return 0;
> > > +
> > > +out_err:
> > > +	drm_exec_fini(exec);
> > > +	return err;
> > > +}
> > > +
> > > +void xe_vm_bo_unlock(struct xe_vm *vm, struct xe_bo *bo, struct drm_exec *exec,
> > > +		     bool lru_update)
> > > +{
> > > +	if (lru_update && bo && (!bo->vm || xe_vm_no_dma_fences(vm)))
> > > +		ttm_bo_move_to_lru_tail_unlocked(&bo->ttm);
> > > +	drm_exec_fini(exec);
> > > +}
> > > +
> > >   /**
> > >    * xe_vm_invalidate_vma - invalidate GPU mappings for VMA without a lock
> > >    * @vma: VMA to invalidate
> > > diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> > > index eaf11ac8ff51..62a062bd5078 100644
> > > --- a/drivers/gpu/drm/xe/xe_vm.h
> > > +++ b/drivers/gpu/drm/xe/xe_vm.h
> > > @@ -12,6 +12,7 @@
> > >   #include "xe_vm_types.h"
> > >   struct drm_device;
> > > +struct drm_exec;
> > >   struct drm_printer;
> > >   struct drm_file;
> > > @@ -39,11 +40,17 @@ static inline void xe_vm_put(struct xe_vm *vm)
> > >   	kref_put(&vm->refcount, xe_vm_free);
> > >   }
> > > +struct drm_gem_object *xe_vm_gem(struct xe_vm *vm);
> > > +
> > >   int xe_vm_lock(struct xe_vm *vm, struct ww_acquire_ctx *ww,
> > >   	       int num_resv, bool intr);
> > > -
> > >   void xe_vm_unlock(struct xe_vm *vm, struct ww_acquire_ctx *ww);
> > > +int xe_vm_bo_lock(struct xe_vm *vm, struct xe_bo *bo, struct drm_exec *exec,
> > > +		  int num_resv, bool intr);
> > > +void xe_vm_bo_unlock(struct xe_vm *vm, struct xe_bo *bo, struct drm_exec *exec,
> > > +		     bool lru_update);
> > > +
> > >   static inline bool xe_vm_is_closed(struct xe_vm *vm)
> > >   {
> > >   	/* Only guaranteed not to change when vm->lock is held */
> > > @@ -183,8 +190,6 @@ int xe_vm_async_fence_wait_start(struct dma_fence *fence);
> > >   extern struct ttm_device_funcs xe_ttm_funcs;
> > > -struct ttm_buffer_object *xe_vm_ttm_bo(struct xe_vm *vm);
> > > -
> > >   /**
> > >    * xe_vm_reactivate_rebind() - Reactivate the rebind functionality on compute
> > >    * vms.
> > > @@ -212,23 +217,10 @@ static inline void xe_vm_queue_rebind_worker(struct xe_vm *vm)
> > >   	queue_work(vm->xe->ordered_wq, &vm->preempt.rebind_work);
> > >   }
> > > -/*
> > > - * XE_ONSTACK_TV is used to size the tv_onstack array that is input
> > > - * to xe_vm_lock_dma_resv() and xe_vm_unlock_dma_resv().
> > > - */
> > > -#define XE_ONSTACK_TV 20
> > > -int xe_vm_lock_dma_resv(struct xe_vm *vm, struct ww_acquire_ctx *ww,
> > > -			struct ttm_validate_buffer *tv_onstack,
> > > -			struct ttm_validate_buffer **tv,
> > > -			struct list_head *objs,
> > > -			bool intr,
> > > -			unsigned int num_shared);
> > > -
> > > -void xe_vm_unlock_dma_resv(struct xe_vm *vm,
> > > -			   struct ttm_validate_buffer *tv_onstack,
> > > -			   struct ttm_validate_buffer *tv,
> > > -			   struct ww_acquire_ctx *ww,
> > > -			   struct list_head *objs);
> > > +int xe_vm_lock_dma_resv(struct xe_vm *vm, struct drm_exec *exec,
> > > +			bool intr, unsigned int num_shared);
> > > +
> > > +void xe_vm_unlock_dma_resv(struct xe_vm *vm, struct drm_exec *exec);
> > >   void xe_vm_fence_all_extobjs(struct xe_vm *vm, struct dma_fence *fence,
> > >   			     enum dma_resv_usage usage);
> > > -- 
> > > 2.34.1
> > > 
> 

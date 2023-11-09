Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A136FC4167B
	for <intel-xe@archiver.kernel.org>; Thu,  9 Nov 2023 18:56:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 561EB10E229;
	Thu,  9 Nov 2023 18:56:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E8F110E229
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Nov 2023 18:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699556164; x=1731092164;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=xTBIwjbEZbu3yEuYtYtE9f+Gl8gLKrHFMgG/dp1CMUY=;
 b=UyWFVWgwyyZ10iPZLg2kgA6+q7dUUZ+0XAoa+x4qEX3rvJTeQMeTwUrK
 UPUUL4puPAmtlRZnWpv+nqhS6YjwS1Al0lyvTPrVnsnjW/pAgR9rNXfjb
 UxAQFK/n4m3eidtfqOoJAezHaLKz/DIIqBakCUS/BdiBHnO2VPaLd4n87
 b+Dh1T/4O67AapRckHCE5v1LqZw74vk4ecbO2ObK1CnKNRDojp5Zf5PJl
 Rd2fNov7+bAopi5m7A4tFd7v9O+BTR1Bp3AgEJMJDfx0FCMuPrdTHOgC7
 6MAP4Mudo0zOLZsNIPuuCt7hnf+qCBdBceQFzaz4yUYCcs+W8G9g3gtSL w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="3087881"
X-IronPort-AV: E=Sophos;i="6.03,290,1694761200"; 
   d="scan'208";a="3087881"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 10:56:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="1094967566"
X-IronPort-AV: E=Sophos;i="6.03,290,1694761200"; d="scan'208";a="1094967566"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Nov 2023 10:55:45 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 9 Nov 2023 10:55:30 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 9 Nov 2023 10:55:30 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 9 Nov 2023 10:55:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MZmXuQ6z8CScQbumPOJ5TmrAWTWNhy+BxiXxTkoXk7picbhF6CyXtqu7+uOwC62iAIIO13ETK1uxHMB6NV0JPg30f+psRw35K6kiHs5uaov62Lnuagtufqn50TGgMKuaOahrTjzTq/97LXzI06tszKjCB33EAYeQ0HvnubtLGMPFRAlqQa3w0djdCH/GuKqkskbgD+yN8qUDRYNk9q7q/jVgzTv8BEd8+QCOhL3qHlN3JRyAw37eWFxAXUA5+G4DfvdoOOQ8ts8D6Rv7wxyc0dOxfTNRMZS9uJasfra34eFfH5b9o+13m1m0Kcb3jigdKaq/BSUk00ty5WYsHWT2dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cOq2mXjUxQ8cWDqYYHNbe34csXIyQums4/tAYqJDQag=;
 b=eKNqfRmY5zyRIxwkhGNud2bUIpJ4Ymss9Lrp8wWDK0EmulG3X3adR+PW9BQLjtSmkUItEyPV3hpw5Lqy1+Wq2PuTVug/by/4CLMt0UMKZ5NaRD2WQdXngASJ3lIgI6U4y5U5oZr/yBAhjsndcCHAnMm3H+ocGhY8wKBEBdEamjc62YGquwwc1NWNj8EzZsIoEw5htBwST5U+wiKJgp5TLgA5XaVdDuxee7M/pIJdqJ+zydEO8aXw+09Di+VQbpWteMaoY2vFK22xAWc6MxeVPmdDvDq9VI8MCiCIqJ6/oBotRgGh5SvOwyE7rTyGXYOnjZoVUy9ddJo30THEKJ908A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MN6PR11MB8146.namprd11.prod.outlook.com (2603:10b6:208:470::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Thu, 9 Nov
 2023 18:55:25 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.6977.018; Thu, 9 Nov 2023
 18:55:25 +0000
Date: Thu, 9 Nov 2023 13:55:21 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Welty, Brian" <brian.welty@intel.com>
Message-ID: <ZU0rGful8JOjd0x+@intel.com>
References: <20231103143456.7-1-francois.dugast@intel.com>
 <20231103143456.7-38-francois.dugast@intel.com>
 <4d0648c0-9665-4303-b64e-36365c804699@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <4d0648c0-9665-4303-b64e-36365c804699@intel.com>
X-ClientProxiedBy: MW4PR04CA0229.namprd04.prod.outlook.com
 (2603:10b6:303:87::24) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|MN6PR11MB8146:EE_
X-MS-Office365-Filtering-Correlation-Id: 1394382d-e023-4ede-5949-08dbe1556f06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TA/CJXavSiGwZWCZBu9fXmN+IQDBqSWDDGbXF7fV9vqZuDVwW9tcQt7rlxo6dC+Nfo4JS3y1ejs9ED9koMo7dESPnjXa6CU76hKoEp3bIVI6+KfBrWlgdyz65YGJqf3MqcTEWqPSnS3POhQ5StQyO+Gs2KVdNApZ0FHPnwMPx/oGwIGop5zL36pKLGY86Me4tLSrWrOdCSrLQs1R1uVhrIU/Ry2OBdKfL4aKWgq+dnNhOYl+YAhfUaZeS6y6n+ZD0qPYgzotp/7mQ8K/6Fz4bufQDyr2ivgwqb4dRpIENQDFQhkogsvMmvr/3pK9iqV0z4xBAqvkNHe7Y806/Qa6IfRA6UmZq45agKxz5EVUyywXyNe2oxZ/d9DgXeueOw11J1ZXW1H1syfAxiET05w2+ZIs9yT2lr47A+1OqksqYsGTT3XhfnewQ144FI1KBoXDdfW6a3jgeXXH9Q7gB6EqL06ds5VC+VKPC1XCbzCxbCQtKRMC+RVr6Zzw/6FqV5mlgCaPwFdWBZwT7JawX3KkzxxQtVz/mrjEDqZJUANvFIBtAWqnmYmozJGV2/bSlfpi
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(39860400002)(366004)(396003)(346002)(136003)(230922051799003)(186009)(451199024)(64100799003)(1800799009)(38100700002)(6666004)(6506007)(53546011)(83380400001)(6512007)(82960400001)(2616005)(41300700001)(66556008)(86362001)(6862004)(8676002)(8936002)(36756003)(4326008)(2906002)(44832011)(5660300002)(37006003)(66946007)(6636002)(316002)(66476007)(26005)(478600001)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?w0NcIUJd7SWkaJWBp2dqfDj1zlGprsSnV3G9j/QYO8tZLBLzCu0VdzTh6G1I?=
 =?us-ascii?Q?3+R63Xyqqo9H2fBvta27Gd2qM9Jf/DhbWc3z6Vk2a6wpTI4NJaHNYrxAFpYU?=
 =?us-ascii?Q?+70jI23HBwpbN2bhLSBwe8AAquK+Rxlg2TooBVmDey/8mB7audJdVmM5+dsR?=
 =?us-ascii?Q?A4u4gsxB+I3/KWUxsYY3rVnAOlYf9qLGx7Lp0mePfot5zfluWS49qbXsimDl?=
 =?us-ascii?Q?g8xpaMjzD8eKyNz0AUw6SGv3Svw/fOlvtV4WVWpve1NQ6O6ttoVg0X1ONPvF?=
 =?us-ascii?Q?n0lnM3s+kNd/i9EaGtgXVYouyUBowpplJy6/17tU/8zknj/ijFRBNBbra4cc?=
 =?us-ascii?Q?JW/uHAtoWU3+jk1dqC6MZ26F74rgyFD2JPzzXT8y/am+pMiPlaVo5scxxIwW?=
 =?us-ascii?Q?OBjKbH6KhKCZkStBXGcmB/m1ef3MBcJuFScA2io+CHBDkox3CzNdd3LRd1Qg?=
 =?us-ascii?Q?1e6FsGlZj4hd8dveyB3wuW8u1T64BdIXeHHPkrTnoPvAv4TDEz9qennEOt9f?=
 =?us-ascii?Q?QcJSM3rMGrb51QUGG4tyIiGoA0KK8nZZDBznRk1A2ZgACGDrtPZNAOv+9Lb2?=
 =?us-ascii?Q?S0EM6hkrl1VsdUvBZabiYJLwTIaoAlBcoMTnuBFvbQRZoeMW5o+d3lfe9uTJ?=
 =?us-ascii?Q?5oEjGdx+CQKqVcedNnOTGoLnACFSZQHA1ZOCWG9USrYZpIjRmx4OWEoILttR?=
 =?us-ascii?Q?6n4+aqGgOFqSip/UvW+edRxQn29CY6Onrw5j4NIBP6Qo0pbbi8bv6fFMcJ1c?=
 =?us-ascii?Q?xiGH9FIqtkpmefJgVjKg6L42MS0uDyr4GwDu9JjtqhaJPHfTza7TYQfpIIbp?=
 =?us-ascii?Q?MMvhWDWdnnEFPJubPpq05C+haEGcZdspMnO3xyM6XMdVMXUBoHEyd7hANuXB?=
 =?us-ascii?Q?qlJ2P6aD1Idus39P8h5HHeqwVtIk1wYZCKiRGWpOoOso+vV2zGV6qtP0gC85?=
 =?us-ascii?Q?a+XVnC4EJ8ovBGXrdCp7NW+CF6QwIEwi7pZ0JQP6JFHxDmo1a+PYzhu8tem+?=
 =?us-ascii?Q?BecjosZOTsHlVAosOukaz8IPJe8W3nvaGMSz6yQGzY8CSdT4QXim+EGEIUN/?=
 =?us-ascii?Q?X3DkNLlM+5+Hcxi7a9wO2CtYr5iYbTZzjT6dxGIwjIVA+cTb3OoZRW7ToAvq?=
 =?us-ascii?Q?3OD+kiWuunlNjEGdQIJPor4J+ulYE1yE7U4V8u97WenMNMPd3JumZHQksB+q?=
 =?us-ascii?Q?YmgKgda3oDwq5NpVWNnK83KFqlUssBJ3W/JPudycwNIf/TutgSTwb6ZjEJvT?=
 =?us-ascii?Q?6cGdWIXqLehVu38Iv7uGZDQhoiINqCr0xoeCDRkh14wP/+/W/HHwH4MVyydk?=
 =?us-ascii?Q?HvtaWS3KuhFzh2HlmldgPva/Z3OJrbDAFcLjDiqQQGhdR5nhS0OFrf/WhG6y?=
 =?us-ascii?Q?38+Uj0KCkd/pU6SGChI4bdZ1RgT7BpHKzb7XanDHSnYtNcnA6f+w/ZrQphBo?=
 =?us-ascii?Q?vmAnB05G9ZUrZ8VKztsKnzFBjGG0W6uc6/FMhyI+cux7o8EmADRN4ixEqgRV?=
 =?us-ascii?Q?HhH6fuGraCWr673jm5En1dakdfwtGLrpXDTKNl0PaLcficGHud35GRehAL5j?=
 =?us-ascii?Q?rKGecK4dt/lc9hdIa5o+D9EZuj0+TiSSIerQPe5h?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1394382d-e023-4ede-5949-08dbe1556f06
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2023 18:55:25.6393 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZwizN31jolLX1CfMdyHf9o/tlG4Ny+VMs3p32GrQK9Qj3v1ZhaOgzJsz9rWnCWviO5rcmbxDPOKiZFW6Ha95/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8146
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 37/50] drm/xe/uapi: Convert tile_mask to a
 pt_placement_hint
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

On Tue, Nov 07, 2023 at 04:17:51PM -0800, Welty, Brian wrote:
> 
> On 11/3/2023 7:34 AM, Francois Dugast wrote:
> > From: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > 
> > The previous tile_mask was also an optional hint, and only used
> > for the page-table tree placement. However, it was so tied
> > with the tile concept itself. Let's clarify things up and make
> > this generic enough. So accept any valid memory region mask.
> > It could even be a direct near_mem_region gotten from the engine_info.
> > pt stands for page table.
> > 
> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_vm.c | 14 ++++++++++----
> >   include/uapi/drm/xe_drm.h  | 16 +++++++++++++---
> >   2 files changed, 23 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index 5538b0ed81e8..c7eb8d43bf33 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -3007,11 +3007,16 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> >   			goto release_vm_lock;
> >   		}
> > -		if (bind_ops[i].tile_mask) {
> > +		if (bind_ops[i].pt_placement_hint) {
> >   			u64 valid_tiles = BIT(xe->info.tile_count) - 1;
> > +			/*
> > +			 * System memory is currently ignored from this hint,
> > +			 * which gets entirely converted to a tile_mask
> > +			 */
> > +			u8 system_memory = 0x1;
> > -			if (XE_IOCTL_DBG(xe, bind_ops[i].tile_mask &
> > -					 ~valid_tiles)) {
> > +			if (XE_IOCTL_DBG(xe, bind_ops[i].pt_placement_hint &
> > +					 ~valid_tiles & ~system_memory)) {
> 
> But valid_tiles is not correct bitmask to use here as that is tiles, not a
> mask of VRAM regions...
> If pt_placement_hint is actually memory regions, I think you simply want:
> 	if (XE_IOCTL_DBG(xe, bind_ops[i].pt_placement_hint &
> ~xe->info.mem_region_mask) {

yes, this is a better check indeed. let's change.

> 
> 
> >   				err = -EINVAL;
> >   				goto release_vm_lock;
> >   			}
> > @@ -3088,7 +3093,8 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> >   		u32 op = bind_ops[i].op;
> >   		u32 flags = bind_ops[i].flags;
> >   		u64 obj_offset = bind_ops[i].obj_offset;
> > -		u8 tile_mask = bind_ops[i].tile_mask;
> > +		/* Remove the system memory bit when converting to tiles */
> > +		u8 tile_mask = bind_ops[i].pt_placement_hint & ~0x1;
> 
> Same as above...  conversion doesn't look right.
> If you want a tile_mask, don't you need to shift the pt_placement_hint ?
> So you want to convert XE_PL_VRAM0 and XE_PL_VRAM1 to a bitmask of tiles?
> I think you need:
>    tile_mask = bind_ops[i].pt_placement_hint  >> 1;

good catch, so we don't need to change the rest of the internal code.

> 
> -Brian
> 
> 
> >   		u32 prefetch_region = bind_ops[i].prefetch_mem_region_instance;
> >   		ops[i] = vm_bind_ioctl_ops_create(vm, bos[i], obj_offset,
> > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> > index 35ce3605fc0b..2d0fb4386a69 100644
> > --- a/include/uapi/drm/xe_drm.h
> > +++ b/include/uapi/drm/xe_drm.h
> > @@ -850,10 +850,20 @@ struct drm_xe_vm_bind_op {
> >   	__u64 addr;
> >   	/**
> > -	 * @tile_mask: Mask for which tiles to create binds for, 0 == All tiles,
> > -	 * only applies to creating new VMAs
> > +	 * @pt_placement_hint: An optional memory_region bit-mask hint, which
> > +	 * only applies when creating new VMAs. Default value '0' is the
> > +	 * recommended value.
> > +	 *
> > +	 * It hints the optimal placement for the page-table tree for this VMA.
> > +	 * For instance, when userspace is using engines living in a secondary
> > +	 * tile with allocated BOs near those engines, that same
> > +	 * @near_mem_region could be used in this hint field.
> > +	 *
> > +	 * Since it is a hint, the Xe kernel driver is free to ignore this mask
> > +	 * and choose the best location for the page-table, taking into
> > +	 * consideration the running hardware and runtime constrains.
> >   	 */
> > -	__u64 tile_mask;
> > +	__u64 pt_placement_hint;
> >   #define DRM_XE_VM_BIND_OP_MAP		0x0
> >   #define DRM_XE_VM_BIND_OP_UNMAP		0x1

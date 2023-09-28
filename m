Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD875CE7B1E
	for <intel-xe@archiver.kernel.org>; Thu, 28 Sep 2023 19:13:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CE9510E072;
	Thu, 28 Sep 2023 19:13:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3151710E072
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Sep 2023 19:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695928410; x=1727464410;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=JHiGqP2GivsqCQvGgAziDle1EQldVjbLl7B2uUALcc0=;
 b=DcHBtsecWCLeS8IgyG4JEhXvQ/UvYpVxwX4Me6NxQjYmvrTmE90qAP+b
 i4AViZgJeKP7U5jcTxsWc5Bmwlotk7XI4UsXQ+SYFSOjKl2Vno/KWRKbq
 pAz6eWgOlOhLHaNcG/kDnSHzlo+hek3NIBPZN9DQLcRRCJrSB0+LrAO6o
 TYM4qK3Q13p4Hu7prtnBcUAXHeWDcrF/GKjy/fHR+VBShf0QNPGOqi8pG
 QMETIr4Z9eJ0bL3kBHAbXZoXyvjcVi7BIKqV+MQ3C9l2GcLiqOCN5iUy3
 V/NqOUiaNc3V07LpO+1YOMajsMTnLJGljmfG58JF33vnYUgaFsBNonJhP A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="381039805"
X-IronPort-AV: E=Sophos;i="6.03,185,1694761200"; d="scan'208";a="381039805"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2023 12:13:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="840024102"
X-IronPort-AV: E=Sophos;i="6.03,185,1694761200"; d="scan'208";a="840024102"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Sep 2023 12:13:08 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 28 Sep 2023 12:13:08 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 28 Sep 2023 12:13:08 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 28 Sep 2023 12:13:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IgYHk3nKE90bTvhYqdtuw7bxsombJ7j2ITPkShIw9K9ZqoWtvYVu/vV/pwchkQGesg5wbvlcafpKY3a+blqplYNZh6XvHsWAKoaB6qdDPmMVKtN4KFDlPo7TsseOLs7E5bwoeMs/XyZW128kTdh78unTR/P3h8/dQwj37qV9uC8J9BXuaD2a2YTlQXrkGlLIWOEyCROeUB3ATf88/K7EL0HMAf+mDz5mrulzyYW13SYqZiIwO3CvMyr3bpCTMhFDyXtS9GRUH0BlrdVqNgdeCxuNG9d/oC68yRwLhWgpY0UyYwEam7/6BdNY/myRisIsNcUvv+uETlehVjfJyDkNyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4BJSoGHEIMVmzP97MVBfF6okF1hsCpdTYx+rleHy44E=;
 b=ExOeTaGTw1jxQNgEKxJRAibczcRK3eQVMg5OJjOoLQ+LY/tSbX7c9q/MlAeexY0drfe+MjLkkgyWe8cTuy32qs/rM/FFhG3X1fdMmmGSWPdTMigTY3nXoHzOctEGZ4eAxpZgYpSJxenjE7Eoy1uXMpiZJDnVOpP7OjaRmXob2NClady9Hf+YJe6tx1N5unMLio+LFxVgTWPy1LCGUkAKhmA+jCT6W349sqFjjwXpUWiU37+rZVtQ0V63xiutIs3RAC/nWv3Tgb8VF8D+0VAKwHcVwwhPxronBdJK//sAbh6F2MmsxQX9XXSkBj9iuV5r2GQ4Ji7qJ963oGU+RufK2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 MN2PR11MB4551.namprd11.prod.outlook.com (2603:10b6:208:269::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6813.28; Thu, 28 Sep 2023 19:13:05 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::14ea:3a78:f950:d6d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::14ea:3a78:f950:d6d0%7]) with mapi id 15.20.6838.024; Thu, 28 Sep 2023
 19:13:05 +0000
Date: Thu, 28 Sep 2023 12:13:02 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Message-ID: <20230928191302.GB233750@mdroper-desk1.amr.corp.intel.com>
References: <20230928100537.392675-7-matthew.auld@intel.com>
 <20230928100537.392675-9-matthew.auld@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230928100537.392675-9-matthew.auld@intel.com>
X-ClientProxiedBy: BY5PR16CA0001.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::14) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|MN2PR11MB4551:EE_
X-MS-Office365-Filtering-Correlation-Id: 962fa809-f796-44d8-696f-08dbc056f124
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GIJg3vB/Dcncicr757stWU7P0PbkFOdBNuJsRfiN1cUlxRFl1cpjwss17JCColyUVMRVKskF1GDSRZfsIpVf3pRCSvkcqctoUt/s8BSXGp10zE9mv6Ehky1L+qPFzbimeYtzsFo/y2dbXX3Flw6zQtEFasOd8zxlkyERz4mwXEhj1FJGN65afBnpfGYiSKTUcDA9QKbXV5XaPfickaQtdeciCyevrvChQ9APZE0sJLkNyxFu/UpLz292V4Ix9UWXkcCDwkd/zZfUj6KhVdxKJojjamG9xggWIQwvAQ0XfnxHXiWACoYTnWGU1wYyQTkVSDzIhHawUPE38gKgoRue0EwW7ibZaFl9RYF8y4+/L3zYXOAqj+EHPEYcszoPppIlgd/ERrYT1SyHzqBulXbn9nsZwcOqptskgDFir54mRiFe17elHIOhwmoGr300ryGYAGKKkfEhxExvE4FWBWzH25NSWzzEaCnuGt/WfWTfoZ0AXV+h7X4rhRqJSo/NlJQfDXORQGZriD7KKf72yFT7OCkqTeJnVpgd9Pt5zago3HmIXwlakRjky4kLwcl59RS7
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(346002)(376002)(136003)(39860400002)(230922051799003)(64100799003)(186009)(451199024)(1800799009)(2906002)(66476007)(5660300002)(54906003)(30864003)(6666004)(478600001)(66556008)(6512007)(1076003)(107886003)(66946007)(6506007)(26005)(6486002)(6862004)(6636002)(8676002)(316002)(8936002)(83380400001)(4326008)(41300700001)(86362001)(38100700002)(82960400001)(33656002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8dST86v2nrSjKuUhl/OryQGau8+BT6ENK/Pn+dfjvVUhE8JVcIEMFBOIU5gr?=
 =?us-ascii?Q?ke0jUA1/0ku1kON6jhx4hR/JnBlu6yfjhHgoQ+Avzcd9GmdtSCPiS9GuUPfe?=
 =?us-ascii?Q?Pvy6pTt3esMGmd0z0kNa9umVWidrtM0lNi7LAhDjxLhUBHZthVuq/A8y+Jof?=
 =?us-ascii?Q?ngN+Uls/zd07hdcqwCQLVYKcBYoteieZeA3HTAqJ+D8u+KuUhpbjruJ+bVp1?=
 =?us-ascii?Q?In+OhuiUEeHCzN4h4JzFoUHQ2k9rXIdNdyuuMxjsBOS0dqm6pAXNXXyxHDWY?=
 =?us-ascii?Q?UXDxxKJLRv0WQkEM3khD3s0xZXcyoXcz7zmzx7DVcphgj0ffh6ARIFzl7PEw?=
 =?us-ascii?Q?r0DvUfrc09W552nwozPpY8cSm9WrfY07v8X/Fu4jNHlRDNEoZfYLHAvtFS5h?=
 =?us-ascii?Q?NzL3muUhl0Qk3FEVHJ0YBoSei4MQ5KCoXje5Udoq+XZlZ9u+oOu+3VgLulq2?=
 =?us-ascii?Q?cBxLfiCO4EBAUuF6CKw7Clp/Jch7HVqhgc/YeBaH8U7gKmPYeqCb8ZHtF13x?=
 =?us-ascii?Q?Fv6WIiW5e3jIFsmqr+YTsx/fz1vXSG8UFGkLkmWZBoP/nMhzljlxWrya5FsH?=
 =?us-ascii?Q?lgqNlfQT5rPr45g58Km3rdLBfzW3ah7RDHJQwWHyq+BHF6Qiox2H4AWPGTGw?=
 =?us-ascii?Q?F4hrVQWbZ3b7XlggoqgIM3V4i/ZULqsPk7cbNO6oeQrZ1RQbdqQF9yvMd+VC?=
 =?us-ascii?Q?E6Qed51Yo9mwheA6dC3QaAjm4x4dOJoYq4ep41xhHwrguCIUC3BO1G6RZvlR?=
 =?us-ascii?Q?jwvfdcLfw4QKK/PF5Vf3yO2hP2w/x7aUqUpHZvT7QZ+vbsENf++wU1OiQ2I5?=
 =?us-ascii?Q?sUm/uK7kU3Mq6hwsjTuOnaZxKAPQ3Q/1Hx+YG7ddms1VhDBPLr945yBJxgSm?=
 =?us-ascii?Q?HqawbOC2o6EIbDFC6uo3pcq+D5bjOBbMqvZxg7cSQutH6aCqSEUqGEie0hXW?=
 =?us-ascii?Q?p8x+WdYs6Kp+fXO2QNAP9OET2vXrofPt6xpCQEugxw1sMZPbYG9NLfF/RVdW?=
 =?us-ascii?Q?7GuhbBHAHQS3mMcLtFGyX3Rm2vayDs9sZDd7lmPM6V3cESEz20OGA+piS3Kw?=
 =?us-ascii?Q?TjzxdrWhT5XILlxvWHm/5iQ/eKuFjxpswev5bLIEXV44cJ7wYe+IC3AUR5RU?=
 =?us-ascii?Q?BaCIbIaisa7W2S6NuG1dr++MByCvB1BL8paYwMSQCztQdZAY4NCywxYR8iYg?=
 =?us-ascii?Q?//TuD0lNWiwW7PtesCGwwZ60eTJsIBFvCurl83TAJz0ePN3oCADUk0bU4ba1?=
 =?us-ascii?Q?V4x+xGXS+xke/NLE5cV+MiRtEoS34TYQTdnhdwE3QBLl/yy7MIPNUXuRZudx?=
 =?us-ascii?Q?yFD00pyhM+M7e7efqddKg1/9BQ74IlTygC7yEMmmiiRIjABZpe1I9gUOqNB5?=
 =?us-ascii?Q?jA3MyC+l990idooX7fQ7nHTmwsGgFrppdDEpoEoiu7I+mnCt4bOz9UN3npLA?=
 =?us-ascii?Q?7soyYz1LC+MsWjKsae70pqUV16xdR9iHK2jec5iu2P+ZY/WBi/jmxd53hdyn?=
 =?us-ascii?Q?KiUjYS3EeRJ4/M/8MKy6k7Pl6PNPkIhgZyc0omn+hIi0CW8foHWVrXYeUsvq?=
 =?us-ascii?Q?nJYcexZAcvyoCQ3KJT/MXeirdxp0ZBYoEnDAXtuu7J4m78epX/9ko1fyV0H5?=
 =?us-ascii?Q?Lg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 962fa809-f796-44d8-696f-08dbc056f124
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2023 19:13:05.0123 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l2B9zeZd9kB9CGOMuhaK0Sxte+eOaiKwR3HWV9oELBa0UCG6jFHuv5InWQDcFHV1V6uQF+qmk8oZexkQB5sZ62clGitwhT7mEhs6Ko6U3G4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4551
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v6 2/5] drm/xe: directly use pat_index for
 pte_encode
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Sep 28, 2023 at 11:05:40AM +0100, Matthew Auld wrote:
> In the next patch userspace will be able to directly set the pat_index
> as part of vm_bind. To support this we need to get away from using
> xe_cache_level in the low level routines and rather just use the
> pat_index directly.
> 
> v2: Rebase
> v3: Some missed conversions, also prefer tile_to_xe() (Niranjana)
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> Cc: Pallavi Mishra <pallavi.mishra@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>

Aside from the unnecessary 'const' in the parameter list of
pde_encode_bo that Lucas pointed out,

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/display/xe_fb_pin.c | 10 ++++++----
>  drivers/gpu/drm/xe/tests/xe_migrate.c  |  2 +-
>  drivers/gpu/drm/xe/xe_ggtt.c           | 16 +++++++++-------
>  drivers/gpu/drm/xe/xe_ggtt_types.h     |  3 +--
>  drivers/gpu/drm/xe/xe_migrate.c        | 19 +++++++++++--------
>  drivers/gpu/drm/xe/xe_pt.c             | 11 ++++++-----
>  drivers/gpu/drm/xe/xe_pt_types.h       |  8 ++++----
>  drivers/gpu/drm/xe/xe_vm.c             | 24 +++++++++++-------------
>  8 files changed, 49 insertions(+), 44 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> index b7a04fba3585..2c36e5032433 100644
> --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
> +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> @@ -30,7 +30,7 @@ write_dpt_rotated(struct xe_bo *bo, struct iosys_map *map, u32 *dpt_ofs, u32 bo_
>  
>  		for (row = 0; row < height; row++) {
>  			u64 pte = ggtt->pt_ops->pte_encode_bo(bo, src_idx * XE_PAGE_SIZE,
> -							      XE_CACHE_WB);
> +							      xe->pat.idx[XE_CACHE_WB]);
>  
>  			iosys_map_wr(map, *dpt_ofs, u64, pte);
>  			*dpt_ofs += 8;
> @@ -84,7 +84,7 @@ static int __xe_pin_fb_vma_dpt(struct intel_framebuffer *fb,
>  
>  		for (x = 0; x < size / XE_PAGE_SIZE; x++) {
>  			u64 pte = ggtt->pt_ops->pte_encode_bo(bo, x * XE_PAGE_SIZE,
> -							      XE_CACHE_WB);
> +							      xe->pat.idx[XE_CACHE_WB]);
>  
>  			iosys_map_wr(&dpt->vmap, x * 8, u64, pte);
>  		}
> @@ -110,6 +110,7 @@ static void
>  write_ggtt_rotated(struct xe_bo *bo, struct xe_ggtt *ggtt, u32 *ggtt_ofs, u32 bo_ofs,
>  		   u32 width, u32 height, u32 src_stride, u32 dst_stride)
>  {
> +	struct xe_device *xe = xe_bo_device(bo);
>  	u32 column, row;
>  
>  	for (column = 0; column < width; column++) {
> @@ -117,7 +118,7 @@ write_ggtt_rotated(struct xe_bo *bo, struct xe_ggtt *ggtt, u32 *ggtt_ofs, u32 bo
>  
>  		for (row = 0; row < height; row++) {
>  			u64 pte = ggtt->pt_ops->pte_encode_bo(bo, src_idx * XE_PAGE_SIZE,
> -							      XE_CACHE_WB);
> +							      xe->pat.idx[XE_CACHE_WB]);
>  
>  			xe_ggtt_set_pte(ggtt, *ggtt_ofs, pte);
>  			*ggtt_ofs += XE_PAGE_SIZE;
> @@ -162,7 +163,8 @@ static int __xe_pin_fb_vma_ggtt(struct intel_framebuffer *fb,
>  			goto out_unlock;
>  
>  		for (x = 0; x < size; x += XE_PAGE_SIZE) {
> -			u64 pte = ggtt->pt_ops->pte_encode_bo(bo, x, XE_CACHE_WB);
> +			u64 pte = ggtt->pt_ops->pte_encode_bo(bo, x,
> +							      xe->pat.idx[XE_CACHE_WB]);
>  
>  			xe_ggtt_set_pte(ggtt, vma->node.start + x, pte);
>  		}
> diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
> index 6906ff9d9c31..4c8526af06ce 100644
> --- a/drivers/gpu/drm/xe/tests/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
> @@ -301,7 +301,7 @@ static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test)
>  	/* First part of the test, are we updating our pagetable bo with a new entry? */
>  	xe_map_wr(xe, &bo->vmap, XE_PAGE_SIZE * (NUM_KERNEL_PDE - 1), u64,
>  		  0xdeaddeadbeefbeef);
> -	expected = m->q->vm->pt_ops->pte_encode_bo(pt, 0, XE_CACHE_WB, 0);
> +	expected = m->q->vm->pt_ops->pte_encode_bo(pt, 0, xe->pat.idx[XE_CACHE_WB], 0);
>  	if (m->q->vm->flags & XE_VM_FLAG_64K)
>  		expected |= XE_PTE_PS64;
>  	if (xe_bo_is_vram(pt))
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 99b54794917e..354871a6b371 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -27,7 +27,7 @@
>  #define GUC_GGTT_TOP	0xFEE00000
>  
>  static u64 xelp_ggtt_pte_encode_bo(struct xe_bo *bo, u64 bo_offset,
> -				   enum xe_cache_level cache)
> +				   u16 pat_index)
>  {
>  	u64 pte;
>  
> @@ -41,13 +41,12 @@ static u64 xelp_ggtt_pte_encode_bo(struct xe_bo *bo, u64 bo_offset,
>  }
>  
>  static u64 xelpg_ggtt_pte_encode_bo(struct xe_bo *bo, u64 bo_offset,
> -				    enum xe_cache_level cache)
> +				    u16 pat_index)
>  {
>  	struct xe_device *xe = xe_bo_device(bo);
> -	u32 pat_index = xe->pat.idx[cache];
>  	u64 pte;
>  
> -	pte = xelp_ggtt_pte_encode_bo(bo, bo_offset, cache);
> +	pte = xelp_ggtt_pte_encode_bo(bo, bo_offset, pat_index);
>  
>  	xe_assert(xe, pat_index <= 3);
>  
> @@ -79,6 +78,7 @@ void xe_ggtt_set_pte(struct xe_ggtt *ggtt, u64 addr, u64 pte)
>  
>  static void xe_ggtt_clear(struct xe_ggtt *ggtt, u64 start, u64 size)
>  {
> +	u16 pat_index = tile_to_xe(ggtt->tile)->pat.idx[XE_CACHE_WB];
>  	u64 end = start + size - 1;
>  	u64 scratch_pte;
>  
> @@ -86,7 +86,7 @@ static void xe_ggtt_clear(struct xe_ggtt *ggtt, u64 start, u64 size)
>  
>  	if (ggtt->scratch)
>  		scratch_pte = ggtt->pt_ops->pte_encode_bo(ggtt->scratch, 0,
> -							  XE_CACHE_WB);
> +							  pat_index);
>  	else
>  		scratch_pte = 0;
>  
> @@ -285,9 +285,10 @@ void xe_ggtt_invalidate(struct xe_ggtt *ggtt)
>  
>  void xe_ggtt_printk(struct xe_ggtt *ggtt, const char *prefix)
>  {
> +	u16 pat_index = tile_to_xe(ggtt->tile)->pat.idx[XE_CACHE_WB];
>  	u64 addr, scratch_pte;
>  
> -	scratch_pte = ggtt->pt_ops->pte_encode_bo(ggtt->scratch, 0, XE_CACHE_WB);
> +	scratch_pte = ggtt->pt_ops->pte_encode_bo(ggtt->scratch, 0, pat_index);
>  
>  	printk("%sGlobal GTT:", prefix);
>  	for (addr = 0; addr < ggtt->size; addr += XE_PAGE_SIZE) {
> @@ -324,11 +325,12 @@ int xe_ggtt_insert_special_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
>  
>  void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
>  {
> +	u16 pat_index = tile_to_xe(ggtt->tile)->pat.idx[XE_CACHE_WB];
>  	u64 start = bo->ggtt_node.start;
>  	u64 offset, pte;
>  
>  	for (offset = 0; offset < bo->size; offset += XE_PAGE_SIZE) {
> -		pte = ggtt->pt_ops->pte_encode_bo(bo, offset, XE_CACHE_WB);
> +		pte = ggtt->pt_ops->pte_encode_bo(bo, offset, pat_index);
>  		xe_ggtt_set_pte(ggtt, start + offset, pte);
>  	}
>  
> diff --git a/drivers/gpu/drm/xe/xe_ggtt_types.h b/drivers/gpu/drm/xe/xe_ggtt_types.h
> index 486016ea5b67..d8c584d9a8c3 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt_types.h
> +++ b/drivers/gpu/drm/xe/xe_ggtt_types.h
> @@ -14,8 +14,7 @@ struct xe_bo;
>  struct xe_gt;
>  
>  struct xe_ggtt_pt_ops {
> -	u64 (*pte_encode_bo)(struct xe_bo *bo, u64 bo_offset,
> -			     enum xe_cache_level cache);
> +	u64 (*pte_encode_bo)(struct xe_bo *bo, u64 bo_offset, u16 pat_index);
>  };
>  
>  struct xe_ggtt {
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index cd2e00008aab..b8b81a9ce2ca 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -158,6 +158,7 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
>  				 struct xe_vm *vm)
>  {
>  	struct xe_device *xe = tile_to_xe(tile);
> +	u16 pat_index = xe->pat.idx[XE_CACHE_WB];
>  	u8 id = tile->id;
>  	u32 num_entries = NUM_PT_SLOTS, num_level = vm->pt_root[id]->level;
>  	u32 map_ofs, level, i;
> @@ -189,7 +190,7 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
>  		return ret;
>  	}
>  
> -	entry = vm->pt_ops->pde_encode_bo(bo, bo->size - XE_PAGE_SIZE, XE_CACHE_WB);
> +	entry = vm->pt_ops->pde_encode_bo(bo, bo->size - XE_PAGE_SIZE, pat_index);
>  	xe_pt_write(xe, &vm->pt_root[id]->bo->vmap, 0, entry);
>  
>  	map_ofs = (num_entries - num_level) * XE_PAGE_SIZE;
> @@ -197,7 +198,7 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
>  	/* Map the entire BO in our level 0 pt */
>  	for (i = 0, level = 0; i < num_entries; level++) {
>  		entry = vm->pt_ops->pte_encode_bo(bo, i * XE_PAGE_SIZE,
> -						  XE_CACHE_WB, 0);
> +						  pat_index, 0);
>  
>  		xe_map_wr(xe, &bo->vmap, map_ofs + level * 8, u64, entry);
>  
> @@ -216,7 +217,7 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
>  		     i += vm->flags & XE_VM_FLAG_64K ? XE_64K_PAGE_SIZE :
>  		     XE_PAGE_SIZE) {
>  			entry = vm->pt_ops->pte_encode_bo(batch, i,
> -							  XE_CACHE_WB, 0);
> +							  pat_index, 0);
>  
>  			xe_map_wr(xe, &bo->vmap, map_ofs + level * 8, u64,
>  				  entry);
> @@ -241,7 +242,7 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
>  			flags = XE_PDE_64K;
>  
>  		entry = vm->pt_ops->pde_encode_bo(bo, map_ofs + (level - 1) *
> -						  XE_PAGE_SIZE, XE_CACHE_WB);
> +						  XE_PAGE_SIZE, pat_index);
>  		xe_map_wr(xe, &bo->vmap, map_ofs + XE_PAGE_SIZE * level, u64,
>  			  entry | flags);
>  	}
> @@ -249,7 +250,7 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
>  	/* Write PDE's that point to our BO. */
>  	for (i = 0; i < num_entries - num_level; i++) {
>  		entry = vm->pt_ops->pde_encode_bo(bo, i * XE_PAGE_SIZE,
> -						  XE_CACHE_WB);
> +						  pat_index);
>  
>  		xe_map_wr(xe, &bo->vmap, map_ofs + XE_PAGE_SIZE +
>  			  (i + 1) * 8, u64, entry);
> @@ -261,7 +262,7 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
>  
>  		level = 2;
>  		ofs = map_ofs + XE_PAGE_SIZE * level + 256 * 8;
> -		flags = vm->pt_ops->pte_encode_addr(xe, 0, XE_CACHE_WB, level,
> +		flags = vm->pt_ops->pte_encode_addr(xe, 0, pat_index, level,
>  						    true, 0);
>  
>  		/*
> @@ -457,6 +458,7 @@ static void emit_pte(struct xe_migrate *m,
>  		     struct xe_res_cursor *cur,
>  		     u32 size, struct xe_bo *bo)
>  {
> +	u16 pat_index = tile_to_xe(m->tile)->pat.idx[XE_CACHE_WB];
>  	u32 ptes;
>  	u64 ofs = at_pt * XE_PAGE_SIZE;
>  	u64 cur_ofs;
> @@ -500,7 +502,7 @@ static void emit_pte(struct xe_migrate *m,
>  			}
>  
>  			addr = m->q->vm->pt_ops->pte_encode_addr(m->tile->xe,
> -								 addr, XE_CACHE_WB,
> +								 addr, pat_index,
>  								 0, devmem, flags);
>  			bb->cs[bb->len++] = lower_32_bits(addr);
>  			bb->cs[bb->len++] = upper_32_bits(addr);
> @@ -1198,6 +1200,7 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
>  	bool first_munmap_rebind = vma &&
>  		vma->gpuva.flags & XE_VMA_FIRST_REBIND;
>  	struct xe_exec_queue *q_override = !q ? m->q : q;
> +	u16 pat_index = xe->pat.idx[XE_CACHE_WB];
>  
>  	/* Use the CPU if no in syncs and engine is idle */
>  	if (no_in_syncs(syncs, num_syncs) && xe_exec_queue_is_idle(q_override)) {
> @@ -1269,7 +1272,7 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
>  
>  			xe_tile_assert(tile, pt_bo->size == SZ_4K);
>  
> -			addr = vm->pt_ops->pte_encode_bo(pt_bo, 0, XE_CACHE_WB, 0);
> +			addr = vm->pt_ops->pte_encode_bo(pt_bo, 0, pat_index, 0);
>  			bb->cs[bb->len++] = lower_32_bits(addr);
>  			bb->cs[bb->len++] = upper_32_bits(addr);
>  		}
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 4d4c6a4c305e..92b512641b4a 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -50,6 +50,7 @@ static struct xe_pt *xe_pt_entry(struct xe_pt_dir *pt_dir, unsigned int index)
>  static u64 __xe_pt_empty_pte(struct xe_tile *tile, struct xe_vm *vm,
>  			     unsigned int level)
>  {
> +	u16 pat_index = tile_to_xe(tile)->pat.idx[XE_CACHE_WB];
>  	u8 id = tile->id;
>  
>  	if (!vm->scratch_bo[id])
> @@ -57,9 +58,9 @@ static u64 __xe_pt_empty_pte(struct xe_tile *tile, struct xe_vm *vm,
>  
>  	if (level > 0)
>  		return vm->pt_ops->pde_encode_bo(vm->scratch_pt[id][level - 1]->bo,
> -						 0, XE_CACHE_WB);
> +						 0, pat_index);
>  
> -	return vm->pt_ops->pte_encode_bo(vm->scratch_bo[id], 0, XE_CACHE_WB, 0);
> +	return vm->pt_ops->pte_encode_bo(vm->scratch_bo[id], 0, pat_index, 0);
>  }
>  
>  /**
> @@ -510,6 +511,7 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff_t offset,
>  {
>  	struct xe_pt_stage_bind_walk *xe_walk =
>  		container_of(walk, typeof(*xe_walk), base);
> +	u16 pat_index = tile_to_xe(xe_walk->tile)->pat.idx[xe_walk->cache];
>  	struct xe_pt *xe_parent = container_of(parent, typeof(*xe_parent), base);
>  	struct xe_vm *vm = xe_walk->vm;
>  	struct xe_pt *xe_child;
> @@ -526,7 +528,7 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff_t offset,
>  
>  		pte = vm->pt_ops->pte_encode_vma(is_null ? 0 :
>  						 xe_res_dma(curs) + xe_walk->dma_offset,
> -						 xe_walk->vma, xe_walk->cache, level);
> +						 xe_walk->vma, pat_index, level);
>  		pte |= xe_walk->default_pte;
>  
>  		/*
> @@ -591,8 +593,7 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff_t offset,
>  			xe_child->is_compact = true;
>  		}
>  
> -		pte = vm->pt_ops->pde_encode_bo(xe_child->bo, 0,
> -						xe_walk->cache) | flags;
> +		pte = vm->pt_ops->pde_encode_bo(xe_child->bo, 0, pat_index) | flags;
>  		ret = xe_pt_insert_entry(xe_walk, xe_parent, offset, xe_child,
>  					 pte);
>  	}
> diff --git a/drivers/gpu/drm/xe/xe_pt_types.h b/drivers/gpu/drm/xe/xe_pt_types.h
> index bd6645295fe6..355fa8f014e9 100644
> --- a/drivers/gpu/drm/xe/xe_pt_types.h
> +++ b/drivers/gpu/drm/xe/xe_pt_types.h
> @@ -38,14 +38,14 @@ struct xe_pt {
>  
>  struct xe_pt_ops {
>  	u64 (*pte_encode_bo)(struct xe_bo *bo, u64 bo_offset,
> -			     enum xe_cache_level cache, u32 pt_level);
> +			     u16 pat_index, u32 pt_level);
>  	u64 (*pte_encode_vma)(u64 pte, struct xe_vma *vma,
> -			      enum xe_cache_level cache, u32 pt_level);
> +			      u16 pat_index, u32 pt_level);
>  	u64 (*pte_encode_addr)(struct xe_device *xe, u64 addr,
> -			       enum xe_cache_level cache,
> +			       u16 pat_index,
>  			       u32 pt_level, bool devmem, u64 flags);
>  	u64 (*pde_encode_bo)(struct xe_bo *bo, u64 bo_offset,
> -			     const enum xe_cache_level cache);
> +			     const u16 pat_index);
>  };
>  
>  struct xe_pt_entry {
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index beffbb1039d3..4804a0cd8a36 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1191,9 +1191,8 @@ static struct drm_gpuva_fn_ops gpuva_ops = {
>  	.op_alloc = xe_vm_op_alloc,
>  };
>  
> -static u64 pde_encode_cache(struct xe_device *xe, enum xe_cache_level cache)
> +static u64 pde_encode_pat_index(struct xe_device *xe, u16 pat_index)
>  {
> -	u32 pat_index = xe->pat.idx[cache];
>  	u64 pte = 0;
>  
>  	if (pat_index & BIT(0))
> @@ -1205,9 +1204,8 @@ static u64 pde_encode_cache(struct xe_device *xe, enum xe_cache_level cache)
>  	return pte;
>  }
>  
> -static u64 pte_encode_cache(struct xe_device *xe, enum xe_cache_level cache)
> +static u64 pte_encode_pat_index(struct xe_device *xe, u16 pat_index)
>  {
> -	u32 pat_index = xe->pat.idx[cache];
>  	u64 pte = 0;
>  
>  	if (pat_index & BIT(0))
> @@ -1238,27 +1236,27 @@ static u64 pte_encode_ps(u32 pt_level)
>  }
>  
>  static u64 xelp_pde_encode_bo(struct xe_bo *bo, u64 bo_offset,
> -			      const enum xe_cache_level cache)
> +			      const u16 pat_index)
>  {
>  	struct xe_device *xe = xe_bo_device(bo);
>  	u64 pde;
>  
>  	pde = xe_bo_addr(bo, bo_offset, XE_PAGE_SIZE);
>  	pde |= XE_PAGE_PRESENT | XE_PAGE_RW;
> -	pde |= pde_encode_cache(xe, cache);
> +	pde |= pde_encode_pat_index(xe, pat_index);
>  
>  	return pde;
>  }
>  
>  static u64 xelp_pte_encode_bo(struct xe_bo *bo, u64 bo_offset,
> -			      enum xe_cache_level cache, u32 pt_level)
> +			      u16 pat_index, u32 pt_level)
>  {
>  	struct xe_device *xe = xe_bo_device(bo);
>  	u64 pte;
>  
>  	pte = xe_bo_addr(bo, bo_offset, XE_PAGE_SIZE);
>  	pte |= XE_PAGE_PRESENT | XE_PAGE_RW;
> -	pte |= pte_encode_cache(xe, cache);
> +	pte |= pte_encode_pat_index(xe, pat_index);
>  	pte |= pte_encode_ps(pt_level);
>  
>  	if (xe_bo_is_vram(bo) || xe_bo_is_stolen_devmem(bo))
> @@ -1268,7 +1266,7 @@ static u64 xelp_pte_encode_bo(struct xe_bo *bo, u64 bo_offset,
>  }
>  
>  static u64 xelp_pte_encode_vma(u64 pte, struct xe_vma *vma,
> -			       enum xe_cache_level cache, u32 pt_level)
> +			       u16 pat_index, u32 pt_level)
>  {
>  	struct xe_device *xe = xe_vma_vm(vma)->xe;
>  
> @@ -1277,7 +1275,7 @@ static u64 xelp_pte_encode_vma(u64 pte, struct xe_vma *vma,
>  	if (likely(!xe_vma_read_only(vma)))
>  		pte |= XE_PAGE_RW;
>  
> -	pte |= pte_encode_cache(xe, cache);
> +	pte |= pte_encode_pat_index(xe, pat_index);
>  	pte |= pte_encode_ps(pt_level);
>  
>  	if (unlikely(xe_vma_is_null(vma)))
> @@ -1287,7 +1285,7 @@ static u64 xelp_pte_encode_vma(u64 pte, struct xe_vma *vma,
>  }
>  
>  static u64 xelp_pte_encode_addr(struct xe_device *xe, u64 addr,
> -				enum xe_cache_level cache,
> +				u16 pat_index,
>  				u32 pt_level, bool devmem, u64 flags)
>  {
>  	u64 pte;
> @@ -1297,7 +1295,7 @@ static u64 xelp_pte_encode_addr(struct xe_device *xe, u64 addr,
>  
>  	pte = addr;
>  	pte |= XE_PAGE_PRESENT | XE_PAGE_RW;
> -	pte |= pte_encode_cache(xe, cache);
> +	pte |= pte_encode_pat_index(xe, pat_index);
>  	pte |= pte_encode_ps(pt_level);
>  
>  	if (devmem)
> @@ -1701,7 +1699,7 @@ struct xe_vm *xe_vm_lookup(struct xe_file *xef, u32 id)
>  u64 xe_vm_pdp4_descriptor(struct xe_vm *vm, struct xe_tile *tile)
>  {
>  	return vm->pt_ops->pde_encode_bo(vm->pt_root[tile->id]->bo, 0,
> -					 XE_CACHE_WB);
> +					 tile_to_xe(tile)->pat.idx[XE_CACHE_WB]);
>  }
>  
>  static struct dma_fence *
> -- 
> 2.41.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation

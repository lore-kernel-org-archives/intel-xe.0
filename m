Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1522EB64DA
	for <intel-xe@archiver.kernel.org>; Wed, 19 Jul 2023 13:26:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94E8810E100;
	Wed, 19 Jul 2023 13:26:06 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC54510E100
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Jul 2023 13:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689773165; x=1721309165;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ilQuV6D0aeT6NvO8/qi8laa2lhBPDtp0EHwwiS9c1mU=;
 b=aGDYQURXGVQWi52KPQC78hZMR2BoOvOCmDj/gGrAhGkj4eBbIhTrRHpI
 mczNV95MJGGXYYYBW5IXiI1yVXsSYfNpkj9xyHPgFcyKS7Bi/w86Pk612
 pzhHSUXPf723CyBzbT4na9C8E9dbcB7MUizwzqpc+f4sN8Alcix8dwSb7
 P7n+OOl8vqe3iT78R+UBVqsVNe8VB6P4Ec/Mbenbe+nCcVMiYGFs+i3bf
 fsdOlYENvAiMpkML+nL2SyVTVVGxfgmM3DNdsVFMufM6ohGFS/+bRS4ga
 ug1iJ0IWgFPCHguzxRHJrkUWj5Zn/Bp8MM87ZTJmR+6GyVKoBOntXJLzJ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="366504976"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; d="scan'208";a="366504976"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2023 06:26:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="897917459"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; d="scan'208";a="897917459"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga005.jf.intel.com with ESMTP; 19 Jul 2023 06:26:04 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 19 Jul 2023 06:26:04 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 19 Jul 2023 06:26:02 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 19 Jul 2023 06:26:02 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 19 Jul 2023 06:26:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fV+8ROL2WLGIj+18bp9OEeNLces0oi6N5pSEI0mrVIbRY+SnNurELoFYrNcVnkBwPXlpnBz3qjSIkEeLkVp637tGLN4IArLLbyP6oe2/p/fvFBc7i9DDhT0tmWJYtoQqZoBUMqR5N9QjcYkPPHJVfBaNfUNAQLdUzISsBjNSlKzJ2/UiVOffWOHcdJi6xPsghEl6vcG7W1gQ6pkph/4lOdc8ayKl90WSpwvXIyyFOjrZgoocrZlvMlySaJPBUsPGTACBStEJxyr3PyQv+ZWypNM2eHtSDLo+QY+/r3yIVNaEkyTWKhLbkz+UYl+XFw6g//o3hdIpZocFqnguRd5qqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=McfAjTCt2WvdyUq4TnBVYtOvCvPvFoNLl4CgAiKOdf8=;
 b=CMq/Axuvnlbx1EuP9xPgtxDZR1HosIdG/2UmCO48DDMxByzgFMZD9xnfmDLF3zPQi1KL4mbRv25eFVq+/C4/EaKDXbT+B4qR+1KN1Q7mKsIb23asQ6dIlYiJvFMiZH0jPIfiU2zQzeDC0uQ3ih1Uzp3Zz/wL92WTvpSZLAImRHkJD8Am5mAIXkry+ANNYUc54h/WJXIle6AJ+N+8oL0km0bhLJ3arCopMT/KEeh30GXyUy9obot7JeL9rn6TFJuwNgabR1iUOIha7U9QpXsPuqNAUYm5ROFusIzkuWa5c+JJQr7Mbg/msua4v5Lo4098jxP+BI63dYwG58ClS0Vbkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA1PR11MB8350.namprd11.prod.outlook.com (2603:10b6:806:387::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Wed, 19 Jul
 2023 13:26:00 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::3294:2cf2:e022:7164]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::3294:2cf2:e022:7164%7]) with mapi id 15.20.6588.031; Wed, 19 Jul 2023
 13:26:00 +0000
Date: Wed, 19 Jul 2023 10:25:53 -0300
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Message-ID: <p3d6tgrmrgolykkrjxmppvnt2c25osbxlmfvhlmukqkoephhrr@672v7wrcupp6>
References: <20230718193924.3084759-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230718193924.3084759-1-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0P220CA0015.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::19) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA1PR11MB8350:EE_
X-MS-Office365-Filtering-Correlation-Id: 69252890-3dc8-4d10-1dbb-08db885bb15b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KZM/MjvQXfims1qfdy+i4hDjD3KNPTOZ2vDfvs5KtrfkRMiw2ijED7qOm1JaRzgPOB1RkJc31ybNOk436D1yuloCQwzkRALblSVG+GxdlHdkNLtx8/fmURilH+c9Vt38gdqghuCPhqZ73DWq22owrFRcKTlheo1VU4l2QRvtUuj0BeBWvicLeS3Zl95g8ImFiNchrAbmDQVsGvpfYKzpuUc12kBFeU8M30w2JorSxsBdb/aFuLs5RaQRoSS1ojouD2WIalksITyuz9y+9KyfGFbWmfV8M9ZW9U39lUwlO3ChU3nK1R1b8jgAjjNsvBt7pSSX0k2bpeIaMIsTJu/203m1FAuHk8Qui51tDef9BNZtF2GEExNhZYYWfLGqK3VvkieuvC91427dL2Co98XBZ3ZWceWpM3IKUQxXVsfnZ5bU4mXWHYYTLrTdLvz4+0SNZ8NQI5jnjWtBYWf7oLZnFy4hbZSnhgfFDal8OBsEAgMBheqTAJwUmWrUKvlaz0BaOxDH5KUlze2e/YN5SLGc/0+KZSf7mLrpxvJazxSmSRw/B1SPh3Yt89P6QP7yL3bi
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(39860400002)(366004)(136003)(346002)(376002)(396003)(451199021)(86362001)(2906002)(33716001)(6506007)(6512007)(83380400001)(186003)(9686003)(107886003)(26005)(38100700002)(82960400001)(6486002)(6666004)(66556008)(4326008)(66946007)(66476007)(6916009)(478600001)(5660300002)(41300700001)(316002)(8676002)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kfkusgJbzoWPawLxW/3mQyRXmsgQ/2B9AOO6sBCOuemjwCSvMv+ceIt7fDrp?=
 =?us-ascii?Q?QNNVlNxaak1ubeszfjwposz97EdXluRk3PdIva7+q/wMXdNGGW9dwSfgOnBA?=
 =?us-ascii?Q?Mm+YfynaO8khncH2/IQDhN6kz3qyNur8YH55WkNUXDpGixEN35QR3O9Pmi2k?=
 =?us-ascii?Q?S4bJguqJBCptvozp46cLRXvtg81MV0edhxZO7byQjSYGx+vd30N/gYnOIy23?=
 =?us-ascii?Q?3JgsYnmkFyzeGayzUYpcqgJuh53aQzRdKZbetVlO6LwpjIaV6lnS6SC5nwH2?=
 =?us-ascii?Q?MCt5+pci+ZAjsKndpg5SwBGnw2OxQByBqlWu1sceOij3pCj/8dcCeur+wf79?=
 =?us-ascii?Q?V27uRnvoBtOaKjtoeUY/tAM/gXFiNJT4Fm2xn+I6TSjD+hs79RkVbgkwaJb2?=
 =?us-ascii?Q?7Lb1n5Vfp+9yY5UWW/lJYTAhZhBEEJgzmEhhbmjv8XKrWDPD/Lj4lQv+XJKZ?=
 =?us-ascii?Q?DOIZv1WAMx2/f0906P2AyJrTPhRcD9PqPyQl8EvaOg3oy+terhRWLmiSxczS?=
 =?us-ascii?Q?qnPlrj0xkcSU28Fn+PKTu+lbhlTeJXqaG2uOMO6LXPanyjreXZXLfYnogkbv?=
 =?us-ascii?Q?XAWEKql7jvsGTHk7pKke/eEFUR3cS6ZKU8s7d+gAgP5/57P5NY84fXvbVPRD?=
 =?us-ascii?Q?iRl4ozEbGXxVSNqUA2gsJ/Er64mt96/+d8SB5twHFxUaUkZJsmHzpCr179YS?=
 =?us-ascii?Q?QNrRt9nscRh2BuWVw7z3fVs5P01HgPH1Lu3DHElVaMrkBr++8sQUs0t64CWy?=
 =?us-ascii?Q?6E/MB3b/yn/xGzJGZ5MQP7nUXtSA6KqBoAZB+zzxmwMavCcSadz5iD/jYsms?=
 =?us-ascii?Q?DWD3gPgJpIx1kxQSYwnwK9OlhV022/xmERAS/dro5LjdQdGgEOau5pzkpLx2?=
 =?us-ascii?Q?Xiu8To/l4GmnYjd8/7EFfUk5rw5jeOrIxdXCt+JD+K0ItOqiXlE6DSW0U8qL?=
 =?us-ascii?Q?GnHoodg2/tOLGMHt/vEcsOyRgiCL/EHb0T54PfhwI4f9xIdyJt0GYVN6f2Sv?=
 =?us-ascii?Q?K7+6QKj6/O7FcTAXHCflkLbUyhO3Xx69VTKx0boU2///HwliI1n7cuWMJrWj?=
 =?us-ascii?Q?kdFPcHnxGe0S5Q9rzdB6LsdNwCIFqltpurkXi96+kNSEqLwjpDm93THD/2km?=
 =?us-ascii?Q?8laA+Z+wFJqO3qFECHicJ3WRnO57JRq4r63+/p/F0U+ALxhUC+vhS4UrFGwt?=
 =?us-ascii?Q?zz1tsulCRSUJ2LLPCPMxRJi6Ocr6quqxS8+MhdwzU3qhlVUJ8skiCi57w8nX?=
 =?us-ascii?Q?lpH569STFOSIWVtpBumxxYs+AQhbzjlbZEFQmKbqVyD+jQeBSClc2/EO2QFZ?=
 =?us-ascii?Q?Z1VwfNcpPqX/Tyn2GJ1KrwCXHGoLt96gqHZG9HDJtTxnOkXQeLCIWSlKUZdT?=
 =?us-ascii?Q?3wyN5ZI2eyQyUz9YKwmMISc4X7rcKVEDtmZ6x2CKNkGjCezClR6NHBv5alfu?=
 =?us-ascii?Q?yIWH/MIuS/EfoHSdu9aF7L84K2ZvZfUGpu5dGnaHp27W1jiOjhwQq8rCpN5n?=
 =?us-ascii?Q?ObxerPUwNNLwahhCZvjQm6dx3aLirX5q5q55xoPlrlRcbmkojyfzF33t59I8?=
 =?us-ascii?Q?4JYWUsLAjaYnaGaw/GDJXEQHzdgfM/av+dC9vq1iXF2ZyXiejH4/zavzuyab?=
 =?us-ascii?Q?9A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 69252890-3dc8-4d10-1dbb-08db885bb15b
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2023 13:26:00.5371 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S07jTqtCzk3pZBvIXBC6CRHIEuhRsQDWU8GjEc21ueeEI2FstthtYJ2HI607vW/atV4JINh4q+WyHn0Hw8A9s2vuaLw51QllZUIXANNESz0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8350
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe: Normalize XE_VM_FLAG* names
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Thanks Matt and Rodrigo for reviews. Series is pushed.

Lucas De Marchi

On Tue, Jul 18, 2023 at 12:39:23PM -0700, Lucas De Marchi wrote:
>Rename XE_VM_FLAGS_64K to XE_VM_FLAG_64K to follow the other names and
>s/GT/TILE/ that got missed in commit 4e6715bd2a5e ("drm/xe: Move
>migration from GT to tile").
>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>---
> drivers/gpu/drm/xe/tests/xe_migrate.c | 2 +-
> drivers/gpu/drm/xe/xe_migrate.c       | 8 ++++----
> drivers/gpu/drm/xe/xe_pt.c            | 4 ++--
> drivers/gpu/drm/xe/xe_vm.c            | 6 +++---
> drivers/gpu/drm/xe/xe_vm_types.h      | 4 ++--
> 5 files changed, 12 insertions(+), 12 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
>index aedfb3dd559e..30e5fdf6ca63 100644
>--- a/drivers/gpu/drm/xe/tests/xe_migrate.c
>+++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
>@@ -301,7 +301,7 @@ static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test)
> 	xe_map_wr(xe, &bo->vmap, XE_PAGE_SIZE * (NUM_KERNEL_PDE - 1), u64,
> 		  0xdeaddeadbeefbeef);
> 	expected = xe_pte_encode(NULL, pt, 0, XE_CACHE_WB, 0);
>-	if (m->eng->vm->flags & XE_VM_FLAGS_64K)
>+	if (m->eng->vm->flags & XE_VM_FLAG_64K)
> 		expected |= XE_PTE_PS64;
> 	if (xe_bo_is_vram(pt))
> 		xe_res_first(pt->ttm.resource, 0, pt->size, &src_it);
>diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
>index f17de52b51f9..2bb7d524af24 100644
>--- a/drivers/gpu/drm/xe/xe_migrate.c
>+++ b/drivers/gpu/drm/xe/xe_migrate.c
>@@ -201,7 +201,7 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
>
> 		xe_map_wr(xe, &bo->vmap, map_ofs + level * 8, u64, entry);
>
>-		if (vm->flags & XE_VM_FLAGS_64K)
>+		if (vm->flags & XE_VM_FLAG_64K)
> 			i += 16;
> 		else
> 			i += 1;
>@@ -213,7 +213,7 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
> 		/* Write out batch too */
> 		m->batch_base_ofs = NUM_PT_SLOTS * XE_PAGE_SIZE;
> 		for (i = 0; i < batch->size;
>-		     i += vm->flags & XE_VM_FLAGS_64K ? XE_64K_PAGE_SIZE :
>+		     i += vm->flags & XE_VM_FLAG_64K ? XE_64K_PAGE_SIZE :
> 		     XE_PAGE_SIZE) {
> 			entry = xe_pte_encode(NULL, batch, i,
> 					      XE_CACHE_WB, 0);
>@@ -239,7 +239,7 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
> 	for (level = 1; level < num_level; level++) {
> 		u32 flags = 0;
>
>-		if (vm->flags & XE_VM_FLAGS_64K && level == 1)
>+		if (vm->flags & XE_VM_FLAG_64K && level == 1)
> 			flags = XE_PDE_64K;
>
> 		entry = xe_pde_encode(bo, map_ofs + (level - 1) *
>@@ -462,7 +462,7 @@ static void emit_pte(struct xe_migrate *m,
> 			addr = xe_res_dma(cur) & PAGE_MASK;
> 			if (is_vram) {
> 				/* Is this a 64K PTE entry? */
>-				if ((m->eng->vm->flags & XE_VM_FLAGS_64K) &&
>+				if ((m->eng->vm->flags & XE_VM_FLAG_64K) &&
> 				    !(cur_ofs & (16 * 8 - 1))) {
> 					XE_WARN_ON(!IS_ALIGNED(addr, SZ_64K));
> 					addr |= XE_PTE_PS64;
>diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
>index 00855681c0d5..851ea7c01b91 100644
>--- a/drivers/gpu/drm/xe/xe_pt.c
>+++ b/drivers/gpu/drm/xe/xe_pt.c
>@@ -341,7 +341,7 @@ int xe_pt_create_scratch(struct xe_device *xe, struct xe_tile *tile,
> 	 * platforms where 64K pages are needed for VRAM.
> 	 */
> 	flags = XE_BO_CREATE_PINNED_BIT;
>-	if (vm->flags & XE_VM_FLAGS_64K)
>+	if (vm->flags & XE_VM_FLAG_64K)
> 		flags |= XE_BO_CREATE_SYSTEM_BIT;
> 	else
> 		flags |= XE_BO_CREATE_VRAM_IF_DGFX(tile);
>@@ -761,7 +761,7 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
> 		.va_curs_start = xe_vma_start(vma),
> 		.vma = vma,
> 		.wupd.entries = entries,
>-		.needs_64K = (xe_vma_vm(vma)->flags & XE_VM_FLAGS_64K) && is_vram,
>+		.needs_64K = (xe_vma_vm(vma)->flags & XE_VM_FLAG_64K) && is_vram,
> 	};
> 	struct xe_pt *pt = xe_vma_vm(vma)->pt_root[tile->id];
> 	int ret;
>diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>index 91f11dfe9460..97f2c882050b 100644
>--- a/drivers/gpu/drm/xe/xe_vm.c
>+++ b/drivers/gpu/drm/xe/xe_vm.c
>@@ -1244,11 +1244,11 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
> 	drm_gpuva_manager_init(&vm->mgr, "Xe VM", 0, vm->size, 0, 0,
> 			       &gpuva_ops, 0);
> 	if (IS_DGFX(xe) && xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K)
>-		vm->flags |= XE_VM_FLAGS_64K;
>+		vm->flags |= XE_VM_FLAG_64K;
>
> 	for_each_tile(tile, xe, id) {
> 		if (flags & XE_VM_FLAG_MIGRATION &&
>-		    tile->id != XE_VM_FLAG_GT_ID(flags))
>+		    tile->id != XE_VM_FLAG_TILE_ID(flags))
> 			continue;
>
> 		vm->pt_root[id] = xe_pt_create(vm, tile, xe->info.vm_max_level);
>@@ -2128,7 +2128,7 @@ static int xe_vm_prefetch(struct xe_vm *vm, struct xe_vma *vma,
> struct ttm_buffer_object *xe_vm_ttm_bo(struct xe_vm *vm)
> {
> 	int idx = vm->flags & XE_VM_FLAG_MIGRATION ?
>-		XE_VM_FLAG_GT_ID(vm->flags) : 0;
>+		XE_VM_FLAG_TILE_ID(vm->flags) : 0;
>
> 	/* Safe to use index 0 as all BO in the VM share a single dma-resv lock */
> 	return &vm->pt_root[idx]->bo->ttm;
>diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
>index edb3c99a9c81..223b8f84c546 100644
>--- a/drivers/gpu/drm/xe/xe_vm_types.h
>+++ b/drivers/gpu/drm/xe/xe_vm_types.h
>@@ -143,14 +143,14 @@ struct xe_vm {
> 	 * @flags: flags for this VM, statically setup a creation time aside
> 	 * from XE_VM_FLAG_BANNED which requires vm->lock to set / read safely
> 	 */
>-#define XE_VM_FLAGS_64K			BIT(0)
>+#define XE_VM_FLAG_64K			BIT(0)
> #define XE_VM_FLAG_COMPUTE_MODE		BIT(1)
> #define XE_VM_FLAG_ASYNC_BIND_OPS	BIT(2)
> #define XE_VM_FLAG_MIGRATION		BIT(3)
> #define XE_VM_FLAG_SCRATCH_PAGE		BIT(4)
> #define XE_VM_FLAG_FAULT_MODE		BIT(5)
> #define XE_VM_FLAG_BANNED		BIT(6)
>-#define XE_VM_FLAG_GT_ID(flags)		(((flags) >> 7) & 0x3)
>+#define XE_VM_FLAG_TILE_ID(flags)	(((flags) >> 7) & 0x3)
> #define XE_VM_FLAG_SET_TILE_ID(tile)	((tile)->id << 7)
> 	unsigned long flags;
>
>-- 
>2.40.1
>

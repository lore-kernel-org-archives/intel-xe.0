Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52AF5CD37B0
	for <intel-xe@archiver.kernel.org>; Mon, 18 Sep 2023 17:11:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CF5710E26D;
	Mon, 18 Sep 2023 17:11:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8500910E26D
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Sep 2023 17:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695057089; x=1726593089;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=SwqbGmTR+cMeDn6giJHISLmVY71weNUrphj2vgdsJOY=;
 b=J7vePe1Tgd/GudKS57DC61epEQDPWF/G1G5ev79Z4F7ns9uPICROG0hM
 D6d1zD729qM49Mz8xGWfW1vnnhn3lF0yv0hqhaS/DPXgCF4BjRlWIddMK
 J9n/Gk8GV9yd0CDbJuXazvHcmNqwzcF1mhQp46PF1GBykpPYsD+inLpnu
 t8LnsyhorvLD+3tfd9YBLgJN1zkAjR9Zz9VZiCUtc4Mhcs91GgOXx6l4l
 1q9I9uiBaGl6yqmeMzllJr3ztIq+Gg5EkhziqYYdKvDdvfYuuZzF+SQFc
 vSSk80hs5J/nQSUd70gr6+yMWOiGTxwMVklFG6T0GJDrCtxOJgLb2RrY8 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="446179033"
X-IronPort-AV: E=Sophos;i="6.02,157,1688454000"; d="scan'208";a="446179033"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2023 10:11:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="919536330"
X-IronPort-AV: E=Sophos;i="6.02,157,1688454000"; d="scan'208";a="919536330"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Sep 2023 10:11:16 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 18 Sep 2023 10:11:16 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 18 Sep 2023 10:11:15 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 18 Sep 2023 10:11:15 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 18 Sep 2023 10:11:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FuRPc3387ysk9D4J4DghL+c2ekqRDcMs0UnltWWZ47eEdief6T8XCAo8uz8HQgHXGuWc4MkY35tsOAfM4J3QPGcwSn1oZLHRMgdimDWPdf6P43KPhGf7BwfHiaQk6ZMa/UoyDPiVE3wuAxfvSvuamxWP6QKTWWOgbinKOHH/ws5sHiG6S6LNGl7TYIBUQ0GDxnxgX+w7ZLvvuEWYv56W8YIz7OU+1/whk+U70pgxdjCvZBP2Bv2Yqq4R+fqjkiNFyb96n7w7PfIYRy6P8tNubI2tECJb5ftbO6uAPhepiByhz8zc1PSQRVHo50NFL82LFytuUr+Tu+dh3lN8ISFCcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZlntFbK3dFxUXQgI+l7bs//bV90elMRnWlRYMLRhUIM=;
 b=RBWp7UdZgrcBSByLcmbrAKyOWYnxIgTBr4dK0XWVcXgQEoDGJqTr7mdg55KwlUUvUogZz3rX7OxbFaSZxDbwluzv5hi3v8Jm7U30wLLHygo/TvUWYMSWJGtUsRWc52UL6w+Crl2+xeKrk10GnN4w/3DEcA1rlbViNx90BWIl3roc+Lw4On7YbMln5TuNgnSSpMU82jYVuJQptJouWy23bCjSsSao4m0E1mvp3zD78GfCRqAJzGvsEakaFR4jETzc5v+ZWHaIC7Nn/WZo0NaGrEbaxRKU3nx4mPP88BimmJ+1ypat7Fp4HFH0jO5cZE8iS23iuLk5WdH32zrjtrFK5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA1PR11MB6290.namprd11.prod.outlook.com (2603:10b6:208:3e6::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.23; Mon, 18 Sep
 2023 17:11:12 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::cc12:ab15:1d0:af79]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::cc12:ab15:1d0:af79%5]) with mapi id 15.20.6792.021; Mon, 18 Sep 2023
 17:11:12 +0000
Date: Mon, 18 Sep 2023 12:11:10 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <wnophaogmq2o3feqmle6yo74j5dmpqko6lfyvgjyjl62nis4be@2gi2jslmugcf>
References: <20230913231411.291933-8-matthew.d.roper@intel.com>
 <20230913231411.291933-13-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230913231411.291933-13-matthew.d.roper@intel.com>
X-ClientProxiedBy: SJ0PR03CA0257.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::22) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA1PR11MB6290:EE_
X-MS-Office365-Filtering-Correlation-Id: ac65c9ce-5192-4d5b-5162-08dbb86a4268
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RCCrMUKC9uK4ArN+RgDvfYJtD+oaM3yHx+hK9HWltw6bK916ELC0agt2hVREKjmnBbFcCSzCM3CdXLkQdBgyc2RtU3ljRuEZ2OA4hSi6sncUMUGLdrokVZQwy4vHw0FbhTPGxQWFcDDJYcKExwHsROlJ4HicSKUEh8Iohjbceyh+CoLWn8vP8pFyJk+GEXrPeisIiRHk0XfKwWNLItLUj9YT8JQxULiiCT4D6zpYTHSg7419enFA8bcT0lXuXJnlpST/sum7hK+1u3IWg5HGLENfG2zwn4GEfOj0aFDYdkbgcvx9Llr1OiWZxzsqOsz3fQ+ESMu83runehgyRc+tC3BvaCDLUZDPm2VRtD9CsgfofuCt+p7O4W1PWs23CwY1WBOaxejNt4OxkWdNgubFjtutaq4cpXi2Smnl/4mPNVWgEMDMbxddzxMfk6AQ2+NC8R1Db4HqtHvstX2sm0r/Al6ni/oEmhWAa78rtOs0T8sBgR7ZcRbdO4NNobtgKligjS8xok6YEY9Z6zrv9t2DYxZ8nhG0OqCKJVyzY9vq+uP20XNbuw4U8GIPvhGzUkao
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(39860400002)(346002)(376002)(136003)(366004)(396003)(451199024)(186009)(1800799009)(6486002)(5660300002)(6506007)(86362001)(9686003)(316002)(6512007)(66946007)(66556008)(66476007)(41300700001)(38100700002)(478600001)(6636002)(82960400001)(8936002)(8676002)(6862004)(2906002)(33716001)(4326008)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?F2S1TCMnRZl8n+ZvxN/spfZVOS5teObMr2SOaI62UVJZP4u1pVv9004xmi3c?=
 =?us-ascii?Q?0g0EVwOpDCoBu7KfW55m5BrBdzFOp4xnv8hXtPydvoxu4VuHngm4ODdkmcqq?=
 =?us-ascii?Q?9++o6QzQxPXZGhb3xwdYG4c/A4BQGlp6PsFrUxrbETOnw4LA9oSKEnOM4SMu?=
 =?us-ascii?Q?Y8EMs13VgVH9kNoyJT2x7tyd7G2PDhqysahzfZoVDPVbsOnWS9Viz07dfyuy?=
 =?us-ascii?Q?PPzI221762IRSzr/OndWnh3LPVuknmhafc6+foLcwLcOL40IGg0KPPkRikxW?=
 =?us-ascii?Q?n6Q0A5HbeuqdIehA7QsLAanj6skYgVJrYLNPFnxun80MGTTFxp3q6R7YpcI6?=
 =?us-ascii?Q?zCxP1vtqT1Ana04PTWocDnv04TuTZUoMsP9++E9IzlRvW7l2e7XJb/RUTxpU?=
 =?us-ascii?Q?nFyvN7WiVcjXm3yO9sV3khJnS8DsCi9iyL6S3A3FfP7xuLcLv3cFpBG77kzG?=
 =?us-ascii?Q?n1M11Zeh/2PSkVmlco+PxJbCfwE2Z82iNCuoVtsBrWEglZPA6ZjW7Dl9oYf5?=
 =?us-ascii?Q?7Dq6wyYk62AjS1q+LTDprmKY3A4W3AUFhr9l0ToU9bJkx/BOUdfxNSOsDcWB?=
 =?us-ascii?Q?npMGImAhtK0mEFGAIBKm5dUG8d0CGbejFveZwCNakXMTQErZhjNKm/SeuHjs?=
 =?us-ascii?Q?Z+So7aq7LDzv0FPS9i+ASyO83O+dXyeKA8l4yNgOuVqW2hv+aY+Lwn6CE0rt?=
 =?us-ascii?Q?JJ1+DnxG5iAT+877ScMYHrwPL0P7VgwA1NkR8T/kEkWhOgTtsRqkKKUC41hG?=
 =?us-ascii?Q?THv2rBI1evDdzo4XaU1fTHpjz6Hizp/QWCmrLiH0HTUh5dbYx8ZZWN1047ZJ?=
 =?us-ascii?Q?bU2UNk1PdmSE7paYk1IjJRwqYQ5KlEXChqGMM17msQqei+PHo0jFeAgzAFGV?=
 =?us-ascii?Q?gf1Xbjmnpulk2gMD6yggI0CgPu/QEzIBrIrwU7/fn8dQQhRtgWVLPPMgamH0?=
 =?us-ascii?Q?inew6Rry0X8FX9I4+1tbNOBxU8nx2MqcSNhprF+klrf0CitnllxtijttYHsf?=
 =?us-ascii?Q?ecMR2asMkqN9FdaR03g44uSDt3akNYfOpNPiXUDievtuw5qXA22czRCkzYqr?=
 =?us-ascii?Q?bNT0YylFmwIDtL4XsuNUjjDF6cPMa55/2WlqWiYeR8Dh0mMpf2U9szeWpDu2?=
 =?us-ascii?Q?edrnB4od0GxzH9C5JMUmBFivfU5ctPVAQi9aHJfpT92XBGG5HRQbsBOLLq/7?=
 =?us-ascii?Q?tmLTtOl+l2jqTSqAmvVxdP3CFQELF1wcl4H5cpxXt/9P9SRvyRYgJBmLj71y?=
 =?us-ascii?Q?h75X3J81dqOwAZccTFlPbthr/Y1Je+Jg+gmI3EgjLOFwmfUTZJJFVuTLzdfQ?=
 =?us-ascii?Q?TW45IrmJfqI623Iusk2m66pj1tnqc/HDVEpnZ5U09SXX3OuQX9TN4M16unNC?=
 =?us-ascii?Q?pyHCn/meThoDJqcMVebmzWgS5mHnq+Us0uZ/IGZlU4N/6IhcnPAENLhUcWGp?=
 =?us-ascii?Q?SivptjgTRCn4IgmA3sV9zjylc0OE7i26jTS3enimg87FuozRP9a0TxqQG7kB?=
 =?us-ascii?Q?ZUno1SxvLnShSctGm9gmTXnKc7Xkjr+XruOLWBicEhC9dx2QPWJ0WwVMQe65?=
 =?us-ascii?Q?ScuWchZMpVJmm4xXvVMf8X38jMzTJGbvHwq+xB/DENQrZpt74yIHOzMDsero?=
 =?us-ascii?Q?yWeroOecqfm+AuiearQlWGM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ac65c9ce-5192-4d5b-5162-08dbb86a4268
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2023 17:11:12.5135 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 53Krib4/ug29FnxV6skmHvt+KzRJNtjJ4WZSueumKXmrVDM/dLBckGvNWVCQy9AAl3lPq0LHbdKhEazoiTKNP4Z4S6jcIuwPIgXgpzZXWgk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6290
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 5/6] drm/xe/wa: Apply tile workarounds at
 probe/resume
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

On Wed, Sep 13, 2023 at 04:14:17PM -0700, Matt Roper wrote:
>Although the vast majority of workarounds the driver needs to implement
>are either GT-based or display-based, there are occasionally workarounds
>that reside outside those parts of the hardware (i.e., in they target
>registers in the sgunit/soc); we can consider these to be "tile"
>workarounds since there will be instance of these registers per tile.
>The registers in question should only lose their values during a
>function-level reset, so they only need to be applied during probe and
>resume; the registers will not be affected by GT/engine resets.
>
>Tile workarounds are rare (there's only one, 22010954014, that's
>relevant to Xe at the moment) so it's probably not worth updating the
>xe_rtp design to handle tile-level workarounds yet, although we may want
>to consider that in the future if/when more of these show up on future
>platforms.
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

The missing part to make it official as "tile workarounds" is
very small. Maybe worth just adding them here and avoid the todo?
That would be:  have a tile->reg_sr, xe_wa_process_tile() and where
you are calling xe_wa_apply_tile_workarounds(), just call
xe_reg_sr_apply_mmio() with the primary gt.

But up to you if you want to keep it simpler for now.

>---
> drivers/gpu/drm/xe/regs/xe_regs.h  |  3 +++
> drivers/gpu/drm/xe/xe_pm.c         |  5 +++++
> drivers/gpu/drm/xe/xe_tile.c       |  3 +++
> drivers/gpu/drm/xe/xe_wa.c         | 20 ++++++++++++++++++++
> drivers/gpu/drm/xe/xe_wa.h         |  2 ++
> drivers/gpu/drm/xe/xe_wa_oob.rules |  1 +
> 6 files changed, 34 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
>index 39d7b0740bf0..8a93ab169e04 100644
>--- a/drivers/gpu/drm/xe/regs/xe_regs.h
>+++ b/drivers/gpu/drm/xe/regs/xe_regs.h
>@@ -56,6 +56,9 @@
> #define GU_CNTL					XE_REG(0x101010)
> #define   LMEM_INIT				REG_BIT(7)
>
>+#define XEHP_CLOCK_GATE_DIS			XE_REG(0x101014)
>+#define   SGSI_SIDECLK_DIS			REG_BIT(17)
>+
> #define GGC					XE_REG(0x108040)
> #define   GMS_MASK				REG_GENMASK(15, 8)
> #define   GGMS_MASK				REG_GENMASK(7, 6)
>diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
>index 0f06d8304e17..ad3c08c4ff22 100644
>--- a/drivers/gpu/drm/xe/xe_pm.c
>+++ b/drivers/gpu/drm/xe/xe_pm.c
>@@ -20,6 +20,7 @@
> #include "xe_guc.h"
> #include "xe_irq.h"
> #include "xe_pcode.h"
>+#include "xe_wa.h"
>
> /**
>  * DOC: Xe Power Management
>@@ -86,10 +87,14 @@ int xe_pm_suspend(struct xe_device *xe)
>  */
> int xe_pm_resume(struct xe_device *xe)
> {
>+	struct xe_tile *tile;
> 	struct xe_gt *gt;
> 	u8 id;
> 	int err;
>
>+	for_each_tile(tile, xe, id)
>+		xe_wa_apply_tile_workarounds(tile);
>+
> 	for_each_gt(gt, xe, id) {
> 		err = xe_pcode_init(gt);
> 		if (err)
>diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
>index e0bc2b60ab09..131752a57f65 100644
>--- a/drivers/gpu/drm/xe/xe_tile.c
>+++ b/drivers/gpu/drm/xe/xe_tile.c
>@@ -12,6 +12,7 @@
> #include "xe_tile.h"
> #include "xe_tile_sysfs.h"
> #include "xe_ttm_vram_mgr.h"
>+#include "xe_wa.h"
>
> /**
>  * DOC: Multi-tile Design
>@@ -143,6 +144,8 @@ int xe_tile_init_noalloc(struct xe_tile *tile)
> 	if (IS_ERR(tile->mem.kernel_bb_pool))
> 		err = PTR_ERR(tile->mem.kernel_bb_pool);
>
>+	xe_wa_apply_tile_workarounds(tile);

do we need to apply them here considering we will still go through
xe_pm_resume()?

Lucas De Marchi

>+
> 	xe_tile_sysfs_init(tile);
>
> err_mem_access:
>diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
>index f45e9452ba0e..d84e67a9af07 100644
>--- a/drivers/gpu/drm/xe/xe_wa.c
>+++ b/drivers/gpu/drm/xe/xe_wa.c
>@@ -753,3 +753,23 @@ void xe_wa_dump(struct xe_gt *gt, struct drm_printer *p)
> 		if (oob_was[idx].name)
> 			drm_printf_indent(p, 1, "%s\n", oob_was[idx].name);
> }
>+
>+/*
>+ * Apply tile (non-GT, non-display) workarounds.  Think very carefully before
>+ * adding anything to this function; most workarounds should be implemented
>+ * elsewhere.  The programming here is primarily for sgunit/soc workarounds,
>+ * which are relatively rare.  Since the registers these workarounds target are
>+ * outside the GT, they should only need to be applied once at device
>+ * probe/resume; they will not lose their values on any kind of GT or engine
>+ * reset.
>+ *
>+ * TODO:  We may want to move this over to xe_rtp in the future once we have
>+ * enough workarounds to justify the work.
>+ */
>+void xe_wa_apply_tile_workarounds(struct xe_tile *tile)
>+{
>+	struct xe_gt *mmio = tile->primary_gt;
>+
>+	if (XE_WA(mmio, 22010954014))
>+		xe_mmio_rmw32(mmio, XEHP_CLOCK_GATE_DIS, 0, SGSI_SIDECLK_DIS);
>+}
>diff --git a/drivers/gpu/drm/xe/xe_wa.h b/drivers/gpu/drm/xe/xe_wa.h
>index cfe685989524..1b24d66f9d80 100644
>--- a/drivers/gpu/drm/xe/xe_wa.h
>+++ b/drivers/gpu/drm/xe/xe_wa.h
>@@ -9,12 +9,14 @@
> struct drm_printer;
> struct xe_gt;
> struct xe_hw_engine;
>+struct xe_tile;
>
> int xe_wa_init(struct xe_gt *gt);
> void xe_wa_process_oob(struct xe_gt *gt);
> void xe_wa_process_gt(struct xe_gt *gt);
> void xe_wa_process_engine(struct xe_hw_engine *hwe);
> void xe_wa_process_lrc(struct xe_hw_engine *hwe);
>+void xe_wa_apply_tile_workarounds(struct xe_tile *tile);
>
> void xe_reg_whitelist_process_engine(struct xe_hw_engine *hwe);
> void xe_wa_dump(struct xe_gt *gt, struct drm_printer *p);
>diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
>index 599e67169dae..f3ff774dc4aa 100644
>--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
>+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
>@@ -18,3 +18,4 @@
> 14016763929	SUBPLATFORM(DG2, G10)
> 		SUBPLATFORM(DG2, G12)
> 16017236439	PLATFORM(PVC)
>+22010954014	PLATFORM(DG2)
>-- 
>2.41.0
>

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E162C76196
	for <intel-xe@archiver.kernel.org>; Fri, 31 Mar 2023 22:26:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B667810E2AD;
	Fri, 31 Mar 2023 22:26:49 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D66D410E2AD
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Mar 2023 22:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680301607; x=1711837607;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=bvGnp8h+L8aiI+r6WKXYMZqbSpJ0A54B5ql14P0Kjf0=;
 b=h1w3yMVxhzSgKqE4sA8sTXcZfQ6vmOh189t17+j++ShRNOLcuzU15dKT
 AMFJpzViAMyifAGGyGDeZkahbr8jIy1BwGy/9Fyg1ci/SRSosruL1YMYM
 AaP58RGZd3CPBdcXcRiEehl/vL647chwu4JzLn+X7hzvqGS3ERIriHZv5
 Qmn0uuQL5EVh43xiJd6uUOHMVsPEHTXW5mLOGG4u0i2XOClAAEZyd4DIS
 qLYouEMhMCPmYG6UINcChB+GvOn/mHdBEfeqh3OE83dPktcoFUJV8Wk2d
 +qegK77D0dOcrnZFURuMezjc92B96RkMUezmGvqO7Px768tm5/aelshto Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="339065074"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; d="scan'208";a="339065074"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2023 15:26:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="685254450"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; d="scan'208";a="685254450"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga002.jf.intel.com with ESMTP; 31 Mar 2023 15:26:47 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 31 Mar 2023 15:26:46 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 31 Mar 2023 15:26:46 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Fri, 31 Mar 2023 15:26:46 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Fri, 31 Mar 2023 15:26:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EA2sXDr4vNWZEnA1qTaxkzS94+uhB0m2HYYWhuD5JN9Mn0H/gHSoXnhMsugzqAzYGEkU0+Fa9mO48gUxp5blvf13jNjPbQFNbx9b0eU3IPKq8ZvxOVaxUxsQ+qOF5NqRwSDm6SdmxCnVuXboA6JBjz+PfkrMp/HPS7fnsVdgwc3im/pF4A1jlsTbgtCJrgRD7HqW9UzuvjFHH3sIId9iGAb4DAZuxsOi96nXpDmXlQfQiqRP2qL3YqR0Fxiqb25j2aAamk2B7DZTmjM+eQ0muOhxHf0T5mIg/rc68QjSZ9oQcabQCSySiWgGUtF2ThvcrEUgJGEBlsg0h5a9aOy2Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EAEM6Dm9lloI0uDW1dh0Begy0hs9bFm30qTkn4kHYmo=;
 b=fb1TvNyCtx1whxtk7RBOuNqh1RyJvRYE5K3ZKtzsAALxe+21s/a0WiKPa/8UEUEYuLVN7x+lN67wggb5dc99nkVBeTJbGOXVtMrDd5qYd4C9rA4SpxNb08sbdD4spqYCslz4yL0tOcYbT1uuXpHfhZw0yM/WCS8OXcm5AVASlworXDwMAb2+VyASwn/SxdN1hvlE2XyGOD2tAK/Fwa6thVeJ7KH89MvchuZj0K4hbqh2kjEoLL0ZxSXzaMSLpvdB3pO/jhBakLimVGkW8OGbAEPimmR3KLeCSi7Dy6Ki8V4Za8xdx7AAxTq1IGp9FCMNZ/+39lyxldUE3avh/qV23A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB5917.namprd11.prod.outlook.com (2603:10b6:a03:42b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.33; Fri, 31 Mar
 2023 22:26:44 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745%5]) with mapi id 15.20.6254.022; Fri, 31 Mar 2023
 22:26:44 +0000
Date: Fri, 31 Mar 2023 15:26:41 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <20230331222641.h3ik4f266qrx4eut@ldmartin-desk2.lan>
References: <20230330182405.43993-1-matthew.d.roper@intel.com>
 <20230330182405.43993-7-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230330182405.43993-7-matthew.d.roper@intel.com>
X-ClientProxiedBy: SJ0PR05CA0159.namprd05.prod.outlook.com
 (2603:10b6:a03:339::14) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB5917:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c0a10d4-0559-4723-892f-08db323701a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EWKMbzIK+T9k6SRQ8PpNa7jNV8AfD9bj4BOtrEnT4VeGtY9D4+8ep+MTk77f2U/aw1Ly3K2X6JRY5LPFVZb+eNqeAcEUDdyUTh4Xhjlrwsp5Kp3z58I5QkhSr3fMFZh1mq8Lhez8EuHYoC2XW10fpvNQqqwdT8IZPhN959UxCXhkrOmx5GEzb+L5Okfan2HIhFcZiz+b1owc0cE1NTTxP8hu78ES+g11KauovUJftC2XNdDfB4nNH7WaFKTj1Lx3hIiFZN2ee4/nNthVwGHxVRN74unTe/R8BB3ycX4p/vQ6wEoC/GhoIPZf0DMLoZN9r+NZPYLoHSB3nhmlu6vDpNJ+aIldcl2D90AjmTMoYoelidS3WO8Y6KrCG+mWTCUKlwT41OAjd7ttD2HLOH63E+7VlzRQQngDZMETi5MMsu0qPpoxip4R5Fb1uAb646R+JiNUvDwIO02bkLjqe4Hui7JD0pMX8lqPEo03hE3UqwsGlR5oklBkTPFjDapwCHKI5tfKnoxv4UDuVvcY0mUrK5qg8ATeNr3g6J0GAlo4sSK5CTWjZf8n0nzMV1VUAHVQ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(39860400002)(376002)(396003)(346002)(136003)(451199021)(478600001)(66946007)(6666004)(6486002)(1076003)(26005)(6506007)(6512007)(316002)(6636002)(186003)(66556008)(9686003)(83380400001)(66476007)(8676002)(4326008)(2906002)(6862004)(41300700001)(5660300002)(38100700002)(8936002)(82960400001)(36756003)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yADZOhPByy2aPiwxi4ooC9zxyGcBxQj0E8IqNDvDGexR0ldYK/7jGxNs+8G0?=
 =?us-ascii?Q?q307C+0y2UFDiVfgyPB+CctyFDpwhMX82khe2P/EuVFoNPyzH1SrqdLgPzEB?=
 =?us-ascii?Q?gx8kHRbHIWYOiv6Zuvwwsw5dtJkz1XZillhITVlVErkH/pwb5//4ac/4r68o?=
 =?us-ascii?Q?ZYEH9fyHgaBbj74grIiwkHWK0Zf1D6FdjOdFXvK1lSK9X0HZxhloDk1xcUsI?=
 =?us-ascii?Q?Vn0h5DjnU2mbuMNuq0pCv/fGKphn0zkjiwEIGqOHqGSxpKdVilNcfRwjx2pE?=
 =?us-ascii?Q?IeDZ/nmimOBATy+eDLCozAXfJsp/WkZcPa+XUAS87iR95GmQ5W5rbE/59Xpp?=
 =?us-ascii?Q?U7lCy+9zySQ323PkVgGUsncO0ENG/SOzuGOqxn1QpOo3HvQg/wA/zkjRB3Ms?=
 =?us-ascii?Q?jltxD+vRTKllmMLWoDmHAZwW4px4qFxEbjXGGV7oZT+iJW01duZu44ougdja?=
 =?us-ascii?Q?/3z672W1jcfJ1HhYRqWcEr899yOkq38J9E5SSPfDgnTaUdyDoQ1gAryE3zRB?=
 =?us-ascii?Q?wqMiqojQKs/htgYrupmxd9xGwjktGbEyr4T6ATfvHn9pLzCeV3ZOCADh3zHI?=
 =?us-ascii?Q?AKjlAmv52/FtzdtzM/Sw8Ul1+NCI1qFA4ouygV9MDTM3iXtKfWzHeBgiWJpp?=
 =?us-ascii?Q?+VaZAqPZntlthp8tz0HboPzSXf0c+KHa4AgdWO4fXxNqq2/yLmOzfr0AFTrA?=
 =?us-ascii?Q?mXPCwK0Nk8RQj+lBgo4gXtPIEoFoCgfrb202fR5utHUgSB+9hordbFvA1qw7?=
 =?us-ascii?Q?cS8YjsJLnCQ785AXAzigiZdWvkc+VQTSrKGHHou8BooHdYWfsuqnGVisUwEo?=
 =?us-ascii?Q?l1B/Gj6dZHytEUbvnWXMAcKoGQSXCD8/3Waff9ILxKkAcsdGOBscNTd0yzZs?=
 =?us-ascii?Q?Vpulz2gT9jWgXBk8wqoc2bJLDLXr9hwVzac+qnoIgZ7drw2cTn0FfkY6xC31?=
 =?us-ascii?Q?5bZ1GrsIEfNuHVoj0zY7COAYIvTdfusrTSFljGXzG30q4lVgxW++c2YWBbxn?=
 =?us-ascii?Q?caDmUwwHFK8qGxxN4QNN3GpPUre274h6yhu8VKVIX1zJk3QXmaNZlOWPPkgw?=
 =?us-ascii?Q?9kuKkHkJnagNfrNfYt6BQq1IRnmWerZLrAV2ZRJWibUgUq7Qoew2lEr8MnIa?=
 =?us-ascii?Q?JXdtuS7YANQ5pfqRpJIfwNxGZhGdbYPH/zUQUU/wP7o5TA0psZaktH+oo+oK?=
 =?us-ascii?Q?rTgCB2go6iBWjyuswdjsbIentTkoB/p9LjhKvCMrFyC5rxD3BWJaRSze45ix?=
 =?us-ascii?Q?9hP/zd9WsnNEdygWhkXZeBQeq8q3DKBbobg+rU+tcFfTaRMHp00lK03r4ij8?=
 =?us-ascii?Q?4bmgDw9RQQ4hlPnHeAeLJ4uaQhtbPjCIsOrbcgG+oU9rVMDa2mKuI8j865fu?=
 =?us-ascii?Q?NLYyDBHMggynEiXE+EraySk/6pD5XKoyfH8Qz8CBvHNflgKlShnFaHgE7Pgi?=
 =?us-ascii?Q?DfR/V+eQBU+xoR6SZV8xQSe/jwBS5b0xsEQkkIoBdam0lBRPWSyYIt1JXRzu?=
 =?us-ascii?Q?XZCZipyls+aFoYTvL0uadyiBn/sznOFzSIt4/KYWmXrdTKBavGtKeAm5o1uN?=
 =?us-ascii?Q?JF9B/RX7d3fsaj4WswihCveaktAc/q8sV4FCdBuJRIX7NR3B1srYuqV0oJV4?=
 =?us-ascii?Q?lw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c0a10d4-0559-4723-892f-08db323701a7
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2023 22:26:43.8847 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b0I4VW96BXSys7M/vD8sXADmpD7Tl+wncWWUsuH3i3B5lwOKesvNNYxuJ4exORoKT1Qq19OeyAkjj2j2tuNImWg6UcrktM9TShoiaxTk6hE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5917
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 6/8] drm/xe/irq: Drop remaining "gen11_"
 prefix from IRQ functions
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

On Thu, Mar 30, 2023 at 11:24:03AM -0700, Matt Roper wrote:
>The remaining "gen11_*" IRQ functions are common to all platforms
>supported by the Xe driver.  Drop the unnecessary prefix.
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_irq.c | 46 ++++++++++++++++++-------------------
> 1 file changed, 22 insertions(+), 24 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
>index de0c27c0a09c..9fac03b63e7e 100644
>--- a/drivers/gpu/drm/xe/xe_irq.c
>+++ b/drivers/gpu/drm/xe/xe_irq.c
>@@ -84,7 +84,7 @@ static u32 xelp_intr_disable(struct xe_gt *gt)
> }
>
> static u32
>-gen11_gu_misc_irq_ack(struct xe_gt *gt, const u32 master_ctl)
>+gu_misc_irq_ack(struct xe_gt *gt, const u32 master_ctl)
> {
> 	u32 iir;
>
>@@ -105,7 +105,7 @@ static inline void xelp_intr_enable(struct xe_gt *gt, bool stall)
> 		xe_mmio_read32(gt, GFX_MSTR_IRQ.reg);
> }
>
>-static void gen11_gt_irq_postinstall(struct xe_device *xe, struct xe_gt *gt)
>+static void gt_irq_postinstall(struct xe_device *xe, struct xe_gt *gt)
> {
> 	u32 irqs, dmask, smask;
> 	u32 ccs_mask = xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_COMPUTE);
>@@ -172,7 +172,7 @@ static void xelp_irq_postinstall(struct xe_device *xe, struct xe_gt *gt)
> {
> 	/* TODO: PCH */
>
>-	gen11_gt_irq_postinstall(xe, gt);
>+	gt_irq_postinstall(xe, gt);
>
> 	unmask_and_enable(gt, GU_MISC_IRQ_REGS, GU_MISC_GSE);
>
>@@ -180,10 +180,10 @@ static void xelp_irq_postinstall(struct xe_device *xe, struct xe_gt *gt)
> }
>
> static u32
>-gen11_gt_engine_identity(struct xe_device *xe,
>-			 struct xe_gt *gt,
>-			 const unsigned int bank,
>-			 const unsigned int bit)
>+gt_engine_identity(struct xe_device *xe,
>+		   struct xe_gt *gt,
>+		   const unsigned int bank,
>+		   const unsigned int bit)
> {
> 	u32 timeout_ts;
> 	u32 ident;
>@@ -216,7 +216,7 @@ gen11_gt_engine_identity(struct xe_device *xe,
> #define   OTHER_MEDIA_GUC_INSTANCE           16
>
> static void
>-gen11_gt_other_irq_handler(struct xe_gt *gt, const u8 instance, const u16 iir)
>+gt_other_irq_handler(struct xe_gt *gt, const u8 instance, const u16 iir)
> {
> 	if (instance == OTHER_GUC_INSTANCE && !xe_gt_is_media_type(gt))
> 		return xe_guc_irq_handler(&gt->uc.guc, iir);
>@@ -230,9 +230,9 @@ gen11_gt_other_irq_handler(struct xe_gt *gt, const u8 instance, const u16 iir)
> 	}
> }
>
>-static void gen11_gt_irq_handler(struct xe_device *xe, struct xe_gt *gt,
>-				 u32 master_ctl, long unsigned int *intr_dw,
>-				 u32 *identity)
>+static void gt_irq_handler(struct xe_device *xe, struct xe_gt *gt,
>+			   u32 master_ctl, long unsigned int *intr_dw,
>+			   u32 *identity)
> {
> 	unsigned int bank, bit;
> 	u16 instance, intr_vec;
>@@ -249,9 +249,8 @@ static void gen11_gt_irq_handler(struct xe_device *xe, struct xe_gt *gt,
> 			intr_dw[bank] =
> 				xe_mmio_read32(gt, GT_INTR_DW(bank).reg);
> 			for_each_set_bit(bit, intr_dw + bank, 32)
>-				identity[bit] = gen11_gt_engine_identity(xe, gt,
>-									 bank,
>-									 bit);
>+				identity[bit] = gt_engine_identity(xe, gt,
>+								   bank, bit);
> 			xe_mmio_write32(gt, GT_INTR_DW(bank).reg,
> 					intr_dw[bank]);
> 		}
>@@ -262,8 +261,7 @@ static void gen11_gt_irq_handler(struct xe_device *xe, struct xe_gt *gt,
> 			intr_vec = INTR_ENGINE_INTR(identity[bit]);
>
> 			if (class == XE_ENGINE_CLASS_OTHER) {
>-				gen11_gt_other_irq_handler(gt, instance,
>-							   intr_vec);
>+				gt_other_irq_handler(gt, instance, intr_vec);
> 				continue;
> 			}
>
>@@ -296,11 +294,11 @@ static irqreturn_t xelp_irq_handler(int irq, void *arg)
> 		return IRQ_NONE;
> 	}
>
>-	gen11_gt_irq_handler(xe, gt, master_ctl, intr_dw, identity);
>+	gt_irq_handler(xe, gt, master_ctl, intr_dw, identity);
>
> 	xe_display_irq_handler(xe, master_ctl);
>
>-	gu_misc_iir = gen11_gu_misc_irq_ack(gt, master_ctl);
>+	gu_misc_iir = gu_misc_irq_ack(gt, master_ctl);
>
> 	xelp_intr_enable(gt, false);
>
>@@ -338,7 +336,7 @@ static void dg1_intr_enable(struct xe_device *xe, bool stall)
>
> static void dg1_irq_postinstall(struct xe_device *xe, struct xe_gt *gt)
> {
>-	gen11_gt_irq_postinstall(xe, gt);
>+	gt_irq_postinstall(xe, gt);
>
> 	unmask_and_enable(gt, GU_MISC_IRQ_REGS, GU_MISC_GSE);
>
>@@ -388,12 +386,12 @@ static irqreturn_t dg1_irq_handler(int irq, void *arg)
>
> 		if (!xe_gt_is_media_type(gt))
> 			xe_mmio_write32(gt, GFX_MSTR_IRQ.reg, master_ctl);
>-		gen11_gt_irq_handler(xe, gt, master_ctl, intr_dw, identity);
>+		gt_irq_handler(xe, gt, master_ctl, intr_dw, identity);
> 	}
>
> 	xe_display_irq_handler(xe, master_ctl);
>
>-	gu_misc_iir = gen11_gu_misc_irq_ack(gt, master_ctl);
>+	gu_misc_iir = gu_misc_irq_ack(gt, master_ctl);
>
> 	dg1_intr_enable(xe, false);
>
>@@ -402,7 +400,7 @@ static irqreturn_t dg1_irq_handler(int irq, void *arg)
> 	return IRQ_HANDLED;
> }
>
>-static void gen11_gt_irq_reset(struct xe_gt *gt)
>+static void gt_irq_reset(struct xe_gt *gt)
> {
> 	u32 ccs_mask = xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_COMPUTE);
> 	u32 bcs_mask = xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_COPY);
>@@ -448,7 +446,7 @@ static void xelp_irq_reset(struct xe_gt *gt)
> {
> 	xelp_intr_disable(gt);
>
>-	gen11_gt_irq_reset(gt);
>+	gt_irq_reset(gt);
>
> 	mask_and_disable(gt, GU_MISC_IRQ_REGS);
> 	mask_and_disable(gt, PCU_IRQ_REGS);
>@@ -459,7 +457,7 @@ static void dg1_irq_reset(struct xe_gt *gt)
> 	if (gt->info.id == 0)
> 		dg1_intr_disable(gt_to_xe(gt));
>
>-	gen11_gt_irq_reset(gt);
>+	gt_irq_reset(gt);
>
> 	mask_and_disable(gt, GU_MISC_IRQ_REGS);
> 	mask_and_disable(gt, PCU_IRQ_REGS);
>-- 
>2.39.2
>

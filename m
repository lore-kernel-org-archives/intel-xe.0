Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63A79C7EE23
	for <intel-xe@archiver.kernel.org>; Thu, 18 May 2023 18:46:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AD7410E53E;
	Thu, 18 May 2023 18:46:04 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA1FD10E53E
 for <intel-xe@lists.freedesktop.org>; Thu, 18 May 2023 18:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684435562; x=1715971562;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=HOKY3F92G1Hw7XUTDaWlroLYYWebdLuwmvdbH5JDX3Y=;
 b=In7qJT+ZKP/YaYCPwLhEVx2SgOrU3z7Fa8Wi+F2cPCT+iw5oJztLr/kP
 xZkaGK7goFoYVFr9j13J+vyPnV8i4t2WRPTKUrdohTguVdHL50OnQKA7j
 3JNkaYpnfEkHjn//LF995rKb0zVWBGLOkYDRxxU8Wz7q3ZefQz/5dhkf0
 eh+Fp3W/AgygDbPKOoeOj5QRHnRnXljVyu6gfDEttAmVsgIfB8eG4GRoR
 SEedATzrvmQ95sibqEODLVssLtsklOYokAciBzSY5LtosmaQJZREkADTf
 v7srcfQsl2TByRyyFCjF3US9BUGqpQE+5NfUrvAn0SFeuK3WaTvkai7oX Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="354503011"
X-IronPort-AV: E=Sophos;i="6.00,174,1681196400"; d="scan'208";a="354503011"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2023 11:46:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="792074531"
X-IronPort-AV: E=Sophos;i="6.00,174,1681196400"; d="scan'208";a="792074531"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by FMSMGA003.fm.intel.com with ESMTP; 18 May 2023 11:46:00 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 18 May 2023 11:46:00 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 18 May 2023 11:45:59 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 18 May 2023 11:45:59 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 18 May 2023 11:45:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i+4BI0FbsS/OJtlXKMigiI7KIb1Pc+ITGAvSs50F/QUCkdmzxLI6Qc/rtPx9tW7m/eRVIZKBZbRgru1lCJFTe6wRZ74rDSkBqf4f0I3O2MhD6ipHWcWVYVUKwqMFdX86mDRytxyLbevvTxdlOgc6II9ZZbHLdUUsdCNkV610TaLsv2gcXT+CXKTNgXPR1qjYcmPCfwloiLiIE5+V9FMGbW6r8HqPsNL3/e7B/COuaCoNbWpjJP4Sy6fJ6hapBbtXbp/BBi2t94eGmTc4nBbUdZFYzeOwB2VNmR7bdl4Ou74grym3k1hWCFC/nmJPGKUbLwuRtu+U31me34PEPMaFGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kRmXhOSez8fVPgzuaFAByXPU89wsJCKtOfIvqykTtdU=;
 b=UCyIZths91QbYT0rNtpXMWbNGoUoRP5LU66me9KGXQIkCRcbeY57FgyxAUEBeA8AvgDTKDaQLAYqvI55hI6R9gJ55d4AiDKAmTzsGCLw6i2COaNt209Yt2jAp+/XEMkxuV/dj7tgIYOQ4a+0OD63kdz4u0UNLQTDNnt1agxGtbK4genWdUQURF/qfE/F3W9po/B2u3qOT7yr3JLumaBeC5ySRRfokNiEGCk12MHEehHIVJXFqeBwq3KvE8J7viYU/3bqc3hjsBZ/nVVFUX//hlQxwx6UyMKwwOP0dO4uFEbRnldDtIHqoL23D2y+BIUTAN8LJlfXF5pt5af+jMOwuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA1PR11MB8393.namprd11.prod.outlook.com (2603:10b6:806:373::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.17; Thu, 18 May
 2023 18:45:57 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6387.033; Thu, 18 May 2023
 18:45:57 +0000
Date: Thu, 18 May 2023 11:45:55 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <vmwms3vpeopdfdw6jfdpnav5ivrxofxwcefadwodmr7mgix3fr@4ufinycrexso>
References: <20230511034722.1929038-1-matthew.d.roper@intel.com>
 <20230511034722.1929038-20-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230511034722.1929038-20-matthew.d.roper@intel.com>
X-ClientProxiedBy: SJ0PR03CA0125.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::10) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA1PR11MB8393:EE_
X-MS-Office365-Filtering-Correlation-Id: 031d9c2b-1642-484c-4970-08db57d01e31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /1KDvkz9/P4xEbNVMRIdRbf1n19KbYYMUYMiJzbxGJFFW1fvfpg1N33Tzu69Tkpci/uZ5CJ67iDQhPPFW/7HkVAQLgF7QLGig/L+r70a6Vw1/lOYaZYEW09ckmi3U7lG0VXofDbvJWdNi6IZAJFz3/vt/SBU/0aEZRkArlq49lkpPb0G1+a2pqnB6refkBoRkJo6UslSHU0YLhfzij0ANcHWy97M8Rqna2VeNeCkaEal9Zta5KT3ecOZsS47x1K9r7TGEFxVroJ/1+dcfQTOoxmYZ3urBqU1SteKbkcgPQVHdo6/LUp1P24O7mka6eVtrIU6z/iV99d/fF8bSy0U1GiXzxatJABuS9CLRnFLltJjDj2psIBrvrtd1PxFH+Oi5rGQdeo86F+ViLTAS6uQqplemXPXigktiaG1yaGsap6OcS2mMJhxvzCX723ttS6u4c5+gktimBfLaemKCsh+jgot9SkGqNe/gaVguCcjB6tx3PZ9kNemCjIHGQx3C6nbe+eYn8h2HvFUqekKPObsprI6LeScr+q4HiybKABeMZEv+fWd6AZrxuz6mcom143d
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(376002)(346002)(39860400002)(136003)(366004)(396003)(451199021)(6486002)(33716001)(478600001)(38100700002)(82960400001)(9686003)(86362001)(83380400001)(26005)(186003)(6512007)(6506007)(316002)(8936002)(2906002)(41300700001)(8676002)(6862004)(5660300002)(66476007)(66556008)(66946007)(6636002)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rA+8um8XI0chOnk9L3RYllWGsZOjxC6Hnns9XChf+cvjn6DRAfmvBd3IIIS/?=
 =?us-ascii?Q?bt7X22mgO1DRJL3pQCbHQ6o5e1SvhxdmN+6xNaN4qTYpanxyUPAfq4t0wAuh?=
 =?us-ascii?Q?zs0ZbZrg73DDMAZ6ss+DOtEiVFlOj/DBeFi7T1Hua3Ga92qvGfw7BvsLsJzt?=
 =?us-ascii?Q?8xreH863iuqtCrcrczvpK4fhIjBOloYDkyp5yzYZeaO7zZko5Qx3Lja5+Lqu?=
 =?us-ascii?Q?9Fbeab0tjAy3O0ksF0HOHt+VggSpxr7x4THyVC8YXrkRRQwMH5JDyRyCP8zY?=
 =?us-ascii?Q?uS9pgmorwq6Y+y/AneS2gBO8eZgQ3q/CQa7ghrxHBIbmjzKhMUTsD5/wdwbd?=
 =?us-ascii?Q?uEzpvWq/DmNf1WFE6MKz80ZcV9QHRknHtsBBIIPvf4xAueIYEuAMmTmck1MU?=
 =?us-ascii?Q?o9upJ6qpb94PCFXuC8hkScP0955LUPDq8zoMaiiWv3RQ8Tt8/SkawD60TjJI?=
 =?us-ascii?Q?vGyILWq55vN9JIA/MYJNNe7rv3j0/umaJXuwVg9iPGAHuEvl8xiQ7zyXtIYh?=
 =?us-ascii?Q?9gnb3X/n0g7zF21DW14jabOHvSSD+FS+er8omeJfAZG5vn4T8teseBi/h4/e?=
 =?us-ascii?Q?nmFq+8ZhMFnDt+m1PUBJAA/9m20SYgrFYCy4R9KxsCQzaMmwr3OzZR1QCnSg?=
 =?us-ascii?Q?Ftsh8tsCdBc7hB1IHuM3P8+Ndm3hUQAKbCushikaGf210jbRd+cfcKFbB1I4?=
 =?us-ascii?Q?GWUPIBM6eMD+3sjQJ892Lb+Up9CZnRejtPQ6+QhIg7J3HVjar8FBOyhV2wq5?=
 =?us-ascii?Q?HBPVDQ5jIRjG7I2q0NBaLWnaQgDcqRIcfUiP5ngORZsRFgqbahvgjXYEUUeJ?=
 =?us-ascii?Q?1PJP6z4nhc1DXTKn/LPt8n3WC4ccXMEWiOu2or3kCvoSkSqbAa1hbNjXPlln?=
 =?us-ascii?Q?S4nHVGQmE0rh1zfrhtoNPO842POYPVG5uxqc/7SLByouviqFXzWzTcSCEv9y?=
 =?us-ascii?Q?TYVC+nDP614WyI+MCujgL4sk4Pj4PnyGPaBBUPDdgy7B6EGDPN8Xd0yJrFv4?=
 =?us-ascii?Q?5feNjqB/Cn+VAE14CIs4quW/F5D5oPTqrRpx8gApRqlwR7ICu5Kw4Luy3anP?=
 =?us-ascii?Q?rX8od5Jq/VJ/WdFSAJ8o2LUdggkXD+Xppa8RsS1O7AnP3eUHhuBYb6hX8Pis?=
 =?us-ascii?Q?0H3mqKX2F37EpSJRuE/hNLRFWqi6/liMbTd0NbbLOrL/62VtuTa708KEjd+W?=
 =?us-ascii?Q?JSvXs1jSo1v+ZyQE0rSVOvtJzVEtJelXnnF3oRvrNbuXgjKHigWB7/Qsg9aF?=
 =?us-ascii?Q?nEFQD/6UhMMkJ1+Sok8YIH9PcWKAuJMVjQ6Xs67jrfFkq+LU/VglODe79Ygc?=
 =?us-ascii?Q?MZ3NpG2XMZ1y237Z7AINRWtfMJEJU4FSZhKav+BDbAzN3BVy/SfEFu5bcQ2a?=
 =?us-ascii?Q?b2LPGSpZshIqBRU+irqpJI7RGecFqv+1jshLZqw5kIanD69sAufux2F+cZE9?=
 =?us-ascii?Q?2v/ywVq2FyD+EY2a4B+Nqh5rhdf9FZsLjlacxHi03wH8cVW07Pykz67KHh19?=
 =?us-ascii?Q?NoYF/e5OLjZL30zdwPLKZ55kl+VnnnlCn/nI32YZ5h8b/KDBWpCFlGmSoziR?=
 =?us-ascii?Q?h0g0q3B3DBmYYeIL16EQNyx7DN6dGjBgXUrJIIGH1rvUjCC9pVd95w5Phn/1?=
 =?us-ascii?Q?YQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 031d9c2b-1642-484c-4970-08db57d01e31
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2023 18:45:57.6242 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vacLkDyTFgcAiieB86lRxmgqNarWEuX23ErpPKOKfBUZ8swj0DGL0479yO1U2radXp/LeC8XDGxxkrJW+H2aUp394vtqQ9AM1wJrv4HjHl8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8393
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 19/26] drm/xe/irq: Untangle postinstall
 functions
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

On Wed, May 10, 2023 at 08:47:15PM -0700, Matt Roper wrote:
>The callstack for postinstall is a bit muddled with top-level device
>interrupt enablement happening within platform-specific functions called
>from the per-tile xe_gt_irq_postinstall() function.  If we pull
>top-level irq enablement up to xe_irq_postinstall where we'd expect it
>to be, we can eliminate some confusing layers of indirection.
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>---
> drivers/gpu/drm/xe/xe_irq.c | 35 +++++++----------------------------
> 1 file changed, 7 insertions(+), 28 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
>index 2549fd9fb5cd..58745a5add87 100644
>--- a/drivers/gpu/drm/xe/xe_irq.c
>+++ b/drivers/gpu/drm/xe/xe_irq.c
>@@ -122,7 +122,7 @@ static inline void xelp_intr_enable(struct xe_device *xe, bool stall)
> 		xe_mmio_read32(mmio, GFX_MSTR_IRQ);
> }
>
>-static void gt_irq_postinstall(struct xe_tile *tile)
>+void xe_gt_irq_postinstall(struct xe_tile *tile)

should probably squash in HEAD~2 patch adding the call to
xe_irq_postinstall()?

this is also seems to be named wrong:  xe_gt_* receiving as first arg a
xe_tile inside a file named xe_irq.c. Suggestion to rename it to
xe_irq_postinstall_tile().


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>


Lucas De Marchi



> {
> 	struct xe_device *xe = tile_to_xe(tile);
> 	struct xe_gt *mmio = tile->primary_gt;
>@@ -181,15 +181,6 @@ static void gt_irq_postinstall(struct xe_tile *tile)
> 	xe_mmio_write32(mmio, GUC_SG_INTR_MASK,  ~0);
> }
>
>-static void xelp_irq_postinstall(struct xe_device *xe, struct xe_tile *tile)
>-{
>-	/* TODO: PCH */
>-
>-	gt_irq_postinstall(tile);
>-
>-	xelp_intr_enable(xe, true);
>-}
>-
> static u32
> gt_engine_identity(struct xe_device *xe,
> 		   struct xe_gt *mmio,
>@@ -366,14 +357,6 @@ static void dg1_intr_enable(struct xe_device *xe, bool stall)
> 		xe_mmio_read32(mmio, DG1_MSTR_TILE_INTR);
> }
>
>-static void dg1_irq_postinstall(struct xe_device *xe, struct xe_tile *tile)
>-{
>-	gt_irq_postinstall(tile);
>-
>-	if (tile->id == 0)
>-		dg1_intr_enable(xe, true);
>-}
>-
> /*
>  * Top-level interrupt handler for Xe_LP+ and beyond.  These platforms have
>  * a "master tile" interrupt register which must be consulted before the
>@@ -512,16 +495,6 @@ static void xe_irq_reset(struct xe_device *xe)
> 	xe_display_irq_reset(xe);
> }
>
>-void xe_gt_irq_postinstall(struct xe_tile *tile)
>-{
>-	struct xe_device *xe = tile_to_xe(tile);
>-
>-	if (GRAPHICS_VERx100(xe) >= 1210)
>-		dg1_irq_postinstall(xe, tile);
>-	else
>-		xelp_irq_postinstall(xe, tile);
>-}
>-
> static void xe_irq_postinstall(struct xe_device *xe)
> {
> 	struct xe_tile *tile;
>@@ -538,6 +511,12 @@ static void xe_irq_postinstall(struct xe_device *xe)
> 	 */
> 	unmask_and_enable(xe_device_get_root_tile(xe),
> 			  GU_MISC_IRQ_OFFSET, GU_MISC_GSE);
>+
>+	/* Enable top-level interrupts */
>+	if (GRAPHICS_VERx100(xe) >= 1210)
>+		dg1_intr_enable(xe, true);
>+	else
>+		xelp_intr_enable(xe, true);
> }
>
> static irq_handler_t xe_irq_handler(struct xe_device *xe)
>-- 
>2.40.0
>

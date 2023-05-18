Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30460C77B7A
	for <intel-xe@archiver.kernel.org>; Thu, 18 May 2023 19:54:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAB6610E547;
	Thu, 18 May 2023 19:54:42 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC6F410E547
 for <intel-xe@lists.freedesktop.org>; Thu, 18 May 2023 19:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684439679; x=1715975679;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=/p+QFnvvwJdMzpNugmIOaZLCsG8AcoZeJNqif8HpBfE=;
 b=G3CrUCBW5TMtbJmANXRaO8glrF+k17I19C2t5A36b322G2K8dtdHw6la
 lLdJ6WknLH9Yo10v/D4tMogDDemaQc6nOuSk16fTPlL0huPI5oL/bPtAE
 muMAqCeqQ+8i3L11DlN7bD6QBRxZslXTzQ1pzm5IMVrgMruQLvadhtGfV
 pfogpBeQ5scrWmoNgNnTObJV+zp/sBOm+cYo2fAO8y6a26nJuTVv+lqs1
 UzDyK1WlgXhRe6ZmkQUrEVRo9VNXXsxqWdyjfkerAx3wDNS5X26hiJPsh
 4waLGi6vJ8iAWcBGwIGbieZ4F9KYdemP4MfXb9RRal5QPOSs1jkkKK/+b g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="355395783"
X-IronPort-AV: E=Sophos;i="6.00,175,1681196400"; d="scan'208";a="355395783"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2023 12:54:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="846619647"
X-IronPort-AV: E=Sophos;i="6.00,175,1681196400"; d="scan'208";a="846619647"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga001.fm.intel.com with ESMTP; 18 May 2023 12:54:38 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 18 May 2023 12:54:38 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 18 May 2023 12:54:38 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 18 May 2023 12:54:38 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.46) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 18 May 2023 12:54:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RNaTuskmDVqGXk3hi5yrskkF16NMvHYCRM2fvhr5T4F2stTk21UU5sO0V2nVgQKpMezIkpQj0CjzxruipvOIy5VnADJSA0Y9l+6olmb8c0BjAHa+6A3I4uwHCjw2J8iIXWUlfWwEmi4Be1/5dIr2ELZ5A3oOz+JSJsSklgqU/KUupJb+jKuuGAz/o5apsDKs1YYYIR3H13XNMkY5MeAgzOhoSS4Iq+BVapQlc/KgqaGso8ao0sAASpfYXffDVvE8NGTG4rpQkzciZTorbTuEzxFB6ckP7VAomh2Ia3cNxlR67aLvRVx9H/3KklSurLKc9snb+2L6kv6v/e5Akm7iJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FfvPox1dbz80BHV4fTNfEvivrJNK6CF3PyDuYE18slM=;
 b=iwOIykp0Oc9cXrBvUjsAEXGyqw3kAWVI9Ik37UUXojmbOArdeYUCcOpvZfILPfRBe6Kk+3PxQyDF5SU5c0nnHSkMpXJACNYpbGNHPyZlQHKNFZrCpSwBrfBjVAQQley8F8SBsZsLaT2os7r5gcXjL2vXh5oQba/tfHM9NgBvcnobEzAlzHqTjlPHp7zbXGn9sW0qJque4MzD0UA/88lZGKHFD89yhff/VJZBXakWLho4NZ17f93C2/R/FUETM4dm9Rbt7tP6u7SNO3AfZvtCRSzLFM4irXSF3jzNLQunw7v73/08r27hnESt/B7ayY7QFloRQyUcezW1mD+u7AyEVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM6PR11MB4659.namprd11.prod.outlook.com (2603:10b6:5:2a5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.19; Thu, 18 May
 2023 19:54:36 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6387.033; Thu, 18 May 2023
 19:54:36 +0000
Date: Thu, 18 May 2023 12:54:33 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <yiasikdmypoawqzixjxym24brca7qzbbqrccfar24t3rnbri3k@pktivem3eenn>
References: <20230511034722.1929038-1-matthew.d.roper@intel.com>
 <20230511034722.1929038-21-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230511034722.1929038-21-matthew.d.roper@intel.com>
X-ClientProxiedBy: SJ0PR13CA0029.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::34) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM6PR11MB4659:EE_
X-MS-Office365-Filtering-Correlation-Id: 05274394-d790-485c-e639-08db57d9b4d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LoGELhrvHb9pFlrBELshtbLDZ/SKFN7Hy1/uz2lZ+MqxzYbGdbWbLlZ3C7Jkt05AVWKro2o6SdYpQCfgr0ZiTI3pNtSKwEO12eZ7eTZHL78GD+QnhS0D5Lsv+rEoT0zKWLL5OlkEUPoeZAyCk7f8gbz415Tg4iKiLAGOq0DV2kUXkwEbcp33AUHkinBFP1sgiFZW3UgfRlXmsuOont4n+Y5Md9wS2ScmfmZyWpPcwcKxeXhi4nHnXTBRNmiYffWwxraQJn6VUJB3ih8ep2u7MrSzuGWNqmLsELmpAJNDF/qrzEgQOpJ74+3KvdH8tuBoVUCZYsaxUoh3K4hSdAi2vxfGj4AWoUyBps4zU/zpyzpBxOK4Wdo/HwrqRqsXBslM9WCqQPbrKx8Mxmf8WlkFMfJEU6n9/qSY3GNhuLmvqwaFEl+O2GXe+CuiJgXTWzoItpv2COvGrMCAY2dsPBo7lQzek8AEOIFlT1vzvzOIymmKnAMZbDUCrm8jiee18ABip+tl0IQZbicZk+LS47E1cHxSIcjV+NeFfAK07M2Hi6ATcwiulogi4VELyvrGdg3K
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(376002)(346002)(136003)(39860400002)(366004)(396003)(451199021)(26005)(6512007)(9686003)(6506007)(83380400001)(86362001)(38100700002)(82960400001)(186003)(33716001)(6486002)(5660300002)(478600001)(2906002)(316002)(6862004)(4326008)(8676002)(6636002)(8936002)(41300700001)(66476007)(66556008)(66946007)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eMGDu6qKX7XFmwC2sRUZBuXXmelgenj6r419wzA3JlHWN9fowtFU01n81gBt?=
 =?us-ascii?Q?OGV0JG2Umt/oUchU0o98hQI1K9KA9224LOqwvLWvbYL3xNMIjvBXqwDHHoC+?=
 =?us-ascii?Q?RQeGuRfFT26LvEKUA6AcUgqm7pcIFf0f0pxADuK7yjWEu/T31U7icifKhKhn?=
 =?us-ascii?Q?DNibwwI072eAYXfjqfJ0oQbuXR5W5RQPraoXxLGKmtpbOzosmGuoh4jvUX+6?=
 =?us-ascii?Q?ifiIi6Mzbrvjilv/aTzAskF+1XyOu4vDo4v2tO39nNvQ7nvkLMRKI8o889wc?=
 =?us-ascii?Q?k347PXm/2ldjYC3CmE/DW85Jid8vUY3L2i39CP3BBRoz4dRpeQXZxnHZDTjx?=
 =?us-ascii?Q?l4YsqkxLQkiAbUbbpygTm7UBzw6cpckqaxkkpmLPTrkeRcK1WgM/HZUQ9ZWD?=
 =?us-ascii?Q?meAOxtBs1Kwm6BXblVLCFJkxOmqwoUCEW5+0ieaoRoQyEGTbYJBlv8Dek86Z?=
 =?us-ascii?Q?xM6zRFlyRnIEojfM3Czu9TS3e5+Ije04sMxoRl5eq8Vbe9nTnRbP4n1IJ6GC?=
 =?us-ascii?Q?VL1iKiJ/LQ2Fv5d38gYz64aAgXxHlcCepK1bflHBD8tP88MGaXCX2wFW13pd?=
 =?us-ascii?Q?vqlf1BeErkUk08SpGy4nsUQxC/+A+pmpse2Yp7cFh5WS430ccxsO5UI12xe8?=
 =?us-ascii?Q?uDGZ2OP8M8cMahdvYTaTawOlbB2TSO6J9K6Wc5XI25YBPeuC7GiTQbJNehQO?=
 =?us-ascii?Q?VJ/u3Qw4qHneE2Yu/tyegR36x8TuAzHoGjmQqrxYmj86zjNhfv1Rg99xr9IC?=
 =?us-ascii?Q?SDrWiHAlIBonq19++wzxtbbd6maW2xiUZu4TecXFJeCMV5Z49o3dzu9PmGkf?=
 =?us-ascii?Q?12BpLz9xCUj21UB1UU6qgvPMcRNJBO8oTPm4bpDFlODkn7RMQc0ptH3kp9G8?=
 =?us-ascii?Q?Rtx1r75ug1GuzQKbP44A8pMnSBkOJJ+H5Cmw/HK0PcgnGnSuBnWD3PgoMPlg?=
 =?us-ascii?Q?idl0n5l75XUwhrQrKl81/wsOtOkvBaQ4o6yzj8JKqqduhxAIdYjoWTY1p8Vw?=
 =?us-ascii?Q?BhZamBxH/8CTrgDcsVjZmIcJbuyJbJYAVgmZE80wXA//e3iXTBC56F1ZDFvO?=
 =?us-ascii?Q?UqvZrZ9ZG4lhoBzg2leKrZTwS5gXaiq8p0BRGnhfwwWX14O3KGNyefb2qBEL?=
 =?us-ascii?Q?5DP587wY4qnJfdQMPoArrPCxcgxLxTHyzyd7zXKyx1CTf8LW5hxCuO+m86i6?=
 =?us-ascii?Q?rFmCfVwILIlc54dDbITeYb8VKeKP2Aljckb9Vm9AnAddY47WmFsD0hWtiX4a?=
 =?us-ascii?Q?PePPf9qj20fATf2kDm/Wi2CBondCaF7D1JuK6TuO7jnaZ56GUa7WWfDFBTJa?=
 =?us-ascii?Q?ExCXp3omuq29hwtqfngvPRn40Ru4fjvHmH/Exs8jrstfGt4i0qbv8SYe/8Kh?=
 =?us-ascii?Q?Fyx07NBLjafIpU6Z1DbUWovN6w8/pZmarxsfENQJbekIA8NvOEK9keuG5sj8?=
 =?us-ascii?Q?mpX/6sbQ+ld0fxYKQwvJqz3CLUouFhftKrech8EXFqciE6fzRQOqRb4+c0R4?=
 =?us-ascii?Q?kRxUkZwQGkK0FkqXDsQXwWJ9fAW8yZs0VdnSLXNluiR1PatSg0/BZHHr4PJC?=
 =?us-ascii?Q?912GPO+fXIZwUqyp6xUtAv+d+NA2dg8MBkAdmVk1Xyppxe7WcuSUHF43dkrp?=
 =?us-ascii?Q?Uw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 05274394-d790-485c-e639-08db57d9b4d6
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2023 19:54:35.8368 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v4rr3UB5Y3M1H3HULTdQHjxzoO9B8x1YtT+t6sr4Ryd+M55t8DYCO1MZIW2obJkoz/7pU05LJ2WSbtejMASCXl+TcNEJNxrLjSkwG7E0ElY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4659
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 20/26] drm/xe: Replace xe_gt_irq_postinstall
 with xe_irq_enable_hwe
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

On Wed, May 10, 2023 at 08:47:16PM -0700, Matt Roper wrote:
>The majority of xe_gt_irq_postinstall() is really focused on the
>hardware engine interrupts; other GT-related interrupts such as the GuC
>are enabled/disabled independently.  Renaming the function and making it
>truly GT-specific will make it more clear what the intended focus is.
>
>Disabling/masking of other interrupts (such as GuC interrupts) is
>unnecessary since that has already happened during the irq_reset stage,
>and doing so will become harmful once the media GT is re-enabled since
>calls to xe_gt_irq_postinstall during media GT initialization would
>incorrectly disable the primary GT's GuC interrupts.
>
>Also, since this function is called from gt_fw_domain_init(), it's not
>necessary to also call it earlier during xe_irq_postinstall; just
>xe_irq_resume to handle runtime resume should be sufficient.
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>---
> drivers/gpu/drm/xe/xe_gt.c        |  2 +-
> drivers/gpu/drm/xe/xe_hw_engine.c |  1 +
> drivers/gpu/drm/xe/xe_irq.c       | 91 ++++++++++++++++---------------
> drivers/gpu/drm/xe/xe_irq.h       |  3 +-
> 4 files changed, 50 insertions(+), 47 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>index e00d260dff00..2a3457fb97fa 100644
>--- a/drivers/gpu/drm/xe/xe_gt.c
>+++ b/drivers/gpu/drm/xe/xe_gt.c
>@@ -303,7 +303,7 @@ static int gt_fw_domain_init(struct xe_gt *gt)
> 	gt->info.engine_mask = gt->info.__engine_mask;
>
> 	/* Enables per hw engine IRQs */
>-	xe_gt_irq_postinstall(gt_to_tile(gt));
>+	xe_irq_enable_hwe(gt);

ok, this clears up my concern on previous patch, so you can ignore my
comment there. While at it, s/Enables/Enable/ to follow the style.



>
> 	/* Rerun MCR init as we now have hw engine list */
> 	xe_gt_mcr_init(gt);
>diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
>index fe8af54ea8bd..5188ee268b30 100644
>--- a/drivers/gpu/drm/xe/xe_hw_engine.c
>+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
>@@ -17,6 +17,7 @@
> #include "xe_gt.h"
> #include "xe_gt_topology.h"
> #include "xe_hw_fence.h"
>+#include "xe_irq.h"
> #include "xe_lrc.h"
> #include "xe_macros.h"
> #include "xe_mmio.h"
>diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
>index 58745a5add87..12919ef68cff 100644
>--- a/drivers/gpu/drm/xe/xe_irq.c
>+++ b/drivers/gpu/drm/xe/xe_irq.c
>@@ -122,13 +122,14 @@ static inline void xelp_intr_enable(struct xe_device *xe, bool stall)
> 		xe_mmio_read32(mmio, GFX_MSTR_IRQ);
> }
>
>-void xe_gt_irq_postinstall(struct xe_tile *tile)
>+/* Enable/unmask the HWE interrupts for a specific GT's engines. */
>+void xe_irq_enable_hwe(struct xe_gt *gt)
> {
>-	struct xe_device *xe = tile_to_xe(tile);
>-	struct xe_gt *mmio = tile->primary_gt;
>+	struct xe_device *xe = gt_to_xe(gt);
>+	u32 ccs_mask, bcs_mask;
> 	u32 irqs, dmask, smask;
>-	u32 ccs_mask = xe_hw_engine_mask_per_class(tile->primary_gt, XE_ENGINE_CLASS_COMPUTE);
>-	u32 bcs_mask = xe_hw_engine_mask_per_class(tile->primary_gt, XE_ENGINE_CLASS_COPY);
>+	if (!gt)
>+		return;

I don't follow why this is needed... It seems all the callers have
already used gt or we are looping through the gt's with for_each_gt()
which already does the check.


>
> 	if (xe_device_guc_submission_enabled(xe)) {
> 		irqs = GT_RENDER_USER_INTERRUPT |
>@@ -140,45 +141,44 @@ void xe_gt_irq_postinstall(struct xe_tile *tile)
> 		       GT_WAIT_SEMAPHORE_INTERRUPT;
> 	}
>
>+	ccs_mask = xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_COMPUTE);
>+	bcs_mask = xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_COPY);
>+
> 	dmask = irqs << 16 | irqs;
> 	smask = irqs << 16;
>
>-	/* Enable RCS, BCS, VCS and VECS class interrupts. */
>-	xe_mmio_write32(mmio, RENDER_COPY_INTR_ENABLE, dmask);
>-	xe_mmio_write32(mmio, VCS_VECS_INTR_ENABLE, dmask);
>-	if (ccs_mask)
>-		xe_mmio_write32(mmio, CCS_RSVD_INTR_ENABLE, smask);
>+	if (!xe_gt_is_media_type(gt)) {
>+		/* Enable classes */

classes?

also, from the look at this function it seems media should be in a
complete different function?

Lucas De Marchi

>+		xe_mmio_write32(gt, RENDER_COPY_INTR_ENABLE, dmask);
>+		if (ccs_mask)
>+			xe_mmio_write32(gt, CCS_RSVD_INTR_ENABLE, smask);
>+
>+		/* Unmask instances */
>+		xe_mmio_write32(gt, RCS0_RSVD_INTR_MASK, ~smask);
>+		xe_mmio_write32(gt, BCS_RSVD_INTR_MASK, ~smask);
>+		if (bcs_mask & (BIT(1)|BIT(2)))
>+			xe_mmio_write32(gt, XEHPC_BCS1_BCS2_INTR_MASK, ~dmask);
>+		if (bcs_mask & (BIT(3)|BIT(4)))
>+			xe_mmio_write32(gt, XEHPC_BCS3_BCS4_INTR_MASK, ~dmask);
>+		if (bcs_mask & (BIT(5)|BIT(6)))
>+			xe_mmio_write32(gt, XEHPC_BCS5_BCS6_INTR_MASK, ~dmask);
>+		if (bcs_mask & (BIT(7)|BIT(8)))
>+			xe_mmio_write32(gt, XEHPC_BCS7_BCS8_INTR_MASK, ~dmask);
>+		if (ccs_mask & (BIT(0)|BIT(1)))
>+			xe_mmio_write32(gt, CCS0_CCS1_INTR_MASK, ~dmask);
>+		if (ccs_mask & (BIT(2)|BIT(3)))
>+			xe_mmio_write32(gt,  CCS2_CCS3_INTR_MASK, ~dmask);
>+	}
>
>-	/* Unmask irqs on RCS, BCS, VCS and VECS engines. */
>-	xe_mmio_write32(mmio, RCS0_RSVD_INTR_MASK, ~smask);
>-	xe_mmio_write32(mmio, BCS_RSVD_INTR_MASK, ~smask);
>-	if (bcs_mask & (BIT(1)|BIT(2)))
>-		xe_mmio_write32(mmio, XEHPC_BCS1_BCS2_INTR_MASK, ~dmask);
>-	if (bcs_mask & (BIT(3)|BIT(4)))
>-		xe_mmio_write32(mmio, XEHPC_BCS3_BCS4_INTR_MASK, ~dmask);
>-	if (bcs_mask & (BIT(5)|BIT(6)))
>-		xe_mmio_write32(mmio, XEHPC_BCS5_BCS6_INTR_MASK, ~dmask);
>-	if (bcs_mask & (BIT(7)|BIT(8)))
>-		xe_mmio_write32(mmio, XEHPC_BCS7_BCS8_INTR_MASK, ~dmask);
>-	xe_mmio_write32(mmio, VCS0_VCS1_INTR_MASK, ~dmask);
>-	xe_mmio_write32(mmio, VCS2_VCS3_INTR_MASK, ~dmask);
>-	xe_mmio_write32(mmio, VECS0_VECS1_INTR_MASK, ~dmask);
>-	if (ccs_mask & (BIT(0)|BIT(1)))
>-		xe_mmio_write32(mmio, CCS0_CCS1_INTR_MASK, ~dmask);
>-	if (ccs_mask & (BIT(2)|BIT(3)))
>-		xe_mmio_write32(mmio,  CCS2_CCS3_INTR_MASK, ~dmask);
>+	if (xe_gt_is_media_type(gt) || MEDIA_VER(xe) < 13) {
>+		/* Enable classes */
>+		xe_mmio_write32(gt, VCS_VECS_INTR_ENABLE, dmask);
>
>-	/*
>-	 * RPS interrupts will get enabled/disabled on demand when RPS itself
>-	 * is enabled/disabled.
>-	 */
>-	/* TODO: gt->pm_ier, gt->pm_imr */
>-	xe_mmio_write32(mmio, GPM_WGBOXPERF_INTR_ENABLE, 0);
>-	xe_mmio_write32(mmio, GPM_WGBOXPERF_INTR_MASK,  ~0);
>-
>-	/* Same thing for GuC interrupts */
>-	xe_mmio_write32(mmio, GUC_SG_INTR_ENABLE, 0);
>-	xe_mmio_write32(mmio, GUC_SG_INTR_MASK,  ~0);
>+		/* Unmask instances */
>+		xe_mmio_write32(gt, VCS0_VCS1_INTR_MASK, ~dmask);
>+		xe_mmio_write32(gt, VCS2_VCS3_INTR_MASK, ~dmask);
>+		xe_mmio_write32(gt, VECS0_VECS1_INTR_MASK, ~dmask);
>+	}
> }
>
> static u32
>@@ -497,12 +497,6 @@ static void xe_irq_reset(struct xe_device *xe)
>
> static void xe_irq_postinstall(struct xe_device *xe)
> {
>-	struct xe_tile *tile;
>-	u8 id;
>-
>-	for_each_tile(tile, xe, id)
>-		xe_gt_irq_postinstall(tile);
>-
> 	xe_display_irq_postinstall(xe, xe_primary_mmio_gt(xe));
>
> 	/*
>@@ -591,9 +585,16 @@ void xe_irq_suspend(struct xe_device *xe)
>
> void xe_irq_resume(struct xe_device *xe)
> {
>+	struct xe_gt *gt;
>+	int id;
>+
> 	spin_lock_irq(&xe->irq.lock);
> 	xe->irq.enabled = true;
> 	xe_irq_reset(xe);
> 	xe_irq_postinstall(xe);
>+
>+	for_each_gt(gt, xe, id)
>+		xe_irq_enable_hwe(gt);
>+
> 	spin_unlock_irq(&xe->irq.lock);
> }
>diff --git a/drivers/gpu/drm/xe/xe_irq.h b/drivers/gpu/drm/xe/xe_irq.h
>index 69113c21e1cd..bc42bc90d967 100644
>--- a/drivers/gpu/drm/xe/xe_irq.h
>+++ b/drivers/gpu/drm/xe/xe_irq.h
>@@ -8,11 +8,12 @@
>
> struct xe_device;
> struct xe_tile;
>+struct xe_gt;
>
> int xe_irq_install(struct xe_device *xe);
>-void xe_gt_irq_postinstall(struct xe_tile *tile);
> void xe_irq_shutdown(struct xe_device *xe);
> void xe_irq_suspend(struct xe_device *xe);
> void xe_irq_resume(struct xe_device *xe);
>+void xe_irq_enable_hwe(struct xe_gt *gt);
>
> #endif
>-- 
>2.40.0
>

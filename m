Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C35CBC77B73
	for <intel-xe@archiver.kernel.org>; Mon,  5 Jun 2023 17:13:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D89910E300;
	Mon,  5 Jun 2023 17:13:17 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DE5E10E300
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Jun 2023 17:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685985196; x=1717521196;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=eXAgzudIX4jdFxgujmMaqTDvnbsD+7cq0l9K4/wZdf8=;
 b=c3pNhj1iF+w5kiqDXDlOr/zzi3tNEEKJsQS1jAl//PMDc6TfpN4su2Uq
 6tBiJif9+OebQHLgv1XU37YhSFaWWAhHZt2MQwq0+io/UuzAyDSfXEUS0
 Imn2oWLc0JYgv0qKFk0AQcFsvAznUIN3crc9u6Tg/ddZQHSB+VaMO8hrB
 ND4glhscoSfUvLSSllmB0U4b9qJErEmXW9h8nOADuh3CO1vUz1kws6KzE
 viFb1uuIrSJ2fqj8rT/1Zu8OqGXNrY5AWcYy93wT62eoyezKzZ8YdS+39
 aK9OXGpy/z3sQMW7tyekZzgxwaF8RT910LlXs6RKaTPgF8NG9R9VSaOn4 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="346020364"
X-IronPort-AV: E=Sophos;i="6.00,218,1681196400"; d="scan'208";a="346020364"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2023 10:13:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="738431740"
X-IronPort-AV: E=Sophos;i="6.00,218,1681196400"; d="scan'208";a="738431740"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga008.jf.intel.com with ESMTP; 05 Jun 2023 10:13:12 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 5 Jun 2023 10:13:12 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 5 Jun 2023 10:13:12 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 5 Jun 2023 10:13:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=abBuMa3S2jRTsr2ehyFQMzs7ehNyWh+Ur/dmK04gFU182rs464G8MBOHreRMQqN7eqCJJZcpceJ023H7KNoIgN1HP2PI4GuCxhZ99D6bxfsubAXra8fSXyinmpTzcRS9jfF1fityB0xelaNEfY48pa85sUcfjwD4fyOGWziCQJp/7ufn73+yNPBnmnWVJQb3W6wdnBROE4BFzbKti+w7xzmTlhD4cvubYCkaQelhHsnkTUcMMVHeV2dUDbi8wnKcVoje13NTeg/5i815meNU7CJdOusqeOrk0QZ6dAbfbbYoiKFCwMOQqFytu0dwsOCvarlQVyqfh66HQPrU7tnlTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4AcQTDXWV3LTXP1sSJdWw8iW1gdSs7mO7As3GxEon5c=;
 b=T1K5wQwblYwAevnDgSThNr9O3RAterczeRipBzOqcxc8HMDVJ2TDoRghWMt4Cxr2NvAsrkZRTAJtrTZWeVk7I7Til8FiMV7PYOWGTYNhUBwiMlvvKLMAPfiAFdfCdObTsZYyvKc0KpnhoSyuAtJSwCoAEfCvGT4I17WjfgtphuoiCWkyfHt6l4KZMj7l5n2u618Zufl9Ansd6x8MUmDKQgzB1M2fs5Kv/DVex/f9TS64shXRRieqdBQ4oL4EsuNKYvmEFf69dt1U3egYzQgWRcb+atC6pFQLOTa3kdvRdHIpcqjVTLw7fIQnNrMZks88QXiM1vzDjpd7V70x5C5Nuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW4PR11MB7005.namprd11.prod.outlook.com (2603:10b6:303:22e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Mon, 5 Jun
 2023 17:13:09 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%5]) with mapi id 15.20.6455.030; Mon, 5 Jun 2023
 17:13:09 +0000
Date: Mon, 5 Jun 2023 17:11:53 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <ZH4XWaJfuQbOHx0R@DUT025-TGLU.fm.intel.com>
References: <20230602235210.1314028-1-matthew.d.roper@intel.com>
 <20230602235210.1314028-3-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230602235210.1314028-3-matthew.d.roper@intel.com>
X-ClientProxiedBy: SJ0PR13CA0142.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::27) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW4PR11MB7005:EE_
X-MS-Office365-Filtering-Correlation-Id: ed2f0734-89df-4887-1f73-08db65e8229e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8y5pQYdF6Hno8J7OyKDAhUT1xQyl/u9o7rDOxVoE4g78GsJ54WA4XdalW29A14ck5k/eAgoMfKHzvERMrQFTwjweTNJEbTSza7/t7klHKXol3y8bqTSKRwwpI7diQ0YtlgBYm4tqQp2e+TV/UIg8lluVZUOVfzpW1ea6T5cqLxLhdGU4Yx+gD7jRHccgngaO75fNOupmJvlg3vPb1ybSElNjo5En3XgFjum0bCE3uOxAIjdUbvUVg2wemP27nxEsw2vG/1VB6sIxI8mtbjEX0CGVJBgCG9NezYH6tW1u4Eb8DFkOCqFlY+wVKo2Q4MNE8xP7+yByi2fBXin/c57s9tLVzcXcKPZcpTa5jCX0mCouzsVxrrIYXob/gJD2XuTCGtn5zzffK0U75DFh8YqzeUARs768HMBwHrRe7+KOcSmeUbX20C1Q4Zwrjkfa+879aQ4Jxs8RwNlv9i6pMk3w7A7558EGmHjS09We3R+J2j832LPnP5YIElrnEZikTe4/eXwXy1VXhiAcbSCZfwzXKAbqYFE343luC8NdgdN6GlkjAlcE2EZ4otBpSHZCl/dH
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(376002)(346002)(396003)(136003)(366004)(451199021)(6512007)(6506007)(38100700002)(41300700001)(6486002)(6666004)(186003)(26005)(83380400001)(478600001)(4326008)(66476007)(66556008)(6636002)(82960400001)(316002)(66946007)(8676002)(5660300002)(6862004)(8936002)(44832011)(2906002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IPWDqZFxAP9l2Ok48NuEI8kURSfZXXR4zshiY2KQcVYPTGQMtghIF6yocxu3?=
 =?us-ascii?Q?l5WBKwpDp6YFYHUmk2E/gCVnOZZ1qWOu7dfYxsvm9XIngEl6MI74DMZ18yBm?=
 =?us-ascii?Q?zX97cPVkHPgnhoqoU8imT6KCWL/F0tb1tsB75kym2JKsuBPPFVJ5Ob88NzHC?=
 =?us-ascii?Q?avJs4dE5etNA+cVp3NtztaCyBY9nNtxBh+xDIWZXkkVF0jEj0U50FNhuRKos?=
 =?us-ascii?Q?mJFC9jKOUg/maGXGVSd9GCLIwHXYXcKTIEF2AHld/a8IxhT8gbWs/e3GjC5q?=
 =?us-ascii?Q?XwFl7GwW8bqDldBZRj4fCGgLesIUc/BgFTL6SNcsWg4MfwXz99tpo89e3aPO?=
 =?us-ascii?Q?rJYJ+25U+EKE3n3xaP2ZLIIxeq1Jmn8WJ7Zo9gbHZ4RqRmmTF2p8/j+IgfAD?=
 =?us-ascii?Q?znbIUeUOqzIi6rjYEQEDN8yEp0buEEO73JyCP2VRBfpHsFCJ7ovYqgq853M1?=
 =?us-ascii?Q?5Xi4qqU3rai5LAPYR49mblgLj7YicgPQan3DgnGaFvtmivS44hJwOI9xZP5T?=
 =?us-ascii?Q?OtgYSwITzoA13P0IDPWZY0OQnvWvwRQeCL+505wwgXq0sB5sIkTbTFlJBU3I?=
 =?us-ascii?Q?bh4HtS+2fof/479UXxD7dp2MluXVTNArPlEX/13JtlAPiOU4Gq5rwSXcVPNQ?=
 =?us-ascii?Q?YEcxd/g2qFipx7l5sF3FMth/ySljIwRhyOsHnHyScjkFixNkpj41In1pG4zl?=
 =?us-ascii?Q?J5tZF/FPbB26b8/aIp5SoxQhIIZxxG8wLe3zBCMBZq6raHjpLfTOtJLZL8Zi?=
 =?us-ascii?Q?SJMZsPypl3nAKGsNUxPPTVlx/vvtuK4FuKWlWrIU2V4MDQDPEI9llXNQpMVu?=
 =?us-ascii?Q?fX7yiFlOspUgxD/l0FB2VxltCW5x5nx17l8L25b4Dxzgunw2FI4qor4f7M4b?=
 =?us-ascii?Q?Xl9g2Og6GsJiiyBc3opwQW+4PGxpd4vWoBSXH/xgd//nBkDsQvlpjJlyENsO?=
 =?us-ascii?Q?I4pLjLTooKgQOZUjvqrYVS+MidkOnaOI1/czHm2LrqZ4k1SMyi1sTaNZCv6m?=
 =?us-ascii?Q?+diF4JpeGU7ymHxXXq995PK8HKs7L5o66rF+7F61KRyiwk+rXi9FmU1mghKt?=
 =?us-ascii?Q?Mk4XhLWlg0kRToQE5g9V5YGo2bdGXCr//3Y28fGClF8SXEWyb4m8B7hTXI2C?=
 =?us-ascii?Q?pthY9c62c754tUasCR/2cT20xkh4dz160FhYIn/c+4H6rWJS1dMTv681kS39?=
 =?us-ascii?Q?UWcECyMOrh8zFsllqqC3VpDcwf5sy7YeKW0rONC6+P8Axd0erMn2rv2nlqa3?=
 =?us-ascii?Q?H58HX0KTEZ9YwW+wZAYGbXFjSd+doEc8+v8Yhmx5XVmSjsuN7DhKc12Br4Oj?=
 =?us-ascii?Q?z+6FRwiqua4SgsQAytIeMWN4niN3BUEY8jt8MQXxdw1gnNJpxKyQIp80/1Tu?=
 =?us-ascii?Q?gt6/R8DQSsY80O7gXgJrQXRi4jVnwjUi2a+/y7bvcup9P7gt4jjhboWX3et7?=
 =?us-ascii?Q?tkZ0kl7K6f34BUuMY56zINfo6nmV527JPeZ9yByJGQoTYBjcQpsAyaVwJtOQ?=
 =?us-ascii?Q?Ex1K0RXdKO5SawZGak7rxOINJOAdHDdtXNnlRNE0Bxu7v9I/Zx0AHiEo0uMc?=
 =?us-ascii?Q?/2l041wcIk797/0usd3VYUKEN3aNOC5Fkqt9O0AiJ4Iz3XAFXCkTSxBDmIOu?=
 =?us-ascii?Q?gw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ed2f0734-89df-4887-1f73-08db65e8229e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2023 17:13:09.2157 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nwhoC6N/CzpyIwd42VaOqgMPlHAlXVGHtn+gMrWUct2Tz5FkxTcpb7/S7G2BTsjSsdDL2N950Ov2Gw2BmKEXvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7005
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 3/3] drm/xe: Don't hardcode GuC's MOCS index
 in register header
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

On Fri, Jun 02, 2023 at 04:52:10PM -0700, Matt Roper wrote:
> Although PVC is currently the only platform that needs us to program a
> GuC register with the index of an uncached MOCS entry, it's likely other
> platforms will need this in the future.  Rather than hardcoding PVC's
> index into the register header, we should just pull the appropriate
> index from gt->mocs.uc_index to future-proof the code.
> 
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/regs/xe_guc_regs.h | 5 +----
>  drivers/gpu/drm/xe/xe_guc.c           | 2 +-
>  2 files changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_guc_regs.h b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
> index ea8118f16722..fcb747201bc1 100644
> --- a/drivers/gpu/drm/xe/regs/xe_guc_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
> @@ -45,10 +45,7 @@
>  #define   GUC_WOPCM_SIZE_LOCKED			REG_BIT(0)
>  
>  #define GUC_SHIM_CONTROL			XE_REG(0xc064)
> -#define   PVC_GUC_MOCS_INDEX_MASK		REG_GENMASK(25, 24)
> -#define   PVC_GUC_MOCS_UC_INDEX			1
> -#define   PVC_GUC_MOCS_INDEX(index)		REG_FIELD_PREP(PVC_GUC_MOCS_INDEX_MASK, \
> -							       index)
> +#define   GUC_MOCS_INDEX_MASK			REG_GENMASK(25, 24)
>  #define   GUC_SHIM_WC_ENABLE			REG_BIT(21)
>  #define   GUC_ENABLE_MIA_CLOCK_GATING		REG_BIT(15)
>  #define   GUC_ENABLE_READ_CACHE_FOR_WOPCM_DATA	REG_BIT(10)
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 04a57af85d9e..e51d8fb4a354 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -328,7 +328,7 @@ static void guc_prepare_xfer(struct xe_guc *guc)
>  				GUC_ENABLE_MIA_CACHING;
>  
>  	if (xe->info.platform == XE_PVC)
> -		shim_flags |= PVC_GUC_MOCS_INDEX(PVC_GUC_MOCS_UC_INDEX);
> +		shim_flags |= REG_FIELD_PREP(GUC_MOCS_INDEX_MASK, gt->mocs.uc_index);
>  
>  	/* Must program this register before loading the ucode with DMA */
>  	xe_mmio_write32(gt, GUC_SHIM_CONTROL, shim_flags);
> -- 
> 2.40.1
> 

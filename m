Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3240C77B6C
	for <intel-xe@archiver.kernel.org>; Wed, 12 Apr 2023 22:59:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90A5C10E9D7;
	Wed, 12 Apr 2023 22:59:19 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7AF910E9D7
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Apr 2023 22:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681340357; x=1712876357;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=duXrgbvahDOx68fWhFB3UJA7Fk26ey4Q2Xn+8QFKWg4=;
 b=VLNLY3+ThhcDaFL9cttZByHCwGwI0/hcVhF6tf+dHd+QVHEw9BuMmrBn
 nzYI+NQ9Ge1QouyE/bty4jsuKsEtm3Ol+k5YZ/xMX275g94rwOX44lbWc
 jVSeyXJR0XXLXuD5JpzGGP+kEEn+DHSdLURClKw+Wye+4N4KiHBEfLWc8
 owtKjUcDg0J+9wdsn5jVi3t8nfCALhxTdar+I0JRjDe28Q86ij0vu8Jw2
 Hbn8Zs753za3WO8YZEU4KWzWd0XpZbJyif/fzKtKWwMIA/8y5/Heo6+J8
 R6IzKds7UwreymdttH7IBo9sDMIuIEl/HCCD3CaggQzUbhxInXC7++Zyx w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="371891508"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="371891508"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 15:59:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="1018911166"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="1018911166"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga005.fm.intel.com with ESMTP; 12 Apr 2023 15:59:14 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 12 Apr 2023 15:59:12 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 12 Apr 2023 15:59:12 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.109)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 12 Apr 2023 15:59:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mDLXNd/KWxmWmhrrc7OgHJJ/hPP0vgWq+7DibY0g46Fk0vUcHrKfAaKU68GTu0aKJNMWTqx34s8HFiHdq/gzX3NI9FcQSLGUaCCtXFsVrqrzvGSliy7nBbVctiZpYAuih5EOExkjWJxCbEPBOCBvuw6umva14ebvE5teOKO4TeZN1eCIp/1h47uc2GKP3g6fYSGrFYOm0utl9Q+JZu1MxF8YpR8247rBSYYWoN5woxfZRCLluQvPGwHcBn3jpPDzG3xEnWFBvcK83exs/Cwqx1dSrOBiIdp+yqRqbd2uT5chOKVFAfT7xkyt8nCm8pUgoqeNLuuFNDxj3OU8ulDtPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QGMUB8bf/W+rcgfhFNRBg2a+vR0iqyUC1IGTf1lpbos=;
 b=kbtmvJZcSpq3GHUX0fEV/7lIkCRLJyzjChCILAZkBxnKiMXfYHTwQmY5cwU1kg0dT6PZeEjtCiO4WsxfgAYKddA0FTDonkthJHBAUu+UtjVwugreg4/G4qCYMvRg0UP3UWTyxC1yl8iw3tj/0LzMNy1G0l0XMiMSUglF4k/ZPghuvYUaWjQv+0azwmFYV4UFzUGhiHj6abwc7b85RWcP7BYAToaoj2FitYmHQKjfnv7FUPOBoyOqaYSvgiorr+lFgfF+Fb5E++z3Rf05H7aLbs4Trug7kUTSTD7k3u5DrhQwsgo20Pd6CeHxx+/52Ch/0D909iiQIKwp3BGSRQHoaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 CO1PR11MB5138.namprd11.prod.outlook.com (2603:10b6:303:94::24) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6298.30; Wed, 12 Apr 2023 22:59:05 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0%8]) with mapi id 15.20.6277.036; Wed, 12 Apr 2023
 22:59:05 +0000
Date: Wed, 12 Apr 2023 15:59:02 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
Message-ID: <20230412225902.GF4085390@mdroper-desk1.amr.corp.intel.com>
References: <20230412225248.3229571-1-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230412225248.3229571-1-matthew.d.roper@intel.com>
X-ClientProxiedBy: SJ0PR13CA0134.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::19) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|CO1PR11MB5138:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ac73e62-ca32-4f54-0f07-08db3ba983ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8wG08+Jajs3oi7pChZQToAzNqkhxv9PEgr2MmPtiOLPFSReP/erp6EQjI6D++2QqcwDUP/SiXd7a0ji4ksZRh2BMomkbIvphkVJR/WVfoE6pefLX+YWsM4MYcRQVR70GPn4GYavQWuleghOFWfA4+wdtGfn1PNG+/NkahVd8G9szH3KJpNCl/TUlh2f8nZPqK91/yGH5tiATfJw0lJHGbJbp5kVG1k8bqjw6WbvaEIZANR+2jumNdMv75rXS+Vs7rszLCMhGAL4Vb7OFDYbDFOPJnyWw1wTn0LDNk++l6FuFiVqBcwnYz2VPTLLaDSgrb30fq18a0a5ZK6gqVdnqzV/8plu6Bj80GewHlGDYHYMVWfqWBfRFiSs6nO3M1CxFgfDTqFhVmYvv417q5dWUTjqwFNAtNmXhKI8q709SB67fGACgiyAtx7jLzQ8mo3mDYS79iHlFaRq8TjWC316hICx+vbLxVKSK5sozvJjI4+Ogh6fstHoCjKHKeX8kZQ9HUnM8gTT1gRUQ14Ifr/Mp9wnOfJwc+wvA3umdDFcfEUZgXpvDKaY/NL/n1kc1zw2R
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(346002)(39860400002)(136003)(376002)(366004)(451199021)(1076003)(26005)(66556008)(66476007)(6506007)(6512007)(2906002)(6666004)(83380400001)(6486002)(186003)(66946007)(6916009)(15650500001)(86362001)(5660300002)(8676002)(8936002)(38100700002)(33656002)(478600001)(41300700001)(316002)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6E6ynT80R7ymi+RINS0wnGpEHiWg9bgYlY57IyOyzm+uofoP1JXvVM8H+gh1?=
 =?us-ascii?Q?TDBtuUEjnsceNGbQFH6vPQoi7zbxpcPr2d/Ml03ZpQ9KGXzwN7fJ2wsywoU1?=
 =?us-ascii?Q?UvpnnKBBtOlP+MVk/5w4D4UWXZC1YhM2ayk3C7sPaID/fTkS6kQkjz6AXrBb?=
 =?us-ascii?Q?sSIW/aEgh2HoXYQw7gzGTtGzCTxjnrOUqaHQv4oCW83ndMgKeK6TNzyrE1Hs?=
 =?us-ascii?Q?WkGmACTnYyiAjwh1u5F+eMoHiyGAXIztv1RCAflO89y5iMORnkGV29U94tGc?=
 =?us-ascii?Q?9+zkQalBKXBH9NHRttPoYbXFidcNUMKxjmbd421hBAYzA+0Na2O2+T7qWe6g?=
 =?us-ascii?Q?F4OiTWxEue4iAJZXss6AQgaNwI9K0ZiowuTzU3zXnoCAFDTZYA5eASxwwlcI?=
 =?us-ascii?Q?QfacfYVJQz6kURvHjxQTnnbVldiyN4gPMOGENoRp3l0GR7rj+NMZYIXfhht7?=
 =?us-ascii?Q?P+NkhBZw38DAx96CO1AXshgL6Iukp1eAZkwT6k4rpjksyyjH0K0IhJjESk/c?=
 =?us-ascii?Q?aDe61diB0s5XOW0LzfuYq99k/p8HARG7zpVCJZeb76dzrHdQ9OdMboa90b2F?=
 =?us-ascii?Q?hXH5ht2/X8NnstrXm+iqJsbAJP1SoIk/iYrYYwNEMkVa13+0OTZe6dHUT+Et?=
 =?us-ascii?Q?8b02K+jAN4GzFuzvnwhvXxiNClb0WYIL7ytJdvC0wIBeTPf9QGrz/twkT3Au?=
 =?us-ascii?Q?E9P0Lt+Q6GxyyrlllcL7Fp9MlFjakEp6S20dfmw5Km8qwaB9mKWXcTQuwi4e?=
 =?us-ascii?Q?1aXZI0XhUeP2aWDlAbKM5Ia+svznKH5CmcUcPkgdKWz+o2yKgMX/l7eMKTqU?=
 =?us-ascii?Q?CiSjQFCba9ZIAQMIDyloPLAJr9BYQgLbQk0Btqj0wRbIafnSm2Cn03Cyk6Y+?=
 =?us-ascii?Q?rHtUB7x5/15Ut7xLPeu/WcOa5i7XW9S1GbRuT+ZvxKqbcLkw4fM9Wuyp6sgZ?=
 =?us-ascii?Q?3crdjgHSfiQgT+6VM1+5YEBcamfBPlLLhgDNIrEFcptFKZ0xzn5h0Yj4UM+L?=
 =?us-ascii?Q?ORkYTcTT2A337B40OPPZnvkZQz+IYmIKqIdo5i0CP4mUsS3Wfy1y5iege5yM?=
 =?us-ascii?Q?lvG7ovoLE7IBcbxfzUoBkK1AsClBIwrLNXSrLWFHTrKOw1rojgX6SjS1E5Fx?=
 =?us-ascii?Q?yMJO3/Blp5PB8i++B0m2R25NjPke4tXVSn1Nf5GsJoxvdt0eh3AetCYYQv+v?=
 =?us-ascii?Q?3GKqCo9Fvw2S9aaIyhG52OrUA6sAC6zqtdDOQ60KXyYIAe1NQyJlRACtfxut?=
 =?us-ascii?Q?RX0KHi7cYChG9/LAIE91CW2+8UkCmC2Hbp3EpjffeKwHiBUWfVsRP4o2Bqm4?=
 =?us-ascii?Q?ZSw4D2vy/oH6wJ0oPQfbuXzIpTjtPoeizFLTlzvWFn21giUMWfJpIMv2zljL?=
 =?us-ascii?Q?iKQdYy57Ci6MIYWHnpIM3SSG7+t4JpROB/H2MosMn9VQ2dBUAEhbfNnmfeDG?=
 =?us-ascii?Q?15UOWU1GUD0+/HwyXzQN/03mkUFM+RikOo21UKKohd0QGEP4caS8fzwehsRN?=
 =?us-ascii?Q?/ILjUF/ralsqoQgGcbXfhec0nLM1IEg4hG4HYLnIbAiWmohvybGQ6Isvoz9z?=
 =?us-ascii?Q?C7HkrZ51ITouFnuMQjQMkGliynXOYvnm/Y/13amlpB6cnNjxMC9dswm1n9Ba?=
 =?us-ascii?Q?Pg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ac73e62-ca32-4f54-0f07-08db3ba983ae
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2023 22:59:05.0124 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UzkJLx+npDVuhNFz8iYvqsEie/gX5x/C/Ic1Guk0AxDHXdZps/H/EifHf7pbYaxBbgaWZnPPzUGsVxvywL1KQhml1NX3dxk5St/lazKtIgI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5138
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 0/8] Meteorlake interrupt & TLB handling
 updates
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Apr 12, 2023 at 03:52:40PM -0700, Matt Roper wrote:
> Although Meteor Lake has multiple GTs, we need to be careful not to use
> multi-tile flows when processing interrupts.  The platform as a whole
> only has a single copy of the SGunit interrupt registers, and interrupts
> relating to the media GT are delivered as part of the primary GT's IRQ
> reporting flow.  Only when an engine (or GuC) interrupt is raised do we
> need to determine which GT it relates to for further processing.
> 
> The whole multi-GT vs multi-tile situation is made more confusing by the
> Xe driver's misuse of 'gt' as the target of all register operations.
> That's probably something we should refactor in the future so that
> xe_mmio_*() will take something more appropriate than an xe_gt
> parameter.
> 
> With the fixes in this series, interrupts are now properly flowing on
> both the primary and media GT for MTL.  We're still seeing some TLB
> invalidation timeouts, but those no longer seem to be caused by problems
> with interrupt handling.

I should have updated this final paragraph...with the changes in v2, all
of the TLB invalidation failures are gone now and we have a clean driver
load without warning/error on MTL.  Actual tests (like xe_exec_basic)
still show some problems on the platform (memory cat errors, timed out
jobs), but tracking down and solving those will be work for a future
patch series.


Matt

> 
> 
> Matt Roper (8):
>   drm/xe/irq: Cleanup media GT interrupt flow
>   drm/xe/irq: Improve warnings and assertions for GT handling
>   drm/xe/irq: Process Gunit interrupts in relation to the device
>   drm/xe: Fix xe_mmio_rmw32 operation
>   drm/xe/irq: Ensure primary GuC won't clobber media GuC's interrupt
>     mask
>   drm/xe: Include GT ID in error message if TLB invalidation times out
>   drm/xe: Invalidate TLB on all affected GTs during GGTT updates
>   drm/xe/tlb: Obtain forcewake when doing GGTT TLB invalidations
> 
>  drivers/gpu/drm/xe/xe_ggtt.c                |  24 +++-
>  drivers/gpu/drm/xe/xe_ggtt_types.h          |   2 +-
>  drivers/gpu/drm/xe/xe_gt.c                  |   4 +
>  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c |   4 +-
>  drivers/gpu/drm/xe/xe_gt_types.h            |   2 +
>  drivers/gpu/drm/xe/xe_guc.c                 |  11 +-
>  drivers/gpu/drm/xe/xe_irq.c                 | 115 +++++++++++++++-----
>  drivers/gpu/drm/xe/xe_mmio.h                |   2 +-
>  8 files changed, 125 insertions(+), 39 deletions(-)
> 
> -- 
> 2.39.2
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation

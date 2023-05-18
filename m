Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1741C77B7A
	for <intel-xe@archiver.kernel.org>; Thu, 18 May 2023 18:20:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EE9210E53E;
	Thu, 18 May 2023 18:20:43 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDCE510E53E
 for <intel-xe@lists.freedesktop.org>; Thu, 18 May 2023 18:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684434041; x=1715970041;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=h+Z25MPizSZLGA6sd005kP8GYs+YquzhNyjof/WHQUQ=;
 b=crsSrwVsaPPJ7xX7PVoo19SfyTqGgCOUczeb/REg18wDWxxgRS4F8BFu
 m+HW/nxVDexTws+AoozcAlDlN9utu8EURKTrss6FhmIpWa0sY18Eo9bmk
 vnfN6C6utrORouFMayI2hf9b4HbANJJEFDF8Gdrcu9a0ToPn5KeRWdiC3
 Qd5FT8g3i8rd+G6NNYhTvPuPZsyXQNOXjv+poOC8kwesa+CPrKYCNTRB/
 sR1wtHmEZKGsD5mi2Vc7CfDJpRJ+dBi86aUiCUmGaO8FKtHKSEX6qi5fa
 +BKkU8RbWP836uzilRwe1qP/9x0AegAandA9OdLR5i8QGpyyeglPc4eeJ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="341585176"
X-IronPort-AV: E=Sophos;i="6.00,174,1681196400"; d="scan'208";a="341585176"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2023 11:20:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="814416479"
X-IronPort-AV: E=Sophos;i="6.00,174,1681196400"; d="scan'208";a="814416479"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga002.fm.intel.com with ESMTP; 18 May 2023 11:20:39 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 18 May 2023 11:20:39 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 18 May 2023 11:20:39 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 18 May 2023 11:20:39 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 18 May 2023 11:20:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jU1N0kIMGNTxpqkuaG6KpmBCTJpwZGyed3Ht2MIkeJfcm9aWcmoObuny6RRb/7pRxZj/B2S2mexlxkagqQ4iWEX4jWiJXBR7NjOwcnnPbNViwvE8b/lPSLQdTMVfsRM5DCrqxuB01pSqzs04DdOS1208BnYPmmqah6b+I8hh3n+tl6jbfMhSdz36fa3e9FjjDVWmP61UNZEFdeg3CVoGEpTbmtDwwZy8V81o0E1zvk9mtrWpHKgCluYA8PgJuGE1Vgs2YUsgx0tPTETy54j+4UmKB1s8pSmvEMpqhM3EsXyr3SfvnshDYAP1gA5MY3s9Wsi+ND6Szxn4jHklxUwt2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W/cbx67AV3hfxI0Ki64wscnlMT4KVZIx2NKWIAyeB1g=;
 b=cFPnXGigEZyeNXarPtu99sAGb9/+NiNEB+Weq+MtIN/N0MW9RKjUK3UuMWr2oEF6r/55aMRHjsS1XusmZz5NYshJaO/PIqyHPOHLNeb6SewmS2eqyzgQ4amyPpa/aCm50MyFIDivEiLDvGU2GsXKlE2dMWNGdPSzU2nECq03XNU4kPxtyRUviIeRR5UtOW662LSKU6cZdl+V7aZAlVm6jwdrXBn+lpkXA99RGQytppnfDkdZR4bIrBsJ0PWoI8MeCmfEbAvlaI1hzEi5rR8iNtPmxxccB1upW2A6NNzXRXTSxWWQrxRp9L/XESbIY0pWUINeTWieyNBn88WjRUjiQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH8PR11MB6682.namprd11.prod.outlook.com (2603:10b6:510:1c5::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.33; Thu, 18 May
 2023 18:20:36 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6387.033; Thu, 18 May 2023
 18:20:36 +0000
Date: Thu, 18 May 2023 11:20:34 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <ghgdtc6me2ut4f42thycqn24nz6c6qaiowcc3tu2ussiwii2ki@eievmeyi2lzb>
References: <20230511034722.1929038-1-matthew.d.roper@intel.com>
 <20230511034722.1929038-15-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230511034722.1929038-15-matthew.d.roper@intel.com>
X-ClientProxiedBy: SJ0PR03CA0187.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::12) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH8PR11MB6682:EE_
X-MS-Office365-Filtering-Correlation-Id: 44a13afd-f28d-462a-6bd9-08db57cc937d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BkhwQx2uPMhOW1W2galSnKSkaGON5DaIkZe4Xnb+9lvgAkGLspktfyDt4YyKtRDvy7U5KnqzAhr5yHQo/Cf6VTcoaMRk24axxWLQUGro6O7ybtvmG350m3xQiGZUK3uLBwhHn3lHnXo0ICMN2ouD7OQmbX2j3rczFLcOvTdT4XHyo7xr38FUolWUYvwJj62pFDciONebm1rK2lvlP7PsQNXGkI4bjWfgpHkEQUhB14pwvpSE8F/6HjX92ZHGgpx4L5A2Epll9l1CdGaFDCZ/sABrdW3NKiTQxiu/WYIkVUlGS+r7ean5RMs9zeKq4NsaV91EqVrDuc/o6L1dZKlMYYEc5qEXZFEG6ZWPl9pRJCefwKFBhUg4mSmIqEVmKS6uha2t19FRlyGkJrdyr6XKCl65grsfPFhBdeLl2zpGyI1DBrLkKHxj//n97PnlEsg4vuAHTzC/EXl+GTlwT/zteZi0tbX1fcgelt0ZeIB2McPvkTpcBIHeE6kjBUU0RGHcULvPpYDftuKJ30PiwpryDHrL1wmnYgTKBu2pELEB7vJ1kC600fTDOA8XdDJp287l
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(136003)(376002)(366004)(39860400002)(346002)(396003)(451199021)(6486002)(4326008)(66556008)(66946007)(66476007)(6636002)(478600001)(86362001)(33716001)(316002)(82960400001)(38100700002)(186003)(6512007)(6506007)(5660300002)(8936002)(6862004)(8676002)(2906002)(41300700001)(83380400001)(9686003)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?R+/0xdfHiYoY+rTNMYDIum8tJXf/S/pu+nsSwO98XSh57UL7rKuddm0tULNg?=
 =?us-ascii?Q?mKG1s6obHXxadI/fiNU+UHus6yx9vst2ZT8GdFdX6v5ma5i4jbLCd6ES7J3Q?=
 =?us-ascii?Q?AOUy5Sf2lqI3JHGgsYE1QErG7haz3my9inFS6DN8oITcGAsSyseZra//imek?=
 =?us-ascii?Q?kAxLavchDoAyiJDQPNRsI0CHGbTMzpZmooLLaG27kDwptvVqEaQUA/5tQJmI?=
 =?us-ascii?Q?OXRjcxAk4TnftjUWiwrYihBTEmbj3v+/nmH++Lt93U1Cs4sZfgMFIH1CRjZw?=
 =?us-ascii?Q?q2nffz7Dz1dmHSxO7l83U4rGaybIKrqL0eIWauD7yNiubEgGeTo2jtvMDyBY?=
 =?us-ascii?Q?XGAR5MzrAS2SjHtfZejPGpOXQr1il9UVRuR5eGGWJaBMsXpQMvWk5tU8aHKv?=
 =?us-ascii?Q?nX0Df81i3hJAO3h7qU55J5EnxJAariM9HCjM8dc+HcEtGh15pX7m5m2DJe2Z?=
 =?us-ascii?Q?lT/8Cjkr9XnnE7yqj5y6NmCQdLc+ugYojKDGFNtYKAoV7+3R0L5QaZsMrJ5W?=
 =?us-ascii?Q?W1u/73RTcxuxDNBbSyoB6g8SUdAECJxI54LMl1TFGNm8rynEGwW88f237tE0?=
 =?us-ascii?Q?vQaAMCHFQH3wUka14YdSo1+qvKzmWwv7ohenr9z8tvCrjPx3byRHOcjccJkS?=
 =?us-ascii?Q?eyHKRBwsAEQfCne6zDFrziY3LTuoxQ1RSqEybk7wMKp6Bm9rxDkaz0EjH3Ru?=
 =?us-ascii?Q?irVgtQqVH59cYc/lCtOG0qQWP5C2/r6j135RbV/YqkpF5qmImuuaF+BdKaYO?=
 =?us-ascii?Q?iS+53WdWaYROf3TdyFzlTLJb0XgYYXYnHXY9dqU5/k5S4eF3rkghnbmkOJWT?=
 =?us-ascii?Q?PdzKQEk8jXafSOHxwmyZUhSoU6PIc1Dc88vtqKq1x2x6pMXuclpQQSmTCgrA?=
 =?us-ascii?Q?p4iYoXVPPckdzxBdDwCVSr0mwq6t6OQlPshYayRBpz5kSsO1tuOvc/H3leud?=
 =?us-ascii?Q?BAaQtVK+qX07/PaQBE008mYBBY0p8IKu5VOQReJr9nPT71DSXZbtVV46cGHI?=
 =?us-ascii?Q?TSEcPmwGgZ44nGIjiX/KD82s3Oq8iokKySuXEmvCLrO6V5eCBQHAjI/qucK8?=
 =?us-ascii?Q?9F795MpKKxHJqdk6cjpkwvmjROjMJM1aDoxFZ8uEf9sETj9ahmw1qnSU7VLR?=
 =?us-ascii?Q?IjOH4QWetWuQ8OQsjLQwRgLAi8soIG5tt/PMjkwxDDilv6sYHOvOKqIbXMMa?=
 =?us-ascii?Q?T5w+qCxK78t3zhGvsfuqy2wENyqIgFSho6LWiexJRsaYALU3qBwANYzRl8Y4?=
 =?us-ascii?Q?gU6yxCY/u1OG2Jj+DzYxiUoXDpyLO+xhEBXhQmuriX6pt33Rc9a+zbTLo0nz?=
 =?us-ascii?Q?Yt8qADkCEg0Y49rcf+jtuwS/YwZAKD748ym0aLm6qo6RBQmyXZjyLO3S6WRm?=
 =?us-ascii?Q?LWrdvvDVBR/6sYWMNfRvnDBHVXZp8gMJSvWPDKtWAcGBk0kXOaT+6sbZ2odS?=
 =?us-ascii?Q?E5KNJuTM7DJ/I2o7OC81qJnO0cScjQl9comFcHGSFf/5wKrHIgvsfwLgW6I7?=
 =?us-ascii?Q?vcqUojelAPHbJFSBmdw2A+T5CDqAGZyRBPZabrqA2oxBoRiWnZ8JAeKoOKXP?=
 =?us-ascii?Q?+Er2j4tyAaQnQZN8yyJk+/AQfgT1hzSVsP4s7YZaKvAKFFX3yY10/JGzORug?=
 =?us-ascii?Q?rw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 44a13afd-f28d-462a-6bd9-08db57cc937d
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2023 18:20:36.5793 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AvSRKUOMTUEoZeGKw4Aqz5+O+PVHPESRiPYYUjG0Lmoe1SX9YlOr110N+EtZQx91Cd7w3e4dvA6n9ve8rdkXEVaw+a6hZu2g3qhQ2qKTglQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6682
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 14/26] drm/xe: Move display IRQ postinstall
 out of GT function
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

On Wed, May 10, 2023 at 08:47:10PM -0700, Matt Roper wrote:
>Display interrupts are unrelated to the GT (and are also only relevant
>to the root tile).  Move the postinstall call up a level in the
>callstack.
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_irq.c | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
>index 806121009102..494ec5567e50 100644
>--- a/drivers/gpu/drm/xe/xe_irq.c
>+++ b/drivers/gpu/drm/xe/xe_irq.c
>@@ -490,8 +490,6 @@ void xe_gt_irq_postinstall(struct xe_gt *gt)
> 		dg1_irq_postinstall(xe, gt);
> 	else
> 		xelp_irq_postinstall(xe, gt);
>-
>-	xe_display_irq_postinstall(xe, gt);
> }
>
> static void xe_irq_postinstall(struct xe_device *xe)
>@@ -501,6 +499,8 @@ static void xe_irq_postinstall(struct xe_device *xe)
>
> 	for_each_gt(gt, xe, id)
> 		xe_gt_irq_postinstall(gt);
>+
>+	xe_display_irq_postinstall(xe, xe_primary_mmio_gt(xe));
> }
>
> static irq_handler_t xe_irq_handler(struct xe_device *xe)
>-- 
>2.40.0
>

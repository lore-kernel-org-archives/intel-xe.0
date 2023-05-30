Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BF06C77B73
	for <intel-xe@archiver.kernel.org>; Tue, 30 May 2023 21:33:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C74510E072;
	Tue, 30 May 2023 21:33:48 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E426110E072
 for <intel-xe@lists.freedesktop.org>; Tue, 30 May 2023 21:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685482426; x=1717018426;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Xa4ZuP93ZxVG9a3cQOI0TB0G96bo8idJV6WLj9MpiUY=;
 b=GlplFTLYkBLBEwSYwj3Rr//Fl1PVgC2EBxGlZbdIi1/idOWmr+o1DHGG
 HuT1P1iNU16UtHkkVTGO5r1Vxfm4YBMjuZMhYZ3/Yb4Zt7SSE6LjnrESB
 /ofy2imA4yAghFx2gz/Oqob0WpKKYdp5IAkkFF7mlHi4GTfph2wZ+ggi1
 NQAYQhDCKWQk0F5kKjbrZRPjV/5kD4iiC+dTUQm/8cVUBow2OhRuimq37
 CyV+4jB7QH1Yoo4G1BuWTV+MGUKc2ik3HnMBjzWMvoqAmJ2m1MAYqPGrF
 b/K+5a/OR9ANtmpdapyc2qPztPzooG0Yw9ocr5KAUMrkK+p1cHupgPCUy w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="357439623"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; d="scan'208";a="357439623"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 14:33:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="776503611"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; d="scan'208";a="776503611"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga004.fm.intel.com with ESMTP; 30 May 2023 14:33:45 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 30 May 2023 14:33:45 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 30 May 2023 14:33:45 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 30 May 2023 14:33:45 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 30 May 2023 14:33:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F45whEiddBe8PGQy/vvwcAHoo/SB7y0XEAFZSwQwRGqlDH/4lDpVJLobjUrNrT4xiSRKkHFVfjWSM0qAoZ7YHULnVkLj2Ny8MgWuhn3tB45nGIEo1xTvsdU2Dc569U1sBSuke821CM5ujGSEVZQT0l5dkt2EcRh92ZRFJtJxjaIZLahGSslOy/QSNarmu2mSNuNwQ8I5M+FtrdQAv+bd/OL8eHpr3IdzLqjltwQYL/AoeoCp1WW33bwdfMesGyl3eCPGnIDyHxD5EFElsxgAgZ+1wrJgnF3Pw+8B4eMybknekvULYlUUNJRb0ZzjfD9fykWfALP+5GG0C3BNibHJjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dp1xqq9srWFoMUG43XkykYHZxKqB2BlTlwpice4mQfA=;
 b=IzSCuvgP7bKOOfMRoCQ2H50Z+qeHm6SsX6NSQViSpY97af8puXCRGazij2NMBIckZEyYtr/Nwzb1EifDNiw9vRL6n8MLu3J5EFdo+u/JvLDMcdI0t48+7wiI2ZkjF5jO5sU3v3jnrysVmRx1yT/Rx2xeEYHHIhfS/8KVIPpRTdO2AfbJpdMSGGuK4dyAhEsouKks6VAD1myDJexivixqaN+Wfk4hMp31aZJC8RIrpZXhvGjsDcuRGaDQJXALC2sEeN6NV1x8MtRdPw7jWxNc1Wp1pCOZqadNt3YKN6yS6FgmgVVzq+ouE328yvg6Rk7L6eZ+1+NH0aVEPZuB2N/nNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by DS0PR11MB7969.namprd11.prod.outlook.com (2603:10b6:8:120::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Tue, 30 May
 2023 21:33:43 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::e1a7:aae9:f8e7:6aa8]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::e1a7:aae9:f8e7:6aa8%7]) with mapi id 15.20.6433.022; Tue, 30 May 2023
 21:33:43 +0000
Date: Tue, 30 May 2023 23:33:37 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Ohad Sharabi <osharabi@habana.ai>
Message-ID: <ZHZrseINdteUOtOR@fdugast-desk.home>
References: <20230320081257.1788039-1-francois.dugast@intel.com>
 <20230320081257.1788039-2-francois.dugast@intel.com>
 <d35f6853-1132-022d-c925-62f753042e12@habana.ai>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <d35f6853-1132-022d-c925-62f753042e12@habana.ai>
Organization: Intel Corporation
X-ClientProxiedBy: FR3P281CA0027.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::14) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|DS0PR11MB7969:EE_
X-MS-Office365-Filtering-Correlation-Id: 099acdc2-cc61-46f2-9d24-08db61558a32
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GIvWxHcU/Q0ptowX20bCL5LFOZrYGQVaQRM7FCWExsQFPH+bT6liLkCumGfqpfmfELcgtMSRQ22lkPTuQccvXzaLbQ/wpFhltDVVXbFoIqHdLEdW/1iWXl9KTzSxi1YWSabuxob37mQACVKICoOzc3RWrM9Xum2Lg5sacfNIzU068s+yIJcCCWW2nXC3ENn1U7B4frun7z2wWokzaoi9DiZe7Kgz+MUR5mCll/ECrRB54pj+m99AjfCHctB3qECPTv/9BgvOy3b0RlgWzU5i752g6sQkLh8PHVScl19e+Sia5dXrGOKRowYTNicDeGGwZN1QdNkhSUzmH1LYDfhBLAnC99MgcPq3SD2aY0SkwPUFdxuElPWFGMbLqk+McWhdkrbCG+EqeF+j3trGs2JNoBcTswPwzl92+zgv90zXsvVEoDzT2z3XB3rtt2aTy2JOkYGv+OfIqC0e6TKRHnh8+8J8lR5l7Nfpd4EJuH8Jfh5AeGDNof2ihUr3jw+91xRUUEeuyMSs+eRjWMhlrklMBS0oGMUvoZCTwhckSrBT6Lc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(39860400002)(136003)(376002)(346002)(366004)(451199021)(478600001)(8676002)(5660300002)(8936002)(44832011)(36756003)(86362001)(2906002)(4326008)(6916009)(66556008)(82960400001)(66946007)(66476007)(316002)(38100700002)(41300700001)(186003)(966005)(6506007)(53546011)(9686003)(26005)(6486002)(6666004)(36916002)(6512007)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Pp35QwJGxZRA9lXT6o1VFP1kZn3lym7rPAjGnJMIBdcKUFrMUFC/AWnWiCDm?=
 =?us-ascii?Q?VtA13Ys31fwYwnfHHMrOj2sWXbedn0FmFNPUFLRi7KCJ8CmHJ74ccvsqTeg3?=
 =?us-ascii?Q?74sPRtx3W3U8MVJE+4IdtKyNDfZOKGIMKE85rmsvVRlMEBQpzvp7xmY6WLA1?=
 =?us-ascii?Q?x7On9kwRCayEzXgQABSpwh0fM1FXXDU0e09qatiCf/z21w1+glclUULgy2Ye?=
 =?us-ascii?Q?DqrS7MTxO4ZYXHkr3FyBG7j4cZHPPYgF2jklylhFsdLvn0zBMo1/P+t2X2gk?=
 =?us-ascii?Q?/LD65faAD52ZXNlJZclL8Lr2k2S3OT9J+krWskwNjGZVxFIXf40ntecemWzH?=
 =?us-ascii?Q?4VnC+XmckEDgRsaU4+YEfkteHtpLOdVMmVBkSrv6rD5m8OOk4R2QlZZsUXWD?=
 =?us-ascii?Q?UFgY8kSxSwi4FvdJ57gdK0ijZU1U0gEhjLrlDNQCPpOSmJMffARfpTCjk8eE?=
 =?us-ascii?Q?Tb5bJy7aTK9D6+QjxHQiS9KJb7XZxhdFd/8ANQP9ILx5nEEfmq7SoQzVgSYn?=
 =?us-ascii?Q?Q9NqTzQp/1wd3jvKcCBeK+xyNDLDmShl1hg5QWnulOyHmmgImfi8qQ+qGTey?=
 =?us-ascii?Q?YB0apVO5SB5ouUXJIV1hNeyXu6CjoSgdrNZLpFmVgXoE54tg5VzNAQCDpWxo?=
 =?us-ascii?Q?HzD+P7vgKEq1WWBJYqrgZ2kM+pC3smjJzMd5lRTXldb9opW6VkmwC+CMvi7s?=
 =?us-ascii?Q?GTkZTSipRPxxbQsomFKmoH3EMoDsxvtprsAb/aF/NaeLdWJEBrOo93hHBgD2?=
 =?us-ascii?Q?ZgYkv3XzP7llTgw62+2GDPQB2mvK2sICi4cdF64bY56xqjSNDJhRfM7+69f9?=
 =?us-ascii?Q?W1nYkbCOQkZ2pK2pvW4Vc1kkswqHtFBAqQTL3BZbnYlJzAzXr0aFVHwgb3fa?=
 =?us-ascii?Q?w7ha8o6w2L3vqEvXAB34mzMwPKvxn3ahOa/xvmShdcVjPr5zL/3gpMRRvZz0?=
 =?us-ascii?Q?4wQAKtU5187gRJxzDrL9/BE5dh1Y4EEa7MU6n8bVEkwsswozmsm9dfTr6IRs?=
 =?us-ascii?Q?1SQeKIrEAyv1bSUd7mcHLkrWK2ZROCzlc2EyK7B81cqxtDSyNgEEfxpXSHGP?=
 =?us-ascii?Q?6B3s8gpibzEkKueni9Svmsh00YNwcJxXHzpyZMvVxNyQKWV3c6Zfos0Iwqr1?=
 =?us-ascii?Q?5jP8xPTU/UJL4arai6frcS8x+0JUXnQlJJ3c6oDXiCBQpn8r/1XPWBd0wnNG?=
 =?us-ascii?Q?lOmtK3iEp7Hk+4XuBfK9or5bsGAqYBPkGq1yIMC96pbbWu6gjeEKHCENS7SO?=
 =?us-ascii?Q?GdrwD+RnAmC4Za6WpskaZjddjIHVyjCLXTwfzFuAxUVXQkcIEp6EqtxjcHmL?=
 =?us-ascii?Q?9hbb4oVxNvluucn5MTDFF+qDhflGXkSZX4qqKaeplLNaWnzZrxoQSEJxTukI?=
 =?us-ascii?Q?7j7gJPlbMSWq+ueFiLlmgma1prRE1fjLBnTRxaJG9vfKyui1jhzuLHWXZuJN?=
 =?us-ascii?Q?rX1QixLhSwIfKrgu/5tJEEAKkp+QEDxsZSigDvS/UfzBAV0ezl+khXmm4I7s?=
 =?us-ascii?Q?xgfeIZGdm3A+ShiEsfvtFzM13QJ5TOJt50wrl/MzygNNHmBexCy8L1zlFXmM?=
 =?us-ascii?Q?ZzGToWtLsmFCWhhItRMaaOpCFn2XTN4X77TQSa8EU3jYmsOxDRKa2LBrhcRu?=
 =?us-ascii?Q?Iw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 099acdc2-cc61-46f2-9d24-08db61558a32
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2023 21:33:42.5228 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oUaR66NH5TTsCk0wC/Lq2uesIeGaq8E7Q0NMoeSW/B80j75gr/+J9ftLSRwgGEe6jQQQuVopSar/CdIlK9+n+AMrFcD1COP80YI+L9Q5LdE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7969
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC PATCH v3 1/3] drm/xe: Introduce function
 pointers in xe_gt.c with local structure
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi,

First of all, thank you for the feedback and sorry for the delay.

On Tue, May 09, 2023 at 08:16:10AM +0200, Ohad Sharabi wrote:
> On 20/03/2023 10:12, Francois Dugast wrote:
> > A local structure of function pointers is used as a minimal
> > hardware abstraction layer to split between common and platform
> > specific code. This structure is initialized once with the
> > functions matching the platform, then it is used in the common
> > code with no need for switch or if/else to detect the platform.
> > For now only the function setup_private_ppat() is refactored.
> >
> > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_device_types.h |  1 +
> >   drivers/gpu/drm/xe/xe_gt.c           | 49 ++++++++++++++++++++++++----
> >   2 files changed, 44 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> > index 4c65598652e8..7d72fb3ff08d 100644
> > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > @@ -313,6 +313,7 @@ struct xe_device {
> >               u32 lvds_channel_mode;
> >       } params;
> >   #endif
> > +     const struct xe_gt_platform_funcs *gt_funcs;
> >   };
> >
> >   /**
> > diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> > index daa433d0f2f5..718cd18b6421 100644
> > --- a/drivers/gpu/drm/xe/xe_gt.c
> > +++ b/drivers/gpu/drm/xe/xe_gt.c
> > @@ -42,6 +42,26 @@
> >   #include "xe_wa.h"
> >   #include "xe_wopcm.h"
> >
> > +struct xe_gt_platform_funcs {
> > +     void (*setup_private_ppat)(struct xe_gt *gt);
> > +};
> > +
> > +static void mtl_setup_private_ppat(struct xe_gt *gt);
> > +static void pvc_setup_private_ppat(struct xe_gt *gt);
> > +static void tgl_setup_private_ppat(struct xe_gt *gt);
> > +
> > +static const struct xe_gt_platform_funcs mtl_funcs = {
> > +     .setup_private_ppat = mtl_setup_private_ppat,
> > +};
> > +
> > +static const struct xe_gt_platform_funcs pvc_funcs = {
> > +     .setup_private_ppat = pvc_setup_private_ppat,
> > +};
> > +
> > +static const struct xe_gt_platform_funcs tgl_funcs = {
> > +     .setup_private_ppat = tgl_setup_private_ppat,
> > +};
> > +
> >   struct xe_gt *xe_find_full_gt(struct xe_gt *gt)
> >   {
> >       struct xe_gt *search;
> > @@ -161,12 +181,8 @@ static void setup_private_ppat(struct xe_gt *gt)
> >   {
> >       struct xe_device *xe = gt_to_xe(gt);
> >
> > -     if (xe->info.platform == XE_METEORLAKE)
> > -             mtl_setup_private_ppat(gt);
> > -     else if (xe->info.platform == XE_PVC)
> > -             pvc_setup_private_ppat(gt);
> > -     else
> > -             tgl_setup_private_ppat(gt);
> > +     if (xe->gt_funcs->setup_private_ppat)
> > +             xe->gt_funcs->setup_private_ppat(gt);
> >   }
> >
> >   static int gt_ttm_mgr_init(struct xe_gt *gt)
> > @@ -380,6 +396,27 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt)
> >   int xe_gt_init_early(struct xe_gt *gt)
> >   {
> >       int err;
> > +     struct xe_device *xe = gt_to_xe(gt);
> > +
> > +     switch (xe->info.platform) {
> > +     case XE_METEORLAKE:
> > +             xe->gt_funcs = &mtl_funcs;
> > +             break;
> > +     case XE_PVC:
> > +             xe->gt_funcs = &pvc_funcs;
> > +             break;
> > +     case XE_ROCKETLAKE:
> > +     case XE_DG1:
> > +     case XE_DG2:
> > +     case XE_ALDERLAKE_S:
> > +     case XE_ALDERLAKE_P:
> > +     case XE_TIGERLAKE:
> > +             xe->gt_funcs = &tgl_funcs;
> > +             break;
> > +     default:
> > +             DRM_ERROR("Unsupported platform\n");
> > +             break;
> > +     }
> 
> Won't initializing the function pointer here would do it per number of
> tiles (but over-writing the same pointer)?

This particular code is now obsolete anyway as the PAT code has been refactored.

> 
> Maybe consider moving all FP init to the very beginning of
> xe_device_probe (sort of sw_init)? We may need some future functions at
> an early stage.

Yes, this was demonstrated in the first revision of this series. A per-platform FP was introduced and initialized at the beginning of xe_device_probe. Please check it here: https://patchwork.freedesktop.org/patch/524916/?series=114630&rev=1 In the current revision however, the idea is to explore a per-compilation unit FP which could be a better fit for the current code.

> 
> In Addition, if I understood correctly, this switch-case would be
> present for each FP group.
> Do you think it's possible to get this info directly from the descriptor
> (the driver data in pci_device_id)?

A reason for the per-compilation unit FP approach is to avoid exposing details of the internal implementation outside of the compilation unit. So while this proposal sounds doable technically, we probably need to refactor the code to use more generic lifecycle functions such as X_init(), X_fini() that would apply to multiple compilation units, in order to avoid multiplication of functions in the FP.

Francois

> 
> >
> >       xe_force_wake_init_gt(gt, gt_to_fw(gt));
> >
> 
> Thanks,
> 
> Ohad
> 

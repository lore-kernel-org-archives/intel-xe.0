Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E9A0E7C4E6
	for <intel-xe@archiver.kernel.org>; Wed,  4 Oct 2023 17:19:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3462710E3A9;
	Wed,  4 Oct 2023 17:19:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D377D10E3B8
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Oct 2023 17:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696439995; x=1727975995;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=pSb0GVW4FyU+Ptq4SoJu8RDmiSxfFm6LCrxO5Ie/Ukc=;
 b=i16KZr+gJ1QATfFpVt4xt3EcL79FA+1UJfSFOrz17OG7+iqfclUi5EaK
 LByrdtD1voEXBEPjEDigYpDTH7YqtUvNUGVjwqod9pRZ2fgwY/DNOfj9h
 Xd1MmORzhrrbKrfS2FfQq6RLwK+vpwAjJ8PZixAUFcMZPUzWsHdwwvAbn
 JWCYXluKy2r59VYyGDMUfmzyeEMhVGgMqykn7GbsFLRGI76iawY+99z4l
 Eh+/zcAZq2SqIijwSo1+BIgJxKK1ASSYnlv/SvjXas1MSxnWIj8j9Fo6R
 W8+MigLsbUESp2S6xRGNmkGLG2Ad6HVxWfOIu2JU9IdDjv//5L62vzCVs g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="449731710"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; d="scan'208";a="449731710"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 10:19:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="875203001"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; d="scan'208";a="875203001"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Oct 2023 10:19:54 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 4 Oct 2023 10:19:54 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 4 Oct 2023 10:19:54 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.177)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 4 Oct 2023 10:19:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=INaxy00z9TG92al1tB/asInEDOfikm9CLvtSq20TZaR8ZoOJPBA1w6yDcFUoJM/CoBCs5jtUqe6zjpYMpRgfGE0Ym+9d50pZEVseWyxuIYCMvJ+IgyvocJtBprUY+6sPYoQteXKmlK9aZf9MKF0lR2jSgSDvsJZPDx+B+tgW5J6mxYLfDjqROk4j4/3N7Nv1BMM2zGOXoSLep94iSGke5jxrENPfnf8PH/JdLpC0RQ9wNeUNrVWhysjMhlkMlTNNDWZ8UZGkDB1vJkI/EwXwGP7Ej9kZChpsta/eR3k4xqqIv3KM/2SA8Kj2mcV6HH46Ipd9+nDmn+TO9VRLs1Xz1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vT80j6GWO5c7bNqGjC4eF+FP0RPML2I/A7iPY1YtcvU=;
 b=Bj9cLIpwKQ6/nlFm4Xmg1zDKKviBXK79Hi0sFkIbsAmAspCs/dybbv2qQxiLQdfL6ic8p5N6QBGqKGk1j9U5Pc/sWK/dIkxvS4IyUH9R3B774SeDMkFru3LoG4up0ep7/4y3QAKpgxwGsNfzaHUzLVug+a09d2plJUtvqoasIwMMQWz5YtaYlmVM5NOd71CanipZnlQ2hac//uZz7/gC43/8HsLmGgndRYDU/mpVcpctdEaJ4/lm895GjrOoTTCS3kArV2LPvazNB584Hghtb16jKduemmmsJCHTuaXhSdAXoykojeHMGwLrKs7skl2C0HNgxcrOQmEL+X5jF8N1Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH0PR11MB5080.namprd11.prod.outlook.com (2603:10b6:510:3f::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.29; Wed, 4 Oct
 2023 17:19:28 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%7]) with mapi id 15.20.6838.029; Wed, 4 Oct 2023
 17:19:28 +0000
Date: Wed, 4 Oct 2023 13:19:23 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Ofir Bitton <obitton@habana.ai>
Message-ID: <ZR2em8wyd4iRxhnp@intel.com>
References: <20230927074607.3027012-1-andrzej.hajda@intel.com>
 <eab66481-c899-2ee1-7c32-c9339db87417@habana.ai>
 <399f4d2c-f502-46fc-b59b-1e750ee9fdf1@intel.com>
 <c356834b-7312-9965-3fd2-7e08a494dab1@habana.ai>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c356834b-7312-9965-3fd2-7e08a494dab1@habana.ai>
X-ClientProxiedBy: MW4PR02CA0005.namprd02.prod.outlook.com
 (2603:10b6:303:16d::14) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH0PR11MB5080:EE_
X-MS-Office365-Filtering-Correlation-Id: 660286b8-aba6-49bd-c2bc-08dbc4fe1026
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: b6MoccdlYlgo2N/faruJgNWkLU1QToPRiLMF9tFMZXWEq9SLpw2m1FvDAWSn+fIvecdKe+YZgtLPVkUkCOrHtzn1Ffl+ZgZr27R/L57fkX+0I69avtOA4d5jAX0a2TS9fgIHjtIV3WkCRuwfoNr8FR2bTSq15stD7uXi4LYEovehUAsrnb6/4dulSkF2hiT6rw7BzL/bzlGCcawxcBS4GNj2ub9pOiebqx8TOIpxPd27BVC4MXyWgkD245sz6Zg/7ueePRGKFSVBKJ2iRkfduy/8h8SAQxYberApZIYU8KQLHONmcz87rAXh651W169O+h0d4TlHcSRDkVcJkzBNM4f9Pe5NNIoB3tQIVfkp3k/kiNZ10C/jmMlcPVJI09PnRdyD/A6EEoU871ixPJVpKzXfGp2SABfjOtKzeWPpQFvdPz7zWn+dnbSZwVxk0g8yvWK+2rKa4imNkITOPRV47auodLBZvoq6RCIsrQiM66Y1FHnjk9uD3SPonVwQrglpYnShgznvosAwUynnjVTeFQleHuuwg/4Y+10MrqemlC/BhpeROxa+u/bdldfYgMG+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(396003)(39860400002)(346002)(376002)(366004)(230922051799003)(64100799003)(186009)(451199024)(1800799009)(36756003)(86362001)(38100700002)(2616005)(6512007)(44832011)(53546011)(5660300002)(6486002)(478600001)(54906003)(316002)(66476007)(66556008)(66946007)(6916009)(2906002)(6666004)(6506007)(41300700001)(8936002)(8676002)(83380400001)(4326008)(82960400001)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?naojp0tLdQ5OQQGSMt0WUHvhuHppY0LCkWLye9z2ri4C2vbpGHBoKJ6uHl?=
 =?iso-8859-1?Q?fSfSb3fHZ7R6nbiyeLmArOR4Xg7YaeprT2xJFkd2azJdu/2RrlflRls7gc?=
 =?iso-8859-1?Q?QKxIR47nim68VKVbssHm+n4LLVjVyrnHbfRwTtGYapLcCbuAHoUO5x003Y?=
 =?iso-8859-1?Q?G2gLHu0evWoUwx+HAbKVFisH7znx6DvWB9B8zmZcmgj20zMu553z8ZhCKF?=
 =?iso-8859-1?Q?ACm/KzVjoe2IXpus5QfCfJskwyvD3P94qkHVQsZUeZBg5Xka44CrgEtQo4?=
 =?iso-8859-1?Q?Yo4Su1XonOUEDInvr1154qYRkR5zL8N7yTLPE515cVmtHDtMb3cyOCy762?=
 =?iso-8859-1?Q?PTyKHSC6KQFgWz/BflPO6tZ0k4XosaYdJzx1R+cuPFpHT19Gt8A6T3h8Kw?=
 =?iso-8859-1?Q?Q5akWZue80t8PSHTjJWZw8wN9SfG987wvFlmhlGXsPOQWFFmdmd4M6nFAI?=
 =?iso-8859-1?Q?9CIEhMyhZLq5hikkm6CtLUNxqGxllM4Vwgca2GgraFho5vqO3arflIEptk?=
 =?iso-8859-1?Q?sGVQI5ak2te0lRbK/VYiZliYznTqpUPS3A2UE4grXk7k42Y/SP9XkZYT2I?=
 =?iso-8859-1?Q?UgqqjfpizC4pWgg5kzNxqfdpgoVYVJvp8MydgXJ3RuWNUYC043bpnzJpk4?=
 =?iso-8859-1?Q?mzdZjHkz0mmQ2WE//ef9QS5v0hzwt+2ZlXSeHd1psWvffUy8z+1LhOpLxT?=
 =?iso-8859-1?Q?NB7DZ56/hAE0BUZ2XdggtVWxrnx0m3rTvRbgWpPAE2krNb4/ouunJoN5UP?=
 =?iso-8859-1?Q?iuG77FtCWcEN6Mj7RO5HBeR4pfswQkcZ4BcsE3RqxLNOTkOFnG3yViGcCg?=
 =?iso-8859-1?Q?KDXCDbYVP7JFVI/uuI+P0uexNhn3JEVDkCVZ4VChD+dymHazoZ/SRnA7sH?=
 =?iso-8859-1?Q?pm9RwMHKYZe4qzBSxcjj8z24jOVuotnhwnVtE9AOdy6Vbu8JfVPk2HcOAO?=
 =?iso-8859-1?Q?q3eM5oL3CCwFzA4hlCicnL1MIImG6aChAhf++NMScMat5ucHoNHZI8w9p2?=
 =?iso-8859-1?Q?teSaZGu2eFDwsdSy906S7Wdj1Z7uI03jGasR23H5F2RaCHSM4aS6Ulu/ih?=
 =?iso-8859-1?Q?YbCPnVqW14He7UzHL/fmbcqcCO9x+KL2q6caSwgRo07wlvfV6srbFjTwXo?=
 =?iso-8859-1?Q?IUVomwmtO1rAkhNcBNHVkEixQUQQWjJ/OOeuE4GdqMd9gHsNkFrP18st6Z?=
 =?iso-8859-1?Q?HGvGdpwLWvu+yAjOB1ACUPNVktH66GFSsMagvArBCjljJ8yogKcpth4QeV?=
 =?iso-8859-1?Q?xyc7Gr0Wc3z3FwoSiPDPz8uji7KgIu5KZ8RuKvu8G66JzaQvGiTge/uq1C?=
 =?iso-8859-1?Q?Ev5Y2z/m+aGwDHgBTnTNXLYg6tRbL4EITfl3hNMA8xox9uLEnUN/s75jV5?=
 =?iso-8859-1?Q?1g25czuDagUlpJeIn+rUOO+Zf2JJ7t3ijR4b0OuxT/foQVxif9oeIzYNFj?=
 =?iso-8859-1?Q?TRGvhQUfkMBH0XDZsDbD/UGraAEEN5ahPZKXEX2di4JeBszW8gX2964mGb?=
 =?iso-8859-1?Q?uj145mmj6noAR1TvtDjkpOyF9AloW8hebYHG/BgbE674+zuelwM/Ovk5/t?=
 =?iso-8859-1?Q?wiMdBFdL+uF9+w5z3oqneeCQiNhJx3U4fcjyK0bohXB2edOLqkOa5GF01b?=
 =?iso-8859-1?Q?OmC3m89rjGyc2/OKnLQbmoMDOnnyNjl8aWP6p+2XaM15kjbZeFgqb6HQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 660286b8-aba6-49bd-c2bc-08dbc4fe1026
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2023 17:19:28.3259 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6x1kxhac2w8zyhj2qwK8Ob/ulw51Ltf6zK0lm/rNNHv05VS6ph7VJXReDoLLI2Jd7/pCqCOGscg5pwFoPKLaLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5080
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: implement driver initiated
 functional reset
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Oct 02, 2023 at 12:22:19PM +0000, Ofir Bitton wrote:
> On 02/10/2023 11:11, Andrzej Hajda wrote:
> > 
> > 
> > On 01.10.2023 10:50, Ofir Bitton wrote:
> >> On 27/09/2023 10:46, Andrzej Hajda wrote:
> >>> Driver initiated functional reset (FLR) is the highest level of reset
> >>> that we can trigger from within the driver. In contrast to PCI FLR it
> >>> doesn't require re-enumeration of PCI BAR. It can be useful in case
> >>> GT fails to reset. It is also the only way to trigger GSC reset from
> >>> the driver and can be used in future addition of GSC support.
> >>>
> >>> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
> >>> ---
> >>> Hi all,
> >>>
> >>> This is initial attempt to implement Driver-FLR in xe. Implementation
> >>> is copied from i915. I've skipped comments, but I can re-add them if
> >>> requested.
> >>> In i915 Driver-FLR is performed on driver unload if GSC was used.
> >>> In xe GSC is not yet supported, but I have added trigger to perform FLR
> >>> in case GT fails to reset, I guess this could be proper use-case and
> >>> of course this is prerequisite to GSC support.
> >>>
> >>> Since this is my 1st patch to xe please be merciful in comments :)
> >>>
> >>> Regards
> >>> Andrzej
> >>> ---
> >>>    drivers/gpu/drm/xe/regs/xe_gt_regs.h |  6 +++++
> >>>    drivers/gpu/drm/xe/xe_gt.c           |  2 ++
> >>>    drivers/gpu/drm/xe/xe_gt_types.h     |  3 +++
> >>>    drivers/gpu/drm/xe/xe_mmio.c         | 38 
> >>> ++++++++++++++++++++++++++++
> >>>    4 files changed, 49 insertions(+)
> >>>
> >>> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h 
> >>> b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> >>> index e13fbbdf6929ea..769a8fd005931a 100644
> >>> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> >>> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> >>> @@ -359,6 +359,12 @@
> >>>    #define RCU_MODE                            XE_REG(0x14800, 
> >>> XE_REG_OPTION_MASKED)
> >>>    #define   RCU_MODE_CCS_ENABLE                       REG_BIT(0)
> >>>
> >>> +#define GU_CNTL                                      XE_REG(0x101010)
> >>> +#define   LMEM_INIT                          REG_BIT(7)
> >>> +#define   DRIVERFLR                          REG_BIT(31)
> >>> +#define GU_DEBUG                             XE_REG(0x101018)
> >>> +#define   DRIVERFLR_STATUS                   REG_BIT(31)
> >>> +
> >>>    #define FORCEWAKE_ACK_GT                    XE_REG(0x130044)
> >>>    #define   FORCEWAKE_KERNEL                  BIT(0)
> >>>    #define   FORCEWAKE_USER                    BIT(1)
> >>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> >>> index 1aa44d4f9ac1c8..1e0b76000ed46b 100644
> >>> --- a/drivers/gpu/drm/xe/xe_gt.c
> >>> +++ b/drivers/gpu/drm/xe/xe_gt.c
> >>> @@ -604,6 +604,8 @@ static int gt_reset(struct xe_gt *gt)
> >>>        xe_uevent_gt_reset_failure(to_pci_dev(gt_to_xe(gt)->drm.dev),
> >>>                                   gt_to_tile(gt)->id, gt->info.id);
> >>>
> >>> +     gt->needs_flr_on_fini = true;
> >>> +
> >>>        return err;
> >>>    }
> >> I think this should be platform dependent and not set to true by default.
> > 
> > Why? Do we have xe supported hw without FLR?
> > This is kind-of bigger hammer solution - if GT reset fails, lets try FLR.
> 
> In future platforms this might not be straight forward, this is why I
> think it is preferable to be able to choose whether this feature is
> valid or not. We can always have bypass flags in innersource.

we could check if this is PVC case already and make the case for adding
a device flag already. Or maybe just a if () return; in the beggining
of the function when/where that is needed.

> 
> > 
> >>
> >>> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h 
> >>> b/drivers/gpu/drm/xe/xe_gt_types.h
> >>> index d4310be3e1e7c8..dc194e9656abd5 100644
> >>> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> >>> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> >>> @@ -347,6 +347,9 @@ struct xe_gt {
> >>>                /** @oob: bitmap with active OOB workaroudns */
> >>>                unsigned long *oob;
> >>>        } wa_active;
> >>> +
> >>> +     /** @needs_flr_on_fini: requests functional reset on fini */
> >>> +     bool needs_flr_on_fini;
> >>>    };
> >>>
> >>>    #endif
> >>> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> >>> index 3ccc0af4430be4..593ecc98cdfe8a 100644
> >>> --- a/drivers/gpu/drm/xe/xe_mmio.c
> >>> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> >>> @@ -4,6 +4,7 @@
> >>>     */
> >>>
> >>>    #include <linux/minmax.h>
> >>> +#include <linux/units.h>
> >>>
> >>>    #include "xe_mmio.h"
> >>>
> >>> @@ -364,9 +365,46 @@ static void xe_mmio_probe_tiles(struct xe_device 
> >>> *xe)
> >>>        }
> >>>    }
> >>>
> >>> +static void driver_initiated_flr(struct xe_gt *gt)
> >>> +{
> >>> +     const unsigned int flr_timeout = 3 * MICRO; /* specs recommend 
> >>> a 3s wait */
> >>> +     struct xe_device *xe = gt->tile->xe;
> >>> +     int ret;
> >>> +
> >>> +     drm_dbg(&xe->drm, "Triggering Driver-FLR\n");
> >>> +
> >>> +     ret = xe_mmio_wait32(gt, GU_CNTL, DRIVERFLR, 0, flr_timeout, 
> >>> NULL, false);
> >>> +     if (ret) {
> >>> +             drm_err(&xe->drm, "Driver-FLR-prepare wait for ready 
> >>> failed! %d\n", ret);
> >>> +             return;
> >>> +     }
> >>> +     xe_mmio_write32(gt, GU_DEBUG, DRIVERFLR_STATUS);
> >>> +     xe_mmio_rmw32(gt, GU_CNTL, 0, DRIVERFLR);
> >>> +     ret = xe_mmio_wait32(gt, GU_CNTL, DRIVERFLR, 0, flr_timeout, 
> >>> NULL, false);
> >>> +     if (ret) {
> >>> +             drm_err(&xe->drm, "Driver-FLR-teardown wait completion 
> >>> failed! %d\n", ret);
> >>> +             return;
> >>> +     }
> >>> +     ret = xe_mmio_wait32(gt, GU_DEBUG, DRIVERFLR_STATUS, 
> >>> DRIVERFLR_STATUS,
> >>> +                          flr_timeout, NULL, false);
> >>> +     if (ret) {
> >>> +             drm_err(&xe->drm, "Driver-FLR-reinit wait completion 
> >>> failed! %d\n", ret);
> >>> +             return;
> >>> +     }
> >>> +
> >>> +     /* Clear sticky completion status */
> >>> +     xe_mmio_write32(gt, GU_DEBUG, DRIVERFLR_STATUS);
> >>> +}
> >>> +
> >>>    static void mmio_fini(struct drm_device *drm, void *arg)
> >>>    {
> >>>        struct xe_device *xe = arg;
> >>> +     struct xe_gt *gt;
> >>> +     u8 id;
> >>> +
> >>> +     for_each_gt(gt, xe, id)
> >>> +             if (gt->needs_flr_on_fini)
> >>> +                     driver_initiated_flr(gt);
> >>>
> >>>        pci_iounmap(to_pci_dev(xe->drm.dev), xe->mmio.regs);
> >>>        if (xe->mem.vram.mapping)
> >> Not sure mmio_fini is the best place to put this, as this is not mmio
> >> related.
> > 
> > 
> > The reason I have put it there, is that it should be the last action 
> > before unmapping mmio. What place would you suggest then?
> 
> maybe add something like:
> 'drmm_add_action_or_reset(&xe->drm, flr, xe);' under 'xe_device_probe'
> after 'mmio_init'.

yeap, I also had my doubts about the placement. Why not simply calling this
function or a work-queue calling this function from the place where the
gt_reset failed?

hmmm... and maybe not even a work-queue but a direct call is better, since
on that point we are surely serialized and no execution attempt happening
in parallel.

> 
> --
> Ofir
> 
> > 
> > Regards
> > Andrzej
> > 
> > 
> >>
> >> -- 
> >> Ofir
> >>
> >>
> > 
> 

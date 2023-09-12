Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 294BECA0EC6
	for <intel-xe@archiver.kernel.org>; Tue, 12 Sep 2023 00:25:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C39F710E02F;
	Tue, 12 Sep 2023 00:25:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FC3010E02F
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Sep 2023 00:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694478354; x=1726014354;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=0+uclrN5gIkEwAnWBC2TWfSzRJhVA7tq+xumJqZcycU=;
 b=eSE6yCMMnYYsBmMRo63prhdhMk+4WWZHJlmioCQluzN75IpXBJwYV4y9
 Pod1TdnmZqjgXdf/53DRIM6kVM1sA/jvVgG9zsHrHIlN75lfwoxfr95BE
 2fUuDoTVvDFarS3PzfV+kLYV3um5yXXWKwDoSvgTIKpp4hK89IHHnMpTM
 cLF8IVaLuGH/8+oYsDF6PxCdjWiofHYl+yk58112v2d1C3yiHXgOY0dLu
 /BEqaUnYKY3Se9TPbMMKawxOkiYE8ARQR/02XtVFSQYlyHg2N/MAshx2m
 pqYQWphwIdovwyGMnEgT1CHXCytnbQQrRPRzYS3S4gJ2Wy3+SM0BEvQRS g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="442254828"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; d="scan'208";a="442254828"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2023 17:25:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="772788530"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; d="scan'208";a="772788530"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Sep 2023 17:25:53 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 11 Sep 2023 17:25:49 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 11 Sep 2023 17:25:48 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 11 Sep 2023 17:25:48 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.105)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 11 Sep 2023 17:25:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=URfc8w8DcQ1NSWnsZIWnrfwwHHwILkwu7SrKcu+dlNCiJotuqlsveSQ70nLGuKSi1nuqV/0+LnZ+uPHfUE1s2f33YVXAFMfH7toIQsu8kfRMeDGyj2xxqLQfpkC4+qJLavzFrZDSKHXHeuSmJlwaHbxnUF9ZxJxkCB9YgjRZvwYtTObNkjwModuyMd3YQbHnbVCiluzYMW2saOWWEc5D792OFFwjrrWKCaRFkMgvz+3JO/kJ21hOoQxiaHgDV0CAF637JPldv0XUhN9p2zr69gzTynqdPkYVsC5j6Jg2vP40U7KfcQvP0csLJgwkd6i1D7nZBm4HG1iEfbPrXra8tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nw4hXkruUaWxvSP8lvcNTegk8ydf3K6l5Ibx+vWaiGY=;
 b=mD6xeIEAq7MeIqCO+EYvp7zKsFCALvgKP+cNwwczOgStjY+D2Mt3/T9Lry6+GimvLhRHRjD5ru2Pph2Aul1v3CBy7QmHKb9JzPRcDJWqKjpemxt0houfcjf+BKgxm0WZsE4HGGNbd76cNf1OWuwAe2yK4XHs8PCkMGDZfZnx6zxqT8QktUcG+cKfPyobr+xOeCtMQuOp5xljS6Kw1CskKI8l2d0fl00TBcmCvdMeTtzQXsvidC5zCunAzF+FZ8xY9cbbzQvk+h/eacTlWZJUbJJnXdXuy6TEQ5uwWF7rjJFT/KwIA6xAdZ7KokOAevJb3RB3Bh9LOVh1Q4+5vohCmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 SJ0PR11MB5599.namprd11.prod.outlook.com (2603:10b6:a03:3af::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.34; Tue, 12 Sep
 2023 00:25:46 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66%4]) with mapi id 15.20.6768.029; Tue, 12 Sep 2023
 00:25:45 +0000
Date: Mon, 11 Sep 2023 17:25:41 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Ofir Bitton <obitton@habana.ai>
Message-ID: <20230912002541.GD2706891@mdroper-desk1.amr.corp.intel.com>
References: <20230907193515.7-1-francois.dugast@intel.com>
 <ef36eb06-d65b-6ad4-ac4f-f1fb2ba7a544@habana.ai>
 <tl37n5qledvt7yxce5sl4byon6puewxvs3ymfebsndnolwstg3@3fjfvpuzna5b>
 <fede72f2-e542-8308-fcb4-ad37ae058154@habana.ai>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <fede72f2-e542-8308-fcb4-ad37ae058154@habana.ai>
X-ClientProxiedBy: BYAPR06CA0008.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::21) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|SJ0PR11MB5599:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bf24c08-6101-4c1f-01d8-08dbb326cda7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: f19MnFXyG/LxS+pyZoXY7evl/FedblNHCyaKaslKt8Kt/ZBv86oVz75OTrtErKFwKAgyXg8f7iVSumUNMFB58kF6CwmePutzuqNdA7v5e3C43Cmlq32icwPu530XzVTdg9VzfIJ3zA0EtUbu7C3fMlb58ahGLtXdWmLvmKnKpjeVJCziwEHQJuhBNadUxuYuFipd5VIjxNEJZWsXtfg2MY67eyBmJU/y1l0LE/i8edjO7DiHoeMrhObhUwVUC0HRip5XHmm9ScvQYUMv3GkOXoKPivH4GeYkiRkajUFv7F9lskIqjG2yjrBlWeKqxhGu7kTcsCr7zNn6xE0xIUIGoYqv3t/Y10c48ykz7OhcRjWwCn11s9gMPkgYvaln61lZVxHBNgk8FigywrY/o1JPC7i6Ln07MJXIewy65iMZkwBHBCzWqhxj1ndtnwPumJSaxqjFJwf2a2wzhhGDZa+w78CVX4Yp4oLDPuV6Dtw+IKEbZzWdq7Q/YVOOo7IC6vk0XhgkFaxXsy/3U7BFkTnyvMsqRlK3bGK89S46YOS/lcoIaHTCwVhIGcQhHYVxnpJs0kDdfyLU6Gfi+XJ+hK15vA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(136003)(346002)(366004)(396003)(39860400002)(186009)(1800799009)(451199024)(6506007)(6486002)(53546011)(6512007)(6666004)(83380400001)(38100700002)(86362001)(33656002)(82960400001)(1076003)(26005)(30864003)(66476007)(66556008)(54906003)(66946007)(316002)(6916009)(41300700001)(2906002)(8936002)(8676002)(4326008)(966005)(478600001)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?R5j7VLytBr9W9GFCqMieUAIc+x0WdZGjjIvGYqT3J0CEgbZoaf07LLHFOhtW?=
 =?us-ascii?Q?X2py4UGA/LD3KEalVLoYN4Oedqx6oNR7ySZl5WBdNECUuYVllumNFNkUC1nK?=
 =?us-ascii?Q?BhwToTdBREWjIEooJmAA9+jUSNVm1et4sOuusk745nt3W1iQ79mGGqEmozbw?=
 =?us-ascii?Q?nlPDqZ0WvQaBepDHIEFlyFsvYqiqImElPwvvS+MN6L+7zS+1RP+yqul7AYk0?=
 =?us-ascii?Q?HkYkwVFbRJzM/QsmuR5B3Z0zKXDJvVRS83UiqmWDWp1dzqLAlcvpd1YF5J8E?=
 =?us-ascii?Q?ye4ixrdhZ8OKmvYPyw/EpAwrOXjr8RtgRZYMiUJlQr0cZcYSvakizdtvVmTw?=
 =?us-ascii?Q?3or7dvtSv5aSseBkUDmlojIoeTiXywlD5/gWqn/27l1SMBiK90NWb2bmJCe+?=
 =?us-ascii?Q?9snFvKxfQgsBcpATSjeW/mqaRJ9CrMd4EubfGL5MTiD+fYpnBHksG6oLx4EV?=
 =?us-ascii?Q?xJnnn0dXDQwrqjYCNbdEiXrJFW81t2EiGPpKVKBaCMwkjQpe1nb1GhTC3Ifu?=
 =?us-ascii?Q?Akg6YSzvdn1R2mcVBHuKKdAYnI9esJ7ppr+TuaynNCvxLFOCFgAIvL39+cme?=
 =?us-ascii?Q?PJRUJPn89EDQIAsKtkDhhjl5Of2Udg6aK4uicXJeNhfJvIRK9GeHiYbAFQei?=
 =?us-ascii?Q?VSEcZTNb9hBJK4HerszYiRAC0UB9PYOdf3eGnQ5SviszWADZhyiCeUWfn0BL?=
 =?us-ascii?Q?HPCEY4WZsldDMudeYoqa6IQTwIxLpvasXftKeMqYseeCZTyBNkS7hFiLmrRo?=
 =?us-ascii?Q?mejpOMcohbJCeRjQEE/Fd23k+VmXwRtV3ZkB4KFOPCtHsFGIJmUfh8nVkW86?=
 =?us-ascii?Q?lHRlHllu7EpmkElDL2Utgd/i8CXg0V0X9yaW478L+aRfDjJIghEoWgoiurEg?=
 =?us-ascii?Q?4cukTIAKH2oZfMGcjd+mHlK0XNd6JnSFdRfEtemi25GISW0NdCXszwCUzZZJ?=
 =?us-ascii?Q?sKwd8z+BaJlzwqfhd4hWHf7+xbMpg1FSMebzAH+SpCRUWUI4eU64x2IKZEUE?=
 =?us-ascii?Q?5ua2hNz1MlxNGiPCg0y3x199WTZjqwXkA3U2JgEw68TDJ6hVEddFVzxUHkV/?=
 =?us-ascii?Q?yrW4YKmUSFKdO5udxk3sewbRjCKNJzvicVyT7ZOL1ahYZwFVtA3gXsjJC4S5?=
 =?us-ascii?Q?nH1vhiZeCxSQTOasgHGgRf9zwvXs6PAwH5imo2Y964aSgRz18/Jd630gzMsk?=
 =?us-ascii?Q?owHblQEfWmvtV96AZD+wt0fjTd1MIIVTorY9jrOZTZQS66LSCbd36UDWe0Bi?=
 =?us-ascii?Q?vLLCeR32pm4LykafnyJUKxIJYjepwjzbxmXDEyE2UNn0jo4fT/vmKS17z+GL?=
 =?us-ascii?Q?hU9LCG7I/WO1vJZ5CQPRSk0VJv1+Mu0OrwjTTfvCodA7iePVr0xopfILkJL/?=
 =?us-ascii?Q?QQHRLRAljePn5T5iQ105nwm09JwVDmAmgl+amUcT4zEq3wRpAirqIbNuPW3S?=
 =?us-ascii?Q?aLyeRrEUdD+1M78YuBcIb7Cz6kKUW660rdWEXJYPP/FhVXGjc9KUzeCxJxkb?=
 =?us-ascii?Q?ItN1PsVXbuobombMNUHzAJEOh/GA2vdgAdTSaJOEncCx9BL/Y8XhL4OTNn3n?=
 =?us-ascii?Q?6NZQgDKrHX8IZ4LndUtzgYTKqUjqkvi2f2Ja2HwOCLGDn3PRkd0j1hMTQL1t?=
 =?us-ascii?Q?YA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bf24c08-6101-4c1f-01d8-08dbb326cda7
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2023 00:25:44.5756 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p/XXr6wZPN+76T/x4jdxXYnooKocs9Qt3TEhjaIJunprz9UeFiLWcNCUpqz1SWiydv2tT+EEWl/CkUyh21Att6ncc+40eNkhzz95S8+mhuE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5599
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/uapi: Remove MMIO ioctl
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
Cc: Francois Dugast <francois.dugast@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Sep 11, 2023 at 04:21:37AM +0000, Ofir Bitton wrote:
> On 11/09/2023 6:45, Lucas De Marchi wrote:
> > On Sun, Sep 10, 2023 at 04:34:24PM +0000, Ofir Bitton wrote:
> >> On 07/09/2023 22:35, Francois Dugast wrote:
> >>> This was previously used in UMD for timestamp correlation, which can now
> >>> be done with DRM_XE_QUERY_CS_CYCLES.
> >>>
> >>> Link:
> >>> https://lore.kernel.org/all/20230706042044.GR6953@mdroper-desk1.amr.corp.intel.com/
> >>> Closes:
> >>> https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/636
> >>> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> >>> ---
> >>>   drivers/gpu/drm/xe/xe_device.c |   1 -
> >>>   drivers/gpu/drm/xe/xe_mmio.c   | 102 ---------------------------------
> >>>   include/uapi/drm/xe_drm.h      |  31 ++--------
> >>>   3 files changed, 4 insertions(+), 130 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/xe/xe_device.c
> >>> b/drivers/gpu/drm/xe/xe_device.c
> >>> index 109aeb25d19c..10fa1b55578a 100644
> >>> --- a/drivers/gpu/drm/xe/xe_device.c
> >>> +++ b/drivers/gpu/drm/xe/xe_device.c
> >>> @@ -107,7 +107,6 @@ static const struct drm_ioctl_desc xe_ioctls[] = {
> >>>       DRM_IOCTL_DEF_DRV(XE_EXEC_QUEUE_DESTROY,
> >>> xe_exec_queue_destroy_ioctl,
> >>>                 DRM_RENDER_ALLOW),
> >>>       DRM_IOCTL_DEF_DRV(XE_EXEC, xe_exec_ioctl, DRM_RENDER_ALLOW),
> >>> -    DRM_IOCTL_DEF_DRV(XE_MMIO, xe_mmio_ioctl, DRM_RENDER_ALLOW),
> >>>       DRM_IOCTL_DEF_DRV(XE_EXEC_QUEUE_SET_PROPERTY,
> >>> xe_exec_queue_set_property_ioctl,
> >>>                 DRM_RENDER_ALLOW),
> >>>       DRM_IOCTL_DEF_DRV(XE_WAIT_USER_FENCE, xe_wait_user_fence_ioctl,
> >>> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> >>> index 3ccc0af4430b..e636e3f3456d 100644
> >>> --- a/drivers/gpu/drm/xe/xe_mmio.c
> >>> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> >>> @@ -422,108 +422,6 @@ int xe_mmio_init(struct xe_device *xe)
> >>>       return 0;
> >>>   }
> >>>
> >>> -#define VALID_MMIO_FLAGS (\
> >>> -    DRM_XE_MMIO_BITS_MASK |\
> >>> -    DRM_XE_MMIO_READ |\
> >>> -    DRM_XE_MMIO_WRITE)
> >>> -
> >>> -static const struct xe_reg mmio_read_whitelist[] = {
> >>> -    RING_TIMESTAMP(RENDER_RING_BASE),
> >>> -};
> >>> -
> >>> -int xe_mmio_ioctl(struct drm_device *dev, void *data,
> >>> -          struct drm_file *file)
> >>> -{
> >>> -    struct xe_device *xe = to_xe_device(dev);
> >>> -    struct xe_gt *gt = xe_root_mmio_gt(xe);
> >>> -    struct drm_xe_mmio *args = data;
> >>> -    unsigned int bits_flag, bytes;
> >>> -    struct xe_reg reg;
> >>> -    bool allowed;
> >>> -    int ret = 0;
> >>> -
> >>> -    if (XE_IOCTL_DBG(xe, args->extensions) ||
> >>> -        XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
> >>> -        return -EINVAL;
> >>> -
> >>> -    if (XE_IOCTL_DBG(xe, args->flags & ~VALID_MMIO_FLAGS))
> >>> -        return -EINVAL;
> >>> -
> >>> -    if (XE_IOCTL_DBG(xe, !(args->flags & DRM_XE_MMIO_WRITE) &&
> >>> args->value))
> >>> -        return -EINVAL;
> >>> -
> >>> -    allowed = capable(CAP_SYS_ADMIN);
> >>> -    if (!allowed && ((args->flags & ~DRM_XE_MMIO_BITS_MASK) ==
> >>> DRM_XE_MMIO_READ)) {
> >>> -        unsigned int i;
> >>> -
> >>> -        for (i = 0; i < ARRAY_SIZE(mmio_read_whitelist); i++) {
> >>> -            if (mmio_read_whitelist[i].addr == args->addr) {
> >>> -                allowed = true;
> >>> -                break;
> >>> -            }
> >>> -        }
> >>> -    }
> >>> -
> >>> -    if (XE_IOCTL_DBG(xe, !allowed))
> >>> -        return -EPERM;
> >>> -
> >>> -    bits_flag = args->flags & DRM_XE_MMIO_BITS_MASK;
> >>> -    bytes = 1 << bits_flag;
> >>> -    if (XE_IOCTL_DBG(xe, args->addr + bytes > xe->mmio.size))
> >>> -        return -EINVAL;
> >>> -
> >>> -    /*
> >>> -     * TODO: migrate to xe_gt_mcr to lookup the mmio range and handle
> >>> -     * multicast registers. Steering would need uapi extension.
> >>> -     */
> >>> -    reg = XE_REG(args->addr);
> >>> -
> >>> -    xe_device_mem_access_get(xe);
> >>> -    xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> >>> -
> >>> -    if (args->flags & DRM_XE_MMIO_WRITE) {
> >>> -        switch (bits_flag) {
> >>> -        case DRM_XE_MMIO_32BIT:
> >>> -            if (XE_IOCTL_DBG(xe, args->value > U32_MAX)) {
> >>> -                ret = -EINVAL;
> >>> -                goto exit;
> >>> -            }
> >>> -            xe_mmio_write32(gt, reg, args->value);
> >>> -            break;
> >>> -        default:
> >>> -            drm_dbg(&xe->drm, "Invalid MMIO bit size");
> >>> -            fallthrough;
> >>> -        case DRM_XE_MMIO_8BIT: /* TODO */
> >>> -        case DRM_XE_MMIO_16BIT: /* TODO */
> >>> -            ret = -EOPNOTSUPP;
> >>> -            goto exit;
> >>> -        }
> >>> -    }
> >>> -
> >>> -    if (args->flags & DRM_XE_MMIO_READ) {
> >>> -        switch (bits_flag) {
> >>> -        case DRM_XE_MMIO_32BIT:
> >>> -            args->value = xe_mmio_read32(gt, reg);
> >>> -            break;
> >>> -        case DRM_XE_MMIO_64BIT:
> >>> -            args->value = xe_mmio_read64_2x32(gt, reg);
> >>> -            break;
> >>> -        default:
> >>> -            drm_dbg(&xe->drm, "Invalid MMIO bit size");
> >>> -            fallthrough;
> >>> -        case DRM_XE_MMIO_8BIT: /* TODO */
> >>> -        case DRM_XE_MMIO_16BIT: /* TODO */
> >>> -            ret = -EOPNOTSUPP;
> >>> -        }
> >>> -    }
> >>> -
> >>> -exit:
> >>> -    xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> >>> -    xe_device_mem_access_put(xe);
> >>> -
> >>> -    return ret;
> >>> -}
> >>> -
> >>>   /**
> >>>    * xe_mmio_read64_2x32() - Read a 64-bit register as two 32-bit reads
> >>>    * @gt: MMIO target GT
> >>> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> >>> index 86f16d50e9cc..6c6d1cfa415a 100644
> >>> --- a/include/uapi/drm/xe_drm.h
> >>> +++ b/include/uapi/drm/xe_drm.h
> >>> @@ -106,11 +106,10 @@ struct xe_user_extension {
> >>>   #define DRM_XE_EXEC_QUEUE_CREATE        0x06
> >>>   #define DRM_XE_EXEC_QUEUE_DESTROY        0x07
> >>>   #define DRM_XE_EXEC            0x08
> >>> -#define DRM_XE_MMIO            0x09
> >>> -#define DRM_XE_EXEC_QUEUE_SET_PROPERTY    0x0a
> >>> -#define DRM_XE_WAIT_USER_FENCE        0x0b
> >>> -#define DRM_XE_VM_MADVISE        0x0c
> >>> -#define DRM_XE_EXEC_QUEUE_GET_PROPERTY    0x0d
> >>> +#define DRM_XE_EXEC_QUEUE_SET_PROPERTY    0x09
> >>> +#define DRM_XE_WAIT_USER_FENCE        0x0a
> >>> +#define DRM_XE_VM_MADVISE        0x0b
> >>> +#define DRM_XE_EXEC_QUEUE_GET_PROPERTY    0x0c
> >>>
> >>>   /* Must be kept compact -- no holes */
> >>>   #define DRM_IOCTL_XE_DEVICE_QUERY        DRM_IOWR(DRM_COMMAND_BASE
> >>> + DRM_XE_DEVICE_QUERY, struct drm_xe_device_query)
> >>> @@ -123,7 +122,6 @@ struct xe_user_extension {
> >>>   #define DRM_IOCTL_XE_EXEC_QUEUE_GET_PROPERTY
> >>> DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_GET_PROPERTY, struct
> >>> drm_xe_exec_queue_get_property)
> >>>   #define DRM_IOCTL_XE_EXEC_QUEUE_DESTROY
> >>> DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_DESTROY, struct
> >>> drm_xe_exec_queue_destroy)
> >>>   #define DRM_IOCTL_XE_EXEC             DRM_IOW(DRM_COMMAND_BASE +
> >>> DRM_XE_EXEC, struct drm_xe_exec)
> >>> -#define DRM_IOCTL_XE_MMIO            DRM_IOWR(DRM_COMMAND_BASE +
> >>> DRM_XE_MMIO, struct drm_xe_mmio)
> >>>   #define DRM_IOCTL_XE_EXEC_QUEUE_SET_PROPERTY
> >>> DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_SET_PROPERTY, struct
> >>> drm_xe_exec_queue_set_property)
> >>>   #define DRM_IOCTL_XE_WAIT_USER_FENCE
> >>> DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct
> >>> drm_xe_wait_user_fence)
> >>>   #define DRM_IOCTL_XE_VM_MADVISE
> >>> DRM_IOW(DRM_COMMAND_BASE + DRM_XE_VM_MADVISE, struct drm_xe_vm_madvise)
> >>> @@ -883,27 +881,6 @@ struct drm_xe_exec {
> >>>       __u64 reserved[2];
> >>>   };
> >>>
> >>> -struct drm_xe_mmio {
> >>> -    /** @extensions: Pointer to the first extension struct, if any */
> >>> -    __u64 extensions;
> >>> -
> >>> -    __u32 addr;
> >>> -
> >>> -#define DRM_XE_MMIO_8BIT    0x0
> >>> -#define DRM_XE_MMIO_16BIT    0x1
> >>> -#define DRM_XE_MMIO_32BIT    0x2
> >>> -#define DRM_XE_MMIO_64BIT    0x3
> >>> -#define DRM_XE_MMIO_BITS_MASK    0x3
> >>> -#define DRM_XE_MMIO_READ    0x4
> >>> -#define DRM_XE_MMIO_WRITE    0x8
> >>> -    __u32 flags;
> >>> -
> >>> -    __u64 value;
> >>> -
> >>> -    /** @reserved: Reserved */
> >>> -    __u64 reserved[2];
> >>> -};
> >>> -
> >>>   /**
> >>>    * struct drm_xe_wait_user_fence - wait user fence
> >>>    *
> >>
> >> I would prefer to keep this ioctl for debug, or an equivavlent
> >> alternative. We can remove the timestmap part but keep the general mmio
> >> ioctl interface for 'CAP_SYS_ADMIN' access only.
> >> Any objections?

Well, one general roadblock is that the DRM subsystem rules don't allow
adding ABI without a real, open-source userspace consumer.  Not only do
we not have a "real" consumer for this ioctl itself, but we also don't
even want to give anyone the impression that we have a backdoor
interface to allow non-opensource userspace to go behind the driver's
back and start controlling the hardware.  Userspace can still obviously
do that by running as root and mapping the BAR directly, but they're not
using official driver uapi at that point, and there are potentially
other ways that a sysadmin can close those holes if necessary.

> >
> > CAP_SYS_ADMIN can already map the bar and do the reads and
> > writes. What's the benefit of going through the kernel?
> >
> > Lucas De Marchi
> >
> >>
> >> Ofir
> 
> Some register read/write requires driver involvement, for example
> disabling clock gating or going through a register gateway.
> In addition, if a user would like to access directly through the bar he
> will need to be aware of the exact bar mapping. It is preferable that
> the user will be able to ask for read/write from/to a specific MMIO
> address and the driver will map it to the proper offset in bar.

Are you using the term "user" to describe the userspace _software_ or
the person sitting at the computer?  If the latter, then we don't need
this ioctl at all; the "intel_reg" tool from IGT has provided this kind
of functionality on i915 for years; it's a simple command-line tool that
can be used with commands like:

        intel_reg read 0x1234
        intel_reg write 0x5678 0xabcd

The tool uses libpciaccess under the hood to map the BAR, and can
perform other necessary pre/post operations (like grabbing releasing
forcewake to make sure the register is accessible).

If you're using "user" to refer to the userspace _software_ (e.g., IGT's
xe_reg debug tool which is using the ioctl right now), then there's even
more incentive to move away from the ioctl --- the ioctl interface we
have today already has a bunch of limitations that make it less useful
than it should be for debugging:

 * There's no way to specify/access registers on non-tile0.
 * There's no way to specify that you do/don't want it to do the "extra"
   steps like you describe (e.g., automatically grabbing forcewake is
   convenient a lot of the time, but if you're actually trying to debug
   forcewake itself, then the ioctl's automatic behavior just gets in
   your way).

While the ioctl could theoretically be extended to overcome these
limitations, we still shouldn't really be building up ABI like that for
debug purposes without real userspace consumers, especially if we have a
viable alternative that's been used for a long time.  It's relatively
simple for tools like intel_reg and xe_reg to just use libpciaccess to
map the BAR, figure out the appropriate offset, and then optionally
perform other operations (like forcewake) according to whatever options
were passed on the command line.  With debug tools it's especially
likely that we'll come up with new behaviors that we want to add (e.g.,
handle display register accesses via msgbus transactions on MTL/LNL?)
and it would be better if we didn't need to keep extending the ioctl
uapi and ABI for these debug-only purposes).


Matt

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation

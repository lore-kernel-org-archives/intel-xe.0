Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C89CCEB64D9
	for <intel-xe@archiver.kernel.org>; Thu, 15 Jun 2023 20:20:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1AF010E53E;
	Thu, 15 Jun 2023 20:20:42 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 422A910E53E
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Jun 2023 20:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686860441; x=1718396441;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=5XWpCB8AjeaJAsHc7lnjKNnffbZI7y6vZgiMpmDCxRU=;
 b=S9FJ6LcyjuMmG8n9LqW2hrmNHTD/HHLSViU1DedD8t4d0mDE54c9zz34
 nYcvLw8TFoUWDbKv5IsST9pbGuOkBxN95zIhLg8jh4droX6FWI+7Vph4J
 zlm3KUVKmfhyoFGzHxtCtLxZR5dFazq+KWYqvsFCUiyZHVlHbYOrf01z9
 6Q6QQjDIb46xHviYKegqoh7tPd0bGCDS8ddE2vWbLKmf2fdSVkbAB8BZo
 GiXmkl66IBwSplcndqZAPFgd3egls0lEgfyGPJYocf3qvT92vQFR524fu
 XURBnB/5BK8Cu9mM9kvKoqc7W3h69rRd/kJtJz3P3d9IKA6v3CCXdTG3V Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="343771057"
X-IronPort-AV: E=Sophos;i="6.00,245,1681196400"; d="scan'208";a="343771057"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2023 13:20:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="836762159"
X-IronPort-AV: E=Sophos;i="6.00,245,1681196400"; d="scan'208";a="836762159"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga004.jf.intel.com with ESMTP; 15 Jun 2023 13:20:40 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 15 Jun 2023 13:20:39 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 15 Jun 2023 13:20:39 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.108)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 15 Jun 2023 13:20:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S6TxkY/Fogy1B6EbQQzAVvHZY/VKWO3vTk7+QcEYyp6X02EmXsjShh/0E++t0j/u+n1ydeTcaLJFQ14CKDeD+DWXFx1ckluAex+t2APg5zggAUYccAkmzrpiZ/9Ndj1xVz0Bm/i5T6UIOf6d3LgzWQivq0VLxpHd79pc81IrAVaF4rIqPHTWHM4g1Geh4NwBjzB5Ph5RaEXEk8sQlkk7YtW83hQyK3JPvagt4jG5CX40pNkEj6vSNkkK8hR1qx1Nmnw9/+rWVLUmErnwEltEmmLQkH66c/LbQNBQb21e8iO70eXgybIDsCCoW4F7URd4ZJdc8qjJxvnSNFUkCZKKAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CdlTy8CO5NcMFlZ4zTh+bs4AlDjD9dM9k5GzbdVOqrY=;
 b=KL3oXbBeI/KgD4s4tGHo9vocN6ODNCkijX2AdjxP+uchxbEvJXEuJ2rCtLsjxm8we1EKlrNPDwNcCcntgUlyLKh+AtwFLatYbOgZ1yiKRzT8+v5JfEPzji3KKHoKzul2BzWBT9UlSSOOc2X5HCB2lP0L5IZFXI3mA7XhP/A1PKnDV03EX9/n0bYqPGLC9BhGuxcbKyq2SO+CgyHlT7VNEijEGfUISYJH2KlF3phXX6D/C7OTy+tBqIXcqorr9Eet1jhSGm1+j9liBKs0nP9JQWbsYgctTw9TW5DSl4a+WiFt97Kd5iodPRIm0PRVIoSZYiGNXMiFYjKuUf5Xd8u7Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 SA2PR11MB5099.namprd11.prod.outlook.com (2603:10b6:806:f9::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6477.37; Thu, 15 Jun 2023 20:20:37 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396%6]) with mapi id 15.20.6455.043; Thu, 15 Jun 2023
 20:20:37 +0000
Date: Thu, 15 Jun 2023 13:20:33 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Matthew Auld <matthew.william.auld@gmail.com>
Message-ID: <20230615202033.GX5433@mdroper-desk1.amr.corp.intel.com>
References: <20230614200445.3363527-1-matthew.d.roper@intel.com>
 <CAM0jSHNkKHgyuSUAAHEurhGi2ufhgnyDod0fhaXjTgUFEh6arw@mail.gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAM0jSHNkKHgyuSUAAHEurhGi2ufhgnyDod0fhaXjTgUFEh6arw@mail.gmail.com>
X-ClientProxiedBy: SJ0PR05CA0026.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::31) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|SA2PR11MB5099:EE_
X-MS-Office365-Filtering-Correlation-Id: c3180d77-9835-4435-8ce6-08db6dddfabb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4qxjlHkpAY0chq+fn7rgjFZ3/WI+W0fe8RxB6Qku12RAtTvNQgTOor5ipnG5Jbea7ewCFGiyj10XqaXmjQB0jwP2bciZcR7bmFNMIfbwTnJM945TpI8B6PQnJDmYNHK2nfwO6iSFdcO64tbzSwCB8tMj9yq4UD1oWbcPS4fUqLC+cHQZPh16N8mqehEf84zZAZozh2fSWdtDr4LRpI+O4+qzHwt0e/WlVZgxy0YLkJk5Uz77VsVIFxPYAV0xo1CEnIvH9z5IonOnf0ByYj9VloBqSGQxgGwYR31j/yFDQ8fSY1mqZ68v8Zhqe6gQbMGuuCMAOcAMOqR4y4ZXAE/Ipli9svMz3Sn3MaS+t1jraZ3VPpiAxzP6s0qpMgoydGUiaGH1BNXnV0e31ldwYP43jqv5l6YU5B8geLJ5zypaxpPeL7faQQLrnLBkgfxqp5TPdUMKWA9wKRWgXgRu7uYzWK5DAT7Q2HEOfs0TWpgZ2Lv4rKMOciRgEUeD8cMP0KmqXGxFEUIJajK83oCl5KT8Tg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(39860400002)(346002)(366004)(396003)(136003)(451199021)(26005)(6506007)(6512007)(186003)(966005)(6486002)(5660300002)(1076003)(8936002)(83380400001)(41300700001)(4326008)(316002)(2906002)(8676002)(6916009)(6666004)(66476007)(66556008)(66946007)(478600001)(86362001)(33656002)(38100700002)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uwS+DswB/HMI3ZWIPd85rYHK1G90Jg8QiwBUdb0w5X5rHEzRt44HlnurV/Xh?=
 =?us-ascii?Q?eM9DXfwoOg4CGMUo129ot9FcY+4TZh6IoQtfSxLKH4PNOKhjxz1KqYYroAe6?=
 =?us-ascii?Q?t/RBE978qWrfbPf5PXwlqz1UIrLMEfCIM//GPRgpwVv+RQyQp2X+PeCamJoQ?=
 =?us-ascii?Q?9mlT097kLfExZefZpVWtNG1H6IjQyIqBC1c/DHAWzdi8twVc5/lltujpIvsy?=
 =?us-ascii?Q?OttCbtuysbk5OTr82xMlQ6SstTNRpO2Ft+URqtWJWdeJEYSqUuSFqn7C1G9I?=
 =?us-ascii?Q?cSRVN3GnNq0LXei2UF/Mr2MicrnyqdGchzFTWomFYcsiC6tg4/i9UM+0Hgaw?=
 =?us-ascii?Q?6nObUzFBEykfEGVe1IeIf/GSB0PZ2mHfAYwbCN6t4FpMbwZCCiZL2I5FYEuJ?=
 =?us-ascii?Q?hlW2THQRJenvc0jdSD/B2XmApVeoDyeXsO6hWnE+9N0ExJFAAKlw02hQ927/?=
 =?us-ascii?Q?S2A5WIPnRD0JSIBWgFNRQZWgsoylXggpyu8rR93WAwuWJcrJm6IwEPmw1/85?=
 =?us-ascii?Q?UZkgI81/juHYtwJi6xBJePQoqrfgF96TCp1Tk7RTXqg0KpM9gyfAIY78CJmU?=
 =?us-ascii?Q?jG8WVPyFDXSkMP/zj/o5hXv9Q9kSE7mtstvcweYNaeuA3hfpmrku/mEdRjvH?=
 =?us-ascii?Q?QpmhO016jKiSodGg+7dMXNbqS+bUS6AMyOAKhgQYM6YCl32A1vTxScXqh4+a?=
 =?us-ascii?Q?TQNHV22p9LvkhkrDu81IARFW5TldfHPyuSN3wKxu057KqxlKYOUSK9uOJluI?=
 =?us-ascii?Q?rUQ4LXsEOHxcKMIzcRpuSRjBuXu8ttwsx+0clvhxIPk5qbakjuFshGVkTMAT?=
 =?us-ascii?Q?anQPIB4zXsyYG80PNNTiqlZdlwd4csRNf6JmWeaH3u6PNtI05x2Klz+QEzvI?=
 =?us-ascii?Q?P045aGghRDst2iHObVrg/YKRplyox/8UFhy1pI69Drkjar9gi2VUUhPcyOcM?=
 =?us-ascii?Q?BnOu4xfAVmJCyLLl85RX2alOUNAybYhROPum7g7Mmh4zPAuBFz5u8hFINASE?=
 =?us-ascii?Q?rAVQcCeVyhqYz7x4rGYDK1fPYExomKYFzJsM0mwUVG9wzaTQwx09QnSDNN6j?=
 =?us-ascii?Q?5E6Vjmn2XFxdCIJtW9MpXKAmJQ6c5JsjYPbYPlIA77xzArInI2aADCT1jacB?=
 =?us-ascii?Q?iley5O8sCh65UCx1aq1gTocXlXwoh3ewYlOzaT7OyxLPAi57Eh/yVw+O0wLL?=
 =?us-ascii?Q?WnfG2AyhOPeJEAFMBDu/Kk5lWxit00N+oUPXvOzpdVcnVw6z8PnEr3yhIYNI?=
 =?us-ascii?Q?yiTKMui+qRxIQzXD/a4QbTw3HzFASRwvMRfpQBJBbA784Kh1gehbHgBRwG9n?=
 =?us-ascii?Q?KjEu5jl/FSwRgFBLkI2svv3+s1ywAbD8UJhmyvhbCAr0t00WXMoOI483xM3S?=
 =?us-ascii?Q?jjLIlSczmW6zaoF9HaP0oAWU3Fg+/5Tn8kYJK8jFS07QZvWIJdmj6PuvelOo?=
 =?us-ascii?Q?+GBItDcYJp/QvybaetK6iHRoMKmWJFFMaflGuQkxektVFKHyWtRMm0n29Z4V?=
 =?us-ascii?Q?Lherdhxd1ebG3EJHQpBw8EVc91rWHRjfwbQ28N5kyEquuM5/52PhMvNYaabc?=
 =?us-ascii?Q?U6zEHrWPOfjXm4BgXUsSakQGcV7Y8ViyviV7loRNaTc0GuvdhGZWyBBvn5vc?=
 =?us-ascii?Q?gw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c3180d77-9835-4435-8ce6-08db6dddfabb
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2023 20:20:36.7172 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t9og+4k5/0sC0DLxzIKk6OUX9wLG16yoo+mCv8NrUm9UpuQiVktu/VJh3OU5k0mOMoLIZiQkOHhvnFxGqZkzKhKVmxD75ONfs60MX9FJQ0Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5099
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Grab runtime PM over MMIO ioctl
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

On Thu, Jun 15, 2023 at 09:42:03AM +0100, Matthew Auld wrote:
> On Wed, 14 Jun 2023 at 21:04, Matt Roper <matthew.d.roper@intel.com> wrote:
> >
> > The MMIO ioctl (which is generally used from IGT's xe_reg tool) may be
> > called while the device is in D3, resulting in invalid results (i.e.,
> > all registers read back as 0xFFFFFFFF, writes are dropped).  Make sure
> > we grab runtime PM wakeref before performing register reads/writes.
> >
> > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> 
> AFAIK we should use mem_access_get() for MMIO:

I thought mem_access_get() was specifically for memory access (like we
needed for a special workaround on some early steppings of PVC); is it
intended to be used for all devices accesses, not just memory now?  If
so we might want to rename it to something more accurate like
'mmio_access_get' (and also add some kerneldoc explaining when/why it
would be used instead of the standard runtime PM).

Actually, I'm having trouble understanding what mem_access_get is trying
to do.  It seems like it's trying to avoid using the runtime PM's
refcounting and is turning it into a boolean on/off instead, which makes
things a bit racy.  It's not obvious to me why we're trying to work
around the refcount design?


Matt

> https://patchwork.freedesktop.org/patch/542124/?series=119213&rev=1
> 
> But that requires first fixing the races with mem_access which is
> quite involved, so perhaps using runtime_get() directly here is fine
> for now. We can just replace the instance here with mem_access once
> that's ready.
> 
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> 
> > ---
> >  drivers/gpu/drm/xe/xe_mmio.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> > index f7a7f996b37f..5f4c8ae23771 100644
> > --- a/drivers/gpu/drm/xe/xe_mmio.c
> > +++ b/drivers/gpu/drm/xe/xe_mmio.c
> > @@ -19,6 +19,7 @@
> >  #include "xe_gt_mcr.h"
> >  #include "xe_macros.h"
> >  #include "xe_module.h"
> > +#include "xe_pm.h"
> >
> >  #define XEHP_MTCFG_ADDR                XE_REG(0x101800)
> >  #define TILE_COUNT             REG_GENMASK(15, 8)
> > @@ -476,6 +477,7 @@ int xe_mmio_ioctl(struct drm_device *dev, void *data,
> >          */
> >         reg = XE_REG(args->addr);
> >
> > +       xe_pm_runtime_get(xe);
> >         xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> >
> >         if (args->flags & DRM_XE_MMIO_WRITE) {
> > @@ -519,6 +521,7 @@ int xe_mmio_ioctl(struct drm_device *dev, void *data,
> >
> >  exit:
> >         xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> > +       xe_pm_runtime_put(xe);
> >
> >         return ret;
> >  }
> > --
> > 2.40.1
> >

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation

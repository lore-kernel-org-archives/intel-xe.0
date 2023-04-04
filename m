Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81889C761A6
	for <intel-xe@archiver.kernel.org>; Tue,  4 Apr 2023 16:29:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F8D710E002;
	Tue,  4 Apr 2023 16:29:18 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3F9110E002
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Apr 2023 16:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680625756; x=1712161756;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=tZcGhVqSApyVqcmxIgQbv0A3497KmfHpEvscZWR5NwM=;
 b=cOjZX8PY5IEpQ1shHa87gyrxysFYpxF/OZeQwexMY4coc4ac6O8iJ4KT
 PGBO34Xv6wJEyp5m0EBYn82sSOWRMVqNTlWOJLfHiMD6dk51myZB+Je81
 4V6p3mOq0pdDO//2PfHgigTRFzI+6hGPbvU5WilDeJK6Tgvxla/Vrn9Hh
 Xq74HiQvsZTRK9KNyBWSTH+y0IerTMEClVAcT7EBUo5FPQvKsVyOgK7KD
 WtPrQTrv4rke+XpNQiPkWNiOUVcHwAPua0HYiDivwyjNd7165xZ7iIfER
 b1yI5hGyL9d6hl2LUug66Wu9uG2OothIfvT2WQ6K/eIS9dHRMZXFrRlTQ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="343941781"
X-IronPort-AV: E=Sophos;i="5.98,318,1673942400"; d="scan'208";a="343941781"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 09:29:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="686422790"
X-IronPort-AV: E=Sophos;i="5.98,318,1673942400"; d="scan'208";a="686422790"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga002.jf.intel.com with ESMTP; 04 Apr 2023 09:29:08 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 4 Apr 2023 09:29:08 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Tue, 4 Apr 2023 09:29:08 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.103)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 4 Apr 2023 09:29:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jncGuvfSrjTDcPMXn+7pHsRaxoVrE7p+5ZSpt77UqdET6UfqEcpyJh6Iv3mgW7wI+wFVV4dRDqmnZH7SShBNi7j9bUgFpJvmvMQg1hGEwT7HEvjoGkbmXpd7KNXPMdakSYLjMIM8OY0LUqbsy4EN8Pinta64+khyzsL7cVaGEcXW+uurZV2KCpQY6KC/Enl5aMgkdjPuD8+BL5hLEsQPaT8WX/gTqHCldFaVqnrNmPh3vIGJSvrcjmW3mnkv5LXYua5YPUzPscRnzTY6WkqQVMPMFcUkBDW7CkGYQH7+x/ym8+++zCnUzI11VqmmjuAIdKjfBiNDoDHLAUuFGjqX8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9CGYYC9z1C7yry0cDPxZ82hrTzNOHN91184NVRquK8Q=;
 b=GYM1NUgIdIEr42QNEIgTnKeKJIjlmevdzlFxdyEvmL0eX2WKMZg4+n5VJEnE+fCkKuW9NjCIUwkAfC4uo1DTcFlAMzbGXj+n0+4jNjjMZ9z1ybAgUHSJRzcocls1FXp1Gg0eJJCXsG0hhZS8c5ws0tc0pvDsziWsQRBrb3xadgKague4MuveBcZbmzsy8jM04zdHXjz+j3n/Vfgd13ETvpfFCn3NiZ3ntRpTYkIzpdFTU3SUNzjKRRFrXvmqSt6c6jC9wvNPhzyRWfzNXVfe+GYY3kR6tqRL/68BDcF5A7zf5ISZPt5I5xv24slirV8bjdFQrMeAxMBbIiofOrNdEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CO1PR11MB4932.namprd11.prod.outlook.com (2603:10b6:303:98::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Tue, 4 Apr
 2023 16:29:05 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::2b57:646c:1b01:cd18]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::2b57:646c:1b01:cd18%9]) with mapi id 15.20.6254.033; Tue, 4 Apr 2023
 16:29:05 +0000
Date: Tue, 4 Apr 2023 12:29:00 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Message-ID: <ZCxQTG1+z698Pac+@intel.com>
References: <20230403222031.4255-1-yu.bruce.chang@intel.com>
 <ZCudEneYy6bOCqCa@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZCudEneYy6bOCqCa@DUT025-TGLU.fm.intel.com>
X-ClientProxiedBy: SJ0PR03CA0140.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::25) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CO1PR11MB4932:EE_
X-MS-Office365-Filtering-Correlation-Id: c24ee665-938a-4141-2d8a-08db3529b4db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0wQaAFy9JkH8rYl3qQ5vOydZINqsvaBHuakj/+mz5aWN94OWwoT09Y+7VTZ9W0NN8GZR6bIbrXEHJx4JvOQSDGyI3SF06F1czhZsLYSCwRaXXlK0XPJBGPe/PEAHhTqofB61FEjJPTnOEFZw+sth6DyvP0/J7FW4G3PdeqwNIJE86RTkpvfwFftO+tRM41/Lfmev5G3CEYwS/SiekRJSoj1hLwRiCobc7PDh6Z0ADFGfo03iIL1H+pEHTcE3lgfEryi5zhZp7HNz14GJqQCY7BeuClZxn8QY+ygPnLF6Dq5HfKPgHxlfHd8jUEHosv6q8MIWErlpXWFF/+E7lxS8H8yEEA3a0XGVf6JNOzPUZ2Aah9luhRHkDbnvK40Ow3GwTr8XycQxl1u9yP9jd9ToPcdg6SoQ9QVt8o2T5bzrPynuoOU15Stn9QkAw+85nRCeutA2Vu6vG+QvrmfGCWrfkNqGCK9X9k6HW8if1cAa+OKIDr3WY3A0Faqd9IIrlrADvdG/UOIxkiFMGAiciW/7mLne7owGEz2wGKyIBV5z/mr7mQvk3f7+4zmNxTsYJJjQ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(39860400002)(366004)(346002)(396003)(376002)(451199021)(6486002)(54906003)(66946007)(66556008)(66476007)(8676002)(41300700001)(4326008)(36756003)(6636002)(478600001)(37006003)(316002)(86362001)(83380400001)(38100700002)(6506007)(6666004)(186003)(2616005)(82960400001)(6512007)(2906002)(6862004)(5660300002)(26005)(8936002)(44832011)(30864003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?eASJDa214k9XRKPghsngW2h0SVKaILL3/n2ZYeWtM4TRUl0RTSOdVGNvUH?=
 =?iso-8859-1?Q?0yfu7x/IdtSumrhK0yHr9iYOCjsCwVroTGvAX+EuN1IyqICbS9k+VX6G0Y?=
 =?iso-8859-1?Q?tEwRaOrhAz8hMDSUaBgUjxaPQiYU8vbhlPOHjMrjN9rmKWmhY/GQOn55Lk?=
 =?iso-8859-1?Q?EVnXjM86JULdedxYg1759MXa2Y8OYLnuCh1op+kkej6hIeUntFQavqx7u0?=
 =?iso-8859-1?Q?sxvJEcFa2nwl8VvpGk8Oio9ESYGY3xeQFodgh54ZXSQIFNcN0pHa50s3vm?=
 =?iso-8859-1?Q?9K1Iu++g/AOARtmGkLQwRQaVxFvPMJ2Eqr0iEnK9TL4fJV4TB/otU0sh1n?=
 =?iso-8859-1?Q?Jy61CxxKnNzCSXJDlepUMjIivv181JV7NnUB1s1aX0JpD6Yqa+R8lBi95v?=
 =?iso-8859-1?Q?TWutoHFzhnbof+3SY92xFpe2puoUN1uEfSsUOYld/dsGrCLzHrLVv8Gt0h?=
 =?iso-8859-1?Q?a3/WKk2xXYFXJBcsokx9b2DISTM+9wfNttzvPgVE3cL/bhOJ0ZhRbQPflH?=
 =?iso-8859-1?Q?Qni8GQA6EkQf/8xxgq88Lqd2mQAgVhmmMfaqoqMXxc6kwj5BQC1iXY+UNK?=
 =?iso-8859-1?Q?glw3D5pQ4ZISmDruMGai6j4er5sPpVq8ygXHj5fHmWElFZJByp+fAIF/g4?=
 =?iso-8859-1?Q?6+G50P0YJEb8RuhoAVckRQis0e4hqgm+PPDI8R62e+vF/YPWtuqnyI1UMt?=
 =?iso-8859-1?Q?vxAupQ3asgcuG9mE7O4dc89+o3lC22jtxFduw0zcXr/OqQnp3KyGCtLp2d?=
 =?iso-8859-1?Q?pgbywMInMBVaaetMPMEDf+WLHtsJ4SuiR+pW9Z6DIAZkRru8khkMrqkyvr?=
 =?iso-8859-1?Q?aMFTDj6Xw5wC2iMDUy3jESjk/q8ArO0B3WlrOv8j02q/p09uSbiZRW3tAw?=
 =?iso-8859-1?Q?YBVHFLiC4Y+q9R4mc3oolrhKkPRqcSGn7LrC/maL3zGwvIQoBaUr3MRII1?=
 =?iso-8859-1?Q?0ig43G0TpqgQhlc3unxs1BmHGLHJqLYDuf1YRILHtTuk5NtU+god/RUJJu?=
 =?iso-8859-1?Q?aJjzdvA3T7Zm1unTZzJyA9DWl7EUyHGR7W0qKC8qOAu8Ng3O/zAdW6RYVd?=
 =?iso-8859-1?Q?cmqx9F2fWIND/tcfGy8vdRO3bk6gshObZtf5nApmDwxahgYWSJSy0nFcJN?=
 =?iso-8859-1?Q?2ArRg/MCQokghP0u572/eTMHeNSZi5n+xy9/Vinwf90T0gTBw3SCTNU61Z?=
 =?iso-8859-1?Q?O98FubIMd9V66G+EW/NJ7CttqoXde3fbtaQiRZV1T3QWVwVD+LDKSUKd/l?=
 =?iso-8859-1?Q?zGk+lFjDvnJN1/iJwv8h8I45ohs/HeyzHV1op355gkA/QYFQM+MvfgleHd?=
 =?iso-8859-1?Q?bqoTa5+Am5M0l3y6iM1gLOOfNWe/HodPbkv6gGqklNOKfzYdAI/NF9IGcN?=
 =?iso-8859-1?Q?fPWxEFVF0WqRL2LsWMBOa5MUeP2BCLrWyhskY0of5Sd66PSC1FkpMuzzxu?=
 =?iso-8859-1?Q?7z8FjOrJUUDqt29XAoG1dTHhEvT+bEMKu0XdCOHZHh/fWeFWThkiynqHp7?=
 =?iso-8859-1?Q?p7p4c7ME7zY39hdjpZyF4pKWidCow1PkzaPaqVwbvKHXUFu0TASRJ1sLGN?=
 =?iso-8859-1?Q?f4an6E+i46sM4y0tSm0nkoDU6bknmb0IBX5KXocWcgI1QWHlkafB1T0Msg?=
 =?iso-8859-1?Q?wPXHdlEfyomdrUNrFVmfS/er2ItKO2EGSm?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c24ee665-938a-4141-2d8a-08db3529b4db
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2023 16:29:05.1305 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: whyge0pE6CbRo6IAWHrLaY1wE6jD2aGOTR3eyOeH9DPcao+boBB7FIbMD+S1axOUCV3gO9zfOCVtH0tTGqzFNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4932
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: fix pvc unload issue
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
Cc: Stuart Summers <stuart.summers@intel.com>, Vivi@dut025-tglu.fm.intel.com,
 "Chang, Bruce" <yu.bruce.chang@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Apr 04, 2023 at 03:44:18AM +0000, Matthew Brost wrote:
> On Mon, Apr 03, 2023 at 10:20:31PM +0000, Chang, Bruce wrote:
> > Currently, unload pvc driver will generate a null dereference
> > and the call stack is as below.
> > 
> > [ 4850.618000] Call Trace:
> > [ 4850.620740]  <TASK>
> > [ 4850.623134]  ttm_bo_cleanup_memtype_use+0x3f/0x50 [ttm]
> > [ 4850.628661]  ttm_bo_release+0x154/0x2c0 [ttm]
> > [ 4850.633317]  ? drm_buddy_fini+0x62/0x80 [drm_buddy]
> > [ 4850.638487]  ? __kmem_cache_free+0x27d/0x2c0
> > [ 4850.643054]  ttm_bo_put+0x38/0x60 [ttm]
> > [ 4850.647190]  xe_gem_object_free+0x1f/0x30 [xe]
> > [ 4850.651945]  drm_gem_object_free+0x1e/0x30 [drm]
> > [ 4850.656904]  ggtt_fini_noalloc+0x9d/0xe0 [xe]
> > [ 4850.661574]  drm_managed_release+0xb5/0x150 [drm]
> > [ 4850.666617]  drm_dev_release+0x30/0x50 [drm]
> > [ 4850.671209]  devm_drm_dev_init_release+0x3c/0x60 [drm]
> > 
> > There are a couple issues, but the main one is due to TTM has only
> > one TTM_PL_TT region, but since pvc has 2 tiles and tries to setup
> > 1 TTM_PL_TT each tile. The second will overwrite the first one.
> > 
> > During unload time, the first tile will reset the TTM_PL_TT manger
> > and when the second tile is trying to free Bo and it will generate
> > the null reference since the TTM manage is already got reset to 0.
> > 
> > The fix is to use one global TTM_PL_TT manager.
> > 
> > v2: make gtt mgr global and change the name to sys_mgr
> > 
> > Cc: Stuart Summers <stuart.summers@intel.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: Vivi, Rodrigo <rodrigo.vivi@intel.com>
> > Signed-off-by: Bruce Chang <yu.bruce.chang@intel.com>
> 
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>

pushed to drm-xe-next. Thanks for the patch and review.

> 
> > ---
> >  drivers/gpu/drm/xe/Makefile                   |  2 +-
> >  drivers/gpu/drm/xe/xe_device.c                |  2 +
> >  drivers/gpu/drm/xe/xe_device.h                |  1 +
> >  drivers/gpu/drm/xe/xe_device_types.h          |  2 +
> >  drivers/gpu/drm/xe/xe_gt.c                    | 18 -----
> >  drivers/gpu/drm/xe/xe_gt_types.h              |  2 -
> >  drivers/gpu/drm/xe/xe_ttm_gtt_mgr.h           | 16 -----
> >  drivers/gpu/drm/xe/xe_ttm_gtt_mgr_types.h     | 18 -----
> >  .../xe/{xe_ttm_gtt_mgr.c => xe_ttm_sys_mgr.c} | 67 +++++++------------
> >  9 files changed, 31 insertions(+), 97 deletions(-)
> >  delete mode 100644 drivers/gpu/drm/xe/xe_ttm_gtt_mgr.h
> >  delete mode 100644 drivers/gpu/drm/xe/xe_ttm_gtt_mgr_types.h
> >  rename drivers/gpu/drm/xe/{xe_ttm_gtt_mgr.c => xe_ttm_sys_mgr.c} (52%)
> > 
> > diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> > index 669c7b6f552c..7e19a15af3dc 100644
> > --- a/drivers/gpu/drm/xe/Makefile
> > +++ b/drivers/gpu/drm/xe/Makefile
> > @@ -83,7 +83,7 @@ xe-y += xe_bb.o \
> >  	xe_step.o \
> >  	xe_sync.o \
> >  	xe_trace.o \
> > -	xe_ttm_gtt_mgr.o \
> > +	xe_ttm_sys_mgr.o \
> >  	xe_ttm_stolen_mgr.o \
> >  	xe_ttm_vram_mgr.o \
> >  	xe_tuning.o \
> > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> > index a79f934e3d2d..4fb9aff27686 100644
> > --- a/drivers/gpu/drm/xe/xe_device.c
> > +++ b/drivers/gpu/drm/xe/xe_device.c
> > @@ -279,6 +279,8 @@ int xe_device_probe(struct xe_device *xe)
> >  	if (err)
> >  		goto err_irq_shutdown;
> >  
> > +	xe_ttm_sys_mgr_init(xe);
> > +
> >  	for_each_gt(gt, xe, id) {
> >  		err = xe_gt_init_noalloc(gt);
> >  		if (err)
> > diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> > index d277f8985f7b..d9d1b09a8e38 100644
> > --- a/drivers/gpu/drm/xe/xe_device.h
> > +++ b/drivers/gpu/drm/xe/xe_device.h
> > @@ -116,4 +116,5 @@ static inline bool xe_device_has_flat_ccs(struct xe_device *xe)
> >  }
> >  
> >  u32 xe_device_ccs_bytes(struct xe_device *xe, u64 size);
> > +int xe_ttm_sys_mgr_init(struct xe_device *xe);
> >  #endif
> > diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> > index 88f863edc41c..6fb53a54913f 100644
> > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > @@ -195,6 +195,8 @@ struct xe_device {
> >  			/** @mapping: pointer to VRAM mappable space */
> >  			void *__iomem mapping;
> >  		} vram;
> > +		/** @sys_mgr: system TTM manager */
> > +		struct ttm_resource_manager sys_mgr;
> >  	} mem;
> >  
> >  	/** @usm: unified memory state */
> > diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> > index fd7a5b43ba3e..a6ea138a7877 100644
> > --- a/drivers/gpu/drm/xe/xe_gt.c
> > +++ b/drivers/gpu/drm/xe/xe_gt.c
> > @@ -36,7 +36,6 @@
> >  #include "xe_ring_ops.h"
> >  #include "xe_sa.h"
> >  #include "xe_sched_job.h"
> > -#include "xe_ttm_gtt_mgr.h"
> >  #include "xe_ttm_vram_mgr.h"
> >  #include "xe_tuning.h"
> >  #include "xe_uc.h"
> > @@ -77,16 +76,11 @@ int xe_gt_alloc(struct xe_device *xe, struct xe_gt *gt)
> >  		if (!gt->mem.vram_mgr)
> >  			return -ENOMEM;
> >  
> > -		gt->mem.gtt_mgr = drmm_kzalloc(drm, sizeof(*gt->mem.gtt_mgr),
> > -					       GFP_KERNEL);
> > -		if (!gt->mem.gtt_mgr)
> > -			return -ENOMEM;
> >  	} else {
> >  		struct xe_gt *full_gt = xe_find_full_gt(gt);
> >  
> >  		gt->mem.ggtt = full_gt->mem.ggtt;
> >  		gt->mem.vram_mgr = full_gt->mem.vram_mgr;
> > -		gt->mem.gtt_mgr = full_gt->mem.gtt_mgr;
> >  	}
> >  
> >  	gt->ordered_wq = alloc_ordered_workqueue("gt-ordered-wq", 0);
> > @@ -98,26 +92,14 @@ static int gt_ttm_mgr_init(struct xe_gt *gt)
> >  {
> >  	struct xe_device *xe = gt_to_xe(gt);
> >  	int err;
> > -	struct sysinfo si;
> > -	u64 gtt_size;
> > -
> > -	si_meminfo(&si);
> > -	gtt_size = (u64)si.totalram * si.mem_unit * 3/4;
> >  
> >  	if (gt->mem.vram.size) {
> >  		err = xe_ttm_vram_mgr_init(gt, gt->mem.vram_mgr);
> >  		if (err)
> >  			return err;
> > -		gtt_size = min(max((XE_DEFAULT_GTT_SIZE_MB << 20),
> > -				   (u64)gt->mem.vram.size),
> > -			       gtt_size);
> >  		xe->info.mem_region_mask |= BIT(gt->info.vram_id) << 1;
> >  	}
> >  
> > -	err = xe_ttm_gtt_mgr_init(gt, gt->mem.gtt_mgr, gtt_size);
> > -	if (err)
> > -		return err;
> > -
> >  	return 0;
> >  }
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> > index 8f29aba455e0..9d3117fad2e4 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_types.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> > @@ -162,8 +162,6 @@ struct xe_gt {
> >  		} vram;
> >  		/** @vram_mgr: VRAM TTM manager */
> >  		struct xe_ttm_vram_mgr *vram_mgr;
> > -		/** @gtt_mr: GTT TTM manager */
> > -		struct xe_ttm_gtt_mgr *gtt_mgr;
> >  		/** @ggtt: Global graphics translation table */
> >  		struct xe_ggtt *ggtt;
> >  	} mem;
> > diff --git a/drivers/gpu/drm/xe/xe_ttm_gtt_mgr.h b/drivers/gpu/drm/xe/xe_ttm_gtt_mgr.h
> > deleted file mode 100644
> > index d1d57cb9c2b8..000000000000
> > --- a/drivers/gpu/drm/xe/xe_ttm_gtt_mgr.h
> > +++ /dev/null
> > @@ -1,16 +0,0 @@
> > -/* SPDX-License-Identifier: MIT */
> > -/*
> > - * Copyright © 2022 Intel Corporation
> > - */
> > -
> > -#ifndef _XE_TTGM_GTT_MGR_H_
> > -#define _XE_TTGM_GTT_MGR_H_
> > -
> > -#include "xe_ttm_gtt_mgr_types.h"
> > -
> > -struct xe_gt;
> > -
> > -int xe_ttm_gtt_mgr_init(struct xe_gt *gt, struct xe_ttm_gtt_mgr *mgr,
> > -			u64 gtt_size);
> > -
> > -#endif
> > diff --git a/drivers/gpu/drm/xe/xe_ttm_gtt_mgr_types.h b/drivers/gpu/drm/xe/xe_ttm_gtt_mgr_types.h
> > deleted file mode 100644
> > index c66737488326..000000000000
> > --- a/drivers/gpu/drm/xe/xe_ttm_gtt_mgr_types.h
> > +++ /dev/null
> > @@ -1,18 +0,0 @@
> > -/* SPDX-License-Identifier: MIT */
> > -/*
> > - * Copyright © 2022 Intel Corporation
> > - */
> > -
> > -#ifndef _XE_TTM_GTT_MGR_TYPES_H_
> > -#define _XE_TTM_GTT_MGR_TYPES_H_
> > -
> > -#include <drm/ttm/ttm_device.h>
> > -
> > -struct xe_gt;
> > -
> > -struct xe_ttm_gtt_mgr {
> > -	struct xe_gt *gt;
> > -	struct ttm_resource_manager manager;
> > -};
> > -
> > -#endif
> > diff --git a/drivers/gpu/drm/xe/xe_ttm_gtt_mgr.c b/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
> > similarity index 52%
> > rename from drivers/gpu/drm/xe/xe_ttm_gtt_mgr.c
> > rename to drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
> > index 8075781070f2..cf5f4f73d4dc 100644
> > --- a/drivers/gpu/drm/xe/xe_ttm_gtt_mgr.c
> > +++ b/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
> > @@ -12,31 +12,24 @@
> >  
> >  #include "xe_bo.h"
> >  #include "xe_gt.h"
> > -#include "xe_ttm_gtt_mgr.h"
> >  
> > -struct xe_ttm_gtt_node {
> > +struct xe_ttm_sys_node {
> >  	struct ttm_buffer_object *tbo;
> >  	struct ttm_range_mgr_node base;
> >  };
> >  
> > -static inline struct xe_ttm_gtt_mgr *
> > -to_gtt_mgr(struct ttm_resource_manager *man)
> > +static inline struct xe_ttm_sys_node *
> > +to_xe_ttm_sys_node(struct ttm_resource *res)
> >  {
> > -	return container_of(man, struct xe_ttm_gtt_mgr, manager);
> > +	return container_of(res, struct xe_ttm_sys_node, base.base);
> >  }
> >  
> > -static inline struct xe_ttm_gtt_node *
> > -to_xe_ttm_gtt_node(struct ttm_resource *res)
> > -{
> > -	return container_of(res, struct xe_ttm_gtt_node, base.base);
> > -}
> > -
> > -static int xe_ttm_gtt_mgr_new(struct ttm_resource_manager *man,
> > +static int xe_ttm_sys_mgr_new(struct ttm_resource_manager *man,
> >  			      struct ttm_buffer_object *tbo,
> >  			      const struct ttm_place *place,
> >  			      struct ttm_resource **res)
> >  {
> > -	struct xe_ttm_gtt_node *node;
> > +	struct xe_ttm_sys_node *node;
> >  	int r;
> >  
> >  	node = kzalloc(struct_size(node, base.mm_nodes, 1), GFP_KERNEL);
> > @@ -66,32 +59,31 @@ static int xe_ttm_gtt_mgr_new(struct ttm_resource_manager *man,
> >  	return r;
> >  }
> >  
> > -static void xe_ttm_gtt_mgr_del(struct ttm_resource_manager *man,
> > +static void xe_ttm_sys_mgr_del(struct ttm_resource_manager *man,
> >  			       struct ttm_resource *res)
> >  {
> > -	struct xe_ttm_gtt_node *node = to_xe_ttm_gtt_node(res);
> > +	struct xe_ttm_sys_node *node = to_xe_ttm_sys_node(res);
> >  
> >  	ttm_resource_fini(man, res);
> >  	kfree(node);
> >  }
> >  
> > -static void xe_ttm_gtt_mgr_debug(struct ttm_resource_manager *man,
> > +static void xe_ttm_sys_mgr_debug(struct ttm_resource_manager *man,
> >  				 struct drm_printer *printer)
> >  {
> >  
> >  }
> >  
> > -static const struct ttm_resource_manager_func xe_ttm_gtt_mgr_func = {
> > -	.alloc = xe_ttm_gtt_mgr_new,
> > -	.free = xe_ttm_gtt_mgr_del,
> > -	.debug = xe_ttm_gtt_mgr_debug
> > +static const struct ttm_resource_manager_func xe_ttm_sys_mgr_func = {
> > +	.alloc = xe_ttm_sys_mgr_new,
> > +	.free = xe_ttm_sys_mgr_del,
> > +	.debug = xe_ttm_sys_mgr_debug
> >  };
> >  
> > -static void ttm_gtt_mgr_fini(struct drm_device *drm, void *arg)
> > +static void ttm_sys_mgr_fini(struct drm_device *drm, void *arg)
> >  {
> > -	struct xe_ttm_gtt_mgr *mgr = arg;
> > -	struct xe_device *xe = gt_to_xe(mgr->gt);
> > -	struct ttm_resource_manager *man = &mgr->manager;
> > +	struct xe_device *xe = (struct xe_device *)arg;
> > +	struct ttm_resource_manager *man = &xe->mem.sys_mgr;
> >  	int err;
> >  
> >  	ttm_resource_manager_set_used(man, false);
> > @@ -104,27 +96,18 @@ static void ttm_gtt_mgr_fini(struct drm_device *drm, void *arg)
> >  	ttm_set_driver_manager(&xe->ttm, XE_PL_TT, NULL);
> >  }
> >  
> > -int xe_ttm_gtt_mgr_init(struct xe_gt *gt, struct xe_ttm_gtt_mgr *mgr,
> > -			u64 gtt_size)
> > +int xe_ttm_sys_mgr_init(struct xe_device *xe)
> >  {
> > -	struct xe_device *xe = gt_to_xe(gt);
> > -	struct ttm_resource_manager *man = &mgr->manager;
> > -	int err;
> > -
> > -	XE_BUG_ON(xe_gt_is_media_type(gt));
> > +	struct ttm_resource_manager *man = &xe->mem.sys_mgr;
> > +	struct sysinfo si;
> > +	u64 gtt_size;
> >  
> > -	mgr->gt = gt;
> > +	si_meminfo(&si);
> > +	gtt_size = (u64)si.totalram * si.mem_unit * 3/4;
> >  	man->use_tt = true;
> > -	man->func = &xe_ttm_gtt_mgr_func;
> > -
> > +	man->func = &xe_ttm_sys_mgr_func;
> >  	ttm_resource_manager_init(man, &xe->ttm, gtt_size >> PAGE_SHIFT);
> > -
> > -	ttm_set_driver_manager(&xe->ttm, XE_PL_TT, &mgr->manager);
> > +	ttm_set_driver_manager(&xe->ttm, XE_PL_TT, man);
> >  	ttm_resource_manager_set_used(man, true);
> > -
> > -	err = drmm_add_action_or_reset(&xe->drm, ttm_gtt_mgr_fini, mgr);
> > -	if (err)
> > -		return err;
> > -
> > -	return 0;
> > +	return drmm_add_action_or_reset(&xe->drm, ttm_sys_mgr_fini, xe);
> >  }
> > -- 
> > 2.25.1
> > 

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0853BC77B75
	for <intel-xe@archiver.kernel.org>; Tue,  9 May 2023 19:28:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF0DF10E3C4;
	Tue,  9 May 2023 19:28:31 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECEF710E3C7
 for <intel-xe@lists.freedesktop.org>; Tue,  9 May 2023 19:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683660510; x=1715196510;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=JoWsQCzgTBdrgCs6eOztNenvViJUBuQ6iR2WE8NFEg4=;
 b=ky5RYU3SahRQ+/05hEfI07yXfRLol2/PKw6/iIb9sB9BKjtTX7w5L+fP
 RDvODEZtnb5ALEYfRnX8wLr5Z1tLr2wh1m7jyeVlYUa537igKFFBzKwEA
 wtdK4WJ5ekofByDVmU+xoQzFRMDVPAM5GVIqc+yuxy1z8QzDpoDvmB47v
 UtKZDprlljPfj/ZC1ZOwb33eVET1CZEpdIcDIfI6TnjrgZTZAeSvgwZc0
 vldNfM621Kpk7s3EXRapz5y6FxdSMPHykSifIOOYzGwJ/K16RdUT1US5g
 jQLUs2ldT/PNAMJZS2zHjjjbfu06AJoR5mOML/4TbDkzGc8MQDfMf2QBL w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="350065982"
X-IronPort-AV: E=Sophos;i="5.99,262,1677571200"; d="scan'208";a="350065982"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2023 12:28:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="823257072"
X-IronPort-AV: E=Sophos;i="5.99,262,1677571200"; d="scan'208";a="823257072"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga004.jf.intel.com with ESMTP; 09 May 2023 12:28:29 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 9 May 2023 12:28:29 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 9 May 2023 12:28:28 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 9 May 2023 12:28:28 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 9 May 2023 12:28:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QgdpbxyWR4TAPuQjSv1SpA7lTPd+1UUmGDAESedWDT3KyUxjPW0PXC0uYMQY6cGosY62U2DSV8WRFWkEnpd7Wa9CDTzHe2K+3i5BlzFqH/LYOu36782xM8PouWLuhWUkRpvx1Yo3YNHmqHRJooyJjQUzU41l2vfM1D7TiyshnR32Bc9BC4lfhlKi8MgA3xJF5hLlM4kYO4JaKIWfqINxXlRFyBbCmJTYcXEFwA66uQ0hPNu6qdbGaxsKpwR3hTGTJaBdHBAaV1VMm0uv5gMwc9naj2IY9/nREao9NIUp9Y+2ethMmTW81OH0mBJfjvjFurNu5Rw6LSd5e01TXm8+Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8SWtxiM60IcLSQcfP18epvWTZ6iV2wdXLJC+c3hZfiY=;
 b=SrhUjNf2XHvl4Wv6QHOuApcGXFOBtD2e05IPWejzTAyMzpPvDfldvNO/X5GPPXaooKaZEOXXGVQ6UEROB3NTt9ZXCDJEhoV0mRlTUWHZVjDHXxKApOENLi6pXKk1y3ns+qnyYUrsFHD9HfKbBG/7VoI5dsN6pvfF6lCYvtVkKGLLZzringxNf8AP25uHZGR2Hv1aJTxT2ei4ggnGzVdB+0Nxuk/0rNaPKH+e6zse5Ynj6q2eTVRG9SY19GHo3DyaqPN8+cqVAT3VWYeFVjstCBO/x1vQfb7708Mxh+e39JtgkPifR3KqSU43UFdSizKoUmly5Jw6NcR5/N+miqrQGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5389.namprd11.prod.outlook.com (2603:10b6:5:394::17)
 by SA2PR11MB5033.namprd11.prod.outlook.com (2603:10b6:806:115::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Tue, 9 May
 2023 19:28:26 +0000
Received: from DM4PR11MB5389.namprd11.prod.outlook.com
 ([fe80::31f7:5096:35b0:b458]) by DM4PR11MB5389.namprd11.prod.outlook.com
 ([fe80::31f7:5096:35b0:b458%2]) with mapi id 15.20.6363.032; Tue, 9 May 2023
 19:28:26 +0000
Date: Tue, 9 May 2023 21:28:18 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <20230509192818.GA4046118@kav-xto-001.ka.intel.com>
References: <20230508210825.1405432-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230508210825.1405432-1-rodrigo.vivi@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: LO2P265CA0460.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a2::16) To DM4PR11MB5389.namprd11.prod.outlook.com
 (2603:10b6:5:394::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5389:EE_|SA2PR11MB5033:EE_
X-MS-Office365-Filtering-Correlation-Id: eaccc572-2db8-4faf-7f6d-08db50c38f70
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FAdCk0AedNlTaLnhmvXfm84vXzrZIyVp9CaFMm6ylvr+imyOd0jMezehVH9/uV5EBeH57qNHQ4LxVKoLp0V5Uc6gwafMaHjFKbxJKGvcY4t2hJZTOYpG9hIIpwOAfePbnP06NiLffVq4o6j80jyo93SXDNYCwjGTgphx3A+Jdmaw0vpzqmzaXWdx5vOTJbM9i0DpXU4wO1KPvTRFBAj2QExY2yTwYzFqp6wTvqNmDstWoD9gVgMt8m3F4qS9hKhOf9YcApknnL01ZFo6VKzNKcFwm6XfXTunDhs0QYN8yipx25r1WTvUbhWROR+bBxJDz+cUbxjTWsheK0g9Kf3xw9k1gHV0N93wjrXkkPSDS0xsEKFCwzARnuovElP293EBJo6qlzQUZJB6rg4e3q32+MYiCvcZav3icMVRrQYC4F5CncKxlFE/M1ttOsScwyCI89HiasU41ncwTLtJXyEEDPi0dB9J9Y3cd1peUc7Tt8YejsNB4h7z43ZZX3ORTNBKfS89CtKQ2tkQ1DlTS+Rqk+UEYt24qTA7QU5usYVrQ2QplPNp9frTc1BcQs2pRQyY
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5389.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(39860400002)(346002)(136003)(396003)(376002)(451199021)(66476007)(33656002)(86362001)(36916002)(478600001)(6636002)(316002)(4326008)(66946007)(66556008)(6486002)(5660300002)(41300700001)(30864003)(8936002)(6862004)(8676002)(44832011)(82960400001)(38100700002)(186003)(2906002)(66574015)(1076003)(26005)(6512007)(6506007)(83380400001)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?LBuskjZPARXociAIPSwbX5G60ADEM1ir2rxckb15Y1wCF2lsM7uxMyPYzZ?=
 =?iso-8859-1?Q?BytmLxdScjCU11pFj7i1/B0wLe+nkYXZ2LxvWCar+GFXD12FmJL492OonK?=
 =?iso-8859-1?Q?Z7McCLpy0QghaW35+W9vx8tvj6DuaJPTYq4cT6Fl2slI44OYDD1SWzlSPj?=
 =?iso-8859-1?Q?qp7JaAbve2ao3kbgG40WjsneldtGfQZiS9tSMKD1g26Yl9AbLkYCaj21Yt?=
 =?iso-8859-1?Q?5t8GdKkLcY/Qsem/AcaeSEuIPdvZIFrZChRcDI4jkXyVdJwUfr0gJSzNV1?=
 =?iso-8859-1?Q?zQIP8rGilASE8PqYRNgcFJneG8UmEl/qbrKBRq0A4eom4BAIVrx8RdQKno?=
 =?iso-8859-1?Q?kk/NXd3z6FfSmqzkvHZhfrbrE7wEldxS82RShfEDR1hMEBTHWdmNdTOI53?=
 =?iso-8859-1?Q?Jlb4KMmzDh0vnUqjgwFOm5z/WTDrRPmvi0o4Iwa8uNg1zl9fc3bi36OL/y?=
 =?iso-8859-1?Q?xeoThTx+cE0FbOmEkMIhZWsYOFOhbbwyKM0+yazJe+AlTCMEtZ3Jt24Nb+?=
 =?iso-8859-1?Q?cBrhf3zV+QGg/xf5+J/zv/Ok5eEhviQYFkzn3t9rdLP6/ymz6megp6BItr?=
 =?iso-8859-1?Q?bEo8cXc1bZZGjdBMj+8Yw9qfaYCYmzGKShOc/k03uad1BICmY1rUVk9Ww3?=
 =?iso-8859-1?Q?0g8PZ8A9XkE6dXVhE6HDF9UvZ+wFJy0pFOSCjM/qvr3S+GxD1gs/DPoGmF?=
 =?iso-8859-1?Q?j+n5dEPxyy6Elq9a7Uu/Fv8MyFER5eJPQQTYAjNtZiCEtCmUm1ToyIbUyW?=
 =?iso-8859-1?Q?RcPpktIKGnBmVCtQs+1vjqr5Je9yGMvYC/CN4aFqXzJzuUCJIh7r+LqWnO?=
 =?iso-8859-1?Q?v4geHydJWkmLihXv7KTwwU2QUnWhIgPOgCxyqpIPJIrveM1qeyriU5u8gr?=
 =?iso-8859-1?Q?KitIYO+XPsGAu7t1+sHhscmBLwsMELaSrt0Ei+x+SYr0RAJyYgQJH17QbA?=
 =?iso-8859-1?Q?kFGCIJFW5mLbqc/P0bfeRa9bMnXzo9fL9pugUlvVzKxCsxrQ0eIn6koch+?=
 =?iso-8859-1?Q?OCjFEC1ATUMXz+DXGMiDCGvaClQpbSmfQhI5AWt40mXLvZnX4QTx7tC7/8?=
 =?iso-8859-1?Q?s/9PZqxdGieFnpFF2zKLxAaseRP852F1Nr2NXB5W7lM4sIvxvgCBVGthAf?=
 =?iso-8859-1?Q?jSqoKNAv0gQ0e+ViAx4sP8iwo+Wm2pQ6O0yOLXUXQtIZh/AFq4d0TUmT/u?=
 =?iso-8859-1?Q?ZWAs/sN5MLbzn9K5x7CKHxnw6hoM/VkPjuFizVqLSz5XfyhL0orq0LxYeV?=
 =?iso-8859-1?Q?EoyVW/eZ7T1mn0V+qBMekhOKii2t0QAlP4q5lw6cjpp3XNqlchtQUkMcZ8?=
 =?iso-8859-1?Q?MrDqIEbZtAA32h5CrpYmWYXvol7Ls39wzjC4MmKsMpRUjsqt1Zy+5v1A5u?=
 =?iso-8859-1?Q?qq3bd4Y1DyEXUWavLBjj2HUHIfaaHhL2y6X/Qx91ypKOofBJf+XDUb82c3?=
 =?iso-8859-1?Q?AVVrjPvqXhhvDzexAFT2ML2UTNLONYhRIQW1zStLYybbwG9LQvZK2VJxjS?=
 =?iso-8859-1?Q?KirXacTCBoH5L64v0RxfWeeCnc5s5ejUCTz1DuhlqI4IzeyLjDKhmlHYoi?=
 =?iso-8859-1?Q?FKmfoCvqiP8QtO+FJSQO67ai1yjMvZuYwxrUWuRMVJ9pXN5M3scw4M3/+S?=
 =?iso-8859-1?Q?PR+Ge/5WuxGO3q2BOw1Ts/j1kKo0dzA5MWsQrS1+qrFntH5/csM/B7cA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: eaccc572-2db8-4faf-7f6d-08db50c38f70
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5389.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2023 19:28:26.0739 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q962EUepPVYw3s3wcV+HE2QwKXLpcMeh1Db8Jcq0UlL+Ta3S4WHsk7Preob0SwzWhUE2PmJF2XqbaBtIrmta3xIzSkK0ZANcWMp9YMpCLU8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5033
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 01/11] drm/xe: Introduce the dev_coredump
 infrastructure.
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, May 08, 2023 at 05:08:15PM -0400, Rodrigo Vivi wrote:
> The goal is to use devcoredump infrastructure to report error states
> captured at the crash time.
> 
> The error state will contain useful information for GPU hang debug, such
> as INSTDONE registers and the current buffers getting executed, as well
> as any other information that helps user space and allow later replays of
> the error.
> 
> The proposal here is to avoid a Xe only error_state like i915 and use
> a standard dev_coredump infrastructure to expose the error state.
> 
> For our own case, the data is only useful if it is a snapshot of the
> time when the GPU crash has happened, since we reset the GPU immediately
> after and the registers might have changed. So the proposal here is to
> have an internal snapshot to be printed out later.
> 
> Also, usually a subsequent GPU hang can be only a cause of the initial
> one. So we only save the 'first' hang. The dev_coredump has a delayed
> work queue where it remove the coredump and free all the data within a
> few moments of the error. When that happens we also reset our capture
> state and allow further snapshots.
> 
> Right now this infra only print out the time of the hang. More information
> will be migrated here on subsequent work. Also, in order to organize the
> dump better, the goal is to propose dev_coredump changes itself to allow
> multiple files and different controls. But for now we start Xe usage of
> it without any dependency on dev_coredump core changes.
> 
> v2: Add dma_fence annotation for capture that might happen during long
>     running. (Thomas and Matt)
>     Use xe->drm.primary->index on drm_info msg. (Jani)
> v3: checkpatch fixes
> 
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/xe/Kconfig                |   1 +
>  drivers/gpu/drm/xe/Makefile               |   1 +
>  drivers/gpu/drm/xe/xe_devcoredump.c       | 150 ++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_devcoredump.h       |  22 ++++
>  drivers/gpu/drm/xe/xe_devcoredump_types.h |  47 +++++++
>  drivers/gpu/drm/xe/xe_device_types.h      |   4 +
>  drivers/gpu/drm/xe/xe_guc_submit.c        |   2 +
>  drivers/gpu/drm/xe/xe_pci.c               |   2 +
>  8 files changed, 229 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_devcoredump.c
>  create mode 100644 drivers/gpu/drm/xe/xe_devcoredump.h
>  create mode 100644 drivers/gpu/drm/xe/xe_devcoredump_types.h
> 
> diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
> index f6f3b491d162..d44794f99338 100644
> --- a/drivers/gpu/drm/xe/Kconfig
> +++ b/drivers/gpu/drm/xe/Kconfig
> @@ -35,6 +35,7 @@ config DRM_XE
>  	select DRM_TTM_HELPER
>  	select DRM_SCHED
>  	select MMU_NOTIFIER
> +	select WANT_DEV_COREDUMP
>  	help
>  	  Experimental driver for Intel Xe series GPUs
>  
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index b6c41cd7dbe3..678c9d84e50e 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -34,6 +34,7 @@ xe-y += xe_bb.o \
>  	xe_bo.o \
>  	xe_bo_evict.o \
>  	xe_debugfs.o \
> +	xe_devcoredump.o \
>  	xe_device.o \
>  	xe_dma_buf.o \
>  	xe_engine.o \
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
> new file mode 100644
> index 000000000000..b1b4d2f10c7a
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
> @@ -0,0 +1,150 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#include "xe_devcoredump.h"
> +#include "xe_devcoredump_types.h"
> +
> +#include <linux/devcoredump.h>
> +#include <generated/utsrelease.h>
> +
> +#include "xe_engine.h"
> +#include "xe_gt.h"
> +
> +/**
> + * DOC: Xe device coredump
> + *
> + * Devices overview:
> + * Xe uses dev_coredump infrastructure for exposing the crash errors in a
> + * standardized way.
> + * devcoredump exposes a temporary device under /sys/class/devcoredump/
> + * which is linked with our card device directly.
> + * The core dump can be accessed either from
> + * /sys/class/drm/card<n>/device/devcoredump/ or from
> + * /sys/class/devcoredump/devcd<m> where
> + * /sys/class/devcoredump/devcd<m>/failing_device is a link to
> + * /sys/class/drm/card<n>/device/.
> + *
> + * Snapshot at hang:
> + * The 'data' file is printed with a drm_printer pointer at devcoredump read
> + * time. For this reason, we need to take snapshots from when the hang has
> + * happened, and not only when the user is reading the file. Otherwise the
> + * information is outdated since the resets might have happened in between.
> + *
> + * 'First' failure snapshot:
> + * In general, the first hang is the most critical one since the following hangs
> + * can be a consequence of the initial hang. For this reason we only take the
> + * snapshot of the 'first' failure and ignore subsequent calls of this function,
> + * at least while the coredump device is alive. Dev_coredump has a delayed work
> + * queue that will eventually delete the device and free all the dump
> + * information. At this time we also clear the faulty_engine and allow the next
> + * hang capture.
> + */
> +
> +static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
> +				   size_t count, void *data, size_t datalen)
> +{
> +	struct xe_devcoredump *coredump = data;
> +	struct xe_devcoredump_snapshot *ss;
> +	struct drm_printer p;
> +	struct drm_print_iterator iter;
> +	struct timespec64 ts;
> +
> +	iter.data = buffer;
> +	iter.offset = 0;
> +	iter.start = offset;
> +	iter.remain = count;
> +
> +	mutex_lock(&coredump->lock);
> +
> +	ss = &coredump->snapshot;
> +	p = drm_coredump_printer(&iter);
> +
> +	drm_printf(&p, "**** Xe Device Coredump ****\n");
> +	drm_printf(&p, "kernel: " UTS_RELEASE "\n");
> +	drm_printf(&p, "module: " KBUILD_MODNAME "\n");
> +
> +	ts = ktime_to_timespec64(ss->snapshot_time);
> +	drm_printf(&p, "Snapshot time: %lld.%09ld\n", ts.tv_sec, ts.tv_nsec);
> +	ts = ktime_to_timespec64(ss->boot_time);
> +	drm_printf(&p, "Boot time: %lld.%09ld\n", ts.tv_sec, ts.tv_nsec);
> +	ts = ktime_to_timespec64(ktime_sub(ss->snapshot_time, ss->boot_time));
> +	drm_printf(&p, "Uptime: %lld.%09ld\n", ts.tv_sec, ts.tv_nsec);
> +
> +	mutex_unlock(&coredump->lock);
> +
> +	return count - iter.remain;
> +}
> +
> +static void xe_devcoredump_free(void *data)
> +{
> +	struct xe_devcoredump *coredump = data;
> +	struct xe_device *xe = container_of(coredump, struct xe_device,
> +					    devcoredump);
> +	mutex_lock(&coredump->lock);
> +
> +	coredump->faulty_engine = NULL;
> +	drm_info(&xe->drm, "Xe device coredump has been deleted.\n");
> +
> +	mutex_unlock(&coredump->lock);
> +}
> +
> +static void devcoredump_snapshot(struct xe_devcoredump *coredump)
> +{
> +	struct xe_devcoredump_snapshot *ss = &coredump->snapshot;
> +
> +	lockdep_assert_held(&coredump->lock);
> +	ss->snapshot_time = ktime_get_real();
> +	ss->boot_time = ktime_get_boottime();
> +}
> +
> +/**
> + * xe_devcoredump - Take the required snapshots and initialize coredump device.
> + * @e: The faulty xe_engine, where the issue was detected.
> + *
> + * This function should be called at the crash time. It is skipped if we still
> + * have the core dump device available with the information of the 'first'
> + * snapshot.
> + */
> +void xe_devcoredump(struct xe_engine *e)

Build fails here if CONFIG_DEV_COREDUMP is disabled due to redefinition of xe_devcoredump in xe_devcoredump.h, probably a missing ifdef.

Francois

> +{
> +	struct xe_device *xe = gt_to_xe(e->gt);
> +	struct xe_devcoredump *coredump = &xe->devcoredump;
> +	bool cookie;
> +
> +	cookie = dma_fence_begin_signalling();
> +	mutex_lock(&coredump->lock);
> +
> +	if (coredump->faulty_engine) {
> +		drm_dbg(&xe->drm, "Multiple hangs are occurring, but only the first snapshot was taken\n");
> +		mutex_unlock(&coredump->lock);
> +		return;
> +	}
> +	coredump->faulty_engine = e;
> +	devcoredump_snapshot(coredump);
> +
> +	mutex_unlock(&coredump->lock);
> +	dma_fence_end_signalling(cookie);
> +
> +	drm_info(&xe->drm, "Xe device coredump has been created\n");
> +	drm_info(&xe->drm, "Check your /sys/class/drm/card%d/device/devcoredump/data\n",
> +		 xe->drm.primary->index);
> +
> +	dev_coredumpm(xe->drm.dev, THIS_MODULE, coredump, 0, GFP_KERNEL,
> +		      xe_devcoredump_read, xe_devcoredump_free);
> +}
> +
> +/**
> + * xe_devcoredump_init - Initialize xe_devcoredump.
> + * @xe: Xe device.
> + *
> + * This function should be called at the probe so the mutex lock can be
> + * initialized.
> + */
> +void xe_devcoredump_init(struct xe_device *xe)
> +{
> +	struct xe_devcoredump *coredump = &xe->devcoredump;
> +
> +	mutex_init(&coredump->lock);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.h b/drivers/gpu/drm/xe/xe_devcoredump.h
> new file mode 100644
> index 000000000000..30941d2e554b
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_devcoredump.h
> @@ -0,0 +1,22 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#ifndef _XE_DEVCOREDUMP_H_
> +#define _XE_DEVCOREDUMP_H_
> +
> +struct xe_device;
> +struct xe_engine;
> +
> +void xe_devcoredump_init(struct xe_device *xe);
> +
> +#ifdef CONFIG_DEV_COREDUMP
> +void xe_devcoredump(struct xe_engine *e);
> +#else
> +static inline void xe_devcoredump(struct xe_engine *e)
> +{
> +}
> +#endif
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump_types.h b/drivers/gpu/drm/xe/xe_devcoredump_types.h
> new file mode 100644
> index 000000000000..3f395fa9104e
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_devcoredump_types.h
> @@ -0,0 +1,47 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#ifndef _XE_DEVCOREDUMP_TYPES_H_
> +#define _XE_DEVCOREDUMP_TYPES_H_
> +
> +#include <linux/ktime.h>
> +#include <linux/mutex.h>
> +
> +struct xe_device;
> +
> +/**
> + * struct xe_devcoredump_snapshot - Crash snapshot
> + *
> + * This struct contains all the useful information quickly captured at the time
> + * of the crash. So, any subsequent reads of the coredump points to a data that
> + * shows the state of the GPU of when the issue has happened.
> + */
> +struct xe_devcoredump_snapshot {
> +	/** @snapshot_time:  Time of this capture. */
> +	ktime_t snapshot_time;
> +	/** @boot_time:  Relative boot time so the uptime can be calculated. */
> +	ktime_t boot_time;
> +};
> +
> +/**
> + * struct xe_devcoredump - Xe devcoredump main structure
> + *
> + * This struct represents the live and active dev_coredump node.
> + * It is created/populated at the time of a crash/error. Then it
> + * is read later when user access the device coredump data file
> + * for reading the information.
> + */
> +struct xe_devcoredump {
> +	/** @xe: Xe device. */
> +	struct xe_device *xe;
> +	/** @falty_engine: Engine where the crash/error happened. */
> +	struct xe_engine *faulty_engine;
> +	/** @lock: Protects data from races between capture and read out. */
> +	struct mutex lock;
> +	/** @snapshot: Snapshot is captured at time of the first crash */
> +	struct xe_devcoredump_snapshot snapshot;
> +};
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 6490a04614ce..197ee4090fed 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -12,6 +12,7 @@
>  #include <drm/drm_file.h>
>  #include <drm/ttm/ttm_device.h>
>  
> +#include "xe_devcoredump_types.h"
>  #include "xe_gt_types.h"
>  #include "xe_platform_types.h"
>  #include "xe_step_types.h"
> @@ -55,6 +56,9 @@ struct xe_device {
>  	/** @drm: drm device */
>  	struct drm_device drm;
>  
> +	/** @devcoredump: device coredump */
> +	struct xe_devcoredump devcoredump;
> +
>  	/** @info: device info */
>  	struct intel_device_info {
>  		/** @graphics_name: graphics IP name */
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index e857013070b9..231fb4145297 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -14,6 +14,7 @@
>  #include <drm/drm_managed.h>
>  
>  #include "regs/xe_lrc_layout.h"
> +#include "xe_devcoredump.h"
>  #include "xe_device.h"
>  #include "xe_engine.h"
>  #include "xe_force_wake.h"
> @@ -800,6 +801,7 @@ guc_engine_timedout_job(struct drm_sched_job *drm_job)
>  		drm_warn(&xe->drm, "Timedout job: seqno=%u, guc_id=%d, flags=0x%lx",
>  			 xe_sched_job_seqno(job), e->guc->id, e->flags);
>  		simple_error_capture(e);
> +		xe_devcoredump(e);
>  	} else {
>  		drm_dbg(&xe->drm, "Timedout signaled job: seqno=%u, guc_id=%d, flags=0x%lx",
>  			 xe_sched_job_seqno(job), e->guc->id, e->flags);
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 855cf8557056..dd8bc3490ef8 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -16,6 +16,7 @@
>  
>  #include "regs/xe_regs.h"
>  #include "regs/xe_gt_regs.h"
> +#include "xe_devcoredump.h"
>  #include "xe_device.h"
>  #include "xe_display.h"
>  #include "xe_drv.h"
> @@ -655,6 +656,7 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>  		return err;
>  	}
>  
> +	xe_devcoredump_init(xe);
>  	xe_pm_runtime_init(xe);
>  
>  	return 0;
> -- 
> 2.39.2
> 

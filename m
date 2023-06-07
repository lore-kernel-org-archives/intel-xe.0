Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13DA3C77B7A
	for <intel-xe@archiver.kernel.org>; Wed,  7 Jun 2023 22:35:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B311110E566;
	Wed,  7 Jun 2023 22:35:54 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B49FA10E566
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Jun 2023 22:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686177352; x=1717713352;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=BYTIaEHQjSuJjMT1pgjZuyze+SxJbMAJ+flTtowNeCw=;
 b=HXAUoC18w5XXGP43TMTJd/bz6R4yU61N6rOI3t5CJDcRyJ+TmURuhSUC
 nRqV+h+tKDWiqBjC5AWXCogudvYPK93kIjjSSpiRNITpqx+3Se6auqAjQ
 GnyHPgH+jqyTF5H7AHpgQRqd63pDeA2vhq8xiRwzWb/Rnbh8XbN453TJK
 P6ODtHbvuoCiZ8c9+7g6N9YEcVQ+3vKCgaK3AyuqSOKyuDRITFsYsHkBr
 8ZiAUXfdUhh8GRnIYmRrET7JxardXr1byrfWcoS2lg6tjxQJoCVbjw4r0
 tgJzdbO1Agv602EbXECH28XqPsUyzKPUiQP33fdAFLkIn9EWNX0VctdAO A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="385460686"
X-IronPort-AV: E=Sophos;i="6.00,225,1681196400"; d="scan'208";a="385460686"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2023 15:35:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="660124465"
X-IronPort-AV: E=Sophos;i="6.00,225,1681196400"; d="scan'208";a="660124465"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga003.jf.intel.com with ESMTP; 07 Jun 2023 15:35:46 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 7 Jun 2023 15:35:45 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 7 Jun 2023 15:35:45 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 7 Jun 2023 15:35:45 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.104)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 7 Jun 2023 15:35:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SSNyfbZq0hotecoJESGQgJ4AMDIc9QKSGAnkojdIg3U3lyHeZ/TEQnKjbWUVc0M/kRSs6lS9l0f7aRBkjToEGcFhU53SHoDv+qotTxYFiiAJpaoh79GjjE4UWrYcT3zU4C33BS7acbc8UYx5yVLekt/JUQfwBcaftgW93/CjYJDJk65/yocz2P+TPjo7fOT3TC9yuZkI4OBdf15+/vVlBdt2yhdu59XWT2w5K8NyzRyyx9lcyRg42jltjHN4OEEdd0cNpGIu6t+2MRPhfyf0k8+qTnjc98ctqHecebzMwBC9Nva68Cma8op9pVJynipinGDvh2lHSoRvGthkZN35Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EFeYGctPrVxu4KDOx2BfzTdbrzfUOwTlnKke6zm0EOc=;
 b=H7PXmWPTBp2nuHGQ5FNTYK/mXPbQAJ41nd+V42ub5ron55wNrzpdPqmCE0AqcLtKVavxRTAlClFqHYVNRk/KySpRTjipyUSTXVhtHgmUIFmDhj+rTs9HHKWOKXG0MEXYpIq/Otq54/6VTEyaal2L/vgjS7Xm34XnA5lqyMpV+fnaUiKbGLXoso57PD1ZvyDC9usrTZGjn4ZsbhikpvHvELrmpHV6WB6w4/K2LLMIaOqfSojNoyCJxonc9IcJai/2r7oMmp856TGj8PA8rRM3QJ4SovgHFgbkLkszPQ/vnIVhKiAMmh3/rw+IYae4jCu5d/b3QQfFmhVhJchQWO/VqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 CH3PR11MB7764.namprd11.prod.outlook.com (2603:10b6:610:145::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Wed, 7 Jun
 2023 22:35:43 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396%6]) with mapi id 15.20.6455.030; Wed, 7 Jun 2023
 22:35:42 +0000
Date: Wed, 7 Jun 2023 15:35:39 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Message-ID: <20230607223539.GO5433@mdroper-desk1.amr.corp.intel.com>
References: <20230524060020.2054682-1-riana.tauro@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230524060020.2054682-1-riana.tauro@intel.com>
X-ClientProxiedBy: BYAPR06CA0067.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::44) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|CH3PR11MB7764:EE_
X-MS-Office365-Filtering-Correlation-Id: ef191719-be83-490f-1d38-08db67a786b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mbikqoDzS9mcs5DCvA8doE7wOOQuKY7+9Y5X56E0BpXN5ZneNK+iNcwa5J5CYT+3MDveJNEFB5wB3GOXyWixYzfVHWgwLPJ0+2+ifs8BGMtlT2Wxy0/osmIzy4srktWzCJed7/V8cD23N9lDWzNQjE1Az9obUd9Zf3fgxPznm4YcjJiJsfqtTzyTPm685uvudOiik1yLzcQz0rskEiIJmTykBS1DPgwaLWL2KURdb5G9QffBPMYMAf0v1zvbKR+mUNkow6PdFxVLDwt+m2HRngiDRnyoNNl6uBarqB6MZQMwmepd0e3TBe2LOZ/xr8C4a1+nnVl32RiVPHyQUyVOkX6IcgfVO66qyu6Unduk5hKm9hWh68MjgB6GeIalabkm4eAVKNQesWzScRHI05upN5CHuwhg2yAWVqMVWGS13pxB2e5uHTaas7tOV2TPQGvkwQ6Q5On1ocBkfgXX4vzBLxj+uNgnqg+WdWttUIQFhLhiRzV5882eGNhIBtmKc/HbduViIqChd35sTyHuvQmqw7CvGR77FJWpWKQeEDy+NJk/pNCNJgBXmJar6yxyGA73ATld+fwUsVBwmx+KQbzT5rDG1Y6LZFotF9S64o5jMiw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(396003)(376002)(136003)(346002)(366004)(451199021)(6512007)(107886003)(38100700002)(6506007)(1076003)(41300700001)(6486002)(6666004)(26005)(186003)(83380400001)(478600001)(66476007)(4326008)(82960400001)(316002)(66946007)(8676002)(66556008)(6636002)(6862004)(8936002)(5660300002)(33656002)(30864003)(86362001)(2906002)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?s2OFgEf724U/kk7w1sdejh905GXnfpydHo0WGLqt4rkjAWyWfAuZ2M7ocZ?=
 =?iso-8859-1?Q?fpvzI1+zFv0Qbb8W2DhFH39A5STBO+fpgfvMcYHtkXBW+w5pHDh70iiLAp?=
 =?iso-8859-1?Q?O3bnh3I+2uvGg8HGTh3JV8uaAWZSsFsgfKN95otktxTmG1uNYTiCo6fyXT?=
 =?iso-8859-1?Q?Xy4aKZFLhmRo/CXTj6AEjMzsB+hasa4W676cksY12UjXHZ754A1h3oGbTY?=
 =?iso-8859-1?Q?Fy/bV+NjyYj5kVFFrfy9o5/1R5VFaYZg4oJaEJSUwumsRBrfDPtlL5U4Uy?=
 =?iso-8859-1?Q?Azv8e6wJ+enZDjWSRw0fH1Aq3TKi/UEl6Y/7RVKHQ8proTgd/8xEn2QzKp?=
 =?iso-8859-1?Q?YmWD3s9RCKoXZ+yY6yx4IQx7BxcJNBJwYaIE/oPacrwRDypCxkcZBLhH8Q?=
 =?iso-8859-1?Q?VrycfcpFqXJc4sSIP6MNu0uOUeBFBwu7arzJ5xFPK9h4vpuRpwLeiKx7v6?=
 =?iso-8859-1?Q?yjXrmmt9959Eaw8gXQ5Sp+xsX42WjrmjrqgSlOu8qNXRiQBXq5Oy1XSC3f?=
 =?iso-8859-1?Q?ycVEuhhXat7mcmpt2ymdcC7E4FR6HmA5hssu14UOCK+ZN6RZDu6Sjkp0dr?=
 =?iso-8859-1?Q?4quT3jmX3GoUbKubCMgxldN/bid2rf6vHNl8V5boVkDp1esuaBShKYMr+M?=
 =?iso-8859-1?Q?HIUXSnMpzep8MJuGMRgxkDh7rWeXCrTWONuifjOOCuLP2clPtiWwBYfqMo?=
 =?iso-8859-1?Q?yo1GtA/eEkiTrcvWxa6i70bXN34rGTIu3P8obNBBT9B9hlnIpjqlCMBPXJ?=
 =?iso-8859-1?Q?8lBba0mEpYtIIaPsMDDkIljflvMJ9pmhnCL1yHXzwTNI7+Cy1CVzfR46vR?=
 =?iso-8859-1?Q?sNetOcB20c6NneVkBUjs4nh1ZF+IjZ+ZwTkpK4qIRkGf9WPZ4zkWebufg9?=
 =?iso-8859-1?Q?Ba0rIJLzdR6M8XtenH0K5ZVwWWrhj+H0pVJ+49nCHl53BwWDQlvXIvvD48?=
 =?iso-8859-1?Q?I6MgTeKe8czizJCKT+rxCjAssxwjxKeo/cHAlIbaAbljrmvfU2YfNHZ8w/?=
 =?iso-8859-1?Q?NLPbW19ZWZ8NaLiMYgvEMxlKApHKwrDvMurBRUOxOcRhheNyTdUiHfLRR2?=
 =?iso-8859-1?Q?7puVfxGO6gmJhqf5lANI85xHghxOseA+B/SUe2dvqoETjXIv93WFcKqZOh?=
 =?iso-8859-1?Q?ormV0bZfKdrLEyITswDzD1vB6HIQao4UvNH8awmIaKFGL1Mbm7SSEkzpsa?=
 =?iso-8859-1?Q?8vkxeVjW8s+wSQdcO5YUrPwpJ4Ju1unk1VKTLTZmPvEsZSy661FueRDobz?=
 =?iso-8859-1?Q?t8Qgn8g+pmRH2UtZGWI46gjyvYdtJFABMiZ+0vA7xaqydE9x6I3C1ixn/q?=
 =?iso-8859-1?Q?94sdPeIQTM7r/kWzi+ty2VlsxAv5Q+hrrAyD/PkCex3pr/aYG7XjS1VEZi?=
 =?iso-8859-1?Q?2mrhqfbIeaP5RtRmcVoTc5ZxFHty3hJXegZ/2l6Hgm4E7WogyjVNjtkisW?=
 =?iso-8859-1?Q?ugj0UHPwfrdEZ5Bg+69O26e5yfc5m2x7AysGqpqnsq1DwQZ413ucBa6BVz?=
 =?iso-8859-1?Q?VoarJ2P0MMUQhvBngY3WFZNqSohpraQvNwa4by8cTfw2PE+zxkDn+m/HRA?=
 =?iso-8859-1?Q?B/wwSGio2WWqyimfx/sJYKFwf2rfqiCM+h2qcnBTUNOESd7Em0uX5uJHCE?=
 =?iso-8859-1?Q?qE1d6cqvRQ9Jrhk2+WGvMmjZWiXEB49zHVZnUZoy9RmqLe2OoaOPI+nA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ef191719-be83-490f-1d38-08db67a786b2
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2023 22:35:42.3330 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iOfknY5695PAVlVjYBJn9xkxKcSLJ7FQ2vmK8PIW5SfX/N7l5GxyHmVmQHmjC0TjF5gJOThjzNkvxG/Ikc1C+iCHV1eX6fHG3jza6RQ97Ug=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7764
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: add a new sysfs directory for gtidle
 properties
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
Cc: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, May 24, 2023 at 11:30:20AM +0530, Riana Tauro wrote:
> Add a new sysfs directory under devices/gt#/ called gtidle
> to contain idle properties of GT such as name, idle_status,
> idle_residency_ms

What's the userspace consumer for this uapi?  We don't have any uapi
like this in i915 do we?


Matt


> 
> v2:
>     - abstract using function pointers (Anshuman)
>     - use device_attr (Badal)
>     - move rc functions to guc_pc
>     - change name to gt_idle (Rodrigo)
> 
> v3:
>     - return error for drmm_add_action_or_reset
>     - replace file and functions with gt_idle prefix
>       to gt_idle_sysfs (Himal)
>     - use enum for gt idle state
>     - move multiplier to gt idle and initialize (Anshuman)
>     - correct doc annotation (Rodrigo)
>     - remove return variable
>     - use kobj_gt instead of new gtidle kobj
>     - move residency_ms to gtidle file
>     - retain xe_guc_pc prefix for functions in guc_rc file (Michal)
> 
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile                 |   1 +
>  drivers/gpu/drm/xe/xe_gt.c                  |   5 +
>  drivers/gpu/drm/xe/xe_gt_idle_sysfs.c       | 157 ++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_idle_sysfs.h       |  13 ++
>  drivers/gpu/drm/xe/xe_gt_idle_sysfs_types.h |  38 +++++
>  drivers/gpu/drm/xe/xe_gt_types.h            |   4 +
>  drivers/gpu/drm/xe/xe_guc_pc.c              |  46 +++---
>  drivers/gpu/drm/xe/xe_guc_pc.h              |   2 +
>  8 files changed, 237 insertions(+), 29 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/xe_gt_idle_sysfs.c
>  create mode 100644 drivers/gpu/drm/xe/xe_gt_idle_sysfs.h
>  create mode 100644 drivers/gpu/drm/xe/xe_gt_idle_sysfs_types.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index cd1614b68734..84f0985054fa 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -45,6 +45,7 @@ xe-y += xe_bb.o \
>  	xe_gt.o \
>  	xe_gt_clock.o \
>  	xe_gt_debugfs.o \
> +	xe_gt_idle_sysfs.o \
>  	xe_gt_mcr.o \
>  	xe_gt_pagefault.o \
>  	xe_gt_sysfs.o \
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 80d42c7c7cfa..eb1e1e3d2d71 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -18,6 +18,7 @@
>  #include "xe_force_wake.h"
>  #include "xe_ggtt.h"
>  #include "xe_gt_clock.h"
> +#include "xe_gt_idle_sysfs.h"
>  #include "xe_gt_mcr.h"
>  #include "xe_gt_pagefault.h"
>  #include "xe_gt_printk.h"
> @@ -383,6 +384,10 @@ static int gt_fw_domain_init(struct xe_gt *gt)
>  	if (err)
>  		goto err_force_wake;
>  
> +	err = xe_gt_idle_sysfs_init(&gt->gtidle);
> +	if (err)
> +		goto err_force_wake;
> +
>  	/* XXX: Fake that we pull the engine mask from hwconfig blob */
>  	gt->info.engine_mask = gt->info.__engine_mask;
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt_idle_sysfs.c b/drivers/gpu/drm/xe/xe_gt_idle_sysfs.c
> new file mode 100644
> index 000000000000..b7de53287f6b
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_gt_idle_sysfs.c
> @@ -0,0 +1,157 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#include <drm/drm_managed.h>
> +
> +#include "xe_device.h"
> +#include "xe_gt.h"
> +#include "xe_gt_idle_sysfs.h"
> +#include "xe_gt_sysfs.h"
> +#include "xe_guc_pc.h"
> +
> +/**
> + * DOC: Xe GT Idle
> + *
> + * Provides sysfs entries for idle properties of GT
> + *
> + * device/gt#/gtidle/name - name of the state
> + * device/gt#/gtidle/idle_residency_ms - Provides residency of the idle state in ms
> + * device/gt#/gtidle/idle_status - Provides current idle state
> + */
> +
> +static struct xe_gt_idle *dev_to_gtidle(struct device *dev)
> +{
> +	struct kobject *kobj = &dev->kobj;
> +
> +	return &kobj_to_gt(kobj->parent)->gtidle;
> +}
> +
> +static struct xe_gt *gtidle_to_gt(struct xe_gt_idle *gtidle)
> +{
> +	return container_of(gtidle, struct xe_gt, gtidle);
> +}
> +
> +static struct xe_guc_pc *gtidle_to_pc(struct xe_gt_idle *gtidle)
> +{
> +	return &gtidle_to_gt(gtidle)->uc.guc.pc;
> +}
> +
> +static const char *gt_idle_state_to_string(enum xe_gt_idle_state state)
> +{
> +	switch (state) {
> +	case GT_IDLE_RC0:
> +		return "rc0";
> +	case GT_IDLE_RC6:
> +		return "rc6";
> +	default:
> +		return "unknown";
> +	}
> +}
> +
> +static u64 get_residency_ms(struct xe_gt_idle *gtidle, u64 cur_residency)
> +{
> +	u64 delta, overflow_residency, prev_residency;
> +
> +	overflow_residency = BIT_ULL(32);
> +	/*
> +	 * Counter wrap handling
> +	 * Store previous hw counter values for counter wrap-around handling
> +	 * Relying on sufficient frequency of queries otherwise counters can still wrap.
> +	 */
> +	prev_residency = gtidle->prev_residency;
> +	gtidle->prev_residency = cur_residency;
> +
> +	/* delta */
> +	if (cur_residency >= prev_residency)
> +		delta = cur_residency - prev_residency;
> +	else
> +		delta = cur_residency + (overflow_residency - prev_residency);
> +
> +	/* Add delta to extended raw driver copy of idle residency */
> +	cur_residency = gtidle->cur_residency + delta;
> +	gtidle->cur_residency = cur_residency;
> +
> +	/* residency multiplier in ns, convert to ms */
> +	return mul_u64_u32_div(cur_residency, gtidle->residency_multiplier, 1e6);
> +}
> +
> +static ssize_t name_show(struct device *dev,
> +			 struct device_attribute *attr, char *buff)
> +{
> +	struct xe_gt_idle *gtidle = dev_to_gtidle(dev);
> +
> +	return sysfs_emit(buff, gtidle->name);
> +}
> +static DEVICE_ATTR_RO(name);
> +
> +static ssize_t idle_status_show(struct device *dev,
> +				struct device_attribute *attr, char *buff)
> +{
> +	struct xe_gt_idle *gtidle = dev_to_gtidle(dev);
> +	struct xe_guc_pc *pc = gtidle_to_pc(gtidle);
> +	enum xe_gt_idle_state state;
> +
> +	state = gtidle->idle_status(pc);
> +
> +	return sysfs_emit(buff, "%s\n", gt_idle_state_to_string(state));
> +}
> +static DEVICE_ATTR_RO(idle_status);
> +
> +static ssize_t idle_residency_ms_show(struct device *dev,
> +				      struct device_attribute *attr, char *buff)
> +{
> +	struct xe_gt_idle *gtidle = dev_to_gtidle(dev);
> +	struct xe_guc_pc *pc = gtidle_to_pc(gtidle);
> +	u64 residency;
> +
> +	residency = gtidle->idle_residency(pc);
> +	return sysfs_emit(buff, "%llu\n", get_residency_ms(gtidle, residency));
> +}
> +static DEVICE_ATTR_RO(idle_residency_ms);
> +
> +static const struct attribute *gt_idle_attrs[] = {
> +	&dev_attr_name.attr,
> +	&dev_attr_idle_status.attr,
> +	&dev_attr_idle_residency_ms.attr,
> +	NULL,
> +};
> +
> +static void gt_idle_sysfs_fini(struct drm_device *drm, void *arg)
> +{
> +	struct kobject *kobj = arg;
> +
> +	sysfs_remove_files(kobj, gt_idle_attrs);
> +	kobject_put(kobj);
> +}
> +
> +int xe_gt_idle_sysfs_init(struct xe_gt_idle *gtidle)
> +{
> +	struct xe_gt *gt = gtidle_to_gt(gtidle);
> +	struct xe_device *xe = gt_to_xe(gt);
> +	struct kobject *kobj;
> +	int err;
> +
> +	kobj = kobject_create_and_add("gtidle", gt->sysfs);
> +	if (!kobj)
> +		return -ENOMEM;
> +
> +	sprintf(gtidle->name, "gt%d-rc\n", gt->info.id);
> +	/* Multiplier for  RC6 Residency counter in units of 1.28us */
> +	gtidle->residency_multiplier = 1280;
> +	gtidle->idle_residency = xe_guc_pc_rc6_residency;
> +	gtidle->idle_status = xe_guc_pc_rc_status;
> +
> +	err = sysfs_create_files(kobj, gt_idle_attrs);
> +	if (err) {
> +		kobject_put(kobj);
> +		return err;
> +	}
> +
> +	err = drmm_add_action_or_reset(&xe->drm, gt_idle_sysfs_fini, kobj);
> +	if (err)
> +		return err;
> +
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_gt_idle_sysfs.h b/drivers/gpu/drm/xe/xe_gt_idle_sysfs.h
> new file mode 100644
> index 000000000000..a654561fda19
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_gt_idle_sysfs.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#ifndef _XE_GT_IDLE_SYSFS_H_
> +#define _XE_GT_IDLE_SYSFS_H_
> +
> +#include "xe_gt_idle_sysfs_types.h"
> +
> +int xe_gt_idle_sysfs_init(struct xe_gt_idle *gtidle);
> +
> +#endif /* _XE_GT_IDLE_SYSFS_H_ */
> diff --git a/drivers/gpu/drm/xe/xe_gt_idle_sysfs_types.h b/drivers/gpu/drm/xe/xe_gt_idle_sysfs_types.h
> new file mode 100644
> index 000000000000..b9cfb37aae75
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_gt_idle_sysfs_types.h
> @@ -0,0 +1,38 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#ifndef _XE_GT_IDLE_SYSFS_TYPES_H_
> +#define _XE_GT_IDLE_SYSFS_TYPES_H_
> +
> +#include <linux/types.h>
> +
> +struct xe_guc_pc;
> +
> +/* States of GT Idle */
> +enum xe_gt_idle_state {
> +	GT_IDLE_RC0,
> +	GT_IDLE_RC6,
> +	GT_IDLE_UNKNOWN,
> +};
> +
> +/**
> + * struct xe_gt_idle - A struct that contains idle properties based of gt
> + */
> +struct xe_gt_idle {
> +	/** @name: name */
> +	char name[16];
> +	/** @residency_multiplier: residency multiplier in ns */
> +	u32 residency_multiplier;
> +	/** @cur_residency: raw driver copy of idle residency */
> +	u64 cur_residency;
> +	/** @prev_residency: previous residency counter */
> +	u64 prev_residency;
> +	/** @idle_status: get the current idle state */
> +	enum xe_gt_idle_state (*idle_status)(struct xe_guc_pc *pc);
> +	/** @idle_residency: get idle residency counter */
> +	u64 (*idle_residency)(struct xe_guc_pc *pc);
> +};
> +
> +#endif /* _XE_GT_IDLE_SYSFS_TYPES_H_ */
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> index 7c47d67aa8be..8dec660f5fc6 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -7,6 +7,7 @@
>  #define _XE_GT_TYPES_H_
>  
>  #include "xe_force_wake_types.h"
> +#include "xe_gt_idle_sysfs_types.h"
>  #include "xe_hw_engine_types.h"
>  #include "xe_hw_fence_types.h"
>  #include "xe_reg_sr_types.h"
> @@ -287,6 +288,9 @@ struct xe_gt {
>  	/** @uc: micro controllers on the GT */
>  	struct xe_uc uc;
>  
> +	/** @gtidle: idle properties of GT */
> +	struct xe_gt_idle gtidle;
> +
>  	/** @engine_ops: submission backend engine operations */
>  	const struct xe_engine_ops *engine_ops;
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index e799faa1c6b8..31c56a0dc210 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -76,12 +76,7 @@
>   *
>   * Render-C states is also a GuC PC feature that is now enabled in Xe for
>   * all platforms.
> - * Xe's GuC PC provides a sysfs API for Render-C States:
>   *
> - * device/gt#/rc* *read-only* files:
> - * - rc_status: Provide the actual immediate status of Render-C: (rc0 or rc6)
> - * - rc6_residency: Provide the rc6_residency counter in units of 1.28 uSec.
> - *                  Prone to overflows.
>   */
>  
>  static struct xe_guc *
> @@ -580,10 +575,12 @@ static ssize_t freq_max_store(struct device *dev, struct device_attribute *attr,
>  }
>  static DEVICE_ATTR_RW(freq_max);
>  
> -static ssize_t rc_status_show(struct device *dev,
> -			      struct device_attribute *attr, char *buff)
> +/**
> + * xe_guc_pc_rc_status - get the current Render C state
> + * @pc - XE_GuC_PC instance
> + */
> +enum xe_gt_idle_state xe_guc_pc_rc_status(struct xe_guc_pc *pc)
>  {
> -	struct xe_guc_pc *pc = dev_to_pc(dev);
>  	struct xe_gt *gt = pc_to_gt(pc);
>  	u32 reg;
>  
> @@ -593,37 +590,30 @@ static ssize_t rc_status_show(struct device *dev,
>  
>  	switch (REG_FIELD_GET(RCN_MASK, reg)) {
>  	case GT_RC6:
> -		return sysfs_emit(buff, "rc6\n");
> +		return GT_IDLE_RC6;
>  	case GT_RC0:
> -		return sysfs_emit(buff, "rc0\n");
> +		return GT_IDLE_RC0;
>  	default:
> -		return -ENOENT;
> +		return GT_IDLE_UNKNOWN;
>  	}
>  }
> -static DEVICE_ATTR_RO(rc_status);
>  
> -static ssize_t rc6_residency_show(struct device *dev,
> -				  struct device_attribute *attr, char *buff)
> +/**
> + * xe_guc_pc_rc6_residency - rc6 residency counter
> + * @pc - Xe_GuC_PC instance
> + */
> +u64 xe_guc_pc_rc6_residency(struct xe_guc_pc *pc)
>  {
> -	struct xe_guc_pc *pc = dev_to_pc(dev);
>  	struct xe_gt *gt = pc_to_gt(pc);
> -	u32 reg;
> -	ssize_t ret;
> +	u64 reg;
>  
> -	xe_device_mem_access_get(pc_to_xe(pc));
> -	ret = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> -	if (ret)
> -		goto out;
> +	xe_device_mem_access_get(gt_to_xe(gt));
>  
>  	reg = xe_mmio_read32(gt, GT_GFX_RC6);
> -	ret = sysfs_emit(buff, "%u\n", reg);
>  
> -	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
> -out:
> -	xe_device_mem_access_put(pc_to_xe(pc));
> -	return ret;
> +	xe_device_mem_access_put(gt_to_xe(gt));
> +	return reg;
>  }
> -static DEVICE_ATTR_RO(rc6_residency);
>  
>  static const struct attribute *pc_attrs[] = {
>  	&dev_attr_freq_act.attr,
> @@ -633,8 +623,6 @@ static const struct attribute *pc_attrs[] = {
>  	&dev_attr_freq_rpn.attr,
>  	&dev_attr_freq_min.attr,
>  	&dev_attr_freq_max.attr,
> -	&dev_attr_rc_status.attr,
> -	&dev_attr_rc6_residency.attr,
>  	NULL
>  };
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h b/drivers/gpu/drm/xe/xe_guc_pc.h
> index da29e4934868..976179dbc9a8 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.h
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.h
> @@ -12,4 +12,6 @@ int xe_guc_pc_init(struct xe_guc_pc *pc);
>  int xe_guc_pc_start(struct xe_guc_pc *pc);
>  int xe_guc_pc_stop(struct xe_guc_pc *pc);
>  
> +enum xe_gt_idle_state xe_guc_pc_rc_status(struct xe_guc_pc *pc);
> +u64 xe_guc_pc_rc6_residency(struct xe_guc_pc *pc);
>  #endif /* _XE_GUC_PC_H_ */
> -- 
> 2.40.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation

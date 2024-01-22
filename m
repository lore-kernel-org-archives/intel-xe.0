Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F681C4725D
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jan 2024 03:54:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DB1110E3ED;
	Mon, 22 Jan 2024 03:54:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9507910E3EE
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Jan 2024 03:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705895658; x=1737431658;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=sA32EPnWWy2DZmIeX1TlBDKFJ/a1RR+477+q522yaMo=;
 b=a2D5q2vwmzvxUsfixNFSBStm4ItHTbTMztPXbkjSbmk3f+7JwxfPvY7q
 Vgcc+qhUI41yRuXqGfa01/HXbz7YgrUd6AIfbdsU6V1UXDJTMKTy+o0dv
 eFpr8Iv/RTedyyTC1vk79EkTejtwHGUVItTyRzCuJ73HQdfjBmnx3N1GJ
 Lu7FFRklKScCJdzdz985acX3tUFrZU0nwZNQqrEPedVlkS+DqAfgwh3xz
 AP8yQ39U/wavBeJf0LIEe9B6l1qaBBeIAWduGeWcxPReHMOOcqpnEhQbu
 8IsDGOkZyBpX+lk1rTX54gYAxiSus6YohJ88jwBWzaaB6fOzfQ1hE67H5 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="487239374"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; d="scan'208";a="487239374"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2024 19:54:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; 
   d="scan'208";a="1047921"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Jan 2024 19:54:17 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 21 Jan 2024 19:54:16 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sun, 21 Jan 2024 19:54:16 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sun, 21 Jan 2024 19:54:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A8shUOwFLxZPzsXjAOzEMW5eppoLVZP1m58owqKlmzF3xICtbyfmmmJ0uyMLqHAfzAr+jdQF3dEJEx1TKq5l7HRFn97AZVB6NYwAfFZJUbpZ+vVveabGwe1/sRB/55DVE5ccgr5qeAJYn8/J5GZWNI7xzrdJtTXyeCzmxN9nQzhFtix8Orf44eKeUytV2lyOrppaRenMhWbuuJ0kgVtF8CsTlxOIwnKwRtH/zI0gVKU/3xWpjD5wFbLtvlJIpHaLPyVdz8WEbqDFOgR5IYWFwseJD+iyJ9hllIRVEBNVJZAXfGjfeo6FBxkQLQL+HJLKguu57jVCpllICF6ACTl1XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nmvMVJ+IMtg/qaZr65drNma+F62XmR7lDJu2wyhGIJU=;
 b=kyzT6XAkJjMLON3L1c7u3s2ozEwSvB8knT9pSgZU2mSHnIoRwdltPhAHm5+M1EtbLFmItqoCEd65p3MQhRKPhbW4mcd4R6kXDBG2Audkkc2vgwHLsmMxuYhW/a6G+4ZSMyDtD/B63WEalMMxpJc0UJs6QlpjUHvzK4xo40ZonrWLeVnTY+0SvKgotx2EVDWsrRDOuEmF9b75M5HZYK5z2zXDt7wwgCE2H6ifqysO97nhvKRwKmPqDxz5ZzkdsL4qqecwQvvliBQjZ6k/f39g3pRgdyFro+KSkN4cO39hwtMFrbnQb0WkG/2398/mJxETKbv0WR2VeRWPUJ4EtYNZsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW4PR11MB6570.namprd11.prod.outlook.com (2603:10b6:303:1e3::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.30; Mon, 22 Jan
 2024 03:54:14 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda%4]) with mapi id 15.20.7202.031; Mon, 22 Jan 2024
 03:54:14 +0000
Date: Mon, 22 Jan 2024 03:53:02 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH 2/4] drm/xe/guc: Introduce GuC context ID Manager
Message-ID: <Za3mnglPKG3zZw0T@DUT025-TGLU.fm.intel.com>
References: <20240110174622.409-1-michal.wajdeczko@intel.com>
 <20240110174622.409-3-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240110174622.409-3-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR13CA0062.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::7) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW4PR11MB6570:EE_
X-MS-Office365-Filtering-Correlation-Id: 313a2e80-5694-4d44-8031-08dc1afdccbc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 61UAFEcbhDVo/+fSXm6YIz7nBIdJIGQJDZELSdcoxlJ/EkpuTo3EkuKXYEKJZcr8ejIHIamhajPLf9OBpERYK4rE0R0ugoBPxPmKNi64GssNyZ8B3Bh7Cu+eJOvKgFfHKQs3XaN6OcF8oODttGLL75zmZA5DsSQTExCIoE9hMOL7NnRONhApfMFSmVXs1MTfnw18CHOfgxiICMOaAExEOppUeB+lt4gY30fbA3CtL14SVUSo6oCML1q9KwOSbu4MJSte5BtVM9Scoup/rHsHku5d8Nf/QrGbq+6bnev7fuf1bJnCgQ3EseV1hocJ3h/5gIr3Acx1KRlV1KkWdLwwU2wVi7i2RBIVHIP5LIbYKnn6pxLxuZgJ3pdO8LhMWoXPphn3a8XzeUvooCb1XOme3RBXCjzWGPXy+siOUhuKGaJUvvHGF17e3ewxTM0UtGL1dKBT/Bs+Dgmh1/44CsYnTL1gUPonfBhtFSbFGiwcc/VHPpufXGu27aqZeP6ibrnR4dtV11BsVGy9xQrLaLM4HYrzIKn2nHCs0Qt87+YVvSl62d571KiLm0u1J0ij+Ice
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(376002)(136003)(366004)(396003)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(5660300002)(26005)(6636002)(6486002)(66476007)(66556008)(6512007)(30864003)(66946007)(2906002)(6666004)(6506007)(478600001)(316002)(4326008)(6862004)(8676002)(8936002)(44832011)(82960400001)(83380400001)(38100700002)(86362001)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?UOzal3HMdjBrJQwQYsAl7ltZMBzUq4ItoUe0b/x1i5jaxPsnst2isFHKHh?=
 =?iso-8859-1?Q?zSfC/5IZbHWUL3MyG+3eFrcuwRLrjhRX1we1UylXM94BmsFtqMNaLAHPxc?=
 =?iso-8859-1?Q?HOI7Ie1O7jE2ydyW1KSd1FntN6u3d5Ea24a3J6hLeAqNqbfnT4FaO01EsX?=
 =?iso-8859-1?Q?KrrM2ox3l4AKsJDHtOI9qNDyBVrHj/OkcbJu7FDF1olwtNNS4Errg2XNL3?=
 =?iso-8859-1?Q?y7mZS9GAevmV6iP5ZIq/hy46TV2vfA0XcPowVE3hGtn1cyo+lVX7uBeznO?=
 =?iso-8859-1?Q?2gjpfAI4eCuxYaAp5SP00tVl1GZ50XxYYIalSUK2uVQkq8jFJRM8KLA7mC?=
 =?iso-8859-1?Q?CdVtH8yY8cRTTzg/j7WX98nyYxSLBOI1RaeEE0QbYn3j5Rst58//fU00XD?=
 =?iso-8859-1?Q?BL+KMIJ8yg0fOnhV9tnvrneMQQ8chjcncb+QN6fGi/36EwM3K76JV7aC0D?=
 =?iso-8859-1?Q?d08Pz2nz0K7SyM8idrHLZkTu8qyTHdh5KaGJy3TNGyCg+v5K6t9NQ7CLmt?=
 =?iso-8859-1?Q?/WRGGt7AIYvQ/Lx1DcDKzxrk5hBLO23gJvn8B665/Dt3+q+FmNwGQTVDbV?=
 =?iso-8859-1?Q?XWFjAj1AHcsT/hIqLTG5yD6TB0QKUSuLdXh/3qfB1HnBsZ4KALWTFCUco8?=
 =?iso-8859-1?Q?yRKlfHY6QOL+HPvsQt6CqPDQIwkJWt5/z8To5mAJzmaoKpKCfO4ZXT2oT0?=
 =?iso-8859-1?Q?jSEIwLSuRV20rbJimRqQUXATzvioXz5DwJ+HB6fkHLEAvybqf7XySUh3As?=
 =?iso-8859-1?Q?Th2NyacxCiJA9E7J8K+fRu/ppZ5BZm+FnxfWL5lQKH3XMaalcCc6V8dx4w?=
 =?iso-8859-1?Q?68ajiHKUp/b4B+Zo8eTnLzlCzm1zRiExswcmHS2i5SFi2AL4E3cW/0MjQZ?=
 =?iso-8859-1?Q?lY1g4m1j/ylbKGdKMLr1qEws9tB/xRylS8wEp27QSmepxhmAzE8A5Yu0Z/?=
 =?iso-8859-1?Q?4F+xxqTtxhm0BUrYy9mLc3rgeZ7LKLnV5XFQJ8MPNdwLoW1A70qKEXQMxN?=
 =?iso-8859-1?Q?ZabJkE0RcJKa9CjNEiGi38WCjS/eyAJyfXDkHS971GOwLu7BaT7BmRfvm3?=
 =?iso-8859-1?Q?nS3YssR2U2LSqjWAfpfT57NB71YNmIDzLlT3JivexKsmGUCd1d3hyMXxcq?=
 =?iso-8859-1?Q?Qn4b1ImdODECoeqzouZo8cS2eNKDkT4w1qVQkBUo36kL+nGC1d7wpoFQ0g?=
 =?iso-8859-1?Q?wBXBkFlAhY1vK0BZNzRYU0MCP8Esy6PVzn5O2I21qzxc6a72rVnnLG22ag?=
 =?iso-8859-1?Q?oi4YbyjSg8WPOj2Jo7YFlwdBLB63De4/xvHqPmWSEzHtFTdgX6tLiW2CZR?=
 =?iso-8859-1?Q?N4d8ukEeNs7X9eehHcsJr1CmAnbaBtTLjCrmcIDxHDR1ZK+7sSU5IGWFuu?=
 =?iso-8859-1?Q?cKuhC9V+YTfYBWfp+2a5vQdvm96wFy4/Ynnjqr5J8GFxGNALYLE70n5zoD?=
 =?iso-8859-1?Q?RSlNGiq3T5t5cRjRPFk3kSCXmOYd7DY2+X53SY7h2j2PrpUa0NeSN45SNO?=
 =?iso-8859-1?Q?Jb4peHQfH9QWFkFQOc5GxngYIGDJOfaU5LqBM42gCt/XoBagsa98DK7mTO?=
 =?iso-8859-1?Q?F7BXAx4xOxCVjX29BlVkm+cfB7c2Dj9nIk3SYoMjAU47rzwVabMHRPhStc?=
 =?iso-8859-1?Q?/wZBURxFgqng7IN6s38nXkcUFYgsKbI+dYer063B62pC4otTtHQDLzPg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 313a2e80-5694-4d44-8031-08dc1afdccbc
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2024 03:54:14.5291 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /p98jK3TIs1Su3+nribJ+E/ti0IWFXmFUdiTjtrP3M9+eHcXJWOJCOHC9uXIQ0YJ+cccr+DI6RBOuCKZS8MlAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6570
X-OriginatorOrg: intel.com
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

On Wed, Jan 10, 2024 at 06:46:20PM +0100, Michal Wajdeczko wrote:
> While we are already managing GuC IDs directly in GuC submission
> code, using bitmap() for MLRC and ida() for SLRC, this code can't
> be easily extended to meet additional requirements for SR-IOV use
> cases, like limited number of IDs available on VFs, or ID range
> reservation for provisioning VFs by the PF.
> 
> Add a separate component for managing GuC IDs, that will replace
> existing ID management. Start with bitmap() based implementation
> that could be optimized later based on perf data.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile        |   1 +
>  drivers/gpu/drm/xe/xe_guc_id_mgr.c | 288 +++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_guc_id_mgr.h |  22 +++
>  drivers/gpu/drm/xe/xe_guc_types.h  |  17 ++
>  4 files changed, 328 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_guc_id_mgr.c
>  create mode 100644 drivers/gpu/drm/xe/xe_guc_id_mgr.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index f3495d0e701c..1e804b155063 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -96,6 +96,7 @@ xe-y += xe_bb.o \
>  	xe_guc_db_mgr.o \
>  	xe_guc_debugfs.o \
>  	xe_guc_hwconfig.o \
> +	xe_guc_id_mgr.o \
>  	xe_guc_log.o \
>  	xe_guc_pc.o \
>  	xe_guc_submit.o \
> diff --git a/drivers/gpu/drm/xe/xe_guc_id_mgr.c b/drivers/gpu/drm/xe/xe_guc_id_mgr.c
> new file mode 100644
> index 000000000000..a6aacf92a28e
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_guc_id_mgr.c
> @@ -0,0 +1,288 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#include <linux/bitmap.h>
> +#include <linux/mutex.h>
> +
> +#include <drm/drm_managed.h>
> +
> +#include "xe_assert.h"
> +#include "xe_gt_printk.h"
> +#include "xe_guc.h"
> +#include "xe_guc_id_mgr.h"
> +#include "xe_guc_types.h"
> +
> +static struct xe_guc *idm_to_guc(struct xe_guc_id_mgr *idm)
> +{
> +	return container_of(idm, struct xe_guc, idm);
> +}
> +
> +static struct xe_gt *idm_to_gt(struct xe_guc_id_mgr *idm)
> +{
> +	return guc_to_gt(idm_to_guc(idm));
> +}
> +
> +static struct xe_device *idm_to_xe(struct xe_guc_id_mgr *idm)
> +{
> +	return gt_to_xe(idm_to_gt(idm));
> +}
> +
> +#define idm_assert(_idm, _cond)		xe_gt_assert(idm_to_gt(_idm), _cond)
> +#define idm_mutex(_idm)			(&idm_to_guc(_idm)->submission_state.lock)
> +
> +static void idm_print_locked(struct xe_guc_id_mgr *idm, struct drm_printer *p, int indent);
> +
> +static void __fini_idm(struct drm_device *drm, void *arg)
> +{
> +	struct xe_guc_id_mgr *idm = arg;
> +	unsigned int weight;
> +
> +	mutex_lock(idm_mutex(idm));
> +
> +	weight = bitmap_weight(idm->bitmap, idm->total);
> +	idm_assert(idm, idm->used == 0);
> +	idm_assert(idm, idm->used == weight);

I find this confusing.

How about:
	idm_assert(idm, weight == 0);

> +	if (weight) {
> +		struct drm_printer p = xe_gt_info_printer(idm_to_gt(idm));
> +
> +		xe_gt_err(idm_to_gt(idm), "GUC ID manager unclean (%u/%u)\n",
> +			  weight, idm->total);
> +		idm_print_locked(idm, &p, 1);
> +	}

Isn't the above assert plus these error messages a bit redunant?

> +
> +	bitmap_free(idm->bitmap);
> +	idm->bitmap = NULL;
> +	idm->total = 0;
> +	idm->used = 0;
> +
> +	mutex_unlock(idm_mutex(idm));
> +}
> +
> +/**
> + * xe_guc_id_mgr_init() - Initialize GuC context ID Manager.
> + * @idm: the &xe_guc_id_mgr to initialize
> + * @limit: number of IDs to manage
> + *
> + * The bare-metal or PF driver can pass ~0 as &limit to indicate that all
> + * context IDs supported by the GuC firmware are available for use.
> + *
> + * Only VF drivers will have to provide explicit number of context IDs
> + * that they can use.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_guc_id_mgr_init(struct xe_guc_id_mgr *idm, unsigned int limit)
> +{
> +	int ret;
> +
> +	idm_assert(idm, !idm->bitmap);
> +	idm_assert(idm, !idm->total);
> +	idm_assert(idm, !idm->used);
> +
> +	if (limit == ~0)
> +		limit = GUC_ID_MAX;
> +	else if (limit > GUC_ID_MAX)
> +		return -ERANGE;
> +	else if (!limit)
> +		return -EINVAL;
> +
> +	idm->bitmap = bitmap_zalloc(limit, GFP_KERNEL);
> +	if (!idm->bitmap)
> +		return -ENOMEM;
> +	idm->total = limit;
> +
> +	ret = drmm_add_action_or_reset(&idm_to_xe(idm)->drm, __fini_idm, idm);
> +	if (ret)
> +		return ret;
> +
> +	xe_gt_info(idm_to_gt(idm), "using %u GUC ID(s)\n", idm->total);
> +	return 0;
> +}
> +
> +static unsigned int find_last_zero_area(unsigned long *bitmap,
> +					unsigned int total,
> +					unsigned int count)
> +{
> +	unsigned int found = total;
> +	unsigned int rs, re, range;
> +
> +	for_each_clear_bitrange(rs, re, bitmap, total) {
> +		range = re - rs;
> +		if (range < count)
> +			continue;
> +		found = rs + (range - count);
> +	}
> +	return found;
> +}
> +
> +static int idm_reserve_chunk_locked(struct xe_guc_id_mgr *idm,
> +				    unsigned int count, int order, unsigned int spare)
> +{

I'm confused by having both count and order arguments.

> +	int id;
> +
> +	idm_assert(idm, count);
> +	idm_assert(idm, count == 1 || order == 0);
> +	idm_assert(idm, spare == 0 || order == 0);
> +	lockdep_assert_held(idm_mutex(idm));
> +
> +	if (!idm->total)
> +		return -ENODATA;
> +
> +	if (spare) {
> +		idm_assert(idm, order == 0);

So order isn't used here?

Also do we need idm_assert(idm, spare == 0 || order == 0); &&
idm_assert(idm, order == 0); here?

> +
> +		/*
> +		 * For IDs reservations (used on PF for VFs) we want to make
> +		 * sure there will be at least 'spare' available for the PF.
> +		 */
> +		if (idm->used + count + spare > idm->total)
> +			return -EDQUOT;
> +		/*
> +		 * And we want to place them as close to the end as possible.
> +		 */
> +		id = find_last_zero_area(idm->bitmap, idm->total, count);

Shouldn't we start this search at spare?

> +		if (id >= idm->total)
> +			return -ENOSPC;
> +		bitmap_set(idm->bitmap, id, count);
> +	} else {
> +		idm_assert(idm, count == 1);
> +

And count isn't used here?

Can we have we just have count or order (i.e. not both)?

> +		id = bitmap_find_free_region(idm->bitmap, idm->total, order);
> +		if (id < 0)
> +			return -ENOSPC;
> +		count <<= order;
> +	}
> +
> +	idm->used += count;
> +	return id;
> +}
> +
> +static void idm_release_chunk_locked(struct xe_guc_id_mgr *idm,
> +				     unsigned int start, unsigned int count)
> +{
> +	idm_assert(idm, count);
> +	idm_assert(idm, count <= idm->used);
> +	idm_assert(idm, start < idm->total);
> +	idm_assert(idm, start + count <= idm->total);
> +	lockdep_assert_held(idm_mutex(idm));
> +
> +	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG)) {
> +		unsigned int n;
> +
> +		for (n = 0; n < count; n++)
> +			idm_assert(idm, test_bit(start + n, idm->bitmap));
> +	}
> +	bitmap_clear(idm->bitmap, start, count);
> +	idm->used -= count;
> +}
> +
> +/**
> + * xe_guc_id_mgr_reserve_locked() - Reserve a GuC context ID or IDs.
> + * @idm: the &xe_guc_id_mgr
> + * @order: 2^order of IDs to allocate
> + *
> + * This function expects that submission lock is already taken.
> + *
> + * Return: ID of allocated GuC context or a negative error code on failure.
> + */
> +int xe_guc_id_mgr_reserve_locked(struct xe_guc_id_mgr *idm, int order)
> +{
> +	return idm_reserve_chunk_locked(idm, 1, order, 0);

Same comment as above - can we pick either count or order as an
argument?

> +}
> +
> +/**
> + * xe_guc_id_mgr_release_locked() - Release a GuC context ID or IDs.
> + * @idm: the &xe_guc_id_mgr
> + * @id: the GuC context ID to release
> + * @order: 2^order of IDs to release
> + *
> + * This function expects that submission lock is already taken.
> + */
> +void xe_guc_id_mgr_release_locked(struct xe_guc_id_mgr *idm, unsigned int id, int order)
> +{
> +	return idm_release_chunk_locked(idm, id, 1 << order);
> +}
> +
> +/**
> + * xe_guc_id_mgr_reserve_range() - Reserve a range of GuC context IDs.
> + * @idm: the &xe_guc_id_mgr
> + * @count: number of GuC context IDs to reserve (can't be 0)
> + * @spare: number of GuC context IDs to keep available (can't be 0)

s/spare/reserved?

> + *
> + * This function is dedicated for the for use by the PF driver which expects
> + * that allocated range for the VF will be contiguous and that there will be
> + * at least &spare IDs still available for the PF use after this reservation.

Just can give an example of the argument values a PF would call this
with so I make sure I understand the use case for this?

> + *
> + * Return: starting ID of the allocated GuC context ID range or
> + *         a negative error code on failure.
> + */
> +int xe_guc_id_mgr_reserve_range(struct xe_guc_id_mgr *idm,
> +				unsigned int count, unsigned int spare)
> +{
> +	int ret;
> +
> +	idm_assert(idm, count);
> +	idm_assert(idm, spare);
> +
> +	mutex_lock(idm_mutex(idm));
> +	ret = idm_reserve_chunk_locked(idm, count, 0, spare);
> +	mutex_unlock(idm_mutex(idm));
> +
> +	return ret;
> +}
> +
> +/**
> + * xe_guc_id_mgr_release_range() - Release a range of GuC context IDs.
> + * @idm: the &xe_guc_id_mgr
> + * @start: the starting ID of GuC context range to release
> + * @count: number of GuC context IDs to release
> + */
> +void xe_guc_id_mgr_release_range(struct xe_guc_id_mgr *idm,
> +				 unsigned int start, unsigned int count)

Also kinda odd / inconsistent that
xe_guc_id_mgr_reserve_range/xe_guc_id_mgr_release_range use a count
argument and xe_guc_id_mgr_reserve_locked/xe_guc_id_mgr_release_locked
use an order argument? Can this be made consistent? Either order or
count argument for both?

> +{
> +	mutex_lock(idm_mutex(idm));
> +	idm_release_chunk_locked(idm, start, count);
> +	mutex_unlock(idm_mutex(idm));
> +}
> +
> +static void idm_print_locked(struct xe_guc_id_mgr *idm, struct drm_printer *p, int indent)
> +{
> +	unsigned int rs, re;
> +	unsigned int total;
> +
> +	lockdep_assert_held(idm_mutex(idm));
> +
> +	drm_printf_indent(p, indent, "count %u\n", idm->total);
> +	if (!idm->bitmap)
> +		return;
> +
> +	total = 0;
> +	for_each_clear_bitrange(rs, re, idm->bitmap, idm->total) {
> +		drm_printf_indent(p, indent, "available range %u..%u (%u)\n", rs, re - 1, re - rs);
> +		total += re - rs;
> +	}
> +	drm_printf_indent(p, indent, "available total %u\n", total);
> +
> +	total = 0;
> +	for_each_set_bitrange(rs, re, idm->bitmap, idm->total) {
> +		drm_printf_indent(p, indent, "reserved range %u..%u (%u)\n", rs, re - 1, re - rs);

A bit redundant to print both set and clear as they are inverses. Maybe
even a bit verbose to print either?

> +		total += re - rs;
> +	}
> +	drm_printf_indent(p, indent, "reserved total %u\n", total);
> +	drm_printf_indent(p, indent, "used %u\n", idm->used);
> +}
> +
> +/**
> + * xe_guc_id_mgr_print() - Print status of GuC ID Manager.
> + * @idm: the &xe_guc_id_mgr to print
> + * @p: the &drm_printer to print to
> + * @indent: tab indentation level
> + */
> +void xe_guc_id_mgr_print(struct xe_guc_id_mgr *idm, struct drm_printer *p, int indent)

What is the usage of this function? Debugfs? Maybe this obvious by
looking later in the series?

> +{
> +	mutex_lock(idm_mutex(idm));
> +	idm_print_locked(idm, p, indent);
> +	mutex_unlock(idm_mutex(idm));
> +}
> diff --git a/drivers/gpu/drm/xe/xe_guc_id_mgr.h b/drivers/gpu/drm/xe/xe_guc_id_mgr.h
> new file mode 100644
> index 000000000000..f70a908d9d4a
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_guc_id_mgr.h
> @@ -0,0 +1,22 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#ifndef _XE_GUC_ID_MGR_H_
> +#define _XE_GUC_ID_MGR_H_
> +
> +struct drm_printer;
> +struct xe_guc_id_mgr;
> +
> +int xe_guc_id_mgr_init(struct xe_guc_id_mgr *idm, unsigned int count);
> +
> +int xe_guc_id_mgr_reserve_locked(struct xe_guc_id_mgr *idm, int order);
> +void xe_guc_id_mgr_release_locked(struct xe_guc_id_mgr *idm, unsigned int id, int order);
> +
> +int xe_guc_id_mgr_reserve_range(struct xe_guc_id_mgr *idm, unsigned int count, unsigned int spare);
> +void xe_guc_id_mgr_release_range(struct xe_guc_id_mgr *idm, unsigned int start, unsigned int count);
> +
> +void xe_guc_id_mgr_print(struct xe_guc_id_mgr *idm, struct drm_printer *p, int indent);
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_guc_types.h b/drivers/gpu/drm/xe/xe_guc_types.h
> index dc6059de669c..04529be0917e 100644
> --- a/drivers/gpu/drm/xe/xe_guc_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_types.h
> @@ -31,6 +31,21 @@ struct xe_guc_db_mgr {
>  	unsigned long *bitmap;
>  };
>  
> +/**
> + * struct xe_guc_id_mgr - GuC context ID Manager.
> + *
> + * Note: GuC context ID Manager is relying on &xe_guc::submission_state.lock
> + * to protect its members.
> + */
> +struct xe_guc_id_mgr {
> +	/** @bitmap: bitmap to track allocated IDs */
> +	unsigned long *bitmap;
> +	/** @total: total number of IDs being managed */
> +	unsigned int total;
> +	/** @used: number of IDs currently in use */
> +	unsigned int used;
> +};
> +

Should this be in xe_guc_id_mgr_types.h?

>  /**
>   * struct xe_guc - Graphic micro controller
>   */
> @@ -47,6 +62,8 @@ struct xe_guc {
>  	struct xe_guc_pc pc;
>  	/** @dbm: GuC Doorbell Manager */
>  	struct xe_guc_db_mgr dbm;
> +	/** @idm: GuC context ID Manager */
> +	struct xe_guc_id_mgr idm;

I'd personally move idm & dbm under the 'GuC submission state'

Matt

>  	/** @submission_state: GuC submission state */
>  	struct {
>  		/** @exec_queue_lookup: Lookup an xe_engine from guc_id */
> -- 
> 2.25.1
> 

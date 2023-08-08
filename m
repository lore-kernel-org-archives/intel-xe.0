Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39E18C04FDF
	for <intel-xe@archiver.kernel.org>; Tue,  8 Aug 2023 18:59:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0069410E3F0;
	Tue,  8 Aug 2023 18:59:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2161A10E3F0
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Aug 2023 18:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691521162; x=1723057162;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=MD/eQCmGjDndf++TfrtyQ8NwiowBaCuppSRhSJwKNdo=;
 b=Wt6Z39415R2l2Ydz2xM4v7x2Zux/D+aCcmRhQnn3pBKIAewNUYJsD7en
 cm3DGPhkqO4GMXeiT8qGrVtQHXlky4ADmacqd2zMTR3m0hqhHvcZFFr1l
 hCKh+t2fEDIn8YjA8qM7o/270lSilLiBakI0Yj+8giAkhAU0TiWY45eTM
 SyHlaq9U3yk+YPvwRBMqAWsLf9z+sZwwzRgmJL4b2Gx3/QbQiiWgT2mby
 8pAxGS321SDr7Jjv9aqPwMF4Q7bao4T3r/XUB87QyIGMEY3vzXgZHKVfz
 J2pBxRbQV+w3CPc477k2DRMO2jDyUXTT1eA00Fb+TzPf3Pjh9M72IN7em w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="374632962"
X-IronPort-AV: E=Sophos;i="6.01,157,1684825200"; d="scan'208";a="374632962"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2023 11:43:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="681369810"
X-IronPort-AV: E=Sophos;i="6.01,157,1684825200"; d="scan'208";a="681369810"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga003.jf.intel.com with ESMTP; 08 Aug 2023 11:43:45 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 8 Aug 2023 11:43:44 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 8 Aug 2023 11:43:44 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 8 Aug 2023 11:43:44 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 8 Aug 2023 11:43:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OYi+dGTRvBEffHb2vwN+qMKzYa5Plc2X3kJndXlUUWwTtiZdR1iNDD547I6oYUDEfFLfxyLvM8J+3UFtKNKMp59Qc2uwru+N+uPxPgL7d380Q6jXlJF6yJAavF9H/s7IMqwOQsTTbuLjPoaPsIuVuBWBQ+lIAzdd00L3D8I1Qt1X665Tu3nWLHzLLNA3mmvUFZJ/Efll2t3jbrTWWkLaL/hmvBNQL+KzrkqYtMJFv4Vz/4RwMB7s9J0NW2CZiTWN+j0Ncsw22s5Mu3/vvMVRMoSgxhvw86Ue/NIN8Qfs7fXL8HP44Fj9sEfu9nTZb96UhtjRZIPfikvMHoiIJl3qLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+jR8axdDqieM2NV5Cia3Nqun/jaBMGsAPKKwmrNGAWA=;
 b=IWrxl/XDwpnBZCsszZ6TPazbH5Hf911a2dWumQpbk/ddShqa9QiVQyFtt8imol5cWjr9qqbkH7kiftCB4FMtB1Z7Wb53EvmMqXbd5g1bE5oUms69zJ1zJB4LE1oP1lhX+4hWHi0o8ZoEBp+dPFQZ4U3tBwqJbhVPQqWSrapuvFNPpZR45/jUxYmk5oh5tBY3A7SnJe2gB/zE3r3W2p5d1IuC1q91PBE3swosZzfUSoFJel49mGId9AGwn2vF5aW34zxnvwZHWyRTnuL0YLdb0px9Sc6Yv7z3jKSzoPffEuZJj6XzOR0zdLNYC3ayyZX4R3do9FG7OfPfcqACTY6NxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA1PR11MB6758.namprd11.prod.outlook.com (2603:10b6:806:25d::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.25; Tue, 8 Aug
 2023 18:43:34 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6652.026; Tue, 8 Aug 2023
 18:43:34 +0000
Date: Tue, 8 Aug 2023 14:43:29 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: David Kershner <david.kershner@intel.com>
Message-ID: <ZNKM0WeE1vbZ1Yqz@intel.com>
References: <20230808164534.1027552-1-david.kershner@intel.com>
 <20230808164534.1027552-2-david.kershner@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230808164534.1027552-2-david.kershner@intel.com>
X-ClientProxiedBy: BYAPR05CA0002.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::15) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA1PR11MB6758:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d16b991-7275-4b13-2f68-08db983f5e98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: p9Yr29OBPJbnRcD9nHx8gGdL2dY2fntHLgUU1fH1EDmTnzDXoauS6KjTcRDeWX84BHV7m+sGnNC9DmIs8biBDkYU8yNSUdKWbY73aItNPP4+VwF0zFkWM+8QkKePMUjcqAXTUeOZQrZXt7ForqL/WqxenSskt5zG2W+sRmZVWnKgd72volpDuUuKKNlBakFF3Dc6zMyuhKPKE4rvQ/k4zGSph3RmdPinrPB3zT+jtPBkcWoRUSOHhiqh4gO57M8m+2uSipRtW+sCkG1cuUTCsfhmiS2C63HlUye22NmPmKv343apgWVBtlhQFfX+3vqQns/KT9AI/6INkXk+TOU+WRj9OHb6zODfOlqKicMccVCoejF++tkH7CDDp6vPqywj+ljQfaXZLX8hUCOQbLlCCB93Bpf5NvE6CpL1Okgcf9wiat4j/ubpd63S6iObJQcXwgsQvbWcLapga4HLylRMQNLKXm/xhDwGDjd8CLRn2ohDRUFRslFLooNJSOrxkgKj1942KuMl1fgfj5/qrnoISJ1oq4PEApJ50uhI+DkSUDSwSP0sKcE8W6GB6xJttarb
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(6029001)(376002)(396003)(136003)(346002)(39860400002)(366004)(451199021)(1800799003)(186006)(36756003)(2906002)(83380400001)(316002)(8936002)(66556008)(66476007)(2616005)(8676002)(41300700001)(37006003)(6506007)(66946007)(6486002)(26005)(6666004)(478600001)(4326008)(6512007)(107886003)(6636002)(44832011)(86362001)(6862004)(5660300002)(38100700002)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?nCMnDdL2GaflTGbhaEahkjwaRsG58xVbsia2v5jtahBasBfjJvgpYKe6aK?=
 =?iso-8859-1?Q?wensogxLP3f1bvO0Rw/sgxByeZ9bwyGEsOp0tGLzNl7+Z9giRiKluFGE8S?=
 =?iso-8859-1?Q?qGs/l8xdbbzN04xWy8QbqNEdwZCMH2dEK0LF4nWOq6ysXEVtI/gQUXB3DW?=
 =?iso-8859-1?Q?TviCxIFgtZ4gQlV/Ayh1vApEhIF29D509vKZkAmSPcB4WTlLLLrghpXWjh?=
 =?iso-8859-1?Q?CW/bwEExKrDJdf3cDxK/n8vzSpUgenk24NJN9ebh9ktYnnibgrg5M36U81?=
 =?iso-8859-1?Q?hXmRuw+CvaUBQfJ3vdPkCKLpXOj8FJAsIftikCk9jcT7HjjphbMUdVFf/T?=
 =?iso-8859-1?Q?USNGaOuBE3En/2UNi4pI7yWFX95XugtQlEmdQOFhVspzXxjOg0msHJU9Ya?=
 =?iso-8859-1?Q?ZQHzd8ZEr1twI4jrkYT2LGqXQhh679RICH3Ns6YqXYMV/nEe3zWSxfafAn?=
 =?iso-8859-1?Q?7m6oMcwT2bJk+/IoTJut13Ctqom49PZP7S3w7kUk/Ppz865D7j+QtZi3YP?=
 =?iso-8859-1?Q?hbs777n4EqKz5qXwyQ2OhAzmbKhhRjUO/8Rcs4M156q3BeIsLWrPQf0ZlX?=
 =?iso-8859-1?Q?6z8oxEBQF9MYoAEnhF0jx2VfuOaxyGyTquoTdMB0JlqUR5TmhJSzpyDwpf?=
 =?iso-8859-1?Q?abk7Na5/k1OLTzAZ6yBiAXe7E3fyW3jlk6nbCzB2WzbH8MAjP7qXpc0taH?=
 =?iso-8859-1?Q?S7sZc0eDZZc67oYn5ah+NbhdUIqiRRkJEpJZd4ZCc4PVm5KEGZChR4p/57?=
 =?iso-8859-1?Q?RpbH+OwRrDv3qffjUOSXauNIy70gGLXNYys0LnINTXyAYrsGT0M0NMcPnw?=
 =?iso-8859-1?Q?jR1ZJ/4ZBhTSHuF/RcBlLNf+XLIHRAsF2tIrZP94OtaalCUux0S8yrR3LD?=
 =?iso-8859-1?Q?cLNoQBTymzkJhSAQpwNS4cq73SAptUzDr76cTF1CTFbFjpNELAsVogWs7z?=
 =?iso-8859-1?Q?P6esScgJkLkAfhRh8AfDBxxO7s0MjxuHyIp80h+puQAzU6FsjWk8VMtz2f?=
 =?iso-8859-1?Q?UyOKPoZ9SMjEpZCT/3O8OdIz2ZBfjtc4oWkdTJCg1sQJzjmIMc2aetIu6Y?=
 =?iso-8859-1?Q?g3lw5RLoUZFVGTTqXjvyZXsFYsXEjR17evAuP+upgLBupnKQ/Uid9m2XCw?=
 =?iso-8859-1?Q?u2dp1NRmXx8tBIZsVD3qoz0ABQgsdKlByNZUa7jTjYad0R0CoF4rXngKR3?=
 =?iso-8859-1?Q?9OGlgxwQsUvRXE9UWA++O5paj5uNIdZD9JWj0B7t9atw5LdAHOAKXXl7yT?=
 =?iso-8859-1?Q?qnFT1euBtok06n7nV8/MJplUb5JDqzfHSkX+ZWsaHBIhAIKyLj++xlHZRR?=
 =?iso-8859-1?Q?Kjtwe7Qo82buh5YlkOxUMUM17tauy3yl1/mvEi1moaFUxIZ0hakLAcbTIS?=
 =?iso-8859-1?Q?vVpxc/7+fgd/2zo8vYZJE57URkh6xh6bqkFEdKYLZPkcSbAPzZ+lO2hkNa?=
 =?iso-8859-1?Q?AY3nKL4wSXme9HQff60xls30UQzxUgIZcji7gv9PZpJ94iZ9urGFbNOXV1?=
 =?iso-8859-1?Q?dg/TRAufSROuyvigEwE9qg1fvm6s6VMJ/wTWwGr26/xK6BSfmYTpzP1mBt?=
 =?iso-8859-1?Q?dC8+yBHq74qUwwZXwT1yz3W1/6r67FZMwguDGngjXJUkHqxJZEvCg4Rb2+?=
 =?iso-8859-1?Q?WTmvEtQiH/W6/kI76oMwWKfW/d45tJuond1cCxMOVeHDUNX89/3rOJ1Q?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d16b991-7275-4b13-2f68-08db983f5e98
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2023 18:43:34.2830 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: srCKex7tc6SrWLamSEXA+gjvr6HhJilN0U3SsM7MKBqio9vgH9kBJzh1L9vMwBr1F8SzTTlAui5YWo7AnyyLKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6758
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/3] drm/xe: Introduce a module parameter to
 control XeLink
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
Cc: lucas.demarchi@intel.com, john.fleck@intel.com, matthew.d.roper@intel.com,
 intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Aug 08, 2023 at 12:45:32PM -0400, David Kershner wrote:
> Add a new module parameter to control enable/disable of the XeLink
> feature.
> 
> Signed-off-by: David Kershner <david.kershner@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/Makefile    |  3 ++-
>  drivers/gpu/drm/xe/xe_xelink.c | 17 +++++++++++++++++
>  2 files changed, 19 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/xe/xe_xelink.c
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 1b59702cd9f9..d46558cf12a9 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -115,7 +115,8 @@ xe-y += xe_bb.o \
>  	xe_vm_madvise.o \
>  	xe_wait_user_fence.o \
>  	xe_wa.o \
> -	xe_wopcm.o
> +	xe_wopcm.o \
> +	xe_xelink.o
>  
>  # i915 Display compat #defines and #includes
>  subdir-ccflags-$(CONFIG_DRM_XE_DISPLAY) += \
> diff --git a/drivers/gpu/drm/xe/xe_xelink.c b/drivers/gpu/drm/xe/xe_xelink.c
> new file mode 100644
> index 000000000000..51a31f6a4740
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_xelink.c
> @@ -0,0 +1,17 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#include <linux/moduleparam.h>
> +
> +/*
> + * This module parameter is needed because SRIOV PF and XeLink are mutually
> + * exclusive. The driver needs to be able to enable/disable the XeLink
> + * infrastructure (specifically Device Physical Addressing).  Since there
> + * will be no enable/disable for the SRIOV PF path, this parameter is
> + * needed to explicitly disable XeLink when SRIOV PF is required.
> + */
> +static bool xe_enable_xelink = true;
> +module_param_named(enable_xelink, xe_enable_xelink, bool, 0400);
> +MODULE_PARM_DESC(enable_xelink, "Enable XeLink feature (default: true)");
> -- 
> 2.35.1
> 

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC709C77B75
	for <intel-xe@archiver.kernel.org>; Wed, 17 May 2023 20:49:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 920E110E272;
	Wed, 17 May 2023 20:49:57 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58F3B10E272
 for <intel-xe@lists.freedesktop.org>; Wed, 17 May 2023 20:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684356595; x=1715892595;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=LHgHu2FnbZ3dTLglnxyPE3H4uT3Skn11Nr5xS6zvlvY=;
 b=YRMgC6Ie2Uq9p1Rs6qFkMdFIn5HdN9+NTaRkMt2rDtK/OKegufl6FrnS
 yLr3oKMo7hPPxAHgZt7xbel02hWstFIr0JslZgmdNshBtmHq7d/APXuH+
 ggpIp9KloJJ0CiBLr0OFTmgGiSxXBK9McgHmT40N2nX6/95liONpNs/fP
 TBQ/tRPKspjjFgTGgauEYWADcmeWWVirlSpcGyCWs0Uoe4NHnJvUltHHM
 9sI3Khl++4YzZTCxOF5/RkEbryp4S/VHTtIoQKE0Sj6/WuZI6kAyGCofX
 C2xwtWEaYqLEMbJonoVdvvAlMUHLRYe/rRMoqCtUEO5ajIiJYhSs+mFdi Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="350705119"
X-IronPort-AV: E=Sophos;i="5.99,283,1677571200"; d="scan'208";a="350705119"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2023 13:49:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="876167257"
X-IronPort-AV: E=Sophos;i="5.99,283,1677571200"; d="scan'208";a="876167257"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga005.jf.intel.com with ESMTP; 17 May 2023 13:49:25 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 17 May 2023 13:49:24 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 17 May 2023 13:49:24 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 17 May 2023 13:49:24 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.109)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 17 May 2023 13:49:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A31mVbMJ88KdXK4pbXdgcqVjNxMGoR1lafaJbmpvu+2AmUBU5K/kL2OqOTOrv/VIMMlhXx2KxLc5qWsDfGaXPOCtPb7zw5YKoEz64nd6ptGKhIHXWlY+3jjbhEZxhjWHEngidvZtDnDrt73LnCt5ChjnW10iu8Z8NujPUw0LuTY6q9b7FBVSdA+yciXCWzr5LmRu8tPlXjsdiap2eIE/JTc2HpQif/cptwDGFoHVavcurWjATnM3ww02es+Z6+nQqET6Tf5OdVhcluqQJz8sm3m3d7R2k7+C/iTnFhH+dJz4eDx5sqiX9t8zz4hulhmdUnqci2m1+cFd5ggyrrLBRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6csDH1FRKFQr2QdmwJjBrtjG+7+D4jvSUaMn6FGm+Zk=;
 b=k18DvUiaBJ0YVyCe5sg0ZMdzuNG5K+hkx6MDqmHFxUD+Zyrr8glkufsOxQsVnZk2nXOL5ZU18kx2REHi/eQo19+5oaj3T/6inzz5UePTugRjgWhWufK1spDBLKRUKH6Zao2ZUBEXOWL3NhcSNWOuhncIa3YgiLjy4TFsICeYHhvF4cMlt8vdiUmiXT/7ITjbJjyg7N8+dKlke7bniKhYSNSJ4/RXqthQyj0/tmVWVi1pZGU2Wi67EOnvI0ImltppptcZRnlgqv7RVJ7kaB+JfzrIcyBoEB1CUZpFbCB1HyhaOdahPHgoXSgAafs0vXxeE+rEPx6dxK3MdTZQeFJPkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 CO1PR11MB5156.namprd11.prod.outlook.com (2603:10b6:303:94::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6411.17; Wed, 17 May 2023 20:49:22 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396%6]) with mapi id 15.20.6387.030; Wed, 17 May 2023
 20:49:22 +0000
Date: Wed, 17 May 2023 13:49:19 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230517204919.GU10045@mdroper-desk1.amr.corp.intel.com>
References: <20230516221950.3512818-1-lucas.demarchi@intel.com>
 <20230516221950.3512818-9-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230516221950.3512818-9-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR05CA0048.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::23) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|CO1PR11MB5156:EE_
X-MS-Office365-Filtering-Correlation-Id: 4bb8d3e6-a2de-410f-dbed-08db57183120
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: F78hGOQJex5PHsOuuoVP7CKti8tf6Qlxifr7BxcmSH2AN7nsRT3uasak3Tf9S47gp1wb6k5FJXGX6efDFrCp8DZwXEgE3Z4ccJXFh4/72L6jbEsNllah3V/zJ7YS14ginwcSu4X/PF/IfSZNe0YByaJuD+taw2I7hrmDw/lVeLfhGuv6++/hBpRHKXmBuqauuRq/UaAR69KELgUOPF4+Eb3pFhwsG8aUEqhnOpJiWwx4tlRx9Utvdl4/j61V+iOIUCFr8/ZKjG2NUITU23vuMRDD/nwGz1R8JTpzugmTsWP+g1ijep1WNhiJs8rsL4f4iZrNLbVHgvMzkZV/Me4k9gok230XKywsvjXL7CfclZIAEMeDkV26nJdUvt2grCFOk8JOo1oy+kfCHtuN7Dutyb35OOeRfS3ZBS6LdJ81uC/KvgkY7pNYfZbhoxV9ms3uOkJtmGeTKioDN/jl9P3nNPGtQ4JravS862CPw2+SiZkkBFSA4I+R7jbNYdSv1AE/8v5ZNiNhYBVQaHgU7dhJtmfT8G3RnOh844bHQg0F+RZrgaMtNCpnRbWZkiqbh/y7
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(136003)(396003)(346002)(376002)(39860400002)(451199021)(6506007)(6512007)(26005)(1076003)(186003)(38100700002)(107886003)(82960400001)(83380400001)(33656002)(5660300002)(6486002)(6666004)(478600001)(6862004)(8676002)(8936002)(66476007)(66556008)(66946007)(86362001)(316002)(4326008)(6636002)(41300700001)(2906002)(30864003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?5ZHW9HaUyJABuVL2GKPnT6wURX6apUro7lMpyiDwhudZ7SRpN8t9WbwfPM?=
 =?iso-8859-1?Q?RWICEVuqEvxV/AcG5CArhhYNOrRPghcH/xifZNGDNImpp9/FlaMxbj4aKG?=
 =?iso-8859-1?Q?hM5xxS9ghalnXd/CRuz5bxPhJsRXur/a43dfOYFF/9hcaSAdaYkKbDf1Lp?=
 =?iso-8859-1?Q?5dW1Xn4yxnkvbfp7y/Xg+NeTzRBNZ5VWa8p0PjFDG12m4z+9y1XhiiPnM3?=
 =?iso-8859-1?Q?Cn4etn3H20F2PppKGkNVKA7bFK0cjMJe2FC5ezNkoR2Jg3BnbixfPyJ3mo?=
 =?iso-8859-1?Q?JQiShfmIvXwhrYNla9LHPSa2cR50y5k+MM+grDAiJatrEmPINAyL1u16Rs?=
 =?iso-8859-1?Q?4P7f7QDDyXylaZIi4aLG9binxNjwUZwy219/X95NcLWOyqe5rHqkhYEsig?=
 =?iso-8859-1?Q?Oy5aLcHOFdXj0fpS9G5I9ZvGZjDjifHBmO9WGUOWBDWUbLBTlDzGwbVj0b?=
 =?iso-8859-1?Q?1tLRCKJ9uSP+jz6UPt7XCDybXyEq7OkK3nIEfqaUYIwOgrXERP858h8+RQ?=
 =?iso-8859-1?Q?hUCiRPodDcg/JPj0GzAmC3ceiQHLTT/G1p8uFkfpxBlrPLmdWUoOnobNKe?=
 =?iso-8859-1?Q?QofHJuJR1HDJq9gznMNwOOIB3dyLfLEa9Y8LvC7n3BwRViEEfECBiu6bjn?=
 =?iso-8859-1?Q?POH6b2kpgce3Vki9C7ROjHw49KE58bDkEsK7OzjUUa7USi2Z+WXnmPXnJ/?=
 =?iso-8859-1?Q?m2TQN76+4xgS7nHsYbSgG+8IJKe+yYxaAZKKDHzOdU7/QIrkzUFMJT8CPv?=
 =?iso-8859-1?Q?SIOCqnuemkKFbAM0qnaxOrvfNo0NOuwimKwQG6ycJ795Q8q7j9K+aZ2NPP?=
 =?iso-8859-1?Q?bpCSSKj55W6PrH8CIJ/pbnvZmo0jfJTEMYM2xBQaU+KC034RbXlMheDHCE?=
 =?iso-8859-1?Q?Psb8aJU7Oom0qC1h2uVOPReUgdsd5SJnfyWBW5npqzs9asgpA1e08bBM1y?=
 =?iso-8859-1?Q?FpzuTwHydYP8av5neLNYrl3qD4zHaSBKRqSj1ksBnBbZIo++kslGSjxZ3b?=
 =?iso-8859-1?Q?VTKqm5Dc3vsHd3PUyj+/DZMKZy1a6G2jIGk1f7a6C17urdO22TYh4NOQ1l?=
 =?iso-8859-1?Q?/Y65/vd8r9bZ6NWP/tHcaMSiQyuxaTYyU30Te/ePjTgcsecprRifgVrXZu?=
 =?iso-8859-1?Q?ZW+1KjU/iapqeEkJIdAC/QMy2iLCBDAUB0CdRJog9beFyq3oI5/Dcjgi40?=
 =?iso-8859-1?Q?VlUQAvr1odR6JsHxOWS90eAn3TS/71p6jCgExzWKAupTvjjhbpLbury6BR?=
 =?iso-8859-1?Q?puxBVmscZNXecug6+C5Pwt3Ofsu8yC91P4T5tG7YwbitELQr9yneg8SNHb?=
 =?iso-8859-1?Q?Ut2Dgrry2+EqMGJ69d1fALqUuQTO8Sjwv7vQzYYWMj6pBxKSrddNrz0BT/?=
 =?iso-8859-1?Q?Gfak6wp0MIHm2TUnJUgc0gmVPqmJ6zbJZliTEoN9jQJb/W+RsSO3H9wLiS?=
 =?iso-8859-1?Q?jQJjjawbrwRkRXP5us/LZx+ZvrmD2lNB2QD9LHxB9XLH829rFlVF40Y1bl?=
 =?iso-8859-1?Q?g9kXqeJFlOEq+jPYhmnsFJoT1AYyHb1ImvFTMdnOJQTBKgFUFtz6wFNkKQ?=
 =?iso-8859-1?Q?Ng0FcdqFFORIhjL4hcjl3V7cbV4pFvU/Sui3IrYiNxsL1j9trhkfzmhLu6?=
 =?iso-8859-1?Q?yWFketHWfC0Lqyhiknnm4qy10HO5BL5ntOIorbeH1CpvfMJe6TZl+EnQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bb8d3e6-a2de-410f-dbed-08db57183120
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2023 20:49:22.0279 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z5c3OjyqxSigorWCrlaLTN8l4Bs1+ryfvDee0wtb8IAQnl9rwQuVI6/lkEIUQRFZ7gugD2r7ZLCRxen0mAwwv63sEL4A661uKwKoi8dnzLI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5156
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 8/9] drm/xe: Add support for OOB
 workarounds
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
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, May 16, 2023 at 03:19:49PM -0700, Lucas De Marchi wrote:
> There are WAs that, due to their nature, cannot be applied from
> a central place like xe_wa.c. Those are peppered around the rest of the
> code, as needed. This gives them a new name:  "out-of-band workarounds".
> 
> These workarounds have their names and rules still grouped in xe_wa.c,
> inside the xe_wa_oob array, which is generated at compile time by
> xe_wa_oob.rules and the hostprog xe_gen_wa_oob. The code generation guarantees
> that the header xe_wa_oob.h contains the IDs for the workarounds that match
> the index in the table. This way the runtime checks that are spread throughout
> the code are simple tests against the bitmap saved during initialization.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile          |  14 +++
>  drivers/gpu/drm/xe/xe_device.c       |   2 +
>  drivers/gpu/drm/xe/xe_device_types.h |   2 +
>  drivers/gpu/drm/xe/xe_gen_wa_oob.c   | 165 +++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_wa.c           |  40 ++++++-
>  drivers/gpu/drm/xe/xe_wa.h           |   9 ++
>  drivers/gpu/drm/xe/xe_wa_oob.rules   |   0
>  7 files changed, 227 insertions(+), 5 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/xe_gen_wa_oob.c
>  create mode 100644 drivers/gpu/drm/xe/xe_wa_oob.rules
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index b6c41cd7dbe3..fcf04951a309 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -26,6 +26,20 @@ subdir-ccflags-$(CONFIG_DRM_XE_WERROR) += -Werror
>  
>  subdir-ccflags-y += -I$(srctree)/$(src)
>  
> +# generated sources
> +hostprogs := xe_gen_wa_oob
> +
> +XE_WA_OOB := $(obj)/generated/xe_wa_oob.c $(obj)/generated/xe_wa_oob.h
> +
> +quiet_cmd_wa_oob = GEN     xe_wa_oob.[ch]
> +      cmd_wa_oob = $^ $(XE_WA_OOB)
> +
> +$(XE_WA_OOB) &: $(obj)/xe_gen_wa_oob $(srctree)/$(src)/xe_wa_oob.rules
> +	@mkdir -p $(@D)
> +	$(call cmd,wa_oob)
> +
> +$(obj)/xe_wa.o:  $(XE_WA_OOB)
> +
>  # Please keep these build lists sorted!
>  
>  # core driver code
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index ac6898a28411..45df4354ac1f 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -280,6 +280,8 @@ int xe_device_probe(struct xe_device *xe)
>  			goto err_irq_shutdown;
>  	}
>  
> +	xe_wa_process_oob(xe);
> +
>  	err = xe_mmio_probe_vram(xe);
>  	if (err)
>  		goto err_irq_shutdown;
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index b8d7864950c4..456299836d0f 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -273,6 +273,8 @@ struct xe_device {
>  		unsigned long *engine;
>  		/** @lrc: bitmap with active LRC workarounds */
>  		unsigned long *lrc;
> +		/** @oob: bitmap with active OOB workaroudns */
> +		unsigned long *oob;
>  	} wa_active;
>  
>  	/* private: */
> diff --git a/drivers/gpu/drm/xe/xe_gen_wa_oob.c b/drivers/gpu/drm/xe/xe_gen_wa_oob.c
> new file mode 100644
> index 000000000000..bf829348058a
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_gen_wa_oob.c
> @@ -0,0 +1,165 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#include <ctype.h>
> +#include <errno.h>
> +#include <stdbool.h>
> +#include <stdio.h>
> +#include <string.h>
> +
> +#define HEADER \
> +	"// SPDX-License-Identifier: MIT\n" \
> +	"\n" \
> +	"/*\n" \
> +	" * DO NOT MODIFY.\n" \
> +	" *\n" \
> +	" * This file was generated from rules: %s\n" \
> +	" */\n" \
> +	"#ifndef _GENERATED_XE_WA_OOB_\n" \
> +	"#define _GENERATED_XE_WA_OOB_\n" \
> +	"\n" \
> +	"enum {\n"
> +
> +#define FOOTER \
> +	"};\n" \
> +	"\n" \
> +	"#endif\n"
> +
> +extern const char *program_invocation_short_name;
> +
> +static void print_usage(FILE *f)
> +{
> +	fprintf(f, "usage: %s <input-rule-file> <generated-c-source-file> <generated-c-header-file>\n",
> +		program_invocation_short_name);
> +}
> +
> +static void print_parse_error(const char *err_msg, const char *line,
> +			      unsigned int lineno)
> +{
> +	fprintf(stderr, "ERROR: %s\nERROR: %u: %.60s\n",
> +		err_msg, lineno, line);
> +}
> +
> +static char *strip(char *line, size_t linelen)
> +{
> +	while (isspace(*(line + linelen)))
> +		linelen--;
> +
> +	line[linelen - 1] = '\0';
> +
> +	return  line + strspn(line, " \f\n\r\t\v");
> +}
> +
> +#define MAX_LINE_LEN 4096
> +static int parse(FILE *input, FILE *csource, FILE *cheader)
> +{
> +	char line[MAX_LINE_LEN + 1];
> +	char *name, *prev_name = NULL, *rules;
> +	unsigned int lineno = 0, idx = 0;
> +
> +	while (fgets(line, sizeof(line), input)) {
> +		size_t linelen;
> +		bool is_continuation;
> +
> +		if (line[0] == '\0' || line[0] == '#' || line[0] == '\n') {
> +			lineno++;
> +			continue;
> +		}
> +
> +		linelen = strlen(line);
> +		if (linelen == MAX_LINE_LEN) {
> +			print_parse_error("line too long", line, lineno);
> +			return -EINVAL;
> +		}
> +
> +		is_continuation = isspace(line[0]);
> +		name = strip(line, linelen);
> +
> +		if (!is_continuation) {
> +			name = strtok(name, " \t");
> +			rules = strtok(NULL, "");
> +		} else {
> +			if (!prev_name) {
> +				print_parse_error("invalid rule continuation",
> +						  line, lineno);
> +				return -EINVAL;
> +			}
> +
> +			rules = name;
> +			name = NULL;
> +		}
> +
> +		if (rules[0] == '\0') {
> +			print_parse_error("invalid empty rule\n", line, lineno);
> +			return -EINVAL;
> +		}
> +
> +		if (name) {
> +			fprintf(cheader, "\tXE_WA_OOB_%s = %u,\n", name, idx);
> +			fprintf(csource, "{ XE_RTP_NAME(\"%s\"), XE_RTP_RULES(%s) },\n",
> +				name, rules);
> +		} else {
> +			fprintf(csource, "{ XE_RTP_NAME(NULL), XE_RTP_RULES(%s) },\n",
> +				rules);
> +		}
> +
> +		idx++;
> +		lineno++;
> +		prev_name = name;
> +	}
> +
> +	fprintf(cheader, "\t_XE_WA_OOB_COUNT = %u\n", idx);
> +
> +	return 0;
> +}
> +
> +int main(int argc, const char *argv[])
> +{
> +	enum {
> +		ARGS_INPUT,
> +		ARGS_CSOURCE,
> +		ARGS_CHEADER,
> +		_ARGS_COUNT
> +	};
> +	struct {
> +		const char *fn;
> +		const char *mode;
> +		FILE *f;
> +	} args[] = {
> +		[ARGS_INPUT] = { .fn = argv[1], .mode = "r" },
> +		[ARGS_CSOURCE] = { .fn = argv[2], .mode = "w" },
> +		[ARGS_CHEADER] = { .fn = argv[3], .mode = "w" },
> +	};
> +	int ret = 1;
> +
> +	if (argc < 3) {
> +		fprintf(stderr, "ERROR: wrong arguments\n");
> +		print_usage(stderr);
> +		return 1;
> +	}
> +
> +	for (int i = 0; i < _ARGS_COUNT; i++) {
> +		args[i].f = fopen(args[i].fn, args[i].mode);
> +		if (!args[i].f) {
> +			fprintf(stderr, "ERROR: Can't open %s: %m\n",
> +				args[i].fn);
> +			goto err;
> +		}
> +	}
> +
> +	fprintf(args[ARGS_CHEADER].f, HEADER, args[ARGS_INPUT].fn);
> +	ret = parse(args[ARGS_INPUT].f, args[ARGS_CSOURCE].f,
> +		    args[ARGS_CHEADER].f);
> +	if (!ret)
> +		fprintf(args[ARGS_CHEADER].f, FOOTER);
> +
> +err:
> +	for (int i = 0; i < _ARGS_COUNT; i++) {
> +		if (args[i].f)
> +			fclose(args[i].f);
> +	}
> +
> +	return ret;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index bc2665737836..f789be2cf8c3 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -9,6 +9,7 @@
>  #include <kunit/visibility.h>
>  #include <linux/compiler_types.h>
>  
> +#include "generated/xe_wa_oob.h"
>  #include "regs/xe_engine_regs.h"
>  #include "regs/xe_gt_regs.h"
>  #include "regs/xe_regs.h"
> @@ -73,8 +74,8 @@
>   *      engine registers are restored in a context restore sequence. This is
>   *      currently not used in the driver.
>   *
> - * - Other:  There are WAs that, due to their nature, cannot be applied from a
> - *   central place. Those are peppered around the rest of the code, as needed.
> + * - Other/OOB:  There are WAs that, due to their nature, cannot be applied from
> + *   a central place. Those are peppered around the rest of the code, as needed.
>   *   Workarounds related to the display IP are the main example.
>   *
>   * .. [1] Technically, some registers are powercontext saved & restored, so they
> @@ -569,8 +570,31 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
>  	{}
>  };
>  
> +static __maybe_unused const struct xe_rtp_entry oob_was[] = {
> +#include <generated/xe_wa_oob.c>
> +	{}
> +};
> +
> +static_assert(ARRAY_SIZE(oob_was) - 1 == _XE_WA_OOB_COUNT);
> +
>  __diag_pop();
>  
> +/**
> + * xe_wa_process_oob - process OOB workaround table
> + * @gt: xe device instance
> + *
> + * Process OOB workaround table for this platform, marking as active the
> + * workarounds that need to be applied.
> + */
> +void xe_wa_process_oob(struct xe_device *xe)
> +{
> +	struct xe_rtp_process_ctx ctx = XE_RTP_PROCESS_CTX_INITIALIZER(xe);
> +
> +	xe_rtp_process_ctx_enable_active_tracking(&ctx, xe->wa_active.oob,
> +						  ARRAY_SIZE(oob_was));
> +	xe_rtp_process(&ctx, oob_was);
> +}
> +
>  /**
>   * xe_wa_process_gt - process GT workaround table
>   * @gt: GT instance to process workarounds for
> @@ -633,12 +657,13 @@ void xe_wa_process_lrc(struct xe_hw_engine *hwe)
>   */
>  int xe_wa_init(struct xe_device *xe)
>  {
> -	size_t n_lrc, n_engine, n_gt, total;
> +	size_t n_oob, n_lrc, n_engine, n_gt, total;
>  
>  	n_gt = BITS_TO_LONGS(ARRAY_SIZE(gt_was));
>  	n_engine = BITS_TO_LONGS(ARRAY_SIZE(engine_was));
>  	n_lrc = BITS_TO_LONGS(ARRAY_SIZE(lrc_was));
> -	total = n_gt + n_engine + n_lrc;
> +	n_oob = BITS_TO_LONGS(ARRAY_SIZE(lrc_was));

Shouldn't this be oob_was?


Matt

> +	total = n_gt + n_engine + n_lrc + n_oob;
>  
>  	xe->wa_active.gt = drmm_kzalloc(&xe->drm, sizeof(long) * total,
>  					GFP_KERNEL);
> @@ -647,6 +672,7 @@ int xe_wa_init(struct xe_device *xe)
>  
>  	xe->wa_active.engine = xe->wa_active.gt + n_gt;
>  	xe->wa_active.lrc = xe->wa_active.engine + n_engine;
> +	xe->wa_active.oob = xe->wa_active.lrc + n_lrc;
>  
>  	return 0;
>  }
> @@ -666,5 +692,9 @@ void xe_wa_dump(struct xe_device *xe, struct drm_printer *p)
>  	drm_printf(p, "\nLRC Workarounds\n");
>  	for_each_set_bit(idx, xe->wa_active.lrc, ARRAY_SIZE(lrc_was))
>  		drm_printf_indent(p, 1, "%s\n", lrc_was[idx].name);
> -}
>  
> +	drm_printf(p, "\nOOB Workarounds\n");
> +	for_each_set_bit(idx, xe->wa_active.oob, ARRAY_SIZE(lrc_was))
> +		if (oob_was[idx].name)
> +			drm_printf_indent(p, 1, "%s\n", oob_was[idx].name);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_wa.h b/drivers/gpu/drm/xe/xe_wa.h
> index 32ab34d9237f..f7da9f5b9340 100644
> --- a/drivers/gpu/drm/xe/xe_wa.h
> +++ b/drivers/gpu/drm/xe/xe_wa.h
> @@ -12,6 +12,7 @@ struct xe_gt;
>  struct xe_hw_engine;
>  
>  int xe_wa_init(struct xe_device *xe);
> +void xe_wa_process_oob(struct xe_device *xe);
>  void xe_wa_process_gt(struct xe_gt *gt);
>  void xe_wa_process_engine(struct xe_hw_engine *hwe);
>  void xe_wa_process_lrc(struct xe_hw_engine *hwe);
> @@ -19,4 +20,12 @@ void xe_wa_process_lrc(struct xe_hw_engine *hwe);
>  void xe_reg_whitelist_process_engine(struct xe_hw_engine *hwe);
>  void xe_wa_dump(struct xe_device *xe, struct drm_printer *p);
>  
> +/**
> + * XE_WA - Out-of-band workarounds, that don't fit the lifecycle any
> + *         other more specific type
> + * @xe__: xe device instance
> + * @id__: XE_OOB_<id__>, as generated by build system in generated/xe_wa_oob.h
> + */
> +#define XE_WA(xe__, id__) test_bit(XE_WA_OOB_ ## id__, (xe__)->wa_active.oob)
> +
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> new file mode 100644
> index 000000000000..e69de29bb2d1
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation

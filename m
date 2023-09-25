Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9228ECE7A89
	for <intel-xe@archiver.kernel.org>; Mon, 25 Sep 2023 23:09:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D91F10E260;
	Mon, 25 Sep 2023 23:09:26 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BF7A10E260
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Sep 2023 23:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695683364; x=1727219364;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=RbeJNkV3zpRTqTX11PweqnSi/3FcGb9qAFp7ObKS/ds=;
 b=Kz3SnPrkAag5cwD3ZXneK35B249nrxMcq5Y7gp+h4GFqHftI4ocCMAWY
 /zkfqIpcR9EkN+z8ua538nRKLYJ1UB9QhkEBLz/4Y3MU+e2p31v5J7l2i
 KbLh0bkqA/qjmMFUtHainj5SoRMG4MsNjttAzNLKWiikfxr48R21sKQsO
 9zzIeS2uu+qpChPKzMGU+zC+Jl9g4wfJkInnrcMC6EEjr9wi4dS6cOG58
 l+c7YHbkLh69g8JEYVqyYfyRwYJdgNmZ/SwMgF+pEvllemC4vMc4L0Dx0
 w0LB7AUFRGX3OAb1x5lVp+K//cHXDpQLyNdpju56Y+AvOFdRN/PrSSKg8 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="412350153"
X-IronPort-AV: E=Sophos;i="6.03,176,1694761200"; d="scan'208";a="412350153"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2023 16:08:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="698245864"
X-IronPort-AV: E=Sophos;i="6.03,176,1694761200"; d="scan'208";a="698245864"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Sep 2023 16:08:31 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 25 Sep 2023 16:08:30 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 25 Sep 2023 16:08:30 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 25 Sep 2023 16:08:30 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.175)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 25 Sep 2023 16:08:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MDsdjhtQ/psPEio7Ne23BQjWD6rBXRUg1jACJ6NTbFIVPG77kFE0Ta7n0HLXCwbLI+e3fUPiMfhYLNodc3Tr5Vj0DgYgpnEdBEpjy/0KjskkUpL3SXWe9eBEDNcVjKdXZe1kuTqooTPnpBnIusq0+bZdyecpALenK9QxFFM0gP1vpIKSdbmF6cCkUOuQaCDKBqsRgUX8w0FEHhlNr13wFFPYMI1SU+GTr81WS+b3RJUFmtuPImzuHLCTir75OAnGQikFOvHWW533fxM4ABGva1RmVsEJj2goaqeSFNv9sXYSqxWUb8CHZkAfaHv91rQbTo/g7ie5j3Tjoaco8uUQVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l9H9Q92c3lyo2OfuxcvsZWe2bvJFiQ3VimpmioRgzA0=;
 b=j/VZVR4Kv9gHXWjEWDZ95DiK67Foh0varXqmDhIRqJWacr7WAEnqPpqgdpVwWbsrb543pxZsHmudmS2VH9ShGajQRFDPQFdqfTUNJfUhCEHsfxe8JKDJoreJUAFk+b37etvc26jQPZSlo2XdOh5RHZqN3u2LvwFOzIOyX8vMmHV7m3U3fJvDALCpXAtUnf9Un6s7YrpR/tBZzcPBr7BBvUWm5yRbe329fjxdDy9IJERhurnYaew0W1+DyMA1OlmMNf6PFNmZYKF0YPoaxLLR1MqEQc8H4wv6tKdXyOykdOawaAV5ZLqEM/HEkedHgBjGo2Ud2UUd4vzO91MnItuO0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 DM4PR11MB5534.namprd11.prod.outlook.com (2603:10b6:5:391::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6813.28; Mon, 25 Sep 2023 23:08:25 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66%4]) with mapi id 15.20.6768.029; Mon, 25 Sep 2023
 23:08:25 +0000
Date: Mon, 25 Sep 2023 16:08:21 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230925230821.GB2706891@mdroper-desk1.amr.corp.intel.com>
References: <20230925221049.2681491-1-lucas.demarchi@intel.com>
 <20230925221049.2681491-6-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230925221049.2681491-6-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR05CA0001.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::6) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|DM4PR11MB5534:EE_
X-MS-Office365-Filtering-Correlation-Id: 448ad47a-28f6-49c4-1072-08dbbe1c5225
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WmiKEGKUjZHQgo9YagC+tP9IMGk1vIvkPMscHhMxW9M+CersevfqE5jCb3/5I23H/zvzLUQzUBN8YdJn0Xjn6Gg32aRVtu6p5UyUP6Op8f2plItIFlX7b8WQ9g+OA8c25DJS9XXXEzgX9ea3cZW0gp/HA8lqgbQsSegX6Ao2unp6IDrmCcjJyRVtVFvFJ6LZV8wZusmcApaRioE6STQ5mDC/TsCUTNpKdD5BhhKcsG/WMOU0XXs+HjPuLjOTTZdE3go1JViR6jV1jIara9rYht4EQDEbPAQ4aSTnTQIHgSLdk3QOPLLshWs1fDPb8qgeA7ugkcVuDa/JM+fEJty1xhFqOgsz3swzH0+IBvHxQfRZyz+NMprFpISUq0JQcRpqpzGE0y8T86vu0KS5FIEP2kjr9zTjAmgxr+w7TIdPGmSGnuRKIYaLFcI3NPz8ElX3/SNXu/0F1w87qvhwaW7YrotahHWaPg7XGhcFIQgpaaLlOR9QIcWlrA0qEXLT09fiPEa7JCKuOovylNiQp182AWcmoemDf6oaZrKNvldwZHSsaCCf1EunmFgmPudY/Nzw
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(346002)(136003)(396003)(39860400002)(230922051799003)(186009)(1800799009)(451199024)(6666004)(6486002)(6506007)(478600001)(83380400001)(6512007)(26005)(107886003)(1076003)(2906002)(41300700001)(66946007)(316002)(66556008)(6636002)(66476007)(5660300002)(4326008)(6862004)(8676002)(8936002)(33656002)(86362001)(38100700002)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yCmDQtGwAHdjlWUrjMuRt2mqZSs6wDHIJMz3wKo/1Usx0InJG0OhEgHhl5bg?=
 =?us-ascii?Q?aNBbJ1ycSxGdrTHvzfXBhm3LTmYmtPS3Sb7qgh84j9boqJTaGTWVjGJtqIvv?=
 =?us-ascii?Q?v3qzREbdsnNQCzipPpH6MrghGyRlEvGgDKq4v0VYXgmKHC/WYfwL1M4I/816?=
 =?us-ascii?Q?iGaThQIlRV1bk8vjKDPYcNfUbcFlQUMznzxrmsmKo0sODYuVO+9/cC+dsj6p?=
 =?us-ascii?Q?8yttDa2eNmn4SjJfDu6M3ztXWnIqEf7NbpxUY5HgIWA/phrxXVF42YM7t+f3?=
 =?us-ascii?Q?omxZqSyFAePeoxy7aG0JlxaIy7GwAenXt8EV0HV+RkMRfRTCnUO9WCWKQCIX?=
 =?us-ascii?Q?xtSlq2oooDjDulD4mKI7vsM7W3ugCmYRKepJ6+UU1gLmgQqFV/AdJUNpkyY3?=
 =?us-ascii?Q?VxLn1bbOYBlICYJ99RqDek/XNsLK3zZky8SmOrtynJwRzcfqCMArqGjrekjt?=
 =?us-ascii?Q?GHVMPc9rOF5yrk/OB1AcIzVdn0dlebiW9AXodNkamDGPay6y5d1Rm/nVNBLT?=
 =?us-ascii?Q?m+czrq5lmw5cOQRXe0S5Uvpri7K9veyKZCsKeBrCUU4wZL/bG4f/D3VQSC9K?=
 =?us-ascii?Q?lco0lCrMwMS84qRvrJpHEJpaumjV/93ZlxwsbOYtZXU29z3RIkZLENTrOwoW?=
 =?us-ascii?Q?o951ek12PH6N24mxbU0jBIhisLoRjsCB8JRDVw2NS8THtIl+532oeHlyzXGA?=
 =?us-ascii?Q?j4srTOudN4R94rDIEKU60AYTJq83vTHHbTpsGGHYgf1rilwjIc2GoDJIvBv4?=
 =?us-ascii?Q?bF7AHZHJYcuZ9Twiw6+Uhqm6SrndHRxtuxH5qy/DFE2DpLYCEi+K5ZZtK2yi?=
 =?us-ascii?Q?BuL7+XI9kSOlBYSAx+lhrzOmZdqhzelEWWNdcGPL92royDpZqAUrWf7uqO4w?=
 =?us-ascii?Q?DECGKIcqduGW2xn3GiZ59PQE+BJ/KWQ2aLx+DUKhQHckmyRUm53Xe/GvS4gn?=
 =?us-ascii?Q?DwBVeGRcpkfzIA4s/GX5LcPGP0BCTV+mRCNP/lMP50As7XZ6ZVTCMsfK9Sx7?=
 =?us-ascii?Q?kCNkKYk5belTn99NGyKxO4beIcNwzpMFgvZ4sm28hSl7W/mQ9ARQV70Muz6C?=
 =?us-ascii?Q?RDsG9g3e8s30UTg+xu2tN+XWJ+nTf1ih1rDHXIPr1evT5IBGZtlUs7FDXPkB?=
 =?us-ascii?Q?xPAzRCdNATsNUx7R+Vl+0yvTdJxkY1y5vyH2Mk5UdzYFMkSYA+0lhVN+UtF6?=
 =?us-ascii?Q?0mGpd7crDAXTr8Iyo2IivROKYsExMSpBte0vUBQ+qInr84Uz7QMppbttSLtX?=
 =?us-ascii?Q?UFyY3KgNJ/1whNmONgBQ2YCLQ5yoifceDszyIUvOM+Wyma6tVUhWRR2OwYTW?=
 =?us-ascii?Q?dS7iMiC599KoDe+f0ev4cy2JZobU0+uhIFYzqHZexlM/tjSOAJmujwUGjmvz?=
 =?us-ascii?Q?3hSkyID4L/gU77HFMyQPfq9dSSU4+M5ZNZVjQztGDAdXhlJARLXH/uSA/bCX?=
 =?us-ascii?Q?22GhQjYRAI+yOXG3XQeeMwPDGVr1+hYuenbXa1iMWODC4cri4NCRm1URy3ei?=
 =?us-ascii?Q?n0Dk/yWNMKvUt8ZUsT6sHPaX9DV5COIe8z1TgidXHPt02cu+KUA5dBnxg19X?=
 =?us-ascii?Q?W9NFBM7FpR5bjPkIft4qo41vrSkm6Q4GPSCC+ffAipuwC4TYVJEDuKPW8XxX?=
 =?us-ascii?Q?pA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 448ad47a-28f6-49c4-1072-08dbbe1c5225
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2023 23:08:25.1839 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vNque3HyJZQXa0+nfcKZzTjH8cST+geuZOPucLVuCqakZoPHL8tcIY2zjFR15OoMqIdyx96+gsohiMVN4wPxkyX7ycMgnH3jyKFYEv50noE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5534
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 5/9] drm/xe: Use vfunc to initialize PAT
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
Cc: intel-xe@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Sep 25, 2023 at 03:10:45PM -0700, Lucas De Marchi wrote:
> Split the PAT initialization between SW-only and HW. The _early() only
> sets up the ops and data structure that are used later to program the
> tables. This allows the PAT to be easily extended to other platforms.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c       |  3 ++
>  drivers/gpu/drm/xe/xe_device_types.h | 13 ++++++
>  drivers/gpu/drm/xe/xe_pat.c          | 59 +++++++++++++++++++++-------
>  drivers/gpu/drm/xe/xe_pat.h          | 11 ++++++
>  4 files changed, 72 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 687dc3d79a66..046b7a087451 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -26,6 +26,7 @@
>  #include "xe_irq.h"
>  #include "xe_mmio.h"
>  #include "xe_module.h"
> +#include "xe_pat.h"
>  #include "xe_pcode.h"
>  #include "xe_pm.h"
>  #include "xe_query.h"
> @@ -276,6 +277,8 @@ int xe_device_probe(struct xe_device *xe)
>  	int err;
>  	u8 id;
>  
> +	xe_pat_init_early(xe);
> +
>  	xe->info.mem_region_mask = 1;
>  	err = xe_display_init_nommio(xe);
>  	if (err)
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 32ab0fea04ee..98835ee058f5 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -25,6 +25,7 @@
>  #endif
>  
>  struct xe_ggtt;
> +struct xe_pat_ops;
>  
>  #define XE_BO_INVALID_OFFSET	LONG_MAX
>  
> @@ -331,6 +332,18 @@ struct xe_device {
>  		atomic_t ref;
>  	} mem_access;
>  
> +	/**
> +	 * @pat: Encapsulate PAT related stuff
> +	 */
> +	struct {
> +		/** Internal operations to abstract platforms */
> +		const struct xe_pat_ops *ops;

We can start with this for now, but down the road we may want to move
this into xe_gt instead of keeping it in the xe_device.  Moving it to
xe_gt would let us just have a single 'program' vfunc, but would also
make it easier to provide per-GT functionality for other things like
coherency decisions.  Even though the coherency is marked in the
device-wide table and is theoretically equivalent for each GT, we've
already seen workarounds like Wa_22016122933 that alter the true
coherency behavior and require that we select actual PAT indices in a
different manner on each GT.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>


Matt

> +		/** PAT table to program in the HW */
> +		const u32 *table;
> +		/** Number of PAT entries */
> +		int n_entries;
> +	} pat;
> +
>  	/** @d3cold: Encapsulate d3cold related stuff */
>  	struct {
>  		/** capable: Indicates if root port is d3cold capable */
> diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
> index 71e0e047fff3..86386633e206 100644
> --- a/drivers/gpu/drm/xe/xe_pat.c
> +++ b/drivers/gpu/drm/xe/xe_pat.c
> @@ -32,6 +32,11 @@
>  #define TGL_PAT_WC				REG_FIELD_PREP(TGL_MEM_TYPE_MASK, 1)
>  #define TGL_PAT_UC				REG_FIELD_PREP(TGL_MEM_TYPE_MASK, 0)
>  
> +struct xe_pat_ops {
> +	void (*program_graphics)(struct xe_gt *gt, const u32 table[], int n_entries);
> +	void (*program_media)(struct xe_gt *gt, const u32 table[], int n_entries);
> +};
> +
>  static const u32 tgl_pat_table[] = {
>  	[0] = TGL_PAT_WB,
>  	[1] = TGL_PAT_WC,
> @@ -80,24 +85,37 @@ static void program_pat_mcr(struct xe_gt *gt, const u32 table[], int n_entries)
>  	}
>  }
>  
> -void xe_pat_init(struct xe_gt *gt)
> -{
> -	struct xe_device *xe = gt_to_xe(gt);
> +static const struct xe_pat_ops tgl_pat_ops = {
> +	.program_graphics = program_pat,
> +};
> +
> +static const struct xe_pat_ops pvc_pat_ops = {
> +	.program_graphics = program_pat_mcr,
> +};
> +
> +/*
> + * SAMedia register offsets are adjusted by the write methods and they target
> + * registers that are not MCR, while for normal GT they are MCR
> + */
> +static const struct xe_pat_ops mtl_pat_ops = {
> +	.program_graphics = program_pat,
> +	.program_media = program_pat_mcr,
> +};
>  
> +void xe_pat_init_early(struct xe_device *xe)
> +{
>  	if (xe->info.platform == XE_METEORLAKE) {
> -		/*
> -		 * SAMedia register offsets are adjusted by the write methods
> -		 * and they target registers that are not MCR, while for normal
> -		 * GT they are MCR
> -		 */
> -		if (xe_gt_is_media_type(gt))
> -			program_pat(gt, mtl_pat_table, ARRAY_SIZE(mtl_pat_table));
> -		else
> -			program_pat_mcr(gt, mtl_pat_table, ARRAY_SIZE(mtl_pat_table));
> +		xe->pat.ops = &mtl_pat_ops;
> +		xe->pat.table = mtl_pat_table;
> +		xe->pat.n_entries = ARRAY_SIZE(mtl_pat_table);
>  	} else if (xe->info.platform == XE_PVC || xe->info.platform == XE_DG2) {
> -		program_pat_mcr(gt, pvc_pat_table, ARRAY_SIZE(pvc_pat_table));
> +		xe->pat.ops = &pvc_pat_ops;
> +		xe->pat.table = pvc_pat_table;
> +		xe->pat.n_entries = ARRAY_SIZE(pvc_pat_table);
>  	} else if (GRAPHICS_VERx100(xe) <= 1210) {
> -		program_pat(gt, tgl_pat_table, ARRAY_SIZE(tgl_pat_table));
> +		xe->pat.ops = &tgl_pat_ops;
> +		xe->pat.table = tgl_pat_table;
> +		xe->pat.n_entries = ARRAY_SIZE(tgl_pat_table);
>  	} else {
>  		/*
>  		 * Going forward we expect to need new PAT settings for most
> @@ -111,3 +129,16 @@ void xe_pat_init(struct xe_gt *gt)
>  			GRAPHICS_VER(xe), GRAPHICS_VERx100(xe) % 100);
>  	}
>  }
> +
> +void xe_pat_init(struct xe_gt *gt)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +
> +	if (!xe->pat.ops)
> +		return;
> +
> +	if (xe_gt_is_media_type(gt))
> +		xe->pat.ops->program_media(gt, xe->pat.table, xe->pat.n_entries);
> +	else
> +		xe->pat.ops->program_graphics(gt, xe->pat.table, xe->pat.n_entries);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_pat.h b/drivers/gpu/drm/xe/xe_pat.h
> index 659de4008131..744318cab69b 100644
> --- a/drivers/gpu/drm/xe/xe_pat.h
> +++ b/drivers/gpu/drm/xe/xe_pat.h
> @@ -7,7 +7,18 @@
>  #define _XE_PAT_H_
>  
>  struct xe_gt;
> +struct xe_device;
>  
> +/**
> + * xe_pat_init_early - SW initialization, setting up data based on device
> + * @xe: xe device
> + */
> +void xe_pat_init_early(struct xe_device *xe);
> +
> +/**
> + * xe_pat_init_early - Program HW PAT table
> + * @gt: GT structure
> + */
>  void xe_pat_init(struct xe_gt *gt);
>  
>  #endif
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation

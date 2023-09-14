Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2F7DEEAA7A
	for <intel-xe@archiver.kernel.org>; Thu, 14 Sep 2023 23:47:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EE4710E5B0;
	Thu, 14 Sep 2023 23:47:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB84B10E5B0
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Sep 2023 23:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694735230; x=1726271230;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Cu1PhlF230y1lSJYL9gunRV89Z+CSsHRCPhiycJi3o4=;
 b=BHwgqRIQ+hNnbCSd/r/DO26tS6LnHl88Bd/8nOvmkPkrIRRpBWh6/MBb
 R+m+BzNY8KyYjGxaXgmv9rGZQ4lfaTot/ZCaIW7ZaW5etISXFVl7QUxRs
 SxqmUczdtts7/hYegR9gzt1M4T/rKSA3P4uxod35hz5cL5LKO9e02W7YZ
 FJZggO+S8XdRNE4BwWbtdtwAKNeAojfiLJHbn0KUWMmM04Fx4iwdD+auj
 dfLRT2yr4gPlspSlB3PFirimnE47j7UoX89eN2fD8kb4kNYZD2VVdvAIh
 FA/KgD7Q5+2jm9hokgQ2ZAaIIpbsHd+t+IF6yo9IsV0nl6UJcqo8EGUIz Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="465479571"
X-IronPort-AV: E=Sophos;i="6.02,147,1688454000"; d="scan'208";a="465479571"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2023 16:47:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="859923060"
X-IronPort-AV: E=Sophos;i="6.02,147,1688454000"; d="scan'208";a="859923060"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Sep 2023 16:47:09 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 14 Sep 2023 16:47:09 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 14 Sep 2023 16:47:08 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 14 Sep 2023 16:47:08 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.105)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 14 Sep 2023 16:47:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HhGdDFnqqLPef3m1FBr6Pjdu5wajwMt26Zd/0sgR5DPo6lXsd0qMGBTA7fk9m0ki+CGmmzZN2SNJfKVdV+8hdoiIpQBo76c0yx9bOTMcSnQXyRDzXQiZq58PeU7ZoHj007Ir2ScWn/by7/U9EBxsHm1IPJsQRB4o5Pu5xBxeP7PvLVKEQYFhQDkdiDB8S3NjBERMwjmzCQE1Kpr26iCLodDI36FOYMJIzAkVTqNA7aUWDR5aBIlp0lxyZf87Exco95uyfS75N7LyFrP3okab2Kp07/Y1tb/AmRHqjsV8CRtyf0pdPVC1SgLRyiRc2Nz6iiArQeZH5+udelRGsX/Zmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EoVXrgOtpizefGuHlvyzeIFIaFFHv2dWLeLLqidFRAc=;
 b=KLVLesABRwwtg4ql4z1dgQ/z6UQUKJjmZJEJ4Y3dgvRILBifokvEsDEfgLNFfEBwnR/K9q3VHdqVBKKapWsa0EgdCMlEDZqjalBCeXKPx1V278dT6hdJq9uoGBisEH+HonD6uDTp3m6ZYjZxb+/TsC3t2vxGpriCRpCfQLXFCvn5wXKDImxej19NV12qWrEmHukAGGf8EcpBAWdO/SDcYUgoeCIcO7g4fdHFqdfSrDo86AcjE2MdOCNvoYStt3A97cJaqT0yd7aqtFSjuLrrHyC3EPxwfquGYvGL1b2hDC88iEdnO1CMERl/eEMQ1Xg3RcNOgkaL1CJQOLFRdVapug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 DS7PR11MB7887.namprd11.prod.outlook.com (2603:10b6:8:e2::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6792.20; Thu, 14 Sep 2023 23:47:06 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66%4]) with mapi id 15.20.6768.029; Thu, 14 Sep 2023
 23:47:06 +0000
Date: Thu, 14 Sep 2023 16:47:02 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Message-ID: <20230914234702.GW2706891@mdroper-desk1.amr.corp.intel.com>
References: <20230914153112.455547-8-matthew.auld@intel.com>
 <20230914153112.455547-9-matthew.auld@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230914153112.455547-9-matthew.auld@intel.com>
X-ClientProxiedBy: BYAPR07CA0040.namprd07.prod.outlook.com
 (2603:10b6:a03:60::17) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|DS7PR11MB7887:EE_
X-MS-Office365-Filtering-Correlation-Id: 6317b897-25a4-4452-2244-08dbb57ce6dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IrEnRFodecCJ4Nce6/KmlKP7Lr6kyXO/hw1VthuVkRRRhOIyHyBZkfAJsHhFSUgedTtQ7m5VxpIgGUy6ul1uhveb8uWXKeNdtmVZBKGkeYFCwwy3/H+tYvRcEpHuBtoU97sM+QDR4q4kMXfma/wjHF8XWaodS5DCiHS5L1+V7tnlV7EVqOF+bdSSugOzXiOrdmTTlSCRI/lud7r4RKzEEIa6d3tPaBpZkgAQOM5+yp7uZ4uw0O86INsypZw+25XrORo1v0syPObIMjwBbsQRLVuGYS9vIK9N2P/IjCE05PnRUfthSR2J1MKCuE2YPa/hfjLG6lSqcqRNJoLi53ln0+8TxhZ1jf5c69Wyj0w9sJ81guEN5UVE+3do3YcltJOhBWD19I4VUE/tnOAKu2iSx5hnkdL+EhxlWUHwq76HI5yjsRawQHN4JvOdvSzhG5YyWjVSmZgSbUbkokiFpRPjdwRfW2xeKBUmeF/TqzKByKLuyPRr6+rcH3zs5rTbRr4Z/MAzYp3jIyU6l3v4XdSC/5UpyEMWo91PDOtoA1UyxPQOQkAT5EzgyTKX9foh/OkH
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(136003)(396003)(346002)(366004)(186009)(1800799009)(451199024)(26005)(66574015)(107886003)(1076003)(41300700001)(4326008)(6862004)(8936002)(5660300002)(8676002)(6512007)(6486002)(6506007)(6666004)(83380400001)(478600001)(33656002)(82960400001)(66476007)(66946007)(6636002)(316002)(66556008)(54906003)(30864003)(2906002)(86362001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?4Gq0pFryZ+ipRLmH30cU+v92OfgKBHx25MKcr5W0sv/Zp+MUPWtRuNltsM?=
 =?iso-8859-1?Q?UFdyFZfDORlXcQEtJdDqHEwY+A1B1Rb7HkGukww03Hnyc80vtUTOC/uihJ?=
 =?iso-8859-1?Q?Qin5NgGX6d9YaL0Cu+5Fab0YXfLXGteMZb8UriHIROITbHrwie7S+Dy0dX?=
 =?iso-8859-1?Q?/nViLtahF6GMcH7Xujnob7bPXWQflSGu3jkwnz0d8vcCXvDIMstaE5abp0?=
 =?iso-8859-1?Q?pixwOiKKGgIp6jz/XTExa+zcDu6d0RBWdljN95dQtlWuevEXUz5WXXTN6V?=
 =?iso-8859-1?Q?2qd6xYiHg5y9ddEuXUfP9ABQl07jEuJF7hp332PZU/fCBsg4fgYhlJ+bju?=
 =?iso-8859-1?Q?t+qxTM9vaPaQG8/mzSplyEY+kROsLiSTCPuj7fPddbON/8VA8McjzV6LmU?=
 =?iso-8859-1?Q?dMBRFYO+cMfXYpVRwqzhA4yOE/b60D0Btjn+tMN9m06YQ3XsZHbQNjZuQ1?=
 =?iso-8859-1?Q?edDjrAQxuyPy6FafwBgmDaY9AvRnO0NKhxnxxjQcsUQgtew2AwMQDH5FzB?=
 =?iso-8859-1?Q?KEPeCDtFnDOhrk20A2yn9GEhXz8d5czIMaG/OS7XvG1n1vkkQ0HYo2eUFB?=
 =?iso-8859-1?Q?VZrekOqmLvC3wdYwViYdh3SMSEWHcUoWuAwWg7l1FgYPbTbN3/u+byuy7t?=
 =?iso-8859-1?Q?YjG8mcE95BO2oVDSIbdaUerJcJiT0GQY7Y2xT1qBKeCDHyuWldjBqTbeHP?=
 =?iso-8859-1?Q?gtJLNEN7JB212ZWBS12fLBcZPvAFuqcOp0f64Z9zz0gK6+utOMz+nywASu?=
 =?iso-8859-1?Q?jiNlKJCyAZ464nEZTJueIBMu/c7bbkpS8nNmGCz+BZddBEOYI/VaXHaACy?=
 =?iso-8859-1?Q?jw+3XqXu8zuWwhMwoD1bdSdsc8ej3CInrHiqRmVAtyPpcSOworNgCuI5O2?=
 =?iso-8859-1?Q?idS8R8isN1wq352DIhceUNQ0PF4GjpTkVkCO1/399ZeJhBwHkC1jgo94wJ?=
 =?iso-8859-1?Q?1kL0z/vmbC2UNnZl9VnjoV2zrF645yVterYqE8U4d5uSvxnsSPGnfLKamn?=
 =?iso-8859-1?Q?YPu6aSMGZPhNqG1K6KLU7RPWjEDklJ1kPCIr/g5fRxTCBzGluzk4FBbdWY?=
 =?iso-8859-1?Q?cQKnhZX0CYsrXJvbc8ENXfZBf33cauAO1M5rWCuSuUwsXfnMSbFJuapPK+?=
 =?iso-8859-1?Q?HpWV/h2AC2lkjiXKLPn2ti+wsHnBkR+gj4EdBTtGPDhrK2B2tngtnAwtXH?=
 =?iso-8859-1?Q?7NVQaLDCbwWhw21TmDfF6b4HId50loJFizGu0kX814VzXqpNwx38PwvOTR?=
 =?iso-8859-1?Q?rNSXSHnqxZU78nSWiv2av/6rjVmJs54o8N9AjS/DDNkA+Qqxblp9vn09wC?=
 =?iso-8859-1?Q?BtK/3a2hYIsw7vmWMT2iaNxdtC6J7CB0sZ8nUXZkZYQbyRA2+9+3zsba28?=
 =?iso-8859-1?Q?bNHD79wV8nGSG01K8LGQ9PxN+QLicdEQgTf6YaNRvnjg2W7sqYneDhKLfr?=
 =?iso-8859-1?Q?UsWacrVvmtYd8OlIiS5QbJcIukxDjg8JV2pSvZf9wOFJ3b4MyuhAWRgFil?=
 =?iso-8859-1?Q?ptllJpvX/1uK6lNYBCkAF4pKlebi4nACo2h4MXC57H/2W81SlThKkmErHg?=
 =?iso-8859-1?Q?Ba4O+dFy5ShOUlNlxSik48YahgcWKSMErK+tJrIefYywEEH04qkp/J/hOO?=
 =?iso-8859-1?Q?+u12ODPJlHHDaOhenpp4ZVW0guiPyitYZq/O3T0SBszXjmYsH2is1z2A?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6317b897-25a4-4452-2244-08dbb57ce6dd
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2023 23:47:05.8629 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pkXzEE3qI+T4VYd9TEijEmFoFruQ/OW6Kqn1OHSKdb62wRoH1skpOP0inzhm+s6fa+MSpagk3CXquzrDUgzEFauYA7Ci4GOe6am0Z4gRAxg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7887
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 1/6] drm/xe/uapi: Add support for cache
 and coherency mode
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
Cc: Effie Yu <effie.yu@intel.com>, Filip Hazubski <filip.hazubski@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org,
 Carl Zhang <carl.zhang@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Sep 14, 2023 at 04:31:14PM +0100, Matthew Auld wrote:
> From: Pallavi Mishra <pallavi.mishra@intel.com>
> 
> Allow userspace to specify the CPU caching mode to use for system memory
> in addition to coherency modes during object creation. Modify gem create
> handler and introduce xe_bo_create_user to replace xe_bo_create. In a
> later patch we will support setting the pat_index as part of vm_bind,
> where expectation is that the coherency mode extracted from the
> pat_index must match the one set at object creation.
> 
> v2
>   - s/smem_caching/smem_cpu_caching/ and
>     s/XE_GEM_CACHING/XE_GEM_CPU_CACHING/. (Matt Roper)
>   - Drop COH_2WAY and just use COH_NONE + COH_AT_LEAST_1WAY; KMD mostly
>     just cares that zeroing/swap-in can't be bypassed with the given
>     smem_caching mode. (Matt Roper)
>   - Fix broken range check for coh_mode and smem_cpu_caching and also
>     don't use constant value, but the already defined macros. (José)
>   - Prefer switch statement for smem_cpu_caching -> ttm_caching. (José)
>   - Add note in kernel-doc for dgpu and coherency modes for system
>     memory. (José)
> 
> Signed-off-by: Pallavi Mishra <pallavi.mishra@intel.com>
> Co-authored-by: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: José Roberto de Souza <jose.souza@intel.com>
> Cc: Filip Hazubski <filip.hazubski@intel.com>
> Cc: Carl Zhang <carl.zhang@intel.com>
> Cc: Effie Yu <effie.yu@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_bo.c       | 105 ++++++++++++++++++++++++++-----
>  drivers/gpu/drm/xe/xe_bo.h       |   3 +-
>  drivers/gpu/drm/xe/xe_bo_types.h |  10 +++
>  drivers/gpu/drm/xe/xe_dma_buf.c  |   5 +-
>  include/uapi/drm/xe_drm.h        |  57 ++++++++++++++++-
>  5 files changed, 158 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 27726d4f3423..f3facd788f15 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -325,7 +325,7 @@ static struct ttm_tt *xe_ttm_tt_create(struct ttm_buffer_object *ttm_bo,
>  	struct xe_device *xe = xe_bo_device(bo);
>  	struct xe_ttm_tt *tt;
>  	unsigned long extra_pages;
> -	enum ttm_caching caching = ttm_cached;
> +	enum ttm_caching caching;
>  	int err;
>  
>  	tt = kzalloc(sizeof(*tt), GFP_KERNEL);
> @@ -339,13 +339,25 @@ static struct ttm_tt *xe_ttm_tt_create(struct ttm_buffer_object *ttm_bo,
>  		extra_pages = DIV_ROUND_UP(xe_device_ccs_bytes(xe, bo->size),
>  					   PAGE_SIZE);
>  
> +	switch (bo->smem_cpu_caching) {
> +	case XE_GEM_CPU_CACHING_WC:
> +		caching = ttm_write_combined;
> +		break;
> +	case XE_GEM_CPU_CACHING_UC:
> +		caching = ttm_uncached;
> +		break;
> +	default:
> +		caching = ttm_cached;
> +		break;
> +	}
> +
>  	/*
>  	 * Display scanout is always non-coherent with the CPU cache.
>  	 *
>  	 * For Xe_LPG and beyond, PPGTT PTE lookups are also non-coherent and
>  	 * require a CPU:WC mapping.
>  	 */
> -	if (bo->flags & XE_BO_SCANOUT_BIT ||
> +	if ((!bo->smem_cpu_caching && bo->flags & XE_BO_SCANOUT_BIT) ||

Is this change just so that we'll honor XE_GEM_CPU_CACHING_UC rather
than promoting to WC?  More questions about that farther down...

It seems farther down we're allowing CPU:WB for scanout on dgpu.  Is
that safe?  I thought display was non-coherent with the CPU cache no
matter what the GT-side coherency situation was.  Assuming it is safe,
then the first part of the comment above this block is no longer
accurate.

>  	    (xe->info.graphics_verx100 >= 1270 && bo->flags & XE_BO_PAGETABLE))
>  		caching = ttm_write_combined;
>  
> @@ -1184,9 +1196,10 @@ void xe_bo_free(struct xe_bo *bo)
>  	kfree(bo);
>  }
>  
> -struct xe_bo *__xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
> +struct xe_bo *___xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
>  				    struct xe_tile *tile, struct dma_resv *resv,
>  				    struct ttm_lru_bulk_move *bulk, size_t size,
> +				    u16 smem_cpu_caching, u16 coh_mode,
>  				    enum ttm_bo_type type, u32 flags)
>  {
>  	struct ttm_operation_ctx ctx = {
> @@ -1224,6 +1237,8 @@ struct xe_bo *__xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
>  	bo->tile = tile;
>  	bo->size = size;
>  	bo->flags = flags;
> +	bo->smem_cpu_caching = smem_cpu_caching;
> +	bo->coh_mode = coh_mode;
>  	bo->ttm.base.funcs = &xe_gem_object_funcs;
>  	bo->props.preferred_mem_class = XE_BO_PROPS_INVALID;
>  	bo->props.preferred_gt = XE_BO_PROPS_INVALID;
> @@ -1307,10 +1322,11 @@ static int __xe_bo_fixed_placement(struct xe_device *xe,
>  }
>  
>  struct xe_bo *
> -xe_bo_create_locked_range(struct xe_device *xe,
> -			  struct xe_tile *tile, struct xe_vm *vm,
> -			  size_t size, u64 start, u64 end,
> -			  enum ttm_bo_type type, u32 flags)
> +__xe_bo_create_locked(struct xe_device *xe,
> +		      struct xe_tile *tile, struct xe_vm *vm,
> +		      size_t size, u64 start, u64 end,
> +		      u16 smem_cpu_caching, u16 coh_mode,
> +		      enum ttm_bo_type type, u32 flags)
>  {
>  	struct xe_bo *bo = NULL;
>  	int err;
> @@ -1331,10 +1347,11 @@ xe_bo_create_locked_range(struct xe_device *xe,
>  		}
>  	}
>  
> -	bo = __xe_bo_create_locked(xe, bo, tile, vm ? &vm->resv : NULL,
> +	bo = ___xe_bo_create_locked(xe, bo, tile, vm ? &vm->resv : NULL,
>  				   vm && !xe_vm_in_fault_mode(vm) &&
>  				   flags & XE_BO_CREATE_USER_BIT ?
>  				   &vm->lru_bulk_move : NULL, size,
> +				   smem_cpu_caching, coh_mode,
>  				   type, flags);
>  	if (IS_ERR(bo))
>  		return bo;
> @@ -1368,11 +1385,35 @@ xe_bo_create_locked_range(struct xe_device *xe,
>  	return ERR_PTR(err);
>  }
>  
> +struct xe_bo *
> +xe_bo_create_locked_range(struct xe_device *xe,
> +			  struct xe_tile *tile, struct xe_vm *vm,
> +			  size_t size, u64 start, u64 end,
> +			  enum ttm_bo_type type, u32 flags)
> +{
> +	return __xe_bo_create_locked(xe, tile, vm, size, 0, ~0ULL, 0, 0, type, flags);

It's a bit hard to keep track of all these wrappers, but I think this
one gets used via

  initial_plane_bo -> xe_bo_create_pin_map_at -> xe_bo_create_locked_range

right?  For that path, wouldn't we want XE_GEM_CPU_CACHING_WC for the
the smem_caching?

> +}
> +
>  struct xe_bo *xe_bo_create_locked(struct xe_device *xe, struct xe_tile *tile,
>  				  struct xe_vm *vm, size_t size,
>  				  enum ttm_bo_type type, u32 flags)
>  {
> -	return xe_bo_create_locked_range(xe, tile, vm, size, 0, ~0ULL, type, flags);
> +	return __xe_bo_create_locked(xe, tile, vm, size, 0, ~0ULL, 0, 0, type, flags);
> +}
> +
> +static struct xe_bo *xe_bo_create_user(struct xe_device *xe, struct xe_tile *tile,
> +				       struct xe_vm *vm, size_t size,
> +				       u16 smem_cpu_caching, u16 coh_mode,
> +				       enum ttm_bo_type type,
> +				       u32 flags)
> +{
> +	struct xe_bo *bo = __xe_bo_create_locked(xe, tile, vm, size, 0, ~0ULL,
> +						 smem_cpu_caching, coh_mode, type,
> +						 flags | XE_BO_CREATE_USER_BIT);
> +	if (!IS_ERR(bo))
> +		xe_bo_unlock_vm_held(bo);
> +
> +	return bo;
>  }
>  
>  struct xe_bo *xe_bo_create(struct xe_device *xe, struct xe_tile *tile,
> @@ -1755,11 +1796,11 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
>  	struct drm_xe_gem_create *args = data;
>  	struct xe_vm *vm = NULL;
>  	struct xe_bo *bo;
> -	unsigned int bo_flags = XE_BO_CREATE_USER_BIT;
> +	unsigned int bo_flags;
>  	u32 handle;
>  	int err;
>  
> -	if (XE_IOCTL_DBG(xe, args->extensions) || XE_IOCTL_DBG(xe, args->pad) ||
> +	if (XE_IOCTL_DBG(xe, args->extensions) ||
>  	    XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
>  		return -EINVAL;
>  
> @@ -1801,6 +1842,32 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
>  		bo_flags |= XE_BO_NEEDS_CPU_ACCESS;
>  	}
>  
> +	if (XE_IOCTL_DBG(xe, args->coh_mode > XE_GEM_COH_AT_LEAST_1WAY))
> +		return -EINVAL;
> +
> +	if (XE_IOCTL_DBG(xe, args->smem_cpu_caching > XE_GEM_CPU_CACHING_UC))
> +		return -EINVAL;
> +
> +	if (bo_flags & XE_BO_CREATE_SYSTEM_BIT) {
> +		if (XE_IOCTL_DBG(xe, !args->coh_mode))
> +			return -EINVAL;
> +
> +		if (XE_IOCTL_DBG(xe, !args->smem_cpu_caching))
> +			return -EINVAL;
> +
> +		if (XE_IOCTL_DBG(xe, !IS_DGFX(xe) &&
> +				 bo_flags & XE_BO_SCANOUT_BIT &&
> +				 args->smem_cpu_caching == XE_GEM_CPU_CACHING_WB))
> +			return -EINVAL;

This reminds me...do we have a check anywhere that rejects the
combination (dgfx && scanout && smem)?  on dgpus, the scanout must
always be in vram.

> +
> +		if (args->coh_mode == XE_GEM_COH_NONE) {
> +			if (XE_IOCTL_DBG(xe, args->smem_cpu_caching == XE_GEM_CPU_CACHING_WB))
> +				return -EINVAL;
> +		}
> +	} else if (XE_IOCTL_DBG(xe, args->smem_cpu_caching)) {
> +		return -EINVAL;

Isn't this going to fail for dumb framebuffers?  In xe_bo_dumb_create()
you always pass XE_GEM_CPU_CACHING_WC, which will be combined with a
vram placement. 


BTW, is there any check for the ioctl being called with no placement
(neither system nor vram bits set)?  What happens in that case?

> +	}
> +
>  	if (args->vm_id) {
>  		vm = xe_vm_lookup(xef, args->vm_id);
>  		if (XE_IOCTL_DBG(xe, !vm))
> @@ -1812,8 +1879,10 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
>  		}
>  	}
>  
> -	bo = xe_bo_create(xe, NULL, vm, args->size, ttm_bo_type_device,
> -			  bo_flags);
> +	bo = xe_bo_create_user(xe, NULL, vm, args->size,
> +			       args->smem_cpu_caching, args->coh_mode,
> +			       ttm_bo_type_device,
> +			       bo_flags);
>  	if (IS_ERR(bo)) {
>  		err = PTR_ERR(bo);
>  		goto out_vm;
> @@ -2105,10 +2174,12 @@ int xe_bo_dumb_create(struct drm_file *file_priv,
>  	args->size = ALIGN(mul_u32_u32(args->pitch, args->height),
>  			   page_size);
>  
> -	bo = xe_bo_create(xe, NULL, NULL, args->size, ttm_bo_type_device,
> -			  XE_BO_CREATE_VRAM_IF_DGFX(xe_device_get_root_tile(xe)) |
> -			  XE_BO_CREATE_USER_BIT | XE_BO_SCANOUT_BIT |
> -			  XE_BO_NEEDS_CPU_ACCESS);
> +	bo = xe_bo_create_user(xe, NULL, NULL, args->size,
> +			       XE_GEM_CPU_CACHING_WC, XE_GEM_COH_NONE,
> +			       ttm_bo_type_device,
> +			       XE_BO_CREATE_VRAM_IF_DGFX(xe_device_get_root_tile(xe)) |
> +			       XE_BO_CREATE_USER_BIT | XE_BO_SCANOUT_BIT |
> +			       XE_BO_NEEDS_CPU_ACCESS);
>  	if (IS_ERR(bo))
>  		return PTR_ERR(bo);
>  
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index 4a68d869b3b5..4a0ee81fe598 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -81,9 +81,10 @@ struct sg_table;
>  struct xe_bo *xe_bo_alloc(void);
>  void xe_bo_free(struct xe_bo *bo);
>  
> -struct xe_bo *__xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
> +struct xe_bo *___xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
>  				    struct xe_tile *tile, struct dma_resv *resv,
>  				    struct ttm_lru_bulk_move *bulk, size_t size,
> +				    u16 smem_cpu_caching, u16 coh_mode,
>  				    enum ttm_bo_type type, u32 flags);
>  struct xe_bo *
>  xe_bo_create_locked_range(struct xe_device *xe,
> diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
> index 2ea9ad423170..9bee220a6872 100644
> --- a/drivers/gpu/drm/xe/xe_bo_types.h
> +++ b/drivers/gpu/drm/xe/xe_bo_types.h
> @@ -68,6 +68,16 @@ struct xe_bo {
>  	struct llist_node freed;
>  	/** @created: Whether the bo has passed initial creation */
>  	bool created;
> +	/**
> +	 * @coh_mode: Coherency setting. Currently only used for userspace
> +	 * objects.
> +	 */
> +	u16 coh_mode;
> +	/**
> +	 * @smem_cpu_caching: Caching mode for smem. Currently only used for

Would it be more accurate to say "CPU caching behavior requested by
userspace" since in the end the caching actually used may be something
different (especially if this value isn't filled by userspace).

> +	 * userspace objects.
> +	 */
> +	u16 smem_cpu_caching;
>  };
>  
>  #define intel_bo_to_drm_bo(bo) (&(bo)->ttm.base)
> diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_buf.c
> index 09343b8b3e96..ac20dbc27a2b 100644
> --- a/drivers/gpu/drm/xe/xe_dma_buf.c
> +++ b/drivers/gpu/drm/xe/xe_dma_buf.c
> @@ -200,8 +200,9 @@ xe_dma_buf_init_obj(struct drm_device *dev, struct xe_bo *storage,
>  	int ret;
>  
>  	dma_resv_lock(resv, NULL);
> -	bo = __xe_bo_create_locked(xe, storage, NULL, resv, NULL, dma_buf->size,
> -				   ttm_bo_type_sg, XE_BO_CREATE_SYSTEM_BIT);
> +	bo = ___xe_bo_create_locked(xe, storage, NULL, resv, NULL, dma_buf->size,
> +				    0, 0, /* Will require 1way or 2way for vm_bind */
> +				    ttm_bo_type_sg, XE_BO_CREATE_SYSTEM_BIT);
>  	if (IS_ERR(bo)) {
>  		ret = PTR_ERR(bo);
>  		goto error;
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 00d5cb4ef85e..737bb1d4c6f7 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -456,8 +456,61 @@ struct drm_xe_gem_create {
>  	 */
>  	__u32 handle;
>  
> -	/** @pad: MBZ */
> -	__u32 pad;
> +	/**
> +	 * @coh_mode: The coherency mode for this object. This will limit the
> +	 * possible @smem_caching values.
> +	 *
> +	 * Supported values:
> +	 *
> +	 * XE_GEM_COH_NONE: GPU access is assumed to be not coherent with
> +	 * CPU. CPU caches are not snooped.
> +	 *
> +	 * XE_GEM_COH_AT_LEAST_1WAY:
> +	 *
> +	 * CPU-GPU coherency must be at least 1WAY.
> +	 *
> +	 * If 1WAY then GPU access is coherent with CPU (CPU caches are snooped)
> +	 * until GPU acquires. The acquire by the GPU is not tracked by CPU
> +	 * caches.
> +	 *
> +	 * If 2WAY then should be fully coherent between GPU and CPU.  Fully
> +	 * tracked by CPU caches. Both CPU and GPU caches are snooped.
> +	 *
> +	 * Note: On dgpu the GPU device never caches system memory (outside of
> +	 * the special system-memory-read-only cache, which is anyway flushed by
> +	 * KMD when nuking TLBs for a given object so should be no concern to
> +	 * userspace). The device should be thought of as always 1WAY coherent,
> +	 * with the addition that the GPU never caches system memory. At least
> +	 * on current dgpu HW there is no way to turn off snooping so likely the
> +	 * different coherency modes of the pat_index make no difference for
> +	 * system memory.

I don't follow this last part.  The distinction between non-coherent vs
1-way coherent means the GPU does or does not snoop the CPU's caches.
Whether the *GPU* caches ever contain smem data should be orthogonal?

I'm also not sure it's a good idea to state that dgpu's never cache
system memory in the UAPI documentation.  That's true for the platforms
we have today, but I don't think it's something that's guaranteed to be
true forever.  I don't think there's a technical reason why a future
dGPU couldn't start doing that?

> +	 */
> +#define XE_GEM_COH_NONE			1
> +#define XE_GEM_COH_AT_LEAST_1WAY	2
> +	__u16 coh_mode;
> +
> +	/**
> +	 * @smem_cpu_caching: The CPU caching mode to select for system memory.
> +	 *
> +	 * Supported values:
> +	 *
> +	 * XE_GEM_CPU_CACHING_WB: Allocate the pages with write-back caching.
> +	 * On iGPU this can't be used for scanout surfaces. The @coh_mode must
> +	 * be XE_GEM_COH_AT_LEAST_1WAY.

As noted above, I'm not sure whether the scanout limitation is igpu-only
or not.  Do you have a bspec reference that clarifies the behavior there?

> +	 *
> +	 * XE_GEM_CPU_CACHING_WC: Allocate the pages as write-combined. This is
> +	 * uncached. Any @coh_mode is permitted. Scanout surfaces should likely
> +	 * use this.
> +	 *
> +	 * XE_GEM_CPU_CACHING_UC: Allocate the pages as uncached. Any @coh_mode
> +	 * is permitted. Scanout surfaces are permitted to use this.

Is there any specific reason why userspace would need to request UC
rather than WC?  They both effectively act like uncached access from a
coherency point of view, but WC does some batching up of writes for
efficiency.

If we don't have a solid usecase for CACHING_UC today, I'd suggest
leaving it out for now.  We can always add it to the uapi in the future
if there's a need for it, but it's much harder to go the other direction
and remove it.


Matt

> +	 *
> +	 * MUST be left as zero for VRAM-only objects.
> +	 */
> +#define XE_GEM_CPU_CACHING_WB                      1
> +#define XE_GEM_CPU_CACHING_WC                      2
> +#define XE_GEM_CPU_CACHING_UC                      3
> +	__u16 smem_cpu_caching;
>  
>  	/** @reserved: Reserved */
>  	__u64 reserved[2];
> -- 
> 2.41.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46667CE7AF3
	for <intel-xe@archiver.kernel.org>; Fri, 29 Sep 2023 20:54:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F34D910E556;
	Fri, 29 Sep 2023 20:54:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43D5210E13D
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Sep 2023 20:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696020870; x=1727556870;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Quj/J6XuSNmCVgh9qv1xEPH1qfJ//pMhVtqw88Zyxq4=;
 b=bgjnI9wsiiMm93Jv2fllocRLLbIkGQMo2mjKMnPTF2QhROjHCv4Lh62e
 Z9YkZ6jFU38NLDWx4M0867Zy4mc1soZvZkZpmHWJEwpJ6wfEue+I1QzrU
 fV2SgWLzd/VG6ccvmA2GHDbs0szINsujQGzwDhBSGu7+YeoOfJa/n2kCa
 XRmlsylELVSqq+WUEMbOG+pW38UNNLcVMoWR5ZnckajyoO20PlSGJhYAU
 R5pObzwEENHL7Yn2Sm1YzlKUjX5oMjNFsK+qOo5PY/OGUU1ufZO792A5Z
 wmF1fIwtMGPDQIa2/48V0GPOyCRHCAmWFJ7lTx+ZAMdlPkCpe/1BxqG9G Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="413279128"
X-IronPort-AV: E=Sophos;i="6.03,188,1694761200"; d="scan'208";a="413279128"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2023 13:49:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="865828378"
X-IronPort-AV: E=Sophos;i="6.03,188,1694761200"; d="scan'208";a="865828378"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Sep 2023 13:49:32 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 29 Sep 2023 13:49:31 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 29 Sep 2023 13:49:31 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 29 Sep 2023 13:49:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hj9B7WbSa3/GaKziApJsQf7HibB8tPIDojUStvn+J1cke8SdoWaKH4AVpCODBk1Eukehl+And7zJ5Agz2dOWuWy3mhuh/84s7/HUF3piO85Ww6zIMvHLZZ9LGxWxe6nhBrt2t/Ixv3oty+O4wlO3m4nnSYwfrN/AjiV+jMKjlItXb5GxIF9ruf1Z061PnQuk/ReNJmHtBKZMNu+cOVEz5VDoeHJ8QSnF6/EL5IUCiKHSaQd9DCcufi/Lf5xeOO3lp/T7cHdxn3m/brIG0u7KbzJmnLR6MBsNuCzqO9ZM0mY66rcRuoPJIRUQhhvkYUcC8NrA//6QZAtVGqrZcKNB4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8ko172VTQX90w+IR9khU39fLVX5uNrbShx9v9S2Za5s=;
 b=VQUDsyUTT3wSwFFWW57lga8JK8w42dCs4zdke52tbSBLQAHOkVMWIVn+8EaA/4oTcaatbZDGCGZrkod643cudcVXAL2HWg5xTiwBNqsELH4QI4JzV2QhHNvMBC6SL3822jvCcAPfZ+SWuxsphUD17NC8Tb4XVRNJ/u86noCB6ioTRbKTyyFaOpttTynDCWmovZz8NNE80EKCxftaQXTl6oRBlJuFWvdxtdjc+RfhRWfVYUcHFsDRzC1q3hOYzo8MTKfsiBfhWgoX6iJ+LPuTQfrYMm3c6LJ/9Q4WSQ1XBHs4/WoHCdhq6tGmDr5Sq9cHw6Ln6R7h22q9SMGjkpvYyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 DM6PR11MB4658.namprd11.prod.outlook.com (2603:10b6:5:28f::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6838.25; Fri, 29 Sep 2023 20:49:29 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::14ea:3a78:f950:d6d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::14ea:3a78:f950:d6d0%7]) with mapi id 15.20.6838.024; Fri, 29 Sep 2023
 20:49:29 +0000
Date: Fri, 29 Sep 2023 13:49:27 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230929204927.GP233750@mdroper-desk1.amr.corp.intel.com>
References: <20230929050253.3153804-1-lucas.demarchi@intel.com>
 <20230929050253.3153804-8-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230929050253.3153804-8-lucas.demarchi@intel.com>
X-ClientProxiedBy: BYAPR21CA0018.namprd21.prod.outlook.com
 (2603:10b6:a03:114::28) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|DM6PR11MB4658:EE_
X-MS-Office365-Filtering-Correlation-Id: 497612b4-5f4a-4bc1-9419-08dbc12d9330
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rLnMs/SrS7eQrVo/oEZvNhVUXQHGYMrGKT/tsEZiZv+D9vv7F+8xyRBqO3cMIvyDCT4KiAmFgzc26u8lUmIWhj2ZQx6iWNR5p5e3/j6VodAEsh8CIpfLNLzZhk3vOKYSbEzxamoNZnpiP8z+JbxdXa6QvOFSqzy2wtGWTS0Ny4t1y+8T4w1E+s7udaLkwTXZ+qxVbkan8OTgwZkB8swDF7kFXtMe3VPGenWzp6BsqaT+OYN5xxdQ8xoPhyNpJ51QXzzhjKg046xn7AJ/uP++Z0o/cppHlG81ZF9UsgkpW0AkzXI/NPM6LXsE/FTa4l/BQRALv9h5jC8l1ExWTD5ufRJFY68oX3uIQH0whtCMUOGinZ/RTeRgJB15T7BPUK2ZU7myshkgPzRx/IS6oXPzezJYVwbwLqdGlyCBzdU8iFsS6B9DqNxiPUgaZDz7oAQy9ZEaRRddxDphhd+v2IYD6olhxVQFn2pxdq3P473FaaCulBJcrkhiEEGgXHwjWP3S7Mj3Tu4w84cjBFE+t7A088NvX35x0R3F5H747V097sE4vo8PzACLJHByo0PRyJ+2
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(136003)(376002)(366004)(396003)(39860400002)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(6506007)(86362001)(33656002)(6512007)(38100700002)(82960400001)(1076003)(26005)(2906002)(6486002)(478600001)(6636002)(6862004)(8676002)(4326008)(8936002)(5660300002)(41300700001)(66476007)(316002)(66556008)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NYhu+TJeDZiZAjE/Y8cUO3ZGza3Kq6uUZsoEfM6mzqnbjL84CD4VNuC0O2Vn?=
 =?us-ascii?Q?9/FI/ZJBLJp1aogOPBYH/9U69gFr2o1XWCPnsYbI0flaLzJo2pjZJ0hhH5bX?=
 =?us-ascii?Q?ep81JGDkTk2jPJKB4yMCYzbJH+FI5gsFaStF0WuQ9kteL7WMoUY3xoa7zYxz?=
 =?us-ascii?Q?gkJqzk8hMt03AdJSawToHC65M8wt1rpnK9SBgZH9Szh0rEIZ4G9GnaEnjIBL?=
 =?us-ascii?Q?XGtPwV+HerRr29o0GF5s2saJZg+kht0sYEEL6yBcBTEPtMyyMDOyjAQCcNuQ?=
 =?us-ascii?Q?l9sRDHU4l++MXncYE7V2RqwFMINOx81KAp2izjC8+CgUk0frin8tOWubB187?=
 =?us-ascii?Q?u1YecaZ156Hx1DvSr0JvMpmibKY2yVPwP8BYdQGvXxgWRmcSpPrsCwibVSph?=
 =?us-ascii?Q?dtZrKu3bYBdMNdXy6k5aPgCQqblqnR2pXgLJtcCl9TKs2rm4knw3uDUNmLWF?=
 =?us-ascii?Q?Yp5mERleh1MaW4zaovYfCTHSPOSUtR0GOQ5oxKFfYO0/FAG3On2nmGrIcel/?=
 =?us-ascii?Q?hdViJACOFEZdB3ToQyJbpOV6mb2lf24uwVsCOh72naAKTfHINP+/7Uw1LcBY?=
 =?us-ascii?Q?3MdVj+drQ3H/IsFb4w+yCCzhH2wxaWKvDZ9cFiYkgdlPf/yKovUPQe0XO0Am?=
 =?us-ascii?Q?LPqmXLsi7B628CrZFVjpwKvIotnJB8Vkm9XzNdZgVyXR9/1kKPWU/IoWHvE8?=
 =?us-ascii?Q?oghN1ZBDn8SSOyxWVDtftnzDzFF5AsaZix77FuxC9XUcgt5G8MbebIu7lZu6?=
 =?us-ascii?Q?O+2bodTD2+tRdtBwX6/gP6jnPH59X+dYKvC7gKue1Gmo/1d8xhO09xjkHmIx?=
 =?us-ascii?Q?YUFgLMbgO3OhujS5+wC/J9Rou+5j1TjOMKCTRG98FNO+KmoxG0qI3jx7cGuS?=
 =?us-ascii?Q?+rbJVTcrm8cMKSh6Oq4I5ZzHVQjwxIQbf5UjARLeFL28+AaK/OIfKel91fqw?=
 =?us-ascii?Q?ppMvXdBcQyCfUjpegMVo1vXkKGAqTKJgeHcDCI/JjNm/S+Ji+md6CbuXS0SE?=
 =?us-ascii?Q?m2sEAUpYPXpOue6naitjD2GDZi07YrZmnw+CipOV1YcQ0JfqFKmSyoqWj//I?=
 =?us-ascii?Q?d9LJ/1EDy7gwJXzYvsRpFfTW1dRZ3onlMXsJu/lJC+oWxcEzRmlHfeYEu8qZ?=
 =?us-ascii?Q?3whHzFx0dYnELtfGx/7Avw/UogWOZZ1vBn0VwJVpLWpnhXtNxzEEk7LU14UO?=
 =?us-ascii?Q?pxlnChjs3nkK4MGpnWHFLSek7NdAN+wqc8tO3ZzQyaAZouWFx+tcW/d2rnR1?=
 =?us-ascii?Q?3VWLgUBtJIXYwSbsqck1sZ2gJjktVu9L8G+s41yM2PQ3o14IldlTYUxB35SR?=
 =?us-ascii?Q?mCE7BIZezSLSaKcU4HSKZb6jicCCj3dY8I1v9EwZzFUGJ5AeomodzOKUL2YW?=
 =?us-ascii?Q?uRk11f3dcWeRvUmAMEHtGiCD/DiUzG57oW01tRP5zsqoOValxCmX7CPUjVob?=
 =?us-ascii?Q?J0O3gitHkpwbuSnP/ETedA/uc0GqFf5Di3EoV139OHNEZnp7281B/2Xb32j7?=
 =?us-ascii?Q?htmXg+AO4SdWg7/nShAiEagRAGjo95ICJe1MX+0QpBlOufv8jzQQLAGlEb3S?=
 =?us-ascii?Q?yREB4r43xu8v1JiueIZzWh5zX0AWNFyGgReJNXWem+RynK6eaPtT3TZzro7S?=
 =?us-ascii?Q?pg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 497612b4-5f4a-4bc1-9419-08dbc12d9330
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2023 20:49:29.1585 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AaKX4nnIrmPPgr5uKXWpg0KJJqGGsB6VJLzFcf4/jyv6OI7cNcej/ngIQJ4O/akO1hkMGfD4HCo9QPoz+emJpAaplBFuoR0Fkmk+i2i4e3s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4658
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 7/7] drm/xe/gt: Dump PAT table when failing
 to initialize
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

On Thu, Sep 28, 2023 at 10:02:53PM -0700, Lucas De Marchi wrote:
> When failing on early initialization, one cause may be that the PAT
> configuration is not correct. Dump it for ease of debugging.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 1aa44d4f9ac1..1a750c88cdd6 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -307,6 +307,17 @@ int xe_gt_init_early(struct xe_gt *gt)
>  	return 0;
>  }
>  
> +static void dump_pat_on_error(struct xe_gt *gt)
> +{
> +	struct drm_printer p;
> +	char prefix[32];
> +
> +	snprintf(prefix, sizeof(prefix), "[GT%u Error]", gt->info.id);

Should we put 'PAT' somewhere in the string here so it's clear what all
the numbers getting dumped are supposed to be?  Or else add a
drm_printf() to add a "title" before calling the dump command below?

Up to you.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> +	p = drm_debug_printer(prefix);
> +
> +	xe_pat_dump(gt, &p);
> +}
> +
>  static int gt_fw_domain_init(struct xe_gt *gt)
>  {
>  	int err, i;
> @@ -360,6 +371,7 @@ static int gt_fw_domain_init(struct xe_gt *gt)
>  	return 0;
>  
>  err_force_wake:
> +	dump_pat_on_error(gt);
>  	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
>  err_hw_fence_irq:
>  	for (i = 0; i < XE_ENGINE_CLASS_MAX; ++i)
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6EA7C77B73
	for <intel-xe@archiver.kernel.org>; Wed, 19 Apr 2023 17:33:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A757110E1D7;
	Wed, 19 Apr 2023 17:33:56 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 175E810E1D7
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Apr 2023 17:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681925634; x=1713461634;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=TsIT5CE/fu73xMmi5H/eXwKCrRZXMaWIsRCEZ6cLDWk=;
 b=U5D8gZDz5BBnQ2d2w6tJBTIXgI6Jvogo1WyYQB5T3xORyYjY/mRzz5bX
 6cAbI/npdlbbohORYzCgzgpEB6Gr2/UxHMCqFWPg2ex5AYSnyqFHfXp6Q
 IPO5V5ZYJQFgfjGKdjQyNBJfWFPA7fK9fS+lwB459V/iruDE2EZUltnG/
 0t3h10ampmvdfcfybnW7RFA+YikK/a/VRY54m6Ype9QL5evQ9qJPyO4PS
 AMlzGbI23KyehEpDRO24BtdcnzMeyYdJ8g79Pg2mf7aTNzylaMhw8Qjs1
 7Ibqiar0WcLUtnNkmwCIIJ/s/ips1Te+MTk5i4m29GWRAfq3lu6lUCo3M Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="431792559"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; d="scan'208";a="431792559"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 10:33:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="760829921"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; d="scan'208";a="760829921"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga004.fm.intel.com with ESMTP; 19 Apr 2023 10:33:52 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 19 Apr 2023 10:33:52 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 19 Apr 2023 10:33:52 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.42) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 19 Apr 2023 10:33:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FS36brnXxHehyIhRrro1rJ5+Y/WqiQ/SCHCsG77MFQsBG8mo2zAqumXk1dn+Scg8G9Pip+mR4b3KIr5IURJQ3aF7TebqucnzXdECjn8mPU/GigWM1DRoc/AxWvhZ6d9sZ88QbG6NxWnqg7gAFOb87v+9oQHJ+CrYGS3abPAAR290qDJrwMfjG74jMsfXuX0NujrL4g091WLUMNVk2tasTf8OidLkeHYt/XtybKCXmsh3bYMShjuQQ6LXp/4gqEAhormvQBdBQ5pdJkMQvLaIidcPobM7OQReYPh9q59Rkk+apFZ1LG1Yx4RmCS8vdRx3kCdfLKBCYG7orKzZe7Vy9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qZCAZBs0IozUZ52+OUmB2sMArxEJngTQLhX0LUYA7Fw=;
 b=bPiR6hkLHykMmp1ArXcwtFSLW69E2987oJ8CUX8tdIess5Ua4+MaQX8ow02pX5IbadFdDoNG3iQP7hsbu4lf1VAhMQkZd2nxawUA6I6SNaRd3mBazBsNFyysbk/NCCwPIhHNi5v3QdiOFC85iOe9homxlkN7KJkYVQ0ghmqab7WnfJeRcsSBjAoolrpk/ot4m5U6UDZpa5dePHUEn1Vw+g11uShHeTyBO/IfIrqQ64ZaQrZu4+9WiCzJWLWzoKY1eeg5JXs9uv+I9/4U9yW24WewWnxCv0Jv6Mo2SVbQetoAUoZIOhNWZKwWMciw5luOtQqLgfVY6dYj+UMjbekPdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 PH0PR11MB4902.namprd11.prod.outlook.com (2603:10b6:510:37::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6319.22; Wed, 19 Apr 2023 17:33:50 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0%8]) with mapi id 15.20.6298.030; Wed, 19 Apr 2023
 17:33:49 +0000
Date: Wed, 19 Apr 2023 10:33:45 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230419173345.GJ2825255@mdroper-desk1.amr.corp.intel.com>
References: <20230419074440.4006398-1-lucas.demarchi@intel.com>
 <20230419074440.4006398-12-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230419074440.4006398-12-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR03CA0193.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::18) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|PH0PR11MB4902:EE_
X-MS-Office365-Filtering-Correlation-Id: d5fcdcb5-fad1-4614-06db-08db40fc3c2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YM8YzIYFY1HMgNCub/1j/gAFxrS3PrjIZB4k7VbsXbYKd3Kx2h3+aSp7sNVIGUJrXfsaPZxvW3VJcpz5uuk3pvJmdIvfuQvoKfCooRGkmmAw6ZY8EhodPRSTblJTpVC8r8YWNVeN0+64QGXSl0FRbaWq1CfI8XP+6Wk4NkBlL6G5/iCbiOahjIYgicdkGGZoFfS1qnJSfRjvPA8v2UL9+/xUVFGFBW8xcou5+RjltXuF3WgYUzKGhLMJm8GGrPSCeXxCGdiyrkJlVOp6FIgxhjjKoXaH+37ZqAyftu8Z8IG0EbWWKlPXMKyt0FtxbrYZ/qZDStzumH+1SRLoZZvU++MwaxW6OOTGfL2SbkLaXqoUmSjmlWV6cLIQ+ZdT0ur/+7CdPOgGmSFWmFU8LTnC97fuR4j3Ho+WU6VCknIpRVzdkzKK0SqNlU9DHbT0/X5nHSRuQCXsPdPIHcXyXMwWXIUx65jc5R1KjV9pxUMC3a3OQmxYhRN3izmorq+Oqi/YdLvTZzO/DgoytZBdLJCPqIkwtVbyaXMltUAOeJBYlmCHiHnxBJJvIJt8eXoIYG76
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(366004)(346002)(396003)(376002)(39860400002)(451199021)(2906002)(8936002)(38100700002)(6862004)(8676002)(5660300002)(86362001)(33656002)(41300700001)(6486002)(6666004)(6512007)(6506007)(1076003)(26005)(54906003)(6636002)(478600001)(83380400001)(186003)(316002)(82960400001)(66946007)(4326008)(66476007)(66556008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xIoUPpBySssKopwXPV+4tEiChI5v6Qp3cYG7xmDRVaK4kIIeJn+Cgkx0dNGK?=
 =?us-ascii?Q?+FCxZTb/US8IUqT55O34IgY3QTQfLAWvCv7UogPJ5HfHbJ1PmYjknwdKpkC5?=
 =?us-ascii?Q?4DcwcMkWvbxr0ylew5HWXtdIoWhM0+BP+pRRKCCgBVXMQwZ9yTXEGh+c7V2X?=
 =?us-ascii?Q?L3ugN27XDhSdWn6ZPQZc1Dj0Cka35dmjWDrewNv/COPuoOPuqA9ScE+bbWv+?=
 =?us-ascii?Q?JtG3miFQhuoOPb5nes4aoDHnQTdd2DrZdJJSvQYkGKjgqsTjzDovd8tNLIlD?=
 =?us-ascii?Q?C7sM9+CwJYhEG/uYtRiNv0v4zDmNH4XnI4TcLT93TdF3DqWyrx10dZa6WGOG?=
 =?us-ascii?Q?7IYtF/S0NvBJ62PqHXNVYfaSAgVX83NYVANwJkHv9MUqEwz4WuSkkB7rWzhJ?=
 =?us-ascii?Q?xy6TxrpjKfLalRRcxjRTCCouL61JN2ROBolBpRtDWpgVQMKysceKOz0a3iRq?=
 =?us-ascii?Q?gHk309WqsrcST7miCaKbjH7QgQKmus6uW8GZzeud+hT486oCgUpWoB8X3vz5?=
 =?us-ascii?Q?sV9ElrbO3cAWSxqz0Es08B5twQQzsbWq1GJGa5lB5QIsz9QfuYVqjUUBHyM5?=
 =?us-ascii?Q?N5IN1pVLdhk9Cm6lnHF7LZA8nPr2Vqzjzo8gAZFgOY7MkGiZ9+lIQ6LKEHWU?=
 =?us-ascii?Q?/K/1tq5epG8IKH919dB4z9qjsqiDOF5bUM0TDDryWXMy3ktF4AawX21UCd7A?=
 =?us-ascii?Q?lnONfQQIq9iwKondS9/UqtwwaG1bVOdA0ynefowh+O6dH1Ot8KJxTkHdoXYS?=
 =?us-ascii?Q?DQlDmTfcQigS217eMJ1u/zizEuH8RO6+zy5qarH76i24GNadgWNabRJobL7g?=
 =?us-ascii?Q?/gzzdPFp+VmQok8julrssCyKUVNTXTkTMaA9eS5tHTsyIvm16zUXQQcUkK/q?=
 =?us-ascii?Q?BNZWssEXUSkQukR+e6BgeDI99fOCGqmJPa3NZRovxvXOD4+Sec/ZoORHmOMp?=
 =?us-ascii?Q?5w3Wk/GGcV0e+XnLVGYjC33mFvHtFz7qFh+47XIiztSAfGyj1wmibs9t7vS/?=
 =?us-ascii?Q?Y14JJlD5Pnxf5GY9kq5f9LiC7yE7ruE9drCZZQawWDMR/bLS8LGC7WY43UYX?=
 =?us-ascii?Q?xiO7IApOuN/fwR6RDirPHwwKXnLojk51u4HsDpQBp/qFd22TZq+AgV9x5bX0?=
 =?us-ascii?Q?u6dQeMOP5t7cfDWrlmCLClI7RPQtXXAl2H9dlwsUv9sh91JTdKz5PH0eDp+H?=
 =?us-ascii?Q?u/D7eASrxJgiUDJe9FYlo2LhBBtlY+RPhqbAGtUIoFjgUtQC1SNpUZqkPS4a?=
 =?us-ascii?Q?EljA7Z+D72GK80q+1sb0zLp21JqcvyP1+duv8iMoef69QnlbDhL6w0e2egCR?=
 =?us-ascii?Q?Tc06wVwaXHhN8INrXMet8WQPw64dvgS/shzg5z5R6V5q+iyETX/Xw7dC7E30?=
 =?us-ascii?Q?hsqTnihU+8ceTFyHEF5wznssT6Fy9GmLuV+g/3j7aAzTP5cDmjP2TYeXRMcd?=
 =?us-ascii?Q?AFN5bRwWWKOjhosiPjPSiXjopqflj/gdNGY8t6zirVvFwbMeitrDxYCgA84I?=
 =?us-ascii?Q?YKYPAQAuw6YXLEie9BFim8eoNUmDavvLIppL8lnrajud7xpQneKL0cIkqHfA?=
 =?us-ascii?Q?n6i1ixr0N64edtohpS8zTnf1ZbTNqrv+z5hKSaGGyufIG0UMflI81S6Vo0VJ?=
 =?us-ascii?Q?5A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d5fcdcb5-fad1-4614-06db-08db40fc3c2d
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 17:33:49.1768 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ++KEVgVKJHdpRNTq5R60Zz056gMcQdyxEMA7ApaJYw03W833ZdyHSwiHM8pCzoWoEKCrYoYmmEzUjqRUB8/NgYoPUZHUzUC/GkbqdDdQkWE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4902
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 11/17] drm/xe: Introduce xe_reg_t
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

On Wed, Apr 19, 2023 at 12:44:34AM -0700, Lucas De Marchi wrote:
> Stop using i915 types for register our own xe_reg_t. Differently from
> i915, this will keep under this will keep under the register definition
> the knowledge for the different types of registers. For now, the "flags"
> are mcr and masked, although only the former is being used.
> 
> Most of the driver is agnostic to the register differences. Convert the
> few places that care about that, namely xe_gt_mcr.c, to take the generic
> type and warn if the wrong register is used.

The disadvantage of this approach is that we don't get the nice
type-checking that we have in i915 to catch register misuse at build
time.  Instead we wind up with a bunch of run-time checks that only tell
you that you used the wrong register semantics after the fact.  Wouldn't
it be better to keep the strict types and let the compiler find mistakes
for us at build time?

The only real problem with using strict types is that there are a few
places where the driver is just trying to refer to registers/offsets
without actually accessing them (e.g., whitelists, OA register groups,
etc.) and the strict typing makes it harder to provide a heterogeneous
list of those registers.  But I still feel the benefits of compile-time
checking outweighs the extra complexity we wind up with in a handful of
places.


Matt

> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_reg_defs.h | 15 +++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_mcr.c        | 22 ++++++++++++++++------
>  drivers/gpu/drm/xe/xe_gt_mcr.h        |  8 ++++----
>  drivers/gpu/drm/xe/xe_irq.c           |  2 +-
>  drivers/gpu/drm/xe/xe_mmio.c          |  2 +-
>  5 files changed, 37 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_reg_defs.h b/drivers/gpu/drm/xe/regs/xe_reg_defs.h
> index b5c25e31b889..1e78508c737b 100644
> --- a/drivers/gpu/drm/xe/regs/xe_reg_defs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_reg_defs.h
> @@ -8,4 +8,19 @@
>  
>  #include "compat-i915-headers/i915_reg_defs.h"
>  
> +typedef union {
> +	struct {
> +		u32 reg:30;
> +		u32 mcr:1;
> +		u32 masked:1;
> +	};
> +	u32 raw;
> +} xe_reg_t;
> +
> +/* TODO: remove these once the register declarations are not using them anymore */
> +#undef _MMIO
> +#undef MCR_REG
> +#define _MMIO(r)	((const xe_reg_t){ .reg = (r) })
> +#define MCR_REG(r)	((const xe_reg_t){ .reg = (r), .mcr = 1 })
> +
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
> index aa04ba5a6dbe..b9631cfd5b81 100644
> --- a/drivers/gpu/drm/xe/xe_gt_mcr.c
> +++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
> @@ -360,11 +360,13 @@ void xe_gt_mcr_set_implicit_defaults(struct xe_gt *gt)
>   * returned.  Returns false if the caller need not perform any steering
>   */
>  static bool xe_gt_mcr_get_nonterminated_steering(struct xe_gt *gt,
> -						 i915_mcr_reg_t reg,
> +						 xe_reg_t reg,
>  						 u8 *group, u8 *instance)
>  {
>  	const struct xe_mmio_range *implicit_ranges;
>  
> +	drm_WARN_ON(&gt_to_xe(gt)->drm, !reg.mcr);
> +
>  	for (int type = 0; type < IMPLICIT_STEERING; type++) {
>  		if (!gt->steering[type].ranges)
>  			continue;
> @@ -436,11 +438,13 @@ static void mcr_unlock(struct xe_gt *gt) {
>   *
>   * Caller needs to make sure the relevant forcewake wells are up.
>   */
> -static u32 rw_with_mcr_steering(struct xe_gt *gt, i915_mcr_reg_t reg, u8 rw_flag,
> +static u32 rw_with_mcr_steering(struct xe_gt *gt, xe_reg_t reg, u8 rw_flag,
>  				int group, int instance, u32 value)
>  {
>  	u32 steer_reg, steer_val, val = 0;
>  
> +	drm_WARN_ON(&gt_to_xe(gt)->drm, !reg.mcr);
> +
>  	lockdep_assert_held(&gt->mcr_lock);
>  
>  	if (GRAPHICS_VERx100(gt_to_xe(gt)) >= 1270) {
> @@ -494,12 +498,14 @@ static u32 rw_with_mcr_steering(struct xe_gt *gt, i915_mcr_reg_t reg, u8 rw_flag
>   *
>   * Returns the value from a non-terminated instance of @reg.
>   */
> -u32 xe_gt_mcr_unicast_read_any(struct xe_gt *gt, i915_mcr_reg_t reg)
> +u32 xe_gt_mcr_unicast_read_any(struct xe_gt *gt, xe_reg_t reg)
>  {
>  	u8 group, instance;
>  	u32 val;
>  	bool steer;
>  
> +	drm_WARN_ON(&gt_to_xe(gt)->drm, !reg.mcr);
> +
>  	steer = xe_gt_mcr_get_nonterminated_steering(gt, reg, &group, &instance);
>  
>  	if (steer) {
> @@ -525,11 +531,13 @@ u32 xe_gt_mcr_unicast_read_any(struct xe_gt *gt, i915_mcr_reg_t reg)
>   * group/instance.
>   */
>  u32 xe_gt_mcr_unicast_read(struct xe_gt *gt,
> -			   i915_mcr_reg_t reg,
> +			   xe_reg_t reg,
>  			   int group, int instance)
>  {
>  	u32 val;
>  
> +	drm_WARN_ON(&gt_to_xe(gt)->drm, !reg.mcr);
> +
>  	mcr_lock(gt);
>  	val = rw_with_mcr_steering(gt, reg, MCR_OP_READ, group, instance, 0);
>  	mcr_unlock(gt);
> @@ -548,9 +556,11 @@ u32 xe_gt_mcr_unicast_read(struct xe_gt *gt,
>   * Write an MCR register in unicast mode after steering toward a specific
>   * group/instance.
>   */
> -void xe_gt_mcr_unicast_write(struct xe_gt *gt, i915_mcr_reg_t reg, u32 value,
> +void xe_gt_mcr_unicast_write(struct xe_gt *gt, xe_reg_t reg, u32 value,
>  			     int group, int instance)
>  {
> +	drm_WARN_ON(&gt_to_xe(gt)->drm, !reg.mcr);
> +
>  	mcr_lock(gt);
>  	rw_with_mcr_steering(gt, reg, MCR_OP_WRITE, group, instance, value);
>  	mcr_unlock(gt);
> @@ -564,7 +574,7 @@ void xe_gt_mcr_unicast_write(struct xe_gt *gt, i915_mcr_reg_t reg, u32 value,
>   *
>   * Write an MCR register in multicast mode to update all instances.
>   */
> -void xe_gt_mcr_multicast_write(struct xe_gt *gt, i915_mcr_reg_t reg, u32 value)
> +void xe_gt_mcr_multicast_write(struct xe_gt *gt, xe_reg_t reg, u32 value)
>  {
>  	/*
>  	 * Synchronize with any unicast operations.  Once we have exclusive
> diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.h b/drivers/gpu/drm/xe/xe_gt_mcr.h
> index 2a6cd38c8cb7..492d9519784a 100644
> --- a/drivers/gpu/drm/xe/xe_gt_mcr.h
> +++ b/drivers/gpu/drm/xe/xe_gt_mcr.h
> @@ -15,13 +15,13 @@ void xe_gt_mcr_init(struct xe_gt *gt);
>  
>  void xe_gt_mcr_set_implicit_defaults(struct xe_gt *gt);
>  
> -u32 xe_gt_mcr_unicast_read(struct xe_gt *gt, i915_mcr_reg_t reg,
> +u32 xe_gt_mcr_unicast_read(struct xe_gt *gt, xe_reg_t reg,
>  			   int group, int instance);
> -u32 xe_gt_mcr_unicast_read_any(struct xe_gt *gt, i915_mcr_reg_t reg);
> +u32 xe_gt_mcr_unicast_read_any(struct xe_gt *gt, xe_reg_t reg);
>  
> -void xe_gt_mcr_unicast_write(struct xe_gt *gt, i915_mcr_reg_t reg, u32 value,
> +void xe_gt_mcr_unicast_write(struct xe_gt *gt, xe_reg_t reg, u32 value,
>  			     int group, int instance);
> -void xe_gt_mcr_multicast_write(struct xe_gt *gt, i915_mcr_reg_t reg, u32 value);
> +void xe_gt_mcr_multicast_write(struct xe_gt *gt, xe_reg_t reg, u32 value);
>  
>  void xe_gt_mcr_steering_dump(struct xe_gt *gt, struct drm_printer *p);
>  
> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> index 13f9f220bca0..8e5f8e7c16c8 100644
> --- a/drivers/gpu/drm/xe/xe_irq.c
> +++ b/drivers/gpu/drm/xe/xe_irq.c
> @@ -27,7 +27,7 @@
>  #define IIR(offset)				_MMIO(offset + 0x8)
>  #define IER(offset)				_MMIO(offset + 0xc)
>  
> -static void assert_iir_is_zero(struct xe_gt *gt, i915_reg_t reg)
> +static void assert_iir_is_zero(struct xe_gt *gt, xe_reg_t reg)
>  {
>  	u32 val = xe_mmio_read32(gt, reg.reg);
>  
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index a93838e23b7b..1029b9f27988 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -397,7 +397,7 @@ int xe_mmio_init(struct xe_device *xe)
>  	DRM_XE_MMIO_READ |\
>  	DRM_XE_MMIO_WRITE)
>  
> -static const i915_reg_t mmio_read_whitelist[] = {
> +static const xe_reg_t mmio_read_whitelist[] = {
>  	RING_TIMESTAMP(RENDER_RING_BASE),
>  };
>  
> -- 
> 2.39.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation

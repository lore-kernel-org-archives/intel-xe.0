Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 318C1CDB47F
	for <intel-xe@archiver.kernel.org>; Wed, 24 Jun 2026 20:58:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E637410EFE9;
	Wed, 24 Jun 2026 20:58:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fxz0vWN1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6334410EFE9
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Jun 2026 20:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782334738; x=1813870738;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Q/jkc/Ai8tGoYrxvNB0LPbkmm748ehXywFiHnPbDGPs=;
 b=Fxz0vWN1h/v2zGX6tX1YFWIRK8fLPdDZLea4e5Vs1W9z4+JN2MMm7Ej2
 1+ujfr+CksqovQlMzpIMFO1PVuTHh+LsQzw6akmc1Hw+M63AW/xPtfdq3
 6QUZ7l9Ngt8X1LeVCLFBwks5mKZpPFAGZLHO02uPBCM4jzNEdMuDFOm5c
 x6Svn6xz9/ya3kRiUb8D0sNYznPGlNx7RQvYpBr6+0vOCx18bzTHpp92d
 g0i2BMNiMq1p63fbYqpjrvYIvwTJREvkip+iNeUBpurOzmR/t/9XjhO0S
 o9/jdfs13gvUZSz2XEE0vv2dNqVZTmm6uHeweaySFyX27YrCpYp4WDc43 Q==;
X-CSE-ConnectionGUID: 4mUbcANiQJqzxfBH56sNHQ==
X-CSE-MsgGUID: 56iCNXAHRXK43yHsySLFGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="105901250"
X-IronPort-AV: E=Sophos;i="6.24,223,1774335600"; d="scan'208";a="105901250"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 13:58:58 -0700
X-CSE-ConnectionGUID: j0dSVTxcQeuSPyq8lYlKvg==
X-CSE-MsgGUID: 0OsHcPwgSjmZ1xmaxw0x3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,223,1774335600"; d="scan'208";a="250112368"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 13:58:57 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 24 Jun 2026 13:58:56 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 24 Jun 2026 13:58:56 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.34) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 24 Jun 2026 13:58:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M5fRLVrCERzq+WMgVsl8tAn/+sMIo1y77T2QTzcZMMoPsdgdglYOuVv8Pf3nafsyePho1nY+e9SmJX9XyfCWNYkV0zQm6PXS+1ehZopE2qs5P+Li6BqbRYntK2HWmBPssKZR3rP49b+PKaY1uu7FgHZOcgic4slnuubf3pxmeJUfL9tmtUH7yYst7Et8yM0hv6uggeAIOnQaHcYQ6Nv6BHl0RltHJBkOzF6isK5A1YOl3vYpM3sHvyRbahZk4kD1+X8bGwtBb9G2OopPE2N/1nSrKdeREcKeKw8ceTWQwyM1L5bCGcJjZWzug3Qm4/uIfI0j9ARvEb7tkhw4oRZUYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5SPuaNkpgctR2qYulFL4Q+CTaEwG3q3EmsQ0h2+plLk=;
 b=Ey4SDiA/tn9MgTQp3qkobMIAWYk1JZvoZcTzC9EZ7tADTlSFVaJArDVVajz4fDyk3j8N15gTwhvVxixZPH6aRMOua/EYvl0po5KeaX8jHfhfB1rY9Oc2APVy0a9deOYQYj0jA/W8ngs8KWSbx5szcdr78XkOV2R1+aLklCA6VSKbZs/UPEAG8vXt5mpKfNL7N2vx1VGGvgymnQwKh9K4gfey45QYYEYvwaTfW0HhXmdYCnGQIk58Moc5hqdcwnOExp3kqGLMUKGoSv+4dNKeTray6BgDlC4PHVz6LiDnibwM+geRtaZ3h1pw92KhyU8xEabh6pUsV91JJuUo4KQqBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH8PR11MB9975.namprd11.prod.outlook.com (2603:10b6:510:3d1::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Wed, 24 Jun
 2026 20:58:54 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.21.0159.012; Wed, 24 Jun 2026
 20:58:54 +0000
Date: Wed, 24 Jun 2026 13:58:51 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Harish Chegondi <harish.chegondi@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/1] drm/xe/eustall: Add WA 14027054324 support for
 graphics IP 35.11
Message-ID: <20260624205851.GP6214@mdroper-desk1.amr.corp.intel.com>
References: <0bcb2f8bd8380544971d3036a01f28aaa8e9ffa7.1781650756.git.harish.chegondi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <0bcb2f8bd8380544971d3036a01f28aaa8e9ffa7.1781650756.git.harish.chegondi@intel.com>
X-ClientProxiedBy: SJ0PR13CA0088.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::33) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH8PR11MB9975:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e8aa7cd-b6af-4cae-993f-08ded2336696
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|1800799024|376014|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: H/hkocyp63bVkhksKQ4x3QnzeZSVhZrSaapg+WVvyzmCWxPGGrMKgHhvqETidBPJJv+mWKozoMmqhJ2xAbQdX+7F8/HAOHnoH6nBy6TQJyH/SqV1Ibtgj2aZ+K67RpHByYYjDJrTWYX6i92EvR6osADk//zw/Z28a0oGfIQJqfMG+BxONZX6HmgobyFc1LybCJvV7huhDmDW4X43320Hg0prC1/t6+BcszeuosOs7llpyOi1ON29UCdJALB2QkZ5Ft4jYFj/zbyrF7Roe7VcK7Opd59871O6HBVF8FTNuEtnN9HLWbDHm1h1LMEiLnJa3laYXTq/lgC3GwJFv2/RguNc64sKcsHSUBMc1v0Dy579o/r1uotaHxYcVlwtLgap9XZja2dSLxCYhX31noQO8N6El660MhZaCXg5fwv9GPqLzvUzfG0/JrXo0Pv5Pc1DPbr4pw0figSL/4VqEjS7lgn36cb9LEw5R68u3G++QVHPtgZ9B6Kkj6CGJITf9T+/AhrH35FbM0C58mLilQtG9JXoG6T27OKRhiFKpQ2BUhPxXJD+ZX+jCIujJ/WpU+U+xgn6AsXnUHRghnvMFLpZ2C4BcUrdsadAVHIbdbtmsqun6WWHkHqK/v89BY71Gw3Q3yRWqskN5cmb/xpqN9Vi1A0cMfUwHPJFq99bdYlkbq0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(18002099003)(22082099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UM9FcRHsH1kwr4oZL6S4Jx3xQRG9t1s5XNXRqisRfH43ckvCWQt+A/rUpwZH?=
 =?us-ascii?Q?I9nsk6h7hIuLymHLGP2LUAXdFvkzOoJLLmTTTmb6BKLkalUYYEsB/kxR9XDI?=
 =?us-ascii?Q?CwwReH7OTNTVAkczDlic7XgrasfmM0JgscIgOo8nuFUc93faNjmluWkQoYbG?=
 =?us-ascii?Q?BIOAyjWqPTN7o5jLJlylBIzu7fAVKIPyeyob3dlRELDJLt/SVv7obiQUinY0?=
 =?us-ascii?Q?1PhjfDF1UVit3QD5uBGOYAr/UkHkjXKVNk396ZjM8xw0nznELqFRbMRol1rZ?=
 =?us-ascii?Q?77hbNXOyjnGaWoYgP09YcHe1gfJA5OWKCrA6Oumn8B0R+Oamsx84ed8igEXT?=
 =?us-ascii?Q?bRI+W06m1W50gYYzE0rYRj2FoNfgJH2qfsYhzj8bcFvxkOCO5+vbSoYtl7Zc?=
 =?us-ascii?Q?NX4q/BflD8rI2wuX8qE9Jih+mN+m+T5Asvy2w04LGSZLA8uENmhiorLlP574?=
 =?us-ascii?Q?Hp7lw0MZ9HZQg7H9SnOSkivlKCNBalAQy7IOpaiSGAn5Veew5+eM3IVFkPe7?=
 =?us-ascii?Q?qyk0s7Os2FYnfZT4ev2GkgSQQKAzEyD4dzyLsIj3wxpe3GynxyMZFx4daZge?=
 =?us-ascii?Q?p3O3WhTyyKwlWmp3D7QY6C6dl+UOFwLq5uKjHjeAZUTX42ui/nGf9i36LhbE?=
 =?us-ascii?Q?MxvvCL4JFbZ+BHqd/Z+/kLPd6cGdxeEMKwaHm5YjDWhyIfXui0uCKnNDy48P?=
 =?us-ascii?Q?BnZzrdUwCtXAmFIgTsuliDG99kA+n2D/x8RLFrXQBgYR0jDQ6+eAVsMFIDas?=
 =?us-ascii?Q?cPENLQAfWFCmRAlVcgBVIH1QntKSbDwGpLg33g+2nAOyuqMTY205wb53S5Gz?=
 =?us-ascii?Q?nzuH61QAYM5ZVdKgvAe3lsvUGCvvaAjugmgqspgzKZ5d9vwzjs2dRBMyrERP?=
 =?us-ascii?Q?MzPd3Sv6gl1WwpVF+B8lD+zZExPCjdPmc2WXtzEPy2FerDalziX4d2eCVI1y?=
 =?us-ascii?Q?lJU/tF4xrsp6DjivBYKQbfzzy7qOwZysWWocxHhXwPQVZp9j+p7xXBuIlSdE?=
 =?us-ascii?Q?GynKg7MPAUnU9SScZppD97GSDudWXhUerPZJ2uPsZ0PMPH92mUhJ9VxaHAQ3?=
 =?us-ascii?Q?8TkfyYxE36qF3TUy58LoGRay/6RHNulqmjasZhKS6GazM3AkDq2uGG0AI5x5?=
 =?us-ascii?Q?IJwBL3iSTTII4JQRO53CtzRbGrwL0BHWq1qJbX3sWHHwIn2Aw9oBaVO31c9M?=
 =?us-ascii?Q?loivhcKkAriJx4QGmaapHP1SLjMQEvFmR0C+pJlNZyZAsS6JX5PVl9Tu77XM?=
 =?us-ascii?Q?yiD5TmvXRei9ZETjb/6RQch3uk8CXbxOyo8quTKMvZzxt2TzOZRsp3P/nKft?=
 =?us-ascii?Q?Q8P32sZCnm+3ryhyc5/79ZLJ+BEXMYkfpNI2A+oMucA5iKS8KYR0Tz8pj4l3?=
 =?us-ascii?Q?zw9km/ezlZRrG9eV2NCOc+aRQw6ETrJ5p/+XFP18fgDnRwSeFJRn1xXnFFji?=
 =?us-ascii?Q?HUdSwP51f8VpfHRBTXZDDqVhbWx87GRz9qMfIxZD4Lt0rkr3cyCC9I+UHe6+?=
 =?us-ascii?Q?Y/GkKL61n1be81QYLGLSfRib97NlYzNaDgkv25VOQyULdEOvA9fz8UrF0eot?=
 =?us-ascii?Q?KSbYlqBSUQgpOx6y+Q97jzoQwrPP1Ug0Fg1irBxXesPDBw3c+qpaxQ298FLq?=
 =?us-ascii?Q?DdW9Cxsde7UWRRPJyy13QyXpF6+4BGfm2ajXultvf33ebnerrYKHAfZo9o7Y?=
 =?us-ascii?Q?b7ODoQCY5MX3Ia4aPKkuu3piRQbQ21N90aAjvCbcTFsN5k50JZ7AFl1WSqdM?=
 =?us-ascii?Q?vDPVyQdc6jy7j/vTZBg5cXMS99+tXXo=3D?=
X-Exchange-RoutingPolicyChecked: f/Mz1A1PmkCZ5nyfOueHbMIETl1Jfu86PAhiuDWdJEyhHo5kQne9+yah9Bbjz2FEOwmFT2uK71b5sVJjqhGBV+vZvFrPtyA2RNtFcJkGFc7GOWoJjBUTqbj7/NrDTgSC0N6MJC+u2PRXvKe4KDsT/6SyNWBuQLZnl3hMsXWks1qfrqzMwCstsKgT0+P+N54kjCqEIKoOz76uCFZvvOp25QZIOjHr9u9aQ8TmESCxkSDo2Lkc/Mk5kX6wEH8ixTEyoFHOjtBdepTqCPndzpmtYKe7V7oP8FgaR4NCU71CkcIg+GMHPqAfRiS6J9n9kr2N7kq+gY3UGlyJprOXMRCUMw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e8aa7cd-b6af-4cae-993f-08ded2336696
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 20:58:54.2065 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ga2gliPbBHKRxURhQv3gJzaPvx3nGgJ35wU1JKiTmjH3rocbR4Ywbfer83PsfJMctjAdBTb3Dx9TcLvyI920bBlFOBHv2bv/kmXMd5a+DK4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB9975
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Jun 16, 2026 at 04:00:18PM -0700, Harish Chegondi wrote:
> WA 14027054324 is implemented in the firmware and is applied before
> EU stall sampling and reverted after EU stall sampling. The driver
> needs to notify the firmware whenever EU stall sampling is being
> enabled/disabled so that the firmware takes the necessary action.
> The driver uses a scratch pad register to communicate with the firmware.
> 
> Before enabling EU stall sampling, write 0x20 to the SWF scratch pad
> register to request the firmware to apply the workaround. The firmware
> applies the workaround and sets the scratch pad register to 0x60
> as an ACK.
> 
> Before disabling EU stall sampling, write 0x40 to the SWF scratch pad
> register to request the firmware to revert the workaround. The firmware
> reverts the workaround and sets the scratch pad register to 0 as an ACK.
> 
> Bspec update for the SWF scratch pad register is still pending, but has
> been confirmed offline with the firmware team.
> 
> Bspec: 53188
> Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h |  3 +++
>  drivers/gpu/drm/xe/xe_eu_stall.c     | 37 +++++++++++++++++++++++++---
>  drivers/gpu/drm/xe/xe_wa_oob.rules   |  1 +
>  3 files changed, 38 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 08251c7a1a4b..2a649d036660 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -616,6 +616,9 @@
>  #define   CCS_MODE_CSLICE(cslice, ccs) \
>  	((ccs) << ((cslice) * CCS_MODE_CSLICE_WIDTH))
>  
> +#define SWF_SCRATCHPAD				XE_REG(0x4f000)

This register isn't part of the GT, so we probably don't want the
definition in this file.  xe_regs.h would be a better spot for a non-GT
register that doesn't fall into one of the other unit-specific files.

Also, even if we're just using one of the scratchpad registers at the
moment, there are technically 36 of them in hardware, so it might be
best to make this a parameterized macro and use SWF_SCRATCHPAD(0) to
make it explicit which one we're referring to (and to support future
code that might need to use some of the other ones).

> +#define   SWF_EUSTALL_MASK			REG_GENMASK(6, 5)
> +
>  #define FORCEWAKE_ACK_GT			XE_REG(0x130044)
>  
>  /* Applicable for all FORCEWAKE_DOMAIN and FORCEWAKE_ACK_DOMAIN regs */
> diff --git a/drivers/gpu/drm/xe/xe_eu_stall.c b/drivers/gpu/drm/xe/xe_eu_stall.c
> index d37770c58c5d..fa54187de5dc 100644
> --- a/drivers/gpu/drm/xe/xe_eu_stall.c
> +++ b/drivers/gpu/drm/xe/xe_eu_stall.c
> @@ -7,6 +7,7 @@
>  #include <linux/fs.h>
>  #include <linux/poll.h>
>  #include <linux/types.h>
> +#include <linux/iopoll.h>
>  
>  #include <drm/drm_drv.h>
>  #include <generated/xe_wa_oob.h>
> @@ -20,6 +21,7 @@
>  #include "xe_gt_printk.h"
>  #include "xe_gt_topology.h"
>  #include "xe_macros.h"
> +#include "xe_mmio.h"
>  #include "xe_observation.h"
>  #include "xe_pm.h"
>  #include "xe_trace.h"
> @@ -30,6 +32,11 @@
>  
>  #define POLL_PERIOD_MS	5
>  
> +#define REQ_EUSTALL_ENABLE	0x20
> +#define ACK_EUSTALL_ENABLE	0x60
> +#define REQ_EUSTALL_DISABLE	0x40
> +#define ACK_EUSTALL_DISABLE	0
> +
>  static size_t per_xecore_buf_size = SZ_512K;
>  
>  struct per_xecore_buf {
> @@ -682,7 +689,7 @@ static int xe_eu_stall_stream_enable(struct xe_eu_stall_data_stream *stream)
>  	struct per_xecore_buf *xecore_buf;
>  	struct xe_gt *gt = stream->gt;
>  	u16 group, instance;
> -	int xecore;
> +	int xecore, ret = 0;
>  
>  	/* Take runtime pm ref and forcewake to disable RC6 */
>  	xe_pm_runtime_get(gt_to_xe(gt));
> @@ -693,6 +700,19 @@ static int xe_eu_stall_stream_enable(struct xe_eu_stall_data_stream *stream)
>  		return -ETIMEDOUT;
>  	}
>  
> +	if (XE_GT_WA(gt, 14027054324)) {
> +		/* Request the firmware to apply the workaround and wait for an ACK */
> +		xe_mmio_rmw32(&gt->mmio, SWF_SCRATCHPAD, SWF_EUSTALL_MASK, REQ_EUSTALL_ENABLE);

Since the workaround details still aren't updated yet, I think we need
to get someone to explicitly confirm what the expectations are for this
register:

 * If they guarantee that this workaround is the sole owner of this
   register (none of the other register bits will ever be used for other
   purposes and/or other software/firmware clients), then we can go back
   to just doing a direct write here.

 * If they can't guarantee that other bits of this register won't be
   used for anything else, then they need to provide some coordination
   strategy for updates.  Read-modify-write is racy, and it's not just
   other KMD code running on the CPU that we're potentially racing with.
   There could be firmware-to-firmware communication going on in other
   bits that we have no visiblity of, so no way of knowing when it's
   "safe" to do an RMW.  That's why things like MCR steering have
   special "semaphore" registers that are used to temporarily acquire
   exclusive access to the real register.

> +		ret = read_poll_timeout(xe_mmio_read32, reg_value,
> +					(reg_value & SWF_EUSTALL_MASK) == ACK_EUSTALL_ENABLE,
> +					1000, 1000000, true, &gt->mmio, SWF_SCRATCHPAD);

Was the 1 second timeout here suggested by the firmware team or
workaround owners, or are we just picking something that sounds like a
long timeout and hoping that it's long enough?  If we're waiting for a
formal update to the workaround text, it would be good if we could ask
them to provide worst case timing information so that we know for sure
what an appropriate timeout value would be.


Matt

> +		if (ret) {
> +			xe_gt_err(gt, "Timeout polling for EU stall enable ACK from firmware\n");
> +			xe_force_wake_put(gt_to_fw(gt), stream->fw_ref);
> +			xe_pm_runtime_put(gt_to_xe(gt));
> +			return ret;
> +		}
> +	}
>  	if (XE_GT_WA(gt, 22016596838))
>  		xe_gt_mcr_multicast_write(gt, ROW_CHICKEN2,
>  					  REG_MASKED_FIELD_ENABLE(DISABLE_DOP_GATING));
> @@ -730,7 +750,7 @@ static int xe_eu_stall_stream_enable(struct xe_eu_stall_data_stream *stream)
>  	reg_value |= XEHPC_EUSTALL_BASE_ENABLE_SAMPLING;
>  	xe_gt_mcr_multicast_write(gt, XEHPC_EUSTALL_BASE, reg_value);
>  
> -	return 0;
> +	return ret;
>  }
>  
>  static void eu_stall_data_buf_poll_work_fn(struct work_struct *work)
> @@ -840,6 +860,8 @@ static int xe_eu_stall_enable_locked(struct xe_eu_stall_data_stream *stream)
>  static int xe_eu_stall_disable_locked(struct xe_eu_stall_data_stream *stream)
>  {
>  	struct xe_gt *gt = stream->gt;
> +	u32 reg_value;
> +	int ret = 0;
>  
>  	if (!stream->enabled)
>  		return 0;
> @@ -853,11 +875,20 @@ static int xe_eu_stall_disable_locked(struct xe_eu_stall_data_stream *stream)
>  	if (XE_GT_WA(gt, 22016596838))
>  		xe_gt_mcr_multicast_write(gt, ROW_CHICKEN2,
>  					  REG_MASKED_FIELD_DISABLE(DISABLE_DOP_GATING));
> +	if (XE_GT_WA(gt, 14027054324)) {
> +		/* Request the firmware to revert the workaround and wait for an ACK */
> +		xe_mmio_rmw32(&gt->mmio, SWF_SCRATCHPAD, SWF_EUSTALL_MASK, REQ_EUSTALL_DISABLE);
> +		ret = read_poll_timeout(xe_mmio_read32, reg_value,
> +					(reg_value & SWF_EUSTALL_MASK) == ACK_EUSTALL_DISABLE,
> +					1000, 1000000, true, &gt->mmio, SWF_SCRATCHPAD);
> +		if (ret)
> +			xe_gt_err(gt, "Timeout polling for EU stall disable ACK from firmware\n");
> +	}
>  
>  	xe_force_wake_put(gt_to_fw(gt), stream->fw_ref);
>  	xe_pm_runtime_put(gt_to_xe(gt));
>  
> -	return 0;
> +	return ret;
>  }
>  
>  static long xe_eu_stall_stream_ioctl_locked(struct xe_eu_stall_data_stream *stream,
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index 9027365f0043..41734b9672c5 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -66,3 +66,4 @@
>  14025883347	MEDIA_VERSION_RANGE(1301, 3503)
>  		GRAPHICS_VERSION_RANGE(2004, 3005)
>  16029380221	MEDIA_VERSION(3500)
> +14027054324	GRAPHICS_VERSION(3511)
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation

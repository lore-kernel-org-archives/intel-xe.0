Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B628DC77B7A
	for <intel-xe@archiver.kernel.org>; Thu, 25 May 2023 23:29:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 850BA10E008;
	Thu, 25 May 2023 23:29:05 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76C7210E008
 for <intel-xe@lists.freedesktop.org>; Thu, 25 May 2023 23:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685057343; x=1716593343;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=V25DpSeXM5rJF5bG102WJ4gdmgHB1zeZpGfpxbZri9U=;
 b=n7kLG9g10abQFUq5rUg5QGHi7sQzLW1aSHXL+4Coy272p18FSIG9ngAw
 4pyxLR24xDKINhz56MTyYCcvo77cJrDiLqyRbhsowRBtnP4zxKeJENbXY
 QxDnKDBnuiJFcJGfA1TZ18CIgSydIoIX+V+HyJor4r+UVD0SQA3uy7kmg
 YBpkUIcu5y0CQzdKLg8TvHz51u/eJFKMTjnkkN6MmT2TQQEnpRoj6ze+v
 pPUj0KnCAyNhjHUYlb1ycyVuMnssd5Cc68FZAPtkc7ukZuuWO7Nt+KyBJ
 1vWIgIciYnW8zvteZi8JotKGCnfiKPRtcHWSZPzM8x0skix7EhzLPG5QB A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="352896852"
X-IronPort-AV: E=Sophos;i="6.00,192,1681196400"; d="scan'208";a="352896852"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 16:29:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="879322307"
X-IronPort-AV: E=Sophos;i="6.00,192,1681196400"; d="scan'208";a="879322307"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga005.jf.intel.com with ESMTP; 25 May 2023 16:29:02 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 25 May 2023 16:29:02 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 25 May 2023 16:29:02 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.49) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 25 May 2023 16:29:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bihsTeTUrfPPG0ds9xzWtG3i/c1AoUJco1qcb7hSaxf9adp+Tlli5/r/OHCAbm3xjG13+XJreMqHonIRoa7lAsJ0ki2AIRIOs0vE6RGNm7uoNeXaghbgBF/J4DjmpJJYaSXticv4BfFb14afgP666sLArQz7LDrMGaxKct6WZ7jRchjBbqt9FKmxdgKMIKwUhYmpwHsw11JGF2sGFG32HIXg91dPQnA0cWpnakjjGXtm33d2PQuzx50iAVSn2rADrdmXK+brXlfh8voViYZlbpdsgnoA9sd8Lf9gXVrqJQhfB/GL7blZr7zNmTCrtDczznMlvcRLjWbpld1jZF4JiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=khSK0xEZHmmnx9BhlPPvwj5IgpT1ew6lPq3DckIlQ9I=;
 b=YutP9XVZjYBmCeHjAOpgNP0C9msKKSJaKexbXVxgDhWEneZ5gVDwuClu2LzIAFyY01T/mPJRkwdL0BrE6oeFLVUwA/P+hQAqB/U7kp8JqWA8yXMRxqqx1YC1bixG4rQ4ek5PSjKFLw3a/a0T+7PEYBIxlbcAseX0VjUg8vDjk4C2cdamdDzU5A6ZocDLU/DiktEA325fZsaGAj90TbEY8AsdatmDo/NRe+76QcJ9xaXqLP9mECxv7RDmIRTO7JlvuLwrJyNrPUNs16Ot/31TEFoFfKxnMygMT5Bvi29YGHPpwmSkMeVe9SPo+Lh8j9y+QVQ2KF04VTEdAab9OymGtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 PH7PR11MB6377.namprd11.prod.outlook.com (2603:10b6:510:1fb::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Thu, 25 May
 2023 23:28:59 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396%3]) with mapi id 15.20.6433.016; Thu, 25 May 2023
 23:28:59 +0000
Date: Thu, 25 May 2023 16:28:56 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230525232856.GF10045@mdroper-desk1.amr.corp.intel.com>
References: <20230525213407.3907094-1-lucas.demarchi@intel.com>
 <20230525213407.3907094-19-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230525213407.3907094-19-lucas.demarchi@intel.com>
X-ClientProxiedBy: BYAPR04CA0016.namprd04.prod.outlook.com
 (2603:10b6:a03:40::29) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|PH7PR11MB6377:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cdef44d-6fc6-4606-60ba-08db5d77d0b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qcnM+3+I2bk4UTWdltmmklxaV/sjGg1q2hBFu69rnamuP9wAvy6QC+aT/oIE9bW+XHanqeI1uo6MiZuWVjC0j8rR62lOqoNizDI1tndbSQBEEgrMFSyrnzanIgCx9iiyvJe/fgoH9mL6KleQpYBxkMzk3c9VvCtCSl2O94xZSdt5/zq6iXGcBjsmmaNCVVWXufPuqxdruhEyHocOdqYsqFe+F5Z+xkPs0KDtAY/Ras/XVMEJXwtCYS7a6qSylJUT0YDaPsJorv6xscjdbGjpnqXug4GfXRdGE0MP0KEXsSmrdMhPawdx+2Jek4eNGcUdUh8oSTkPSO82gJsYqLTzLk3OoTjs9t7b12O05dZWhU2T6mT9IsBQMAuPwfG6nUXCXf9t9JDvhK8Jj+SX/OknnDn0qtE4GuLfV0Yl/hLK8Mhj3cUQxyzU01WZmBQAfm/dNEDJvu6NIgZGp1eBA2nbZIf1gzPETz5MeayR0t86B4RybArlpvMqatCuEAdb+++LCKQMpsvO7quAaoSsjbV1VQ8CUKrrLjZiyF6dySx5IyMtVz7VXiynw9wXndEq25De
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(39860400002)(396003)(366004)(346002)(136003)(451199021)(41300700001)(316002)(26005)(1076003)(6506007)(6666004)(6512007)(6486002)(82960400001)(8676002)(6862004)(5660300002)(8936002)(38100700002)(86362001)(478600001)(83380400001)(2906002)(186003)(33656002)(66946007)(6636002)(4326008)(66476007)(66556008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?putdCzBPYwCvU4eCkHzcXn59x7l8PHbPhizbJ2Awi/s9F08fkniMpBfigAAm?=
 =?us-ascii?Q?bx4z/J7xpnsuD/kpU73WTW4aoRUkdtlqvIewXk0AwJPvxTr9kE6AanUThkjs?=
 =?us-ascii?Q?WFYXYBHZlbjdYIpNPnLTvjpNFSCE29SDjOp25hHktHDrf7fIU9sS01lc7bjv?=
 =?us-ascii?Q?6UhZ7n49Zru0pkOaBFmZHRaBMFZ2DFSBMZxb9+BmoAkcWSO/LVrJ+WkHB0YH?=
 =?us-ascii?Q?AbHLvKXdtSDJ6C2wY3YKI3ysi3CksLgkBXmHrvlCin/E0Cv65tonK1K63Nb0?=
 =?us-ascii?Q?FIsJ/MqFDc8Gx/jgLAfiYQnSq95PHvwLkmDt9rj6UBJeVIQ9+T3tsTJy1U7q?=
 =?us-ascii?Q?apcurDks5quMHdbU+6fde1yO/Hu6wfnsSjL/6H1BjQM/Fe4Ta7mIIgkX/7as?=
 =?us-ascii?Q?oxLQ9mV/8Yha8xdIfT1NYzJNqzjgr2NAkRkXUGp6Z9aEDpm2+Im+mic1NiJC?=
 =?us-ascii?Q?vGVPSeZ3VFRkto4iUcR55cg22esqqlkCZXBd6OmGOzdEfVCWF6DYcqH97IBS?=
 =?us-ascii?Q?yUJcAD5JvAwTwn7dhFgLqJJSAzuRc/A2n0zsd70UPW/3VVMK8865KsQHuxzi?=
 =?us-ascii?Q?w2l4BLc5tCuZ2l2QTua2duRQKTZJSGNSrq8sfSoLOO58ql17W5LOGL/BUnSv?=
 =?us-ascii?Q?iVVP65eTSRCm7coDTO5X8lRiXsATehETMdpIrYqGlMdqVm+8ZmGKfUqdwrdI?=
 =?us-ascii?Q?Lm63/YlvA4isUNBRXZGus9D8U5l2QHB+Nrnggp6MewOwtjzNzDwrHW4sEHiS?=
 =?us-ascii?Q?g35JgnoEyaBAgUV4fNB317AtUC4U0X5WOwmUW+jJnlOW4A4nEhMod+FCJ0LL?=
 =?us-ascii?Q?YCPlUodfrE21yrbw8N+bvBxVeBEajZOLgQYFw2dhYCCKKplnLPR0IlJkvU5L?=
 =?us-ascii?Q?3TvsjCWg48j9qeT9dzDrYvyeYpgCeOB2uR5azanTogJvp1oJs6mMEwF2YrDl?=
 =?us-ascii?Q?xoV7iYZXhp8AntMJNmRXRTqBGHrqXZFTewAqxwTGkxtliKWHw30iQcscDHDu?=
 =?us-ascii?Q?8H9lotnD1+oA9+XUIJIjaJRw1T52SPkG7/O4A5gfWM3z3lkvSLBBzO8Ziu73?=
 =?us-ascii?Q?pNQNyTGv4KwTy+mbHMYZ0Ya9Dnsxq4Jsr1+OFcDhMkpPWEl05KfjchLqz9Lp?=
 =?us-ascii?Q?FISR2+vOsk1IEgQfANs+/uppqmvG7NkIPT1EaUWC2mR36ma1yPUZMFs1Ce7u?=
 =?us-ascii?Q?IdMCPHKgjf6faqANVxF99TWLkdIMhcY41XwqlLd6Op4slP4/hO1v2nHdDi3r?=
 =?us-ascii?Q?5hS9P8HlKG/zFJgf7n4hqsehP5fzhfL049oSuRq7mGRa67fnueWVj1V5pPcT?=
 =?us-ascii?Q?vXjh6VohQXTFjfU9tAQWw4FTtGWFcmI739lQ0VBDyLiaLxgaKeMwHxtVtdP2?=
 =?us-ascii?Q?oVI/GAS/mNaKCkYys5cunSLfLvyVgKqcRB3axsWa5GKkKB3IavpGxfSBIKxw?=
 =?us-ascii?Q?iBFevxr1fiIuKz+NpXRe+Tn6CycSbTCyr8u//AKD1tTOCBbAon4LtglEfaRT?=
 =?us-ascii?Q?Vh8/wY7Qs3s1+5frTvJbV3AM32NJk+cEC1DeZydzUOJyoq+86t4gIwPpbbJ9?=
 =?us-ascii?Q?O1NcORVnGe4wI4ya+IeOpCqQQKyxXkH1Fw0seZTM7suMSZRFygQH9Zm6roFh?=
 =?us-ascii?Q?cg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cdef44d-6fc6-4606-60ba-08db5d77d0b8
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 23:28:59.0256 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4nMLai2z/FWmPNNrKo3VWmffMLe4XgACVqtqirYGDXolFrMM0gDcL6tLFKR7xB0Xl8NTe4Y/5tXQAVReEpDnrAUlKADtmsQV8yXGhZRKgj0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6377
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v4 18/21] drm/xe/guc: Port
 Wa_16015675438/Wa_18020744125 to xe_wa
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

On Thu, May 25, 2023 at 02:34:04PM -0700, Lucas De Marchi wrote:
> Wa_16015675438 and Wa_18020744125 apply to DG2 using the same action and
> conditions. Add both to the oob rules so they are both reported as
> active. Note that previously they were not checking by platform or IP
> version, hence making them not future-proof.  Those workarounds should
> only be active in PVC and DG2, besides the check for "no render engine".
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc.c        | 4 ++--
>  drivers/gpu/drm/xe/xe_wa_oob.rules | 3 +++
>  2 files changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 1291f71348db..cc58a2092236 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -164,8 +164,8 @@ static u32 guc_ctl_wa_flags(struct xe_guc *guc)
>  	if (XE_WA(gt, 22012727170) || XE_WA(gt, 22012727685))
>  		flags |= GUC_WA_CONTEXT_ISOLATION;
>  
> -	/* Wa_16015675438, Wa_18020744125 */
> -	if (!xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_RENDER))
> +	if ((XE_WA(gt, 16015675438) || XE_WA(gt, 18020744125)) &&
> +	    !xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_RENDER))
>  		flags |= GUC_WA_RCS_REGS_IN_CCS_REGS_LIST;
>  
>  	/* Wa_1509372804 */
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index fecf9dd431c5..05c821a50680 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -8,3 +8,6 @@
>  		SUBPLATFORM(DG2, G11), GRAPHICS_STEP(A0, FOREVER)
>  22012727685	SUBPLATFORM(DG2, G10), GRAPHICS_STEP(A0, C0)
>  		SUBPLATFORM(DG2, G11), GRAPHICS_STEP(A0, FOREVER)
> +16015675438	PLATFORM(PVC)
> +		PLATFORM(DG2)

I see DG2-G10 and DG2-G12 listed, but not DG2-G11.  Platform-specific
ticket #14016276341 confirms that DG2-G11 should not be impacted.


Matt

> +18020744125	PLATFORM(PVC)
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation

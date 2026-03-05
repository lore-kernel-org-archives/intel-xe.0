Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D1ACF513E1
	for <intel-xe@archiver.kernel.org>; Thu,  5 Mar 2026 22:05:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC8E010E28F;
	Thu,  5 Mar 2026 22:05:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lHosx+SM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DA0210E28F
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Mar 2026 22:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772748326; x=1804284326;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=BiULsWb5ivTCaKH5lzBvOlEf5tnKUit35Pjh/v5LWxU=;
 b=lHosx+SM9iQzHz/tPkVIIFXpr9lEcppk2kgUkbzeWKgPhrhVkVG974e1
 WdkGNFYHZ9sMgYcDVZD4Ij0dyeyJ7bLa47iwhuZ0/I9jswMGrJ1XXqjWE
 1h1YCaHxdH0XY6M3UguqjKbTVx7FdGOT/BFlg14hqnYoRijRt8OWyEa1r
 bK8u1tisKjY6quESNpbCw08NTtvagw46Jft5hW9BG2IQaeQ8MH09Fb2LF
 wFh/dwieTJDr2a9K/yfBMY87WY1wZk8ATGVz93WUQ9wRrJiYWxTejgFSa
 Wg67jab6+Gkooh9KpBPSzIXBpkhARt9VNvyHEOZApfhRZbduMcWtg5808 g==;
X-CSE-ConnectionGUID: EtyXiC64SkqUvGuk05DhNQ==
X-CSE-MsgGUID: arSI6eIZQVm2mp5Dco1vvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="84486091"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; d="scan'208";a="84486091"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 14:05:26 -0800
X-CSE-ConnectionGUID: 1u4RnMG2SnCaqsiVDfRFqQ==
X-CSE-MsgGUID: rKEsU9ziSdusIo44OKLhNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; d="scan'208";a="223514706"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 14:05:26 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 5 Mar 2026 14:05:25 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 5 Mar 2026 14:05:25 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.14) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 5 Mar 2026 14:05:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UY/VDyIfrW7oX/ajxthnAdEViFpnr5BH3ufLd14pF+oErbW8xK/NcEp3ktzZyO2nFs6t3xT31tTw0vzLr53KOXyFhwJhpDTtn8WkN4m52wjqkE5ea4zVew3YNZr+siCTfqtReu25xT47URfVE3BkNy7j1CVAnRmsc+cIKLEErhksBtlY9P9jjJhEb0FUSaffAW+ohNKtfnLqiqExh0qSWMoAV9lzhYy23Q1z07W8hI4kXkmpNrPq6TeZ1k4S+yYM4nVaVRSBvMgofW4w5rBIv8ClAhZeyRgqPl7d4zazhQHbrN9NyMeKzkaONvCXevjjaFfLz0sFn472/Ldhhip5kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GCeIfBhrjm/lqHqQ9L5gfU/A+5Ykmne1nuCgv6SbYr8=;
 b=hGgz3H0mlQPH1cJpKF+AkDtzl3kKkFhECA9p7mhY61fXRm/ELPn6AXJzh4IWV2ZIyfqYNWS3GmCyhLxFp3RMYLALlCf1xKoZOtgV2PLL9Cv7oTAZvhXsVXmSAD3VPCfwyfwHyXfCuzTlqkRSaqOGQRVJVhVJ8AGmgWmtEHUtqSSl2LG6crahSe7mvhSo+Rdx7R0uWaJnMupZUvNi0ApnLt+yfS+oWwbGv6q2W+rYqqeUqTlHwdJbOXp+pEfuH8Grby7tn8rw6fEmH6OWIzm8iQBFjxt7pPHzioZmviIPNc6694C0tfwwmMy4bplZz82Bdhas5aV6Y+ADctsusOw9Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CH3PR11MB8413.namprd11.prod.outlook.com (2603:10b6:610:170::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Thu, 5 Mar
 2026 22:05:13 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9678.017; Thu, 5 Mar 2026
 22:05:13 +0000
Date: Thu, 5 Mar 2026 14:05:11 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Piotr =?iso-8859-1?Q?Pi=F3rkowski?=
 <piotr.piorkowski@intel.com>
Subject: Re: [PATCH 5/7] drm/xe/nvlp: Implement Wa_14026539277
Message-ID: <20260305220511.GO4694@mdroper-desk1.amr.corp.intel.com>
References: <20260305-extra-nvl-p-enabling-patches-v1-0-5020d5289dea@intel.com>
 <20260305-extra-nvl-p-enabling-patches-v1-5-5020d5289dea@intel.com>
 <87a4wm8flj.fsf@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <87a4wm8flj.fsf@intel.com>
X-ClientProxiedBy: SJ0PR03CA0240.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::35) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CH3PR11MB8413:EE_
X-MS-Office365-Filtering-Correlation-Id: c44e5a2a-26f5-4644-ead1-08de7b0346bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: c6qlxmyyRnYaudgEs+vOUJHQ/JvhSEOHU9AjWsZ23ciOklBoeolROe3TZSkTXohwxgO1pesTGql8uW8gvujEi1A+BI9aP+ieojJylMMHLNppRNiqfaHgENRO/PBqhpoomt9ccGRU8/94GOtDLFkf4EyOPl7thiDCPx1iL5eTpsOGBgoEpLMP6Lc9Ywzb+twjIJZarkOBce3iwelCFHJm0Wajo1zGFEuu50zlWLk6vk+u4LYJyRCu4rXSCiKub63S5pLqNtTJDEBKQNPuBdBxXBp3V3/WBG3kx7BhN+FSF6Qaak47d+zaJ9nA/vQCjd7+Q3zrqJeHdmdWeuQ3OdmOkOgipqcRFCugcOxf7+DMNxehgF93+eht5kJkdQ+9ivJr3jpWcchZGUNFVid+DvtmgNtb9ZtHSpeF3ii8Ue/O24bJcWjgH1YMkEKm+F3vHNdUl0J1yZWAbDh4S2m3u5h0IHW6ZV5DqVveSNvVZQ2iT5dw+FjEizoREyJcSCOl7S5XqOaHycccNSazcNcZP6TUjx2w/Seyq2A1sM1r551KyukEJ9lRO5rMuOaohm9gyaaFsHwKklfEJZcBrjTk5sBd4nlhTj1O6RbEZHsffgTiOk95KK+wW9tH9ANdYGI/Dzh4YAmgiM51QhG1m+f0s5lsclwWKBv28naxwPRzlu0fobj+OHpAxPp/vMHIRjKLkOb8hqRD2M2IDIwJoYpTpWc/sQtUSASGbdcT5pqcwMvaGlE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GuLQsZbyl7tV5nT94HEPtmN0oorF8Bc6GVZPHKPxKMrW3dtR1KNbkEH2afKi?=
 =?us-ascii?Q?+kmjn6AOlbRYs8AxFZuzpZqHVSkuEKrVYGu3/esoNoE7ts3nc3QAnIlErj2O?=
 =?us-ascii?Q?39FWaHbmwdeffDNOPRO1kcPCsW3Vr+LuWSxr/0NgBY8ggWDzMjfwLfIVaIQ6?=
 =?us-ascii?Q?sQYzECQ87mIsp20OF08jYdpda8N85hLqqvPUyx1kwSZ/JIGBGu6EWwx7DxRz?=
 =?us-ascii?Q?IWnpoUAdYaCzoJPK+VcUgipBNyac0ijhnMGNSqkouFjNKeVZZk8zz0s1+uAk?=
 =?us-ascii?Q?thavNneZyYjqyWpl2GgNuSWcddw8xYpqOnlqNQYcAE2L0Q6J++2w6wgLlWE0?=
 =?us-ascii?Q?uzroCinZA2SZ2aeFyaUTx5VE+eWBWnmVB0q8WTiD+GxZyybpFJqu4EB4ebMJ?=
 =?us-ascii?Q?+9jMfKTSybRhFqcUbYYgU6N/uDy7pMePo6V5mdlPVShmSmvgMu/swphFzHPQ?=
 =?us-ascii?Q?X/4j6ya2Zh5+WpyFvO3+tvVYR9YnbysWQdc1JU8ATvOQ5Lqi/3tuWMidkHey?=
 =?us-ascii?Q?7BnwhU/Ve1I1W8TogpAQLbfOf7A3DnWq1hYfdhmcGg4tOdHldysR0bXDVdFK?=
 =?us-ascii?Q?Ck5B3Oe4AFpUrsHH8kH77PgxCMr+i5xMW1i5TtdOkBCQDxYJKPobDQtx9cL5?=
 =?us-ascii?Q?f9XsA4lfHFdeT8G1dc8YZML1YklDK/EK5kki6h/SVuBbs96MnrleuUf16Ceo?=
 =?us-ascii?Q?u3sSr5jtd6+NHVzAZ+4oRCvN06rxqbOipBFqaj3nIaTFSaRiiCsK+YTAn5gA?=
 =?us-ascii?Q?Qk3LlFN5K3kSJolBQz4Gf1dIad4Ze766FyfhFRJEcXP5Yzp9OxU9E+SowEQg?=
 =?us-ascii?Q?r+nRqDDfQUfih5iibY3iPM0SDTFC06Xx7kqsjwFxW4lism+11Bis0rbOfAh8?=
 =?us-ascii?Q?SJqQYM0wR5zitypQ0oTQEyd5j4hUpJUFc2uqwRYKJdP2tIPiYCEQbbV8KV75?=
 =?us-ascii?Q?w+LhLOiMMjRIb+zWznB4edBcerfS0TVuyAZZfkw9poJX4ejgAjTUMcsgGmqX?=
 =?us-ascii?Q?ce0yYezRst3WLu9fvqMWmwTA9VGF2XiDn363BjxgG+/p3Ye45hOtN4o+4C3+?=
 =?us-ascii?Q?4Xc3yyiAQNw5eKH8cYoVrqcY1JEVBurgtpezbppC6t7LCX8eODvIPtTaMF9Y?=
 =?us-ascii?Q?QyO3141Ow6FK3VKgXYc9FpY2h3HtJM/y5O+EGTJ3WfdaILgC9iq/uss2qCa8?=
 =?us-ascii?Q?TLKfIOpiTJCzH1zt+dAr8vtRrWrqXImb3dHoJqiYAaYClbjc1VyujbPt0n7g?=
 =?us-ascii?Q?innL/pLJj80uUDw97kGgAqej9Dvd7wf3skxML34lwBvxfWG74SzF7oEPkvEA?=
 =?us-ascii?Q?TTy2OIYNEDc+F5Bau/5YfDqVpavT+vlTNlyYTL+IOoCQpeqJVoLF7m9Kfwfc?=
 =?us-ascii?Q?opsWCxhYj3RiF2ZI8yhx4gSFXb8YmEn5pVx9BpeTJl0XQJfruc9KE4skEFgt?=
 =?us-ascii?Q?sudpJoAGutpAahxadZU2mER6sZelW3gBfx5PCX7rDrXiSPXokxVfNYJFOa6v?=
 =?us-ascii?Q?vebVgTZM+GSqy4/eoG/+5UrMVwpyAuvL7rWN+g6BChvj6/7W3L+a8077rNVe?=
 =?us-ascii?Q?rWb2+WXCy1ok28B3C8d3ZNh098WA5PBAeUsSgGODNuPIhOrYYnMOvaoAuS+Q?=
 =?us-ascii?Q?W8PhxIgtxTCJ/gZ75YbxoULNBcM9gNrkn8P/MhJ0Vq94oDF2Cdw8UYdNKQDe?=
 =?us-ascii?Q?3XuhVQi+f67IiDhgTZlM5NDlfNHM8QubxJfwEzeeEJGzaLPNrTCFZL5THIVh?=
 =?us-ascii?Q?E+ms6L4/IV+l7Syc1ThkHxdUPmz2Nsg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c44e5a2a-26f5-4644-ead1-08de7b0346bc
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 22:05:13.6950 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5BGdcAvBD7H2r3JovUgawUL6UQy4074GNLnGYT8K4q9q2L5EMDz/Ebx4XAUDCwViGOEXT54WZny3btWJsSJR+kAI6Ahf7uiEKLDQoLBUbR4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8413
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

On Thu, Mar 05, 2026 at 12:23:52PM -0300, Gustavo Sousa wrote:
> Gustavo Sousa <gustavo.sousa@intel.com> writes:
> 
> > Implement the KMD part of Wa_14026539277, which applies to NVL-P A0.
> > The KMD implementation is just one component of the workaround, which
> > also depends on Pcode to implement its part in order to be complete.
> >
> > Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
> > ---
> >  drivers/gpu/drm/xe/regs/xe_gt_regs.h |  4 ++++
> >  drivers/gpu/drm/xe/xe_gt.c           | 27 +++++++++++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_wa_oob.rules   |  2 ++
> >  3 files changed, 33 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > index 66ddad767ad4..a83cafbe03fd 100644
> > --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > @@ -452,6 +452,10 @@
> >  
> >  #define XEHPC_L3CLOS_MASK(i)			XE_REG_MCR(0xb194 + (i) * 8)
> >  
> > +#define L2COMPUTESIDECTRL			XE_REG_MCR(0xb1c0)
> > +#define   CECTRL				REG_GENMASK(2, 1)
> > +#define   CECTRL_CENODATA_ALWAYS		REG_FIELD_PREP(CECTRL, 0x0)
> > +
> >  #define XE2_GLOBAL_INVAL			XE_REG(0xb404)
> >  
> >  #define XE2LPM_L3SQCREG2			XE_REG_MCR(0xb604)
> > diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> > index b455af1e6072..3c8692f9b8cf 100644
> > --- a/drivers/gpu/drm/xe/xe_gt.c
> > +++ b/drivers/gpu/drm/xe/xe_gt.c
> > @@ -450,6 +450,25 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt)
> >  	return err;
> >  }
> >  
> > +static void xe_gt_wa_14026539277(struct xe_gt *gt)
> > +{
> > +	u32 val;
> > +
> > +	if (!XE_GT_WA(gt, 14026539277))
> > +		return;
> 
> It appears SRIOV VF wouldn't have access to the register below, right?
> 
> Adding Piotr here, since we talked about it offline recently. Does
> implementing this only on PF side suffice?
> 
> If so, should we return early here if on a VF or should we rather add a
> FUNC(xe_rtp_match_not_sriov_vf) in the rules for Wa_14026539277?
> 
> One thing that I realize with the latter approach is that 14026539277
> would not be listed in the workarounds debugfs file.  Do we really want
> that? I think this question applies to all cases where we use
> FUNC(xe_rtp_match_not_sriov_vf), not only this one.

Right, registers like this only have a single global copy in hardware,
and whatever the PF sets in there applies to everything on the system
(PFs and VFs).  So adding FUNC(xe_rtp_match_not_sriov_vf) sounds correct
to me since this workaround only applies to PF drivers and isn't
applicable to VFs.


Matt

> 
> --
> Gustavo Sousa
> 
> > +
> > +	/*
> > +	 * L2COMPUTESIDECTRL has a specific offset for media and the GSI offset
> > +	 * does not apply.
> > +	 */
> > +	xe_gt_assert(gt, xe_gt_is_main_type(gt));
> > +
> > +	val = xe_gt_mcr_unicast_read_any(gt, L2COMPUTESIDECTRL);
> > +	val &= ~CECTRL;
> > +	val |= CECTRL_CENODATA_ALWAYS;
> > +	xe_gt_mcr_multicast_write(gt, L2COMPUTESIDECTRL, val);
> > +}
> > +
> >  int xe_gt_init_early(struct xe_gt *gt)
> >  {
> >  	int err;
> > @@ -575,6 +594,14 @@ static int gt_init_with_gt_forcewake(struct xe_gt *gt)
> >  	 */
> >  	gt->info.gmdid = xe_mmio_read32(&gt->mmio, GMD_ID);
> >  
> > +	/*
> > +	 * Wa_14026539277 can't be implemented as a regular GT workaround (i.e.
> > +	 * as an entry in gt_was[]) because we would get the hardware already in
> > +	 * a bad state by the time it would be applied.  Hence, we implement it
> > +	 * as an OOB workaround and apply it early to prevent that.
> > +	 */
> > +	xe_gt_wa_14026539277(gt);
> > +
> >  	return 0;
> >  }
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> > index 80b54b195f20..7f42436df6ab 100644
> > --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> > +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> > @@ -58,3 +58,5 @@
> >  
> >  14025883347	MEDIA_VERSION_RANGE(1301, 3503)
> >  		GRAPHICS_VERSION_RANGE(2004, 3005)
> > +
> > +14026539277	PLATFORM(NOVALAKE_P), PLATFORM_STEP(A0, B0), GRAPHICS_VERSION(3510)
> >
> > -- 
> > 2.52.0

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation

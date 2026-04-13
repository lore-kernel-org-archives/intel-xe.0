Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C31FAF531C7
	for <intel-xe@archiver.kernel.org>; Mon, 13 Apr 2026 19:18:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7879C10E51C;
	Mon, 13 Apr 2026 19:18:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aWZm2H/N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A44C89E33
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Apr 2026 19:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776107884; x=1807643884;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=JJ+OcYo66+V5HvaBVvRU/39niVpSGjZHMcp9cSixn04=;
 b=aWZm2H/N3+8wg/M3ar67Atsr9KhWrc4KSEKFZ2pMe5sYVZjhA4mxwgPT
 ixDVpov6Yse9i6rsmYKCEHjE/9z2v7BQIoai/zTIf9ti0178nC8FD2vh/
 YiyfB5iUQwlzDAMV8GW4VHmAbijMB9kSBI330gvT0nZUxJK2ex7qqtqM2
 p5QJUlLry/u3MRlhP8xVOc1mLA3/JJUuxXFDuQaTy7k4iXsAfIHpUg/2C
 qzW+QOyHQr2sUcUz6J3oq9C56BibD8nwL5cxxmZmDgooh/JcLrENMQH4F
 ND5KqaUi+MIaZhOBBL8DWgUgGToYHF/FXOp9DiKGTwFmcqqk2OW53u4AQ w==;
X-CSE-ConnectionGUID: X5LH6J56QlyZfzdBS0ZyBw==
X-CSE-MsgGUID: 1igZPDAaTyiS0J+9cZMFZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="76762586"
X-IronPort-AV: E=Sophos;i="6.23,177,1770624000"; d="scan'208";a="76762586"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 12:18:04 -0700
X-CSE-ConnectionGUID: yC0CrnkRT7iLgO/ICrUtEw==
X-CSE-MsgGUID: C9cBYYm0STWGh5uN1gWkkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,177,1770624000"; d="scan'208";a="231602747"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 12:18:03 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 13 Apr 2026 12:18:03 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 13 Apr 2026 12:18:03 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.25) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 13 Apr 2026 12:18:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VLs4wWOs/MbKKqqw0TQlR+ESex50T9ILlRSqWAwCzBc23lptn+a+G81lEhTdswIsYI9tWo3Fe7qFM8lJxElesr2/p+Z3BUcL2OJYZNvIsXckL5fi8a9ltxsW/maO1ClBRtP2/GAAg89aSMIq8uL2IDgFrwfLDYLYgI11Fh19FiasgpYlIK1i2+SMuQ67PAgqOyLd/Ynp5Vdjm2ICB/byacZDgDvmXcEo+VQdZwySEZTLplXnYs5aKJAJdg/3qQ2ilTSWXL+XiRPdngd5FfzCN2+Vw97vZzwOiBp0WABAyvRAc3f6APc+JGd4CaQN/4LuLSxdIjj/K9o0dUNygtTLsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VPwIN8boE2YTLSWMUzxFrzoddEliN7jgbLerNCYjjOY=;
 b=jIq1xwW4bMY8rC+irhKGXd6F15BHCvJKtsAYDXvLkzSNh/SVrHpb8Ic4oXYz51WA2AqzwZKwzWeY+JHXfXuHZJA0ng8gZ3YgXY78/gPWFg3CeFaEgBDD1CF0khbV8cjUm+2xwDvh+AB52/+pPdX6xm8vt0fRwIcxm0vXkGPNVZSSLkNHasIG32m/8vuCFvV5ccG3nKxBHfqTfFfGGCgmQZoda88/e1yAkRL4asMD088PW54ml9ExUDReIf7HIPHeoHehHLWKvmg1A5V9b5TBVuzxV0Xh72xUkM2TDQ4JLWNdCAjuwpb3YaVHNL9EDrzfmy+OriiTgb6HOCTZ8NYMcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by MW3PR11MB4522.namprd11.prod.outlook.com (2603:10b6:303:2d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.18; Mon, 13 Apr
 2026 19:17:58 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9769.046; Mon, 13 Apr 2026
 19:17:58 +0000
Date: Mon, 13 Apr 2026 12:17:55 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/3] drm/xe/tuning: Use proper register offset for
 GAMSTLB_CTRL
Message-ID: <20260413191755.GH6301@mdroper-desk1.amr.corp.intel.com>
References: <20260410-xe3p_tuning-v1-0-e206a62ee38f@intel.com>
 <20260410-xe3p_tuning-v1-2-e206a62ee38f@intel.com>
 <87jyuaoos1.fsf@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <87jyuaoos1.fsf@intel.com>
X-ClientProxiedBy: SJ0PR05CA0153.namprd05.prod.outlook.com
 (2603:10b6:a03:339::8) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|MW3PR11MB4522:EE_
X-MS-Office365-Filtering-Correlation-Id: a7c09443-8692-46a9-fdf7-08de99915f4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: whMYW3I5zygA3ctvSyD8WwpH5fKwfClCD7KcMi4b4Cj9TekjVQIA2nJhlegFTHjROpv5MoMSuDmfRhTZspt6LNCn0ip9eUK9fqV/2DjTUWlAIM4KxJffjSbbuiZCTnp06k+8pQqy6y/kuLGGnHHgCgFxoin3XdWdWUsEBHATOkZU5Pw9ED/VSpYTX2v2Zbn6kb6xMyFP245OrSV9QPRQRvngW5zeE7Q/7mIV7BYRDP5PpC8bzjt1LGtkEX7Kqqwk8hzSTATWWJLIRcewc+7Dyd7VjSyW9MMjJcqVQ2MUHba/eKsFrvMFDQsRPXSThkvVZ9ozB+a3XcuHvaG3eKA2wjyYEPkIHv422q3WPLBmRr3l7nya0CSMAxMwZQXpZ1Sax9/cFSLPrAboPF1wFQjy0xstCUXm54ixDCRFPXw38Fgvg7OA/cBasuMs7Kxd3vW1nHiw3o+6U1LHK7QeJ8kdgm8baruFc4jLoaXzM0e8qufd3BnOOx1OH2IymMAxerWF3KMN2HoCYUQXWscXSMfCjPojIekkbXP9Z/LHkq+FKSWqS3ooGz2inlNRcfpz/M7NKKjPWoJHS5Oel2a4W4ZgkUoUEr3HXPMErQg4W6eNKspNjKbxNG7u94jh02+8r3gTj7Sr3SjVfmIPRDADh2DsQmAq2kgCEpJcRwXYUpVMJW1zMsMN2yOqz616I6eUW8oAz4QuwpTrtMw913U4dLBg5G6k4ihPkLkMPztj4dO1F9U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oPLmBOkTHtwA/p/kleNkvIdGGvFd0ef+MgISZLn45GYqeGaKjLUrCNYJ+llk?=
 =?us-ascii?Q?6xNB5nMER14s9yY29r03uPcB/FEzloPbvd5CMW6Wg9F4lm0JNmCA0jZlQV6+?=
 =?us-ascii?Q?e565wNbR4fhlMPPDuzR2DJTxqRyV1848AriqwxdMPSUJeUDqqaTyijRid9As?=
 =?us-ascii?Q?MYxDlSWNMbL1pH6tpzhImGxRV7mobwJCaniZl9Cuq2SreMtj3nkfQYHoyrGc?=
 =?us-ascii?Q?oBjtqYUyWD/W35Gjhw8fcJKRwxGyeGEIAX4d9HgxmxySMtBmtroJckiZsgrp?=
 =?us-ascii?Q?GVXpcfyC0otTTguQNGejIHtfkhPVL7furk+u61UOSOre0JlK5tyjYOKWT6Ym?=
 =?us-ascii?Q?e4hYI9R21HSOp+EadfMlrBArK6Sj14Y8QCsYkTf5bUhRzZr3wTPrEcHgF2Z1?=
 =?us-ascii?Q?Spn6PhIoj/bJKk3RKLkjK1kzyScHbFnummtgkiuw39sbYsgVZ+fD+azdszW9?=
 =?us-ascii?Q?9YyJJruQt2aMdc5cgaz33NoRHNsFdd62FU1yrjLmoshV1pd88wycZ51Cmw10?=
 =?us-ascii?Q?4xxcm77dzCK4Y4j1TEuL2FrKQof+mRI2R4HSahbsw2eccJbstCRm/57mt3Z2?=
 =?us-ascii?Q?mPNk2JBAktru2PXSVo+xJydsIHXBBrRc3Fu6AZpf1hSSXVm+tjBwNmhbKLPB?=
 =?us-ascii?Q?Ll30/KXuwSQM3syQvYaEt8m3PVNuFJzUG2eyzBU8oOjkGTeTwj8oOTYw3AYJ?=
 =?us-ascii?Q?/uPZAkT4o4/JUEgEqWnSLrvnh+YbgxrDV8X21yj8Bz0op93Wb2KVTcHYlJng?=
 =?us-ascii?Q?Du7uGm0GTRUlexnPkkkzeekPuv3ydhonrDaMF9v+rji4y93jRftC9ZzO6b7w?=
 =?us-ascii?Q?KgF7Y0TBDEcgmeqJpgV1naRdxcDA57lY++XK4HJjtJYbFmpC/8+rgZLUzZHV?=
 =?us-ascii?Q?tKEuI0TuIvTk1i6LA6Su9NkUXg2y4ijUAten6OxaA/NE80Q17dCcivpKyX/M?=
 =?us-ascii?Q?ERBs/XfjpvblIMnHG3NH/bCu9WjSbmhikUjgdAXJ4I+wOvPv8oyHiBgPanI1?=
 =?us-ascii?Q?0DYhAQQ0PIzP/PCrzmfN8EP9baHABgsv2ZcGrYCYwGuvRBc9J45sQWkPhayb?=
 =?us-ascii?Q?gY2Ik5gzOBxiSmBP1ymPWDIoHqfBQ0tppwMuRx8WxlLXPuHdCg638Fcu9jSp?=
 =?us-ascii?Q?TtvP6WHVJN3o5ndWSMj+WUpOYGZ3v4vDMK698LJMlCwwyjqP9X2ExkNnFl59?=
 =?us-ascii?Q?BndfuVP3y57KwC5Z+iE+LZfUWJsPFQWN1QK3nHEmEvzqUuzgPc+TQ05UVDPA?=
 =?us-ascii?Q?5HIwXSVB6XiGXsE5q+zeZ6QmAjdVxtJI2kBlAyL3l1Ffzn9IUC3aIsvaHoEX?=
 =?us-ascii?Q?bWPwjMfq15byJBMEaiMwZjzZ6MWEWE7/rHnbGHUkYE3lIGYphaDzOZIcuU9U?=
 =?us-ascii?Q?2Hv6hPkDwWcgvLj9EcJGYRBGnB6zLSvjtX7RopmnCgbckBIqNvbU2hbtPA+v?=
 =?us-ascii?Q?1ZxY22Ahh5oudTyzsCWluhs/E5RV1UiIREMVXnOszuBn78KdXKuGbaxQkE0h?=
 =?us-ascii?Q?pUISf75GZXjSQvI/wcf0+yeItv3Gx1jsboyqMroraQLI5gDe3v+svnBRh641?=
 =?us-ascii?Q?pJ+19zjnzZfo48DyUzf0sfeSuSePDi0K0ZKjleWisiw/Kkxn2vhh8PHVvWSg?=
 =?us-ascii?Q?EjdblPY/omP5Ghm6aORXCLolNPcDsy6dHAxS3fHsDtQ/zQ67tF0+LcIPg6Is?=
 =?us-ascii?Q?XRse8tWxmOUScJc5nJkV5nLaey5RpuY63E9gbJUSW5b8Cc3o6mUJEhUIUFdD?=
 =?us-ascii?Q?LJdPSHNlYsFQjZbaE/z/Yp/M/kT8hNY=3D?=
X-Exchange-RoutingPolicyChecked: SIggStegj7YLVXz3ceQxSjWNvXQ134fkg4FHJ+bTiKGaUEGFeRlfIFxLGR5X/CpICxlOHUKhvA4XRzzQ4/8ObajOX9oCK9lqDeXtEaGq50EatZibQJjb+aNs25n5hG7985Fzh/Xr8A/KDvR6synR/1v+sKCUnc6HuWDrdyLqZGOALLiQxYb4UsgXxX0EHdj3qjbED8/D+SQV4tskh/dF6huvW7YzNKFU9evt70k8A7TcxIiyup65ROoly4W7PyYBqbxbw0Kv1zdv3VC1pgu2QJQYCiPmcbGBGxBv7YIM/bQSCo6rgx/YVUwR0o3+HVLKus9muk9+EJhDFu7HDVjOYA==
X-MS-Exchange-CrossTenant-Network-Message-Id: a7c09443-8692-46a9-fdf7-08de99915f4c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2026 19:17:58.5886 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GoGZeceIYGdgPMS1zmzThCPdFnlAdsClaLbFMZWPlxH9tvlXLnwk6eOrt55JII5t6HcXEWnzVI3U7acELDKs4YDzvEccFJ7Tank/LN1E8mI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4522
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

On Mon, Apr 13, 2026 at 12:36:46PM -0300, Gustavo Sousa wrote:
> Matt Roper <matthew.d.roper@intel.com> writes:
> 
> > From Xe2 onward (i.e., all platforms officially supported by the Xe
> > driver), the GAMSTLB_CTRL register is located at offset 0x477C and
> > represented by the macro "GAMSTLB_CTRL" in code.  However the register
> > formerly resided at offset 0xCF4C on Xe1-era platforms, and we also have
> > macro XEHP_GAMSTLB_CTRL that represents this old offset in the
> > unofficial/developer-only Xe1 code.  When tuning for the register was
> > added for Xe3p_LPG, the old Xe1-era macro was accidentally used instead
> > of the proper macro for Xe2 and beyond, causing the tuning to not be
> > applied properly.  Use the proper definition so that the correct offset
> > is written to.
> >
> > Bspec: 59298
> > Fixes: 377c89bfaa5d ("drm/xe/xe3p_lpg: Set STLB bank hash mode to 4KB")
> > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_tuning.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
> > index ea48e2a60fcd..6fb8887d1482 100644
> > --- a/drivers/gpu/drm/xe/xe_tuning.c
> > +++ b/drivers/gpu/drm/xe/xe_tuning.c
> > @@ -97,7 +97,7 @@ static const struct xe_rtp_entry_sr gt_tunings[] = {
> >  	{ XE_RTP_NAME("Tuning: Set STLB Bank Hash Mode to 4KB"),
> >  	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3510, XE_RTP_END_VERSION_UNDEFINED),
> >  		       IS_INTEGRATED),
> > -	  XE_RTP_ACTIONS(FIELD_SET(XEHP_GAMSTLB_CTRL, BANK_HASH_MODE,
> > +	  XE_RTP_ACTIONS(FIELD_SET(GAMSTLB_CTRL, BANK_HASH_MODE,
> >  				   BANK_HASH_4KB_MODE))
> 
> Should we also consolidate the definitions in xe_gt_regs.h into a single
> section as well?

We've intentionally avoided doing that in Xe; when a register exists at
different locations on different IP versions, we still maintain each
definition at a properly offset-sorted location.  Making exceptions to
the sorting rules got too chaotic on i915 so we decided early on not to
allow that with Xe.


Matt

> 
> In any case,
> 
> Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
> 
> >  	},
> >  };
> >
> > -- 
> > 2.53.0

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation

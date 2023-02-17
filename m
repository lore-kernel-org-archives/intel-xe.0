Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EF9FC636D6
	for <intel-xe@archiver.kernel.org>; Fri, 17 Feb 2023 20:20:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D19DA10E2F7;
	Fri, 17 Feb 2023 20:20:55 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB1E410E2F7
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Feb 2023 20:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676665252; x=1708201252;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ROvI4+m0lEq3EQ19m1zuHnMwdl8a+6hD3O8fDLV+4Us=;
 b=BV5vs99lyekI+8QzfyBtJcFQI2/PdNJv0hLlFdxwwTNh9XjYDl47EpzC
 6tEsZ/l1PMkKsa+WR5bYWvcHyi7icMNLzYUhi+1B4GDn+79nUDJ6/1wlg
 CoNxLfAoS7OjHwXbvfpuzDJT+jZNiQ3VH37o84WNpzWtCkI0mLmjJCaQK
 CwsUsOccPsA7a+PWkeeL9qWXgyRFvnEysoofS9YsAFW5pA3Vo9LqOCblO
 UEJnteL9n7eXEcx/IVUi40ZpTFMVUjbMUb0YrqPgVA0Z05grAszgTojFM
 0AE1RIdVEjE2/eiRQ3J1wq/C+EcGE2mOmvaUKxsI07sqaWwkjp+73iqrL A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="334274980"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; d="scan'208";a="334274980"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2023 12:20:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="648193314"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; d="scan'208";a="648193314"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga006.jf.intel.com with ESMTP; 17 Feb 2023 12:20:51 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 17 Feb 2023 12:20:51 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 17 Feb 2023 12:20:50 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 17 Feb 2023 12:20:50 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.174)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 17 Feb 2023 12:20:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hhL9ql81loJyiDeaMUSYIa3qH2u0RhKgwlMW0LLwo1ujTYMpFnKXICX3YW5K+lYRH+85JZ4tGAWJH4to3aAb/qu2QTlHIAMQkDMzKcsR/qTU02Y62uv+P5A1sewNbkO7+/jkgzxYZEGhvq5i6BWaLUiNpN6rUGzlROtbngV9ll1X9sIdbyC+3ZqEbhNu2XOdXZlcvXP507E21OygKB79kcXz2rZwXcDUr4gWDk77feEqvkClRTEawXBFlTP5KWpydUXuYtkGdcZSUITKlpAU3v2Jx5ZZ4xdaPpMOFG23YscuA135XBUGr4d73eq+0u8aNXxw22K76iwGO8wWM337ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ty+H+LWK4Pd13bjKRiRRInxluaE6U7sitq7TdVtXEj0=;
 b=Wx+nBbuHFyTdtC2QmTBM88lSHlq0Y1CHx2hRQSMBafKLeK35ejH9TsjNvdZPtNCQGa2SwnADaVHFk06vfV7ZtI3/73jLoIzIrsqQMaJD79KEPseN78NyzzL3F2ochSLNUwydoL1t3r4y45qbS9lnIQN6D2JRsFRyNwDm8xrBUduo+eHjimR3bimpKiZM8mL8giqfKXzhd9tSaABU7b0U4SEhO5QKaoue/pT5dj4IaDJAiR9QQAgCnJlKNh0yJ56VDW68ufQKGJ4RCyPLwHO4nvNHgJmLtWwbq4SXWvacQ3NBEh21BZy6dD5erLjucK+yvtlV8BMGTc+vk3eLhnzV4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM4PR11MB5520.namprd11.prod.outlook.com (2603:10b6:5:39f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.13; Fri, 17 Feb
 2023 20:20:43 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158%9]) with mapi id 15.20.6086.024; Fri, 17 Feb 2023
 20:20:42 +0000
Date: Fri, 17 Feb 2023 15:20:38 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <Y+/hlh2LU0o8DMJs@intel.com>
References: <20230217005226.106499-1-lucas.demarchi@intel.com>
 <20230217005226.106499-6-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230217005226.106499-6-lucas.demarchi@intel.com>
X-ClientProxiedBy: BYAPR21CA0017.namprd21.prod.outlook.com
 (2603:10b6:a03:114::27) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DM4PR11MB5520:EE_
X-MS-Office365-Filtering-Correlation-Id: 71783919-3c87-42b5-b151-08db11247183
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WCaRnvsRdolpBl32oXHKOQNNxoCiBqQ2YvLKBdG48HJjXMj8syIX72St+Vpj4ZDD93H+zrUuraseNnvlVp62NDXu/glNCpoyHBxw0yjcDt2e+KHvdPljzk1ObdZ3MHVwEC2IODgR0448JmlWaTMJj4jo9l/xGhVn0Y9PFD3W9xMa7MgUX/orZkFP24qqSlM9JU/JlT33mlgGMc1w8D6texMT11x5PYU9QNBsEbx96S2qudU6vdlmgCA34IDjpCEnfARIZS0xpWy//HbXrQ9Vsv/SP7LcbzSp9R5XnHlNvVUFKn5wrxFtLm8CAncY4A/Dj+1pJj5bP+tmizoCuanCyyYAfPJUEBlZ2zFEwdCCOrVTP6+No9zkHYk6ws3JWgpsaiRk7aHyVeWQeuOJacExykqy/Ei97tEcfSx0mHuTp2HaBnX/WBOxrzkuu0LAVVARsxa+IL+kdotc8jx5qMI2AQ09RGdfy2Rr0+a/ZSdNwHAfw6Qfq4nKV7OgTJFrJXmEhgKKtQ4e4bRA1q96TdgIJ4QIRBLMYu0ay0gscXVZPTG7zH6n2r5p+jDZaBar1RstmY4YiSuXn53UHCTn+DUN82/r9+WtspaK2pYgIK2JwlrJAko41Sn9lpxdlY5ILUYI
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(136003)(376002)(396003)(346002)(366004)(39860400002)(451199018)(6862004)(66556008)(36756003)(82960400001)(86362001)(38100700002)(2906002)(5660300002)(30864003)(66946007)(8676002)(66476007)(8936002)(4326008)(44832011)(2616005)(6512007)(186003)(83380400001)(66574015)(6636002)(316002)(54906003)(37006003)(6506007)(6666004)(478600001)(6486002)(966005)(107886003)(41300700001)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?qiJlUjXzMD0dPi66XT09DtPNkDb5Tkumo6eSKjAR5bas1NZ8ET5wXZWbBi?=
 =?iso-8859-1?Q?FQdqC1SpwqXErGZgrnFu8HSTaEIpj7GFUto0BhgC5+xffz5lYR6FxL70Bh?=
 =?iso-8859-1?Q?leFguGu2C1fE4Sxrs75hltjdgPAC9dymngXJps5NszQuymW99CoVaO/Dki?=
 =?iso-8859-1?Q?r5GTEU1jjgpolEdmahvKfa48GYEmKefOA3rmUeu/V9YMTOiradW383ENIW?=
 =?iso-8859-1?Q?m3L9Z0zCd2F/B5c5tLPEg/xw9q+p7XCv6H0M/SIr9fCbFGQwWjoBowGf04?=
 =?iso-8859-1?Q?vKTmnGKBsidb3/ex2MIF05aWz+CkYQCHt/iVQqflrlWWDyG3JbcPoCK+0M?=
 =?iso-8859-1?Q?+fB1RSVv6iHlaYfECT4OABNSp5vLDg7BA1SNnVIGXQD3wzCrEloVZ8hsTf?=
 =?iso-8859-1?Q?6cZ64sJjs7FvBndsr/EatNvg7qy27dQptdw77QcOY7Mg67TbuFe4UwBrfj?=
 =?iso-8859-1?Q?51DTOgo91EOvIBk+TWHRYcO9cbQzqEhMlRhcOUzZNJEGYwt2XPp4Jz3Y6s?=
 =?iso-8859-1?Q?I2/VrWHKh6lgm94WYt54UNBC6KQ+ZFGo0AgWx5Vsj5PKP23Y+ZvtHiukj0?=
 =?iso-8859-1?Q?FBzhjV0TGCCsmuCHIoE6voNUnBF/XG7hy6VEZkMEZQte1e/qutZYFJycMM?=
 =?iso-8859-1?Q?g4fzZ5jjHnUpXqT3jKRDgrYBQvpexmatf59d9nejHb3EVlH7jVm7Xjockb?=
 =?iso-8859-1?Q?7XyNpyLPOe1yrAe5CJLmW5ldt1wkxCxbNTwFqGr1RChjQz9jNO9/MqJbrs?=
 =?iso-8859-1?Q?BFew7R25LSv6FRQx8gdP3vg4L2kVlb8mk8ozKqtRXccJ+HhHTqus+K+GbE?=
 =?iso-8859-1?Q?P2OxN3SqTHP881S3uDh0DOBWFikEz1DJezX8p085YVCqFIiQRBWsNpl+YQ?=
 =?iso-8859-1?Q?gtVQSk44P+mG7ovnix0UonRQ6x20gh3E1GPez6OQrYLhki/0z797DXNNEB?=
 =?iso-8859-1?Q?q716kCTqo8Eo4vGO0t+xyA6/4eGxv1C2JFqE1UFQohpSDeW33gWFhgfhR6?=
 =?iso-8859-1?Q?ONgR0beutd/PVkLuJurq7PlGi+VS2cwcmDnJVdvpVgXkBzliTuob+MGbYC?=
 =?iso-8859-1?Q?sWa1ny1NGWCWDXN9fLANmvQRsQRwuy1e4JoWWR2p7ZJaXsWtlYOQctQwrY?=
 =?iso-8859-1?Q?rJ8/3YzXmXjcWYd4ZOnRT0Po186NmjsTjjSY3lfdEiQLtbXxw+KUSo4lI8?=
 =?iso-8859-1?Q?9srGDZ1mlTk7RJYObj/48jw9LY/cBIsrAOJeMEuoW8A+Svy4ZRvcbLNIG7?=
 =?iso-8859-1?Q?smz9DgbL6JrOCbqLXYQa+7yHLVEZN+GVF1z6Ct+C5vekmjbNkacAm8Uz/F?=
 =?iso-8859-1?Q?eeGIjY4L9lfwp/E/m6egf93R+0uoTO3Rzv+C9QwZuE5K+Z4wKOAscGdcd7?=
 =?iso-8859-1?Q?vHyJnVrWnwdsItzWZclsudvY637BIMD+EI2LHpeRDl1DeaE/NblRTNOUBq?=
 =?iso-8859-1?Q?nWjGWuqjHlHqhfl4WPb2LIBS0sYApGalBOjXlsQoDoqi/r2fEcsiK8QI0K?=
 =?iso-8859-1?Q?d5fee3sQFRP2dRUY5kQ6BMTUsiRF9vhzgnj6YcYu+3Hxkm/UJwgqNv6JGF?=
 =?iso-8859-1?Q?pWEZNthpP4EL84LjT0YGgUM84wNcoMmTEz2UY4gntS71vhIgB9UP2AVFPk?=
 =?iso-8859-1?Q?bolKtykmAiFQvDjHWpyPL4viDloWCfz1VkOrHMEFV7Kkk1swYGzlHu5A?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 71783919-3c87-42b5-b151-08db11247183
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2023 20:20:42.8226 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jq5UitQKFt54deo+ZtWmx+9cVVheBl0atfo/bLqT4hDYhrLO7kjQ2L0r6gJgfPocNLFYejQEB1hvZBE7LK6SUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5520
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 05/11] drm/xe: Remove dependency on
 intel_gt_regs.h
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
Cc: intel-xe@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Feb 16, 2023 at 04:52:20PM -0800, Lucas De Marchi wrote:
> Create regs/xe_gt_regs.h file with all the registers and bit
> definitions used by the xe driver. Eventually the registers may be
> defined in a different way and since xe doesn't supported below gen12,
> the number of registers touched is much smaller, so create a new header.
> 
> The definitions themselves are direct copy from the
> gt/intel_gt_regs.h file, just sorting the registers by address.
> Cleaning those up and adhering to a common coding style is left for
> later.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/i915/i915_reg_defs.h  |   2 +
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h  | 287 ++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_execlist.c      |   2 +-
>  drivers/gpu/drm/xe/xe_force_wake.c    |   3 +-
>  drivers/gpu/drm/xe/xe_ggtt.c          |   2 +-
>  drivers/gpu/drm/xe/xe_gt.c            |   3 +-
>  drivers/gpu/drm/xe/xe_gt_clock.c      |   2 +-
>  drivers/gpu/drm/xe/xe_gt_mcr.c        |   3 +-
>  drivers/gpu/drm/xe/xe_guc.c           |   2 +-
>  drivers/gpu/drm/xe/xe_guc_ads.c       |   4 +-
>  drivers/gpu/drm/xe/xe_guc_pc.c        |   2 +-
>  drivers/gpu/drm/xe/xe_hw_engine.c     |   2 +-
>  drivers/gpu/drm/xe/xe_irq.c           |   2 +-
>  drivers/gpu/drm/xe/xe_lrc.c           |   2 +-
>  drivers/gpu/drm/xe/xe_mmio.c          |   2 +-
>  drivers/gpu/drm/xe/xe_mocs.c          |   3 +-
>  drivers/gpu/drm/xe/xe_reg_sr.c        |   3 +-
>  drivers/gpu/drm/xe/xe_reg_whitelist.c |   3 +-
>  drivers/gpu/drm/xe/xe_ring_ops.c      |   2 +-
>  drivers/gpu/drm/xe/xe_tuning.c        |   3 +-
>  drivers/gpu/drm/xe/xe_wa.c            |   2 +-
>  21 files changed, 308 insertions(+), 28 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/regs/xe_gt_regs.h
> 
> diff --git a/drivers/gpu/drm/i915/i915_reg_defs.h b/drivers/gpu/drm/i915/i915_reg_defs.h
> index b5e06b6a9478..a6080c983a77 100644
> --- a/drivers/gpu/drm/i915/i915_reg_defs.h
> +++ b/drivers/gpu/drm/i915/i915_reg_defs.h
> @@ -136,6 +136,8 @@ typedef struct {
>  	u32 reg;
>  } i915_mcr_reg_t;
>  
> +#define MCR_REG(offset)	((const i915_mcr_reg_t){ .reg = (offset) })
> +
>  #define INVALID_MMIO_REG _MMIO(0)
>  
>  /*
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> new file mode 100644
> index 000000000000..da40133252fb
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -0,0 +1,287 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#ifndef _XE_GT_REGS_H_
> +#define _XE_GT_REGS_H_
> +
> +#include "i915_reg_defs.h"
> +
> +/* RPM unit config (Gen8+) */
> +#define RPM_CONFIG0				_MMIO(0xd00)
> +#define   GEN11_RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_SHIFT	3

https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/215
https://lore.kernel.org/all/Y9hw0sSC58B32yPg@mdroper-desk1.amr.corp.intel.com/

Matt has asked us to get rid of the GEN stuff...
I believe this is a great opportunity, although I believe it is not
a blocker and could be done later.

> +#define   GEN11_RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_MASK	(0x7 << GEN11_RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_SHIFT)
> +#define   GEN11_RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_24_MHZ	0
> +#define   GEN11_RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_19_2_MHZ	1
> +#define   GEN11_RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_38_4_MHZ	2
> +#define   GEN11_RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_25_MHZ	3
> +#define   GEN10_RPM_CONFIG0_CTC_SHIFT_PARAMETER_SHIFT	1
> +#define   GEN10_RPM_CONFIG0_CTC_SHIFT_PARAMETER_MASK	(0x3 << GEN10_RPM_CONFIG0_CTC_SHIFT_PARAMETER_SHIFT)
> +
> +#define FORCEWAKE_ACK_MEDIA_VDBOX_GEN11(n)	_MMIO(0xd50 + (n) * 4)
> +#define FORCEWAKE_ACK_MEDIA_VEBOX_GEN11(n)	_MMIO(0xd70 + (n) * 4)
> +#define FORCEWAKE_ACK_RENDER_GEN9		_MMIO(0xd84)
> +
> +#define GEN9_LNCFCMOCS(i)			_MMIO(0xb020 + (i) * 4)	/* L3 Cache Control */
> +#define LNCFCMOCS_REG_COUNT			32
> +
> +#define MCFG_MCR_SELECTOR			_MMIO(0xfd0)
> +#define MTL_MCR_SELECTOR			_MMIO(0xfd4)
> +#define SF_MCR_SELECTOR				_MMIO(0xfd8)
> +#define GEN8_MCR_SELECTOR			_MMIO(0xfdc)
> +#define GAM_MCR_SELECTOR			_MMIO(0xfe0)
> +#define   GEN11_MCR_MULTICAST			REG_BIT(31)
> +#define   GEN11_MCR_SLICE(slice)		(((slice) & 0xf) << 27)
> +#define   GEN11_MCR_SLICE_MASK			GEN11_MCR_SLICE(0xf)
> +#define   GEN11_MCR_SUBSLICE(subslice)		(((subslice) & 0x7) << 24)
> +#define   GEN11_MCR_SUBSLICE_MASK		GEN11_MCR_SUBSLICE(0x7)
> +#define   MTL_MCR_GROUPID			REG_GENMASK(11, 8)
> +#define   MTL_MCR_INSTANCEID			REG_GENMASK(3, 0)
> +
> +#define GEN7_FF_SLICE_CS_CHICKEN1		_MMIO(0x20e0)
> +#define   GEN9_FFSC_PERCTX_PREEMPT_CTRL		(1 << 14)
> +
> +#define GEN9_CS_DEBUG_MODE1			_MMIO(0x20ec)
> +#define   FF_DOP_CLOCK_GATE_DISABLE		REG_BIT(1)
> +
> +#define PS_INVOCATION_COUNT			_MMIO(0x2348)
> +
> +#define GEN8_CS_CHICKEN1			_MMIO(0x2580)
> +#define   GEN9_PREEMPT_3D_OBJECT_LEVEL		(1 << 0)
> +#define   GEN9_PREEMPT_GPGPU_LEVEL(hi, lo)	(((hi) << 2) | ((lo) << 1))
> +#define   GEN9_PREEMPT_GPGPU_MID_THREAD_LEVEL	GEN9_PREEMPT_GPGPU_LEVEL(0, 0)
> +#define   GEN9_PREEMPT_GPGPU_THREAD_GROUP_LEVEL	GEN9_PREEMPT_GPGPU_LEVEL(0, 1)
> +#define   GEN9_PREEMPT_GPGPU_COMMAND_LEVEL	GEN9_PREEMPT_GPGPU_LEVEL(1, 0)
> +#define   GEN9_PREEMPT_GPGPU_LEVEL_MASK		GEN9_PREEMPT_GPGPU_LEVEL(1, 1)
> +
> +#define GEN12_GLOBAL_MOCS(i)			_MMIO(0x4000 + (i) * 4) /* Global MOCS regs */
> +#define GEN12_GFX_CCS_AUX_NV			_MMIO(0x4208)
> +
> +#define GEN12_VD0_AUX_NV			_MMIO(0x4218)
> +#define GEN12_VE0_AUX_NV			_MMIO(0x4238)
> +
> +#define GEN12_VE1_AUX_NV			_MMIO(0x42b8)
> +#define   AUX_INV				REG_BIT(0)
> +
> +#define GEN12_PAT_INDEX(index)			_MMIO(0x4800 + (index) * 4)
> +#define XEHP_TILE0_ADDR_RANGE			MCR_REG(0x4900)
> +#define XEHP_FLAT_CCS_BASE_ADDR			MCR_REG(0x4910)
> +
> +#define GEN12_FF_MODE2				_MMIO(0x6604)
> +#define XEHP_FF_MODE2				MCR_REG(0x6604)
> +#define   FF_MODE2_GS_TIMER_MASK		REG_GENMASK(31, 24)
> +#define   FF_MODE2_GS_TIMER_224			REG_FIELD_PREP(FF_MODE2_GS_TIMER_MASK, 224)
> +#define   FF_MODE2_TDS_TIMER_MASK		REG_GENMASK(23, 16)
> +#define   FF_MODE2_TDS_TIMER_128		REG_FIELD_PREP(FF_MODE2_TDS_TIMER_MASK, 4)
> +
> +#define HIZ_CHICKEN				_MMIO(0x7018)
> +#define   DG1_HZ_READ_SUPPRESSION_OPTIMIZATION_DISABLE	REG_BIT(14)
> +
> +/* GEN7 chicken */
> +#define GEN7_COMMON_SLICE_CHICKEN1		_MMIO(0x7010)
> +
> +#define GEN11_COMMON_SLICE_CHICKEN3		_MMIO(0x7304)
> +#define XEHP_COMMON_SLICE_CHICKEN3		MCR_REG(0x7304)
> +#define   DG1_FLOAT_POINT_BLEND_OPT_STRICT_MODE_EN	REG_BIT(12)
> +#define   XEHP_DUAL_SIMD8_SEQ_MERGE_DISABLE	REG_BIT(12)
> +#define   GEN11_BLEND_EMB_FIX_DISABLE_IN_RCC	REG_BIT(11)
> +#define   GEN12_DISABLE_CPS_AWARE_COLOR_PIPE	REG_BIT(9)
> +
> +#define XEHP_SQCM				MCR_REG(0x8724)
> +#define   EN_32B_ACCESS				REG_BIT(30)
> +
> +#define	GEN10_MIRROR_FUSE3			_MMIO(0x9118)
> +#define   GEN10_L3BANK_PAIR_COUNT		4
> +#define   GEN10_L3BANK_MASK			0x0F
> +/* on Xe_HP the same fuses indicates mslices instead of L3 banks */
> +#define   GEN12_MAX_MSLICES			4
> +#define   GEN12_MEML3_EN_MASK			0x0F
> +
> +/* Fuse readout registers for GT */
> +#define XEHP_FUSE4				_MMIO(0x9114)
> +#define   GT_L3_EXC_MASK			REG_GENMASK(6, 4)
> +
> +#define GEN11_GT_VEBOX_VDBOX_DISABLE		_MMIO(0x9140)
> +#define   GEN11_GT_VDBOX_DISABLE_MASK		0xff
> +#define   GEN11_GT_VEBOX_DISABLE_SHIFT		16
> +#define   GEN11_GT_VEBOX_DISABLE_MASK		(0x0f << GEN11_GT_VEBOX_DISABLE_SHIFT)
> +
> +#define GEN6_GDRST				_MMIO(0x941c)
> +#define   GEN11_GRDOM_GUC			REG_BIT(3)
> +#define   GEN6_GRDOM_FULL			(1 << 0)
> +#define   GEN11_GRDOM_FULL			GEN6_GRDOM_FULL
> +
> +#define GEN7_MISCCPCTL				_MMIO(0x9424)
> +#define   GEN7_DOP_CLOCK_GATE_ENABLE		(1 << 0)
> +#define   GEN12_DOP_CLOCK_GATE_RENDER_ENABLE	REG_BIT(1)
> +
> +#define UNSLCGCTL9430				_MMIO(0x9430)
> +#define   MSQDUNIT_CLKGATE_DIS			REG_BIT(3)
> +
> +#define UNSLICE_UNIT_LEVEL_CLKGATE		_MMIO(0x9434)
> +#define   VFUNIT_CLKGATE_DIS			REG_BIT(20)
> +#define   TSGUNIT_CLKGATE_DIS			REG_BIT(17) /* XEHPSDV */
> +#define   CG3DDISCFEG_CLKGATE_DIS		REG_BIT(17) /* DG2 */
> +#define   GAMEDIA_CLKGATE_DIS			REG_BIT(11)
> +#define   HSUNIT_CLKGATE_DIS			REG_BIT(8)
> +#define   VSUNIT_CLKGATE_DIS			REG_BIT(3)
> +
> +#define UNSLCGCTL9440				_MMIO(0x9440)
> +#define   GAMTLBOACS_CLKGATE_DIS		REG_BIT(28)
> +#define   GAMTLBVDBOX5_CLKGATE_DIS		REG_BIT(27)
> +#define   GAMTLBVDBOX6_CLKGATE_DIS		REG_BIT(26)
> +#define   GAMTLBVDBOX3_CLKGATE_DIS		REG_BIT(24)
> +#define   GAMTLBVDBOX4_CLKGATE_DIS		REG_BIT(23)
> +#define   GAMTLBVDBOX7_CLKGATE_DIS		REG_BIT(22)
> +#define   GAMTLBVDBOX2_CLKGATE_DIS		REG_BIT(21)
> +#define   GAMTLBVDBOX0_CLKGATE_DIS		REG_BIT(17)
> +#define   GAMTLBKCR_CLKGATE_DIS			REG_BIT(16)
> +#define   GAMTLBGUC_CLKGATE_DIS			REG_BIT(15)
> +#define   GAMTLBBLT_CLKGATE_DIS			REG_BIT(14)
> +#define   GAMTLBVDBOX1_CLKGATE_DIS		REG_BIT(6)
> +
> +#define UNSLCGCTL9444				_MMIO(0x9444)
> +#define   GAMTLBGFXA0_CLKGATE_DIS		REG_BIT(30)
> +#define   GAMTLBGFXA1_CLKGATE_DIS		REG_BIT(29)
> +#define   GAMTLBCOMPA0_CLKGATE_DIS		REG_BIT(28)
> +#define   GAMTLBCOMPA1_CLKGATE_DIS		REG_BIT(27)
> +#define   GAMTLBCOMPB0_CLKGATE_DIS		REG_BIT(26)
> +#define   GAMTLBCOMPB1_CLKGATE_DIS		REG_BIT(25)
> +#define   GAMTLBCOMPC0_CLKGATE_DIS		REG_BIT(24)
> +#define   GAMTLBCOMPC1_CLKGATE_DIS		REG_BIT(23)
> +#define   GAMTLBCOMPD0_CLKGATE_DIS		REG_BIT(22)
> +#define   GAMTLBCOMPD1_CLKGATE_DIS		REG_BIT(21)
> +#define   GAMTLBMERT_CLKGATE_DIS		REG_BIT(20)
> +#define   GAMTLBVEBOX3_CLKGATE_DIS		REG_BIT(19)
> +#define   GAMTLBVEBOX2_CLKGATE_DIS		REG_BIT(18)
> +#define   GAMTLBVEBOX1_CLKGATE_DIS		REG_BIT(17)
> +#define   GAMTLBVEBOX0_CLKGATE_DIS		REG_BIT(16)
> +#define   LTCDD_CLKGATE_DIS			REG_BIT(10)
> +
> +#define GEN11_SLICE_UNIT_LEVEL_CLKGATE		_MMIO(0x94d4)
> +#define XEHP_SLICE_UNIT_LEVEL_CLKGATE		MCR_REG(0x94d4)
> +#define   SARBUNIT_CLKGATE_DIS			(1 << 5)
> +#define   RCCUNIT_CLKGATE_DIS			(1 << 7)
> +#define   MSCUNIT_CLKGATE_DIS			(1 << 10)
> +#define   NODEDSS_CLKGATE_DIS			REG_BIT(12)
> +#define   L3_CLKGATE_DIS			REG_BIT(16)
> +#define   L3_CR2X_CLKGATE_DIS			REG_BIT(17)
> +
> +#define UNSLICE_UNIT_LEVEL_CLKGATE2		_MMIO(0x94e4)
> +#define   VSUNIT_CLKGATE_DIS_TGL		REG_BIT(19)
> +#define   PSDUNIT_CLKGATE_DIS			REG_BIT(5)
> +
> +#define GEN11_SUBSLICE_UNIT_LEVEL_CLKGATE	MCR_REG(0x9524)
> +#define   DSS_ROUTER_CLKGATE_DIS		REG_BIT(28)
> +#define   GWUNIT_CLKGATE_DIS			REG_BIT(16)
> +
> +#define SUBSLICE_UNIT_LEVEL_CLKGATE2		MCR_REG(0x9528)
> +#define   CPSSUNIT_CLKGATE_DIS			REG_BIT(9)
> +
> +#define SSMCGCTL9530				MCR_REG(0x9530)
> +#define   RTFUNIT_CLKGATE_DIS			REG_BIT(18)
> +
> +#define GEN10_DFR_RATIO_EN_AND_CHICKEN		MCR_REG(0x9550)
> +#define   DFR_DISABLE				(1 << 9)
> +
> +#define GEN6_RPNSWREQ				_MMIO(0xa008)
> +#define GEN6_RC_CONTROL				_MMIO(0xa090)
> +#define GEN6_RC_STATE				_MMIO(0xa094)
> +
> +#define GEN6_PMINTRMSK				_MMIO(0xa168)
> +#define   GEN8_PMINTR_DISABLE_REDIRECT_TO_GUC	(1 << 31)
> +#define   ARAT_EXPIRED_INTRMSK			(1 << 9)
> +
> +#define FORCEWAKE_GT_GEN9			_MMIO(0xa188)
> +
> +#define GEN9_PG_ENABLE				_MMIO(0xa210)
> +
> +/* GPM unit config (Gen9+) */
> +#define CTC_MODE				_MMIO(0xa26c)
> +#define   CTC_SOURCE_PARAMETER_MASK		1
> +#define   CTC_SOURCE_CRYSTAL_CLOCK		0
> +#define   CTC_SOURCE_DIVIDE_LOGIC		1
> +#define   CTC_SHIFT_PARAMETER_SHIFT		1
> +#define   CTC_SHIFT_PARAMETER_MASK		(0x3 << CTC_SHIFT_PARAMETER_SHIFT)
> +
> +#define FORCEWAKE_RENDER_GEN9			_MMIO(0xa278)
> +#define FORCEWAKE_MEDIA_VDBOX_GEN11(n)		_MMIO(0xa540 + (n) * 4)
> +#define FORCEWAKE_MEDIA_VEBOX_GEN11(n)		_MMIO(0xa560 + (n) * 4)
> +
> +#define GEN10_SAMPLER_MODE			MCR_REG(0xe18c)
> +#define   ENABLE_SMALLPL			REG_BIT(15)
> +#define   SC_DISABLE_POWER_OPTIMIZATION_EBB	REG_BIT(9)
> +#define   GEN11_SAMPLER_ENABLE_HEADLESS_MSG	REG_BIT(5)
> +
> +#define GEN9_ROW_CHICKEN4			MCR_REG(0xe48c)
> +#define   GEN12_DISABLE_GRF_CLEAR		REG_BIT(13)
> +#define   XEHP_DIS_BBL_SYSPIPE			REG_BIT(11)
> +#define   GEN12_DISABLE_TDL_PUSH		REG_BIT(9)
> +#define   GEN11_DIS_PICK_2ND_EU			REG_BIT(7)
> +#define   GEN12_DISABLE_HDR_PAST_PAYLOAD_HOLD_FIX	REG_BIT(4)
> +#define   THREAD_EX_ARB_MODE			REG_GENMASK(3, 2)
> +#define   THREAD_EX_ARB_MODE_RR_AFTER_DEP	REG_FIELD_PREP(THREAD_EX_ARB_MODE, 0x2)
> +
> +#define GEN7_ROW_CHICKEN2			_MMIO(0xe4f4)
> +#define   GEN12_DISABLE_READ_SUPPRESSION	REG_BIT(15)
> +#define   GEN12_DISABLE_EARLY_READ		REG_BIT(14)
> +#define   GEN12_ENABLE_LARGE_GRF_MODE		REG_BIT(12)
> +#define   GEN12_PUSH_CONST_DEREF_HOLD_DIS	REG_BIT(8)
> +#define   GEN12_DISABLE_DOP_GATING              REG_BIT(0)
> +
> +#define SARB_CHICKEN1				MCR_REG(0xe90c)
> +#define   COMP_CKN_IN				REG_GENMASK(30, 29)
> +
> +#define GEN12_RCU_MODE				_MMIO(0x14800)
> +#define   GEN12_RCU_MODE_CCS_ENABLE		REG_BIT(0)
> +
> +#define FORCEWAKE_ACK_GT_GEN9			_MMIO(0x130044)
> +#define   FORCEWAKE_KERNEL			BIT(0)
> +#define   FORCEWAKE_USER			BIT(1)
> +#define   FORCEWAKE_KERNEL_FALLBACK		BIT(15)
> +
> +#define GEN6_GT_CORE_STATUS			_MMIO(0x138060)
> +#define   GEN6_RC0				0
> +#define   GEN6_RC6				3
> +
> +#define GEN6_GT_GFX_RC6_LOCKED			_MMIO(0x138104)
> +#define GEN6_GT_GFX_RC6				_MMIO(0x138108)
> +
> +#define GFX_FLSH_CNTL_GEN6			_MMIO(0x101008)
> +#define   GFX_FLSH_CNTL_EN			(1 << 0)
> +
> +#define GEN11_GT_INTR_DW(x)			_MMIO(0x190018 + ((x) * 4))
> +
> +#define GEN11_GUC_SG_INTR_ENABLE		_MMIO(0x190038)
> +#define   ENGINE1_MASK				REG_GENMASK(31, 16)
> +#define   ENGINE0_MASK				REG_GENMASK(15, 0)
> +
> +#define GEN11_GPM_WGBOXPERF_INTR_ENABLE		_MMIO(0x19003c)
> +
> +#define GEN11_INTR_IDENTITY_REG(x)		_MMIO(0x190060 + ((x) * 4))
> +#define   GEN11_INTR_DATA_VALID			(1 << 31)
> +#define   GEN11_INTR_ENGINE_INSTANCE(x)		(((x) & GENMASK(25, 20)) >> 20)
> +#define   GEN11_INTR_ENGINE_CLASS(x)		(((x) & GENMASK(18, 16)) >> 16)
> +#define   GEN11_INTR_ENGINE_INTR(x)		((x) & 0xffff)
> +#define   OTHER_GUC_INSTANCE			0
> +
> +#define GEN11_RENDER_COPY_INTR_ENABLE		_MMIO(0x190030)
> +#define GEN11_VCS_VECS_INTR_ENABLE		_MMIO(0x190034)
> +#define GEN12_CCS_RSVD_INTR_ENABLE		_MMIO(0x190048)
> +#define GEN11_IIR_REG_SELECTOR(x)		_MMIO(0x190070 + ((x) * 4))
> +#define GEN11_RCS0_RSVD_INTR_MASK		_MMIO(0x190090)
> +#define GEN11_BCS_RSVD_INTR_MASK		_MMIO(0x1900a0)
> +#define GEN11_VCS0_VCS1_INTR_MASK		_MMIO(0x1900a8)
> +#define GEN11_VCS2_VCS3_INTR_MASK		_MMIO(0x1900ac)
> +#define GEN11_VECS0_VECS1_INTR_MASK		_MMIO(0x1900d0)
> +#define GEN11_GUC_SG_INTR_MASK			_MMIO(0x1900e8)
> +#define GEN11_GPM_WGBOXPERF_INTR_MASK		_MMIO(0x1900ec)
> +#define GEN12_CCS0_CCS1_INTR_MASK		_MMIO(0x190100)
> +#define GEN12_CCS2_CCS3_INTR_MASK		_MMIO(0x190104)
> +#define XEHPC_BCS1_BCS2_INTR_MASK		_MMIO(0x190110)
> +#define XEHPC_BCS3_BCS4_INTR_MASK		_MMIO(0x190114)
> +#define XEHPC_BCS5_BCS6_INTR_MASK		_MMIO(0x190118)
> +#define XEHPC_BCS7_BCS8_INTR_MASK		_MMIO(0x19011c)
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
> index af2fcf1c32f4..b426f8000070 100644
> --- a/drivers/gpu/drm/xe/xe_execlist.c
> +++ b/drivers/gpu/drm/xe/xe_execlist.c
> @@ -7,6 +7,7 @@
>  #include <drm/drm_managed.h>
>  
>  #include "regs/xe_engine_regs.h"
> +#include "regs/xe_gt_regs.h"
>  #include "xe_bo.h"
>  #include "xe_device.h"
>  #include "xe_engine.h"
> @@ -20,7 +21,6 @@
>  #include "xe_sched_job.h"
>  
>  #include "gt/intel_gpu_commands.h"
> -#include "gt/intel_gt_regs.h"
>  #include "gt/intel_lrc_reg.h"
>  #include "i915_reg.h"
>  
> diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
> index 188197c3a8fe..e1346d18b580 100644
> --- a/drivers/gpu/drm/xe/xe_force_wake.c
> +++ b/drivers/gpu/drm/xe/xe_force_wake.c
> @@ -6,11 +6,10 @@
>  
>  #include <drm/drm_util.h>
>  
> +#include "regs/xe_gt_regs.h"
>  #include "xe_gt.h"
>  #include "xe_mmio.h"
>  
> -#include "gt/intel_gt_regs.h"
> -
>  #define XE_FORCE_WAKE_ACK_TIMEOUT_MS	50
>  
>  static struct xe_gt *
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 53a1edaee02d..2c9b2175c5bb 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -9,6 +9,7 @@
>  #include <drm/drm_managed.h>
>  #include <drm/i915_drm.h>
>  
> +#include "regs/xe_gt_regs.h"
>  #include "xe_bo.h"
>  #include "xe_device.h"
>  #include "xe_gt.h"
> @@ -17,7 +18,6 @@
>  #include "xe_mmio.h"
>  #include "xe_wopcm.h"
>  
> -#include "gt/intel_gt_regs.h"
>  #include "i915_reg.h"
>  
>  /* FIXME: Common file, preferably auto-gen */
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 5c7c2757bb49..c195b4b9f9b8 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -8,6 +8,7 @@
>  
>  #include <drm/drm_managed.h>
>  
> +#include "regs/xe_gt_regs.h"
>  #include "xe_bb.h"
>  #include "xe_bo.h"
>  #include "xe_device.h"
> @@ -40,8 +41,6 @@
>  #include "xe_wa.h"
>  #include "xe_wopcm.h"
>  
> -#include "gt/intel_gt_regs.h"
> -
>  struct xe_gt *xe_find_full_gt(struct xe_gt *gt)
>  {
>  	struct xe_gt *search;
> diff --git a/drivers/gpu/drm/xe/xe_gt_clock.c b/drivers/gpu/drm/xe/xe_gt_clock.c
> index e50117103e1e..e9aa7c5452af 100644
> --- a/drivers/gpu/drm/xe/xe_gt_clock.c
> +++ b/drivers/gpu/drm/xe/xe_gt_clock.c
> @@ -4,12 +4,12 @@
>   */
>  #include "xe_gt_clock.h"
>  
> +#include "regs/xe_gt_regs.h"
>  #include "xe_device.h"
>  #include "xe_gt.h"
>  #include "xe_macros.h"
>  #include "xe_mmio.h"
>  
> -#include "gt/intel_gt_regs.h"
>  #include "i915_reg.h"
>  
>  static u32 read_reference_ts_freq(struct xe_gt *gt)
> diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
> index 43910e48bdc9..c4ede7d6d97c 100644
> --- a/drivers/gpu/drm/xe/xe_gt_mcr.c
> +++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
> @@ -4,13 +4,12 @@
>   */
>  #include "xe_gt_mcr.h"
>  
> +#include "regs/xe_gt_regs.h"
>  #include "xe_gt.h"
>  #include "xe_gt_topology.h"
>  #include "xe_gt_types.h"
>  #include "xe_mmio.h"
>  
> -#include "gt/intel_gt_regs.h"
> -
>  /**
>   * DOC: GT Multicast/Replicated (MCR) Register Support
>   *
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 88cc912fa7eb..a2a124a7fc0b 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -4,6 +4,7 @@
>   */
>  #include "xe_guc.h"
>  
> +#include "regs/xe_gt_regs.h"
>  #include "xe_bo.h"
>  #include "xe_device.h"
>  #include "xe_force_wake.h"
> @@ -20,7 +21,6 @@
>  #include "xe_uc_fw.h"
>  #include "xe_wopcm.h"
>  
> -#include "gt/intel_gt_regs.h"
>  #include "i915_reg_defs.h"
>  
>  /* TODO: move to common file */
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> index bde094388a34..3cf04594f12f 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -9,6 +9,7 @@
>  #include <drm/drm_managed.h>
>  
>  #include "regs/xe_engine_regs.h"
> +#include "regs/xe_gt_regs.h"
>  #include "xe_bo.h"
>  #include "xe_gt.h"
>  #include "xe_guc.h"
> @@ -19,9 +20,6 @@
>  #include "xe_mmio.h"
>  #include "xe_platform_types.h"
>  
> -#include "gt/intel_gt_regs.h"
> -
> -
>  /* Slack of a few additional entries per engine */
>  #define ADS_REGSET_EXTRA_MAX	8
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index 1d4ac0c26d3c..f7aaf4826f00 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -8,6 +8,7 @@
>  
>  #include <drm/drm_managed.h>
>  
> +#include "regs/xe_gt_regs.h"
>  #include "xe_bo.h"
>  #include "xe_device.h"
>  #include "xe_gt.h"
> @@ -30,7 +31,6 @@
>  #define GEN10_FREQ_INFO_REC	_MMIO(MCHBAR_MIRROR_BASE_SNB + 0x5ef0)
>  #define   RPE_MASK		REG_GENMASK(15, 8)
>  
> -#include "gt/intel_gt_regs.h"
>  /* For GEN6_RPNSWREQ.reg to be merged when the definition moves to Xe */
>  #define   REQ_RATIO_MASK	REG_GENMASK(31, 23)
>  
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index ce5d6641499f..caae4f897644 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -7,6 +7,7 @@
>  #include <drm/drm_managed.h>
>  
>  #include "regs/xe_engine_regs.h"
> +#include "regs/xe_gt_regs.h"
>  #include "xe_bo.h"
>  #include "xe_device.h"
>  #include "xe_execlist.h"
> @@ -21,7 +22,6 @@
>  #include "xe_sched_job.h"
>  #include "xe_wa.h"
>  
> -#include "gt/intel_gt_regs.h"
>  #include "i915_reg.h"
>  
>  #define MAX_MMIO_BASES 3
> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> index f30fd2b14c22..d7756c14b4e2 100644
> --- a/drivers/gpu/drm/xe/xe_irq.c
> +++ b/drivers/gpu/drm/xe/xe_irq.c
> @@ -8,6 +8,7 @@
>  
>  #include <drm/drm_managed.h>
>  
> +#include "regs/xe_gt_regs.h"
>  #include "xe_device.h"
>  #include "xe_display.h"
>  #include "xe_drv.h"
> @@ -16,7 +17,6 @@
>  #include "xe_hw_engine.h"
>  #include "xe_mmio.h"
>  
> -#include "gt/intel_gt_regs.h"
>  #include "i915_reg.h"
>  
>  static void gen3_assert_iir_is_zero(struct xe_gt *gt, i915_reg_t reg)
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index 60ffe3f80c59..8e341d11f2e3 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -5,6 +5,7 @@
>  #include "xe_lrc.h"
>  
>  #include "regs/xe_engine_regs.h"
> +#include "regs/xe_gt_regs.h"
>  #include "xe_bo.h"
>  #include "xe_device.h"
>  #include "xe_engine_types.h"
> @@ -14,7 +15,6 @@
>  #include "xe_vm.h"
>  
>  #include "gt/intel_gpu_commands.h"
> -#include "gt/intel_gt_regs.h"
>  #include "gt/intel_lrc_reg.h"
>  #include "i915_reg.h"
>  
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index 892008dcbaf4..d0cd9e920d34 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -8,13 +8,13 @@
>  #include <drm/xe_drm.h>
>  
>  #include "regs/xe_engine_regs.h"
> +#include "regs/xe_gt_regs.h"
>  #include "xe_device.h"
>  #include "xe_gt.h"
>  #include "xe_gt_mcr.h"
>  #include "xe_macros.h"
>  #include "xe_module.h"
>  
> -#include "gt/intel_gt_regs.h"
>  #include "i915_reg.h"
>  
>  #define XEHP_MTCFG_ADDR		_MMIO(0x101800)
> diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
> index 99d3cc6c7164..173f5c4321f5 100644
> --- a/drivers/gpu/drm/xe/xe_mocs.c
> +++ b/drivers/gpu/drm/xe/xe_mocs.c
> @@ -4,6 +4,7 @@
>   */
>  #include "xe_mocs.h"
>  
> +#include "regs/xe_gt_regs.h"
>  #include "xe_bo.h"
>  #include "xe_device.h"
>  #include "xe_engine.h"
> @@ -12,8 +13,6 @@
>  #include "xe_platform_types.h"
>  #include "xe_step_types.h"
>  
> -#include "gt/intel_gt_regs.h"
> -
>  #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>  #define mocs_dbg drm_dbg
>  #else
> diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
> index bd3b64ad9c26..6519c6648460 100644
> --- a/drivers/gpu/drm/xe/xe_reg_sr.c
> +++ b/drivers/gpu/drm/xe/xe_reg_sr.c
> @@ -12,6 +12,7 @@
>  #include <drm/drm_print.h>
>  
>  #include "regs/xe_engine_regs.h"
> +#include "regs/xe_gt_regs.h"
>  #include "xe_device_types.h"
>  #include "xe_force_wake.h"
>  #include "xe_gt.h"
> @@ -20,8 +21,6 @@
>  #include "xe_mmio.h"
>  #include "xe_rtp_types.h"
>  
> -#include "gt/intel_gt_regs.h"
> -
>  #define XE_REG_SR_GROW_STEP_DEFAULT	16
>  
>  static void reg_sr_fini(struct drm_device *drm, void *arg)
> diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
> index e2f3f374b856..66ff9da46070 100644
> --- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
> +++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
> @@ -5,12 +5,11 @@
>  #include "xe_reg_whitelist.h"
>  
>  #include "regs/xe_engine_regs.h"
> +#include "regs/xe_gt_regs.h"
>  #include "xe_gt_types.h"
>  #include "xe_platform_types.h"
>  #include "xe_rtp.h"
>  
> -#include "gt/intel_gt_regs.h"
> -
>  #undef _MMIO
>  #undef MCR_REG
>  #define _MMIO(x)	_XE_RTP_REG(x)
> diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
> index 5049367bc92d..a7ab0d4451f0 100644
> --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> @@ -4,6 +4,7 @@
>   */
>  #include "xe_ring_ops.h"
>  
> +#include "regs/xe_gt_regs.h"
>  #include "xe_engine_types.h"
>  #include "xe_gt.h"
>  #include "xe_lrc.h"
> @@ -12,7 +13,6 @@
>  #include "xe_vm_types.h"
>  
>  #include "gt/intel_gpu_commands.h"
> -#include "gt/intel_gt_regs.h"
>  #include "gt/intel_lrc_reg.h"
>  #include "i915_reg.h"
>  
> diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
> index 5f8c56baaeba..cda2da27f7c6 100644
> --- a/drivers/gpu/drm/xe/xe_tuning.c
> +++ b/drivers/gpu/drm/xe/xe_tuning.c
> @@ -5,12 +5,11 @@
>  
>  #include "xe_tuning.h"
>  
> +#include "regs/xe_gt_regs.h"
>  #include "xe_gt_types.h"
>  #include "xe_platform_types.h"
>  #include "xe_rtp.h"
>  
> -#include "gt/intel_gt_regs.h"
> -
>  #undef _MMIO
>  #undef MCR_REG
>  #define _MMIO(x)	_XE_RTP_REG(x)
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 92065341c001..155cfd1dcc50 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -8,6 +8,7 @@
>  #include <linux/compiler_types.h>
>  
>  #include "regs/xe_engine_regs.h"
> +#include "regs/xe_gt_regs.h"
>  #include "xe_device_types.h"
>  #include "xe_force_wake.h"
>  #include "xe_gt.h"
> @@ -17,7 +18,6 @@
>  #include "xe_rtp.h"
>  #include "xe_step.h"
>  
> -#include "gt/intel_gt_regs.h"
>  #include "i915_reg.h"
>  
>  /**
> -- 
> 2.39.0
> 

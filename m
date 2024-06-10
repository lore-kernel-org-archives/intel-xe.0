Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04D77C27C5F
	for <intel-xe@archiver.kernel.org>; Mon, 10 Jun 2024 22:37:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90AA010E2A1;
	Mon, 10 Jun 2024 22:37:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gYVxniJW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B795210E2A1
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Jun 2024 22:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718059052; x=1749595052;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=sHdNFevqhWD492vAhrktKxCZM0SLfTu9uQQnUdwswQ4=;
 b=gYVxniJWIIHQJou3Uk/7Jw7XxbVz01o1gtYxqaQg/tgn+J84bBJ6IWQK
 PSA9c6IiTxXUIbBOXhYJIIjefh4g2TRVtfol3j459Xn4EYMn+FdBTnJzM
 fglNSLnPXmxGpw0DOYylFWMALc3u2ILgYj/IUZ5yyUbS/REWxiDxAhiEY
 +ek8k3XYEmOQkvDNFdslGeaIBTajUQa7u0zlLqRxz6PpPw3TYedAbyLSZ
 a7W8tLaRIF0OuaXEeuHeg2dtPlNmRU0gz2eg8wvvuVnwvlsO3cUbMD6w2
 pAjCx9dBPyWy21j2zCE+ZOqogWO1y5NHawdOlRdwcMMePH6+yz6PO4hmm g==;
X-CSE-ConnectionGUID: kphN6Zx6T/ypbQRLXu5bCg==
X-CSE-MsgGUID: cOnCTSDBQaGAEahcQ++rlA==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="14581503"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="14581503"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 15:37:31 -0700
X-CSE-ConnectionGUID: U2u5AE2bTJKQrNIryvvG4w==
X-CSE-MsgGUID: ptHXgF+iTaCwoQEiO0NsQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="39315819"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Jun 2024 15:37:31 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 10 Jun 2024 15:37:30 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 10 Jun 2024 15:37:30 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.47) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 10 Jun 2024 15:37:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dCouVbSWxQtZ+foDnUwz8Mu9SNp/yfpTUmqI8KKT5BTN1jHk5CORKSYIhkyEQuoQlfueBNkIIKvdF0iZcHrovHZvQz6C5ZAb5FaCD6Chquz+fN3AztvpaA8MRlJv3J/zbMqA1WmgbNtVDO3q5Qck0c3MVxvlqcl5fjfJcKuDMayFv6nT71H/iqatK5YPdIKjUuCTq7SHQ4fwoZu1eqVaZTa8GDUOferRfcN2EFXj8cLQ8yc4CfBLmfdBXYe+2XwWGq0v2cGpF3EWZWn2+skmU6NbsdyGR3IOwS00eVHhTClFGnTEYt1oumF4VR0xBa9b4lkx7d6aOO/f3bAPp63BpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7nuxJ+bFhcl2kxaX7EWNTpvePm5QrzdfEchtFP+tUYI=;
 b=D3znDnODXCr/QnlkChCTqJ3niAa7EO5X5MNuqUrtEgT2GPRWIiEndVurb60Hx/o5l/8msus7JA+ofLsroVKS6grO/+yMaZdC/RnJJ9k05/Z07ONqfXyI9JXAN88UPZKBbVn5xtvEJb8gMP/ENMKSHS8VlhuEuvqyV9C/Lf9xurxHsCYsg5NSm//JQjl+zZosBLeJovqZji71wyIPWST4WUNo4zaJfhxChUPmQQJGYWXK7SznidvjijeSGYR3SC2rKi8HgWnL4eQofmLD89Akc7wKGibtLBGuZDJ7zxYrc3kZFZ/2d1esV4+jeT22v2WP+fVLp3hFrxaI0cp5wZM3IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by CO1PR11MB4817.namprd11.prod.outlook.com (2603:10b6:303:98::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Mon, 10 Jun
 2024 22:37:25 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.7633.036; Mon, 10 Jun 2024
 22:37:25 +0000
Date: Mon, 10 Jun 2024 22:36:56 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Stuart Summers <stuart.summers@intel.com>
CC: <brian.welty@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/xe: Fix missing workqueue destroy in
 xe_gt_pagefault
Message-ID: <ZmeACI6X3zEaepaz@DUT025-TGLU.fm.intel.com>
References: <20240610203300.182615-1-stuart.summers@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240610203300.182615-1-stuart.summers@intel.com>
X-ClientProxiedBy: SJ0PR13CA0102.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::17) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|CO1PR11MB4817:EE_
X-MS-Office365-Filtering-Correlation-Id: 2548b13c-c0c7-4329-1ac5-08dc899de674
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?L2GRKruy3x6OXGv2aopF+ZNmk/vn4/3pzYzBI+PlCcBZDCgMTPY5l4dN8dJO?=
 =?us-ascii?Q?2S441PEMvxZ56zpmHLexTSP4jb00iVYoFNpqu+b6MrkjFteq8cFs19BN20Ya?=
 =?us-ascii?Q?iBFPTkqaYfAxycc05dUfoXlV8vaos22K3usq9t/47sw3n/uOKbhFCaXb/QdF?=
 =?us-ascii?Q?D51BPj8myOGzYbFkiSTApLqJ5/oAwD0oRcY2Q7UjypGKL+aOuxxBnwyRyCjL?=
 =?us-ascii?Q?BOJGyOd94bYCn3RLuIm8hXpLxCEw5gzDwxpgh9OEq5dwbfdESuJpbVhvzv1l?=
 =?us-ascii?Q?vxo0udaiZkKu/Ml8k8VBWVW/Vs5LzT6+cNuI+m92WNyvcKeH7ULYUOZeMzp8?=
 =?us-ascii?Q?QoNAjSDZEPh16ozxuBTK48a24WRkJZr96sukm7eGC3NI03C+UK89R/foCOeU?=
 =?us-ascii?Q?zyvXcNz5uJvbfkpYpYlQ5+diDV7b2bNIluuyGxbmcTwKwsGWlG7eZFU6rLxH?=
 =?us-ascii?Q?NhQZfzh1a6uV2amjoz/Fi9PTEDP1PBwicUV5mm761CEJ9LEl/b81LgadpYNb?=
 =?us-ascii?Q?jEBU3VJHWpIIkg0OComJEX+aEFR6Tk0yotR87kiCg5V5pqCvktZaZNw8a+My?=
 =?us-ascii?Q?3zd1WtuRBj2BtwVtR+1QkZzR/4kxdnd+wH0k2tEFpghIWMoy/NZkd+cyHf2a?=
 =?us-ascii?Q?vWVy/6O7Ve0CWj+ILbRojosQEFP/2hNVaDGB/1opnW54npvt+87ploqi6faP?=
 =?us-ascii?Q?7+DbLjrBKCFfxAQBuUPrHuRXzTRH5sR2eWrVEe8XNeZr8ZFDsWVd+6CN4ybq?=
 =?us-ascii?Q?7bzhaRYGxtK4mQbs9qdBHdDV7Bl/O0ttvrGRBKlR/U3jcuCsS8RBhb1kKKqo?=
 =?us-ascii?Q?0Z2KVajtUNYK/TMfQD6ClcQyo9i/GJpKMAHzzWNKHayJtmByNQEOgx7kaDB5?=
 =?us-ascii?Q?81/52Xpknu3bJLVT8k6F4W4irkMB5wNL0NJkE6yvKP2ZpYHU1US6YgWxaSAS?=
 =?us-ascii?Q?rf24IB4PKN4tNaEQB30CLIW310M160C+xX070k30o4xvy4vxSpJ8gNjlSk+d?=
 =?us-ascii?Q?VVhPqH3jDB00D0EhD3cXGlolMMExynQLIKZtZ9nZf+3gtUxuzZZdau5wGFAc?=
 =?us-ascii?Q?BO1G1xMuBX2XgJo/mxAgBNbPFAyaR2ObxKSEC2sgwq8SbCD8JwJzCU1rJnTD?=
 =?us-ascii?Q?Jjc+3WtXCErEjR1+g8zjvZ08fHCZr0KUC76bDKj9n/d4dz8cG+KDhA907zh3?=
 =?us-ascii?Q?/2kI1ihdjqVeb8lPztnzCdxxRj7fgtLHtJywztB2eucP2w4rWDrbF5WXTmL6?=
 =?us-ascii?Q?IeV1v71/7c14uu5yY/Uw?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TiJjMlRFlJZcrE9yz6LOE48sBMeP+4tqJm4zmhIPrcYbNUA9Hbrf77R+4cPI?=
 =?us-ascii?Q?IK5u2Sq2cMjazbpFWzjrPiy9/waLzO4HyygSlZ0pueLEJngFmx6jFsq/qgwz?=
 =?us-ascii?Q?l8zFEE25X4xSY/9S/tIwzZhkEZIw9N9kqQe+tjFIyqdNiO5hmZ5A2bQsgFj/?=
 =?us-ascii?Q?Zcsp/7166jYnLF6O8Y+ynBRBli0DlSQjYT9YxzL11MpyxG2qwiHbcNc1zwHb?=
 =?us-ascii?Q?zk0D8yUXQjXZ6hyPnximSfd1RprlnemXU8Z3GMTKO+ZrTtcP7Q1ePfSdKo1V?=
 =?us-ascii?Q?LhcPZtHt1lDNEJYlayScJo2dlrZJCRNbOitIDCHQJgP6xnJgrpSInmcmFOy/?=
 =?us-ascii?Q?6QOTNogMWzUnfSrsRql/h44W21lxtOopZGV3j8wcKU1qSDo9MG6H8eE14kvh?=
 =?us-ascii?Q?eJipgovibaTM1kwWAP5bR8cYLceYH1Ju6cn2Kv51VlvhPAWKHrDfXhvDSsYd?=
 =?us-ascii?Q?e8+iGii7i1h9FWKeq9zYQ1bANBxcPlN8ZJFMORQ4gWsUQCrROKzcDI0kp3Qh?=
 =?us-ascii?Q?YB8cFUfbv/vmAWElLHk/7e5RBkD6GDdZJ50zELVZfnN4xH9m4aAtH1uSbqbq?=
 =?us-ascii?Q?zSin2PCa3BscHsuz2d4+ES2RIWPn7wkvUtSduRCm5SVsgQNDVdyvohF1icNo?=
 =?us-ascii?Q?lqwL+Qv+Pt9SAvsZyRLmoeSjmoR+8Dlz6OASXn8Ln2eVtxzww2r/cPaY+2WD?=
 =?us-ascii?Q?LQNYZlnQWFO6+ZZfBFaxbtOGYJ1tIJd0BlklPP5aT0SVgwO6fZpnVAHJtDxU?=
 =?us-ascii?Q?voZdDepcCHXBPG4Vas3SHqc7BRGFJ2amroupf5wr5tGnYdBlk1rIqP++MBnO?=
 =?us-ascii?Q?Mc6A8WaGUiPTAURbq+4IqHQ2+eod59f7SKx9zbiU8lvxo1dbAzo3X0rstirM?=
 =?us-ascii?Q?8/wJyjoRZRsRB2GLlfk9WVPB0pTMJUT5Sejhwyc901FGOKySwa7UDOVdxxnQ?=
 =?us-ascii?Q?DZyNXT+X8L2zjKixO0uuRiuI40tmtViWAX19zFjUxd2qJ0PbpjjUoN2CVXs6?=
 =?us-ascii?Q?Bn5xXW1wiK0siqDQinyMO3/QtRwsHCkwJGyA8NhjQ6luvND9VwJf2ICdaBrY?=
 =?us-ascii?Q?CWPKLStRYQcxbFfTSh1B8ZEWezFSEKvXOykTdKdID5mWpR4ezuTumnO62eqG?=
 =?us-ascii?Q?uW0iMKozz0beSkIZTZus0SudlZUlv+jUZ26ipOKKjfYrvmm1yqpE+3ot5jxA?=
 =?us-ascii?Q?PXNxGa59B4AJgsK/x1hJ9Pf2StQhlK2VRnDqGlxGBikwp/qRBIqRy2/pG8Ci?=
 =?us-ascii?Q?ps4zQ4F/iRCbclhh9OjxTc+7vf3Ghn8sTwWmeCSWnCeDvaZyvcw74vZ/XRKl?=
 =?us-ascii?Q?vvYYh+0mtZEVAKJ3vfd+2C5lPdCzIJDoqQFRh/FPE9q+DDam+aXUHEyFWvEY?=
 =?us-ascii?Q?mjc4R7OZwf6C98ijyXv/+o38sverM2+S4fpOe0SoeOzQMJpxk8B3Q07Edymu?=
 =?us-ascii?Q?voPsiNH+u7+tVIyJAXQZ3faqMqAafWLFKzB1veNN/mH3je2VewiAKlkfU42c?=
 =?us-ascii?Q?+ZwIDvkqOn4IptQKwgMpPfDVZKKZjfBaITzcMTdabpZ7yUXSnIZ2Xdhq60cz?=
 =?us-ascii?Q?nEtChUq3vkSmwj3AX3VFbyMH5Lw2oK9lmRBcPMx5mvZwMat9j7FRLiBReFNd?=
 =?us-ascii?Q?cQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2548b13c-c0c7-4329-1ac5-08dc899de674
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2024 22:37:25.0033 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mFBoHZsuVt5kFMgB+mbPxwYToj2ZoJ8cHFPgxHLdPw34ooAlce0BlM0BSr1EF9e1T2yHGQxIg9VnjW9JTEZH+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4817
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

On Mon, Jun 10, 2024 at 08:32:59PM +0000, Stuart Summers wrote:
> On driver reload we never free up the memory for the pagefault and
> access counter workqueues. Add those destroy calls here.
> 

These queue long term should be moved to the xe device as they are
indexed per VM and be an array of ordered_wq. Something like [1]. Not
sure if it worth holding up this patch though.

[1] https://gitlab.freedesktop.org/mbrost/xe-kernel-driver-svm-post/-/commit/e9fd233a5ab4db54104970cd8d7c0e92a36f5220

> Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> Signed-off-by: Stuart Summers <stuart.summers@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt.c           |  2 ++
>  drivers/gpu/drm/xe/xe_gt_pagefault.c | 11 +++++++++++
>  drivers/gpu/drm/xe/xe_gt_pagefault.h |  1 +
>  3 files changed, 14 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 57d84751e160..68dc6920112b 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -107,6 +107,8 @@ void xe_gt_remove(struct xe_gt *gt)
>  
>  	xe_uc_remove(&gt->uc);
>  
> +	xe_gt_pagefault_fini(gt);
> +
>  	for (i = 0; i < XE_ENGINE_CLASS_MAX; ++i)
>  		xe_hw_fence_irq_finish(&gt->fence_irq[i]);
>  }
> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> index eaf68f0135c1..3858c8e0b707 100644
> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> @@ -415,6 +415,17 @@ int xe_gt_pagefault_init(struct xe_gt *gt)
>  	return 0;
>  }
>  
> +void xe_gt_pagefault_fini(struct xe_gt *gt)


Use drmm_add_action_or_reset rather than exporting a fini function.

Matt

> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +
> +	if (!xe->info.has_usm)
> +		return;
> +
> +	destroy_workqueue(gt->usm.acc_wq);
> +	destroy_workqueue(gt->usm.pf_wq);
> +}
> +
>  void xe_gt_pagefault_reset(struct xe_gt *gt)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.h b/drivers/gpu/drm/xe/xe_gt_pagefault.h
> index 839c065a5e4c..d37b790ce8bb 100644
> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.h
> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.h
> @@ -12,6 +12,7 @@ struct xe_gt;
>  struct xe_guc;
>  
>  int xe_gt_pagefault_init(struct xe_gt *gt);
> +void xe_gt_pagefault_fini(struct xe_gt *gt);
>  void xe_gt_pagefault_reset(struct xe_gt *gt);
>  int xe_guc_pagefault_handler(struct xe_guc *guc, u32 *msg, u32 len);
>  int xe_guc_access_counter_notify_handler(struct xe_guc *guc, u32 *msg, u32 len);
> -- 
> 2.34.1
> 

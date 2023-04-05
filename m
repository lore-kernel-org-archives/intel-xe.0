Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50C37C76188
	for <intel-xe@archiver.kernel.org>; Wed,  5 Apr 2023 17:28:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A77F10E15D;
	Wed,  5 Apr 2023 17:28:47 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C9ED10E15D
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Apr 2023 17:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680715726; x=1712251726;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=DXtT7/UX7wYQxR2Rm5TpMEr/2Vj3cYW2YXaYKhTUjG8=;
 b=Chen8ZDPfJJVaBRHB5xoESaLJS9beM6tqscSNdZipO3td8HHr5BIMvw1
 4dJsiCZY6GfxwkvRGKV3QgVGgrL9cS97adouQM6IFm/2vFRa5Kb3oJWZP
 SCPdgs8BNXoJ+PrVz510RGEYHd/+XBSFAsSLjxAm1rsBm1S07fcdAhDWN
 /tfRViL/4MqrCVxRd5sjHv3x76l6p5+hm9vYUf+0JI4+sQ389ScP9QP1z
 KrrclW3Xb4v8qhLAkFSmZ0XVb5ev9IFM1xerfhxRuimdKOUYLTn3UCug7
 WQVHmrBcyURIvEqQTyCg94uptr6UzGBO6vMyhqzwQ8ibB7jAK+ww76M7Q w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="322170623"
X-IronPort-AV: E=Sophos;i="5.98,321,1673942400"; d="scan'208";a="322170623"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 10:28:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="717122549"
X-IronPort-AV: E=Sophos;i="5.98,321,1673942400"; d="scan'208";a="717122549"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga008.jf.intel.com with ESMTP; 05 Apr 2023 10:28:45 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 5 Apr 2023 10:28:44 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 5 Apr 2023 10:28:44 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 5 Apr 2023 10:28:44 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.172)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 5 Apr 2023 10:28:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BtGQ+jXBw0u+QpxPS9XWzKm7QZxjr9zRdtGtWNJuPxp+ZCtLN9CXYIiUqIFY0WFKHGXoL8wwCCAhn2P9Y0JSu2+wLBsCYb32fOezLGwgls5P2UauK8UN4qBmr+rEnm2bIZb30jPMEXSESl+C+URbDLYAGo2YxyPeF6jWpgPAQC9/pByaUINEbk8yk+ubid9llBxb4zoHKUDKAG0bt6nivwUtG3umS+eDLE5vU7bKiLINN2P0tVMznMqc1TXLVU5Z7pWWXGlbWrGS34RNBjFqOOj6nFXDeTWFACvwf+Z1OpvFQF0Jd+XOs1+nW51QQi5T4sqISDLx33PDxPI0lq3uRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q/VxQO8qZFnsAq/x8w12CtEKM43/mNzunnf7VRki6rY=;
 b=BBDh+pH1pPrhM1GoSD6JUibDXGfktJ6XbLdNJPdb8N0w8vdARbDwSv2jMdAbpWx4yBIltZ0hhTvG63LKr3hWVclVHb1Qq1H2xadMyF71YbC3UtfSPoF04imMlGh1j9/ijyebvakfpRaxqJsAZ4f4LplCi7cIFb/byE3Vq/lbRpxm8DBmvI+BqYbEN3FM6ZWib5N2s6/iOSNJbnf1pxOWB+dOUCPzZpG+EV6ugBTxwpugxyYApAMjWsA3Rj+MwRkmb+NNpqyoMifm101DusXpOv2SKJ1wynf1T16kX4nu2rdkbgeSpztB+Df/B0jJ0EvkNYqgUBLy7ECMfloKwWONsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CH0PR11MB5217.namprd11.prod.outlook.com (2603:10b6:610:e0::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Wed, 5 Apr
 2023 17:28:37 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::2b57:646c:1b01:cd18]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::2b57:646c:1b01:cd18%9]) with mapi id 15.20.6254.033; Wed, 5 Apr 2023
 17:28:37 +0000
Date: Wed, 5 Apr 2023 13:28:30 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Chang, Bruce" <yu.bruce.chang@intel.com>
Message-ID: <ZC2vvhhbSJwSRUWk@intel.com>
References: <20230405171303.525412-1-yu.bruce.chang@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230405171303.525412-1-yu.bruce.chang@intel.com>
X-ClientProxiedBy: SJ0PR05CA0071.namprd05.prod.outlook.com
 (2603:10b6:a03:332::16) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CH0PR11MB5217:EE_
X-MS-Office365-Filtering-Correlation-Id: 31e65b93-ae1a-4313-8c07-08db35fb3039
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: khDcjHOohtFrT3v5JT8269jhK+Tw4aV6R3q6AcM6z2Oh+VtzIGRruHKH8PK5iiTtZsyTI/zGiNQOBC+bOvgAiluURNGyb9pNwlmlFS9QwjtQ7eOozNY/ddBnvOTE8lAbnpLk5r3WWe4b6ViaA2Sryxw5jx3TbNudgib3RbNKfJxup4eNKVYvZIGs2gqRA/wQbGBKsfnuzHpBJ7MgnVynx+Qy2rKCQxsSQAFGWXcOKY0dBWEfZ2PHRfURnHAd+5uS9KJjBSOCE+fHBGTwQTV3BCBATq6gDcurJrX48w7fEqHuYxIfPstBXDmHAd/jCMyK4hHvXdsDVUQexNjSdJHwoShMvlOLDx8DDAv6Op91/a7wUurvXkBvK4dBXa4SWqwE2RJw8xoUk2urynwRGb/6GBKn4xEnxOGU1QZfjMUXZJOE37cQa6kF6nCt11kdMxg/J4kGmCH0F4vOk0OfGHqtjQyTT2BgqPndNNxteimx7mmMEyzwul0WxxwGi7nt8+KDWQby3aJjcOOrn7j6bQveKY+7/h8JhMwBC9Of68FXcQ7mOaxO828FMugwY5VTmPKF
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(39860400002)(366004)(346002)(136003)(396003)(451199021)(6486002)(66556008)(8676002)(41300700001)(66476007)(66946007)(6636002)(36756003)(478600001)(37006003)(316002)(86362001)(4326008)(6666004)(6506007)(186003)(107886003)(38100700002)(6512007)(82960400001)(83380400001)(2616005)(6862004)(2906002)(5660300002)(44832011)(26005)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Cd5/euL57rg488Rr5ZQmE7kpRH9GDC/xfPRaTuxE0QFKW2MWGwEyoB1IG6?=
 =?iso-8859-1?Q?W+4hlAdbVz5lLhB5eR4gsrsGsXKeIwWgQelifQnSrsKFzH4FXDKWQVBoAF?=
 =?iso-8859-1?Q?t2pKzFa5Rv4U28K7f5oH63f7meSrvixuXoeYVa58ofRUyFyrHWjYlqw6BD?=
 =?iso-8859-1?Q?Gs4eGOB5PT3kWo+hYOL44E4CR2VRAkeadslNuoBfSWYTB47FyC4rt8CQcE?=
 =?iso-8859-1?Q?ktoifAt/r18j1VQDPGei/cs1dOp4DJAsRJ7tAl7i7SJGe39GLWARY11Bw/?=
 =?iso-8859-1?Q?MnjqeX0r9JW2rvciUA1shCl7sKXVwdJPoeaNXU0oATp8Y0ebvhiwVxlwaf?=
 =?iso-8859-1?Q?CRXzit74yc1m0GQ0p4HtkSJmPImAumMYHUdAgoEK5xOJt8zb4u8y7vm+z8?=
 =?iso-8859-1?Q?7dTAJS0sXkO11boNQH++y7ZBHbDc2HaEcnfuYUPbc4+/Wa7C8S7YdrpPmO?=
 =?iso-8859-1?Q?biCBOmw0LdpOlA3HpuDF3rZYuQ9CPdUOvUyB+/HVjkQqLZ07Qinn2hyR3l?=
 =?iso-8859-1?Q?MB5Dpw64g2jRJzWoezm7Anl06cQeY29adfOAOMfQgTDNQbOxVhFVYQVdMV?=
 =?iso-8859-1?Q?RyZkIw+xJrCEPayvrKkmASE/pVtIkst3kyKNHulhs7X8iHLegQuYd3KrPF?=
 =?iso-8859-1?Q?QJsYneiD2Zq9WdVtOWuk5tAi8Kp/AUUwFctGYuHBaOLGreRsZxRe9HbO+p?=
 =?iso-8859-1?Q?6yP3DCcI2AJvhYWvwS2c2MakjuWDvBp63qr0xSeFauQR+mjiUpGy/f6/Ef?=
 =?iso-8859-1?Q?voIumgrcWbJA8kiXwTx4125tPjsnhEBnlV8p+8WRFt7WVQxmN7EN3SWZD7?=
 =?iso-8859-1?Q?46sHhgpzUqromBz6Tsm/UWt+81Wv+A5UTX0Ss+3MT6/n3cbpWAs1IDNLRN?=
 =?iso-8859-1?Q?alc5T3e+aMf8Rs95dZd2K0VSh4ffdjwqjhJtYaUSO3oEVsMgS9KNRsWwi5?=
 =?iso-8859-1?Q?z3LD5U/VDA9T6QODjm9iTE1uZKIj3AVueRv1JME+FUuKlGAlB9x+DRNXJs?=
 =?iso-8859-1?Q?Xk+pn8vXWMeGh9Yqc3X6sHwk2bV/pSklSmZb/7+rJMSA6mr1Ubmj0qGWVP?=
 =?iso-8859-1?Q?vz8jIZH7so/TXPUANIloGk/aaBFki/jheuvrCyc51QydMc7f8Jyy+8QjqG?=
 =?iso-8859-1?Q?YbXxOQZh+zYAntLsBycdzoXZT2skU0vkBtFIBUaiKa4tGEpUJzYpcIXTPe?=
 =?iso-8859-1?Q?FFLjXz1YVqLo9EdQH6LGRPJGgZNE6dcolmSwcqGr5qTNY8M4G9UYvnWIuP?=
 =?iso-8859-1?Q?ruZbT8e5GJEuSvm/9PbCNAZ/eBYt9zU2e5ZQfRn3Unkr6wum6nSKktC/Bb?=
 =?iso-8859-1?Q?SxjiqzkSTB7h9iD64gJDv0aqFNqCB7G/Q8NwDdFyFtk3+CFLY7ibiAXCwF?=
 =?iso-8859-1?Q?6G6KnhN/TYKc+uc/ixQ4TJdOL+cKEDGiPE9tK83DwQvH8Jzb5l71K7SB39?=
 =?iso-8859-1?Q?z1cUI9Xp9mQpaRdFKulXg4JyKfEqJ/rLUWR0HkcMYERqc4klU/i1TBERmw?=
 =?iso-8859-1?Q?QdLYYF0G/nC1MiUeHYy2hrTQmmFwkGxqD3r88URMmgVgxPCu0PDPflwr7o?=
 =?iso-8859-1?Q?oQC7f8z+8aeLQqakw4CSy8ksaNoWx4zn/1S/SBIMCseksIoUG7WOWsVQtx?=
 =?iso-8859-1?Q?B5xO5knFSs5hmeC6ro0zs8NsnSBdhkRBmx?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 31e65b93-ae1a-4313-8c07-08db35fb3039
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2023 17:28:36.9319 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sz+CZpXNBi9cA1X3vcKO7Sq9jrTL4tU+xsofaZ1PeQzUAKpUFCiWAHloPC0ZjHRTFvxGql9hu1sY9b50rxQzUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5217
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: follow up on the patch to fix pvc
 unload issue
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Apr 05, 2023 at 05:13:03PM +0000, Chang, Bruce wrote:
> created xe_ttm_sys_mgr.h as suggested by Lucas
> also fixed a compile warning found by Lucas
> 
> v2: fix a comment format issue
> 
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Bruce Chang <yu.bruce.chang@intel.com>

I pushed this patch to drm-xe-next but as a fixup! for the
original. So it will get autosquashed on our next cleanup rebase.

> ---
>  drivers/gpu/drm/xe/xe_device.c      |  1 +
>  drivers/gpu/drm/xe/xe_device.h      |  1 -
>  drivers/gpu/drm/xe/xe_ttm_sys_mgr.c |  1 +
>  drivers/gpu/drm/xe/xe_ttm_sys_mgr.h | 13 +++++++++++++
>  4 files changed, 15 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/xe/xe_ttm_sys_mgr.h
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 4fb9aff27686..85caf81ae686 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -27,6 +27,7 @@
>  #include "xe_pcode.h"
>  #include "xe_pm.h"
>  #include "xe_query.h"
> +#include "xe_ttm_sys_mgr.h"
>  #include "xe_ttm_stolen_mgr.h"
>  #include "xe_vm.h"
>  #include "xe_vm_madvise.h"
> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> index d9d1b09a8e38..d277f8985f7b 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -116,5 +116,4 @@ static inline bool xe_device_has_flat_ccs(struct xe_device *xe)
>  }
>  
>  u32 xe_device_ccs_bytes(struct xe_device *xe, u64 size);
> -int xe_ttm_sys_mgr_init(struct xe_device *xe);
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c b/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
> index cf5f4f73d4dc..9c2f7d4936d8 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
> @@ -12,6 +12,7 @@
>  
>  #include "xe_bo.h"
>  #include "xe_gt.h"
> +#include "xe_ttm_sys_mgr.h"
>  
>  struct xe_ttm_sys_node {
>  	struct ttm_buffer_object *tbo;
> diff --git a/drivers/gpu/drm/xe/xe_ttm_sys_mgr.h b/drivers/gpu/drm/xe/xe_ttm_sys_mgr.h
> new file mode 100644
> index 000000000000..2f27d9117b54
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_ttm_sys_mgr.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2022 Intel Corporation
> + */
> +
> +#ifndef _XE_TTM_SYS_MGR_H_
> +#define _XE_TTM_SYS_MGR_H_
> +
> +struct xe_device;
> +
> +int xe_ttm_sys_mgr_init(struct xe_device *xe);
> +
> +#endif
> -- 
> 2.25.1
> 

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00768C47DD9
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jan 2024 20:18:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4D9F10E6F7;
	Mon, 22 Jan 2024 20:18:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C700810E6DE
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Jan 2024 20:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705954733; x=1737490733;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ZAEcP7f0TtnV4PQPhadONm1h+tRPPTW8KsbtBZHJiQQ=;
 b=EFtnSHTek1NuewAsMSktYNyUmfhiGs16aeUKAb0xEBCadyrGrPMgaKMX
 0dHwADodQyCsKtsDnh7+cV8C1rye9rYA1z/xh2iLYUBXy/2znrPppuIzV
 3Zx/3Rk1KKK+5hbHSDFAtItrxpTO6ufF5t5IzZv+ufizIvMXR9zCvWzIq
 JefuPXVBnNU+PVKJtf247t5leGuj9ILbZAVZvWuaKGpov4e/NCSf8WBMm
 qVh+d0coEARfjvNcUJJNelqSJdWd0yafxOI4dELm8wqOS9gEbhQPcK9ig
 Pp4n4hQnUU/3DXQpBFYJfN4LWECaVp8Rv/6C6DdbXMSfigc/foth2XH8R A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="391740941"
X-IronPort-AV: E=Sophos;i="6.05,212,1701158400"; d="scan'208";a="391740941"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2024 12:18:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="856058584"
X-IronPort-AV: E=Sophos;i="6.05,212,1701158400"; d="scan'208";a="856058584"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Jan 2024 12:18:52 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Jan 2024 12:18:52 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Jan 2024 12:18:51 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 22 Jan 2024 12:18:51 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 22 Jan 2024 12:18:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CjYXpFxO468lVKWkLKF9HPlYAwDoWCHYc464hsZufqG1vUPW349U3H9XX+dggzFaCGMeg3l/1MY+uM42LIV76CdHxLd0bGuQlUlvsa6nmmsaz6z2oyzB01wBDmJ2kz0dwIu4JtYOHDNQ3b13/wpX0hpWYF3zaVF9u2WPmGToQhgd/YUBrfMiWfq2W03sD9VHXeygUuFkcBiCLHgxyZfIlAcB8JIaSM3ipC4tBcWbOJImIGpKowM6G85/shnjYM69eanBIajfDrQ/hnygv2Aob5+mI66+z0N+50609PprYA1FsdGgDa5/gTR+pKsFV6Pq82OV5hm4r1o/EHDWiS88bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bXHeagSZwMA+n+mfqhEWr/v2auyf8QTkK4ib+/9acwc=;
 b=gP3mcxhvTPCgv09LY97G4P3xAuMgxYN7/iYi4DrehXSM5eWGZ8wJaeYCKcE1DQCueNeUSAgl2e5MarolZnTognEYQN2xyR85CR1ajr2Iv19+0qjpyO4GBTGUgwAdHcSqA1W2qN21NCHFZJc1a9+gfXtvY47X133d2tlmTehOIZbIc7p7p3J9qqeCh/x48Vucf4Uvyj8Ik8QmSJyJCI71rpeI3u9jQiWfZxMLzZYaI84oPsLOAnWP6wpsA090goXTx0c9p7WZmqKlZG22CXHjjIrhIvzaPEpverq1Te4YPHAZxGbgUzAf56zPDisBIGIEFdbL1MELX0etv4dEUrLkHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA0PR11MB4592.namprd11.prod.outlook.com (2603:10b6:806:98::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.31; Mon, 22 Jan
 2024 20:18:49 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7202.031; Mon, 22 Jan 2024
 20:18:49 +0000
Date: Mon, 22 Jan 2024 15:18:45 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>
Subject: Re: [PATCH 9/9] drm/xe: Remove addional spaces in devcoredump HW
 Engines section
Message-ID: <Za7Npf4_VKgf3Ox1@intel.com>
References: <20240122170445.108856-1-jose.souza@intel.com>
 <20240122170445.108856-9-jose.souza@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240122170445.108856-9-jose.souza@intel.com>
X-ClientProxiedBy: BYAPR08CA0039.namprd08.prod.outlook.com
 (2603:10b6:a03:117::16) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA0PR11MB4592:EE_
X-MS-Office365-Filtering-Correlation-Id: 301d1ba1-911f-42cd-289d-08dc1b875820
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: n85RnfXmduWCbJpCeAD6fbUfzCbIgxmHI2rDrI7qOgOvG6y86bs4ne1N+Mq9owbh5ltVBL8Hn+p8+fydhJz8HHcIItPxuqOrzvxdW68Y0e9OFkCqjdJhEwGtVEBiM4YGbyZx6B/Kv/z0Bc66ZfzNJ1HSkU0uliYlbLmDv2MpWsqpJfJP6DzJMsKLsxtntoghJfiaNmv5RDbzt2upySs/jwEvqv9hh1kLZwD16l85kzViMqQ6IDes1wZ2TEOPi9Q5As4T2+N408KMjfMmcGvi6Z3noYqpoOSjAE6HsWyx7Z/6rdjctLnXDeu9HyjMk0yhyxuUQhFZspkHuhFLtP3L5flBFAmQlvM16OZSb2+PVIjjCDkY059Owh4qhIQDWHyLJNjEqPJXEch0EyQhtBADzoP97ZifAKqOdE37FL6tG4UOG/XEPiiHa7Lw4GikTBzBa7EmfxXHxAUJiJJCC/mcYcsqe6nj0nifY5ajTvDS1yu9TnfCZQJBh0I2V73YtojMHT+qjVjQbC9m1azK7Xb36hKvcuHdK6vwHcHgDrFb+dIZ3zBA6MHjPQ+u0EDWa+SRKLE6yeMmatO2gROZFh2t/E4LvOjash3ftZDbF5OejjDzGDBWucJD3uVwuJUC+YYh
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(366004)(396003)(136003)(346002)(230922051799003)(186009)(1800799012)(451199024)(64100799003)(6506007)(6666004)(6512007)(26005)(2616005)(86362001)(36756003)(82960400001)(38100700002)(41300700001)(44832011)(5660300002)(2906002)(83380400001)(478600001)(66476007)(6486002)(8676002)(316002)(66946007)(8936002)(6862004)(4326008)(66556008)(37006003)(6636002)(25096002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?CsWKbuQ+oXaISqdfDwXW/L2c+gAUn/H5g8iVZ61Z5/WNuMtsunA2vkD1hD?=
 =?iso-8859-1?Q?uzqSGUEXxwI7lpmBfipwgUE3TLvJfyQ6nDVS/IxXjQClHW/SwgXCLs1l8O?=
 =?iso-8859-1?Q?/yiYjVU9VwfTFnml4OjrBa81GmOEDpk2Matd8v07fxAtXu5osE//W6vrfa?=
 =?iso-8859-1?Q?h281xzpTUrsLcLP/iSK9t09EIdD5wYTwX5563o/0SBa3YCfpU8pL/mbUaQ?=
 =?iso-8859-1?Q?OPhlUjNFV/51n6O2iSJIg6/Wf4/D5kbafYa+w8+jkucUDFwJRtcXPkanuK?=
 =?iso-8859-1?Q?zq0523xS9CuzLeL0smu9BV4SVukxqE5sm1ns3VTrjEvUD0vLxSmiYBizsD?=
 =?iso-8859-1?Q?ValKIBtVicMvyIGVLMtYBOjg+Ef+SefbawPPdWGhVNN/SmqY3MQneT5gvw?=
 =?iso-8859-1?Q?K1v1hzv8yjSSuKz8VWQZLZ4arh+Kvt1L52fHL4wzSqKqUs5LHED5FRboie?=
 =?iso-8859-1?Q?9dTgZaQoRtUqE6FuvM7uuGyw9RxE8hhX4LzPRGY1UWRJbFkc6H6BGs8OvX?=
 =?iso-8859-1?Q?z3GiCyEFHsnoyml1+gDdvnw/e/Laer0V/sh4rcmJwvldH1W2hAUsDbboxi?=
 =?iso-8859-1?Q?zXiUyMTFIQAGI5dyF6PfHkumanLcMZ1Si7+IhZ2MVRjwnyRpvi56Fx0gMY?=
 =?iso-8859-1?Q?mFoUm26mBTli7EMbt5VQBS9Rlu53gB5YXEAB/KaqzdtiXJgwzuXnr8b53k?=
 =?iso-8859-1?Q?eHY0TMQsWiTK7PZOE1wgLLNvcvJpYfSxP0EFcqh2vVlcSkT33MyR+skU4g?=
 =?iso-8859-1?Q?lRi4Oms+lPipxPgNCCBmd+0TrY6tohsgM45+UxPJQskmUxMZZpbmtESsnr?=
 =?iso-8859-1?Q?pBTXlhFUskQzDS+7TvqhXXx3qUA1QihiEMRhhBgCE7GViFyag24Pc81uGg?=
 =?iso-8859-1?Q?m73flPArIJJwVX7Xd0GuvujpOc5lxe7G4oWjQB8nExVdQdFu78wuMu/j8n?=
 =?iso-8859-1?Q?puCnFnnszf5XFPzrYPJHfwx3CRkctUwCSFMPPmJUw3leDX1+In0kGhuWAW?=
 =?iso-8859-1?Q?63zdSPyUvZl6oNWuRwT74+KaENPe5MjOCv1JPoCu/4FCsu2rzVe1o/4ITG?=
 =?iso-8859-1?Q?zC8Ac8VYWTDsA1wNUoV4YeIS9BEviNNnQrFFp0g5l4HeCR5tImjwR3qXh0?=
 =?iso-8859-1?Q?kGE7bY2LpoaB6b14ooD1WDoXw14qh7C5pyNzNq9a84nZgRwpKCFFI41aMz?=
 =?iso-8859-1?Q?Wj+kJNwquz+6rjXbOKa2XGTFSRe7GjurmCgXMa12SnVs+rNS2CmExA4cV0?=
 =?iso-8859-1?Q?NUQUeshHUIWmaOxdh7hdCWD/W7NxDsgyIIK/ZcjbuUxiCrzu9LzCw2wmFs?=
 =?iso-8859-1?Q?gtfC5t5iQ6MrwotMJ0grZHIEm/1ZIn8QtFGq2s/x30AyA5ytOWbst72PNp?=
 =?iso-8859-1?Q?KAuJWZ/5ASFu3N5lzxYhLmGgrVjLdhDo9qvUqTVpBUJSjis6FFRhAP6QEQ?=
 =?iso-8859-1?Q?yK7eaCt66isyESfOFh5id4zVrq+esIdtZNlUJBvwEYTxQnqQBhSuBn7yRp?=
 =?iso-8859-1?Q?yJRnouDYm1VHcNg3NkJb8JHET66udn6pKMrGNtO7SHIYsJg7cE75NR62F7?=
 =?iso-8859-1?Q?ohpNsRpl4o+zPDr7mKZJAzCaRwwR1E9OXugN96PuLaeKXLiY1nvFpUuqRX?=
 =?iso-8859-1?Q?rPFEg6HjKzaXxlQEnLLyeT17Xq625uGP1G?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 301d1ba1-911f-42cd-289d-08dc1b875820
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2024 20:18:49.5906 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U0Nf8rFkbWrRf65mqbiv3wanlv3KdE5g04+Ztqb12Gkuh/JV/TaVbvbQlciwCUbY8OT9eICwbckg5gIjQuWeQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4592
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
Cc: Maarten Lankhorst <dev@lankhorst.se>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Jan 22, 2024 at 09:04:45AM -0800, José Roberto de Souza wrote:
> I guess the indention was to keep it visually aligned but that
> would require a lot of spaces and was not followed by other registers
> so lets just drop it.
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Maarten Lankhorst <dev@lankhorst.se>
> Signed-off-by: José Roberto de Souza <jose.souza@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_hw_engine.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index 9fc30ecec0a26..6927ce07bdfe7 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -838,17 +838,17 @@ void xe_hw_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot,
>  	drm_printf(p, "\tRING_EXECLIST_SQ_CONTENTS: 0x%016llx\n",
>  		   snapshot->reg.ring_execlist_sq_contents);
>  	drm_printf(p, "\tRING_START: 0x%08x\n", snapshot->reg.ring_start);
> -	drm_printf(p, "\tRING_HEAD:  0x%08x\n", snapshot->reg.ring_head);
> -	drm_printf(p, "\tRING_TAIL:  0x%08x\n", snapshot->reg.ring_tail);
> +	drm_printf(p, "\tRING_HEAD: 0x%08x\n", snapshot->reg.ring_head);
> +	drm_printf(p, "\tRING_TAIL: 0x%08x\n", snapshot->reg.ring_tail);
>  	drm_printf(p, "\tRING_CTL: 0x%08x\n", snapshot->reg.ring_ctl);
>  	drm_printf(p, "\tRING_MI_MODE: 0x%08x\n", snapshot->reg.ring_mi_mode);
>  	drm_printf(p, "\tRING_MODE: 0x%08x\n",
>  		   snapshot->reg.ring_mode);
> -	drm_printf(p, "\tRING_IMR:   0x%08x\n", snapshot->reg.ring_imr);
> -	drm_printf(p, "\tRING_ESR:   0x%08x\n", snapshot->reg.ring_esr);
> -	drm_printf(p, "\tRING_EMR:   0x%08x\n", snapshot->reg.ring_emr);
> -	drm_printf(p, "\tRING_EIR:   0x%08x\n", snapshot->reg.ring_eir);
> -	drm_printf(p, "\tACTHD:  0x%016llx\n", snapshot->reg.ring_acthd);
> +	drm_printf(p, "\tRING_IMR: 0x%08x\n", snapshot->reg.ring_imr);
> +	drm_printf(p, "\tRING_ESR: 0x%08x\n", snapshot->reg.ring_esr);
> +	drm_printf(p, "\tRING_EMR: 0x%08x\n", snapshot->reg.ring_emr);
> +	drm_printf(p, "\tRING_EIR: 0x%08x\n", snapshot->reg.ring_eir);
> +	drm_printf(p, "\tACTHD: 0x%016llx\n", snapshot->reg.ring_acthd);
>  	drm_printf(p, "\tBBADDR: 0x%016llx\n", snapshot->reg.ring_bbaddr);
>  	drm_printf(p, "\tDMA_FADDR: 0x%016llx\n", snapshot->reg.ring_dma_fadd);
>  	drm_printf(p, "\tIPEHR: 0x%08x\n\n", snapshot->reg.ipehr);
> -- 
> 2.43.0
> 

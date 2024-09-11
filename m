Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF40FEE57CF
	for <intel-xe@archiver.kernel.org>; Wed, 11 Sep 2024 20:35:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B8E110EA9E;
	Wed, 11 Sep 2024 20:35:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J4h8ogI/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1D8D10EA9E
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Sep 2024 20:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726086935; x=1757622935;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=i9cOWwPo25pvnbzAKhvcAjMVpngpzIjG8nblaGlTle8=;
 b=J4h8ogI/oR/Iq5a3Hp/N1sb8Q9WmK03rZY/GR4a+bIz7LhXhkw4SPG4Z
 cP4Hl41wc8K/wWAMaa660jFIWFkfE/Rxq2paLnvKmwCmopFpmtFBDxONr
 nHaWDZHMW6H+mklIYUbLak5q1GZA/d6SZSCylyO6mWw8rEnt1sWIcoWk6
 DgRagbAqVKOu7F+daqW0+8UeumfQGyE0G3Fi9fyAz+UxLIJTLyFFTH0sT
 ci+aZsZ+VcWTCT5gJ/TzQhmr6ACarfs4c2vhsGQNBLi3NDSmkUViQ276f
 dG0LLyWwwWgeCiQDMDxNPw0j32dLBdMINfO1b4nh2Ar7w9TKtRt++D6Ji A==;
X-CSE-ConnectionGUID: 2vmYWAe3TnuNk+5Mhekhog==
X-CSE-MsgGUID: fWo82+hdRJG+ZnpgkNBTVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="42386733"
X-IronPort-AV: E=Sophos;i="6.10,221,1719903600"; d="scan'208";a="42386733"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2024 13:35:35 -0700
X-CSE-ConnectionGUID: 5COOan4RQmqhq6zxQ22G8Q==
X-CSE-MsgGUID: K4pHYz6PTuq7+h0JwnI06g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,221,1719903600"; d="scan'208";a="67480757"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Sep 2024 13:35:34 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 11 Sep 2024 13:35:34 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 11 Sep 2024 13:35:33 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 11 Sep 2024 13:35:33 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.175)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 11 Sep 2024 13:35:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D8QiAKRmlkXnSpdqfw75LUu5yaqiRFqJUBVmCmtCZ9pcvMMVJvQFzirUfPQCDssLyiz2G26WXYV0vU+L50oKDDoX4WL2zJsT8TQ1CQCdcYouGh2N72BjJ+6jHEcauP3pEuaugfiDNgqL3cqSRV+Hfn+7N0yprOFCsf3WqjsJmB872W2uRaPYGnjNcGTKL98Jrf3Wuo7khJcTbNNFI5BTYT3qbFrQE2/SNK5JP1wJdkfQCB1cq5UiuIzTIT+pFK9kqmaRuQryKnqJl6ux6QkmZhuRJa59Z40UKydl8aDwRRcrPdNzxfbkdoPxWkQ6R+5MLcg6E13FG0pok8zEWcnqUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rcyOF1k2lxrJxjRpPydfz4+Xo7Wh49alObjNaEMf0C0=;
 b=a2E4fGrl546K+htY9apPl5E4z2jFYkRoKYjJOUaYgc3zq9L04QM9UbspbXNWs3LhaTZQtVEy1jeERPfgSjho49VW8yXfy44SjzC4tNXmG50cUE4Yf5k6Z5ALR1T84NzQJKwbM4Az6egUooaCdu9hnEDIFNxIu3bt4SuQzSjzkctDrw6cooEkc6xb6/LNgr1cKu3TJFj37qwPbLRIC/S2KeQz46NSWEEEC1Afan0Kr8xMo8jQc3y+Sooput++iYubgStgBEioYPJtS76NC4Y/+Nmi7t2wb1PQ62mYYSbM1Kn1WFbfJQa+0q5aP5SuERaSYMaj6nF0Br5a5EkQBGmxcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by PH8PR11MB7967.namprd11.prod.outlook.com (2603:10b6:510:25e::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Wed, 11 Sep
 2024 20:35:30 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7918.024; Wed, 11 Sep 2024
 20:35:30 +0000
Date: Wed, 11 Sep 2024 16:35:27 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3 43/43] drm/xe/mmio: Drop compatibility macros
Message-ID: <ZuH_D_pXTiY92ior@intel.com>
References: <20240910234719.3335472-45-matthew.d.roper@intel.com>
 <20240910234719.3335472-88-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240910234719.3335472-88-matthew.d.roper@intel.com>
X-ClientProxiedBy: MW4P223CA0011.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::16) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|PH8PR11MB7967:EE_
X-MS-Office365-Filtering-Correlation-Id: b9874b9e-c1c2-43b3-f06b-08dcd2a146af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?EY0IjQtgFpRkfqmC1TqK4XcH0BsIjqg8tVrwXE4AAxPrhvcsH40NSIdUbuDp?=
 =?us-ascii?Q?KeRUSB0E1u2qNfC3MRllde7EGbu7UwC/6OY+FZeFuuac8rfJTHCrgdNdp4jl?=
 =?us-ascii?Q?osPzCqi5QtuJZco189C9cJadx9E1dUHbEIG3g4ATvtkHJDOuu2hvpH1BBnCz?=
 =?us-ascii?Q?e6fE2RJwSVlmfpGSw1/hHwCfgWPAkN4x4W1o8N+g7102lTO6j+bAGTVb+Ywf?=
 =?us-ascii?Q?V448a9FQVsTRVpDkNtNW+w9HFweeOMVzjxXmB11LtjQfhCLS7MpdOvoTgKTD?=
 =?us-ascii?Q?26Bss5J/DOUq0/mGXcma6r4yRlNFP+Z+AMp2lp/89OeI1ybUGZ5Ct1EvaF2K?=
 =?us-ascii?Q?1Pklb3M/T2NlfOsfEf6eYcu57kBwjmwIsvq+/KfJFvNUYsy9HVTZZREq7Ewj?=
 =?us-ascii?Q?GLP6ik+oK2RbeSBIGjXxzSIbnINU4MIEYC6GSGSvABFRbcOo4k/x0hj8ZMLK?=
 =?us-ascii?Q?pxhv/7VN1iwGz40RSP5cuLMTqIbItHWU/Y64/qmJlGo1UnaM6wjnrNhq5QcI?=
 =?us-ascii?Q?b01tNMHNjN6Xvv5B3PQAwyC+eSFqip14H2ukhCX1zvw4YKC76O5f2CY4ePIR?=
 =?us-ascii?Q?9qy1bwjglQLUjY1RGlHH2lo7llo13FzObDKvF6YN8mqtIho8GIVspK4VMeEw?=
 =?us-ascii?Q?cWhF5KBfpu+KrSq3zc7m+qSFF8q3qTlKQIQrXq+6DhwYCtZicXOaU+xUVKEA?=
 =?us-ascii?Q?1NzuIvzE3LD7NCRaftjilnKpIuyvCEpv5AAWj5OIo+ltA6ANV5L+kihq3edE?=
 =?us-ascii?Q?rnyb2u7JNvNElhHw7EUmuaa2IuaOz3Qe87WlJncxFQpW4z4xCJ9Ty2JCJ3sO?=
 =?us-ascii?Q?3iEcQF9ameljssw9tNEq5GfC8kBTNa13FLuWi88x4BoJsveoapaOXWBml3zt?=
 =?us-ascii?Q?H9hCIlzeCgw2giQrKUX+iMYcWC+ZzJvBch+YGNqhU52wJmzq9XAOu686eAAP?=
 =?us-ascii?Q?bmF4lc75Ll52832HDUFo0cb/iOvHKhwV8HBwXej2K5bfRem+s6L8nh92AzIU?=
 =?us-ascii?Q?sQztMjGtvMNJDtKqOpOIRp2OwpQTOpGURt4zvNOq1GZopkgLsvLPe7WoSZjc?=
 =?us-ascii?Q?8/gAvFjsTsnPvGu0nJleuL3PB2uKl86cqoNO7yHbnR+8ZX7BdYnTmM1NgSep?=
 =?us-ascii?Q?0RIJG/y87fpKauH2t53cew75cWOUXOvC1ZJfL1QV9kBodkBgXZnjLDmorzwZ?=
 =?us-ascii?Q?yVZBZTZhtKtMWFdcRDu7wlcLhXuFUj/TBeGrKfuGoXtOSlW9q/OK1IPbzMUP?=
 =?us-ascii?Q?Hzo916LyP+EmTFLRF7486r3Db+NRBkbhs/1RY2ZhgRDmeniuzKBl2PVTKOcs?=
 =?us-ascii?Q?0ft0hKhSItl675CHhGMNZ853uICuhT2Tn2lRw7siZwFcGg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YuQ4mNN5ewYqgLNoEj+Lxf/v403uoMOZeMATjqpsC0ah7H/9IlhngZmfQ9I7?=
 =?us-ascii?Q?rI8S+QOET1ckjVp25PstvCYv8Ie+TI2+mO/A6veTbPZ/Cy9u0JUodZtO6FXY?=
 =?us-ascii?Q?zq4N7zImfoW6FHgV1xKIHchKW7NcSyV6wUWU+BUwtJh4B5KJGusLEEPMm7FE?=
 =?us-ascii?Q?ypYodEJhJQ3DtK4ft4aZ8kCjt8fJlff0+a6T/wkKfoRL0LWM4qFz3j8NvIna?=
 =?us-ascii?Q?sw+iqytfHSaTgEKCoTjqvRAHsM6IN5Gk7qsRP3pRnlLYpoOt2sN7l6pJ1A46?=
 =?us-ascii?Q?VNRFbUH9KTV1aeENUkj4lrGly7fu2amXzH+xcOYNeTj+cckzm+U4N1BI6FUZ?=
 =?us-ascii?Q?Cw9g6RzewnscxKfr4B2VZtW7fFe4LUqseVCAmqNqN04x5+8VeBqtwAXcre+s?=
 =?us-ascii?Q?hWR0rEmrrjGbnm6ncAk+dHB6I65bz6ay1OkzjPtQA83148sHu5WFJ65WjBDn?=
 =?us-ascii?Q?r7af0G3sc+cEk8FRvKClyni8op3Rv4o18e1SGE2ihvK9L3utBWyNqLlFx8jt?=
 =?us-ascii?Q?MF8BM/NjSg+RQtq60MGw4pz03nDRWT9LgrfTtSehyyt5kZIjh9E0T+yt7ixL?=
 =?us-ascii?Q?jAGmzfSf3GLbZeXvUI2Sk+fHDPHmvSdfqN45Vqsp9EmOGP3XLsc5We+EIHkv?=
 =?us-ascii?Q?q0weYJdGLq++XeElsULalar/lbp9aGIeIKQQ674Dqu6cplPVxBAaxy77hEhI?=
 =?us-ascii?Q?wv601QN1f8HKdn/d5UTWUqPlUTjgFmLdbxYaJstbhiE3QhOhja2JPOqKF+1V?=
 =?us-ascii?Q?R+/dtxekTgeLHrzYCoqqFyMf3xJ+7a/jTdEXJD/UNS1+92xLlHFj2Bqxkk5G?=
 =?us-ascii?Q?LHrpxbNVkKOUhRDLdVrzC+ZEWDESscD5rZhP1Vqr24vCxkqUCgi17qrTkDfs?=
 =?us-ascii?Q?JRC/8RnFeU09Ce7NCRoKXQXH3CLTepya08Qzgeg8DjVjFqn8XX83RoKV666i?=
 =?us-ascii?Q?CxJt7ocY3gOm8125iEQ5v9C1/hQJUtHdCKm4zjNhJBSaUdRY6dje6s0/rZsN?=
 =?us-ascii?Q?5/nC878nT5OZgeL7gw/MiBtHrYzKEeqHG6DGK6Lycra/bWzELtUYA3NN7YsC?=
 =?us-ascii?Q?M8krfO50sTDhcH68c1O8Q0lpDof1P7Qyu6f9nIE+M0LzHqLM2N5kJHPNylba?=
 =?us-ascii?Q?9EkXkwOHGMUCAyi0aAhjZbwIA93mcNmIn+kkJDO+iUICNJerRfO/gbJ5UETB?=
 =?us-ascii?Q?FcApl8ts3U8+4+8eu9B9NRNg3qq/qWnM+wdMfe1F97o7ipOz/tCHm4Po5U+m?=
 =?us-ascii?Q?d17VTiNogEJVNp6ghxqZ/oEG6xnp6ozgn0MlQPbI2TwHlRoOl8f5w/fmhV3N?=
 =?us-ascii?Q?PMR8ue6MGkoNj7ltwd1bDElJByKv4RQ82LveH/u8V0t0OM5nfrZ9uYeIR7a9?=
 =?us-ascii?Q?0KYdUet3xXJFYG+ihgLk4dvp0dPWDvXRp99cOGu6V3EOrEU8hQnjDzCK3tun?=
 =?us-ascii?Q?5GLMmuGzAhLDAtNsdNr/LRkEP/yRNcAiOh7Elqe6SLLkp/PTt/+CNjfYQdtG?=
 =?us-ascii?Q?SLwswYj0umbUA4Sbq4jvg0mMn4SLGZNWy5KHmaze7H4YkM6u6CYgCfFLARdg?=
 =?us-ascii?Q?GAMAhobi0ANFajlyRJs1pasg8qveSd/V8/wXmzcMCO9cqenV8qAKtnCkwcp6?=
 =?us-ascii?Q?yg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b9874b9e-c1c2-43b3-f06b-08dcd2a146af
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 20:35:30.0063 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q9rJ5wzlpg+nTu95VZyqByKwY1R+7Nc0kUj3a0CZ4e1Y6Y35lbNMIHYZr1JmRQikdrovshSKyO9JF5bTTFGWLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7967
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

On Tue, Sep 10, 2024 at 04:48:03PM -0700, Matt Roper wrote:
> Now that all parts of the driver have switched over to using xe_mmio for
> direct register access, we can drop the compatibility macros that allow
> continued xe_gt usage.
> 
> v2:
>  - Move removal of 8/16-bit read and xe_mmio_wait32_not() wrappers to
>    this patch rather than removing them in earlier patches when last
>    caller was removed.  (Rodrigo)

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_mmio.c | 38 ++++++++++----------
>  drivers/gpu/drm/xe/xe_mmio.h | 67 ++++++++----------------------------
>  2 files changed, 34 insertions(+), 71 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index 392105ba8311..a48f239cad1c 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -199,7 +199,7 @@ static void mmio_flush_pending_writes(struct xe_mmio *mmio)
>  		writel(0, mmio->regs + DUMMY_REG_OFFSET);
>  }
>  
> -u8 __xe_mmio_read8(struct xe_mmio *mmio, struct xe_reg reg)
> +u8 xe_mmio_read8(struct xe_mmio *mmio, struct xe_reg reg)
>  {
>  	u32 addr = xe_mmio_adjusted_addr(mmio, reg.addr);
>  	u8 val;
> @@ -213,7 +213,7 @@ u8 __xe_mmio_read8(struct xe_mmio *mmio, struct xe_reg reg)
>  	return val;
>  }
>  
> -u16 __xe_mmio_read16(struct xe_mmio *mmio, struct xe_reg reg)
> +u16 xe_mmio_read16(struct xe_mmio *mmio, struct xe_reg reg)
>  {
>  	u32 addr = xe_mmio_adjusted_addr(mmio, reg.addr);
>  	u16 val;
> @@ -227,7 +227,7 @@ u16 __xe_mmio_read16(struct xe_mmio *mmio, struct xe_reg reg)
>  	return val;
>  }
>  
> -void __xe_mmio_write32(struct xe_mmio *mmio, struct xe_reg reg, u32 val)
> +void xe_mmio_write32(struct xe_mmio *mmio, struct xe_reg reg, u32 val)
>  {
>  	u32 addr = xe_mmio_adjusted_addr(mmio, reg.addr);
>  
> @@ -239,7 +239,7 @@ void __xe_mmio_write32(struct xe_mmio *mmio, struct xe_reg reg, u32 val)
>  		writel(val, mmio->regs + addr);
>  }
>  
> -u32 __xe_mmio_read32(struct xe_mmio *mmio, struct xe_reg reg)
> +u32 xe_mmio_read32(struct xe_mmio *mmio, struct xe_reg reg)
>  {
>  	u32 addr = xe_mmio_adjusted_addr(mmio, reg.addr);
>  	u32 val;
> @@ -257,7 +257,7 @@ u32 __xe_mmio_read32(struct xe_mmio *mmio, struct xe_reg reg)
>  	return val;
>  }
>  
> -u32 __xe_mmio_rmw32(struct xe_mmio *mmio, struct xe_reg reg, u32 clr, u32 set)
> +u32 xe_mmio_rmw32(struct xe_mmio *mmio, struct xe_reg reg, u32 clr, u32 set)
>  {
>  	u32 old, reg_val;
>  
> @@ -268,8 +268,8 @@ u32 __xe_mmio_rmw32(struct xe_mmio *mmio, struct xe_reg reg, u32 clr, u32 set)
>  	return old;
>  }
>  
> -int __xe_mmio_write32_and_verify(struct xe_mmio *mmio,
> -				 struct xe_reg reg, u32 val, u32 mask, u32 eval)
> +int xe_mmio_write32_and_verify(struct xe_mmio *mmio,
> +			       struct xe_reg reg, u32 val, u32 mask, u32 eval)
>  {
>  	u32 reg_val;
>  
> @@ -279,9 +279,9 @@ int __xe_mmio_write32_and_verify(struct xe_mmio *mmio,
>  	return (reg_val & mask) != eval ? -EINVAL : 0;
>  }
>  
> -bool __xe_mmio_in_range(const struct xe_mmio *mmio,
> -			const struct xe_mmio_range *range,
> -			struct xe_reg reg)
> +bool xe_mmio_in_range(const struct xe_mmio *mmio,
> +		      const struct xe_mmio_range *range,
> +		      struct xe_reg reg)
>  {
>  	u32 addr = xe_mmio_adjusted_addr(mmio, reg.addr);
>  
> @@ -310,7 +310,7 @@ bool __xe_mmio_in_range(const struct xe_mmio *mmio,
>   *
>   * Returns the value of the 64-bit register.
>   */
> -u64 __xe_mmio_read64_2x32(struct xe_mmio *mmio, struct xe_reg reg)
> +u64 xe_mmio_read64_2x32(struct xe_mmio *mmio, struct xe_reg reg)
>  {
>  	struct xe_reg reg_udw = { .addr = reg.addr + 0x4 };
>  	u32 ldw, udw, oldudw, retries;
> @@ -338,8 +338,8 @@ u64 __xe_mmio_read64_2x32(struct xe_mmio *mmio, struct xe_reg reg)
>  	return (u64)udw << 32 | ldw;
>  }
>  
> -static int ____xe_mmio_wait32(struct xe_mmio *mmio, struct xe_reg reg, u32 mask, u32 val, u32 timeout_us,
> -			      u32 *out_val, bool atomic, bool expect_match)
> +static int __xe_mmio_wait32(struct xe_mmio *mmio, struct xe_reg reg, u32 mask, u32 val, u32 timeout_us,
> +			    u32 *out_val, bool atomic, bool expect_match)
>  {
>  	ktime_t cur = ktime_get_raw();
>  	const ktime_t end = ktime_add_us(cur, timeout_us);
> @@ -410,10 +410,10 @@ static int ____xe_mmio_wait32(struct xe_mmio *mmio, struct xe_reg reg, u32 mask,
>   * @timeout_us for different reasons, specially in non-atomic contexts. Thus,
>   * it is possible that this function succeeds even after @timeout_us has passed.
>   */
> -int __xe_mmio_wait32(struct xe_mmio *mmio, struct xe_reg reg, u32 mask, u32 val, u32 timeout_us,
> -		     u32 *out_val, bool atomic)
> +int xe_mmio_wait32(struct xe_mmio *mmio, struct xe_reg reg, u32 mask, u32 val, u32 timeout_us,
> +		   u32 *out_val, bool atomic)
>  {
> -	return ____xe_mmio_wait32(mmio, reg, mask, val, timeout_us, out_val, atomic, true);
> +	return __xe_mmio_wait32(mmio, reg, mask, val, timeout_us, out_val, atomic, true);
>  }
>  
>  /**
> @@ -429,8 +429,8 @@ int __xe_mmio_wait32(struct xe_mmio *mmio, struct xe_reg reg, u32 mask, u32 val,
>   * This function works exactly like xe_mmio_wait32() with the exception that
>   * @val is expected not to be matched.
>   */
> -int __xe_mmio_wait32_not(struct xe_mmio *mmio, struct xe_reg reg, u32 mask, u32 val, u32 timeout_us,
> -			 u32 *out_val, bool atomic)
> +int xe_mmio_wait32_not(struct xe_mmio *mmio, struct xe_reg reg, u32 mask, u32 val, u32 timeout_us,
> +		       u32 *out_val, bool atomic)
>  {
> -	return ____xe_mmio_wait32(mmio, reg, mask, val, timeout_us, out_val, atomic, false);
> +	return __xe_mmio_wait32(mmio, reg, mask, val, timeout_us, out_val, atomic, false);
>  }
> diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
> index ac6846447c52..8a46f4006a84 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.h
> +++ b/drivers/gpu/drm/xe/xe_mmio.h
> @@ -14,63 +14,26 @@ struct xe_reg;
>  int xe_mmio_init(struct xe_device *xe);
>  int xe_mmio_probe_tiles(struct xe_device *xe);
>  
> -/*
> - * Temporary transition helper for xe_gt -> xe_mmio conversion.  Allows
> - * continued usage of xe_gt as a parameter to MMIO operations which now
> - * take an xe_mmio structure instead.  Will be removed once the driver-wide
> - * conversion is complete.
> - */
> -#define __to_xe_mmio(ptr) \
> -	_Generic(ptr, \
> -		 const struct xe_gt *: (&((const struct xe_gt *)(ptr))->mmio), \
> -		 struct xe_gt *: (&((struct xe_gt *)(ptr))->mmio), \
> -		 const struct xe_mmio *: (ptr), \
> -		 struct xe_mmio *: (ptr))
> -
> -u8 __xe_mmio_read8(struct xe_mmio *mmio, struct xe_reg reg);
> -#define xe_mmio_read8(p, reg) __xe_mmio_read8(__to_xe_mmio(p), reg)
> -
> -u16 __xe_mmio_read16(struct xe_mmio *mmio, struct xe_reg reg);
> -#define xe_mmio_read16(p, reg) __xe_mmio_read16(__to_xe_mmio(p), reg)
> -
> -void __xe_mmio_write32(struct xe_mmio *mmio, struct xe_reg reg, u32 val);
> -#define xe_mmio_write32(p, reg, val) __xe_mmio_write32(__to_xe_mmio(p), reg, val)
> -
> -u32 __xe_mmio_read32(struct xe_mmio *mmio, struct xe_reg reg);
> -#define xe_mmio_read32(p, reg) __xe_mmio_read32(__to_xe_mmio(p), reg)
> -
> -u32 __xe_mmio_rmw32(struct xe_mmio *mmio, struct xe_reg reg, u32 clr, u32 set);
> -#define xe_mmio_rmw32(p, reg, clr, set) __xe_mmio_rmw32(__to_xe_mmio(p), reg, clr, set)
> -
> -int __xe_mmio_write32_and_verify(struct xe_mmio *mmio, struct xe_reg reg,
> -				 u32 val, u32 mask, u32 eval);
> -#define xe_mmio_write32_and_verify(p, reg, val, mask, eval) \
> -	__xe_mmio_write32_and_verify(__to_xe_mmio(p), reg, val, mask, eval)
> -
> -bool __xe_mmio_in_range(const struct xe_mmio *mmio,
> -			const struct xe_mmio_range *range, struct xe_reg reg);
> -#define xe_mmio_in_range(p, range, reg) __xe_mmio_in_range(__to_xe_mmio(p), range, reg)
> -
> -u64 __xe_mmio_read64_2x32(struct xe_mmio *mmio, struct xe_reg reg);
> -#define xe_mmio_read64_2x32(p, reg) __xe_mmio_read64_2x32(__to_xe_mmio(p), reg)
> -
> -int __xe_mmio_wait32(struct xe_mmio *mmio, struct xe_reg reg, u32 mask, u32 val,
> -		     u32 timeout_us, u32 *out_val, bool atomic);
> -#define xe_mmio_wait32(p, reg, mask, val, timeout_us, out_val, atomic) \
> -	__xe_mmio_wait32(__to_xe_mmio(p), reg, mask, val, timeout_us, out_val, atomic)
> -
> -int __xe_mmio_wait32_not(struct xe_mmio *mmio, struct xe_reg reg, u32 mask,
> -			 u32 val, u32 timeout_us, u32 *out_val, bool atomic);
> -#define xe_mmio_wait32_not(p, reg, mask, val, timeout_us, out_val, atomic) \
> -	__xe_mmio_wait32_not(__to_xe_mmio(p), reg, mask, val, timeout_us, out_val, atomic)
> -
> -static inline u32 __xe_mmio_adjusted_addr(const struct xe_mmio *mmio, u32 addr)
> +u8 xe_mmio_read8(struct xe_mmio *mmio, struct xe_reg reg);
> +u16 xe_mmio_read16(struct xe_mmio *mmio, struct xe_reg reg);
> +void xe_mmio_write32(struct xe_mmio *mmio, struct xe_reg reg, u32 val);
> +u32 xe_mmio_read32(struct xe_mmio *mmio, struct xe_reg reg);
> +u32 xe_mmio_rmw32(struct xe_mmio *mmio, struct xe_reg reg, u32 clr, u32 set);
> +int xe_mmio_write32_and_verify(struct xe_mmio *mmio, struct xe_reg reg, u32 val, u32 mask, u32 eval);
> +bool xe_mmio_in_range(const struct xe_mmio *mmio, const struct xe_mmio_range *range, struct xe_reg reg);
> +
> +u64 xe_mmio_read64_2x32(struct xe_mmio *mmio, struct xe_reg reg);
> +int xe_mmio_wait32(struct xe_mmio *mmio, struct xe_reg reg, u32 mask, u32 val,
> +		   u32 timeout_us, u32 *out_val, bool atomic);
> +int xe_mmio_wait32_not(struct xe_mmio *mmio, struct xe_reg reg, u32 mask,
> +		       u32 val, u32 timeout_us, u32 *out_val, bool atomic);
> +
> +static inline u32 xe_mmio_adjusted_addr(const struct xe_mmio *mmio, u32 addr)
>  {
>  	if (addr < mmio->adj_limit)
>  		addr += mmio->adj_offset;
>  	return addr;
>  }
> -#define xe_mmio_adjusted_addr(p, addr) __xe_mmio_adjusted_addr(__to_xe_mmio(p), addr)
>  
>  static inline struct xe_mmio *xe_root_tile_mmio(struct xe_device *xe)
>  {
> -- 
> 2.45.2
> 

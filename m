Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59248C3DA41
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jul 2024 15:30:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 298DB10E58F;
	Tue,  9 Jul 2024 15:30:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I+mNQqxS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15FA210E58F
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jul 2024 15:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720539024; x=1752075024;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=jHPe3r9vN2tVbYOYBdMb3nudQnBgG4II1aQs2aIZU8w=;
 b=I+mNQqxSyA3lX7FT4AMe4oRxBH0KCVdOv4Y9XPzNf9tw1dkYbKgjkcmz
 0Qbg2SrXxFDJkz6jpBkVjs3aCVoSgeQ7qsf/opZ0wiP/1SXI3d5pqTl4s
 FEFFdn/Epmx68KVfY33h6iovg5zVeJyYiuQOvcdZoyG+akbey7O3tytOp
 15tNQRrpbrIR8fl5YBU3zZTxIgm/Y6Xvhf2Vy+eaDWFE2PKfmU01MWhwp
 1j4ct9vf4GgHUNCVj2K/q762WHgehb1hqNx8kx8+kSPETxTsmq1EtoCr7
 9c2ZS22t9gUCOa+2N5IozZPB1p3epP93x8pOsHoQ/JI7Nkcu6YMGVwjB7 Q==;
X-CSE-ConnectionGUID: cQ2esUR9TSu64Ppnj71biw==
X-CSE-MsgGUID: dgVlnYQ1Seu/AGqitOtz8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11128"; a="35339922"
X-IronPort-AV: E=Sophos;i="6.09,195,1716274800"; d="scan'208";a="35339922"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2024 08:30:23 -0700
X-CSE-ConnectionGUID: BpyGJxGaTk2/5KPbOGnweQ==
X-CSE-MsgGUID: Df+rNsO9Q/2vF1xoBqZB5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,195,1716274800"; d="scan'208";a="48334636"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Jul 2024 08:30:23 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 9 Jul 2024 08:30:22 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 9 Jul 2024 08:30:22 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.172)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 9 Jul 2024 08:30:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PnT+50OIUELyijAk1vUmAqGwG2GFD/kpFVFW/FzTezPBStjNU/jKYKpwQacbEbMLmTcw5SsxmvK6IvyXQceu4BUZOmefXM31m7SGJT7CsquWDhd0wFbwBfiKJdXbFtGl0agDSXfYgwHGRIqzly/sTFavDxRi4gfMvRmmYvI6xVE5ioTE6DHccZ96vvNEt0pbEhju8NYRJXovXVX1nm9xgwI8416/haubPa+PZ4lePy4Ct0qsazEfCzxXAqEHNDLJSsKHi3oAv2yJGxH0oMeQGzzqdFEStO7ijwDSbPEm5X5u2jfPUqWI+wp+PJuP/dqGSxrfZrthzIu0Vi2p75b3Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3JHVasll4/dDTa7NEzXC8douaTn/0XCEUwBehZNhk+Q=;
 b=bP4ehRgIrJEk1kNKTM8E7uZ8pTxZ2QC8AGdg/NCDNZkujV9D4d38TcDVS7N48waS2S4WWvF1TRT19F8b88M4mHBBZ9SuC6WvO5+CUmRTHwfk16VIUpUwwIexfa9W9yctcOaOpGnDjDVdXiCUrpfpo28RQHMm59YhSADLpZLwM5EBdTso4bryxiT9LH5IHVYwEN6lmNccV3cshxxbIgJ8fJmPxNRt1uOktuGZDpkZ9sqwqHXsidJcjK47uF0IoNVEVH6JH6bZgVvAqr38I0lHVzjEB6nU6aZez0rhTGpaqSZ3U3O1Z1OjgtQnawmnarkZ89qBPULF7aD1d66HsQdZ2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CY8PR11MB7291.namprd11.prod.outlook.com (2603:10b6:930:9b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.20; Tue, 9 Jul
 2024 15:30:18 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%3]) with mapi id 15.20.7741.033; Tue, 9 Jul 2024
 15:30:18 +0000
Date: Tue, 9 Jul 2024 08:30:16 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH V4] drm/xe/xe2: Add Wa_15015404425
Message-ID: <20240709153016.GP2906448@mdroper-desk1.amr.corp.intel.com>
References: <20240709114340.2987173-1-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240709114340.2987173-1-tejas.upadhyay@intel.com>
X-ClientProxiedBy: SJ0PR13CA0153.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::8) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CY8PR11MB7291:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bd2a05c-708e-4c61-2841-08dca02c0a09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1Zq9BVQet/zbfHwJaFgk/1nCiBwW0fI4vFreuwpIdm/OI/1LH54x5nErH0FH?=
 =?us-ascii?Q?7LxxKMF7I9H9U/QUWFZihpwa93svz+J3TTELtXYIXqFLbT7LN62za4k6Kjwu?=
 =?us-ascii?Q?Xl9A9Lr75nPzAXm+pdoXxAm478wd3QBNiha4OuoRDOW165JkW6EPmCbvqFNh?=
 =?us-ascii?Q?lT7iUoV7gF3UFQcK9WpUmfWfC7X+UPmtbXwT6JTenhqsEgDKffSusPr4UbS1?=
 =?us-ascii?Q?mFwD6t/8BqUNjheEg3rcBzpbQOU2uCCl2qrN3VIjpz2+MMxf1yHS2n2SO7km?=
 =?us-ascii?Q?awJxoMoSS6JrxhSh5MhVels+ai0ZODlf2aOzipdgLkHBo1ET3qrtq226krvD?=
 =?us-ascii?Q?8h1x8pG1YTekNGRUKpS2CI/VXNpWxdlCQexoHvC8/r9GR+ia69uJcpgxpplE?=
 =?us-ascii?Q?UAzHJEPa0CVKpdiOL0zt0xjP205ONVhkhiQAs1qUP/se9MiyDUclukLRnSQ+?=
 =?us-ascii?Q?U5KpOWq4YuTdrxJVwFYYvvt9WSYHeDnGqbtBAxGRV/n9VhHteDKZcpAgZSsE?=
 =?us-ascii?Q?1AwWj/EqsiGy26ksoHIr25F7GL2B7VPnySTEWOxZ1ECSS1mgu3Lhf7Y+gQZm?=
 =?us-ascii?Q?/svg9I+TOhZX0bXgmjrqOKstSwIwChiu8Nck2CzdAE4kwkR/A70eyjP5qtnX?=
 =?us-ascii?Q?F+sEusI14DKSL0lBZ7zEf2YOkTa8OVbQ7YIrrppziny2XqZ5d4/WMchGrTyU?=
 =?us-ascii?Q?k4VD0/4TNNrkcNklAL628F/XnyxSp+wKiy7PpzBTon8OYFKyNzFq2cCKdEg1?=
 =?us-ascii?Q?hM732Bz2EfN9v8NmgmlZBezNbDq/2f4JuX1XjRHCx5PRo8IhJ4ODVIuTqwHl?=
 =?us-ascii?Q?n6E3ylZOjLAqaBLfSqQZL+dbumWOcLFot7zxJiL4M+v0hNCyn8ixq6JxffLY?=
 =?us-ascii?Q?BNQTGsNCz+x+NexQWzMyew/PPqVvZ3sYyQFqP052uNozoLMnpF7y1zh/vqUO?=
 =?us-ascii?Q?L2ifwcqM9pfo3W3MNszID8xC/4BZQ1aTWCM9YehpTs0sKlZH0z+uT+4QVpWA?=
 =?us-ascii?Q?SSx0c0SkEtn/zw8T2jUbPz2A7j9xlli3MV0UTLaR70pZOuvdocQ5cfXEhgaD?=
 =?us-ascii?Q?gYKgbKHyOCJ5a5q7vS2gsx2ZKn64lCJtVEEPBfvo+hRlQilTyBLk9FKEc2r9?=
 =?us-ascii?Q?4fRw1LWbfBInrPWWfVT1v5OiEV8v99Tgt6DtKFCkHIAmHWvTKl5Hzs2yfQid?=
 =?us-ascii?Q?rBFRo7dUCwohG95cxqSN+tT74YFI23Xhs8seqPHNwTFJp98tszjpHc3HJojD?=
 =?us-ascii?Q?6MxEr/OfMPITzp/+m1GVEDwmzJJa0RC/SW/R73goTJgGdTqRlxObLwD7qkCb?=
 =?us-ascii?Q?YYe57F5v4lwrNIfvJMQ2m09stfEiLOLIURZMuGOnP01wgA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NURfoUNGQHYcoTnkJLLFwhtPXXhLpoEehAAwNV5I7PVGUh26EO95bYNEjJe9?=
 =?us-ascii?Q?oHEH2elCdt63sTf7d2qqpyfJcrwmxcM8iI8X5f9uZ1/PDilSMTBrhpZRSinW?=
 =?us-ascii?Q?S5L874oFXZHodMSZVP8nExb33znXjKea4LHn1g9veEmz7ps52ET4nI0dE2M2?=
 =?us-ascii?Q?TmiDlbSJgwdSP+i0dQ6Zc+okBI7zID2+YOfMEkxzZl4v7FOHlpIUeKCv5pRW?=
 =?us-ascii?Q?nZgwL06cKxXgBZcQdYTkeoMqiIXl7c9CG3rHIRjZtiofz4t70K3UJ2fWMYGp?=
 =?us-ascii?Q?5PXxj7DzB4lwNYTnKpBJdgcJHUuhmUdc/0PXC2Vlhc+8ipe6ECjXvRfvluth?=
 =?us-ascii?Q?XocNOHlqWbG+iN/JbosQgwMsc/MtgfFoRnRniHeuYrzokFlSBYhZ6Uj6vVbl?=
 =?us-ascii?Q?eTEiLS4LPRmjy+Z8KIUOU+XXweRK0zX29PQTIpJd70eKhrqlUCBLU3zRzKhB?=
 =?us-ascii?Q?VEwO1O4ARGPd4LWEjONRqqdf117iaqMiDer29vtqEVFng5v80Ns5hFUHxP9M?=
 =?us-ascii?Q?aTdFuWVsAp2nP1LqKOcL5SiNBcPcx6bUvJ4UqvlpCbTUy9cEVamOCLS96X90?=
 =?us-ascii?Q?MKoXrupWhu96H+xc4L7ANpbdVQe7Ppm14fabwuRzN51Bc3VFgXTwyuV6E4eU?=
 =?us-ascii?Q?9kd9dVQ79YjdcyW3P/Ea+bOQ/rIxxD2ByUBLDvKhrWBy1p4XM0quMjw46h15?=
 =?us-ascii?Q?UMqBBLo6rKtvnkxMv1F0cG1SPc1Z8OqosmvJrk2NXM9TEl5nNEzii45jIQrq?=
 =?us-ascii?Q?+rAO3siUjsDZ+4MFSRo4mKC1fvY9mJCFqrvYn3n2ELD3VWLn6CymzoZZKybW?=
 =?us-ascii?Q?26jd8e5FOczDRnw8Gu4oIpqDmvI7n5keoAM5T9wkpmYkuynqFEJztgi+6Fx3?=
 =?us-ascii?Q?pP+EI7RFSSKqBxqBBVhoMgdKNcmiy8pL/IIStTQueEqE937y18qaAbanj5VX?=
 =?us-ascii?Q?D/nYYcPi+euuuz9RwwmOCwGne1be5Ty3zqLT39fwOE9Tpv2cS4vkue05+f1u?=
 =?us-ascii?Q?TL2f29GlLlcEbcqHAFj4ilh45LgOoNT++UopS9+sp3Us9D6kQxcJC3xlK406?=
 =?us-ascii?Q?RFhTM7gKxKyi0BfR77mdNyMy8XGFmUpWWThskDjaT3D2gD2/ecGOrA7NAtlb?=
 =?us-ascii?Q?6kocicqLaNc/1BFycyqyXqw/RMK6TEErU3Il2gtPe+rPVKCVbPuPfbp86Yd0?=
 =?us-ascii?Q?De/vPeqZmn4ReWeHqGuu1Zdm3RDmLyHVO0cNZpJkA4R9mQa6Ao6ya6CWrTgF?=
 =?us-ascii?Q?Rqm17awX2guw9f/aAscZJbklpjQuuR6c+VC9Y83tBT3/QKs2Qv85UqSLLAtQ?=
 =?us-ascii?Q?qWlUCyKy5frsqrZF/OKuWKv++wy2ej5wUbZElLzP1xJRFTzJRYzyP9Tm2wDr?=
 =?us-ascii?Q?W7Xf2PGXXDE+n5vwifUc/4ouRXgDEFy/K36tEHtp9Wo+2fxjspd7ZFnjPgD8?=
 =?us-ascii?Q?HIiXe07Emm1IItn9QqNfBSFkVr5x6eHyzMmZgxjF8TFDJrT7epNRP9aU+CaP?=
 =?us-ascii?Q?VwH+Aolat8aAkYMpQFn28v1kYJ+7qARzp4Vs7Baho9lzuE6aIuIM63DEWZ4S?=
 =?us-ascii?Q?+hRLiyphnLkfixsqF5FT5BkBTr1rjEH2pMWdx+k9JiGLojBPu/Q0sss61lOe?=
 =?us-ascii?Q?SQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bd2a05c-708e-4c61-2841-08dca02c0a09
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2024 15:30:18.8426 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5A8X1pM/rE4dUpVY67YDRK2RR7FmEWar2amDSVMiOhr90Un51Y+vYdPuCZ9Olc8KBphRVokdeCbDSziwCfT2GSIFHtAdAszowfYmu31qpKM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7291
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

On Tue, Jul 09, 2024 at 05:13:40PM +0530, Tejas Upadhyay wrote:
> Wa_15015404425 asks us to perform four "dummy" writes to a
> non-existent register offset before every real register read.
> Although the specific offset of the writes doesn't directly
> matter, the workaround suggests offset 0x130030 as a good target
> so that these writes will be easy to recognize and filter out in
> debugging traces.
> 
> V4(MattR):
>   - Use writel and remove xe_reg usage
> V3(MattR):
>   - Define dummy reg local to function
>   - Avoid tracing dummy writes
>   - Update commit message
> V2:
>   - Add WA to 8/16/32bit reads also - MattR
>   - Corrected dummy reg address - MattR
>   - Use for loop to avoid mental pause - JaniN
> 
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_mmio.c | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index f92faad4b96d..2b3ae4253521 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -121,12 +121,29 @@ int xe_mmio_init(struct xe_device *xe)
>  	return devm_add_action_or_reset(xe->drm.dev, mmio_fini, xe);
>  }
>  
> +static void mmio_flush_pending_writes(struct xe_gt *gt)
> +{
> +#define DUMMY_REG_OFFSET	0x130030
> +	struct xe_tile *tile = gt_to_tile(gt);
> +	int i;
> +
> +	if (!(tile->xe->info.platform == XE_LUNARLAKE))

Nitpick:  it's probably better to use "!=" rather than negating an
equality comparison.  Aside from that,

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> +		return;
> +
> +	/* 4 dummy writes */
> +	for (i = 0; i < 4; i++)
> +		writel(0, tile->mmio.regs + DUMMY_REG_OFFSET);
> +}
> +
>  u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg reg)
>  {
>  	struct xe_tile *tile = gt_to_tile(gt);
>  	u32 addr = xe_mmio_adjusted_addr(gt, reg.addr);
>  	u8 val;
>  
> +	/* Wa_15015404425 */
> +	mmio_flush_pending_writes(gt);
> +
>  	val = readb((reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + addr);
>  	trace_xe_reg_rw(gt, false, addr, val, sizeof(val));
>  
> @@ -139,6 +156,9 @@ u16 xe_mmio_read16(struct xe_gt *gt, struct xe_reg reg)
>  	u32 addr = xe_mmio_adjusted_addr(gt, reg.addr);
>  	u16 val;
>  
> +	/* Wa_15015404425 */
> +	mmio_flush_pending_writes(gt);
> +
>  	val = readw((reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + addr);
>  	trace_xe_reg_rw(gt, false, addr, val, sizeof(val));
>  
> @@ -160,6 +180,9 @@ u32 xe_mmio_read32(struct xe_gt *gt, struct xe_reg reg)
>  	u32 addr = xe_mmio_adjusted_addr(gt, reg.addr);
>  	u32 val;
>  
> +	/* Wa_15015404425 */
> +	mmio_flush_pending_writes(gt);
> +
>  	if (!reg.vf && IS_SRIOV_VF(gt_to_xe(gt)))
>  		val = xe_gt_sriov_vf_read32(gt, reg);
>  	else
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation

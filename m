Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BE2FEE57CF
	for <intel-xe@archiver.kernel.org>; Wed, 11 Sep 2024 20:34:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BCBD10EA9D;
	Wed, 11 Sep 2024 20:34:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FpiEpeu/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 732E610E1AB
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Sep 2024 20:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726086894; x=1757622894;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=t5xFP3ISc0VSVyNZ0H7qB6Wu06KhpJ6tCw4fKRVIyhA=;
 b=FpiEpeu/qVKaB7NGnnE+wzdWFH52zmMXK1dOmoVp4PxP0nWDo1Xwxllf
 QAyA4P9XEsjtd+GwoiqbWEM0KZ4j2UzH3L5NzVd8Q5j/nG8wiQa6fhJjk
 i/JlNZ85/sa07vMlxQCgkNGjaKYoMGsTsnHoZ2sMS+oQJ1KnHXr7euK+3
 UOYsn8Rb+tXyTgpTBNsYAk/d1RyUwcVW5QN1g6O5nhcwkZ11wj0zg+qTE
 rbczvpmCfJFRRb2fTbkxUMq5DHDr/3IvQQp8LIXoRCS+EZAVuBBz2TmXj
 bUNKFVnqDoJ8526c5fUcM6yVoPdG7IEHbH9BoxvVQy/V2xmj/YHXsh2Lg Q==;
X-CSE-ConnectionGUID: fhRzb5HATPm36zgI8IP0KA==
X-CSE-MsgGUID: dbRXsVGaRTa+zcZevAZpaw==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="36047455"
X-IronPort-AV: E=Sophos;i="6.10,221,1719903600"; d="scan'208";a="36047455"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2024 13:34:53 -0700
X-CSE-ConnectionGUID: 1mWCx6S0SDyO+XMzxEp1dA==
X-CSE-MsgGUID: PwjBfEJRTG2h1tTqOTHzJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,221,1719903600"; d="scan'208";a="90734105"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Sep 2024 13:34:52 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 11 Sep 2024 13:34:52 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 11 Sep 2024 13:34:52 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 11 Sep 2024 13:34:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aJSPrBwUDminfVcPvCRPZqcZiYWTr6KTahRyG60aW9bGCgI9hHS6QmVh1Hakkiel9zmwe6odlcKeSv/xCvDyMNdVLgeX22VmpJrh9aQGW+xjz/hFLPYNCv64w7T8fXsfmxjZuTZmx/JoW+YORRlvDUcZzuAtRZeWYskKT6roipUaUBJnRCWxicSvs4U4uTSiQDFWvTI/Hoij6rHUlVBgfNCCGrKfH6iIfkYxa5jJJOVRO6KOKjiac+qs7i82/vDntkU5mAdB+hnbUCd6B7sc/Dm6TRerrUn/FR0sBpDY08ktoo2LGyij/HfJ37tYUsl0LPT9/s9EFwVFik+Kmz0x8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j0m24eMYf7IeuulM6pTyb0TSS6YIafY4UCDkOJUcqcc=;
 b=ID92Pbpp0IobOm4CRUYNWgKbXnXLQ1aH2uQtNdZMk05MDomMyyWVq8lCGatwlexGal1wAteeQ+Pc0sPWs4glZkeKjA5qBpKydSbFlxdx/ls9MkqSn2S6Meg9Z08o5Pf8ArnONqsptZkiRw/9Z2irwJS51XyJZk66AMEyC89nTz9WUePhBsmfZ6xMts4B4EzWECLYuBQyvlJcKvfceKogsxCPym6ZB/SPoKcfQr9eJb7QBWcjnlwGDlQxR+e2+BQ0alIaXXCTEKMOvKB8tcccHL3Vd21cwdGJepH5LrCcWP6pUT51VClyMTJiQsgLzh1RckQtf1zVIfCXxEN7/SaQDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by PH8PR11MB7967.namprd11.prod.outlook.com (2603:10b6:510:25e::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Wed, 11 Sep
 2024 20:34:48 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7918.024; Wed, 11 Sep 2024
 20:34:47 +0000
Date: Wed, 11 Sep 2024 16:34:41 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3 09/43] drm/xe: Switch MMIO interface to take xe_mmio
 instead of xe_gt
Message-ID: <ZuH-4aZBqPzK-58A@intel.com>
References: <20240910234719.3335472-45-matthew.d.roper@intel.com>
 <20240910234719.3335472-54-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240910234719.3335472-54-matthew.d.roper@intel.com>
X-ClientProxiedBy: MW4PR04CA0140.namprd04.prod.outlook.com
 (2603:10b6:303:84::25) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|PH8PR11MB7967:EE_
X-MS-Office365-Filtering-Correlation-Id: adb09a6f-a76e-4962-7b40-08dcd2a12c1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4m/gUDi1z0IRSGos2QEXv22hv0nAQb/39AzD88HTxUwTRjgENQGhdIUlk9AU?=
 =?us-ascii?Q?f2TpIPOlDeK59CtMcTnh9wDHZQD98U6OiuY7I64pZgEW7Bn5jeoIvb6ZrUwF?=
 =?us-ascii?Q?jhUh3cxkxTbwG08fmiQr/Phtz3n9Wu3xuS6Qtdlj5NqOeUEDIlGPpROVA7cl?=
 =?us-ascii?Q?ue99BjveqWhTblnBjcvlOGe7iXMo3q6oTxBgf5zD8tC+Q8rreMHhoJIK0ISN?=
 =?us-ascii?Q?lWkVMRSJ0XdnLThDSVh4XwfI9yQhPpaA2UMBhnsKmivHaEI4x2V+KgT5gfOZ?=
 =?us-ascii?Q?cpKt+eSnwqzw5D4LwIS7VncwEU+ATtA7Bzf1ukNPddreg3dG+47ZpBfqCVCT?=
 =?us-ascii?Q?bcZzJS0+cK/twe4akNanf7TtOxWE8FkkYNksdZraXWtm91G1VFTCxwQ1O1Nj?=
 =?us-ascii?Q?qYyOOgbb8oCr7qZA9qhYOa4DsJhE/6K0QRGc9+S+F4aOUEMhckMwx+xc23U7?=
 =?us-ascii?Q?ZCmuSeKExQ1NBtNSalHyOgjaKwcarmrrublou/S/g8JCB+7hvZv5XrZ+Wf19?=
 =?us-ascii?Q?WVhQTxbAo1/y21/jdxqmSrTMgKfBNs/EHksgrevRTeQCecGGYdoceMBSon5a?=
 =?us-ascii?Q?QxX4IKMlmGi0tnBHKfU8kjB/vnZZ+mz8BGo0DrcaMaSqWQD9hD2GgOX3EYLV?=
 =?us-ascii?Q?04Z9ZV++svoHxVC3a/Iui9eMXcNqtEgJtJAVScE+wSZw6xdNo/NhNJZv3IXY?=
 =?us-ascii?Q?kxX+pj/Odt74lbPpaXkQfdYfTfWgKC1A0q0uQ0Cxt+VTBa+1CtgUtawjUuV6?=
 =?us-ascii?Q?WDoRYZxqf4qJ7rPmBdRvpcQP4yW0ythbnvPtC/QApppveWZHV8gokQFdNDkh?=
 =?us-ascii?Q?Z89u5CjAEYUmrPZzNrn8clxOwsM9qkhXs94dRVf5LrhYBWHRT26VEBtt2Fbl?=
 =?us-ascii?Q?uYsBQu3M1IMntf1/kcffZD5Sx33w/OJuulB3xvAloeVoU9DJ/3CHd2SPiqTY?=
 =?us-ascii?Q?WLxQMK23oIxztmzmWJ+XnAJgQ49r9YG+mHMzWV+uP1PnASavRiy9OLl3LAiC?=
 =?us-ascii?Q?PMJEsqFrIIK4H1TlfyuYcSmzv0/v5fU52bQ2OFNQhxb9h2b30q7PF5gY/8w/?=
 =?us-ascii?Q?nrax94b14BqCeclyfEeR/jbIjZif+4RdH8n8PQPleF3ot/SX574wXeyzaWiS?=
 =?us-ascii?Q?lMGJFlR16SYbBLUvVZYRuomZW6Hhsa7mOIwQlWK50e4047CE3zc1EWF4gPsk?=
 =?us-ascii?Q?tTM+vC0MdKpMY5fqyl6bvelKHO0ocJzjNGxRgwnsZvgJjSxWoaCaZHjyReHl?=
 =?us-ascii?Q?S3IY1PBB+iV/stDkPQhzPrlf8Qh6Bv4DAhbc6IdzV61R7TdZwI22l21TpkFC?=
 =?us-ascii?Q?T0cLobZk9GgQJyQ9v+X3qoMaWbvZg4ifzWMKTBxCZq+IWg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IuoaGCd7FFyh1E0pcvlnbLa3wGXrypTU7jXop0oZTgPvGJSRXUSbUHxjkVcr?=
 =?us-ascii?Q?QO7MSSW5C7pBvyLQHNu8t9EvxnC3hrFpDwhOND/PR2Ij9hu6gz0Ho/1hixfE?=
 =?us-ascii?Q?owaRRC5+ILmH7bq69GgW1+fck7SlXlI1SOQPdQ6OY1AL6kjHtcojiuZKwXeT?=
 =?us-ascii?Q?UA3TNAqPbgpXP4nB2aRW5uLq8w9Iigec2wjZm1HXA8Ahu30TEel9nB76fNO7?=
 =?us-ascii?Q?J79F6pHgmi4h/4oPaxXDpXjnMrGihRXJZo5wie1rtvxRGjeOZLreZGdC6w8I?=
 =?us-ascii?Q?jl0FK4LzqZqFpxIxBfdUki3xjwtqnQT4QwoYN2Bp/OZeIajhXP5VG2VQ2kQN?=
 =?us-ascii?Q?/nholjh6o0NSG69px43dXMII4oBleCknGDbsC6VoYMjpDwfFX2DCppCHBxQI?=
 =?us-ascii?Q?rdT8CtTKirUy/sCQEhb56lMU23IO9TWtLXBlDlHmtba49mcC4Q8dlMmIDvje?=
 =?us-ascii?Q?XKKsnAIeQmZMcPmngsQn7NcqfH2xh3pwP/UcdqImi9jPpQw4LwMJp8eapUuw?=
 =?us-ascii?Q?d+a9FGxWqCX3zTQFJI4+2RiQ5rWXzh2QDnG0MDgN5Yq3dnUPRxz8xE9wFgmY?=
 =?us-ascii?Q?e/bMLNWidTGLDtlwcqCfh/k3Ou93N2LsZMJgmsLJxGebSGNeXCTTKHLhVjLL?=
 =?us-ascii?Q?UHElTyvaDsm+sobh9NZDVGm5LMTffnXuRm6KPmjOprq6veQ7lh76lMNAPTPY?=
 =?us-ascii?Q?ux9rvi3n4WiT4jdsKBdwYo2MhyWiVGeDFx9Qxm46lXNyygtoKU4oTXagkIAg?=
 =?us-ascii?Q?klmUw90deAjAXnnS4riklPZtq63sC4RJ7U9eRE3uHmUT73k5pWK4crLYf36Y?=
 =?us-ascii?Q?xJqT1c2SC8f3o6nD4p2cHKpBQ+iWutyoR1eoeckOnbyYdtcmPa6uOx/GCntI?=
 =?us-ascii?Q?t2nTTHwjQx2mZkv3j2Ltmt/iUchTtJmRKp16Fjsz4t4Jx9sRrKVwVFDSsMS+?=
 =?us-ascii?Q?viNvPA0EW7pLHFNaLAa72mp64zCbJnZxqMqvSn79sn/h4zkZJ6uT6xTrqPmQ?=
 =?us-ascii?Q?oekLgFGKA8aKmKYYU5oeXOr4dnZKCIYzG3Q6w+EaNeKTvJw7EapykuJpIKCX?=
 =?us-ascii?Q?o0tR6sGnO/P6tQ69VzDeyetDj5QKfZGgHwy3Mfiyb1DveZ2m/rSUUnmVr1PR?=
 =?us-ascii?Q?Ij3rAEVHMzcN9hDSLzQOLAL3ph6tDJPzsxDSa9cXTWTfMCbWm7LwX8li0LeY?=
 =?us-ascii?Q?NjBEji9DwSmRrX9ANCj3rZkyI80essZLCHvaFfEAKvtM7Mn6P/owb/RgJ/3+?=
 =?us-ascii?Q?To33mc64feKp/mEJbwUF/hPieKsO3I+uPBP0qGIyGM+7teRov1N0/ZvFsiK4?=
 =?us-ascii?Q?nBz3m4JKnfWovRlaFGgAf3S93/wHxIVqBGzpxTjtN++J4jj/aHExQbLMgl1x?=
 =?us-ascii?Q?g/DFTkVpMTpkMVsZNV5Rfgdbb6uZ3DGVh55e0ZUE7aPEN3FJXQFthCUoxt4A?=
 =?us-ascii?Q?ATQG2JVn4ScWEtdiEaZfwvL9OtDPHjYYV60+FxMGOrBCurbhv9e8UVBVR7CA?=
 =?us-ascii?Q?QGG+qzbmIaMC6NOk0qSvy5auNpyzsZNenJXFDgqM3JWEabPIDOf6pXHc8lz7?=
 =?us-ascii?Q?TN1U6CKbRQrdvx7BwRC+qMtWfO4NvuYvKgkIwFjugNGIb36TzTw8SU4mWB+f?=
 =?us-ascii?Q?5w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: adb09a6f-a76e-4962-7b40-08dcd2a12c1c
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 20:34:47.8447 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pQJIqePvjbX9u/6moebm+HYylgyd0xDDVRLc2JyBZ8+4E8+OJV4qmvS1/ey63+cIJAyklVEw9mU6vtU+xs5+HQ==
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

On Tue, Sep 10, 2024 at 04:47:29PM -0700, Matt Roper wrote:
> Since much of the MMIO register access done by the driver is to non-GT
> registers, use of 'xe_gt' in these interfaces has been a long-standing
> design flaw that's been hard to disentangle.
> 
> To avoid a flag day across the whole driver, munge the function names
> and add temporary compatibility macros with the original function names
> that can accept either the new xe_mmio or the old xe_gt structure as a
> parameter.  This will allow us to slowly convert parts of the driver
> over to the new interface independently.
> 

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_mmio.c  | 131 ++++++++++++++++------------------
>  drivers/gpu/drm/xe/xe_mmio.h  |  76 +++++++++++++++-----
>  drivers/gpu/drm/xe/xe_trace.h |   7 +-
>  3 files changed, 126 insertions(+), 88 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index 47b505aa8282..392105ba8311 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -67,16 +67,16 @@ static void mmio_multi_tile_setup(struct xe_device *xe, size_t tile_mmio_size)
>  
>  	/* Possibly override number of tile based on configuration register */
>  	if (!xe->info.skip_mtcfg) {
> -		struct xe_gt *gt = xe_root_mmio_gt(xe);
> +		struct xe_mmio *mmio = xe_root_tile_mmio(xe);
>  		u8 tile_count;
>  		u32 mtcfg;
>  
>  		/*
>  		 * Although the per-tile mmio regs are not yet initialized, this
> -		 * is fine as it's going to the root gt, that's guaranteed to be
> -		 * initialized earlier in xe_mmio_init()
> +		 * is fine as it's going to the root tile's mmio, that's
> +		 * guaranteed to be initialized earlier in xe_mmio_init()
>  		 */
> -		mtcfg = xe_mmio_read64_2x32(gt, XEHP_MTCFG_ADDR);
> +		mtcfg = xe_mmio_read64_2x32(mmio, XEHP_MTCFG_ADDR);
>  		tile_count = REG_FIELD_GET(TILE_COUNT, mtcfg) + 1;
>  
>  		if (tile_count < xe->info.tile_count) {
> @@ -186,116 +186,111 @@ int xe_mmio_init(struct xe_device *xe)
>  	return devm_add_action_or_reset(xe->drm.dev, mmio_fini, xe);
>  }
>  
> -static void mmio_flush_pending_writes(struct xe_gt *gt)
> +static void mmio_flush_pending_writes(struct xe_mmio *mmio)
>  {
>  #define DUMMY_REG_OFFSET	0x130030
> -	struct xe_tile *tile = gt_to_tile(gt);
>  	int i;
>  
> -	if (tile->xe->info.platform != XE_LUNARLAKE)
> +	if (mmio->tile->xe->info.platform != XE_LUNARLAKE)
>  		return;
>  
>  	/* 4 dummy writes */
>  	for (i = 0; i < 4; i++)
> -		writel(0, tile->mmio.regs + DUMMY_REG_OFFSET);
> +		writel(0, mmio->regs + DUMMY_REG_OFFSET);
>  }
>  
> -u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg reg)
> +u8 __xe_mmio_read8(struct xe_mmio *mmio, struct xe_reg reg)
>  {
> -	struct xe_tile *tile = gt_to_tile(gt);
> -	u32 addr = xe_mmio_adjusted_addr(gt, reg.addr);
> +	u32 addr = xe_mmio_adjusted_addr(mmio, reg.addr);
>  	u8 val;
>  
>  	/* Wa_15015404425 */
> -	mmio_flush_pending_writes(gt);
> +	mmio_flush_pending_writes(mmio);
>  
> -	val = readb((reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + addr);
> -	trace_xe_reg_rw(gt, false, addr, val, sizeof(val));
> +	val = readb(mmio->regs + addr);
> +	trace_xe_reg_rw(mmio, false, addr, val, sizeof(val));
>  
>  	return val;
>  }
>  
> -u16 xe_mmio_read16(struct xe_gt *gt, struct xe_reg reg)
> +u16 __xe_mmio_read16(struct xe_mmio *mmio, struct xe_reg reg)
>  {
> -	struct xe_tile *tile = gt_to_tile(gt);
> -	u32 addr = xe_mmio_adjusted_addr(gt, reg.addr);
> +	u32 addr = xe_mmio_adjusted_addr(mmio, reg.addr);
>  	u16 val;
>  
>  	/* Wa_15015404425 */
> -	mmio_flush_pending_writes(gt);
> +	mmio_flush_pending_writes(mmio);
>  
> -	val = readw((reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + addr);
> -	trace_xe_reg_rw(gt, false, addr, val, sizeof(val));
> +	val = readw(mmio->regs + addr);
> +	trace_xe_reg_rw(mmio, false, addr, val, sizeof(val));
>  
>  	return val;
>  }
>  
> -void xe_mmio_write32(struct xe_gt *gt, struct xe_reg reg, u32 val)
> +void __xe_mmio_write32(struct xe_mmio *mmio, struct xe_reg reg, u32 val)
>  {
> -	struct xe_tile *tile = gt_to_tile(gt);
> -	u32 addr = xe_mmio_adjusted_addr(gt, reg.addr);
> +	u32 addr = xe_mmio_adjusted_addr(mmio, reg.addr);
>  
> -	trace_xe_reg_rw(gt, true, addr, val, sizeof(val));
> +	trace_xe_reg_rw(mmio, true, addr, val, sizeof(val));
>  
> -	if (!reg.vf && IS_SRIOV_VF(gt_to_xe(gt)))
> -		xe_gt_sriov_vf_write32(gt, reg, val);
> +	if (!reg.vf && mmio->sriov_vf_gt)
> +		xe_gt_sriov_vf_write32(mmio->sriov_vf_gt, reg, val);
>  	else
> -		writel(val, (reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + addr);
> +		writel(val, mmio->regs + addr);
>  }
>  
> -u32 xe_mmio_read32(struct xe_gt *gt, struct xe_reg reg)
> +u32 __xe_mmio_read32(struct xe_mmio *mmio, struct xe_reg reg)
>  {
> -	struct xe_tile *tile = gt_to_tile(gt);
> -	u32 addr = xe_mmio_adjusted_addr(gt, reg.addr);
> +	u32 addr = xe_mmio_adjusted_addr(mmio, reg.addr);
>  	u32 val;
>  
>  	/* Wa_15015404425 */
> -	mmio_flush_pending_writes(gt);
> +	mmio_flush_pending_writes(mmio);
>  
> -	if (!reg.vf && IS_SRIOV_VF(gt_to_xe(gt)))
> -		val = xe_gt_sriov_vf_read32(gt, reg);
> +	if (!reg.vf && mmio->sriov_vf_gt)
> +		val = xe_gt_sriov_vf_read32(mmio->sriov_vf_gt, reg);
>  	else
> -		val = readl((reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + addr);
> +		val = readl(mmio->regs + addr);
>  
> -	trace_xe_reg_rw(gt, false, addr, val, sizeof(val));
> +	trace_xe_reg_rw(mmio, false, addr, val, sizeof(val));
>  
>  	return val;
>  }
>  
> -u32 xe_mmio_rmw32(struct xe_gt *gt, struct xe_reg reg, u32 clr, u32 set)
> +u32 __xe_mmio_rmw32(struct xe_mmio *mmio, struct xe_reg reg, u32 clr, u32 set)
>  {
>  	u32 old, reg_val;
>  
> -	old = xe_mmio_read32(gt, reg);
> +	old = xe_mmio_read32(mmio, reg);
>  	reg_val = (old & ~clr) | set;
> -	xe_mmio_write32(gt, reg, reg_val);
> +	xe_mmio_write32(mmio, reg, reg_val);
>  
>  	return old;
>  }
>  
> -int xe_mmio_write32_and_verify(struct xe_gt *gt,
> -			       struct xe_reg reg, u32 val, u32 mask, u32 eval)
> +int __xe_mmio_write32_and_verify(struct xe_mmio *mmio,
> +				 struct xe_reg reg, u32 val, u32 mask, u32 eval)
>  {
>  	u32 reg_val;
>  
> -	xe_mmio_write32(gt, reg, val);
> -	reg_val = xe_mmio_read32(gt, reg);
> +	xe_mmio_write32(mmio, reg, val);
> +	reg_val = xe_mmio_read32(mmio, reg);
>  
>  	return (reg_val & mask) != eval ? -EINVAL : 0;
>  }
>  
> -bool xe_mmio_in_range(const struct xe_gt *gt,
> -		      const struct xe_mmio_range *range,
> -		      struct xe_reg reg)
> +bool __xe_mmio_in_range(const struct xe_mmio *mmio,
> +			const struct xe_mmio_range *range,
> +			struct xe_reg reg)
>  {
> -	u32 addr = xe_mmio_adjusted_addr(gt, reg.addr);
> +	u32 addr = xe_mmio_adjusted_addr(mmio, reg.addr);
>  
>  	return range && addr >= range->start && addr <= range->end;
>  }
>  
>  /**
>   * xe_mmio_read64_2x32() - Read a 64-bit register as two 32-bit reads
> - * @gt: MMIO target GT
> + * @mmio: MMIO target
>   * @reg: register to read value from
>   *
>   * Although Intel GPUs have some 64-bit registers, the hardware officially
> @@ -315,21 +310,21 @@ bool xe_mmio_in_range(const struct xe_gt *gt,
>   *
>   * Returns the value of the 64-bit register.
>   */
> -u64 xe_mmio_read64_2x32(struct xe_gt *gt, struct xe_reg reg)
> +u64 __xe_mmio_read64_2x32(struct xe_mmio *mmio, struct xe_reg reg)
>  {
>  	struct xe_reg reg_udw = { .addr = reg.addr + 0x4 };
>  	u32 ldw, udw, oldudw, retries;
>  
> -	reg.addr = xe_mmio_adjusted_addr(gt, reg.addr);
> -	reg_udw.addr = xe_mmio_adjusted_addr(gt, reg_udw.addr);
> +	reg.addr = xe_mmio_adjusted_addr(mmio, reg.addr);
> +	reg_udw.addr = xe_mmio_adjusted_addr(mmio, reg_udw.addr);
>  
>  	/* we shouldn't adjust just one register address */
> -	xe_gt_assert(gt, reg_udw.addr == reg.addr + 0x4);
> +	xe_tile_assert(mmio->tile, reg_udw.addr == reg.addr + 0x4);
>  
> -	oldudw = xe_mmio_read32(gt, reg_udw);
> +	oldudw = xe_mmio_read32(mmio, reg_udw);
>  	for (retries = 5; retries; --retries) {
> -		ldw = xe_mmio_read32(gt, reg);
> -		udw = xe_mmio_read32(gt, reg_udw);
> +		ldw = xe_mmio_read32(mmio, reg);
> +		udw = xe_mmio_read32(mmio, reg_udw);
>  
>  		if (udw == oldudw)
>  			break;
> @@ -337,14 +332,14 @@ u64 xe_mmio_read64_2x32(struct xe_gt *gt, struct xe_reg reg)
>  		oldudw = udw;
>  	}
>  
> -	xe_gt_WARN(gt, retries == 0,
> -		   "64-bit read of %#x did not stabilize\n", reg.addr);
> +	drm_WARN(&mmio->tile->xe->drm, retries == 0,
> +		 "64-bit read of %#x did not stabilize\n", reg.addr);
>  
>  	return (u64)udw << 32 | ldw;
>  }
>  
> -static int __xe_mmio_wait32(struct xe_gt *gt, struct xe_reg reg, u32 mask, u32 val, u32 timeout_us,
> -			    u32 *out_val, bool atomic, bool expect_match)
> +static int ____xe_mmio_wait32(struct xe_mmio *mmio, struct xe_reg reg, u32 mask, u32 val, u32 timeout_us,
> +			      u32 *out_val, bool atomic, bool expect_match)
>  {
>  	ktime_t cur = ktime_get_raw();
>  	const ktime_t end = ktime_add_us(cur, timeout_us);
> @@ -354,7 +349,7 @@ static int __xe_mmio_wait32(struct xe_gt *gt, struct xe_reg reg, u32 mask, u32 v
>  	bool check;
>  
>  	for (;;) {
> -		read = xe_mmio_read32(gt, reg);
> +		read = xe_mmio_read32(mmio, reg);
>  
>  		check = (read & mask) == val;
>  		if (!expect_match)
> @@ -380,7 +375,7 @@ static int __xe_mmio_wait32(struct xe_gt *gt, struct xe_reg reg, u32 mask, u32 v
>  	}
>  
>  	if (ret != 0) {
> -		read = xe_mmio_read32(gt, reg);
> +		read = xe_mmio_read32(mmio, reg);
>  
>  		check = (read & mask) == val;
>  		if (!expect_match)
> @@ -398,7 +393,7 @@ static int __xe_mmio_wait32(struct xe_gt *gt, struct xe_reg reg, u32 mask, u32 v
>  
>  /**
>   * xe_mmio_wait32() - Wait for a register to match the desired masked value
> - * @gt: MMIO target GT
> + * @mmio: MMIO target
>   * @reg: register to read value from
>   * @mask: mask to be applied to the value read from the register
>   * @val: desired value after applying the mask
> @@ -415,15 +410,15 @@ static int __xe_mmio_wait32(struct xe_gt *gt, struct xe_reg reg, u32 mask, u32 v
>   * @timeout_us for different reasons, specially in non-atomic contexts. Thus,
>   * it is possible that this function succeeds even after @timeout_us has passed.
>   */
> -int xe_mmio_wait32(struct xe_gt *gt, struct xe_reg reg, u32 mask, u32 val, u32 timeout_us,
> -		   u32 *out_val, bool atomic)
> +int __xe_mmio_wait32(struct xe_mmio *mmio, struct xe_reg reg, u32 mask, u32 val, u32 timeout_us,
> +		     u32 *out_val, bool atomic)
>  {
> -	return __xe_mmio_wait32(gt, reg, mask, val, timeout_us, out_val, atomic, true);
> +	return ____xe_mmio_wait32(mmio, reg, mask, val, timeout_us, out_val, atomic, true);
>  }
>  
>  /**
>   * xe_mmio_wait32_not() - Wait for a register to return anything other than the given masked value
> - * @gt: MMIO target GT
> + * @mmio: MMIO target
>   * @reg: register to read value from
>   * @mask: mask to be applied to the value read from the register
>   * @val: value not to be matched after applying the mask
> @@ -434,8 +429,8 @@ int xe_mmio_wait32(struct xe_gt *gt, struct xe_reg reg, u32 mask, u32 val, u32 t
>   * This function works exactly like xe_mmio_wait32() with the exception that
>   * @val is expected not to be matched.
>   */
> -int xe_mmio_wait32_not(struct xe_gt *gt, struct xe_reg reg, u32 mask, u32 val, u32 timeout_us,
> -		       u32 *out_val, bool atomic)
> +int __xe_mmio_wait32_not(struct xe_mmio *mmio, struct xe_reg reg, u32 mask, u32 val, u32 timeout_us,
> +			 u32 *out_val, bool atomic)
>  {
> -	return __xe_mmio_wait32(gt, reg, mask, val, timeout_us, out_val, atomic, false);
> +	return ____xe_mmio_wait32(mmio, reg, mask, val, timeout_us, out_val, atomic, false);
>  }
> diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
> index 26551410ecc8..ac6846447c52 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.h
> +++ b/drivers/gpu/drm/xe/xe_mmio.h
> @@ -14,25 +14,67 @@ struct xe_reg;
>  int xe_mmio_init(struct xe_device *xe);
>  int xe_mmio_probe_tiles(struct xe_device *xe);
>  
> -u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg reg);
> -u16 xe_mmio_read16(struct xe_gt *gt, struct xe_reg reg);
> -void xe_mmio_write32(struct xe_gt *gt, struct xe_reg reg, u32 val);
> -u32 xe_mmio_read32(struct xe_gt *gt, struct xe_reg reg);
> -u32 xe_mmio_rmw32(struct xe_gt *gt, struct xe_reg reg, u32 clr, u32 set);
> -int xe_mmio_write32_and_verify(struct xe_gt *gt, struct xe_reg reg, u32 val, u32 mask, u32 eval);
> -bool xe_mmio_in_range(const struct xe_gt *gt, const struct xe_mmio_range *range, struct xe_reg reg);
> -
> -u64 xe_mmio_read64_2x32(struct xe_gt *gt, struct xe_reg reg);
> -int xe_mmio_wait32(struct xe_gt *gt, struct xe_reg reg, u32 mask, u32 val, u32 timeout_us,
> -		   u32 *out_val, bool atomic);
> -int xe_mmio_wait32_not(struct xe_gt *gt, struct xe_reg reg, u32 mask, u32 val, u32 timeout_us,
> -		       u32 *out_val, bool atomic);
> -
> -static inline u32 xe_mmio_adjusted_addr(const struct xe_gt *gt, u32 addr)
> +/*
> + * Temporary transition helper for xe_gt -> xe_mmio conversion.  Allows
> + * continued usage of xe_gt as a parameter to MMIO operations which now
> + * take an xe_mmio structure instead.  Will be removed once the driver-wide
> + * conversion is complete.
> + */
> +#define __to_xe_mmio(ptr) \
> +	_Generic(ptr, \
> +		 const struct xe_gt *: (&((const struct xe_gt *)(ptr))->mmio), \
> +		 struct xe_gt *: (&((struct xe_gt *)(ptr))->mmio), \
> +		 const struct xe_mmio *: (ptr), \
> +		 struct xe_mmio *: (ptr))
> +
> +u8 __xe_mmio_read8(struct xe_mmio *mmio, struct xe_reg reg);
> +#define xe_mmio_read8(p, reg) __xe_mmio_read8(__to_xe_mmio(p), reg)
> +
> +u16 __xe_mmio_read16(struct xe_mmio *mmio, struct xe_reg reg);
> +#define xe_mmio_read16(p, reg) __xe_mmio_read16(__to_xe_mmio(p), reg)
> +
> +void __xe_mmio_write32(struct xe_mmio *mmio, struct xe_reg reg, u32 val);
> +#define xe_mmio_write32(p, reg, val) __xe_mmio_write32(__to_xe_mmio(p), reg, val)
> +
> +u32 __xe_mmio_read32(struct xe_mmio *mmio, struct xe_reg reg);
> +#define xe_mmio_read32(p, reg) __xe_mmio_read32(__to_xe_mmio(p), reg)
> +
> +u32 __xe_mmio_rmw32(struct xe_mmio *mmio, struct xe_reg reg, u32 clr, u32 set);
> +#define xe_mmio_rmw32(p, reg, clr, set) __xe_mmio_rmw32(__to_xe_mmio(p), reg, clr, set)
> +
> +int __xe_mmio_write32_and_verify(struct xe_mmio *mmio, struct xe_reg reg,
> +				 u32 val, u32 mask, u32 eval);
> +#define xe_mmio_write32_and_verify(p, reg, val, mask, eval) \
> +	__xe_mmio_write32_and_verify(__to_xe_mmio(p), reg, val, mask, eval)
> +
> +bool __xe_mmio_in_range(const struct xe_mmio *mmio,
> +			const struct xe_mmio_range *range, struct xe_reg reg);
> +#define xe_mmio_in_range(p, range, reg) __xe_mmio_in_range(__to_xe_mmio(p), range, reg)
> +
> +u64 __xe_mmio_read64_2x32(struct xe_mmio *mmio, struct xe_reg reg);
> +#define xe_mmio_read64_2x32(p, reg) __xe_mmio_read64_2x32(__to_xe_mmio(p), reg)
> +
> +int __xe_mmio_wait32(struct xe_mmio *mmio, struct xe_reg reg, u32 mask, u32 val,
> +		     u32 timeout_us, u32 *out_val, bool atomic);
> +#define xe_mmio_wait32(p, reg, mask, val, timeout_us, out_val, atomic) \
> +	__xe_mmio_wait32(__to_xe_mmio(p), reg, mask, val, timeout_us, out_val, atomic)
> +
> +int __xe_mmio_wait32_not(struct xe_mmio *mmio, struct xe_reg reg, u32 mask,
> +			 u32 val, u32 timeout_us, u32 *out_val, bool atomic);
> +#define xe_mmio_wait32_not(p, reg, mask, val, timeout_us, out_val, atomic) \
> +	__xe_mmio_wait32_not(__to_xe_mmio(p), reg, mask, val, timeout_us, out_val, atomic)
> +
> +static inline u32 __xe_mmio_adjusted_addr(const struct xe_mmio *mmio, u32 addr)
>  {
> -	if (addr < gt->mmio.adj_limit)
> -		addr += gt->mmio.adj_offset;
> +	if (addr < mmio->adj_limit)
> +		addr += mmio->adj_offset;
>  	return addr;
>  }
> +#define xe_mmio_adjusted_addr(p, addr) __xe_mmio_adjusted_addr(__to_xe_mmio(p), addr)
> +
> +static inline struct xe_mmio *xe_root_tile_mmio(struct xe_device *xe)
> +{
> +	return &xe->tiles[0].mmio;
> +}
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
> index 8573d7a87d84..91130ad8999c 100644
> --- a/drivers/gpu/drm/xe/xe_trace.h
> +++ b/drivers/gpu/drm/xe/xe_trace.h
> @@ -21,6 +21,7 @@
>  #include "xe_vm.h"
>  
>  #define __dev_name_xe(xe)	dev_name((xe)->drm.dev)
> +#define __dev_name_tile(tile)	__dev_name_xe(tile_to_xe((tile)))
>  #define __dev_name_gt(gt)	__dev_name_xe(gt_to_xe((gt)))
>  #define __dev_name_eq(q)	__dev_name_gt((q)->gt)
>  
> @@ -342,12 +343,12 @@ DEFINE_EVENT(xe_hw_fence, xe_hw_fence_try_signal,
>  );
>  
>  TRACE_EVENT(xe_reg_rw,
> -	TP_PROTO(struct xe_gt *gt, bool write, u32 reg, u64 val, int len),
> +	TP_PROTO(struct xe_mmio *mmio, bool write, u32 reg, u64 val, int len),
>  
> -	TP_ARGS(gt, write, reg, val, len),
> +	TP_ARGS(mmio, write, reg, val, len),
>  
>  	TP_STRUCT__entry(
> -		__string(dev, __dev_name_gt(gt))
> +		__string(dev, __dev_name_tile(mmio->tile))
>  		__field(u64, val)
>  		__field(u32, reg)
>  		__field(u16, write)
> -- 
> 2.45.2
> 

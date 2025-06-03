Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E265FC5AE59
	for <intel-xe@archiver.kernel.org>; Tue,  3 Jun 2025 19:08:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8323A10E02E;
	Tue,  3 Jun 2025 19:08:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AV1TGCTU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9588310E02E
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Jun 2025 19:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748977710; x=1780513710;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=T/dkAU6XoBRxpuu1jFsR5t8o/hvhG2u3HmHrylJxoaE=;
 b=AV1TGCTUpFLrioZt+iLcMa9qs0t2IaNTzBtDLIHSDTEGQv6tBMnsYaan
 r9c2IWq0gkytzl/JGclBKGBzTz/rDwzHMPxN/kFvNJ2WIBzXbbZAarnaQ
 +JPweZFVxdkJZn4Z9rpOykuBABkv38il3SuIX4UfmAtfLOrLxpxkP8DVT
 AZQFkVtjORGKeC/2u+T8QTubW18WEoQGIRAaU6G2TPes/G7OxVxmhEjpr
 Yt86cpbM1VpUFpP+A9C5k+4K69HdQL9ZyW0qTnxClaPEO5Xyq/kUvd5gx
 2R1kkdweL9iK/SEK5W4fWcYHtiTJXjccOa1nmPJWUDYTJXz3s52RXMAHZ w==;
X-CSE-ConnectionGUID: Or2CR559QI2bSTJ+5oxFTQ==
X-CSE-MsgGUID: 4mssKl57TyqeuOPTEPkZKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="61655074"
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="61655074"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 12:08:29 -0700
X-CSE-ConnectionGUID: xC9DT/qcRI2R2fxBw1BRnw==
X-CSE-MsgGUID: jh97DGvTQRus9C6rozXn5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="149997338"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 12:08:29 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 3 Jun 2025 12:08:28 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 3 Jun 2025 12:08:28 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.62)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 3 Jun 2025 12:08:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bLHQewBBcbz2idtA53c+wjza6QpbtPfhE2SkD3JwIM3iBQ1giHOcLC8ol8yDz3QPzGEnmbLgga1gUFY75H3diCkK+4QdMe1X4CO58fZsGyI8DBQytsH/N0ai6f8yeeBsE2OYPeM16JgKU/bjqOL/bHoY2vY0eIar57PIpdrnWDRt9VwHn6gFrdD8OLgpeZIR84HMD53FhCHpMD4C7XhDn3vYKwfs0Kdh0dACyRQVDYRr+Z6V7bpJO4EYQ/DQPSjT001YIQox8R7n3ww65lm7Y4DaqT27dPZYoF740qHYlLW6ZDRwrS16my1HiwHCRtBB1Bg+zahhVMl9J1efx8v8oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UkDEpZoG8qABUzrDrkmJBf5OzXW5CKngkoiVP3ppKyE=;
 b=IKWsW/CnLT6rbUuWf9gmXXJ86HPevYw4mvZv1Gktajk2gKQjwxB6E004Qx6B09aqFpAFAiuMgMy40xxp6VLU4khRaeKy54veRtBngqUxKRrOVXcmT77xUjo+hlKgFpqMEoQLdH7UGzfj0WCQDMdqEtp7kbXyrh1+HaiTKsjIVALxDYskZI6YHvGKyNhmFoTWqmMyY5GeBh+gNMeuBID0TQgPVjHhk526GPn0moZyAu6Ceho/M5wK+8CbwEDu3YUVii0mJwcaCfxLDQx2ToNdNs+GQtYz2PqGNWRzlZD8HlWwfR7aofhGD2TkUP2NksB92NFdCFaeb5xiorrUBPIS6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by MW3PR11MB4587.namprd11.prod.outlook.com (2603:10b6:303:58::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Tue, 3 Jun
 2025 19:08:13 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%4]) with mapi id 15.20.8813.018; Tue, 3 Jun 2025
 19:08:13 +0000
Date: Tue, 3 Jun 2025 12:08:10 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matt Atwood <matthew.s.atwood@intel.com>
Subject: Re: [PATCH 4/6] drm/i915/xe3lpd: Update bandwidth parameters for
 display version 30.02
Message-ID: <20250603190810.GB5080@mdroper-desk1.amr.corp.intel.com>
References: <20250603182430.1016734-1-dnyaneshwar.bhadane@intel.com>
 <20250603182430.1016734-5-dnyaneshwar.bhadane@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250603182430.1016734-5-dnyaneshwar.bhadane@intel.com>
X-ClientProxiedBy: BY5PR04CA0006.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::16) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|MW3PR11MB4587:EE_
X-MS-Office365-Filtering-Correlation-Id: c356dacc-00ae-4c51-4d9c-08dda2d1fcde
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Q6JV01DnRpB4EC2w91a/EGhksdDmwejtmhzMV1DiaPWoBsQ4QNBpuYi6oq2n?=
 =?us-ascii?Q?YI2Km/40UW39Th9b+YItG/EOjOX9vfORc2Eo3CZfH5m1Nw3vzZ8ZYLV2bdnk?=
 =?us-ascii?Q?OGuNS949QhiCME4f1gSJkRpsg45JRm7iF4zRyi6HNVeQqzOGaDTgaqCh9Djk?=
 =?us-ascii?Q?RlWNIIoB6EnUS+TKxwqdXcrQ7b8INZyYEwHVXwAYHt4dG0Dd2gY5l5pMZN5P?=
 =?us-ascii?Q?vYR5B4atgCMmTyLCBPWsYrntTvKMVHkv7p2wWzpoNqRxFvCAE+0wokg/wjKX?=
 =?us-ascii?Q?gJ2/s5YhFeU3Zlw/86RptA6kAvxNS3PmS0/k6/Gx2ilxdbF+zK88dxYWuFy8?=
 =?us-ascii?Q?A5Nb/W8dHRDykQMdXhvvsTKiXUxDkuR6SsjpM6VkQInIVw7Y2EYiBgvr0L22?=
 =?us-ascii?Q?GC6BTukT7oce27VV0zU/OQ+GVl7aUgWHnK//YgGeaOVEpOi1Skjynsl5cB5T?=
 =?us-ascii?Q?aak2Z5/ul/fi3zCRvJzf6hMcLZpn84bAd/D7HAmzX91NoGYAMsXVi0fxZAHR?=
 =?us-ascii?Q?gE/QX9sdrAAHanZ5lyovYcWmihLlMTcGOOVcMokEoWzIi7WhMz3qyCvD0uj8?=
 =?us-ascii?Q?/ZRkJA7ppTrhcew13QkH3z/nuoghgDNpkS93JLoX72tt7JsslUQUoilmnuDR?=
 =?us-ascii?Q?YJrt00cBZPG4zLYvM3xeqE+3cTrqyh0N35NpPDUbnnJVTw1l/z66Kq04lMMj?=
 =?us-ascii?Q?nJZPSkt0UTeF+3LI0nXTLDaNotLq18EL4UNBaagLZXd5/6aXR0yiYr0lfYJN?=
 =?us-ascii?Q?ruWtprTlCmmV5LhYQFIEwKlRoxtBslsNBiLSt7478jIKlCnmqCQudpZRw+AI?=
 =?us-ascii?Q?3YeXzELV7Rl1HbcPzBj1rKv7Rlgj5OlGCf3v1rFx2jEpLiTy+rp+iAGuPeBI?=
 =?us-ascii?Q?tVa+xDsKdFnFmxu95llM0t6ZUl9zeDALzdSXd1dBsWijt3L6GU97uTYk5QTL?=
 =?us-ascii?Q?8Ij1bZBcXJeGdtNrOghvdkZVIrSkdYbTydoGSxY5AxMD9beZS1YXjYCoqrdv?=
 =?us-ascii?Q?2AYW+Ari4kad76xkyEHZXb0fd0z1jVR5nVYRu0LqzEsxTFUQvkLRcOx83ZTB?=
 =?us-ascii?Q?EpA0nEuhQFNQANH8xRrhQz0wYutPyz4ixzcI5+X8YSAQsUigKdLAKxW3lR/E?=
 =?us-ascii?Q?KiFZOfC+mot/3SLRqh8MTqEspr5c9Yg/4pitBQHA01zaogrGNFCtgBAy8Rl6?=
 =?us-ascii?Q?bEZRKo5jc0abnwL4GbwvI93Yt24T3kV1myF33v/CQOVuQkezHWE45wtKdXMI?=
 =?us-ascii?Q?X0tjaqkyP8o/QkcV2XUSUjP7zj80fFStEIxDmXz+WLwJY78ZO1FZWFa+bBYB?=
 =?us-ascii?Q?2IVt0TBft1M358+Ik0m9N5AqRsykT3vaIlVv+vWVK5vRhRjKNvCCxn11We5x?=
 =?us-ascii?Q?ff4qA8ppZmxY1LhkJkXRP7Y4BJGTQj1Fz1Eo6LvC/VewyTs29iAd+jikltro?=
 =?us-ascii?Q?tfPxHRcVqXo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?B7E4CZZS9zxSvuXpl4UW6wfsRmZGNigg8iVq2PuJcsTVXtxbZvqQL6Weklk/?=
 =?us-ascii?Q?mkWfliBELfxuWq8tw99pA6Az6Ap1qzhLECM7E1htFbktGD7Dh4TuFTxb1ZlR?=
 =?us-ascii?Q?WRE9mlQ3wsZ3BWsAI1hXGS3m8AthlYAyH7VPxGxU+PPHjRzFnY/vFASCXNcI?=
 =?us-ascii?Q?ox4o1dafR9+DHuoNraYoH663Ad3dBMBB9pwjwlLVOHKeyNgbjqwdDtJ7lIBf?=
 =?us-ascii?Q?ylm/WD5c26zilHstGq1NR/D8T9bY56kKoZ1Q0o9WQc4hqggyuMCPcgSP0tEJ?=
 =?us-ascii?Q?xaSV2ZxM3Bm6PM7PhpKQrXuy9HoXTHYYH7iS6+tk5JjjcTI+95c+FTUA+UDC?=
 =?us-ascii?Q?IiWsWg5KW5ak5IMg+gKj8JJU5As0+GHz9VWz8GpXDrVOu8NlxgJ/U4fp8Jjs?=
 =?us-ascii?Q?H3QU/qB6VwcemuNVjpYugq6qzdkiGfAsMze8pdpBo53arKi/18ASSaTeBzKb?=
 =?us-ascii?Q?/Ek9XcEOLhBOIi5sWtDBZ3NsG/iQkOGem34JZbEHlj1OzSi2a+/3TyA9AvKJ?=
 =?us-ascii?Q?hB0Tsk5qUt9bF2JrUjzZlb9+qIGdzdsoZqVN+IbWYBiRZ2egdfW4rXMnBmvN?=
 =?us-ascii?Q?UD2VxyZA4LcMcQEHYeXa+PIF6ELstsfAFLlD0MuILxx8VjACiygLzv3Lj4sF?=
 =?us-ascii?Q?wQYtxZ4EZ1XeNQ0+AanzkmuEnCHCjo0apZFf8rldoy3+ypGCRyihhU+7fx91?=
 =?us-ascii?Q?ZUAGOlxs49c0w6W/IM6kwK0I14YeKRMmcrUZyNDQgsOcpzidOpOkO1ijl0Gj?=
 =?us-ascii?Q?DNLQgZh2HEGcelNwult3DLM9GR7o1PfAmTm+u+6TSBs3tuh2QtVgdyoFsLB3?=
 =?us-ascii?Q?Em16D0r7Thep+Q9QvupQT/ZbDR2pI3hhhFZEpyvIxQDsODz6KNsyYUErNJwk?=
 =?us-ascii?Q?IF9sdPIeSOcBjON+FOayaYhg7gt0ZMMK/PeidS3qdwZTczFuIrKW4U3A/NQk?=
 =?us-ascii?Q?jYl7BegOM3F2UwHwBAlkKqfIerMFyTadAOvqNg4VibYoMtsbkZhJEeBuy6YW?=
 =?us-ascii?Q?EOTuLe1bdso98C2xgFO9uMpB4ZOpxeyc2T9MVRlQAPQDsK59Iz5mNIDYaHFZ?=
 =?us-ascii?Q?9TtxmzcbtXUXiDUkfZs1AFG9bEGaMigK2YMdN9gg3McNR7JNEc7zbp+9heFn?=
 =?us-ascii?Q?XeVuVaEJWU/Dv06wMHCOgyTYFtoo6e894zGOLblaUWZe60avaOO+A4ALNZR4?=
 =?us-ascii?Q?5ynuk0u354TBEd9R9j+NLjNr5dcppSd8pilvLLXWYAnAhOSyXKbpEb3r7jIC?=
 =?us-ascii?Q?oVspVHnLAo5yx3Q0EidFjn9IJHGaLp7xkyrlS3Vh0cGUfWSe7mCytj6yEZfe?=
 =?us-ascii?Q?po9BUaRD0UM78VfGPerCGBX9JfnrhvOzF2awW54JX3xJSRuXC/SOk0g1FgHz?=
 =?us-ascii?Q?m5KeDis/qIoMa54T9346bkI7mVLb3YG0NacB7WglaNEN95A2+LmKY2h8qTN/?=
 =?us-ascii?Q?VClKnbxXnq1r0MyASWO8SvyFkL5DU+nj/1md6bCEc1PVRpYs4bbOi6q/UzZQ?=
 =?us-ascii?Q?GB24Mp3vKWYXzwMSyKrzZjhocLygSoTY2jF9zmvU3AVO58g3obpKCS93H5TX?=
 =?us-ascii?Q?bSXNXpfb5utzoUB8fM1nZZCMxEpBIP4pACTUcW4tt/hsDi0YHxB330ukmYgl?=
 =?us-ascii?Q?TA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c356dacc-00ae-4c51-4d9c-08dda2d1fcde
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 19:08:13.2134 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WwNT9PnhfKfLc55RTXxhlxwZpBvHx0bTI30qZm6q6uZG+yKUDhPbgivaPfE7qy/yAqIP25uLrbe51/VpWBlRtm9wxq/R63Z/vOccVDS0uB0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4587
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

On Tue, Jun 03, 2025 at 11:54:28PM +0530, Dnyaneshwar Bhadane wrote:
> From: Matt Atwood <matthew.s.atwood@intel.com>
> 
> Bandwidth parameters for WCL have been updated with respect to
> previous display releases. Encode them into xe3lpd_3002_sa_info and use
> that new struct.
> 
> Bspec: 68859
> Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
> Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_bw.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_bw.c b/drivers/gpu/drm/i915/display/intel_bw.c
> index a5dd2932b852..39b5f2759617 100644
> --- a/drivers/gpu/drm/i915/display/intel_bw.c
> +++ b/drivers/gpu/drm/i915/display/intel_bw.c
> @@ -418,6 +418,13 @@ static const struct intel_sa_info xe3lpd_sa_info = {
>  	.derating = 10,
>  };
>  
> +static const struct intel_sa_info xe3lpd_3002_sa_info = {
> +	.deburst = 32,
> +	.deprogbwlimit = 22, /* GB/s */
> +	.displayrtids = 256,
> +	.derating = 10,
> +};
> +
>  static int icl_get_bw_info(struct intel_display *display, const struct intel_sa_info *sa)
>  {
>  	struct drm_i915_private *i915 = to_i915(display->drm);
> @@ -768,7 +775,9 @@ void intel_bw_init_hw(struct intel_display *display)
>  	if (!HAS_DISPLAY(display))
>  		return;
>  
> -	if (DISPLAY_VER(display) >= 30)
> +	if (DISPLAY_VERx100(display) >= 3002)
> +		tgl_get_bw_info(display, &xe3lpd_3002_sa_info);
> +	else if (DISPLAY_VER(display) >= 30)
>  		tgl_get_bw_info(display, &xe3lpd_sa_info);
>  	else if (DISPLAY_VERx100(display) >= 1401 && display->platform.dgfx &&
>  		 dram_info->type == INTEL_DRAM_GDDR_ECC)
> -- 
> 2.34.1
> 
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation

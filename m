Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F993C5475B
	for <intel-xe@archiver.kernel.org>; Fri,  8 Mar 2024 14:42:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2E1A1138D7;
	Fri,  8 Mar 2024 14:42:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P+GseiqW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F01EF1138D7
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Mar 2024 14:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709908959; x=1741444959;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Ue5yReQMursOGKZYg9qyMuvC+MyTXKzQRBRGwXOI8m8=;
 b=P+GseiqWNf/wLCpjdYjQUvWLdBkRjVp7vmdQb/yv0OnnIfDCBJ+az/+B
 hGnGLEMES3dzN7EaiAe0tkfJECbLcKjxAOlU+DT1uOzUFhEH/KrbBwVGP
 0mU4EXSEbe3fc4LW1XEDdbbLepbv/Rlh5cfNKL6uWtvSX6I8hu1tQsR9K
 YvG1gniDMdFkdAmUnl+F+/ddIkkKj4L6locdCpqP6MnlUrbhToO2ej/dU
 HAYfiMa7n1FLt/7WrT5TaD5cMfhiDhDzokpNShFJNBC0s/VPzSWxGXfpa
 EjL96fW19Sual+GDK4aw8U7u0O2CG9ZUiXpEotaaOdWRMZNn/LAEEOZ3q A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="16036703"
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; d="scan'208";a="16036703"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2024 06:42:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; d="scan'208";a="14958501"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Mar 2024 06:42:37 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 8 Mar 2024 06:42:36 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 8 Mar 2024 06:42:36 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 8 Mar 2024 06:42:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZJLCV1RRE2thXKceQheqcDgl4dgAp2vOQqeKTKDtrh+VGtIaud6x/6MlXeOezP18+1syzZOFgQC/Vx/88HhXPiEyCCOqpgcy1HQ9rIiDFpi3bR9/Zcxn17hWsD05HssNTR3+pkdTzUnAIxF7hiaAc0j7mWBHm69R0hfqb76aJNYDbJ3C+47d4leINIcz0Dcwn0JnGre3TTlhaNRvWTnsL1oksygrzRjl4hJY0bSt7C9P0R+FEI/4cY67NrAbWfKzN5p7gBP9lpn3kVil6TaCVM2+eexo8xFQU2wRJ4F0YHvX9mLPdSuzKLcBLHPA/DksdomBsAw9riVB91k87PSieA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jx07K3ta1Bry2HNxRffkwYtpwHO4ley/HyHpFNaU2xA=;
 b=QaJK8IdKRjidQqijoLccorP+YeZirYa2U+ia35OJRtqRYVC3Ic4mPhTLbglBtaImj51WFTPrIDTY/91b0bCcBH5F2f15AsuXSkeX08b7piJ2dqxy2V77rCwLg5+TqKKIRRLGrzZqMdVSQRdXrcFbr/EnWIDFkFCFWCSHTbMH0x/pnSFxXQFITWi3FjmQFTEVM7MhCty9nFSoedAn9m+dLy38Unsk8Z9XR7XjYG4+lUmgsQQ9whQgm8CB/gCGE3tr7TIUPA7VRqCvkV5QzNzVWcz5jb67zuk7DHwB/WBsqTQ5WhIkPHN12n0U2q+N+YyqXI5yCAsMpoyIbXRi2ehvXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SN7PR11MB6970.namprd11.prod.outlook.com (2603:10b6:806:2aa::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.10; Fri, 8 Mar
 2024 14:42:34 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7362.019; Fri, 8 Mar 2024
 14:42:34 +0000
Date: Fri, 8 Mar 2024 09:42:30 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <aravind.iddamsetty@intel.com>, <badal.nilawar@intel.com>,
 <matthew.d.roper@intel.com>
Subject: Re: [PATCH 2/2] RFC drm/xe: re-order lmem init check and wait for
 initialization to complete
Message-ID: <Zesj1vgtwk877OhR@intel.com>
References: <20240308085517.2030484-1-riana.tauro@intel.com>
 <20240308085517.2030484-3-riana.tauro@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240308085517.2030484-3-riana.tauro@intel.com>
X-ClientProxiedBy: SJ0PR05CA0155.namprd05.prod.outlook.com
 (2603:10b6:a03:339::10) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SN7PR11MB6970:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b8ae078-570a-47f4-ccc7-08dc3f7dfdd7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: f0KOD4Y1Oj+uaeUxrbQP53zrRuQhoA6PnPDdQP5KHl0u0L0Po6sOtXRkP9ah1RphzvFX8lEfB8WT3X9m9OqfIj31QrEszPGVneD5bpJ1WGrAA/FHLaXqpEwC5CTHbG15HyCCyWLjq8QO7cf1uRGiTs3aeNeNq/G15wMgRtb/9WotIb+O7UosVnPYIlz4zRjbOtr80EWJH/m/Tt5og3Y73FyOF/vpSv/IWNORv1WSWcymuwnvIfy9yiJOCbprDtIx1yDHuHHnsVN5umVRgTL8Mo0Ra6WZBm+xITDSu2mL3w+7iq7mtbGJDZh7uZgn8wmGB07v7ZEk1WsG9KMU1bCs9RKgl+SH5TEynCuBEGhv9z9Bf9gcnAujSfMTU5W56QjQD8sdZinRnxBYQBZeFZlC5z2Logc/BKsCIKc2IaFOgnMvv2jMwIjKb1BZ56dK38vhv9ZRDDDVj5FAcbN7LHLmfYIYOWyMYJptSq4qV23eXbuLg817qkEuOJVeJizJKGt+IWjn2BdvpjeHBJo+PcGQ2iVPXVU5eaAnF2fSJhzJTIfvUX9FZr81MXJMHGM7jVyUPrVr+z8VrUjp+5630p5C0+gld6degcdtH/4zVOsM7Kk76bQDN/5Q1HS5Nk3XDg77Ca59SDZ8lhLDIW1/JdcZFi4fkA9GdDBjTpLLzyP/nfg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?m3sLqiBIAR0YtZLNRzZ66xvRjcm757dc9W2rK99fivSgSL1yBcjAEofSV23P?=
 =?us-ascii?Q?jEokuOG99RWvGG1vNqcL0BkHEq/RUii6c9qJjLQmis8p9WdeqNB7IRA2zrFR?=
 =?us-ascii?Q?EoZNpsdUMDT0U58uS0BREhiw1c0dhCFg37q2RnGFySAIJw1nwYtsCxFkxkXb?=
 =?us-ascii?Q?Z/odNIU2SlJ4O2rNurBpZRJQAc9qKRF5ZDBpk6jQoFPxF7onrdJQEIxSFM3I?=
 =?us-ascii?Q?riOT7+d2CUQvxVXCGOYRVS1qR3etDdy04duHbT3J+kfERjBeI97gkX+h039D?=
 =?us-ascii?Q?rbe0PeY+eNc9Ny71g3vuQgIsbj42RjIWqzS6PuAZFSk48OLQhKP7HCoDqn9R?=
 =?us-ascii?Q?POaaYkiF9RFeZubqP6qe3bgkGD7s8T/OoVy0UcBxiyEVeg4NJEkl+LB7BwBm?=
 =?us-ascii?Q?D7RZ5Te1UI89DP+hpmXaXP4MMa7e4RP3rz+SflTzg2WTla9nDPoX7Lqg32IW?=
 =?us-ascii?Q?UgmKYP1PamFOZgPC4rhc0riHIK0LdFMCPWJyua2LNI/oRzFayXNCyqMG6Ypf?=
 =?us-ascii?Q?fUBZc2CMTkMmVGmAUjWzdGx7q2r6eV5udRnm0lg64GFOJ5NTsoTuk/DTtQBD?=
 =?us-ascii?Q?9Sk5hNXYIH/tG52kYvpCa4NTfw56pLNtUo3EjgsEjhX2mwMrkYs96Du0UiA9?=
 =?us-ascii?Q?ui/iunIEWxMmM8/rrwFJ1WpF1kS7QCnPF9j6TxrVvMgxYotLrpDuAEmvATpd?=
 =?us-ascii?Q?RlBFsaihRAdHdn0wDYyIIosfIbrTljHmrKy95Z6cMoMG2jMulEk9kTUmmjS+?=
 =?us-ascii?Q?VC2vKLVAFWcHFFldnPVIM+CSlu4t5lWJ5S/JdIxZhBC9pKe8h63apZ9VnFdM?=
 =?us-ascii?Q?2SZZzbSmfvl1kKAq1Qx2AkxFCCA7Axo1uvJG+87f/VFfifEnYGfTDnjK79cu?=
 =?us-ascii?Q?OckD8Ld5EScE3BRQcVb2NkelCRJpM1V3ZtLx78VuT9gg/uUA3psN7aCu6TuX?=
 =?us-ascii?Q?wVGp6a3Y16/LRO07Sh58J/p5v7JT3w5ajqD7G7EwRk8aqlX4kInjOKBLKgTG?=
 =?us-ascii?Q?mYeS2PyWX44BsuWP/XdOpUYlYp+8ee9LV8cMqvY/6AB69RgJvFr551hN8vJP?=
 =?us-ascii?Q?B9UDBK7Lejh5/FcSkMM3LqY3qMaof78gXJt9EpvqIL0VtGssd3bhMpc4pnrC?=
 =?us-ascii?Q?0qS+6tS9dj7rIEPXqPvmbOoJDDX7C0J50E6Se/DCv/QsSi0yujqrh2k7wTeo?=
 =?us-ascii?Q?m99wD8jLAKh2IoL5B8ZZ49tELK32dyWN6B2P4hRXaGxhT7fWZsjGOThLh2OP?=
 =?us-ascii?Q?8OZ/juCmh35UqX/1HEs859MN1ZJFZZICsZmkJ2Jb3VEy3ggUUmUmWE1MuE4r?=
 =?us-ascii?Q?CjcB5hrkgbJUjLWyFtfYZ9CLPXS0EeoaIWod4Xc2mWlKbF+rh0MMdXRnY8uS?=
 =?us-ascii?Q?4dH3x7Zggpn77sfGz2585aOUtH+58I7WpzXxiI/aoMJMUzxiOhvWLiEmxg84?=
 =?us-ascii?Q?gHdb1rWIZmpqNpDD4wkAQlOFdngATl02583CN3YIvatf8DqJ2gOfFBaAXP5Q?=
 =?us-ascii?Q?irnMRr7OQYEupFKYZmCg0nTUw7dYgCnHqEMPqAMigLqznXhZeb3EaGObhTgn?=
 =?us-ascii?Q?8zJQWJkrEb9s9kB0XbSfCn7o7+eJCG0xbWLw/Hnv?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b8ae078-570a-47f4-ccc7-08dc3f7dfdd7
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2024 14:42:34.4002 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +jRDgfnLNH9yuCTQeMCleWWXZHz4U69lKUchtC4z0fnE5dIzyI05GHbFASLE3IE1JWFIuYswQ/TVvcgL6n4AIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6970
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

On Fri, Mar 08, 2024 at 02:25:17PM +0530, Riana Tauro wrote:
> Lmem init check should be done only after pcode initialization
> status is complete. Move lmem init check after pcode status
> check. Also wait for a short while after pcode status check
> to allow completion of the task.
> 
> Failing to do so, can lead to aborting the module load
> leaving the system unusable. Wait until the lmem initialization
> is complete within a timeout (60s) or till the user aborts.
> 
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c | 53 +++++++++++++++++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_mmio.c   | 29 -------------------
>  2 files changed, 52 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 83dd60f68566..4806e7806be5 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -413,12 +413,59 @@ static int xe_set_dma_info(struct xe_device *xe)
>  	return err;
>  }
>  
> +static int verify_lmem_ready(struct xe_gt *gt)

maybe bool?

> +{
> +	return xe_mmio_read32(gt, GU_CNTL) & LMEM_INIT;
> +}
> +
> +static int wait_for_lmem_ready(struct xe_device *xe)
> +{
> +	struct xe_gt *gt = xe_root_mmio_gt(xe);
> +	unsigned long timeout, start;
> +
> +	if (!IS_DGFX(xe))
> +		return 0;
> +
> +	if (IS_SRIOV_VF(xe))
> +		return 0;
> +	/*
> +	 * The boot firmware initializes local memory and assesses its health.
> +	 * If memory training fails, the punit will have been instructed to
> +	 * keep the GT powered down; we won't be able to communicate with it
> +	 * and we should not continue with driver initialization.
> +	 */

the comment is negative in a positive outcome.
I mean, one reading this comment above might conclude that we are returning below
because we won't be able to communicate with the GT.

but the code is right and we need this change. thanks for taking care of it.

Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> +	if (verify_lmem_ready(gt))
> +		return 0;
> +
> +	drm_dbg(&xe->drm, "Waiting for lmem initialisation\n");
> +
> +	start = jiffies;
> +	timeout = start + msecs_to_jiffies(60 * 1000); /* 60 sec! */
> +
> +	do {
> +		if (signal_pending(current))
> +			return -EINTR;
> +
> +		if (time_after(jiffies, timeout))
> +			return -EPROBE_DEFER;
> +
> +		msleep(20);
> +
> +	} while (!verify_lmem_ready(gt));
> +
> +	drm_dbg(&xe->drm, "lmem ready after %ums",
> +		jiffies_to_msecs(jiffies - start));
> +
> +	return 0;
> +}
> +
>  /**
>   * xe_device_probe_early: Device early probe
>   * @xe: xe device instance
>   *
>   * Initialize MMIO resources that don't require any
> - * knowledge about tile count. Also initialize pcode
> + * knowledge about tile count. Also initialize pcode and
> + * check vram initialization on root tile.
>   *
>   * Return: 0 on success, error code on failure
>   */
> @@ -438,6 +485,10 @@ int xe_device_probe_early(struct xe_device *xe)
>  	if (err)
>  		return err;
>  
> +	err = wait_for_lmem_ready(xe);
> +	if (err)
> +		return err;
> +
>  	return 0;
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index 7ba2477452d7..7fc0c5453b21 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -360,30 +360,6 @@ static void mmio_fini(struct drm_device *drm, void *arg)
>  		iounmap(xe->mem.vram.mapping);
>  }
>  
> -static int xe_verify_lmem_ready(struct xe_device *xe)
> -{
> -	struct xe_gt *gt = xe_root_mmio_gt(xe);
> -
> -	if (!IS_DGFX(xe))
> -		return 0;
> -
> -	if (IS_SRIOV_VF(xe))
> -		return 0;
> -
> -	/*
> -	 * The boot firmware initializes local memory and assesses its health.
> -	 * If memory training fails, the punit will have been instructed to
> -	 * keep the GT powered down; we won't be able to communicate with it
> -	 * and we should not continue with driver initialization.
> -	 */
> -	if (!(xe_mmio_read32(gt, GU_CNTL) & LMEM_INIT)) {
> -		drm_err(&xe->drm, "VRAM not initialized by firmware\n");
> -		return -ENODEV;
> -	}
> -
> -	return 0;
> -}
> -
>  int xe_mmio_init(struct xe_device *xe)
>  {
>  	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> @@ -407,16 +383,11 @@ int xe_mmio_init(struct xe_device *xe)
>  int xe_mmio_root_tile_init(struct xe_device *xe)
>  {
>  	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
> -	int err;
>  
>  	/* Setup first tile; other tiles (if present) will be setup later. */
>  	root_tile->mmio.size = SZ_16M;
>  	root_tile->mmio.regs = xe->mmio.regs;
>  
> -	err = xe_verify_lmem_ready(xe);
> -	if (err)
> -		return err;
> -
>  	return 0;
>  }
>  
> -- 
> 2.40.0
> 

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD269C48BEB
	for <intel-xe@archiver.kernel.org>; Wed, 14 Feb 2024 22:06:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E42310E5C6;
	Wed, 14 Feb 2024 22:06:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H6nSKH2v";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1171D10E5C6
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Feb 2024 22:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707948379; x=1739484379;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=3I2QLTwYtEbBKAv1vRq/2lnof/+jh3ZvY8O/Azk47EI=;
 b=H6nSKH2vyep1TKOJHUgrGa15wouef3SH2RPctZG/KXds1WMYTsDRihIT
 YPRBuJdvpeOSPH8GhXMjiu7s4l+/5lcjHL+wC2tg10yUnrBx3FLTCvbQB
 17FQO1wabMScB/xQnwMO8qiFK/RxVPSIsc1bL8M/agEYr0pKEyNZlQ5O5
 gSnpN8sABvwWOJOcnCYWpmSwsAm+euzugaN3WldvqKw3xtDRADn7qO6Kb
 0zXz62M/Z9ZtnSXnokMkAonOJn4Rg/YnOvSll6J5EbNK7jhyPSIc42fzF
 5tiRYPIKSKgnQI1+oMlB7qao9up4LDL0/YmXSh/Z0/NCLU21m+/OI+j+D Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10984"; a="19534505"
X-IronPort-AV: E=Sophos;i="6.06,160,1705392000"; d="scan'208";a="19534505"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2024 14:06:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,160,1705392000"; 
   d="scan'208";a="3701141"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Feb 2024 14:06:13 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 14 Feb 2024 14:06:12 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 14 Feb 2024 14:06:12 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 14 Feb 2024 14:06:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xk0C7Eu/eMsZnPunqTs43dsXbrFyAsbZQg6EIhklj6yZG2Vd5dRgZwT2RYGpDO/A6vrYyI1KEz3rSNCOsWyI6gCbUvXBOIhqP+hw9gip9SY/ITjqUonmor9ycptH7pKLOkHB9hs7Rcp3YguOO7KRMDFZMR8hixipdRYoI9IQcs62zzJkbjyJ04K71IYWwW14M7VWBqgmX1xdcPFHni03feFnlWAZHf/UBZC1kAjLu6cRgSYnh220CXwt/2ooe+vBqtN8Bg8LJrmRG8AJ2fH8y3/EC3w/6kMKxu3zbVIhCqL/2ATbJK9qsxfMPICeEQ2DJ8Z3cGSna8FzEEb8Q3n0fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qsq8BxZEbe//dmmB7hX9GZhghXXNJ9zjV/zO/8LBtew=;
 b=CV/wSI0LqAotNqVWnns0zI1S/s3r9y8W37XujM5cSck5WNKDGHIOtACqvr2sVIGuttk+6Zyt+Eeeff1Jfu4oFJh8uLtU6LsdHDjo1cnOVZSTtAq+gUyoL/PqzqZ85GpuGlyb996RJdsk2ebyyaM2Wj90xkcWffRXbYC2T1betkabYk7+PkQxjDDU4TfaE4hUHt6rDAHimgLJn3+Nkv5lgBBxpgffmq6/yYHSew1KR7JLdDgIvrWTszTnZQ1JN4s8f9Zto3SASMDEfXkJobwgZAfgKLRAbBMu051tIEBANEwigwwC1hWsESvGol5XoirKPvREcL67F92LJ7N859+syA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SA1PR11MB6711.namprd11.prod.outlook.com (2603:10b6:806:25b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.27; Wed, 14 Feb
 2024 22:06:06 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::e8bb:5354:3889:6092]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::e8bb:5354:3889:6092%3]) with mapi id 15.20.7292.026; Wed, 14 Feb 2024
 22:06:06 +0000
Date: Wed, 14 Feb 2024 14:06:04 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Koby Elbaz <kelbaz@habana.ai>
CC: <michal.winiarski@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v6 2/2] drm/xe: restore xe_mmio_ioctl as the ioctl
 handler of the mmio debugfs file
Message-ID: <20240214220604.GI718896@mdroper-desk1.amr.corp.intel.com>
References: <20240131195953.852641-1-kelbaz@habana.ai>
 <20240131195953.852641-2-kelbaz@habana.ai>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240131195953.852641-2-kelbaz@habana.ai>
X-ClientProxiedBy: BYAPR04CA0025.namprd04.prod.outlook.com
 (2603:10b6:a03:40::38) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SA1PR11MB6711:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e30d673-dcb3-46a5-792d-08dc2da92480
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3mCwhaLiY1CFjPi5wl/ItHL57gGEik6DtvPMmBHorNC7bIZS5lodkv/E0mcmqVOMraHrKhLQGQZLHxHggSXnptpc6VI1H/YF5UMQxXGK5qJnznsMT7oztwn8E8ZQwvQmkkQu+LxqZp72GHwphlRy8nEaZ/xNnmecjARCZ+oA2L7RiDO6C13wUbL+m7D3cR9Awx1+6OgdF17YseYAUUdaqqcSXzf/GyDLowyOLGYmb0aFqf21XJZPvYsHbbggSQ+iFnC95VC3ynp9Br1MpHJOpxrg5CH2cCaeSNDMTXPEKigSS636XxkuJfgCFuUCDp3b33kMs74swdVC7aDNxtWwz7qDNpXXqvXgKd7gbtw9ZnAVG7uOlw8VpL0VrP9gAi1o+w2oJsV6hh7dss+ew4JR3qbxJM3wThqjmr5mxceG2NW3ANrwucu1vEpo4kKjKqrwPqPKmS9AXBB8npMOna4ZQXWRo3xmO0LKPvbDuBc2nmn9s2fCfRYVAjpAz7YqPFvVABEqXmwXbO+HQ6WKMqEHXTjvO860Xz0vV6KsuUvVfXmzjGqKmpApw9yTYo1qu0I4
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(396003)(39860400002)(346002)(366004)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(33656002)(86362001)(83380400001)(82960400001)(38100700002)(2906002)(5660300002)(66556008)(66476007)(66946007)(41300700001)(8936002)(6916009)(4326008)(8676002)(316002)(6486002)(6506007)(6512007)(478600001)(26005)(1076003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?JKIru329gPNlCY0WSRCv6uai4iMOPnT7EZ+gn4dT7MvyqYw/Ko4ECPUFX3?=
 =?iso-8859-1?Q?qSMGSNxxAV9Tde84/nHk9t2I3VBmfM1DBdin18xifOfipw1M1RfD7AtR+w?=
 =?iso-8859-1?Q?gBvaAN5Z/simP7ZgvaJGPBozWNM2dGn6QMwvNj1v+1MAM7Hvu2y0CH+3Gn?=
 =?iso-8859-1?Q?X+/QE9G954VWGdLjXldrgO4so1ffmlzNuxl88JY939VokSPGFOjugdIFVS?=
 =?iso-8859-1?Q?KYTzcUZmTHuwjmvMZFChIs/8uDKlObFqp5ekjkwSLiQd6UOU+oU0ToSbuN?=
 =?iso-8859-1?Q?bXRjO0wTWUMLOQ1MrMgTRBPkPnEzrigiowISdeHZtqcc3ll71ev3qzlQRE?=
 =?iso-8859-1?Q?N2IPT1wIw5Ccy2olF+f68vrNzv9YPx9SEi6E9lN30X2E0I2n3PTxZQ4mpS?=
 =?iso-8859-1?Q?pa0EzE47skD0bvyk/4B9qizoaQiHZ+MxG9sGhSZPE4LpfUCvst0zZzGM3F?=
 =?iso-8859-1?Q?e3XRrVcedd0ZAzPZH2sqotJNKwGTTGkOsxsYxUNDuOeKZAZkG6LhUjNSNT?=
 =?iso-8859-1?Q?1oKRX9q5/WTwzkjIZaKgAbMqBzFz9iTFOGD+mJqtnug4JOG/83WJYAvq0X?=
 =?iso-8859-1?Q?pcefsys795w4q+iGPICesYDNjG/OaCLFmsCIC05jN3yt5FOrzhjYkCorT4?=
 =?iso-8859-1?Q?a/qGSQEuoYiS/ej34VjGOF+XYE1LnelTsB4M633mKTvTtvjoTS5QUYjS9q?=
 =?iso-8859-1?Q?WNMIEPGCljHZ1LPmzuB4qnO1tSd+T/923/Gc6iSy/zrAqq2Xx5M4LYA6Hv?=
 =?iso-8859-1?Q?Gi3k5SOkJzzKttxc+cVeUYp89WBwJRGofvFm2m8bNe85v6FswPC3cNNCbC?=
 =?iso-8859-1?Q?p9mkHHxvmOwF9iFBd0hBogcoy5FYCWKHUx7he0VISEeOk4fVMb9qqBB2d1?=
 =?iso-8859-1?Q?i8WuwKySXkK7BDZWCQPnvfEE6kcvD9U3l6PqlUv9vJo78lf3Z7HXGPeKo7?=
 =?iso-8859-1?Q?IMaXfQxUjDdfx7N0H9oPUFRcv931EZP5USDLAuyxIGK8xaLiuLY3r7d4s/?=
 =?iso-8859-1?Q?KnaPaUaPG17H63aJ/88IwosZyysywyivgW9QNk3zBseKmKtpRwCwzljkuY?=
 =?iso-8859-1?Q?aFRTQf7uNuAg9/ctIw+wGfNguf0i31P6ZPyq3lbrNFpRbQhZcntAbbSuKU?=
 =?iso-8859-1?Q?Ss10E3RGrtfQfY02Vo52mr8aLoG++x3RbjuyEUDztAaXxlq4c94VDDkTfI?=
 =?iso-8859-1?Q?bswTyaUnqzNDYZvvufVRarHSc4h5mpVJNXlBFd5996KjGK+XxYWiQziSu6?=
 =?iso-8859-1?Q?m508BzT+y7g8Je9o6QlQs5xfBkd/NkKZISkNskEmOn2tHSDhTxFkRm8oXv?=
 =?iso-8859-1?Q?9PvrpEKe9/cPidLlVNbJAtb1wfloQU9N4iKveSsL1lbpWvbkbpp45YTyYQ?=
 =?iso-8859-1?Q?SBOqLmEQqmpjMLHgRVIv1AwqSLymRknWU1FiWhvGHzf1q4T7HTej5O6CZU?=
 =?iso-8859-1?Q?rzgcuJGcWCtqZYpYty5vHzbAtYnqY0yI4WXi6WAFLD30w33DKie7CID4BT?=
 =?iso-8859-1?Q?mUZ4wuXpH6axO8oZOUGBPEegRcCs5Wh9MxnSug/A4+NuMUOhBhdNDyB04w?=
 =?iso-8859-1?Q?9+jM4JU0n52SH8Xf/tAOHhS9FGdIrietI6ogjsmTl5zUDt++JDDsJGX2wz?=
 =?iso-8859-1?Q?t9URCsvlQW6ryiRoeKUmeSINYypsUkcBe1BbXCMDs8tF5GjCoKtsZ9DA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e30d673-dcb3-46a5-792d-08dc2da92480
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2024 22:06:06.6413 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +F9l/cDDMqfzhz6xwtFhGUfPPlzQgegTGeIe7l0J1jXm80ImHCB3zIq1rYjB+QwS0RVXa1Ehhei9EvAD0iarlrOGPYpXZbHnCYWc1hanEH4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6711
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

On Wed, Jan 31, 2024 at 09:59:53PM +0200, Koby Elbaz wrote:
> The drm mmio ioctl handler (xe_mmio_ioctl) wasn't needed anymore,
> and therefore, recently removed.
> Nevertheless, it is now restored for debugging purposes to function
> as the ioctl handler of the 'mmio' debugfs file.
> Note, that the non-admin user's limited mmio access (aka, whitelist),
> was removed being irrelevant anymore, now that a user using debugfs
> must anyway have root permission to use it.
> 
> Signed-off-by: Koby Elbaz <kelbaz@habana.ai>
> ---
> Changes in v6:
>  - Removed unnecessary header includes.
>  - Expanded the scope of security_lock_down check.
>  drivers/gpu/drm/xe/xe_debugfs.c      | 111 ++++++++++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_debugfs_mmio.h |  43 +++++++++++
>  2 files changed, 152 insertions(+), 2 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/xe_debugfs_mmio.h
> 
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
> index 21b2257aa3a8..cc9d108f7fb2 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -6,13 +6,15 @@
>  #include "xe_debugfs.h"
>  
>  #include <linux/string_helpers.h>
> -
> +#include <linux/security.h>
>  #include <drm/drm_debugfs.h>
>  
>  #include "xe_bo.h"
>  #include "xe_device.h"
>  #include "xe_gt_debugfs.h"
>  #include "xe_step.h"
> +#include "xe_debugfs_mmio.h"
> +#include "xe_mmio.h"
>  
>  #ifdef CONFIG_DRM_XE_DEBUG
>  #include "xe_bo_evict.h"
> @@ -98,8 +100,113 @@ static int forcewake_release(struct inode *inode, struct file *file)
>  	return 0;
>  }
>  
> -static long xe_debugfs_mmio_ioctl(struct file *f, unsigned int cmd, unsigned long arg)
> +static int _xe_debugfs_mmio_ioctl(struct xe_device *xe, struct xe_debugfs_mmio_ioctl_data *args)
> +{
> +	struct xe_gt *gt = xe_root_mmio_gt(xe);

This part doesn't look right; this might not wake up the GT that the
specific register you're reading resides within (e.g., a register on
tile0 media GT, or a register on tile1 primary GT).

It seems like we need to either:
 - Figure out which GT the register resides within and grab that
   specific GT's forcewake domains (or just don't grab forcewake at all
   if we determine that this is a non-GT sgunit/soc/display/etc.
   register).
 - Be lazy and just grab every GT's forcewake in a loop so that we don't
   have to put any effort into figuring out what the register is.

> +	unsigned int bits_flag, bytes;
> +	struct xe_reg reg;
> +	int ret = 0;
> +
> +	if (XE_IOCTL_DBG(xe, args->extensions) ||
> +	    XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
> +		return -EINVAL;
> +
> +	if (XE_IOCTL_DBG(xe, args->flags & ~XE_DEBUGFS_MMIO_VALID_FLAGS))
> +		return -EINVAL;
> +
> +	if (XE_IOCTL_DBG(xe, !(args->flags & XE_DEBUGFS_MMIO_WRITE) && args->value))
> +		return -EINVAL;
> +
> +	bits_flag = args->flags & XE_DEBUGFS_MMIO_BITS_MASK;
> +	bytes = 1 << bits_flag;
> +	if (XE_IOCTL_DBG(xe, args->addr + bytes > xe->mmio.size))
> +		return -EINVAL;
> +
> +	/*
> +	 * TODO: allow distinction between XE_REG / XE_REG_EXT to
> +	 * handle registers from both MMIO & MMIO_EXT spaces.
> +	 */
> +
> +	/*
> +	 * TODO: migrate to xe_gt_mcr to lookup the mmio range and handle
> +	 * multicast registers. Steering would need uapi extension.
> +	 */
> +	reg = XE_REG(args->addr);

Should there be some kind of sanity check here to make sure userspace
isn't asking for some address past the end of our iomap?  Even if the
debugfs isn't available to non-admin users, it's still best if we can
avoid a panic just because someone typo'd an extra digit on the end of a
register offset they were trying to read/write.

> +
> +	xe_device_mem_access_get(xe);
> +	xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> +
> +	if (args->flags & XE_DEBUGFS_MMIO_WRITE) {
> +		switch (bits_flag) {
> +		case XE_DEBUGFS_MMIO_32BIT:
> +			if (XE_IOCTL_DBG(xe, args->value > U32_MAX)) {
> +				ret = -EINVAL;
> +				goto exit;
> +			}
> +			xe_mmio_write32(gt, reg, args->value);
> +			break;
> +		default:
> +			drm_dbg(&xe->drm, "Invalid MMIO bit size");
> +			fallthrough;
> +		case XE_DEBUGFS_MMIO_8BIT: /* TODO */
> +		case XE_DEBUGFS_MMIO_16BIT: /* TODO */
> +			ret = -EOPNOTSUPP;
> +			goto exit;
> +		}
> +	}
> +
> +	if (args->flags & XE_DEBUGFS_MMIO_READ) {
> +		switch (bits_flag) {
> +		case XE_DEBUGFS_MMIO_32BIT:
> +			args->value = xe_mmio_read32(gt, reg);
> +			break;
> +		case XE_DEBUGFS_MMIO_64BIT:
> +			args->value = xe_mmio_read64_2x32(gt, reg);
> +			break;
> +		default:
> +			drm_dbg(&xe->drm, "Invalid MMIO bit size");
> +			fallthrough;
> +		case XE_DEBUGFS_MMIO_8BIT: /* TODO */
> +		case XE_DEBUGFS_MMIO_16BIT: /* TODO */
> +			ret = -EOPNOTSUPP;
> +		}
> +	}
> +
> +exit:
> +	xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> +	xe_device_mem_access_put(xe);
> +
> +	return ret;
> +}
> +
> +static long xe_debugfs_mmio_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
>  {
> +	struct xe_device *xe = file_inode(filp)->i_private;
> +	struct xe_debugfs_mmio_ioctl_data mmio_data;
> +	int ret;
> +
> +	ret = security_locked_down(LOCKDOWN_PCI_ACCESS);
> +	if (ret)
> +		return ret;
> +
> +	if (cmd == XE_DEBUGFS_MMIO_IOCTL) {
> +		ret = copy_from_user(&mmio_data, (struct xe_debugfs_mmio_ioctl_data __user *)arg,
> +				     sizeof(mmio_data));
> +		if (ret)
> +			return -EFAULT;
> +
> +		ret = _xe_debugfs_mmio_ioctl(xe, &mmio_data);
> +		if (ret)
> +			return ret;
> +
> +		ret = copy_to_user((struct xe_debugfs_mmio_ioctl_data __user *)arg,
> +				   &mmio_data, sizeof(mmio_data));
> +		if (ret)
> +			return -EFAULT;
> +	} else {
> +		return -EINVAL;
> +	}
> +
>  	return 0;
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_debugfs_mmio.h b/drivers/gpu/drm/xe/xe_debugfs_mmio.h
> new file mode 100644
> index 000000000000..1dfb8fa2ce9a
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_debugfs_mmio.h
> @@ -0,0 +1,43 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#ifndef _XE_DEBUGFS_MMIO_H_
> +#define _XE_DEBUGFS_MMIO_H_
> +
> +#include <drm/drm.h>
> +
> +#define XE_DEBUGFS_MMIO_8BIT		0x0
> +#define XE_DEBUGFS_MMIO_16BIT		0x1
> +#define XE_DEBUGFS_MMIO_32BIT		0x2
> +#define XE_DEBUGFS_MMIO_64BIT		0x3
> +#define XE_DEBUGFS_MMIO_BITS_MASK	0x3
> +#define XE_DEBUGFS_MMIO_READ		0x4
> +#define XE_DEBUGFS_MMIO_WRITE		0x8
> +
> +#define XE_DEBUGFS_MMIO_VALID_FLAGS (\
> +	XE_DEBUGFS_MMIO_BITS_MASK |\
> +	XE_DEBUGFS_MMIO_READ |\
> +	XE_DEBUGFS_MMIO_WRITE)
> +
> +struct xe_debugfs_mmio_ioctl_data {
> +	/** @extensions: Pointer to the first extension struct, if any */
> +	__u64 extensions;
> +
> +	__u32 addr;

As noted on the previous patch, making this debugfs per-tile will allow
the address here to be relative to the tile.  Otherwise it gets more
challenging to figure out the platform-specific manner to craft an
address here that references the desired register in a non-root tile.


Matt

> +
> +	__u32 flags;
> +
> +	__u64 value;
> +
> +	/** @reserved: Reserved */
> +	__u64 reserved[2];
> +};
> +
> +#define XE_DEBUGFS_MMIO_IOCTL_NR	0x00
> +
> +#define XE_DEBUGFS_MMIO_IOCTL \
> +	_IOWR(0x20, XE_DEBUGFS_MMIO_IOCTL_NR, struct xe_debugfs_mmio_ioctl_data)
> +
> +#endif /* _XE_DEBUGFS_MMIO_H_ */
> -- 
> 2.34.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation

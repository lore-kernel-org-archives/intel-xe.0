Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F3A7C6FD1C
	for <intel-xe@archiver.kernel.org>; Fri, 24 Mar 2023 21:37:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 740E410E1A3;
	Fri, 24 Mar 2023 21:37:00 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 290D710E1A3
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Mar 2023 21:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679693818; x=1711229818;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=DQgvr5fYLjDvD95Pp3JFl6qrCEsez6mMSD5Xf2S7RwI=;
 b=Mtq+Pnsxjdzse/T+mgK1lbLy5sYSOA5QyYvskeifJKPnwA+fIAx4KBI2
 sIx3UMaleMGuDzAFD4LBzqt0X9+i3ZiwyYvj8reROJXkERyR2IX68IahQ
 0fM6bipzhkjCTNIREPnBUZdNW6D2ugmE5hsE7yRV6IOyfBOw0YLnpXxNP
 TEfzXR7j7Wv07KQm6i29Gad5zlpjzoYRZE0paxSUBDkGDU29QhlamBtrU
 qHhY0cc4CgwOYjI90rXNbtGUsPqKSiw35B16MM6pmyRCV0Lnw3874Npwf
 z08Bsy6KidzGzZP7j7piefuUSe9kSsViZlDOZ8IoDsh8weOHu6wRh6rYq g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="339913878"
X-IronPort-AV: E=Sophos;i="5.98,288,1673942400"; d="scan'208";a="339913878"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2023 14:36:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="747307721"
X-IronPort-AV: E=Sophos;i="5.98,288,1673942400"; d="scan'208";a="747307721"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.252.38.175])
 ([10.252.38.175])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2023 14:36:54 -0700
Message-ID: <635b0db0-67fe-65a0-f3c2-fd0425a20dd1@linux.intel.com>
Date: Fri, 24 Mar 2023 22:36:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To: Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org
References: <20230324210415.2434992-1-matthew.d.roper@intel.com>
 <20230324210415.2434992-4-matthew.d.roper@intel.com>
From: "Das, Nirmoy" <nirmoy.das@linux.intel.com>
In-Reply-To: <20230324210415.2434992-4-matthew.d.roper@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH 3/6] drm/xe/pat: Handle unicast vs MCR PAT
 registers
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


On 3/24/2023 10:04 PM, Matt Roper wrote:
> The PAT_INDEX registers are MCR registers on some platforms and unicast
> on others.  On MTL the handling even varies between GTs:  the primary GT
> uses MCR registers while the media GT uses unicast registers.  Let's add
> proper MCR programming on the relevant platforms/GTs.
>
> Given that we PAT tables to change pretty regularly on future platforms,
> we'll make PAT programming an exception to the usual model of assuming
> new platforms should inherit the previous platform's behavior.  Instead
> we'll raise a warning if the current platform isn't handled in the
> if/else ladder.  This should help prevent subtle cache misbehavior if we
> forget to add the table for a new platform.
>
> Bspec: 66534, 67609, 67788
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Nirmoy Das<nirmoy.das@intel.com>

> ---
>   drivers/gpu/drm/xe/xe_pat.c | 35 ++++++++++++++++++++++++++++-------
>   1 file changed, 28 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
> index 75d25e0c0b9a..f511d9a54358 100644
> --- a/drivers/gpu/drm/xe/xe_pat.c
> +++ b/drivers/gpu/drm/xe/xe_pat.c
> @@ -5,9 +5,10 @@
>   
>   #include "regs/xe_reg_defs.h"
>   #include "xe_gt.h"
> +#include "xe_gt_mcr.h"
>   #include "xe_mmio.h"
>   
> -#define GEN12_PAT_INDEX(index)			_MMIO(0x4800 + (index) * 4)
> +#define _PAT_INDEX(index)			(0x4800 + (index) * 4)
>   
>   #define GEN8_PPAT_WB			(3<<0)
>   #define GEN8_PPAT_WT			(2<<0)
> @@ -56,17 +57,37 @@ const u32 mtl_pat_table[] = {
>   
>   #define PROGRAM_PAT_UNICAST(gt, table) do { \
>   	for (int i = 0; i < ARRAY_SIZE(table); i++) \
> -		xe_mmio_write32(gt, GEN12_PAT_INDEX(i).reg, table[i]); \
> +		xe_mmio_write32(gt, _PAT_INDEX(i), table[i]); \
> +} while (0)
> +
> +#define PROGRAM_PAT_MCR(gt, table) do { \
> +	for (int i = 0; i < ARRAY_SIZE(table); i++) \
> +		xe_gt_mcr_multicast_write(gt, MCR_REG(_PAT_INDEX(i)), table[i]); \
>   } while (0)
>   
>   void xe_pat_init(struct xe_gt *gt)
>   {
>   	struct xe_device *xe = gt_to_xe(gt);
>   
> -	if (xe->info.platform == XE_METEORLAKE)
> -		PROGRAM_PAT_UNICAST(gt, mtl_pat_table);
> -	else if (xe->info.platform == XE_PVC)
> -		PROGRAM_PAT_UNICAST(gt, pvc_pat_table);
> -	else
> +	if (xe->info.platform == XE_METEORLAKE) {
> +		if (xe_gt_is_media_type(gt))
> +			PROGRAM_PAT_UNICAST(gt, mtl_pat_table);
> +		else
> +			PROGRAM_PAT_MCR(gt, mtl_pat_table);
> +	} else if (xe->info.platform == XE_PVC) {
> +		PROGRAM_PAT_MCR(gt, pvc_pat_table);
> +	} else if (xe->info.platform == XE_DG2) {
> +		PROGRAM_PAT_MCR(gt, pvc_pat_table);
> +	} else if (GRAPHICS_VERx100(xe) <= 1210) {
>   		PROGRAM_PAT_UNICAST(gt, tgl_pat_table);
> +	} else {
> +		/*
> +		 * Going forward we expect to need new PAT settings for most
> +		 * new platforms; failure to provide a new table can easily
> +		 * lead to subtle, hard-to-debug problems.  If none of the
> +		 * conditions above match the platform we're running on we'll
> +		 * raise an error rather than trying to silently inherit the
> +		 * most recent platform's behavior.
> +		 */
> +	}
>   }

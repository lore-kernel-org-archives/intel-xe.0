Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0CDBC001B0
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jul 2023 17:48:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 826EC10E04B;
	Wed, 26 Jul 2023 17:48:14 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2EA710E04B
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Jul 2023 17:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690393692; x=1721929692;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=DI1T91tYM9L9iBNhqsR+9iarzjKxB6qFRZFg2u1w2bM=;
 b=QaTxXTGnIWPI10g2nfWTZ5tYF4mctdzoftsc/zIEi1Lcspgtm/SrpJxm
 QTDcznd/8RPvlw1IB6EMuMvYcMoL6FESDPqX63rUPhaIq8HnoICyVhBfz
 QWG8vl+X5ytOiR3vpF0QHR2erDQDh2iTgJ9DUXjNUIJPoGms10jBADl17
 Q3+UCRpLg4QvwPUgHkI6M/u6Zas8ii6DuGrP7rKUg9WdbZnUOBI4qrBzf
 ko0At0AseiPS8yfjWO8gbjTU8277uPr2xfNbWc6G25fMyYP3WR5qFtL2/
 RiLbDW1/SkfGA2kcaAb96QBWnchvjg3Qddve/ghYyaWrrf14RvDa4kntu A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="365547984"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; d="scan'208";a="365547984"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2023 10:48:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="973211514"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; d="scan'208";a="973211514"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmsmga006.fm.intel.com with ESMTP; 26 Jul 2023 10:48:10 -0700
Received: from [10.249.132.189] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.132.189])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 8D03D34936;
 Wed, 26 Jul 2023 18:48:09 +0100 (IST)
Message-ID: <5ec69caa-bad8-0bf8-b3a6-69581181bbd4@intel.com>
Date: Wed, 26 Jul 2023 19:48:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Content-Language: en-US
To: Francois Dugast <francois.dugast@intel.com>,
 intel-xe@lists.freedesktop.org, Matt Roper <matthew.d.roper@intel.com>
References: <20230726154010.7-1-francois.dugast@intel.com>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20230726154010.7-1-francois.dugast@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH] drm/xe: Remove unused xe_gt_WARN* macros
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



On 26.07.2023 17:40, Francois Dugast wrote:
> Those specific macros are not used, removing them to prevent using
> another flavor of WARN().

maybe instead of removing them we should rather convert other places,
which are using less useful generic WARN, even if they are GT related:

./xe_guc_ads.c:320:     XE_WARN_ON(ads->golden_lrc_size +
./xe_guc_submit.c:709:          XE_WARN_ON("Pending enable failed to
respond");
./xe_guc_submit.c:793:  XE_WARN_ON(!xe_engine_is_lr(e));
./xe_guc_submit.c:815:                  XE_WARN_ON("Schedule disable
failed to respond");
./xe_guc_submit.c:837:          XE_WARN_ON(e->flags & ENGINE_FLAG_KERNEL);
./xe_guc_submit.c:838:          XE_WARN_ON(e->flags & ENGINE_FLAG_VM &&
!engine_killed(e));
./xe_guc_submit.c:891:                  XE_WARN_ON("Schedule disable
failed to respond");
./xe_guc_submit.c:1174:         XE_WARN_ON(e->class);
./xe_ggtt.c:246:                XE_WARN_ON(seqno <= 0);
./xe_ggtt.c:379:        XE_WARN_ON(err);
./xe_ggtt.c:460:        if (XE_WARN_ON(bo->ggtt_node.size)) {
./xe_ggtt.c:510:        if (XE_WARN_ON(!bo->ggtt_node.size))
./xe_gt.c:341:  XE_WARN_ON(err);
./xe_gt.c:417:  XE_WARN_ON(err);
./xe_gt.c:586:  XE_WARN_ON(err);
./xe_gt.c:593:  XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt),
XE_FORCEWAKE_ALL));
./xe_gt.c:595:  XE_WARN_ON(xe_uc_start(&gt->uc));
./xe_gt.c:624:  XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt),
XE_FORCEWAKE_ALL));
./xe_gt.c:628:  XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt),
XE_FORCEWAKE_ALL));
./xe_gt.c:651:  XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt),
XE_FORCEWAKE_ALL));
./xe_gt.c:658:  XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt),
XE_FORCEWAKE_ALL));
./xe_gt.c:679:  XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt),
XE_FORCEWAKE_ALL));
./xe_gt.c:686:  XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt),
XE_FORCEWAKE_ALL));
./xe_gt_topology.c:24:  if (drm_WARN_ON(&gt_to_xe(gt)->drm, numregs >
XE_MAX_DSS_FUSE_REGS))
./xe_gt_topology.c:93:  drm_WARN_ON(&xe->drm, num_geometry_regs > 1);
./xe_gt_topology.c:94:  drm_WARN_ON(&xe->drm, num_compute_regs > 2);
./xe_guc.c:869: XE_WARN_ON(xe_guc_pc_stop(&guc->pc));
./xe_guc.c:894: XE_WARN_ON(ret);
./xe_gt_mcr.c:297:              drm_WARN_ON(&xe->drm, MEDIA_VER(xe) < 13);
./xe_gt_mcr.c:399:      drm_WARN(&gt_to_xe(gt)->drm, true,
./xe_gt_mcr.c:429:      drm_WARN_ON_ONCE(&xe->drm, ret == -ETIMEDOUT);

also note that there is some in flight code that is relying on these
macros (as GT oriented messages are proved to be helpful in development
and maintenance)

Michal

> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_printk.h | 15 ---------------
>  1 file changed, 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_printk.h b/drivers/gpu/drm/xe/xe_gt_printk.h
> index 5991bcadd47e..95aa7173fbb2 100644
> --- a/drivers/gpu/drm/xe/xe_gt_printk.h
> +++ b/drivers/gpu/drm/xe/xe_gt_printk.h
> @@ -16,9 +16,6 @@
>  #define xe_gt_err(_gt, _fmt, ...) \
>  	xe_gt_printk((_gt), err, _fmt, ##__VA_ARGS__)
>  
> -#define xe_gt_warn(_gt, _fmt, ...) \
> -	xe_gt_printk((_gt), warn, _fmt, ##__VA_ARGS__)
> -
>  #define xe_gt_notice(_gt, _fmt, ...) \
>  	xe_gt_printk((_gt), notice, _fmt, ##__VA_ARGS__)
>  
> @@ -31,16 +28,4 @@
>  #define xe_gt_err_ratelimited(_gt, _fmt, ...) \
>  	xe_gt_printk((_gt), err_ratelimited, _fmt, ##__VA_ARGS__)
>  
> -#define xe_gt_WARN(_gt, _condition, _fmt, ...) \
> -	drm_WARN(&gt_to_xe(_gt)->drm, _condition, "GT%u: " _fmt, (_gt)->info.id, ##__VA_ARGS__)
> -
> -#define xe_gt_WARN_ONCE(_gt, _condition, _fmt, ...) \
> -	drm_WARN_ONCE(&gt_to_xe(_gt)->drm, _condition, "GT%u: " _fmt, (_gt)->info.id, ##__VA_ARGS__)
> -
> -#define xe_gt_WARN_ON(_gt, _condition) \
> -	xe_gt_WARN((_gt), _condition, "%s(%s)", "gt_WARN_ON", __stringify(_condition))
> -
> -#define xe_gt_WARN_ON_ONCE(_gt, _condition) \
> -	xe_gt_WARN_ONCE((_gt), _condition, "%s(%s)", "gt_WARN_ON_ONCE", __stringify(_condition))
> -
>  #endif

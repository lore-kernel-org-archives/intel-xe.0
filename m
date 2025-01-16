Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D75E3C02183
	for <intel-xe@archiver.kernel.org>; Thu, 16 Jan 2025 14:45:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A42F810E991;
	Thu, 16 Jan 2025 14:45:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UzEoVTfM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D77910E991
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Jan 2025 14:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737038738; x=1768574738;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=kUjzflYUzEKY39Ai9QnzoDoRXplJuok5AeFPM0vR/KA=;
 b=UzEoVTfMmuh8SwWwnKRDdtKVI4SY645lM+jwqtZN+o6ixTWcwJWYb4TC
 r9xhyjcBXfhwg8UQrRI5dp0eDHH7GWtDEygmjl1KWHdL7k6zvzRNjjDTW
 NLqx6XX9UajhFDtVOH+fU6c69bRQN2AFi9AHH8scdmES0qMX6aAoKmqeM
 hq7PRSGXBHCtbQSILCt2TZB/XPT9k9mlDq1F3ceoA7P66gbcULDi0mo0N
 bcg/LMGAMEF2Cya9sZKOO3RyOOGHWuqVwcYDjnXj2YbNR3qDLnQY88mDA
 NUSKaDPophJIc5/Zt3WdZcHAOG6qXUoLWWd11qmYh5I3TtojU4xy4Um/K Q==;
X-CSE-ConnectionGUID: 5WA7J5rfQhu694DoE+Ot6w==
X-CSE-MsgGUID: DjNMEevWRH2ChisrD1+IEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11317"; a="40237613"
X-IronPort-AV: E=Sophos;i="6.13,209,1732608000"; d="scan'208";a="40237613"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2025 06:45:38 -0800
X-CSE-ConnectionGUID: mwtuRK6ARluhVido45L7QQ==
X-CSE-MsgGUID: et16Ju6RTTyZnSjef8NIcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="105975043"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2)
 ([10.125.109.57])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2025 06:45:26 -0800
Date: Thu, 16 Jan 2025 08:45:26 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Aradhya Bhatia <aradhya.bhatia@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>, 
 Intel XE List <intel-xe@lists.freedesktop.org>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>, 
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Ayaz A Siddiqui <ayaz.siddiqui@intel.com>
Subject: Re: [PATCH v2 1/2] drm/xe/xe: Add Wa_16021333562 and Wa_14016712196
Message-ID: <2dssrgaez7pygz7m43tjx2h7zydrhj5obway6xdhuju7s6kqqs@2uaatfeyu3ad>
References: <20250116091004.3060996-1-aradhya.bhatia@intel.com>
 <20250116091004.3060996-2-aradhya.bhatia@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250116091004.3060996-2-aradhya.bhatia@intel.com>
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

On Thu, Jan 16, 2025 at 02:40:03PM +0530, Aradhya Bhatia wrote:
>Wa_16021333562 and Wa_14016712196 are permanent workarounds that apply
>to multiple platforms. Wa_16021333562 applies to platforms ranging from
>TGL (12.00) to Xe_LPM (13.00), while Wa_14016712196 from DG2 (12.55) to
>Xe_LPG (12.74).
>
>Signed-off-by: Aradhya Bhatia <aradhya.bhatia@intel.com>
>---
> drivers/gpu/drm/xe/xe_guc_ads.c    | 5 +++++
> drivers/gpu/drm/xe/xe_ring_ops.c   | 3 +++
> drivers/gpu/drm/xe/xe_wa_oob.rules | 2 ++
> 3 files changed, 10 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
>index fab259adc380..8ef044ddd682 100644
>--- a/drivers/gpu/drm/xe/xe_guc_ads.c
>+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
>@@ -376,6 +376,11 @@ static void guc_waklv_init(struct xe_guc_ads *ads)
> 					GUC_WORKAROUND_KLV_ID_BACK_TO_BACK_RCS_ENGINE_RESET,
> 					&offset, &remain);
>
>+	if (XE_WA(gt, 16021333562))
>+		guc_waklv_enable_simple(ads,
>+					GUC_WORKAROUND_KLV_BLOCK_INTERRUPTS_WHEN_MGSR_BLOCKED,
>+					&offset, &remain);
>+
> 	size = guc_ads_waklv_size(ads) - remain;
> 	if (!size)
> 		return;
>diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
>index 9f327f27c072..22c226c30df9 100644
>--- a/drivers/gpu/drm/xe/xe_ring_ops.c
>+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
>@@ -192,6 +192,9 @@ static int emit_render_cache_flush(struct xe_sched_job *job, u32 *dw, int i)
> 	else if (job->q->class == XE_ENGINE_CLASS_COMPUTE)
> 		flags &= ~PIPE_CONTROL_3D_ENGINE_FLAGS;
>
>+	if (XE_WA(gt, 14016712196))
>+		i = emit_pipe_control(dw, i, 0, PIPE_CONTROL_DEPTH_CACHE_FLUSH, 0, 0);
>+
> 	return emit_pipe_control(dw, i, PIPE_CONTROL0_HDC_PIPELINE_FLUSH, flags, 0, 0);
> }
>
>diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
>index 40438c3d9b72..536b91cc4d3f 100644
>--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
>+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
>@@ -42,3 +42,5 @@
> no_media_l3	MEDIA_VERSION(3000)
> 14022866841	GRAPHICS_VERSION(3000), GRAPHICS_STEP(A0, B0)
> 		MEDIA_VERSION(3000), MEDIA_STEP(A0, B0)
>+16021333562	GRAPHICS_VERSION_RANGE(1200, 1300)

this doesn't match the wa db. I think it should be:

16021333562	GRAPHICS_VERSION_RANGE(1200, 1274)
		MEDIA_VERSION(1300)

... so it doesn´t mach more than it should for the graphics gt and less
than it should for media gt.

Matt Roper, any idea why in i915 it's matching less than it should? Is
it because prior to DG2, the platforms were not officially using GuC?
There we have:

	/* Wa_16021333562 */
	if ((GUC_FIRMWARE_VER(guc) >= MAKE_GUC_VER(70, 21, 1)) &&
	    (IS_GFX_GT_IP_RANGE(gt, IP_VER(12, 70), IP_VER(12, 74)) ||
	     IS_MEDIA_GT_IP_RANGE(gt, IP_VER(13, 0), IP_VER(13, 0)) ||
	     IS_DG2(gt->i915)))
		guc_waklv_enable_simple(guc, &offset, &remain,
					GUC_WORKAROUND_KLV_BLOCK_INTERRUPTS_WHEN_MGSR_BLOCKED);

or because GuC implements GUC_WORKAROUND_KLV_BLOCK_INTERRUPTS_WHEN_MGSR_BLOCKED
only for newer platforms... ?

Also, why are we not using this graphics range?

	IS_GFX_GT_IP_RANGE(gt, IP_VER(12, 55), IP_VER(12, 74))

 From the WA db, 12.60 (aka PVC) is also affected.

Lucas De Marchi

>+14016712196	GRAPHICS_VERSION_RANGE(1255, 1274)
>-- 
>2.34.1
>

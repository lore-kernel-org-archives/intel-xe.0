Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40727E7717F
	for <intel-xe@archiver.kernel.org>; Mon, 16 Dec 2024 11:28:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E1CF10E5AD;
	Mon, 16 Dec 2024 11:28:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ljwckhFh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CBD910E5AD
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Dec 2024 11:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734348520; x=1765884520;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=Z94fXHQJaw97Qi7hepebvWrM3hT9zldygDTf+doe3ww=;
 b=ljwckhFhOy0SxiwxsgwGYq8CK2MJP7AyjUra3/3AqpINMYLh3VM4Tuff
 kjav0Tetwn3Pu+rOh5vcirks70tEQJMWCXVhlGiEzGe4AG4vqOH6RvikY
 OkN47aiXyDoAc2klyd25IZitIIRahgHem/FX+vdFzfNE3pcutYu+wKhoE
 TwGSPfAsWsTRuOev0fsAsjbgEBPO6ZwvJsU/5X87zXuC3jWNry9ZdfZDi
 CxJe5B+8lVbbO8GizwZvtfL+rNfL0/8BHu4hOSeiX+WasUZJvIyQo7d4D
 ksoubKexza0a0x2cL9RLuVKx/Q4Q22hG3lBZ8fvOFaM1xIQPlQNaPCKZB w==;
X-CSE-ConnectionGUID: Cxd4GDeeQ9uKE/Frxb/zCw==
X-CSE-MsgGUID: uNbP3RKQRGmqZcuLRApeEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="38654750"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="38654750"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2024 03:28:40 -0800
X-CSE-ConnectionGUID: cG4RAVKEQBmoW9vetThkqQ==
X-CSE-MsgGUID: x21MxVMZTKqI3weijHsdmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="134505464"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.245])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2024 03:28:38 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>, intel-xe@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com, saurabhg.gupta@intel.com, alex.zuo@intel.com
Subject: Re: [PATCH] drm/i915/display: Do not report timeout on suspend
In-Reply-To: <20241213231234.81647-1-jonathan.cavitt@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241213231234.81647-1-jonathan.cavitt@intel.com>
Date: Mon, 16 Dec 2024 13:28:35 +0200
Message-ID: <87wmfzsw7w.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Fri, 13 Dec 2024, Jonathan Cavitt <jonathan.cavitt@intel.com> wrote:
> In intel_dp_aux_wait_done, we call intel_de_wait_custom.  This call has
> a 10ms timeout before reporting ETIMEDOUT.  However, if the display pm
> runtime is suspended, then it would be expected for this call to time
> out.  This may be the case, for example, during an engine reset.
>
> Do not report ETIMEDOUT here when the pm runtime is suspended.
>
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>

PS. Please *always* Cc: intel-gfx for i915 display patches.

> ---
>  drivers/gpu/drm/i915/display/intel_dp_aux.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux.c b/drivers/gpu/drm/i915/display/intel_dp_aux.c
> index 04a7acd7f73c..25c37398f930 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_aux.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_aux.c
> @@ -66,7 +66,7 @@ intel_dp_aux_wait_done(struct intel_dp *intel_dp)
>  				   0,
>  				   2, timeout_ms, &status);
>  
> -	if (ret == -ETIMEDOUT)
> +	if (ret == -ETIMEDOUT && !pm_runtime_suspended(display->drm->dev))
>  		drm_err(display->drm,
>  			"%s: did not complete or timeout within %ums (status 0x%08x)\n",
>  			intel_dp->aux.name, timeout_ms, status);

-- 
Jani Nikula, Intel

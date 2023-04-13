Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F854C77B6E
	for <intel-xe@archiver.kernel.org>; Thu, 13 Apr 2023 12:20:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FA9A10EACD;
	Thu, 13 Apr 2023 12:20:49 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30A9B10EACD
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Apr 2023 12:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681388447; x=1712924447;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=NH9pSlvhJS9a6sjwC+LPug6+ObuU2MYbaEI3Zxs0EG8=;
 b=S+zS3mu2BWFjHEU6cPrLkf/a0sXQzEGJT0dvkK66vE8YKBCpt1WY9pWY
 F8hhZwbDuzN8drNYUHaDtPa3Ew3euVBwYi4NrpIdlQ3nQlJkFxLS7j6XW
 iqm2e2npni5ubl8tg1Tk+rd1R+GgAEBYhQG2GANTfCJ8YtWV380SZMBmT
 Z3DG4K7nMy5VQvTGKxj70ngecRnJHSvcXJybTJnIMxXHuuilpe8F2lLHA
 YR/oI0p+Uni9dajRWL/hWINExkgWl5u5GjLhgtFQjXnHTF4pdx0Rl3HkM
 nyG9IE2P0sy7EUW5gebGdP1INEcS/p5URXalHW4G1prKmmXIuKtN0GkaW Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="345959900"
X-IronPort-AV: E=Sophos;i="5.99,341,1677571200"; d="scan'208";a="345959900"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2023 05:20:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="691938744"
X-IronPort-AV: E=Sophos;i="5.99,341,1677571200"; d="scan'208";a="691938744"
Received: from mmcgar2x-mobl1.ger.corp.intel.com (HELO [10.213.231.135])
 ([10.213.231.135])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2023 05:20:44 -0700
Message-ID: <c83e776a-4621-3b4f-384e-4bd43fa41473@linux.intel.com>
Date: Thu, 13 Apr 2023 13:20:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To: Jani Nikula <jani.nikula@intel.com>, intel-xe@lists.freedesktop.org
References: <20230405153920.926583-1-jani.nikula@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20230405153920.926583-1-jani.nikula@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH 00/21] xe & i915 display integration ifdef
 cleanups
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
Cc: joonas.lahtinen@linux.intel.com, lucas.demarchi@intel.com, daniel@ffwll.ch,
 rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


On 05/04/2023 16:38, Jani Nikula wrote:
> Hey all, here's my first batch of #ifdef cleanups for xe and i915
> display integration.
> 
> Many of the patches in this series break the build, and will get fixed
> by subsequent changes. It's pretty much unavoidable as many of the
> changes are standalone to i915, and others are fixups.
> 
> This is pretty straightforward stuff for starters, really. The idea is
> that in the next rebase, the drm/i915 changes here go *before* any of
> the current i915 changes.
> 
> Adding the static inline stubs for xe build in i915 (the !I915 parts) is
> very helpful in not sprinkling #ifdefs all over the place. A lot of the
> time, the compiler is able to just compile out lots and lots of
> unreachable static functions and data without explicitly conditionally
> building them out. We can leave a lot of it out from "drm/i915/display:
> Remaining changes to make xe compile". This is crucial especially while
> upstreaming by keeping the changes to i915 minimal.
> 
> Also, I think the conditional build and stubs in headers is the least
> intrusive way of going about this before xe is actually upstream, and it
> also follows the usual patterns for CONFIG_FOO=n code paths, albeit I915
> is defined in the Makefile, not in kconfig.

I think the sheer amount of static inline dummies is not nice at all and 
I certainly wouldn't support it for the long term, or proper solution. 
Not to mention it is catering for out of tree code which is quite an 
atypical accommodation.

So sadly no ack from me but given DRM maintainers approve this approach 
I don't intend to attempt to block it either. FWIW and for the record only.

Regards,

Tvrtko

> 
> BR,
> Jani.
> 
> 
> 
> Jani Nikula (21):
>    fixup! drm/i915/display: Set DISPLAY_MMIO_BASE to 0 for xe
>    drm/i915: define I915 during i915 driver build
>    drm/i915/display: add I915 conditional build to intel_lvds.h
>    fixup! drm/xe/display: Implement display support
>    drm/i915/display: add I915 conditional build to hsw_ips.h
>    fixup! drm/i915/display: Remaining changes to make xe compile
>    fixup! drm/xe/display: Implement display support
>    drm/i915/display: add I915 conditional build to i9xx_plane.h
>    fixup! drm/i915/display: Remaining changes to make xe compile
>    fixup! drm/i915/display: Remaining changes to make xe compile
>    drm/i915/display: add I915 conditional build to intel_lpe_audio.h
>    fixup! drm/i915/display: Remaining changes to make xe compile
>    drm/i915/display: add I915 conditional build to intel_pch_refclk.h
>    fixup! drm/i915/display: Remaining changes to make xe compile
>    drm/i915/display: add I915 conditional build to intel_pch_display.h
>    drm/i915/display: add I915 conditional build to intel_sprite.h
>    fixup! drm/i915/display: Remaining changes to make xe compile
>    fixup! drm/xe/display: Implement display support
>    drm/i915/display: add I915 conditional build to intel_overlay.h
>    fixup! drm/i915/display: Remaining changes to make xe compile
>    fixup! drm/xe/display: Implement display support
> 
>   drivers/gpu/drm/i915/display/hsw_ips.h        | 35 +++++++++++
>   drivers/gpu/drm/i915/display/i9xx_plane.h     | 23 +++++++
>   drivers/gpu/drm/i915/display/intel_cdclk.c    |  4 +-
>   drivers/gpu/drm/i915/display/intel_crtc.c     |  6 +-
>   drivers/gpu/drm/i915/display/intel_display.c  | 15 +----
>   .../gpu/drm/i915/display/intel_lpe_audio.h    | 20 ++++--
>   drivers/gpu/drm/i915/display/intel_lvds.h     | 19 ++++++
>   drivers/gpu/drm/i915/display/intel_overlay.h  | 35 +++++++++++
>   .../gpu/drm/i915/display/intel_pch_display.h  | 63 +++++++++++++++----
>   .../gpu/drm/i915/display/intel_pch_refclk.h   | 25 ++++++--
>   drivers/gpu/drm/i915/display/intel_sprite.c   | 20 +-----
>   drivers/gpu/drm/i915/display/intel_sprite.h   |  8 +++
>   drivers/gpu/drm/xe/Makefile                   |  2 -
>   .../gpu/drm/xe/compat-i915-headers/i915_drv.h |  7 +--
>   14 files changed, 211 insertions(+), 71 deletions(-)
> 

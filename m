Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37E9BD1CDC6
	for <intel-xe@archiver.kernel.org>; Tue,  9 Dec 2025 14:25:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F391A10E628;
	Tue,  9 Dec 2025 14:25:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DX4hvApu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F2B710E622
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Dec 2025 14:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765290348; x=1796826348;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=ucVSoSN4I6+YLTRqxl2VishqQasCdMKvCI9cS/ndCzU=;
 b=DX4hvApuuqB8MybX542s7xykg8bd/VUcnOZ40GPILg71RZsPMhbLr68y
 i/FL5AXJ28oyiP0iYmb2HCqph44jMfRp6642l4MRtgBe28YXxaN42pFFq
 eUoN+EZx9++sQpTLRy31HzxQGSso8awqIUB2vpCgYbp6nBnaduJUrp0I+
 8bw+9iX64tpBWp0li1l9Cc+9ednct0PKwATozg+E9L4y1tLoFMcRNagpn
 vx+L0oLAtRxaENpCpnB/j/X9eUdh7aT4NOaVcQ3bPlsh1jPPqb9dPMFKH
 bD6ZLFXoo4pre8qN1WKLrrJVvA9ODUXGQ6s8QEoIZhM3R7AdeaC979G/Q A==;
X-CSE-ConnectionGUID: gpRcNUihRguB6y/F1e4IRQ==
X-CSE-MsgGUID: rPKg5U8kRuSbhMbaw2PaTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="71105810"
X-IronPort-AV: E=Sophos;i="6.20,261,1758610800"; d="scan'208";a="71105810"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 06:25:47 -0800
X-CSE-ConnectionGUID: R4Zm+GHwRX+G6n98tApEOA==
X-CSE-MsgGUID: t14pBJa/QeqMCYEHxZji0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,261,1758610800"; d="scan'208";a="196243307"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.245.194])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 06:25:45 -0800
Date: Tue, 9 Dec 2025 16:25:41 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Tvrtko Ursulin <tursulin@igalia.com>
Cc: intel-xe@lists.freedesktop.org, kernel-dev@igalia.com,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v15 06/10] drm/xe: Handle DPT in system memory
Message-ID: <aTgxZTjU398-jnf3@intel.com>
References: <20251208191722.7194-1-tursulin@igalia.com>
 <20251208191722.7194-7-tursulin@igalia.com>
 <aTfxySrZ-O1Bplcm@intel.com>
 <2b912c41-a03a-40cc-8bf0-f70558ffdafc@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2b912c41-a03a-40cc-8bf0-f70558ffdafc@igalia.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

On Tue, Dec 09, 2025 at 03:10:03PM +0100, Tvrtko Ursulin wrote:
> 
> On 09/12/2025 10:54, Ville Syrjälä wrote:
> > On Mon, Dec 08, 2025 at 08:17:17PM +0100, Tvrtko Ursulin wrote:
> >> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> >>
> >> If DPT is allocated from system memory it will be created in the default
> >> write-back cached mode. This means we need to flush it after populating
> >> otherwise nothing works.
> >>
> >> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> >> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> >> ---
> >>   drivers/gpu/drm/xe/display/xe_fb_pin.c | 4 ++++
> >>   1 file changed, 4 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> >> index a22a9182dadb..89ee68c40329 100644
> >> --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
> >> +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> >> @@ -3,6 +3,7 @@
> >>    * Copyright © 2021 Intel Corporation
> >>    */
> >>   
> >> +#include <drm/drm_cache.h>
> >>   #include <drm/ttm/ttm_bo.h>
> >>   
> >>   #include "i915_vma.h"
> >> @@ -162,6 +163,9 @@ static int __xe_pin_fb_vma_dpt(const struct intel_framebuffer *fb,
> >>   					  rot_info->plane[i].dst_stride);
> >>   	}
> >>   
> >> +	if (!xe_bo_is_vram(dpt) && !xe_bo_is_stolen(dpt))
> >> +		drm_clflush_virt_range(dpt->vmap.vaddr, dpt_size);
> > How is anything working currently if the DPT is being
> > created with the wrong caching mode?
> 
> I suspect the stolen allocation never fails in practice (or almost 
> never, or at least not in CI).
> > Sounds like someone should fix the DPT creation to correctly
> > ask for UC/WC. But I suppose someone should measure if WB+flush
> > is actually faster...
> 
> I am not sure what is desired here. System memory buffers defaulting to 
> cached is the xe default, so should DPT be an exception I do not know.

Anything meant for the display engine is supposed to be uncached.

> 
> In any case AuxCCS seems to only work with DPT in system memory and this 
> clflush. DPT in stolen with GTT access and GTT flushing (as i915 does 
> it) does not seem to work for xe. I guess the entity doing the DPT reads 
> is somehow special coherency wise.

Sounds like there is still something broken in xe.

-- 
Ville Syrjälä
Intel

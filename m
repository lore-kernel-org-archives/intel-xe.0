Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81179D358E5
	for <intel-xe@archiver.kernel.org>; Thu, 29 Jan 2026 08:47:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2130810E310;
	Thu, 29 Jan 2026 08:47:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MOB3YNS9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDBDB10E310;
 Thu, 29 Jan 2026 08:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769676422; x=1801212422;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=L71OzREL+PGCfbfmVUpeYOzvz8avBY+zXPIJIRs7G1c=;
 b=MOB3YNS9bobHGuTMP88u3QGG7OWflKSynpSJrgLQM7SvMSioqsHbQNgs
 OoQa1thvCuTaVYcDWN86YhEqePGmPsSwSd02oP2T3kyOBYjzei6NdD8ka
 VwfE7WCShNBQjw0wjVx9ul/IY9ASZLsPMCXwctk5H8K8YIENfYAJeao22
 bTVHfMkHnD89i/gcrrbW/2whduXJaqSWovalQMaWdLzC3wdHEVP87AWX/
 mLL7ApYzUORZQCs1LR9nmn40vvRiaQZUjGLC/LtTqLGLxByJn9wcskIRD
 kAsj7iBxKhh79yEVz8ekSqLtYc3KnNL8iyIVIcoRc0Y38BrSxMJ9Au/eW w==;
X-CSE-ConnectionGUID: 1+JO1XowRZGuuJHikrYlqQ==
X-CSE-MsgGUID: rHeCa+3pRxmUI+fdehH4AQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="74766439"
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; d="scan'208";a="74766439"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 00:46:50 -0800
X-CSE-ConnectionGUID: w+xFLbRuQJaSkxn+dK40ng==
X-CSE-MsgGUID: zDXS3mN4S7Wz0gryRkGE+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; d="scan'208";a="208117659"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.4])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 00:46:49 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 3/4] drm/i915/gvt: drop dependency on intel_display_types.h
In-Reply-To: <8132cd5e-9592-418b-b065-4146ba2e80da@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <cover.1769612208.git.jani.nikula@intel.com>
 <2fa5677f5ff3dbeaa75a7984d74fb9855a4ba3d2.1769612208.git.jani.nikula@intel.com>
 <8132cd5e-9592-418b-b065-4146ba2e80da@intel.com>
Date: Thu, 29 Jan 2026 10:46:46 +0200
Message-ID: <daa9d9232b56524810d484c30db3d2cc18d0fef3@intel.com>
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

On Thu, 29 Jan 2026, "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com> wrote:
> On 1/28/2026 8:29 PM, Jani Nikula wrote:
>> Avoid even accidental use of display details by dropping the include of
>> intel_display_types.h. We'll still have to include intel_dpll_mgt.h for
>
>
> s/intel_dpll_mgt.h/intel_dpll_mgr.h

Thanks, fixed while applying. And pushed the lot to din.

BR,
Jani.

>
> Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
>
>
>> the DPLL IDs, but at least the surface is smaller.
>>
>> Add duplicate defines of pipe_name() and port_name() to avoid depending
>> on display. They're trivial enough to be acceptable.
>>
>> Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gvt/handlers.c | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/gvt/handlers.c
>> index 383b04160559..6f860c320afc 100644
>> --- a/drivers/gpu/drm/i915/gvt/handlers.c
>> +++ b/drivers/gpu/drm/i915/gvt/handlers.c
>> @@ -46,10 +46,10 @@
>>   #include "display/intel_crt_regs.h"
>>   #include "display/intel_cursor_regs.h"
>>   #include "display/intel_display_regs.h"
>> -#include "display/intel_display_types.h"
>>   #include "display/intel_dmc_regs.h"
>>   #include "display/intel_dp_aux_regs.h"
>>   #include "display/intel_dpio_phy.h"
>> +#include "display/intel_dpll_mgr.h"
>>   #include "display/intel_fbc.h"
>>   #include "display/intel_fdi_regs.h"
>>   #include "display/intel_pps_regs.h"
>> @@ -79,6 +79,9 @@
>>   #define PCH_PP_OFF_DELAYS _MMIO(0xc720c)
>>   #define PCH_PP_DIVISOR _MMIO(0xc7210)
>>   
>> +#define pipe_name(p) ((p) + 'A')
>> +#define port_name(p) ((p) + 'A')
>> +
>>   unsigned long intel_gvt_get_device_type(struct intel_gvt *gvt)
>>   {
>>   	struct drm_i915_private *i915 = gvt->gt->i915;

-- 
Jani Nikula, Intel

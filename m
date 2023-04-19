Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E078C6FD18
	for <intel-xe@archiver.kernel.org>; Wed, 19 Apr 2023 19:40:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E173210EAC6;
	Wed, 19 Apr 2023 19:40:02 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B4DD10EA8F
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Apr 2023 19:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681933201; x=1713469201;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=ulJLi5qElzS67gD0Qv5B6WoAahy/LBSDswcGWWFQpm0=;
 b=I46VglcTrxu3gHHgGOf7cuvSFv3nl6R/3CckG9EgDm4qTwsGOtjDcPFr
 CXjI2cnphWz0s/Cdvye/GCCJHKmlmv/189lYUqzmTxSrMyaMPrTb4KQ93
 p5UWfUYQHH0YiPvhC0DPj9nyKxWlkgYpBnD/LkPHwsxybM7+0GxGxbkxK
 53BKOAbKf9SPLQL3maIL2AiNdPEBH0mSP8dH0mUO46/5r0I8qLh8xE/SD
 72DxnhWUjqQ/uIc3xR80jjzBqxUEXJviVvirSB/vPkb0S+ViK1zxkPs9k
 ndn51NBn8eLDibytee3MAXsyyQJvayBlWXqz2XGm255AV7I5wMSha+VHT w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="347397542"
X-IronPort-AV: E=Sophos;i="5.99,210,1677571200"; d="scan'208";a="347397542"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 12:40:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="685079185"
X-IronPort-AV: E=Sophos;i="5.99,210,1677571200"; d="scan'208";a="685079185"
Received: from yedidyal-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.47.37])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 12:39:58 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
In-Reply-To: <mm6nc5ppga2akxpc4k2czr3awwn2qnytnblq4jpiocskaxmtap@hyvm3eerh7vd>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230419074440.4006398-1-lucas.demarchi@intel.com>
 <20230419074440.4006398-12-lucas.demarchi@intel.com>
 <87bkjjyhyc.fsf@intel.com>
 <mm6nc5ppga2akxpc4k2czr3awwn2qnytnblq4jpiocskaxmtap@hyvm3eerh7vd>
Date: Wed, 19 Apr 2023 22:39:55 +0300
Message-ID: <871qkfy838.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-xe] [PATCH 11/17] drm/xe: Introduce xe_reg_t
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
Cc: Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, 19 Apr 2023, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> On Wed, Apr 19, 2023 at 07:06:51PM +0300, Jani Nikula wrote:
>>On Wed, 19 Apr 2023, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>>> Stop using i915 types for register our own xe_reg_t. Differently from
>>> i915, this will keep under this will keep under the register definition
>>> the knowledge for the different types of registers. For now, the "flags"
>>> are mcr and masked, although only the former is being used.
>>>
>>> Most of the driver is agnostic to the register differences. Convert the
>>> few places that care about that, namely xe_gt_mcr.c, to take the generic
>>> type and warn if the wrong register is used.
>>>
>>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>> ---
>>>  drivers/gpu/drm/xe/regs/xe_reg_defs.h | 15 +++++++++++++++
>>>  drivers/gpu/drm/xe/xe_gt_mcr.c        | 22 ++++++++++++++++------
>>>  drivers/gpu/drm/xe/xe_gt_mcr.h        |  8 ++++----
>>>  drivers/gpu/drm/xe/xe_irq.c           |  2 +-
>>>  drivers/gpu/drm/xe/xe_mmio.c          |  2 +-
>>>  5 files changed, 37 insertions(+), 12 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/regs/xe_reg_defs.h b/drivers/gpu/drm/xe/regs/xe_reg_defs.h
>>> index b5c25e31b889..1e78508c737b 100644
>>> --- a/drivers/gpu/drm/xe/regs/xe_reg_defs.h
>>> +++ b/drivers/gpu/drm/xe/regs/xe_reg_defs.h
>>> @@ -8,4 +8,19 @@
>>>
>>>  #include "compat-i915-headers/i915_reg_defs.h"
>>>
>>> +typedef union {
>>> +	struct {
>>> +		u32 reg:30;
>>> +		u32 mcr:1;
>>> +		u32 masked:1;
>>> +	};
>>> +	u32 raw;
>>> +} xe_reg_t;
>>> +
>>> +/* TODO: remove these once the register declarations are not using them anymore */
>>> +#undef _MMIO
>>> +#undef MCR_REG
>>> +#define _MMIO(r)	((const xe_reg_t){ .reg = (r) })
>>> +#define MCR_REG(r)	((const xe_reg_t){ .reg = (r), .mcr = 1 })
>>> +
>>>  #endif
>>> diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
>>> index aa04ba5a6dbe..b9631cfd5b81 100644
>>> --- a/drivers/gpu/drm/xe/xe_gt_mcr.c
>>> +++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
>>> @@ -360,11 +360,13 @@ void xe_gt_mcr_set_implicit_defaults(struct xe_gt *gt)
>>>   * returned.  Returns false if the caller need not perform any steering
>>>   */
>>>  static bool xe_gt_mcr_get_nonterminated_steering(struct xe_gt *gt,
>>> -						 i915_mcr_reg_t reg,
>>> +						 xe_reg_t reg,
>>>  						 u8 *group, u8 *instance)
>>>  {
>>>  	const struct xe_mmio_range *implicit_ranges;
>>>
>>> +	drm_WARN_ON(&gt_to_xe(gt)->drm, !reg.mcr);
>>
>>I'd add some is_mcr_reg() style macro and use it throughout instead of
>>poking directly at xe_reg_t guts. The idea should be that xe_reg_t is
>>opaque.
>
> humn... in xe the tendency is not to hide too much as it creates a
> unneeded level of indirection. I don't see us needing to change
> xe_reg_t much in future or make it depend on platform, etc.  I think a
> helper like that could be added if we end up with such need.

If you hide the underlying type with a typedef, don't look inside. If
you need to look inside, don't hide the type. See coding-style.rst.

> *changing*  the values underneath the struct is probably something that
> we should avoid doing (there are a few places we do though to account
> for base offset), but I don't see a problem *reading* it. We should
> probably sprinkle some const around.
>
> The extra verbosity imposed by the wrapper function call doesn't bring
> much benefit IMO.

To me, the main benefit is readability and self-documenting code:

	if (reg.mcr)

vs.

	if (is_mcr_reg(reg))


BR,
Jani.

-- 
Jani Nikula, Intel Open Source Graphics Center

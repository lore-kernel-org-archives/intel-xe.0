Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BAEAC4706C
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jan 2024 12:45:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F381510E4F4;
	Tue, 16 Jan 2024 12:45:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CE6710E4F4
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Jan 2024 12:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705409124; x=1736945124;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=udHZArd4C3IzzccZzT7N/e6iDhK+/l1ne/xQhGlKduI=;
 b=UItiv5gF+Djat/DGh2FsbyEfU/yZDeq9E8vwTAH5MTmL35H9soLbxGaP
 AVITuJR6Ts/ZKyBk/+Nqc+tnG5OVdDAxVfD7U2LnI0twl6KzTEafv+i/B
 lXY4U6MgAxezZBKZM6pvXXgLSoPjOKXmEgY6WoSwjmksQj5wifC3faCAW
 0OSdq9YCvKJFjR+D+Y1VsPRCnL2y1qAw3ctcZ6XbXyDV6A0KmJt1oZ030
 RwWqcU80tcZgRHBpiXREUanJJDRlmgNP49FSMYz52wI1jFBBtXvDjT0eA
 ItqKEHQSSg3Mzkoijck/ty1rJs+vQ+TPEu3aRP85cLZUIPpepopH2wxBa w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10954"; a="7234296"
X-IronPort-AV: E=Sophos;i="6.05,199,1701158400"; 
   d="scan'208";a="7234296"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2024 04:45:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,199,1701158400"; d="scan'208";a="18456388"
Received: from jfunnell-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.39.52])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2024 04:45:22 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: "Coelho, Luciano" <luciano.coelho@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [RFC v2 1/4] drm/i915/display: add support for DMC wakelocks
In-Reply-To: <5de5aff06d303129a742a416ef65fea64f4f1d27.camel@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240111091622.1110799-1-luciano.coelho@intel.com>
 <20240111091622.1110799-2-luciano.coelho@intel.com>
 <875xztsbrt.fsf@intel.com>
 <5de5aff06d303129a742a416ef65fea64f4f1d27.camel@intel.com>
Date: Tue, 16 Jan 2024 14:45:19 +0200
Message-ID: <8734uxsazk.fsf@intel.com>
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

On Tue, 16 Jan 2024, "Coelho, Luciano" <luciano.coelho@intel.com> wrote:
> On Tue, 2024-01-16 at 14:28 +0200, Jani Nikula wrote:
>> On Thu, 11 Jan 2024, Luca Coelho <luciano.coelho@intel.com> wrote:
>> > diff --git a/drivers/gpu/drm/i915/display/intel_wakelock.h b/drivers/gpu/drm/i915/display/intel_wakelock.h
>> > new file mode 100644
>> > index 000000000000..a47205e1ea32
>> > --- /dev/null
>> > +++ b/drivers/gpu/drm/i915/display/intel_wakelock.h
>> > @@ -0,0 +1,34 @@
>> > +/* SPDX-License-Identifier: MIT */
>> > +/*
>> > + * Copyright (C) 2023 Intel Corporation
>> > + */
>> > +
>> > +#ifndef __INTEL_WAKELOCK_H__
>> > +#define __INTEL_WAKELOCK_H__
>> > +
>> > +#include <linux/types.h>
>> > +#include <linux/workqueue.h>
>> > +#include <linux/refcount.h>
>> > +
>> > +#include "i915_reg_defs.h"
>> > +
>> > +struct drm_i915_private;
>> > +
>> > +struct intel_display_wl {
>> > +   spinlock_t lock;
>> > +   bool enabled;
>> > +   refcount_t refcount;
>> > +   struct delayed_work work;
>> > +};
>> > +
>> > +struct intel_display_wl_range {
>> > +   u32 start;
>> > +   u32 end;
>> > +};
>> > +
>> > +void intel_display_wl_init(struct drm_i915_private *i915);
>> > +void intel_display_wl_enable(struct drm_i915_private *i915);
>> > +void intel_display_wl_get(struct drm_i915_private *i915, i915_reg_t reg);
>> > +void intel_display_wl_put(struct drm_i915_private *i915, i915_reg_t reg);
>>
>> Nitpick, I'll want the name prefix to match the filename,
>> i.e. intel_foo.[ch] have functions named intel_foo_*.
>
> Okay, so intel_wakelock_*(), specifically in this case?

Yes, though my comment was rather more generic.

As to the actual naming here, I think the first question really is if
"intel wakelock" is specific enough for what you're suggesting.

If yes, I do prefer wakelock over wl. But I don't know. :)

BR,
Jani.



>
> I can also rename the file to intel_wl.[ch] if we want to save
> horizontal real estate, in which case the function names would be
> intel_wl_*(), right?








>
> Thanks!
>
> --
> Cheers,
> Luca.

-- 
Jani Nikula, Intel

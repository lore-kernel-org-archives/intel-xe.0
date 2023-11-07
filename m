Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C42AC4332F
	for <intel-xe@archiver.kernel.org>; Tue,  7 Nov 2023 13:42:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A44F10E601;
	Tue,  7 Nov 2023 13:42:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 317C610E5EE
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Nov 2023 13:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699364522; x=1730900522;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=S8iFiAnowBp5A3KIE5iiGfATqwsQPf+bzW4aeEG7D9g=;
 b=TzbectNF+FLuh8/UXerZ/xrGVzYZ7mfCY5n3f3fmGeU/HfagRBQQKdqp
 HQN5gza4vfiGZ+BqfOK0SQVWFknj5nnZNdRpK0mrcM2T1FE0iBY6ouqRJ
 wWNxpCxLxTRmgHxScaRvY8vlVYfDr0USWTFqWQogKacr8DBDQZOr7Y4tf
 pnQOv2GkjqBd1NIQjILeNuwwYCySljJSYaRjd0lzFD2CZanJxymlRV8W2
 jU1TJ6CfDHpyNyrwVFPqC6HKZOj5hHyRLzm3LHxmCxq38D9FrXjFT9OzK
 1mvXcbZN4SyhxKYmvo6Jc25eXg0KIqE0EGv+IbvQr+bWSguBrVhDqgMzg Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="368847030"
X-IronPort-AV: E=Sophos;i="6.03,283,1694761200"; d="scan'208";a="368847030"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2023 05:42:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="797671679"
X-IronPort-AV: E=Sophos;i="6.03,283,1694761200"; d="scan'208";a="797671679"
Received: from ezorina-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.52.183])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2023 05:42:00 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "Hogander, Jouni" <jouni.hogander@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
In-Reply-To: <6ceb3cddd14ae64e2955c9a4bdf2b37c4d93dc89.camel@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20231106064834.161647-1-jouni.hogander@intel.com>
 <20231106064834.161647-2-jouni.hogander@intel.com>
 <87y1f9yb8d.fsf@intel.com>
 <6ceb3cddd14ae64e2955c9a4bdf2b37c4d93dc89.camel@intel.com>
Date: Tue, 07 Nov 2023 15:41:57 +0200
Message-ID: <87sf5hy922.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Intel-xe] [PATCH 1/8] fixup! drm/xe/display: Implement display
 support
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

On Tue, 07 Nov 2023, "Hogander, Jouni" <jouni.hogander@intel.com> wrote:
> On Tue, 2023-11-07 at 14:54 +0200, Jani Nikula wrote:
>> On Mon, 06 Nov 2023, Jouni H=C3=B6gander <jouni.hogander@intel.com> wrot=
e:
>> > Using i915_fence_timeout causes linking error as
>> > i915_fence_context_timeout
>> > doesn't exist for Xe. Return just MAX_SCHEDULE_TIMEOUT.
>>=20
>> Considering the implementation of i915_fence_context_timeout(), isn't
>> 0
>> more appropriate?
>
> I choose MAX_SCHEDULE_TIMEOUT as current Xe code is using that:
>
> dma_resv_wait_timeout(bo->ttm.base.resv, DMA_RESV_USAGE_KERNEL, false,
> MAX_SCHEDULE_TIMEOUT);
>
> 0 would just return immediately.

So xe and i915 behave differently here. Okay.

I guess go with what xe does. Ack.

>
> BR,
>
> Jouni H=C3=B6gander
>
>>=20
>> BR,
>> Jani.
>>=20
>> >=20
>> > Signed-off-by: Jouni H=C3=B6gander <jouni.hogander@intel.com>
>> > ---
>> > =C2=A0drivers/gpu/drm/xe/compat-i915-headers/i915_config.h | 8 ++------
>> > =C2=A01 file changed, 2 insertions(+), 6 deletions(-)
>> >=20
>> > diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_config.h
>> > b/drivers/gpu/drm/xe/compat-i915-headers/i915_config.h
>> > index 10e18b036489..e835bea08d1b 100644
>> > --- a/drivers/gpu/drm/xe/compat-i915-headers/i915_config.h
>> > +++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_config.h
>> > @@ -6,18 +6,14 @@
>> > =C2=A0#ifndef __I915_CONFIG_H__
>> > =C2=A0#define __I915_CONFIG_H__
>> > =C2=A0
>> > -#include <linux/types.h>
>> > -#include <linux/limits.h>
>> > +#include <linux/sched.h>
>> > =C2=A0
>> > =C2=A0struct drm_i915_private;
>> > =C2=A0
>> > -unsigned long i915_fence_context_timeout(const struct
>> > drm_i915_private *i915,
>> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 u64 context);
>> > -
>> > =C2=A0static inline unsigned long
>> > =C2=A0i915_fence_timeout(const struct drm_i915_private *i915)
>> > =C2=A0{
>> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return i915_fence_context_t=
imeout(i915, U64_MAX);
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return MAX_SCHEDULE_TIMEOUT;
>> > =C2=A0}
>> > =C2=A0
>> > =C2=A0#endif /* __I915_CONFIG_H__ */
>>=20
>

--=20
Jani Nikula, Intel

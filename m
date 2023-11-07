Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92961C4332F
	for <intel-xe@archiver.kernel.org>; Tue,  7 Nov 2023 12:55:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD76C10E14C;
	Tue,  7 Nov 2023 12:55:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB0FB10E097
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Nov 2023 12:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699361704; x=1730897704;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=91uq2mU0SGZLk80RFLx2OxaiBNKakr0bl5kEQN063Aw=;
 b=YpOQpsRfdvSWepw3FotNe9vO8TjzWR4+VMZR6dFEUHgWoSbJneXIK4aA
 VZJDX8SHCq8DTilhE6TShNcfSg+P4EIAQxVRmgzOioevEeveYpk/bgQ0j
 sb7OdaPjLY0QjkLR212oW9tHX4MyRDLFCH/aFGisxssTW7wwEVoqMewP7
 Ihm0NZWUsxg3q7B8ZEhmFRfbxovC76P1qY0rrgYODpOMknIfe2E86iu6t
 XdNmr3Qgp+s2RyjRVs6d33IwFaVQe3linmOgYFeWk0DCRUs+OjMpp8erR
 BKJTmYAqbye/FIfPaWQKhA9Wv0rUy/ssmNUkmAnlYxTe3zY9RL8z7hCYd w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="2433785"
X-IronPort-AV: E=Sophos;i="6.03,283,1694761200"; 
   d="scan'208";a="2433785"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2023 04:55:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="879789328"
X-IronPort-AV: E=Sophos;i="6.03,283,1694761200"; d="scan'208";a="879789328"
Received: from ezorina-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.52.183])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2023 04:55:01 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Jouni =?utf-8?Q?H=C3=B6gander?= <jouni.hogander@intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20231106064834.161647-2-jouni.hogander@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20231106064834.161647-1-jouni.hogander@intel.com>
 <20231106064834.161647-2-jouni.hogander@intel.com>
Date: Tue, 07 Nov 2023 14:54:58 +0200
Message-ID: <87y1f9yb8d.fsf@intel.com>
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
Cc: Jouni =?utf-8?Q?H=C3=B6gander?= <jouni.hogander@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, 06 Nov 2023, Jouni H=C3=B6gander <jouni.hogander@intel.com> wrote:
> Using i915_fence_timeout causes linking error as i915_fence_context_timeo=
ut
> doesn't exist for Xe. Return just MAX_SCHEDULE_TIMEOUT.

Considering the implementation of i915_fence_context_timeout(), isn't 0
more appropriate?

BR,
Jani.

>
> Signed-off-by: Jouni H=C3=B6gander <jouni.hogander@intel.com>
> ---
>  drivers/gpu/drm/xe/compat-i915-headers/i915_config.h | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_config.h b/drive=
rs/gpu/drm/xe/compat-i915-headers/i915_config.h
> index 10e18b036489..e835bea08d1b 100644
> --- a/drivers/gpu/drm/xe/compat-i915-headers/i915_config.h
> +++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_config.h
> @@ -6,18 +6,14 @@
>  #ifndef __I915_CONFIG_H__
>  #define __I915_CONFIG_H__
>=20=20
> -#include <linux/types.h>
> -#include <linux/limits.h>
> +#include <linux/sched.h>
>=20=20
>  struct drm_i915_private;
>=20=20
> -unsigned long i915_fence_context_timeout(const struct drm_i915_private *=
i915,
> -					 u64 context);
> -
>  static inline unsigned long
>  i915_fence_timeout(const struct drm_i915_private *i915)
>  {
> -	return i915_fence_context_timeout(i915, U64_MAX);
> +	return MAX_SCHEDULE_TIMEOUT;
>  }
>=20=20
>  #endif /* __I915_CONFIG_H__ */

--=20
Jani Nikula, Intel

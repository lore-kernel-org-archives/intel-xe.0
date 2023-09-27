Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E8EAE80A97
	for <intel-xe@archiver.kernel.org>; Wed, 27 Sep 2023 07:00:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 310C510E061;
	Wed, 27 Sep 2023 07:00:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6737510E061
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Sep 2023 07:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695798004; x=1727334004;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=k+lsesB/yrAef+dQr0ChwHXxyP6yjf9NCCF3AWaQZpw=;
 b=ivh/5A3FanCYso1uUGIVVNyhXdn+SCqdaNkFP2psDZCCwkA4Uw1CQD2p
 CpGaW8vCufhYf76E2gu483NEJXuvkAo/+K8FWIsxOKtmuL9ddeG2g9C03
 wVg7D3F9n0sh2ZyUpAlO0c+ab3S7M6zypSPI/9adfAzb1mQLI3GHzcNIs
 8/DkA0Uo0KZZu2q8uEWeWD5AKpRubqbbW8AEbAW1CLr2OAZj2Sz8a16KP
 q88ObRcWSHuZ1vaFLdZfXcTprKJhgo/sdHJ87LpE/OQVrMnAOHvsqkB0y
 cLtZj2PE4/zj81uABpu4jEGPzH1eIfP3SC0HmSqy3w8n3aCLQJ0m8trkp w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="372084060"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="372084060"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 23:59:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="892490595"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="892490595"
Received: from roomensx-mobl.amr.corp.intel.com (HELO localhost)
 ([10.252.40.191])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 23:58:26 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: "Shankar, Uma" <uma.shankar@intel.com>, "Borah, Chaitanya Kumar"
 <chaitanya.kumar.borah@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
In-Reply-To: <DM4PR11MB6360B7F6C270EC1BA6E35EA1F4C2A@DM4PR11MB6360.namprd11.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230918071231.288885-1-chaitanya.kumar.borah@intel.com>
 <DM4PR11MB6360B7F6C270EC1BA6E35EA1F4C2A@DM4PR11MB6360.namprd11.prod.outlook.com>
Date: Wed, 27 Sep 2023 09:59:30 +0300
Message-ID: <874jjgksod.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-xe] [PATCH] Revert "FIXME: drm/i915/ips: apparently
 silence warnings"
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

On Wed, 27 Sep 2023, "Shankar, Uma" <uma.shankar@intel.com> wrote:
>> -----Original Message-----
>> From: Borah, Chaitanya Kumar <chaitanya.kumar.borah@intel.com>
>> Sent: Monday, September 18, 2023 12:43 PM
>> To: intel-xe@lists.freedesktop.org
>> Cc: Borah, Chaitanya Kumar <chaitanya.kumar.borah@intel.com>; Nikula, Jani
>> <jani.nikula@intel.com>; Shankar, Uma <uma.shankar@intel.com>
>> Subject: [PATCH] Revert "FIXME: drm/i915/ips: apparently silence warnings"
>>
>> This reverts commit 004360063d3b8a29cdf599ed18dc6a23c6e61513.
>>
>> There seems to be no effect of this patch i.e. removing this patch yields no
>> compiler warnings. Hence, revert.
>
> Hi Jani,
> Reverting the change is not resulting in any warnings. Do we really need it or
> are we missing something.

It may have been fixed by earlier changes. If it builds, it's good.

BR,
Jani.

>
> Regards,
> Uma Shankar
>
>> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
>>
>> Cc: Jani Nikula <jani.nikula@intel.com>
>> Cc: Uma Shankar <uma.shankar@intel.com>
>> ---
>>  drivers/gpu/drm/i915/display/intel_display.c | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/display/intel_display.c
>> b/drivers/gpu/drm/i915/display/intel_display.c
>> index 9df8081f78d9..d0ec09621fe4 100644
>> --- a/drivers/gpu/drm/i915/display/intel_display.c
>> +++ b/drivers/gpu/drm/i915/display/intel_display.c
>> @@ -4195,8 +4195,8 @@ static u16 hsw_linetime_wm(const struct
>> intel_crtc_state *crtc_state)
>>       return min(linetime_wm, 0x1ff);
>>  }
>>
>> -static inline u16 hsw_ips_linetime_wm(const struct intel_crtc_state *crtc_state,
>> -                                   const struct intel_cdclk_state *cdclk_state)
>> +static u16 hsw_ips_linetime_wm(const struct intel_crtc_state *crtc_state,
>> +                            const struct intel_cdclk_state *cdclk_state)
>>  {
>>       const struct drm_display_mode *pipe_mode =
>>               &crtc_state->hw.pipe_mode;
>> @@ -4239,7 +4239,7 @@ static int hsw_compute_linetime_wm(struct
>> intel_atomic_state *state,
>>       struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
>>       struct intel_crtc_state *crtc_state =
>>               intel_atomic_get_new_crtc_state(state, crtc);
>> -     __maybe_unused const struct intel_cdclk_state *cdclk_state;
>> +     const struct intel_cdclk_state *cdclk_state;
>>
>>       if (DISPLAY_VER(dev_priv) >= 9)
>>               crtc_state->linetime = skl_linetime_wm(crtc_state);
>> --
>> 2.25.1
>

-- 
Jani Nikula, Intel

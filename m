Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FFFCCD6E4A
	for <intel-xe@archiver.kernel.org>; Wed,  3 Jun 2026 13:29:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F21C710FE37;
	Wed,  3 Jun 2026 13:29:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NXhKisAb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D643F10FE36;
 Wed,  3 Jun 2026 13:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780493364; x=1812029364;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=1ZLTfEfZqzyDxSIvrRfGzwlrVEQFRNVDDDGxcyMgi8c=;
 b=NXhKisAb1B2yzbizVDEeaM55srLhIOK6Rn14RMkmaFHOoYr5NQysvIP6
 8117MGqyEfPy6Zu2ue9YURAyyijz8hDR2m9riFOWVG/aPkXAsIqUTHjvo
 METnOQecwZDC/znAXR7VP7iC3y5HzpNERowZ9Fe04vEnrxl2iJgeUTAaZ
 mizhg1ARKflJOk7g0efpVA8QeG2XkUCNYRdACJQ5PKwb6lxleC+88zf0m
 UIJvxdtcnd/gK82CHOrvuyRza81yzhI7uw3LuEgTelxmdYs84b/SYe2md
 d1TNo9l0aHYBIX7fumQySzRcTW3mUxoru+fnYuFXyzqfiqdGYZym2gdX/ Q==;
X-CSE-ConnectionGUID: 7rof/IyNQUu3+IRlxtF5mA==
X-CSE-MsgGUID: oYG6YHTfRxKUHipBii/hvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="106753943"
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; d="scan'208";a="106753943"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 06:29:23 -0700
X-CSE-ConnectionGUID: yh6LlhrpSieUZRFG3BZV1Q==
X-CSE-MsgGUID: 5dzggJ8DQdi6pdzNXhp5CQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; d="scan'208";a="244353791"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.189])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 06:29:21 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, imre.deak@intel.com
Subject: Re: =?utf-8?Q?=E2=9C=97?= i915.CI.BAT: failure for drm/{i915, xe}:
 display (runtime) suspend/resume/shutdown unification, part 2
In-Reply-To: <9299478799ad973d4e1f9467fedfec2d2e8e92ef@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <cover.1780389001.git.jani.nikula@intel.com>
 <178039485806.35116.2101469529268890207@6beec6c84f66>
 <9299478799ad973d4e1f9467fedfec2d2e8e92ef@intel.com>
Date: Wed, 03 Jun 2026 16:29:19 +0300
Message-ID: <05a8062a90d7746e9c4d693601a407b157ce1d22@intel.com>
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

On Tue, 02 Jun 2026, Jani Nikula <jani.nikula@intel.com> wrote:
> On Tue, 02 Jun 2026, Patchwork <patchwork@emeril.freedesktop.org> wrote:
>> #### Possible regressions ####
>>
>>   * igt@i915_selftest@live:
>>     - fi-bsw-n3050:       [PASS][1] -> [ABORT][2] +1 other test abort
>>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18602/fi-bsw-n3050/igt@i915_selftest@live.html
>>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_167725v1/fi-bsw-n3050/igt@i915_selftest@live.html
>>
>>   * igt@i915_selftest@live@hangcheck:
>>     - bat-arlh-2:         [PASS][3] -> [INCOMPLETE][4]
>>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18602/bat-arlh-2/igt@i915_selftest@live@hangcheck.html
>>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_167725v1/bat-arlh-2/igt@i915_selftest@live@hangcheck.html
>
> Imre, Ville, any idea what in this series could cause this? Feels like
> it could be a real regression, but I can't figure it out. :(

Passed on the next try. I'll optimistically think the first try was a
fluke. ;)

BR,
Jani.

-- 
Jani Nikula, Intel

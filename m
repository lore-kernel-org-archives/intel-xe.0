Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A55F5CD6E55
	for <intel-xe@archiver.kernel.org>; Wed,  3 Jun 2026 15:33:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B9E1112059;
	Wed,  3 Jun 2026 15:33:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j1IaolCM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7416112058;
 Wed,  3 Jun 2026 15:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780500783; x=1812036783;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=jzlbhVpBj9NwIO2apAPE7A3dS2Xtdemb4Aq9TfHnvV8=;
 b=j1IaolCM5ZjfLljylyZpJaFZyAk/JCY2AFy91MeZ+q+WOTb/V5xFHdaH
 XSVvOzrD3ScN7Stj+MJNcKrlzauRHjFT65A8BkwhfTvEBubdBFdHPGcHT
 L1JK+oabn5Q4VM/IKgKLzeSBqzt4FZIVkL/ulgoJ+aBfmUjhhcjX00efl
 0NIdA4k6gG4AcEiW52FYhUPw0Z+csvQTYji1EugktgeBcYUhbw6OnfL/i
 mKl4Kx2iDYO8BjBmkS81FOgOw0GZCQvbcBckJfnT0DxqghQ8dHcEO9ycP
 jHmtB1hXQPchpDoahAPhtrKs2wdCdPDOhwtdN7cwlWFm5Qp0kKIEjd3CN Q==;
X-CSE-ConnectionGUID: 07vj0CzaSnqTpNQTZLHgSg==
X-CSE-MsgGUID: keXT8a61Sxao/+R8xtZjxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11806"; a="81220244"
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; d="scan'208";a="81220244"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 08:33:03 -0700
X-CSE-ConnectionGUID: mc1vyVBmT1+0x5pTIo80+g==
X-CSE-MsgGUID: lwWONUymT+aXt7hJ1wN2hA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; d="scan'208";a="244356183"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.189])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 08:33:01 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: imre.deak@intel.com
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 ville.syrjala@linux.intel.com
Subject: Re: =?utf-8?Q?=E2=9C=97?= i915.CI.BAT: failure for drm/{i915, xe}:
 display (runtime) suspend/resume/shutdown unification, part 2
In-Reply-To: <aiA5ORKjPPJlwYcM@ideak-desk.lan>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <cover.1780389001.git.jani.nikula@intel.com>
 <178039485806.35116.2101469529268890207@6beec6c84f66>
 <9299478799ad973d4e1f9467fedfec2d2e8e92ef@intel.com>
 <05a8062a90d7746e9c4d693601a407b157ce1d22@intel.com>
 <aiA5ORKjPPJlwYcM@ideak-desk.lan>
Date: Wed, 03 Jun 2026 18:32:57 +0300
Message-ID: <04cd2eb7ae058feb1cd26fc8bd7f7af7697f549b@intel.com>
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

On Wed, 03 Jun 2026, Imre Deak <imre.deak@intel.com> wrote:
> On Wed, Jun 03, 2026 at 04:29:19PM +0300, Jani Nikula wrote:
>> On Tue, 02 Jun 2026, Jani Nikula <jani.nikula@intel.com> wrote:
>> > On Tue, 02 Jun 2026, Patchwork <patchwork@emeril.freedesktop.org> wrote:
>> >> #### Possible regressions ####
>> >>
>> >>   * igt@i915_selftest@live:
>> >>     - fi-bsw-n3050:       [PASS][1] -> [ABORT][2] +1 other test abort
>> >>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18602/fi-bsw-n3050/igt@i915_selftest@live.html
>> >>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_167725v1/fi-bsw-n3050/igt@i915_selftest@live.html
>> >>
>> >>   * igt@i915_selftest@live@hangcheck:
>> >>     - bat-arlh-2:         [PASS][3] -> [INCOMPLETE][4]
>> >>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18602/bat-arlh-2/igt@i915_selftest@live@hangcheck.html
>> >>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_167725v1/bat-arlh-2/igt@i915_selftest@live@hangcheck.html
>> >
>> > Imre, Ville, any idea what in this series could cause this? Feels like
>> > it could be a real regression, but I can't figure it out. :(
>> 
>> Passed on the next try. I'll optimistically think the first try was a
>> fluke. ;)
>
> The Oops in __drm_mm_interval_first() on fi-bsw-n3050 looks like an
> actual driver problem, unless it's a random memory corruption due to HW
> errors. I couldn't find any previous instance of this Oops in CI runs,
> but I also can't see how it would relate to the changes in this
> patchset. Since these selftests involve a lot unloading/reloading of the
> driver one theory was that it's due to unproper unloading of the driver
> after the test preceeding the above igt@i915_selftest@live test
> (gem_migrate), but couldn't see any proof for that either and not sure
> how such an issue would cause a memory corruption in the reloaded driver
> like the above.

Thanks a lot for looking. I didn't intend for you to go into a sort of
wild goose chase with this, but to see if you could figure something out
quickly when I couldn't.

Anyway, this just reaffirms I'm not going to let this block merging if
retry passes.

BR,
Jani.



>
>> BR,
>> Jani.
>> 
>> -- 
>> Jani Nikula, Intel

-- 
Jani Nikula, Intel

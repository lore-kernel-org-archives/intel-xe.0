Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D428CC5B572
	for <intel-xe@archiver.kernel.org>; Mon, 17 Aug 2026 11:53:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 902F210E776;
	Mon, 17 Aug 2026 11:53:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dGuDCnlf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC89A10E774;
 Mon, 17 Aug 2026 11:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786967636; x=1818503636;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=+/bqTqtvaMpQwVdt40/6DcZZsmpN3J07tYSFPs6Cu4w=;
 b=dGuDCnlfVEYGFboO/ouyJx/YEwYfgiKd7J9okzo7K1Q375HppbLKlv+S
 nFt186j0Afsy92OM58XVnVBvonH2m6JvhN2y6siFaNoFhMvBgi59lgxdC
 fGMcXUM2t47W36dQUy8PaD3KRC5sc0SdVRANcAbPM0hgJYghdJBznS/2n
 dybXjI9yItZ14kRskNA60DtfG6cRhkk3l9o2cOR6yvH0qIYEE980U72BN
 jA+Oq5MctCy4ob7aZDvrJ51n283ILJo6cuvkilSKQViCfxeNdps2dC+t9
 nGTa/nuxfRVSUB6F1dSuTzRSOHeWJJlREo8mVBd4X1qJunclRGZb/Qky4 Q==;
X-CSE-ConnectionGUID: KYB6KAg8Qr6/V053y1+BVA==
X-CSE-MsgGUID: XsrXM72VQbaK4ATi4Ty00A==
X-IronPort-AV: E=McAfee;i="6800,10657,11877"; a="91118806"
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; d="scan'208";a="91118806"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2026 04:53:56 -0700
X-CSE-ConnectionGUID: PfoUBt8OSIOa3defDweSIA==
X-CSE-MsgGUID: yswT0odaTESlrrsrtneepA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; d="scan'208";a="266877589"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.110])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2026 04:53:53 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Sasha Levin <sashal@kernel.org>, stable@vger.kernel.org
Cc: Sasha Levin <sashal@kernel.org>, regressions@lists.linux.dev,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 =?utf-8?B?5ZC05rab?=
 <rpwtsama@gmail.com>, Ville Syrjala <ville.syrjala@linux.intel.com>
Subject: Re: [REGRESSION] Panther Lake 8086:b082 internal eDP black after xe
 takeover since 7.1.6, still present in 7.1.8
In-Reply-To: <20260814193000.13@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <CAF38RzLOUW1ZB1f+Q2f9mhnYs+t4R2+UQA1PCihz_FKEu-nSew@mail.gmail.com>
 <20260814193000.13@kernel.org>
Date: Mon, 17 Aug 2026 14:53:50 +0300
Message-ID: <b2154dc24ac1756c2befdd90d95c7f6eac4dff1f@intel.com>
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

On Fri, 14 Aug 2026, Sasha Levin <sashal@kernel.org> wrote:
>> Known good: 7.1.5-arch1-2
>> First known bad: 7.1.6-arch1-1
>> Latest tested bad: 7.1.8
>>
>> When the xe driver takes over from the firmware framebuffer, the
>> internal panel becomes completely black.
>> Close and reopen the laptop lid.
>> The internal panel starts working normally.
>
> Thanks for the report. I believe the culprit is 2ee8dbd880b1 ("drm/i915/cdclk:
> Fix up CDCLK_FREQ_DECIMAL without a full PLL re-enable"), which is in 7.1.6.
>
> Mainline is affected in exactly the same way and there is no fix upstream yet,
> so there is nothing for me to pick up.

Please try [1].

BR,
Jani.

[1] https://lore.kernel.org/r/20260816062344.796615-1-xspeed1989@gmail.com


-- 
Jani Nikula, Intel

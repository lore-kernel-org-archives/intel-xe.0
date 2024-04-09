Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3A2ACD1284
	for <intel-xe@archiver.kernel.org>; Tue,  9 Apr 2024 08:43:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3935210FA5E;
	Tue,  9 Apr 2024 08:43:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WZjP2yGI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A443112BD0;
 Tue,  9 Apr 2024 08:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712652197; x=1744188197;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=4rOPs6lroRoqM9mieH5autv7ngl9VxKecDT47JkhsCs=;
 b=WZjP2yGIU3wbheyutVskwyJmU126Ae855OEOhIqdtFQDonTv/VfnoUzV
 Cln/Ye4c20RWwRbw8YbHLAcgk5z090vOMwsTzlkcgaV1H0TufwbzEHiqa
 OsIBa4ZooY173y5ds25RogwvRuHzz0VUoPGx02WXEwRI5FGuw7Xkr+bHb
 lA1sFmuXdTaLmIT1zMdpnVh3IApBnCuGN1Nt3BW498+zcgny6SCiEanYY
 oOJm42Z84vgrfws2Y8CmNtaTTBC7DvqhRWXUFs1Hbn/QutnmAGpwJSB48
 UKT/iMjnJoZEkbWttp4R0GpqARGmJ6DjWldNF3xjQF6I7rTazSPGmFnl/ w==;
X-CSE-ConnectionGUID: f6c1dPBmRamHmB7HykJ/gg==
X-CSE-MsgGUID: H94v+IFSR4Gpqhz/tjlKyQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="11753249"
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; d="scan'208";a="11753249"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 01:43:16 -0700
X-CSE-ConnectionGUID: c9bnt/dcR6itAC5p4LV4yg==
X-CSE-MsgGUID: 4K3lNVdLRs27SL//hPdT6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; d="scan'208";a="24648620"
Received: from mserban-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.59.228])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 01:43:13 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, Ville
 Syrjala <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH 0/8] drm/i915: drm_i915_private and xe_device cleanups
In-Reply-To: <umdjxcjjfmxpc52sai7d5ltgntcweilfd7e4n3pkvxvqhq23r4@5oaddgmh64mz>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1712599670.git.jani.nikula@intel.com>
 <877ch7a7qe.fsf@intel.com>
 <umdjxcjjfmxpc52sai7d5ltgntcweilfd7e4n3pkvxvqhq23r4@5oaddgmh64mz>
Date: Tue, 09 Apr 2024 11:43:10 +0300
Message-ID: <87y19n7wpt.fsf@intel.com>
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

On Mon, 08 Apr 2024, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> On Tue, Apr 09, 2024 at 12:02:17AM +0300, Jani Nikula wrote:
>>On Mon, 08 Apr 2024, Jani Nikula <jani.nikula@intel.com> wrote:
>>> Continue cleaning up the members from drm_i915_private and xe_device to
>>> struct intel_display.
>>
>>Lucas, there's a bunch of xe changes included here, ack for merging via
>>drm-intel-next?
>
>
> Acked-by: Lucas De Marchi <lucas.demarchi@intel.com>
>
> I skimmed through the series and left just one comment. It may be very
> well because I skimmed through it too fast though. I agree on merging
> it through drm-intel-next.

Thanks for the review and ack, pushed patches 1-7 to drm-intel-next. I
decided the renaming, if any, can come later.

There was a trivial conflict with patch 1, pushed it anyway, but skipped
patch 8 for now also due to conflicts, and it didn't apply to
drm-xe-next either. Need to sync up the branches first.

BR,
Jani.


-- 
Jani Nikula, Intel

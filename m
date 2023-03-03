Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89493C678D4
	for <intel-xe@archiver.kernel.org>; Fri,  3 Mar 2023 09:28:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D78E10E5CC;
	Fri,  3 Mar 2023 09:28:08 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F087110E5CC
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Mar 2023 09:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677835686; x=1709371686;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=jDMcEmxX7ZhKFRksDfdCWKMCEKUKJYM21zqHbw194is=;
 b=Ixo0rfxxJwlG0nYGU1apSw0RlWzp5Ep+TsDwNx6U/KXeVYpsbPUS5pP9
 bEMuvo6mzmZEFOg0w1+Uq5gDztE6/YzOTCfs+NIhtvju9MScrS+xN24rX
 +BaGhRkOEUx/6o8Yb8H82k/zP9iwLgzjVFElnFwpVsnaVnahGcox8NFhs
 rVQ/CsUQCUPtuhdz4nLyymUw9z2MwvBR6I5W/y9s4rPrShGkQ7tCLT1UQ
 07VjJtzhKNTsOjSAHiZJOIGmhbRjVG/BhifHbVJ7GlF19l7dIp5Z3b4VI
 ASJL0m+kbgYea/7kBqo+R/djCyoOWL2FuMe4msdWa0rB/zAOzTiEE17Kv g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="362598879"
X-IronPort-AV: E=Sophos;i="5.98,230,1673942400"; d="scan'208";a="362598879"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2023 01:27:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="739440301"
X-IronPort-AV: E=Sophos;i="5.98,230,1673942400"; d="scan'208";a="739440301"
Received: from msieb-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.57.184])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2023 01:27:48 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20230302174735.nstcblrzbhuwbhox@ldmartin-desk2.lan>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230302141230.2804699-1-jani.nikula@intel.com>
 <167776720634.20552.13587908549080764345@emeril.freedesktop.org>
 <20230302174735.nstcblrzbhuwbhox@ldmartin-desk2.lan>
Date: Fri, 03 Mar 2023 11:27:46 +0200
Message-ID: <877cvyuqul.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-xe] 
 =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_f?=
 =?utf-8?q?or_series_starting_with_=5B1/8=5D_drm/i915/display=3A_don=27t_u?=
 =?utf-8?q?se_relative_=2E=2E/i915_includes?=
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
Cc: karol.krol@intel.com, maciej.ramotowski@intel.com,
 michal.czaplinski@intel.com, ryszard.knop@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, 02 Mar 2023, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> On Thu, Mar 02, 2023 at 02:26:46PM -0000, Patchwork wrote:
>>== Series Details ==
>>
>>Series: series starting with [1/8] drm/i915/display: don't use relative ../i915 includes
>>URL   : https://patchwork.freedesktop.org/series/114573/
>>State : success
>
> Cc'ing some more people. Some nice additions here:
>
> 1) The base commit used for applying the patch.
> 2) Maybe push to a repo as refs/heads/<sanitized-msg-id> and add the
> link to it here, so if the developer wants to check what exactly CI was
> using in the build it's just one command away?  Those refs could be
> cleaned up every few months so the repo doesn't grow indefinitely

Somewhat related, I think CONFIG_DRM_XE_DISPLAY is currently brittle
enough that we need to build both =y and =n to keep this working.

I'm doing this locally for my stuff, but I don't expect everyone will.

BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC0FDCCA470
	for <intel-xe@archiver.kernel.org>; Wed,  1 Oct 2025 09:57:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5949210E35D;
	Wed,  1 Oct 2025 09:57:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="buaXRDcb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CDD610E35D;
 Wed,  1 Oct 2025 09:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759312658; x=1790848658;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=hRsWSI+Ynz882jx7sDjzMosT/hJ5TVMyw4PuuEVLzdE=;
 b=buaXRDcbwFh6K0I07Ys2Ypfqg8PjbT00I18opOD9mZhqWZzSv0i3fcg0
 dgck0ScB3OUQsdElIWqseqlSGR1pMvkPXyMs0NhcCEzaKbxIe9ux6JRsU
 Z8+M6AxjkDU0g9Dm18lEHQICM9bHN4TqBXBtduxQLLSOXdi74A48VZmLq
 1Hi6sx8Grdt0qoTYVWPdeJemS83iLHkgbTVoBQJR2oP4YXUc8BxjANGba
 Hk52ZKecy05axkBOpNg8GzKavalTw2hrFyXMQwfzoWeIjjaVhfgcsTWyc
 UAYTGsDUcArxaF6S6m4f5Elpy8andqdRcYk+u/7eqwBh+BPz1gDQ16AFf w==;
X-CSE-ConnectionGUID: IfC+piovSl21KXYhE7r0xQ==
X-CSE-MsgGUID: ASZdDU5fQkmg/UqS3Bz3dA==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="60618403"
X-IronPort-AV: E=Sophos;i="6.18,306,1751266800"; d="scan'208";a="60618403"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 02:57:37 -0700
X-CSE-ConnectionGUID: sA4MkWNgSUqPvbf/Y+Yc1A==
X-CSE-MsgGUID: GUs4907jRj+65D/YEV0FdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,306,1751266800"; d="scan'208";a="178798552"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.217])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 02:57:35 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Raag Jadav <raag.jadav@intel.com>
Cc: Mika Kahola <mika.kahola@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, Imre Deak <imre.deak@intel.com>
Subject: Re: [RFC PATCH 01/39] drm/i915/display: Sanitize
 PHY_C20_VDR_CUSTOM_SERDES_RATE/DP_RATE field macros
In-Reply-To: <aNztFxlDWeuc13nn@black.igk.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20251001082839.2585559-1-mika.kahola@intel.com>
 <20251001082839.2585559-2-mika.kahola@intel.com>
 <2112bdfc2a73a2e90b393871d31fc24cbb27eaac@intel.com>
 <aNztFxlDWeuc13nn@black.igk.intel.com>
Date: Wed, 01 Oct 2025 12:57:31 +0300
Message-ID: <da513f4b6dfc42b4e85de69ce25666d0b1447c73@intel.com>
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

On Wed, 01 Oct 2025, Raag Jadav <raag.jadav@intel.com> wrote:
> On Wed, Oct 01, 2025 at 11:52:20AM +0300, Jani Nikula wrote:
>> On Wed, 01 Oct 2025, Mika Kahola <mika.kahola@intel.com> wrote:
>> > Signed-off-by: Imre Deak <imre.deak@intel.com>
>> 
>> You need to add your Signed-off-by when sending someone else's patches.
>
> Isn't this only when the submitter has made adjustments to originally
> authored code?

No. You *always* need to add your Signed-off-by when contributing to the
kernel, regardless of whether you were involved in the development of
the patch, or just handling and transporting the patch. See (c) in [1].


BR,
Jani.


[1] https://docs.kernel.org/process/submitting-patches.html#developer-s-certificate-of-origin-1-1


-- 
Jani Nikula, Intel

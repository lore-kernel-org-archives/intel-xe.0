Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6454CD5BB3
	for <intel-xe@archiver.kernel.org>; Fri, 22 May 2026 18:04:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EC3210E26D;
	Fri, 22 May 2026 18:04:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i4RosoGr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0266D10E26D;
 Fri, 22 May 2026 18:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779473073; x=1811009073;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=SWACteANGl1LQj+ipbIM0QKHcMfvUIj41QTWbOGLhVc=;
 b=i4RosoGrzU1Bb9Ff6LATHOPjV7EjmZgFVbBcIUIkdvSq5ofUjZm+QuKr
 tCGMlvbFY2d829dl8A5xyVKbj93Ln8noHPJSj0GHJXmiWql8nXWWUkABS
 Od0ky3DipTJF/Naq/CfFfsejpLG8HLZ1tRegZGrq8xYYr/0LdDyv7S3MS
 rTEe93Ab216P/fk5/aCtzI447Bol4dkOIUWKtWUYrRXoRiBfS+5RscDZv
 jfK57jmjipKoNx5md/6n95MUI023KXso/Dyl+LXDG2ubimjn35o0zdYgA
 hp73nDmyNqjSw+uObyuneQrxJvkIeqy5h7+DR9RJXApuovapOQkOqb1nv A==;
X-CSE-ConnectionGUID: Bl4Mo14KR3+eiC3yxh0xBQ==
X-CSE-MsgGUID: IQyW+SvqQ82+nAY4cTuNsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11794"; a="80389875"
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; d="scan'208";a="80389875"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2026 11:04:32 -0700
X-CSE-ConnectionGUID: snhVjuy2S/28EJPa036Zkw==
X-CSE-MsgGUID: RSLInyXxTdWv5KL5X5UUkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; d="scan'208";a="236546999"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.244.187])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2026 11:04:30 -0700
Date: Fri, 22 May 2026 21:04:27 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Imre Deak <imre.deak@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Jani Nikula <jani.nikula@intel.com>,
 Jouni =?iso-8859-1?Q?H=F6gander?= <jouni.hogander@intel.com>
Subject: Re: [PATCH v2 0/4] drm/i915/dp: Sanitize link capability change
 handling
Message-ID: <ahCaq-j4gNLx8aJR@intel.com>
References: <20260522160514.2628249-1-imre.deak@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260522160514.2628249-1-imre.deak@intel.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

On Fri, May 22, 2026 at 07:05:10PM +0300, Imre Deak wrote:
> This is v2 of [1], dropping the addition of helpers to reset the link
> state, addressing Ville's comments in patch 4 and adding Jouni's R-bs.
> 
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Jouni Högander <jouni.hogander@intel.com>
> 
> [1] https://lore.kernel.org/all/20260518112427.2460725-1-imre.deak@intel.com
> 
> Imre Deak (4):
>   drm/i915/dp: Reset link params after a DPRX capability change
>   drm/i915/dp: Add helper to set common link params
>   drm/i915/dp: Cache max common lane count
>   drm/i915/dp: Detect changes in common link parameters

Series is
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> 
>  .../drm/i915/display/intel_display_types.h    |  1 +
>  drivers/gpu/drm/i915/display/intel_dp.c       | 66 +++++++++++++++++--
>  2 files changed, 60 insertions(+), 7 deletions(-)
> 
> -- 
> 2.49.1

-- 
Ville Syrjälä
Intel

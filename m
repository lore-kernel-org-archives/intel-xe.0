Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD74BE9E304
	for <intel-xe@archiver.kernel.org>; Wed, 11 Feb 2026 12:59:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01C3810E13F;
	Wed, 11 Feb 2026 12:59:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jozH8VKc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4542110E136;
 Wed, 11 Feb 2026 12:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770814749; x=1802350749;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=CwBIT/dMNtc3UTuWndlG/sN2Yw827ZKqYYK3zXgF+zs=;
 b=jozH8VKc7Z67NBlGU3Szn8+VCRcC/9O82crWqlzImf05JAJ1y4jfKNO6
 62S3v/OQ+J31kEFiH9sJDWRDGikBQj5RyxymH10jSI86EjqVWKwMZCg81
 u+OtEHHAR5PDosR7HLSI77TcRCCCYQJ/rZBkQS2TbSusEvszbrrgfurDR
 YF2wisdms6jimpnV6dT/3CS5ZDdh+lNqagEVvy7NGsYmt0NyYmVgQim1T
 xLgR+izrltB56OyqNSkCP54tVaqwVH3FuUXz1OdqhpCuMDWPSTVqp7rVZ
 tKG8GMP0ghL6g14BKgEcRj+//o51KqJA5/S0hKNr2hfTywU+c3rNSz83O w==;
X-CSE-ConnectionGUID: iqeunQFsQM2Zo3brDjsCrQ==
X-CSE-MsgGUID: sht+9MdfRX+zoan/ExgTmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="83402370"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="83402370"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 04:59:08 -0800
X-CSE-ConnectionGUID: KgN+elZIQT+M1HhmXPFpiQ==
X-CSE-MsgGUID: EgF/aT6RQFinukmQAlE9mQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="211179413"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.57])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 04:59:06 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Uma Shankar <uma.shankar@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, Uma Shankar <uma.shankar@intel.com>
Subject: Re: [v4 00/20] Make Display free from i915_reg.h
In-Reply-To: <20260205094341.1882816-1-uma.shankar@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260205094341.1882816-1-uma.shankar@intel.com>
Date: Wed, 11 Feb 2026 14:59:02 +0200
Message-ID: <8db65f70ee8ee5e0f0b77b6b7b5c0405e1bc42b6@intel.com>
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

On Thu, 05 Feb 2026, Uma Shankar <uma.shankar@intel.com> wrote:
> Move the common register definition to per feature header
> which makes display files free from including i915_reg.h.
> This will help avoid dupicate definitions and includes and can
> serve as a common file for xe, i915 and display module.

Good stuff, thanks. I think it's all R-b now. Please use SPDX in patch
14 while applying.

Oh, and a follow-up patch could remove
drivers/gpu/drm/xe/compat-i915-headers/i915_reg.h.

BR,
Jani.

-- 
Jani Nikula, Intel

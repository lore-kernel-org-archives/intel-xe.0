Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA592E9E301
	for <intel-xe@archiver.kernel.org>; Wed, 11 Feb 2026 12:44:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7207210E1A1;
	Wed, 11 Feb 2026 12:44:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B6RAhhdl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B3B310E19E;
 Wed, 11 Feb 2026 12:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770813895; x=1802349895;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=v68hQ34G/u0JBrosDQmbODbLU/3WxHyvWDy+F3cLmgo=;
 b=B6RAhhdllzdWt6KDGo2ovdeOfLpbMLHzUZ/mBswZiJ8zxSLAXE/UuOG/
 tpkjnpkfUMlxYYk2xNUIgSd/ZoNwCxCOHOrKj5Kx1cQQY2veeiIZbK0N6
 QlgrcTPWRlVIXslEDJ2VCr+IjLxdQvN4r0A21QwLSh/n2TboY8ewkHIfp
 hbGa5AnNRdv0qcsP69FMDWR2KoyM0HdOod/dcxNMX+mGr7AZhatYCemzu
 a+R8iXnxY1WAZQvscMQI0LcJh8NbHmjFGpGjyrLoDk5RYHwu02g/u96jx
 fSqoMjJWVxf0SL6xy7y85mcVMaaboaY+adTL+vtES8IQ+6veQxXCsSOOL A==;
X-CSE-ConnectionGUID: z19WSoRATbajSxuAN5Ar/g==
X-CSE-MsgGUID: VrZAbBdJRB6DVy3pL038uA==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="94599835"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="94599835"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 04:44:54 -0800
X-CSE-ConnectionGUID: G3ZBSObxQBOXSXX1z0KDtA==
X-CSE-MsgGUID: 4pcluTJtQu2D324qxHRhCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="211274387"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.57])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 04:44:52 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Uma Shankar <uma.shankar@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, Uma Shankar <uma.shankar@intel.com>
Subject: Re: [v4 05/20] drm/{i915, xe}: Extract pcode definitions to common
 header
In-Reply-To: <20260205094341.1882816-6-uma.shankar@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260205094341.1882816-1-uma.shankar@intel.com>
 <20260205094341.1882816-6-uma.shankar@intel.com>
Date: Wed, 11 Feb 2026 14:44:49 +0200
Message-ID: <a4af3c80c5f402879970461287967501d935e749@intel.com>
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
> There are certain register definitions which are commonly shared
> by i915, xe and display. Extract the same to a common header to
> avoid duplication.
>
> Move GEN6_PCODE_MAILBOX to common pcode header to make intel_cdclk.c
> free from including i915_reg.h.
>
> v3: Include pcode header as required, instead in i915_reg.h (Jani)
>
> v2: Make the header granular and per feature (Jani)
>
> Signed-off-by: Uma Shankar <uma.shankar@intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>


-- 
Jani Nikula, Intel

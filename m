Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 810F8CD98DA
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jun 2026 08:01:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BD4F10E88C;
	Tue, 16 Jun 2026 08:01:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BNYbsBsc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51F5910E88C;
 Tue, 16 Jun 2026 08:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781596877; x=1813132877;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=+OVST2XNK/kgyx41wKVCNM/tlzIzevW9Y2KhO5EkCjM=;
 b=BNYbsBsc7RzrJAOe3kvXE83d68+vR2OeimougCHh3SsxugqZUp7xr28t
 bVs8BZwUYTSBIoooxNwIdCRSVkDJMX6Uw8SyiAbfupU7SNqoTgXJz0daX
 l3jQNLnHYY2vvby/NcESrTaKokyi5MhWy3GnQvtBVt7GbRkgfoQ0nM7vr
 Dw/tdfsZlfRwfNgX7zlhGi82vizuyow+nKNz6YCJdmC6pJlPC1wZ8spYQ
 a9cmP075tnf/KfilBjiX3exk8KA7mg3SDsIGdvkNwazM7nZbAGh/neDho
 t2lX94ZxbaAkDB+xnONKWYxNrcWKSJblQTQLfG8IX30+v2oc7NHsPIG8H Q==;
X-CSE-ConnectionGUID: P2Y1PubtQWi8lPB6Y/tPkw==
X-CSE-MsgGUID: MRuuklMnSPaRxtaOgHyaLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="86254983"
X-IronPort-AV: E=Sophos;i="6.24,207,1774335600"; d="scan'208";a="86254983"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 01:01:16 -0700
X-CSE-ConnectionGUID: ptzPK6IhQ1qLmzHiur3Z0w==
X-CSE-MsgGUID: j/juYQcHTlqwZEXYjrvoiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,207,1774335600"; d="scan'208";a="241324365"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.244.167])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 01:01:14 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Arun R Murthy <arun.r.murthy@intel.com>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Cc: Arun R Murthy <arun.r.murthy@intel.com>, Stephen Fuhry
 <fuhrysteve@gmail.com>
Subject: Re: [PATCH v2 0/2] Unify fec enable/disable across the mst streams
In-Reply-To: <20260616-fec-v2-0-49a22680138c@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260616-fec-v2-0-49a22680138c@intel.com>
Date: Tue, 16 Jun 2026 11:01:12 +0300
Message-ID: <9827508667e0b19e939284e7989a47df278667f7@intel.com>
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

On Tue, 16 Jun 2026, Arun R Murthy <arun.r.murthy@intel.com> wrote:
> First version of the patch included only one patch i.e the ref count
> https://patchwork.freedesktop.org/series/167664/
>
> Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> ---
> Arun R Murthy (2):
>       drm/i915/mst: Unify fec_enable across mst streams
>       drm/i915/display: Refcount for fec enable/disable
>
>  drivers/gpu/drm/i915/display/intel_ddi.c           | 58 ++++++++++++++++++
>  drivers/gpu/drm/i915/display/intel_ddi.h           |  1 +
>  drivers/gpu/drm/i915/display/intel_display_types.h |  3 +
>  drivers/gpu/drm/i915/display/intel_dp_mst.c        | 70 ++++++++++++++++++++++
>  drivers/gpu/drm/i915/display/intel_modeset_setup.c |  6 ++
>  5 files changed, 138 insertions(+)

Okay, this may seem a bit unfair, since I haven't dug deep into the
problem, but I really have a hard time believing this level of
complexity is required for FEC.


BR,
Jani.


> ---
> base-commit: c585a0a7e48a48aca80f7c0acb7294c7bf301bb7
> change-id: 20260616-fec-82a3d27e0f11
>
> Best regards,

-- 
Jani Nikula, Intel

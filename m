Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3A7606A31E
	for <intel-xe@archiver.kernel.org>; Mon, 23 Nov 2026 23:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eyJM8JL4
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19D6010EC87;
	Mon, 23 Nov 2026 23:03:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56C4810EFDA;
 Mon, 23 Nov 2026 23:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795474990; x=1827010990;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=W9k2iHGZlYjlHQz37E2K0vgNtQSj+e3nNw2XWm0vNa4=;
 b=eyJM8JL4GjAACvVf28k7riXY3JM/HJMUD+0/NG1c0KyNg8dWssFRAA0p
 juQUma6EOSnSwavg6NpX57xfzLvj70y0u5UMY4c0tMMjYnWTKZSR/urr2
 vLGGimI96Twbd6ZjmVF6AZhOoUJ3itW3Z6WAT3yoSCLn7hlLgG5dDE3sC
 B/L8XZMQo6zKe30oVkapvapg7zQmvCxnrttGaypn57R8P54yFg7uREGsy
 UVZmaQDhmqjqqBInFdygnbL7JCIcVbWeMyWZUtdVHDGX1u77o1hsBeZwW
 liTFOI4h0NoSXbCBEQ0Swn5fvS8Mkx4F+disprmaFdDCr/1H1xUry1IS6 A==;
X-CSE-ConnectionGUID: 2IzQdVlZRNy+D2vusjelZw==
X-CSE-MsgGUID: YjHv8aM0R8KedUXmrfpmhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4298228"
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="4298228"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 15:03:08 -0800
X-CSE-ConnectionGUID: TnNR81CdRd64qUz1AH3Rag==
X-CSE-MsgGUID: ke7DYXbQR/it7IJk3iA39w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; d="scan'208";a="11691901"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.245.100])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 15:03:06 -0800
Date: Tue, 24 Nov 2026 01:03:03 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 0/9] drm/i915: Eliminate foo_state->state pointer usage
Message-ID: <awTGJ81kc4gvIk4s@intel.com>
References: <20261123225139.23087-1-ville.syrjala@linux.intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261123225139.23087-1-ville.syrjala@linux.intel.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 24, 2026 at 12:51:30AM +0200, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> The foo_state->state pointer is dangerous. Stop using it
> as much as possible. I think we're down to one use after
> this, but eliminating that one requires drm subsystem wide
> changes.

Actually there are a few more. Some also require drm core/driver
changes, one is in some broken PSR w/a code that probably just
needs to get axed, and a few are in the ILK watermark
intel_atomic_crtc_state_for_each_plane_state() macro that
definitely needs to get nuked.

> 
> Ville Syrjälä (9):
>   drm/i915/ddi: Pass the atomic state to
>     intel_ddi_port_sync_transcoders()
>   drm/i915/mst: Pass the full atomic state to
>     intel_dp_mtp_tu_compute_config()
>   drm/i915/hdmi: Pass the full atomic state to intel_hdmi_bpc_possible()
>   drm/i915/fdi: Pass the full atomic state to ilk_check_fdi_lanes()
>   drm/i915/hdcp: Pass the full atomic state to intel_hdcp_atomic_check()
>   drm/i915/global_state: Pass the full atomic state into
>     intel_atomic_{lock,serialize}_global_state()
>   drm/i915/global_state: Store the display in the global object and use
>     it
>   drm/i915/global_state: Remove the obj_state->state footgun
>   drm/i915/sdvo: Add a FIXME about the connector_state->state footgun
> 
>  drivers/gpu/drm/i915/display/g4x_hdmi.c       |   2 +-
>  drivers/gpu/drm/i915/display/intel_atomic.c   |   2 +-
>  drivers/gpu/drm/i915/display/intel_bw.c       |  25 ++--
>  drivers/gpu/drm/i915/display/intel_cdclk.c    |  18 +--
>  drivers/gpu/drm/i915/display/intel_dbuf_bw.c  |   2 +-
>  drivers/gpu/drm/i915/display/intel_ddi.c      |   9 +-
>  drivers/gpu/drm/i915/display/intel_dp.c       | 109 +++++++++++-------
>  drivers/gpu/drm/i915/display/intel_dp.h       |   6 +-
>  drivers/gpu/drm/i915/display/intel_dp_mst.c   |  63 +++++-----
>  drivers/gpu/drm/i915/display/intel_dp_mst.h   |   3 +-
>  drivers/gpu/drm/i915/display/intel_fdi.c      |  22 ++--
>  .../gpu/drm/i915/display/intel_global_state.c |  14 +--
>  .../gpu/drm/i915/display/intel_global_state.h |   8 +-
>  drivers/gpu/drm/i915/display/intel_hdcp.c     |   6 +-
>  drivers/gpu/drm/i915/display/intel_hdcp.h     |   4 +-
>  drivers/gpu/drm/i915/display/intel_hdmi.c     |  56 +++++----
>  drivers/gpu/drm/i915/display/intel_hdmi.h     |   7 +-
>  drivers/gpu/drm/i915/display/intel_pmdemand.c |   4 +-
>  drivers/gpu/drm/i915/display/intel_sdvo.c     |   4 +
>  drivers/gpu/drm/i915/display/skl_watermark.c  |  16 +--
>  20 files changed, 218 insertions(+), 162 deletions(-)
> 
> -- 
> 2.56.1

-- 
Ville Syrjälä
Intel

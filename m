Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66AE8CD8CB2
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jun 2026 12:44:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBBE510E5FD;
	Wed, 10 Jun 2026 12:44:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="auAM5ll/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE93610E5F6;
 Wed, 10 Jun 2026 12:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781095491; x=1812631491;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=hIWCz3UA4vNH9IueJBRqoaIAuCwHOvIq3PBAp5wQmDU=;
 b=auAM5ll/K796DgQKcO2YBMLNn3Qn/BdI5HwLoxHbzrM2WZeiW29O07HP
 bF0BjJfXWHFxBNvQXxKEtlw5fn5aF7+MvBzCzxFLb9ZMVxAX6KRnZ8xnp
 uvCvNchD6sH2yPXT9yzU//JiAoyZMbhn9h62lTZdCaynszshZ7lD/qWpL
 6xoeyvdznfBu8LBjHetTH13CTJyCVeptXc+Gh1VOJm379MK79rDzzRcTC
 njNMwVofXXWQq2qcF+FCN1f/Yr3xpGJr2kqoJzphOwc0O/RwBYBdufTMO
 pJ22ay1BxzJ6hpS99A/+v+mA241251rhccMvhMf63/pRRvbeIbNOXulxP A==;
X-CSE-ConnectionGUID: Nw/N3SubQomXGSH8CHp8hA==
X-CSE-MsgGUID: ZRCYjFkDQ1KlcyfBQSdozA==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="92205677"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="92205677"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 05:44:50 -0700
X-CSE-ConnectionGUID: G5I+w7t3QfOI/Z44Q2pZ1w==
X-CSE-MsgGUID: kGGTfdADQ2ySA6y2DxnChg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="242024690"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.62])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 05:44:48 -0700
Date: Wed, 10 Jun 2026 15:44:44 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: =?utf-8?Q?Micha=C5=82?= Grzelak <michal.grzelak@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Nemesa Garg <nemesa.garg@intel.com>
Subject: Re: [PATCH v1 0/9] drm/i915/scaler: allocation cleanup
Message-ID: <ailcPBpmqJ0wa7--@intel.com>
References: <20260609231217.208357-1-michal.grzelak@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260609231217.208357-1-michal.grzelak@intel.com>
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

On Wed, Jun 10, 2026 at 01:12:08AM +0200, Michał Grzelak wrote:
> Apparently during review of commit 17d70a0760f2 ("drm/i915/casf: Extract
> scaler_has_casf()") I missed that argument plane_state isn't used
> anymore. While at it couple other fixes included.
> 
> This series will almost surely need a better splitting than currently
> is, but I hope now it is slightly easier to review.
> 
> BR,
> Michał
> 
> 
> Michał Grzelak (9):
>   drm/i915/scaler: remove unused plane_state argument
>   drm/i915/scaler: s/i/scaler_id/

Those seem fine.

>   drm/i915/scaler: de-Morgan-ize !scaler_has_casf()
>   drm/i915/scaler: move independent CASF check
>   drm/i915/scaler: check CASF before allocation's loop
>   drm/i915/scaler: inline CASF scaler allocation
>   drm/i915/scaler: linearize scaler allocation
>   drm/i915/scaler: move CASF alloc check into
>     intel_atomic_setup_scaler()
>   drm/i915/scaler: move CASF alloc check into setup_crtc_scaler()

This looks like it's replacing a simple "does this scale have CASF?"
check with some kind of more complicated special casing of the CASF
scaler elsewhere. I don't like it.

> 
>  drivers/gpu/drm/i915/display/skl_scaler.c | 43 ++++++++++++-----------
>  1 file changed, 22 insertions(+), 21 deletions(-)
> 
> -- 
> 2.45.2

-- 
Ville Syrjälä
Intel

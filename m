Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FDA0E81BD3
	for <intel-xe@archiver.kernel.org>; Mon,  9 Feb 2026 15:10:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F40BF10E414;
	Mon,  9 Feb 2026 15:10:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I0KbLPit";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 991C510E413;
 Mon,  9 Feb 2026 15:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770649847; x=1802185847;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=ms/Begmy9LjHPEoUJcIXW9BvtoJA723LWVNNWyWTaxc=;
 b=I0KbLPitcJhey2Kq1zXUk0QLrmPxtXxWQsZAuJ97XQLEgxKPtjXneIth
 176V+piw6nB/dUbwFD6zGLelVCBI+0grtBHngd/TlpZxoi95Z3h7eTLeV
 yjQFW5TKOsgMplr6vc7PN2/QArbgzWokEnkATAo34cGAkTrQBUAEqbd2w
 DBFUbkKIXLawyxpb+nJe+YM30cLvn2OcSSTRd+qwE9k3McPBk5snEkkNT
 XsfeyCkI2KlHkTkCEe4ymHdkAVBIL2XjCiHaiUcQda/6Kmm+JNCfIf7U6
 YjhreyWUXXhZurcW9zuVEqmNSv85m9o5tevt793TMzQLzbpWBiv89cLIW w==;
X-CSE-ConnectionGUID: lJDxVOd9SwyX4PUAR+W8ng==
X-CSE-MsgGUID: pz1dmJqKQ2GrmOfCSXhvlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="82869054"
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; d="scan'208";a="82869054"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2026 07:10:47 -0800
X-CSE-ConnectionGUID: P4EsfdI8Qa2enyYoop9WVg==
X-CSE-MsgGUID: LdUC4nBzT2aX6ZkxFd4dtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; d="scan'208";a="216580321"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.186])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2026 07:10:46 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [CI] drm/i915/display: change pipe allocation order for
 discrete platforms
In-Reply-To: <20260206123715.234245-1-jani.nikula@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260206123715.234245-1-jani.nikula@intel.com>
Date: Mon, 09 Feb 2026 17:10:42 +0200
Message-ID: <cf64c6a82c6ee7275b6e4099c6717c0039367cbe@intel.com>
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

On Fri, 06 Feb 2026, Jani Nikula <jani.nikula@intel.com> wrote:
> @@ -415,6 +438,8 @@ int intel_crtc_init(struct intel_display *display)
>  		    INTEL_NUM_PIPES(display), str_plural(INTEL_NUM_PIPES(display)));
>  
>  	for_each_pipe(display, pipe) {
> +		pipe = reorder_pipe(display, pipe);
> +

This assignment screws up the loop variable and everything
breaks. *facepalm*.

See [1] instead.


[1] https://lore.kernel.org/r/20260209141657.629872-1-jani.nikula@intel.com


-- 
Jani Nikula, Intel

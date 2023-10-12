Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FBCACDB46E
	for <intel-xe@archiver.kernel.org>; Thu, 12 Oct 2023 10:30:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55BEA10E4A9;
	Thu, 12 Oct 2023 10:30:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18B0B10E4A9
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Oct 2023 10:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697106644; x=1728642644;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=TNfbXbQ//vHgk4WhuJ8wOyU0NfETbhvSaj9IvuKtwyA=;
 b=gGwbo+HWmxntT6VVM7TNt7laimNjTLnzk+TCezx7Ml4EQIANXXluSwC3
 z0Rc41J91efi2i1KzDk26azUl/1v0Zlce93y3R54FubhWdX6Qr/9w7YTx
 dpY+eyUrmNlBnO2JEUz3voA0BpqJtqydS7KtSvLqXITVBOKZaby3Qtukl
 dmMoCzSO6BSUu5yUUZc1iqj3U9BGJkjhEBW+uynYD7j4jwagMSVmthx/n
 b5G/nsfvAqp+A3bpOuHZCvmurrPgwD8pUjY0G3JRXPo3APoPzPKzXr/v/
 p0qwLDB7DSPa9RImqqjhoLHtFRDHBIyZuNrGa8f8irDsKKvgkSK2gJDqv g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="471146243"
X-IronPort-AV: E=Sophos;i="6.03,218,1694761200"; d="scan'208";a="471146243"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 03:30:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="1001506376"
X-IronPort-AV: E=Sophos;i="6.03,218,1694761200"; d="scan'208";a="1001506376"
Received: from anikafix-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.42.188])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 03:30:41 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Suraj Kandpal <suraj.kandpal@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20231012102622.810974-2-suraj.kandpal@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20231012102622.810974-1-suraj.kandpal@intel.com>
 <20231012102622.810974-2-suraj.kandpal@intel.com>
Date: Thu, 12 Oct 2023 13:30:40 +0300
Message-ID: <8734yg2kvj.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-xe] [PATCH v4 1/3] fixup! FIXME: drm/i915: xe doesn't
 have gsc hdcp interface or something
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

On Thu, 12 Oct 2023, Suraj Kandpal <suraj.kandpal@intel.com> wrote:
> Remove stubs to clean up HDCP code
>
> --v3
> -Should be a fixup patch [Jani]

Did I really say that? If yes, I was wrong. Sorry, this should be a
revert of said commit.

BR,
Jani.


>
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_hdcp.c | 5 -----
>  1 file changed, 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
> index ce9993c64459..8cca4793cf92 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdcp.c
> +++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
> @@ -173,7 +173,6 @@ bool intel_hdcp2_capable(struct intel_connector *connector)
>  
>  	/* If MTL+ make sure gsc is loaded and proxy is setup */
>  	if (intel_hdcp_gsc_cs_required(i915)) {
> -#ifdef I915
>  		struct intel_gt *gt = i915->media_gt;
>  		struct intel_gsc_uc *gsc = gt ? &gt->uc.gsc : NULL;
>  
> @@ -182,10 +181,6 @@ bool intel_hdcp2_capable(struct intel_connector *connector)
>  				    "GSC components required for HDCP2.2 are not ready\n");
>  			return false;
>  		}
> -#else
> -		/* TODO */
> -		return false;
> -#endif
>  	}
>  
>  	/* MEI/GSC interface is solid depending on which is used */

-- 
Jani Nikula, Intel

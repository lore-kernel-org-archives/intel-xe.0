Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0DC5C4451B
	for <intel-xe@archiver.kernel.org>; Fri, 17 Jul 2026 16:05:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72A6710E483;
	Fri, 17 Jul 2026 16:05:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AF9EL/pW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0599D10E483;
 Fri, 17 Jul 2026 16:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784304332; x=1815840332;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=tM4dT+Nmv5zOrvAbTwI+ob1hRXlnRoJ6llL+/ffH6e8=;
 b=AF9EL/pWpMfQBeHnkrhAmIo22VkoMpG6qSxu5qTD5o6HFVfIaqlxYlyF
 pPTB4841Qbd0umY1J8aQnAlH42gHQHOWuBiAwSgxYmmscRQi5hvAIhcIr
 /7qq7DvFPiuTP4zZ532x/c7X89YR31aWJIIkQWxIO206XQRuyYTDBSObG
 vIZMOHJPt5KTXeoMUagQrsXeBvhKjYdmmW7m67IWvScCHSNH/kcM/ChH6
 AVTqmrwBPQ3zeY0bEGkvXo5G/VeODJwaHMBymTSCjlL1fwQWjOF1z2Uqr
 +m5qC4x3dj+H4byo8NtrhNlTljOyKNozsmOeL4ONXWk+IFfqWfwmk+l8T Q==;
X-CSE-ConnectionGUID: UMZRGFc4SdyZ1TfW15h6cg==
X-CSE-MsgGUID: 0TJRthEgRByp6wBk1GE60g==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="85020189"
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; d="scan'208";a="85020189"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2026 09:05:32 -0700
X-CSE-ConnectionGUID: XZ9XCs/zRw2W7ITlek9Uew==
X-CSE-MsgGUID: ZrgroqvvRcy+6Dvts+/Huw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; d="scan'208";a="260409492"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.245.241])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2026 09:05:29 -0700
Date: Fri, 17 Jul 2026 19:05:26 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, stable@vger.kernel.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH 1/2] drm/i915/cdclk: Avoid spurious cdclk sanitization on
 PTL+
Message-ID: <alpSxjjmv34zKW2p@intel.com>
References: <20260717155107.17801-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260717155107.17801-1-ville.syrjala@linux.intel.com>
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

On Fri, Jul 17, 2026 at 06:51:06PM +0300, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> Apparently PTL+ no longer has the cd2x pipe select field in
> CDCLK_CTL. Take that into account during CDCLK sanitization.
> 
> This currently triggers a spurious CDCLK sanitization during
> driver load on PTL+ which will causes a visible glitch on all
> active displays.
> 
> Cc: stable@vger.kernel.org
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/8550
> Fixes: 3f9de66f8acb ("drm/i915/cdclk: Fix up CDCLK_FREQ_DECIMAL without a full PLL re-enable")
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---

Unfortunately the regression itself has a cc:stable on it, so we'll
need to backport this fix as well.

To do that cleanly we need to pick up these as well:
commit cd16e794aead ("drm/i915/cdclk: Clean up CDCLK_CTL defines")
commit 67d77d9472c6 ("drm/i915/cdclk: Introduce bxt_cdclk_cd2x_pipe_mask() and use it")

>  drivers/gpu/drm/i915/display/intel_cdclk.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_cdclk.c b/drivers/gpu/drm/i915/display/intel_cdclk.c
> index a53d88727177..9e5e15b0c4d1 100644
> --- a/drivers/gpu/drm/i915/display/intel_cdclk.c
> +++ b/drivers/gpu/drm/i915/display/intel_cdclk.c
> @@ -2381,8 +2381,10 @@ static void bxt_sanitize_cdclk(struct intel_display *display)
>  	 * dividers both syncing to an active pipe, or asynchronously
>  	 * (PIPE_NONE).
>  	 */
> -	cdctl &= ~bxt_cdclk_cd2x_pipe_mask(display);
> -	cdctl |= bxt_cdclk_cd2x_pipe(display, INVALID_PIPE);
> +	if (DISPLAY_VER(display) < 30) {
> +		cdctl &= ~bxt_cdclk_cd2x_pipe_mask(display);
> +		cdctl |= bxt_cdclk_cd2x_pipe(display, INVALID_PIPE);
> +	}
>  
>  	if (cdctl != expected) {
>  		if (DISPLAY_VER(display) < 20) {
> -- 
> 2.54.0

-- 
Ville Syrjälä
Intel

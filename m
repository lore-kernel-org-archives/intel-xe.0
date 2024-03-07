Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C136C5475B
	for <intel-xe@archiver.kernel.org>; Thu,  7 Mar 2024 00:30:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFB7311361F;
	Thu,  7 Mar 2024 00:30:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a60VAVgl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 611F6113620
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Mar 2024 00:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709771451; x=1741307451;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=WBc3SkJn/5XAwizX2elgxy+99AdUX5I+pnGN2XWKN3k=;
 b=a60VAVglPDe6Aw8VW1wn1YenRjoSEmoclxK7Rtnbf2mrLWjJjQzOY8KC
 tCLadwmDSJh6RqYDCy4xV7AjR3w5iZXS6OyHl4SaNejQcSuLMt1hgClyA
 e3fX2nhn6Gbaf1gU0TmL78Ftr4i1K+xwQNBR07/FicEZFLwKIO5gpDaWh
 TY5vCWJj2cm6mIsIFGKRoCnKIOEFWS21m8TRZ+LsWLKcJMFRGVc9OY2mE
 SV6qzL6bS5+xYbOV0wun0dTP081L5H2d9S8nKxsoDyJ63789Xru5r5tBH
 82RjYbIu5e9cNGre8SzYuVFt171HBGupOThgtHrOenLoMg0+4oaWWfRyD g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="29864004"
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; d="scan'208";a="29864004"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 16:30:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="827774515"
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; d="scan'208";a="827774515"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 06 Mar 2024 16:30:47 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 07 Mar 2024 02:30:46 +0200
Date: Thu, 7 Mar 2024 02:30:46 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freexdesktop.org,
 Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH 01/10] drm/i915/display: convert inner wakeref get
 towards get_if_in_use
Message-ID: <ZekKtpIobqZzyvDR@intel.com>
References: <20240307001554.162153-1-rodrigo.vivi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240307001554.162153-1-rodrigo.vivi@intel.com>
X-Patchwork-Hint: comment
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

On Wed, Mar 06, 2024 at 07:15:45PM -0500, Rodrigo Vivi wrote:
> This patch brings no functional change. Since at this point of
> the code we are already asserting a wakeref was held, it means
> that we are with runtime_pm 'in_use' and in practical terms we
> are only bumping the pm_runtime usage counter and moving on.
> 
> However, xe driver has a lockdep annotation that warned us that
> if a sync resume was actually called at this point, we could have
> a deadlock because we are inside the power_domains->lock locked
> area and the resume would call the irq_reset, which would also
> try to get the power_domains->lock.
> 
> For this reason, let's convert this call to a safer option and
> calm lockdep on.
> 
> Cc: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_display_power.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_display_power.c b/drivers/gpu/drm/i915/display/intel_display_power.c
> index 6fd4fa52253a..4c5168a5bbf4 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_power.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_power.c
> @@ -646,7 +646,7 @@ release_async_put_domains(struct i915_power_domains *power_domains,
>  	 * power well disabling.
>  	 */
>  	assert_rpm_raw_wakeref_held(rpm);
> -	wakeref = intel_runtime_pm_get(rpm);
> +	wakeref = intel_runtime_pm_get_if_in_use(rpm);

On first glance that sequence looks like complete nonsense, and
thus likely to be cleaned up by someone later.

To me _noresume() would seem like the more sensible thing to use
here. And even that might still warrant a comment to explain
why that one is used specifically.

I'm also confused by the wakeref vs. wakelock stuff in the runtime pm
code. Is that there just because not all places track the wakerefs?
Do we still have those left?

>  
>  	for_each_power_domain(domain, mask) {
>  		/* Clear before put, so put's sanity check is happy. */
> -- 
> 2.43.2

-- 
Ville Syrjälä
Intel

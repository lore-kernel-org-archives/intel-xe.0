Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D852606EE80
	for <intel-xe@archiver.kernel.org>; Fri,  6 Nov 2026 11:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IbNOfskd
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECED610E49E;
	Fri,  6 Nov 2026 11:30:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AA8D10E49E;
 Fri,  6 Nov 2026 11:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793964611; x=1825500611;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=GK/563x6tR4WLUFQQaCsN8n/obNWN8uKgyI5EBMWAXM=;
 b=IbNOfskdqx/TYSHXPcTK7OEU/dsF/NeISug26AJQPwHxyo4S/WEnRJkT
 TGsSNEDFjepC8PmQvOf6OC7kRy33X+cAR0K6s6MGt/Mgz6JJa0+WMOBbN
 6wX6N54DtTSDBDfSkAbtLajS8IsN0YUvYoHFJW8/xW9PW8AHbC1x9Nji4
 AmPwcaOtXSoEXzEhOhGdC5CluNsYf0kgRiU0sASVnF3SQgQ2vH8qjLjPK
 9AT+pvo1vyZIZEfLfzq1IU6s0Lba2grzGGm4otoFAc3QRSjHiGiu3+6ox
 WsmQxWFN7RAiYhOhXBVJgv2cBnncs4aNL6/karTjc70JD/T2bicazagWE g==;
X-CSE-ConnectionGUID: KrM1VXTpT46wVq45Z2q0Hg==
X-CSE-MsgGUID: jQStehx0SXqfb0HaS++09Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2766332"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2766332"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2026 03:30:10 -0800
X-CSE-ConnectionGUID: ao5OsVLTTIKNcyZdmw0rGQ==
X-CSE-MsgGUID: zv1trccIT/q1DRwV0IljpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7247791"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.101])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2026 03:30:07 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Wentao Guan <guanwentao@uniontech.com>, joonas.lahtinen@linux.intel.com,
 imre.deak@intel.com, jouni.hogander@intel.com
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, Wentao
 Guan <guanwentao@uniontech.com>, stable@vger.kernel.org
Subject: Re: [PATCH] drm/i915/display: Don't drop the async-put delay on
 self-requeue
In-Reply-To: <134A26B6BCDD3C9C+20261104053910.1065103-1-guanwentao@uniontech.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <134A26B6BCDD3C9C+20261104053910.1065103-1-guanwentao@uniontech.com>
Date: Fri, 06 Nov 2026 13:30:04 +0200
Message-ID: <a2b152662d219f9be0861e63ddbb78dd1971dc2a@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 04 Nov 2026, Wentao Guan <guanwentao@uniontech.com> wrote:
> cancel_async_put_work() also clears async_put_next_delay, so moving it
> ahead of the requeue in intel_display_power_put_async_work() makes the
> requeue always use a zero delay. That discards the delay accumulated by
> concurrent async puts, including the 17 ms DC-state anti-toggle delay
> requested for POWER_DOMAIN_DC_OFF.
>
> Use cancel_delayed_work() directly to cancel the stale instance without
> clearing the delay, and clear the delay only after the requeue has
> consumed it.
>
> Fixes: 30ca6365bb42 ("drm/i915: Fix assert on pending async-put power domain work when it requeues itself")
> Cc: <stable@vger.kernel.org> # v6.11+
> Signed-off-by: Wentao Guan <guanwentao@uniontech.com>

How did you find this?

Is there a bug report about this?

How did you test this?


BR,
Jani.

> ---
>  drivers/gpu/drm/i915/display/intel_display_power.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display_power.c b/drivers/gpu/drm/i915/display/intel_display_power.c
> index b000ec001ccfc..7da6eda46e9e0 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_power.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_power.c
> @@ -873,7 +873,7 @@ intel_display_power_put_async_work(struct work_struct *work)
>  	 * Cancel the work that got queued after this one got dequeued,
>  	 * since here we released the corresponding async-put reference.
>  	 */
> -	cancel_async_put_work(power_domains, false);
> +	cancel_delayed_work(&power_domains->async_put_work);
>  
>  	/* Requeue the work if more domains were async put meanwhile. */
>  	if (!bitmap_empty(power_domains->async_put_domains[1].bits, POWER_DOMAIN_NUM)) {
> @@ -885,9 +885,10 @@ intel_display_power_put_async_work(struct work_struct *work)
>  		queue_async_put_domains_work(power_domains,
>  					     fetch_and_zero(&new_work_wakeref),
>  					     power_domains->async_put_next_delay);
> -		power_domains->async_put_next_delay = 0;
>  	}
>  
> +	power_domains->async_put_next_delay = 0;
> +
>  out_verify:
>  	verify_async_put_domains_state(power_domains);

-- 
Jani Nikula, Intel

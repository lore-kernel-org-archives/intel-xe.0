Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B913A606A33B
	for <intel-xe@archiver.kernel.org>; Fri, 27 Nov 2026 14:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jSshHMq7
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E7E210E3FC;
	Fri, 27 Nov 2026 14:37:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D40C710E477;
 Fri, 27 Nov 2026 14:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795790222; x=1827326222;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=Wv/0/g35IsyyIBfHa+6cEREy626yD6GLcfWcQ/LnlPE=;
 b=jSshHMq7uuNthpI/zib8hcMKqFAQBuXVwp0NzhAF0x+S+vFKitCQm6QH
 b9rGHTjcMjJdQ+1F+fXfJ3/rELlnBduiuufOElkth2nw9zfJP3UKb0eqf
 JqDJNYcAIgJ2dhDK3TBSC2Z/Y5jv4hNt7IDjGms796/iXyevDWC7fMCOo
 ATjNBv2b9OnNYvXJmnxm84CjsO28FDLiAfi8LovtxNPiYrZ+ezXdp5tgD
 9QxxN+PpcV7bUkjDZgAAS78v2mmUTGLLnMnVeXjQ/h3kE7cbs3VNkpDIQ
 C+rdQb3PewZbtZ1bVxOQ5ZVHaP9KgExw91R8OgdPcr/hR+rkQiL7/7KBF g==;
X-CSE-ConnectionGUID: 16SmagdySymfSbch1C2D0w==
X-CSE-MsgGUID: e1ZLh4LbRTKJOxzkdne20Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4593351"
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="4593351"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 06:37:01 -0800
X-CSE-ConnectionGUID: RFB+SOSIRrC3I6gQPVTlww==
X-CSE-MsgGUID: cWqD3t/hRE+H8ZoeRR4UmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; d="scan'208";a="12826019"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.90])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 06:37:00 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 2/7] drm/i915/de: Pimp the intel_reg_rw tracepoint
 printf format
In-Reply-To: <20261126212728.9034-3-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261126212728.9034-1-ville.syrjala@linux.intel.com>
 <20261126212728.9034-3-ville.syrjala@linux.intel.com>
Date: Fri, 27 Nov 2026 16:36:58 +0200
Message-ID: <d42d6e50ae618f5382189b407ed441a1d86474e3@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 26 Nov 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Make the intel_reg_rw tracepoint prints a bit more pleasant:
> - Make the "read" vs. "write" field the same width so the
>   following columns all line up when reading+writing the
>   same registers
> - Zero pad the value to the full register width. Counting
>   hex digits to figure out if I'm looking at bit 26 or bit
>   22 isn't particularly fun.
>
> I was also considering making the register offset field a
> constant width so things wouldn't shift around when the register
> offsets are in different ranges. But I don't really want to zero
> pad that as it makes it harder to see which register it is, and
> all the other options would add extra whitespace gaps into the
> string which doesn't seem like a good idea either. I guess most
> of our register offsets are in the five hex digit range anyway
> so this probably doesn't matter all that much.

An idea is to pad with space *before* the 0x, so that the values line up
too. But that shouldn't block this, can be tweaked to heart's content
later.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>


>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_display_trace.h | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display_trace.h b/drivers=
/gpu/drm/i915/display/intel_display_trace.h
> index fe69d203549b..0cd1eed0bccf 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_trace.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_trace.h
> @@ -978,9 +978,10 @@ TRACE_EVENT(intel_reg_rw,
>  		__entry->len =3D len;
>  		),
>=20=20
> -	TP_printk("%s reg=3D0x%x, len=3D%d, val=3D0x%x",
> -		__entry->write ? "write" : "read",
> -		__entry->reg, __entry->len, __entry->val)
> +	TP_printk("%5s reg=3D0x%x, len=3D%d, val=3D0x%0*x",
> +		  __entry->write ? "write" : "read",
> +		  __entry->reg, __entry->len,
> +		  __entry->len * 2, __entry->val)
>  );
>=20=20
>  #endif /* __INTEL_DISPLAY_TRACE_H__ */

--=20
Jani Nikula, Intel

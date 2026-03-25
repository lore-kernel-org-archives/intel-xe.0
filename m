Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A3A3106B519
	for <intel-xe@archiver.kernel.org>; Wed, 25 Mar 2026 12:25:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09B9B10E6FA;
	Wed, 25 Mar 2026 12:25:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xi12pFeK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 018B410E6FA;
 Wed, 25 Mar 2026 12:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774441555; x=1805977555;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=k+9nq2U1zhcbKXvQJtI+YDU1nbd7P9XxfzQeLmERsBU=;
 b=Xi12pFeKyyQRA77SPjlljjFVEppTBfvihdoX2m1+FXR+tGp2S9MUzxqp
 vs2fIil2Zj3zmvkIAAj/fySmPEPXSeWZGKrNsSwsFWW9DTZ7KwNJRLqoF
 y9I2UJ+K0mbRYklfSuhzfQnu3zJggTi5hEZbBX+A9GSVs2HztFRUUUuvS
 GjErHoU0cN7okGNfmvDCHXwRkaSAWnpfmim3cZTdGuKq+IF5ak3/KOeup
 C1Uw9N1CK1brX0TfQAOyoYM+UvfwHYHm4083iKY1KnHVXsCBslXrw93he
 C7bVzrGIXFjbIkjhUdE15/nT07niD9iIzLRG3EUHZ+qQ0JtVqkHQ4A0da Q==;
X-CSE-ConnectionGUID: OHYK8ct1Qi6/R6E4OUHA0Q==
X-CSE-MsgGUID: TZmE2hhDQ4KcNiRbThQ+Yw==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="75357499"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; d="scan'208";a="75357499"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 05:25:55 -0700
X-CSE-ConnectionGUID: vmLM5b6mRgOw8xcaFBxagw==
X-CSE-MsgGUID: utgCSGWSSNeCmKkBh4XM9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; d="scan'208";a="220261604"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.117])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 05:25:52 -0700
Date: Wed, 25 Mar 2026 14:25:49 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Suraj Kandpal <suraj.kandpal@intel.com>
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 sowmiya.s@intel.com, uma.shankar@intel.com, swati2.sharma@intel.com,
 chaitanya.kumar.borah@intel.com, arun.r.murthy@intel.com
Subject: Re: [PATCH v3 16/26] drm/i915/writeback: Add writeback to xe Makefile
Message-ID: <acPUTVa3Qc47KpQQ@intel.com>
References: <20260325110744.1096786-1-suraj.kandpal@intel.com>
 <20260325110744.1096786-17-suraj.kandpal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260325110744.1096786-17-suraj.kandpal@intel.com>
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

On Wed, Mar 25, 2026 at 04:37:34PM +0530, Suraj Kandpal wrote:
> Add a intel_writeback.c to xe so that it builds for xe.
>
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 49de1c22a469..2e456070895a 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -327,6 +327,7 @@ xe-$(CONFIG_DRM_XE_DISPLAY) += \
>  	i915-display/intel_vga.o \
>  	i915-display/intel_vrr.o \
>  	i915-display/intel_wm.o \
> +	i915-display/intel_writeback.o \

Another one that should be squashed.

>  	i915-display/skl_prefill.o \
>  	i915-display/skl_scaler.o \
>  	i915-display/skl_universal_plane.o \
> -- 
> 2.34.1

-- 
Ville Syrjälä
Intel

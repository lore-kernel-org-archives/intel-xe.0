Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE74CCD4F41
	for <intel-xe@archiver.kernel.org>; Fri, 22 Sep 2023 09:27:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89EC310E042;
	Fri, 22 Sep 2023 09:27:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A37B10E042
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Sep 2023 09:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695374877; x=1726910877;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=KBlKE0qzsLD8Lq0H4W08rpFhm7sDwLHTq1qS5metyd4=;
 b=H6NPY0wPakJGIIhKpNK1Mz7Sv1fRqonvkZ17vwNK3Ih8sv0qdcCvbl4s
 Q88ydazNlbN/M2EZckRAG0qSVPv5jaFoSS0o7QGA/l9TvkjWQE80UDC37
 jqm8JLB611vNBGR4E1DQu3+HnhhxdVGFB45GVaiobQNagNdPK1S543R31
 vqODZM0vSDHL2frYrTOYpDEoOOPZt88D2j8njJswaVQ/f0EGwNUZKzIq3
 Vg21CgZ8Q4e/v/tkvZLu6pwoTXFZRNl7ZQe4I95Pq1YOv7jlVW6fA7i4P
 CZ6OpsXyolsVrlBVbRaFfuzpCF4gfWcuWp7Tj+CrciQKGb93pitovR2wM Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="383533408"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; d="scan'208";a="383533408"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2023 02:27:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="813004209"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; d="scan'208";a="813004209"
Received: from mtomczew-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.37.163])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2023 02:27:16 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Suraj Kandpal <suraj.kandpal@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20230922082909.334085-2-suraj.kandpal@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230922082909.334085-1-suraj.kandpal@intel.com>
 <20230922082909.334085-2-suraj.kandpal@intel.com>
Date: Fri, 22 Sep 2023 12:27:13 +0300
Message-ID: <87y1gyo8we.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-xe] [PATCH 1/3] drm/i915/hdcp: Remove i915 check stubs
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

On Fri, 22 Sep 2023, Suraj Kandpal <suraj.kandpal@intel.com> wrote:
> Remove i915 check stubs the subsequent patch will add function
> which implements a cleaner method to share code between
> i915 and Xe

This should be a fixup! patch to whichever commit in drm-xe-next
introduced the changes.

See git commit --fixup to generate the annotation for that.

BR,
Jani.

>
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_hdcp.c | 5 -----
>  1 file changed, 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
> index f617ccd206c8..a42549fa9691 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdcp.c
> +++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
> @@ -174,7 +174,6 @@ bool intel_hdcp2_capable(struct intel_connector *connector)
>  
>  	/* If MTL+ make sure gsc is loaded and proxy is setup */
>  	if (intel_hdcp_gsc_cs_required(i915)) {
> -#ifdef I915
>  		struct intel_gt *gt = i915->media_gt;
>  		struct intel_gsc_uc *gsc = gt ? &gt->uc.gsc : NULL;
>  
> @@ -183,10 +182,6 @@ bool intel_hdcp2_capable(struct intel_connector *connector)
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

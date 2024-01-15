Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B497CC3DA79
	for <intel-xe@archiver.kernel.org>; Mon, 15 Jan 2024 07:33:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F30010E173;
	Mon, 15 Jan 2024 07:33:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7B1110E173
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Jan 2024 07:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705304030; x=1736840030;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=JWAVpFZeffQ+wIjcr5nIap2m1ybTt3yZYl2pSOfiD/s=;
 b=SV2k9vqCgGtfrYqsia4bGgX04U86QaK/YisnHz5Wrkkr90QiDJpZ1e5n
 DUK151zgiQtDammvuxmrHIVruFam/cjomdh26K+dOBVC8WkSvDnZuHoLA
 i7SuwC8li4//DcBAYRUHd43pSlbYxpgcFlABNSxLr/f2JspHM5FA/zr9K
 JAB7XF21t2e0Yddg7xx5PKWgG8x0Uc5odq87i91vk1lsXZCj5tYwJSl0X
 8lbecI2pgRfDP6hblkQ1j6U8myqHSTORUqrzg8VN2yp9kKutsrMRf2vge
 mh/JnZfOwJuqS348DWFTOMwSgcyuvLW+mbbMdRRqH1Rt63y9+8jZS+xGM g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="12911641"
X-IronPort-AV: E=Sophos;i="6.04,196,1695711600"; d="scan'208";a="12911641"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2024 23:33:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="783725243"
X-IronPort-AV: E=Sophos;i="6.04,196,1695711600"; d="scan'208";a="783725243"
Received: from nrseife-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.54.233])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2024 23:33:47 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Subject: Re: [PATCH] drm/xe: display support should not depend on EXPERT
In-Reply-To: <ZZ_JwanaiY9uehN9@fdugast-desk.home>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240111104716.3548744-1-jani.nikula@intel.com>
 <87wmsgtabt.fsf@intel.com> <ZZ_JwanaiY9uehN9@fdugast-desk.home>
Date: Mon, 15 Jan 2024 09:33:44 +0200
Message-ID: <87jzobrqxz.fsf@intel.com>
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
Cc: Eero Tamminen <eero.t.tamminen@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, 11 Jan 2024, Francois Dugast <francois.dugast@intel.com> wrote:
> On Thu, Jan 11, 2024 at 12:48:22PM +0200, Jani Nikula wrote:
>> On Thu, 11 Jan 2024, Jani Nikula <jani.nikula@intel.com> wrote:
>> > Remove the DRM_XE_DISPLAY config dependency on EXPERT. I can only
>> > presume the idea was only experts should be able to disable it, but the
>> > effect is the opposite.
>> 
>> Forgot to add,
>> 
>> Reported-by: Eero Tamminen <eero.t.tamminen@intel.com>
>> 
>> > Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>
> Reviewed-by: Francois Dugast <francois.dugast@intel.com>

Thanks, pushed to drm-xe-next.

BR,
Jani.

>
>> > ---
>> >  drivers/gpu/drm/xe/Kconfig | 2 +-
>> >  1 file changed, 1 insertion(+), 1 deletion(-)
>> >
>> > diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
>> > index 1cced50d8d8c..e36ae1f0d885 100644
>> > --- a/drivers/gpu/drm/xe/Kconfig
>> > +++ b/drivers/gpu/drm/xe/Kconfig
>> > @@ -47,7 +47,7 @@ config DRM_XE
>> >  
>> >  config DRM_XE_DISPLAY
>> >  	bool "Enable display support"
>> > -	depends on DRM_XE && EXPERT && DRM_XE=m
>> > +	depends on DRM_XE && DRM_XE=m
>> >  	select FB_IOMEM_HELPERS
>> >  	select I2C
>> >  	select I2C_ALGOBIT
>> 
>> -- 
>> Jani Nikula, Intel

-- 
Jani Nikula, Intel

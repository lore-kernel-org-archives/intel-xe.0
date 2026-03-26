Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 128E910A62CB
	for <intel-xe@archiver.kernel.org>; Thu, 26 Mar 2026 13:14:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9F9F10E955;
	Thu, 26 Mar 2026 13:14:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GgZfjpXO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BD1B10E957
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Mar 2026 13:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774530887; x=1806066887;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=0rSRknNQwy0pUroTwX4OXJtc2hFIpmqDfbQyGp4QnRY=;
 b=GgZfjpXOHRxuxrR6cklET9BUkw9G9JZmO4G/bAQMgaFm7BT4h3hdP9vv
 TAfceLXAAHIroSkrfJvCzhhPOev3ym6stA9e5hoyyuEv1ir0a/0lRxDm1
 z/9fdHYKnIxxCStT8joQ/RWlxd+tb5A9W2dJgrSdqkn3xeM/1R624dekG
 t2UmVh6NzgkyQsJXAw4t5OqfZ14ayzeBCSTY0OATEHItAO5KbC6MVGI4r
 jax1rv9RYwkJLGPoOGofWuU2E/Emj9/+8SoK6UaA0wsyemDVp40ZHjkSX
 6dvnQiVehZLXUrIlR1BGBbQCDFpkfsoTZVDpYKb4t1k8Hlv0+s+2SO/50 g==;
X-CSE-ConnectionGUID: 2AWe5S3iT9SU6durdkBEcw==
X-CSE-MsgGUID: mOkGPmJPR6+gax7A+oVgUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="75550678"
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; d="scan'208";a="75550678"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 06:14:47 -0700
X-CSE-ConnectionGUID: zhDJ9uNORI+1hsNbELwyyg==
X-CSE-MsgGUID: x3pKBS3/RPSHFLFmRUcVzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; d="scan'208";a="225007312"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.14])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 06:14:45 -0700
Date: Thu, 26 Mar 2026 15:14:42 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH] drm/xe: Remove useless comment.
Message-ID: <acUxQpoZRVwPfQpr@intel.com>
References: <20260326121818.122401-2-dev@lankhorst.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260326121818.122401-2-dev@lankhorst.se>
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

On Thu, Mar 26, 2026 at 01:18:14PM +0100, Maarten Lankhorst wrote:
> Commit 792d2b9a1259 ("drm: drop mtrr from i915"), added this comment,
> drop it since it was carried over from i915.
> 
> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
> ---
>  drivers/gpu/drm/xe/xe_device.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index e77a3a3db73db..94629d782d07d 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -388,9 +388,6 @@ bool xe_is_xe_file(const struct file *file)
>  }
>  
>  static struct drm_driver driver = {
> -	/* Don't use MTRRs here; the Xserver or userspace app should
> -	 * deal with them for Intel hardware.
> -	 */

The entire DRIVER_USE_MTRR was killed off in 2013 with
commit 281856477cda ("drm: rip out drm_core_has_MTRR checks").
The leftover comment should be deleted from i915 as well.

This one is
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

>  	.driver_features =
>  	    DRIVER_GEM |
>  	    DRIVER_RENDER | DRIVER_SYNCOBJ |
> -- 
> 2.53.0

-- 
Ville Syrjälä
Intel

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BF62FED2F9
	for <intel-xe@archiver.kernel.org>; Thu, 12 Mar 2026 10:17:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 155FB10E9CF;
	Thu, 12 Mar 2026 10:17:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a6bF6945";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E24D10E9CC;
 Thu, 12 Mar 2026 10:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773310658; x=1804846658;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=q10lpM6sZRUITHwwKuTv+xH4LIsg86jKPcy0faoM7Es=;
 b=a6bF69457qd5u4VYfWxCJ7pwNbh82azu458xwESN3fY4gq7iBhopmRlM
 B4dWBNNpRjLJRuJTaloTK6DVcSrxdXqXN8C9QmEETGGliT4ycls0fw9Qf
 y+puzaZmFfp510YpDWHP4auem4VZeaIzktY/ZR3JP7IqCdN9Tuxi+sqw7
 MxIg7JqxoPa/5t0Glfmut52zPfvXbBaejz543oP5alHTtwxpCbGNpmWdD
 3/Hoyjg5SVU6inHNI+sEQnqmQJ1AeT5KNdbdoFuFgrZz/zcLvW16tlhDD
 WEG6BoWXHAxmvQmscrYrHp00o1pUoWpNEDsmP591gK0SxCqBWauxEBUsf g==;
X-CSE-ConnectionGUID: KiFnLNPWQ5u4Da180gPRmA==
X-CSE-MsgGUID: eeQOrysrRC6m/RaOChv2Yg==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="85873113"
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; d="scan'208";a="85873113"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 03:17:37 -0700
X-CSE-ConnectionGUID: 6U0YCNtlS/uFf4lm9Auj8w==
X-CSE-MsgGUID: 4EJFmJB5QieJ72tRPRK7Ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; d="scan'208";a="251270236"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 03:17:34 -0700
Date: Thu, 12 Mar 2026 11:17:30 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 netdev@vger.kernel.org, aravind.iddamsetty@linux.intel.com,
 anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 joonas.lahtinen@linux.intel.com, simona.vetter@ffwll.ch,
 airlied@gmail.com, pratik.bari@intel.com,
 joshua.santosh.ranjan@intel.com, ashwin.kumar.kulkarni@intel.com,
 shubham.kumar@intel.com, ravi.kishore.koppuravuri@intel.com,
 anvesh.bakwad@intel.com, maarten.lankhorst@linux.intel.com
Subject: Re: [PATCH 2/4] drm/xe/xe_drm_ras: Add support for
 clear-error-counter in XE DRM RAS
Message-ID: <abKSunbqoLw7uxmd@black.igk.intel.com>
References: <20260311102913.3387468-6-riana.tauro@intel.com>
 <20260311102913.3387468-8-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260311102913.3387468-8-riana.tauro@intel.com>
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

On Wed, Mar 11, 2026 at 03:59:16PM +0530, Riana Tauro wrote:
> Add support for clear-error-counter command in XE DRM RAS.
> This resets the counter value.
> 
> Usage:
> 
> $ sudo ynl --family drm_ras  --do clear-error-counter --json \
> '{"node-id":1, "error-id":1}'
> None
> 
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_drm_ras.c | 35 +++++++++++++++++++++++++++++++--
>  1 file changed, 33 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_drm_ras.c b/drivers/gpu/drm/xe/xe_drm_ras.c
> index e07dc23a155e..c21c8b428de6 100644
> --- a/drivers/gpu/drm/xe/xe_drm_ras.c
> +++ b/drivers/gpu/drm/xe/xe_drm_ras.c
> @@ -27,6 +27,16 @@ static int hw_query_error_counter(struct xe_drm_ras_counter *info,
>  	return 0;
>  }
>  
> +static int hw_clear_error_counter(struct xe_drm_ras_counter *info, u32 error_id)
> +{
> +	if (!info || !info[error_id].name)
> +		return -ENOENT;
> +
> +	atomic_set(&info[error_id].counter, 0);
> +
> +	return 0;
> +}
> +
>  static int query_uncorrectable_error_counter(struct drm_ras_node *ep, u32 error_id,
>  					     const char **name, u32 *val)
>  {
> @@ -37,6 +47,15 @@ static int query_uncorrectable_error_counter(struct drm_ras_node *ep, u32 error_
>  	return hw_query_error_counter(info, error_id, name, val);
>  }
>  
> +static int clear_uncorrectable_error_counter(struct drm_ras_node *node, u32 error_id)
> +{
> +	struct xe_device *xe = node->priv;
> +	struct xe_drm_ras *ras = &xe->ras;
> +	struct xe_drm_ras_counter *info = ras->info[DRM_XE_RAS_ERR_SEV_UNCORRECTABLE];
> +
> +	return hw_clear_error_counter(info, error_id);
> +}
> +
>  static int query_correctable_error_counter(struct drm_ras_node *ep, u32 error_id,
>  					   const char **name, u32 *val)
>  {
> @@ -47,6 +66,15 @@ static int query_correctable_error_counter(struct drm_ras_node *ep, u32 error_id
>  	return hw_query_error_counter(info, error_id, name, val);
>  }
>  
> +static int clear_correctable_error_counter(struct drm_ras_node *node, u32 error_id)
> +{
> +	struct xe_device *xe = node->priv;
> +	struct xe_drm_ras *ras = &xe->ras;
> +	struct xe_drm_ras_counter *info = ras->info[DRM_XE_RAS_ERR_SEV_CORRECTABLE];
> +
> +	return hw_clear_error_counter(info, error_id);
> +}

This would've been much simpler if we had per node info, but for now

Reviewed-by: Raag Jadav <raag.jadav@intel.com>

>  static struct xe_drm_ras_counter *allocate_and_copy_counters(struct xe_device *xe)
>  {
>  	struct xe_drm_ras_counter *counter;
> @@ -92,10 +120,13 @@ static int assign_node_params(struct xe_device *xe, struct drm_ras_node *node,
>  	if (IS_ERR(ras->info[severity]))
>  		return PTR_ERR(ras->info[severity]);
>  
> -	if (severity == DRM_XE_RAS_ERR_SEV_CORRECTABLE)
> +	if (severity == DRM_XE_RAS_ERR_SEV_CORRECTABLE) {
>  		node->query_error_counter = query_correctable_error_counter;
> -	else
> +		node->clear_error_counter = clear_correctable_error_counter;
> +	} else {
>  		node->query_error_counter = query_uncorrectable_error_counter;
> +		node->clear_error_counter = clear_uncorrectable_error_counter;
> +	}
>  
>  	return 0;
>  }
> -- 
> 2.47.1
> 

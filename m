Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 583FDC76195
	for <intel-xe@archiver.kernel.org>; Mon, 27 Mar 2023 18:29:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17B5910E3D8;
	Mon, 27 Mar 2023 18:29:46 +0000 (UTC)
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 717C710E3D8
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Mar 2023 18:29:44 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id e11so10020435lji.8
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Mar 2023 11:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=hardline-pl.20210112.gappssmtp.com; s=20210112; t=1679941782;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=zHtwtTNDFjMNujmYI9OpwFeXDxOKYjU2SdvQAEgw2JM=;
 b=He3BFd9MyjME2qW/jNJSMvzD7XByh8udbz3qI/a8ASoURbO+MbifEl9X0SnO39ddc1
 6SmRrwCKjL//lWgjV6pgsXeZyG/YjP/L5OmBk6BVhvY6tMb+AJaMS5klBQStDm/WAaR+
 HVk71s0jRBjynomwAFftZtYExeZ4RNpVn9dvReqBmbI0uhg9ue4K6nScgd3rhTsn7+Wg
 u0dzXEU6rlkO8aiFJ4wtVFqlpcTnSUWEWMB5nCSHdrCvkMhTDBaSHvmKl/HbaeyOOvXy
 DPvfswQupsISzfunwWX3bR+nI2W0mCCBlV2ChdaibpjiMxVwxkfEjihtTz98c66VYyHL
 zrCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679941782;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zHtwtTNDFjMNujmYI9OpwFeXDxOKYjU2SdvQAEgw2JM=;
 b=Zs4+ZpcaGwRrvSxlKMkuBsFbeLOt8cOqugc0DtJg2Km4wbD2geqJbtZq8BG/wRp5fp
 ALDaAewqcyq2TJkZKDQHbUcgZd+db48rJxkX+ObKqCz2vCt9MiWEcOdXJ8M0lAzosR0U
 4MzNY7aSNpW/Fc1UCm/nuEnqUWMh23RQPGKZfvlZUEZAlf+ieQMjAIRI974AgGYY7eoF
 NEnVMiSNSZ0orV2idxb4cMzNCSX34J+GpdYf9wyfhIyHy3cKvcGrAcmNLRjXRJCMBorM
 ZAL2g8U5VxRKAwVOcJYoPgc/A4yolYgYXqrSoPWwxiPiQmtsMXAyvDBqFm0Hr+V75MMh
 Z8cg==
X-Gm-Message-State: AAQBX9eog73YBV318sTpu9DvM5tD7xcuszLdj7OIspDQjPYcGsw9q7ql
 MR3zma20JXK8sraj15XFjbeK5Q==
X-Google-Smtp-Source: AKy350ahU/ycBdXt+Qw6jQEhSWhTdddFXPXCdDPu2o6SdRFWRsBhbTuGVwU1yvPQku8x3hAE9PjzAQ==
X-Received: by 2002:a2e:9e16:0:b0:298:a636:28 with SMTP id
 e22-20020a2e9e16000000b00298a6360028mr3977976ljk.5.1679941782430; 
 Mon, 27 Mar 2023 11:29:42 -0700 (PDT)
Received: from localhost (83.8.67.91.ipv4.supernova.orange.pl. [83.8.67.91])
 by smtp.gmail.com with ESMTPSA id
 d15-20020a2e330f000000b002958937e9cbsm4767678ljc.99.2023.03.27.11.29.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Mar 2023 11:29:42 -0700 (PDT)
Date: Mon, 27 Mar 2023 20:29:41 +0200
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal@hardline.pl>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <ffly6znbfrvbv53fyzxqwfy3ljvdljq7ie63i325xjajtt454y@7vqf2ht4otqv>
References: <20230321220527.595462-1-lucas.demarchi@intel.com>
 <20230321220527.595462-7-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230321220527.595462-7-lucas.demarchi@intel.com>
Subject: Re: [Intel-xe] [PATCH 6/7] drm/xe/reg_sr: Save errors for kunit
 integration
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
Cc: intel-xe@lists.freedesktop.org, maarten.lankhorst@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Mar 21, 2023 at 03:05:26PM -0700, Lucas De Marchi wrote:
> When there's an entry that is dropped when xe_reg_sr_add(), there's
> not much we can do other than reporting the error - it's for certain a
> driver issue or conflicting workarounds/tunings. Save the number of
> errors to be used later by kunit to report where it happens.

Why there's not much we can do?
We can propagate the error to the upper layers and fail the probe.
Fail-fast?

The following test still makes sense (and LGTM), since it's still a good
idea to be able to validate everything without having to probe() on
actual platform. I would expect it to check return values rather than
sr->errors though.

-Michał

> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_reg_sr.c       | 8 ++++++++
>  drivers/gpu/drm/xe/xe_reg_sr_types.h | 4 ++++
>  2 files changed, 12 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
> index 9eaf1be27886..83f29aeb9250 100644
> --- a/drivers/gpu/drm/xe/xe_reg_sr.c
> +++ b/drivers/gpu/drm/xe/xe_reg_sr.c
> @@ -84,6 +84,13 @@ static bool compatible_entries(const struct xe_reg_sr_entry *e1,
>  	return true;
>  }
>  
> +static void reg_sr_inc_error(struct xe_reg_sr *sr)
> +{
> +#if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
> +	sr->errors++;
> +#endif
> +}
> +
>  int xe_reg_sr_add(struct xe_reg_sr *sr, u32 reg,
>  		  const struct xe_reg_sr_entry *e)
>  {
> @@ -121,6 +128,7 @@ int xe_reg_sr_add(struct xe_reg_sr *sr, u32 reg,
>  	DRM_ERROR("Discarding save-restore reg %04lx (clear: %08x, set: %08x, masked: %s): ret=%d\n",
>  		  idx, e->clr_bits, e->set_bits,
>  		  str_yes_no(e->masked_reg), ret);
> +	reg_sr_inc_error(sr);
>  
>  	return ret;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_reg_sr_types.h b/drivers/gpu/drm/xe/xe_reg_sr_types.h
> index 3d2257891005..91469784fd90 100644
> --- a/drivers/gpu/drm/xe/xe_reg_sr_types.h
> +++ b/drivers/gpu/drm/xe/xe_reg_sr_types.h
> @@ -32,6 +32,10 @@ struct xe_reg_sr {
>  	} pool;
>  	struct xarray xa;
>  	const char *name;
> +
> +#if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
> +	unsigned int errors;
> +#endif
>  };
>  
>  #endif
> -- 
> 2.39.0
> 

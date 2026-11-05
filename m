Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5263E606D822
	for <intel-xe@archiver.kernel.org>; Thu,  5 Nov 2026 12:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=oEfrVAxH
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 195571123AC;
	Thu,  5 Nov 2026 12:19:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A7B11123AC
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Nov 2026 12:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793881174; x=1825417174;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=yRHMU00hHnGM5k+oY40kvN2xL7Ny2QTquADuXxy/IW0=;
 b=oEfrVAxHP6LYAwowWfGfIApm2DEWG1eGFyCr6enIvQbDAWBH7jAs370E
 lh0WXp5mujRL693Tgp1a+pxSrs0jqpGKaUXN1l3+egruut8r3936cOlou
 uAtK9nl8/YqHn8V9wpiV7JBzUjYI/aRUunjxZ18/1UmhlfXlAxd9DVC7M
 SXZf4tW3t2V5S90nTSO0Egws6Y0RPmEQiV7huQdRLG0ngyr3HOo828ien
 E2PSrHt5JZU8MzhW+ETgrPK5zYDevLzVkbB3eaz7fshb0Sy7ALz6G+hPq
 eHZr+WtfoD9e8fS1EHQIK6FjU8E8AV+WGsjGcoKlqIm3bPmXytvSX+Fwk w==;
X-CSE-ConnectionGUID: np/lIxOiQ5euFpd5Ptq9aQ==
X-CSE-MsgGUID: zaxnJXIUSEKlOfJkNK9pPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2683552"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2683552"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2026 04:19:34 -0800
X-CSE-ConnectionGUID: pxBes8T3QAy0sHHY+oSk/w==
X-CSE-MsgGUID: +4325KAaQG2Fk89GZzcRrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7304463"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2026 04:19:31 -0800
Date: Thu, 5 Nov 2026 13:19:28 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: "Nilawar, Badal" <badal.nilawar@intel.com>
Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>,
 intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com, anshuman.gupta@intel.com,
 vinay.belgaumkar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, sk.anirban@intel.com,
 michal.wajdeczko@intel.com, aravind.iddamsetty@linux.intel.com,
 jani.nikula@linux.intel.com
Subject: Re: [PATCH v2 3/6] drm/xe/cper: Decouple RAS error class
 initialization
Message-ID: <aux0UF4B7bw1YLx5@black.igk.intel.com>
References: <20261029132609.907017-8-mallesh.koujalagi@intel.com>
 <20261029132609.907017-11-mallesh.koujalagi@intel.com>
 <4e1e2c47-7281-4ffb-8f4c-f2583d1a45f0@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4e1e2c47-7281-4ffb-8f4c-f2583d1a45f0@intel.com>
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 04, 2026 at 10:49:06PM +0530, Nilawar, Badal wrote:
> On 29-10-2026 18:56, Mallesh Koujalagi wrote:
> > Move RAS error class initialization from cper_init_intel_hdr()
> > to xe_cper_emit_counter() so the common header initialization
> > can be used for both hardware and software CPER records.
> > 
> > Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_cper.c | 9 ++++-----
> >   1 file changed, 4 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_cper.c b/drivers/gpu/drm/xe/xe_cper.c
> > index bb90030bcd2d..e802f534eb45 100644
> > --- a/drivers/gpu/drm/xe/xe_cper.c
> > +++ b/drivers/gpu/drm/xe/xe_cper.c
> > @@ -87,11 +87,10 @@ static u64 cper_timestamp_now(void)
> >   	return ts;
> >   }
> > -static void cper_init_intel_hdr(struct xe_device *xe, const struct xe_ras_error_class *counter,
> > -				u64 first_timestamp, u32 sig_id, u32 error_count,
> > +static void cper_init_intel_hdr(struct xe_device *xe, u64 first_timestamp,
> > +				u32 sig_id, u32 error_count,
> >   				struct xe_cper_intel_hdr *ihdr)
> >   {
> > -	ihdr->counter = *counter;
> >   	ihdr->validation_bits |= XE_CPER_VALID_LOCATION;
> >   	ihdr->sig_id = U32_MAX;
> > @@ -218,8 +217,8 @@ void xe_cper_emit_counter(struct xe_device *xe, int cper_sev, enum xe_sigid sigi
> >   	xe_assert(xe, is_hw_sigid(sigid));
> > -	cper_init_intel_hdr(xe, counter, response->timestamp,
> > -			    sigid, response->value, &ihdr);
> > +	ihdr.counter = *counter;
> 
> Instead of moving the error-class assignment out of cper_init_intel_hdr(), I
> suggest making the error-class union a named type.
> 
> +       /** @error_class: Counter-sourced or driver-detected error
> classification */
> +       union xe_cper_error_class {
> +               /** @counter: Counter-sourced error classification */
>                 struct xe_ras_error_class counter;
> -               /** @driver: Driver-detected (software) error classification
> */
> +               /** @driver: Driver-detected error classification */
>                 struct xe_cper_driver_error_class driver;
> -       };
> +       } error_class;
> 
> The counter and driver paths can populate their respective union members and
> pass the result to cper_init_intel_hdr(). This keeps the complete Intel
> header initialization in one place.

With that also add

	BUILD_BUG_ON(sizeof(struct xe_ras_error_class) != sizeof(struct xe_cper_driver_error_class))

somewhere, so we don't regress in the future.

Raag

> Counter path:
> 
> union xe_cper_error_class error_class = {
>     .counter = *counter,
> };
> 
> Driver path:
> 
> union xe_cper_error_class error_class = {
>     .driver = {
>         .error_type = cper_sev,
>         .error_component = component,
>         .tile = location,
>     },
> };
> 
> cper_init_intel_hdr(xe, &error_class, response->timestamp, sigid,
> response->value, &ihdr);
> 
> Thanks,
> Badal
> 
> > +	cper_init_intel_hdr(xe, response->timestamp, sigid, response->value, &ihdr);
> >   	cper_record_emit(xe, cper_sev, &INTEL_CPER_NOTIFY_GPU_ERROR, &ihdr, NULL, 0);
> >   }

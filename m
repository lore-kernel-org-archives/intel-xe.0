Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F563CD5BD5
	for <intel-xe@archiver.kernel.org>; Wed, 27 May 2026 05:44:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCFB610E236;
	Wed, 27 May 2026 05:44:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X9p4Fejs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BACE10E236
 for <intel-xe@lists.freedesktop.org>; Wed, 27 May 2026 05:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779860698; x=1811396698;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=/5Mw+tnFz94jTI4YapRJ/X46ZbVat1dKpGq0bVXnF0w=;
 b=X9p4FejsF+lgfGTk0uTZ2RaVgyMF4tYR46p6le7M2xTvApXMRQdZG8/2
 qc/eYrXTVWZKnpJpEEvBFkZ6UtHiqJgrvRvLmU5pRusruNFwhKphuBNsV
 koB8sBIoGi8H3bs35eeflQfkwbko23cDye4Z8FgYDPsFu79bSH7lwtmN3
 Yu9AF//g0/aWSg6wX4c5UfKvJLHMXMv/FAm70hNla2S2UZFflJ6zwIBpQ
 sHU8kAUk/7NB+gmazOt7EbMqOg/5BzjZgmKbAlek6BZK6IGkfEiTr6sZ9
 05G+Vs6sZNsEtK+pWX8oghNjHT3HCwbGm95sCCXmFXxkA9LuuWADe2+nN g==;
X-CSE-ConnectionGUID: rnXdIzHfTEycqsyQOZYrXA==
X-CSE-MsgGUID: /2nCIW8yQluSDUeOz0CwMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="84307582"
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; d="scan'208";a="84307582"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 22:44:58 -0700
X-CSE-ConnectionGUID: q2yXa9TcSXqfZ7QeehuTrQ==
X-CSE-MsgGUID: zwHDbgHYRT6L9T0bFpJ6eQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; d="scan'208";a="241307026"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 22:44:53 -0700
Date: Wed, 27 May 2026 07:44:51 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: intel-xe@lists.freedesktop.org, matthew.brost@intel.com,
 rodrigo.vivi@intel.com, thomas.hellstrom@linux.intel.com,
 riana.tauro@intel.com, michal.wajdeczko@intel.com,
 matthew.d.roper@intel.com, michal.winiarski@intel.com,
 matthew.auld@intel.com, dev@lankhorst.se, jani.nikula@intel.com,
 lukasz.laguna@intel.com, zhanjun.dong@intel.com, lukas@wunner.de,
 badal.nilawar@intel.com
Subject: Re: [PATCH v7 1/8] drm/xe/uc_fw: Allow re-initializing firmware
Message-ID: <ahaE06LrK52qE-Yp@black.igk.intel.com>
References: <20260516093131.27442-1-raag.jadav@intel.com>
 <20260516093131.27442-2-raag.jadav@intel.com>
 <de56fd4c-8e41-43de-930d-9115b14356c1@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <de56fd4c-8e41-43de-930d-9115b14356c1@intel.com>
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

On Tue, May 26, 2026 at 05:04:54PM -0700, Daniele Ceraolo Spurio wrote:
> On 5/16/2026 2:31 AM, Raag Jadav wrote:
> > In preparation of usecases which require re-initializing firmware without
> > reloading the driver, introduce xe_uc_fw_reinit(). The uC firmware bo
> > already exists but since it's contents are on VRAM, they are lost on PCIe
> > FLR. Copy the firmware back to it's bo and mark it as loadable as part of
> > re-initialization.
> > 
> > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > Tested-by: Lukasz Laguna <lukasz.laguna@intel.com>
> > ---
> > v2: Add kernel doc (Matthew Brost)
> > v6: Skip uC firmware selection during re-initialization (Daniele)
> > ---
> >   drivers/gpu/drm/xe/xe_uc_fw.c | 56 +++++++++++++++++++++++++++++++++++
> >   drivers/gpu/drm/xe/xe_uc_fw.h |  1 +
> >   2 files changed, 57 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
> > index df2aa196f6f9..c23c35dc2a4d 100644
> > --- a/drivers/gpu/drm/xe/xe_uc_fw.c
> > +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
> > @@ -834,6 +834,14 @@ static int uc_fw_copy(struct xe_uc_fw *uc_fw, const void *data, size_t size, u32
> >   	return err;
> >   }
> > +static void uc_fw_reinit(struct xe_uc_fw *uc_fw, const void *data)
> > +{
> > +	struct xe_device *xe = uc_fw_to_xe(uc_fw);
> > +
> > +	xe_map_memcpy_to(xe, &uc_fw->bo->vmap, 0, data, uc_fw->size);
> > +	xe_uc_fw_change_status(uc_fw, XE_UC_FIRMWARE_LOADABLE);
> > +}
> > +
> >   int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
> >   {
> >   	const struct firmware *fw = NULL;
> > @@ -857,6 +865,54 @@ int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
> >   }
> >   ALLOW_ERROR_INJECTION(xe_uc_fw_init, ERRNO); /* See xe_pci_probe() */
> > +/**
> > + * xe_uc_fw_reinit() - Re-initialize uC firmware into its bo
> > + * @uc_fw: uC firmware
> > + *
> > + * Returns: 0 on success, negative error code otherwise.
> > + */
> > +int xe_uc_fw_reinit(struct xe_uc_fw *uc_fw)
> > +{
> > +	struct xe_device *xe = uc_fw_to_xe(uc_fw);
> > +	struct xe_uc_fw_version new_fw, old_fw;
> > +	const struct firmware *fw = NULL;
> > +	int err;
> > +
> > +	/* We shouldn't be here for the firmware which wasn't loaded */
> > +	xe_assert(xe, xe_uc_fw_is_available(uc_fw));
> > +
> > +	old_fw = uc_fw->versions.found[XE_UC_FW_VER_RELEASE];
> > +
> > +	err = firmware_request_nowarn(&fw, uc_fw->path, xe->drm.dev);
> > +	if (err)
> > +		goto fail;
> > +
> > +	err = parse_headers(uc_fw, fw);
> > +	if (err)
> > +		goto fail;
> > +
> > +	new_fw = uc_fw->versions.found[XE_UC_FW_VER_RELEASE];
> > +	if (new_fw.branch != old_fw.branch || new_fw.major != old_fw.major ||
> > +	    new_fw.minor != old_fw.minor || new_fw.patch != old_fw.patch ||
> > +	    new_fw.build != old_fw.build || uc_fw->size != fw->size) {
> 
> Since we want an exact match, instead of comparing each version field
> individually we could use
> 
>  memcmp(&new_fw, &old_fw, sizeof(new_fw))

Sure.

> > +		drm_err(&xe->drm, "%s firmware mismatch on %s",
> > +			xe_uc_fw_type_repr(uc_fw->type), uc_fw->path);
> > +
> > +		/*
> > +		 * parse_headers() updates version details, so restore original
> > +		 * version before bailing.
> > +		 */
> > +		uc_fw->versions.found[XE_UC_FW_VER_RELEASE] = old_fw;
> 
> parse_headers updates more than just the version, so IMO better to
> save/restore the whole xe_uc_fw struct.

Makes sense.

> > +		err = -ENOEXEC;
> > +		goto fail;
> > +	}
> > +
> > +	uc_fw_reinit(uc_fw, fw->data);
> > +fail:
> > +	uc_fw_release(fw);
> 
> What state is the uc_fw struct left in if we exit here? Do we care, and if
> so should we explicitly set it to some error state? might need a new state
> for it.

We'd want to make sure we don't reinit the fw which wasn't available earlier,
so perhaps just reuse XE_UC_FIRMWARE_INIT_FAIL?

Raag

> > +	return err;
> > +}
> > +
> >   static u32 uc_fw_ggtt_offset(struct xe_uc_fw *uc_fw)
> >   {
> >   	return xe_bo_ggtt_addr(uc_fw->bo);
> > diff --git a/drivers/gpu/drm/xe/xe_uc_fw.h b/drivers/gpu/drm/xe/xe_uc_fw.h
> > index bb281b72a677..9f469bf07d66 100644
> > --- a/drivers/gpu/drm/xe/xe_uc_fw.h
> > +++ b/drivers/gpu/drm/xe/xe_uc_fw.h
> > @@ -15,6 +15,7 @@
> >   struct drm_printer;
> >   int xe_uc_fw_init(struct xe_uc_fw *uc_fw);
> > +int xe_uc_fw_reinit(struct xe_uc_fw *uc_fw);
> >   size_t xe_uc_fw_copy_rsa(struct xe_uc_fw *uc_fw, void *dst, u32 max_len);
> >   int xe_uc_fw_upload(struct xe_uc_fw *uc_fw, u32 offset, u32 dma_flags);
> >   int xe_uc_fw_check_version_requirements(struct xe_uc_fw *uc_fw);
> 

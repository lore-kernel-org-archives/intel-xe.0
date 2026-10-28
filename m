Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EEEA606A326
	for <intel-xe@archiver.kernel.org>; Wed, 28 Oct 2026 16:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Jxs3g49K
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1330910E6A7;
	Wed, 28 Oct 2026 16:53:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08DAC10E6AC
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Oct 2026 16:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793206385; x=1824742385;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=8kOC5ao5C9Q6Ug95FASRO3nXCj8/8r1bweGxXqoOQG0=;
 b=Jxs3g49K/3Dho7QhPhYboDMUHVcjUPHk1Jfq5vGykBcbgLCEJtzk44+k
 3v/bsXOkocaXAqCySrVxhhJDp+Gcq7p3WT5He8xVT0KFokL+G0C4oYsEK
 T68HyHuLtz5w+FjC4fYwIzrnceb9e6RlI2VmDeAD1BtZBYx7A95re7pRQ
 pNZ1D8cP6NqZXQFrIn5yp8RT+4EgFJrrlfcROyc+jlGpN95OvFiTrM3rq
 Mnn4+byFHD0m8n11Y4YgT0m4lmpO6GSfubdcszmPA9CdWWr+W1XON9iiZ
 9y/onoojDOGZgvNw2mImY5PLiT3W8NWTH9+dPojmSbb77zQfWQ6941wEN w==;
X-CSE-ConnectionGUID: z/LyPKUTSjO24QLOu5qKWA==
X-CSE-MsgGUID: Sd14AsVwQt6D6otJ2/VaoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1839000"
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="1839000"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 09:53:05 -0700
X-CSE-ConnectionGUID: Rw1pkPoUQJyXMw1Ec5X0Bw==
X-CSE-MsgGUID: g2gLo8X7R8qUNLhG9FYpuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="4748938"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 09:53:01 -0700
Date: Wed, 28 Oct 2026 17:52:59 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Badal Nilawar <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, daniele.ceraolospurio@intel.com,
 riana.tauro@intel.com, mallesh.koujalagi@intel.com,
 aravind.iddamsetty@intel.com, himal.prasad.ghimiray@intel.com,
 arvind.yadav@intel.com, syed.abdul.muqthyar.ahmed@intel.com,
 nitin.r.gote@intel.com
Subject: Re: [PATCH v6 04/10] drm/xe/cper: Construct CPER record for hardware
 errors
Message-ID: <auIoa-LxjETpt0LR@black.igk.intel.com>
References: <20261028095723.734387-12-badal.nilawar@intel.com>
 <20261028095723.734387-16-badal.nilawar@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261028095723.734387-16-badal.nilawar@intel.com>
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Oct 28, 2026 at 03:27:28PM +0530, Badal Nilawar wrote:
> Assemble the CPER record header, section descriptor and the Intel
> error section for Intel GPU hardware errors.

...

> +static void cper_init_record_hdr(struct xe_device *xe, u8 severity,
> +				 const guid_t *notification_type,
> +				 struct cper_record_header *rhdr,
> +				 u32 total_len)
> +{
> +	const guid_t *device_guid;
> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);

Reverse xmas order please!

> +	/* Assemble the CPER record header (UEFI Appendix N.2.1) */
> +	memcpy(rhdr->signature, CPER_SIG_RECORD, CPER_SIG_SIZE);
> +	rhdr->revision          = CPER_RECORD_REV;
> +	rhdr->signature_end     = CPER_SIG_END;
> +	rhdr->section_count     = 1;
> +	rhdr->error_severity    = severity;
> +	rhdr->validation_bits   = CPER_VALID_TIMESTAMP;
> +	rhdr->record_length     = total_len;
> +	rhdr->timestamp         = cper_timestamp_now();
> +	rhdr->creator_id        = INTEL_CPER_CREATOR_XEKMD;
> +	rhdr->notification_type = *notification_type;
> +	rhdr->record_id         = cper_next_record_id();

Blank line here.

> +	device_guid = lookup_device_guid(pdev);
> +	if (device_guid) {
> +		rhdr->platform_id      = *device_guid;
> +		rhdr->validation_bits |= CPER_VALID_PLATFORM_ID;
> +	} else {
> +		xe_printk(xe, warn_once, "CPER: no platform GUID for device %04x\n",
> +			  pdev->device);

Move this to lookup_device_guid() before returning NULL.

> +	}
> +}
> +
> +static void cper_init_section_desc(struct xe_device *xe, u8 severity,
> +				   struct cper_section_descriptor *sdesc,
> +				   u32 einfo_len)
> +{
> +	sdesc->section_offset   = sizeof(struct cper_record_header) +
> +				  sizeof(struct cper_section_descriptor);
> +	sdesc->section_length   = sizeof(struct xe_cper_intel_hdr) + einfo_len;
> +	sdesc->revision         = CPER_SEC_REV;
> +	sdesc->validation_bits  = 0;
> +	sdesc->section_type     = INTEL_CPER_SECTION_ACCEL_GENERIC;
> +	sdesc->section_severity = severity;

Blank line here.

> +	if (xe->info.has_device_uid) {
> +		memcpy(&sdesc->fru_id, &xe->device_uid, sizeof(xe->device_uid));
> +		sdesc->validation_bits |= CPER_SEC_VALID_FRU_ID;
> +	}
> +}
> +
> +static void cper_record_emit(struct xe_device *xe, u8 severity,
> +			     const guid_t *notification_type,
> +			     const struct xe_cper_intel_hdr *ihdr,
> +			     const void *einfo, u32 einfo_len)
> +{
> +	struct cper_section_descriptor *sdesc;
> +	struct cper_record_header *rhdr;
> +	struct xe_cper_nonstd_record *rec;
> +	u32 total_len;

Reverse xmas order please!

And with that

Reviewed-by: Raag Jadav <raag.jadav@intel.com>

> +	total_len = sizeof(struct xe_cper_nonstd_record) + einfo_len;
> +	rec = kzalloc(total_len, GFP_KERNEL);
> +	if (!rec)
> +		return;
> +
> +	rhdr = &rec->record_hdr;
> +	sdesc = &rec->section_desc;
> +
> +	/* Assemble the CPER record header (UEFI Appendix N.2.1) */
> +	cper_init_record_hdr(xe, severity, notification_type, rhdr, total_len);
> +
> +	/* Assemble the section descriptor (UEFI Appendix N.2.2) */
> +	cper_init_section_desc(xe, severity, sdesc, einfo_len);
> +
> +	/* Copy the Intel-specific section header */
> +	rec->intel_hdr = *ihdr;
> +
> +	/* Append optional variable-length error info */
> +	if (einfo && einfo_len)
> +		memcpy((u8 *)rec + sizeof(*rec), einfo, einfo_len);
> +
> +	/* TODO: Emit trace event */
> +
> +	kfree(rec);
> +}

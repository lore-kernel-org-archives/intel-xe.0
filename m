Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D25C4CC6B1D
	for <intel-xe@archiver.kernel.org>; Wed, 14 Oct 2026 10:30:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F02810E538;
	Wed, 14 Oct 2026 10:30:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F11D10E582
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Oct 2026 10:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791973829; x=1823509829;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=SR88bPJ7o1Ae30A+UGD4jGGUlMA7SNv9bk/6ItSDLB0=;
 b=fMWOfTUuubRqCWKgS3/qzdobdxPEslzI97td+4xwseYuBA5/JOaYqQaL
 a2HDXkRzEkdTdY0YvD5qaI3Yv82hkKeOs1LvhDZY0OEClfL9eP/v+z2y9
 0YltxIn+yOurhmqDhKXXe/JRUokDz3qJ6RY0sltcaApnGzP6bpBdVj61f
 zzaG/GcMkkUKTg2o1N9j+Jtd/OHndHGkPvhlHYm9Lj9+5PcmaS5EEvnJr
 NauKEsT+uYf1rLENSmkmdFno/0nHEgY+YcDNN38B4cAZkOz2G5fB+m31c
 eZZVYCQTV59ba7gDDQdqtPpMlbJ/Kr+YLFMTqlonJwRTVw2eiox/xY5za w==;
X-CSE-ConnectionGUID: 6yOj95MNQDu0L+u0TvVWmQ==
X-CSE-MsgGUID: qb9v00YZSQyIYoKfjlCdsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="708071"
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="708071"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 03:30:29 -0700
X-CSE-ConnectionGUID: qZ0mt1geTXmyV601edLfpQ==
X-CSE-MsgGUID: RC2kvgRPRzii/5cSSJbz7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="3151581"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa012.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 03:30:26 -0700
Date: Wed, 14 Oct 2026 12:30:23 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Badal Nilawar <badal.nilawar@intel.com>, matthew.d.roper@intel.com
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, daniele.ceraolospurio@intel.com,
 riana.tauro@intel.com, mallesh.koujalagi@intel.com,
 aravind.iddamsetty@intel.com, himal.prasad.ghimiray@intel.com,
 arvind.yadav@intel.com, syed.abdul.muqthyar.ahmed@intel.com,
 nitin.r.gote@intel.com, pravalika.gurram@intel.com
Subject: Re: [PATCH v4 04/12] drm/xe/cper: Construct CPER record for hardware
 errors
Message-ID: <as9Zvxl3-Lx4H6En@black.igk.intel.com>
References: <20261009104602.1075405-14-badal.nilawar@intel.com>
 <20261009104602.1075405-18-badal.nilawar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261009104602.1075405-18-badal.nilawar@intel.com>
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

Cc: Matt for platform stuff

On Fri, Oct 09, 2026 at 04:16:07PM +0530, Badal Nilawar wrote:
> Assemble the CPER record header, section descriptor and the Intel
> error section for Intel GPU hardware errors. Emitting the record is
> added in a follow-up patch.

Commit message should describe what _this_ patch does,
not _next_.

> Assisted-by: Copilot:Claude-Opus-5.5
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
> v4:
>  - Split from "drm/xe/cper: Prepare CPER record" (Raag)
>  - Use xe->device_uid for FRU ID
>  - Add platform IDs for all CRI PCI device IDs
> v2:
>  - Encode cper_record_header timestamp in BCD format (sashiko)
> ---
>  drivers/gpu/drm/xe/xe_cper.c       | 122 +++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_cper_types.h |  53 +++++++++++++
>  2 files changed, 175 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_cper.c b/drivers/gpu/drm/xe/xe_cper.c
> index e7cae449b349..1000c78b41e9 100644
> --- a/drivers/gpu/drm/xe/xe_cper.c
> +++ b/drivers/gpu/drm/xe/xe_cper.c
> @@ -3,10 +3,14 @@
>   * Copyright © 2026 Intel Corporation
>   */
>  
> +#include <linux/bcd.h>
>  #include <linux/err.h>
>  #include <linux/kernel.h>
>  #include <linux/minmax.h>
>  #include <linux/pci.h>
> +#include <linux/slab.h>
> +#include <linux/time.h>
> +#include <linux/timekeeping.h>
>  
>  #include "xe_cper.h"
>  #include "xe_cper_types.h"
> @@ -20,6 +24,60 @@ static bool is_hw_sigid(enum xe_sigid sigid)
>  	return in_range(sigid, INTEL_SIGID_GPU_XE_HARDWARE_START, INTEL_SIGID_BATCH);
>  }
>  
> +static const struct xe_platform_id_entry xe_platform_ids[] = {
> +	/* 0x674C  platform/8086:674c */
> +	{ 0x674C, GUID_INIT(0x9046afe5, 0x9041, 0x5124,
> +			    0x86, 0x14, 0x92, 0x55, 0x0d, 0x9e, 0x9d, 0xa6) },
> +	/* 0x674D  platform/8086:674d */
> +	{ 0x674D, GUID_INIT(0xf95911b8, 0x6564, 0x5905,
> +			    0xa6, 0xa7, 0xb9, 0xbf, 0x54, 0xab, 0x6c, 0x27) },
> +	/* 0x674E  platform/8086:674e */
> +	{ 0x674E, GUID_INIT(0xb8d24106, 0x0108, 0x59f1,
> +			    0x8f, 0xfc, 0x9f, 0xc4, 0xa9, 0xc9, 0xb7, 0xb0) },
> +	/* 0x674F  platform/8086:674f */
> +	{ 0x674F, GUID_INIT(0xdd8dd88e, 0xef2f, 0x59b1,
> +			    0x99, 0x15, 0xdb, 0x6f, 0x1d, 0xc9, 0xb4, 0x5d) },
> +	/* 0x6750  platform/8086:6750 */
> +	{ 0x6750, GUID_INIT(0x1dd66c44, 0x87d5, 0x524a,
> +			    0xad, 0x6e, 0xfc, 0x18, 0x9d, 0x42, 0x6f, 0x1a) },
> +	/* 0x6751  platform/8086:6751 */
> +	{ 0x6751, GUID_INIT(0x17d0dd04, 0x2fad, 0x5400,
> +			    0x99, 0xc8, 0x9b, 0x45, 0x51, 0x3b, 0x67, 0xe3) },
> +};

This is unrelated to cper and shouldn't be here. I'll rely on Matt's
input on how to deal with these.

> +static const guid_t *lookup_platform_id(const struct pci_dev *pdev)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(xe_platform_ids); i++)
> +		if (xe_platform_ids[i].device_id == pdev->device)
> +			return &xe_platform_ids[i].platform_id;
> +	return NULL;
> +}
> +
> +static u64 cper_timestamp_now(void)
> +{
> +	struct tm tm;
> +	u64 ts = 0;
> +	u8 *p = (u8 *)&ts;
> +	int year;
> +
> +	time64_to_tm(ktime_get_real_seconds(), 0, &tm);
> +
> +	year = tm.tm_year + 1900;
> +
> +	p[0] = bin2bcd(tm.tm_sec);
> +	p[1] = bin2bcd(tm.tm_min);
> +	p[2] = bin2bcd(tm.tm_hour);
> +	p[3] = 0x1; /* precise time */
> +	p[4] = bin2bcd(tm.tm_mday);
> +	p[5] = bin2bcd(tm.tm_mon + 1);
> +	p[6] = bin2bcd(year % 100);
> +	p[7] = bin2bcd(year / 100);
> +
> +	return ts;
> +}
> +
>  static void xe_cper_init_intel_err_hdr(struct xe_device *xe,
>  				       const struct xe_ras_error_class *error_class,
>  				       u64 first_timestamp, u32 sig_id, u32 error_count,
> @@ -57,6 +115,67 @@ static void xe_cper_init_intel_err_hdr(struct xe_device *xe,
>  	/* TODO: fill fw_id and set XE_CPER_VALID_FW_ID */
>  }
>  
> +static void xe_cper_record_emit(struct xe_device *xe, u8 severity,
> +				const guid_t *notification_type,
> +				const struct xe_cper_sec_intel_err_hdr *ihdr,
> +				const void *einfo, u32 einfo_len)
> +{
> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> +	const guid_t *platform_id = lookup_platform_id(pdev);

Delay the assignments where possible, preferably after kzalloc().

> +	u32 total_len = sizeof(struct xe_cper_nonstd_record) + einfo_len;
> +	struct cper_section_descriptor *sdesc;
> +	struct cper_record_header *rhdr;
> +	struct xe_cper_nonstd_record *rec;

Reverse xmas tree order please!

> +	rec = kzalloc(total_len, GFP_KERNEL);
> +	if (!rec)
> +		return;
> +
> +	rhdr = &rec->record_hdr;
> +	sdesc = &rec->section_desc;
> +
> +	/* Assemble the CPER record header (UEFI Appendix N.2.1) */
> +	memcpy(rhdr->signature, CPER_SIG_RECORD, CPER_SIG_SIZE);
> +	rhdr->revision          = CPER_RECORD_REV;
> +	rhdr->signature_end     = CPER_SIG_END;
> +	rhdr->section_count     = 1;
> +	rhdr->error_severity    = severity;
> +	rhdr->validation_bits   = CPER_VALID_TIMESTAMP;
> +	rhdr->record_length     = total_len;
> +	rhdr->timestamp         = cper_timestamp_now();
> +	if (platform_id) {
> +		rhdr->platform_id      = *platform_id;
> +		rhdr->validation_bits |= CPER_VALID_PLATFORM_ID;
> +	}
> +	rhdr->creator_id        = INTEL_CPER_CREATOR_XEKMD;
> +	rhdr->notification_type = *notification_type;
> +	rhdr->record_id         = cper_next_record_id();

This looks like a small function that prepares rhdr.

> +	/* Assemble the section descriptor (UEFI Appendix N.2.2) */
> +	sdesc->section_offset   = sizeof(struct cper_record_header) +
> +				  sizeof(struct cper_section_descriptor);
> +	sdesc->section_length   = sizeof(struct xe_cper_sec_intel_err_hdr) + einfo_len;
> +	sdesc->revision         = CPER_SEC_REV;
> +	sdesc->validation_bits  = 0;
> +	sdesc->section_type     = INTEL_CPER_SECTION_ACCEL_GENERIC;
> +	if (xe->info.has_device_uid) {
> +		memcpy(&sdesc->fru_id, &xe->device_uid, sizeof(xe->device_uid));
> +		sdesc->validation_bits |= CPER_SEC_VALID_FRU_ID;
> +	}
> +	sdesc->section_severity = severity;

Ditto for sdesc.

Raag

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
> +
>  static void xe_cper_emit_hw_err(struct xe_device *xe, int cper_sev, enum xe_sigid sigid,
>  				const struct xe_ras_error_class *error_class)
>  {
> @@ -74,6 +193,9 @@ static void xe_cper_emit_hw_err(struct xe_device *xe, int cper_sev, enum xe_sigi
>  
>  	xe_cper_init_intel_err_hdr(xe, error_class, local_resp.timestamp,
>  				   sigid, local_resp.value, &ihdr);
> +
> +	xe_cper_record_emit(xe, cper_sev, &INTEL_CPER_NOTIFY_GPU_ERROR,
> +			    &ihdr, NULL, 0);
>  }
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_cper_types.h b/drivers/gpu/drm/xe/xe_cper_types.h
> index 74307e7f78a2..7612518c9d47 100644
> --- a/drivers/gpu/drm/xe/xe_cper_types.h
> +++ b/drivers/gpu/drm/xe/xe_cper_types.h
> @@ -6,7 +6,9 @@
>  #ifndef _XE_CPER_TYPES_H_
>  #define _XE_CPER_TYPES_H_
>  
> +#include <linux/cper.h>
>  #include <linux/types.h>
> +#include <linux/uuid.h>
>  
>  /*
>   * Validation bits definition for validation_bits in struct
> @@ -20,6 +22,28 @@
>  #define XE_CPER_VALID_DRV_VERSION	0x0010
>  #define XE_CPER_VALID_FW_ID		0x0020
>  
> +/*
> + * Intel CPER GUID Namespace — RFC 9562 UUIDv5 (SHA-1 name-based)
> + *
> + * All values below are generated deterministically by uuid generator.
> + * Do not hand-edit the byte values.
> + */
> +
> +/* Creator IDs */
> +#define INTEL_CPER_CREATOR_XEKMD \
> +	GUID_INIT(0x9a42070f, 0xdf9d, 0x555e, \
> +		  0xba, 0x02, 0x7c, 0xbc, 0x86, 0x3d, 0x37, 0x1c)
> +
> +/* Notification Types */
> +#define INTEL_CPER_NOTIFY_GPU_ERROR \
> +	GUID_INIT(0x4ae12aef, 0x8745, 0x5fc7, \
> +		  0xb9, 0x96, 0x71, 0xee, 0xbb, 0x51, 0xf2, 0x23)
> +
> +/* Section Types */
> +#define INTEL_CPER_SECTION_ACCEL_GENERIC \
> +	GUID_INIT(0xea9d8f84, 0x4258, 0x5227, \
> +		  0x80, 0x28, 0xb9, 0xb1, 0x3e, 0x6d, 0x58, 0xb0)
> +
>  #pragma pack(push, 1)
>  
>  /**
> @@ -67,6 +91,35 @@ struct xe_cper_sec_intel_err_hdr {
>  	u8 reserved[5];
>  };
>  
> +/**
> + * struct xe_cper_nonstd_record - Intel GPU CPER record
> + *
> + * Contains the standard CPER record header, section descriptor, and the
> + * Intel error section header.
> + */
> +struct xe_cper_nonstd_record {
> +	/** @record_hdr: Standard CPER record header (UEFI Appendix N.2.1) */
> +	struct cper_record_header record_hdr;
> +	/** @section_desc: CPER section descriptor */
> +	struct cper_section_descriptor section_desc;
> +	/** @intel_hdr: Intel-specific error section header */
> +	struct xe_cper_sec_intel_err_hdr intel_hdr;
> +};
> +
>  #pragma pack(pop)
>  
> +/**
> + * struct xe_platform_id_entry - Mapping from PCI device ID to CPER platform GUID
> + *
> + * Used to resolve the platform_id field in a CPER section descriptor.
> + * GUIDs are UUIDv5 (RFC 9562, SHA-1) derived from the Intel CPER namespace
> + * with name string "platform/8086:<dev_id_hex_lower>".
> + */
> +struct xe_platform_id_entry {
> +	/** @device_id: PCI device ID */
> +	u16       device_id;
> +	/** @platform_id: Corresponding UUIDv5 platform GUID */
> +	guid_t    platform_id;
> +};
> +
>  #endif
> -- 
> 2.54.0
> 

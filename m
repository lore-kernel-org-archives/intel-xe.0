Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E2EEC79F82
	for <intel-xe@archiver.kernel.org>; Tue,  8 Sep 2026 10:18:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D9A310EAF3;
	Tue,  8 Sep 2026 10:18:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qd7CZN+r";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D716B10EAF3
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Sep 2026 10:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788862691; x=1820398691;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=7GrSAYDLlmYcLCL34NTvetVxG5yMQdzjvAnlone9mLU=;
 b=Qd7CZN+rEKBI+ET3KMQu0Sw4GCjaQjo4liSwZJhdzU9YLDZOnLyaqNb4
 d6u1I9k1YN0ZaFuULmLRAdvjGxfsVfxyMKoX3Vyi0sc/AQ+BuLr+SsdC0
 xS6E90SQ3I+V6v6zoahm3RPj8EKo2iwJOPFCqmr/BCYR0adcBPhD3fuFl
 OpoagjxDM/3MMProkddo1K9a+eBgsoFzygP2TQdb3/PncP05FnuSIwmIH
 062CTsgcpsYKvH+jctiaqQcrS81E+VgoavHFa2HfEfdOQB8IhCEKk4zfb
 24Griz5Vom3Qp4KrKqTtZ8MEC0wyzf/U0Wz5OZYncLojuRhohnPKp72ZK g==;
X-CSE-ConnectionGUID: LiPRuOEXQtyRbXVXroLMAQ==
X-CSE-MsgGUID: k5kVvzo6RRWk9S7b+pcJpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="93124385"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="93124385"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 03:18:11 -0700
X-CSE-ConnectionGUID: jBVdw0ofRB+zCRlexXMkFA==
X-CSE-MsgGUID: hTcNakcoQ8+JQ0M0KlIjnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="271466140"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 03:18:08 -0700
Date: Tue, 8 Sep 2026 12:18:05 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Badal Nilawar <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, daniele.ceraolospurio@intel.com,
 riana.tauro@intel.com, mallesh.koujalagi@intel.com,
 aravind.iddamsetty@intel.com, michal.wajdeczko@intel.com,
 himal.prasad.ghimiray@intel.com, arvind.yadav@intel.com,
 syed.abdul.muqthyar.ahmed@intel.com, nitin.r.gote@intel.com
Subject: Re: [PATCH v3 03/12] drm/xe/cper: Add Intel specific CPER structures
Message-ID: <ap_g3dosjbQO5z3R@black.igk.intel.com>
References: <20260906172604.2215987-14-badal.nilawar@intel.com>
 <20260906172604.2215987-17-badal.nilawar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260906172604.2215987-17-badal.nilawar@intel.com>
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

On Sun, Sep 06, 2026 at 10:56:08PM +0530, Badal Nilawar wrote:
> Define Intel-specific data structures and GUIDs needed to build
> Intel GPU CPER recoreds

No standalone structs please! These need to be introduced in the patch
that use them.

Raag

> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
> v2: Fixed sashiko warning about bit fields usage
> ---
>  drivers/gpu/drm/xe/xe_cper_types.h | 179 +++++++++++++++++++++++++++++
>  1 file changed, 179 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_cper_types.h
> 
> diff --git a/drivers/gpu/drm/xe/xe_cper_types.h b/drivers/gpu/drm/xe/xe_cper_types.h
> new file mode 100644
> index 000000000000..b81b70501e0e
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_cper_types.h
> @@ -0,0 +1,179 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef _XE_CPER_TYPES_H_
> +#define _XE_CPER_TYPES_H_
> +
> +#include <linux/cper.h>
> +#include <linux/types.h>
> +#include <linux/uuid.h>
> +
> +/*
> + * Validation bits definition for validation_bits in struct
> + * xe_cper_sec_intel_err_hdr. When set, corresponding fields in header
> + * contains valid data
> + */
> +#define XE_CPER_VALID_LOCATION		0x0001
> +#define XE_CPER_VALID_FIRST_TIMESTAMP	0x0002
> +#define XE_CPER_VALID_SIG_ID		0x0004
> +#define XE_CPER_VALID_PCI_BDF		0x0008
> +#define XE_CPER_VALID_DRV_VERSION	0x0010
> +#define XE_CPER_VALID_FW_ID		0x0020
> +
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
> +#define INTEL_CPER_CREATOR_AMC \
> +	GUID_INIT(0x215803da, 0xfc7a, 0x5925, \
> +		  0xb7, 0x8b, 0x1f, 0xc1, 0x19, 0x61, 0x58, 0xd1)
> +
> +/* Notification Types */
> +#define INTEL_CPER_NOTIFY_GPU_ERROR \
> +	GUID_INIT(0x4ae12aef, 0x8745, 0x5fc7, \
> +		  0xb9, 0x96, 0x71, 0xee, 0xbb, 0x51, 0xf2, 0x23)
> +
> +#define INTEL_CPER_NOTIFY_DRV_ERROR \
> +	GUID_INIT(0xcef7e934, 0x51e7, 0x535f, \
> +		  0xa6, 0x78, 0x5a, 0x4c, 0xcc, 0xb6, 0x96, 0x09)
> +
> +/* Section Types */
> +#define INTEL_CPER_SECTION_ACCEL_GENERIC \
> +	GUID_INIT(0xea9d8f84, 0x4258, 0x5227, \
> +		  0x80, 0x28, 0xb9, 0xb1, 0x3e, 0x6d, 0x58, 0xb0)
> +
> +#pragma pack(push, 1)
> +
> +/**
> + * struct xe_cper_sec_intel_err_hdr - Intel-specific CPER error section header
> + *
> + * Fixed-size header for the Intel GPU error section of a CPER record.
> + * All multi-byte fields are little-endian; the structure is packed.
> + */
> +struct xe_cper_sec_intel_err_hdr {
> +	/** @error_class: Error classification (type, component, location, cause) */
> +	union {
> +		struct {
> +			/** @error_class.error_type: RAS error severity */
> +			u8  error_type;
> +			/** @error_class.error_component: IP block that raised the error */
> +			u8  error_component;
> +			/** @error_class.tile: Tile number */
> +			u8  tile;
> +			/** @error_class.instance: Instance within the tile */
> +			u32 instance;
> +			/** @error_class.cause: Error cause code */
> +			u32 cause;
> +			/** @error_class.reserved: Reserved, must be zero */
> +			u8  reserved;
> +		} error_class;
> +		/** @class: Raw byte view of the error class */
> +		u8 class[12];
> +	};
> +	/** @first_timestamp: Timestamp of the first occurrence of this error class */
> +	u64 first_timestamp;
> +	/** @sig_id: Aggregated error class SIG ID; set to U32_MAX if unknown */
> +	u32 sig_id;
> +	/** @error_count: Number of times this error has been observed */
> +	u32 error_count;
> +	/** @validation_bits: Raw u16 view of all valid bits */
> +	u16 validation_bits;
> +	/** @pci_bdf: PCI location string, format "DDDD:bb:dd.f" */
> +	char pci_bdf[16];
> +	/** @drv_version: Driver source version string (THIS_MODULE->srcversion) */
> +	char drv_version[25];
> +	/** @fw_id: Firmware version string (GFSP+PCODE+CSC+GUC or MNG+NUC+RAS+GUC) */
> +	char fw_id[256];
> +	/** @reserved: Reserved for future use, must be zero */
> +	u8 reserved[5];
> +};
> +
> +/**
> + * struct xe_cper_sec_intel_error_info - Variable-length Intel GPU error payload
> + *
> + * Appended after &xe_cper_sec_intel_err_hdr when detailed per-event data
> + * is available. The @event_queue flexible array holds @event_queue_count
> + * packed &xe_intel_priv_event_entry records.
> + */
> +struct xe_cper_sec_intel_error_info {
> +	/** @error_class: Error classification (mirrors the header error_class) */
> +	union {
> +		struct {
> +			u8  error_type;
> +			u8  error_component;
> +			u8  tile;
> +			u32 instance;
> +			u32 cause;
> +			u8  reserved;
> +		} error_class;
> +		/** @class: Raw byte view of the error class */
> +		u8 class[12];
> +	};
> +	/** @error_count: Total number of errors recorded */
> +	u32 error_count;
> +	/** @event_queue_length: Total byte size of the @event_queue array */
> +	u32 event_queue_length;
> +	/** @event_queue_count: Number of entries in @event_queue */
> +	u32 event_queue_count;
> +	/** @event_queue: Packed array of &xe_intel_priv_event_entry records */
> +	u8 event_queue[];
> +};
> +
> +/**
> + * struct xe_intel_priv_event_entry - Single error event in the event queue
> + *
> + * Each entry is variable-length; @entry_length gives the byte size of
> + * @metadata only (not including @entry_length or @timestamp).
> + */
> +struct xe_intel_priv_event_entry {
> +	/** @entry_length: Byte length of the @metadata payload */
> +	u32 entry_length;
> +	/** @timestamp: Hardware timestamp of this event */
> +	u64 timestamp;
> +	/** @metadata: Event-specific payload bytes */
> +	u8  metadata[];
> +};
> +
> +/**
> + * struct xe_cper_nonstd_record - Fixed-size portion of an Intel GPU CPER record
> + *
> + * Contains the standard CPER record header, section descriptor, and the
> + * Intel error section header. A &xe_cper_sec_intel_error_info payload
> + * (with its flexible @event_queue array) is appended dynamically.
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
> +#pragma pack(pop)
> +
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
> +#endif
> -- 
> 2.54.0
> 

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB7FCCC6B33
	for <intel-xe@archiver.kernel.org>; Thu, 15 Oct 2026 09:46:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F00310E247;
	Thu, 15 Oct 2026 09:46:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00DC4112282
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Oct 2026 09:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792057558; x=1823593558;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=W29oPGDGfFR4guBQpgOoUnUMS39Ytynog1JO+e1BpoQ=;
 b=Uv6cWQ36L0SQsc1OQOO1YNW9HFu9RsHUM5CbmcsKEF0B0MX94n9/XZip
 ygvmdQQQ8AcDjOTfPBN4TTD49PgiMo4KtvNPMy4NXh3d8sHjIv7eiFLIR
 Qt+TNKj1Z2i2vhNn0NU3lBn4Z1fLCmQ3gwTOP+nSCl06zoFhzvIgLwiv8
 QsXxpHcHU73mOgWrZrIm4/Y3PJl/TcIxQj4UWLJm4FgkgWqITAXdHCmCL
 MCUvnLs8cnRGtFKB0QEI50462PY+0gqeCXDWVaBaJ1WVL3pURijxrx76F
 uFFl2UFr1WEkVuatAwn/l3jDAMUiyyjHu6zt/wiABHgALdL0ofrHrxJFk Q==;
X-CSE-ConnectionGUID: 6Jb0WDP0Rr25XU3+FWK2Rg==
X-CSE-MsgGUID: uN0cC+vnSBmz9KYe898waQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="823559"
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="823559"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 02:45:57 -0700
X-CSE-ConnectionGUID: p1/fhwqcRX+9NVQHC7srug==
X-CSE-MsgGUID: deIYahvASHWcGpw8qj25zA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="1563356"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 02:45:53 -0700
Date: Thu, 15 Oct 2026 11:45:51 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Badal Nilawar <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, daniele.ceraolospurio@intel.com,
 riana.tauro@intel.com, mallesh.koujalagi@intel.com,
 aravind.iddamsetty@intel.com, himal.prasad.ghimiray@intel.com,
 arvind.yadav@intel.com, syed.abdul.muqthyar.ahmed@intel.com,
 nitin.r.gote@intel.com, pravalika.gurram@intel.com
Subject: Re: [PATCH v4 06/12] drm/xe/cper: Prepare Intel CPER error info
 records
Message-ID: <atCgz0lfetLrUyao@black.igk.intel.com>
References: <20261009104602.1075405-14-badal.nilawar@intel.com>
 <20261009104602.1075405-20-badal.nilawar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261009104602.1075405-20-badal.nilawar@intel.com>
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

On Fri, Oct 09, 2026 at 04:16:09PM +0530, Badal Nilawar wrote:
> Prepare xe_cper_sec_intel_error_info records from RAS info queue data.
> Depending on the error class type, detail or aggregate, one or more error
> info records may be generated and embedded in the CPER record.
> 
> Assisted-by: Copilot:Claude-Opus-5.5
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
> v4:
>  - Move struct xe_cper_einfo_entry to xe_cper_types.h (Raag)
>  - Use kzalloc_flex()/kzalloc_objs() (Raag)
>  - Allocate info queue buffer from reported total size (Raag)
> ---
>  drivers/gpu/drm/xe/xe_cper.c       | 247 +++++++++++++++++++++++++++--
>  drivers/gpu/drm/xe/xe_cper_types.h |  54 ++++++-
>  2 files changed, 290 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_cper.c b/drivers/gpu/drm/xe/xe_cper.c
> index 1000c78b41e9..7acb503efd11 100644
> --- a/drivers/gpu/drm/xe/xe_cper.c
> +++ b/drivers/gpu/drm/xe/xe_cper.c
> @@ -78,16 +78,22 @@ static u64 cper_timestamp_now(void)
>  	return ts;
>  }
>  
> +static void fill_cper_error_class(struct xe_cper_error_class *dst,
> +				  const struct xe_ras_error_class *src)
> +{
> +	dst->error_type = src->common.severity;
> +	dst->error_component = src->common.component;
> +	dst->tile = src->product.unit.tile;
> +	dst->instance = src->product.unit.instance;
> +	dst->cause = src->product.cause.cause;
> +}

No needless refactoring, please introduce this function in the original
patch. Assuming you'll reuse struct xe_ras_error_class here, this can
simply be a memcpy().

...

> +/**
> + * struct xe_cper_sec_intel_error_info - Variable-length Intel GPU error payload

Do we really need to add 'error' everywhere?

> + * Appended after &xe_cper_sec_intel_err_hdr when detailed per-event data
> + * is available. The @event_queue flexible array holds @event_queue_count
> + * packed &xe_intel_priv_event_entry records.
> + */
> +struct xe_cper_sec_intel_error_info {
> +	/** @error_class: Error classification */
> +	struct xe_cper_error_class error_class;

'counter'

> +	/** @error_count: Total number of errors recorded */
> +	u32 error_count;

'count'

> +	/** @event_queue_length: Total byte size of the @event_queue array */
> +	u32 event_queue_length;

'queue_length'

> +	/** @event_queue_count: Number of entries in @event_queue */
> +	u32 event_queue_count;

'queue_count'

> +	/** @event_queue: Packed array of &xe_intel_priv_event_entry records */
> +	u8 event_queue[];

'queue'

> +};
> +
> +/**
> + * struct xe_intel_priv_event_entry - Single error event in the event queue

All cper struct must contain 'cper' naming. Also, redundant 'event'.

> + * Each entry is variable-length; @entry_length gives the byte size of
> + * @metadata only (not including @entry_length or @timestamp).
> + */
> +struct xe_intel_priv_event_entry {
> +	/** @entry_length: Byte length of the @metadata payload */
> +	u32 entry_length;

'length'

> +	/** @timestamp: Timestamp of this event, in firmware ticks */
> +	u64 timestamp;
> +	/** @metadata: Event-specific payload bytes */
> +	u8  metadata[];

Nit: Fix the spacing.

> +};
> +
>  /**
>   * struct xe_cper_nonstd_record - Intel GPU CPER record
>   *
>   * Contains the standard CPER record header, section descriptor, and the
> - * Intel error section header.
> + * Intel error section header. A &xe_cper_sec_intel_error_info payload
> + * may be appended dynamically.
>   */
>  struct xe_cper_nonstd_record {
>  	/** @record_hdr: Standard CPER record header (UEFI Appendix N.2.1) */
> @@ -122,4 +160,18 @@ struct xe_platform_id_entry {
>  	guid_t    platform_id;
>  };
>  
> +/**
> + * struct xe_cper_einfo_entry - One CPER error info payload and its source counter
> + */
> +struct xe_cper_einfo_entry {
> +	/** @hdr: Error class and counter value used for the CPER section header */
> +	struct xe_ras_info_queue_dynamic_counter_hdr hdr;
> +	/** @einfo: Allocated error info payload, NULL if none */
> +	struct xe_cper_sec_intel_error_info *einfo;
> +	/** @einfo_size: Byte size of @einfo including the event queue */
> +	u32 einfo_size;

You're using length and size interchangeably. Whatever your preference,
please use consistent naming for the terminology (in all places where
applicable).

Raag

> +	/** @timestamp: Timestamp of the first occurrence of this error class */
> +	u64 timestamp;
> +};
> +
>  #endif
> -- 
> 2.54.0
> 

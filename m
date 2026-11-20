Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61E77606A33C
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 11:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZWrD5+rP
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B7EA1128FD;
	Fri, 20 Nov 2026 11:19:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BED3A1128FD
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Nov 2026 11:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795173548; x=1826709548;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=jIYCKMLV24RZAFll9TGOKMIZ4flc6yImWcmZb7yuXgo=;
 b=ZWrD5+rPc5VazPAuqXVYFiIz9fERFa98ddckfTVruRDI5NqDLIJDbfpe
 8IuGEqszdvxOVn5wadnJsQvOAYxpvuKZca15pmA+zBbXJM/i2Weg+pmRm
 arC/v/3feZJ0l9vLEKujabXmrTfHUUj8ndEy0iC1S6JQFrXBwVVb3i0Js
 h6XmRLG8kAGFVDBm56HW17eQW6Fb72a1Iz3VIEyGx97vO9CgPuJfdZQ/n
 HlZ96Y9/Ag2HIbGZlZnTY3QQ+1arHgZtm1q6smRmQMFyRdJ0zcApA/rXw
 zV9o5l1VHpGV8HmPyj6wxh+aXwrcUN0Am90DTC0OycQUp9bIMuvo7pwTa w==;
X-CSE-ConnectionGUID: J1qMY/bcRViEkfyvCqsjeQ==
X-CSE-MsgGUID: oeT1jLJnQQ6moXXvJeVpWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3932943"
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="3932943"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 03:19:08 -0800
X-CSE-ConnectionGUID: Htgk1ee5TWyXedl5BkroZA==
X-CSE-MsgGUID: rJt0WIupSFe7JIxcWjGUZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; d="scan'208";a="12518554"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa011.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 03:19:04 -0800
Date: Fri, 20 Nov 2026 12:19:02 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Badal Nilawar <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, daniele.ceraolospurio@intel.com,
 riana.tauro@intel.com, mallesh.koujalagi@intel.com,
 aravind.iddamsetty@intel.com, himal.prasad.ghimiray@intel.com,
 arvind.yadav@intel.com, syed.abdul.muqthyar.ahmed@intel.com,
 nitin.r.gote@intel.com, matthew.d.roper@intel.com
Subject: Re: [PATCH v8 3/3] drm/xe/cper: Prepare Intel CPER info records
Message-ID: <awAspuvr9q8Eav8r@black.igk.intel.com>
References: <20261120043303.107183-5-badal.nilawar@intel.com>
 <20261120043303.107183-8-badal.nilawar@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261120043303.107183-8-badal.nilawar@intel.com>
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

On Fri, Nov 20, 2026 at 10:03:06AM +0530, Badal Nilawar wrote:
> The RAS info queue contains error logs for detail counters, or dynamic
> counter headers followed by error logs for aggregate counters.
> 
> Build CPER info records from the queue data, converting each error log
> into an CPER event. For aggregate counters, group logs by their dynamic
> counter header and build one info record per header.
> 
> Emit a CPER record for each generated info record.

A few nits below but we're good to go.

> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
> v6:
>   - Reintroduce event_ prefixes
>   - %s/einfo/info/
>   - Split cper_prepare_einfo() into queue-fetch and info-array
>     construction helpers (Raag)
>   - Rename the dynamic counter header's count field to error_count (Raag)
> v7:
>   - Retain einfo for existing payload variables and length parameter
>   - Rework cper_prepare_info() to return the number of entrie and info
>     array as an output argument. (Raag)
> v8:
>   - Swap fill_info() and build_info() names (Raag)
>   - Rename the header type to xe_ras_dynamic_counter_hdr (Raag)
>   - Return the byte count from cper_get_info_queue_buffer() and provide
>     the buffer through an output argument (Raag)
>   - Move drain assertions into cper_get_info_queue_buffer() and drop the
>     emit-function context requirement (Raag)
> ---
>  drivers/gpu/drm/xe/xe_cper.c       | 257 ++++++++++++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_cper_types.h |  59 ++++++-
>  drivers/gpu/drm/xe/xe_ras_types.h  |  27 +++
>  3 files changed, 335 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_cper.c b/drivers/gpu/drm/xe/xe_cper.c
> index dda82eb4690c..7366e17b6ebc 100644
> --- a/drivers/gpu/drm/xe/xe_cper.c
> +++ b/drivers/gpu/drm/xe/xe_cper.c
> @@ -89,7 +89,7 @@ static u64 cper_timestamp_now(void)
>  
>  static void cper_init_intel_hdr(struct xe_device *xe, const struct xe_ras_error_class *counter,
>  				u64 first_timestamp, u32 sig_id, u32 error_count,
> -				struct xe_cper_intel_hdr *ihdr)
> +				u32 einfo_size, struct xe_cper_intel_hdr *ihdr)
>  {
>  	ihdr->counter = *counter;
>  	ihdr->validation_bits |= XE_CPER_VALID_LOCATION;
> @@ -106,6 +106,7 @@ static void cper_init_intel_hdr(struct xe_device *xe, const struct xe_ras_error_
>  	}
>  
>  	ihdr->error_count = error_count;
> +	ihdr->info_log_size = einfo_size;

s/info_log_size/einfo_size

>  	strscpy(ihdr->pci_bdf, pci_name(to_pci_dev(xe->drm.dev)), sizeof(ihdr->pci_bdf));
>  	ihdr->validation_bits |= XE_CPER_VALID_PCI_BDF;
> @@ -200,6 +201,226 @@ static void cper_record_emit(struct xe_device *xe, u8 severity,
>  	kfree(rec);
>  }
>  
> +static struct xe_cper_intel_info *fill_info(const struct xe_ras_error_class *counter,

Considering we're returning xe_cper_intel_info, we should probably call
this fill_einfo().

> +					    u32 error_count, const struct xe_ras_error_log *logs,
> +					    u32 num_logs)
> +{
> +	struct xe_cper_intel_event *entry;

I'm getting a bit confused by 'entry' since we aready use it for
xe_cper_info_entry, so let's call this 'event'.

> +	struct xe_cper_intel_info *einfo;
> +	u32 event_queue_size, i;
> +
> +	event_queue_size = num_logs * XE_CPER_RAS_LOG_ENTRY_SIZE;
> +	einfo = kzalloc_flex(*einfo, event_queue, event_queue_size);
> +	if (!einfo)
> +		return NULL;
> +
> +	einfo->error_count = error_count;
> +	einfo->event_queue_size = event_queue_size;
> +	einfo->event_queue_count = num_logs;
> +	einfo->counter = *counter;
> +
> +	entry = (struct xe_cper_intel_event *)einfo->event_queue;
> +	for (i = 0; i < num_logs; i++) {
> +		entry->size = sizeof_field(struct xe_ras_error_log, details);
> +		entry->timestamp = logs[i].timestamp;
> +		memcpy(entry->metadata, logs[i].details, sizeof(logs[i].details));
> +		entry = (void *)entry + XE_CPER_RAS_LOG_ENTRY_SIZE;

This looks like we're iterating over the events and should be called
XE_CPER_INTEL_EVEN_SIZE.

Sorry I missed this in last rev.

Raag

> +	}
> +
> +	return einfo;
> +}

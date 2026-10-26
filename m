Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9573B606A31A
	for <intel-xe@archiver.kernel.org>; Mon, 26 Oct 2026 12:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Bvjo3g6f
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F25510E04D;
	Mon, 26 Oct 2026 12:29:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3499C10E057
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Oct 2026 12:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793017775; x=1824553775;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=yXYWqFKepDrDL2xIdufNgMAA9aikzq1gDwlqYobhHqA=;
 b=Bvjo3g6fGqWLeChIvn4EkHgLjT7Q2azZrsAFf6sNJDMQPvXggJygX9I/
 /8NS0C40Aep+qN/xrjH1n46SwosvO/4Px6Lsk7EkOJxeuZ5hkIamnD5Sw
 PE2OgARVzXLauoDmGOJcOBeRNSTGAsWCOhg+pYC6GAhgjSR45yWz2dt6V
 zFg/jWO1+1PyCmN1AWzE/jXymqLyosc8KLfbu7eC1uxM8mf32+xnL28tH
 sPczhDsJKEmKgTGjEGkfMVxnVgMhH3P8DSUg9CZOP2b1VNyrmmkhYvTXu
 wrwFGNM4IO45i9A5ndPawonue9cXvzrsiFS/fzJyU3iGyN2PF5rw44UDB Q==;
X-CSE-ConnectionGUID: fxB47e7PS4CwEfZ317CuFQ==
X-CSE-MsgGUID: LnGCOrvMSoSmx/EwtbQgNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1672198"
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="1672198"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 05:29:28 -0700
X-CSE-ConnectionGUID: EDb7NKenRjKJL33okEAGgw==
X-CSE-MsgGUID: OE205mn8QuSDGF7WVhEv7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="4634243"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 05:29:25 -0700
Date: Mon, 26 Oct 2026 13:29:21 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Badal Nilawar <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, daniele.ceraolospurio@intel.com,
 riana.tauro@intel.com, mallesh.koujalagi@intel.com,
 aravind.iddamsetty@intel.com, himal.prasad.ghimiray@intel.com,
 arvind.yadav@intel.com, syed.abdul.muqthyar.ahmed@intel.com,
 nitin.r.gote@intel.com
Subject: Re: [PATCH v5 06/13] drm/xe/cper: Emit cper record to trace buf
Message-ID: <at9HoRyZmOwUYiyK@black.igk.intel.com>
References: <20261023043422.681260-15-badal.nilawar@intel.com>
 <20261023043422.681260-21-badal.nilawar@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261023043422.681260-21-badal.nilawar@intel.com>
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
X-Spam-Status: No, score=-6.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 23, 2026 at 10:04:28AM +0530, Badal Nilawar wrote:
> Add the xe_error_cper tracepoint and emit each assembled CPER record
> through it. Besides the raw record, the event carries the device name,
> platform ID, FRU ID, severity and the Intel error section header, so
> tools can pick up the records from the trace buffer.

...

> + * Example trace output::
> + *
> + *   xe_error_cper: dev=0000:03:00.0 severity=2
> + *     platform_id=9046afe5-9041-5124-8614-92550d9e9da6
> + *     fru_id=91befe38-2f61-3d7b-0000-000000000000
> + *     intel_err_hdr_raw=

'intel_hdr_raw'

> + *       01 02 00 18 00 00 00 01 00 00 00 00 64 77 51 14 ...
> + *     cper_len=1772
> + *     cper_raw=
> + *       43 50 45 52 00 01 ff ff ff ff 01 00 02 00 00 00 ...

...

> +	    TP_printk("dev=%s severity=%d platform_id=%pUl fru_id=%pUl intel_err_hdr_raw=%s cper_len=%u cper_raw=%s",

Ditto.

Raag

> +		      __get_str(dev), __entry->sev,
> +		      __entry->platform_id, __entry->fru_id,
> +		      __print_hex(__entry->ihdr_raw,
> +				  sizeof(struct xe_cper_intel_hdr)),
> +		      __entry->cper_len,
> +		      __print_hex(__get_dynamic_array(cper),
> +				  __entry->cper_len))

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0700C79FA1
	for <intel-xe@archiver.kernel.org>; Tue,  8 Sep 2026 10:20:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8498C10EB14;
	Tue,  8 Sep 2026 10:20:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FH6YLuDT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7089910EB14
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Sep 2026 10:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788862846; x=1820398846;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ZoAYdBJ46+5reAGKhAOo0TrDlH30bKuzqdeHdxXgNHo=;
 b=FH6YLuDTku3pyljJuZAO591XjlP/7NHMSNAnWTnPYJaL+6L3O/l2PY7X
 Tz8p1JYTX04Ix1er4szgxcZjNs6a9gcsC/7rncvlHsnpyX8aD+7Kt/uwg
 2VbtEHlzczRk25opaiQr5eNCht9/QW5V8XBCcH0I2uOQrXY2xl2Vp3eyQ
 gDhAFqBpS7HN129nPNvRRQkkhmvPx3yINCXlgTSEB1rIak6ui+/GJlwV8
 d3AO90Rdv5k6TwBa4yIABAnZoNBi5/VT+ImYmRmtKHV6XQMTPJhPhZwNe
 EWOhlJ+zF8Oz5I9cTuOIDnLwN3IohrHKnsCtcsCmuUPWfoSb1WumKBGsP g==;
X-CSE-ConnectionGUID: ht+fSjsiQ+mrUmE//SbvSQ==
X-CSE-MsgGUID: 6PifUD4MRyCGFbbVv3Nq0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="76820312"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="76820312"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 03:20:46 -0700
X-CSE-ConnectionGUID: AXMBDx8QS7+nXFS5XfZwGQ==
X-CSE-MsgGUID: iOPkYu/uSxCMNrbNrl1Qrw==
X-ExtLoop1: 1
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 03:20:43 -0700
Date: Tue, 8 Sep 2026 12:20:41 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Badal Nilawar <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, daniele.ceraolospurio@intel.com,
 riana.tauro@intel.com, mallesh.koujalagi@intel.com,
 aravind.iddamsetty@intel.com, michal.wajdeczko@intel.com,
 himal.prasad.ghimiray@intel.com, arvind.yadav@intel.com,
 syed.abdul.muqthyar.ahmed@intel.com, nitin.r.gote@intel.com
Subject: Re: [PATCH v3 04/12] drm/xe/cper: Prepare CPER record
Message-ID: <ap_heXgiRP0bN9Jc@black.igk.intel.com>
References: <20260906172604.2215987-14-badal.nilawar@intel.com>
 <20260906172604.2215987-18-badal.nilawar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260906172604.2215987-18-badal.nilawar@intel.com>
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

On Sun, Sep 06, 2026 at 10:56:09PM +0530, Badal Nilawar wrote:
> Initialize Intel-specific CPER metadata and construct
> CPER record for Intel GPU hardware errors.

...

> @@ -48,5 +209,15 @@ void xe_emit_hardware_error_cper(struct pci_dev *pdev, int cper_sev, enum xe_sig
>  		}
>  	}
>  
> +	xe_cper_init_intel_err_hdr(xe,
> +				   (const u8 *)counter,
> +				   counter_response->timestamp,
> +				   sigid,
> +				   counter_response->value,
> +				   &ihdr);
> +
> +	xe_cper_record_emit(xe, cper_sev, &INTEL_CPER_NOTIFY_GPU_ERROR,
> +			    &ihdr, NULL, 0);

Hm, can these two calls be split in their own patches which also
introduce their respective structs?

Raag

> +
>  	/* TODO */
>  }
> -- 
> 2.54.0
> 

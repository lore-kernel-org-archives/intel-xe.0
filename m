Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D72BCCFA18
	for <intel-xe@archiver.kernel.org>; Sat,  8 Nov 2025 13:53:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FCA110E0E6;
	Sat,  8 Nov 2025 13:53:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PgSsU+8d";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6748D10E0E6
 for <intel-xe@lists.freedesktop.org>; Sat,  8 Nov 2025 13:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762610033; x=1794146033;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=EKCliGYd2lRhgbqSoPGsk/k+5jI00CMUZdhP/dRwmiA=;
 b=PgSsU+8d1KyQqMG1Os+CgHADB/pAhRe/pZ0deUNa6p6ZScoal5t/TOAU
 VbVLEDtK/BOp7d1NFDKAfi3VC1UNPcTQaJ76MNaPLnZsRkGYQd/vyZ0+V
 dTy3IMfuqg2ByWZANA21V+eZ+g9fTfqbls+IXts0udQsGK5UKqJPaR2p/
 9N2DRpE4hMYQbdCKinS37Tml/r0GxERmBU7kgUK4D+WnBsyb53OyHv1W8
 UwMVhtCKVuVWkJczGoCie6hZfpwqne8O1OyAhvayhGO0W1CLFVBA4hfXY
 w7hSc9+x8JdQED4bm9+R8Wc94M7S7iR32hCziYW7MOspEixpfIjnh2qB5 A==;
X-CSE-ConnectionGUID: InPMPpMOSaGSR6UnrQAcDw==
X-CSE-MsgGUID: p1hVN1VdR5up9QOy/sNkLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11606"; a="75029971"
X-IronPort-AV: E=Sophos;i="6.19,289,1754982000"; d="scan'208";a="75029971"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2025 05:53:53 -0800
X-CSE-ConnectionGUID: uzpOTvigRMuPWivzMwYFqw==
X-CSE-MsgGUID: U2Sb2RJ6SVeTGrFghHnmMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,289,1754982000"; d="scan'208";a="219014145"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2025 05:53:52 -0800
Date: Sat, 8 Nov 2025 14:53:49 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH] drm/xe/pcode: Rework error mapping
Message-ID: <aQ9LbaoiLeE6D3bD@black.igk.intel.com>
References: <20251107-pcode-errmap-v1-1-8e564673bf00@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251107-pcode-errmap-v1-1-8e564673bf00@intel.com>
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

On Fri, Nov 07, 2025 at 11:21:18AM -0800, Lucas De Marchi wrote:
> The sparse array used for error decoding from is unnecessarily big. It
> should be better handled by a switch statement that will also allow us
> to more easily improve this code.
> 
> Add a CASE_ERR() macro to keep the table compact and use it instead of
> the 256-entries array, which saves some space:
> 
> 	$ bloat-o-meter xe_pcode.o.old xe_pcode.o
> 	add/remove: 0/1 grow/shrink: 2/0 up/down: 222/-4096 (-3874)
> 	Function                                     old     new   delta
> 	__pcode_mailbox_rw                           363     480    +117
> 	__pcode_mailbox_rw.cold                       58     163    +105
> 	err_decode                                  4096       -   -4096
> 	Total: Before=7890, After=4016, chg -49.10%

...

> +#define CASE_ERR(_err, _err_decode, _err_str)	\
> +	case _err:				\
> +		err_decode = _err_decode;	\
> +		err_str = _err_str;		\
> +		break
>  
>  	err = xe_mmio_read32(&tile->mmio, PCODE_MAILBOX) & PCODE_ERROR_MASK;
> +	switch (err) {
> +	CASE_ERR(PCODE_ILLEGAL_CMD,	      -ENXIO,     "Illegal Command");
> +	CASE_ERR(PCODE_TIMEOUT,               -ETIMEDOUT, "Timed out");
> +	CASE_ERR(PCODE_ILLEGAL_DATA,          -EINVAL,    "Illegal Data");
> +	CASE_ERR(PCODE_ILLEGAL_SUBCOMMAND,    -ENXIO,     "Illegal Subcommand");
> +	CASE_ERR(PCODE_LOCKED,                -EBUSY,     "PCODE Locked");
> +	CASE_ERR(PCODE_GT_RATIO_OUT_OF_RANGE, -EOVERFLOW, "GT ratio out of range");
> +	CASE_ERR(PCODE_REJECTED,              -EACCES,    "PCODE Rejected");

[*]

> +	CASE_ERR(PCODE_ERROR_MASK,            -EPROTO,    "Unknown");
> +	default:
> +		err_decode = -EPROTO;
> +		err_str = "Unknown";

One way to avoid the duplication is by moving the default case above[*],
but it's quite ugly and I'm not aware if there are any rules against such
ordering.

In any case,

Reviewed-by: Raag Jadav <raag.jadav@intel.com>

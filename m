Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DF6CCCFA18
	for <intel-xe@archiver.kernel.org>; Sat,  8 Nov 2025 21:29:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ACAC10E1FA;
	Sat,  8 Nov 2025 21:29:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YgP+jYf+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D25E010E1FA
 for <intel-xe@lists.freedesktop.org>; Sat,  8 Nov 2025 21:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762637363; x=1794173363;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=WeeFlPR4L+FC2EMWvvcs5DCaUFCV6S0+vH5R6yxs6v4=;
 b=YgP+jYf+h4Jaay1lzWLLM13PXO9KWwgxLk6Id/SNl2S5gHmy5ip1B73/
 Rb6nQ5NIYBNbDNacd7eCr/dWumNDODzvHdVtjubJWmmnYWHVVhJeP5UDd
 Mu/EAsVxRfCA5mtuhgTsuHP+L5bqHolBTxKT0zdhsavE6Tq9dRSAYO5ep
 gyUfNbkUgPxKjKb7Ft0gNJDkbK7EyICqeambTtFCKT/ulZobVlHSHmQ+V
 rb9VqAtb11JZV9za6NEGru8KXrLYNkplSGnAmkGdKOAS/2gPZ4aIIG61B
 uKsySnOyhrHLdsmuoIpmEU1WE4HH74OcwjJ+Ujtt/LOB608K5zUAKE53o Q==;
X-CSE-ConnectionGUID: 1dSiRPukRTmVO0jSVL2EGQ==
X-CSE-MsgGUID: YJ7N6ujiQ02x/OEc02RJsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11607"; a="75040661"
X-IronPort-AV: E=Sophos;i="6.19,290,1754982000"; d="scan'208";a="75040661"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2025 13:29:23 -0800
X-CSE-ConnectionGUID: 2Trf9nwTRESJmWl5vkYV0A==
X-CSE-MsgGUID: w49Rb1iOSjOFg6hWGGHrHg==
X-ExtLoop1: 1
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2025 13:29:21 -0800
Date: Sat, 8 Nov 2025 22:29:18 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH] drm/xe/pcode: Rework error mapping
Message-ID: <aQ-2LkYcr79Og5Nq@black.igk.intel.com>
References: <20251107-pcode-errmap-v1-1-8e564673bf00@intel.com>
 <aQ9LbaoiLeE6D3bD@black.igk.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aQ9LbaoiLeE6D3bD@black.igk.intel.com>
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

On Sat, Nov 08, 2025 at 02:53:52PM +0100, Raag Jadav wrote:
> On Fri, Nov 07, 2025 at 11:21:18AM -0800, Lucas De Marchi wrote:
> > The sparse array used for error decoding from is unnecessarily big. It
> > should be better handled by a switch statement that will also allow us
> > to more easily improve this code.
> > 
> > Add a CASE_ERR() macro to keep the table compact and use it instead of
> > the 256-entries array, which saves some space:
> > 
> > 	$ bloat-o-meter xe_pcode.o.old xe_pcode.o
> > 	add/remove: 0/1 grow/shrink: 2/0 up/down: 222/-4096 (-3874)
> > 	Function                                     old     new   delta
> > 	__pcode_mailbox_rw                           363     480    +117
> > 	__pcode_mailbox_rw.cold                       58     163    +105
> > 	err_decode                                  4096       -   -4096
> > 	Total: Before=7890, After=4016, chg -49.10%
> 
> ...
> 
> > +#define CASE_ERR(_err, _err_decode, _err_str)	\
> > +	case _err:				\
> > +		err_decode = _err_decode;	\
> > +		err_str = _err_str;		\
> > +		break
> >  
> >  	err = xe_mmio_read32(&tile->mmio, PCODE_MAILBOX) & PCODE_ERROR_MASK;
> > +	switch (err) {
> > +	CASE_ERR(PCODE_ILLEGAL_CMD,	      -ENXIO,     "Illegal Command");
> > +	CASE_ERR(PCODE_TIMEOUT,               -ETIMEDOUT, "Timed out");
> > +	CASE_ERR(PCODE_ILLEGAL_DATA,          -EINVAL,    "Illegal Data");
> > +	CASE_ERR(PCODE_ILLEGAL_SUBCOMMAND,    -ENXIO,     "Illegal Subcommand");
> > +	CASE_ERR(PCODE_LOCKED,                -EBUSY,     "PCODE Locked");
> > +	CASE_ERR(PCODE_GT_RATIO_OUT_OF_RANGE, -EOVERFLOW, "GT ratio out of range");
> > +	CASE_ERR(PCODE_REJECTED,              -EACCES,    "PCODE Rejected");
> 
> [*]
> 
> > +	CASE_ERR(PCODE_ERROR_MASK,            -EPROTO,    "Unknown");
> > +	default:
> > +		err_decode = -EPROTO;
> > +		err_str = "Unknown";
> 
> One way to avoid the duplication is by moving the default case above[*],
> but it's quite ugly and I'm not aware if there are any rules against such
> ordering.

Or drop PCODE_ERROR_MASK case entirely and let default take care of it
instead.

> In any case,
> 
> Reviewed-by: Raag Jadav <raag.jadav@intel.com>

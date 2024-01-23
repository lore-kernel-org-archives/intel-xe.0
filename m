Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3013EC47258
	for <intel-xe@archiver.kernel.org>; Tue, 23 Jan 2024 17:47:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0B5910E644;
	Tue, 23 Jan 2024 17:47:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70C0C10E837
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Jan 2024 17:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706032020; x=1737568020;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=ithr3h6xjF57DsPoqMziBitXFtdV/iuqLA34dULxA1Y=;
 b=FKSGydSqHoZw4LFKNB2laQ5b8FxtQZpU583anOd/tAAzEaXlPva2YfV9
 k53RhS2UV5Qa/IMqTq0U3MGonPKNmUPOsWNrACsy/K3BCPhFRxy4t9kAn
 AyP8BAts4OMhnyd90K31Gf1Z1ght9edXPA3h29vL2t3cwgn3/A+mI9OBg
 SveP+/OyKlvO53tZBM8lhcjivkmNN0zsDdyrVfG0hoTm2LtpYhtF7g93G
 ObmbetuIwYpIz/f8pppP8UwQYv/pUxhqYi0VDDWb5W2pCxC5y12lb4X5e
 fDDm/h4nkpQwClkVcTtBDJ42ogDlLgipEVwaH7UhAc8P7rTEYJW36x8b/ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="8270415"
X-IronPort-AV: E=Sophos;i="6.05,214,1701158400"; 
   d="scan'208";a="8270415"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 09:46:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="909384054"
X-IronPort-AV: E=Sophos;i="6.05,214,1701158400"; d="scan'208";a="909384054"
Received: from pzsolt-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.40.183])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 09:46:31 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Subject: Re: [PATCH v3] drm/xe: Document nested struct members according to
 guidelines
In-Reply-To: <20240123153147.27305-1-thomas.hellstrom@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240123153147.27305-1-thomas.hellstrom@linux.intel.com>
Date: Tue, 23 Jan 2024 19:46:28 +0200
Message-ID: <87le8glz7v.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, 23 Jan 2024, Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.co=
m> wrote:
> Document nested struct members with full names as described in
> Documentation/doc-guide/kernel-doc.rst.

...

> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe=
_device_types.h
> index 7eda86bd4c2a..eb2b806a1d23 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -143,10 +143,10 @@ struct xe_tile {
>  	 * * 8MB-16MB: global GTT
>  	 */
>  	struct {
> -		/** @size: size of tile's MMIO space */
> +		/** @mmio.size: size of tile's MMIO space */
>  		size_t size;
>=20=20
> -		/** @regs: pointer to tile's MMIO space (starting with registers) */
> +		/** @mmio.regs: pointer to tile's MMIO space (starting with registers)=
 */
>  		void __iomem *regs;
>  	} mmio;
>=20=20

I really wish you could just do:

	/** Documentation of foo member */
        int foo;

to document the following member, instead of having to repeat every
single member name everywhere. kernel-doc has all the info to do this,
but I never want to touch that perl script again...


BR,
Jani.


--=20
Jani Nikula, Intel

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1DE9CD5BD5
	for <intel-xe@archiver.kernel.org>; Thu, 28 May 2026 18:06:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4213D10F506;
	Thu, 28 May 2026 18:06:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CZCXqiRF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A526410F506
 for <intel-xe@lists.freedesktop.org>; Thu, 28 May 2026 18:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779991571; x=1811527571;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=afPt44H7zM3Wh7mC4/vRNiU4Hf70b410Xzy7CoXt1AM=;
 b=CZCXqiRFuERIYrgTSsRW5Fp76Dmynz1PVBlZadbwBZcVYHM5ntUMS2KI
 ROOR/uj205cIInsI9eIpWIhuYQeqwWUT5l3yAD0CamSQ93DzHyRVqAy66
 bM8bXWAJzyepLTptmmbi8iwYGrAogmKZkSFgM6DQL8HuSgcfMEbE/smjO
 bS7h0YI4OaVCGYzSzjurjmotnPCZRL75pDJ650d7JUmVessGHHB8+FRFG
 DcDFhL1nlTMl3fuJX2br2nXN9UHovpEy49ItK9LZUI40j2TuuthpUHT4A
 ddSCtP6MfDQtHFfDjDbZT0escTu5i6P5pDkRviivEHEtDXHi6SHw82veL A==;
X-CSE-ConnectionGUID: 6jiI1kX8RHmQV0FZ9d5xSw==
X-CSE-MsgGUID: 2fn/6tqGTMStuRBryRs9GQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11800"; a="84467900"
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; d="scan'208";a="84467900"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2026 11:06:10 -0700
X-CSE-ConnectionGUID: 9g85FTCLQ22aQ9Umg1A+dw==
X-CSE-MsgGUID: T+vueUcETz+BkgpUMOTqAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; d="scan'208";a="246906438"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2026 11:06:08 -0700
Date: Thu, 28 May 2026 20:06:05 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH] drm/xe/mmio: Assert MMIO is available
Message-ID: <ahiEDVoZ3CxFqInC@black.igk.intel.com>
References: <20260527175437.22585-1-michal.wajdeczko@intel.com>
 <754ed1a5-ed12-4e0e-bafc-5775106d8e14@intel.com>
 <d7fd718c-413a-4a7e-83d4-cfb0401194fc@intel.com>
 <d77e39ad-2463-4947-a0d7-d366f6d45cfc@intel.com>
 <553bcab7-0fb4-4797-ba13-c872ab2b5c18@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <553bcab7-0fb4-4797-ba13-c872ab2b5c18@intel.com>
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

On Thu, May 28, 2026 at 07:34:58PM +0200, Michal Wajdeczko wrote:
> On 5/28/2026 6:47 PM, Matthew Auld wrote:
> > On 28/05/2026 17:16, Michal Wajdeczko wrote:

...

> >> and the fact that mmio.regs is still non-NULL and points to the connected HW, is just our luck?
> >>
> >> maybe we should kill the HW immediately on pci.remove, if it is still present, and just unwind SW state using devm/drmm actions?
> > 
> > devm is for unwinding hw related state, 
> 
> hmm, are we 100% sure?
> 
> from [1] it looks that the devres rationale was about "leaking resources" problem and the example still shows that HW cleanup is part of the .remove hook:
> 
> my_remove_one()
> {
>       unregister_from_upper_layer(d);
>       shutdown_my_hardware();
> }
> 
> so maybe indeed we are little abusing the device model by touching the HW beyond the .remove?
> 
> [1] https://docs.kernel.org/driver-api/driver-model/devres.html

I'm doubtful because PCI core also hooks its hardware cleanup to devres.

1. pcim_enable_device()
2. pcim_set_mwi()
3. pcim_setup_msi_release()

Raag

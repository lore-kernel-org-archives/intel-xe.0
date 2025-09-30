Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE604CCA470
	for <intel-xe@archiver.kernel.org>; Tue, 30 Sep 2025 17:23:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84F3510E279;
	Tue, 30 Sep 2025 17:23:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R4oEGPjg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7D4B10E279
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Sep 2025 17:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759253010; x=1790789010;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=dVQZPgi2krdR8NKLXFSh1R0v5RFvk5ZPVjeo3wSPINM=;
 b=R4oEGPjgCdzBLl6yr2cUGgIMIt3ppLT5V+0wUPvrc263F0JZM/QJNZxP
 0AXzxRaoOqkek3xzCy4KrXMavejT3pkb261bz2L8pIfwDEjXbIKuDOorq
 xpKNJcDf/H7K+fiar6ErI63CsVMNFdYbXJOxwms4xQ3GrCMUWJ1O6AnMd
 MYGbJchq2u7E0bCMLUfg3/vniBFgTTr4dLVusDtOs9Hu0pz7nwqLKGxSa
 ugLK8j52+KDn1cE0fWmKmOOOt+EmfRaIr0yGuZz4q8dQ70Q1XREAo7N48
 BhFBaPW/K+9Qayj6uT4m10HnEhuQZrvAMDR90VCxHDmH3B1v0iuH0sEmN g==;
X-CSE-ConnectionGUID: wQ8JpVk4TeKXsp002x+ysA==
X-CSE-MsgGUID: T/ajjSr+Swa6C0Bny6eiAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="65156950"
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; d="scan'208";a="65156950"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 10:23:30 -0700
X-CSE-ConnectionGUID: SBL/WijDSuKYmLtKoxs2gA==
X-CSE-MsgGUID: GuoFUSF0SSSSRMpDxHwqBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; d="scan'208";a="183766918"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 10:23:28 -0700
Date: Tue, 30 Sep 2025 19:23:25 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH 1/5] drm/xe/debugfs: Update xe_gt_topology_dump signature
Message-ID: <aNwSDXlttVzutmxp@black.igk.intel.com>
References: <20250923211613.193347-1-michal.wajdeczko@intel.com>
 <20250923211613.193347-2-michal.wajdeczko@intel.com>
 <275ae979fdbefb5e6f4fbc00bf183eb0b7d336c1@intel.com>
 <cf3dcf02-e213-4339-b356-efa8056f84bb@intel.com>
 <1bdb6f5ad557a144f402c106d80a319248028bbe@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1bdb6f5ad557a144f402c106d80a319248028bbe@intel.com>
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

On Tue, Sep 30, 2025 at 02:43:47PM +0300, Jani Nikula wrote:
> On Tue, 30 Sep 2025, Michal Wajdeczko <michal.wajdeczko@intel.com> wrote:
> > On 9/30/2025 10:45 AM, Jani Nikula wrote:
> > > On Tue, 23 Sep 2025, Michal Wajdeczko <michal.wajdeczko@intel.com> wrote:
> > > > +/**
> > > > + * xe_gt_topology_dump() - Dump GT topology into a drm printer.
> > > > + * @gt: the &xe_gt
> > > > + * @p: the &drm_printer
> > > > + *
> > > > + * Return: always 0.
> > > > + */
> > > > +int xe_gt_topology_dump(struct xe_gt *gt, struct drm_printer *p)
> > > 
> > > What benefit do the formatted kernel-doc give us? IMO it's just
> > > boilerplate with pretty much everything being obvious from the function
> > > name and parameters. And the functions aren't significant enough to be
> > > made part of the Sphinx build either.
> >
> > I'm just following the (unwritten?) rule that in Xe we should document
> > all public functions, and while in some cases such kernel-doc does not
> > bring anything new, also like in [1], IMO it's still better than no
> > documentation at all, as sometimes, like [2], function name isn't
> > telling you the whole thing
> 
> I'm not arguing against documentation. I'm arguing against excessive use
> of kernel-doc formatting for functions that will never be part of the
> Sphinx documentation build.
> 
> /**
>  * xe_gt_topology_dump() - Dump GT topology into a drm printer.
>  * @gt: the &xe_gt
>  * @p: the &drm_printer
>  *
>  * Return: always 0.
>  */
> 
> vs.
> 
> /* Dump GT topology into a drm printer. Always returns 0. */
> 
> For non-EXPORT_SYMBOL() driver internal stuff, in most cases the
> parameter descriptions are self-evident, and repeating the function name
> is just, well, repeating. The formatting doesn't buy us anything, it
> just brings overhead and extra maintenance, because the format will be
> checked.
> 
> For EXPORT_SYMBOL() and the more important functions, or generally
> things you might want to include in the Sphinx build, or anything that
> might benefit from the formatting for readability, sure, use
> kernel-doc. Otherwise, I wouldn't bother.

+1. I've always thought kdoc formatting was a general guidance than a hard
rule, especially when the driver footprint is already quite huge.

Raag

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4880CD5B87C
	for <intel-xe@archiver.kernel.org>; Tue, 16 Dec 2025 07:57:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F09F310E079;
	Tue, 16 Dec 2025 07:57:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qp6TdOEt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2483310E079
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Dec 2025 07:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765871865; x=1797407865;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=IHbpgSbK4nI7MJP6JDRyy/5nS1TMLiZQ/2zE/hUYx6Y=;
 b=Qp6TdOEtKrhrRwcUq8ffVXipGGRjVM4+n7ClsRHIG0wdFoyK4NVBH+M0
 yQgETaxmduR/Hkn+0qay7TbO4XaQDWhPoxiHvbdpZXCJ/PNyc2YJ7TaXm
 A/ZDGRwtnU5ht99hr9QnjF0dom+bJB5+OMzGcbXregjPVlH+YKg3vQF6k
 iZKMF0p10gMAuvmCRsWkTEMSG3DcNEB6Tj7QO+kq5qcZ0uOUXM9bztfPi
 kix6DD8BNmcQHYqtIsq3D89ZpDbAzt6IdLQTZIOAdvEXirXJqXNmfX3Pu
 zzCHL3CUZWGPilvusZU18PEUsnjRSx9wQjMAvc/c0OCbRiaXk2TWHT7Kb Q==;
X-CSE-ConnectionGUID: YRoy9ejYSMKJt0n7bRwmCQ==
X-CSE-MsgGUID: hqbgGhd2QBy4syfldCRhUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="67855849"
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; d="scan'208";a="67855849"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 23:57:45 -0800
X-CSE-ConnectionGUID: na+BnQRzTqaOpQJ1cNupQg==
X-CSE-MsgGUID: 6DIZult8SPuUjGfXZUTS2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; d="scan'208";a="197573435"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 23:57:43 -0800
Date: Tue, 16 Dec 2025 08:57:40 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: "Usyskin, Alexander" <alexander.usyskin@intel.com>
Cc: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "Abliyev, Reuven" <reuven.abliyev@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/nvm: enable cri platform
Message-ID: <aUEQ9BvG4HYUciD3@black.igk.intel.com>
References: <20251215125928.1931951-1-alexander.usyskin@intel.com>
 <aUAUqTdroGS2L4gi@black.igk.intel.com>
 <CY5PR11MB636602B9B547F832F8E1B084EDADA@CY5PR11MB6366.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CY5PR11MB636602B9B547F832F8E1B084EDADA@CY5PR11MB6366.namprd11.prod.outlook.com>
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

On Mon, Dec 15, 2025 at 08:41:54PM +0530, Usyskin, Alexander wrote:
> > Subject: Re: [PATCH] drm/xe/nvm: enable cri platform

...

> > >  	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
> > >
> > > -	if (xe->info.platform != XE_BATTLEMAGE)
> > > +	switch (xe->info.platform) {
> > > +	case XE_CRESCENTISLAND:
> > > +		fallthrough;
> > 
> > Is standalone fallthrough a thing?
> 
> I see it in some kernel drivers and checkpatch jumps on /* fallthrough */ comment.
> Is it discouraged?

They both are same cases so there's nothing to fall from. Drop it.

Raag

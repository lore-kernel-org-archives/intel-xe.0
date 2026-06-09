Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6468FCD8CAA
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jun 2026 10:19:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D829892ED;
	Tue,  9 Jun 2026 10:19:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T2AsmSif";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE183892ED
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jun 2026 10:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781000386; x=1812536386;
 h=from:date:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=AU7EFzXTXVGpi6G9JkD3QAFNpYqwnCYRwOiCF26k7kY=;
 b=T2AsmSif52vKuioaPOQs9f+vV+AhSQLkzoNmyi0E2I+DfCFHK4bepnRH
 18CyXhiXOZlW0nIV7TJR1VDitJ/dVKY+7GETy4DmAUbp8yAaon3e7Loj3
 EIG6ULb96SSLFJoRlxku+h9WSR6SwYYt5Ep/fvE4IZPGoSJtb4N93KQIJ
 4mG3bYGi3jZ+MTbwNh6OsydLdAf8d3DpgEM+V0+AyWkf2lojypLIT30OX
 LCIBOK8Fkr4r5jCd5wvtXz6+aa12UC2McemPREDJovn5sAkkRhhxYN3Au
 1ienne8CdG96wnt9DZfxXsyUeLT9Ds7uIBM5/tNDFJpaNhLWQXvoLiUdF A==;
X-CSE-ConnectionGUID: yar5ANqWSB2QqKmKgzVy0w==
X-CSE-MsgGUID: YS9ILZazTa6+vWvmCb1eig==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="99332381"
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; d="scan'208";a="99332381"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 03:19:45 -0700
X-CSE-ConnectionGUID: Yj5ZP93zScCT1TvuRG7rbg==
X-CSE-MsgGUID: L7eU/RaKSOyP6ILHTeicAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; d="scan'208";a="241658527"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.81])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 03:19:42 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 9 Jun 2026 13:19:39 +0300 (EEST)
To: "Ruhl, Michael J" <michael.j.ruhl@intel.com>, 
 David Box <david.e.box@linux.intel.com>
cc: "Brost, Matthew" <matthew.brost@intel.com>, 
 "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>, 
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
Subject: RE: [PATCH] platform/x86/intel/vsec: Restore BAR fallback for header
 walk
In-Reply-To: <IA1PR11MB64182D9946206FC3E4A430C4C11C2@IA1PR11MB6418.namprd11.prod.outlook.com>
Message-ID: <93ccf8d4-3091-2339-ab1e-7689776d893b@linux.intel.com>
References: <20260529183150.129744-1-david.e.box@linux.intel.com>
 <IA1PR11MB64184FD919A96888F580730CC1132@IA1PR11MB6418.namprd11.prod.outlook.com>
 <mvyzq3kislmjd2hd2nhdyphvnpz7ap5tu76sujaxprxp5rhnhx@34qt4rgvhe6n>
 <IA1PR11MB64182D9946206FC3E4A430C4C11C2@IA1PR11MB6418.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Mon, 8 Jun 2026, Ruhl, Michael J wrote:

> >-----Original Message-----
> >From: David Box <david.e.box@linux.intel.com>
> >Sent: Sunday, June 7, 2026 3:39 PM
> >To: Ruhl, Michael J <michael.j.ruhl@intel.com>
> >Cc: ilpo.jarvinen@linux.intel.com; Brost, Matthew
> ><matthew.brost@intel.com>; thomas.hellstrom@linux.intel.com; intel-
> >xe@lists.freedesktop.org; linux-kernel@vger.kernel.org; platform-driver-
> >x86@vger.kernel.org
> >Subject: Re: [PATCH] platform/x86/intel/vsec: Restore BAR fallback for header
> >walk
> >
> >On Wed, Jun 03, 2026 at 06:32:32PM +0000, Ruhl, Michael J wrote:
> >> >-----Original Message-----
> >> >From: David E. Box <david.e.box@linux.intel.com>
> >> >Sent: Friday, May 29, 2026 2:32 PM
> >> >To: ilpo.jarvinen@linux.intel.com; Ruhl, Michael J
> ><michael.j.ruhl@intel.com>;
> >> >david.e.box@linux.intel.com
> >> >Cc: Brost, Matthew <matthew.brost@intel.com>;
> >> >thomas.hellstrom@linux.intel.com; intel-xe@lists.freedesktop.org; linux-
> >> >kernel@vger.kernel.org; platform-driver-x86@vger.kernel.org
> >> >Subject: [PATCH] platform/x86/intel/vsec: Restore BAR fallback for header
> >walk
> >> >
> >> >The base_addr refactor changed intel_vsec_walk_header() to pass
> >> >info->base_addr as the discovery-table base address. For the PCI VSEC
> >> >driver this info comes from driver_data, but exported callers may provide
> >> >their own static headers and leave base_addr unset.
> >> >
> >> >For xe, this made the discovery-table base address zero instead of the BAR
> >> >selected by header->tbir, preventing PMT endpoints from being created.
> >> >
> >> >Restore the previous behavior for the header-walk path by falling back to
> >> >pci_resource_start(pdev, header->tbir) when base_addr is not specified.
> >> >Keep explicit base_addr override behavior unchanged.
> >> >
> >> >This preserves the refactor structure while fixing the functional
> >> >regression in manual-header users.
> >> >
> >> >Fixes: 904b333fc51c ("platform/x86/intel/vsec: Refactor base_addr
> >handling")
> >> >Assisted-by: Claude:claude-sonnet-4-6
> >> >Signed-off-by: David E. Box <david.e.box@linux.intel.com>
> >> >---
> >> > drivers/platform/x86/intel/vsec.c | 17 ++++++++++++++++-
> >> > 1 file changed, 16 insertions(+), 1 deletion(-)
> >> >
> >> >diff --git a/drivers/platform/x86/intel/vsec.c
> >> >b/drivers/platform/x86/intel/vsec.c
> >> >index 1657834fd275..3c6d8a1928c0 100644
> >> >--- a/drivers/platform/x86/intel/vsec.c
> >> >+++ b/drivers/platform/x86/intel/vsec.c
> >> >@@ -482,10 +482,25 @@ static int intel_vsec_walk_header(struct device
> >> >*dev,
> >> > 				  const struct intel_vsec_platform_info *info)
> >> > {
> >> > 	struct intel_vsec_header **header = info->headers;
> >> >+	u64 base_addr;
> >> > 	int ret;
> >> >
> >> > 	for ( ; *header; header++) {
> >> >-		ret = intel_vsec_register_device(dev, *header, info, info-
> >>base_addr);
> >> >+		if (info->base_addr) {
> >> >+			base_addr = info->base_addr;
> >> >+		} else {
> >> >+			struct pci_dev *pdev;
> >> >+
> >> >+			if (!dev_is_pci(dev)) {
> >> >+				dev_err(dev, "non-PCI device without a base
> >address\n");
> >> >+				return -EINVAL;
> >> >+			}
> >> >+
> >> >+			pdev = to_pci_dev(dev);
> >> >+			base_addr = pci_resource_start(pdev, (*header)->tbir);
> >>
> >> Alternate:
> >>
> >> if (!info->base_addr) {
> >> 	struct pci_dev *pdev;
> >>
> >> 	if (!dev_is_pci(dev)) {
> >> 		dev_err(dev, "non-PCI device without a base address\n");
> >> 		return -EINVAL;
> >> 	}
> >>
> >> 	pdev = to_pci_dev(dev);
> >> 	info->base_addr = pci_resource_start(pdev, (*header)->tbir);}
> >> }
> >
> >Thanks. I'll do this in the next patch.
> 
> Looking at one of your follow-on patches, I see that you are setting the info to const...
> 
> So setting the base_addr here, might not be "correct"?
> 
> M
> 
> >>
> >> Would it make sense to require the caller to fill this in?
> >>
> >> i.e. if (!info->base_addr) return EINVAL?
> >>
> >> Change of behavior, but forcing the caller to provide the right info seems
> >reasonable.
> >
> >Agreed. But that would be separate from this fixup patch.
> >
> >>
> >> Either way, this looks reasonable to me.
> >>
> >> Reviewed-by: Michael J. Ruhl <michael.j.ruhl@intel.com>

Hi David,

Could you please enlighten me if I should expect an update to this patch 
or not?

While understanding it doesn't look critical for this patch, I'm unsure 
what follow-up patches you folks are talking about?

-- 
 i.


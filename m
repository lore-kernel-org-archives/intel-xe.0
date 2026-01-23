Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9A58D74EDA
	for <intel-xe@archiver.kernel.org>; Fri, 23 Jan 2026 14:29:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DF4E10EAFF;
	Fri, 23 Jan 2026 14:29:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RmSz653N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35F6010EB04;
 Fri, 23 Jan 2026 14:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769178569; x=1800714569;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+Ljz6X3pg9b4MwaJws3QtPQtxP1Uq8JbUBRAeoxtbxA=;
 b=RmSz653NLOBPTugZ8Ehm1Is5NLKc7MJIf2A4FGX1CmeAph7E1quqwow1
 zkAaO69HjiMb1qzcqhDnMZZdq2CccFTeh2o7/5HFaiaWq3nXoR0wX00rD
 A9ny4af1T//aI1A1nmkI5D2bjtsg16H8gq2TfcT7nlqLDIgeeg2gFVibp
 golJnXYE/hfbGkIv34Brqt9yiVFGrVkRrW1CtftWt/85xMV3aYDRdZlln
 rtFvFRNTONSm36C32xhyRob5FfcM1GOwzptLjaCXYTD828oew9cuCCAj3
 zz9mdRwkpVX+2AoOM20l6wYqVuURxktDAx6UPcwtWwSe/MlyUAEG+JInl Q==;
X-CSE-ConnectionGUID: SODJmmrvRxKfp9Jrwnzr0w==
X-CSE-MsgGUID: trxKDlF4Qt+SeJjO4ubNWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="81149432"
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; d="scan'208";a="81149432"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2026 06:29:29 -0800
X-CSE-ConnectionGUID: bYkkBBiGRg2dCQ2FL/a/+Q==
X-CSE-MsgGUID: nUsLlEU+RQ6lKtH5Cp735Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; d="scan'208";a="211161237"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.246.8])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2026 06:29:26 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Subject: Re: [PATCH i-g-t 6/7] lib/igt_device_scan: Don't print bridge not
 applicable attributes
Date: Fri, 23 Jan 2026 15:29:23 +0100
Message-ID: <3672367.iIbC2pHGDl@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <DFVX2N7U0WJA.UOCF6Q7ATIMG@intel.com>
References: <20260121114656.1970684-9-janusz.krzysztofik@linux.intel.com>
 <20260121114656.1970684-15-janusz.krzysztofik@linux.intel.com>
 <DFVX2N7U0WJA.UOCF6Q7ATIMG@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
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

Hi Sebastian,

On Friday, 23 January 2026 12:03:09 CET Sebastian Brzezinka wrote:
> Hi Janusz,
> 
> On Wed Jan 21, 2026 at 12:42 PM CET, Janusz Krzysztofik wrote:
> > In addition to properties and attributes obtained from udev, print
> > functions also list some library specific attributes: drm_card,
> > drm_render and codename.  Those not necessarily make sense for PCIe
> > bridge upstream ports that follow their PCI GPU devices on the listing.
> > Skip them.
> >
> > Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> > ---
> >  lib/igt_device_scan.c | 8 ++++++--
> >  1 file changed, 6 insertions(+), 2 deletions(-)
> >
> > diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
> > index 7c58ab84e8..e86da001a9 100644
> > --- a/lib/igt_device_scan.c
> > +++ b/lib/igt_device_scan.c
> > @@ -204,6 +204,7 @@ enum dev_type {
> >  	DEVTYPE_ALL,
> >  	DEVTYPE_INTEGRATED,
> >  	DEVTYPE_DISCRETE,
> > +	DEVTYPE_BRIDGE,
> >  };
> >  
> >  #define STR_INTEGRATED "integrated"
> > @@ -1055,6 +1056,8 @@ static void update_or_add_parent(struct udev *udev,
> >  
> >  	bridge_idev = find_or_add_igt_device(udev, bridge_dev, limit_attrs);
> >  	igt_assert(bridge_idev);
> > +
> > +	bridge_idev->dev_type = DEVTYPE_BRIDGE;
> >  }
> >  
> >  static struct igt_device *duplicate_device(struct igt_device *dev) {
> > @@ -1313,7 +1316,8 @@ igt_devs_print_simple(struct igt_list_head *view,
> >  			if (is_pci_subsystem(dev)) {
> >  				_pr_simple("vendor", dev->vendor);
> >  				_pr_simple("device", dev->device);
> > -				_pr_simple("codename", dev->codename);
> > +				if (dev->dev_type != DEVTYPE_BRIDGE)
> > +					_pr_simple("codename", dev->codename);
> >  			}
> >  		}
> >  		printf("\n");
> > @@ -1465,7 +1469,7 @@ igt_devs_print_detail(struct igt_list_head *view,
> >  	igt_list_for_each_entry(dev, view, link) {
> >  		printf("========== %s:%s ==========\n",
> >  		       dev->subsystem, dev->syspath);
> > -		if (!is_drm_subsystem(dev)) {
> > +		if (!is_drm_subsystem(dev) && dev->dev_type != DEVTYPE_BRIDGE) {
> >  			_print_key_value("card device", dev->drm_card);
> >  			_print_key_value("render device", dev->drm_render);
> >  			_print_key_value("codename", dev->codename);
> 
> Could this be merged with patch 7? Most of this will be removed in the next patch anyway.

If there are no cons from other reviewers for whom that split into two 
patches, intended to improve their readability, should be better preserved, 
then yes, I can merge them.

Thanks,
Janusz

> 
> 





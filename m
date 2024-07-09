Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93D20C3DA41
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jul 2024 11:57:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43FE910E51E;
	Tue,  9 Jul 2024 11:57:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PJluGPU3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75CE410E514
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jul 2024 11:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720526240; x=1752062240;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Vg6gstoKV/RICH2trdedWqr/qWQ4anS9wtZ67M41T88=;
 b=PJluGPU3jrNRTKJ/r943Y4EASeH4zo+KPd2pAGDpi3KyXhXMut83GwE2
 MJNwDXFQfUlwyU8mx7dG0Ix4KbjYXWI/oD1wG8Qgw/HMm4vnyGeGcO11Z
 lUmSbkgFoXQR3aTN1MyO3p+bdcDWgUG/LKkL6WaYcKmdD4jdSItLmvqML
 JN6G6ipSvs3YAWp8RoRWRu37CX7SpgiolnNr8z0x++7BHTvO0gcC8Hdsg
 T+qnR5cgP97umIZAPdEvfAMVqAnOe6Xp93Irl8YCqKt44qlpx9D3xIoaZ
 ZwJUxl2Hn2/YK77Cf4Q81LsnPlKX3aAMenJnpSiOp4p2cujHEAEkpmEkV Q==;
X-CSE-ConnectionGUID: 6K5yruSSTSWokILydapDxA==
X-CSE-MsgGUID: cwkYB13US661X7TyjWSGRA==
X-IronPort-AV: E=McAfee;i="6700,10204,11127"; a="17911932"
X-IronPort-AV: E=Sophos;i="6.09,194,1716274800"; d="scan'208";a="17911932"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2024 04:57:20 -0700
X-CSE-ConnectionGUID: dIC9M6TaQyWQEbg+CloQQA==
X-CSE-MsgGUID: EnOFMzMITzqm+uCmwgy7tQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,194,1716274800"; d="scan'208";a="47921834"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.59])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2024 04:57:19 -0700
Date: Tue, 9 Jul 2024 13:57:16 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH 2/2] drm/xe: Use 64K pages for scanout buffers for Xe2
Message-ID: <20240709115716.qcgtcsysctoydgwm@zkempczy-mobl2>
References: <20240709111231.490440-1-zbigniew.kempczynski@intel.com>
 <20240709111231.490440-3-zbigniew.kempczynski@intel.com>
 <2a5772c2-8956-4de9-b4b6-e13260209241@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2a5772c2-8956-4de9-b4b6-e13260209241@intel.com>
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

On Tue, Jul 09, 2024 at 12:26:15PM +0100, Matthew Auld wrote:
> On 09/07/2024 12:12, Zbigniew Kempczyński wrote:
> > Set Xe2 platforms to use 64K pages for display.
> > 
> > Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > Cc: Matthew Auld <matthew.auld@intel.com>
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_pci.c | 1 +
> >   1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> > index 53b67f39c7d5..b629145d23fa 100644
> > --- a/drivers/gpu/drm/xe/xe_pci.c
> > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > @@ -177,6 +177,7 @@ static const struct xe_graphics_desc graphics_xe2 = {
> >   	.name = "Xe2_LPG / Xe2_HPG",
> >   	XE2_GFX_FEATURES,
> > +	.vram_flags = XE_VRAM_FLAGS_DISPLAY_NEED64K,
> 
> This change will also apply to lnl, but I don't think we have a way of
> forcefully getting 64K pages for system memory atm. Do we just need this for
> bmg or is it really all of xe2?

Issue we've seen was on BMG. Do you suggest to separate BMG desc entry
to keep LNL intact?

--
Zbigniew

> 
> >   };
> >   static const struct xe_media_desc media_xem = {

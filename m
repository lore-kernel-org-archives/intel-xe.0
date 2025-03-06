Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01550C282D1
	for <intel-xe@archiver.kernel.org>; Thu,  6 Mar 2025 19:19:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD40910E1B9;
	Thu,  6 Mar 2025 19:19:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ESH/htW0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E20A10E1B9
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Mar 2025 19:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741288793; x=1772824793;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=1Lc+13aVqG5+aU+nAikZsW/JWxqul0wUbwVk7WRAVXE=;
 b=ESH/htW0GDDgHWtatVQ//yUqYwFhxz7Jf0pFt8ORuzOByeaIz65BiCEN
 whtOc7VCGMPGvtRYi8Vu0FPJeaVRI1bXsx8M3bYLNTUzJupaDXrX3unWD
 iUOU16cVd1J37v1UjTSVqz5Zesgvsbw5jgBLeeEavoam7kY4MzjZxBsI5
 EK4vOxUbIUAsR1mVBXPL22PNqISEOfp5fBZA1UP4AcuFkzwW1ZNmuFUgy
 OMbwnIV1QcJFidpzGTB/02XLr4m0yDn/+VKkKq4Fpou6tobpv2WhXk5Pg
 z1rxdTAlfUWDzjbyrtchUylmIBiII1805ovymUaN0N0YxQADeXKHcDfTH w==;
X-CSE-ConnectionGUID: fxQWj0deQLGEPHq9ec0qmA==
X-CSE-MsgGUID: CHP4/extRmm30a1tLPyN5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="42207114"
X-IronPort-AV: E=Sophos;i="6.14,227,1736841600"; d="scan'208";a="42207114"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 11:19:53 -0800
X-CSE-ConnectionGUID: yMZXuNRpR62GxcA8EEoXGw==
X-CSE-MsgGUID: QRutESbBRHiTSCCfAELpyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="156334452"
Received: from black.fi.intel.com ([10.237.72.28])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 11:19:50 -0800
Date: Thu, 6 Mar 2025 21:19:47 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
Cc: lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 anshuman.gupta@intel.com, badal.nilawar@intel.com,
 riana.tauro@intel.com, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH v1] drm/xe/pcode: stop logging mailbox status as error
Message-ID: <Z8n1Uy1hqAkYxeFE@black.fi.intel.com>
References: <20250304061727.452100-1-raag.jadav@intel.com>
 <29d173b4-4cac-4765-a13e-8723b44f5270@linux.intel.com>
 <Z8ljepyswfhWhl05@black.fi.intel.com>
 <816f679f-e981-4ee5-9c19-31b2881b11e4@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <816f679f-e981-4ee5-9c19-31b2881b11e4@linux.intel.com>
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

On Thu, Mar 06, 2025 at 03:17:16PM +0530, Aravind Iddamsetty wrote:
> On 06-03-2025 14:27, Raag Jadav wrote:
> > On Thu, Mar 06, 2025 at 10:08:07AM +0530, Aravind Iddamsetty wrote:
> >> Hi Raag,
> >>
> >> On 04-03-2025 11:47, Raag Jadav wrote:
> >>> Since we're expecting many platform specific mailbox commands that
> >>> might not be widely supported, stop logging them as errors. With this
> >>> we can avoid unnecessary platform checks and use the return value of
> >>> mailbox without enraging CI.
> >> are you saying there are cases where we send a command that is not supported
> >> on a particular platform?
> > Yes. First instance on [1], which will be expanded with more commands.
> >
> > [1] https://lore.kernel.org/r/20250210100515.2205584-1-raag.jadav@intel.com/
> 
> But why should we expose the interface which is not supported on that HW.

Not sure if you actually looked at the patch, but it's not exposing
unsupported feature. It's deciding whether to expose based on mailbox
error, which is most likely a one off thing at boot.

Raag

> >>> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> >>> ---
> >>>  drivers/gpu/drm/xe/xe_pcode.c | 2 +-
> >>>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
> >>> index 9333ce776a6e..280f69119ff1 100644
> >>> --- a/drivers/gpu/drm/xe/xe_pcode.c
> >>> +++ b/drivers/gpu/drm/xe/xe_pcode.c
> >>> @@ -46,7 +46,7 @@ static int pcode_mailbox_status(struct xe_tile *tile)
> >>>  
> >>>  	err = xe_mmio_read32(&tile->mmio, PCODE_MAILBOX) & PCODE_ERROR_MASK;
> >>>  	if (err) {
> >>> -		drm_err(&tile_to_xe(tile)->drm, "PCODE Mailbox failed: %d %s", err,
> >>> +		drm_dbg(&tile_to_xe(tile)->drm, "PCODE Mailbox failed: %d %s", err,
> >>>  			err_decode[err].str ?: "Unknown");
> >>>  		return err_decode[err].errno ?: -EPROTO;
> >>>  	}

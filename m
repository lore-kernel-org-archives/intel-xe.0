Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D231AE75457
	for <intel-xe@archiver.kernel.org>; Tue,  3 Oct 2023 12:59:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9926410E2A9;
	Tue,  3 Oct 2023 12:59:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FF2F10E2A5;
 Tue,  3 Oct 2023 12:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696337945; x=1727873945;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=zKlkaAgnEjQsDarr4vW/Z7F87//Uxp4Ezqyi7LtddYo=;
 b=Tn+fc7nP9la8A/RuAc3FtVMavcxaY5u6e2+cha6fiebiLh/kBBY08pGW
 YTpragUzdSq4X9eaiABgDS7uK+rFakzVRwbh4SCcsJefX/mURTyWzChYG
 KxlGpzf2L+W8FMGwqO7sbaPvh0t1nqoZb1irdiQc2aQQ6wS8tgcIYtyJz
 //QZCOvPLU8HMyZwsYCr75YSf7GS+mVp+oPoT12+LvCBTj0fBajC/nC+G
 FqjQbfBFe38XXiI3qtOnKKcCSc83lFCQcAFTfu47IGAUPKR+I/UYDPOgY
 fheIyEO2GzqgHX83GteJNtw75kfrv2OwpZfcn+k27clphNuB8nu7mVhYB w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="447024046"
X-IronPort-AV: E=Sophos;i="6.03,197,1694761200"; d="scan'208";a="447024046"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 05:58:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="727605123"
X-IronPort-AV: E=Sophos;i="6.03,197,1694761200"; d="scan'208";a="727605123"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.153])
 by orsmga006.jf.intel.com with SMTP; 03 Oct 2023 05:58:03 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 03 Oct 2023 15:58:03 +0300
Date: Tue, 3 Oct 2023 15:58:03 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Vinod Govindapillai <vinod.govindapillai@intel.com>
Message-ID: <ZRwP22BZQseg6vW4@intel.com>
References: <20230922133003.150578-1-vinod.govindapillai@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230922133003.150578-1-vinod.govindapillai@intel.com>
X-Patchwork-Hint: comment
Subject: Re: [Intel-xe] [PATCH v5 0/2] fbc on any planes
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
Cc: ville.syrjala@intel.com, intel-gfx@lists.freedesktop.org,
 matthew.d.roper@intel.com, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Sep 22, 2023 at 04:30:01PM +0300, Vinod Govindapillai wrote:
> FBC can be supported in first three planes in lnl
> 
> Vinod Govindapillai (2):
>   drm/i915/lnl: possibility to enable FBC on first three planes
>   drm/i915/lnl: update the supported plane formats with FBC

Pushed to drm-intel-next. Thanks.

> 
>  drivers/gpu/drm/i915/display/intel_fbc.c           | 11 ++++++++++-
>  drivers/gpu/drm/i915/display/skl_universal_plane.c |  9 ++++++---
>  drivers/gpu/drm/i915/i915_reg.h                    |  2 ++
>  3 files changed, 18 insertions(+), 4 deletions(-)
> 
> -- 
> 2.34.1

-- 
Ville Syrjälä
Intel

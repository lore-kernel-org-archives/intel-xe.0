Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64C8DEDB7E7
	for <intel-xe@archiver.kernel.org>; Tue,  7 Apr 2026 10:00:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2323610E3AE;
	Tue,  7 Apr 2026 10:00:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f0Sy5Ru0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C32310E3A8;
 Tue,  7 Apr 2026 10:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775556011; x=1807092011;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=7K2R+H3MpKkF7azA+fxgNpySAsv/bFhh5ehDk38Agn4=;
 b=f0Sy5Ru0StWOjLKxDSGEpdF62jdK6Vp0XMYXZt12/eW7eXLsn7h4hUVQ
 fhJp4ovN/j4m7IZ5ZuNXjJLoFbBz7FyGEqKhma/EjCAlTmNDfXzTS3/S1
 a492BGURlP4qbt0mIDZmRZ1vIPGXDXLTZrnMHWfsythhCnqxlzkM5PYyA
 IFceJd/2/NlOcpY5TUzHIZXHvPQo+OlIae2zFRti3NYPJjPjXMeW2ka4L
 y4I8hEI2XgMZJNzmeLZtI5uKjuOs3HDGfkY7a3aI5+FJi7KHtkejG6BYS
 NjYbnsct2lfDgLnLjsDs/2u2P5NV5VIDHjUbWAkjTA/NpXzS3zTm1nORU g==;
X-CSE-ConnectionGUID: 2YUvBMnWS+6fvTyvAaLG3A==
X-CSE-MsgGUID: HhXwmRyOQeWG/M+c2Ae2uw==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="87140545"
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; d="scan'208";a="87140545"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 03:00:10 -0700
X-CSE-ConnectionGUID: W1ZgsQA8SQCyGDT5PCx8BQ==
X-CSE-MsgGUID: zG+5B5S8QaaxMIM8mrqt4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; d="scan'208";a="227291745"
Received: from zzombora-mobl1 (HELO localhost) ([10.245.244.84])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 03:00:08 -0700
Date: Tue, 7 Apr 2026 13:00:00 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: Animesh Manna <animesh.manna@intel.com>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 uma.shankar@intel.com, dibin.moolakadan.subrahmanian@intel.com
Subject: Re: [PATCH v3 03/12] drm/i915/cmtg: set timings for CMTG
Message-ID: <adTVoIgNc0K3_Zok@intel.com>
References: <20260313153300.3530695-1-animesh.manna@intel.com>
 <20260313153300.3530695-4-animesh.manna@intel.com>
 <2fd3f2334a8a85590a74c0636b941f31ddf9aba3@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2fd3f2334a8a85590a74c0636b941f31ddf9aba3@intel.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

On Tue, Apr 07, 2026 at 11:03:37AM +0300, Jani Nikula wrote:
> On Fri, 13 Mar 2026, Animesh Manna <animesh.manna@intel.com> wrote:
> > +#define TRANS_HTOTAL_CMTG(trans)	_MMIO(0x6F000 + (trans) * 0x100)
> > +#define TRANS_HBLANK_CMTG(trans)	_MMIO(0x6F004 + (trans) * 0x100)
> > +#define TRANS_HSYNC_CMTG(trans)		_MMIO(0x6F008 + (trans) * 0x100)
> > +#define TRANS_VTOTAL_CMTG(trans)	_MMIO(0x6F00C + (trans) * 0x100)
> > +#define TRANS_VBLANK_CMTG(trans)	_MMIO(0x6F010 + (trans) * 0x100)
> > +#define TRANS_VSYNC_CMTG(trans)		_MMIO(0x6F014 + (trans) * 0x100)
> > +
> > +#define TRANS_SET_CTX_LATENCY_CMTG(trans)	_MMIO(0x6F07C + (trans) * 0x100)

These are all just normal transcoder registers, so no new definitions
should be necessary at all.

> 
> We have a bunch of helpers to avoid doing the manual multiplication
> here.
> 
> BR,
> Jani.
> 
> 
> -- 
> Jani Nikula, Intel

-- 
Ville Syrjälä
Intel

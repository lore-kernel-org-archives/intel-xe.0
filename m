Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6FBECCF9E5
	for <intel-xe@archiver.kernel.org>; Mon, 27 Oct 2025 11:50:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9F9310E451;
	Mon, 27 Oct 2025 11:50:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CDPCBYCL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C602610E448
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Oct 2025 11:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761565847; x=1793101847;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=HMWB6M1TlKbtS3/Nmofvn6oqLiCClyE4xawPdgEwTBE=;
 b=CDPCBYCL+MvWVCh0v7KEIK8dHDvtuVIK4PjeBiVtONRFySDgJgyUIQFH
 09/q/tJz5OlUWrA1srdDeDB/TiyfrCAFQEIlYvKssXITu0wmCMY2NI3xK
 O2epL5/Pfi7Y7AC/BgkVRDTGwM5I2L1LWwmHxLfR3UBIAQoeKJTLhiiJ3
 l1ivmdDwUwdXgF1qtyUlB/ctr+IMFkRDpnKcFVnSyz+R4CxgG33AV9Ew+
 YjHPrbGFWQxWaRoiKjAVAwvho5tM8qPvanYKkJNezNP5EQk9mEunQgzvk
 0WvKd061bViv4EQxP5rF1cc3JkAv7f9U3HK3BkfwtoRx03KkItmT++RgL A==;
X-CSE-ConnectionGUID: 9HlTnHO/QaS7QXXGul/IUQ==
X-CSE-MsgGUID: ZC/d+96MS7igncaoA0uLyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74984949"
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; d="scan'208";a="74984949"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 04:50:47 -0700
X-CSE-ConnectionGUID: xlgkszGARLKPkmkKpa21Kw==
X-CSE-MsgGUID: Vkvt/T9cSZ2Gk4J0aGFK1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; d="scan'208";a="208639419"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 04:50:45 -0700
Date: Mon, 27 Oct 2025 12:50:43 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v2 8/8] drm/xe/gt_throttle: Avoid TOCTOU when monitoring
 reasons
Message-ID: <aP9ckwuSMtXlzSpd@black.igk.intel.com>
References: <20251026-gt-throttle-cri-v2-0-41f8288a71a7@intel.com>
 <20251026-gt-throttle-cri-v2-8-41f8288a71a7@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251026-gt-throttle-cri-v2-8-41f8288a71a7@intel.com>
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

On Sun, Oct 26, 2025 at 10:57:20PM -0700, Lucas De Marchi wrote:
> It's currently not possible to safely monitor if there's throttling
> happening and what are the reasons. The approach of reading the status
> and then reading the reasons is not reliable as by the time sysadmin
> reads the reason, the throttling could not be happening anymore.
> 
> Previous tentative to fix that[1] was breaking the ABI and potentially
> sysadmin's scripts. This takes a different approach of adding and
> documenting the additional attribute. It's still valuable, though
> redundant, to provide the simpler 0/1 interface.
> 
> In order to avoid userspace knowledge on the bitmask meaning and to be
> able to maintain the kernel side in sync with possible changes in
> future, just walk the attribute group and check what are the masks that
> match the value read.
> 
> [1] https://lore.kernel.org/intel-xe/20241025092238.167042-1-raag.jadav@intel.com/

Thanks for looking into this, but following the recent developments on [2]
I'm beginning to have my doubts about this.

I don't have any strong opinions but we can probably hold on to this one
until we reach some conclusion on the matter.

[2] https://lore.kernel.org/intel-xe/20251014053257.3417575-2-riana.tauro@intel.com/

Raag

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EB7CEDB7CC
	for <intel-xe@archiver.kernel.org>; Tue,  7 Apr 2026 08:03:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14A4710E362;
	Tue,  7 Apr 2026 08:03:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UbgtMtAn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A4BB10E345;
 Tue,  7 Apr 2026 08:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775549024; x=1807085024;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=v4dp19VP3tZ+HbN0Y7aKOqz1PVgVK+6d03+sUqv/nYs=;
 b=UbgtMtAnYMILZ+i0Qc7O6dKi8Xd51efFpRVUVLIy+XMu99YUGnKVgSrY
 2cbMlaQGaeYmNJpw/GRuBRBO/RyK3JLP+Fmc+U6tVbSekcmhLydzD8Ps3
 TJ3fyFLx53uJzUaafprien/32e4KsRi+yx6Yf5IZ+YMNVCHtJWnD3O3ZM
 kdthCAZkAFA7mdLX6Zwb/xKidNfG5+jpinD4yOzfWSdpuMJlfoETn00td
 ujLwFJAzZ8sooLQlgQv1BMPcg4NcgGkv4IkxCRJleQkS7vy+g2tyepPhX
 LD7e4IPLmltXUX0pog+GpaqczgqCS7Cmmk/r8tp3qjG3LX4OjUsSN2zbn A==;
X-CSE-ConnectionGUID: ROxZ9qozTs2MgSSZgZnF7Q==
X-CSE-MsgGUID: 86YixIWKQy6ExPw6yX3mIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="99131810"
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; d="scan'208";a="99131810"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 01:03:44 -0700
X-CSE-ConnectionGUID: xnYEbeQBTsKD0JA6r37sqQ==
X-CSE-MsgGUID: eYqKXeY2SWCpjxJ4/iEhRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; d="scan'208";a="223792447"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.244])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 01:03:41 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Animesh Manna <animesh.manna@intel.com>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Cc: uma.shankar@intel.com, dibin.moolakadan.subrahmanian@intel.com, Animesh
 Manna <animesh.manna@intel.com>
Subject: Re: [PATCH v3 03/12] drm/i915/cmtg: set timings for CMTG
In-Reply-To: <20260313153300.3530695-4-animesh.manna@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260313153300.3530695-1-animesh.manna@intel.com>
 <20260313153300.3530695-4-animesh.manna@intel.com>
Date: Tue, 07 Apr 2026 11:03:37 +0300
Message-ID: <2fd3f2334a8a85590a74c0636b941f31ddf9aba3@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Fri, 13 Mar 2026, Animesh Manna <animesh.manna@intel.com> wrote:
> +#define TRANS_HTOTAL_CMTG(trans)	_MMIO(0x6F000 + (trans) * 0x100)
> +#define TRANS_HBLANK_CMTG(trans)	_MMIO(0x6F004 + (trans) * 0x100)
> +#define TRANS_HSYNC_CMTG(trans)		_MMIO(0x6F008 + (trans) * 0x100)
> +#define TRANS_VTOTAL_CMTG(trans)	_MMIO(0x6F00C + (trans) * 0x100)
> +#define TRANS_VBLANK_CMTG(trans)	_MMIO(0x6F010 + (trans) * 0x100)
> +#define TRANS_VSYNC_CMTG(trans)		_MMIO(0x6F014 + (trans) * 0x100)
> +
> +#define TRANS_SET_CTX_LATENCY_CMTG(trans)	_MMIO(0x6F07C + (trans) * 0x100)

We have a bunch of helpers to avoid doing the manual multiplication
here.

BR,
Jani.


-- 
Jani Nikula, Intel

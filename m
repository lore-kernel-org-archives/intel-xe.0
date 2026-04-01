Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67A31D35145
	for <intel-xe@archiver.kernel.org>; Wed,  1 Apr 2026 13:16:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 221ED10F0E5;
	Wed,  1 Apr 2026 13:16:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mlmj66CY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4895610E209;
 Wed,  1 Apr 2026 13:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775049388; x=1806585388;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=Zme4EORxb62mE3Gz7iyiSunA8aKnHeRnkKkuESSBcOk=;
 b=mlmj66CY3YO+1N8bpz8+KS713Kz4bBsBhfmqxicOqYu4ZrD3poIHRU4i
 Xo0WDn1FL1bt2rzWbcrH6CQMgHC3oD7BXerfxuMtTfPdSnZUiIvTNO3ZQ
 XG8Rs2IrBRtqN60keaa48R1xEGVSst9JWiJMuY4A7FGKJ27P4G4YYx800
 YQ6sKBTNXbrO56Nj5ommD9/IOTUdsoGRbvIytkmIrnr+Iy+3b1hYhNfrm
 75xcNBx4SnPGCNKJkPX9j4HGjmf/LC1SJ0ypDwniGmNSKoTgI2rEBepUG
 QISCwx7goACicbB9TUdW75Z4TrJ6XP0EOjVCj49Q+4Wrj2ZMJqAUxdDcC A==;
X-CSE-ConnectionGUID: 0+bU9M4zSzGw3tjLhKyODQ==
X-CSE-MsgGUID: 6jlnWr8pSJC6vZsA/NWGzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="76201311"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="76201311"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 06:16:27 -0700
X-CSE-ConnectionGUID: XzMBAfNSQdWKwlsuWtPI5Q==
X-CSE-MsgGUID: rmDiZ7X8TpKXF/WYxs6TVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="231081173"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.152])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 06:16:25 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH v2 00/12] drm/i915: More uncore nukage from display code
In-Reply-To: <20260331154259.24600-1-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260331154259.24600-1-ville.syrjala@linux.intel.com>
Date: Wed, 01 Apr 2026 16:16:22 +0300
Message-ID: <ccd24c66f09b7e743f2de36c87c8653ba3578d14@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Tue, 31 Mar 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Ggt rid of more intel_uncore stuff from the display code:
> - new intel_mchbar_read*() abstraction for MCHBAR registers
> - some direct replacement of intel_uncore_{read,write}()
>   with intel_de_{read,write}()
>
> v2: Fix bisection on xe (nop intel_uncore_read64())
>     Deal with review comments

Yeah, still looking good.

BR,
Jani.

>
> Ville Syrj=C3=A4l=C3=A4 (12):
>   drm/i915/qgv: Use intel_de_read() for MTL_MEM_SS_INFO* reads
>   drm/i915/mchbar: Provide intel_mchbar_read*() abstraction
>   drm/i915/mchbar: Define the end of the MCHBAR mirror
>   drm/i915/mchbar: WARN when accessing non-MCHBAR registers via
>     intel_mchbar_read*()
>   drm/i915/mchbar: Use intel_mchbar_read() instead of intel_de_read()
>   drm/i915/mchbar: Use intel_mchbar_read*() instead of
>     intel_uncore_read*()
>   drm/i915/de: Add intel_de_read16()
>   drm/i915/de: s/intel_de_read64_2x32()/intel_de_read64_2x32_volatile()/
>   drm/i915/de: Add a simple intel_de_read64_2x32()
>   drm/i915/vrr: Use intel_de_read64_2x32()
>   drm/i915/mchbar: Use intel_de_read*() for MCHBAR register accesses
>   drm/i915/rom: Use intel_de for SPI ROM register access
>
>  drivers/gpu/drm/i915/Makefile                 |  1 +
>  drivers/gpu/drm/i915/display/i9xx_wm.c        | 10 +--
>  drivers/gpu/drm/i915/display/intel_bw.c       | 17 ++--
>  drivers/gpu/drm/i915/display/intel_cdclk.c    |  5 +-
>  drivers/gpu/drm/i915/display/intel_de.c       |  8 ++
>  drivers/gpu/drm/i915/display/intel_de.h       | 17 +++-
>  .../drm/i915/display/intel_display_power.c    |  3 +-
>  drivers/gpu/drm/i915/display/intel_dram.c     | 33 +++-----
>  drivers/gpu/drm/i915/display/intel_mchbar.c   | 79 +++++++++++++++++++
>  drivers/gpu/drm/i915/display/intel_mchbar.h   | 19 +++++
>  drivers/gpu/drm/i915/display/intel_rom.c      | 19 ++---
>  drivers/gpu/drm/i915/display/intel_vblank.c   |  4 +-
>  drivers/gpu/drm/i915/display/intel_vrr.c      |  6 +-
>  drivers/gpu/drm/i915/intel_mchbar_regs.h      |  7 +-
>  drivers/gpu/drm/xe/Makefile                   |  1 +
>  15 files changed, 172 insertions(+), 57 deletions(-)
>  create mode 100644 drivers/gpu/drm/i915/display/intel_mchbar.c
>  create mode 100644 drivers/gpu/drm/i915/display/intel_mchbar.h

--=20
Jani Nikula, Intel

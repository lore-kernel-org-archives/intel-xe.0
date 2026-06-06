Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BE7DCD8C85
	for <intel-xe@archiver.kernel.org>; Sat,  6 Jun 2026 06:16:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3E00112D4B;
	Sat,  6 Jun 2026 06:15:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cwyTlAQW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F8FF112D4B;
 Sat,  6 Jun 2026 06:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780726559; x=1812262559;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=UcKiY/nP7F5DjOQEGW6cIxPXnLOlTjEn3dLFg0hCOsM=;
 b=cwyTlAQWmVO4XAFSPz9nLVnE3VFGKuWbCa59z03b1mW/7gb3DsKO8mPi
 hJAFDnCR4aBRe6Gr/swiunGBv323MpGQQSK9unNpokRJv7kVKr+EgMO9X
 PfCfMXBImkKIoXAXCyzM+YFbPXp2fYCQLHGaj1x0w2KpguuacX/jUJMDb
 skHwX6xdFqvrgqlQ4TvFCKaNQJTwtn6Mea9VSJLKQAzvue2beZUyzsn0L
 Tgk0d3ciaAlcZziZh6O47xn2tN+YwHYYaevA949omzQ4RnRL6MM7zOP7z
 I3iAz4M7l5fywcTmDmnZp2mUwt+vrGKXhC/uL9eqGZtdcAJOAOLATXECR w==;
X-CSE-ConnectionGUID: wTKwl0TbQpCZlwTusbkmSw==
X-CSE-MsgGUID: jGPdyXu+SGOfPWGchyT6Ag==
X-IronPort-AV: E=McAfee;i="6800,10657,11808"; a="80583168"
X-IronPort-AV: E=Sophos;i="6.24,190,1774335600"; d="scan'208";a="80583168"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2026 23:15:58 -0700
X-CSE-ConnectionGUID: 2LJeA/bITIejMBB3JsmR7A==
X-CSE-MsgGUID: SpHsHNimSde5eseQbVEBJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,190,1774335600"; d="scan'208";a="249365364"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2026 23:15:56 -0700
Date: Sat, 6 Jun 2026 08:15:53 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 saurabhg.gupta@intel.com, alex.zuo@intel.com, Michal.Wajdeczko@intel.com
Subject: Re: [PATCH v3 3/5] drm/xe/i2c: Use xe print functions in xe_i2c.c
Message-ID: <aiO7GVR1Zp31wDWd@black.igk.intel.com>
References: <20260605210534.3843211-1-jonathan.cavitt@intel.com>
 <20260605210534.3843211-4-jonathan.cavitt@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260605210534.3843211-4-jonathan.cavitt@intel.com>
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

On Sat, Jun 06, 2026 at 05:05:32AM +0800, Jonathan Cavitt wrote:
> Update xe_i2c.c to use the xe error reporting helper functions in
> xe_printk.h instead of directly calling the associated drm print
> functions from drm_print.h
> 
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>

Reviewed-by: Raag Jadav <raag.jadav@intel.com>

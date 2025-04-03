Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53160C3600C
	for <intel-xe@archiver.kernel.org>; Thu,  3 Apr 2025 16:47:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E32D10E29E;
	Thu,  3 Apr 2025 16:47:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YS8Klqti";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD28B10E29E
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Apr 2025 16:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743698878; x=1775234878;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=szh8OgBnB9GDyywcfMTNYI1FRCk+fGsvZPc7OCaioP8=;
 b=YS8KlqtirsNjyaBF+RKZDcSX95N+0crPPxT5SNQQyRUJ/vIBB9FcR1Mb
 1UxPCZjZrzXXmT0Um5lihr64gJndzplYLCHWQbRoiKYMFofd+O2ueyWyM
 Vaq/SbeWeK8AHp9llPy+2qSQM4CogKzvq4utFCmEma2CEf99zR6KtD0MH
 5P/WHbP7TRRcPVcRuC3SQzxfipz4xMGPdHmx1v3zdiJgp0m3WeRWJARL/
 pIku5txNfWP7Bac4+f4sFysrjXdR2hGhT3hnfoK7vOfdegTDbzm3/+blW
 rGsd05z5ycgxrhKoTRnwq0duVbUVBOGF57c+9WcNfMMNyLoGLEkYxztJh Q==;
X-CSE-ConnectionGUID: BXfLG16TQUyv++26bSlvDA==
X-CSE-MsgGUID: K7Ny4xnrRI2GkI6SwDlDfw==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="45217572"
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="45217572"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 09:47:55 -0700
X-CSE-ConnectionGUID: S/IqsGWgSDabNXqj2Tszmw==
X-CSE-MsgGUID: hPrNh0z6TByeH3HepL0o9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="164294331"
Received: from black.fi.intel.com ([10.237.72.28])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 09:47:53 -0700
Date: Thu, 3 Apr 2025 19:47:49 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com
Subject: Re: [PATCH v6 1/3] drm/xe: Add functions and sysfs for boot
 survivability
Message-ID: <Z-67tX1--b3w-Lh1@black.fi.intel.com>
References: <20250128095632.1294722-1-riana.tauro@intel.com>
 <20250128095632.1294722-2-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250128095632.1294722-2-riana.tauro@intel.com>
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

Bumping this since I just discovered something.

On Tue, Jan 28, 2025 at 03:26:30PM +0530, Riana Tauro wrote:

...

> +#define PCODE_SCRATCH(x)		XE_REG(0x138320 + ((x) * 4))

If we're referring to PCODE_FIT_DATA_0_2_0_GTTMMADR[0], it actually
starts from 0x138300.

Anything to worry about here?

Raag

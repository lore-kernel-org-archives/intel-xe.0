Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A520ECA0EE8
	for <intel-xe@archiver.kernel.org>; Wed, 17 Sep 2025 06:45:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4003710E408;
	Wed, 17 Sep 2025 06:45:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mgLiqBLs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB59410E408
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Sep 2025 06:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758091527; x=1789627527;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=4zXbm1/v4fU7jVGsPkCoyyr22+Qd6hMAEJ9vDLXKLec=;
 b=mgLiqBLs/W8CHzAvkDtev0ZJIl/H+1G68+ajc6VYQ1CVlb8uK6QwFihr
 83sQs11IwBVTRxTd0WiWqdAPM8DXnEQj7wy4inXMWyFAfOWH5jd81d4nS
 pXThXdupnKGqzWRGyiIJnSp5euersIPSLVSBtWtRaM3+hD28aTnefrRjM
 5O5ZXsF04cXXWjBAydkgv+VKPGs8XOVXqIQY7Sj76VLEqvd2bSAKNzE4A
 A4Wvloev9+HEoQp6a1liZU74ji5UnrIr976NL6HwreiiIhzENjY2SwPHg
 m0rp5XtWJDoE3KizMLKHZ0RKmJ+di9AmUOI7cZ49+c2xb6EttuY3/TfHN Q==;
X-CSE-ConnectionGUID: zwPl1IJ0SmSUrGT2B4XHXw==
X-CSE-MsgGUID: r0pbHekdStS293xL6uBSwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60305123"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="60305123"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 23:45:03 -0700
X-CSE-ConnectionGUID: XsTy56L8R1KcxRI/BtPGAA==
X-CSE-MsgGUID: GN9z2VslRE+30L6nSopsUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,271,1751266800"; d="scan'208";a="174772887"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 23:44:59 -0700
Date: Wed, 17 Sep 2025 08:44:57 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org, Stuart Summers <stuart.summers@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Riana Tauro <riana.tauro@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>
Subject: Re: [PATCH v5 0/7] drm/xe: Add user commands to WA BB via configfs
Message-ID: <aMpY6YCzN8bhquIe@black.igk.intel.com>
References: <20250916-wa-bb-cmds-v5-0-306bddbc15da@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250916-wa-bb-cmds-v5-0-306bddbc15da@intel.com>
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

On Tue, Sep 16, 2025 at 02:15:37PM -0700, Lucas De Marchi wrote:
> Integrate WA BB (aka post context restore bb) with configfs to allow
> validation to experiment with the GPU, executing commands on every
> context switch.
> 
> Setting some registers to experiment:
> 
> 	# echo 0 > /sys/bus/pci/drivers_autoprobe
> 	# modprobe xe
> 	# mkdir  /sys/kernel/config/xe/0000:03:00.0
> 	# cat > /sys/kernel/config/xe/0000\:03\:00.0/ctx_restore_post_bb  <<EOF
> 	bcs cmd 11000001 4F100 cafebabe
> 	vcs cmd 11000001 4F104 0FF1CE
> 	rcs cmd 11000001 4F108 BAADF00D

I know, and I share your pain :D

Raag

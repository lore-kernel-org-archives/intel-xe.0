Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C58DE677E1
	for <intel-xe@archiver.kernel.org>; Mon, 22 Dec 2025 15:09:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 096C110E4F5;
	Mon, 22 Dec 2025 15:09:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a0Vg8xzv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3395E10E4F5
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Dec 2025 15:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766416177; x=1797952177;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=Xg38P0BVhbVJz83FhLp61aLuiD+2bWYhUjdYODAgS/w=;
 b=a0Vg8xzv+ZX/WoWGNER1FOCAbOgf1fYauW7Q3tPqCfg5LMvbYs+BfIZE
 K9kEI+OZpGw8//6MHCs+zWwbZF5CmP3XPYFXWJousuxSoEijh4UdXvDF1
 /Bk1aGEdJXcsENEqiS2GCBrbkGZMAFioC1/wIkHZDwcfWdCFKGnlXQtHN
 l1rS1Xf6TR+rKlZvpEXaDGaAlGzvumtTt0B7HxrXOVoTKI6GysPFkHB11
 OV2cPY+nS4qU/76dSnU6z9o4O5l/Nm2BUK05pZ5dGTlnJCnFZsJwf/9U9
 Q0b0IpCgqBRxRwL9eR8MKfKR3411prRlhBCdVrnCon7aXIEbIXJM1ONJ5 w==;
X-CSE-ConnectionGUID: 9igbKDjxTQ2JjoVxH+BIVg==
X-CSE-MsgGUID: +KmogccVS8iad5ZaHJTcnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="72119176"
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; d="scan'208";a="72119176"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2025 07:09:37 -0800
X-CSE-ConnectionGUID: N9zTcWAwTES3qoqeIUumBg==
X-CSE-MsgGUID: mzPsjL4sTwKa3xKLAU1SOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; d="scan'208";a="223029816"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.79])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2025 07:09:34 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Chris Russomanno <russomch@aol.com>, intel-xe@lists.freedesktop.org,
 linux-wireless@vger.kernel.org
Subject: Re: [BUG] Intel B580 (e20b) HDMI Flicker & Realtek RTL8922AE 6GHz
 missing - Mint 22.3
In-Reply-To: <AB8446D8-708B-4971-8852-87353112E60F@aol.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <AB8446D8-708B-4971-8852-87353112E60F.ref@aol.com>
 <AB8446D8-708B-4971-8852-87353112E60F@aol.com>
Date: Mon, 22 Dec 2025 17:09:31 +0200
Message-ID: <8dc0f5755ac815c1e828f4a9a62b311925179780@intel.com>
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

On Sat, 20 Dec 2025, Chris Russomanno <russomch@aol.com> wrote:
> Hello,
>
> I am reporting two issues encountered on brand-new hardware using Linux Mint 22.3 with Kernel 6.14.0-generic.
>
> Hardware Environment:
> - GPU: Intel Arc B580 (Battlemage), PCI ID: [8086:e20b]
> - WiFi: Realtek RTL8922AE (rtw89), Firmware: rtw8922a_fw-3.bin
> - Display: Samsung 4K Monitor connected via HDMI (No DisplayPort available)
>
> Issue 1: Intel Xe HDMI Flickering
> The Samsung monitor experiences intermittent black-screen flickering (1-2 seconds) at both 4K and 1080p resolutions. This behavior is not present on Windows 11.
> Troubleshooting attempted:
> - Added kernel parameters: quiet splash i915.enable_psr=0 xe.force_probe=e20b i915.enable_dc=0 intel_iommu=igfx_off intel_idle.max_cstate=2
> - Forced "TearFree" and "TripleBuffer" in xorg.conf.
> - Frequency remains at 60Hz.

See [1] on how to report i915 and xe bugs.

BR,
Jani.


[1] https://drm.pages.freedesktop.org/intel-docs/how-to-file-i915-bugs.html


-- 
Jani Nikula, Intel

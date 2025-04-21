Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D78DC369AB
	for <intel-xe@archiver.kernel.org>; Mon, 21 Apr 2025 17:13:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2526E10E0F9;
	Mon, 21 Apr 2025 17:13:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k6tg2MNQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE74F10E0F9
 for <intel-xe@lists.freedesktop.org>; Mon, 21 Apr 2025 17:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745255599; x=1776791599;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=pvCd4o4jLKx0obrig+qWsZUMMmV2EJ/BbQjRcI94QxQ=;
 b=k6tg2MNQfWhi5s1UINUqJcpxPDucvi7IRDGpfK5++ECN+sw6NgEGGh/g
 ZiN5PPnXYg9hrlhM7p1NurmB19WMTO3ibvO63SBn98LdhinAmNo9wtdHA
 HoHCU29RaOPSE27gGVwdQzdFtshtTu19dx++38l299sfwud+kMMbI125Y
 lmFuUvJfh1bdVHdgvpMme4qleDKvZacgBHRHF3jOBow72mMlweIQppDyV
 ALtEfBBTSepeiczvQeRXakGm3dVrwk5W7Ewn5lmNNH8oN9mzCOD4Jd5+x
 16FGCycnaJxCIxoz8WPZoVzShgF/Wvaz9QLWAu1eBjo6TXouyabMHlUv8 w==;
X-CSE-ConnectionGUID: dAn0LTnaRFS4uC8xhG3VwA==
X-CSE-MsgGUID: ctreX1vATj+izeAgW1psIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11410"; a="46801936"
X-IronPort-AV: E=Sophos;i="6.15,228,1739865600"; d="scan'208";a="46801936"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2025 10:13:18 -0700
X-CSE-ConnectionGUID: aTHx4fFSRcW9rUsE2s/7Lw==
X-CSE-MsgGUID: 5kRNC7N5RvKFV1f05IOp3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,228,1739865600"; d="scan'208";a="136731142"
Received: from black.fi.intel.com ([10.237.72.28])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2025 10:13:16 -0700
Date: Mon, 21 Apr 2025 20:13:13 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org, Badal Nilawar <badal.nilawar@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Ulisses Furquim <ulisses.furquim@intel.com>
Subject: Re: [PATCH 1/2] drm/xe/hwmon: Fix kernel version documentation for
 temperature
Message-ID: <aAZ8qZytCQQrSLez@black.fi.intel.com>
References: <20250421-hwmon-doc-fix-v1-0-9f68db702249@intel.com>
 <20250421-hwmon-doc-fix-v1-1-9f68db702249@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250421-hwmon-doc-fix-v1-1-9f68db702249@intel.com>
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

On Mon, Apr 21, 2025 at 08:15:38AM -0700, Lucas De Marchi wrote:
> Wrong copy and paste from other entries: these are starting to be
> supported with 6.15.

I had an impression that we follow the upstream drm tree, but it seems not?

> Fixes: dac328dea701 ("drm/xe/hwmon: expose package and vram temperature")
> Reported-by: Ulisses Furquim <ulisses.furquim@intel.com>
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4840
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> index adbb9bce15a5d..6fbab98fb639d 100644
> --- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> @@ -111,7 +111,7 @@ Description:	RO. Package current voltage in millivolt.
>  
>  What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp2_input
>  Date:		March 2025
> -KernelVersion:	6.14
> +KernelVersion:	6.15

Perhaps the date should match the release?
https://hansen.beer/~dave/phb/

Raag

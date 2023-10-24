Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86276C00A8F
	for <intel-xe@archiver.kernel.org>; Tue, 24 Oct 2023 10:52:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3307510E33E;
	Tue, 24 Oct 2023 10:52:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A676310E33E
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Oct 2023 10:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698144758; x=1729680758;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=FdvrxJjcj3QPW91C4tANI9OGgU5eD+IaC3Bh3SLeZBg=;
 b=EcrL6aLVnFDJW1LFTdF4y4Zv/MsTbZ6Qmm53pbYy4VZ2z36OFmuadbWD
 YueyeSLTsFU6FDW0bTXvrFWei7E6dHrEty7lOxNriw2kE8pmmdqg65P9C
 elGFNqrNUYZ58uyymNT8kvHUGeyiniEVEQm1ahm1n6AAthh0J1PTMWK8c
 U41nSaPo8x49FQjPT77vmlM4pUQjOwxy6tvxLd5UOnXHJCLG42n9aQ0tO
 pb3aFRZ9IkeNhOoAhb+m+A5bWyyWEoqhFVWGZkmzg8P+7afOq0OQwe0zT
 rLEZ0R2FntXCbjNWCPQMtOp5J5ubE5sljxhLrxPLBgdtUIpMUt9Jp1FBS A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="386842298"
X-IronPort-AV: E=Sophos;i="6.03,247,1694761200"; d="scan'208";a="386842298"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2023 03:52:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="793443534"
X-IronPort-AV: E=Sophos;i="6.03,247,1694761200"; d="scan'208";a="793443534"
Received: from goepfrim-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.48.28])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2023 03:52:36 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20231020073430.103493-2-mauro.chehab@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20231020073430.103493-1-mauro.chehab@linux.intel.com>
 <20231020073430.103493-2-mauro.chehab@linux.intel.com>
Date: Tue, 24 Oct 2023 13:52:33 +0300
Message-ID: <87sf609tse.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-xe] [PATCH 1/2] misc: mei: fix Kconfig dependencies
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

On Fri, 20 Oct 2023, Mauro Carvalho Chehab <mauro.chehab@linux.intel.com> wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
>
> The dependency chain for INTEL_MEI is not properly addressed, as
> reported by LKP:
>
>    WARNING: unmet direct dependencies detected for INTEL_MEI_ME
>    Depends on [n]: X86 && PCI [=y]
>    Selected by [y]:
>    - INTEL_MEI_HDCP [=y] && (DRM_I915 [=n] || DRM_XE [=y])
>
> Basically, all symbols selecting INTEL_MEI shall also depends on
> both X86 and PCI.
>
> Add such dependency, as otherwise the dependencies won't be
> properly followed.

This must *not* be applied to drm-xe-next directly. Get it merged
upstream first, and backport with cherry-pick -x annotation if needed.

BR,
Jani

>
> Reported-by: kernel test robot <lkp@intel.com>
> Link: https://lore.kernel.org/oe-kbuild-all/202310201234.ZZLwdoiy-lkp@intel.com/
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
>  drivers/misc/mei/gsc_proxy/Kconfig | 1 +
>  drivers/misc/mei/hdcp/Kconfig      | 1 +
>  drivers/misc/mei/pxp/Kconfig       | 1 +
>  3 files changed, 3 insertions(+)
>
> diff --git a/drivers/misc/mei/gsc_proxy/Kconfig b/drivers/misc/mei/gsc_proxy/Kconfig
> index 5f68d9f3d691..6053ebbf536d 100644
> --- a/drivers/misc/mei/gsc_proxy/Kconfig
> +++ b/drivers/misc/mei/gsc_proxy/Kconfig
> @@ -4,6 +4,7 @@
>  config INTEL_MEI_GSC_PROXY
>  	tristate "Intel GSC Proxy services of ME Interface"
>  	select INTEL_MEI_ME
> +	depends on X86 && PCI
>  	depends on DRM_I915
>  	help
>           MEI Support for GSC Proxy Services on Intel platforms.
> diff --git a/drivers/misc/mei/hdcp/Kconfig b/drivers/misc/mei/hdcp/Kconfig
> index 2ac9148988d4..a5e8d3e9fc92 100644
> --- a/drivers/misc/mei/hdcp/Kconfig
> +++ b/drivers/misc/mei/hdcp/Kconfig
> @@ -4,6 +4,7 @@
>  config INTEL_MEI_HDCP
>  	tristate "Intel HDCP2.2 services of ME Interface"
>  	select INTEL_MEI_ME
> +	depends on X86 && PCI
>  	depends on DRM_I915 || DRM_XE
>  	help
>  	  MEI Support for HDCP2.2 Services on Intel platforms.
> diff --git a/drivers/misc/mei/pxp/Kconfig b/drivers/misc/mei/pxp/Kconfig
> index 4029b96afc04..3acc05fea744 100644
> --- a/drivers/misc/mei/pxp/Kconfig
> +++ b/drivers/misc/mei/pxp/Kconfig
> @@ -4,6 +4,7 @@
>  #
>  config INTEL_MEI_PXP
>  	tristate "Intel PXP services of ME Interface"
> +	depends on X86 && PCI
>  	select INTEL_MEI_ME
>  	depends on DRM_I915
>  	help

-- 
Jani Nikula, Intel

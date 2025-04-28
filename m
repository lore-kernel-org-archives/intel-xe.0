Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C01D4C36005
	for <intel-xe@archiver.kernel.org>; Mon, 28 Apr 2025 10:12:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7237810E3E5;
	Mon, 28 Apr 2025 10:12:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YOVkkLYp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE1F410E3E5
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Apr 2025 10:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745835164; x=1777371164;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=97tijpHSrYj8opPAe16nZiavd3FJ9y35Ws7iSNOpcEc=;
 b=YOVkkLYpmIyNyYg++h9nV2aCz8OrIFu+DlzU1bpiHgRIDwp+ZYt6UmZF
 y69k0chwByDxHl4FCB6YDupnhKxachIk14JhtqX6gpQs48t8+r6nhtcJJ
 +OTi43K7/ki9i6r/AxCPSbPQp0m2DmOM9YAOvNZ5XuYQ2+n3qwGK/FKj5
 GKdlbSdrriPbnexR4gLT+mrDJDR5WtGhhkcbodLhIjEMvPm4B3rBcqukG
 5gvR1R9NoR3meNPxJKzyo6E27vreOBwCP9Y793nx5ClZ+Sih7BEsNNKfa
 8gzCS4nPyxUL3vVbFDeZZZb5ngyY6U397XuaD7rBnSxXf/Y9gMNTiO0BA Q==;
X-CSE-ConnectionGUID: BJEk/utRRoSnp+hTdukQjA==
X-CSE-MsgGUID: hAFrf+t0QMy1lez8u4yOUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11416"; a="57616750"
X-IronPort-AV: E=Sophos;i="6.15,246,1739865600"; d="scan'208";a="57616750"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2025 03:12:43 -0700
X-CSE-ConnectionGUID: 1ffHwNm1SuqH5tCBu/fY1w==
X-CSE-MsgGUID: r22WpNuCSciP85lh6j3Jmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,246,1739865600"; d="scan'208";a="138280547"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2025 03:12:41 -0700
Date: Mon, 28 Apr 2025 13:12:38 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: lucas.demarchi@intel.com, rodrigo.vivi@intel.com
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, riana.tauro@intel.com
Subject: Re: [PATCH v4 0/3] BMG PCIe Gen5 downgrade attributes and usage
Message-ID: <aA9UlvQfo5-6-CtB@black.fi.intel.com>
References: <20250425140626.3082588-1-raag.jadav@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425140626.3082588-1-raag.jadav@intel.com>
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

On Fri, Apr 25, 2025 at 07:36:23PM +0530, Raag Jadav wrote:
> This series exposes sysfs attributes for BMG PCIe Gen5 downgrade and
> documents their usage.

Anything I can do to move this forward?

Raag

> v1: https://patchwork.freedesktop.org/series/147023/
> 
> v2: Move from debugfs to sysfs (Lucas, Rodrigo, Badal)
>     Rework macros and their naming (Rodrigo)
> 
> v3: Move xe_device_sysfs_init() to xe_device_probe() (Riana)
>     Use sysfs_create_files() (Riana)
>     Fix checkpatch warning (Riana)
> 
> v4: s/gen4_downspeed/gen5_downgrade (Lucas, Rodrigo, Riana)
> 
> Raag Jadav (3):
>   drm/xe/pm: s/xe_device_sysfs_init/xe_pm_sysfs_init
>   drm/xe: Expose PCIe Gen5 downgrade attributes
>   drm/xe/doc: Wire up PCIe Gen5 limitations
> 
>  Documentation/gpu/xe/xe_firmware.rst |   6 ++
>  drivers/gpu/drm/xe/xe_device.c       |   5 ++
>  drivers/gpu/drm/xe/xe_device_sysfs.c | 107 ++++++++++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_device_sysfs.h |   1 +
>  drivers/gpu/drm/xe/xe_pcode_api.h    |   5 ++
>  drivers/gpu/drm/xe/xe_pm.c           |   2 +-
>  6 files changed, 123 insertions(+), 3 deletions(-)
> 
> -- 
> 2.34.1
> 

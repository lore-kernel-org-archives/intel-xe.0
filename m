Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28435E7B5F9
	for <intel-xe@archiver.kernel.org>; Wed,  4 Oct 2023 12:05:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D636F10E113;
	Wed,  4 Oct 2023 12:05:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83ABF10E112
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Oct 2023 12:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696421108; x=1727957108;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=1UPkcxWzi6BNz0ZzY/SZu96Ipj7JNpjC51aVfCvm6Jc=;
 b=GvnqoitbvRIFL8Aq9mEYPvCWJwwyo4Y507YTv8eTYSj9+yF+HrH+yeOX
 ZP60c2furkKiCePVZSJ8EBgb0L7huH6OvLWKrUWWdQ5oDT4RbAarsR5ZS
 jpE0h6EMkHsGvwcYq4Ibp6HBnKjl/QmZTbVPRQQg30SENgF+RANw+aMPz
 1Yhq35siccN82FsUOsw/glrCL+fA3MgAgYGqmqKXASc3EXIObkHuzePwX
 xUxTUf4Jm8/BosIFTAo48oFSTYJ2ntNlh5rFCyaFuhaaw8rC3fjD61FMJ
 +X/JUiQXxRIvwVWBhsITKhgX6/ii4U+aU/AyPhS0nyc+jO3Q07QqDGOZu w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="373489042"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; d="scan'208";a="373489042"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 05:05:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="821639701"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; d="scan'208";a="821639701"
Received: from aravind-dev.iind.intel.com (HELO [10.145.162.146])
 ([10.145.162.146])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 05:05:05 -0700
Message-ID: <01b351e5-0141-20ac-f11a-f663f611dc07@linux.intel.com>
Date: Wed, 4 Oct 2023 17:37:53 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20230823085842.1440523-1-himal.prasad.ghimiray@intel.com>
 <20230823085842.1440523-2-himal.prasad.ghimiray@intel.com>
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
In-Reply-To: <20230823085842.1440523-2-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH v5 1/4] drm/xe: Handle errors from various
 components.
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
Cc: Jani Nikula <jani.nikula@intel.com>, Matt Roper <matthew.d.roper@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


On 23/08/23 14:28, Himal Prasad Ghimiray wrote:
> The GFX device can generate numbers of classes of error under the new
> infrastructure: correctable, non-fatal, and fatal errors.
>
> The non-fatal and fatal error classes distinguish between levels of
> severity for uncorrectable errors. Driver will only handle logging
> of errors and updating counters from various components within the
> graphics device. Anything more will be handled at system level.
>
> For errors that will route as interrupts, three bits in the Master
> Interrupt Register will be used to convey the class of error.
>
> For each class of error: Determine source of error (IP block) by reading
> the Device Error Source Register (RW1C) that
> corresponds to the class of error being serviced.
>
> Bspec: 50875, 53073, 53074, 53075
>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile                  |   1 +
>  drivers/gpu/drm/xe/regs/xe_regs.h            |   2 +-
>  drivers/gpu/drm/xe/regs/xe_tile_error_regs.h |  15 ++
>  drivers/gpu/drm/xe/xe_device_types.h         |  11 +
>  drivers/gpu/drm/xe/xe_hw_error.c             | 211 +++++++++++++++++++
>  drivers/gpu/drm/xe/xe_hw_error.h             |  64 ++++++
>  drivers/gpu/drm/xe/xe_irq.c                  |   3 +
>  7 files changed, 306 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/xe/regs/xe_tile_error_regs.h
>  create mode 100644 drivers/gpu/drm/xe/xe_hw_error.c
>  create mode 100644 drivers/gpu/drm/xe/xe_hw_error.h

<snip>

>
> +/* Count of  Correctable and Uncorrectable errors reported on tile */
> +enum xe_tile_hw_errors {
> +	XE_TILE_HW_ERR_GT_FATAL = 0,
> +	XE_TILE_HW_ERR_SGGI_FATAL,
> +	XE_TILE_HW_ERR_DISPLAY_FATAL,
> +	XE_TILE_HW_ERR_SGDI_FATAL,
> +	XE_TILE_HW_ERR_SGLI_FATAL,
> +	XE_TILE_HW_ERR_SGUNIT_FATAL,
> +	XE_TILE_HW_ERR_SGCI_FATAL,
> +	XE_TILE_HW_ERR_GSC_FATAL,
> +	XE_TILE_HW_ERR_SOC_FATAL,
> +	XE_TILE_HW_ERR_MERT_FATAL,
> +	XE_TILE_HW_ERR_SGMI_FATAL,
> +	XE_TILE_HW_ERR_UNKNOWN_FATAL,
> +	XE_TILE_HW_ERR_SGGI_NONFATAL,
> +	XE_TILE_HW_ERR_DISPLAY_NONFATAL,
> +	XE_TILE_HW_ERR_SGDI_NONFATAL,
> +	XE_TILE_HW_ERR_SGLI_NONFATAL,
> +	XE_TILE_HW_ERR_GT_NONFATAL,
> +	XE_TILE_HW_ERR_SGUNIT_NONFATAL,
> +	XE_TILE_HW_ERR_SGCI_NONFATAL,
> +	XE_TILE_HW_ERR_GSC_NONFATAL,
> +	XE_TILE_HW_ERR_SOC_NONFATAL,
> +	XE_TILE_HW_ERR_MERT_NONFATAL,
> +	XE_TILE_HW_ERR_SGMI_NONFATAL,
> +	XE_TILE_HW_ERR_UNKNOWN_NONFATAL,
> +	XE_TILE_HW_ERR_GT_CORR,
> +	XE_TILE_HW_ERR_DISPLAY_CORR,
> +	XE_TILE_HW_ERR_SGUNIT_CORR,
> +	XE_TILE_HW_ERR_GSC_CORR,
> +	XE_TILE_HW_ERR_SOC_CORR,
> +	XE_TILE_HW_ERR_UNKNOWN_CORR,
> +	XE_TILE_HW_ERROR_MAX,
> +};
> +

there are some defines which are not used in any platform specific structures,
let's clean that up and at present let's add support to only DG2 and PVC and
any specific errors for a particular platform to be added specifically for it later, applies
to all errors in the series.

Thanks,
Aravind.

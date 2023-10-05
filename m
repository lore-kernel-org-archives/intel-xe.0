Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B618E936ED
	for <intel-xe@archiver.kernel.org>; Thu,  5 Oct 2023 03:59:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECD1410E148;
	Thu,  5 Oct 2023 03:59:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32F7A10E148
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Oct 2023 03:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696478339; x=1728014339;
 h=message-id:date:mime-version:subject:from:to:cc:
 references:in-reply-to:content-transfer-encoding;
 bh=khJ+rx7VJc/Dh4zxPkzkGCOZv8jgiJBgVAv2M+gyQkA=;
 b=HtSZkKJ9BzHZQqHp0rTZz9jDBfPE/Wdy0aG6RktCRYzeffZIzrh55Dv9
 46++neoiG5NEiMCdtvAYwYCndZKCeOZ3JD7NQpP2b2/Dkwxdqhi1EkfMJ
 wkjIluY/6g1LTc3t9yG+a6JLL9uRqiX+gxSZuLlFwYtinKcZgHnXN96Yz
 8KkN02z8Y5bcY+rOoLVFCiyuAep+/VvAcmuynSt/bAbqkfKJIZLV5NZ90
 xOqmujzRpX9ZDWJi2GNwU50b5IYysG4UMhv1ZEEKRXspjGPznLop9D/mY
 AX7N+ezG5qF6dn9xCWCL/DluK+KgEPeiQ83FVn5lYD1ke8uSW+fjKE1MU w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="363671712"
X-IronPort-AV: E=Sophos;i="6.03,201,1694761200"; d="scan'208";a="363671712"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 20:58:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="842212106"
X-IronPort-AV: E=Sophos;i="6.03,201,1694761200"; d="scan'208";a="842212106"
Received: from aravind-dev.iind.intel.com (HELO [10.145.162.146])
 ([10.145.162.146])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 20:58:55 -0700
Message-ID: <1629324f-63a2-1272-5814-97b6c2869d41@linux.intel.com>
Date: Thu, 5 Oct 2023 09:31:44 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20230823085842.1440523-1-himal.prasad.ghimiray@intel.com>
 <20230823085842.1440523-2-himal.prasad.ghimiray@intel.com>
 <01b351e5-0141-20ac-f11a-f663f611dc07@linux.intel.com>
In-Reply-To: <01b351e5-0141-20ac-f11a-f663f611dc07@linux.intel.com>
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


On 04/10/23 17:37, Aravind Iddamsetty wrote:
> On 23/08/23 14:28, Himal Prasad Ghimiray wrote:
>> The GFX device can generate numbers of classes of error under the new
>> infrastructure: correctable, non-fatal, and fatal errors.
>>
>> The non-fatal and fatal error classes distinguish between levels of
>> severity for uncorrectable errors. Driver will only handle logging
>> of errors and updating counters from various components within the
>> graphics device. Anything more will be handled at system level.
>>
>> For errors that will route as interrupts, three bits in the Master
>> Interrupt Register will be used to convey the class of error.
>>
>> For each class of error: Determine source of error (IP block) by reading
>> the Device Error Source Register (RW1C) that
>> corresponds to the class of error being serviced.
>>
>> Bspec: 50875, 53073, 53074, 53075
>>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Matt Roper <matthew.d.roper@intel.com>
>> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
>> Cc: Jani Nikula <jani.nikula@intel.com>
>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> ---
>>  drivers/gpu/drm/xe/Makefile                  |   1 +
>>  drivers/gpu/drm/xe/regs/xe_regs.h            |   2 +-
>>  drivers/gpu/drm/xe/regs/xe_tile_error_regs.h |  15 ++
>>  drivers/gpu/drm/xe/xe_device_types.h         |  11 +
>>  drivers/gpu/drm/xe/xe_hw_error.c             | 211 +++++++++++++++++++
>>  drivers/gpu/drm/xe/xe_hw_error.h             |  64 ++++++
>>  drivers/gpu/drm/xe/xe_irq.c                  |   3 +
>>  7 files changed, 306 insertions(+), 1 deletion(-)
>>  create mode 100644 drivers/gpu/drm/xe/regs/xe_tile_error_regs.h
>>  create mode 100644 drivers/gpu/drm/xe/xe_hw_error.c
>>  create mode 100644 drivers/gpu/drm/xe/xe_hw_error.h
> <snip>
>
>> +/* Count of  Correctable and Uncorrectable errors reported on tile */
>> +enum xe_tile_hw_errors {
>> +	XE_TILE_HW_ERR_GT_FATAL = 0,
>> +	XE_TILE_HW_ERR_SGGI_FATAL,
>> +	XE_TILE_HW_ERR_DISPLAY_FATAL,
>> +	XE_TILE_HW_ERR_SGDI_FATAL,
>> +	XE_TILE_HW_ERR_SGLI_FATAL,
>> +	XE_TILE_HW_ERR_SGUNIT_FATAL,
>> +	XE_TILE_HW_ERR_SGCI_FATAL,
>> +	XE_TILE_HW_ERR_GSC_FATAL,
>> +	XE_TILE_HW_ERR_SOC_FATAL,
>> +	XE_TILE_HW_ERR_MERT_FATAL,
>> +	XE_TILE_HW_ERR_SGMI_FATAL,
>> +	XE_TILE_HW_ERR_UNKNOWN_FATAL,
>> +	XE_TILE_HW_ERR_SGGI_NONFATAL,
>> +	XE_TILE_HW_ERR_DISPLAY_NONFATAL,
>> +	XE_TILE_HW_ERR_SGDI_NONFATAL,
>> +	XE_TILE_HW_ERR_SGLI_NONFATAL,
>> +	XE_TILE_HW_ERR_GT_NONFATAL,
>> +	XE_TILE_HW_ERR_SGUNIT_NONFATAL,
>> +	XE_TILE_HW_ERR_SGCI_NONFATAL,
>> +	XE_TILE_HW_ERR_GSC_NONFATAL,
>> +	XE_TILE_HW_ERR_SOC_NONFATAL,
>> +	XE_TILE_HW_ERR_MERT_NONFATAL,
>> +	XE_TILE_HW_ERR_SGMI_NONFATAL,
>> +	XE_TILE_HW_ERR_UNKNOWN_NONFATAL,
>> +	XE_TILE_HW_ERR_GT_CORR,
>> +	XE_TILE_HW_ERR_DISPLAY_CORR,
>> +	XE_TILE_HW_ERR_SGUNIT_CORR,
>> +	XE_TILE_HW_ERR_GSC_CORR,
>> +	XE_TILE_HW_ERR_SOC_CORR,
>> +	XE_TILE_HW_ERR_UNKNOWN_CORR,
>> +	XE_TILE_HW_ERROR_MAX,
>> +};
>> +
> there are some defines which are not used in any platform specific structures,
> let's clean that up and at present let's add support to only DG2 and PVC and
> any specific errors for a particular platform to be added specifically for it later, applies
> to all errors in the series.

Also, let's remove display as there are no known RAS errors from it.

Thanks,
Aravind.
>
> Thanks,
> Aravind.

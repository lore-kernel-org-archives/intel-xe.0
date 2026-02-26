Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5710BFD8FD0
	for <intel-xe@archiver.kernel.org>; Thu, 26 Feb 2026 16:08:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E9EF10E9A6;
	Thu, 26 Feb 2026 16:08:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IUcz4B0P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 723DD10E9A6
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Feb 2026 16:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772122108; x=1803658108;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=rojk5xBRV8Q/SHizHr0RK5U+qadS/Vff4Qf25gUjhfE=;
 b=IUcz4B0PUX4UpvDT7xOMdPXdFkYQhbFZXEwnKroUFlsIdzKzj8IRzff4
 wXQ39v48ZSiY17Lfons8QmA//VkAB0nbRB/EghIieGgeOlIoiOF/LzsxB
 VFCx/S4pq4VpzqZQaE0Uu+yvIzO9lFZlRpY4akT2RMR45BBWJv1NmpyFr
 OV+i7qP//bKfjRVQrDXAa6UJAa8hEOAOOU5STlKY5RsKiFcOzyZ0NIWZp
 lRZs6RMbtPlai4FlGHh571B3P1p2RMv2IRPbPZ+no5RQQ5eCLxxRjuNkt
 uG/3/u2jTbYIlLeXZcl3rXQdyRrVeCxI95yb56qXGaNlCFe/I5BZxM9Hp g==;
X-CSE-ConnectionGUID: KS+RN+B5RfaihuIoPDNG+A==
X-CSE-MsgGUID: ZgpCM4HCQ1yM7NBOJgq5CA==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="73234167"
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="73234167"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 08:08:27 -0800
X-CSE-ConnectionGUID: i0sFyt+oRy2E9Cvw7tfklw==
X-CSE-MsgGUID: cYCnll6yR2ae4H/xoUI5cQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="214136900"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.244.242])
 ([10.245.244.242])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 08:08:24 -0800
Message-ID: <6d9a4efc-766e-45dc-973b-2a6fab76b143@intel.com>
Date: Thu, 26 Feb 2026 16:08:22 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/6] Introduce Xe PCIe FLR
To: Raag Jadav <raag.jadav@intel.com>, intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, rodrigo.vivi@intel.com,
 thomas.hellstrom@linux.intel.com, riana.tauro@intel.com,
 michal.wajdeczko@intel.com, matthew.d.roper@intel.com,
 michal.winiarski@intel.com
References: <20260224102618.3105171-1-raag.jadav@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20260224102618.3105171-1-raag.jadav@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 24/02/2026 10:25, Raag Jadav wrote:
> Here's my humble attempt at introducing PCIe FLR support in xe driver.
> This is ofcourse a half baked implementation and only limited to reloading
> uC firmwares. This needs to be extended for a lot of different components
> which I've skipped here for my lack of competence, so feel free to join
> in and support them.

I couldn't find where we re-init all the migrate stuff? There is a bunch 
of PPGTT programming that will be lost if VRAM gets wiped. And then also 
the migrate queue/context itself. See xe_migrate_init().

> 
> PS: This works enough to allow a single exec test run after FLR but it
> follows with a GuC crash on subsequent runs which I'm still investigating.
> 
> Raag Jadav (6):
>    drm/xe/uc_fw: Allow reloading firmware
>    drm/xe/uc: Introduce FLR helpers
>    drm/xe/irq: Introduce FLR helper
>    drm/xe: Introduce xe_device_assert_lmem_ready()
>    drm/xe/bo_evict: Introduce xe_bo_restore_map()
>    drm/xe/pci: Introduce PCIe FLR
> 
>   drivers/gpu/drm/xe/Makefile      |   1 +
>   drivers/gpu/drm/xe/xe_bo_evict.c |  34 +++++--
>   drivers/gpu/drm/xe/xe_bo_evict.h |   2 +
>   drivers/gpu/drm/xe/xe_device.c   |   4 +-
>   drivers/gpu/drm/xe/xe_device.h   |   1 +
>   drivers/gpu/drm/xe/xe_gsc.c      |  15 ++++
>   drivers/gpu/drm/xe/xe_gsc.h      |   1 +
>   drivers/gpu/drm/xe/xe_gt.c       |  10 +++
>   drivers/gpu/drm/xe/xe_gt.h       |   2 +
>   drivers/gpu/drm/xe/xe_guc.c      |  16 ++++
>   drivers/gpu/drm/xe/xe_guc.h      |   1 +
>   drivers/gpu/drm/xe/xe_huc.c      |  16 ++++
>   drivers/gpu/drm/xe/xe_huc.h      |   1 +
>   drivers/gpu/drm/xe/xe_irq.c      |   7 +-
>   drivers/gpu/drm/xe/xe_irq.h      |   1 +
>   drivers/gpu/drm/xe/xe_pci.c      |   1 +
>   drivers/gpu/drm/xe/xe_pci.h      |   2 +
>   drivers/gpu/drm/xe/xe_pci_err.c  | 147 +++++++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_uc.c       |  24 +++++
>   drivers/gpu/drm/xe/xe_uc.h       |   2 +
>   drivers/gpu/drm/xe/xe_uc_fw.c    |  33 +++----
>   drivers/gpu/drm/xe/xe_uc_fw.h    |   1 +
>   22 files changed, 295 insertions(+), 27 deletions(-)
>   create mode 100644 drivers/gpu/drm/xe/xe_pci_err.c
> 


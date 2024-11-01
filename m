Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73ADAE6B27C
	for <intel-xe@archiver.kernel.org>; Fri,  1 Nov 2024 13:55:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4197010E9D9;
	Fri,  1 Nov 2024 13:55:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lbd7Y69R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0012410E9D6;
 Fri,  1 Nov 2024 13:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730469312; x=1762005312;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=4O0+48Mse9uK24R4cgG1ljAhKiGmdS/fvN35+/uFJ2s=;
 b=lbd7Y69RllWZBzsHd2VJ+l/ZC1cpo+/Oe8p77WUOWfEDlAtcdaMxkQF6
 MxySnA7aQizGWiZalyudgVi+miy/jsn8LLdq5K+gLuOSEfqXL0UXrRutM
 rpGhlCHpxPvsshoBY7PmneAeQxHHr0R7it7huAlxyae9xIXjj0ya9ytXs
 RcUY5DTrzab3i6xZWJj7FjNIQrH0Oqn5dhLkOlpjxKha345aaR0N2mW4Z
 usYvxljA+tylv9CBHihKwu5m00JCqZ7mUihAb0JhQcQVP/i912EGQeN7S
 fXwdIE3RUQeCzB7Fx5LajrRGOBLQDgkPdx4c9PosCtghcXNq2zpntg9lt g==;
X-CSE-ConnectionGUID: U42LR+DHQwWSI74hyW7QSg==
X-CSE-MsgGUID: 3zvNSSxyRJ2rnyHhS+JE8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="41333984"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="41333984"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2024 06:55:11 -0700
X-CSE-ConnectionGUID: niQ59SuiTg2xkdcC63Ooqw==
X-CSE-MsgGUID: C1WDHQJ0Rmu0jlJOfreksw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,249,1725346800"; d="scan'208";a="83787743"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO [10.245.244.34])
 ([10.245.244.34])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2024 06:55:11 -0700
Message-ID: <33c9d6a1-b8cf-4449-9311-4d57c185e653@intel.com>
Date: Fri, 1 Nov 2024 13:55:08 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t V2 2/2] tests/intel: Add xe_pci_membarrier test
To: Tejas Upadhyay <tejas.upadhyay@intel.com>, igt-dev@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
References: <20241023094327.965050-1-tejas.upadhyay@intel.com>
 <20241023094327.965050-3-tejas.upadhyay@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20241023094327.965050-3-tejas.upadhyay@intel.com>
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

On 23/10/2024 10:43, Tejas Upadhyay wrote:
> We want to make sure that direct mmap mapping of physical
> page at doorbell space and whole page is accessible in order
> to use pci memory barrier effect effectively.
> 
> This is basic pci memory barrier test to showcase xe driver
> support for feature. In follow up patches we will have more
> of corner and negative tests added later.
> 
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>   tests/intel/xe_pci_membarrier.c | 80 +++++++++++++++++++++++++++++++++

Could probably just plonk this in the existing mmap offset tests file?

>   tests/meson.build               |  1 +
>   2 files changed, 81 insertions(+)
>   create mode 100644 tests/intel/xe_pci_membarrier.c
> 
> diff --git a/tests/intel/xe_pci_membarrier.c b/tests/intel/xe_pci_membarrier.c
> new file mode 100644
> index 000000000..d0bf447b6
> --- /dev/null
> +++ b/tests/intel/xe_pci_membarrier.c
> @@ -0,0 +1,80 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright(c) 2024 Intel Corporation. All rights reserved.
> + */
> +
> +#include "xe_drm.h"
> +#include "igt.h"
> +
> +/**
> + * TEST: Test if the driver is capable of putting pci memory barrier using mmap
> + * Category: Core
> + * Mega feature: General Core features
> + * Sub-category: Memory management tests
> + * Functionality: mmap with pre-defined offset
> + */
> +
> +IGT_TEST_DESCRIPTION("Basic MMAP tests pci memory barrier effect with special offset");
> +#define PAGE_SHIFT 12
> +#define PAGE_SIZE 4096
> +
> +/**
> + * SUBTEST: basic
> + * Description: create pci memory barrier with write on defined mmap offset.
> + * Test category: functionality test
> + *
> + */
> +
> +static void pci_membarrier(int xe)
> +{
> +	uint64_t flags = MAP_SHARED;
> +	unsigned int prot = PROT_WRITE;
> +	uint32_t *ptr;
> +	uint64_t size = PAGE_SIZE;
> +	struct timespec tv;
> +        struct drm_xe_gem_mmap_offset mmo = {
> +                .handle = 0,
> +                .flags = DRM_XE_MMAP_OFFSET_FLAG_PCI_BARRIER,
> +        };
> +
> +        igt_assert_eq(igt_ioctl(xe, DRM_IOCTL_XE_GEM_MMAP_OFFSET, &mmo), 0);
> +        ptr = mmap(NULL, size, prot, flags, xe, mmo.offset);
> +	igt_assert(ptr != MAP_FAILED);

nit: formatting

> +
> +	/* Check whole page for any errors, also check as
> +	 * we should not read written values back
> +	 */
> +	for (int i = 0; i < size / sizeof(*ptr); i++) {
> +		/* It is expected unconfigured doorbell space
> +		 * will return read value 0xdeadbeef
> +		 */
> +		igt_assert_eq_u32(READ_ONCE(ptr[i]), 0xdeadbeef);
> +
> +		igt_gettime(&tv);
> +		ptr[i] = i;
> +		if (READ_ONCE(ptr[i]) == i) {

Can this actually happen where the value is written?

I think also consider adding some negative testcases. For example:

- Try to mmap something larger than 4K. Ensure we get an error.
- Try BARRIER mmap_offset, and also supply a BO. Ensure we get an error.

> +			while (READ_ONCE(ptr[i]) == i)
> +				;
> +			igt_info("fd:%d value retained for %"PRId64"ns pos:%d\n",
> +				 xe, igt_nsec_elapsed(&tv), i);
> +		}
> +		igt_assert_neq(READ_ONCE(ptr[i]), i);
> +	}
> +
> +	munmap(ptr, size);
> +}
> +
> +igt_main
> +{
> +	int xe;
> +
> +	igt_fixture {
> +		xe = drm_open_driver(DRIVER_XE);
> +	}
> +
> +	igt_subtest_f("basic")
> +		pci_membarrier(xe);
> +
> +	igt_fixture
> +		drm_close_driver(xe);
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index 34b87b125..15131d812 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -306,6 +306,7 @@ intel_xe_progs = [
>   	'xe_noexec_ping_pong',
>   	'xe_oa',
>   	'xe_pat',
> +        'xe_pci_membarrier',
>   	'xe_peer2peer',
>   	'xe_pm',
>   	'xe_pm_residency',

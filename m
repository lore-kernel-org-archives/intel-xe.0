Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 325E0D2E9DD
	for <intel-xe@archiver.kernel.org>; Mon, 11 Nov 2024 11:48:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C4D210E481;
	Mon, 11 Nov 2024 11:48:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hZ27Sx3y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ABCD10E1D7;
 Mon, 11 Nov 2024 11:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731325734; x=1762861734;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=e3WYg2djj/CQcdZ6W/4/wT6BO7Jvj3pK8UKuaQGq1X0=;
 b=hZ27Sx3yDe0GnqX2y4LfV5IDXtM78FFJj0VvG6KQxKPcb8x8N29Aq+Sz
 1Z72yboUnWSXiYI84jzKVD32km8CgsOERFtusanfSKgXT8sPOSLBTTtd8
 7ymBhflBfRklJxvtp/KyAt1H4iVoNUXl1zAFofekyPG/DxqVVFTOrqsrM
 42lfHKEJ/04F/iXPqfV/r2RmLNOQOrx2qZArKxcgFN/34qyDjBBLAL7yh
 6RQRMkYY/qe8Z/SzjZh2wkV8XzuzxMxUQYUibDS1j1sQ/tl2Vhb7bMS4a
 clGTSOyvIJ0CGcsa54gOAdv9px3ZXVXzEhAmGzDlGO/5qqvxiiHBwCWTb g==;
X-CSE-ConnectionGUID: zapTLrzGS92dL7JF1FnKug==
X-CSE-MsgGUID: fCznX+5yQluxDzO6dXW6qg==
X-IronPort-AV: E=McAfee;i="6700,10204,11252"; a="42526003"
X-IronPort-AV: E=Sophos;i="6.12,145,1728975600"; d="scan'208";a="42526003"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2024 03:48:54 -0800
X-CSE-ConnectionGUID: 1bTpqkf+REueYR2CSmzeUA==
X-CSE-MsgGUID: n+VtE/L5SmmpEcAnHJ688A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,145,1728975600"; d="scan'208";a="110160668"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO [10.245.244.91])
 ([10.245.244.91])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2024 03:48:53 -0800
Message-ID: <648a6278-4c97-497c-b99b-59c6b876f0a9@intel.com>
Date: Mon, 11 Nov 2024 11:48:51 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t V2 2/2] tests/intel: Add xe_pci_membarrier test
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20241023094327.965050-1-tejas.upadhyay@intel.com>
 <20241023094327.965050-3-tejas.upadhyay@intel.com>
 <33c9d6a1-b8cf-4449-9311-4d57c185e653@intel.com>
 <SJ1PR11MB6204F3272611F49594373C3181532@SJ1PR11MB6204.namprd11.prod.outlook.com>
 <SJ1PR11MB6204DF3E6F9799CC944C420B81532@SJ1PR11MB6204.namprd11.prod.outlook.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <SJ1PR11MB6204DF3E6F9799CC944C420B81532@SJ1PR11MB6204.namprd11.prod.outlook.com>
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


On 06/11/2024 13:12, Upadhyay, Tejas wrote:
> 
> 
>> -----Original Message-----
>> From: Upadhyay, Tejas
>> Sent: Wednesday, November 6, 2024 5:30 PM
>> To: Auld, Matthew <matthew.auld@intel.com>; igt-dev@lists.freedesktop.org;
>> intel-xe@lists.freedesktop.org
>> Subject: RE: [PATCH i-g-t V2 2/2] tests/intel: Add xe_pci_membarrier test
>>
>>
>>
>>> -----Original Message-----
>>> From: Auld, Matthew <matthew.auld@intel.com>
>>> Sent: Friday, November 1, 2024 7:25 PM
>>> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>; igt-
>>> dev@lists.freedesktop.org; intel-xe@lists.freedesktop.org
>>> Subject: Re: [PATCH i-g-t V2 2/2] tests/intel: Add xe_pci_membarrier
>>> test
>>>
>>> On 23/10/2024 10:43, Tejas Upadhyay wrote:
>>>> We want to make sure that direct mmap mapping of physical page at
>>>> doorbell space and whole page is accessible in order to use pci
>>>> memory barrier effect effectively.
>>>>
>>>> This is basic pci memory barrier test to showcase xe driver support
>>>> for feature. In follow up patches we will have more of corner and
>>>> negative tests added later.
>>>>
>>>> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
>>>> ---
>>>>    tests/intel/xe_pci_membarrier.c | 80
>>>> +++++++++++++++++++++++++++++++++
>>>
>>> Could probably just plonk this in the existing mmap offset tests file?
>>
>> I tried this, but looks like none of existing methods which are using bo-create
>> looks related to this test. Also negative tests are also going to be different for
>> this test. I would think it should be good to keep this test separate. What you
>> think!
> 
> Or I can do atlest below :

Yes, somethng like that seems fine to me.

> 
> diff --git a/tests/intel/xe_mmap.c b/tests/intel/xe_mmap.c
> index fc5d73d59..8ae6405b5 100644
> --- a/tests/intel/xe_mmap.c
> +++ b/tests/intel/xe_mmap.c
> @@ -64,6 +64,54 @@ test_mmap(int fd, uint32_t placement, uint32_t flags)
>          gem_close(fd, bo);
>   }
> 
> +#define PAGE_SHIFT 12
> +#define PAGE_SIZE 4096
> +
> +/**
> + * SUBTEST: pci_membarrier
> + * Description: create pci memory barrier with write on defined mmap offset.
> + * Test category: functionality test
> + *
> + */
> +static void test_pci_membarrier(int xe)
> +{
> +        uint64_t flags = MAP_SHARED;
> +        unsigned int prot = PROT_WRITE;
> +        uint32_t *ptr;
> +        uint64_t size = PAGE_SIZE;
> +        struct timespec tv;
> +        struct drm_xe_gem_mmap_offset mmo = {
> +                .handle = 0,
> +                .flags = DRM_XE_MMAP_OFFSET_FLAG_PCI_BARRIER,
> +        };
> +
> +        igt_assert_eq(igt_ioctl(xe, DRM_IOCTL_XE_GEM_MMAP_OFFSET, &mmo), 0);
> +        ptr = mmap(NULL, size, prot, flags, xe, mmo.offset);
> +        igt_assert(ptr != MAP_FAILED);
> +
> +        /* Check whole page for any errors, also check as
> +         * we should not read written values back
> +         */
> +        for (int i = 0; i < size / sizeof(*ptr); i++) {
> +                /* It is expected unconfigured doorbell space
> +                 * will return read value 0xdeadbeef
> +                 */
> +                igt_assert_eq_u32(READ_ONCE(ptr[i]), 0xdeadbeef);
> +
> +                igt_gettime(&tv);
> +                ptr[i] = i;
> +                if (READ_ONCE(ptr[i]) == i) {
> +                        while (READ_ONCE(ptr[i]) == i)
> +                                ;
> +                        igt_info("fd:%d value retained for %"PRId64"ns pos:%d\n",
> +                                 xe, igt_nsec_elapsed(&tv), i);
> +                }
> +                igt_assert_neq(READ_ONCE(ptr[i]), i);
> +        }
> +
> +        munmap(ptr, size);
> +}
> +
>   /**
>    * SUBTEST: bad-flags
>    * Description: Test mmap offset with bad flags.
> @@ -273,6 +321,9 @@ igt_main
>                  test_mmap(fd, vram_memory(fd, 0) | system_memory(fd),
>                            DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> 
> +       igt_subtest("pci-membarrier")
> +               test_pci_membarrier(fd);
> +
>          igt_subtest("bad-flags")
>                  test_bad_flags(fd);
> 
> diff --git a/tests/meson.build b/tests/meson.build
> index 2724c7a9a..0daed46da 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -306,6 +306,7 @@ intel_xe_progs = [
>          'xe_noexec_ping_pong',
>          'xe_oa',
>          'xe_pat',
> +        'xe_pci_membarrier',
> 
> 
>>
>> Tejas
>>
>>>
>>>>    tests/meson.build               |  1 +
>>>>    2 files changed, 81 insertions(+)
>>>>    create mode 100644 tests/intel/xe_pci_membarrier.c
>>>>
>>>> diff --git a/tests/intel/xe_pci_membarrier.c
>>>> b/tests/intel/xe_pci_membarrier.c new file mode 100644 index
>>>> 000000000..d0bf447b6
>>>> --- /dev/null
>>>> +++ b/tests/intel/xe_pci_membarrier.c
>>>> @@ -0,0 +1,80 @@
>>>> +// SPDX-License-Identifier: MIT
>>>> +/*
>>>> + * Copyright(c) 2024 Intel Corporation. All rights reserved.
>>>> + */
>>>> +
>>>> +#include "xe_drm.h"
>>>> +#include "igt.h"
>>>> +
>>>> +/**
>>>> + * TEST: Test if the driver is capable of putting pci memory
>>>> +barrier using mmap
>>>> + * Category: Core
>>>> + * Mega feature: General Core features
>>>> + * Sub-category: Memory management tests
>>>> + * Functionality: mmap with pre-defined offset  */
>>>> +
>>>> +IGT_TEST_DESCRIPTION("Basic MMAP tests pci memory barrier effect
>>>> +with special offset"); #define PAGE_SHIFT 12 #define PAGE_SIZE 4096
>>>> +
>>>> +/**
>>>> + * SUBTEST: basic
>>>> + * Description: create pci memory barrier with write on defined
>>>> +mmap
>>> offset.
>>>> + * Test category: functionality test
>>>> + *
>>>> + */
>>>> +
>>>> +static void pci_membarrier(int xe)
>>>> +{
>>>> +	uint64_t flags = MAP_SHARED;
>>>> +	unsigned int prot = PROT_WRITE;
>>>> +	uint32_t *ptr;
>>>> +	uint64_t size = PAGE_SIZE;
>>>> +	struct timespec tv;
>>>> +        struct drm_xe_gem_mmap_offset mmo = {
>>>> +                .handle = 0,
>>>> +                .flags = DRM_XE_MMAP_OFFSET_FLAG_PCI_BARRIER,
>>>> +        };
>>>> +
>>>> +        igt_assert_eq(igt_ioctl(xe, DRM_IOCTL_XE_GEM_MMAP_OFFSET,
>>> &mmo), 0);
>>>> +        ptr = mmap(NULL, size, prot, flags, xe, mmo.offset);
>>>> +	igt_assert(ptr != MAP_FAILED);
>>>
>>> nit: formatting
>>>
>>>> +
>>>> +	/* Check whole page for any errors, also check as
>>>> +	 * we should not read written values back
>>>> +	 */
>>>> +	for (int i = 0; i < size / sizeof(*ptr); i++) {
>>>> +		/* It is expected unconfigured doorbell space
>>>> +		 * will return read value 0xdeadbeef
>>>> +		 */
>>>> +		igt_assert_eq_u32(READ_ONCE(ptr[i]), 0xdeadbeef);
>>>> +
>>>> +		igt_gettime(&tv);
>>>> +		ptr[i] = i;
>>>> +		if (READ_ONCE(ptr[i]) == i) {
>>>
>>> Can this actually happen where the value is written?
>>>
>>> I think also consider adding some negative testcases. For example:
>>>
>>> - Try to mmap something larger than 4K. Ensure we get an error.
>>> - Try BARRIER mmap_offset, and also supply a BO. Ensure we get an error.
>>>
>>>> +			while (READ_ONCE(ptr[i]) == i)
>>>> +				;
>>>> +			igt_info("fd:%d value retained for %"PRId64"ns
>>> pos:%d\n",
>>>> +				 xe, igt_nsec_elapsed(&tv), i);
>>>> +		}
>>>> +		igt_assert_neq(READ_ONCE(ptr[i]), i);
>>>> +	}
>>>> +
>>>> +	munmap(ptr, size);
>>>> +}
>>>> +
>>>> +igt_main
>>>> +{
>>>> +	int xe;
>>>> +
>>>> +	igt_fixture {
>>>> +		xe = drm_open_driver(DRIVER_XE);
>>>> +	}
>>>> +
>>>> +	igt_subtest_f("basic")
>>>> +		pci_membarrier(xe);
>>>> +
>>>> +	igt_fixture
>>>> +		drm_close_driver(xe);
>>>> +}
>>>> diff --git a/tests/meson.build b/tests/meson.build index
>>>> 34b87b125..15131d812 100644
>>>> --- a/tests/meson.build
>>>> +++ b/tests/meson.build
>>>> @@ -306,6 +306,7 @@ intel_xe_progs = [
>>>>    	'xe_noexec_ping_pong',
>>>>    	'xe_oa',
>>>>    	'xe_pat',
>>>> +        'xe_pci_membarrier',
>>>>    	'xe_peer2peer',
>>>>    	'xe_pm',
>>>>    	'xe_pm_residency',


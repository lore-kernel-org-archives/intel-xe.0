Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75A49E7717F
	for <intel-xe@archiver.kernel.org>; Mon, 16 Dec 2024 12:55:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AFBD10E1C7;
	Mon, 16 Dec 2024 12:55:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X7ToTQhW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A49010E1C7;
 Mon, 16 Dec 2024 12:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734353705; x=1765889705;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=Ddh1vCvmn0fnzVid/fPhwwEBTMPKbSWa2WqmIopzWhA=;
 b=X7ToTQhWXWwiiDfqXCs9Yr44fQgKCi0ZFSG2yguMsFiN5csifrNAstJI
 21y8hA+Olxv/oP46b3m1rKBu/bGhcNsGRgc82E3eo4xVcaHwd39pdxKmN
 UqchX9+WE2hvj0hy1lL6ajtluAIF5t3OTvulje+RZ6CDCrWJ3fyx+w3Lv
 AozCwGbzVgLWfnSEzx8NYPLn+WWPxE+rP4khR8s4hi/aNBSnfzL6wHFpy
 lnWR7u7IAF/qo2cnqoYcOkwh7/hf+GRGo6X24CAAcDsQ5h43TmRGu2kdV
 t+N2F+2ky3Nsitd07NdJLNbkaoNwb3BgzCaMem1bjvwl0JmiqFsn4jmPA g==;
X-CSE-ConnectionGUID: /5Yn8qdISy6/6jUcaYkm3Q==
X-CSE-MsgGUID: 56zCoCevTYilQuOC4s3e8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="52150752"
X-IronPort-AV: E=Sophos;i="6.12,238,1728975600"; d="scan'208";a="52150752"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2024 04:55:05 -0800
X-CSE-ConnectionGUID: BjDYnfi+RBGnVwhLv83GsQ==
X-CSE-MsgGUID: GWkJwCc+TVG4Zohd62U1yA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,238,1728975600"; d="scan'208";a="97618254"
Received: from dhhellew-desk2.ger.corp.intel.com.ger.corp.intel.com (HELO
 [10.245.244.246]) ([10.245.244.246])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2024 04:55:03 -0800
Message-ID: <3e7e192d-4e1a-45a3-a36e-fca2e38a272a@intel.com>
Date: Mon, 16 Dec 2024 12:55:01 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t V5 4/4] tests/xe/mmap: add tests for pci mem barrier
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20241128055647.1677371-1-tejas.upadhyay@intel.com>
 <20241128055647.1677371-5-tejas.upadhyay@intel.com>
 <ba8b6e62-580f-4ac5-baef-1c88531431ad@intel.com>
 <SJ1PR11MB6204480D213664A0BF5A0D4A813B2@SJ1PR11MB6204.namprd11.prod.outlook.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <SJ1PR11MB6204480D213664A0BF5A0D4A813B2@SJ1PR11MB6204.namprd11.prod.outlook.com>
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

On 16/12/2024 12:29, Upadhyay, Tejas wrote:
> 
> 
>> -----Original Message-----
>> From: Auld, Matthew <matthew.auld@intel.com>
>> Sent: Friday, December 13, 2024 6:54 PM
>> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>; igt-
>> dev@lists.freedesktop.org; intel-xe@lists.freedesktop.org
>> Subject: Re: [i-g-t V5 4/4] tests/xe/mmap: add tests for pci mem barrier
>>
>> On 28/11/2024 05:56, Tejas Upadhyay wrote:
>>> We want to make sure that mmap do direct mapping of physical page at
>>> doorbell space and whole page is accessible in order to use pci memory
>>> barrier effect effectively.
>>>
>>> Following subtests are added,
>>> ./build/tests/xe_mmap --r pci-membarrier ./build/tests/xe_mmap --r
>>> pci-membarrier-parallel ./build/tests/xe_mmap --r
>>> pci-membarrier-bad-pagesize ./build/tests/xe_mmap --r
>>> pci-membarrier-bad-object
>>>
>>> V5:
>>>    - Add pci-membarrier-parallel test
>>> V3(MAuld):
>>>    - Check if pci memory barrier is supported
>>> V2(MAuld)
>>>    - use do_ioctl and replace igt_subtest_f with igt_subtest
>>>    - Remove unused define
>>>
>>> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
>>> ---
>>>    tests/intel/xe_mmap.c | 211
>> ++++++++++++++++++++++++++++++++++++++++++
>>>    1 file changed, 211 insertions(+)
>>>
>>> diff --git a/tests/intel/xe_mmap.c b/tests/intel/xe_mmap.c index
>>> fc5d73d59..1a61095d5 100644
>>> --- a/tests/intel/xe_mmap.c
>>> +++ b/tests/intel/xe_mmap.c
>>> @@ -64,6 +64,161 @@ test_mmap(int fd, uint32_t placement, uint32_t
>> flags)
>>>    	gem_close(fd, bo);
>>>    }
>>>
>>> +#define PAGE_SIZE 4096
>>> +
>>> +/**
>>> + * SUBTEST: pci-membarrier
>>> + * Description: create pci memory barrier with write on defined mmap
>> offset.
>>> + * Test category: functionality test
>>> + *
>>> + */
>>> +static void test_pci_membarrier(int xe) {
>>> +	uint64_t flags = MAP_SHARED;
>>> +	unsigned int prot = PROT_WRITE;
>>> +	uint32_t *ptr;
>>> +	uint64_t size = PAGE_SIZE;
>>> +	struct timespec tv;
>>> +	struct drm_xe_gem_mmap_offset mmo = {
>>> +		.handle = 0,
>>> +		.flags = DRM_XE_MMAP_OFFSET_FLAG_PCI_BARRIER,
>>> +	};
>>> +
>>> +	do_ioctl(xe, DRM_IOCTL_XE_GEM_MMAP_OFFSET, &mmo);
>>> +	ptr = mmap(NULL, size, prot, flags, xe, mmo.offset);
>>> +	igt_assert(ptr != MAP_FAILED);
>>> +
>>> +	/* Check whole page for any errors, also check as
>>> +	 * we should not read written values back
>>> +	 */
>>> +	for (int i = 0; i < size / sizeof(*ptr); i++) {
>>> +		/* It is expected unconfigured doorbell space
>>> +		 * will return read value 0xdeadbeef
>>> +		 */
>>> +		igt_assert_eq_u32(READ_ONCE(ptr[i]), 0xdeadbeef);
>>> +
>>> +		igt_gettime(&tv);
>>> +		ptr[i] = i;
>>> +		if (READ_ONCE(ptr[i]) == i) {
>>> +			while (READ_ONCE(ptr[i]) == i)
>>> +				;
>>> +			igt_info("fd:%d value retained for %"PRId64"ns
>> pos:%d\n",
>>> +				 xe, igt_nsec_elapsed(&tv), i);
>>> +		}
>>> +		igt_assert_neq(READ_ONCE(ptr[i]), i);
>>> +	}
>>> +
>>> +	munmap(ptr, size);
>>> +}
>>> +
>>> +/**
>>> + * SUBTEST: pci-membarrier-parallel
>>> + * Description: create parallel pci memory barrier with write on defined
>> mmap offset.
>>> + * Test category: functionality test
>>> + *
>>> + */
>>> +static void test_pci_membarrier_parallel(int xe, int child) {
>>> +	unsigned int bad_ns, elapsed;
>>> +	uint64_t flags = MAP_SHARED;
>>> +	unsigned int i;
>>> +	unsigned int prot = PROT_WRITE;
>>> +	uint32_t *ptr;
>>> +	uint64_t size = PAGE_SIZE;
>>> +	struct drm_xe_gem_mmap_offset mmo = {
>>> +		.handle = 0,
>>> +		.flags = DRM_XE_MMAP_OFFSET_FLAG_PCI_BARRIER,
>>> +	};
>>> +	struct timespec total, bad;
>>> +	int tpos = size / sizeof(*ptr);
>>> +	int value;
>>> +
>>> +	do_ioctl(xe, DRM_IOCTL_XE_GEM_MMAP_OFFSET, &mmo);
>>> +	ptr = mmap(NULL, size, prot, flags, xe, mmo.offset);
>>> +	igt_assert(ptr != MAP_FAILED);
>>> +
>>> +	/* Check any random position up to 1K */
>>> +	i = rand() % (size / sizeof(*ptr));
>>
>> So both child and parent will have the same rand() value here.
> 
> Possible to have same value but very narrow chance and too much to worry(being sane value) for test functionality we have at hand.

I think it will always be the same value. They both start with the same 
seed so rand() here should give same rng sequence. But I thought that 
was intentional...

> 
>>
>>> +	/* It is expected unconfigured doorbell space
>>> +	 * will return read value 0xdeadbeef
>>> +	 */
>>> +	igt_assert_eq_u32(READ_ONCE(ptr[i]), 0xdeadbeef);
>>> +
>>> +	igt_until_timeout(5) {
>>> +		WRITE_ONCE(ptr[i], i);
>>> +	}
>>> +	bad_ns = 0;
>>> +	igt_gettime(&total);
>>> +	igt_until_timeout(5) { /* XXX sync with parent loop! */
>>> +		if (READ_ONCE(ptr[i]) == i) {
>>> +			igt_gettime(&bad);
>>> +			while (READ_ONCE(ptr[i]) == i)
>>> +				;
>>> +			bad_ns += igt_nsec_elapsed(&bad);
>>> +		}
>>> +	}
>>> +	elapsed = igt_nsec_elapsed(&total);
>>> +	if (bad_ns) {
>>> +		igt_info("Cross-client writes visible %.1f%% of the time.\n",
>>
>> Is this actually "Cross-client"? Are cross client visible writes possible? Is the
>> below not enough to check this?
> 
> Again this is similar to original test where I put debug, we never hit this debug in this test as well, but it was the thinking that the value was hold and cross client might read it, so to test and show case scenario we are checking this. Otherwise below check is enough for clients isolation.

Do we need to test that again? Can't we just test the cross clients 
isolation below?

> 
> Tejas
>   
>>
>>> +			 bad_ns * 100. / elapsed);
>>> +	}
>>> +	igt_assert(20 * bad_ns < elapsed); /* Arbitrary 5% threshold */
>>> +	igt_assert_neq(READ_ONCE(ptr[i]), i);
>>
>>> +	igt_until_timeout(5) {
>>> +		/* Check clients should not be able to see each other */
>>> +		if (child != -1)
>>> +			value = tpos + 1;
>>> +		else
>>> +			value = tpos;
>>> +
>>> +		WRITE_ONCE(ptr[tpos-1], value);
>>> +	}
>>> +	bad_ns = 0;
>>> +	igt_gettime(&total);
>>> +	igt_until_timeout(5) { /* XXX sync with parent loop! */
>>> +		if (READ_ONCE(ptr[tpos-1]) == value) {
>>> +			igt_gettime(&bad);
>>> +			while (READ_ONCE(ptr[tpos-1]) == value)
>>> +				;
>>> +			bad_ns += igt_nsec_elapsed(&bad);
>>> +		}
>>> +	}
>>> +	elapsed = igt_nsec_elapsed(&total);
>>> +	if (bad_ns) {
>>> +		igt_info("Cross-client writes visible %.1f%% of the time.\n",
>>> +			 bad_ns * 100. / elapsed);
>>> +	}
>>> +	igt_assert(20 * bad_ns < elapsed); /* Arbitrary 5% threshold */
>>> +	if (child != -1)
>>> +		igt_assert_neq(READ_ONCE(ptr[tpos-1]), tpos);
>>> +	else
>>> +		igt_assert_neq(READ_ONCE(ptr[tpos-1]), tpos + 1);
>>> +	igt_assert_eq_u32(READ_ONCE(ptr[tpos-1]), 0xdeadbeef);
>>> +
>>> +	munmap(ptr, size);
>>> +}
>>> +
>>> +/**
>>> + * SUBTEST: pci-membarrier-bad-pagesize
>>> + * Description: Test mmap offset with bad pagesize for pci membarrier.
>>> + * Test category: negative test
>>> + *
>>> + */
>>> +static void test_bad_pagesize_for_pcimem(int fd) {
>>> +	uint32_t *map;
>>> +	uint64_t page_size = PAGE_SIZE * 2;
>>> +	struct drm_xe_gem_mmap_offset mmo = {
>>> +		.handle = 0,
>>> +		.flags = DRM_XE_MMAP_OFFSET_FLAG_PCI_BARRIER,
>>> +	};
>>> +
>>> +	do_ioctl(fd, DRM_IOCTL_XE_GEM_MMAP_OFFSET, &mmo);
>>> +	map = mmap(NULL, page_size, PROT_WRITE, MAP_SHARED, fd,
>> mmo.offset);
>>> +	igt_assert(map == MAP_FAILED);
>>> +}
>>> +
>>>    /**
>>>     * SUBTEST: bad-flags
>>>     * Description: Test mmap offset with bad flags.
>>> @@ -126,6 +281,25 @@ static void test_bad_object(int fd)
>>>    	do_ioctl_err(fd, DRM_IOCTL_XE_GEM_MMAP_OFFSET, &mmo,
>> ENOENT);
>>>    }
>>>
>>> +/**
>>> + * SUBTEST: pci-membarrier-bad-object
>>> + * Description: Test mmap offset with bad object for pci mem barrier.
>>> + * Test category: negative test
>>> + *
>>> + */
>>> +static void test_bad_object_for_pcimem(int fd) {
>>> +	uint64_t size = xe_get_default_alignment(fd);
>>> +	struct drm_xe_gem_mmap_offset mmo = {
>>> +		.handle = xe_bo_create(fd, 0, size,
>>> +				       vram_if_possible(fd, 0),
>>> +
>> DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM),
>>> +		.flags = DRM_XE_MMAP_OFFSET_FLAG_PCI_BARRIER,
>>> +	};
>>> +
>>> +	do_ioctl_err(fd, DRM_IOCTL_XE_GEM_MMAP_OFFSET, &mmo,
>> EINVAL); }
>>> +
>>>    static jmp_buf jmp;
>>>
>>>    __noreturn static void sigtrap(int sig) @@ -255,6 +429,16 @@ static
>>> void test_cpu_caching(int fd)
>>>    	assert_caching(fd, system_memory(fd),
>> DRM_XE_GEM_CPU_CACHING_WC + 1, true);
>>>    }
>>>
>>> +static bool is_pci_membarrier_supported(int fd) {
>>> +	struct drm_xe_gem_mmap_offset mmo = {
>>> +		.handle = 0,
>>> +		.flags = DRM_XE_MMAP_OFFSET_FLAG_PCI_BARRIER,
>>> +	};
>>> +
>>> +	return (igt_ioctl(fd, DRM_IOCTL_XE_GEM_MMAP_OFFSET, &mmo) ==
>> 0); }
>>> +
>>>    igt_main
>>>    {
>>>    	int fd;
>>> @@ -273,6 +457,28 @@ igt_main
>>>    		test_mmap(fd, vram_memory(fd, 0) | system_memory(fd),
>>>
>> DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>>>
>>> +	igt_subtest("pci-membarrier") {
>>> +		igt_require(is_pci_membarrier_supported(fd));
>>> +		test_pci_membarrier(fd);
>>> +	}
>>> +
>>> +	igt_subtest("pci-membarrier-parallel") {
>>> +		int xe = drm_open_driver(DRIVER_XE);
>>> +
>>> +		igt_require(is_pci_membarrier_supported(fd));
>>> +		igt_fork(child, 1)
>>> +			test_pci_membarrier_parallel(xe, child);
>>> +		test_pci_membarrier_parallel(fd, -1);
>>> +		igt_waitchildren();
>>> +
>>> +		close(xe);
>>> +	}
>>> +
>>> +	igt_subtest("pci-membarrier-bad-pagesize") {
>>> +		igt_require(is_pci_membarrier_supported(fd));
>>> +		test_bad_pagesize_for_pcimem(fd);
>>> +	}
>>> +
>>>    	igt_subtest("bad-flags")
>>>    		test_bad_flags(fd);
>>>
>>> @@ -282,6 +488,11 @@ igt_main
>>>    	igt_subtest("bad-object")
>>>    		test_bad_object(fd);
>>>
>>> +	igt_subtest("pci-membarrier-bad-object") {
>>> +		igt_require(is_pci_membarrier_supported(fd));
>>> +		test_bad_object_for_pcimem(fd);
>>> +	}
>>> +
>>>    	igt_subtest("small-bar") {
>>>    		igt_require(xe_visible_vram_size(fd, 0));
>>>    		igt_require(xe_visible_vram_size(fd, 0) < xe_vram_size(fd, 0));
> 


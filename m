Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6F5FE77198
	for <intel-xe@archiver.kernel.org>; Mon,  6 Jan 2025 10:49:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C07310E611;
	Mon,  6 Jan 2025 10:49:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KpOv7y9f";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D3D310E611;
 Mon,  6 Jan 2025 10:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736160561; x=1767696561;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=+Y8TKd3GZQHBtW0smn7OWLeAMjmvtVRlv66hhgbZ2OM=;
 b=KpOv7y9fEO7XoMxIdZX7SUkm3rZ54C0oAH7Tgks3DGymli2hab/7krBS
 u8PESlL1dCc+oiItubspRY6TliZ6W8p1586Oj/4tZe/4ma+bSqPw7qvAl
 pWiX6nD7torHpPGQ4sF5XS00eo50FTooT9ht6npKRZQpk1NaChJq8sRTz
 NOcP8hddoqDNK5iLIVpTFrUJpl8KLzsHbF+h+xumCrC0lfaEqWEpSzYJk
 dI28K8eZ5Ynr8wGdaoDZQx69NaqEFl6TVxT9MT1j3sEehkkFh/W8fOhrI
 aO0juGBUSdgWwUH7TqU0mDatoadWFfEWURpC1Wnwv5/uD7U63LDpg0dYv g==;
X-CSE-ConnectionGUID: sj4/TrpnQEyvzx+MgErduw==
X-CSE-MsgGUID: gyZ4Q61MRTa4mEXGYCQ7EQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="46976482"
X-IronPort-AV: E=Sophos;i="6.12,292,1728975600"; d="scan'208";a="46976482"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2025 02:49:21 -0800
X-CSE-ConnectionGUID: /hdOn4noQB6/2DZUoDtJcA==
X-CSE-MsgGUID: 5BpR/ywvR0iv+MoVuKNgBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="139754032"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO [10.245.244.64])
 ([10.245.244.64])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2025 02:49:20 -0800
Message-ID: <ce01bc29-3022-43d0-ad90-f697e1b5e536@intel.com>
Date: Mon, 6 Jan 2025 10:49:17 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V6 4/4] tests/xe/mmap: add tests for pci mem barrier
To: Tejas Upadhyay <tejas.upadhyay@intel.com>, igt-dev@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
References: <20241230125757.2581381-1-tejas.upadhyay@intel.com>
 <20241230125757.2581381-5-tejas.upadhyay@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20241230125757.2581381-5-tejas.upadhyay@intel.com>
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

On 30/12/2024 12:57, Tejas Upadhyay wrote:
> We want to make sure that mmap do direct mapping of physical
> page at doorbell space and whole page is accessible in order
> to use pci memory barrier effect effectively.
> 
> Following subtests are added,
> ./build/tests/xe_mmap --r pci-membarrier
> ./build/tests/xe_mmap --r pci-membarrier-parallel
> ./build/tests/xe_mmap --r pci-membarrier-bad-pagesize
> ./build/tests/xe_mmap --r pci-membarrier-bad-object
> 
> V6(MAuld):
>   - checking differnet cross client value is enough in parallel test
> V5:
>   - Add pci-membarrier-parallel test
> V3(MAuld):
>   - Check if pci memory barrier is supported
> V2(MAuld)
>   - use do_ioctl and replace igt_subtest_f with igt_subtest
>   - Remove unused define
> 
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>   tests/intel/xe_mmap.c | 190 ++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 190 insertions(+)
> 
> diff --git a/tests/intel/xe_mmap.c b/tests/intel/xe_mmap.c
> index d818cc2f8..8e7095e48 100644
> --- a/tests/intel/xe_mmap.c
> +++ b/tests/intel/xe_mmap.c
> @@ -64,6 +64,140 @@ test_mmap(int fd, uint32_t placement, uint32_t flags)
>   	gem_close(fd, bo);
>   }
>   
> +#define PAGE_SIZE 4096
> +
> +/**
> + * SUBTEST: pci-membarrier
> + * Description: create pci memory barrier with write on defined mmap offset.
> + * Test category: functionality test
> + *
> + */
> +static void test_pci_membarrier(int xe)
> +{
> +	uint64_t flags = MAP_SHARED;
> +	unsigned int prot = PROT_WRITE;
> +	uint32_t *ptr;
> +	uint64_t size = PAGE_SIZE;
> +	struct timespec tv;
> +	struct drm_xe_gem_mmap_offset mmo = {
> +		.handle = 0,
> +		.flags = DRM_XE_MMAP_OFFSET_FLAG_PCI_BARRIER,
> +	};
> +
> +	do_ioctl(xe, DRM_IOCTL_XE_GEM_MMAP_OFFSET, &mmo);
> +	ptr = mmap(NULL, size, prot, flags, xe, mmo.offset);
> +	igt_assert(ptr != MAP_FAILED);
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
> +			while (READ_ONCE(ptr[i]) == i)
> +				;
> +			igt_info("fd:%d value retained for %"PRId64"ns pos:%d\n",
> +					xe, igt_nsec_elapsed(&tv), i);
> +		}
> +		igt_assert_neq(READ_ONCE(ptr[i]), i);
> +	}
> +
> +	munmap(ptr, size);
> +}
> +
> +/**
> + * SUBTEST: pci-membarrier-parallel
> + * Description: create parallel pci memory barrier with write on defined mmap offset.
> + * Test category: functionality test
> + *
> + */
> +static void test_pci_membarrier_parallel(int xe, int child)
> +{
> +	unsigned int bad_ns, elapsed;
> +	uint64_t flags = MAP_SHARED;
> +	unsigned int i;
> +	unsigned int prot = PROT_WRITE;
> +	uint32_t *ptr;
> +	uint64_t size = PAGE_SIZE;
> +	struct drm_xe_gem_mmap_offset mmo = {
> +		.handle = 0,
> +		.flags = DRM_XE_MMAP_OFFSET_FLAG_PCI_BARRIER,
> +	};
> +	struct timespec total, bad;
> +	int tpos = size / sizeof(*ptr);
> +	int value;
> +
> +	do_ioctl(xe, DRM_IOCTL_XE_GEM_MMAP_OFFSET, &mmo);
> +	ptr = mmap(NULL, size, prot, flags, xe, mmo.offset);
> +	igt_assert(ptr != MAP_FAILED);
> +
> +	/* Check any random position up to 1K */
> +	i = rand() % (size / sizeof(*ptr));

We should also re-seed at the start of the subtest or in the fixture?

> +	/* It is expected unconfigured doorbell space
> +	 * will return read value 0xdeadbeef
> +	 */
> +	igt_assert_eq_u32(READ_ONCE(ptr[i]), 0xdeadbeef);

Should we also use i below? Random index seems better than hardcoded.

> +
> +	igt_until_timeout(5) {

Could maybe instead delegate one client to be the reader and the other 
to be the writer in the same 5 second window. That way there is more 
opportunity to see a cross client write?

> +		/* Check clients should not be able to see each other */
> +		if (child != -1)
> +			value = tpos + 1;
> +		else
> +			value = tpos;
> +
> +		WRITE_ONCE(ptr[tpos-1], value);
> +	}
> +	bad_ns = 0;
> +	igt_gettime(&total);
> +	igt_until_timeout(5) { /* XXX sync with parent loop! */

Could also assert that we never see the cross client value here in the 
loop...

> +		if (READ_ONCE(ptr[tpos-1]) == value) {
> +			igt_gettime(&bad);
> +			while (READ_ONCE(ptr[tpos-1]) == value)
> +				;
> +			bad_ns += igt_nsec_elapsed(&bad);
> +		}
> +	}
> +	elapsed = igt_nsec_elapsed(&total);
> +	if (bad_ns) {
> +		igt_info("Cross-client writes visible %.1f%% of the time.\n",
> +				bad_ns * 100. / elapsed);
> +	}
> +	igt_assert(20 * bad_ns < elapsed); /* Arbitrary 5% threshold */
> +	if (child != -1)
> +		igt_assert_neq(READ_ONCE(ptr[tpos-1]), tpos);
> +	else
> +		igt_assert_neq(READ_ONCE(ptr[tpos-1]), tpos + 1);

..and then drop this? It seems more likely that we would see the cross 
client value in the 5 second window than here at the end.

> +	igt_assert_eq_u32(READ_ONCE(ptr[tpos-1]), 0xdeadbeef);
> +
> +	munmap(ptr, size);
> +}
> +
> +/**
> + * SUBTEST: pci-membarrier-bad-pagesize
> + * Description: Test mmap offset with bad pagesize for pci membarrier.
> + * Test category: negative test
> + *
> + */
> +static void test_bad_pagesize_for_pcimem(int fd)
> +{
> +	uint32_t *map;
> +	uint64_t page_size = PAGE_SIZE * 2;
> +	struct drm_xe_gem_mmap_offset mmo = {
> +		.handle = 0,
> +		.flags = DRM_XE_MMAP_OFFSET_FLAG_PCI_BARRIER,
> +	};
> +
> +	do_ioctl(fd, DRM_IOCTL_XE_GEM_MMAP_OFFSET, &mmo);
> +	map = mmap(NULL, page_size, PROT_WRITE, MAP_SHARED, fd, mmo.offset);
> +	igt_assert(map == MAP_FAILED);
> +}
> +
>   /**
>    * SUBTEST: bad-flags
>    * Description: Test mmap offset with bad flags.
> @@ -126,6 +260,25 @@ static void test_bad_object(int fd)
>   	do_ioctl_err(fd, DRM_IOCTL_XE_GEM_MMAP_OFFSET, &mmo, ENOENT);
>   }
>   
> +/**
> + * SUBTEST: pci-membarrier-bad-object
> + * Description: Test mmap offset with bad object for pci mem barrier.
> + * Test category: negative test
> + *
> + */
> +static void test_bad_object_for_pcimem(int fd)
> +{
> +	uint64_t size = xe_get_default_alignment(fd);
> +	struct drm_xe_gem_mmap_offset mmo = {
> +		.handle = xe_bo_create(fd, 0, size,
> +				       vram_if_possible(fd, 0),
> +				       DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM),
> +		.flags = DRM_XE_MMAP_OFFSET_FLAG_PCI_BARRIER,
> +	};
> +
> +	do_ioctl_err(fd, DRM_IOCTL_XE_GEM_MMAP_OFFSET, &mmo, EINVAL);
> +}
> +
>   static jmp_buf jmp;
>   
>   __noreturn static void sigtrap(int sig)
> @@ -260,6 +413,16 @@ static void test_cpu_caching(int fd)
>   	assert_caching(fd, system_memory(fd), 0, DRM_XE_GEM_CPU_CACHING_WC + 1, true);
>   }
>   
> +static bool is_pci_membarrier_supported(int fd)
> +{
> +	struct drm_xe_gem_mmap_offset mmo = {
> +		.handle = 0,
> +		.flags = DRM_XE_MMAP_OFFSET_FLAG_PCI_BARRIER,
> +	};
> +
> +	return (igt_ioctl(fd, DRM_IOCTL_XE_GEM_MMAP_OFFSET, &mmo) == 0);
> +}
> +
>   igt_main
>   {
>   	int fd;
> @@ -278,6 +441,28 @@ igt_main
>   		test_mmap(fd, vram_memory(fd, 0) | system_memory(fd),
>   			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>   
> +	igt_subtest("pci-membarrier") {
> +		igt_require(is_pci_membarrier_supported(fd));
> +		test_pci_membarrier(fd);
> +	}
> +
> +	igt_subtest("pci-membarrier-parallel") {
> +		int xe = drm_open_driver(DRIVER_XE);
> +
> +		igt_require(is_pci_membarrier_supported(fd));
> +		igt_fork(child, 1)
> +			test_pci_membarrier_parallel(xe, child);
> +		test_pci_membarrier_parallel(fd, -1);
> +		igt_waitchildren();
> +
> +		close(xe);
> +	}
> +
> +	igt_subtest("pci-membarrier-bad-pagesize") {
> +		igt_require(is_pci_membarrier_supported(fd));
> +		test_bad_pagesize_for_pcimem(fd);
> +	}
> +
>   	igt_subtest("bad-flags")
>   		test_bad_flags(fd);
>   
> @@ -287,6 +472,11 @@ igt_main
>   	igt_subtest("bad-object")
>   		test_bad_object(fd);
>   
> +	igt_subtest("pci-membarrier-bad-object") {
> +		igt_require(is_pci_membarrier_supported(fd));
> +		test_bad_object_for_pcimem(fd);
> +	}
> +
>   	igt_subtest("small-bar") {
>   		igt_require(xe_visible_vram_size(fd, 0));
>   		igt_require(xe_visible_vram_size(fd, 0) < xe_vram_size(fd, 0));


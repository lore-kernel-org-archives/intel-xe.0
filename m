Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F87CD6DDF0
	for <intel-xe@archiver.kernel.org>; Fri, 15 Nov 2024 10:50:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36E8D10E229;
	Fri, 15 Nov 2024 10:50:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iHvY9dCE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 125CD10E002;
 Fri, 15 Nov 2024 10:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731667833; x=1763203833;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=2bpVDFitV96zbU0CTFShGZpk8zL3d86eCfoM2GhD2OY=;
 b=iHvY9dCEXX+NIlH6TuTBVo6ZtbwAbVOIxJcD6cdXdwkCuOAEsDKKqRgi
 q+Q6GQHfADgcA2Wa5puZO09oln0gKlDvc91kCYHgxEUjqP9vv2tgACimD
 3JdIj8bocvM3+44CHieruqS4Q+UPzsTYrZNgwdBF6ZMmYoTL+DGk/liHw
 CWFZxOXCJjI3PMe39Mipkn5uO7vWmk707Wl40IFz2kEKhymFOA7l7x5Fe
 7z0OhtwUEh/OW5uKILQTS2VeCU4oZQEsnmM6h4ZRDKBru3MNIiNQpn5Bf
 XxDczeqxfVMN0B+zV1KCs3w4VuTUyNU8u6geEilZu0gtn7nP8XShK7KCr w==;
X-CSE-ConnectionGUID: 1TvLdbsITSSYJqLS6aYy8w==
X-CSE-MsgGUID: shut09FfRH+n03uVpeUr5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11256"; a="31804641"
X-IronPort-AV: E=Sophos;i="6.12,156,1728975600"; d="scan'208";a="31804641"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2024 02:50:33 -0800
X-CSE-ConnectionGUID: 1rVHISHdRiObHdm5gArxNQ==
X-CSE-MsgGUID: VbBFHm9PSA6feV88cDuOSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,156,1728975600"; d="scan'208";a="119348505"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO [10.245.244.175])
 ([10.245.244.175])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2024 02:50:32 -0800
Message-ID: <e71f0bd6-972a-471d-ba7a-bb081e5d1720@intel.com>
Date: Fri, 15 Nov 2024 10:50:29 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t 4/4] tests/xe/mmap: add tests for pci mem barrier
To: Tejas Upadhyay <tejas.upadhyay@intel.com>, igt-dev@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
References: <20241114050129.1381711-1-tejas.upadhyay@intel.com>
 <20241114050129.1381711-5-tejas.upadhyay@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20241114050129.1381711-5-tejas.upadhyay@intel.com>
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

On 14/11/2024 05:01, Tejas Upadhyay wrote:
> We want to make sure that mmap do direct mapping of physical
> page at doorbell space and whole page is accessible in order
> to use pci memory barrier effect effectively.
> 
> Following subtests are added,
> ./build/tests/xe_mmap --r pci-membarrier
> ./build/tests/xe_mmap --r pci-membarrier-bad-pagesize
> ./build/tests/xe_mmap --r pci-membarrier-bad-object
 > > Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>   tests/intel/xe_mmap.c | 96 +++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 96 insertions(+)
> 
> diff --git a/tests/intel/xe_mmap.c b/tests/intel/xe_mmap.c
> index fc5d73d59..ae0363a20 100644
> --- a/tests/intel/xe_mmap.c
> +++ b/tests/intel/xe_mmap.c
> @@ -64,6 +64,74 @@ test_mmap(int fd, uint32_t placement, uint32_t flags)
>   	gem_close(fd, bo);
>   }
>   
> +#define PAGE_SHIFT 12

Looks to be unused.

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
> +	igt_assert_eq(igt_ioctl(xe, DRM_IOCTL_XE_GEM_MMAP_OFFSET, &mmo), 0);

do_ioctl()

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
> +				 xe, igt_nsec_elapsed(&tv), i);
> +		}
> +		igt_assert_neq(READ_ONCE(ptr[i]), i);
> +	}
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
> +	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_GEM_MMAP_OFFSET, &mmo), 0);

do_ioctl()

> +	map = mmap(NULL, page_size, PROT_WRITE, MAP_SHARED, fd, mmo.offset);
> +	igt_assert(map == MAP_FAILED);
> +}
> +
>   /**
>    * SUBTEST: bad-flags
>    * Description: Test mmap offset with bad flags.
> @@ -126,6 +194,25 @@ static void test_bad_object(int fd)
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
> @@ -273,6 +360,12 @@ igt_main
>   		test_mmap(fd, vram_memory(fd, 0) | system_memory(fd),
>   			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>   
> +	igt_subtest("pci-membarrier")
> +		test_pci_membarrier(fd);
> +
> +	igt_subtest_f("pci-membarrier-bad-pagesize")

igt_subtest()

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> +		test_bad_pagesize_for_pcimem(fd);
> +
>   	igt_subtest("bad-flags")
>   		test_bad_flags(fd);
>   
> @@ -282,6 +375,9 @@ igt_main
>   	igt_subtest("bad-object")
>   		test_bad_object(fd);
>   
> +	igt_subtest("pci-membarrier-bad-object")
> +		test_bad_object_for_pcimem(fd);
> +
>   	igt_subtest("small-bar") {
>   		igt_require(xe_visible_vram_size(fd, 0));
>   		igt_require(xe_visible_vram_size(fd, 0) < xe_vram_size(fd, 0));


Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6748D41C00
	for <intel-xe@archiver.kernel.org>; Thu, 14 Nov 2024 04:20:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7423510E06A;
	Thu, 14 Nov 2024 04:20:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nFTr+5XP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5974010E06A
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Nov 2024 04:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731558046; x=1763094046;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=YVIWZls2hfJ7VYSlPL8sAB0nPPFY4ogRaKErX/qfjPU=;
 b=nFTr+5XPBDHe/20QiXTYhRS1ON9pBxJsHkJXBucRgfTg1ukK50kmI4rX
 g/q89Kcx5f2lKFyBgn1upiKgNTn0x8szT4NFPU6Uf0LPYrttEZIZA9FfB
 iNSo2x3TVdkv+Fa04ueQcMCl4AEir/VBArlvI10FkZ4Suh/lH6Hi39jSZ
 jubp9oXBRM2y8Gin2G0bRimkBXA3UVTEoZZrYnx+V8ONWcW4kqJ0/Dylp
 qJRJGtBnHeEOU32OhbnvuvrHuWbHyf0n5x3GrysC2XEg3OxAzPuljxCEV
 WyDA6cMFWr1KUziFwFnYMyUhLj8Cg2wjYZykeEoni+35OiUbrHnL2lW9T w==;
X-CSE-ConnectionGUID: zGOg7lPkQ4OwAgsyh4Wb9w==
X-CSE-MsgGUID: JgoqV2kLTOCJGPBXUoPlAw==
X-IronPort-AV: E=McAfee;i="6700,10204,11255"; a="35407492"
X-IronPort-AV: E=Sophos;i="6.12,153,1728975600"; d="scan'208";a="35407492"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 20:20:45 -0800
X-CSE-ConnectionGUID: UrnCjMjPTr2ogMm3HDdJkA==
X-CSE-MsgGUID: B5mR+kraRmOUlR81jExqDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,153,1728975600"; d="scan'208";a="92875745"
Received: from lkp-server01.sh.intel.com (HELO b014a344d658) ([10.239.97.150])
 by fmviesa004.fm.intel.com with ESMTP; 13 Nov 2024 20:20:43 -0800
Received: from kbuild by b014a344d658 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1tBRLU-00006X-1t;
 Thu, 14 Nov 2024 04:20:40 +0000
Date: Thu, 14 Nov 2024 12:20:23 +0800
From: kernel test robot <lkp@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Wilcox <willy@infradead.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] iov_iter: Provide copy_iomem_to|from_iter()
Message-ID: <202411141227.4kDiZIXM-lkp@intel.com>
References: <20241112200454.2211-2-michal.wajdeczko@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241112200454.2211-2-michal.wajdeczko@intel.com>
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

Hi Michal,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-xe/drm-xe-next]
[also build test WARNING on brauner-vfs/vfs.all akpm-mm/mm-nonmm-unstable linus/master v6.12-rc7 next-20241113]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Michal-Wajdeczko/iov_iter-Provide-copy_iomem_to-from_iter/20241113-080831
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20241112200454.2211-2-michal.wajdeczko%40intel.com
patch subject: [PATCH v2 1/4] iov_iter: Provide copy_iomem_to|from_iter()
config: arm-randconfig-r113-20241113 (https://download.01.org/0day-ci/archive/20241114/202411141227.4kDiZIXM-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce: (https://download.01.org/0day-ci/archive/20241114/202411141227.4kDiZIXM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411141227.4kDiZIXM-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   lib/iov_iter.c:373:47: sparse: sparse: cast removes address space '__iomem' of expression
   lib/iov_iter.c:386:47: sparse: sparse: cast removes address space '__iomem' of expression
>> lib/iov_iter.c:349:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const volatile [noderef] __iomem *from @@     got void * @@
   lib/iov_iter.c:349:9: sparse:     expected void const volatile [noderef] __iomem *from
   lib/iov_iter.c:349:9: sparse:     got void *
   lib/iov_iter.c:330:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const volatile [noderef] __iomem *from @@     got void * @@
   lib/iov_iter.c:330:9: sparse:     expected void const volatile [noderef] __iomem *from
   lib/iov_iter.c:330:9: sparse:     got void *
>> lib/iov_iter.c:362:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *to @@     got void *to @@
   lib/iov_iter.c:362:9: sparse:     expected void volatile [noderef] __iomem *to
   lib/iov_iter.c:362:9: sparse:     got void *to
>> lib/iov_iter.c:338:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *to @@     got void * @@
   lib/iov_iter.c:338:9: sparse:     expected void volatile [noderef] __iomem *to
   lib/iov_iter.c:338:9: sparse:     got void *

vim +349 lib/iov_iter.c

   333	
   334	static __always_inline
   335	size_t memcpy_iomem_from_iter(void *iter_from, size_t progress, size_t len,
   336				      void *to, void *priv2)
   337	{
 > 338		memcpy_toio(to + progress, iter_from, len);
   339		return 0;
   340	}
   341	
   342	static __always_inline
   343	size_t copy_iomem_to_user_iter(void __user *iter_to, size_t progress,
   344				       size_t len, void *from, void *priv2)
   345	{
   346		unsigned char buf[SMP_CACHE_BYTES];
   347		size_t chunk = min(len, sizeof(buf));
   348	
 > 349		memcpy_fromio(buf, from + progress, chunk);
   350		chunk -= copy_to_user_iter(iter_to, progress, chunk, buf, priv2);
   351		return len - chunk;
   352	}
   353	
   354	static __always_inline
   355	size_t copy_iomem_from_user_iter(void __user *iter_from, size_t progress,
   356					 size_t len, void *to, void *priv2)
   357	{
   358		unsigned char buf[SMP_CACHE_BYTES];
   359		size_t chunk = min(len, sizeof(buf));
   360	
   361		chunk -= copy_from_user_iter(iter_from, progress, chunk, buf, priv2);
 > 362		memcpy_toio(to, buf, chunk);
   363		return len - chunk;
   364	}
   365	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

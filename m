Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EB23C4332F
	for <intel-xe@archiver.kernel.org>; Tue,  7 Nov 2023 16:20:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC91910E0AB;
	Tue,  7 Nov 2023 16:20:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D853210E0AB
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Nov 2023 16:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699374042; x=1730910042;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=Hw2qCxBrQJiAQyIyzHHq5HcDq/UIQibaW/G9vl3/hv8=;
 b=L2vyJ1AsSab41DU3BI94i2yzr1IkErtKpkcHRVPH9UmMzdtN+7dFISe3
 OhKnd4SXTSKwBw/gxnJhpKdNVIDznXj2RGNTlvJdgKkQEfzo6loJVkg4h
 CoUXOiOrOowm+eum7ctdkpLdmrBjmfVUJcQkc341x6KqHAH0xMQRWvHzU
 GBR7RKXuf4h2GMrV7I2b3afCaNXP9la2d9sOjdj1ljKCiJ4wZgPqTY60u
 xpJMObgYHNYN1CU8gvbpYf0QHvp9VbvNsCvOoxCyCMRgb3mMFC44mGcdb
 Kv6/eqs9NI2JQ75YkjoKTb/05h/xiyH2vnUXtG36peX2riFpxqBywev/Y g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="456028278"
X-IronPort-AV: E=Sophos;i="6.03,284,1694761200"; d="scan'208";a="456028278"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2023 08:20:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="712614796"
X-IronPort-AV: E=Sophos;i="6.03,284,1694761200"; d="scan'208";a="712614796"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
 by orsmga003.jf.intel.com with ESMTP; 07 Nov 2023 08:20:40 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1r0Oog-0007Cx-0z;
 Tue, 07 Nov 2023 16:20:38 +0000
Date: Wed, 8 Nov 2023 00:19:26 +0800
From: kernel test robot <lkp@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <202311072341.c0UOmHni-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [Intel-xe] [drm-xe:drm-xe-next 1040/1907]
 drivers/gpu/drm/xe/xe_mmio.c:116:23: warning: result of comparison of
 constant 4294967296 with expression of type 'resource_size_t' (aka
 'unsigned int') is always false
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>, llvm@lists.linux.dev,
 intel-xe@lists.freedesktop.org, oe-kbuild-all@lists.linux.dev
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

tree:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
head:   17fc56818e8b2dd1311fa2b7716f3675db59bdb7
commit: bb41d0e9124f04871d07ca1e3dd4963074ace841 [1040/1907] drm/xe/mmio: Use non-atomic writeq/readq variant for 32b
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20231107/202311072341.c0UOmHni-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231107/202311072341.c0UOmHni-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311072341.c0UOmHni-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/xe/xe_mmio.c:116:23: warning: result of comparison of constant 4294967296 with expression of type 'resource_size_t' (aka 'unsigned int') is always false [-Wtautological-constant-out-of-range-compare]
                       root_res->start > 0x100000000ull)
                       ~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~
   1 warning generated.


vim +116 drivers/gpu/drm/xe/xe_mmio.c

ea1dfd1fe8933f Matthew Brost 2023-03-30   71  
ea1dfd1fe8933f Matthew Brost 2023-03-30   72  static int xe_resize_lmem_bar(struct xe_device *xe, resource_size_t lmem_size)
ea1dfd1fe8933f Matthew Brost 2023-03-30   73  {
ea1dfd1fe8933f Matthew Brost 2023-03-30   74  	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
ea1dfd1fe8933f Matthew Brost 2023-03-30   75  	struct pci_bus *root = pdev->bus;
ea1dfd1fe8933f Matthew Brost 2023-03-30   76  	struct resource *root_res;
ea1dfd1fe8933f Matthew Brost 2023-03-30   77  	resource_size_t rebar_size;
ea1dfd1fe8933f Matthew Brost 2023-03-30   78  	resource_size_t current_size;
ea1dfd1fe8933f Matthew Brost 2023-03-30   79  	u32 pci_cmd;
ea1dfd1fe8933f Matthew Brost 2023-03-30   80  	int i;
ea1dfd1fe8933f Matthew Brost 2023-03-30   81  	int ret;
ea1dfd1fe8933f Matthew Brost 2023-03-30   82  	u64 force_lmem_bar_size = xe_force_lmem_bar_size;
ea1dfd1fe8933f Matthew Brost 2023-03-30   83  
ea1dfd1fe8933f Matthew Brost 2023-03-30   84  	current_size = roundup_pow_of_two(pci_resource_len(pdev, GEN12_LMEM_BAR));
ea1dfd1fe8933f Matthew Brost 2023-03-30   85  
ea1dfd1fe8933f Matthew Brost 2023-03-30   86  	if (force_lmem_bar_size) {
ea1dfd1fe8933f Matthew Brost 2023-03-30   87  		u32 bar_sizes;
ea1dfd1fe8933f Matthew Brost 2023-03-30   88  
ea1dfd1fe8933f Matthew Brost 2023-03-30   89  		rebar_size = force_lmem_bar_size * (resource_size_t)SZ_1M;
ea1dfd1fe8933f Matthew Brost 2023-03-30   90  		bar_sizes = pci_rebar_get_possible_sizes(pdev, GEN12_LMEM_BAR);
ea1dfd1fe8933f Matthew Brost 2023-03-30   91  
ea1dfd1fe8933f Matthew Brost 2023-03-30   92  		if (rebar_size == current_size)
ea1dfd1fe8933f Matthew Brost 2023-03-30   93  			return 0;
ea1dfd1fe8933f Matthew Brost 2023-03-30   94  
ea1dfd1fe8933f Matthew Brost 2023-03-30   95  		if (!(bar_sizes & BIT(pci_rebar_bytes_to_size(rebar_size))) ||
ea1dfd1fe8933f Matthew Brost 2023-03-30   96  		    rebar_size >= roundup_pow_of_two(lmem_size)) {
ea1dfd1fe8933f Matthew Brost 2023-03-30   97  			rebar_size = lmem_size;
ea1dfd1fe8933f Matthew Brost 2023-03-30   98  			drm_info(&xe->drm,
ea1dfd1fe8933f Matthew Brost 2023-03-30   99  				 "Given bar size is not within supported size, setting it to default: %llu\n",
ea1dfd1fe8933f Matthew Brost 2023-03-30  100  				 (u64)lmem_size >> 20);
ea1dfd1fe8933f Matthew Brost 2023-03-30  101  		}
ea1dfd1fe8933f Matthew Brost 2023-03-30  102  	} else {
ea1dfd1fe8933f Matthew Brost 2023-03-30  103  		rebar_size = current_size;
ea1dfd1fe8933f Matthew Brost 2023-03-30  104  
ea1dfd1fe8933f Matthew Brost 2023-03-30  105  		if (rebar_size != roundup_pow_of_two(lmem_size))
ea1dfd1fe8933f Matthew Brost 2023-03-30  106  			rebar_size = lmem_size;
ea1dfd1fe8933f Matthew Brost 2023-03-30  107  		else
ea1dfd1fe8933f Matthew Brost 2023-03-30  108  			return 0;
ea1dfd1fe8933f Matthew Brost 2023-03-30  109  	}
ea1dfd1fe8933f Matthew Brost 2023-03-30  110  
ea1dfd1fe8933f Matthew Brost 2023-03-30  111  	while (root->parent)
ea1dfd1fe8933f Matthew Brost 2023-03-30  112  		root = root->parent;
ea1dfd1fe8933f Matthew Brost 2023-03-30  113  
ea1dfd1fe8933f Matthew Brost 2023-03-30  114  	pci_bus_for_each_resource(root, root_res, i) {
ea1dfd1fe8933f Matthew Brost 2023-03-30  115  		if (root_res && root_res->flags & (IORESOURCE_MEM | IORESOURCE_MEM_64) &&
ea1dfd1fe8933f Matthew Brost 2023-03-30 @116  		    root_res->start > 0x100000000ull)
ea1dfd1fe8933f Matthew Brost 2023-03-30  117  			break;
ea1dfd1fe8933f Matthew Brost 2023-03-30  118  	}
ea1dfd1fe8933f Matthew Brost 2023-03-30  119  
ea1dfd1fe8933f Matthew Brost 2023-03-30  120  	if (!root_res) {
ea1dfd1fe8933f Matthew Brost 2023-03-30  121  		drm_info(&xe->drm, "Can't resize LMEM BAR - platform support is missing\n");
ea1dfd1fe8933f Matthew Brost 2023-03-30  122  		return -1;
ea1dfd1fe8933f Matthew Brost 2023-03-30  123  	}
ea1dfd1fe8933f Matthew Brost 2023-03-30  124  
ea1dfd1fe8933f Matthew Brost 2023-03-30  125  	pci_read_config_dword(pdev, PCI_COMMAND, &pci_cmd);
ea1dfd1fe8933f Matthew Brost 2023-03-30  126  	pci_write_config_dword(pdev, PCI_COMMAND, pci_cmd & ~PCI_COMMAND_MEMORY);
ea1dfd1fe8933f Matthew Brost 2023-03-30  127  
ea1dfd1fe8933f Matthew Brost 2023-03-30  128  	ret = _resize_bar(xe, GEN12_LMEM_BAR, rebar_size);
ea1dfd1fe8933f Matthew Brost 2023-03-30  129  
ea1dfd1fe8933f Matthew Brost 2023-03-30  130  	pci_assign_unassigned_bus_resources(pdev->bus);
ea1dfd1fe8933f Matthew Brost 2023-03-30  131  	pci_write_config_dword(pdev, PCI_COMMAND, pci_cmd);
ea1dfd1fe8933f Matthew Brost 2023-03-30  132  	return ret;
ea1dfd1fe8933f Matthew Brost 2023-03-30  133  }
ea1dfd1fe8933f Matthew Brost 2023-03-30  134  

:::::: The code at line 116 was first introduced by commit
:::::: ea1dfd1fe8933f85ee3a2b3d6ad6b378d5b1a468 drm/xe: Introduce a new DRM driver for Intel GPUs

:::::: TO: Matthew Brost <matthew.brost@intel.com>
:::::: CC: Rodrigo Vivi <rodrigo.vivi@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

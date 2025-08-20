Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BC9CCA0EDC
	for <intel-xe@archiver.kernel.org>; Wed, 20 Aug 2025 18:31:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11CA110E7C8;
	Wed, 20 Aug 2025 18:31:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UTtmuYZh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47F0410E7C8
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Aug 2025 18:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755714693; x=1787250693;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=odKuUwppF1tAKXek3OL0+/6yPLjV/i+MWkX+owgQf/A=;
 b=UTtmuYZhXWBSRqQtSvFkMIJf1DmQkt7mm6ikbswShyD21N7PEIhRU2lx
 LJ2i4XuTL8dY+GYQ/xh5c0DVHVYdzTZw4yxZ3+gbORibwhe0404CB4GN1
 7M78mJMLRrKy/3phqhDCr7XxA4OVed0fZuQmywgExX1jCxV9ZS6jEcQSa
 Mku78YCbeBRynXe8dkXzPzX12VoXyl8elzUptXIheWxYGSn0gJfUqBGLc
 fhcogcBJDHSzsYBSujzsjHyjc5PTh3ZIA22eZ1ci+gEyJa7Y5Ye0O5jtL
 aO650ZXe3Obo7T1Ajto95dPNAX9V8tByTXT4kjQBItLuomIYHx1tz49Dx g==;
X-CSE-ConnectionGUID: 2V7Jz0GaR6OzRoolrUSUtQ==
X-CSE-MsgGUID: I3h5g9bBQeaDrCJoCiVbvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="60620380"
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; d="scan'208";a="60620380"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2025 11:31:33 -0700
X-CSE-ConnectionGUID: DWjqdWMDTSKUkQgSr9qtaw==
X-CSE-MsgGUID: L0ZGg7U+QJiBRvH/Uax2HQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; d="scan'208";a="167406830"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
 by orviesa006.jf.intel.com with ESMTP; 20 Aug 2025 11:31:29 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uonao-000Jb9-2t;
 Wed, 20 Aug 2025 18:31:26 +0000
Date: Thu, 21 Aug 2025 02:31:13 +0800
From: kernel test robot <lkp@intel.com>
To: David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>,
 Marie Zhussupova <marievic@google.com>, marievictoria875@gmail.com,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Shuah Khan <skhan@linuxfoundation.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 David Gow <davidgow@google.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 intel-xe@lists.freedesktop.org, kunit-dev@googlegroups.com,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] drm/xe/tests: Fix some additional gen_params
 signatures
Message-ID: <202508210248.4CiPvWGD-lkp@intel.com>
References: <20250819073434.1411114-1-davidgow@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250819073434.1411114-1-davidgow@google.com>
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

Hi David,

kernel test robot noticed the following build errors:

[auto build test ERROR on shuah-kselftest/kunit]
[also build test ERROR on linus/master v6.17-rc2 next-20250820]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Gow/kunit-Only-output-a-test-plan-if-we-re-using-kunit_array_gen_params/20250819-154731
base:   https://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git kunit
patch link:    https://lore.kernel.org/r/20250819073434.1411114-1-davidgow%40google.com
patch subject: [PATCH 1/2] drm/xe/tests: Fix some additional gen_params signatures
config: x86_64-randconfig-071-20250820 (https://download.01.org/0day-ci/archive/20250821/202508210248.4CiPvWGD-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250821/202508210248.4CiPvWGD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508210248.4CiPvWGD-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <built-in>:4:
>> drivers/gpu/drm/xe/tests/xe_pci_test.h:28:49: error: declaration of 'struct kunit' will not be visible outside of this function [-Werror,-Wvisibility]
      28 | const void *xe_pci_graphics_ip_gen_param(struct kunit *test, const void *prev, char *desc);
         |                                                 ^
   drivers/gpu/drm/xe/tests/xe_pci_test.h:29:46: error: declaration of 'struct kunit' will not be visible outside of this function [-Werror,-Wvisibility]
      29 | const void *xe_pci_media_ip_gen_param(struct kunit *test, const void *prev, char *desc);
         |                                              ^
   drivers/gpu/drm/xe/tests/xe_pci_test.h:30:40: error: declaration of 'struct kunit' will not be visible outside of this function [-Werror,-Wvisibility]
      30 | const void *xe_pci_id_gen_param(struct kunit *test, const void *prev, char *desc);
         |                                        ^
   drivers/gpu/drm/xe/tests/xe_pci_test.h:31:49: error: declaration of 'struct kunit' will not be visible outside of this function [-Werror,-Wvisibility]
      31 | const void *xe_pci_live_device_gen_param(struct kunit *test, const void *prev, char *desc);
         |                                                 ^
   4 errors generated.


vim +28 drivers/gpu/drm/xe/tests/xe_pci_test.h

    27	
  > 28	const void *xe_pci_graphics_ip_gen_param(struct kunit *test, const void *prev, char *desc);
    29	const void *xe_pci_media_ip_gen_param(struct kunit *test, const void *prev, char *desc);
    30	const void *xe_pci_id_gen_param(struct kunit *test, const void *prev, char *desc);
    31	const void *xe_pci_live_device_gen_param(struct kunit *test, const void *prev, char *desc);
    32	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

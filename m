Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FC52C48BD7
	for <intel-xe@archiver.kernel.org>; Wed, 15 Nov 2023 14:12:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 215D010E059;
	Wed, 15 Nov 2023 14:12:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E148810E046;
 Wed, 15 Nov 2023 14:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700057578; x=1731593578;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=WS8UIze/6Lz0J4s8CrP1OtmfOMg4p9n6G92sw9WDlSQ=;
 b=OPJjAl4jCQvrXKvtI7aHcflwx5OdMEVvmlXTudMrwlAmRSHFbLbbrrni
 t5MtxOkWxN6Z+PXpNBJVf0ngcynS0xLkbWZ59m/got/kP7xYoISdLxKKt
 lpgP5KcwgeSxLJlPXxv3ACCXwBjDET6i3P1lNkHJKEQ7dXRyRRY3PPLLM
 tUb1On4SpaLzFMlpVNguRxYFX5LoFzAFrT3unlTbCSUFbhovusQ3e+QuN
 PmaH51t2o5oEMvVKTWlBEv47dp9tagf/9ts8iK2VEcqKES4Bdl9V6UhVT
 wd2XXI1yHnzQqt9287FRI8iGqZdRhjj6bvDfJJ0WvhtUJU3uNpVPBIPsP A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="370226131"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; d="scan'208";a="370226131"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2023 06:12:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="794170591"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; d="scan'208";a="794170591"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
 by orsmga008.jf.intel.com with ESMTP; 15 Nov 2023 06:12:54 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1r3GdQ-0000OH-09;
 Wed, 15 Nov 2023 14:12:52 +0000
Date: Wed, 15 Nov 2023 22:11:45 +0800
From: kernel test robot <lkp@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Message-ID: <202311152144.cn5cUZqV-lkp@intel.com>
References: <20231110182231.1730-1-michal.wajdeczko@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231110182231.1730-1-michal.wajdeczko@intel.com>
Subject: Re: [Intel-xe] [PATCH] drm/doc/rfc: SR-IOV support on the new Xe
 driver
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, oe-kbuild-all@lists.linux.dev
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi Michal,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on drm/drm-next drm-exynos/exynos-drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.7-rc1 next-20231115]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Michal-Wajdeczko/drm-doc-rfc-SR-IOV-support-on-the-new-Xe-driver/20231111-022816
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20231110182231.1730-1-michal.wajdeczko%40intel.com
patch subject: [PATCH] drm/doc/rfc: SR-IOV support on the new Xe driver
reproduce: (https://download.01.org/0day-ci/archive/20231115/202311152144.cn5cUZqV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311152144.cn5cUZqV-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: Documentation/gpu/rfc/sysfs-driver-xe-sriov references a file that doesn't exist: Documentation/ABI/testing/sysfs-driver-xe-sriov

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8F27CE7A89
	for <intel-xe@archiver.kernel.org>; Sun, 24 Sep 2023 01:18:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93A0810E01F;
	Sun, 24 Sep 2023 01:18:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1108D10E01F;
 Sun, 24 Sep 2023 01:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695518303; x=1727054303;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=UQj8s4YVJVoEfVoqixE6d2BVAipzZTUWqi0a6wZkX94=;
 b=OEWT7P8MGyeLz5F2kLotFlVl/TlW5KHiCnyoV0IapXk2xr73rJ612/Xe
 AO6CLZTJ/Udrf6bBDOW6PN5UqVK29+Nzw5lha/aNxsf/99lnRaE/3twMZ
 +lEZ14ArmQK7rLvLo+XkTUchjr5FwvRxzZp66PkL0uVoHqVPdZbFfOoCx
 896HLKoOstXt71fNNJX6nbQDKlpai67ekXrA4Al5ux4B46Jc1cIwu+2zD
 qEOqjFP2ipvZvvkUl/RR3NK++4U4oGp+GgsBMJim8HgSTPOpEzQKf8KFP
 QZZ6qsNRVpFVO0GA4Wfxq2XvP/TUDEPAV/LMjkrUx75eSi3nl5ii3+FPJ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10842"; a="411998605"
X-IronPort-AV: E=Sophos;i="6.03,171,1694761200"; d="scan'208";a="411998605"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2023 18:18:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10842"; a="813521585"
X-IronPort-AV: E=Sophos;i="6.03,171,1694761200"; d="scan'208";a="813521585"
Received: from lkp-server02.sh.intel.com (HELO 493f6c7fed5d) ([10.239.97.151])
 by fmsmga008.fm.intel.com with ESMTP; 23 Sep 2023 18:18:18 -0700
Received: from kbuild by 493f6c7fed5d with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qkDlI-00034W-05;
 Sun, 24 Sep 2023 01:18:16 +0000
Date: Sun, 24 Sep 2023 09:18:13 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Brost <matthew.brost@intel.com>,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Message-ID: <202309240829.jXx6CtQ0-lkp@intel.com>
References: <20230919050155.2647172-4-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230919050155.2647172-4-matthew.brost@intel.com>
Subject: Re: [Intel-xe] [PATCH v4 03/10] drm/sched: Move schedule policy to
 scheduler
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
Cc: robdclark@chromium.org, mcanal@igalia.com, sarah.walker@imgtec.com,
 ketil.johnsen@arm.com, lina@asahilina.net, oe-kbuild-all@lists.linux.dev,
 Liviu.Dudau@arm.com, boris.brezillon@collabora.com, luben.tuikov@amd.com,
 dakr@redhat.com, donald.robson@imgtec.com, christian.koenig@amd.com,
 faith.ekstrand@collabora.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi Matthew,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm/drm-next]
[also build test WARNING on drm-exynos/exynos-drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.6-rc2 next-20230921]
[cannot apply to drm-misc/drm-misc-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Matthew-Brost/drm-sched-Add-drm_sched_submit_-helpers/20230919-130353
base:   git://anongit.freedesktop.org/drm/drm drm-next
patch link:    https://lore.kernel.org/r/20230919050155.2647172-4-matthew.brost%40intel.com
patch subject: [PATCH v4 03/10] drm/sched: Move schedule policy to scheduler
config: i386-randconfig-063-20230924 (https://download.01.org/0day-ci/archive/20230924/202309240829.jXx6CtQ0-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230924/202309240829.jXx6CtQ0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309240829.jXx6CtQ0-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/scheduler/sched_main.c:69:5: sparse: sparse: symbol 'drm_sched_policy_default' was not declared. Should it be static?

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E4DDC4332F
	for <intel-xe@archiver.kernel.org>; Sat, 11 Nov 2023 07:38:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D02110E099;
	Sat, 11 Nov 2023 07:38:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FEA710E099
 for <intel-xe@lists.freedesktop.org>; Sat, 11 Nov 2023 07:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699688315; x=1731224315;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=C6BY88badSpVTD6TKEk2NjB+fBSGGycdZUunr9OjOA8=;
 b=EssFxnIZUcM/TA9Gl2Bt0jworbd8rfK6uooAlxEIgR5dDhhY0sG0jPQR
 I2FirYRdcN/OGPQykK2VJ0Z4OJIKq/HLXm3Xl0GcPp5wOJdQ26c0iSIEk
 cHfAVX/OoULGoye+NRXj6JjdudMz8s3mRpbycraJRhzlXcmLO6j+qHUug
 jSVbOps37DrJH+p1MlL1KJ6N/+KaP7UFz1Ybb6L3giSNxJeUQuEHz2p3K
 TMXRj5WN2i223g2mNSa5aWrF70aqA4WAG0WyrBuPLs1k6mYeq6h17iEon
 LkcKk2Z4pOSfGrieENBOLv3ux73aqBvXxr02BrblxRjlt2olVl95VqIKq Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="454563380"
X-IronPort-AV: E=Sophos;i="6.03,294,1694761200"; d="scan'208";a="454563380"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2023 23:38:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="740318734"
X-IronPort-AV: E=Sophos;i="6.03,294,1694761200"; d="scan'208";a="740318734"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
 by orsmga006.jf.intel.com with ESMTP; 10 Nov 2023 23:38:30 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1r1iZY-000AIj-0e;
 Sat, 11 Nov 2023 07:38:28 +0000
Date: Sat, 11 Nov 2023 15:38:24 +0800
From: kernel test robot <lkp@intel.com>
To: Badal Nilawar <badal.nilawar@intel.com>
Message-ID: <202311111546.yozUaR9N-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [Intel-xe] [drm-xe:drm-xe-next 1708/1927] htmldocs: Warning:
 /sys/devices/.../hwmon/hwmon<i>/power1_max is defined 2 times:
 ./Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon:0
 ./Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon:8
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
Cc: linux-doc@vger.kernel.org, oe-kbuild-all@lists.linux.dev,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

tree:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
head:   b3890fb4386dcef68a96888141c4cc773f6241ce
commit: 1be1e64c654d3c9a22badb904e5b889372c0c918 [1708/1927] drm/xe/hwmon: Expose power attributes
reproduce: (https://download.01.org/0day-ci/archive/20231111/202311111546.yozUaR9N-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311111546.yozUaR9N-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: /sys/devices/.../hwmon/hwmon<i>/power1_max is defined 2 times:  ./Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon:0  ./Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon:8
>> Warning: /sys/devices/.../hwmon/hwmon<i>/power1_rated_max is defined 2 times:  ./Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon:14  ./Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon:22

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

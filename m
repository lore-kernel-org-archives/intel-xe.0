Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB751C4332F
	for <intel-xe@archiver.kernel.org>; Sun, 12 Nov 2023 03:06:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D00810E06A;
	Sun, 12 Nov 2023 03:06:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35DF610E06A
 for <intel-xe@lists.freedesktop.org>; Sun, 12 Nov 2023 03:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699758385; x=1731294385;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=0/GZmiUQZLT7N6gdo7RPtuMbqt26CGD1zlfcqvoI/V8=;
 b=kLFgGHTSizr12v84F5yLi1hxSI+Xrl55gtBYySeI3BhTKzcLy0fGoeFf
 nv7yTk2rAb9sefmrhE7cPdtwMjRTtWiX/xPzOO7VnNtLpXBP9sUcqxTJk
 uRfGV9I8jqG79oCR3784QYJrnWUn22IyQtcGDHarlbl4PAQWsubc8x6W/
 DgZX+5DAtUe4JAiwEeJ+cTrFoJMsgG2Iu0NHyHZfoob2jY83c2DkAD6Zx
 j+iPipdbFz0D0BnEImcKCAylIhn7Eu8pX+jDHdlUJiASvmHxIxatR1sk2
 rX0ApZO2citPHIUPF4gUlD8jQO9a7pshW4h7MfR/Th0yifExBdfupBgTY w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10891"; a="421404215"
X-IronPort-AV: E=Sophos;i="6.03,296,1694761200"; d="scan'208";a="421404215"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2023 19:06:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10891"; a="793144761"
X-IronPort-AV: E=Sophos;i="6.03,296,1694761200"; d="scan'208";a="793144761"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
 by orsmga008.jf.intel.com with ESMTP; 11 Nov 2023 19:06:22 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1r20nj-000AuT-1i;
 Sun, 12 Nov 2023 03:06:19 +0000
Date: Sun, 12 Nov 2023 11:06:16 +0800
From: kernel test robot <lkp@intel.com>
To: Badal Nilawar <badal.nilawar@intel.com>
Message-ID: <202311121142.MtDMs0cZ-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [Intel-xe] [drm-xe:drm-xe-next 1711/1931] htmldocs: Warning:
 /sys/devices/.../hwmon/hwmon<i>/energy1_input is defined 2 times:
 ./Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon:54
 ./Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon:65
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
head:   edeb8b8fa330a62d4a07b37d08145d86114bc151
commit: 0cad162e5ce80387307564245d60722d97d9eaa5 [1711/1931] drm/xe/hwmon: Expose hwmon energy attribute
reproduce: (https://download.01.org/0day-ci/archive/20231112/202311121142.MtDMs0cZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311121142.MtDMs0cZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: /sys/devices/.../hwmon/hwmon<i>/energy1_input is defined 2 times:  ./Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon:54  ./Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon:65

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

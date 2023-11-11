Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F3C0C4332F
	for <intel-xe@archiver.kernel.org>; Sat, 11 Nov 2023 13:33:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48CF610E28F;
	Sat, 11 Nov 2023 13:33:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ECE110E28F
 for <intel-xe@lists.freedesktop.org>; Sat, 11 Nov 2023 13:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699709589; x=1731245589;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=6D1Q7j+Nf7iqC0LnVVnrA9iEwQ+/WRP+cKlLfcQbai4=;
 b=TFSH9mr2VqYO2O0CSmduKMUAjH0ERn2wo6QKuiGBbi1hcnwhW/E+O4px
 wtSS/1luHVX/3l3X4jkw9jhzihhRPd97FCr58U1Iy8nnskoWc8/YZUGtG
 F9Sq1tmSWQacJcAVHND5LI1pg0LYkgX2fXnyf/5xQUB82TswbYnor9sFq
 FprKWy22gv16a6QKYYcj8zpwriVons6kS9bWreHXzX/NEuRBmrmi+YfKR
 uIZt0oXMEUwLNIe560gaAbotvvDWi2qv1Rm3pcwXZ/lt/o/YTS9RfTDA4
 PgVqu/eB6Sr7RnkwtRNB4wOq93YANGFmjhAD+IKMEF8w/kipYPlXOsPPf w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10891"; a="456771932"
X-IronPort-AV: E=Sophos;i="6.03,295,1694761200"; d="scan'208";a="456771932"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2023 05:33:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10891"; a="887550877"
X-IronPort-AV: E=Sophos;i="6.03,295,1694761200"; d="scan'208";a="887550877"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
 by orsmga004.jf.intel.com with ESMTP; 11 Nov 2023 05:33:06 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1r1o6h-000ATk-33;
 Sat, 11 Nov 2023 13:33:03 +0000
Date: Sat, 11 Nov 2023 21:32:44 +0800
From: kernel test robot <lkp@intel.com>
To: Badal Nilawar <badal.nilawar@intel.com>
Message-ID: <202311112157.QOcNbbvO-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [Intel-xe] [drm-xe:drm-xe-next 1709/1927] htmldocs: Warning:
 /sys/devices/.../hwmon/hwmon<i>/curr1_crit is defined 2 times:
 ./Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon:35
 ./Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon:52
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
commit: 052cd881aa7a198a510bbbd94fd1859c497c75f8 [1709/1927] drm/xe/hwmon: Expose card reactive critical power
reproduce: (https://download.01.org/0day-ci/archive/20231111/202311112157.QOcNbbvO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311112157.QOcNbbvO-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: /sys/devices/.../hwmon/hwmon<i>/curr1_crit is defined 2 times:  ./Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon:35  ./Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon:52
>> Warning: /sys/devices/.../hwmon/hwmon<i>/power1_crit is defined 2 times:  ./Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon:22  ./Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon:39

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

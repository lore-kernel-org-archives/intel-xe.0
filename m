Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12C29C61DF4
	for <intel-xe@archiver.kernel.org>; Sat, 25 Nov 2023 00:19:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A137510E814;
	Sat, 25 Nov 2023 00:19:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CD9B10E814
 for <intel-xe@lists.freedesktop.org>; Sat, 25 Nov 2023 00:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700871579; x=1732407579;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=F4N9PNwQKYEElwcro6ShUUOLIAJISn+hfskynoE/BFA=;
 b=YLw+8hHmg7wejzt7gTAcim/9pzxVKtl0OMTbO+ZvTGUjR13LDi+WwrMT
 jrSd715au8fmcZl2dv+9rsKiQKZSkm8/YPGqssM75MZm7fYPmIy3ZD13e
 gFrJL7/psq0A9VRINLWtCESA2UQM3p9MUGZAnNGOH4ovgeX8YimaVIQU3
 vpA0Mq2HTc61OGpFRzxoVfeTUKwcd2eY1dv47tU5aCRH2WNmqUkGmCbTB
 A+4GubJWmzsND6t67UnggHxKk3K3UrI4LhIVcuNsg73ba5Ip4jpmnwPww
 39IBBy0BAMk+K+q+v64vM7YrjXnqSy9K08Hy96uaLDC+uLx8xYdeYRQb7 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="391350877"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; d="scan'208";a="391350877"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2023 16:19:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="911558730"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; d="scan'208";a="911558730"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
 by fmsmga001.fm.intel.com with ESMTP; 24 Nov 2023 16:19:37 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1r6gOV-0003QY-09;
 Sat, 25 Nov 2023 00:19:35 +0000
Date: Sat, 25 Nov 2023 08:18:39 +0800
From: kernel test robot <lkp@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <202311250637.lvc4Xqzu-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [Intel-xe] [drm-xe:drm-xe-next 879/898] ld.lld: error: undefined
 symbol: wmi_query_block
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
 Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org,
 oe-kbuild-all@lists.linux.dev
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

tree:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
head:   1832821c7e4c5bd24353183f060f1435b2eb7992
commit: 556206e017f1aebd4b3637bf8b0e65606c0b1796 [879/898] drm/xe/display: Implement display support
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20231125/202311250637.lvc4Xqzu-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231125/202311250637.lvc4Xqzu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311250637.lvc4Xqzu-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: wmi_query_block
   >>> referenced by surface3-wmi.c
   >>>               drivers/platform/surface/surface3-wmi.o:(s3_wmi_send_lid_state) in archive vmlinux.a
   >>> referenced by hp-wmi-sensors.c
   >>>               drivers/hwmon/hp-wmi-sensors.o:(hp_wmi_sensors_probe) in archive vmlinux.a
   >>> referenced by hp-wmi-sensors.c
   >>>               drivers/hwmon/hp-wmi-sensors.o:(hp_wmi_sensors_probe) in archive vmlinux.a
   >>> referenced 1 more times
--
>> ld.lld: error: undefined symbol: wmi_instance_count
   >>> referenced by hp-wmi-sensors.c
   >>>               drivers/hwmon/hp-wmi-sensors.o:(hp_wmi_sensors_probe) in archive vmlinux.a
   >>> referenced by hp-wmi-sensors.c
   >>>               drivers/hwmon/hp-wmi-sensors.o:(hp_wmi_sensors_probe) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: wmi_install_notify_handler
   >>> referenced by hp-wmi-sensors.c
   >>>               drivers/hwmon/hp-wmi-sensors.o:(hp_wmi_sensors_probe) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: wmi_remove_notify_handler
   >>> referenced by hp-wmi-sensors.c
   >>>               drivers/hwmon/hp-wmi-sensors.o:(hp_wmi_sensors_probe) in archive vmlinux.a
   >>> referenced by hp-wmi-sensors.c
   >>>               drivers/hwmon/hp-wmi-sensors.o:(hp_wmi_devm_notify_remove) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: wmi_evaluate_method
   >>> referenced by asus_wmi_sensors.c
   >>>               drivers/hwmon/asus_wmi_sensors.o:(asus_wmi_probe) in archive vmlinux.a
   >>> referenced by asus_wmi_sensors.c
   >>>               drivers/hwmon/asus_wmi_sensors.o:(asus_wmi_probe) in archive vmlinux.a
   >>> referenced by asus_wmi_sensors.c
   >>>               drivers/hwmon/asus_wmi_sensors.o:(asus_wmi_sensor_info) in archive vmlinux.a
   >>> referenced 4 more times
--
>> ld.lld: error: undefined symbol: wmi_get_event_data
   >>> referenced by hp-wmi-sensors.c
   >>>               drivers/hwmon/hp-wmi-sensors.o:(hp_wmi_notify) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: __wmi_driver_register
   >>> referenced by hp-wmi-sensors.c
   >>>               drivers/hwmon/hp-wmi-sensors.o:(hp_wmi_sensors_driver_init) in archive vmlinux.a
   >>> referenced by asus_wmi_sensors.c
   >>>               drivers/hwmon/asus_wmi_sensors.o:(asus_sensors_wmi_driver_init) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: wmi_driver_unregister
   >>> referenced by hp-wmi-sensors.c
   >>>               drivers/hwmon/hp-wmi-sensors.o:(hp_wmi_sensors_driver_exit) in archive vmlinux.a
   >>> referenced by asus_wmi_sensors.c
   >>>               drivers/hwmon/asus_wmi_sensors.o:(asus_sensors_wmi_driver_exit) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: wmi_has_guid
   >>> referenced by base.c
   >>>               drivers/gpu/drm/nouveau/nvkm/subdev/mxm/base.o:(mxm_shadow_wmi) in archive vmlinux.a

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for ACPI_WMI
   Depends on [n]: X86_PLATFORM_DEVICES [=n] && ACPI [=y]
   Selected by [y]:
   - DRM_XE [=y] && HAS_IOMEM [=y] && DRM [=y] && PCI [=y] && MMU [=y] && (m && MODULES [=y] || y && KUNIT [=y]=y) && ACPI [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

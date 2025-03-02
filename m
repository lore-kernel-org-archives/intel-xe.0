Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5778BC19F32
	for <intel-xe@archiver.kernel.org>; Sun,  2 Mar 2025 11:50:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F37AA10E08C;
	Sun,  2 Mar 2025 11:50:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ngBjMhhy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74C3610E070
 for <intel-xe@lists.freedesktop.org>; Sun,  2 Mar 2025 11:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740916201; x=1772452201;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=MtvXPfYUEsuxZNsXtgyJ1YpV2uHuWHcgR1znV7/bRr4=;
 b=ngBjMhhyEbTbgXWVAwroBm/NwnDGgYOqMvXgL0ufRhmKesOtXNPcPEqm
 UTa2hX931Y7xD33MO/SG/kB9ZqBBs9N+ZvmHAFY1kc/awDUqaRS2J+zpe
 sFcANqC55NIBRvZweFfatyEnq6hp4Zv6onHpPIrkdy9g7JCQ9W8YU2VcR
 PkC0POQlDBDsFVcMzp4RrFj8jjwEEbDQWnSKWN/2fGi32feCC4XUUrfVR
 ngCJdCPxv2NIoi7/CZQ3vtgWtGExwwkYE8ga6jgb/dmigUFCynDoOwv5g
 PaEXn2W2dDO1xWgMJbiLQPS71XZRVSK59uFLt32s0y/hUj6v6w7YISr4y A==;
X-CSE-ConnectionGUID: eVTSIKmoRXyeO1GD1Fptdg==
X-CSE-MsgGUID: wcX7d8/vQIGK4xhaYWu/bg==
X-IronPort-AV: E=McAfee;i="6700,10204,11360"; a="41919712"
X-IronPort-AV: E=Sophos;i="6.13,327,1732608000"; d="scan'208";a="41919712"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2025 03:49:54 -0800
X-CSE-ConnectionGUID: /kWvElUHR7aB4xvk61ESVA==
X-CSE-MsgGUID: GkXPlz6zTLGfp9Pjg8CkkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,327,1732608000"; d="scan'208";a="117509758"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
 by orviesa009.jf.intel.com with ESMTP; 02 Mar 2025 03:49:52 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1tohpJ-000HIQ-05;
 Sun, 02 Mar 2025 11:49:47 +0000
Date: Sun, 2 Mar 2025 19:48:53 +0800
From: kernel test robot <lkp@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: oe-kbuild-all@lists.linux.dev, intel-xe@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [drm-xe:drm-xe-next 6/6] include/drm/drm_print.h:228:31: warning:
 '%s' directive argument is null
Message-ID: <202503021906.P2MwAvyK-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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

tree:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
head:   067a974fd8a9ea43f97ca184e2768b583f2f8c44
commit: 067a974fd8a9ea43f97ca184e2768b583f2f8c44 [6/6] drm/xe: Add performance tunings to debugfs
config: microblaze-allmodconfig (https://download.01.org/0day-ci/archive/20250302/202503021906.P2MwAvyK-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250302/202503021906.P2MwAvyK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503021906.P2MwAvyK-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/drm/ttm/ttm_resource.h:34,
                    from include/drm/ttm/ttm_device.h:30,
                    from drivers/gpu/drm/xe/xe_device_types.h:13,
                    from drivers/gpu/drm/xe/xe_gt_types.h:9,
                    from drivers/gpu/drm/xe/xe_tuning.c:13:
   drivers/gpu/drm/xe/xe_tuning.c: In function 'xe_tuning_dump':
>> include/drm/drm_print.h:228:31: warning: '%s' directive argument is null [-Wformat-overflow=]
     228 |         drm_printf((printer), "%.*s" fmt, (indent), "\t\t\t\t\tX", ##__VA_ARGS__)
         |                               ^~~~~~
   drivers/gpu/drm/xe/xe_tuning.c:226:17: note: in expansion of macro 'drm_printf_indent'
     226 |                 drm_printf_indent(p, 1, "%s\n", engine_tunings[idx].name);
         |                 ^~~~~~~~~~~~~~~~~


vim +228 include/drm/drm_print.h

e2b155e9924c39 Chris Wilson   2017-11-23  220  
bf6234a294c5b8 Noralf Trønnes 2017-11-07  221  /**
bf6234a294c5b8 Noralf Trønnes 2017-11-07  222   * drm_printf_indent - Print to a &drm_printer stream with indentation
bf6234a294c5b8 Noralf Trønnes 2017-11-07  223   * @printer: DRM printer
bf6234a294c5b8 Noralf Trønnes 2017-11-07  224   * @indent: Tab indentation level (max 5)
bf6234a294c5b8 Noralf Trønnes 2017-11-07  225   * @fmt: Format string
bf6234a294c5b8 Noralf Trønnes 2017-11-07  226   */
bf6234a294c5b8 Noralf Trønnes 2017-11-07  227  #define drm_printf_indent(printer, indent, fmt, ...) \
bf6234a294c5b8 Noralf Trønnes 2017-11-07 @228  	drm_printf((printer), "%.*s" fmt, (indent), "\t\t\t\t\tX", ##__VA_ARGS__)
d8187177b0b195 Rob Clark      2016-11-05  229  

:::::: The code at line 228 was first introduced by commit
:::::: bf6234a294c5b8bcc6f47ecdb646f41ad5efddd3 drm/print: Add drm_printf_indent()

:::::: TO: Noralf Trønnes <noralf@tronnes.org>
:::::: CC: Noralf Trønnes <noralf@tronnes.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

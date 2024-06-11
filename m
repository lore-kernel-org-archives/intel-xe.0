Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19437C27C5E
	for <intel-xe@archiver.kernel.org>; Tue, 11 Jun 2024 06:19:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A371010E1CC;
	Tue, 11 Jun 2024 06:19:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EJWFx/qs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4B6D10E1CC
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Jun 2024 06:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718086796; x=1749622796;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=GTlbHv79HCUkR4bCyJN/xCE2y1H0lGUfX/kWCA8XoYE=;
 b=EJWFx/qsGcc55dwCJUCstJdlSm0KeFgA2CSVyyZ0lRv+IAUdZjQ+9Gql
 EiFRsn7UobqfZIa5G9cfOgHCtezh1Podv/0LTLsgqvnxpJhPDIloXOHRz
 5UaGUBwrgyEh/KA9TjKDoSL7zCjZ8M1KPTp31tJy1YMdmX8Y87sZJq6KJ
 jZdtmigogjO3rh2th6KaaLvRyOqJSoFaD3eUT1pPJBs7NhBoStOkoxhXk
 9jYpw7hpF8Ed+P+HidQ2ZI8Wf7fNxkUwLmE/xvky8W3HxnBPwS+pLP3Hz
 hU5sxxAG+7lzfRZNJgssF26EiqlLf2pZXpulqHxdBpf8Y8/jLf0rmLEyP A==;
X-CSE-ConnectionGUID: TWfV0cw6TbSe5CyfNOmSeQ==
X-CSE-MsgGUID: 0/15/aKsTWiATK/MIgbrnA==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="12012064"
X-IronPort-AV: E=Sophos;i="6.08,229,1712646000"; d="scan'208";a="12012064"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 23:19:55 -0700
X-CSE-ConnectionGUID: aVccBOZbSdmLjP9VexFR6Q==
X-CSE-MsgGUID: nA+GciTgTKSR0/bc/6c12Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,229,1712646000"; d="scan'208";a="39769427"
Received: from lkp-server01.sh.intel.com (HELO 628d7d8b9fc6) ([10.239.97.150])
 by orviesa006.jf.intel.com with ESMTP; 10 Jun 2024 23:19:53 -0700
Received: from kbuild by 628d7d8b9fc6 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1sGurH-000079-0u;
 Tue, 11 Jun 2024 06:19:51 +0000
Date: Tue, 11 Jun 2024 14:19:08 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>,
 linux-kernel@vger.kernel.org, intel-xe@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mukesh Ojha <quic_mojha@quicinc.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>
Subject: Re: [PATCH v5 1/2] devcoredump: Add dev_coredumpm_timeout()
Message-ID: <202406111410.gmDjiFQR-lkp@intel.com>
References: <20240610161133.156566-1-jose.souza@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240610161133.156566-1-jose.souza@intel.com>
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

Hi José,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-xe/drm-xe-next]
[also build test ERROR on wireless/main linus/master v6.10-rc3 next-20240607]
[cannot apply to driver-core/driver-core-testing driver-core/driver-core-next driver-core/driver-core-linus wireless-next/main]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jos-Roberto-de-Souza/drm-xe-Increase-devcoredump-timeout/20240611-001400
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20240610161133.156566-1-jose.souza%40intel.com
patch subject: [PATCH v5 1/2] devcoredump: Add dev_coredumpm_timeout()
config: i386-buildonly-randconfig-004-20240611 (https://download.01.org/0day-ci/archive/20240611/202406111410.gmDjiFQR-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240611/202406111410.gmDjiFQR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406111410.gmDjiFQR-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: sound/soc/intel/avs/apl.o: in function `dev_coredumpm_timeout':
>> apl.c:(.text+0x64c): multiple definition of `dev_coredumpm_timeout'; sound/soc/intel/avs/skl.o:skl.c:(.text+0x2d0): first defined here
--
   In file included from drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c:26:0:
>> include/linux/devcoredump.h:79:6: error: no previous prototype for 'dev_coredumpm_timeout' [-Werror=missing-prototypes]
    void dev_coredumpm_timeout(struct device *dev, struct module *owner,
         ^~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5348A1067027
	for <intel-xe@archiver.kernel.org>; Thu, 12 Mar 2026 14:08:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09EE210EA1D;
	Thu, 12 Mar 2026 14:08:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kskmZImD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AC5510EA1D
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Mar 2026 14:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773324488; x=1804860488;
 h=date:from:to:cc:subject:message-id;
 bh=RIGa/FL/b75Tjkroq35KLoXoDMNPe/WTQ+qaLEjQZ/4=;
 b=kskmZImDn5B6ksR1srDOi6D16+uxzK9Qb/rZ1I5w4dvUyOMeiZuyhRzY
 xr50+3Fj7FjRQdq6U1Ht53ZdqDxyM7pWi96pp9qy9Oi2ji/zNc5GaanGA
 07kcospXE4W0qGZZrcdHaBeeGKXJoy2P3RqZ2eCZlJ1rq4l/+CPfGrXBU
 yKsNSjXhxORz44i3wpRnELBnmwRG2mxo7yggzeXEojpM6NuTzMqhRmk9k
 Xi8/05RFDn/tEWDPe09r6RQHvYnQxP0nnfqc01AsXilZelOtFQyTqZH7l
 HfJ4S21d2vyHidR1zu1AjWoN9EQgVlyfBIReX0dHBL+qcLRYcD8gR4JuV A==;
X-CSE-ConnectionGUID: qZisSgLVSA2pntkAMGt/Iw==
X-CSE-MsgGUID: 1oA1yRphSYeO9XK2jtiHzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="74307381"
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; d="scan'208";a="74307381"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 07:08:07 -0700
X-CSE-ConnectionGUID: r/DuYnbiToO6aWfVXMqQtg==
X-CSE-MsgGUID: AP46iZxNSSCd9HqmDTPuUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; d="scan'208";a="225529092"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2)
 ([10.211.93.152])
 by fmviesa005.fm.intel.com with ESMTP; 12 Mar 2026 07:08:04 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1w0ghm-000000003Vx-18AA;
 Thu, 12 Mar 2026 14:08:02 +0000
Date: Thu, 12 Mar 2026 15:07:31 +0100
From: kernel test robot <lkp@intel.com>
To: Nitin Gote <nitin.r.gote@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, intel-xe@lists.freedesktop.org,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>, linux-doc@vger.kernel.org
Subject: [drm-xe:drm-xe-next 1/3] htmldocs:
 Documentation/gpu/driver-uapi:29: ./include/uapi/drm/xe_drm.h:1060: WARNING:
 Block quote ends without a blank line; unexpected unindent. [docutils]
Message-ID: <202603121515.gEMrFlTL-lkp@intel.com>
User-Agent: s-nail v14.9.25
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
head:   2b484419700a0f563c695312374eb8cd5264b82c
commit: 2270bd7124f4d25497d58c293cd40ea014ddaf01 [1/3] drm/xe: add VM_BIND DECOMPRESS uapi flag
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260312/202603121515.gEMrFlTL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603121515.gEMrFlTL-lkp@intel.com/

All warnings (new ones prefixed by >>):

   WARNING: ./fs/namei.c:2853 function parameter 'state' not described in '__start_dirop'
   WARNING: ./fs/namei.c:2853 expecting prototype for start_dirop(). Prototype was for __start_dirop() instead
   WARNING: ./drivers/gpu/drm/amd/display/dc/dc.h:2796 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
   * Software state variables used to program register fields across the display pipeline
   WARNING: ./drivers/gpu/drm/amd/include/amd_shared.h:113 Enum value 'AMD_IP_BLOCK_TYPE_RAS' not described in enum 'amd_ip_block_type'
>> Documentation/gpu/driver-uapi:29: ./include/uapi/drm/xe_drm.h:1060: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
   Documentation/gpu/driver-uapi:29: ./include/uapi/drm/xe_drm.h:2380: ERROR: A level 2 section cannot be used here.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

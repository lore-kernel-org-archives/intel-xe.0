Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0CF9C0218A
	for <intel-xe@archiver.kernel.org>; Tue, 28 Jan 2025 08:59:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A307710E413;
	Tue, 28 Jan 2025 08:59:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hgwTbixF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F11F10E413
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Jan 2025 08:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738054760; x=1769590760;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=gx6dYKi7oGABr+WugjD5T75yTLQLxXoWHTkPv2BS8VI=;
 b=hgwTbixF8kCNwNyE2u8Qi7uMfaOpJf0wrfHTWIv0FAa+MqjWELbHsUE/
 X9HMOMfEGv4Xps5S7JO2Xq8fqg1UgEcd1QUN3vy9D39DXDTfUDCobdWvR
 f9OU+VCzOlupfgytCav4Pgdoz6d+L8fU6ppslkoTuxmHhNLR0YsLCY5i1
 HL0TzKmFvSIfMnp6CdDa2nkp4TFqxy/eWCfjVlJ2EDEWQTnDTWooo+Siw
 A/pqScMVxextscB8UEPfbD9GHvtnCVMtVdphVlWLxkHsz94y7jgg3DD/6
 Cu1l2+bmK2oQviZsUx1b9XgTycRsoXB3Yojxa85PJg5CLQ4t2YaOD2upC g==;
X-CSE-ConnectionGUID: 1oiyrFUtRuu3P1rAwoq5Yg==
X-CSE-MsgGUID: OJg/nZJbQg+JHWBeRBUPwg==
X-IronPort-AV: E=McAfee;i="6700,10204,11328"; a="60999059"
X-IronPort-AV: E=Sophos;i="6.13,240,1732608000"; d="scan'208";a="60999059"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2025 00:59:20 -0800
X-CSE-ConnectionGUID: S387vRjdQGG1e7zjsmmo8g==
X-CSE-MsgGUID: AAXe1U/KR1+16GAduWGfTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,240,1732608000"; d="scan'208";a="108786425"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
 by fmviesa008.fm.intel.com with ESMTP; 28 Jan 2025 00:59:17 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1tchRD-000hch-1N;
 Tue, 28 Jan 2025 08:59:15 +0000
Date: Tue, 28 Jan 2025 16:58:34 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 intel-xe@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [drm-xe:drm-xe-next 3/3] drivers/gpu/drm/xe/xe_guc_ct.c:1727:43:
 warning: format specifies type 'unsigned long' but the argument has type
 'size_t' (aka 'unsigned int')
Message-ID: <202501281659.elCnHJvL-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
head:   cb1f868ca13756c0c18ba54d1591332476760d07
commit: cb1f868ca13756c0c18ba54d1591332476760d07 [3/3] drm/xe: Make GUC binaries dump consistent with other binaries in devcoredump
config: i386-buildonly-randconfig-004-20250128 (https://download.01.org/0day-ci/archive/20250128/202501281659.elCnHJvL-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250128/202501281659.elCnHJvL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501281659.elCnHJvL-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/xe/xe_guc_ct.c:20:
   In file included from drivers/gpu/drm/xe/xe_bo.h:9:
   In file included from include/drm/ttm/ttm_tt.h:30:
   In file included from include/linux/pagemap.h:8:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/gpu/drm/xe/xe_guc_ct.c:1727:43: warning: format specifies type 'unsigned long' but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
    1727 |                         drm_printf(p, "[CTB].length: 0x%lx\n", snapshot->ctb_size);
         |                                                        ~~~     ^~~~~~~~~~~~~~~~~~
         |                                                        %zx
   2 warnings generated.
--
   In file included from drivers/gpu/drm/xe/xe_guc_log.c:13:
   In file included from drivers/gpu/drm/xe/xe_bo.h:9:
   In file included from include/drm/ttm/ttm_tt.h:30:
   In file included from include/linux/pagemap.h:8:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/gpu/drm/xe/xe_guc_log.c:207:41: warning: format specifies type 'unsigned long' but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
     207 |         drm_printf(p, "[LOG].length: 0x%lx\n", snapshot->size);
         |                                        ~~~     ^~~~~~~~~~~~~~
         |                                        %zx
   2 warnings generated.


vim +1727 drivers/gpu/drm/xe/xe_guc_ct.c

  1703	
  1704	/**
  1705	 * xe_guc_ct_snapshot_print - Print out a given GuC CT snapshot.
  1706	 * @snapshot: GuC CT snapshot object.
  1707	 * @p: drm_printer where it will be printed out.
  1708	 *
  1709	 * This function prints out a given GuC CT snapshot object.
  1710	 */
  1711	void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot,
  1712				      struct drm_printer *p)
  1713	{
  1714		if (!snapshot)
  1715			return;
  1716	
  1717		if (snapshot->ct_enabled) {
  1718			drm_puts(p, "H2G CTB (all sizes in DW):\n");
  1719			guc_ctb_snapshot_print(&snapshot->h2g, p);
  1720	
  1721			drm_puts(p, "G2H CTB (all sizes in DW):\n");
  1722			guc_ctb_snapshot_print(&snapshot->g2h, p);
  1723			drm_printf(p, "\tg2h outstanding: %d\n",
  1724				   snapshot->g2h_outstanding);
  1725	
  1726			if (snapshot->ctb) {
> 1727				drm_printf(p, "[CTB].length: 0x%lx\n", snapshot->ctb_size);
  1728				xe_print_blob_ascii85(p, "[CTB].data", '\n',
  1729						      snapshot->ctb, 0, snapshot->ctb_size);
  1730			}
  1731		} else {
  1732			drm_puts(p, "CT disabled\n");
  1733		}
  1734	}
  1735	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

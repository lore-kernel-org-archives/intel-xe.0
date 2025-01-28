Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BB87C0218D
	for <intel-xe@archiver.kernel.org>; Tue, 28 Jan 2025 08:17:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04A1C10E5F3;
	Tue, 28 Jan 2025 08:17:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GU5b6gKB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B09BE10E5FB
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Jan 2025 08:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738052233; x=1769588233;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=+p+19ak/pH0WuzlUV43aSrP5LHgm3kAbK+yTtUCvWoM=;
 b=GU5b6gKBQvVNEpUuxvOk3WzPNzbB30qZ+6DgjrsqMb8LHB7I4Ts527Rs
 Tq557UsS/ybEGKOMLfNmt+ffxHiAeqxIDXLUum5m6jnIaAf6PK6Z+57ku
 EnTTASkdeoaaRPA2Wd9GsdYCCb6vXjqaxmqVbMjfnzqXUPfqBu3eyC1LU
 MJZwYLlRkvxIw/18HAn3YD1wPQG1nNxe8FP3DKBa2gDng1a61CfMnbE61
 65DxVAbfU8SQla+FKlDkpjmVmSEFI1Pt2fEIR3RkOF9F79QJOoGEFeejw
 D5KZ8tAJAoVWH4esx/piBh7PfU3QCzqD3fomzir3jFyJW+IenS/GEfp19 w==;
X-CSE-ConnectionGUID: 4xcmc7xuSROOvBmc8WxwxA==
X-CSE-MsgGUID: IQgT1N0zTfClgpo72JT9Zg==
X-IronPort-AV: E=McAfee;i="6700,10204,11328"; a="63886982"
X-IronPort-AV: E=Sophos;i="6.13,240,1732608000"; d="scan'208";a="63886982"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2025 00:17:12 -0800
X-CSE-ConnectionGUID: ukM2tvc4TG6A06JFv4FZ3Q==
X-CSE-MsgGUID: oz9ybb3/RmiYAnoAA+r+5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="109597373"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
 by orviesa008.jf.intel.com with ESMTP; 28 Jan 2025 00:17:10 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1tcgmS-000hZp-00;
 Tue, 28 Jan 2025 08:17:08 +0000
Date: Tue, 28 Jan 2025 16:16:38 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, intel-xe@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [drm-xe:drm-xe-next 3/3] drivers/gpu/drm/xe/xe_guc_ct.c:1727:58:
 warning: format '%lx' expects argument of type 'long unsigned int', but
 argument 3 has type 'size_t' {aka 'unsigned int'}
Message-ID: <202501281627.H6nj184e-lkp@intel.com>
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
config: csky-randconfig-002-20250128 (https://download.01.org/0day-ci/archive/20250128/202501281627.H6nj184e-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250128/202501281627.H6nj184e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501281627.H6nj184e-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/xe/xe_guc_ct.c: In function 'xe_guc_ct_snapshot_print':
>> drivers/gpu/drm/xe/xe_guc_ct.c:1727:58: warning: format '%lx' expects argument of type 'long unsigned int', but argument 3 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
    1727 |                         drm_printf(p, "[CTB].length: 0x%lx\n", snapshot->ctb_size);
         |                                                        ~~^     ~~~~~~~~~~~~~~~~~~
         |                                                          |             |
         |                                                          |             size_t {aka unsigned int}
         |                                                          long unsigned int
         |                                                        %x
--
   drivers/gpu/drm/xe/xe_guc_log.c: In function 'xe_guc_log_snapshot_print':
>> drivers/gpu/drm/xe/xe_guc_log.c:207:42: warning: format '%lx' expects argument of type 'long unsigned int', but argument 3 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
     207 |         drm_printf(p, "[LOG].length: 0x%lx\n", snapshot->size);
         |                                        ~~^     ~~~~~~~~~~~~~~
         |                                          |             |
         |                                          |             size_t {aka unsigned int}
         |                                          long unsigned int
         |                                        %x


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

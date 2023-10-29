Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E461FC4332F
	for <intel-xe@archiver.kernel.org>; Sun, 29 Oct 2023 22:37:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8418D10E065;
	Sun, 29 Oct 2023 22:37:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B38410E065
 for <intel-xe@lists.freedesktop.org>; Sun, 29 Oct 2023 22:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698619076; x=1730155076;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=24wIVa6i22ugb0/vm+SLyq3IjvyByE5eOCVdn0dN4G0=;
 b=R9a3IS/BWFPZHXyPi3RIUmZh565ahUe3p1+/7/zHXLz/IJZKOfG9TVB7
 jgXbAU+dira4lZ2MZ1hUZaFPUVw8dEc8XJYvoWM9bX1dJkE1sASXWHBxH
 LtAI04zdZVm1mH3AZL8gmvG+2Q/HvS5LTAaxHh2Efmmp80T97cuKHDgwC
 evcXZvHwClpJ55PWPKA83CjnESi74e/jmVfESSHrYc7v5uEwgIK1NErkE
 lSxQEMgClDKVsaGBl4yyLg362khEn0eybc6mSovDDf3y6S/IeQYttLkIt
 MlJ8tyktzqbPtUUMea1QG2R+E4kfImjuo6lG9+CODAPi1N8tXLa4nUFiL A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10878"; a="367328656"
X-IronPort-AV: E=Sophos;i="6.03,261,1694761200"; d="scan'208";a="367328656"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2023 15:37:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10878"; a="760104538"
X-IronPort-AV: E=Sophos;i="6.03,261,1694761200"; d="scan'208";a="760104538"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
 by orsmga002.jf.intel.com with ESMTP; 29 Oct 2023 15:37:54 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qxEPn-000CsF-2y;
 Sun, 29 Oct 2023 22:37:51 +0000
Date: Mon, 30 Oct 2023 06:37:05 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Message-ID: <202310300643.q7ugWxc9-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [Intel-xe] [drm-xe:drm-xe-next 964/1394] htmldocs:
 Documentation/gpu/drm-mm:552: ./drivers/gpu/drm/scheduler/sched_main.c:50:
 WARNING: Enumerated list ends without a blank line; unexpected unindent.
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>, linux-doc@vger.kernel.org,
 intel-xe@lists.freedesktop.org, oe-kbuild-all@lists.linux.dev
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

tree:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
head:   f24c46200dc8fad700f51106e678d68d38496860
commit: 0dceb0dede50613712a065d627443f4c182e6e2c [964/1394] drm/sched: Add DRM_SCHED_POLICY_SINGLE_ENTITY scheduling policy
reproduce: (https://download.01.org/0day-ci/archive/20231030/202310300643.q7ugWxc9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310300643.q7ugWxc9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/gpu/drm-mm:552: ./drivers/gpu/drm/scheduler/sched_main.c:50: WARNING: Enumerated list ends without a blank line; unexpected unindent.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

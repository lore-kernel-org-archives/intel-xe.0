Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61523C25B76
	for <intel-xe@archiver.kernel.org>; Sun,  9 Jun 2024 01:35:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B85FE10E119;
	Sun,  9 Jun 2024 01:35:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A1TnaVZM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B54210E119
 for <intel-xe@lists.freedesktop.org>; Sun,  9 Jun 2024 01:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717896938; x=1749432938;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=oJHizDTlgk7iiOeTs8+y1dXRJeUMx1LlY+wokuoqr4U=;
 b=A1TnaVZMi7ZwDA0JgrqDyefVueG6Rk3Kllj8hnl56UaMZ5hrQIPVkpEg
 q8Jgsego8Ut50yOVZPECM8thZcLWf2mHzEJY/HEW57griUjlWyNQSwyKV
 Hjz0mXUKKGZ0KMcacMRmKXhZAv4c02p8BcST9gZuCDITjRVs1/f36HVQs
 P4JRHUy4IMylAgXx30Qt2mJaMPMcs30UNVNQGtcHQ4tw4kw1IXTpy+4R4
 XAWrGIi9dUPJh270MchHhCqo5bbXc+3hetvJMtRnAJtOIFxCcO/09RDtx
 IpII+z54mVsgUtiKRxAVUK+isLzietWJ57f1OQYRzjnEKH5hbJwv6nZl5 A==;
X-CSE-ConnectionGUID: XodFD8D1QmiTJASaq0P/Dw==
X-CSE-MsgGUID: a+Y88LTpRQaFjQPLtVKVUw==
X-IronPort-AV: E=McAfee;i="6600,9927,11097"; a="32081337"
X-IronPort-AV: E=Sophos;i="6.08,224,1712646000"; d="scan'208";a="32081337"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2024 18:35:37 -0700
X-CSE-ConnectionGUID: +OZUXgVJS92pO40bcZYUVA==
X-CSE-MsgGUID: 1JBw/102Sviaozy4fTCeLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,224,1712646000"; d="scan'208";a="69483281"
Received: from lkp-server01.sh.intel.com (HELO 8967fbab76b3) ([10.239.97.150])
 by orviesa002.jf.intel.com with ESMTP; 08 Jun 2024 18:35:35 -0700
Received: from kbuild by 8967fbab76b3 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1sG7T3-0000jQ-0v;
 Sun, 09 Jun 2024 01:35:33 +0000
Date: Sun, 9 Jun 2024 09:35:22 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>,
 linux-kernel@vger.kernel.org, intel-xe@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mukesh Ojha <quic_mojha@quicinc.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>
Subject: Re: [PATCH v4 1/2] devcoredump: Add dev_coredumpm_timeout()
Message-ID: <202406090938.yRretx5x-lkp@intel.com>
References: <20240607193220.229760-1-jose.souza@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240607193220.229760-1-jose.souza@intel.com>
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-xe/drm-xe-next]
[also build test WARNING on wireless/main linus/master v6.10-rc2 next-20240607]
[cannot apply to driver-core/driver-core-testing driver-core/driver-core-next driver-core/driver-core-linus wireless-next/main]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jos-Roberto-de-Souza/drm-xe-Increase-devcoredump-timeout/20240608-033441
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20240607193220.229760-1-jose.souza%40intel.com
patch subject: [PATCH v4 1/2] devcoredump: Add dev_coredumpm_timeout()
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240609/202406090938.yRretx5x-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240609/202406090938.yRretx5x-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406090938.yRretx5x-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/net/bluetooth/hci_core.h:36,
                    from net/bluetooth/coredump.c:10:
>> include/net/bluetooth/coredump.h:9: warning: "DEVCOREDUMP_TIMEOUT" redefined
       9 | #define DEVCOREDUMP_TIMEOUT     msecs_to_jiffies(10000) /* 10 sec */
         | 
   In file included from net/bluetooth/coredump.c:6:
   include/linux/devcoredump.h:16: note: this is the location of the previous definition
      16 | #define DEVCOREDUMP_TIMEOUT     (HZ * 60 * 5)
         | 


vim +/DEVCOREDUMP_TIMEOUT +9 include/net/bluetooth/coredump.h

9695ef876fd122 Abhishek Pandit-Subedi 2023-03-30   8  
9695ef876fd122 Abhishek Pandit-Subedi 2023-03-30  @9  #define DEVCOREDUMP_TIMEOUT	msecs_to_jiffies(10000)	/* 10 sec */
9695ef876fd122 Abhishek Pandit-Subedi 2023-03-30  10  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

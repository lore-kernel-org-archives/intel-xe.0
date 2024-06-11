Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5559C25B76
	for <intel-xe@archiver.kernel.org>; Tue, 11 Jun 2024 10:38:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE0F410E594;
	Tue, 11 Jun 2024 10:38:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Peyterti";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E77F10E594
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Jun 2024 10:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718102298; x=1749638298;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=J21BSaq0b6iUfubvOJ45H+bg9QBB0htBk1F9s7SFr+I=;
 b=PeytertihQ62Eury0cPEKlvHQWJfX1JVBfrB95HTSljoJNZ7vTaeO67o
 UI5cKY71LDFA+JpmLf9ttG7+WM30aZX8+ejk7+yoYZBPmCBLR+PifbU59
 /YIOO+OYlTcGNFS6N3JX4+xTthIAhqjdyescoKyb94Qfyfd5v9chQv8Qb
 azHHQn6GCfVeFZMnBcunWl2HXaG3GDwUDQ3WmT+YTZ2YMdghQ8sKGpJjx
 VoQb+XUKv/q+lXHIbVEBGgiaZBcQ5tQagO8UIMCJMEBUKCRQog2v+P8H8
 jp3ct+L1XsOfRJFbsorcpUWNh9LLjKhj1q4nPFOkQoRawv6779KTO2BKN w==;
X-CSE-ConnectionGUID: cAP3QhVSQMy8LLdkTAjEOQ==
X-CSE-MsgGUID: 8pfAihLhSRm2sbww597nFw==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="40205335"
X-IronPort-AV: E=Sophos;i="6.08,229,1712646000"; d="scan'208";a="40205335"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 03:38:18 -0700
X-CSE-ConnectionGUID: jqf/2a6DQWGM4+s8zoSg3w==
X-CSE-MsgGUID: /cDX3UYMRzWuWf4DdaKvqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,229,1712646000"; d="scan'208";a="39980371"
Received: from lkp-server01.sh.intel.com (HELO 628d7d8b9fc6) ([10.239.97.150])
 by orviesa008.jf.intel.com with ESMTP; 11 Jun 2024 03:38:15 -0700
Received: from kbuild by 628d7d8b9fc6 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1sGytJ-0000Jq-02;
 Tue, 11 Jun 2024 10:38:13 +0000
Date: Tue, 11 Jun 2024 18:37:49 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>,
 linux-kernel@vger.kernel.org, intel-xe@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mukesh Ojha <quic_mojha@quicinc.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>
Subject: Re: [PATCH v5 1/2] devcoredump: Add dev_coredumpm_timeout()
Message-ID: <202406111852.SdIM9NWt-lkp@intel.com>
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
[also build test ERROR on wireless-next/main wireless/main linus/master v6.10-rc3 next-20240611]
[cannot apply to driver-core/driver-core-testing driver-core/driver-core-next driver-core/driver-core-linus]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jos-Roberto-de-Souza/drm-xe-Increase-devcoredump-timeout/20240611-001400
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20240610161133.156566-1-jose.souza%40intel.com
patch subject: [PATCH v5 1/2] devcoredump: Add dev_coredumpm_timeout()
config: i386-randconfig-141-20240611 (https://download.01.org/0day-ci/archive/20240611/202406111852.SdIM9NWt-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240611/202406111852.SdIM9NWt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406111852.SdIM9NWt-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/xe/xe_devcoredump.c:9:
>> include/linux/devcoredump.h:79:6: error: no previous prototype for function 'dev_coredumpm_timeout' [-Werror,-Wmissing-prototypes]
      79 | void dev_coredumpm_timeout(struct device *dev, struct module *owner,
         |      ^
   include/linux/devcoredump.h:79:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      79 | void dev_coredumpm_timeout(struct device *dev, struct module *owner,
         | ^
         | static 
   1 error generated.


vim +/dev_coredumpm_timeout +79 include/linux/devcoredump.h

    78	
  > 79	void dev_coredumpm_timeout(struct device *dev, struct module *owner,
    80				   void *data, size_t datalen, gfp_t gfp,
    81				   ssize_t (*read)(char *buffer, loff_t offset,
    82						   size_t count, void *data,
    83						   size_t datalen),
    84				   void (*free)(void *data),
    85				   unsigned long timeout)
    86	{
    87		free(data);
    88	}
    89	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49E17D277E0
	for <intel-xe@archiver.kernel.org>; Sat, 10 Jan 2026 10:48:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 058ED10E00C;
	Sat, 10 Jan 2026 10:48:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KJ3ajDmG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8368210E00C
 for <intel-xe@lists.freedesktop.org>; Sat, 10 Jan 2026 10:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768042130; x=1799578130;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=SBNhXxNdMBEEmO3KzZjmsADuqsv0KrPKvpw2/Xo3oPw=;
 b=KJ3ajDmGA738HQIELzKu1OUxV3lzDo4wZHgxgx3YmxSF5QzDTuvv8zN9
 vsg8aa54siDVZOzIOlxOy4gUVCupAa6MsIG7MHR6K5YUopfO9lUfpp3a3
 soVh9qIXT9URBkNN9XyRcCrGJ0ZfEcUa8pca/QSEOfZ5svLw0dZzv0b+W
 rF29Z8VHDLQaF1VKp1A0XfFWpUJvre+yflj2UjhbqZEBmAHWNqdRgFQzE
 uHiUYufashbo7qnG7Kjd735xn+JmOCwhMR+p+V1LhU+ReZnoXxinkcm4V
 bmOVcbNqNZRdduZBmLPmfStArDmmnphZlk4muUsgffmjG14fH3eq2HlfM w==;
X-CSE-ConnectionGUID: dI+jQq5uSFyr17AsDwLnGA==
X-CSE-MsgGUID: iwT55u1NSymZvshp8mXv0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11666"; a="69449947"
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; d="scan'208";a="69449947"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2026 02:48:49 -0800
X-CSE-ConnectionGUID: zRHhslGAQX631ZYKUZc3aQ==
X-CSE-MsgGUID: W3w6n7B8TrWaJDutA0zeTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; d="scan'208";a="203966809"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
 by fmviesa008.fm.intel.com with ESMTP; 10 Jan 2026 02:48:47 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1veWWT-000000008YS-1PNV;
 Sat, 10 Jan 2026 10:48:45 +0000
Date: Sat, 10 Jan 2026 18:48:16 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 daniele.ceraolospurio@intel.com, carlos.santa@intel.com
Subject: Re: [PATCH v2 12/22] drm/xe: Implement GuC submission backend ops
 for deadlines
Message-ID: <202601101818.dyOCWJK0-lkp@intel.com>
References: <20260105040237.1307873-13-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260105040237.1307873-13-matthew.brost@intel.com>
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

Hi Matthew,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20251219]
[cannot apply to drm-xe/drm-xe-next drm-misc/drm-misc-next drm-i915/for-linux-next drm-i915/for-linux-next-fixes v6.19-rc4 v6.19-rc3 v6.19-rc2 linus/master v6.19-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Matthew-Brost/drm-xe-Add-dedicated-message-lock/20260105-160721
base:   next-20251219
patch link:    https://lore.kernel.org/r/20260105040237.1307873-13-matthew.brost%40intel.com
patch subject: [PATCH v2 12/22] drm/xe: Implement GuC submission backend ops for deadlines
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20260110/202601101818.dyOCWJK0-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260110/202601101818.dyOCWJK0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601101818.dyOCWJK0-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/xe/xe_guc_submit.c:2477:2: warning: variable 'opcode' is used uninitialized whenever switch default is taken [-Wsometimes-uninitialized]
    2477 |         default:
         |         ^~~~~~~
   drivers/gpu/drm/xe/xe_guc_submit.c:2482:43: note: uninitialized use occurs here
    2482 |                 if (!guc_exec_queue_try_add_msg(q, msg, opcode)) {
         |                                                         ^~~~~~
   drivers/gpu/drm/xe/xe_guc_submit.c:2462:21: note: initialize the variable 'opcode' to silence this warning
    2462 |         unsigned int opcode;
         |                            ^
         |                             = 0
   1 warning generated.


vim +/opcode +2477 drivers/gpu/drm/xe/xe_guc_submit.c

  2454	
  2455	static void guc_exec_queue_set_deadline_state(struct xe_exec_queue *q,
  2456						      enum xe_deadline_mgr_state state)
  2457	{
  2458		struct xe_gpu_scheduler *sched = &q->guc->sched;
  2459		struct xe_sched_msg *msg = q->guc->static_msgs +
  2460			STATIC_MSG_SET_DEADLINE_STATE;
  2461		struct xe_guc *guc = exec_queue_to_guc(q);
  2462		unsigned int opcode;
  2463	
  2464		xe_gt_assert(guc_to_gt(guc), state !=
  2465			     XE_DEADLINE_MGR_STATE_UNSUPPORTED);
  2466	
  2467		switch (state) {
  2468		case XE_DEADLINE_MGR_STATE_NO_BOOST:
  2469			opcode = EXIT_DEADLINE;
  2470			break;
  2471		case XE_DEADLINE_MGR_STATE_FREQ_BOOST:
  2472			opcode = ENTER_DEADLINE_FREQ;
  2473			break;
  2474		case XE_DEADLINE_MGR_STATE_PRIO_BOOST:
  2475			opcode = ENTER_DEADLINE_PRIO;
  2476			break;
> 2477		default:
  2478			drm_warn(&guc_to_xe(guc)->drm, "NOT POSSIBLE");
  2479		}
  2480	
  2481		xe_sched_msg_scoped_guard(sched) {
  2482			if (!guc_exec_queue_try_add_msg(q, msg, opcode)) {
  2483				bool added;
  2484	
  2485				/*
  2486				 * A deadline state change has yet to be processed,
  2487				 * removed it.
  2488				 */
  2489				list_del_init(&msg->link);
  2490	
  2491				added = guc_exec_queue_try_add_msg(q, msg, opcode);
  2492				xe_gt_assert(guc_to_gt(guc), added);
  2493			}
  2494		}
  2495	}
  2496	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

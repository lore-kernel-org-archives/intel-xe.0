Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17ABAC61DBD
	for <intel-xe@archiver.kernel.org>; Wed, 26 Aug 2026 01:17:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EA5010E09D;
	Wed, 26 Aug 2026 01:17:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OXz1G6SW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDEC310E09D
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Aug 2026 01:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787707073; x=1819243073;
 h=date:from:to:cc:subject:message-id;
 bh=ydpKHhFw2Y9uQFa7kzwMUY2xIuPHSWA1IcYwrb16VJc=;
 b=OXz1G6SWXPyUUqsOgI+GsMyqc46MNcVS0uD6NqXds4uTB/L5ELwcuhiE
 6eIMj9/1l0+gKoES9fpiZ4AU3mRKE82UIB9lOydyYqlxImgYHXoRR190m
 FTyv7mq8DhzvyAqaBbsETUnv6BRhp36z3zyVcPW25J1JJNAJUPwAUKmUW
 3YPez2WV8WFvr6ZeqYZNnwjl9Ele2gicvhftCQxqJxWGVpn+4JRjbhyZ9
 mhzWmrLN/az8+FPUDaGVqPFCZYdl3NyNxDev9Eu7rtURAC7yCEjut4Bft
 /ERJk6UuaoaCYNHONiR2arw17L4Ab776CuSX3I0DvxQHuh6aYVVY99Hqr Q==;
X-CSE-ConnectionGUID: MVCTmORMQQ2CrjgyykAgxQ==
X-CSE-MsgGUID: 9jkRGqaoQMqqI5qtg0y32Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="88042137"
X-IronPort-AV: E=Sophos;i="6.25,243,1779174000"; d="scan'208";a="88042137"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2026 18:17:52 -0700
X-CSE-ConnectionGUID: xRID3NmMQ0GueU4IhdwGcQ==
X-CSE-MsgGUID: MWAcsRVdRqujCvY2yR3AJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,243,1779174000"; d="scan'208";a="297339778"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
 by orviesa002.jf.intel.com with ESMTP; 25 Aug 2026 18:17:52 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1wz2Gz-000000006iv-24FL;
 Wed, 26 Aug 2026 01:17:49 +0000
Date: Wed, 26 Aug 2026 09:17:29 +0800
From: kernel test robot <lkp@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS
 76cc14e2faed1adae20f4ee144ead0e3a7566c49
Message-ID: <202608260915.iKLWeD0K-lkp@intel.com>
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

tree/branch: https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
branch HEAD: 76cc14e2faed1adae20f4ee144ead0e3a7566c49  drm/xe/i2c: Keep the i2c controller always enabled

elapsed time: 809m

configs tested: 17
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha               allnoconfig    gcc-16.1.0
alpha              allyesconfig    gcc-16.1.0
alpha                 defconfig    gcc-16.1.0
arc                allmodconfig    gcc-16.1.0
arc                allyesconfig    gcc-16.1.0
csky               allmodconfig    gcc-16.1.0
i386               allmodconfig    gcc-14
loongarch             defconfig    clang-24
nios2              allmodconfig    gcc-11.5.0
nios2               allnoconfig    gcc-11.5.0
openrisc   simple_smp_defconfig    gcc-16.1.0
parisc             allmodconfig    gcc-16.1.0
parisc             allyesconfig    gcc-16.1.0
parisc                defconfig    gcc-16.1.0
sh                    defconfig    gcc-16.1.0
x86_64                    kexec    clang-22
x86_64             rhel-9.4-bpf    gcc-14

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

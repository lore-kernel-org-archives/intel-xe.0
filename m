Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95996C43458
	for <intel-xe@archiver.kernel.org>; Sat,  4 Jul 2026 12:45:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39E5310E067;
	Sat,  4 Jul 2026 12:45:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eroNTCYa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8939810E067
 for <intel-xe@lists.freedesktop.org>; Sat,  4 Jul 2026 12:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783169155; x=1814705155;
 h=date:from:to:cc:subject:message-id;
 bh=MFN+Q+Sb1Ge88JPURQOPtozYplahzC+8VVqXY93zmeg=;
 b=eroNTCYaNUVRTHtNP6Tji+g7kw2fLAHI8x7aMoHAcve5I8jKGc3zibnh
 e0Yunz1O8dQiaZv6k01vDQo6eue/yE9WkUsUOnC0mMlD7nYrhGHGm+MEJ
 yaJbKa2ZpsE35YpOEgiC8hHUAWgzWC8sgOjgy56/UQB7GLiDx5O+ozX/p
 AdaOwxaS5FezqdGlAYzqAobyREWvhiiNZUZXaTREA8EaVlddNxTVe11cJ
 D3c5nGHxrXJUAO1MqyNyz8xnhQyczv7KooGCQUOJX/e0yFadzPJgD7d6B
 J/UeXs8H0HF0BxFqiqiQQM+q74xDTSlWPJP6MBJ50VkgWZAibtP3AW5Z7 w==;
X-CSE-ConnectionGUID: q5ozaK4MS+KH+RUi85Oy+A==
X-CSE-MsgGUID: 5+xHdjjPRE+F9vIdV1QQ5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="71404670"
X-IronPort-AV: E=Sophos;i="6.25,147,1779174000"; d="scan'208";a="71404670"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2026 05:45:54 -0700
X-CSE-ConnectionGUID: C+r2oIGMSJyp+NLp/xsu7w==
X-CSE-MsgGUID: Qpbq7+9ORY6dHZP3q+AISw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,147,1779174000"; d="scan'208";a="277634307"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
 by fmviesa001.fm.intel.com with ESMTP; 04 Jul 2026 05:45:52 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1wfzkg-00000000D3j-40sf;
 Sat, 04 Jul 2026 12:45:47 +0000
Date: Sat, 04 Jul 2026 20:45:00 +0800
From: kernel test robot <lkp@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS WITH WARNING
 3a8bfa1f2af71ca21818253753fccc53337b7b9b
Message-ID: <202607042047.PmsNeKs2-lkp@intel.com>
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
branch HEAD: 3a8bfa1f2af71ca21818253753fccc53337b7b9b  drm/xe: Documentation: fix chars used for subsection

Warning (recently discovered and may have been fixed):

    https://lore.kernel.org/oe-kbuild-all/202606302210.QqcLbOEN-lkp@intel.com

    drivers/gpu/drm/xe/xe_pt.c:1430:13: warning: 'xe_pt_svm_userptr_notifier_lock' defined but not used [-Wunused-function]

Warning ids grouped by kconfigs:

recent_errors
|-- um-allyesconfig
|   `-- drivers-gpu-drm-xe-xe_pt.c:warning:xe_pt_svm_userptr_notifier_lock-defined-but-not-used
`-- um-randconfig-001-20260704
    `-- drivers-gpu-drm-xe-xe_pt.c:warning:xe_pt_svm_userptr_notifier_lock-defined-but-not-used

elapsed time: 821m

configs tested: 277
configs skipped: 12

tested configs:
alpha                             allnoconfig    gcc-16.1.0
alpha                            allyesconfig    gcc-16.1.0
alpha                               defconfig    gcc-16.1.0
arc                              allmodconfig    clang-23
arc                              allmodconfig    gcc-16.1.0
arc                               allnoconfig    gcc-16.1.0
arc                              allyesconfig    gcc-16.1.0
arc                      axs103_smp_defconfig    gcc-16.1.0
arc                                 defconfig    gcc-16.1.0
arc                   randconfig-001-20260704    gcc-8.5.0
arc                   randconfig-002-20260704    gcc-15.2.0
arm                               allnoconfig    clang-23
arm                               allnoconfig    gcc-16.1.0
arm                              allyesconfig    clang-23
arm                              allyesconfig    gcc-16.1.0
arm                                 defconfig    gcc-16.1.0
arm                   randconfig-001-20260704    clang-23
arm                   randconfig-002-20260704    gcc-10.5.0
arm                   randconfig-003-20260704    gcc-11.5.0
arm                   randconfig-004-20260704    gcc-8.5.0
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-16.1.0
arm64                               defconfig    gcc-16.1.0
arm64                          randconfig-001    gcc-16.1.0
arm64                 randconfig-001-20260704    gcc-16.1.0
arm64                 randconfig-001-20260704    gcc-8.5.0
arm64                          randconfig-002    gcc-16.1.0
arm64                 randconfig-002-20260704    gcc-15.2.0
arm64                 randconfig-002-20260704    gcc-16.1.0
arm64                          randconfig-003    gcc-16.1.0
arm64                 randconfig-003-20260704    gcc-16.1.0
arm64                 randconfig-003-20260704    gcc-9.5.0
arm64                          randconfig-004    gcc-16.1.0
arm64                 randconfig-004-20260704    gcc-15.2.0
arm64                 randconfig-004-20260704    gcc-16.1.0
csky                             allmodconfig    gcc-16.1.0
csky                              allnoconfig    gcc-16.1.0
csky                                defconfig    gcc-16.1.0
csky                           randconfig-001    gcc-16.1.0
csky                  randconfig-001-20260704    gcc-16.1.0
csky                           randconfig-002    gcc-16.1.0
csky                  randconfig-002-20260704    gcc-16.1.0
hexagon                          allmodconfig    clang-23
hexagon                           allnoconfig    clang-23
hexagon                           allnoconfig    gcc-16.1.0
hexagon                             defconfig    gcc-16.1.0
hexagon                        randconfig-001    clang-23
hexagon               randconfig-001-20260704    clang-23
hexagon                        randconfig-002    clang-23
hexagon               randconfig-002-20260704    clang-23
i386                             allmodconfig    clang-22
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-16.1.0
i386                             allyesconfig    clang-22
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260704    gcc-14
i386        buildonly-randconfig-002-20260704    gcc-14
i386        buildonly-randconfig-003-20260704    gcc-14
i386        buildonly-randconfig-004-20260704    clang-22
i386        buildonly-randconfig-004-20260704    gcc-14
i386        buildonly-randconfig-005-20260704    clang-22
i386        buildonly-randconfig-005-20260704    gcc-14
i386        buildonly-randconfig-006-20260704    gcc-14
i386                                defconfig    clang-22
i386                                defconfig    gcc-16.1.0
i386                  randconfig-001-20260704    gcc-14
i386                  randconfig-002-20260704    gcc-14
i386                  randconfig-003-20260704    gcc-14
i386                  randconfig-004-20260704    gcc-14
i386                  randconfig-005-20260704    gcc-14
i386                  randconfig-006-20260704    gcc-14
i386                  randconfig-007-20260704    gcc-14
i386                           randconfig-011    gcc-13
i386                  randconfig-011-20260704    clang-22
i386                  randconfig-011-20260704    gcc-13
i386                           randconfig-012    gcc-13
i386                  randconfig-012-20260704    clang-22
i386                  randconfig-012-20260704    gcc-13
i386                           randconfig-013    gcc-13
i386                  randconfig-013-20260704    gcc-13
i386                  randconfig-013-20260704    gcc-14
i386                           randconfig-014    gcc-13
i386                  randconfig-014-20260704    gcc-13
i386                           randconfig-015    gcc-13
i386                  randconfig-015-20260704    clang-22
i386                  randconfig-015-20260704    gcc-13
i386                           randconfig-016    gcc-13
i386                  randconfig-016-20260704    clang-22
i386                  randconfig-016-20260704    gcc-13
i386                           randconfig-017    gcc-13
i386                  randconfig-017-20260704    clang-22
i386                  randconfig-017-20260704    gcc-13
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-20
loongarch                         allnoconfig    gcc-16.1.0
loongarch                           defconfig    clang-23
loongarch                      randconfig-001    clang-23
loongarch             randconfig-001-20260704    gcc-16.1.0
loongarch                      randconfig-002    gcc-16.1.0
loongarch             randconfig-002-20260704    clang-23
m68k                             allmodconfig    gcc-16.1.0
m68k                              allnoconfig    gcc-16.1.0
m68k                             allyesconfig    clang-23
m68k                             allyesconfig    gcc-16.1.0
m68k                                defconfig    clang-23
m68k                                defconfig    gcc-16.1.0
m68k                        m5272c3_defconfig    gcc-16.1.0
microblaze                        allnoconfig    gcc-16.1.0
microblaze                       allyesconfig    gcc-16.1.0
microblaze                          defconfig    clang-23
microblaze                          defconfig    gcc-16.1.0
mips                             allmodconfig    gcc-16.1.0
mips                              allnoconfig    gcc-16.1.0
mips                             allyesconfig    gcc-16.1.0
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-23
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-23
nios2                               defconfig    gcc-11.5.0
nios2                          randconfig-001    gcc-11.5.0
nios2                 randconfig-001-20260704    gcc-11.5.0
nios2                          randconfig-002    gcc-8.5.0
nios2                 randconfig-002-20260704    gcc-11.5.0
openrisc                         allmodconfig    gcc-16.1.0
openrisc                          allnoconfig    clang-23
openrisc                          allnoconfig    gcc-16.1.0
openrisc                            defconfig    gcc-16.1.0
parisc                           allmodconfig    gcc-16.1.0
parisc                            allnoconfig    clang-23
parisc                            allnoconfig    gcc-16.1.0
parisc                           allyesconfig    gcc-16.1.0
parisc                              defconfig    gcc-16.1.0
parisc                         randconfig-001    clang-23
parisc                randconfig-001-20260704    clang-23
parisc                randconfig-001-20260704    gcc-8.5.0
parisc                         randconfig-002    clang-23
parisc                randconfig-002-20260704    clang-23
parisc                randconfig-002-20260704    gcc-8.5.0
parisc64                            defconfig    clang-23
parisc64                            defconfig    gcc-16.1.0
powerpc                          allmodconfig    gcc-16.1.0
powerpc                           allnoconfig    clang-23
powerpc                           allnoconfig    gcc-16.1.0
powerpc                        randconfig-001    clang-23
powerpc               randconfig-001-20260704    clang-23
powerpc               randconfig-001-20260704    gcc-15.2.0
powerpc                        randconfig-002    clang-23
powerpc               randconfig-002-20260704    clang-23
powerpc               randconfig-002-20260704    gcc-8.5.0
powerpc64                      randconfig-001    clang-23
powerpc64             randconfig-001-20260704    clang-23
powerpc64             randconfig-001-20260704    gcc-10.5.0
powerpc64                      randconfig-002    clang-23
powerpc64             randconfig-002-20260704    clang-23
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                             allnoconfig    gcc-16.1.0
riscv                            allyesconfig    clang-23
riscv                               defconfig    clang-23
riscv                               defconfig    gcc-16.1.0
riscv                          randconfig-001    gcc-13.4.0
riscv                 randconfig-001-20260704    gcc-10.5.0
riscv                 randconfig-001-20260704    gcc-13.4.0
riscv                          randconfig-002    clang-23
riscv                 randconfig-002-20260704    gcc-10.5.0
riscv                 randconfig-002-20260704    gcc-11.5.0
s390                             allmodconfig    clang-23
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-16.1.0
s390                                defconfig    clang-18
s390                                defconfig    gcc-16.1.0
s390                           randconfig-001    gcc-15.2.0
s390                  randconfig-001-20260704    gcc-10.5.0
s390                  randconfig-001-20260704    gcc-16.1.0
s390                           randconfig-002    clang-18
s390                  randconfig-002-20260704    gcc-10.5.0
sh                               allmodconfig    gcc-16.1.0
sh                                allnoconfig    clang-23
sh                                allnoconfig    gcc-16.1.0
sh                               allyesconfig    gcc-16.1.0
sh                                  defconfig    gcc-14
sh                                  defconfig    gcc-16.1.0
sh                             randconfig-001    gcc-14.3.0
sh                    randconfig-001-20260704    gcc-10.5.0
sh                    randconfig-001-20260704    gcc-16.1.0
sh                             randconfig-002    gcc-9.5.0
sh                    randconfig-002-20260704    gcc-10.5.0
sh                    randconfig-002-20260704    gcc-9.5.0
sparc                             allnoconfig    clang-23
sparc                             allnoconfig    gcc-16.1.0
sparc                               defconfig    gcc-16.1.0
sparc                          randconfig-001    gcc-16.1.0
sparc                 randconfig-001-20260704    gcc-16.1.0
sparc                          randconfig-002    gcc-11.5.0
sparc                 randconfig-002-20260704    gcc-16.1.0
sparc64                          allmodconfig    clang-20
sparc64                             defconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64                        randconfig-001    gcc-12.5.0
sparc64               randconfig-001-20260704    clang-23
sparc64               randconfig-001-20260704    gcc-16.1.0
sparc64                        randconfig-002    clang-20
sparc64               randconfig-002-20260704    clang-22
sparc64               randconfig-002-20260704    gcc-16.1.0
um                               allmodconfig    clang-23
um                                allnoconfig    clang-16
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                                  defconfig    clang-23
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                             randconfig-001    clang-23
um                    randconfig-001-20260704    gcc-14
um                    randconfig-001-20260704    gcc-16.1.0
um                             randconfig-002    clang-23
um                    randconfig-002-20260704    clang-18
um                    randconfig-002-20260704    gcc-16.1.0
um                           x86_64_defconfig    clang-23
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-22
x86_64                            allnoconfig    clang-22
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-22
x86_64      buildonly-randconfig-001-20260704    gcc-14
x86_64      buildonly-randconfig-002-20260704    clang-22
x86_64      buildonly-randconfig-002-20260704    gcc-14
x86_64      buildonly-randconfig-003-20260704    gcc-14
x86_64      buildonly-randconfig-004-20260704    gcc-14
x86_64      buildonly-randconfig-005-20260704    gcc-14
x86_64      buildonly-randconfig-006-20260704    clang-22
x86_64      buildonly-randconfig-006-20260704    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-22
x86_64                         randconfig-001    clang-22
x86_64                randconfig-001-20260704    clang-22
x86_64                         randconfig-002    clang-22
x86_64                randconfig-002-20260704    clang-22
x86_64                         randconfig-003    clang-22
x86_64                randconfig-003-20260704    clang-22
x86_64                         randconfig-004    clang-22
x86_64                randconfig-004-20260704    clang-22
x86_64                         randconfig-005    clang-22
x86_64                randconfig-005-20260704    clang-22
x86_64                randconfig-005-20260704    gcc-14
x86_64                         randconfig-006    clang-22
x86_64                randconfig-006-20260704    clang-22
x86_64                randconfig-011-20260704    clang-22
x86_64                randconfig-012-20260704    clang-22
x86_64                randconfig-012-20260704    gcc-14
x86_64                randconfig-013-20260704    clang-22
x86_64                randconfig-014-20260704    clang-22
x86_64                randconfig-015-20260704    clang-22
x86_64                randconfig-015-20260704    gcc-14
x86_64                randconfig-016-20260704    clang-22
x86_64                randconfig-016-20260704    gcc-14
x86_64                randconfig-071-20260704    gcc-14
x86_64                randconfig-072-20260704    gcc-14
x86_64                randconfig-073-20260704    gcc-14
x86_64                randconfig-074-20260704    gcc-14
x86_64                randconfig-075-20260704    gcc-14
x86_64                randconfig-076-20260704    gcc-14
x86_64                               rhel-9.4    clang-22
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-22
x86_64                    rhel-9.4-kselftests    clang-22
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-22
xtensa                            allnoconfig    clang-23
xtensa                            allnoconfig    gcc-16.1.0
xtensa                         randconfig-001    gcc-8.5.0
xtensa                randconfig-001-20260704    gcc-16.1.0
xtensa                randconfig-001-20260704    gcc-8.5.0
xtensa                         randconfig-002    gcc-13.4.0
xtensa                randconfig-002-20260704    gcc-16.1.0
xtensa                randconfig-002-20260704    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

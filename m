Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38A08C2D0D1
	for <intel-xe@archiver.kernel.org>; Mon, 24 Jun 2024 19:36:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E866410E571;
	Mon, 24 Jun 2024 19:36:40 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9488210E00E;
 Mon, 24 Jun 2024 19:36:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_BUILD_REGRESSION_f76698bd?=
 =?utf-8?q?9a8ca01d3581236082d786e9a6b72bb7?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Andrew Morton" <akpm@linux-foundation.org>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 24 Jun 2024 19:36:40 -0000
Message-ID: <171925780060.154922.17509122803696185865@a6498e030952>
X-Patchwork-Hint: ignore
References: <202406230716.DQbMBKh0-lkp@intel.com>
In-Reply-To: <202406230716.DQbMBKh0-lkp@intel.com>
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
Reply-To: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: BUILD REGRESSION f76698bd9a8ca01d3581236082d786e9a6b72bb7
URL   : https://patchwork.freedesktop.org/series/135318/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
51ce9f6cd981d42d7467409d7dbc559a450abc1e
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit e4357fcb370d4a1f3d06f7b68051051c9cfa081c
Author: Andrew Morton <akpm@linux-foundation.org>
Date:   Mon Jun 24 12:31:54 2024 -0700

    BUILD REGRESSION f76698bd9a8ca01d3581236082d786e9a6b72bb7
    
    On Sun, 23 Jun 2024 07:11:24 +0800 kernel test robot <lkp@intel.com> wrote:
    
    > tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
    > branch HEAD: f76698bd9a8ca01d3581236082d786e9a6b72bb7  Add linux-next specific files for 20240621
    >
    > Error/Warning reports:
    >
    > https://lore.kernel.org/oe-kbuild-all/202406220536.JnAncjqz-lkp@intel.com
    > https://lore.kernel.org/oe-kbuild-all/202406220754.evK8Hrjw-lkp@intel.com
    >
    > Error/Warning: (recently discovered and may have been fixed)
    >
    > drivers/soc/qcom/smsm.c:(.text.qcom_smsm_remove+0x70): undefined reference to `mbox_free_channel'
    >
    > Unverified Error/Warning (likely false positive, please contact us if interested):
    >
    > include/linux/container_of.h:20:54: error: invalid use of undefined type 'struct thpsize'
    > include/linux/list.h:645:25: error: invalid use of undefined type 'struct thpsize'
    > include/linux/stddef.h:16:33: error: invalid use of undefined type 'struct thpsize'
    > mm/huge_memory.c:455:21: error: implicit declaration of function 'to_thpsize'; did you mean 'thp_size'? [-Werror=implicit-function-declaration]
    > mm/huge_memory.c:455:37: error: invalid type argument of '->' (have 'int')
    > mm/huge_memory.c:558:35: error: 'MTHP_STAT_FILE_ALLOC' undeclared (first use in this function); did you mean 'THP_FILE_ALLOC'?
    > mm/huge_memory.c:559:38: error: 'MTHP_STAT_FILE_FALLBACK' undeclared (first use in this function); did you mean 'THP_FILE_FALLBACK'?
    > mm/huge_memory.c:560:45: error: 'MTHP_STAT_FILE_FALLBACK_CHARGE' undeclared (first use in this function); did you mean 'THP_FILE_FALLBACK_CHARGE'?
    > mm/huge_memory.c:579:17: warning: assignment to 'struct thpsize *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    > mm/huge_memory.c:579:33: error: invalid application of 'sizeof' to incomplete type 'struct thpsize'
    > mm/huge_memory.c:583:44: error: invalid use of undefined type 'struct thpsize'
    > mm/huge_memory.c:608:15: warning: passing argument 1 of 'kfree' makes pointer from integer without a cast [-Wint-conversion]
    >
    >
    > ...
    >
    >
    > |-- x86_64-randconfig-014-20240202
    > |   |-- include-linux-container_of.h:error:invalid-use-of-undefined-type-struct-thpsize
    > |   |-- include-linux-list.h:error:invalid-use-of-undefined-type-struct-thpsize
    > |   |-- include-linux-stddef.h:error:invalid-use-of-undefined-type-struct-thpsize
    > |   |-- mm-huge_memory.c:error:MTHP_STAT_FILE_ALLOC-undeclared-(first-use-in-this-function)
    > |   |-- mm-huge_memory.c:error:MTHP_STAT_FILE_FALLBACK-undeclared-(first-use-in-this-function)
    > |   |-- mm-huge_memory.c:error:MTHP_STAT_FILE_FALLBACK_CHARGE-undeclared-(first-use-in-this-function)
    > |   |-- mm-huge_memory.c:error:implicit-declaration-of-function-to_thpsize
    > |   |-- mm-huge_memory.c:error:invalid-application-of-sizeof-to-incomplete-type-struct-thpsize
    > |   |-- mm-huge_memory.c:error:invalid-type-argument-of-(have-int-)
    > |   |-- mm-huge_memory.c:error:invalid-use-of-undefined-type-struct-thpsize
    > |   |-- mm-huge_memory.c:warning:assignment-to-struct-thpsize-from-int-makes-pointer-from-integer-without-a-cast
    > |   `-- mm-huge_memory.c:warning:passing-argument-of-kfree-makes-pointer-from-integer-without-a-cast
    
    Is there a way for us to obtain that config file?
    
    "mm: shmem: add multi-size THP sysfs interface for anonymous shmem"
    moved things into mm_tytpes.h but didn't include it so perhaps this
    will fix:
+ /mt/dim checkpatch cf83cd8ff370955a504fdf1388ea6e257da76a8b drm-intel
e4357fcb370d BUILD REGRESSION f76698bd9a8ca01d3581236082d786e9a6b72bb7
-:8: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#8: 
> tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master

-:70: ERROR:MISSING_SIGN_OFF: Missing Signed-off-by: line(s)

total: 1 errors, 1 warnings, 0 checks, 7 lines checked



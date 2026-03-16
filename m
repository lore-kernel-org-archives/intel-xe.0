Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C32ED58B36
	for <intel-xe@archiver.kernel.org>; Mon, 16 Mar 2026 05:34:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E86E10E2D8;
	Mon, 16 Mar 2026 05:34:37 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7960E10E2CF;
 Mon, 16 Mar 2026 05:34:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Add_fault-injec?=
 =?utf-8?q?tion_support_for_CRI_throttle_reasons?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ravi Kishore Koppuravuri" <ravi.kishore.koppuravuri@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 16 Mar 2026 05:34:36 -0000
Message-ID: <177363927647.359733.6536234006480754714@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260316052929.2069009-1-ravi.kishore.koppuravuri@intel.com>
In-Reply-To: <20260316052929.2069009-1-ravi.kishore.koppuravuri@intel.com>
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

Series: drm/xe: Add fault-injection support for CRI throttle reasons
URL   : https://patchwork.freedesktop.org/series/163247/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
1f57ba1afceae32108bd24770069f764d940a0e4
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 7d12574491c37351a1557e4805e5556052ac6089
Author: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
Date:   Mon Mar 16 10:59:29 2026 +0530

    drm/xe: Add fault-injection support for CRI throttle reasons
    
    Introduce fault injection capability for
    xe_gt_throttle_get_limit_reasons() to enable robust testing of throttle
    reason reporting under failure scenarios. This patch incorporates error
    injection hooks that allow checking the behavior of the frequency
    throttling. It ensures that the error handling is properly implemented
    and handled.
    
    Required kernel configuration:
    CONFIG_KUNIT=m
    CONFIG_KUNIT_DEBUGFS=y
    CONFIG_FAIL_FUNCTION=y
    CONFIG_FAULT_INJECTION=y
    CONFIG_FAULT_INJECTION_DEBUG_FS=y
    CONFIG_FUNCTION_ERROR_INJECTION=y
    
    Usage example:
    Setup fault injection for throttle function
    
    FAILTYPE=fail_function
    FAILFUNC=xe_gt_throttle_inject_errno
    
    echo > /sys/kernel/debug/$FAILTYPE/inject
    echo $FAILFUNC > /sys/kernel/debug/$FAILTYPE/inject
    printf %#x -1 > /sys/kernel/debug/$FAILTYPE/$FAILFUNC/retval
    
    echo N > /sys/kernel/debug/$FAILTYPE/task-filter
    echo 10 > /sys/kernel/debug/$FAILTYPE/probability
    echo 0 > /sys/kernel/debug/$FAILTYPE/interval
    echo -1 > /sys/kernel/debug/$FAILTYPE/times
    echo 0 > /sys/kernel/debug/$FAILTYPE/space
    echo 1 > /sys/kernel/debug/$FAILTYPE/verbose
    
    Sample result of verifying throttle reasons on Battlemage platform
    ```
    root@DUT2107BMGFRD:/home/gta# cat /sys/devices/pci0000:00/0000:00:01.0/0000:01:00.0/0000:02:01.0/0000:03:00.0/tile0/gt0/freq0/throttle/reasons
    thermal
    ```
    This enables comprehensive testing of error paths in fetching the
    frequency throttle reason.
    
    Cc: Tauro Riana <riana.tauro@intel.com>
    Cc: Gupta Anshuman <anshuman.gupta@intel.com>
    Cc: Sk Anirban <sk.anirban@intel.com>
    Signed-off-by: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
+ /mt/dim checkpatch f0700a5f37f7cb00aced6fb9a16f86fdf2f493aa drm-intel
7d12574491c3 drm/xe: Add fault-injection support for CRI throttle reasons
-:40: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#40: 
root@DUT2107BMGFRD:/home/gta# cat /sys/devices/pci0000:00/0000:00:01.0/0000:01:00.0/0000:02:01.0/0000:03:00.0/tile0/gt0/freq0/throttle/reasons

total: 0 errors, 1 warnings, 0 checks, 60 lines checked



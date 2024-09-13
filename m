Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDE49FC616E
	for <intel-xe@archiver.kernel.org>; Fri, 13 Sep 2024 18:15:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D82610ED72;
	Fri, 13 Sep 2024 18:15:17 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22B6810ED79;
 Fri, 13 Sep 2024 18:15:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Use_fault_injec?=
 =?utf-8?q?tion_infrastructure_to_find_issues_at_probe_time?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 13 Sep 2024 18:15:16 -0000
Message-ID: <172625131613.997784.16483635115560820893@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240913143305.2262927-1-francois.dugast@intel.com>
In-Reply-To: <20240913143305.2262927-1-francois.dugast@intel.com>
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

Series: drm/xe: Use fault injection infrastructure to find issues at probe time
URL   : https://patchwork.freedesktop.org/series/138654/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c62d7e164862503a3662a095da1c6c9014248cb2
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 8b96a301d4dd3321de7c422834dd165737733088
Author: Francois Dugast <francois.dugast@intel.com>
Date:   Fri Sep 13 16:33:05 2024 +0200

    drm/xe: Use fault injection infrastructure to find issues at probe time
    
    This RFC is a rework of https://patchwork.freedesktop.org/series/137314/
    but instead of importing custom macros from i915, it makes use of the
    standard kernel fault injection infrastructure, see fault-injection.rst.
    
    In particular, it leverages error injectable functions with the macro
    ALLOW_ERROR_INJECTION(). This macro requires minimal code changes to the
    faulting function, if it meets the injectable functions requirements:
    fault-injection.html#requirements-for-the-error-injectable-functions
    
    Unfortunately this is not the case in most of the injection points of the
    original series, so a wrapper is added if needed. Only a few examples are
    shown in this RFC to discuss the proper pattern to apply.
    
    The return code of the functions using ALLOW_ERROR_INJECTION() can be
    conditionnally modified at runtime by tuning some debugfs entries. This
    requires CONFIG_FUNCTION_ERROR_INJECTION (among others).
    
    One way to use fault injection at probe time by making each of those
    functions fail one at a time is:
    
        FAILTYPE=fail_function
        DEVICE="0000:00:08.0" # depends on the system
        ERRNO=-12 # -ENOMEM, other value might be needed depending on error handling
    
        echo N > /sys/kernel/debug/$FAILTYPE/task-filter
        echo 100 > /sys/kernel/debug/$FAILTYPE/probability
        echo 0 > /sys/kernel/debug/$FAILTYPE/interval
        echo -1 > /sys/kernel/debug/$FAILTYPE/times
        echo 0 > /sys/kernel/debug/$FAILTYPE/space
        echo 1 > /sys/kernel/debug/$FAILTYPE/verbose
    
        modprobe xe
        echo $DEVICE > /sys/bus/pci/drivers/xe/unbind
    
        grep -oP "^.* \[xe\]" /sys/kernel/debug/$FAILTYPE/injectable | cut -d ' ' -f 1 | while read -r FUNCTION ; do
            echo "Injecting fault in $FUNCTION"
            echo "" > /sys/kernel/debug/$FAILTYPE/inject
            echo $FUNCTION > /sys/kernel/debug/$FAILTYPE/inject
            printf %#x $ERRNO > /sys/kernel/debug/$FAILTYPE/$FUNCTION/retval
            echo $DEVICE > /sys/bus/pci/drivers/xe/bind
        done
    
        rmmod xe
    
    Signed-off-by: Francois Dugast <francois.dugast@intel.com>
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch df3eecb1fa97d6d35569c2fa39f0da78b9f13328 drm-intel
8b96a301d4dd drm/xe: Use fault injection infrastructure to find issues at probe time
-:29: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#29: 
    ERRNO=-12 # -ENOMEM, other value might be needed depending on error handling

total: 0 errors, 1 warnings, 0 checks, 109 lines checked



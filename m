Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00A7FCDD1CD
	for <intel-xe@archiver.kernel.org>; Fri, 27 Sep 2024 16:55:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C21FB10E46A;
	Fri, 27 Sep 2024 16:55:08 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F47710E46A;
 Fri, 27 Sep 2024 16:55:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Use_fault_injec?=
 =?utf-8?q?tion_infrastructure_to_find_issues_at_probe_time_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 27 Sep 2024 16:55:07 -0000
Message-ID: <172745610751.1112392.5846626957987199259@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240927151207.399354-1-francois.dugast@intel.com>
In-Reply-To: <20240927151207.399354-1-francois.dugast@intel.com>
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

Series: drm/xe: Use fault injection infrastructure to find issues at probe time (rev4)
URL   : https://patchwork.freedesktop.org/series/138654/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
30ab6715fc09baee6cc14cb3c89ad8858688d474
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit c77998e9540cd180e75a010ee5159ce51f903624
Author: Francois Dugast <francois.dugast@intel.com>
Date:   Fri Sep 27 17:12:06 2024 +0200

    drm/xe: Use fault injection infrastructure to find issues at probe time
    
    The kernel fault injection infrastructure is used to test proper error
    handling during probe. The return code of the functions using
    ALLOW_ERROR_INJECTION() can be conditionnally modified at runtime by
    tuning some debugfs entries. This requires CONFIG_FUNCTION_ERROR_INJECTION
    (among others).
    
    One way to use fault injection at probe time by making each of those
    functions fail one at a time is:
    
        FAILTYPE=fail_function
        DEVICE="0000:00:08.0" # depends on the system
        ERRNO=-12 # -ENOMEM, can depend on the function
    
        echo N > /sys/kernel/debug/$FAILTYPE/task-filter
        echo 100 > /sys/kernel/debug/$FAILTYPE/probability
        echo 0 > /sys/kernel/debug/$FAILTYPE/interval
        echo -1 > /sys/kernel/debug/$FAILTYPE/times
        echo 0 > /sys/kernel/debug/$FAILTYPE/space
        echo 1 > /sys/kernel/debug/$FAILTYPE/verbose
    
        modprobe xe
        echo $DEVICE > /sys/bus/pci/drivers/xe/unbind
    
        grep -oP "^.* \[xe\]" /sys/kernel/debug/$FAILTYPE/injectable | \
        cut -d ' ' -f 1 | while read -r FUNCTION ; do
            echo "Injecting fault in $FUNCTION"
            echo "" > /sys/kernel/debug/$FAILTYPE/inject
            echo $FUNCTION > /sys/kernel/debug/$FAILTYPE/inject
            printf %#x $ERRNO > /sys/kernel/debug/$FAILTYPE/$FUNCTION/retval
            echo $DEVICE > /sys/bus/pci/drivers/xe/bind
        done
    
        rmmod xe
    
    It will also be integrated into IGT for systematic execution by CI.
    
    v2: Wrappers are not needed in the cases covered by this patch, so
        remove them and use ALLOW_ERROR_INJECTION() directly.
    
    v3: Document the use of fault injection at probe time in xe_pci_probe
        and refer to it where ALLOW_ERROR_INJECTION() is used.
    
    Signed-off-by: Francois Dugast <francois.dugast@intel.com>
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Cc: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 4d4fdd11d1cc941f2f7c1653fc07519851d9052b drm-intel
c77998e9540c drm/xe: Use fault injection infrastructure to find issues at probe time



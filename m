Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65AC3E7718A
	for <intel-xe@archiver.kernel.org>; Thu, 19 Dec 2024 07:05:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D91010E294;
	Thu, 19 Dec 2024 07:05:22 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF77610E294;
 Thu, 19 Dec 2024 07:05:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Introduce_fault_injection?=
 =?utf-8?q?_for_guc_CTB_=26_mmio_send/recv=2E?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Satyanarayana K V P" <satyanarayana.k.v.p@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 19 Dec 2024 07:05:20 -0000
Message-ID: <173459192078.309959.13970752796106120680@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241219064932.25145-1-satyanarayana.k.v.p@intel.com>
In-Reply-To: <20241219064932.25145-1-satyanarayana.k.v.p@intel.com>
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

Series: Introduce fault injection for guc CTB & mmio send/recv.
URL   : https://patchwork.freedesktop.org/series/142815/
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
commit 3a6e9a3c007d16c06e21a5910b09f62077e12c6b
Author: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Date:   Thu Dec 19 12:19:32 2024 +0530

    drm/xe: Introduce fault injection for guc CTB send/recv
    
    Fault can be injected with below steps.
    
    FAILTYPE=fail_function
    FAILFUNC=xe_guc_ct_send_recv
    
    echo > /sys/kernel/debug/$FAILTYPE/inject
    echo $FAILFUNC > /sys/kernel/debug/$FAILTYPE/inject
    printf %#x -19 > /sys/kernel/debug/$FAILTYPE/$FAILFUNC/retval
    
    echo N > /sys/kernel/debug/$FAILTYPE/task-filter
    echo 10 > /sys/kernel/debug/$FAILTYPE/probability
    echo 0 > /sys/kernel/debug/$FAILTYPE/interval
    echo -1 > /sys/kernel/debug/$FAILTYPE/times
    echo 0 > /sys/kernel/debug/$FAILTYPE/space
    echo 1 > /sys/kernel/debug/$FAILTYPE/verbose
    
    Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>
+ /mt/dim checkpatch 4d485df56628d613cca2abc4b8043e9b3bc2b5be drm-intel
eb806b10cc36 drm/xe: Introduce fault injection for guc mmio send/recv.
3a6e9a3c007d drm/xe: Introduce fault injection for guc CTB send/recv



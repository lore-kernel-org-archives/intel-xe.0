Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E60DD3A661
	for <intel-xe@archiver.kernel.org>; Tue, 29 Oct 2024 14:58:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 337FF10E67C;
	Tue, 29 Oct 2024 14:58:03 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0037110E67E;
 Tue, 29 Oct 2024 14:58:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5Bv?=
 =?utf-8?q?5=2C1/3=5D_drm/xe=3A_Move_LNL_scheduling_WA_to_xe=5Fdevice=2Eh?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nirmoy Das" <nirmoy.das@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 29 Oct 2024 14:58:01 -0000
Message-ID: <173021388199.1359386.10550755618452859412@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241029120117.449694-1-nirmoy.das@intel.com>
In-Reply-To: <20241029120117.449694-1-nirmoy.das@intel.com>
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

Series: series starting with [v5,1/3] drm/xe: Move LNL scheduling WA to xe_device.h
URL   : https://patchwork.freedesktop.org/series/140658/
State : warning

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
commit f1af869cc10bd1047d5fecd72e7c58f41923a907
Author: Nirmoy Das <nirmoy.das@intel.com>
Date:   Tue Oct 29 13:01:17 2024 +0100

    drm/xe/guc/tlb: Flush g2h worker in case of tlb timeout
    
    Flush the g2h worker explicitly if TLB timeout happens which is
    observed on LNL and that points to the recent scheduling issue with
    E-cores on LNL.
    
    This is similar to the recent fix:
    commit e51527233804 ("drm/xe/guc/ct: Flush g2h worker in case of g2h
    response timeout") and should be removed once there is E core
    scheduling fix.
    
    v2: Add platform check(Himal)
    v3: Remove gfx platform check as the issue related to cpu
        platform(John)
        Use the common WA macro(John) and print when the flush
        resolves timeout(Matt B)
    v4: Remove the resolves log and do the flush before taking
        pending_lock(Matt A)
    
    Cc: Badal Nilawar <badal.nilawar@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: Matthew Auld <matthew.auld@intel.com>
    Cc: John Harrison <John.C.Harrison@Intel.com>
    Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Cc: <stable@vger.kernel.org> # v6.11+
    Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2687
    Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
+ /mt/dim checkpatch 95fd9af8bb5389f9b5a639d567ef5c3e43e25682 drm-intel
c685196e945e drm/xe: Move LNL scheduling WA to xe_device.h
-:65: WARNING:MISSING_FIXES_TAG: The commit message has 'stable@', perhaps it also needs a 'Fixes:' tag?

total: 0 errors, 1 warnings, 0 checks, 36 lines checked
a46d370347bd drm/xe/ufence: Flush xe ordered_wq in case of ufence timeout
-:48: WARNING:MISSING_FIXES_TAG: The commit message has 'stable@', perhaps it also needs a 'Fixes:' tag?

total: 0 errors, 1 warnings, 0 checks, 13 lines checked
f1af869cc10b drm/xe/guc/tlb: Flush g2h worker in case of tlb timeout
-:45: WARNING:MISSING_FIXES_TAG: The commit message has 'stable@', perhaps it also needs a 'Fixes:' tag?

total: 0 errors, 1 warnings, 0 checks, 8 lines checked



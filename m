Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EA05D1038E
	for <intel-xe@archiver.kernel.org>; Fri, 25 Oct 2024 01:52:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FF6610E0CF;
	Fri, 25 Oct 2024 01:52:31 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54E5F10E0CF;
 Fri, 25 Oct 2024 01:52:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/ufence=3A_Flush_xe?=
 =?utf-8?q?_ordered=5Fwq_in_case_of_ufence_timeout_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nirmoy Das" <nirmoy.das@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 25 Oct 2024 01:52:30 -0000
Message-ID: <172982115034.1330038.14353991569763804546@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241024151815.929142-1-nirmoy.das@intel.com>
In-Reply-To: <20241024151815.929142-1-nirmoy.das@intel.com>
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

Series: drm/xe/ufence: Flush xe ordered_wq in case of ufence timeout (rev2)
URL   : https://patchwork.freedesktop.org/series/140386/
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
commit 26bd871db556b14abd07ed49de04cdb1e8e7a861
Author: Nirmoy Das <nirmoy.das@intel.com>
Date:   Thu Oct 24 17:18:15 2024 +0200

    drm/xe/ufence: Flush xe ordered_wq in case of ufence timeout
    
    Flush xe ordered_wq in case of ufence timeout which is observed
    on LNL and that points to the recent scheduling issue with E-cores.
    
    This is similar to the recent fix:
    commit e51527233804 ("drm/xe/guc/ct: Flush g2h worker in case of g2h
    response timeout") and should be removed once there is E core
    scheduling fix.
    
    v2: Add platform check(Himal)
        s/__flush_workqueue/flush_workqueue(Jani)
    
    Cc: Badal Nilawar <badal.nilawar@intel.com>
    Cc: Jani Nikula <jani.nikula@intel.com>
    Cc: Matthew Auld <matthew.auld@intel.com>
    Cc: John Harrison <John.C.Harrison@Intel.com>
    Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Cc: <stable@vger.kernel.org> # v6.11+
    Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2754
    Suggested-by: Matthew Brost <matthew.brost@intel.com>
    Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 75eab7b9ee32a121d95a42ac704b679097f1fac4 drm-intel
26bd871db556 drm/xe/ufence: Flush xe ordered_wq in case of ufence timeout
-:60: WARNING:MISSING_FIXES_TAG: The commit message has 'stable@', perhaps it also needs a 'Fixes:' tag?

total: 0 errors, 1 warnings, 0 checks, 26 lines checked



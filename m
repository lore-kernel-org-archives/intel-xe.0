Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1F2FD0BB6E
	for <intel-xe@archiver.kernel.org>; Thu, 24 Oct 2024 08:17:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9409A10E8CC;
	Thu, 24 Oct 2024 08:17:44 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDA6910E8CC;
 Thu, 24 Oct 2024 08:17:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/guc/tlb=3A_Flush_g?=
 =?utf-8?q?2h_worker_in_case_of_tlb_timeout?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nirmoy Das" <nirmoy.das@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 24 Oct 2024 08:17:43 -0000
Message-ID: <172975786390.1325975.6799222383950031355@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241023151343.3463640-1-nirmoy.das@intel.com>
In-Reply-To: <20241023151343.3463640-1-nirmoy.das@intel.com>
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

Series: drm/xe/guc/tlb: Flush g2h worker in case of tlb timeout
URL   : https://patchwork.freedesktop.org/series/140382/
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
commit cecdd79a4771333fda846b9ac4ebec100e4db530
Author: Nirmoy Das <nirmoy.das@intel.com>
Date:   Wed Oct 23 17:13:43 2024 +0200

    drm/xe/guc/tlb: Flush g2h worker in case of tlb timeout
    
    Flush the g2h worker explicitly if TLB timeout happens which is
    observed on LNL and that points recent scheduling issue with E-cores.
    This is similar to the recent fix:
    commit e51527233804 ("drm/xe/guc/ct: Flush g2h worker in case of g2h
    response timeout") and should be removed once there is E core
    scheduling fix.
    
    Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2687
    Cc: Badal Nilawar <badal.nilawar@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: Matthew Auld <matthew.auld@intel.com>
    Cc: John Harrison <John.C.Harrison@Intel.com>
    Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 3d45ea06af2c04db741c142380d97001b3cdb5da drm-intel
cecdd79a4771 drm/xe/guc/tlb: Flush g2h worker in case of tlb timeout



Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C567CDE02E
	for <intel-xe@archiver.kernel.org>; Thu, 26 Sep 2024 18:25:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED3A710E19C;
	Thu, 26 Sep 2024 18:25:43 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0763210E19C;
 Thu, 26 Sep 2024 18:25:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Check_return_va?=
 =?utf-8?q?lues_of_functions_in_xe=5Fgt=5Fshutdown=28=29_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: apoorva.singh@intel.com
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 26 Sep 2024 18:25:42 -0000
Message-ID: <172737514201.1108338.13573248765637285245@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240926110026.407383-1-apoorva.singh@intel.com>
In-Reply-To: <20240926110026.407383-1-apoorva.singh@intel.com>
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

Series: drm/xe: Check return values of functions in xe_gt_shutdown() (rev3)
URL   : https://patchwork.freedesktop.org/series/138916/
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
commit f342f004dcef79e3ba4b28e0469520dc6a62e233
Author: Apoorva Singh <apoorva.singh@intel.com>
Date:   Thu Sep 26 16:30:26 2024 +0530

    drm/xe: Check return values of functions in xe_gt_shutdown()
    
    Check the return values of the functions xe_force_wake_get()
    and xe_force_wake_put() to prevent mistakenly treating them as
    void returns.
    
    Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
    Signed-off-by: Apoorva Singh <apoorva.singh@intel.com>
    Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
+ /mt/dim checkpatch f82c02cc01798312082cc41feaa473538e517c7b drm-intel
f342f004dcef drm/xe: Check return values of functions in xe_gt_shutdown()
-:24: WARNING:LINE_SPACING: Missing a blank line after declarations
#24: FILE: drivers/gpu/drm/xe/xe_gt.c:893:
+	int err;
+	err = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);

total: 0 errors, 1 warnings, 0 checks, 14 lines checked



Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CC17D2444F
	for <intel-xe@archiver.kernel.org>; Thu, 10 Oct 2024 22:33:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D503310E151;
	Thu, 10 Oct 2024 22:33:54 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A9E010E151;
 Thu, 10 Oct 2024 22:33:53 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Enlarge_the_inv?=
 =?utf-8?q?alidation_timeout_from_150_to_500_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Shuicheng Lin" <shuicheng.lin@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 10 Oct 2024 22:33:53 -0000
Message-ID: <172859963356.1237785.16503786680293285221@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241010215346.1002048-1-shuicheng.lin@intel.com>
In-Reply-To: <20241010215346.1002048-1-shuicheng.lin@intel.com>
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

Series: drm/xe: Enlarge the invalidation timeout from 150 to 500 (rev3)
URL   : https://patchwork.freedesktop.org/series/139805/
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
commit 9e3629517b0816edb7138c019aee7fda1ecd21b5
Author: Shuicheng Lin <shuicheng.lin@intel.com>
Date:   Thu Oct 10 21:53:46 2024 +0000

    drm/xe: Enlarge the invalidation timeout from 150 to 500
    
    There are error messages like below that are occurring during stress testing:
    "[   31.004009] xe 0000:03:00.0: [drm] ERROR GT0: Global invalidation timeout"
    Previously it was hitting this 3 with 1000 executions of warm reboot.
    After raising it to 500, 1000 warm reboot executions passed and it didn't
    fail.
    
    Due to the way xe_mmio_wait32() is implemented, the timeout is able to expire
    early when the register matches the expected value due to the wait increments
    starting small. So, the larger timeout value should have no effect during
    normal use cases.
    
    Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Cc: Matthew Auld <matthew.auld@intel.com>
    Cc: Nirmoy Das <nirmoy.das@intel.com>
    Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
    Tested-by: Zongyao Bai <zongyao.bai@intel.com>
+ /mt/dim checkpatch 10f232fcfa47dc35d2403148616ad71ccde7d0f3 drm-intel
9e3629517b08 drm/xe: Enlarge the invalidation timeout from 150 to 500
-:6: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#6: 
There are error messages like below that are occurring during stress testing:

total: 0 errors, 1 warnings, 0 checks, 8 lines checked



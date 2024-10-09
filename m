Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 428D7CEE343
	for <intel-xe@archiver.kernel.org>; Wed,  9 Oct 2024 20:02:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10F5310E7E5;
	Wed,  9 Oct 2024 20:02:49 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 708AF10E7E5;
 Wed,  9 Oct 2024 20:02:48 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Enlarge_the_inv?=
 =?utf-8?q?alidation_timeout_from_150_to_500?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lin, Shuicheng" <shuicheng.lin@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 09 Oct 2024 20:02:48 -0000
Message-ID: <172850416845.1212138.4037337724931474862@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241009172208.706894-1-shuicheng.lin@intel.com>
In-Reply-To: <20241009172208.706894-1-shuicheng.lin@intel.com>
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

Series: drm/xe: Enlarge the invalidation timeout from 150 to 500
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
commit 2a3cb23bca2014a084739f0c205f5fcb89b57199
Author: Shuicheng Lin <shuicheng.lin@intel.com>
Date:   Wed Oct 9 17:22:08 2024 +0000

    drm/xe: Enlarge the invalidation timeout from 150 to 500
    
    There is error message like below during stress test.
    "[   31.004009] xe 0000:03:00.0: [drm] ERROR GT0: Global invalidation timeout"
    And change the timeout value from 150 to 500, could help avoid
    this error message in the stress test.
    xe_mmio_wait32() is implemented as wait 10us at beginning, then
    double the wait value as next wait until the timeout value is
    reached. So for the normal case, the real wait time is not changed.
    The larger timeout value should take effect for the bad case only.
    
    Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
    Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
+ /mt/dim checkpatch d5a8081b7a2695cbbd42b6e67c25104c1b86d23b drm-intel
2a3cb23bca20 drm/xe: Enlarge the invalidation timeout from 150 to 500
-:7: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#7: 
"[   31.004009] xe 0000:03:00.0: [drm] ERROR GT0: Global invalidation timeout"

total: 0 errors, 1 warnings, 0 checks, 8 lines checked



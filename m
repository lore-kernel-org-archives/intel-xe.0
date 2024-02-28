Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FDDAC5478C
	for <intel-xe@archiver.kernel.org>; Wed, 28 Feb 2024 01:16:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02B4F10E690;
	Wed, 28 Feb 2024 01:16:49 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13E7610E690;
 Wed, 28 Feb 2024 01:16:48 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Support/debug_for_slow_Gu?=
 =?utf-8?q?C_loads?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: john.c.harrison@intel.com
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 28 Feb 2024 01:16:48 -0000
Message-ID: <170908300808.351698.11334917323404641174@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240228011002.2454419-1-John.C.Harrison@Intel.com>
In-Reply-To: <20240228011002.2454419-1-John.C.Harrison@Intel.com>
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

Series: Support/debug for slow GuC loads
URL   : https://patchwork.freedesktop.org/series/130466/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
9ab59fc4b7cb7663906ac4471a262434aef57f03
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 9766589040c51a614be46c72b52011b98265b74d
Author: John Harrison <John.C.Harrison@Intel.com>
Date:   Tue Feb 27 17:09:56 2024 -0800

    drm/xe/guc: Port over the slow GuC loading support from i915
    
    GuC loading can take longer than it is supposed to for various
    reasons. So add in the code to cope with that and to report it when it
    happens. There are also many different reasons why GuC loading can
    fail, so add in the code for checking for those and for reporting
    issues in a meaningful manner rather than just hitting a timeout and
    saying 'fail: status = %x'.
    
    Also, remove the 'FIXME' comment about an i915 bug that has never been
    applicable to Xe!
    
    v2: Actually report the requested and granted frequencies rather than
    showing granted twice (review feedback from Badal).
    v3: Locally code all the timeout and end condition handling because a
    helper function is not allowed (review feedback from Lucas/Rodrigo).
    
    Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
+ /mt/dim checkpatch 0d7a78693be62a8d1cd311376815b89b18de8204 drm-intel
743423c2e1a8 drm/xe: Make read_perf_limit_reasons globally accessible
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:51: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#51: 
rename from drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c

total: 0 errors, 1 warnings, 0 checks, 143 lines checked
9766589040c5 drm/xe/guc: Port over the slow GuC loading support from i915



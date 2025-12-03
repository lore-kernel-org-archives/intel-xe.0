Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 398B1D1268E
	for <intel-xe@archiver.kernel.org>; Wed,  3 Dec 2025 02:01:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEB8D10E051;
	Wed,  3 Dec 2025 02:01:34 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6070210E051;
 Wed,  3 Dec 2025 02:01:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Do_not_referenc?=
 =?utf-8?q?e_loop_variable_directly?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 03 Dec 2025 02:01:34 -0000
Message-ID: <176472729438.52372.12671996852423104037@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251203011809.968893-1-matthew.brost@intel.com>
In-Reply-To: <20251203011809.968893-1-matthew.brost@intel.com>
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

Series: drm/xe: Do not reference loop variable directly
URL   : https://patchwork.freedesktop.org/series/158411/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
2de9a3901bc28757c7906b454717b64e2a214021
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 6c3160d0a24f98ceb31b8acafef37c2826cc1d50
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Tue Dec 2 17:18:09 2025 -0800

    drm/xe: Do not reference loop variable directly
    
    Do not reference the loop variable job after the loop has exited.
    Instead, save the job from the last iteration of the loop.
    
    Fixes: 3d98a7164da6 ("drm/xe/vf: Start re-emission from first unsignaled job during VF migration")
    Reported-by: kernel test robot <lkp@intel.com>
    Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 278f5507f31b5bb220ab6dca4b48a1cdff5147f5 drm-intel
6c3160d0a24f drm/xe: Do not reference loop variable directly
-:10: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: with a URL to the report
#10: 
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>

-:11: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: with a URL to the report
#11: 
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>

total: 0 errors, 2 warnings, 0 checks, 13 lines checked



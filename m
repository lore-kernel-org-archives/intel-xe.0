Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71214D2127C
	for <intel-xe@archiver.kernel.org>; Thu, 17 Oct 2024 11:15:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 399C510E316;
	Thu, 17 Oct 2024 11:15:48 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E74610E316;
 Thu, 17 Oct 2024 11:15:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Workaround_to_handle_G2H_?=
 =?utf-8?q?timeout_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Badal Nilawar" <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 17 Oct 2024 11:15:47 -0000
Message-ID: <172916374712.1278402.7012173421574433722@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241017111410.2553784-1-badal.nilawar@intel.com>
In-Reply-To: <20241017111410.2553784-1-badal.nilawar@intel.com>
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

Series: Workaround to handle G2H timeout (rev2)
URL   : https://patchwork.freedesktop.org/series/140056/
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
commit 79103aa49c7ace52dfd32fa4f5d40ee8983a21b9
Author: Badal Nilawar <badal.nilawar@intel.com>
Date:   Thu Oct 17 16:44:10 2024 +0530

    drm/xe/guc/ct: Flush g2h worker in case of g2h response timeout
    
    In case if g2h worker doesn't get opportunity to within specified
    timeout delay then flush the g2h worker explicitly.
    
    v2:
      - Describe change in the comment and add TODO (Matt B/John H)
      - Add xe_gt_warn on fence done after G2H flush (John H)
    v3:
      - Updated the comment with root cause
      - Clean up xe_gt_warn message (John H)
    
    Closes: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620
    Closes: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2902
    Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: Matthew Auld <matthew.auld@intel.com>
    Cc: John Harrison <John.C.Harrison@Intel.com>
    Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
+ /mt/dim checkpatch 81420006f741f9783adea6ab5620ce54697f1b20 drm-intel
79103aa49c7a drm/xe/guc/ct: Flush g2h worker in case of g2h response timeout



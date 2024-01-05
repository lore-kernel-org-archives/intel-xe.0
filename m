Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25304C3DA6E
	for <intel-xe@archiver.kernel.org>; Fri,  5 Jan 2024 22:05:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6CF810E6AE;
	Fri,  5 Jan 2024 22:05:32 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA15C10E6B2;
 Fri,  5 Jan 2024 22:05:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/selftests=3A_Fix_a?=
 =?utf-8?q?n_error_pointer_dereference_bug?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dan Carpenter" <dan.carpenter@linaro.org>
Date: Fri, 05 Jan 2024 22:05:30 -0000
Message-ID: <170449233089.40937.15360695517668806448@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <5c0db456-2d8a-485f-875d-6408386fcaa5@moroto.mountain>
In-Reply-To: <5c0db456-2d8a-485f-875d-6408386fcaa5@moroto.mountain>
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: drm/xe/selftests: Fix an error pointer dereference bug
URL   : https://patchwork.freedesktop.org/series/128271/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
6030b24c1386b00de8187b5fb987e283a57b372a
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit d553439e06cbe8bade3bead8f42ee3aad03475cc
Author: Dan Carpenter <dan.carpenter@linaro.org>
Date:   Fri Jan 5 15:20:35 2024 +0300

    drm/xe/selftests: Fix an error pointer dereference bug
    
    Check if "bo" is an error pointer before calling xe_bo_lock() on it.
    
    Fixes: d6abc18d6693 ("drm/xe/xe2: Modify xe_bo_test for system memory")
    Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch cca0607b6f6a21bee68c092ed7ad9f3322e54523 drm-intel
d553439e0 drm/xe/selftests: Fix an error pointer dereference bug
-:8: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id 'd6abc18d6693', maybe rebased or not pulled?
#8: 
Fixes: d6abc18d6693 ("drm/xe/xe2: Modify xe_bo_test for system memory")

total: 0 errors, 1 warnings, 0 checks, 16 lines checked



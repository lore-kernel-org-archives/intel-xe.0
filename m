Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDC47C27C6E
	for <intel-xe@archiver.kernel.org>; Fri, 14 Jun 2024 06:42:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5953110EC33;
	Fri, 14 Jun 2024 06:42:31 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1838610EC36;
 Fri, 14 Jun 2024 06:42:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Invert_runnable?=
 =?utf-8?q?=5Fstate_/_pending_enable_check_and_assert_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 14 Jun 2024 06:42:29 -0000
Message-ID: <171834734909.77189.6119740294284127051@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240614061343.2931649-1-matthew.brost@intel.com>
In-Reply-To: <20240614061343.2931649-1-matthew.brost@intel.com>
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

Series: drm/xe: Invert runnable_state / pending enable check and assert (rev2)
URL   : https://patchwork.freedesktop.org/series/134796/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
51ce9f6cd981d42d7467409d7dbc559a450abc1e
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit bbe422fbef7e83b621398725731269847b4001c6
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Thu Jun 13 23:13:43 2024 -0700

    drm/xe: Invert runnable_state / pending enable check and assert
    
    Rather than checking for pending enable and asserting runnable_state ==
    1 in sched done handler, invert these. This is more robust code taking
    action based on the G2H message and asserting KMD tracking state is
    correct.
    
    Suggested-by: John Harrison <John.C.Harrison@Intel.com>
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
    Reviewed-by: John Harrison <John.C.Harrison@Intel.com>
+ /mt/dim checkpatch a88e8dc2c59464cac89137471031d736a408652f drm-intel
bbe422fbef7e drm/xe: Invert runnable_state / pending enable check and assert



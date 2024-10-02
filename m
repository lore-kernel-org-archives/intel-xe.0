Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BF66CF8548
	for <intel-xe@archiver.kernel.org>; Wed,  2 Oct 2024 23:13:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39C8B10E1E5;
	Wed,  2 Oct 2024 23:13:07 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 856CB10E1E5;
 Wed,  2 Oct 2024 23:13:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Make_wedged=5Fm?=
 =?utf-8?q?ode_debugfs_writable?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 02 Oct 2024 23:13:06 -0000
Message-ID: <172791078654.1165582.6102711960461845910@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241002230620.1249258-2-matthew.d.roper@intel.com>
In-Reply-To: <20241002230620.1249258-2-matthew.d.roper@intel.com>
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

Series: drm/xe: Make wedged_mode debugfs writable
URL   : https://patchwork.freedesktop.org/series/139452/
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
commit 37be0119838c5ebb32256669088ae57122e509c9
Author: Matt Roper <matthew.d.roper@intel.com>
Date:   Wed Oct 2 16:06:21 2024 -0700

    drm/xe: Make wedged_mode debugfs writable
    
    The intent of this debugfs entry is to allow modification of wedging
    behavior, either from IGT tests or during manual debug; it should be
    marked as writable to properly reflect this.  In practice this hasn't
    caused a problem because we always access wedged_mode as root, which
    ignores file permissions, but it's still misleading to have the entry
    incorrectly marked as RO.
    
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Fixes: 6b8ef44cc0a9 ("drm/xe: Introduce the wedged_mode debugfs")
    Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
+ /mt/dim checkpatch 789d5631453c3edad1988cd47db1643555e52ac9 drm-intel
37be0119838c drm/xe: Make wedged_mode debugfs writable



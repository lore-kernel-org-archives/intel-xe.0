Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91DDCD637A3
	for <intel-xe@archiver.kernel.org>; Wed, 13 Nov 2024 17:37:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D84510E111;
	Wed, 13 Nov 2024 17:37:46 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70A4B10E111;
 Wed, 13 Nov 2024 17:37:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/tests=3A_Limit_pur?=
 =?utf-8?q?geable_size_for_faster_execution?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nirmoy Das" <nirmoy.das@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 13 Nov 2024 17:37:45 -0000
Message-ID: <173151946545.3666420.16503824229502894528@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241113150228.2337530-1-nirmoy.das@intel.com>
In-Reply-To: <20241113150228.2337530-1-nirmoy.das@intel.com>
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

Series: drm/xe/tests: Limit purgeable size for faster execution
URL   : https://patchwork.freedesktop.org/series/141303/
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
commit 1fe38374e4cd3a526854bd660ad78518d8632eb5
Author: Nirmoy Das <nirmoy.das@intel.com>
Date:   Wed Nov 13 16:02:28 2024 +0100

    drm/xe/tests: Limit purgeable size for faster execution
    
    xe_bo_shrink_kunit takes a while to run on some machines depending
    on swap storage speed and ram size. Limit purgeable size to 2GB
    so xe_bo_shrink_kunit can execute much faster.
    
    Cc: Matthew Auld <matthew.auld@intel.com>
    Suggested-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2998
    Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
+ /mt/dim checkpatch 169c7cd31a373ed31054abb423981856eb5fb119 drm-intel
1fe38374e4cd drm/xe/tests: Limit purgeable size for faster execution



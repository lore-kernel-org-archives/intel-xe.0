Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F057C0218F
	for <intel-xe@archiver.kernel.org>; Fri, 31 Jan 2025 22:37:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5483E10E226;
	Fri, 31 Jan 2025 22:37:53 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F26EA10E226;
 Fri, 31 Jan 2025 22:37:51 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Cleanup_error_handling_on?=
 =?utf-8?q?_probe?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 31 Jan 2025 22:37:51 -0000
Message-ID: <173836307198.3314806.17127574170358758161@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250131223140.4144292-1-lucas.demarchi@intel.com>
In-Reply-To: <20250131223140.4144292-1-lucas.demarchi@intel.com>
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

Series: Cleanup error handling on probe
URL   : https://patchwork.freedesktop.org/series/144211/
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
commit 07f33f2f241e67af8002737007a96611fdde99a8
Author: Lucas De Marchi <lucas.demarchi@intel.com>
Date:   Fri Jan 31 14:31:40 2025 -0800

    drm/xe: Move oa fini to xe_oa
    
    Like done with other functions, cleanup the error handling in
    xe_device_probe() by moving the OA fini to be handled by xe_oa.
    
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch 01f54d1da1ffffff78047186f62b5916dfd43939 drm-intel
86bf869043b1 drm/xe: Fix xe_display_fini() calls
b83328b89fe0 drm/xe: Fix error handling in xe_irq_install()
6cc369e5bfd4 drm/xe: Fix xe_tile_init_noalloc() error propagation
91555e25675e drm/xe: Stop ignoring errors from xe_ttm_stolen_mgr_init()
d836a6d9f217 drm/xe: Cleanup unwind of gt initialization
a85f85930478 drm/xe: Cleanup extra calls to xe_hw_fence_irq_finish()
07f33f2f241e drm/xe: Move oa fini to xe_oa



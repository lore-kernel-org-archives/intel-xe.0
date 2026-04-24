Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20105FED3C1
	for <intel-xe@archiver.kernel.org>; Fri, 24 Apr 2026 12:41:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBACB10F588;
	Fri, 24 Apr 2026 12:41:23 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63E6010F576;
 Fri, 24 Apr 2026 12:41:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_vfio/xe=3A_avoid_duplicat?=
 =?utf-8?q?e_reset_in_xe=5Fvfio=5Fpci=5Freset=5Fdone?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: zhaoguohan@kylinos.cn
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 24 Apr 2026 12:41:22 -0000
Message-ID: <177703448240.7267.14990478717221516125@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260424091719.58800-1-zhaoguohan@kylinos.cn>
In-Reply-To: <20260424091719.58800-1-zhaoguohan@kylinos.cn>
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

Series: vfio/xe: avoid duplicate reset in xe_vfio_pci_reset_done
URL   : https://patchwork.freedesktop.org/series/165429/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
1f57ba1afceae32108bd24770069f764d940a0e4
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 80d86e1667b8ef7ba7538b1099faec56a2ce66e4
Author: GuoHan Zhao <zhaoguohan@kylinos.cn>
Date:   Fri Apr 24 17:17:19 2026 +0800

    vfio/xe: avoid duplicate reset in xe_vfio_pci_reset_done
    
    xe_vfio_pci_reset_done() sets deferred_reset and, when it manages to
    acquire state_mutex itself, hands the cleanup off to
    xe_vfio_pci_state_mutex_unlock().
    
    That helper already clears deferred_reset and runs xe_vfio_pci_reset()
    before dropping the mutex. Calling xe_vfio_pci_reset() again right
    afterwards repeats the reset handling unnecessarily.
    
    Fixes: 1b81ed612e12 ("vfio/xe: Reorganize the init to decouple migration from reset")
    Signed-off-by: GuoHan Zhao <zhaoguohan@kylinos.cn>
+ /mt/dim checkpatch 15ccea1aede9d776f85ed002cf0df3c8ea8bd81e drm-intel
80d86e1667b8 vfio/xe: avoid duplicate reset in xe_vfio_pci_reset_done
-:14: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '1b81ed612e12', maybe rebased or not pulled?
#14: 
Fixes: 1b81ed612e12 ("vfio/xe: Reorganize the init to decouple migration from reset")

total: 0 errors, 1 warnings, 0 checks, 8 lines checked



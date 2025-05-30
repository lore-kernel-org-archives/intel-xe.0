Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC811C5B549
	for <intel-xe@archiver.kernel.org>; Fri, 30 May 2025 10:22:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5D4A10E7E6;
	Fri, 30 May 2025 10:22:17 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D8ED10E7E6;
 Fri, 30 May 2025 10:22:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_remove_unmatche?=
 =?utf-8?q?d_xe=5Fvm=5Funlock=28=29_from_=5F=5Fxe=5Fexec=5Fqueue=5Finit=28?=
 =?utf-8?q?=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maciej Patelczyk" <maciej.patelczyk@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 30 May 2025 10:22:16 -0000
Message-ID: <174860053645.34794.6367624792736210404@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250530084856.2612849-1-maciej.patelczyk@intel.com>
In-Reply-To: <20250530084856.2612849-1-maciej.patelczyk@intel.com>
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

Series: drm/xe: remove unmatched xe_vm_unlock() from __xe_exec_queue_init()
URL   : https://patchwork.freedesktop.org/series/149690/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
202708c00696422fd217223bb679a353a5936e23
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 118aa626793c9d9b8bfde1e6f0532882dda18a50
Author: Maciej Patelczyk <maciej.patelczyk@intel.com>
Date:   Fri May 30 10:48:56 2025 +0200

    drm/xe: remove unmatched xe_vm_unlock() from __xe_exec_queue_init()
    
    There is unmatched xe_vm_unlock() in the __xe_exec_queue_init().
    Leftover from fbeaad071a98 ("drm/xe: Create LRC BO without VM")
    
    Fixes: fbeaad071a98 ("drm/xe: Create LRC BO without VM")
    Signed-off-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
+ /mt/dim checkpatch 5ee21c4d445a914860e59678f036866f80ebade4 drm-intel
118aa626793c drm/xe: remove unmatched xe_vm_unlock() from __xe_exec_queue_init()
-:8: ERROR:GIT_COMMIT_ID: Please use git commit description style 'commit <12+ chars of sha1> ("<title line>")' - ie: 'commit fbeaad071a98 ("drm/xe: Create LRC BO without VM")'
#8: 
Leftover from fbeaad071a98 ("drm/xe: Create LRC BO without VM")

total: 1 errors, 0 warnings, 0 checks, 24 lines checked



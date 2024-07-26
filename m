Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DD78C3DA49
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jul 2024 00:10:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1807D10E8EB;
	Fri, 26 Jul 2024 00:10:09 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC17A10E8EA;
 Fri, 26 Jul 2024 00:10:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Take_ref_to_VM_?=
 =?utf-8?q?in_delayed_snapshot?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 26 Jul 2024 00:10:07 -0000
Message-ID: <172195260782.384338.11493048737692219501@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240725232414.1958243-1-matthew.brost@intel.com>
In-Reply-To: <20240725232414.1958243-1-matthew.brost@intel.com>
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

Series: drm/xe: Take ref to VM in delayed snapshot
URL   : https://patchwork.freedesktop.org/series/136541/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
5ce3e132caaa5b45e5e50201b574a097d130967c
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit b21742e580371346e83400186dc4d90022ec6cc2
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Thu Jul 25 16:24:14 2024 -0700

    drm/xe: Take ref to VM in delayed snapshot
    
    Kernel BO's don't take a ref to the VM, we need to the VM for the
    delayed snapshot, so take a ref to the VM in delayed snapshot.
    
    47058633d9c5 ("drm/xe: Move lrc snapshot capturing to xe_lrc.c")
    Cc: Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 6be9597893e018572d7d12dfb12cc19f68caa1e3 drm-intel
b21742e58037 drm/xe: Take ref to VM in delayed snapshot
-:9: ERROR:GIT_COMMIT_ID: Please use git commit description style 'commit <12+ chars of sha1> ("<title line>")' - ie: 'commit 47058633d9c5 ("drm/xe: Move lrc snapshot capturing to xe_lrc.c")'
#9: 
47058633d9c5 ("drm/xe: Move lrc snapshot capturing to xe_lrc.c")

total: 1 errors, 0 warnings, 0 checks, 29 lines checked



Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3BFAD2AB15
	for <intel-xe@archiver.kernel.org>; Tue, 29 Oct 2024 20:57:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8048D10E3AE;
	Tue, 29 Oct 2024 20:57:41 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86B5810E3AE;
 Tue, 29 Oct 2024 20:57:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/vf=3A_Post-migrati?=
 =?utf-8?q?on_recovery_worker_basis_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tomasz Lis" <tomasz.lis@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 29 Oct 2024 20:57:40 -0000
Message-ID: <173023546054.1361174.4759128677421107351@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241029193956.1043614-1-tomasz.lis@intel.com>
In-Reply-To: <20241029193956.1043614-1-tomasz.lis@intel.com>
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

Series: drm/xe/vf: Post-migration recovery worker basis (rev5)
URL   : https://patchwork.freedesktop.org/series/138935/
State : warning

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
commit 40cda9cd86cd4422df3139e686cb14ff2207e933
Author: Tomasz Lis <tomasz.lis@intel.com>
Date:   Tue Oct 29 20:39:56 2024 +0100

    drm/xe/vf: Defer fixups if migrated twice fast
    
    If another VF migration happened during post-migration recovery,
    then the current worker should be finished to allow the next
    one start swiftly and cleanly.
    
    Check for defer in two places: before fixups, and before
    sending RESFIX_DONE.
    
    Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
+ /mt/dim checkpatch 91b5d7af697c6765039b8700127c1740da858065 drm-intel
cd8057655cb0 drm/xe/vf: React to MIGRATED interrupt
-:215: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#215: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 225 lines checked
601f20343df0 drm/xe/vf: Document SRIOV VF restore flow
9f02a79d260b drm/xe/vf: Send RESFIX_DONE message at end of VF restore
5e9cbed01ea5 drm/xe/vf: Start post-migration fixups with provisinoning query
40cda9cd86cd drm/xe/vf: Defer fixups if migrated twice fast



Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01249C3DA63
	for <intel-xe@archiver.kernel.org>; Tue, 23 Jul 2024 15:16:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF03D10E5F5;
	Tue, 23 Jul 2024 15:16:15 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7479B10E5F5;
 Tue, 23 Jul 2024 15:16:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Store_process_n?=
 =?utf-8?q?ame_and_pid_in_xe_file?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 23 Jul 2024 15:16:13 -0000
Message-ID: <172174777347.360194.1578232548716383455@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240723151045.1725417-1-matthew.brost@intel.com>
In-Reply-To: <20240723151045.1725417-1-matthew.brost@intel.com>
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

Series: drm/xe: Store process name and pid in xe file
URL   : https://patchwork.freedesktop.org/series/136390/
State : success

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
commit d603a261063b7dbec3fdb1928ec3166c324fcbc2
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Tue Jul 23 08:10:45 2024 -0700

    drm/xe: Store process name and pid in xe file
    
    An xe file can outlive the associated process as the GPU cleanup is just
    triggered upon file close (process kill) and completes sometime later.
    If the file close triggers error conditions (GPU hangs) the process
    cannot be safely referenced to retrieve the name and pid for debug
    information. Store the process name and pid directly in the xe file to
    be safe.
    
    v2:
     - Access file->pid via rcu_access_pointer (Matthew Auld)
    
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
    Reviewed-by: Matthew Auld <matthew.auld@intel.com>
+ /mt/dim checkpatch 049eae5224ed92f3cb723a492593b255654e0649 drm-intel
d603a261063b drm/xe: Store process name and pid in xe file



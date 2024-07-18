Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9E35C3DA61
	for <intel-xe@archiver.kernel.org>; Thu, 18 Jul 2024 23:22:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B712710EAAB;
	Thu, 18 Jul 2024 23:22:05 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B375910EAAB;
 Thu, 18 Jul 2024 23:22:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Have_xe=5Fvm_and_xe=5Fexe?=
 =?utf-8?q?c=5Fqueue_take_references_to_xef_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Umesh Nerlige Ramappa" <umesh.nerlige.ramappa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 18 Jul 2024 23:22:04 -0000
Message-ID: <172134492473.287349.9180090896986923842@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240718210548.3580382-1-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20240718210548.3580382-1-umesh.nerlige.ramappa@intel.com>
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

Series: Have xe_vm and xe_exec_queue take references to xef (rev4)
URL   : https://patchwork.freedesktop.org/series/135865/
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
commit 4eb765c5f2b7311a5afd7ffc9c1c7b55703ff66f
Author: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Date:   Thu Jul 18 14:05:48 2024 -0700

    drm/xe: Fix use after free when client stats are captured
    
    xe_file_close triggers an asynchronous queue cleanup and then frees up
    the xef object. Since queue cleanup flushes all pending jobs and the KMD
    stores client usage stats into the xef object after jobs are flushed, we
    see a use-after-free for the xef object. Resolve this by taking a
    reference to xef from xe_exec_queue.
    
    While at it, revert an earlier change that contained a partial work
    around for this issue.
    
    v2:
    - Take a ref to xef even for the VM bind queue (Matt)
    - Squash patches relevant to that fix and work around (Lucas)
    
    v3: Fix typo (Lucas)
    
    Fixes: ce62827bc294 ("drm/xe: Do not access xe file when updating exec queue run_ticks")
    Fixes: 6109f24f87d7 ("drm/xe: Add helper to accumulate exec queue runtime")
    Closes: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1908
    Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>
    Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch fb36109fa177ba6292b97812b973482491cd1fda drm-intel
fe28ed3f4c28 drm/xe: Move part of xe_file cleanup to a helper
0c5481119c96 drm/xe: Add ref counting for xe_file
2026aa361621 drm/xe: Take a ref to xe file when user creates a VM
4eb765c5f2b7 drm/xe: Fix use after free when client stats are captured



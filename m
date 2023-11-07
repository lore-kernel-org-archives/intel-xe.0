Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAAEFC4332F
	for <intel-xe@archiver.kernel.org>; Tue,  7 Nov 2023 16:19:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9497F10E0AB;
	Tue,  7 Nov 2023 16:19:52 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id BA13410E0AB;
 Tue,  7 Nov 2023 16:19:49 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id B82EBA7DFF;
 Tue,  7 Nov 2023 16:19:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Date: Tue, 07 Nov 2023 16:19:49 -0000
Message-ID: <169937398975.21166.1839469541315158162@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231107161623.135419-1-matthew.brost@intel.com>
In-Reply-To: <20231107161623.135419-1-matthew.brost@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_xe?=
 =?utf-8?q?=5Fguc=5Fsubmit_style_cleanups?=
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: xe_guc_submit style cleanups
URL   : https://patchwork.freedesktop.org/series/126081/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
63c2b6b160bca2df6efc7bc4cea6f442097d7854
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 443562039aa8e6daa3d10db2508088de12e07585
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Tue Nov 7 08:16:23 2023 -0800

    drm/xe: Replace engine references with exec queue in xe_guc_submit.c
    
    Exec queue has replaced engine nomenclature.
    
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 17fc56818e8b2dd1311fa2b7716f3675db59bdb7 drm-intel
d93560f30 drm/xe: s/ENGINE_STATE_ENABLED/EXEC_QUEUE_STATE_ENABLED
ee19deb14 drm/xe: s/ENGINE_STATE_SUSPENDED/EXEC_QUEUE_STATE_SUSPENDED
f4f4d557f drm/xe: s/ENGINE_STATE_KILLED/EXEC_QUEUE_STATE_KILLED
a2571f363 drm/xe: Fix alignment in GuC exec queue state defines
-:6: WARNING:TYPO_SPELLING: 'aligment' may be misspelled - perhaps 'alignment'?
#6: 
Normalize the aligment for readability.
              ^^^^^^^^

total: 0 errors, 1 warnings, 0 checks, 13 lines checked
443562039 drm/xe: Replace engine references with exec queue in xe_guc_submit.c



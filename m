Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5229DE909A5
	for <intel-xe@archiver.kernel.org>; Tue, 17 Feb 2026 13:56:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED39710E20E;
	Tue, 17 Feb 2026 13:56:52 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6488510E20E;
 Tue, 17 Feb 2026 13:56:51 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Fix_fs=5Freclaim_deadlock?=
 =?utf-8?q?_caused_by_CCS_save/restore_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Satyanarayana K V P" <satyanarayana.k.v.p@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 17 Feb 2026 13:56:51 -0000
Message-ID: <177133661139.258851.2988559563829959530@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260217120745.1074232-5-satyanarayana.k.v.p@intel.com>
In-Reply-To: <20260217120745.1074232-5-satyanarayana.k.v.p@intel.com>
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

Series: Fix fs_reclaim deadlock caused by CCS save/restore (rev5)
URL   : https://patchwork.freedesktop.org/series/160841/
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
commit c26319d55188b536dcc04e30bf398df30f4377b6
Author: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Date:   Tue Feb 17 12:07:49 2026 +0000

    drm/xe/sa: Add lockdep annotations for SA manager swap_guard
    
    Annotate the SA manager init path to model taking swap_guard while under
    reclaim context. This helps lockdep catch potential circular dependencies
    between fs_reclaim and swap_guard in debug builds. Without this annotation,
    lockdep is unaware of this chain until the shrinker runs.
    
    Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
    Suggested-by: Matthew Brost <matthew.brost@intel.com>
    Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Cc: Matthew Auld <matthew.auld@intel.com>
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>
    Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
+ /mt/dim checkpatch 29942dc4e7d82b945c6c424bbb8af6ff572e235c drm-intel
4ebb94892b66 drm/sa: Split drm_suballoc_new() into SA alloc and init helpers
9f33e97d6a5e drm/xe/vf: Fix fs_reclaim warning with CCS save/restore BB allocation
-:43: WARNING:BAD_SIGN_OFF: Duplicate signature
#43: 
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

total: 0 errors, 1 warnings, 0 checks, 289 lines checked
c26319d55188 drm/xe/sa: Add lockdep annotations for SA manager swap_guard



Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8752DC761AF
	for <intel-xe@archiver.kernel.org>; Wed,  5 Apr 2023 17:10:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AE5010EA1F;
	Wed,  5 Apr 2023 17:10:27 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 48F6110EA2F;
 Wed,  5 Apr 2023 17:10:25 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 412B4A9932;
 Wed,  5 Apr 2023 17:10:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Chang, Bruce" <yu.bruce.chang@intel.com>
Date: Wed, 05 Apr 2023 17:10:25 -0000
Message-ID: <168071462526.14696.5553864118282149407@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230405170815.524853-1-yu.bruce.chang@intel.com>
In-Reply-To: <20230405170815.524853-1-yu.bruce.chang@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_f?=
 =?utf-8?q?or_drm/xe=3A_follow_up_on_the_patch_to_fix_pvc_unload_issue?=
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

Series: drm/xe: follow up on the patch to fix pvc unload issue
URL   : https://patchwork.freedesktop.org/series/116164/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
commit acfd6dbdcdf8f27d6357580683de8fce9222d2f3
Author:     Matthew Brost <matthew.brost@intel.com>
AuthorDate: Tue Apr 4 21:15:59 2023 -0700
Commit:     Matthew Brost <matthew.brost@intel.com>
CommitDate: Wed Apr 5 08:46:04 2023 -0700

    drm/xe: Use Xe BO pin / unpin functions for FB pin
    
    Need to use XE BO pin / unpin for suspend / resume to work properly.
    Part this fix too is too allow xe_bo_pin to be called more than once.
    
    v2:
      - (Matthew Auld) fixup unpin
    
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
    Reviewed-by: Matthew Auld <matthew.auld@intel.com>
=== git am output follows ===
Applying: drm/xe: follow up on the patch to fix pvc unload issue



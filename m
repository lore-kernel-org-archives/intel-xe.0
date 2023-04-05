Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBBBBC761A6
	for <intel-xe@archiver.kernel.org>; Wed,  5 Apr 2023 23:38:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96BE210EA78;
	Wed,  5 Apr 2023 23:38:08 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6A2EC10EA78;
 Wed,  5 Apr 2023 23:38:06 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 6611BAADDC;
 Wed,  5 Apr 2023 23:38:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Date: Wed, 05 Apr 2023 23:38:06 -0000
Message-ID: <168073788641.14699.2092197149416095805@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230405233403.151088-1-matthew.brost@intel.com>
In-Reply-To: <20230405233403.151088-1-matthew.brost@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_f?=
 =?utf-8?q?or_Try_to_fix_driver_load_=28again=29?=
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

Series: Try to fix driver load (again)
URL   : https://patchwork.freedesktop.org/series/116171/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
commit aac9fabff09f2b27ddfe61fe47350557def28cff
Author:     Matthew Brost <matthew.brost@intel.com>
AuthorDate: Wed Apr 5 16:18:18 2023 -0700
Commit:     Matthew Brost <matthew.brost@intel.com>
CommitDate: Wed Apr 5 16:18:18 2023 -0700

    Revert "drm/xe: Use Xe BO pin / unpin functions for FB pin"
    
    This reverts commit acfd6dbdcdf8f27d6357580683de8fce9222d2f3.
=== git am output follows ===
Applying: drm/xe: Always write GEN12_RCU_MODE.GEN12_RCU_MODE_CCS_ENABLE for CCS engines
Applying: drm/xe: Drop coalescing of GGTT invalidations



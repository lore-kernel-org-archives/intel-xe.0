Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6468BC74A5B
	for <intel-xe@archiver.kernel.org>; Tue, 21 Mar 2023 11:46:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A8EB10E736;
	Tue, 21 Mar 2023 11:46:35 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5857810E736;
 Tue, 21 Mar 2023 11:46:33 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 4882DAADD6;
 Tue, 21 Mar 2023 11:46:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Date: Tue, 21 Mar 2023 11:46:33 -0000
Message-ID: <167939919327.18676.13505418474691408461@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230321114407.169334-1-matthew.auld@intel.com>
In-Reply-To: <20230321114407.169334-1-matthew.auld@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_f?=
 =?utf-8?q?or_Some_small-bar_prep_patches_=28rev8=29?=
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

Series: Some small-bar prep patches (rev8)
URL   : https://patchwork.freedesktop.org/series/114521/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
commit 561a3604029e464bfd9aa6d5e55abea160800bae
Author:     Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
AuthorDate: Fri Mar 17 21:05:31 2023 +0530
Commit:     Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
CommitDate: Mon Mar 20 22:20:17 2023 +0530

    drm/xe: Skip XY_FAST_COLOR instruction on link copy engines
    
    Link copy engines doesn't support the XY_FAST_COLOR instruction.
    Currently this instruction is used only at one place to clear a ttm
    resource while migrating a BO.
    A new device_info member is created to know if a platform has link copy
    engine. If it supports, then instead of using XY_FAST_COLOR instruction,
    MEM_SET is used which is available both in main and link copy engines.
    
    BSpec: 68433
    
    Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
    Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
=== git am output follows ===
Applying: drm/xe/buddy: add visible tracking
Applying: drm/xe/buddy: add compatible and intersects hooks



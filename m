Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44F1CC76196
	for <intel-xe@archiver.kernel.org>; Fri,  7 Apr 2023 21:15:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01A2710EE4A;
	Fri,  7 Apr 2023 21:15:31 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 16F5510E039;
 Fri,  7 Apr 2023 21:15:29 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id E6FF7A47DF;
 Fri,  7 Apr 2023 21:15:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Niranjana Vishwanathapura" <niranjana.vishwanathapura@intel.com>
Date: Fri, 07 Apr 2023 21:15:28 -0000
Message-ID: <168090212891.5207.4018042915635415963@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230407211231.10137-1-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20230407211231.10137-1-niranjana.vishwanathapura@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_f?=
 =?utf-8?q?or_drm/xe=3A_Fix_memory_use_after_free?=
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

Series: drm/xe: Fix memory use after free
URL   : https://patchwork.freedesktop.org/series/116235/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
commit 3e6b51c6d857704f98d9186d46bc6c7ab2656151
Author:     Matthew Auld <matthew.auld@intel.com>
AuthorDate: Thu Apr 6 16:18:45 2023 +0100
Commit:     Rodrigo Vivi <rodrigo.vivi@intel.com>
CommitDate: Fri Apr 7 12:32:43 2023 -0400

    drm/xe: fix suspend-resume for dgfx
    
    This stopped working now that TTM treats moving a pinned object through
    ttm_bo_validate() as an error, for the general case. Add some new
    routines to handle the new special casing needed for suspend-resume.
    
    Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/244
    Signed-off-by: Matthew Auld <matthew.auld@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Tested-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
=== git am output follows ===
Applying: drm/xe: Fix memory use after free



Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26AADC76188
	for <intel-xe@archiver.kernel.org>; Mon,  3 Apr 2023 18:53:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC7FE10E0AD;
	Mon,  3 Apr 2023 18:53:34 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id D55B910E06A;
 Mon,  3 Apr 2023 18:53:32 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id CE6E3AADDD;
 Mon,  3 Apr 2023 18:53:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Souza, Jose" <jose.souza@intel.com>
Date: Mon, 03 Apr 2023 18:53:32 -0000
Message-ID: <168054801281.24311.2188558149796237381@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230403180614.197711-1-jose.souza@intel.com>
In-Reply-To: <20230403180614.197711-1-jose.souza@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_f?=
 =?utf-8?q?or_series_starting_with_=5Bv2=2C1/6=5D_drm/i915=3A_Nuke_unused_?=
 =?utf-8?q?dsparb=5Flock?=
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

Series: series starting with [v2,1/6] drm/i915: Nuke unused dsparb_lock
URL   : https://patchwork.freedesktop.org/series/116039/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
commit cbee780e81e4564f73bd4e945d0a8d2e19ae36b7
Author:     Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
AuthorDate: Fri Mar 31 16:52:50 2023 +0000
Commit:     Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CommitDate: Mon Apr 3 10:53:40 2023 -0700

    drm/xe: Use proper vram offset
    
    In xe_migrate functions, use proper vram io offset of the
    tiles while calculating addresses.
    
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>
    Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
=== git am output follows ===
Applying: drm/i915: Nuke unused dsparb_lock
Applying: drm/i915: Initialize dkl_phy spin lock from display code path
Applying: drm/i915: Only initialize dlk phy lock in display 12 and newer
Applying: drm/xe/display: Enable modular fia in TGL
Applying: drm/xe/display: Disable PSR HW tracking for DG2 and MTL
Applying: drm/xe: Enable Raptorlake-P



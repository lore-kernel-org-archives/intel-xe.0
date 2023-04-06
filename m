Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5F8DC7618D
	for <intel-xe@archiver.kernel.org>; Thu,  6 Apr 2023 14:36:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AA5E10EC08;
	Thu,  6 Apr 2023 14:36:30 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id EFF6C10EC08;
 Thu,  6 Apr 2023 14:36:28 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id D1B24AADE4;
 Thu,  6 Apr 2023 14:36:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>
Date: Thu, 06 Apr 2023 14:36:28 -0000
Message-ID: <168079178882.9558.726028403257982247@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230406143133.29474-1-jose.souza@intel.com>
In-Reply-To: <20230406143133.29474-1-jose.souza@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_f?=
 =?utf-8?q?or_series_starting_with_=5Bv2=2Crebased=2C1/6=5D_drm/i915=3A_Nu?=
 =?utf-8?q?ke_unused_dsparb=5Flock?=
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

Series: series starting with [v2,rebased,1/6] drm/i915: Nuke unused dsparb_lock
URL   : https://patchwork.freedesktop.org/series/116198/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
commit 58e5cc5ff399294871892dfbc06ae7b8597ee67a
Author:     Matthew Brost <matthew.brost@intel.com>
AuthorDate: Wed Apr 5 16:20:03 2023 -0700
Commit:     Matthew Brost <matthew.brost@intel.com>
CommitDate: Wed Apr 5 17:26:51 2023 -0700

    drm/xe: Always write GEN12_RCU_MODE.GEN12_RCU_MODE_CCS_ENABLE for CCS engines
    
    If CCS0 was fused we did not write this register thus CCS engine were
    not enabled resulting in driver load failures.
    
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
    Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
=== git am output follows ===
Applying: drm/i915: Nuke unused dsparb_lock
Applying: drm/i915: Initialize dkl_phy spin lock from display code path
Applying: drm/i915: Only initialize dlk phy lock in display 12 and newer
Applying: drm/xe/display: Enable modular fia in TGL
Applying: drm/xe/display: Disable PSR HW tracking for DG2 and MTL
Applying: drm/xe: Enable Raptorlake-P



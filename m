Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB5C6C54ED1
	for <intel-xe@archiver.kernel.org>; Thu, 22 May 2025 22:14:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B72110E711;
	Thu, 22 May 2025 22:14:12 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D01010E0F7;
 Thu, 22 May 2025 22:14:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_for_Add_debugfs_to_expos?=
 =?utf-8?q?e_G2=2C_G6=2C_G8=2C_G10_and_ModS_residency?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Soham Purkait" <soham.purkait@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 22 May 2025 22:14:11 -0000
Message-ID: <174795205123.15886.2875107603299957682@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250522204937.545284-1-soham.purkait@intel.com>
In-Reply-To: <20250522204937.545284-1-soham.purkait@intel.com>
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

Series: Add debugfs to expose G2, G6, G8, G10 and ModS residency
URL   : https://patchwork.freedesktop.org/series/149406/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 08cbef6f5828 drm-tip: 2025y-05m-22d-17h-04m-07s UTC integration manifest
=== git am output follows ===
.git/rebase-apply/patch:35: trailing whitespace.
{	
.git/rebase-apply/patch:57: trailing whitespace.
	mmio = xe_root_tile_mmio(xe);	
.git/rebase-apply/patch:111: trailing whitespace.
    
error: patch failed: drivers/gpu/drm/xe/xe_debugfs.c:185
error: drivers/gpu/drm/xe/xe_debugfs.c: patch does not apply
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Applying: Utility function and macro for telemetry reading
Applying: drm/xe/xe_debugfs: Exposure of G-State residency counter through debugfs
Patch failed at 0002 drm/xe/xe_debugfs: Exposure of G-State residency counter through debugfs
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".



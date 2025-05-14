Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59FF8C3ABDD
	for <intel-xe@archiver.kernel.org>; Wed, 14 May 2025 21:16:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0A2110E025;
	Wed, 14 May 2025 21:16:02 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB45A10E025;
 Wed, 14 May 2025 21:16:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_for_Add_debugfs_to_expos?=
 =?utf-8?q?e_G8=2C_G10_and_ModS_residency?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Soham Purkait" <soham.purkait@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 14 May 2025 21:16:01 -0000
Message-ID: <174725736175.80824.9241465257729949342@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250514080721.265515-1-soham.purkait@intel.com>
In-Reply-To: <20250514080721.265515-1-soham.purkait@intel.com>
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

Series: Add debugfs to expose G8, G10 and ModS residency
URL   : https://patchwork.freedesktop.org/series/149001/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 3d6670fab64c drm-tip: 2025y-05m-14d-19h-28m-21s UTC integration manifest
=== git am output follows ===
error: patch failed: drivers/gpu/drm/xe/xe_debugfs.c:185
error: drivers/gpu/drm/xe/xe_debugfs.c: patch does not apply
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Applying: Utility function and macro for telemetry reading
Applying: drm/xe/xe_debugfs: Exposure of G8 residency counter
Patch failed at 0002 drm/xe/xe_debugfs: Exposure of G8 residency counter
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".



Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A95E0C35274
	for <intel-xe@archiver.kernel.org>; Fri, 15 Dec 2023 12:57:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DA6B10EA41;
	Fri, 15 Dec 2023 12:57:19 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5E01F10E22E;
 Fri, 15 Dec 2023 12:57:17 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 4AC8CA02F0;
 Fri, 15 Dec 2023 12:57:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_for_drm/xe/migrate=3A_Fi?=
 =?utf-8?q?x_CCS_copy_for_small_VRAM_copy_chunks?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Date: Fri, 15 Dec 2023 12:57:17 -0000
Message-ID: <170264503728.27831.11034488570341219135@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231215125436.41135-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20231215125436.41135-1-thomas.hellstrom@linux.intel.com>
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

Series: drm/xe/migrate: Fix CCS copy for small VRAM copy chunks
URL   : https://patchwork.freedesktop.org/series/127874/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: 6154a8abd drm/xe: Drop some unnecessary header includes
=== git am output follows ===
error: patch failed: drivers/gpu/drm/xe/tests/xe_migrate.c:331
error: drivers/gpu/drm/xe/tests/xe_migrate.c: patch does not apply
error: patch failed: drivers/gpu/drm/xe/xe_migrate.c:411
error: drivers/gpu/drm/xe/xe_migrate.c: patch does not apply
hint: Use 'git am --show-current-patch' to see the failed patch
Applying: drm/xe/migrate: Fix CCS copy for small VRAM copy chunks
Patch failed at 0001 drm/xe/migrate: Fix CCS copy for small VRAM copy chunks
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".



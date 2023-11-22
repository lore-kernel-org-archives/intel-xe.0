Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0371CC61D92
	for <intel-xe@archiver.kernel.org>; Wed, 22 Nov 2023 02:46:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1B1710E2EA;
	Wed, 22 Nov 2023 02:46:01 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id AE5F010E5D1;
 Wed, 22 Nov 2023 02:46:00 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 9FD81AA916;
 Wed, 22 Nov 2023 02:46:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Date: Wed, 22 Nov 2023 02:46:00 -0000
Message-ID: <170062116062.4728.16922937730699494475@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231120221904.695630-1-lucas.demarchi@intel.com>
In-Reply-To: <20231120221904.695630-1-lucas.demarchi@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_f?=
 =?utf-8?q?or_drm/xe=3A_Fix_modpost_warning_on_kunit_modules?=
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

Series: drm/xe: Fix modpost warning on kunit modules
URL   : https://patchwork.freedesktop.org/series/126675/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: 89e2bb1e1 fixup! drm/xe: Moving and renaming existing frequency sysfs attributes
=== git am output follows ===
error: patch failed: drivers/gpu/drm/xe/tests/xe_bo_test.c:22
error: drivers/gpu/drm/xe/tests/xe_bo_test.c: patch does not apply
error: patch failed: drivers/gpu/drm/xe/tests/xe_dma_buf_test.c:21
error: drivers/gpu/drm/xe/tests/xe_dma_buf_test.c: patch does not apply
error: patch failed: drivers/gpu/drm/xe/tests/xe_migrate_test.c:21
error: drivers/gpu/drm/xe/tests/xe_migrate_test.c: patch does not apply
error: patch failed: drivers/gpu/drm/xe/tests/xe_pci_test.c:70
error: drivers/gpu/drm/xe/tests/xe_pci_test.c: patch does not apply
error: patch failed: drivers/gpu/drm/xe/tests/xe_rtp_test.c:313
error: drivers/gpu/drm/xe/tests/xe_rtp_test.c: patch does not apply
error: patch failed: drivers/gpu/drm/xe/tests/xe_wa_test.c:138
error: drivers/gpu/drm/xe/tests/xe_wa_test.c: patch does not apply
hint: Use 'git am --show-current-patch' to see the failed patch
Applying: drm/xe: Fix modpost warning on kunit modules
Patch failed at 0001 drm/xe: Fix modpost warning on kunit modules
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".



Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09363EB64DC
	for <intel-xe@archiver.kernel.org>; Tue, 18 Jul 2023 10:11:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C20ED10E151;
	Tue, 18 Jul 2023 10:11:36 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1869710E151;
 Tue, 18 Jul 2023 10:11:35 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 0E8F0AADE0;
 Tue, 18 Jul 2023 10:11:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Date: Tue, 18 Jul 2023 10:11:35 -0000
Message-ID: <168967509505.22206.3868571476439696456@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230717131643.7-1-francois.dugast@intel.com>
In-Reply-To: <20230717131643.7-1-francois.dugast@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_f?=
 =?utf-8?q?or_drm/xe=3A_switch_to_using_drm=5Fexec_=28rev2=29?=
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

Series: drm/xe: switch to using drm_exec (rev2)
URL   : https://patchwork.freedesktop.org/series/120842/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: a43fd52b7 drm/xe: Cleanup style warnings
=== git am output follows ===
error: patch failed: Documentation/gpu/drm-mm.rst:529
error: Documentation/gpu/drm-mm.rst: patch does not apply
error: patch failed: drivers/gpu/drm/Kconfig:194
error: drivers/gpu/drm/Kconfig: patch does not apply
error: patch failed: drivers/gpu/drm/Makefile:79
error: drivers/gpu/drm/Makefile: patch does not apply
error: drivers/gpu/drm/drm_exec.c: already exists in index
error: include/drm/drm_exec.h: already exists in index
hint: Use 'git am --show-current-patch' to see the failed patch
Applying: drm: execution context for GEM buffers v7
Patch failed at 0001 drm: execution context for GEM buffers v7
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".



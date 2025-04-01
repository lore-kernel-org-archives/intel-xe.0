Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABDAFC36010
	for <intel-xe@archiver.kernel.org>; Tue,  1 Apr 2025 12:25:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 730B710E31A;
	Tue,  1 Apr 2025 12:25:42 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDABF10E31A;
 Tue,  1 Apr 2025 12:25:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_for_hdrtest=3A_hide_the_?=
 =?utf-8?q?disgusting_turds?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 01 Apr 2025 12:25:41 -0000
Message-ID: <174351034177.22413.14605498657948012385@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250401121830.21696-1-jani.nikula@intel.com>
In-Reply-To: <20250401121830.21696-1-jani.nikula@intel.com>
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

Series: hdrtest: hide the disgusting turds
URL   : https://patchwork.freedesktop.org/series/147057/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 9368766ece6c drm-tip: 2025y-04m-01d-08h-58m-05s UTC integration manifest
=== git am output follows ===
error: patch failed: drivers/gpu/drm/Kconfig:489
error: drivers/gpu/drm/Kconfig: patch does not apply
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Applying: drm: place header test files in .hdrtest subdirectories
Applying: drm/xe: place header test files in .hdrtest subdirectories
Applying: drm/i915: place header test files in .hdrtest subdirectories
Applying: kbuild: hdrtest: place header test files in .hdrtest subdirectories
Applying: drm: add config option for extra build-time checks
Patch failed at 0005 drm: add config option for extra build-time checks
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".



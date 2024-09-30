Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBB3DCE835D
	for <intel-xe@archiver.kernel.org>; Mon, 30 Sep 2024 17:26:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DFAC10E56D;
	Mon, 30 Sep 2024 17:26:23 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8768510E56D;
 Mon, 30 Sep 2024 17:26:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_for_Revert_=22drm/i915/p?=
 =?utf-8?q?sr=3A_Implement_WA_to_help_reach_PC10=22_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 30 Sep 2024 17:26:22 -0000
Message-ID: <172771718254.1138078.7764261548148487747@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240930071329.1630583-1-jouni.hogander@intel.com>
In-Reply-To: <20240930071329.1630583-1-jouni.hogander@intel.com>
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

Series: Revert "drm/i915/psr: Implement WA to help reach PC10" (rev2)
URL   : https://patchwork.freedesktop.org/series/139275/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 4e4d7873ac76 drm-tip: 2024y-09m-30d-16h-43m-25s UTC integration manifest
=== git am output follows ===
error: patch failed: drivers/gpu/drm/i915/display/intel_display_types.h:1576
error: drivers/gpu/drm/i915/display/intel_display_types.h: patch does not apply
error: patch failed: drivers/gpu/drm/i915/display/intel_psr.c:26
error: drivers/gpu/drm/i915/display/intel_psr.c: patch does not apply
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Applying: Revert "drm/i915/psr: Implement WA to help reach PC10"
Patch failed at 0001 Revert "drm/i915/psr: Implement WA to help reach PC10"
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".



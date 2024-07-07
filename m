Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 405F2C38150
	for <intel-xe@archiver.kernel.org>; Sun,  7 Jul 2024 22:24:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9DDF10E069;
	Sun,  7 Jul 2024 22:23:59 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B15B10E069;
 Sun,  7 Jul 2024 22:23:59 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_for_drm/xe=3A_Revert_=22?=
 =?utf-8?q?drm/i915=3A_Disable_DSB_in_Xe_KMD=22_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Manna, Animesh" <animesh.manna@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sun, 07 Jul 2024 22:23:59 -0000
Message-ID: <172039103943.49182.2469307775561607222@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240322114214.1501078-1-animesh.manna@intel.com>
In-Reply-To: <20240322114214.1501078-1-animesh.manna@intel.com>
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

Series: drm/xe: Revert "drm/i915: Disable DSB in Xe KMD" (rev3)
URL   : https://patchwork.freedesktop.org/series/131488/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 70f1d41b827f drm-tip: 2024y-07m-07d-18h-38m-49s UTC integration manifest
=== git am output follows ===
error: patch failed: drivers/gpu/drm/i915/display/intel_dsb.c:468
error: drivers/gpu/drm/i915/display/intel_dsb.c: patch does not apply
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Applying: drm/xe: Revert "drm/i915: Disable DSB in Xe KMD"
Patch failed at 0001 drm/xe: Revert "drm/i915: Disable DSB in Xe KMD"
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".



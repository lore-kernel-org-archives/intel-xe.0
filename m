Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCDB8C282EC
	for <intel-xe@archiver.kernel.org>; Mon, 17 Mar 2025 15:23:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A846B10E0F1;
	Mon, 17 Mar 2025 15:23:45 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABDFB10E0F1;
 Mon, 17 Mar 2025 15:23:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_for_drm/i915/fbc=3A_disa?=
 =?utf-8?q?ble_FBC_if_PSR2_selective_fetch_is_enabled?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinod Govindapillai" <vinod.govindapillai@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 17 Mar 2025 15:23:43 -0000
Message-ID: <174222502370.43665.16256234701694737068@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <20250317150835.30564-1-vinod.govindapillai@intel.com>
In-Reply-To: <20250317150835.30564-1-vinod.govindapillai@intel.com>
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

Series: drm/i915/fbc: disable FBC if PSR2 selective fetch is enabled
URL   : https://patchwork.freedesktop.org/series/146402/
State : failure

== Summary ==

=== Applying kernel patches on branch 'master' with base: ===
Base commit: 695caca9345a Merge tag 'leds-fixes-6.14' of git://git.kernel.org/pub/scm/linux/kernel/git/lee/leds
=== git am output follows ===
error: patch failed: drivers/gpu/drm/i915/display/intel_fbc.c:1463
error: drivers/gpu/drm/i915/display/intel_fbc.c: patch does not apply
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Applying: drm/i915/fbc: disable FBC if PSR2 selective fetch is enabled
Patch failed at 0001 drm/i915/fbc: disable FBC if PSR2 selective fetch is enabled
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".



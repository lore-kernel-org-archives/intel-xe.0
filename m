Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DCB7C54E58
	for <intel-xe@archiver.kernel.org>; Wed, 13 Mar 2024 08:52:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FFF910E5F3;
	Wed, 13 Mar 2024 08:52:36 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC46210E5F3;
 Wed, 13 Mar 2024 08:52:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_for_drm/i915=3A_add_inte?=
 =?utf-8?q?l=5Fopregion=5Fvbt=5Fpresent=28=29_stub_function?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arnd Bergmann" <arnd@kernel.org>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 13 Mar 2024 08:52:33 -0000
Message-ID: <171031995388.715418.14282873821545198234@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240313084735.3305424-1-arnd@kernel.org>
In-Reply-To: <20240313084735.3305424-1-arnd@kernel.org>
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

Series: drm/i915: add intel_opregion_vbt_present() stub function
URL   : https://patchwork.freedesktop.org/series/131062/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 66de9026cd45 drm-tip: 2024y-03m-13d-08h-34m-34s UTC integration manifest
=== git am output follows ===
error: patch failed: drivers/gpu/drm/i915/display/intel_opregion.h:120
error: drivers/gpu/drm/i915/display/intel_opregion.h: patch does not apply
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Applying: drm/i915: add intel_opregion_vbt_present() stub function
Patch failed at 0001 drm/i915: add intel_opregion_vbt_present() stub function
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".



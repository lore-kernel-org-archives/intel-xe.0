Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E663C4706F
	for <intel-xe@archiver.kernel.org>; Thu,  4 Jan 2024 04:50:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD61310E38B;
	Thu,  4 Jan 2024 04:50:42 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DA9310E38B;
 Thu,  4 Jan 2024 04:50:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_for_drm/i915/display=3A_?=
 =?utf-8?q?add_support_for_DMC_wakelocks?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Coelho, Luciano" <luciano.coelho@intel.com>
Date: Thu, 04 Jan 2024 04:50:41 -0000
Message-ID: <170434384111.1841.12994180644293923887@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20231228110934.383623-1-luciano.coelho@intel.com>
In-Reply-To: <20231228110934.383623-1-luciano.coelho@intel.com>
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

Series: drm/i915/display: add support for DMC wakelocks
URL   : https://patchwork.freedesktop.org/series/128055/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: 7b3b98d03 drm/xe/xe2: Add workaround 16020183090
=== git am output follows ===
error: patch failed: drivers/gpu/drm/i915/Makefile:294
error: drivers/gpu/drm/i915/Makefile: patch does not apply
hint: Use 'git am --show-current-patch' to see the failed patch
Applying: drm/i915/display: add support for DMC wakelocks
Patch failed at 0001 drm/i915/display: add support for DMC wakelocks
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".



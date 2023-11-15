Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A210C2BB3F
	for <intel-xe@archiver.kernel.org>; Wed, 15 Nov 2023 23:27:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D214510E29F;
	Wed, 15 Nov 2023 23:27:17 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id BBF6410E29F;
 Wed, 15 Nov 2023 23:27:15 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id B67B4AADF5;
 Wed, 15 Nov 2023 23:27:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Takashi Iwai" <tiwai@suse.de>
Date: Wed, 15 Nov 2023 23:27:15 -0000
Message-ID: <170009083574.646.17436719456430251954@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231002193847.7134-1-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20231002193847.7134-1-maarten.lankhorst@linux.intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_f?=
 =?utf-8?q?or_series_starting_with_=5B01/14=5D_Revert_=22sound/soc/sof=3A_?=
 =?utf-8?q?Remove_deferred_probe_for_SOF=22_=28rev4=29?=
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

Series: series starting with [01/14] Revert "sound/soc/sof: Remove deferred probe for SOF" (rev4)
URL   : https://patchwork.freedesktop.org/series/124538/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: eba8bfb1d fixup! drm/xe/display: Implement display support
=== git am output follows ===
error: patch failed: sound/hda/hdac_i915.c:185
error: sound/hda/hdac_i915.c: patch does not apply
error: patch failed: sound/soc/sof/Kconfig:82
error: sound/soc/sof/Kconfig: patch does not apply
error: patch failed: sound/soc/sof/core.c:191
error: sound/soc/sof/core.c: patch does not apply
error: patch failed: sound/soc/sof/intel/hda.c:1165
error: sound/soc/sof/intel/hda.c: patch does not apply
error: patch failed: sound/soc/sof/sof-pci-dev.c:339
error: sound/soc/sof/sof-pci-dev.c: patch does not apply
error: patch failed: sound/soc/sof/sof-priv.h:564
error: sound/soc/sof/sof-priv.h: patch does not apply
hint: Use 'git am --show-current-patch' to see the failed patch
Applying: Revert "sound/soc/sof: Remove deferred probe for SOF"
Patch failed at 0001 Revert "sound/soc/sof: Remove deferred probe for SOF"
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".



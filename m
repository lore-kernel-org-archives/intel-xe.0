Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55DA8C54FB9
	for <intel-xe@archiver.kernel.org>; Thu, 16 Nov 2023 11:30:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EC7B10E5C7;
	Thu, 16 Nov 2023 11:30:58 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 59A4E10E5C7;
 Thu, 16 Nov 2023 11:30:56 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 53071A882E;
 Thu, 16 Nov 2023 11:30:56 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Luca Coelho" <luciano.coelho@intel.com>
Date: Thu, 16 Nov 2023 11:30:56 -0000
Message-ID: <170013425633.3094.13261644022943926878@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231116112700.648963-1-luciano.coelho@intel.com>
In-Reply-To: <20231116112700.648963-1-luciano.coelho@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_f?=
 =?utf-8?q?or_drm/i915=3A_don=27t_use_uncore_spinlock_to_protect_critical_?=
 =?utf-8?q?section_in_vblank?=
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

Series: drm/i915: don't use uncore spinlock to protect critical section in vblank
URL   : https://patchwork.freedesktop.org/series/126517/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: dd0e0baa9 mei/hdcp: Also enable for XE
=== git am output follows ===
error: patch failed: drivers/gpu/drm/i915/display/intel_vblank.c:302
error: drivers/gpu/drm/i915/display/intel_vblank.c: patch does not apply
hint: Use 'git am --show-current-patch' to see the failed patch
Applying: drm/i915: don't use uncore spinlock to protect critical section in vblank
Patch failed at 0001 drm/i915: don't use uncore spinlock to protect critical section in vblank
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".



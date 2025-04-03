Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CA70C3600C
	for <intel-xe@archiver.kernel.org>; Thu,  3 Apr 2025 09:56:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7B5510E990;
	Thu,  3 Apr 2025 09:56:48 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D451A10E990;
 Thu,  3 Apr 2025 09:56:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_LOBF_enablement_fix_?=
 =?utf-8?q?=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Animesh Manna" <animesh.manna@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 03 Apr 2025 09:56:47 -0000
Message-ID: <174367420786.32001.753779186333292206@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250403092825.484347-1-animesh.manna@intel.com>
In-Reply-To: <20250403092825.484347-1-animesh.manna@intel.com>
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

Series: LOBF enablement fix (rev6)
URL   : https://patchwork.freedesktop.org/series/142278/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 135e2838ed7d drm-tip: 2025y-04m-03d-06h-13m-02s UTC integration manifest
=== git am output follows ===
Applying: drm/i915/lobf: Add lobf enablement in post plane update
Applying: drm/i915/lobf: Add debug print for LOBF
Applying: drm/i915/lobf: Disintegrate alpm_disable from psr_disable
Applying: drm/i915/lobf: Add fixed refresh rate check in compute_config()
Applying: drm/i915/lobf: Update lobf if any change in dependent parameters
Applying: drm/i915/lobf: Add debug interface for lobf
Applying: drm/i915/lobf: Add mutex for alpm update
Applying: drm/i915/lobf: Check for sink error and disable LOBF



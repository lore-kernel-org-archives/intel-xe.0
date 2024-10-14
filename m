Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 830B4D16243
	for <intel-xe@archiver.kernel.org>; Mon, 14 Oct 2024 11:19:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A01710E290;
	Mon, 14 Oct 2024 11:19:21 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C90A610E433;
 Mon, 14 Oct 2024 11:19:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_for_Introduce_drm_sharpn?=
 =?utf-8?q?ess_property?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nemesa Garg" <nemesa.garg@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 14 Oct 2024 11:19:20 -0000
Message-ID: <172890476081.1248107.508755732343957905@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241014111442.95530-1-nemesa.garg@intel.com>
In-Reply-To: <20241014111442.95530-1-nemesa.garg@intel.com>
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

Series: Introduce drm sharpness property
URL   : https://patchwork.freedesktop.org/series/139954/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 55d09c71b082 drm-tip: 2024y-10m-14d-09h-06m-35s UTC integration manifest
=== git am output follows ===
.git/rebase-apply/patch:212: new blank line at EOF.
+
error: patch failed: drivers/gpu/drm/i915/display/intel_display_types.h:1036
error: drivers/gpu/drm/i915/display/intel_display_types.h: patch does not apply
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Applying: drm: Introduce sharpness strength property
Applying: drm/i915/display: Compute the scaler filter coefficients
Patch failed at 0002 drm/i915/display: Compute the scaler filter coefficients
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".



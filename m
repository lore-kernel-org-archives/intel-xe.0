Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B374E7734B
	for <intel-xe@archiver.kernel.org>; Fri, 29 Sep 2023 23:07:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C060010E0F7;
	Fri, 29 Sep 2023 23:07:39 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4C92E10E0F7;
 Fri, 29 Sep 2023 23:07:38 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 4614DAADF1;
 Fri, 29 Sep 2023 23:07:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Date: Fri, 29 Sep 2023 23:07:38 -0000
Message-ID: <169602885826.19499.5229801857173127931@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230929210045.1202987-1-rodrigo.vivi@intel.com>
In-Reply-To: <20230929210045.1202987-1-rodrigo.vivi@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_f?=
 =?utf-8?q?or_FIXME=3A_drm/i915=3A_More_display_ugly_wa_needed_after_rebas?=
 =?utf-8?q?e?=
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

Series: FIXME: drm/i915: More display ugly wa needed after rebase
URL   : https://patchwork.freedesktop.org/series/124475/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: 22fcf2404 drm/xe: timeout needs to be a signed value
=== git am output follows ===
error: patch failed: drivers/gpu/drm/i915/display/intel_fb.c:1939
error: drivers/gpu/drm/i915/display/intel_fb.c: patch does not apply
error: patch failed: drivers/gpu/drm/i915/display/intel_frontbuffer.c:208
error: drivers/gpu/drm/i915/display/intel_frontbuffer.c: patch does not apply
hint: Use 'git am --show-current-patch' to see the failed patch
Applying: FIXME: drm/i915: More display ugly wa needed after rebase
Patch failed at 0001 FIXME: drm/i915: More display ugly wa needed after rebase
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".



Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D80DBE7849A
	for <intel-xe@archiver.kernel.org>; Mon,  2 Oct 2023 09:18:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A2BA10E26C;
	Mon,  2 Oct 2023 09:18:12 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 17F0F10E26D;
 Mon,  2 Oct 2023 09:18:10 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id ECABDAADDD;
 Mon,  2 Oct 2023 09:18:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>
Date: Mon, 02 Oct 2023 09:18:09 -0000
Message-ID: <169623828993.3204.13032195924862120927@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231002091542.3696656-1-jouni.hogander@intel.com>
In-Reply-To: <20231002091542.3696656-1-jouni.hogander@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_f?=
 =?utf-8?q?or_Frontbuffer_tracking_and_dirtyfb_=28rev2=29?=
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

Series: Frontbuffer tracking and dirtyfb (rev2)
URL   : https://patchwork.freedesktop.org/series/123751/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: 22fcf2404 drm/xe: timeout needs to be a signed value
=== git am output follows ===
error: patch failed: drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object_frontbuffer.h:8
error: drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object_frontbuffer.h: patch does not apply
hint: Use 'git am --show-current-patch' to see the failed patch
Applying: fixup! drm/xe: Add empty def for i915_gem_object_flush_if_display
Patch failed at 0001 fixup! drm/xe: Add empty def for i915_gem_object_flush_if_display
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".



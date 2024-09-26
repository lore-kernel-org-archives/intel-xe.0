Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 659EBCDE01B
	for <intel-xe@archiver.kernel.org>; Thu, 26 Sep 2024 16:01:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E3CA10EB7E;
	Thu, 26 Sep 2024 16:01:12 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9B1810EB78;
 Thu, 26 Sep 2024 16:01:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_for_drm=3A_Add_check_for?=
 =?utf-8?q?_encoder_in_intel=5Fget=5Fcrtc=5Fnew=5Fencoder=28=29_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "George Rurikov" <g.ryurikov@securitycode.ru>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 26 Sep 2024 16:01:10 -0000
Message-ID: <172736647095.1107975.10426800379129514212@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240924104722.1049588-1-g.ryurikov@securitycode.ru>
In-Reply-To: <20240924104722.1049588-1-g.ryurikov@securitycode.ru>
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

Series: drm: Add check for encoder in intel_get_crtc_new_encoder() (rev3)
URL   : https://patchwork.freedesktop.org/series/139111/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: ec87b409d3a9 drm-tip: 2024y-09m-26d-13h-48m-52s UTC integration manifest
=== git am output follows ===
error: patch failed: drivers/gpu/drm/i915/display/intel_display.c:819
error: drivers/gpu/drm/i915/display/intel_display.c: patch does not apply
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Applying: drm: Add check for encoder in intel_get_crtc_new_encoder()
Patch failed at 0001 drm: Add check for encoder in intel_get_crtc_new_encoder()
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".



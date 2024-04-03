Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A024CD1288
	for <intel-xe@archiver.kernel.org>; Wed,  3 Apr 2024 13:40:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 187C21126FF;
	Wed,  3 Apr 2024 13:40:25 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07E8E1126FF;
 Wed,  3 Apr 2024 13:40:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_for_drm/xe=3A_Fix_bo_lea?=
 =?utf-8?q?k_in_intel=5Ffb=5Fbo=5Fframebuffer=5Finit_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 03 Apr 2024 13:40:24 -0000
Message-ID: <171215162403.1172471.9337305360254100320@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240403133418.42870-1-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20240403133418.42870-1-maarten.lankhorst@linux.intel.com>
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

Series: drm/xe: Fix bo leak in intel_fb_bo_framebuffer_init (rev2)
URL   : https://patchwork.freedesktop.org/series/131429/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 23e6199ddb93 drm-tip: 2024y-04m-03d-07h-14m-06s UTC integration manifest
=== git am output follows ===
error: patch failed: drivers/gpu/drm/xe/display/intel_fb_bo.c:31
error: drivers/gpu/drm/xe/display/intel_fb_bo.c: patch does not apply
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Applying: drm/xe: Fix bo leak in intel_fb_bo_framebuffer_init
Patch failed at 0001 drm/xe: Fix bo leak in intel_fb_bo_framebuffer_init
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".



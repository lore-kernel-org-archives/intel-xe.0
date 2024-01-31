Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 260AFC47258
	for <intel-xe@archiver.kernel.org>; Wed, 31 Jan 2024 15:26:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0D4610EC22;
	Wed, 31 Jan 2024 15:26:57 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4504A10EC22;
 Wed, 31 Jan 2024 15:26:56 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_for_drm/xe/display=3A_Fi?=
 =?utf-8?q?x_memleak_in_display_initialization_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "wangxiaoming321" <xiaoming.wang@intel.com>
Date: Wed, 31 Jan 2024 15:26:56 -0000
Message-ID: <170671481628.878358.7369138650374907269@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <y>
In-Reply-To: <y>
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

Series: drm/xe/display: Fix memleak in display initialization (rev4)
URL   : https://patchwork.freedesktop.org/series/129150/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 275cb3d81 drm-tip: 2024y-01m-31d-14h-25m-12s UTC integration manifest
=== git am output follows ===
error: drivers/gpu/drm/xe/xe_display.c: does not exist in index
hint: Use 'git am --show-current-patch' to see the failed patch
Applying: drm/xe/display: Fix memleak in display initialization
Patch failed at 0001 drm/xe/display: Fix memleak in display initialization
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".



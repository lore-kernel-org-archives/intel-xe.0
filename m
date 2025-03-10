Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D51D1C35FF5
	for <intel-xe@archiver.kernel.org>; Mon, 10 Mar 2025 12:16:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94B4B10E412;
	Mon, 10 Mar 2025 12:16:59 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 361B610E412;
 Mon, 10 Mar 2025 12:16:58 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_for_Plane_Color_Pipeline?=
 =?utf-8?q?_support_for_Intel_platforms_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Uma Shankar" <uma.shankar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 10 Mar 2025 12:16:58 -0000
Message-ID: <174160901821.13307.14706574193857043334@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <20250305132608.2379253-1-uma.shankar@intel.com>
In-Reply-To: <20250305132608.2379253-1-uma.shankar@intel.com>
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

Series: Plane Color Pipeline support for Intel platforms (rev2)
URL   : https://patchwork.freedesktop.org/series/141788/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 0457c65354c6 drm-tip: 2025y-03m-10d-09h-55m-22s UTC integration manifest
=== git am output follows ===
error: patch failed: drivers/gpu/drm/vkms/Kconfig:14
error: drivers/gpu/drm/vkms/Kconfig: patch does not apply
error: patch failed: drivers/gpu/drm/vkms/Makefile:6
error: drivers/gpu/drm/vkms/Makefile: patch does not apply
error: drivers/gpu/drm/vkms/tests/.kunitconfig: already exists in index
error: drivers/gpu/drm/vkms/tests/Makefile: already exists in index
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Applying: drm: color pipeline base work
Patch failed at 0001 drm: color pipeline base work
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".



Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1DCAC3ABAA
	for <intel-xe@archiver.kernel.org>; Mon,  5 May 2025 06:02:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E5CF10E27D;
	Mon,  5 May 2025 06:02:43 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3699610E27D;
 Mon,  5 May 2025 06:02:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_for_drm/xe=3A_Introduce_?=
 =?utf-8?q?xe=5Fpm=5Fsysfs=2Ec?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Raag Jadav" <raag.jadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 05 May 2025 06:02:42 -0000
Message-ID: <174642496221.43946.17650985137471541428@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250505053716.3360242-1-raag.jadav@intel.com>
In-Reply-To: <20250505053716.3360242-1-raag.jadav@intel.com>
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

Series: drm/xe: Introduce xe_pm_sysfs.c
URL   : https://patchwork.freedesktop.org/series/148592/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 4873543d1d3b drm-tip: 2025y-05m-05d-05h-35m-31s UTC integration manifest
=== git am output follows ===
error: patch failed: drivers/gpu/drm/xe/xe_device_sysfs.c:3
error: drivers/gpu/drm/xe/xe_device_sysfs.c: patch does not apply
error: patch failed: drivers/gpu/drm/xe/xe_device_sysfs.h:8
error: drivers/gpu/drm/xe/xe_device_sysfs.h: patch does not apply
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Applying: drm/xe: Introduce xe_pm_sysfs.c
Patch failed at 0001 drm/xe: Introduce xe_pm_sysfs.c
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".



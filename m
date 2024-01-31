Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E872C48285
	for <intel-xe@archiver.kernel.org>; Wed, 31 Jan 2024 05:02:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46E5C10E4B2;
	Wed, 31 Jan 2024 05:02:35 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 200C510E4B2;
 Wed, 31 Jan 2024 05:02:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_for_series_starting_with?=
 =?utf-8?q?_=5B1/2=5D_drm/xe=3A_Convert_xe=5Fdevice=5Fsnapshot_to_a_standalo?=
 =?utf-8?q?ne_snapshot?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Date: Wed, 31 Jan 2024 05:02:34 -0000
Message-ID: <170667735413.860541.2791750439442202312@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240130223709.50881-1-rodrigo.vivi@intel.com>
In-Reply-To: <20240130223709.50881-1-rodrigo.vivi@intel.com>
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

Series: series starting with [1/2] drm/xe: Convert xe_device_snapshot to a standalone snapshot
URL   : https://patchwork.freedesktop.org/series/129345/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 3d244fce9 drm-tip: 2024y-01m-30d-19h-55m-23s UTC integration manifest
=== git am output follows ===
error: patch failed: drivers/gpu/drm/xe/xe_devcoredump.c:114
error: drivers/gpu/drm/xe/xe_devcoredump.c: patch does not apply
error: patch failed: drivers/gpu/drm/xe/xe_device.c:728
error: drivers/gpu/drm/xe/xe_device.c: patch does not apply
error: patch failed: drivers/gpu/drm/xe/xe_device.h:175
error: drivers/gpu/drm/xe/xe_device.h: patch does not apply
hint: Use 'git am --show-current-patch' to see the failed patch
Applying: drm/xe: Convert xe_device_snapshot to a standalone snapshot
Patch failed at 0001 drm/xe: Convert xe_device_snapshot to a standalone snapshot
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".



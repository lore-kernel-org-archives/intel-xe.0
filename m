Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D44FD3A697
	for <intel-xe@archiver.kernel.org>; Tue, 29 Oct 2024 20:02:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D044A10E046;
	Tue, 29 Oct 2024 20:02:45 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AD3B10E046;
 Tue, 29 Oct 2024 20:02:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_for_drm/xe=3A_Fix_races_?=
 =?utf-8?q?on_fdinfo_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 29 Oct 2024 20:02:44 -0000
Message-ID: <173023216462.1361174.15249331204469808628@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241026170952.94670-2-lucas.demarchi@intel.com>
In-Reply-To: <20241026170952.94670-2-lucas.demarchi@intel.com>
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

Series: drm/xe: Fix races on fdinfo (rev2)
URL   : https://patchwork.freedesktop.org/series/140544/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 91b5d7af697c drm-tip: 2024y-10m-29d-19h-53m-36s UTC integration manifest
=== git am output follows ===
error: patch failed: drivers/gpu/drm/xe/xe_device_types.h:614
error: drivers/gpu/drm/xe/xe_device_types.h: patch does not apply
error: patch failed: drivers/gpu/drm/xe/xe_drm_client.c:327
error: drivers/gpu/drm/xe/xe_drm_client.c: patch does not apply
error: patch failed: drivers/gpu/drm/xe/xe_exec_queue.c:262
error: drivers/gpu/drm/xe/xe_exec_queue.c: patch does not apply
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Applying: drm/xe: Add trace to lrc timestamp update
Applying: drm/xe: Accumulate exec queue timestamp on destroy
Patch failed at 0002 drm/xe: Accumulate exec queue timestamp on destroy
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".



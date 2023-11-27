Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A578C07E97
	for <intel-xe@archiver.kernel.org>; Mon, 27 Nov 2023 16:20:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC7B810E39B;
	Mon, 27 Nov 2023 16:20:53 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3F54010E39B;
 Mon, 27 Nov 2023 16:20:51 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 37417A03D2;
 Mon, 27 Nov 2023 16:20:51 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bert Karwatzki" <spasswolf@web.de>
Date: Mon, 27 Nov 2023 16:20:51 -0000
Message-ID: <170110205119.3004.7071401537922165139@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: 6273fadf-267a-4965-82ab-89c5b3f28cf2@gmail.com
In-Reply-To: 6273fadf-267a-4965-82ab-89c5b3f28cf2@gmail.com
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_f?=
 =?utf-8?q?or_Revert_=22drm/sched=3A_Qualify_drm=5Fsched=5Fwakeup=28=29_by?=
 =?utf-8?b?IGRybV9zY2hlZF9lbnRpdHlfaXNfcmVhZHkoKSI=?=
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

Series: Revert "drm/sched: Qualify drm_sched_wakeup() by drm_sched_entity_is_ready()"
URL   : https://patchwork.freedesktop.org/series/126921/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: 7c4b213b5 drm/xe: Internally change the compute_mode and no_dma_fence mode naming
=== git am output follows ===
error: patch failed: drivers/gpu/drm/scheduler/sched_main.c:1029
error: drivers/gpu/drm/scheduler/sched_main.c: patch does not apply
hint: Use 'git am --show-current-patch' to see the failed patch
Applying: Revert "drm/sched: Qualify drm_sched_wakeup() by drm_sched_entity_is_ready()"
Patch failed at 0001 Revert "drm/sched: Qualify drm_sched_wakeup() by drm_sched_entity_is_ready()"
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".



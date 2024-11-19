Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AA68D6C2B6
	for <intel-xe@archiver.kernel.org>; Tue, 19 Nov 2024 22:59:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DA1210E37A;
	Tue, 19 Nov 2024 22:59:41 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAFF910E0D3;
 Tue, 19 Nov 2024 22:59:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_for_drm/xe=3A_Add_suppor?=
 =?utf-8?q?t_for_G2G_communication_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: john.c.harrison@intel.com
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 19 Nov 2024 22:59:39 -0000
Message-ID: <173205717976.487737.5475279362621192110@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241119225421.198838-1-John.C.Harrison@Intel.com>
In-Reply-To: <20241119225421.198838-1-John.C.Harrison@Intel.com>
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

Series: drm/xe: Add support for G2G communication (rev2)
URL   : https://patchwork.freedesktop.org/series/141119/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: ccf64319402f drm-tip: 2024y-11m-19d-20h-57m-02s UTC integration manifest
=== git am output follows ===
error: patch failed: drivers/gpu/drm/xe/xe_bo_types.h:13
error: drivers/gpu/drm/xe/xe_bo_types.h: patch does not apply
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Applying: drm/xe: Allow bo mapping on multiple ggtts
Patch failed at 0001 drm/xe: Allow bo mapping on multiple ggtts
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".



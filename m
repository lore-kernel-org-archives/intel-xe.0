Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6214FC2BB3F
	for <intel-xe@archiver.kernel.org>; Sat, 18 Nov 2023 06:24:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A0FB10E027;
	Sat, 18 Nov 2023 06:24:29 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 73D8710E027;
 Sat, 18 Nov 2023 06:24:28 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 6458AAA915;
 Sat, 18 Nov 2023 06:24:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Date: Sat, 18 Nov 2023 06:24:28 -0000
Message-ID: <170028866838.12897.16696006303071932230@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231116194047.214330-1-matthew.brost@intel.com>
In-Reply-To: <20231116194047.214330-1-matthew.brost@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_f?=
 =?utf-8?q?or_Allow_num=5Fbinds/num=5Fbatch=5Fbuffer_to_be_zero_IOCTLs?=
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

Series: Allow num_binds/num_batch_buffer to be zero IOCTLs
URL   : https://patchwork.freedesktop.org/series/126546/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: cb9b702d4 drm/xe/dg2: Wa_18028616096 now applies to all DG2
=== git am output follows ===
error: patch failed: drivers/gpu/drm/xe/xe_sync.c:118
error: drivers/gpu/drm/xe/xe_sync.c: patch does not apply
hint: Use 'git am --show-current-patch' to see the failed patch
Applying: drm/xe: Allow num_binds == 0 in VM bind IOCTL
Applying: drm/xe: Use a flags field instead of bools for VMA create
Applying: drm/xe: Use a flags field instead of bools for sync parse
Patch failed at 0003 drm/xe: Use a flags field instead of bools for sync parse
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".



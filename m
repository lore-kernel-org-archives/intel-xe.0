Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C224C48BF6
	for <intel-xe@archiver.kernel.org>; Wed, 21 Feb 2024 13:37:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5876410E746;
	Wed, 21 Feb 2024 13:37:50 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26BFC10E748;
 Wed, 21 Feb 2024 13:37:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_series_starting_with?=
 =?utf-8?q?_=5Bv5=2C1/9=5D_drm/xe/snapshot=3A_Remove_drm=5Ferr_on_guc_alloc_?=
 =?utf-8?q?failures?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 21 Feb 2024 13:37:49 -0000
Message-ID: <170852266915.178729.12279997185098327150@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240221133024.898315-1-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20240221133024.898315-1-maarten.lankhorst@linux.intel.com>
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

Series: series starting with [v5,1/9] drm/xe/snapshot: Remove drm_err on guc alloc failures
URL   : https://patchwork.freedesktop.org/series/130203/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: e520d7c9e873 drm-tip: 2024y-02m-21d-13h-09m-08s UTC integration manifest
=== git am output follows ===
.git/rebase-apply/patch:119: new blank line at EOF.
+
warning: 1 line adds whitespace errors.
Applying: drm/xe/snapshot: Remove drm_err on guc alloc failures
Applying: drm/xe: Clear all snapshot members after deleting coredump
Applying: drm/xe: Add uapi for dumpable bos
Applying: drm/xe: Annotate each dumpable vma as such
Applying: drm/xe: Add vm snapshot mutex for easily taking a vm snapshot during devcoredump
Applying: drm/xe: Implement VM snapshot support for BO's and userptr
Applying: drm/xe: Move lrc snapshot capturing to xe_lrc.c
Applying: drm/xe: Add infrastructure for delayed LRC capture
Applying: drm/xe: Implement capture of HWSP and HWCTX



Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E448DC10F16
	for <intel-xe@archiver.kernel.org>; Mon,  6 May 2024 12:17:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F6E910E204;
	Mon,  6 May 2024 12:17:32 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A823010E204;
 Mon,  6 May 2024 12:17:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_for_lib/intel=5Fctx=3A_P?=
 =?utf-8?q?ropagate_error_from_=5F=5Fintel=5Fctx=5Fxe=5Fexec_wait_timeout?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 06 May 2024 12:17:30 -0000
Message-ID: <171499785068.1939724.11272443205829715010@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240506120827.5799-1-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20240506120827.5799-1-maarten.lankhorst@linux.intel.com>
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

Series: lib/intel_ctx: Propagate error from __intel_ctx_xe_exec wait timeout
URL   : https://patchwork.freedesktop.org/series/133229/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 5a43da669cdb drm-tip: 2024y-05m-06d-08h-26m-33s UTC integration manifest
=== git am output follows ===
error: lib/intel_ctx.c: does not exist in index
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Applying: lib/intel_ctx: Propagate error from __intel_ctx_xe_exec wait timeout
Patch failed at 0001 lib/intel_ctx: Propagate error from __intel_ctx_xe_exec wait timeout
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".



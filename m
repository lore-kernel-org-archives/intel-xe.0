Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04DCAC54798
	for <intel-xe@archiver.kernel.org>; Fri, 23 Feb 2024 17:59:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B907D10E0FC;
	Fri, 23 Feb 2024 17:59:50 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C8C610E0E9;
 Fri, 23 Feb 2024 17:59:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_for_tracing/treewide=3A_?=
 =?utf-8?q?Remove_second_parameter_of_=5F=5Fassign=5Fstr=28=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Steven Rostedt" <rostedt@goodmis.org>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 23 Feb 2024 17:59:49 -0000
Message-ID: <170871118918.264276.5106241799560189903@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240223125634.2888c973@gandalf.local.home>
In-Reply-To: <20240223125634.2888c973@gandalf.local.home>
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

Series: tracing/treewide: Remove second parameter of __assign_str()
URL   : https://patchwork.freedesktop.org/series/130321/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: aed3f498154b drm-tip: 2024y-02m-23d-16h-07m-35s UTC integration manifest
=== git am output follows ===
error: patch failed: drivers/gpu/drm/i915/display/intel_display_trace.h:410
error: drivers/gpu/drm/i915/display/intel_display_trace.h: patch does not apply
error: patch failed: include/trace/events/sunrpc.h:1335
error: include/trace/events/sunrpc.h: patch does not apply
error: patch failed: include/trace/stages/stage6_event_callback.h:31
error: include/trace/stages/stage6_event_callback.h: patch does not apply
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Applying: tracing/treewide: Remove second parameter of __assign_str()
Patch failed at 0001 tracing/treewide: Remove second parameter of __assign_str()
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".



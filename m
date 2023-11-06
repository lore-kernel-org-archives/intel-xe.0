Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8207C4332F
	for <intel-xe@archiver.kernel.org>; Mon,  6 Nov 2023 11:25:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F7D510E2CB;
	Mon,  6 Nov 2023 11:25:27 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 70D9B10E2CB;
 Mon,  6 Nov 2023 11:25:26 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 6B314A0078;
 Mon,  6 Nov 2023 11:25:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mika Kuoppala" <mika.kuoppala@linux.intel.com>
Date: Mon, 06 Nov 2023 11:25:26 -0000
Message-ID: <169926992640.20425.12415323943825433379@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231106111845.2333093-1-mika.kuoppala@linux.intel.com>
In-Reply-To: <20231106111845.2333093-1-mika.kuoppala@linux.intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_f?=
 =?utf-8?q?or_xe-eudebug=3A_GPU_debugging_interface?=
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

Series: xe-eudebug: GPU debugging interface
URL   : https://patchwork.freedesktop.org/series/126019/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: fc457bcc1 Revert "FIXME: drm/i915/crtc: use irqsave for locking event_lock"
=== git am output follows ===
.git/rebase-apply/patch:68: trailing whitespace.
	
warning: 1 line adds whitespace errors.
.git/rebase-apply/patch:349: new blank line at EOF.
+
warning: 1 line adds whitespace errors.
Applying: drm/xe/eudebug: Introduce eudebug support
Applying: drm/xe/eudebug: Introduce discovery for resources
Applying: drm/xe/eudebug: Introduce exec_queue events
Applying: drm/xe/eudebug: hw enablement for eudebug
Applying: drm/xe: define XE_MAX_[DSS|EU]_FUSE_BITS globally
Applying: drm/xe: Introduce for_each_dss_steering loop
Applying: drm/xe: Export xe_hw_engine's mmio accessors
Applying: drm/xe: Add runalone engine property
Applying: drm/xe/eudebug: Introduce per device attention scan worker
Applying: drm/xe: Move and export xe_hw_engine lookup.
Applying: drm/xe/eudebug: Introduce EU control interface
Applying: drm/xe: Extend drm_xe_vm_bind_op
Applying: drm/xe/eudebug: uapi for client to debugger metadata (work in progress)
Applying: drm/xe/eudebug: Create/destroy user metadata
Applying: drm/xe/eudebug: Set vm metadata
Applying: drm/xe/eudebug: User coredump support
Applying: drm/xe/eudebug: Add per process coredumps
Applying: drm/xe: Debug metadata create/destroy ioctls
Applying: xe/drm: Include debug_metadata in usercoredump
Applying: drm/xe: Set vm debug metadata
Applying: drm/xe/: Include attention in usercapture.
Applying: RFC: xe/drm: attach debug metadata to vma
Applying: drm/xe: Capture metadata attached to vma
Applying: drm/xe/xe_eudebug: Add vm bind events w/o acking
Applying: drm/xe/eudebug: vm open/pread/pwrite



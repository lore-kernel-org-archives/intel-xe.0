Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98A54C3DA49
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jul 2024 14:32:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 645B710E03E;
	Fri, 26 Jul 2024 14:32:30 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8391F10E03E;
 Fri, 26 Jul 2024 14:32:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_GPU_debug_support_?=
 =?utf-8?q?=28eudebug=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mika Kuoppala" <mika.kuoppala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 26 Jul 2024 14:32:28 -0000
Message-ID: <172200434852.386405.1958192701121078323@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240726140818.54304-1-mika.kuoppala@linux.intel.com>
In-Reply-To: <20240726140818.54304-1-mika.kuoppala@linux.intel.com>
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

Series: GPU debug support (eudebug)
URL   : https://patchwork.freedesktop.org/series/136572/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 220554a8ef7a drm-tip: 2024y-07m-26d-13h-05m-21s UTC integration manifest
=== git am output follows ===
Applying: drm/xe: Export xe_hw_engine's mmio accessors
Applying: drm/xe: Move and export xe_hw_engine lookup.
Applying: drm/xe/eudebug: Introduce eudebug support
Applying: kernel: export ptrace_may_access
Applying: drm/xe/eudebug: Use ptrace_may_access for xe_eudebug_attach
Applying: drm/xe/eudebug: Introduce discovery for resources
Applying: drm/xe/eudebug: Introduce exec_queue events
Applying: drm/xe/eudebug: hw enablement for eudebug
Applying: drm/xe: Add EUDEBUG_ENABLE exec queue property
Applying: drm/xe/eudebug: Introduce per device attention scan worker
Applying: drm/xe/eudebug: Introduce EU control interface
Applying: drm/xe/eudebug: Add vm bind and vm bind ops
Applying: drm/xe/eudebug: Add UFENCE events with acks
Applying: drm/xe/eudebug: vm open/pread/pwrite
Applying: drm/xe/eudebug: implement userptr_vma access
Applying: drm/xe: Debug metadata create/destroy ioctls
Applying: drm/xe: Attach debug metadata to vma
Applying: drm/xe/eudebug: Add debug metadata support for xe_eudebug
Applying: drm/xe/eudebug: Implement vm_bind_op discovery
Applying: drm/xe/eudebug: Dynamically toggle debugger functionality
Applying: drm/xe/eudebug_test: Introduce xe_eudebug wa kunit test



Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA2C2D0E6D8
	for <intel-xe@archiver.kernel.org>; Mon, 21 Oct 2024 10:07:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FAD110E035;
	Mon, 21 Oct 2024 10:07:23 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A707310E035;
 Mon, 21 Oct 2024 10:07:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_Support_EU_online_de?=
 =?utf-8?q?bug_on_pagefault?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gwan-gyeong Mun" <gwan-gyeong.mun@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 21 Oct 2024 10:07:21 -0000
Message-ID: <172950524167.1304206.7605016412765814738@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241021095904.439555-1-gwan-gyeong.mun@intel.com>
In-Reply-To: <20241021095904.439555-1-gwan-gyeong.mun@intel.com>
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

Series: Support EU online debug on pagefault
URL   : https://patchwork.freedesktop.org/series/140239/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 784111a40e40 drm-tip: 2024y-10m-21d-08h-47m-21s UTC integration manifest
=== git am output follows ===
Applying: ptrace: export ptrace_may_access
Applying: drm/xe/eudebug: Introduce eudebug support
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
Applying: drm/xe/eudebug: Support EU online debug on pagefault



Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF147C3DA4A
	for <intel-xe@archiver.kernel.org>; Mon, 12 Aug 2024 02:51:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA8E410E074;
	Mon, 12 Aug 2024 02:51:55 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52E2110E074;
 Mon, 12 Aug 2024 02:51:54 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_ULLS_for_kernel_subm?=
 =?utf-8?q?ission_of_migration_jobs?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 12 Aug 2024 02:51:54 -0000
Message-ID: <172343111433.593178.2294894211656709520@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240812024717.3584636-1-matthew.brost@intel.com>
In-Reply-To: <20240812024717.3584636-1-matthew.brost@intel.com>
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

Series: ULLS for kernel submission of migration jobs
URL   : https://patchwork.freedesktop.org/series/137128/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: a95e3e46063d drm-tip: 2024y-08m-10d-04h-20m-54s UTC integration manifest
=== git am output follows ===
Applying: drm/xe: Add xe_hw_engine_write_ring_tail
Applying: drm/xe: Add ULLS support to LRC
Applying: drm/xe: Add ULLS flags for jobs
Applying: drm/xe: Add ULLS migration job support to migration layer
Applying: drm/xe: Add MI_SEMAPHORE_WAIT instruction defs
Applying: drm/xe: Add ULLS migration job support to ring ops
Applying: drm/xe: Add ULLS migration job support to GuC submission
Applying: drm/xe: Enable ULLS migration jobs when opening LR VM



Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECAC8C5B543
	for <intel-xe@archiver.kernel.org>; Thu,  5 Jun 2025 22:30:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A145110E314;
	Thu,  5 Jun 2025 22:30:46 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C63B10E314;
 Thu,  5 Jun 2025 22:30:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_CPU_binds_and_ULLS_o?=
 =?utf-8?q?n_migration_queue?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 05 Jun 2025 22:30:45 -0000
Message-ID: <174916264504.53928.3778429226243661589@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250605153223.2789122-1-matthew.brost@intel.com>
In-Reply-To: <20250605153223.2789122-1-matthew.brost@intel.com>
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

Series: CPU binds and ULLS on migration queue
URL   : https://patchwork.freedesktop.org/series/149888/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 832a676ed689 drm-tip: 2025y-06m-05d-18h-32m-30s UTC integration manifest
=== git am output follows ===
Applying: drm/xe: Drop struct xe_migrate_pt_update argument from populate / clear vfuns
Applying: drm/xe: Add __xe_migrate_update_pgtables_cpu helper
Applying: drm/xe: CPU binds for jobs
Applying: drm/xe: Remove unused arguments from xe_migrate_pt_update_ops
Applying: drm/xe: Don't use migrate exec queue for page fault binds
Applying: drm/xe: Add xe_hw_engine_write_ring_tail
Applying: drm/xe: Add ULLS support to LRC
Applying: drm/xe: Add ULLS migration job support to migration layer
Applying: drm/xe: Add MI_SEMAPHORE_WAIT instruction defs
Applying: drm/xe: Add ULLS migration job support to ring ops
Applying: drm/xe: Add ULLS migration job support to GuC submission
Applying: drm/xe: Enable ULLS migration jobs when opening LR VM
Applying: drm/xe: Set slpc freq to max on ULLS jobs
Applying: drm/xe: Add modparam to enable / disable ULLS on migrate queue
Applying: drm/xe: Add modparam to enable / disable high SLPC on migrate queue



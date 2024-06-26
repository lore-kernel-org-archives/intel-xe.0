Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5985C27C4F
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jun 2024 23:28:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C3E610E15F;
	Wed, 26 Jun 2024 23:28:52 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47A0910E15F;
 Wed, 26 Jun 2024 23:28:51 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_Convert_multiple_bin?=
 =?utf-8?q?d_ops_to_1_job_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 26 Jun 2024 23:28:51 -0000
Message-ID: <171944453128.162560.2611411791385965395@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240626211546.4099339-1-matthew.brost@intel.com>
In-Reply-To: <20240626211546.4099339-1-matthew.brost@intel.com>
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

Series: Convert multiple bind ops to 1 job (rev6)
URL   : https://patchwork.freedesktop.org/series/133034/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 6580bd2882ed drm-tip: 2024y-06m-26d-22h-26m-39s UTC integration manifest
=== git am output follows ===
Applying: drm/xe: s/xe_tile_migrate_engine/xe_tile_migrate_exec_queue
Applying: drm/xe: Add xe_vm_pgtable_update_op to xe_vma_ops
Applying: drm/xe: Add xe_exec_queue_last_fence_test_dep
Applying: drm/xe: Convert multiple bind ops into single job
Applying: drm/xe: Update VM trace events
Applying: drm/xe: Update PT layer with better error handling
Applying: drm/xe: Add VM bind IOCTL error injection



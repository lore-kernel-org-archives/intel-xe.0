Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81B20C4345F
	for <intel-xe@archiver.kernel.org>; Mon, 29 Apr 2024 16:52:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 301A610E1AA;
	Mon, 29 Apr 2024 16:52:50 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC6A210E1AA;
 Mon, 29 Apr 2024 16:52:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_Convert_multiple_bin?=
 =?utf-8?q?d_ops_to_1_job?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 29 Apr 2024 16:52:49 -0000
Message-ID: <171440956970.1756580.10538554587126246334@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240429164713.2249950-1-matthew.brost@intel.com>
In-Reply-To: <20240429164713.2249950-1-matthew.brost@intel.com>
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

Series: Convert multiple bind ops to 1 job
URL   : https://patchwork.freedesktop.org/series/133034/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: acf512bb5ff4 drm-tip: 2024y-04m-29d-15h-11m-22s UTC integration manifest
=== git am output follows ===
Applying: drm/xe: s/xe_tile_migrate_engine/xe_tile_migrate_exec_queue
Applying: drm/xe: Add xe_vm_pgtable_update_op to xe_vma_ops
Applying: drm/xe: Convert multiple bind ops into single job
Applying: drm/xe: Update VM trace events
Applying: drm/xe: Update PT layer with better error handling



Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4260AD1713F
	for <intel-xe@archiver.kernel.org>; Mon, 21 Oct 2024 21:39:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F97610E056;
	Mon, 21 Oct 2024 21:39:27 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D106810E056;
 Mon, 21 Oct 2024 21:39:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_Fix_non-contiguous_V?=
 =?utf-8?q?RAM_BO_access_in_Xe_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 21 Oct 2024 21:39:25 -0000
Message-ID: <172954676584.1306617.15913941822066898847@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241021211835.1675640-1-matthew.brost@intel.com>
In-Reply-To: <20241021211835.1675640-1-matthew.brost@intel.com>
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

Series: Fix non-contiguous VRAM BO access in Xe (rev5)
URL   : https://patchwork.freedesktop.org/series/140200/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: aa0898115bcf drm-tip: 2024y-10m-21d-17h-57m-13s UTC integration manifest
=== git am output follows ===
Applying: drm/xe: Add xe_bo_vm_access
Applying: drm/ttm: Add ttm_bo_access
Applying: drm/xe: Add xe_ttm_access_memory
Applying: drm/xe: Take PM ref in delayed snapshot capture worker
Applying: drm/xe: Update xe_ttm_access_memory to use GPU for non-visible access
Applying: drm/xe/display: Update intel_bo_read_from_page to use ttm_bo_access
Applying: drm/xe: Use ttm_bo_access in xe_vm_snapshot_capture_delayed
Applying: drm/xe: Set XE_BO_FLAG_PINNED in migrate selftest BOs
Applying: drm/xe: Only allow contiguous BOs to use xe_bo_vmap


